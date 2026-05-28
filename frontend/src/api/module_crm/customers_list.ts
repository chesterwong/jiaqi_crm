import request from "@/utils/request";

// ============================================
// 系统字段列表（提交时自动过滤）
// ============================================
export const SYSTEM_FIELDS = [
  "is_deleted",
  "deleted_time",
  "deleted_id",
  "version",
  "duplicate_check_key",
  "extra_data",
  "status",
  "dept_id",
] as const;

// ============================================
// 字段名 → 数据库字典类型名映射
// DB 中 dict_type 使用 crm_customers_{field} 格式
// ============================================
export const DICT_TYPE_MAP: Record<string, string> = {
  customer_type: "crm_customers_customer_type",
  source: "crm_customers_source",
  customer_status: "crm_customers_status",
  pool_status: "crm_customers_pool_status",
  customer_level: "crm_price_tiers_customer_level",
  scale: "crm_customers_scale",
  customer_segment: "crm_customers_segment",
  health_score: "crm_customers_health_score",
  churn_risk: "crm_customers_churn_risk",
};

type SystemField = (typeof SYSTEM_FIELDS)[number];

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_list";

const CrmCustomersAPI = {
  // 列表查询
  listCrmCustomers(query: CrmCustomersPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomersTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomers(id: number) {
    return request<ApiResponse<CrmCustomersTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomers(body: CrmCustomersForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomers(id: number, body: CrmCustomersForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomers(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomers(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomers(query: CrmCustomersPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomers() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomers(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

// ---------------------------------------------------
// 客户中心页签列表
// ---------------------------------------------------
export const CrmCustomersCenterAPI = {
  // 客户中心列表(按页签)
  centerList(params: CrmCustomersCenterPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomersTable[]>>>({
      url: `${API_PATH}/center/list`,
      method: "get",
      params,
    });
  },
};

// ---------------------------------------------------
// 公海池操作
// ---------------------------------------------------
export const CrmCustomersPoolAPI = {
  // 公海池客户列表
  poolList(params: CrmCustomersPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomersTable[]>>>({
      url: `${API_PATH}/pool/list`,
      method: "get",
      params,
    });
  },

  // 领取公海客户
  claimPool(customerId: number) {
    return request<ApiResponse>({
      url: `${API_PATH}/pool/claim/${customerId}`,
      method: "post",
    });
  },

  // 分配公海客户
  assignPool(data: { customer_id: number; to_owner_id: number; transfer_reason?: string }) {
    return request<ApiResponse>({
      url: `${API_PATH}/pool/assign`,
      method: "post",
      data,
    });
  },

  // 移入公海池
  moveToPool(customerId: number) {
    return request<ApiResponse>({
      url: `${API_PATH}/pool/move-to-pool/${customerId}`,
      method: "post",
    });
  },
};

export default CrmCustomersAPI;

// ------------------------------
// 客户中心页签查询参数
// ------------------------------
export interface CrmCustomersCenterPageQuery {
  tab?: string; // my_customers, all, created_by_me, today_followup, high_value, public_pool, risk
  page_no?: number;
  page_size?: number;
  customer_code?: string;
  customer_name?: string;
  customer_type?: string;
  industry?: string;
  source?: string;
  customer_status?: string;
  customer_level?: string;
  scale?: string;
  main_phone?: string;
  territory?: string;
  churn_risk?: string;
}

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomersPageQuery extends PageQuery {
  customer_code?: string;
  customer_name?: string;
  customer_type?: string;
  industry?: string;
  source?: string;
  customer_status?: string;
  owner_id?: number;
  department_id?: number;
  lead_id?: number;
  pool_status?: string;
  last_followup_at?: string;
  next_followup_at?: string;
  created_id?: number;
  updated_id?: number;
  customer_short_name?: string;
  customer_level?: string;
  scale?: string;
  registration_no?: string;
  tax_no?: string;
  legal_person?: string;
  established_date?: string;
  registered_capital?: string;
  paid_capital?: string;
  website?: string;
  main_phone?: string;
  main_email?: string;
  country?: string;
  province?: string;
  city?: string;
  district?: string;
  address?: string;
  rating?: number;
  territory?: string;
  customer_since?: string;
  first_order_date?: string;
  last_order_date?: string;
  total_revenue?: string;
  total_orders?: number;
  credit_limit?: string;
  outstanding_amount?: string;
  payment_days?: number;
  parent_customer_id?: number;
  is_parent?: boolean;
  customer_segment?: string;
  churn_risk?: string;
  extra_data?: Record<string, unknown>;
  version?: number;
  protection_deadline?: string;
  claim_time?: string;
  health_score?: string;
  duplicate_check_key?: string;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  status?: string;
  dept_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCustomersTable extends BaseType {
  customer_code?: string;
  customer_name?: string;
  customer_type?: string;
  industry?: string;
  source?: string;
  customer_status?: string;
  owner_id?: number;
  department_id?: number;
  lead_id?: number;
  pool_status?: string;
  last_followup_at?: string;
  next_followup_at?: string;
  created_id?: number;
  updated_id?: number;
  customer_short_name?: string;
  customer_level?: string;
  scale?: string;
  registration_no?: string;
  tax_no?: string;
  legal_person?: string;
  established_date?: string;
  registered_capital?: string;
  paid_capital?: string;
  website?: string;
  main_phone?: string;
  main_email?: string;
  country?: string;
  province?: string;
  city?: string;
  district?: string;
  address?: string;
  rating?: number;
  territory?: string;
  customer_since?: string;
  first_order_date?: string;
  last_order_date?: string;
  total_revenue?: string;
  total_orders?: number;
  credit_limit?: string;
  outstanding_amount?: string;
  payment_days?: number;
  parent_customer_id?: number;
  is_parent?: boolean;
  customer_segment?: string;
  churn_risk?: string;
  extra_data?: Record<string, unknown>;
  version?: number;
  protection_deadline?: string;
  claim_time?: string;
  health_score?: string;
  duplicate_check_key?: string;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  created_by?: CommonType;
  updated_by?: CommonType;
  deleted_by?: CommonType;
}

// 新增/修改/详情表单参数
export interface CrmCustomersForm extends BaseFormType {
  customer_code?: string;
  customer_name?: string;
  customer_type?: string;
  industry?: string;
  source?: string;
  customer_status?: string;
  owner_id?: number;
  department_id?: number;
  lead_id?: number;
  pool_status?: string;
  last_followup_at?: string;
  next_followup_at?: string;
  customer_short_name?: string;
  customer_level?: string;
  scale?: string;
  registration_no?: string;
  tax_no?: string;
  legal_person?: string;
  established_date?: string;
  registered_capital?: string;
  paid_capital?: string;
  website?: string;
  main_phone?: string;
  main_email?: string;
  country?: string;
  province?: string;
  city?: string;
  district?: string;
  address?: string;
  rating?: number;
  territory?: string;
  customer_since?: string;
  first_order_date?: string;
  last_order_date?: string;
  total_revenue?: string;
  total_orders?: number;
  credit_limit?: string;
  outstanding_amount?: string;
  payment_days?: number;
  parent_customer_id?: number;
  is_parent?: boolean;
  customer_segment?: string;
  churn_risk?: string;
  extra_data?: Record<string, unknown>;
  version?: number;
  protection_deadline?: string;
  claim_time?: string;
  health_score?: string;
  duplicate_check_key?: string;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
}
