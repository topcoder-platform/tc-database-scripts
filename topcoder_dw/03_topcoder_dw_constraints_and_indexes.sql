database topcoder_dw;

create index 'informix'.calendar_date_idx on 'informix'.calendar
	(
	date
	);

alter table 'informix'.calendar add constraint primary key 
	(calendar_id)
	constraint calendar_pkey;

alter table 'informix'.language_lu add constraint primary key 
	(language_id)
	constraint language_pkey;

alter table 'informix'.room_type_lu add constraint primary key 
	(room_type_id)
	constraint room_type_pkey;

alter table 'informix'.division_lu add constraint primary key 
	(division_id)
	constraint division_pkey;

alter table 'informix'.level_lu add constraint primary key 
	(level_id)
	constraint level_pkey;

alter table 'informix'.contest add constraint primary key 
	(contest_id)
	constraint contest_pkey;

alter table 'informix'.data_type_lu add constraint primary key 
	(data_type_id)
	constraint data_type_pk;

alter table 'informix'.coder_problem add constraint primary key 
	(coder_id, round_id, division_id, problem_id)
	constraint coder_problem_pk;

alter table 'informix'.coder_division add constraint primary key 
	(coder_id, division_id, algo_rating_type_id)
	constraint coder_division_pk;

alter table 'informix'.log_type_lu add constraint primary key 
	(log_type_id)
	constraint log_type_lu_pk;

alter table 'informix'.update_log add constraint primary key 
	(log_id)
	constraint update_log_pkey;

alter table 'informix'.challenge add constraint primary key 
	(round_id, challenger_id, defendant_id, problem_id, challenge_id)
	constraint challenge_pkey;

alter table 'informix'.stc_old add constraint primary key 
	(test_case_id, problem_id)
	constraint systemtestcase_pk;

alter table 'informix'.skill_type_lu add constraint primary key 
	(skill_type_id)
	constraint skill_type_pkey;

alter table 'informix'.coder_skill_xref add constraint primary key 
	(coder_id, skill_id)
	constraint coder_skill_pkey;

alter table 'informix'.query add constraint primary key 
	(query_id)
	constraint query_pk;

alter table 'informix'.command add constraint primary key 
	(command_id)
	constraint command_pk;

alter table 'informix'.command_query_xref add constraint primary key 
	(command_id, query_id)
	constraint commandqueryxref_pk;

alter table 'informix'.room add constraint primary key 
	(room_id)
	constraint room_pkey;

alter table 'informix'.problem_submission add constraint primary key 
	(round_id, coder_id, problem_id, submission_number)
	constraint problem_submission_pk;

alter table 'informix'.streak_type_lu add constraint primary key 
	(streak_type_id)
	constraint streak_type_lu_pkey;

alter table 'informix'.round_problem add constraint primary key 
	(round_id, problem_id, division_id)
	constraint round_problem_pk;

alter table 'informix'.round_division add constraint primary key 
	(round_id, division_id)
	constraint round_division_pk;

create index 'informix'.room_result_div_plcd_idx on 'informix'.room_result
	(
	round_id, 
	division_id, 
	division_placed
	);

alter table 'informix'.room_result add constraint primary key 
	(round_id, room_id, coder_id)
	constraint room_result_pkey;

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

alter table 'informix'.round_type_lu add constraint primary key 
	(round_type_id)
	constraint round_type_lu_pk;

alter table 'informix'.request add constraint primary key 
	(request_id)
	constraint request_pk;

alter table 'informix'.request_type_lu add constraint primary key 
	(request_type_id)
	constraint request_type_lu_pk;

alter table 'informix'.path add constraint primary key 
	(path_id)
	constraint path_pk;

alter table 'informix'.image_type_lu add constraint primary key 
	(image_type_id)
	constraint image_type_lu_pk;

alter table 'informix'.image add constraint primary key 
	(image_id)
	constraint image_pk;

