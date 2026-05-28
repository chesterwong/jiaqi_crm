# 数据库表结构文件说明

> **更新日期**: 2026-04-21  
> **数据库类型**: PostgreSQL 16  
> **用途**: 存储 CRM 系统和 FastApiAdmin 框架的数据库表结构定义

---

## 📁 文件清单

### 1️⃣ CRM 业务表结构（当前项目）

**文件名**: `crm-public-2026-19-21.sql`  
**文件大小**: 1.8 MB  
**导出日期**: 2026-04-19 21:49:53  
**表数量**: 约 70+ 张 CRM 业务表  
**说明**: 

这是当前 CRM 项目的完整数据库导出文件，包含：

#### ✅ 包含的表类型

- **CRM 业务表** (`crm_*` 前缀)
  - 客户管理: `crm_customers`, `crm_contacts`, `crm_followups` 等
  - 销售管理: `crm_opportunities`, `crm_leads` 等
  - 产品管理: `crm_products`, `crm_product_categories` 等
  - 合同订单: `crm_contracts`, `crm_quotations`, `crm_payment_plans` 等
  - 营销服务: `crm_campaigns`, `crm_customer_health` 等
  - AI智能: `crm_ai_customer_profiles`, `crm_ai_recommendations` 等
  - 数据报表: `crm_sales_targets`, `crm_notifications` 等

- **系统管理表** (`sys_*` 前缀)
  - 用户、角色、部门、菜单、权限等（来自 FastApiAdmin）

- **其他辅助表**
  - 字典表、参数表、日志表、任务调度表等

#### 📊 主要特点

- ✅ 完整的表结构定义（CREATE TABLE）
- ✅ 所有字段注释（COMMENT ON COLUMN）
- ✅ 索引定义（CREATE INDEX）
- ✅ 序列定义（CREATE SEQUENCE）
- ✅ 外键约束（FOREIGN KEY）
- ✅ 初始数据（INSERT INTO，如果有）

#### 🔍 查看方法

```bash
# 使用文本编辑器打开
code "D:\APP-WEB\CRM\docs\database\crm-public-2026-19-21.sql"

# 或使用 psql 查看表列表
psql -U postgres -d crm -c "\dt"

# 统计表数量
grep -c "CREATE TABLE" "D:\APP-WEB\CRM\docs\database\crm-public-2026-19-21.sql"
```

---

### 2️⃣ FastApiAdmin 官方系统表（纯净版）

**文件名**: `fastapiadmin-system-tables-2026-04-21.sql`  
**文件大小**: 15 KB  
**生成日期**: 2026-04-21  
**表数量**: 9 张核心系统表  
**说明**: 

这是从 FastApiAdmin 官方源码中提取的**纯净系统表初始化脚本**，仅包含核心的 9 张系统管理表，不包含任何业务表和初始数据。

#### ✅ 包含的表（9张）

| 序号 | 表名 | 说明 | 字段数 |
|------|------|------|--------|
| 1 | `sys_user` | 用户表 | 27 |
| 2 | `sys_role` | 角色表 | 13 |
| 3 | `sys_dept` | 部门表 | 15 |
| 4 | `sys_menu` | 菜单表 | 24 |
| 5 | `sys_position` | 岗位表 | 14 |
| 6 | `sys_user_roles` | 用户角色关联表 | 2 |
| 7 | `sys_role_menus` | 角色菜单关联表 | 2 |
| 8 | `sys_role_depts` | 角色部门关联表 | 2 |
| 9 | `sys_user_positions` | 用户岗位关联表 | 2 |

#### 📋 文件内容结构

```sql
-- 1. 数据库会话配置
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
...

-- 2. sys_user 表定义
CREATE TABLE public.sys_user (...);
CREATE SEQUENCE public.sys_user_id_seq ...;
COMMENT ON TABLE public.sys_user IS '用户表';
COMMENT ON COLUMN public.sys_user.username IS '用户名/登录账号';
...

-- 3. sys_role 表定义
CREATE TABLE public.sys_role (...);
...

-- 4. 其他 7 张表...
```

#### 🎯 使用场景

1. **新建项目时初始化系统表**
   ```bash
   psql -U postgres -d new_db -f fastapiadmin-system-tables-2026-04-21.sql
   ```

2. **比对表结构差异**
   - 与 CRM 设计的系统表进行字段比对
   - 分析缺失字段和功能

3. **学习 FastApiAdmin 表设计规范**
   - 查看标准的审计字段设计
   - 学习多租户支持（tenant_id）
   - 了解第三方登录字段设计

#### ⚠️ 注意事项

- ❌ **不包含初始数据**（需要手动插入 admin 用户等）
- ❌ **不包含业务表**（仅系统管理表）
- ❌ **不包含字典、参数、日志等辅助表**
- ✅ **纯净、简洁、易于理解**

---

## 🔍 两文件对比

| 对比项 | crm-public-2026-19-21.sql | fastapiadmin-system-tables-2026-04-21.sql |
|--------|--------------------------|-------------------------------------------|
| **来源** | 当前 CRM 项目数据库导出 | FastApiAdmin 官方源码提取 |
| **文件大小** | 1.8 MB | 15 KB |
| **表数量** | 70+ 张 | 9 张 |
| **包含内容** | 系统表 + 业务表 + 初始数据 | 仅核心系统表 |
| **用途** | 数据库备份、恢复、迁移 | 学习、比对、新项目初始化 |
| **更新频率** | 每次数据库变更后重新导出 | 跟随 FastApiAdmin 版本更新 |

