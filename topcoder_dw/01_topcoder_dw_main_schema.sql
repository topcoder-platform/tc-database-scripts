CREATE DATABASE topcoder_dw IN datadbs;
database topcoder_dw;

grant dba to informix ;
grant connect to coder ;
grant connect to openaim ;
grant connect to truveo ;
grant connect to openxtraz ;
-- User public does not have connect privilege;
create table 'informix'.calendar (
    calendar_id DECIMAL(10,0),
    year DECIMAL(4,0),
    month_numeric DECIMAL(2,0),
    month_alpha NVARCHAR(10),
    day_of_month DECIMAL(2,0),
    day_of_week DECIMAL(1,0),
    week_day NVARCHAR(15),
    year_month NVARCHAR(7),
    week_of_year DECIMAL(2,0),
    day_of_year DECIMAL(3,0),
    holiday NCHAR(1),
    weekend NCHAR(1),
    date DATETIME YEAR TO DAY,
    week_year DECIMAL(4,0),
    quarter_of_year DECIMAL(1,0)
)
extent size 1000 next size 496
lock mode page;

revoke all on calendar from 'public';
create table 'informix'.language_lu (
    language_id DECIMAL(3,0),
    language_name NVARCHAR(30) not null,
    status NCHAR(1) not null,
    language_desc NVARCHAR(50)
)
extent size 64 next size 64
lock mode page;

