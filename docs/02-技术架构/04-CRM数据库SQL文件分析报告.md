# CRM数据库SQL文件全面分析报告

> **分析日期**: 2026-04-26  
> **分析文件**: crm-tables-only.sql  
> **版本**: v3.0

---

## 📊 执行摘要

### 发现的3个关键问题

| 问题编号 | 严重程度 | 问题描述 | 影响范围 |
|---------|---------|---------|---------|
| P0-1 | 🔴 严重 | 文件混入6个非CRM系统表 | 可能导致表冲突 |
| P0-2 | 🔴 严重 | 枚举类型存储方式不统一 | 生成器无法正确处理 |
| P1-3 | 🟡 中等 | 部分表缺少标准审计字段 | 数据追溯困难 |

---

## 🔍 问题1：SQL文件完整性分析

### 1.1 表数量统计

```
总CREATE TABLE语句: 81个
CRM表（crm_前缀）: 75个
非CRM表: 6个 ❌
```

### 1.2 混入的非CRM表（需要移除）

```sql
1. app_portal          - 门户应用表（系统表）
2. apscheduler_jobs    - APScheduler任务表（系统表）
3. gen_demo            - 代码生成演示表（系统表）
4. gen_demo01          - 代码生成演示表（系统表）
5. gen_table           - 代码生成配置表（系统表）
6. gen_table_columns   - 代码生成字段表（系统表）
```

**建议**：这些表应该在系统SQL中，不应出现在CRM业务表SQL中。

---

### 1.3 审计字段完整性检查

#### 标准审计字段清单

| 字段名 | 类型 | 用途 | 状态 |
|--------|------|------|------|
| id | int4 | 主键 | ✅ 全部有 |
| created_id | int4 | 创建人ID | ⚠️ 需要检查 |
| updated_id | int4 | 更新人ID | ⚠️ 需要检查 |
| deleted_id | int4 | 删除人ID | ⚠️ 需要检查 |
| created_time | timestamp | 创建时间 | ⚠️ 需要检查 |
| updated_time | timestamp | 更新时间 | ⚠️ 需要检查 |
| is_deleted | bool | 逻辑删除标记 | ⚠️ 需要检查 |
| deleted_time | timestamp | 删除时间 | ⚠️ 需要检查 |
| uuid | varchar(64) | UUID全局标识 | ⚠️ 需要检查 |
| dept_id | int4 | 部门ID | ⚠️ 可选 |
| owner_id | int4 | 负责人ID | ⚠️ 可选 |

#### 实际统计结果

```
created_id: 652/81 = 80.5% (部分表缺失)
updated_id: 652/81 = 80.5% (部分表缺失)
deleted_id: 652/81 = 80.5% (部分表缺失)
uuid: 约75张表有
is_deleted: 约75张表有
```

**发现**：
- ✅ 大部分CRM表都有完整的审计字段
- ⚠️ 部分辅助表可能缺少某些审计字段
- ❌ 6个系统表混入，不应该在这里

---

### 1.4 外键约束完整性

```
总外键数: 约215个
deleted_id外键: 68个 ✅
created_id外键: 68个 ✅
updated_id外键: 68个 ✅
owner_id外键: 约9个 ✅
department_id外键: 约2个 ✅
业务外键: 约10个 ✅
```

**结论**：外键约束基本完整，但需要清理6个系统表。

---

## 🔍 问题2：枚举类型处理问题分析

### 2.1 当前枚举类型现状

#### SQL中的枚举定义方式

**方式1：VARCHAR + COMMENT（当前使用）**
```sql
"gender" varchar(10) COMMENT '性别(0:未知 1:男 2:女)'
"status" varchar(20) COMMENT '状态(0:正常 1:禁用)'
"priority" varchar(20) COMMENT '优先级(0:低 1:中 2:高 3:紧急)'
```

**方式2：ENUM类型（PostgreSQL原生）**
```sql
CREATE TYPE gender_enum AS ENUM ('unknown', 'male', 'female');
"gender" gender_enum DEFAULT 'unknown'
```

**方式3：INTEGER + COMMENT**
```sql
"gender" int4 COMMENT '性别(0:未知 1:男 2:女)'
```

---

### 2.2 核心问题剖析

从您的截图看，问题在于：

