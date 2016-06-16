database informixoltp;

alter table 'informix'.access add constraint primary key 
    (access_id)
    constraint access_pkey;

alter table 'informix'.education add constraint primary key 
    (education_id)
    constraint education_pkey;

alter table 'informix'.coder_skill add constraint primary key 
    (coder_id, skill_id)
    constraint coder_skill_pkey;

alter table 'informix'.connection_lock add constraint primary key 
    (round_id, room_id)
    constraint connection_lock_pkey;

alter table 'informix'.contact_us add constraint primary key 
    (contact_us_id)
    constraint contact_us_pkey;

alter table 'informix'.contact_us_subject add constraint primary key 
    (contact_us_subject_id)
    constraint contact_us_subject_pkey;

alter table 'informix'.data_type add constraint primary key 
    (data_type_id)
    constraint data_type_pk;

alter table 'informix'.degree add constraint primary key 
    (degree_id)
    constraint degree_pkey;

alter table 'informix'.difficulty add constraint primary key 
    (difficulty_id)
    constraint difficulty_pkey;

alter table 'informix'.group add constraint primary key 
    (group_id)
    constraint group_pkey;

alter table 'informix'.group_user add constraint primary key 
    (group_id, user_id)
    constraint group_user_pkey;

alter table 'informix'.permission add constraint primary key 
    (secure_object_id, sector_id, access_id)
    constraint permission_pkey;

alter table 'informix'.question_type add constraint primary key 
    (question_type_id)
    constraint question_type_pkey;

create index 'informix'.room_indx1 on 'informix'.room
    (
    round_id, 
    room_id
    );

alter table 'informix'.room add constraint primary key 
    (room_id)
    constraint room_pkey;

alter table 'informix'.round_component add constraint primary key 
    (component_id, round_id, division_id)
    constraint round_problem_pk;

alter table 'informix'.segment_type add constraint primary key 
    (segment_type_id)
    constraint segment_type_pk;

alter table 'informix'.round_segment add constraint primary key 
    (round_id, segment_id)
    constraint round_segment_pkey;

alter table 'informix'.sector add constraint primary key 
    (sector_id)
    constraint sector_pkey;

alter table 'informix'.secure_object add constraint primary key 
    (secure_object_id)
    constraint secure_object_pkey;

alter table 'informix'.skill_type add constraint primary key 
    (skill_type_id)
    constraint skill_type_pkey;

alter table 'informix'.language add constraint primary key 
    (language_id)
    constraint language_pkey;

alter table 'informix'.user_type add constraint primary key 
    (user_type_id)
    constraint user_type_pkey;

alter table 'informix'.news add constraint primary key 
    (news_id)
    constraint news_pkey;

create index 'informix'.auditcoder_coderid_indx on 'informix'.audit_coder
    (
    user_id
    );

alter table 'informix'.dispute add constraint primary key 
    (dispute_id, inquiry_id, corporate_id)
    constraint dispute_pkey;

alter table 'informix'.corporate add constraint primary key 
    (corporate_id)
    constraint corporate_pkey;

alter table 'informix'.ad add constraint primary key 
    (ad_id)
    constraint ad_pkey;

alter table 'informix'.inquiry add constraint primary key 
    (inquiry_id, corporate_id)
    constraint inquiry_pkey;

alter table 'informix'.watch add constraint primary key 
    (corporate_id, coder_id)
    constraint watch_pkey;

alter table 'informix'.subscription_region add constraint primary key 
    (subscription_id, region_code)
    constraint subscription_region_pkey;

alter table 'informix'.subscription add constraint primary key 
    (subscription_id)
    constraint subscription_pkey;

alter table 'informix'.region_state add constraint primary key 
    (region_code, state_code, user_type_id)
    constraint region_state_pkey;

alter table 'informix'.contest add constraint primary key 
    (contest_id)
    constraint contest_pkey;

alter table 'informix'.coder add constraint primary key 
    (coder_id)
    constraint coder_pkey;

create index 'informix'.jiveword_idx1 on 'informix'.jiveword
    (
    word
    );

alter table 'informix'.jiveword add constraint primary key 
    (wordid)
    constraint jiveword_pkey;

create index 'informix'.useruseridx on 'informix'.jiveuserperm
    (
    userid
    );

alter table 'informix'.jiveuserperm add constraint primary key 
    (forumid, userid, permission)
    constraint jiveuserperm_pkey;

create index 'informix'.jivethread_forumid_idx on 'informix'.jivethread
    (
    forumid
    );

alter table 'informix'.jivethread add constraint primary key 
    (threadid)
    constraint jivethread_pkey;

create index 'informix'.wordcountidx on 'informix'.jivemessageword
    (
    wordcount
    );

create index 'informix'.wordforumididx on 'informix'.jivemessageword
    (
    forumid
    );

create index 'informix'.wordwordidx on 'informix'.jivemessageword
    (
    wordid
    );

alter table 'informix'.jivemessageword add constraint primary key 
    (messageid, wordid)
    constraint jivemessageword_pkey;

create index 'informix'.childidx on 'informix'.jivemessagetree
    (
    childid
    );

alter table 'informix'.jivemessagetree add constraint primary key 
    (parentid, childid)
    constraint jivemessagetree_pkey;

alter table 'informix'.jivemessageprop add constraint primary key 
    (messageid, name)
    constraint jivemessageprop_pkey;

create index 'informix'.jivemessage_modifieddate_idx on 'informix'.jivemessage
    (
    modifieddate
    );

create index 'informix'.jivemessage_threadid_idx on 'informix'.jivemessage
    (
    threadid
    );

alter table 'informix'.jivemessage add constraint primary key 
    (messageid)
    constraint jivemessage_pkey;

create index 'informix'.filterindexidx on 'informix'.jivefilter
    (
    filterindex
    );

alter table 'informix'.jivefilter add constraint primary key 
    (forumid, filterindex)
    constraint jivefilter_pkey;

create index 'informix'.msg_x on 'informix'.jmsmessage
    (
    messageid
    );

create index 'informix'.msgq_x on 'informix'.jmsmessagequeue
    (
    messageid
    );

alter table 'informix'.referral add constraint primary key 
    (referral_id)
    constraint referral_pkey;

alter table 'informix'.editor add constraint primary key 
    (editor_id)
    constraint editor_pkey;

alter table 'informix'.pay_period add constraint primary key 
    (pay_period_id)
    constraint pay_period_pkey;

alter table 'informix'.title add constraint primary key 
    (title_id)
    constraint title_pkey;

alter table 'informix'.press_release add constraint primary key 
    (press_release_id)
    constraint press_release_pkey;

alter table 'informix'.division add constraint primary key 
    (division_id)
    constraint division_pkey;

create index 'informix'.server_connection_idx on 'informix'.server_connection
    (
    coder_id
    );

alter table 'informix'.server_connection add constraint primary key 
    (server_id, connection_id)
    constraint server_connection_pkey;

alter table 'informix'.sector_file add constraint primary key 
    (sector_id)
    constraint sector_file_pkey;

alter table 'informix'.segment add constraint primary key 
    (segment_id)
    constraint segment_pkey;

alter table 'informix'.corporate_contact_us add constraint primary key 
    (corporate_contact_us_id)
    constraint corporate_contact_us_pkey;

alter table 'informix'.system_test_result add constraint primary key 
    (round_id, coder_id, component_id, test_case_id)
    constraint system_test_result_pkey;

alter table 'informix'.coder_type add constraint primary key 
    (coder_type_id)
    constraint coder_type_pkey;

create index 'informix'.coder_referral_idx1 on 'informix'.coder_referral
    (
    referral_id, 
    reference_id
    );

alter table 'informix'.coder_referral add constraint primary key 
    (coder_id, referral_id)
    constraint coder_referral_pkey;

alter table 'informix'.problem_status_lu add constraint primary key 
    (problem_status_id)
    constraint problem_status_pkey;

alter table 'informix'.correspondence add constraint primary key 
    (correspondence_id)
    constraint conrrespondence_pkey;

alter table 'informix'.correspondence_status add constraint primary key 
    (correspondence_status_id)
    constraint correspondencestatus_pkey;

create index 'informix'.comp_user_xref_user_idx on 'informix'.component_user_xref
    (
    user_id
    );

alter table 'informix'.component_user_xref add constraint primary key 
    (component_id, user_id, user_type_id)
    constraint problem_user_pkey;

alter table 'informix'.solution add constraint primary key 
    (solution_id)
    constraint solution_pkey;

create index 'informix'.problem_state_indx on 'informix'.component_state
    (
    round_id, 
    coder_id, 
    component_id
    );

alter table 'informix'.component_state add constraint primary key 
    (component_state_id)
    constraint problemstate_pkey;

alter table 'informix'.problem_solution add constraint primary key 
    (problem_id, solution_id)
    constraint problem_solution_pkey;

alter table 'informix'.development_application_status add constraint primary key 
    (dev_app_status_id)
    constraint dev_app_status_pkey;

alter table 'informix'.development_application add constraint primary key 
    (dev_app_id)
    constraint dev_app_pkey;

alter table 'informix'.challenge add constraint primary key 
    (round_id, challenger_id, defendant_id, component_id, challenge_id)
    constraint challenge_pkey;

alter table 'informix'.invite_list add constraint primary key 
    (round_id, coder_id)
    constraint invite_list_pkey;

alter table 'informix'.current_school add constraint primary key 
    (coder_id)
    constraint pk_current_scho777;

alter table 'informix'.sub_template add constraint primary key 
    (template_id, sub_template_id)
    constraint sub_template_pkey;

create index 'informix'.student_rep_idx1 on 'informix'.student_rep
    (
    coder_id
    );

create index 'informix'.student_rep_idx2 on 'informix'.student_rep
    (
    school_id
    );

alter table 'informix'.room_type add constraint primary key 
    (room_type_id)
    constraint room_type_pkey;

alter table 'informix'.round_registration add constraint primary key 
    (round_id, coder_id)
    constraint round_registration_pkey;

alter table 'informix'.question_style add constraint primary key 
    (question_style_id)
    constraint question_style_pkey;

alter table 'informix'.answer add constraint primary key 
    (answer_id)
    constraint answer_pk;

alter table 'informix'.survey_question add constraint primary key 
    (survey_id, question_id)
    constraint survey_question_pk;

alter table 'informix'.round_question add constraint primary key 
    (round_id, question_id)
    constraint u198_150;

create index 'informix'.corr_read_xref_user_id on 'informix'.correspondence_read_xref
    (
    user_id
    );

alter table 'informix'.correspondence_read_xref add constraint primary key 
    (correspondence_id, user_id)
    constraint conrrespondence_read_xref_pkey;

alter table 'informix'.problem_user_request add constraint primary key 
    (request_id)
    constraint problem_user_request_pkey;

