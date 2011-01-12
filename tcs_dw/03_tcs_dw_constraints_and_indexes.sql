database tcs_dw;

alter table 'informix'.user_component_score add constraint primary key 
	(user_component_score_id)
	constraint pk_user_comp_score_id;

alter table 'informix'.log_type_lu add constraint primary key 
	(log_type_id)
	constraint log_type_lu_pk;

alter table 'informix'.update_log add constraint primary key 
	(log_id)
	constraint update_log_pkey;

create index 'informix'.project_idx1 on 'informix'.project
	(
	component_id
	);

alter table 'informix'.project add constraint primary key 
	(project_id)
	constraint project_pkey;

alter table 'informix'.contest add constraint primary key 
	(contest_id)
	constraint contest_pkey;

alter table 'informix'.contest_project_xref add constraint primary key 
	(contest_id, project_id)
	constraint con_proj_pkey;

create index 'informix'.proj_result_idx1 on 'informix'.project_result
	(
	user_id
	);

alter table 'informix'.project_result add constraint primary key 
	(project_id, user_id)
	constraint proj_result_pkey;

create index 'informix'.sub_review_idx1 on 'informix'.submission_review
	(
	user_id
	);

create index 'informix'.sub_review_idx2 on 'informix'.submission_review
	(
	reviewer_id
	);

alter table 'informix'.submission_review add constraint primary key 
	(project_id, user_id, reviewer_id)
	constraint sub_review_pkey;

create index 'informix'.user_cont_priz_idx1 on 'informix'.user_contest_prize
	(
	user_id
	);

create index 'informix'.user_cont_priz_idx2 on 'informix'.user_contest_prize
	(
	contest_id, 
	user_id
	);

create index 'informix'.royalty_idx1 on 'informix'.royalty
	(
	user_id
	);

alter table 'informix'.user_reliability add constraint primary key 
	(user_id, phase_id)
	constraint user_reliability_pkey;

alter table 'informix'.event add constraint primary key 
	(event_id)
	constraint event_pkey;

alter table 'informix'.user_event_xref add constraint primary key 
	(user_id, event_id)
	constraint usereventxref_pkey;

alter table 'informix'.user_rank_type_lu add constraint primary key 
	(user_rank_type_id)
	constraint user_rank_type_lu_pk;

alter table 'informix'.command add constraint primary key 
	(command_id)
	constraint command_pk;

alter table 'informix'.command_group_lu add constraint primary key 
	(command_group_id)
	constraint command_group_lu_pk;

alter table 'informix'.data_type_lu add constraint primary key 
	(data_type_id)
	constraint data_type_pk;

create unique index 'informix'.inputlu_inputcode_idx on 'informix'.input_lu
	(
	input_code
	);

alter table 'informix'.input_lu add constraint primary key 
	(input_id)
	constraint input_lu_pkey;

alter table 'informix'.query add constraint primary key 
	(query_id)
	constraint query_pk;

alter table 'informix'.query_input_xref add constraint primary key 
	(query_id, input_id)
	constraint query_input_pk;

alter table 'informix'.command_query_xref add constraint primary key 
	(command_id, query_id)
	constraint commandqueryxref_pk;

alter table 'informix'.submission_screening add constraint primary key 
	(project_id, user_id)
	constraint sub_screening_pkey;

alter table 'informix'.review_resp add constraint primary key 
	(review_resp_id)
	constraint review_resp_pkey;

alter table 'informix'.scorecard_template add constraint primary key 
	(scorecard_template_id)
	constraint scorecard_template_pkey;

alter table 'informix'.evaluation_lu add constraint primary key 
	(evaluation_id)
	constraint evaluation_pk;

alter table 'informix'.scorecard_response add constraint primary key 
	(scorecard_question_id, scorecard_id)
	constraint scorecard_response_pkey;

alter table 'informix'.testcase_response add constraint primary key 
	(scorecard_question_id, scorecard_id)
	constraint testcase_response_pkey;

alter table 'informix'.subjective_response add constraint primary key 
	(scorecard_question_id, scorecard_id, sort)
	constraint subjective_response_pkey;

alter table 'informix'.appeal add constraint primary key 
	(appeal_id)
	constraint appeal_pkey;

alter table 'informix'.testcase_appeal add constraint primary key 
	(appeal_id)
	constraint testcaseappeal_pkey;

alter table 'informix'.project_review add constraint primary key 
	(project_id, reviewer_id)
	constraint proj_review_pkey;

alter table 'informix'.season add constraint primary key 
	(season_id)
	constraint season_pk;

alter table 'informix'.stage add constraint primary key 
	(stage_id)
	constraint stage_pk;