alter table 'informix'.coder_image_xref add constraint primary key 
	(coder_id, image_id)
	constraint coder_image_xref_pk;

alter table 'informix'.round_image_xref add constraint primary key 
	(round_id, image_id)
	constraint u136_47;

create unique index 'informix'.web_page_idx1 on 'informix'.web_page
	(
	page_id
	);

create index 'informix'.coder_idx2 on 'informix'.coder
	(
	state_code
	);

create index 'informix'.coder_idx3 on 'informix'.coder
	(
	country_code
	);

create index 'informix'.coder_lower_handle_idx on 'informix'.coder
	(
	handle_lower
	);

create index 'informix'.coder_status_idx on 'informix'.coder
	(
	status
	);

alter table 'informix'.coder add constraint primary key 
	(coder_id)
	constraint coder_pkey;

alter table 'informix'.rank_type_lu add constraint primary key 
	(rank_type_id)
	constraint rank_type_lu_pk;

alter table 'informix'.country add constraint primary key 
	(country_code)
	constraint country_pkey;

alter table 'informix'.state add constraint primary key 
	(state_code)
	constraint state_pkey;

alter table 'informix'.command_group_lu add constraint primary key 
	(command_group_id)
	constraint command_group_lu_pk;

alter table 'informix'.coder_rank_type_lu add constraint primary key 
	(coder_rank_type_id)
	constraint coder_rank_type_lu_pk;

alter table 'informix'.coder_rank add constraint primary key 
	(coder_id, coder_rank_type_id, algo_rating_type_id)
	constraint coder_rank_pkey;

alter table 'informix'.coder_rank_history add constraint primary key 
	(coder_id, round_id, coder_rank_type_id, algo_rating_type_id)
	constraint coder_rank_history_pkey;

alter table 'informix'.problem add constraint primary key 
	(problem_id, round_id, division_id)
	constraint u147_60;

alter table 'informix'.calendar_week add constraint primary key 
	(year, month, week)
	constraint u148_64;

alter table 'informix'.calendar_month add constraint primary key 
	(year, month)
	constraint u149_65;

alter table 'informix'.member_stats_week add constraint primary key 
	(year, month, week)
	constraint u150_66;

alter table 'informix'.country_coder_rank add constraint primary key 
	(coder_id, coder_rank_type_id, algo_rating_type_id)
	constraint country_coder_rank_pkey;

alter table 'informix'.state_coder_rank add constraint primary key 
	(coder_id, coder_rank_type_id, algo_rating_type_id)
	constraint state_coder_rank_pkey;

alter table 'informix'.problem_language add constraint primary key 
	(round_id, division_id, language_id, problem_id)
	constraint problem_language_pk;

alter table 'informix'.problem_category_xref add constraint primary key 
	(problem_id, problem_category_id)
	constraint problem_category_xref_pk;

alter table 'informix'.problem_category_lu add constraint primary key 
	(problem_category_id)
	constraint problem_category_lu_pk;

alter table 'informix'.skill add constraint primary key 
	(skill_id)
	constraint skill_pkey;

alter table 'informix'.system_test_result add constraint primary key 
	(round_id, coder_id, problem_id, test_case_id)
	constraint system_test_result_pkey;

alter table 'informix'.school add constraint primary key 
	(school_id)
	constraint school_pkey;

alter table 'informix'.long_problem_submission add constraint primary key 
	(round_id, coder_id, problem_id, submission_number, example)
	constraint longproblem_submission_pk;

alter table 'informix'.season add constraint primary key 
	(season_id)
	constraint season_pk;

alter table 'informix'.team add constraint primary key 
	(team_id)
	constraint team_pk;

alter table 'informix'.team_rank_type_lu add constraint primary key 
	(team_rank_type_id)
	constraint teamranktype_pk;

alter table 'informix'.season_team_rank add constraint primary key 
	(team_id, season_id)
	constraint seasonalteamrank_pk;

