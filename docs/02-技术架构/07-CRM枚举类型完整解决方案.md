# CRM枚举类型完整解决方案

> **问题**: FastapiAdmin代码生成器无法识别枚举类型，生成的前端是输入框而非下拉选择框  
> **目标**: 让代码生成器自动识别枚举字段并生成DictSelect下拉组件  
> **时间**: 2026-04-26

---

## 📋 一、问题分析

### 当前SQL中的注释格式

```sql
-- 格式1：布尔值说明（不是枚举）
COMMENT ON COLUMN "crm_customers"."is_deleted" IS '是否已删除(false:否 true:是)';

-- 格式2：简单枚举值列举（代码生成器无法识别）
COMMENT ON COLUMN "crm_customers"."churn_risk" IS '流失风险(high/medium/low)';

-- 格式3：数字枚举（旧格式，不推荐）
COMMENT ON COLUMN "crm_customers"."source" IS '来源:1-自主开发,2-市场活动,3-转介绍...';
```

### 存在的问题

1. ❌ **只是注释** - 这些COMMENT只是给人看的说明，不是真正的枚举约束
2. ❌ **代码生成器无法识别** - FastapiAdmin的代码生成器不知道这些是枚举字段
3. ❌ **生成输入框** - 代码生成器会生成`<el-input>`而非`<el-select>`
4. ❌ **用户体验差** - 用户新增数据时不知道该填什么值（如客户等级应该填A/B/C/D？）

---

## ✅ 二、完整解决方案（5层架构）

```
┌─────────────────────────────────────────┐
│   第1层：SQL层 - COMMENT标注[dict_type] │
│   COMMENT ON COLUMN IS '性别[crm_gender]'│
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│   第2层：字典层 - sys_dict统一管理      │
│   sys_dict_type + sys_dict_data         │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│   第3层：后端层 - Python Enum类         │
│   class GenderEnum(str, Enum)           │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│   第4层：前端层 - Vue组件               │
│   DictSelect(表单) + DictLabel(列表)    │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│   第5层：代码生成器 - 自动识别          │
│   解析[dict_type]生成对应组件           │
└─────────────────────────────────────────┘
```

---

## 🔧 三、具体实施步骤

### 步骤1：统一SQL注释格式（添加[dict_type]标注）

**修改前**：
```sql
COMMENT ON COLUMN "crm_customers"."level" IS '客户等级';
```

**修改后**：
```sql
COMMENT ON COLUMN "crm_customers"."level" IS '客户等级[crm_customer_level]';
```

**格式规范**：
```
字段说明[字典类型]
```

**示例**：
```sql
-- 客户相关
COMMENT ON COLUMN "crm_customers"."type" IS '客户类型[crm_customer_type]';
COMMENT ON COLUMN "crm_customers"."status" IS '客户状态[crm_customer_status]';
COMMENT ON COLUMN "crm_customers"."level" IS '客户等级[crm_customer_level]';
COMMENT ON COLUMN "crm_customers"."priority" IS '优先级[crm_priority]';
COMMENT ON COLUMN "crm_customers"."gender" IS '性别[crm_gender]';

-- 商机相关
COMMENT ON COLUMN "crm_opportunities"."stage" IS '商机阶段[crm_opportunity_stage]';
COMMENT ON COLUMN "crm_opportunities"."status" IS '状态[crm_opportunity_status]';

-- 合同相关
COMMENT ON COLUMN "crm_contracts"."status" IS '合同状态[crm_contract_status]';
COMMENT ON COLUMN "crm_contracts"."type" IS '合同类型[crm_contract_type]';
```

**执行脚本**：
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres
psql -h localhost -p 5432 -U postgres -d fastapiadmin -f crm-dict-type-comments.sql
```

---

### 步骤2：配置字典数据（sys_dict表）

**字典类型表**（sys_dict_type）：
```sql
INSERT INTO sys_dict_type (dict_name, dict_type, remark, status)
VALUES 
  ('客户等级', 'crm_customer_level', 'CRM客户等级字典', '0'),
  ('优先级', 'crm_priority', 'CRM通用优先级字典', '0'),
  ('性别', 'crm_gender', 'CRM性别字典', '0');
