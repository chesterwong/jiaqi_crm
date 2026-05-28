<!-- 客户中心：页面路由 /module_crm/customers_list ；原型布局改造 -->
<template>
  <div class="customer-center cc-page">
    <!-- 统计卡片 -->
    <div class="cc-stats">
      <div v-for="s in statList" :key="s.label" class="cc-stat-card">
        <div class="cc-stat-icon" :class="s.colorClass">
          <el-icon :size="20"><component :is="s.icon" /></el-icon>
        </div>
        <div class="cc-stat-body">
          <div class="cc-stat-label">{{ s.label }}</div>
          <div class="cc-stat-value" :class="s.colorClass">{{ s.value }}</div>
        </div>
      </div>
    </div>

    <!-- 主体卡片 -->
    <el-card shadow="never" class="cc-main-card">
      <PageSearch
        ref="searchRef"
        :search-config="searchConfig"
        @query-click="handleQueryClick"
        @reset-click="handleResetClick"
      />

      <PageContent
        ref="contentRef"
        :content-config="contentConfig"
        @add-click="handleOpenDialog('create')"
      >
        <template #toolbar="{ toolbarRight, onToolbar, removeIds, cols }">
          <CrudToolbarLeft
            :remove-ids="removeIds"
            :perm-create="['module_crm:customers_list:create']"
            :perm-delete="['module_crm:customers_list:delete']"
            :perm-patch="['module_crm:customers_list:patch']"
            @add="handleOpenDialog('create')"
            @delete="onToolbar('delete')"
            @more="handleMoreClick"
          />
          <!-- 页签（位于工具栏中间） -->
          <el-tabs v-model="mainPageTab" class="cc-tabs" @tab-click="handleTabClick">
            <el-tab-pane v-for="t in tabList" :key="t.key" :name="t.key">
              <template #label>
                <span class="cc-tab-label">
                  <el-icon class="cc-tab-icon"><component :is="t.icon" /></el-icon>
                  {{ t.label }}
                </span>
              </template>
            </el-tab-pane>
          </el-tabs>
          <div class="data-table__toolbar--right">
            <CrudToolbarRight :buttons="toolbarRight" :cols="cols" :on-toolbar="onToolbar" />
          </div>
        </template>

        <template #table="{ data, loading, tableRef, onSelectionChange, pagination }">
          <div class="data-table__content">
            <el-table
              :ref="tableRef as any"
              v-loading="loading"
              :data="data"
              height="100%"
              stripe
              highlight-current-row
              @selection-change="onSelectionChange"
              @row-click="handleRowClick"
            >
              <template #empty>
                <el-empty :image-size="80" description="暂无数据" />
              </template>
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'selection')?.show"
                type="selection"
                min-width="55"
                align="center"
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'index')?.show"
                fixed
                label="序号"
                min-width="60"
              >
                <template #default="scope">
                  {{ (pagination.currentPage - 1) * pagination.pageSize + scope.$index + 1 }}
                </template>
              </el-table-column>
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'customer_code')?.show"
                label="客户编号"
                prop="customer_code"
                min-width="140"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'customer_name')?.show"
                label="客户名称"
                prop="customer_name"
                min-width="140"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'customer_type')?.show"
                label="客户类型"
                prop="customer_type"
                min-width="120"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'industry')?.show"
                label="行业"
                prop="industry"
                min-width="120"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'scale')?.show"
                label="规模"
                prop="scale"
                min-width="100"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'source')?.show"
                label="来源"
                prop="source"
                min-width="100"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'customer_status')?.show"
                label="状态"
                prop="customer_status"
                min-width="90"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'owner_id')?.show"
                label="负责人"
                prop="owner_id"
                min-width="100"
                show-overflow-tooltip
              >
                <template #default="scope">
                  <el-tag size="small">{{ scope.row.created_by?.name || "--" }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'customer_level')?.show"
                label="等级"
                prop="customer_level"
                min-width="80"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'total_revenue')?.show"
                label="总营收"
                prop="total_revenue"
                min-width="120"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'health_score')?.show"
                label="健康度"
                min-width="130"
                align="center"
              >
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
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'churn_risk')?.show"
                label="流失风险"
                prop="churn_risk"
                min-width="100"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'next_followup_at')?.show"
                label="下次跟进"
                prop="next_followup_at"
                min-width="160"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'created_time')?.show"
                label="创建时间"
                prop="created_time"
                min-width="160"
                show-overflow-tooltip
              />
              <el-table-column
                v-if="contentCols.find((col) => col.prop === 'operation')?.show"
                fixed="right"
                label="操作"
                align="center"
                min-width="200"
              >
                <template #default="scope">
                  <el-button
                    v-hasPerm="['module_crm:customers_list:detail']"
                    type="primary"
                    size="small"
                    link
                    @click.stop="handleOpenDetailDrawer(scope.row['id'])"
                  >
                    详情
                  </el-button>
                  <el-button
                    v-hasPerm="['module_crm:customers_list:update']"
                    type="primary"
                    size="small"
                    link
                    @click.stop="handleOpenDialog('update', scope.row['id'])"
                  >
                    编辑
                  </el-button>
                  <el-button
                    v-hasPerm="['module_crm:customers_list:delete']"
                    type="danger"
                    size="small"
                    link
                    @click.stop="handleRowDelete(scope.row['id'])"
                  >
                    删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </div>
        </template>
      </PageContent>
    </el-card>

    <EnhancedDialog
      v-model="dialogVisible.visible"
      :title="dialogVisible.title"
      width="960px"
      top="3vh"
      @close="handleCloseDialog"
    >
      <template v-if="dialogVisible.type === 'update'">
        <FormTabs
          ref="formTabsRef"
          v-model:active-tab="activeTab"
          :tabs="tabTabs"
          :tab-statuses="tabStatuses"
          mode="edit"
          lazy
          @submit="handleSubmit"
        >
          <template #tab-basic-info>
            <TabBasicInfo
              :ref="setTabRef('basic-info')"
              v-model:model-value="formData"
              mode="edit"
            />
          </template>
          <template #tab-company-contact>
            <TabCompanyContact
              :ref="setTabRef('company-contact')"
              v-model:model-value="formData"
              mode="edit"
            />
          </template>
          <template #tab-biz-relation>
            <TabBizRelation
              :ref="setTabRef('biz-relation')"
              v-model:model-value="formData"
              mode="edit"
            />
          </template>
          <template #tab-finance-info>
            <TabFinanceInfo
              :ref="setTabRef('finance-info')"
              v-model:model-value="formData"
              mode="edit"
            />
          </template>
          <template #tab-follow-extra>
            <TabFollowExtra
              :ref="setTabRef('follow-extra')"
              v-model:model-value="formData"
              mode="edit"
            />
          </template>
        </FormTabs>
      </template>
      <template v-else-if="dialogVisible.type === 'create'">
        <TabBasicInfo ref="basicInfoFormRef" v-model:model-value="formData" mode="create" />
        <div class="create-form-footer">
          <el-button type="primary" @click="handleCreateSubmit">提交</el-button>
        </div>
      </template>
    </EnhancedDialog>

    <!-- 详情抽屉 -->
    <el-drawer
      v-model="drawerVisible"
      :title="drawerTitle"
      :size="drawerWidth"
      direction="rtl"
      :before-close="handleCloseDrawer"
      :modal="false"
      :close-on-click-modal="false"
    >
      <!-- 拖拽缩放手柄 -->
      <div
        class="drawer-resize-handle"
        :class="{ 'is-dragging': isResizing }"
        @mousedown="onDrawerResizeStart"
      ></div>
      <FormTabs
        v-model:active-tab="activeTab"
        :tabs="detailTabs"
        :tab-statuses="tabStatuses"
        mode="view"
        lazy
      >
        <template #tab-basic-info>
          <TabBasicInfo :model-value="detailFormData" mode="view" />
        </template>
        <template #tab-company-contact>
          <TabCompanyContact :model-value="detailFormData" mode="view" />
        </template>
        <template #tab-biz-relation>
          <TabBizRelation :model-value="detailFormData" mode="view" />
        </template>
        <template #tab-finance-info>
          <TabFinanceInfo :model-value="detailFormData" mode="view" />
        </template>
        <template #tab-follow-extra>
          <TabFollowExtra :model-value="detailFormData" mode="view" />
        </template>
        <!-- 子表 Tab（仅详情） -->
        <template #tab-sub-contacts>
          <EntitySubTable
            title="联系人列表"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) => CrmContactsAPI.listCrmContacts(params as any)
            "
            :columns="contactsColumns"
          />
        </template>
        <template #tab-sub-addresses>
          <EntitySubTable
            title="地址列表"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerAddressesAPI.listCrmCustomerAddresses(params as any)
            "
            :columns="addressesColumns"
          />
        </template>
        <template #tab-sub-tags>
          <EntitySubTable
            title="标签列表"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerTagsAPI.listCrmCustomerTags(params as any)
            "
            :columns="tagsColumns"
          />
        </template>
        <template #tab-sub-attachments>
          <EntitySubTable
            title="附件列表"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerAttachmentsAPI.listCrmCustomerAttachments(params as any)
            "
            :columns="attachmentsColumns"
          />
        </template>
        <template #tab-sub-change-logs>
          <EntitySubTable
            title="变更日志"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerChangeLogsAPI.listCrmCustomerChangeLogs(params as any)
            "
            :columns="changeLogsColumns"
          />
        </template>
        <template #tab-sub-health-scores>
          <EntitySubTable
            title="健康评分记录"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerHealthScoresAPI.listCrmCustomerHealthScores(params as any)
            "
            :columns="healthScoresColumns"
          />
        </template>
        <template #tab-sub-timeline>
          <EntitySubTable
            title="客户动态"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerTimelineAPI.listCrmCustomerTimeline(params as any)
            "
            :columns="timelineColumns"
          />
        </template>
        <template #tab-sub-profiles>
          <EntitySubTable
            title="客户画像"
            :customer-id="detailFormData.id"
            :fetch-api="
              (params: Record<string, any>) =>
                CrmCustomerProfilesAPI.listCrmCustomerProfiles(params as any)
            "
            :columns="profilesColumns"
          />
        </template>
      </FormTabs>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
