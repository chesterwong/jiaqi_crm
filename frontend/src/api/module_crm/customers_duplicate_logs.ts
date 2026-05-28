import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_duplicate_logs";

const CrmCustomerDuplicateLogsAPI = {
  // 列表查询
  listCrmCustomerDuplicateLogs(query: CrmCustomerDuplicateLogsPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerDuplicateLogsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerDuplicateLogs(id: number) {
    return request<ApiResponse<CrmCustomerDuplicateLogsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerDuplicateLogs(body: CrmCustomerDuplicateLogsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerDuplicateLogs(id: number, body: CrmCustomerDuplicateLogsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerDuplicateLogs(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerDuplicateLogs(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerDuplicateLogs(query: CrmCustomerDuplicateLogsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerDuplicateLogs() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerDuplicateLogs(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerDuplicateLogsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerDuplicateLogsPageQuery extends PageQuery {
  customer_a_id?: number;
  customer_b_id?: number;
  similarity?: string;
  collision_type?: string;
  handled_by?: number;
  handled_at?: string;
  result?: string;
  created_id?: number;
  updated_id?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCustomerDuplicateLogsTable extends BaseType {
  customer_a_id?: number;
  customer_b_id?: number;
  similarity?: string;
  collision_type?: string;
  handled_by?: number;
  handled_at?: string;
  result?: string;
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
export interface CrmCustomerDuplicateLogsForm extends BaseFormType {
  customer_a_id?: number;
  customer_b_id?: number;
  similarity?: number;
  collision_type?: string;
  handled_by?: number;
  handled_at?: string;
  result?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
