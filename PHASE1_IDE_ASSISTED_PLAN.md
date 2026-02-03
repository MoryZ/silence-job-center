# Phase 1 实施方案调整 - 使用 IDE 辅助验证

## 问题诊断

在自动化 Maven 编译过程中遇到了项目依赖问题：
- 根父模块 `platform-parent:2.0.1-SNAPSHOT` 不在本地 Maven 缓存
- 需要从远程仓库下载或通过 IDE 特殊处理

**建议策略**：改为使用 IDE (IntelliJ IDEA) 的编译引擎进行验证，同时逐步执行拆分。

---

## 📋 调整后的实施计划

### Phase 1 拆分 common-core - 三步走

#### Step A：增量模块创建（低风险）

**目标**：创建 4 个新模块，但暂不添加到 parent pom，先用 IDE 验证

1. 创建 silence-job-common-enum 模块
   - 目录：`silence-job-common/silence-job-common-enum/`
   - 复制：所有 `enums/*.java` 文件
   - pom.xml：最小化依赖

2. 创建 silence-job-common-model 模块  
   - 目录：`silence-job-common/silence-job-common-model/`
   - 复制：所有 `dto/*.java` + `context/*.java` 文件
   - pom.xml：依赖 Lombok, Spring

3. 创建 silence-job-common-util 模块
   - 目录：`silence-job-common/silence-job-common-util/`
   - 复制：所有 `util/*.java` 文件
   - pom.xml：依赖 model, enum, 第三方库

4. 创建 silence-job-common-constant 模块
   - 目录：`silence-job-common/silence-job-common-constant/`
   - 复制：常量文件
   - pom.xml：最小化依赖

#### Step B：集成到 parent pom（中风险）

1. 更新 `silence-job-common/pom.xml`：添加 4 个新 module
2. 更新 `silence-job-common-{server-api,client-api,log}/pom.xml`：添加新依赖

#### Step C：验证和修复（高风险）

1. **在 IDE 中编译** silence-job-common
   - 使用 IntelliJ IDEA 的 "Build" → "Make Project"
   - 修复任何 import 或依赖冲突
   
2. **逐模块检查**
   - silence-job-common-enum：检查是否有内部循环依赖
   - silence-job-common-model：检查是否有外部依赖
   - silence-job-common-util：检查是否成功导入 model, enum
   - silence-job-common-{server,client}-api：检查是否找到新依赖

3. **Git 提交** (分阶段)
   - Commit A：添加 4 个新模块文件
   - Commit B：更新 pom.xml
   - Commit C：修复 import 冲突

---

## 🔧 具体操作步骤

### 第1部分：创建 4 个新模块（无依赖关系）

```bash
# 进入 silence-job-common
cd ~/IdeaProjects/silence-job-center/silence-job-common

# Step 1: 创建 enum 模块
mkdir -p silence-job-common-enum/src/main/{java/com/old/silence/job/common/enums,resources}
cp silence-job-common-core/src/main/java/com/old/silence/job/common/enums/*.java \
   silence-job-common-enum/src/main/java/com/old/silence/job/common/enums/
cat > silence-job-common-enum/pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.old.silence</groupId>
        <artifactId>silence-job-common</artifactId>
        <version>${revision}</version>
        <relativePath>../pom.xml</relativePath>
    </parent>
    <artifactId>silence-job-common-enum</artifactId>
    <name>silence-job-common-enum</name>
    <packaging>jar</packaging>
</project>
EOF

# Step 2: 创建 model 模块
mkdir -p silence-job-common-model/src/main/{java/com/old/silence/job/common/{dto,context},resources}
cp silence-job-common-core/src/main/java/com/old/silence/job/common/dto/*.java \
   silence-job-common-model/src/main/java/com/old/silence/job/common/dto/
cp silence-job-common-core/src/main/java/com/old/silence/job/common/context/*.java \
   silence-job-common-model/src/main/java/com/old/silence/job/common/context/
# [pom.xml 类似, 见下文]

# Step 3: 创建 util 模块
mkdir -p silence-job-common-util/src/main/{java/com/old/silence/job/common/util,resources}
cp silence-job-common-core/src/main/java/com/old/silence/job/common/util/*.java \
   silence-job-common-util/src/main/java/com/old/silence/job/common/util/
# [pom.xml 类似, 依赖 enum, model, constant]

# Step 4: 创建 constant 模块
mkdir -p silence-job-common-constant/src/main/{java/com/old/silence/job/common,resources}
cp silence-job-common-core/src/main/java/com/old/silence/job/common/constant/*.java \
   silence-job-common-constant/src/main/java/com/old/silence/job/common/
# [pom.xml 类似, 无内部依赖]
```