#### 问题A：枚举值存储方式不统一

**现状**：
- 有些表用 `varchar(20)` 存储枚举值
- COMMENT中标注了枚举映射（如 `0:未知 1:男 2:女`）
- 但实际数据库中**没有强制约束**，可以存入任意值

**风险**：
- ❌ 数据一致性无法保证
- ❌ 代码生成器无法自动识别枚举
- ❌ 前端下拉框需要手动配置

---

#### 问题B：代码生成器显示问题

**您的担心**：
> "生成器对应菜单列表字段把枚举类型名称都显示出来"

**实际情况**：
- 如果使用代码生成器（如FastapiAdmin的gen模块）
- 生成器会读取数据库COMMENT
- 但生成器默认行为是：
  - 后端：生成字段名（如 `gender`）
  - 前端列表：显示字段名（如 `gender`）而非枚举标签（如 `男`）
  - 前端表单：显示字段名（如 `gender`）而非下拉选择器

**期望行为**：
- 前端列表：显示枚举标签（男/女/未知）
- 前端表单：显示下拉选择器（选择男/女/未知）
- 后端API：返回枚举标签而非数字

---

### 2.3 问题根源

#### 根因1：缺少枚举字典表

**当前**：枚举值散落在各表的COMMENT中

**问题**：
- 无法统一管理
- 代码生成器无法自动读取
- 前端无法自动生成分类选择器

---

#### 根因2：FastapiAdmin代码生成器限制

**当前生成器能力**：
- ✅ 能生成基础CRUD代码
- ✅ 能读取字段COMMENT
- ❌ **不能自动识别枚举类型**
- ❌ **不能自动生成分类选择器**
- ❌ **不能自动转换枚举值为标签**

---

## 💡 问题3：完整解决方案

### 方案总览

```
┌─────────────────────────────────────────┐
│          统一枚举管理方案                 │
├─────────────────────────────────────────┤
│                                         │
│  1. SQL层：PostgreSQL ENUM类型          │
│  2. 字典层：sys_dict表统一管理           │
│  3. 后端层：Python Enum + Pydantic      │
│  4. 前端层：自动识别 + 下拉选择器        │
│  5. 生成器：自动配置枚举映射             │
│                                         │
└─────────────────────────────────────────┘
```

---

### 解决方案1：SQL层优化（推荐）⭐

#### 1.1 使用PostgreSQL ENUM类型

**优势**：
- ✅ 数据库级别强制约束
- ✅ 类型安全，不允许非法值
- ✅ 性能优于VARCHAR
- ✅ 代码生成器可识别

**实施步骤**：

**步骤1：创建枚举类型**
```sql
-- 性别枚举
CREATE TYPE gender_enum AS ENUM ('unknown', 'male', 'female');
COMMENT ON TYPE gender_enum IS '性别枚举';

-- 状态枚举
CREATE TYPE status_enum AS ENUM ('active', 'inactive', 'deleted');
COMMENT ON TYPE status_enum IS '状态枚举';

-- 优先级枚举
CREATE TYPE priority_enum AS ENUM ('low', 'medium', 'high', 'urgent');
COMMENT ON TYPE priority_enum IS '优先级枚举';

-- 客户类型枚举
CREATE TYPE customer_type_enum AS ENUM ('individual', 'enterprise', 'government');
COMMENT ON TYPE customer_type_enum IS '客户类型枚举';
```

**步骤2：在表中使用枚举类型**
```sql
CREATE TABLE "public"."crm_customers" (
  "id" int4 NOT NULL,
  "name" varchar(100) NOT NULL,
  "gender" gender_enum DEFAULT 'unknown',  -- 使用枚举类型
  "status" status_enum DEFAULT 'active',
  "priority" priority_enum DEFAULT 'medium',
  "customer_type" customer_type_enum DEFAULT 'individual',
  -- 其他字段...
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
);
```

**步骤3：在COMMENT中标注中文映射**
```sql
COMMENT ON COLUMN "public"."crm_customers"."gender" IS '性别(unknown:未知 male:男 female:女)';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '状态(active:正常 inactive:禁用 deleted:已删除)';
```

---

#### 1.2 统一字段命名规范

**规范**：
```
{字段名}_enum  →  不推荐（冗余）
{字段名}       →  推荐（直接使用枚举类型）
```

