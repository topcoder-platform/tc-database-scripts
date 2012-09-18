database corporate_oltp;

insert into 'informix'.permission_type (permission_type_id, name) values(0, 'project_report');
insert into 'informix'.permission_type (permission_type_id, name) values(1, 'project_read');
insert into 'informix'.permission_type (permission_type_id, name) values(2, 'project_write');
insert into 'informix'.permission_type (permission_type_id, name) values(3, 'project_full');
insert into 'informix'.permission_type (permission_type_id, name) values(4, 'contest_read');
insert into 'informix'.permission_type (permission_type_id, name) values(5, 'contest_write');
insert into 'informix'.permission_type (permission_type_id, name) values(6, 'contest_full');


INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (1, 'Active', 'Active', 'System', current, 'System', current);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (2, 'Inactive', 'Inactive', 'System', current, 'System', current);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (3, 'Cancelled', 'Cancelled', 'System', CURRENT, 'System', CURRENT);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (4, 'Completed', 'Completed', 'System', CURRENT, 'System', CURRENT);

INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (5, 'Draft', 'Draft', 'System', CURRENT, 'System', CURRENT);


INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(0, 'Statistics');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(1, 'Email');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(2, 'Graph');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(4, 'Report');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(7, 'Applet');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(9, 'Job Posting');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(8, 'TCES');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(10, 'Util');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(11009, 'Corp');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(5, 'sd', 1003, 'Start date');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(6, 'ed', 1003, 'End date');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(18, 'ci', 1001, 'Command ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(19, 'ji', 1001, 'Job ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(20, 'email', 1005, 'E-mail Address');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(21, 'subject', 1005, 'Subject');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(22, 'sector', 1005, 'Sector Desc');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(3, 'cr', 1001, 'Coder ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(23, 'rd', 1001, 'Round ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(24, 'ct', 1001, 'Coder Type Id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(25, 'dq', 1001, 'Demographic Question Id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(39, 'top', 1001, 'No of Top Rated Coders');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1000, 'uid', 1001, 'TCES User ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(27, 'rn', 1001, 'min rating');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(28, 'rx', 1001, 'max rating');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(29, 'ha', 1005, 'handle');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(30, 'scs', 1005, 'state codes');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1001, 'cid', 1001, 'TCES Campaign ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(32, 'nrn', 1001, 'min num ratings');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(33, 'nrx', 1001, 'max num ratings');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(34, 'gn', 1001, 'min grad year');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(35, 'gx', 1001, 'max grad year');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(36, 'cts', 1005, 'coder types');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(37, 'fn', 1005, 'first name');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(38, 'ln', 1005, 'last name');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(41, 'cm', 1001, 'company id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(42, 'it', 1001, 'image type id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1002, 'jid', 1001, 'TCES Job ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1003, 'mid', 1001, 'TCES Member ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1100, 'hn', 1005, 'User Handle');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(43, 'cd', 1001, 'Contest ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(44, 'rds', 1005, 'round ids');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11001, 'sdir', 1004, 'Sort direction');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11002, 'sc', 1001, 'Sort column');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11008, 'comid', 1001, 'company ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11003, 'stateID', 1005, 'state ID (2 letter combination)');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11004, 'countryID', 1005, 'country ID (3 digit combination)');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11005, 'puid', 1001, 'TCES primary User ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(12105, 'prodID', 1001, 'Product ID');
INSERT INTO 'informix'.unit_type_lu(unit_type_id, unit_type_desc, create_date, modify_date)
  VALUES(1, 'Time', EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND, EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND);
INSERT INTO 'informix'.unit_type_lu(unit_type_id, unit_type_desc, create_date, modify_date)
  VALUES(2, 'Item', EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND, EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND);

insert into spec_review_status_type_lu(review_status_type_id, name)
values (1, 'PASSED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (2, 'FAILED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (3, 'PENDING');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (4, 'READY');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (5, 'REVIEWER_ASSIGNED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (6, 'NOT_READY');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (1, 1, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (2, 1, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (3, 1, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (4, 1, 'Contest Specs');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (5, 1, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (6, 1, 'Contest Schedule');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (7, 0, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (8, 0, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (9, 0, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (10, 0, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (11, 0, 'Contest Schedule');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (1, 'ADMIN');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (2, 'CREATOR');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (3, 'REVIEWER');


insert into direct_project_type VALUES (1, "Web Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (10, 1, "Ecommerce");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (11, 1, "Back Office");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (12, 1, "Community/Social Platforms");
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (13,1,'B2B');
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (14,1,'B2C');
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (15,1,'Portal');

insert into direct_project_type VALUES (2, "Web Site");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (20, 2, "Marketing");

insert into direct_project_type VALUES (3, "Mobile Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (30, 3, "iPhone");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (31, 3, "Android Phone");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (32, 3, "iPad");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (33, 3, "Multi-Platform");
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (34,3,'Android Tablet');


insert into direct_project_type VALUES (4, "Desktop Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (40, 4, "Windows App");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (41, 4, "Mac OSX App");

insert into direct_project_type VALUES (5, "Business Intelligence");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (50, 5, "Report Development");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (51, 5, "Data Warehousing");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (52, 5, "Analytics");

insert into direct_project_type VALUES (6, "Content Creation");

insert into direct_project_type VALUES (7, "Presentation");

insert into direct_project_type VALUES (8, "Other");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (80, 8, "Conversion/Migration");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (81, 8, "QA Existing Product"); 