```

**字典数据表**（sys_dict_data）：
```sql
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, status)
VALUES 
  -- 客户等级
  ('crm_customer_level', 'A级-重要', 'A', 1, '0'),
  ('crm_customer_level', 'B级-一般', 'B', 2, '0'),
  ('crm_customer_level', 'C级-普通', 'C', 3, '0'),
  ('crm_customer_level', 'D级-潜在', 'D', 4, '0'),
  
  -- 优先级
  ('crm_priority', '低', 'low', 1, '0'),
  ('crm_priority', '中', 'medium', 2, '0'),
  ('crm_priority', '高', 'high', 3, '0'),
  ('crm_priority', '紧急', 'urgent', 4, '0'),
  
  -- 性别
  ('crm_gender', '未知', 'unknown', 1, '0'),
  ('crm_gender', '男', 'male', 2, '0'),
  ('crm_gender', '女', 'female', 3, '0');
```

**执行脚本**：
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres
psql -h localhost -p 5432 -U postgres -d fastapiadmin -f crm-dict-data.sql
```

---

### 步骤3：代码生成器改造（关键！）

**需要修改的文件**：
1. `backend/app/plugin/module_generator/crud.py` - 解析COMMENT中的[dict_type]
2. `backend/app/plugin/module_generator/templates/form.vue.j2` - 生成DictSelect组件
3. `backend/app/plugin/module_generator/templates/list.vue.j2` - 生成DictLabel组件

#### 3.1 后端：解析COMMENT中的字典类型

```python
# backend/app/plugin/module_generator/crud.py

import re

def parse_column_comment(comment: str) -> dict:
    """
    解析字段COMMENT，提取字典类型
    
    支持格式：
    - '客户等级[crm_customer_level]' -> {'description': '客户等级', 'dict_type': 'crm_customer_level'}
    - '优先级[crm_priority]' -> {'description': '优先级', 'dict_type': 'crm_priority'}
    """
    result = {
        'description': comment,
        'dict_type': None
    }
    
    # 匹配 [dict_type] 格式
    match = re.search(r'\[(\w+)\]$', comment)
    if match:
        result['dict_type'] = match.group(1)
        result['description'] = comment[:match.start()].strip()
    
    return result


# 在读取表结构时使用
for column in columns:
    comment_info = parse_column_comment(column['comment'])
    column['description'] = comment_info['description']
    column['dict_type'] = comment_info['dict_type']  # 新增字段
```

#### 3.2 前端模板：生成DictSelect组件

```vue
<!-- backend/app/plugin/module_generator/templates/form.vue.j2 -->

{% for field in fields %}
  {% if field.dict_type %}
  <!-- 枚举字段：使用DictSelect下拉选择器 -->
  <el-form-item label="{{ field.description }}" prop="{{ field.name }}">
    <DictSelect
      v-model="formData.{{ field.name }}"
      dict-type="{{ field.dict_type }}"
      placeholder="请选择{{ field.description }}"
    />
  </el-form-item>
  {% else %}
  <!-- 普通字段：使用输入框 -->
  <el-form-item label="{{ field.description }}" prop="{{ field.name }}">
    <el-input 
      v-model="formData.{{ field.name }}" 
      placeholder="请输入{{ field.description }}" 
    />
  </el-form-item>
  {% endif %}
{% endfor %}
```

#### 3.3 前端模板：生成DictLabel组件

```vue
<!-- backend/app/plugin/module_generator/templates/list.vue.j2 -->

{% for field in list_fields %}
  {% if field.dict_type %}
  <!-- 枚举字段：使用DictLabel标签显示 -->
  <el-table-column label="{{ field.description }}" prop="{{ field.name }}" width="120">
    <template #default="{ row }">
      <DictLabel dict-type="{{ field.dict_type }}" :value="row.{{ field.name }}" />
    </template>
  </el-table-column>
  {% else %}
  <!-- 普通字段：直接显示 -->
  <el-table-column label="{{ field.description }}" prop="{{ field.name }}" />
  {% endif %}
{% endfor %}
```

---

### 步骤4：创建前端DictSelect和DictLabel组件

#### 4.1 DictSelect组件（下拉选择器）

```vue
<!-- frontend/src/components/DictSelect/index.vue -->

<template>
  <el-select 
    v-model="modelValue" 
    :placeholder="placeholder" 
    clearable
    filterable
    style="width: 100%"
  >
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
  dictType: { 
    type: String, 
    required: true 
  },
  modelValue: { 
    type: [String, Number], 
    default: '' 
  },
  placeholder: { 
    type: String, 
    default: '请选择' 
  }
})

const emit = defineEmits(['update:modelValue'])
const modelValue = ref(props.modelValue)
const dictOptions = ref<any[]>([])

// 监听值变化
watch(modelValue, (val) => {
  emit('update:modelValue', val)
})

// 监听外部值变化
watch(() => props.modelValue, (val) => {
  modelValue.value = val
})

// 加载字典数据
onMounted(async () => {
  dictOptions.value = await getDictData(props.dictType)
})
</script>
```

