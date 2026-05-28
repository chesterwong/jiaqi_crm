# Navicat 连接 PostgreSQL 配置指南

## 📋 连接参数

### 基本连接信息

| 参数 | 值 | 说明 |
|------|-----|------|
| **主机** | `localhost` 或 `127.0.0.1` | Docker 映射到本地 |
| **端口** | `5432` | PostgreSQL 默认端口 |
| **初始数据库** | `fastapiadmin` | 项目数据库名 |
| **用户名** | `postgres` | 超级用户 |
| **密码** | `FastapiAdmin@2026` | Docker 配置的密码 |

### Navicat 设置步骤

1. **打开 Navicat**
2. **点击"连接" → "PostgreSQL"**
3. **填写连接信息**：
   ```
   连接名: FastapiAdmin (自定义)
   主机: localhost
   端口: 5432
   初始数据库: fastapiadmin
   用户名: postgres
   密码: FastapiAdmin@2026
   ```
4. **点击"测试连接"**
5. **如果成功，点击"确定"保存**

## 🔍 验证连接

连接成功后，您应该能看到以下表：

### 系统管理模块
- `sys_user` - 用户表
- `sys_role` - 角色表
- `sys_menu` - 菜单表
- `sys_dept` - 部门表
- `sys_dict_type` - 字典类型
- `sys_dict_data` - 字典数据
- `sys_param` - 参数配置
- `sys_log` - 操作日志
- `sys_notice` - 通知公告
- `sys_tenant` - 租户信息

### 其他模块
- `app_portal` - 应用门户
- `gen_table` - 代码生成表
- `gen_demo` - 示例表
- `task_job` - 定时任务
- 等等...

## ⚠️ 常见问题

### Q1: 连接失败 "Connection refused"
**原因**：Docker 容器未启动

**解决**：
```bash
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d
```

### Q2: 连接失败 "Authentication failed"
**原因**：密码错误

**解决**：确认密码为 `FastapiAdmin@2026`（注意大小写）

### Q3: 能看到连接但看不到表
**原因**：数据库为空或未初始化

**解决**：
1. 检查后端服务是否已启动
2. 首次启动后端会自动初始化数据库
3. 或者手动执行初始化脚本

### Q4: 中文显示乱码
**解决**：
在 Navicat 中设置编码：
1. 右键连接 → "编辑连接"
2. 高级 → 编码 → 选择 `UTF8`

## 📊 数据库结构

### 主要表关系

```
sys_user (用户)
  ├─ sys_user_roles (用户-角色关联)
  │   └─ sys_role (角色)
  │       └─ sys_role_menus (角色-菜单关联)
  │           └─ sys_menu (菜单)
  ├─ sys_user_positions (用户-职位关联)
  └─ sys_dept (部门)

sys_dict_type (字典类型)
  └─ sys_dict_data (字典数据)

sys_param (系统参数)

sys_log (操作日志)
```

## 💡 常用 SQL 查询

### 查看所有用户
```sql
SELECT id, username, name, email, mobile 
FROM sys_user 
WHERE is_deleted = false;
```

### 查看管理员角色
```sql
SELECT r.name, r.code, COUNT(ur.user_id) as user_count
FROM sys_role r
LEFT JOIN sys_user_roles ur ON r.id = ur.role_id
GROUP BY r.id, r.name, r.code;
```

### 查看菜单树
```sql
SELECT id, parent_id, title, path, component
FROM sys_menu
ORDER BY sort_order;
```

### 查看最近的操作日志
```sql
SELECT id, username, method, path, status, created_time
FROM sys_log
ORDER BY created_time DESC
LIMIT 20;
```

## 🔐 安全提示

1. **不要在生产环境使用默认密码**
2. **定期备份数据库**
3. **限制远程访问**（仅允许 localhost）
4. **使用强密码策略**

## 📝 备份与恢复

### 备份数据库
```bash
docker exec fastapiadmin-postgres pg_dump -U postgres fastapiadmin > backup.sql
```

### 恢复数据库
```bash
docker exec -i fastapiadmin-postgres psql -U postgres fastapiadmin < backup.sql
```

### 导出单表
```bash
docker exec fastapiadmin-postgres pg_dump -U postgres -t sys_user fastapiadmin > sys_user_backup.sql
```

---

**最后更新**: 2026-04-26  
**数据库版本**: PostgreSQL 16  
**连接状态**: ✅ 正常