alter table 'informix'.season_team_rank_history add constraint primary key 
	(team_id, season_id, round_id)
	constraint seasonalteamrankhistory_pk;

alter table 'informix'.algo_rating_type_lu add constraint primary key 
	(algo_rating_type_id)
	constraint algo_rating_type_lu_pk;

alter table 'informix'.algo_rating add constraint primary key 
	(coder_id, algo_rating_type_id)
	constraint algo_rating_pkey;

alter table 'informix'.team_coder_xref add constraint primary key 
	(team_id, coder_id)
	constraint team_coder_xref_pkey;

alter table 'informix'.team_round add constraint primary key 
	(round_id, team_id)
	constraint team_round_pkey;

alter table 'informix'.season_rank add constraint primary key 
	(coder_id, season_id)
	constraint seasonrank_pk;

alter table 'informix'.season_rank_history add constraint primary key 
	(coder_id, season_id, round_id)
	constraint seasonrankhistory_pk;

alter table 'informix'.country_rank add constraint primary key 
	(country_code, algo_rating_type_id)
	constraint country_rank_pk;

alter table 'informix'.country_rank_history add constraint primary key 
	(country_code, round_id, algo_rating_type_id)
	constraint country_rank_history_pk;

alter table 'informix'.season_country_rank add constraint primary key 
	(season_id, country_code)
	constraint season_country_rank_pk;

alter table 'informix'.season_country_rank_history add constraint primary key 
	(season_id, country_code, round_id)
	constraint season_country_rank_history_pk;

alter table 'informix'.algo_rating_history add constraint primary key 
	(coder_id, round_id, algo_rating_type_id)
	constraint algoratinghistory_pkey;

alter table 'informix'.season_algo_rating add constraint primary key 
	(coder_id, season_id)
	constraint season_algo_rating_pkey;

create index 'informix'.curr_school_school_idx on 'informix'.current_school
	(
	school_id
	);

alter table 'informix'.current_school add constraint primary key 
	(coder_id)
	constraint current_school_pkey;

alter table 'informix'.coder_level add constraint primary key 
	(coder_id, division_id, level_id, algo_rating_type_id)
	constraint coder_level_pk;

alter table 'informix'.coder_problem_summary add constraint primary key 
	(coder_id, algo_rating_type_id)
	constraint coder_problem_summarya_pk;

alter table 'informix'.long_system_test_result add constraint primary key 
	(round_id, coder_id, problem_id, test_case_id, submission_number, example)
	constraint longsystemtestresult_pkey;

alter table 'informix'.long_comp_result add constraint primary key 
	(round_id, coder_id)
	constraint long_comp_result_pkey;

alter table 'informix'.region add constraint primary key 
	(region_id)
	constraint region_pkey;

alter table 'informix'.season_algo_rating_history add constraint primary key 
	(coder_id, round_id)
	constraint season_algo_rating_history_pkey;

alter table 'informix'.user_terms_of_use_xref add constraint primary key 
	(user_id, terms_of_use_id)
	constraint u194_237;

create index 'informix'.payment_reference_idx on 'informix'.payment
	(
	reference_id
	);

alter table 'informix'.payment add constraint primary key 
	(payment_id)
	constraint payment_pk;

alter table 'informix'.user_payment add constraint primary key 
	(payment_id)
	constraint user_payment_pk;

alter table 'informix'.problem_tester add constraint primary key 
	(tester_id, problem_id)
	constraint problem_tester_pkey;

alter table 'informix'.problem_writer add constraint primary key 
	(problem_id)
	constraint problem_writer_pkey;

alter table 'informix'.event add constraint primary key 
	(event_id)
	constraint event_prkey;

alter table 'informix'.event_registration add constraint primary key 
	(user_id, event_id)
	constraint eventregistration_pkey;

alter table 'informix'.system_test_case add constraint primary key 
	(test_case_id, problem_id)
	constraint systemtestcase2_pk;

alter table 'informix'.contest_coder add constraint primary key 
	(contest_id, coder_id)
	constraint contest_coder_pk;

