# CRM系统技术选型与开发指南（最终版）

> **适用项目**: 制造业CRM系统（100人公司内部使用）
> **开发周期**: 50天
> **核心技术栈**: Python FastAPI + Vue3 + PostgreSQL + Redis

---

## 一、技术架构图

```
┌───────────────────────────────────────────────────────────────────┐
│                   前端层 (Vue3 + ElementPlus)                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐          │
│  │ 客户管理  │  │ 销售漏斗  │  │ AI智能   │  │ 数据报表  │  ...     │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘          │
└──────────────────────┬────────────────────────────────────────────┘
                       │ HTTP / WebSocket / SSE
┌──────────────────────▼────────────────────────────────────────────┐
│          后端层 (FastAPI + vue-fastapi-admin骨架)                  │
│  ┌──────────────────────────────────────────────────────┐        │
│  │              vue-fastapi-admin 核心                   │        │
│  │  ├─ RBAC权限(角色/菜单/按钮/动态路由)                 │        │
│  │  ├─ JWT鉴权(Access+Refresh双Token)                   │        │
│  │  ├─ 用户/部门/字典/日志管理                          │        │
│  │  └─ 代码生成器(数据库表→CRUD全栈代码)                │        │
│  └──────────────────────────────────────────────────────┘        │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐         │
│  │行级数据权限│  │审批流引擎│  │WebSocket │  │LangChain │         │
│  │(自研插件) │  │(自研插件)│  │(实时推送) │  │AI集成    │         │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘         │
│  ┌──────────────────────────────────────────────────────┐        │
│  │              APScheduler 定时任务引擎                 │        │
│  │  ├─ 健康度每日计算(凌晨2点)                          │        │
│  │  ├─ 续约提醒(90/60/30/7天)                          │        │
│  │  ├─ 保护期到期检查                                   │        │
│  │  ├─ 超期未跟进回收                                   │        │
│  │  └─ 线索评分更新                                     │        │
│  └──────────────────────────────────────────────────────┘        │
└──────────────────────┬────────────────────────────────────────────┘
                       │ SQLAlchemy 2.0 异步
┌──────────────────────▼────────────────────────────────────────────┐
│                         数据层                                     │
│  ┌──────────────────────┐    ┌──────────────────────┐            │
│  │    PostgreSQL 16     │    │      Redis 7         │            │
│  │  ├─ 业务数据          │    │  ├─ Session/Token    │            │
│  │  ├─ JSONB灵活字段     │    │  ├─ 权限缓存         │            │
│  │  ├─ CTE递查(组织架构) │    │  ├─ 消息队列         │            │
│  │  ├─ 全文检索(客户搜索)│    │  └─ 实时推送         │            │
│  │  └─ pgvector(AI向量) │    │                      │            │
│  └──────────────────────┘    └──────────────────────┘            │
└───────────────────────────────────────────────────────────────────┘
                       │ HTTP API
┌──────────────────────▼────────────────────────────────────────────┐
│                   自动化工作流 (n8n 自托管)                        │
│  ┌──────────────────────────────────────────────────────┐        │
│  │                  n8n 工作流引擎                       │        │
│  │  ├─ 触发器: Cron/Webhook/数据库变更                  │        │
│  │  ├─ 动作: 邮件/短信/微信/HTTP/数据库                 │        │
│  │  ├─ AI Agent: LangChain/OpenAI节点                  │        │
│  │  └─ 监控: 执行日志/异常告警/重试机制                 │        │
│  └──────────────────────────────────────────────────────┘        │
└───────────────────────────────────────────────────────────────────┘
```

---

## 二、技术栈完整清单

### 2.1 前端技术栈

| 技术 | 版本 | GitHub Stars | 许可证 | 用途 | 安装命令 |
|------|:----:|:-----------:|:------:|------|---------|
| Vue 3 | 3.5+ | 45k | MIT | UI框架 | `npm create vue@latest` |
| ElementPlus | 2.9+ | 22k | MIT | 组件库 | `npm install element-plus` |
| TypeScript | 5.7+ | 98k | Apache-2.0 | 类型安全 | 已集成 |
| Vite | 6.0+ | 67k | MIT | 构建工具 | 已集成 |
| Pinia | 2.3+ | 12k | MIT | 状态管理 | `npm install pinia` |
| ECharts | 5.6+ | 58k | Apache-2.0 | 数据可视化 | `npm install echarts` |
| Axios | 1.8+ | 104k | MIT | HTTP客户端 | `npm install axios` |

### 2.2 后端技术栈

