# CRM系统顶级设计开发方案

> **项目名称**: 制造业CRM客户管理系统  
> **适用场景**: 纸品/彩印/软包装制造业,100人公司内部使用  
> **开发周期**: 50天(核心功能) + 20天(AI与优化)  
> **文档版本**: v1.0  
> **创建日期**: 2026-04-15  
> **文档状态**: ✅ 开发依据  

---

## 一、项目愿景与目标

### 1.1 核心定位
轻量级本地化CRM系统,支持客户全生命周期管理:
- ✅ 私有本地存储,数据物理隔离
- ✅ 局域网内部使用,零运维
- ✅ Docker Compose一键部署
- ✅ 数据驱动决策,覆盖线索→成交→服务→续约

### 1.2 核心业务价值
1. **提升销售效率**: 自动化工作流、智能推荐、防撞单机制
2. **降低客户流失**: 健康度监控、续约提醒、风险预警
3. **优化资源配置**: 三级资源池、多层级回收、智能分配
4. **数据驱动决策**: 全维度报表、AI预测、ROI分析

### 1.3 成功标准
- 客户跟进及时率 > 90%
- 客户续约率 > 80%
- 销售漏斗转化率提升 > 20%
- 客户数据完整度 > 95%

---

## 二、技术架构设计

### 2.1 总体架构

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

### 2.2 技术栈选型原则

#### 2.2.1 选型标准
1. **成熟度**: GitHub Stars > 10k, 社区活跃
2. **许可证**: 宽松开源(MIT/Apache-2.0/BSD)
3. **性能**: 异步支持, 适合高并发
4. **可维护性**: 类型安全, 文档完善
5. **生态**: 插件丰富, 易于集成

#### 2.2.2 前端技术栈

| 技术 | 版本 | 选择理由 | 替代方案 |
|------|:----:|---------|---------|
| Vue 3 | 3.5+ | 组合式API、响应式系统优秀、TypeScript友好 | React(学习曲线陡) |
| ElementPlus | 2.9+ | 组件丰富、文档完善、适合后台系统 | Ant Design Vue |
| TypeScript | 5.7+ | 类型安全、减少运行时错误 | JavaScript(不推荐) |
| Vite | 6.0+ | 极速热更新、原生ESM | Webpack(慢) |
| Pinia | 2.3+ | Vue3官方推荐、轻量 | Vuex(已废弃) |
| ECharts | 5.6+ | 图表类型丰富、性能优秀 | Chart.js(功能少) |

#### 2.2.3 后端技术栈

| 技术 | 版本 | 选择理由 | 替代方案 |
|------|:----:|---------|---------|
| Python | 3.12+ | AI生态完善、开发效率高 | Go(生态弱)、Java(重) |
| FastAPI | 0.115+ | 异步高性能、自动生成文档、类型安全 | Django(慢)、Flask(无异步) |
| vue-fastapi-admin | 最新 | 开箱即用的RBAC、JWT、代码生成器 | 自研(耗时) |
| SQLAlchemy 2.0 | 2.0+ | 异步ORM、成熟稳定 | Tortoise ORM(不成熟) |
| PostgreSQL | 16+ | JSONB、全文检索、pgvector扩展 | MySQL(无向量) |
| Redis | 7.4+ | 高性能缓存、Pub/Sub、消息队列 | Memcached(功能少) |

#### 2.2.4 AI与自动化技术栈

| 技术 | 用途 | 选择理由 |
|------|------|---------|
| LangChain | LLM应用框架 | 生态最大、组件丰富 |
| LangGraph | AI Agent工作流 | 状态机模式、适合复杂流程 |
| LlamaIndex | RAG检索增强 | 文档检索优化 |
| pgvector | 向量存储检索 | PostgreSQL原生扩展 |
| n8n | 工作流自动化 | 可视化编排、55k Stars |
| APScheduler | 定时任务 | 轻量、支持Cron表达式 |

### 2.3 项目结构规范

#### 2.3.1 后端目录结构

