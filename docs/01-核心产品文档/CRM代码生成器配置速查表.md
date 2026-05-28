# CRM 代码生成器配置速查表（75表完整版）

**版本**: v1.0  
**日期**: 2026-04-29  
**用途**: 在代码生成器中导入表时，直接对照此表填写配置

---

## ⚠️ 核心规则（必读）

### 1. 包名统一规则

**所有 75 张 CRM 表的包名必须统一使用**：`module_crm`

```
✅ 正确：package_name = "module_crm"
❌ 错误：package_name = "module_crm_customers"
❌ 错误：package_name = "module_crm_contacts"
❌ 错误：package_name = "module_crm_sales"
```

### 2. 模块名规则

按功能模块分组，同一模块的表使用相同的模块名：

| 业务模块 | 模块名 (module_name) | 包含表数量 |
|---------|---------------------|----------|
| 客户管理 | `crm_customers` | 16 张表 |
| 销售管理 | `crm_sales` | 11 张表 |
| 产品管理 | `crm_products` | 9 张表 |
| 营销服务 | `crm_marketing` | 6 张表 |
| 客户成功 | `crm_success` | 6 张表 |
| 商务合同 | `crm_contract` | 11 张表 |
| AI智能 | `crm_ai` | 4 张表 |
| 数据报表 | `crm_reports` | 3 张表 |
| 系统管理 | `crm_system` | 9 张表 |

### 3. 上级菜单规则

与模块名对应的一级菜单名称：

| 模块名 | 上级菜单 (parent_menu) |
|--------|----------------------|
| crm_customers | `客户管理` |
| crm_sales | `销售管理` |
| crm_products | `产品管理` |
| crm_marketing | `营销服务` |
| crm_success | `客户成功` |
| crm_contract | `商务合同` |
| crm_ai | `AI智能` |
| crm_reports | `数据报表` |
| crm_system | `系统管理` |

---

## 📋 完整配置清单（75张表）

### 一、客户管理模块（16张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_customers`
- 上级菜单：`客户管理`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_customers | 客户档案 | 主表 |
| 2 | crm_contacts | 联系人管理 | 从表（独立菜单） |
| 3 | crm_customer_addresses | 客户地址 | 从表 |
| 4 | crm_customer_pool_logs | 公海池日志 | 从表 |
| 5 | crm_pool_transfers | 转移记录 | 从表 |
| 6 | crm_customer_duplicate_logs | 查重日志 | 从表 |
| 7 | crm_customer_tags | 客户标签 | 从表 |
| 8 | crm_customer_timeline | 动态时间线 | 从表 |
| 9 | crm_customer_activities | 客户活动 | 从表 |
| 10 | crm_customer_attachments | 附件管理 | 从表 |
| 11 | crm_customer_change_logs | 变更日志 | 从表 |
| 12 | crm_customer_health_scores | 健康评分 | 从表 |
| 13 | crm_call_records | 通话记录 | 从表 |
| 14 | crm_customer_profiles | 旧版画像 | 从表 |
| 15 | crm_contact_relations | 关系图谱 | 联系人从表 |
| 16 | crm_contact_visits | 拜访记录 | 联系人从表 |

---

### 二、销售管理模块（11张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_sales`
- 上级菜单：`销售管理`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_opportunities | 商机管理 | 主表 |
| 2 | crm_competitors | 竞争对手管理 | 独立表 |
| 3 | crm_tasks | 待办任务 | 独立表 |
| 4 | crm_sales_activities | 销售活动 | 独立表 |
| 5 | crm_visit_records | 拜访记录 | 独立菜单 |
| 6 | crm_sales_targets | 销售目标 | 独立表 |
| 7 | crm_opportunity_stages | 阶段历史 | 从表 |
| 8 | crm_opportunity_products | 关联产品 | 从表 |
| 9 | crm_follow_records | 跟进记录 | 从表 |
| 10 | crm_followups | 跟进(旧版) | 从表 |
| 11 | crm_joint_followups | 联合跟进 | 从表 |

---

