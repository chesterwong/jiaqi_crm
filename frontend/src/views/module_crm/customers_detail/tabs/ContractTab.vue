<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_contracts 表，待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="合同类型">
          <el-select
            v-model="queryParams.contract_type"
            placeholder="全部"
            clearable
            style="width: 140px"
          >
            <el-option label="框架合同" value="框架合同" />
            <el-option label="销售合同" value="销售合同" />
            <el-option label="服务合同" value="服务合同" />
            <el-option label="年度合同" value="年度合同" />
          </el-select>
        </el-form-item>
        <el-form-item label="审批状态">
          <el-select
            v-model="queryParams.approval_status"
            placeholder="全部"
            clearable
            style="width: 120px"
          >
            <el-option label="已审批" value="已审批" />
            <el-option label="审批中" value="审批中" />
            <el-option label="草稿" value="草稿" />
          </el-select>
        </el-form-item>
        <el-form-item label="签约日期">
          <el-date-picker
            v-model="queryParams.date_range"
            type="daterange"
            range-separator="至"
            start-placeholder="开始"
            end-placeholder="结束"
            style="width: 260px"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">查询</el-button>
          <el-button @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <el-card shadow="never">
      <el-table :data="filteredData" border stripe height="calc(100vh - 400px)" style="width: 100%">
        <template #empty>
          <el-empty :image-size="60" description="暂无数据" />
        </template>
        <el-table-column type="index" label="序号" width="55" align="center" />
        <el-table-column prop="contract_code" label="合同编号" width="150" show-overflow-tooltip />
        <el-table-column
          prop="contract_name"
          label="合同名称"
          min-width="200"
          show-overflow-tooltip
        >
          <template #default="{ row }">
            <el-link type="primary">{{ row.contract_name }}</el-link>
          </template>
        </el-table-column>
        <el-table-column prop="contract_type" label="合同类型" width="110">
          <template #default="{ row }">
            <el-tag
              :type="
                row.contract_type === '销售合同'
                  ? 'primary'
                  : row.contract_type === '框架合同'
                    ? 'success'
                    : 'warning'
              "
              size="small"
            >
              {{ row.contract_type }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="total_amount" label="总金额(万元)" width="130" align="right">
          <template #default="{ row }">¥{{ formatNumber(row.total_amount) }}</template>
        </el-table-column>
        <el-table-column prop="paid_amount" label="已付(万元)" width="120" align="right">
          <template #default="{ row }">¥{{ formatNumber(row.paid_amount) }}</template>
        </el-table-column>
        <el-table-column prop="unpaid_amount" label="未付(万元)" width="120" align="right">
          <template #default="{ row }">
            <span :style="{ color: row.unpaid_amount > 0 ? '#f56c6c' : '#67c23a' }">
              ¥{{ formatNumber(row.unpaid_amount) }}
            </span>
          </template>
        </el-table-column>
        <el-table-column prop="approval_status" label="审批状态" width="100">
          <template #default="{ row }">
            <el-tag
              :type="
                row.approval_status === '已审批'
                  ? 'success'
                  : row.approval_status === '审批中'
                    ? 'warning'
                    : 'info'
              "
              size="small"
            >
              {{ row.approval_status }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="signed_date" label="签约日期" width="120" sortable />
        <el-table-column prop="end_date" label="结束日期" width="120" />
        <el-table-column label="操作" width="100" align="center" fixed="right">
          <template #default>
            <el-button type="primary" size="small" link>详情</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="tab-pagination">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :total="filteredData.length"
          :page-sizes="[10, 20, 50]"
          layout="total, sizes, prev, pager, next"
          background
        />
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed } from "vue";

defineOptions({ name: "ContractTab", inheritAttrs: false });

defineProps<{
  customerId: number;
  customerInfo?: Record<string, unknown>;
}>();

const currentPage = ref(1);
const pageSize = ref(10);

const queryParams = reactive({
  contract_type: "",
  approval_status: "",
  date_range: null as [string, string] | null,
});

const allDemoData = ref(generateDemoData());

const filteredData = computed(() => {
  let data = allDemoData.value;
  if (queryParams.contract_type) {
    data = data.filter((d) => d.contract_type === queryParams.contract_type);
  }
  if (queryParams.approval_status) {
    data = data.filter((d) => d.approval_status === queryParams.approval_status);
  }
  if (queryParams.date_range && queryParams.date_range.length === 2) {
    const [start, end] = queryParams.date_range;
    data = data.filter((d) => d.signed_date >= start && d.signed_date <= end);
  }
  return data;
});

function formatNumber(n: number) {
  return n.toLocaleString("zh-CN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function handleSearch() {
  currentPage.value = 1;
}
function handleReset() {
  queryParams.contract_type = "";
  queryParams.approval_status = "";
  queryParams.date_range = null;
  currentPage.value = 1;
}

function generateDemoData() {
  const today = new Date();
  const fmtDate = (d: Date) => d.toISOString().split("T")[0];
  const offset = (days: number) => fmtDate(new Date(today.getTime() + days * 86400000));
  return [
    {
      contract_code: "CT-2026-001",
      contract_name: "智能检测设备采购框架协议",
      contract_type: "框架合同",
      total_amount: 500.0,
      paid_amount: 200.0,
      unpaid_amount: 300.0,
      approval_status: "已审批",
      signed_date: offset(-90),
      end_date: offset(275),
    },
    {
      contract_code: "CT-2026-002",
      contract_name: "精密零部件供货合同",
      contract_type: "销售合同",
      total_amount: 85.8,
      paid_amount: 85.8,
      unpaid_amount: 0.0,
      approval_status: "已审批",
      signed_date: offset(-60),
      end_date: offset(-5),
    },
    {
      contract_code: "CT-2026-003",
      contract_name: "MES系统实施与运维服务合同",
      contract_type: "服务合同",
      total_amount: 200.0,
      paid_amount: 100.0,
      unpaid_amount: 100.0,
      approval_status: "已审批",
      signed_date: offset(-30),
      end_date: offset(335),
    },
    {
      contract_code: "CT-2026-004",
      contract_name: "2026年度备品备件供应合同",
      contract_type: "年度合同",
      total_amount: 150.0,
      paid_amount: 0.0,
      unpaid_amount: 150.0,
      approval_status: "审批中",
      signed_date: offset(-15),
      end_date: offset(350),
    },
  ];
}
</script>

<style scoped>
.tab-container {
  padding: 4px 0;
}
.tab-search {
  background: #fafafa;
  padding: 12px;
  border-radius: 4px;
  margin-bottom: 12px;
}
.tab-pagination {
  display: flex;
  justify-content: flex-end;
  padding: 16px 0;
}
</style>
