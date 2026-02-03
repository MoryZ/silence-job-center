# SilenceJob - Distributed Task Scheduling & Retry Platform

## 📖 Overview

**SilenceJob** is an open-source distributed task scheduling and retry platform built with **DDD (Domain-Driven Design)** architecture, providing high-availability and scalable task management solutions.

### Core Features

- ✅ **Distributed Task Scheduling** - Unified task allocation and execution across multiple clients
- ✅ **Intelligent Retry Mechanism** - Built-in exponential backoff and customizable retry strategies
- ✅ **Workflow Orchestration** - DAG-based complex business process management
- ✅ **Multi-Tenant Isolation** - Native multi-tenancy support with data isolation
- ✅ **Real-time Monitoring & Alerts** - DingDing, Email, and multi-channel notifications
- ✅ **High Availability Deployment** - Cluster support with automatic failover
- ✅ **Expression Engine** - Support for SpEL, Aviator, QL expressions

---

## 🏗️ Architecture Design

### Module Structure

```
silence-job-center/
├── silence-job-common/              # Common modules
│   ├── silence-job-common-core/     # Core utilities & constants
│   ├── silence-job-common-log/      # Unified logging facade
│   ├── silence-job-common-client-api/ # Client API definitions
│   └── silence-job-common-server-api/ # Server API definitions
├── silence-job-client/              # Client modules
│   ├── silence-job-client-common/   # Common client components
│   ├── silence-job-client-core/     # Core client logic
│   ├── silence-job-client-retry-core/ # Retry engine
│   └── silence-job-client-starter/  # Spring Boot Starter
├── silence-job-server/              # Server modules
│   ├── silence-job-server-app/      # Application layer (API, Service)
│   ├── silence-job-server-core/     # Core domain models
│   ├── silence-job-server-common/   # Common server components
│   ├── silence-job-server-job-task/ # Task execution engine
│   ├── silence-job-server-retry-task/ # Retry executor
│   └── silence-job-server-starter/  # Spring Boot Starter
└── LICENSE, pom.xml                 # Configuration
```

### Layered Architecture

Follows **DDD + Microservices** design pattern:

| Layer | Responsibility | Example |
|-------|-----------------|---------|
| **API Layer** | HTTP endpoints, parameter validation, response encapsulation | `*Resource.java` |
| **Application Layer** | Business orchestration, transaction management | `*Service.java` |
| **Domain Layer** | Domain models, core business logic | `domain/model/*.java` |
| **Infrastructure Layer** | Data access, external service integration | `dao/*.java` |

---

## 🛠️ Technology Stack

### Core Dependencies

| Technology | Version | Purpose |
|------------|---------|---------|
| Java | 17+ | Programming Language |
| Spring Boot | 3.x | Application Framework |
| MyBatis-Plus | 3.5+ | ORM Framework |
| Hutool | 5.8+ | Utility Library |
| Fastjson2 | 2.0+ | JSON Processing |
| Pekko | 1.0+ | Actor Model (Async Scheduling) |
| MapStruct | 1.5+ | Object Mapping |
| Guava | 32+ | Graph Structure, Caching |

### Database

- **MySQL** 8.0+ - Primary data storage
- **H2** - In-memory database for unit testing

---

## 📚 Quick Start

### Prerequisites

```bash
- Java 17 or higher
- Maven 3.8.1 or higher
- MySQL 8.0 or higher
```

### Installation

1. **Clone the repository**

```bash
git clone https://gitee.com/yourusername/silence-job-center.git
cd silence-job-center
```

2. **Build the project**

```bash
mvn clean package -DskipTests
```

3. **Initialize database**

```bash
# Execute SQL script
mysql -u root -p < sql/silence-job.sql
```

4. **Start the server**

```bash
cd silence-job-server-starter
mvn spring-boot:run
```

5. **Integrate client**

```xml
<dependency>
    <groupId>com.old.silence</groupId>
    <artifactId>silence-job-client-starter</artifactId>
    <version>1.0.0</version>
</dependency>
```

```yaml
# application.yml
silence-job:
  client:
    namespace: your-namespace
    token: your-token
    server-url: http://localhost:8080
```

