# Phase 1.2 - server-core 拆分实施计划

## 📋 概述

**目标**: 将 server-core 从混合模块拆分为 3 个专业模块，消除 Model/Service 混杂问题

**优先级**: P0 (最高)  
**评分**: 72.75 / 100  
**工作量**: 50h  
**影响模块**: 5 个 (server-job-task, server-retry-task, server-common, server-app, server-starter)

---

## 📁 拆分方案

### 当前状态
```
silence-job-server-core/
├── domain/
│   ├── model/          (24 个 JPA 实体)
│   └── service/        (12 个 Service 类)
├── infrastructure/
│   └── persistence/
│       └── dao/        (25 个 DAO/Repository)
├── dto/                (6 个 DTO)
├── vo/                 (8 个 VO)
└── config/             (配置)
```

### 目标状态
```
silence-job-server/
├── silence-job-server-core/        (保留最小化核心，仅config)
│   └── src/main/java/com/old/silence/job/server/
│       └── config/
│
├── silence-job-server-core-model/  (新增)
│   └── domain/model/               (24 个 JPA Entity)
│       + dto/                      (6 个 DTO)
│       + vo/                       (8 个 VO)
│
├── silence-job-server-core-repository/ (新增)
│   └── infrastructure/
│       └── persistence/
│           └── dao/                (25 个 DAO)
│
└── silence-job-server-core-service/ (新增)
    └── domain/service/             (12 个 Service)
```

---

## 📊 文件分配

### silence-job-server-core-model (Model + DTO/VO)
**文件数**: 24 + 6 + 8 = 38 个

**包含**:
- JPA 实体: Job, JobTask, JobTaskBatch, Retry, RetryTask, SystemUser, Namespace, etc.
- DTO: WorkflowBatchQuery, JobBatchQuery, CallbackConfig, DecisionConfig, JobBatchQueryDO
- VO: JobBatchResponseDO, WorkflowBatchResponseDO, DashboardCardResponseDO, etc.

**依赖关系**:
- 依赖: silence-job-common-model, silence-job-common-enum
- 被依赖: 所有其他 server 模块

### silence-job-server-core-repository (Repository/DAO)
**文件数**: 25 个

**包含**:
- MyBatis DAO: JobDao, JobTaskDao, RetryDao, RetryTaskDao, JobTaskBatchDao, etc.
- 所有 infrastructure 层代码

**依赖关系**:
- 依赖: silence-job-server-core-model, MyBatis Plus
- 被依赖: service 层、application 层

### silence-job-server-core-service (Business Logic)
**文件数**: 12 个

**包含**:
- Domain Service: JobDomainService, RetryDomainService, ConfigService, etc.
- 业务逻辑实现

**依赖关系**:
- 依赖: silence-job-server-core-model, silence-job-server-core-repository
- 被依赖: application 层

---

## 🔄 依赖关系 (单向依赖)

```
         ↓ 依赖方向 ↓

silence-job-common-{model,enum,util}
         ↑
         ├← silence-job-server-core-model
         │
         ├← silence-job-server-core-repository
         │       ↑
         │       ├← silence-job-server-core-service
         │
         ├← silence-job-server-job-task
         ├← silence-job-server-retry-task
         ├← silence-job-server-common
         └← silence-job-server-app
```

---

## 🔧 实施步骤

### Step 1: 创建 3 个新模块 (2h)
```bash
# 进入 silence-job-server
cd silence-job-server

# 创建模块目录
mkdir -p silence-job-server-core-model/src/main/{java/com/old/silence/job/server/{domain/model,dto,vo},resources}
mkdir -p silence-job-server-core-repository/src/main/{java/com/old/silence/job/server/infrastructure/persistence/dao,resources}
mkdir -p silence-job-server-core-service/src/main/{java/com/old/silence/job/server/domain/service,resources}
```

### Step 2: 创建 pom.xml (3h)
- silence-job-server-core-model/pom.xml (依赖: common-model, common-enum)
- silence-job-server-core-repository/pom.xml (依赖: core-model, mybatis-plus)
- silence-job-server-core-service/pom.xml (依赖: core-model, core-repository)

### Step 3: 复制文件 (3h)
- Model 实体 + DTO + VO → core-model
- DAO 类 → core-repository
- Service 类 → core-service

### Step 4: 更新依赖 (5h)
更新以下模块的 pom.xml:
- silence-job-server-core (移除 model/service，保留 config)
- silence-job-server-job-task (添加 core-model, core-service, core-repository)
- silence-job-server-retry-task (添加 core-model, core-service, core-repository)
- silence-job-server-common (添加 core-model, core-service)
- silence-job-server-app (添加 core-model, core-service)

### Step 5: 更新 import (20h)
- 所有依赖模块中的 import 语句
- 指向新的模块和包名

### Step 6: 编译验证 (10h)
- IDE 编译检查
- 修复任何错误
- git commit

### Step 7: 集成测试 (7h)
- 全项目编译
- 运行测试

---

## 📊 改进期望

| 指标 | 当前 | 目标 | 改进 |
|------|------|------|------|
| server-core 入度 | 5 | 1 | 80% ↓ |
| Model/Service 分离 | 混杂 | 清晰 | ✓ |
| 新模块依赖深度 | - | 1 | 清晰 |
| 代码组织 | 混乱 | 分层 | ✓ |
| 总体评分 | 62 | 75+ | +13 |

---

## ⚠️ 风险点

| 风险 | 概率 | 影响 | 缓解 |
|------|------|------|-----|
| 循环依赖出现 | 中 | 编译失败 | 严格规划依赖方向 |
| import 遗漏 | 高 | 编译错误 | IDE 自动修复 + 扫描检查 |
| Service 引用 Dao | 高 | 正常 | 这是预期的 |
| 外部模块引用错误位置 | 中 | 编译失败 | 逐模块更新依赖 |

---

## 📅 时间表

| 步骤 | 时间 | 完成度 |
|------|------|--------|
| Step 1: 创建目录 | 2h | 待开始 |
| Step 2: 创建 pom.xml | 3h | 待开始 |
| Step 3: 复制文件 | 3h | 待开始 |
| Step 4: 更新依赖 | 5h | 待开始 |
| Step 5: 更新 import | 20h | 待开始 |
| Step 6: 编译验证 | 10h | 待开始 |
| Step 7: 集成测试 | 7h | 待开始 |
| **总计** | **50h** | |

---

## ✅ 验收标准

- [ ] 3 个新模块已创建
- [ ] 所有文件已正确复制
- [ ] pom.xml 依赖正确配置
- [ ] IDE 编译通过（0 个错误）
- [ ] 没有循环依赖
- [ ] 所有 import 正确更新
- [ ] 全项目 mvn clean install 成功
- [ ] 所有测试通过

---

**准备好开始了吗？我们从 Step 1 开始。**
