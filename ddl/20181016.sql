SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;


/*
  your backup sql
*/

/* njc */
DROP TABLE IF EXISTS `tbl_erc_alldemand`;
CREATE TABLE `tbl_erc_alldemand` (
  `alldemand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `materiel_id` varchar(30) DEFAULT NULL,
  `order_id` varchar(30) DEFAULT NULL,
  `demand_amount` int(11) DEFAULT NULL,
  `mrp_date` date DEFAULT NULL,
  `mrp_domain_id` varchar(30) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`alldemand_id`)
);

DROP TABLE IF EXISTS `tbl_erc_materiel`;
CREATE TABLE `tbl_erc_materiel` (
  `materiel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) DEFAULT NULL,
  `materiel_code` varchar(20) NOT NULL,
  `materiel_name` varchar(100) DEFAULT NULL,
  `materiel_format` varchar(200) DEFAULT NULL,
  `materiel_formatcount` varchar(50) DEFAULT NULL,
  `materiel_formatunit` varchar(200) DEFAULT NULL,
  `materiel_unit` varchar(5) DEFAULT NULL,
  `materiel_type` varchar(20) DEFAULT NULL,
  `materiel_batch` varchar(20) DEFAULT NULL,
  `materiel_describe` varchar(200) DEFAULT NULL,
  `materiel_cost` double DEFAULT '0',
  `materiel_state` varchar(5) DEFAULT NULL,
  `materiel_source` varchar(12) DEFAULT NULL,
  `materiel_sale` double DEFAULT '0',
  `materiel_award_cost` double DEFAULT '0',
  `materiel_barcode` varchar(200) DEFAULT NULL,
  `materiel_manage` varchar(12) DEFAULT NULL,
  `materiel_source_kind` varchar(12) DEFAULT NULL,
  `materiel_tax` double DEFAULT '0',
  `materiel_procedure` varchar(12) DEFAULT NULL,
  `materiel_amto` int(11) DEFAULT NULL,
  `materiel_loss` double DEFAULT '0',
  `materiel_review_state` varchar(5) DEFAULT NULL,
  `materiel_formula` varchar(50) DEFAULT NULL,
  `materiel_x` int(11) DEFAULT '0',
  `materiel_y` int(11) DEFAULT '0',
  `materiel_z` int(11) DEFAULT '0',
  `materiel_conversion` varchar(5) DEFAULT NULL,
  `materiel_intpart` varchar(5) DEFAULT NULL,
  `materiel_state_management` varchar(4) DEFAULT NULL,
  `materiel_procurement_type` varchar(4) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`materiel_id`),
  UNIQUE KEY `materiel_code` (`materiel_code`)
);

