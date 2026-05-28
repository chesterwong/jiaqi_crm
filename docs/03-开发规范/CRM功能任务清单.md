# CRM功能任务清单

> 制造业客户管理系统开发任务分解
> 基于Python FastAPI + Vue3技术栈，使用uv管理Python依赖
> 适配100人公司约束（2周MVP）
> 终端要求：必须使用Git Bash，禁止使用PowerShell

---

## 一、开发阶段规划

### 1.1 总体策略
- **MVP原则**：优先交付P0功能，P1/P2后续迭代
- **增量交付**：每2-3天交付一个可测试模块
- **测试驱动**：每个功能必须包含单元测试
- **文档同步**：代码提交必须同步更新API文档

### 1.2 阶段划分

| 阶段 | 时间 | 目标 | 交付物 |
|------|------|------|-------|
| **阶段1** | 第1-3天 | 基础架构+用户权限 | 可登录、可管理用户角色 |
| **阶段2** | 第4-7天 | 客户管理核心 | 客户CRUD、资源池、导入导出 |
| **阶段3** | 第8-10天 | 销售管理 | 漏斗看板、跟进记录 |
| **阶段4** | 第11-14天 | 商务合同+报表 | 报价单、合同、数据报表 |
| **阶段5** | 第15-18天 | 营销+客户成功 | 市场活动、线索管理、健康度 |
| **阶段6** | 第19-21天 | AI智能+优化 | 客户画像、标签、性能优化 |

---

## 二、详细任务分解

### 阶段1：基础架构+用户权限（第1-3天）

#### 1.0 开发环境准备（0.5天）

**任务ID**：T000  
**任务名称**：开发环境配置  
**优先级**：P0  
**预估工时**：1小时  
**负责人**：全员  

**任务清单**：
- [ ] 安装Git Bash（Windows）或确认Terminal可用（Mac/Linux）
  - 下载：https://git-scm.com/downloads
  - 验证：右键 → Git Bash Here
- [ ] 安装uv（Python包管理器）
  - 命令：`curl -LsSf https://astral.sh/uv/install.sh | sh`
  - 验证：`uv --version`
- [ ] 安装Node.js 20+（前端开发）
  - 下载：https://nodejs.org/
  - 验证：`node --version`
- [ ] 安装Docker Desktop
  - 下载：https://www.docker.com/products/docker-desktop/
  - 验证：`docker --version`
- [ ] 安装VS Code或PyCharm
  - 推荐插件：Python、Pylance、Vue Language Features
- [ ] 配置Git用户信息
  - `git config --global user.name "Your Name"`
  - `git config --global user.email "your.email@example.com"`

**验收标准**：
- ✅ Git Bash可正常使用
- ✅ uv安装成功
- ✅ Node.js安装成功
- ✅ Docker可运行容器
- ✅ IDE配置完成

**重要提醒**：
```
⚠️ 绝对禁止使用PowerShell！
✅ 必须使用Git Bash（Windows）或 Terminal（Mac/Linux）
```

---

#### 1.1 项目初始化（0.5天）

**任务ID**：T001  
**任务名称**：后端项目初始化  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建FastAPI项目结构（app/api/app/models/app/schemas/app/services）
- [ ] 使用uv初始化项目（uv init）
- [ ] 使用uv添加核心依赖（uv add fastapi "uvicorn[standard]" sqlalchemy asyncpg pydantic-settings alembic）
- [ ] 配置pyproject.toml（项目元数据和依赖声明）
- [ ] 配置Dockerfile（使用uv安装依赖）
- [ ] 配置.env环境变量文件
- [ ] 创建数据库连接配置（PostgreSQL + asyncpg）
- [ ] 创建Redis连接配置
- [ ] 配置日志系统（logging）
- [ ] 创建/app/main.py（FastAPI应用入口）
- [ ] 创建/app/core/config.py（配置管理）
- [ ] 创建/app/core/database.py（数据库连接）

**验收标准**：
- ✅ FastAPI应用可启动
- ✅ 数据库连接成功
- ✅ Redis连接成功
- ✅ /health端点返回正常

---

**任务ID**：T002  
**任务名称**：前端项目初始化  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：前端开发  

**任务清单**：
- [x] 使用Vite创建Vue3项目（TypeScript）
- [x] 安装Element Plus
- [x] 配置Vue Router
- [x] 配置Pinia状态管理
- [x] 配置Axios拦截器（请求/响应）
- [x] 配置ECharts
- [x] 配置.env环境变量
- [x] 配置Dockerfile（Node 20）
- [x] 创建基础布局组件（Header/Sidebar/Main）
- [x] 创建路由守卫

**验收标准**：
- ✅ Vite开发服务器可启动（localhost:3000）
- ✅ Element Plus组件正常渲染
- ✅ 路由跳转正常
- ✅ Axios拦截器正常工作

---

**任务ID**：T003  
**任务名称**：Docker Compose配置  
**优先级**：P0  
**预估工时**：1.5小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建docker-compose.yml
- [ ] 配置PostgreSQL服务（端口5432）
- [ ] 配置Redis服务（端口6379）
- [ ] 配置FastAPI服务（端口8000，使用uv run）
- [ ] 配置Nginx服务（端口80/443）
- [ ] 配置数据卷挂载
- [ ] 配置网络
- [ ] 测试docker-compose up

