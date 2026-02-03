# Phase 1.2 IDE 验证指南

## 📋 验证检查清单

执行以下步骤在 IDE 中验证 server-core 模块拆分的正确性。

---

## 1️⃣ IDE 刷新Maven项目

### IntelliJ IDEA 步骤：

```text
1. 打开 Maven 工具窗口 (View → Tool Windows → Maven)
2. 点击刷新按钮 (Reload All Maven Projects)
   或右键点击根 pom.xml → Maven → Reload Project
3. 等待 Maven 索引和依赖下载完成
```

**预期结果**:
- 在 Maven 工具窗口应该看到 3 个新模块：
  - silence-job-server-core-model
  - silence-job-server-core-repository
  - silence-job-server-core-service

---

## 2️⃣ 编译新模块

### 编译每个新模块：

```bash
# 方法 1: 在 IDE 中
# 右键点击每个新模块 → Build Module

# 方法 2: 使用 Maven 命令
mvn clean compile -pl :silence-job-server-core-model
mvn clean compile -pl :silence-job-server-core-repository
mvn clean compile -pl :silence-job-server-core-service
```

**预期结果**:
- ✅ silence-job-server-core-model 编译成功 (0 errors)
- ✅ silence-job-server-core-repository 编译成功 (0 errors)
- ✅ silence-job-server-core-service 编译成功 (0 errors)

---

## 3️⃣ 检查编译错误

### 查看 Problems 面板：

```text
1. 打开 Problems 面板 (View → Tool Windows → Problems)
2. 查看是否有编译错误
3. 特别关注：
   - 找不到类的错误 (cannot find symbol)
   - 包不存在的错误 (package does not exist)
   - 循环依赖的错误 (circular dependency)
```

**预期结果**:
- Problems 面板显示 0 errors
- 可能有一些 warnings，可以暂时忽略

---

## 4️⃣ 验证模块依赖

### 检查 Maven 依赖树：

```bash
# 查看 server-core 的依赖树
mvn dependency:tree -pl :silence-job-server-core

# 查看 server-common 的依赖树
mvn dependency:tree -pl :silence-job-server-common

# 查看 server-job-task 的依赖树
mvn dependency:tree -pl :silence-job-server-job-task
```

**预期结果**:
- server-core 应该依赖 core-model, core-repository, core-service
- server-common 应该依赖 core-model, core-repository, core-service
- server-job-task 应该依赖 core-model, core-repository, core-service
- 没有 "Unsatisfied dependency" 错误

---

## 5️⃣ 检查循环依赖

### 使用 Maven 插件检查循环依赖：

```bash
# 在项目根目录执行
mvn dependency:analyze

# 或者使用专门的循环依赖检查插件
mvn com.github.ferstl:depgraph-maven-plugin:aggregate -DgraphFormat=text
```

**预期结果**:
- 没有检测到循环依赖
- 依赖方向清晰：model ← repository ← service

---

## 6️⃣ 全项目编译

### 编译整个项目：

```bash
# 在 IDE 中: Build → Build Project (Ctrl+F9 / Cmd+F9)

# 或使用 Maven 命令
cd /Users/moryzang/IdeaProjects/silence-job-center
mvn clean compile -DskipTests
```

**预期结果**:
- 全项目编译成功
- 输出: `BUILD SUCCESS`
- 0 compilation errors

---

## 7️⃣ 运行测试 (可选)

### 运行单元测试：

```bash
# 运行新模块的测试
mvn test -pl :silence-job-server-core-model
mvn test -pl :silence-job-server-core-repository
mvn test -pl :silence-job-server-core-service

# 或运行所有测试
mvn clean test
```

**预期结果**:
- 所有测试通过
- 如果有测试失败，确保它们不是因为模块拆分导致的

---

## 8️⃣ 验证文件数量

### 检查每个模块的文件数量：

