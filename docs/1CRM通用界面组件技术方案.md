# CRM 通用界面组件技术方案

> 以客户模块为蓝本，提炼出的创建 / 编辑 / 详情 / 删除全生命周期通用组件体系

---

## 一、架构全景

```
┌──────────────────────────────────────────────────────┐
│                    index.vue (页面入口)                │
│  ┌────────────────┐  ┌─────────────────────────────┐ │
│  │  列表模式       │  │  表单模式 (创建/编辑/详情)    │ │
│  │  PageContent    │  │  ┌───────────────────────┐  │ │
│  │  PageSearch     │  │  │   FormTabs (容器)     │  │ │
│  │  EnhancedDialog │  │  │  ├─ TabBasicInfo      │  │ │
│  └────────────────┘  │  │  ├─ TabContactInfo    │  │ │
│                       │  │  ├─ TabBusinessInfo   │  │ │
│                       │  │  ├─ TabHealthInfo     │  │ │
│                       │  │  ├─ TabFinanceInfo    │  │ │
│                       │  │  └─ ...               │  │ │
│                       │  └───────────────────────┘  │ │
│                       │  ┌───────────────────────┐  │ │
│                       │  │ EntityOperationLog    │  │ │
│                       │  │ (详情页操作日志时间线) │  │ │
│                       │  └───────────────────────┘  │ │
│                       └─────────────────────────────┘ │
└──────────────────────────────────────────────────────┘

共享组件层 (src/components/)      共享逻辑层 (src/composables/)
┌──────────────────────┐       ┌─────────────────────────┐
│ FormTabs.vue         │       │ useDictOptions.ts       │
│ EntityOperationLog   │       │ useRegionCascader.ts    │
└──────────────────────┘       └─────────────────────────┘
```

---

## 二、核心组件详解

### 2.1 FormTabs —— 多页签表单容器

**文件路径**: `src/components/FormTabs/FormTabs.vue`

**设计理念**: 将"步骤条 + 多Tab + 表单验证 + 导航守卫"打包为纯容器，不包含任何业务字段。业务模块通过 props 注入 Tab 配置，通过 slots 注入每个 Tab 的表单内容。

#### Props 接口

```typescript
interface TabConfig {
  name: string;          // Tab 唯一标识 (用于 slot 名称匹配)
  label: string;         // 展示文本
  stepTitle?: string;    // 步骤条标题 (不传则只显示 Tab，无步骤条)
}

interface TabStatus {
  [tabName: string]: "normal" | "error" | "success";
}

interface FormTabsProps {
  activeTab: string;                       // 当前激活 Tab (v-model)
  tabs: TabConfig[];                       // Tab 配置列表
  tabStatuses: TabStatus;                  // 每个 Tab 的校验状态
  mode?: "create" | "edit" | "view";       // 模式 (控制只读行为)
  showStepper?: boolean;                   // 是否显示步骤条
  transitionName?: string;                 // 切换动画名称
}
```

#### Emits

```typescript
interface FormTabsEmits {
  "update:activeTab": (tabName: string) => void;
  "before-tab-change": (targetTab: string) => Promise<boolean> | boolean;
  "previous": () => void;
  "next": () => void;
}
```

#### Slots

```vue
<!-- 每个 Tab 内容通过具名 slot 注入 -->
<template #tab-basicInfo>
  <!-- 基本信息表单 -->
</template>
<template #tab-contactInfo>
  <!-- 联系人表单 -->
</template>

<!-- 底部按钮扩展区 -->
<template #footer-extra>
  <el-button>自定义按钮</el-button>
</template>
```

#### Expose

```typescript
interface FormTabsExpose {
  scrollToError: () => void;  // 自动滚动到第一个错误 Tab
}
```

#### 关键实现细节

**1. Tab 切换守卫 (before-leave Promise 模式)**:

```typescript
const handleBeforeLeave = async (targetName: string): Promise<boolean> => {
  // 仅在创建/编辑模式拦截
  if (props.mode === "view") return true;
  
  // 通过 emit 让父组件决定是否允许切换
  const result = await emit("before-tab-change", targetName);
  
  if (result === false) {
    // 校验失败 → 标记错误 + 滚动闪烁
    tabStatuses[targetName] = "error";
    errorTab.value = targetName;
  }
  return result;
};
```

