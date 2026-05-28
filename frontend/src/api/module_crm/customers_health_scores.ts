import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_health_scores";

const CrmCustomerHealthScoresAPI = {
  // 列表查询
  listCrmCustomerHealthScores(query: CrmCustomerHealthScoresPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerHealthScoresTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerHealthScores(id: number) {
    return request<ApiResponse<CrmCustomerHealthScoresTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerHealthScores(body: CrmCustomerHealthScoresForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerHealthScores(id: number, body: CrmCustomerHealthScoresForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerHealthScores(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerHealthScores(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerHealthScores(query: CrmCustomerHealthScoresPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerHealthScores() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerHealthScores(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerHealthScoresAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerHealthScoresPageQuery extends PageQuery {
  customer_id?: number;
  score_date?: string;
  overall_score?: number;
  health_level?: string;
  dimension_scores?: string;
  product_usage?: string;
  adoption_rate?: number;
  engagement_score?: number;
  avg_contact_frequency?: string;
  last_interaction_date?: string;
  payment_score?: number;
  revenue_trend?: string;
  arpu?: string;
  satisfaction_score?: number;
  nps_score?: number;
  last_survey_date?: string;
  risk_indicators?: string;
  churn_signals?: string;
  churn_probability?: string;
  expansion_probability?: string;
  ai_insights?: string;
  created_id?: number;
  version?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCustomerHealthScoresTable extends BaseType {
  customer_id?: number;
  score_date?: string;
  overall_score?: number;
  health_level?: string;
  dimension_scores?: Record<string, unknown>;
  product_usage?: Record<string, unknown>;
  adoption_rate?: string;
  engagement_score?: number;
  avg_contact_frequency?: string;
  last_interaction_date?: string;
  payment_score?: number;
  revenue_trend?: string;
  arpu?: string;
  satisfaction_score?: number;
  nps_score?: number;
  last_survey_date?: string;
  risk_indicators?: unknown[];
  churn_signals?: unknown[];
  churn_probability?: string;
  expansion_probability?: string;
  ai_insights?: Record<string, unknown>;
  created_id?: number;
  version?: number;
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
export interface CrmCustomerHealthScoresForm extends BaseFormType {
  customer_id?: number;
  score_date?: string;
  overall_score?: number;
  health_level?: string;
  dimension_scores?: string;
  product_usage?: string;
  adoption_rate?: number;
  engagement_score?: number;
  avg_contact_frequency?: string;
  last_interaction_date?: string;
  payment_score?: number;
  revenue_trend?: string;
  arpu?: string;
  satisfaction_score?: number;
  nps_score?: number;
  last_survey_date?: string;
  risk_indicators?: string;
  churn_signals?: string;
  churn_probability?: string;
  expansion_probability?: string;
  ai_insights?: string;
  version?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
