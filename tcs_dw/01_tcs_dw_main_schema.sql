CREATE DATABASE tcs_dw IN datadbs;
database tcs_dw; 

grant dba to informix ;
grant connect to coder ;
-- User public does not have connect privilege;
create table 'informix'.user_component_score (
    user_component_score_id DECIMAL(10) not null,
    component_id DECIMAL(10) not null,
    component_name NVARCHAR(255) not null,
    user_id DECIMAL(10) not null,
    level_id DECIMAL(4) not null,
    comp_vers_id DECIMAL(10) not null,
    phase_id DECIMAL(3) not null,
    score DECIMAL(5,2) not null,
    money DECIMAL(10,2) default 0 not null,
    processed DECIMAL(16) default 0 not null,
    rating DECIMAL(6),
    place DECIMAL(4),
    submission_date DATETIME YEAR TO DAY not null,
    mod_date_time DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    create_date_time DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null
)
extent size 512 next size 512
lock mode page;

revoke all on user_component_score from 'public';
create table 'informix'.log_type_lu (
    log_type_id DECIMAL(3,0),
    log_type_desc NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on log_type_lu from 'public';
create table 'informix'.update_log (
    log_id SERIAL not null,
    calendar_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION,
    log_type_id DECIMAL(3,0)
)
extent size 512 next size 512
lock mode row;

revoke all on update_log from 'public';
create table 'informix'.project (
    project_id DECIMAL(12,0),
    component_id DECIMAL(12,0),
    component_name NVARCHAR(128),
    num_registrations DECIMAL(5,0),
    num_submissions DECIMAL(5,0),
    num_valid_submissions DECIMAL(5,0),
    avg_raw_score DECIMAL(5,2),
    avg_final_score DECIMAL(5,2),
    phase_id DECIMAL(5,0),
    phase_desc NVARCHAR(64),
    category_id DECIMAL(12,0),
    category_desc NVARCHAR(64),
    posting_date DATETIME YEAR TO SECOND,
    submitby_date DATETIME YEAR TO SECOND,
    complete_date DATETIME YEAR TO SECOND,
    review_phase_id DECIMAL(3,0),
    review_phase_name NVARCHAR(30),
    status_id DECIMAL(3,0),
    status_desc NVARCHAR(50),
    level_id DECIMAL(5,0),
    version_id DECIMAL(3,0),
    version_text NCHAR(20),
    rating_date DATETIME YEAR TO FRACTION,
    viewable_category_ind DECIMAL(1,0),
    num_submissions_passed_review DECIMAL(5,0),
    winner_id DECIMAL(10,0),
    stage_id DECIMAL(6,0),
    digital_run_ind DECIMAL(1,0) default 1,
    suspended_ind DECIMAL(1,0) default 0,
    project_category_id INT,
    project_category_name VARCHAR(254),
    tc_direct_project_id INT,
    admin_fee DECIMAL(10, 2),
    contest_prizes_total DECIMAL(10, 2),
    client_project_id INTEGER,
    start_date_calendar_id DECIMAL(12, 0),
    duration DECIMAL(10, 2),
    fulfillment DECIMAL(10, 2)
)
extent size 512 next size 512
lock mode page;

revoke all on project from 'public';
create table 'informix'.contest (
    contest_id DECIMAL(12,0),
    contest_name NVARCHAR(128),
    contest_type_id DECIMAL(5,0),
    contest_type_desc NVARCHAR(64),
    contest_start_timestamp DATETIME YEAR TO SECOND,
    contest_end_timestamp DATETIME YEAR TO SECOND,
    phase_id DECIMAL(5,0),
    event_id DECIMAL(10,0),
    project_category_id INT,
    project_category_name VARCHAR(254)
)
extent size 128 next size 128
lock mode page;

revoke all on contest from 'public';
create table 'informix'.contest_project_xref (
    project_id DECIMAL(12,0),
    contest_id DECIMAL(12,0)
)
extent size 512 next size 512
lock mode page;

revoke all on contest_project_xref from 'public';
create table 'informix'.project_result (
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    submit_ind DECIMAL(1,0),
    valid_submission_ind DECIMAL(1,0),
    raw_score DECIMAL(5,2),
    final_score DECIMAL(5,2),
    inquire_timestamp DATETIME YEAR TO MINUTE,
    submit_timestamp DATETIME YEAR TO MINUTE,
    review_complete_timestamp DATETIME YEAR TO MINUTE,
    payment DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_reliability DECIMAL(5,4),
    new_reliability DECIMAL(5,4),
    placed DECIMAL(6,0),
    rating_ind DECIMAL(1,0),
    passed_review_ind DECIMAL(1,0),
    points_awarded FLOAT,
    final_points FLOAT,
    potential_points FLOAT,
    reliable_submission_ind DECIMAL(1,0),
    num_appeals DECIMAL(3,0),
    num_successful_appeals DECIMAL(3,0),
    old_rating_id INT,
    new_rating_id INT,
    num_ratings DECIMAL(6,0),
    rating_order INT
)
extent size 2048 next size 2048
lock mode page;

revoke all on project_result from 'public';
create table 'informix'.submission_review (
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    num_appeals DECIMAL(3,0),
    num_successful_appeals DECIMAL(3,0),
    final_score DECIMAL(5,2),
    raw_score DECIMAL(5,2),
    review_resp_id DECIMAL(3,0),
    scorecard_id DECIMAL(12,0),
    scorecard_template_id DECIMAL(12,0)
)
extent size 2048 next size 2048
lock mode page;

revoke all on submission_review from 'public';
create table 'informix'.user_contest_prize (
    user_id DECIMAL(12,0),
    contest_id DECIMAL(12,0),
    prize_type_id DECIMAL(5,0),
    place DECIMAL(3,0),
    prize_description NVARCHAR(64),
    prize_amount DECIMAL(10,2),
    prize_payment DECIMAL(10,2)
)
extent size 512 next size 512
lock mode page;

revoke all on user_contest_prize from 'public';
create table 'informix'.royalty (
    user_id DECIMAL(10,0),
    amount DECIMAL(7,2),
    description NVARCHAR(254),
    royalty_date DATE
)
extent size 384 next size 384
lock mode page;

revoke all on royalty from 'public';
create table 'informix'.user_reliability (
    user_id DECIMAL(10,0),
    rating DECIMAL(5,4),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    phase_id DECIMAL(12,0)
)
extent size 496 next size 496
lock mode page;

revoke all on user_reliability from 'public';
create table 'informix'.event (
    event_id DECIMAL(10,0),
    event_name NVARCHAR(128)
)
extent size 64 next size 64
lock mode page;

revoke all on event from 'public';
create table 'informix'.user_event_xref (
    user_id DECIMAL(10,0) not null,
    event_id DECIMAL(10,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 496 next size 496
lock mode page;

revoke all on user_event_xref from 'public';
create table 'informix'.user_rank (
    user_id DECIMAL(10,0),
    phase_id DECIMAL(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    user_rank_type_id DECIMAL(3,0)
)
extent size 1024 next size 1024
lock mode page;

revoke all on user_rank from 'public';
create table 'informix'.user_rank_type_lu (
    user_rank_type_id DECIMAL(3,0),
    user_rank_type_desc NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on user_rank_type_lu from 'public';
create table 'informix'.school_user_rank (
    user_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    rank DECIMAL(7,0),
    rank_no_tie DECIMAL(7,0),
    percentile DECIMAL(7,4),
    user_rank_type_id DECIMAL(3,0),
    phase_id DECIMAL(3,0)
)
extent size 600 next size 296
lock mode page;

revoke all on school_user_rank from 'public';
create table 'informix'.country_user_rank (
    user_id DECIMAL(10,0),
    country_code NVARCHAR(3),
    rank DECIMAL(7,0),
    rank_no_tie DECIMAL(7,0),
    percentile DECIMAL(7,4),
    user_rank_type_id DECIMAL(3,0),
    phase_id DECIMAL(3,0)
)
extent size 600 next size 296
lock mode page;

revoke all on country_user_rank from 'public';
create table 'informix'.command (
    command_id DECIMAL(10,0),
    command_desc NVARCHAR(100),
    command_group_id DECIMAL(5,0)
)
extent size 64 next size 64
lock mode page;

revoke all on command from 'public';
create table 'informix'.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on command_group_lu from 'public';
create table 'informix'.data_type_lu (
    data_type_id DECIMAL(5,0),
    data_type_desc NVARCHAR(16)
)
extent size 64 next size 64
lock mode page;

revoke all on data_type_lu from 'public';
create table 'informix'.input_lu (
    input_id DECIMAL(10,0),
    input_code NVARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on input_lu from 'public';
create table 'informix'.query (
    query_id DECIMAL(10,0),
    text TEXT,
    name NVARCHAR(100),
    ranking INT,
    column_index INT
)
extent size 1024 next size 1024
lock mode page;

revoke all on query from 'public';
create table 'informix'.query_input_xref (
    query_id DECIMAL(10,0),
    optional NCHAR(1),
    default_value NVARCHAR(100),
    input_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on query_input_xref from 'public';
create table 'informix'.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on command_query_xref from 'public';
create table 'informix'.dual (
    value INT
)
extent size 32 next size 32
lock mode page;

revoke all on dual from 'public';
create table 'informix'.submission_screening (
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    final_score DECIMAL(5,2),
    scorecard_id DECIMAL(12,0),
    scorecard_template_id DECIMAL(12,0)
)
extent size 4000 next size 4000
lock mode page;

revoke all on submission_screening from 'public';
create table 'informix'.review_resp (
    review_resp_id DECIMAL(3,0),
    review_resp_desc NVARCHAR(50)
)
extent size 32 next size 32
lock mode page;

revoke all on review_resp from 'public';
create table 'informix'.scorecard_template (
    scorecard_template_id DECIMAL(12,0),
    scorecard_type_id DECIMAL(3,0),
    scorecard_type_desc NVARCHAR(50)
)
extent size 32 next size 32
lock mode page;

revoke all on scorecard_template from 'public';
create table 'informix'.evaluation_lu (
    evaluation_id DECIMAL(3,0),
    evaluation_desc NVARCHAR(50),
    evaluation_value FLOAT,
    evaluation_type_id DECIMAL(3,0),
    evaluation_type_desc NVARCHAR(50)
)
extent size 32 next size 32
lock mode page;

revoke all on evaluation_lu from 'public';
create table 'informix'.scorecard_response (
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    evaluation_id DECIMAL(3,0)
)
extent size 25000 next size 25000
lock mode page;

revoke all on scorecard_response from 'public';
create table 'informix'.testcase_response (
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    num_tests DECIMAL(7,0),
    num_passed DECIMAL(7,0)
)
extent size 25000 next size 25000
lock mode page;

revoke all on testcase_response from 'public';
create table 'informix'.subjective_response (
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    response_text TEXT,
    response_type_id DECIMAL(12,0),
    response_type_desc lvarchar,
    sort DECIMAL(3,0)
)
extent size 500000 next size 500000
lock mode page;

revoke all on subjective_response from 'public';
create table 'informix'.appeal (
    appeal_id DECIMAL(12,0),
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    raw_evaluation_id DECIMAL(3,0),
    final_evaluation_id DECIMAL(3,0),
    appeal_text TEXT,
    appeal_response TEXT,
    successful_ind DECIMAL(1,0)
)
extent size 100000 next size 100000
lock mode page;

revoke all on appeal from 'public';
create table 'informix'.testcase_appeal (
    appeal_id DECIMAL(12,0),
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    raw_num_passed DECIMAL(7,0),
    raw_num_tests DECIMAL(7,0),
    final_num_passed DECIMAL(7,0),
    final_num_tests DECIMAL(7,0),
    appeal_text TEXT,
    appeal_response TEXT,
    successful_ind DECIMAL(1,0)
)
extent size 5000 next size 5000
lock mode page;

revoke all on testcase_appeal from 'public';
create table 'informix'.project_review (
    project_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    total_payment DECIMAL(10,2)
)
extent size 496 next size 496
lock mode page;

revoke all on project_review from 'public';
create table 'informix'.season (
    season_id DECIMAL(6,0),
    start_calendar_id DECIMAL(10,0),
    end_calendar_id DECIMAL(10,0),
    name NVARCHAR(254),
    rookie_competition_ind DECIMAL(1,0),
    next_rookie_season_id DECIMAL(6,0)
)
extent size 64 next size 64
lock mode page;

revoke all on season from 'public';
create table 'informix'.stage (
    stage_id DECIMAL(6,0),
    season_id DECIMAL(6,0),
    start_calendar_id DECIMAL(10,0),
    end_calendar_id DECIMAL(10,0),
    name NVARCHAR(254)
)
extent size 64 next size 64
lock mode page;

revoke all on stage from 'public';
create table 'informix'.rookie (
    user_id DECIMAL(10,0),
    season_id DECIMAL(10,0),
    phase_id DECIMAL(5,0),
    confirmed_ind DECIMAL(1,0)
)
extent size 64 next size 64
lock mode page;

revoke all on rookie from 'public';
create table 'informix'.submission (
    submission_id DECIMAL(12,0) not null,
    submitter_id DECIMAL(12,0) not null,
    project_id DECIMAL(12,0) not null,
    submission_url lvarchar not null,
    submission_type DECIMAL(7) not null
)
extent size 2496 next size 2496
lock mode page;

revoke all on submission from 'public';
create table 'informix'.command_execution (
    command_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    execution_time INT
)
extent size 1000000 next size 1000000
lock mode page;

revoke all on command_execution from 'public';
create table 'informix'.contest_prize (
    contest_prize_id DECIMAL(10,0),
    contest_id DECIMAL(12,0),
    prize_type_id DECIMAL(5,0),
    prize_type_desc VARCHAR(64),
    place DECIMAL(2,0),
    prize_amount DECIMAL(10,2),
    prize_desc VARCHAR(64)
)
extent size 96 next size 96
lock mode row;

revoke all on contest_prize from 'public';
create table 'informix'.contest_stage_xref (
    contest_id DECIMAL(12,0),
    stage_id DECIMAL(6,0),
    top_performers_factor DECIMAL(4,2)
)
extent size 32 next size 32
lock mode row;

revoke all on contest_stage_xref from 'public';
create table 'informix'.contest_season_xref (
    contest_id DECIMAL(12,0),
    season_id DECIMAL(6,0)
)
extent size 32 next size 32
lock mode row;

revoke all on contest_season_xref from 'public';
create table 'informix'.streak_type_lu (
    streak_type_id DECIMAL(3,0),
    streak_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on streak_type_lu from 'public';
create table 'informix'.streak (
    coder_id DECIMAL(10,0),
    streak_type_id DECIMAL(3,0),
    phase_id DECIMAL(3,0),
    start_project_id DECIMAL(12,0),
    end_project_id DECIMAL(12,0),
    length DECIMAL(3,0),
    is_current DECIMAL(1,0)
)
extent size 3000 next size 1000
lock mode page;

revoke all on streak from 'public';
create table 'informix'.project_result_022707 (
    project_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    submit_ind DECIMAL(1,0),
    valid_submission_ind DECIMAL(1,0),
    raw_score DECIMAL(5,2),
    final_score DECIMAL(5,2),
    inquire_timestamp DATETIME YEAR TO MINUTE,
    submit_timestamp DATETIME YEAR TO MINUTE,
    review_complete_timestamp DATETIME YEAR TO MINUTE,
    payment DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_reliability DECIMAL(5,4),
    new_reliability DECIMAL(5,4),
    placed DECIMAL(6,0),
    rating_ind DECIMAL(1,0),
    reliability_ind DECIMAL(1,0),
    passed_review_ind DECIMAL(1,0),
    points_awarded DECIMAL(5,0),
    final_points DECIMAL(5,0),
    point_adjustment DECIMAL(5,0) default 0,
    current_reliability_ind DECIMAL(1,0),
    reliable_submission_ind DECIMAL(1,0),
    num_appeals DECIMAL(3,0),
    num_successful_appeals DECIMAL(3,0),
    old_rating_id INT,
    new_rating_id INT,
    num_ratings DECIMAL(6,0)
)
extent size 2048 next size 2048
lock mode page;

revoke all on project_result_022707 from 'public';
create table 'informix'.contest_result (
    contest_id DECIMAL(12,0),
    coder_id DECIMAL(12,0),
    initial_points FLOAT not null,
    final_points FLOAT not null,
    potential_points FLOAT not null,
    current_place INT,
    current_prize FLOAT
)
extent size 128 next size 128
lock mode page;

revoke all on contest_result from 'public';
create table 'informix'.scorecard_question (
    scorecard_question_id DECIMAL(12,0),
    scorecard_template_id DECIMAL(12,0),
    question_text lvarchar,
    question_weight FLOAT,
    section_id DECIMAL(12,0),
    section_desc NVARCHAR(254),
    section_weight FLOAT,
    section_group_id DECIMAL(12,0),
    section_group_desc NVARCHAR(254),
    question_desc NCHAR(8),
    sort DECIMAL(3,0),
    question_header NVARCHAR(254)
)
extent size 1000 next size 1000
lock mode page;

revoke all on scorecard_question from 'public';
create table 'informix'.sr_bad (
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0)
)
extent size 32 next size 32
lock mode page;

revoke all on sr_bad from 'public';
create table 'informix'.sr_hold (
    scorecard_question_id DECIMAL(12,0),
    scorecard_id DECIMAL(12,0),
    user_id DECIMAL(12,0),
    reviewer_id DECIMAL(12,0),
    project_id DECIMAL(12,0),
    response_text TEXT,
    response_type_id DECIMAL(12,0),
    response_type_desc lvarchar,
    sort DECIMAL(3,0)
)
extent size 32 next size 32
lock mode page;

revoke all on sr_hold from 'public';
create table 'informix'.user_rating (
    user_id DECIMAL(10,0) not null,
    rating DECIMAL(10,0) default 0 not null,
    phase_id DECIMAL(3,0) not null,
    vol DECIMAL(10,0) default 0 not null,
    rating_no_vol DECIMAL(10,0) default 0 not null,
    num_ratings DECIMAL(5,0) default 0 not null,
    mod_date_time DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    create_date_time DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    last_rated_project_id DECIMAL(12,0),
    highest_rating DECIMAL(10,0),
    lowest_rating DECIMAL(10,0)
)
extent size 512 next size 512
lock mode page;

revoke all on user_rating from 'public';
create table 'informix'.dr_points (
    dr_points_id DECIMAL(10,0) not null,
    track_id DECIMAL(10,0) not null,
    dr_points_reference_type_id INT not null,
    dr_points_reference_type_desc VARCHAR(50) not null,
    dr_points_operation_id INT not null,
    dr_points_operation_desc VARCHAR(50) not null,
    dr_points_type_id INT not null,
    dr_points_type_desc VARCHAR(50) not null,
    dr_points_status_id INT not null,
    dr_points_status_desc VARCHAR(50) not null,
    dr_points_desc VARCHAR(100) not null,
    user_id DECIMAL(10,0) not null,
    amount DECIMAL(10,2) not null,
    application_date DATETIME YEAR TO FRACTION not null,
    award_date DATETIME YEAR TO FRACTION not null,
    reference_id DECIMAL(10,0),
    is_potential boolean
)
extent size 2496 next size 2496
lock mode page;

revoke all on dr_points from 'public';
create table 'informix'.track (
    track_id DECIMAL(10,0) not null,
    track_type_id INT not null,
    track_type_desc VARCHAR(50) not null,
    track_status_id INT not null,
    track_status_desc VARCHAR(50) not null,
    track_desc VARCHAR(50) not null,
    track_start_date DATETIME YEAR TO FRACTION not null,
    track_end_date DATETIME YEAR TO FRACTION not null
)
extent size 32 next size 32
lock mode page;

revoke all on track from 'public';
create table 'informix'.track_contest (
    track_contest_id DECIMAL(10,0) not null,
    track_id DECIMAL(10,0) not null,
    track_contest_desc VARCHAR(128) not null,
    track_contest_type_id DECIMAL(10,0) not null,
    track_contest_type_desc VARCHAR(128) not null
)
extent size 32 next size 32
lock mode page;

revoke all on track_contest from 'public';
create table 'informix'.track_contest_results (
    track_contest_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    track_contest_placement INT not null,
    track_contest_prize DECIMAL(12,2),
	taxable_track_contest_prize DECIMAL(12,2)
)
extent size 64 next size 64
lock mode page;

revoke all on track_contest_results from 'public';
create table 'informix'.project_spec_review_xref
  (
    project_id DECIMAL(12,0),
    spec_review_project_id DECIMAL(12,0)
  )  
extent size 64 next size 64 
lock mode page;
revoke all on project_spec_review_xref from 'public';

CREATE TABLE tcd_project_stat (
    tcd_project_id INT,
    project_category_id INT,
    stat_date DATETIME YEAR TO SECOND,
    cost DECIMAL(10, 2),
    duration DECIMAL(10, 2),
    fulfillment INT,
    total_project INT,
    create_user VARCHAR(64),
    create_date DATETIME YEAR to FRACTION,
    modify_user VARCHAR(64),
    modify_date DATETIME YEAR to FRACTION,
    PRIMARY KEY(tcd_project_id, project_category_id, stat_date)
)
extent size 64 next size 64 
lock mode page;
revoke all on tcd_project_stat from 'public';


CREATE TABLE 'informix'.client_project_dim (
    client_project_id INTEGER NOT NULL,
    client_id DECIMAL(12, 0) NOT NULL,
    client_name VARCHAR(64) NOT NULL,
    client_create_date DATETIME YEAR TO SECOND NOT NULL,
    client_modification_date DATETIME YEAR TO SECOND NOT NULL,
    billing_project_id DECIMAL(12, 0) NOT NULL,
    project_name VARCHAR(64) NOT NULL,
    project_create_date DATETIME YEAR TO SECOND NOT NULL,
    project_modification_date DATETIME YEAR TO SECOND NOT NULL,
    billing_account_code VARCHAR(64) NOT NULL
)
extent size 128 next size 128
lock mode page;
revoke all on client_project_dim from 'public';

create table "informix".direct_project_dim 
  (
    direct_project_id integer not null,
    name varchar(200) not null,
    description lvarchar(10000),
    billing_project_id DECIMAL(12, 0),
    project_status_id INT default 1 not null,
    project_create_date DATETIME YEAR TO SECOND NOT NULL,
    project_modification_date DATETIME YEAR TO SECOND NOT NULL
  )  
extent size 128 next size 128
lock mode page;
revoke all on direct_project_dim from 'public';

CREATE TABLE 'informix'.weekly_contest_stats (
    client_project_id INTEGER NOT NULL,
    tc_direct_project_id DECIMAL(12, 0) NOT NULL,
    project_category_id DECIMAL(12, 0) NOT NULL,
    week DECIMAL(4, 0) NOT NULL,
    month DECIMAL(2, 0) NOT NULL,
    year DECIMAL(5, 0) NOT NULL,
    avg_contest_fees DECIMAL(10, 2) NOT NULL,
    avg_member_fees DECIMAL(10, 2) NOT NULL,
    avg_duration DECIMAL(10, 2) NOT NULL,
    avg_fulfillment DECIMAL(10, 2) NOT NULL,
    total_completed_contests DECIMAL(8, 0) NOT NULL,
    total_failed_contests DECIMAL(8, 0) NOT NULL
)
extent size 128 next size 128
lock mode page;
revoke all on weekly_contest_stats from 'public';

CREATE TABLE 'informix'.monthly_contest_stats (
    client_project_id INTEGER NOT NULL,
    tc_direct_project_id DECIMAL(12, 0) NOT NULL,
    project_category_id DECIMAL(12, 0) NOT NULL,
    month DECIMAL(2, 0) NOT NULL,
    year DECIMAL(5, 0) NOT NULL,
    avg_contest_fees DECIMAL(10, 2) NOT NULL,
    avg_member_fees DECIMAL(10, 2) NOT NULL,
    avg_duration DECIMAL(10, 2) NOT NULL,
    avg_fulfillment DECIMAL(10, 2) NOT NULL,
    total_completed_contests DECIMAL(8, 0) NOT NULL,
    total_failed_contests DECIMAL(8, 0) NOT NULL
)
extent size 128 next size 128
lock mode page;
revoke all on monthly_contest_stats from 'public';


CREATE TABLE 'informix'.user_achievement_rule (
	user_achievement_rule_id DECIMAL(12,0) NOT NULL,
    user_achievement_name NVARCHAR(254,0) NOT NULL,
	user_achievement_rule_desc NVARCHAR(254,0) NOT NULL,
	user_achievement_rule_sql_file NVARCHAR(254,0),
	user_achievement_type_id DECIMAL(12,0) NOT NULL,
	is_automated BOOLEAN DEFAULT 't',
	db_schema VARCHAR(50) DEFAULT 'tcs_catalog',
    user_achievement_earned_sql_file NVARCHAR(254,0),
	user_achievement_count_sql_file NVARCHAR(254,0),
    user_achievement_count_query NVARCHAR(254,0)
	
)
extent size 128 next size 128
lock mode page;

revoke all on user_achievement_rule from 'public';

CREATE TABLE 'informix'.user_achievement_type_lu (
	user_achievement_type_id DECIMAL(12,0) NOT NULL,
	user_achievement_type_desc NVARCHAR(254,0) NOT NULL
)
extent size 128 next size 128
lock mode page;

revoke all on user_achievement_type_lu from 'public';

CREATE TABLE 'informix'.user_achievement_xref (
	user_id DECIMAL(12,0) NOT NULL,
	user_achievement_rule_id DECIMAL(12,0) NOT NULL,
	create_date DATETIME YEAR TO FRACTION NOT NULL,
	auto_loaded BOOLEAN,
    is_earned_date_populated BOOLEAN DEFAULT 'f'
)
extent size 128 next size 128
lock mode page;

revoke all on user_achievement_xref from 'public';


create table 'informix'.participation_metrics_report_copilot (
    contest_id DECIMAL(10,0),
    copilot_id INT,
    country_code NVARCHAR(3),
    country VARCHAR(100)
)
extent size 600 next size 296
lock mode page;

revoke all on participation_metrics_report_copilot from 'public';


create table 'informix'.participation_metrics_report_member (
    contest_id DECIMAL(10,0),
    registrant_id INT,
    is_submitter BOOLEAN,
    is_milestone_winner BOOLEAN,
    is_final_winner BOOLEAN,
	num_of_milestone_subs DECIMAL(8, 0),
	num_of_final_subs DECIMAL(8, 0),
	num_of_milestone_wins DECIMAL(8, 0),
	num_of_final_wins DECIMAL(8, 0),
    country_code NVARCHAR(3),
    country VARCHAR(100)
)
extent size 600 next size 296
lock mode page;

revoke all on participation_metrics_report_copilot from 'public';

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
  
  CREATE TABLE 'informix'.jira_issue(
	jira_issue_id INT,
	ticket_id VARCHAR(255),
	reporter VARCHAR(255),
	assignee VARCHAR(255),
	summary VARCHAR(255),
	description TEXT,
	tco_points INT,
	created DATETIME YEAR TO FRACTION,
	updated DATETIME YEAR TO FRACTION,
	due_date DATETIME YEAR TO FRACTION,
	resolution_date DATETIME YEAR TO FRACTION,
	votes INT,
	winner VARCHAR(255),
	payment_amount DECIMAL(15, 2),
	contest_id INT,
	project_id INT,
	status VARCHAR(255),
	PRIMARY KEY(jira_issue_id) CONSTRAINT  "informix".pk_jira_issue
) 
EXTENT SIZE 32 NEXT SIZE 32 
LOCK MODE ROW;

CREATE TABLE 'informix'.copilot_statistics (
    copilot_profile_id INT,
    user_id INT,
    projects_count INT,
    contests_count INT,
    reposts_count INT,
    failures_count INT,
    bug_races_count INT,
    current_projects_count INT,
    current_contests_count INT,
    fulfillment DECIMAL(5,2),
    submission_rate DECIMAL(5,2),
    total_earnings DECIMAL(10,2)
)
EXTENT SIZE 32 NEXT SIZE 32
LOCK MODE PAGE;

revoke all on copilot_statistics from 'public'  as "informix";

CREATE TABLE 'informix'.client_user_stats (
    client_user_stats_id INT not null,
    client_id INT not null,
    year INT not null,
    month INT not null,
    user_count INT not null,
    PRIMARY KEY(client_user_stats_id) CONSTRAINT  "informix".pk_client_user_stats
)
EXTENT SIZE 32 NEXT SIZE 32
LOCK MODE PAGE;

revoke all on client_user_stats from 'public'  as "informix";



create view "informix".active_developers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 113. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_developers from 'public';
create view "informix".active_designers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 112. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_designers from 'public';

create view "informix".active_conceptualizers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 134. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_conceptualizers from 'public';

create view "informix".active_specifiers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 117. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_specifiers from 'public';

create view "informix".active_architects (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 118. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_architects from 'public';

create view "informix".active_assemblers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 125. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_assemblers from 'public';

create view "informix".active_application_testers (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 124. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_application_testers from 'public';

create view "informix".active_test_scenarios_competitors (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 137. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_test_scenarios_competitors from 'public';

create view "informix".active_ui_prototypes_competitors (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 130. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_ui_prototypes_competitors from 'public';

create view "informix".active_ria_builds_competitors (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 135. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_ria_builds_competitors from 'public';

create view "informix".active_content_creation_competitors (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 146. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(180) day(9) to day ) ) ) ;

create view "informix".active_reporting_competitors (user_id) as
   select x0.user_id 
   from "informix".user_rating x0 ,"informix".project x1 
   where ((((x0.last_rated_project_id = x1.project_id ) AND (x0.phase_id = 147. ) ) AND (x1.phase_id = x0.phase_id ) ) AND (x1.posting_date > (CURRENT year to fraction(3) - interval(180) day(9) to day ) ) ) ;

grant select on active_designers to 'informix' with grant option;
grant select on active_developers to 'informix' with grant option;
grant select on active_conceptualizers to 'informix' with grant option;
grant select on active_specifiers to 'informix' with grant option;
grant select on active_architects to 'informix' with grant option;
grant select on active_assemblers to 'informix' with grant option;
grant select on active_application_testers to 'informix' with grant option;
grant select on active_test_scenarios_competitors to 'informix' with grant option;
grant select on active_ui_prototypes_competitors to 'informix' with grant option;
grant select on active_ria_builds_competitors to 'informix' with grant option;
grant select on active_content_creation_competitors to 'informix' with grant option;
grant select on active_reporting_competitors to 'informix' with grant option;

grant select on active_designers to 'coder' as 'informix';
grant select on active_developers to 'coder' as 'informix';
grant select on active_conceptualizers to 'coder' as 'informix';
grant select on active_specifiers to 'coder' as 'informix';
grant select on active_architects to 'coder' as 'informix';
grant select on active_assemblers to 'coder' as 'informix';
grant select on active_application_testers to 'coder' as 'informix';
grant select on active_test_scenarios_competitors to 'coder' as 'informix';
grant select on active_ui_prototypes_competitors to 'coder' as 'informix';
grant select on active_ria_builds_competitors to 'coder' as 'informix';
grant select on active_content_creation_competitors to 'coder' as 'informix';
grant select on active_reporting_competitors to 'coder' as 'informix';
	
grant select on contest_prize to 'public' as 'informix';

grant delete on contest_prize to 'public' as 'informix';

grant update on contest_prize to 'public' as 'informix';

grant insert on contest_prize to 'public' as 'informix';

grant index on contest_prize to 'public' as 'informix';

grant insert on contest_stage_xref to 'public' as 'informix';

grant delete on contest_stage_xref to 'public' as 'informix';

grant select on contest_stage_xref to 'public' as 'informix';

grant index on contest_stage_xref to 'public' as 'informix';

grant update on contest_stage_xref to 'public' as 'informix';

grant select on contest_season_xref to 'public' as 'informix';

grant update on contest_season_xref to 'public' as 'informix';

grant insert on contest_season_xref to 'public' as 'informix';

grant delete on contest_season_xref to 'public' as 'informix';

grant index on contest_season_xref to 'public' as 'informix';

grant insert on streak_type_lu to 'public' as 'informix';

grant delete on streak_type_lu to 'public' as 'informix';

grant update on streak_type_lu to 'public' as 'informix';

grant index on streak_type_lu to 'public' as 'informix';

grant select on streak_type_lu to 'public' as 'informix';

grant insert on streak to 'public' as 'informix';

grant index on streak to 'public' as 'informix';

grant delete on streak to 'public' as 'informix';

grant update on streak to 'public' as 'informix';

grant select on streak to 'public' as 'informix';

grant insert on project_result_022707 to 'public' as 'informix';

grant update on project_result_022707 to 'public' as 'informix';

grant index on project_result_022707 to 'public' as 'informix';

grant delete on project_result_022707 to 'public' as 'informix';

grant select on project_result_022707 to 'public' as 'informix';

grant update on contest_result to 'public' as 'informix';

grant delete on contest_result to 'public' as 'informix';

grant insert on contest_result to 'public' as 'informix';

grant index on contest_result to 'public' as 'informix';

grant select on contest_result to 'public' as 'informix';

grant delete on sr_bad to 'public' as 'informix';

grant select on sr_bad to 'public' as 'informix';

grant index on sr_bad to 'public' as 'informix';

grant update on sr_bad to 'public' as 'informix';

grant insert on sr_bad to 'public' as 'informix';

grant update on sr_hold to 'public' as 'informix';

grant select on sr_hold to 'public' as 'informix';

grant index on sr_hold to 'public' as 'informix';

grant delete on sr_hold to 'public' as 'informix';

grant insert on sr_hold to 'public' as 'informix';

grant delete on dr_points to 'public' as 'informix';

grant index on dr_points to 'public' as 'informix';

grant update on dr_points to 'public' as 'informix';

grant insert on dr_points to 'public' as 'informix';

grant select on dr_points to 'public' as 'informix';

grant insert on track to 'public' as 'informix';

grant delete on track to 'public' as 'informix';

grant update on track to 'public' as 'informix';

grant index on track to 'public' as 'informix';

grant select on track to 'public' as 'informix';

grant update on track_contest to 'public' as 'informix';

grant insert on track_contest to 'public' as 'informix';

grant index on track_contest to 'public' as 'informix';

grant delete on track_contest to 'public' as 'informix';

grant select on track_contest to 'public' as 'informix';

grant insert on track_contest_results to 'public' as 'informix';

grant index on track_contest_results to 'public' as 'informix';

grant select on track_contest_results to 'public' as 'informix';

grant update on track_contest_results to 'public' as 'informix';

grant delete on track_contest_results to 'public' as 'informix';

grant delete on contest_project_xref to 'public' as 'informix';

grant insert on contest_project_xref to 'public' as 'informix';

grant select on contest_project_xref to 'public' as 'informix';

grant update on contest_project_xref to 'public' as 'informix';

grant delete on project_result to 'public' as 'informix';

grant select on project_result to 'public' as 'informix';

grant insert on project_result to 'public' as 'informix';

grant update on project_result to 'public' as 'informix';

grant select on submission_review to 'public' as 'informix';

grant insert on submission_review to 'public' as 'informix';

grant delete on submission_review to 'public' as 'informix';

grant update on submission_review to 'public' as 'informix';

grant insert on user_contest_prize to 'public' as 'informix';

grant delete on user_contest_prize to 'public' as 'informix';

grant select on user_contest_prize to 'public' as 'informix';

grant update on user_contest_prize to 'public' as 'informix';

grant delete on royalty to 'public' as 'informix';

grant update on royalty to 'public' as 'informix';

grant select on royalty to 'public' as 'informix';

grant insert on royalty to 'public' as 'informix';

grant select on user_reliability to 'public' as 'informix';

grant index on user_reliability to 'public' as 'informix';

grant update on user_reliability to 'public' as 'informix';

grant delete on user_reliability to 'public' as 'informix';

grant insert on user_reliability to 'public' as 'informix';

grant insert on event to 'public' as 'informix';

grant index on event to 'public' as 'informix';

grant delete on event to 'public' as 'informix';

grant select on event to 'public' as 'informix';

grant update on event to 'public' as 'informix';

grant index on user_event_xref to 'public' as 'informix';

grant delete on user_event_xref to 'public' as 'informix';

grant insert on user_event_xref to 'public' as 'informix';

grant update on user_event_xref to 'public' as 'informix';

grant select on user_event_xref to 'public' as 'informix';

grant delete on user_rank to 'public' as 'informix';

grant update on user_rank to 'public' as 'informix';

grant index on user_rank to 'public' as 'informix';

grant select on user_rank to 'public' as 'informix';

grant insert on user_rank to 'public' as 'informix';

grant delete on user_rank_type_lu to 'public' as 'informix';

grant select on user_rank_type_lu to 'public' as 'informix';

grant insert on user_rank_type_lu to 'public' as 'informix';

grant index on user_rank_type_lu to 'public' as 'informix';

grant update on user_rank_type_lu to 'public' as 'informix';

grant index on school_user_rank to 'public' as 'informix';

grant select on school_user_rank to 'public' as 'informix';

grant update on school_user_rank to 'public' as 'informix';

grant insert on school_user_rank to 'public' as 'informix';

grant delete on school_user_rank to 'public' as 'informix';

grant select on country_user_rank to 'public' as 'informix';

grant index on country_user_rank to 'public' as 'informix';

grant insert on country_user_rank to 'public' as 'informix';

grant delete on country_user_rank to 'public' as 'informix';

grant update on country_user_rank to 'public' as 'informix';

grant update on command to 'public' as 'informix';

grant index on command to 'public' as 'informix';

grant delete on command to 'public' as 'informix';

grant insert on command to 'public' as 'informix';

grant select on command to 'public' as 'informix';

grant update on command_group_lu to 'public' as 'informix';

grant insert on command_group_lu to 'public' as 'informix';

grant index on command_group_lu to 'public' as 'informix';

grant select on command_group_lu to 'public' as 'informix';

grant delete on command_group_lu to 'public' as 'informix';

grant insert on data_type_lu to 'public' as 'informix';

grant delete on data_type_lu to 'public' as 'informix';

grant select on data_type_lu to 'public' as 'informix';

grant index on data_type_lu to 'public' as 'informix';

grant update on data_type_lu to 'public' as 'informix';

grant insert on input_lu to 'public' as 'informix';

grant delete on input_lu to 'public' as 'informix';

grant update on input_lu to 'public' as 'informix';

grant select on input_lu to 'public' as 'informix';

grant index on input_lu to 'public' as 'informix';

grant insert on query to 'public' as 'informix';

grant index on query to 'public' as 'informix';

grant update on query to 'public' as 'informix';

grant delete on query to 'public' as 'informix';

grant select on query to 'public' as 'informix';

grant insert on query_input_xref to 'public' as 'informix';

grant select on query_input_xref to 'public' as 'informix';

grant update on query_input_xref to 'public' as 'informix';

grant delete on query_input_xref to 'public' as 'informix';

grant index on query_input_xref to 'public' as 'informix';

grant insert on command_query_xref to 'public' as 'informix';

grant index on command_query_xref to 'public' as 'informix';

grant delete on command_query_xref to 'public' as 'informix';

grant select on command_query_xref to 'public' as 'informix';

grant update on command_query_xref to 'public' as 'informix';

grant index on dual to 'public' as 'informix';

grant insert on dual to 'public' as 'informix';

grant update on dual to 'public' as 'informix';

grant select on dual to 'public' as 'informix';

grant delete on dual to 'public' as 'informix';

grant delete on submission_screening to 'public' as 'informix';

grant update on submission_screening to 'public' as 'informix';

grant insert on submission_screening to 'public' as 'informix';

grant index on submission_screening to 'public' as 'informix';

grant select on submission_screening to 'public' as 'informix';

grant update on review_resp to 'public' as 'informix';

grant select on review_resp to 'public' as 'informix';

grant insert on review_resp to 'public' as 'informix';

grant delete on review_resp to 'public' as 'informix';

grant index on review_resp to 'public' as 'informix';

grant update on scorecard_template to 'public' as 'informix';

grant select on scorecard_template to 'public' as 'informix';

grant insert on scorecard_template to 'public' as 'informix';

grant delete on scorecard_template to 'public' as 'informix';

grant index on scorecard_template to 'public' as 'informix';

grant delete on evaluation_lu to 'public' as 'informix';

grant update on evaluation_lu to 'public' as 'informix';

grant insert on evaluation_lu to 'public' as 'informix';

grant index on evaluation_lu to 'public' as 'informix';

grant select on evaluation_lu to 'public' as 'informix';

grant index on scorecard_response to 'public' as 'informix';

grant insert on scorecard_response to 'public' as 'informix';

grant delete on scorecard_response to 'public' as 'informix';

grant update on scorecard_response to 'public' as 'informix';

grant select on scorecard_response to 'public' as 'informix';

grant select on testcase_response to 'public' as 'informix';

grant update on testcase_response to 'public' as 'informix';

grant delete on testcase_response to 'public' as 'informix';

grant index on testcase_response to 'public' as 'informix';

grant insert on testcase_response to 'public' as 'informix';

grant insert on subjective_response to 'public' as 'informix';

grant update on subjective_response to 'public' as 'informix';

grant select on subjective_response to 'public' as 'informix';

grant index on subjective_response to 'public' as 'informix';

grant delete on subjective_response to 'public' as 'informix';

grant insert on appeal to 'public' as 'informix';

grant update on appeal to 'public' as 'informix';

grant delete on appeal to 'public' as 'informix';

grant select on appeal to 'public' as 'informix';

grant index on appeal to 'public' as 'informix';

grant select on testcase_appeal to 'public' as 'informix';

grant insert on testcase_appeal to 'public' as 'informix';

grant update on testcase_appeal to 'public' as 'informix';

grant index on testcase_appeal to 'public' as 'informix';

grant delete on testcase_appeal to 'public' as 'informix';

grant delete on scorecard_question to 'public' as 'informix';

grant index on scorecard_question to 'public' as 'informix';

grant update on scorecard_question to 'public' as 'informix';

grant select on scorecard_question to 'public' as 'informix';

grant insert on scorecard_question to 'public' as 'informix';

grant delete on project_review to 'public' as 'informix';

grant insert on project_review to 'public' as 'informix';

grant update on project_review to 'public' as 'informix';

grant index on project_review to 'public' as 'informix';

grant select on project_review to 'public' as 'informix';

grant insert on season to 'public' as 'informix';

grant index on season to 'public' as 'informix';

grant select on season to 'public' as 'informix';

grant delete on season to 'public' as 'informix';

grant update on season to 'public' as 'informix';

grant insert on stage to 'public' as 'informix';

grant index on stage to 'public' as 'informix';

grant select on stage to 'public' as 'informix';

grant delete on stage to 'public' as 'informix';

grant update on stage to 'public' as 'informix';

grant select on rookie to 'public' as 'informix';

grant delete on rookie to 'public' as 'informix';

grant update on rookie to 'public' as 'informix';

grant insert on rookie to 'public' as 'informix';

grant index on rookie to 'public' as 'informix';

grant index on submission to 'public' as 'informix';

grant insert on submission to 'public' as 'informix';

grant delete on submission to 'public' as 'informix';

grant select on submission to 'public' as 'informix';

grant update on submission to 'public' as 'informix';

grant delete on command_execution to 'public' as 'informix';

grant insert on command_execution to 'public' as 'informix';

grant select on command_execution to 'public' as 'informix';

grant update on command_execution to 'public' as 'informix';

grant index on command_execution to 'public' as 'informix';

grant select on user_rating to 'public' as 'informix';

grant delete on user_rating to 'public' as 'informix';

grant insert on user_rating to 'public' as 'informix';

grant update on user_rating to 'public' as 'informix';

grant index on user_rating to 'public' as 'informix';

grant delete on log_type_lu to 'public' as 'informix';

grant update on log_type_lu to 'public' as 'informix';

grant select on log_type_lu to 'public' as 'informix';

grant index on log_type_lu to 'public' as 'informix';

grant insert on log_type_lu to 'public' as 'informix';

grant insert on update_log to 'public' as 'informix';

grant delete on update_log to 'public' as 'informix';

grant select on update_log to 'public' as 'informix';

grant update on update_log to 'public' as 'informix';

grant index on update_log to 'public' as 'informix';

grant delete on project to 'public' as 'informix';

grant insert on project to 'public' as 'informix';

grant select on project to 'public' as 'informix';

grant update on project to 'public' as 'informix';

grant update on contest to 'public' as 'informix';

grant select on contest to 'public' as 'informix';

grant delete on contest to 'public' as 'informix';

grant insert on contest to 'public' as 'informix';

grant update on project_spec_review_xref to 'public' as 'informix';

grant select on project_spec_review_xref to 'public' as 'informix';

grant delete on project_spec_review_xref to 'public' as 'informix';

grant insert on project_spec_review_xref to 'public' as 'informix';

grant select, delete, update, insert on tcd_project_stat to 'public' as 'informix';


grant index on client_project_dim to 'public' as 'informix';
grant update on client_project_dim to 'public' as 'informix';
grant delete on client_project_dim to 'public' as 'informix';
grant select on client_project_dim to 'public' as 'informix';
grant insert on client_project_dim to 'public' as 'informix';

grant index on weekly_contest_stats to 'public' as 'informix';
grant update on weekly_contest_stats to 'public' as 'informix';
grant delete on weekly_contest_stats to 'public' as 'informix';
grant select on weekly_contest_stats to 'public' as 'informix';
grant insert on weekly_contest_stats to 'public' as 'informix';

grant index, update, delete, select, insert on direct_project_dim to 'public' as 'informix';

grant index, update, delete, select, insert on monthly_contest_stats to 'public' as 'informix';

grant index, update, delete, select, insert on user_achievement_rule to 'public' as 'informix';
grant index, update, delete, select, insert on user_achievement_type_lu to 'public' as 'informix';
grant index, update, delete, select, insert on user_achievement_xref to 'public' as 'informix';



grant index, update, delete, select, insert on participation_metrics_report_copilot to 'public' as 'informix';
grant index, update, delete, select, insert on participation_metrics_report_member to 'public' as 'informix';
grant index, update, delete, select, insert on user_permission_grant to 'public' as 'informix';

CREATE SEQUENCE jira_issue_seq INCREMENT BY 1 START WITH 1 MINVALUE 1;

grant index, update, delete, select, insert on jira_issue to 'public' as 'informix';
grant select on jira_issue_seq to 'public' as 'informix';

grant index, update, delete, select, insert on copilot_statistics to 'public' as 'informix';
grant index, update, delete, select, insert on client_user_stats to 'public' as 'informix';
