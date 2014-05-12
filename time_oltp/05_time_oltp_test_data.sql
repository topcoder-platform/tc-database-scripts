database time_oltp;



-------------------------------------------------------------------------------------------------------
-- Required roles for Time Tracker application
INSERT INTO 'informix'.role (role_id, role_name) VALUES (1, 'Contractor');
INSERT INTO 'informix'.role (role_id, role_name) VALUES (2, 'Employee');
INSERT INTO 'informix'.role (role_id, role_name) VALUES (3, 'Manager');
INSERT INTO 'informix'.role (role_id, role_name) VALUES (4, 'Administrator');

-- Required actions for Time Tracker application
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (1, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Login');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (2, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Enter Time');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (3, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Enter Expense');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (4, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Project Report');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (5, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Employee Report');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (6, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Personal Employee Report');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (7, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Client Report');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (8, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Approve Any Contractor Time');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (9, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Approve Managed Contractor Time');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (10, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Add Any Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (11, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Add Managed Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (12, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Edit Any Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (13, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Edit Managed Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (14, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Delete Any Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (15, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Delete Managed Project');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (16, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Add Client');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (17, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Edit Client');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (18, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Delete Client');
INSERT INTO 'informix'.action (action_id, class_name, action_name)
    VALUES (19, 'com.topcoder.security.authorization.persistence.GeneralAction', 'Edit User');

-- Required action context for Time Tracker application
INSERT INTO 'informix'.action_context (action_context_id, class_name, action_context_name, action_context_parent_id)
    VALUES (1, 'com.topcoder.security.authorization.persistence.GeneralActionContext', 'Time Tracker', 1);

-- Required action role context for Time Tracker application

-- For Contractor role
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 1, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 2, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 3, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 4, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 5, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 6, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 7, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 8, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 9, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 10, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 11, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 12, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 13, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 14, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 15, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 16, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 17, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 18, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (1, 19, 1, 0);

-- For Employee role
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 1, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 2, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 3, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 4, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 5, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 6, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 7, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 8, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 9, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 10, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 11, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 12, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 13, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 14, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 15, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 16, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 17, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 18, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (2, 19, 1, 0);

-- For Manager role
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 1, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 2, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 3, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 4, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 5, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 6, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 7, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 8, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 9, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 10, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 11, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 12, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 13, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 14, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 15, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 16, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 17, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 18, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (3, 19, 1, 1);

-- For Administrator role
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 1, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 2, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 3, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 4, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 5, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 6, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 7, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 8, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 9, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 10, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 11, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 12, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 13, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 14, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 15, 1, 0);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 16, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 17, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 18, 1, 1);
INSERT INTO 'informix'.role_action_context_permission (role_id, action_id, action_context_id, permission) VALUES (4, 19, 1, 1);



INSERT INTO 'informix'.principal (principal_id, principal_name) VALUES (1, 'admin');

INSERT INTO 'informix'.principal_role VALUES (1, 4);

insert into 'informix'.company(company_id, name, passcode, creation_date, creation_user, modification_date,  modification_user) values(1, 'The Company', 'test', CURRENT, '', CURRENT, '');


insert into 'informix'.account_status (account_status_id,  description, creation_date, creation_user,  modification_date,  modification_user) VALUES(1, 'active', CURRENT, '', CURRENT, '');


insert into 'informix'.user_account(user_account_id, company_id, user_name, password, account_status_id, creation_date,  creation_user,  modification_date,  modification_user) values(1, 1, 'admin', 'tc_super', 1, CURRENT, '', CURRENT, '');


insert into 'informix'.state_name (state_name_id,  name,  abbreviation,  creation_date, creation_user,  modification_date,  modification_user) VALUES (1, 'New York', 'NY', CURRENT, '', CURRENT, '');


insert into 'informix'.address (address_id,   line1,   line2,   city, state_name_id,  zip_code,  country_name_id,  creation_date,  creation_user,  modification_date,  modification_user) VALUES (1, 'street', 'appt', 'city', 1, 10028, 1, CURRENT, '', CURRENT, '');


