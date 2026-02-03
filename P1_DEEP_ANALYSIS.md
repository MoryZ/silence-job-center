# P1 修复深度分析：Client-Server API 跨界依赖

## 问题概述

`silence-job-client-core` 导入了 `silence-job-common-server-api` 中的两个DTO：
1. `ConfigDTO` - 在 GroupVersionCache 中被广泛使用
2. `JobLogTaskDTO` - 在 JobLogReport 中使用

这形成了不合理的跨边界依赖：**Client不应该知道Server API的存在**

---

## DTO详细分析

### 1️⃣ ConfigDTO 分析

**定义位置**：`silence-job-common-server-api/src/.../ConfigDTO.java`

**结构**：
```java
public class ConfigDTO {
    private List<Scene> sceneList;        // 场景列表
    private List<Notify> notifyList;      // 通知配置列表
    private Integer version;              // 版本号
    
    static class Scene {
        private String sceneName;
        private long ddl;                 // 截止时间
    }
    
    static class Notify {
        private List<Recipient> recipients;
        private Integer notifyThreshold;
        private RetryNotifyScene retryNotifyScene;
    }
}
```

**用途**：存储从Server同步到Client的全局配置（场景配置、通知配置、版本号等）

**使用量**：
- 在 `client-common` 中：5个地方（GroupVersionCache, SilenceJobCommonEndPoint, SyncRemoteConfig）
- 在 `client-core` 中：2个地方（JobExecutorFutureCallback）
- 在 `client-retry-core` 中：3个地方（AbstractRetryStrategies, SilenceRetryInterceptor等）
- 在 `server-app` 中：1个地方（SyncConfigHandler）
- 在 `server-core` 中：多个地方（AbstractConfigAccess）
- 在 `server-common` 中：多个地方（CommonRpcClient, ConfigVersionSyncHandler）

**关键使用场景**：

1. **GroupVersionCache** - 缓存全局配置
   ```java
   public final class GroupVersionCache {
       private static ConfigDTO CONFIG;  // 缓存Server下发的配置
       
       public static long getDdl(String sceneName) {
           // 查询特定场景的截止时间
           List<ConfigDTO.Scene> sceneList = CONFIG.getSceneList();
           for (ConfigDTO.Scene scene : sceneList) {
               if (scene.getSceneName().equals(sceneName)) {
                   return scene.getDdl();
               }
           }
       }
   }
   ```

2. **JobExecutorFutureCallback** - 执行回调
   ```java
   // 虽然直接导入了ConfigDTO，但实际上只是间接通过GroupVersionCache使用
   // 真实的使用只是获取DDL值
   ```

3. **AbstractRetryStrategies** - 重试策略
   ```java
   ConfigDTO.Notify notify = GroupVersionCache.getRetryNotifyAttribute(...);
   // 获取重试通知配置
   ```

**特点**：
- ✅ 是纯数据容器（DTO）
- ✅ 内容完全由Server生成，Client只读
- ✅ 是Client需要的"配置数据"，不是"Server API"
- ❌ 命名位置错误（放在了 server-api 中，其实应该是通用的）

---

### 2️⃣ JobLogTaskDTO 分析

**定义位置**：`silence-job-common-server-api/src/.../JobLogTaskDTO.java`

**继承链**：
```
JobLogTaskDTO extends LogTaskDTO
    ↓
LogTaskDTO (在 silence-job-common-log 中定义)
```

**结构**：
```java
public class JobLogTaskDTO extends LogTaskDTO {
    private BigInteger jobId;            // 任务ID
    private BigInteger taskBatchId;      // 任务批次ID
    private BigInteger taskId;           // 调度任务ID
}
```

**用途**：将Client端收集的日志上报给Server时的DTO

**使用场景**：

1. **JobLogReport** - 日志上报组件
   ```java
   @Component
   public class JobLogReport extends AbstractLogReport<JobLogTaskDTO> {
       @Override
       protected JobLogTaskDTO buildLogTaskDTO(LogContentDTO logContentDTO) {
           JobLogMeta context = (JobLogMeta) SilenceJobLogManager.getLogMeta();
           JobLogTaskDTO logTaskDTO = new JobLogTaskDTO();
           logTaskDTO.setJobId(context.getJobId());
           logTaskDTO.setTaskId(context.getTaskId());
           // ... 其他属性赋值
           return logTaskDTO;
       }
   }
   ```

2. **Server端接收** - JobLogActor
   ```java
   // 在 server-job-task 中
   List<JobLogTaskDTO> jobLogTasks = (List<JobLogTaskDTO>) list;
   Map<BigInteger, List<JobLogTaskDTO>> logTaskDTOMap = 
       jobLogTasks.stream()
           .collect(Collectors.groupingBy(JobLogTaskDTO::getTaskId, 
                                         Collectors.toList()));
   ```

**特点**：
- ✅ 是纯数据容器（DTO）
- ✅ Client构建 + Server使用
- ✅ 定义位置明确错误（应该在 common-core 或单独的 common-log-api 中）
- ❌ 放在了 server-api 中，造成了Server和Client的不必要耦合

---

## 问题根源分析

### 为什么这两个DTO在 server-api 中？

**假设原因**：
1. 开发初期没有明确的模块分层规划
2. 把"被Server使用的DTO"混淆为"Server API DTO"
3. 没有区分"Server Private API"和"Server Public API"

**应该放在哪里**？

|  DTO  | 所有方 | 应放位置 | 理由 |
|-------|-------|--------|------|
| ConfigDTO | Client读 + Server写 | `common-core` | 通用配置对象，不是API专属 |
| JobLogTaskDTO | Client写 + Server读 | `common-log-api` 或 `common-core` | 日志传输的中间格式，跨Client/Server |

