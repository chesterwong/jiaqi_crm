import request from "@/utils/request";

const API_PATH = "/salesmanagement/marketing_resources";

const MarketingResourcesAPI = {
  list(query: MarketingResourcePageQuery) {
    return request<ApiResponse<PageResult<MarketingResourceTable[]>>>({
      url: `${API_PATH}/list`,
      method: "get",
      params: query,
    });
  },

  detail(id: number) {
    return request<ApiResponse<MarketingResourceTable>>({
      url: `${API_PATH}/detail/${id}`,
      method: "get",
    });
  },

  create(body: MarketingResourceForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/create`,
      method: "post",
      data: body,
    });
  },

  update(id: number, body: MarketingResourceForm) {
    return request<ApiResponse>({
      url: `${API_PATH}/update/${id}`,
      method: "put",
      data: body,
    });
  },

  delete(body: number[]) {
    return request<ApiResponse>({
      url: `${API_PATH}/delete`,
      method: "delete",
      data: body,
    });
  },

  importFeishu(body?: FeishuImportBody) {
    return request<ApiResponse<FeishuImportResult>>({
      url: `${API_PATH}/import/feishu`,
      method: "post",
      data: body ?? {},
    });
  },
};

export default MarketingResourcesAPI;

export interface XiaoeContactBrief {
  id?: number;
  username?: string;
  phone?: string;
  xiaoe_updated_at?: string;
}

export interface MarketingResourcePageQuery extends PageQuery {
  phone?: string;
  contact_name?: string;
  resource_source?: string;
  month_period?: string;
  owner_id?: number;
}

export interface MarketingResourceTable extends BaseType {
  serial_no?: number;
  month_period?: string;
  resource_acquired_at?: string;
  contact_name?: string;
  phone?: string;
  xiaoe_duplicate_check?: string;
  resource_source?: string;
  resource_path?: string;
  owner_id?: number;
  owner?: CommonType;
  lead_question?: string;
  is_wechat_added?: boolean | null;
  real_name?: string;
  has_industry_background?: boolean | null;
  trades_etf?: boolean | null;
  trades_hk_us_stocks?: boolean | null;
  trades_commodity_futures?: boolean | null;
  trading_capital?: string;
  customer_profile?: string;
  customer_demand?: string;
  planned_recommendation?: string;
  is_deal_closed?: boolean | null;
  deal_amount?: number;
  wechat_id?: string;
  other_contact?: string;
  importance?: string;
  dept_id?: number;
  description?: string;
  xiaoe_contact?: XiaoeContactBrief | null;
  created_id?: number;
  updated_id?: number;
  created_by?: CommonType;
  updated_by?: CommonType;
}

export interface FeishuImportBody {
  wiki_node_token?: string;
  xiaoe_sheet_title?: string;
  marketing_sheet_title?: string;
  skip_xiaoe?: boolean;
  skip_marketing?: boolean;
}

export interface FeishuImportResult {
  spreadsheet_token?: string;
  xiaoe?: { created?: number; updated?: number; skipped?: number; total?: number };
  marketing?: { created?: number; skipped?: number; total?: number };
}

export interface MarketingResourceForm extends BaseFormType {
  serial_no?: number;
  month_period?: string;
  resource_acquired_at?: string;
  contact_name?: string;
  phone?: string;
  resource_source?: string;
  resource_path?: string;
  owner_id?: number | null;
  lead_question?: string;
  is_wechat_added?: boolean | null;
  real_name?: string;
  has_industry_background?: boolean | null;
  trades_etf?: boolean | null;
  trades_hk_us_stocks?: boolean | null;
  trades_commodity_futures?: boolean | null;
  trading_capital?: string;
  customer_profile?: string;
  customer_demand?: string;
  planned_recommendation?: string;
  is_deal_closed?: boolean | null;
  deal_amount?: number | null;
  wechat_id?: string;
  other_contact?: string;
  importance?: string;
  dept_id?: number;
  description?: string;
}