### 三、产品管理模块（9张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_products`
- 上级菜单：`产品管理`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_product_categories | 产品分类 | 主表 |
| 2 | crm_products | 产品管理 | 从表（独立菜单） |
| 3 | crm_product_skus | SKU管理 | 从表 |
| 4 | crm_product_prices | 价格管理 | 从表 |
| 5 | crm_price_tiers | 阶梯价格 | 从表的从表 |
| 6 | crm_product_documents | 产品文档 | 从表 |
| 7 | crm_product_price_policies | 价格策略 | 从表 |
| 8 | crm_product_price_history | 价格历史 | 从表 |
| 9 | crm_import_records | 导入记录 | 独立表 |

---

### 四、营销服务模块（6张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_marketing`
- 上级菜单：`营销服务`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_leads | 线索管理 | 主表 |
| 2 | crm_marketing_campaigns | 市场活动 | 主表 |
| 3 | crm_campaigns | 活动管理(旧版) | 主表 |
| 4 | crm_lead_scores | 评分历史 | 从表 |
| 5 | crm_marketing_channels | 活动渠道 | 从表 |
| 6 | crm_campaign_leads | 关联线索 | 从表 |

---

### 五、客户成功模块（6张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_success`
- 上级菜单：`客户成功`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_customer_health | 客户健康度 | 独立菜单 |
| 2 | crm_service_tickets | 服务工单 | 独立表 |
| 3 | crm_renewals | 续约管理 | 独立菜单 |
| 4 | crm_customer_satisfaction_surveys | 满意度调查 | 独立菜单 |
| 5 | crm_satisfaction_surveys | 旧版数据 | 从表 |

---

### 六、商务合同模块（11张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_contract`
- 上级菜单：`商务合同`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_quotations | 报价单管理 | 主表 |
| 2 | crm_contracts | 合同管理 | 主表 |
| 3 | crm_orders | 订单管理 | 独立菜单 |
| 4 | crm_payments | 回款管理 | 独立菜单 |
| 5 | crm_deliveries | 交付管理 | 独立菜单 |
| 6 | crm_invoices | 发票管理 | 独立表 |
| 7 | crm_quotation_items | 报价明细 | 从表 |
| 8 | crm_contract_items | 合同明细 | 从表 |
| 9 | crm_contract_invoices | 关联发票 | 从表 |
| 10 | crm_order_items | 订单明细 | 从表 |
| 11 | crm_invoice_payments | 回款关联 | 从表 |

---

### 七、AI智能模块（4张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_ai`
- 上级菜单：`AI智能`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_ai_customer_profiles | 客户画像 | 独立菜单 |
| 2 | crm_ai_recommendations | 智能推荐 | 独立菜单 |
| 3 | crm_tag_definitions | 标签定义 | 独立表 |
| 4 | crm_ai_tags | AI标签定义 | 独立表 |

---

### 八、数据报表模块（3张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_reports`
- 上级菜单：`数据报表`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_report_templates | 报表模板 | 独立表 |
| 2 | crm_report_instances | 报表实例 | 从表 |

---

### 九、系统管理模块（9张表）

**配置规范**：
- 包名：`module_crm`
- 模块名：`crm_system`
- 上级菜单：`系统管理`

| 序号 | 表名 | 功能名 | 备注 |
|------|------|--------|------|
| 1 | crm_data_dicts | 数据字典 | 独立表 |
| 2 | crm_user_extensions | 用户扩展 | 独立菜单 |
| 3 | crm_import_records | 导入记录 | 独立表 |
| 4 | crm_workflow_rules | 工作流规则 | 独立表 |
| 5 | crm_workflow_approvals | 工作流审批 | 独立菜单 |
| 6 | crm_approval_records | 审批管理 | 独立表 |
| 7 | crm_alert_rules | 预警规则 | 独立表 |
| 8 | crm_notifications | 消息通知 | 独立表 |
| 9 | crm_operation_logs | 操作日志 | 独立表 |

---

##  快速配置示例

### 示例1：客户档案表（主表）

```json
{
  "table_name": "crm_customers",
  "table_comment": "客户档案",
  "class_name": "CrmCustomers",
  "package_name": "module_crm",           // ← 统一
  "module_name": "crm_customers",         // ← 客户模块
  "business_name": "",
  "function_name": "客户档案",
  "parent_menu": "客户管理",              // ← 上级菜单
  "generate_menu": true,
  "sub_table_name": "",
  "sub_table_fk_name": ""
}
```