alter table 'informix'.submission add constraint primary key 
	(submission_id)
	constraint submission_pk;

alter table 'informix'.contest_prize add constraint primary key 
	(contest_prize_id)
	constraint contest_prize_pkey;

alter table 'informix'.contest_stage_xref add constraint primary key 
	(contest_id, stage_id)
	constraint contest_stage_xref_pkey;

alter table 'informix'.contest_season_xref add constraint primary key 
	(contest_id, season_id)
	constraint contest_season_xref_pkey;

alter table 'informix'.streak_type_lu add constraint primary key 
	(streak_type_id)
	constraint streak_type_lu_pkey;

alter table 'informix'.project_result_022707 add constraint primary key 
	(project_id, user_id)
	constraint proj_result_pkey_022707;

alter table 'informix'.contest_result add constraint primary key 
	(contest_id, coder_id)
	constraint contest_result_pk;

alter table 'informix'.scorecard_question add constraint primary key 
	(scorecard_question_id)
	constraint scorecard_question_pkey;

alter table 'informix'.user_rating add constraint primary key 
	(user_id, phase_id)
	constraint pk_user_rating;

alter table 'informix'.dr_points add constraint primary key 
	(dr_points_id)
	constraint pk_dr_points;

alter table 'informix'.track add constraint primary key 
	(track_id)
	constraint pk_track;

alter table 'informix'.track_contest add constraint primary key 
	(track_contest_id)
	constraint pk_track_contest;

alter table 'informix'.track_contest_results add constraint primary key 
	(track_contest_id, user_id)
	constraint pk_track_contest_results;

alter table 'informix'.client_project_dim add constraint primary key 
	(client_project_id)
	constraint client_project_dim_pkey;

alter table 'informix'.weekly_contest_stats add constraint primary key 
	(client_project_id, tc_direct_project_id, project_category_id, week, month, year)
	constraint weekly_contest_stats_pkey;

alter table 'informix'.direct_project_dim add constraint primary key 
	(direct_project_id)
	constraint direct_project_dim_pkey;

alter table 'informix'.update_log add constraint foreign key 
	(log_type_id)
	references 'informix'.log_type_lu
	(log_type_id) 
	constraint updatelog_logtypelu_fk;

alter table 'informix'.project add constraint foreign key 
	(stage_id)
	references 'informix'.stage
	(stage_id) 
	constraint project_stage_fk;

alter table 'informix'.contest add constraint foreign key 
	(event_id)
	references 'informix'.event
	(event_id) 
	constraint contest_event_fk;

alter table 'informix'.submission_review add constraint foreign key 
	(scorecard_template_id)
	references 'informix'.scorecard_template
	(scorecard_template_id) 
	constraint review_template_fkey;

alter table 'informix'.event add constraint foreign key 
	(event_id)
	references 'informix'.event
	(event_id) 
	constraint userevent_event_fk;

alter table 'informix'.user_rank add constraint foreign key 
	(user_rank_type_id)
	references 'informix'.user_rank_type_lu
	(user_rank_type_id) 
	constraint userrank_userranktypelu_fk;

alter table 'informix'.school_user_rank add constraint foreign key 
	(user_rank_type_id)
	references 'informix'.user_rank_type_lu
	(user_rank_type_id) 
	constraint schooluserrank_userranktypelu_fk;

alter table 'informix'.country_user_rank add constraint foreign key 
	(user_rank_type_id)
	references 'informix'.user_rank_type_lu
	(user_rank_type_id) 
	constraint countryuserrank_userranktypelu_fk;

alter table 'informix'.input_lu add constraint foreign key 
	(data_type_id)
	references 'informix'.data_type_lu
	(data_type_id) 
	constraint inputlu_datatype_fk;

alter table 'informix'.query_input_xref add constraint foreign key 
	(query_id)
	references 'informix'.query
	(query_id) 
	constraint queryinputs_query_fk;

alter table 'informix'.query_input_xref add constraint foreign key 
	(input_id)
	references 'informix'.input_lu
	(input_id) 
	constraint queryinput_inputlu_fk;

alter table 'informix'.command_query_xref add constraint foreign key 
	(command_id)
	references 'informix'.command
	(command_id) 
	constraint commandquery_command_fk;

alter table 'informix'.command_query_xref add constraint foreign key 
	(query_id)
	references 'informix'.query
	(query_id) 
	constraint commandquery_query_fk;

alter table 'informix'.submission_screening add constraint foreign key 
	(scorecard_template_id)
	references 'informix'.scorecard_template
	(scorecard_template_id) 
	constraint screening_template_fkey;

alter table 'informix'.scorecard_response add constraint foreign key 
	(scorecard_question_id)
	references 'informix'.scorecard_question
	(scorecard_question_id) 
	constraint question_response_fkey;

