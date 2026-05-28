-- ============================================================================
-- CRM 数据库字段补充脚本
-- 
-- 说明: 为缺少审计字段的表添加 created_by, updated_by, created_at, updated_at
-- 执行方式: docker exec -i postgres psql -U crm_user -d crm < 此文件
-- ============================================================================

BEGIN;

-- ============================================================================
-- 第一部分：为缺少审计字段的表添加字段
-- ============================================================================

-- 1. crm_contact_change_logs
ALTER TABLE crm_contact_change_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 2. crm_contract_items
ALTER TABLE crm_contract_items 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 3. crm_customer_activities
ALTER TABLE crm_customer_activities 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 4. crm_customer_attachments
ALTER TABLE crm_customer_attachments 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 5. crm_customer_change_logs
ALTER TABLE crm_customer_change_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 6. crm_customer_duplicate_logs
ALTER TABLE crm_customer_duplicate_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 7. crm_customer_health
ALTER TABLE crm_customer_health 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 8. crm_customer_pool_logs
ALTER TABLE crm_customer_pool_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 9. crm_lead_scores
ALTER TABLE crm_lead_scores 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 10. crm_notifications
ALTER TABLE crm_notifications 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 11. crm_operation_logs
ALTER TABLE crm_operation_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 12. crm_pool_transfers
ALTER TABLE crm_pool_transfers 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 13. crm_product_price_history
ALTER TABLE crm_product_price_history 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 14. crm_report_instances
ALTER TABLE crm_report_instances 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 15. crm_report_templates
ALTER TABLE crm_report_templates 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 16. crm_workflow_logs
ALTER TABLE crm_workflow_logs 
ADD COLUMN IF NOT EXISTS created_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS updated_by INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- ============================================================================
-- 第二部分：为新添加的字段创建索引
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_crm_contact_change_logs_created_by ON crm_contact_change_logs(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_contract_items_created_by ON crm_contract_items(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_activities_created_by ON crm_customer_activities(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_attachments_created_by ON crm_customer_attachments(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_change_logs_created_by ON crm_customer_change_logs(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_duplicate_logs_created_by ON crm_customer_duplicate_logs(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_health_created_by ON crm_customer_health(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_customer_pool_logs_created_by ON crm_customer_pool_logs(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_lead_scores_created_by ON crm_lead_scores(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_notifications_created_by ON crm_notifications(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_operation_logs_created_by ON crm_operation_logs(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_pool_transfers_created_by ON crm_pool_transfers(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_product_price_history_created_by ON crm_product_price_history(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_report_instances_created_by ON crm_report_instances(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_report_templates_created_by ON crm_report_templates(created_by);
CREATE INDEX IF NOT EXISTS idx_crm_workflow_logs_created_by ON crm_workflow_logs(created_by);


-- ============================================================================
-- 第三部分：验证统计
-- ============================================================================

DO $$
DECLARE
    missing_audit INTEGER;
    total_fks INTEGER;
BEGIN
    -- 检查还有多少表缺少审计字段
    SELECT COUNT(*) INTO missing_audit
    FROM information_schema.tables t
    WHERE t.table_schema = 'public'
    AND t.table_name LIKE 'crm_%'
    AND NOT EXISTS (
        SELECT 1 FROM information_schema.columns c 
        WHERE c.table_name = t.table_name 
        AND c.column_name IN ('created_by', 'updated_by')
    );
    
    -- 统计外键总数
    SELECT COUNT(*) INTO total_fks
    FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
    AND table_schema = 'public'
    AND table_name LIKE 'crm_%';
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '字段补充完成！';
    RAISE NOTICE '========================================';
    RAISE NOTICE '仍缺少审计字段的表: % 张', missing_audit;
    RAISE NOTICE 'CRM 外键总数: % 个', total_fks;
    RAISE NOTICE '========================================';
END $$;

COMMIT;