**2. 错误闪烁动画**:

```css
@keyframes tab-flash-error {
  0%, 100% { color: var(--el-color-danger); }
  50% { color: inherit; }
}
.tab-flash-error {
  animation: tab-flash-error 0.6s ease-in-out 2;
}
```

**3. 步骤条联动**: 点击步骤自动切换到对应 Tab，Tab 切换自动同步步骤。

#### 三种使用模式

**创建模式** —— 步骤条 + 表单:
```vue
<FormTabs
  v-model:activeTab="activeTab"
  :tabs="createTabs"
  :tab-statuses="tabStatuses"
  mode="create"
  show-stepper
  @before-tab-change="validateTab"
  @next="handleNext"
  @previous="handlePrevious"
>
  <template #tab-{name}>...</template>
  <template #footer-extra>
    <el-button @click="handleSaveDraft">暂存草稿</el-button>
  </template>
</FormTabs>
```

**编辑模式** —— Tab 切换 (回填数据):
```vue
<FormTabs
  v-model:activeTab="activeTab"
  :tabs="editTabs"
  :tab-statuses="tabStatuses"
  mode="edit"
  @before-tab-change="validateTab"
/>
```

**详情模式** —— 只读 + 操作日志:
```vue
<FormTabs
  v-model:activeTab="activeTab"
  :tabs="detailTabs"
  mode="view"
>
  <template #tab-basic-info>
    <el-descriptions :model="formData" />
  </template>
</FormTabs>

<!-- 操作日志独立于 FormTabs 之外 -->
<EntityOperationLog
  :entity-id="customerId"
  :fetch-logs="CrmCustomersAPI.getCustomerLogs"
  :field-label-map="CRM_CUSTOMER_LABEL_MAP"
/>
```

---

### 2.2 EntityOperationLog —— 通用操作日志时间线

**文件路径**: `src/components/EntityOperationLog/EntityOperationLog.vue`

**泛化策略**: 将硬编码的 `customerId` → `entityId`、`CrmCustomersAPI.getLogs()` → `props.fetchLogs(entityId)`、本地常量 `FIELD_LABEL_MAP` → prop 注入。

#### Props 接口

```typescript
interface EntityOperationLogProps {
  entityId?: string | number;                          // 实体 ID
  fetchLogs: (entityId: string | number) => Promise<{  // 日志获取函数
    data: { data: { items: LogItem[] } }
  }>;
  fieldLabelMap?: Record<string, string>;              // 字段中文名映射
  ignoreKeys?: string[];                               // 忽略的字段列表
}
```

#### 泛化前后对比

| 元素 | 泛化前 (TabOperationLog) | 泛化后 (EntityOperationLog) |
|------|------------------------|---------------------------|
| 实体 ID | `customerId` (硬编码) | `entityId` (prop 注入) |
| 数据源 | `CrmCustomersAPI.getCustomerLogs()` | `props.fetchLogs(entityId)` |
| 字段映射 | 内部常量 `FIELD_LABEL_MAP` | `props.fieldLabelMap` |
| 忽略字段 | 内部硬编码 Set | `computed(() => new Set(props.ignoreKeys))` |

#### 使用范例

```vue
<!-- 客户模块 -->
<EntityOperationLog
  :entity-id="customerId"
  :fetch-logs="CrmCustomersAPI.getCustomerLogs"
  :field-label-map="{
    customer_name: '客户名称',
    credit_code: '统一社会信用代码',
    // ...47 个字段
  }"
  :ignore-keys="['id', 'created_at', 'updated_at', 'is_deleted']"
/>

<!-- 合同模块 (复用) -->
<EntityOperationLog
  :entity-id="contractId"
  :fetch-logs="ContractAPI.getContractLogs"
  :field-label-map="CONTRACT_LABEL_MAP"
/>
```

---

### 2.3 useDictOptions —— 字典下拉加载 Composable

**文件路径**: `src/composables/useDictOptions.ts`

