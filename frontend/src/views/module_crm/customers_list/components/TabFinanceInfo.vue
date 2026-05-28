<template>
  <div class="tab-finance-info">
    <template v-if="mode === 'view'">
      <el-descriptions :column="3" border>
        <el-descriptions-item label="信用额度" :span="1">
          {{ modelValue.credit_limit }}
        </el-descriptions-item>
        <el-descriptions-item label="欠款金额" :span="1">
          {{ modelValue.outstanding_amount }}
        </el-descriptions-item>
        <el-descriptions-item label="账期(天)" :span="1">
          {{ modelValue.payment_days }}
        </el-descriptions-item>
        <el-descriptions-item label="客户评分" :span="1">
          {{ modelValue.rating }}
        </el-descriptions-item>
        <el-descriptions-item label="总营收" :span="1">
          {{ modelValue.total_revenue }}
        </el-descriptions-item>
        <el-descriptions-item label="总订单数" :span="1">
          {{ modelValue.total_orders }}
        </el-descriptions-item>
        <el-descriptions-item label="首单日期" :span="1">
          {{ modelValue.first_order_date }}
        </el-descriptions-item>
        <el-descriptions-item label="最后订单日期" :span="1">
          {{ modelValue.last_order_date }}
        </el-descriptions-item>
        <el-descriptions-item label="成为客户时间" :span="1">
          {{ modelValue.customer_since }}
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
            <el-form-item label="信用额度" prop="credit_limit">
              <el-input v-model="modelValue.credit_limit" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="欠款金额" prop="outstanding_amount">
              <el-input v-model="modelValue.outstanding_amount" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="账期(天)" prop="payment_days">
              <el-input-number
                v-model="modelValue.payment_days"
                :min="0"
                placeholder="请输入"
                style="width: 100%"
                controls-position="right"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="客户评分" prop="rating">
              <el-input-number
                v-model="modelValue.rating"
                :min="0"
                :max="100"
                placeholder="0-100"
                style="width: 100%"
                controls-position="right"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="总营收" prop="total_revenue">
              <el-input v-model="modelValue.total_revenue" placeholder="请输入" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="总订单数" prop="total_orders">
              <el-input-number
                v-model="modelValue.total_orders"
                :min="0"
                placeholder="请输入"
                style="width: 100%"
                controls-position="right"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="首单日期" prop="first_order_date">
              <el-date-picker
                v-model="modelValue.first_order_date"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="最后订单日期" prop="last_order_date">
              <el-date-picker
                v-model="modelValue.last_order_date"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="成为客户时间" prop="customer_since">
              <el-date-picker
                v-model="modelValue.customer_since"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择"
                style="width: 100%"
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

const props = defineProps<{
  modelValue: CrmCustomersForm;
  mode: "create" | "edit" | "view";
}>();

const formRef = ref();

const rules = reactive<Record<string, any>>({});

defineExpose({ formRef });
</script>
