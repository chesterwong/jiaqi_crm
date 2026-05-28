# FastApiAdmin代码生成器使用指南 - CRM系统专用

> **版本**: v1.0  
> **日期**: 2026-04-21  
> **目标**: 零错误生成CRM所有模块代码，正确处理主从表关系

---

## 第一部分：生成前准备（必须完成）

### 一、数据库表检查清单

#### 1. 检查所有CRM表是否已创建

```sql
-- 执行SQL，确认所有表存在
SELECT table_name, obj_description(oid) AS comment
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name LIKE 'crm_%'
ORDER BY table_name;

-- 预期结果（14个表）：
-- crm_customers          | 客户表
-- crm_contacts           | 联系人表
-- crm_followups          | 跟进记录表
-- crm_opportunities      | 商机表
-- crm_quotations         | 报价单表
-- crm_contracts          | 合同表
-- crm_contract_terms     | 合同条款表
-- crm_contract_attachments | 合同附件表
-- crm_orders             | 订单表
-- crm_order_items        | 订单明细表
-- crm_payments           | 支付记录表
-- crm_products           | 产品表
-- crm_product_categories | 产品分类表
-- crm_product_specs      | 产品规格表
```

#### 2. 检查表注释（必须有）

```sql
-- 检查哪些表缺少注释
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name LIKE 'crm_%'
  AND obj_description(oid) IS NULL;

-- 如果有表缺少注释，执行：
COMMENT ON TABLE crm_customers IS '客户表';
COMMENT ON TABLE crm_contacts IS '联系人表';
-- ... 为所有表添加注释
```

#### 3. 检查字段注释（必须有）

```sql
-- 检查客户表字段注释
SELECT column_name, col_description(a.attrelid, a.attnum) AS comment
FROM information_schema.columns
JOIN pg_attribute a ON a.attname = column_name
WHERE table_name = 'crm_customers'
  AND table_schema = 'public'
ORDER BY ordinal_position;

-- 如果字段缺少注释，执行：
COMMENT ON COLUMN crm_customers.customer_name IS '客户名称';
COMMENT ON COLUMN crm_customers.industry IS '所属行业';
-- ... 为所有字段添加注释
```

#### 4. 检查主键（必须有）

```sql
-- 检查所有表的主键
SELECT tc.table_name, kcu.column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'PRIMARY KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name LIKE 'crm_%';

-- 预期：所有表都有id字段作为主键
```

#### 5. ⚠️ 检查外键（重要！FastApiAdmin不支持物理外键）

```sql
-- FastApiAdmin规范：不使用物理外键，改用COMMENT注释说明关系
-- 检查是否有物理外键
SELECT tc.table_name, kcu.column_name, ccu.table_name AS references_table
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name LIKE 'crm_%';

-- ⚠️ 如果有物理外键，需要删除（FastApiAdmin不支持）
-- ALTER TABLE crm_contacts DROP CONSTRAINT fk_contacts_customer;

-- ✅ 正确做法：用COMMENT注释说明关系
COMMENT ON COLUMN crm_contacts.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_followups.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_quotations.opportunity_id IS '商机ID（关联crm_opportunities.id）';
```

---

### 二、代码生成器配置检查

#### 1. 访问代码生成器

```
URL: http://localhost:5181/#/system/codegen
```

#### 2. 检查数据库连接

```
点击"导入数据库表"
✅ 如果能显示表列表 → 连接正常
❌ 如果报错 → 检查数据库配置
```

#### 3. 检查模板列表

```
模板应该包含：
✅ 单表·MySQL
✅ 单表·PostgreSQL（CRM使用这个）
✅ 单表·SQL Server
✅ 主表·MySQL
✅ 主表·PostgreSQL
```

#### 4. 检查软删除字段配置

```
访问：代码生成器 → 模板管理 → 单表·PostgreSQL

确认排除列表包含：
['id', 'uuid', 'status', 'description', 
 'created_time', 'updated_time', 
 'created_id', 'updated_id',
 'is_deleted', 'deleted_time', 'deleted_id']

⚠️ 这些字段由ModelMixin提供，不应重复生成
```