DROP TABLE IF EXISTS `tbl_erc_netdemand`;
CREATE TABLE `tbl_erc_netdemand` (
  `netdemand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `materiel_id` varchar(30) DEFAULT NULL,
  `order_id` varchar(30) DEFAULT NULL,
  `netdemand_amount` int(11) DEFAULT NULL,
  `mrp_date` date DEFAULT NULL,
  `mrp_domain_id` varchar(30) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`netdemand_id`)
);

DROP TABLE IF EXISTS `tbl_erc_order`;
CREATE TABLE `tbl_erc_order` (
  `order_id` varchar(30) NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `order_title` varchar(100) DEFAULT NULL,
  `order_type` varchar(4) NOT NULL DEFAULT '',
  `order_address` varchar(300) DEFAULT NULL,
  `roomtype_id` bigint(20) DEFAULT NULL,
  `order_house_area` double NOT NULL DEFAULT '0',
  `order_operator` varchar(30) DEFAULT NULL,
  `order_state` varchar(100) DEFAULT NULL,
  `sales_id` varchar(30) DEFAULT NULL,
  `designer_id` varchar(30) DEFAULT NULL,
  `order_supervision` varchar(30) DEFAULT NULL,
  `order_foreman` varchar(30) DEFAULT NULL,
  `order_remark` varchar(1000) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `order_deposit` double NOT NULL DEFAULT '0',
  `earnest` double NOT NULL DEFAULT '0',
  `pre_offer` double NOT NULL DEFAULT '0',
  `final_offer` double NOT NULL DEFAULT '0',
  `order_check_state` varchar(4) DEFAULT NULL,
  `weekend_flag` varchar(4) NOT NULL DEFAULT '',
  `break_date` datetime DEFAULT NULL,
  `actual_start_date` datetime DEFAULT NULL,
  `complete_date` datetime DEFAULT NULL,
  `pay_kind` varchar(4) DEFAULT NULL,
  `contract_remark` varchar(1000) DEFAULT NULL,
  `contract_no` varchar(30) DEFAULT NULL,
  `contract_operator` varchar(30) DEFAULT NULL,
  `contract_date` datetime DEFAULT NULL,
  `estate_id` bigint(20) DEFAULT NULL,
  `estate_room_id` bigint(20) DEFAULT NULL,
  `materiel_remark` varchar(1000) DEFAULT NULL,
  `recommender_phone` varchar(20) NOT NULL DEFAULT '',
  `progress_payment` double NOT NULL DEFAULT '0',
  `final_payment` double NOT NULL DEFAULT '0',
  `interest_rate` double DEFAULT NULL,
  `award_cost` double DEFAULT NULL,
  `other_cost` double DEFAULT NULL,
  `purchase_order_id` varchar(30) DEFAULT NULL,
  `purchase_domain_id` bigint(20) DEFAULT NULL,
  `produce_id` bigint(20) DEFAULT NULL,
  `order_sales_id` varchar(30) DEFAULT NULL,
  `purchase_contact` varchar(30) DEFAULT NULL,
  `purchase_phone` varchar(30) DEFAULT NULL,
  `project_type` varchar(4) DEFAULT NULL,
  `processcreate_state` int(11) NOT NULL DEFAULT '0',
  `purchaser_type` int(11) NOT NULL DEFAULT '0',
  `purchaser_user_id` varchar(30) DEFAULT NULL,
  `sales_data_source` varchar(30) DEFAULT NULL,
  `sap_order_state` int(11) DEFAULT NULL,
  `purchaser_corporateclients_id` bigint(20) DEFAULT NULL,
  `send_creditline_state` int(11) NOT NULL DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
);

DROP TABLE IF EXISTS `tbl_erc_ordermateriel`;
CREATE TABLE `tbl_erc_ordermateriel` (
  `ordermateriel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` varchar(30) DEFAULT NULL,
  `order_id` varchar(30) NOT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `materiel_id` bigint(20) NOT NULL,
  `materiel_amount` int(11) DEFAULT '0',
  `materiel_batch` varchar(20) DEFAULT NULL,
  `purchase_state` varchar(4) DEFAULT NULL,
  `purchase_id` varchar(30) DEFAULT NULL,
  `change_flag` varchar(4) NOT NULL DEFAULT '0',
  `change_type` varchar(4) DEFAULT NULL,
  `change_price` double DEFAULT NULL,
  `change_state` varchar(4) DEFAULT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `ordermateriel_cost` int(11) DEFAULT NULL,
  `ordermateriel_remark` varchar(200) DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `kjl_type` varchar(20) DEFAULT NULL,
  `kjl_imageurl` varchar(200) DEFAULT NULL,
  `kjl_name` varchar(50) DEFAULT NULL,
  `kjl_brand` varchar(50) DEFAULT NULL,
  `kjl_specification` varchar(100) DEFAULT NULL,
  `kjl_unit` varchar(10) DEFAULT NULL,
  `kjl_number` double DEFAULT NULL,
  `kjl_unitprice` double DEFAULT NULL,
  `kjl_realprice` double DEFAULT NULL,
  `kjl_group` varchar(10) DEFAULT NULL,
  `sap_order_state` int(11) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`ordermateriel_id`)
);

DROP TABLE IF EXISTS `tbl_erc_orderworkflow`;
CREATE TABLE `tbl_erc_orderworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(30) NOT NULL,
  `orderworkflow_state` varchar(100) NOT NULL DEFAULT '',
  `orderworkflow_desc` varchar(200) NOT NULL DEFAULT '',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `tbl_erc_productivetask`;
CREATE TABLE `tbl_erc_productivetask` (
  `productivetask_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productivetask_code` varchar(50) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `materiel_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `product_level` bigint(20) DEFAULT NULL,
  `taskdesign_number` bigint(20) DEFAULT '0',
  `stock_in_number` bigint(20) DEFAULT '0',
  `stock_in_state` varchar(4) DEFAULT '1',
  `stock_out_number` bigint(20) DEFAULT '0',
  `stock_out_state` varchar(4) DEFAULT '1',
  `order_id` varchar(400) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`productivetask_id`)
);

DROP TABLE IF EXISTS `tbl_erc_productivetaskdetail`;
CREATE TABLE `tbl_erc_productivetaskdetail` (
  `productivetaskdetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productivetask_id` bigint(20) DEFAULT NULL,
  `materiel_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `taskdetaildesign_number` bigint(20) DEFAULT '0',
  `taskdetailprd_level` bigint(20) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`productivetaskdetail_id`)
);

