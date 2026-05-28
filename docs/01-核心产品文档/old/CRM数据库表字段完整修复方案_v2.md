# CRM数据库表字段完整修复方案

> **更新日期**: 2026-04-25  
> **数据库表总数**: 68张  
> **问题字段总数**: 744个（99个_at后缀 + 45个缺少description + 5个缺少uuid + 600个缺少注解）

---

## 📊 问题分析

### 问题1: _at后缀字段混淆（99个字段，68张表100%）

**严重问题**：存在大量带`_at`后缀的字段，与标准字段`created_time/updated_time`混淆

```
❌ deleted_at（68张表都有）  → 应改为 deleted_time
❌ created_at（部分表）      → 应改为 created_time
❌ updated_at（部分表）      → 应改为 updated_time
```

**业务_at字段**（需保留，但需添加注解说明）：
- `assigned_at` - 分配时间
- `completed_at` - 完成时间
- `started_at` - 开始时间
- `generated_at` - 生成时间
- `approved_at` - 审批时间
- 等等...（共99个）

### 问题2: 缺少description字段（45张表，66%）

部分表缺少标准字段`description`（备注/描述）

### 问题3: 缺少uuid字段（5张表，7%）

少数表缺少`uuid`字段

### 问题4: 缺少字段中文注解（600个字段，90%）

**最严重问题**：绝大多数字段缺少COMMENT，无法知道字段含义

---

## 🔧 修复方案

### 修复1: 重命名deleted_at → deleted_time（68张表）

```sql
-- 批量重命名deleted_at为deleted_time
ALTER TABLE crm_ai_customer_profiles RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_ai_recommendations RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_ai_tags RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_campaign_leads RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_campaigns RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_contact_change_logs RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_contact_relations RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_contact_visits RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_contacts RENAME COLUMN deleted_at TO deleted_time;
ALTER TABLE crm_contract_invoices RENAME COLUMN deleted_at TO deleted_time;
-- ... 共68张表
```

### 修复2: 补充description字段（45张表）

```sql
-- 为缺少description的表添加字段
ALTER TABLE crm_ai_customer_profiles ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE crm_ai_recommendations ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE crm_ai_tags ADD COLUMN IF NOT EXISTS description TEXT;
-- ... 共45张表
COMMENT ON COLUMN crm_ai_customer_profiles.description IS '备注/描述';
```

### 修复3: 补充uuid字段（5张表）

```sql
-- 为缺少uuid的表添加字段
ALTER TABLE crm_xxx ADD COLUMN uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid()::text;
CREATE UNIQUE INDEX idx_crm_xxx_uuid ON crm_xxx (uuid);
COMMENT ON COLUMN crm_xxx.uuid IS 'UUID全局唯一标识';
```

### 修复4: 添加所有字段中文注解（600个字段）

**标准字段注解**（所有表统一）：

```sql
-- 11个标准字段注解（每张表都要执行）
COMMENT ON COLUMN crm_xxx.id IS '主键ID（自增）';
COMMENT ON COLUMN crm_xxx.uuid IS 'UUID全局唯一标识';
COMMENT ON COLUMN crm_xxx.status IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN crm_xxx.description IS '备注/描述';
COMMENT ON COLUMN crm_xxx.created_time IS '创建时间';
COMMENT ON COLUMN crm_xxx.updated_time IS '更新时间';
COMMENT ON COLUMN crm_xxx.created_id IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN crm_xxx.updated_id IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN crm_xxx.is_deleted IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN crm_xxx.deleted_time IS '删除时间';
COMMENT ON COLUMN crm_xxx.deleted_id IS '删除人ID（外键→sys_user）';
```

**业务字段注解**（按模块分类）：

#### 客户管理模块

