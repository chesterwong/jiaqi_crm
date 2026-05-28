# CRM数据库表标准字段规范与修复方案

> **版本**: v1.0  
> **日期**: 2026-04-22  
> **目标**: 统一所有CRM表的标准字段，确保与FastApiAdmin框架100%兼容  
> **依据**: 
> - 框架基类：`app/core/base_model.py`（ModelMixin + UserMixin）
> - 系统表实测：sys_user, sys_dept, sys_role等15张表
> - CRM业务表实测：68张表（实际数据库2026-04-22）

---

## 一、问题分析

### 1.1 当前严重问题

| 问题 | 影响范围 | 严重程度 | 说明 |
|------|---------|---------|------|
| 缺少uuid字段 | 68张表（100%） | 🔴 严重 | 代码生成器生成的代码无法运行 |
| 字段名不一致 | 68张表（100%） | 🔴 严重 | created_at vs created_time |
| 缺少deleted_id | 68张表（100%） | 🔴 严重 | 删除审计功能失效 |
| 外键字段名不一致 | 68张表（100%） | 🔴 严重 | created_by vs created_id |
| status字段冲突 | 约30张表 | 🟡 中等 | 业务状态与系统状态冲突 |

### 1.2 问题根因

1. **数据库表创建时未遵循框架规范**
2. **代码生成器未使用框架基类**
3. **历史遗留字段名（created_at/created_by）**

---

## 二、框架标准字段定义

### 2.1 系统表标准结构（实测15张表）

通过实测`sys_user`、`sys_dept`、`sys_role`等表，确认框架标准字段：

| 序号 | 字段名 | 数据类型 | 必填 | 默认值 | 索引 | 外键 | 说明 |
|------|--------|---------|------|--------|------|------|------|
| 1 | id | Integer | ✅ | 自增 | ✅ | - | 主键ID |
| 2 | uuid | String(64) | ✅ | gen_random_uuid() | ✅ UNIQUE | - | UUID全局唯一标识 |
| 3 | status | String(10) | ✅ | '0' | ✅ | - | 状态(0:正常 1:禁用) |
| 4 | description | Text | ❌ | NULL | - | - | 备注/描述 |
| 5 | created_time | DateTime | ✅ | now() | ✅ | - | 创建时间 |
| 6 | updated_time | DateTime | ✅ | now() | ✅ | - | 更新时间 |
| 7 | is_deleted | Boolean | ✅ | false | ✅ | - | 是否已删除 |
| 8 | deleted_time | DateTime | ❌ | NULL | ✅ | - | 删除时间 |
| 9 | created_id | Integer | ❌ | NULL | ✅ | sys_user.id | 创建人ID |
| 10 | updated_id | Integer | ❌ | NULL | ✅ | sys_user.id | 更新人ID |
| 11 | deleted_id | Integer | ❌ | NULL | ✅ | sys_user.id | 删除人ID |

### 2.2 框架基类定义（app/core/base_model.py）

```python
class ModelMixin(MappedBase):
    """模型混入类 - 提供通用字段和功能"""
    
    # 基础字段
    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True, comment="主键ID", index=True)
    uuid: Mapped[str] = mapped_column(String(64), default=uuid4_str, nullable=False, unique=True, comment="UUID全局唯一标识", index=True)
    status: Mapped[str] = mapped_column(String(10), default="0", nullable=False, comment="状态(0:正常 1:禁用)", index=True)
    description: Mapped[str | None] = mapped_column(Text, default=None, nullable=True, comment="备注/描述")
    created_time: Mapped[datetime] = mapped_column(DateTime, default=datetime.now, nullable=False, comment="创建时间", index=True)
    updated_time: Mapped[datetime] = mapped_column(DateTime, default=datetime.now, onupdate=datetime.now, nullable=False, comment="更新时间", index=True)
    is_deleted: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False, comment="是否已删除(0:未删除 1:已删除)", index=True)
    deleted_time: Mapped[datetime | None] = mapped_column(DateTime, default=None, nullable=True, comment="删除时间", index=True)

class UserMixin(MappedBase):
    """用户审计字段 Mixin"""
    
    created_id: Mapped[int | None] = mapped_column(Integer, ForeignKey("sys_user.id", ondelete="SET NULL", onupdate="CASCADE"), default=None, nullable=True, index=True, comment="创建人ID")
    updated_id: Mapped[int | None] = mapped_column(Integer, ForeignKey("sys_user.id", ondelete="SET NULL", onupdate="CASCADE"), default=None, nullable=True, index=True, comment="更新人ID")
    deleted_id: Mapped[int | None] = mapped_column(Integer, ForeignKey("sys_user.id", ondelete="SET NULL", onupdate="CASCADE"), default=None, nullable=True, index=True, comment="删除人ID")
```

