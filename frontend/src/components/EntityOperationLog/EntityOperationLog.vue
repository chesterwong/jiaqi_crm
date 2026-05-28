<template>
  <div class="entity-operation-log">
    <div v-if="loading" class="log-loading">
      <el-skeleton :rows="3" animated />
    </div>

    <template v-else-if="logItems.length === 0">
      <el-empty :image-size="60" description="暂无操作记录" />
    </template>

    <template v-else>
      <el-timeline>
        <el-timeline-item
          v-for="(item, index) in logItems"
          :key="item.id || index"
          :timestamp="item.created_time || item.operated_at"
          placement="top"
          :type="timelineType(item.operation_type)"
          :hollow="true"
        >
          <div class="log-item-header">
            <span class="log-operator">{{ item.operator_name || item.operator }}</span>
            <el-tag :type="operationTagType(item.operation_type)" size="small">
              {{ operationLabel(item.operation_type) }}
            </el-tag>
          </div>

          <div v-if="item.changes && item.changes.length > 0" class="log-item-changes">
            <el-collapse accordion>
              <el-collapse-item title="查看详细变更" name="details">
                <el-table :data="item.changes" size="small" border stripe>
                  <el-table-column label="字段" prop="field" min-width="120" />
                  <el-table-column label="旧值" min-width="120">
                    <template #default="{ row }">
                      <span class="log-value-old">
                        {{ formatFieldValue(row.field, row.old_value) }}
                      </span>
                    </template>
                  </el-table-column>
                  <el-table-column label="新值" min-width="120">
                    <template #default="{ row }">
                      <span class="log-value-new">
                        {{ formatFieldValue(row.field, row.new_value) }}
                      </span>
                    </template>
                  </el-table-column>
                </el-table>
              </el-collapse-item>
            </el-collapse>
          </div>

          <div v-else-if="item.summary" class="log-item-summary">
            {{ item.summary }}
          </div>

          <div v-if="item.remark" class="log-item-remark">
            {{ item.remark }}
          </div>
        </el-timeline-item>
      </el-timeline>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from "vue";

// ── 类型定义 ──

export interface LogChangeItem {
  field: string;
  old_value: string | null;
  new_value: string | null;
}

export interface LogItem {
  id?: number | string;
  /** 操作人名称 */
  operator_name?: string;
  operator?: string;
  /** 操作时间 */
  created_time?: string;
  operated_at?: string;
  /** 操作类型: create / update / delete / merge */
  operation_type: string;
  /** 变更摘要 */
  summary?: string;
  /** 备注 */
  remark?: string;
  /** 字段级变更列表 */
  changes?: LogChangeItem[];
}

export interface EntityOperationLogProps {
  /** 实体 ID */
  entityId?: string | number;
  /** 日志获取函数 */
  fetchLogs: (entityId: string | number) => Promise<{
    data?: { data?: { items?: LogItem[] } };
  }>;
  /** 字段中文名映射 */
  fieldLabelMap?: Record<string, string>;
  /** 忽略的字段列表 */
  ignoreKeys?: string[];
  /** 是否自动加载 */
  autoLoad?: boolean;
}

// ── Props & Emits ──

const props = withDefaults(defineProps<EntityOperationLogProps>(), {
  entityId: undefined,
  fieldLabelMap: () => ({}),
  ignoreKeys: () => [],
  autoLoad: true,
});

// ── 状态 ──

const loading = ref(false);
const logItems = ref<LogItem[]>([]);

// ── 忽略字段集合 ──

const ignoreKeySet = computed(() => new Set(props.ignoreKeys));

// ── 加载日志 ──

async function load() {
  if (!props.entityId) return;

  loading.value = true;
  try {
    const response = await props.fetchLogs(props.entityId);
    const rawItems = response?.data?.data?.items || [];
    logItems.value = rawItems.filter(Boolean);
  } catch (error) {
    console.error("加载操作日志失败", error);
    logItems.value = [];
  } finally {
    loading.value = false;
  }
}

watch(
  () => props.entityId,
  (newId) => {
    if (newId && props.autoLoad) {
      load();
    }
  },
  { immediate: true }
);

// ── 工具函数 ──

function operationLabel(type: string): string {
  const map: Record<string, string> = {
    create: "创建",
    update: "修改",
    delete: "删除",
    merge: "合并",
    import: "导入",
    export: "导出",
  };
  return map[type] || type;
}

function operationTagType(type: string): "success" | "warning" | "danger" | "info" {
  const map: Record<string, "success" | "warning" | "danger" | "info"> = {
    create: "success",
    update: "warning",
    delete: "danger",
    merge: "info",
  };
  return map[type] || "info";
}

function timelineType(type: string): "primary" | "success" | "warning" | "danger" | "info" {
  const map: Record<string, "primary" | "success" | "warning" | "danger" | "info"> = {
    create: "success",
    update: "warning",
    delete: "danger",
    merge: "primary",
  };
  return map[type] || "info";
}

function formatFieldValue(field: string, value: string | null | undefined): string {
  if (value == null || value === "") return "-";

  // 如果 fieldLabelMap 中有该字段的映射，先取值
  const label = props.fieldLabelMap[field] || field;

  // 简单处理字典值（如 "0" / "1" 显示为 "启用"/"停用"）
  if (field === "status") {
    return value === "0" ? "启用" : "停用";
  }
  if (field === "is_deleted") {
    return value === "true" || value === "1" ? "已删除" : "正常";
  }

  return value;
}

defineExpose({
  load,
  logItems,
});
</script>

<style scoped lang="scss">
.entity-operation-log {
  padding: 4px 0;
}

.log-loading {
  padding: 20px;
}

.log-item-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 6px;
}

.log-operator {
  font-weight: 600;
  font-size: 14px;
}

.log-item-summary {
  font-size: 13px;
  color: var(--el-text-color-secondary);
  line-height: 1.5;
}

.log-item-remark {
  margin-top: 4px;
  font-size: 12px;
  color: var(--el-text-color-placeholder);
}

.log-item-changes {
  margin-top: 8px;

  :deep(.el-collapse-item__header) {
    font-size: 13px;
  }
}

.log-value-old {
  color: var(--el-color-danger);
  text-decoration: line-through;
}

.log-value-new {
  color: var(--el-color-success);
  font-weight: 500;
}
</style>
