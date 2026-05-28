<template>
  <div style="width: 100%">
    <el-select
      v-model="selectedId"
      :placeholder="placeholder"
      filterable
      clearable
      style="width: 100%"
      :loading="loading"
      @change="handleChange"
      @visible-change="handleVisibleChange"
    >
      <el-option v-for="item in options" :key="item.id" :label="item.tag_name" :value="item.id">
        <div class="tag-option">
          <span v-if="item.color" class="tag-color-dot" :style="{ backgroundColor: item.color }" />
          <span class="tag-option-label">{{ item.tag_name }}</span>
          <span v-if="item.tag_type" class="tag-option-type">{{ item.tag_type }}</span>
        </div>
      </el-option>
    </el-select>
  </div>
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
import CrmTagDefinitionsAPI from "@/api/module_crm/customers_tag_definitions";

const props = defineProps<{
  modelValue?: number | string | null;
  placeholder?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", val: number | undefined): void;
}>();

const selectedId = ref<number | undefined>(
  props.modelValue != null ? Number(props.modelValue) : undefined
);
const options = ref<{ id: number; tag_name: string; color: string; tag_type: string }[]>([]);
const loading = ref(false);

watch(
  () => props.modelValue,
  (val) => {
    selectedId.value = val != null ? Number(val) : undefined;
  }
);

async function fetchTags() {
  if (options.value.length > 0) return;
  loading.value = true;
  try {
    const res = await CrmTagDefinitionsAPI.listCrmTagDefinitions({
      page_no: 1,
      page_size: 9999,
      status: "active",
    });
    options.value = (res.data?.data?.items || [])
      .filter((t: any) => !t.is_deleted)
      .map((t: any) => ({
        id: Number(t.id),
        tag_name: t.tag_name,
        color: t.color || "",
        tag_type: t.tag_type || "",
      }));
  } finally {
    loading.value = false;
  }
}

function handleVisibleChange(visible: boolean) {
  if (visible) {
    fetchTags();
  }
}

function handleChange(val: number | undefined) {
  emit("update:modelValue", val);
}

// 初始加载
fetchTags();
</script>

<style scoped lang="scss">
.tag-option {
  display: flex;
  align-items: center;
  gap: 8px;
}

.tag-color-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  flex-shrink: 0;
}

.tag-option-label {
  flex: 1;
}

.tag-option-type {
  font-size: 12px;
  color: var(--el-text-color-secondary);
}
</style>
