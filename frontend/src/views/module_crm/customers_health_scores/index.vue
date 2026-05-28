<!-- 健康评分：PageSearch + PageContent + useCrudList（与项目 CURD 规范一致）；页面路由 /module_crm/customers_health_scores -->
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
          :perm-create="['module_crm:customers_health_scores:create']"
          :perm-delete="['module_crm:customers_health_scores:delete']"
          :perm-patch="['module_crm:customers_health_scores:patch']"
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
              v-if="contentCols.find((col) => col.prop === 'score_date')?.show"
              label="评分日期"
              prop="score_date"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'overall_score')?.show"
              label="综合评分"
              min-width="180"
              align="center"
            >
              <template #default="scope">
                <HealthScoreCard :score="scope.row.overall_score" :level="scope.row.health_level" />
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'health_level')?.show"
              label="健康等级"
              prop="health_level"
              min-width="100"
            >
              <template #default="scope">
                <el-tag
                  v-if="scope.row.health_level"
                  :type="healthLevelTagType(scope.row.health_level)"
                  size="small"
                  effect="dark"
                >
                  {{ healthLevelLabel(scope.row.health_level) }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'dimension_scores')?.show"
              label="维度评分"
              prop="dimension_scores"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'product_usage')?.show"
              label="产品使用情况"
              prop="product_usage"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'adoption_rate')?.show"
              label="采用率"
              prop="adoption_rate"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'engagement_score')?.show"
              label="参与度评分"
              prop="engagement_score"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'avg_contact_frequency')?.show"
              label="平均联系频率"
              prop="avg_contact_frequency"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'last_interaction_date')?.show"
              label="最后互动日期"
              prop="last_interaction_date"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'payment_score')?.show"
              label="付款评分"
              prop="payment_score"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'revenue_trend')?.show"
              label="收入趋势"
              prop="revenue_trend"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'arpu')?.show"
              label="ARPU"
              prop="arpu"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'satisfaction_score')?.show"
              label="满意度评分"
              prop="satisfaction_score"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'nps_score')?.show"
              label="NPS评分"
              prop="nps_score"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'last_survey_date')?.show"
              label="最后调查日期"
              prop="last_survey_date"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'risk_indicators')?.show"
              label="风险指标"
              prop="risk_indicators"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'churn_signals')?.show"
              label="流失信号"
              prop="churn_signals"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'churn_probability')?.show"
              label="流失概率"
              prop="churn_probability"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'expansion_probability')?.show"
              label="扩展概率"
              prop="expansion_probability"
              min-width="140"
              show-overflow-tooltip
            />
            <el-table-column
              v-if="contentCols.find((col) => col.prop === 'ai_insights')?.show"
              label="AI洞察"
              prop="ai_insights"
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
                  v-hasPerm="['module_crm:customers_health_scores:detail']"
                  type="info"
                  size="small"
                  link
                  icon="View"
                  @click="handleOpenDialog('detail', scope.row['id'])"
                >
                  详情
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_health_scores:update']"
                  type="primary"
                  size="small"
                  link
                  icon="Edit"
                  @click="handleOpenDialog('update', scope.row['id'])"
                >
                  编辑
                </el-button>
                <el-button
                  v-hasPerm="['module_crm:customers_health_scores:delete']"
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
          <el-descriptions-item label="评分日期" :span="2">
            {{ detailFormData.score_date }}
          </el-descriptions-item>
          <el-descriptions-item label="综合评分" :span="2">
            {{ detailFormData.overall_score }}
          </el-descriptions-item>
          <el-descriptions-item label="健康等级" :span="2">
            {{ detailFormData.health_level }}
          </el-descriptions-item>
          <el-descriptions-item label="维度评分" :span="2">
            {{ detailFormData.dimension_scores }}
          </el-descriptions-item>
          <el-descriptions-item label="产品使用情况" :span="2">
            {{ detailFormData.product_usage }}
          </el-descriptions-item>
          <el-descriptions-item label="采用率" :span="2">
            {{ detailFormData.adoption_rate }}
          </el-descriptions-item>
          <el-descriptions-item label="参与度评分" :span="2">
            {{ detailFormData.engagement_score }}
          </el-descriptions-item>
          <el-descriptions-item label="平均联系频率" :span="2">
            {{ detailFormData.avg_contact_frequency }}
          </el-descriptions-item>
          <el-descriptions-item label="最后互动日期" :span="2">
            {{ detailFormData.last_interaction_date }}
          </el-descriptions-item>
          <el-descriptions-item label="付款评分" :span="2">
            {{ detailFormData.payment_score }}
          </el-descriptions-item>
          <el-descriptions-item label="收入趋势" :span="2">
            {{ detailFormData.revenue_trend }}
          </el-descriptions-item>
          <el-descriptions-item label="ARPU" :span="2">
            {{ detailFormData.arpu }}
          </el-descriptions-item>
          <el-descriptions-item label="满意度评分" :span="2">
            {{ detailFormData.satisfaction_score }}
          </el-descriptions-item>
          <el-descriptions-item label="NPS评分" :span="2">
            {{ detailFormData.nps_score }}
          </el-descriptions-item>
          <el-descriptions-item label="最后调查日期" :span="2">
            {{ detailFormData.last_survey_date }}
          </el-descriptions-item>
          <el-descriptions-item label="风险指标" :span="2">
            {{ detailFormData.risk_indicators }}
          </el-descriptions-item>
          <el-descriptions-item label="流失信号" :span="2">
            {{ detailFormData.churn_signals }}
          </el-descriptions-item>
          <el-descriptions-item label="流失概率" :span="2">
            {{ detailFormData.churn_probability }}
          </el-descriptions-item>
          <el-descriptions-item label="扩展概率" :span="2">
            {{ detailFormData.expansion_probability }}
          </el-descriptions-item>
          <el-descriptions-item label="AI洞察" :span="2">
            {{ detailFormData.ai_insights }}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间" :span="2">
            {{ detailFormData.created_time }}
          </el-descriptions-item>
          <el-descriptions-item label="创建人" :span="2">
            {{ detailFormData.created_by?.name }}
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
          <el-form-item label="客户ID,关联对应表" prop="customer_id" :required="true">
            <el-input v-model="formData.customer_id" placeholder="请输入客户ID,关联对应表" />
          </el-form-item>
          <el-form-item label="评分日期" prop="score_date" :required="true">
            <el-date-picker
              v-model="formData.score_date"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择评分日期"
            />
          </el-form-item>
          <el-form-item label="综合评分" prop="overall_score" :required="true">
            <el-input v-model="formData.overall_score" placeholder="请输入综合评分" />
          </el-form-item>
          <el-form-item label="健康等级" prop="health_level" :required="true">
            <el-input v-model="formData.health_level" placeholder="请输入健康等级" />
          </el-form-item>
          <el-form-item label="维度评分" prop="dimension_scores" :required="true">
            <el-input v-model="formData.dimension_scores" placeholder="请输入维度评分" />
          </el-form-item>
          <el-form-item label="产品使用情况" prop="product_usage" :required="false">
            <el-input v-model="formData.product_usage" placeholder="请输入产品使用情况" />
          </el-form-item>
          <el-form-item label="采用率" prop="adoption_rate" :required="false">
            <el-input v-model="formData.adoption_rate" placeholder="请输入采用率" />
          </el-form-item>
          <el-form-item label="参与度评分" prop="engagement_score" :required="false">
            <el-input v-model="formData.engagement_score" placeholder="请输入参与度评分" />
          </el-form-item>
          <el-form-item label="平均联系频率" prop="avg_contact_frequency" :required="false">
            <el-input v-model="formData.avg_contact_frequency" placeholder="请输入平均联系频率" />
          </el-form-item>
          <el-form-item label="最后互动日期" prop="last_interaction_date" :required="false">
            <el-date-picker
              v-model="formData.last_interaction_date"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择最后互动日期"
            />
          </el-form-item>
          <el-form-item label="付款评分" prop="payment_score" :required="false">
            <el-input v-model="formData.payment_score" placeholder="请输入付款评分" />
          </el-form-item>
          <el-form-item label="收入趋势" prop="revenue_trend" :required="false">
            <el-input v-model="formData.revenue_trend" placeholder="请输入收入趋势" />
          </el-form-item>
          <el-form-item label="ARPU" prop="arpu" :required="false">
            <el-input v-model="formData.arpu" placeholder="请输入ARPU" />
          </el-form-item>
          <el-form-item label="满意度评分" prop="satisfaction_score" :required="false">
            <el-input v-model="formData.satisfaction_score" placeholder="请输入满意度评分" />
          </el-form-item>
          <el-form-item label="NPS评分" prop="nps_score" :required="false">
            <el-input v-model="formData.nps_score" placeholder="请输入NPS评分" />
          </el-form-item>
          <el-form-item label="最后调查日期" prop="last_survey_date" :required="false">
            <el-date-picker
              v-model="formData.last_survey_date"
              type="datetime"
              value-format="YYYY-MM-DD HH:mm:ss"
              placeholder="请选择最后调查日期"
            />
          </el-form-item>
          <el-form-item label="风险指标" prop="risk_indicators" :required="false">
            <el-input v-model="formData.risk_indicators" placeholder="请输入风险指标" />
          </el-form-item>
          <el-form-item label="流失信号" prop="churn_signals" :required="false">
            <el-input v-model="formData.churn_signals" placeholder="请输入流失信号" />
          </el-form-item>
          <el-form-item label="流失概率" prop="churn_probability" :required="false">
            <el-input v-model="formData.churn_probability" placeholder="请输入流失概率" />
          </el-form-item>
          <el-form-item label="扩展概率" prop="expansion_probability" :required="false">
            <el-input v-model="formData.expansion_probability" placeholder="请输入扩展概率" />
          </el-form-item>
          <el-form-item label="AI洞察" prop="ai_insights" :required="false">
            <el-input v-model="formData.ai_insights" placeholder="请输入AI洞察" />
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
  name: "CrmCustomerHealthScores",
  inheritAttrs: false,
});

