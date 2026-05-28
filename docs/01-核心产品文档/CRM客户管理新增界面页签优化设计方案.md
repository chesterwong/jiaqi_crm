# CRM客户管理新增界面 — 页签化优化设计方案

> **版本**: v1.0  
> **日期**: 2026-04-09  
> **适用范围**: 客户管理模块 `crm_customers` 新增/修改/详情界面  
> **目标**: 将现有 45+ 字段平铺表单重构为多页签分组表单，提升制造业CRM客户档案录入体验

---

## 一、现状分析与问题诊断

### 1.1 当前新增界面结构

| 维度 | 现状 | 问题 |
|------|------|------|
| **字段数量** | 45+ 字段全量平铺在一个 `el-form` 中 | 滚动冗长，用户迷失 |
| **字段分组** | 无逻辑分组，按数据库列顺序排列 | 基本信息与系统字段混排 |
| **输入控件** | 几乎全部为 `el-input` 文本框 | `customer_type`/`industry` 等应为下拉选择 |
| **系统字段暴露** | `is_deleted`/`deleted_time`/`version` 等在新增表单中可见 | 用户困惑，数据安全风险 |
| **校验规则** | 仅 `customer_code`/`customer_name` 必填 | 缺失邮箱/电话/URL格式校验 |
| **对话框宽度** | `920px` | 页签化后可适当加宽至 `1100px` |
| **详情展示** | `el-descriptions` 4列平铺 | 同样存在信息过载问题 |

### 1.2 字段清单与归属分析（共48字段）

```
┌─ 系统字段(8个，新增时隐藏) ─────────────────────────────────┐
│ id, is_deleted, deleted_time, deleted_id, version,           │
│ duplicate_check_key, extra_data, status, dept_id             │
├─ 基本信息(12个) ─────────────────────────────────────────────┤
│ customer_code*, customer_name*, customer_short_name,         │
│ customer_type, customer_status, customer_level, source,      │
│ industry, scale, customer_segment, rating, description       │
├─ 工商信息(7个) ──────────────────────────────────────────────┤
│ registration_no, tax_no, legal_person, established_date,     │
│ registered_capital, paid_capital, website                    │
├─ 联系信息(6个) ──────────────────────────────────────────────┤
│ main_phone, main_email, country, province, city, district,   │
│ address, territory                                           │
├─ 业务关联(6个) ──────────────────────────────────────────────┤
│ owner_id, department_id, lead_id, parent_customer_id,        │
│ is_parent, pool_status                                       │
├─ 财务信息(8个) ──────────────────────────────────────────────┤
│ total_revenue, total_orders, credit_limit,                   │
│ outstanding_amount, payment_days, customer_since,            │
│ first_order_date, last_order_date                            │
├─ 跟进与健康(6个) ────────────────────────────────────────────┤
│ last_followup_at, next_followup_at, churn_risk,              │
│ health_score, protection_deadline, claim_time                │
└──────────────────────────────────────────────────────────────┘
```

### 1.3 目标页签架构

> 6个业务页签 + 1个保留扩展页签 = 7 Tab 设计

```
┌─ EnhancedDialog (1100px) ────────────────────────────────────┐
│  [基本信息] [工商信息] [联系信息] [业务关联] [财务信息]        │
│  [跟进健康] [扩展数据]                                       │
│                                                              │
│  ┌─ 当前页签内容区 ──────────────────────────────────────┐   │
│  │  el-form 两列布局 (label-width: 100px)                 │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                              │
│  [上一步]  [下一步]  [暂存草稿]        [取消]  [确定提交]    │
└──────────────────────────────────────────────────────────────┘
```

---

## 二、30步完整任务清单

### P0 — 核心架构与基础组件 (Task 01-10)

> **必须优先完成**，是整个页签化改造的基础支撑层

---

#### Task 01: 后端 Schema 按页签拆分子模型

- **目标**: 将现有 `CrmCustomersCreateSchema`（48字段单体）拆分为按页签分组的子Schema，支持分步提交和整体提交两种模式
- **涉及文件**: `backend/app/plugin/module_crm_customers/crm_customers/schema.py`
- **具体工作**:
  - 新增 `CustomerBasicSchema`（基本信息12字段）
  - 新增 `CustomerCompanySchema`（工商信息7字段）
  - 新增 `CustomerContactSchema`（联系信息7字段）
  - 新增 `CustomerBizRelationSchema`（业务关联6字段）
  - 新增 `CustomerFinanceSchema`（财务信息8字段）
  - 新增 `CustomerHealthSchema`（跟进健康6字段）
  - 保留 `CrmCustomersCreateSchema` 作为聚合模型（组合上述子Schema）
  - 新增 `CrmCustomersPartialUpdateSchema` 支持按页签局部更新
  - 为 `CrmCustomersCreateSchema` 中的系统字段添加 `exclude_on_create=True` 标记