**验收标准**：
- ✅ docker-compose up一键启动所有服务
- ✅ 数据库自动初始化
- ✅ Redis可访问
- ✅ FastAPI可访问
- ✅ 数据持久化正常

---

#### 1.2 数据库基础表（0.5天）

**任务ID**：T004  
**任务名称**：数据库表设计（基础）  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建users表（用户表）
  - id, username, password_hash, real_name, email, phone, avatar_url, department_id, position, status, created_at, updated_at
- [ ] 创建departments表（部门表）
  - id, name, parent_id, manager_id, sort_order, status
- [ ] 创建roles表（角色表）
  - id, code, name, level, description, status
- [ ] 创建permissions表（权限表）
  - id, code, name, resource_type, resource_url, request_method, parent_id, sort_order, status
- [ ] 创建role_permissions表（角色权限关联表）
  - role_id, permission_id
- [ ] 创建user_roles表（用户角色关联表）
  - user_id, role_id
- [ ] 创建menus表（菜单表）
  - id, name, path, icon, sort_order, parent_id, visible, status
- [ ] 创建role_menus表（角色菜单关联表）
  - role_id, menu_id
- [ ] 使用Alembic创建迁移脚本（uv run alembic revision --autogenerate）
- [ ] 执行数据库迁移（uv run alembic upgrade head）

**验收标准**：
- ✅ 所有表创建成功
- ✅ 外键约束正常
- ✅ 索引创建成功
- ✅ Alembic迁移可回滚

---

**任务ID**：T005  
**任务名称**：SQLAlchemy模型定义  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/models/user.py（User模型）
- [ ] 创建/app/models/department.py（Department模型）
- [ ] 创建/app/models/role.py（Role模型）
- [ ] 创建/app/models/permission.py（Permission模型）
- [ ] 创建/app/models/menu.py（Menu模型）
- [ ] 定义所有关系（relationship）
- [ ] 添加__repr__方法
- [ ] 添加基础CRUD方法

**验收标准**：
- ✅ 所有模型可导入
- ✅ 关系查询正常
- ✅ 单元测试通过

---

#### 1.3 认证授权（1天）

**任务ID**：T006  
**任务名称**：Session认证实现  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/schemas/auth.py（认证Schema）
  - LoginRequest, LoginResponse, PasswordReset
- [ ] 创建/app/api/auth.py（认证API）
  - POST /api/v1/auth/login
  - POST /api/v1/auth/logout
  - POST /api/v1/auth/password/reset
  - GET /api/v1/auth/me
- [ ] 实现Session存储（Redis）
- [ ] 实现Session验证中间件
- [ ] 实现密码加密（bcrypt）
- [ ] 实现登录失败次数限制（防暴力破解）
- [ ] 添加请求参数校验（Pydantic）
- [ ] 添加异常处理（try-catch + 日志）

**验收标准**：
- ✅ 登录成功返回Session
- ✅ 登出清除Session
- ✅ 未登录返回401
- ✅ 密码错误返回明确提示
- ✅ 登录失败5次锁定账号15分钟
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T007  
**任务名称**：RBAC权限控制  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/user_service.py
  - create_user, update_user, delete_user, list_users, reset_password
- [ ] 创建/app/services/role_service.py
  - create_role, update_role, delete_role, list_roles, assign_permissions
- [ ] 创建/app/services/permission_service.py
  - create_permission, update_permission, delete_permission, list_permissions
- [ ] 创建/app/services/department_service.py
  - create_department, update_department, delete_department, list_departments
- [ ] 创建/app/api/users.py（用户管理API）
- [ ] 创建/app/api/roles.py（角色管理API）
- [ ] 创建/app/api/departments.py（部门管理API）
- [ ] 实现权限验证装饰器（@require_permission）
- [ ] 实现数据权限过滤（根据角色过滤数据）
- [ ] 添加完整异常处理（try-catch + rollback + 日志）

**验收标准**：
- ✅ 用户CRUD正常
- ✅ 角色CRUD正常
- ✅ 权限分配正常
- ✅ 权限验证生效
- ✅ 数据权限过滤正常
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T008  
**任务名称**：前端登录页  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/Login.vue
- [ ] 实现账号密码输入框
- [ ] 实现记住账号功能（localStorage）
- [ ] 实现表单校验
- [ ] 实现登录API调用
- [ ] 实现登录成功跳转首页
- [ ] 实现登录失败提示
- [ ] 添加Loading状态
- [ ] 响应式布局

**验收标准**：
- ✅ 表单校验正常
- ✅ 登录成功跳转
- ✅ 登录失败提示明确
- ✅ 记住账号功能正常
- ✅ UI美观

---

**任务ID**：T009  
**任务名称**：前端系统管理页面  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/system/UserManagement.vue（用户管理）
- [ ] 创建/src/views/system/RoleManagement.vue（角色管理）
- [ ] 创建/src/views/system/DepartmentManagement.vue（部门管理）
- [ ] 创建用户列表（表格、分页、筛选、搜索）
- [ ] 创建用户编辑对话框
- [ ] 创建角色列表（表格、权限配置树）
- [ ] 创建部门树形展示
- [ ] 实现API调用
- [ ] 实现权限控制（按钮级）

