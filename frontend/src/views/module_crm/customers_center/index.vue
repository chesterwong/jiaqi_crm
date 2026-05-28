<template>
  <div class="customer-center">
    <!-- 页面标题 -->
    <div class="cc-header">
      <div class="cc-header-left">
        <h1 class="cc-title">客户中心</h1>
        <p class="cc-subtitle">管理和跟踪所有客户信息</p>
      </div>
      <div class="cc-header-right">
        <el-button :icon="Download" @click="handleExport">导出</el-button>
        <el-button type="primary" :icon="Plus" @click="handleAdd">新增客户</el-button>
      </div>
    </div>

    <!-- 统计卡片 -->
    <div class="cc-stats">
      <div v-for="s in statList" :key="s.label" class="cc-stat-card">
        <div class="cc-stat-label">{{ s.label }}</div>
        <div class="cc-stat-value" :class="s.colorClass">{{ s.value }}</div>
      </div>
    </div>

    <!-- 主体内容卡片 -->
    <el-card shadow="never" class="cc-main-card">
      <!-- 页签 -->
      <el-tabs v-model="activeTab" class="cc-tabs" @tab-click="handleTabClick">
        <el-tab-pane v-for="t in tabList" :key="t.key" :name="t.key">
          <template #label>
            <span class="cc-tab-label">
              <el-icon class="cc-tab-icon"><component :is="t.icon" /></el-icon>
              {{ t.label }}
            </span>
          </template>
        </el-tab-pane>
      </el-tabs>

      <!-- 搜索栏 -->
      <div class="cc-search">
        <el-form :model="queryParams" inline size="default">
          <el-form-item label="客户名称">
            <el-input
              v-model="queryParams.customer_name"
              placeholder="客户名称"
              clearable
              style="width: 160px"
              @keyup.enter="handleSearch"
            />
          </el-form-item>
          <el-form-item label="客户编号">
            <el-input
              v-model="queryParams.customer_code"
              placeholder="客户编号"
              clearable
              style="width: 160px"
              @keyup.enter="handleSearch"
            />
          </el-form-item>
          <el-form-item label="客户类型">
            <el-select
              v-model="queryParams.customer_type"
              placeholder="客户类型"
              clearable
              style="width: 140px"
            >
              <el-option
                v-for="item in dictMap.customer_type"
                :key="item.dict_value"
                :label="item.dict_label"
                :value="item.dict_value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="客户状态">
            <el-select
              v-model="queryParams.customer_status"
              placeholder="客户状态"
              clearable
              style="width: 140px"
            >
              <el-option
                v-for="item in dictMap.customer_status"
                :key="item.dict_value"
                :label="item.dict_label"
                :value="item.dict_value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="客户等级">
            <el-select
              v-model="queryParams.customer_level"
              placeholder="客户等级"
              clearable
              style="width: 140px"
            >
              <el-option
                v-for="item in dictMap.customer_level"
                :key="item.dict_value"
                :label="item.dict_label"
                :value="item.dict_value"
              />
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" :icon="Search" @click="handleSearch">查询</el-button>
            <el-button :icon="Refresh" @click="handleReset">重置</el-button>
          </el-form-item>
        </el-form>
      </div>

      <!-- 数据表格 -->
      <el-table
        v-loading="loading"
        :data="tableData"
        border
        stripe
        height="calc(100vh - 480px)"
        style="width: 100%"
      >
        <template #empty>
          <el-empty :image-size="80" description="暂无数据" />
        </template>
        <el-table-column type="index" label="序号" width="60" align="center" />
        <el-table-column
          prop="customer_code"
          label="客户编号"
          min-width="140"
          show-overflow-tooltip
        />
        <el-table-column
          prop="customer_name"
          label="客户名称"
          min-width="160"
          show-overflow-tooltip
        >
          <template #default="scope">
            <el-link type="primary" @click="handleDetail(scope.row)">
              {{ scope.row.customer_name }}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column prop="customer_type" label="类型" width="100" show-overflow-tooltip>
          <template #default="scope">
            {{ getDictLabel(dictMap.customer_type, scope.row.customer_type) }}
          </template>
        </el-table-column>
        <el-table-column prop="industry" label="行业" width="120" show-overflow-tooltip />
        <el-table-column prop="scale" label="规模" width="90" show-overflow-tooltip>
          <template #default="scope">
            {{ getDictLabel(dictMap.scale, scope.row.scale) }}
          </template>
        </el-table-column>
        <el-table-column prop="source" label="来源" width="100" show-overflow-tooltip>
          <template #default="scope">
            {{ getDictLabel(dictMap.source, scope.row.source) }}
          </template>
        </el-table-column>
        <el-table-column prop="customer_status" label="状态" width="90">
          <template #default="scope">
            <el-tag
              :type="scope.row.customer_status === 'active' ? 'success' : 'info'"
              size="small"
            >
              {{ getDictLabel(dictMap.customer_status, scope.row.customer_status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="owner_id" label="负责人" width="100" show-overflow-tooltip>
          <template #default="scope">
            {{ scope.row.created_by?.name || "--" }}
          </template>
        </el-table-column>
        <el-table-column prop="customer_level" label="等级" width="80">
          <template #default="scope">
            <el-tag :type="getLevelType(scope.row.customer_level)" size="small">
              {{
                getDictLabel(dictMap.customer_level, scope.row.customer_level) ||
                scope.row.customer_level
              }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="total_revenue" label="总营收(万)" width="110" align="right" />
        <el-table-column prop="health_score" label="健康度" width="130" align="center">
          <template #default="scope">
            <div class="cc-health-bar">
              <div class="cc-health-track">
                <div
                  class="cc-health-fill"
                  :class="healthBarClass(scope.row.health_score)"
                  :style="{ width: (scope.row.health_score || 0) + '%' }"
                />
              </div>
              <span class="cc-health-num">{{ scope.row.health_score ?? "--" }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="churn_risk" label="流失风险" width="90">
          <template #default="scope">
            <el-tag
              :type="
                scope.row.churn_risk === 'high'
                  ? 'danger'
                  : scope.row.churn_risk === 'medium'
                    ? 'warning'
                    : 'success'
              "
              size="small"
            >
              {{ getDictLabel(dictMap.churn_risk, scope.row.churn_risk) || scope.row.churn_risk }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="next_followup_at" label="下次跟进" width="170" />
        <el-table-column prop="created_time" label="创建时间" width="170" />
        <el-table-column label="操作" width="200" fixed="right" align="center">
          <template #default="scope">
            <el-button
              v-hasPerm="['module_crm:customers_list:detail']"
              type="primary"
              size="small"
              link
              @click="handleDetail(scope.row)"
            >
              详情
            </el-button>
            <el-button
              v-hasPerm="['module_crm:customers_list:update']"
              type="primary"
              size="small"
              link
              @click="handleEdit(scope.row)"
            >
              编辑
            </el-button>
            <el-dropdown
              v-if="activeTab === 'public_pool'"
              trigger="click"
              @command="(cmd: string) => handlePoolAction(cmd, scope.row)"
            >
              <el-button type="primary" size="small" link>
                更多
                <el-icon class="el-icon--right"><ArrowDown /></el-icon>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item
                    v-hasPerm="['module_crm:customers_list:update']"
                    command="claim"
                  >
                    领取
                  </el-dropdown-item>
                  <el-dropdown-item
                    v-hasPerm="['module_crm:customers_list:update']"
                    command="assign"
                  >
                    分配给
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            <el-button
              v-if="activeTab !== 'public_pool'"
              v-hasPerm="['module_crm:customers_list:update']"
              type="danger"
              size="small"
              link
              @click="handleMoveToPool(scope.row)"
            >
              移入公海
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="cc-pagination">
        <div class="cc-pagination-total">
          共
          <b>{{ total }}</b>
          条记录
        </div>
        <el-pagination
          v-model:current-page="queryParams.page_no"
          v-model:page-size="queryParams.page_size"
          :page-sizes="[10, 20, 50, 100]"
          :total="total"
          layout="sizes, prev, pager, next"
          background
          @size-change="handleSearch"
          @current-change="handleSearch"
        />
      </div>
    </el-card>

    <!-- 分配对话框 -->
    <el-dialog v-model="assignDialog.visible" title="分配客户" width="400px">
      <el-form :model="assignDialog" label-width="100px">
        <el-form-item label="目标负责人">
          <UserTableSelect v-model="assignDialog.to_owner_id" placeholder="请选择负责人" />
        </el-form-item>
        <el-form-item label="转移原因">
          <el-input
            v-model="assignDialog.transfer_reason"
            type="textarea"
            :rows="3"
            placeholder="可选"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="assignDialog.visible = false">取消</el-button>
        <el-button type="primary" :loading="assigning" @click="handleAssignConfirm">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import {
  ArrowDown,
  Download,
  Plus,
  Search,
  Refresh,
  User,
  List,
  Edit,
  Clock,
  Star,
  FolderOpened,
  WarningFilled,
} from "@element-plus/icons-vue";
import { useRouter } from "vue-router";
import { useDictStore } from "@/store";
import CrmCustomersAPI, {
  DICT_TYPE_MAP,
  CrmCustomersCenterAPI,
  CrmCustomersPoolAPI,
} from "@/api/module_crm/customers_list";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";

defineOptions({ name: "CrmCustomersCenter", inheritAttrs: false });

const router = useRouter();
const dictStore = useDictStore();
const loading = ref(false);
const total = ref(0);
const tableData = ref<any[]>([]);

// 页签配置
const activeTab = ref("my_customers");
const tabList = [
  { key: "my_customers", label: "我的客户", icon: User },
  { key: "all", label: "我全部客户", icon: List },
  { key: "created_by_me", label: "我创建", icon: Edit },
  { key: "today_followup", label: "今日待跟", icon: Clock },
  { key: "high_value", label: "高价值", icon: Star },
  { key: "public_pool", label: "客户公海库", icon: FolderOpened },
  { key: "risk", label: "风险客户", icon: WarningFilled },
];

// 统计卡片数据 (暂无 API，使用模拟数据展示效果)
const statList = reactive([
  { label: "客户总数", value: "1,286", colorClass: "cc-stat--primary" },
  { label: "今日待跟", value: "23", colorClass: "cc-stat--warning" },
  { label: "高价值", value: "156", colorClass: "cc-stat--danger" },
  { label: "公海客户", value: "89", colorClass: "cc-stat--info" },
]);

// 查询参数
const queryParams = reactive({
  tab: "my_customers",
  page_no: 1,
  page_size: 10,
  customer_code: "",
  customer_name: "",
  customer_type: "",
  customer_status: "",
  customer_level: "",
});

// 字典数据
const dictMap: Record<string, any[]> = reactive({
  customer_type: [],
  source: [],
  customer_status: [],
  customer_level: [],
  scale: [],
  churn_risk: [],
});

// 分配对话框
const assignDialog = reactive({
  visible: false,
  customer_id: 0,
  to_owner_id: undefined as number | undefined,
  transfer_reason: "",
});
const assigning = ref(false);

// 获取字典值显示
function getDictLabel(dictList: any[], value: string | undefined): string {
  if (!value || !dictList) return value || "--";
  const item = dictList.find((d) => d.dict_value === value);
  return item?.dict_label || value;
}

// 等级颜色
function getLevelType(level: string | undefined): "danger" | "warning" | "info" {
  if (!level) return "info";
  if (["AAA", "AA", "A"].includes(level)) return "danger";
  if (["B"].includes(level)) return "warning";
  return "info";
}

// 健康度进度条颜色
function healthBarClass(score: string | undefined): string {
  const n = Number(score);
  if (isNaN(n)) return "cc-health--info";
  if (n >= 80) return "cc-health--success";
  if (n >= 60) return "cc-health--warning";
  return "cc-health--danger";
}

// 加载字典
async function loadDicts() {
  const dictTypes = Object.values(DICT_TYPE_MAP);
  const dictData = await dictStore.getDict(dictTypes);
  for (const key of Object.keys(DICT_TYPE_MAP)) {
    const dictType = DICT_TYPE_MAP[key];
    dictMap[key as keyof typeof dictMap] = dictData[dictType] || [];
  }
}

// 获取列表数据
async function fetchData() {
  loading.value = true;
  try {
    queryParams.tab = activeTab.value;
    const res = await CrmCustomersCenterAPI.centerList(queryParams as any);
    if (res.data?.data) {
      tableData.value = res.data.data.items || [];
      total.value = res.data.data.total || 0;
    }
  } catch (e) {
    console.error("获取客户列表失败", e);
  } finally {
    loading.value = false;
  }
}

// 切换页签
function handleTabClick() {
  queryParams.page_no = 1;
  fetchData();
}

// 搜索
function handleSearch() {
  queryParams.page_no = 1;
  fetchData();
}

// 重置
function handleReset() {
  queryParams.customer_code = "";
  queryParams.customer_name = "";
  queryParams.customer_type = "";
  queryParams.customer_status = "";
  queryParams.customer_level = "";
  queryParams.page_no = 1;
  fetchData();
}

// 导出
async function handleExport() {
  try {
    const res = await CrmCustomersAPI.exportCrmCustomers(queryParams as any);
    const blob = res as unknown as Blob;
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `客户列表_${new Date().toISOString().slice(0, 10)}.xlsx`;
    a.click();
    window.URL.revokeObjectURL(url);
    ElMessage.success("导出成功");
  } catch (e) {
    console.error("导出失败", e);
  }
}

// 新增客户
function handleAdd() {
  router.push({
    path: "/module_crm/customers",
    query: { type: "create" },
  });
}

// 详情
function handleDetail(row: any) {
  router.push({
    path: `/module_crm/customers_detail/${row.id}`,
    query: { tab: "profile" },
  });
}

// 编辑
function handleEdit(row: any) {
  router.push({
    path: `/module_crm/customers/${row.id}`,
    query: { type: "update" },
  });
}

// 公海池操作
function handlePoolAction(command: string, row: any) {
  if (command === "claim") {
    handleClaim(row);
  } else if (command === "assign") {
    assignDialog.customer_id = row.id;
    assignDialog.to_owner_id = undefined;
    assignDialog.transfer_reason = "";
    assignDialog.visible = true;
  }
}

// 领取
async function handleClaim(row: any) {
  try {
    await ElMessageBox.confirm(`确定领取客户「${row.customer_name}」?`, "提示", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "info",
    });
    loading.value = true;
    await CrmCustomersPoolAPI.claimPool(row.id);
    ElMessage.success("领取成功");
    fetchData();
  } catch (e: any) {
    if (e !== "cancel") {
      ElMessage.error(e?.message || "领取失败");
    }
  }
}

// 分配确认
async function handleAssignConfirm() {
  if (!assignDialog.to_owner_id) {
    ElMessage.warning("请选择负责人");
    return;
  }
  assigning.value = true;
  try {
    loading.value = true;
    await CrmCustomersPoolAPI.assignPool({
      customer_id: assignDialog.customer_id,
      to_owner_id: assignDialog.to_owner_id,
      transfer_reason: assignDialog.transfer_reason || undefined,
    });
    ElMessage.success("分配成功");
    assignDialog.visible = false;
    fetchData();
  } catch (e: any) {
    ElMessage.error(e?.message || "分配失败");
  } finally {
    assigning.value = false;
  }
}

// 移入公海
async function handleMoveToPool(row: any) {
  try {
    await ElMessageBox.confirm(`确定将客户「${row.customer_name}」移入公海池?`, "提示", {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    });
    loading.value = true;
    await CrmCustomersPoolAPI.moveToPool(row.id);
    ElMessage.success("移入公海池成功");
    fetchData();
  } catch (e: any) {
    if (e !== "cancel") {
      ElMessage.error(e?.message || "操作失败");
    }
  }
}

onMounted(async () => {
  await loadDicts();
  fetchData();
});
</script>

<style scoped>
/* ========== 页面容器 ========== */
.customer-center {
  padding: 16px 20px;
}

/* ========== 页面标题 ========== */
.cc-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-bottom: 16px;
}

.cc-title {
  font-size: 20px;
  font-weight: 700;
  color: var(--el-text-color-primary);
  margin: 0 0 4px 0;
  line-height: 1.4;
}

.cc-subtitle {
  font-size: 13px;
  color: var(--el-text-color-secondary);
  margin: 0;
}

.cc-header-right {
  display: flex;
  align-items: center;
  gap: 8px;
}

/* ========== 统计卡片 ========== */
.cc-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
  margin-bottom: 16px;
}

.cc-stat-card {
  background: #fff;
  border: 1px solid var(--el-border-color-lighter);
  border-radius: 6px;
  padding: 16px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  transition: box-shadow 0.2s;
}

.cc-stat-card:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}

.cc-stat-label {
  font-size: 13px;
  color: var(--el-text-color-secondary);
}

.cc-stat-value {
  font-size: 28px;
  font-weight: 700;
  line-height: 1;
}

.cc-stat--primary {
  color: #1677ff;
}
.cc-stat--warning {
  color: #fa8c16;
}
.cc-stat--danger {
  color: #f5222d;
}
.cc-stat--info {
  color: #1677ff;
  opacity: 0.7;
}

/* ========== 主卡片 ========== */
.cc-main-card {
  border-radius: 6px;
}

.cc-main-card :deep(.el-card__body) {
  padding: 0;
}

/* ========== 页签 ========== */
.cc-tabs {
  padding: 0 20px;
}

.cc-tabs :deep(.el-tabs__header) {
  margin-bottom: 0;
  border-bottom: 1px solid var(--el-border-color-lighter);
}

.cc-tabs :deep(.el-tabs__nav-wrap::after) {
  display: none;
}

.cc-tab-label {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-size: 14px;
}

.cc-tab-icon {
  font-size: 15px;
}

/* ========== 搜索栏 ========== */
.cc-search {
  padding: 14px 20px;
  background: var(--el-fill-color-light);
  border-bottom: 1px solid var(--el-border-color-lighter);
}

.cc-search .el-form-item {
  margin-bottom: 0;
}

/* ========== 健康度进度条 ========== */
.cc-health-bar {
  display: flex;
  align-items: center;
  gap: 8px;
  justify-content: center;
}

.cc-health-track {
  width: 56px;
  height: 6px;
  background: var(--el-fill-color);
  border-radius: 3px;
  overflow: hidden;
}

.cc-health-fill {
  height: 100%;
  border-radius: 3px;
  transition: width 0.3s ease;
}

.cc-health--success {
  background: #52c41a;
}
.cc-health--warning {
  background: #faad14;
}
.cc-health--danger {
  background: #f5222d;
}
.cc-health--info {
  background: var(--el-border-color);
}

.cc-health-num {
  font-size: 12px;
  color: var(--el-text-color-secondary);
  min-width: 28px;
  text-align: left;
}

/* ========== 分页 ========== */
.cc-pagination {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 20px;
  border-top: 1px solid var(--el-border-color-lighter);
}

.cc-pagination-total {
  font-size: 13px;
  color: var(--el-text-color-secondary);
}

.cc-pagination-total b {
  color: var(--el-text-color-primary);
  font-weight: 600;
}
</style>
