# CRM系统 FastApiAdmin框架开发配合规范

> **创建日期**: 2026-04-15  
> **适用对象**: 所有开发人员 + AI智能体  
> **强制等级**: ⭐⭐⭐⭐⭐ (必须100%遵守)  

---

## 📦 一、当前技术栈完整清单

### 1.1 后端技术栈

| 技术 | 版本 | 用途 | 状态 |
|------|------|------|------|
| **Python** | 3.12 | 编程语言 | ✅ 已确定 |
| **FastAPI** | 0.115+ | Web框架 | ✅ 已确定 |
| **SQLAlchemy** | 2.0 | 异步ORM | ✅ 已确定 |
| **Pydantic** | 2.0 | 数据验证 | ✅ 已确定 |
| **Alembic** | 最新 | 数据库迁移 | ✅ 已确定 |
| **asyncpg** | 最新 | PostgreSQL异步驱动 | ✅ 已确定 |
| **Redis** | 7.x | 缓存/Session/消息队列 | ✅ 已确定 |
| **PostgreSQL** | 16 | 主数据库 | ✅ 已确定 |
| **python-jose** | 最新 | JWT认证 | ✅ 已确定 |
| **passlib[bcrypt]** | 最新 | 密码加密 | ✅ 已确定 |
| **APScheduler** | 3.10+ | 定时任务 | ✅ 已确定 |
| **LangChain** | 0.3+ | AI框架 | ✅ 已确定 |
| **n8n** | 最新 | 工作流引擎 | ✅ 已确定 |
| **uv** | 最新 | Python依赖管理 | ✅ 已确定 |

### 1.2 前端技术栈

| 技术 | 版本 | 用途 | 状态 |
|------|------|------|------|
| **Vue3** | 3.4+ | 前端框架 | ✅ 已确定 |
| **TypeScript** | 5.3+ | 类型系统 | ✅ 已确定 |
| **Vite** | 5.x | 构建工具 | ✅ 已确定 |
| **Element Plus** | 2.5+ | UI组件库 | ✅ 已确定 |
| **Pinia** | 2.1+ | 状态管理 | ✅ 已确定 |
| **Vue Router** | 4.x | 路由管理 | ✅ 已确定 |
| **Axios** | 1.6+ | HTTP客户端 | ✅ 已确定 |
| **ECharts** | 5.4+ | 数据可视化 | ✅ 已确定 |
| **pnpm** | 8.x | 包管理器 | ✅ 已确定 |

### 1.3 基础框架

| 框架 | 版本 | 用途 | 仓库 |
|------|------|------|------|
| **vue-fastapi-admin** | 最新 | 前后端分离脚手架 | https://github.com/mizhexiaoxiao/vue-fastapi-admin |

---

## 🎯 二、FastApiAdmin框架核心认知

### 2.1 框架定位

**vue-fastapi-admin** 是一个**企业级中后台快速开发平台**,提供:

✅ **已内置功能**:
- RBAC权限系统(用户/角色/菜单/权限)
- JWT双Token认证
- 操作日志记录
- 数据字典管理
- 部门管理
- 文件上传
- 系统配置

✅ **我们不需要重复开发**:
- ❌ 登录页面 (已有)
- ❌ 权限系统 (已有)
- ❌ 菜单管理 (已有)
- ❌ 用户管理基础CRUD (已有)
- ❌ 角色管理 (已有)

✅ **我们需要在此基础上开发**:
- ✅ 客户管理模块
- ✅ 销售管理模块
- ✅ 产品管理模块
- ✅ 营销服务模块
- ✅ 客户成功模块
- ✅ 商务合同模块
- ✅ AI智能模块
- ✅ 数据报表模块

---

## 🚀 三、开发配合策略 (核心!)

### 3.1 代码生成策略

#### 策略1: 使用框架代码生成器 (推荐用于标准CRUD)

**适用场景**:
- 标准增删改查页面
- 列表+表单+详情
- 无复杂业务逻辑