### 示例2：联系人管理表（从表）

```json
{
  "table_name": "crm_contacts",
  "table_comment": "联系人管理",
  "class_name": "CrmContacts",
  "package_name": "module_crm",           // ← 统一
  "module_name": "crm_customers",         // ← 和客户档案相同模块
  "business_name": "",
  "function_name": "联系人管理",
  "parent_menu": "客户管理",
  "generate_menu": true,
  "sub_table_name": "",
  "sub_table_fk_name": ""
}
```

### 示例3：商机管理表（销售模块）

```json
{
  "table_name": "crm_opportunities",
  "table_comment": "商机管理",
  "class_name": "CrmOpportunities",
  "package_name": "module_crm",           // ← 统一
  "module_name": "crm_sales",             // ← 销售模块
  "business_name": "",
  "function_name": "商机管理",
  "parent_menu": "销售管理",              // ← 销售管理菜单
  "generate_menu": true,
  "sub_table_name": "",
  "sub_table_fk_name": ""
}
```

---

##  常见错误对照表

| 错误配置 | 正确配置 | 错误原因 |
|---------|---------|---------|
| package_name = module_crm_customers | package_name = module_crm | 不要按模块分包 |
| package_name = module_crm_contacts | package_name = module_crm | 不要按表分包 |
| module_name = crm_contacts | module_name = crm_customers | 从表使用主表模块名 |
| parent_menu = 联系人管理 | parent_menu = 客户管理 | 使用一级菜单名称 |

---

## 📝 使用说明

### 在代码生成器中配置时：

1. **打开代码生成器界面**
2. **选择要导入的表**（如 crm_customers）
3. **对照本速查表填写配置**：
   - 包名：统一填写 `module_crm`
   - 模块名：根据表所属模块填写（见上方表格）
   - 上级菜单：根据模块填写（见上方表格）
4. **生成代码**
5. **重复步骤 2-4**，直到所有 75 张表生成完毕

### 批量生成顺序建议：

```
第1批：客户管理模块（16张表）
  → crm_customers, crm_contacts, crm_customer_addresses, ...

第2批：销售管理模块（11张表）
  → crm_opportunities, crm_competitors, crm_tasks, ...

第3批：产品管理模块（9张表）
  → crm_product_categories, crm_products, crm_product_skus, ...

第4批：营销服务模块（6张表）
  → crm_leads, crm_marketing_campaigns, crm_campaigns, ...

第5批：客户成功模块（6张表）
  → crm_customer_health, crm_service_tickets, crm_renewals, ...

第6批：商务合同模块（11张表）
  → crm_quotations, crm_contracts, crm_orders, ...

第7批：AI智能模块（4张表）
  → crm_ai_customer_profiles, crm_ai_recommendations, ...

第8批：数据报表模块（3张表）
  → crm_report_templates, crm_report_instances

第9批：系统管理模块（9张表）
  → crm_data_dicts, crm_user_extensions, crm_notifications, ...
```

---

## ✅ 验证清单

生成完代码后，检查以下内容：

### 后端代码位置
- [ ] 所有文件都在 `backend/app/plugin/module_crm/` 目录下
- [ ] models/ 目录包含 75 个 .py 文件
- [ ] schemas/ 目录包含 75 个 .py 文件
- [ ] crud/ 目录包含 75 个 .py 文件
- [ ] api/ 目录按模块分组（customers.py, sales.py, ...）

### 前端代码位置
- [ ] API 文件在 `frontend/src/api/module_crm/` 目录下
- [ ] 页面文件在 `frontend/src/views/crm/` 目录下
- [ ] 按模块分组（customers/, sales/, products/, ...）

### 功能测试
- [ ] 所有菜单能正常显示
- [ ] 增删改查功能正常
- [ ] API 路由正确（/api/v1/crm/customers/...）
- [ ] 外键关联正常

---

**文档版本**: v1.0  
**创建日期**: 2026-04-29  
**相关文档**: 
- `CRM核心-代码生成器使用指南_v4.0.md`
- `CRM代码生成器指南v4.1-修正报告.md`
