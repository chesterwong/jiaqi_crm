-- 销售管理列表：页面查询权限 + 按钮权限
SET search_path TO public;

UPDATE sys_menu
SET permission = 'module_salesmanagement:marketing_resources:query'
WHERE route_path = '/salesmanagement/list'
  AND is_deleted = false
  AND (permission IS NULL OR permission = '');

INSERT INTO sys_menu (
    name, type, "order", permission, icon, route_name, route_path,
    component_path, redirect, hidden, keep_alive, always_show, title,
    params, affix, parent_id, status, description
)
SELECT v.name, 3, v.ord, v.permission, NULL, NULL, NULL, NULL, NULL,
       false, true, false, v.title, 'null', false, p.id, '0', '销售资源管理'
FROM sys_menu p
CROSS JOIN (VALUES
    ('查询销售资源', 1, 'module_salesmanagement:marketing_resources:query', '查询销售资源'),
    ('详情销售资源', 2, 'module_salesmanagement:marketing_resources:detail', '详情销售资源'),
    ('创建销售资源', 3, 'module_salesmanagement:marketing_resources:create', '创建销售资源'),
    ('更新销售资源', 4, 'module_salesmanagement:marketing_resources:update', '更新销售资源'),
    ('删除销售资源', 5, 'module_salesmanagement:marketing_resources:delete', '删除销售资源'),
    ('飞书导入销售资源', 6, 'module_salesmanagement:marketing_resources:import', '飞书导入')
) AS v(name, ord, permission, title)
WHERE p.route_path = '/salesmanagement/list'
  AND p.is_deleted = false
  AND NOT EXISTS (
    SELECT 1 FROM sys_menu m
    WHERE m.permission = v.permission AND m.is_deleted = false
  );
