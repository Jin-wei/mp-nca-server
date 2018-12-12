SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;


/*
  your backup sql
*/

/* qm */
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(50 , '研发项目新增审核任务' , '研发项目新增请求', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(51 , '研发构建预算审核任务' , '研发新增构建预算', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(52 , '研发材料申购审核任务' , '研发新增材料申购', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(54 , '研发人工结算审核任务' , '研发新增人工结算', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(55 , '研发材料耗用审核任务' , '研发新增材料耗用', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(56 , '研发构建费用审核任务' , '研发新增构建费用', now(), now());
insert into tbl_erc_taskallot(taskallot_id , taskallot_name , taskallot_describe, created_at, updated_at)
    	values(57 , '研发提交验收审核任务' , '研发新增提交验收', now(), now());

INSERT INTO `seqmysql` VALUES ('developIDSeq', '0', '1', '99999999');
/*end qm */

