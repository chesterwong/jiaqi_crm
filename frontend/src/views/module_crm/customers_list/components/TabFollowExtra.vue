<template>
  <div class="tab-follow-extra">
    <template v-if="mode === 'view'">
      <el-descriptions :column="3" border>
        <el-descriptions-item label="健康度" :span="1">
          {{ getOptionLabel(healthScoreOptions, modelValue.health_score) }}
        </el-descriptions-item>
        <el-descriptions-item label="流失风险" :span="1">
          {{ getOptionLabel(churnRiskOptions, modelValue.churn_risk) }}
        </el-descriptions-item>
        <el-descriptions-item label="保护截止日" :span="1">
          {{ modelValue.protection_deadline }}
        </el-descriptions-item>
        <el-descriptions-item label="领取时间" :span="1">
          {{ modelValue.claim_time }}
        </el-descriptions-item>
        <el-descriptions-item label="最后跟进时间" :span="1">
          {{ modelValue.last_followup_at }}
        </el-descriptions-item>
        <el-descriptions-item label="下次跟进时间" :span="1">
          {{ modelValue.next_followup_at }}
        </el-descriptions-item>
        <el-descriptions-item label="描述" :span="3">
          {{ modelValue.description || "-" }}
        </el-descriptions-item>
      </el-descriptions>
    </template>
    <template v-else>
      <el-form
        ref="formRef"
        :model="modelValue"
        :rules="rules"
        label-suffix=":"
        label-width="100px"
        label-position="right"
      >
        <el-divider content-position="left">客户健康</el-divider>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="健康度" prop="health_score">
              <el-select
                v-model="modelValue.health_score"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in healthScoreOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="流失风险" prop="churn_risk">
              <el-select
                v-model="modelValue.churn_risk"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in churnRiskOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="保护截止日" prop="protection_deadline">
              <el-date-picker
                v-model="modelValue.protection_deadline"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="领取时间" prop="claim_time">
              <el-date-picker
                v-model="modelValue.claim_time"
                type="datetime"
                value-format="YYYY-MM-DD HH:mm:ss"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="最后跟进时间" prop="last_followup_at">
              <el-date-picker
                v-model="modelValue.last_followup_at"
                type="datetime"
                value-format="YYYY-MM-DD HH:mm:ss"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="下次跟进时间" prop="next_followup_at">
              <el-date-picker
                v-model="modelValue.next_followup_at"
                type="datetime"
                value-format="YYYY-MM-DD HH:mm:ss"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
        </el-row>

        <el-divider content-position="left">备注信息</el-divider>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="描述" prop="description">
              <el-input
                v-model="modelValue.description"
                type="textarea"
                :rows="3"
                :maxlength="500"
                show-word-limit
                placeholder="请输入"
              />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from "vue";
import type { CrmCustomersForm } from "@/api/module_crm/customers_list";
import { getOptionLabel, useDictOptions } from "@/composables/useDictOptions";
import { DICT_TYPE_MAP } from "@/api/module_crm/customers_list";

const props = defineProps<{
  modelValue: CrmCustomersForm;
  mode: "create" | "edit" | "view";
}>();

const formRef = ref();

const { options: healthScoreOptions, ensureLoaded: loadHealthScore } = useDictOptions(
  DICT_TYPE_MAP.health_score
);
const { options: churnRiskOptions, ensureLoaded: loadChurnRisk } = useDictOptions(
  DICT_TYPE_MAP.churn_risk
);

const rules = reactive<Record<string, any>>({});

defineExpose({ formRef });

onMounted(async () => {
  await Promise.all([loadHealthScore(), loadChurnRisk()]);
});
</script>
