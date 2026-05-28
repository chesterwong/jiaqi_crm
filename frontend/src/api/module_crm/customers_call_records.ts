import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_call_records";

const CrmCallRecordsAPI = {
  // 列表查询
  listCrmCallRecords(query: CrmCallRecordsPageQuery) {
    return request<ApiResponse<PageResult<CrmCallRecordsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCallRecords(id: number) {
    return request<ApiResponse<CrmCallRecordsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCallRecords(body: CrmCallRecordsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCallRecords(id: number, body: CrmCallRecordsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCallRecords(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCallRecords(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCallRecords(query: CrmCallRecordsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCallRecords() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCallRecords(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCallRecordsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCallRecordsPageQuery extends PageQuery {
  customer_id?: number;
  contact_id?: number;
  call_type?: string;
  direction?: string;
  phone_number?: string;
  duration_seconds?: number;
  call_time?: string;
  summary?: string;
  follow_up_action?: string;
  follow_up_time?: string;
  sentiment?: string;
  quality_score?: number;
  is_recorded?: boolean;
  recording_url?: string;
  created_id?: number;
  updated_id?: number;
  deleted_id?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCallRecordsTable extends BaseType {
  customer_id?: number;
  contact_id?: number;
  call_type?: string;
  direction?: string;
  phone_number?: string;
  duration_seconds?: number;
  call_time?: string;
  summary?: string;
  follow_up_action?: string;
  follow_up_time?: string;
  sentiment?: string;
  quality_score?: number;
  is_recorded?: boolean;
  recording_url?: string;
  created_id?: number;
  updated_id?: number;
  deleted_id?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  dept_id?: number;
  owner_id?: number;
  created_by?: CommonType;
  updated_by?: CommonType;
  deleted_by?: CommonType;
}

// 新增/修改/详情表单参数
export interface CrmCallRecordsForm extends BaseFormType {
  customer_id?: number;
  contact_id?: number;
  call_type?: string;
  direction?: string;
  phone_number?: string;
  duration_seconds?: number;
  call_time?: string;
  summary?: string;
  follow_up_action?: string;
  follow_up_time?: string;
  sentiment?: string;
  quality_score?: number;
  is_recorded?: string;
  recording_url?: string;
  deleted_id?: number;
  is_deleted?: string;
  deleted_time?: string;
  dept_id?: number;
  owner_id?: number;
}
