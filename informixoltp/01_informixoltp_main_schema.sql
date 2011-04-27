CREATE DATABASE informixoltp IN datadbs WITH BUFFERED LOG;
database informixoltp;

grant dba to informix ;
grant connect to coder ;
grant connect to veredox ;
grant connect to openaim ;
grant connect to truveo ;
grant connect to winformula ;
grant connect to openxtraz ;
-- User public does not have connect privilege;
create table 'informix'.access (
    access_id DECIMAL(2,0),
    access_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on access from 'public';
create table 'informix'.chat_history (
    coder_id DECIMAL(10,0),
    message VARCHAR(255),
    timestamp DATETIME YEAR TO FRACTION,
    round_id DECIMAL(6,0),
    room_id DECIMAL(10,0)
)
extent size 600000 next size 100000
lock mode row;

revoke all on chat_history from 'public';
create table 'informix'.education (
    education_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    degree_id DECIMAL(4,0),
    major VARCHAR(128),
    graduation_year DECIMAL(4,0),
    graduation_month DECIMAL(2,0),
    school_id DECIMAL(10,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on education from 'public';
create table 'informix'.coder_skill (
    coder_id DECIMAL(10,0),
    skill_id DECIMAL(5,0),
    ranking DECIMAL(2,0) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

revoke all on coder_skill from 'public';
create table 'informix'.connection_lock (
    round_id DECIMAL(6,0),
    room_id DECIMAL(10,0),
    locking_column DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on connection_lock from 'public';
create table 'informix'.contact_us (
    contact_us_id DECIMAL(10,0),
    contact_us_subject_id DECIMAL(3,0),
    coder_id DECIMAL(10,0),
    from_address VARCHAR(64),
    message TEXT not null,
    response_sent CHAR(1) default 'N',
    timestamp DATETIME YEAR TO FRACTION not null,
    responder_id DECIMAL(10,0),
    reference_id DECIMAL(8,0),
    system CHAR(1)
)
extent size 1000 next size 500
lock mode row;

revoke all on contact_us from 'public';
create table 'informix'.contact_us_response (
    contact_us_id DECIMAL(10,0) not null,
    responder_id DECIMAL(10,0) not null,
    response TEXT not null,
    contact_us_subject_id DECIMAL(3,0) not null,
    timestamp DATETIME YEAR TO FRACTION not null
)
extent size 64 next size 64
lock mode row;

revoke all on contact_us_response from 'public';
create table 'informix'.contact_us_subject (
    contact_us_subject_id DECIMAL(3,0),
    subject_desc VARCHAR(32) not null,
    status CHAR(1) not null,
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on contact_us_subject from 'public';
create table 'informix'.data_type (
    data_type_id DECIMAL(5,0),
    data_type_desc VARCHAR(16)
)
extent size 64 next size 64
lock mode row;

revoke all on data_type from 'public';
create table 'informix'.degree (
    degree_id DECIMAL(4,0),
    degree_desc VARCHAR(128),
    sort DECIMAL(4,0),
    status_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on degree from 'public';
create table 'informix'.difficulty (
    difficulty_id DECIMAL(2,0),
    difficulty_level VARCHAR(15),
    difficulty_desc VARCHAR(50),
    point_value DECIMAL(5,0)
)
extent size 64 next size 64
lock mode row;

revoke all on difficulty from 'public';
create table 'informix'.group (
    group_id DECIMAL(10,0),
    group_desc VARCHAR(50) not null,
    access_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on group from 'public';
create table 'informix'.group_user (
    group_id DECIMAL(10,0),
    user_id DECIMAL(10,0)
)
extent size 1500 next size 750
lock mode row;

revoke all on group_user from 'public';
create table 'informix'.permission (
    secure_object_id DECIMAL(10,0),
    sector_id DECIMAL(10,0),
    access_id DECIMAL(2,0)
)
extent size 64 next size 64
lock mode row;

revoke all on permission from 'public';
create table 'informix'.question_type (
    question_type_id DECIMAL(3,0),
    question_type_desc VARCHAR(25) not null,
    status_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on question_type from 'public';
create table 'informix'.rating_history (
    column_name VARCHAR(16),
    old_value DECIMAL(8,0),
    new_value DECIMAL(8,0),
    timestamp DATETIME YEAR TO FRACTION not null,
    round_id DECIMAL(6,0),
    coder_id DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION,
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0) default 0,
    new_vol DECIMAL(5,0) default 0,
    old_rating_no_vol DECIMAL(5,0) default 0,
    new_rating_no_vol DECIMAL(5,0) default 0,
    new_num_ratings DECIMAL(6,0),
    old_num_ratings DECIMAL(6,0)
)
extent size 125000 next size 75000
lock mode row;

revoke all on rating_history from 'public';
create table 'informix'.room (
    room_id DECIMAL(10,0),
    round_id DECIMAL(10,0) not null,
    name VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    region_code VARCHAR(3),
    division_id DECIMAL(3,0),
    room_type_id DECIMAL(3,0),
    eligible DECIMAL(1,0),
    unrated DECIMAL(1,0),
    room_limit DECIMAL(5,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on room from 'public';
create table 'informix'.round_component (
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    submit_order DECIMAL(3,0) default 0,
    division_id DECIMAL(3,0),
    difficulty_id DECIMAL(2,0),
    points DECIMAL(7,2),
    open_order DECIMAL(3,0)
)
extent size 250 next size 124
lock mode row;

revoke all on round_component from 'public';
create table 'informix'.segment_type (
    segment_type_id DECIMAL(3,0),
    segment_type_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on segment_type from 'public';
create table 'informix'.round_segment (
    round_id DECIMAL(10,0),
    segment_id DECIMAL(10,0),
    start_time DATETIME YEAR TO FRACTION not null,
    end_time DATETIME YEAR TO FRACTION not null,
    status CHAR(1) not null
)
extent size 250 next size 100
lock mode row;

revoke all on round_segment from 'public';
create table 'informix'.sector (
    sector_id DECIMAL(10,0),
    sector_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on sector from 'public';
create table 'informix'.secure_object (
    secure_object_id DECIMAL(10,0),
    secure_object_type CHAR(1)
)
extent size 1024 next size 1024
lock mode row;

revoke all on secure_object from 'public';
create table 'informix'.skill_type (
    skill_type_id DECIMAL(3,0),
    skill_type_desc VARCHAR(30),
    skill_type_order DECIMAL(3,0) not null,
    status CHAR(1) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on skill_type from 'public';
create table 'informix'.language (
    language_id DECIMAL(3,0),
    language_name VARCHAR(30) not null,
    status CHAR(1) not null,
    language_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on 'informix'.language from 'public';
create table 'informix'.user_type (
    user_type_id DECIMAL(3,0),
    user_type_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on user_type from 'public';
create table 'informix'.contest_nav (
    contest_id DECIMAL(5,0),
    contest_nav_id DECIMAL(1,0),
    task VARCHAR(30),
    command VARCHAR(30)
)
extent size 64 next size 64
lock mode row;

revoke all on contest_nav from 'public';
create table 'informix'.mail_log (
    coder_id DECIMAL(10,0),
    reason VARCHAR(255),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 20000 next size 20000
lock mode row;

revoke all on mail_log from 'public';
create table 'informix'.news (
    news_id DECIMAL(10,0),
    news_type_id CHAR(1),
    headline VARCHAR(255),
    news TEXT,
    new_posting CHAR(1),
    status CHAR(1),
    posting_date DATETIME YEAR TO FRACTION
)
extent size 250 next size 124
lock mode row;

revoke all on news from 'public';
create table 'informix'.audit_coder (
    user_id DECIMAL(10,0),
    column_name VARCHAR(30),
    old_value VARCHAR(150),
    new_value VARCHAR(150),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 15000 next size 10000
lock mode row;

revoke all on audit_coder from 'public';
create table 'informix'.dispute (
    corporate_id DECIMAL(10,0),
    inquiry_id DECIMAL(10,0),
    dispute_id DECIMAL(10,0),
    comment TEXT,
    create_date DATETIME YEAR TO FRACTION,
    response_date DATETIME YEAR TO FRACTION,
    response_comment TEXT
)
extent size 64 next size 64
lock mode row;

revoke all on dispute from 'public';
create table 'informix'.corporate (
    corporate_id DECIMAL(10,0),
    company_id DECIMAL(10,0),
    contact_id DECIMAL(10,0),
    since DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    default_billing_id DECIMAL(10,0),
    last_login DATETIME YEAR TO FRACTION,
    activation_code VARCHAR(17)
)
extent size 64 next size 64
lock mode row;

revoke all on corporate from 'public';
create table 'informix'.ad (
    ad_id DECIMAL(10,0),
    ad_desc VARCHAR(100),
    hit_count DECIMAL(6,0)
)
extent size 64 next size 64
lock mode row;

revoke all on ad from 'public';
create table 'informix'.inquiry (
    corporate_id DECIMAL(10,0),
    inquiry_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    comment TEXT,
    create_date DATETIME YEAR TO FRACTION,
    response_date DATETIME YEAR TO FRACTION,
    status CHAR(1),
    job_posting_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on inquiry from 'public';
create table 'informix'.watch (
    corporate_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    status CHAR(1),
    timestamp DATETIME YEAR TO FRACTION,
    expire_date DATETIME YEAR TO FRACTION,
    rating DECIMAL(5,0)
)
extent size 64 next size 64
lock mode row;

revoke all on watch from 'public';
create table 'informix'.subscription_region (
    subscription_id DECIMAL(10,0),
    region_code VARCHAR(3)
)
extent size 64 next size 64
lock mode row;

revoke all on subscription_region from 'public';
create table 'informix'.subscription (
    subscription_id DECIMAL(10,0),
    corporate_id DECIMAL(10,0),
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    maximum_inquiries DECIMAL(6,0),
    rating_percent DECIMAL(3,2),
    amount_paid DECIMAL(7,2),
    billing_contact_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on subscription from 'public';
create table 'informix'.region_state (
    region_code VARCHAR(3),
    state_code VARCHAR(2),
    user_type_id DECIMAL(2,0)
)
extent size 64 next size 64
lock mode row;

revoke all on region_state from 'public';
create table 'informix'.contest (
    contest_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status CHAR(1) default 'I',
    language_id DECIMAL(3,0),
    group_id DECIMAL(10,0) default -1,
    region_code VARCHAR(3),
    ad_text VARCHAR(250),
    ad_start DATETIME YEAR TO FRACTION,
    ad_end DATETIME YEAR TO FRACTION,
    ad_task VARCHAR(30),
    ad_command VARCHAR(30),
    activate_menu DECIMAL(3,0),
    season_id DECIMAL(6,0)
)
extent size 250 next size 124
lock mode row;

revoke all on contest from 'public';
create table 'informix'.coder (
    coder_id DECIMAL(10,0),
    member_since DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    quote VARCHAR(255),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    language_id DECIMAL(3,0),
    coder_type_id DECIMAL(3,0),
    date_of_birth DATETIME YEAR TO FRACTION,
    comp_country_code VARCHAR(3),
    contact_date DATE
)
extent size 17500 next size 5000
lock mode row;

revoke all on coder from 'public';
create table 'informix'.jiveword (
    wordid DECIMAL(32,0) not null,
    word VARCHAR(30) not null
)
extent size 5000 next size 2000
lock mode row;

revoke all on jiveword from 'public';
create table 'informix'.jiveuserperm (
    forumid DECIMAL(32,0) not null,
    userid DECIMAL(32,0) not null,
    permission DECIMAL(32,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on jiveuserperm from 'public';
create table 'informix'.jivethread (
    threadid DECIMAL(32,0) not null,
    forumid DECIMAL(32,0),
    rootmessageid DECIMAL(32,0) not null,
    name VARCHAR(255),
    creationdate VARCHAR(15),
    modifieddate VARCHAR(15),
    approved DECIMAL(32,0) not null,
    userid DECIMAL(32,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on jivethread from 'public';
create table 'informix'.jivemessageword (
    messageid DECIMAL(32,0) not null,
    wordid DECIMAL(32,0) not null,
    wordcount DECIMAL(32,0) not null,
    forumid DECIMAL(32,0) not null
)
extent size 100000 next size 30000
lock mode row;

revoke all on jivemessageword from 'public';
create table 'informix'.jivemessagetree (
    parentid DECIMAL(32,0) not null,
    childid DECIMAL(32,0) not null
)
extent size 1500 next size 500
lock mode row;

revoke all on jivemessagetree from 'public';
create table 'informix'.jivemessageprop (
    messageid DECIMAL(32,0) not null,
    name VARCHAR(50) not null,
    propvalue VARCHAR(255) not null
)
extent size 64 next size 64
lock mode row;

revoke all on jivemessageprop from 'public';
create table 'informix'.jivemessage (
    messageid DECIMAL(32,0) not null,
    threadid DECIMAL(32,0) default -1,
    subject VARCHAR(255),
    userid DECIMAL(32,0) not null,
    body TEXT,
    modifieddate VARCHAR(15),
    creationdate VARCHAR(15),
    approved DECIMAL(32,0) not null
)
extent size 30000 next size 10000
lock mode row;

revoke all on jivemessage from 'public';
create table 'informix'.jivefilter (
    forumid DECIMAL(32,0) not null,
    filterindex DECIMAL(32,0) not null,
    filterobject BYTE
)
extent size 64 next size 64
lock mode row;

revoke all on jivefilter from 'public';
create table 'informix'.jmsconsumer (
    consumerid DECIMAL(12,0),
    clientname VARCHAR(40),
    consumername VARCHAR(40),
    destid DECIMAL(12,0),
    selector VARCHAR(100),
    nolocal DECIMAL(1,0)
)
extent size 64 next size 64
lock mode row;

revoke all on jmsconsumer from 'public';
create table 'informix'.jmsdestination (
    destid DECIMAL(12,0),
    desttype DECIMAL(12,0),
    destname VARCHAR(60)
)
extent size 64 next size 64
lock mode row;

revoke all on jmsdestination from 'public';
create table 'informix'.jmsmessage (
    messageid DECIMAL(12,0),
    timetolive DECIMAL(12,0),
    destid DECIMAL(12,0),
    state DECIMAL(1,0),
    message TEXT
)
extent size 256 next size 256
lock mode row;

revoke all on jmsmessage from 'public';
create table 'informix'.jmsmessagequeue (
    consumerid DECIMAL(12,0),
    messageid DECIMAL(12,0),
    state DECIMAL(12,0)
)
extent size 64 next size 64
lock mode row;

revoke all on jmsmessagequeue from 'public';
create table 'informix'.jmstableid (
    tablename VARCHAR(16),
    tableid DECIMAL(12,0)
)
extent size 64 next size 64
lock mode row;

revoke all on jmstableid from 'public';
create table 'informix'.dual (
    value INT
)
extent size 64 next size 64
lock mode row;

revoke all on dual from 'public';
create table 'informix'.referral (
    referral_id DECIMAL(3,0),
    referral_desc VARCHAR(50),
    sort DECIMAL(4,0),
    status_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on referral from 'public';
create table 'informix'.editor (
    editor_id DECIMAL(1,0),
    editor_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on editor from 'public';
create table 'informix'.pay_period (
    pay_period_id DECIMAL(1,0),
    pay_period_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on pay_period from 'public';
create table 'informix'.title (
    title_id DECIMAL(3,0),
    title VARCHAR(18),
    title_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on title from 'public';
create table 'informix'.press_release (
    press_release_id DECIMAL(10,0),
    press_release_desc VARCHAR(100),
    hit_count DECIMAL(6,0)
)
extent size 64 next size 64
lock mode row;

revoke all on press_release from 'public';
create table 'informix'.division (
    division_id DECIMAL(3,0),
    division_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on division from 'public';
create table 'informix'.server_connection (
    server_id DECIMAL(5,0),
    connection_id DECIMAL(10,0),
    coder_id DECIMAL(10,0) not null,
    handle VARCHAR(15),
    create_date DATETIME YEAR TO FRACTION,
    client_ip VARCHAR(15)
)
extent size 64 next size 64
lock mode row;

revoke all on server_connection from 'public';
create table 'informix'.sector_access (
    sector_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    access DATETIME YEAR TO FRACTION not null,
    authorized CHAR(1) not null
)
extent size 64 next size 64
lock mode row;

revoke all on sector_access from 'public';
create table 'informix'.sector_file (
    sector_id DECIMAL(10,0) not null,
    file VARCHAR(50) not null,
    system VARCHAR(25),
    status CHAR(1),
    language_cd VARCHAR(2),
    path VARCHAR(255),
    link VARCHAR(255),
    country_code VARCHAR(3),
    modify_by DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on sector_file from 'public';
create table 'informix'.sector_agreement (
    sector_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    agree_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on sector_agreement from 'public';
create table 'informix'.segment (
    segment_id DECIMAL(10,0),
    segment_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on segment from 'public';
create table 'informix'.experience (
    coder_id DECIMAL(10,0),
    experience_id DECIMAL(10,0),
    company VARCHAR(100) not null,
    title VARCHAR(100) not null,
    description lvarchar,
    start_month DECIMAL(2,0) not null,
    start_year DECIMAL(4,0) not null,
    end_month DECIMAL(2,0),
    end_year DECIMAL(4,0),
    city VARCHAR(64) not null,
    state_code VARCHAR(2),
    country_code VARCHAR(3) not null,
    title_id DECIMAL(3,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on experience from 'public';
create table 'informix'.corporate_contact_us (
    corporate_contact_us_id DECIMAL(8,0) not null,
    subject_id DECIMAL(3,0),
    company_name VARCHAR(30),
    company_size DECIMAL(7,0),
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    title VARCHAR(30),
    phone VARCHAR(30),
    email VARCHAR(70),
    response_sent CHAR(1) default 'N',
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    responder_id DECIMAL(10,0),
    state_code VARCHAR(2),
    comment TEXT
)
extent size 64 next size 64
lock mode row;

revoke all on corporate_contact_us from 'public';
create table 'informix'.system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    num_iterations DECIMAL(8,0),
    processing_time DECIMAL(14,0),
    deduction_amount DECIMAL(6,2),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    viewable CHAR(1) default 'N',
    received BYTE,
    succeeded DECIMAL(1,0),
    message VARCHAR(100),
    failure_type_id DECIMAL(3,0),
    score DECIMAL(14,2)
)
extent size 300000 next size 300000
lock mode row;

revoke all on system_test_result from 'public';
create table 'informix'.coder_type (
    coder_type_id DECIMAL(3,0),
    coder_type_desc VARCHAR(50),
    status VARCHAR(1)
)
extent size 64 next size 64
lock mode row;

revoke all on coder_type from 'public';
create table 'informix'.coder_referral (
    coder_id DECIMAL(10,0),
    referral_id DECIMAL(3,0),
    reference_id DECIMAL(10,0),
    other VARCHAR(50)
)
extent size 2500 next size 1000
lock mode row;

revoke all on coder_referral from 'public';
create table 'informix'.problem_statement_history (
    problem_id DECIMAL(10,0),
    problem_statement TEXT,
    modify_date DATETIME YEAR TO FRACTION,
    user_id DECIMAL(10,0)
)
extent size 50000 next size 50000
lock mode row;

revoke all on problem_statement_history from 'public';
create table 'informix'.problem_status_lu (
    problem_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on problem_status_lu from 'public';
create table 'informix'.correspondence (
    correspondence_id DECIMAL(10,0),
    from_coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    group_id DECIMAL(10,0),
    message TEXT,
    sent_time DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    reply_id DECIMAL(10,0),
    component_id DECIMAL(10,0)
)
extent size 15000 next size 10000
lock mode row;

revoke all on correspondence from 'public';
create table 'informix'.correspondence_status (
    correspondence_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on correspondence_status from 'public';
create table 'informix'.mpsqas_chat_history (
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    message TEXT
)
extent size 1000 next size 500
lock mode row;

revoke all on mpsqas_chat_history from 'public';
create table 'informix'.component_user_xref (
    component_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    user_type_id DECIMAL(2,0),
    paid DECIMAL(7,2),
    pending_payment DECIMAL(7,2)
)
extent size 250 next size 100
lock mode row;

revoke all on component_user_xref from 'public';
create table 'informix'.solution (
    solution_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    solution_text TEXT,
    modify_date DATETIME YEAR TO FRACTION,
    solution_class BYTE,
    language_id DECIMAL(3,0),
    package VARCHAR(255)
)
extent size 25000 next size 15000
lock mode row;

revoke all on solution from 'public';
create table 'informix'.component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    system_test_version DECIMAL(10,0) default 1 not null
)
extent size 20000 next size 10000
lock mode row;

revoke all on component_state from 'public';
create table 'informix'.problem_solution (
    problem_id DECIMAL(10,0),
    solution_id DECIMAL(10,0),
    primary_solution CHAR(1)
)
extent size 64 next size 64
lock mode row;

revoke all on problem_solution from 'public';
create table 'informix'.development_application_status (
    dev_app_status_id DECIMAL(3,0),
    dev_app_status_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on development_application_status from 'public';
create table 'informix'.development_application (
    dev_app_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    user_type_id DECIMAL(3,0),
    dev_app_status_id DECIMAL(3,0),
    message TEXT
)
extent size 250 next size 124
lock mode row;

revoke all on development_application from 'public';
create table 'informix'.challenge (
    challenge_id DECIMAL(10,0),
    defendant_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    succeeded DECIMAL(1,0),
    submit_time DECIMAL(15,0) not null,
    challenger_id DECIMAL(10,0) not null,
    args BYTE,
    message VARCHAR(255),
    challenger_points DECIMAL(7,2),
    defendant_points DECIMAL(7,2),
    expected BYTE,
    received BYTE,
    status_id DECIMAL(3,0)
)
extent size 35000 next size 20000
lock mode row;

revoke all on challenge from 'public';
create table 'informix'.invite_list (
    coder_id DECIMAL(10,0),
    seed DECIMAL(4,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    contest_id DECIMAL(10,0),
    tournament_rating DECIMAL(5,0),
    round_id DECIMAL(10,0),
    region_code VARCHAR(3),
    invite_type CHAR(1)
)
extent size 4000 next size 2000
lock mode row;

revoke all on invite_list from 'public';
create table 'informix'.current_school (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    viewable DECIMAL(1,0) default 1
)
extent size 3000 next size 1500
lock mode row;

revoke all on current_school from 'public';
create table 'informix'.current_job (
    coder_id DECIMAL(10),
    record_no DECIMAL(2),
    title VARCHAR(100),
    company VARCHAR(100)
)
extent size 250 next size 124
lock mode row;

revoke all on current_job from 'public';
create table 'informix'.sub_template (
    template_id DECIMAL(10,0),
    sub_template_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on sub_template from 'public';
create table 'informix'.student_rep (
    school_id DECIMAL(10,0),
    coder_id DECIMAL(10,0) not null,
    handle VARCHAR(15),
    division DECIMAL(2,0),
    school_name VARCHAR(50),
    event_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on student_rep from 'public';
create table 'informix'.solution_history (
    solution_id DECIMAL(10,0),
    solution TEXT,
    modify_date DATETIME YEAR TO FRACTION,
    user_id DECIMAL(10,0)
)
extent size 50000 next size 50000
lock mode row;

revoke all on solution_history from 'public';
create table 'informix'.room_type (
    room_type_id DECIMAL(3,0),
    room_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on room_type from 'public';
create table 'informix'.round_registration (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION,
    eligible DECIMAL(3,0),
    team_id DECIMAL(10,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on round_registration from 'public';
create table 'informix'.question_style (
    question_style_id DECIMAL(3,0),
    question_style_desc VARCHAR(25) not null,
    status_id DECIMAL(3,0) not null
)
extent size 16 next size 16
lock mode row;

revoke all on question_style from 'public';
create table 'informix'.answer (
    answer_id DECIMAL(10,0),
    question_id DECIMAL(10,0) not null,
    answer_text VARCHAR(250) not null,
    sort_order DECIMAL(3,0),
    correct DECIMAL(1,0)
)
extent size 250 next size 124
lock mode row;

revoke all on answer from 'public';
create table 'informix'.survey_question (
    survey_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on survey_question from 'public';
create table 'informix'.round_question (
    round_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on round_question from 'public';
create table 'informix'.correspondence_read_xref (
    correspondence_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

revoke all on correspondence_read_xref from 'public';
create table 'informix'.problem_user_request (
    request_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    user_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on problem_user_request from 'public';
create table 'informix'.contract_type_lu (
    contract_type_id DECIMAL(3,0),
    contract_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on contract_type_lu from 'public';
create table 'informix'.image_type_lu (
    image_type_id DECIMAL(3,0),
    image_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on image_type_lu from 'public';
create table 'informix'.image (
    image_id DECIMAL(10,0),
    file_name VARCHAR(50),
    image_type_id DECIMAL(3,0),
    path_id DECIMAL(10,0),
    link VARCHAR(255),
    height DECIMAL(5,0),
    width DECIMAL(5,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    original_file_name VARCHAR(254)
)
extent size 250 next size 124
lock mode row;

revoke all on image from 'public';
create table 'informix'.coder_image_xref (
    coder_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on coder_image_xref from 'public';
create table 'informix'.jiveforum (
    forumid DECIMAL(32,0) not null,
    name VARCHAR(255),
    description lvarchar,
    modifieddate VARCHAR(15),
    creationdate VARCHAR(15),
    moderated DECIMAL(32,0) not null,
    userid DECIMAL(32,0)
)
extent size 64 next size 64
lock mode row;

revoke all on jiveforum from 'public';
create table 'informix'.login (
    login_id DECIMAL(10,0),
    user_id DECIMAL(10,0) not null,
    login_date DATETIME YEAR TO FRACTION not null,
    logout_date DATETIME YEAR TO FRACTION,
    login_message VARCHAR(255),
    logout_message VARCHAR(255)
)
extent size 64 next size 64
lock mode row;

revoke all on login from 'public';
create table 'informix'.project (
    project_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    project_desc VARCHAR(200) not null,
    start_date DATETIME YEAR TO FRACTION,
    deadline_date DATETIME YEAR TO FRACTION,
    status_id DECIMAL(3,0) not null,
    creation_date DATETIME YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION not null,
    completion_date DATETIME YEAR TO FRACTION,
    tech_lead DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on project from 'public';
create table 'informix'.project_issue (
    project_issue_id DECIMAL(10,0),
    issue_text TEXT not null,
    open_date DATETIME YEAR TO FRACTION not null,
    close_date DATETIME YEAR TO FRACTION,
    project_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on project_issue from 'public';
create table 'informix'.project_task (
    project_task_id DECIMAL(10,0),
    project_id DECIMAL(10,0) not null,
    name VARCHAR(50) not null,
    project_task_desc VARCHAR(200) not null,
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status_id DECIMAL(3,0) not null,
    milestone DECIMAL(3,0) not null,
    creation_date DATETIME YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION not null,
    completion_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on project_task from 'public';
create table 'informix'.project_user (
    project_user_id DECIMAL(10,0),
    project_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    role_id DECIMAL(10,0) not null,
    status_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on project_user from 'public';
create table 'informix'.project_user_task (
    project_user_task_id DECIMAL(10,0),
    project_user_id DECIMAL(10,0) not null,
    project_task_id DECIMAL(10,0) not null,
    assign_date DATETIME YEAR TO FRACTION not null,
    status_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on project_user_task from 'public';
create table 'informix'.project_user_update (
    project_user_update_id DECIMAL(10,0),
    project_user_id DECIMAL(10,0) not null,
    project_task_id DECIMAL(10,0),
    update_notes TEXT not null,
    creation_date DATETIME YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION not null
)
extent size 64 next size 64
lock mode row;

revoke all on project_user_update from 'public';
create table 'informix'.status_type_lu (
    status_type_id DECIMAL(3,0),
    status_type_desc VARCHAR(50) not null
)
extent size 64 next size 64
lock mode row;

revoke all on status_type_lu from 'public';
create table 'informix'.request_type_lu (
    request_type_id DECIMAL(3,0),
    request_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on request_type_lu from 'public';
create table 'informix'.path (
    path_id DECIMAL(10,0),
    path VARCHAR(255),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on path from 'public';
create table 'informix'.round_type_lu (
    round_type_id DECIMAL(3,0),
    round_type_desc VARCHAR(100),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 16 next size 16
lock mode row;

revoke all on round_type_lu from 'public';
create table 'informix'.web_content (
    content_id DECIMAL(10,0),
    content_group_id DECIMAL(10,0),
    content TEXT not null,
    content_name VARCHAR(50) not null,
    status_id DECIMAL(3,0),
    language_cd VARCHAR(2),
    country_code VARCHAR(3),
    modify_by DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on web_content from 'public';
create table 'informix'.web_file (
    file_id DECIMAL(10,0),
    file_desc VARCHAR(100),
    image_height DECIMAL(5,0),
    image_width DECIMAL(5,0),
    modify_by DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on web_file from 'public';
create table 'informix'.staging_problem (
    problem_id DECIMAL(10,0),
    result_type_id DECIMAL(5,0) not null,
    method_name VARCHAR(32) not null,
    class_name VARCHAR(32) not null,
    status DECIMAL(3,0),
    default_solution TEXT,
    language_id DECIMAL(3,0),
    param_types BYTE,
    problem_text TEXT,
    group_id DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION,
    proposed_division_id DECIMAL(3,0),
    proposed_difficulty_id DECIMAL(3,0)
)
extent size 128 next size 128
lock mode row;

revoke all on staging_problem from 'public';
create table 'informix'.request (
    request_id DECIMAL(10,0),
    request_type_id DECIMAL(3,0),
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    open_window DATETIME YEAR TO FRACTION,
    open_period DATETIME YEAR TO FRACTION,
    connection_id DECIMAL(10,0),
    server_id DECIMAL(5,0),
    timestamp DATETIME YEAR TO FRACTION,
    close_window DATETIME YEAR TO FRACTION,
    last_request_type_id DECIMAL(3,0)
)
extent size 5000 next size 5000
lock mode row;

revoke all on request from 'public';
create table 'informix'.staging_rating (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(6,0),
    rating DECIMAL(5,0) default 0,
    last_rated_event DATETIME YEAR TO FRACTION,
    num_ratings DECIMAL(6,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    vol DECIMAL(5,0) default 0,
    rating_no_vol DECIMAL(5,0) default 0,
    backup_id DECIMAL(10,0)
)
extent size 2000 next size 500
lock mode row;

revoke all on staging_rating from 'public';
create table 'informix'.staging_room (
    room_id DECIMAL(10,0),
    round_id DECIMAL(10,0) not null,
    name VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    region_code VARCHAR(3),
    division_id DECIMAL(3,0),
    room_type_id DECIMAL(3,0),
    eligible DECIMAL(1,0),
    unrated DECIMAL(1,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_room from 'public';
create table 'informix'.staging_round_problem (
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    submit_order DECIMAL(3,0) default 0,
    division_id DECIMAL(3,0),
    difficulty_id DECIMAL(2,0),
    points DECIMAL(7,2),
    open_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_round_problem from 'public';
create table 'informix'.staging_round_segment (
    round_id DECIMAL(10,0),
    segment_id DECIMAL(10,0),
    start_time DATETIME YEAR TO FRACTION not null,
    end_time DATETIME YEAR TO FRACTION not null,
    status CHAR(1) not null
)
extent size 64 next size 64
lock mode row;

revoke all on staging_round_segment from 'public';
create table 'informix'.staging_contest (
    contest_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status CHAR(1) default 'I',
    language_id DECIMAL(3,0),
    group_id DECIMAL(10,0) default -1,
    region_code VARCHAR(3),
    ad_text VARCHAR(250),
    ad_start DATETIME YEAR TO FRACTION,
    ad_end DATETIME YEAR TO FRACTION,
    ad_task VARCHAR(30),
    ad_command VARCHAR(30),
    activate_menu DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_contest from 'public';
create table 'informix'.staging_challenge (
    challenge_id DECIMAL(10,0),
    defendant_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    succeeded DECIMAL(1,0),
    submit_time DECIMAL(15,0) not null,
    challenger_id DECIMAL(10,0) not null,
    args BYTE,
    message VARCHAR(255),
    challenger_points DECIMAL(7,2),
    defendant_points DECIMAL(7,2),
    expected BYTE,
    received BYTE,
    status_id DECIMAL(3,0),
    backup_id DECIMAL(10,0)
)
extent size 7500 next size 2500
lock mode row;

revoke all on staging_challenge from 'public';
create table 'informix'.staging_invite_list (
    coder_id DECIMAL(10,0),
    seed DECIMAL(4,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    contest_id DECIMAL(10,0),
    tournament_rating DECIMAL(5,0),
    round_id DECIMAL(10,0),
    region_code VARCHAR(3)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_invite_list from 'public';
create table 'informix'.staging_round_registration (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION,
    eligible DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on staging_round_registration from 'public';
create table 'informix'.staging_survey (
    survey_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date DATETIME YEAR TO FRACTION not null,
    end_date DATETIME YEAR TO FRACTION not null,
    status_id DECIMAL(3,0) not null,
    text lvarchar
)
extent size 64 next size 64
lock mode page;

revoke all on staging_survey from 'public';
create table 'informix'.staging_question (
    question_id DECIMAL(10,0),
    question_text lvarchar not null,
    status_id DECIMAL(3,0) not null,
    keyword VARCHAR(64),
    question_type_id DECIMAL(3,0) not null,
    question_style_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on staging_question from 'public';
create table 'informix'.staging_answer (
    answer_id DECIMAL(10,0),
    question_id DECIMAL(10,0) not null,
    answer_text VARCHAR(250) not null,
    sort_order DECIMAL(3,0),
    correct DECIMAL(1,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_answer from 'public';
create table 'informix'.staging_response (
    user_id DECIMAL(10,0),
    question_id DECIMAL(10,0),
    answer_id DECIMAL(10,0),
    response TEXT
)
extent size 64 next size 64
lock mode row;

revoke all on staging_response from 'public';
create table 'informix'.staging_survey_question (
    survey_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_survey_question from 'public';
create table 'informix'.staging_round_question (
    round_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_round_question from 'public';
create table 'informix'.staging_round (
    round_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    name VARCHAR(64) not null,
    status CHAR(1),
    ran_ratings DECIMAL(1,0),
    paid_money DECIMAL(1,0),
    registration_limit DECIMAL(6,0),
    notes lvarchar,
    invitational DECIMAL(3,0),
    round_type_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on staging_round from 'public';
create table 'informix'.staging_room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2),
    room_seed DECIMAL(3,0),
    paid DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    room_placed DECIMAL(3,0),
    attended CHAR(1),
    advanced CHAR(1),
    overall_rank DECIMAL(6,0),
    division_seed DECIMAL(6,0),
    division_placed DECIMAL(6,0),
    round_payment_id DECIMAL(10,0),
    rated_flag DECIMAL(1,0),
    backup_id DECIMAL(10,0),
    new_vol DECIMAL(5,0),
    old_vol DECIMAL(5,0)
)
extent size 2000 next size 1000
lock mode row;

revoke all on staging_room_result from 'public';
create table 'informix'.affidavit_type_lu (
    affidavit_type_desc VARCHAR(100),
    affidavit_type_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on affidavit_type_lu from 'public';
create table 'informix'.contract_payment_xref (
    contract_id DECIMAL(10,0) not null,
    payment_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on contract_payment_xref from 'public';
create table 'informix'.user_tax_form_xref (
    tax_form_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    date_filed DATETIME YEAR TO FRACTION,
    withholding_amount DECIMAL(12,2),
    withholding_percentage DECIMAL(5,5),
    status_id DECIMAL(3,0),
    use_percentage DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on user_tax_form_xref from 'public';
create table 'informix'.payment_note_xref (
    note_id DECIMAL(10,0) not null,
    payment_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on payment_note_xref from 'public';
create table 'informix'.affidavit_note_xref (
    note_id DECIMAL(10,0) not null,
    affidavit_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on affidavit_note_xref from 'public';
create table 'informix'.contract_note_xref (
    contract_id DECIMAL(10,0) not null,
    note_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on contract_note_xref from 'public';
create table 'informix'.payment_detail (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid DATETIME YEAR TO FRACTION,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(255),
    payment_type_id DECIMAL(3,0),
    date_modified DATETIME YEAR TO FRACTION,
    date_due DATETIME YEAR TO FRACTION,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1,
    digital_run_track_id DECIMAL(10,0),
    invoice_number VARCHAR(11)
)
extent size 3000 next size 1000
lock mode row;

revoke all on payment_detail from 'public';
create table 'informix'.payment (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    has_global_ad boolean,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 1000 next size 500
lock mode row;

revoke all on payment from 'public';
create table 'informix'.payment_address (
    payment_address_id DECIMAL(10,0),
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(30),
    state_code VARCHAR(2),
    zip VARCHAR(10),
    country_code VARCHAR(3),
    address3 VARCHAR(254),
    province VARCHAR(64)
)
extent size 500 next size 250
lock mode row;

revoke all on payment_address from 'public';
create table 'informix'.payment_detail_xref (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_detail_xref from 'public';
create table 'informix'.modification_rationale_lu (
    modification_rationale_id DECIMAL(3,0),
    modification_rationale_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on modification_rationale_lu from 'public';
create table 'informix'.affidavit (
    round_id DECIMAL(10,0),
    affidavit_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0),
    status_id DECIMAL(3,0),
    notarized INT,
    affirmed INT,
    payment_id DECIMAL(10,0),
    affidavit_desc VARCHAR(100),
    affidavit_type_id DECIMAL(3,0),
    text TEXT,
    date_created DATETIME YEAR TO FRACTION,
    date_affirmed DATETIME YEAR TO FRACTION
)
extent size 175000 next size 75000
lock mode row;

revoke all on affidavit from 'public';
create table 'informix'.user_tax_form_note_xref (
    user_id DECIMAL(10,0),
    tax_form_id DECIMAL(10,0),
    note_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on user_tax_form_note_xref from 'public';
create table 'informix'.tax_form (
    name VARCHAR(30),
    tax_form_id DECIMAL(10,0) not null,
    text TEXT,
    status_id DECIMAL(3,0),
    tax_form_desc VARCHAR(100),
    default_withholding_amount DECIMAL(12,2),
    default_withholding_percentage DECIMAL(5,5),
    use_percentage DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on tax_form from 'public';
create table 'informix'.contract (
    contract_id DECIMAL(10,0) not null,
    name VARCHAR(100),
    contracted_user_id DECIMAL(10,0),
    text TEXT,
    creation_date DATETIME YEAR TO FRACTION,
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    contract_desc VARCHAR(100),
    status_id DECIMAL(3,0),
    contract_type_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on contract from 'public';
create table 'informix'.affidavit_template (
    affidavit_template_id DECIMAL(10,0),
    country_code VARCHAR(3),
    affidavit_type_id DECIMAL(3,0),
    text TEXT
)
extent size 256 next size 256
lock mode row;

revoke all on affidavit_template from 'public';
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
create table 'informix'.command (
    command_id DECIMAL(10,0),
    command_desc VARCHAR(100),
    command_group_id DECIMAL(5,0)
)
extent size 64 next size 64
lock mode row;

revoke all on command from 'public';
create table 'informix'.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on command_query_xref from 'public';
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
create table 'informix'.input_lu (
    input_id DECIMAL(10,0),
    input_code VARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on input_lu from 'public';
create table 'informix'.sched_job_type_lu (
    sched_job_type_id DECIMAL(5,0) not null,
    job_type_name VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on sched_job_type_lu from 'public';
create table 'informix'.sched_job_status_lu (
    sched_job_status_id DECIMAL(3,0) not null,
    sched_job_status_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on sched_job_status_lu from 'public';
create table 'informix'.sched_job_detail_status_lu (
    sched_job_detail_status_id DECIMAL(3,0) not null,
    sched_job_detail_status_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on sched_job_detail_status_lu from 'public';
create table 'informix'.sched_job (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_type_id DECIMAL(5,0) not null,
    sched_job_status_id DECIMAL(3,0) not null,
    start_after_date DATETIME YEAR TO FRACTION,
    end_before_date DATETIME YEAR TO FRACTION
)
extent size 250 next size 124
lock mode row;

revoke all on sched_job from 'public';
create table 'informix'.email_template_group_lu (
    email_template_group_id DECIMAL(5,0) not null,
    email_template_group_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on email_template_group_lu from 'public';
create table 'informix'.email_template (
    email_template_id DECIMAL(10,0) not null,
    email_template_group_id DECIMAL(5,0) not null,
    email_template_name VARCHAR(100),
    data TEXT
)
extent size 2000 next size 500
lock mode row;

revoke all on email_template from 'public';
create table 'informix'.email_list_group_lu (
    email_list_group_id DECIMAL(5,0) not null,
    email_list_group_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on email_list_group_lu from 'public';
create table 'informix'.email_list (
    email_list_id DECIMAL(10,0) not null,
    email_list_group_id DECIMAL(5,0) not null,
    email_list_name VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on email_list from 'public';
create table 'informix'.email_list_detail (
    email_list_detail_id DECIMAL(10,0) not null,
    email_list_id DECIMAL(10,0) not null,
    data TEXT
)
extent size 3000 next size 1000
lock mode row;

revoke all on email_list_detail from 'public';
create table 'informix'.sched_email_job (
    sched_email_job_id DECIMAL(10,0) not null,
    email_template_id DECIMAL(10,0) not null,
    command_id DECIMAL(10,0) not null,
    email_list_id DECIMAL(10,0) not null,
    from_address VARCHAR(200),
    from_personal VARCHAR(255),
    subject VARCHAR(255)
)
extent size 500 next size 500
lock mode row;

revoke all on sched_email_job from 'public';
create table 'informix'.command_param (
    command_param_id DECIMAL(10,0) not null,
    sched_email_job_id DECIMAL(10,0) not null,
    input_id DECIMAL(10,0) not null,
    param VARCHAR(255)
)
extent size 64 next size 64
lock mode row;

revoke all on command_param from 'public';
create table 'informix'.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on command_group_lu from 'public';
create table 'informix'.user_status_lu (
    user_status_id VARCHAR(3),
    user_status_desc VARCHAR(100)
)
extent size 8 next size 8
lock mode row;

revoke all on user_status_lu from 'public';
create table 'informix'.link_hit (
    link_id DECIMAL(10,0),
    link VARCHAR(255),
    refer VARCHAR(255),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 500 next size 500
lock mode row;

revoke all on link_hit from 'public';
create table 'informix'.status_lu (
    status_id DECIMAL(3,0),
    status_desc VARCHAR(200),
    status_type_id DECIMAL(3,0)
)
extent size 16 next size 16
lock mode row;

revoke all on status_lu from 'public';
create table 'informix'.broadcast_type_lu (
    broadcast_type_id DECIMAL(3,0),
    broadcast_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on broadcast_type_lu from 'public';
create table 'informix'.broadcast (
    broadcast_id DECIMAL(10,0),
    date_sent DATETIME YEAR TO FRACTION,
    message TEXT,
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    sent_by_user_id DECIMAL(10,0),
    broadcast_type_id DECIMAL(3,0),
    status_id DECIMAL(3,0)
)
extent size 500 next size 500
lock mode row;

revoke all on broadcast from 'public';
create table 'informix'.round_payment (
    round_payment_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    paid DECIMAL(12,2),
    payment_type_id DECIMAL(3,0)
)
extent size 2000 next size 1000
lock mode row;

revoke all on round_payment from 'public';
create table 'informix'.sched_control (
    sched_control_id DECIMAL(10,0) not null,
    sched_job_id DECIMAL(10,0) not null
)
extent size 32 next size 32
lock mode row;

revoke all on sched_control from 'public';
create table 'informix'.job_type_lu (
    job_type_id DECIMAL(3,0),
    job_type_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on job_type_lu from 'public';
create table 'informix'.job (
    job_id DECIMAL(10,0) not null,
    job_desc VARCHAR(255),
    company_id DECIMAL(10,0),
    link VARCHAR(255),
    status_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on job from 'public';
create table 'informix'.hit_type_lu (
    hit_type_id DECIMAL(3,0),
    hit_type_desc VARCHAR(50)
)
extent size 64 next size 64
lock mode row;

revoke all on hit_type_lu from 'public';
create table 'informix'.job_hit (
    job_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    hit_type_id DECIMAL(3,0),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 500 next size 250
lock mode row;

revoke all on job_hit from 'public';
create table 'informix'.monitor_function_type_lu (
    monitor_function_type_id DECIMAL(3,0),
    monitor_function_type_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on monitor_function_type_lu from 'public';
create table 'informix'.monitor_function (
    monitor_function_id DECIMAL(10,0),
    name VARCHAR(100),
    monitor_function_desc VARCHAR(255),
    monitor_function_type_id DECIMAL(3,0)
)
extent size 32 next size 32
lock mode row;

revoke all on monitor_function from 'public';
create table 'informix'.monitor_user_round_xref (
    user_id DECIMAL(10,0),
    round_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on monitor_user_round_xref from 'public';
create table 'informix'.group_monitor_function_xref (
    group_id DECIMAL(10,0),
    monitor_function_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on group_monitor_function_xref from 'public';
create table 'informix'.company_user_xref (
    company_id DECIMAL(10,0),
    company_user_code VARCHAR(50),
    user_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode row;

revoke all on company_user_xref from 'public';
create table 'informix'.company_image_xref (
    company_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    status DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on company_image_xref from 'public';
create table 'informix'.coder_confirmation (
    coder_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    code VARCHAR(255)
)
extent size 500 next size 250
lock mode row;

revoke all on coder_confirmation from 'public';
create table 'informix'.component_type_lu (
    component_type_id DECIMAL(3,0),
    component_type_desc VARCHAR(255)
)
extent size 16 next size 16
lock mode row;

revoke all on component_type_lu from 'public';
create table 'informix'.problem_type_lu (
    problem_type_id DECIMAL(3,0) not null,
    problem_type_desc VARCHAR(255) not null
)
extent size 16 next size 16
lock mode row;

revoke all on problem_type_lu from 'public';
create table 'informix'.parameter (
    parameter_id DECIMAL(10,0) not null,
    component_id DECIMAL(10,0) not null,
    data_type_id DECIMAL(5,0) not null,
    name VARCHAR(50) not null,
    sort_order DECIMAL(3,0) not null
)
extent size 512 next size 512
lock mode row;

revoke all on parameter from 'public';
create table 'informix'.component_solution_xref (
    component_id DECIMAL(10,0) not null,
    solution_id DECIMAL(10,0) not null,
    primary_solution DECIMAL(1,0)
)
extent size 250 next size 100
lock mode row;

revoke all on component_solution_xref from 'public';
create table 'informix'.component_status_lu (
    component_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on component_status_lu from 'public';
create table 'informix'.data_type_mapping (
    language_id DECIMAL(3,0) not null,
    display_value VARCHAR(50),
    data_type_id DECIMAL(5,0) not null
)
extent size 16 next size 16
lock mode row;

revoke all on data_type_mapping from 'public';
create table 'informix'.web_service (
    web_service_id DECIMAL(10,0),
    web_service_name VARCHAR(100),
    status_id DECIMAL(3,0)
)
extent size 1024 next size 1024
lock mode row;

revoke all on web_service from 'public';
create table 'informix'.web_service_file_type (
    web_service_file_type_id DECIMAL(10,0),
    description VARCHAR(255)
)
extent size 32 next size 32
lock mode row;

revoke all on web_service_file_type from 'public';
create table 'informix'.web_service_source_file (
    web_service_source_file_id DECIMAL(10,0),
    web_service_file_type_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0),
    language_id DECIMAL(3,0),
    path VARCHAR(255),
    source TEXT
)
extent size 3000 next size 1500
lock mode row;

revoke all on web_service_source_file from 'public';
create table 'informix'.web_service_compilation (
    web_service_source_file_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    web_service_file_type_id DECIMAL(10,0),
    path VARCHAR(255),
    class_file BYTE
)
extent size 1024 next size 1024
lock mode row;

revoke all on web_service_compilation from 'public';
create table 'informix'.component_web_service_xref (
    component_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on component_web_service_xref from 'public';
create table 'informix'.problem_payment (
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    paid DECIMAL(6,2),
    pending DECIMAL(6,2)
)
extent size 1024 next size 64
lock mode row;

revoke all on problem_payment from 'public';
create table 'informix'.component (
    component_id DECIMAL(10,0) not null,
    problem_id DECIMAL(10,0) not null,
    result_type_id DECIMAL(5,0) not null,
    method_name VARCHAR(32) not null,
    class_name VARCHAR(32) not null,
    default_solution TEXT,
    component_type_id DECIMAL(3,0),
    component_text TEXT,
    status_id DECIMAL(3,0),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 45000 next size 15000
lock mode row;

revoke all on component from 'public';
create table 'informix'.file_type_lu (
    file_type_id DECIMAL(3,0),
    file_type_desc VARCHAR(100),
    mime_type VARCHAR(40),
    sort DECIMAL(3,0)
)
extent size 16 next size 16
lock mode row;

revoke all on file_type_lu from 'public';
create table 'informix'.resume (
    resume_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    file_name VARCHAR(100),
    file_type_id DECIMAL(3,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    file BYTE
)
extent size 100000 next size 30000
lock mode row;

revoke all on resume from 'public';
create table 'informix'.campaign (
    campaign_id DECIMAL(10,0),
    campaign_name VARCHAR(100),
    company_id DECIMAL(10,0),
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status_id DECIMAL(3,0),
    campaign_type_id DECIMAL(3,0)
)
extent size 128 next size 128
lock mode row;

revoke all on campaign from 'public';
create table 'informix'.activity (
    activity_id DECIMAL(10,0),
    activity_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on activity from 'public';
create table 'informix'.campaign_activity_xref (
    campaign_id DECIMAL(10,0),
    activity_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on campaign_activity_xref from 'public';
create table 'informix'.campaign_job_xref (
    campaign_id DECIMAL(10,0),
    job_id DECIMAL(10,0),
    status_id DECIMAL(3,0)
)
extent size 128 next size 128
lock mode row;

revoke all on campaign_job_xref from 'public';
create table 'informix'.problem (
    problem_id DECIMAL(10,0),
    name VARCHAR(32) not null,
    status_id DECIMAL(3,0),
    problem_text TEXT,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    proposed_division_id DECIMAL(3,0),
    problem_type_id DECIMAL(3,0),
    proposed_difficulty_id DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION,
    accept_submissions DECIMAL(1,0) default 1
)
extent size 2000 next size 2000
lock mode row;

revoke all on problem from 'public';
create table 'informix'.sched_job_detail (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_detail_id DECIMAL(10,0) not null,
    sched_job_detail_status_id DECIMAL(3,0) not null,
    data TEXT,
    reason VARCHAR(255)
)
extent size 60000 next size 25000
lock mode row;

revoke all on sched_job_detail from 'public';
create table 'informix'.round_image_xref (
    round_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0)
)
extent size 128 next size 128
lock mode row;

revoke all on round_image_xref from 'public';
create table 'informix'.wl_coder (
    round_id INT,
    coder_id INT,
    team_id INT,
    points_sum DECIMAL(6,2),
    qual_points DECIMAL(7,2),
    room_no INT,
    badge_id VARCHAR(128)
)
extent size 16 next size 16
lock mode row;

revoke all on wl_coder from 'public';
create table 'informix'.wl_round (
    round_id INT,
    prize_threshold DECIMAL(7,2)
)
extent size 16 next size 16
lock mode row;

revoke all on wl_round from 'public';
create table 'informix'.wl_team (
    team_id INT,
    team_name VARCHAR(50)
)
extent size 16 next size 16
lock mode row;

revoke all on wl_team from 'public';
create table 'informix'.team_type_lu (
    team_type_id DECIMAL(3,0) not null,
    team_type_desc VARCHAR(50)
)
extent size 16 next size 16
lock mode row;

revoke all on team_type_lu from 'public';
create table 'informix'.team_coder_component_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null,
    component_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    active DECIMAL(3,0),
    time_stamp DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on team_coder_component_xref from 'public';
create table 'informix'.team_coder_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null,
    captain DECIMAL(10,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on team_coder_xref from 'public';
create table 'informix'.problem_web_service_xref (
    problem_id DECIMAL(10,0) not null,
    web_service_id DECIMAL(10,0) not null
)
extent size 32 next size 32
lock mode row;

revoke all on problem_web_service_xref from 'public';
create table 'informix'.web_service_java_doc (
    web_service_java_doc_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0),
    path VARCHAR(255),
    content TEXT
)
extent size 1000 next size 1000
lock mode row;

revoke all on web_service_java_doc from 'public';
create table 'informix'.compilation (
    component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    compilation_text TEXT,
    compilation_class_file BYTE,
    language_id DECIMAL(3,0)
)
extent size 600000 next size 300000
lock mode row;

revoke all on compilation from 'public';
create table 'informix'.submission (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submission_class_file BYTE,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(7,2),
    language_id DECIMAL(3,0)
)
extent size 600000 next size 300000
lock mode row;

revoke all on submission from 'public';
create table 'informix'.donation_type_lu (
    donation_type_id DECIMAL(3,0),
    donation_type_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on donation_type_lu from 'public';
create table 'informix'.charity_donation (
    coder_id DECIMAL(10,0),
    amount DECIMAL(9,2),
    donation_type_id DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on charity_donation from 'public';
create table 'informix'.question (
    question_id DECIMAL(10,0),
    question_text lvarchar not null,
    status_id DECIMAL(3,0) not null,
    keyword VARCHAR(64),
    question_type_id DECIMAL(3,0) not null,
    question_style_id DECIMAL(3,0) not null,
    is_required DECIMAL(1,0)
)
extent size 250 next size 124
lock mode row;

revoke all on question from 'public';
create table 'informix'.problem_rating_question (
    question_id DECIMAL(10,0),
    question VARCHAR(255),
    question_desc VARCHAR(254),
    modify_date DATETIME YEAR TO FRACTION,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 16
lock mode row;

revoke all on problem_rating_question from 'public';
create table 'informix'.problem_rating (
    question_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    problem_rating INT,
    modify_date DATETIME YEAR TO FRACTION,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 3000 next size 3000
lock mode row;

revoke all on problem_rating from 'public';
create table 'informix'.question_image_xref (
    question_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on question_image_xref from 'public';
create table 'informix'.staging_component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
extent size 2000 next size 1000
lock mode page;

revoke all on staging_component_state from 'public';
create table 'informix'.round_room_assignment (
    round_id DECIMAL(10,0),
    coders_per_room DECIMAL(10,0),
    algorithm DECIMAL(2,0),
    by_division DECIMAL(1,0),
    by_region DECIMAL(1,0),
    final DECIMAL(1,0),
    p DECIMAL(10,2)
)
extent size 16 next size 16
lock mode row;

revoke all on round_room_assignment from 'public';
create table 'informix'.round_terms (
    round_id DECIMAL(10,0),
    terms_content TEXT
)
extent size 500 next size 500
lock mode row;

revoke all on round_terms from 'public';
create table 'informix'.round_terms_acceptance (
    round_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 500 next size 500
lock mode row;

revoke all on round_terms_acceptance from 'public';
create table 'informix'.backup (
    backup_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    timestamp DATETIME YEAR TO FRACTION not null,
    comment VARCHAR(254)
)
extent size 16 next size 16
lock mode row;

revoke all on backup from 'public';
create table 'informix'.backup_tables (
    backup_id DECIMAL(10,0) not null,
    table_name VARCHAR(18) not null
)
extent size 64 next size 32
lock mode row;

revoke all on backup_tables from 'public';
create table 'informix'.component_category_lu (
    component_category_id DECIMAL(3,0) not null,
    component_category_desc VARCHAR(255) not null
)
extent size 16 next size 16
lock mode row;

revoke all on component_category_lu from 'public';
create table 'informix'.component_category_xref (
    component_id DECIMAL(10,0) not null,
    component_category_id DECIMAL(3,0) not null
)
extent size 32 next size 32
lock mode row;

revoke all on component_category_xref from 'public';
create table 'informix'.campaign_round_xref (
    campaign_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on campaign_round_xref from 'public';
create table 'informix'.campaign_type_lu (
    campaign_type_id DECIMAL(3,0) not null,
    campaign_type_desc VARCHAR(100),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 32 next size 32
lock mode row;

revoke all on campaign_type_lu from 'public';
create table 'informix'.skill (
    skill_id DECIMAL(5,0),
    skill_type_id DECIMAL(3,0),
    skill_desc VARCHAR(128) not null,
    status CHAR(1) not null,
    skill_order DECIMAL(3,0) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on skill from 'public';
create table 'informix'.coder_skill_type_note_xref (
    coder_id DECIMAL(10,0) not null,
    skill_type_id DECIMAL(3,0) not null,
    note_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on coder_skill_type_note_xref from 'public';
create table 'informix'.staging_submission (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submission_class_file BYTE,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(7,2),
    language_id DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
extent size 4000 next size 4000
lock mode page;

revoke all on staging_submission from 'public';
create table 'informix'.staging_compilation (
    component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    compilation_text TEXT,
    compilation_class_file BYTE,
    language_id DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
extent size 4000 next size 4000
lock mode page;

revoke all on staging_compilation from 'public';
create table 'informix'.staging_system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    num_iterations DECIMAL(8,0),
    processing_time DECIMAL(14,0),
    deduction_amount DECIMAL(6,2),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    viewable CHAR(1) default 'N',
    received BYTE,
    succeeded DECIMAL(1,0),
    message VARCHAR(100),
    backup_id DECIMAL(10,0)
)
extent size 4000 next size 4000
lock mode row;

revoke all on staging_system_test_result from 'public';
create table 'informix'.staging_system_test_case (
    test_case_id DECIMAL(10,0),
    problem_id DECIMAL(10,0) not null,
    args BYTE,
    expected_result BYTE,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 1000 next size 1000
lock mode row;

revoke all on staging_system_test_case from 'public';
create table 'informix'.system_test_case (
    test_case_id DECIMAL(10,0),
    component_id DECIMAL(10,0) not null,
    args BYTE,
    expected_result BYTE,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    status DECIMAL(3,0),
    example_flag DECIMAL(1,0),
    system_flag DECIMAL(1,0) default 0 not null
)
extent size 10000 next size 10000
lock mode row;

revoke all on system_test_case from 'public';
create table 'informix'.country_affidavit_template_xref (
    country_code VARCHAR(3),
    affidavit_template_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode row;

revoke all on country_affidavit_template_xref from 'public';
create table 'informix'.practice_room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2)
)
extent size 2000 next size 1000
lock mode page;

revoke all on practice_room_result from 'public';
create table 'informix'.practice_component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0)
)
extent size 5000 next size 3000
lock mode page;

revoke all on practice_component_state from 'public';
create table 'informix'.message_status_lu (
    message_status_id DECIMAL(3,0),
    message_status_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on message_status_lu from 'public';
create table 'informix'.message (
    message_id DECIMAL(10,0),
    message TEXT,
    begin_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status_id DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION
)
extent size 300 next size 300
lock mode row;

revoke all on message from 'public';
create table 'informix'.user_message_status_lu (
    user_message_status_id DECIMAL(3,0),
    user_message_status_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on user_message_status_lu from 'public';
create table 'informix'.user_message (
    message_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    status_id DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION
)
extent size 65000 next size 65000
lock mode row;

revoke all on user_message from 'public';
create table 'informix'.failure_type_lu (
    failure_type_id DECIMAL(3,0),
    failure_type_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on failure_type_lu from 'public';
create table 'informix'.jms_messages (
    messageid INT not null,
    destination VARCHAR(150) not null,
    txid INT,
    txop CHAR(1),
    messageblob blob
)
extent size 64 next size 64
lock mode row;

revoke all on jms_messages from 'public';
create table 'informix'.jms_transactions (
    txid INT
)
extent size 64 next size 64
lock mode row;

revoke all on jms_transactions from 'public';
create table 'informix'.jms_users (
    userid VARCHAR(32) not null,
    passwd VARCHAR(32) not null,
    clientid VARCHAR(128)
)
extent size 64 next size 64
lock mode row;

revoke all on jms_users from 'public';
create table 'informix'.jms_roles (
    roleid VARCHAR(32) not null,
    userid VARCHAR(32) not null
)
extent size 64 next size 64
lock mode row;

revoke all on jms_roles from 'public';
create table 'informix'.jms_subscriptions (
    clientid VARCHAR(128) not null,
    subname VARCHAR(128) not null,
    topic VARCHAR(255) not null,
    selector VARCHAR(255)
)
extent size 64 next size 64
lock mode row;

revoke all on jms_subscriptions from 'public';
create table 'informix'.solution_class_file (
    solution_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file BYTE
)
extent size 20000 next size 7500
lock mode row;

revoke all on solution_class_file from 'public';
create table 'informix'.survey (
    survey_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date DATETIME YEAR TO FRACTION not null,
    end_date DATETIME YEAR TO FRACTION not null,
    status_id DECIMAL(3,0) not null,
    text lvarchar,
    results_viewable DECIMAL(1,0) default 1
)
extent size 64 next size 64
lock mode row;

revoke all on survey from 'public';
create table 'informix'.long_test_queue_status_lu (
    status_id DECIMAL(1,0),
    description VARCHAR(255)
)
extent size 16 next size 16
lock mode row;

revoke all on long_test_queue_status_lu from 'public';
create table 'informix'.intro_event_property_lu (
    property_id DECIMAL(5,0),
    property_desc VARCHAR(100),
    property_type_id DECIMAL(3,0),
    mandatory_ind DECIMAL(1,0) default 1,
    default_value VARCHAR(50),
    explanation VARCHAR(100),
    viewable_ind DECIMAL(1,0) default 1 not null
)
extent size 16 next size 16
lock mode row;

revoke all on intro_event_property_lu from 'public';
create table 'informix'.intro_event_config (
    event_id DECIMAL(10,0),
    property_id DECIMAL(5,0),
    property_value lvarchar
)
extent size 100 next size 100
lock mode row;

revoke all on intro_event_config from 'public';
create table 'informix'.intro_event (
    event_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    forum_id DECIMAL(10,0),
    timezone_id DECIMAL(5,0) default 143,
    image_id DECIMAL(10,0),
    eligibility_command_id DECIMAL(10,0),
    prize_desc VARCHAR(100),
    competition_round_id DECIMAL(10,0)
)
extent size 16 next size 16
lock mode row;

revoke all on intro_event from 'public';
create table 'informix'.system_test_output (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    stdout TEXT,
    stderr TEXT
)
extent size 200000 next size 200000
lock mode row;

revoke all on system_test_output from 'public';
create table 'informix'.long_component_state (
    long_component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(14,2),
    status_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    example_submission_number DECIMAL(3,0)
)
extent size 20000 next size 10000
lock mode row;

revoke all on long_component_state from 'public';
create table 'informix'.long_compilation (
    long_component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    compilation_text TEXT,
    language_id DECIMAL(3,0)
)
extent size 600000 next size 300000
lock mode row;

revoke all on long_compilation from 'public';
create table 'informix'.long_comp_result (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(14,2),
    attended CHAR(1),
    placed DECIMAL(6,0),
    system_point_total DECIMAL(14,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    rated_ind DECIMAL(1,0) default 0,
    advanced CHAR(1) default 'N'
)
extent size 10000 next size 7500
lock mode row;

revoke all on long_comp_result from 'public';
create table 'informix'.long_submission (
    long_component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    submission_text TEXT,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(14,2),
    language_id DECIMAL(3,0)
)
extent size 600000 next size 300000
lock mode row;

revoke all on long_submission from 'public';
create table 'informix'.long_system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    processing_time DECIMAL(14,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    fatal_errors BYTE,
    score FLOAT,
    test_action DECIMAL(2,0) default 10 not null
)
extent size 300000 next size 300000
lock mode row;

revoke all on long_system_test_result from 'public';
create table 'informix'.long_system_test_output (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    stdout TEXT,
    stderr TEXT
)
extent size 200000 next size 200000
lock mode row;

revoke all on long_system_test_output from 'public';
create table 'informix'.long_test_queue (
    long_component_state_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    status_id DECIMAL(1,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    test_action DECIMAL(2,0) default 10 not null,
    language_id DECIMAL(3,0),
    round_type_id DECIMAL(3,0)
)
extent size 512 next size 512
lock mode row;

revoke all on long_test_queue from 'public';
create table 'informix'.compilation_class_file (
    component_state_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file BYTE
)
extent size 500000 next size 300000
lock mode row;

revoke all on compilation_class_file from 'public';
create table 'informix'.submission_class_file (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file BYTE
)
extent size 500000 next size 300000
lock mode row;

revoke all on submission_class_file from 'public';
create table 'informix'.archive_sched_job_detail (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_detail_id DECIMAL(10,0) not null,
    sched_job_detail_status_id DECIMAL(3,0) not null,
    data TEXT,
    insert_date DATETIME YEAR TO FRACTION,
    reason VARCHAR(255)
)
extent size 500000 next size 300000
lock mode row;

revoke all on archive_sched_job_detail from 'public';
create table 'informix'.long_submission_class_file (
    long_component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file BYTE
)
extent size 500000 next size 300000
lock mode row;

revoke all on long_submission_class_file from 'public';
create table 'informix'.ltg_type_lu (
    type_id DECIMAL(3,0) not null,
    type VARCHAR(100) not null
)
extent size 16 next size 16
lock mode row;

revoke all on ltg_type_lu from 'public';
create table 'informix'.ltg_status_lu (
    status_id DECIMAL(3,0) not null,
    status VARCHAR(100) not null
)
extent size 16 next size 16
lock mode row;

revoke all on ltg_status_lu from 'public';
create table 'informix'.long_test_group (
    ltg_id DECIMAL(12,0) not null,
    type_id DECIMAL(3,0) not null,
    status_id DECIMAL(3,0) not null,
    pending_tests DECIMAL(4,0) not null,
    last_ltc_id DECIMAL(12,0),
    component_id DECIMAL(10,0) not null,
    solution_id DECIMAL(10,0),
    status_date DATETIME YEAR TO FRACTION not null
)
extent size 128 next size 128
lock mode row;

revoke all on long_test_group from 'public';
create table 'informix'.ltc_status_lu (
    status_id DECIMAL(3,0) not null,
    status VARCHAR(100) not null
)
extent size 16 next size 16
lock mode row;

revoke all on ltc_status_lu from 'public';
create table 'informix'.long_test_case (
    ltc_id DECIMAL(12,0) not null,
    status_id DECIMAL(3,0) not null,
    arg TEXT,
    test_case_id DECIMAL(10,0),
    ltg_id DECIMAL(12,0) not null
)
extent size 1024 next size 1024
lock mode row;

revoke all on long_test_case from 'public';
create table 'informix'.long_test_result (
    success DECIMAL(1,0) not null,
    message TEXT,
    score FLOAT not null,
    create_date DATETIME YEAR TO FRACTION not null,
    stdout TEXT,
    stderr TEXT,
    ltc_id DECIMAL(12,0) not null,
    processing_time DECIMAL(14,0)
)
extent size 10000 next size 10000
lock mode row;

revoke all on long_test_result from 'public';
create table 'informix'.long_test_queue_mpsqas (
    language_id DECIMAL(3,0) not null,
    round_type_id DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION not null,
    ltc_id DECIMAL(12,0) not null
)
extent size 512 next size 512
lock mode row;

revoke all on long_test_queue_mpsqas from 'public';
create table 'informix'.mpsqas_user_ltg_xref (
    user_id DECIMAL(10,0) not null,
    ltg_id DECIMAL(12,0) not null
)
extent size 128 next size 128
lock mode row;

revoke all on mpsqas_user_ltg_xref from 'public';
create table 'informix'.current_school_audit (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    viewable DECIMAL(1,0) default 1,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 3000 next size 1500
lock mode row;

revoke all on current_school_audit from 'public';
create table 'informix'.algo_rating_type_lu (
    algo_rating_type_id DECIMAL(3,0),
    algo_rating_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on algo_rating_type_lu from 'public';
create table 'informix'.algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

revoke all on algo_rating from 'public';
create table 'informix'.season (
    season_id DECIMAL(6,0),
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    name VARCHAR(254),
    season_type_id DECIMAL(3,0),
    event_id DECIMAL(10,0)
)
extent size 16 next size 16
lock mode row;

revoke all on season from 'public';
create table 'informix'.season_type_lu (
    season_type_id DECIMAL(3,0),
    season_type_desc VARCHAR(254)
)
extent size 16 next size 16
lock mode row;

revoke all on season_type_lu from 'public';
create table 'informix'.season_algo_rating (
    coder_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

revoke all on season_algo_rating from 'public';
create table 'informix'.region_type_lu (
    region_type_id DECIMAL(3,0),
    region_type_desc VARCHAR(80)
)
extent size 16 next size 16
lock mode row;

revoke all on region_type_lu from 'public';
create table 'informix'.region (
    region_id DECIMAL(3,0),
    region_type_id DECIMAL(3,0),
    region_name VARCHAR(30)
)
extent size 64 next size 64
lock mode row;

revoke all on region from 'public';
create table 'informix'.country_region_xref (
    country_code VARCHAR(3),
    region_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on country_region_xref from 'public';
create table 'informix'.practice_group (
    group_id DECIMAL(3,0),
    group_name VARCHAR(80)
)
extent size 16 next size 16
lock mode row;

revoke all on practice_group from 'public';
create table 'informix'.round_group_xref (
    round_id DECIMAL(10,0),
    group_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on round_group_xref from 'public';
create table 'informix'.payment_method_lu (
    payment_method_desc VARCHAR(100),
    payment_method_id DECIMAL(3,0),
    payment_method_list_order DECIMAL(3,0)
)
extent size 32 next size 32
lock mode page;

revoke all on payment_method_lu from 'public';
create table 'informix'.team (
    team_id DECIMAL(10,0) not null,
    team_name VARCHAR(100),
    team_type DECIMAL(3,0),
    school_id DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 32 next size 32
lock mode row;

revoke all on team from 'public';
create table 'informix'.member_contact_black_list (
    user_id DECIMAL(10,0) not null,
    blocked_user_id DECIMAL(10,0) not null,
    blocked_ind DECIMAL(1,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 512 next size 512
lock mode page;

revoke all on member_contact_black_list from 'public';
create table 'informix'.member_contact_message (
    member_contact_message_id DECIMAL(10,0) not null,
    sender_id DECIMAL(10,0) not null,
    recipient_id DECIMAL(10,0) not null,
    message_text TEXT not null,
    copy_ind DECIMAL(1,0) not null,
    sent_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null
)
extent size 50000 next size 50000
lock mode page;

revoke all on member_contact_message from 'public';
create table 'informix'.staging_algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    backup_id DECIMAL(10,0)
)
extent size 50 next size 20
lock mode row;

revoke all on staging_algo_rating from 'public';
create table 'informix'.round (
    round_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    name VARCHAR(64) not null,
    status CHAR(1),
    ran_ratings DECIMAL(1,0),
    paid_money DECIMAL(1,0),
    registration_limit DECIMAL(6,0),
    notes lvarchar,
    invitational DECIMAL(3,0),
    round_type_id DECIMAL(3,0),
    link VARCHAR(255),
    short_name VARCHAR(30),
    forum_id DECIMAL(10,0),
    rated_ind DECIMAL(1,0) default 0,
    region_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode row;

revoke all on round from 'public';
create table 'informix'.aol_alert_info (
    user_id DECIMAL(10,0) not null,
    aol_encrypted_user_id VARCHAR(254) not null
)
extent size 1000 next size 1000
lock mode row;

revoke all on aol_alert_info from 'public';
create table 'informix'.command_execution (
    command_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    execution_time INT
)
extent size 1000000 next size 1000000
lock mode page;

revoke all on command_execution from 'public';
create table 'informix'.payment_reference_lu (
    payment_reference_id DECIMAL(3,0),
    reference_field_name VARCHAR(30) not null
)
extent size 16 next size 16
lock mode page;

revoke all on payment_reference_lu from 'public';
create table 'informix'.long_test_score_id (
    round_id DECIMAL(10,0) not null,
    generation_id DECIMAL(14,0) not null
)
extent size 16 next size 16
lock mode row;

revoke all on long_test_score_id from 'public';
create table 'informix'.ryan_temp2 (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(10,0),
    rating DECIMAL(10,0),
    vol DECIMAL(10,0),
    num_ratings DECIMAL(10,0)
)
extent size 16 next size 16
lock mode page;

revoke all on ryan_temp2 from 'public';
create table 'informix'.travis_school (
    school_id DECIMAL(10,0),
    sort_letter CHAR(1),
    city VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    user_id DECIMAL(10,0) not null,
    name VARCHAR(100) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    short_name VARCHAR(20),
    school_type_id DECIMAL(3,0),
    address_id DECIMAL(10,0),
    viewable DECIMAL(1,0) default 1
)
extent size 1000 next size 500
lock mode row;

revoke all on travis_school from 'public';
create table 'informix'.mike_school (
    school_id DECIMAL(10,0),
    sort_letter CHAR(1),
    city VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    user_id DECIMAL(10,0) not null,
    name NVARCHAR(200) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    short_name VARCHAR(20),
    school_type_id DECIMAL(3,0),
    address_id DECIMAL(10,0),
    viewable DECIMAL(1,0) default 1
)
extent size 1000 next size 500
lock mode row;

revoke all on mike_school from 'public';
create table 'informix'.response (
    response_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    question_id DECIMAL(10,0),
    answer_id DECIMAL(10,0),
    response_text TEXT,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    response lvarchar(10000)
)
extent size 20000 next size 5000
lock mode row;

revoke all on response from 'public';
create table 'informix'.visa_letter_event (
    visa_letter_event_id DECIMAL(10,0),
    event_name VARCHAR(50) not null,
    contest_id DECIMAL(10,0),
    request_start_date DATETIME YEAR TO FRACTION,
    request_end_date DATETIME YEAR TO FRACTION
)
extent size 16 next size 16
lock mode page;

revoke all on visa_letter_event from 'public';
create table 'informix'.visa_letter_request (
    visa_letter_request_id DECIMAL(10,0),
    user_id DECIMAL(10,0) not null,
    visa_letter_event_id DECIMAL(10,0),
    full_name VARCHAR(50) not null,
    address_id DECIMAL(10,0) not null,
    shipping_address_id DECIMAL(10,0) not null,
    phone_number VARCHAR(20) not null,
    request_date DATETIME YEAR TO FRACTION not null,
    sent_date DATETIME YEAR TO FRACTION,
    denied_ind DECIMAL(1,0) not null
)
extent size 128 next size 128
lock mode page;

revoke all on visa_letter_request from 'public';
create table 'informix'.royalty_temp (
    amount DECIMAL(7,2),
    description VARCHAR(254),
    royalty_date DATE,
    handle VARCHAR(50)
)
extent size 32 next size 32
lock mode row;

revoke all on royalty_temp from 'public';
create table 'informix'.assignment_document_type_lu (
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_type_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on assignment_document_type_lu from 'public';
create table 'informix'.assignment_document_status_lu (
    assignment_document_status_id DECIMAL(3,0),
    assignment_document_status_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on assignment_document_status_lu from 'public';
create table 'informix'.assignment_document (
    assignment_document_id DECIMAL(10,0) not null,
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_status_id DECIMAL(3,0),
    assignment_document_submission_title VARCHAR(100),
    assignment_document_text TEXT,
    assignment_document_hard_copy_ind DECIMAL(1,0),
    user_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    affirmed_date DATETIME YEAR TO FRACTION,
    expire_date DATETIME YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 35000 next size 35000
lock mode row;

revoke all on assignment_document from 'public';
create table 'informix'.assignment_document_template (
    assignment_document_template_id DECIMAL(10,0),
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_template_text TEXT,
    cur_version DECIMAL(1,0),
    assignment_document_template_name VARCHAR(50)
)
extent size 16 next size 16
lock mode row;

revoke all on assignment_document_template from 'public';
create table 'informix'.payment_detail_xref_pablo (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_detail_xref_pablo from 'public';
create table 'informix'.payment_pablo (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    print_count DECIMAL(3,0),
    review DECIMAL(3,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_pablo from 'public';
create table 'informix'.payment_detail_pablo_dec (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid DATETIME YEAR TO FRACTION,
    date_printed DATETIME YEAR TO FRACTION,
    gross_amount DECIMAL(12,2),
    status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified DATETIME YEAR TO FRACTION,
    date_due DATETIME YEAR TO FRACTION,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    charity_ind DECIMAL(1,0) default 0 not null
)
extent size 3000 next size 1000
lock mode row;

revoke all on payment_detail_pablo_dec from 'public';
create table 'informix'.payment_pablo_dec (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    print_count DECIMAL(3,0),
    review DECIMAL(3,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_pablo_dec from 'public';
create table 'informix'.payment_detail_xref_pablo_dec (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_detail_xref_pablo_dec from 'public';
create table 'informix'.miketemp (
    user_id DECIMAL(12,0)
)
extent size 16 next size 16
lock mode page;

revoke all on miketemp from 'public';
create table 'informix'.intro_event_property_type_lu (
    property_type_id DECIMAL(3,0),
    type_desc VARCHAR(50) not null
)
extent size 16 next size 16
lock mode row;

revoke all on intro_event_property_type_lu from 'public';
create table 'informix'.connection_history (
    coder_id DECIMAL(10,0),
    start_time DATETIME YEAR TO FRACTION,
    end_time DATETIME YEAR TO FRACTION,
    client_ip VARCHAR(15),
    server_id DECIMAL(5,0),
    connection_id INT
)
extent size 50000 next size 25000
lock mode row;

revoke all on connection_history from 'public';
create table 'informix'.payment_status_lu (
    payment_status_id DECIMAL(3,0),
    payment_status_desc VARCHAR(100),
    payment_status_active_ind DECIMAL(1,0) default 1 not null
)
extent size 16 next size 16
lock mode row;

revoke all on payment_status_lu from 'public';
create table 'informix'.payment_status_reason_lu (
    payment_status_reason_id DECIMAL(10,0),
    payment_status_reason_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on payment_status_reason_lu from 'public';
create table 'informix'.payment_detail_status_reason_xref (
    payment_detail_id DECIMAL(10,0),
    payment_status_reason_id DECIMAL(10,0)
)
extent size 512 next size 512
lock mode row;

revoke all on payment_detail_status_reason_xref from 'public';
create table 'informix'.user_accrual (
    user_id DECIMAL(12,0),
    accrual_amount DECIMAL(12,0)
)
extent size 16 next size 16
lock mode row;

revoke all on user_accrual from 'public';
create table 'informix'.round_language (
    round_id DECIMAL(10,0) not null,
    language_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode row;

revoke all on round_language from 'public';
create table 'informix'.nomination (
    nomination_id INT,
    nominator_id DECIMAL(10,0) not null,
    event_id DECIMAL(10,0) not null,
    email_address VARCHAR(100),
    school_name VARCHAR(100),
    name VARCHAR(100),
    field_of_instruction VARCHAR(100),
    school_url VARCHAR(100),
    text lvarchar(10000),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 100 next size 100
lock mode row;

revoke all on nomination from 'public';
create table 'informix'.generic_counter_client (
    client_id DECIMAL(4) not null,
    name CHAR(30) not null
)
extent size 16 next size 16
lock mode row;

revoke all on generic_counter_client from 'public';
create table 'informix'.generic_counter (
    client_id DECIMAL(4) not null,
    counter_id CHAR(30) not null,
    value DECIMAL(12,0) not null,
    last_update_id CHAR(30),
    last_update DATETIME YEAR TO FRACTION not null
)
extent size 16 next size 16
lock mode row;

revoke all on generic_counter from 'public';
create table 'informix'.payment_detail_pablo (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid DATETIME YEAR TO FRACTION,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified DATETIME YEAR TO FRACTION,
    date_due DATETIME YEAR TO FRACTION,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1
)
extent size 3000 next size 1000
lock mode row;

revoke all on payment_detail_pablo from 'public';
create table 'informix'.timers (
    timerid VARCHAR(80) not null,
    targetid VARCHAR(80) not null,
    initialdate DATETIME YEAR TO FRACTION not null,
    timerinterval DECIMAL(18,0),
    instancepk BYTE,
    info BYTE
)
extent size 64 next size 64
lock mode row;

revoke all on timers from 'public';
create table 'informix'.room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2),
    room_seed DECIMAL(3,0),
    paid DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    room_placed DECIMAL(3,0),
    attended CHAR(1),
    advanced CHAR(1),
    overall_rank DECIMAL(6,0),
    division_seed DECIMAL(6,0),
    division_placed DECIMAL(6,0),
    round_payment_id DECIMAL(10,0),
    rated_flag DECIMAL(1,0),
    region_placed DECIMAL(5,0),
    team_points DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    old_vol DECIMAL(5,0)
)
extent size 50000 next size 40000
lock mode row;

revoke all on room_result from 'public';
create table 'informix'.classroom_status_lu (
    status_id DECIMAL(3,0) not null,
    description VARCHAR(30) not null
)
extent size 16 next size 16
lock mode row;

revoke all on classroom_status_lu from 'public';
create table 'informix'.classroom (
    classroom_id DECIMAL(10,0) not null,
    professor_id DECIMAL(10,0) not null,
    school_id DECIMAL(10,0) not null,
    name VARCHAR(50) not null,
    status_id DECIMAL(3,0) not null,
    academic_period VARCHAR(50),
    description VARCHAR(200),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

revoke all on classroom from 'public';
create table 'informix'.student_classroom_status_lu (
    status_id DECIMAL(3,0) not null,
    description VARCHAR(30) not null
)
extent size 16 next size 16
lock mode row;

revoke all on student_classroom_status_lu from 'public';
create table 'informix'.student_classroom_xref (
    student_id DECIMAL(10,0) not null,
    classroom_id DECIMAL(10,0) not null,
    status_id DECIMAL(3,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 32 next size 32
lock mode row;

revoke all on student_classroom_xref from 'public';
create table 'informix'.student_professor_xref (
    student_id DECIMAL(10,0) not null,
    professor_id DECIMAL(10,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 32 next size 32
lock mode row;

revoke all on student_professor_xref from 'public';
create table 'informix'.round_property_type_lu (
    round_property_type_id DECIMAL(3,0) not null,
    round_property VARCHAR(50) not null
)
extent size 16 next size 16
lock mode row;

revoke all on round_property_type_lu from 'public';
create table 'informix'.round_property (
    round_id DECIMAL(10,0) not null,
    round_property_type_id DECIMAL(3,0) not null,
    int_value DECIMAL(10,0),
    string_value VARCHAR(100)
)
extent size 32 next size 32
lock mode row;

revoke all on round_property from 'public';
create table 'informix'.college_problem_set (
    problem_set_id DECIMAL(4,0) not null,
    name VARCHAR(30) not null,
    description VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

revoke all on college_problem_set from 'public';
create table 'informix'.problem_set_component_xref (
    problem_set_id DECIMAL(4,0) not null,
    component_id DECIMAL(10,0) not null
)
extent size 16 next size 16
lock mode row;

revoke all on problem_set_component_xref from 'public';
create table 'informix'.payment_detail_dr20075 (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid DATETIME YEAR TO FRACTION,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified DATETIME YEAR TO FRACTION,
    date_due DATETIME YEAR TO FRACTION,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1
)
extent size 3000 next size 1000
lock mode row;

revoke all on payment_detail_dr20075 from 'public';
create table 'informix'.payment_detail_xref_dr20075 (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_detail_xref_dr20075 from 'public';
create table 'informix'.payment_dr20075 (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 1000 next size 500
lock mode row;

revoke all on payment_dr20075 from 'public';
create table 'informix'.payment_detail_status_reason_xref_dr20075 (
    payment_detail_id DECIMAL(10,0),
    payment_status_reason_id DECIMAL(10,0)
)
extent size 512 next size 512
lock mode row;

revoke all on payment_detail_status_reason_xref_dr20075 from 'public';
create table 'informix'.fax_solution (
    solution_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    solution_text TEXT,
    modify_date DATETIME YEAR TO FRACTION,
    solution_class BYTE,
    language_id DECIMAL(3,0),
    package VARCHAR(255)
)
extent size 25000 next size 15000
lock mode row;

revoke all on fax_solution from 'public';
create table 'informix'.mike_temp1 (
    user_id DECIMAL(12,0),
    algo_rank DECIMAL(12,0),
    algo_rating DECIMAL(12,0),
    algo_vol DECIMAL(12,0),
    algo_lang VARCHAR(25),
    algo_comps DECIMAL(10,0),
    des_rating DECIMAL(12,0),
    des_vol DECIMAL(12,0),
    des_rank DECIMAL(12,0),
    dev_rating DECIMAL(12,0),
    dev_vol DECIMAL(12,0),
    dev_rank DECIMAL(12,0),
    earnings DECIMAL(12,2),
    des_subs DECIMAL(12,0),
    des_passed DECIMAL(12,0),
    des_wins DECIMAL(12,0),
    dev_subs DECIMAL(12,0),
    dev_passed DECIMAL(12,0),
    dev_wins DECIMAL(12,0)
)
extent size 16 next size 16
lock mode page;

revoke all on mike_temp1 from 'public';
create table 'informix'.temp_dr_pay_fix (
    user_id DECIMAL(10,0),
    new_payment DECIMAL(10,2),
    old_payment DECIMAL(10,2)
)
extent size 16 next size 16
lock mode row;

revoke all on temp_dr_pay_fix from 'public';
create table 'informix'.dok_algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 1000 next size 1000
lock mode row;

revoke all on dok_algo_rating from 'public';
create table 'informix'.algo_rating_tgh (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0),
    highest_rating DECIMAL(5,0),
    lowest_rating DECIMAL(5,0),
    first_rated_round_id DECIMAL(10,0),
    last_rated_round_id DECIMAL(10,0),
    num_competitions DECIMAL(7,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on algo_rating_tgh from 'public';
create table 'informix'.algo_rating_tgh_hourly (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

revoke all on algo_rating_tgh_hourly from 'public';
create table 'informix'.mike_temp (
    user_id DECIMAL(12,0)
)
extent size 16 next size 16
lock mode page;

revoke all on mike_temp from 'public';
create table 'informix'.payment_type_lu (
    payment_type_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    payment_reference_id DECIMAL(3,0),
    show_in_profile_ind DECIMAL(1,0) default 1 not null,
    show_details_ind DECIMAL(1,0) default 1 not null,
    due_date_interval DECIMAL(3,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    pay_on_day DECIMAL(2,0),
    requires_client_ind DECIMAL(1,0) default 0 not null,
    global_ad_ind boolean default 'f'
)
extent size 64 next size 64
lock mode row;

revoke all on payment_type_lu from 'public';
create table 'informix'.algo_rating_pre_tco08 (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 16 next size 16
lock mode page;

revoke all on algo_rating_pre_tco08 from 'public';
create table 'informix'.long_system_test_data (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    data BYTE,
    test_action DECIMAL(2,0) default 10
)
extent size 30000 next size 30000
lock mode row;

revoke all on long_system_test_data from 'public';
create table 'informix'.nate_long_comp_result (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(14,2),
    attended CHAR(1),
    placed DECIMAL(6,0),
    system_point_total DECIMAL(14,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    rated_ind DECIMAL(1,0) default 0,
    advanced CHAR(1) default 'N'
)
extent size 10000 next size 7500
lock mode row;

revoke all on nate_long_comp_result from 'public';
create view "informix".rating (coder_id,round_id,rating,num_ratings,
       modify_date,vol,rating_no_vol) as
   select x0.coder_id ,x0.round_id ,x0.rating ,x0.num_ratings ,
       x0.modify_date ,x0.vol ,x0.vol 
   from "informix".algo_rating x0 
   where (x0.algo_rating_type_id = 1. ) ;
revoke all on rating from 'public';
create view "informix".rated_members (user_id) as
   select x0.coder_id 
   from "informix".algo_rating x0 
   where (x0.num_ratings > 0. )  union select x1.user_id 
      from tcs_catalog:"informix".user_rating x1 
      where (x1.num_ratings > 0.0000000000000000 ) ;
revoke all on rated_members from 'public';

grant select on rating to 'informix' with grant option ;

grant delete on rating to 'informix' with grant option ;

grant insert on rating to 'informix' with grant option ;

grant update on rating to 'informix' with grant option ;

grant select on rated_members to 'informix' with grant option ;

grant insert on rating to 'coder' as 'informix';

grant select on rating to 'coder' as 'informix';

grant update on rating to 'coder' as 'informix';

grant select on rating to 'openaim' as 'informix';

grant select on rating to 'truveo' as 'informix';

grant select on rating to 'winformula' as 'informix';

grant select on rating to 'openxtraz' as 'informix';

grant delete on archive_sched_job_detail to 'public' as 'informix';

grant insert on archive_sched_job_detail to 'public' as 'informix';

grant update on archive_sched_job_detail to 'public' as 'informix';

grant select on archive_sched_job_detail to 'public' as 'informix';

grant update on long_submission_class_file to 'public' as 'informix';

grant insert on long_submission_class_file to 'public' as 'informix';

grant select on long_submission_class_file to 'public' as 'informix';

grant delete on long_submission_class_file to 'public' as 'informix';

grant delete on ltg_type_lu to 'public' as 'informix';

grant update on ltg_type_lu to 'public' as 'informix';

grant insert on ltg_type_lu to 'public' as 'informix';

grant select on ltg_type_lu to 'public' as 'informix';

grant index on ltg_type_lu to 'public' as 'informix';

grant select on ltg_status_lu to 'public' as 'informix';

grant insert on ltg_status_lu to 'public' as 'informix';

grant index on ltg_status_lu to 'public' as 'informix';

grant delete on ltg_status_lu to 'public' as 'informix';

grant update on ltg_status_lu to 'public' as 'informix';

grant select on long_test_group to 'public' as 'informix';

grant index on long_test_group to 'public' as 'informix';

grant insert on long_test_group to 'public' as 'informix';

grant update on long_test_group to 'public' as 'informix';

grant delete on long_test_group to 'public' as 'informix';

grant insert on ltc_status_lu to 'public' as 'informix';

grant delete on ltc_status_lu to 'public' as 'informix';

grant select on ltc_status_lu to 'public' as 'informix';

grant update on ltc_status_lu to 'public' as 'informix';

grant index on ltc_status_lu to 'public' as 'informix';

grant delete on long_test_case to 'public' as 'informix';

grant insert on long_test_case to 'public' as 'informix';

grant update on long_test_case to 'public' as 'informix';

grant select on long_test_case to 'public' as 'informix';

grant index on long_test_case to 'public' as 'informix';

grant insert on long_test_result to 'public' as 'informix';

grant delete on long_test_result to 'public' as 'informix';

grant select on long_test_result to 'public' as 'informix';

grant update on long_test_result to 'public' as 'informix';

grant index on long_test_result to 'public' as 'informix';

grant select on long_test_queue_mpsqas to 'public' as 'informix';

grant index on long_test_queue_mpsqas to 'public' as 'informix';

grant insert on long_test_queue_mpsqas to 'public' as 'informix';

grant delete on long_test_queue_mpsqas to 'public' as 'informix';

grant update on long_test_queue_mpsqas to 'public' as 'informix';

grant index on mpsqas_user_ltg_xref to 'public' as 'informix';

grant insert on mpsqas_user_ltg_xref to 'public' as 'informix';

grant update on mpsqas_user_ltg_xref to 'public' as 'informix';

grant select on mpsqas_user_ltg_xref to 'public' as 'informix';

grant delete on mpsqas_user_ltg_xref to 'public' as 'informix';

grant insert on current_school_audit to 'public' as 'informix';

grant delete on current_school_audit to 'public' as 'informix';

grant index on current_school_audit to 'public' as 'informix';

grant update on current_school_audit to 'public' as 'informix';

grant select on current_school_audit to 'public' as 'informix';

grant select on payment_dr20075 to 'public' as 'informix';

grant index on payment_dr20075 to 'public' as 'informix';

grant update on payment_dr20075 to 'public' as 'informix';

grant insert on payment_dr20075 to 'public' as 'informix';

grant delete on payment_dr20075 to 'public' as 'informix';

grant delete on round to 'public' as 'informix';

grant insert on round to 'public' as 'informix';

grant select on round to 'public' as 'informix';

grant update on round to 'public' as 'informix';

grant delete on algo_rating_type_lu to 'public' as 'informix';

grant update on algo_rating_type_lu to 'public' as 'informix';

grant index on algo_rating_type_lu to 'public' as 'informix';

grant insert on algo_rating_type_lu to 'public' as 'informix';

grant select on algo_rating_type_lu to 'public' as 'informix';

grant select on algo_rating to 'public' as 'informix';

grant update on algo_rating to 'public' as 'informix';

grant insert on algo_rating to 'public' as 'informix';

grant index on algo_rating to 'public' as 'informix';

grant delete on algo_rating to 'public' as 'informix';

grant insert on season to 'public' as 'informix';

grant index on season to 'public' as 'informix';

grant delete on season to 'public' as 'informix';

grant update on season to 'public' as 'informix';

grant select on season to 'public' as 'informix';

grant select on season_type_lu to 'public' as 'informix';

grant update on season_type_lu to 'public' as 'informix';

grant insert on season_type_lu to 'public' as 'informix';

grant delete on season_type_lu to 'public' as 'informix';

grant index on season_type_lu to 'public' as 'informix';

grant insert on season_algo_rating to 'public' as 'informix';

grant index on season_algo_rating to 'public' as 'informix';

grant select on season_algo_rating to 'public' as 'informix';

grant delete on season_algo_rating to 'public' as 'informix';

grant update on season_algo_rating to 'public' as 'informix';

grant insert on aol_alert_info to 'public' as 'informix';

grant select on aol_alert_info to 'public' as 'informix';

grant delete on aol_alert_info to 'public' as 'informix';

grant update on aol_alert_info to 'public' as 'informix';

grant index on aol_alert_info to 'public' as 'informix';

grant update on connection_history to 'public' as 'informix';

grant insert on connection_history to 'public' as 'informix';

grant select on connection_history to 'public' as 'informix';

grant delete on connection_history to 'public' as 'informix';

grant select on region_type_lu to 'public' as 'informix';

grant update on region_type_lu to 'public' as 'informix';

grant insert on region_type_lu to 'public' as 'informix';

grant index on region_type_lu to 'public' as 'informix';

grant delete on region_type_lu to 'public' as 'informix';

grant insert on region to 'public' as 'informix';

grant select on region to 'public' as 'informix';

grant update on region to 'public' as 'informix';

grant index on region to 'public' as 'informix';

grant delete on region to 'public' as 'informix';

grant index on payment_detail_status_reason_xref_dr20075 to 'public' as 'informix';

grant select on payment_detail_status_reason_xref_dr20075 to 'public' as 'informix';

grant insert on payment_detail_status_reason_xref_dr20075 to 'public' as 'informix';

grant delete on payment_detail_status_reason_xref_dr20075 to 'public' as 'informix';

grant update on payment_detail_status_reason_xref_dr20075 to 'public' as 'informix';

grant select on practice_group to 'public' as 'informix';

grant delete on practice_group to 'public' as 'informix';

grant update on practice_group to 'public' as 'informix';

grant insert on practice_group to 'public' as 'informix';

grant index on practice_group to 'public' as 'informix';

grant delete on round_group_xref to 'public' as 'informix';

grant select on round_group_xref to 'public' as 'informix';

grant insert on round_group_xref to 'public' as 'informix';

grant update on round_group_xref to 'public' as 'informix';

grant index on round_group_xref to 'public' as 'informix';

grant index on payment_method_lu to 'public' as 'informix';

grant insert on payment_method_lu to 'public' as 'informix';

grant delete on payment_method_lu to 'public' as 'informix';

grant select on payment_method_lu to 'public' as 'informix';

grant update on payment_method_lu to 'public' as 'informix';

grant select on team to 'public' as 'informix';

grant update on team to 'public' as 'informix';

grant delete on team to 'public' as 'informix';

grant insert on team to 'public' as 'informix';

grant update on classroom_status_lu to 'public' as 'informix';

grant select on classroom_status_lu to 'public' as 'informix';

grant index on classroom_status_lu to 'public' as 'informix';

grant delete on classroom_status_lu to 'public' as 'informix';

grant insert on classroom_status_lu to 'public' as 'informix';

grant update on member_contact_message to 'public' as 'informix';

grant insert on member_contact_message to 'public' as 'informix';

grant delete on member_contact_message to 'public' as 'informix';

grant select on member_contact_message to 'public' as 'informix';

grant index on member_contact_message to 'public' as 'informix';

grant update on staging_algo_rating to 'public' as 'informix';

grant index on staging_algo_rating to 'public' as 'informix';

grant delete on staging_algo_rating to 'public' as 'informix';

grant select on staging_algo_rating to 'public' as 'informix';

grant insert on staging_algo_rating to 'public' as 'informix';

grant update on ryan_temp2 to 'public' as 'informix';

grant insert on ryan_temp2 to 'public' as 'informix';

grant select on ryan_temp2 to 'public' as 'informix';

grant index on ryan_temp2 to 'public' as 'informix';

grant delete on ryan_temp2 to 'public' as 'informix';

grant select on classroom to 'public' as 'informix';

grant insert on classroom to 'public' as 'informix';

grant update on classroom to 'public' as 'informix';

grant delete on classroom to 'public' as 'informix';

grant index on classroom to 'public' as 'informix';

grant insert on student_classroom_status_lu to 'public' as 'informix';

grant update on student_classroom_status_lu to 'public' as 'informix';

grant select on student_classroom_status_lu to 'public' as 'informix';

grant delete on student_classroom_status_lu to 'public' as 'informix';

grant index on student_classroom_status_lu to 'public' as 'informix';

grant update on command_execution to 'public' as 'informix';

grant index on command_execution to 'public' as 'informix';

grant delete on command_execution to 'public' as 'informix';

grant insert on command_execution to 'public' as 'informix';

grant select on command_execution to 'public' as 'informix';

grant index on student_classroom_xref to 'public' as 'informix';

grant update on student_classroom_xref to 'public' as 'informix';

grant select on student_classroom_xref to 'public' as 'informix';

grant insert on student_classroom_xref to 'public' as 'informix';

grant delete on student_classroom_xref to 'public' as 'informix';

grant index on student_professor_xref to 'public' as 'informix';

grant select on student_professor_xref to 'public' as 'informix';

grant update on student_professor_xref to 'public' as 'informix';

grant insert on student_professor_xref to 'public' as 'informix';

grant delete on student_professor_xref to 'public' as 'informix';

grant update on round_property_type_lu to 'public' as 'informix';

grant insert on round_property_type_lu to 'public' as 'informix';

grant delete on round_property_type_lu to 'public' as 'informix';

grant select on round_property_type_lu to 'public' as 'informix';

grant index on round_property_type_lu to 'public' as 'informix';

grant select on round_property to 'public' as 'informix';

grant delete on round_property to 'public' as 'informix';

grant insert on round_property to 'public' as 'informix';

grant index on round_property to 'public' as 'informix';

grant update on round_property to 'public' as 'informix';

grant insert on payment_reference_lu to 'public' as 'informix';

grant delete on payment_reference_lu to 'public' as 'informix';

grant index on payment_reference_lu to 'public' as 'informix';

grant select on payment_reference_lu to 'public' as 'informix';

grant update on payment_reference_lu to 'public' as 'informix';

grant index on college_problem_set to 'public' as 'informix';

grant select on college_problem_set to 'public' as 'informix';

grant insert on college_problem_set to 'public' as 'informix';

grant delete on college_problem_set to 'public' as 'informix';

grant update on college_problem_set to 'public' as 'informix';

grant index on problem_set_component_xref to 'public' as 'informix';

grant update on problem_set_component_xref to 'public' as 'informix';

grant delete on problem_set_component_xref to 'public' as 'informix';

grant select on problem_set_component_xref to 'public' as 'informix';

grant insert on problem_set_component_xref to 'public' as 'informix';

grant insert on fax_solution to 'public' as 'informix';

grant index on fax_solution to 'public' as 'informix';

grant update on fax_solution to 'public' as 'informix';

grant delete on fax_solution to 'public' as 'informix';

grant select on fax_solution to 'public' as 'informix';

grant index on long_test_score_id to 'public' as 'informix';

grant update on long_test_score_id to 'public' as 'informix';

grant delete on long_test_score_id to 'public' as 'informix';

grant select on long_test_score_id to 'public' as 'informix';

grant insert on long_test_score_id to 'public' as 'informix';

grant index on mike_temp1 to 'public' as 'informix';

grant delete on mike_temp1 to 'public' as 'informix';

grant update on mike_temp1 to 'public' as 'informix';

grant insert on mike_temp1 to 'public' as 'informix';

grant select on mike_temp1 to 'public' as 'informix';

grant delete on temp_dr_pay_fix to 'public' as 'informix';

grant update on temp_dr_pay_fix to 'public' as 'informix';

grant insert on temp_dr_pay_fix to 'public' as 'informix';

grant index on temp_dr_pay_fix to 'public' as 'informix';

grant select on temp_dr_pay_fix to 'public' as 'informix';

grant select on travis_school to 'public' as 'informix';

grant delete on travis_school to 'public' as 'informix';

grant index on travis_school to 'public' as 'informix';

grant insert on travis_school to 'public' as 'informix';

grant update on travis_school to 'public' as 'informix';

grant update on dok_algo_rating to 'public' as 'informix';

grant delete on dok_algo_rating to 'public' as 'informix';

grant insert on dok_algo_rating to 'public' as 'informix';

grant index on dok_algo_rating to 'public' as 'informix';

grant select on dok_algo_rating to 'public' as 'informix';

grant select on mike_school to 'public' as 'informix';

grant insert on mike_school to 'public' as 'informix';

grant delete on mike_school to 'public' as 'informix';

grant update on mike_school to 'public' as 'informix';

grant index on mike_school to 'public' as 'informix';

grant update on algo_rating_tgh to 'public' as 'informix';

grant insert on algo_rating_tgh to 'public' as 'informix';

grant index on algo_rating_tgh to 'public' as 'informix';

grant delete on algo_rating_tgh to 'public' as 'informix';

grant select on algo_rating_tgh to 'public' as 'informix';

grant select on algo_rating_tgh_hourly to 'public' as 'informix';

grant index on algo_rating_tgh_hourly to 'public' as 'informix';

grant insert on algo_rating_tgh_hourly to 'public' as 'informix';

grant delete on algo_rating_tgh_hourly to 'public' as 'informix';

grant update on algo_rating_tgh_hourly to 'public' as 'informix';

grant index on mike_temp to 'public' as 'informix';

grant update on mike_temp to 'public' as 'informix';

grant delete on mike_temp to 'public' as 'informix';

grant insert on mike_temp to 'public' as 'informix';

grant select on mike_temp to 'public' as 'informix';

grant select on payment_type_lu to 'public' as 'informix';

grant delete on payment_type_lu to 'public' as 'informix';

grant update on payment_type_lu to 'public' as 'informix';

grant insert on payment_type_lu to 'public' as 'informix';

grant update on algo_rating_pre_tco08 to 'public' as 'informix';

grant index on algo_rating_pre_tco08 to 'public' as 'informix';

grant insert on algo_rating_pre_tco08 to 'public' as 'informix';

grant select on algo_rating_pre_tco08 to 'public' as 'informix';

grant delete on algo_rating_pre_tco08 to 'public' as 'informix';

grant insert on long_system_test_data to 'public' as 'informix';

grant index on long_system_test_data to 'public' as 'informix';

grant delete on long_system_test_data to 'public' as 'informix';

grant update on long_system_test_data to 'public' as 'informix';

grant select on long_system_test_data to 'public' as 'informix';

grant update on nate_long_comp_result to 'public' as 'informix';

grant insert on nate_long_comp_result to 'public' as 'informix';

grant select on nate_long_comp_result to 'public' as 'informix';

grant index on nate_long_comp_result to 'public' as 'informix';

grant delete on nate_long_comp_result to 'public' as 'informix';

grant insert on chat_history to 'public' as 'informix';

grant delete on chat_history to 'public' as 'informix';

grant update on chat_history to 'public' as 'informix';

grant select on chat_history to 'public' as 'informix';

grant select on education to 'public' as 'informix';

grant delete on education to 'public' as 'informix';

grant insert on education to 'public' as 'informix';

grant update on education to 'public' as 'informix';

grant select on coder_skill to 'public' as 'informix';

grant delete on coder_skill to 'public' as 'informix';

grant insert on coder_skill to 'public' as 'informix';

grant update on coder_skill to 'public' as 'informix';

grant insert on payment_status_lu to 'public' as 'informix';

grant index on payment_status_lu to 'public' as 'informix';

grant update on payment_status_lu to 'public' as 'informix';

grant select on payment_status_lu to 'public' as 'informix';

grant delete on payment_status_lu to 'public' as 'informix';

grant select on connection_lock to 'public' as 'informix';

grant update on connection_lock to 'public' as 'informix';

grant insert on connection_lock to 'public' as 'informix';

grant delete on connection_lock to 'public' as 'informix';

grant delete on contact_us to 'public' as 'informix';

grant update on contact_us to 'public' as 'informix';

grant insert on contact_us to 'public' as 'informix';

grant select on contact_us to 'public' as 'informix';

grant update on contact_us_response to 'public' as 'informix';

grant select on contact_us_response to 'public' as 'informix';

grant delete on contact_us_response to 'public' as 'informix';

grant insert on contact_us_response to 'public' as 'informix';

grant insert on contact_us_subject to 'public' as 'informix';

grant update on contact_us_subject to 'public' as 'informix';

grant delete on contact_us_subject to 'public' as 'informix';

grant select on contact_us_subject to 'public' as 'informix';

grant insert on data_type to 'public' as 'informix';

grant select on data_type to 'public' as 'informix';

grant delete on data_type to 'public' as 'informix';

grant update on data_type to 'public' as 'informix';

grant delete on degree to 'public' as 'informix';

grant insert on degree to 'public' as 'informix';

grant update on degree to 'public' as 'informix';

grant select on degree to 'public' as 'informix';

grant select on difficulty to 'public' as 'informix';

grant delete on difficulty to 'public' as 'informix';

grant update on difficulty to 'public' as 'informix';

grant insert on difficulty to 'public' as 'informix';

grant delete on group to 'public' as 'informix';

grant update on group to 'public' as 'informix';

grant select on group to 'public' as 'informix';

grant insert on group to 'public' as 'informix';

grant select on group_user to 'public' as 'informix';

grant insert on group_user to 'public' as 'informix';

grant delete on group_user to 'public' as 'informix';

grant update on group_user to 'public' as 'informix';

grant delete on permission to 'public' as 'informix';

grant select on permission to 'public' as 'informix';

grant insert on permission to 'public' as 'informix';

grant update on permission to 'public' as 'informix';

grant update on question_type to 'public' as 'informix';

grant insert on question_type to 'public' as 'informix';

grant select on question_type to 'public' as 'informix';

grant delete on question_type to 'public' as 'informix';

grant insert on rating_history to 'public' as 'informix';

grant select on rating_history to 'public' as 'informix';

grant delete on rating_history to 'public' as 'informix';

grant update on rating_history to 'public' as 'informix';

grant update on member_contact_black_list to 'public' as 'informix';

grant select on member_contact_black_list to 'public' as 'informix';

grant insert on member_contact_black_list to 'public' as 'informix';

grant index on member_contact_black_list to 'public' as 'informix';

grant delete on member_contact_black_list to 'public' as 'informix';

grant insert on room to 'public' as 'informix';

grant delete on room to 'public' as 'informix';

grant update on room to 'public' as 'informix';

grant select on room to 'public' as 'informix';

grant delete on round_component to 'public' as 'informix';

grant select on round_component to 'public' as 'informix';

grant update on round_component to 'public' as 'informix';

grant insert on round_component to 'public' as 'informix';

grant update on segment_type to 'public' as 'informix';

grant delete on segment_type to 'public' as 'informix';

grant insert on segment_type to 'public' as 'informix';

grant select on segment_type to 'public' as 'informix';

grant delete on round_segment to 'public' as 'informix';

grant insert on round_segment to 'public' as 'informix';

grant select on round_segment to 'public' as 'informix';

grant update on round_segment to 'public' as 'informix';

grant insert on sector to 'public' as 'informix';

grant select on sector to 'public' as 'informix';

grant update on sector to 'public' as 'informix';

grant delete on sector to 'public' as 'informix';

grant select on secure_object to 'public' as 'informix';

grant update on secure_object to 'public' as 'informix';

grant delete on secure_object to 'public' as 'informix';

grant insert on secure_object to 'public' as 'informix';

grant select on skill_type to 'public' as 'informix';

grant delete on skill_type to 'public' as 'informix';

grant insert on skill_type to 'public' as 'informix';

grant update on skill_type to 'public' as 'informix';

grant update on 'informix'.language to 'public' as 'informix';

grant insert on 'informix'.language to 'public' as 'informix';

grant delete on 'informix'.language to 'public' as 'informix';

grant select on 'informix'.language to 'public' as 'informix';

grant insert on user_type to 'public' as 'informix';

grant select on user_type to 'public' as 'informix';

grant delete on user_type to 'public' as 'informix';

grant update on user_type to 'public' as 'informix';

grant update on contest_nav to 'public' as 'informix';

grant delete on contest_nav to 'public' as 'informix';

grant insert on contest_nav to 'public' as 'informix';

grant select on contest_nav to 'public' as 'informix';

grant delete on mail_log to 'public' as 'informix';

grant insert on mail_log to 'public' as 'informix';

grant update on mail_log to 'public' as 'informix';

grant select on mail_log to 'public' as 'informix';

grant delete on news to 'public' as 'informix';

grant update on news to 'public' as 'informix';

grant insert on news to 'public' as 'informix';

grant select on news to 'public' as 'informix';

grant delete on audit_coder to 'public' as 'informix';

grant select on audit_coder to 'public' as 'informix';

grant insert on audit_coder to 'public' as 'informix';

grant update on audit_coder to 'public' as 'informix';

grant select on payment_status_reason_lu to 'public' as 'informix';

grant insert on payment_status_reason_lu to 'public' as 'informix';

grant update on payment_status_reason_lu to 'public' as 'informix';

grant index on payment_status_reason_lu to 'public' as 'informix';

grant delete on payment_status_reason_lu to 'public' as 'informix';

grant insert on payment_detail_status_reason_xref to 'public' as 'informix';

grant update on payment_detail_status_reason_xref to 'public' as 'informix';

grant delete on payment_detail_status_reason_xref to 'public' as 'informix';

grant index on payment_detail_status_reason_xref to 'public' as 'informix';

grant select on payment_detail_status_reason_xref to 'public' as 'informix';

grant select on dispute to 'public' as 'informix';

grant delete on dispute to 'public' as 'informix';

grant insert on dispute to 'public' as 'informix';

grant update on dispute to 'public' as 'informix';

grant select on corporate to 'public' as 'informix';

grant update on corporate to 'public' as 'informix';

grant delete on corporate to 'public' as 'informix';

grant insert on corporate to 'public' as 'informix';

grant update on ad to 'public' as 'informix';

grant select on ad to 'public' as 'informix';

grant insert on ad to 'public' as 'informix';

grant delete on ad to 'public' as 'informix';

grant delete on inquiry to 'public' as 'informix';

grant update on inquiry to 'public' as 'informix';

grant insert on inquiry to 'public' as 'informix';

grant select on inquiry to 'public' as 'informix';

grant update on watch to 'public' as 'informix';

grant delete on watch to 'public' as 'informix';

grant select on watch to 'public' as 'informix';

grant insert on watch to 'public' as 'informix';

grant delete on subscription_region to 'public' as 'informix';

grant insert on subscription_region to 'public' as 'informix';

grant select on subscription_region to 'public' as 'informix';

grant update on subscription_region to 'public' as 'informix';

grant insert on subscription to 'public' as 'informix';

grant delete on subscription to 'public' as 'informix';

grant update on subscription to 'public' as 'informix';

grant select on subscription to 'public' as 'informix';

grant delete on region_state to 'public' as 'informix';

grant select on region_state to 'public' as 'informix';

grant insert on region_state to 'public' as 'informix';

grant update on region_state to 'public' as 'informix';

grant update on contest to 'public' as 'informix';

grant select on contest to 'public' as 'informix';

grant delete on contest to 'public' as 'informix';

grant insert on contest to 'public' as 'informix';

grant insert on coder to 'public' as 'informix';

grant delete on coder to 'public' as 'informix';

grant select on coder to 'public' as 'informix';

grant update on coder to 'public' as 'informix';

grant delete on jiveword to 'public' as 'informix';

grant insert on jiveword to 'public' as 'informix';

grant update on jiveword to 'public' as 'informix';

grant select on jiveword to 'public' as 'informix';

grant insert on jiveuserperm to 'public' as 'informix';

grant update on jiveuserperm to 'public' as 'informix';

grant select on jiveuserperm to 'public' as 'informix';

grant delete on jiveuserperm to 'public' as 'informix';

grant select on jivethread to 'public' as 'informix';

grant delete on jivethread to 'public' as 'informix';

grant insert on jivethread to 'public' as 'informix';

grant update on jivethread to 'public' as 'informix';

grant delete on jivemessageword to 'public' as 'informix';

grant select on jivemessageword to 'public' as 'informix';

grant insert on jivemessageword to 'public' as 'informix';

grant update on jivemessageword to 'public' as 'informix';

grant insert on jivemessagetree to 'public' as 'informix';

grant update on jivemessagetree to 'public' as 'informix';

grant delete on jivemessagetree to 'public' as 'informix';

grant select on jivemessagetree to 'public' as 'informix';

grant insert on jivemessageprop to 'public' as 'informix';

grant update on jivemessageprop to 'public' as 'informix';

grant select on jivemessageprop to 'public' as 'informix';

grant delete on jivemessageprop to 'public' as 'informix';

grant select on jivemessage to 'public' as 'informix';

grant insert on jivemessage to 'public' as 'informix';

grant delete on jivemessage to 'public' as 'informix';

grant update on jivemessage to 'public' as 'informix';

grant select on jivefilter to 'public' as 'informix';

grant update on jivefilter to 'public' as 'informix';

grant insert on jivefilter to 'public' as 'informix';

grant delete on jivefilter to 'public' as 'informix';

grant delete on jmsconsumer to 'public' as 'informix';

grant insert on jmsconsumer to 'public' as 'informix';

grant select on jmsconsumer to 'public' as 'informix';

grant update on jmsconsumer to 'public' as 'informix';

grant select on jmsdestination to 'public' as 'informix';

grant update on jmsdestination to 'public' as 'informix';

grant insert on jmsdestination to 'public' as 'informix';

grant delete on jmsdestination to 'public' as 'informix';

grant update on jmsmessage to 'public' as 'informix';

grant delete on jmsmessage to 'public' as 'informix';

grant insert on jmsmessage to 'public' as 'informix';

grant select on jmsmessage to 'public' as 'informix';

grant select on jmsmessagequeue to 'public' as 'informix';

grant delete on jmsmessagequeue to 'public' as 'informix';

grant insert on jmsmessagequeue to 'public' as 'informix';

grant update on jmsmessagequeue to 'public' as 'informix';

grant delete on jmstableid to 'public' as 'informix';

grant select on jmstableid to 'public' as 'informix';

grant insert on jmstableid to 'public' as 'informix';

grant update on jmstableid to 'public' as 'informix';

grant delete on dual to 'public' as 'informix';

grant insert on dual to 'public' as 'informix';

grant select on dual to 'public' as 'informix';

grant update on dual to 'public' as 'informix';

grant insert on referral to 'public' as 'informix';

grant select on referral to 'public' as 'informix';

grant update on referral to 'public' as 'informix';

grant delete on referral to 'public' as 'informix';

grant delete on editor to 'public' as 'informix';

grant select on editor to 'public' as 'informix';

grant update on editor to 'public' as 'informix';

grant insert on editor to 'public' as 'informix';

grant delete on pay_period to 'public' as 'informix';

grant insert on pay_period to 'public' as 'informix';

grant update on pay_period to 'public' as 'informix';

grant select on pay_period to 'public' as 'informix';

grant delete on title to 'public' as 'informix';

grant select on title to 'public' as 'informix';

grant update on title to 'public' as 'informix';

grant insert on title to 'public' as 'informix';

grant update on press_release to 'public' as 'informix';

grant delete on press_release to 'public' as 'informix';

grant insert on press_release to 'public' as 'informix';

grant select on press_release to 'public' as 'informix';

grant update on division to 'public' as 'informix';

grant insert on division to 'public' as 'informix';

grant delete on division to 'public' as 'informix';

grant select on division to 'public' as 'informix';

grant select on server_connection to 'public' as 'informix';

grant insert on server_connection to 'public' as 'informix';

grant update on server_connection to 'public' as 'informix';

grant delete on server_connection to 'public' as 'informix';

grant insert on sector_access to 'public' as 'informix';

grant select on sector_access to 'public' as 'informix';

grant delete on sector_access to 'public' as 'informix';

grant update on sector_access to 'public' as 'informix';

grant select on sector_file to 'public' as 'informix';

grant insert on sector_file to 'public' as 'informix';

grant update on sector_file to 'public' as 'informix';

grant delete on sector_file to 'public' as 'informix';

grant update on sector_agreement to 'public' as 'informix';

grant delete on sector_agreement to 'public' as 'informix';

grant insert on sector_agreement to 'public' as 'informix';

grant select on sector_agreement to 'public' as 'informix';

grant update on segment to 'public' as 'informix';

grant select on segment to 'public' as 'informix';

grant insert on segment to 'public' as 'informix';

grant delete on segment to 'public' as 'informix';

grant select on experience to 'public' as 'informix';

grant insert on experience to 'public' as 'informix';

grant delete on experience to 'public' as 'informix';

grant update on experience to 'public' as 'informix';

grant update on corporate_contact_us to 'public' as 'informix';

grant insert on corporate_contact_us to 'public' as 'informix';

grant select on corporate_contact_us to 'public' as 'informix';

grant delete on corporate_contact_us to 'public' as 'informix';

grant insert on system_test_result to 'public' as 'informix';

grant update on system_test_result to 'public' as 'informix';

grant delete on system_test_result to 'public' as 'informix';

grant select on system_test_result to 'public' as 'informix';

grant insert on coder_type to 'public' as 'informix';

grant select on coder_type to 'public' as 'informix';

grant update on coder_type to 'public' as 'informix';

grant delete on coder_type to 'public' as 'informix';

grant update on coder_referral to 'public' as 'informix';

grant insert on coder_referral to 'public' as 'informix';

grant delete on coder_referral to 'public' as 'informix';

grant select on coder_referral to 'public' as 'informix';

grant insert on problem_statement_history to 'public' as 'informix';

grant select on problem_statement_history to 'public' as 'informix';

grant update on problem_statement_history to 'public' as 'informix';

grant delete on problem_statement_history to 'public' as 'informix';

grant delete on problem_status_lu to 'public' as 'informix';

grant update on problem_status_lu to 'public' as 'informix';

grant select on problem_status_lu to 'public' as 'informix';

grant insert on problem_status_lu to 'public' as 'informix';

grant insert on correspondence to 'public' as 'informix';

grant update on correspondence to 'public' as 'informix';

grant delete on correspondence to 'public' as 'informix';

grant select on correspondence to 'public' as 'informix';

grant select on correspondence_status to 'public' as 'informix';

grant delete on correspondence_status to 'public' as 'informix';

grant update on correspondence_status to 'public' as 'informix';

grant insert on correspondence_status to 'public' as 'informix';

grant delete on mpsqas_chat_history to 'public' as 'informix';

grant select on mpsqas_chat_history to 'public' as 'informix';

grant update on mpsqas_chat_history to 'public' as 'informix';

grant insert on mpsqas_chat_history to 'public' as 'informix';

grant delete on component_user_xref to 'public' as 'informix';

grant update on component_user_xref to 'public' as 'informix';

grant select on component_user_xref to 'public' as 'informix';

grant insert on component_user_xref to 'public' as 'informix';

grant select on solution to 'public' as 'informix';

grant delete on solution to 'public' as 'informix';

grant insert on solution to 'public' as 'informix';

grant update on solution to 'public' as 'informix';

grant select on component_state to 'public' as 'informix';

grant delete on component_state to 'public' as 'informix';

grant update on component_state to 'public' as 'informix';

grant insert on component_state to 'public' as 'informix';

grant update on problem_solution to 'public' as 'informix';

grant delete on problem_solution to 'public' as 'informix';

grant insert on problem_solution to 'public' as 'informix';

grant select on problem_solution to 'public' as 'informix';

grant select on development_application_status to 'public' as 'informix';

grant delete on development_application_status to 'public' as 'informix';

grant update on development_application_status to 'public' as 'informix';

grant insert on development_application_status to 'public' as 'informix';

grant delete on development_application to 'public' as 'informix';

grant select on development_application to 'public' as 'informix';

grant insert on development_application to 'public' as 'informix';

grant update on development_application to 'public' as 'informix';

grant insert on challenge to 'public' as 'informix';

grant update on challenge to 'public' as 'informix';

grant delete on challenge to 'public' as 'informix';

grant select on challenge to 'public' as 'informix';

grant insert on invite_list to 'public' as 'informix';

grant select on invite_list to 'public' as 'informix';

grant update on invite_list to 'public' as 'informix';

grant delete on invite_list to 'public' as 'informix';

grant update on current_school to 'public' as 'informix';

grant select on current_school to 'public' as 'informix';

grant insert on current_school to 'public' as 'informix';

grant delete on current_school to 'public' as 'informix';

grant insert on current_job to 'public' as 'informix';

grant delete on current_job to 'public' as 'informix';

grant select on current_job to 'public' as 'informix';

grant update on current_job to 'public' as 'informix';

grant select on sub_template to 'public' as 'informix';

grant insert on sub_template to 'public' as 'informix';

grant update on sub_template to 'public' as 'informix';

grant delete on sub_template to 'public' as 'informix';

grant select on student_rep to 'public' as 'informix';

grant insert on student_rep to 'public' as 'informix';

grant update on student_rep to 'public' as 'informix';

grant delete on student_rep to 'public' as 'informix';

grant delete on solution_history to 'public' as 'informix';

grant insert on solution_history to 'public' as 'informix';

grant update on solution_history to 'public' as 'informix';

grant select on solution_history to 'public' as 'informix';

grant select on room_type to 'public' as 'informix';

grant delete on room_type to 'public' as 'informix';

grant update on room_type to 'public' as 'informix';

grant insert on room_type to 'public' as 'informix';

grant select on user_accrual to 'public' as 'informix';

grant delete on user_accrual to 'public' as 'informix';

grant update on user_accrual to 'public' as 'informix';

grant insert on user_accrual to 'public' as 'informix';

grant index on user_accrual to 'public' as 'informix';

grant insert on round_registration to 'public' as 'informix';

grant delete on round_registration to 'public' as 'informix';

grant select on round_registration to 'public' as 'informix';

grant update on round_registration to 'public' as 'informix';

grant select on question_style to 'public' as 'informix';

grant update on question_style to 'public' as 'informix';

grant delete on question_style to 'public' as 'informix';

grant insert on question_style to 'public' as 'informix';

grant select on answer to 'public' as 'informix';

grant update on answer to 'public' as 'informix';

grant delete on answer to 'public' as 'informix';

grant insert on answer to 'public' as 'informix';

grant index on round_language to 'public' as 'informix';

grant update on round_language to 'public' as 'informix';

grant select on round_language to 'public' as 'informix';

grant delete on round_language to 'public' as 'informix';

grant insert on round_language to 'public' as 'informix';

grant insert on survey_question to 'public' as 'informix';

grant delete on survey_question to 'public' as 'informix';

grant update on survey_question to 'public' as 'informix';

grant select on survey_question to 'public' as 'informix';

grant select on round_question to 'public' as 'informix';

grant delete on round_question to 'public' as 'informix';

grant update on round_question to 'public' as 'informix';

grant insert on round_question to 'public' as 'informix';

grant delete on correspondence_read_xref to 'public' as 'informix';

grant insert on correspondence_read_xref to 'public' as 'informix';

grant select on correspondence_read_xref to 'public' as 'informix';

grant update on correspondence_read_xref to 'public' as 'informix';

grant delete on problem_user_request to 'public' as 'informix';

grant select on problem_user_request to 'public' as 'informix';

grant update on problem_user_request to 'public' as 'informix';

grant insert on problem_user_request to 'public' as 'informix';

grant insert on contract_type_lu to 'public' as 'informix';

grant select on contract_type_lu to 'public' as 'informix';

grant update on contract_type_lu to 'public' as 'informix';

grant delete on contract_type_lu to 'public' as 'informix';

grant delete on image_type_lu to 'public' as 'informix';

grant update on image_type_lu to 'public' as 'informix';

grant insert on image_type_lu to 'public' as 'informix';

grant select on image_type_lu to 'public' as 'informix';

grant update on image to 'public' as 'informix';

grant select on image to 'public' as 'informix';

grant insert on image to 'public' as 'informix';

grant delete on image to 'public' as 'informix';

grant insert on coder_image_xref to 'public' as 'informix';

grant select on coder_image_xref to 'public' as 'informix';

grant update on coder_image_xref to 'public' as 'informix';

grant delete on coder_image_xref to 'public' as 'informix';

grant insert on jiveforum to 'public' as 'informix';

grant delete on jiveforum to 'public' as 'informix';

grant update on jiveforum to 'public' as 'informix';

grant select on jiveforum to 'public' as 'informix';

grant select on login to 'public' as 'informix';

grant update on login to 'public' as 'informix';

grant insert on login to 'public' as 'informix';

grant delete on login to 'public' as 'informix';

grant insert on project to 'public' as 'informix';

grant update on project to 'public' as 'informix';

grant delete on project to 'public' as 'informix';

grant select on project to 'public' as 'informix';

grant update on project_issue to 'public' as 'informix';

grant insert on project_issue to 'public' as 'informix';

grant delete on project_issue to 'public' as 'informix';

grant select on project_issue to 'public' as 'informix';

grant delete on project_task to 'public' as 'informix';

grant update on project_task to 'public' as 'informix';

grant select on project_task to 'public' as 'informix';

grant insert on project_task to 'public' as 'informix';

grant select on project_user to 'public' as 'informix';

grant delete on project_user to 'public' as 'informix';

grant insert on project_user to 'public' as 'informix';

grant update on project_user to 'public' as 'informix';

grant select on project_user_task to 'public' as 'informix';

grant insert on project_user_task to 'public' as 'informix';

grant delete on project_user_task to 'public' as 'informix';

grant update on project_user_task to 'public' as 'informix';

grant insert on project_user_update to 'public' as 'informix';

grant update on project_user_update to 'public' as 'informix';

grant delete on project_user_update to 'public' as 'informix';

grant select on project_user_update to 'public' as 'informix';

grant delete on status_type_lu to 'public' as 'informix';

grant insert on status_type_lu to 'public' as 'informix';

grant select on status_type_lu to 'public' as 'informix';

grant update on status_type_lu to 'public' as 'informix';

grant delete on request_type_lu to 'public' as 'informix';

grant update on request_type_lu to 'public' as 'informix';

grant select on request_type_lu to 'public' as 'informix';

grant insert on request_type_lu to 'public' as 'informix';

grant delete on path to 'public' as 'informix';

grant insert on path to 'public' as 'informix';

grant update on path to 'public' as 'informix';

grant select on path to 'public' as 'informix';

grant delete on round_type_lu to 'public' as 'informix';

grant insert on round_type_lu to 'public' as 'informix';

grant update on round_type_lu to 'public' as 'informix';

grant select on round_type_lu to 'public' as 'informix';

grant delete on web_content to 'public' as 'informix';

grant insert on web_content to 'public' as 'informix';

grant select on web_content to 'public' as 'informix';

grant update on web_content to 'public' as 'informix';

grant select on web_file to 'public' as 'informix';

grant update on web_file to 'public' as 'informix';

grant insert on web_file to 'public' as 'informix';

grant delete on web_file to 'public' as 'informix';

grant update on staging_problem to 'public' as 'informix';

grant insert on staging_problem to 'public' as 'informix';

grant delete on staging_problem to 'public' as 'informix';

grant select on staging_problem to 'public' as 'informix';

grant insert on request to 'public' as 'informix';

grant update on request to 'public' as 'informix';

grant delete on request to 'public' as 'informix';

grant select on request to 'public' as 'informix';

grant delete on nomination to 'public' as 'informix';

grant update on nomination to 'public' as 'informix';

grant select on nomination to 'public' as 'informix';

grant insert on nomination to 'public' as 'informix';

grant index on nomination to 'public' as 'informix';

grant delete on staging_rating to 'public' as 'informix';

grant update on staging_rating to 'public' as 'informix';

grant select on staging_rating to 'public' as 'informix';

grant insert on staging_rating to 'public' as 'informix';

grant select on staging_room to 'public' as 'informix';

grant delete on staging_room to 'public' as 'informix';

grant insert on staging_room to 'public' as 'informix';

grant update on staging_room to 'public' as 'informix';

grant insert on staging_round_problem to 'public' as 'informix';

grant select on staging_round_problem to 'public' as 'informix';

grant update on staging_round_problem to 'public' as 'informix';

grant delete on staging_round_problem to 'public' as 'informix';

grant update on staging_round_segment to 'public' as 'informix';

grant select on staging_round_segment to 'public' as 'informix';

grant insert on staging_round_segment to 'public' as 'informix';

grant delete on staging_round_segment to 'public' as 'informix';

grant delete on staging_contest to 'public' as 'informix';

grant insert on staging_contest to 'public' as 'informix';

grant select on staging_contest to 'public' as 'informix';

grant update on staging_contest to 'public' as 'informix';

grant insert on staging_challenge to 'public' as 'informix';

grant select on staging_challenge to 'public' as 'informix';

grant delete on staging_challenge to 'public' as 'informix';

grant update on staging_challenge to 'public' as 'informix';

grant delete on staging_invite_list to 'public' as 'informix';

grant update on staging_invite_list to 'public' as 'informix';

grant select on staging_invite_list to 'public' as 'informix';

grant insert on staging_invite_list to 'public' as 'informix';

grant update on staging_round_registration to 'public' as 'informix';

grant select on staging_round_registration to 'public' as 'informix';

grant insert on staging_round_registration to 'public' as 'informix';

grant delete on staging_round_registration to 'public' as 'informix';

grant insert on staging_survey to 'public' as 'informix';

grant select on staging_survey to 'public' as 'informix';

grant update on staging_survey to 'public' as 'informix';

grant delete on staging_survey to 'public' as 'informix';

grant update on staging_question to 'public' as 'informix';

grant delete on staging_question to 'public' as 'informix';

grant insert on staging_question to 'public' as 'informix';

grant select on staging_question to 'public' as 'informix';

grant delete on staging_answer to 'public' as 'informix';

grant update on staging_answer to 'public' as 'informix';

grant insert on staging_answer to 'public' as 'informix';

grant select on staging_answer to 'public' as 'informix';

grant select on staging_response to 'public' as 'informix';

grant delete on staging_response to 'public' as 'informix';

grant update on staging_response to 'public' as 'informix';

grant insert on staging_response to 'public' as 'informix';

grant update on staging_survey_question to 'public' as 'informix';

grant delete on staging_survey_question to 'public' as 'informix';

grant insert on staging_survey_question to 'public' as 'informix';

grant select on staging_survey_question to 'public' as 'informix';

grant select on staging_round_question to 'public' as 'informix';

grant delete on staging_round_question to 'public' as 'informix';

grant insert on staging_round_question to 'public' as 'informix';

grant update on staging_round_question to 'public' as 'informix';

grant delete on staging_round to 'public' as 'informix';

grant update on staging_round to 'public' as 'informix';

grant select on staging_round to 'public' as 'informix';

grant insert on staging_round to 'public' as 'informix';

grant insert on staging_room_result to 'public' as 'informix';

grant select on staging_room_result to 'public' as 'informix';

grant update on staging_room_result to 'public' as 'informix';

grant delete on staging_room_result to 'public' as 'informix';

grant delete on affidavit_type_lu to 'public' as 'informix';

grant update on affidavit_type_lu to 'public' as 'informix';

grant select on affidavit_type_lu to 'public' as 'informix';

grant insert on affidavit_type_lu to 'public' as 'informix';

grant insert on contract_payment_xref to 'public' as 'informix';

grant delete on contract_payment_xref to 'public' as 'informix';

grant update on contract_payment_xref to 'public' as 'informix';

grant select on contract_payment_xref to 'public' as 'informix';

grant delete on user_tax_form_xref to 'public' as 'informix';

grant select on user_tax_form_xref to 'public' as 'informix';

grant update on user_tax_form_xref to 'public' as 'informix';

grant insert on user_tax_form_xref to 'public' as 'informix';

grant update on payment_note_xref to 'public' as 'informix';

grant select on payment_note_xref to 'public' as 'informix';

grant delete on payment_note_xref to 'public' as 'informix';

grant insert on payment_note_xref to 'public' as 'informix';

grant update on affidavit_note_xref to 'public' as 'informix';

grant delete on affidavit_note_xref to 'public' as 'informix';

grant select on affidavit_note_xref to 'public' as 'informix';

grant insert on affidavit_note_xref to 'public' as 'informix';

grant insert on contract_note_xref to 'public' as 'informix';

grant delete on contract_note_xref to 'public' as 'informix';

grant select on contract_note_xref to 'public' as 'informix';

grant update on contract_note_xref to 'public' as 'informix';

grant delete on payment_detail to 'public' as 'informix';

grant update on payment_detail to 'public' as 'informix';

grant insert on payment_detail to 'public' as 'informix';

grant select on payment_detail to 'public' as 'informix';

grant insert on payment to 'public' as 'informix';

grant update on payment to 'public' as 'informix';

grant select on payment to 'public' as 'informix';

grant delete on payment to 'public' as 'informix';

grant update on payment_address to 'public' as 'informix';

grant select on payment_address to 'public' as 'informix';

grant insert on payment_address to 'public' as 'informix';

grant delete on payment_address to 'public' as 'informix';

grant select on payment_detail_xref to 'public' as 'informix';

grant insert on payment_detail_xref to 'public' as 'informix';

grant update on payment_detail_xref to 'public' as 'informix';

grant delete on payment_detail_xref to 'public' as 'informix';

grant select on modification_rationale_lu to 'public' as 'informix';

grant insert on modification_rationale_lu to 'public' as 'informix';

grant update on modification_rationale_lu to 'public' as 'informix';

grant delete on modification_rationale_lu to 'public' as 'informix';

grant delete on affidavit to 'public' as 'informix';

grant insert on affidavit to 'public' as 'informix';

grant update on affidavit to 'public' as 'informix';

grant select on affidavit to 'public' as 'informix';

grant update on user_tax_form_note_xref to 'public' as 'informix';

grant delete on user_tax_form_note_xref to 'public' as 'informix';

grant select on user_tax_form_note_xref to 'public' as 'informix';

grant insert on user_tax_form_note_xref to 'public' as 'informix';

grant delete on tax_form to 'public' as 'informix';

grant insert on tax_form to 'public' as 'informix';

grant select on tax_form to 'public' as 'informix';

grant update on tax_form to 'public' as 'informix';

grant select on contract to 'public' as 'informix';

grant delete on contract to 'public' as 'informix';

grant insert on contract to 'public' as 'informix';

grant update on contract to 'public' as 'informix';

grant update on affidavit_template to 'public' as 'informix';

grant insert on affidavit_template to 'public' as 'informix';

grant select on affidavit_template to 'public' as 'informix';

grant delete on affidavit_template to 'public' as 'informix';

grant delete on query to 'public' as 'informix';

grant select on query to 'public' as 'informix';

grant insert on query to 'public' as 'informix';

grant update on query to 'public' as 'informix';

grant update on command to 'public' as 'informix';

grant delete on command to 'public' as 'informix';

grant insert on command to 'public' as 'informix';

grant select on command to 'public' as 'informix';

grant delete on command_query_xref to 'public' as 'informix';

grant select on command_query_xref to 'public' as 'informix';

grant update on command_query_xref to 'public' as 'informix';

grant insert on command_query_xref to 'public' as 'informix';

grant select on query_input_xref to 'public' as 'informix';

grant update on query_input_xref to 'public' as 'informix';

grant insert on query_input_xref to 'public' as 'informix';

grant delete on query_input_xref to 'public' as 'informix';

grant select on input_lu to 'public' as 'informix';

grant delete on input_lu to 'public' as 'informix';

grant insert on input_lu to 'public' as 'informix';

grant update on input_lu to 'public' as 'informix';

grant update on sched_job_type_lu to 'public' as 'informix';

grant delete on sched_job_type_lu to 'public' as 'informix';

grant insert on sched_job_type_lu to 'public' as 'informix';

grant select on sched_job_type_lu to 'public' as 'informix';

grant update on sched_job_status_lu to 'public' as 'informix';

grant insert on sched_job_status_lu to 'public' as 'informix';

grant select on sched_job_status_lu to 'public' as 'informix';

grant delete on sched_job_status_lu to 'public' as 'informix';

grant delete on sched_job_detail_status_lu to 'public' as 'informix';

grant update on sched_job_detail_status_lu to 'public' as 'informix';

grant select on sched_job_detail_status_lu to 'public' as 'informix';

grant insert on sched_job_detail_status_lu to 'public' as 'informix';

grant delete on sched_job to 'public' as 'informix';

grant update on sched_job to 'public' as 'informix';

grant insert on sched_job to 'public' as 'informix';

grant select on sched_job to 'public' as 'informix';

grant insert on email_template_group_lu to 'public' as 'informix';

grant select on email_template_group_lu to 'public' as 'informix';

grant delete on email_template_group_lu to 'public' as 'informix';

grant update on email_template_group_lu to 'public' as 'informix';

grant select on email_template to 'public' as 'informix';

grant insert on email_template to 'public' as 'informix';

grant update on email_template to 'public' as 'informix';

grant delete on email_template to 'public' as 'informix';

grant select on email_list_group_lu to 'public' as 'informix';

grant delete on email_list_group_lu to 'public' as 'informix';

grant insert on email_list_group_lu to 'public' as 'informix';

grant update on email_list_group_lu to 'public' as 'informix';

grant insert on email_list to 'public' as 'informix';

grant select on email_list to 'public' as 'informix';

grant delete on email_list to 'public' as 'informix';

grant update on email_list to 'public' as 'informix';

grant update on email_list_detail to 'public' as 'informix';

grant insert on email_list_detail to 'public' as 'informix';

grant delete on email_list_detail to 'public' as 'informix';

grant select on email_list_detail to 'public' as 'informix';

grant select on sched_email_job to 'public' as 'informix';

grant insert on sched_email_job to 'public' as 'informix';

grant delete on sched_email_job to 'public' as 'informix';

grant update on sched_email_job to 'public' as 'informix';

grant update on command_param to 'public' as 'informix';

grant delete on command_param to 'public' as 'informix';

grant select on command_param to 'public' as 'informix';

grant insert on command_param to 'public' as 'informix';

grant update on command_group_lu to 'public' as 'informix';

grant select on command_group_lu to 'public' as 'informix';

grant insert on command_group_lu to 'public' as 'informix';

grant delete on command_group_lu to 'public' as 'informix';

grant update on user_status_lu to 'public' as 'informix';

grant insert on user_status_lu to 'public' as 'informix';

grant select on user_status_lu to 'public' as 'informix';

grant delete on user_status_lu to 'public' as 'informix';

grant insert on link_hit to 'public' as 'informix';

grant delete on link_hit to 'public' as 'informix';

grant update on link_hit to 'public' as 'informix';

grant select on link_hit to 'public' as 'informix';

grant update on status_lu to 'public' as 'informix';

grant select on status_lu to 'public' as 'informix';

grant delete on status_lu to 'public' as 'informix';

grant insert on status_lu to 'public' as 'informix';

grant select on broadcast_type_lu to 'public' as 'informix';

grant delete on broadcast_type_lu to 'public' as 'informix';

grant insert on broadcast_type_lu to 'public' as 'informix';

grant update on broadcast_type_lu to 'public' as 'informix';

grant delete on broadcast to 'public' as 'informix';

grant select on broadcast to 'public' as 'informix';

grant update on broadcast to 'public' as 'informix';

grant insert on broadcast to 'public' as 'informix';

grant update on round_payment to 'public' as 'informix';

grant delete on round_payment to 'public' as 'informix';

grant select on round_payment to 'public' as 'informix';

grant insert on round_payment to 'public' as 'informix';

grant delete on sched_control to 'public' as 'informix';

grant select on sched_control to 'public' as 'informix';

grant insert on sched_control to 'public' as 'informix';

grant update on sched_control to 'public' as 'informix';

grant select on job_type_lu to 'public' as 'informix';

grant update on job_type_lu to 'public' as 'informix';

grant insert on job_type_lu to 'public' as 'informix';

grant delete on job_type_lu to 'public' as 'informix';

grant delete on job to 'public' as 'informix';

grant insert on job to 'public' as 'informix';

grant select on job to 'public' as 'informix';

grant update on job to 'public' as 'informix';

grant select on hit_type_lu to 'public' as 'informix';

grant delete on hit_type_lu to 'public' as 'informix';

grant insert on hit_type_lu to 'public' as 'informix';

grant update on hit_type_lu to 'public' as 'informix';

grant update on job_hit to 'public' as 'informix';

grant insert on job_hit to 'public' as 'informix';

grant delete on job_hit to 'public' as 'informix';

grant select on job_hit to 'public' as 'informix';

grant update on monitor_function_type_lu to 'public' as 'informix';

grant insert on monitor_function_type_lu to 'public' as 'informix';

grant delete on monitor_function_type_lu to 'public' as 'informix';

grant select on monitor_function_type_lu to 'public' as 'informix';

grant select on monitor_function to 'public' as 'informix';

grant delete on monitor_function to 'public' as 'informix';

grant update on monitor_function to 'public' as 'informix';

grant insert on monitor_function to 'public' as 'informix';

grant insert on monitor_user_round_xref to 'public' as 'informix';

grant update on monitor_user_round_xref to 'public' as 'informix';

grant select on monitor_user_round_xref to 'public' as 'informix';

grant delete on monitor_user_round_xref to 'public' as 'informix';

grant update on group_monitor_function_xref to 'public' as 'informix';

grant select on group_monitor_function_xref to 'public' as 'informix';

grant insert on group_monitor_function_xref to 'public' as 'informix';

grant delete on group_monitor_function_xref to 'public' as 'informix';

grant update on generic_counter_client to 'public' as 'informix';

grant select on generic_counter_client to 'public' as 'informix';

grant index on generic_counter_client to 'public' as 'informix';

grant insert on generic_counter_client to 'public' as 'informix';

grant delete on generic_counter_client to 'public' as 'informix';

grant insert on company_user_xref to 'public' as 'informix';

grant select on company_user_xref to 'public' as 'informix';

grant delete on company_user_xref to 'public' as 'informix';

grant update on company_user_xref to 'public' as 'informix';

grant update on company_image_xref to 'public' as 'informix';

grant insert on company_image_xref to 'public' as 'informix';

grant select on company_image_xref to 'public' as 'informix';

grant delete on company_image_xref to 'public' as 'informix';

grant select on coder_confirmation to 'public' as 'informix';

grant delete on coder_confirmation to 'public' as 'informix';

grant insert on coder_confirmation to 'public' as 'informix';

grant update on coder_confirmation to 'public' as 'informix';

grant insert on component_type_lu to 'public' as 'informix';

grant delete on component_type_lu to 'public' as 'informix';

grant update on component_type_lu to 'public' as 'informix';

grant select on component_type_lu to 'public' as 'informix';

grant select on problem_type_lu to 'public' as 'informix';

grant insert on problem_type_lu to 'public' as 'informix';

grant update on problem_type_lu to 'public' as 'informix';

grant delete on problem_type_lu to 'public' as 'informix';

grant update on parameter to 'public' as 'informix';

grant insert on parameter to 'public' as 'informix';

grant delete on parameter to 'public' as 'informix';

grant select on parameter to 'public' as 'informix';

grant update on component_solution_xref to 'public' as 'informix';

grant delete on component_solution_xref to 'public' as 'informix';

grant select on component_solution_xref to 'public' as 'informix';

grant insert on component_solution_xref to 'public' as 'informix';

grant insert on component_status_lu to 'public' as 'informix';

grant select on component_status_lu to 'public' as 'informix';

grant update on component_status_lu to 'public' as 'informix';

grant delete on component_status_lu to 'public' as 'informix';

grant select on data_type_mapping to 'public' as 'informix';

grant update on data_type_mapping to 'public' as 'informix';

grant delete on data_type_mapping to 'public' as 'informix';

grant insert on data_type_mapping to 'public' as 'informix';

grant insert on web_service to 'public' as 'informix';

grant delete on web_service to 'public' as 'informix';

grant select on web_service to 'public' as 'informix';

grant update on web_service to 'public' as 'informix';

grant insert on web_service_file_type to 'public' as 'informix';

grant update on web_service_file_type to 'public' as 'informix';

grant delete on web_service_file_type to 'public' as 'informix';

grant select on web_service_file_type to 'public' as 'informix';

grant delete on web_service_source_file to 'public' as 'informix';

grant insert on web_service_source_file to 'public' as 'informix';

grant update on web_service_source_file to 'public' as 'informix';

grant select on web_service_source_file to 'public' as 'informix';

grant update on web_service_compilation to 'public' as 'informix';

grant select on web_service_compilation to 'public' as 'informix';

grant insert on web_service_compilation to 'public' as 'informix';

grant delete on web_service_compilation to 'public' as 'informix';

grant select on component_web_service_xref to 'public' as 'informix';

grant update on component_web_service_xref to 'public' as 'informix';

grant insert on component_web_service_xref to 'public' as 'informix';

grant delete on component_web_service_xref to 'public' as 'informix';

grant insert on problem_payment to 'public' as 'informix';

grant update on problem_payment to 'public' as 'informix';

grant select on problem_payment to 'public' as 'informix';

grant delete on problem_payment to 'public' as 'informix';

grant update on component to 'public' as 'informix';

grant insert on component to 'public' as 'informix';

grant delete on component to 'public' as 'informix';

grant select on component to 'public' as 'informix';

grant insert on file_type_lu to 'public' as 'informix';

grant select on file_type_lu to 'public' as 'informix';

grant delete on file_type_lu to 'public' as 'informix';

grant update on file_type_lu to 'public' as 'informix';

grant delete on resume to 'public' as 'informix';

grant select on resume to 'public' as 'informix';

grant insert on resume to 'public' as 'informix';

grant update on resume to 'public' as 'informix';

grant select on campaign to 'public' as 'informix';

grant update on campaign to 'public' as 'informix';

grant insert on campaign to 'public' as 'informix';

grant delete on campaign to 'public' as 'informix';

grant delete on activity to 'public' as 'informix';

grant update on activity to 'public' as 'informix';

grant select on activity to 'public' as 'informix';

grant insert on activity to 'public' as 'informix';

grant select on campaign_activity_xref to 'public' as 'informix';

grant delete on campaign_activity_xref to 'public' as 'informix';

grant insert on campaign_activity_xref to 'public' as 'informix';

grant update on campaign_activity_xref to 'public' as 'informix';

grant delete on campaign_job_xref to 'public' as 'informix';

grant update on campaign_job_xref to 'public' as 'informix';

grant select on campaign_job_xref to 'public' as 'informix';

grant insert on campaign_job_xref to 'public' as 'informix';

grant insert on problem to 'public' as 'informix';

grant delete on problem to 'public' as 'informix';

grant select on problem to 'public' as 'informix';

grant update on problem to 'public' as 'informix';

grant insert on sched_job_detail to 'public' as 'informix';

grant select on sched_job_detail to 'public' as 'informix';

grant update on sched_job_detail to 'public' as 'informix';

grant delete on sched_job_detail to 'public' as 'informix';

grant insert on round_image_xref to 'public' as 'informix';

grant select on round_image_xref to 'public' as 'informix';

grant update on round_image_xref to 'public' as 'informix';

grant delete on round_image_xref to 'public' as 'informix';

grant select on wl_coder to 'public' as 'informix';

grant delete on wl_coder to 'public' as 'informix';

grant update on wl_coder to 'public' as 'informix';

grant insert on wl_coder to 'public' as 'informix';

grant delete on wl_round to 'public' as 'informix';

grant insert on wl_round to 'public' as 'informix';

grant update on wl_round to 'public' as 'informix';

grant select on wl_round to 'public' as 'informix';

grant select on wl_team to 'public' as 'informix';

grant update on wl_team to 'public' as 'informix';

grant insert on wl_team to 'public' as 'informix';

grant delete on wl_team to 'public' as 'informix';

grant select on team_type_lu to 'public' as 'informix';

grant delete on team_type_lu to 'public' as 'informix';

grant update on team_type_lu to 'public' as 'informix';

grant insert on team_type_lu to 'public' as 'informix';

grant update on response to 'public' as 'informix';

grant insert on response to 'public' as 'informix';

grant select on response to 'public' as 'informix';

grant delete on response to 'public' as 'informix';

grant insert on team_coder_component_xref to 'public' as 'informix';

grant update on team_coder_component_xref to 'public' as 'informix';

grant delete on team_coder_component_xref to 'public' as 'informix';

grant select on team_coder_component_xref to 'public' as 'informix';

grant insert on team_coder_xref to 'public' as 'informix';

grant delete on team_coder_xref to 'public' as 'informix';

grant update on team_coder_xref to 'public' as 'informix';

grant select on team_coder_xref to 'public' as 'informix';

grant delete on problem_web_service_xref to 'public' as 'informix';

grant insert on problem_web_service_xref to 'public' as 'informix';

grant select on problem_web_service_xref to 'public' as 'informix';

grant update on problem_web_service_xref to 'public' as 'informix';

grant update on web_service_java_doc to 'public' as 'informix';

grant insert on web_service_java_doc to 'public' as 'informix';

grant select on web_service_java_doc to 'public' as 'informix';

grant delete on web_service_java_doc to 'public' as 'informix';

grant update on compilation to 'public' as 'informix';

grant insert on compilation to 'public' as 'informix';

grant delete on compilation to 'public' as 'informix';

grant select on compilation to 'public' as 'informix';

grant update on submission to 'public' as 'informix';

grant insert on submission to 'public' as 'informix';

grant delete on submission to 'public' as 'informix';

grant select on submission to 'public' as 'informix';

grant index on donation_type_lu to 'public' as 'informix';

grant select on donation_type_lu to 'public' as 'informix';

grant insert on donation_type_lu to 'public' as 'informix';

grant delete on donation_type_lu to 'public' as 'informix';

grant update on donation_type_lu to 'public' as 'informix';

grant select on charity_donation to 'public' as 'informix';

grant insert on charity_donation to 'public' as 'informix';

grant update on charity_donation to 'public' as 'informix';

grant index on charity_donation to 'public' as 'informix';

grant delete on charity_donation to 'public' as 'informix';

grant delete on question to 'public' as 'informix';

grant insert on question to 'public' as 'informix';

grant update on question to 'public' as 'informix';

grant select on question to 'public' as 'informix';

grant delete on problem_rating_question to 'public' as 'informix';

grant select on problem_rating_question to 'public' as 'informix';

grant insert on problem_rating_question to 'public' as 'informix';

grant update on problem_rating_question to 'public' as 'informix';

grant index on problem_rating_question to 'public' as 'informix';

grant delete on problem_rating to 'public' as 'informix';

grant update on problem_rating to 'public' as 'informix';

grant insert on problem_rating to 'public' as 'informix';

grant index on problem_rating to 'public' as 'informix';

grant select on problem_rating to 'public' as 'informix';

grant index on question_image_xref to 'public' as 'informix';

grant update on question_image_xref to 'public' as 'informix';

grant select on question_image_xref to 'public' as 'informix';

grant delete on question_image_xref to 'public' as 'informix';

grant insert on question_image_xref to 'public' as 'informix';

grant delete on visa_letter_request to 'public' as 'informix';

grant insert on visa_letter_request to 'public' as 'informix';

grant update on visa_letter_request to 'public' as 'informix';

grant select on visa_letter_request to 'public' as 'informix';

grant delete on visa_letter_event to 'public' as 'informix';

grant select on visa_letter_event to 'public' as 'informix';

grant update on visa_letter_event to 'public' as 'informix';

grant insert on visa_letter_event to 'public' as 'informix';

grant update on royalty_temp to 'public' as 'informix';

grant select on royalty_temp to 'public' as 'informix';

grant insert on royalty_temp to 'public' as 'informix';

grant delete on royalty_temp to 'public' as 'informix';

grant index on royalty_temp to 'public' as 'informix';

grant delete on assignment_document_type_lu to 'public' as 'informix';

grant select on assignment_document_type_lu to 'public' as 'informix';

grant update on assignment_document_type_lu to 'public' as 'informix';

grant index on assignment_document_type_lu to 'public' as 'informix';

grant insert on assignment_document_type_lu to 'public' as 'informix';

grant select on assignment_document_status_lu to 'public' as 'informix';

grant update on assignment_document_status_lu to 'public' as 'informix';

grant index on assignment_document_status_lu to 'public' as 'informix';

grant delete on assignment_document_status_lu to 'public' as 'informix';

grant insert on assignment_document_status_lu to 'public' as 'informix';

grant index on staging_component_state to 'public' as 'informix';

grant update on staging_component_state to 'public' as 'informix';

grant delete on staging_component_state to 'public' as 'informix';

grant insert on staging_component_state to 'public' as 'informix';

grant select on staging_component_state to 'public' as 'informix';

grant update on round_room_assignment to 'public' as 'informix';

grant insert on round_room_assignment to 'public' as 'informix';

grant delete on round_room_assignment to 'public' as 'informix';

grant select on round_room_assignment to 'public' as 'informix';

grant index on round_room_assignment to 'public' as 'informix';

grant delete on round_terms to 'public' as 'informix';

grant index on round_terms to 'public' as 'informix';

grant update on round_terms to 'public' as 'informix';

grant insert on round_terms to 'public' as 'informix';

grant select on round_terms to 'public' as 'informix';

grant select on round_terms_acceptance to 'public' as 'informix';

grant delete on round_terms_acceptance to 'public' as 'informix';

grant insert on round_terms_acceptance to 'public' as 'informix';

grant index on round_terms_acceptance to 'public' as 'informix';

grant update on round_terms_acceptance to 'public' as 'informix';

grant delete on backup to 'public' as 'informix';

grant select on backup to 'public' as 'informix';

grant insert on backup to 'public' as 'informix';

grant index on backup to 'public' as 'informix';

grant update on backup to 'public' as 'informix';

grant insert on backup_tables to 'public' as 'informix';

grant select on backup_tables to 'public' as 'informix';

grant update on backup_tables to 'public' as 'informix';

grant index on backup_tables to 'public' as 'informix';

grant delete on backup_tables to 'public' as 'informix';

grant select on assignment_document to 'public' as 'informix';

grant index on assignment_document to 'public' as 'informix';

grant insert on assignment_document to 'public' as 'informix';

grant update on assignment_document to 'public' as 'informix';

grant delete on assignment_document to 'public' as 'informix';

grant insert on component_category_lu to 'public' as 'informix';

grant delete on component_category_lu to 'public' as 'informix';

grant index on component_category_lu to 'public' as 'informix';

grant update on component_category_lu to 'public' as 'informix';

grant select on component_category_lu to 'public' as 'informix';

grant update on component_category_xref to 'public' as 'informix';

grant select on component_category_xref to 'public' as 'informix';

grant insert on component_category_xref to 'public' as 'informix';

grant delete on component_category_xref to 'public' as 'informix';

grant index on component_category_xref to 'public' as 'informix';

grant select on room_result to 'public' as 'informix';

grant insert on room_result to 'public' as 'informix';

grant update on room_result to 'public' as 'informix';

grant delete on room_result to 'public' as 'informix';

grant select on campaign_round_xref to 'public' as 'informix';

grant insert on campaign_round_xref to 'public' as 'informix';

grant update on campaign_round_xref to 'public' as 'informix';

grant delete on campaign_round_xref to 'public' as 'informix';

grant index on campaign_round_xref to 'public' as 'informix';

grant update on campaign_type_lu to 'public' as 'informix';

grant insert on campaign_type_lu to 'public' as 'informix';

grant delete on campaign_type_lu to 'public' as 'informix';

grant select on campaign_type_lu to 'public' as 'informix';

grant index on campaign_type_lu to 'public' as 'informix';

grant delete on skill to 'public' as 'informix';

grant update on skill to 'public' as 'informix';

grant select on skill to 'public' as 'informix';

grant insert on skill to 'public' as 'informix';

grant select on coder_skill_type_note_xref to 'public' as 'informix';

grant insert on coder_skill_type_note_xref to 'public' as 'informix';

grant update on coder_skill_type_note_xref to 'public' as 'informix';

grant delete on coder_skill_type_note_xref to 'public' as 'informix';

grant index on coder_skill_type_note_xref to 'public' as 'informix';

grant insert on staging_submission to 'public' as 'informix';

grant select on staging_submission to 'public' as 'informix';

grant update on staging_submission to 'public' as 'informix';

grant delete on staging_submission to 'public' as 'informix';

grant delete on staging_compilation to 'public' as 'informix';

grant update on staging_compilation to 'public' as 'informix';

grant select on staging_compilation to 'public' as 'informix';

grant insert on staging_compilation to 'public' as 'informix';

grant update on staging_system_test_result to 'public' as 'informix';

grant select on staging_system_test_result to 'public' as 'informix';

grant insert on staging_system_test_result to 'public' as 'informix';

grant delete on staging_system_test_result to 'public' as 'informix';

grant insert on staging_system_test_case to 'public' as 'informix';

grant update on staging_system_test_case to 'public' as 'informix';

grant delete on staging_system_test_case to 'public' as 'informix';

grant select on staging_system_test_case to 'public' as 'informix';

grant select on system_test_case to 'public' as 'informix';

grant insert on system_test_case to 'public' as 'informix';

grant update on system_test_case to 'public' as 'informix';

grant delete on system_test_case to 'public' as 'informix';

grant select on country_affidavit_template_xref to 'public' as 'informix';

grant insert on country_affidavit_template_xref to 'public' as 'informix';

grant delete on country_affidavit_template_xref to 'public' as 'informix';

grant update on country_affidavit_template_xref to 'public' as 'informix';

grant index on country_affidavit_template_xref to 'public' as 'informix';

grant index on assignment_document_template to 'public' as 'informix';

grant delete on assignment_document_template to 'public' as 'informix';

grant insert on assignment_document_template to 'public' as 'informix';

grant update on assignment_document_template to 'public' as 'informix';

grant select on assignment_document_template to 'public' as 'informix';

grant select on practice_room_result to 'public' as 'informix';

grant delete on practice_room_result to 'public' as 'informix';

grant update on practice_room_result to 'public' as 'informix';

grant insert on practice_room_result to 'public' as 'informix';

grant select on practice_component_state to 'public' as 'informix';

grant delete on practice_component_state to 'public' as 'informix';

grant update on practice_component_state to 'public' as 'informix';

grant insert on practice_component_state to 'public' as 'informix';

grant insert on message_status_lu to 'public' as 'informix';

grant select on message_status_lu to 'public' as 'informix';

grant delete on message_status_lu to 'public' as 'informix';

grant index on message_status_lu to 'public' as 'informix';

grant update on message_status_lu to 'public' as 'informix';

grant select on message to 'public' as 'informix';

grant update on message to 'public' as 'informix';

grant index on message to 'public' as 'informix';

grant delete on message to 'public' as 'informix';

grant insert on message to 'public' as 'informix';

grant select on user_message_status_lu to 'public' as 'informix';

grant index on user_message_status_lu to 'public' as 'informix';

grant insert on user_message_status_lu to 'public' as 'informix';

grant update on user_message_status_lu to 'public' as 'informix';

grant delete on user_message_status_lu to 'public' as 'informix';

grant delete on user_message to 'public' as 'informix';

grant insert on user_message to 'public' as 'informix';

grant update on user_message to 'public' as 'informix';

grant select on user_message to 'public' as 'informix';

grant index on user_message to 'public' as 'informix';

grant update on failure_type_lu to 'public' as 'informix';

grant insert on failure_type_lu to 'public' as 'informix';

grant delete on failure_type_lu to 'public' as 'informix';

grant index on failure_type_lu to 'public' as 'informix';

grant select on failure_type_lu to 'public' as 'informix';

grant index on payment_detail_pablo to 'public' as 'informix';

grant select on payment_detail_pablo to 'public' as 'informix';

grant update on payment_detail_pablo to 'public' as 'informix';

grant insert on payment_detail_pablo to 'public' as 'informix';

grant delete on payment_detail_pablo to 'public' as 'informix';

grant update on payment_detail_xref_pablo to 'public' as 'informix';

grant insert on payment_detail_xref_pablo to 'public' as 'informix';

grant index on payment_detail_xref_pablo to 'public' as 'informix';

grant select on payment_detail_xref_pablo to 'public' as 'informix';

grant delete on payment_detail_xref_pablo to 'public' as 'informix';

grant delete on payment_pablo to 'public' as 'informix';

grant select on payment_pablo to 'public' as 'informix';

grant update on payment_pablo to 'public' as 'informix';

grant insert on payment_pablo to 'public' as 'informix';

grant index on payment_pablo to 'public' as 'informix';

grant select on timers to 'public' as 'informix';

grant delete on timers to 'public' as 'informix';

grant update on timers to 'public' as 'informix';

grant insert on timers to 'public' as 'informix';

grant index on timers to 'public' as 'informix';

grant insert on jms_messages to 'public' as 'informix';

grant select on jms_messages to 'public' as 'informix';

grant index on jms_messages to 'public' as 'informix';

grant delete on jms_messages to 'public' as 'informix';

grant update on jms_messages to 'public' as 'informix';

grant select on jms_transactions to 'public' as 'informix';

grant insert on jms_transactions to 'public' as 'informix';

grant update on jms_transactions to 'public' as 'informix';

grant delete on jms_transactions to 'public' as 'informix';

grant index on jms_transactions to 'public' as 'informix';

grant update on jms_users to 'public' as 'informix';

grant insert on jms_users to 'public' as 'informix';

grant delete on jms_users to 'public' as 'informix';

grant select on jms_users to 'public' as 'informix';

grant index on jms_users to 'public' as 'informix';

grant index on jms_roles to 'public' as 'informix';

grant insert on jms_roles to 'public' as 'informix';

grant select on jms_roles to 'public' as 'informix';

grant update on jms_roles to 'public' as 'informix';

grant delete on jms_roles to 'public' as 'informix';

grant insert on jms_subscriptions to 'public' as 'informix';

grant delete on jms_subscriptions to 'public' as 'informix';

grant index on jms_subscriptions to 'public' as 'informix';

grant select on jms_subscriptions to 'public' as 'informix';

grant update on jms_subscriptions to 'public' as 'informix';

grant delete on payment_detail_pablo_dec to 'public' as 'informix';

grant select on payment_detail_pablo_dec to 'public' as 'informix';

grant update on payment_detail_pablo_dec to 'public' as 'informix';

grant insert on payment_detail_pablo_dec to 'public' as 'informix';

grant index on payment_detail_pablo_dec to 'public' as 'informix';

grant select on solution_class_file to 'public' as 'informix';

grant delete on solution_class_file to 'public' as 'informix';

grant insert on solution_class_file to 'public' as 'informix';

grant update on solution_class_file to 'public' as 'informix';

grant index on solution_class_file to 'public' as 'informix';

grant update on survey to 'public' as 'informix';

grant insert on survey to 'public' as 'informix';

grant select on survey to 'public' as 'informix';

grant delete on survey to 'public' as 'informix';

grant delete on payment_detail_dr20075 to 'public' as 'informix';

grant select on payment_detail_dr20075 to 'public' as 'informix';

grant index on payment_detail_dr20075 to 'public' as 'informix';

grant update on payment_detail_dr20075 to 'public' as 'informix';

grant insert on payment_detail_dr20075 to 'public' as 'informix';

grant delete on payment_pablo_dec to 'public' as 'informix';

grant insert on payment_pablo_dec to 'public' as 'informix';

grant index on payment_pablo_dec to 'public' as 'informix';

grant update on payment_pablo_dec to 'public' as 'informix';

grant select on payment_pablo_dec to 'public' as 'informix';

grant insert on long_test_queue_status_lu to 'public' as 'informix';

grant update on long_test_queue_status_lu to 'public' as 'informix';

grant select on long_test_queue_status_lu to 'public' as 'informix';

grant delete on long_test_queue_status_lu to 'public' as 'informix';

grant index on long_test_queue_status_lu to 'public' as 'informix';

grant insert on intro_event_property_lu to 'public' as 'informix';

grant select on intro_event_property_lu to 'public' as 'informix';

grant update on intro_event_property_lu to 'public' as 'informix';

grant delete on intro_event_property_lu to 'public' as 'informix';

grant index on intro_event_property_lu to 'public' as 'informix';

grant update on intro_event_config to 'public' as 'informix';

grant index on intro_event_config to 'public' as 'informix';

grant delete on intro_event_config to 'public' as 'informix';

grant insert on intro_event_config to 'public' as 'informix';

grant select on intro_event_config to 'public' as 'informix';

grant index on intro_event to 'public' as 'informix';

grant select on intro_event to 'public' as 'informix';

grant delete on intro_event to 'public' as 'informix';

grant insert on intro_event to 'public' as 'informix';

grant update on intro_event to 'public' as 'informix';

grant index on generic_counter to 'public' as 'informix';

grant delete on generic_counter to 'public' as 'informix';

grant select on generic_counter to 'public' as 'informix';

grant insert on generic_counter to 'public' as 'informix';

grant update on generic_counter to 'public' as 'informix';

grant update on system_test_output to 'public' as 'informix';

grant index on system_test_output to 'public' as 'informix';

grant delete on system_test_output to 'public' as 'informix';

grant insert on system_test_output to 'public' as 'informix';

grant select on system_test_output to 'public' as 'informix';

grant delete on payment_detail_xref_pablo_dec to 'public' as 'informix';

grant update on payment_detail_xref_pablo_dec to 'public' as 'informix';

grant select on payment_detail_xref_pablo_dec to 'public' as 'informix';

grant insert on payment_detail_xref_pablo_dec to 'public' as 'informix';

grant index on payment_detail_xref_pablo_dec to 'public' as 'informix';

grant insert on miketemp to 'public' as 'informix';

grant delete on miketemp to 'public' as 'informix';

grant update on miketemp to 'public' as 'informix';

grant index on miketemp to 'public' as 'informix';

grant select on miketemp to 'public' as 'informix';

grant index on long_component_state to 'public' as 'informix';

grant select on long_component_state to 'public' as 'informix';

grant update on long_component_state to 'public' as 'informix';

grant delete on long_component_state to 'public' as 'informix';

grant insert on long_component_state to 'public' as 'informix';

grant update on long_compilation to 'public' as 'informix';

grant index on long_compilation to 'public' as 'informix';

grant delete on long_compilation to 'public' as 'informix';

grant insert on long_compilation to 'public' as 'informix';

grant select on long_compilation to 'public' as 'informix';

grant index on long_comp_result to 'public' as 'informix';

grant update on long_comp_result to 'public' as 'informix';

grant insert on long_comp_result to 'public' as 'informix';

grant select on long_comp_result to 'public' as 'informix';

grant delete on long_comp_result to 'public' as 'informix';

grant insert on long_submission to 'public' as 'informix';

grant index on long_submission to 'public' as 'informix';

grant select on long_submission to 'public' as 'informix';

grant delete on long_submission to 'public' as 'informix';

grant update on long_submission to 'public' as 'informix';

grant update on long_system_test_result to 'public' as 'informix';

grant select on long_system_test_result to 'public' as 'informix';

grant index on long_system_test_result to 'public' as 'informix';

grant delete on long_system_test_result to 'public' as 'informix';

grant insert on long_system_test_result to 'public' as 'informix';

grant index on long_system_test_output to 'public' as 'informix';

grant select on long_system_test_output to 'public' as 'informix';

grant insert on long_system_test_output to 'public' as 'informix';

grant delete on long_system_test_output to 'public' as 'informix';

grant update on long_system_test_output to 'public' as 'informix';

grant delete on long_test_queue to 'public' as 'informix';

grant insert on long_test_queue to 'public' as 'informix';

grant select on long_test_queue to 'public' as 'informix';

grant index on long_test_queue to 'public' as 'informix';

grant update on long_test_queue to 'public' as 'informix';

grant delete on intro_event_property_type_lu to 'public' as 'informix';

grant index on intro_event_property_type_lu to 'public' as 'informix';

grant select on intro_event_property_type_lu to 'public' as 'informix';

grant update on intro_event_property_type_lu to 'public' as 'informix';

grant insert on intro_event_property_type_lu to 'public' as 'informix';

grant update on compilation_class_file to 'public' as 'informix';

grant delete on compilation_class_file to 'public' as 'informix';

grant select on compilation_class_file to 'public' as 'informix';

grant insert on compilation_class_file to 'public' as 'informix';

grant update on submission_class_file to 'public' as 'informix';

grant insert on submission_class_file to 'public' as 'informix';

grant delete on submission_class_file to 'public' as 'informix';

grant select on submission_class_file to 'public' as 'informix';

grant update on country_region_xref to 'public' as 'informix';

grant select on country_region_xref to 'public' as 'informix';

grant index on country_region_xref to 'public' as 'informix';

grant insert on country_region_xref to 'public' as 'informix';

grant delete on country_region_xref to 'public' as 'informix';

grant index on payment_detail_xref_dr20075 to 'public' as 'informix';

grant select on payment_detail_xref_dr20075 to 'public' as 'informix';

grant delete on payment_detail_xref_dr20075 to 'public' as 'informix';

grant update on payment_detail_xref_dr20075 to 'public' as 'informix';

grant insert on payment_detail_xref_dr20075 to 'public' as 'informix';