defineOptions({
  name: "CrmCustomers",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, watch, markRaw, nextTick, computed } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox, ElMessage } from "element-plus";
import {
  User,
  List,
  Clock,
  Star,
  FolderOpened,
  WarningFilled,
  CircleCheckFilled,
} from "@element-plus/icons-vue";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmCustomersAPI, {
  CrmCustomersPageQuery,
  CrmCustomersTable,
  CrmCustomersForm,
  SYSTEM_FIELDS,
  DICT_TYPE_MAP,
} from "@/api/module_crm/customers_list";
import CrudToolbarLeft from "@/components/CURD/CrudToolbarLeft.vue";
import CrudToolbarRight from "@/components/CURD/CrudToolbarRight.vue";
import PageSearch from "@/components/CURD/PageSearch.vue";
import PageContent from "@/components/CURD/PageContent.vue";
import EnhancedDialog from "@/components/CURD/EnhancedDialog.vue";
import { useCrudList } from "@/components/CURD/useCrudList";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";
import type { IContentConfig, ISearchConfig } from "@/components/CURD/types";
import FormTabs from "@/components/FormTabs/FormTabs.vue";
import type { TabConfig } from "@/components/FormTabs/FormTabs.vue";
import TabBasicInfo from "./components/TabBasicInfo.vue";
import TabCompanyContact from "./components/TabCompanyContact.vue";
import TabBizRelation from "./components/TabBizRelation.vue";
import TabFinanceInfo from "./components/TabFinanceInfo.vue";
import TabFollowExtra from "./components/TabFollowExtra.vue";
import EntitySubTable from "@/components/CRM/EntitySubTable.vue";
import type { SubTableColumn } from "@/components/CRM/EntitySubTable.vue";