**生成内容**:
```
后端:
- models/xxx.py (SQLAlchemy模型)
- schemas/xxx.py (Pydantic验证)
- crud/xxx.py (CRUD操作)
- api/xxx.py (路由定义)

前端:
- views/xxx/index.vue (列表页面)
- views/xxx/form.vue (表单页面)
- api/xxx.ts (API接口)
- types/xxx.ts (TypeScript类型)
```

**配合方式**:
```
1. 使用 crm-code-generator 技能生成标准CRUD代码
2. AI自动生成符合FastApiAdmin规范的代码
3. 人工Review代码质量
4. 测试验证功能
5. Git提交
```

**优势**:
- ✅ 100%符合框架规范
- ✅ 不会破坏原有配置
- ✅ 代码风格统一
- ✅ 开发速度快(单个模块1-2小时)

**示例**:
```python
# AI生成的标准CRUD模型 (符合FastApiAdmin规范)
from sqlalchemy import Column, String, Boolean
from app.models.base import Base

class Customer(Base):
    __tablename__ = "customers"
    
    name = Column(String(100), nullable=False, comment="客户名称")
    phone = Column(String(20), comment="联系电话")
    status = Column(Boolean, default=True, comment="状态")
```

---

#### 策略2: 生成器基础上自定义布局 (推荐用于复杂业务)

**适用场景**:
- 需要复杂表单布局
- 多Tab页面
- 数据可视化
- 特殊交互逻辑

**配合方式**:
```
1. 使用 crm-code-generator 生成基础CRUD代码
2. 在生成的Vue组件基础上修改布局
3. 自定义Element Plus组件组合
4. 添加业务逻辑
5. 保持API接口不变
```

**示例 - 客户详情页**:
```vue
<!-- 1. 生成器生成的基础代码 -->
<template>
  <div>
    <el-form :model="form">
      <el-form-item label="客户名称">
        <el-input v-model="form.name" />
      </el-form-item>
    </el-form>
  </div>
</template>

<!-- 2. 自定义布局 - 添加Tab页签、时间线、关联数据 -->
<template>
  <div>
    <el-tabs v-model="activeTab">
      <!-- Tab1: 基本信息 -->
      <el-tab-pane label="基本信息" name="basic">
        <el-form :model="form">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="客户名称">
                <el-input v-model="form.name" />
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="联系电话">
                <el-input v-model="form.phone" />
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </el-tab-pane>
      
      <!-- Tab2: 联系人 -->
      <el-tab-pane label="联系人" name="contacts">
        <ContactList :customer-id="customerId" />
      </el-tab-pane>
      
      <!-- Tab3: 跟进记录 -->
      <el-tab-pane label="跟进记录" name="followups">
        <FollowupTimeline :customer-id="customerId" />
      </el-tab-pane>
      
      <!-- Tab4: 商机 -->
      <el-tab-pane label="商机" name="opportunities">
        <OpportunityList :customer-id="customerId" />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
```

**关键点**:
- ✅ **后端API保持不变** (使用生成器生成的标准API)
- ✅ **前端布局完全自定义** (基于Element Plus自由组合)
- ✅ **数据流向清晰** (API → Pinia → Vue组件)

---

#### 策略3: 完全自定义开发 (推荐用于特殊功能)

**适用场景**:
- 数据可视化大屏
- 复杂工作流
- 特殊业务逻辑
- 第三方集成

**配合方式**:
```
1. 不使用代码生成器
2. 完全手动编写前后端代码
3. 严格遵循FastApiAdmin代码规范
4. 复用框架已有的工具函数
5. 保持路由注册规范不变
```

