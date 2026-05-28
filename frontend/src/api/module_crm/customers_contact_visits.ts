import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_contact_visits";

const CrmContactVisitsAPI = {
  // 列表查询
  listCrmContactVisits(query: CrmContactVisitsPageQuery) {
    return request<ApiResponse<PageResult<CrmContactVisitsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmContactVisits(id: number) {
    return request<ApiResponse<CrmContactVisitsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmContactVisits(body: CrmContactVisitsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmContactVisits(id: number, body: CrmContactVisitsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmContactVisits(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmContactVisits(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmContactVisits(query: CrmContactVisitsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmContactVisits() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmContactVisits(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmContactVisitsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmContactVisitsPageQuery extends PageQuery {
  contact_id?: number;
  customer_id?: number;
  visit_date?: string;
  visit_type?: string;
  visit_location?: string;
  visit_duration?: number;
  visitor_id?: number;
  visitor_name?: string;
  attendees?: Record<string, unknown>;
  visit_content?: string;
  visit_result?: string;
  follow_up_action?: string;
  next_visit_date?: string;
  attachments?: Record<string, unknown>;
  is_deleted?: boolean;
  created_id?: number;
  updated_id?: number;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmContactVisitsTable extends BaseType {
  contact_id?: number;
  customer_id?: number;
  visit_date?: string;
  visit_type?: string;
  visit_location?: string;
  visit_duration?: number;
  visitor_id?: number;
  visitor_name?: string;
  attendees?: Record<string, unknown>;
  visit_content?: string;
  visit_result?: string;
  follow_up_action?: string;
  next_visit_date?: string;
  attachments?: Record<string, unknown>;
  is_deleted?: boolean;
  created_id?: number;
  updated_id?: number;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_by?: CommonType;
  updated_by?: CommonType;
  deleted_by?: CommonType;
}

// 新增/修改/详情表单参数
export interface CrmContactVisitsForm extends BaseFormType {
  contact_id?: number;
  customer_id?: number;
  visit_date?: string;
  visit_type?: string;
  visit_location?: string;
  visit_duration?: number;
  visitor_id?: number;
  visitor_name?: string;
  attendees?: string;
  visit_content?: string;
  visit_result?: string;
  follow_up_action?: string;
  next_visit_date?: string;
  attachments?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