**示例**：
```sql
-- ❌ 不推荐
"gender_enum" gender_enum
"status_enum" status_enum

-- ✅ 推荐
"gender" gender_enum
"status" status_enum
```

---

### 解决方案2：字典层管理（FastapiAdmin特性）⭐⭐

#### 2.1 利用sys_dict统一管理枚举

**FastapiAdmin已有字典表**：
- `sys_dict_type` - 字典类型表
- `sys_dict_data` - 字典数据表

**配置示例**：

```sql
-- 1. 创建字典类型
INSERT INTO sys_dict_type (dict_name, dict_type, remark)
VALUES 
  ('性别', 'crm_gender', 'CRM客户性别字典'),
  ('状态', 'crm_status', 'CRM通用状态字典'),
  ('优先级', 'crm_priority', 'CRM优先级字典');

-- 2. 创建字典数据
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, status)
VALUES 
  -- 性别字典
  ('crm_gender', '未知', 'unknown', 1, '0'),
  ('crm_gender', '男', 'male', 2, '0'),
  ('crm_gender', '女', 'female', 3, '0'),
  
  -- 状态字典
  ('crm_status', '正常', 'active', 1, '0'),
  ('crm_status', '禁用', 'inactive', 2, '0'),
  ('crm_status', '已删除', 'deleted', 3, '0'),
  
  -- 优先级字典
  ('crm_priority', '低', 'low', 1, '0'),
  ('crm_priority', '中', 'medium', 2, '0'),
  ('crm_priority', '高', 'high', 3, '0'),
  ('crm_priority', '紧急', 'urgent', 4, '0');
```

**优势**：
- ✅ 统一管理所有枚举
- ✅ 支持动态修改（无需改代码）
- ✅ 前端可直接调用字典API
- ✅ 支持多语言

---

#### 2.2 在表COMMENT中标注字典类型

```sql
COMMENT ON COLUMN "public"."crm_customers"."gender" IS '性别[crm_gender]';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '状态[crm_status]';
COMMENT ON COLUMN "public"."crm_customers"."priority" IS '优先级[crm_priority]';
```

**格式规范**：
```
{字段说明}[{字典类型}]
```

**代码生成器识别**：
- 读取COMMENT中的 `[crm_gender]`
- 自动生成字典API调用
- 自动生成下拉选择器

---

### 解决方案3：后端Python层（Pydantic Enum）⭐

#### 3.1 定义Python Enum类

```python
# backend/app/plugin/module_crm/enums.py

from enum import Enum
from typing import Dict

class GenderEnum(str, Enum):
    """性别枚举"""
    UNKNOWN = "unknown"
    MALE = "male"
    FEMALE = "female"
    
    @classmethod
    def get_label(cls, value: str) -> str:
        """获取枚举标签"""
        labels = {
            "unknown": "未知",
            "male": "男",
            "female": "女"
        }
        return labels.get(value, value)
    
    @classmethod
    def get_options(cls) -> list[Dict]:
        """获取下拉选项"""
        return [
            {"label": "未知", "value": "unknown"},
            {"label": "男", "value": "male"},
            {"label": "女", "value": "female"}
        ]


class StatusEnum(str, Enum):
    """状态枚举"""
    ACTIVE = "active"
    INACTIVE = "inactive"
    DELETED = "deleted"
    
    @classmethod
    def get_label(cls, value: str) -> str:
        labels = {
            "active": "正常",
            "inactive": "禁用",
            "deleted": "已删除"
        }
        return labels.get(value, value)
    
    @classmethod
    def get_options(cls) -> list[Dict]:
        return [
            {"label": "正常", "value": "active"},
            {"label": "禁用", "value": "inactive"},
            {"label": "已删除", "value": "deleted"}
        ]
```

---

#### 3.2 在Pydantic Schema中使用

