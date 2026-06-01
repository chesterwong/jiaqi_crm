# crm_xiaoe_contacts 建表说明

## 1. 概述

| 项 | 说明 |
|---|---|
| **表名** | `crm_xiaoe_contacts` |
| **中文名** | 小鹅通联系表 |
| **用途** | 存储小鹅通侧联系人/用户同步数据 |
| **数据库** | PostgreSQL `public` |

## 2. 业务字段

| 序号 | 业务列 | 字段名 | 类型 | 可空 | 说明 |
|:---:|:---|:---|:---|:---:|:---|
| — | 主键 | `id` | `int4` | N | 自增 |
| 1 | 序号 | `serial_no` | `int4` | Y | 台账/导入行号，≠ `id` |
| 2 | 用户名 | `username` | `varchar(100)` | Y | 小鹅通用户名 |
| 3 | 手机号 | `phone` | `varchar(50)` | Y | 手机号 |
| 4 | 更新时间 | `xiaoe_updated_at` | `timestamp(6)` | Y | **小鹅通侧**最后更新时间 |

> `xiaoe_updated_at` 表示平台数据更新时间；系统记录变更时间用审计字段 `updated_time`。

## 3. 审计字段（与 CRM 一致）

`created_id`、`updated_id`、`created_time`、`updated_time`、`is_deleted`、`deleted_time`、`deleted_id`、`uuid`、`description`、`dept_id`

## 4. 索引

| 索引 | 字段 |
|:---|:---|
| `idx_crm_xiaoe_contacts_phone` | `phone` |
| `idx_crm_xiaoe_contacts_username` | `username` |
| `idx_crm_xiaoe_contacts_xiaoe_updated_at` | `xiaoe_updated_at` |

## 5. 执行

```bash
cd backend
ENVIRONMENT=dev .venv/bin/python scripts/apply_sql_file.py sql/postgres/09-crm-xiaoe-contacts.sql
```
