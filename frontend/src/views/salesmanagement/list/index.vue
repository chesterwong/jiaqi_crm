<!-- 销售资源管理列表 -->
<template>
  <div class="app-container">
    <PageSearch
      ref="searchRef"
      :search-config="searchConfig"
      @query-click="handleQueryClick"
      @reset-click="handleResetClick"
    />

    <PageContent ref="contentRef" :content-config="contentConfig">
      <template #toolbar="{ toolbarRight, onToolbar, removeIds, cols }">
        <CrudToolbarLeft
          :remove-ids="removeIds"
          :perm-create="['module_salesmanagement:marketing_resources:create']"
          :perm-delete="['module_salesmanagement:marketing_resources:delete']"
          @add="handleOpenDialog('create')"
          @delete="onToolbar('delete')"
        />
        <div class="data-table__toolbar--right">
          <CrudToolbarRight :buttons="toolbarRight" :cols="contentCols" :on-toolbar="onToolbar">
            <template #prepend>
              <!--<el-tooltip content="从飞书同步（小鹅通客户名单 + 资源统计）">
                <el-button
                  v-hasPerm="['module_salesmanagement:marketing_resources:import']"
                  type="primary"
                  icon="Refresh"
                  circle
                  :loading="feishuImportLoading"
                  @click="handleFeishuImport"
                />
              </el-tooltip>-->
            </template>
          </CrudToolbarRight>
        </div>
      </template>

      <template #table="{ data, loading, tableRef, onSelectionChange, pagination }">
        <div class="data-table__content">
          <el-table
            :ref="tableRef as any"
            v-loading="loading"
            row-key="id"
            :data="data"
            height="100%"
            border
            stripe
            @selection-change="onSelectionChange"
          >
            <template #empty>
              <el-empty :image-size="80" description="暂无数据" />
            </template>
            <el-table-column
              v-if="colVisible('selection')"
              type="selection"
              min-width="55"
              align="center"
            />
            <el-table-column v-if="colVisible('index')" fixed label="序号" min-width="60">
              <template #default="scope">
                {{ (pagination.currentPage - 1) * pagination.pageSize + scope.$index + 1 }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('serial_no')"
              label="台账序号"
              prop="serial_no"
              min-width="90"
            />
            <el-table-column
              v-if="colVisible('month_period')"
              label="月份"
              prop="month_period"
              min-width="90"
            />
            <el-table-column
              v-if="colVisible('contact_name')"
              label="姓名"
              prop="contact_name"
              min-width="100"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('phone')"
              label="手机号"
              prop="phone"
              min-width="120"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('xiaoe_duplicate_check')"
              label="小鹅通查重"
              prop="xiaoe_duplicate_check"
              min-width="120"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('resource_source')"
              label="资源来源"
              prop="resource_source"
              min-width="110"
              show-overflow-tooltip
            />
            <el-table-column v-if="colVisible('importance')" label="重要性" min-width="90">
              <template #default="scope">
                {{
                  (
                    dictStore.getDictLabel(
                      "crm_marketing_resources_importance",
                      scope.row.importance
                    ) as { dict_label?: string } | string | undefined
                  )?.dict_label ??
                    scope.row.importance ??
                    "—"
                }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('owner_id')"
              label="归属"
              min-width="100"
              show-overflow-tooltip
            >
              <template #default="scope">
                {{ scope.row.owner?.name || "—" }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('resource_acquired_at')"
              label="资源获取时间"
              prop="resource_acquired_at"
              min-width="170"
            />
            <el-table-column
              v-if="colVisible('resource_path')"
              label="资源路径"
              prop="resource_path"
              min-width="160"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('lead_question')"
              label="留资问题"
              prop="lead_question"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column v-if="colVisible('is_wechat_added')" label="是否加V" min-width="90">
              <template #default="scope">
                {{ formatBool(scope.row.is_wechat_added) }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('real_name')"
              label="真实姓名"
              prop="real_name"
              min-width="100"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('has_industry_background')"
              label="是否有产业背景"
              min-width="130"
            >
              <template #default="scope">
                {{ formatBool(scope.row.has_industry_background) }}
              </template>
            </el-table-column>
            <el-table-column v-if="colVisible('trades_etf')" label="是否交易ETF" min-width="120">
              <template #default="scope">
                {{ formatBool(scope.row.trades_etf) }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('trades_hk_us_stocks')"
              label="是否交易港美股"
              min-width="130"
            >
              <template #default="scope">
                {{ formatBool(scope.row.trades_hk_us_stocks) }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('trades_commodity_futures')"
              label="是否交易商品期货"
              min-width="140"
            >
              <template #default="scope">
                {{ formatBool(scope.row.trades_commodity_futures) }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('trading_capital')"
              label="交易资金"
              prop="trading_capital"
              min-width="110"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('customer_profile')"
              label="客户基本情况"
              prop="customer_profile"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('customer_demand')"
              label="客户需求"
              prop="customer_demand"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('planned_recommendation')"
              label="计划推荐"
              prop="planned_recommendation"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column v-if="colVisible('is_deal_closed')" label="是否成交" min-width="90">
              <template #default="scope">
                {{ formatBool(scope.row.is_deal_closed) }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('deal_amount')"
              label="成交金额"
              prop="deal_amount"
              min-width="100"
            />
            <el-table-column
              v-if="colVisible('wechat_id')"
              label="微信号"
              prop="wechat_id"
              min-width="120"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('other_contact')"
              label="其他联系方式"
              prop="other_contact"
              min-width="120"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('xiaoe_username')"
              label="小鹅通用户名"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                {{ scope.row.xiaoe_contact?.username || "—" }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('xiaoe_phone')"
              label="小鹅通手机号"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                {{ scope.row.xiaoe_contact?.phone || "—" }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('xiaoe_updated_at')"
              label="小鹅通更新时间"
              min-width="170"
            >
              <template #default="scope">
                {{ scope.row.xiaoe_contact?.xiaoe_updated_at || "—" }}
              </template>
            </el-table-column>
            <el-table-column
              v-if="colVisible('description')"
              label="备注"
              prop="description"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="colVisible('created_time')"
              label="创建时间"
              prop="created_time"
              min-width="170"
            />
            <el-table-column
              v-if="colVisible('updated_time')"
              label="更新时间"
              prop="updated_time"
              min-width="170"
            />
            <el-table-column
              v-if="colVisible('operation')"
              fixed="right"
              label="操作"
              align="center"
              min-width="220"
            >
              <template #default="scope">
                <el-button
                  v-hasPerm="['module_salesmanagement:marketing_resources:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row.id)"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_salesmanagement:marketing_resources:update']"
                  type="primary"
                  size="small"
                  link
                  icon="edit"
                  @click="handleOpenDialog('update', scope.row.id)"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_salesmanagement:marketing_resources:delete']"
                  type="danger"
                  size="small"
                  link
                  icon="delete"
                  @click="handleRowDelete(scope.row.id)"
                >
                  删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </template>
    </PageContent>

    <EnhancedDrawer
      v-model="dialogVisible.visible"
      :title="dialogVisible.title"
      append-to-body
      size="720px"
      @close="handleCloseDialog"
    >
      <template v-if="dialogVisible.type === 'detail'">
        <el-descriptions :column="2" border title="基本信息">
          <el-descriptions-item label="月份">{{ detailFormData.month_period || "—" }}</el-descriptions-item>
          <el-descriptions-item label="姓名">{{ detailFormData.contact_name || "—" }}</el-descriptions-item>
          <el-descriptions-item label="手机号">{{ detailFormData.phone || "—" }}</el-descriptions-item>
          <el-descriptions-item label="小鹅通查重">
            {{ detailFormData.xiaoe_duplicate_check || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="资源来源">
            {{ detailFormData.resource_source || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="归属">
            {{ detailFormData.owner?.name || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="资源获取时间" :span="2">
            {{ detailFormData.resource_acquired_at || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="资源路径" :span="2">
            {{ detailFormData.resource_path || "—" }}
          </el-descriptions-item>
        </el-descriptions>
        <el-descriptions class="mt-4" :column="2" border title="画像与成交">
          <el-descriptions-item label="是否加V">
            {{ formatBool(detailFormData.is_wechat_added) }}
          </el-descriptions-item>
          <el-descriptions-item label="是否成交">
            {{ formatBool(detailFormData.is_deal_closed) }}
          </el-descriptions-item>
          <el-descriptions-item label="成交金额">
            {{ detailFormData.deal_amount ?? "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="微信号">{{ detailFormData.wechat_id || "—" }}</el-descriptions-item>
          <el-descriptions-item label="客户基本情况" :span="2">
            {{ detailFormData.customer_profile || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="客户需求" :span="2">
            {{ detailFormData.customer_demand || "—" }}
          </el-descriptions-item>
        </el-descriptions>
        <el-descriptions class="mt-4" :column="2" border title="小鹅通关联（只读）">
          <el-descriptions-item label="用户名">
            {{ detailFormData.xiaoe_contact?.username || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="手机号">
            {{ detailFormData.xiaoe_contact?.phone || "—" }}
          </el-descriptions-item>
          <el-descriptions-item label="小鹅通更新时间" :span="2">
            {{ detailFormData.xiaoe_contact?.xiaoe_updated_at || "—" }}
          </el-descriptions-item>
        </el-descriptions>
      </template>
      <template v-else>
        <el-tabs v-model="activeTab">
          <el-tab-pane label="基本信息" name="basic">
            <el-form
              ref="dataFormRef"
              :model="formData"
              :rules="rules"
              label-suffix=":"
              label-width="110px"
            >
              <el-row :gutter="16">
                <el-col :span="12">
                  <el-form-item label="月份" prop="month_period">
                    <el-date-picker
                      v-model="formData.month_period"
                      type="month"
                      value-format="YYYY-MM"
                      placeholder="选择月份"
                      class="w-full"
                      clearable
                    />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="资源获取时间" prop="resource_acquired_at">
                    <el-date-picker
                      v-model="formData.resource_acquired_at"
                      type="datetime"
                      value-format="YYYY-MM-DD HH:mm:ss"
                      placeholder="选择时间"
                      class="w-full"
                      clearable
                    />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="姓名" prop="contact_name">
                    <el-input v-model="formData.contact_name" clearable placeholder="姓名" />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="手机号" prop="phone">
                    <el-input v-model="formData.phone" clearable placeholder="手机号" />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="资源来源" prop="resource_source">
                    <el-input v-model="formData.resource_source" clearable placeholder="资源来源" />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="重要性" prop="importance">
                    <el-select v-model="formData.importance" placeholder="请选择" clearable class="w-full">
                      <el-option
                        v-for="item in dictStore.getDictArray('crm_marketing_resources_importance')"
                        :key="item.dict_value"
                        :label="item.dict_label"
                        :value="item.dict_value"
                      />
                    </el-select>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="归属" prop="owner_id">
                    <UserTableSelect
                      v-model="formData.owner_id"
                      :dept-id="SALES_DEPT_ID"
                      placeholder="选择归属人"
                    />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="资源路径" prop="resource_path">
                    <el-input
                      v-model="formData.resource_path"
                      type="textarea"
                      :rows="2"
                      placeholder="资源路径/地址"
                    />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="留资问题" prop="lead_question">
                    <el-input
                      v-model="formData.lead_question"
                      type="textarea"
                      :rows="2"
                      placeholder="留资问题"
                    />
                  </el-form-item>
                </el-col>
              </el-row>
            </el-form>
          </el-tab-pane>
          <el-tab-pane label="画像与成交" name="profile">
            <el-form :model="formData" label-suffix=":" label-width="130px">
              <el-row :gutter="16">
                <el-col :span="12">
                  <el-form-item label="是否加V">
                    <el-select v-model="formData.is_wechat_added" clearable placeholder="未知" class="w-full">
                      <el-option label="是" :value="true" />
                      <el-option label="否" :value="false" />
                    </el-select>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="是否成交">
                    <el-select v-model="formData.is_deal_closed" clearable placeholder="未知" class="w-full">
                      <el-option label="是" :value="true" />
                      <el-option label="否" :value="false" />
                    </el-select>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="成交金额">
                    <el-input-number
                      v-model="formData.deal_amount"
                      :min="0"
                      :precision="2"
                      class="w-full"
                      controls-position="right"
                    />
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="微信号">
                    <el-input v-model="formData.wechat_id" clearable />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="客户基本情况">
                    <el-input v-model="formData.customer_profile" type="textarea" :rows="3" />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="客户需求">
                    <el-input v-model="formData.customer_demand" type="textarea" :rows="3" />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="计划推荐">
                    <el-input v-model="formData.planned_recommendation" type="textarea" :rows="2" />
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="备注">
                    <el-input v-model="formData.description" type="textarea" :rows="2" />
                  </el-form-item>
                </el-col>
              </el-row>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </template>
      <template #footer>
        <el-button @click="handleCloseDialog">取消</el-button>
        <el-button v-if="dialogVisible.type !== 'detail'" type="primary" @click="handleSubmit">
          确定
        </el-button>
        <el-button v-else type="primary" @click="handleCloseDialog">确定</el-button>
      </template>
    </EnhancedDrawer>
  </div>
</template>

<script setup lang="ts">
defineOptions({
  name: "SalesManagementList",
  inheritAttrs: false,
});

import { markRaw, nextTick, onMounted, reactive, ref } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import MarketingResourcesAPI, {
  type MarketingResourceForm,
  type MarketingResourcePageQuery,
  type MarketingResourceTable,
} from "@/api/salesmanagement/marketing_resources";
import CrudToolbarLeft from "@/components/CURD/CrudToolbarLeft.vue";
import CrudToolbarRight from "@/components/CURD/CrudToolbarRight.vue";
import PageSearch from "@/components/CURD/PageSearch.vue";
import PageContent from "@/components/CURD/PageContent.vue";
import EnhancedDrawer from "@/components/CURD/EnhancedDrawer.vue";
import { useCrudList } from "@/components/CURD/useCrudList";
import type { IContentConfig, ISearchConfig } from "@/components/CURD/types";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";
import { useDictStore } from "@/store/index";

/** 销售部 dept_id（与 sys_dept 一致） */
const SALES_DEPT_ID = 2;

const { searchRef, contentRef, handleQueryClick, handleResetClick, refreshList } = useCrudList();
const dictStore = useDictStore();
const feishuImportLoading = ref(false);

function formatBool(val: boolean | null | undefined) {
  if (val === true) return "是";
  if (val === false) return "否";
  return "未知";
}

function colVisible(prop: string) {
  return contentCols.find((c) => c.prop === prop)?.show !== false;
}

function triggerOwnerSearch() {
  nextTick(() => refreshList());
}

const searchConfig = reactive<ISearchConfig>({
  permPrefix: "module_salesmanagement:marketing_resources",
  colon: true,
  isExpandable: false,
  showNumber: 4,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "phone",
      label: "手机号",
      type: "input",
      attrs: { placeholder: "请输入手机号", clearable: true },
    },
    {
      prop: "contact_name",
      label: "姓名",
      type: "input",
      attrs: { placeholder: "请输入姓名", clearable: true },
    },
    {
      prop: "resource_source",
      label: "资源来源",
      type: "input",
      attrs: { placeholder: "请输入资源来源", clearable: true },
    },
    {
      prop: "month_period",
      label: "月份",
      type: "date-picker",
      attrs: {
        type: "month",
        valueFormat: "YYYY-MM",
        placeholder: "选择月份",
        clearable: true,
        style: { width: "170px" },
      },
    },
    {
      prop: "owner_id",
      label: "归属",
      type: "user-table-select",
      initialValue: null,
      attrs: {
        deptId: SALES_DEPT_ID,
      },
      events: {
        "confirm-click": triggerOwnerSearch,
        "clear-click": triggerOwnerSearch,
      },
    },
  ],
  customComponents: {
    "user-table-select": markRaw(UserTableSelect),
  },
});

const contentCols = reactive<Array<{ prop?: string; label?: string; show?: boolean }>>([
  { prop: "selection", label: "选择框", show: true },
  { prop: "index", label: "序号", show: true },
  { prop: "serial_no", label: "台账序号", show: false },
  { prop: "month_period", label: "月份", show: true },
  { prop: "contact_name", label: "姓名", show: true },
  { prop: "phone", label: "手机号", show: true },
  { prop: "xiaoe_duplicate_check", label: "小鹅通查重", show: true },
  { prop: "resource_source", label: "资源来源", show: true },
  { prop: "importance", label: "重要性", show: true },
  { prop: "owner_id", label: "归属", show: true },
  { prop: "resource_acquired_at", label: "资源获取时间", show: true },
  { prop: "resource_path", label: "资源路径", show: false },
  { prop: "lead_question", label: "留资问题", show: false },
  { prop: "is_wechat_added", label: "是否加V", show: false },
  { prop: "real_name", label: "真实姓名", show: false },
  { prop: "has_industry_background", label: "是否有产业背景", show: false },
  { prop: "trades_etf", label: "是否交易ETF", show: false },
  { prop: "trades_hk_us_stocks", label: "是否交易港美股", show: false },
  { prop: "trades_commodity_futures", label: "是否交易商品期货", show: false },
  { prop: "trading_capital", label: "交易资金", show: false },
  { prop: "customer_profile", label: "客户基本情况", show: false },
  { prop: "customer_demand", label: "客户需求", show: false },
  { prop: "planned_recommendation", label: "计划推荐", show: false },
  { prop: "is_deal_closed", label: "是否成交", show: true },
  { prop: "deal_amount", label: "成交金额", show: false },
  { prop: "wechat_id", label: "微信号", show: false },
  { prop: "other_contact", label: "其他联系方式", show: false },
  { prop: "xiaoe_username", label: "小鹅通用户名", show: true },
  { prop: "xiaoe_phone", label: "小鹅通手机号", show: false },
  { prop: "xiaoe_updated_at", label: "小鹅通更新时间", show: false },
  { prop: "description", label: "备注", show: false },
  { prop: "created_time", label: "创建时间", show: false },
  { prop: "updated_time", label: "更新时间", show: false },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  for (const key of ["phone", "contact_name", "resource_source", "month_period"]) {
    if (p[key] === "" || p[key] === null) p[key] = undefined;
  }
  if (p.owner_id === null) p.owner_id = undefined;
  return p as unknown as MarketingResourcePageQuery;
}

const contentConfig = reactive<IContentConfig<MarketingResourcePageQuery>>({
  permPrefix: "module_salesmanagement:marketing_resources",
  hideColumnFilter: false,
  cols: contentCols as IContentConfig["cols"],
  toolbar: [],
  defaultToolbar: ["refresh", "filter"],
  pagination: { pageSize: 10, pageSizes: [10, 20, 30, 50] },
  request: { page_no: "page_no", page_size: "page_size" },
  indexAction: async (params) => {
    const res = await MarketingResourcesAPI.list(
      normalizeQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    MarketingResourcesAPI.delete(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
});

const detailFormData = ref<MarketingResourceTable>({});
const formData = reactive<MarketingResourceForm>({});
const activeTab = ref("basic");
const dataFormRef = ref();
const dialogVisible = reactive({
  title: "",
  visible: false,
  type: "create" as "create" | "update" | "detail",
});

const rules = {
  contact_name: [{ required: true, message: "请输入姓名", trigger: "blur" }],
};

const initialFormData: MarketingResourceForm = {
  month_period: undefined,
  resource_acquired_at: undefined,
  contact_name: "",
  phone: undefined,
  resource_source: undefined,
  resource_path: undefined,
  owner_id: null,
  lead_question: undefined,
  is_wechat_added: null,
  is_deal_closed: null,
  deal_amount: null,
  importance: "normal",
  wechat_id: undefined,
  customer_profile: undefined,
  customer_demand: undefined,
  planned_recommendation: undefined,
  description: undefined,
};

function handleRowDelete(id: number) {
  contentRef.value?.handleDelete(id);
}

async function resetForm() {
  dataFormRef.value?.resetFields?.();
  dataFormRef.value?.clearValidate?.();
  Object.assign(formData, { ...initialFormData, id: undefined });
  activeTab.value = "basic";
}

function handleCloseDialog() {
  dialogVisible.visible = false;
  resetForm();
}

async function handleOpenDialog(type: "create" | "update" | "detail", id?: number) {
  dialogVisible.type = type;
  if (id) {
    const response = await MarketingResourcesAPI.detail(id);
    const row = response.data.data;
    if (type === "detail") {
      dialogVisible.title = "销售资源详情";
      detailFormData.value = row;
    } else {
      dialogVisible.title = "编辑销售资源";
      Object.assign(formData, row);
    }
  } else {
    dialogVisible.title = "新增销售资源";
    await resetForm();
  }
  dialogVisible.visible = true;
}

function buildSubmitPayload(): MarketingResourceForm {
  return {
    month_period: formData.month_period || undefined,
    resource_acquired_at: formData.resource_acquired_at || undefined,
    contact_name: formData.contact_name?.trim() || undefined,
    phone: formData.phone?.trim() || undefined,
    resource_source: formData.resource_source?.trim() || undefined,
    resource_path: formData.resource_path?.trim() || undefined,
    owner_id: formData.owner_id ?? null,
    lead_question: formData.lead_question?.trim() || undefined,
    is_wechat_added: formData.is_wechat_added ?? null,
    is_deal_closed: formData.is_deal_closed ?? null,
    deal_amount: formData.deal_amount ?? null,
    wechat_id: formData.wechat_id?.trim() || undefined,
    customer_profile: formData.customer_profile?.trim() || undefined,
    customer_demand: formData.customer_demand?.trim() || undefined,
    planned_recommendation: formData.planned_recommendation?.trim() || undefined,
    importance: formData.importance || "normal",
    description: formData.description?.trim() || undefined,
  };
}

async function handleSubmit() {
  dataFormRef.value?.validate(async (valid: boolean) => {
    if (!valid) {
      activeTab.value = "basic";
      return;
    }
    const submitData = buildSubmitPayload();
    const id = formData.id;
    try {
      if (id) {
        await MarketingResourcesAPI.update(id, submitData);
      } else {
        await MarketingResourcesAPI.create(submitData);
      }
      dialogVisible.visible = false;
      await resetForm();
      refreshList();
    } catch (error: unknown) {
      console.error(error);
    }
  });
}

async function handleFeishuImport() {
  try {
    await ElMessageBox.confirm(
      "将从飞书 Wiki 导入「小鹅通客户名单」与「资源统计」到数据库，是否继续？",
      "飞书导入",
      { type: "warning", confirmButtonText: "导入", cancelButtonText: "取消" }
    );
  } catch {
    return;
  }
  feishuImportLoading.value = true;
  try {
    const res = await MarketingResourcesAPI.importFeishu();
    const d = res.data.data;
    const x = d?.xiaoe;
    const m = d?.marketing;
    ElMessage.success(
      `导入完成：小鹅通 新增${x?.created ?? 0}/更新${x?.updated ?? 0}；资源 新增${m?.created ?? 0}`
    );
    refreshList();
  } catch (e: unknown) {
    console.error(e);
  } finally {
    feishuImportLoading.value = false;
  }
}

onMounted(async () => {
  await dictStore.getDict(["crm_marketing_resources_importance"]);
  refreshList();
});
</script>

<style lang="scss" scoped>
.mt-4 {
  margin-top: 16px;
}
.w-full {
  width: 100%;
}
</style>