alter table 'informix'.time add constraint primary key 
	(time_id)
	constraint time_pk;

alter table 'informix'.round add constraint primary key 
	(round_id)
	constraint u216_112;

alter table 'informix'.tgh_algo_rating add constraint primary key 
	(coder_id, algo_rating_type_id)
	constraint tgh_algo_rating_pkey;

alter table 'informix'.contest add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint contest_season_fk;

alter table 'informix'.coder_problem add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint coderproblem_round_fk;

alter table 'informix'.coder_problem add constraint foreign key 
	(level_id)
	references 'informix'.level_lu
	(level_id) 
	constraint coderproblem_level_fk;

alter table 'informix'.coder_problem add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderproblem_coder_fk;

alter table 'informix'.coder_problem add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint coderproblem_division_fk;

alter table 'informix'.coder_problem add constraint foreign key 
	(language_id)
	references 'informix'.language_lu
	(language_id) 
	constraint coderproblem_language_fk;

alter table 'informix'.coder_division add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderdivision_coder_fk;

alter table 'informix'.coder_division add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint coderdivision_division_fk;

alter table 'informix'.coder_division add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint coder_division_algo_rating_type_fk;

alter table 'informix'.update_log add constraint foreign key 
	(log_type_id)
	references 'informix'.log_type_lu
	(log_type_id) 
	constraint updatelog_logtypelu_fk;

alter table 'informix'.challenge add constraint foreign key 
	(defendant_id)
	references 'informix'.coder
	(coder_id) 
	constraint challengedefendant_coder_fk;

alter table 'informix'.challenge add constraint foreign key 
	(challenger_id)
	references 'informix'.coder
	(coder_id) 
	constraint challengechallenger_coder_fk;

alter table 'informix'.coder_skill_xref add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderskill_coder_fk;

alter table 'informix'.coder_skill_xref add constraint foreign key 
	(skill_id)
	references 'informix'.skill
	(skill_id) 
	constraint coderskill_skill_fk;

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

alter table 'informix'.room add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint room_round_fk;

alter table 'informix'.room add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint room_division_fk;

alter table 'informix'.room add constraint foreign key 
	(room_type_id)
	references 'informix'.room_type_lu
	(room_type_id) 
	constraint room_roomtype_fk;

alter table 'informix'.problem_submission add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint problemsubmission_coder_fk;

alter table 'informix'.streak add constraint foreign key 
	(start_round_id)
	references 'informix'.round
	(round_id) 
	constraint winstreak_round_fk;

alter table 'informix'.streak add constraint foreign key 
	(streak_type_id)
	references 'informix'.streak_type_lu
	(streak_type_id) 
	constraint winstreak_streaktypelu_fk;

alter table 'informix'.streak add constraint foreign key 
	(end_round_id)
	references 'informix'.round
	(round_id) 
	constraint winstreak_round_fk2;

alter table 'informix'.streak add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint winstreak_coder_fk;

alter table 'informix'.round_problem add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint roundproblem_division_fk;

alter table 'informix'.round_division add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint rounddivision_round_fk;

alter table 'informix'.round_division add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint rounddivision_division_fk;

alter table 'informix'.room_result add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint roomresult_coder_fk;

alter table 'informix'.room_result add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint roomresult_round_fk;

alter table 'informix'.room_result add constraint foreign key 
	(room_id)
	references 'informix'.room
	(room_id) 
	constraint roomresult_room_fk;

alter table 'informix'.room_result add constraint foreign key 
	(team_id)
	references 'informix'.team
	(team_id) 
	constraint roomresult_team_fk;

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

alter table 'informix'.input_lu add constraint foreign key 
	(data_type_id)
	references 'informix'.data_type_lu
	(data_type_id) 
	constraint inputlu_datatype_fk;

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

alter table 'informix'.image add constraint foreign key 
	(path_id)
	references 'informix'.path
	(path_id) 
	constraint image_path_fk;