alter table 'informix'.contract_type_lu add constraint primary key 
    (contract_type_id)
    constraint contract_type_pkey;

alter table 'informix'.image_type_lu add constraint primary key 
    (image_type_id)
    constraint image_type_lu_pk;

alter table 'informix'.image add constraint primary key 
    (image_id)
    constraint image_pk;

alter table 'informix'.coder_image_xref add constraint primary key 
    (coder_id, image_id)
    constraint coder_image_xref_pk;

alter table 'informix'.jiveforum add constraint primary key 
    (forumid)
    constraint jiveforum_pkey;

alter table 'informix'.login add constraint primary key 
    (login_id)
    constraint login_pk;

alter table 'informix'.project add constraint primary key 
    (project_id)
    constraint pk_project;

alter table 'informix'.project_issue add constraint primary key 
    (project_issue_id)
    constraint project_issue_pk;

alter table 'informix'.project_task add constraint primary key 
    (project_task_id)
    constraint project_task_pk;

alter table 'informix'.project_user add constraint primary key 
    (project_user_id)
    constraint project_user_pk;

alter table 'informix'.project_user_task add constraint primary key 
    (project_user_task_id)
    constraint project_user_task_pk;

alter table 'informix'.project_user_update add constraint primary key 
    (project_user_update_id)
    constraint project_user_update_pk;

alter table 'informix'.status_type_lu add constraint primary key 
    (status_type_id)
    constraint status_type_pk;

alter table 'informix'.request_type_lu add constraint primary key 
    (request_type_id)
    constraint request_type_lu_pk;

alter table 'informix'.path add constraint primary key 
    (path_id)
    constraint path_pk;

alter table 'informix'.round_type_lu add constraint primary key 
    (round_type_id)
    constraint round_type_lu_pk;

create unique index 'informix'.web_content_indx1 on 'informix'.web_content
    (
    content_name
    );

alter table 'informix'.web_content add constraint primary key 
    (content_id)
    constraint web_content_pk;

alter table 'informix'.web_file add constraint primary key 
    (file_id)
    constraint web_file_pkey;

alter table 'informix'.staging_problem add constraint primary key 
    (problem_id)
    constraint staging_problem_pkey;

create index 'informix'.request_indx1 on 'informix'.request
    (
    connection_id, 
    server_id, 
    round_id, 
    room_id, 
    request_type_id
    );

alter table 'informix'.request add constraint primary key 
    (request_id)
    constraint request_pk;

alter table 'informix'.staging_rating add constraint primary key 
    (coder_id, backup_id)
    constraint staging_rating_pkey;

alter table 'informix'.staging_room add constraint primary key 
    (room_id)
    constraint staging_room_pkey;

alter table 'informix'.staging_round_problem add constraint primary key 
    (problem_id, round_id, division_id)
    constraint staging_round_problem_pk;

alter table 'informix'.staging_round_segment add constraint primary key 
    (round_id, segment_id)
    constraint staging_round_segment_pkey;

alter table 'informix'.staging_contest add constraint primary key 
    (contest_id)
    constraint staging_contest_pkey;

alter table 'informix'.staging_challenge add constraint primary key 
    (round_id, challenger_id, defendant_id, problem_id, challenge_id, backup_id)
    constraint staging_challenge_pkey;

alter table 'informix'.staging_round_registration add constraint primary key 
    (round_id, coder_id)
    constraint staging_round_registration_pkey;

alter table 'informix'.staging_survey add constraint primary key 
    (survey_id)
    constraint staging_survey_pkey;

alter table 'informix'.staging_question add constraint primary key 
    (question_id)
    constraint staging_question_pk;

alter table 'informix'.staging_answer add constraint primary key 
    (answer_id)
    constraint staging_answer_pk;

alter table 'informix'.staging_response add constraint primary key 
    (question_id, answer_id, user_id)
    constraint staging_response_pk;

alter table 'informix'.staging_survey_question add constraint primary key 
    (survey_id, question_id)
    constraint staging_survey_question_pk;

alter table 'informix'.staging_round_question add constraint primary key 
    (round_id, question_id)
    constraint u235_238;

alter table 'informix'.staging_round add constraint primary key 
    (round_id)
    constraint stagin_round;

alter table 'informix'.staging_room_result add constraint primary key 
    (round_id, room_id, coder_id, backup_id)
    constraint staging_room_result_pkey;

alter table 'informix'.affidavit_type_lu add constraint primary key 
    (affidavit_type_id)
    constraint affidavit_type_lu_pk;

alter table 'informix'.contract_payment_xref add constraint primary key 
    (contract_id, payment_id)
    constraint contract_payment_xref_pk;

alter table 'informix'.user_tax_form_xref add constraint primary key 
    (tax_form_id, user_id)
    constraint user_tax_form_xref_pk;

alter table 'informix'.payment_note_xref add constraint primary key 
    (note_id, payment_id)
    constraint payment_note_xref_pk;

alter table 'informix'.affidavit_note_xref add constraint primary key 
    (note_id, affidavit_id)
    constraint affidavit_note_xref_pk;

alter table 'informix'.contract_note_xref add constraint primary key 
    (contract_id, note_id)
    constraint contract_note_xref_pk;

alter table 'informix'.payment_detail add constraint primary key 
    (payment_detail_id)
    constraint payment_detail_pk;

alter table 'informix'.payment add constraint primary key 
    (payment_id)
    constraint payment_pk;

alter table 'informix'.payment_address add constraint primary key 
    (payment_address_id)
    constraint payment_address_pk;

alter table 'informix'.payment_detail_xref add constraint primary key 
    (payment_id, payment_detail_id)
    constraint payment_detail_xref_pk;

alter table 'informix'.payment_release add constraint primary key 
    (payment_release_id)
    constraint payment_release_pk;

alter table 'informix'.payment_release_xref add constraint primary key 
    (payment_release_id, payment_id)
    constraint payment_release_xref_pk;

alter table 'informix'.modification_rationale_lu add constraint primary key 
    (modification_rationale_id)
    constraint modification_rationale_lu_pk;

alter table 'informix'.affidavit add constraint primary key 
    (affidavit_id)
    constraint affidavit_pk;

alter table 'informix'.user_tax_form_note_xref add constraint primary key 
    (user_id, tax_form_id, note_id)
    constraint u251_267;

alter table 'informix'.tax_form add constraint primary key 
    (tax_form_id)
    constraint tax_form_pk;

alter table 'informix'.contract add constraint primary key 
    (contract_id)
    constraint contract_pk;

alter table 'informix'.affidavit_template add constraint primary key 
    (affidavit_template_id)
    constraint affidavit_template_pk;

alter table 'informix'.query add constraint primary key 
    (query_id)
    constraint query_pk;

alter table 'informix'.command add constraint primary key 
    (command_id)
    constraint command_pk;

alter table 'informix'.command_query_xref add constraint primary key 
    (command_id, query_id)
    constraint commandqueryxref_pk;

alter table 'informix'.query_input_xref add constraint primary key 
    (query_id, input_id)
    constraint query_input_pk;

create unique index 'informix'.inputlu_inputcode_idx on 'informix'.input_lu
    (
    input_code
    );

alter table 'informix'.input_lu add constraint primary key 
    (input_id)
    constraint input_lu_pkey;

alter table 'informix'.sched_job_type_lu add constraint primary key 
    (sched_job_type_id)
    constraint sched_job_type_lu_pk;

alter table 'informix'.sched_job_status_lu add constraint primary key 
    (sched_job_status_id)
    constraint sched_job_status_lu_pk;

alter table 'informix'.sched_job_detail_status_lu add constraint primary key 
    (sched_job_detail_status_id)
    constraint sched_job_detail_status_lu_pk;

alter table 'informix'.sched_job add constraint primary key 
    (sched_job_id)
    constraint sched_job_pk;

alter table 'informix'.email_job_group_lu add constraint primary key 
    (email_job_group_id)
    constraint email_job_group_lu_pk;

alter table 'informix'.email_template_group_lu add constraint primary key 
    (email_template_group_id)
    constraint email_template_group_lu_pk;

alter table 'informix'.email_template add constraint primary key 
    (email_template_id)
    constraint email_template_pk;

alter table 'informix'.email_list_group_lu add constraint primary key 
    (email_list_group_id)
    constraint email_list_group_lu_pk;

alter table 'informix'.email_list add constraint primary key 
    (email_list_id)
    constraint email_list_pk;

alter table 'informix'.email_list_detail add constraint primary key 
    (email_list_detail_id)
    constraint email_list_detail_pk;

alter table 'informix'.sched_email_job add constraint primary key 
    (sched_email_job_id)
    constraint sched_email_job_pk;

alter table 'informix'.command_param add constraint primary key 
    (command_param_id)
    constraint command_param_pk;

alter table 'informix'.command_group_lu add constraint primary key 
    (command_group_id)
    constraint command_group_lu_pk;

alter table 'informix'.user_status_lu add constraint primary key 
    (user_status_id)
    constraint user_status_pk;

alter table 'informix'.status_lu add constraint primary key 
    (status_id)
    constraint statuslu_pkey;

alter table 'informix'.broadcast_type_lu add constraint primary key 
    (broadcast_type_id)
    constraint broadcasttypelu_pk;

alter table 'informix'.broadcast add constraint primary key 
    (broadcast_id)
    constraint broadcast_pk;

alter table 'informix'.round_payment add constraint primary key 
    (round_payment_id)
    constraint round_payment_pk;

alter table 'informix'.sched_control add constraint primary key 
    (sched_job_id)
    constraint sched_control_pk;

alter table 'informix'.job_type_lu add constraint primary key 
    (job_type_id)
    constraint job_type_lu_pkey;

alter table 'informix'.job add constraint primary key 
    (job_id)
    constraint job_pkey;

alter table 'informix'.hit_type_lu add constraint primary key 
    (hit_type_id)
    constraint hit_type_lu_pkey;

alter table 'informix'.job_hit add constraint primary key 
    (job_id, user_id, hit_type_id)
    constraint job_hit_pkey;

alter table 'informix'.monitor_function_type_lu add constraint primary key 
    (monitor_function_type_id)
    constraint monitory_function_type_lu_pk;

alter table 'informix'.monitor_function add constraint primary key 
    (monitor_function_id)
    constraint monitor_function_pk;

alter table 'informix'.company_user_xref add constraint primary key 
    (company_id, company_user_code)
    constraint company_user_xref_pkey;

alter table 'informix'.company_image_xref add constraint primary key 
    (company_id, image_id)
    constraint company_image_xref_pk;

alter table 'informix'.coder_confirmation add constraint primary key 
    (coder_id, contest_id)
    constraint coder_confirmation_pkey;

alter table 'informix'.component_type_lu add constraint primary key 
    (component_type_id)
    constraint conmponent_type_lu_pk;

alter table 'informix'.problem_type_lu add constraint primary key 
    (problem_type_id)
    constraint problem_type_lu_pk;

