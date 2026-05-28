import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_attachments";

const CrmCustomerAttachmentsAPI = {
  // 列表查询
  listCrmCustomerAttachments(query: CrmCustomerAttachmentsPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerAttachmentsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerAttachments(id: number) {
    return request<ApiResponse<CrmCustomerAttachmentsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerAttachments(body: CrmCustomerAttachmentsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerAttachments(id: number, body: CrmCustomerAttachmentsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerAttachments(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerAttachments(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerAttachments(query: CrmCustomerAttachmentsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerAttachments() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerAttachments(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerAttachmentsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerAttachmentsPageQuery extends PageQuery {
  customer_id?: number;
  file_name?: string;
  file_path?: string;
  file_type?: string;
  mime_type?: string;
  file_size?: number;
  attachment_type?: string;
  uploader_id?: number;
  uploaded_at?: string;
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
export interface CrmCustomerAttachmentsTable extends BaseType {
  customer_id?: number;
  file_name?: string;
  file_path?: string;
  file_type?: string;
  mime_type?: string;
  file_size?: number;
  attachment_type?: string;
  uploader_id?: number;
  uploaded_at?: string;
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
export interface CrmCustomerAttachmentsForm extends BaseFormType {
  customer_id?: number;
  file_name?: string;
  file_path?: string;
  file_type?: string;
  mime_type?: string;
  file_size?: number;
  attachment_type?: string;
  uploader_id?: number;
  uploaded_at?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
