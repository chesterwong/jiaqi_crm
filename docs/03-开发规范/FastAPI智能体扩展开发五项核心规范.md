# FastAPI智能体扩展开发五项核心规范

> 创建日期: 2026-04-14  
> 文档版本: v1.0  
> 状态: ✅ 强制执行  
> 适用范围: CRM系统所有后端模块开发

---

## 📋 规范概述

在使用智能体(Agent)开发CRM系统功能模块时,**必须严格遵循**以下5项核心原则,以最大化利用FastApiAdmin框架现有能力:

| 序号 | 核心原则 | 关键价值 | 强制级别 |
|------|---------|---------|---------|
| 1 | 模块化设计 | 智能体精准识别调用边界 | 🔴 P0强制 |
| 2 | 统一接口规范 | 智能体自动解析API | 🔴 P0强制 |
| 3 | 依赖注入与配置管理 | 提高复用性和可测试性 | 🔴 P0强制 |
| 4 | 自动化文档生成 | 智能体自学API用途 | 🔴 P0强制 |
| 5 | 中间件机制 | 增强安全与可观测性 | 🟡 P1强制 |

---

## 一、模块化设计规范

### 1.1 按业务特性分包(强制)

**原则**: 每个CRM业务模块完全独立,采用竖切(Vertical Slice)架构。

```
crm-fastapi/backend/app/api/v1/
├── module_system/        # ✅ 框架已有 - 系统管理
├── module_crm/           # 🆕 CRM核心业务
│   ├── customer/         # 客户管理(独立模块)
│   │   ├── controller.py # API路由层
│   │   ├── service.py    # 业务逻辑层
│   │   ├── crud.py       # 数据库操作层
│   │   ├── model.py      # SQLAlchemy模型
│   │   └── schema.py     # Pydantic验证
│   ├── opportunity/      # 商机管理(独立模块)
│   ├── follow_up/        # 跟进记录(独立模块)
│   ├── quote/            # 报价单(独立模块)
│   ├── contract/         # 合同(独立模块)
│   ├── payment/          # 付款(独立模块)
│   ├── marketing/        # 营销(独立模块)
│   └── success/          # 客户成功(独立模块)
└── module_ai/            # ✅ 框架已有 - AI智能体
```

### 1.2 模块独立性要求

**✅ 必须做到**:
- 每个模块的`model.py`只定义本模块的数据模型
- 每个模块的`service.py`只处理本模块的业务逻辑
- 跨模块调用必须通过`service`层,禁止直接调用`crud`层
- 模块间依赖通过依赖注入(Depends)传递

**❌ 严格禁止**:
```python
# ❌ 错误: 跨模块直接调用CRUD层
from app.api.v1.module_crm.customer.crud import CustomerCRUD

async def get_customer_orders():
    customers = await CustomerCRUD.list_all()  # ❌ 禁止!
    return await OrderCRUD.filter(customer_ids=[c.id for c in customers])

# ✅ 正确: 通过Service层调用
from app.api.v1.module_crm.customer.service import CustomerService

async def get_customer_orders():
    customers = await CustomerService.list_with_orders()  # ✅ 通过Service
    return customers
```

### 1.3 智能体调用边界

智能体开发时,必须明确模块边界:

```python
# module_ai/agent/crm_agent.py
from agno.agent import Agent

class CRMAgent:
    """CRM业务智能体"""
    
    def __init__(self):
        self.agent = Agent(
            name="CRM业务专家",
            tools=[
                # 智能体只能调用公开的Controller API
                FastAPITools(base_url="http://localhost:8001/api/v1"),
            ],
        )
    
    async def analyze_customer(self, customer_id: int):
        """分析客户画像(智能体自动调用CRM模块API)"""
        # ✅ 只能调用公开的REST API
        # GET /api/v1/crm/customer/{customer_id}
        # GET /api/v1/crm/customer/{customer_id}/follow-ups
        # GET /api/v1/crm/customer/{customer_id}/contracts
        pass
```

---

## 二、统一接口规范