**验收标准**：
- ✅ 用户管理CRUD正常
- ✅ 角色管理CRUD正常
- ✅ 权限配置正常
- ✅ 部门树形展示正常
- ✅ 按钮权限控制生效

---

### 阶段2：客户管理核心（第4-7天）

#### 2.1 客户档案（2天）

**任务ID**：T010  
**任务名称**：客户数据库表设计  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建customers表（客户表）
  - id, name, credit_code（统一社会信用代码）, company_scale, supply_chain_position, business_type, customer_level, industry_1, industry_2, industry_3, company_size, status, owner_id（负责销售）, source（来源）, pool（资源池）, created_at, updated_at
  - 唯一索引：credit_code
  - 普通索引：name, customer_level, pool, owner_id
- [ ] 创建customer_contacts表（联系人表）
  - id, customer_id, name, position, department, phone, email, wechat, is_primary, role_type（决策人/技术负责人等）, created_at, updated_at
- [ ] 创建customer_addresses表（地址表）
  - id, customer_id, address_type（总部/分支机构）, province, city, district, address, longitude, latitude, created_at
- [ ] 创建customer_history表（客户历史追溯表）
  - id, customer_id, field_name, old_value, new_value, operator_id, created_at
- [ ] 创建customer_tags表（标签表）
  - id, name, category, description, status
- [ ] 创建customer_tag_relations表（客户标签关联表）
  - customer_id, tag_id, created_at
- [ ] 创建customer_pool_logs表（资源池流转日志表）
  - id, customer_id, from_pool, to_pool, operator_id, reason, created_at
- [ ] 执行Alembic迁移

**验收标准**：
- ✅ 所有表创建成功
- ✅ 索引创建成功
- ✅ 外键约束正常
- ✅ 迁移可回滚

---

**任务ID**：T011  
**任务名称**：客户模型与Schema定义  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/models/customer.py（Customer模型）
- [ ] 创建/app/models/customer_contact.py
- [ ] 创建/app/models/customer_address.py
- [ ] 创建/app/models/customer_tag.py
- [ ] 创建/app/schemas/customer.py
  - CustomerCreate, CustomerUpdate, CustomerResponse, CustomerListResponse
  - CustomerContactCreate, CustomerContactResponse
  - CustomerAddressCreate, CustomerAddressResponse
- [ ] 定义所有关系
- [ ] 添加基础CRUD方法

**验收标准**：
- ✅ 所有模型可导入
- ✅ Schema校验正常
- ✅ 单元测试通过

---

**任务ID**：T012  
**任务名称**：客户管理API开发  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/customer_service.py
  - create_customer, update_customer, delete_customer, get_customer, list_customers
  - batch_import_customers, batch_export_customers
  - batch_assign_owner, batch_move_pool, batch_add_tags
  - validate_credit_code（唯一性校验）
  - record_history（历史追溯）
- [ ] 创建/app/api/customers.py（客户管理API）
  - GET /api/v1/customers（列表，支持分页、筛选、搜索）
  - POST /api/v1/customers（创建）
  - GET /api/v1/customers/{id}（详情）
  - PUT /api/v1/customers/{id}（更新）
  - DELETE /api/v1/customers/{id}（删除）
  - POST /api/v1/customers/batch/assign（批量分配负责人）
  - POST /api/v1/customers/batch/move-pool（批量移入资源池）
  - POST /api/v1/customers/batch/export（批量导出）
  - POST /api/v1/customers/import（批量导入）
- [ ] 实现Excel导入导出（使用openpyxl）
- [ ] 实现导入校验（格式、必填字段、信用代码唯一性）
- [ ] 实现导入结果报告（成功数、失败数、错误详情）
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 客户CRUD正常
- ✅ 列表筛选、搜索正常
- ✅ 批量操作正常
- ✅ Excel导入导出正常
- ✅ 字段校验生效
- ✅ 历史追溯正常
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T013  
**任务名称**：前端客户档案页面  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/customer/CustomerList.vue（客户列表）
- [ ] 创建/src/views/customer/CustomerDetail.vue（客户详情）
- [ ] 创建/src/views/customer/CustomerForm.vue（客户表单）
- [ ] 创建/src/views/customer/CustomerImport.vue（批量导入）
- [ ] 实现客户列表（表格、分页、筛选、搜索）
- [ ] 实现批量操作工具栏
- [ ] 实现客户详情页（标签页切换：工商信息、联系人、地址、动态时间线）
- [ ] 实现客户表单（分步表单、字段校验）
- [ ] 实现Excel导入页面（模板下载、文件上传、结果展示）
- [ ] 实现API调用
- [ ] 实现权限控制

**验收标准**：
- ✅ 客户列表正常
- ✅ 客户详情正常
- ✅ 客户表单正常
- ✅ 批量导入正常
- ✅ UI美观、交互流畅

---

#### 2.2 客户资源池（1.5天）

