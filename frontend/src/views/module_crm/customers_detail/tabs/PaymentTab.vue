<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_payments 表（付款场景），待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="付款方式">
          <el-select
            v-model="queryParams.payment_method"
            placeholder="全部"
            clearable
            style="width: 140px"
          >
            <el-option label="银行转账" value="银行转账" />
            <el-option label="现金" value="现金" />
            <el-option label="支票" value="支票" />
            <el-option label="汇票" value="汇票" />
          </el-select>
        </el-form-item>
        <el-form-item label="付款日期">
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
        <el-table-column prop="payment_code" label="付款编号" width="150" show-overflow-tooltip />
        <el-table-column prop="payee_name" label="收款方" width="160" show-overflow-tooltip />
        <el-table-column prop="payment_amount" label="付款金额(元)" width="130" align="right">
          <template #default="{ row }">¥{{ formatNumber(row.payment_amount) }}</template>
        </el-table-column>
        <el-table-column prop="payment_method" label="付款方式" width="110">
          <template #default="{ row }">
            <el-tag :type="getMethodTag(row.payment_method)" size="small">
              {{ row.payment_method }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="payment_date" label="付款日期" width="120" sortable />
        <el-table-column prop="bank_name" label="银行名称" width="140" show-overflow-tooltip />
        <el-table-column prop="bank_account" label="银行账号" width="180" show-overflow-tooltip />
        <el-table-column prop="payment_status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag
              :type="
                row.payment_status === '已完成'
                  ? 'success'
                  : row.payment_status === '待审批'
                    ? 'warning'
                    : 'info'
              "
              size="small"
            >
              {{ row.payment_status }}
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

defineOptions({ name: "PaymentTab", inheritAttrs: false });

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
    汇票: "info",
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
      payment_code: "PAY-2026-001",
      payee_name: "东莞精密模具厂",
      payment_amount: 350000.0,
      payment_method: "银行转账",
      payment_date: offset(-60),
      bank_name: "中国工商银行",
      bank_account: "**** **** **** 8823",
      payment_status: "已完成",
      remark: "模具采购款",
    },
    {
      payment_code: "PAY-2026-002",
      payee_name: "深圳市鑫达电子有限公司",
      payment_amount: 128000.0,
      payment_method: "支票",
      payment_date: offset(-35),
      bank_name: "中国建设银行",
      bank_account: "**** **** **** 5612",
      payment_status: "已完成",
      remark: "零配件采购",
    },
    {
      payment_code: "PAY-2026-003",
      payee_name: "华为云计算技术有限公司",
      payment_amount: 86000.0,
      payment_method: "银行转账",
      payment_date: offset(-10),
      bank_name: "招商银行",
      bank_account: "**** **** **** 3901",
      payment_status: "待审批",
      remark: "年度云服务费",
    },
    {
      payment_code: "PAY-2026-004",
      payee_name: "上海物流运输有限公司",
      payment_amount: 28500.0,
      payment_method: "汇票",
      payment_date: offset(-2),
      bank_name: "中国农业银行",
      bank_account: "**** **** **** 7440",
      payment_status: "待审批",
      remark: "运费结算",
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
