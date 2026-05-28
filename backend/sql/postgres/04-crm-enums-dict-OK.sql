-- =============================================
-- CRM Database - Business Table Enum Dictionary Data
-- Only CRM business table enums (system dicts excluded)
-- Source: crm-enums-dict-data.sql
-- Standard: All dict_types use PLURAL table names (matching actual table names in 02-crm-business-tables-OK.sql)
-- =============================================

SET search_path TO public;

-- 确保序列存在并设置默认值，重置序列值为当前最大 id + 1
DO $$
DECLARE
    max_type_id INTEGER;
    max_data_id INTEGER;
BEGIN
    -- 检查并创建 sys_dict_type_id_seq 序列
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'public' AND sequencename = 'sys_dict_type_id_seq') THEN
        CREATE SEQUENCE public.sys_dict_type_id_seq START WITH 1 INCREMENT BY 1;
    END IF;
    
    -- 检查并创建 sys_dict_data_id_seq 序列
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'public' AND sequencename = 'sys_dict_data_id_seq') THEN
        CREATE SEQUENCE public.sys_dict_data_id_seq START WITH 1 INCREMENT BY 1;
    END IF;
    
    -- 设置 sys_dict_type.id 的默认值
    IF NOT EXISTS (
        SELECT 1 FROM pg_attrdef d
        JOIN pg_attribute a ON a.attrelid = d.adrelid AND a.attnum = d.adnum
        JOIN pg_class c ON c.oid = a.attrelid
        WHERE c.relname = 'sys_dict_type' AND a.attname = 'id'
    ) THEN
        ALTER TABLE sys_dict_type ALTER COLUMN id SET DEFAULT nextval('sys_dict_type_id_seq');
    END IF;
    
    -- 设置 sys_dict_data.id 的默认值
    IF NOT EXISTS (
        SELECT 1 FROM pg_attrdef d
        JOIN pg_attribute a ON a.attrelid = d.adrelid AND a.attnum = d.adnum
        JOIN pg_class c ON c.oid = a.attrelid
        WHERE c.relname = 'sys_dict_data' AND a.attname = 'id'
    ) THEN
        ALTER TABLE sys_dict_data ALTER COLUMN id SET DEFAULT nextval('sys_dict_data_id_seq');
    END IF;
    
    -- 重置 sys_dict_type_id_seq 为当前最大 id + 1
    SELECT COALESCE(MAX(id), 0) INTO max_type_id FROM sys_dict_type;
    IF max_type_id > 0 THEN
        PERFORM setval('sys_dict_type_id_seq', max_type_id + 1, false);
    END IF;
    
    -- 重置 sys_dict_data_id_seq 为当前最大 id + 1
    SELECT COALESCE(MAX(id), 0) INTO max_data_id FROM sys_dict_data;
    IF max_data_id > 0 THEN
        PERFORM setval('sys_dict_data_id_seq', max_data_id + 1, false);
    END IF;
END $$;

BEGIN;

-- =============================================
-- Ai Enums
-- =============================================