insert into 'informix'.contact (contact_id, first_name, last_name, phone, email,  creation_date, creation_user, modification_date,  modification_user) VALUES (1, 'contact', 'person', '1234567890', 'contact@person.net', CURRENT, '', CURRENT, '');

insert into 'informix'.user_account values (2, 1, 1, 'heffan', 'password', current, 'admin', current, 'admin', null, null, null);
insert into 'informix'.user_account values (3, 1, 1, 'Yoshi', 'password', current, 'admin', current, 'admin', null, null, null);
insert into 'informix'.user_account values (4, 1, 1, 'user', 'password', current, 'admin', current, 'admin', null, null, null);

insert into 'informix'.client_status values (1, 'Active', 'Active', 0, current, 'admin', current, 'admin');

insert into 'informix'.client (client_id, name, company_id, payment_term_id, status, salestax, start_date, end_date, code_name,is_deleted,client_status_id, creation_date, creation_user, modification_date, modification_user,cmc_account_id ) 
     values (1, 'ACME', 1, 1, 1, 0, current, mdy(1,1,2020),  'ACME', 0, 1, current, 'admin', current, 'admin', null);
insert into 'informix'.client (client_id, name, company_id, payment_term_id, status, salestax, start_date, end_date, code_name,is_deleted,client_status_id, creation_date, creation_user, modification_date, modification_user,cmc_account_id ) 
 values (2, 'TopCoder', 1, 1, 1, 0, current, mdy(1,1,2020), 'cronos', 0, 1, current, 'admin', current, 'admin', null);

insert into 'informix'.project_status values (1, 'Active', 'Active', 0, current, 'admin', current, 'admin');

insert into 'informix'.project values (1, 1, 'Test Project 1', 1, 0, 'TESTPROJECT-01', 1, 'description', current, mdy(1,1,2020), 1, 1, null, 0,current, 'admin', current, 'admin', 0, 5000, 'null');
insert into 'informix'.project values (2, 1, 'Test Project 2', 1, 0, 'TESTPROJECT-02', 1, 'description', current, mdy(1,1,2020), 1, 1, null, 0, current, 'admin', current, 'admin', 0, 5000, 'null');
insert into 'informix'.project values (3, 1, 'Test Project 3', 1, 0, 'TESTPROJECT-03', 1, 'description', current, mdy(1,1,2020), 1, 1, null, 0, current, 'admin', current, 'admin', 1,  5000, 'null');

