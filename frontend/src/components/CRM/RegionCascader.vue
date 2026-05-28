<template>
  <div style="width: 100%">
    <el-cascader
      v-model="selectedPath"
      :options="regionOptions"
      :props="{
        value: 'code',
        label: 'name',
        children: 'children',
        expandTrigger: 'hover',
      }"
      :placeholder="placeholder"
      clearable
      filterable
      style="width: 100%"
      @change="handleChange"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
import { CHINA_REGIONS } from "./regionData";

const props = defineProps<{
  modelValue?: { province?: string; city?: string; district?: string } | null;
  placeholder?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", val: { province: string; city: string; district: string }): void;
}>();

const regionOptions = ref(CHINA_REGIONS);
const selectedPath = ref<string[]>([]);

// 根据 props 反推 cascader path
watch(
  () => props.modelValue,
  (val) => {
    if (val?.province) {
      const path = buildPath(val.province, val.city, val.district);
      selectedPath.value = path;
    } else {
      selectedPath.value = [];
    }
  },
  { immediate: true }
);

function buildPath(province: string, city?: string, district?: string): string[] {
  for (const p of CHINA_REGIONS) {
    if (p.name === province) {
      if (!city) return [p.code];
      for (const c of p.children || []) {
        if (c.name === city) {
          if (!district) return [p.code, c.code];
          for (const d of c.children || []) {
            if (d.name === district) return [p.code, c.code, d.code];
          }
          return [p.code, c.code];
        }
      }
      return [p.code];
    }
  }
  return [];
}

function findNames(codes: string[]): { province: string; city: string; district: string } {
  const result = { province: "", city: "", district: "" };
  if (!codes.length) return result;
  for (const p of CHINA_REGIONS) {
    if (p.code === codes[0]) {
      result.province = p.name;
      if (codes.length >= 2) {
        for (const c of p.children || []) {
          if (c.code === codes[1]) {
            result.city = c.name;
            if (codes.length >= 3) {
              for (const d of c.children || []) {
                if (d.code === codes[2]) {
                  result.district = d.name;
                }
              }
            }
            break;
          }
        }
      }
      break;
    }
  }
  return result;
}

const handleChange = (val: any) => {
  const path: string[] = Array.isArray(val) ? val : [];
  if (path.length > 0) {
    const names = findNames(path);
    emit("update:modelValue", names);
  } else {
    emit("update:modelValue", { province: "", city: "", district: "" });
  }
};
</script>