-- 状态 (crm_ai_tags_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_ai_tags_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_ai_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_ai_tags_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_ai_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_ai_tags_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_ai_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_ai_tags_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_ai_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_ai_tags_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_ai_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_ai_tags_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Campaign Enums
-- =============================================

-- 是否已转化 (crm_campaign_leads_is_converted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否已转化', 'crm_campaign_leads_is_converted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_campaign_leads_is_converted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaign_leads_is_converted'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_campaign_leads_is_converted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaign_leads_is_converted'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Campaigns Enums
-- =============================================

-- 状态 (crm_campaigns_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_campaigns_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaigns_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaigns_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaigns_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaigns_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_campaigns_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Contact Enums
-- =============================================

-- 逻辑删除标记 (crm_contact_relations_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_contact_relations_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contact_relations_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_contact_relations_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_contact_relations_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_contact_relations_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contact_relations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_contact_relations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_contact_relations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_contact_relations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_contact_relations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_relations_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_contact_visits_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_contact_visits_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contact_visits_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_contact_visits_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 拜访类型 (crm_contact_visits_visit_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('拜访类型', 'crm_contact_visits_visit_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contact_visits_visit_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_visit_type'), gen_random_uuid()::text, 1, '首次拜访', '1', true, '0', now(), now(), false),
('crm_contact_visits_visit_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_visit_type'), gen_random_uuid()::text, 2, '常规拜访', '2', false, '0', now(), now(), false),
('crm_contact_visits_visit_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_visit_type'), gen_random_uuid()::text, 3, '回访', '3', false, '0', now(), now(), false),
('crm_contact_visits_visit_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_visit_type'), gen_random_uuid()::text, 4, '线上沟通', '4', false, '0', now(), now(), false),
('crm_contact_visits_visit_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contact_visits_visit_type'), gen_random_uuid()::text, 5, '会议', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Contacts Enums
-- =============================================

-- 性别 (crm_contacts_gender)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('性别', 'crm_contacts_gender', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contacts_gender', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_gender'), gen_random_uuid()::text, 1, '未知', '0', true, '0', now(), now(), false),
('crm_contacts_gender', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_gender'), gen_random_uuid()::text, 2, '男', '1', false, '0', now(), now(), false),
('crm_contacts_gender', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_gender'), gen_random_uuid()::text, 3, '女', '2', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_contacts_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_contacts_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contacts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_contacts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否主要联系人 (crm_contacts_is_primary)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否主要联系人', 'crm_contacts_is_primary', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contacts_is_primary', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_is_primary'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_contacts_is_primary', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contacts_is_primary'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Contract Enums
-- =============================================

-- 发票状态 (crm_contract_invoices_invoice_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('发票状态', 'crm_contract_invoices_invoice_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contract_invoices_invoice_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_status'), gen_random_uuid()::text, 1, '草稿', '1', true, '0', now(), now(), false),
('crm_contract_invoices_invoice_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_status'), gen_random_uuid()::text, 2, '已开具', '2', false, '0', now(), now(), false),
('crm_contract_invoices_invoice_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_status'), gen_random_uuid()::text, 3, '已发送', '3', false, '0', now(), now(), false),
('crm_contract_invoices_invoice_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_status'), gen_random_uuid()::text, 4, '已收款', '4', false, '0', now(), now(), false),
('crm_contract_invoices_invoice_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_status'), gen_random_uuid()::text, 5, '已作废', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 发票类型 (crm_contract_invoices_invoice_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('发票类型', 'crm_contract_invoices_invoice_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contract_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_type'), gen_random_uuid()::text, 1, '增值税专票', '1', true, '0', now(), now(), false),
('crm_contract_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_type'), gen_random_uuid()::text, 2, '增值税普票', '2', false, '0', now(), now(), false),
('crm_contract_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_invoice_type'), gen_random_uuid()::text, 3, '普通发票', '3', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_contract_invoices_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_contract_invoices_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contract_invoices_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_contract_invoices_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contract_invoices_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Contracts Enums
-- =============================================

-- 审批状态 (crm_contracts_approval_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('审批状态', 'crm_contracts_approval_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contracts_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_approval_status'), gen_random_uuid()::text, 1, '待审批', '1', true, '0', now(), now(), false),
('crm_contracts_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_approval_status'), gen_random_uuid()::text, 2, '审批中', '2', false, '0', now(), now(), false),
('crm_contracts_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_approval_status'), gen_random_uuid()::text, 3, '已通过', '3', false, '0', now(), now(), false),
('crm_contracts_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_approval_status'), gen_random_uuid()::text, 4, '已拒绝', '4', false, '0', now(), now(), false),
('crm_contracts_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_approval_status'), gen_random_uuid()::text, 5, '已撤销', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 合同类型 (crm_contracts_contract_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('合同类型', 'crm_contracts_contract_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 1, '销售合同', '1', true, '0', now(), now(), false),
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 2, '服务合同', '2', false, '0', now(), now(), false),
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 3, '框架协议', '3', false, '0', now(), now(), false),
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 4, '续签合同', '4', false, '0', now(), now(), false),
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 5, '变更协议', '5', false, '0', now(), now(), false),
('crm_contracts_contract_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_contract_type'), gen_random_uuid()::text, 6, '终止协议', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_contracts_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_contracts_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contracts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_contracts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_contracts_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_contracts_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_contracts_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_contracts_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_contracts_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_contracts_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_contracts_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_contracts_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Customer Enums
-- =============================================

-- 活动类型 (crm_customer_activities_activity_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('活动类型', 'crm_customer_activities_activity_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 1, '电话', '1', true, '0', now(), now(), false),
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 2, '邮件', '2', false, '0', now(), now(), false),
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 3, '拜访', '3', false, '0', now(), now(), false),
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 4, '会议', '4', false, '0', now(), now(), false),
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 5, '培训', '5', false, '0', now(), now(), false),
('crm_customer_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_activities_activity_type'), gen_random_uuid()::text, 6, '展会', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否启用 (crm_customer_addresses_is_active)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否启用', 'crm_customer_addresses_is_active', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_addresses_is_active', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_active'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_customer_addresses_is_active', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_active'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否默认 (crm_customer_addresses_is_default)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否默认', 'crm_customer_addresses_is_default', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_addresses_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_default'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_customer_addresses_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_default'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_customer_addresses_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_customer_addresses_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_addresses_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_customer_addresses_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_addresses_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_customer_attachments_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_customer_attachments_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_attachments_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_attachments_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_customer_attachments_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_attachments_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_customer_tags_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_customer_tags_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customer_tags_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_tags_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_customer_tags_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customer_tags_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Customers Enums
-- =============================================

