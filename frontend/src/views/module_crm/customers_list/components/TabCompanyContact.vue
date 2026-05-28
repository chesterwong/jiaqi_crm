<template>
  <div class="tab-company-contact">
    <template v-if="mode === 'view'">
      <el-descriptions :column="3" border>
        <el-descriptions-item label="工商注册号" :span="1">
          {{ modelValue.registration_no }}
        </el-descriptions-item>
        <el-descriptions-item label="税号" :span="1">{{ modelValue.tax_no }}</el-descriptions-item>
        <el-descriptions-item label="法人代表" :span="1">
          {{ modelValue.legal_person }}
        </el-descriptions-item>
        <el-descriptions-item label="成立日期" :span="1">
          {{ modelValue.established_date }}
        </el-descriptions-item>
        <el-descriptions-item label="注册资本" :span="1">
          {{ modelValue.registered_capital }}
        </el-descriptions-item>
        <el-descriptions-item label="实缴资本" :span="1">
          {{ modelValue.paid_capital }}
        </el-descriptions-item>
        <el-descriptions-item label="公司网站" :span="1">
          {{ modelValue.website }}
        </el-descriptions-item>
        <el-descriptions-item label="主联系电话" :span="1">
          {{ modelValue.main_phone }}
        </el-descriptions-item>
        <el-descriptions-item label="主联系邮箱" :span="1">
          {{ modelValue.main_email }}
        </el-descriptions-item>
        <el-descriptions-item label="国家" :span="1">{{ modelValue.country }}</el-descriptions-item>
        <el-descriptions-item label="省份" :span="1">
          {{ modelValue.province }}
        </el-descriptions-item>
        <el-descriptions-item label="城市" :span="1">{{ modelValue.city }}</el-descriptions-item>
        <el-descriptions-item label="区县" :span="1">
          {{ modelValue.district }}
        </el-descriptions-item>
        <el-descriptions-item label="详细地址" :span="3">
          {{ modelValue.address }}
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
        <el-divider content-position="left">工商信息</el-divider>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="工商注册号" prop="registration_no">
              <el-input v-model="modelValue.registration_no" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="税号" prop="tax_no">
              <el-input v-model="modelValue.tax_no" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="法人代表" prop="legal_person">
              <el-input v-model="modelValue.legal_person" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="成立日期" prop="established_date">
              <el-date-picker
                v-model="modelValue.established_date"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="注册资本" prop="registered_capital">
              <el-input v-model="modelValue.registered_capital" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="实缴资本" prop="paid_capital">
              <el-input v-model="modelValue.paid_capital" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="公司网站" prop="website">
              <el-input v-model="modelValue.website" placeholder="请输入" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-divider content-position="left">联系方式</el-divider>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="主联系电话" prop="main_phone">
              <el-input v-model="modelValue.main_phone" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="主联系邮箱" prop="main_email">
              <el-input v-model="modelValue.main_email" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="国家" prop="country">
              <el-input v-model="modelValue.country" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="省份/城市/区县" prop="province">
              <RegionCascader
                :model-value="{
                  province: modelValue.province,
                  city: modelValue.city,
                  district: modelValue.district,
                }"
                placeholder="请选择省/市/区"
                @update:model-value="handleRegionChange"
              />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="详细地址" prop="address">
              <el-input
                v-model="modelValue.address"
                type="textarea"
                :rows="2"
                :maxlength="200"
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
import { ref, reactive } from "vue";
import type { CrmCustomersForm } from "@/api/module_crm/customers_list";
import RegionCascader from "@/components/CRM/RegionCascader.vue";

const props = defineProps<{
  modelValue: CrmCustomersForm;
  mode: "create" | "edit" | "view";
}>();

const formRef = ref();

const rules = reactive<Record<string, any>>({});

const handleRegionChange = (val: { province: string; city: string; district: string }) => {
  props.modelValue.province = val.province;
  props.modelValue.city = val.city;
  props.modelValue.district = val.district;
};

defineExpose({ formRef });
</script>
