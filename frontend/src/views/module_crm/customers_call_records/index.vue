<!-- 通话记录：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_call_records -->
<template>
  <div class="app-container">
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
          :perm-create="['module_crm:customers_call_records:create']"
          :perm-delete="['module_crm:customers_call_records:delete']"
          :perm-patch="['module_crm:customers_call_records:patch']"
          @add="handleOpenDialog('create')"
          @delete="onToolbar('delete')"
          @more="handleMoreClick"
        />
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
            border
            stripe
            @selection-change="onSelectionChange"
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
              v-if="contentCols.find((col) => col.prop === 'customer_id')?.show"
              label="客户ID(关联crm_customers.id)"
              prop="customer_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'contact_id')?.show"
              label="联系人ID(关联crm_contacts.id)"
              prop="contact_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'call_type')?.show"
              label="通话类型(sales_followup/after_sales/negotiation/other)"
              prop="call_type"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'direction')?.show"
              label="通话方向(inbound:呼入/outbound:呼出)"
              prop="direction"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'phone_number')?.show"
              label="通话号码"
              prop="phone_number"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'duration_seconds')?.show"
              label="通话时长(秒)"
              prop="duration_seconds"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'call_time')?.show"
              label="通话时间"
              prop="call_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'summary')?.show"
              label="通话摘要"
              prop="summary"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'follow_up_action')?.show"
              label="后续跟进动作"
              prop="follow_up_action"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'follow_up_time')?.show"
              label="计划跟进时间"
              prop="follow_up_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'sentiment')?.show"
              label="客户情绪(positive/neutral/negative)"
              prop="sentiment"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'quality_score')?.show"
              label="通话质量评分"
              prop="quality_score"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_recorded')?.show"
              label="是否录音"
              prop="is_recorded"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'recording_url')?.show"
              label="录音文件URL"
              prop="recording_url"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'created_time')?.show"
              label="创建时间"
              prop="created_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'updated_time')?.show"
              label="更新时间"
              prop="updated_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'created_id')?.show"
              label="创建人ID(关联sys_user.id)"
              prop="created_id"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                <el-tag>{{ scope.row.created_by?.name }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'updated_id')?.show"
              label="更新人ID(关联sys_user.id)"
              prop="updated_id"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                <el-tag>{{ scope.row.updated_by?.name }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'deleted_id')?.show"
              label="删除人ID(关联sys_user.id)"
              prop="deleted_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_deleted')?.show"
              label="是否已删除(false:否 true:是)"
              prop="is_deleted"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'deleted_time')?.show"
              label="删除时间"
              prop="deleted_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'dept_id')?.show"
              label="所属部门ID(关联sys_dept.id)"
              prop="dept_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'owner_id')?.show"
              label="负责人ID(关联sys_user.id)"
              prop="owner_id"
              min-width="140"
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
                  v-hasPerm="['module_crm:customers_call_records:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row['id'])"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_call_records:update']"
                  type="primary"
                  size="small"
                  link
                  icon="Edit"
                  @click="handleOpenDialog('update', scope.row['id'])"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_call_records:delete']"
                  type="danger"
                  size="small"
                  link
                  icon="Delete"
                  @click="handleRowDelete(scope.row['id'])"
                >
                  删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </template>
    </PageContent>

    <EnhancedDialog
      v-model="dialogVisible.visible"
      :title="dialogVisible.title"
      width="920px"
      @close="handleCloseDialog"
    >
      <template v-if="dialogVisible.type === 'detail'">
        <el-descriptions :column="4" border>
          <el-descriptions-item label="主键ID" :span="2">
            {{ detailFormData.id }}
          </el-descriptions-item>
          <el-descriptions-item label="客户ID(关联crm_customers.id)" :span="2">
            {{ detailFormData.customer_id }}
          </el-descriptions-item>
          <el-descriptions-item label="联系人ID(关联crm_contacts.id)" :span="2">
            {{ detailFormData.contact_id }}
          </el-descriptions-item>
          <el-descriptions-item
            label="通话类型(sales_followup/after_sales/negotiation/other)"
            :span="2"
          >
            {{ detailFormData.call_type }}
          </el-descriptions-item>
          <el-descriptions-item label="通话方向(inbound:呼入/outbound:呼出)" :span="2">
            {{ detailFormData.direction }}
          </el-descriptions-item>
          <el-descriptions-item label="通话号码" :span="2">
            {{ detailFormData.phone_number }}
          </el-descriptions-item>
          <el-descriptions-item label="通话时长(秒)" :span="2">
            {{ detailFormData.duration_seconds }}
          </el-descriptions-item>
          <el-descriptions-item label="通话时间" :span="2">
            {{ detailFormData.call_time }}
          </el-descriptions-item>
          <el-descriptions-item label="通话摘要" :span="2">
            {{ detailFormData.summary }}
          </el-descriptions-item>
          <el-descriptions-item label="后续跟进动作" :span="2">
            {{ detailFormData.follow_up_action }}
          </el-descriptions-item>
          <el-descriptions-item label="计划跟进时间" :span="2">
            {{ detailFormData.follow_up_time }}
          </el-descriptions-item>
          <el-descriptions-item label="客户情绪(positive/neutral/negative)" :span="2">
            {{ detailFormData.sentiment }}
          </el-descriptions-item>
          <el-descriptions-item label="通话质量评分" :span="2">
            {{ detailFormData.quality_score }}
          </el-descriptions-item>
          <el-descriptions-item label="是否录音" :span="2">
            {{ detailFormData.is_recorded }}
          </el-descriptions-item>
          <el-descriptions-item label="录音文件URL" :span="2">
            {{ detailFormData.recording_url }}
          </el-descriptions-item>
          <el-descriptions-item label="UUID全局唯一标识" :span="2">
            {{ detailFormData.uuid }}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间" :span="2">
            {{ detailFormData.created_time }}
          </el-descriptions-item>
          <el-descriptions-item label="更新时间" :span="2">
            {{ detailFormData.updated_time }}
          </el-descriptions-item>
          <el-descriptions-item label="创建人" :span="2">
            {{ detailFormData.created_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="更新人" :span="2">
            {{ detailFormData.updated_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="删除人ID(关联sys_user.id)" :span="2">
            {{ detailFormData.deleted_id }}
          </el-descriptions-item>
          <el-descriptions-item label="是否已删除(false:否 true:是)" :span="2">
            {{ detailFormData.is_deleted }}
          </el-descriptions-item>
          <el-descriptions-item label="删除时间" :span="2">
            {{ detailFormData.deleted_time }}
          </el-descriptions-item>
          <el-descriptions-item label="所属部门ID(关联sys_dept.id)" :span="2">
            {{ detailFormData.dept_id }}
          </el-descriptions-item>
          <el-descriptions-item label="负责人ID(关联sys_user.id)" :span="2">
            {{ detailFormData.owner_id }}
          </el-descriptions-item>
        </el-descriptions>
      </template>

      <template v-else>
        <el-form
          ref="dataFormRef"
          :model="formData"
          :rules="rules"
          label-suffix=":"
          label-width="auto"
          label-position="right"
        >
          <el-form-item label="客户ID(关联crm_customers.id)" prop="customer_id" :required="true">
            <el-input
              v-model="formData.customer_id"
              placeholder="请输入客户ID(关联crm_customers.id)"
            />
          </el-form-item>
          <el-form-item label="联系人ID(关联crm_contacts.id)" prop="contact_id" :required="false">
            <el-input
              v-model="formData.contact_id"
              placeholder="请输入联系人ID(关联crm_contacts.id)"
            />
          </el-form-item>
          <el-form-item
            label="通话方向(inbound:呼入/outbound:呼出)"
            prop="direction"
            :required="false"
          >
            <el-input
              v-model="formData.direction"
              placeholder="请输入通话方向(inbound:呼入/outbound:呼出)"
            />
          </el-form-item>
          <el-form-item label="通话号码" prop="phone_number" :required="false">
            <el-input v-model="formData.phone_number" placeholder="请输入通话号码" />
          </el-form-item>
          <el-form-item label="通话时长(秒)" prop="duration_seconds" :required="false">
            <el-input v-model="formData.duration_seconds" placeholder="请输入通话时长(秒)" />
          </el-form-item>
          <el-form-item label="通话时间" prop="call_time" :required="true">
            <el-date-picker
              v-model="formData.call_time"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择通话时间"
            />
          </el-form-item>
          <el-form-item label="通话摘要" prop="summary" :required="false">
            <el-input
              v-model="formData.summary"
              type="textarea"
              placeholder="请输入通话摘要"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="后续跟进动作" prop="follow_up_action" :required="false">
            <el-input
              v-model="formData.follow_up_action"
              type="textarea"
              placeholder="请输入后续跟进动作"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="计划跟进时间" prop="follow_up_time" :required="false">
            <el-date-picker
              v-model="formData.follow_up_time"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择计划跟进时间"
            />
          </el-form-item>
          <el-form-item
            label="客户情绪(positive/neutral/negative)"
            prop="sentiment"
            :required="false"
          >
            <el-input
              v-model="formData.sentiment"
              placeholder="请输入客户情绪(positive/neutral/negative)"
            />
          </el-form-item>
          <el-form-item label="通话质量评分" prop="quality_score" :required="false">
            <el-input v-model="formData.quality_score" placeholder="请输入通话质量评分" />
          </el-form-item>
          <el-form-item label="是否录音" prop="is_recorded" :required="false">
            <el-input v-model="formData.is_recorded" placeholder="请输入是否录音" />
          </el-form-item>
          <el-form-item label="录音文件URL" prop="recording_url" :required="false">
            <el-input
              v-model="formData.recording_url"
              type="textarea"
              placeholder="请输入录音文件URL"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="删除人ID(关联sys_user.id)" prop="deleted_id" :required="false">
            <el-input v-model="formData.deleted_id" placeholder="请输入删除人ID(关联sys_user.id)" />
          </el-form-item>
          <el-form-item label="是否已删除(false:否 true:是)" prop="is_deleted" :required="false">
            <el-input
              v-model="formData.is_deleted"
              placeholder="请输入是否已删除(false:否 true:是)"
            />
          </el-form-item>
          <el-form-item label="删除时间" prop="deleted_time" :required="false">
            <el-date-picker
              v-model="formData.deleted_time"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择删除时间"
            />
          </el-form-item>
          <el-form-item label="所属部门ID(关联sys_dept.id)" prop="dept_id" :required="false">
            <el-input v-model="formData.dept_id" placeholder="请输入所属部门ID(关联sys_dept.id)" />
          </el-form-item>
          <el-form-item label="负责人ID(关联sys_user.id)" prop="owner_id" :required="false">
            <el-input v-model="formData.owner_id" placeholder="请输入负责人ID(关联sys_user.id)" />
          </el-form-item>
        </el-form>
      </template>

      <template #footer>
        <div class="dialog-footer">
          <el-button @click="handleCloseDialog">取消</el-button>
          <el-button v-if="dialogVisible.type !== 'detail'" type="primary" @click="handleSubmit">
            确定
          </el-button>
          <el-button v-else type="primary" @click="handleCloseDialog">确定</el-button>
        </div>
      </template>
    </EnhancedDialog>
  </div>
</template>

<script setup lang="ts">
defineOptions({
  name: "CrmCallRecords",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmCallRecordsAPI, {
  CrmCallRecordsPageQuery,
  CrmCallRecordsTable,
  CrmCallRecordsForm,
} from "@/api/module_crm/customers_call_records";
import CrudToolbarLeft from "@/components/CURD/CrudToolbarLeft.vue";
import CrudToolbarRight from "@/components/CURD/CrudToolbarRight.vue";
import PageSearch from "@/components/CURD/PageSearch.vue";
import PageContent from "@/components/CURD/PageContent.vue";
import EnhancedDialog from "@/components/CURD/EnhancedDialog.vue";
import { useCrudList } from "@/components/CURD/useCrudList";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";
import type { IContentConfig, ISearchConfig } from "@/components/CURD/types";

const { searchRef, contentRef, handleQueryClick, handleResetClick, refreshList } = useCrudList();

/** 数据表主键字段名（与导入表结构一致，避免非 id 主键时操作错行） */
const PK = "id" as const;

function triggerUserSearch() {
  nextTick(() => refreshList());
}

const searchConfig = reactive<ISearchConfig>({
  permPrefix: "module_crm:customers_call_records",
  colon: true,
  isExpandable: true,
  showNumber: 2,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "customer_id",
      label: "客户ID(关联crm_customers.id)",
      type: "input",
      attrs: { placeholder: "请输入客户ID(关联crm_customers.id)", clearable: true },
    },
    {
      prop: "contact_id",
      label: "联系人ID(关联crm_contacts.id)",
      type: "input",
      attrs: { placeholder: "请输入联系人ID(关联crm_contacts.id)", clearable: true },
    },
    {
      prop: "call_type",
      label: "通话类型(sales_followup/after_sales/negotiation/other)",
      type: "input",
      attrs: {
        placeholder: "请输入通话类型(sales_followup/after_sales/negotiation/other)",
        clearable: true,
      },
    },
    {
      prop: "direction",
      label: "通话方向(inbound:呼入/outbound:呼出)",
      type: "input",
      attrs: { placeholder: "请输入通话方向(inbound:呼入/outbound:呼出)", clearable: true },
    },
    {
      prop: "phone_number",
      label: "通话号码",
      type: "input",
      attrs: { placeholder: "请输入通话号码", clearable: true },
    },
    {
      prop: "duration_seconds",
      label: "通话时长(秒)",
      type: "input",
      attrs: { placeholder: "请输入通话时长(秒)", clearable: true },
    },
    {
      prop: "call_time",
      label: "通话时间",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择通话时间",
      },
    },
    {
      prop: "summary",
      label: "通话摘要",
      type: "input",
      attrs: { placeholder: "请输入通话摘要", clearable: true },
    },
    {
      prop: "follow_up_action",
      label: "后续跟进动作",
      type: "input",
      attrs: { placeholder: "请输入后续跟进动作", clearable: true },
    },
    {
      prop: "follow_up_time",
      label: "计划跟进时间",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择计划跟进时间",
      },
    },
    {
      prop: "sentiment",
      label: "客户情绪(positive/neutral/negative)",
      type: "input",
      attrs: { placeholder: "请输入客户情绪(positive/neutral/negative)", clearable: true },
    },
    {
      prop: "quality_score",
      label: "通话质量评分",
      type: "input",
      attrs: { placeholder: "请输入通话质量评分", clearable: true },
    },
    {
      prop: "is_recorded",
      label: "是否录音",
      type: "input",
      attrs: { placeholder: "请输入是否录音", clearable: true },
    },
    {
      prop: "recording_url",
      label: "录音文件URL",
      type: "input",
      attrs: { placeholder: "请输入录音文件URL", clearable: true },
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
    {
      prop: "updated_time",
      label: "更新时间",
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
    {
      prop: "created_id",
      label: "创建人",
      type: "user-table-select",
      initialValue: null,
      events: {
        "confirm-click": triggerUserSearch,
        "clear-click": triggerUserSearch,
      },
    },
    {
      prop: "updated_id",
      label: "更新人",
      type: "user-table-select",
      initialValue: null,
      events: {
        "confirm-click": triggerUserSearch,
        "clear-click": triggerUserSearch,
      },
    },
    {
      prop: "deleted_id",
      label: "删除人ID(关联sys_user.id)",
      type: "input",
      attrs: { placeholder: "请输入删除人ID(关联sys_user.id)", clearable: true },
    },
    {
      prop: "is_deleted",
      label: "是否已删除(false:否 true:是)",
      type: "input",
      attrs: { placeholder: "请输入是否已删除(false:否 true:是)", clearable: true },
    },
    {
      prop: "deleted_time",
      label: "删除时间",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择删除时间",
      },
    },
    {
      prop: "dept_id",
      label: "所属部门ID(关联sys_dept.id)",
      type: "input",
      attrs: { placeholder: "请输入所属部门ID(关联sys_dept.id)", clearable: true },
    },
    {
      prop: "owner_id",
      label: "负责人ID(关联sys_user.id)",
      type: "input",
      attrs: { placeholder: "请输入负责人ID(关联sys_user.id)", clearable: true },
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
  { prop: "customer_id", label: "客户ID(关联crm_customers.id)", show: true },
  { prop: "contact_id", label: "联系人ID(关联crm_contacts.id)", show: true },
  {
    prop: "call_type",
    label: "通话类型(sales_followup/after_sales/negotiation/other)",
    show: true,
  },
  { prop: "direction", label: "通话方向(inbound:呼入/outbound:呼出)", show: true },
  { prop: "phone_number", label: "通话号码", show: true },
  { prop: "duration_seconds", label: "通话时长(秒)", show: true },
  { prop: "call_time", label: "通话时间", show: true },
  { prop: "summary", label: "通话摘要", show: true },
  { prop: "follow_up_action", label: "后续跟进动作", show: true },
  { prop: "follow_up_time", label: "计划跟进时间", show: true },
  { prop: "sentiment", label: "客户情绪(positive/neutral/negative)", show: true },
  { prop: "quality_score", label: "通话质量评分", show: true },
  { prop: "is_recorded", label: "是否录音", show: true },
  { prop: "recording_url", label: "录音文件URL", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "updated_time", label: "更新时间", show: true },
  { prop: "created_id", label: "创建人ID(关联sys_user.id)", show: true },
  { prop: "updated_id", label: "更新人ID(关联sys_user.id)", show: true },
  { prop: "deleted_id", label: "删除人ID(关联sys_user.id)", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmCallRecordsQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmCallRecordsPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmCallRecordsPageQuery>>({
  permPrefix: "module_crm:customers_call_records",
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
    const res = await CrmCallRecordsAPI.listCrmCallRecords(
      normalizeCrmCallRecordsQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmCallRecordsAPI.deleteCrmCallRecords(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmCallRecordsAPI.downloadTemplateCrmCallRecords(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmCallRecordsAPI.importCrmCallRecords(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmCallRecordsPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmCallRecordsTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmCallRecordsAPI.listCrmCallRecords(
          normalizeCrmCallRecordsQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

const detailFormData = ref<CrmCallRecordsTable>({});

const formData = reactive<CrmCallRecordsForm>({
  customer_id: undefined,
  contact_id: undefined,
  call_type: undefined,
  direction: undefined,
  phone_number: undefined,
  duration_seconds: undefined,
  call_time: undefined,
  summary: undefined,
  follow_up_action: undefined,
  follow_up_time: undefined,
  sentiment: undefined,
  quality_score: undefined,
  is_recorded: undefined,
  recording_url: undefined,
  deleted_id: undefined,
  is_deleted: undefined,
  deleted_time: undefined,
  dept_id: undefined,
  owner_id: undefined,
});

const dialogVisible = reactive({
  title: "",
  visible: false,
  type: "create" as "create" | "update" | "detail",
});

const rules = reactive({
  customer_id: [{ required: true, message: "请填写客户ID(关联crm_customers.id)", trigger: "blur" }],
  contact_id: [
    { required: false, message: "请填写联系人ID(关联crm_contacts.id)", trigger: "blur" },
  ],
  call_type: [
    {
      required: true,
      message: "请填写通话类型(sales_followup/after_sales/negotiation/other)",
      trigger: "blur",
    },
  ],
  direction: [
    { required: false, message: "请填写通话方向(inbound:呼入/outbound:呼出)", trigger: "blur" },
  ],
  phone_number: [{ required: false, message: "请填写通话号码", trigger: "blur" }],
  duration_seconds: [{ required: false, message: "请填写通话时长(秒)", trigger: "blur" }],
  call_time: [{ required: true, message: "请填写通话时间", trigger: "blur" }],
  summary: [{ required: false, message: "请填写通话摘要", trigger: "blur" }],
  follow_up_action: [{ required: false, message: "请填写后续跟进动作", trigger: "blur" }],
  follow_up_time: [{ required: false, message: "请填写计划跟进时间", trigger: "blur" }],
  sentiment: [
    { required: false, message: "请填写客户情绪(positive/neutral/negative)", trigger: "blur" },
  ],
  quality_score: [{ required: false, message: "请填写通话质量评分", trigger: "blur" }],
  is_recorded: [{ required: false, message: "请填写是否录音", trigger: "blur" }],
  recording_url: [{ required: false, message: "请填写录音文件URL", trigger: "blur" }],
  deleted_id: [{ required: false, message: "请填写删除人ID(关联sys_user.id)", trigger: "blur" }],
  is_deleted: [{ required: false, message: "请填写是否已删除(false:否 true:是)", trigger: "blur" }],
  deleted_time: [{ required: false, message: "请填写删除时间", trigger: "blur" }],
  dept_id: [{ required: false, message: "请填写所属部门ID(关联sys_dept.id)", trigger: "blur" }],
  owner_id: [{ required: false, message: "请填写负责人ID(关联sys_user.id)", trigger: "blur" }],
});

const dataFormRef = ref();

const dictStore = useDictStore();
const dictTypes: string[] = [];

function handleRowDelete(id: number) {
  contentRef.value?.handleDelete(id);
}

const initialFormData: CrmCallRecordsForm = {
  customer_id: undefined,
  contact_id: undefined,
  call_type: undefined,
  direction: undefined,
  phone_number: undefined,
  duration_seconds: undefined,
  call_time: undefined,
  summary: undefined,
  follow_up_action: undefined,
  follow_up_time: undefined,
  sentiment: undefined,
  quality_score: undefined,
  is_recorded: undefined,
  recording_url: undefined,
  deleted_id: undefined,
  is_deleted: undefined,
  deleted_time: undefined,
  dept_id: undefined,
  owner_id: undefined,
};

async function resetForm() {
  if (dataFormRef.value) {
    dataFormRef.value.resetFields();
    dataFormRef.value.clearValidate();
  }
  Object.assign(formData, initialFormData);
}

async function handleCloseDialog() {
  dialogVisible.visible = false;
  resetForm();
}

async function handleOpenDialog(type: "create" | "update" | "detail", id?: number) {
  dialogVisible.type = type;
  if (id) {
    const response = await CrmCallRecordsAPI.detailCrmCallRecords(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增通话记录";
    formData.customer_id = undefined;
    formData.contact_id = undefined;
    formData.call_type = undefined;
    formData.direction = undefined;
    formData.phone_number = undefined;
    formData.duration_seconds = undefined;
    formData.call_time = undefined;
    formData.summary = undefined;
    formData.follow_up_action = undefined;
    formData.follow_up_time = undefined;
    formData.sentiment = undefined;
    formData.quality_score = undefined;
    formData.is_recorded = undefined;
    formData.recording_url = undefined;
    formData.deleted_id = undefined;
    formData.is_deleted = undefined;
    formData.deleted_time = undefined;
    formData.dept_id = undefined;
    formData.owner_id = undefined;
  }
  dialogVisible.visible = true;
}

async function handleSubmit() {
  dataFormRef.value.validate(async (valid: boolean) => {
    if (valid) {
      const submitData = { ...formData };
      const id = formData[PK] as number | undefined;
      try {
        if (id) {
          await CrmCallRecordsAPI.updateCrmCallRecords(id, { ...submitData, [PK]: id });
        } else {
          await CrmCallRecordsAPI.createCrmCallRecords(submitData);
        }
        dialogVisible.visible = false;
        await resetForm();
        refreshList();
      } catch (error: unknown) {
        console.error(error);
      }
    }
  });
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
        await CrmCallRecordsAPI.batchCrmCallRecords({ ids, status });
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
  }
  refreshList();
});
</script>

<style lang="scss" scoped></style>
