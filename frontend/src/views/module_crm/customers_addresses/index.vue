<!-- 地址信息：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_addresses -->
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
          :perm-create="['module_crm:customers_addresses:create']"
          :perm-delete="['module_crm:customers_addresses:delete']"
          :perm-patch="['module_crm:customers_addresses:patch']"
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
              label="客户ID,关联对应表"
              prop="customer_id"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'address_type')?.show"
              label="地址类型"
              prop="address_type"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'address_name')?.show"
              label="地址名称"
              prop="address_name"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'province')?.show"
              label="省份"
              prop="province"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'city')?.show"
              label="城市"
              prop="city"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'district')?.show"
              label="区县"
              prop="district"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'detail_address')?.show"
              label="详细地址"
              prop="detail_address"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'postal_code')?.show"
              label="邮编"
              prop="postal_code"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'latitude')?.show"
              label="纬度"
              prop="latitude"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'longitude')?.show"
              label="经度"
              prop="longitude"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'contact_person')?.show"
              label="联系人"
              prop="contact_person"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'contact_phone')?.show"
              label="联系电话"
              prop="contact_phone"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_default')?.show"
              label="是否默认"
              prop="is_default"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_active')?.show"
              label="是否启用"
              prop="is_active"
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
                  v-hasPerm="['module_crm:customers_addresses:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row['id'])"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_addresses:update']"
                  type="primary"
                  size="small"
                  link
                  icon="Edit"
                  @click="handleOpenDialog('update', scope.row['id'])"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_addresses:delete']"
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
          <el-descriptions-item label="客户ID,关联对应表" :span="2">
            {{ detailFormData.customer_id }}
          </el-descriptions-item>
          <el-descriptions-item label="地址类型" :span="2">
            {{ detailFormData.address_type }}
          </el-descriptions-item>
          <el-descriptions-item label="地址名称" :span="2">
            {{ detailFormData.address_name }}
          </el-descriptions-item>
          <el-descriptions-item label="省份" :span="2">
            {{ detailFormData.province }}
          </el-descriptions-item>
          <el-descriptions-item label="城市" :span="2">
            {{ detailFormData.city }}
          </el-descriptions-item>
          <el-descriptions-item label="区县" :span="2">
            {{ detailFormData.district }}
          </el-descriptions-item>
          <el-descriptions-item label="详细地址" :span="2">
            {{ detailFormData.detail_address }}
          </el-descriptions-item>
          <el-descriptions-item label="邮编" :span="2">
            {{ detailFormData.postal_code }}
          </el-descriptions-item>
          <el-descriptions-item label="纬度" :span="2">
            {{ detailFormData.latitude }}
          </el-descriptions-item>
          <el-descriptions-item label="经度" :span="2">
            {{ detailFormData.longitude }}
          </el-descriptions-item>
          <el-descriptions-item label="联系人" :span="2">
            {{ detailFormData.contact_person }}
          </el-descriptions-item>
          <el-descriptions-item label="联系电话" :span="2">
            {{ detailFormData.contact_phone }}
          </el-descriptions-item>
          <el-descriptions-item label="是否默认" :span="2">
            {{ detailFormData.is_default }}
          </el-descriptions-item>
          <el-descriptions-item label="是否启用" :span="2">
            {{ detailFormData.is_active }}
          </el-descriptions-item>
          <el-descriptions-item label="创建人" :span="2">
            {{ detailFormData.created_by?.name }}
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
          <el-form-item label="客户ID,关联对应表" prop="customer_id" :required="true">
            <el-input v-model="formData.customer_id" placeholder="请输入客户ID,关联对应表" />
          </el-form-item>
          <el-form-item label="地址名称" prop="address_name" :required="false">
            <el-input v-model="formData.address_name" placeholder="请输入地址名称" />
          </el-form-item>
          <el-form-item label="所在地区" prop="province">
            <RegionCascader
              :model-value="{
                province: formData.province,
                city: formData.city,
                district: formData.district,
              }"
              placeholder="请选择省/市/区"
              @update:model-value="handleRegionChange"
            />
          </el-form-item>
          <el-form-item label="详细地址" prop="detail_address" :required="true">
            <el-input
              v-model="formData.detail_address"
              type="textarea"
              placeholder="请输入详细地址"
              :rows="4"
              :maxlength="100"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="邮编" prop="postal_code" :required="false">
            <el-input v-model="formData.postal_code" placeholder="请输入邮编" />
          </el-form-item>
          <el-form-item label="纬度" prop="latitude" :required="false">
            <el-input v-model="formData.latitude" placeholder="请输入纬度" />
          </el-form-item>
          <el-form-item label="经度" prop="longitude" :required="false">
            <el-input v-model="formData.longitude" placeholder="请输入经度" />
          </el-form-item>
          <el-form-item label="联系人" prop="contact_person" :required="false">
            <el-input v-model="formData.contact_person" placeholder="请输入联系人" />
          </el-form-item>
          <el-form-item label="联系电话" prop="contact_phone" :required="false">
            <el-input v-model="formData.contact_phone" placeholder="请输入联系电话" />
          </el-form-item>
          <el-form-item label="是否默认" prop="is_default" :required="false">
            <el-input v-model="formData.is_default" placeholder="请输入是否默认" />
          </el-form-item>
          <el-form-item label="是否启用" prop="is_active" :required="false">
            <el-input v-model="formData.is_active" placeholder="请输入是否启用" />
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
  name: "CrmCustomerAddresses",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmCustomerAddressesAPI, {
  CrmCustomerAddressesPageQuery,
  CrmCustomerAddressesTable,
  CrmCustomerAddressesForm,
} from "@/api/module_crm/customers_addresses";
import CrudToolbarLeft from "@/components/CURD/CrudToolbarLeft.vue";
import CrudToolbarRight from "@/components/CURD/CrudToolbarRight.vue";
import PageSearch from "@/components/CURD/PageSearch.vue";
import PageContent from "@/components/CURD/PageContent.vue";
import EnhancedDialog from "@/components/CURD/EnhancedDialog.vue";
import { useCrudList } from "@/components/CURD/useCrudList";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";
import RegionCascader from "@/components/CRM/RegionCascader.vue";
import type { IContentConfig, ISearchConfig } from "@/components/CURD/types";

