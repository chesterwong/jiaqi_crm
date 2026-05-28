<template>
  <div class="tab-container">
    <el-alert
      type="info"
      :closable="false"
      show-icon
      title="数据来自 crm_followups 表，待后端模块生成后对接"
      style="margin-bottom: 12px"
    />

    <div class="tab-search">
      <el-form :model="queryParams" inline size="default">
        <el-form-item label="跟进类型">
          <el-select
            v-model="queryParams.followup_type"
            placeholder="全部"
            clearable
            style="width: 140px"
          >
            <el-option label="电话" value="电话" />
            <el-option label="拜访" value="拜访" />
            <el-option label="邮件" value="邮件" />
            <el-option label="微信" value="微信" />
            <el-option label="其他" value="其他" />
          </el-select>
        </el-form-item>
        <el-form-item label="跟进日期">
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
        <el-table-column prop="followup_date" label="跟进日期" width="120" sortable />
        <el-table-column prop="followup_type" label="跟进类型" width="100">
          <template #default="{ row }">
            <el-tag :type="getFollowupTypeTag(row.followup_type)" size="small">
              {{ row.followup_type }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="content" label="跟进内容" min-width="220" show-overflow-tooltip />
        <el-table-column prop="result" label="跟进结果" width="110" show-overflow-tooltip>
          <template #default="{ row }">
            <el-tag
              :type="row.result === '有效' ? 'success' : row.result === '待定' ? 'warning' : 'info'"
              size="small"
            >
              {{ row.result }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="contact_name" label="联系人" width="100" />
        <el-table-column prop="next_followup_date" label="下次跟进" width="120" />
        <el-table-column prop="location" label="地点" width="140" show-overflow-tooltip />
        <el-table-column prop="created_by" label="创建人" width="100" />
        <el-table-column prop="created_time" label="创建时间" width="170" />
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

defineOptions({ name: "FollowupPlanTab", inheritAttrs: false });

const props = defineProps<{
  customerId: number;
  customerInfo?: Record<string, unknown>;
}>();

const currentPage = ref(1);
const pageSize = ref(10);

const queryParams = reactive({
  followup_type: "",
  date_range: null as [string, string] | null,
});

const allDemoData = ref(generateDemoData());

const filteredData = computed(() => {
  let data = allDemoData.value;
  if (queryParams.followup_type) {
    data = data.filter((d) => d.followup_type === queryParams.followup_type);
  }
  if (queryParams.date_range && queryParams.date_range.length === 2) {
    const [start, end] = queryParams.date_range;
    data = data.filter((d) => d.followup_date >= start && d.followup_date <= end);
  }
  return data;
});

function getFollowupTypeTag(type: string): "primary" | "success" | "warning" | "info" | "danger" {
  const map: Record<string, string> = {
    电话: "primary",
    拜访: "success",
    邮件: "warning",
    微信: "info",
  };
  return (map[type] || "info") as "primary" | "success" | "warning" | "info" | "danger";
}

function handleSearch() {
  currentPage.value = 1;
}
function handleReset() {
  queryParams.followup_type = "";
  queryParams.date_range = null;
  currentPage.value = 1;
}

function generateDemoData() {
  const today = new Date();
  const fmtDate = (d: Date) => d.toISOString().split("T")[0];
  const offset = (days: number) => fmtDate(new Date(today.getTime() + days * 86400000));
  return [
    {
      followup_date: offset(-2),
      followup_type: "电话",
      content: "与客户确认产品规格需求，客户对A型号产品表现出兴趣，要求提供详细报价",
      result: "有效",
      contact_name: "张总",
      next_followup_date: offset(5),
      location: "--",
      created_by: "张三",
      created_time: offset(-2) + " 10:30:00",
    },
    {
      followup_date: offset(-5),
      followup_type: "拜访",
      content: "实地考察客户工厂，了解生产线布局和技术要求，客户提出定制化需求",
      result: "有效",
      contact_name: "李经理",
      next_followup_date: offset(2),
      location: "客户工厂",
      created_by: "张三",
      created_time: offset(-5) + " 14:00:00",
    },
    {
      followup_date: offset(-8),
      followup_type: "邮件",
      content: "发送技术方案和报价单，等待客户反馈意见",
      result: "待定",
      contact_name: "王工",
      next_followup_date: offset(1),
      location: "--",
      created_by: "张三",
      created_time: offset(-8) + " 09:15:00",
    },
    {
      followup_date: offset(-12),
      followup_type: "微信",
      content: "客户反馈价格偏高，与内部沟通后提供阶梯报价方案",
      result: "有效",
      contact_name: "张总",
      next_followup_date: offset(-3),
      location: "--",
      created_by: "李四",
      created_time: offset(-12) + " 16:20:00",
    },
    {
      followup_date: offset(-15),
      followup_type: "电话",
      content: "新年问候兼跟进，了解客户上半年采购计划",
      result: "一般",
      contact_name: "赵经理",
      next_followup_date: offset(10),
      location: "--",
      created_by: "张三",
      created_time: offset(-15) + " 11:00:00",
    },
    {
      followup_date: offset(-20),
      followup_type: "拜访",
      content: "参加客户供应商大会，建立更深层业务合作关系",
      result: "有效",
      contact_name: "陈总",
      next_followup_date: offset(-5),
      location: "会展中心",
      created_by: "李四",
      created_time: offset(-20) + " 08:30:00",
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