- **验收标准**: 子Schema独立可序列化，聚合Schema通过Pydantic校验

#### Task 02: 后端API新增分步提交端点

- **目标**: 提供 `PATCH /crm_customers/{id}/tab` 接口，支持按页签分步保存客户信息
- **涉及文件**: 
  - `backend/app/plugin/module_crm_customers/crm_customers/controller.py`
  - `backend/app/plugin/module_crm_customers/crm_customers/service.py`
  - `backend/app/plugin/module_crm_customers/crm_customers/crud.py`
- **具体工作**:
  - 新增 `patch_customer_tab_controller` 接收 `tab_name` 和对应子Schema
  - Service层实现合并逻辑：只更新当前页签字段，保留其他字段不变
  - CRUD层新增 `update_customer_partial_crud` 方法
  - 新增 `POST /crm_customers/draft` 草稿暂存端点（状态=draft）
  - 新增 `PUT /crm_customers/{id}/submit` 草稿转正式提交端点
- **验收标准**: Postman测试各页签独立更新不互相覆盖

#### Task 03: 前端TypeScript类型按页签重构

- **目标**: 将 `CrmCustomersForm` 接口拆分为按页签的子类型，提升类型安全和代码可维护性
- **涉及文件**: `frontend/src/api/module_crm_customers/crm_customers.ts`
- **具体工作**:
  - 新增 `CustomerBasicForm` 接口（对应Tab1字段）
  - 新增 `CustomerCompanyForm` 接口（对应Tab2字段）
  - 新增 `CustomerContactForm` 接口（对应Tab3字段）
  - 新增 `CustomerBizRelationForm` 接口（对应Tab4字段）
  - 新增 `CustomerFinanceForm` 接口（对应Tab5字段）
  - 新增 `CustomerHealthForm` 接口（对应Tab6字段）
  - 新增 `CustomerExtraForm` 接口（对应Tab7扩展字段）
  - `CrmCustomersForm` 改为组合类型 `CrmCustomersForm = CustomerBasicForm & CustomerCompanyForm & ...`
  - 为系统字段添加 `@internal` 标记，新增时从类型中排除
  - 新增API函数 `patchCustomerTab(id, tabName, data)` 和 `createCustomerDraft(data)`
- **验收标准**: TypeScript编译零错误，子类型可独立使用

#### Task 04: 页签容器组件 `CustomerFormTabs.vue` 开发

- **目标**: 创建通用的客户表单页签容器组件，封装 `el-tabs` + 步骤导航 + 表单状态管理
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/CustomerFormTabs.vue`（新建）
- **具体工作**:
  - 使用 `el-tabs` 实现7个页签切换
  - 每个页签内部使用独立的 `el-form` 或共享 `el-form` + `v-show` 按tab过滤
  - 底部操作栏：上一步/下一步按钮（第一页隐藏上一步，最后一页显示提交）
  - 页签标题右侧显示"已完成"勾选标记（绿色 check）
  - 页签切换时自动触发当前页签表单校验
  - 未通过校验的页签标题显示警告图标（橙色感叹号）
  - `persist-tab` 属性控制是否记住上次打开的页签
- **验收标准**: 页签切换流畅，校验状态实时反映在页签标题上

#### Task 05: Tab1「基本信息」页签 — 核心必填字段

- **目标**: 实现客户基本信息页签，包含12个字段，为必填第一步
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabBasicInfo.vue`（新建）
- **具体工作**:
  - 两列布局（`el-row` + `el-col :span="12"`）
  - `customer_code` — 必填，自动生成按钮（前缀+日期+序号），50字符限制
  - `customer_name` — 必填，200字符限制，输入时触发查重防抖检测
  - `customer_short_name` — 可选，100字符限制
  - `customer_type` — 下拉选择：潜客/意向客户/成交客户/流失客户/公海客户
  - `customer_status` — 下拉选择：活跃/休眠/流失/黑名单
  - `customer_level` — 下拉选择：VIP/A级/B级/C级/D级
  - `source` — 下拉选择：官网/展会/转介绍/电话/广告/其他
  - `industry` — 级联选择器：制造业→(机械/电子/化工/汽车/...)
  - `scale` — 下拉选择：小微企业/中小企业/中型企业/大型企业/集团企业
  - `customer_segment` — 下拉选择：战略客户/重点客户/普通客户/待开发
  - `rating` — 改用 `el-rate` 评分组件(1-5星)
  - `description` — 多行文本 textarea, 4行, maxlength=500