#### 4.2 DictLabel组件（标签显示）

```vue
<!-- frontend/src/components/DictLabel/index.vue -->

<template>
  <el-tag :type="tagType" size="small">
    {{ label }}
  </el-tag>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { getDictLabel } from '@/utils/dict'

const props = defineProps({
  dictType: { 
    type: String, 
    required: true 
  },
  value: { 
    type: [String, Number], 
    required: true 
  }
})

const label = ref(String(props.value))

// 根据字典类型和值设置标签颜色
const tagType = computed(() => {
  const colorMap: Record<string, Record<string, string>> = {
    'crm_priority': {
      'low': '',
      'medium': '',
      'high': 'warning',
      'urgent': 'danger'
    },
    'crm_customer_status': {
      'potential': 'info',
      'interested': '',
      'active': 'success',
      'inactive': 'warning',
      'lost': 'danger'
    },
    'crm_customer_level': {
      'A': 'danger',
      'B': 'warning',
      'C': '',
      'D': 'info'
    }
  }
  
  return colorMap[props.dictType]?.[String(props.value)] || ''
})

// 加载字典标签
onMounted(async () => {
  label.value = await getDictLabel(props.dictType, props.value)
})
</script>
```

#### 4.3 字典工具函数

```typescript
// frontend/src/utils/dict.ts

import request from '@/utils/request'

const dictCache = new Map<string, any[]>()

/**
 * 获取字典数据
 */
export async function getDictData(dictType: string): Promise<any[]> {
  // 先从缓存读取
  if (dictCache.has(dictType)) {
    return dictCache.get(dictType)!
  }
  
  // 从API获取
  try {
    const { data } = await request.get(`/system/dict/data/type/${dictType}`)
    dictCache.set(dictType, data)
    return data
  } catch (error) {
    console.error(`获取字典${dictType}失败:`, error)
    return []
  }
}

/**
 * 获取字典标签
 */
export async function getDictLabel(dictType: string, value: string | number): Promise<string> {
  const dictData = await getDictData(dictType)
  const item = dictData.find((d: any) => d.dict_value === String(value))
  return item?.dict_label || String(value)
}

/**
 * 清除字典缓存（字典更新后调用）
 */
export function clearDictCache(dictType?: string) {
  if (dictType) {
    dictCache.delete(dictType)
  } else {
    dictCache.clear()
  }
}
```

---

### 步骤5：注册全局组件

```typescript
// frontend/src/main.ts

import DictSelect from '@/components/DictSelect/index.vue'
import DictLabel from '@/components/DictLabel/index.vue'

const app = createApp(App)

// 注册全局组件
app.component('DictSelect', DictSelect)
app.component('DictLabel', DictLabel)

app.mount('#app')
```

---

## 🎯 四、使用效果

### 表单页面（自动生成）

**修改前**（输入框）：
```vue
<el-form-item label="客户等级" prop="level">
  <el-input v-model="formData.level" placeholder="请输入客户等级" />
</el-form-item>
<!-- 用户不知道该填A/B/C/D还是1/2/3/4 -->
```

**修改后**（下拉选择框）：
```vue
<el-form-item label="客户等级" prop="level">
  <DictSelect
    v-model="formData.level"
    dict-type="crm_customer_level"
    placeholder="请选择客户等级"
  />
</el-form-item>
<!-- 下拉选项：A级-重要 / B级-一般 / C级-普通 / D级-潜在 -->
```

---

### 列表页面（自动生成）

**修改前**（显示原始值）：
```vue
<el-table-column label="客户等级" prop="level" />
<!-- 显示：A / B / C / D -->
```

**修改后**（显示中文标签）：
```vue
<el-table-column label="客户等级" prop="level" width="120">
  <template #default="{ row }">
    <DictLabel dict-type="crm_customer_level" :value="row.level" />
  </template>
</el-table-column>
<!-- 显示：A级-重要 / B级-一般 / C级-普通 / D级-潜在（带颜色标签） -->
```

---

## 📊 五、已配置的字典清单

### 通用字典（适用于多个表）

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_priority | 优先级 | low/medium/high/urgent |
| crm_gender | 性别 | unknown/male/female |
| crm_status | 状态 | active/inactive/deleted |