```typescript
/**
 * 字典下拉数据加载 composable
 * 
 * @param dictType - 字典类型编码 (如 "contract_type", "customer_level")
 * @returns { options, loaded, loading, load, ensureLoaded, getLabel }
 * 
 * 使用范例:
 *   const { options, ensureLoaded } = useDictOptions("customer_level");
 *   await ensureLoaded();  // 确保字典已加载
 */
```

**设计要点**:
- **响应式缓存**: 同一 `dictType` 全局只请求一次，多个组件共享
- **ensureLoaded 模式**: 组件按需调用，避免不必要的网络请求
- **getLabel**: 根据 value 获取中文名，用于详情页展示

---

### 2.4 useRegionCascader —— 省市区三级级联

**文件路径**: `src/composables/useRegionCascader.ts`

提供三组导出:

| 导出 | 类型 | 用途 |
|------|------|------|
| `REGION_TREE` | `RegionNode[]` | 静态省市区树 (含全国主要城市) |
| `regionLazyLoad` | `(node, resolve) => void` | Element Plus Cascader 懒加载回调 |
| `buildRegionPath` | `(codes: string[]) => string` | 编码数组 → 路径字符串 ("广东省/深圳市/南山区") |

---

## 三、通用 CRUD 界面集成模板

### 3.1 新增页面

```vue
<template>
  <div class="create-page">
    <el-page-header @back="router.back()">
      <template #content>新增客户</template>
    </el-page-header>

    <FormTabs
      v-model:activeTab="activeTab"
      :tabs="tabs"
      :tab-statuses="tabStatuses"
      mode="create"
      show-stepper
      @before-tab-change="handleBeforeTabChange"
    >
      <template #tab-basicInfo>
        <TabBasicInfo v-model="formData" ref="basicRef" />
      </template>
      <template #tab-contactInfo>
        <TabContactInfo v-model="formData" ref="contactRef" />
      </template>

      <template #footer-extra>
        <el-button @click="handleSaveDraft" :loading="saving">暂存</el-button>
        <el-button type="primary" @click="handleSubmit" :loading="saving">
          提交
        </el-button>
      </template>
    </FormTabs>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from "vue";
import { useRouter } from "vue-router";
import { ElMessage } from "element-plus";
import FormTabs from "@/components/FormTabs/FormTabs.vue";

const router = useRouter();
const activeTab = ref("basicInfo");
const saving = ref(false);
const formData = reactive({});

// Tab 校验状态 (与步骤条联动)
const tabStatuses = reactive({
  basicInfo: "normal",
  contactInfo: "normal",
});

const tabs = [
  { name: "basicInfo", label: "基本信息", stepTitle: "填写基本信息" },
  { name: "contactInfo", label: "联系人信息", stepTitle: "添加联系人" },
];

const basicRef = ref();
const contactRef = ref();

// Tab 切换前校验
const handleBeforeTabChange = async (targetTab: string) => {
  const currentRef = activeTab.value === "basicInfo" ? basicRef : contactRef;
  if (currentRef.value?.validate) {
    try {
      await currentRef.value.validate();
      tabStatuses[activeTab.value] = "success";
      return true;
    } catch {
      tabStatuses[activeTab.value] = "error";
      return false;
    }
  }
  return true;
};

const handleSubmit = async () => {
  saving.value = true;
  try {
    // 最后一步校验所有 Tab
    for (const tab of tabs) {
      const ref = tab.name === "basicInfo" ? basicRef : contactRef;
      if (ref.value?.validate) {
        await ref.value.validate();
        tabStatuses[tab.name] = "success";
      }
    }
    await CrmCustomersAPI.create(formData);
    ElMessage.success("创建成功");
    router.back();
  } catch {
    ElMessage.error("请检查表单填写");
  } finally {
    saving.value = false;
  }
};
</script>
```

### 3.2 编辑页面

```vue
<template>
  <div class="edit-page">
    <FormTabs
      v-model:activeTab="activeTab"
      :tabs="tabs"
      :tab-statuses="tabStatuses"
      mode="edit"
      @before-tab-change="handleBeforeTabChange"
    >
      <template #tab-basicInfo>
        <TabBasicInfo v-model="formData" ref="basicRef" />
      </template>
      <!-- ... -->

      <template #footer-extra>
        <el-button type="primary" @click="handleUpdate" :loading="saving">
          保存
        </el-button>
      </template>
    </FormTabs>
  </div>
</template>

<script setup lang="ts">
// 核心差异: 加载详情回填表单
onMounted(async () => {
  const { data } = await CrmCustomersAPI.getDetail(route.params.id);
  Object.assign(formData, data);
});

const handleUpdate = async () => {
  await CrmCustomersAPI.update(route.params.id, formData);
};
</script>
```

