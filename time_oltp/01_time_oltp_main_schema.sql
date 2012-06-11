CREATE DATABASE time_oltp IN datadbs WITH BUFFERED LOG;
database time_oltp;

grant dba to informix ;
grant connect to coder ;
grant connect to time_tracker ;
-- User public does not have connect privilege;
create table 'informix'.id_sequences (
    name VARCHAR(255) not null,
    next_block_start INT not null,
    block_size INT not null,
    exhausted INT not null
)
extent size 16 next size 16
lock mode row;

revoke all on id_sequences from 'public';
create table 'informix'.principal (
    principal_id INT not null,
    principal_name VARCHAR(255)
)
extent size 64 next size 64
lock mode row;

revoke all on principal from 'public';
create table 'informix'.role (
    role_id INT not null,
    role_name VARCHAR(255)
)
extent size 16 next size 16
lock mode row;

revoke all on role from 'public';
create table 'informix'.principal_role (
    principal_id INT not null,
    role_id INT not null
)
extent size 32 next size 32
lock mode row;

revoke all on principal_role from 'public';
create table 'informix'.action (
    action_id INT not null,
    class_name VARCHAR(255) not null,
    action_name VARCHAR(255)
)
extent size 16 next size 16
lock mode row;

revoke all on action from 'public';
create table 'informix'.action_context (
    action_context_id INT not null,
    action_context_name VARCHAR(255),
    action_context_parent_id INT,
    class_name VARCHAR(255) not null
)
extent size 16 next size 16
lock mode row;

revoke all on action_context from 'public';
create table 'informix'.role_action_context_permission (
    role_id INT not null,
    action_id INT not null,
    action_context_id INT not null,
    permission INT not null
)
extent size 16 next size 16
lock mode row;

revoke all on role_action_context_permission from 'public';
create table 'informix'.principal_action_context_permission (
    principal_id INT not null,
    action_id INT not null,
    action_context_id INT not null,
    permission INT not null
)
extent size 16 next size 16
lock mode row;

