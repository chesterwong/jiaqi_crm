# 飞书表格 → CRM 销售数据导入

## 数据源

- Wiki：`https://zc9xd2zrff.feishu.cn/wiki/XdjXwTfjtiHnmlkDjCecXeKrnPH`
- `FEISHU_WIKI_NODE_TOKEN` = URL 中 `wiki/` 后一段：`XdjXwTfjtiHnmlkDjCecXeKrnPH`
- 工作表：
  - **小鹅通客户名单** → `crm_xiaoe_contacts`（按手机号 upsert）
  - **资源统计** → `crm_marketing_resources`（追加插入）

## 飞书应用配置

1. [飞书开放平台](https://open.feishu.cn/app) 创建企业自建应用  
2. 权限（至少）：
   - `wiki:wiki` 或 `wiki:wiki:readonly`
   - `wiki:node:read`
   - `sheets:spreadsheet`（读取电子表格）
3. 将应用加入该知识库/表格的协作者或可访问范围  
4. 在 `backend/env/.env.dev` 配置：

```env
FEISHU_APP_ID=cli_xxxx
FEISHU_APP_SECRET=xxxx
FEISHU_WIKI_NODE_TOKEN=XdjXwTfjtiHnmlkDjCecXeKrnPH
```

## 命令行导入

```bash
cd backend
# 查看 sheet_id / 标题
ENVIRONMENT=dev .venv/bin/python scripts/import_feishu_sales.py --list-sheets
# 全量导入
ENVIRONMENT=dev .venv/bin/python scripts/import_feishu_sales.py
```

## 接口导入

`POST /api/v1/salesmanagement/marketing_resources/import/feishu`  
权限：`module_salesmanagement:marketing_resources:import`

前端：销售管理列表页工具栏「飞书同步」按钮。

## 表头映射

导入按**首行表头**模糊匹配（见 `feishu_import.py` 中 `XIAOE_HEADER_MAP` / `MARKETING_HEADER_MAP`）。  
若飞书列名与文档不一致，可在该文件中补充别名。