---

## 第二部分：主从表关系识别

### 一、CRM系统主从表关系图

```
客户管理模块
├── crm_customers（主表）- 客户表
│   ├── customer_id → crm_contacts（从表）- 联系人表
│   └── customer_id → crm_followups（从表）- 跟进记录表

商机管理模块
├── crm_opportunities（主表）- 商机表
│   └── opportunity_id → crm_quotations（从表）- 报价单表

合同管理模块
├── crm_contracts（主表）- 合同表
│   ├── contract_id → crm_contract_terms（从表）- 合同条款表
│   └── contract_id → crm_contract_attachments（从表）- 合同附件表

订单管理模块
├── crm_orders（主表）- 订单表
│   ├── order_id → crm_order_items（从表）- 订单明细表
│   └── order_id → crm_payments（从表）- 支付记录表

产品管理模块
├── crm_product_categories（主表）- 产品分类表
│   └── category_id → crm_products（从表）- 产品表
└── crm_products（主表）- 产品表
    └── product_id → crm_product_specs（从表）- 产品规格表
```

### 二、主从表识别规则

#### 规则1: 看外键字段名

```
从表的外键字段命名规律：
crm_contacts.customer_id       → 主表是 crm_customers
crm_followups.customer_id      → 主表是 crm_customers
crm_quotations.opportunity_id  → 主表是 crm_opportunities
crm_order_items.order_id       → 主表是 crm_orders
```

#### 规则2: 看表名关系

```
主表：名词单数（customers, opportunities, contracts）
从表：名词复数或带后缀（contacts, followups, items, terms）
```

#### 规则3: 看业务逻辑

```
一个客户 → 多个联系人（1对多）
一个客户 → 多条跟进记录（1对多）
一个商机 → 多个报价单（1对多）
一个合同 → 多个条款（1对多）
一个订单 → 多个明细（1对多）
```

---

## 第三部分：代码生成步骤（详细）

### 一、P0优先级：客户管理模块

#### 步骤1: 生成主表 crm_customers

**1.1 导入表**

```
1. 访问: http://localhost:5180/#/system/codegen
2. 点击"导入数据库表"
3. 搜索: crm_customers
4. 勾选该表
5. 点击"导入"
```

**1.2 基础配置（截图对应位置）**

```
生成回显/生成文件路径:
├─ 后端路径: backend/app/plugin/module_crm/customers/
├─ 前端视图路径: frontend/src/views/module_crm/customers/
├─ 前端API文件: frontend/src/api/module_crm/customers.ts
└─ 权限: module_crm:customers:query

基础信息:
├─ 表名称: crm_customers
├─ 实体类名称: CrmCustomers
├─ 包名: module_crm
├─ 模块名: crm
├─ 功能名: 客户管理
├─ 表描述: 客户表
├─ 业务名: （留空）
├─ 上级菜单: 不选（作为一级菜单）
└─ 备注: CRM客户管理主模块
```

**1.3 字段配置**

```
列表显示字段（5-8个）:
✅ customer_name（客户名称）
✅ industry（所属行业）
✅ level（客户等级）
✅ status（客户状态）
✅ phone（联系电话）
✅ created_time（创建时间）

查询字段（3-5个）:
✅ customer_name（客户名称）- 模糊查询
✅ industry（所属行业）- 下拉选择
✅ level（客户等级）- 下拉选择
✅ status（客户状态）- 下拉选择

表单字段:
✅ 所有必填字段都勾选
✅ 选填字段按需勾选
```

**1.4 字典关联配置**

```
industry（所属行业）:
├─ 字典类型: crm_industry
└─ 关联字典: 客户行业字典

level（客户等级）:
├─ 字典类型: crm_customer_level
└─ 关联字典: 客户等级字典（A/B/C/D）

status（客户状态）:
├─ 字典类型: crm_customer_status
└─ 关联字典: 客户状态字典（潜在/意向/成交/流失）
```

**1.5 预览检查**