DROP TABLE IF EXISTS `tbl_erc_productivetaskrelated`;
CREATE TABLE `tbl_erc_productivetaskrelated` (
  `productivetaskrelated_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productivetask_id` bigint(20) DEFAULT NULL,
  `materiel_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `taskrelateddesign_number` bigint(20) DEFAULT '0',
  `related_stock_in_number` bigint(20) DEFAULT '0',
  `related_stock_out_number` bigint(20) DEFAULT '0',
  `taskrelated_type` bigint(20) DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`productivetaskrelated_id`)
);

DROP TABLE IF EXISTS `tbl_erc_productplan`;
CREATE TABLE `tbl_erc_productplan` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `materiel_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `design_number` bigint(20) DEFAULT '0',
  `order_id` varchar(30) DEFAULT NULL,
  `workshop_id` varchar(30) DEFAULT NULL,
  `valid_state` bigint(20) NOT NULL DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
);

DROP TABLE IF EXISTS `tbl_erc_productplandetail`;
CREATE TABLE `tbl_erc_productplandetail` (
  `product_dtl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_plan_id` bigint(20) NOT NULL,
  `materiel_id` bigint(20) DEFAULT NULL,
  `src_materiel_id` bigint(20) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `prd_level` bigint(20) DEFAULT NULL,
  `design_number` bigint(20) DEFAULT '0',
  `loss_rate` bigint(20) DEFAULT '0',
  `workshop_id` varchar(30) DEFAULT NULL,
  `level_materiel_id` bigint(20) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`product_dtl_id`)
);

DROP TABLE IF EXISTS `tbl_erc_productplanrelated`;
CREATE TABLE `tbl_erc_productplanrelated` (
  `product_rlt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_plan_id` bigint(20) NOT NULL,
  `materiel_id` bigint(20) DEFAULT NULL,
  `src_materiel_id` bigint(20) DEFAULT NULL,
  `rlt_materiel_code` varchar(30) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `prd_type` bigint(20) DEFAULT NULL,
  `prd_number` bigint(20) DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`product_rlt_id`)
);

DROP TABLE IF EXISTS `tbl_erc_projectdetail`;
CREATE TABLE `tbl_erc_projectdetail` (
  `project_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(30) NOT NULL,
  `estate_id` bigint(30) DEFAULT NULL,
  `roomtype_id` bigint(30) DEFAULT NULL,
  `roomtype_name` varchar(50) DEFAULT NULL,
  `space_id` bigint(30) DEFAULT NULL,
  `space_name` varchar(50) DEFAULT NULL,
  `space_budget_amount` bigint(30) DEFAULT NULL,
  `space_final_amount` bigint(30) DEFAULT NULL,
  `space_count` bigint(20) DEFAULT NULL,
  `space_total_amount` bigint(30) DEFAULT NULL,
  `space_final_total_amount` bigint(30) DEFAULT NULL,
  `space_state` int(11) DEFAULT NULL,
  `space_examine` varchar(100) DEFAULT NULL,
  `space_examine_time` datetime DEFAULT NULL,
  `space_refuse_remark` varchar(300) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`project_detail_id`)
);

DROP TABLE IF EXISTS `tbl_erc_projectspacedetail`;
CREATE TABLE `tbl_erc_projectspacedetail` (
  `project_space_id` varchar(30) NOT NULL,
  `project_id` varchar(30) NOT NULL,
  `project_detail_id` bigint(20) NOT NULL,
  `project_space_position` varchar(50) DEFAULT NULL,
  `project_space_name` varchar(50) DEFAULT NULL,
  `worker_id` bigint(20) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `actual_count` int(10) DEFAULT NULL,
  `project_space_unit` varchar(20) DEFAULT NULL,
  `worker_budget` bigint(30) DEFAULT NULL,
  `worker_final_price` bigint(30) DEFAULT NULL,
  `material_budget` bigint(30) DEFAULT NULL,
  `worker_total_budget` bigint(30) DEFAULT NULL,
  `worker_total_final_price` bigint(30) DEFAULT NULL,
  `material_total_budget` bigint(30) DEFAULT NULL,
  `material_total_final_price` bigint(30) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`project_space_id`)
);

DROP TABLE IF EXISTS `tbl_erc_purchaseapply`;
CREATE TABLE `tbl_erc_purchaseapply` (
  `purchaseapply_id` varchar(30) NOT NULL,
  `app_domain_id` bigint(20) DEFAULT NULL,
  `apply_state` bigint(20) DEFAULT NULL,
  `apply_applicant` varchar(30) DEFAULT NULL,
  `apply_approver` varchar(30) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `order_type` bigint(20) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`purchaseapply_id`)
);

DROP TABLE IF EXISTS `tbl_erc_purchaseapplydetail`;
CREATE TABLE `tbl_erc_purchaseapplydetail` (
  `purchaseapplydetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchaseapply_id` varchar(30) DEFAULT NULL,
  `order_id` varchar(30) DEFAULT NULL,
  `materiel_id` bigint(20) NOT NULL,
  `apply_number` int(11) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `apply_money` int(11) DEFAULT NULL,
  `project_space_id` varchar(30) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`purchaseapplydetail_id`)
);

DROP TABLE IF EXISTS `tbl_erc_purchasedetail`;
CREATE TABLE `tbl_erc_purchasedetail` (
  `purchasedetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(30) DEFAULT NULL,
  `materiel_id` bigint(20) NOT NULL,
  `purchase_number` int(11) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `order_ids` varchar(200) DEFAULT NULL,
  `qualified_number` int(11) DEFAULT '0',
  `collect_number` int(11) DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`purchasedetail_id`)
);