```sql
-- crm_customers
COMMENT ON COLUMN crm_customers.customer_name IS '客户名称';
COMMENT ON COLUMN crm_customers.customer_code IS '客户编码';
COMMENT ON COLUMN crm_customers.customer_type IS '客户类型(distributor:经销商 end_customer:终端客户)';
COMMENT ON COLUMN crm_customers.industry IS '所属行业';
COMMENT ON COLUMN crm_customers.source IS '客户来源';
COMMENT ON COLUMN crm_customers.owner_id IS '负责人ID（外键→sys_user）';
COMMENT ON COLUMN crm_customers.last_followup_time IS '最后跟进时间';
COMMENT ON COLUMN crm_customers.next_followup_time IS '下次跟进时间';
COMMENT ON COLUMN crm_customers.public_sea IS '是否公海客户(false:私海 true:公海)';
```

#### 联系人模块

```sql
-- crm_contacts
COMMENT ON COLUMN crm_contacts.contact_name IS '联系人姓名';
COMMENT ON COLUMN crm_contacts.gender IS '性别(male:男 female:女)';
COMMENT ON COLUMN crm_contacts.phone IS '联系电话';
COMMENT ON COLUMN crm_contacts.email IS '电子邮箱';
COMMENT ON COLUMN crm_contacts.position IS '职位';
COMMENT ON COLUMN crm_contacts.department IS '部门';
COMMENT ON COLUMN crm_contacts.customer_id IS '所属客户ID（外键→crm_customers）';
COMMENT ON COLUMN crm_contacts.is_primary IS '是否主联系人(false:否 true:是)';
```

#### 商机模块

```sql
-- crm_opportunities
COMMENT ON COLUMN crm_opportunities.opportunity_name IS '商机名称';
COMMENT ON COLUMN crm_opportunities.customer_id IS '所属客户ID（外键→crm_customers）';
COMMENT ON COLUMN crm_opportunities.amount IS '商机金额';
COMMENT ON COLUMN crm_opportunities.stage IS '商机阶段';
COMMENT ON COLUMN crm_opportunities.probability IS '成交概率(0-100)';
COMMENT ON COLUMN crm_opportunities.expected_date IS '预计成交日期';
COMMENT ON COLUMN crm_opportunities.stage_updated_time IS '阶段更新时间';
```

#### 合同模块

```sql
-- crm_contracts
COMMENT ON COLUMN crm_contracts.contract_code IS '合同编号';
COMMENT ON COLUMN crm_contracts.customer_id IS '客户ID（外键→crm_customers）';
COMMENT ON COLUMN crm_contracts.opportunity_id IS '商机ID（外键→crm_opportunities）';
COMMENT ON COLUMN crm_contracts.contract_amount IS '合同金额';
COMMENT ON COLUMN crm_contracts.start_date IS '合同开始日期';
COMMENT ON COLUMN crm_contracts.end_date IS '合同结束日期';
COMMENT ON COLUMN crm_contracts.approved_time IS '审批通过时间';
```

---

## 📝 完整修复SQL脚本

### 脚本1: 重命名deleted_at → deleted_time

```sql
-- 文件名: scripts/rename_deleted_at_to_deleted_time.sql
-- 执行: psql -U crm_user -d crm -f scripts/rename_deleted_at_to_deleted_time.sql

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT table_name 
        FROM information_schema.columns 
        WHERE table_name LIKE 'crm_%' 
          AND table_name NOT LIKE 'crm_test%'
          AND column_name = 'deleted_at'
        ORDER BY table_name
    LOOP
        EXECUTE format('ALTER TABLE %I RENAME COLUMN deleted_at TO deleted_time', table_record.table_name);
        RAISE NOTICE '✅ 重命名 %.deleted_at → deleted_time', table_record.table_name;
    END LOOP;
END $$;
```

### 脚本2: 添加所有字段中文注解