```
点击"预览"，检查：
✅ model.py - 模型定义正确
✅ schema.py - Schema定义正确
✅ crud.py - CRUD操作正确
✅ service.py - 业务逻辑正确
✅ controller.py - 路由定义正确
✅ index.vue - 前端页面正确

⚠️ 重点检查：
- 是否排除了软删除字段（is_deleted等）
- 字典关联是否正确
- 列表字段是否合理
```

**1.6 生成代码**

```
点击"生成代码":
├─ 生成方式: 写入本地
├─ 项目路径: D:\APP-WEB\CRM\crm-fastapi
└─ 点击"确定"

生成后验证文件结构:
backend/app/plugin/module_crm/customers/
├── model.py          ✅
├── schema.py         ✅
├── crud.py           ✅
├── service.py        ✅
├── controller.py     ✅
└── __init__.py       ✅

frontend/src/views/module_crm/customers/
└── index.vue         ✅

frontend/src/api/module_crm/
└── customers.ts      ✅
```

**1.7 测试验证**

```
1. 重启后端服务（热更新自动重启）
2. 刷新前端页面
3. 检查菜单是否出现"客户管理"
4. 测试增删改查功能
5. 测试字典下拉是否正常
6. 测试查询过滤功能
```

---

#### 步骤2: 生成从表 crm_contacts

**⚠️ 重要：从表配置与主表不同！**

**2.1 导入表**

```
1. 访问: http://localhost:5181/#/system/codegen
2. 点击"导入数据库表"
3. 搜索: crm_contacts
4. 勾选该表
5. 点击"导入"
```

**2.2 基础配置（关键差异）**

```
生成回显/生成文件路径:
├─ 后端路径: backend/app/plugin/module_crm/contacts/
├─ 前端视图路径: frontend/src/views/module_crm/contacts/
├─ 前端API文件: frontend/src/api/module_crm/contacts.ts
└─ 权限: module_crm:contacts:query

基础信息:
├─ 表名称: crm_contacts
├─ 实体类名称: CrmContacts
├─ 包名: module_crm
├─ 模块名: crm
├─ 功能名: 联系人管理
├─ 表描述: 联系人表（客户中心的子模块）
├─ 业务名: （留空）
├─ 上级菜单: ️ 选择"客户管理"（挂在主表下）
└─ 备注: 客户联系人管理，crm_customers的子模块

⚠️ 子表配置（红框部分）:
├─ 子表表名: （留空，这是主表才填的）
└─ 子表外键列: （留空，这是主表才填的）
```

**2.3 字段配置（关键差异）**

```
列表显示字段:
✅ contact_name（联系人姓名）
✅ position（职位）
✅ phone（联系电话）
✅ email（邮箱）
✅ customer_id（所属客户）⚠️ 重要
✅ created_time（创建时间）

查询字段:
✅ contact_name（联系人姓名）- 模糊查询
✅ customer_id（所属客户）- 下拉选择⚠️
✅ phone（联系电话）

表单字段:
✅ contact_name（必填）
✅ customer_id（必填）⚠️ 重要：关联主表
✅ position
✅ phone
✅ email
```

**2.4 外键字段特殊配置**

```
customer_id字段配置:
├─ 显示类型: 下拉选择（关联客户表）
├─ 关联表: crm_customers
├─ 关联字段: id
├─ 显示字段: customer_name（客户名称）
└─ 查询方式: 精确匹配

⚠️ 注意：
- customer_id不是字典，是关联表查询
- 前端显示客户名称，不是ID
- 表单提交时传ID，列表显示名称
```

**2.5 预览检查**

```
重点检查model.py:
✅ customer = relationship("CrmCustomersModel", backref="contacts")
   - 必须有relationship定义
   - backref用于反向查询

重点检查schema.py:
✅ customer_name: str = None  # 关联查询字段
   - 用于列表显示客户名称

重点检查controller.py:
✅ 分页查询必须关联客户表
   - 否则列表显示ID，不显示名称
```

**2.6 生成代码**

```
同主表步骤，生成并验证文件
```

**2.7 测试验证**

```
1. 检查菜单结构：
   客户管理（主菜单）
   └── 联系人管理（子菜单）✅

2. 测试关联查询：
   - 新增联系人时，客户下拉正常
   - 列表显示客户名称，不是ID
   - 按客户过滤正常

3. 测试外键约束：
   - 选择已删除的客户，应报错
   - 删除客户时，联系人处理正常
```