**任务ID**：T014  
**任务名称**：资源池管理API  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/customer_pool_service.py
  - list_pool_customers（列出资源池客户）
  - assign_customer（分配客户）
  - return_customer（退回客户）
  - recycle_customers（自动回收超时客户）
  - get_protection_remaining（获取保护期剩余天数）
  - apply_appeal（分配申诉）
- [ ] 创建/app/api/customer_pools.py（资源池API）
  - GET /api/v1/pools/{pool_type}/customers（获取资源池客户列表）
  - POST /api/v1/pools/assign（分配客户）
  - POST /api/v1/pools/return（退回客户）
  - POST /api/v1/pools/recycle（手动触发回收）
  - POST /api/v1/pools/appeal（分配申诉）
  - GET /api/v1/pools/logs（资源流转记录）
  - GET /api/v1/pools/stats（回收数据统计）
- [ ] 实现保护期机制（7天）
- [ ] 实现回收规则（30天无跟进自动回收）
- [ ] 实现分配优先级（历史成交率>跟进频率>客户匹配度）
- [ ] 实现资源流转记录
- [ ] 添加定时任务（Celery定时回收）
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 资源池列表正常
- ✅ 分配/退回正常
- ✅ 保护期机制生效
- ✅ 回收规则生效
- ✅ 流转记录完整
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T015  
**任务名称**：前端资源池页面  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/customer/CustomerPool.vue（资源池管理）
- [ ] 实现三级池标签页（个人池/团队池/公海池）
- [ ] 实现客户列表（表格、分页）
- [ ] 实现分配操作（下拉选择销售/团队）
- [ ] 实现退回操作
- [ ] 实现保护期剩余天数展示
- [ ] 实现资源流转记录时间线
- [ ] 实现API调用
- [ ] 实现权限控制

**验收标准**：
- ✅ 三级池切换正常
- ✅ 分配/退回正常
- ✅ 保护期展示正常
- ✅ 流转记录完整
- ✅ UI美观

---

#### 2.3 首页工作台（0.5天）

**任务ID**：T016  
**任务名称**：首页数据API  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/dashboard_service.py
  - get_today_pending_followups（今日待跟进数）
  - get_month_new_customers（本月新增客户数）
  - get_month_closed_deals（本月成交客户数）
  - get_overdue_followups（超期未跟进数）
  - get_target_achievement_rate（目标达成率）
  - get_funnel_overview（销售漏斗概览）
  - get_pending_todos（待办事项）
- [ ] 创建/app/api/dashboard.py（首页API）
  - GET /api/v1/dashboard/metrics（核心指标）
  - GET /api/v1/dashboard/funnel（漏斗概览）
  - GET /api/v1/dashboard/todos（待办事项）
- [ ] 实现数据权限过滤（根据角色返回不同数据）
- [ ] 添加Redis缓存（TTL: 5分钟）
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 核心指标计算准确
- ✅ 数据权限过滤正常
- ✅ 缓存生效
- ✅ 响应时间<500ms
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T017  
**任务名称**：前端首页工作台  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/Dashboard.vue（首页工作台）
- [ ] 实现核心指标卡片（今日待跟进、本月新增/成交、超期未跟进、目标达成率）
- [ ] 实现销售漏斗概览图（ECharts）
- [ ] 实现待办与提醒列表
- [ ] 实现目标进度条
- [ ] 实现近期跟进动态
- [ ] 实现API调用
- [ ] 实现数据权限过滤展示

**验收标准**：
- ✅ 指标展示正常
- ✅ 漏斗图正常
- ✅ 待办列表正常
- ✅ 进度条正常
- ✅ UI美观、数据准确

---

### 阶段3：销售管理（第8-10天）

#### 3.1 销售漏斗（1.5天）

**任务ID**：T018  
**任务名称**：销售漏斗数据库表设计  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建opportunities表（商机表）
  - id, customer_id, name, stage（线索/意向/方案/谈判/成交/失败）, amount, expected_close_date, probability, owner_id, created_at, updated_at
  - 索引：stage, owner_id, expected_close_date
- [ ] 创建followup_records表（跟进记录表）
  - id, customer_id, opportunity_id, follow_type（电话/拜访/微信/邮件/其他）, content, next_followup_date, location, audio_url, images（JSONB）, recorder_id, created_at, updated_at
  - 索引：customer_id, recorder_id, next_followup_date
- [ ] 创建opportunity_history表（商机阶段历史表）
  - id, opportunity_id, from_stage, to_stage, operator_id, created_at
- [ ] 执行Alembic迁移

**验收标准**：
- ✅ 所有表创建成功
- ✅ 索引正常
- ✅ 迁移可回滚

---

**任务ID**：T019  
**任务名称**：销售漏斗API开发  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/models/opportunity.py
- [ ] 创建/app/models/followup_record.py
- [ ] 创建/app/schemas/opportunity.py
- [ ] 创建/app/schemas/followup_record.py
- [ ] 创建/app/services/opportunity_service.py
  - create_opportunity, update_opportunity, list_opportunities
  - update_stage（更新阶段，记录历史）
  - get_funnel_data（获取漏斗数据）
  - calculate_conversion_rate（计算转化率）
  - get_overdue_stages（获取超期停留商机）
