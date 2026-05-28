# CRM代码生成器使用指南 v4.1 修正报告

**日期**: 2026-04-29  
**修正原因**: 数据库实际有 75 张表，文档原标注为 74 张表

---

## ✅ 已完成的修正

### 1. 版本号更新
- **原文档**: v4.0（74表·完整版）
- **修正后**: v4.1（75表·完整版）
- **更新日期**: 2026-04-29

### 2. 新增两张表的文档说明

#### 2.1 crm_notifications（消息通知表）
```sql
-- 表结构
CREATE TABLE crm_notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES sys_user(id),  -- 关联系统用户
    title VARCHAR(200) NOT NULL,                        -- 通知标题
    content TEXT,                                       -- 通知内容
    type VARCHAR(50) DEFAULT 'system',                 -- 通知类型: system/business/alert
    is_read BOOLEAN DEFAULT FALSE,                     -- 是否已读
    read_time TIMESTAMP,                               -- 阅读时间
    related_table VARCHAR(100),                        -- 关联业务表
    related_id INTEGER,                                -- 关联业务ID
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW()
);

-- 代码生成器配置
{
  "table_name": "crm_notifications",
  "module": "系统管理",
  "menu_name": "消息通知",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "generate_menu": true,
  "data_permission": true,  -- 只显示当前用户的通知
  "soft_delete": false
}
```

**用途**: 
- 系统通知推送
- 业务提醒（合同到期、审批待办等）
- 预警通知

**菜单路径**: `/system/notifications`

---

#### 2.2 crm_operation_logs（操作日志表）
```sql
-- 表结构
CREATE TABLE crm_operation_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES sys_user(id),  -- 操作用户
    operation_type VARCHAR(50) NOT NULL,               -- 操作类型: create/update/delete/export
    related_table VARCHAR(100) NOT NULL,               -- 操作的表名
    related_id INTEGER,                                -- 操作的业务ID
    operation_desc TEXT,                               -- 操作描述
    ip_address VARCHAR(50),                            -- IP地址
    user_agent TEXT,                                   -- 浏览器信息
    request_params JSONB,                              -- 请求参数
    response_result JSONB,                             -- 响应结果
    duration_ms INTEGER,                               -- 执行时长(毫秒)
    status VARCHAR(20) DEFAULT 'success',             -- 状态: success/failed
    error_message TEXT,                                -- 错误信息
    created_time TIMESTAMP DEFAULT NOW()
);

-- 代码生成器配置
{
  "table_name": "crm_operation_logs",
  "module": "系统管理",
  "menu_name": "操作日志",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "generate_menu": true,
  "data_permission": false,  -- 管理员查看所有日志
  "soft_delete": false,
  "fields_config": {
    "list_fields": ["user_id", "operation_type", "related_table", "status", "created_time"],
    "form_fields": [],  -- 只读，不允许手动创建
    "search_fields": ["user_id", "operation_type", "related_table", "status", "created_time"],
    "readonly_fields": ["all"]  -- 所有字段只读
  }
}
```

**用途**:
- 记录所有业务操作（增删改查）
- 审计追踪
- 安全监控

**菜单路径**: `/system/operation-logs`

---

### 3. 批次调整

**原文档第11批**: AI智能与报表（7张表）

**修正后增加第12批**:
```
第12批：系统辅助（2张表）⭐新增
  ├── crm_notifications ⭐新增
  └── crm_operation_logs ⭐新增
```

---

### 4. 树状结构更新

在 **3.10 系统管理** 章节后新增：

```markdown
### 3.11 📦 系统辅助（2个独立表）⭐新增

📦 系统管理 (module: crm_system)
│
├── 📁 消息通知 (/system/notifications) ⭐新增 ─── generate_menu: true
│   └── 📄 crm_notifications [独立表·无子表]
│       FK: user_id → sys_user.id
│
└── 📁 操作日志 (/system/operation-logs) ⭐新增 ─── generate_menu: true
    └── 📄 crm_operation_logs [独立表·无子表]
        FK: user_id → sys_user.id
        FK: related_table → 动态关联(客户/商机/合同等)
```

---

### 5. 统计表更新

| 模块(一级菜单) | 二级菜单数 | 主表/独立表 | 从表(嵌入Tab) | 总表数 |
|:---|:---:|:---:|:---:|:---:|
| 系统管理 | 9 | ... + crm_notifications, crm_operation_logs(9) | 5 | 9 |
| **合计** | **37** | **37** | **39** | **75** |

---

## ⚠️ 重要说明：模块化开发原则

### 为什么这两张表很重要？

1. **crm_notifications** - 实时通知中心
   - 配合 WebSocket 实现实时推送
   - 避免轮询，提升性能
   - 用户体验更好

2. **crm_operation_logs** - 审计与合规
   - 满足企业级审计要求
   - 问题追溯与责任定位
   - 数据安全监控

