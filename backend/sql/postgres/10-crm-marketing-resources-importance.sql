-- =============================================
-- 营销资源表：重要性字段 + 字典
-- =============================================

SET search_path TO public;

BEGIN;

ALTER TABLE crm_marketing_resources
    ADD COLUMN IF NOT EXISTS importance varchar(20);

COMMENT ON COLUMN crm_marketing_resources.importance IS '重要性（字典 crm_marketing_resources_importance）';

INSERT INTO sys_dict_type (dict_name, dict_type, uuid, status, description, created_time, updated_time, is_deleted)
VALUES (
    '重要性',
    'crm_marketing_resources_importance',
    gen_random_uuid()::text,
    '0',
    '营销资源重要性',
    now(),
    now(),
    false
)
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type, dict_type_id, uuid, dict_sort, dict_label, dict_value, is_default, status, created_time, updated_time, is_deleted)
SELECT 'crm_marketing_resources_importance', dt.id, gen_random_uuid()::text, 1, '普通', 'normal', true, '0', now(), now(), false
FROM sys_dict_type dt
WHERE dt.dict_type = 'crm_marketing_resources_importance'
  AND NOT EXISTS (
      SELECT 1 FROM sys_dict_data dd
      WHERE dd.dict_type = 'crm_marketing_resources_importance' AND dd.dict_value = 'normal'
  );

INSERT INTO sys_dict_data (dict_type, dict_type_id, uuid, dict_sort, dict_label, dict_value, is_default, status, created_time, updated_time, is_deleted)
SELECT 'crm_marketing_resources_importance', dt.id, gen_random_uuid()::text, 2, '紧急', 'urgent', false, '0', now(), now(), false
FROM sys_dict_type dt
WHERE dt.dict_type = 'crm_marketing_resources_importance'
  AND NOT EXISTS (
      SELECT 1 FROM sys_dict_data dd
      WHERE dd.dict_type = 'crm_marketing_resources_importance' AND dd.dict_value = 'urgent'
  );

UPDATE crm_marketing_resources
SET importance = 'normal'
WHERE importance IS NULL;

COMMIT;