import { ref, reactive, onMounted, markRaw, nextTick } from "vue";
import { fetchAllPages } from "@/utils/fetchAllPages";
import { ElMessageBox } from "element-plus";
import { ResultEnum } from "@/enums/api/result.enum";
import { useDictStore } from "@/store";
import CrmCustomerHealthScoresAPI, {
  CrmCustomerHealthScoresPageQuery,
  CrmCustomerHealthScoresTable,
  CrmCustomerHealthScoresForm,
} from "@/api/module_crm/customers_health_scores";
import CrudToolbarLeft from "@/components/CURD/CrudToolbarLeft.vue";
import CrudToolbarRight from "@/components/CURD/CrudToolbarRight.vue";
import PageSearch from "@/components/CURD/PageSearch.vue";
import PageContent from "@/components/CURD/PageContent.vue";
import EnhancedDialog from "@/components/CURD/EnhancedDialog.vue";
import { useCrudList } from "@/components/CURD/useCrudList";
import UserTableSelect from "@/views/module_system/user/components/UserTableSelect.vue";
import HealthScoreCard from "@/components/CRM/HealthScoreCard.vue";
import type { IContentConfig, ISearchConfig } from "@/components/CURD/types";

const { searchRef, contentRef, handleQueryClick, handleResetClick, refreshList } = useCrudList();