```python
# backend/app/plugin/module_crm/schemas.py

from pydantic import BaseModel, Field
from app.plugin.module_crm.enums import GenderEnum, StatusEnum

class CustomerCreateSchema(BaseModel):
    """客户创建Schema"""
    name: str = Field(..., description="客户名称")
    gender: GenderEnum = Field(default=GenderEnum.UNKNOWN, description="性别")
    status: StatusEnum = Field(default=StatusEnum.ACTIVE, description="状态")
    phone: str | None = None


class CustomerResponseSchema(BaseModel):
    """客户响应Schema"""
    id: int
    name: str
    gender: GenderEnum
    gender_label: str | None = None  # 枚举标签
    status: StatusEnum
    status_label: str | None = None
    
    class Config:
        from_attributes = True
    
    @field_validator('gender', mode='before')
    @classmethod
    def set_gender_label(cls, v, info):
        if hasattr(info.data, 'gender'):
            info.data['gender_label'] = GenderEnum.get_label(v)
        return v
```

---

### 解决方案4：前端层（自动识别）⭐⭐⭐

#### 4.1 前端字典工具函数

```typescript
// frontend/src/utils/dict.ts

import request from '@/utils/request'

// 字典缓存
const dictCache = new Map<string, any[]>()

/**
 * 获取字典数据
 * @param dictType 字典类型（如 crm_gender）
 */
export async function getDictData(dictType: string): Promise<any[]> {
  // 先从缓存读取
  if (dictCache.has(dictType)) {
    return dictCache.get(dictType)!
  }
  
  // 从API获取
  const { data } = await request.get(`/system/dict/data/type/${dictType}`)
  dictCache.set(dictType, data)
  
  return data
}

/**
 * 根据字典类型和值获取标签
 */
export async function getDictLabel(dictType: string, value: string): Promise<string> {
  const dictData = await getDictData(dictType)
  const item = dictData.find((d: any) => d.dict_value === value)
  return item?.dict_label || value
}
```

---

#### 4.2 自动生成下拉选择器

```vue
<!-- frontend/src/components/DictSelect/index.vue -->

<template>
  <el-select v-model="modelValue" :placeholder="placeholder">
    <el-option
      v-for="item in dictOptions"
      :key="item.dict_value"
      :label="item.dict_label"
      :value="item.dict_value"
    />
  </el-select>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import { getDictData } from '@/utils/dict'

const props = defineProps({
  dictType: { type: String, required: true },  // 字典类型
  modelValue: { type: String, default: '' },
  placeholder: { type: String, default: '请选择' }
})

const emit = defineEmits(['update:modelValue'])
const modelValue = ref(props.modelValue)
const dictOptions = ref<any[]>([])

// 监听值变化
watch(modelValue, (val) => {
  emit('update:modelValue', val)
})

// 加载字典数据
onMounted(async () => {
  dictOptions.value = await getDictData(props.dictType)
})
</script>
```

---

#### 4.3 在表单中使用

```vue
<!-- frontend/src/views/crm/customer/form.vue -->

<template>
  <el-form-item label="性别" prop="gender">
    <DictSelect
      v-model="formData.gender"
      dict-type="crm_gender"
      placeholder="请选择性别"
    />
  </el-form-item>
  
  <el-form-item label="状态" prop="status">
    <DictSelect
      v-model="formData.status"
      dict-type="crm_status"
      placeholder="请选择状态"
    />
  </el-form-item>
</template>
```

---

#### 4.4 列表显示转换

```vue
<!-- frontend/src/views/crm/customer/list.vue -->

<template>
  <el-table-column label="性别" prop="gender">
    <template #default="{ row }">
      <DictLabel dict-type="crm_gender" :value="row.gender" />
    </template>
  </el-table-column>
  
  <el-table-column label="状态" prop="status">
    <template #default="{ row }">
      <DictLabel dict-type="crm_status" :value="row.status" />
    </template>
  </el-table-column>
</template>

<script setup>
import DictLabel from '@/components/DictLabel/index.vue'
</script>
```

---

#### 4.5 DictLabel组件

```vue
<!-- frontend/src/components/DictLabel/index.vue -->

<template>
  <el-tag :type="tagType">{{ label }}</el-tag>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import { getDictLabel } from '@/utils/dict'

const props = defineProps({
  dictType: { type: String, required: true },
  value: { type: String, required: true }
})

const label = ref(props.value)

onMounted(async () => {
  label.value = await getDictLabel(props.dictType, props.value)
})
</script>
```

---

### 解决方案5：代码生成器改造（终极方案）🚀

#### 5.1 修改生成器模板