### 2.1 RESTful标准(强制)

**必须使用标准HTTP方法**:

| HTTP方法 | 用途 | 状态码 | 幂等性 |
|---------|------|--------|--------|
| `GET` | 查询资源 | 200 | ✅ 是 |
| `POST` | 创建资源 | 201 | ❌ 否 |
| `PUT` | 全量更新 | 200 | ✅ 是 |
| `PATCH` | 部分更新 | 200 | ❌ 否 |
| `DELETE` | 删除资源 | 204 | ✅ 是 |

### 2.2 路由设计规范

```python
# module_crm/customer/controller.py
from fastapi import APIRouter, Depends
from app.common.response import ResponseModel

router = APIRouter(prefix="/crm/customer", tags=["客户管理"])

# ✅ 标准路由设计
@router.get("", status_code=200, summary="获取客户列表")
async def list_customers(page: int = 1, page_size: int = 20):
    """获取客户列表(支持分页)"""
    pass

@router.post("", status_code=201, summary="创建客户")
async def create_customer(data: CustomerCreate):
    """创建新客户"""
    pass

@router.get("/{customer_id}", status_code=200, summary="获取客户详情")
async def get_customer(customer_id: int):
    """获取单个客户详细信息"""
    pass

@router.put("/{customer_id}", status_code=200, summary="更新客户")
async def update_customer(customer_id: int, data: CustomerUpdate):
    """全量更新客户信息"""
    pass

@router.patch("/{customer_id}/level", status_code=200, summary="更新客户等级")
async def update_level(customer_id: int, level: str):
    """部分更新客户等级"""
    pass

@router.delete("/{customer_id}", status_code=204, summary="删除客户")
async def delete_customer(customer_id: int):
    """软删除客户"""
    pass
```

### 2.3 统一响应格式(强制)

**所有API必须使用框架的`ResponseModel`**:

```python
# 成功响应(单条数据)
{
    "code": 200,
    "msg": "成功",
    "data": {
        "id": 1,
        "name": "某某纸业",
        "customer_level": "A"
    }
}

# 成功响应(列表分页)
{
    "code": 200,
    "msg": "成功",
    "data": {
        "page": 1,
        "page_size": 20,
        "total": 100,
        "items": [...]
    }
}

# 错误响应
{
    "code": 404,
    "msg": "客户不存在",
    "data": null
}

# 参数验证错误
{
    "code": 422,
    "msg": "参数验证失败",
    "data": {
        "errors": [
            {
                "field": "name",
                "message": "客户名称不能为空"
            }
        ]
    }
}
```

### 2.4 错误码规范

```python
# CRM业务错误码范围: 5000-5999
CRM_ERROR_CODES = {
    5001: "客户不存在",
    5002: "客户已被删除",
    5003: "客户等级无效",
    5004: "客户不在个人资源池",
    5005: "客户仍在保护期",
    5006: "无权操作该客户",
    5007: "客户联系人超过上限",
    # ...
}

# 使用示例
from app.common.exception_handler import CustomException

raise CustomException(
    msg="客户不存在",
    code=5001,
    status_code=404
)
```

---

## 三、依赖注入与配置管理规范

### 3.1 数据库依赖注入(强制)

```python
# app/api/deps.py (框架已有,必须使用)
from sqlalchemy.ext.asyncio import AsyncSession
from typing import AsyncGenerator

async def get_db() -> AsyncGenerator[AsyncSession, None]:
    """数据库会话依赖注入"""
    async with async_session() as session:
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise

# CRM模块使用
@router.get("/customers")
async def list_customers(
    db: AsyncSession = Depends(get_db),  # ✅ 必须使用依赖注入
    current_user: User = Depends(get_current_user)
):
    pass
```

### 3.2 权限依赖注入