/** 数据表主键字段名（与导入表结构一致，避免非 id 主键时操作错行） */
const PK = "id" as const;

function triggerUserSearch() {
  nextTick(() => refreshList());
}

const searchConfig = reactive<ISearchConfig>({
  permPrefix: "module_crm:customers_health_scores",
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
      prop: "score_date",
      label: "评分日期",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择评分日期",
      },
    },
    {
      prop: "overall_score",
      label: "综合评分",
      type: "input",
      attrs: { placeholder: "请输入综合评分", clearable: true },
    },
    {
      prop: "health_level",
      label: "健康等级",
      type: "input",
      attrs: { placeholder: "请输入健康等级", clearable: true },
    },
    {
      prop: "dimension_scores",
      label: "维度评分",
      type: "input",
      attrs: { placeholder: "请输入维度评分", clearable: true },
    },
    {
      prop: "product_usage",
      label: "产品使用情况",
      type: "input",
      attrs: { placeholder: "请输入产品使用情况", clearable: true },
    },
    {
      prop: "adoption_rate",
      label: "采用率",
      type: "input",
      attrs: { placeholder: "请输入采用率", clearable: true },
    },
    {
      prop: "engagement_score",
      label: "参与度评分",
      type: "input",
      attrs: { placeholder: "请输入参与度评分", clearable: true },
    },
    {
      prop: "avg_contact_frequency",
      label: "平均联系频率",
      type: "input",
      attrs: { placeholder: "请输入平均联系频率", clearable: true },
    },
    {
      prop: "last_interaction_date",
      label: "最后互动日期",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择最后互动日期",
      },
    },
    {
      prop: "payment_score",
      label: "付款评分",
      type: "input",
      attrs: { placeholder: "请输入付款评分", clearable: true },
    },
    {
      prop: "revenue_trend",
      label: "收入趋势",
      type: "input",
      attrs: { placeholder: "请输入收入趋势", clearable: true },
    },
    {
      prop: "arpu",
      label: "ARPU",
      type: "input",
      attrs: { placeholder: "请输入ARPU", clearable: true },
    },
    {
      prop: "satisfaction_score",
      label: "满意度评分",
      type: "input",
      attrs: { placeholder: "请输入满意度评分", clearable: true },
    },
    {
      prop: "nps_score",
      label: "NPS评分",
      type: "input",
      attrs: { placeholder: "请输入NPS评分", clearable: true },
    },
    {
      prop: "last_survey_date",
      label: "最后调查日期",
      type: "date-picker",
      attrs: {
        type: "date",
        valueFormat: "YYYY-MM-DD",
        clearable: true,
        placeholder: "请选择最后调查日期",
      },
    },
    {
      prop: "risk_indicators",
      label: "风险指标",
      type: "input",
      attrs: { placeholder: "请输入风险指标", clearable: true },
    },
    {
      prop: "churn_signals",
      label: "流失信号",
      type: "input",
      attrs: { placeholder: "请输入流失信号", clearable: true },
    },
    {
      prop: "churn_probability",
      label: "流失概率",
      type: "input",
      attrs: { placeholder: "请输入流失概率", clearable: true },
    },
    {
      prop: "expansion_probability",
      label: "扩展概率",
      type: "input",
      attrs: { placeholder: "请输入扩展概率", clearable: true },
    },
    {
      prop: "ai_insights",
      label: "AI洞察",
      type: "input",
      attrs: { placeholder: "请输入AI洞察", clearable: true },
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
  { prop: "customer_id", label: "客户ID,关联对应表", show: true },
  { prop: "score_date", label: "评分日期", show: true },
  { prop: "overall_score", label: "综合评分", show: true },
  { prop: "health_level", label: "健康等级", show: true },
  { prop: "dimension_scores", label: "维度评分", show: true },
  { prop: "product_usage", label: "产品使用情况", show: true },
  { prop: "adoption_rate", label: "采用率", show: true },
  { prop: "engagement_score", label: "参与度评分", show: true },
  { prop: "avg_contact_frequency", label: "平均联系频率", show: true },
  { prop: "last_interaction_date", label: "最后互动日期", show: true },
  { prop: "payment_score", label: "付款评分", show: true },
  { prop: "revenue_trend", label: "收入趋势", show: true },
  { prop: "arpu", label: "ARPU", show: true },
  { prop: "satisfaction_score", label: "满意度评分", show: true },
  { prop: "nps_score", label: "NPS评分", show: true },
  { prop: "last_survey_date", label: "最后调查日期", show: true },
  { prop: "risk_indicators", label: "风险指标", show: true },
  { prop: "churn_signals", label: "流失信号", show: true },
  { prop: "churn_probability", label: "流失概率", show: true },
  { prop: "expansion_probability", label: "扩展概率", show: true },
  { prop: "ai_insights", label: "AI洞察", show: true },
  { prop: "created_time", label: "创建时间", show: true },
  { prop: "created_id", label: "创建人ID（外键→sys_user）", show: true },
  { prop: "version", label: "版本号", show: true },
  { prop: "is_deleted", label: "是否已删除(false:否 true:是)", show: true },
  { prop: "deleted_time", label: "删除时间", show: true },
  { prop: "deleted_id", label: "删除人ID（外键→sys_user）", show: true },
  { prop: "description", label: "备注/描述", show: true },
  { prop: "dept_id", label: "所属部门ID(关联sys_dept.id)", show: true },
  { prop: "owner_id", label: "负责人ID(关联sys_user.id)", show: true },
  { prop: "operation", label: "操作", show: true },
]);