| 技术 | 版本 | GitHub Stars | 许可证 | 用途 | 安装命令 |
|------|:----:|:-----------:|:------:|------|---------|
| Python | 3.12+ | 62k | PSF | 编程语言 | `uv python install 3.12` |
| FastAPI | 0.115+ | 97k | MIT | Web框架 | `uv add fastapi uvicorn` |
| **vue-fastapi-admin** | 最新 | 2.1k | MIT | 后台骨架 | `git clone https://github.com/mizhexiaoxiao/vue-fastapi-admin` |
| SQLAlchemy | 2.0+ | 8.5k | MIT | 异步ORM | `uv add sqlalchemy[asyncio]` |
| Pydantic | 2.10+ | 18k | MIT | 数据验证 | `uv add pydantic` |
| Alembic | 1.14+ | 1.8k | MIT | 数据库迁移 | `uv add alembic` |
| Uvicorn | 0.34+ | 10k | BSD | ASGI服务器 | `uv add uvicorn` |
| asyncpg | 0.30+ | 3.2k | Apache-2.0 | PostgreSQL驱动 | `uv add asyncpg` |

### 2.3 AI技术栈

| 技术 | 版本 | GitHub Stars | 许可证 | 用途 | 安装命令 |
|------|:----:|:-----------:|:------:|------|---------|
| LangChain | 0.3+ | 90k | MIT | LLM应用框架 | `uv add langchain langchain-openai` |
| **LangGraph** | 0.2+ | 15k+ | MIT | AI Agent工作流 | `uv add langgraph` |
| **LlamaIndex** | 0.12+ | 33k | MIT | RAG框架 | `uv add llama-index` |
| pgvector | 0.3+ | 13k | PostgreSQL | 向量检索 | PostgreSQL扩展 |

### 2.4 自动化技术栈

| 技术 | 版本 | GitHub Stars | 许可证 | 用途 | 安装命令 |
|------|:----:|:-----------:|:------:|------|---------|
| **n8n** | 1.70+ | 55k | Sustainable Use | 工作流引擎 | `docker run -it --rm -p 5678:5678 n8nio/n8n` |
| APScheduler | 3.11+ | 6.5k | MIT | 定时任务 | `uv add apscheduler` |

### 2.5 数据库技术栈

| 数据库 | 版本 | GitHub Stars | 许可证 | 用途 |
|-------|:----:|:-----------:|:------:|------|
| PostgreSQL | 16+ | 15k | PostgreSQL | 主数据库 |
| Redis | 7.4+ | 66k | BSD | 缓存/队列 |

### 2.6 部署技术栈

| 技术 | 版本 | GitHub Stars | 许可证 | 用途 |
|------|:----:|:-----------:|:------:|------|
| Docker | 27+ | 70k | Apache-2.0 | 容器化 |
| Nginx | 1.27+ | 21k | BSD | 反向代理 |

---

## 三、项目结构

### 3.1 后端目录结构

```
crm-backend/
├── app/
│   ├── __init__.py
│   ├── main.py                    # FastAPI 入口
│   ├── config.py                  # 配置文件
│   ├── database.py                # 数据库连接
│   ├── models/                    # 数据模型
│   │   ├── __init__.py
│   │   ├── user.py
│   │   ├── customer.py
│   │   ├── sales.py
│   │   └── ...
│   ├── schemas/                   # Pydantic 模型
│   ├── api/                       # API 路由
│   │   └── v1/
│   │       ├── auth.py
│   │       ├── customers.py
│   │       ├── sales.py
│   │       └── ...
│   ├── services/                  # 业务逻辑
│   ├── core/                      # 核心模块
│   │   ├── security.py            # 认证授权
│   │   ├── permissions.py         # 权限控制
│   │   └── data_permission.py     # 行级数据权限(自研)
│   ├── plugins/                   # 自研插件
│   │   ├── approval_flow/         # 审批流引擎
│   │   └── websocket_push/        # WebSocket推送
│   ├── ai/                        # AI 模块
│   │   ├── llm.py                 # LangChain集成
│   │   ├── embeddings.py          # 向量嵌入
│   │   ├── agents.py              # LangGraph Agent
│   │   └── rag.py                 # LlamaIndex RAG
│   ├── tasks/                     # 定时任务
│   │   ├── scheduler.py           # APScheduler
│   │   ├── health_check.py        # 健康度计算
│   │   ├── renewal_reminder.py    # 续约提醒
│   │   └── pool_recycle.py        # 资源池回收
│   └── utils/
├── alembic/                       # 数据库迁移
├── tests/
├── pyproject.toml
└── docker-compose.yml
```

### 3.2 前端目录结构

