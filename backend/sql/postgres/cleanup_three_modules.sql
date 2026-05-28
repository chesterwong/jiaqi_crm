-- ============================================
-- 清理三个模块的菜单数据（重新生成前执行）
-- 涉及：customers / opportunities / product_categories
-- ============================================

-- 1. 先删除角色-菜单关联（sys_role_menus）
DELETE FROM "public"."sys_role_menus"
WHERE menu_id IN (
    SELECT id FROM "public"."sys_menu"
    WHERE route_path LIKE '/module_crm/customers%'
       OR route_path LIKE '/module_crm/opportunities%'
       OR route_path LIKE '/module_crm/product_categories%'
       OR component_path LIKE 'module_crm/customers%'
       OR component_path LIKE 'module_crm/opportunities%'
       OR component_path LIKE 'module_crm/product_categories%'
       OR permission LIKE 'module_crm:customers:%'
       OR permission LIKE 'module_crm:opportunities:%'
       OR permission LIKE 'module_crm:product_categories:%'
);

-- 2. 删除子菜单（level 3 按钮 + 所有子节点）
DELETE FROM "public"."sys_menu"
WHERE id IN (
    WITH RECURSIVE menu_tree AS (
        -- 找到目标一级/二级菜单
        SELECT id FROM "public"."sys_menu"
        WHERE route_path LIKE '/module_crm/customers%'
           OR route_path LIKE '/module_crm/opportunities%'
           OR route_path LIKE '/module_crm/product_categories%'
           OR component_path LIKE 'module_crm/customers%'
           OR component_path LIKE 'module_crm/opportunities%'
           OR component_path LIKE 'module_crm/product_categories%'
        UNION ALL
        -- 递归找出所有子菜单
        SELECT m.id FROM "public"."sys_menu" m
        INNER JOIN menu_tree mt ON m.parent_id = mt.id
    )
    SELECT id FROM menu_tree
);

-- 3. 删除一级/二级菜单本身
DELETE FROM "public"."sys_menu"
WHERE route_path LIKE '/module_crm/customers%'
   OR route_path LIKE '/module_crm/opportunities%'
   OR route_path LIKE '/module_crm/product_categories%'
   OR component_path LIKE 'module_crm/customers%'
   OR component_path LIKE 'module_crm/opportunities%'
   OR component_path LIKE 'module_crm/product_categories%';

-- ============================================
-- 验证清理结果
-- ============================================
SELECT '✅ 清理完成，剩余菜单数：' || COUNT(*)::text
FROM "public"."sys_menu"
WHERE route_path LIKE '/module_crm/%';