### 第2部分：更新 parent pom

在 `silence-job-common/pom.xml` 的 `<modules>` 部分添加：

```xml
<modules>
    <!-- Phase 1 新模块 -->
    <module>silence-job-common-enum</module>
    <module>silence-job-common-constant</module>
    <module>silence-job-common-model</module>
    <module>silence-job-common-util</module>
    
    <!-- 原有模块 -->
    <module>silence-job-common-client-api</module>
    <module>silence-job-common-core</module>
    <module>silence-job-common-log</module>
    <module>silence-job-common-server-api</module>
</modules>
```

### 第3部分：在 IDE 中验证

1. **打开 IDE** → IntelliJ IDEA
2. **在项目视图中**：右键 silence-job-common 项目 
3. **选择** "Build" → "Make Module"
4. **检查编译结果**：
   - ✅ 4 个新模块应该编译成功（无 import 错误）
   - ❌ 如果有错误，检查 pom.xml 中的版本号和依赖关系

### 第4部分：更新依赖模块

编辑以下文件的 dependencies 部分：

- `silence-job-common-server-api/pom.xml`
- `silence-job-common-client-api/pom.xml`
- `silence-job-server-common/pom.xml` (如果依赖 common-core)
- `silence-job-client-common/pom.xml` (如果依赖 common-core)

添加新依赖：
```xml
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-common-enum</artifactId>
</dependency>
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-common-model</artifactId>
</dependency>
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-common-util</artifactId>
</dependency>
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-common-constant</artifactId>
</dependency>
```

（可选）移除或保留对 `silence-job-common-core` 的依赖（取决于是否还需要 gRPC 类）

---

## 📊 风险评估和缓解

| 风险 | 发生概率 | 影响 | 缓解 |
|------|---------|------|-----|
| IDE 编译不通过 | 中 | 需要修改代码 | 逐个检查 import，使用 IDE 的自动修复 |
| pom.xml 版本冲突 | 高 | 编译失败 | 严格使用 ${project.version} 和 relativePath |
| 循环依赖出现 | 低 | 项目无法编译 | 早期检测，使用 maven-dependency-plugin 分析 |
| 遗漏 import 更新 | 高 | 编译失败 | 使用 IDE "Find and Replace"，扫描所有文件 |

---

## ✅ 验收标准

1. **IDE 编译通过** ✓
   - silence-job-common 包含 8 个子模块（4 新 + 4 原）
   - 无红色波浪线（import 错误）

2. **依赖关系正确** ✓
   - 4 个新模块之间无循环依赖
   - 外部模块能找到新模块的类

3. **代码逻辑不变** ✓
   - 所有功能类都被正确迁移
   - 没有遗漏任何类

4. **文档更新** ✓
   - 更新 PHASE1_COMMON_CORE_SPLIT_PLAN.md 记录实际进度
   - 记录任何修改或调整

---

## 🎯 预期时间表（修订）

| 步骤 | 时间 | 主要活动 |
|------|------|--------|
| A1 | 1h | 创建 4 个模块目录和基础文件 |
| A2-A4 | 2h | 复制文件到各模块 |
| B1-B2 | 1h | 更新 pom.xml |
| C1 | 2h | IDE 编译验证 |
| C2 | 3h | 逐模块检查和修复 |
| C3 | 1h | git 提交 |
| **总计** | **10h** | |

---

## 💡 如果 IDE 编译仍然失败...

1. **清空 IDE 缓存**：
   ```
   File → Invalidate Caches → Invalidate and Restart
   ```

2. **重新下载依赖**：
   ```
   View → Tool Windows → Maven → Reload Projects
   ```

3. **检查项目设置**：
   ```
   File → Project Structure → Project
   检查 SDK 是否为 Java 21
   ```

4. **最后的选择**：暂时保留这个详细计划，等待IT或架构组解决基础设施问题。

---

## 📝 记录和审计

本计划已保存到：
- `/PHASE1_COMMON_CORE_SPLIT_PLAN.md` (原计划)
- `/PHASE1_IDE_ASSISTED_PLAN.md` (本文件 - IDE 辅助方案)

建议：
1. 打开两个计划对比
2. 在团队讨论中选择最合适的方案
3. 定期更新进度到 git commit message

---

**准备好开始了吗？** 我可以现在帮你执行 Step A（创建模块目录）。
