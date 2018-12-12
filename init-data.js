const common = require('./util/CommonUtil');
const Sequence = require('./util/Sequence');
const GLBConfig = require('./util/GLBConfig');
const logger = require('./util/Logger').createLogger('db');
const model = require('./model.js');

let tb_common_domain = model.common_domain;
let tb_common_user = model.common_user;
let tb_common_usergroup = model.common_usergroup;
let tb_common_api = model.common_api;
let tb_common_systemmenu = model.common_systemmenu;
let tb_process = model.erc_process;
let tb_taskallot = model.erc_taskallot;

(async() => {
    try {
        let menu = null
        let fmenuID1 = null
        let fmenuID2 = null
        let api = null
        let usergroup = null

        let domain = await tb_common_domain.create({
            domain: 'admin',
            domain_type: '0',
            domain_name: 'administratorGroup',
            domain_description: 'admin'
        });

        usergroup = await tb_common_usergroup.create({
            domain_id: domain.domain_id,
            usergroup_name: 'administrator',
            usergroup_type: GLBConfig.TYPE_ADMINISTRATOR,
            node_type: '01',
            parent_id: 0,
            description: 'administrator'
        });

        let user = await tb_common_user.create({
            user_id: await Sequence.genUserID(),
            domain_id: domain.domain_id,
            usergroup_id: usergroup.usergroup_id,
            user_type: GLBConfig.TYPE_ADMINISTRATOR,
            username: 'admin',
            name: 'admin',
            password: 'admin'
        });

        // common
        menu = await tb_common_systemmenu.create({ systemmenu_name: 'common', node_type: '00', parent_id: '0'});
        fmenuID1 = menu.systemmenu_id

        menu = await tb_common_systemmenu.create({ systemmenu_name: 'system', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id
        api = await tb_common_api.create({api_name:'系统菜单维护', api_path: '/common/system/SystemApiControl', api_function: 'SYSTEMAPICONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'机构模板维护', api_path: '/common/system/DomainTemplateControl', api_function: 'DOMAINTEMPLATECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'机构维护', api_path: '/common/system/DomainControl', api_function: 'DOMAINCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'系统组权限维护', api_path: '/common/system/SysGroupApiControl', api_function: 'SYSGROUPAPICONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'用户设置', api_path: '/common/system/UserSetting', api_function: 'USERSETTING', auth_flag: '1', show_flag: '0', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'角色设置', api_path: '/common/system/DomainGroupControl', api_function: 'DOMAINGROUPCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'员工维护', api_path: '/common/system/OperatorControl', api_function: 'OPERATORCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'重置密码', api_path: '/common/system/ResetPassword', api_function: 'RESETPASSWORD', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        menu = await tb_common_systemmenu.create({ systemmenu_name: 'erc', node_type: '00', parent_id: '0'});
        fmenuID1 = menu.systemmenu_id
        //运营数据管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '运营数据管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'人工价格标准', api_path: '/erc/baseconfig/ERCWorkerPriceControl', api_function: 'ERCWORKERPRICECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'附属公司列表', api_path: '/erc/baseconfig/ERCAffiliatedCompanyControl', api_function: 'ERCAFFILIATEDCOMPANYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'基础数据维护', api_path: '/erc/baseconfig/ERCBaseDataControl', api_function: 'ERCBASEDATACONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'物料数据维护列表', api_path: '/erc/baseconfig/ERCMaterielControl', api_function: 'ERCMATERIELCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'供应商维护', api_path: '/erc/baseconfig/ERCSupplierControl', api_function: 'ERCSUPPLIERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'供应商物料维护', api_path: '/erc/baseconfig/ERCSupplierMaterielControl', api_function: 'ERCSUPPLIERMATERIELCONTROL', auth_flag: '1', show_flag: '0', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'工作流配置', api_path: '/erc/baseconfig/ERCTaskAllotControl', api_function: 'ERCTASKALLOTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu. create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        menu = await tb_common_systemmenu.create({ systemmenu_name: '采购管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'采购管理', api_path: '/erc/purchasemanage/ERCPurchaseControl', api_function: 'ERCPURCHASECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //行政办公管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '行政办公管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id
        api = await tb_common_api.create({api_name:'会议室数据维护', api_path: '/erc/baseconfig/ERCMeetingRoomControl', api_function: 'ERCMEETINGROOMCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'车辆数据维护', api_path: '/erc/baseconfig/ERCVehicleControl', api_function: 'ERCVEHICLECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'出差交通接待申请', api_path: '/erc/baseconfig/ERCTransReceptionListControl', api_function: 'ERCTRANSRECEPTIONLISTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'出差交通接待报销申请', api_path: '/erc/baseconfig/ERCTransReceptionListExpenseControl', api_function: 'ERCTRANSRECEPTIONLISTEXPENSECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'资金支出申请', api_path: '/erc/baseconfig/ERCSpecialExpenseControl', api_function: 'ERCSPECIALEXPENSECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'会议记录管理', api_path: '/erc/baseconfig/ERCMeetingMinuteControl', api_function: 'ERCMEETINGMINUTECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'会议管理', api_path: '/erc/baseconfig/ERCMeetingManageControl', api_function: 'ERCMEETINGMANAGECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'文控管理', api_path: '/erc/baseconfig/ERCDocumentManagementControl', api_function: 'ERCDOCUMENTMANAGEMENTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'文件通知', api_path: '/erc/baseconfig/ERCDocumentNoticeControl', api_function: 'ERCDOCUMENTNOTICECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'岗位管理', api_path: '/erc/baseconfig/ERCUsergroupControl', api_function: 'ERCUSERGROUPCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'部门管理', api_path: '/erc/baseconfig/ERCDepartmentControl', api_function: 'ERCDEPARTMENTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'请假管理', api_path: '/erc/baseconfig/ERCAskForLeaveControl', api_function: 'ERCASKFORLEAVECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'报销职级维护', api_path: '/erc/baseconfig/ERCReimburseRankControl', api_function: 'ERCREIMBURSERANKCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // // 公告
        menu = await tb_common_systemmenu.create({ systemmenu_name: '公告管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'公告管理', api_path: '/erc/baseconfig/ERCNoticeControl', api_function: 'ERCNOTICECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // 人力资源管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '人力资源管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'员工信息管理', api_path: '/erc/baseconfig/ERCEmployeeInformationControl', api_function: 'ERCEMPLOYEEINFORMATIONCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'人力需求管理', api_path: '/erc/baseconfig/ERCHumanResourceControl', api_function: 'ERCHUMANRESOURCECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // 品质管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '品质管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'品质数据录入管理', api_path: '/erc/purchasemanage/ERCQualityAddControl', api_function: 'ERCQUALITYADDCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'退货单管理', api_path: '/erc/purchasemanage/ERCReturnNoteControl', api_function: 'ERCRETURNNOTECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'品质检验单列表', api_path: '/erc/purchasemanage/ERCQualityCheckControl', api_function: 'ERCQUALITYCHECKCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // 客户管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '客户管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'贷款管理', api_path: '/erc/customermanage/ERCLoanControl', api_function: 'ERCLOANCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'客户管理', api_path: '/erc/customermanage/ERCCustomerControl', api_function: 'ERCCUSTOMERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'总部客户维护', api_path: '/erc/customermanage/ERCCustomerAssignControl', api_function: 'ERCCUSTOMERASSIGNCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // 企业客户管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '企业客户管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'体验店管理', api_path: '/erc/baseconfig/ERCBusinessCustomerControl', api_function: 'ERCBUSINESSCUSTOMERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'销售价格模板', api_path: '/erc/baseconfig/ERCProductSalesPriceControl', api_function: 'ERCPRODECTSALESPRICECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'企业客户列表', api_path: '/erc/baseconfig/ERCCorporateClientsControl', api_function: 'ERCCORPORATECLIENTSCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        // 出纳管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '出纳管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'付款列表', api_path: '/erc/cashiermanage/ERCPaymentConfirmControl', api_function: 'ERCPAYMENTCONFIRMCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'收款申请管理', api_path: '/erc/cashiermanage/ERCGatheringControl', api_function: 'ERCGATHERINGCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //投诉管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '投诉管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'客户投诉管理', api_path: '/erc/customermanage/ERCUserComplaintControl', api_function: 'ERCUSERCOMPLAINTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'投诉列表', api_path: '/erc/customermanage/ERCComplaintControl', api_function: 'ERCCOMPLAINTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //工程项目管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '项目工程管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'项目工程列表', api_path: '/erc/baseconfig/ERCProjectControl', api_function: 'ERCPROJECTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //WMS系统管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: 'WMS系统管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'入库管理', api_path: '/erc/inventorymanage/ERCBuyInControl', api_function: 'ERCBUYINCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'入库流水', api_path: '/erc/inventorymanage/ERCBuyInHistoryControl', api_function: 'ERCBUYINHISTORYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'盘点管理', api_path: '/erc/inventorymanage/ERCCheckInventoryControl', api_function: 'ERCCHECKINVENTORYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'实时库存数据管理', api_path: '/erc/inventorymanage/ERCInventoryControl', api_function: 'ERCINVENTORYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'收发存数据管理', api_path: '/erc/inventorymanage/ERCInventoryDetailControl', api_function: 'ERCINVENTORYDETAILCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'出库管理', api_path: '/erc/inventorymanage/ERCSaleOutControl', api_function: 'ERCSALEOUTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'出库流水', api_path: '/erc/inventorymanage/ERCSaleOutHistoryControl', api_function: 'ERCSALEOUTHISTORYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'仓库仓区管理', api_path: '/erc/inventorymanage/ERCWarehouseControl', api_function: 'ERCWAREHOUSECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'报废管理', api_path: '/erc/inventorymanage/ERCInvalidateControl', api_function: 'ERCINVALIDATECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'出库申请', api_path: '/erc/inventorymanage/ERCStockOutApplyControl', api_function: 'ERCSTOCKOUTAPPLYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'入库申请', api_path: '/erc/inventorymanage/ERCStockInApplyControl', api_function: 'ERCSTOCKINAPPLYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'闲置库存申请', api_path: '/erc/inventorymanage/ERCIdleApplyControl', api_function: 'ERCIDLEAPPLYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'收货管理', api_path: '/erc/inventorymanage/ERCCollectGoodsControl', api_function: 'ERCCOLLECTGOODSCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'收货列表', api_path: '/erc/inventorymanage/ERCReceiptListControl', api_function: 'ERCRECEIPTLISTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'});
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //研发资产管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '研发资产管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'材料耗用单', api_path: '/erc/longtermassets/ERCDevelopConsumeControl', api_function: 'ERCDEVELOPCONSUMECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'研发项目管理', api_path: '/erc/longtermassets/ERCDevelopControl', api_function: 'ERCDEVELOPCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'材料采购单', api_path: '/erc/longtermassets/ERCDevelopPurchaseOrderControl', api_function: 'ERCDEVELOPPURCHASEORDERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'材料收料单', api_path: '/erc/longtermassets/ERCDevelopReceiveControl', api_function: 'ERCDEVELOPRECEIVECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'材料申购单', api_path: '/erc/longtermassets/ERCDevelopScribeOrderControl', api_function: 'ERCDEVELOPSCRIBEORDERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //长期资产管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '长期资产管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'低值易耗品管理', api_path: '/erc/longtermassets/ERCConsumablesControl', api_function: 'ERCCONSUMABLESCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'资产盘点管理', api_path: '/erc/longtermassets/ERCAssetInventoryControl', api_function: 'ERCASSETINVENTORYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'资产报废管理', api_path: '/erc/longtermassets/ERCAssetRetirementControl', api_function: 'ERCASSETRETIREMENTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'固定资产管理', api_path: '/erc/longtermassets/ERCFixedAssetsControl', api_function: 'ERCFIXEDASSETSCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'资产物料收料单', api_path: '/erc/longtermassets/ERCAmortizeReceiveControl', api_function: 'ERCAMORTIZERECEIVECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'资产物料耗用单', api_path: '/erc/longtermassets/ERCAmortizeConsumeControl', api_function: 'ERCAMORTIZECONSUMECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'报废申请单管理', api_path: '/erc/longtermassets/ERCAssetRetirementControl', api_function: 'ERCASSETRETIREMENTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'待摊资产数据管理', api_path: '/erc/longtermassets/ERCAmortizeDataControl', api_function: 'ERCAMORTIZEDATACONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'待摊资产项目管理', api_path: '/erc/longtermassets/ERCAmortizeControl', api_function: 'ERCAMORTIZECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        menu = await tb_common_systemmenu.create({ systemmenu_name: '订单管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'管理配置', api_path: '/erc/ordermanage/ERCOrderRequireControl', api_function: 'ERCORDERREQUIRECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'机构订单', api_path: '/erc/ordermanage/ERCSaleOrderInstitutionsControl', api_function: 'ERCSALEORDERINSTITUTIONSCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'总部订单查询', api_path: '/erc/ordermanage/ERCHDOrderControl', api_function: 'ERCHDORDERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'企业订单', api_path: '/erc/ordermanage/ERCSaleOrderCompanyControl', api_function: 'ERCSALEORDERCOMPANYCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'订单评审', api_path: '/erc/ordermanage/ERCOrderReviewControl', api_function: 'ERCORDERREVIEWCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'个人订单', api_path: '/erc/ordermanage/ERCSaleOrderControl', api_function: 'ERCSALEORDERCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        menu = await tb_common_systemmenu.create({ systemmenu_name: '生产计划管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'产品规划列表', api_path: '/erc/productionmanage/ERCProductPlanControl', api_function: 'ERCPRODUCTPLANCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'生产工序管理', api_path: '/erc/productionmanage/ERCProductProcedureControl', api_function: 'ERCPRODUCTPROCEDURECONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});
        api = await tb_common_api.create({api_name:'生产任务单', api_path: '/erc/productionmanage/ERCProductiveTaskControl', api_function: 'ERCPRODUCTIVETASKCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});

        //事务管理
        menu = await tb_common_systemmenu.create({ systemmenu_name: '事务管理', node_type: '00', parent_id: fmenuID1});
        fmenuID2 = menu.systemmenu_id;
        api = await tb_common_api.create({api_name:'任务列表', api_path: '/erc/baseconfig/ERCTaskListControl', api_function: 'ERCTASKLISTCONTROL', auth_flag: '1', show_flag: '1', api_kind: '1'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID2});


        //移动端
        menu = await tb_common_systemmenu.create({ systemmenu_name: 'app', node_type: '00', parent_id: '0'});
        fmenuID1 = menu.systemmenu_id
        api = await tb_common_api.create({api_name:'用户管理', api_path: '/mobile/user', api_function: 'USER', auth_flag: '1', show_flag: '0', api_kind: '2'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID1});
        api = await tb_common_api.create({api_name:'投诉建议', api_path: '/mobile/feedback', api_function: 'FEEDBACK', auth_flag: '1', show_flag: '0', api_kind: '2'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID1});
        api = await tb_common_api.create({api_name:'任务管理', api_path: '/mobile/task', api_function: 'TASK', auth_flag: '1', show_flag: '0', api_kind: '2'})
        menu = await tb_common_systemmenu.create({ systemmenu_name: api.api_name, api_id: api.api_id, api_function: api.api_function, node_type: '01', parent_id: fmenuID1});


        //taskallot data init
        await tb_taskallot.create({
            taskallot_id: 1,
            taskallot_name: '一般任务',
            taskallot_describe: '分配一般任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 2,
            taskallot_name: '采购申请',
            taskallot_describe: '分配采购申请审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 3,
            taskallot_name: '内部审核',
            taskallot_describe: '分配内部审核审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 4,
            taskallot_name: '生产计划',
            taskallot_describe: '分配生产计划审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 5,
            taskallot_name: '订单评审',
            taskallot_describe: '分配订单评审审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 6,
            taskallot_name: '订单验收',
            taskallot_describe: '分配订单验收审核人员'
        });

        await tb_taskallot.create({
            taskallot_id: 7,
            taskallot_name: '物料审核',
            taskallot_describe: '分配物料审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 12,
            taskallot_name: '预算审核',
            taskallot_describe: '分配预算审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 14,
            taskallot_name: '通知公告',
            taskallot_describe: '分配公告通知审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 16,
            taskallot_name: '退货任务',
            taskallot_describe: '处理退货请求'
        });
        await tb_taskallot.create({
            taskallot_id: 18,
            taskallot_name: '会议通知',
            taskallot_describe: '会议通知与会人员'
        });
        await tb_taskallot.create({
            taskallot_id: 19,
            taskallot_name: '会议跟进事项',
            taskallot_describe: '通知会议跟进事项责任人'
        });
        await tb_taskallot.create({
            taskallot_id: 20,
            taskallot_name: '会议通知管理员',
            taskallot_describe: '通知会议室管理员'
        });
        await tb_taskallot.create({
            taskallot_id: 21,
            taskallot_name: '会议通知主持人',
            taskallot_describe: '通知会议主持人'
        });
        await tb_taskallot.create({
            taskallot_id: 22,
            taskallot_name: '交通接待申请',
            taskallot_describe: '分配交通接待申请审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 23,
            taskallot_name: '会议通知设备管理员',
            taskallot_describe: '通知会议室设备管理员'
        });
        await tb_taskallot.create({
            taskallot_id: 24,
            taskallot_name: '交通接待报销申请',
            taskallot_describe: '分配交通接待报销审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 25,
            taskallot_name: '文控审批任务',
            taskallot_describe: '处理文件发布请求'
        });
        await tb_taskallot.create({
            taskallot_id: 26,
            taskallot_name: '文件发布通知',
            taskallot_describe: '通知文件发布事项'
        });
        await tb_taskallot.create({
            taskallot_id: 27,
            taskallot_name: '请假审批任务',
            taskallot_describe: '处理请假请求'
        });
        await tb_taskallot.create({
            taskallot_id: 28,
            taskallot_name: '特殊费用报销审批任务',
            taskallot_describe: '分配处理特殊费用报销审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 29,
            taskallot_name: '固定资产申购审批任务',
            taskallot_describe: '处理固定资产申购请求'
        });
        await tb_taskallot.create({
            taskallot_id: 30,
            taskallot_name: '固定资产验收任务',
            taskallot_describe: '处理固定资产申购请求'
        });
        await tb_taskallot.create({
            taskallot_id: 45,
            taskallot_name: '出纳管理新增收款申报任务',
            taskallot_describe: '出纳管理新增收款申报'
        });
        await tb_taskallot.create({
            taskallot_id: 46,
            taskallot_name: '出纳管理新增付款确认任务',
            taskallot_describe: '出纳管理付款确认'
        });
        await tb_taskallot.create({
            taskallot_id: 60,
            taskallot_name: '工程项目材料申购审核任务',
            taskallot_describe: '分配工程项目材料申购任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 61,
            taskallot_name: '工程项目人工结算审核任务',
            taskallot_describe: '分配工程项目人工结算任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 62,
            taskallot_name: '工程项目材料耗用审核任务',
            taskallot_describe: '分配工程项目材料耗用任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 63,
            taskallot_name: '工程项目构建费用审核任务',
            taskallot_describe: '分配工程项目构建费用任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 64,
            taskallot_name: '工程项目提交验收审核任务',
            taskallot_describe: '分配工程项目提交验收任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 65,
            taskallot_name: '工程项目新建审核任务',
            taskallot_describe: '分配工程项目新建任务审核人员'
        });
        await tb_taskallot.create({
            taskallot_id: 66,
            taskallot_name: '工程项目提交预算审核任务',
            taskallot_describe: '分配工程项目提交预算任务审核人员'
        });

        process.exit(0)
    } catch (error) {
        console.log(error);
    }
})();
