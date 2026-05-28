import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_timeline";

const CrmCustomerTimelineAPI = {
  // 列表查询
  listCrmCustomerTimeline(query: CrmCustomerTimelinePageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerTimelineTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerTimeline(id: number) {
    return request<ApiResponse<CrmCustomerTimelineTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerTimeline(body: CrmCustomerTimelineForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerTimeline(id: number, body: CrmCustomerTimelineForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerTimeline(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerTimeline(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerTimeline(query: CrmCustomerTimelinePageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerTimeline() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerTimeline(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerTimelineAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerTimelinePageQuery extends PageQuery {
  customer_id?: number;
  event_type?: string;
  event_category?: string;
  title?: string;
  related_type?: string;
  related_id?: number;
  related_name?: string;
  operator_id?: number;
  operator_name?: string;
  attachments?: string;
  extra_data?: string;
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
export interface CrmCustomerTimelineTable extends BaseType {
  customer_id?: number;
  event_type?: string;
  event_category?: string;
  title?: string;
  related_type?: string;
  related_id?: number;
  related_name?: string;
  operator_id?: number;
  operator_name?: string;
  attachments?: Record<string, unknown>;
  extra_data?: Record<string, unknown>;
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
export interface CrmCustomerTimelineForm extends BaseFormType {
  customer_id?: number;
  event_type?: string;
  event_category?: string;
  title?: string;
  related_type?: string;
  related_id?: number;
  related_name?: string;
  operator_id?: number;
  operator_name?: string;
  attachments?: string;
  extra_data?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
