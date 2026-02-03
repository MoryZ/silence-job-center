# Phase 1 - common-core 拆分实施计划

## 📋 概述

**目标**: 将 common-core 从单一模块拆分为 4 个子模块，降低其入度从 6 → 1，改善架构

**优先级**: P0 (最高)  
**评分**: 78.75 / 100  
**工作量**: 40h  
**影响模块**: 6 个 (common-server-api, common-client-api, server-core, server-common, client-core, client-retry-core)

---

## 📁 拆分方案

### 当前状态
```
silence-job-common/
└─ silence-job-common-core/  (单一模块，类混杂)
   ├─ DTO (LogTaskDTO, ConfigDTO, JobLogTaskDTO)
   ├─ Util (JsonUtils, CronExpression, SilenceJobFileUtil, 等)
   ├─ Enum (16+ 个枚举类)
   ├─ Context (SilenceSpringContext)
   └─ Generated (gRPC 生成的类, 11 个)
```

### 目标状态
```
silence-job-common/
├─ silence-job-common-model/        (新增)
│  ├─ DTO (LogTaskDTO, ConfigDTO, JobLogTaskDTO, RetryLogTaskDTO)
│  └─ Context (SilenceSpringContext)
│
├─ silence-job-common-util/         (新增)
│  ├─ JsonUtils, StreamUtils, NetUtil, MailUtils, DingDingUtils
│  ├─ SilenceJobFileUtil, EnvironmentUtils
│  └─ CronExpression (公共的 Cron 解析工具)
│
├─ silence-job-common-constant/     (新增)
│  └─ SilenceJobVersion (版本常量)
│
├─ silence-job-common-enum/         (新增)
│  ├─ JobArgsType, SystemModeEnum, RpcType, FailStrategy
│  ├─ TaskGeneratorSceneEnum, MapReduceStage, DelayLevelEnum
│  ├─ BackOff, JobOperationReason, RetryOperationReason
│  ├─ JobNotifyScene, JobNotifyType, ContentType
│  ├─ RetryTaskStatus, RetryResultStatus, JobTaskType, SystemTaskType, TriggerType
│  ├─ DashboardLineEnum
│  └─ (共 16+ 个枚举)
│
└─ silence-job-common-core/         (保留，仅包含 gRPC 生成类)
   └─ gRPC 自动生成的类 (11 个)
```

---

## 📊 分类细节

### 1️⃣ common-model (DTO/Entity/Context)

**位置**: `silence-job-common/silence-job-common-model/`

**文件清单** (5 个):
- `LogTaskDTO.java` (基础日志任务 DTO)
- `JobLogTaskDTO.java` (继承自 LogTaskDTO)
- `ConfigDTO.java` (配置 DTO)
- `RetryLogTaskDTO.java` (重试日志 DTO，继承自 LogTaskDTO)
- `SilenceSpringContext.java` (Spring 上下文工具)

**依赖关系**:
- 无内部依赖（纯数据模型）
- 外部依赖: Spring、Lombok

**入度**: 6 个模块都会依赖这个模块

**pom.xml 需改**:
```xml
<module>silence-job-common-model</module>
```

---

### 2️⃣ common-util (工具类)

**位置**: `silence-job-common/silence-job-common-util/`

**文件清单** (8 个):
- `JsonUtils.java` (JSON 处理)
- `StreamUtils.java` (Stream 流操作)
- `NetUtil.java` (网络工具)
- `SilenceJobFileUtil.java` (文件操作)
- `MailUtils.java` (邮件发送)
- `DingDingUtils.java` (钉钉通知)
- `EnvironmentUtils.java` (环境变量获取)
- `CronExpression.java` (Cron 表达式解析)

**依赖关系**:
- 依赖: common-model (使用 ConfigDTO)
- 依赖: 第三方库 (Apache Commons, Jackson, etc.)

**入度**: 4-5 个模块依赖

**pom.xml 需改**:
```xml
<module>silence-job-common-util</module>
```

---

### 3️⃣ common-constant (常量)

**位置**: `silence-job-common/silence-job-common-constant/`

**文件清单** (1 个):
- `SilenceJobVersion.java` (版本常量)

**依赖关系**:
- 无内部依赖

**入度**: 1-2 个模块依赖

**pom.xml 需改**:
```xml
<module>silence-job-common-constant</module>
```

---

### 4️⃣ common-enum (枚举)

**位置**: `silence-job-common/silence-job-common-enum/`

**文件清单** (16 个):
1. `JobArgsType.java` - 任务参数类型
2. `SystemModeEnum.java` - 系统模式
3. `RpcType.java` - RPC 类型
4. `FailStrategy.java` - 失败策略
5. `TaskGeneratorSceneEnum.java` - 任务生成场景
6. `MapReduceStage.java` - MapReduce 阶段
7. `DelayLevelEnum.java` - 延迟等级
8. `BackOff.java` - 退避策略
9. `JobOperationReason.java` - 任务操作原因
10. `RetryOperationReason.java` - 重试操作原因
11. `JobNotifyScene.java` - 任务通知场景
12. `JobNotifyType.java` - 任务通知类型
13. `ContentType.java` - 内容类型
14. `RetryTaskStatus.java` - 重试任务状态
15. `RetryResultStatus.java` - 重试结果状态
16. `JobTaskType.java` - 任务类型
17. `SystemTaskType.java` - 系统任务类型
18. `TriggerType.java` - 触发类型
19. `DashboardLineEnum.java` - 仪表板线条