insert into 'informix'.project_worker values (1, 1, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (1, 2, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (1, 3, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (2, 1, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (3, 1, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (3, 2, current, mdy(1,1,2020), 0, 0, 1, current, 'admin', current, 'admin');


insert into 'informix'.project_manager values (3, 2, 0, 0, 1, current, 'admin', current, 'admin');

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2000, 1, 1, 1, 5000, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2001, 1, 1, 5, 5001, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2002, 1, 1, 4, 5002, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2003, 1, 1, 3, 5003, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2004, 1, 1, 12, 5005, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2005, 1, 1, 18, 5007, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2006, 1, 1, 25, 5008, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2007, 1, 1, 26, 5008, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2010, 1, 0, 1, 6000, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2011, 1, 0, 23, 6001, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2012, 1, 0, 22, 6002, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2013, 1, 0, 7, 6003, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2014, 1, 0, 2, 6004, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2015, 1, 0, 14, 6005, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2016, 1, 0, 13, 6006, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2017, 1, 0, 24, 6007, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2018, 1, 0, 25, 6008, 0);

insert into project_contest_fee(project_contest_fee_id, project_id, is_studio, contest_type_id, contest_fee, is_deleted)
values(2019, 1, 0, 19, 6009, 0);

insert into project_contest_fee_percentage(project_contest_fee_percentage_id, project_id, contest_fee_percentage, active, creation_user, creation_date, modification_user, modification_date)
VALUES(1000, 2, 0.50, 't', 'system', current, 'system', current);

insert into client_project values (1, 1, current, 'test', current, 'test');

insert into client_project values (2, 2, current, 'test', current, 'test');

insert into client_project values (1, 3, current, 'test', current, 'test');


insert into client(client_id, name, company_id, payment_term_id, status, salestax, start_date, end_date, code_name,is_deleted,client_status_id, creation_date, creation_user, modification_date, modification_user,cmc_account_id) 
values(70014096, 'Notus', 1, 1, 1, '0.00', '2010-03-20 15:52:10', '2011-01-01 00:00:00', 'Notus-code', 0, 1, current, 'admin', current, 'admin', null);

insert into  project values (70015983, 1, 'Liquid Community', 1, '0.00', 'Liquid PO 1', 1, 'description', '2010-03-20 15:52:10', '2012-01-01 00:00:00', 1, 70014096, null, 0, current, 'admin' , current, 'adming', 0, 5000,'null');

insert into  project values (70015984, 1, 'Liquid (CA)', 1, '0.00', 'Liquid PO 1', 1, 'description', '2010-03-20 15:52:10', '2012-01-01 00:00:00', 1, 70014096, null, 0, current, 'admin' , current, 'adming', 0, 5000,'null');
insert into  project values (70016343, 1, 'Liquid', 1, '0.00', 'TC0000377', 1, 'Liquid', current, '2014-02-28 00:00:00', 1,70014096, null, 0, current, 'system', current, 'system' , 0, 5000,'null');
insert into  project values (70016347, 1, 'CIO projects', 1, '0.00', 'TC0000381', 1, 'CIO projects', current, '2014-02-28 00:00:00', 1,70014096, null, 0, current, 'system', current, 'system' , 0, 5000,'null');

insert into  client_project values (70014096, 70015983, current, 'test', current, 'test');

insert into  client_project values (70014096, 70015984, current, 'test', current, 'test');


insert into  client_project values (70014096, 70016343, current, 'test', current, 'test');

insert into  client_project values (70014096, 70016347, current, 'test', current, 'test');


insert into 'informix'.project_worker values (70015984, 2, current, mdy(1,1,2014), 0, 0, 1, current, 'admin', current, 'admin');
insert into 'informix'.project_worker values (70015983, 2, current, mdy(1,1,2014), 0, 0, 1, current, 'admin', current, 'admin');

insert into 'informix'.country_name(country_name_id, name, creation_date, creation_user, modification_date, modification_user) values (840, 'United States', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.state_name(state_name_id, name, abbreviation, creation_date, creation_user, modification_date, modification_user) values (7, 'Connecticut', 'CT', CURRENT, '132456', CURRENT, '132456');

insert into 'informix'.address_type(address_type_id, description, creation_date, creation_user, modification_date, modification_user) values (1, 'PROJECT', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.address_type(address_type_id, description, creation_date, creation_user, modification_date, modification_user) values (2, 'CLIENT', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.address_type(address_type_id, description, creation_date, creation_user, modification_date, modification_user) values (3, 'COMPANY', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.address_type(address_type_id, description, creation_date, creation_user, modification_date, modification_user) values (4, 'USER', CURRENT, '132456', CURRENT, '132456');

insert into 'informix'.contact_type(contact_type_id, description, creation_date, creation_user, modification_date, modification_user) values (1, 'PROJECT', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.contact_type(contact_type_id, description, creation_date, creation_user, modification_date, modification_user) values (2, 'CLIENT', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.contact_type(contact_type_id, description, creation_date, creation_user, modification_date, modification_user) values (3, 'COMPANY', CURRENT, '132456', CURRENT, '132456');
insert into 'informix'.contact_type(contact_type_id, description, creation_date, creation_user, modification_date, modification_user) values (4, 'USER', CURRENT, '132456', CURRENT, '132456');