function normalizeCrmCustomerHealthScoresQuery(params: Record<string, unknown>) {
  const p = { ...params } as Record<string, unknown>;
  if (Array.isArray(p.created_time) && p.created_time.length === 0) p.created_time = undefined;
  if (Array.isArray(p.updated_time) && p.updated_time.length === 0) p.updated_time = undefined;
  return p as unknown as CrmCustomerHealthScoresPageQuery;
}

const contentConfig = reactive<IContentConfig<CrmCustomerHealthScoresPageQuery>>({
  permPrefix: "module_crm:customers_health_scores",
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
    const res = await CrmCustomerHealthScoresAPI.listCrmCustomerHealthScores(
      normalizeCrmCustomerHealthScoresQuery(params as unknown as Record<string, unknown>)
    );
    return {
      total: res.data.data.total,
      list: res.data.data.items,
    };
  },
  deleteAction: (ids) =>
    CrmCustomerHealthScoresAPI.deleteCrmCustomerHealthScores(
      ids
        .split(",")
        .map((s) => Number(s.trim()))
        .filter((n) => !Number.isNaN(n) && n > 0)
    ),
  importTemplate: () => CrmCustomerHealthScoresAPI.downloadTemplateCrmCustomerHealthScores(),
  importAction: (file: File) => {
    const fd = new FormData();
    fd.append("file", file);
    return CrmCustomerHealthScoresAPI.importCrmCustomerHealthScores(fd).then((res) => {
      if (res.data.code !== ResultEnum.SUCCESS) {
        return Promise.reject(new Error(res.data.msg));
      }
    });
  },
  exportsAction: async (params: CrmCustomerHealthScoresPageQuery) => {
    const query: Record<string, unknown> = { ...params };
    return fetchAllPages<CrmCustomerHealthScoresTable>({
      pageSize: 9999,
      initialQuery: query,
      fetchPage: async (q) => {
        const res = await CrmCustomerHealthScoresAPI.listCrmCustomerHealthScores(
          normalizeCrmCustomerHealthScoresQuery(q as unknown as Record<string, unknown>)
        );
        return {
          total: res.data?.data?.total ?? 0,
          list: res.data?.data?.items ?? [],
        };
      },
    });
  },
});