```
crm-backend/
├── app/
│   ├── __init__.py
│   ├── main.py                    # FastAPI 入口
│   ├── config.py                  # 配置文件(环境变量)
│   ├── database.py                # 数据库连接(异步)
│   ├── models/                    # SQLAlchemy 数据模型
│   │   ├── __init__.py
│   │   ├── user.py                # 用户/角色/权限(系统内置)
│   │   ├── customer.py            # 客户/联系人/地址
│   │   ├── sales.py               # 商机/跟进记录
│   │   ├── product.py             # 产品/分类/价格
│   │   ├── contract.py            # 报价单/合同/订单
│   │   ├── marketing.py           # 市场活动/线索
│   │   └── ai.py                  # AI画像/标签/推荐
│   ├── schemas/                   # Pydantic 请求/响应模型
│   ├── api/                       # API 路由(按版本)
│   │   └── v1/
│   │       ├── auth.py
│   │       ├── customers.py
│   │       ├── sales.py
│   │       └── ...
│   ├── services/                  # 业务逻辑层
│   │   ├── customer_service.py
│   │   ├── order_service.py
│   │   ├── delivery_service.py
│   │   └── ...
│   ├── repositories/              # 数据访问层
│   │   ├── base.py                # 基类Repository
│   │   ├── customer_repo.py
│   │   └── ...
│   ├── core/                      # 核心模块
│   │   ├── security.py            # JWT/密码加密
│   │   ├── permissions.py         # 权限控制
│   │   └── data_permission.py     # 行级数据权限(自研)
│   ├── plugins/                   # 自研插件
│   │   ├── approval_flow/         # 审批流引擎
│   │   ├── websocket_push/        # WebSocket推送
│   │   └── workflow_engine/       # 自动化工作流引擎
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
│   └── utils/                     # 工具函数
├── alembic/                       # 数据库迁移
├── tests/                         # 测试
│   ├── unit/                      # 单元测试
│   ├── integration/               # 集成测试
│   └── e2e/                       # 端到端测试
├── pyproject.toml                 # 依赖管理(uv)
├── Dockerfile
└── docker-compose.yml
```

#### 2.3.2 前端目录结构

```
crm-web/
├── src/
│   ├── main.ts
│   ├── App.vue
│   ├── api/                       # API 接口封装
│   │   ├── customer.ts
│   │   ├── sales.ts
│   │   └── ...
│   ├── views/                     # 页面组件
│   │   ├── customer/
│   │   │   ├── list.vue           # 客户列表
│   │   │   ├── detail.vue         # 客户详情
│   │   │   └── pool.vue           # 资源池
│   │   ├── sales/
│   │   ├── product/
│   │   ├── marketing/
│   │   ├── ai/
│   │   └── system/
│   ├── components/                # 通用组件
│   │   ├── layout/                # 布局组件
│   │   ├── table/                 # 表格组件
│   │   ├── form/                  # 表单组件
│   │   └── chart/                 # 图表组件
│   ├── stores/                    # Pinia 状态管理
│   ├── router/                    # 路由配置(动态)
│   ├── utils/                     # 工具函数
│   └── types/                     # TypeScript 类型定义
├── package.json
├── vite.config.ts
├── tsconfig.json
└── Dockerfile
```

---

## 三、核心业务规则

### 3.1 权限体系(RBAC + 行级数据权限)

#### 3.1.1 角色权限模型

```
超级管理员: 全系统无限制
部门经理: 本部门及下级部门数据 + 审批权限
销售代表: 个人负责数据 + 团队池领取权限
市场人员: 市场活动 + 线索数据
客户成功: 成交客户 + 健康度监控
财务人员: 合同 + 付款 + 回款数据
```

#### 3.1.2 数据权限范围

| 角色 | 数据范围 | 实现方式 |
|------|---------|---------|
| 超级管理员 | 全部数据 | 无WHERE过滤 |
| 部门经理 | 本部门及下级 | `dept_id IN (递归查询)` |
| 销售代表 | 个人负责 | `owner_id = current_user_id` |
| 财务人员 | 合同相关 | `contract_id IN (授权列表)` |

#### 3.1.3 字段级权限

```python
# 敏感字段脱敏规则
if user_role != "admin":
    customer.mobile = mask_phone(customer.mobile)  # 138****1234
    customer.cost_price = "***"  # 隐藏成本价
```

### 3.2 客户资源池管理

#### 3.2.1 三级资源池架构

```
公海池(公共资源)
  ↓ 部门经理分配
团队池(部门共享)
  ↓ 销售领取
个人池(销售私有)
```

#### 3.2.2 回收规则(4种类型)

