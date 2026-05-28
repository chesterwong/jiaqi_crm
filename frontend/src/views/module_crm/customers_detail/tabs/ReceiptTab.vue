<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_payments 表（收款场景），待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="收款方式">
          <el-select
            v-model="queryParams.payment_method"
            placeholder="全部"
            clearable
            style="width: 140px"
          >
            <el-option label="银行转账" value="银行转账" />
            <el-option label="现金" value="现金" />
            <el-option label="支票" value="支票" />
            <el-option label="微信/支付宝" value="微信/支付宝" />
          </el-select>
        </el-form-item>
        <el-form-item label="收款日期">
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
        <el-table-column prop="payment_code" label="收款编号" width="150" show-overflow-tooltip />
        <el-table-column prop="contract_code" label="关联合同" width="150" show-overflow-tooltip />
        <el-table-column prop="payment_amount" label="收款金额(元)" width="130" align="right">
          <template #default="{ row }">¥{{ formatNumber(row.payment_amount) }}</template>
        </el-table-column>
        <el-table-column prop="payment_method" label="收款方式" width="110">
          <template #default="{ row }">
            <el-tag :type="getMethodTag(row.payment_method)" size="small">
              {{ row.payment_method }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="payment_date" label="收款日期" width="120" sortable />
        <el-table-column prop="receipt_number" label="收款单号" width="150" show-overflow-tooltip />
        <el-table-column prop="payment_status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag :type="row.payment_status === '已确认' ? 'success' : 'warning'" size="small">
              {{ row.payment_status }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="is_invoiced" label="开票" width="80" align="center">
          <template #default="{ row }">
            <el-tag :type="row.is_invoiced ? 'success' : 'info'" size="small">
              {{ row.is_invoiced ? "已开票" : "未开票" }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="remark" label="备注" width="160" show-overflow-tooltip />
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

defineOptions({ name: "ReceiptTab", inheritAttrs: false });

defineProps<{
  customerId: number;
  customerInfo?: Record<string, unknown>;
}>();

const currentPage = ref(1);
const pageSize = ref(10);

const queryParams = reactive({
  payment_method: "",
  date_range: null as [string, string] | null,
});

const allDemoData = ref(generateDemoData());

const filteredData = computed(() => {
  let data = allDemoData.value;
  if (queryParams.payment_method) {
    data = data.filter((d) => d.payment_method === queryParams.payment_method);
  }
  if (queryParams.date_range && queryParams.date_range.length === 2) {
    const [start, end] = queryParams.date_range;
    data = data.filter((d) => d.payment_date >= start && d.payment_date <= end);
  }
  return data;
});

function formatNumber(n: number) {
  return n.toLocaleString("zh-CN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function getMethodTag(method: string): "primary" | "success" | "warning" | "info" | "danger" {
  const map: Record<string, string> = {
    银行转账: "primary",
    现金: "success",
    支票: "warning",
    "微信/支付宝": "info",
  };
  return (map[method] || "info") as "primary" | "success" | "warning" | "info" | "danger";
}

function handleSearch() {
  currentPage.value = 1;
}
function handleReset() {
  queryParams.payment_method = "";
  queryParams.date_range = null;
  currentPage.value = 1;
}

function generateDemoData() {
  const today = new Date();
  const fmtDate = (d: Date) => d.toISOString().split("T")[0];
  const offset = (days: number) => fmtDate(new Date(today.getTime() + days * 86400000));
  return [
    {
      payment_code: "RCP-2026-001",
      contract_code: "CT-2026-001",
      payment_amount: 200000.0,
      payment_method: "银行转账",
      payment_date: offset(-70),
      receipt_number: "REC-001",
      payment_status: "已确认",
      is_invoiced: true,
      remark: "第一期款项",
    },
    {
      payment_code: "RCP-2026-002",
      contract_code: "CT-2026-002",
      payment_amount: 85800.0,
      payment_method: "银行转账",
      payment_date: offset(-45),
      receipt_number: "REC-002",
      payment_status: "已确认",
      is_invoiced: true,
      remark: "全款付清",
    },
    {
      payment_code: "RCP-2026-003",
      contract_code: "CT-2026-003",
      payment_amount: 100000.0,
      payment_method: "支票",
      payment_date: offset(-20),
      receipt_number: "REC-003",
      payment_status: "已确认",
      is_invoiced: false,
      remark: "首付款",
    },
    {
      payment_code: "RCP-2026-004",
      contract_code: "CT-2026-004",
      payment_amount: 50000.0,
      payment_method: "微信/支付宝",
      payment_date: offset(-3),
      receipt_number: "REC-004",
      payment_status: "待确认",
      is_invoiced: false,
      remark: "定金",
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