**依赖关系**:
- 无内部依赖（纯枚举定义）

**入度**: 3-5 个模块依赖

**pom.xml 需改**:
```xml
<module>silence-job-common-enum</module>
```

---

## 🔄 实施步骤

### Step 1: 创建模块结构 (1h)
```bash
# 创建 4 个新模块目录
mkdir -p silence-job-common-model/src/main/java/com/old/silence/job/common/{dto,context}
mkdir -p silence-job-common-util/src/main/java/com/old/silence/job/common/util
mkdir -p silence-job-common-constant/src/main/java/com/old/silence/job/common
mkdir -p silence-job-common-enum/src/main/java/com/old/silence/job/common/enums

# 创建资源目录
mkdir -p silence-job-common-model/src/main/resources
mkdir -p silence-job-common-util/src/main/resources
mkdir -p silence-job-common-constant/src/main/resources
mkdir -p silence-job-common-enum/src/main/resources
```

### Step 2: 创建 pom.xml (2h)
- 创建 4 个新 pom.xml 文件
- 配置依赖关系
- 更新 silence-job-common/pom.xml 添加新 module

**依赖关系**:
```
common-enum (无依赖)
common-constant (无依赖)
common-util → common-enum, common-constant, common-model
common-model (无依赖)
```

### Step 3: 移动文件 (5h)
- DTO 类 → common-model
- Enum 类 → common-enum
- Util 类 → common-util
- Constant 类 → common-constant
- 更新包名和 import

### Step 4: 更新依赖 (8h)
在以下模块中更新 pom.xml:
- common-server-api
- common-client-api
- server-core
- server-common
- client-core
- client-retry-core

### Step 5: 更新 import (15h)
- 更新 6 个依赖模块中的 import 语句
- 搜索替换 `com.old.silence.job.common.*` 为新的包名

### Step 6: 编译和验证 (4h)
```bash
mvn clean install -DskipTests
```

### Step 7: 运行测试 (5h)
```bash
mvn test
```

---

## 🎯 验收标准

✅ **编译通过**: `mvn clean install -DskipTests` 成功  
✅ **无循环依赖**: 用 maven-dependency-plugin 验证  
✅ **所有测试通过**: `mvn test` 无失败  
✅ **入度降低**: common-core 的入度从 6 → 1  
✅ **代码组织更清晰**: 单一职责原则得到遵循

---

## ⚠️ 风险点

| 风险 | 概率 | 影响 | 缓解方案 |
|------|------|------|--------|
| 循环依赖出现 | 中 | 编译失败 | 严格规划依赖，使用 maven-enforcer 检查 |
| import 遗漏 | 高 | 编译错误 | 分模块逐步更新，编译验证 |
| 第三方库冲突 | 低 | 运行时错误 | 使用 dependency:tree 检查 |
| 测试失败 | 中 | 功能破损 | 逐步运行测试，定位问题 |

---

## 📈 改进效果预期

| 指标 | 当前 | 目标 | 提升 |
|------|------|------|------|
| common-core 入度 | 6 | 1 | 83% ↓ |
| 模块数量 | 14 | 18 | 明确职责 |
| 耦合度 | 100 | 75 | 25% ↓ |
| 总体评分 | 62 | 75+ | +13 |

---

## 📅 预计时间表

| 阶段 | 任务 | 时间 | 状态 |
|------|------|------|------|
| 1 | 创建模块结构 | 1h | 待开始 |
| 2 | 创建 pom.xml | 2h | 待开始 |
| 3 | 移动文件 | 5h | 待开始 |
| 4 | 更新依赖 | 8h | 待开始 |
| 5 | 更新 import | 15h | 待开始 |
| 6 | 编译验证 | 4h | 待开始 |
| 7 | 测试运行 | 5h | 待开始 |
| **总计** | | **40h** | |

---

## 🚀 启动命令

```bash
# 进入项目根目录
cd /Users/moryzang/IdeaProjects/silence-job-center

# Step 1: 创建目录
mkdir -p silence-job-common/{silence-job-common-model,silence-job-common-util,silence-job-common-constant,silence-job-common-enum}/src/main/{java,resources}

# Step 2: 创建 pom.xml 文件（后续步骤提供）

# Step 3: 开始执行
```

---

## ✅ 完成检查清单

- [ ] 4 个新模块目录结构已创建
- [ ] 4 个新 pom.xml 已配置
- [ ] DTO 文件已移动到 common-model
- [ ] Enum 文件已移动到 common-enum
- [ ] Util 文件已移动到 common-util
- [ ] Constant 文件已移动到 common-constant
- [ ] 6 个依赖模块 pom.xml 已更新
- [ ] 所有 import 语句已更新
- [ ] 编译成功 ✅
- [ ] 所有测试通过 ✅

---

**准备好开始了吗？** 建议从 Step 1 开始，逐步执行，确保每一步都能编译通过。
