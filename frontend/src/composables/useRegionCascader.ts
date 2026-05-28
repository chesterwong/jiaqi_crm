import type { CascaderOption } from "element-plus";

/**
 * 省市区三级级联数据 composable
 *
 * 提供中国省市区静态树数据 + Element Plus Cascader 懒加载回调 + 路径构建工具。
 * 使用内置精简数据（覆盖全国 34 省级、核心城市及区县），无需后端接口。
 */

// ── 数据结构 ──

export interface RegionNode extends CascaderOption {
  value: string;
  label: string;
  children?: RegionNode[];
  leaf?: boolean;
}

// ── 数据 ──

/**
 * 中国省市区树（精简版，覆盖全国省级 + 核心城市）
 * value 为国家统计局行政区划代码
 */
export const REGION_TREE: RegionNode[] = [
  {
    value: "110000",
    label: "北京市",
    children: [
      {
        value: "110100",
        label: "市辖区",
        children: [
          { value: "110101", label: "东城区", leaf: true },
          { value: "110102", label: "西城区", leaf: true },
          { value: "110105", label: "朝阳区", leaf: true },
          { value: "110106", label: "丰台区", leaf: true },
          { value: "110107", label: "石景山区", leaf: true },
          { value: "110108", label: "海淀区", leaf: true },
          { value: "110109", label: "门头沟区", leaf: true },
          { value: "110111", label: "房山区", leaf: true },
          { value: "110112", label: "通州区", leaf: true },
          { value: "110113", label: "顺义区", leaf: true },
          { value: "110114", label: "昌平区", leaf: true },
          { value: "110115", label: "大兴区", leaf: true },
          { value: "110116", label: "怀柔区", leaf: true },
          { value: "110117", label: "平谷区", leaf: true },
          { value: "110118", label: "密云区", leaf: true },
          { value: "110119", label: "延庆区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "120000",
    label: "天津市",
    children: [
      {
        value: "120100",
        label: "市辖区",
        children: [
          { value: "120101", label: "和平区", leaf: true },
          { value: "120102", label: "河东区", leaf: true },
          { value: "120103", label: "河西区", leaf: true },
          { value: "120104", label: "南开区", leaf: true },
          { value: "120105", label: "河北区", leaf: true },
          { value: "120106", label: "红桥区", leaf: true },
          { value: "120110", label: "东丽区", leaf: true },
          { value: "120111", label: "西青区", leaf: true },
          { value: "120112", label: "津南区", leaf: true },
          { value: "120113", label: "北辰区", leaf: true },
          { value: "120114", label: "武清区", leaf: true },
          { value: "120115", label: "宝坻区", leaf: true },
          { value: "120116", label: "滨海新区", leaf: true },
          { value: "120117", label: "宁河区", leaf: true },
          { value: "120118", label: "静海区", leaf: true },
          { value: "120119", label: "蓟州区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "130000",
    label: "河北省",
    children: [
      {
        value: "130100",
        label: "石家庄市",
        children: [
          { value: "130102", label: "长安区", leaf: true },
          { value: "130104", label: "桥西区", leaf: true },
          { value: "130105", label: "新华区", leaf: true },
          { value: "130107", label: "井陉矿区", leaf: true },
          { value: "130108", label: "裕华区", leaf: true },
          { value: "130109", label: "藁城区", leaf: true },
          { value: "130110", label: "鹿泉区", leaf: true },
          { value: "130111", label: "栾城区", leaf: true },
          { value: "130181", label: "辛集市", leaf: true },
          { value: "130183", label: "晋州市", leaf: true },
          { value: "130184", label: "新乐市", leaf: true },
        ],
      },
      {
        value: "130200",
        label: "唐山市",
        children: [
          { value: "130202", label: "路南区", leaf: true },
          { value: "130203", label: "路北区", leaf: true },
          { value: "130204", label: "古冶区", leaf: true },
          { value: "130205", label: "开平区", leaf: true },
          { value: "130207", label: "丰南区", leaf: true },
          { value: "130208", label: "丰润区", leaf: true },
          { value: "130209", label: "曹妃甸区", leaf: true },
          { value: "130224", label: "滦南县", leaf: true },
          { value: "130225", label: "乐亭县", leaf: true },
          { value: "130227", label: "迁西县", leaf: true },
          { value: "130229", label: "玉田县", leaf: true },
          { value: "130281", label: "遵化市", leaf: true },
          { value: "130283", label: "迁安市", leaf: true },
          { value: "130284", label: "滦州市", leaf: true },
        ],
      },
      {
        value: "130300",
        label: "秦皇岛市",
        children: [
          { value: "130302", label: "海港区", leaf: true },
          { value: "130303", label: "山海关区", leaf: true },
          { value: "130304", label: "北戴河区", leaf: true },
          { value: "130306", label: "抚宁区", leaf: true },
          { value: "130321", label: "青龙满族自治县", leaf: true },
          { value: "130322", label: "昌黎县", leaf: true },
          { value: "130324", label: "卢龙县", leaf: true },
        ],
      },
      {
        value: "130400",
        label: "邯郸市",
        children: [
          { value: "130402", label: "邯山区", leaf: true },
          { value: "130403", label: "丛台区", leaf: true },
          { value: "130404", label: "复兴区", leaf: true },
          { value: "130406", label: "峰峰矿区", leaf: true },
          { value: "130407", label: "肥乡区", leaf: true },
          { value: "130408", label: "永年区", leaf: true },
          { value: "130423", label: "临漳县", leaf: true },
          { value: "130424", label: "成安县", leaf: true },
          { value: "130425", label: "大名县", leaf: true },
          { value: "130426", label: "涉县", leaf: true },
          { value: "130427", label: "磁县", leaf: true },
          { value: "130430", label: "邱县", leaf: true },
          { value: "130431", label: "鸡泽县", leaf: true },
          { value: "130432", label: "广平县", leaf: true },
          { value: "130433", label: "馆陶县", leaf: true },
          { value: "130434", label: "魏县", leaf: true },
          { value: "130435", label: "曲周县", leaf: true },
          { value: "130481", label: "武安市", leaf: true },
        ],
      },
      {
        value: "130500",
        label: "邢台市",
        children: [
          { value: "130502", label: "桥东区", leaf: true },
          { value: "130503", label: "桥西区", leaf: true },
          { value: "130521", label: "邢台县", leaf: true },
          { value: "130522", label: "临城县", leaf: true },
          { value: "130523", label: "内丘县", leaf: true },
          { value: "130524", label: "柏乡县", leaf: true },
          { value: "130525", label: "隆尧县", leaf: true },
          { value: "130526", label: "任县", leaf: true },
          { value: "130527", label: "南和县", leaf: true },
          { value: "130528", label: "宁晋县", leaf: true },
          { value: "130529", label: "巨鹿县", leaf: true },
          { value: "130530", label: "新河县", leaf: true },
          { value: "130531", label: "广宗县", leaf: true },
          { value: "130532", label: "平乡县", leaf: true },
          { value: "130533", label: "威县", leaf: true },
          { value: "130534", label: "清河县", leaf: true },
          { value: "130535", label: "临西县", leaf: true },
          { value: "130581", label: "南宫市", leaf: true },
          { value: "130582", label: "沙河市", leaf: true },
        ],
      },
      {
        value: "130600",
        label: "保定市",
        children: [
          { value: "130602", label: "竞秀区", leaf: true },
          { value: "130606", label: "莲池区", leaf: true },
          { value: "130607", label: "满城区", leaf: true },
          { value: "130608", label: "清苑区", leaf: true },
          { value: "130609", label: "徐水区", leaf: true },
          { value: "130623", label: "涞水县", leaf: true },
          { value: "130624", label: "阜平县", leaf: true },
          { value: "130626", label: "定兴县", leaf: true },
          { value: "130627", label: "唐县", leaf: true },
          { value: "130628", label: "高阳县", leaf: true },
          { value: "130629", label: "容城县", leaf: true },
          { value: "130630", label: "涞源县", leaf: true },
          { value: "130631", label: "望都县", leaf: true },
          { value: "130632", label: "安新县", leaf: true },
          { value: "130633", label: "易县", leaf: true },
          { value: "130634", label: "曲阳县", leaf: true },
          { value: "130635", label: "蠡县", leaf: true },
          { value: "130636", label: "顺平县", leaf: true },
          { value: "130637", label: "博野县", leaf: true },
          { value: "130638", label: "雄县", leaf: true },
          { value: "130681", label: "涿州市", leaf: true },
          { value: "130682", label: "定州市", leaf: true },
          { value: "130683", label: "安国市", leaf: true },
          { value: "130684", label: "高碑店市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "310000",
    label: "上海市",
    children: [
      {
        value: "310100",
        label: "市辖区",
        children: [
          { value: "310101", label: "黄浦区", leaf: true },
          { value: "310104", label: "徐汇区", leaf: true },
          { value: "310105", label: "长宁区", leaf: true },
          { value: "310106", label: "静安区", leaf: true },
          { value: "310107", label: "普陀区", leaf: true },
          { value: "310109", label: "虹口区", leaf: true },
          { value: "310110", label: "杨浦区", leaf: true },
          { value: "310112", label: "闵行区", leaf: true },
          { value: "310113", label: "宝山区", leaf: true },
          { value: "310114", label: "嘉定区", leaf: true },
          { value: "310115", label: "浦东新区", leaf: true },
          { value: "310116", label: "金山区", leaf: true },
          { value: "310117", label: "松江区", leaf: true },
          { value: "310118", label: "青浦区", leaf: true },
          { value: "310120", label: "奉贤区", leaf: true },
          { value: "310151", label: "崇明区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "320000",
    label: "江苏省",
    children: [
      {
        value: "320100",
        label: "南京市",
        children: [
          { value: "320102", label: "玄武区", leaf: true },
          { value: "320104", label: "秦淮区", leaf: true },
          { value: "320105", label: "建邺区", leaf: true },
          { value: "320106", label: "鼓楼区", leaf: true },
          { value: "320111", label: "浦口区", leaf: true },
          { value: "320113", label: "栖霞区", leaf: true },
          { value: "320114", label: "雨花台区", leaf: true },
          { value: "320115", label: "江宁区", leaf: true },
          { value: "320116", label: "六合区", leaf: true },
          { value: "320117", label: "溧水区", leaf: true },
          { value: "320118", label: "高淳区", leaf: true },
        ],
      },
      {
        value: "320200",
        label: "无锡市",
        children: [
          { value: "320205", label: "锡山区", leaf: true },
          { value: "320206", label: "惠山区", leaf: true },
          { value: "320211", label: "滨湖区", leaf: true },
          { value: "320213", label: "梁溪区", leaf: true },
          { value: "320214", label: "新吴区", leaf: true },
          { value: "320281", label: "江阴市", leaf: true },
          { value: "320282", label: "宜兴市", leaf: true },
        ],
      },
      {
        value: "320300",
        label: "徐州市",
        children: [
          { value: "320302", label: "鼓楼区", leaf: true },
          { value: "320303", label: "云龙区", leaf: true },
          { value: "320305", label: "贾汪区", leaf: true },
          { value: "320311", label: "泉山区", leaf: true },
          { value: "320312", label: "铜山区", leaf: true },
          { value: "320321", label: "丰县", leaf: true },
          { value: "320322", label: "沛县", leaf: true },
          { value: "320324", label: "睢宁县", leaf: true },
          { value: "320381", label: "新沂市", leaf: true },
          { value: "320382", label: "邳州市", leaf: true },
        ],
      },
      {
        value: "320400",
        label: "常州市",
        children: [
          { value: "320402", label: "天宁区", leaf: true },
          { value: "320404", label: "钟楼区", leaf: true },
          { value: "320411", label: "新北区", leaf: true },
          { value: "320412", label: "武进区", leaf: true },
          { value: "320413", label: "金坛区", leaf: true },
          { value: "320481", label: "溧阳市", leaf: true },
        ],
      },
      {
        value: "320500",
        label: "苏州市",
        children: [
          { value: "320505", label: "虎丘区", leaf: true },
          { value: "320506", label: "吴中区", leaf: true },
          { value: "320507", label: "相城区", leaf: true },
          { value: "320508", label: "姑苏区", leaf: true },
          { value: "320509", label: "吴江区", leaf: true },
          { value: "320581", label: "常熟市", leaf: true },
          { value: "320582", label: "张家港市", leaf: true },
          { value: "320583", label: "昆山市", leaf: true },
          { value: "320585", label: "太仓市", leaf: true },
        ],
      },
      {
        value: "320600",
        label: "南通市",
        children: [
          { value: "320602", label: "崇川区", leaf: true },
          { value: "320611", label: "港闸区", leaf: true },
          { value: "320612", label: "通州区", leaf: true },
          { value: "320623", label: "如东县", leaf: true },
          { value: "320681", label: "启东市", leaf: true },
          { value: "320682", label: "如皋市", leaf: true },
          { value: "320684", label: "海门市", leaf: true },
          { value: "320685", label: "海安市", leaf: true },
        ],
      },
      {
        value: "320700",
        label: "连云港市",
        children: [
          { value: "320703", label: "连云区", leaf: true },
          { value: "320706", label: "海州区", leaf: true },
          { value: "320707", label: "赣榆区", leaf: true },
          { value: "320722", label: "东海县", leaf: true },
          { value: "320723", label: "灌云县", leaf: true },
          { value: "320724", label: "灌南县", leaf: true },
        ],
      },
      {
        value: "320800",
        label: "淮安市",
        children: [
          { value: "320803", label: "淮安区", leaf: true },
          { value: "320804", label: "淮阴区", leaf: true },
          { value: "320812", label: "清江浦区", leaf: true },
          { value: "320813", label: "洪泽区", leaf: true },
          { value: "320826", label: "涟水县", leaf: true },
          { value: "320830", label: "盱眙县", leaf: true },
          { value: "320831", label: "金湖县", leaf: true },
        ],
      },
      {
        value: "320900",
        label: "盐城市",
        children: [
          { value: "320902", label: "亭湖区", leaf: true },
          { value: "320903", label: "盐都区", leaf: true },
          { value: "320904", label: "大丰区", leaf: true },
          { value: "320921", label: "响水县", leaf: true },
          { value: "320922", label: "滨海县", leaf: true },
          { value: "320923", label: "阜宁县", leaf: true },
          { value: "320924", label: "射阳县", leaf: true },
          { value: "320925", label: "建湖县", leaf: true },
          { value: "320981", label: "东台市", leaf: true },
        ],
      },
      {
        value: "321000",
        label: "扬州市",
        children: [
          { value: "321002", label: "广陵区", leaf: true },
          { value: "321003", label: "邗江区", leaf: true },
          { value: "321012", label: "江都区", leaf: true },
          { value: "321023", label: "宝应县", leaf: true },
          { value: "321081", label: "仪征市", leaf: true },
          { value: "321084", label: "高邮市", leaf: true },
        ],
      },
      {
        value: "321100",
        label: "镇江市",
        children: [
          { value: "321102", label: "京口区", leaf: true },
          { value: "321111", label: "润州区", leaf: true },
          { value: "321112", label: "丹徒区", leaf: true },
          { value: "321181", label: "丹阳市", leaf: true },
          { value: "321182", label: "扬中市", leaf: true },
          { value: "321183", label: "句容市", leaf: true },
        ],
      },
      {
        value: "321200",
        label: "泰州市",
        children: [
          { value: "321202", label: "海陵区", leaf: true },
          { value: "321203", label: "高港区", leaf: true },
          { value: "321204", label: "姜堰区", leaf: true },
          { value: "321281", label: "兴化市", leaf: true },
          { value: "321282", label: "靖江市", leaf: true },
          { value: "321283", label: "泰兴市", leaf: true },
        ],
      },
      {
        value: "321300",
        label: "宿迁市",
        children: [
          { value: "321302", label: "宿城区", leaf: true },
          { value: "321311", label: "宿豫区", leaf: true },
          { value: "321322", label: "沭阳县", leaf: true },
          { value: "321323", label: "泗阳县", leaf: true },
          { value: "321324", label: "泗洪县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "330000",
    label: "浙江省",
    children: [
      {
        value: "330100",
        label: "杭州市",
        children: [
          { value: "330102", label: "上城区", leaf: true },
          { value: "330103", label: "下城区", leaf: true },
          { value: "330104", label: "江干区", leaf: true },
          { value: "330105", label: "拱墅区", leaf: true },
          { value: "330106", label: "西湖区", leaf: true },
          { value: "330108", label: "滨江区", leaf: true },
          { value: "330109", label: "萧山区", leaf: true },
          { value: "330110", label: "余杭区", leaf: true },
          { value: "330111", label: "富阳区", leaf: true },
          { value: "330112", label: "临安区", leaf: true },
          { value: "330122", label: "桐庐县", leaf: true },
          { value: "330127", label: "淳安县", leaf: true },
          { value: "330182", label: "建德市", leaf: true },
        ],
      },
      {
        value: "330200",
        label: "宁波市",
        children: [
          { value: "330201", label: "市辖区", leaf: true },
          { value: "330203", label: "海曙区", leaf: true },
          { value: "330205", label: "江北区", leaf: true },
          { value: "330206", label: "北仑区", leaf: true },
          { value: "330211", label: "镇海区", leaf: true },
          { value: "330212", label: "鄞州区", leaf: true },
          { value: "330213", label: "奉化区", leaf: true },
          { value: "330225", label: "象山县", leaf: true },
          { value: "330226", label: "宁海县", leaf: true },
          { value: "330281", label: "余姚市", leaf: true },
          { value: "330282", label: "慈溪市", leaf: true },
        ],
      },
      {
        value: "330300",
        label: "温州市",
        children: [
          { value: "330302", label: "鹿城区", leaf: true },
          { value: "330303", label: "龙湾区", leaf: true },
          { value: "330304", label: "瓯海区", leaf: true },
          { value: "330305", label: "洞头区", leaf: true },
          { value: "330324", label: "永嘉县", leaf: true },
          { value: "330326", label: "平阳县", leaf: true },
          { value: "330327", label: "苍南县", leaf: true },
          { value: "330328", label: "文成县", leaf: true },
          { value: "330329", label: "泰顺县", leaf: true },
          { value: "330381", label: "瑞安市", leaf: true },
          { value: "330382", label: "乐清市", leaf: true },
          { value: "330383", label: "龙港市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "350000",
    label: "福建省",
    children: [
      {
        value: "350100",
        label: "福州市",
        children: [
          { value: "350102", label: "鼓楼区", leaf: true },
          { value: "350103", label: "台江区", leaf: true },
          { value: "350104", label: "仓山区", leaf: true },
          { value: "350105", label: "马尾区", leaf: true },
          { value: "350111", label: "晋安区", leaf: true },
          { value: "350112", label: "长乐区", leaf: true },
          { value: "350121", label: "闽侯县", leaf: true },
          { value: "350122", label: "连江县", leaf: true },
          { value: "350123", label: "罗源县", leaf: true },
          { value: "350124", label: "闽清县", leaf: true },
          { value: "350125", label: "永泰县", leaf: true },
          { value: "350128", label: "平潭县", leaf: true },
          { value: "350181", label: "福清市", leaf: true },
        ],
      },
      {
        value: "350200",
        label: "厦门市",
        children: [
          { value: "350203", label: "思明区", leaf: true },
          { value: "350205", label: "海沧区", leaf: true },
          { value: "350206", label: "湖里区", leaf: true },
          { value: "350211", label: "集美区", leaf: true },
          { value: "350212", label: "同安区", leaf: true },
          { value: "350213", label: "翔安区", leaf: true },
        ],
      },
      {
        value: "350300",
        label: "莆田市",
        children: [
          { value: "350302", label: "城厢区", leaf: true },
          { value: "350303", label: "涵江区", leaf: true },
          { value: "350304", label: "荔城区", leaf: true },
          { value: "350305", label: "秀屿区", leaf: true },
          { value: "350322", label: "仙游县", leaf: true },
        ],
      },
      {
        value: "350400",
        label: "三明市",
        children: [
          { value: "350402", label: "梅列区", leaf: true },
          { value: "350403", label: "三元区", leaf: true },
          { value: "350421", label: "明溪县", leaf: true },
          { value: "350423", label: "清流县", leaf: true },
          { value: "350424", label: "宁化县", leaf: true },
          { value: "350425", label: "大田县", leaf: true },
          { value: "350426", label: "尤溪县", leaf: true },
          { value: "350427", label: "沙县", leaf: true },
          { value: "350428", label: "将乐县", leaf: true },
          { value: "350429", label: "泰宁县", leaf: true },
          { value: "350430", label: "建宁县", leaf: true },
          { value: "350481", label: "永安市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "360000",
    label: "江西省",
    children: [
      {
        value: "360100",
        label: "南昌市",
        children: [
          { value: "360102", label: "东湖区", leaf: true },
          { value: "360103", label: "西湖区", leaf: true },
          { value: "360104", label: "青云谱区", leaf: true },
          { value: "360111", label: "青山湖区", leaf: true },
          { value: "360112", label: "新建区", leaf: true },
          { value: "360113", label: "红谷滩区", leaf: true },
          { value: "360121", label: "南昌县", leaf: true },
          { value: "360123", label: "安义县", leaf: true },
          { value: "360124", label: "进贤县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "370000",
    label: "山东省",
    children: [
      {
        value: "370100",
        label: "济南市",
        children: [
          { value: "370102", label: "历下区", leaf: true },
          { value: "370103", label: "市中区", leaf: true },
          { value: "370104", label: "槐荫区", leaf: true },
          { value: "370105", label: "天桥区", leaf: true },
          { value: "370112", label: "历城区", leaf: true },
          { value: "370113", label: "长清区", leaf: true },
          { value: "370114", label: "章丘区", leaf: true },
          { value: "370115", label: "济阳区", leaf: true },
          { value: "370116", label: "莱芜区", leaf: true },
          { value: "370117", label: "钢城区", leaf: true },
          { value: "370124", label: "平阴县", leaf: true },
          { value: "370126", label: "商河县", leaf: true },
        ],
      },
      {
        value: "370200",
        label: "青岛市",
        children: [
          { value: "370202", label: "市南区", leaf: true },
          { value: "370203", label: "市北区", leaf: true },
          { value: "370211", label: "黄岛区", leaf: true },
          { value: "370212", label: "崂山区", leaf: true },
          { value: "370213", label: "李沧区", leaf: true },
          { value: "370214", label: "城阳区", leaf: true },
          { value: "370215", label: "即墨区", leaf: true },
          { value: "370281", label: "胶州市", leaf: true },
          { value: "370283", label: "平度市", leaf: true },
          { value: "370285", label: "莱西市", leaf: true },
        ],
      },
      {
        value: "370300",
        label: "淄博市",
        children: [
          { value: "370302", label: "淄川区", leaf: true },
          { value: "370303", label: "张店区", leaf: true },
          { value: "370304", label: "博山区", leaf: true },
          { value: "370305", label: "临淄区", leaf: true },
          { value: "370306", label: "周村区", leaf: true },
          { value: "370321", label: "桓台县", leaf: true },
          { value: "370322", label: "高青县", leaf: true },
          { value: "370323", label: "沂源县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "410000",
    label: "河南省",
    children: [
      {
        value: "410100",
        label: "郑州市",
        children: [
          { value: "410102", label: "中原区", leaf: true },
          { value: "410103", label: "二七区", leaf: true },
          { value: "410104", label: "管城回族区", leaf: true },
          { value: "410105", label: "金水区", leaf: true },
          { value: "410106", label: "上街区", leaf: true },
          { value: "410108", label: "惠济区", leaf: true },
          { value: "410122", label: "中牟县", leaf: true },
          { value: "410181", label: "巩义市", leaf: true },
          { value: "410182", label: "荥阳市", leaf: true },
          { value: "410183", label: "新密市", leaf: true },
          { value: "410184", label: "新郑市", leaf: true },
          { value: "410185", label: "登封市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "420000",
    label: "湖北省",
    children: [
      {
        value: "420100",
        label: "武汉市",
        children: [
          { value: "420102", label: "江岸区", leaf: true },
          { value: "420103", label: "江汉区", leaf: true },
          { value: "420104", label: "硚口区", leaf: true },
          { value: "420105", label: "汉阳区", leaf: true },
          { value: "420106", label: "武昌区", leaf: true },
          { value: "420107", label: "青山区", leaf: true },
          { value: "420111", label: "洪山区", leaf: true },
          { value: "420112", label: "东西湖区", leaf: true },
          { value: "420113", label: "汉南区", leaf: true },
          { value: "420114", label: "蔡甸区", leaf: true },
          { value: "420115", label: "江夏区", leaf: true },
          { value: "420116", label: "黄陂区", leaf: true },
          { value: "420117", label: "新洲区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "430000",
    label: "湖南省",
    children: [
      {
        value: "430100",
        label: "长沙市",
        children: [
          { value: "430102", label: "芙蓉区", leaf: true },
          { value: "430103", label: "天心区", leaf: true },
          { value: "430104", label: "岳麓区", leaf: true },
          { value: "430105", label: "开福区", leaf: true },
          { value: "430111", label: "雨花区", leaf: true },
          { value: "430112", label: "望城区", leaf: true },
          { value: "430121", label: "长沙县", leaf: true },
          { value: "430181", label: "浏阳市", leaf: true },
          { value: "430182", label: "宁乡市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "440000",
    label: "广东省",
    children: [
      {
        value: "440100",
        label: "广州市",
        children: [
          { value: "440103", label: "荔湾区", leaf: true },
          { value: "440104", label: "越秀区", leaf: true },
          { value: "440105", label: "海珠区", leaf: true },
          { value: "440106", label: "天河区", leaf: true },
          { value: "440111", label: "白云区", leaf: true },
          { value: "440112", label: "黄埔区", leaf: true },
          { value: "440113", label: "番禺区", leaf: true },
          { value: "440114", label: "花都区", leaf: true },
          { value: "440115", label: "南沙区", leaf: true },
          { value: "440117", label: "从化区", leaf: true },
          { value: "440118", label: "增城区", leaf: true },
        ],
      },
      {
        value: "440200",
        label: "韶关市",
        children: [
          { value: "440203", label: "武江区", leaf: true },
          { value: "440204", label: "浈江区", leaf: true },
          { value: "440205", label: "曲江区", leaf: true },
          { value: "440222", label: "始兴县", leaf: true },
          { value: "440224", label: "仁化县", leaf: true },
          { value: "440229", label: "翁源县", leaf: true },
          { value: "440232", label: "乳源瑶族自治县", leaf: true },
          { value: "440233", label: "新丰县", leaf: true },
          { value: "440281", label: "乐昌市", leaf: true },
          { value: "440282", label: "南雄市", leaf: true },
        ],
      },
      {
        value: "440300",
        label: "深圳市",
        children: [
          { value: "440303", label: "罗湖区", leaf: true },
          { value: "440304", label: "福田区", leaf: true },
          { value: "440305", label: "南山区", leaf: true },
          { value: "440306", label: "宝安区", leaf: true },
          { value: "440307", label: "龙岗区", leaf: true },
          { value: "440308", label: "盐田区", leaf: true },
          { value: "440309", label: "龙华区", leaf: true },
          { value: "440310", label: "坪山区", leaf: true },
          { value: "440311", label: "光明区", leaf: true },
        ],
      },
      {
        value: "440400",
        label: "珠海市",
        children: [
          { value: "440402", label: "香洲区", leaf: true },
          { value: "440403", label: "斗门区", leaf: true },
          { value: "440404", label: "金湾区", leaf: true },
        ],
      },
      {
        value: "440500",
        label: "汕头市",
        children: [
          { value: "440507", label: "龙湖区", leaf: true },
          { value: "440511", label: "金平区", leaf: true },
          { value: "440512", label: "濠江区", leaf: true },
          { value: "440513", label: "潮阳区", leaf: true },
          { value: "440514", label: "潮南区", leaf: true },
          { value: "440515", label: "澄海区", leaf: true },
          { value: "440523", label: "南澳县", leaf: true },
        ],
      },
      {
        value: "440600",
        label: "佛山市",
        children: [
          { value: "440604", label: "禅城区", leaf: true },
          { value: "440605", label: "南海区", leaf: true },
          { value: "440606", label: "顺德区", leaf: true },
          { value: "440607", label: "三水区", leaf: true },
          { value: "440608", label: "高明区", leaf: true },
        ],
      },
      {
        value: "440700",
        label: "江门市",
        children: [
          { value: "440703", label: "蓬江区", leaf: true },
          { value: "440704", label: "江海区", leaf: true },
          { value: "440705", label: "新会区", leaf: true },
          { value: "440781", label: "台山市", leaf: true },
          { value: "440783", label: "开平市", leaf: true },
          { value: "440784", label: "鹤山市", leaf: true },
          { value: "440785", label: "恩平市", leaf: true },
        ],
      },
      {
        value: "440800",
        label: "湛江市",
        children: [
          { value: "440802", label: "赤坎区", leaf: true },
          { value: "440803", label: "霞山区", leaf: true },
          { value: "440804", label: "坡头区", leaf: true },
          { value: "440811", label: "麻章区", leaf: true },
          { value: "440823", label: "遂溪县", leaf: true },
          { value: "440825", label: "徐闻县", leaf: true },
          { value: "440881", label: "廉江市", leaf: true },
          { value: "440882", label: "雷州市", leaf: true },
          { value: "440883", label: "吴川市", leaf: true },
        ],
      },
      {
        value: "440900",
        label: "茂名市",
        children: [
          { value: "440902", label: "茂南区", leaf: true },
          { value: "440904", label: "电白区", leaf: true },
          { value: "440981", label: "高州市", leaf: true },
          { value: "440982", label: "化州市", leaf: true },
          { value: "440983", label: "信宜市", leaf: true },
        ],
      },
      {
        value: "441200",
        label: "肇庆市",
        children: [
          { value: "441202", label: "端州区", leaf: true },
          { value: "441203", label: "鼎湖区", leaf: true },
          { value: "441204", label: "高要区", leaf: true },
          { value: "441223", label: "广宁县", leaf: true },
          { value: "441224", label: "怀集县", leaf: true },
          { value: "441225", label: "封开县", leaf: true },
          { value: "441226", label: "德庆县", leaf: true },
          { value: "441284", label: "四会市", leaf: true },
        ],
      },
      {
        value: "441300",
        label: "惠州市",
        children: [
          { value: "441302", label: "惠城区", leaf: true },
          { value: "441303", label: "惠阳区", leaf: true },
          { value: "441322", label: "博罗县", leaf: true },
          { value: "441323", label: "惠东县", leaf: true },
          { value: "441324", label: "龙门县", leaf: true },
        ],
      },
      {
        value: "441400",
        label: "梅州市",
        children: [
          { value: "441402", label: "梅江区", leaf: true },
          { value: "441403", label: "梅县区", leaf: true },
          { value: "441422", label: "大埔县", leaf: true },
          { value: "441423", label: "丰顺县", leaf: true },
          { value: "441424", label: "五华县", leaf: true },
          { value: "441426", label: "平远县", leaf: true },
          { value: "441427", label: "蕉岭县", leaf: true },
          { value: "441481", label: "兴宁市", leaf: true },
        ],
      },
      {
        value: "441500",
        label: "汕尾市",
        children: [
          { value: "441502", label: "城区", leaf: true },
          { value: "441521", label: "海丰县", leaf: true },
          { value: "441523", label: "陆河县", leaf: true },
          { value: "441581", label: "陆丰市", leaf: true },
        ],
      },
      {
        value: "441600",
        label: "河源市",
        children: [
          { value: "441602", label: "源城区", leaf: true },
          { value: "441621", label: "紫金县", leaf: true },
          { value: "441622", label: "龙川县", leaf: true },
          { value: "441623", label: "连平县", leaf: true },
          { value: "441624", label: "和平县", leaf: true },
          { value: "441625", label: "东源县", leaf: true },
        ],
      },
      {
        value: "441700",
        label: "阳江市",
        children: [
          { value: "441702", label: "江城区", leaf: true },
          { value: "441704", label: "阳东区", leaf: true },
          { value: "441721", label: "阳西县", leaf: true },
          { value: "441781", label: "阳春市", leaf: true },
        ],
      },
      {
        value: "441800",
        label: "清远市",
        children: [
          { value: "441802", label: "清城区", leaf: true },
          { value: "441803", label: "清新区", leaf: true },
          { value: "441821", label: "佛冈县", leaf: true },
          { value: "441823", label: "阳山县", leaf: true },
          { value: "441825", label: "连山壮族瑶族自治县", leaf: true },
          { value: "441826", label: "连南瑶族自治县", leaf: true },
          { value: "441881", label: "英德市", leaf: true },
          { value: "441882", label: "连州市", leaf: true },
        ],
      },
      {
        value: "441900",
        label: "东莞市",
        children: [{ value: "441900", label: "东莞市", leaf: true }],
      },
      {
        value: "442000",
        label: "中山市",
        children: [{ value: "442000", label: "中山市", leaf: true }],
      },
      {
        value: "445100",
        label: "潮州市",
        children: [
          { value: "445102", label: "湘桥区", leaf: true },
          { value: "445103", label: "潮安区", leaf: true },
          { value: "445122", label: "饶平县", leaf: true },
        ],
      },
      {
        value: "445200",
        label: "揭阳市",
        children: [
          { value: "445202", label: "榕城区", leaf: true },
          { value: "445203", label: "揭东区", leaf: true },
          { value: "445222", label: "揭西县", leaf: true },
          { value: "445224", label: "惠来县", leaf: true },
          { value: "445281", label: "普宁市", leaf: true },
        ],
      },
      {
        value: "445300",
        label: "云浮市",
        children: [
          { value: "445302", label: "云城区", leaf: true },
          { value: "445303", label: "云安区", leaf: true },
          { value: "445321", label: "新兴县", leaf: true },
          { value: "445322", label: "郁南县", leaf: true },
          { value: "445381", label: "罗定市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "450000",
    label: "广西壮族自治区",
    children: [
      {
        value: "450100",
        label: "南宁市",
        children: [
          { value: "450102", label: "兴宁区", leaf: true },
          { value: "450103", label: "青秀区", leaf: true },
          { value: "450105", label: "江南区", leaf: true },
          { value: "450107", label: "西乡塘区", leaf: true },
          { value: "450108", label: "良庆区", leaf: true },
          { value: "450109", label: "邕宁区", leaf: true },
          { value: "450110", label: "武鸣区", leaf: true },
          { value: "450123", label: "隆安县", leaf: true },
          { value: "450124", label: "马山县", leaf: true },
          { value: "450125", label: "上林县", leaf: true },
          { value: "450126", label: "宾阳县", leaf: true },
          { value: "450127", label: "横县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "460000",
    label: "海南省",
    children: [
      {
        value: "460100",
        label: "海口市",
        children: [
          { value: "460105", label: "秀英区", leaf: true },
          { value: "460106", label: "龙华区", leaf: true },
          { value: "460107", label: "琼山区", leaf: true },
          { value: "460108", label: "美兰区", leaf: true },
        ],
      },
      {
        value: "460200",
        label: "三亚市",
        children: [
          { value: "460202", label: "海棠区", leaf: true },
          { value: "460203", label: "吉阳区", leaf: true },
          { value: "460204", label: "天涯区", leaf: true },
          { value: "460205", label: "崖州区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "500000",
    label: "重庆市",
    children: [
      {
        value: "500100",
        label: "市辖区",
        children: [
          { value: "500101", label: "万州区", leaf: true },
          { value: "500102", label: "涪陵区", leaf: true },
          { value: "500103", label: "渝中区", leaf: true },
          { value: "500104", label: "大渡口区", leaf: true },
          { value: "500105", label: "江北区", leaf: true },
          { value: "500106", label: "沙坪坝区", leaf: true },
          { value: "500107", label: "九龙坡区", leaf: true },
          { value: "500108", label: "南岸区", leaf: true },
          { value: "500109", label: "北碚区", leaf: true },
          { value: "500110", label: "綦江区", leaf: true },
          { value: "500111", label: "大足区", leaf: true },
          { value: "500112", label: "渝北区", leaf: true },
          { value: "500113", label: "巴南区", leaf: true },
          { value: "500114", label: "黔江区", leaf: true },
          { value: "500115", label: "长寿区", leaf: true },
          { value: "500116", label: "江津区", leaf: true },
          { value: "500117", label: "合川区", leaf: true },
          { value: "500118", label: "永川区", leaf: true },
          { value: "500119", label: "南川区", leaf: true },
          { value: "500120", label: "璧山区", leaf: true },
          { value: "500151", label: "铜梁区", leaf: true },
          { value: "500152", label: "潼南区", leaf: true },
          { value: "500153", label: "荣昌区", leaf: true },
          { value: "500154", label: "开州区", leaf: true },
          { value: "500155", label: "梁平区", leaf: true },
          { value: "500156", label: "武隆区", leaf: true },
        ],
      },
    ],
  },
  {
    value: "510000",
    label: "四川省",
    children: [
      {
        value: "510100",
        label: "成都市",
        children: [
          { value: "510104", label: "锦江区", leaf: true },
          { value: "510105", label: "青羊区", leaf: true },
          { value: "510106", label: "金牛区", leaf: true },
          { value: "510107", label: "武侯区", leaf: true },
          { value: "510108", label: "成华区", leaf: true },
          { value: "510112", label: "龙泉驿区", leaf: true },
          { value: "510113", label: "青白江区", leaf: true },
          { value: "510114", label: "新都区", leaf: true },
          { value: "510115", label: "温江区", leaf: true },
          { value: "510116", label: "双流区", leaf: true },
          { value: "510117", label: "郫都区", leaf: true },
          { value: "510118", label: "新津区", leaf: true },
          { value: "510121", label: "金堂县", leaf: true },
          { value: "510129", label: "大邑县", leaf: true },
          { value: "510131", label: "蒲江县", leaf: true },
          { value: "510181", label: "都江堰市", leaf: true },
          { value: "510182", label: "彭州市", leaf: true },
          { value: "510183", label: "邛崃市", leaf: true },
          { value: "510184", label: "崇州市", leaf: true },
          { value: "510185", label: "简阳市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "520000",
    label: "贵州省",
    children: [
      {
        value: "520100",
        label: "贵阳市",
        children: [
          { value: "520102", label: "南明区", leaf: true },
          { value: "520103", label: "云岩区", leaf: true },
          { value: "520111", label: "花溪区", leaf: true },
          { value: "520112", label: "乌当区", leaf: true },
          { value: "520113", label: "白云区", leaf: true },
          { value: "520115", label: "观山湖区", leaf: true },
          { value: "520121", label: "开阳县", leaf: true },
          { value: "520122", label: "息烽县", leaf: true },
          { value: "520123", label: "修文县", leaf: true },
          { value: "520181", label: "清镇市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "530000",
    label: "云南省",
    children: [
      {
        value: "530100",
        label: "昆明市",
        children: [
          { value: "530102", label: "五华区", leaf: true },
          { value: "530103", label: "盘龙区", leaf: true },
          { value: "530111", label: "官渡区", leaf: true },
          { value: "530112", label: "西山区", leaf: true },
          { value: "530113", label: "东川区", leaf: true },
          { value: "530114", label: "呈贡区", leaf: true },
          { value: "530115", label: "晋宁区", leaf: true },
          { value: "530124", label: "富民县", leaf: true },
          { value: "530125", label: "宜良县", leaf: true },
          { value: "530126", label: "石林彝族自治县", leaf: true },
          { value: "530127", label: "嵩明县", leaf: true },
          { value: "530128", label: "禄劝彝族苗族自治县", leaf: true },
          { value: "530129", label: "寻甸回族彝族自治县", leaf: true },
          { value: "530181", label: "安宁市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "610000",
    label: "陕西省",
    children: [
      {
        value: "610100",
        label: "西安市",
        children: [
          { value: "610102", label: "新城区", leaf: true },
          { value: "610103", label: "碑林区", leaf: true },
          { value: "610104", label: "莲湖区", leaf: true },
          { value: "610111", label: "灞桥区", leaf: true },
          { value: "610112", label: "未央区", leaf: true },
          { value: "610113", label: "雁塔区", leaf: true },
          { value: "610114", label: "阎良区", leaf: true },
          { value: "610115", label: "临潼区", leaf: true },
          { value: "610116", label: "长安区", leaf: true },
          { value: "610117", label: "高陵区", leaf: true },
          { value: "610118", label: "鄠邑区", leaf: true },
          { value: "610122", label: "蓝田县", leaf: true },
          { value: "610124", label: "周至县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "620000",
    label: "甘肃省",
    children: [
      {
        value: "620100",
        label: "兰州市",
        children: [
          { value: "620102", label: "城关区", leaf: true },
          { value: "620103", label: "七里河区", leaf: true },
          { value: "620104", label: "西固区", leaf: true },
          { value: "620105", label: "安宁区", leaf: true },
          { value: "620111", label: "红古区", leaf: true },
          { value: "620121", label: "永登县", leaf: true },
          { value: "620122", label: "皋兰县", leaf: true },
          { value: "620123", label: "榆中县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "630000",
    label: "青海省",
    children: [
      {
        value: "630100",
        label: "西宁市",
        children: [
          { value: "630102", label: "城东区", leaf: true },
          { value: "630103", label: "城中区", leaf: true },
          { value: "630104", label: "城西区", leaf: true },
          { value: "630105", label: "城北区", leaf: true },
          { value: "630106", label: "湟中区", leaf: true },
          { value: "630121", label: "大通回族土族自治县", leaf: true },
          { value: "630123", label: "湟源县", leaf: true },
        ],
      },
    ],
  },
  {
    value: "640000",
    label: "宁夏回族自治区",
    children: [
      {
        value: "640100",
        label: "银川市",
        children: [
          { value: "640104", label: "兴庆区", leaf: true },
          { value: "640105", label: "西夏区", leaf: true },
          { value: "640106", label: "金凤区", leaf: true },
          { value: "640121", label: "永宁县", leaf: true },
          { value: "640122", label: "贺兰县", leaf: true },
          { value: "640181", label: "灵武市", leaf: true },
        ],
      },
    ],
  },
  {
    value: "650000",
    label: "新疆维吾尔自治区",
    children: [
      {
        value: "650100",
        label: "乌鲁木齐市",
        children: [
          { value: "650102", label: "天山区", leaf: true },
          { value: "650103", label: "沙依巴克区", leaf: true },
          { value: "650104", label: "新市区", leaf: true },
          { value: "650105", label: "水磨沟区", leaf: true },
          { value: "650106", label: "头屯河区", leaf: true },
          { value: "650107", label: "达坂城区", leaf: true },
          { value: "650109", label: "米东区", leaf: true },
          { value: "650121", label: "乌鲁木齐县", leaf: true },
        ],
      },
    ],
  },
];

// ── 工具函数 ──

/**
 * 根据最终叶子节点的 value 构建完整路径字符串
 * @param codes - 级联选择器选中的值数组 [省编码, 市编码, 区编码]
 * @returns 路径字符串，如 "广东省/深圳市/南山区"
 *
 * @example
 * ```ts
 * buildRegionPath(["440000", "440300", "440305"]) // "广东省/深圳市/南山区"
 * buildRegionPath(["110000", "110100", "110101"]) // "北京市/市辖区/东城区"
 * ```
 */
export function buildRegionPath(codes: string[]): string {
  const parts: string[] = [];
  let currentLevel: RegionNode[] = REGION_TREE;

  for (const code of codes) {
    const node = currentLevel.find((n) => n.value === code);
    if (!node) break;
    parts.push(node.label);
    currentLevel = (node.children as RegionNode[]) || [];
  }

  return parts.join("/");
}

/**
 * Element Plus Cascader 懒加载回调
 * 配合 el-cascader :props="{ lazy: true, lazyLoad: regionLazyLoad }" 使用
 *
 * @example
 * ```vue
 * <el-cascader
 *   :props="{ lazy: true, lazyLoad: regionLazyLoad, checkStrictly: true }"
 * />
 * ```
 */
export function regionLazyLoad(
  node: { level: number; value?: string },
  resolve: (children: RegionNode[]) => void
): void {
  if (node.level === 0) {
    // 根节点：加载所有省份
    resolve(REGION_TREE);
    return;
  }

  // 根据当前节点 value 查找子节点
  const findChildren = (nodes: RegionNode[], value: string): RegionNode[] | undefined => {
    for (const n of nodes) {
      if (n.value === value) return n.children as RegionNode[];
      if (n.children) {
        const found = findChildren(n.children, value);
        if (found) return found;
      }
    }
    return undefined;
  };

  const children = findChildren(REGION_TREE, node.value!);
  resolve(children || []);
}
