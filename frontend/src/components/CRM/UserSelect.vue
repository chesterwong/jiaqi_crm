<template>
  <div style="width: 100%">
    <el-select
      v-model="selectedId"
      :placeholder="placeholder"
      filterable
      remote
      reserve-keyword
      clearable
      style="width: 100%"
      :remote-method="handleSearch"
      :loading="loading"
      @change="handleChange"
    >
      <el-option
        v-for="item in options"
        :key="item.id"
        :label="`${item.name} (${item.username})`"
        :value="item.id"
      />
    </el-select>
  </div>
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
import UserAPI from "@/api/module_system/user";

const props = defineProps<{
  modelValue?: number | null;
  placeholder?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", val: number | undefined): void;
}>();

const selectedId = ref<number | undefined>(props.modelValue ?? undefined);
const options = ref<{ id: number; name: string; username: string }[]>([]);
const loading = ref(false);

watch(
  () => props.modelValue,
  (val) => {
    selectedId.value = val ?? undefined;
  }
);

const handleSearch = async (query: string) => {
  loading.value = true;
  try {
    const res = await UserAPI.listUser({ page_no: 1, page_size: 50, name: query || undefined });
    options.value = (res.data?.data?.items || []).map((u: any) => ({
      id: u.id,
      name: u.name || u.username,
      username: u.username,
    }));
  } finally {
    loading.value = false;
  }
};

const handleChange = (val: number | undefined) => {
  emit("update:modelValue", val);
};

// 初始加载
handleSearch("");
</script>
