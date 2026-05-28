import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_tag_definitions";

const CrmTagDefinitionsAPI = {
  // 列表查询
  listCrmTagDefinitions(query: CrmTagDefinitionsPageQuery) {
    return request<ApiResponse<PageResult<CrmTagDefinitionsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmTagDefinitions(id: number) {
    return request<ApiResponse<CrmTagDefinitionsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmTagDefinitions(body: CrmTagDefinitionsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmTagDefinitions(id: number, body: CrmTagDefinitionsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmTagDefinitions(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmTagDefinitions(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmTagDefinitions(query: CrmTagDefinitionsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmTagDefinitions() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmTagDefinitions(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmTagDefinitionsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmTagDefinitionsPageQuery extends PageQuery {
  tag_code?: string;
  tag_name?: string;
  tag_type?: string;
  category?: string;
  color?: string;
  icon?: string;
  applicable_types?: unknown[];
  is_multi_select?: boolean;
  is_required?: boolean;
  validation_rule?: string;
  status?: string;
  sort_order?: number;
  usage_count?: number;
  created_id?: number;
  updated_id?: number;
  version?: number;
  is_deleted?: boolean;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
  created_time?: string[];
  updated_time?: string[];
}

// 列表展示项
export interface CrmTagDefinitionsTable extends BaseType {
  tag_code?: string;
  tag_name?: string;
  tag_type?: string;
  category?: string;
  color?: string;
  icon?: string;
  applicable_types?: unknown[];
  is_multi_select?: boolean;
  is_required?: boolean;
  validation_rule?: string;
  sort_order?: number;
  usage_count?: number;
  created_id?: number;
  updated_id?: number;
  version?: number;
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
export interface CrmTagDefinitionsForm extends BaseFormType {
  tag_code?: string;
  tag_name?: string;
  tag_type?: string;
  category?: string;
  color?: string;
  icon?: string;
  applicable_types?: string;
  is_multi_select?: string;
  is_required?: string;
  validation_rule?: string;
  sort_order?: number;
  usage_count?: number;
  version?: number;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
