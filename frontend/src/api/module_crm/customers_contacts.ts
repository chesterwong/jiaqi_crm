import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_contacts";

const CrmContactsAPI = {
  // 列表查询
  listCrmContacts(query: CrmContactsPageQuery) {
    return request<ApiResponse<PageResult<CrmContactsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmContacts(id: number) {
    return request<ApiResponse<CrmContactsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmContacts(body: CrmContactsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmContacts(id: number, body: CrmContactsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmContacts(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmContacts(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmContacts(query: CrmContactsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmContacts() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmContacts(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmContactsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmContactsPageQuery extends PageQuery {
  customer_id?: number;
  contact_name?: string;
  gender?: string;
  position?: string;
  department?: string;
  mobile?: string;
  phone?: string;
  email?: string;
  wechat?: string;
  qq?: string;
  is_primary?: boolean;
  relationship?: string;
  influence_level?: string;
  birthday?: string;
  anniversary_date?: string;
  remark?: string;
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
export interface CrmContactsTable extends BaseType {
  customer_id?: number;
  contact_name?: string;
  gender?: string;
  position?: string;
  department?: string;
  mobile?: string;
  phone?: string;
  email?: string;
  wechat?: string;
  qq?: string;
  is_primary?: boolean;
  relationship?: string;
  influence_level?: string;
  birthday?: string;
  anniversary_date?: string;
  remark?: string;
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
export interface CrmContactsForm extends BaseFormType {
  customer_id?: number;
  contact_name?: string;
  gender?: string;
  position?: string;
  department?: string;
  mobile?: string;
  phone?: string;
  email?: string;
  wechat?: string;
  qq?: string;
  is_primary?: string;
  relationship?: string;
  influence_level?: string;
  birthday?: string;
  anniversary_date?: string;
  remark?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