| 回收类型 | 触发条件 | 回收目标 | 通知对象 |
|---------|---------|---------|---------|
| 未跟进回收 | 30天无跟进记录 | 个人池→公海 | 销售+主管 |
| 未转化回收 | 90天未转化商机 | 个人池→团队池 | 销售 |
| 低效回收 | 健康度<40且持续下降 | 个人池→公海 | 销售+主管 |
| 超量回收 | 超过保有量限制(初级20/高级30) | 最新客户→公海 | 销售 |

#### 3.2.3 保护期机制

- **分配保护**: 领取客户后7天保护期,不可被回收
- **续约保护**: 合同到期前90天自动保护
- **申诉机制**: 销售可提交保留申请,主管审批

### 3.3 防撞单机制

#### 3.3.1 5维查重引擎

1. **信用代码精确匹配**: 18位统一社会信用代码
2. **公司名称模糊匹配**: Levenshtein相似度 > 80%
3. **手机号查重**: 联系人手机
4. **邮箱查重**: 联系人邮箱
5. **电话查重**: 公司座机

#### 3.3.2 防撞单策略(4种)

| 策略 | 适用场景 | 规则 |
|------|---------|------|
| 先占先得 | 默认策略 | 谁先创建归属谁,30天无跟进可被抢 |
| 活跃优先 | 竞争激烈客户 | 跟进频率高者优先 |
| 联合跟进 | 大客户协作 | 最多3人协作,业绩按比例分成 |
| 主管强制 | 争议仲裁 | 仅主管可执行,需填写原因 |

### 3.4 自动化工作流引擎

#### 3.4.1 触发条件(4种)

```python
1. 时间触发: relative(相对时间)/absolute(绝对时间)/cron(定时)
2. 状态触发: 字段状态变更(如stage=谈判)
3. 行为触发: 特定行为事件(如创建跟进记录)
4. 阈值触发: 数据阈值(如健康度<60)
```

#### 3.4.2 执行动作(6种)

```python
1. 创建任务: 自动生成待办
2. 发送通知: 系统消息/邮件/短信/微信
3. 生成文档: 报价单/合同草稿
4. 更新数据: 自动更新客户字段
5. 升级预警: 超时逐级通知
6. 分配客户: 自动分配线索
```

#### 3.4.3 预置规则模板

- 新客户跟进提醒: 分配后24h无跟进→创建任务
- 保护期预警: 剩余3天/1天→通知销售+主管
- 续约启动提醒: 到期前90/60/30天→创建续约任务
- 健康度下降预警: 下降>10分→通知客户成功
- 高价值线索分配: 评分>80→分配给高级销售
- 超期未跟进回收: 30天无跟进→回收到公海

### 3.5 制造业价格计算器

#### 3.5.1 价格计算公式

```
最终价格 = 面积 × 单价 × 数量 × (1 + 损耗率) + 工艺费用

其中:
- 面积 = 长(cm) × 宽(cm)
- 单价 = 基础单价 × 纸张克重系数 × 印刷色数加成
- 损耗率 = 纸箱5% / 纸袋8% / 彩印3% / 软包装6%
- 工艺费用 = 覆膜 + 烫金 + UV + 压纹 + 模切
```

#### 3.5.2 工艺费用配置

| 工艺 | 单价(元) | 单位 |
|------|---------|------|
| 亮膜 | 0.5 | ㎡ |
| 哑膜 | 0.6 | ㎡ |
| 烫金 | 2.0 | 次 |
| UV | 1.5 | ㎡ |
| 压纹 | 1.2 | ㎡ |
| 模切 | 0.8 | 次 |

### 3.6 健康度评分模型

#### 3.6.1 5维度评分

| 维度 | 权重 | 评估指标 |
|------|------|---------|
| 产品使用频率 | 25% | 登录频率(40%) + 功能使用(30%) + 数据量(30%) |
| 服务交互次数 | 20% | 工单数量(30%) + 反馈响应(35%) + NPS(35%) |
| 支付行为 | 25% | 付款及时性(40%) + 逾期次数(30%) + 付款趋势(30%) |
| 跟进响应率 | 15% | 回复率(50%) + 响应速度(30%) + 互动率(20%) |
| 合作稳定性 | 15% | 合同期限(35%) + 续约历史(35%) + 金额稳定性(30%) |

#### 3.6.2 健康度等级

```
优秀: 80-100分 🟢
良好: 60-79分  🟡
风险: 40-59分  🟠
危险: 0-39分   🔴
```