- **验收标准**: 12个字段正确渲染，下拉选项从字典接口获取

#### Task 06: Tab2「工商信息」页签

- **目标**: 实现客户工商注册信息页签，7个字段
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabCompanyInfo.vue`（新建）
- **具体工作**:
  - `registration_no` — 文本输入，50字符，格式提示"统一社会信用代码18位"
  - `tax_no` — 文本输入，50字符
  - `legal_person` — 文本输入，100字符
  - `established_date` — 日期选择器 `el-date-picker`，限制不能晚于今天
  - `registered_capital` — 数字输入，带"万元"后缀，Decimal(18,2)，`el-input-number`
  - `paid_capital` — 数字输入，带"万元"后缀，Decimal(18,2)，`el-input-number`
  - `website` — URL输入，自动补全 `https://`，URL格式校验
- **验收标准**: 字段正确渲染，日期/金额控件交互正常

#### Task 07: Tab3「联系信息」页签

- **目标**: 实现客户联系方式与地址信息页签，7个字段
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabContactInfo.vue`（新建）
- **具体工作**:
  - `main_phone` — 电话输入，格式校验（手机/座机），支持多号码分号分隔
  - `main_email` — 邮箱输入，email格式校验，自动小写
  - `country` — 国家下拉选择（默认中国），可搜索
  - `province` — 省份下拉选择，依赖country联动
  - `city` — 城市下拉选择，依赖province联动
  - `district` — 区县下拉选择，依赖city联动
  - `address` — 详细地址 textarea, 4行, maxlength=500
  - `territory` — 所属区域，文本输入（华北/华东/华南/...），或下拉
- **验收标准**: 省市区三级联动正常，phone/email格式校验生效

#### Task 08: 表单校验规则体系重构

- **目标**: 建立分页签的分层校验规则体系，支持按Tab独立校验
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`（修改 rules 部分）
  - 各 Tab 子组件
- **具体工作**:
  - 将 `rules` 从单个 reactive 对象拆分为 `rulesBasic`/`rulesCompany`/`rulesContact`/`rulesBiz`/`rulesFinance`/`rulesHealth`
  - `customer_name` 增加远程查重校验（`validator` 调用查重API）
  - `main_email` 增加 email 格式正则校验
  - `main_phone` 增加手机/座机格式正则校验
  - `website` 增加 URL 格式校验
  - `registered_capital` / `paid_capital` 增加正数校验
  - `rating` 增加 1-5 范围校验
  - `churn_risk` 增加枚举值校验 (high/medium/low)
  - 动态必填规则：`customer_type=成交客户` 时 `customer_since` 变为必填
- **验收标准**: 分页签独立校验通过，跨页签联动校验生效

#### Task 09: 系统字段自动过滤 — 新增/修改/详情三态分离

- **目标**: 在新增表单中完全隐藏系统级字段，修改/详情中按需展示
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - 定义 `SYSTEM_FIELDS = ['is_deleted','deleted_time','deleted_id','version','duplicate_check_key','extra_data','status','dept_id']`
  - `handleOpenDialog('create')` 时：从 `formData` 中排除系统字段，页签中不渲染系统字段表单项
  - `handleOpenDialog('update')` 时：系统字段放入独立的"系统信息"折叠面板（默认折叠）
  - `handleOpenDialog('detail')` 时：系统字段放入详情描述的末尾折叠区
  - `handleSubmit()` 时：系统字段自动填充默认值（`status='0'`, `version=1`, `is_deleted=false`）
  - 后端 Schema 层面同步过滤：`CrmCustomersCreateSchema` 移除系统字段必填约束
- **验收标准**: 新增界面零系统字段展示，提交成功且数据库默认值正确

#### Task 10: 省市区三级联动 + 行业级联选择