### 3.3 详情页面

```vue
<template>
  <div class="detail-page">
    <FormTabs
      v-model:activeTab="activeTab"
      :tabs="tabs"
      mode="view"
    >
      <template #tab-basicInfo>
        <el-descriptions :column="2" border>
          <el-descriptions-item label="客户名称">
            {{ formData.customer_name }}
          </el-descriptions-item>
          <!-- ... -->
        </el-descriptions>
      </template>
    </FormTabs>

    <!-- 操作日志 (独立于 FormTabs) -->
    <el-card header="操作记录" style="margin-top: 16px">
      <EntityOperationLog
        :entity-id="entityId"
        :fetch-logs="api.getLogs"
        :field-label-map="LABEL_MAP"
      />
    </el-card>
  </div>
</template>
```

### 3.4 列表页 (集成删除)

```vue
<template>
  <div class="list-page">
    <PageSearch :model="searchForm" @search="handleSearch" />

    <PageContent>
      <template #toolbar>
        <el-button type="primary" @click="handleCreate">新增</el-button>
        <el-button @click="handleBatchDelete" :disabled="!selected.length">
          批量删除
        </el-button>
      </template>

      <el-table :data="tableData" @selection-change="handleSelection">
        <!-- ... -->
        <el-table-column label="操作" fixed="right" width="180">
          <template #default="{ row }">
            <el-button link type="primary" @click="handleView(row)">
              详情
            </el-button>
            <el-button link type="primary" @click="handleEdit(row)">
              编辑
            </el-button>
            <el-popconfirm title="确认删除?" @confirm="handleDelete(row.id)">
              <template #reference>
                <el-button link type="danger">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </PageContent>
  </div>
</template>

<script setup lang="ts">
const handleDelete = async (id: number) => {
  await api.delete(id);
  ElMessage.success("删除成功");
  handleSearch();
};

const handleBatchDelete = async () => {
  await api.batchDelete(selected.value.map((r) => r.id));
  ElMessage.success(`成功删除 ${selected.value.length} 条`);
  handleSearch();
};
</script>
```

---

## 四、抽离方法论

### 4.1 识别标准

判断一个组件是否应该抽离为共享组件，按以下三维度评分:

| 维度 | 权重 | 判断标准 |
|------|------|---------|
| **复用频率** | 40% | ≥3 个模块需要相同功能 |
| **泛化难度** | 30% | 是否可通过 Props/Slots 消除业务耦合 |
| **维护成本** | 30% | 集中维护 vs 分散修改的总成本 |

### 4.2 抽离三步法

```
第1步: 识别硬编码 → 替换为 Props
─────────────────────────────────
❌ customerId                → ✅ entityId (prop)
❌ CrmCustomersAPI.xxx()     → ✅ props.fetchData()
❌ 内部常量 LABEL_MAP        → ✅ props.fieldLabelMap()

第2步: 识别固定结构 → 替换为 Slots
────────────────────────────────────
❌ <TabBasicInfo /> 写死     → ✅ <slot :name="tab-{name}" />

第3步: 识别重复逻辑 → 提取 Composable
──────────────────────────────────────
❌ 每个组件内重复写 loadDict()  → ✅ useDictOptions()
❌ 每个组件内重复写 regionLoad() → ✅ useRegionCascader()
```

### 4.3 接口设计原则

```
Props:  配置项 (改变组件行为)     → 对外暴露的 API
Emits:  事件回调 (通知父组件)     → 单向数据流反馈
Slots:  内容注入 (业务定制)       → 最大灵活性
Expose: 方法暴露 (父组件调用)     → 命令式操作
```

---

## 五、新模块接入清单

以"合同管理"为例，从零接入共享组件:

### Step 1: 创建 Tab 业务组件 (每个 Tab 一个文件)