- [ ] 创建/app/services/followup_service.py
  - create_followup, list_followups, get_followup
  - get_overdue_followups（获取超期未跟进客户）
  - send_followup_reminders（发送跟进提醒）
- [ ] 创建/app/api/opportunities.py
  - GET /api/v1/opportunities（列表）
  - POST /api/v1/opportunities（创建）
  - PUT /api/v1/opportunities/{id}/stage（更新阶段）
  - GET /api/v1/opportunities/funnel（漏斗数据）
  - GET /api/v1/opportunities/conversion（转化率）
- [ ] 创建/app/api/followups.py
  - GET /api/v1/followups（列表）
  - POST /api/v1/followups（创建）
  - GET /api/v1/followups/overdue（超期未跟进）
- [ ] 实现阶段流转规则验证（销售只能向前推进）
- [ ] 实现超期提醒逻辑
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 商机CRUD正常
- ✅ 阶段更新正常，历史追溯完整
- ✅ 漏斗数据准确
- ✅ 转化率计算准确
- ✅ 超期提醒正常
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T020  
**任务名称**：前端销售漏斗页面  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/sales/FunnelBoard.vue（销售漏斗看板）
- [ ] 创建/src/views/sales/FollowupList.vue（跟进记录列表）
- [ ] 创建/src/views/sales/FollowupForm.vue（跟进记录表单）
- [ ] 实现可视化漏斗图（ECharts）
- [ ] 实现客户卡片列表（各阶段下方）
- [ ] 实现拖拽调整阶段（限制规则）
- [ ] 实现筛选维度（区域、产品线、负责销售、时间范围）
- [ ] 实现转化率统计展示
- [ ] 实现异常预警（转化率下降>20%标红）
- [ ] 实现超期停留提醒（高亮标记）
- [ ] 实现跟进记录列表
- [ ] 实现跟进记录表单（富文本、图片上传、下次跟进时间）
- [ ] 实现API调用

**验收标准**：
- ✅ 漏斗看板正常
- ✅ 拖拽阶段正常（规则生效）
- ✅ 转化率统计准确
- ✅ 超期提醒正常
- ✅ 跟进记录正常
- ✅ UI美观、交互流畅

---

### 阶段4：商务合同+报表（第11-14天）

#### 4.1 报价单管理（1.5天）

**任务ID**：T021  
**任务名称**：报价单数据库表设计  
**优先级**：P0  
**预估工时**：2小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建quotes表（报价单表）
  - id, quote_number, customer_id, opportunity_id, total_amount, discount_rate, tax_rate, final_amount, status, valid_until, created_by, approved_by, created_at, updated_at
  - 唯一索引：quote_number
- [ ] 创建quote_items表（报价单明细表）
  - id, quote_id, product_name, specification, quantity, unit_price, subtotal
- [ ] 创建quote_templates表（报价模板表）
  - id, name, content, is_default, created_at
- [ ] 执行Alembic迁移

**验收标准**：
- ✅ 所有表创建成功
- ✅ 索引正常
- ✅ 迁移可回滚

---

**任务ID**：T022  
**任务名称**：报价单API开发  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/models/quote.py
- [ ] 创建/app/schemas/quote.py
- [ ] 创建/app/services/quote_service.py
  - create_quote, update_quote, list_quotes, get_quote
  - calculate_amount（计算金额：小计、折扣、税额、总金额）
  - submit_approval（提交审批）
  - approve_quote（审批）
  - reject_quote（拒绝）
  - validate_approval_permission（验证审批权限）
- [ ] 创建/app/api/quotes.py
  - GET /api/v1/quotes（列表）
  - POST /api/v1/quotes（创建）
  - PUT /api/v1/quotes/{id}（更新）
  - POST /api/v1/quotes/{id}/submit（提交审批）
  - POST /api/v1/quotes/{id}/approve（审批通过）
  - POST /api/v1/quotes/{id}/reject（审批拒绝）
  - GET /api/v1/quote-templates（模板列表）
- [ ] 实现多级审批流（<10万直接提交，10-100万部门经理，>100万总经理）
- [ ] 实现审批超时自动升级
- [ ] 实现金额自动计算
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 报价单CRUD正常
- ✅ 金额计算准确
- ✅ 审批流正常
- ✅ 审批权限验证生效
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T023  
**任务名称**：前端报价单页面  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/contract/QuoteList.vue（报价单列表）
- [ ] 创建/src/views/contract/QuoteForm.vue（报价单表单）
- [ ] 实现报价单列表（表格、分页、筛选、状态标签）
- [ ] 实现报价单表单（产品明细、自动计算）
- [ ] 实现审批进度展示
- [ ] 实现审批操作（通过/拒绝）
- [ ] 实现API调用
- [ ] 实现权限控制

**验收标准**：
- ✅ 报价单列表正常
- ✅ 报价单表单正常
- ✅ 金额计算准确
- ✅ 审批流程正常
- ✅ UI美观

---

#### 4.2 合同管理（1天）

**任务ID**：T024  
**任务名称**：合同数据库表设计与API开发  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建contracts表（合同表）
  - id, contract_number, customer_id, quote_id, total_amount, status, signed_date, start_date, end_date, created_by, created_at, updated_at
  - 唯一索引：contract_number