- **目标**: 实现 address 区域级联选择和 industry 行业级联选择
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/components/TabContactInfo.vue`
  - `frontend/src/views/module_crm_customers/crm_customers/components/TabBasicInfo.vue`
- **具体工作**:
  - 引入 `element-plus` 的 `el-cascader` 组件
  - 国家-省份-城市-区县 四级联动数据源（从字典接口 `/dict/region` 获取）
  - 选择国家后自动加载省份列表，选择省份后加载城市列表
  - 行业级联：一级分类(制造业/服务业/...)，二级细分(机械制造/电子制造/...)
  - 支持搜索和快速定位
  - 级联选择器支持 `checkStrictly` 允许选择任意级别
- **验收标准**: 选择"中国→广东省→深圳市→南山区"正确填充 country/province/city/district

---

### P1 — 页签完善与交互增强 (Task 11-20)

> 在核心架构完成后，完善剩余页签并提升交互体验

---

#### Task 11: Tab4「业务关联」页签

- **目标**: 实现客户业务归属与关联关系页签，6个字段
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabBizRelation.vue`（新建）
- **具体工作**:
  - `owner_id` — 负责人选择器（复用 `UserTableSelect` 组件），搜索+下拉
  - `department_id` — 部门选择器（树形下拉，复用部门选择组件）
  - `lead_id` — 来源线索选择器（搜索+下拉，关联 `crm_leads` 表）
  - `parent_customer_id` — 父客户选择器（搜索已存在的客户，排除自身）
  - `is_parent` — 开关组件 `el-switch`，开启后标识为集团总部
  - `pool_status` — 公海池状态，下拉选择：正常/保护期/已过期/公海中
  - 当 `is_parent=true` 时，`parent_customer_id` 自动置空并禁用
- **验收标准**: 组件正确渲染，联动逻辑符合预期

#### Task 12: Tab5「财务信息」页签

- **目标**: 实现客户财务与交易数据页签，8个字段
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabFinanceInfo.vue`（新建）
- **具体工作**:
  - `total_revenue` — 金额输入，Decimal(18,2)，`el-input-number`，带"元"后缀，千分位显示
  - `total_orders` — 整数输入，`el-input-number`，min=0，step=1
  - `credit_limit` — 信用额度金额输入，带"元"后缀
  - `outstanding_amount` — 欠款金额输入，带"元"后缀，红色警告提示
  - `payment_days` — 账期天数，`el-input-number`，min=0，常用选项(30/60/90天)
  - `customer_since` — 成为客户时间，日期选择器
  - `first_order_date` — 首单日期，日期选择器，限制不早于 `customer_since`
  - `last_order_date` — 最后订单日期，日期选择器，限制不早于 `first_order_date`
  - 日期联动：`customer_since ≤ first_order_date ≤ last_order_date`
- **验收标准**: 金额千分位格式化，日期联动校验正确

#### Task 13: Tab6「跟进与健康」页签

- **目标**: 实现客户跟进状态与健康度评估页签，6个字段
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabFollowHealth.vue`（新建）
- **具体工作**:
  - `last_followup_at` — 最后跟进时间，日期时间选择器
  - `next_followup_at` — 下次跟进时间，日期时间选择器，必须晚于 `last_followup_at`
  - `churn_risk` — 流失风险，下拉选择：high(红色)/medium(橙色)/low(绿色)，颜色标记
  - `health_score` — 健康度评分，0-100范围，`el-slider` 滑块组件，颜色分段(红0-40/黄40-70/绿70-100)
  - `protection_deadline` — 保护期截止时间，日期时间选择器
  - `claim_time` — 领取时间，日期时间选择器
  - 提示文案：`churn_risk=high` 时显示"该客户流失风险较高，建议尽快跟进"
- **验收标准**: 滑块颜色分段显示，churn_risk颜色标记正确

#### Task 14: 下拉选项数据源对接 — 字典接口集成

- **目标**: 将所有硬编码的下拉选项改为从字典接口 `/dict/data?dict_type=xxx` 动态获取
- **涉及文件**: 
  - 所有 Tab 子组件
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - 定义字典类型映射：
    - `customer_type` → `crm_customer_type`
    - `customer_status` → `crm_customer_status`
    - `customer_level` → `crm_customer_level`
    - `source` → `crm_customer_source`
    - `scale` → `crm_enterprise_scale`
    - `customer_segment` → `crm_customer_segment`
    - `churn_risk` → `crm_churn_risk`
    - `pool_status` → `crm_pool_status`
    - `industry` → 需新建行业字典表或接口
  - 在 `dictStore.getDict()` 中注册上述字典类型
  - 组件 `onMounted` 时从 store 读取字典数据渲染选项
  - 字典未加载时显示 loading 骨架