**示例 - 销售漏斗看板**:
```typescript
// 前端: 完全自定义的可视化组件
<template>
  <div class="funnel-dashboard">
    <ECharts :option="funnelOption" />
    <ConversionRate :data="conversionData" />
    <BottleneckAnalysis :data="bottleneckData" />
  </div>
</template>

<script setup lang="ts">
import { useFunnelStore } from '@/store/modules/funnel'
import { getFunnelData } from '@/api/sales'

// 自定义业务逻辑
const funnelStore = useFunnelStore()
const funnelOption = computed(() => funnelStore.funnelChartOption)
</script>
```

```python
# 后端: 自定义业务逻辑API
@router.get("/sales/funnel")
async def get_funnel_data(
    dept_id: int = None,
    start_date: str = None,
    end_date: str = None,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(get_current_user)
):
    """获取销售漏斗数据(自定义聚合查询)"""
    # 复杂SQL查询
    funnel_data = await FunnelRepository.get_funnel_by_dept(
        db, dept_id, start_date, end_date
    )
    return SuccessResponse(data=funnel_data)
```

---

## ⚠️ 四、绝对禁止操作 (红线!)

### 4.1 禁止修改的核心文件

| 文件 | 禁止操作 | 原因 | 后果 |
|------|---------|------|------|
| **backend/app/scripts/init_app.py** | 修改路由注册 | 路由注册核心 | 所有API 404 |
| **backend/app/config/setting.py** | 修改ROOT_PATH | 全局配置 | Swagger路径错误 |
| **frontend/vite.config.ts** | 删除rewrite配置 | 代理配置 | 前后端路径不匹配 |
| **backend/app/main.py** | 修改中间件顺序 | 中间件依赖 | 认证失效 |

**历史教训**:
> 2026-04-15: 错误在include_router()添加prefix="/api/v1",导致所有API 404,排查2小时

---

### 4.2 禁止的开发行为

| 行为 | 原因 | 正确做法 |
|------|------|---------|
| ❌ 直接修改框架核心文件 | 升级框架时冲突 | 继承/扩展框架类 |
| ❌ 自定义路由注册方式 | 破坏路由规范 | 使用框架提供的Router |
| ❌ 跳过Schema验证 | 数据安全问题 | 必须使用Pydantic验证 |
| ❌ 前端直接调用数据库 | 架构混乱 | 必须通过API |
| ❌ 硬编码权限判断 | 权限混乱 | 使用框架权限装饰器 |
| ❌ 修改框架端口配置 | 环境不一致 | 使用.env文件配置 |

---

## 📐 五、数据库设计规范

### 5.1 表命名规范

```python
# ✅ 正确: 使用复数形式,下划线分隔
class Customer(Base):
    __tablename__ = "customers"

class Contact(Base):
    __tablename__ = "contacts"

class Opportunity(Base):
    __tablename__ = "opportunities"

# ❌ 错误: 单数/驼峰命名
class Customer(Base):
    __tablename__ = "customer"  # ❌ 应该用复数

class OrderItem(Base):
    __tablename__ = "orderItems"  # ❌ 应该用下划线
```

---

### 5.2 字段命名规范

| 字段类型 | 命名规范 | 示例 |
|---------|---------|------|
| 主键 | `id` | `id = Column(Integer, primary_key=True)` |
| 外键 | `{表名单数}_id` | `customer_id = Column(Integer, ForeignKey("customers.id"))` |
| 创建时间 | `created_at` | `created_at = Column(DateTime, default=func.now())` |
| 更新时间 | `updated_at` | `updated_at = Column(DateTime, default=func.now(), onupdate=func.now())` |
| 创建人 | `created_by` | `created_by = Column(Integer, ForeignKey("users.id"))` |
| 更新人 | `updated_by` | `updated_by = Column(Integer, ForeignKey("users.id"))` |
| 删除标记 | `is_deleted` | `is_deleted = Column(Boolean, default=False)` |
| 状态 | `status` | `status = Column(Boolean, default=True)` |

---

### 5.3 必须包含的通用字段

**所有业务表必须包含**:

```python
from sqlalchemy import Column, Integer, DateTime, Boolean, func
from sqlalchemy.orm import relationship
from app.models.base import Base

class Customer(Base):
    __tablename__ = "customers"
    
    # === 业务字段 ===
    name = Column(String(100), nullable=False, comment="客户名称")
    phone = Column(String(20), comment="联系电话")
    
    # === 通用字段(必须) ===
    id = Column(Integer, primary_key=True, autoincrement=True, comment="主键ID")
    created_at = Column(DateTime, default=func.now(), comment="创建时间")
    updated_at = Column(
        DateTime, 
        default=func.now(), 
        onupdate=func.now(), 
        comment="更新时间"
    )
    created_by = Column(Integer, ForeignKey("users.id"), comment="创建人ID")
    updated_by = Column(Integer, ForeignKey("users.id"), comment="更新人ID")
    is_deleted = Column(Boolean, default=False, comment="逻辑删除标记")
    
    # === 外键关系(可选) ===
    creator = relationship("User", foreign_keys=[created_by])
    updater = relationship("User", foreign_keys=[updated_by])
```

---

### 5.4 索引设计规范

```python
from sqlalchemy import Index, UniqueConstraint

class Customer(Base):
    __tablename__ = "customers"
    
    # === 索引(必须) ===
    __table_args__ = (
        # 唯一索引
        UniqueConstraint('name', 'is_deleted', name='uq_customer_name'),
        # 普通索引
        Index('idx_customer_phone', 'phone'),
        Index('idx_customer_created_at', 'created_at'),
        Index('idx_customer_owner_id', 'owner_id'),
        # 复合索引
        Index('idx_customer_status_owner', 'status', 'owner_id'),
    )
```

**索引设计原则**:
- ✅ 外键字段必须建索引
- ✅ 频繁查询的字段建索引
- ✅ WHERE条件字段建索引
- ✅ ORDER BY字段建索引
- ❌ 低频查询字段不建索引
- ❌ 布尔字段单独建索引(除非选择性高)

---

## 🔌 六、API设计规范

### 6.1 路由定义规范

```python
# ✅ 正确: 使用框架Router,不加prefix
from fastapi import APIRouter
from app.schemas.customer import CustomerCreate, CustomerUpdate, CustomerResponse
from app.crud.customer import CustomerCRUD

router = APIRouter()

@router.post("/customers", response_model=CustomerResponse)
async def create_customer(
    data: CustomerCreate,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(get_current_user)
):
    """创建客户"""
    customer = await CustomerCRUD.create(db, data, user.id)
    return customer

@router.get("/customers/{customer_id}", response_model=CustomerResponse)
async def get_customer(
    customer_id: int,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(get_current_user)
):
    """获取客户详情"""
    customer = await CustomerCRUD.get(db, customer_id)
    return customer

# ❌ 错误: 不要在Router中添加prefix="/api/v1"
# router = APIRouter(prefix="/api/v1")  # ❌ 会导致404
```

**注册路由**:
```python
# backend/app/scripts/init_app.py
from app.api.customer import router as customer_router

# ✅ 正确: 直接注册,不加prefix
app.include_router(customer_router)

# ❌ 错误: 添加prefix
# app.include_router(customer_router, prefix="/api/v1")  # ❌ 会导致404
```

---

### 6.2 API响应规范

```python
# ✅ 正确: 使用框架统一响应格式
from app.utils.response import SuccessResponse, ErrorResponse

@router.post("/customers")
async def create_customer(data: CustomerCreate, db: AsyncSession):
    customer = await CustomerCRUD.create(db, data)
    return SuccessResponse(data=customer, message="创建成功")

@router.get("/customers/{customer_id}")
async def get_customer(customer_id: int, db: AsyncSession):
    customer = await CustomerCRUD.get(db, customer_id)
    if not customer:
        return ErrorResponse(code=404, message="客户不存在")
    return SuccessResponse(data=customer)

# 响应格式:
# {
#   "code": 200,
#   "message": "创建成功",
#   "data": { ... }
# }
```