alter table 'informix'.image add constraint foreign key 
	(image_type_id)
	references 'informix'.image_type_lu
	(image_type_id) 
	constraint image_imagetypelu_fk;

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

alter table 'informix'.coder add constraint foreign key 
	(comp_country_code)
	references 'informix'.country
	(country_code) 
	constraint codercompcountry_country_fk;

alter table 'informix'.coder_rank add constraint foreign key 
	(coder_rank_type_id)
	references 'informix'.coder_rank_type_lu
	(coder_rank_type_id) 
	constraint coderrank_coderranktypelu_fk;

alter table 'informix'.coder_rank add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderrank_coder_fk;

alter table 'informix'.coder_rank add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint coder_rank_algo_rating_type_fk;

alter table 'informix'.coder_rank_history add constraint foreign key 
	(coder_rank_type_id)
	references 'informix'.coder_rank_type_lu
	(coder_rank_type_id) 
	constraint coderrankhistory_coderranktypelu_fk;

alter table 'informix'.coder_rank_history add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderrankhistory_coder_fk;

alter table 'informix'.coder_rank_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint coderrankhistory_round_fk;

alter table 'informix'.coder_rank_history add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint coder_rank_history_algo_rating_type_fk;

alter table 'informix'.problem add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint problem_division_fk;

alter table 'informix'.problem add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint problem_round_fk;

alter table 'informix'.problem add constraint foreign key 
	(level_id)
	references 'informix'.level_lu
	(level_id) 
	constraint problem_level_fk;

alter table 'informix'.problem add constraint foreign key 
	(result_type_id)
	references 'informix'.data_type_lu
	(data_type_id) 
	constraint problem_datatype_fk;

alter table 'informix'.country_coder_rank add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint countrycoderrank_coder_fk;

alter table 'informix'.country_coder_rank add constraint foreign key 
	(country_code)
	references 'informix'.country
	(country_code) 
	constraint countrycoderrank_country_fk;

alter table 'informix'.country_coder_rank add constraint foreign key 
	(coder_rank_type_id)
	references 'informix'.coder_rank_type_lu
	(coder_rank_type_id) 
	constraint countrycoderrank_coderranktypelu_fk;

alter table 'informix'.country_coder_rank add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint country_coder_rank_algo_rating_type_fk;

alter table 'informix'.state_coder_rank add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint statecoderrank_coder_fk;

alter table 'informix'.state_coder_rank add constraint foreign key 
	(state_code)
	references 'informix'.state
	(state_code) 
	constraint statecoderrank_state_fk;

alter table 'informix'.state_coder_rank add constraint foreign key 
	(coder_rank_type_id)
	references 'informix'.coder_rank_type_lu
	(coder_rank_type_id) 
	constraint statecoderrank_coderranktypelu_fk;

alter table 'informix'.state_coder_rank add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint state_coder_rank_algo_rating_type_fk;

alter table 'informix'.school_coder_rank add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint schoolcoderrank_coder_fk;

alter table 'informix'.school_coder_rank add constraint foreign key 
	(school_id)
	references 'informix'.school
	(school_id) 
	constraint schoolcoderrank_school_fk;

alter table 'informix'.school_coder_rank add constraint foreign key 
	(coder_rank_type_id)
	references 'informix'.coder_rank_type_lu
	(coder_rank_type_id) 
	constraint schoolcoderrank_coderranktypelu_fk;

alter table 'informix'.school_coder_rank add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint school_coder_rank_type_lu;

alter table 'informix'.problem_language add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint problemlang_division_fk;

alter table 'informix'.problem_language add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint problemlang_round_fk;

alter table 'informix'.problem_language add constraint foreign key 
	(language_id)
	references 'informix'.language_lu
	(language_id) 
	constraint problemlang_language_fk;

alter table 'informix'.skill add constraint foreign key 
	(skill_type_id)
	references 'informix'.skill_type_lu
	(skill_type_id) 
	constraint skill_skilltype_fk;