- **验收标准**: 所有下拉选项从字典接口动态加载，支持后台修改选项无需前端发版

#### Task 15: 输入控件类型替换 — 从全文本到专业控件

- **目标**: 将当前所有 `el-input` 替换为与字段语义匹配的专业输入控件
- **涉及文件**: 所有 Tab 子组件
- **具体工作**:
  - `rating` — `el-input` → `el-rate`（星级评分，带分数文字提示）
  - `is_parent` — `el-input` → `el-switch`（开关，active-text="集团总部"）
  - `is_deleted` — `el-input` → `el-switch`（仅管理后台可见）
  - `status` — `el-input` → `el-radio-group`（保持现有）
  - 金额类字段(6个) — `el-input` → `el-input-number`（precision=2, :controls="true"）
    - registered_capital, paid_capital, total_revenue, credit_limit, outstanding_amount, health_score
  - 整数类字段(4个) — `el-input` → `el-input-number`（:precision="0", :step="1"）
    - total_orders, payment_days, rating（改用rate后取消）, lead_id
  - 日期类字段(9个) — 统一 `el-date-picker` 类型和格式
  - `description` — `el-input` → `el-input type="textarea"`（已有，保持）
  - `address` — `el-input` → `el-input type="textarea"`（已有，保持）
- **验收标准**: 所有字段使用正确的控件类型，数据绑定格式正确

#### Task 16: Tab7「扩展数据」页签 + JSONB可视化编辑

- **目标**: 为 `extra_data` JSONB字段提供可视化编辑界面
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabExtraData.vue`（新建）
- **具体工作**:
  - 预设扩展字段模板（制造业常用）：
    - 主要产品线（多选标签）
    - 年产能（文本+单位）
    - 主要供应商（文本）
    - 主要客户（文本）
    - 认证体系（ISO9001/ISO14001/...多选）
    - 员工人数（数字）
    - 厂房面积（数字+㎡）
  - 支持自定义键值对动态添加
  - JSON编辑器模式切换（可视化 ↔ 原始JSON）
  - 使用 `vue-json-pretty` 或自建 JSON 编辑器
- **验收标准**: 可视化编辑和JSON编辑两种模式可切换，数据正确序列化

#### Task 17: 对话框尺寸与布局响应式适配

- **目标**: 页签化后优化对话框尺寸，并适配不同屏幕分辨率
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - EnhancedDialog `width` 从 `920px` 调整为 `1100px`
  - 每个 Tab 内容区采用 `el-row` + `el-col :span="12"` 两列布局
  - 长字段（address/description/website）占用 `:span="24"` 整行
  - 对话框 `top` 属性设为 `3vh`，减少上下空白
  - 屏幕宽度 < 1200px 时自动切换为单列布局（`:span="24"`）
  - 屏幕宽度 < 768px 时页签切换为顶部固定+内容滚动
  - 对话框全屏模式下页签宽度自适应
- **验收标准**: 1100px/768px 断点下布局正确切换

#### Task 18: 详情页同步重构为页签展示

- **目标**: 将详情展示从 `el-descriptions` 4列平铺重构为7页签分组展示
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - 详情模式下同样使用 `CustomerFormTabs` 容器
  - 每个页签内用 `el-descriptions` 展示只读数据（:column="2", border）
  - 表单字段和详情字段共用同一个 Tab 组件，通过 `mode` prop 区分（edit/view）
  - `mode="view"` 时，所有输入控件替换为只读文本展示
  - 详情页底部操作改为"关闭"按钮
- **验收标准**: 详情页7个页签完整展示，与新增/修改页签结构一致

#### Task 19: 修改页同步重构为页签展示

- **目标**: 修改界面与新增界面共用页签组件，通过 `mode` 区分初始数据填充
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - `mode="edit"` 时，打开对话框自动加载客户详情并填充到各页签表单
  - 修改模式保留"系统信息"折叠面板（展示 version/updated_time 等只读字段）
  - `handleSubmit()` 判断 `mode`：create 调 `createCrmCustomers`，edit 调 `updateCrmCustomers`
  - 修改时自动定位到上次编辑的页签（`persist-tab`）
- **验收标准**: 新增和修改共用同一套页签组件，无重复代码

#### Task 20: 表单状态持久化（离开提示 + 草稿恢复）

- **目标**: 防止用户误关闭导致已填数据丢失
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`
  - `frontend/src/views/module_crm_customers/crm_customers/components/CustomerFormTabs.vue`