---

### 6.3 分页查询规范

```python
# ✅ 正确: 使用框架分页工具
from app.utils.pagination import PageResponse

@router.get("/customers")
async def list_customers(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    name: str = None,
    status: bool = None,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(get_current_user)
):
    """分页查询客户列表"""
    total, customers = await CustomerCRUD.list(
        db, page, page_size, name=name, status=status
    )
    return PageResponse(
        total=total,
        page=page,
        page_size=page_size,
        items=customers
    )

# 响应格式:
# {
#   "code": 200,
#   "data": {
#     "total": 100,
#     "page": 1,
#     "page_size": 20,
#     "items": [...]
#   }
# }
```

---

## 🎨 七、前端开发规范

### 7.1 页面结构规范

```vue
<!-- views/customer/index.vue -->
<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <SearchForm v-model="queryParams" @search="handleSearch" @reset="handleReset" />
    
    <!-- 操作栏 -->
    <ToolBar>
      <el-button type="primary" @click="handleAdd">新增</el-button>
      <el-button type="danger" :disabled="!selectedIds.length" @click="handleBatchDelete">
        批量删除
      </el-button>
    </ToolBar>
    
    <!-- 数据表格 -->
    <DataTable
      v-model:selected="selectedIds"
      :data="tableData"
      :loading="loading"
      :columns="columns"
      @sort-change="handleSortChange"
    >
      <template #action="{ row }">
        <el-button link type="primary" @click="handleEdit(row)">编辑</el-button>
        <el-button link type="danger" @click="handleDelete(row)">删除</el-button>
      </template>
    </DataTable>
    
    <!-- 分页 -->
    <Pagination
      v-model:page="queryParams.page"
      v-model:page-size="queryParams.page_size"
      :total="total"
      @change="handlePageChange"
    />
    
    <!-- 表单弹窗 -->
    <CustomerForm ref="formRef" @success="fetchData" />
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { getCustomerList, deleteCustomer } from '@/api/customer'
import CustomerForm from './form.vue'

// 查询参数
const queryParams = reactive({
  page: 1,
  page_size: 20,
  name: '',
  status: undefined
})

// 表格数据
const tableData = ref([])
const loading = ref(false)
const total = ref(0)
const selectedIds = ref([])

// 列定义
const columns = [
  { prop: 'name', label: '客户名称', width: 200 },
  { prop: 'phone', label: '联系电话', width: 150 },
  { prop: 'status', label: '状态', width: 100 }
]

// 获取数据
const fetchData = async () => {
  loading.value = true
  try {
    const res = await getCustomerList(queryParams)
    tableData.value = res.data.items
    total.value = res.data.total
  } finally {
    loading.value = false
  }
}

// 新增
const handleAdd = () => {
  formRef.value?.open()
}

// 编辑
const handleEdit = (row) => {
  formRef.value?.open(row.id)
}

// 删除
const handleDelete = async (row) => {
  await ElMessageBox.confirm('确认删除?', '提示', { type: 'warning' })
  await deleteCustomer(row.id)
  ElMessage.success('删除成功')
  fetchData()
}

onMounted(() => {
  fetchData()
})
</script>
```

---

### 7.2 API调用规范

```typescript
// api/customer.ts
import request from '@/utils/request'
import type { Customer, CustomerQuery, CustomerCreate, CustomerUpdate } from '@/types/customer'

// 获取客户列表
export const getCustomerList = (params: CustomerQuery) => {
  return request.get<Customer[]>('/customers', { params })
}

// 获取客户详情
export const getCustomerDetail = (id: number) => {
  return request.get<Customer>(`/customers/${id}`)
}

// 创建客户
export const createCustomer = (data: CustomerCreate) => {
  return request.post<Customer>('/customers', data)
}

// 更新客户
export const updateCustomer = (id: number, data: CustomerUpdate) => {
  return request.put<Customer>(`/customers/${id}`, data)
}

// 删除客户
export const deleteCustomer = (id: number) => {
  return request.delete(`/customers/${id}`)
}
```