```
crm-web/
├── src/
│   ├── main.ts
│   ├── App.vue
│   ├── api/                       # API 接口
│   ├── views/                     # 页面
│   │   ├── customer/
│   │   ├── sales/
│   │   ├── ai/                    # AI智能页面
│   │   └── ...
│   ├── components/
│   ├── stores/
│   ├── router/
│   └── utils/
├── package.json
└── vite.config.ts
```

---

## 四、核心代码模板

### 4.1 vue-fastapi-admin 快速启动

```bash
# 克隆项目
git clone https://github.com/mizhexiaoxiao/vue-fastapi-admin
cd vue-fastapi-admin

# 后端
cd backend
uv venv && source .venv/bin/activate
uv pip install -r requirements.txt
uvicorn app.main:app --reload

# 前端
cd ../frontend
npm install
npm run dev
```

### 4.2 数据库连接配置

```python
# app/database.py
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession, async_sessionmaker
from sqlalchemy.orm import declarative_base

DATABASE_URL = "postgresql+asyncpg://crm:password@localhost:5432/crm"

engine = create_async_engine(DATABASE_URL, echo=True)
AsyncSessionLocal = async_sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)
Base = declarative_base()

async def get_db():
    async with AsyncSessionLocal() as session:
        try:
            yield session
        finally:
            await session.close()
```

### 4.3 行级数据权限插件（自研）

```python
# app/core/data_permission.py
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.customer import Customer

class DataPermissionFilter:
    """行级数据权限过滤器"""
    
    @staticmethod
    async def filter_by_permission(
        query: select,
        user_id: int,
        user_role: str,
        db: AsyncSession
    ) -> select:
        """
        根据用户角色过滤数据
        - 超级管理员: 全部数据
        - 部门经理: 本部门数据
        - 销售代表: 个人数据
        """
        if user_role == "super_admin":
            return query
        
        if user_role == "dept_manager":
            # 获取部门成员列表
            dept_users = await get_dept_users(user_id, db)
            return query.where(Customer.owner_id.in_(dept_users))
        
        # 普通销售只能看自己的
        return query.where(Customer.owner_id == user_id)

# 使用示例
@router.get("/customers")
async def list_customers(
    db: AsyncSession = Depends(get_db),
    current_user = Depends(get_current_user)
):
    query = select(Customer)
    query = await DataPermissionFilter.filter_by_permission(
        query, current_user.id, current_user.role, db
    )
    result = await db.execute(query)
    return result.scalars().all()
```

### 4.4 审批流引擎（自研）

```python
# app/plugins/approval_flow/engine.py
from enum import Enum
from datetime import datetime
from sqlalchemy import Column, Integer, String, JSON, DateTime

class ApprovalStatus(str, Enum):
    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"
    CANCELLED = "cancelled"

class ApprovalFlow:
    """审批流引擎"""
    
    def __init__(self, flow_config: dict):
        """
        flow_config 示例:
        {
            "steps": [
                {"role": "dept_manager", "order": 1},
                {"role": "finance", "order": 2},
                {"role": "general_manager", "order": 3, "amount_gt": 100000}
            ],
            "timeout_hours": 24,
            "auto_reject": True
        }
        """
        self.config = flow_config
    
    async def start(self, business_id: int, business_type: str, db):
        """发起审批"""
        # 创建审批记录
        approval = ApprovalRecord(
            business_id=business_id,
            business_type=business_type,
            current_step=1,
            status=ApprovalStatus.PENDING,
            config=self.config
        )
        db.add(approval)
        await db.commit()
        
        # 通知审批人
        await self.notify_approver(approval, db)
        return approval
    
    async def approve(self, approval_id: int, approver_id: int, comment: str, db):
        """审批通过"""
        approval = await db.get(ApprovalRecord, approval_id)
        
        # 记录审批历史
        history = ApprovalHistory(
            approval_id=approval_id,
            approver_id=approver_id,
            action="approve",
            comment=comment
        )
        db.add(history)
        
        # 判断是否还有下一步
        if approval.current_step < len(self.config["steps"]):
            approval.current_step += 1
            await self.notify_approver(approval, db)
        else:
            approval.status = ApprovalStatus.APPROVED
            await self.on_completed(approval, db)
        
        await db.commit()
        return approval
    
    async def reject(self, approval_id: int, approver_id: int, comment: str, db):
        """审批拒绝"""
        approval = await db.get(ApprovalRecord, approval_id)
        approval.status = ApprovalStatus.REJECTED
        
        history = ApprovalHistory(
            approval_id=approval_id,
            approver_id=approver_id,
            action="reject",
            comment=comment
        )
        db.add(history)
        await db.commit()
        
        await self.on_rejected(approval, db)
        return approval
```

