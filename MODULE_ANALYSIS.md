# 附录 D：模块拆分合理性分析

## 背景

项目采用了 18 模块的 Maven 多模块结构，分为三个主要组：
- `silence-job-common/` (4个模块) - 共享库
- `silence-job-client/` (4个模块) - 客户端任务执行
- `silence-job-server/` (5个模块) - 服务端任务调度

本分析评估该结构的合理性，识别耦合问题，提出改进方案。

## 核心发现

### 🔴 **问题1：不合理的跨边界依赖（高风险）**

**现象**：`silence-job-client-core` 依赖了 `silence-job-common-server-api`

**具体位置**（2处直接使用）：

1. [JobExecutorFutureCallback.java](silence-job-client/silence-job-client-core/src/main/java/com/old/silence/job/client/core/executor/JobExecutorFutureCallback.java#L27)
   ```java
   import com.old.silence.job.common.server.dto.ConfigDTO;
   ```

2. [JobLogReport.java](silence-job-client/silence-job-client-core/src/main/java/com/old/silence/job/client/core/log/JobLogReport.java#L5)
   ```java
   import com.old.silence.job.common.server.dto.JobLogTaskDTO;
   ```

**根本原因**：
- `ConfigDTO` 应该是通用配置对象，不应该在server-api中
- `JobLogTaskDTO` 是日志上报所需的统一DTO，不应该限定在server-api

**架构影响**：
- ❌ Client无法独立演进（tied to Server API)
- ❌ 打破client/server隔离原则
- ❌ 复杂度：Client必须导入Server依赖链（gRPC, Pekko等）

**解决方案**：
```xml
<!-- 方案：将共享DTO提升到 common-core 或创建 common-dto -->

<!-- 1. 从 common-server-api 移出：ConfigDTO, JobLogTaskDTO -->
<!-- 2. 放入 common-core 或新建 common-dto -->
<!-- 3. 更新 client-core 的 import -->
<!-- 4. 更新 server-api 的 import 兼容性 -->
```

---

### 🔴 **问题2：业务引擎模块库化而非插件化（高风险）**

**现象**：
```
silence-job-server-app 直接依赖业务执行模块
├─ silence-job-server-job-task        (scope=compile)
└─ silence-job-server-retry-task      (scope=compile)
```

**设计问题**：

| 方面 | 当前状态 | 问题 |
|------|--------|------|
| 加载方式 | 作为库依赖 | 无法灰度/金丝雀更新 |
| 版本管理 | 跟随整体版本 | 无法独立版本化 |
| 部署策略 | 必须全量包含 | 无法选择启用哪些引擎 |
| 热更新 | 不支持 | 必须重启应用 |
| 模块复用 | 耦合到server-app | 其他服务无法复用 |

**根本原因**：
- 将"执行引擎"（应该是SPI）当作"业务库"（作为API）
- 在server-starter中只能All-or-Nothing加载

**立即修复方案**：

**阶段1** - 修改scope为provided：
```xml
<!-- silence-job-server-app/pom.xml -->
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-server-job-task</artifactId>
    <scope>provided</scope>  <!-- 改这里 -->
</dependency>
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-server-retry-task</artifactId>
    <scope>provided</scope>  <!-- 改这里 -->
</dependency>
```

**阶段2** - 创建插件框架：
```
silence-job-server/
├── silence-job-server-plugin-api/    (新增)
│   ├─ TaskExecutorPlugin (interface)
│   └─ PluginRegistry
├── silence-job-job-engine/          (重命名)
│   └─ implements TaskExecutorPlugin
├── silence-job-retry-engine/        (重命名)
│   └─ implements TaskExecutorPlugin
└── silence-job-server-starter
    └─ PluginLoader.load()
```

---

### 🟡 **问题3：server-common 职责过于宽泛（中风险）**

**现象**：
```
silence-job-server-common (134个Java文件)
包含的职责过多：
```

| 目录 | 文件数 | 职责 | 归属 |
|------|-------|------|------|
| `client/` | 8 | RPC客户端 | 基础设施层 |
| `dto/` | 33 | 业务DTO | 应用层 |
| `handler/` | 15 | RPC请求处理 | 基础设施层 |
| `schedule/` | 3 | 调度接口 | 应用层 |
| 其他 | 75 | Actor配置、事件、工具 | 混杂 |

**依赖方**（高耦合）：
```
被以下模块依赖：
├─ server-app
├─ server-job-task
├─ server-retry-task
└─ server-starter
```

**问题**：
- 基础设施层（RPC通信）和应用层（DTO、业务逻辑）混杂
- 难以单独测试基础设施逻辑
- 修改DTO时可能影响RPC通信层
- 名称"common"过于笼统，不能明确表达职责

**解决方案**：

拆分为两个模块：

```xml
<!-- 新增：silence-job-server-infrastructure -->
<!-- 职责：RPC通信、分布式框架、基础设施 -->
<modules>
    <module>silence-job-server-common-client</module>    <!-- RPC客户端 -->
    <module>silence-job-server-common-handler</module>   <!-- RPC处理 -->
    <module>silence-job-server-actor-config</module>     <!-- Pekko配置 -->
</modules>

<!-- 保留：silence-job-server-common -->
<!-- 职责：共享DTO、业务工具、常量 -->
<modules>
    <module>silence-job-server-dto</module>              <!-- 业务DTO -->
    <module>silence-job-server-schedule</module>         <!-- 调度接口 -->
</modules>
```

---

## ✅ 改进优先级矩阵

| 优先级 | 问题 | 影响度 | 工作量 | 建议 |
|--------|------|-------|-------|------|
| 🔴 P1 | client → server-api依赖 | 高 | 低 | 立即修复（<2h） |
| 🔴 P2 | job/retry-task库化 | 高 | 中 | 分阶段优化（scope改provided先） |
| 🟡 P3 | server-common过大 | 中 | 高 | 长期重构规划 |
| 🟢 P4 | 模块命名不够清晰 | 低 | 低 | 添加README.md说明文档 |

---

## 🎯 建议行动计划

**第一阶段（本周）** - 修复高风险问题
1. [ ] 识别 ConfigDTO, JobLogTaskDTO 的真实用途
2. [ ] 将这两个DTO移到 `common-core` 或新建 `common-dto`
3. [ ] 更新 client-core 的 import
4. [ ] 运行单元测试验证

**第二阶段（下个月）** - 改进library-to-plugin转换
1. [ ] 为 `job-task` 和 `retry-task` 定义插件接口
2. [ ] 修改server-app中的scope为provided
3. [ ] 在server-starter中实现插件加载机制
4. [ ] 测试插件动态加载

**第三阶段（季度目标）** - 拆分server-common
1. [ ] 创建 `server-infrastructure` 模块
2. [ ] 逐步迁移RPC、Actor相关代码
3. [ ] 建立清晰的基础设施/应用分界
4. [ ] 更新模块文档

---

## 检查清单

在审查模块设计时，确保：

- [ ] 没有跨越client/server边界的依赖
- [ ] 没有循环依赖（可用 `mvn dependency:tree` 验证）
- [ ] 每个模块的职责清晰（能用一句话描述）
- [ ] 模块间通过接口/SPI通信，而非直接类依赖
- [ ] 可选功能实现为插件而非必选库
- [ ] 基础设施和应用层没有混杂

---

**文档版本**: v1.0  
**最后更新**: 2026-02-03  
**维护者**: SilenceJob Team