```python
# 数据权限依赖注入(必须使用)
def require_data_permission(scope: str):
    """数据权限装饰器"""
    async def permission_checker(
        current_user: User = Depends(get_current_user),
        db: AsyncSession = Depends(get_db)
    ):
        if scope == "personal":
            return current_user
        elif scope == "department":
            dept_ids = await get_subordinate_dept_ids(current_user.dept_id)
            current_user.scope_dept_ids = dept_ids
            return current_user
        elif scope == "company":
            return current_user
        raise CustomException(msg="权限不足", code=4003, status_code=403)
    return permission_checker

# CRM模块使用
@router.get("/pool/personal")
@require_data_permission(scope="personal")  # ✅ 依赖注入权限
async def get_personal_pool(
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    pass
```

### 3.3 配置管理规范

**所有配置必须通过`Settings`类管理**:

```python
# app/config/settings.py
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    """统一配置管理"""
    # 服务器配置
    SERVER_HOST: str = "0.0.0.0"
    SERVER_PORT: int = 8001
    
    # 数据库配置
    DATABASE_URL: str = "postgresql+asyncpg://crm_user:password@postgres:5432/crm_db"
    REDIS_URL: str = "redis://redis:6379/0"
    
    # CRM业务配置(必须在这里定义)
    CUSTOMER_PROTECT_DAYS: int = 7        # 资源池保护期
    CUSTOMER_RECYCLE_DAYS: int = 30       # 无跟进回收天数
    FOLLOW_UP_REMIND_A: int = 3           # A类客户跟进间隔
    FOLLOW_UP_REMIND_B: int = 7           # B类客户跟进间隔
    FOLLOW_UP_REMIND_C: int = 15          # C类客户跟进间隔
    
    class Config:
        env_file = "env/.env.dev"

settings = Settings()

# CRM模块使用
from app.config.settings import settings

if days_without_follow_up > settings.CUSTOMER_RECYCLE_DAYS:
    await recycle_customer(customer_id)
```

### 3.4 环境变量管理

```bash
# env/.env.dev (开发环境)
DATABASE_URL=postgresql+asyncpg://crm_user:CrmUser@2026@localhost:5432/crm_db
REDIS_URL=redis://localhost:6379/0
CUSTOMER_RECYCLE_DAYS=30

# env/.env.prod (生产环境)
DATABASE_URL=postgresql+asyncpg://crm_user:${DB_PASSWORD}@prod-db:5432/crm_db
REDIS_URL=redis://prod-redis:6379/0
CUSTOMER_RECYCLE_DAYS=30
```

---

## 四、自动化文档生成规范

### 4.1 OpenAPI文档自动生成(强制)

**FastAPI自动生成文档,无需手动编写**:

```
启动后端服务后可用:
- Swagger UI: http://localhost:8001/docs
- ReDoc:      http://localhost:8001/redoc
- OpenAPI JSON: http://localhost:8001/openapi.json
```

### 4.2 接口描述规范

**每个API必须提供清晰的描述**:

```python
@router.post(
    "",
    status_code=201,
    summary="创建客户",
    description="创建新客户并自动分配至个人资源池",
    responses={
        201: {"description": "创建成功"},
        400: {"description": "参数错误"},
        403: {"description": "权限不足"},
        409: {"description": "客户已存在(统一社会信用代码重复)"}
    }
)
async def create_customer(
    data: CustomerCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    创建客户
    
    - **name**: 客户名称(必填,最长255字符)
    - **credit_code**: 统一社会信用代码(可选,18位)
    - **customer_level**: 客户等级(A/B/C,默认C)
    - **industry**: 行业分类(字典值)
    - **source**: 客户来源(字典值)
    """
    pass
```

### 4.3 数据模型文档

**Pydantic Schema必须提供字段描述**:

```python
from pydantic import BaseModel, Field

class CustomerCreate(BaseModel):
    """创建客户请求体"""
    
    name: str = Field(
        ...,
        min_length=1,
        max_length=255,
        description="客户名称",
        examples=["某某纸业有限公司"]
    )
    
    credit_code: str | None = Field(
        None,
        pattern=r"^[0-9A-Z]{18}$",
        description="统一社会信用代码(18位)",
        examples=["91330000MA2XXXXXXXXX"]
    )
    
    customer_level: str = Field(
        default="C",
        pattern=r"^[ABC]$",
        description="客户等级(A/B/C)",
        examples=["C"]
    )
    
    industry: str | None = Field(
        None,
        description="行业分类(字典值)",
        examples=["制造业"]
    )
```

