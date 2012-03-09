database time_oltp;

alter table 'informix'.id_sequences add constraint primary key 
	(name)
	constraint u100_1;

alter table 'informix'.principal add constraint primary key 
	(principal_id)
	constraint u101_6;

alter table 'informix'.role add constraint primary key 
	(role_id)
	constraint u102_8;

alter table 'informix'.principal_role add constraint primary key 
	(principal_id, role_id)
	constraint u103_10;

alter table 'informix'.action add constraint primary key 
	(action_id)
	constraint u104_13;

alter table 'informix'.action_context add constraint primary key 
	(action_context_id)
	constraint u105_16;

alter table 'informix'.role_action_context_permission add constraint primary key 
	(role_id, action_id, action_context_id)
	constraint u106_19;

alter table 'informix'.principal_action_context_permission add constraint primary key 
	(principal_id, action_id, action_context_id)
	constraint u107_24;

alter table 'informix'.state_name add constraint primary key 
	(state_name_id)
	constraint u109_36;

alter table 'informix'.address add constraint primary key 
	(address_id)
	constraint u111_52;

alter table 'informix'.company add constraint unique 
	(passcode)
	constraint u112_62;

alter table 'informix'.company add constraint primary key 
	(company_id)
	constraint u112_63;

alter table 'informix'.user_account add constraint primary key 
	(user_account_id)
	constraint u114_77;

alter table 'informix'.contact add constraint primary key 
	(contact_id)
	constraint u116_93;

alter table 'informix'.comp_rej_reason add constraint primary key 
	(company_id, reject_reason_id)
	constraint u119_117;

alter table 'informix'.reject_email add constraint primary key 
	(reject_email_id)
	constraint u120_124;

alter table 'informix'.exp_reject_reason add constraint primary key 
	(expense_entry_id, reject_reason_id)
	constraint u125_166;

alter table 'informix'.comp_exp_type add constraint primary key 
	(company_id, expense_type_id)
	constraint u126_173;

alter table 'informix'.project_expense add constraint primary key 
	(project_id, expense_entry_id)
	constraint u128_191;

alter table 'informix'.time_reject_reason add constraint primary key 
	(time_entry_id, reject_reason_id)
	constraint u132_225;

alter table 'informix'.comp_task_type add constraint primary key 
	(company_id, task_type_id)
	constraint u133_232;

alter table 'informix'.project_time add constraint primary key 
	(project_id, time_entry_id)
	constraint u134_239;

alter table 'informix'.project_manager add constraint primary key 
	(project_id, user_account_id)
	constraint u135_246;

alter table 'informix'.client add constraint unique 
	(name)
	constraint u137_263;

alter table 'informix'.client add constraint primary key 
	(client_id)
	constraint u137_264;

alter table 'informix'.client_project add constraint primary key 
	(client_id, project_id)
	constraint u138_272;

alter table 'informix'.audit_action add constraint primary key 
	(audit_action_id)
	constraint u139_279;

alter table 'informix'.project_worker add constraint primary key 
	(project_id, user_account_id)
	constraint u172_253;

alter table 'informix'.project add constraint primary key 
	(project_id)
	constraint u174_180;

alter table 'informix'.task_type add constraint primary key 
	(task_type_id)
	constraint u175_204;

alter table 'informix'.time_entry add constraint primary key 
	(time_entry_id)
	constraint u176_212;

alter table 'informix'.time_status add constraint primary key 
	(time_status_id)
	constraint u177_197;

alter table 'informix'.expense_entry add constraint primary key 
	(expense_entry_id)
	constraint u178_153;

alter table 'informix'.expense_status add constraint primary key 
	(expense_status_id)
	constraint u179_138;

alter table 'informix'.expense_type add constraint primary key 
	(expense_type_id)
	constraint u180_145;

alter table 'informix'.reject_reason add constraint primary key 
	(reject_reason_id)
	constraint u181_44;

alter table 'informix'.comp_rate add constraint primary key 
	(company_id, rate_id)
	constraint comp_rate_pk;

alter table 'informix'.user_contact_backup add constraint primary key 
	(user_account_id, contact_id)
	constraint pk_user_account_contact_backup;

alter table 'informix'.user_address_backup add constraint primary key 
	(user_account_id, address_id)
	constraint pk_user_account_address_backup;

alter table 'informix'.company_contact_backup add constraint primary key 
	(company_id, contact_id)
	constraint pk_company_contact_backup;