#### 3.6.3 行动计划对照表

| 场景 | 健康度 | 推荐行动 | 负责人 | 时限 |
|------|-------|---------|-------|------|
| 使用下降 | 下降>10分 | 主动联系了解原因 | 客户成功 | 3天 |
| 付款延迟 | 逾期>7天 | 催款+了解困难 | 销售+财务 | 立即 |
| 互动减少 | 30天无互动 | 安排拜访/电话 | 销售 | 7天 |
| 服务投诉 | NPS<6 | 解决问题+补偿 | 客户成功 | 立即 |
| 合同到期 | 到期前90天 | 启动续约流程 | 销售 | 90天 |
| 健康度<40 | 危险 | 高层介入+定制方案 | 总监 | 立即 |

---

## 四、开发流程规范

### 4.1 分支管理策略

```
main (生产分支,保护)
  ↑
  └── develop (开发分支)
        ↑
        ├── feature/customer-crud (功能分支)
        ├── feature/sales-funnel
        ├── fix/duplicate-check
        └── hotfix/urgent-bug
```

#### 4.1.1 分支命名规范

- **功能分支**: `feature/模块名-功能描述`
- **修复分支**: `fix/问题描述`
- **紧急修复**: `hotfix/问题描述`
- **发布分支**: `release/v1.0.0`

#### 4.1.2 提交信息规范

```
<type>(<scope>): <subject>

type: feat|fix|docs|style|refactor|test|chore
scope: customer|sales|product|contract|ai|system
subject: 简短描述(不超过50字符)

示例:
feat(customer): 添加5维查重引擎
fix(sales): 修复漏斗转化率计算错误
docs(api): 更新客户管理接口文档
```

### 4.2 代码质量标准

#### 4.2.1 Python代码规范

- **格式化工具**: Black + isort
- **代码检查**: Ruff (替代flake8)
- **类型检查**: MyPy
- **文档规范**: Google Style Docstrings

```python
async def create_customer(
    self, 
    data: CustomerCreateSchema,
    user_id: int
) -> Customer:
    """
    创建客户档案
    
    Args:
        data: 客户创建数据
        user_id: 当前用户ID
        
    Returns:
        Customer: 创建的客户对象
        
    Raises:
        DuplicateError: 客户已存在
        PermissionError: 无权限创建
    """
    pass
```

#### 4.2.2 TypeScript代码规范

- **格式化工具**: Prettier
- **代码检查**: ESLint + TypeScript严格模式
- **组件规范**: Vue3 Composition API + `<script setup>`
- **命名规范**: 
  - 组件: PascalCase (CustomerList.vue)
  - 文件: camelCase (customer.ts)
  - 常量: UPPER_SNAKE_CASE (MAX_PAGE_SIZE)

### 4.3 测试规范

#### 4.3.1 测试类型与覆盖率要求

| 测试类型 | 工具 | 覆盖率要求 | 优先级 |
|---------|------|----------|-------|
| 单元测试 | pytest (Python) / Vitest (TS) | > 80% | P0 |
| 集成测试 | httpx (Python) | 核心API 100% | P0 |
| E2E测试 | Playwright | 核心流程100% | P1 |
| 性能测试 | Locust | 关键API < 3秒 | P1 |

#### 4.3.2 测试命名规范

```python
# Python pytest
class TestCustomerService:
    async def test_create_customer_success(self):
        """测试创建客户成功场景"""
        pass
    
    async def test_create_customer_duplicate_error(self):
        """测试创建重复客户返回错误"""
        pass

# TypeScript Vitest
describe('CustomerList', () => {
  it('应该正确渲染客户列表', () => {
    // ...
  })
  
  it('点击删除应该显示确认对话框', async () => {
    // ...
  })
})
```

### 4.4 API设计规范

#### 4.4.1 RESTful API规范

```
GET    /api/v1/customers          # 获取客户列表
GET    /api/v1/customers/{id}     # 获取客户详情
POST   /api/v1/customers          # 创建客户
PUT    /api/v1/customers/{id}     # 更新客户
DELETE /api/v1/customers/{id}     # 删除客户(软删除)
PATCH  /api/v1/customers/{id}/status  # 部分更新

# 批量操作
POST   /api/v1/customers/batch/assign    # 批量分配
POST   /api/v1/customers/batch/export    # 批量导出

# 特殊操作
POST   /api/v1/customers/{id}/claim      # 领取公海客户
POST   /api/v1/customers/{id}/restore    # 恢复删除客户
```

