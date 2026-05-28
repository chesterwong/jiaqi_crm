import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_profiles";

const CrmCustomerProfilesAPI = {
  // 列表查询
  listCrmCustomerProfiles(query: CrmCustomerProfilesPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerProfilesTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerProfiles(id: number) {
    return request<ApiResponse<CrmCustomerProfilesTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerProfiles(body: CrmCustomerProfilesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerProfiles(id: number, body: CrmCustomerProfilesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerProfiles(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerProfiles(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerProfiles(query: CrmCustomerProfilesPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerProfiles() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerProfiles(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerProfilesAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerProfilesPageQuery extends PageQuery {
  customer_id?: string;
  basic_profile?: string;
  behavior_profile?: string;
  preference_profile?: string;
  value_profile?: string;
  purchase_patterns?: string;
  preferred_products?: string;
  price_sensitivity?: string;
  buying_stages?: string;
  communication_prefs?: string;
  best_contact_times?: string;
  preferred_channels?: string;
  lifetime_value?: string;
  churn_probability?: string;
  upsell_probability?: string;
  referral_probability?: string;
  personas?: string;
  tags?: string;
  analysis_count?: string;
  last_analysis_at?: string;
  model_version?: string;
  confidence_score?: string;
  data_completeness?: string;
  version?: number;
  created_id?: number;
  updated_id?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCustomerProfilesTable extends BaseType {
  customer_id?: number;
  basic_profile?: Record<string, unknown>;
  behavior_profile?: Record<string, unknown>;
  preference_profile?: Record<string, unknown>;
  value_profile?: Record<string, unknown>;
  purchase_patterns?: Record<string, unknown>;
  preferred_products?: Record<string, unknown>;
  price_sensitivity?: string;
  buying_stages?: string;
  communication_prefs?: Record<string, unknown>;
  best_contact_times?: unknown[];
  preferred_channels?: unknown[];
  lifetime_value?: string;
  churn_probability?: string;
  upsell_probability?: string;
  referral_probability?: string;
  personas?: unknown[];
  tags?: unknown[];
  analysis_count?: number;
  last_analysis_at?: string;
  model_version?: string;
  confidence_score?: string;
  data_completeness?: string;
  version?: number;
  created_id?: number;
  updated_id?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_by?: CommonType;
  updated_by?: CommonType;
  deleted_by?: CommonType;
}

// 新增/修改/详情表单参数
export interface CrmCustomerProfilesForm extends BaseFormType {
  customer_id?: number;
  basic_profile?: string;
  behavior_profile?: string;
  preference_profile?: string;
  value_profile?: string;
  purchase_patterns?: string;
  preferred_products?: string;
  price_sensitivity?: string;
  buying_stages?: string;
  communication_prefs?: string;
  best_contact_times?: string;
  preferred_channels?: string;
  lifetime_value?: string;
  churn_probability?: string;
  upsell_probability?: string;
  referral_probability?: string;
  personas?: string;
  tags?: string;
  analysis_count?: number;
  last_analysis_at?: string;
  model_version?: string;
  confidence_score?: string;
  data_completeness?: string;
  version?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