// 子表 API 导入
import CrmContactsAPI from "@/api/module_crm/customers_contacts";
import CrmCustomerAddressesAPI from "@/api/module_crm/customers_addresses";
import CrmCustomerTagsAPI from "@/api/module_crm/customers_tags";
import CrmCustomerAttachmentsAPI from "@/api/module_crm/customers_attachments";
import CrmCustomerChangeLogsAPI from "@/api/module_crm/customers_change_logs";
import CrmCustomerHealthScoresAPI from "@/api/module_crm/customers_health_scores";
import CrmCustomerTimelineAPI from "@/api/module_crm/customers_timeline";
import CrmCustomerProfilesAPI from "@/api/module_crm/customers_profiles";

const { searchRef, contentRef, handleQueryClick, handleResetClick, refreshList } = useCrudList();

// ========== 主页面页签 ==========
const mainPageTab = ref("my");

const tabList = [
  { key: "my", label: "我的客户", icon: markRaw(User) },
  { key: "today", label: "今日待跟", icon: markRaw(Clock) },
  { key: "high_value", label: "高价值", icon: markRaw(Star) },
  { key: "public", label: "公海客户", icon: markRaw(WarningFilled) },
  { key: "all", label: "全部客户", icon: markRaw(List) },
  { key: "team", label: "团队客户", icon: markRaw(FolderOpened) },
];

// ========== 统计卡片（mock 数据，后续对接 API） ==========
const statList = ref([
  { label: "客户总数", value: "1,286", icon: markRaw(FolderOpened), colorClass: "cc-stat--primary" },
  { label: "今日待跟", value: "23", icon: markRaw(Clock), colorClass: "cc-stat--warning" },
  { label: "高价值", value: "156", icon: markRaw(Star), colorClass: "cc-stat--success" },
  { label: "公海客户", value: "89", icon: markRaw(User), colorClass: "cc-stat--info" },
]);

function healthBarClass(score: number | undefined) {
  if (score == null) return "cc-health--none";
  if (score >= 80) return "cc-health--high";
  if (score >= 60) return "cc-health--mid";
  return "cc-health--low";
}
function handleTabClick(tab: any) {
  mainPageTab.value = tab.paneName;
  handleQueryClick({});
}

/** 数据表主键字段名（与导入表结构一致，避免非 id 主键时操作错行） */
const PK = "id" as const;

// ========== 草稿缓存 ==========
const DRAFT_KEY = "crm_customers_draft";
let draftTimer: ReturnType<typeof setTimeout> | null = null;
/** 是否有已保存的草稿（用于 UI 指示器） */
const draftSaved = ref(false);

function saveDraft() {
  if (dialogVisible.type !== "create" && dialogVisible.type !== "update") return;
  const hasData = Object.values(formData).some((v) => v !== undefined && v !== null && v !== "");
  if (!hasData) {
    draftSaved.value = false;
    return;
  }
  localStorage.setItem(
    DRAFT_KEY,
    JSON.stringify({ ...formData, __draft_type: dialogVisible.type })
  );
  draftSaved.value = true;
}

function autoSaveDraft() {
  if (draftTimer) clearTimeout(draftTimer);
  draftTimer = setTimeout(saveDraft, 2000);
}

function clearDraft() {
  localStorage.removeItem(DRAFT_KEY);
  draftSaved.value = false;
}

function hasDraft(): boolean {
  try {
    const raw = localStorage.getItem(DRAFT_KEY);
    if (!raw) return false;
    const data = JSON.parse(raw);
    return data && data.__draft_type === "create";
  } catch {
    return false;
  }
}

function restoreDraft(): boolean {
  try {
    const raw = localStorage.getItem(DRAFT_KEY);
    if (!raw) return false;
    const data = JSON.parse(raw);
    if (data.__draft_type !== "create") return false;
    Object.keys(formData).forEach((key) => {
      if (key in data && data[key] !== undefined) {
        (formData as any)[key] = data[key];
      }
    });
    return true;
  } catch {
    return false;
  }
}

// ========== FormTabs 页签配置 ==========
const activeTab = ref("basic-info");
const formTabsRef = ref();
const tabRefMap: Record<string, any> = {};
/** 新增模式下的基本信息表单引用（单页无页签） */
const basicInfoFormRef = ref();

// 切换页签时重置成功状态，避免残留绿色勾
watch(activeTab, (newTab, oldTab) => {
  if (oldTab && tabStatuses[oldTab] === "success") {
    tabStatuses[oldTab] = "normal";
  }
});

const tabTabs: TabConfig[] = [
  { name: "basic-info", label: "基本信息", stepTitle: "基本信息" },
  { name: "company-contact", label: "工商联系", stepTitle: "工商联系" },
  { name: "biz-relation", label: "业务关系", stepTitle: "业务关系" },
  { name: "finance-info", label: "财务数据", stepTitle: "财务数据" },
  { name: "follow-extra", label: "跟进扩展", stepTitle: "跟进扩展" },
];

const tabStatuses = reactive<Record<string, "error" | "success" | "normal">>({
  "basic-info": "normal",
  "company-contact": "normal",
  "biz-relation": "normal",
  "finance-info": "normal",
  "follow-extra": "normal",
});

// ── 子表 Tab 配置（仅详情模式显示）──

const subTableTabs: TabConfig[] = [
  { name: "sub-contacts", label: "联系人", stepTitle: "联系人" },
  { name: "sub-addresses", label: "地址", stepTitle: "地址" },
  { name: "sub-tags", label: "标签", stepTitle: "标签" },
  { name: "sub-attachments", label: "附件", stepTitle: "附件" },
  { name: "sub-change-logs", label: "变更日志", stepTitle: "变更日志" },
  { name: "sub-health-scores", label: "健康评分", stepTitle: "健康评分" },
  { name: "sub-timeline", label: "动态", stepTitle: "动态" },
  { name: "sub-profiles", label: "客户画像", stepTitle: "客户画像" },
];