const { searchRef, contentRef, handleQueryClick, handleResetClick, refreshList } = useCrudList();

/** 数据表主键字段名（与导入表结构一致，避免非 id 主键时操作错行） */
const PK = "id" as const;

function triggerUserSearch() {
  nextTick(() => refreshList());
}

const searchConfig = reactive<ISearchConfig>({
  permPrefix: "module_crm:customers_addresses",
  colon: true,
  isExpandable: true,
  showNumber: 2,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "customer_id",
      label: "客户ID,关联对应表",
      type: "input",
      attrs: { placeholder: "请输入客户ID,关联对应表", clearable: true },
    },
    {
      prop: "address_type",
      label: "地址类型",
      type: "input",
      attrs: { placeholder: "请输入地址类型", clearable: true },
    },
    {
      prop: "address_name",
      label: "地址名称",
      type: "input",
      attrs: { placeholder: "请输入地址名称", clearable: true },
    },
    {
      prop: "province",
      label: "省份",
      type: "input",
      attrs: { placeholder: "请输入省份", clearable: true },
    },
    {
      prop: "city",
      label: "城市",
      type: "input",
      attrs: { placeholder: "请输入城市", clearable: true },
    },
    {
      prop: "district",
      label: "区县",
      type: "input",
      attrs: { placeholder: "请输入区县", clearable: true },
    },
    {
      prop: "detail_address",
      label: "详细地址",
      type: "input",
      attrs: { placeholder: "请输入详细地址", clearable: true },
    },
    {
      prop: "postal_code",
      label: "邮编",
      type: "input",
      attrs: { placeholder: "请输入邮编", clearable: true },
    },
    {
      prop: "latitude",
      label: "纬度",
      type: "input",
      attrs: { placeholder: "请输入纬度", clearable: true },
    },
    {
      prop: "longitude",
      label: "经度",
      type: "input",
      attrs: { placeholder: "请输入经度", clearable: true },
    },
    {
      prop: "contact_person",
      label: "联系人",
      type: "input",
      attrs: { placeholder: "请输入联系人", clearable: true },
    },
    {
      prop: "contact_phone",
      label: "联系电话",
      type: "input",
      attrs: { placeholder: "请输入联系电话", clearable: true },
    },
    {
      prop: "is_default",
      label: "是否默认",
      type: "input",
      attrs: { placeholder: "请输入是否默认", clearable: true },
    },
    {
      prop: "is_active",
      label: "是否启用",
      type: "input",
      attrs: { placeholder: "请输入是否启用", clearable: true },
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
  { prop: "customer_id", label: "客户ID,关联对应表", show: true },
  { prop: "address_type", label: "地址类型", show: true },
  { prop: "address_name", label: "地址名称", show: true },
  { prop: "province", label: "省份", show: true },
  { prop: "city", label: "城市", show: true },
  { prop: "district", label: "区县", show: true },
  { prop: "detail_address", label: "详细地址", show: true },
  { prop: "postal_code", label: "邮编", show: true },
  { prop: "latitude", label: "纬度", show: true },
  { prop: "longitude", label: "经度", show: true },
  { prop: "contact_person", label: "联系人", show: true },
  { prop: "contact_phone", label: "联系电话", show: true },
  { prop: "is_default", label: "是否默认", show: true },
  { prop: "is_active", label: "是否启用", show: true },
  { prop: "created_id", label: "创建人ID（外键→sys_user）", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "updated_time", label: "更新时间", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "deleted_id", label: "删除人ID（外键→sys_user）", show: true },
  { prop: "description", label: "备注/描述", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmCustomerAddressesQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmCustomerAddressesPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmCustomerAddressesPageQuery>>({
  permPrefix: "module_crm:customers_addresses",
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
    const res = await CrmCustomerAddressesAPI.listCrmCustomerAddresses(
      normalizeCrmCustomerAddressesQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmCustomerAddressesAPI.deleteCrmCustomerAddresses(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmCustomerAddressesAPI.downloadTemplateCrmCustomerAddresses(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmCustomerAddressesAPI.importCrmCustomerAddresses(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmCustomerAddressesPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmCustomerAddressesTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmCustomerAddressesAPI.listCrmCustomerAddresses(
          normalizeCrmCustomerAddressesQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

const detailFormData = ref<CrmCustomerAddressesTable>({});

function handleRegionChange(val: { province: string; city: string; district: string }) {
  formData.province = val.province;
  formData.city = val.city;
  formData.district = val.district;
}

const formData = reactive<CrmCustomerAddressesForm>({
  customer_id: undefined,
  address_type: undefined,
  address_name: undefined,
  province: undefined,
  city: undefined,
  district: undefined,
  detail_address: undefined,
  postal_code: undefined,
  latitude: undefined,
  longitude: undefined,
  contact_person: undefined,
  contact_phone: undefined,
  is_default: undefined,
  is_active: undefined,
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
  customer_id: [{ required: true, message: "请填写客户ID,关联对应表", trigger: "blur" }],
  address_type: [{ required: true, message: "请填写地址类型", trigger: "blur" }],
  address_name: [{ required: false, message: "请填写地址名称", trigger: "blur" }],
  province: [{ required: false, message: "请填写省份", trigger: "blur" }],
  city: [{ required: false, message: "请填写城市", trigger: "blur" }],
  district: [{ required: false, message: "请填写区县", trigger: "blur" }],
  detail_address: [{ required: true, message: "请填写详细地址", trigger: "blur" }],
  postal_code: [{ required: false, message: "请填写邮编", trigger: "blur" }],
  latitude: [{ required: false, message: "请填写纬度", trigger: "blur" }],
  longitude: [{ required: false, message: "请填写经度", trigger: "blur" }],
  contact_person: [{ required: false, message: "请填写联系人", trigger: "blur" }],
  contact_phone: [{ required: false, message: "请填写联系电话", trigger: "blur" }],
  is_default: [{ required: false, message: "请填写是否默认", trigger: "blur" }],
  is_active: [{ required: false, message: "请填写是否启用", trigger: "blur" }],
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

const initialFormData: CrmCustomerAddressesForm = {
  customer_id: undefined,
  address_type: undefined,
  address_name: undefined,
  province: undefined,
  city: undefined,
  district: undefined,
  detail_address: undefined,
  postal_code: undefined,
  latitude: undefined,
  longitude: undefined,
  contact_person: undefined,
  contact_phone: undefined,
  is_default: undefined,
  is_active: undefined,
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
    const response = await CrmCustomerAddressesAPI.detailCrmCustomerAddresses(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增地址信息";
    formData.customer_id = undefined;
    formData.address_type = undefined;
    formData.address_name = undefined;
    formData.province = undefined;
    formData.city = undefined;
    formData.district = undefined;
    formData.detail_address = undefined;
    formData.postal_code = undefined;
    formData.latitude = undefined;
    formData.longitude = undefined;
    formData.contact_person = undefined;
    formData.contact_phone = undefined;
    formData.is_default = undefined;
    formData.is_active = undefined;
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
          await CrmCustomerAddressesAPI.updateCrmCustomerAddresses(id, { ...submitData, [PK]: id });
        } else {
          await CrmCustomerAddressesAPI.createCrmCustomerAddresses(submitData);
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
        await CrmCustomerAddressesAPI.batchCrmCustomerAddresses({ ids, status });
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