```bash
# Model 模块应该有 38 个文件 (24 model + 6 dto + 8 vo)
find /Users/moryzang/IdeaProjects/silence-job-center/silence-job-server/silence-job-server-core-model/src/main/java -name "*.java" | wc -l

# Repository 模块应该有 25 个文件
find /Users/moryzang/IdeaProjects/silence-job-center/silence-job-server/silence-job-server-core-repository/src/main/java -name "*.java" | wc -l

# Service 模块应该有 12 个文件
find /Users/moryzang/IdeaProjects/silence-job-center/silence-job-server/silence-job-server-core-service/src/main/java -name "*.java" | wc -l
```

**预期结果**:
```
Model: 38 个文件
Repository: 25 个文件
Service: 12 个文件
总计: 75 个文件
```

---

## 9️⃣ 验证 import 语句

### 随机检查一些文件的 import：

打开以下文件并检查 import 是否正确：

1. **在 server-common 模块中的任意 Service 文件**
   - 应该导入: `com.old.silence.job.server.domain.model.*`
   - 应该导入: `com.old.silence.job.server.infrastructure.persistence.dao.*`

2. **在 server-job-task 模块中的任意文件**
   - 应该导入: `com.old.silence.job.server.domain.model.*`
   - 应该导入: `com.old.silence.job.server.domain.service.*`

**预期结果**:
- 所有 import 都能正确解析
- IDE 没有显示红色波浪线 (unresolved reference)

---

## 🔟 Git 提交前最后检查

### 确保一切正常：

```bash
# 1. 查看修改的文件
git status

# 2. 查看具体改动
git diff

# 3. 确保没有未追踪的重要文件
git ls-files --others --exclude-standard

# 4. 执行最后一次编译
mvn clean compile -DskipTests
```

**预期结果**:
- 所有修改的 pom.xml 文件都在暂存区
- 新增的 3 个模块目录和文件都在暂存区
- 最终编译成功: `BUILD SUCCESS`

---

## ✅ 验收标准

- [ ] Maven 项目刷新成功，3 个新模块可见
- [ ] 3 个新模块都编译成功 (0 errors)
- [ ] Problems 面板显示 0 errors
- [ ] 依赖树正确，没有缺失依赖
- [ ] 没有循环依赖
- [ ] 全项目编译成功
- [ ] 测试通过（如果有）
- [ ] 文件数量正确 (75 个文件分布在 3 个模块)
- [ ] import 语句正确解析

---

## 🚨 常见问题

### Q1: Maven 刷新后看不到新模块？

**解决方案**:
```bash
# 手动导入模块
File → Project Structure → Modules → + → Import Module
# 选择新模块的 pom.xml
```

### Q2: 编译错误: cannot find symbol？

**解决方案**:
```bash
# 1. 清理并重新编译
mvn clean compile

# 2. 刷新 IDE
File → Invalidate Caches / Restart
```

### Q3: 出现循环依赖？

**解决方案**:
```bash
# 检查依赖方向
# 正确的依赖方向应该是: model ← repository ← service
# 如果发现反向依赖，需要调整 pom.xml
```

---

## 📝 验证完成后

如果所有验证都通过，执行以下步骤：

```bash
# 1. 暂存所有改动
git add .

# 2. 提交
git commit -m "Phase 1.2: Refactor server-core into 3 specialized modules

- Create server-core-model: JPA entities, DTOs, VOs (38 files)
- Create server-core-repository: MyBatis DAOs (25 files)
- Create server-core-service: Domain services (12 files)
- Update all dependent modules (server-common, server-job-task, server-app)
- Update parent pom.xml to include new modules
- Total: 75 files migrated

Benefits:
- Clear separation of concerns
- Reduced coupling (server-core input degree: 5 → 1)
- Better maintainability
- Follows DDD layered architecture

Related: Phase 1.2 server-core splitting (P0 priority)"

# 3. 验证提交
git log -1 --stat
```

---

**祝贺！Phase 1.2 验证完成！🎉**