// 子表列定义
const contactsColumns: SubTableColumn[] = [
  { prop: "contact_name", label: "姓名", minWidth: 100 },
  { prop: "position", label: "职位", minWidth: 100 },
  { prop: "mobile", label: "手机", minWidth: 120 },
  { prop: "email", label: "邮箱", minWidth: 150 },
  { prop: "is_primary", label: "首要联系人", minWidth: 100 },
];

const addressesColumns: SubTableColumn[] = [
  { prop: "address_type", label: "地址类型", minWidth: 100 },
  { prop: "address_name", label: "地址名称", minWidth: 120 },
  { prop: "province", label: "省", minWidth: 80 },
  { prop: "city", label: "市", minWidth: 80 },
  { prop: "district", label: "区", minWidth: 80 },
  { prop: "detail_address", label: "详细地址", minWidth: 200 },
];

const tagsColumns: SubTableColumn[] = [
  { prop: "tag_id", label: "标签ID", minWidth: 80 },
  { prop: "tag_source", label: "来源", minWidth: 100 },
  { prop: "confidence", label: "置信度", minWidth: 80 },
];

const attachmentsColumns: SubTableColumn[] = [
  { prop: "file_name", label: "文件名", minWidth: 180 },
  { prop: "file_type", label: "文件类型", minWidth: 100 },
  { prop: "file_size", label: "大小", minWidth: 80 },
  { prop: "uploader_id", label: "上传人", minWidth: 80 },
  { prop: "uploaded_at", label: "上传时间", minWidth: 160 },
];

const changeLogsColumns: SubTableColumn[] = [
  { prop: "field_name", label: "字段", minWidth: 120 },
  { prop: "field_label", label: "字段名", minWidth: 100 },
  { prop: "old_value", label: "旧值", minWidth: 150 },
  { prop: "new_value", label: "新值", minWidth: 150 },
  { prop: "operator_name", label: "操作人", minWidth: 80 },
  { prop: "changed_at", label: "变更时间", minWidth: 160 },
];

const healthScoresColumns: SubTableColumn[] = [
  { prop: "overall_score", label: "综合评分", minWidth: 100 },
  { prop: "health_level", label: "健康等级", minWidth: 100 },
  { prop: "score_date", label: "评分日期", minWidth: 120 },
  { prop: "churn_probability", label: "流失概率", minWidth: 100 },
];

const timelineColumns: SubTableColumn[] = [
  { prop: "event_type", label: "事件类型", minWidth: 100 },
  { prop: "event_category", label: "事件分类", minWidth: 100 },
  { prop: "title", label: "标题", minWidth: 180 },
  { prop: "operator_name", label: "操作人", minWidth: 80 },
];

const profilesColumns: SubTableColumn[] = [
  { prop: "lifetime_value", label: "生命周期价值", minWidth: 130 },
  { prop: "churn_probability", label: "流失概率", minWidth: 100 },
  { prop: "upsell_probability", label: "增购概率", minWidth: 100 },
  { prop: "confidence_score", label: "置信度", minWidth: 80 },
  { prop: "last_analysis_at", label: "最后分析", minWidth: 160 },
];

// 详情模式下合并所有 Tab
// 详情模式下合并所有 Tab（显示所有页签+子表）
const detailTabs = computed<TabConfig[]>(() => [...tabTabs, ...subTableTabs]);

function setTabRef(name: string) {
  return (el: any) => {
    if (el) tabRefMap[name] = el;
  };
}

async function validateAllTabs(): Promise<boolean> {
  const results = await Promise.all(
    tabTabs.map(async (tab) => {
      const comp = tabRefMap[tab.name];
      if (!comp?.formRef) return true;
      return new Promise<boolean>((resolve) => {
        comp.formRef.validate((valid: boolean) => {
          tabStatuses[tab.name] = valid ? "success" : "error";
          resolve(valid);
        });
      });
    })
  );
  const firstError = results.findIndex((r) => !r);
  if (firstError >= 0) {
    activeTab.value = tabTabs[firstError].name;
    return false;
  }
  return true;
}

function triggerUserSearch() {
  nextTick(() => refreshList());
}

const searchConfig = reactive<ISearchConfig>({
  permPrefix: "module_crm:customers_list",
  colon: true,
  isExpandable: true,
  showNumber: 3,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "customer_code",
      label: "客户编号",
      type: "input",
      attrs: { placeholder: "请输入客户编号", clearable: true },
    },
    {
      prop: "customer_name",
      label: "客户名称",
      type: "input",
      attrs: { placeholder: "请输入客户名称", clearable: true },
    },
    {
      prop: "customer_type",
      label: "客户类型",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择客户类型", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "industry",
      label: "所属行业",
      type: "input",
      attrs: { placeholder: "请输入所属行业", clearable: true },
    },
    {
      prop: "source",
      label: "客户来源",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择客户来源", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "customer_status",
      label: "客户状态",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择客户状态", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "customer_level",
      label: "客户等级",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择客户等级", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "scale",
      label: "企业规模",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择企业规模", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "owner_id",
      label: "负责人",
      type: "user-table-select",
      initialValue: null,
      events: {
        "confirm-click": triggerUserSearch,
        "clear-click": triggerUserSearch,
      },
    },
    {
      prop: "churn_risk",
      label: "流失风险",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择流失风险", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "health_score",
      label: "健康度评分",
      type: "select",
      options: [],
      attrs: { placeholder: "请选择健康度评分", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "next_followup_at",
      label: "下次跟进时间",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择下次跟进时间",
      },
    },
    {
      prop: "created_time",
      label: "创建时间",
      type: "date-picker",
      initialValue: [],
      attrs: {
        type: "datetimerange",
        valueFormat: "YYYY-MM-DD HH:mm:ss",
        rangeSeparator: "至",
        startPlaceholder: "开始",
        endPlaceholder: "结束",
      },
    },
  ],
  customComponents: {
    "user-table-select": markRaw(UserTableSelect),
  },
});

