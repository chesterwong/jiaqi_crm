<template>
  <div class="tab-basic-info">
    <template v-if="mode === 'view'">
      <el-descriptions :column="3" border>
        <el-descriptions-item label="客户编号" :span="1">
          {{ modelValue.customer_code }}
        </el-descriptions-item>
        <el-descriptions-item label="客户名称" :span="1">
          {{ modelValue.customer_name }}
        </el-descriptions-item>
        <el-descriptions-item label="客户简称" :span="1">
          {{ modelValue.customer_short_name }}
        </el-descriptions-item>
        <el-descriptions-item label="客户类型" :span="1">
          {{ getOptionLabel(customerTypeOptions, modelValue.customer_type) }}
        </el-descriptions-item>
        <el-descriptions-item label="所属行业" :span="1">
          {{ modelValue.industry }}
        </el-descriptions-item>
        <el-descriptions-item label="客户来源" :span="1">
          {{ getOptionLabel(sourceOptions, modelValue.source) }}
        </el-descriptions-item>
        <el-descriptions-item label="客户状态" :span="1">
          {{ getOptionLabel(customerStatusOptions, modelValue.customer_status) }}
        </el-descriptions-item>
        <el-descriptions-item label="客户等级" :span="1">
          {{ getOptionLabel(customerLevelOptions, modelValue.customer_level) }}
        </el-descriptions-item>
        <el-descriptions-item label="企业规模" :span="1">
          {{ getOptionLabel(scaleOptions, modelValue.scale) }}
        </el-descriptions-item>
        <el-descriptions-item label="负责人" :span="1">
          {{ modelValue.owner_id }}
        </el-descriptions-item>
        <el-descriptions-item label="所属部门" :span="1">
          {{ modelValue.department_id }}
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
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="客户编号" prop="customer_code">
              <el-input
                v-model="modelValue.customer_code"
                placeholder="留空自动生成(CUS-年月日-序号)"
              />
              <div style="color: #909399; font-size: 12px; line-height: 1.2; margin-top: 4px">
                留空自动生成，格式：CUS-20260502-00001
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户名称" prop="customer_name" :required="true">
              <el-input v-model="modelValue.customer_name" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户简称" prop="customer_short_name">
              <el-input v-model="modelValue.customer_short_name" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户类型" prop="customer_type" :required="true">
              <el-select
                v-model="modelValue.customer_type"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in customerTypeOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属行业" prop="industry" :required="true">
              <el-input v-model="modelValue.industry" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户来源" prop="source" :required="true">
              <el-select
                v-model="modelValue.source"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in sourceOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户状态" prop="customer_status" :required="true">
              <el-select
                v-model="modelValue.customer_status"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in customerStatusOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户等级" prop="customer_level">
              <el-select
                v-model="modelValue.customer_level"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in customerLevelOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="企业规模" prop="scale">
              <el-select
                v-model="modelValue.scale"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in scaleOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="负责人" prop="owner_id" :required="true">
              <UserSelect v-model="modelValue.owner_id" placeholder="搜索负责人姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属部门" prop="department_id" :required="true">
              <DeptSelect v-model="modelValue.department_id" placeholder="选择所属部门" />
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
import UserSelect from "@/components/CRM/UserSelect.vue";
import DeptSelect from "@/components/CRM/DeptSelect.vue";

const props = defineProps<{
  modelValue: CrmCustomersForm;
  mode: "create" | "edit" | "view";
}>();

const formRef = ref();

const { options: customerTypeOptions, ensureLoaded: loadCustomerType } = useDictOptions(
  DICT_TYPE_MAP.customer_type
);
const { options: sourceOptions, ensureLoaded: loadSource } = useDictOptions(DICT_TYPE_MAP.source);
const { options: customerStatusOptions, ensureLoaded: loadCustomerStatus } = useDictOptions(
  DICT_TYPE_MAP.customer_status
);
const { options: customerLevelOptions, ensureLoaded: loadCustomerLevel } = useDictOptions(
  DICT_TYPE_MAP.customer_level
);
const { options: scaleOptions, ensureLoaded: loadScale } = useDictOptions(DICT_TYPE_MAP.scale);

const rules = reactive<Record<string, any>>({
  customer_name: [{ required: true, message: "请填写客户名称", trigger: "blur" }],
  customer_type: [{ required: true, message: "请选择客户类型", trigger: "change" }],
  industry: [{ required: true, message: "请填写所属行业", trigger: "blur" }],
  source: [{ required: true, message: "请选择客户来源", trigger: "change" }],
  customer_status: [{ required: true, message: "请选择客户状态", trigger: "change" }],
  owner_id: [{ required: true, message: "请选择负责人", trigger: "change" }],
  department_id: [{ required: true, message: "请选择所属部门", trigger: "change" }],
});

defineExpose({ formRef });

onMounted(async () => {
  await Promise.all([
    loadCustomerType(),
    loadSource(),
    loadCustomerStatus(),
    loadCustomerLevel(),
    loadScale(),
  ]);
});
</script>