### 4.4 智能体自动解析API文档

```python
# module_ai/agent/api_explorer.py
import httpx

class APIExplorerAgent:
    """API探索智能体(自动学习所有CRM API)"""
    
    def __init__(self):
        self.base_url = "http://localhost:8001"
    
    async def discover_apis(self):
        """自动发现并理解所有CRM API"""
        # 1. 获取OpenAPI文档
        async with httpx.AsyncClient() as client:
            response = await client.get(f"{self.base_url}/openapi.json")
            openapi_spec = response.json()
        
        # 2. 解析CRM模块API
        paths = openapi_spec.get("paths", {})
        crm_apis = []
        
        for path, methods in paths.items():
            if "/crm/" in path:
                for method, details in methods.items():
                    crm_apis.append({
                        "path": path,
                        "method": method.upper(),
                        "summary": details.get("summary"),
                        "description": details.get("description"),
                        "parameters": details.get("parameters", []),
                        "responses": details.get("responses", {}),
                    })
        
        return crm_apis

# 使用示例
explorer = APIExplorerAgent()
crm_apis = await explorer.discover_apis()
# 智能体自动学习: API路径、用途、参数、返回值
```

---

## 五、中间件机制规范

### 5.1 认证中间件(框架已有,必须使用)

```python
# app/core/middlewares.py (框架已有)
from starlette.middleware.base import BaseHTTPMiddleware

class AuthMiddleware(BaseHTTPMiddleware):
    """认证中间件"""
    async def dispatch(self, request, call_next):
        # 1. 验证Token
        token = request.headers.get("Authorization")
        if not token:
            return JSONResponse(status_code=401, content={"msg": "未认证"})
        
        # 2. 验证权限
        user = await verify_token(token)
        if not user:
            return JSONResponse(status_code=401, content={"msg": "Token无效"})
        
        # 3. 设置请求上下文
        request.state.user = user
        
        response = await call_next(request)
        return response
```

### 5.2 日志记录中间件(必须使用)

```python
import logging
import time

class LoggingMiddleware(BaseHTTPMiddleware):
    """请求日志中间件"""
    async def dispatch(self, request, call_next):
        start_time = time.time()
        
        # 记录请求
        logging.info(
            f"请求开始: {request.method} {request.url.path} | "
            f"IP: {request.client.host} | "
            f"用户: {getattr(request.state, 'user', 'anonymous')}"
        )
        
        response = await call_next(request)
        
        # 记录响应
        process_time = time.time() - start_time
        logging.info(
            f"请求完成: {request.method} {request.url.path} | "
            f"状态码: {response.status_code} | "
            f"耗时: {process_time:.3f}s"
        )
        
        return response
```

### 5.3 CRM审计日志中间件(必须实现)

```python
class CRMAuditMiddleware(BaseHTTPMiddleware):
    """CRM操作审计中间件"""
    async def dispatch(self, request, call_next):
        # 只对CRM写操作记录审计日志
        if request.url.path.startswith("/api/v1/crm/") and \
           request.method in ["POST", "PUT", "PATCH", "DELETE"]:
            
            # 记录操作前状态
            audit_log = {
                "user_id": request.state.user.id,
                "action": request.method,
                "path": request.url.path,
                "timestamp": datetime.now(),
                "ip": request.client.host,
            }
            
            response = await call_next(request)
            
            # 记录操作后结果
            audit_log["status_code"] = response.status_code
            
            # 异步写入审计日志表
            await AuditLogCRUD.create(audit_log)
            
            return response
        
        return await call_next(request)
```

### 5.4 注册中间件(顺序重要!)