---

## 📖 Developer Guide

### Development Standards

See [CLAUDE.md](CLAUDE.md) for complete guidelines:

- ✅ Architecture patterns and layer responsibilities
- ✅ Database design standards (table prefix `sj_`, required fields)
- ✅ Common utility classes and dependency usage
- ✅ **Development Red Lines** (forbidden and required practices)
- ✅ Common code templates
- ✅ Commit and branch management standards

### Key Concepts

#### Job (Task)
- Basic execution unit
- Supports scheduled, API, and event-driven triggers
- Automatic retry mechanism

#### Workflow
- DAG-based complex business processes
- Supports conditional branching and parallel execution
- Multiple expression engine support (SpEL, Aviator, QL)

#### Retry Task
- Automatic retry for failed tasks
- Exponential backoff strategy support
- Configurable maximum retry attempts

#### Group Config
- Tenant-level configuration management
- Notification settings, executor configuration, etc.

---

## 🔐 Development Red Lines

### Forbidden Practices

❌ **Never query database in loops** - Use batch queries instead
```java
// ❌ Wrong
for (BigInteger id : ids) {
    Job job = jobDao.selectById(id);
}
// ✅ Correct
List<Job> jobs = jobDao.selectBatchIds(ids);
```

❌ **Never swallow exception stack traces** - Always log complete stack traces
```java
// ❌ Wrong
log.error("error occurred");
// ✅ Correct
log.error("error occurred", e);
throw new SilenceJobServerException("...", e);
```

❌ **Never catch exceptions without rethrowing in @Transactional methods** - Otherwise transactions won't rollback

❌ **Never directly modify collection parameters** - Avoid concurrency issues

### Required Practices

✅ **Use Assert for pre-validation** - Use Hutool's Assert
✅ **Use Optional to handle nullable values** - Avoid NullPointerException
✅ **Define enums in `com.old.silence.job.common.enums` package**
✅ **DTO naming: Command (write) / Query (query) / ResponseVO (response)**
✅ **Mask sensitive information in logs, mandatory logging at critical points**

---

## 📋 Database Standards

### Table Naming

- All tables prefixed with `sj_` (silence-job abbreviation)
- Examples: `sj_job`, `sj_workflow`, `sj_retry_task`, `sj_group_config`

### Required Fields

All entities extend `AbstractAutoGeneratedIdAuditableTenantable<BigInteger, String>`, automatically including:

```
id (BigInteger)           # Primary key, auto-increment
created_at (Instant)      # Creation time, auto-filled
updated_at (Instant)      # Update time, auto-filled
created_by (String)       # Creator
updated_by (String)       # Updater
tenant_id (String)        # Tenant ID for isolation
deleted (Boolean)         # Soft delete flag (@TableLogic)
version (Integer)         # Optimistic lock version
```

### JSON Handling

Use `JsonUtils` utility class for serialization/deserialization:

```java
// Serialization
String json = JsonUtils.toJsonString(object);

// Deserialization
MyClass obj = JsonUtils.parseObject(json, MyClass.class);

// Validate JSON format
if (!JsonUtils.isValidJson(jsonString)) {
    throw new SilenceJobServerException("Invalid JSON format");
}
```

---

## 🤝 Contributing

### Branch Management

- `main` - Main branch (production)
- `develop` - Development branch
- `feature/*` - Feature branches
- `hotfix/*` - Hotfix branches

### Commit Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: Add workflow decision node feature
fix: Fix task retry count statistics error
docs: Update API documentation
refactor: Refactor task scheduling logic
```

### Contribution Process

1. Fork the repository
2. Create a `feature/xxx` branch
3. Commit your code following the commit convention
4. Create a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details

---

## 📞 Support

- 📖 [Developer Guide](CLAUDE.md)
- 🐛 [Report Issues](https://gitee.com/yourusername/silence-job-center/issues)
- 💬 [Discussions](https://gitee.com/yourusername/silence-job-center/discussions)

---

**Last Updated**: 2026-02-03  
**Maintainers**: SilenceJob Team
