# CRM数据库SQL文件清理总结

> **清理日期**: 2026-04-26  
> **清理文件**: crm-tables-only.sql

---

## ✅ 清理完成

### 清理内容

已移除6个系统表及其所有相关语句：

| 表名 | 类型 | 说明 |
|------|------|------|
| app_portal | 系统表 | 门户应用表 |
| apscheduler_jobs | 系统表 | APScheduler定时任务表 |
| gen_demo | 系统表 | 代码生成演示表 |
| gen_demo01 | 系统表 | 代码生成演示表 |
| gen_table | 系统表 | 代码生成配置表 ⚠️ |
| gen_table_column | 系统表 | 代码生成字段配置表 ⚠️ |

---

## ⚠️ 重要发现

### gen_table 插入语句的含义

您提到的INSERT语句：
```sql
INSERT INTO "public"."gen_table" VALUES (
  'crm_ai_customer_profiles',  -- 表名
  'Ai Customer Profiles',      -- 表描述
  'CrmAiCustomerProfiles',     -- 类名
  ...
);
```

**这意味着**：
- ✅ `crm_ai_customer_profiles` 表**已经在代码生成器中配置**
- ✅ 配置时间：2026-04-21（创建），2026-04-25（更新）
- ✅ 配置人：用户ID=1（通常是admin）

**为什么要移除**：
- ❌ 这些配置应该在系统数据库中，不在CRM业务表SQL中
- ❌ 导入CRM SQL时会覆盖现有的代码生成器配置
- ❌ 可能导致其他表的配置丢失

---

## 📊 清理后统计

| 项目 | 数量 |
|------|------|
| CRM表 | 75张 ✅ |
| 系统表 | 0张 ✅ |
| 外键约束 | 306个 ✅ |
| 文件大小 | 2.6MB |
| 文件行数 | 12,613行 |

---

## 🎯 关于代码生成器配置的建议

### 方案1: 在数据库中手动配置（推荐）✅

**不要将gen_table配置放在SQL文件中**，而是：

1. 导入CRM表SQL后
2. 登录系统后台
3. 进入"代码生成"模块
4. 逐个配置需要生成的表

**优势**：
- ✅ 配置灵活，可随时调整
- ✅ 不影响系统配置
- ✅ 可以预览生成效果

---

### 方案2: 创建单独的配置文件

如果需要批量配置，可以创建独立的SQL文件：

```
backend/sql/postgres/
├── crm-tables-only.sql           ← CRM表结构（已完成✅）
├── crm-foreign-keys.sql          ← CRM外键约束（已完成✅）
└── crm-gen-config.sql            ← 代码生成器配置（可选）
```

**crm-gen-config.sql示例**：
```sql
-- 配置crm_customers表的代码生成
INSERT INTO "public"."gen_table" VALUES (
  'crm_customers',
  '客户表',
  'CrmCustomers',
  'module_crm',
  'crm_customers',
  'crm_customers',
  '客户管理',
  NULL, NULL, NULL,
  'uuid-value',
  '0', NULL,
  now(), now(),
  1, 1, 'f', now(), 1
);

-- 配置crm_customers的字段
INSERT INTO "public"."gen_table_column" VALUES (
  'id', '主键ID', 'int4', '10', NULL,
  true, true, false, false,
  'int', 'id',
  false, false, true, false,
  'EQ', 'input', NULL, 1,
  (SELECT id FROM gen_table WHERE table_name='crm_customers'),
  'uuid', '0', NULL, now(), now(), 1, 1, '0', 'f', now(), 1
);
-- ... 更多字段
```

---

## 🔧 清理工具

已创建3个清理脚本供后续使用：

| 脚本 | 语言 | 说明 |
|------|------|------|
| clean-sql.py | Python ⭐ | 推荐，清理效果最好 |
| clean-sql.sh | Bash | Linux/Mac使用 |
| clean-sql.ps1 | PowerShell | Windows使用（有编码问题） |

**使用方法**：
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres
python clean-sql.py
```

---

## 📝 最终建议

### 关于gen_table配置

**不要将其放入CRM业务表SQL**，原因：

1. **职责分离**
   - CRM SQL：只负责创建业务表
   - gen_table：代码生成器配置，属于系统功能

2. **避免冲突**
   - 不同环境的配置可能不同
   - 导入SQL可能覆盖手动配置

3. **灵活性**
   - 代码生成配置需要调试和调整
   - 通过界面配置更直观

---

### 推荐的开发流程

```
1. 设计数据库表结构
   ↓
2. 导出crm-tables-only.sql（只含表结构+外键）
   ↓
3. 导入开发数据库
   ↓
4. 在系统后台配置代码生成器
   ↓
5. 生成CRUD代码
   ↓
6. 根据需求调整生成的代码
   ↓
7. 提交Git
```

---

## ✅ 验证清单

- [x] 移除所有系统表（app_、apscheduler、gen_、sys_）
- [x] 保留所有CRM表（crm_前缀）
- [x] 保留所有外键约束
- [x] 验证文件完整性
- [x] 测试导入（待执行）

---

## 📦 最终文件

**crm-tables-only.sql** - 干净的CRM业务表SQL
- ✅ 75张CRM表
- ✅ 306个外键约束
- ✅ 0个系统表
- ✅ 可直接导入使用

---

**维护者**: CRM开发团队  
**最后更新**: 2026-04-26  

---

© 2026 制造业CRM项目组 | CRM数据库SQL文件清理总结