revoke all on language_lu from 'public';
create table 'informix'.room_type_lu (
    room_type_id DECIMAL(3,0),
    room_type_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on room_type_lu from 'public';
create table 'informix'.division_lu (
    division_id DECIMAL(3,0),
    division_desc NVARCHAR(50)
)
extent size 64 next size 64
lock mode page;

revoke all on division_lu from 'public';
create table 'informix'.level_lu (
    level_id DECIMAL(3,0),
    level NVARCHAR(15),
    level_desc NVARCHAR(50)
)
extent size 64 next size 64
lock mode page;

revoke all on level_lu from 'public';
create table 'informix'.contest (
    contest_id DECIMAL(10,0),
    name NVARCHAR(50) not null,
    start_date DATETIME YEAR TO FRACTION,
    end_date DATETIME YEAR TO FRACTION,
    status NCHAR(1) default 'I',
    group_id DECIMAL(10,0) default -1,
    ad_text NVARCHAR(250),
    ad_start DATETIME YEAR TO FRACTION,
    ad_end DATETIME YEAR TO FRACTION,
    ad_task NVARCHAR(30),
    ad_command NVARCHAR(30),
    season_id DECIMAL(6,0)
)
extent size 128 next size 128
lock mode page;

revoke all on contest from 'public';
create table 'informix'.data_type_lu (
    data_type_id DECIMAL(5,0),
    data_type_desc NVARCHAR(16)
)
extent size 64 next size 64
lock mode page;

revoke all on data_type_lu from 'public';
create table 'informix'.coder_problem (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    problem_id DECIMAL(10,0),
    submission_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    end_status_id DECIMAL(3,0),
    end_status_text NVARCHAR(50),
    open_order DECIMAL(3,0),
    submit_order DECIMAL(3,0),
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    time_elapsed DECIMAL(14,0),
    level_id DECIMAL(3,0),
    level_desc NVARCHAR(50),
    language_id DECIMAL(3,0),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    defense_points DECIMAL(12,2),
    placed DECIMAL(5,0),
    total_execution_time DECIMAL(14,0),
    language_placed DECIMAL(5,0)
)
extent size 100000 next size 50000
lock mode page;

revoke all on coder_problem from 'public';
create table 'informix'.coder_division (
    coder_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    defense_points DECIMAL(12,2),
    average_points DECIMAL(12,2),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 4000 next size 2000
lock mode page;

revoke all on coder_division from 'public';
create table 'informix'.dual (
    value INT
)
extent size 32 next size 32
lock mode page;

revoke all on dual from 'public';
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
extent size 5000 next size 3000
lock mode row;

revoke all on update_log from 'public';
create table 'informix'.challenge (
    challenge_id DECIMAL(10,0),
    defendant_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    succeeded DECIMAL(1,0) not null,
    submit_time DECIMAL(15,0) not null,
    challenger_id DECIMAL(10,0) not null,
    args BYTE,
    message NVARCHAR(100),
    challenger_points DECIMAL(12,2),
    defendant_points DECIMAL(12,2),
    expected BYTE,
    received BYTE,
    time_elapsed DECIMAL(14,0)
)
extent size 250000 next size 100000
lock mode page;

revoke all on challenge from 'public';
create table 'informix'.stc_old (
    test_case_id DECIMAL(10,0),
    problem_id DECIMAL(10,0) not null,
    args BYTE,
    expected_result BYTE,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    example_flag DECIMAL(1,0),
    system_flag DECIMAL(1,0)
)
extent size 200000 next size 100000
lock mode page;

revoke all on stc_old from 'public';
create table 'informix'.skill_type_lu (
    skill_type_id DECIMAL(3,0),
    skill_type_desc NVARCHAR(30),
    skill_type_order DECIMAL(3,0) not null,
    status NCHAR(1) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 64 next size 64
lock mode page;

revoke all on skill_type_lu from 'public';
create table 'informix'.coder_skill_xref (
    coder_id DECIMAL(10,0),
    skill_id DECIMAL(5,0),
    ranking DECIMAL(2,0) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    skill_type_id DECIMAL(3,0)
)
extent size 7496 next size 5000
lock mode page;

revoke all on coder_skill_xref from 'public';
create table 'informix'.coder_update_log (
    log_id SERIAL not null,
    calendar_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION
)
extent size 512 next size 512
lock mode page;

revoke all on coder_update_log from 'public';
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
create table 'informix'.command (
    command_id DECIMAL(10,0),
    command_desc NVARCHAR(100),
    command_group_id DECIMAL(5,0)
)
extent size 64 next size 64
lock mode page;

revoke all on command from 'public';
create table 'informix'.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on command_query_xref from 'public';
create table 'informix'.room (
    room_id DECIMAL(10,0),
    round_id DECIMAL(10,0) not null,
    name NVARCHAR(50),
    state_code NVARCHAR(2),
    state_name NVARCHAR(40),
    country_code NVARCHAR(3),
    country_name NVARCHAR(40),
    division_id DECIMAL(3,0),
    division_desc NVARCHAR(100),
    room_type_id DECIMAL(3,0),
    room_type_desc NVARCHAR(100),
    eligible DECIMAL(1,0),
    unrated DECIMAL(1,0)
)
extent size 1000 next size 1000
lock mode page;

revoke all on room from 'public';
create table 'informix'.problem_submission (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    final_points DECIMAL(12,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    open_time DECIMAL(14,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(12,2),
    status_desc NVARCHAR(100),
    last_submission DECIMAL(1,0)
)
extent size 2000000 next size 1000000
lock mode page;

revoke all on problem_submission from 'public';
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
    start_round_id DECIMAL(10,0),
    end_round_id DECIMAL(10,0),
    length DECIMAL(3,0),
    is_current DECIMAL(1,0)
)
extent size 3000 next size 1000
lock mode page;

revoke all on streak from 'public';
create table 'informix'.round_problem (
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    average_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,7),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    open_order DECIMAL(3,0),
    defense_points DECIMAL(12,2),
    level_id DECIMAL(3,0),
    level_desc NVARCHAR(50),
    avg_time_elapsed DECIMAL(14,0)
)
extent size 512 next size 512
lock mode page;

revoke all on round_problem from 'public';
create table 'informix'.round_division (
    round_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    average_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,7),
    defense_points DECIMAL(12,2),
    num_coders DECIMAL(6,0)
)
extent size 256 next size 256
lock mode page;

revoke all on round_division from 'public';
create table 'informix'.room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    room_seed DECIMAL(3,0),
    paid DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    room_placed DECIMAL(3,0),
    attended NCHAR(1),
    advanced NCHAR(1),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    division_id DECIMAL(3,0),
    submission_points DECIMAL(12,2),
    final_points DECIMAL(7,2),
    problems_presented DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    point_standard_deviation DECIMAL(14,7),
    defense_points DECIMAL(12,2),
    division_seed DECIMAL(6,0),
    division_placed DECIMAL(6,0),
    overall_rank DECIMAL(9,0),
    payment_type_id DECIMAL(3,0),
    payment_type_desc NVARCHAR(100),
    num_ratings DECIMAL(6,0),
    rated_flag DECIMAL(1,0),
    team_id DECIMAL(10,0),
    team_points DECIMAL(5,0),
    region_placed DECIMAL(5,0),
    new_rating_id INT,
    old_rating_id INT
)
extent size 75000 next size 50000
lock mode page;

revoke all on room_result from 'public';
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
create table 'informix'.input_lu (
    input_id DECIMAL(10,0),
    input_code NVARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on input_lu from 'public';
create table 'informix'.round_type_lu (
    round_type_id DECIMAL(3,0),
    round_type_desc NVARCHAR(100),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on round_type_lu from 'public';
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
    close_window DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode page;

revoke all on request from 'public';
create table 'informix'.request_type_lu (
    request_type_id DECIMAL(3,0),
    request_type_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on request_type_lu from 'public';
create table 'informix'.path (
    path_id DECIMAL(10,0),
    path NVARCHAR(255)
)
extent size 64 next size 64
lock mode page;

revoke all on path from 'public';
create table 'informix'.image_type_lu (
    image_type_id DECIMAL(3,0),
    image_type_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on image_type_lu from 'public';
create table 'informix'.image (
    image_id DECIMAL(10,0),
    file_name NVARCHAR(50),
    image_type_id DECIMAL(3,0),
    path_id DECIMAL(10,0),
    link NVARCHAR(255),
    height DECIMAL(5,0),
    width DECIMAL(5,0)
)
extent size 256 next size 256
lock mode page;

revoke all on image from 'public';
create table 'informix'.coder_image_xref (
    coder_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0)
)
extent size 256 next size 256
lock mode page;

revoke all on coder_image_xref from 'public';
create table 'informix'.round_image_xref (
    round_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on round_image_xref from 'public';
create table 'informix'.web_log (
    ip NVARCHAR(20),
    timestamp DATETIME YEAR TO FRACTION,
    page_id DECIMAL(4,0)
)
extent size 512 next size 512
lock mode page;

revoke all on web_log from 'public';
create table 'informix'.web_page (
    page_id DECIMAL(4,0),
    page_name NVARCHAR(32)
)
extent size 512 next size 512
lock mode page;

revoke all on web_page from 'public';
create table 'informix'.coder (
    coder_id DECIMAL(10,0),
    state_code NVARCHAR(2),
    country_code NVARCHAR(3),
    first_name NVARCHAR(100),
    last_name NVARCHAR(100),
    home_phone NVARCHAR(100),
    work_phone NVARCHAR(100),
    address1 NVARCHAR(200),
    address2 NVARCHAR(200),
    city NVARCHAR(100),
    zip NVARCHAR(20),
    middle_name NVARCHAR(100),
    activation_code NVARCHAR(17),
    member_since DATETIME YEAR TO FRACTION,
    notify NCHAR(1),
    quote NVARCHAR(255),
    employer_search NCHAR(1),
    relocate NCHAR(1),
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    editor_id DECIMAL(1,0),
    notify_inquiry NCHAR(1),
    language_id DECIMAL(3,0),
    coder_type_id DECIMAL(3,0),
    handle NVARCHAR(30) not null,
    status NVARCHAR(3),
    email NVARCHAR(100),
    last_login DATETIME YEAR TO FRACTION,
    image INT,
    comp_country_code NVARCHAR(3),
    handle_lower NVARCHAR(30),
    last_site_hit_date DATETIME YEAR TO FRACTION
)
extent size 75000 next size 50000
lock mode page;

revoke all on coder from 'public';
create table 'informix'.rank_type_lu (
    rank_type_id DECIMAL(3,0),
    rank_type_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode page;

revoke all on rank_type_lu from 'public';
create table 'informix'.country (
    country_code NVARCHAR(3),
    country_name NVARCHAR(40) not null,
    participating DECIMAL(1,0),
    longitude DECIMAL(10,7),
    latitude DECIMAL(10,7)
)
extent size 64 next size 64
lock mode page;

revoke all on country from 'public';
create table 'informix'.state (
    state_code NVARCHAR(2),
    state_name NVARCHAR(35) not null,
    region_code NVARCHAR(3)
)
extent size 64 next size 64
lock mode page;

revoke all on state from 'public';
create table 'informix'.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on command_group_lu from 'public';
create table 'informix'.coder_rank_type_lu (
    coder_rank_type_id DECIMAL(3,0),
    coder_rank_type_desc NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on coder_rank_type_lu from 'public';
create table 'informix'.coder_rank (
    coder_id DECIMAL(10,0),
    coder_rank_type_id DECIMAL(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 2000 next size 1000
lock mode page;

revoke all on coder_rank from 'public';
create table 'informix'.coder_rank_history (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_rank_type_id DECIMAL(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 250000 next size 250000
lock mode page;

revoke all on coder_rank_history from 'public';
create table 'informix'.problem (
    problem_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    result_type_id DECIMAL(5,0) not null,
    method_name NVARCHAR(32) not null,
    class_name NVARCHAR(32) not null,
    status DECIMAL(3,0),
    default_solution TEXT,
    language_id DECIMAL(3,0),
    param_types BYTE,
    problem_text TEXT,
    group_id DECIMAL(10,0),
    modify_date DATETIME YEAR TO FRACTION,
    result_type_desc NVARCHAR(100),
    level_id DECIMAL(3,0),
    level_desc NVARCHAR(100),
    division_id DECIMAL(3,0),
    points DECIMAL(7,2),
    viewable DECIMAL(3,0)
)
extent size 200000 next size 100000
lock mode page;

revoke all on problem from 'public';
create table 'informix'.calendar_week (
    year DECIMAL(4,0),
    month DECIMAL(2,0),
    week DECIMAL(1,0),
    start_date DATE,
    end_date DATE,
    quarter DECIMAL(1,0)
)
extent size 32 next size 32
lock mode page;

revoke all on calendar_week from 'public';
create table 'informix'.calendar_month (
    year DECIMAL(4,0),
    month DECIMAL(2,0),
    start_date DATE,
    end_date DATE
)
extent size 32 next size 32
lock mode page;

revoke all on calendar_month from 'public';
create table 'informix'.member_stats_week (
    year DECIMAL(4,0),
    month DECIMAL(2,0),
    week DECIMAL(1,0),
    web_page_views DECIMAL(8,0),
    web_visitors DECIMAL(8,0),
    web_unique_visitors DECIMAL(8,0),
    applet_visitors DECIMAL(7,0),
    applet_minutes DECIMAL(5,0)
)
extent size 128 next size 128
lock mode page;

revoke all on member_stats_week from 'public';
create table 'informix'.country_coder_rank (
    coder_id DECIMAL(10,0),
    country_code NVARCHAR(3),
    rank DECIMAL(7,0),
    rank_no_tie DECIMAL(7,0),
    percentile DECIMAL(7,4),
    coder_rank_type_id DECIMAL(3,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 1000 next size 1000
lock mode page;

revoke all on country_coder_rank from 'public';
create table 'informix'.state_coder_rank (
    coder_id DECIMAL(10,0),
    state_code NVARCHAR(2),
    rank DECIMAL(7,0),
    rank_no_tie DECIMAL(7,0),
    percentile DECIMAL(7,4),
    coder_rank_type_id DECIMAL(3,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 1000 next size 1000
lock mode page;

revoke all on state_coder_rank from 'public';
create table 'informix'.school_coder_rank (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    rank DECIMAL(7,0),
    rank_no_tie DECIMAL(7,0),
    percentile DECIMAL(7,4),
    coder_rank_type_id DECIMAL(3,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 600 next size 296
lock mode page;

revoke all on school_coder_rank from 'public';
create table 'informix'.invite_list (
    coder_id DECIMAL(10,0),
    seed DECIMAL(4,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    contest_id DECIMAL(10,0),
    tournament_rating DECIMAL(5,0),
    round_id DECIMAL(10,0),
    region_code NVARCHAR(3),
    invite_type NCHAR(1)
)
extent size 128 next size 128
lock mode page;

revoke all on invite_list from 'public';
create table 'informix'.problem_language (
    round_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    problem_id DECIMAL(10,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    average_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,7),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    open_order DECIMAL(3,0),
    defense_points DECIMAL(12,2),
    level_id DECIMAL(3,0),
    level_desc NVARCHAR(50),
    avg_time_elapsed DECIMAL(14,0)
)
extent size 2048 next size 2048
lock mode page;

revoke all on problem_language from 'public';
create table 'informix'.problem_category_xref (
    problem_id DECIMAL(10,0) not null,
    problem_category_id DECIMAL(3,0) not null
)
extent size 64 next size 64
lock mode page;

revoke all on problem_category_xref from 'public';
create table 'informix'.problem_category_lu (
    problem_category_id DECIMAL(3,0) not null,
    problem_category_desc NVARCHAR(255) not null
)
extent size 32 next size 32
lock mode page;

revoke all on problem_category_lu from 'public';
create table 'informix'.skill (
    skill_id DECIMAL(5,0),
    skill_type_id DECIMAL(3,0),
    skill_desc NVARCHAR(128) not null,
    status NCHAR(1) not null,
    skill_order DECIMAL(3,0) not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 256 next size 256
lock mode page;

revoke all on skill from 'public';
create table 'informix'.system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    num_iterations DECIMAL(8,0),
    processing_time DECIMAL(14,0),
    deduction_amount DECIMAL(6,2),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    viewable NCHAR(1) default 'N',
    received BYTE,
    succeeded DECIMAL(1,0),
    message NVARCHAR(100),
    score DECIMAL(14,2)
)
extent size 2000000 next size 2000000
lock mode page;

revoke all on system_test_result from 'public';
create table 'informix'.continent (
    continent_id DECIMAL(2,0),
    continent_name NVARCHAR(20)
)
extent size 32 next size 32
lock mode row;

revoke all on continent from 'public';
create table 'informix'.user_achievement (
    coder_id DECIMAL(10,0),
    achievement_date DATE not null,
    achievement_type_id DECIMAL(5,0) not null,
    description NVARCHAR(255),
    achievement_type_desc NVARCHAR(255)
)
extent size 256 next size 256
lock mode page;

revoke all on user_achievement from 'public';
create table 'informix'.school (
    school_id DECIMAL(10,0),
    sort_letter NCHAR(1),
    city NVARCHAR(50),
    state_code NVARCHAR(2),
    country_code NVARCHAR(3),
    name NVARCHAR(100) not null,
    short_name NVARCHAR(20),
    school_type_id DECIMAL(3,0),
    school_type_desc NVARCHAR(100)
)
extent size 2000 next size 1000
lock mode page;

revoke all on school from 'public';
create table 'informix'.long_problem_submission (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    final_points DECIMAL(12,2),
    language_id DECIMAL(3,0),
    open_time DECIMAL(14,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(12,2),
    last_submission DECIMAL(1,0),
    example DECIMAL(1,0),
    status_id DECIMAL(3,0),
    status_desc NVARCHAR(100)
)
extent size 600000 next size 400000
lock mode page;

revoke all on long_problem_submission from 'public';
create table 'informix'.season (
    season_id DECIMAL(6,0),
    start_calendar_id DECIMAL(10,0),
    end_calendar_id DECIMAL(10,0),
    name NVARCHAR(254),
    season_type_id DECIMAL(3,0),
    season_type_desc NVARCHAR(254)
)
extent size 64 next size 64
lock mode page;

revoke all on season from 'public';
create table 'informix'.team (
    team_id DECIMAL(10,0),
    name NVARCHAR(254),
    team_type DECIMAL(3,0),
    school_id DECIMAL(10,0)
)
extent size 64 next size 64
lock mode page;

revoke all on team from 'public';
create table 'informix'.team_rank_type_lu (
    team_rank_type_id DECIMAL(3,0),
    team_rank_type_desc NVARCHAR(100)
)
extent size 32 next size 32
lock mode page;

revoke all on team_rank_type_lu from 'public';
create table 'informix'.season_team_rank (
    team_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    team_rank_type_id DECIMAL(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    team_points INT
)
extent size 64 next size 64
lock mode page;

revoke all on season_team_rank from 'public';
create table 'informix'.season_team_rank_history (
    team_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    round_id DECIMAL(10,0),
    team_rank_type_id DECIMAL(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    team_points INT
)
extent size 64 next size 64
lock mode page;

revoke all on season_team_rank_history from 'public';
create table 'informix'.algo_rating_type_lu (
    algo_rating_type_id DECIMAL(3,0),
    algo_rating_type_desc NVARCHAR(100)
)
extent size 64 next size 64
lock mode row;

revoke all on algo_rating_type_lu from 'public';
create table 'informix'.algo_rating (
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

revoke all on algo_rating from 'public';
create table 'informix'.team_coder_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null
)
extent size 64 next size 64
lock mode page;

revoke all on team_coder_xref from 'public';
create table 'informix'.team_round (
    round_id DECIMAL(10,0),
    team_id DECIMAL(10,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    average_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,7),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    submission_points DECIMAL(12,2),
    final_points DECIMAL(7,2),
    defense_points DECIMAL(12,2),
    num_coders DECIMAL(6,0),
    team_points DECIMAL(6,0),
    team_placed DECIMAL(6,0)
)
extent size 1000 next size 1000
lock mode page;

revoke all on team_round from 'public';
create table 'informix'.season_rank (
    coder_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

revoke all on season_rank from 'public';
create table 'informix'.season_rank_history (
    coder_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    round_id DECIMAL(10,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

revoke all on season_rank_history from 'public';
create table 'informix'.country_rank (
    country_code NVARCHAR(3),
    member_count DECIMAL(7,0),
    rating DECIMAL(9,4),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 64 next size 64
lock mode page;

revoke all on country_rank from 'public';
create table 'informix'.country_rank_history (
    country_code NVARCHAR(3),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(3,0),
    member_count DECIMAL(7,0),
    rating DECIMAL(9,4),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4)
)
extent size 1000 next size 1000
lock mode page;

revoke all on country_rank_history from 'public';
create table 'informix'.season_country_rank (
    country_code NVARCHAR(3),
    season_id DECIMAL(6,0),
    member_count DECIMAL(7,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    rating DECIMAL(9,4)
)
extent size 64 next size 64
lock mode page;

revoke all on season_country_rank from 'public';
create table 'informix'.season_country_rank_history (
    country_code NVARCHAR(3),
    season_id DECIMAL(6,0),
    round_id DECIMAL(10,0),
    member_count DECIMAL(7,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4),
    rating DECIMAL(9,4)
)
extent size 64 next size 64
lock mode page;

revoke all on season_country_rank_history from 'public';
create table 'informix'.algo_rating_history (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(3,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    num_ratings DECIMAL(6,0)
)
extent size 200000 next size 100000
lock mode page;

revoke all on algo_rating_history from 'public';
create table 'informix'.season_algo_rating (
    coder_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    num_ratings DECIMAL(6,0),
    highest_rating DECIMAL(5,0),
    lowest_rating DECIMAL(5,0),
    first_rated_round_id DECIMAL(10,0),
    last_rated_round_id DECIMAL(10,0),
    num_competitions DECIMAL(7,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on season_algo_rating from 'public';
create table 'informix'.current_school (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    viewable DECIMAL(1,0),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2)
)
extent size 2000 next size 1000
lock mode page;

revoke all on current_school from 'public';
create table 'informix'.coder_level (
    coder_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    level_id DECIMAL(3,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    average_points DECIMAL(12,2),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,2),
    defense_points DECIMAL(12,2),
    avg_time_elapsed DECIMAL(14,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 20000 next size 10000
lock mode page;

revoke all on coder_level from 'public';
create table 'informix'.coder_problem_summary (
    coder_id DECIMAL(10,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    defense_points DECIMAL(12,2),
    problems_failed_by_challenge DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 4000 next size 2000
lock mode page;

revoke all on coder_problem_summary from 'public';
create table 'informix'.long_system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    processing_time DECIMAL(14,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    fatal_errors BYTE,
    score FLOAT,
    test_action_id DECIMAL(2,0) default 10 not null,
    fatal_error_ind DECIMAL(1,0) default 0 not null
)
extent size 300000 next size 300000
lock mode row;

revoke all on long_system_test_result from 'public';
create table 'informix'.long_comp_result (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    placed DECIMAL(6,0),
    point_total DECIMAL(12,2),
    num_submissions DECIMAL(5,0),
    attended NCHAR(1),
    system_point_total DECIMAL(14,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    rated_ind DECIMAL(1,0),
    advanced CHAR(1),
    new_rating_id INT,
    old_rating_id INT,
    provisional_placed DECIMAL(6,0),
    num_ratings DECIMAL(6,0)
)
extent size 25000 next size 2000
lock mode page;

revoke all on long_comp_result from 'public';
create table 'informix'.region (
    region_id DECIMAL(3,0),
    region_type_id DECIMAL(3,0),
    region_type_desc NVARCHAR(100),
    region_name NVARCHAR(30)
)
extent size 64 next size 64
lock mode row;

revoke all on region from 'public';
create table 'informix'.season_algo_rating_history (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    num_ratings DECIMAL(6,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on season_algo_rating_history from 'public';
create table 'informix'.user_terms_of_use_xref (
    user_id DECIMAL(10,0),
    terms_of_use_id DECIMAL(5,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 496 next size 248
lock mode row;

revoke all on user_terms_of_use_xref from 'public';
create table 'informix'.mike_temp (
    coder_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode page;

revoke all on mike_temp from 'public';
create table 'informix'.command_execution (
    command_id DECIMAL(10,0),
    timestamp DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    execution_time INT,
    inputs lvarchar(2000)
)
extent size 1000000 next size 1000000
lock mode page;

revoke all on command_execution from 'public';
create table 'informix'.payment (
    payment_id DECIMAL(10,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    payment_type_desc VARCHAR(100),
    reference_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    charity_ind DECIMAL(1,0) default 1 not null,
    show_in_profile_ind DECIMAL(1,0) default 1 not null,
    show_details_ind DECIMAL(1,0) default 1 not null,
    payment_status_id DECIMAL(3,0),
    payment_status_desc VARCHAR(200),
    client VARCHAR(100),
    modified_calendar_id DECIMAL(10,0),
    modified_time_id DECIMAL(10,0),
    installment_number DECIMAL(3,0)
)
extent size 3000 next size 1000
lock mode row;

revoke all on payment from 'public';
create table 'informix'.user_payment (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    gross_amount DECIMAL(12,2),
    due_calendar_id DECIMAL(10,0),
    paid_calendar_id DECIMAL(10,0),
    total_amount DECIMAL(12,2)
)
extent size 1000 next size 1000
lock mode row;

revoke all on user_payment from 'public';
create table 'informix'.problem_tester (
    tester_id DECIMAL(10,0),
    problem_id DECIMAL(10,0)
)
extent size 1000 next size 1000
lock mode row;

revoke all on problem_tester from 'public';
create table 'informix'.problem_writer (
    writer_id DECIMAL(10,0),
    problem_id DECIMAL(10,0)
)
extent size 496 next size 496
lock mode row;

revoke all on problem_writer from 'public';
create table 'informix'.event (
    event_id DECIMAL(10,0),
    event_type_id DECIMAL(3,0),
    event_type_desc VARCHAR(100),
    event_desc VARCHAR(100),
    modify_date DATETIME YEAR TO FRACTION
)
extent size 64 next size 64
lock mode row;

revoke all on event from 'public';
create table 'informix'.event_registration (
    event_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    eligible_ind DECIMAL(1,0),
    notes VARCHAR(255),
    create_date DATETIME YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION
)
extent size 496 next size 248
lock mode row;

revoke all on event_registration from 'public';
create table 'informix'.system_test_case (
    test_case_id DECIMAL(10,0),
    problem_id DECIMAL(10,0) not null,
    args BYTE,
    expected_result BYTE,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    example_flag DECIMAL(1,0),
    system_flag DECIMAL(1,0)
)
extent size 200000 next size 100000
lock mode page;

revoke all on system_test_case from 'public';
create table 'informix'.tournament_group (
    tournament_name VARCHAR(128) not null,
    contest_id DECIMAL(10,0) not null
)
extent size 32 next size 32
lock mode page;

revoke all on tournament_group from 'public';
create table 'informix'.advancer_round (
    round_id DECIMAL(10,0),
    tournament_name VARCHAR(128)
)
extent size 32 next size 32
lock mode page;

revoke all on advancer_round from 'public';
create table 'informix'.contest_coder (
    contest_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    last_round_id DECIMAL(10,0),
    rank DECIMAL(9,0),
    seed DECIMAL(4,0),
    bye_ind DECIMAL(1,0) default 0 not null
)
extent size 2496 next size 2496
lock mode page;

revoke all on contest_coder from 'public';
create table 'informix'.time (
    time_id DECIMAL(5) not null,
    minute DECIMAL(2) not null,
    hour DECIMAL(2) not null,
    hour_24 DECIMAL(2) not null,
    meridiem VARCHAR(20) not null,
    time VARCHAR(20) not null,
    time_12 VARCHAR(8) not null,
    time_24 VARCHAR(8) not null
)
extent size 2496 next size 2496
lock mode page;

revoke all on time from 'public';
create table 'informix'.round (
    round_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    name NVARCHAR(64) not null,
    status NCHAR(1),
    money_paid DECIMAL(12,2),
    failed DECIMAL(3,0),
    calendar_id DECIMAL(10,0),
    round_type_id DECIMAL(3,0),
    notes lvarchar,
    round_type_desc NVARCHAR(100),
    invitational DECIMAL(3,0),
    short_name NVARCHAR(30),
    forum_id DECIMAL(10,0),
    rated_ind DECIMAL(1,0) default 1,
    region_id DECIMAL(3,0),
    time_id DECIMAL(5),
    rating_order DECIMAL(6,0)
)
extent size 512 next size 512
lock mode page;

revoke all on round from 'public';
create table 'informix'.algo_rating_history_backup (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(3,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    num_ratings DECIMAL(6,0)
)
extent size 200000 next size 100000
lock mode page;

revoke all on algo_rating_history_backup from 'public';
create table 'informix'.season_algo_rating_history_backup (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    num_ratings DECIMAL(6,0)
)
extent size 5000 next size 2000
lock mode row;

revoke all on season_algo_rating_history_backup from 'public';
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
create table 'informix'.dok_coder_level (
    coder_id DECIMAL(10,0),
    division_id DECIMAL(3,0),
    level_id DECIMAL(3,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),
    average_points DECIMAL(12,2),
    submission_points DECIMAL(12,2),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    final_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,2),
    defense_points DECIMAL(12,2),
    avg_time_elapsed DECIMAL(14,0),
    algo_rating_type_id DECIMAL(3,0)
)
extent size 20000 next size 10000
lock mode page;

revoke all on dok_coder_level from 'public';
create table 'informix'.payment_dok (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION not null,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 1000 next size 496
lock mode row;

revoke all on payment_dok from 'public';
create table 'informix'.tgh_algo_rating (
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

revoke all on tgh_algo_rating from 'public';
create table 'informix'.tco08_onsite (
    coder_id DECIMAL(10,0)
)
extent size 32 next size 32
lock mode page;

revoke all on tco08_onsite from 'public';
create view "informix".division_winners (round_id,coder_id,division_id,
       calendar_id,round_type_id) as
   select x1.round_id ,x2.coder_id ,x0.division_id ,x1.calendar_id ,
       x1.round_type_id 
   from "informix".room_result x0 ,"informix".round x1 ,"informix".coder x2 
   where ((((x0.division_placed = 1. ) AND (x2.coder_id = x0.coder_id ) ) AND (x1.rated_ind = 1. ) ) AND (x1.round_id = x0.round_id ) ) ;
revoke all on division_winners from 'public';
create view "informix".active_members (coder_id) as
   select x0.coder_id 
   from "informix".algo_rating x0 ,"informix".round x1 ,"informix".calendar x2 
   where ((((((x0.last_rated_round_id > 0. ) AND (x0.last_rated_round_id IS NOT NULL ) ) AND (x0.last_rated_round_id = x1.round_id ) ) AND (x2.calendar_id = x1.calendar_id ) ) AND (x0.algo_rating_type_id = 1. ) ) AND (x2.date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_members from 'public';
create view "informix".active_hs_members (coder_id) as
   select x0.coder_id 
   from "informix".algo_rating x0 ,"informix".round x1 ,"informix".calendar x2 
   where ((((((x0.last_rated_round_id > 0. ) AND (x0.last_rated_round_id IS NOT NULL ) ) AND (x0.last_rated_round_id = x1.round_id ) ) AND (x2.calendar_id = x1.calendar_id ) ) AND (x0.algo_rating_type_id = 2. ) ) AND (x2.date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_hs_members from 'public';
create view "informix".rating (coder_id,rating,num_ratings,vol,
       rating_no_vol,highest_rating,lowest_rating,first_rated_round_id,
       last_rated_round_id,num_competitions) as
   select x0.coder_id ,x0.rating ,x0.num_ratings ,x0.vol ,x0.vol ,
       x0.highest_rating ,x0.lowest_rating ,x0.first_rated_round_id ,
       x0.last_rated_round_id ,x0.num_competitions 
   from "informix".algo_rating x0 
   where (x0.algo_rating_type_id = 1. ) ;
revoke all on rating from 'public';
create view "informix".rating_history (coder_id,round_id,rating,
       vol,num_ratings) as
   select x0.coder_id ,x0.round_id ,x0.rating ,x0.vol ,x0.num_ratings 
   from "informix".algo_rating_history x0 
   where (x0.algo_rating_type_id = 1. ) ;
revoke all on rating_history from 'public';

create view "informix".active_marathon_members (coder_id) as
   select x0.coder_id 
   from "informix".algo_rating x0 ,"informix".round x1 ,"informix".calendar x2 
   where ((((((x0.last_rated_round_id > 0. ) AND (x0.last_rated_round_id IS NOT NULL ) ) AND (x0.last_rated_round_id = x1.round_id ) ) AND (x2.calendar_id = x1.calendar_id ) ) AND (x0.algo_rating_type_id = 3. ) ) AND (x2.date > (CURRENT year to fraction(3) - interval(       180) day(9) to day ) ) ) ;
revoke all on active_marathon_members from 'public';

create view "informix".rated_members (user_id) as
   select x0.coder_id 
   from "informix".algo_rating x0 
   where (x0.num_ratings > 0.0000000000000000 )  union select x1.user_id 
      from tcs_dw:"informix".user_rating x1 
      where (x1.num_ratings > 0.0000000000000000 ) ;
revoke all on rated_members from 'public';


grant select on division_winners to 'informix' with grant option ;

grant select on active_members to 'informix' with grant option ;

grant select on active_hs_members to 'informix' with grant option ;

grant delete on rating to 'informix' with grant option ;

grant insert on rating to 'informix' with grant option ;

grant update on rating to 'informix' with grant option ;

grant select on rating to 'informix' with grant option ;

grant delete on rating_history to 'informix' with grant option ;

grant update on rating_history to 'informix' with grant option ;

grant insert on rating_history to 'informix' with grant option ;

grant select on rating_history to 'informix' with grant option ;

grant select on active_marathon_members to 'informix' with grant option ;

grant select on rated_members to 'informix' with grant option ;

grant select on division_winners to 'coder' as 'informix';

grant select on active_members to 'coder' as 'informix';

grant select on active_hs_members to 'coder' as 'informix';

grant delete on rating to 'coder' as 'informix';

grant insert on rating to 'coder' as 'informix';

grant update on rating to 'coder' as 'informix';

grant select on rating to 'coder' as 'informix';

grant delete on rating_history to 'coder' as 'informix';

grant select on rating_history to 'coder' as 'informix';

grant insert on rating_history to 'coder' as 'informix';

grant update on rating_history to 'coder' as 'informix';

grant delete on coder_rank_history to 'public' as 'informix';

grant insert on coder_rank_history to 'public' as 'informix';

grant update on coder_rank_history to 'public' as 'informix';

grant index on coder_rank_history to 'public' as 'informix';

grant select on coder_rank_history to 'public' as 'informix';

grant insert on problem to 'public' as 'informix';

grant select on problem to 'public' as 'informix';

grant index on problem to 'public' as 'informix';

grant delete on problem to 'public' as 'informix';

grant update on problem to 'public' as 'informix';

grant select on calendar_week to 'public' as 'informix';

grant delete on calendar_week to 'public' as 'informix';

grant insert on calendar_week to 'public' as 'informix';

grant update on calendar_week to 'public' as 'informix';

grant index on calendar_week to 'public' as 'informix';

grant select on calendar to 'public' as 'informix';

grant update on calendar to 'public' as 'informix';

grant index on calendar to 'public' as 'informix';

grant delete on calendar to 'public' as 'informix';

grant insert on calendar to 'public' as 'informix';

grant select on calendar_month to 'public' as 'informix';

grant update on calendar_month to 'public' as 'informix';

grant index on calendar_month to 'public' as 'informix';

grant delete on calendar_month to 'public' as 'informix';

grant insert on calendar_month to 'public' as 'informix';

grant update on member_stats_week to 'public' as 'informix';

grant delete on member_stats_week to 'public' as 'informix';

grant select on member_stats_week to 'public' as 'informix';

grant insert on member_stats_week to 'public' as 'informix';

grant index on member_stats_week to 'public' as 'informix';

grant index on country_coder_rank to 'public' as 'informix';

grant delete on country_coder_rank to 'public' as 'informix';

grant update on country_coder_rank to 'public' as 'informix';

grant insert on country_coder_rank to 'public' as 'informix';

grant select on country_coder_rank to 'public' as 'informix';

grant insert on state_coder_rank to 'public' as 'informix';

grant delete on state_coder_rank to 'public' as 'informix';

grant update on state_coder_rank to 'public' as 'informix';

grant select on state_coder_rank to 'public' as 'informix';

grant index on state_coder_rank to 'public' as 'informix';

grant insert on school_coder_rank to 'public' as 'informix';

grant update on school_coder_rank to 'public' as 'informix';

grant delete on school_coder_rank to 'public' as 'informix';

grant select on school_coder_rank to 'public' as 'informix';

grant index on school_coder_rank to 'public' as 'informix';

grant insert on invite_list to 'public' as 'informix';

grant index on invite_list to 'public' as 'informix';

grant update on invite_list to 'public' as 'informix';

grant select on invite_list to 'public' as 'informix';

grant delete on invite_list to 'public' as 'informix';

grant select on problem_language to 'public' as 'informix';

grant insert on problem_language to 'public' as 'informix';

grant delete on problem_language to 'public' as 'informix';

grant index on problem_language to 'public' as 'informix';

grant update on problem_language to 'public' as 'informix';

grant update on problem_category_xref to 'public' as 'informix';

grant insert on problem_category_xref to 'public' as 'informix';

grant select on problem_category_xref to 'public' as 'informix';

grant delete on problem_category_xref to 'public' as 'informix';

grant update on problem_category_lu to 'public' as 'informix';

grant delete on problem_category_lu to 'public' as 'informix';

grant select on problem_category_lu to 'public' as 'informix';

grant insert on problem_category_lu to 'public' as 'informix';

grant select on skill to 'public' as 'informix';

grant delete on skill to 'public' as 'informix';

grant index on skill to 'public' as 'informix';

grant insert on skill to 'public' as 'informix';

grant update on skill to 'public' as 'informix';

grant insert on system_test_result to 'public' as 'informix';

grant update on system_test_result to 'public' as 'informix';

grant delete on system_test_result to 'public' as 'informix';

grant select on system_test_result to 'public' as 'informix';

grant update on continent to 'public' as 'informix';

grant delete on continent to 'public' as 'informix';

grant index on continent to 'public' as 'informix';

grant select on continent to 'public' as 'informix';

grant insert on continent to 'public' as 'informix';

grant update on user_achievement to 'public' as 'informix';

grant index on user_achievement to 'public' as 'informix';

grant insert on user_achievement to 'public' as 'informix';

grant select on user_achievement to 'public' as 'informix';

grant delete on user_achievement to 'public' as 'informix';

grant index on school to 'public' as 'informix';

grant update on school to 'public' as 'informix';

grant insert on school to 'public' as 'informix';

grant select on school to 'public' as 'informix';

grant delete on school to 'public' as 'informix';

grant insert on long_problem_submission to 'public' as 'informix';

grant delete on long_problem_submission to 'public' as 'informix';

grant select on long_problem_submission to 'public' as 'informix';

grant index on long_problem_submission to 'public' as 'informix';

grant update on long_problem_submission to 'public' as 'informix';

grant insert on season to 'public' as 'informix';

grant index on season to 'public' as 'informix';

grant select on season to 'public' as 'informix';

grant delete on season to 'public' as 'informix';

grant update on season to 'public' as 'informix';

grant select on team to 'public' as 'informix';

grant update on team to 'public' as 'informix';

grant index on team to 'public' as 'informix';

grant delete on team to 'public' as 'informix';

grant insert on team to 'public' as 'informix';

grant select on team_rank_type_lu to 'public' as 'informix';

grant update on team_rank_type_lu to 'public' as 'informix';

grant index on team_rank_type_lu to 'public' as 'informix';

grant insert on team_rank_type_lu to 'public' as 'informix';

grant delete on team_rank_type_lu to 'public' as 'informix';

grant delete on season_team_rank to 'public' as 'informix';

grant index on season_team_rank to 'public' as 'informix';

grant insert on season_team_rank to 'public' as 'informix';

grant update on season_team_rank to 'public' as 'informix';

grant select on season_team_rank to 'public' as 'informix';

grant update on season_team_rank_history to 'public' as 'informix';

grant select on season_team_rank_history to 'public' as 'informix';

grant insert on season_team_rank_history to 'public' as 'informix';

grant index on season_team_rank_history to 'public' as 'informix';

grant delete on season_team_rank_history to 'public' as 'informix';

grant delete on algo_rating_type_lu to 'public' as 'informix';

grant update on algo_rating_type_lu to 'public' as 'informix';

grant insert on algo_rating_type_lu to 'public' as 'informix';

grant select on algo_rating_type_lu to 'public' as 'informix';

grant index on algo_rating_type_lu to 'public' as 'informix';

grant select on algo_rating to 'public' as 'informix';

grant update on algo_rating to 'public' as 'informix';

grant insert on algo_rating to 'public' as 'informix';

grant index on algo_rating to 'public' as 'informix';

grant delete on algo_rating to 'public' as 'informix';

grant update on team_coder_xref to 'public' as 'informix';

grant select on team_coder_xref to 'public' as 'informix';

grant insert on team_coder_xref to 'public' as 'informix';

grant index on team_coder_xref to 'public' as 'informix';

grant delete on team_coder_xref to 'public' as 'informix';

grant update on team_round to 'public' as 'informix';

grant index on team_round to 'public' as 'informix';

grant insert on team_round to 'public' as 'informix';

grant delete on team_round to 'public' as 'informix';

grant select on team_round to 'public' as 'informix';

grant update on season_rank to 'public' as 'informix';

grant insert on season_rank to 'public' as 'informix';

grant select on season_rank to 'public' as 'informix';

grant index on season_rank to 'public' as 'informix';

grant delete on season_rank to 'public' as 'informix';

grant select on season_rank_history to 'public' as 'informix';

grant insert on season_rank_history to 'public' as 'informix';

grant delete on season_rank_history to 'public' as 'informix';

grant update on season_rank_history to 'public' as 'informix';

grant index on season_rank_history to 'public' as 'informix';

grant delete on country_rank to 'public' as 'informix';

grant update on country_rank to 'public' as 'informix';

grant insert on country_rank to 'public' as 'informix';

grant index on country_rank to 'public' as 'informix';

grant select on country_rank to 'public' as 'informix';

grant delete on country_rank_history to 'public' as 'informix';

grant select on country_rank_history to 'public' as 'informix';

grant insert on country_rank_history to 'public' as 'informix';

grant update on country_rank_history to 'public' as 'informix';

grant index on country_rank_history to 'public' as 'informix';

grant insert on season_country_rank to 'public' as 'informix';

grant delete on season_country_rank to 'public' as 'informix';

grant select on season_country_rank to 'public' as 'informix';

grant index on season_country_rank to 'public' as 'informix';

grant update on season_country_rank to 'public' as 'informix';

grant index on season_country_rank_history to 'public' as 'informix';

grant delete on season_country_rank_history to 'public' as 'informix';

grant select on season_country_rank_history to 'public' as 'informix';

grant update on season_country_rank_history to 'public' as 'informix';

grant insert on season_country_rank_history to 'public' as 'informix';

grant select on algo_rating_history to 'public' as 'informix';

grant update on algo_rating_history to 'public' as 'informix';

grant insert on algo_rating_history to 'public' as 'informix';

grant index on algo_rating_history to 'public' as 'informix';

grant delete on algo_rating_history to 'public' as 'informix';

grant insert on season_algo_rating to 'public' as 'informix';

grant index on season_algo_rating to 'public' as 'informix';

grant select on season_algo_rating to 'public' as 'informix';

grant delete on season_algo_rating to 'public' as 'informix';

grant update on season_algo_rating to 'public' as 'informix';

grant select on current_school to 'public' as 'informix';

grant insert on current_school to 'public' as 'informix';

grant delete on current_school to 'public' as 'informix';

grant update on current_school to 'public' as 'informix';

grant update on coder_level to 'public' as 'informix';

grant select on coder_level to 'public' as 'informix';

grant delete on coder_level to 'public' as 'informix';

grant insert on coder_level to 'public' as 'informix';

grant delete on coder_problem_summary to 'public' as 'informix';

grant update on coder_problem_summary to 'public' as 'informix';

grant select on coder_problem_summary to 'public' as 'informix';

grant insert on coder_problem_summary to 'public' as 'informix';

grant update on long_system_test_result to 'public' as 'informix';

grant select on long_system_test_result to 'public' as 'informix';

grant delete on long_system_test_result to 'public' as 'informix';

grant insert on long_system_test_result to 'public' as 'informix';

grant update on long_comp_result to 'public' as 'informix';

grant insert on long_comp_result to 'public' as 'informix';

grant select on long_comp_result to 'public' as 'informix';

grant delete on long_comp_result to 'public' as 'informix';

grant insert on region to 'public' as 'informix';

grant index on region to 'public' as 'informix';

grant select on region to 'public' as 'informix';

grant delete on region to 'public' as 'informix';

grant update on region to 'public' as 'informix';

grant delete on season_algo_rating_history to 'public' as 'informix';

grant select on season_algo_rating_history to 'public' as 'informix';

grant update on season_algo_rating_history to 'public' as 'informix';

grant index on season_algo_rating_history to 'public' as 'informix';

grant insert on season_algo_rating_history to 'public' as 'informix';

grant delete on user_terms_of_use_xref to 'public' as 'informix';

grant insert on user_terms_of_use_xref to 'public' as 'informix';

grant select on user_terms_of_use_xref to 'public' as 'informix';

grant update on user_terms_of_use_xref to 'public' as 'informix';

grant index on user_terms_of_use_xref to 'public' as 'informix';

grant insert on mike_temp to 'public' as 'informix';

grant index on mike_temp to 'public' as 'informix';

grant update on mike_temp to 'public' as 'informix';

grant delete on mike_temp to 'public' as 'informix';

grant select on mike_temp to 'public' as 'informix';

grant delete on command_execution to 'public' as 'informix';

grant insert on command_execution to 'public' as 'informix';

grant update on command_execution to 'public' as 'informix';

grant index on command_execution to 'public' as 'informix';

grant select on command_execution to 'public' as 'informix';

grant insert on payment to 'public' as 'informix';

grant delete on payment to 'public' as 'informix';

grant index on payment to 'public' as 'informix';

grant update on payment to 'public' as 'informix';

grant select on payment to 'public' as 'informix';

grant index on user_payment to 'public' as 'informix';

grant insert on user_payment to 'public' as 'informix';

grant update on user_payment to 'public' as 'informix';

grant select on user_payment to 'public' as 'informix';

grant delete on user_payment to 'public' as 'informix';

grant delete on problem_tester to 'public' as 'informix';

grant insert on problem_tester to 'public' as 'informix';

grant index on problem_tester to 'public' as 'informix';

grant select on problem_tester to 'public' as 'informix';

grant update on problem_tester to 'public' as 'informix';

grant delete on problem_writer to 'public' as 'informix';

grant select on problem_writer to 'public' as 'informix';

grant insert on problem_writer to 'public' as 'informix';

grant update on problem_writer to 'public' as 'informix';

grant index on problem_writer to 'public' as 'informix';

grant select on event to 'public' as 'informix';

grant insert on event to 'public' as 'informix';

grant index on event to 'public' as 'informix';

grant delete on event to 'public' as 'informix';

grant update on event to 'public' as 'informix';

grant delete on event_registration to 'public' as 'informix';

grant update on event_registration to 'public' as 'informix';

grant insert on event_registration to 'public' as 'informix';

grant select on event_registration to 'public' as 'informix';

grant index on event_registration to 'public' as 'informix';

grant select on system_test_case to 'public' as 'informix';

grant update on system_test_case to 'public' as 'informix';

grant insert on system_test_case to 'public' as 'informix';

grant delete on system_test_case to 'public' as 'informix';

grant insert on tournament_group to 'public' as 'informix';

grant select on tournament_group to 'public' as 'informix';

grant delete on tournament_group to 'public' as 'informix';

grant update on tournament_group to 'public' as 'informix';

grant index on tournament_group to 'public' as 'informix';

grant insert on advancer_round to 'public' as 'informix';

grant update on advancer_round to 'public' as 'informix';

grant select on advancer_round to 'public' as 'informix';

grant delete on advancer_round to 'public' as 'informix';

grant index on advancer_round to 'public' as 'informix';

grant delete on contest_coder to 'public' as 'informix';

grant insert on contest_coder to 'public' as 'informix';

grant select on contest_coder to 'public' as 'informix';

grant index on contest_coder to 'public' as 'informix';

grant update on contest_coder to 'public' as 'informix';

grant select on time to 'public' as 'informix';

grant update on time to 'public' as 'informix';

grant insert on time to 'public' as 'informix';

grant index on time to 'public' as 'informix';

grant delete on time to 'public' as 'informix';

grant index on round to 'public' as 'informix';

grant insert on round to 'public' as 'informix';

grant select on round to 'public' as 'informix';

grant update on round to 'public' as 'informix';

grant delete on round to 'public' as 'informix';

grant insert on algo_rating_history_backup to 'public' as 'informix';

grant delete on algo_rating_history_backup to 'public' as 'informix';

grant index on algo_rating_history_backup to 'public' as 'informix';

grant select on algo_rating_history_backup to 'public' as 'informix';

grant update on algo_rating_history_backup to 'public' as 'informix';

grant update on season_algo_rating_history_backup to 'public' as 'informix';

grant delete on season_algo_rating_history_backup to 'public' as 'informix';

grant index on season_algo_rating_history_backup to 'public' as 'informix';

grant insert on season_algo_rating_history_backup to 'public' as 'informix';

grant select on season_algo_rating_history_backup to 'public' as 'informix';

grant update on dok_algo_rating to 'public' as 'informix';

grant index on dok_algo_rating to 'public' as 'informix';

grant select on dok_algo_rating to 'public' as 'informix';

grant delete on dok_algo_rating to 'public' as 'informix';

grant insert on dok_algo_rating to 'public' as 'informix';

grant insert on dok_coder_level to 'public' as 'informix';

grant update on dok_coder_level to 'public' as 'informix';

grant select on dok_coder_level to 'public' as 'informix';

grant delete on dok_coder_level to 'public' as 'informix';

grant index on dok_coder_level to 'public' as 'informix';

grant select on payment_dok to 'public' as 'informix';

grant insert on payment_dok to 'public' as 'informix';

grant update on payment_dok to 'public' as 'informix';

grant delete on payment_dok to 'public' as 'informix';

grant index on payment_dok to 'public' as 'informix';

grant index on tgh_algo_rating to 'public' as 'informix';

grant select on tgh_algo_rating to 'public' as 'informix';

grant insert on tgh_algo_rating to 'public' as 'informix';

grant update on tgh_algo_rating to 'public' as 'informix';

grant delete on tgh_algo_rating to 'public' as 'informix';

grant index on tco08_onsite to 'public' as 'informix';

grant update on tco08_onsite to 'public' as 'informix';

grant insert on tco08_onsite to 'public' as 'informix';

grant delete on tco08_onsite to 'public' as 'informix';

grant select on tco08_onsite to 'public' as 'informix';

grant insert on language_lu to 'public' as 'informix';

grant index on language_lu to 'public' as 'informix';

grant select on language_lu to 'public' as 'informix';

grant delete on language_lu to 'public' as 'informix';

grant update on language_lu to 'public' as 'informix';

grant delete on room_type_lu to 'public' as 'informix';

grant insert on room_type_lu to 'public' as 'informix';

grant update on room_type_lu to 'public' as 'informix';

grant index on room_type_lu to 'public' as 'informix';

grant select on room_type_lu to 'public' as 'informix';

grant delete on division_lu to 'public' as 'informix';

grant insert on division_lu to 'public' as 'informix';

grant update on division_lu to 'public' as 'informix';

grant index on division_lu to 'public' as 'informix';

grant select on division_lu to 'public' as 'informix';

grant delete on level_lu to 'public' as 'informix';

grant update on level_lu to 'public' as 'informix';

grant insert on level_lu to 'public' as 'informix';

grant select on level_lu to 'public' as 'informix';

grant index on level_lu to 'public' as 'informix';

grant index on contest to 'public' as 'informix';

grant update on contest to 'public' as 'informix';

grant select on contest to 'public' as 'informix';

grant delete on contest to 'public' as 'informix';

grant insert on contest to 'public' as 'informix';

grant insert on data_type_lu to 'public' as 'informix';

grant delete on data_type_lu to 'public' as 'informix';

grant select on data_type_lu to 'public' as 'informix';

grant index on data_type_lu to 'public' as 'informix';

grant update on data_type_lu to 'public' as 'informix';

grant update on coder_problem to 'public' as 'informix';

grant delete on coder_problem to 'public' as 'informix';

grant select on coder_problem to 'public' as 'informix';

grant insert on coder_problem to 'public' as 'informix';

grant index on coder_problem to 'public' as 'informix';

grant select on coder_division to 'public' as 'informix';

grant insert on coder_division to 'public' as 'informix';

grant delete on coder_division to 'public' as 'informix';

grant index on coder_division to 'public' as 'informix';

grant update on coder_division to 'public' as 'informix';

grant insert on dual to 'public' as 'informix';

grant select on dual to 'public' as 'informix';

grant index on dual to 'public' as 'informix';

grant update on dual to 'public' as 'informix';

grant delete on dual to 'public' as 'informix';

grant index on log_type_lu to 'public' as 'informix';

grant delete on log_type_lu to 'public' as 'informix';

grant update on log_type_lu to 'public' as 'informix';

grant select on log_type_lu to 'public' as 'informix';

grant insert on log_type_lu to 'public' as 'informix';

grant select on update_log to 'public' as 'informix';

grant update on update_log to 'public' as 'informix';

grant insert on update_log to 'public' as 'informix';

grant delete on update_log to 'public' as 'informix';

grant index on update_log to 'public' as 'informix';

grant index on challenge to 'public' as 'informix';

grant delete on challenge to 'public' as 'informix';

grant select on challenge to 'public' as 'informix';

grant insert on challenge to 'public' as 'informix';

grant update on challenge to 'public' as 'informix';

grant insert on stc_old to 'public' as 'informix';

grant index on stc_old to 'public' as 'informix';

grant update on stc_old to 'public' as 'informix';

grant select on stc_old to 'public' as 'informix';

grant delete on stc_old to 'public' as 'informix';

grant index on skill_type_lu to 'public' as 'informix';

grant insert on skill_type_lu to 'public' as 'informix';

grant delete on skill_type_lu to 'public' as 'informix';

grant select on skill_type_lu to 'public' as 'informix';

grant update on skill_type_lu to 'public' as 'informix';

grant update on coder_skill_xref to 'public' as 'informix';

grant index on coder_skill_xref to 'public' as 'informix';

grant delete on coder_skill_xref to 'public' as 'informix';

grant select on coder_skill_xref to 'public' as 'informix';

grant insert on coder_skill_xref to 'public' as 'informix';

grant delete on coder_update_log to 'public' as 'informix';

grant index on coder_update_log to 'public' as 'informix';

grant update on coder_update_log to 'public' as 'informix';

grant insert on coder_update_log to 'public' as 'informix';

grant select on coder_update_log to 'public' as 'informix';

grant index on query to 'public' as 'informix';

grant insert on query to 'public' as 'informix';

grant update on query to 'public' as 'informix';

grant delete on query to 'public' as 'informix';

grant select on query to 'public' as 'informix';

grant index on command to 'public' as 'informix';

grant delete on command to 'public' as 'informix';

grant insert on command to 'public' as 'informix';

grant select on command to 'public' as 'informix';

grant update on command to 'public' as 'informix';

grant index on command_query_xref to 'public' as 'informix';

grant delete on command_query_xref to 'public' as 'informix';

grant select on command_query_xref to 'public' as 'informix';

grant update on command_query_xref to 'public' as 'informix';

grant insert on command_query_xref to 'public' as 'informix';

grant delete on room to 'public' as 'informix';

grant index on room to 'public' as 'informix';

grant insert on room to 'public' as 'informix';

grant update on room to 'public' as 'informix';

grant select on room to 'public' as 'informix';

grant index on problem_submission to 'public' as 'informix';

grant select on problem_submission to 'public' as 'informix';

grant insert on problem_submission to 'public' as 'informix';

grant delete on problem_submission to 'public' as 'informix';

grant update on problem_submission to 'public' as 'informix';

grant insert on streak_type_lu to 'public' as 'informix';

grant update on streak_type_lu to 'public' as 'informix';

grant select on streak_type_lu to 'public' as 'informix';

grant delete on streak_type_lu to 'public' as 'informix';

grant index on streak_type_lu to 'public' as 'informix';

grant select on streak to 'public' as 'informix';

grant insert on streak to 'public' as 'informix';

grant index on streak to 'public' as 'informix';

grant delete on streak to 'public' as 'informix';

grant update on streak to 'public' as 'informix';

grant select on round_problem to 'public' as 'informix';

grant insert on round_problem to 'public' as 'informix';

grant index on round_problem to 'public' as 'informix';

grant delete on round_problem to 'public' as 'informix';

grant update on round_problem to 'public' as 'informix';

grant select on round_division to 'public' as 'informix';

grant update on round_division to 'public' as 'informix';

grant insert on round_division to 'public' as 'informix';

grant index on round_division to 'public' as 'informix';

grant delete on round_division to 'public' as 'informix';

grant index on room_result to 'public' as 'informix';

grant insert on room_result to 'public' as 'informix';

grant update on room_result to 'public' as 'informix';

grant select on room_result to 'public' as 'informix';

grant delete on room_result to 'public' as 'informix';

grant select on query_input_xref to 'public' as 'informix';

grant update on query_input_xref to 'public' as 'informix';

grant index on query_input_xref to 'public' as 'informix';

grant insert on query_input_xref to 'public' as 'informix';

grant delete on query_input_xref to 'public' as 'informix';

grant delete on input_lu to 'public' as 'informix';

grant insert on input_lu to 'public' as 'informix';

grant update on input_lu to 'public' as 'informix';

grant select on input_lu to 'public' as 'informix';

grant index on input_lu to 'public' as 'informix';

grant update on round_type_lu to 'public' as 'informix';

grant index on round_type_lu to 'public' as 'informix';

grant delete on round_type_lu to 'public' as 'informix';

grant insert on round_type_lu to 'public' as 'informix';

grant select on round_type_lu to 'public' as 'informix';

grant insert on request to 'public' as 'informix';

grant update on request to 'public' as 'informix';

grant delete on request to 'public' as 'informix';

grant select on request to 'public' as 'informix';

grant index on request to 'public' as 'informix';

grant index on request_type_lu to 'public' as 'informix';

grant insert on request_type_lu to 'public' as 'informix';

grant delete on request_type_lu to 'public' as 'informix';

grant update on request_type_lu to 'public' as 'informix';

grant select on request_type_lu to 'public' as 'informix';

grant index on path to 'public' as 'informix';

grant update on path to 'public' as 'informix';

grant delete on path to 'public' as 'informix';

grant select on path to 'public' as 'informix';

grant insert on path to 'public' as 'informix';

grant delete on image_type_lu to 'public' as 'informix';

grant index on image_type_lu to 'public' as 'informix';

grant update on image_type_lu to 'public' as 'informix';

grant insert on image_type_lu to 'public' as 'informix';

grant select on image_type_lu to 'public' as 'informix';

grant update on image to 'public' as 'informix';

grant select on image to 'public' as 'informix';

grant insert on image to 'public' as 'informix';

grant delete on image to 'public' as 'informix';

grant index on image to 'public' as 'informix';

grant insert on coder_image_xref to 'public' as 'informix';

grant delete on coder_image_xref to 'public' as 'informix';

grant select on coder_image_xref to 'public' as 'informix';

grant index on coder_image_xref to 'public' as 'informix';

grant update on coder_image_xref to 'public' as 'informix';

grant index on round_image_xref to 'public' as 'informix';

grant insert on round_image_xref to 'public' as 'informix';

grant select on round_image_xref to 'public' as 'informix';

grant update on round_image_xref to 'public' as 'informix';

grant delete on round_image_xref to 'public' as 'informix';

grant select on web_log to 'public' as 'informix';

grant insert on web_log to 'public' as 'informix';

grant update on web_log to 'public' as 'informix';

grant delete on web_log to 'public' as 'informix';

grant index on web_log to 'public' as 'informix';

grant delete on web_page to 'public' as 'informix';

grant update on web_page to 'public' as 'informix';

grant index on web_page to 'public' as 'informix';

grant select on web_page to 'public' as 'informix';

grant insert on web_page to 'public' as 'informix';

grant index on coder to 'public' as 'informix';

grant select on coder to 'public' as 'informix';

grant insert on coder to 'public' as 'informix';

grant delete on coder to 'public' as 'informix';

grant update on coder to 'public' as 'informix';

grant delete on rank_type_lu to 'public' as 'informix';

grant insert on rank_type_lu to 'public' as 'informix';

grant select on rank_type_lu to 'public' as 'informix';

grant index on country to 'public' as 'informix';

grant select on country to 'public' as 'informix';

grant update on country to 'public' as 'informix';

grant insert on country to 'public' as 'informix';

grant delete on country to 'public' as 'informix';

grant index on state to 'public' as 'informix';

grant insert on state to 'public' as 'informix';

grant select on state to 'public' as 'informix';

grant update on state to 'public' as 'informix';

grant delete on state to 'public' as 'informix';

grant update on command_group_lu to 'public' as 'informix';

grant insert on command_group_lu to 'public' as 'informix';

grant index on command_group_lu to 'public' as 'informix';

grant select on command_group_lu to 'public' as 'informix';

grant delete on command_group_lu to 'public' as 'informix';

grant update on coder_rank_type_lu to 'public' as 'informix';

grant delete on coder_rank_type_lu to 'public' as 'informix';

grant insert on coder_rank_type_lu to 'public' as 'informix';

grant select on coder_rank_type_lu to 'public' as 'informix';

grant index on coder_rank_type_lu to 'public' as 'informix';

grant update on coder_rank to 'public' as 'informix';

grant insert on coder_rank to 'public' as 'informix';

grant index on coder_rank to 'public' as 'informix';

grant delete on coder_rank to 'public' as 'informix';

grant select on coder_rank to 'public' as 'informix';

