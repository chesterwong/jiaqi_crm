# CRM客户管理新增界面页签优化 - 任务清单

## P0 紧急任务
- [ ] P0: 后端Schema按页签拆分子模型(basic/company/contact/biz/finance/health)，保留聚合Schema兼容原接口
- [ ] P0: 后端API新增分步提交端点 PATCH /crm_customers/{id}/tab + 草稿暂存/提交接口
- [ ] P0: 前端TypeScript类型按页签重构，CrmCustomersForm 拆为6个子接口组合，系统字段标记@internal
- [ ] P0: 页签容器组件 CustomerFormTabs.vue 开发(el-tabs + 步骤导航 + 校验状态标记 + 上一步/下一步)
- [ ] P0: Tab1「基本信息」页签(12字段): 客户编号/名称/类型/行业/等级/来源/规模/分群/评分/描述
- [ ] P0: Tab2「工商信息」页签(7字段): 注册号/税号/法人/成立日期/注册资本/实缴资本/网站
- [ ] P0: Tab3「联系信息」页签(7字段): 电话/邮箱/国家/省市区级联/详细地址/所属区域
- [ ] P0: 表单校验规则按页签独立拆分，增加email/phone/URL格式校验和远程查重validator
- [ ] P0: 系统字段自动过滤: 新增时隐藏is_deleted/deleted_time/deleted_id/version/duplicate_check_key等8个字段
- [ ] P0: 省市区三级联动(el-cascader懒加载) + 行业级联选择器

## P1 重要任务
- [ ] P1: Tab4「业务关联」页签(6字段): 负责人选择/部门树/来源线索/父客户/是否集团总部开关/公海池状态
- [ ] P1: Tab5「财务信息」页签(8字段): 总营收/总订单/信用额度/欠款/账期/客户起始/首单/最后订单日期联动
- [ ] P1: Tab6「跟进与健康」页签(6字段): 最后跟进/下次跟进/流失风险(el-tag颜色)/健康度(el-slider分段)/保护期/领取时间
- [ ] P1: 下拉选项全部改为字典接口动态获取(customer_type/status/level/source/scale/segment/churn_risk/pool_status)
- [ ] P1: 输入控件类型替换: rating→el-rate星级, is_parent→el-switch开关, 金额→el-input-number千分位, 日期→统一date-picker
- [ ] P1: Tab7「扩展数据」页签: extra_data JSONB可视化编辑(预设制造业模板: OEM/经销商/终端用户)，支持键值对增删
- [ ] P1: 对话框尺寸从920px调整到1100px，内容区改用el-row+el-col两列布局，长字段整行
- [ ] P1: 详情页同步重构为7页签展示(mode="view"，el-descriptions只读)
- [ ] P1: 修改页同步重构为7页签展示(mode="edit"，共用Tab组件，正确回显数据)
- [ ] P1: 表单状态持久化: 关闭未保存弹窗确认 + localStorage草稿暂存/恢复

## P2 普通任务
- [ ] P2: 客户查重前置校验: customer_name输入防抖500ms调查重API，提交前显示相似客户提示并需二次确认
- [ ] P2: 客户编号自动生成: customer_code右侧增加"自动生成"按钮，规则KH-YYYYMMDD-3位流水号
- [ ] P2: 页签切换Transition动画(slide-fade 300ms) + 已完成绿色✓标记 + 校验失败橙色⚠标记
- [ ] P2: 快捷键支持: Ctrl+S暂存草稿, Ctrl+Enter提交, Ctrl+←→切换页签, Esc关闭, ?显示快捷键提示
- [ ] P2: 提交反馈优化: 成功显示客户名称+编号，校验失败自动跳转到错误页签并scrollIntoView红色闪烁
- [ ] P2: 扩展数据预设模板管理: OEM代工/渠道经销商/终端用户3套模板，选客户类型自动加载
- [ ] P2: 移动端/平板触控适配: <768px全屏+单列布局+按钮放大44px+底部sticky提交栏
- [ ] P2: 操作日志页签(仅详情模式): el-timeline展示历史变更，点击展开字段级diff(旧值→新值)
- [ ] P2: 整体UI美化: 步骤编号①-⑦、必填红色*号、分组浅色背景、金额¥前缀、label-width统一110px
- [ ] P2: E2E自动化测试(8个Playwright用例) + 后端API回归测试(pytest覆盖率≥85%)

## 其他任务
1. 新增客户界面最终验收: 7页签正常切换、系统字段零暴露、下拉字典动态加载、省市区级联正确
2. 修改客户界面回归: 各页签数据正确回显、分步提交不覆盖未修改页签
3. 详情客户界面回归: 7页签只读展示、操作日志时间线正常
4. 全流程联动验证: 新增→修改→查看→删除完整链路无报错