---

## 三、CRM业务表字段现状与修复方案

### 3.1 字段现状统计（68张表）

| 字段名 | 现有表数量 | 占比 | 状态 |
|--------|-----------|------|------|
| id | 68 | 100% | ✅ 正常 |
| uuid | 0 | 0% | ❌ **全部缺失** |
| status | 68 | 100% | ⚠️ **业务状态冲突** |
| description | 45 | 66% | ⚠️ **部分缺失** |
| created_time | 0 | 0% | ❌ **全部缺失**（用created_at） |
| updated_time | 0 | 0% | ❌ **全部缺失**（用updated_at） |
| is_deleted | 60 | 88% | ⚠️ **部分缺失** |
| deleted_time | 58 | 85% | ⚠️ **部分缺失** |
| created_id | 0 | 0% | ❌ **全部缺失**（用created_by） |
| updated_id | 0 | 0% | ❌ **全部缺失**（用updated_by） |
| deleted_id | 0 | 0% | ❌ **全部缺失** |

### 3.2 字段修复对照表

| 框架标准字段 | 数据库实际字段 | 修复操作 | SQL操作 |
|------------|--------------|---------|---------|
| uuid | （缺失） | **添加字段** | ALTER TABLE ADD COLUMN uuid |
| status | status（业务状态） | **重命名+新增** | RENAME TO xxx_status + ADD COLUMN status |
| description | description | 保留 | 无需操作 |
| created_time | created_at | **重命名** | ALTER TABLE RENAME COLUMN |
| updated_time | updated_at | **重命名** | ALTER TABLE RENAME COLUMN |
| is_deleted | is_deleted | 保留 | 无需操作 |
| deleted_time | deleted_time | 保留 | 无需操作 |
| created_id | created_by | **重命名** | ALTER TABLE RENAME COLUMN |
| updated_id | updated_by | **重命名** | ALTER TABLE RENAME COLUMN |
| deleted_id | （缺失） | **添加字段** | ALTER TABLE ADD COLUMN deleted_id |

### 3.3 status字段冲突处理

对于有业务状态的表，需要将系统的`status`重命名为业务状态字段：

| 表名 | 当前status含义 | 重命名为 | 新增系统status |
|------|--------------|---------|---------------|
| crm_customers | 客户状态 | customer_status | status(0:正常 1:禁用) |
| crm_contacts | 联系人状态 | contact_status | status(0:正常 1:禁用) |
| crm_opportunities | 商机阶段 | opportunity_stage | status(0:正常 1:禁用) |
| crm_leads | 线索状态 | lead_status | status(0:正常 1:禁用) |
| crm_quotations | 报价状态 | quotation_status | status(0:正常 1:禁用) |
| crm_contracts | 合同状态 | contract_status | status(0:正常 1:禁用) |
| crm_orders | 订单状态 | order_status | status(0:正常 1:禁用) |
| crm_products | 产品状态 | product_status | status(0:正常 1:禁用) |

---