### 客户相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_customer_type | 客户类型 | enterprise/individual/government/nonprofit |
| crm_customer_source | 客户来源 | self_development/marketing/referral/online/partner/bidding |
| crm_customer_status | 客户状态 | potential/interested/active/inactive/lost |
| crm_customer_level | 客户等级 | A/B/C/D |
| crm_churn_risk | 流失风险 | high/medium/low |

### 商机相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_opportunity_stage | 商机阶段 | initial/qualification/proposal/negotiation/won/lost |
| crm_opportunity_status | 商机状态 | ... |

### 合同相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_contract_status | 合同状态 | draft/pending/signed/executing/completed/terminated |
| crm_contract_type | 合同类型 | ... |

### 订单相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_order_status | 订单状态 | pending/confirmed/producing/shipped/completed/cancelled |

### 跟进相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_followup_type | 跟进类型 | phone/email/visit/meeting/wechat |
| crm_followup_result | 跟进结果 | success/failed/pending/invalid |

### 任务相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_task_status | 任务状态 | todo/in_progress/completed/cancelled |

### 线索相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_lead_status | 线索状态 | new/contacted/qualified/unqualified/converted |

### 审批相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_approval_status | 审批状态 | pending/approved/rejected/withdrawn |

### 满意度相关字典

| 字典类型 | 字典名称 | 可选值 |
|---------|---------|--------|
| crm_satisfaction_rating | 满意度评分 | 1/2/3/4/5（非常不满意到非常满意） |

---

## 🚀 六、执行步骤总结

### 第1步：导入表结构
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend\sql\postgres
psql -h localhost -p 5432 -U postgres -d fastapiadmin -f crm-tables-only.sql
```

### 第2步：添加字典类型标注
```bash
psql -h localhost -p 5432 -U postgres -d fastapiadmin -f crm-dict-type-comments.sql
```

### 第3步：配置字典数据
```bash
psql -h localhost -p 5432 -U postgres -d fastapiadmin -f crm-dict-data.sql
```

### 第4步：改造代码生成器
- 修改 `crud.py` 解析 `[dict_type]`
- 修改 `form.vue.j2` 生成 DictSelect
- 修改 `list.vue.j2` 生成 DictLabel

### 第5步：创建前端组件
- 创建 `DictSelect/index.vue`
- 创建 `DictLabel/index.vue`
- 创建 `utils/dict.ts`
- 在 `main.ts` 中注册全局组件

### 第6步：测试验证
- 使用代码生成器生成一个模块（如crm_customers）
- 检查表单是否有下拉选择框
- 检查列表是否显示中文标签

---

## 💡 七、如果不改造代码生成器的替代方案

如果暂时不改造代码生成器，可以**手动处理**枚举字段：

### 方案A：手动修改生成的代码

生成代码后，手动将输入框改为DictSelect：

```vue
<!-- 手动修改前 -->
<el-form-item label="客户等级" prop="level">
  <el-input v-model="formData.level" />
</el-form-item>

<!-- 手动修改后 -->
<el-form-item label="客户等级" prop="level">
  <DictSelect
    v-model="formData.level"
    dict-type="crm_customer_level"
  />
</el-form-item>
```

### 方案B：在Schema中添加metadata

```python
# backend/app/plugin/module_crm/schemas/customer_schema.py

from pydantic import BaseModel, Field

class CustomerCreateSchema(BaseModel):
    level: str = Field(
        default='C',
        description='客户等级',
        json_schema_extra={
            'dict_type': 'crm_customer_level',  # 添加元数据
            'component': 'DictSelect'  # 指定组件类型
        }
    )
```

然后前端根据metadata动态渲染组件。

---

## ✅ 八、总结

### 核心价值

1. ✅ **用户体验提升** - 下拉选择框比输入框更友好
2. ✅ **数据准确性** - 避免用户输入错误值
3. ✅ **开发效率** - 代码生成器自动生成，无需手动配置
4. ✅ **维护方便** - 字典数据统一管理，修改一处全局生效

### 实施建议

**短期**（1-2天）：
- 执行步骤1-3（SQL层面）
- 手动修改关键模块的表单

**中期**（1周）：
- 改造代码生成器（步骤4）
- 创建前端组件（步骤5）

**长期**：
- 完善更多字典数据
- 优化DictLabel的颜色映射
- 添加字典缓存机制

---

**准备好开始实施了！** 🚀

---

© 2026 制造业CRM项目组 | CRM枚举类型完整解决方案