DROP TABLE IF EXISTS `tbl_erc_purchaseorder`;
CREATE TABLE `tbl_erc_purchaseorder` (
  `purchaseorder_id` varchar(30) NOT NULL,
  `purchaseorder_domain_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(30) DEFAULT NULL,
  `order_domain_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `purchaseorder_state` varchar(30) DEFAULT NULL,
  `purchase_applicant` varchar(30) DEFAULT NULL,
  `purchase_approver` varchar(30) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `check_state` varchar(4) DEFAULT '0',
  `collect_state` varchar(4) DEFAULT '0',
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`purchaseorder_id`)
);

DROP TABLE IF EXISTS `tbl_erc_stockmap`;
CREATE TABLE `tbl_erc_stockmap` (
  `stockmap_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `materiel_id` bigint(20) NOT NULL,
  `current_amount` int(11) DEFAULT '0',
  `available_amount` int(11) DEFAULT '0',
  `frozen_amount` int(11) DEFAULT '0',
  `safe_amount` int(11) DEFAULT '0',
  `order_id` varchar(30) DEFAULT NULL,
  `is_idle_stock` varchar(4) DEFAULT '0',
  `warehouse_zone_id` bigint(20) DEFAULT NULL,
  `min_purchase_amount` int(11) DEFAULT '0',
  `trigger_safe_model` varchar(4) DEFAULT NULL,
  `trigger_idle_scan` varchar(4) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`stockmap_id`)
);

DROP TABLE IF EXISTS `tbl_erc_thirdsignuser`;
CREATE TABLE `tbl_erc_thirdsignuser` (
  `thirdsignuser_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `third_sign_type` bigint(20) NOT NULL,
  `summary` varchar(100) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`thirdsignuser_id`)
);


/*end njc */

/* ty */

DROP TABLE IF EXISTS `tbl_erc_humanresource`;
CREATE TABLE `tbl_erc_humanresource` (
  `hr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_id`  varchar(30),
  `position_id`  varchar(30),
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `domain_id` bigint(20) NOT NULL,
  `hr_state` varchar(4) DEFAULT '0',
  `hr_checker_id` varchar(30) DEFAULT NULL,
  `hr_check_date` datetime DEFAULT NULL,
  `hr_remark` varchar(300) DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`hr_id`)
);

DROP TABLE IF EXISTS `tbl_erc_department`;
CREATE TABLE `tbl_erc_department` (
    `department_id` varchar(30) NOT NULL,
    `domain_id` bigint(20) NOT NULL,
    `department_name` varchar(50),
    `p_department_id` varchar(30),
    `department_level` varchar(4),
    `department_plan_num` int DEFAULT 0,
    `department_state` varchar(8),
    `state` varchar(5) DEFAULT '1',
    `version` bigint(20) NOT NULL DEFAULT '0',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`department_id`)
);

DROP TABLE IF EXISTS `tbl_erc_position`;
CREATE TABLE `tbl_erc_position` (
    `position_id` varchar(30) NOT NULL,
    `usergroup_id` bigint(20) NOT NULL,
    `domain_id` bigint(20) NOT NULL,
    `department_id` varchar(30) NOT NULL,
    `position_name` varchar(50),
    `p_position_id` varchar(30),
    `department_plan_num` int DEFAULT 0,
    `base_salary` int DEFAULT 0,
    `capacity_salary` int DEFAULT 0,
    `performance_salary` int DEFAULT 0,
    `actual_salary` int DEFAULT 0,
    `department_actual_num` int DEFAULT 0,
    `state` varchar(5) DEFAULT '1',
    `version` bigint(20) NOT NULL DEFAULT '0',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`position_id`)
);

DROP TABLE IF EXISTS `tbl_erc_custorgstructure`;
CREATE TABLE `tbl_erc_custorgstructure` (
    `custorgstructure_id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` varchar(30) NOT NULL,
    `department_id` varchar(30) NOT NULL,
    `position_id` varchar(30) NOT NULL,
    `state` varchar(5) DEFAULT '1',
    `version` bigint(20) NOT NULL DEFAULT '0',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`custorgstructure_id`)
);