// ── 健康评分辅助函数 ──
function healthLevelLabel(level: string): string {
  const map: Record<string, string> = {
    healthy: "健康",
    warning: "预警",
    critical: "危险",
    excellent: "优秀",
    good: "良好",
    fair: "一般",
    poor: "较差",
  };
  return map[level] || level || "-";
}
function healthLevelTagType(level: string): "success" | "warning" | "danger" | "info" | "primary" {
  const map: Record<string, "success" | "warning" | "danger" | "info" | "primary"> = {
    healthy: "success",
    excellent: "success",
    warning: "warning",
    fair: "warning",
    critical: "danger",
    poor: "danger",
    good: "primary",
  };
  return map[level] || "info";
}

const detailFormData = ref<CrmCustomerHealthScoresTable>({});

const formData = reactive<CrmCustomerHealthScoresForm>({
  customer_id: undefined,
  score_date: undefined,
  overall_score: undefined,
  health_level: undefined,
  dimension_scores: undefined,
  product_usage: undefined,
  adoption_rate: undefined,
  engagement_score: undefined,
  avg_contact_frequency: undefined,
  last_interaction_date: undefined,
  payment_score: undefined,
  revenue_trend: undefined,
  arpu: undefined,
  satisfaction_score: undefined,
  nps_score: undefined,
  last_survey_date: undefined,
  risk_indicators: undefined,
  churn_signals: undefined,
  churn_probability: undefined,
  expansion_probability: undefined,
  ai_insights: undefined,
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
  customer_id: [{ required: true, message: "请填写客户ID,关联对应表", trigger: "blur" }],
  score_date: [{ required: true, message: "请填写评分日期", trigger: "blur" }],
  overall_score: [{ required: true, message: "请填写综合评分", trigger: "blur" }],
  health_level: [{ required: true, message: "请填写健康等级", trigger: "blur" }],
  dimension_scores: [{ required: true, message: "请填写维度评分", trigger: "blur" }],
  product_usage: [{ required: false, message: "请填写产品使用情况", trigger: "blur" }],
  adoption_rate: [{ required: false, message: "请填写采用率", trigger: "blur" }],
  engagement_score: [{ required: false, message: "请填写参与度评分", trigger: "blur" }],
  avg_contact_frequency: [{ required: false, message: "请填写平均联系频率", trigger: "blur" }],
  last_interaction_date: [{ required: false, message: "请填写最后互动日期", trigger: "blur" }],
  payment_score: [{ required: false, message: "请填写付款评分", trigger: "blur" }],
  revenue_trend: [{ required: false, message: "请填写收入趋势", trigger: "blur" }],
  arpu: [{ required: false, message: "请填写ARPU", trigger: "blur" }],
  satisfaction_score: [{ required: false, message: "请填写满意度评分", trigger: "blur" }],
  nps_score: [{ required: false, message: "请填写NPS评分", trigger: "blur" }],
  last_survey_date: [{ required: false, message: "请填写最后调查日期", trigger: "blur" }],
  risk_indicators: [{ required: false, message: "请填写风险指标", trigger: "blur" }],
  churn_signals: [{ required: false, message: "请填写流失信号", trigger: "blur" }],
  churn_probability: [{ required: false, message: "请填写流失概率", trigger: "blur" }],
  expansion_probability: [{ required: false, message: "请填写扩展概率", trigger: "blur" }],
  ai_insights: [{ required: false, message: "请填写AI洞察", trigger: "blur" }],
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

const initialFormData: CrmCustomerHealthScoresForm = {
  customer_id: undefined,
  score_date: undefined,
  overall_score: undefined,
  health_level: undefined,
  dimension_scores: undefined,
  product_usage: undefined,
  adoption_rate: undefined,
  engagement_score: undefined,
  avg_contact_frequency: undefined,
  last_interaction_date: undefined,
  payment_score: undefined,
  revenue_trend: undefined,
  arpu: undefined,
  satisfaction_score: undefined,
  nps_score: undefined,
  last_survey_date: undefined,
  risk_indicators: undefined,
  churn_signals: undefined,
  churn_probability: undefined,
  expansion_probability: undefined,
  ai_insights: undefined,
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
    const response = await CrmCustomerHealthScoresAPI.detailCrmCustomerHealthScores(id);
    if (type === "detail") {
      dialogVisible.title = "详情";
      Object.assign(detailFormData.value, response.data.data);
    } else if (type === "update") {
      dialogVisible.title = "修改";
      Object.assign(formData, response.data.data);
    }
  } else {
    dialogVisible.title = "新增健康评分";
    formData.customer_id = undefined;
    formData.score_date = undefined;
    formData.overall_score = undefined;
    formData.health_level = undefined;
    formData.dimension_scores = undefined;
    formData.product_usage = undefined;
    formData.adoption_rate = undefined;
    formData.engagement_score = undefined;
    formData.avg_contact_frequency = undefined;
    formData.last_interaction_date = undefined;
    formData.payment_score = undefined;
    formData.revenue_trend = undefined;
    formData.arpu = undefined;
    formData.satisfaction_score = undefined;
    formData.nps_score = undefined;
    formData.last_survey_date = undefined;
    formData.risk_indicators = undefined;
    formData.churn_signals = undefined;
    formData.churn_probability = undefined;
    formData.expansion_probability = undefined;
    formData.ai_insights = undefined;
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
          await CrmCustomerHealthScoresAPI.updateCrmCustomerHealthScores(id, {
            ...submitData,
            [PK]: id,
          });
        } else {
          await CrmCustomerHealthScoresAPI.createCrmCustomerHealthScores(submitData);
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
        await CrmCustomerHealthScoresAPI.batchCrmCustomerHealthScores({ ids, status });
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