alter table 'informix'.company_address_backup add constraint primary key 
	(company_id, address_id)
	constraint pk_company_address_backup;

alter table 'informix'.job add constraint primary key 
	(jobid)
	constraint pk_job;

alter table 'informix'.message add constraint primary key 
	(messageid)
	constraint pk_message;

alter table 'informix'.group add constraint primary key 
	(groupid)
	constraint pk_group;

alter table 'informix'.groupjob add constraint primary key 
	(groupid, jobid)
	constraint pk_groupjob;

alter table 'informix'.country_name add constraint primary key 
	(country_name_id)
	constraint pk_country_name;

alter table 'informix'.address_type add constraint primary key 
	(address_type_id)
	constraint pk_address_type;

alter table 'informix'.address_relation add constraint primary key 
	(address_id, address_type_id, entity_id)
	constraint pk_address_relation;

alter table 'informix'.contact_type add constraint primary key 
	(contact_type_id)
	constraint pk_contact_type;

alter table 'informix'.contact_relation add constraint primary key 
	(contact_id, contact_type_id, entity_id)
	constraint pk_contact_relation;

alter table 'informix'.payment_terms add constraint primary key 
	(payment_terms_id)
	constraint pk_payment_terms;

alter table 'informix'.application_area add constraint primary key 
	(app_area_id)
	constraint pk_application_area;

alter table 'informix'.audit add constraint primary key 
	(audit_id)
	constraint pk_audit;

alter table 'informix'.audit_detail add constraint primary key 
	(audit_detail_id)
	constraint pk_audit_detail;

alter table 'informix'.fix_bill_status add constraint primary key 
	(fix_bill_status_id)
	constraint pk_fix_bill_status;

alter table 'informix'.fix_bill_type add constraint primary key 
	(fix_bill_type_id)
	constraint pk_fix_bill_type;

alter table 'informix'.comp_fb_type add constraint primary key 
	(company_id, fix_bill_type_id)
	constraint pk_comp_fb_type;

alter table 'informix'.cut_off_time add constraint primary key 
	(cut_off_time_id)
	constraint pk_cut_off_time;

alter table 'informix'.invoice_status add constraint primary key 
	(invoice_status_id)
	constraint pk_invoice_status;

alter table 'informix'.invoice add constraint primary key 
	(invoice_id)
	constraint pk_invoice;

alter table 'informix'.fix_bill_entry add constraint primary key 
	(fix_bill_entry_id)
	constraint pk_fix_bill_entry;

alter table 'informix'.fb_reject_reason add constraint primary key 
	(fix_bill_entry_id, reject_reason_id)
	constraint pk_fb_reject_reason;

alter table 'informix'.project_fix_bill add constraint primary key 
	(fix_bill_entry_id, project_id)
	constraint pk_project_fix_bill;

alter table 'informix'.service_details add constraint primary key 
	(service_detail_id)
	constraint pk_service_details;

alter table 'informix'.notify_clients add constraint primary key 
	(notification_id, client_id)
	constraint pk_notify_clients;

alter table 'informix'.notify_projects add constraint primary key 
	(notification_id, project_id)
	constraint pk_notify_projects;

alter table 'informix'.notify_resources add constraint primary key 
	(notification_id, user_account_id)
	constraint pk_notify_resources;

alter table 'informix'.account_status add constraint primary key 
	(account_status_id)
	constraint u227_29;

alter table 'informix'.comp_rej_email add constraint primary key 
	(company_id, reject_email_id)
	constraint pk_comp_rej_email;

alter table 'informix'.rate add constraint primary key 
	(rate_id)
	constraint rate_pk;

alter table 'informix'.user_status add constraint primary key 
	(user_status_id)
	constraint u230_1023;

alter table 'informix'.user_type add constraint primary key 
	(user_type_id)
	constraint u231_1032;

alter table 'informix'.notification add constraint primary key 
	(notification_id)
	constraint pk_notification;

alter table 'informix'.data_type add constraint primary key 
	(data_type_id)
	constraint data_type_pk;

alter table 'informix'.command_group_lu add constraint primary key 
	(command_group_id)
	constraint command_group_lu_pk;

alter table 'informix'.command add constraint primary key 
	(command_id)
	constraint command_pk;

alter table 'informix'.query add constraint primary key 
	(query_id)
	constraint query_pk;

