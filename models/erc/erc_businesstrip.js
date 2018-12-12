/**
 * Created by nie on 18/11/6.
 */
const db = require('../../util/db');
const GLBConfig = require('../../util/GLBConfig');
/**出差申请单 **/
module.exports = db.defineModel('tbl_erc_businesstrip', {
    businesstrip_id: {
        type: db.IDNO,
        autoIncrement: true,
        primaryKey: true
    },
    businesstrip_code: {//申请单号
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_proposer: {//申请人
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_state: {//状态  待提交，已提交，通过，拒绝
        type: db.INTEGER,
        allowNull: true
    },
    businesstrip_examine: {//审批人
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_examine_time: {//审批时间
        type: db.DATE,
        allowNull: true
    },
    businesstrip_refuse_remark: {//驳回说明
        type: db.STRING(300),
        allowNull: true
    },
    businesstrip_sprovince: {//起始地省
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_scity: {//起始地市
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_sdistrict: {//起始地区
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_sadress: {//起始地详细地址
        type: db.STRING(300),
        allowNull: true
    },
    businesstrip_dprovince: {//目的地省
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_dcity: {//目的地市
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_ddistrict: {//目的地区
        type: db.STRING(100),
        allowNull: true
    },
    businesstrip_dadress: {//目的地地址
        type: db.STRING(300),
        allowNull: true
    },
    businesstrip_reason: {//出差理由
        type: db.STRING(300),
        allowNull: true
    },
    businesstrip_type: {//出差理由分类
        type: db.STRING(10),
        allowNull: true
    },
    businesstrip_planon_putup_fee: {//预计住宿费用
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_planon_city_traffic_subsidy: {//预计市内交通补助
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_planon_food_subsidy: {//预计伙食补助
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_traffic_type: {//交通方式
        type: db.STRING(10),
        allowNull: true
    },
    businesstrip_public_transport: {//公共交通工具
        type: db.STRING(10),
        allowNull: true
    },
    businesstrip_car_apply: {//车辆申请
        type: db.STRING(10),
        allowNull: true
    },
    businesstrip_reimburse_type: {//派车费用报销模式
        type: db.STRING(10),
        allowNull: true
    },
    businesstrip_predict_KM: {//预计公里数
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_gasoline_subsidy: {//自驾车预计油补费用
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_traffic_fee: {//非自驾车预计交通费用
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_borrow_money: {//申请预借费用
        type: db.DOUBLE,
        allowNull: true
    },
    businesstrip_business_start_time: {//业务发生日期
        type: db.DATE,
        allowNull: true
    },
    businesstrip_business_start_time: {//业务结束日期
        type: db.DATE,
        allowNull: true
    }
});