---

#### 步骤3: 生成从表 crm_followups

```
配置同crm_contacts，注意：

基础信息:
├─ 功能名: 跟进记录管理
├─ 上级菜单: 客户管理
└─ 备注: 客户跟进记录，crm_customers的子模块

字段配置:
├─ customer_id（关联客户表）⚠️
├─ followup_type（跟进类型）- 字典
├─ content（跟进内容）
└─ followup_time（跟进时间）

外键字段customer_id配置:
├─ 关联表: crm_customers
├─ 显示字段: customer_name
└─ 查询方式: 精确匹配
```

---

### 二、P0优先级：商机管理模块

#### 步骤1: 生成主表 crm_opportunities

```
配置同客户管理主表，注意：

字典关联:
├─ stage（商机阶段）→ crm_opportunity_stage
├─ source（商机来源）→ crm_opportunity_source
└─ status（商机状态）→ crm_opportunity_status

列表字段:
├─ opportunity_name（商机名称）
├─ customer_id（关联客户）⚠️ 关联查询
├─ amount（预计金额）
├─ stage（商机阶段）
└─ close_date（预计成交日期）
```

#### 步骤2: 生成从表 crm_quotations

```
配置同联系人从表，注意：

基础信息:
├─ 功能名: 报价单管理
├─ 上级菜单: 商机管理
└─ 备注: 商机报价单，crm_opportunities的子模块

外键字段:
└─ opportunity_id → crm_opportunities（关联商机表）

列表字段:
├─ quotation_no（报价单号）
├─ opportunity_id（关联商机）⚠️
├─ total_amount（报价总额）
├─ status（报价状态）
└─ valid_until（有效期至）
```

---

### 三、P0优先级：合同管理模块

#### 步骤1: 生成主表 crm_contracts

```
字典关联:
├─ contract_type（合同类型）→ crm_contract_type
├─ status（合同状态）→ crm_contract_status
└─ payment_method（付款方式）→ crm_payment_method

列表字段:
├─ contract_no（合同编号）
├─ customer_id（关联客户）⚠️
─ contract_name（合同名称）
├─ amount（合同金额）
├─ status（合同状态）
└─ sign_date（签订日期）
```

#### 步骤2: 生成从表 crm_contract_terms

```
基础信息:
├─ 功能名: 合同条款管理
├─ 上级菜单: 合同管理
└─ 备注: 合同条款明细，crm_contracts的子模块

外键字段:
└─ contract_id → crm_contracts（关联合同表）

列表字段:
├─ contract_id（关联合同）⚠️
├─ term_type（条款类型）
├─ content（条款内容）
└─ sort_order（排序）
```

#### 步骤3: 生成从表 crm_contract_attachments

```
基础信息:
├─ 功能名: 合同附件管理
├─ 上级菜单: 合同管理
└─ 备注: 合同附件文件，crm_contracts的子模块

外键字段:
└─ contract_id → crm_contracts（关联合同表）

特殊配置:
├─ 文件上传组件
├─ file_url（文件路径）
├─ file_name（文件名）
└─ file_size（文件大小）
```

---

## 第四部分：常见错误及解决方案

### 错误1: 菜单层级错误

**问题**: 从表生成为一级菜单，没有挂在主表下

**原因**: 上级菜单未选择

**解决**:
```
从表配置时：
上级菜单 → 选择对应的主表功能
例如：
  联系人管理 → 上级菜单选择"客户管理"
  报价单管理 → 上级菜单选择"商机管理"
```

---

### 错误2: 外键字段显示ID而非名称

**问题**: 列表显示customer_id=1，而不是客户名称

**原因**: 未配置关联查询

**解决**:
```python
# model.py 添加relationship
class CrmContactModel(BaseModel):
    customer = relationship("CrmCustomersModel", backref="contacts")

# schema.py 添加显示字段
class CrmContactOutSchema(CrmContactBaseSchema):
    customer_name: str = None  # 关联查询字段

# controller.py 修改查询
async def get_page(...):
    query = select(CrmContactModel).options(
        joinedload(CrmContactModel.customer)
    )
```

