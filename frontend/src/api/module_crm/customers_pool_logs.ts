import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_pool_logs";

const CrmCustomerPoolLogsAPI = {
  // 列表查询
  listCrmCustomerPoolLogs(query: CrmCustomerPoolLogsPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerPoolLogsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerPoolLogs(id: number) {
    return request<ApiResponse<CrmCustomerPoolLogsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerPoolLogs(body: CrmCustomerPoolLogsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerPoolLogs(id: number, body: CrmCustomerPoolLogsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerPoolLogs(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerPoolLogs(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerPoolLogs(query: CrmCustomerPoolLogsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerPoolLogs() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerPoolLogs(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerPoolLogsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerPoolLogsPageQuery extends PageQuery {
  customer_id?: number;
  action_type?: string;
  action_date?: string;
  from_user_id?: number;
  from_dept_id?: number;
  to_user_id?: number;
  to_dept_id?: number;
  reason?: string;
  transfer_type?: string;
  operator_id?: number;
  version?: number;
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
export interface CrmCustomerPoolLogsTable extends BaseType {
  customer_id?: number;
  action_type?: string;
  action_date?: string;
  from_user_id?: number;
  from_dept_id?: number;
  to_user_id?: number;
  to_dept_id?: number;
  reason?: string;
  transfer_type?: string;
  operator_id?: number;
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
export interface CrmCustomerPoolLogsForm extends BaseFormType {
  customer_id?: number;
  action_type?: string;
  action_date?: string;
  from_user_id?: number;
  from_dept_id?: number;
  to_user_id?: number;
  to_dept_id?: number;
  reason?: string;
  transfer_type?: string;
  operator_id?: number;
  version?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
