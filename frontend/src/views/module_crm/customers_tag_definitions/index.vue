<!-- 标签定义：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_tag_definitions -->
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
          :perm-create="['module_crm:customers_tag_definitions:create']"
          :perm-delete="['module_crm:customers_tag_definitions:delete']"
          :perm-patch="['module_crm:customers_tag_definitions:patch']"
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
              v-if="contentCols.find((col) => col.prop === 'tag_code')?.show"
              label="标签编号"
              prop="tag_code"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'tag_name')?.show"
              label="标签名称"
              prop="tag_name"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'tag_type')?.show"
              label="标签类型"
              prop="tag_type"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'category')?.show"
              label="分类"
              prop="category"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'color')?.show"
              label="颜色"
              prop="color"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'icon')?.show"
              label="图标"
              prop="icon"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'applicable_types')?.show"
              label="适用类型"
              prop="applicable_types"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_multi_select')?.show"
              label="是否多选"
              prop="is_multi_select"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'is_required')?.show"
              label="是否必填"
              prop="is_required"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'validation_rule')?.show"
              label="验证规则"
              prop="validation_rule"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'status')?.show"
              label="系统状态(0:正常 1:禁用)"
              prop="status"
              min-width="120"
              show-overflow-tooltip
            >
              <template #default="scope">
                <el-tag :type="scope.row.status == '0' ? 'success' : 'info'">
                  {{ scope.row.status == "0" ? "启用" : "停用" }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'sort_order')?.show"
              label="排序"
              prop="sort_order"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'usage_count')?.show"
              label="使用次数"
              prop="usage_count"
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
              v-if="contentCols.find((col) => col.prop === 'version')?.show"
              label="版本号"
              prop="version"
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
                  v-hasPerm="['module_crm:customers_tag_definitions:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row['id'])"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_tag_definitions:update']"
                  type="primary"
                  size="small"
                  link
                  icon="Edit"
                  @click="handleOpenDialog('update', scope.row['id'])"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_tag_definitions:delete']"
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
          <el-descriptions-item label="标签编号" :span="2">
            {{ detailFormData.tag_code }}
          </el-descriptions-item>
          <el-descriptions-item label="标签名称" :span="2">
            {{ detailFormData.tag_name }}
          </el-descriptions-item>
          <el-descriptions-item label="标签类型" :span="2">
            {{ detailFormData.tag_type }}
          </el-descriptions-item>
          <el-descriptions-item label="分类" :span="2">
            {{ detailFormData.category }}
          </el-descriptions-item>
          <el-descriptions-item label="颜色" :span="2">
            {{ detailFormData.color }}
          </el-descriptions-item>
          <el-descriptions-item label="图标" :span="2">
            {{ detailFormData.icon }}
          </el-descriptions-item>
          <el-descriptions-item label="适用类型" :span="2">
            {{ detailFormData.applicable_types }}
          </el-descriptions-item>
          <el-descriptions-item label="是否多选" :span="2">
            {{ detailFormData.is_multi_select }}
          </el-descriptions-item>
          <el-descriptions-item label="是否必填" :span="2">
            {{ detailFormData.is_required }}
          </el-descriptions-item>
          <el-descriptions-item label="验证规则" :span="2">
            {{ detailFormData.validation_rule }}
          </el-descriptions-item>
          <el-descriptions-item label="状态" :span="2">
            <el-tag :type="detailFormData.status == '0' ? 'success' : 'danger'">
              {{ detailFormData.status == "0" ? "启用" : "停用" }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="排序" :span="2">
            {{ detailFormData.sort_order }}
          </el-descriptions-item>
          <el-descriptions-item label="使用次数" :span="2">
            {{ detailFormData.usage_count }}
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
          <el-descriptions-item label="版本号" :span="2">
            {{ detailFormData.version }}
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
          <el-form-item label="标签编号" prop="tag_code" :required="true">
            <el-input v-model="formData.tag_code" placeholder="请输入标签编号" />
          </el-form-item>
          <el-form-item label="标签名称" prop="tag_name" :required="true">
            <el-input v-model="formData.tag_name" placeholder="请输入标签名称" />
          </el-form-item>
          <el-form-item label="分类" prop="category" :required="false">
            <el-input v-model="formData.category" placeholder="请输入分类" />
          </el-form-item>
          <el-form-item label="颜色" prop="color" :required="false">
            <el-input v-model="formData.color" placeholder="请输入颜色" />
          </el-form-item>
          <el-form-item label="图标" prop="icon" :required="false">
            <el-input v-model="formData.icon" placeholder="请输入图标" />
          </el-form-item>
          <el-form-item label="适用类型" prop="applicable_types" :required="false">
            <el-input v-model="formData.applicable_types" placeholder="请输入适用类型" />
          </el-form-item>
          <el-form-item label="是否多选" prop="is_multi_select" :required="false">
            <el-input v-model="formData.is_multi_select" placeholder="请输入是否多选" />
          </el-form-item>
          <el-form-item label="是否必填" prop="is_required" :required="false">
            <el-input v-model="formData.is_required" placeholder="请输入是否必填" />
          </el-form-item>
          <el-form-item label="验证规则" prop="validation_rule" :required="false">
            <el-input v-model="formData.validation_rule" placeholder="请输入验证规则" />
          </el-form-item>
          <el-form-item label="状态" prop="status" :required="true">
            <el-radio-group v-model="formData.status">
              <el-radio value="0">启用</el-radio>
              <el-radio value="1">停用</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="排序" prop="sort_order" :required="false">
            <el-input v-model="formData.sort_order" placeholder="请输入排序" />
          </el-form-item>
          <el-form-item label="使用次数" prop="usage_count" :required="false">
            <el-input v-model="formData.usage_count" placeholder="请输入使用次数" />
          </el-form-item>
          <el-form-item label="版本号" prop="version" :required="false">
            <el-input v-model="formData.version" placeholder="请输入版本号" />
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
  name: "CrmTagDefinitions",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmTagDefinitionsAPI, {
  CrmTagDefinitionsPageQuery,
  CrmTagDefinitionsTable,
  CrmTagDefinitionsForm,
} from "@/api/module_crm/customers_tag_definitions";
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
  permPrefix: "module_crm:customers_tag_definitions",
  colon: true,
  isExpandable: true,
  showNumber: 2,
  form: { labelWidth: "auto" },
  formItems: [
    {
      prop: "tag_code",
      label: "标签编号",
      type: "input",
      attrs: { placeholder: "请输入标签编号", clearable: true },
    },
    {
      prop: "tag_name",
      label: "标签名称",
      type: "input",
      attrs: { placeholder: "请输入标签名称", clearable: true },
    },
    {
      prop: "tag_type",
      label: "标签类型",
      type: "input",
      attrs: { placeholder: "请输入标签类型", clearable: true },
    },
    {
      prop: "category",
      label: "分类",
      type: "input",
      attrs: { placeholder: "请输入分类", clearable: true },
    },
    {
      prop: "color",
      label: "颜色",
      type: "input",
      attrs: { placeholder: "请输入颜色", clearable: true },
    },
    {
      prop: "icon",
      label: "图标",
      type: "input",
      attrs: { placeholder: "请输入图标", clearable: true },
    },
    {
      prop: "applicable_types",
      label: "适用类型",
      type: "input",
      attrs: { placeholder: "请输入适用类型", clearable: true },
    },
    {
      prop: "is_multi_select",
      label: "是否多选",
      type: "input",
      attrs: { placeholder: "请输入是否多选", clearable: true },
    },
    {
      prop: "is_required",
      label: "是否必填",
      type: "input",
      attrs: { placeholder: "请输入是否必填", clearable: true },
    },
    {
      prop: "validation_rule",
      label: "验证规则",
      type: "input",
      attrs: { placeholder: "请输入验证规则", clearable: true },
    },
    {
      prop: "status",
      label: "状态",
      type: "select",
      options: [
        { label: "启用", value: "0" },
        { label: "停用", value: "1" },
      ],
      attrs: { placeholder: "请选择状态", clearable: true, style: { width: "170px" } },
    },
    {
      prop: "sort_order",
      label: "排序",
      type: "input",
      attrs: { placeholder: "请输入排序", clearable: true },
    },
    {
      prop: "usage_count",
      label: "使用次数",
      type: "input",
      attrs: { placeholder: "请输入使用次数", clearable: true },
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
      prop: "version",
      label: "版本号",
      type: "input",
      attrs: { placeholder: "请输入版本号", clearable: true },
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
  { prop: "tag_code", label: "标签编号", show: true },
  { prop: "tag_name", label: "标签名称", show: true },
  { prop: "tag_type", label: "标签类型", show: true },
  { prop: "category", label: "分类", show: true },
  { prop: "color", label: "颜色", show: true },
  { prop: "icon", label: "图标", show: true },
  { prop: "applicable_types", label: "适用类型", show: true },
  { prop: "is_multi_select", label: "是否多选", show: true },
  { prop: "is_required", label: "是否必填", show: true },
  { prop: "validation_rule", label: "验证规则", show: true },
  { prop: "status", label: "系统状态(0:正常 1:禁用)", show: true },
  { prop: "sort_order", label: "排序", show: true },
  { prop: "usage_count", label: "使用次数", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "updated_time", label: "更新时间", show: true },
  { prop: "created_id", label: "创建人ID（外键→sys_user）", show: true },
  { prop: "updated_id", label: "更新人ID（外键→sys_user）", show: true },
  { prop: "version", label: "版本号", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "deleted_id", label: "删除人ID（外键→sys_user）", show: true },
  { prop: "description", label: "备注/描述", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmTagDefinitionsQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmTagDefinitionsPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmTagDefinitionsPageQuery>>({
  permPrefix: "module_crm:customers_tag_definitions",
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
    const res = await CrmTagDefinitionsAPI.listCrmTagDefinitions(
      normalizeCrmTagDefinitionsQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmTagDefinitionsAPI.deleteCrmTagDefinitions(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmTagDefinitionsAPI.downloadTemplateCrmTagDefinitions(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmTagDefinitionsAPI.importCrmTagDefinitions(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmTagDefinitionsPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmTagDefinitionsTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmTagDefinitionsAPI.listCrmTagDefinitions(
          normalizeCrmTagDefinitionsQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

const detailFormData = ref<CrmTagDefinitionsTable>({});

const formData = reactive<CrmTagDefinitionsForm>({
  tag_code: undefined,
  tag_name: undefined,
  tag_type: undefined,
  category: undefined,
  color: undefined,
  icon: undefined,
  applicable_types: undefined,
  is_multi_select: undefined,
  is_required: undefined,
  validation_rule: undefined,
  status: undefined,
  sort_order: undefined,
  usage_count: undefined,
  version: undefined,
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
  tag_code: [{ required: true, message: "请填写标签编号", trigger: "blur" }],
  tag_name: [{ required: true, message: "请填写标签名称", trigger: "blur" }],
  tag_type: [{ required: true, message: "请填写标签类型", trigger: "blur" }],
  category: [{ required: false, message: "请填写分类", trigger: "blur" }],
  color: [{ required: false, message: "请填写颜色", trigger: "blur" }],
  icon: [{ required: false, message: "请填写图标", trigger: "blur" }],
  applicable_types: [{ required: false, message: "请填写适用类型", trigger: "blur" }],
  is_multi_select: [{ required: false, message: "请填写是否多选", trigger: "blur" }],
  is_required: [{ required: false, message: "请填写是否必填", trigger: "blur" }],
  validation_rule: [{ required: false, message: "请填写验证规则", trigger: "blur" }],
  status: [{ required: false, message: "请填写系统状态(0:正常 1:禁用)", trigger: "blur" }],
  sort_order: [{ required: false, message: "请填写排序", trigger: "blur" }],
  usage_count: [{ required: false, message: "请填写使用次数", trigger: "blur" }],
  version: [{ required: false, message: "请填写版本号", trigger: "blur" }],
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

function handleRowDelete(id: number) {
  contentRef.value?.handleDelete(id);
}

const initialFormData: CrmTagDefinitionsForm = {
  tag_code: undefined,
  tag_name: undefined,
  tag_type: undefined,
  category: undefined,
  color: undefined,
  icon: undefined,
  applicable_types: undefined,
  is_multi_select: undefined,
  is_required: undefined,
  validation_rule: undefined,
  status: undefined,
  sort_order: undefined,
  usage_count: undefined,
  version: undefined,
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
    const response = await CrmTagDefinitionsAPI.detailCrmTagDefinitions(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增标签定义";
    formData.tag_code = undefined;
    formData.tag_name = undefined;
    formData.tag_type = undefined;
    formData.category = undefined;
    formData.color = undefined;
    formData.icon = undefined;
    formData.applicable_types = undefined;
    formData.is_multi_select = undefined;
    formData.is_required = undefined;
    formData.validation_rule = undefined;
    formData.status = undefined;
    formData.sort_order = undefined;
    formData.usage_count = undefined;
    formData.version = undefined;
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
          await CrmTagDefinitionsAPI.updateCrmTagDefinitions(id, { ...submitData, [PK]: id });
        } else {
          await CrmTagDefinitionsAPI.createCrmTagDefinitions(submitData);
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
        await CrmTagDefinitionsAPI.batchCrmTagDefinitions({ ids, status });
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