---

## 移动方案设计

### 🎯 目标状态

```
┌─────────────────────────────┐
│  silence-job-common/        │
├─────────────────────────────┤
│ ├─ common-log/             │ (已有)
│ │  └─ LogTaskDTO ✓         │
│ │                          │
│ ├─ common-core/            │ (改进)
│ │  ├─ ConfigDTO (移入)     │ ← 从 server-api 移过来
│ │  ├─ JobLogTaskDTO (移入) │ ← 从 server-api 移过来  
│ │  └─ SystemConstants      │
│ │                          │
│ ├─ common-server-api/      │ (精简后)
│ │  ├─ Server特定的DTO     │ (纯Server使用的)
│ │  └─ Server特定的常量    │
│ │                          │
│ └─ common-client-api/      │ (已有)
│    └─ Client特定的DTO     │
│
```

### 📋 迁移步骤

**步骤1：复制到目标位置**
```
1. ConfigDTO + Scene + Notify + Recipient 复制到 common-core
2. JobLogTaskDTO 复制到 common-core（已经在 common-log 中有LogTaskDTO了）
3. 更新 package 声明
```

**步骤2：更新依赖**
```
变更前：
- client-core → server-api (ConfigDTO, JobLogTaskDTO)
- client-retry-core → server-api (ConfigDTO)

变更后：
- client-core → common-core (ConfigDTO, JobLogTaskDTO) ✓
- client-retry-core → common-core (ConfigDTO) ✓
```

**步骤3：向后兼容**
```java
// 在 server-api 中保留兼容导入，避免破坏现有代码
package com.old.silence.job.common.server.dto;

// 兼容导入 - 供已依赖 server-api 的代码使用
public class ConfigDTO extends com.old.silence.job.common.core.dto.ConfigDTO {
    // 空继承类，仅用于向后兼容
}

public class JobLogTaskDTO extends com.old.silence.job.common.core.dto.JobLogTaskDTO {
    // 空继承类，仅用于向后兼容
}
```

**步骤4：逐步迁移导入**
```
a) client-core：server-api → common-core
b) client-retry-core：server-api → common-core
c) server-app, server-core, server-common：server-api → common-core
d) 删除兼容导入层（6个月后）
```

---

## 影响范围分析

### 需要修改的文件（按优先级）

**优先级 A - 必须改（Client侧）**：
- [ ] `client-core/src/.../JobExecutorFutureCallback.java` - import ConfigDTO
- [ ] `client-core/src/.../JobLogReport.java` - import JobLogTaskDTO
- [ ] `client-retry-core/src/.../AbstractRetryStrategies.java` - import ConfigDTO
- [ ] `client-retry-core/src/.../SilenceRetryInterceptor.java` - import ConfigDTO
- [ ] `client-retry-core/src/.../ReportListener.java` - import ConfigDTO
- [ ] `client-retry-core/src/.../SyncReport.java` - import ConfigDTO

**优先级 B - 应该改（Client Common侧）**：
- [ ] `client-common/src/.../GroupVersionCache.java` - import ConfigDTO
- [ ] `client-common/src/.../SilenceJobCommonEndPoint.java` - import ConfigDTO
- [ ] `client-common/src/.../SyncRemoteConfig.java` - import ConfigDTO

**优先级 C - 改进（Server侧）**：
- [ ] `server-app/src/.../SyncConfigHandler.java` - import ConfigDTO
- [ ] `server-core/src/.../AbstractConfigAccess.java` - import ConfigDTO
- [ ] `server-common/src/.../CommonRpcClient.java` - import ConfigDTO
- [ ] `server-common/src/.../ConfigVersionSyncHandler.java` - import ConfigDTO
- [ ] `server-job-task/src/.../JobLogActor.java` - import JobLogTaskDTO

**修改文件总计**：15个Java文件

### 编译风险评估

| 风险项 | 等级 | 说明 |
|-------|------|------|
| 循环依赖 | 低 | common-core 不依赖任何业务模块 |
| 版本号 | 低 | 都在同一个项目中，版本统一 |
| IDE识别 | 中 | 改完后需要 `mvn clean compile` 重新构建 |
| 运行时 | 低 | 只是改了import，逻辑不变 |

**建议做法**：先在IDE本地改，再运行 `mvn clean install` 验证编译

---

## 验证清单

修改完成后检查：

- [ ] 编译成功：`mvn clean install` 无错误
- [ ] 单元测试：`mvn test` 全部通过（或跳过）
- [ ] 导入检查：搜索 `server-api` 中的 ConfigDTO 和 JobLogTaskDTO，确认无人直接导入
- [ ] 向后兼容：server-api 中的兼容类是否创建
- [ ] 文档更新：CLAUDE.md 中更新迁移说明

---

## 预期收益

1. ✅ **架构清晰**：Client不再依赖Server API
2. ✅ **独立演进**：Client可独立部署和升级
3. ✅ **依赖链简洁**：Client不再拉取gRPC、Pekko等Server依赖
4. ✅ **易于测试**：Client单元测试依赖简化

---

## 下一步行动

确认理解无误后，开始修改：

**阶段1 - 复制DTO**（5分钟）
- 将 ConfigDTO 家族复制到 common-core
- 将 JobLogTaskDTO 复制到 common-core

**阶段2 - 更新导入**（30分钟）
- 修改15个Java文件的import语句

**阶段3 - 验证编译**（10分钟）
- 运行 `mvn clean install`
- 检查是否有其他隐藏的依赖问题

**总时间估计**：45分钟 - 1小时

---

**准备好开始了吗？还是有问题需要深入讨论？**