#### 4.4.2 统一响应格式

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "items": [...],
    "total": 100,
    "page": 1,
    "size": 20
  }
}

// 错误响应
{
  "code": 400,
  "message": "客户已存在",
  "details": {
    "duplicate_fields": ["credit_code"],
    "duplicate_customer_id": 123
  }
}
```

### 4.5 数据库设计规范

#### 4.5.1 命名规范

- **表名**: 小写下划线,复数 (customers, orders)
- **字段名**: 小写下划线 (customer_name, created_at)
- **索引名**: `idx_表名_字段名` (idx_customers_owner_id)
- **外键**: `fk_表名_关联表名` (fk_orders_customer_id)

#### 4.5.2 必备字段

```sql
id          SERIAL PRIMARY KEY
created_at  TIMESTAMP DEFAULT NOW()
updated_at  TIMESTAMP DEFAULT NOW()
deleted_at  TIMESTAMP  -- 软删除(可选)
created_by  INT        -- 创建人
updated_by  INT        -- 更新人
```

#### 4.5.3 索引策略

- **主键**: 自动创建B-tree索引
- **外键**: 必须创建索引
- **查询字段**: WHERE/ORDER BY/GROUP BY字段
- **全文检索**: GIN索引 (pg_trgm)
- **向量检索**: HNSW索引 (pgvector)

---

## 五、部署架构

### 5.1 Docker Compose编排

```yaml
version: '3.8'

services:
  # PostgreSQL 数据库
  postgres:
    image: postgres:16
    environment:
      POSTGRES_DB: crm
      POSTGRES_USER: crm
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  # Redis 缓存
  redis:
    image: redis:7.4
    volumes:
      - redis_data:/data
    ports:
      - "6379:6379"

  # FastAPI 后端
  backend:
    build: ./crm-backend
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql+asyncpg://crm:${DB_PASSWORD}@postgres:5432/crm
      - REDIS_URL=redis://redis:6379/0
      - OPENAI_API_KEY=${OPENAI_API_KEY}
    depends_on:
      - postgres
      - redis
    volumes:
      - ./crm-backend:/app
    command: uvicorn app.main:app --reload --host 0.0.0.0

  # Vue3 前端
  frontend:
    build: ./crm-web
    ports:
      - "80:80"
    depends_on:
      - backend

  # n8n 工作流引擎
  n8n:
    image: n8nio/n8n:latest
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      - backend

  # Nginx 反向代理(生产)
  nginx:
    image: nginx:1.27
    ports:
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - frontend
      - backend

volumes:
  postgres_data:
  redis_data:
  n8n_data:
```

### 5.2 环境变量管理

```bash
# .env.example (不要提交真实值)

# 数据库
DB_PASSWORD=your_secure_password
DATABASE_URL=postgresql+asyncpg://crm:${DB_PASSWORD}@localhost:5432/crm

# Redis
REDIS_URL=redis://localhost:6379/0

# JWT
SECRET_KEY=your_secret_key_min_32_chars
ACCESS_TOKEN_EXPIRE_MINUTES=30
REFRESH_TOKEN_EXPIRE_DAYS=7

# OpenAI (AI功能)
OPENAI_API_KEY=sk-xxx
OPENAI_MODEL=gpt-4

# n8n
N8N_USER=admin
N8N_PASSWORD=your_n8n_password

# 邮件 (通知服务)
SMTP_HOST=smtp.example.com
SMTP_PORT=587
SMTP_USER=noreply@example.com
SMTP_PASSWORD=your_smtp_password

# 第三方API
QICHACHA_API_KEY=xxx  # 企查查
ALIYUN_SMS_KEY=xxx    # 阿里云短信
```

### 5.3 部署流程

```bash
# 1. 克隆项目
git clone <repo-url>
cd crm-project

# 2. 配置环境变量
cp .env.example .env
# 编辑 .env 填入真实值

# 3. 启动所有服务
docker-compose up -d

# 4. 执行数据库迁移
docker-compose exec backend alembic upgrade head

# 5. 初始化基础数据
docker-compose exec backend python -m app.scripts.init_data

# 6. 检查服务状态
docker-compose ps

# 7. 查看日志
docker-compose logs -f backend

# 停止服务
docker-compose down

