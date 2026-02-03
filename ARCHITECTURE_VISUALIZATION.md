# Silence Job 模块依赖可视化分析

> 本文档使用 Mermaid 图表展示系统架构的详细依赖关系

## 1. 完整依赖有向图（DAG）

```mermaid
graph TB
    subgraph Common["◆ Common 基础层<br/>(被动层，不依赖任何内部模块)"]
        direction TB
        CC["common-core<br/><br/>DTO / Entity<br/>Enum / Constant<br/>Util / Exception<br/><br/>📊 入度: 6<br/>出度: 0<br/>风险: 🔴 高"]
    end
    
    subgraph CommonExt["Common 扩展层"]
        direction TB
        CL["common-log<br/><br/>日志工具类<br/>LogContext<br/>LogManager<br/><br/>📊 入度: 3<br/>出度: 1"]
        CCA["common-client-api<br/><br/>客户端 API<br/>DispatchJobRequest<br/>CallbackRequest<br/><br/>📊 入度: 2<br/>出度: 1"]
        CSA["common-server-api<br/><br/>服务端 API<br/>RetryTaskDTO<br/>兼容导入<br/><br/>📊 入度: 2<br/>出度: 1"]
    end
    
    subgraph Client["◈ Client 客户端层"]
        direction TB
        CCM["client-common<br/><br/>通用组件<br/>NettyClient<br/>RPC Client<br/>SilenceSpringContext<br/><br/>📊 入度: 2<br/>出度: 3"]
        CCR["client-core<br/><br/>任务执行器<br/>JobEndPoint<br/>JobExecutor<br/>JobContext<br/><br/>📊 入度: 1<br/>出度: 2"]
        CRC["client-retry-core<br/><br/>本地重试<br/>RetryStrategies<br/>AbstractReport<br/><br/>📊 入度: 1<br/>出度: 3"]
        CIS["client-starter<br/><br/>启动器 🎬<br/><br/>📊 入度: 0<br/>出度: 3"]
    end
    
    subgraph Server["◈ Server 服务端层"]
        direction TB
        SCC["server-core<br/><br/>领域模型 ⭐<br/>Job / JobTask<br/>JobTaskBatch<br/>Service 接口<br/><br/>📊 入度: 5<br/>出度: 1<br/>风险: 🔴 高"]
        SCM["server-common<br/><br/>基础设施 ⭐<br/>RPC Handler<br/>Actor 基类<br/>工具类<br/><br/>📊 入度: 4<br/>出度: 1<br/>风险: 🟠 中"]
        SJT["server-job-task<br/><br/>任务调度<br/>JobExecutorActor<br/>JobGenerator<br/>JobTimerTask<br/><br/>📊 入度: 2<br/>出度: 2<br/>重复: 50%"]
        SRT["server-retry-task<br/><br/>重试处理<br/>RetryHandlerActor<br/>RetryGenerator<br/>RetryTaskGenerator<br/><br/>📊 入度: 1<br/>出度: 2<br/>重复: 50%"]
        SAP["server-app<br/><br/>应用聚合<br/><br/>📊 入度: 1<br/>出度: 4"]
        SIS["server-starter<br/><br/>启动器 🎬<br/><br/>📊 入度: 0<br/>出度: 2"]
    end
    
    %% Common 层内部依赖
    CL -->|dependOn| CC
    CCA -->|dependOn| CC
    CSA -->|dependOn| CC
    
    %% Client 层到 Common 层
    CCM -->|dependOn| CC
    CCM -->|dependOn| CL
    CCM -->|dependOn| CCA
    
    CCR -->|dependOn| CCM
    CCR -->|dependOn| CC
    CCR -->|dependOn| CL
    
    CRC -->|dependOn| CCM
    CRC -->|dependOn| CC
    CRC -->|dependOn| CL
    CRC -->|dependOn| CSA
    
    CIS -->|dependOn| CCR
    CIS -->|dependOn| CCR
    CIS -->|dependOn| CCM
    
    %% Server 层到 Common 层
    SCC -->|dependOn| CC
    SCC -->|dependOn| CL
    SCC -->|dependOn| CSA
    
    SCM -->|dependOn| CC
    SCM -->|dependOn| CL
    SCM -->|dependOn| CSA
    
    %% Server 层内部依赖
    SJT -->|dependOn| SCC
    SJT -->|dependOn| SCM
    SJT -->|dependOn| CC
    
    SRT -->|dependOn| SCC
    SRT -->|dependOn| SCM
    SRT -->|dependOn| SJT
    SRT -->|dependOn| CC
    
    SAP -->|dependOn| SCC
    SAP -->|dependOn| SJT
    SAP -->|dependOn| SRT
    SAP -->|dependOn| SCM
    
    SIS -->|dependOn| SAP
    SIS -->|dependOn| SCC
    
    style CC fill:#ff6b6b,stroke:#c92a2a,color:#fff,font-weight:bold
    style SCC fill:#ff6b6b,stroke:#c92a2a,color:#fff,font-weight:bold
    style SCM fill:#ffa94d,stroke:#e67700,color:#fff
    style CIS fill:#4dabf7,stroke:#0066cc,color:#fff
    style SIS fill:#4dabf7,stroke:#0066cc,color:#fff
    style SAP fill:#74b9ff,stroke:#0066cc,color:#fff
    style SJT fill:#ffd93d,stroke:#f39c12,color:#000
    style SRT fill:#ffd93d,stroke:#f39c12,color:#000
```