-- 客户类型 (crm_customers_customer_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('客户类型', 'crm_customers_customer_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customers_customer_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_customer_type'), gen_random_uuid()::text, 1, '企业客户', '1', true, '0', now(), now(), false),
('crm_customers_customer_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_customer_type'), gen_random_uuid()::text, 2, '个人客户', '2', false, '0', now(), now(), false),
('crm_customers_customer_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_customer_type'), gen_random_uuid()::text, 3, '政府机构', '3', false, '0', now(), now(), false),
('crm_customers_customer_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_customer_type'), gen_random_uuid()::text, 4, '事业单位', '4', false, '0', now(), now(), false),
('crm_customers_customer_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_customer_type'), gen_random_uuid()::text, 5, '合作伙伴', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 公海池状态 (crm_customers_pool_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('公海池状态', 'crm_customers_pool_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customers_pool_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_pool_status'), gen_random_uuid()::text, 1, '私有', '1', true, '0', now(), now(), false),
('crm_customers_pool_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_pool_status'), gen_random_uuid()::text, 2, '公海', '2', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 客户评分 (crm_customers_rating)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('客户评分', 'crm_customers_rating', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customers_rating', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_rating'), gen_random_uuid()::text, 1, '5分', '1', true, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 来源 (crm_customers_source)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('来源', 'crm_customers_source', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 1, '自主开发', '1', true, '0', now(), now(), false),
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 2, '市场活动', '2', false, '0', now(), now(), false),
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 3, '转介绍', '3', false, '0', now(), now(), false),
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 4, '网络推广', '4', false, '0', now(), now(), false),
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 5, '合作伙伴', '5', false, '0', now(), now(), false),
('crm_customers_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_source'), gen_random_uuid()::text, 6, '招投标', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_customers_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_customers_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_customers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_customers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_customers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_customers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_customers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_customers_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Data Enums
-- =============================================

-- 是否默认 (crm_data_dicts_is_default)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否默认', 'crm_data_dicts_is_default', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_data_dicts_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_default'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_data_dicts_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_default'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_data_dicts_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_data_dicts_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_data_dicts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_data_dicts_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否叶子节点 (crm_data_dicts_is_leaf)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否叶子节点', 'crm_data_dicts_is_leaf', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_data_dicts_is_leaf', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_leaf'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_data_dicts_is_leaf', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_data_dicts_is_leaf'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Follow Enums
-- =============================================

-- 跟进方式 (crm_follow_records_follow_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('跟进方式', 'crm_follow_records_follow_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_follow_records_follow_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_follow_records_follow_type'), gen_random_uuid()::text, 1, '电话', '1', true, '0', now(), now(), false),
('crm_follow_records_follow_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_follow_records_follow_type'), gen_random_uuid()::text, 2, '邮件', '2', false, '0', now(), now(), false),
('crm_follow_records_follow_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_follow_records_follow_type'), gen_random_uuid()::text, 3, '拜访', '3', false, '0', now(), now(), false),
('crm_follow_records_follow_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_follow_records_follow_type'), gen_random_uuid()::text, 4, '微信', '4', false, '0', now(), now(), false),
('crm_follow_records_follow_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_follow_records_follow_type'), gen_random_uuid()::text, 5, '其他', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Followups Enums
-- =============================================