### 模块化开发优势

✅ **不修改框架源代码**
- 这两张表是纯业务表，完全在 `backend/app/plugin/module_crm/` 目录下
- 后端代码：`models/`, `schemas/`, `crud/`, `api/` 都在 CRM 插件目录
- 前端代码：`frontend/src/views/crm/system/notifications.vue` 和 `operation-logs.vue`

✅ **官方更新不受影响**
- FastApiAdmin 框架更新时，直接 `git pull` 即可
- CRM 插件代码完全独立，不会冲突
- 可以单独升级框架或单独升级 CRM 插件

✅ **便于维护**
- CRM 相关代码集中在一个目录
- 删除 CRM 功能只需删除 `module_crm` 目录
- 不影响系统核心功能

---

## 📋 下一步行动建议

### 立即执行

1. **确认文档完整性**
   ```bash
   # 验证数据库中确实是 75 张表
   docker exec fastapiadmin-postgres psql -U postgres -d fastapiadmin \
     -c "SELECT COUNT(*) FROM information_schema.tables 
         WHERE table_schema='public' AND table_name LIKE 'crm_%' 
         AND table_name NOT LIKE 'crm_test%';"
   ```

2. **检查这两张表的注释是否完整**
   ```sql
   -- 检查表注释
   SELECT obj_description(oid) AS comment
   FROM pg_class 
   WHERE relname IN ('crm_notifications', 'crm_operation_logs');
   
   -- 检查字段注释
   SELECT column_name, col_description(c.oid, a.attnum) AS comment
   FROM pg_class c
   JOIN pg_attribute a ON a.attrelid = c.oid
   WHERE c.relname = 'crm_notifications'
   ORDER BY a.attnum;
   ```

3. **在代码生成器中导入这两张表**
   - 打开代码生成器界面
   - 选择 `crm_notifications` 表
   - 按照上述配置填写
   - 生成代码并测试

### 后续优化

1. **完善字典配置**
   - `notification_type`: system, business, alert
   - `operation_type`: create, update, delete, export, import
   - `log_status`: success, failed

2. **添加业务逻辑**
   - 通知自动清理（超过30天的已读通知）
   - 日志归档（每月归档一次）
   - 异常操作告警（频繁删除、批量导出等）

3. **前端界面优化**
   - 通知列表：标记已读/未读、批量操作
   - 日志列表：高级筛选、导出Excel、详情弹窗

---

## 🔍 验证清单

生成完这两张表的代码后，检查以下内容：

### 后端检查
- [ ] `backend/app/plugin/module_crm/models/crm_notification.py` 存在且 `table=True`
- [ ] `backend/app/plugin/module_crm/models/crm_operation_log.py` 存在且 `table=True`
- [ ] Schema 文件包含 Create/Read/Update 类
- [ ] API 路由文件包含 CRUD 接口
- [ ] CRUD 文件包含完整的增删改查方法
- [ ] 外键字段正确定义（`foreign_key="sys_user.id"`）
- [ ] 软删除配置正确（这两张表不需要软删除）

### 前端检查
- [ ] `frontend/src/views/crm/system/notifications/index.vue` 存在
- [ ] `frontend/src/views/crm/system/operation-logs/index.vue` 存在
- [ ] API 调用文件存在（`frontend/src/api/module_crm/notification.ts`）
- [ ] 路由配置正确（菜单能正常显示）
- [ ] 权限控制正确（data_permission）

### 功能测试
- [ ] 通知列表能正常加载
- [ ] 标记已读功能正常
- [ ] 操作日志能记录所有操作
- [ ] 日志筛选功能正常
- [ ] 权限控制生效（普通用户看不到其他人的通知）

---

## 📝 总结

**修正内容**:
1. ✅ 版本号从 v4.0 升级到 v4.1
2. ✅ 表数量从 74 张更新为 75 张
3. ✅ 新增 crm_notifications 表的完整配置说明
4. ✅ 新增 crm_operation_logs 表的完整配置说明
5. ✅ 批次顺序调整为 12 批
6. ✅ 树状结构图补充 3.11 章节
7. ✅ 统计表数据更新

**关键要点**:
- ✅ 严格遵循模块化开发，不修改框架源代码
- ✅ 所有 CRM 代码都在 `module_crm` 插件目录
- ✅ 框架更新时可直接拉取，不影响 CRM 功能
- ✅ 两张新表都是系统级辅助功能，提升用户体验和安全性

**下一步**:
- 继续在代码生成器中导入剩余的 CRM 表
- 批量生成基础 CRUD 代码
- 统一进行界面优化（第二阶段）

---

**文档版本**: v4.1  
**修正日期**: 2026-04-29  
**修正人**: AI Assistant  
**审核状态**: 待用户确认
