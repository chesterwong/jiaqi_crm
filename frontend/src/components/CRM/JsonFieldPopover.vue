<template>
  <el-popover placement="right" :width="320" trigger="click" :disabled="!hasData">
    <template #reference>
      <el-button link size="small" type="primary" :disabled="!hasData">
        {{ hasData ? "查看" : "-" }}
      </el-button>
    </template>
    <div class="json-popover-content">
      <template v-if="parsedData && Object.keys(parsedData).length">
        <div v-for="(val, key) in parsedData" :key="key" class="json-popover-item">
          <span class="json-popover-key">{{ formatKey(String(key)) }}</span>
          <span class="json-popover-value">
            <template v-if="typeof val === 'object' && val !== null">
              {{ JSON.stringify(val) }}
            </template>
            <template v-else>
              {{ formatValue(val) }}
            </template>
          </span>
        </div>
      </template>
      <div v-else class="json-popover-empty">
        {{ rawText || "无数据" }}
      </div>
    </div>
  </el-popover>
</template>

<script setup lang="ts">
import { computed } from "vue";

const props = defineProps<{
  value?: string | null;
  fieldLabel?: string;
}>();

const rawText = computed(() => {
  if (!props.value) return "";
  return props.value;
});

const hasData = computed(() => {
  return !!props.value && props.value.trim().length > 0;
});

const parsedData = computed<Record<string, unknown> | null>(() => {
  if (!props.value) return null;
  try {
    const parsed = JSON.parse(props.value);
    if (typeof parsed === "object" && parsed !== null && !Array.isArray(parsed)) {
      return parsed as Record<string, unknown>;
    }
    if (typeof parsed === "object" && parsed !== null) {
      return { value: parsed };
    }
    return { value: parsed };
  } catch {
    return null;
  }
});

function formatKey(key: string): string {
  // 驼峰转中文风格分隔
  return key
    .replace(/_/g, " ")
    .replace(/([a-z])([A-Z])/g, "$1 $2")
    .replace(/^\w/, (c) => c.toUpperCase());
}

function formatValue(val: unknown): string {
  if (val === null || val === undefined) return "-";
  if (typeof val === "boolean") return val ? "是" : "否";
  if (typeof val === "number") {
    // 百分比值
    if (String(val).includes(".") && val < 1) return `${(Number(val) * 100).toFixed(1)}%`;
    return String(val);
  }
  return String(val);
}
</script>

<style scoped lang="scss">
.json-popover-content {
  max-height: 360px;
  overflow-y: auto;
}

.json-popover-item {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 8px;
  padding: 6px 0;
  border-bottom: 1px solid var(--el-border-color-lighter);

  &:last-child {
    border-bottom: none;
  }
}

.json-popover-key {
  font-weight: 600;
  font-size: 13px;
  color: var(--el-text-color-primary);
  flex-shrink: 0;
}

.json-popover-value {
  font-size: 13px;
  color: var(--el-text-color-regular);
  text-align: right;
  word-break: break-all;
}

.json-popover-empty {
  color: var(--el-text-color-placeholder);
  font-size: 13px;
  text-align: center;
  padding: 8px 0;
}
</style>