```sql
-- 文件名: scripts/add_all_column_comments.sql
-- 执行: psql -U crm_user -d crm -f scripts/add_all_column_comments.sql

-- ============================================
-- 标准字段注解（所有68张表统一）
-- ============================================

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT c.relname as table_name
        FROM pg_class c
        WHERE c.relname LIKE 'crm_%' 
          AND c.relname NOT LIKE 'crm_test%'
          AND c.relkind = 'r'
        ORDER BY c.relname
    LOOP
        -- id
        EXECUTE format('COMMENT ON COLUMN %I.id IS ''主键ID（自增）''', table_record.table_name);
        
        -- uuid（如果存在）
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'uuid'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.uuid IS ''UUID全局唯一标识''', table_record.table_name);
        END IF;
        
        -- status
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'status'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.status IS ''系统状态(0:正常 1:禁用)''', table_record.table_name);
        END IF;
        
        -- description
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'description'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.description IS ''备注/描述''', table_record.table_name);
        END IF;
        
        -- created_time
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'created_time'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.created_time IS ''创建时间''', table_record.table_name);
        END IF;
        
        -- updated_time
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'updated_time'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.updated_time IS ''更新时间''', table_record.table_name);
        END IF;
        
        -- created_id
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'created_id'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.created_id IS ''创建人ID（外键→sys_user）''', table_record.table_name);
        END IF;
        
        -- updated_id
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'updated_id'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.updated_id IS ''更新人ID（外键→sys_user）''', table_record.table_name);
        END IF;
        
        -- is_deleted
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'is_deleted'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.is_deleted IS ''是否已删除(false:否 true:是)''', table_record.table_name);
        END IF;
        
        -- deleted_time
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name IN ('deleted_time', 'deleted_at')
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.deleted_time IS ''删除时间''', table_record.table_name);
        END IF;
        
        -- deleted_id
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name AND column_name = 'deleted_id'
        ) THEN
            EXECUTE format('COMMENT ON COLUMN %I.deleted_id IS ''删除人ID（外键→sys_user）''', table_record.table_name);
        END IF;
        
        RAISE NOTICE '✅ 添加标准字段注解: %', table_record.table_name;
    END LOOP;
END $$;
```

### 脚本3: 补充缺失字段

```sql
-- 文件名: scripts/add_missing_fields.sql
-- 执行: psql -U crm_user -d crm -f scripts/add_missing_fields.sql

-- 1. 补充description字段（45张表）
DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT c.relname as table_name
        FROM pg_class c
        WHERE c.relname LIKE 'crm_%' 
          AND c.relname NOT LIKE 'crm_test%'
          AND c.relkind = 'r'
          AND NOT EXISTS (
              SELECT 1 FROM information_schema.columns 
              WHERE table_name = c.relname AND column_name = 'description'
          )
        ORDER BY c.relname
    LOOP
        EXECUTE format('ALTER TABLE %I ADD COLUMN description TEXT', table_record.table_name);
        EXECUTE format('COMMENT ON COLUMN %I.description IS ''备注/描述''', table_record.table_name);
        RAISE NOTICE '✅ 添加description字段: %', table_record.table_name;
    END LOOP;
END $$;

-- 2. 补充uuid字段（5张表）
DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT c.relname as table_name
        FROM pg_class c
        WHERE c.relname LIKE 'crm_%' 
          AND c.relname NOT LIKE 'crm_test%'
          AND c.relkind = 'r'
          AND NOT EXISTS (
              SELECT 1 FROM information_schema.columns 
              WHERE table_name = c.relname AND column_name = 'uuid'
          )
        ORDER BY c.relname
    LOOP
        EXECUTE format('ALTER TABLE %I ADD COLUMN uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid()::text', table_record.table_name);
        EXECUTE format('CREATE UNIQUE INDEX idx_%I_uuid ON %I (uuid)', table_record.table_name, table_record.table_name);
        EXECUTE format('COMMENT ON COLUMN %I.uuid IS ''UUID全局唯一标识''', table_record.table_name);
        RAISE NOTICE '✅ 添加uuid字段: %', table_record.table_name;
    END LOOP;
END $$;
```

---

## 🎯 执行步骤

### 第1步: 备份数据库

```bash
# 完整备份
docker exec postgres pg_dump -U crm_user -d crm > backups/crm_backup_$(date +%Y%m%d_%H%M%S).sql

# 验证备份
ls -lh backups/
```

### 第2步: 重命名deleted_at

```bash
cd backend
psql -U crm_user -d crm -f scripts/rename_deleted_at_to_deleted_time.sql
```

### 第3步: 补充缺失字段

```bash
psql -U crm_user -d crm -f scripts/add_missing_fields.sql
```