## 四、完整SQL修复脚本

### 4.1 第1步：添加缺失字段（uuid + deleted_id）

```sql
-- ==========================================
-- 第1步：为所有CRM表添加uuid和deleted_id字段
-- ==========================================

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
          AND table_name LIKE 'crm_%'
          AND table_name NOT LIKE 'crm_test%'
        ORDER BY table_name
    LOOP
        -- 1. 添加uuid字段
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'uuid'
        ) THEN
            EXECUTE format('ALTER TABLE %I ADD COLUMN uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid()::text', table_record.table_name);
            EXECUTE format('CREATE UNIQUE INDEX idx_%s_uuid ON %I (uuid)', table_record.table_name, table_record.table_name);
            RAISE NOTICE '✅ 添加uuid到 %', table_record.table_name;
        END IF;
        
        -- 2. 添加deleted_id字段
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'deleted_id'
        ) THEN
            EXECUTE format('ALTER TABLE %I ADD COLUMN deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL', table_record.table_name);
            EXECUTE format('CREATE INDEX idx_%s_deleted_id ON %I (deleted_id)', table_record.table_name, table_record.table_name);
            RAISE NOTICE '✅ 添加deleted_id到 %', table_record.table_name;
        END IF;
    END LOOP;
END $$;
```

### 4.2 第2步：重命名字段（核心修复）

```sql
-- ==========================================
-- 第2步：重命名字段以符合框架规范
-- ==========================================

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
          AND table_name LIKE 'crm_%'
          AND table_name NOT LIKE 'crm_test%'
        ORDER BY table_name
    LOOP
        -- 1. 重命名 created_at → created_time
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'created_at'
        ) AND NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'created_time'
        ) THEN
            EXECUTE format('ALTER TABLE %I RENAME COLUMN created_at TO created_time', table_record.table_name);
            RAISE NOTICE '✅ 重命名 created_at → created_time in %', table_record.table_name;
        END IF;
        
        -- 2. 重命名 updated_at → updated_time
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'updated_at'
        ) AND NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'updated_time'
        ) THEN
            EXECUTE format('ALTER TABLE %I RENAME COLUMN updated_at TO updated_time', table_record.table_name);
            RAISE NOTICE '✅ 重命名 updated_at → updated_time in %', table_record.table_name;
        END IF;
        
        -- 3. 重命名 created_by → created_id
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'created_by'
        ) AND NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'created_id'
        ) THEN
            EXECUTE format('ALTER TABLE %I RENAME COLUMN created_by TO created_id', table_record.table_name);
            RAISE NOTICE '✅ 重命名 created_by → created_id in %', table_record.table_name;
        END IF;
        
        -- 4. 重命名 updated_by → updated_id
        IF EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'updated_by'
        ) AND NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'updated_id'
        ) THEN
            EXECUTE format('ALTER TABLE %I RENAME COLUMN updated_by TO updated_id', table_record.table_name);
            RAISE NOTICE '✅ 重命名 updated_by → updated_id in %', table_record.table_name;
        END IF;
    END LOOP;
END $$;
```

### 4.3 第3步：处理status字段冲突

