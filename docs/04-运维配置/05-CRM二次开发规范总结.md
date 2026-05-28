# CRM 系统二次开发规范总结

> **创建日期**: 2026-04-26  
> **版本**: v1.0  
> **来源**: FastapiAdmin 官方文档 + 项目实际需求

---

## 一、核心原则

### 1.1 插件化架构

**必须遵守**: 所有 CRM 自定义开发都在 `backend/app/plugin/` 目录下进行

```
❌ 错误做法: 修改系统核心模块
backend/app/api/v1/system/    # 系统管理（禁止修改）
backend/app/api/v1/monitor/   # 监控模块（禁止修改）

✅ 正确做法: 在插件目录开发
backend/app/plugin/module_crm/  # CRM模块（在这里开发）
```

### 1.2 代码生成器优先

1. **先用生成器**: 访问 `http://localhost:5180/#/system/codegen`
2. **生成基础代码**: 自动生成前后端 CRUD 代码
3. **再二次开发**: 只修改前端界面，保持后端 API 不变

### 1.3 根目录保持干净

**白名单**（根目录仅允许）:
```
D:\HBuilderProjects\FastapiAdmin/
├── .git/
├── .gitignore
├── .qoder/              # AI 规则和技能
├── backend/             # 后端项目
├── frontend/            # 前端项目
├── devops/              # 运维配置
├── docs/                # 项目文档
├── docker-compose.yml   # Docker 配置
├── README.md            # 项目说明
└── deploy.sh            # 部署脚本
```

**禁止在根目录创建**:
- ❌ 临时文档 (*.md)
- ❌ 脚本文件 (*.py, *.bat, *.sh)
- ❌ 配置文件 (*.yaml, *.toml, *.json)
- ❌ 测试文件 (test_*.py)
- ❌ 报告文档 (*报告.md, *指南.md)

---

## 二、后端开发规范

### 2.1 标准插件目录结构

```
backend/app/plugin/module_crm/
├── __init__.py
├── plugin.toml          # 插件配置文件
└── customer/            # 客户管理子模块
    ├── __init__.py
    ├── controller.py    # 控制器（路由定义）
    ├── model.py         # 数据模型（数据库表）
    ├── schema.py        # 数据验证（Pydantic模型）
    ├── service.py       # 业务逻辑层
    └── crud.py          # 数据访问层
```

### 2.2 开发步骤

**第1步**: 编写数据模型 (`model.py`)
```python
from sqlalchemy import Column, String, Integer, Boolean, DateTime
from app.core.base_model import ModelBase

class Customer(ModelBase):
    """客户模型"""
    __tablename__ = "crm_customer"
    
    id = Column(Integer, primary_key=True, autoincrement=True, comment="主键ID")
    name = Column(String(100), nullable=False, comment="客户名称")
    phone = Column(String(20), comment="联系电话")
    email = Column(String(100), comment="邮箱")
    status = Column(Integer, default=1, comment="状态: 1启用 0禁用")
```

**第2步**: 编写数据验证 (`schema.py`)
```python
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime

class CustomerCreate(BaseModel):
    """创建客户"""
    name: str = Field(..., description="客户名称", max_length=100)
    phone: Optional[str] = Field(None, description="联系电话", max_length=20)
    email: Optional[str] = Field(None, description="邮箱", max_length=100)
```

**第3步**: 编写数据访问层 (`crud.py`)
```python
from app.core.base_crud import CRUDBase
from app.plugin.module_crm.customer.model import Customer
from app.plugin.module_crm.customer.schema import CustomerCreate, CustomerUpdate

class CRUDCustomer(CRUDBase[Customer, CustomerCreate, CustomerUpdate]):
    """客户数据访问层"""
    pass

customer_crud = CRUDCustomer(Customer)
```

**第4步**: 编写业务逻辑层 (`service.py`)
```python
from app.core.base_schema import QueryParams
from app.plugin.module_crm.customer.crud import customer_crud

class CustomerService:
    """客户业务逻辑层"""
    
    @staticmethod
    async def get_customer_list(params: QueryParams):
        """获取客户列表"""
        return await customer_crud.get_list(params)

customer_service = CustomerService()
```

