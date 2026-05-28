<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_orders 表，待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="订单状态">
          <el-select
            v-model="queryParams.order_status"
            placeholder="全部"
            clearable
            style="width: 130px"
          >
            <el-option label="待确认" value="待确认" />
            <el-option label="已确认" value="已确认" />
            <el-option label="已发货" value="已发货" />
            <el-option label="已完成" value="已完成" />
            <el-option label="已取消" value="已取消" />
          </el-select>
        </el-form-item>
        <el-form-item label="下单日期">
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
        <el-table-column prop="order_code" label="订单编号" width="150" show-overflow-tooltip />
        <el-table-column prop="order_date" label="下单日期" width="120" sortable />
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
        <el-table-column prop="order_status" label="订单状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getOrderStatusTag(row.order_status)" size="small">
              {{ row.order_status }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="payment_status" label="付款状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getPaymentStatusTag(row.payment_status)" size="small">
              {{ row.payment_status }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="expected_delivery_date" label="预计交付" width="120" />
        <el-table-column prop="owner_name" label="负责人" width="100" />
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

defineOptions({ name: "SalesOrderTab", inheritAttrs: false });

defineProps<{
  customerId: number;
  customerInfo?: Record<string, unknown>;
}>();

const currentPage = ref(1);
const pageSize = ref(10);

const queryParams = reactive({
  order_status: "",
  date_range: null as [string, string] | null,
});

const allDemoData = ref(generateDemoData());

const filteredData = computed(() => {
  let data = allDemoData.value;
  if (queryParams.order_status) {
    data = data.filter((d) => d.order_status === queryParams.order_status);
  }
  if (queryParams.date_range && queryParams.date_range.length === 2) {
    const [start, end] = queryParams.date_range;
    data = data.filter((d) => d.order_date >= start && d.order_date <= end);
  }
  return data;
});

function formatNumber(n: number) {
  return n.toLocaleString("zh-CN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function getOrderStatusTag(status: string): "primary" | "success" | "warning" | "info" | "danger" {
  const map: Record<string, string> = {
    已完成: "success",
    已发货: "primary",
    已确认: "warning",
    待确认: "info",
    已取消: "danger",
  };
  return (map[status] || "info") as "primary" | "success" | "warning" | "info" | "danger";
}

function getPaymentStatusTag(status: string): "success" | "warning" | "danger" | "info" {
  const map: Record<string, string> = { 已付清: "success", 部分付款: "warning", 未付款: "danger" };
  return (map[status] || "info") as "success" | "warning" | "danger" | "info";
}

function handleSearch() {
  currentPage.value = 1;
}
function handleReset() {
  queryParams.order_status = "";
  queryParams.date_range = null;
  currentPage.value = 1;
}

function generateDemoData() {
  const today = new Date();
  const fmtDate = (d: Date) => d.toISOString().split("T")[0];
  const offset = (days: number) => fmtDate(new Date(today.getTime() + days * 86400000));
  return [
    {
      order_code: "ORD-2026-001",
      order_date: offset(-80),
      total_amount: 65.0,
      paid_amount: 65.0,
      unpaid_amount: 0.0,
      order_status: "已完成",
      payment_status: "已付清",
      expected_delivery_date: offset(-50),
      owner_name: "张三",
    },
    {
      order_code: "ORD-2026-002",
      order_date: offset(-40),
      total_amount: 120.5,
      paid_amount: 60.0,
      unpaid_amount: 60.5,
      order_status: "已发货",
      payment_status: "部分付款",
      expected_delivery_date: offset(-10),
      owner_name: "张三",
    },
    {
      order_code: "ORD-2026-003",
      order_date: offset(-15),
      total_amount: 35.8,
      paid_amount: 0.0,
      unpaid_amount: 35.8,
      order_status: "已确认",
      payment_status: "未付款",
      expected_delivery_date: offset(15),
      owner_name: "李四",
    },
    {
      order_code: "ORD-2026-004",
      order_date: offset(-5),
      total_amount: 88.0,
      paid_amount: 0.0,
      unpaid_amount: 88.0,
      order_status: "待确认",
      payment_status: "未付款",
      expected_delivery_date: offset(25),
      owner_name: "张三",
    },
    {
      order_code: "ORD-2026-005",
      order_date: offset(-60),
      total_amount: 15.0,
      paid_amount: 0.0,
      unpaid_amount: 15.0,
      order_status: "已取消",
      payment_status: "未付款",
      expected_delivery_date: offset(-30),
      owner_name: "李四",
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
