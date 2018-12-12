/**
 * Created by nie on 18/11/7.
 */
const common = require('../../../util/CommonUtil');
const GLBConfig = require('../../../util/GLBConfig');
const Sequence = require('../../../util/Sequence');
const logger = require('../../../util/Logger').createLogger('ERCNoticeControlSRV');
const model = require('../../../model');
const moment = require('moment');
const task = require('../baseconfig/ERCTaskListControlSRV');

const sequelize = model.sequelize;
const tb_reimburserank = model.erc_reimburserank;
const tb_vehicle = model.erc_vehicle;
const tb_user = model.common_user;

exports.ERCBusinessTripControlResource = (req, res) => {
    let method = req.query.method
    if (method === 'init') {
        initAct(req, res);
    }else{
        common.sendError(res, 'common_01')
    }
}

//获得职级
let getReim = async(req,domain)=>{
    let rank = await tb_reimburserank.findAll({
        where: {
            domain_id: domain,
            state: GLBConfig.ENABLE
        }
    });
    var returnData=[];
    for (let i of rank) {
        let temy = {}
        temy.id=i.reimburserank_id;
        temy.value=i.reimburserank_id;
        temy.text=i.reimburserank_name;
        returnData.push(temy);
    }
    return returnData;
};
//获得车辆
let getVehicle = async(req,domain)=>{
    let vehicle = await tb_vehicle.findAll({
        where: {
            domain_id: domain,
            vehicle_status:GLBConfig.VEHICLESTATUS[0].value,
            state: GLBConfig.ENABLE
        }
    });
    var returnData=[];
    for (let i of vehicle) {
        let temy = {}
        temy.id=i.vehicle_id;
        temy.value=i.vehicle_id;
        temy.text=i.license_plate_num;
        returnData.push(temy);
    }
    return returnData
};
//获得人员
let getUser = async(req,domain)=>{
    let users = await tb_user.findAll({
        where: {
            domain_id: domain,
            state: GLBConfig.ENABLE,
            user_type: GLBConfig.TYPE_OPERATOR
        }
    });
    var returnData=[];
    for (let i of users) {
        let temy = {}
        temy.id=i.user_id;
        temy.value=i.user_id;
        temy.text=i.name;
        returnData.push(temy);
    }
    return returnData
};

async function initAct(req, res) {
    try {
        let doc = common.docTrim(req.body), user = req.user, returnData = {};

        let reimResult= await getReim(req,user.domain_id);//职级
        let vehicleResult = await getVehicle(req,user.domain_id);
        let userResult = await getUser(req,user.domain_id);

        returnData.reimburSerankArr=reimResult;//职级
        returnData.vehicleArr=vehicleResult;//车辆
        returnData.userArr=userResult;//人员
        returnData.trapply_trip_reason_type_arr= GLBConfig.TRAPPLY_TRIP_REASON_TYPE;//出差事由分类
        returnData.trapply_trans_way_arr= GLBConfig.TRAPPLY_TRANS_WAY;//交通方式
        returnData.trapply_vehicle_review_type_arr= GLBConfig.TRAPPLY_VEHICLE_REVIEW_TYPE;//公司派车报销模式
        returnData.publicTransport = await getPublicTrabsport(user);
        common.sendData(res, returnData);
    } catch (error) {
        common.sendFault(res, error);
    }
}

//根据职级，获得公共交通工具
let getPublicTrabsport = async(user)=>{
    try{
        let replacements = [];
        let original = [
            {id: 1, value: '1', text: '飞机'},
            {id: 2, value: '2', text: '高铁'},
            {id: 2, value: '3', text: '火车'},
            {id: 2, value: '4', text: '汽车'},
        ]
        let queryStr = `select r.* from tbl_erc_reimburserank r,tbl_erc_customer c 
            where r.state=1 and c.state=1 and r.reimburserank_id = c.customer_reimburserank_id 
            and c.user_id = ?`;
        replacements.push(user.user_id)
        let result = await common.simpleSelect(sequelize, queryStr, replacements);
        if(result && result.length>0){
            if(result[0].reimburserank_traffic_tools == 1){
                let [...data] = original;
                return data;
            }else if(result[0].reimburserank_traffic_tools == 2){
                let [a,...data] = original;
                return data;
            }else if (result[0].reimburserank_traffic_tools == 3){
                let [a,b,...data] = original;
                return data;
            }else if (result[0].reimburserank_traffic_tools == 4){
                let [a,b,c,...data] = original;
                return data;
            }
        }else{
            return [];
        }
    }catch (error){
        return []
    }
};