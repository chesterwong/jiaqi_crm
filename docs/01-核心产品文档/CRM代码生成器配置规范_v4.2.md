# CRM代码生成器配置规范 v4.2（75表完整版）

> **版本**: v4.2（配置规范版）  
> **日期**: 2026-04-29  
> **目标**: 提供清晰的代码生成器配置规范，确保75张表批量生成时零错误  
> **核心原则**: 所有表独立生成，不使用子表外键配置，后续自定义开发时通过路由参数关联

---

## ⚠️ 核心配置原则（必读）

### 1. 包名统一规则

**所有 75 张 CRM 表的包名必须统一使用**：`module_crm`

```
✅ 正确配置：
包名 (package_name) = module_crm          ← 所有表统一
模块名 (module_name) = customers          ← 按一级菜单简化
上级菜单 (parent_menu) = 客户管理          ← 中文菜单名

❌ 错误配置：
包名 = module_crm_customers               ← 不要按模块分包！
表名 = crm_customers                       ← 不要按表分包！
模块名 = crm_customers                    ← 不要带 crm_ 前缀！
```

### 2. 子表外键配置规则

**所有表都不填写子表外键配置**

```
子表表名：留空
子表外键列：留空
```

**原因**：
- 代码生成器的子表功能用于生成主子表联动界面（一个页面同时管理主从表）
- 我们的需求是先独立生成所有表的 CRUD，后续再自定义整合为 Tab 界面
- 外键关系在数据库中已经定义好了，不需要通过代码生成器再配置
- 后续自定义开发时，通过 `customer_id` 参数传递来实现关联

### 3. 模块名规则（按业务模块分组）

**模块名**按一级菜单业务模块设定，同一模块下的所有表共用同一模块名。
每个表通过**业务名**区分，生成代码时路径为 `module_crm/{模块名}/{业务名}`：