alter table 'informix'.long_problem_submission add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint longproblemsubmission_coder_fk;

alter table 'informix'.season add constraint foreign key 
	(start_calendar_id)
	references 'informix'.calendar
	(calendar_id) 
	constraint seasonstart_calendar_fk;

alter table 'informix'.season add constraint foreign key 
	(end_calendar_id)
	references 'informix'.calendar
	(calendar_id) 
	constraint seasonend_calendar_fk;

alter table 'informix'.team add constraint foreign key 
	(school_id)
	references 'informix'.school
	(school_id) 
	constraint team_school_fk;

alter table 'informix'.season_team_rank add constraint foreign key 
	(team_id)
	references 'informix'.team
	(team_id) 
	constraint seasonalteamrank_team_fk;

alter table 'informix'.season_team_rank add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint seasonalteamrank_season_fk;

alter table 'informix'.season_team_rank_history add constraint foreign key 
	(team_id)
	references 'informix'.team
	(team_id) 
	constraint seasonalteamrankhistory_team_fk;

alter table 'informix'.season_team_rank_history add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint seasonalteamrankhistory_season_fk;

alter table 'informix'.season_team_rank_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint seasonalteamrankhistory_round_fk;

alter table 'informix'.algo_rating add constraint foreign key 
	(first_rated_round_id)
	references 'informix'.round
	(round_id) 
	constraint algorating_firstround_fk;

alter table 'informix'.algo_rating add constraint foreign key 
	(last_rated_round_id)
	references 'informix'.round
	(round_id) 
	constraint algorating_secondround_fk;

alter table 'informix'.algo_rating add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint algo_rating_algo_rating_type_fk;

alter table 'informix'.algo_rating add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint algo_rating_coder_fk;

alter table 'informix'.team_coder_xref add constraint foreign key 
	(team_id)
	references 'informix'.team
	(team_id) 
	constraint team_coder_xref_team_fk;

alter table 'informix'.team_coder_xref add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint team_coder_xref_coder_fk;

alter table 'informix'.team_round add constraint foreign key 
	(team_id)
	references 'informix'.team
	(team_id) 
	constraint team_round_team_fk;

alter table 'informix'.team_round add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint team_round_round_fk;

alter table 'informix'.season_rank add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint season_rank_coder_fk;

alter table 'informix'.season_rank add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint season_rank_season_fk;

alter table 'informix'.season_rank_history add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint season_rank_history_coder_fk;

alter table 'informix'.season_rank_history add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint season_rank_history_season_fk;

alter table 'informix'.country_rank add constraint foreign key 
	(country_code)
	references 'informix'.country
	(country_code) 
	constraint country_rank_country_code_fk;

alter table 'informix'.country_rank_history add constraint foreign key 
	(country_code)
	references 'informix'.country
	(country_code) 
	constraint country_rank_history_country_code_fk;

alter table 'informix'.country_rank_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint country_rank_history_fk;

alter table 'informix'.season_country_rank add constraint foreign key 
	(country_code)
	references 'informix'.country
	(country_code) 
	constraint season_country_rank_country_code_fk;

alter table 'informix'.season_country_rank add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint season_country_rank_season_fk;

alter table 'informix'.season_country_rank_history add constraint foreign key 
	(country_code)
	references 'informix'.country
	(country_code) 
	constraint season_country_rank_history_country_code_fk;

alter table 'informix'.season_country_rank_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint season_country_rank_history_fk;

alter table 'informix'.season_country_rank_history add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint season_country_rank_history_season_fk;

alter table 'informix'.algo_rating_history add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint algo_rating_history_coder_fk;

alter table 'informix'.algo_rating_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint algo_rating_history_round_fk;

alter table 'informix'.season_algo_rating add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint season_algo_rating_coder_fk;

alter table 'informix'.season_algo_rating add constraint foreign key 
	(first_rated_round_id)
	references 'informix'.round
	(round_id) 
	constraint season_algo_rating_first_rated_round_fk;