```python
# app/main.py
from fastapi import FastAPI
from app.core.middlewares import AuthMiddleware, LoggingMiddleware, CRMAuditMiddleware

app = FastAPI()

# 注册中间件(顺序重要!)
app.add_middleware(LoggingMiddleware)       # 1. 请求日志(最外层)
app.add_middleware(AuthMiddleware)          # 2. 认证(第二层)
app.add_middleware(CRMAuditMiddleware)      # 3. 审计日志(最内层)

# 注册路由
from app.api.v1 import module_crm
app.include_router(module_crm.router, prefix="/api/v1")
```

---

## 六、智能体开发CRM模块标准流程

### 流程1: 使用代码生成器搭建基础(节省60%工作量)

```bash
# 1. 设计数据库表
CREATE TABLE crm_customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    credit_code VARCHAR(18) UNIQUE,
    customer_level VARCHAR(1) DEFAULT 'C',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

# 2. 登录FastApiAdmin后台 → 开发工具 → 代码生成
# 3. 导入crm_customer表 → 一键生成
# 4. 解压到项目目录: crm-fastapi/backend/app/api/v1/module_crm/customer/
# 5. 重启服务: docker restart crm-backend
```

### 流程2: 智能体扩展业务逻辑(专注30%核心逻辑)

```python
# module_crm/customer/service.py
# 智能体生成的业务逻辑扩展

class CustomerService:
    @staticmethod
    async def recycle_to_public_pool(db: AsyncSession, customer_id: int):
        """回收客户到公海池(智能体自动实现业务规则)"""
        customer = await CustomerCRUD.get(db, customer_id)
        if not customer:
            raise CustomException(msg="客户不存在", code=5001)
        
        # 业务规则: 30天无跟进自动回收
        last_follow_up = await FollowUpCRUD.get_latest(db, customer_id)
        if last_follow_up:
            days_since = (datetime.now() - last_follow_up.created_at).days
            if days_since < settings.CUSTOMER_RECYCLE_DAYS:
                remaining = settings.CUSTOMER_RECYCLE_DAYS - days_since
                raise CustomException(msg=f"客户仍在保护期,剩余{remaining}天", code=5005)
        
        # 执行回收
        customer.pool = "public"
        customer.owner_id = None
        await db.commit()
        
        # 记录流转历史
        await PoolRecordCRUD.create(db, {
            "customer_id": customer_id,
            "action": "recycle",
            "from_pool": "personal",
            "to_pool": "public",
            "reason": f"{settings.CUSTOMER_RECYCLE_DAYS}天无跟进自动回收"
        })
        
        return customer
```

### 流程3: 智能体自动生成测试(必须)

```python
# tests/test_crm_customer.py
# 智能体生成的单元测试

import pytest
from httpx import AsyncClient

@pytest.mark.asyncio
async def test_create_customer():
    """测试创建客户"""
    async with AsyncClient(base_url="http://localhost:8001") as client:
        response = await client.post(
            "/api/v1/crm/customer",
            json={
                "name": "测试客户",
                "credit_code": "91330000XXXXXXXXXX",
                "customer_level": "C"
            },
            headers={"Authorization": "Bearer test-token"}
        )
        assert response.status_code == 201
        data = response.json()
        assert data["code"] == 200
        assert data["data"]["name"] == "测试客户"

@pytest.mark.asyncio
async def test_recycle_customer():
    """测试客户回收"""
    async with AsyncClient(base_url="http://localhost:8001") as client:
        # 创建测试客户
        create_resp = await client.post("/api/v1/crm/customer", json={...})
        customer_id = create_resp.json()["data"]["id"]
        
        # 模拟30天后
        await simulate_days_pass(30)
        
        # 触发回收
        response = await client.post(
            f"/api/v1/crm/customer/{customer_id}/recycle",
            headers={"Authorization": "Bearer test-token"}
        )
        assert response.status_code == 200
```

---

## 七、代码审查清单

**开发完成后必须逐项检查**:

### 7.1 模块化检查