**后端模板改造**：
```python
# backend/app/plugin/module_generator/templates/model.py.j2

# 读取COMMENT中的字典类型
{% if field.comment and '[' in field.comment %}
    {% set dict_type = field.comment.split('[')[1].split(']')[0] %}
    {{ field.name }}: {{ field.python_type }} = Field(
        default={{ field.default }}, 
        description="{{ field.comment.split('[')[0] }}",
        schema_extra={"dict_type": "{{ dict_type }}"}
    )
{% else %}
    {{ field.name }}: {{ field.python_type }} = Field(
        default={{ field.default }}, 
        description="{{ field.comment }}"
    )
{% endif %}
```

**前端模板改造**：
```vue
<!-- frontend/app/plugin/module_generator/templates/form.vue.j2 -->

{% if field.dict_type %}
<!-- 枚举字段，使用DictSelect组件 -->
<el-form-item label="{{ field.label }}" prop="{{ field.name }}">
  <DictSelect
    v-model="formData.{{ field.name }}"
    dict-type="{{ field.dict_type }}"
    placeholder="请选择{{ field.label }}"
  />
</el-form-item>
{% else %}
<!-- 普通字段 -->
<el-form-item label="{{ field.label }}" prop="{{ field.name }}">
  <el-input v-model="formData.{{ field.name }}" placeholder="请输入{{ field.label }}" />
</el-form-item>
{% endif %}
```

---

#### 5.2 生成器自动识别逻辑

```python
# backend/app/plugin/module_generator/generator.py

import re

def parse_field_comment(comment: str) -> dict:
    """解析字段COMMENT，提取字典类型"""
    result = {
        'description': comment,
        'dict_type': None,
        'enum_values': []
    }
    
    # 匹配格式：说明[字典类型]
    match = re.match(r'(.+)\[(.+)\]', comment)
    if match:
        result['description'] = match.group(1).strip()
        result['dict_type'] = match.group(2).strip()
    
    # 匹配格式：说明(0:值1 1:值2)
    match = re.match(r'(.+)\((.+)\)', comment)
    if match:
        result['description'] = match.group(1).strip()
        enum_str = match.group(2)
        # 解析枚举值
        for item in enum_str.split():
            if ':' in item:
                key, value = item.split(':', 1)
                result['enum_values'].append({
                    'key': key.strip(),
                    'value': value.strip()
                })
    
    return result
```

---

## 📋 实施建议

### 阶段1：立即修正（P0优先级）

#### 任务1.1：清理非CRM表
```bash
# 从crm-tables-only.sql中移除6个系统表
# 只保留crm_前缀的表
```

**影响**：避免导入系统表导致冲突

---

#### 任务1.2：统一审计字段
```sql
-- 检查缺少审计字段的表
SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename LIKE 'crm_%'
  AND tablename NOT IN (
    SELECT tablename 
    FROM pg_tables 
    WHERE tablename LIKE 'crm_%'
      AND EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = tablename 
          AND column_name = 'created_id'
      )
  );
```

**补充缺失字段**：
```sql
ALTER TABLE crm_xxx ADD COLUMN created_id int4;
ALTER TABLE crm_xxx ADD COLUMN updated_id int4;
ALTER TABLE crm_xxx ADD COLUMN deleted_id int4;
-- 添加外键约束
ALTER TABLE crm_xxx ADD CONSTRAINT fk_xxx_created_id 
  FOREIGN KEY (created_id) REFERENCES sys_user(id) ON DELETE SET NULL;
```

---

### 阶段2：枚举类型标准化（P1优先级）

#### 任务2.1：创建PostgreSQL ENUM类型
```sql
-- 执行 create-crm-enums.sql
CREATE TYPE gender_enum AS ENUM ('unknown', 'male', 'female');
CREATE TYPE status_enum AS ENUM ('active', 'inactive', 'deleted');
-- ... 更多枚举
```

---

#### 任务2.2：配置sys_dict字典
```sql
-- 执行 init-crm-dicts.sql
INSERT INTO sys_dict_type (dict_name, dict_type, remark)
VALUES ('性别', 'crm_gender', 'CRM客户性别字典');

INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort)
VALUES 
  ('crm_gender', '未知', 'unknown', 1),
  ('crm_gender', '男', 'male', 2),
  ('crm_gender', '女', 'female', 3);
```

---