alter table 'informix'.season_algo_rating add constraint foreign key 
	(last_rated_round_id)
	references 'informix'.round
	(round_id) 
	constraint season_algo_rating_last_rated_round_fk;

alter table 'informix'.coder_level add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderlevel_coder_fk;

alter table 'informix'.coder_level add constraint foreign key 
	(level_id)
	references 'informix'.level_lu
	(level_id) 
	constraint coderlevel_level_fk;

alter table 'informix'.coder_level add constraint foreign key 
	(division_id)
	references 'informix'.division_lu
	(division_id) 
	constraint coderlevel_division_fk;

alter table 'informix'.coder_level add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint coder_level_algo_rating_type_fk;

alter table 'informix'.coder_problem_summary add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint coderproblemsummary_coder_fk;

alter table 'informix'.coder_problem_summary add constraint foreign key 
	(algo_rating_type_id)
	references 'informix'.algo_rating_type_lu
	(algo_rating_type_id) 
	constraint coder_problem_summary_algo_rating_type_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint longsystemtestresult_round_fk;

alter table 'informix'.long_system_test_result add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint longsystemtestresult_coder_fk;

alter table 'informix'.season_algo_rating_history add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint season_algo_rating_history_coder_fk;

alter table 'informix'.season_algo_rating_history add constraint foreign key 
	(round_id)
	references 'informix'.round
	(round_id) 
	constraint season_algo_rating_history_round_fk;

alter table 'informix'.season_algo_rating_history add constraint foreign key 
	(season_id)
	references 'informix'.season
	(season_id) 
	constraint season_algo_rating_history_season_fk;

alter table 'informix'.command_execution add constraint foreign key 
	(command_id)
	references 'informix'.command
	(command_id) 
	constraint commandexecution_command_fk;

alter table 'informix'.user_payment add constraint foreign key 
	(payment_id)
	references 'informix'.payment
	(payment_id) 
	constraint fk_user_payment_payment;

alter table 'informix'.user_payment add constraint foreign key 
	(due_calendar_id)
	references 'informix'.calendar
	(calendar_id) 
	constraint fk_user_payment_calendar1;

alter table 'informix'.user_payment add constraint foreign key 
	(paid_calendar_id)
	references 'informix'.calendar
	(calendar_id) 
	constraint fk_user_payment_calendar2;

alter table 'informix'.problem_tester add constraint foreign key 
	(tester_id)
	references 'informix'.coder
	(coder_id) 
	constraint problemtester_coder_fk;

alter table 'informix'.problem_writer add constraint foreign key 
	(writer_id)
	references 'informix'.coder
	(coder_id) 
	constraint problemwriter_coder_fk;

alter table 'informix'.event_registration add constraint foreign key 
	(event_id)
	references 'informix'.event
	(event_id) 
	constraint eventreg_event_fk;

alter table 'informix'.contest_coder add constraint foreign key 
	(coder_id)
	references 'informix'.coder
	(coder_id) 
	constraint contestcoder_coder_fk;

alter table 'informix'.contest_coder add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint contestcoder_contest_fk;

alter table 'informix'.round add constraint foreign key 
	(contest_id)
	references 'informix'.contest
	(contest_id) 
	constraint round_contest_fk;

alter table 'informix'.round add constraint foreign key 
	(calendar_id)
	references 'informix'.calendar
	(calendar_id) 
	constraint round_calendar_fk;

alter table 'informix'.round add constraint foreign key 
	(round_type_id)
	references 'informix'.round_type_lu
	(round_type_id) 
	constraint round_roundtypelu_fk;

alter table 'informix'.round add constraint foreign key 
	(region_id)
	references 'informix'.region
	(region_id) 
	constraint round_region_fkey;

alter table 'informix'.round add constraint foreign key 
	(time_id)
	references 'informix'.time
	(time_id) 
	constraint round_time_id;