```sql
-- ==========================================
-- 第3步：处理status字段冲突（业务状态）
-- ==========================================

-- 3.1 客户管理模块
ALTER TABLE crm_customers RENAME COLUMN status TO customer_status;
ALTER TABLE crm_customers ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_customers_status ON crm_customers (status);

ALTER TABLE crm_contacts RENAME COLUMN status TO contact_status;
ALTER TABLE crm_contacts ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_contacts_status ON crm_contacts (status);

-- 3.2 销售管理模块
ALTER TABLE crm_opportunities RENAME COLUMN status TO opportunity_status;
ALTER TABLE crm_opportunities ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_opportunities_status ON crm_opportunities (status);

ALTER TABLE crm_leads RENAME COLUMN status TO lead_status;
ALTER TABLE crm_leads ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_leads_status ON crm_leads (status);

-- 3.3 商务合同模块
ALTER TABLE crm_quotations RENAME COLUMN status TO quotation_status;
ALTER TABLE crm_quotations ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_quotations_status ON crm_quotations (status);

ALTER TABLE crm_contracts RENAME COLUMN status TO contract_status;
ALTER TABLE crm_contracts ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_contracts_status ON crm_contracts (status);

ALTER TABLE crm_orders RENAME COLUMN status TO order_status;
ALTER TABLE crm_orders ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_orders_status ON crm_orders (status);

-- 3.4 产品管理模块
ALTER TABLE crm_products RENAME COLUMN status TO product_status;
ALTER TABLE crm_products ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
CREATE INDEX idx_crm_products_status ON crm_products (status);

-- 3.5 其他有业务状态的表（按需执行）
-- ALTER TABLE crm_xxx RENAME COLUMN status TO xxx_status;
-- ALTER TABLE crm_xxx ADD COLUMN status VARCHAR(10) DEFAULT '0' NOT NULL;
-- CREATE INDEX idx_crm_xxx_status ON crm_xxx (status);
```

### 4.4 第4步：添加缺失的is_deleted和deleted_time

```sql
-- ==========================================
-- 第4步：补充缺失的软删除字段
-- ==========================================

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
          AND table_name LIKE 'crm_%'
          AND table_name NOT LIKE 'crm_test%'
        ORDER BY table_name
    LOOP
        -- 1. 添加is_deleted（如果缺失）
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'is_deleted'
        ) THEN
            EXECUTE format('ALTER TABLE %I ADD COLUMN is_deleted BOOLEAN DEFAULT false NOT NULL', table_record.table_name);
            EXECUTE format('CREATE INDEX idx_%s_is_deleted ON %I (is_deleted)', table_record.table_name, table_record.table_name);
            RAISE NOTICE '✅ 添加is_deleted到 %', table_record.table_name;
        END IF;
        
        -- 2. 添加deleted_time（如果缺失）
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = table_record.table_name 
              AND column_name = 'deleted_time'
        ) THEN
            EXECUTE format('ALTER TABLE %I ADD COLUMN deleted_time TIMESTAMP', table_record.table_name);
            EXECUTE format('CREATE INDEX idx_%s_deleted_time ON %I (deleted_time)', table_record.table_name, table_record.table_name);
            RAISE NOTICE '✅ 添加deleted_time到 %', table_record.table_name;
        END IF;
    END LOOP;
END $$;
```

---

## 五、Alembic迁移脚本（推荐）