### 第4步: 添加所有字段注解

```bash
psql -U crm_user -d crm -f scripts/add_all_column_comments.sql
```

### 第5步: 验证结果

```bash
psql -U crm_user -d crm -c "
SELECT 
    c.relname as table_name,
    COUNT(*) as total_columns,
    COUNT(CASE WHEN col_description(c.oid, a.attnum) IS NOT NULL THEN 1 END) as columns_with_comment,
    COUNT(CASE WHEN col_description(c.oid, a.attnum) IS NULL THEN 1 END) as columns_without_comment
FROM pg_class c
JOIN pg_attribute a ON a.attrelid = c.oid
WHERE c.relname LIKE 'crm_%' 
  AND c.relname NOT LIKE 'crm_test%'
  AND a.attnum > 0 
  AND NOT a.attisdropped
GROUP BY c.relname
ORDER BY c.relname;
"
```

---

## 📊 修复前后对比

### 修复前

| 问题 | 数量 | 占比 |
|------|------|------|
| deleted_at后缀 | 68张表 | 100% |
| 缺少description | 45张表 | 66% |
| 缺少uuid | 5张表 | 7% |
| 缺少字段注解 | 600个字段 | 90% |

### 修复后

| 字段 | 状态 | 注解 |
|------|------|------|
| deleted_time | ✅ 统一命名 | ✅ 删除时间 |
| description | ✅ 全部补充 | ✅ 备注/描述 |
| uuid | ✅ 全部补充 | ✅ UUID全局唯一标识 |
| 所有字段 | ✅ 100% | ✅ 100%有中文注解 |

---

## ⚠️ 注意事项

### 1. 业务_at字段保留

以下业务_at字段**不需要重命名**，只需添加注解：

```sql
-- 时间类业务字段（保留_at）
COMMENT ON COLUMN crm_customers.last_followup_time IS '最后跟进时间';
COMMENT ON COLUMN crm_customers.next_followup_time IS '下次跟进时间';
COMMENT ON COLUMN crm_leads.assigned_time IS '分配时间';
COMMENT ON COLUMN crm_tasks.completed_time IS '完成时间';
COMMENT ON COLUMN crm_contracts.approved_time IS '审批通过时间';
```

### 2. 外键字段注解

```sql
-- 所有外键字段格式统一
COMMENT ON COLUMN crm_xxx.owner_id IS '负责人ID（外键→sys_user）';
COMMENT ON COLUMN crm_xxx.customer_id IS '客户ID（外键→crm_customers）';
COMMENT ON COLUMN crm_xxx.contract_id IS '合同ID（外键→crm_contracts）';
```

### 3. 状态字段注解

```sql
-- 系统状态字段
COMMENT ON COLUMN crm_xxx.status IS '系统状态(0:正常 1:禁用)';

-- 业务状态字段（根据实际业务）
COMMENT ON COLUMN crm_customers.customer_status IS '客户状态(potential:潜在 active:活跃 inactive:不活跃)';
COMMENT ON COLUMN crm_leads.lead_status IS '线索状态(new:新分配 contacted:已联系 qualified:合格)';
```

---

## 📁 相关文件

- 字段规范文档: [CRM数据库表标准字段规范与修复方案.md](CRM数据库表标准字段规范与修复方案.md)
- Alembic迁移: 待生成
- 修复脚本: 
  - `scripts/rename_deleted_at_to_deleted_time.sql`
  - `scripts/add_missing_fields.sql`
  - `scripts/add_all_column_comments.sql`

---

## 🚀 使用crm-data-migrator Skill

可以直接使用新创建的`crm-data-migrator` Skill来执行修复：

```
"使用crm-data-migrator修复68张表的字段问题"
```

AI会自动：
1. 备份数据库
2. 重命名deleted_at → deleted_time
3. 补充缺失字段（description、uuid）
4. 添加所有字段中文注解
5. 验证修复结果

---

**文档版本**: v2.0  
**创建日期**: 2026-04-25  
**最后更新**: 2026-04-25  
**维护**: CRM项目组