alter table 'informix'.parameter add constraint primary key 
    (parameter_id)
    constraint parameter_pk;

alter table 'informix'.component_solution_xref add constraint primary key 
    (component_id, solution_id)
    constraint component_solution_xref_pk;

alter table 'informix'.component_status_lu add constraint primary key 
    (component_status_id)
    constraint component_status_lu_pkey;

alter table 'informix'.data_type_mapping add constraint primary key 
    (language_id, data_type_id)
    constraint data_type_mapping_pk;

alter table 'informix'.web_service add constraint primary key 
    (web_service_id)
    constraint web_service_pkey;

alter table 'informix'.web_service_file_type add constraint primary key 
    (web_service_file_type_id)
    constraint webservicefiletype_pk;

alter table 'informix'.web_service_source_file add constraint primary key 
    (web_service_source_file_id)
    constraint webservicesourcefile_pk;

alter table 'informix'.web_service_compilation add constraint primary key 
    (web_service_source_file_id, sort_order)
    constraint webservicecompilation_pk;

alter table 'informix'.component_web_service_xref add constraint primary key 
    (component_id, web_service_id)
    constraint component_web_service_xref_pk;

alter table 'informix'.problem_payment add constraint primary key 
    (coder_id, problem_id)
    constraint problem_payment_pkey;

create index 'informix'.component_idx1 on 'informix'.component
    (
    problem_id
    );

alter table 'informix'.component add constraint primary key 
    (component_id)
    constraint component_pk;

alter table 'informix'.file_type_lu add constraint primary key 
    (file_type_id)
    constraint file_type_lu_pk;

alter table 'informix'.resume add constraint primary key 
    (resume_id)
    constraint resume_pk;

alter table 'informix'.campaign add constraint primary key 
    (campaign_id)
    constraint campaign_pkey;

alter table 'informix'.activity add constraint primary key 
    (activity_id)
    constraint activity_pk;

alter table 'informix'.campaign_activity_xref add constraint primary key 
    (campaign_id, activity_id)
    constraint campaign_activity_xref_pk;

alter table 'informix'.campaign_job_xref add constraint primary key 
    (campaign_id, job_id)
    constraint campaign_job_xref_pk;

alter table 'informix'.problem add constraint primary key 
    (problem_id)
    constraint problem_pkey;

create index 'informix'.sched_job_detail_idx1 on 'informix'.sched_job_detail
    (
    sched_job_id, 
    sched_job_detail_id
    );

alter table 'informix'.sched_job_detail add constraint primary key 
    (sched_job_detail_id)
    constraint sched_job_detail_pk;

alter table 'informix'.round_image_xref add constraint primary key 
    (round_id, image_id)
    constraint round_image_xref_pk;

alter table 'informix'.wl_team add constraint unique 
    (team_name)
    constraint u324_543;

alter table 'informix'.wl_team add constraint primary key 
    (team_id)
    constraint u324_542;

alter table 'informix'.team_type_lu add constraint primary key 
    (team_type_id)
    constraint u316_374;

alter table 'informix'.team_coder_component_xref add constraint primary key 
    (team_id, coder_id, component_id, round_id)
    constraint u318_378;

alter table 'informix'.team_coder_xref add constraint unique 
    (coder_id)
    constraint u319_383;

alter table 'informix'.team_coder_xref add constraint primary key 
    (team_id, coder_id)
    constraint u319_384;

alter table 'informix'.problem_web_service_xref add constraint primary key 
    (problem_id, web_service_id)
    constraint u320_387;

alter table 'informix'.web_service_java_doc add constraint primary key 
    (web_service_java_doc_id)
    constraint u321_390;

alter table 'informix'.compilation add constraint primary key 
    (component_state_id)
    constraint compilation_pkey;

alter table 'informix'.submission add constraint primary key 
    (component_state_id, submission_number)
    constraint submission_pk;

alter table 'informix'.donation_type_lu add constraint primary key 
    (donation_type_id)
    constraint donationtype_pk;

alter table 'informix'.question add constraint primary key 
    (question_id)
    constraint question_pk;

alter table 'informix'.problem_rating_question add constraint primary key 
    (question_id)
    constraint problem_rating_question_pkey;

alter table 'informix'.problem_rating add constraint primary key 
    (problem_id, question_id, coder_id)
    constraint problem_rating_pkey;

alter table 'informix'.question_image_xref add constraint primary key 
    (question_id, image_id)
    constraint question_image_xref_pk;

alter table 'informix'.staging_component_state add constraint primary key 
    (component_state_id, backup_id)
    constraint componentstate_pkey;

alter table 'informix'.backup add constraint primary key 
    (backup_id)
    constraint u339_406;

alter table 'informix'.component_category_lu add constraint primary key 
    (component_category_id)
    constraint conmponent_category_lu_pk;

alter table 'informix'.component_category_xref add constraint primary key 
    (component_id, component_category_id)
    constraint conmponent_category_xref_pk;

alter table 'informix'.campaign_round_xref add constraint primary key 
    (campaign_id, round_id)
    constraint campaign_round_pk;

alter table 'informix'.campaign_type_lu add constraint primary key 
    (campaign_type_id)
    constraint campaign_type_lu_pk;

alter table 'informix'.skill add constraint primary key 
    (skill_id)
    constraint skill_pkey;

alter table 'informix'.coder_skill_type_note_xref add constraint primary key 
    (coder_id, skill_type_id, note_id)
    constraint coderstilltypenote_pk;

alter table 'informix'.staging_submission add constraint primary key 
    (component_state_id, submission_number, backup_id)
    constraint staging_submission_pk;

alter table 'informix'.staging_compilation add constraint primary key 
    (component_state_id, backup_id)
    constraint staging_compilation_pkey;

alter table 'informix'.staging_system_test_result add constraint primary key 
    (round_id, coder_id, problem_id, test_case_id, backup_id)
    constraint staging_system_test_result_pkey;

alter table 'informix'.staging_system_test_case add constraint primary key 
    (test_case_id)
    constraint staging_systemtestcase_pk;

create index 'informix'.system_test_component_ix on 'informix'.system_test_case
    (
    component_id, 
    example_flag, 
    system_flag
    );

alter table 'informix'.system_test_case add constraint primary key 
    (test_case_id)
    constraint systemtestcase_pk;

alter table 'informix'.country_affidavit_template_xref add constraint primary key 
    (country_code, affidavit_template_id)
    constraint countryaffidavittemplatexref_pk;

alter table 'informix'.message_status_lu add constraint primary key 
    (message_status_id)
    constraint message_status_lu_pkey;

alter table 'informix'.message add constraint primary key 
    (message_id)
    constraint message_pkey;

alter table 'informix'.user_message_status_lu add constraint primary key 
    (user_message_status_id)
    constraint user_message_status_lu_pkey;

alter table 'informix'.user_message add constraint primary key 
    (user_id, message_id, status_id)
    constraint user_message_pkey;

alter table 'informix'.failure_type_lu add constraint primary key 
    (failure_type_id)
    constraint failure_type_lu_pkey;

create index 'informix'.jms_messages_destination on 'informix'.jms_messages
    (
    destination
    );

create index 'informix'.jms_messages_txop_txid on 'informix'.jms_messages
    (
    txop, 
    txid
    );

alter table 'informix'.jms_messages add constraint primary key 
    (messageid, destination)
    constraint jmsmessage_pk;

alter table 'informix'.jms_transactions add constraint primary key 
    (txid)
    constraint jmstransactions_pk;

alter table 'informix'.jms_users add constraint primary key 
    (userid)
    constraint jmsusers_pk;

alter table 'informix'.jms_roles add constraint primary key 
    (userid, roleid)
    constraint jmsroles_pk;

alter table 'informix'.jms_subscriptions add constraint primary key 
    (clientid, subname)
    constraint jmssubscriptions_pk;

alter table 'informix'.solution_class_file add constraint primary key 
    (solution_id, sort_order)
    constraint solutionclassfile_pkey;

alter table 'informix'.survey add constraint primary key 
    (survey_id)
    constraint survey_pkey;

alter table 'informix'.long_test_queue_status_lu add constraint primary key 
    (status_id)
    constraint longtestqueuestatuslu_pkey;

alter table 'informix'.intro_event_property_lu add constraint primary key 
    (property_id)
    constraint collegetourpropertylu_pk;

alter table 'informix'.intro_event add constraint primary key 
    (event_id)
    constraint collegetourevent_pk;

alter table 'informix'.system_test_output add constraint primary key 
    (round_id, coder_id, component_id, test_case_id)
    constraint system_test_output_pkey;

create index 'informix'.long_component_state_indx on 'informix'.long_component_state
    (
    round_id, 
    coder_id, 
    component_id
    );

alter table 'informix'.long_component_state add constraint primary key 
    (long_component_state_id)
    constraint longcomponentstate_pkey;

alter table 'informix'.long_compilation add constraint primary key 
    (long_component_state_id)
    constraint longcompilation_pkey;

create index 'informix'.longcompresult_coderid_indx on 'informix'.long_comp_result
    (
    coder_id
    );

alter table 'informix'.long_comp_result add constraint primary key 
    (round_id, coder_id)
    constraint longcompresult_pkey;

alter table 'informix'.long_submission add constraint primary key 
    (long_component_state_id, submission_number, example)
    constraint longsubmission_pk;

alter table 'informix'.long_system_test_result add constraint primary key 
    (round_id, coder_id, component_id, test_case_id, submission_number, example)
    constraint longsystemtestresult_pk;

alter table 'informix'.long_system_test_output add constraint primary key 
    (round_id, coder_id, component_id, test_case_id, submission_number, example)
    constraint long_system_test_output_pkey;

create index 'informix'.ltq_create_date_idx on 'informix'.long_test_queue
    (
    create_date
    );

alter table 'informix'.long_test_queue add constraint primary key 
    (long_component_state_id, test_case_id)
    constraint longtestqueue_pkey;

alter table 'informix'.compilation_class_file add constraint primary key 
    (component_state_id, sort_order)
    constraint compilationclassfile_pkey;

alter table 'informix'.submission_class_file add constraint primary key 
    (component_state_id, submission_number, sort_order)
    constraint submissionclassfile_pk;

create index 'informix'.arch_sch_det_idx1 on 'informix'.archive_sched_job_detail
    (
    sched_job_id
    );

alter table 'informix'.long_submission_class_file add constraint primary key 
    (long_component_state_id, submission_number, example, sort_order)
    constraint longsubmissionclassfile_pk;

alter table 'informix'.ltg_type_lu add constraint primary key 
    (type_id)
    constraint ltg_type_lu_pk;

alter table 'informix'.ltg_status_lu add constraint primary key 
    (status_id)
    constraint ltg_status_lu_pk;

alter table 'informix'.long_test_group add constraint primary key 
    (ltg_id)
    constraint long_test_group_pk;