const contentCols = reactive<
  Array<{
    prop?: string;
    label?: string;
    show?: boolean;
  }>
>([
  { prop: "selection", label: "选择框", show: true },
  { prop: "index", label: "序号", show: true },
  { prop: "customer_code", label: "客户编号", show: true },
  { prop: "customer_name", label: "客户名称", show: true },
  { prop: "customer_type", label: "客户类型", show: true },
  { prop: "industry", label: "所属行业", show: true },
  { prop: "source", label: "客户来源", show: true },
  { prop: "customer_status", label: "客户状态", show: true },
  { prop: "owner_id", label: "负责人", show: true },
  { prop: "customer_level", label: "客户等级", show: true },
  { prop: "scale", label: "企业规模", show: true },
  { prop: "total_revenue", label: "总营收", show: true },
  { prop: "health_score", label: "健康度", show: true },
  { prop: "churn_risk", label: "流失风险", show: true },
  { prop: "last_followup_at", label: "最后跟进", show: false },
  { prop: "next_followup_at", label: "下次跟进", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  // 以下为系统/内部字段，默认隐藏
  { prop: "department_id", label: "所属部门ID", show: false },
  { prop: "lead_id", label: "来源线索ID", show: false },
  { prop: "pool_status", label: "公海池状态", show: false },
  { prop: "updated_time", label: "更新时间", show: false },
  { prop: "created_id", label: "创建人ID", show: false },
  { prop: "updated_id", label: "更新人ID", show: false },
  { prop: "customer_short_name", label: "客户简称", show: false },
  { prop: "registration_no", label: "工商注册号", show: false },
  { prop: "tax_no", label: "税号", show: false },
  { prop: "legal_person", label: "法人代表", show: false },
  { prop: "established_date", label: "成立日期", show: false },
  { prop: "registered_capital", label: "注册资本", show: false },
  { prop: "paid_capital", label: "实缴资本", show: false },
  { prop: "website", label: "公司网站", show: false },
  { prop: "main_phone", label: "主联系电话", show: false },
  { prop: "main_email", label: "主联系邮箱", show: false },
  { prop: "country", label: "国家", show: false },
  { prop: "province", label: "省份", show: false },
  { prop: "city", label: "城市", show: false },
  { prop: "district", label: "区县", show: false },
  { prop: "address", label: "详细地址", show: false },
  { prop: "rating", label: "客户评分", show: false },
  { prop: "territory", label: "所属区域", show: false },
  { prop: "customer_since", label: "成为客户时间", show: false },
  { prop: "first_order_date", label: "首单日期", show: false },
  { prop: "last_order_date", label: "最后订单日期", show: false },
  { prop: "total_orders", label: "总订单数", show: false },
  { prop: "credit_limit", label: "信用额度", show: false },
  { prop: "outstanding_amount", label: "欠款金额", show: false },
  { prop: "payment_days", label: "账期天数", show: false },
  { prop: "parent_customer_id", label: "父客户ID", show: false },
  { prop: "is_parent", label: "是否父客户", show: false },
  { prop: "customer_segment", label: "客户分群", show: false },
  { prop: "description", label: "备注/描述", show: false },
  { prop: "extra_data", label: "扩展数据(JSONB)", show: false },
  { prop: "version", label: "版本号(乐观锁)", show: false },
  { prop: "protection_deadline", label: "保护期截止时间", show: false },
  { prop: "claim_time", label: "领取时间", show: false },
  { prop: "duplicate_check_key", label: "查重键", show: false },
  { prop: "is_deleted", label: "是否已删除", show: false },
  { prop: "deleted_time", label: "删除时间", show: false },
  { prop: "deleted_id", label: "删除人ID", show: false },
  { prop: "status", label: "系统状态", show: false },
  { prop: "dept_id", label: "所属部门ID", show: false },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmCustomersQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmCustomersPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmCustomersPageQuery>>({
  permPrefix: "module_crm:customers_list",
  hideColumnFilter: false,
  initialFetch: false,
  cols: contentCols as IContentConfig["cols"],
  toolbar: [],
  defaultToolbar: ["import", "export", "patch", "refresh", "filter"],
  pagination: {
    pageSize: 10,
    pageSizes: [10, 20, 30, 50],
  },
  request: { page_no: "page_no", page_size: "page_size" },
  indexAction: async (params) => {
    const res = await CrmCustomersAPI.listCrmCustomers(
      normalizeCrmCustomersQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmCustomersAPI.deleteCrmCustomers(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmCustomersAPI.downloadTemplateCrmCustomers(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmCustomersAPI.importCrmCustomers(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmCustomersPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmCustomersTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmCustomersAPI.listCrmCustomers(
          normalizeCrmCustomersQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

const detailFormData = ref<CrmCustomersTable>({});

/** 详情抽屉 */
const drawerVisible = ref(false);
const isResizing = ref(false);

/** 持久化抽屉宽度 */
const DRAWER_WIDTH_KEY = "crm_customers_list_drawer_width";
function loadDrawerWidth(): string {
  try {
    return localStorage.getItem(DRAWER_WIDTH_KEY) || "80%";
  } catch {
    return "80%";
  }
}
function saveDrawerWidth(val: string) {
  try {
    localStorage.setItem(DRAWER_WIDTH_KEY, val);
  } catch {
    /* noop */
  }
}
const drawerWidth = ref(loadDrawerWidth());

const drawerTitle = computed(() => {
  const name = detailFormData.value.customer_name;
  return name ? `客户详情 - ${name}` : '客户详情';
});

function handleCloseDrawer() {
  drawerVisible.value = false;
}

/** 当前在抽屉中展示的客户 ID（用于行高亮） */
const activeDrawerCustomerId = ref<number | null>(null);

async function handleOpenDetailDrawer(id: number) {
  const response = await CrmCustomersAPI.detailCrmCustomers(id);
  // 全量替换避免旧字段残留
  detailFormData.value = response.data.data as CrmCustomersTable;
  activeDrawerCustomerId.value = id;
  if (!drawerVisible.value) {
    // 首次打开：重置到首个 tab、恢复保存的宽度
    activeTab.value = 'basic-info';
    drawerWidth.value = loadDrawerWidth();
    drawerVisible.value = true;
  }
  // 已打开时：保持当前 tab 和宽度不变，仅刷新数据
}

/** 抽屉拖拽缩放 */
function onDrawerResizeStart(e: MouseEvent) {
  e.preventDefault();
  isResizing.value = true;
  document.body.style.cursor = 'col-resize';
  document.body.style.userSelect = 'none';

  const startX = e.clientX;
  let currentPercent = parseFloat(drawerWidth.value);
  if (drawerWidth.value.endsWith('px')) {
    currentPercent = (currentPercent / window.innerWidth) * 100;
  }

  function onMove(ev: MouseEvent) {
    const deltaX = startX - ev.clientX;
    const newPercent = Math.max(25, Math.min(95, currentPercent + (deltaX / window.innerWidth) * 100));
    drawerWidth.value = Math.round(newPercent) + '%';
  }

  function onUp() {
    isResizing.value = false;
    document.body.style.cursor = '';
    document.body.style.userSelect = '';
    saveDrawerWidth(drawerWidth.value);
    document.removeEventListener('mousemove', onMove);
    document.removeEventListener('mouseup', onUp);
  }

  document.addEventListener('mousemove', onMove);
  document.addEventListener('mouseup', onUp);
}

const formData = reactive<CrmCustomersForm>({
  customer_code: undefined,
  customer_name: undefined,
  customer_type: undefined,
  industry: undefined,
  source: undefined,
  customer_status: undefined,
  owner_id: undefined,
  department_id: undefined,
  lead_id: undefined,
  pool_status: undefined,
  last_followup_at: undefined,
  next_followup_at: undefined,
  customer_short_name: undefined,
  customer_level: undefined,
  scale: undefined,
  registration_no: undefined,
  tax_no: undefined,
  legal_person: undefined,
  established_date: undefined,
  registered_capital: undefined,
  paid_capital: undefined,
  website: undefined,
  main_phone: undefined,
  main_email: undefined,
  country: undefined,
  province: undefined,
  city: undefined,
  district: undefined,
  address: undefined,
  rating: undefined,
  territory: undefined,
  customer_since: undefined,
  first_order_date: undefined,
  last_order_date: undefined,
  total_revenue: undefined,
  total_orders: undefined,
  credit_limit: undefined,
  outstanding_amount: undefined,
  payment_days: undefined,
  parent_customer_id: undefined,
  is_parent: undefined,
  customer_segment: undefined,
  churn_risk: undefined,
  description: undefined,
  extra_data: undefined,
  version: undefined,
  protection_deadline: undefined,
  claim_time: undefined,
  health_score: undefined,
  duplicate_check_key: undefined,
});

// ========== 草稿自动保存（监听 formData 变化） ==========
watch(
  formData,
  () => {
    if (
      dialogVisible.visible &&
      (dialogVisible.type === "create" || dialogVisible.type === "update")
    ) {
      autoSaveDraft();
    }
  },
  { deep: true }
);

const dialogVisible = reactive({
  title: "",
  visible: false,
  type: "create" as "create" | "update",
});

const dictStore = useDictStore();
const dictTypes: string[] = Object.values(DICT_TYPE_MAP);

function handleRowDelete(id: number) {
  contentRef.value?.handleDelete(id);
}

/** 点击表格行打开详情抽屉 */
function handleRowClick(row: CrmCustomersTable) {
  const id = row[PK];
  if (id != null) {
    handleOpenDetailDrawer(id);
  }
}

async function resetForm() {
  draftSaved.value = false;
  Object.keys(formData).forEach((key) => {
    (formData as any)[key] = undefined;
  });
  // 重置页签状态
  Object.keys(tabStatuses).forEach((key) => {
    tabStatuses[key] = "normal";
  });
  activeTab.value = "basic-info";
}

async function handleCloseDialog() {
  // 关闭前保存当前数据到草稿（防误关丢失）
  saveDraft();
  dialogVisible.visible = false;
  resetForm();
}

async function handleOpenDialog(type: "create" | "update", id?: number) {
  // 重置页签状态
  Object.keys(tabStatuses).forEach((key) => {
    tabStatuses[key] = "normal";
  });
  activeTab.value = "basic-info";
  dialogVisible.type = type;
  if (id) {
    const response = await CrmCustomersAPI.detailCrmCustomers(id);
    if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增客户中心";
    await resetForm();
    // 恢复未提交的草稿（防断网断电数据丢失）
    if (hasDraft()) {
      restoreDraft();
    }
    draftSaved.value = hasDraft();
  }
  dialogVisible.visible = true;
}

async function handleSubmit() {
  const valid = await validateAllTabs();
  if (!valid) return;

  const FORM_AUDIT_FIELDS = [
    "created_time",
    "updated_time",
    "created_id",
    "updated_id",
    "created_by",
    "updated_by",
  ] as const;
  const submitData: Record<string, any> = { ...formData };
  // 过滤系统字段 + 审计字段
  [...SYSTEM_FIELDS, ...FORM_AUDIT_FIELDS].forEach((key) => {
    delete submitData[key];
  });

  const id = formData[PK] as number | undefined;
  try {
    if (id) {
      await CrmCustomersAPI.updateCrmCustomers(id, { ...submitData, [PK]: id });
    } else {
      await CrmCustomersAPI.createCrmCustomers(submitData);
    }
    dialogVisible.visible = false;
    await resetForm();
    clearDraft();
    refreshList();
  } catch (error: any) {
    console.error(error);
    // 提交失败时保存草稿，防止数据丢失
    saveDraft();
    ElMessage.error(error?.data?.msg || error?.message || "操作失败，请重试");
  }
}

/** 新增模式提交：只验证基本信息表单，提交新建 */
async function handleCreateSubmit() {
  if (!basicInfoFormRef.value?.formRef) return;

  const valid = await new Promise<boolean>((resolve) => {
    basicInfoFormRef.value.formRef.validate((valid: boolean) => {
      resolve(valid);
    });
  });
  if (!valid) return;

  const FORM_AUDIT_FIELDS = [
    "created_time",
    "updated_time",
    "created_id",
    "updated_id",
    "created_by",
    "updated_by",
  ] as const;
  const submitData: Record<string, any> = { ...formData };
  // 过滤系统字段 + 审计字段
  [...SYSTEM_FIELDS, ...FORM_AUDIT_FIELDS].forEach((key) => {
    delete submitData[key];
  });

  try {
    await CrmCustomersAPI.createCrmCustomers(submitData);
    dialogVisible.visible = false;
    await resetForm();
    clearDraft();
    refreshList();
  } catch (error: any) {
    console.error(error);
    // 提交失败时保存草稿，防止数据丢失
    saveDraft();
    ElMessage.error(error?.data?.msg || error?.message || "操作失败，请重试");
  }
}

async function handleMoreClick(status: string) {
  const rows = contentRef.value?.getSelectionData() ?? [];
  const ids = rows
    .map((r: Record<string, number | undefined>) => r[PK])
    .filter(Boolean) as number[];
  if (!ids.length) return;
  ElMessageBox.confirm(`确认${status === "0" ? "启用" : "停用"}该项数据?`, "警告", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(async () => {
      try {
        await CrmCustomersAPI.batchCrmCustomers({ ids, status });
        refreshList();
      } catch (error: unknown) {
        console.error(error);
      }
    })
    .catch(() => {
      ElMessageBox.close();
    });
}

onMounted(async () => {
  if (dictTypes.length > 0) {
    await dictStore.getDict(dictTypes);
    // 为搜索配置中的字典字段填充 select 选项
    if (searchConfig.formItems) {
      searchConfig.formItems.forEach((item: any) => {
        const dbDictType = DICT_TYPE_MAP[item.prop];
        if (dbDictType) {
          item.options = dictStore.getDictArray(dbDictType).map((d: any) => ({
            label: d.dict_label,
            value: d.dict_value,
          }));
        }
      });
    }
  }
  refreshList();
});
</script>

<style lang="scss" scoped>
// =========================================================
//  设计升级 - 基于 CRM 设计原型的视觉体系
//  色值参考：hsl(212 80% 42%) 主色, hsl(220 30% 97%) 背景
// =========================================================

// ---------- 动画 ----------
@keyframes cc-fade-in {
  from { opacity: 0; transform: translateY(6px); }
  to   { opacity: 1; transform: translateY(0); }
}

// ---------- 自定义滚动条 ----------
:deep(.cc-scrollbar) {
  &::-webkit-scrollbar { width: 6px; height: 6px; }
  &::-webkit-scrollbar-thumb {
    background: hsl(220 15% 85%);
    border-radius: 3px;
    &:hover { background: hsl(220 10% 70%); }
  }
}

// ========== 页面整体 ==========
.cc-page {
  animation: cc-fade-in 0.3s ease;
}
.customer-center {
  padding: 16px 20px;
  background: var(--el-bg-color-page, hsl(220 30% 97%));
  display: flex;
  flex-direction: column;
  height: 100%;
}

// ========== 统计卡片 ==========
.cc-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-bottom: 16px;
}
.cc-stat-card {
  background: #fff;
  border-radius: 10px;
  padding: 18px 20px;
  display: flex;
  align-items: center;
  gap: 16px;
  border: 1px solid var(--el-border-color-light, hsl(220 20% 88%));
  box-shadow: 0 1px 3px 0 hsl(220 25% 18% / 0.06);
  transition: box-shadow 0.2s ease, transform 0.2s ease;
  cursor: default;
  &:hover {
    box-shadow: 0 4px 12px 0 hsl(220 25% 18% / 0.10);
    transform: translateY(-2px);
  }
}
.cc-stat-icon {
  width: 44px;
  height: 44px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  &.cc-stat--primary { background: hsl(212 80% 96%); color: hsl(212 80% 42%); }
  &.cc-stat--warning { background: hsl(36 100% 95%); color: hsl(36 100% 50%); }
  &.cc-stat--success { background: hsl(142 52% 95%); color: hsl(142 52% 42%); }
  &.cc-stat--info    { background: hsl(220 20% 94%); color: hsl(220 10% 50%); }
}
.cc-stat-body {
  display: flex;
  flex-direction: column;
  gap: 2px;
}
.cc-stat-label {
  font-size: 13px;
  color: var(--el-text-color-secondary, hsl(220 10% 50%));
}
.cc-stat-value {
  font-size: 26px;
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.5px;
}
.cc-stat--primary { color: hsl(212 80% 42%); }
.cc-stat--warning { color: hsl(36 100% 50%); }
.cc-stat--success { color: hsl(142 52% 42%); }
.cc-stat--info    { color: hsl(220 10% 50%); }

// ========== 主体卡片 ==========
.cc-main-card {
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  flex: 1;
  min-height: 0;
  box-shadow: 0 1px 3px 0 hsl(220 25% 18% / 0.06);
  :deep(.el-card__body) {
    display: flex;
    flex-direction: column;
    flex: 1;
    min-height: 0;
    padding: 0 20px 20px;
  }
}

// ========== 搜索栏 ==========
:deep(.search-container) {
  flex-shrink: 0;
  .curd-page-search--flex {
    align-items: center;
    padding: 12px 0 4px;
    .el-form-item { margin-bottom: 8px; }
  }
}

// ========== 表格容器 ==========
:deep(.data-table) {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
  .data-table__content {
    flex: 1;
    min-height: 0;
  }
}

// ========== Borderless Table 风格（外边框去除，仅保留单元格底线） ==========
:deep(.el-table) {
  border: none;
  &::before { display: none; }          /* 去除表格上方伪元素边框 */
}
:deep(.el-table__inner-wrapper) {
  &::before { display: none; }          /* 去除内部伪元素边框 */
}
:deep(.el-table__border-left-patch) { display: none; }
:deep(.el-table--border) { border: none; }
:deep(.el-table__cell) {
  border-bottom: 1px solid var(--el-border-color-light, hsl(220 20% 88%));
}
:deep(.el-table__header-wrapper .el-table__cell) {
  background: hsl(220 30% 97%);
  font-weight: 600;
  font-size: 13px;
  color: hsl(220 10% 50%);
  border-bottom: 1px solid var(--el-border-color-light, hsl(220 20% 88%));
  padding: 10px 8px;
}
:deep(.el-table__body-wrapper .el-table__body tr.el-table__row) {
  transition: background-color 0.15s ease;
  &:hover > .el-table__cell {
    background-color: hsl(212 80% 97%);
  }
}
:deep(.el-table__body-wrapper .el-table__body tr.el-table__row--striped) {
  &:nth-child(even) > .el-table__cell {
    background-color: hsl(220 30% 98%);
  }
  &:hover > .el-table__cell {
    background-color: hsl(212 80% 96%) !important;
  }
}

// ========== 页签（工具栏中间） ==========
.cc-tabs {
  flex: 1;
  min-width: 0;
  margin: 0 16px;
  :deep(.el-tabs__header) { margin: 0; }
  :deep(.el-tabs__nav-wrap::after) { height: 0; }
  :deep(.el-tabs__item) {
    padding: 0 14px;
    height: 34px;
    line-height: 34px;
    font-size: 13px;
    transition: all 0.25s ease;
    border-radius: 6px 6px 0 0;
    &:hover {
      color: hsl(212 80% 42%);
      background: hsl(212 80% 96%);
    }
    &.is-active {
      font-weight: 600;
      color: hsl(212 80% 42%);
      background: hsl(212 80% 96%);
    }
  }
  :deep(.el-tabs__active-bar) {
    height: 2px;
    background: hsl(212 80% 42%);
    transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
  }
  :deep(.el-tabs__nav) {
    transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
  }
}
.cc-tab-label {
  display: inline-flex;
  align-items: center;
  gap: 5px;
}
.cc-tab-icon { font-size: 16px; }

// ========== 健康度进度条 ==========
.cc-health-bar {
  display: flex;
  align-items: center;
  gap: 6px;
}
.cc-health-track {
  flex: 1;
  height: 8px;
  background: var(--el-border-color-light, hsl(220 20% 88%));
  border-radius: 4px;
  overflow: hidden;
}
.cc-health-fill {
  height: 100%;
  border-radius: 4px;
  transition: width 0.3s ease;
}
.cc-health--high { background: hsl(142 52% 42%); }
.cc-health--mid  { background: hsl(36 100% 50%); }
.cc-health--low  { background: hsl(0 72% 51%); }
.cc-health--none { background: hsl(220 10% 70%); }
.cc-health-num {
  font-size: 13px;
  font-weight: 600;
  color: var(--el-text-color-primary, hsl(220 25% 18%));
  min-width: 32px;
}

// ========== 新增模式底部操作栏 ==========
.create-form-footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-top: 16px;
  margin-top: 16px;
  border-top: 1px solid var(--el-border-color-light);
}
.draft-indicator {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  margin-right: 12px;
  font-size: 13px;
  color: hsl(142 52% 42%);
}

// ========== 表格行交互 ==========
.el-table__row { cursor: pointer; }

/* 当前选中行高亮（抽屉打开时指示器） */
.el-table__row.current-row > .el-table__cell {
  background-color: hsl(212 80% 96%) !important;
  box-shadow: inset 3px 0 0 hsl(212 80% 42%);
}
.el-table__row.current-row .cc-tab-label,
.el-table__row.current-row .cc-health-num {
  font-weight: 600;
}

/* 操作列按钮保持默认指针 */
.el-table__row .el-button { cursor: pointer; }

// ========== 抽屉内容适配 ==========
.el-drawer__body {
  padding: 16px 20px;
  overflow: auto;
  position: relative;
}

// ========== 抽屉拖拽缩放手柄 ==========
.drawer-resize-handle {
  position: absolute;
  left: 0;
  top: 0;
  width: 5px;
  height: 100%;
  cursor: col-resize;
  z-index: 100;
  background: transparent;
  transition: background-color 0.15s;
  display: flex;
  align-items: center;
  justify-content: center;
}
.drawer-resize-handle::before {
  content: '';
  width: 2px;
  height: 32px;
  border-radius: 1px;
  background: var(--el-border-color);
  transition: background-color 0.15s, height 0.15s;
}
.drawer-resize-handle:hover::before,
.drawer-resize-handle.is-dragging::before {
  background: hsl(212 80% 42%);
  height: 48px;
}
.drawer-resize-handle:hover {
  background: hsl(212 80% 96%);
}

/* 无遮罩模式：抽屉左侧阴影线 */
:deep(.el-drawer) {
  border-left: 1px solid var(--el-border-color-light, hsl(220 20% 88%));
  box-shadow: -6px 0 20px hsl(220 25% 18% / 0.08);
}
:deep(.el-drawer__header) {
  margin-bottom: 0;
  padding-bottom: 14px;
  border-bottom: 1px solid var(--el-border-color-light, hsl(220 20% 88%));
}
</style>
