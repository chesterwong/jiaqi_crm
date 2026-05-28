-- ============================================================================
-- 官方系统表缺失字段补充脚本
-- 
-- 说明: 为 7 张缺失字段的官方表补充 is_deleted, deleted_at, deleted_id 字段
-- 执行方式: docker exec -i postgres psql -U crm_user -d crm < 此文件
-- ============================================================================

BEGIN;

-- ============================================================================
-- 1. gen_demo 表
-- ============================================================================
ALTER TABLE gen_demo 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN gen_demo.is_deleted IS '是否删除';
COMMENT ON COLUMN gen_demo.deleted_time IS '删除时间';
COMMENT ON COLUMN gen_demo.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_gen_demo_is_deleted ON gen_demo(is_deleted);


-- ============================================================================
-- 2. gen_demo01 表
-- ============================================================================
ALTER TABLE gen_demo01 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN gen_demo01.is_deleted IS '是否删除';
COMMENT ON COLUMN gen_demo01.deleted_time IS '删除时间';
COMMENT ON COLUMN gen_demo01.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_gen_demo01_is_deleted ON gen_demo01(is_deleted);


-- ============================================================================
-- 3. task_workflow 表
-- ============================================================================
ALTER TABLE task_workflow 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN task_workflow.is_deleted IS '是否删除';
COMMENT ON COLUMN task_workflow.deleted_time IS '删除时间';
COMMENT ON COLUMN task_workflow.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_task_workflow_is_deleted ON task_workflow(is_deleted);


-- ============================================================================
-- 4. task_node 表
-- ============================================================================
ALTER TABLE task_node 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN task_node.is_deleted IS '是否删除';
COMMENT ON COLUMN task_node.deleted_time IS '删除时间';
COMMENT ON COLUMN task_node.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_task_node_is_deleted ON task_node(is_deleted);


-- ============================================================================
-- 5. task_job 表
-- ============================================================================
ALTER TABLE task_job 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP;

COMMENT ON COLUMN task_job.is_deleted IS '是否删除';
COMMENT ON COLUMN task_job.deleted_time IS '删除时间';

CREATE INDEX IF NOT EXISTS idx_task_job_is_deleted ON task_job(is_deleted);


-- ============================================================================
-- 6. task_workflow_node_type 表
-- ============================================================================
ALTER TABLE task_workflow_node_type 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN task_workflow_node_type.is_deleted IS '是否删除';
COMMENT ON COLUMN task_workflow_node_type.deleted_time IS '删除时间';
COMMENT ON COLUMN task_workflow_node_type.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_task_workflow_node_type_is_deleted ON task_workflow_node_type(is_deleted);


-- ============================================================================
-- 7. app_portal 表
-- ============================================================================
ALTER TABLE app_portal 
ADD COLUMN IF NOT EXISTS is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS deleted_time TIMESTAMP,
ADD COLUMN IF NOT EXISTS deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL;

COMMENT ON COLUMN app_portal.is_deleted IS '是否删除';
COMMENT ON COLUMN app_portal.deleted_time IS '删除时间';
COMMENT ON COLUMN app_portal.deleted_id IS '删除人ID';

CREATE INDEX IF NOT EXISTS idx_app_portal_is_deleted ON app_portal(is_deleted);


-- ============================================================================
-- 验证统计
-- ============================================================================

DO $$
DECLARE
    missing_count INTEGER;
BEGIN
    -- 检查是否还有缺失的字段
    SELECT COUNT(*) INTO missing_count
    FROM (
        SELECT table_name
        FROM information_schema.tables t
        WHERE t.table_schema IN ('public', 'ai')
        AND t.table_name IN (
            'gen_demo', 'gen_demo01', 'task_workflow', 'task_node', 
            'task_job', 'task_workflow_node_type', 'app_portal'
        )
        AND NOT EXISTS (
            SELECT 1 FROM information_schema.columns c
            WHERE c.table_name = t.table_name
            AND c.column_name = 'is_deleted'
        )
    ) AS missing_tables;
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '官方系统表字段补充完成！';
    RAISE NOTICE '========================================';
    RAISE NOTICE '仍缺少 is_deleted 字段的表: % 张', missing_count;
    RAISE NOTICE '========================================';
END $$;

COMMIT;