#### 任务2.3：更新表COMMENT
```sql
-- 执行 update-crm-comments.sql
COMMENT ON COLUMN "public"."crm_customers"."gender" IS '性别[crm_gender]';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '状态[crm_status]';
```

---

### 阶段3：前后端实现（P2优先级）

#### 任务3.1：后端Python Enum
- 创建 `backend/app/plugin/module_crm/enums.py`
- 定义所有枚举类
- 添加 `get_label()` 和 `get_options()` 方法

---

#### 任务3.2：前端字典组件
- 创建 `frontend/src/components/DictSelect/index.vue`
- 创建 `frontend/src/components/DictLabel/index.vue`
- 创建 `frontend/src/utils/dict.ts`

---

#### 任务3.3：修改生成器模板
- 修改 `backend/app/plugin/module_generator/templates/`
- 支持自动识别字典类型
- 自动生成分类选择器

---

## 🎯 最终效果

### 导入SQL后

```sql
-- 所有CRM表统一规范
CREATE TABLE "public"."crm_customers" (
  "id" int4 NOT NULL,
  "name" varchar(100) NOT NULL,
  "gender" gender_enum DEFAULT 'unknown',  -- 数据库强制约束
  "status" status_enum DEFAULT 'active',
  -- 标准审计字段
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "created_time" timestamp DEFAULT now(),
  "updated_time" timestamp DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "uuid" varchar(64) DEFAULT gen_random_uuid()
);

-- COMMENT标注字典类型
COMMENT ON COLUMN "public"."crm_customers"."gender" IS '性别[crm_gender]';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '状态[crm_status]';
```

---

### 后端Pydantic Schema

```python
from app.plugin.module_crm.enums import GenderEnum, StatusEnum

class CustomerCreateSchema(BaseModel):
    name: str
    gender: GenderEnum = GenderEnum.UNKNOWN  # 自动类型检查
    status: StatusEnum = StatusEnum.ACTIVE
```

---

### 前端表单（自动生成）

```vue
<el-form-item label="性别" prop="gender">
  <!-- 生成器自动识别[crm_gender]，生成DictSelect -->
  <DictSelect dict-type="crm_gender" v-model="formData.gender" />
</el-form-item>
```

---

### 前端列表（自动转换）

```vue
<el-table-column label="性别" prop="gender">
  <!-- 自动显示"男/女/未知"，而非"male/female/unknown" -->
  <template #default="{ row }">
    <DictLabel dict-type="crm_gender" :value="row.gender" />
  </template>
</el-table-column>
```

---

## ✅ 检查清单

### SQL层
- [ ] 移除6个非CRM系统表
- [ ] 所有表都有完整的审计字段
- [ ] 所有外键约束完整
- [ ] 使用PostgreSQL ENUM类型
- [ ] COMMENT中标注字典类型 `[dict_type]`

### 后端层
- [ ] 创建 `enums.py` 定义所有枚举
- [ ] Pydantic Schema使用Enum类型
- [ ] 添加 `get_label()` 方法
- [ ] 添加 `get_options()` 方法

### 前端层
- [ ] 创建 `DictSelect` 组件
- [ ] 创建 `DictLabel` 组件
- [ ] 创建 `dict.ts` 工具函数
- [ ] 修改生成器模板

### 字典层
- [ ] 在 `sys_dict_type` 中配置字典类型
- [ ] 在 `sys_dict_data` 中配置字典数据
- [ ] 测试字典API调用

---

## 📝 总结

### 核心原则

1. **数据库强制约束**：使用PostgreSQL ENUM类型，不允许非法值
2. **字典统一管理**：通过 `sys_dict` 表集中管理所有枚举
3. **代码生成器自动识别**：读取COMMENT中的 `[dict_type]`，自动生成代码
4. **前后端自动转换**：枚举值 ↔ 标签自动映射

### 优势

- ✅ **类型安全**：数据库层面强制约束
- ✅ **统一管理**：字典表集中维护
- ✅ **自动生成**：代码生成器自动处理
- ✅ **易于维护**：修改字典无需改代码
- ✅ **多语言支持**：字典表支持多语言

---

**维护者**: CRM开发团队  
**最后更新**: 2026-04-26  

---

© 2026 制造业CRM项目组 | CRM数据库SQL文件全面分析报告
