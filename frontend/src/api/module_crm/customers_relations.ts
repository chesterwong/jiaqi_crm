import request from "@/utils/request";

// API 前缀来自分系统包 module_xxx → /xxx
// 对齐 module_example/demo：业务接口固定为 /{prefix}/{module_name}
const API_PATH = "/crm/customers_relations";

const CrmContactRelationsAPI = {
  // 列表查询
  listCrmContactRelations(query: CrmContactRelationsPageQuery) {
    return request<ApiResponse<PageResult<CrmContactRelationsTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  // 详情查询
  detailCrmContactRelations(id: number) {
    return request<ApiResponse<CrmContactRelationsTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  // 新增
  createCrmContactRelations(body: CrmContactRelationsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  // 修改（带主键）
  updateCrmContactRelations(id: number, body: CrmContactRelationsForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  // 删除（支持批量）
  deleteCrmContactRelations(ids: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: ids,
    });
  },

  // 批量启用/停用
  batchCrmContactRelations(body: BatchType) {
    return request<ApiResponse>({
      url: `${API_PATH}/available/setting`,
      method: "patch",
      data: body,
    });
  },

  // 导出
  exportCrmContactRelations(query: CrmContactRelationsPageQuery) {
    return request<Blob>({
      url: `${API_PATH}/export`,
      method: "post",
      data: query,
      responseType: "blob",
    });
  },

  // 下载导入模板
  downloadTemplateCrmContactRelations() {
    return request<Blob>({
      url: `${API_PATH}/download/template`,
      method: "post",
      responseType: "blob",
    });
  },

  // 导入
  importCrmContactRelations(body: FormData) {
    return request<ApiResponse>({
      url: `${API_PATH}/import`,
      method: "post",
      data: body,
      headers: { "Content-Type": "multipart/form-data" },
    });
  },
};

export default CrmContactRelationsAPI;

// ------------------------------
// TS 类型声明
// ------------------------------

// 列表查询参数
export interface CrmContactRelationsPageQuery extends PageQuery {
  contact_id?: number;
  related_contact_id?: number;
  related_entity_type?: string;
  related_entity_id?: number;
  relation_type?: string;
  relation_desc?: string;
  importance?: string;
  decision_role?: string;
  influence_level?: number;
  status?: string;
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
export interface CrmContactRelationsTable extends BaseType {
  contact_id?: number;
  related_contact_id?: number;
  related_entity_type?: string;
  related_entity_id?: number;
  relation_type?: string;
  relation_desc?: string;
  importance?: string;
  decision_role?: string;
  influence_level?: number;
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
export interface CrmContactRelationsForm extends BaseFormType {
  contact_id?: number;
  related_contact_id?: number;
  related_entity_type?: string;
  related_entity_id?: number;
  relation_type?: string;
  relation_desc?: string;
  importance?: string;
  decision_role?: string;
  influence_level?: string;
  is_deleted?: string;
  deleted_time?: string;
  deleted_id?: number;
  dept_id?: number;
  owner_id?: number;
}
