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

