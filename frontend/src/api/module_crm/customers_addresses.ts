import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_addresses";

const CrmCustomerAddressesAPI = {
  // 列表查询
  listCrmCustomerAddresses(query: CrmCustomerAddressesPageQuery) {
    return request<ApiResponse<PageResult<CrmCustomerAddressesTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmCustomerAddresses(id: number) {
    return request<ApiResponse<CrmCustomerAddressesTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmCustomerAddresses(body: CrmCustomerAddressesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmCustomerAddresses(id: number, body: CrmCustomerAddressesForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmCustomerAddresses(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmCustomerAddresses(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmCustomerAddresses(query: CrmCustomerAddressesPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmCustomerAddresses() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmCustomerAddresses(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmCustomerAddressesAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmCustomerAddressesPageQuery extends PageQuery {
  customer_id?: number;
  address_type?: string;
  address_name?: string;
  province?: string;
  city?: string;
  district?: string;
  detail_address?: string;
  postal_code?: string;
  latitude?: string;
  longitude?: string;
  contact_person?: string;
  contact_phone?: string;
  is_default?: boolean;
  is_active?: boolean;
  created_id?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmCustomerAddressesTable extends BaseType {
  customer_id?: number;
  address_type?: string;
  address_name?: string;
  province?: string;
  city?: string;
  district?: string;
  detail_address?: string;
  postal_code?: string;
  latitude?: string;
  longitude?: string;
  contact_person?: string;
  contact_phone?: string;
  is_default?: boolean;
  is_active?: boolean;
  created_id?: number;
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
export interface CrmCustomerAddressesForm extends BaseFormType {
  customer_id?: number;
  address_type?: string;
  address_name?: string;
  province?: string;
  city?: string;
  district?: string;
  detail_address?: string;
  postal_code?: string;
  latitude?: string;
  longitude?: string;
  contact_person?: string;
  contact_phone?: string;
  is_default?: string;
  is_active?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
