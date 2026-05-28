<template>
  <div style="width: 100%">
    <el-tree-select
      v-model="selectedId"
      :data="treeData"
      :props="treeSelectProps"
      :placeholder="placeholder"
      clearable
      filterable
      style="width: 100%"
      @change="handleChange"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import DeptAPI from "@/api/module_system/dept";

const props = defineProps<{
  modelValue?: number | null;
  placeholder?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", val: number | undefined): void;
}>();

const selectedId = ref<number | undefined>(props.modelValue ?? undefined);
const treeData = ref<any[]>([]);
const treeSelectProps = { value: "id", label: "name", children: "children" };

watch(
  () => props.modelValue,
  (val) => {
    selectedId.value = val ?? undefined;
  }
);

const handleChange = (val: number | undefined) => {
  emit("update:modelValue", val);
};

const loadDepts = async () => {
  try {
    const res = await DeptAPI.listDept();
    treeData.value = ((res.data as any)?.data || []).map(normalizeDept);
  } catch {
    treeData.value = [];
  }
};

function normalizeDept(d: any): any {
  return {
    id: d.id,
    name: d.name,
    children: d.children ? d.children.map(normalizeDept) : [],
  };
}

onMounted(() => {
  loadDepts();
});
</script>