- [ ] 创建payment_plans表（付款计划表）
  - id, contract_id, installment_number, amount, due_date, status, actual_payment_date, actual_amount, created_at, updated_at
- [ ] 创建payment_records表（回款记录表）
  - id, contract_id, payment_plan_id, amount, payment_date, payment_method, remarks, recorded_by, created_at
- [ ] 创建/app/models/contract.py
- [ ] 创建/app/services/contract_service.py
  - create_contract, update_contract, list_contracts, get_contract
  - create_payment_plan（创建付款计划）
  - record_payment（记录回款）
  - check_overdue_payments（检查逾期付款）
  - send_overdue_notifications（发送逾期通知）
- [ ] 创建/app/api/contracts.py
  - GET /api/v1/contracts（列表）
  - POST /api/v1/contracts（创建）
  - GET /api/v1/contracts/{id}（详情）
  - POST /api/v1/contracts/{id}/payment-plans（创建付款计划）
  - POST /api/v1/contracts/{id}/payments（记录回款）
  - GET /api/v1/contracts/overdue（逾期合同）
- [ ] 实现逾期预警逻辑（到期未付自动变更为"逾期"）
- [ ] 实现逐级升级（逾期7天/30天）
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 合同CRUD正常
- ✅ 付款计划正常
- ✅ 回款核销正常
- ✅ 逾期预警正常
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T025  
**任务名称**：前端合同管理页面  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/contract/ContractList.vue（合同列表）
- [ ] 创建/src/views/contract/ContractForm.vue（合同表单）
- [ ] 创建/src/views/contract/PaymentPlan.vue（付款计划管理）
- [ ] 实现合同列表（表格、分页、筛选、状态标签）
- [ ] 实现合同表单（关联客户、关联报价单）
- [ ] 实现付款计划列表（多期展示）
- [ ] 实现回款记录对话框
- [ ] 实现逾期预警展示（高亮标记）
- [ ] 实现API调用
- [ ] 实现权限控制

**验收标准**：
- ✅ 合同列表正常
- ✅ 付款计划正常
- ✅ 回款记录正常
- ✅ 逾期预警正常
- ✅ UI美观

---

#### 4.3 数据报表（1.5天）

**任务ID**：T026  
**任务名称**：数据报表API  
**优先级**：P0  
**预估工时**：5小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/report_service.py
  - get_funnel_analysis（销售漏斗分析）
  - get_conversion_analysis（转化率分析）
  - get_payment_summary（回款汇总）
  - get_cashflow_forecast（现金流预测，未来90天）
  - get_overdue_statistics（逾期统计）
- [ ] 创建/app/api/reports.py
  - GET /api/v1/reports/funnel（销售漏斗分析）
  - GET /api/v1/reports/conversion（转化率分析）
  - GET /api/v1/reports/payment（回款统计）
  - GET /api/v1/reports/cashflow（现金流预测）
- [ ] 实现多维度筛选（时间、销售、团队、行业）
- [ ] 实现数据权限过滤
- [ ] 实现复杂SQL查询优化
- [ ] 添加Redis缓存（TTL: 10分钟）
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 报表数据准确
- ✅ 多维度筛选正常
- ✅ 数据权限过滤正常
- ✅ 响应时间<3秒
- ✅ 缓存生效
- ✅ 单元测试覆盖率>80%

---

**任务ID**：T027  
**任务名称**：前端数据报表页面  
**优先级**：P0  
**预估工时**：5小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/report/FunnelAnalysis.vue（销售漏斗分析）
- [ ] 创建/src/views/report/ConversionAnalysis.vue（转化率分析）
- [ ] 创建/src/views/report/PaymentReport.vue（回款统计）
- [ ] 创建/src/views/report/CashflowForecast.vue（现金流预测）
- [ ] 实现销售漏斗分析图表（ECharts）
- [ ] 实现转化率趋势图
- [ ] 实现回款汇总表格
- [ ] 实现现金流预测图表
- [ ] 实现多维度筛选器
- [ ] 实现API调用

**验收标准**：
- ✅ 报表图表正常
- ✅ 数据准确
- ✅ 筛选器生效
- ✅ UI美观

---

### 阶段5：营销+客户成功（第15-18天）

#### 5.1 营销服务（2天）

**任务ID**：T028  
**任务名称**：营销数据库表设计与API  
**优先级**：P1  
**预估工时**：6小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建marketing_campaigns表（市场活动表）
  - id, name, type（线上/线下/内容）, start_date, end_date, status, budget, actual_cost, leads_count, closed_deals_count, revenue, owner_id, created_at
- [ ] 创建leads表（线索表）
  - id, name, company, phone, email, source, score, stage（导入期/活跃期/休眠期）, campaign_id, owner_id, created_at, updated_at
- [ ] 创建lead_interactions表（线索互动记录表）
  - id, lead_id, interaction_type, content, created_at
- [ ] 创建/app/services/campaign_service.py
  - create_campaign, list_campaigns, calculate_roi
- [ ] 创建/app/services/lead_service.py
  - create_lead, list_leads, score_lead, assign_lead