alter table 'informix'.scorecard_response add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint project_response_fkey;

alter table 'informix'.scorecard_response add constraint foreign key 
	(evaluation_id)
	references 'informix'.evaluation_lu
	(evaluation_id) 
	constraint evaluation_response_fkey;

alter table 'informix'.testcase_response add constraint foreign key 
	(scorecard_question_id)
	references 'informix'.scorecard_question
	(scorecard_question_id) 
	constraint question_testcase_fkey;

alter table 'informix'.testcase_response add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint project_testcase_fkey;

alter table 'informix'.subjective_response add constraint foreign key 
	(scorecard_question_id)
	references 'informix'.scorecard_question
	(scorecard_question_id) 
	constraint question_subjective_fkey;

alter table 'informix'.subjective_response add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint project_subjective_fkey;

alter table 'informix'.appeal add constraint foreign key 
	(scorecard_question_id)
	references 'informix'.scorecard_question
	(scorecard_question_id) 
	constraint appeal_question_fkey;

alter table 'informix'.appeal add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint appeal_project_fkey;

alter table 'informix'.appeal add constraint foreign key 
	(raw_evaluation_id)
	references 'informix'.evaluation_lu
	(evaluation_id) 
	constraint appeal_evaluation_fkey;

alter table 'informix'.appeal add constraint foreign key 
	(final_evaluation_id)
	references 'informix'.evaluation_lu
	(evaluation_id) 
	constraint appeal_finalevalulation_fkey;

alter table 'informix'.testcase_appeal add constraint foreign key 
	(scorecard_question_id)
	references 'informix'.scorecard_question
	(scorecard_question_id) 
	constraint testcaseappeal_question_fkey;

alter table 'informix'.testcase_appeal add constraint foreign key 
	(project_id)
	references 'informix'.project
	(project_id) 
	constraint testcase_project_fkey;

alter table 'informix'.stage add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint stage_season_fk;

alter table 'informix'.command_execution add constraint foreign key 
	(command_id)
	references 'informix'.command
	(command_id) 
	constraint commandexecution_command_fk;

alter table 'informix'.contest_prize add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint fk_contest_prize_contest;

alter table 'informix'.contest_stage_xref add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint fk_contest_stage_xref_contest;

alter table 'informix'.contest_stage_xref add constraint foreign key 
	(stage_id)
	references 'informix'.stage
	(stage_id) 
	constraint fk_contest_stage_xref_stage;

alter table 'informix'.contest_season_xref add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint fk_contest_season_xref_contest;

alter table 'informix'.contest_season_xref add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint fk_contest_season_xref_season;

alter table 'informix'.streak add constraint foreign key 
	(start_project_id)
	references 'informix'.project
	(project_id) 
	constraint streak_start_project_fk;

alter table 'informix'.streak add constraint foreign key 
	(end_project_id)
	references 'informix'.project
	(project_id) 
	constraint streak_end_project_fk;

alter table 'informix'.streak add constraint foreign key 
	(streak_type_id)
	references 'informix'.streak_type_lu
	(streak_type_id) 
	constraint streak_typelu_fk;

alter table 'informix'.contest_result add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint contest_result_contest_id_fk;

alter table 'informix'.scorecard_question add constraint foreign key 
	(scorecard_template_id)
	references 'informix'.scorecard_template
	(scorecard_template_id) 
	constraint question_template_fkey;

alter table 'informix'.user_rating add constraint foreign key 
	(last_rated_project_id)
	references 'informix'.project
	(project_id) 
	constraint userrating_project_fk;

alter table 'informix'.dr_points add constraint foreign key 
	(track_id)
	references 'informix'.track
	(track_id) 
	constraint dr_points_fkindex1;

alter table 'informix'.track_contest add constraint foreign key 
	(track_id)
	references 'informix'.track
	(track_id) 
	constraint track_contest_fkindex1;

alter table 'informix'.track_contest_results add constraint foreign key 
	(track_contest_id)
	references 'informix'.track_contest
	(track_contest_id) 
	constraint track_contest_results_fkindex1;

alter table 'informix'.project_spec_review_xref add constraint foreign key 
    (project_id)
    references 'informix'.project  
	(project_id)
	constraint 'informix'.project_spec_rv_x_project_fk;

alter table 'informix'.project add constraint foreign key 
	(client_project_id)
	references 'informix'.client_project_dim
	(client_project_id) 
	constraint project_client_project_dim_id_fk;

alter table 'informix'.weekly_contest_stats add constraint foreign key
	(client_project_id)
	references 'informix'.client_project_dim
	(client_project_id)
	constraint weekly_contest_status_client_project_dim_id_fk;