# 清理数据(谨慎!)
docker-compose down -v
```

---

## 六、开发阶段规划

### 6.1 第一阶段:核心功能 (Day 1-25)

**目标**: 完成基础CRUD + 权限 + 客户管理 + 销售管理

| 模块 | 天数 | 核心任务 | 验收标准 |
|------|:----:|---------|---------|
| 项目初始化 | 2天 | 骨架搭建、数据库、Docker | 服务正常启动 |
| 权限体系 | 3天 | RBAC、JWT、数据权限 | 多角色登录验证 |
| 客户管理 | 7天 | 档案CRUD、查重、资源池 | 完整客户流转 |
| 销售管理 | 6天 | 漏斗、跟进、自动化 | 漏斗可视化 |
| 产品管理 | 4天 | 分类、SKU、价格 | 价格计算器 |
| 测试修复 | 3天 | 单元测试、集成测试 | 覆盖率>80% |

### 6.2 第二阶段:业务闭环 (Day 26-40)

**目标**: 完成商务合同 + 营销服务 + 客户成功 + 报表

| 模块 | 天数 | 核心任务 | 验收标准 |
|------|:----:|---------|---------|
| 商务合同 | 6天 | 报价单、合同、订单、交付 | 完整商务流程 |
| 营销服务 | 4天 | 活动、线索、培育 | 线索转化闭环 |
| 客户成功 | 4天 | 健康度、续约、满意度 | 风险预警 |
| 数据报表 | 4天 | 漏斗、转化、回款 | ECharts可视化 |
| 测试修复 | 2天 | 全流程E2E测试 | 核心流程100% |

### 6.3 第三阶段:智能化与优化 (Day 41-50)

**目标**: AI功能 + 系统集成 + 性能优化

| 模块 | 天数 | 核心任务 | 验收标准 |
|------|:----:|---------|---------|
| AI智能 | 5天 | 画像、标签、推荐 | 推荐准确率>70% |
| 系统集成 | 3天 | n8n、WebSocket、通知 | 实时推送 |
| 性能优化 | 2天 | 索引优化、缓存 | API<2秒 |
| 文档部署 | 2天 | 用户手册、生产部署 | 一键部署 |
| UAT测试 | 3天 | 用户验收、Bug修复 | 无P0 Bug |

---

## 七、质量保证

### 7.1 代码审查规范

#### 7.1.1 审查清单

- [ ] 代码逻辑正确,无边界条件遗漏
- [ ] 异常处理完善,不会导致服务崩溃
- [ ] 数据库查询有索引,无N+1问题
- [ ] 敏感信息不硬编码,不入库
- [ ] API响应格式统一
- [ ] 单元测试覆盖率>80%
- [ ] 代码注释清晰,复杂逻辑有说明

#### 7.1.2 审查流程

```
开发者提交PR
  ↓
CI自动运行测试(必须通过)
  ↓
至少1名团队成员审查
  ↓
修改审查意见
  ↓
合并到develop分支
```

### 7.2 性能标准

| 指标 | 标准 | 测试方法 |
|------|------|---------|
| API响应时间 | < 2秒(95%) | Locust压测 |
| 页面加载时间 | < 3秒 | Chrome DevTools |
| 数据库查询 | < 1秒(99%) | EXPLAIN ANALYZE |
| 并发用户数 | 100+ | Locust场景测试 |
| 内存使用 | < 512MB(后端) | Docker stats |

### 7.3 安全标准

- [ ] SQL注入防护(参数化查询)
- [ ] XSS防护(前端转义)
- [ ] CSRF防护(Token验证)
- [ ] 密码加密(bcrypt, 12轮)
- [ ] JWT过期刷新机制
- [ ] 登录失败锁定(5次/15分钟)
- [ ] 敏感字段脱敏(手机号、邮箱)
- [ ] API请求限流(slowapi)
- [ ] 操作日志审计(不可删除)

---

## 八、风险控制

### 8.1 技术风险

| 风险 | 影响 | 概率 | 应对措施 |
|------|------|------|---------|
| AI API不稳定 | AI功能不可用 | 中 | 降级到规则引擎 |
| 数据库性能瓶颈 | 系统变慢 | 低 | 提前压测,优化索引 |
| 第三方服务限流 | 工商查询失败 | 中 | 缓存24小时,设置上限 |
| 学习曲线陡峭 | 开发延期 | 中 | 提供代码模板,结对编程 |

### 8.2 业务风险

| 风险 | 影响 | 概率 | 应对措施 |
|------|------|------|---------|
| 需求变更 | 返工 | 高 | 需求冻结,变更审批 |
| 数据迁移失败 | 上线延期 | 低 | 提前演练,回滚方案 |
| 用户不接受 | 系统闲置 | 中 | UAT测试,培训 |

### 8.3 应急预案

```
P0级Bug(系统崩溃):
  1. 立即回滚到上一版本
  2. 24小时内修复
  3. 回归测试后重新上线