---

### 错误3: 子表配置填错位置

**问题**: 在主表的"子表表名"填写了从表名

**原因**: 误解了子表配置的用途

**解决**:
```
⚠️ 重要理解：
"子表表名"和"子表外键列"是主表·模板专用的
用于生成主从表一体的表单（如订单+订单明细）

CRM系统使用的是单表·模板
每个表独立生成，通过菜单层级体现主从关系

正确做法：
主表：不填"子表表名"和"子表外键列"
从表：不填"子表表名"和"子表外键列"
通过"上级菜单"体现主从关系
```

---

### 错误4: 软删除字段重复定义

**问题**: 生成代码报错，is_deleted字段重复

**原因**: 未排除ModelMixin提供的字段

**解决**:
```
检查模板排除列表：
['id', 'uuid', 'status', 'description',
 'created_time', 'updated_time',
 'created_id', 'updated_id',
 'is_deleted', 'deleted_time', 'deleted_id']

如果缺少，手动添加并保存模板
```

---

### 错误5: 字典未创建

**问题**: 生成代码后，下拉框空白

**原因**: 字典表中没有对应字典

**解决**:
```
1. 访问: 系统管理 → 字典管理
2. 创建字典：
   - crm_industry（客户行业）
   - crm_customer_level（客户等级）
   - crm_customer_status（客户状态）
   - ... 所有需要的字典
3. 添加字典数据
4. 刷新页面
```

---

## 第五部分：生成顺序总结

### 完整生成顺序

```
第1批：客户管理模块（P0）
  1. crm_customers（主表）
  2. crm_contacts（从表，上级菜单：客户管理）
  3. crm_followups（从表，上级菜单：客户管理）

第2批：商机管理模块（P0）
  4. crm_opportunities（主表）
  5. crm_quotations（从表，上级菜单：商机管理）

第3批：合同管理模块（P0）
  6. crm_contracts（主表）
  7. crm_contract_terms（从表，上级菜单：合同管理）
  8. crm_contract_attachments（从表，上级菜单：合同管理）

第4批：订单管理模块（P1）
  9. crm_orders（主表）
  10. crm_order_items（从表，上级菜单：订单管理）
  11. crm_payments（从表，上级菜单：订单管理）

第5批：产品管理模块（P1）
  12. crm_product_categories（主表）
  13. crm_products（从表，上级菜单：产品管理）
  14. crm_product_specs（从表，上级菜单：产品管理）
```

---

## 第六部分：快速检查清单

### 每个表生成后必查项

```
✅ 1. 文件完整性
   - 后端6个文件
   - 前端1个文件
   - API 1个文件

✅ 2. 菜单层级
   - 主表：一级菜单
   - 从表：二级菜单（挂在主表下）

✅ 3. 外键关联
   - 列表显示名称，不显示ID
   - 表单下拉正常
   - 过滤查询正常

✅ 4. 字典关联
   - 下拉框有数据
   - 显示文本正确

✅ 5. 软删除
   - 删除不真正删除
   - is_deleted=1
   - 列表不显示已删除

✅ 6. 权限控制
   - 权限标识正确
   - 按钮权限正常

✅ 7. 功能测试
   - 新增正常
   - 编辑正常
   - 删除正常
   - 查询正常
   - 分页正常
```

---

## 总结

**核心要点**：
1. ✅ 先生成主表，后生成从表
2. ✅ 从表的"上级菜单"选择主表
3. ✅ 外键字段配置关联查询
4. ✅ 不使用物理外键，用COMMENT说明
5. ✅ 排除ModelMixin字段
6. ✅ 每个表生成后立即测试

**避免错误**：
1. ❌ 不要填"子表表名"和"子表外键列"
2. ❌ 不要忘记设置"上级菜单"
3. ❌ 不要遗漏字典创建
4. ❌ 不要忘记配置外键关联查询
5. ❌ 不要跳过测试验证

按照本指南操作，可零错误完成所有CRM模块代码生成！