revoke all on principal_action_context_permission from 'public';
create table 'informix'.state_name (
    state_name_id INT not null,
    name VARCHAR(64) not null,
    abbreviation VARCHAR(2) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on state_name from 'public';
create table 'informix'.address (
    address_id INT not null,
    line1 VARCHAR(100) not null,
    line2 VARCHAR(100),
    city VARCHAR(30) not null,
    country_name_id INT not null,
    state_name_id INT not null,
    zip_code VARCHAR(10) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on address from 'public';
create table 'informix'.company (
    company_id INT not null,
    name VARCHAR(64),
    passcode VARCHAR(64) not null,
    is_deleted SMALLINT,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on company from 'public';
create table 'informix'.user_account (
    user_account_id INT not null,
    company_id INT,
    account_status_id INT not null,
    user_name VARCHAR(64) not null,
    password VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    user_status_id INT,
    user_type_id INT,
    billable_type INT
)
extent size 64 next size 64
lock mode row;

revoke all on user_account from 'public';
create table 'informix'.contact (
    contact_id INT not null,
    first_name VARCHAR(64) not null,
    last_name VARCHAR(64) not null,
    phone VARCHAR(30) not null,
    email VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on contact from 'public';
create table 'informix'.comp_rej_reason (
    company_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_rej_reason from 'public';
create table 'informix'.reject_email (
    reject_email_id INT not null,
    body lvarchar(4096) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on reject_email from 'public';
create table 'informix'.exp_reject_reason (
    expense_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on exp_reject_reason from 'public';
create table 'informix'.comp_exp_type (
    company_id INT not null,
    expense_type_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_exp_type from 'public';
create table 'informix'.project_expense (
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    expense_entry_id INT
)
extent size 256 next size 256
lock mode row;

revoke all on project_expense from 'public';
create table 'informix'.time_reject_reason (
    time_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on time_reject_reason from 'public';
create table 'informix'.comp_task_type (
    company_id INT not null,
    task_type_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_task_type from 'public';
create table 'informix'.project_time (
    project_id INT not null,
    time_entry_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 1024 next size 1024
lock mode row;

revoke all on project_time from 'public';
create table 'informix'.project_manager (
    project_id INT not null,
    user_account_id INT not null,
    pay_rate DECIMAL(9,2),
    cost DECIMAL(5,2) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on project_manager from 'public';
create table 'informix'.client (
    client_id INT not null,
    name VARCHAR(64) not null,
    company_id INT not null,
    payment_term_id INT not null,
    status SMALLINT not null,
    salestax DECIMAL(7,3) not null,
    start_date DATETIME YEAR TO SECOND not null,
    end_date DATETIME YEAR TO SECOND not null,
    code_name VARCHAR(64),
    is_deleted SMALLINT,
    client_status_id INTEGER,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on client from 'public';
create table 'informix'.client_project (
    client_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on client_project from 'public';
create table 'informix'.audit_action (
    audit_action_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on audit_action from 'public';
create table 'informix'.account_status_audit (
    audit_action_id INT not null,
    account_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on account_status_audit from 'public';
create table 'informix'.state_name_audit (
    audit_action_id INT not null,
    state_name_id INT not null,
    name VARCHAR(64) not null,
    abbreviation VARCHAR(2) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on state_name_audit from 'public';
create table 'informix'.reject_reason_audit (
    audit_action_id INT not null,
    reject_reason_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on reject_reason_audit from 'public';
create table 'informix'.address_audit (
    audit_action_id INT not null,
    address_id INT not null,
    line1 VARCHAR(100) not null,
    line2 VARCHAR(100),
    city VARCHAR(30) not null,
    state_name_id INT not null,
    zip_code VARCHAR(10) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on address_audit from 'public';
create table 'informix'.company_audit (
    audit_action_id INT not null,
    company_id INT not null,
    name VARCHAR(64),
    passcode VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on company_audit from 'public';
create table 'informix'.company_address_audit (
    audit_action_id INT not null,
    company_id INT not null,
    address_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on company_address_audit from 'public';
create table 'informix'.user_account_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    company_id INT,
    account_status_id INT not null,
    user_name VARCHAR(64) not null,
    password VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on user_account_audit from 'public';
create table 'informix'.user_address_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    address_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on user_address_audit from 'public';
create table 'informix'.contact_audit (
    audit_action_id INT not null,
    contact_id INT not null,
    first_name VARCHAR(64) not null,
    last_name VARCHAR(64) not null,
    phone VARCHAR(30) not null,
    email VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on contact_audit from 'public';
create table 'informix'.user_contact_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    contact_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on user_contact_audit from 'public';
create table 'informix'.company_contact_audit (
    audit_action_id INT not null,
    company_id INT not null,
    contact_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on company_contact_audit from 'public';
create table 'informix'.comp_rej_reason_audit (
    audit_action_id INT not null,
    company_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_rej_reason_audit from 'public';
create table 'informix'.reject_email_audit (
    audit_action_id INT not null,
    reject_email_id INT not null,
    body VARCHAR(255) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on reject_email_audit from 'public';
create table 'informix'.comp_reject_email_audit (
    audit_action_id INT not null,
    company_id INT not null,
    reject_email_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_reject_email_audit from 'public';
create table 'informix'.expense_status_audit (
    audit_action_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on expense_status_audit from 'public';
create table 'informix'.expense_type_audit (
    audit_action_id INT not null,
    expense_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on expense_type_audit from 'public';
create table 'informix'.expense_entry_audit (
    audit_action_id INT not null,
    expense_entry_id INT not null,
    company_id INT not null,
    expense_type_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(64) not null,
    entry_date DATETIME YEAR TO SECOND not null,
    amount MONEY(16,2) not null,
    billable SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 256 next size 256
lock mode row;

revoke all on expense_entry_audit from 'public';
create table 'informix'.exp_reject_reason_audit (
    audit_action_id INT not null,
    expense_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on exp_reject_reason_audit from 'public';
create table 'informix'.comp_exp_type_audit (
    audit_action_id INT not null,
    company_id INT not null,
    expense_type_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_exp_type_audit from 'public';
create table 'informix'.project_audit (
    audit_action_id INT not null,
    project_id INT not null,
    company_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(64) not null,
    start_date DATETIME YEAR TO SECOND not null,
    end_date DATETIME YEAR TO SECOND not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on project_audit from 'public';
create table 'informix'.project_expense_audit (
    audit_action_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    expense_entry_id INT
)
extent size 256 next size 256
lock mode row;

revoke all on project_expense_audit from 'public';
create table 'informix'.time_status_audit (
    audit_action_id INT not null,
    time_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on time_status_audit from 'public';
create table 'informix'.task_type_audit (
    audit_action_id INT not null,
    task_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on task_type_audit from 'public';
create table 'informix'.time_entry_audit (
    audit_action_id INT not null,
    time_entry_id INT not null,
    company_id INT not null,
    time_status_id INT not null,
    task_type_id INT not null,
    description VARCHAR(64) not null,
    entry_date DATETIME YEAR TO SECOND not null,
    hours FLOAT not null,
    billable SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 1024 next size 1024
lock mode row;

revoke all on time_entry_audit from 'public';
create table 'informix'.time_reject_reason_audit (
    audit_action_id INT not null,
    time_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on time_reject_reason_audit from 'public';
create table 'informix'.comp_task_type_audit (
    audit_action_id INT not null,
    company_id INT not null,
    task_type_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_task_type_audit from 'public';
create table 'informix'.project_time_audit (
    audit_action_id INT not null,
    project_id INT not null,
    time_entry_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 768 next size 768
lock mode row;

revoke all on project_time_audit from 'public';
create table 'informix'.project_manager_audit (
    audit_action_id INT not null,
    project_id INT not null,
    user_account_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on project_manager_audit from 'public';
create table 'informix'.project_worker_audit (
    audit_action_id INT not null,
    project_id INT not null,
    user_account_id INT not null,
    start_date DATETIME YEAR TO SECOND not null,
    end_date DATETIME YEAR TO SECOND not null,
    pay_rate INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on project_worker_audit from 'public';
create table 'informix'.client_audit (
    audit_action_id INT not null,
    client_id INT not null,
    name VARCHAR(64) not null,
    company_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on client_audit from 'public';
create table 'informix'.client_project_audit (
    audit_action_id INT not null,
    client_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on client_project_audit from 'public';
create table 'informix'.dual (
    value INT
)
extent size 16 next size 16
lock mode row;

revoke all on dual from 'public';
create table 'informix'.project_worker (
    project_id INT not null,
    user_account_id INT not null,
    start_date DATETIME YEAR TO SECOND not null,
    end_date DATETIME YEAR TO SECOND not null,
    pay_rate DECIMAL(9,2),
    cost DECIMAL(5,2) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on project_worker from 'public';
create table 'informix'.project (
    project_id INT not null,
    company_id INT not null,
    name VARCHAR(64) not null,
    active SMALLINT not null,
    sales_tax DECIMAL(8,3) not null,
    po_box_number VARCHAR(20) not null,
    payment_terms_id INT not null,
    description VARCHAR(255),
    start_date DATETIME YEAR TO SECOND not null,
    end_date DATETIME YEAR TO SECOND not null,
    project_status_id INTEGER,
    client_id INTEGER,
    parent_project_id INTEGER,
    is_deleted SMALLINT,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    is_manual_prize_setting SMALLINT DEFAULT 0,
    budget DECIMAL(8,3)
)
extent size 32 next size 32
lock mode row;

revoke all on project from 'public';
create table 'informix'.task_type (
    task_type_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on task_type from 'public';
create table 'informix'.time_entry (
    time_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    time_status_id INT not null,
    task_type_id INT not null,
    description VARCHAR(255),
    entry_date DATETIME YEAR TO SECOND not null,
    hours FLOAT not null,
    billable SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 1024 next size 1024
lock mode row;

revoke all on time_entry from 'public';
create table 'informix'.time_status (
    time_status_id INT not null,
    description VARCHAR(255),
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on time_status from 'public';
create table 'informix'.expense_entry (
    expense_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    expense_type_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(255),
    entry_date DATETIME YEAR TO SECOND not null,
    amount MONEY(16,2) not null,
    billable SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    mileage INT
)
extent size 512 next size 512
lock mode row;

revoke all on expense_entry from 'public';
create table 'informix'.expense_status (
    expense_status_id INT not null,
    description VARCHAR(255),
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on expense_status from 'public';
create table 'informix'.expense_type (
    expense_type_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on expense_type from 'public';
create table 'informix'.reject_reason (
    reject_reason_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on reject_reason from 'public';
create table 'informix'.comp_rate (
    company_id INT not null,
    rate_id INT not null,
    rate MONEY(7,3) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on comp_rate from 'public';
create table 'informix'.user_contact_backup (
    user_account_id INT not null,
    contact_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on user_contact_backup from 'public';
create table 'informix'.user_address_backup (
    user_account_id INT not null,
    address_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on user_address_backup from 'public';
create table 'informix'.company_contact_backup (
    company_id INT not null,
    contact_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on company_contact_backup from 'public';
create table 'informix'.company_address_backup (
    company_id INT not null,
    address_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on company_address_backup from 'public';
create table 'informix'.sequence_object (
    name VARCHAR(255),
    id INT,
    current_value INT
)
extent size 32 next size 32
lock mode row;

revoke all on sequence_object from 'public';
create table 'informix'.job (
    jobid INT,
    name VARCHAR(40),
    startdate DATE,
    starttime INT,
    enddate DATE,
    dateunit VARCHAR(60),
    dateunitdays VARCHAR(20),
    dateunitweek VARCHAR(2),
    dateunitmonth VARCHAR(2),
    interval INT,
    recurrence INT,
    active CHAR(1),
    jobtype VARCHAR(20),
    jobcommand VARCHAR(64),
    dependencejobname VARCHAR(60),
    dependencejobstatus VARCHAR(20),
    dependencejobdelay VARCHAR(20)
)
extent size 1500 next size 1500
lock mode row;

revoke all on job from 'public';
create table 'informix'.message (
    messageid INT,
    ownerid INT,
    name VARCHAR(40),
    fromaddress VARCHAR(40),
    subject VARCHAR(40),
    templatetext VARCHAR(1,1),
    recipients TEXT
)
extent size 32 next size 32
lock mode row;

revoke all on message from 'public';
create table 'informix'.group (
    groupid INT,
    name VARCHAR(40)
)
extent size 32 next size 32
lock mode row;

revoke all on group from 'public';
create table 'informix'.groupjob (
    groupid INT,
    jobid INT
)
extent size 32 next size 32
lock mode row;

revoke all on groupjob from 'public';
create table 'informix'.country_name (
    country_name_id INT not null,
    name VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 64 next size 64
lock mode row;

revoke all on country_name from 'public';
create table 'informix'.address_type (
    address_type_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on address_type from 'public';
create table 'informix'.address_relation (
    entity_id INT not null,
    address_type_id INT not null,
    address_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on address_relation from 'public';
create table 'informix'.contact_type (
    contact_type_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on contact_type from 'public';
create table 'informix'.contact_relation (
    entity_id INT not null,
    contact_type_id INT not null,
    contact_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on contact_relation from 'public';
create table 'informix'.payment_terms (
    payment_terms_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    active SMALLINT not null,
    term INT not null
)
extent size 32 next size 32
lock mode row;

revoke all on payment_terms from 'public';
create table 'informix'.application_area (
    app_area_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on application_area from 'public';
create table 'informix'.audit (
    audit_id INT not null,
    app_area_id INT not null,
    client_id INT,
    company_id INT,
    project_id INT,
    account_user_id INT,
    entity_id INT not null,
    table_name VARCHAR(64) not null,
    action_type INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null
)
extent size 20000 next size 20000
lock mode row;

revoke all on audit from 'public';
create table 'informix'.audit_detail (
    audit_detail_id INT not null,
    audit_id INT not null,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    column_name VARCHAR(64) not null
)
extent size 200000 next size 200000
lock mode row;

revoke all on audit_detail from 'public';
create table 'informix'.fix_bill_status (
    fix_bill_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on fix_bill_status from 'public';
create table 'informix'.fix_bill_type (
    fix_bill_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on fix_bill_type from 'public';
create table 'informix'.comp_fb_type (
    company_id INT not null,
    fix_bill_type_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on comp_fb_type from 'public';
create table 'informix'.cut_off_time (
    cut_off_time_id INT not null,
    company_id INT not null,
    cut_off_time DATETIME YEAR TO SECOND not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on cut_off_time from 'public';
create table 'informix'.invoice_status (
    invoice_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on invoice_status from 'public';
create table 'informix'.invoice (
    invoice_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null,
    salestax DECIMAL(7,3) not null,
    payment_terms_id INT not null,
    invoice_number VARCHAR(64),
    po_number VARCHAR(64),
    invoice_date DATE not null,
    due_date DATE not null,
    paid SMALLINT not null,
    company_id INT not null,
    invoice_status_id INT not null
)
extent size 1000 next size 1000
lock mode row;

revoke all on invoice from 'public';
create table 'informix'.fix_bill_entry (
    fix_bill_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    fix_bill_status_id INT not null,
    description VARCHAR(255) not null,
    entry_date DATE not null,
    amount DECIMAL(17,2) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 2500 next size 2000
lock mode row;

revoke all on fix_bill_entry from 'public';
create table 'informix'.fb_reject_reason (
    fix_bill_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 32 next size 32
lock mode row;

revoke all on fb_reject_reason from 'public';
create table 'informix'.project_fix_bill (
    fix_bill_entry_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 400 next size 400
lock mode row;

revoke all on project_fix_bill from 'public';
create table 'informix'.service_details (
    service_detail_id INT not null,
    time_entry_id INT not null,
    invoice_id INT not null,
    rate INT not null,
    amount DECIMAL(16,2) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 7500 next size 5000
lock mode row;

revoke all on service_details from 'public';
create table 'informix'.notify_clients (
    notification_id INT not null,
    client_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 500 next size 500
lock mode row;

revoke all on notify_clients from 'public';
create table 'informix'.notify_projects (
    notification_id INT not null,
    project_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 500 next size 500
lock mode row;

revoke all on notify_projects from 'public';
create table 'informix'.notify_resources (
    notification_id INT not null,
    user_account_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 500 next size 500
lock mode row;

revoke all on notify_resources from 'public';
create table 'informix'.account_status (
    account_status_id INT not null,
    description VARCHAR(255) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on account_status from 'public';
create table 'informix'.comp_rej_email (
    company_id INT not null,
    reject_email_id INT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on comp_rej_email from 'public';
create table 'informix'.rate (
    rate_id INT not null,
    description VARCHAR(255),
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode page;

revoke all on rate from 'public';
create table 'informix'.user_status (
    user_status_id INT not null,
    company_id INT not null,
    description VARCHAR(255) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on user_status from 'public';
create table 'informix'.user_type (
    user_type_id INT not null,
    company_id INT not null,
    description VARCHAR(255) not null,
    active SMALLINT not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 16 next size 16
lock mode row;

revoke all on user_type from 'public';
create table 'informix'.notification (
    notification_id INT not null,
    company_id INT not null,
    from_address VARCHAR(255) not null,
    subject VARCHAR(255) not null,
    message lvarchar(2000) not null,
    last_time_sent DATE,
    next_time_send DATE,
    status SMALLINT not null,
    job_name VARCHAR(40) not null,
    creation_date DATETIME YEAR TO SECOND not null,
    creation_user VARCHAR(64) not null,
    modification_date DATETIME YEAR TO SECOND not null,
    modification_user VARCHAR(64) not null
)
extent size 1000 next size 1000
lock mode row;

revoke all on notification from 'public';
create table 'informix'.data_type (
    data_type_id DECIMAL(5,0),
    data_type_desc VARCHAR(16)
)
extent size 64 next size 64
lock mode row;

revoke all on data_type from 'public';
create table 'informix'.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on command_group_lu from 'public';
create table 'informix'.command (
    command_id DECIMAL(10,0),
    command_desc VARCHAR(100),
    command_group_id DECIMAL(5,0)
)
extent size 64 next size 64
lock mode row;

revoke all on command from 'public';
create table 'informix'.command_execution (
    command_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    execution_time INT
)
extent size 1000000 next size 1000000
lock mode page;

revoke all on command_execution from 'public';
create table 'informix'.query (
    query_id DECIMAL(10,0),
    text TEXT,
    name VARCHAR(100),
    ranking INT,
    column_index INT
)
extent size 500 next size 250
lock mode row;

revoke all on query from 'public';
create table 'informix'.input_lu (
    input_id DECIMAL(10,0),
    input_code VARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on input_lu from 'public';
create table 'informix'.query_input_xref (
    query_id DECIMAL(10,0),
    optional CHAR(1),
    default_value VARCHAR(100),
    input_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on query_input_xref from 'public';
create table 'informix'.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on command_query_xref from 'public';

-- client_user_xref
CREATE TABLE client_user_xref (
  client_id         INTEGER NOT NULL,
  user_id           INTEGER NOT NULL,
  creation_date     DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  creation_user     VARCHAR(64),
  modification_date DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  modification_user VARCHAR(64)
)
extent size 16 next size 16
lock mode row;

revoke all on client_user_xref from 'public';
-- project_user_xref
CREATE TABLE project_user_xref (
  project_id        INTEGER NOT NULL,
  user_id           INTEGER NOT NULL,
  creation_date     DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  creation_user     VARCHAR(64),
  modification_date DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  modification_user VARCHAR(64)
)
extent size 16 next size 16
lock mode row;

revoke all on project_user_xref from 'public';
-- client_status
CREATE TABLE client_status (
  client_status_id  INTEGER NOT NULL,
  name              VARCHAR(64),
  description       VARCHAR(255),
  is_deleted        SMALLINT,
  creation_date     DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  creation_user     VARCHAR(64),
  modification_date DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  modification_user VARCHAR(64)
)
extent size 16 next size 16
lock mode row;

revoke all on client_status from 'public';
-- project_status
CREATE TABLE project_status (
  project_status_id INTEGER NOT NULL,
  name              VARCHAR(64),
  description       VARCHAR(255),
  is_deleted        SMALLINT,
  creation_date     DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  creation_user     VARCHAR(64),
  modification_date DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  modification_user VARCHAR(64)
)
extent size 16 next size 16
lock mode row;

revoke all on project_status from 'public';
-- project_xref
CREATE TABLE project_xref (
  parent_project_id INTEGER NOT NULL,
  child_project_id  INTEGER NOT NULL,
  is_deleted        SMALLINT,
  creation_date     DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  creation_user     VARCHAR(64),
  modification_date DATETIME YEAR TO FRACTION DEFAULT CURRENT YEAR TO FRACTION,
  modification_user VARCHAR(64)
)
extent size 16 next size 16
lock mode row;

revoke all on project_xref from 'public';


CREATE TABLE project_contest_fee(
project_contest_fee_id INTEGER NOT NULL,
project_id INTEGER NOT NULL,
---contest_type VARCHAR(64) NOT NULL,
---sub_type VARCHAR(64),
is_studio smallint NOT NULL,
contest_type_id INTEGER NOT NULL,
contest_fee DECIMAL(5,0),
creation_user VARCHAR(64),
creation_date datetime year to fraction(3),
modification_user VARCHAR(64),
modification_date datetime year to fraction(3),
is_deleted smallint,
name VARCHAR(64)

)
extent size 16 next size 16
lock mode row;

revoke all on project_contest_fee from 'public';


CREATE TABLE project_contest_fee_percentage(
    project_contest_fee_percentage_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    contest_fee_percentage DECIMAL(7,2),
    active BOOLEAN,
    creation_user VARCHAR(64),
    creation_date datetime year to fraction(3),
    modification_user VARCHAR(64),
    modification_date datetime year to fraction(3)
)

extent size 16 next size 16
lock mode row;

revoke all on project_contest_fee_percentage from 'public';


CREATE TABLE customer_platform_fee(
customer_platform_fee_id INTEGER NOT NULL,
client_id INTEGER NOT NULL,
payment_date datetime year to day,
amount DECIMAL(7,2),
creation_user VARCHAR(64),
creation_date datetime year to fraction(3),
modification_user VARCHAR(64),
modification_date datetime year to fraction(3)
)
extent size 16 next size 16
lock mode row;

revoke all on customer_platform_fee from 'public';


grant insert on principal to 'public' as 'informix';

grant select on principal to 'public' as 'informix';

grant update on principal to 'public' as 'informix';

grant index on principal to 'public' as 'informix';

grant delete on principal to 'public' as 'informix';

grant update on role to 'public' as 'informix';

grant select on role to 'public' as 'informix';

grant index on role to 'public' as 'informix';

grant insert on role to 'public' as 'informix';

grant delete on role to 'public' as 'informix';

grant select on principal_role to 'public' as 'informix';

grant index on principal_role to 'public' as 'informix';

grant update on principal_role to 'public' as 'informix';

grant delete on principal_role to 'public' as 'informix';

grant insert on principal_role to 'public' as 'informix';

grant index on action to 'public' as 'informix';

grant insert on action to 'public' as 'informix';

grant update on action to 'public' as 'informix';

grant delete on action to 'public' as 'informix';

grant select on action to 'public' as 'informix';

grant select on action_context to 'public' as 'informix';

grant update on action_context to 'public' as 'informix';

grant delete on action_context to 'public' as 'informix';

grant index on action_context to 'public' as 'informix';

grant insert on action_context to 'public' as 'informix';

grant insert on role_action_context_permission to 'public' as 'informix';

grant index on role_action_context_permission to 'public' as 'informix';

grant select on role_action_context_permission to 'public' as 'informix';

grant update on role_action_context_permission to 'public' as 'informix';

grant delete on role_action_context_permission to 'public' as 'informix';

grant insert on principal_action_context_permission to 'public' as 'informix';

grant update on principal_action_context_permission to 'public' as 'informix';

grant select on principal_action_context_permission to 'public' as 'informix';

grant delete on principal_action_context_permission to 'public' as 'informix';

grant index on principal_action_context_permission to 'public' as 'informix';

grant insert on comp_rej_email to 'public' as 'informix';

grant index on comp_rej_email to 'public' as 'informix';

grant update on comp_rej_email to 'public' as 'informix';

grant select on comp_rej_email to 'public' as 'informix';

grant delete on comp_rej_email to 'public' as 'informix';

grant select on state_name to 'public' as 'informix';

grant insert on state_name to 'public' as 'informix';

grant update on state_name to 'public' as 'informix';

grant delete on state_name to 'public' as 'informix';

grant index on state_name to 'public' as 'informix';

grant update on user_status to 'public' as 'informix';

grant index on user_status to 'public' as 'informix';

grant select on user_status to 'public' as 'informix';

grant delete on user_status to 'public' as 'informix';

grant insert on user_status to 'public' as 'informix';

grant update on address to 'public' as 'informix';

grant delete on address to 'public' as 'informix';

grant insert on address to 'public' as 'informix';

grant index on address to 'public' as 'informix';

grant select on address to 'public' as 'informix';

grant select on company to 'public' as 'informix';

grant update on company to 'public' as 'informix';

grant insert on company to 'public' as 'informix';

grant delete on company to 'public' as 'informix';

grant index on company to 'public' as 'informix';

grant insert on user_type to 'public' as 'informix';

grant select on user_type to 'public' as 'informix';

grant delete on user_type to 'public' as 'informix';

grant index on user_type to 'public' as 'informix';

grant update on user_type to 'public' as 'informix';

grant select on user_account to 'public' as 'informix';

grant insert on user_account to 'public' as 'informix';

grant index on user_account to 'public' as 'informix';

grant delete on user_account to 'public' as 'informix';

grant update on user_account to 'public' as 'informix';

grant insert on notification to 'public' as 'informix';

grant index on notification to 'public' as 'informix';

grant delete on notification to 'public' as 'informix';

grant update on notification to 'public' as 'informix';

grant select on notification to 'public' as 'informix';

grant delete on contact to 'public' as 'informix';

grant select on contact to 'public' as 'informix';

grant index on contact to 'public' as 'informix';

grant insert on contact to 'public' as 'informix';

grant update on contact to 'public' as 'informix';

grant update on data_type to 'public' as 'informix';

grant insert on data_type to 'public' as 'informix';

grant select on data_type to 'public' as 'informix';

grant index on data_type to 'public' as 'informix';

grant delete on data_type to 'public' as 'informix';

grant update on command_group_lu to 'public' as 'informix';

grant insert on command_group_lu to 'public' as 'informix';

grant index on command_group_lu to 'public' as 'informix';

grant select on command_group_lu to 'public' as 'informix';

grant delete on command_group_lu to 'public' as 'informix';

grant insert on comp_rej_reason to 'public' as 'informix';

grant delete on comp_rej_reason to 'public' as 'informix';

grant index on comp_rej_reason to 'public' as 'informix';

grant select on comp_rej_reason to 'public' as 'informix';

grant update on comp_rej_reason to 'public' as 'informix';

grant update on reject_email to 'public' as 'informix';

grant delete on reject_email to 'public' as 'informix';

grant insert on reject_email to 'public' as 'informix';

grant select on reject_email to 'public' as 'informix';

grant index on reject_email to 'public' as 'informix';

grant select on rate to 'public' as 'informix';

grant update on rate to 'public' as 'informix';

grant delete on rate to 'public' as 'informix';

grant index on rate to 'public' as 'informix';

grant insert on rate to 'public' as 'informix';

grant update on expense_type to 'public' as 'informix';

grant delete on expense_type to 'public' as 'informix';

grant select on expense_type to 'public' as 'informix';

grant insert on expense_type to 'public' as 'informix';

grant index on expense_type to 'public' as 'informix';

grant select on reject_reason to 'public' as 'informix';

grant delete on reject_reason to 'public' as 'informix';

grant index on reject_reason to 'public' as 'informix';

grant update on reject_reason to 'public' as 'informix';

grant insert on reject_reason to 'public' as 'informix';

grant insert on expense_status to 'public' as 'informix';

grant index on expense_status to 'public' as 'informix';

grant update on expense_status to 'public' as 'informix';

grant delete on expense_status to 'public' as 'informix';

grant select on expense_status to 'public' as 'informix';

grant index on exp_reject_reason to 'public' as 'informix';

grant update on exp_reject_reason to 'public' as 'informix';

grant select on exp_reject_reason to 'public' as 'informix';

grant delete on exp_reject_reason to 'public' as 'informix';

grant insert on exp_reject_reason to 'public' as 'informix';

grant delete on comp_exp_type to 'public' as 'informix';

grant update on comp_exp_type to 'public' as 'informix';

grant insert on comp_exp_type to 'public' as 'informix';

grant index on comp_exp_type to 'public' as 'informix';

grant select on comp_exp_type to 'public' as 'informix';

grant select on task_type to 'public' as 'informix';

grant insert on task_type to 'public' as 'informix';

grant delete on task_type to 'public' as 'informix';

grant index on task_type to 'public' as 'informix';

grant update on task_type to 'public' as 'informix';

grant update on project_expense to 'public' as 'informix';

grant select on project_expense to 'public' as 'informix';

grant insert on project_expense to 'public' as 'informix';

grant delete on project_expense to 'public' as 'informix';

grant index on project_expense to 'public' as 'informix';

grant update on expense_entry to 'public' as 'informix';

grant index on expense_entry to 'public' as 'informix';

grant insert on expense_entry to 'public' as 'informix';

grant select on expense_entry to 'public' as 'informix';

grant delete on expense_entry to 'public' as 'informix';

grant update on time_entry to 'public' as 'informix';

grant index on time_entry to 'public' as 'informix';

grant insert on time_entry to 'public' as 'informix';

grant select on time_entry to 'public' as 'informix';

grant delete on time_entry to 'public' as 'informix';

grant update on time_status to 'public' as 'informix';

grant select on time_status to 'public' as 'informix';

grant insert on time_status to 'public' as 'informix';

grant delete on time_status to 'public' as 'informix';

grant index on time_status to 'public' as 'informix';

grant select on time_reject_reason to 'public' as 'informix';

grant delete on time_reject_reason to 'public' as 'informix';

grant insert on time_reject_reason to 'public' as 'informix';

grant index on time_reject_reason to 'public' as 'informix';

grant update on time_reject_reason to 'public' as 'informix';

grant insert on comp_task_type to 'public' as 'informix';

grant index on comp_task_type to 'public' as 'informix';

grant delete on comp_task_type to 'public' as 'informix';

grant select on comp_task_type to 'public' as 'informix';

grant update on comp_task_type to 'public' as 'informix';

grant insert on project_time to 'public' as 'informix';

grant index on project_time to 'public' as 'informix';

grant select on project_time to 'public' as 'informix';

grant update on project_time to 'public' as 'informix';

grant delete on project_time to 'public' as 'informix';

grant select on project_manager to 'public' as 'informix';

grant index on project_manager to 'public' as 'informix';

grant insert on project_manager to 'public' as 'informix';

grant delete on project_manager to 'public' as 'informix';

grant update on project_manager to 'public' as 'informix';

grant index on command to 'public' as 'informix';

grant delete on command to 'public' as 'informix';

grant insert on command to 'public' as 'informix';

grant select on command to 'public' as 'informix';

grant update on command to 'public' as 'informix';

grant insert on client to 'public' as 'informix';

grant delete on client to 'public' as 'informix';

grant select on client to 'public' as 'informix';

grant update on client to 'public' as 'informix';

grant index on client to 'public' as 'informix';

grant update on client_project to 'public' as 'informix';

grant delete on client_project to 'public' as 'informix';

grant select on client_project to 'public' as 'informix';

grant insert on client_project to 'public' as 'informix';

grant index on client_project to 'public' as 'informix';

grant update on audit_action to 'public' as 'informix';

grant select on audit_action to 'public' as 'informix';

grant insert on audit_action to 'public' as 'informix';

grant index on audit_action to 'public' as 'informix';

grant delete on audit_action to 'public' as 'informix';

grant select on account_status_audit to 'public' as 'informix';

grant delete on account_status_audit to 'public' as 'informix';

grant index on account_status_audit to 'public' as 'informix';

grant insert on account_status_audit to 'public' as 'informix';

grant update on account_status_audit to 'public' as 'informix';

grant delete on state_name_audit to 'public' as 'informix';

grant index on state_name_audit to 'public' as 'informix';

grant update on state_name_audit to 'public' as 'informix';

grant select on state_name_audit to 'public' as 'informix';

grant insert on state_name_audit to 'public' as 'informix';

grant insert on reject_reason_audit to 'public' as 'informix';

grant delete on reject_reason_audit to 'public' as 'informix';

grant select on reject_reason_audit to 'public' as 'informix';

grant index on reject_reason_audit to 'public' as 'informix';

grant update on reject_reason_audit to 'public' as 'informix';

grant delete on address_audit to 'public' as 'informix';

grant update on address_audit to 'public' as 'informix';

grant index on address_audit to 'public' as 'informix';

grant insert on address_audit to 'public' as 'informix';

grant select on address_audit to 'public' as 'informix';

grant index on company_audit to 'public' as 'informix';

grant insert on company_audit to 'public' as 'informix';

grant select on company_audit to 'public' as 'informix';

grant delete on company_audit to 'public' as 'informix';

grant update on company_audit to 'public' as 'informix';

grant update on company_address_audit to 'public' as 'informix';

grant index on company_address_audit to 'public' as 'informix';

grant insert on company_address_audit to 'public' as 'informix';

grant select on company_address_audit to 'public' as 'informix';

grant delete on company_address_audit to 'public' as 'informix';

grant delete on user_account_audit to 'public' as 'informix';

grant select on user_account_audit to 'public' as 'informix';

grant index on user_account_audit to 'public' as 'informix';

grant insert on user_account_audit to 'public' as 'informix';

grant update on user_account_audit to 'public' as 'informix';

grant delete on user_address_audit to 'public' as 'informix';

grant index on user_address_audit to 'public' as 'informix';

grant select on user_address_audit to 'public' as 'informix';

grant insert on user_address_audit to 'public' as 'informix';

grant update on user_address_audit to 'public' as 'informix';

grant insert on contact_audit to 'public' as 'informix';

grant delete on contact_audit to 'public' as 'informix';

grant select on contact_audit to 'public' as 'informix';

grant update on contact_audit to 'public' as 'informix';

grant index on contact_audit to 'public' as 'informix';

grant select on user_contact_audit to 'public' as 'informix';

grant update on user_contact_audit to 'public' as 'informix';

grant insert on user_contact_audit to 'public' as 'informix';

grant delete on user_contact_audit to 'public' as 'informix';

grant index on user_contact_audit to 'public' as 'informix';

grant index on company_contact_audit to 'public' as 'informix';

grant select on company_contact_audit to 'public' as 'informix';

grant delete on company_contact_audit to 'public' as 'informix';

grant insert on company_contact_audit to 'public' as 'informix';

grant update on company_contact_audit to 'public' as 'informix';

grant index on comp_rej_reason_audit to 'public' as 'informix';

grant insert on comp_rej_reason_audit to 'public' as 'informix';

grant delete on comp_rej_reason_audit to 'public' as 'informix';

grant select on comp_rej_reason_audit to 'public' as 'informix';

grant update on comp_rej_reason_audit to 'public' as 'informix';

grant update on reject_email_audit to 'public' as 'informix';

grant select on reject_email_audit to 'public' as 'informix';

grant delete on reject_email_audit to 'public' as 'informix';

grant insert on reject_email_audit to 'public' as 'informix';

grant index on reject_email_audit to 'public' as 'informix';

grant select on comp_reject_email_audit to 'public' as 'informix';

grant update on comp_reject_email_audit to 'public' as 'informix';

grant insert on comp_reject_email_audit to 'public' as 'informix';

grant delete on comp_reject_email_audit to 'public' as 'informix';

grant index on comp_reject_email_audit to 'public' as 'informix';

grant update on expense_status_audit to 'public' as 'informix';

grant insert on expense_status_audit to 'public' as 'informix';

grant select on expense_status_audit to 'public' as 'informix';

grant index on expense_status_audit to 'public' as 'informix';

grant delete on expense_status_audit to 'public' as 'informix';

grant update on expense_type_audit to 'public' as 'informix';

grant delete on expense_type_audit to 'public' as 'informix';

grant select on expense_type_audit to 'public' as 'informix';

grant index on expense_type_audit to 'public' as 'informix';

grant insert on expense_type_audit to 'public' as 'informix';

grant delete on expense_entry_audit to 'public' as 'informix';

grant insert on expense_entry_audit to 'public' as 'informix';

grant select on expense_entry_audit to 'public' as 'informix';

grant index on expense_entry_audit to 'public' as 'informix';

grant update on expense_entry_audit to 'public' as 'informix';

grant insert on exp_reject_reason_audit to 'public' as 'informix';

grant index on exp_reject_reason_audit to 'public' as 'informix';

grant select on exp_reject_reason_audit to 'public' as 'informix';

grant delete on exp_reject_reason_audit to 'public' as 'informix';

grant update on exp_reject_reason_audit to 'public' as 'informix';

grant select on comp_exp_type_audit to 'public' as 'informix';

grant delete on comp_exp_type_audit to 'public' as 'informix';

grant index on comp_exp_type_audit to 'public' as 'informix';

grant update on comp_exp_type_audit to 'public' as 'informix';

grant insert on comp_exp_type_audit to 'public' as 'informix';

grant insert on project_audit to 'public' as 'informix';

grant index on project_audit to 'public' as 'informix';

grant delete on project_audit to 'public' as 'informix';

grant update on project_audit to 'public' as 'informix';

grant select on project_audit to 'public' as 'informix';

grant delete on project_expense_audit to 'public' as 'informix';

grant insert on project_expense_audit to 'public' as 'informix';

grant index on project_expense_audit to 'public' as 'informix';

grant update on project_expense_audit to 'public' as 'informix';

grant select on project_expense_audit to 'public' as 'informix';

grant select on time_status_audit to 'public' as 'informix';

grant delete on time_status_audit to 'public' as 'informix';

grant update on time_status_audit to 'public' as 'informix';

grant insert on time_status_audit to 'public' as 'informix';

grant index on time_status_audit to 'public' as 'informix';

grant delete on task_type_audit to 'public' as 'informix';

grant insert on task_type_audit to 'public' as 'informix';

grant select on task_type_audit to 'public' as 'informix';

grant index on task_type_audit to 'public' as 'informix';

grant update on task_type_audit to 'public' as 'informix';

grant select on time_entry_audit to 'public' as 'informix';

grant update on time_entry_audit to 'public' as 'informix';

grant delete on time_entry_audit to 'public' as 'informix';

grant index on time_entry_audit to 'public' as 'informix';

grant insert on time_entry_audit to 'public' as 'informix';

grant update on time_reject_reason_audit to 'public' as 'informix';

grant index on time_reject_reason_audit to 'public' as 'informix';

grant select on time_reject_reason_audit to 'public' as 'informix';

grant insert on time_reject_reason_audit to 'public' as 'informix';

grant delete on time_reject_reason_audit to 'public' as 'informix';

grant insert on comp_task_type_audit to 'public' as 'informix';

grant index on comp_task_type_audit to 'public' as 'informix';

grant select on comp_task_type_audit to 'public' as 'informix';

grant delete on comp_task_type_audit to 'public' as 'informix';

grant update on comp_task_type_audit to 'public' as 'informix';

grant delete on project_time_audit to 'public' as 'informix';

grant select on project_time_audit to 'public' as 'informix';

grant index on project_time_audit to 'public' as 'informix';

grant update on project_time_audit to 'public' as 'informix';

grant insert on project_time_audit to 'public' as 'informix';

grant index on project_manager_audit to 'public' as 'informix';

grant update on project_manager_audit to 'public' as 'informix';

grant select on project_manager_audit to 'public' as 'informix';

grant delete on project_manager_audit to 'public' as 'informix';

grant insert on project_manager_audit to 'public' as 'informix';

grant insert on project_worker_audit to 'public' as 'informix';

grant select on project_worker_audit to 'public' as 'informix';

grant delete on project_worker_audit to 'public' as 'informix';

grant index on project_worker_audit to 'public' as 'informix';

grant update on project_worker_audit to 'public' as 'informix';

grant select on client_audit to 'public' as 'informix';

grant delete on client_audit to 'public' as 'informix';

grant insert on client_audit to 'public' as 'informix';

grant update on client_audit to 'public' as 'informix';

grant index on client_audit to 'public' as 'informix';

grant delete on client_project_audit to 'public' as 'informix';

grant index on client_project_audit to 'public' as 'informix';

grant update on client_project_audit to 'public' as 'informix';

grant insert on client_project_audit to 'public' as 'informix';

grant select on client_project_audit to 'public' as 'informix';

grant insert on dual to 'public' as 'informix';

grant select on dual to 'public' as 'informix';

grant index on dual to 'public' as 'informix';

grant update on dual to 'public' as 'informix';

grant delete on dual to 'public' as 'informix';

grant select on project_worker to 'public' as 'informix';

grant index on project_worker to 'public' as 'informix';

grant insert on project_worker to 'public' as 'informix';

grant update on project_worker to 'public' as 'informix';

grant delete on project_worker to 'public' as 'informix';

grant insert on project to 'public' as 'informix';

grant select on project to 'public' as 'informix';

grant update on project to 'public' as 'informix';

grant index on project to 'public' as 'informix';

grant delete on project to 'public' as 'informix';

grant select on comp_rate to 'public' as 'informix';

grant update on comp_rate to 'public' as 'informix';

grant insert on comp_rate to 'public' as 'informix';

grant delete on comp_rate to 'public' as 'informix';

grant index on comp_rate to 'public' as 'informix';

grant insert on job to 'public' as 'informix';

grant select on job to 'public' as 'informix';

grant index on job to 'public' as 'informix';

grant update on job to 'public' as 'informix';

grant delete on job to 'public' as 'informix';

grant delete on message to 'public' as 'informix';

grant select on message to 'public' as 'informix';

grant update on message to 'public' as 'informix';

grant index on message to 'public' as 'informix';

grant insert on message to 'public' as 'informix';

grant select on group to 'public' as 'informix';

grant insert on group to 'public' as 'informix';

grant index on group to 'public' as 'informix';

grant delete on group to 'public' as 'informix';

grant update on group to 'public' as 'informix';

grant delete on command_execution to 'public' as 'informix';

grant insert on command_execution to 'public' as 'informix';

grant update on command_execution to 'public' as 'informix';

grant index on command_execution to 'public' as 'informix';

grant select on command_execution to 'public' as 'informix';

grant index on query to 'public' as 'informix';

grant insert on query to 'public' as 'informix';

grant update on query to 'public' as 'informix';

grant delete on query to 'public' as 'informix';

grant select on query to 'public' as 'informix';

grant delete on input_lu to 'public' as 'informix';

grant insert on input_lu to 'public' as 'informix';

grant update on input_lu to 'public' as 'informix';

grant select on input_lu to 'public' as 'informix';

grant index on input_lu to 'public' as 'informix';

grant select on query_input_xref to 'public' as 'informix';

grant update on query_input_xref to 'public' as 'informix';

grant index on query_input_xref to 'public' as 'informix';

grant insert on query_input_xref to 'public' as 'informix';

grant delete on query_input_xref to 'public' as 'informix';

grant index on command_query_xref to 'public' as 'informix';

grant delete on command_query_xref to 'public' as 'informix';

grant select on command_query_xref to 'public' as 'informix';

grant update on command_query_xref to 'public' as 'informix';

grant insert on command_query_xref to 'public' as 'informix';

grant index on user_contact_backup to 'public' as 'informix';

grant insert on user_contact_backup to 'public' as 'informix';

grant update on user_contact_backup to 'public' as 'informix';

grant delete on user_contact_backup to 'public' as 'informix';

grant select on user_contact_backup to 'public' as 'informix';

grant delete on user_address_backup to 'public' as 'informix';

grant select on user_address_backup to 'public' as 'informix';

grant index on user_address_backup to 'public' as 'informix';

grant update on user_address_backup to 'public' as 'informix';

grant insert on user_address_backup to 'public' as 'informix';

grant update on company_contact_backup to 'public' as 'informix';

grant index on company_contact_backup to 'public' as 'informix';

grant delete on company_contact_backup to 'public' as 'informix';

grant insert on company_contact_backup to 'public' as 'informix';

grant select on company_contact_backup to 'public' as 'informix';

grant insert on company_address_backup to 'public' as 'informix';

grant select on company_address_backup to 'public' as 'informix';

grant index on company_address_backup to 'public' as 'informix';

grant update on company_address_backup to 'public' as 'informix';

grant delete on company_address_backup to 'public' as 'informix';

grant update on sequence_object to 'public' as 'informix';

grant delete on sequence_object to 'public' as 'informix';

grant insert on sequence_object to 'public' as 'informix';

grant index on sequence_object to 'public' as 'informix';

grant select on sequence_object to 'public' as 'informix';

grant index on groupjob to 'public' as 'informix';

grant update on groupjob to 'public' as 'informix';

grant insert on groupjob to 'public' as 'informix';

grant delete on groupjob to 'public' as 'informix';

grant select on groupjob to 'public' as 'informix';

grant index on country_name to 'public' as 'informix';

grant update on country_name to 'public' as 'informix';

grant insert on country_name to 'public' as 'informix';

grant select on country_name to 'public' as 'informix';

grant delete on country_name to 'public' as 'informix';

grant index on address_type to 'public' as 'informix';

grant update on address_type to 'public' as 'informix';

grant select on address_type to 'public' as 'informix';

grant delete on address_type to 'public' as 'informix';

grant insert on address_type to 'public' as 'informix';

grant delete on address_relation to 'public' as 'informix';

grant update on address_relation to 'public' as 'informix';

grant insert on address_relation to 'public' as 'informix';

grant index on address_relation to 'public' as 'informix';

grant select on address_relation to 'public' as 'informix';

grant index on contact_type to 'public' as 'informix';

grant update on contact_type to 'public' as 'informix';

grant select on contact_type to 'public' as 'informix';

grant insert on contact_type to 'public' as 'informix';

grant delete on contact_type to 'public' as 'informix';

grant select on contact_relation to 'public' as 'informix';

grant delete on contact_relation to 'public' as 'informix';

grant update on contact_relation to 'public' as 'informix';

grant index on contact_relation to 'public' as 'informix';

grant insert on contact_relation to 'public' as 'informix';

grant update on payment_terms to 'public' as 'informix';

grant delete on payment_terms to 'public' as 'informix';

grant insert on payment_terms to 'public' as 'informix';

grant index on payment_terms to 'public' as 'informix';

grant select on payment_terms to 'public' as 'informix';

grant select on application_area to 'public' as 'informix';

grant delete on application_area to 'public' as 'informix';

grant update on application_area to 'public' as 'informix';

grant insert on application_area to 'public' as 'informix';

grant index on application_area to 'public' as 'informix';

grant insert on audit to 'public' as 'informix';

grant index on audit to 'public' as 'informix';

grant update on audit to 'public' as 'informix';

grant select on audit to 'public' as 'informix';

grant delete on audit to 'public' as 'informix';

grant update on audit_detail to 'public' as 'informix';

grant index on audit_detail to 'public' as 'informix';

grant delete on audit_detail to 'public' as 'informix';

grant select on audit_detail to 'public' as 'informix';

grant insert on audit_detail to 'public' as 'informix';

grant select on fix_bill_status to 'public' as 'informix';

grant insert on fix_bill_status to 'public' as 'informix';

grant update on fix_bill_status to 'public' as 'informix';

grant index on fix_bill_status to 'public' as 'informix';

grant delete on fix_bill_status to 'public' as 'informix';

grant update on fix_bill_type to 'public' as 'informix';

grant select on fix_bill_type to 'public' as 'informix';

grant insert on fix_bill_type to 'public' as 'informix';

grant delete on fix_bill_type to 'public' as 'informix';

grant index on fix_bill_type to 'public' as 'informix';

grant update on comp_fb_type to 'public' as 'informix';

grant delete on comp_fb_type to 'public' as 'informix';

grant index on comp_fb_type to 'public' as 'informix';

grant select on comp_fb_type to 'public' as 'informix';

grant insert on comp_fb_type to 'public' as 'informix';

grant insert on cut_off_time to 'public' as 'informix';

grant select on cut_off_time to 'public' as 'informix';

grant index on cut_off_time to 'public' as 'informix';

grant update on cut_off_time to 'public' as 'informix';

grant delete on cut_off_time to 'public' as 'informix';

grant update on invoice_status to 'public' as 'informix';

grant select on invoice_status to 'public' as 'informix';

grant insert on invoice_status to 'public' as 'informix';

grant index on invoice_status to 'public' as 'informix';

grant delete on invoice_status to 'public' as 'informix';

grant delete on invoice to 'public' as 'informix';

grant insert on invoice to 'public' as 'informix';

grant select on invoice to 'public' as 'informix';

grant update on invoice to 'public' as 'informix';

grant index on invoice to 'public' as 'informix';

grant index on fix_bill_entry to 'public' as 'informix';

grant update on fix_bill_entry to 'public' as 'informix';

grant delete on fix_bill_entry to 'public' as 'informix';

grant select on fix_bill_entry to 'public' as 'informix';

grant insert on fix_bill_entry to 'public' as 'informix';

grant insert on fb_reject_reason to 'public' as 'informix';

grant select on fb_reject_reason to 'public' as 'informix';

grant delete on fb_reject_reason to 'public' as 'informix';

grant update on fb_reject_reason to 'public' as 'informix';

grant index on fb_reject_reason to 'public' as 'informix';

grant select on project_fix_bill to 'public' as 'informix';

grant index on project_fix_bill to 'public' as 'informix';

grant insert on project_fix_bill to 'public' as 'informix';

grant update on project_fix_bill to 'public' as 'informix';

grant delete on project_fix_bill to 'public' as 'informix';

grant delete on service_details to 'public' as 'informix';

grant update on service_details to 'public' as 'informix';

grant index on service_details to 'public' as 'informix';

grant insert on service_details to 'public' as 'informix';

grant select on service_details to 'public' as 'informix';

grant update on notify_clients to 'public' as 'informix';

grant insert on notify_clients to 'public' as 'informix';

grant delete on notify_clients to 'public' as 'informix';

grant index on notify_clients to 'public' as 'informix';

grant select on notify_clients to 'public' as 'informix';

grant index on notify_projects to 'public' as 'informix';

grant update on notify_projects to 'public' as 'informix';

grant insert on notify_projects to 'public' as 'informix';

grant select on notify_projects to 'public' as 'informix';

grant delete on notify_projects to 'public' as 'informix';

grant select on notify_resources to 'public' as 'informix';

grant delete on notify_resources to 'public' as 'informix';

grant index on notify_resources to 'public' as 'informix';

grant insert on notify_resources to 'public' as 'informix';

grant update on notify_resources to 'public' as 'informix';

grant update on account_status to 'public' as 'informix';

grant insert on account_status to 'public' as 'informix';

grant delete on account_status to 'public' as 'informix';

grant select on account_status to 'public' as 'informix';

grant index on account_status to 'public' as 'informix';

grant update on client_user_xref to 'public' as 'informix';

grant insert on client_user_xref to 'public' as 'informix';

grant delete on client_user_xref to 'public' as 'informix';

grant select on client_user_xref to 'public' as 'informix';

grant index on client_user_xref to 'public' as 'informix';

grant update on project_user_xref to 'public' as 'informix';

grant insert on project_user_xref to 'public' as 'informix';

grant delete on project_user_xref to 'public' as 'informix';

grant select on project_user_xref to 'public' as 'informix';

grant index on project_user_xref to 'public' as 'informix';

grant update on client_status to 'public' as 'informix';

grant insert on client_status to 'public' as 'informix';

grant delete on client_status to 'public' as 'informix';

grant select on client_status to 'public' as 'informix';

grant index on client_status to 'public' as 'informix';

grant update on project_status to 'public' as 'informix';

grant insert on project_status to 'public' as 'informix';

grant delete on project_status to 'public' as 'informix';

grant select on project_status to 'public' as 'informix';

grant index on project_status to 'public' as 'informix';

grant update on project_xref to 'public' as 'informix';

grant insert on project_xref to 'public' as 'informix';

grant delete on project_xref to 'public' as 'informix';

grant select on project_xref to 'public' as 'informix';

grant index on project_xref to 'public' as 'informix';

grant update on project_contest_fee to 'public' as 'informix';

grant insert on project_contest_fee to 'public' as 'informix';

grant delete on project_contest_fee to 'public' as 'informix';

grant select on project_contest_fee to 'public' as 'informix';

grant index on project_contest_fee to 'public' as 'informix';

create sequence PROJECT_CONTEST_FEE_SEQ;


grant select on "informix".PROJECT_CONTEST_FEE_SEQ to "public" as "informix";

CREATE SEQUENCE project_contest_fee_percentage_seq; 

grant select on "informix".project_contest_fee_percentage_seq to "public" as "informix";


grant update on project_contest_fee_percentage to 'public' as 'informix';

grant insert on project_contest_fee_percentage to 'public' as 'informix';

grant delete on project_contest_fee_percentage to 'public' as 'informix';

grant select on project_contest_fee_percentage to 'public' as 'informix';

grant index on project_contest_fee_percentage to 'public' as 'informix';

CREATE SEQUENCE customer_platform_fee_seq; 

grant select on "informix".customer_platform_fee_seq to "public" as "informix";