create unique index 'informix'.inputlu_inputcode_idx on 'informix'.input_lu
	(
	input_code
	);

alter table 'informix'.input_lu add constraint primary key 
	(input_id)
	constraint input_lu_pkey;

alter table 'informix'.query_input_xref add constraint primary key 
	(query_id, input_id)
	constraint query_input_pk;

alter table 'informix'.command_query_xref add constraint primary key 
	(command_id, query_id)
	constraint commandqueryxref_pk;

alter table 'informix'.project_contest_fee add constraint primary key 
	(project_contest_fee_id)
	constraint project_contest_fee_pk;
	
ALTER TABLE project_contest_fee_percentage ADD CONSTRAINT PRIMARY KEY 
    (project_contest_fee_percentage_id) CONSTRAINT project_contest_fee_percentage_pk;

ALTER TABLE project_contest_fee_percentage ADD CONSTRAINT FOREIGN KEY
    (project_id) references project(project_id) 
	CONSTRAINT project_contest_fee_percentage_to_project_fk;

alter table 'informix'.principal_role add constraint foreign key 
	(principal_id)
	references 'informix'.principal
	(principal_id) 
	constraint r103_534;

alter table 'informix'.principal_role add constraint foreign key 
	(role_id)
	references 'informix'.role
	(role_id) 
	constraint r103_535;

alter table 'informix'.action_context add constraint foreign key 
	(action_context_parent_id)
	references 'informix'.action_context
	(action_context_id) 
	constraint r105_536;

alter table 'informix'.role_action_context_permission add constraint foreign key 
	(role_id)
	references 'informix'.role
	(role_id) 
	constraint r106_537;

alter table 'informix'.role_action_context_permission add constraint foreign key 
	(action_id)
	references 'informix'.action
	(action_id) 
	constraint r106_538;

alter table 'informix'.role_action_context_permission add constraint foreign key 
	(action_context_id)
	references 'informix'.action_context
	(action_context_id) 
	constraint r106_539;

alter table 'informix'.principal_action_context_permission add constraint foreign key 
	(principal_id)
	references 'informix'.principal
	(principal_id) 
	constraint r107_540;

alter table 'informix'.principal_action_context_permission add constraint foreign key 
	(action_id)
	references 'informix'.action
	(action_id) 
	constraint r107_541;

alter table 'informix'.principal_action_context_permission add constraint foreign key 
	(action_context_id)
	references 'informix'.action_context
	(action_context_id) 
	constraint r107_542;

alter table 'informix'.address add constraint foreign key 
	(state_name_id)
	references 'informix'.state_name
	(state_name_id) 
	constraint r111_543;

alter table 'informix'.user_account add constraint foreign key 
	(account_status_id)
	references 'informix'.account_status
	(account_status_id) 
	constraint r114_546;

alter table 'informix'.user_account add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r114_547;

alter table 'informix'.user_account add constraint foreign key 
	(user_status_id)
	references 'informix'.user_status
	(user_status_id) 
	constraint fk_useraccount_userstatus_userstatusid;

alter table 'informix'.user_account add constraint foreign key 
	(user_type_id)
	references 'informix'.user_type
	(user_type_id) 
	constraint fk_useraccount_usertype_usertypeid;

alter table 'informix'.comp_rej_reason add constraint foreign key 
	(reject_reason_id)
	references 'informix'.reject_reason
	(reject_reason_id) 
	constraint r119_554;

alter table 'informix'.comp_rej_reason add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r119_555;

alter table 'informix'.exp_reject_reason add constraint foreign key 
	(reject_reason_id)
	references 'informix'.reject_reason
	(reject_reason_id) 
	constraint r125_561;

alter table 'informix'.exp_reject_reason add constraint foreign key 
	(expense_entry_id)
	references 'informix'.expense_entry
	(expense_entry_id) 
	constraint r125_562;

alter table 'informix'.comp_exp_type add constraint foreign key 
	(expense_type_id)
	references 'informix'.expense_type
	(expense_type_id) 
	constraint r126_563;

alter table 'informix'.comp_exp_type add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r126_564;

alter table 'informix'.project_expense add constraint foreign key 
	(expense_entry_id)
	references 'informix'.expense_entry
	(expense_entry_id) 
	constraint r128_566;

alter table 'informix'.project_expense add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint r128_567;

