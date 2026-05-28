import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_pool_transfers";

const CrmPoolTransfersAPI = {
  // 列表查询
  listCrmPoolTransfers(query: CrmPoolTransfersPageQuery) {
    return request<ApiResponse<PageResult<CrmPoolTransfersTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmPoolTransfers(id: number) {
    return request<ApiResponse<CrmPoolTransfersTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmPoolTransfers(body: CrmPoolTransfersForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmPoolTransfers(id: number, body: CrmPoolTransfersForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmPoolTransfers(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmPoolTransfers(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmPoolTransfers(query: CrmPoolTransfersPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmPoolTransfers() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmPoolTransfers(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmPoolTransfersAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmPoolTransfersPageQuery extends PageQuery {
  customer_id?: number;
  from_pool?: string;
  to_pool?: string;
  from_owner_id?: number;
  to_owner_id?: number;
  transfer_reason?: string;
  transfer_type?: string;
  operator_id?: number;
  transferred_at?: string;
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
export interface CrmPoolTransfersTable extends BaseType {
  customer_id?: number;
  from_pool?: string;
  to_pool?: string;
  from_owner_id?: number;
  to_owner_id?: number;
  transfer_reason?: string;
  transfer_type?: string;
  operator_id?: number;
  transferred_at?: string;
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
export interface CrmPoolTransfersForm extends BaseFormType {
  customer_id?: number;
  from_pool?: string;
  to_pool?: string;
  from_owner_id?: number;
  to_owner_id?: number;
  transfer_reason?: string;
  transfer_type?: string;
  operator_id?: number;
  transferred_at?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