- **具体工作**:
  - 监听表单 `isDirty` 状态（任一字段变更后置为true）
  - 关闭对话框时，若 `isDirty=true` 弹窗确认"有未保存的数据，确定放弃？"
  - 提供"暂存草稿"按钮，将当前表单数据序列化存入 `localStorage`
  - 再次打开新增界面时检测是否有草稿，提示"检测到未完成的草稿，是否恢复？"
  - `localStorage` key 格式：`crm_customer_draft_{userId}`
  - 成功提交后自动清除草稿
- **验收标准**: 误关闭有提示，草稿可恢复

---

### P2 — 体验优化与质量保障 (Task 21-30)

> 细节打磨、性能优化、测试验证，打造制造业级专业体验

---

#### Task 21: 客户查重前置校验（实时 + 提交前）

- **目标**: 防止重复客户录入，在输入客户名称时实时检测，提交前二次确认
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/components/TabBasicInfo.vue`
  - `frontend/src/api/module_crm_customers/crm_customers.ts`
- **具体工作**:
  - 新增API `checkDuplicateCrmCustomers(name: string)` → 返回相似客户列表
  - `customer_name` 输入框增加防抖(500ms) `@input` 事件触发查重
  - 输入框下方显示实时查重结果：绿色"未发现重复" / 黄色"发现N个相似客户"
  - 点击相似客户可查看简要信息（客户编号+名称+行业，popover展示）
  - 存在相似客户时，提交按钮上方显示"已发现相似客户，是否确认新建？"勾选框
  - 查重规则：`customer_name` 模糊匹配 OR `registration_no` 精确匹配 OR `tax_no` 精确匹配
- **验收标准**: 输入"华为"时提示已存在的华为相关客户，提交需二次确认

#### Task 22: 客户编号自动生成规则

- **目标**: 提供智能的客户编号自动生成功能，支持自定义规则
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/TabBasicInfo.vue`
- **具体工作**:
  - `customer_code` 输入框右侧添加"自动生成"按钮
  - 生成规则：`KH-{日期YYYYMMDD}-{3位流水号}`，如 `KH-20260409-001`
  - 调用后端API获取当天最大流水号，自动递增
  - 手动输入时不做限制，但提交前校验唯一性
  - 编号生成按钮带 loading 状态
- **验收标准**: 点击自动生成，编号格式正确且不重复

#### Task 23: 页签切换动画与过渡效果

- **目标**: 为页签切换添加平滑过渡动画，提升视觉体验
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/components/CustomerFormTabs.vue`
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`
- **具体工作**:
  - 使用 `<Transition name="slide-fade" mode="out-in">` 包裹页签内容区
  - 定义 `slide-fade` 动画：水平滑动 20px + 透明度渐变，duration 300ms
  - 页签标题激活态增加底部彩色指示条 + 字体加粗
  - 已完成页签标题显示绿色小勾 ✓（带 scale 弹跳动画）
  - 校验未通过页签标题显示橙色感叹号 ⚠（带 pulse 脉冲动画）
  - 对话框打开时从底部滑入（使用 `el-dialog` 的 `open` 事件 + CSS animation）
- **验收标准**: 页签切换流畅动画，视觉状态一目了然

#### Task 24: 表单操作快捷键支持

- **目标**: 支持常用键盘快捷键，提升熟练用户操作效率
- **涉及文件**: `frontend/src/views/module_crm_customers/crm_customers/components/CustomerFormTabs.vue`
- **具体工作**:
  - `Ctrl+S` — 暂存草稿（阻止浏览器默认保存行为）
  - `Ctrl+Enter` — 提交表单
  - `Ctrl+← / Ctrl+→` — 切换到上一个/下一个页签
  - `Escape` — 关闭对话框（无修改时直接关闭，有修改时弹出确认）
  - 添加快捷键提示浮层（`?` 图标 hover 显示快捷键列表）
  - 使用 `@keydown` 监听，仅在对话框可见时生效
- **验收标准**: 快捷键响应正确，浏览器默认行为被正确阻止