-- 逻辑删除标记 (crm_followups_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_followups_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_followups_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_followups_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_followups_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_followups_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Import Enums
-- =============================================

-- 状态 (crm_import_records_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_import_records_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_import_records_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_import_records_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_import_records_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_import_records_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_import_records_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_import_records_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_import_records_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_import_records_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_import_records_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_import_records_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Invoices Enums
-- =============================================

-- 发票类型 (crm_invoices_invoice_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('发票类型', 'crm_invoices_invoice_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_invoice_type'), gen_random_uuid()::text, 1, '增值税专票', '1', true, '0', now(), now(), false),
('crm_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_invoice_type'), gen_random_uuid()::text, 2, '增值税普票', '2', false, '0', now(), now(), false),
('crm_invoices_invoice_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_invoice_type'), gen_random_uuid()::text, 3, '普通发票', '3', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_invoices_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_invoices_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_invoices_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_invoices_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_invoices_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_invoices_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_invoices_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_invoices_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Joint Enums
-- =============================================

-- 是否可编辑 (crm_joint_followups_can_edit)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否可编辑', 'crm_joint_followups_can_edit', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_joint_followups_can_edit', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_can_edit'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_joint_followups_can_edit', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_can_edit'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否可查看敏感信息 (crm_joint_followups_can_view_sensitive)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否可查看敏感信息', 'crm_joint_followups_can_view_sensitive', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_joint_followups_can_view_sensitive', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_can_view_sensitive'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_joint_followups_can_view_sensitive', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_can_view_sensitive'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_joint_followups_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_joint_followups_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_joint_followups_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_joint_followups_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_joint_followups_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_joint_followups_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_joint_followups_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_joint_followups_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Leads Enums
-- =============================================

-- 逻辑删除标记 (crm_leads_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_leads_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_leads_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_leads_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 来源 (crm_leads_source)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('来源', 'crm_leads_source', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 1, '自主开发', '1', true, '0', now(), now(), false),
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 2, '市场活动', '2', false, '0', now(), now(), false),
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 3, '转介绍', '3', false, '0', now(), now(), false),
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 4, '网络推广', '4', false, '0', now(), now(), false),
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 5, '合作伙伴', '5', false, '0', now(), now(), false),
('crm_leads_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_source'), gen_random_uuid()::text, 6, '招投标', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_leads_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_leads_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_leads_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_leads_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_leads_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_leads_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_leads_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_leads_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Marketing Enums
-- =============================================

-- 逻辑删除标记 (crm_marketing_campaigns_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_marketing_campaigns_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_marketing_campaigns_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_marketing_campaigns_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_marketing_campaigns_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_marketing_campaigns_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_marketing_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_marketing_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_marketing_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_marketing_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_marketing_campaigns_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_campaigns_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_marketing_channels_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_marketing_channels_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_marketing_channels_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_channels_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_marketing_channels_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_channels_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_marketing_channels_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_channels_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_marketing_channels_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_channels_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_marketing_channels_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_marketing_channels_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Notifications Enums
-- =============================================

-- 是否已读 (crm_notifications_is_read)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否已读', 'crm_notifications_is_read', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_notifications_is_read', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_is_read'), gen_random_uuid()::text, 1, '未读', '0', true, '0', now(), now(), false),
('crm_notifications_is_read', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_is_read'), gen_random_uuid()::text, 2, '已读', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 通知类型 (crm_notifications_notification_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('通知类型', 'crm_notifications_notification_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_notifications_notification_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_notification_type'), gen_random_uuid()::text, 1, '系统通知', '1', true, '0', now(), now(), false),
('crm_notifications_notification_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_notification_type'), gen_random_uuid()::text, 2, '审批通知', '2', false, '0', now(), now(), false),
('crm_notifications_notification_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_notification_type'), gen_random_uuid()::text, 3, '提醒通知', '3', false, '0', now(), now(), false),
('crm_notifications_notification_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_notification_type'), gen_random_uuid()::text, 4, '公告', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 优先级 (crm_notifications_priority)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('优先级', 'crm_notifications_priority', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_notifications_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_priority'), gen_random_uuid()::text, 1, '低', '1', true, '0', now(), now(), false),
('crm_notifications_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_priority'), gen_random_uuid()::text, 2, '中', '2', false, '0', now(), now(), false),
('crm_notifications_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_priority'), gen_random_uuid()::text, 3, '高', '3', false, '0', now(), now(), false),
('crm_notifications_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_notifications_priority'), gen_random_uuid()::text, 4, '紧急', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Operation Enums
-- =============================================