数据丢失:
  1. 从最近备份恢复(每日自动备份)
  2. 评估数据损失
  3. 手动补充丢失数据

性能骤降:
  1. 检查慢查询日志
  2. 临时增加缓存
  3. 优化问题SQL
```

---

## 九、团队协作规范

### 9.1 沟通机制

- **每日站会**: 9:30 AM, 15分钟, 同步进度/阻塞
- **周评审**: 周五下午, 演示本周成果
- **需求讨论**: 随时, 钉钉/企业微信群
- **代码审查**: PR提交后24小时内完成

### 9.2 文档管理

| 文档类型 | 位置 | 更新频率 | 负责人 |
|---------|------|---------|-------|
| 产品需求 | docs/01-核心产品文档 | 需求变更时 | 产品经理 |
| 技术架构 | docs/02-技术架构 | 架构调整时 | 技术负责人 |
| API文档 | /docs (Swagger) | 接口变更时 | 开发者 |
| 用户手册 | docs/04-用户文档 | 功能上线后 | 技术写作 |
| 部署文档 | docs/03-部署运维 | 部署流程变更时 | 运维 |

### 9.3 任务管理

- **任务分配**: 基于任务清单分配责任人
- **进度追踪**: 每日更新任务状态(Pending/In Progress/Complete)
- **阻塞上报**: 超过4小时未解决立即上报
- **完成标准**: 代码合并 + 测试通过 + 文档更新

---

## 十、成功度量

### 10.1 技术指标

- [ ] API响应时间 < 2秒
- [ ] 测试覆盖率 > 80%
- [ ] 零P0级Bug上线
- [ ] 系统可用性 > 99.5%
- [ ] 数据备份成功率 100%

### 10.2 业务指标

- [ ] 客户跟进及时率 > 90%
- [ ] 客户数据完整度 > 95%
- [ ] 销售漏斗转化率提升 > 20%
- [ ] 客户续约率 > 80%
- [ ] 用户满意度 > 4.5/5.0

### 10.3 团队指标

- [ ] 按期交付率 > 90%
- [ ] 代码审查通过率 > 85%
- [ ] 需求变更率 < 10%
- [ ] 团队成员满意度 > 4.0/5.0

---

## 附录

### A. 参考资料

- [vue-fastapi-admin官方文档](https://github.com/mizhexiaoxiao/vue-fastapi-admin)
- [FastAPI官方文档](https://fastapi.tiangolo.com/)
- [Vue3官方文档](https://cn.vuejs.org/)
- [ElementPlus官方文档](https://element-plus.org/)
- [SQLAlchemy 2.0文档](https://docs.sqlalchemy.org/)

### B. 核心文档

- `00CRM功能模块业务逻辑补充方案.md` - 业务逻辑详细实现
- `01-CRM产品核心功能清单.md` - 功能需求清单
- `02CRM核心功能模块任务清单.md` - 1200+开发任务
- `01CRM系统技术选型与开发指南.md` - 技术架构与代码模板

### C. 版本历史

| 版本 | 日期 | 变更内容 | 作者 |
|------|------|---------|------|
| v1.0 | 2026-04-15 | 初始版本,整合4份核心文档 | AI Assistant |

---

**文档审批**:

| 角色 | 姓名 | 签字 | 日期 |
|------|------|------|------|
| 产品经理 | | | |
| 技术负责人 | | | |
| 项目经理 | | | |

---

**⚠️ 注意事项**:
1. 本文档为开发最高指导原则,任何偏离需经过审批
2. 所有开发任务必须严格遵守`02CRM核心功能模块任务清单.md`
3. 技术栈选型不可随意更改,确需变更需提交技术评审
4. 代码质量标准必须严格执行,CI检查不通过禁止合并
5. 定期回顾本文档,根据实际情况优化调整