### 4.5 APScheduler 定时任务

```python
# app/tasks/scheduler.py
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from apscheduler.triggers.cron import CronTrigger

scheduler = AsyncIOScheduler()

# 健康度每日计算（凌晨2点）
@scheduler.scheduled_job(CronTrigger(hour=2, minute=0))
async def calculate_health_scores():
    """计算所有客户健康度"""
    customers = await get_all_active_customers()
    for customer in customers:
        score = await calculate_health(customer)
        await update_health_score(customer.id, score)
        
        # 低健康度预警
        if score < 60:
            await send_health_alert(customer.owner_id, customer.id, score)

# 续约提醒（每天10点）
@scheduler.scheduled_job(CronTrigger(hour=10, minute=0))
async def renewal_reminder():
    """续约提醒（90/60/30/7天）"""
    for days in [90, 60, 30, 7]:
        expiring = await get_expiring_contracts(days)
        for contract in expiring:
            await send_renewal_notification(contract)

# 保护期到期检查（每天0点）
@scheduler.scheduled_job(CronTrigger(hour=0, minute=0))
async def protection_expiry_check():
    """保护期到期检查"""
    expired = await get_expired_protection_customers()
    for customer in expired:
        await move_to_team_pool(customer.id)
        await notify_owner(customer.owner_id, f"客户{customer.name}已移入团队池")

# 超期未跟进回收（每天1点）
@scheduler.scheduled_job(CronTrigger(hour=1, minute=0))
async def recycle_inactive_customers():
    """超期未跟进（30天）自动回收"""
    inactive = await get_customers_no_follow_up(days=30)
    for customer in inactive:
        await move_to_public_pool(customer.id)
        await notify_owner(customer.owner_id, f"客户{customer.name}因超期未跟进已移入公海")

# 线索评分更新（每小时）
@scheduler.scheduled_job(CronTrigger(hour="*"))
async def update_lead_scores():
    """更新线索评分"""
    leads = await get_unscored_leads()
    for lead in leads:
        score = await calculate_lead_score(lead)
        await update_lead_score(lead.id, score)

def start_scheduler():
    scheduler.start()
```

### 4.6 LangChain + LangGraph AI集成

```python
# app/ai/agents.py
from langchain.chat_models import ChatOpenAI
from langgraph.graph import StateGraph, END
from typing import TypedDict

class AgentState(TypedDict):
    customer_id: int
    customer_data: dict
    analysis: str
    recommendation: str
    action: str

# 定义Agent节点
async def analyze_customer(state: AgentState) -> AgentState:
    """分析客户"""
    llm = ChatOpenAI(model="gpt-4")
    customer = state["customer_data"]
    
    prompt = f"""
    分析客户价值与风险：
    - 公司: {customer['company_name']}
    - 行业: {customer['industry']}
    - 成交金额: {customer['total_amount']}
    - 最后跟进: {customer['last_follow_days']}天前
    - 健康度: {customer['health_score']}
    """
    state["analysis"] = await llm.ainvoke(prompt)
    return state

async def generate_recommendation(state: AgentState) -> AgentState:
    """生成推荐"""
    llm = ChatOpenAI(model="gpt-4")
    state["recommendation"] = await llm.ainvoke(
        f"基于分析结果，推荐下一步行动: {state['analysis']}"
    )
    return state

async def execute_action(state: AgentState) -> AgentState:
    """执行动作"""
    # 自动创建任务/发送通知等
    state["action"] = "已创建跟进任务"
    return state

# 构建工作流
workflow = StateGraph(AgentState)
workflow.add_node("analyze", analyze_customer)
workflow.add_node("recommend", generate_recommendation)
workflow.add_node("action", execute_action)

workflow.add_edge("analyze", "recommend")
workflow.add_edge("recommend", "action")
workflow.add_edge("action", END)

agent = workflow.compile()

# 使用
async def run_customer_agent(customer_id: int):
    customer_data = await get_customer_data(customer_id)
    result = await agent.ainvoke({
        "customer_id": customer_id,
        "customer_data": customer_data,
        "analysis": "",
        "recommendation": "",
        "action": ""
    })
    return result
```

### 4.7 n8n 工作流集成