DROP TABLE IF EXISTS `tbl_erc_vehicle`;
CREATE TABLE `tbl_erc_vehicle` (
  `vehicle_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NOT NULL,
  `license_plate_num` varchar(10),
  `vehicle_brand` varchar(100),
  `vehicle_type` varchar(10),
  `vehicle_status` varchar(4) DEFAULT 0,
  `vehicle_status_flag` varchar(30) DEFAULT 0,
  `admin_user_id` varchar(30),
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`vehicle_id`)
);

 DROP TABLE IF EXISTS `tbl_erc_transreceptionapply`;
CREATE TABLE tbl_erc_transreceptionapply
(
  trapply_id                     BIGINT AUTO_INCREMENT PRIMARY KEY,
  trapply_code                   VARCHAR(100)        NULL,
  trapply_creator_id             VARCHAR(100)        NULL,
  trapply_creator_name           VARCHAR(100)        NULL,
  trapply_confirm_id           VARCHAR(100)          NULL,
  trapply_rejected_description   VARCHAR(100)        NULL,
  trapply_confirm_time           DATETIME            NULL,
  trapply_state                  VARCHAR(10)         NULL,
  trapply_start_time             DATETIME            NULL,
  trapply_end_time               DATETIME            NULL,
  trapply_pre_fee                VARCHAR(1000)       NULL,
  trapply_trip_reason            VARCHAR(100)        NULL,
  trapply_trip_reason_type       VARCHAR(10)         NULL,
  trapply_trip_origin_prov       VARCHAR(100)        NULL,
  trapply_trip_origin_city       VARCHAR(100)        NULL,
  trapply_trip_origin_dist       VARCHAR(100)        NULL,
  trapply_trip_origin_detail     VARCHAR(1000)       NULL,
  trapply_trip_termini_prov      VARCHAR(100)        NULL,
  trapply_trip_termini_city      VARCHAR(100)        NULL,
  trapply_trip_termini_dist      VARCHAR(100)        NULL,
  trapply_trip_termini_detail    VARCHAR(1000)       NULL,
  trapply_trans_way              VARCHAR(10)         NULL,
  trapply_vehicle_apply          VARCHAR(10)         NULL,
  trapply_vehicle_review_type    VARCHAR(10)         NULL,
  trapply_vehicle_distance       VARCHAR(1000)       NULL,
  trapply_vehicle_remark         VARCHAR(1000)       NULL,
  trapply_traffic_tools        VARCHAR(10)         NULL,
  trapply_reception_reason       VARCHAR(100)        NULL,
  trapply_reception_reason_type  VARCHAR(10)         NULL,
  trapply_reception_object       VARCHAR(100)        NULL,
  trapply_reception_room_num     VARCHAR(10)         NULL,
  trapply_reception_review_type  VARCHAR(10)         NULL,
  trapply_reception_review_level VARCHAR(10)         NULL,
  trapply_reception_crew_num     VARCHAR(10)         NULL,
  trapply_reception_extra        VARCHAR(100)        NULL,
  trapply_reception_extra_fee    VARCHAR(1000)       NULL,
  trapply_recetion_crew_ids      VARCHAR(1000)       NULL,
  trapply_recetion_crew_names    VARCHAR(2000)       NULL,
  trapply_traffic_fee          VARCHAR(1000)       DEFAULT NULL,
  domain_id                      INT                    NULL,
  state                          VARCHAR(5) DEFAULT '1' NULL,
  version                        BIGINT DEFAULT '0'     NOT NULL,
  created_at                     DATETIME               NOT NULL,
  updated_at                     DATETIME               NOT NULL
)
  ENGINE = InnoDB;

  DROP TABLE IF EXISTS `tbl_erc_trafficreceptionexpense`;
     CREATE TABLE `tbl_erc_trafficreceptionexpense` (
       `tr_expense_id` bigint(20) NOT NULL AUTO_INCREMENT,
       `domain_id` bigint(20) DEFAULT NULL,
       `tr_expense_code` varchar(100) DEFAULT NULL,
       `tr_expense_creator_id` varchar(100) DEFAULT NULL,
       `tr_expense_creator_name` varchar(100) DEFAULT NULL,
       `tr_expense_confirm_time` datetime DEFAULT NULL,
       `tr_expense_confirm_id` varchar(100) DEFAULT NULL,
       `tr_expense_rejected_description` varchar(100) DEFAULT NULL,
       `tr_expense_state` varchar(10) DEFAULT NULL,
       `tr_expense_start_time` datetime DEFAULT NULL,
       `tr_expense_end_time` datetime DEFAULT NULL,
       `tr_expense_pre_fee` double DEFAULT '0',
       `state` varchar(5) DEFAULT '1',
       `version` bigint(20) NOT NULL DEFAULT '0',
       `created_at` datetime NOT NULL,
       `updated_at` datetime NOT NULL,
       PRIMARY KEY (`tr_expense_id`)
     );

 DROP TABLE IF EXISTS `tbl_erc_trafficreceptionexpensedetail`;
 CREATE TABLE `tbl_erc_trafficreceptionexpensedetail` (
   `tr_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
   `domain_id` bigint(20) DEFAULT NULL,
   `tr_expense_list_code` varchar(100) DEFAULT NULL,
   `tr_detail_fee_id` varchar(100) DEFAULT '0',
   `tr_detail_expected_fee` double DEFAULT '0',
   `tr_detail_no_invoice_fee` double DEFAULT '0',
   `tr_detail_have_invoice_fee` double DEFAULT '0',
   `state` varchar(5) DEFAULT '1',
   `version` bigint(20) NOT NULL DEFAULT '0',
   `created_at` datetime NOT NULL,
   `updated_at` datetime NOT NULL,
   PRIMARY KEY (`tr_detail_id`)
 );

 DROP TABLE IF EXISTS `tbl_erc_docdetail`;
    CREATE TABLE `tbl_erc_docdetail` (
      `docdetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30) NOT NULL,
      `clause_no` varchar(30),
      `clause_title` varchar(2500),
      `user_ids` varchar(500),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docdetail_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_docdetailquestion`;
    CREATE TABLE `tbl_erc_docdetailquestion` (
      `docdetailquestion_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30) NOT NULL,
      `docdetail_id` bigint(20) NOT NULL,
      `question_title` varchar(100),
      `question_a` varchar(100),
      `question_b` varchar(100),
      `question_c` varchar(100),
      `question_d` varchar(100),
      `question_answer` varchar(4),
      `submit_question_answer` varchar(4),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docdetailquestion_id`)
    );
