<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_opportunities 表，待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="阶段">
          <el-select v-model="queryParams.stage" placeholder="全部" clearable style="width: 140px">
            <el-option label="初步接触" value="初步接触" />
            <el-option label="需求分析" value="需求分析" />
            <el-option label="方案报价" value="方案报价" />
            <el-option label="商务谈判" value="商务谈判" />
            <el-option label="赢单" value="赢单" />
            <el-option label="输单" value="输单" />
          </el-select>
        </el-form-item>
        <el-form-item label="预计成交日期">
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
        <el-table-column
          prop="opportunity_code"
          label="商机编号"
          width="140"
          show-overflow-tooltip
        />
        <el-table-column
          prop="opportunity_name"
          label="商机名称"
          min-width="180"
          show-overflow-tooltip
        >
          <template #default="{ row }">
            <el-link type="primary">{{ row.opportunity_name }}</el-link>
          </template>
        </el-table-column>
        <el-table-column prop="stage" label="阶段" width="110">
          <template #default="{ row }">
            <el-tag :type="getStageTag(row.stage)" size="small">{{ row.stage }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="amount" label="金额(万元)" width="120" align="right">
          <template #default="{ row }">¥{{ formatNumber(row.amount) }}</template>
        </el-table-column>
        <el-table-column prop="probability" label="赢单概率" width="120" align="center">
          <template #default="{ row }">
            <div class="prob-cell">
              <el-progress
                :percentage="row.probability"
                :color="
                  row.probability >= 80 ? '#67c23a' : row.probability >= 50 ? '#e6a23c' : '#909399'
                "
                :stroke-width="6"
                :show-text="false"
                style="width: 70px"
              />
              <span class="prob-text">{{ row.probability }}%</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="expected_close_date" label="预计成交" width="120" sortable />
        <el-table-column prop="owner_name" label="负责人" width="100" />
        <el-table-column prop="created_time" label="创建时间" width="170" />
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

defineOptions({ name: "OpportunityTab", inheritAttrs: false });

defineProps<{
  customerId: number;
  customerInfo?: Record<string, unknown>;
}>();

const currentPage = ref(1);
const pageSize = ref(10);

const queryParams = reactive({
  stage: "",
  date_range: null as [string, string] | null,
});

const allDemoData = ref(generateDemoData());

const filteredData = computed(() => {
  let data = allDemoData.value;
  if (queryParams.stage) {
    data = data.filter((d) => d.stage === queryParams.stage);
  }
  if (queryParams.date_range && queryParams.date_range.length === 2) {
    const [start, end] = queryParams.date_range;
    data = data.filter((d) => d.expected_close_date >= start && d.expected_close_date <= end);
  }
  return data;
});

function formatNumber(n: number) {
  return n.toLocaleString("zh-CN", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function getStageTag(stage: string): "success" | "danger" | "warning" | "info" {
  if (stage === "赢单") return "success";
  if (stage === "输单") return "danger";
  if (["商务谈判", "方案报价"].includes(stage)) return "warning";
  return "info";
}

function handleSearch() {
  currentPage.value = 1;
}
function handleReset() {
  queryParams.stage = "";
  queryParams.date_range = null;
  currentPage.value = 1;
}

function generateDemoData() {
  const today = new Date();
  const fmtDate = (d: Date) => d.toISOString().split("T")[0];
  const offset = (days: number) => fmtDate(new Date(today.getTime() + days * 86400000));
  return [
    {
      opportunity_code: "OPP-2026-001",
      opportunity_name: "智能检测设备采购项目",
      stage: "初步接触",
      amount: 120.5,
      probability: 20,
      expected_close_date: offset(90),
      owner_name: "张三",
      created_time: offset(-30) + " 09:00:00",
    },
    {
      opportunity_code: "OPP-2026-002",
      opportunity_name: "自动装配线升级改造",
      stage: "需求分析",
      amount: 350.0,
      probability: 40,
      expected_close_date: offset(60),
      owner_name: "张三",
      created_time: offset(-25) + " 10:30:00",
    },
    {
      opportunity_code: "OPP-2026-003",
      opportunity_name: "精密零部件年度供货",
      stage: "方案报价",
      amount: 85.8,
      probability: 65,
      expected_close_date: offset(30),
      owner_name: "李四",
      created_time: offset(-15) + " 14:00:00",
    },
    {
      opportunity_code: "OPP-2026-004",
      opportunity_name: "MES系统实施服务",
      stage: "商务谈判",
      amount: 200.0,
      probability: 80,
      expected_close_date: offset(15),
      owner_name: "张三",
      created_time: offset(-10) + " 16:20:00",
    },
    {
      opportunity_code: "OPP-2026-005",
      opportunity_name: "注塑模具开发项目",
      stage: "赢单",
      amount: 55.0,
      probability: 100,
      expected_close_date: offset(-5),
      owner_name: "李四",
      created_time: offset(-40) + " 08:00:00",
    },
    {
      opportunity_code: "OPP-2026-006",
      opportunity_name: "仓储物流设备采购",
      stage: "输单",
      amount: 150.0,
      probability: 0,
      expected_close_date: offset(-20),
      owner_name: "张三",
      created_time: offset(-60) + " 11:00:00",
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
.prob-cell {
  display: flex;
  align-items: center;
  gap: 8px;
  justify-content: center;
}
.prob-text {
  font-size: 13px;
  color: #606266;
  min-width: 36px;
}
</style>
