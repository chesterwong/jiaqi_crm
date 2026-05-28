<template>
  <div class="app-container">
    <!-- 页面标题 -->
    <div class="detail-header">
      <el-page-header :icon="ArrowLeft" @back="goBack">
        <template #content>
          <span class="detail-title">{{ customerInfo?.customer_name || "客户详情" }}</span>
          <el-tag v-if="customerInfo?.customer_status" size="small" class="status-tag">
            {{ getDictLabel(dictMap.customer_status, customerInfo.customer_status) }}
          </el-tag>
        </template>
        <template #extra>
          <el-button
            v-hasPerm="['module_crm:customers_list:update']"
            type="primary"
            @click="handleEdit"
          >
            编辑
          </el-button>
        </template>
      </el-page-header>
    </div>

    <!-- 详情Tabs -->
    <el-card shadow="never" class="detail-card">
      <el-tabs v-model="activeTab" type="border-card">
        <!-- 客户资料 -->
        <el-tab-pane label="客户资料" name="profile">
          <el-descriptions v-if="customerInfo" :column="3" border size="small">
            <el-descriptions-item label="客户编号" :span="1">
              {{ customerInfo.customer_code || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="客户名称" :span="1">
              {{ customerInfo.customer_name || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="客户类型" :span="1">
              {{ getDictLabel(dictMap.customer_type, customerInfo.customer_type) }}
            </el-descriptions-item>
            <el-descriptions-item label="所属行业" :span="1">
              {{ customerInfo.industry || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="客户来源" :span="1">
              {{ getDictLabel(dictMap.source, customerInfo.source) }}
            </el-descriptions-item>
            <el-descriptions-item label="客户等级" :span="1">
              <el-tag :type="getLevelType(customerInfo.customer_level)" size="small">
                {{
                  getDictLabel(dictMap.customer_level, customerInfo.customer_level) ||
                  customerInfo.customer_level ||
                  "--"
                }}
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="企业规模" :span="1">
              {{ getDictLabel(dictMap.scale, customerInfo.scale) }}
            </el-descriptions-item>
            <el-descriptions-item label="客户状态" :span="1">
              <el-tag
                :type="customerInfo.customer_status === 'active' ? 'success' : 'info'"
                size="small"
              >
                {{ getDictLabel(dictMap.customer_status, customerInfo.customer_status) }}
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="负责人" :span="1">
              {{ customerInfo.created_by?.name || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="联系电话" :span="1">
              {{ customerInfo.main_phone || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="联系邮箱" :span="1">
              {{ customerInfo.main_email || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="所属区域" :span="1">
              {{ customerInfo.territory || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="详细地址" :span="2">
              {{
                [
                  customerInfo.province,
                  customerInfo.city,
                  customerInfo.district,
                  customerInfo.address,
                ]
                  .filter(Boolean)
                  .join(" ") || "--"
              }}
            </el-descriptions-item>
            <el-descriptions-item label="总营收" :span="1">
              {{ customerInfo.total_revenue != null ? customerInfo.total_revenue + " 万" : "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="总订单数" :span="1">
              {{ customerInfo.total_orders ?? "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="信用额度" :span="1">
              {{ customerInfo.credit_limit != null ? customerInfo.credit_limit : "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="欠款金额" :span="1">
              {{ customerInfo.outstanding_amount != null ? customerInfo.outstanding_amount : "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="账期天数" :span="1">
              {{ customerInfo.payment_days ?? "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="健康度评分" :span="1">
              <el-tag
                :type="
                  customerInfo.health_score && customerInfo.health_score >= 80
                    ? 'success'
                    : customerInfo.health_score && customerInfo.health_score >= 60
                      ? 'warning'
                      : 'danger'
                "
                size="small"
              >
                {{ customerInfo.health_score ?? "--" }}
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="流失风险" :span="1">
              <el-tag
                :type="
                  customerInfo.churn_risk === 'high'
                    ? 'danger'
                    : customerInfo.churn_risk === 'medium'
                      ? 'warning'
                      : 'success'
                "
                size="small"
              >
                {{
                  getDictLabel(dictMap.churn_risk, customerInfo.churn_risk) ||
                  customerInfo.churn_risk ||
                  "--"
                }}
              </el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="最后跟进时间" :span="1">
              {{ customerInfo.last_followup_at || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="下次跟进时间" :span="1">
              {{ customerInfo.next_followup_at || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="公海池状态" :span="1">
              {{ customerInfo.pool_status === "2" ? "公海" : "私有" }}
            </el-descriptions-item>
            <el-descriptions-item label="保护期截止" :span="1">
              {{ customerInfo.protection_deadline || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="领取时间" :span="1">
              {{ customerInfo.claim_time || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="成为客户时间" :span="1">
              {{ customerInfo.customer_since || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="创建时间" :span="1">
              {{ customerInfo.created_time || "--" }}
            </el-descriptions-item>
            <el-descriptions-item label="创建人" :span="1">
              {{ customerInfo.created_by?.name || "--" }}
            </el-descriptions-item>
          </el-descriptions>
        </el-tab-pane>

        <!-- 跟进计划 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:followup']"
          label="跟进计划"
          name="followup_plan"
        >
          <FollowupPlanTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>

        <!-- 销售机会 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:opportunity']"
          label="销售机会"
          name="opportunity"
        >
          <OpportunityTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>

        <!-- 客户合同 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:contract']"
          label="客户合同"
          name="contract"
        >
          <ContractTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>

        <!-- 销售单 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:sales_order']"
          label="销售单"
          name="sales_order"
        >
          <SalesOrderTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>

        <!-- 收款单 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:receipt']"
          label="收款单"
          name="receipt"
        >
          <ReceiptTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>

        <!-- 付款单 -->
        <el-tab-pane
          v-hasPerm="['module_crm:customers_list:detail:payment']"
          label="付款单"
          name="payment"
        >
          <PaymentTab :customer-id="customerId" :customer-info="customerInfo" />
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { ArrowLeft } from "@element-plus/icons-vue";
import { useDictStore } from "@/store";
import CrmCustomersAPI, { DICT_TYPE_MAP } from "@/api/module_crm/customers_list";
import FollowupPlanTab from "./tabs/FollowupPlanTab.vue";
import OpportunityTab from "./tabs/OpportunityTab.vue";
import ContractTab from "./tabs/ContractTab.vue";
import SalesOrderTab from "./tabs/SalesOrderTab.vue";
import ReceiptTab from "./tabs/ReceiptTab.vue";
import PaymentTab from "./tabs/PaymentTab.vue";

defineOptions({ name: "CrmCustomersDetail", inheritAttrs: false });

const route = useRoute();
const router = useRouter();
const dictStore = useDictStore();

const customerId = Number(route.params.id) || 0;
const activeTab = ref((route.query.tab as string) || "profile");
const customerInfo = ref<any>(null);
const loading = ref(false);

const dictMap: Record<string, any[]> = reactive({
  customer_type: [],
  source: [],
  customer_status: [],
  customer_level: [],
  scale: [],
  churn_risk: [],
});

function getDictLabel(dictList: any[], value: string | undefined): string {
  if (!value || !dictList) return value || "--";
  const item = dictList.find((d: any) => d.dict_value === value);
  return item?.dict_label || value;
}

function getLevelType(level: string | undefined): "danger" | "warning" | "info" {
  if (!level) return "info";
  if (["AAA", "AA", "A"].includes(level)) return "danger";
  if (["B"].includes(level)) return "warning";
  return "info";
}

async function loadDicts() {
  const dictTypes = Object.values(DICT_TYPE_MAP);
  const dictData = await dictStore.getDict(dictTypes);
  for (const key of Object.keys(DICT_TYPE_MAP)) {
    const dictType = DICT_TYPE_MAP[key];
    dictMap[key as keyof typeof dictMap] = dictData[dictType] || [];
  }
}

async function fetchDetail() {
  if (!customerId) return;
  loading.value = true;
  try {
    const res = await CrmCustomersAPI.detailCrmCustomers(customerId);
    if (res.data) {
      customerInfo.value = res.data;
    }
  } catch (e) {
    console.error("获取客户详情失败", e);
  } finally {
    loading.value = false;
  }
}

function goBack() {
  router.push({ path: "/module_crm/customers_center" });
}

function handleEdit() {
  router.push({
    path: `/module_crm/customers/${customerId}`,
    query: { type: "update" },
  });
}

onMounted(async () => {
  await loadDicts();
  fetchDetail();
});
</script>

<style scoped>
.detail-header {
  background: #fff;
  padding: 12px 16px;
  border-radius: 4px;
  margin-bottom: 12px;
}

.detail-title {
  font-size: 18px;
  font-weight: 600;
  margin-right: 12px;
}

.status-tag {
  vertical-align: middle;
}

.detail-card {
  border-radius: 4px;
}
</style>