-- 状态 (crm_operation_logs_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_operation_logs_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_operation_logs_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_operation_logs_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_operation_logs_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_operation_logs_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_operation_logs_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_operation_logs_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_operation_logs_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_operation_logs_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_operation_logs_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_operation_logs_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Opportunities Enums
-- =============================================

-- 逻辑删除标记 (crm_opportunities_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_opportunities_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_opportunities_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_opportunities_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 来源 (crm_opportunities_source)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('来源', 'crm_opportunities_source', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 1, '自主开发', '1', true, '0', now(), now(), false),
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 2, '市场活动', '2', false, '0', now(), now(), false),
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 3, '转介绍', '3', false, '0', now(), now(), false),
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 4, '网络推广', '4', false, '0', now(), now(), false),
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 5, '合作伙伴', '5', false, '0', now(), now(), false),
('crm_opportunities_source', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_source'), gen_random_uuid()::text, 6, '招投标', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 阶段 (crm_opportunities_stage)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('阶段', 'crm_opportunities_stage', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 1, '初步接触', '1', true, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 2, '需求分析', '2', false, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 3, '方案设计', '3', false, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 4, '报价谈判', '4', false, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 5, '赢单', '5', false, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 6, '输单', '6', false, '0', now(), now(), false),
('crm_opportunities_stage', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunities_stage'), gen_random_uuid()::text, 7, '暂停', '7', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Opportunity Enums
-- =============================================

-- 是否首选 (crm_opportunity_products_is_preferred)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否首选', 'crm_opportunity_products_is_preferred', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_opportunity_products_is_preferred', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_products_is_preferred'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_opportunity_products_is_preferred', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_products_is_preferred'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_opportunity_stages_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_opportunity_stages_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_opportunity_stages_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_stages_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_opportunity_stages_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_stages_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_opportunity_stages_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_stages_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_opportunity_stages_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_stages_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_opportunity_stages_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_opportunity_stages_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Order Enums
-- =============================================

-- 逻辑删除标记 (crm_order_items_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_order_items_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_order_items_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_order_items_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_order_items_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_order_items_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Orders Enums
-- =============================================

-- 逻辑删除标记 (crm_orders_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_orders_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_orders_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_orders_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 订单状态 (crm_orders_order_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('订单状态', 'crm_orders_order_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 1, '待确认', '1', true, '0', now(), now(), false),
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 2, '已确认', '2', false, '0', now(), now(), false),
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 3, '生产中', '3', false, '0', now(), now(), false),
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 4, '已发货', '4', false, '0', now(), now(), false),
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 5, '已完成', '5', false, '0', now(), now(), false),
('crm_orders_order_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_order_status'), gen_random_uuid()::text, 6, '已取消', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 付款状态 (crm_orders_payment_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('付款状态', 'crm_orders_payment_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_orders_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_payment_status'), gen_random_uuid()::text, 1, '未付款', '1', true, '0', now(), now(), false),
('crm_orders_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_payment_status'), gen_random_uuid()::text, 2, '部分付款', '2', false, '0', now(), now(), false),
('crm_orders_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_payment_status'), gen_random_uuid()::text, 3, '已付款', '3', false, '0', now(), now(), false),
('crm_orders_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_payment_status'), gen_random_uuid()::text, 4, '退款中', '4', false, '0', now(), now(), false),
('crm_orders_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_orders_payment_status'), gen_random_uuid()::text, 5, '已退款', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Payments Enums
-- =============================================

-- 逻辑删除标记 (crm_payments_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_payments_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_payments_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_payments_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 付款状态 (crm_payments_payment_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('付款状态', 'crm_payments_payment_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_payments_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_payment_status'), gen_random_uuid()::text, 1, '未付款', '1', true, '0', now(), now(), false),
('crm_payments_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_payment_status'), gen_random_uuid()::text, 2, '部分付款', '2', false, '0', now(), now(), false),
('crm_payments_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_payment_status'), gen_random_uuid()::text, 3, '已付款', '3', false, '0', now(), now(), false),
('crm_payments_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_payment_status'), gen_random_uuid()::text, 4, '退款中', '4', false, '0', now(), now(), false),
('crm_payments_payment_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_payments_payment_status'), gen_random_uuid()::text, 5, '已退款', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Price Enums
-- =============================================

-- 优先级 (crm_price_tiers_priority)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('优先级', 'crm_price_tiers_priority', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_price_tiers_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_priority'), gen_random_uuid()::text, 1, '低', '1', true, '0', now(), now(), false),
('crm_price_tiers_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_priority'), gen_random_uuid()::text, 2, '中', '2', false, '0', now(), now(), false),
('crm_price_tiers_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_priority'), gen_random_uuid()::text, 3, '高', '3', false, '0', now(), now(), false),
('crm_price_tiers_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_priority'), gen_random_uuid()::text, 4, '紧急', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_price_tiers_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_price_tiers_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_price_tiers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_price_tiers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_price_tiers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_price_tiers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_price_tiers_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Product Enums
-- =============================================