alter table 'informix'.ltc_status_lu add constraint primary key 
    (status_id)
    constraint ltc_status_lu_pk;

alter table 'informix'.long_test_case add constraint primary key 
    (ltc_id)
    constraint long_test_case_pk;

alter table 'informix'.long_test_result add constraint primary key 
    (ltc_id)
    constraint long_test_result_pk;

alter table 'informix'.long_test_queue_mpsqas add constraint primary key 
    (ltc_id)
    constraint long_test_queue_mpsqas_pk;

alter table 'informix'.mpsqas_user_ltg_xref add constraint primary key 
    (user_id, ltg_id)
    constraint mpsqas_user_ltg_pk;

alter table 'informix'.algo_rating_type_lu add constraint primary key 
    (algo_rating_type_id)
    constraint algo_rating_type_lu_pk;

alter table 'informix'.algo_rating add constraint primary key 
    (coder_id, algo_rating_type_id)
    constraint algo_rating_pkey;

alter table 'informix'.season add constraint primary key 
    (season_id)
    constraint season_pkey;

alter table 'informix'.season_type_lu add constraint primary key 
    (season_type_id)
    constraint season_type_lu_pkey;

alter table 'informix'.season_algo_rating add constraint primary key 
    (coder_id, season_id)
    constraint season_algo_rating_pkey;

alter table 'informix'.region_type_lu add constraint primary key 
    (region_type_id)
    constraint regiontypelu_pkey;

alter table 'informix'.region add constraint primary key 
    (region_id)
    constraint region_pkey;

alter table 'informix'.practice_group add constraint primary key 
    (group_id)
    constraint practice_group_pkey;

alter table 'informix'.payment_method_lu add constraint primary key 
    (payment_method_id)
    constraint pk_payment_meth48;

alter table 'informix'.team add constraint primary key 
    (team_id)
    constraint u463_376;

alter table 'informix'.member_contact_black_list add constraint primary key 
    (user_id, blocked_user_id)
    constraint member_contact_black_list_pk;

alter table 'informix'.member_contact_message add constraint primary key 
    (member_contact_message_id)
    constraint member_contact_message_pk;

alter table 'informix'.staging_algo_rating add constraint primary key 
    (coder_id, algo_rating_type_id, backup_id)
    constraint staging_algo_rating_pkey;

alter table 'informix'.round add constraint primary key 
    (round_id)
    constraint u478_496;

alter table 'informix'.payment_reference_lu add constraint primary key 
    (payment_reference_id)
    constraint payment_reference_lu_pk;

alter table 'informix'.long_test_score_id add constraint primary key 
    (round_id)
    constraint long_test_score_id_pk;

alter table 'informix'.mike_school add constraint primary key 
    (school_id)
    constraint mike_school_pkey;

alter table 'informix'.response add constraint primary key 
    (response_id)
    constraint response_pk;

alter table 'informix'.visa_letter_event add constraint primary key 
    (visa_letter_event_id)
    constraint visa_letter_event_id_pkey;

alter table 'informix'.visa_letter_request add constraint primary key 
    (visa_letter_request_id)
    constraint visa_letter_request_pkey;

alter table 'informix'.assignment_document_type_lu add constraint primary key 
    (assignment_document_type_id)
    constraint assignment_document_type_pkey;

alter table 'informix'.assignment_document_status_lu add constraint primary key 
    (assignment_document_status_id)
    constraint assignment_document_status_pkey;

alter table 'informix'.assignment_document add constraint primary key 
    (assignment_document_id)
    constraint assignment_document_pk;

alter table 'informix'.assignment_document_template add constraint primary key 
    (assignment_document_template_id)
    constraint assignment_document_template_pkey;

alter table 'informix'.intro_event_property_type_lu add constraint primary key 
    (property_type_id)
    constraint _property_type_lu_pk;

create index 'informix'.conn_hist_idx1 on 'informix'.connection_history
    (
    connection_id, 
    server_id
    );

create index 'informix'.conn_hist_idx2 on 'informix'.connection_history
    (
    coder_id
    );

alter table 'informix'.payment_status_lu add constraint primary key 
    (payment_status_id)
    constraint payment_status_lu_pk;

alter table 'informix'.payment_status_reason_lu add constraint primary key 
    (payment_status_reason_id)
    constraint payment_status_reason_lu_pk;

alter table 'informix'.payment_detail_status_reason_xref add constraint primary key 
    (payment_detail_id, payment_status_reason_id)
    constraint payment_detail_status_reason_xref_pk;

alter table 'informix'.round_language add constraint primary key 
    (round_id, language_id)
    constraint round_language_pk;

alter table 'informix'.generic_counter_client add constraint primary key 
    (client_id)
    constraint generic_counter_client_pk;

alter table 'informix'.generic_counter_client add constraint unique 
    (name)
    constraint generic_counter_client_uk;

alter table 'informix'.generic_counter add constraint primary key 
    (client_id, counter_id)
    constraint generic_counter_pk;

alter table 'informix'.payment_detail_pablo add constraint primary key 
    (payment_detail_id)
    constraint payment_detail_pk_temp;

alter table 'informix'.timers add constraint primary key 
    (timerid, targetid)
    constraint timers_pk;

create index 'informix'.room_result_round_coder_ix on 'informix'.room_result
    (
    round_id, 
    coder_id
    );

alter table 'informix'.room_result add constraint primary key 
    (round_id, room_id, coder_id)
    constraint room_result_pkey;

alter table 'informix'.classroom_status_lu add constraint primary key 
    (status_id)
    constraint pk_classroomstatus;

alter table 'informix'.classroom add constraint primary key 
    (classroom_id)
    constraint pk_classroom;

alter table 'informix'.student_classroom_status_lu add constraint primary key 
    (status_id)
    constraint pk_studentclassroomstatus;

alter table 'informix'.student_classroom_xref add constraint primary key 
    (classroom_id, student_id)
    constraint pk_studentclassroom;

alter table 'informix'.student_professor_xref add constraint primary key 
    (professor_id, student_id)
    constraint pk_studentprofessor;

alter table 'informix'.round_property_type_lu add constraint primary key 
    (round_property_type_id)
    constraint pk_roundpropertylu;

alter table 'informix'.round_property add constraint primary key 
    (round_id, round_property_type_id)
    constraint pk_roundproperty;

alter table 'informix'.college_problem_set add constraint primary key 
    (problem_set_id)
    constraint pk_collegeproblemset;

alter table 'informix'.problem_set_component_xref add constraint primary key 
    (problem_set_id, component_id)
    constraint pk_collegeproblemsetcomponent;

ALTER TABLE 'informix'.invoice_type_lu
      ADD CONSTRAINT PRIMARY KEY (invoice_type_id) CONSTRAINT pk_invoice_type_lu;
      
ALTER TABLE 'informix'.invoice_record
      ADD CONSTRAINT PRIMARY KEY (invoice_record_id) CONSTRAINT pk_invoice_record;

ALTER TABLE 'informix'.invoice
      ADD CONSTRAINT PRIMARY KEY (invoice_id) CONSTRAINT pk_invoice;

alter table 'informix'.invoice_record add constraint foreign key
    (invoice_id)
    references 'informix'.invoice
    (invoice_id)
    constraint fk_invoicerecord_invoice;

create index 'informix'.mike_temp1_idx on 'informix'.mike_temp1
    (
    user_id
    );

create index 'informix'.art_idx1 on 'informix'.algo_rating_tgh
    (
    coder_id, 
    algo_rating_type_id
    );

create index 'informix'.temp_algo_rating_index on 'informix'.algo_rating_tgh_hourly
    (
    coder_id, 
    algo_rating_type_id
    );

alter table 'informix'.payment_type_lu add constraint primary key 
    (payment_type_id)
    constraint payment_type_lu_pk;

alter table 'informix'.long_system_test_data add constraint primary key 
    (round_id, component_id, coder_id, example, submission_number, test_case_id)
    constraint long_system_test_data_pk;

alter table 'informix'.round_prize add constraint primary key 
    (round_id, place)
    constraint round_prize_pk;
	
alter table 'informix'.education add constraint foreign key 
    (degree_id)
    references 'informix'.degree
    (degree_id) 
    constraint education_degree_fk;

alter table 'informix'.education add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint education_coder_fk;

alter table 'informix'.coder_skill add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coderskill_coder_fk;

alter table 'informix'.coder_skill add constraint foreign key 
    (skill_id)
    references 'informix'.skill
    (skill_id) 
    constraint coder_skill_fk;

alter table 'informix'.contact_us add constraint foreign key 
    (contact_us_subject_id)
    references 'informix'.contact_us_subject
    (contact_us_subject_id) 
    constraint contactus_contactussubject_fk;

alter table 'informix'.group add constraint foreign key 
    (group_id)
    references 'informix'.secure_object
    (secure_object_id) 
    constraint group_secureobject_fk;

alter table 'informix'.group_user add constraint foreign key 
    (group_id)
    references 'informix'.group
    (group_id) 
    constraint group_user_group_fk;

alter table 'informix'.permission add constraint foreign key 
    (access_id)
    references 'informix'.access
    (access_id) 
    constraint permission_access_fk;

alter table 'informix'.permission add constraint foreign key 
    (sector_id)
    references 'informix'.sector
    (sector_id) 
    constraint permission_secotrs_fk;

alter table 'informix'.permission add constraint foreign key 
    (secure_object_id)
    references 'informix'.secure_object
    (secure_object_id) 
    constraint permission_secure_object_fk;

alter table 'informix'.question_type add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint questiontype_statuslu_fk;

alter table 'informix'.room add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint room_round_fk;

alter table 'informix'.room add constraint foreign key 
    (room_type_id)
    references 'informix'.room_type
    (room_type_id) 
    constraint room_roomtype_fk;

alter table 'informix'.room add constraint foreign key 
    (division_id)
    references 'informix'.division
    (division_id) 
    constraint room_division_fk;

alter table 'informix'.round_component add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundproblem_round_fk;

alter table 'informix'.round_component add constraint foreign key 
    (division_id)
    references 'informix'.division
    (division_id) 
    constraint roundproblem_division_fk;

alter table 'informix'.round_component add constraint foreign key 
    (difficulty_id)
    references 'informix'.difficulty
    (difficulty_id) 
    constraint roundproblem_difficulty_fk;

alter table 'informix'.round_component add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint roundcomponent_component_fk;

alter table 'informix'.round_segment add constraint foreign key 
    (segment_id)
    references 'informix'.segment
    (segment_id) 
    constraint roundsegment_segment_fk;

alter table 'informix'.round_segment add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundsegments_round_fk;

alter table 'informix'.dispute add constraint foreign key 
    (inquiry_id, corporate_id)
    references 'informix'.inquiry
    (inquiry_id, corporate_id) 
    constraint dispute_inquiry_fk;