---

### 7.3 类型定义规范

```typescript
// types/customer.ts
export interface Customer {
  id: number
  name: string
  phone?: string
  email?: string
  status: boolean
  owner_id: number
  created_at: string
  updated_at: string
}

export interface CustomerQuery {
  page: number
  page_size: number
  name?: string
  status?: boolean
}

export interface CustomerCreate {
  name: string
  phone?: string
  email?: string
}

export interface CustomerUpdate {
  name?: string
  phone?: string
  email?: string
  status?: boolean
}
```

---

## 🔧 八、AI智能体技能配合

### 8.1 技能清单

| 技能名称 | 用途 | 使用时机 |
|---------|------|---------|
| **crm-fullstack-developer** | 全栈开发总控 | 新建模块时协调所有子技能 |
| **crm-code-generator** | 代码生成 | 生成标准CRUD代码 |
| **crm-database-designer** | 数据库设计 | 设计表结构/Alembic迁移 |
| **crm-code-reviewer** | 代码审查 | 提交前检查代码质量 |
| **crm-test-generator** | 测试生成 | 生成单元/集成测试 |
| **crm-data-visualization** | 数据可视化 | 开发报表/图表 |
| **crm-workflow-automation** | 定时任务 | 开发APScheduler任务 |
| **crm-realtime-push** | 实时推送 | 开发WebSocket通知 |
| **crm-ai-agent-engine** | AI Agent | 开发AI智能功能 |

---

### 8.2 标准开发流程

```
1. 需求分析
   ↓ 使用 crm-fullstack-developer 分析需求

2. 数据库设计
   ↓ 使用 crm-database-designer 设计表结构
   ↓ 生成 Alembic 迁移脚本

3. 后端开发
   ↓ 使用 crm-code-generator 生成CRUD代码
   ↓ 自定义业务逻辑

4. 前端开发
   ↓ 使用 crm-code-generator 生成Vue组件
   ↓ 自定义页面布局

5. 测试生成
   ↓ 使用 crm-test-generator 生成测试代码
   ↓ 运行测试验证

6. 代码审查
   ↓ 使用 crm-code-reviewer 检查代码质量
   ↓ 修复问题

7. Git提交
   ↓ 自动提交(每10个任务)
```

---

## 📋 九、任务清单字段规范

### 9.1 数据库表字段检查清单

**每个任务涉及数据库表时,必须检查**:

- [ ] 表名使用复数形式 (`customers`)
- [ ] 包含通用字段 (`id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`)
- [ ] 外键字段命名规范 (`customer_id`, `owner_id`)
- [ ] 字段类型正确 (`String`, `Integer`, `Boolean`, `DateTime`, `JSON`)
- [ ] 字段注释完整 (`comment="客户名称"`)
- [ ] 索引设计合理 (外键/查询字段建索引)
- [ ] 唯一约束正确 (`UniqueConstraint`)
- [ ] 逻辑删除支持 (`is_deleted` 字段)

---

### 9.2 API接口检查清单

**每个API任务必须检查**:

- [ ] 使用框架Router (不加prefix)
- [ ] 使用Pydantic Schema验证
- [ ] 使用统一响应格式 (`SuccessResponse`/`ErrorResponse`)
- [ ] 分页接口使用 `PageResponse`
- [ ] 权限装饰器正确 (`require_permission`)
- [ ] 数据权限过滤 (部门/个人数据隔离)
- [ ] 异常处理完整 (try-except)
- [ ] 日志记录关键操作

---

### 9.3 前端页面检查清单

**每个前端任务必须检查**:

- [ ] 使用Element Plus组件
- [ ] TypeScript类型定义完整
- [ ] API调用使用统一request工具
- [ ] 表单验证规则完整
- [ ] 加载状态处理 (`loading`)
- [ ] 错误提示友好 (`ElMessage.error`)
- [ ] 权限按钮控制 (`v-permission`)
- [ ] 响应式布局适配