---

## 📖 如何使用

### 场景1: 查看当前项目的完整表结构

```bash
# 打开 CRM 完整导出文件
code "D:\APP-WEB\CRM\docs\database\crm-public-2026-19-21.sql"

# 搜索特定表
grep -A 50 "CREATE TABLE.*crm_customers" "D:\APP-WEB\CRM\docs\database\crm-public-2026-19-21.sql"
```

### 场景2: 查看 FastApiAdmin 官方系统设计

```bash
# 打开 FastApiAdmin 系统表文件
code "D:\APP-WEB\CRM\docs\database\fastapiadmin-system-tables-2026-04-21.sql"

# 查看用户表结构
grep -A 30 "CREATE TABLE public.sys_user" "D:\APP-WEB\CRM\docs\database\fastapiadmin-system-tables-2026-04-21.sql"
```

### 场景3: 比对两个文件的差异

```bash
# 比对 sys_user 表的字段差异
# 方法1: 使用 Beyond Compare / WinMerge 等工具
# 方法2: 查看已生成的比对报告
code "D:\APP-WEB\CRM\debug\FastApiAdmin与CRM系统表字段深度比对分析报告.md"
```

### 场景4: 在新数据库中初始化系统表

```bash
# 1. 创建新数据库
createdb -U postgres crm_new_db

# 2. 执行 FastApiAdmin 系统表初始化
psql -U postgres -d crm_new_db -f "D:\APP-WEB\CRM\docs\database\fastapiadmin-system-tables-2026-04-21.sql"

# 3. 验证表是否创建成功
psql -U postgres -d crm_new_db -c "\dt sys_*"

# 应该显示 9 张表
```

### 场景5: 恢复或迁移数据库

```bash
# 从备份文件恢复
psql -U postgres -d crm -f "D:\APP-WEB\CRM\docs\database\crm-public-2026-19-21.sql"

# 注意: 这会覆盖现有数据，请谨慎操作！
```

---

## 🔄 更新策略

### CRM 业务表文件更新

**何时更新**:
- ✅ 每次新增/修改业务表后
- ✅ 每次数据库迁移（Alembic）后
- ✅ 定期备份（建议每周）

**如何更新**:
```bash
# 方法1: 使用 Navicat/DBeaver 导出
# 右键数据库 → 转储 SQL 文件 → 结构和数据

# 方法2: 使用 pg_dump 命令行
pg_dump -U postgres -d crm -f "D:\APP-WEB\CRM\docs\database\crm-public-$(date +%Y-%m-%d).sql"

# 方法3: 使用 psql
psql -U postgres -d crm -c "\o D:\APP-WEB\CRM\docs\database\backup.sql"
psql -U postgres -d crm -c "\dump"
```

### FastApiAdmin 系统表文件更新

**何时更新**:
- ✅ FastApiAdmin 框架升级后
- ✅ 官方发布新版本时

**如何更新**:
```bash
# 1. 拉取最新的 FastApiAdmin 源码
cd D:\APP-WEB\CRM\crm-fastapi
git pull origin master

# 2. 重新运行 Python 脚本提取系统表
python extract_sys_tables.py

# 3. 或者手动从新的 SQL 文件中提取
# 参考之前的 Python 脚本逻辑
```

---

## 📝 相关文档

- **[FastApiAdmin与CRM系统表字段深度比对分析报告](../debug/FastApiAdmin与CRM系统表字段深度比对分析报告.md)**  
  详细的字段比对分析，包含缺失字段统计和推荐方案

- **[模块开发完整流程指南](../../backcope/crm/crm-fastapi-bak/模块开发完整流程指南.md)**  
  如何使用代码生成器基于这些表结构快速开发模块

- **[CRM5大模块表快速部署指南](../../backcope/crm/crm-fastapi-bak/backend/scripts/05-文档归档/CRM5大模块表快速部署指南.md)**  
  20 张核心业务表的清单和部署步骤

---

## ⚠️ 注意事项

1. **敏感信息保护**
   - 这些 SQL 文件可能包含敏感数据（用户密码哈希、业务数据等）
   - 不要将包含真实数据的文件上传到公开仓库
   - 建议使用 `.gitignore` 排除大型 SQL 文件

2. **文件版本管理**
   - 建议在文件名中包含日期，便于追溯
   - 保留最近 3-5 个版本的备份
   - 定期清理旧备份文件

3. **数据库兼容性**
   - 这些文件是针对 PostgreSQL 16 导出的
   - 如果需要在其他版本使用，可能需要调整语法
   - MySQL/MariaDB 需要使用对应的导出文件

4. **执行顺序**
   - 恢复数据库时，先执行系统表，再执行业务表
   - 确保外键引用的表先创建
   - 注意序列（SEQUENCE）的依赖关系

---

## 🎯 下一步建议

1. ✅ **阅读比对分析报告**，了解 CRM 设计与 FastApiAdmin 的差异
2. ✅ **采用方案C（混合方案）**，使用 FastApiAdmin 的系统表 + CRM 扩展表
3. ✅ **创建 `crm_user_extensions` 扩展表**，存储 CRM 专属字段
4. ✅ **修改业务表外键引用**，从 `crm_users.id` 改为 `sys_user.id`
5. ✅ **定期更新这两个 SQL 文件**，保持文档与代码同步

---

**文档维护者**: CRM 开发团队  
**最后更新**: 2026-04-21  
**文档版本**: v1.0