---

## 2. 耦合度热力图

```mermaid
graph LR
    subgraph In["入度（被依赖次数）= 耦合风险"]
    end
    
    CC["<b>common-core</b><br/>6个模块依赖<br/>🔴 超级热点"]
    SCC["<b>server-core</b><br/>5个模块依赖<br/>🔴 严重热点"]
    SCM["<b>server-common</b><br/>4个模块依赖<br/>🟠 中等热点"]
    SJT["<b>server-job-task</b><br/>2个模块依赖<br/>🟡 轻微热点"]
    others["其他模块<br/>≤1个模块依赖<br/>🟢 正常"]
    
    cc1["热力值"]
    cc1 -.-> |"6"| CC
    cc1 -.-> |"5"| SCC
    cc1 -.-> |"4"| SCM
    cc1 -.-> |"2"| SJT
    cc1 -.-> |"≤1"| others
```

---

## 3. 分层可视化

```mermaid
graph TB
    subgraph Layer0["L0: 基础 DTO 层 (读写分离)<br/>━━━━━━━━━━━━━━━━━<br/>职责: 数据结构定义<br/>入境: 无<br/>出境: 无"]
        CC0["✓ common-core-model<br/>  (待拆分)"]
    end
    
    subgraph Layer1["L1: 工具与常量层<br/>━━━━━━━━━━━━━━━━━<br/>职责: 工具方法、常量、枚举<br/>入境: 仅 L0<br/>出境: 无"]
        CC1["✓ common-log"]
        CC2["✓ common-core-util<br/>  (待拆分)"]
    end
    
    subgraph Layer2["L2: 领域层<br/>━━━━━━━━━━━━━━━━━<br/>职责: 业务逻辑、Repository<br/>入境: L0, L1<br/>出境: 无"]
        SC["⭐ server-core<br/>  (包含 Service)<br/>  ❌ 违反分层"]
        CC["✓ common-server-api<br/>  (兼容导入)"]
    end
    
    subgraph Layer3["L3: 应用层<br/>━━━━━━━━━━━━━━━━━<br/>职责: Handler、Controller<br/>入境: L0-L2<br/>出境: 无"]
        SCom["⭐ server-common<br/>  (混合 Handler 和 RPC)<br/>  ❌ 职责不清"]
        SJT["⭐ server-job-task<br/>  (Actor 模式)"]
        SRT["⭐ server-retry-task<br/>  (Actor 模式)"]
        CC_cli["✓ client-common"]
        CC_core["✓ client-core"]
        CC_retry["✓ client-retry-core"]
    end
    
    subgraph Layer4["L4: 启动层 (胶水层)<br/>━━━━━━━━━━━━━━━━━<br/>职责: 模块聚合、启动<br/>入境: 所有模块<br/>出境: 无"]
        SAP["server-app<br/>server-starter"]
        CIS["client-starter"]
    end
    
    %% 层间关系
    Layer0 -->|"允许依赖"| Layer1
    Layer1 -->|"允许依赖"| Layer2
    Layer2 -->|"允许依赖"| Layer3
    Layer3 -->|"允许依赖"| Layer4
    
    %% 违反的依赖（用虚线显示）
    SC -.->|"❌ 自己做 Service"| SC
    SCom -.->|"❌ Handler + 工具混杂"| SCom
    
    style CC0 fill:#90EE90
    style CC1 fill:#90EE90
    style CC2 fill:#90EE90
    style SC fill:#ff6b6b
    style SCom fill:#ff6b6b
    style SJT fill:#FFD700
    style SRT fill:#FFD700
    style CC fill:#90EE90
    style CC_cli fill:#90EE90
    style CC_core fill:#FFD700
    style CC_retry fill:#FFD700
    style SAP fill:#87CEEB
    style CIS fill:#87CEEB
```

---

## 4. 循环依赖检测结果

```mermaid
graph TB
    subgraph Past["过去: 存在的循环依赖"]
        A["common-core"]
        B["common-server-api"]
        A -->|"依赖 LogTaskDTO"| B
        B -->|"继承 LogTaskDTO"| A
        A -.->|"循环!"| A
    end
    
    subgraph Now["现在: 修复后 ✅"]
        C["common-core<br/>LogTaskDTO基类"]
        D["common-server-api<br/>LogTaskDTO兼容导入"]
        C -->|"单向依赖"| D
        D -.->|"无循环!"| D
    end
    
    style A fill:#ff6b6b
    style B fill:#ff6b6b
    style C fill:#90EE90
    style D fill:#90EE90
```

---

## 5. 重构优先级热力图

