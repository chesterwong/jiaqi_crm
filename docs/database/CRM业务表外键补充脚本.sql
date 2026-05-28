-- ============================================================================
-- CRM 业务表外键关联补充脚本（简化版）
-- 
-- 说明: 系统表已存在，只需为 CRM 业务表添加外键约束和索引
-- 执行方式: docker exec -i postgres psql -U crm_user -d crm < 此文件
-- ============================================================================

BEGIN;

-- ============================================================================
-- 第一部分：为 CRM 业务表添加外键约束
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 客户管理模块
-- ----------------------------------------------------------------------------

-- crm_customers（客户表）- owner_id 和 department_id
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_owner') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_dept') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_contacts（联系人表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_owner') THEN
        ALTER TABLE "public"."crm_contacts" 
        ADD CONSTRAINT fk_crm_contacts_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_customer') THEN
        ALTER TABLE "public"."crm_contacts" 
        ADD CONSTRAINT fk_crm_contacts_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
END $$;

-- crm_followups（跟进记录表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_owner') THEN
        ALTER TABLE "public"."crm_followups" 
        ADD CONSTRAINT fk_crm_followups_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_customer') THEN
        ALTER TABLE "public"."crm_followups" 
        ADD CONSTRAINT fk_crm_followups_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
END $$;


-- ----------------------------------------------------------------------------
-- 销售管理模块
-- ----------------------------------------------------------------------------

-- crm_opportunities（商机表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_owner') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_dept') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_customer') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
END $$;

-- crm_leads（线索表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_owner') THEN
        ALTER TABLE "public"."crm_leads" 
        ADD CONSTRAINT fk_crm_leads_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_campaigns（市场活动表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_owner') THEN
        ALTER TABLE "public"."crm_campaigns" 
        ADD CONSTRAINT fk_crm_campaigns_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_dept') THEN
        ALTER TABLE "public"."crm_campaigns" 
        ADD CONSTRAINT fk_crm_campaigns_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
END $$;


-- ----------------------------------------------------------------------------
-- 产品与合同模块
-- ----------------------------------------------------------------------------

-- crm_contracts（合同表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_owner') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_dept') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_customer') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_opportunity') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_opportunity 
        FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_quotations（报价单表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_owner') THEN
        ALTER TABLE "public"."crm_quotations" 
        ADD CONSTRAINT fk_crm_quotations_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_opportunity') THEN
        ALTER TABLE "public"."crm_quotations" 
        ADD CONSTRAINT fk_crm_quotations_opportunity 
        FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities"("id") ON DELETE SET NULL;
    END IF;
END $$;


-- ============================================================================
-- 第二部分：创建必要的索引
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_crm_customers_owner ON "public"."crm_customers"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_customers_dept ON "public"."crm_customers"("department_id");

CREATE INDEX IF NOT EXISTS idx_crm_contacts_owner ON "public"."crm_contacts"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_contacts_customer ON "public"."crm_contacts"("customer_id");

CREATE INDEX IF NOT EXISTS idx_crm_opportunities_owner ON "public"."crm_opportunities"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_dept ON "public"."crm_opportunities"("department_id");
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_customer ON "public"."crm_opportunities"("customer_id");

CREATE INDEX IF NOT EXISTS idx_crm_contracts_owner ON "public"."crm_contracts"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_dept ON "public"."crm_contracts"("department_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_customer ON "public"."crm_contracts"("customer_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_opportunity ON "public"."crm_contracts"("opportunity_id");

CREATE INDEX IF NOT EXISTS idx_crm_leads_owner ON "public"."crm_leads"("owner_id");

CREATE INDEX IF NOT EXISTS idx_crm_campaigns_owner ON "public"."crm_campaigns"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_campaigns_dept ON "public"."crm_campaigns"("department_id");


-- ============================================================================
-- 第三部分：验证统计
-- ============================================================================

DO $$
DECLARE
    constraint_count INTEGER;
    index_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO constraint_count
    FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
    AND table_schema = 'public'
    AND table_name LIKE 'crm_%'
    AND constraint_name LIKE 'fk_crm_%';
    
    SELECT COUNT(*) INTO index_count
    FROM pg_indexes
    WHERE schemaname = 'public'
    AND tablename LIKE 'crm_%'
    AND indexname LIKE 'idx_crm_%';
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ CRM 业务表外键关联完成！';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📊 统计信息:';
    RAISE NOTICE '  - 新增外键约束: % 个', constraint_count;
    RAISE NOTICE '  - 新增索引: % 个', index_count;
    RAISE NOTICE '========================================';
END $$;

COMMIT;
