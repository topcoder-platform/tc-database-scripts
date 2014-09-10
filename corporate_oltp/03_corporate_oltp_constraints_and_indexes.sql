database corporate_oltp;


alter table 'informix'.tc_direct_project_status_lu add constraint primary key 
	(project_status_id)
	constraint pk_tc_direct_project_status_lu;


alter table "informix".command add constraint (foreign key (command_group_id) 
    references "informix".command_group_lu  constraint "informix"
    .command_command_group_fk);
alter table "informix".product_role_xref add constraint (foreign 
    key (product_id) references "informix".product  constraint 
    "informix".product_role_xref_product_fk);
alter table "informix".product_unit_xref add constraint (foreign 
    key (unit_id) references "informix".unit  constraint "informix"
    .unit_product_unit_xref_fk);
alter table "informix".product_unit_xref add constraint (foreign 
    key (product_id) references "informix".product  constraint 
    "informix".product_product_unit_xref_fk);
alter table "informix".purchase add constraint (foreign key (product_id) 
    references "informix".product  constraint "informix".purchase_product_fk);
    
alter table "informix".product_country_eligibility add constraint 
    (foreign key (product_id) references "informix".product  constraint 
    "informix".prodid_pk);
alter table "informix".command_execution add constraint (foreign 
    key (command_id) references "informix".command  constraint 
    "informix".commandexecution_command_fk);
alter table "informix".user_permission_grant add constraint (foreign 
    key (permission_type_id) references "informix".permission_type 
     constraint "informix".fk_user_permission_grant1);

alter table 'informix'.tc_direct_project add constraint foreign key 
	(project_status_id)
	references 'informix'.tc_direct_project_status_lu
	(project_status_id) 
	constraint fk_directproject_projectstatuslu_projectstatusid;


	ALTER TABLE 'informix'.tc_direct_project ADD CONSTRAINT FOREIGN KEY
    (direct_project_type_id)
    REFERENCES 'informix'.direct_project_type
    (direct_project_type_id)
    CONSTRAINT fk_tcdirectproject_directprojecttype_directprojecttypeid;
    
ALTER TABLE 'informix'.tc_direct_project ADD CONSTRAINT FOREIGN KEY
    (direct_project_category_id)
    REFERENCES 'informix'.direct_project_category
    (direct_project_category_id)
    CONSTRAINT fk_tcdirectproject_directprojectcategory_directprojectcategoryid;

ALTER TABLE 'informix'.direct_project_category ADD CONSTRAINT FOREIGN KEY
    (direct_project_type_id)
    REFERENCES 'informix'.direct_project_type
    (direct_project_type_id)
    CONSTRAINT fk_directprojectcategory_directprojecttype_directprojecttypeid;

ALTER TABLE 'informix'.direct_project_account ADD CONSTRAINT FOREIGN KEY
    (project_id)
    REFERENCES 'informix'.tc_direct_project
    (project_id)
    CONSTRAINT fk_directprojectaccount_tcdirectproject_projectid;

create unique index "informix".inputlu_inputcode_idx on "informix"
    .input_lu (input_code) using btree  in datadbs ;

CREATE INDEX 'informix'.userpermissiongrant_resource_idx ON 'informix'.user_permission_grant(resource_id);

CREATE INDEX 'informix'.userpermissiongrant_user_resource_idx ON 'informix'.user_permission_grant(user_id, resource_id);

alter table 'informix'.direct_project_account add constraint unique 
	(project_id, billing_account_id)
constraint u_project_id_billing_account_id;

ALTER TABLE 'informix'.project_question
	ADD CONSTRAINT PRIMARY KEY(question_id) CONSTRAINT project_question_pk;
	
ALTER TABLE 'informix'.project_question
	ADD CONSTRAINT FOREIGN KEY(direct_project_type_id) REFERENCES 'informix'.direct_project_type(direct_project_type_id) CONSTRAINT project_question_direct_project_type_fk; 

ALTER TABLE 'informix'.project_question_option
	ADD CONSTRAINT PRIMARY KEY(question_option_id) CONSTRAINT project_question_option_pk;
	
ALTER TABLE 'informix'.project_question_option
	ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES 'informix'.project_question(question_id) CONSTRAINT project_question_option_project_question_fk;

ALTER TABLE 'informix'.project_answer 
	ADD CONSTRAINT PRIMARY KEY(answer_id) CONSTRAINT project_answer_pk;
	
ALTER TABLE 'informix'.project_answer
	ADD CONSTRAINT FOREIGN KEY(tc_direct_project_id) REFERENCES 'informix'.tc_direct_project(project_id) CONSTRAINT project_answer_tcdirect_project_fk;
	
ALTER TABLE 'informix'.project_answer
	ADD CONSTRAINT FOREIGN KEY(question_id) REFERENCES 'informix'.project_question(question_id) CONSTRAINT project_answer_project_question_fk;  

ALTER TABLE 'informix'.project_multiple_answer
	ADD CONSTRAINT PRIMARY KEY(project_multiple_answer_id) CONSTRAINT project_multiple_answer_pk;
	
ALTER TABLE 'informix'.project_multiple_answer 
	ADD CONSTRAINT FOREIGN KEY(answer_id) REFERENCES 'informix'.project_answer(answer_id) CONSTRAINT project_multiple_answer_project_answer_fk;
	
ALTER TABLE 'informix'.project_answer_option
	ADD CONSTRAINT PRIMARY KEY(project_answer_option_id) CONSTRAINT project_answer_option_pk;
	
ALTER TABLE 'informix'.project_answer_option
	ADD CONSTRAINT FOREIGN KEY(answer_id) REFERENCES 'informix'.project_answer(answer_id) CONSTRAINT project_answer_option_project_answer_fk;
	
ALTER TABLE 'informix'.project_answer_option
	ADD CONSTRAINT FOREIGN KEY(question_option_id) REFERENCES 'informix'.project_question_option(question_option_id) CONSTRAINT project_answer_option_project_question_option_fk;

alter table 'informix'.tc_direct_project_audit add constraint primary key 
    (tc_direct_project_audit_id)
    constraint pk_tc_direct_project_audit;

alter table 'informix'.user_permission_grant_audit add constraint primary key 
    (user_permission_grant_audit_id)
    constraint pk_user_permission_grant_audit;

alter table 'informix'.audit_action_type_lu add constraint primary key 
    (audit_action_type_id)
    constraint audit_action_type_lu_pkey;

alter table 'informix'.tc_direct_project_audit add constraint foreign key 
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id) 
    constraint tc_direct_project_audit_audit_action_type_lu_fk;

alter table 'informix'.user_permission_grant_audit add constraint foreign key 
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id) 
    constraint user_permission_grant_audit_audit_action_type_lu_fk;

CREATE INDEX 'informix'.bac_id_ix ON direct_project_account 
    (
        billing_account_id
    ); 
	

