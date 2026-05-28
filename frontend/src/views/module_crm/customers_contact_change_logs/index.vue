<!-- 变更日志：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_contact_change_logs -->
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
          :perm-create="['module_crm:customers_contact_change_logs:create']"
          :perm-delete="['module_crm:customers_contact_change_logs:delete']"
          :perm-patch="['module_crm:customers_contact_change_logs:patch']"
          @add="handleOpenDialog('create')"
          @delete="onToolbar('delete')"
          @more="handleMoreClick"
        />
        <div class="data-table__toolbar--right">
          <CrudToolbarRight :buttons="toolbarRight" :cols="cols" :on-toolbar="onToolbar" />
        </div>
      </template>

      <template #table="{ data, loading, pagination }">
        <div v-loading="loading" class="change-log-timeline">
          <el-empty
            v-if="!loading && data.length === 0"
            :image-size="80"
            description="暂无变更记录"
          />
          <el-timeline v-else>
            <el-timeline-item
              v-for="item in data"
              :key="item.id"
              :timestamp="item.changed_at || item.created_time"
              placement="top"
              :type="changeTypeColor(item.change_type)"
              :hollow="true"
            >
              <div class="timeline-item-header">
                <span class="timeline-operator">{{ item.operator_name || "系统" }}</span>
                <el-tag :type="changeTagType(item.change_type)" size="small">
                  {{ changeLabel(item.change_type) }}
                </el-tag>
                <span class="timeline-contact">联系人: {{ item.contact_id || "-" }}</span>
              </div>
              <div class="timeline-item-body">
                <span class="timeline-field">{{ item.field_label || item.field_name }}</span>
                <template v-if="item.old_value">
                  <span class="timeline-old">{{ item.old_value }}</span>
                  <el-icon><ArrowRight /></el-icon>
                </template>
                <span class="timeline-new">{{ item.new_value || "-" }}</span>
              </div>
            </el-timeline-item>
          </el-timeline>
          <div v-if="data.length > 0" class="change-log-pagination">
            <el-pagination
              v-model:current-page="pagination.currentPage"
              v-model:page-size="pagination.pageSize"
              :total="pagination.total"
              :page-sizes="[10, 20, 50]"
              layout="total, sizes, prev, pager, next"
              small
              @size-change="() => refreshList()"
              @current-change="() => refreshList()"
            />
          </div>
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
          <el-descriptions-item label="字段名称" :span="2">
            {{ detailFormData.field_name }}
          </el-descriptions-item>
          <el-descriptions-item label="字段标签" :span="2">
            {{ detailFormData.field_label }}
          </el-descriptions-item>
          <el-descriptions-item label="旧值" :span="2">
            {{ detailFormData.old_value }}
          </el-descriptions-item>
          <el-descriptions-item label="新值" :span="2">
            {{ detailFormData.new_value }}
          </el-descriptions-item>
          <el-descriptions-item label="变更类型" :span="2">
            {{ detailFormData.change_type }}
          </el-descriptions-item>
          <el-descriptions-item label="操作人ID" :span="2">
            {{ detailFormData.operator_id }}
          </el-descriptions-item>
          <el-descriptions-item label="操作人名称" :span="2">
            {{ detailFormData.operator_name }}
          </el-descriptions-item>
          <el-descriptions-item label="变更时间" :span="2">
            {{ detailFormData.changed_at }}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间" :span="2">
            {{ detailFormData.created_time }}
          </el-descriptions-item>
          <el-descriptions-item label="创建人" :span="2">
            {{ detailFormData.created_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="更新人" :span="2">
            {{ detailFormData.updated_by?.name }}
          </el-descriptions-item>
          <el-descriptions-item label="更新时间" :span="2">
            {{ detailFormData.updated_time }}
          </el-descriptions-item>
          <el-descriptions-item label="是否已删除(false:否 true:是)" :span="2">
            {{ detailFormData.is_deleted }}
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
          <el-form-item label="字段名称" prop="field_name" :required="true">
            <el-input v-model="formData.field_name" placeholder="请输入字段名称" />
          </el-form-item>
          <el-form-item label="字段标签" prop="field_label" :required="false">
            <el-input v-model="formData.field_label" placeholder="请输入字段标签" />
          </el-form-item>
          <el-form-item label="旧值" prop="old_value" :required="false">
            <el-input
              v-model="formData.old_value"
              type="textarea"
              placeholder="请输入旧值"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="新值" prop="new_value" :required="false">
            <el-input
              v-model="formData.new_value"
              type="textarea"
              placeholder="请输入新值"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="操作人ID" prop="operator_id" :required="true">
            <el-input v-model="formData.operator_id" placeholder="请输入操作人ID" />
          </el-form-item>
          <el-form-item label="操作人名称" prop="operator_name" :required="false">
            <el-input v-model="formData.operator_name" placeholder="请输入操作人名称" />
          </el-form-item>
          <el-form-item label="变更时间" prop="changed_at" :required="false">
            <el-date-picker
              v-model="formData.changed_at"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择变更时间"
            />
          </el-form-item>
          <el-form-item label="是否已删除(false:否 true:是)" prop="is_deleted" :required="true">
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
  name: "CrmContactChangeLogs",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { ArrowRight } from "@element-plus/icons-vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmContactChangeLogsAPI, {
  CrmContactChangeLogsPageQuery,
  CrmContactChangeLogsTable,
  CrmContactChangeLogsForm,
} from "@/api/module_crm/customers_contact_change_logs";
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
  permPrefix: "module_crm:customers_contact_change_logs",
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
      prop: "field_name",
      label: "字段名称",
      type: "input",
      attrs: { placeholder: "请输入字段名称", clearable: true },
    },
    {
      prop: "field_label",
      label: "字段标签",
      type: "input",
      attrs: { placeholder: "请输入字段标签", clearable: true },
    },
    {
      prop: "old_value",
      label: "旧值",
      type: "input",
      attrs: { placeholder: "请输入旧值", clearable: true },
    },
    {
      prop: "new_value",
      label: "新值",
      type: "input",
      attrs: { placeholder: "请输入新值", clearable: true },
    },
    {
      prop: "change_type",
      label: "变更类型",
      type: "input",
      attrs: { placeholder: "请输入变更类型", clearable: true },
    },
    {
      prop: "operator_id",
      label: "操作人ID",
      type: "input",
      attrs: { placeholder: "请输入操作人ID", clearable: true },
    },
    {
      prop: "operator_name",
      label: "操作人名称",
      type: "input",
      attrs: { placeholder: "请输入操作人名称", clearable: true },
    },
    {
      prop: "changed_at",
      label: "变更时间",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择变更时间",
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
  { prop: "field_name", label: "字段名称", show: true },
  { prop: "field_label", label: "字段标签", show: true },
  { prop: "old_value", label: "旧值", show: true },
  { prop: "new_value", label: "新值", show: true },
  { prop: "change_type", label: "变更类型", show: true },
  { prop: "operator_id", label: "操作人ID", show: true },
  { prop: "operator_name", label: "操作人名称", show: true },
  { prop: "changed_at", label: "变更时间", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "created_id", label: "创建人ID（外键→sys_user）", show: true },
  { prop: "updated_id", label: "更新人ID（外键→sys_user）", show: true },
  { prop: "updated_time", label: "更新时间", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "deleted_id", label: "删除人ID（外键→sys_user）", show: true },
  { prop: "description", label: "备注/描述", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmContactChangeLogsQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmContactChangeLogsPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmContactChangeLogsPageQuery>>({
  permPrefix: "module_crm:customers_contact_change_logs",
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
    const res = await CrmContactChangeLogsAPI.listCrmContactChangeLogs(
      normalizeCrmContactChangeLogsQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmContactChangeLogsAPI.deleteCrmContactChangeLogs(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmContactChangeLogsAPI.downloadTemplateCrmContactChangeLogs(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmContactChangeLogsAPI.importCrmContactChangeLogs(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmContactChangeLogsPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmContactChangeLogsTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmContactChangeLogsAPI.listCrmContactChangeLogs(
          normalizeCrmContactChangeLogsQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

// ── 变更日志辅助函数 ──
function changeLabel(type: string): string {
  const map: Record<string, string> = { create: "新增", update: "修改", delete: "删除" };
  return map[type] || type || "修改";
}
function changeTagType(type: string): "success" | "warning" | "danger" | "info" {
  const map: Record<string, "success" | "warning" | "danger" | "info"> = {
    create: "success",
    update: "warning",
    delete: "danger",
  };
  return map[type] || "info";
}
function changeTypeColor(type: string): "primary" | "success" | "warning" | "danger" | "info" {
  const map: Record<string, "primary" | "success" | "warning" | "danger" | "info"> = {
    create: "success",
    update: "primary",
    delete: "danger",
  };
  return map[type] || "info";
}

const detailFormData = ref<CrmContactChangeLogsTable>({});

const formData = reactive<CrmContactChangeLogsForm>({
  contact_id: undefined,
  customer_id: undefined,
  field_name: undefined,
  field_label: undefined,
  old_value: undefined,
  new_value: undefined,
  change_type: undefined,
  operator_id: undefined,
  operator_name: undefined,
  changed_at: undefined,
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
  field_name: [{ required: true, message: "请填写字段名称", trigger: "blur" }],
  field_label: [{ required: false, message: "请填写字段标签", trigger: "blur" }],
  old_value: [{ required: false, message: "请填写旧值", trigger: "blur" }],
  new_value: [{ required: false, message: "请填写新值", trigger: "blur" }],
  change_type: [{ required: false, message: "请填写变更类型", trigger: "blur" }],
  operator_id: [{ required: true, message: "请填写操作人ID", trigger: "blur" }],
  operator_name: [{ required: false, message: "请填写操作人名称", trigger: "blur" }],
  changed_at: [{ required: false, message: "请填写变更时间", trigger: "blur" }],
  is_deleted: [{ required: true, message: "请填写是否已删除(false:否 true:是)", trigger: "blur" }],
  deleted_time: [{ required: false, message: "请填写删除时间", trigger: "blur" }],
  deleted_id: [{ required: false, message: "请填写删除人ID（外键→sys_user）", trigger: "blur" }],
  description: [{ required: false, message: "请填写备注/描述", trigger: "blur" }],
  dept_id: [{ required: false, message: "请填写所属部门ID(关联sys_dept.id)", trigger: "blur" }],
  owner_id: [{ required: false, message: "请填写负责人ID(关联sys_user.id)", trigger: "blur" }],
});

const dataFormRef = ref();

const dictStore = useDictStore();
const dictTypes: string[] = [];

const initialFormData: CrmContactChangeLogsForm = {
  contact_id: undefined,
  customer_id: undefined,
  field_name: undefined,
  field_label: undefined,
  old_value: undefined,
  new_value: undefined,
  change_type: undefined,
  operator_id: undefined,
  operator_name: undefined,
  changed_at: undefined,
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
    const response = await CrmContactChangeLogsAPI.detailCrmContactChangeLogs(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增变更日志";
    formData.contact_id = undefined;
    formData.customer_id = undefined;
    formData.field_name = undefined;
    formData.field_label = undefined;
    formData.old_value = undefined;
    formData.new_value = undefined;
    formData.change_type = undefined;
    formData.operator_id = undefined;
    formData.operator_name = undefined;
    formData.changed_at = undefined;
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
          await CrmContactChangeLogsAPI.updateCrmContactChangeLogs(id, { ...submitData, [PK]: id });
        } else {
          await CrmContactChangeLogsAPI.createCrmContactChangeLogs(submitData);
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
        await CrmContactChangeLogsAPI.batchCrmContactChangeLogs({ ids, status });
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

<style lang="scss" scoped>
.change-log-timeline {
  padding: 16px 20px;
  min-height: 400px;
}

.timeline-item-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 4px;
}

.timeline-operator {
  font-weight: 600;
  font-size: 14px;
}

.timeline-contact {
  font-size: 12px;
  color: var(--el-text-color-secondary);
  margin-left: 4px;
}

.timeline-item-body {
  display: flex;
  align-items: center;
  gap: 6px;
  flex-wrap: wrap;
  font-size: 13px;
}

.timeline-field {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

.timeline-old {
  color: var(--el-color-danger);
  text-decoration: line-through;
}

.timeline-new {
  color: var(--el-color-success);
  font-weight: 500;
}

.timeline-item-reason {
  margin-top: 4px;
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.change-log-pagination {
  display: flex;
  justify-content: center;
  padding-top: 16px;
  margin-top: 16px;
  border-top: 1px solid var(--el-border-color-light);
}
</style>