- [ ] 创建/app/api/campaigns.py
- [ ] 创建/app/api/leads.py
- [ ] 实现ROI计算（投入成本 vs 成交金额）
- [ ] 实现线索评分模型
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 市场活动CRUD正常
- ✅ ROI计算准确
- ✅ 线索评分正常
- ✅ 单元测试覆盖率>70%

---

**任务ID**：T029  
**任务名称**：前端营销页面  
**优先级**：P1  
**预估工时**：6小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/marketing/CampaignList.vue（市场活动列表）
- [ ] 创建/src/views/marketing/CampaignForm.vue（市场活动表单）
- [ ] 创建/src/views/marketing/LeadList.vue（线索管理）
- [ ] 创建/src/views/marketing/ChannelROI.vue（渠道ROI分析）
- [ ] 实现市场活动列表与详情
- [ ] 实现线索列表与筛选
- [ ] 实现渠道ROI对比图表
- [ ] 实现API调用

**验收标准**：
- ✅ 市场活动管理正常
- ✅ 线索管理正常
- ✅ 渠道ROI分析正常
- ✅ UI美观

---

#### 5.2 客户成功（1.5天）

**任务ID**：T030  
**任务名称**：客户成功API  
**优先级**：P1  
**预估工时**：5小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建customer_health表（客户健康度表）
  - id, customer_id, score, risk_level, trend, calculated_at, created_at, updated_at
- [ ] 创建renewal_opportunities表（续约机会表）
  - id, customer_id, contract_id, expiry_date, status, estimated_amount, owner_id, created_at, updated_at
- [ ] 创建/app/services/health_service.py
  - calculate_health_score（计算健康度评分）
  - list_health_scores（获取健康度列表）
  - get_risk_customers（获取风险客户）
- [ ] 创建/app/services/renewal_service.py
  - list_renewal_opportunities, create_renewal_opportunity
  - get_expiry_reminders（获取到期提醒，90/60/30天）
- [ ] 创建/app/api/health.py
- [ ] 创建/app/api/renewals.py
- [ ] 实现健康度评分模型（多维度权重）
- [ ] 实现风险预警推送
- [ ] 实现续约分级提醒
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 健康度评分准确
- ✅ 风险预警正常
- ✅ 续约提醒正常
- ✅ 单元测试覆盖率>70%

---

**任务ID**：T031  
**任务名称**：前端客户成功页面  
**优先级**：P1  
**预估工时**：5小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/success/HealthMonitor.vue（健康度监控）
- [ ] 创建/src/views/success/RenewalManagement.vue（续约增购管理）
- [ ] 实现健康度评分列表与趋势图
- [ ] 实现风险客户高亮标记
- [ ] 实现续约机会列表与分级提醒
- [ ] 实现API调用

**验收标准**：
- ✅ 健康度监控正常
- ✅ 续约管理正常
- ✅ UI美观

---

### 阶段6：AI智能+优化（第19-21天）

#### 6.1 AI客户画像（1天）

**任务ID**：T032  
**任务名称**：AI客户画像API  
**优先级**：P1  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 创建/app/services/ai_profile_service.py
  - generate_customer_profile（生成客户画像）
  - get_basic_profile（基础画像）
  - get_business_profile（业务画像）
  - get_behavior_profile（行为画像）
  - get_prediction_profile（预测画像）
  - compare_customers（客户对比）
- [ ] 创建/app/api/ai_profiles.py
  - GET /api/v1/ai-profiles/{customer_id}（获取客户画像）
  - GET /api/v1/ai-profiles/compare（客户对比）
- [ ] 实现多维度数据聚合
- [ ] 实现画像数据缓存（Redis, TTL: 1小时）
- [ ] 实现客户对比算法
- [ ] 添加完整异常处理

**验收标准**：
- ✅ 画像加载<3秒
- ✅ 数据准确
- ✅ 客户对比正常
- ✅ 缓存生效
- ✅ 单元测试覆盖率>70%

---

**任务ID**：T033  
**任务名称**：前端AI画像页面  
**优先级**：P1  
**预估工时**：4小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 创建/src/views/ai/CustomerProfile.vue（客户画像）
- [ ] 创建/src/components/profile/BasicProfile.vue（基础画像）
- [ ] 创建/src/components/profile/BusinessProfile.vue（业务画像）
- [ ] 创建/src/components/profile/BehaviorProfile.vue（行为画像）
- [ ] 创建/src/components/profile/PredictionProfile.vue（预测画像）
- [ ] 实现多维度画像展示（ECharts雷达图、柱状图）
- [ ] 实现客户对比功能
- [ ] 实现API调用

**验收标准**：
- ✅ 画像展示正常
- ✅ 图表美观
- ✅ 数据准确
- ✅ 加载速度<3秒

---

#### 6.2 性能优化（1天）

**任务ID**：T034  
**任务名称**：后端性能优化  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 数据库查询优化（添加缺失索引）
- [ ] 复杂查询优化（使用EXPLAIN分析）
- [ ] Redis缓存策略完善
- [ ] API响应时间优化（目标<1秒）
- [ ] 添加SQL慢查询日志
- [ ] 添加API性能监控
- [ ] 数据库连接池优化
- [ ] 异步任务优化（Celery）