-- 状态 (crm_product_categories_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_product_categories_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_categories_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_categories_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_product_categories_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_categories_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_product_categories_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_categories_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_product_categories_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_categories_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_product_categories_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_categories_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_product_documents_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_product_documents_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_documents_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_product_documents_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_product_documents_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_product_documents_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_documents_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_product_documents_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_product_documents_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_product_documents_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_product_documents_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_documents_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 审批状态 (crm_product_price_history_approval_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('审批状态', 'crm_product_price_history_approval_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_price_history_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_history_approval_status'), gen_random_uuid()::text, 1, '待审批', '1', true, '0', now(), now(), false),
('crm_product_price_history_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_history_approval_status'), gen_random_uuid()::text, 2, '审批中', '2', false, '0', now(), now(), false),
('crm_product_price_history_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_history_approval_status'), gen_random_uuid()::text, 3, '已通过', '3', false, '0', now(), now(), false),
('crm_product_price_history_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_history_approval_status'), gen_random_uuid()::text, 4, '已拒绝', '4', false, '0', now(), now(), false),
('crm_product_price_history_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_history_approval_status'), gen_random_uuid()::text, 5, '已撤销', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_product_price_policies_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_product_price_policies_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_price_policies_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_product_price_policies_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 优先级 (crm_product_price_policies_priority)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('优先级', 'crm_product_price_policies_priority', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_price_policies_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_priority'), gen_random_uuid()::text, 1, '低', '1', true, '0', now(), now(), false),
('crm_product_price_policies_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_priority'), gen_random_uuid()::text, 2, '中', '2', false, '0', now(), now(), false),
('crm_product_price_policies_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_priority'), gen_random_uuid()::text, 3, '高', '3', false, '0', now(), now(), false),
('crm_product_price_policies_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_priority'), gen_random_uuid()::text, 4, '紧急', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_product_price_policies_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_product_price_policies_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_price_policies_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_product_price_policies_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_product_price_policies_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_product_price_policies_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_product_price_policies_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 审批状态 (crm_product_prices_approval_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('审批状态', 'crm_product_prices_approval_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_prices_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_approval_status'), gen_random_uuid()::text, 1, '待审批', '1', true, '0', now(), now(), false),
('crm_product_prices_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_approval_status'), gen_random_uuid()::text, 2, '审批中', '2', false, '0', now(), now(), false),
('crm_product_prices_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_approval_status'), gen_random_uuid()::text, 3, '已通过', '3', false, '0', now(), now(), false),
('crm_product_prices_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_approval_status'), gen_random_uuid()::text, 4, '已拒绝', '4', false, '0', now(), now(), false),
('crm_product_prices_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_approval_status'), gen_random_uuid()::text, 5, '已撤销', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否启用 (crm_product_prices_is_active)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否启用', 'crm_product_prices_is_active', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_prices_is_active', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_is_active'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_product_prices_is_active', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_is_active'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否默认 (crm_product_skus_is_default)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否默认', 'crm_product_skus_is_default', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_skus_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_is_default'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_product_skus_is_default', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_is_default'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_product_skus_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_product_skus_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_skus_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_product_skus_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_product_skus_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_product_skus_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_skus_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_product_skus_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_product_skus_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_product_skus_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_product_skus_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_skus_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Products Enums
-- =============================================

-- 逻辑删除标记 (crm_products_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_products_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_products_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_products_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 产品类型 (crm_products_product_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('产品类型', 'crm_products_product_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_products_product_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_product_type'), gen_random_uuid()::text, 1, '硬件', '1', true, '0', now(), now(), false),
('crm_products_product_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_product_type'), gen_random_uuid()::text, 2, '软件', '2', false, '0', now(), now(), false),
('crm_products_product_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_product_type'), gen_random_uuid()::text, 3, '服务', '3', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_products_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_products_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_products_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_products_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_products_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_products_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_products_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_products_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Quotations Enums
-- =============================================

-- 审批状态 (crm_quotations_approval_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('审批状态', 'crm_quotations_approval_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_quotations_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_approval_status'), gen_random_uuid()::text, 1, '待审批', '1', true, '0', now(), now(), false),
('crm_quotations_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_approval_status'), gen_random_uuid()::text, 2, '审批中', '2', false, '0', now(), now(), false),
('crm_quotations_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_approval_status'), gen_random_uuid()::text, 3, '已通过', '3', false, '0', now(), now(), false),
('crm_quotations_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_approval_status'), gen_random_uuid()::text, 4, '已拒绝', '4', false, '0', now(), now(), false),
('crm_quotations_approval_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_approval_status'), gen_random_uuid()::text, 5, '已撤销', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_quotations_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_quotations_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_quotations_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_quotations_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_quotations_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_quotations_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_quotations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_quotations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_quotations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_quotations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_quotations_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_quotations_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Renewals Enums
-- =============================================