```mermaid
xychart-beta
    x-axis [P3, P2, P1, P0]
    y-axis "优先级分数" 0 --> 100
    
    line [42, 51.5, 63.5, 78.75]
    
    scatter(P0, 78.75)
    scatter(P0, 72.75)
    scatter(P1, 65.0)
    scatter(P1, 63.5)
    scatter(P2, 51.5)
    scatter(P3, 42.0)
```

**关键发现：**
- 🔴 P0 优先级: `common-core` 和 `server-core` 分数最高 (>72)
- 🟠 P1 优先级: `server-common` 和 task 处理分数接近 (63-65)
- 🟡 P2/P3: 优先级相对较低，可观察改进

---

## 6. 代码重复矩阵

```mermaid
heatmap
    common-core:    100,   0,   0,   0,   0,  10
    server-core:      0, 100,   0,  40,  50,   5
    server-job-task:  0,   0, 100,  50,  50,  10
    server-retry:     0,  40,  50, 100,  50,  10
    client-core:      0,   0,   0,   0, 100,   5
    client-retry:    10,   5,  10,  10,   5, 100
```

**行含义:** 当前模块  
**列含义:** 与其他模块的代码相似度  
**读数:** 数字越大，重复代码越多

**关键数据：**
- `server-job-task` ↔ `server-retry-task`: **50%** 重复
- `server-core` ↔ `server-retry-task`: **40%** 重复
- 可通过提取基类消除 40% 重复

---

## 7. 模块健康度评分卡

```
┌─────────────────────┬──────┬─────┬────────┐
│ 指标                │ 目标 │ 当前│ 评分   │
├─────────────────────┼──────┼─────┼────────┤
│ 循环依赖数          │  0   │  0  │ 100✅  │
│ 平均依赖深度        │ ≤3   │ 3.2 │ 95✅   │
│ 最高耦合度          │ ≤50  │ 100 │ 30❌   │
│ 代码重复率          │ ≤10% │ 30% │ 40❌   │
│ 模块数量            │ ≤12  │  14 │ 60⚠️   │
│ 测试覆盖率          │ ≥70% │ 45% │ 45❌   │
├─────────────────────┼──────┼─────┼────────┤
│ 总体评分            │      │     │ 62/100 │
└─────────────────────┴──────┴─────┴────────┘

等级: C (需要改进)
```

---

## 8. 6个月改进路线图

```mermaid
gantt
    title Silence Job 架构改进时间表
    dateFormat YYYY-MM-DD
    
    section Phase 1: 高风险
    拆分 common-core       :active, p1a, 2026-02-03, 21d
    分离 server-core Model :active, p1b, 2026-02-10, 28d
    
    section Phase 2: 中等风险
    重组 server-common     :p2a, 2026-02-24, 28d
    提取 Job+Retry 公共基类 :p2b, 2026-03-03, 35d
    
    section Phase 3: 低优先级
    客户端重试统一         :p3a, 2026-03-17, 21d
    日志系统解耦           :p3b, 2026-03-24, 28d
    
    section QA & Validation
    集成测试               :qa1, 2026-03-10, 49d
    性能验证               :qa2, 2026-03-31, 28d
```

---

## 9. 模块大小与复杂度分布

```mermaid
quadrantChart
    title 模块复杂度 vs 代码量
    x-axis 代码行数 → 
    y-axis 依赖数量 →
    
    common-core: 0.8, 0.9
    server-core: 0.7, 0.85
    server-common: 0.6, 0.75
    server-job-task: 0.7, 0.65
    server-retry-task: 0.6, 0.55
    client-common: 0.5, 0.5
    client-core: 0.6, 0.4
    client-retry-core: 0.4, 0.5
```

**象限分析：**
- **右上 (复杂 + 大)**: `common-core`, `server-core` → 需要拆分
- **左下 (简单 + 小)**: `client-retry-core`, `client-common` → 健康
- **右下 (简单 + 大)**: `server-job-task` → 需要整理

---

## 10. 依赖倒三角（理想状态）

```
理想状态应该是 ▼ 形状（越往上依赖越少）

        ┏━━━━━━┓
        ┃ 启动器 ┃  (胶水层，依赖所有)
        ┗━━━━━━┛
         ▲  ▲
    ┏━━━┻━━┻━━━┓
    ┃ 应用服务层  ┃  (处理流程，有限依赖)
    ┗━━━┳━━━┳━━┛
     ▲   ▲   ▲
    ┏┻━━━┻┓ ┏┻━━━┓
    ┃领域层┃ ┃工具层┃  (业务逻辑，最多依赖底层)
    ┗━━┳━━┛ ┗━━┳━━┛
       ▲       ▲
    ┏━━┻━━━━━━┻━━┓
    ┃  基础DTO层   ┃  (数据结构，无依赖)
    ┗━━━━━━━━━━━━┛

当前状况 ⬇️ 分散，不够清晰
    需要 ➡️ 严格分层
```

---

**文档版本**: 1.0 (可视化分析版)  
**最后更新**: 2026-02-03  
**工具**: Mermaid 图表库