```yaml
# n8n工作流配置示例（自动化邮件跟进）
workflow:
  name: "客户跟进邮件自动化"
  nodes:
    - type: "Webhook"
      name: "触发器"
      config:
        path: "/webhook/follow-up"
        method: "POST"
    
    - type: "HTTP Request"
      name: "获取客户信息"
      config:
        url: "http://backend:8000/api/v1/customers/{{$json.customer_id}}"
        method: "GET"
    
    - type: "OpenAI"
      name: "AI生成邮件内容"
      config:
        model: "gpt-4"
        prompt: "为客户{{$json.company_name}}生成跟进邮件..."
    
    - type: "Email"
      name: "发送邮件"
      config:
        to: "{{$json.email}}"
        subject: "跟进 - {{$json.company_name}}"
        body: "{{$json.ai_content}}"
    
    - type: "HTTP Request"
      name: "记录发送日志"
      config:
        url: "http://backend:8000/api/v1/follow-logs"
        method: "POST"
```

---

## 五、数据库配置

### 5.1 PostgreSQL 初始化

```sql
-- 创建数据库
CREATE DATABASE crm;

-- 启用 pgvector 扩展
CREATE EXTENSION IF NOT EXISTS vector;

-- 启用全文检索
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- 创建向量索引
CREATE INDEX idx_customers_embedding ON customers USING hnsw (embedding vector_cosine_ops);
```

### 5.2 Alembic 迁移

```bash
# 初始化
alembic init alembic

# 生成迁移
alembic revision --autogenerate -m "create customers table"

# 执行迁移
alembic upgrade head
```

---

## 六、部署配置

### 6.1 Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  # 后端服务
  backend:
    build: ./crm-backend
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql+asyncpg://crm:password@postgres:5432/crm
      - REDIS_URL=redis://redis:6379/0
      - OPENAI_API_KEY=${OPENAI_API_KEY}
    depends_on:
      - postgres
      - redis

  # 前端服务
  frontend:
    build: ./crm-web
    ports:
      - "80:80"
    depends_on:
      - backend

  # PostgreSQL 16
  postgres:
    image: postgres:16
    environment:
      POSTGRES_DB: crm
      POSTGRES_USER: crm
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data

  # Redis 7
  redis:
    image: redis:7.4
    volumes:
      - redis_data:/data

  # n8n 工作流引擎
  n8n:
    image: n8nio/n8n:latest
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - WEBHOOK_URL=http://n8n:5678/
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      - backend

  # Nginx
  nginx:
    image: nginx:1.27
    ports:
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - frontend
      - backend

volumes:
  postgres_data:
  redis_data:
  n8n_data:
```

### 6.2 启动命令

```bash
# 开发环境
docker-compose up -d

# 查看日志
docker-compose logs -f backend

# 停止
docker-compose down
```

---

## 七、开发计划

### 7.1 第一阶段：核心模块（30天）

| 模块 | 开发周期 | 优先级 |
|------|---------|-------|
| 用户认证授权（vue-fastapi-admin内置） | 2天 | P0 |
| 客户管理CRUD | 4天 | P0 |
| 销售管理（漏斗/跟进） | 4天 | P0 |
| 产品管理 | 2天 | P0 |
| 商务合同 | 4天 | P0 |
| 数据报表（ECharts） | 4天 | P0 |
| 系统管理（vue-fastapi-admin内置） | 1天 | P0 |
| 测试与修复 | 5天 | P0 |

### 7.2 第二阶段：自研插件（10天）

| 模块 | 开发周期 | 优先级 |
|------|---------|-------|
| 行级数据权限插件 | 3天 | P1 |
| 审批流引擎插件 | 4天 | P1 |
| WebSocket实时推送 | 3天 | P1 |

### 7.3 第三阶段：AI与自动化（10天）

| 模块 | 开发周期 | 优先级 |
|------|---------|-------|
| APScheduler定时任务 | 2天 | P1 |
| LangChain集成 | 3天 | P1 |
| LangGraph Agent | 2天 | P1 |
| n8n工作流集成 | 2天 | P2 |
| 智能标签/推荐 | 1天 | P1 |

---

## 八、开源项目地址

| 项目 | 地址 | Stars |
|------|------|:-----:|
| vue-fastapi-admin | https://github.com/mizhexiaoxiao/vue-fastapi-admin | 2.1k |
| FastAPI | https://github.com/tiangolo/fastapi | 97k |
| LangChain | https://github.com/langchain-ai/langchain | 90k |
| LangGraph | https://github.com/langchain-ai/langgraph | 15k+ |
| LlamaIndex | https://github.com/run-llama/llama_index | 33k |
| n8n | https://github.com/n8n-io/n8n | 55k |
| Vue3 | https://github.com/vuejs/core | 45k |
| ElementPlus | https://github.com/element-plus/element-plus | 22k |
| PostgreSQL | https://www.postgresql.org/ | - |
| pgvector | https://github.com/pgvector/pgvector | 13k |
