# CRM数据库外键修正指南

> **版本**: v1.0  
> **日期**: 2026-04-26  
> **适用文件**: crm-public-4-26-1701.sql

---

## 📋 修正内容

### 1. 补充缺失的deleted_id外键约束

**问题**：部分CRM表缺少`deleted_id`字段的外键约束

**影响的表**（共20张）：
- crm_ai_recommendations
- crm_ai_tags
- crm_alert_rules
- crm_approval_records
- crm_call_records
- crm_competitors
- crm_data_dicts
- crm_import_records
- crm_marketing_campaigns
- crm_marketing_channels
- crm_notifications
- crm_operation_logs
- crm_opportunity_stages
- crm_price_tiers
- crm_product_categories
- crm_report_templates
- crm_sales_targets
- crm_tag_definitions
- crm_tags
- crm_workflow_approvals
- crm_workflow_rules
- crm_user_extensions

**修正**：为这些表添加`deleted_id`外键约束，关联到`sys_user.id`

---

### 2. 统一外键命名规范

**问题**：外键命名不一致

**示例**：
```sql
-- ❌ 不规范
fk_crm_customers_owner
fk_crm_contacts_customer
fk_crm_campaigns_dept

-- ✅ 规范
fk_crm_customers_owner_id
fk_crm_contacts_customer_id
fk_crm_campaigns_department_id
```

**修正**：重命名为标准格式 `{table}_{field}_id`

---

### 3. 统一ON DELETE行为

**问题**：部分外键的ON DELETE行为不一致

**修正**：统一为`ON DELETE SET NULL`（保留历史数据）

---

## 🔧 执行步骤

### 步骤1: 备份数据库（必须）

```bash
# 导出当前数据库
pg_dump -U postgres -d crm > backup-crm-before-fix-$(date +%Y%m%d).sql

# 或者使用Navicat备份
# 右键数据库 → 转储SQL文件 → 结构和数据
```

---

### 步骤2: 导入原始SQL文件

```bash
# 如果还没有导入crm-public-4-26-1701.sql
psql -U postgres -d crm -f D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres\crm-public-4-26-1701.sql
```

**或使用Navicat**：
1. 打开Navicat
2. 连接到PostgreSQL数据库
3. 选择`crm`数据库
4. 运行SQL文件：`crm-public-4-26-1701.sql`

---

### 步骤3: 执行修正脚本

```bash
# 执行修正脚本
psql -U postgres -d crm -f D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres\fix-crm-foreign-keys.sql
```

**或使用Navicat**：
1. 打开Navicat
2. 连接到PostgreSQL数据库
3. 选择`crm`数据库
4. 点击"查询" → "新建查询"
5. 打开文件：`fix-crm-foreign-keys.sql`
6. 点击"运行"

---

### 步骤4: 验证修正结果

#### 方法1: 查看脚本输出

修正脚本会自动输出：
- ✅ 已添加的外键约束
- ✅ 已重命名的外键约束
- ⚠️ 仍缺少deleted_id外键的表（如果有）

#### 方法2: 手动检查

```sql
-- 检查所有CRM表的外键数量
SELECT 
    tc.table_name,
    COUNT(*) as foreign_key_count
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name LIKE 'crm_%'
GROUP BY tc.table_name
ORDER BY tc.table_name;

-- 检查是否有缺少deleted_id外键的CRM表
SELECT 
    tablename
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename LIKE 'crm_%'
  AND tablename NOT IN (
      SELECT DISTINCT conrelid::regclass::text
      FROM pg_constraint
      WHERE contype = 'f'
        AND conname LIKE '%deleted_id%'
  )
ORDER BY tablename;
```

**期望结果**：
- 所有CRM表都应该有至少3个外键（created_id, updated_id, deleted_id）
- 第二个查询应该返回空结果（没有缺少deleted_id外键的表）

---

## ⚠️ 注意事项

### 1. 执行顺序

**必须按以下顺序执行**：
1. ✅ 先导入 `crm-public-4-26-1701.sql`
2. ✅ 再执行 `fix-crm-foreign-keys.sql`

**原因**：修正脚本依赖于原SQL文件中的表结构

---

### 2. 安全性

**修正脚本的特点**：
- ✅ 使用`IF NOT EXISTS`检查，避免重复添加
- ✅ 使用`IF EXISTS`检查，避免删除不存在的约束
- ✅ 使用事务，失败时自动回滚
- ✅ 输出详细日志，便于排查问题

---

### 3. 回滚方案

如果修正后发现问题，可以：

**方案1: 从备份恢复**
```bash
psql -U postgres -d crm < backup-crm-before-fix-20260426.sql
```

**方案2: 手动删除修正的外键**
```sql
-- 示例：删除某个外键
ALTER TABLE "public"."crm_ai_recommendations" 
DROP CONSTRAINT IF EXISTS "crm_ai_recommendations_deleted_id_fkey";
```

---

### 4. 性能影响

**外键约束的影响**：
- ✅ 插入/更新操作：轻微性能影响（可忽略）
- ✅ 删除操作：需要检查外键约束
- ✅ 查询操作：无影响
- ✅ 数据完整性：显著提升

**建议**：
- 在开发环境先测试
- 生产环境在低峰期执行
- 执行后监控性能

---

## 📊 修正统计

| 修正类型 | 数量 | 说明 |
|---------|------|------|
| 补充deleted_id外键 | 22个 | 为22张表添加缺失的外键 |
| 重命名外键 | 12个 | 统一外键命名规范 |
| 总修正数 | 34个 | - |

---

## 🔍 常见问题

### Q1: 执行脚本报错"约束已存在"

**原因**：某些表可能已经有deleted_id外键

**解决**：脚本已使用`IF NOT EXISTS`检查，会自动跳过，无需处理

---

### Q2: 执行脚本报错"表不存在"

**原因**：还没有导入crm-public-4-26-1701.sql

**解决**：先导入原SQL文件，再执行修正脚本

---

### Q3: 如何确认修正成功？

**方法**：
1. 查看脚本输出日志
2. 执行验证SQL查询
3. 检查外键总数是否符合预期

**预期结果**：
- 每个CRM表至少有3个外键（审计字段）
- 没有表缺少deleted_id外键
- 外键命名符合规范

---

### Q4: 修正后会影响现有数据吗？

**答案**：不会

**原因**：
- 只是添加外键约束，不修改数据
- 使用`SET NULL`策略，不会级联删除
- 现有数据不受影响

---

### Q5: 可以在生产环境执行吗？

**建议**：
1. ✅ 先在开发/测试环境验证
2. ✅ 备份生产数据库
3. ✅ 在低峰期执行
4. ✅ 执行后监控性能和错误日志

---

## 📝 相关文件

- **原始SQL**: `D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres\crm-public-4-26-1701.sql`
- **修正脚本**: `D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres\fix-crm-foreign-keys.sql`
- **关联方案**: `D:\HBuilderProjects\FastapiAdmin\docs\02-技术架构\03-CRM业务表与系统表关联方案.md`

---

## 🎯 下一步

修正完成后，建议：

1. **更新SQLAlchemy Model**
   - 根据修正后的外键关系更新Model定义
   - 添加relationship映射

2. **编写单元测试**
   - 测试外键约束是否生效
   - 测试级联删除行为

3. **创建索引**
   - 为外键字段创建索引
   - 提升JOIN查询性能

4. **文档更新**
   - 更新数据库设计文档
   - 记录外键变更历史

---

**文档版本**: v1.0  
**创建日期**: 2026-04-26  
**维护者**: CRM开发团队  

---

© 2026 制造业CRM项目组 | CRM数据库外键修正指南