```
src/views/module_crm_contracts/
└── components/
    ├── TabContractBasic.vue    # 合同基本信息
    ├── TabContractItems.vue    # 合同明细
    └── TabPaymentPlan.vue      # 收款计划
```

### Step 2: 在 index.vue 中组装

```vue
<script setup lang="ts">
import FormTabs from "@/components/FormTabs/FormTabs.vue";
import EntityOperationLog from "@/components/EntityOperationLog/EntityOperationLog.vue";
import { useDictOptions } from "@/composables/useDictOptions";

// 字典复用
const { options: contractTypes, ensureLoaded: loadContractTypes } =
  useDictOptions("contract_type");

// 字段映射 (供操作日志使用)
const CONTRACT_LABEL_MAP: Record<string, string> = {
  contract_no: "合同编号",
  contract_name: "合同名称",
  contract_amount: "合同金额",
  // ...
};
</script>
```

### Step 3: 三种模式切换

```typescript
// 同一组件，通过 mode 切换行为
const currentMode = computed(() => {
  if (route.name === "ContractCreate") return "create";
  if (route.name === "ContractEdit") return "edit";
  return "view";
});

// Tab 配置也按模式调整
const tabs = computed<TabConfig[]>(() => {
  const base = [
    { name: "basic", label: "合同信息" },
    { name: "items", label: "合同明细" },
    { name: "payment", label: "收款计划" },
  ];
  // 详情模式追加操作日志 (作为独立组件放在 FormTabs 外部)
  return base;
});
```

### Step 4: 编译器验证

```bash
cd frontend && npx vue-tsc --noEmit
```

---

## 六、设计原则总结

| 原则 | 体现 |
|------|------|
| **Props 驱动** | 组件行为完全由外部 Props 控制，无内部硬编码 |
| **Slots 扩展** | 内容通过插槽注入，容器不关心子组件形态 |
| **Composable 复用** | 状态逻辑提取为独立函数，跨组件共享 |
| **单一职责** | FormTabs 只管容器布局，Tab 组件只管业务表单 |
| **渐进增强** | mode="view" 自动降级为只读，无需重复代码 |
| **零副作用** | 共享组件不发起全局请求 (字典除外，有缓存) |

---

## 七、组件全景表

| 组件 | 层级 | 复用范围 | 状态 |
|------|------|---------|------|
| `FormTabs.vue` | 容器 | 全站所有多 Tab 表单 | ✅ 已抽离 |
| `EntityOperationLog.vue` | 展示 | 全站所有操作日志 | ✅ 已抽离 |
| `useDictOptions.ts` | 逻辑 | 全站所有字典下拉 | ✅ 已抽离 |
| `useRegionCascader.ts` | 逻辑 | 全站省市区选择 | ✅ 已抽离 |
| `TabBasicInfo.vue` | 业务 | 客户模块专用 | 保留原位 |
| `TabContactInfo.vue` | 业务 | 客户模块专用 | 保留原位 |
| `TabBusinessInfo.vue` | 业务 | 客户模块专用 | 保留原位 |
| `TabHealthInfo.vue` | 业务 | 客户模块专用 | 保留原位 |
| `TabFinanceInfo.vue` | 业务 | 客户模块专用 | 保留原位 |
| `CascaderData.ts` | 业务 | 行业级联 (客户专用) | 保留原位 |

---

## 八、经验教训

1. **Props 优先于复制**: 发现 2 个模块需要相同功能时，立即考虑 Props 化，不要等到第 3 个
2. **computed 比静态 Set 更安全**: `ignoreKeySet` 用 `computed(() => new Set(props.ignoreKeys))` 而非 `const skipKeys = new Set(props.ignoreKeys)` —— 前者 props 变化时自动重算
3. **Emits 声明 vs 运行时 emit**: `defineEmits<{...}>()` 提供编译期类型检查，优于裸 `emit("event")`
4. **Dict 缓存去重**: 同一 dictType 全局缓存，避免 N 个组件并发请求同一字典
5. **components.d.ts 自动生成**: IDE 扫描 .vue 文件自动生成类型声明，删除源文件后需同步删除类型声明，否则编译报错