DROP TABLE IF EXISTS `tbl_erc_docdetailsubmitquestion`;
    CREATE TABLE `tbl_erc_docdetailsubmitquestion` (
      `docdetailsubmitquestion_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30) NOT NULL,
      `docdetail_id` bigint(20) DEFAULT NULL,
      `user_id` varchar(30) NOT NULL,
      `docdetailquestion_id` varchar(30) NOT NULL,
      `submit_question_answer` varchar(4),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docdetailsubmitquestion_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_docdetailuser`;
    CREATE TABLE `tbl_erc_docdetailuser` (
      `docdetailuser_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `docdetail_id` bigint(20) NOT NULL,
      `document_id` varchar(300),
      `user_id` varchar(30) NOT NULL,
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docdetailuser_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_document`;
   CREATE TABLE `tbl_erc_document` (
     `document_id` varchar(30) NOT NULL,
     `domain_id` bigint(20) NOT NULL,
     `user_id` varchar(30) NOT NULL,
     `document_type` varchar(4),
     `document_title` varchar(100),
     `document_unit` varchar(100),
     `document_date` datetime,
     `document_state` varchar(4) DEFAULT '0',
     `document_checker_id` varchar(30) NUll,
     `document_check_date` datetime NUll,
     `document_refuse_remark` varchar(300) NUll,
     `state` varchar(5) DEFAULT '1',
     `version` bigint(20) NOT NULL DEFAULT '0',
     `created_at` datetime NOT NULL,
     `updated_at` datetime NOT NULL,
     PRIMARY KEY (`document_id`)
   );

DROP TABLE IF EXISTS `tbl_erc_docuser`;
    CREATE TABLE `tbl_erc_docuser` (
      `docuser_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30),
      `docdetail_id` bigint(20),
      `user_id` varchar(30),
      `usergroup_id` bigint(20),
      `read_state` varchar(4) DEFAULT '0',
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docuser_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_docusergroup`;
    CREATE TABLE `tbl_erc_docusergroup` (
      `docusergroup_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30),
      `docdetail_id` bigint(20),
      `p_usergroup_id` bigint(20),
      `usergroup_id` bigint(20),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docusergroup_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_docuserstate`;
    CREATE TABLE `tbl_erc_docuserstate` (
      `docuserstate_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `document_id` varchar(30),
      `user_id` varchar(30),
      `read_state` varchar(4) DEFAULT '0',
      `usergroup_id` bigint(20),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`docuserstate_id`)
    );


DROP TABLE IF EXISTS `tbl_erc_task`;
CREATE TABLE `tbl_erc_task` (
  `task_id` varchar(30) NOT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `task_name` varchar(130) DEFAULT NULL,
  `task_type` varchar(4) DEFAULT NULL,
  `task_priority` varchar(4) DEFAULT NULL,
  `task_publisher` varchar(30) DEFAULT NULL,
  `task_performer` varchar(30) DEFAULT NULL,
  `task_state` varchar(4) DEFAULT NULL,
  `task_complete_date` datetime DEFAULT NULL,
  `task_review_code` varchar(30) DEFAULT NULL,
  `task_description` varchar(300) DEFAULT NULL,
  `review_id` varchar(30) DEFAULT NULL,
  `task_remark` varchar(300) DEFAULT NULL,
  `task_group` varchar(30),
  `taskallotuser_level` int(11) DEFAULT 0,
  `customtaskallot_id` bigint(20),
  `end_time` datetime,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`task_id`)
);

DROP TABLE IF EXISTS `tbl_erc_paymentconfirm`;
CREATE TABLE `tbl_erc_paymentconfirm` (
  `paymentconfirm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) DEFAULT NULL,
  `paymentconfirm_name` varchar(100) DEFAULT NULL,
  `paymentconfirm_source_code` varchar(100) DEFAULT NULL,
  `paymentconfirm_money` double DEFAULT '0',
  `paymentconfirm_expend_user` varchar(50) DEFAULT NULL,
  `paymentconfirm_declarant` varchar(50) DEFAULT NULL,
  `paymentconfirm_declarant_time` datetime DEFAULT NULL,
  `paymentconfirm_state` int(11) DEFAULT NULL,
  `paymentconfirm_examine` varchar(100) DEFAULT NULL,
  `paymentconfirm_examine_time` datetime DEFAULT NULL,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`paymentconfirm_id`)
);

DROP TABLE IF EXISTS `tbl_erc_askforleave`;
    CREATE TABLE `tbl_erc_askforleave` (
      `askforleave_id` varchar(30) NOT NULL,
      `domain_id` bigint(20) NOT NULL,
      `askforuser_id` varchar(30) NOT NULL,
      `start_time` datetime,
      `end_time` datetime,
      `askforleave_reason` varchar(4),
      `askforleave_days` double,
      `askforleave_remark` varchar(1024),
      `askforleave_state` varchar(4) DEFAULT '0',
      `check_time` datetime,
      `askforleave_checker_id` varchar(30) NUll,
      `askforleave_refuse_remark` varchar(300) NUll,
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`askforleave_id`)
    );

DROP TABLE IF EXISTS `tbl_erc_specialexpense`;
CREATE TABLE `tbl_erc_specialexpense` (
  `s_expense_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) DEFAULT NULL,
  `s_expense_code` varchar(100) DEFAULT NULL,
  `s_expense_creator_id` varchar(100) DEFAULT NULL,
  `s_expense_creator_name` varchar(100) DEFAULT NULL,
  `s_expense_confirm_time` datetime DEFAULT NULL,
  `s_expense_confirm_id` varchar(100) DEFAULT NULL,
  `s_expense_rejected_description` varchar(100) DEFAULT NULL,
  `s_expense_state` varchar(10) DEFAULT NULL,
  `s_expense_type_id` varchar(10) DEFAULT NULL,
  `s_sum_fee` double DEFAULT '0',
  `s_no_invoice_fee` double DEFAULT '0',
  `s_have_invoice_fee` double DEFAULT '0',
  `s_expense_description` varchar(1000) DEFAULT NULL,
  `s_capital_cost_type` INTEGER,
  `state` varchar(5) DEFAULT '1',
  `version` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`s_expense_id`)
);

DROP TABLE IF EXISTS `tbl_erc_reimburserank`;
CREATE TABLE tbl_erc_reimburserank
(
  reimburserank_id   BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  reimburserank_name  VARCHAR(100) DEFAULT  NULL,
  reimburserank_reception_putup_level VARCHAR(10) DEFAULT NULL,
  reimburserank_trip_putup_level VARCHAR(10) DEFAULT NULL,
  reimburserank_downtown_traffic_level VARCHAR(10) DEFAULT NULL,
  reimburserank_meal_level VARCHAR(10) DEFAULT NULL,
  reimburserank_reception_level VARCHAR(10) DEFAULT NULL,
  reimburserank_gas_level VARCHAR(10) DEFAULT NULL,
  reimburserank_traffic_available VARCHAR(10) DEFAULT NULL,
  reimburserank_traffic_tools VARCHAR(10) DEFAULT NULL,
  domain_id         INT                    NULL,
  state          VARCHAR(5) DEFAULT '1'  NULL,
  version        BIGINT DEFAULT '0'      NOT NULL,
  created_at     DATETIME                NOT NULL,
  updated_at     DATETIME                NOT NULL
);

DROP TABLE IF EXISTS `tbl_erc_meeting`;
    CREATE TABLE `tbl_erc_meeting` (
      `meeting_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `domain_id` bigint(20) NOT NULL,
      `user_id` varchar(30) NOT NULL,
      `meeting_name` varchar(100),
      `start_time` datetime,
      `end_time` datetime,
      `meetingroom_id` varchar(30),
      `meetinguser_id` varchar(30),
      `host_id` varchar(30),
      `meetingroom_state` varchar(4) DEFAULT '0',
      `host_state` varchar(4) DEFAULT '0',
      `meetingequipment_state` varchar(4) DEFAULT '0',
      `meeting_state` varchar(4) DEFAULT '0',
      `meeting_remark` varchar(1024),
      `meeting_remark_state` varchar(4) DEFAULT '0',
      `meeting_remark_user` varchar(30),
      `meeting_decision` varchar(1024),
      `meeting_decision_user` varchar(30),
      `equipmentuser_id` varchar(30) NUll,
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`meeting_id`)
    );

  DROP TABLE IF EXISTS `tbl_erc_meetingattendee`;
     CREATE TABLE `tbl_erc_meetingattendee` (
       `meetingattendee_id` bigint(20) NOT NULL AUTO_INCREMENT,
       `meeting_id` bigint(20) NOT NULL,
       `attendee_id` varchar(30),
       `meetingattendee_state` varchar(4) DEFAULT '0',
       `state` varchar(5) DEFAULT '1',
       `version` bigint(20) NOT NULL DEFAULT '0',
       `created_at` datetime NOT NULL,
       `updated_at` datetime NOT NULL,
       PRIMARY KEY (`meetingattendee_id`)
     );

 DROP TABLE IF EXISTS `tbl_erc_meetingequipment`;
     CREATE TABLE `tbl_erc_meetingequipment` (
       `meetingequipment_id` bigint(20) NOT NULL AUTO_INCREMENT,
       `meeting_id` bigint(20) NOT NULL,
       `meetingroomequipment_id` bigint(20),
       `equipment_num` int(11) DEFAULT 0,
       `state` varchar(5) DEFAULT '1',
       `version` bigint(20) NOT NULL DEFAULT '0',
       `created_at` datetime NOT NULL,
       `updated_at` datetime NOT NULL,
       PRIMARY KEY (`meetingequipment_id`)
     );

 DROP TABLE IF EXISTS `tbl_erc_meetingfollow`;
     CREATE TABLE `tbl_erc_meetingfollow` (
       `meetingfollow_id` bigint(20) NOT NULL AUTO_INCREMENT,
       `meeting_id` bigint(20) NOT NULL,
       `follow_remark` varchar(100),
       `executor_id` varchar(30),
       `checker_id` varchar(30),
       `finish_date` datetime,
       `state` varchar(5) DEFAULT '1',
       `version` bigint(20) NOT NULL DEFAULT '0',
       `created_at` datetime NOT NULL,
       `updated_at` datetime NOT NULL,
       PRIMARY KEY (`meetingfollow_id`)
     );