#### Task 25: 提交反馈与错误定位优化

- **目标**: 提交成功后智能反馈，失败时精确定位到出错的页签和字段
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`
  - `frontend/src/views/module_crm_customers/crm_customers/components/CustomerFormTabs.vue`
- **具体工作**:
  - 提交成功：显示 `ElMessage.success` + 客户名称 + 客户编号，3秒后自动关闭对话框并刷新列表
  - 提交失败（校验失败）：
    - 自动切换到第一个有错误的页签
    - 滚动到第一个错误字段位置（`scrollIntoView`）
    - 错误字段红色边框闪烁2次
    - 页签标题的错误计数徽标（如"基本信息 ②"表示2个错误）
  - 提交失败（服务端错误）：
    - 解析后端返回的 `detail` 字段，定位到具体字段
    - 显示 `ElNotification` 错误详情（可复制）
- **验收标准**: 校验失败自动定位到错误字段，用户体验明确

#### Task 26: 扩展数据(JSONB)预设模板管理

- **目标**: 为不同客户类型预设不同的扩展数据模板
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/components/TabExtraData.vue`
  - 新增字典配置
- **具体工作**:
  - 定义3套制造业扩展模板：
    - **OEM代工客户**: 主要产品线、年产能、代工品牌、设备清单、质检标准
    - **渠道经销商**: 覆盖区域、门店数量、年销售额、主营品牌、仓库面积
    - **终端用户**: 使用场景、采购周期、预算范围、决策链、技术需求
  - `customer_type` 选择后自动加载对应的扩展数据模板
  - 模板字段可增删改（不影响其他客户）
  - 导出/导入扩展数据模板（JSON格式）
- **验收标准**: 选择客户类型后自动应用模板，扩展字段正确渲染

#### Task 27: 移动端/平板触控适配

- **目标**: 确保销售人员在平板设备上也能便捷录入客户信息
- **涉及文件**: 所有 Tab 子组件及 `CustomerFormTabs.vue`
- **具体工作**:
  - 对话框在 < 768px 宽度时全屏显示
  - 页签切换区域固定顶部，内容区独立滚动
  - 表单项从两列切换为单列布局
  - `el-input-number` 增大操作按钮尺寸（触控友好）
  - 日期选择器使用 `el-date-picker` 的移动端适配模式
  - 下拉选择器增大点击区域（min-height: 44px）
  - 提交按钮固定在底部（sticky），始终可见
  - 底部操作栏：上一步/下一步按钮使用大尺寸图标
- **验收标准**: iPad (768×1024) 上操作流畅，所有控件可正常触控

#### Task 28: 操作日志与变更追踪（只读页签）

- **目标**: 在详情/修改界面新增"操作日志"页签，展示客户档案的历史变更记录
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/components/TabAuditLog.vue`（新建）
  - 后端需配套提供操作日志接口
- **具体工作**:
  - 新增后端API `GET /crm_customers/{id}/audit-logs`
  - 日志列表展示：操作时间、操作人、操作类型（创建/修改/删除/合并）、变更摘要
  - 点击展开查看详细变更（字段级 diff：旧值→新值）
  - 使用 `el-timeline` 时间线组件展示
  - 支持按操作类型筛选和时间范围筛选
  - 仅在详情模式显示该页签
- **验收标准**: 时间线展示历史变更，点击展开查看字段级diff

#### Task 29: 整体UI美化 — 制造业CRM专业风格

- **目标**: 统一视觉风格，打造专业制造业CRM界面
- **涉及文件**: 
  - `frontend/src/views/module_crm_customers/crm_customers/index.vue`
  - 各 Tab 子组件
- **具体工作**:
  - 对话框标题区域增加客户头像占位（首字母头像或公司Logo上传区）
  - 页签头部增加步骤编号指示器（① ② ③ ... ⑦）
  - 必填字段标签增加红色星号 `*` 前缀
  - 表单分割区域增加浅色背景区分（`#fafbfc`）
  - 字段分组标题增加图标 + 分割线（如 "📋 企业资质信息"）
  - 金额字段增加人民币符号 `¥` 前缀
  - 下拉选择器选项过多时增加搜索功能（`filterable`）
  - 统一调整 `label-width` 为 `110px`，保证中文标签不换行
- **验收标准**: 界面专业美观，信息层次清晰

#### Task 30: E2E自动化测试 + 回归验证

