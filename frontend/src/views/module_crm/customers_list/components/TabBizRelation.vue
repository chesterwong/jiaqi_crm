<template>
  <div class="tab-biz-relation">
    <template v-if="mode === 'view'">
      <el-descriptions :column="3" border>
        <el-descriptions-item label="父级客户" :span="1">
          {{ modelValue.parent_customer_id }}
        </el-descriptions-item>
        <el-descriptions-item label="是否集团总部" :span="1">
          {{ modelValue.is_parent ? "是" : "否" }}
        </el-descriptions-item>
        <el-descriptions-item label="客户分群" :span="1">
          {{ getOptionLabel(customerSegmentOptions, modelValue.customer_segment) }}
        </el-descriptions-item>
        <el-descriptions-item label="所属区域" :span="1">
          {{ modelValue.territory }}
        </el-descriptions-item>
        <el-descriptions-item label="关联线索" :span="1">
          {{ modelValue.lead_id }}
        </el-descriptions-item>
        <el-descriptions-item label="公海状态" :span="1">
          {{ getOptionLabel(poolStatusOptions, modelValue.pool_status) }}
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
            <el-form-item label="父级客户" prop="parent_customer_id">
              <el-input-number
                v-model="modelValue.parent_customer_id"
                :min="0"
                placeholder="客户ID"
                style="width: 100%"
                controls-position="right"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="是否集团总部" prop="is_parent">
              <el-switch
                v-model="modelValue.is_parent"
                :active-value="true"
                :inactive-value="false"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户分群" prop="customer_segment">
              <el-select
                v-model="modelValue.customer_segment"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in customerSegmentOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属区域" prop="territory">
              <el-input v-model="modelValue.territory" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="关联线索" prop="lead_id">
              <el-input-number
                v-model="modelValue.lead_id"
                :min="0"
                placeholder="线索ID"
                style="width: 100%"
                controls-position="right"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="公海状态" prop="pool_status">
              <el-select
                v-model="modelValue.pool_status"
                placeholder="请选择"
                clearable
                filterable
                style="width: 100%"
              >
                <el-option
                  v-for="item in poolStatusOptions"
                  :key="item.dict_value"
                  :label="item.dict_label"
                  :value="item.dict_value"
                />
              </el-select>
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

const { options: customerSegmentOptions, ensureLoaded: loadCustomerSegment } = useDictOptions(
  DICT_TYPE_MAP.customer_segment
);
const { options: poolStatusOptions, ensureLoaded: loadPoolStatus } = useDictOptions(
  DICT_TYPE_MAP.pool_status
);

const rules = reactive<Record<string, any>>({});

defineExpose({ formRef });

onMounted(async () => {
  await Promise.all([loadCustomerSegment(), loadPoolStatus()]);
});
</script>