**第5步**: 编写控制器 (`controller.py`)
```python
from fastapi import APIRouter, Depends
from app.core.dependencies import AuthPermission
from app.plugin.module_crm.customer.service import customer_service

router = APIRouter(prefix="/customer", tags=["客户管理"])

@router.get("/list", summary="获取客户列表")
async def get_customer_list(
    params: QueryParams = Depends(),
    auth: AuthPermission = Depends()
):
    """获取客户列表"""
    data = await customer_service.get_customer_list(params)
    return SuccessResponse(data=data)
```

**第6步**: 自动注册（无需手动配置）
- 系统自动扫描 `controller.py` 文件
- 自动注册路由到 `/crm/customer/*`

---

## 三、前端开发规范

### 3.1 目录结构

```
frontend/src/
├── api/
│   └── module_crm/          # CRM API 接口
│       └── customer.ts
└── views/
    └── module_crm/          # CRM 页面
        └── customer/
            └── index.vue
```

### 3.2 开发步骤

**第1步**: 配置 API 接口
```typescript
// frontend/src/api/module_crm/customer.ts
import request from "@/utils/request"

export const getCustomerList = (params: any) => {
  return request.get("/crm/customer/list", { params })
}

export const createCustomer = (data: any) => {
  return request.post("/crm/customer/create", data)
}
```

**第2步**: 创建页面组件
```vue
<!-- frontend/src/views/module_crm/customer/index.vue -->
<template>
  <div class="customer-list">
    <el-table :data="tableData" v-loading="loading">
      <el-table-column prop="name" label="客户名称" />
      <el-table-column prop="phone" label="联系电话" />
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { getCustomerList } from '@/api/module_crm/customer'

const loading = ref(false)
const tableData = ref([])

const loadData = async () => {
  loading.value = true
  try {
    const res = await getCustomerList({})
    tableData.value = res.data
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  loadData()
})
</script>
```

**第3步**: 路由配置
- 在系统菜单管理中添加路由
- 路径: `/crm/customer`
- 组件: `module_crm/customer/index`

---

## 四、数据库设计规范

### 4.1 表命名

```python
# ✅ 正确: 使用复数形式
class Customer(ModelBase):
    __tablename__ = "crm_customers"

# ❌ 错误: 单数或驼峰
class Customer(ModelBase):
    __tablename__ = "crm_customer"  # ❌
```

### 4.2 必须包含的通用字段

```python
# 所有业务表必须包含
id = Column(Integer, primary_key=True, autoincrement=True, comment="主键ID")
created_at = Column(DateTime, server_default=func.now(), comment="创建时间")
updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now(), comment="更新时间")
created_by = Column(Integer, comment="创建人ID")
updated_by = Column(Integer, comment="更新人ID")
is_deleted = Column(Boolean, default=False, comment="删除标记")
```

### 4.3 字段命名规范

| 字段类型 | 命名规范 | 示例 |
|---------|---------|------|
| 主键 | `id` | `id` |
| 外键 | `{表名单数}_id` | `customer_id`, `owner_id` |
| 创建时间 | `created_at` | `created_at` |
| 更新时间 | `updated_at` | `updated_at` |
| 删除标记 | `is_deleted` | `is_deleted` |

---

## 五、API 设计规范

### 5.1 路由定义

```python
# ✅ 正确: 在 controller.py 中定义路由
router = APIRouter(prefix="/customer", tags=["客户管理"])

@router.get("/list", summary="获取客户列表")
async def get_customer_list():
    pass

# 实际路由: /crm/customer/list
```

### 5.2 统一响应格式

```python
from app.common.response import SuccessResponse, ErrorResponse

# 成功响应
return SuccessResponse(data=data, message="操作成功")

# 错误响应
return ErrorResponse(code=404, message="资源不存在")
```

---

## 六、Git 提交规范

### 6.1 提交信息格式

```
type(scope): description

feat(crm): 添加客户管理模块
fix(crm): 修复客户列表分页问题
docs(crm): 更新客户管理文档
style(crm): 格式化客户页面代码
refactor(crm): 重构客户数据访问层
test(crm): 添加客户模块测试
chore(crm): 更新客户模块依赖
```

### 6.2 提交流程

```bash
# 1. 查看修改
git status

# 2. 添加文件
git add .

# 3. 提交
git commit -m "feat(crm): 添加客户管理模块"

# 4. 推送
git push crm master
```

---

## 七、质量检查清单