| 一级菜单 | 模块名 | 包含表数 | 详细列表 |
|---------|--------|---------|---------|
| 客户管理 | `customers` | 16张 | [§1](#1-客户管理模块16张表--module-customers) |
| 销售管理 | `sales` | 11张 | [§2](#2-销售管理模块11张表--module-sales) |
| 产品管理 | `products` | 9张 | [§3](#3-产品管理模块9张表--module-products) |
| 营销服务 | `marketing` | 6张 | [§4](#4-营销服务模块6张表--module-marketing) |
| 客户成功 | `success` | 6张 | [§5](#5-客户成功模块6张表--module-success) |
| 商务合同 | `contract` | 11张 | [§6](#6-商务合同模块11张表--module-contract) |
| AI智能 | `ai` | 4张 | [§7](#7-ai智能模块4张表--module-ai) |
| 数据报表 | `reports` | 3张 | [§8](#8-数据报表模块3张表--module-reports) |
| 系统管理 | `system` | 9张 | [§9](#9-系统管理模块9张表--module-system) |

**路径示例**:
| 路径 | 含义 |
|------|------|
| `module_crm/customers/customers` | 客户管理模块 → 主表(客户档案) |
| `module_crm/customers/contacts` | 客户管理模块 → 联系人管理 |
| `module_crm/sales/opportunities` | 销售管理模块 → 主表(商机管理) |
| `module_crm/products/product_categories`| 产品管理模块 → 主表(产品分类) |

---

## 📊 75张表配置总览

| 模块 | 模块名 | 表数量 | 一级菜单 | 二级菜单数量 | 详细配置 |
|------|--------|--------|---------|-------------|---------|
| 客户管理 | `customers` | 16 | 客户管理 | 2 | [§1](#1-客户管理模块16张表--module-customers) |
| 销售管理 | `sales` | 11 | 销售管理 | 6 | [§2](#2-销售管理模块11张表--module-sales) |
| 产品管理 | `products` | 9 | 产品管理 | 2 | [§3](#3-产品管理模块9张表--module-products) |
| 营销服务 | `marketing` | 6 | 营销服务 | 3 | [§4](#4-营销服务模块6张表--module-marketing) |
| 客户成功 | `success` | 6 | 客户成功 | 4 | [§5](#5-客户成功模块6张表--module-success) |
| 商务合同 | `contract` | 11 | 商务合同 | 6 | [§6](#6-商务合同模块11张表--module-contract) |
| AI智能 | `ai` | 4 | AI智能 | 4 | [§7](#7-ai智能模块4张表--module-ai) |
| 数据报表 | `reports` | 3 | 数据报表 | 1 | [§8](#8-数据报表模块3张表--module-reports) |
| 系统管理 | `system` | 9 | 系统管理 | 9 | [§9](#9-系统管理模块9张表--module-system) |
| **总计** | - | **75** | **9个一级菜单** | **37个二级菜单** | - |

---

## 📋 详细配置清单

### 1. 客户管理模块（16张表 · module: customers）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`customers`（按业务模块分组）
- 上级菜单：`客户管理`（一级）或 `客户档案`（二级）

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_customers | customers | （留空） | 客户档案 | 客户管理 | 主表 |
| 2 | crm_contacts | customers | contacts | 联系人管理 | 客户档案 | 从表 |
| 3 | crm_customer_addresses | customers | addresses | 地址信息 | 客户档案 | 从表 |
| 4 | crm_customer_pool_logs | customers | pool_logs | 公海池日志 | 客户档案 | 从表 |
| 5 | crm_pool_transfers | customers | transfers | 转移记录 | 客户档案 | 从表 |
| 6 | crm_customer_duplicate_logs | customers | duplicate_logs | 查重日志 | 客户档案 | 从表 |
| 7 | crm_customer_tags | customers | tags | 客户标签 | 客户档案 | 从表 |
| 8 | crm_customer_timeline | customers | timeline | 动态时间线 | 客户档案 | 从表 |
| 9 | crm_customer_activities | customers | activities | 客户活动 | 客户档案 | 从表 |
| 10 | crm_customer_attachments | customers | attachments | 附件管理 | 客户档案 | 从表 |
| 11 | crm_customer_change_logs | customers | change_logs | 变更日志 | 客户档案 | 从表 |
| 12 | crm_customer_health_scores | customers | health_scores | 健康评分 | 客户档案 | 从表 |
| 13 | crm_call_records | customers | call_records | 通话记录 | 客户档案 | 从表 |
| 14 | crm_customer_profiles | customers | profiles | 旧版画像 | 客户档案 | 从表 |
| 15 | crm_contact_relations | customers | relations | 联系人关系 | 客户档案 | 从表 |
| 16 | crm_contact_change_logs | customers | contact_change_logs | 联系人变更 | 客户档案 | 从表 |

#### 客户管理模块代码生成器配置

**客户档案（主表）**：
```json
{
  "table_name": "crm_customers",
  "package_name": "module_crm",
  "module_name": "customers",
  "business_name": "",
  "function_name": "客户档案",
  "parent_menu": "客户管理",
  "generate_menu": true,
  "sub_table_name": "",
  "sub_table_fk": ""
}
```

**联系人管理（从表）**：
```json
{
  "table_name": "crm_contacts",
  "package_name": "module_crm",
  "module_name": "customers",
  "business_name": "contacts",
  "function_name": "联系人管理",
  "parent_menu": "客户档案",
  "generate_menu": true,
  "sub_table_name": "",
  "sub_table_fk": ""
}
```

---

### 2. 销售管理模块（11张表 · module: sales）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`sales`（按业务模块分组）
- 上级菜单：`销售管理`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_opportunities | sales | （留空） | 商机管理 | 销售管理 | 主表 |
| 2 | crm_opportunity_stages | sales | stages | 阶段历史 | 商机管理 | 从表 |
| 3 | crm_opportunity_products | sales | products | 关联产品 | 商机管理 | 从表 |
| 4 | crm_follow_records | sales | follow_records | 跟进记录 | 商机管理 | 从表 |
| 5 | crm_followups | sales | followups | 跟进(旧版) | 商机管理 | 从表 |
| 6 | crm_joint_followups | sales | joint_followups | 联合跟进 | 商机管理 | 从表 |
| 7 | crm_competitors | sales | （留空） | 竞争对手管理 | 销售管理 | 独立表 |
| 8 | crm_tasks | sales | （留空） | 待办任务 | 销售管理 | 独立表 |
| 9 | crm_sales_activities | sales | （留空） | 销售活动 | 销售管理 | 独立表 |
| 10 | crm_visit_records | sales | （留空） | 拜访记录 | 销售管理 | 独立表 |
| 11 | crm_sales_targets | sales | （留空） | 销售目标 | 销售管理 | 独立表 |

---

### 3. 产品管理模块（9张表 · module: products）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`products`（按业务模块分组）
- 上级菜单：`产品管理`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_product_categories | products | （留空） | 产品分类 | 产品管理 | 主表 |
| 2 | crm_products | products | （留空） | 产品管理 | 产品管理 | 主表 |
| 3 | crm_product_skus | products | skus | SKU管理 | 产品管理 | 从表 |
| 4 | crm_product_prices | products | prices | 价格管理 | 产品管理 | 从表 |
| 5 | crm_price_tiers | products | tiers | 阶梯价格 | 产品管理 | 从表 |
| 6 | crm_product_documents | products | documents | 产品文档 | 产品管理 | 从表 |
| 7 | crm_product_price_policies | products | policies | 价格策略 | 产品管理 | 从表 |
| 8 | crm_product_price_history | products | history | 价格历史 | 产品管理 | 从表 |
| 9 | crm_import_records | products | （留空） | 导入记录 | 产品管理 | 独立表 |

---

### 4. 营销服务模块（6张表 · module: marketing）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`marketing`（按业务模块分组）
- 上级菜单：`营销服务`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_leads | marketing | （留空） | 线索管理 | 营销服务 | 主表 |
| 2 | crm_lead_scores | marketing | lead_scores | 评分历史 | 线索管理 | 从表 |
| 3 | crm_marketing_campaigns | marketing | （留空） | 市场活动 | 营销服务 | 主表 |
| 4 | crm_marketing_channels | marketing | channels | 活动渠道 | 市场活动 | 从表 |
| 5 | crm_campaigns | marketing | （留空） | 活动管理(旧版) | 营销服务 | 主表 |
| 6 | crm_campaign_leads | marketing | leads | 关联线索 | 活动管理 | 从表 |

---

### 5. 客户成功模块（6张表 · module: success）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`success`（按业务模块分组）
- 上级菜单：`客户成功`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_customer_health | success | （留空） | 客户健康度 | 客户成功 | 主表 |
| 2 | crm_service_tickets | success | （留空） | 服务工单 | 客户成功 | 独立表 |
| 3 | crm_renewals | success | （留空） | 续约管理 | 客户成功 | 独立表 |
| 4 | crm_customer_satisfaction_surveys | success | （留空） | 满意度调查 | 客户成功 | 主表 |
| 5 | crm_satisfaction_surveys | success | surveys | 旧版调查 | 满意度调查 | 从表 |
| 6 | crm_customer_health_scores | success | health_scores | 健康评分 | 客户健康度 | 从表 |

---

### 6. 商务合同模块（9张表 · module: contract）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`contract`（按业务模块分组）
- 上级菜单：`商务合同`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_quotations | contract | （留空） | 报价单管理 | 商务合同 | 主表 |
| 2 | crm_quotation_items | contract | items | 报价明细 | 报价单管理 | 从表 |
| 3 | crm_contracts | contract | （留空） | 合同管理 | 商务合同 | 主表 |
| 4 | crm_contract_items | contract | items | 合同明细 | 合同管理 | 从表 |
| 5 | crm_contract_invoices | contract | invoices | 关联发票 | 合同管理 | 从表 |
| 6 | crm_orders | contract | （留空） | 订单管理 | 商务合同 | 主表 |
| 7 | crm_order_items | contract | items | 订单明细 | 订单管理 | 从表 |
| 8 | crm_payments | contract | （留空） | 回款管理 | 商务合同 | 独立表 |
| 9 | crm_deliveries | contract | （留空） | 交付管理 | 商务合同 | 独立表 |

---

### 7. AI智能模块（4张表 · module: ai）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`ai`（按业务模块分组）
- 上级菜单：`AI智能`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_ai_customer_profiles | ai | （留空） | 客户画像 | AI智能 | 独立表 |
| 2 | crm_ai_recommendations | ai | （留空） | 智能推荐 | AI智能 | 独立表 |
| 3 | crm_tag_definitions | ai | （留空） | 标签定义 | AI智能 | 独立表 |
| 4 | crm_ai_tags | ai | （留空） | AI标签定义 | AI智能 | 独立表 |

---

### 8. 数据报表模块（2张表 · module: reports）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`reports`（按业务模块分组）
- 上级菜单：`数据报表`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_report_templates | reports | （留空） | 报表模板 | 数据报表 | 主表 |
| 2 | crm_report_instances | reports | instances | 报表实例 | 报表模板 | 从表 |

---

### 9. 系统管理模块（12张表 · module: system）

**配置规范**：
- 包名：`module_crm`（统一）
- 模块名：`system`（按业务模块分组）
- 上级菜单：`系统管理`

| 序号 | 表名 | 模块名 | 业务名 | 功能名 | 上级菜单 | 说明 |
|------|------|--------|--------|--------|---------|------|
| 1 | crm_data_dicts | system | （留空） | 数据字典 | 系统管理 | 独立表 |
| 2 | crm_user_extensions | system | （留空） | 用户扩展 | 系统管理 | 独立表 |
| 3 | crm_import_records | system | （留空） | 导入记录 | 系统管理 | 独立表 |
| 4 | crm_workflow_rules | system | （留空） | 工作流规则 | 系统管理 | 主表 |
| 5 | crm_workflow_logs | system | logs | 执行日志 | 工作流规则 | 从表 |
| 6 | crm_workflow_actions | system | actions | 动作配置 | 工作流规则 | 从表 |
| 7 | crm_workflow_triggers | system | triggers | 触发器 | 工作流规则 | 从表 |
| 8 | crm_workflow_approvals | system | approvals | 工作流审批 | 系统管理 | 独立表 |
| 9 | crm_approval_records | system | （留空） | 审批管理 | 系统管理 | 独立表 |
| 10 | crm_alert_rules | system | （留空） | 预警规则 | 系统管理 | 独立表 |
| 11 | crm_notifications | system | （留空） | 消息通知 | 系统管理 | 独立表 |
| 12 | crm_operation_logs | system | （留空） | 操作日志 | 系统管理 | 独立表 |

---

##  生成后的目录结构

### 后端目录结构（示例：客户档案）

>**说明**：`module_crm/{模块名}` 下每个业务名生成独立的文件（追加模式），路径含义如下：
> `module_crm/customers` = 客户管理模块
> `module_crm/customers/customers` = 客户档案主表
> `module_crm/customers/contacts` = 联系人管理

```
backend/
└── app/
    └── plugin/
        └── module_crm/                 ← 包名（统一）
            ├── customers/              ← 模块名（客户管理）
            │   ├── controller.py       ← 含 CrmCustomersRouter + CrmContactsRouter ...
            │   ├── service.py          ← 含 CrmCustomersService + CrmContactsService ...
            │   ├── crud.py             ← 含 CrmCustomersCRUD + CrmContactsCRUD ...
            │   ├── schema.py           ← 含 CrmCustomersSchema + CrmContactsSchema ...
            │   ├── model.py            ← 含 CrmCustomers + CrmContacts ...
            │   └── __init__.py         ← 模块初始化
            ├── sales/                  ← 模块名（销售管理）
            │   ├── ...                 ← 含 CrmOpportunities + CrmStages ...
            ├── products/               ← 模块名（产品管理）
            │   ├── ...                 ← 含 CrmProductCategories + CrmProducts ...
            ├── ...                     ← 其余业务模块
            └── （共9个业务模块目录）
```

### 前端目录结构（示例：客户档案）

```
frontend/
└── src/
    ├── api/
    │   ── module_crm/             ← 包名
    │       └── customers.ts        ← API 定义
    └── views/
        └── module_crm/             ← 包名
            └── customers/          ← 模块名
                └── index.vue       ← 主页面
```

---

##  批量生成顺序建议

### 第一批：客户管理（16张表）
```
1. crm_customers                  ← 客户档案（主表）
2. crm_contacts                   ← 联系人管理
3. crm_customer_addresses         ← 地址信息
4. crm_customer_pool_logs         ← 公海池日志
5. crm_pool_transfers             ← 转移记录
6. crm_customer_duplicate_logs    ← 查重日志
7. crm_customer_tags              ← 客户标签
8. crm_customer_timeline          ← 动态时间线
9. crm_customer_activities        ← 客户活动
10. crm_customer_attachments      ← 附件管理
11. crm_customer_change_logs      ← 变更日志
12. crm_customer_health_scores    ← 健康评分
13. crm_call_records              ← 通话记录
14. crm_customer_profiles         ← 旧版画像
15. crm_contact_relations         ← 联系人关系
16. crm_contact_change_logs       ← 联系人变更
```

### 第二批：销售管理（11张表）
```
1. crm_opportunities              ← 商机管理（主表）
2. crm_opportunity_stages         ← 阶段历史
3. crm_opportunity_products       ← 关联产品
4. crm_follow_records             ← 跟进记录
5. crm_followups                  ← 跟进(旧版)
6. crm_joint_followups            ← 联合跟进
7. crm_competitors                ← 竞争对手管理
8. crm_tasks                      ← 待办任务
9. crm_sales_activities           ← 销售活动
10. crm_visit_records             ← 拜访记录
11. crm_sales_targets             ← 销售目标
```

### 第三批：产品管理（9张表）
```
1. crm_product_categories         ← 产品分类
2. crm_products                   ← 产品管理
3. crm_product_skus               ← SKU管理
4. crm_product_prices             ← 价格管理
5. crm_price_tiers                ← 阶梯价格
6. crm_product_documents          ← 产品文档
7. crm_product_price_policies     ← 价格策略
8. crm_product_price_history      ← 价格历史
9. crm_import_records             ← 导入记录
```

（后续批次依此类推...）

---

##  验证清单

生成每批表后，验证以下内容：

- [ ] 后端文件生成到 `backend/app/plugin/module_crm/{模块名}/`
- [ ] 前端 API 文件生成到 `frontend/src/api/module_crm/{模块名}.ts`
- [ ] 前端视图文件生成到 `frontend/src/views/module_crm/{模块名}/index.vue`
- [ ] 每个模块生成 6 个后端文件（controller, service, crud, schema, model, __init__）
- [ ] API 路由前缀正确（如 `/customers`, `/sales`, `/products`）
- [ ] 权限标识格式正确（如 `module_crm:customers:query`）
- [ ] 没有子表外键配置（所有表独立生成）

---

##  常见问题

### Q1: 为什么所有表都不填写子表外键？

**A**: 因为我们需要先独立生成所有表的 CRUD 界面，后续自定义开发时通过路由参数（如 `customer_id`）来实现关联。代码生成器的子表功能用于生成主子表联动界面，不符合我们的 Tab 整合方案。

### Q2: 模块名为什么要简化？

**A**: 包名已经是 `module_crm`，模块名不需要再加 `crm_` 前缀。简化后路径更清晰：`module_crm/customers/` 而不是 `module_crm/crm_customers/`。

### Q3: 业务名什么时候填写？

**A**: 主表的业务名留空，从表的业务名使用表的简化名（如 `contacts`, `addresses`）。业务名用于区分同一模块下的不同表。

### Q4: 上级菜单怎么选择？

**A**: 
- 一级菜单（如"客户管理"、"销售管理"）选择"不选"或根目录
- 二级菜单（如"客户档案"、"联系人管理"）选择对应的一级菜单
- 从表（如"地址信息"、"联系人"）选择对应的二级菜单

---

## 📝 总结

**核心要点**：
1. 包名统一：`module_crm`
2. 模块名简化：去掉 `crm_` 前缀
3. 子表外键：全部留空
4. 业务名：主表留空，从表使用简化名
5. 上级菜单：按业务层级选择

**生成后效果**：
- 后端：每个模块 6 个文件，分层清晰
- 前端：API 和视图分离，结构合理
- 路由：前缀简洁，权限标识规范
- 后续：方便自定义开发 Tab 整合界面

---

**文档版本**: v4.2  
**最后更新**: 2026-04-29  
**适用范围**: FastApiAdmin CRM 系统 75 张表代码生成
