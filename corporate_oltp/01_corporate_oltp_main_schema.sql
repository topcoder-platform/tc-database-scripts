CREATE DATABASE corporate_oltp IN datadbs WITH BUFFERED LOG;
database corporate_oltp;

grant dba to informix ;
grant connect to coder ;
grant connect to readonly ;
grant connect to veredox ;
grant connect to openaim ;
grant connect to truveo ;
grant connect to winformula ;
grant connect to openxtraz ;
grant connect to cockpit ;


create table "informix".unit_type_lu 
  (
    unit_type_id decimal(10,0) not null ,
    unit_type_desc varchar(128),
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    modify_date datetime year to fraction(3) 
        default current year to fraction(3),
    primary key (unit_type_id)  constraint "informix".unit_type_lu_pk
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".unit_type_lu from "public" as "informix";

create table "informix".dual 
  (
    value integer
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".dual from "public" as "informix";

create table "informix".data_type 
  (
    data_type_id decimal(5,0),
    data_type_desc varchar(16),
    primary key (data_type_id)  constraint "informix".data_type_pk
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".data_type from "public" as "informix";

create table "informix".input_lu 
  (
    input_id decimal(10,0),
    input_code varchar(25),
    data_type_id decimal(5,0),
    input_desc varchar(100),
    primary key (input_id)  constraint "informix".input_lu_pkey
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".input_lu from "public" as "informix";

create table "informix".query 
  (
    query_id decimal(10,0),
    text text,
    name varchar(100),
    ranking integer,
    column_index integer,
    primary key (query_id)  constraint "informix".query_pk
  )  
  extent size 128 next size 128
  lock mode row;
  
revoke all on "informix".query from "public" as "informix";

create table "informix".command 
  (
    command_id decimal(10,0),
    command_desc varchar(100),
    command_group_id decimal(5,0),
    primary key (command_id)  constraint "informix".command_pk
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".command from "public" as "informix";

create table "informix".command_group_lu 
  (
    command_group_id decimal(5,0) not null ,
    command_group_name varchar(100),
    primary key (command_group_id)  constraint "informix".command_group_lu_pk
  )  
  extent size 32 next size 32
  lock mode row;
  
revoke all on "informix".command_group_lu from "public" as "informix";


create table "informix".query_input_xref 
  (
    query_id decimal(10,0),
    optional char(1),
    default_value varchar(100),
    input_id decimal(10,0),
    sort_order decimal(3,0),
    primary key (query_id,input_id)  constraint "informix".query_input_pk
  )  
  extent size 32 next size 32
  lock mode row;
revoke all on "informix".query_input_xref from "public" as "informix";

create table "informix".command_query_xref 
  (
    command_id decimal(10,0),
    query_id decimal(10,0),
    sort_order decimal(3,0),
    primary key (command_id,query_id)  constraint "informix".commandqueryxref_k
  )  
  extent size 32 next size 32
  lock mode row;
revoke all on "informix".command_query_xref from "public" as "informix";

create table "informix".unit 
  (
    unit_id decimal(10,0) not null ,
    unit_desc varchar(128),
    unit_type_id decimal(5,0) not null ,
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    modify_date datetime year to fraction(3) 
        default current year to fraction(3),
    primary key (unit_id)  constraint "informix".unit_pk
  )  
  extent size 64 next size 64
  lock mode row;
revoke all on "informix".unit from "public" as "informix";

create table "informix".product 
  (
    product_id decimal(10,0) not null ,
    product_desc varchar(128),
    cost decimal(9,2) not null ,
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    modify_date datetime year to fraction(3) 
        default current year to fraction(3),
    redirect_url varchar(255),
    terms_of_use_id decimal(10,0),
    primary key (product_id)  constraint "informix".product_pk
  )  
  extent size 32 next size 32
  lock mode row;
revoke all on "informix".product from "public" as "informix";

create table "informix".product_role_xref 
  (
    product_id decimal(10,0) not null ,
    role_id decimal(18) not null ,
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    primary key (product_id,role_id)  constraint "informix".product_role_xref_pk
  )  
  extent size 32 next size 32
  lock mode row;
revoke all on "informix".product_role_xref from "public" as "informix";

create table "informix".purchase 
  (
    purchase_id decimal(10,0) not null ,
    company_id decimal(10,0),
    product_id decimal(10,0) not null ,
    start_date datetime year to fraction(3),
    end_date datetime year to fraction(3),
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    modify_date datetime year to fraction(3) 
        default current year to fraction(3),
    paid decimal(9,2) not null ,
    user_id decimal(10,0) not null ,
    primary key (purchase_id)  constraint "informix".purchase_pk
  )  
  extent size 256 next size 256
  lock mode row;
revoke all on "informix".purchase from "public" as "informix";

create table "informix".product_unit_xref 
  (
    product_id decimal(10,0) not null ,
    unit_id decimal(10,0) not null ,
    num_units decimal(5,0) not null ,
    create_date datetime year to fraction(3) 
        default current year to fraction(3),
    modify_date datetime year to fraction(3) 
        default current year to fraction(3),
    primary key (product_id,unit_id)  constraint "informix".product_unit_xref_pk
  )  
  extent size 64 next size 64
  lock mode row;
revoke all on "informix".product_unit_xref from "public" as "informix";

create table "informix".product_country_eligibility 
  (
    product_id decimal(10,0),
    country_code varchar(3),
    eligible decimal(1,0),
    primary key (product_id,country_code)  constraint "informix".prod_pk
  )  
  extent size 128 next size 128
  lock mode page;
revoke all on "informix".product_country_eligibility from "public" as "informix";

create table "informix".command_execution 
  (
    command_id decimal(10,0),
    timestamp datetime year to fraction(3) 
        default current year to fraction(3),
    execution_time integer
  )  
  extent size 1000000 next size 1000000
  lock mode page;
revoke all on "informix".command_execution from "public" as "informix";

create table "informix".tc_direct_project 
  (
    project_id integer not null ,
    name varchar(200) not null ,
    description lvarchar(10000),
    project_status_id INT default 1 not null,
    user_id integer not null ,
    project_forum_id VARCHAR(255),
    create_date datetime year to fraction(3) not null ,
    modify_date datetime year to fraction(3),
	direct_project_type_id INT,
	direct_project_category_id INT,
	completion_date DATETIME YEAR TO SECOND,
    primary key (project_id)  constraint "informix".tc_direct_project_pkey
  )  
  extent size 20000 next size 20000
  lock mode row;
revoke all on "informix".tc_direct_project from "public" as "informix";

create table 'informix'.tc_direct_project_status_lu (
    project_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date DATETIME YEAR TO FRACTION not null,
    modify_user VARCHAR(64) not null,
    modify_date DATETIME YEAR TO FRACTION not null
)
extent size 64 next size 64
lock mode row;

revoke all on tc_direct_project_status_lu from 'public';

create table "informix".permission_type 
  (
    permission_type_id decimal(10, 0) not null ,
    name varchar(254) not null ,
    primary key (permission_type_id)  constraint "informix".pk_permission_type
  )  
  extent size 16 next size 16
  lock mode row;
revoke all on "informix".permission_type from "public" as "informix";


create table "informix".user_permission_grant 
  (
    user_permission_grant_id decimal(10) not null ,
    user_id decimal(10,0) not null ,
    resource_id decimal(10,0) not null ,
    permission_type_id decimal(10,0) not null ,
    is_studio smallint,
    primary key (user_permission_grant_id)  constraint "informix".pk_user_permission_grant_id
  )  
  extent size 500 next size 500
  lock mode row;
revoke all on "informix".user_permission_grant from "public" as "informix";


create table "informix".spec_review_status_type_lu 
(
    review_status_type_id decimal(3,0) NOT NULL,
    name varchar(254),
    PRIMARY KEY (review_status_type_id) constraint "informix".spec_review_status_pk
) 
extent size 16 next size 16
lock mode row;
revoke all on "informix".spec_review_status_type_lu from "public" as "informix";

create table "informix".spec_review_section_type_lu (
    review_section_type_id decimal(3,0) NOT NULL,
    is_studio SMALLINT,
    name varchar(254),
    PRIMARY KEY (review_section_type_id) constraint "informix".review_section_type_pk
) 
extent size 16 next size 16
lock mode row;
revoke all on "informix".spec_review_section_type_lu from "public" as "informix";

create table "informix".spec_review_user_role_type_lu (
    review_user_role_type_id decimal(3, 0) NOT NULL,
    name varchar(254),
    PRIMARY KEY(review_user_role_type_id) constraint "informix".spec_review_user_rol_type_pk
)  
extent size 16 next size 16
lock mode row;
revoke all on "informix".spec_review_user_role_type_lu from "public" as "informix";


create table "informix".spec_review 
(
    spec_review_id decimal(10,0) NOT NULL,
    contest_id decimal(10,0) NOT NULL ,
    is_studio SMALLINT NOT NULL,
    review_status_type_id decimal(3, 0) NOT NULL, -- READY, REVIEWER_ASSIGNED
    creation_time DATETIME YEAR to FRACTION(3),
    creation_user VARCHAR(64),
    modification_time DATETIME YEAR to FRACTION(3),
    modification_user VARCHAR(64),
    ready_for_review_time DATETIME YEAR TO FRACTION(3),
    review_done_time DATETIME YEAR TO FRACTION(3),
    PRIMARY KEY (spec_review_id) constraint spec_review_pk,
    FOREIGN KEY (review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id) constraint spec_review_status_type_fk 
) 
extent size 500 next size 500
lock mode row;

revoke all on "informix".spec_review from "public" as "informix";

create table "informix".spec_review_reviewer_xref 
(
    spec_review_reviewer_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_user_id decimal(10,0),
    review_start_time DATETIME YEAR to FRACTION(3) NOT NULL,
    is_active SMALLINT, -- Would be true only for the last active reviewer.
    creation_user VARCHAR(64),
    creation_time DATETIME YEAR to FRACTION(3),
    PRIMARY KEY (spec_review_reviewer_id) constraint spe_review_reviewer_pk,
    FOREIGN KEY (spec_review_id) REFERENCES spec_review(spec_review_id) constraint spec_review_reviewer_spec_review_fk
) 
extent size 16 next size 16
lock mode row;

revoke all on spec_review_reviewer_xref from public as informix;

create table "informix".spec_section_review (
    spec_section_review_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_status_type_id decimal(3, 0) NOT NULL,
    review_section_type_id decimal(3, 0) NOT NULL,
    create_time DATETIME YEAR to FRACTION(3),
    create_user VARCHAR(64),
    modification_time DATETIME YEAR to FRACTION(3),
    modification_user VARCHAR(64),
    PRIMARY KEY (spec_section_review_id) constraint spec_section_review_pk,
    FOREIGN KEY (spec_review_id) REFERENCES spec_review(spec_review_id) constraint spec_review_section_spec_review_fk ,
    FOREIGN KEY (review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id) constraint spec_review_section_status_fk,
    FOREIGN KEY (review_section_type_id) REFERENCES spec_review_section_type_lu(review_section_type_id) constraint spec_review_section_type_fk
) 
extent size 16 next size 16
lock mode row;

revoke all on spec_section_review from public as informix;

create table "informix".spec_section_review_comment 
(
    comment_id decimal(10,0) NOT NULL,
    spec_section_review_id decimal(10,0) NOT NULL,
    review_comment LVARCHAR(1000) NOT NULL,
    review_user_role_type_id decimal(3, 0) NOT NULL,
    create_user varchar(64),
    create_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY (comment_id) constraint "informix".spec_review_comment_pk,
    FOREIGN KEY (spec_section_review_id) REFERENCES spec_section_review(spec_section_review_id) constraint spec_review_comment_section_review_fk,
    FOREIGN KEY (review_user_role_type_id) REFERENCES spec_review_user_role_type_lu(review_user_role_type_id) constraint spec_review_comment_user_role_fk
) 
extent size 500 next size 500
lock mode row;
revoke all on "informix".spec_section_review_comment from "public" as "informix";

create table "informix".spec_review_comment_view  (
    view_id decimal(10,0) NOT NULL,
    comment_id decimal(10,0) NOT NULL,
    view_user VARCHAR(64),
    view_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY(view_id) constraint spec_review_comment_view_pk,
    FOREIGN KEY(comment_id) REFERENCES spec_section_review_comment(comment_id) constraint spec_review_comment_view_comment_fk
) 
extent size 500 next size 500
lock mode row;
revoke all on "informix".spec_review_comment_view from "public" as "informix";


create table 'informix'.direct_project_type 
(
    direct_project_type_id INT not null,
    name VARCHAR(64) not null,
    PRIMARY KEY (direct_project_type_id) constraint "informix".direct_project_type_pkey
)
extent size 500 next size 500
lock mode row;
revoke all on "informix".direct_project_type from "public" as "informix";


create table 'informix'.direct_project_category (
    direct_project_category_id INT not null,
    direct_project_type_id INT not null,
    name VARCHAR(64) not null,
    PRIMARY KEY(direct_project_category_id) constraint "informix".direct_project_category_pkey
)
extent size 500 next size 500
lock mode row;
revoke all on "informix".direct_project_category from "public" as "informix";


create table 'informix'.direct_project_account  (
    direct_project_account_id INT not null,
    project_id INT not null,
    billing_account_id INT not null,
    PRIMARY KEY(direct_project_account_id) constraint "informix".direct_project_account_pkey
)
extent size 500 next size 500
lock mode row;
revoke all on "informix".direct_project_account from "public" as "informix";


CREATE TABLE 'informix'.project_question(
	question_id INT NOT NULL,
	question_text LVARCHAR(1000) NOT NULL,
	direct_project_type_id INT NOT NULL,
	answer_html_id VARCHAR(45),
	multiple_answers_html_xpath VARCHAR(100)
) 
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;
revoke all on "informix".project_question from "public" as "informix";

CREATE TABLE 'informix'.project_question_option(
	question_option_id INT NOT NULL,
	question_id INT NOT NULL,
	question_option_text LVARCHAR(1000) NOT NULL,
	answer_html_id VARCHAR(45),
	has_associated_textbox BOOLEAN NOT NULL,
	associated_textbox_html_id VARCHAR(45)
) 
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;
revoke all on "informix".project_question_option from "public" as "informix";

CREATE TABLE 'informix'.project_answer(
	answer_id INT NOT NULL,
	question_id INT NOT NULL,
	textual_answer LVARCHAR(4000),
	tc_direct_project_id INT NOT NULL
) 
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;
revoke all on "informix".project_answer from "public" as "informix";

CREATE TABLE 'informix'.project_multiple_answer(
	project_multiple_answer_id INT NOT NULL,
	answer_id INT NOT NULL,
	answer_value VARCHAR(255)
)
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;
revoke all on "informix".project_multiple_answer from "public" as "informix";

CREATE TABLE 'informix'.project_answer_option(
	project_answer_option_id INT NOT NULL,
	answer_id INT NOT NULL,
	question_option_id INT NOT NULL,
	answer_html_value LVARCHAR(1000)
)
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;
revoke all on "informix".project_answer_option from "public" as "informix";


create table 'informix'.tc_direct_project_audit (
	tc_direct_project_audit_id DECIMAL(10, 0) NOT NULL,
	tc_direct_project_id DECIMAL(10, 0) NOT NULL,
	audit_action_type_id INT NOT NULL,				-- the operation type (create, update, delete), refer to audit_action_type_lu
    action_user_id DECIMAL(10,0) NOT NULL,		-- who made the change
    field_name VARCHAR(30) NOT NULL,		-- the field of the change
    old_value VARCHAR(254),		-- the old value of the field
    new_value VARCHAR(254),		-- the new value of the field
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION	-- the timestamp
)
extent size 64 next size 64
lock mode row;

revoke all on tc_direct_project_audit from 'public';

create table 'informix'.user_permission_grant_audit (
    user_permission_grant_audit_id DECIMAL(10, 0) NOT NULL,
    user_permission_grant_id DECIMAL(10, 0) NOT NULL,
    audit_action_type_id  INT NOT NULL,                -- the operation type (create, update, delete), refer to audit_action_type_lu
    user_id DECIMAL(10,0) NOT NULL,
    resource_id DECIMAL(10,0) NOT NULL,
    action_user_id DECIMAL(10,0) NOT NULL,        -- who made the change
    field_name VARCHAR(30) NOT NULL,        -- the field of the change
    old_value VARCHAR(254),        -- the old value of the field
    new_value VARCHAR(254),        -- the new value of the field
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION    -- the timestamp
)

extent size 64 next size 64
lock mode row;
revoke all on user_permission_grant_audit from 'public';

create table 'informix'.audit_action_type_lu (
    audit_action_type_id INT not null,
    name VARCHAR(50) not null,
    description VARCHAR(50) not null,
    create_user VARCHAR(64) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    modify_user VARCHAR(64) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null
) 
extent size 64 next size 64 
lock mode row;
revoke all on "informix".audit_action_type_lu from "public" as "informix";


grant select on "informix".unit_type_lu to "public" as "informix";
grant update on "informix".unit_type_lu to "public" as "informix";
grant insert on "informix".unit_type_lu to "public" as "informix";
grant delete on "informix".unit_type_lu to "public" as "informix";
grant index on "informix".unit_type_lu to "public" as "informix";
grant select on "informix".dual to "public" as "informix";
grant update on "informix".dual to "public" as "informix";
grant insert on "informix".dual to "public" as "informix";
grant delete on "informix".dual to "public" as "informix";
grant index on "informix".dual to "public" as "informix";
grant select on "informix".data_type to "public" as "informix";
grant update on "informix".data_type to "public" as "informix";
grant insert on "informix".data_type to "public" as "informix";
grant delete on "informix".data_type to "public" as "informix";
grant index on "informix".data_type to "public" as "informix";
grant select on "informix".input_lu to "public" as "informix";
grant update on "informix".input_lu to "public" as "informix";
grant insert on "informix".input_lu to "public" as "informix";
grant delete on "informix".input_lu to "public" as "informix";
grant index on "informix".input_lu to "public" as "informix";
grant select on "informix".query to "public" as "informix";
grant update on "informix".query to "public" as "informix";
grant insert on "informix".query to "public" as "informix";
grant delete on "informix".query to "public" as "informix";
grant index on "informix".query to "public" as "informix";
grant select on "informix".command to "public" as "informix";
grant update on "informix".command to "public" as "informix";
grant insert on "informix".command to "public" as "informix";
grant delete on "informix".command to "public" as "informix";
grant index on "informix".command to "public" as "informix";
grant select on "informix".command_group_lu to "public" as "informix";
grant update on "informix".command_group_lu to "public" as "informix";
grant insert on "informix".command_group_lu to "public" as "informix";
grant delete on "informix".command_group_lu to "public" as "informix";
grant index on "informix".command_group_lu to "public" as "informix";
grant select on "informix".query_input_xref to "public" as "informix";
grant update on "informix".query_input_xref to "public" as "informix";
grant insert on "informix".query_input_xref to "public" as "informix";
grant delete on "informix".query_input_xref to "public" as "informix";
grant index on "informix".query_input_xref to "public" as "informix";
grant select on "informix".command_query_xref to "public" as "informix";
grant update on "informix".command_query_xref to "public" as "informix";
grant insert on "informix".command_query_xref to "public" as "informix";
grant delete on "informix".command_query_xref to "public" as "informix";
grant index on "informix".command_query_xref to "public" as "informix";
grant select on "informix".unit to "public" as "informix";
grant update on "informix".unit to "public" as "informix";
grant insert on "informix".unit to "public" as "informix";
grant delete on "informix".unit to "public" as "informix";
grant select on "informix".product to "public" as "informix";
grant update on "informix".product to "public" as "informix";
grant insert on "informix".product to "public" as "informix";
grant delete on "informix".product to "public" as "informix";
grant index on "informix".product to "public" as "informix";
grant select on "informix".product_role_xref to "public" as "informix";
grant update on "informix".product_role_xref to "public" as "informix";
grant insert on "informix".product_role_xref to "public" as "informix";
grant delete on "informix".product_role_xref to "public" as "informix";
grant index on "informix".product_role_xref to "public" as "informix";
grant select on "informix".purchase to "public" as "informix";
grant update on "informix".purchase to "public" as "informix";
grant insert on "informix".purchase to "public" as "informix";
grant delete on "informix".purchase to "public" as "informix";
grant index on "informix".purchase to "public" as "informix";
grant select on "informix".product_unit_xref to "public" as "informix";
grant update on "informix".product_unit_xref to "public" as "informix";
grant insert on "informix".product_unit_xref to "public" as "informix";
grant delete on "informix".product_unit_xref to "public" as "informix";
grant select on "informix".product_country_eligibility to "public" as "informix";
grant update on "informix".product_country_eligibility to "public" as "informix";
grant insert on "informix".product_country_eligibility to "public" as "informix";
grant delete on "informix".product_country_eligibility to "public" as "informix";
grant index on "informix".product_country_eligibility to "public" as "informix";
grant select on "informix".command_execution to "public" as "informix";
grant update on "informix".command_execution to "public" as "informix";
grant insert on "informix".command_execution to "public" as "informix";
grant delete on "informix".command_execution to "public" as "informix";
grant index on "informix".command_execution to "public" as "informix";
grant select on "informix".tc_direct_project to "public" as "informix";
grant update on "informix".tc_direct_project to "public" as "informix";
grant insert on "informix".tc_direct_project to "public" as "informix";
grant delete on "informix".tc_direct_project to "public" as "informix";
grant index on "informix".tc_direct_project to "public" as "informix";
grant select on "informix".permission_type to "public" as "informix";
grant update on "informix".permission_type to "public" as "informix";
grant insert on "informix".permission_type to "public" as "informix";
grant delete on "informix".permission_type to "public" as "informix";
grant select on "informix".user_permission_grant to "public" as "informix";
grant update on "informix".user_permission_grant to "public" as "informix";
grant insert on "informix".user_permission_grant to "public" as "informix";
grant delete on "informix".user_permission_grant to "public" as "informix";

grant select on "informix".spec_review_status_type_lu to "public" as "informix";
grant update on "informix".spec_review_status_type_lu to "public" as "informix";
grant insert on "informix".spec_review_status_type_lu to "public" as "informix";
grant delete on "informix".spec_review_status_type_lu to "public" as "informix";

grant select on "informix".spec_review_section_type_lu to "public" as "informix";
grant update on "informix".spec_review_section_type_lu to "public" as "informix";
grant insert on "informix".spec_review_section_type_lu to "public" as "informix";
grant delete on "informix".spec_review_section_type_lu to "public" as "informix";


grant select on "informix".spec_review_user_role_type_lu to "public" as "informix";
grant update on "informix".spec_review_user_role_type_lu to "public" as "informix";
grant insert on "informix".spec_review_user_role_type_lu to "public" as "informix";
grant delete on "informix".spec_review_user_role_type_lu to "public" as "informix";

grant select on "informix".spec_review to "public" as "informix";
grant update on "informix".spec_review to "public" as "informix";
grant insert on "informix".spec_review to "public" as "informix";
grant delete on "informix".spec_review to "public" as "informix";

grant select on "informix".spec_section_review to "public" as "informix";
grant update on "informix".spec_section_review to "public" as "informix";
grant insert on "informix".spec_section_review to "public" as "informix";
grant delete on "informix".spec_section_review to "public" as "informix";

grant select on "informix".spec_review_reviewer_xref to "public" as "informix";
grant update on "informix".spec_review_reviewer_xref to "public" as "informix";
grant insert on "informix".spec_review_reviewer_xref to "public" as "informix";
grant delete on "informix".spec_review_reviewer_xref to "public" as "informix";

grant select on "informix".spec_section_review_comment to "public" as "informix";
grant update on "informix".spec_section_review_comment to "public" as "informix";
grant insert on "informix".spec_section_review_comment to "public" as "informix";
grant delete on "informix".spec_section_review_comment to "public" as "informix";

grant select on "informix".spec_review_comment_view to "public" as "informix";
grant update on "informix".spec_review_comment_view to "public" as "informix";
grant insert on "informix".spec_review_comment_view to "public" as "informix";
grant delete on "informix".spec_review_comment_view to "public" as "informix";


create sequence "informix".project_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20  order;
Alter sequence "informix".project_sequence restart with 1245;

revoke all on "informix".project_sequence from "public";

create sequence "informix".competition_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20  order;
Alter sequence "informix".competition_sequence restart with 490;

revoke all on "informix".competition_sequence from "public";

create sequence "informix".permission_type_seq increment by 1 maxvalue 9223372036854775807 minvalue 1 cache 20  order;
Alter sequence "informix".permission_type_seq restart with 30;

revoke all on "informix".permission_type_seq from "public";

create sequence "informix".permission_seq increment by 1 maxvalue 9223372036854775807 minvalue 700 cache 20  order;
Alter sequence "informix".permission_seq restart with 822;

revoke all on "informix".permission_seq from "public";

CREATE SEQUENCE "informix".SPEC_REVIEW_SEQ;
revoke all on "informix".SPEC_REVIEW_SEQ from "public";

CREATE SEQUENCE "informix".SPEC_REVIEW_REVIEWER_SEQ;
revoke all on "informix".SPEC_REVIEW_REVIEWER_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_SECTION_REVIEW_SEQ;
revoke all on "informix".SPEC_SECTION_REVIEW_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_REVIEW_STATUS_TYPE_SEQ;
revoke all on "informix".SPEC_REVIEW_STATUS_TYPE_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_REVIEW_SECTION_TYPE_SEQ;
revoke all on "informix".SPEC_REVIEW_SECTION_TYPE_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_SECTION_REVIEW_COMMENT_SEQ;
revoke all on "informix".SPEC_SECTION_REVIEW_COMMENT_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_REVIEW_USER_ROLE_TYPE_SEQ;
revoke all on "informix".SPEC_REVIEW_USER_ROLE_TYPE_SEQ from "public";
CREATE SEQUENCE "informix".SPEC_REVIEW_COMMENT_VIEW_SEQ;
revoke all on "informix".SPEC_REVIEW_COMMENT_VIEW_SEQ from "public";

create sequence "informix".direct_project_type_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

create sequence "informix".direct_project_category_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

create sequence "informix".direct_project_account_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;


grant select on "informix".project_sequence to "public" as "informix";
grant select on "informix".competition_sequence to "public" as "informix";
grant select on "informix".permission_type_seq to "public" as "informix";
grant select on "informix".permission_seq to "public" as "informix";
grant select on "informix".SPEC_REVIEW_SEQ to "public" as "informix";
grant select on "informix".SPEC_REVIEW_STATUS_TYPE_SEQ to "public" as "informix";
grant select on "informix".SPEC_REVIEW_SECTION_TYPE_SEQ to "public" as "informix";
grant select on "informix".SPEC_SECTION_REVIEW_COMMENT_SEQ to "public" as "informix";
grant select on "informix".SPEC_REVIEW_USER_ROLE_TYPE_SEQ to "public" as "informix";
grant select on "informix".SPEC_REVIEW_COMMENT_VIEW_SEQ to "public" as "informix";
grant select on "informix".SPEC_SECTION_REVIEW_SEQ to "public" as "informix";
grant select on "informix".SPEC_REVIEW_REVIEWER_SEQ to "public" as "informix";

grant select on "informix".tc_direct_project_status_lu to "public" as "informix";

grant select on "informix".direct_project_type to "public" as "informix";
grant update on "informix".direct_project_type to "public" as "informix";
grant insert on "informix".direct_project_type to "public" as "informix";
grant delete on "informix".direct_project_type to "public" as "informix";

grant select on "informix".direct_project_category to "public" as "informix";
grant update on "informix".direct_project_category to "public" as "informix";
grant insert on "informix".direct_project_category to "public" as "informix";
grant delete on "informix".direct_project_category to "public" as "informix";

grant select on "informix".direct_project_account to "public" as "informix";
grant update on "informix".direct_project_account to "public" as "informix";
grant insert on "informix".direct_project_account to "public" as "informix";
grant delete on "informix".direct_project_account to "public" as "informix";

grant select on "informix".project_question to "public" as "informix";
grant update on "informix".project_question to "public" as "informix";
grant insert on "informix".project_question to "public" as "informix";
grant delete on "informix".project_question to "public" as "informix";

grant select on "informix".project_question_option to "public" as "informix";
grant update on "informix".project_question_option to "public" as "informix";
grant insert on "informix".project_question_option to "public" as "informix";
grant delete on "informix".project_question_option to "public" as "informix";

grant select on "informix".project_answer to "public" as "informix";
grant update on "informix".project_answer to "public" as "informix";
grant insert on "informix".project_answer to "public" as "informix";
grant delete on "informix".project_answer to "public" as "informix";

grant select on "informix".project_multiple_answer to "public" as "informix";
grant update on "informix".project_multiple_answer to "public" as "informix";
grant insert on "informix".project_multiple_answer to "public" as "informix";
grant delete on "informix".project_multiple_answer to "public" as "informix";

grant select on "informix".project_answer_option to "public" as "informix";
grant update on "informix".project_answer_option to "public" as "informix";
grant insert on "informix".project_answer_option to "public" as "informix";
grant delete on "informix".project_answer_option to "public" as "informix";

CREATE SEQUENCE project_question_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_question_option_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_answer_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_multiple_answer_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_answer_option_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

grant select on tc_direct_project_audit to 'public' as 'informix';
grant index on tc_direct_project_audit to 'public' as 'informix';
grant insert on tc_direct_project_audit to 'public' as 'informix';
grant update on tc_direct_project_audit to 'public' as 'informix';
grant delete on tc_direct_project_audit to 'public' as 'informix';

grant select on user_permission_grant_audit to 'public' as 'informix';
grant index on user_permission_grant_audit to 'public' as 'informix';
grant insert on user_permission_grant_audit to 'public' as 'informix';
grant update on user_permission_grant_audit to 'public' as 'informix';
grant delete on user_permission_grant_audit to 'public' as 'informix';

grant select on "informix".audit_action_type_lu to "public" as "informix";
grant update on "informix".audit_action_type_lu to "public" as "informix";
grant insert on "informix".audit_action_type_lu to "public" as "informix";
grant delete on "informix".audit_action_type_lu to "public" as "informix";

create sequence "informix".tc_direct_project_audit_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20  order;
create sequence "informix".user_permission_grant_audit_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20  order;