### 7.1 开发完成后必须检查

- [ ] 代码在 `backend/app/plugin/module_crm/` 目录
- [ ] 未修改系统核心模块（`backend/app/api/v1/`）
- [ ] 未修改 `backend/app/scripts/init_app.py`
- [ ] 未修改 `backend/app/config/setting.py`
- [ ] 未修改 `frontend/vite.config.ts`
- [ ] 使用框架统一响应格式（`SuccessResponse`）
- [ ] 包含通用字段（`id`, `created_at`, `updated_at` 等）
- [ ] 表名使用复数形式
- [ ] 使用 Pydantic Schema 验证
- [ ] 前端使用统一 request 工具
- [ ] TypeScript 类型定义完整
- [ ] 根目录保持干净（无临时文件）

---

## 八、禁止的开发行为

### 8.1 绝对禁止

1. ❌ **直接修改框架核心文件**
   - `backend/app/api/v1/system/`
   - `backend/app/api/v1/monitor/`

2. ❌ **修改路由注册核心文件**
   - `backend/app/scripts/init_app.py`（不加 prefix）
   - `backend/app/config/setting.py`
   - `frontend/vite.config.ts`

3. ❌ **跳过代码生成器**
   - 必须先用生成器生成基础代码
   - 再进行二次开发

4. ❌ **在根目录创建临时文件**
   - 临时文档 (*.md)
   - 脚本文件 (*.py, *.bat, *.sh)
   - 测试文件 (test_*.py)

5. ❌ **自定义路由注册方式**
   - 必须使用插件化自动注册
   - 不要手动修改 `init_app.py`

### 8.2 历史教训

**2026-04-15**: 路由 prefix 错误导致 404

```python
# ❌ 错误: 在 init_app.py 中添加 prefix
app.include_router(customer_router, prefix="/api/v1")

# ✅ 正确: 不加 prefix
app.include_router(customer_router)
```

**后果**: 所有 API 返回 404，排查 2 小时

---

## 九、文档管理规范

### 9.1 文档存放位置

```
docs/
├── 01-核心产品文档/        # 产品需求、功能清单
├── 02-技术架构/            # 技术设计、架构文档
├── 03-开发方案/            # 开发计划、任务清单
├── 04-运维配置/            # 部署、配置、使用指南
└── README.md              # 文档索引
```

### 9.2 禁止在根目录创建的文档

- ❌ 临时文档（DOCKER_USAGE.md, QUICK_START.md 等）
- ❌ 配置指南（NAVICAT_CONFIG.md, PORTS_CONFIG.md 等）
- ❌ 测试报告、开发报告
- ❌ 使用指南、操作手册

**✅ 所有文档必须放在 `docs/` 目录**

---

## 十、快速参考

### 10.1 常用命令

```bash
# 启动后端
cd backend
python main.py run --env=dev

# 启动前端
cd frontend
pnpm dev

# 启动数据库
docker-compose up -d

# 提交代码
git add .
git commit -m "feat(crm): 描述"
git push crm master
```

### 10.2 访问地址

- 前端: http://localhost:5180/web
- 后端 API: http://localhost:8001
- API 文档: http://localhost:8001/docs
- 代码生成器: http://localhost:5180/#/system/codegen

### 10.3 数据库连接

- 主机: localhost
- 端口: 5432
- 数据库: fastapiadmin
- 用户名: postgres
- 密码: FastapiAdmin@2026

---

## 十一、相关文档

### 11.1 AI 规则文件

- [.qoder/rules/01-fastapiadmin-core-rules.md](../.qoder/rules/01-fastapiadmin-core-rules.md) - 框架核心规范
- [.qoder/rules/02-crm-development-workflow.md](../.qoder/rules/02-crm-development-workflow.md) - 开发流程规范
- [.qoder/rules/03-database-api-standards.md](../.qoder/rules/03-database-api-standards.md) - 数据库与 API 规范

### 11.2 官方文档

- [FastapiAdmin 官方文档](https://gitee.com/fastapiadmin/FastapiAdmin)
- [FastapiAdmin 二次开发教程](https://gitee.com/fastapiadmin/FastapiAdmin)

---

**版本**: v1.0  
**创建日期**: 2026-04-26  
**维护者**: CRM 开发团队

---

© 2026 CRM 项目组 | 二次开发规范总结