alter table 'informix'.time_reject_reason add constraint foreign key 
	(reject_reason_id)
	references 'informix'.reject_reason
	(reject_reason_id) 
	constraint r132_571;

alter table 'informix'.time_reject_reason add constraint foreign key 
	(time_entry_id)
	references 'informix'.time_entry
	(time_entry_id) 
	constraint r132_572;

alter table 'informix'.comp_task_type add constraint foreign key 
	(task_type_id)
	references 'informix'.task_type
	(task_type_id) 
	constraint r133_573;

alter table 'informix'.comp_task_type add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r133_574;

alter table 'informix'.project_time add constraint foreign key 
	(time_entry_id)
	references 'informix'.time_entry
	(time_entry_id) 
	constraint r134_575;

alter table 'informix'.project_time add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint r134_576;

alter table 'informix'.project_manager add constraint foreign key 
	(user_account_id)
	references 'informix'.user_account
	(user_account_id) 
	constraint r135_577;

alter table 'informix'.project_manager add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint r135_578;

alter table 'informix'.client add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r137_581;

alter table 'informix'.client_project add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint r138_582;

alter table 'informix'.client_project add constraint foreign key 
	(client_id)
	references 'informix'.client
	(client_id) 
	constraint r138_583;

alter table 'informix'.account_status_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r140_584;

alter table 'informix'.state_name_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r141_585;

alter table 'informix'.reject_reason_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r142_586;

alter table 'informix'.address_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r143_587;

alter table 'informix'.company_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r144_588;

alter table 'informix'.company_address_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r145_589;

alter table 'informix'.user_account_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r146_590;

alter table 'informix'.user_address_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r147_591;

alter table 'informix'.contact_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r148_592;

alter table 'informix'.user_contact_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r149_593;

alter table 'informix'.company_contact_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r150_594;

alter table 'informix'.comp_rej_reason_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r151_595;

alter table 'informix'.reject_email_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r152_596;

alter table 'informix'.comp_reject_email_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r153_597;

alter table 'informix'.expense_status_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r154_598;

alter table 'informix'.expense_type_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r155_599;

alter table 'informix'.expense_entry_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r156_600;

alter table 'informix'.exp_reject_reason_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r157_601;

alter table 'informix'.comp_exp_type_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r158_602;

alter table 'informix'.project_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r159_603;

alter table 'informix'.project_expense_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r160_604;

alter table 'informix'.time_status_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r161_605;

alter table 'informix'.task_type_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r162_606;

alter table 'informix'.time_entry_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r163_607;

alter table 'informix'.time_reject_reason_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r164_608;

alter table 'informix'.comp_task_type_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r165_609;

alter table 'informix'.project_time_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r166_610;

alter table 'informix'.project_manager_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r167_611;

alter table 'informix'.project_worker_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r168_612;

alter table 'informix'.client_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r169_613;

alter table 'informix'.client_project_audit add constraint foreign key 
	(audit_action_id)
	references 'informix'.audit_action
	(audit_action_id) 
	constraint r170_614;

alter table 'informix'.project_worker add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint r172_579;

alter table 'informix'.project_worker add constraint foreign key 
	(user_account_id)
	references 'informix'.user_account
	(user_account_id) 
	constraint r172_580;

alter table 'informix'.project add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r174_565;

alter table 'informix'.time_entry add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r176_568;

alter table 'informix'.time_entry add constraint foreign key 
	(time_status_id)
	references 'informix'.time_status
	(time_status_id) 
	constraint r176_569;

alter table 'informix'.time_entry add constraint foreign key 
	(task_type_id)
	references 'informix'.task_type
	(task_type_id) 
	constraint r176_570;

alter table 'informix'.time_entry add constraint foreign key 
	(invoice_id)
	references 'informix'.invoice
	(invoice_id) 
	constraint fk_timeentry_invoice_invoiceid;

alter table 'informix'.expense_entry add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint r178_558;

alter table 'informix'.expense_entry add constraint foreign key 
	(expense_status_id)
	references 'informix'.expense_status
	(expense_status_id) 
	constraint r178_559;

alter table 'informix'.expense_entry add constraint foreign key 
	(expense_type_id)
	references 'informix'.expense_type
	(expense_type_id) 
	constraint r178_560;

alter table 'informix'.expense_entry add constraint foreign key 
	(invoice_id)
	references 'informix'.invoice
	(invoice_id) 
	constraint fk_expenseentry_invoice_invoiceid;

