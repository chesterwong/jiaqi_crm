import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_activities";

const CrmCustomerActivitiesAPI = {
  // 列表查询
  listCrmCustomerActivities(query: CrmCustomerActivitiesPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerActivitiesTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerActivities(id: number) {
    return request<ApiResponse<CrmCustomerActivitiesTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerActivities(body: CrmCustomerActivitiesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerActivities(id: number, body: CrmCustomerActivitiesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerActivities(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerActivities(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerActivities(query: CrmCustomerActivitiesPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerActivities() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerActivities(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerActivitiesAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerActivitiesPageQuery extends PageQuery {
  customer_id?: number;
  activity_type?: string;
  activity_title?: string;
  activity_content?: string;
  related_type?: string;
  related_id?: number;
  operator_id?: number;
  operator_name?: string;
  activity_date?: string;
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
export interface CrmCustomerActivitiesTable extends BaseType {
  customer_id?: number;
  activity_type?: string;
  activity_title?: string;
  activity_content?: string;
  related_type?: string;
  related_id?: number;
  operator_id?: number;
  operator_name?: string;
  activity_date?: string;
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
export interface CrmCustomerActivitiesForm extends BaseFormType {
  customer_id?: number;
  activity_type?: string;
  activity_title?: string;
  activity_content?: string;
  related_type?: string;
  related_id?: number;
  operator_id?: number;
  operator_name?: string;
  activity_date?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