-- 逻辑删除标记 (crm_renewals_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_renewals_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_renewals_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_renewals_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_renewals_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_renewals_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_renewals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_status'), gen_random_uuid()::text, 1, '待续约', '1', true, '0', now(), now(), false),
('crm_renewals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_status'), gen_random_uuid()::text, 2, '续约中', '2', false, '0', now(), now(), false),
('crm_renewals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_status'), gen_random_uuid()::text, 3, '已续约', '3', false, '0', now(), now(), false),
('crm_renewals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_status'), gen_random_uuid()::text, 4, '已流失', '4', false, '0', now(), now(), false),
('crm_renewals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_renewals_status'), gen_random_uuid()::text, 5, '已取消', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Report Enums
-- =============================================

-- 状态 (crm_report_instances_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_report_instances_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_report_instances_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_instances_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_report_instances_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_instances_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_report_instances_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_instances_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_report_instances_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_instances_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_report_instances_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_instances_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_report_templates_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_report_templates_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_report_templates_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_templates_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_report_templates_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_templates_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_report_templates_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_templates_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_report_templates_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_templates_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_report_templates_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_report_templates_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Sales Enums
-- =============================================

-- 活动类型 (crm_sales_activities_activity_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('活动类型', 'crm_sales_activities_activity_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 1, '电话', '1', true, '0', now(), now(), false),
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 2, '邮件', '2', false, '0', now(), now(), false),
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 3, '拜访', '3', false, '0', now(), now(), false),
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 4, '会议', '4', false, '0', now(), now(), false),
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 5, '培训', '5', false, '0', now(), now(), false),
('crm_sales_activities_activity_type', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_activity_type'), gen_random_uuid()::text, 6, '展会', '6', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 逻辑删除标记 (crm_sales_activities_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_sales_activities_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_sales_activities_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_sales_activities_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_sales_activities_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Satisfaction Enums
-- =============================================

-- 逻辑删除标记 (crm_satisfaction_surveys_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_satisfaction_surveys_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_satisfaction_surveys_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_satisfaction_surveys_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_satisfaction_surveys_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_satisfaction_surveys_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_satisfaction_surveys_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_satisfaction_surveys_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_satisfaction_surveys_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_satisfaction_surveys_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_satisfaction_surveys_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_satisfaction_surveys_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Tag Enums
-- =============================================

-- 状态 (crm_tag_definitions_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_tag_definitions_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_tag_definitions_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tag_definitions_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_tag_definitions_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tag_definitions_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_tag_definitions_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tag_definitions_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_tag_definitions_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tag_definitions_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_tag_definitions_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tag_definitions_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Tags Enums
-- =============================================

-- 状态 (crm_tags_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_tags_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tags_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tags_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tags_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tags_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_tags_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tags_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Tasks Enums
-- =============================================

-- 逻辑删除标记 (crm_tasks_is_deleted)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('逻辑删除标记', 'crm_tasks_is_deleted', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_tasks_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_is_deleted'), gen_random_uuid()::text, 1, '未删除', '0', true, '0', now(), now(), false),
('crm_tasks_is_deleted', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_is_deleted'), gen_random_uuid()::text, 2, '已删除', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 优先级 (crm_tasks_priority)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('优先级', 'crm_tasks_priority', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_tasks_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_priority'), gen_random_uuid()::text, 1, '低', '1', true, '0', now(), now(), false),
('crm_tasks_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_priority'), gen_random_uuid()::text, 2, '中', '2', false, '0', now(), now(), false),
('crm_tasks_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_priority'), gen_random_uuid()::text, 3, '高', '3', false, '0', now(), now(), false),
('crm_tasks_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_priority'), gen_random_uuid()::text, 4, '紧急', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 状态 (crm_tasks_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_tasks_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_tasks_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_tasks_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_tasks_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_tasks_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_tasks_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_tasks_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- User Enums
-- =============================================

-- 自动分配启用 (crm_user_extensions_auto_assign_enabled)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('自动分配启用', 'crm_user_extensions_auto_assign_enabled', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_user_extensions_auto_assign_enabled', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_user_extensions_auto_assign_enabled'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_user_extensions_auto_assign_enabled', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_user_extensions_auto_assign_enabled'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- =============================================
-- Workflow Enums
-- =============================================

-- 状态 (crm_workflow_approvals_status)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('状态', 'crm_workflow_approvals_status', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_workflow_approvals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_approvals_status'), gen_random_uuid()::text, 1, '潜在', '1', true, '0', now(), now(), false),
('crm_workflow_approvals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_approvals_status'), gen_random_uuid()::text, 2, '意向', '2', false, '0', now(), now(), false),
('crm_workflow_approvals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_approvals_status'), gen_random_uuid()::text, 3, '正式', '3', false, '0', now(), now(), false),
('crm_workflow_approvals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_approvals_status'), gen_random_uuid()::text, 4, '休眠', '4', false, '0', now(), now(), false),
('crm_workflow_approvals_status', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_approvals_status'), gen_random_uuid()::text, 5, '流失', '5', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 是否启用 (crm_workflow_rules_enabled)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('是否启用', 'crm_workflow_rules_enabled', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_workflow_rules_enabled', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_enabled'), gen_random_uuid()::text, 1, '否', '0', true, '0', now(), now(), false),
('crm_workflow_rules_enabled', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_enabled'), gen_random_uuid()::text, 2, '是', '1', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

-- 优先级 (crm_workflow_rules_priority)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('优先级', 'crm_workflow_rules_priority', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_workflow_rules_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_priority'), gen_random_uuid()::text, 1, '低', '1', true, '0', now(), now(), false),
('crm_workflow_rules_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_priority'), gen_random_uuid()::text, 2, '中', '2', false, '0', now(), now(), false),
('crm_workflow_rules_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_priority'), gen_random_uuid()::text, 3, '高', '3', false, '0', now(), now(), false),
('crm_workflow_rules_priority', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_workflow_rules_priority'), gen_random_uuid()::text, 4, '紧急', '4', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

COMMIT;-- =============================================

-- =============================================
-- CRM 补充的字典类型（仅包含有明确枚举值的字段）
-- 自动生成于: 2026-04-26
-- 说明: 根据严格标准，只保留注释中包含明确枚举值列表的字段
-- =============================================

-- =============================================
-- crm_price_tiers
-- =============================================

-- 客户等级:A-战略客户,B-重要客户,C-普通客户,D-潜在客户 (crm_price_tiers_customer_level)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('客户等级:A-战略客户,B-重要客户,C-普通客户,D-潜在客户', 'crm_price_tiers_customer_level', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_price_tiers_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_customer_level'), gen_random_uuid()::text, 1, '战略客户', 'A', true, '0', now(), now(), false),
('crm_price_tiers_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_customer_level'), gen_random_uuid()::text, 2, '重要客户', 'B', false, '0', now(), now(), false),
('crm_price_tiers_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_customer_level'), gen_random_uuid()::text, 3, '普通客户', 'C', false, '0', now(), now(), false),
('crm_price_tiers_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_price_tiers_customer_level'), gen_random_uuid()::text, 4, '潜在客户', 'D', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;


-- =============================================
-- crm_product_price_policies
-- =============================================

-- 策略类型 (crm_product_price_policies_policy_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('策略类型', 'crm_product_price_policies_policy_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_price_policies_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_customer_level'), gen_random_uuid()::text, 1, '战略客户', 'A', true, '0', now(), now(), false),
('crm_product_price_policies_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_customer_level'), gen_random_uuid()::text, 2, '重要客户', 'B', false, '0', now(), now(), false),
('crm_product_price_policies_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_customer_level'), gen_random_uuid()::text, 3, '普通客户', 'C', false, '0', now(), now(), false),
('crm_product_price_policies_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_price_policies_customer_level'), gen_random_uuid()::text, 4, '潜在客户', 'D', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;


-- =============================================
-- crm_product_prices
-- =============================================

-- 价格类型 (crm_product_prices_price_type)
INSERT INTO "sys_dict_type" ("dict_name", "dict_type", "uuid", "status", "description", "created_time", "updated_time", "is_deleted")
VALUES ('价格类型', 'crm_product_prices_price_type', gen_random_uuid()::text, '0', 'CRM枚举字典', now(), now(), false)
ON CONFLICT ("dict_type") DO NOTHING;

INSERT INTO "sys_dict_data" ("dict_type", "dict_type_id", "uuid", "dict_sort", "dict_label", "dict_value", "is_default", "status", "created_time", "updated_time", "is_deleted") VALUES
('crm_product_prices_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_customer_level'), gen_random_uuid()::text, 1, '战略客户', 'A', true, '0', now(), now(), false),
('crm_product_prices_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_customer_level'), gen_random_uuid()::text, 2, '重要客户', 'B', false, '0', now(), now(), false),
('crm_product_prices_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_customer_level'), gen_random_uuid()::text, 3, '普通客户', 'C', false, '0', now(), now(), false),
('crm_product_prices_customer_level', (SELECT id FROM sys_dict_type WHERE dict_type = 'crm_product_prices_customer_level'), gen_random_uuid()::text, 4, '潜在客户', 'D', false, '0', now(), now(), false)
ON CONFLICT DO NOTHING;