DROP TABLE IF EXISTS `tbl_erc_meetingroom`;
    CREATE TABLE `tbl_erc_meetingroom` (
      `meetingroom_id` varchar(30) NOT NULL,
      `domain_id` bigint(20) NOT NULL,
      `meetingroom_name` varchar(100),
      `meetinguser_id` varchar(30),
      `equipmentuser_id` varchar(30),
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`meetingroom_id`)
    );

 DROP TABLE IF EXISTS `tbl_erc_meetingroomequipment`;
    CREATE TABLE `tbl_erc_meetingroomequipment` (
      `meetingroomequipment_id` bigint(20) NOT NULL AUTO_INCREMENT,
      `meetingroom_id` varchar(30) NOT NULL,
      `equipment_name` varchar(100),
      `equipment_unit` varchar(10),
      `equipment_num` int(11) DEFAULT 0,
      `assets_id` varchar(30) DEFAULT NULL,
      `domain_id` bigint(20) NOT NULL,
      `state` varchar(5) DEFAULT '1',
      `version` bigint(20) NOT NULL DEFAULT '0',
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`meetingroomequipment_id`)
    );
/*end ty */

/* nie */
INSERT INTO `seqmysql` VALUES ('zoweeProcessIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('userIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('transExpenseApplyIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('transApplyIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('taskIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('subcribeOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('specialExpenseIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('salesOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('receiveIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('receiptIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('purchaseOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('purchaseApplyIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('proSubcribeOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('proReceiveIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('proPurOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('projectSpaceIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('projectIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('productPlanIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('productiveIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('productionProcedureIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('proConsumeIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('proCashierIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('positionIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('otherIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('orderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('meetingRoomIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('longAssetsScrapNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('idleApplyIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('getTakeStockNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('fixedAssetsRepairNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('fixedAssetsPurchNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('fixedAssetsNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('fixedAssetsCheckNoSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('documentIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('devSubcribeOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('devReceiveIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('devPurOrderIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('developIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('devConsumeIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('devCashierIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('departmentIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('corporateClientsIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('consumeIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('consumablessPurchaseIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('consumablesDetailIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('consumablesAcceptanceIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('checkInventoryIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('cashierIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('askForLeaveIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('applyIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('amortizedIDSeq', '0', '1', '99999999');
INSERT INTO `seqmysql` VALUES ('amoPurOrderIDSeq', '0', '1', '99999999');
/*end nie */