alter table 'informix'.comp_rate add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_comp_rate_company;

alter table 'informix'.comp_rate add constraint foreign key 
	(rate_id)
	references 'informix'.rate
	(rate_id) 
	constraint fk_comp_rate_rate;

alter table 'informix'.address_relation add constraint foreign key 
	(address_id)
	references 'informix'.address
	(address_id) 
	constraint fk_addressrelation_address_addressid;

alter table 'informix'.address_relation add constraint foreign key 
	(address_type_id)
	references 'informix'.address_type
	(address_type_id) 
	constraint fk_addressrelation_addresstype_addresstypeid;

alter table 'informix'.contact_relation add constraint foreign key 
	(contact_type_id)
	references 'informix'.contact_type
	(contact_type_id) 
	constraint fk_contactrelation_contacttype_contacttypeid;

alter table 'informix'.contact_relation add constraint foreign key 
	(contact_id)
	references 'informix'.contact
	(contact_id) 
	constraint fk_contactrelation_contact_contactid;

alter table 'informix'.audit add constraint foreign key 
	(app_area_id)
	references 'informix'.application_area
	(app_area_id) 
	constraint fk_audit_applicationarea_appareaid;

alter table 'informix'.audit add constraint foreign key 
	(client_id)
	references 'informix'.client
	(client_id) 
	constraint fk_audit_client_clientid;

alter table 'informix'.audit add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_audit_company_companyid;

alter table 'informix'.audit add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint fk_audit_project_projectid;

alter table 'informix'.audit add constraint foreign key 
	(account_user_id)
	references 'informix'.user_account
	(user_account_id) 
	constraint fk_audit_useraccount_useraccountid;

alter table 'informix'.audit_detail add constraint foreign key 
	(audit_id)
	references 'informix'.audit
	(audit_id) 
	constraint fk_auditdetail_audit_auditid;

alter table 'informix'.comp_fb_type add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_compfbtype_company_companyid;

alter table 'informix'.comp_fb_type add constraint foreign key 
	(fix_bill_type_id)
	references 'informix'.fix_bill_type
	(fix_bill_type_id) 
	constraint fk_compfbtype_fixbilltype_fixbilltypeid;

alter table 'informix'.cut_off_time add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_cutofftime_company_companyid;

alter table 'informix'.invoice add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint fk_invoice_project_projectid;

alter table 'informix'.invoice add constraint foreign key 
	(payment_terms_id)
	references 'informix'.payment_terms
	(payment_terms_id) 
	constraint fk_invoice_paymentterms_paymenttermsid;

alter table 'informix'.invoice add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_invoice_company_companyid;

alter table 'informix'.invoice add constraint foreign key 
	(invoice_status_id)
	references 'informix'.invoice_status
	(invoice_status_id) 
	constraint fk_invoice_invoicestatus_invoicestatusid;

alter table 'informix'.fix_bill_entry add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_fixbillentry_company_companyid;

alter table 'informix'.fix_bill_entry add constraint foreign key 
	(client_id)
	references 'informix'.client
	(client_id) 
	constraint fk_fixbillentry_client_clientid;

alter table 'informix'.fix_bill_entry add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint fk_fixbillentry_project_projectid;

alter table 'informix'.fix_bill_entry add constraint foreign key 
	(invoice_id)
	references 'informix'.invoice
	(invoice_id) 
	constraint fk_fixbillentry_invoice_invoiceid;

alter table 'informix'.fix_bill_entry add constraint foreign key 
	(fix_bill_status_id)
	references 'informix'.fix_bill_status
	(fix_bill_status_id) 
	constraint fk_fixbillentry_fixbillstatus_fixbillstatusid;

alter table 'informix'.fb_reject_reason add constraint foreign key 
	(fix_bill_entry_id)
	references 'informix'.fix_bill_entry
	(fix_bill_entry_id) 
	constraint fk_fbrejectreason_fixbillentry_fixbillentryid;

alter table 'informix'.fb_reject_reason add constraint foreign key 
	(reject_reason_id)
	references 'informix'.reject_reason
	(reject_reason_id) 
	constraint fk_fbrejectreason_rejectreason_rejectreasonid;

alter table 'informix'.project_fix_bill add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint fk_projectfixbill_project_projectid;

alter table 'informix'.project_fix_bill add constraint foreign key 
	(fix_bill_entry_id)
	references 'informix'.fix_bill_entry
	(fix_bill_entry_id) 
	constraint fk_projectfixbill_fixbillentry_fixbillentryid;

