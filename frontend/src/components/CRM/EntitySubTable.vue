<template>
  <div class="entity-sub-table">
    <div class="entity-sub-table__header">
      <span class="entity-sub-table__title">{{ title }}</span>
      <el-button size="small" :icon="RefreshRight" circle :loading="loading" @click="fetchData" />
    </div>
    <el-table
      v-loading="loading"
      :data="tableData"
      border
      stripe
      size="small"
      max-height="400"
      empty-text="暂无数据"
    >
      <template v-for="col in displayColumns" :key="col.prop">
        <el-table-column
          :prop="col.prop"
          :label="col.label"
          :min-width="col.minWidth || 120"
          :show-overflow-tooltip="true"
          :formatter="col.formatter"
        />
      </template>
    </el-table>
    <div v-if="total > 0" class="entity-sub-table__pagination">
      <el-pagination
        v-model:current-page="currentPage"
        v-model:page-size="pageSize"
        :total="total"
        :page-sizes="[5, 10, 20]"
        layout="total, sizes, prev, pager, next"
        small
        @change="fetchData"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted, computed } from "vue";
import { RefreshRight } from "@element-plus/icons-vue";

export interface SubTableColumn {
  prop: string;
  label: string;
  minWidth?: number;
  formatter?: (row: any, column: any, cellValue: any, index: number) => string;
}

const props = defineProps<{
  /** 表头标题 */
  title: string;
  /** 关联的客户ID */
  customerId?: number;
  /** 列表API方法 */
  fetchApi: (params: Record<string, any>) => Promise<any>;
  /** 显示的列配置 */
  columns: SubTableColumn[];
  /** 每页条数 */
  defaultPageSize?: number;
}>();

const loading = ref(false);
const tableData = ref<any[]>([]);
const total = ref(0);
const currentPage = ref(1);
const pageSize = ref(props.defaultPageSize || 10);

const displayColumns = computed(() => props.columns);

async function fetchData() {
  if (!props.customerId) {
    tableData.value = [];
    total.value = 0;
    return;
  }
  loading.value = true;
  try {
    const res = await props.fetchApi({
      customer_id: props.customerId,
      page: currentPage.value,
      page_size: pageSize.value,
    });
    if (res?.data?.code === 0) {
      tableData.value = res.data.data?.items ?? [];
      total.value = res.data.data?.total ?? 0;
    } else {
      tableData.value = res.data?.data?.items ?? [];
      total.value = res.data?.data?.total ?? 0;
    }
  } catch {
    tableData.value = [];
    total.value = 0;
  } finally {
    loading.value = false;
  }
}

watch(
  () => props.customerId,
  (newId) => {
    if (newId) {
      currentPage.value = 1;
      fetchData();
    }
  },
  { immediate: false }
);

onMounted(() => {
  if (props.customerId) {
    fetchData();
  }
});
</script>

<style scoped lang="scss">
.entity-sub-table {
  padding: 4px 0;

  &__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 12px;
  }

  &__title {
    font-size: 14px;
    font-weight: 600;
    color: #303133;
  }

  &__pagination {
    display: flex;
    justify-content: flex-end;
    margin-top: 12px;
  }
}
</style>