- [ ] 模块目录结构符合规范(`module_crm/customer/`)
- [ ] `model.py`只定义本模块数据模型
- [ ] `service.py`只处理本模块业务逻辑
- [ ] 跨模块调用通过Service层,未直接调用CRUD
- [ ] 模块间依赖通过Depends注入

### 7.2 接口规范检查

- [ ] 使用标准HTTP方法(GET/POST/PUT/PATCH/DELETE)
- [ ] 使用正确状态码(200/201/204/400/404/500)
- [ ] 所有API使用`ResponseModel`统一响应格式
- [ ] 路由提供`summary`和`description`
- [ ] Pydantic Schema提供`Field`描述和`examples`

### 7.3 依赖注入检查

- [ ] 数据库会话使用`Depends(get_db)`
- [ ] 当前用户通过`Depends(get_current_user)`
- [ ] 权限校验使用`Depends(require_data_permission)`
- [ ] 配置通过`settings.XXX`读取,未硬编码

### 7.4 文档检查

- [ ] 访问`http://localhost:8001/docs`可正常显示
- [ ] 所有API有清晰的`summary`和`description`
- [ ] 请求体/响应体Schema有字段描述
- [ ] 错误响应有文档说明

### 7.5 中间件检查

- [ ] 认证中间件已生效(未登录返回401)
- [ ] 日志中间件记录请求/响应日志
- [ ] 审计日志中间件记录CRM写操作
- [ ] 中间件注册顺序正确

---

## 八、违规处理

**发现以下违规行为,必须立即修正**:

| 违规行为 | 严重级别 | 修正方案 |
|---------|---------|---------|
| 跨模块直接调用CRUD层 | 🔴 严重 | 改为通过Service层调用 |
| 未使用统一响应格式 | 🔴 严重 | 改用`ResponseModel` |
| 硬编码配置值 | 🟡 中等 | 移至`Settings`类 |
| 接口缺少文档描述 | 🟡 中等 | 补充`summary`/`description` |
| 未使用依赖注入 | 🟡 中等 | 改用`Depends`系统 |
| 未提供字段描述 | 🟢 轻微 | 补充Pydantic `Field`描述 |

---

## 九、总结

| 核心原则 | FastAPI能力 | CRM落地方案 | 智能体收益 |
|---------|-----------|-----------|----------|
| **模块化设计** | 按业务分包 | 9大CRM子模块独立 | 精准识别调用边界 |
| **统一接口** | RESTful+状态码 | 标准CRUD+业务API | 自动解析参数/返回值 |
| **依赖注入** | Depends系统 | 数据库/权限/配置注入 | 理解模块依赖关系 |
| **自动文档** | OpenAPI/Swagger | /docs自动生成 | 自学API用途 |
| **中间件** | Starlette中间件 | 认证/日志/审计 | 了解安全/观测机制 |

**核心优势**: 遵循这5项原则,智能体开发CRM模块时:
- ✅ **70%代码可自动生成**(代码生成器)
- ✅ **智能体自动理解API用途**(OpenAPI文档)
- ✅ **智能体自动调用正确接口**(统一规范)
- ✅ **专注30%核心业务逻辑**(高效开发)

---

## 附录: 快速参考

### A. CRM模块创建模板

```bash
# 1. 创建模块目录
mkdir -p crm-fastapi/backend/app/api/v1/module_crm/{模块名}

# 2. 创建文件
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/__init__.py
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/controller.py
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/service.py
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/crud.py
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/model.py
touch crm-fastapi/backend/app/api/v1/module_crm/{模块名}/schema.py

# 3. 注册路由(在module_crm/__init__.py中)
from .{模块名}.controller import router as {模块名}_router
router.include_router({模块名}_router)

# 4. 重启服务
docker restart crm-backend
```

### B. 智能体工具推荐

- **代码生成**: FastApiAdmin代码生成器
- **API探索**: `/docs` (Swagger UI)
- **测试生成**: `test-generator` 技能
- **质量检查**: `code-quality-checker` 技能
- **错误处理**: `error-handling-standard` 技能