alter table 'informix'.service_details add constraint foreign key 
	(time_entry_id)
	references 'informix'.time_entry
	(time_entry_id) 
	constraint fk_servicedetails_timeentry_timeentryid;

alter table 'informix'.service_details add constraint foreign key 
	(invoice_id)
	references 'informix'.invoice
	(invoice_id) 
	constraint fk_servicedetails_invoice_invoiceid;

alter table 'informix'.notify_clients add constraint foreign key 
	(notification_id)
	references 'informix'.notification
	(notification_id) 
	constraint fk_notifyclients_notification_notificationid;

alter table 'informix'.notify_clients add constraint foreign key 
	(client_id)
	references 'informix'.client
	(client_id) 
	constraint fk_notifyclients_client_clientid;

alter table 'informix'.notify_projects add constraint foreign key 
	(notification_id)
	references 'informix'.notification
	(notification_id) 
	constraint fk_notifyprojects_notification_notificationid;

alter table 'informix'.notify_projects add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint fk_notifyprojects_project_projectid;

alter table 'informix'.notify_resources add constraint foreign key 
	(notification_id)
	references 'informix'.notification
	(notification_id) 
	constraint fk_notifyresources_notification_notificationid;

alter table 'informix'.notify_resources add constraint foreign key 
	(user_account_id)
	references 'informix'.user_account
	(user_account_id) 
	constraint fk_notifyresources_useraccount_useraccountid;

alter table 'informix'.comp_rej_email add constraint foreign key 
	(company_id)
	references 'informix'.company
	(company_id) 
	constraint fk_comprejemail_company_companyid;

alter table 'informix'.comp_rej_email add constraint foreign key 
	(reject_email_id)
	references 'informix'.reject_email
	(reject_email_id) 
	constraint fk_comprejemail_rejectemail_rejectemailid;

alter table 'informix'.command add constraint foreign key 
	(command_group_id)
	references 'informix'.command_group_lu
	(command_group_id) 
	constraint command_command_group_fk;

alter table 'informix'.command_execution add constraint foreign key 
	(command_id)
	references 'informix'.command
	(command_id) 
	constraint commandexecution_command_fk;


alter table 'informix'.client_status add constraint primary key 
	(client_status_id)
	constraint client_status_pk;

alter table 'informix'.project_status add constraint primary key 
	(project_status_id)
	constraint project_status_pk;

alter table 'informix'.project_xref add constraint primary key 
	(parent_project_id, child_project_id)
	constraint project_xref_pk;

alter table 'informix'.client_user_xref add constraint foreign key 
	(client_id) references 'informix'.client (client_id)
	constraint client_user_xref_client_fk;

alter table 'informix'.client_user_xref add constraint foreign key 
	(user_id) references 'informix'.user_account (user_account_id)
	constraint client_user_xref_user_account_fk;

alter table 'informix'.project_user_xref add constraint foreign key 
	(user_id) references 'informix'.user_account (user_account_id)
	constraint project_user_xref_user_account_fk;

alter table 'informix'.project_user_xref add constraint foreign key 
	(project_id) references 'informix'.project (project_id)
	constraint project_user_xref_project_fk;

alter table 'informix'.project_xref add constraint foreign key 
	(parent_project_id) references 'informix'.project (project_id)
	constraint project_xref_parent_project_fk;

alter table 'informix'.project_xref add constraint foreign key 
	(child_project_id) references 'informix'.project (project_id)
	constraint project_xref_child_project_fk;

alter table 'informix'.client add constraint foreign key 
	(client_status_id) references 'informix'.client_status (client_status_id)
	constraint client_client_status_fk;

alter table 'informix'.project add constraint foreign key 
	(client_id) references 'informix'.client (client_id)
	constraint project_client_fk;

alter table 'informix'.project add constraint foreign key 
	(project_status_id) references 'informix'.project_status (project_status_id)
	constraint project_project_status_fk;

alter table 'informix'.project add constraint foreign key 
	(parent_project_id) references 'informix'.project (project_id)
	constraint project_parent_project_fk;
	

ALTER TABLE project_contest_fee_percentage ADD CONSTRAINT FOREIGN KEY
    (project_id) references project(project_id) 
	CONSTRAINT project_contest_fee_percentage_to_project_fk;