```python
"""修复CRM表标准字段不一致问题

Revision ID: fix_crm_standard_fields
Revises: previous_revision
Create Date: 2026-04-22 10:00:00.000000

"""
from alembic import op
import sqlalchemy as sa

revision = 'fix_crm_standard_fields'
down_revision = 'previous_revision'
branch_labels = None
depends_on = None


def upgrade() -> None:
    """升级：修复标准字段"""
    
    conn = op.get_bind()
    
    # 获取所有CRM表
    result = conn.execute(sa.text("""
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' 
          AND table_name LIKE 'crm_%'
          AND table_name NOT LIKE 'crm_test%'
        ORDER BY table_name
    """))
    tables = [row[0] for row in result]
    
    for table in tables:
        # 1. 添加uuid字段
        if not conn.execute(sa.text(f"""
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = '{table}' AND column_name = 'uuid'
        """)).first():
            op.add_column(table, sa.Column('uuid', sa.String(64), nullable=False, server_default=sa.text('gen_random_uuid()::text')))
            op.create_index(f'idx_{table}_uuid', table, ['uuid'], unique=True)
            print(f'✅ 添加uuid到 {table}')
        
        # 2. 添加deleted_id字段
        if not conn.execute(sa.text(f"""
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = '{table}' AND column_name = 'deleted_id'
        """)).first():
            op.add_column(table, sa.Column('deleted_id', sa.Integer(), sa.ForeignKey('sys_user.id', ondelete='SET NULL')))
            op.create_index(f'idx_{table}_deleted_id', table, ['deleted_id'])
            print(f'✅ 添加deleted_id到 {table}')
        
        # 3. 重命名字段
        rename_pairs = [
            ('created_at', 'created_time'),
            ('updated_at', 'updated_time'),
            ('created_by', 'created_id'),
            ('updated_by', 'updated_id'),
        ]
        
        for old_name, new_name in rename_pairs:
            if conn.execute(sa.text(f"""
                SELECT 1 FROM information_schema.columns 
                WHERE table_name = '{table}' AND column_name = '{old_name}'
            """)).first() and not conn.execute(sa.text(f"""
                SELECT 1 FROM information_schema.columns 
                WHERE table_name = '{table}' AND column_name = '{new_name}'
            """)).first():
                op.alter_column(table, old_name, new_column_name=new_name)
                print(f'✅ 重命名 {old_name} → {new_name} in {table}')
    
    # 4. 处理status字段冲突（重点表）
    status_renames = {
        'crm_customers': 'customer_status',
        'crm_contacts': 'contact_status',
        'crm_opportunities': 'opportunity_status',
        'crm_leads': 'lead_status',
        'crm_quotations': 'quotation_status',
        'crm_contracts': 'contract_status',
        'crm_orders': 'order_status',
        'crm_products': 'product_status',
    }
    
    for table, new_status_name in status_renames.items():
        if conn.execute(sa.text(f"""
            SELECT 1 FROM information_schema.columns 
            WHERE table_name = '{table}' AND column_name = 'status'
        """)).first():
            op.alter_column(table, 'status', new_column_name=new_status_name)
            op.add_column(table, sa.Column('status', sa.String(10), nullable=False, server_default='0'))
            op.create_index(f'idx_{table}_status', table, ['status'])
            print(f'✅ 处理status冲突：{table}.status → {new_status_name}')


def downgrade() -> None:
    """降级：还原字段名"""
    
    conn = op.get_bind()
    
    # 反向操作（略）
    pass
```

---

## 六、执行验证

### 6.1 验证脚本

```sql
-- 验证所有CRM表是否已修复
SELECT 
    table_name,
    MAX(CASE WHEN column_name = 'uuid' THEN 1 ELSE 0 END) AS has_uuid,
    MAX(CASE WHEN column_name = 'created_time' THEN 1 ELSE 0 END) AS has_created_time,
    MAX(CASE WHEN column_name = 'updated_time' THEN 1 ELSE 0 END) AS has_updated_time,
    MAX(CASE WHEN column_name = 'created_id' THEN 1 ELSE 0 END) AS has_created_id,
    MAX(CASE WHEN column_name = 'updated_id' THEN 1 ELSE 0 END) AS has_updated_id,
    MAX(CASE WHEN column_name = 'deleted_id' THEN 1 ELSE 0 END) AS has_deleted_id,
    MAX(CASE WHEN column_name = 'status' THEN 1 ELSE 0 END) AS has_status,
    MAX(CASE WHEN column_name = 'is_deleted' THEN 1 ELSE 0 END) AS has_is_deleted
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name LIKE 'crm_%'
  AND table_name NOT LIKE 'crm_test%'
GROUP BY table_name
ORDER BY table_name;
```

### 6.2 期望结果

所有68张表都应该显示：
- ✅ has_uuid = 1
- ✅ has_created_time = 1
- ✅ has_updated_time = 1
- ✅ has_created_id = 1
- ✅ has_updated_id = 1
- ✅ has_deleted_id = 1
- ✅ has_status = 1
- ✅ has_is_deleted = 1

---

## 七、代码生成器配置更新

### 7.1 生成模板更新

