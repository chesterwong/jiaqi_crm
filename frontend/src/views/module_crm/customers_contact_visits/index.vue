<!-- 拜访记录：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_contact_visits -->
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
          :perm-create="['module_crm:customers_contact_visits:create']"
          :perm-delete="['module_crm:customers_contact_visits:delete']"
          :perm-patch="['module_crm:customers_contact_visits:patch']"
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
              v-if="contentCols.find((col) => col.prop === 'contact_id')?.show"
              label="联系人ID,关联对应表"
              prop="contact_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'customer_id')?.show"
              label="客户ID,关联对应表"
              prop="customer_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_date')?.show"
              label="拜访日期"
              prop="visit_date"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_type')?.show"
              label="拜访类型"
              prop="visit_type"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_location')?.show"
              label="拜访地点"
              prop="visit_location"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_duration')?.show"
              label="拜访时长"
              prop="visit_duration"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visitor_id')?.show"
              label="拜访人ID"
              prop="visitor_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visitor_name')?.show"
              label="拜访人姓名"
              prop="visitor_name"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'attendees')?.show"
              label="参与人"
              prop="attendees"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_content')?.show"
              label="拜访内容"
              prop="visit_content"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'visit_result')?.show"
              label="拜访结果"
              prop="visit_result"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'follow_up_action')?.show"
              label="跟进动作"
              prop="follow_up_action"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'next_visit_date')?.show"
              label="下次拜访日期"
              prop="next_visit_date"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'attachments')?.show"
              label="附件"
              prop="attachments"
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
              v-if="contentCols.find((col) => col.prop === 'is_deleted')?.show"
              label="是否已删除(false:否 true:是)"
              prop="is_deleted"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'created_id')?.show"
              label="创建人ID"
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
              label="更新人ID"
              prop="updated_id"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                <el-tag>{{ scope.row.updated_by?.name }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'deleted_time')?.show"
              label="删除时间"
              prop="deleted_time"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'deleted_id')?.show"
              label="删除人ID"
              prop="deleted_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'description')?.show"
              label="备注/描述"
              prop="description"
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
                  v-hasPerm="['module_crm:customers_contact_visits:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row['id'])"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_contact_visits:update']"
                  type="primary"
                  size="small"
                  link
                  icon="Edit"
                  @click="handleOpenDialog('update', scope.row['id'])"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_contact_visits:delete']"
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
          <el-descriptions-item label="联系人ID,关联对应表" :span="2">
            {{ detailFormData.contact_id }}
          </el-descriptions-item>
          <el-descriptions-item label="客户ID,关联对应表" :span="2">
            {{ detailFormData.customer_id }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访日期" :span="2">
            {{ detailFormData.visit_date }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访类型" :span="2">
            {{ detailFormData.visit_type }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访地点" :span="2">
            {{ detailFormData.visit_location }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访时长" :span="2">
            {{ detailFormData.visit_duration }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访人ID" :span="2">
            {{ detailFormData.visitor_id }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访人姓名" :span="2">
            {{ detailFormData.visitor_name }}
          </el-descriptions-item>
          <el-descriptions-item label="参与人" :span="2">
            {{ detailFormData.attendees }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访内容" :span="2">
            {{ detailFormData.visit_content }}
          </el-descriptions-item>
          <el-descriptions-item label="拜访结果" :span="2">
            {{ detailFormData.visit_result }}
          </el-descriptions-item>
          <el-descriptions-item label="跟进动作" :span="2">
            {{ detailFormData.follow_up_action }}
          </el-descriptions-item>
          <el-descriptions-item label="下次拜访日期" :span="2">
            {{ detailFormData.next_visit_date }}
          </el-descriptions-item>
          <el-descriptions-item label="附件" :span="2">
            {{ detailFormData.attachments }}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间" :span="2">
            {{ detailFormData.created_time }}
          </el-descriptions-item>
          <el-descriptions-item label="更新时间" :span="2">
            {{ detailFormData.updated_time }}
          </el-descriptions-item>
          <el-descriptions-item label="是否已删除(false:否 true:是)" :span="2">
            {{ detailFormData.is_deleted }}
          </el-descriptions-item>
          <el-descriptions-item label="创建人" :span="2">
            {{ detailFormData.created_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="更新人" :span="2">
            {{ detailFormData.updated_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="删除时间" :span="2">
            {{ detailFormData.deleted_time }}
          </el-descriptions-item>
          <el-descriptions-item label="UUID全局唯一标识" :span="2">
            {{ detailFormData.uuid }}
          </el-descriptions-item>
          <el-descriptions-item label="删除人ID" :span="2">
            {{ detailFormData.deleted_id }}
          </el-descriptions-item>
          <el-descriptions-item label="备注/描述" :span="2">
            {{ detailFormData.description }}
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
          <el-form-item label="联系人ID,关联对应表" prop="contact_id" :required="true">
            <el-input v-model="formData.contact_id" placeholder="请输入联系人ID,关联对应表" />
          </el-form-item>
          <el-form-item label="客户ID,关联对应表" prop="customer_id" :required="true">
            <el-input v-model="formData.customer_id" placeholder="请输入客户ID,关联对应表" />
          </el-form-item>
          <el-form-item label="拜访日期" prop="visit_date" :required="true">
            <el-date-picker
              v-model="formData.visit_date"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择拜访日期"
            />
          </el-form-item>
          <el-form-item label="拜访地点" prop="visit_location" :required="false">
            <el-input v-model="formData.visit_location" placeholder="请输入拜访地点" />
          </el-form-item>
          <el-form-item label="拜访时长" prop="visit_duration" :required="false">
            <el-input v-model="formData.visit_duration" placeholder="请输入拜访时长" />
          </el-form-item>
          <el-form-item label="拜访人ID" prop="visitor_id" :required="true">
            <el-input v-model="formData.visitor_id" placeholder="请输入拜访人ID" />
          </el-form-item>
          <el-form-item label="拜访人姓名" prop="visitor_name" :required="false">
            <el-input v-model="formData.visitor_name" placeholder="请输入拜访人姓名" />
          </el-form-item>
          <el-form-item label="参与人" prop="attendees" :required="false">
            <el-input v-model="formData.attendees" placeholder="请输入参与人" />
          </el-form-item>
          <el-form-item label="拜访结果" prop="visit_result" :required="false">
            <el-input v-model="formData.visit_result" placeholder="请输入拜访结果" />
          </el-form-item>
          <el-form-item label="跟进动作" prop="follow_up_action" :required="false">
            <el-input
              v-model="formData.follow_up_action"
              type="textarea"
              placeholder="请输入跟进动作"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="下次拜访日期" prop="next_visit_date" :required="false">
            <el-date-picker
              v-model="formData.next_visit_date"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择下次拜访日期"
            />
          </el-form-item>
          <el-form-item label="附件" prop="attachments" :required="false">
            <el-input v-model="formData.attachments" placeholder="请输入附件" />
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
          <el-form-item label="删除人ID" prop="deleted_id" :required="false">
            <el-input v-model="formData.deleted_id" placeholder="请输入删除人ID" />
          </el-form-item>
          <el-form-item label="描述" prop="description">
            <el-input
              v-model="formData.description"
              :rows="4"
              :maxlength="100"
              show-word-limit
              type="textarea"
              placeholder="请输入描述"
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
  name: "CrmContactVisits",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmContactVisitsAPI, {
  CrmContactVisitsPageQuery,
  CrmContactVisitsTable,
  CrmContactVisitsForm,
} from "@/api/module_crm/customers_contact_visits";
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
  permPrefix: "module_crm:customers_contact_visits",
  colon: true,
  isExpandable: true,
  showNumber: 2,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "contact_id",
      label: "联系人ID,关联对应表",
      type: "input",
      attrs: { placeholder: "请输入联系人ID,关联对应表", clearable: true },
    },
    {
      prop: "customer_id",
      label: "客户ID,关联对应表",
      type: "input",
      attrs: { placeholder: "请输入客户ID,关联对应表", clearable: true },
    },
    {
      prop: "visit_date",
      label: "拜访日期",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择拜访日期",
      },
    },
    {
      prop: "visit_type",
      label: "拜访类型",
      type: "input",
      attrs: { placeholder: "请输入拜访类型", clearable: true },
    },
    {
      prop: "visit_location",
      label: "拜访地点",
      type: "input",
      attrs: { placeholder: "请输入拜访地点", clearable: true },
    },
    {
      prop: "visit_duration",
      label: "拜访时长",
      type: "input",
      attrs: { placeholder: "请输入拜访时长", clearable: true },
    },
    {
      prop: "visitor_id",
      label: "拜访人ID",
      type: "input",
      attrs: { placeholder: "请输入拜访人ID", clearable: true },
    },
    {
      prop: "visitor_name",
      label: "拜访人姓名",
      type: "input",
      attrs: { placeholder: "请输入拜访人姓名", clearable: true },
    },
    {
      prop: "attendees",
      label: "参与人",
      type: "input",
      attrs: { placeholder: "请输入参与人", clearable: true },
    },
    {
      prop: "visit_content",
      label: "拜访内容",
      type: "input",
      attrs: { placeholder: "请输入拜访内容", clearable: true },
    },
    {
      prop: "visit_result",
      label: "拜访结果",
      type: "input",
      attrs: { placeholder: "请输入拜访结果", clearable: true },
    },
    {
      prop: "follow_up_action",
      label: "跟进动作",
      type: "input",
      attrs: { placeholder: "请输入跟进动作", clearable: true },
    },
    {
      prop: "next_visit_date",
      label: "下次拜访日期",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择下次拜访日期",
      },
    },
    {
      prop: "attachments",
      label: "附件",
      type: "input",
      attrs: { placeholder: "请输入附件", clearable: true },
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
      prop: "is_deleted",
      label: "是否已删除(false:否 true:是)",
      type: "input",
      attrs: { placeholder: "请输入是否已删除(false:否 true:是)", clearable: true },
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
      prop: "deleted_id",
      label: "删除人ID",
      type: "input",
      attrs: { placeholder: "请输入删除人ID", clearable: true },
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
  { prop: "contact_id", label: "联系人ID,关联对应表", show: true },
  { prop: "customer_id", label: "客户ID,关联对应表", show: true },
  { prop: "visit_date", label: "拜访日期", show: true },
  { prop: "visit_type", label: "拜访类型", show: true },
  { prop: "visit_location", label: "拜访地点", show: true },
  { prop: "visit_duration", label: "拜访时长", show: true },
  { prop: "visitor_id", label: "拜访人ID", show: true },
  { prop: "visitor_name", label: "拜访人姓名", show: true },
  { prop: "attendees", label: "参与人", show: true },
  { prop: "visit_content", label: "拜访内容", show: true },
  { prop: "visit_result", label: "拜访结果", show: true },
  { prop: "follow_up_action", label: "跟进动作", show: true },
  { prop: "next_visit_date", label: "下次拜访日期", show: true },
  { prop: "attachments", label: "附件", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "updated_time", label: "更新时间", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "created_id", label: "创建人ID（外键→sys_user）", show: true },
  { prop: "updated_id", label: "更新人ID（外键→sys_user）", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "deleted_id", label: "删除人ID（外键→sys_user）", show: true },
  { prop: "description", label: "备注/描述", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmContactVisitsQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmContactVisitsPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmContactVisitsPageQuery>>({
  permPrefix: "module_crm:customers_contact_visits",
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
    const res = await CrmContactVisitsAPI.listCrmContactVisits(
      normalizeCrmContactVisitsQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmContactVisitsAPI.deleteCrmContactVisits(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmContactVisitsAPI.downloadTemplateCrmContactVisits(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmContactVisitsAPI.importCrmContactVisits(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmContactVisitsPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmContactVisitsTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmContactVisitsAPI.listCrmContactVisits(
          normalizeCrmContactVisitsQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

const detailFormData = ref<CrmContactVisitsTable>({});

const formData = reactive<CrmContactVisitsForm>({
  contact_id: undefined,
  customer_id: undefined,
  visit_date: undefined,
  visit_type: undefined,
  visit_location: undefined,
  visit_duration: undefined,
  visitor_id: undefined,
  visitor_name: undefined,
  attendees: undefined,
  visit_content: undefined,
  visit_result: undefined,
  follow_up_action: undefined,
  next_visit_date: undefined,
  attachments: undefined,
  is_deleted: undefined,
  deleted_time: undefined,
  deleted_id: undefined,
  description: undefined,
  dept_id: undefined,
  owner_id: undefined,
});

const dialogVisible = reactive({
  title: "",
  visible: false,
  type: "create" as "create" | "update" | "detail",
});

const rules = reactive({
  contact_id: [{ required: true, message: "请填写联系人ID,关联对应表", trigger: "blur" }],
  customer_id: [{ required: true, message: "请填写客户ID,关联对应表", trigger: "blur" }],
  visit_date: [{ required: true, message: "请填写拜访日期", trigger: "blur" }],
  visit_type: [{ required: false, message: "请填写拜访类型", trigger: "blur" }],
  visit_location: [{ required: false, message: "请填写拜访地点", trigger: "blur" }],
  visit_duration: [{ required: false, message: "请填写拜访时长", trigger: "blur" }],
  visitor_id: [{ required: true, message: "请填写拜访人ID", trigger: "blur" }],
  visitor_name: [{ required: false, message: "请填写拜访人姓名", trigger: "blur" }],
  attendees: [{ required: false, message: "请填写参与人", trigger: "blur" }],
  visit_content: [{ required: false, message: "请填写拜访内容", trigger: "blur" }],
  visit_result: [{ required: false, message: "请填写拜访结果", trigger: "blur" }],
  follow_up_action: [{ required: false, message: "请填写跟进动作", trigger: "blur" }],
  next_visit_date: [{ required: false, message: "请填写下次拜访日期", trigger: "blur" }],
  attachments: [{ required: false, message: "请填写附件", trigger: "blur" }],
  is_deleted: [{ required: false, message: "请填写是否已删除(false:否 true:是)", trigger: "blur" }],
  deleted_time: [{ required: false, message: "请填写删除时间", trigger: "blur" }],
  deleted_id: [{ required: false, message: "请填写删除人ID（外键→sys_user）", trigger: "blur" }],
  description: [{ required: false, message: "请填写备注/描述", trigger: "blur" }],
  dept_id: [{ required: false, message: "请填写所属部门ID(关联sys_dept.id)", trigger: "blur" }],
  owner_id: [{ required: false, message: "请填写负责人ID(关联sys_user.id)", trigger: "blur" }],
});

const dataFormRef = ref();

const dictStore = useDictStore();
const dictTypes: string[] = [];

function handleRowDelete(id: number) {
  contentRef.value?.handleDelete(id);
}

const initialFormData: CrmContactVisitsForm = {
  contact_id: undefined,
  customer_id: undefined,
  visit_date: undefined,
  visit_type: undefined,
  visit_location: undefined,
  visit_duration: undefined,
  visitor_id: undefined,
  visitor_name: undefined,
  attendees: undefined,
  visit_content: undefined,
  visit_result: undefined,
  follow_up_action: undefined,
  next_visit_date: undefined,
  attachments: undefined,
  is_deleted: undefined,
  deleted_time: undefined,
  deleted_id: undefined,
  description: undefined,
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
    const response = await CrmContactVisitsAPI.detailCrmContactVisits(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增拜访记录";
    formData.contact_id = undefined;
    formData.customer_id = undefined;
    formData.visit_date = undefined;
    formData.visit_type = undefined;
    formData.visit_location = undefined;
    formData.visit_duration = undefined;
    formData.visitor_id = undefined;
    formData.visitor_name = undefined;
    formData.attendees = undefined;
    formData.visit_content = undefined;
    formData.visit_result = undefined;
    formData.follow_up_action = undefined;
    formData.next_visit_date = undefined;
    formData.attachments = undefined;
    formData.is_deleted = undefined;
    formData.deleted_time = undefined;
    formData.deleted_id = undefined;
    formData.description = undefined;
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
          await CrmContactVisitsAPI.updateCrmContactVisits(id, { ...submitData, [PK]: id });
        } else {
          await CrmContactVisitsAPI.createCrmContactVisits(submitData);
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
        await CrmContactVisitsAPI.batchCrmContactVisits({ ids, status });
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