---

## 🎯 十、开发配合最佳实践

### 10.1 AI与人工配合模式

```
AI负责:
✅ 生成标准CRUD代码 (80%重复工作)
✅ 生成数据库迁移脚本
✅ 生成TypeScript类型定义
✅ 生成单元测试代码
✅ 代码规范检查
✅ 常见业务逻辑实现

人工负责:
✅ 复杂业务逻辑设计
✅ 页面布局自定义
✅ 交互体验优化
✅ 性能调优
✅ 代码Review
✅ 架构决策
```

---

### 10.2 开发效率提升技巧

**1. 使用代码模板**:
```bash
# 快速生成模块骨架
uv run python tools/generate_module_scaffold.py customer
```

**2. 批量生成CRUD**:
```python
# 使用 crm-code-generator 技能
# 输入: 数据表结构
# 输出: 完整的后端API + 前端页面
```

**3. 自动化测试**:
```bash
# 运行所有测试
uv run pytest tests/ -v

# 运行单个模块测试
uv run pytest tests/test_customer.py -v
```

**4. 代码质量检查**:
```bash
# 后端检查
uv run ruff check backend/app/
uv run black backend/app/

# 前端检查
cd frontend
pnpm lint
```

---

### 10.3 避免框架冲突的技巧

**1. 继承而非修改**:
```python
# ✅ 正确: 继承框架Base类
from app.models.base import Base

class Customer(Base):
    __tablename__ = "customers"
    # 自定义字段

# ❌ 错误: 直接修改框架模型
# 修改 app/models/user.py  # ❌ 会导致升级冲突
```

**2. 扩展而非覆盖**:
```python
# ✅ 正确: 扩展框架权限装饰器
from app.api.deps import require_permission

@router.post("/customers")
@require_permission("customer:create")
async def create_customer():
    pass

# ❌ 错误: 自定义权限检查
# if user.role != "admin":  # ❌ 破坏框架权限体系
#     raise PermissionError
```

**3. 配置分离**:
```python
# ✅ 正确: 在.env文件中配置
# backend/env/.env.dev
DATABASE_URL=postgresql+asyncpg://user:pass@localhost:5432/crm

# ❌ 错误: 硬编码配置
# DATABASE_URL = "postgresql://..."  # ❌ 不灵活
```

---

## 📝 十一、总结

### 11.1 开发原则

1. **尊重框架**: 不修改核心文件,通过扩展实现需求
2. **规范优先**: 严格遵守命名规范、API规范、数据库规范
3. **AI辅助**: 80%重复工作交给AI,人工专注20%核心逻辑
4. **质量第一**: 每个任务必须通过代码审查和测试
5. **文档同步**: 代码变更同步更新文档

### 11.2 配合策略总结

| 场景 | 策略 | 工具 |
|------|------|------|
| 标准CRUD | 代码生成器 | crm-code-generator |
| 复杂页面 | 生成器+自定义 | crm-code-generator + 手动布局 |
| 特殊功能 | 完全自定义 | 人工开发 + AI辅助 |
| 数据库设计 | AI生成迁移 | crm-database-designer |
| 代码审查 | AI检查 | crm-code-reviewer |
| 测试生成 | AI生成测试 | crm-test-generator |

### 11.3 质量保证

- ✅ **框架兼容性**: 100%兼容vue-fastapi-admin
- ✅ **代码规范性**: 通过ruff/black/eslint检查
- ✅ **测试覆盖率**: >80%
- ✅ **API规范性**: 统一响应格式、错误处理
- ✅ **数据库规范性**: 所有表包含通用字段、索引

---

**文档版本**: v1.0  
**最后更新**: 2026-04-15  
**维护者**: CRM开发团队  

---

© 2026 制造业CRM项目组 | FastApiAdmin框架开发配合规范