alter table 'informix'.dispute add constraint foreign key 
    (corporate_id)
    references 'informix'.corporate
    (corporate_id) 
    constraint dispute_corporate_fk;

alter table 'informix'.inquiry add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint inquiry_coder_fk;

alter table 'informix'.watch add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coderwatch_coderid_fk;

alter table 'informix'.watch add constraint foreign key 
    (corporate_id)
    references 'informix'.corporate
    (corporate_id) 
    constraint coderwatch_corporate_fk;

alter table 'informix'.subscription_region add constraint foreign key 
    (subscription_id)
    references 'informix'.subscription
    (subscription_id) 
    constraint subscriptionregion_subscription_fk;

alter table 'informix'.subscription add constraint foreign key 
    (corporate_id)
    references 'informix'.corporate
    (corporate_id) 
    constraint subscripton_corporate_fk;

alter table 'informix'.contest add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint contest_language_fk;

alter table 'informix'.contest add constraint foreign key 
    (season_id)
    references 'informix'.season
    (season_id) 
    constraint contest_season_id_fkey;

alter table 'informix'.coder add constraint foreign key 
    (coder_type_id)
    references 'informix'.coder_type
    (coder_type_id) 
    constraint coder_codertype_fk;

alter table 'informix'.sector_file add constraint foreign key 
    (sector_id)
    references 'informix'.sector
    (sector_id) 
    constraint sector_file_sector_fk;

alter table 'informix'.sector_agreement add constraint foreign key 
    (sector_id)
    references 'informix'.sector
    (sector_id) 
    constraint sector_agreement_sector_fk;

alter table 'informix'.experience add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint experience_coder_fk;

alter table 'informix'.experience add constraint foreign key 
    (title_id)
    references 'informix'.title
    (title_id) 
    constraint coderexperience_title_fk;

alter table 'informix'.system_test_result add constraint foreign key 
    (test_case_id)
    references 'informix'.system_test_case
    (test_case_id) 
    constraint systemtestresult_systemtestcase_fk;

alter table 'informix'.system_test_result add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint systemtestcases_coder_fk;

alter table 'informix'.system_test_result add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint system_testcases_round_fk;

alter table 'informix'.system_test_result add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint systemtestresult_component_fk;

alter table 'informix'.system_test_result add constraint foreign key 
    (failure_type_id)
    references 'informix'.failure_type_lu
    (failure_type_id) 
    constraint systemtestresult_failuretype_fkey;

alter table 'informix'.coder_referral add constraint foreign key 
    (referral_id)
    references 'informix'.referral
    (referral_id) 
    constraint coder_referral_referral_fk;

alter table 'informix'.coder_referral add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coder_referral_coder_fk;

alter table 'informix'.problem_statement_history add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint prblmstmthistory_problem_fk;