- **目标**: 编写端到端测试用例，确保页签化改造后功能完整无回归
- **涉及文件**: 
  - `frontend/e2e/crm_customers_form.spec.ts`（新建）
  - `backend/tests/test_crm_customers_api.py`（修改）
- **具体工作**:
  - **前端E2E测试（Playwright）**:
    - 测试用例1：打开新增对话框 → 7个页签正确渲染
    - 测试用例2：基本信息页签 → 填写必填字段 → 切换到工商信息页签 → 切换回来数据保留
    - 测试用例3：提交空表单 → 自动跳转到基本信息页签 → 显示校验错误
    - 测试用例4：完整填写所有页签 → 提交成功 → 列表刷新 → 新记录可见
    - 测试用例5：修改已有客户 → 各页签正确回显 → 修改财务信息 → 提交成功
    - 测试用例6：省市区三级联动 → 选择中国→广东→深圳→南山
    - 测试用例7：关闭有未保存数据的对话框 → 确认提示弹窗
    - 测试用例8：查重检测 → 输入已存在客户名称 → 显示相似客户提示
  - **后端API测试（pytest + httpx）**:
    - 测试分步提交API `PATCH /crm_customers/{id}/tab`
    - 测试草稿暂存和提交流程
    - 测试查重接口
    - 测试客户编号自动生成接口
  - **回归测试**:
    - 客户列表查询功能正常
    - 批量删除功能正常
    - 导入导出功能正常
    - 权限控制正常（无权限用户看不到新增按钮）
- **验收标准**: 8个E2E用例全部通过，后端API测试覆盖率 ≥ 85%

---

## 三、实施路线图

```
Phase 1 (P0): 核心架构 ───────────────────── 预计 5-7 工作日
  Task 01 ──► Task 03 ──► Task 04 ──► Task 05 ──► Task 06 ──► Task 07
  Task 02 ──┘              Task 08 ──► Task 09 ──► Task 10

Phase 2 (P1): 页签完善 ───────────────────── 预计 4-5 工作日
  Task 11 ──► Task 12 ──► Task 13 ──► Task 14 ──► Task 15
  Task 16 ──► Task 17 ──► Task 18 ──► Task 19 ──► Task 20

Phase 3 (P2): 体验打磨 ───────────────────── 预计 3-4 工作日
  Task 21 ──► Task 22 ──► Task 23 ──► Task 24 ──► Task 25
  Task 26 ──► Task 27 ──► Task 28 ──► Task 29 ──► Task 30

总计: 约 12-16 工作日（全栈开发 + 测试）
```

---

## 四、技术风险与应对

| 风险 | 等级 | 应对措施 |
|------|------|----------|
| 后端Schema拆分导致API兼容性问题 | 🔴高 | 保留原 `createCrmCustomers` 接口，新增分步接口前后共存 |
| 字典数据接口未就绪 | 🟡中 | 先使用静态mock数据，字典接口就绪后无缝切换 |
| 省市区数据量较大影响加载速度 | 🟡中 | 懒加载：选择上级后才加载下级，数据缓存到localStorage |
| 页签过多导致初次渲染慢 | 🟢低 | 使用 `v-if` + `lazy` 属性，仅渲染当前激活页签 |
| 表单数据量大导致提交慢 | 🟢低 | 非必要字段延迟加载，按需提交变更字段 |

---

## 五、验收标准总览

- [ ] 新增客户界面展示7个业务页签，系统字段全部隐藏
- [ ] 每个页签内字段使用正确的输入控件类型（非全文本）
- [ ] 下拉选项全部从字典接口动态加载
- [ ] 省市区三级联动正常，行业级联正常
- [ ] 客户名称查重实时检测并提示相似客户
- [ ] 客户编号支持自动生成（KH-日期-序号）
- [ ] 表单校验按页签独立执行，错误自动定位到对应页签
- [ ] 暂存草稿/恢复草稿功能正常
- [ ] 关闭未保存表单有确认提示
- [ ] 详情页同步使用7页签展示
- [ ] 修改页正确回显各页签数据
- [ ] 8个E2E测试用例全部通过
- [ ] 后端API测试覆盖率 ≥ 85%
- [ ] 无TypeScript编译错误，无ESLint警告

---

> **文档作者**: Qoder AI  
> **审核状态**: 待审核  
> **下一步**: 确认方案后按 Phase 1 → Phase 2 → Phase 3 顺序执行