**验收标准**：
- ✅ 列表查询响应时间<1秒
- ✅ 详情查询响应时间<500ms
- ✅ 报表生成响应时间<3秒
- ✅ 缓存命中率>80%

---

**任务ID**：T035  
**任务名称**：前端性能优化  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：前端开发  

**任务清单**：
- [ ] 路由懒加载
- [ ] 组件按需加载
- [ ] 图片压缩与懒加载
- [ ] API请求防抖
- [ ] 列表虚拟滚动
- [ ] 浏览器缓存策略
- [ ] Gzip压缩

**验收标准**：
- ✅ 首屏加载<3秒
- ✅ 页面切换<500ms
- ✅ 列表渲染流畅（60fps）

---

#### 6.3 测试与部署（1天）

**任务ID**：T036  
**任务名称**：集成测试  
**优先级**：P0  
**预估工时**：4小时  
**负责人**：全员  

**任务清单**：
- [ ] 编写端到端测试用例（核心业务流程）
- [ ] 测试客户录入→分配→跟进→漏斗推进→报价/合同→付款跟踪完整流程
- [ ] 测试权限控制（各角色数据隔离）
- [ ] 测试批量导入导出
- [ ] 测试异常场景（边界情况处理）
- [ ] 性能测试（并发用户<30）
- [ ] 修复测试发现的Bug

**验收标准**：
- ✅ 核心业务流程100%通过
- ✅ 权限控制100%准确
- ✅ 性能达标
- ✅ 无严重Bug

---

**任务ID**：T037  
**任务名称**：生产环境部署  
**优先级**：P0  
**预估工时**：3小时  
**负责人**：后端开发  

**任务清单**：
- [ ] 编写部署脚本（deploy.sh）
- [ ] 配置Nginx（静态文件、反向代理、SSL）
- [ ] 配置生产环境环境变量
- [ ] 配置数据库备份策略（每日全量、每小时增量）
- [ ] 配置日志轮转
- [ ] 配置监控告警（企业微信）
- [ ] 编写运维手册
- [ ] 执行部署演练
- [ ] 验证uv在生产环境的依赖安装

**验收标准**：
- ✅ docker-compose up一键部署
- ✅ 数据库自动备份
- ✅ 监控告警正常
- ✅ 运维手册完整

---

## 三、质量检查清单

### 3.1 代码质量

- [ ] 所有函数必须有try-catch异常处理
- [ ] 数据库操作必须有rollback
- [ ] 所有异常必须记录日志（含堆栈）
- [ ] API接口必须有请求参数校验
- [ ] 代码注释率>30%
- [ ] 无PowerShell命令（使用Python脚本）
- [ ] 所有文件UTF-8编码（无BOM）
- [ ] 使用uv管理依赖（不用pip）
- [ ] pyproject.toml完整配置
- [ ] Dockerfile使用uv安装依赖

### 3.2 测试覆盖率

- [ ] 单元测试覆盖率>80%（P0功能）
- [ ] 单元测试覆盖率>70%（P1功能）
- [ ] 集成测试覆盖核心业务流程
- [ ] 性能测试达标

### 3.3 文档完整性

- [ ] API文档完整（Swagger自动生成）
- [ ] 数据库设计文档更新
- [ ] 部署文档完整
- [ ] 运维手册完整

### 3.4 安全合规

- [ ] 密码加密存储（bcrypt）
- [ ] Session安全配置
- [ ] SQL注入防护（SQLAlchemy参数化查询）
- [ ] XSS防护（前端输入转义）
- [ ] CSRF防护
- [ ] 数据权限验证100%覆盖

---

## 四、风险与应对

| 风险 | 影响 | 概率 | 应对措施 |
|------|------|------|---------|
| 需求变更 | 高 | 中 | 严格MVP范围，P1/P2后续迭代 |
| 技术难点（AI评分） | 中 | 中 | 先用规则引擎，后续接入AI |
| 人员不足 | 高 | 低 | 优先级排序，确保P0 |
| 性能不达标 | 中 | 低 | 提前性能测试，优化SQL和缓存 |
| 数据迁移 | 中 | 低 | 编写迁移脚本，充分测试 |
| **编码问题** | 高 | 高 | **严格使用Git Bash，禁用PowerShell** |
| **依赖冲突** | 中 | 低 | **使用uv管理依赖，锁定版本** |

---

## 五、交付物清单

### 5.1 代码交付
- ✅ 后端代码（FastAPI）
- ✅ 前端代码（Vue3）
- ✅ 数据库迁移脚本
- ✅ Docker配置文件
- ✅ 部署脚本
- ✅ pyproject.toml（uv依赖配置）

### 5.2 文档交付
- ✅ API文档（Swagger）
- ✅ 数据库设计文档
- ✅ 部署文档
- ✅ 运维手册
- ✅ 用户手册（可选）

### 5.3 测试交付
- ✅ 单元测试代码
- ✅ 集成测试代码
- ✅ 性能测试报告
- ✅ 测试用例文档

---

**文档版本**：v1.0  
**更新日期**：2026-04-09  
**维护人**：开发团队  
**状态**：✅ 已审核，可作为开发依据