alter table 'informix'.correspondence add constraint foreign key 
    (from_coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint correspondence_coder_fk;

alter table 'informix'.correspondence add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint correspondence_problem_fk;

alter table 'informix'.correspondence add constraint foreign key 
    (group_id)
    references 'informix'.group
    (group_id) 
    constraint correspondence_group_fk;

alter table 'informix'.correspondence add constraint foreign key 
    (reply_id)
    references 'informix'.correspondence
    (correspondence_id) 
    constraint correspondence_correspondence_fk;

alter table 'informix'.correspondence add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint correspondence_component_fk;

alter table 'informix'.mpsqas_chat_history add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint mpsqaschathistory_problem_d;

alter table 'informix'.mpsqas_chat_history add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint mpsqaschathistory_coder_d;

alter table 'informix'.component_user_xref add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint componentuserxref_component_fk;

alter table 'informix'.solution add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint solution_language_fk;

alter table 'informix'.solution add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint solution_coder_fk;

alter table 'informix'.component_state add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint problemstate_round_fk;

alter table 'informix'.component_state add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint problemstate_coder_fk;

alter table 'informix'.component_state add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint problemstate_language_fk;

alter table 'informix'.component_state add constraint foreign key 
    (status_id)
    references 'informix'.component_status_lu
    (component_status_id) 
    constraint componentstate_componentstatuslu_fk;

alter table 'informix'.component_state add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint componentstate_component_fk;

alter table 'informix'.problem_solution add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint problemsolution_problem_fk;

alter table 'informix'.problem_solution add constraint foreign key 
    (solution_id)
    references 'informix'.solution
    (solution_id) 
    constraint problemsoltuion_solution_fk;

alter table 'informix'.development_application add constraint foreign key 
    (user_type_id)
    references 'informix'.user_type
    (user_type_id) 
    constraint devapp_usertype_fk;

alter table 'informix'.development_application add constraint foreign key 
    (dev_app_status_id)
    references 'informix'.development_application_status
    (dev_app_status_id) 
    constraint devapp_devappstatus_fk;

alter table 'informix'.challenge add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint challenge_component_fk;

alter table 'informix'.challenge add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint challenge_round_fk;

alter table 'informix'.challenge add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint challenge_statuslu_fk;

alter table 'informix'.challenge add constraint foreign key 
    (challenger_id)
    references 'informix'.coder
    (coder_id) 
    constraint challenge_chgr_coder_fk;

alter table 'informix'.challenge add constraint foreign key 
    (defendant_id)
    references 'informix'.coder
    (coder_id) 
    constraint challenge_def_coder_fk;

alter table 'informix'.invite_list add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint invitelist_coder_fk;

alter table 'informix'.invite_list add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint invitelist_round_fk;

alter table 'informix'.invite_list add constraint foreign key 
    (contest_id)
    references 'informix'.contest
    (contest_id) 
    constraint invitelist_contest_fk;

alter table 'informix'.round_registration add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundregistration_round_fk;

alter table 'informix'.round_registration add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint roundregistration_coder_fk;

alter table 'informix'.question_style add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint questionstyle_statuslu_fk;

alter table 'informix'.answer add constraint foreign key 
    (question_id)
    references 'informix'.question
    (question_id) 
    constraint answer_question_fk;

alter table 'informix'.survey_question add constraint foreign key 
    (survey_id)
    references 'informix'.survey
    (survey_id) 
    constraint surveyquestion_survey_fk;

alter table 'informix'.survey_question add constraint foreign key 
    (question_id)
    references 'informix'.question
    (question_id) 
    constraint surveyquestion_question_fk;

alter table 'informix'.round_question add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundquestion_round_fk;

alter table 'informix'.round_question add constraint foreign key 
    (question_id)
    references 'informix'.question
    (question_id) 
    constraint roundquestion_question_fk;

alter table 'informix'.correspondence_read_xref add constraint foreign key 
    (correspondence_id)
    references 'informix'.correspondence
    (correspondence_id) 
    constraint correspondencereadxref_correspondence_fk;

alter table 'informix'.problem_user_request add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint problemuserrequest_problem_fk;

alter table 'informix'.image add constraint foreign key 
    (image_type_id)
    references 'informix'.image_type_lu
    (image_type_id) 
    constraint image_imagetypelu_fk;

alter table 'informix'.image add constraint foreign key 
    (path_id)
    references 'informix'.path
    (path_id) 
    constraint image_path_fk;

alter table 'informix'.coder_image_xref add constraint foreign key 
    (image_id)
    references 'informix'.image
    (image_id) 
    constraint coderimagexref_image_fk;

alter table 'informix'.coder_image_xref add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coderimagexref_coder_fk;

alter table 'informix'.round_type_lu add constraint foreign key 
    (algo_rating_type_id)
    references 'informix'.algo_rating_type_lu
    (algo_rating_type_id) 
    constraint round_type_lu_algo_rating_type_fk;

alter table 'informix'.request add constraint foreign key 
    (request_type_id)
    references 'informix'.request_type_lu
    (request_type_id) 
    constraint request_requesttypelu_fk;

alter table 'informix'.request add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint request_coder_fk;

alter table 'informix'.request add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint request_round_fk;

alter table 'informix'.request add constraint foreign key 
    (room_id)
    references 'informix'.room
    (room_id) 
    constraint request_room_fk;

alter table 'informix'.staging_rating add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint stagingrating_backup_id_fk;

alter table 'informix'.staging_challenge add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint stagingchallenge_backup_id_fk;

alter table 'informix'.staging_room_result add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint stagingroomresult_backup_id_fk;

alter table 'informix'.contract_payment_xref add constraint foreign key 
    (contract_id)
    references 'informix'.contract
    (contract_id) 
    constraint r_53;

alter table 'informix'.user_tax_form_xref add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint usertaxformxref_statuslu_fk;

alter table 'informix'.user_tax_form_xref add constraint foreign key 
    (tax_form_id)
    references 'informix'.tax_form
    (tax_form_id) 
    constraint usertaxform_taxform_fk;

alter table 'informix'.payment_note_xref add constraint foreign key 
    (payment_id)
    references 'informix'.payment
    (payment_id) 
    constraint paymentnotexref_payment_id;

alter table 'informix'.affidavit_note_xref add constraint foreign key 
    (affidavit_id)
    references 'informix'.affidavit
    (affidavit_id) 
    constraint affidavitnotexref_affidavite_fk;

alter table 'informix'.contract_note_xref add constraint foreign key 
    (contract_id)
    references 'informix'.contract
    (contract_id) 
    constraint contractnotexref_contract_fk;

alter table 'informix'.payment_detail add constraint foreign key 
    (payment_status_id)
    references 'informix'.payment_status_lu
    (payment_status_id) 
    constraint paymentdetail_paymentstatuslu_fk;

alter table 'informix'.payment_detail add constraint foreign key 
    (payment_address_id)
    references 'informix'.payment_address
    (payment_address_id) 
    constraint paymentdetail_paymentaddress_fk;

alter table 'informix'.payment_detail add constraint foreign key 
    (modification_rationale_id)
    references 'informix'.modification_rationale_lu
    (modification_rationale_id) 
    constraint paymentdetail_modificationrationale_fk;

alter table 'informix'.payment_detail add constraint foreign key 
    (payment_method_id)
    references 'informix'.payment_method_lu
    (payment_method_id) 
    constraint fk_payment_deta490;

alter table 'informix'.payment_detail add constraint foreign key 
    (payment_type_id)
    references 'informix'.payment_type_lu
    (payment_type_id) 
    constraint fk_payment_deta149;

alter table 'informix'.payment_detail add constraint foreign key 
    (algorithm_round_id)
    references 'informix'.round
    (round_id) 
    constraint paymentdetail_algorithm_round_id_fk;

alter table 'informix'.payment_detail add constraint foreign key 
    (algorithm_problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint paymentdetail_algorithm_problem_id_fk;

alter table 'informix'.payment add constraint foreign key 
    (most_recent_detail_id)
    references 'informix'.payment_detail
    (payment_detail_id) 
    constraint payment_paymentdetail_fk;

alter table 'informix'.payment add constraint foreign key 
    (referral_payment_id)
    references 'informix'.payment
    (payment_id) 
    constraint payment_payment_fk;

alter table 'informix'.payment_detail_xref add constraint foreign key 
    (payment_id)
    references 'informix'.payment
    (payment_id) 
    constraint paymentdetailxref_payment_fk;

alter table 'informix'.payment_detail_xref add constraint foreign key 
    (payment_detail_id)
    references 'informix'.payment_detail
    (payment_detail_id) 
    constraint paymentdetailxref_paymentdetail_fk;

alter table 'informix'.payment_release add constraint foreign key 
    (payment_method_id)
    references 'informix'.payment_method_lu
    (payment_method_id) 
    constraint paymentrelease_paymentmethodlu_fk;

alter table 'informix'.payment_release_xref add constraint foreign key 
    (payment_release_id)
    references 'informix'.payment_release
    (payment_release_id) 
    constraint paymentreleasexref_paymentrelease_fk;

alter table 'informix'.payment_release_xref add constraint foreign key 
    (payment_id)
    references 'informix'.payment
    (payment_id) 
    constraint paymentreleasexref_payment_fk;

alter table 'informix'.user_payment_method add constraint foreign key 
    (payment_method_id)
    references 'informix'.payment_method_lu
    (payment_method_id) 
    constraint userpaymentmethod_paymentmethodlu_fk;

alter table 'informix'.affidavit add constraint foreign key 
    (affidavit_type_id)
    references 'informix'.affidavit_type_lu
    (affidavit_type_id) 
    constraint affidavit_affidavittypelu_fk;

alter table 'informix'.affidavit add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint affidavit_statuslu_fk;

alter table 'informix'.user_tax_form_note_xref add constraint foreign key 
    (tax_form_id)
    references 'informix'.tax_form
    (tax_form_id) 
    constraint usertaxformnotexref_taxform_fk;

alter table 'informix'.tax_form add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint taxform_statuslu_fk;

alter table 'informix'.contract add constraint foreign key 
    (contract_type_id)
    references 'informix'.contract_type_lu
    (contract_type_id) 
    constraint contract_contracttyeplu_fk;

alter table 'informix'.contract add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint contract_status_fk;

alter table 'informix'.affidavit_template add constraint foreign key 
    (affidavit_type_id)
    references 'informix'.affidavit_type_lu
    (affidavit_type_id) 
    constraint affidavittemplate_affidavittypelu_fk;

alter table 'informix'.command add constraint foreign key 
    (command_group_id)
    references 'informix'.command_group_lu
    (command_group_id) 
    constraint command_command_group_fk;

alter table 'informix'.sched_job add constraint foreign key 
    (sched_job_type_id)
    references 'informix'.sched_job_type_lu
    (sched_job_type_id) 
    constraint sched_job_sched_job_type_lu_fk;

alter table 'informix'.sched_job add constraint foreign key 
    (sched_job_status_id)
    references 'informix'.sched_job_status_lu
    (sched_job_status_id) 
    constraint sched_job_sched_job_status_lu_fk;

alter table 'informix'.sched_job add constraint foreign key 
    (email_job_group_id)
    references 'informix'.email_job_group_lu 
    (email_job_group_id) 
    constraint sched_job_email_job_group_lu_fk;

alter table 'informix'.email_template add constraint foreign key 
    (email_template_group_id)
    references 'informix'.email_template_group_lu
    (email_template_group_id) 
    constraint email_template_email_template_group_lu_fk;

alter table 'informix'.email_list add constraint foreign key 
    (email_list_group_id)
    references 'informix'.email_list_group_lu
    (email_list_group_id) 
    constraint email_list_detail_email_list_group_lu_fk;

alter table 'informix'.email_list_detail add constraint foreign key 
    (email_list_id)
    references 'informix'.email_list
    (email_list_id) 
    constraint email_list_detail_email_list_fk;

alter table 'informix'.sched_email_job add constraint foreign key 
    (sched_email_job_id)
    references 'informix'.sched_job
    (sched_job_id) 
    constraint sched_email_job_sched_job_fk;

alter table 'informix'.sched_email_job add constraint foreign key 
    (email_template_id)
    references 'informix'.email_template
    (email_template_id) 
    constraint sched_email_job_email_template_fk;

alter table 'informix'.sched_email_job add constraint foreign key 
    (command_id)
    references 'informix'.command
    (command_id) 
    constraint sched_email_job_command_fk;

alter table 'informix'.sched_email_job add constraint foreign key 
    (email_list_id)
    references 'informix'.email_list
    (email_list_id) 
    constraint sched_email_job_email_list_fk;

alter table 'informix'.command_param add constraint foreign key 
    (sched_email_job_id)
    references 'informix'.sched_email_job
    (sched_email_job_id) 
    constraint command_param_sched_email_job_fk;

alter table 'informix'.broadcast add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint broadcast_round_fk;

alter table 'informix'.broadcast add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint broadcast_component_fk;

alter table 'informix'.broadcast add constraint foreign key 
    (broadcast_type_id)
    references 'informix'.broadcast_type_lu
    (broadcast_type_id) 
    constraint broadcast_broadcasttypelu_fk;

alter table 'informix'.broadcast add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint broadcast_statuslu_fk;

alter table 'informix'.round_payment add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundpayment_round_fk;

alter table 'informix'.round_payment add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint roundpayment_coder_fk;

alter table 'informix'.round_payment add constraint foreign key 
    (payment_type_id)
    references 'informix'.payment_type_lu
    (payment_type_id) 
    constraint roundpayment_paymenttypelu_fk;

alter table 'informix'.job_hit add constraint foreign key 
    (hit_type_id)
    references 'informix'.hit_type_lu
    (hit_type_id) 
    constraint jobhit_hittypelu_fk;

alter table 'informix'.job_hit add constraint foreign key 
    (job_id)
    references 'informix'.job
    (job_id) 
    constraint jobhit_job_fk;

alter table 'informix'.monitor_function add constraint foreign key 
    (monitor_function_type_id)
    references 'informix'.monitor_function_type_lu
    (monitor_function_type_id) 
    constraint monitorfunction_monitorfunctiontypelu_fk;

alter table 'informix'.monitor_user_round_xref add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint monitoruserroundxref_round_fk;

alter table 'informix'.group_monitor_function_xref add constraint foreign key 
    (group_id)
    references 'informix'.group
    (group_id) 
    constraint groupmonitorfunctionsxref_group_fk;

alter table 'informix'.group_monitor_function_xref add constraint foreign key 
    (monitor_function_id)
    references 'informix'.monitor_function
    (monitor_function_id) 
    constraint groupmonitorfunctionxref_monitorfunction_fk;

alter table 'informix'.company_image_xref add constraint foreign key 
    (image_id)
    references 'informix'.image
    (image_id) 
    constraint companyimagexref_image_fk;

alter table 'informix'.parameter add constraint foreign key 
    (data_type_id)
    references 'informix'.data_type
    (data_type_id) 
    constraint parameter_datatype_fk;

alter table 'informix'.component_solution_xref add constraint foreign key 
    (solution_id)
    references 'informix'.solution
    (solution_id) 
    constraint componentsolution_solution_fk;

alter table 'informix'.data_type_mapping add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint datatypemapping_language_fk;

alter table 'informix'.data_type_mapping add constraint foreign key 
    (data_type_id)
    references 'informix'.data_type
    (data_type_id) 
    constraint datatypemapping_datatype_fk;

alter table 'informix'.web_service_source_file add constraint foreign key 
    (web_service_id)
    references 'informix'.web_service
    (web_service_id) 
    constraint webservicesourcefile_webservice_fk;

alter table 'informix'.web_service_source_file add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint webservicesourcefile_language_fk;

alter table 'informix'.web_service_source_file add constraint foreign key 
    (web_service_file_type_id)
    references 'informix'.web_service_file_type
    (web_service_file_type_id) 
    constraint webservicesourcefile_webservicefiletype_fk;

alter table 'informix'.web_service_compilation add constraint foreign key 
    (web_service_source_file_id)
    references 'informix'.web_service_source_file
    (web_service_source_file_id) 
    constraint webservicecompilation_webservicesourcefile_fk;

alter table 'informix'.web_service_compilation add constraint foreign key 
    (web_service_file_type_id)
    references 'informix'.web_service_file_type
    (web_service_file_type_id) 
    constraint webservicecompilation_webservicefiletype_fk;

alter table 'informix'.component_web_service_xref add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint componentwebservice_component_fk;

alter table 'informix'.problem_payment add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint problempayment_coder_fk;

alter table 'informix'.problem_payment add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint problempayment_problem_fk;

alter table 'informix'.component add constraint foreign key 
    (component_type_id)
    references 'informix'.component_type_lu
    (component_type_id) 
    constraint component_componenttypelu_fk;

alter table 'informix'.resume add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint resume_coder_fk;

alter table 'informix'.resume add constraint foreign key 
    (file_type_id)
    references 'informix'.file_type_lu
    (file_type_id) 
    constraint resume_filetypelu_fk;

alter table 'informix'.campaign add constraint foreign key 
    (campaign_type_id)
    references 'informix'.campaign_type_lu
    (campaign_type_id) 
    constraint campaign_campaigntypelu_fk;

alter table 'informix'.campaign_activity_xref add constraint foreign key 
    (activity_id)
    references 'informix'.activity
    (activity_id) 
    constraint campaignactivityxref_activity_fk;

alter table 'informix'.campaign_activity_xref add constraint foreign key 
    (campaign_id)
    references 'informix'.campaign
    (campaign_id) 
    constraint campaignactivityxref_campaign_fk;

alter table 'informix'.campaign_job_xref add constraint foreign key 
    (campaign_id)
    references 'informix'.campaign
    (campaign_id) 
    constraint campaignjobxref_campaign_fk;

alter table 'informix'.campaign_job_xref add constraint foreign key 
    (job_id)
    references 'informix'.job
    (job_id) 
    constraint campaignjobxref_job_fk;

alter table 'informix'.problem add constraint foreign key 
    (status_id)
    references 'informix'.problem_status_lu
    (problem_status_id) 
    constraint problems_prblmstatus_fk;

alter table 'informix'.problem add constraint foreign key 
    (problem_type_id)
    references 'informix'.problem_type_lu
    (problem_type_id) 
    constraint problem_problemtypelu_fk;

alter table 'informix'.sched_job_detail add constraint foreign key 
    (sched_job_id)
    references 'informix'.sched_job
    (sched_job_id) 
    constraint sched_job_detail_sched_job_fk;

alter table 'informix'.sched_job_detail add constraint foreign key 
    (sched_job_detail_status_id)
    references 'informix'.sched_job_detail_status_lu
    (sched_job_detail_status_id) 
    constraint sched_job_detail_sched_job_detail_status_lu_fk;

alter table 'informix'.round_image_xref add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundimagexref_round_fk;

alter table 'informix'.round_image_xref add constraint foreign key 
    (image_id)
    references 'informix'.image
    (image_id) 
    constraint roundimagexref_image_fk;

alter table 'informix'.team_coder_component_xref add constraint foreign key 
    (team_id)
    references 'informix'.team
    (team_id) 
    constraint team_teamid_fk;

alter table 'informix'.team_coder_component_xref add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coder_coderid_fk;

alter table 'informix'.team_coder_component_xref add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint component_componentid_fk;

alter table 'informix'.team_coder_component_xref add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint round_roundid_fk;

alter table 'informix'.team_coder_xref add constraint foreign key 
    (team_id)
    references 'informix'.team
    (team_id) 
    constraint team_teamid_2_fk;

alter table 'informix'.team_coder_xref add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coder_coderid_2_fk;

alter table 'informix'.problem_web_service_xref add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint problem_problemid_fk;

alter table 'informix'.problem_web_service_xref add constraint foreign key 
    (web_service_id)
    references 'informix'.web_service
    (web_service_id) 
    constraint webservice_webserviceid_fk;

alter table 'informix'.web_service_java_doc add constraint foreign key 
    (web_service_id)
    references 'informix'.web_service
    (web_service_id) 
    constraint webservice_webserviceid_2_fk;

alter table 'informix'.compilation add constraint foreign key 
    (component_state_id)
    references 'informix'.component_state
    (component_state_id) 
    constraint compilation_problemstate_fk;

alter table 'informix'.submission add constraint foreign key 
    (component_state_id)
    references 'informix'.component_state
    (component_state_id) 
    constraint submission_problemstate_fk;

alter table 'informix'.charity_donation add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint charitydonation_coder_fk;

alter table 'informix'.charity_donation add constraint foreign key 
    (donation_type_id)
    references 'informix'.donation_type_lu
    (donation_type_id) 
    constraint charitydonation_donationtype_fk;

alter table 'informix'.question add constraint foreign key 
    (question_type_id)
    references 'informix'.question_type
    (question_type_id) 
    constraint question_questiontype_fk;

alter table 'informix'.question add constraint foreign key 
    (question_style_id)
    references 'informix'.question_style
    (question_style_id) 
    constraint question_questionstyle_fk;

alter table 'informix'.question add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint question_statuslu_fk;

alter table 'informix'.problem_rating add constraint foreign key 
    (question_id)
    references 'informix'.problem_rating_question
    (question_id) 
    constraint problem_rating_question_fk;

alter table 'informix'.problem_rating add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint problem_rating_coder_fk;

alter table 'informix'.problem_rating add constraint foreign key 
    (problem_id)
    references 'informix'.problem
    (problem_id) 
    constraint problem_rating_problem_fk;

alter table 'informix'.question_image_xref add constraint foreign key 
    (image_id)
    references 'informix'.image
    (image_id) 
    constraint questionimagexref_image_fk;

alter table 'informix'.question_image_xref add constraint foreign key 
    (question_id)
    references 'informix'.question
    (question_id) 
    constraint questionimagexref_question_fk;

alter table 'informix'.staging_component_state add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint stagingcomponentstate_backup_id_fk;

alter table 'informix'.backup add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint r339_743;

alter table 'informix'.backup_tables add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint r340_744;

alter table 'informix'.component_category_xref add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint comp_cat_xref_comp_fk;

alter table 'informix'.component_category_xref add constraint foreign key 
    (component_category_id)
    references 'informix'.component_category_lu
    (component_category_id) 
    constraint comp_cat_xref_cat_fk;

alter table 'informix'.campaign_round_xref add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint campaign_round_xref_round_fk;

alter table 'informix'.campaign_round_xref add constraint foreign key 
    (campaign_id)
    references 'informix'.campaign
    (campaign_id) 
    constraint campaign_round_xref_campaign_fk;

alter table 'informix'.skill add constraint foreign key 
    (skill_type_id)
    references 'informix'.skill_type
    (skill_type_id) 
    constraint skill_skilltype_fk;

alter table 'informix'.coder_skill_type_note_xref add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint coderskilltypenote_coder_fk;

alter table 'informix'.coder_skill_type_note_xref add constraint foreign key 
    (skill_type_id)
    references 'informix'.skill_type
    (skill_type_id) 
    constraint coderskilltypenote_skilltype_fk;

alter table 'informix'.system_test_case add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint system_test_case_component_fk;

alter table 'informix'.country_affidavit_template_xref add constraint foreign key 
    (affidavit_template_id)
    references 'informix'.affidavit_template
    (affidavit_template_id) 
    constraint countryaffidavittemplatexref_affidavittemplate_fk;

alter table 'informix'.message add constraint foreign key 
    (status_id)
    references 'informix'.message_status_lu
    (message_status_id) 
    constraint message_messagestatuslu_pk;

alter table 'informix'.user_message add constraint foreign key 
    (message_id)
    references 'informix'.message
    (message_id) 
    constraint usermessage_message_fkey;

alter table 'informix'.user_message add constraint foreign key 
    (status_id)
    references 'informix'.user_message_status_lu
    (user_message_status_id) 
    constraint usermessage_usermessagestatuslu_pk;

alter table 'informix'.solution_class_file add constraint foreign key 
    (solution_id)
    references 'informix'.solution
    (solution_id) 
    constraint solutionclassfile_solution_fk;

alter table 'informix'.survey add constraint foreign key 
    (status_id)
    references 'informix'.status_lu
    (status_id) 
    constraint survey_statuslu_fk;

alter table 'informix'.intro_event_property_lu add constraint foreign key 
    (property_type_id)
    references 'informix'.intro_event_property_type_lu
    (property_type_id) 
    constraint intro_event_property_fk;

alter table 'informix'.intro_event_config add constraint foreign key 
    (event_id)
    references 'informix'.intro_event
    (event_id) 
    constraint collegetourconfg_collegetourevent_fk;

alter table 'informix'.intro_event_config add constraint foreign key 
    (property_id)
    references 'informix'.intro_event_property_lu
    (property_id) 
    constraint collegetourconfg_collegetourproperty_fk;

alter table 'informix'.intro_event add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint collegetourevent_round_fk;

alter table 'informix'.intro_event add constraint foreign key 
    (image_id)
    references 'informix'.image
    (image_id) 
    constraint collegetourevent_image_fk;

alter table 'informix'.intro_event add constraint foreign key 
    (eligibility_command_id)
    references 'informix'.command
    (command_id) 
    constraint intro_event_command_id_fk;

alter table 'informix'.intro_event add constraint foreign key 
    (competition_round_id)
    references 'informix'.round
    (round_id) 
    constraint collegetourevent_compround_fk;

alter table 'informix'.system_test_output add constraint foreign key 
    (round_id, coder_id, component_id, test_case_id)
    references 'informix'.system_test_result
    (round_id, coder_id, component_id, test_case_id) 
    constraint systemtestoutput_systemtestresult_fkey;

alter table 'informix'.long_component_state add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint longcomponentstate_round_fk;

alter table 'informix'.long_component_state add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint longcomponentstate_coder_fk;

alter table 'informix'.long_component_state add constraint foreign key 
    (status_id)
    references 'informix'.component_status_lu
    (component_status_id) 
    constraint longcomponentstate_componentstatuslu_fk;

alter table 'informix'.long_component_state add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint longcomponentstate_component_fk;

alter table 'informix'.long_compilation add constraint foreign key 
    (long_component_state_id)
    references 'informix'.long_component_state
    (long_component_state_id) 
    constraint longcompilation_longcomponentstate_fk;

alter table 'informix'.long_comp_result add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint longcompresult_round_fk;

alter table 'informix'.long_comp_result add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint longcompresult_coder_fk;

alter table 'informix'.long_submission add constraint foreign key 
    (long_component_state_id)
    references 'informix'.long_component_state
    (long_component_state_id) 
    constraint longsubmission_problemstate_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
    (test_case_id)
    references 'informix'.system_test_case
    (test_case_id) 
    constraint longsystemtestresult_systemtestcase_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint longsystemtestresult_coder_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint longsystemtestresult_round_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint longsystemtestresult_component_fk;

alter table 'informix'.long_test_queue add constraint foreign key 
    (long_component_state_id)
    references 'informix'.long_component_state
    (long_component_state_id) 
    constraint longtestqueue_longcomponentstate_fk;

alter table 'informix'.long_test_queue add constraint foreign key 
    (test_case_id)
    references 'informix'.system_test_case
    (test_case_id) 
    constraint longtestqueue_systemtestcase_fk;

alter table 'informix'.long_test_queue add constraint foreign key 
    (status_id)
    references 'informix'.long_test_queue_status_lu
    (status_id) 
    constraint longtestqueue_longtestqueuestatuslu_fk;

alter table 'informix'.compilation_class_file add constraint foreign key 
    (component_state_id)
    references 'informix'.component_state
    (component_state_id) 
    constraint compilationclassfile_component_state_fk;

alter table 'informix'.submission_class_file add constraint foreign key 
    (component_state_id, submission_number)
    references 'informix'.submission
    (component_state_id, submission_number) 
    constraint submissionclassfile_submission_fk;

alter table 'informix'.long_test_group add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint ltg_component_fk;

alter table 'informix'.long_test_group add constraint foreign key 
    (solution_id)
    references 'informix'.solution
    (solution_id) 
    constraint ltg_solution_fk;

alter table 'informix'.long_test_group add constraint foreign key 
    (type_id)
    references 'informix'.ltg_type_lu
    (type_id) 
    constraint ltg_type_fk;

alter table 'informix'.long_test_group add constraint foreign key 
    (status_id)
    references 'informix'.ltg_status_lu
    (status_id) 
    constraint ltg_status_fk;

alter table 'informix'.long_test_case add constraint foreign key 
    (ltg_id)
    references 'informix'.long_test_group
    (ltg_id) 
    constraint ltc_ltg_fk;

alter table 'informix'.long_test_case add constraint foreign key 
    (status_id)
    references 'informix'.ltc_status_lu
    (status_id) 
    constraint ltc_status_fk;

alter table 'informix'.long_test_case add constraint foreign key 
    (test_case_id)
    references 'informix'.system_test_case
    (test_case_id) 
    constraint ltc_sytem_test_case_fk;

alter table 'informix'.long_test_result add constraint foreign key 
    (ltc_id)
    references 'informix'.long_test_case
    (ltc_id) 
    constraint ltr_ltc_fk;

alter table 'informix'.long_test_queue_mpsqas add constraint foreign key 
    (ltc_id)
    references 'informix'.long_test_case
    (ltc_id) 
    constraint ltq_ltc_fk;

alter table 'informix'.long_test_queue_mpsqas add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint ltq_language_fk;

alter table 'informix'.long_test_queue_mpsqas add constraint foreign key 
    (round_type_id)
    references 'informix'.round_type_lu
    (round_type_id) 
    constraint ltq_round_type_lu_fk;

alter table 'informix'.mpsqas_user_ltg_xref add constraint foreign key 
    (ltg_id)
    references 'informix'.long_test_group
    (ltg_id) 
    constraint mpsqas_user_ltg_ltg_fk;

alter table 'informix'.algo_rating add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint algo_rating_coder_fk;

alter table 'informix'.algo_rating add constraint foreign key 
    (algo_rating_type_id)
    references 'informix'.algo_rating_type_lu
    (algo_rating_type_id) 
    constraint algo_rating_ratingtype_fk;

alter table 'informix'.season add constraint foreign key 
    (season_type_id)
    references 'informix'.season_type_lu
    (season_type_id) 
    constraint season_season_type_id_fkey;

alter table 'informix'.season_algo_rating add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint season_algo_rating_coder_fk;

alter table 'informix'.region add constraint foreign key 
    (region_type_id)
    references 'informix'.region_type_lu
    (region_type_id) 
    constraint region_regiontype_fk;

alter table 'informix'.country_region_xref add constraint foreign key 
    (region_id)
    references 'informix'.region
    (region_id) 
    constraint country_region_xref_region_fk;

alter table 'informix'.round_group_xref add constraint foreign key 
    (group_id)
    references 'informix'.practice_group
    (group_id) 
    constraint round_group_xref_practice_group_fk;

alter table 'informix'.round_group_xref add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint round_group_xref_round_fk;

alter table 'informix'.team add constraint foreign key 
    (team_type)
    references 'informix'.team_type_lu
    (team_type_id) 
    constraint teamtypelu_teamtype_fk;

alter table 'informix'.member_contact_black_list add constraint foreign key 
    (user_id)
    references 'informix'.coder
    (coder_id) 
    constraint member_contact_black_list_user_id_fk;

alter table 'informix'.member_contact_black_list add constraint foreign key 
    (blocked_user_id)
    references 'informix'.coder
    (coder_id) 
    constraint member_contact_black_list_blocked_user_id_fk;

alter table 'informix'.member_contact_message add constraint foreign key 
    (sender_id)
    references 'informix'.coder
    (coder_id) 
    constraint member_contact_message_sender_id_fk;

alter table 'informix'.member_contact_message add constraint foreign key 
    (recipient_id)
    references 'informix'.coder
    (coder_id) 
    constraint member_contact_message_recipient_id_fk;

alter table 'informix'.staging_algo_rating add constraint foreign key 
    (backup_id)
    references 'informix'.backup
    (backup_id) 
    constraint stagingalgorating_backup_id_fk;

alter table 'informix'.round add constraint foreign key 
    (contest_id)
    references 'informix'.contest
    (contest_id) 
    constraint round_contest_fk;

alter table 'informix'.round add constraint foreign key 
    (round_type_id)
    references 'informix'.round_type_lu
    (round_type_id) 
    constraint round_roundtypelu_fk;

alter table 'informix'.round add constraint foreign key 
    (region_id)
    references 'informix'.region
    (region_id) 
    constraint region_round_fk;

alter table 'informix'.round add constraint foreign key 
    (creator_id)
    references 'informix'.coder
    (coder_id)
    constraint round_coder_fk;

alter table 'informix'.command_execution add constraint foreign key 
    (command_id)
    references 'informix'.command
    (command_id) 
    constraint commandexecution_command_fk;

alter table 'informix'.long_test_score_id add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint long_test_score_id_round_fk;

alter table 'informix'.response add constraint foreign key 
    (question_id)
    references 'informix'.question
    (question_id) 
    constraint response_question_fk;

alter table 'informix'.response add constraint foreign key 
    (answer_id)
    references 'informix'.answer
    (answer_id) 
    constraint response_answer_fk;

alter table 'informix'.visa_letter_event add constraint foreign key 
    (contest_id)
    references 'informix'.contest
    (contest_id) 
    constraint cvisa_letter_event_contest_fk;

alter table 'informix'.visa_letter_request add constraint foreign key 
    (user_id)
    references 'informix'.coder
    (coder_id) 
    constraint visa_letter_request_user_fkey;

alter table 'informix'.visa_letter_request add constraint foreign key 
    (visa_letter_event_id)
    references 'informix'.visa_letter_event
    (visa_letter_event_id) 
    constraint visa_letter_request_event_fkey;

alter table 'informix'.assignment_document add constraint foreign key 
    (assignment_document_type_id)
    references 'informix'.assignment_document_type_lu
    (assignment_document_type_id) 
    constraint assignment_document_assignment_documenttypelu_fk;

alter table 'informix'.assignment_document add constraint foreign key 
    (assignment_document_status_id)
    references 'informix'.assignment_document_status_lu
    (assignment_document_status_id) 
    constraint assignment_document_assignment_documentstatuslu_fk;

alter table 'informix'.assignment_document_template add constraint foreign key 
    (assignment_document_type_id)
    references 'informix'.assignment_document_type_lu
    (assignment_document_type_id) 
    constraint assignment_document_template_assignment_documenttypelu_fk;

alter table 'informix'.payment_detail_status_reason_xref add constraint foreign key 
    (payment_detail_id)
    references 'informix'.payment_detail
    (payment_detail_id) 
    constraint fk_payment_detail_reason;

alter table 'informix'.payment_detail_status_reason_xref add constraint foreign key 
    (payment_status_reason_id)
    references 'informix'.payment_status_reason_lu
    (payment_status_reason_id) 
    constraint fk_payment_status_reason_reason;

alter table 'informix'.round_language add constraint foreign key 
    (language_id)
    references 'informix'.language
    (language_id) 
    constraint round_language_language_fk;

alter table 'informix'.round_language add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint round_language_round_fk;

alter table 'informix'.generic_counter add constraint foreign key 
    (client_id)
    references 'informix'.generic_counter_client
    (client_id) 
    constraint generic_counter_generic_counter_client;

alter table 'informix'.room_result add constraint foreign key 
    (round_payment_id)
    references 'informix'.round_payment
    (round_payment_id) 
    constraint roomresult_roundpayment_fk;

alter table 'informix'.room_result add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roomresult_round_fk;

alter table 'informix'.room_result add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint roomresult_coder_fk;

alter table 'informix'.room_result add constraint foreign key 
    (room_id)
    references 'informix'.room
    (room_id) 
    constraint roomresult_room_fk;

alter table 'informix'.classroom add constraint foreign key 
    (status_id)
    references 'informix'.classroom_status_lu
    (status_id) 
    constraint fk_classroom_classroomstatus;

alter table 'informix'.student_classroom_xref add constraint foreign key 
    (classroom_id)
    references 'informix'.classroom
    (classroom_id) 
    constraint fk_studentclassroom_classroom;

alter table 'informix'.student_classroom_xref add constraint foreign key 
    (status_id)
    references 'informix'.student_classroom_status_lu
    (status_id) 
    constraint fk_classroom_studentclassroomstatus;

alter table 'informix'.round_property add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint fk_roundproperty_round;

alter table 'informix'.round_property add constraint foreign key 
    (round_property_type_id)
    references 'informix'.round_property_type_lu
    (round_property_type_id) 
    constraint fk_roundproperty_roundpropertylu;

alter table 'informix'.problem_set_component_xref add constraint foreign key 
    (problem_set_id)
    references 'informix'.college_problem_set
    (problem_set_id) 
    constraint fk_collegeproblemsetcomponent_problemset;

alter table 'informix'.problem_set_component_xref add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint fk_collegeproblemsetcomponent_component;

alter table 'informix'.payment_type_lu add constraint foreign key 
    (payment_reference_id)
    references 'informix'.payment_reference_lu
    (payment_reference_id) 
    constraint r595_848;

alter table 'informix'.long_system_test_data add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint longsystemtestdata_round_fk;

alter table 'informix'.long_system_test_data add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint longsystemtestdata_component_fk;

alter table 'informix'.long_system_test_data add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint longsystemtestdata_coder_fk;

alter table 'informix'.long_system_test_data add constraint foreign key 
    (test_case_id)
    references 'informix'.system_test_case
    (test_case_id) 
    constraint longsystemtestdata_testcase_fk;

create index 'informix'.paymnt_dtl_studio_cntst_idx on 'informix'.payment_detail
    (
    studio_contest_id
    );

alter table 'informix'.invoice_record add constraint foreign key
    (invoice_type_id)
    references 'informix'.invoice_type_lu
    (invoice_type_id)
    constraint fk_invoicerecord_invoicetypelu;
    
alter table 'informix'.invoice_record add constraint foreign key
    (payment_id)
    references 'informix'.payment
    (payment_id)
    constraint fk_invoicerecord_payment;

create unique index 'informix'.invoice_record1 on 'informix'.invoice_record
    (
    jira_issue_id, contest_id,invoice_type_id,payment_id, reference_id
    );
    
CREATE UNIQUE INDEX 'informix'.invoice_invoice_number on 'informix'.invoice (invoice_number);

alter table 'informix'.round_event add constraint primary key 
    (round_id, event_id)
    constraint round_event_pkey;
    
alter table 'informix'.round_event add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint roundevt_round_to_event_fk;
	
alter table 'informix'.problem_round_type_lu add constraint primary key 
    (problem_round_type_id)
    constraint problem_round_type_lu_pk;
	
alter table 'informix'.long_component_configuration add constraint primary key 
    (component_id)
    constraint long_component_configuration_pk;

alter table 'informix'.long_component_configuration add constraint foreign key 
    (component_id)
    references 'informix'.component
    (component_id) 
    constraint longcomponentconfiguration_component_fk;
    
alter table 'informix'.custom_build_setting_type_lu add constraint primary key 
    (custom_build_setting_type_id)
    constraint custom_build_setting_type_lu_pk; 
    
alter table 'informix'.custom_build_setting add constraint primary key 
    (custom_build_setting_id)
    constraint custom_build_setting_pk;

alter table 'informix'.custom_build_setting add constraint foreign key
    (custom_build_setting_type_id)
    references 'informix'.custom_build_setting_type_lu
    (custom_build_setting_type_id)
    constraint custombuildsetting_custombuildsettingtype_fk;
    
alter table 'informix'.user_api_spin add constraint primary key 
    (user_id, api_ranking)
    constraint user_api_spin_pkey;
    
alter table 'informix'.user_api_spin add constraint foreign key 
    (user_id)
    references 'informix'.coder
    (coder_id) 
    constraint user_api_spin_user_id_fk;

alter table 'informix'.round_prize add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint round_prize_round_fk;

alter table 'informix'.docusign_envelope add constraint primary key 
    (docusign_envelope_id)
    constraint 'informix'.docusign_envelope_pkey;

alter table 'informix'.user_action_audit add constraint primary key 
    (user_action_audit_id)
    constraint user_action_audit_pk;