修复数据库后，代码生成器生成的模型必须包含所有标准字段：

```python
from app.core.base_model import ModelMixin, UserMixin
from sqlalchemy.orm import Mapped, mapped_column

class CrmCustomer(ModelMixin, UserMixin):
    """客户表"""
    __tablename__ = "crm_customers"
    __table_args__ = {"comment": "客户表"}
    
    # 标准字段（来自ModelMixin + UserMixin）
    # id, uuid, status, description, created_time, updated_time
    # is_deleted, deleted_time, created_id, updated_id, deleted_id
    
    # 业务字段
    customer_code: Mapped[str] = mapped_column(String(50), unique=True, comment="客户编码")
    customer_name: Mapped[str] = mapped_column(String(200), comment="客户名称")
    customer_status: Mapped[str | None] = mapped_column(String(20), comment="客户状态（业务状态）")
    # ... 其他业务字段
```

### 7.2 Schema配置

```python
from pydantic import BaseModel

class CrmCustomerBase(BaseModel):
    """客户基础Schema"""
    customer_code: str
    customer_name: str
    customer_status: str | None = None

class CrmCustomerCreate(CrmCustomerBase):
    """创建客户Schema"""
    pass

class CrmCustomerRead(CrmCustomerBase):
    """读取客户Schema（包含标准字段）"""
    id: int
    uuid: str
    status: str  # 系统状态
    created_time: datetime
    updated_time: datetime
    created_id: int | None
    updated_id: int | None
    
    class Config:
        from_attributes = True
```

---

## 八、执行步骤与注意事项

### 8.1 执行顺序

1. ✅ **备份数据库**：`pg_dump -U crm_user -d crm > backup_$(date +%Y%m%d).sql`
2. ✅ **执行第1步**：添加uuid和deleted_id字段
3. ✅ **执行第2步**：重命名字段（created_at→created_time等）
4. ✅ **执行第3步**：处理status字段冲突
5. ✅ **执行第4步**：补充is_deleted和deleted_time
6. ✅ **执行验证**：运行验证脚本确认所有表已修复
7. ✅ **更新代码**：重新生成Model和Schema
8. ✅ **测试功能**：测试CRUD、软删除、审计功能

### 8.2 注意事项

1. ⚠️ **必须先备份数据库**
2. ⚠️ **在测试环境先执行验证**
3. ⚠️ **status字段冲突必须逐个表检查**
4. ⚠️ **外键约束需要更新（created_by→created_id）**
5. ⚠️ **代码生成器模板需要同步更新**
6. ⚠️ **前端代码可能需要调整字段名**

---

## 九、总结

### 9.1 修复内容

| 修复项 | 影响表数量 | 操作类型 |
|--------|-----------|---------|
| 添加uuid字段 | 68张 | ADD COLUMN |
| 添加deleted_id字段 | 68张 | ADD COLUMN |
| 重命名created_at→created_time | 68张 | RENAME COLUMN |
| 重命名updated_at→updated_time | 68张 | RENAME COLUMN |
| 重命名created_by→created_id | 68张 | RENAME COLUMN |
| 重命名updated_by→updated_id | 68张 | RENAME COLUMN |
| 处理status字段冲突 | 约30张 | RENAME + ADD |
| 补充is_deleted | 约8张 | ADD COLUMN |
| 补充deleted_time | 约10张 | ADD COLUMN |

### 9.2 修复后收益

- ✅ 100%兼容FastApiAdmin框架
- ✅ 代码生成器生成的代码可直接使用
- ✅ 软删除功能正常工作
- ✅ 审计功能完整（创建人/更新人/删除人）
- ✅ UUID全局唯一标识
- ✅ 前后端字段名统一

---

**文档维护**: 本规范应根据框架更新持续维护，确保所有新表都遵循标准字段定义。

**创建日期**: 2026-04-22  
**文档版本**: v1.0
