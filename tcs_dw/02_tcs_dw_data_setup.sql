-- The following tables are included in this script: 
--       data_type_lu, query, command, command_query_xref, query_input_xref, input_lu, command_group_lu
--
-- should .... be deleted?
--

database tcs_dw;

INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (21485, 'dd_component_rating_distribution', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (21495, 'comp_contest_details', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (21496, 'comp_list', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (21497, 'find_projects', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26097, 'check_project_completed', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26098, 'get_scorecard', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26099, 'scorecard_details', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26120, 'testcase_results', 24748);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26123, 'recent component trend', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26287, 'avg_placement', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26288, 'component_money', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26289, 'high_scores', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26290, 'largest_comp_prize', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26291, 'most_reviews', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26292, 'most_submissions', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26293, 'most_wins', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26294, 'overall_money', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26295, 'royalties', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26296, 'tournament_money', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26297, 'win_percentage', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26333, 'fulfillment_rate', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26334, 'fulfillment_rate_week', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26335, 'reposts', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26336, 'new_participants_week', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26337, 'new_ratio', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26338, 'delete_me', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26339, 'drop_off', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26340, 'submission_rate', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26341, 'cost_by_phase', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26342, 'cost_by_catalog', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26343, 'posted_components', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26379, 'reposts_month', 24778);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26404, 'dr_leader_board', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26405, 'dr_rookie_board', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26406, 'dr_current_period', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26407, 'dr_seasons', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26408, 'dr_stages', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26409, 'competition_history', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26539, 'dr_leader_tie_break_placement', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26540, 'dr_leader_tie_break_score', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26541, 'dr_rookie_tie_break_placement', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26542, 'dr_rookie_tie_break_score', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26559, 'stage_outstanding_projects', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26560, 'season_outstanding_projects', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26561, 'outstanding_projects', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26710, 'tccc06_contest_prizes', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26711, 'tccc06_member_projects', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26712, 'tccc06_project_details', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26713, 'tccc06_project_results_all', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26813, 'get_submission_url', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26859, 'appeal_percentage', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26900, 'component_color_change', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26969, 'leader_board_placement_prize', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26970, 'leader_board_pool_prize', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26971, 'rookie_board_placement_prize', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (26982, 'dr_stage_top_performers_factor', 24944);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27020, 'most_submissions_reviews', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27021, 'avg_score', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27022, 'impressive_debut', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27023, 'consecutive_winnings', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27024, 'consecutive_paid', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27025, 'consecutive_rating_increase', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27026, 'highest_rating_gains', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27191, 'dd_project_data', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27192, 'dd_project_review', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27330, 'tco07_project_results_all', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27331, 'tco07_contest_prizes', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27332, 'tco07_project_details', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27333, 'tco07_member_projects', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27559, 'dr_results', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27560, 'dr_rookie_results', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27561, 'dr_rookie_seasons', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27562, 'dr_current_rookie_season', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27567, 'dr_contest_payments', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27740, 'FulfillmentRateWeekMess', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27770, 'project_results_all', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27771, 'project_details', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27772, 'contest_prizes', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (27773, 'member_projects', 24894);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28209, 'project_payments', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28210, 'all_projects_cost', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28391, 'client_costs', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28395, 'all_projects_cost_scrubbed', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28396, 'project_payments_scrubbed', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28404, 'component_payments_in_month', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28409, 'all_projects_cost_by_date', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28489, 'dd_week_info', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28490, 'dd_week_activity', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28551, 'client__costs_by_project', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28675, 'dd_tco08_design', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28676, 'dd_tco08_development', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28760, 'dd_OperationalStatsComponents', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28799, 'client_costs_by_project_assembly', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28839, 'dr_current_track', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28840, 'dr_points_detail', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28841, 'dr_track_details', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28842, 'dr_track_list', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28843, 'drv2_results', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28844, 'dr_concurrent_track', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28849, 'dd_OperationalStatsComponents_AOL', 20447);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28889, 'client_costs_by_project_studio', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28890, 'client_costs_by_project_architecture', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (28929, 'bonus_first_dev_complete', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (29809, 'dr_track_contest_payments', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (29810, 'dr_contests_for_track', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (29811, 'dr_all_finished_tracks_list', 24782);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30459, 'direct_dashboard_enterprise_health', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30460, 'direct_dashboard_enterprise_detailed_stats', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30461, 'direct_dashboard_enterprise_detailed_stats_overall', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30609, 'direct_dashboard_enterprise_detailed_stats_project', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30610, 'direct_dashboard_enterprise_detailed_stats_client', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30611, 'direct_dashboard_enterprise_detailed_stats_billing', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30612, 'non_admin_client_billing_accounts', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30613, 'admin_client_billing_accounts', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30649, 'direct_dashboard_enterprise_contest_stats_project', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30650, 'direct_dashboard_enterprise_contest_stats_client', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30651, 'direct_dashboard_enterprise_contest_stats_billing', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30652, 'direct_dashboard_enterprise_contest_stats_overall', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30659, 'direct_dashboard_enterprise_contest_avg', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30722, 'direct_dashboard_enterprise_detailed_stats_overall_monthly', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30723, 'direct_dashboard_enterprise_detailed_stats_client_monthly', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30724, 'direct_dashboard_enterprise_detailed_stats_billing_monthly', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (30725, 'direct_dashboard_enterprise_detailed_stats_project_monthly', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31000, 'direct_dashboard_enterprise_summary', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31261, 'direct_dashboard_enterprise_volume_view', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31700, 'dashboard_participation_metrics_report', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31701, 'client_direct_project_ids', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31850, 'dashboard_jira_issues_report', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31929, 'copilot_pool_statistics', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31930, 'copilot_profile_statistics', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (31999, 'direct_dashboard_enterprise_volume_view_week', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (32019, 'client_user_stats', 24750);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (32030, 'copilots_statistics', 20449);
INSERT INTO 'informix'.command(command_id,command_desc,command_group_id) VALUES (32089, 'copilot_skills', 24750);

INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (20447, 'Data Dump');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (20449, 'Statistics');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24748, 'Placement Profiles');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24750, 'report');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24944, '** DELETED **');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24778, 'TCS Reports');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24782, 'dr');
INSERT INTO 'informix'.command_group_lu(command_group_id,command_group_name) VALUES (24894, 'tournament');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1, 'int');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1001, 'Integer Input');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1002, 'Decimal Input');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1003, 'Date Input');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (4, 'float');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (6, 'char');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (7, 'byte');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (8, 'Matrix2D');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (9, 'ArrayList');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (10, 'Enumeration');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (11, 'Hashtable');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (15, 'double');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (12, 'Vector');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (13, 'short');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (18, 'String');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (14, 'long');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (16, 'Float');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (17, 'Integer');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (19, 'boolean');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (20, 'int[]');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (21, 'double[]');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (22, 'String[]');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (23, 'String[][]');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1004, 'Sort Direction');
INSERT INTO 'informix'.data_type_lu(data_type_id,data_type_desc) VALUES (1005, 'String Input');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (20479, 'ph', 1001, 'Phase Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (8, 'sr', 1001, 'Start rank');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (9, 'er', 1001, 'End rank');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (20481, 'vr', 1001, 'Version Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (20482, 'pj', 1001, 'Project ID');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (20483, 'compid', 1001, 'Component Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24790, 'cr', 1002, 'Coder Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24791, 'rw', 1001, 'reviewer id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24792, 'scr', 1001, 'scorecard id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24793, 'scrt', 1001, 'scorecard template id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24807, 'pis', 1005, 'Set of possible phase_ids to return');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24809, 'months', 1001, 'Period of time to query over');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24813, 'days', 1001, 'Period of time to query over');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (15, 'sc', 1001, 'Sort column');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (16, 'sd', 1004, 'Sort direction');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24814, 'staid', 1002, 'Stage ID');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24815, 'seid', 1002, 'Season ID');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24930, 'ct', 1001, 'contest id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (24950, 'st', 1001, 'submission type');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25020, 'tpct', 1001, 'Top Performers Contest Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25050, 'yr', 1001, 'year');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25060, 'eid', 1002, 'Event id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25160, 'mo', 1001, 'Month');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25170, 'catn', 1005, 'Category Name');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25171, 'sdt', 1005, 'Start Date');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25172, 'edt', 1005, 'End Date');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25200, 'pt', 1002, 'Project Type Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25220, 'pts', 1005, 'Set of possible project type ids');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25230, 'pc', 1001, 'Project Category ID');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25250, 'tid', 1001, 'DR Track Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25251, 'ttid', 1001, 'DR Track Type Id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25252, 'pf', 1005, 'DR Potential Flag');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25530, 'tdpis', 1005, 'tc direct project id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25531, 'pcids', 1005, 'project category ids');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25570, 'clids', 1005, 'Client IDs');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25571, 'bpids', 1005, 'Billing account IDs');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25710, 'tcdirectid', 1005, 'topcoder direct project id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25711, 'billingaccountid', 1005, 'topcoder billing account id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25712, 'clientid', 1005, 'Topcoder client id');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25800, 'statuses', 1005, 'Project status names');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25801, 'uid', 1001, 'User ID');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25802, 'clientname', 1005, 'client name');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25840, 'jirastatuses', 1005, 'jira statuses');
INSERT INTO 'informix'.input_lu(input_id,input_code,data_type_id,input_desc) VALUES (25861, 'uids', 1005, 'user ids');

INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21617, null, 'dd_component_rating_distribution', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21627, null, 'find_projects', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21628, null, 'comp_list', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21629, null, 'reviewers_for_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21630, null, 'project_info', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21631, null, 'submissions', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (21632, null, 'has_unknwon', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26271, null, 'check_project_completed', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26272, null, 'get_review_scorecard', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26273, null, 'get_screening_scorecard', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26296, null, 'review_board_tests', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26275, null, 'scorecard_details', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26297, null, 'unit_tests', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26300, null, 'design_registrants', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26301, null, 'design_registrants_by _country', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26302, null, 'design_submitters', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26303, null, 'design_submitters_by_country', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26304, null, 'design component newbies', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26305, null, 'design component newbies that submitted', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26306, null, 'design newbies', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26307, null, 'design newbies that submitted', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26308, null, 'development registrants', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26309, null, 'development  registrants by country', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26310, null, 'development submitters', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26311, null, 'development submitters by country', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26312, null, 'development component newbies', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26313, null, 'development component newbies that submitted', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26314, null, 'development newbies', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26315, null, 'development newbies that submitted', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26490, null, 'avg_placement', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26491, null, 'component_money', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26492, null, 'high_scores', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26493, null, 'largest_comp_prize', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26494, null, 'most_reviews', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26495, null, 'most_submissions', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26496, null, 'most_wins', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26497, null, 'overall_money', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26498, null, 'royalties', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26499, null, 'tournament_money', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26500, null, 'win_percentage', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26536, null, 'fulfillment_rate', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26537, null, 'fulfillment_rate_week', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26538, null, 'reposts', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26539, null, 'new_participants_week_design', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26540, null, 'new_participants_week_dev', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26541, null, 'new_ratio', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26542, null, 'drop_off_inquire', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26543, null, 'drop_off_submit', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26544, null, 'submission_rate', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26545, null, 'cost_by_phase', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26546, null, 'cost_by_catalog', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26547, null, 'posted_components_week', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26548, null, 'posted_components_month', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26549, null, 'posted_components_year', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26593, null, 'reposts_month', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26619, null, 'fulfillment_rate_design', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26620, null, 'fulfillment_rate_dev', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26626, null, 'dr_leader_board', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26627, null, 'dr_rookie_board', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26628, null, 'dr_current_period', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26629, null, 'dr_seasons', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26630, null, 'dr_stages', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26631, null, 'competition_history', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26766, null, 'dr_leader_tie_break_placement', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26767, null, 'dr_leader_tie_break_score', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26768, null, 'dr_rookie_tie_break_placement', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26769, null, 'dr_rookie_tie_break_score', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26786, null, 'stage_outstanding_projects', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26787, null, 'season_outstanding_projects', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26788, null, 'outstanding_projects', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26937, null, 'tccc06_contest_prizes', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26938, null, 'contest_details', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26939, null, 'user_details', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26940, null, 'contest_projects', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26941, null, 'project_details', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26942, null, 'tccc06_project_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (26943, null, 'tccc06_project_results_all', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27040, null, 'get_submission_url', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27086, null, 'appeal_percentage', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27127, null, 'component_color_change', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27196, null, 'leader_board_placement_prize', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27197, null, 'leader_board_pool_prize', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27198, null, 'rookie_board_placement_prize', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27209, null, 'dr_stage_top_performers_factor', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27258, null, 'most_submissions_reviews', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27259, null, 'avg_score', 1, 1);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27260, null, 'impressive_debut', 1, 2);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27261, null, 'consecutive_winnings', 1, 2);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27262, null, 'consecutive_paid', 1, 2);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27263, null, 'consecutive_rating_increase', 1, 2);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27264, null, 'highest_rating_gains', 1, 2);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27428, null, 'dd_project_info', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27429, null, 'dd_reviewers_for_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27430, null, 'dd_submissions', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27431, null, 'dd_project_review', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27566, null, 'tco07_project_results_all', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27567, null, 'tco07_contest_prizes', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27568, null, 'tco07_project_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27786, null, 'dr_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27787, null, 'dr_rookie_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27788, null, 'dr_rookie_seasons', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27789, null, 'dr_current_rookie_season', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27795, null, 'dr_contest_payments', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27967, null, 'fulfillmentByWeek', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27996, null, 'project_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27997, null, 'contest_prizes', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (27998, null, 'project_results_all', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28436, null, 'project_payments', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28437, null, 'all_projects_cost', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28618, null, 'client_costs', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28622, null, 'all_projects_cost_scrubbed', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28623, null, 'project_payments_scrubbed', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28641, null, 'component_payments_in_month', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28642, null, 'current_month', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28643, null, 'current_year', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28627, null, 'all_projects_cost_by_date', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28726, null, 'dd_week_info', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28727, null, 'dd_week_activity', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28788, null, 'client_costs_by_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28921, null, 'dd_tco08_design', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28922, null, 'dd_tco08_development', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (28997, null, 'dd_OperationalStatsComponents', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29046, null, 'client_costs_by_project_assembly', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29086, null, 'dr_current_track', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29087, null, 'dr_points_detail', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29088, null, 'dr_track_details', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29089, null, 'dr_track_list', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29090, null, 'drv2_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29091, null, 'dr_concurrent_track', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29096, null, 'dd_OperationalStatsComponents_AOL', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29136, null, 'client_costs_by_project_studio', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29137, null, 'client_costs_by_project_architecture', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (29176, null, 'bonus_first_dev_complete', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30116, null, 'dr_all_finished_tracks_list', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30117, null, 'dr_contests_for_track', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30118, null, 'dr_track_contest_payments', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30766, null, 'direct_dashboard_enterprise_health', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30767, null, 'direct_dashboard_enterprise_detailed_stats', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30768, null, 'direct_dashboard_enterprise_detailed_stats_overall', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30946, null, 'direct_dashboard_enterprise_detailed_stats_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30956, null, 'direct_dashboard_enterprise_detailed_stats_client', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30947, null, 'direct_dashboard_enterprise_detailed_stats_billing', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30948, null, 'non_admin_client_billing_accounts', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30949, null, 'admin_client_billing_accounts', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30986, null, 'direct_dashboard_enterprise_contest_stats_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30987, null, 'direct_dashboard_enterprise_contest_stats_client', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30988, null, 'direct_dashboard_enterprise_contest_stats_billing', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30989, null, 'direct_dashboard_enterprise_contest_stats_overall', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (30990, null, 'direct_dashboard_enterprise_contest_avg', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31059, null, 'direct_dashboard_enterprise_detailed_stats_overall_monthly', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31060, null, 'direct_dashboard_enterprise_detailed_stats_client_monthly', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31061, null, 'direct_dashboard_enterprise_detailed_stats_billing_monthly', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31062, null, 'direct_dashboard_enterprise_detailed_stats_project_monthly', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31349, null, 'direct_dashboard_enterprise_summary', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (31619, null, 'direct_dashboard_enterprise_volume_view', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32036, null, 'review_results', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32106, null, 'dashboard_participation_basic_metrics', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32108, null, 'dashboard_participation_stats_aggregation_billing', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32109, null, 'dashboard_participation_stats_aggregation_project', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32110, null, 'dashboard_participation_stats_aggregation_type', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32111, null, 'dashboard_participation_stats_aggregation_status', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32112, null, 'client_direct_project_ids', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32277, null, 'dashboard_jira_issues_report', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32317, null, 'dashboard_participation_stats_aggregation_contest', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32366, null, 'copilot_profile_statistics', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32376, null, 'copilot_pool_statistics', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32446, null, 'direct_dashboard_enterprise_volume_view_week', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32466, null, 'client_user_stats', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32478, null, 'copilots_statistics', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32479, null, 'copilots_skills', 0, null);
INSERT INTO 'informix'.query(query_id,text,name,ranking,column_index) VALUES (32536, null, 'copilot_skills', 0, null);

INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21617, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21627, 'N', NULL, 20483, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21627, 'N', NULL, 20481, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21627, 'N', NULL, 20479, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21628, 'N', NULL, 25220, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21629, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21630, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21631, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (21632, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26271, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26272, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26272, 'N', NULL, 24790, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26272, 'Y', '0', 24791, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26273, NULL, NULL, 24790, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26273, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26296, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26275, NULL, NULL, 24792, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26275, NULL, NULL, 24793, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26296, 'N', NULL, 24790, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26297, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26297, 'N', NULL, 24790, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26490, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26490, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26491, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26491, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26492, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26492, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26493, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26493, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26494, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26494, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26495, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26495, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26496, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26496, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26497, 'Y', '25', 9, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26498, 'Y', '25', 9, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26499, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26499, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26500, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26500, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26536, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26537, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26539, 'Y', '180', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26540, 'Y', '180', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26541, 'Y', '180', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26546, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26545, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26619, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26544, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26620, 'Y', '3600', 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26626, 'N', NULL, 20479, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26626, 'N', NULL, 24814, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26627, 'N', NULL, 20479, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26627, 'N', NULL, 24815, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26631, 'Y', '3', 15, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26631, 'Y', 'desc', 16, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26631, 'N', NULL, 25220, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26631, 'N', NULL, 24790, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26766, 'N', NULL, 20479, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26766, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26766, 'N', NULL, 24814, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26767, 'N', NULL, 20479, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26767, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26767, 'N', NULL, 24814, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26768, 'N', NULL, 20479, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26768, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26768, 'N', NULL, 24815, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26769, 'N', NULL, 20479, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26769, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26769, 'N', NULL, 24815, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26786, NULL, NULL, 25220, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26786, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26786, 'N', NULL, 24814, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26787, NULL, NULL, 25220, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26787, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26787, 'N', NULL, 24815, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26788, NULL, NULL, 25220, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26788, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26937, NULL, NULL, 24930, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26938, NULL, NULL, 24930, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26939, NULL, NULL, 24790, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26940, NULL, NULL, 24930, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26941, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26942, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (26943, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27040, NULL, NULL, 24790, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27040, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27040, NULL, NULL, 24950, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27086, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27086, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27127, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27196, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27196, NULL, NULL, 24814, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27197, NULL, NULL, 24814, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27197, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27198, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27198, NULL, NULL, 24815, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27209, NULL, NULL, 20479, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27209, NULL, NULL, 24814, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27258, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27258, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27259, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27259, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27260, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27260, 'Y', '10', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27261, 'Y', '10', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27261, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27262, 'Y', '10', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27262, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27263, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27263, 'Y', '10', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27264, 'N', NULL, 24807, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27264, 'Y', '25', 9, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27428, 'N', NULL, 20482, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27429, 'N', NULL, 20482, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27430, 'N', NULL, 20482, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27431, 'N', NULL, 24790, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27431, 'N', NULL, 20482, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27566, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27567, NULL, NULL, 24930, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27568, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27786, 'N', NULL, 24930, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27786, 'N', NULL, 25020, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27787, 'N', NULL, 24930, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27787, 'N', NULL, 20479, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27787, 'N', NULL, 24815, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27795, 'N', NULL, 24930, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27967, 'Y', '', 25050, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27996, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27996, NULL, NULL, 25060, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27997, NULL, NULL, 24930, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27998, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (27998, NULL, NULL, 25060, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28436, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28622, 'Y', '', 25050, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28623, 'N', NULL, 20482, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28641, 'Y', '$28643', 25050, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28641, 'Y', '$28642', 25160, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28627, 'Y', 'all', 25170, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28627, 'Y', '1980-01-01', 25171, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28627, 'Y', '2200-01-01', 25172, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28726, 'N', NULL, 20479, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28921, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28922, 'N', NULL, 24790, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28997, 'Y', '1', 25230, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (28788, 'N', NULL, 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29086, NULL, NULL, 25251, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29087, NULL, NULL, 24790, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29087, NULL, NULL, 25250, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29087, NULL, NULL, 25252, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29088, NULL, NULL, 25250, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29089, NULL, NULL, 25251, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29090, NULL, NULL, 25250, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29091, NULL, NULL, 25250, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29091, NULL, NULL, 25251, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29096, 'N', NULL, 25230, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29046, 'N', NULL, 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (29176, 'N', NULL, 24813, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30117, 'N', NULL, 25250, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30118, 'N', NULL, 24930, 0);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30766, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25570, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30767, NULL, NULL, 25571, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30768, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30768, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30768, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30946, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30946, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30946, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30946, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30956, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30956, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30956, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30956, NULL, NULL, 25570, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30947, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30947, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30947, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30947, NULL, NULL, 25571, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30948, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30986, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30986, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30986, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30986, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30987, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30987, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30987, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30987, NULL, NULL, 25570, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30988, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30988, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30988, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30988, NULL, NULL, 25571, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30989, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30989, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30989, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30990, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30990, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (30990, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31059, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31059, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31059, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31060, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31060, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31060, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31060, NULL, NULL, 25570, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31061, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31061, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31061, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31061, NULL, NULL, 25571, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31062, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31062, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31062, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31062, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25530, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25570, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31349, NULL, NULL, 25571, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25710, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25711, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (31619, NULL, NULL, 25712, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32036, NULL, NULL, 20482, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25171, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25172, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25531, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25710, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25711, 5);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25712, 6);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25800, 7);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32106, NULL, NULL, 25801, 8);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25171, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25172, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25531, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25710, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25711, 5);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25712, 6);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25800, 7);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32108, NULL, NULL, 25801, 8);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25171, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25172, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25531, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25710, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25711, 5);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25712, 6);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25800, 7);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32109, NULL, NULL, 25801, 8);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25171, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25172, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25531, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25710, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25711, 5);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25712, 6);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25800, 7);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32110, NULL, NULL, 25801, 8);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25171, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25172, 2);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25531, 3);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25710, 4);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25711, 5);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25712, 6);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25800, 7);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32111, NULL, NULL, 25801, 8);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32112, NULL, NULL, 25802, 1);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25712, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25711, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25710, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25840, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32277, NULL, NULL, 25801, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25711, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25710, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25712, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25800, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32317, NULL, NULL, 25801, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32366, NULL, NULL, 25801, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25710, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25711, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25712, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25531, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25171, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32446, NULL, NULL, 25172, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32478, NULL, NULL, 25861, NULL);
INSERT INTO 'informix'.query_input_xref(query_id,optional,default_value,input_id,sort_order) VALUES (32479, NULL, NULL, 25861, NULL);

INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21485, 21617, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21495, 21629, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21495, 21631, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21495, 21630, 3);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21495, 21632, 4);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21495, 32036, 5);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21496, 21628, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (21497, 21627, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26097, 26271, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26098, 26272, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26098, 26273, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26099, 26275, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26099, 21630, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26120, 26296, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26120, 26297, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26315, 16);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26314, 15);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26313, 14);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26312, 13);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26311, 12);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26310, 11);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26309, 10);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26308, 9);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26307, 8);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26306, 7);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26305, 6);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26304, 5);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26303, 4);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26302, 3);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26301, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26123, 26300, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26287, 26490, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26288, 26491, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26289, 26492, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26290, 26493, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26291, 26494, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26292, 26495, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26293, 26496, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26294, 26497, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26295, 26498, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26296, 26499, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26297, 26500, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26333, 26536, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26334, 26537, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26335, 26538, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26336, 26539, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26336, 26540, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26337, 26541, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26339, 26542, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26339, 26543, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26340, 26544, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26341, 26545, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26342, 26546, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26343, 26547, 3);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26343, 26548, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26343, 26549, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26379, 26593, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26333, 26619, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26333, 26620, 3);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26406, 26628, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26407, 26629, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26408, 26630, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26409, 26631, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26539, 26766, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26540, 26767, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26541, 26768, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26542, 26769, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26404, 26626, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26405, 26627, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26559, 26786, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26560, 26787, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26561, 26788, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26710, 26937, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26711, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26711, 26940, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26712, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26712, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26712, 26942, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26713, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26713, 26943, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26711, 26939, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26813, 27040, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26859, 27086, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26900, 27127, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26969, 27196, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26970, 27197, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26971, 27198, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (26982, 27209, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27020, 27258, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27021, 27259, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27022, 27260, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27023, 27261, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27024, 27262, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27025, 27263, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27026, 27264, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27191, 27428, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27191, 27429, 2);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27191, 27430, 3);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27192, 27431, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27330, 27566, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27330, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27331, 27567, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27332, 27568, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27332, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27332, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27333, 26940, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27333, 26939, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27333, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27559, 27786, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27560, 27787, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27562, 27789, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27567, 27795, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27561, 27788, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27740, 27967, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27770, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27770, 27998, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27771, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27771, 26941, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27771, 27996, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27772, 27997, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27773, 26938, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27773, 26939, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (27773, 26940, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28209, 28436, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28210, 28437, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28391, 28618, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28395, 28622, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28396, 28623, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28404, 28641, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28409, 28627, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28489, 28726, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28490, 28727, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28551, 28788, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28675, 28921, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28676, 28922, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28760, 28997, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28799, 29046, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28839, 29086, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28840, 29087, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28841, 29088, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28842, 29089, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28843, 29090, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28844, 29091, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28849, 29096, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28889, 29136, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28890, 29137, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (28929, 29176, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (29811, 30116, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (29810, 30117, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (29809, 30118, 0);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30459, 30766, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30460, 30767, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30461, 30768, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30609, 30946, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30610, 30956, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30611, 30947, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30612, 30948, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30613, 30949, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30649, 30986, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30650, 30987, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30651, 30988, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30652, 30989, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30659, 30990, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30722, 31059, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30723, 31060, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30724, 31061, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (30725, 31062, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31000, 31349, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31261, 31619, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32106, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32108, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32109, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32110, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32111, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31701, 32112, 1);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31850, 32277, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31700, 32317, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31929, 32376, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31930, 32366, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (31999, 32446, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (32019, 32466, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (32030, 32478, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (32030, 32479, NULL);
INSERT INTO 'informix'.command_query_xref(command_id,query_id,sort_order) VALUES (32089, 32536, NULL);

------------------------------------------------------------------------------------------------------
------------------------- Populating Data For user_achievement_type_lu -------------------------------
------------------------------------------------------------------------------------------------------
INSERT INTO 'informix'.user_achievement_type_lu(user_achievement_type_id, user_achievement_type_desc)
	VALUES (1, "Studio Acheivements");
	
INSERT INTO 'informix'.user_achievement_type_lu(user_achievement_type_id, user_achievement_type_desc)
	VALUES (2, "Copilot Achievements");

INSERT INTO 'informix'.user_achievement_type_lu(user_achievement_type_id, user_achievement_type_desc)
	VALUES (3, "Software Achievements");
	
------------------------------------------------------------------------------------------------------
-------------------------- Populating Data For user_achievement_rule  --------------------------------
------------------------------------------------------------------------------------------------------	

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (1, 'First Forum Post', 'First forum post', 'first_forum_post.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (2, 'One Hundred Forum Posts', 'One hundred forum posts', 'one_hundred_forum_posts.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (3, 'Five Hundred Forum Posts', 'Five hundred forum posts', 'five_hundred_forum_posts.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (4, 'One Thousand Forum Posts', 'One thousand forum posts', 'one_thousand_forum_posts.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (5, 'Five Thousand Forum Posts', 'Five thousand forum posts', 'five_thousand_forum_posts.sql', 3, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (6, 'First Passing Submission', 'First passing submission', 'first_passing_submission.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (7, 'Fifty Passing Submissions', 'Fifty passing submissions', 'fifty_passing_submissions.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (8, 'One Hundred Passing Submissions', 'One hundred passing submissions', 'one_hundred_passing_submissions.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (9, 'Two Hundred And Fifty Passing Submissions', 'Two hundred and fifty passing submissions', 'two_hundred_and_fifty_passing_submissions.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (10, 'Five Hundred Passing Submissions', 'Five hundred passing submissions', 'five_hundred_passing_submissions.sql', 3, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (11, 'First Milestone Prize', 'First milestone prize', 'first_milestone_prize.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (12, 'Fifty Milestone Prize', 'Fifty milestone prize', 'fifty_milestone_prize.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (13, 'One Hundred Milestone Prize', 'One hundred milestone prize', 'one_hundred_milestone_prize.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (14, 'Two Hundred And Fifty Milestone Prize', 'Two hundred and fifty milestone prize', 'two_hundred_and_fifty_milestone_prize.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (15, 'Five Hundred Milestone Prize', 'Five hundred milestone prize', 'five_hundred_milestone_prize.sql', 3, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (16, 'First Placement', 'First placement', 'first_placement.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (17, 'Twenty Five Placements', 'Twenty five placements', 'twenty_five_placements.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (18, 'Fifty Placements', 'Fifty placements', 'fifty_placements.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (19, 'One hundred Placements', 'One hundred placements', 'one_hundred_placements.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (20, 'Two Hundred And Fifty Placements', 'Two hundred and fifty placements', 'two_hundred_and_fifty_placements.sql', 3, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (21, 'First Win', 'First win', 'first_win.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (22, 'Twenty Five First Placement Win', 'Twenty five first placement win', 'twenty_five_first_win.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (23, 'Fifty First Placement Win', 'Fifty first placement win', 'fifty_first_win.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (24, 'One Hundred First Placement Win', 'One hundred first placement win', 'one_hundred_first_win.sql', 3, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (25, 'Two Hundred And Fifty First Placement Win', 'Two hundred and fifty first placement win', 'two_hundred_and_fifty_first_win.sql', 3, 't');


---Studio
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (26, 'Studio First Forum Post', 'Studio first forum post', 'studio_first_forum_post.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (27, 'Studio One Hundred Forum Posts', 'Studio one hundred forum posts', 'studio_one_hundred_forum_posts.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (28, 'Studio Five Hundred Forum Posts', 'Studio five hundred forum posts', 'studio_five_hundred_forum_posts.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (29, 'Studio One Thousand Forum Posts', 'Studio one thousand forum posts', 'studio_one_thousand_forum_posts.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (30, 'Studio Five Thousand Forum Posts', 'Studio five thousand forum posts', 'studio_five_thousand_forum_posts.sql', 1, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (31, 'Studio First Passing Submission', 'Studio first passing submission', 'studio_first_passing_submission.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (32, 'Studio Fifty Passing Submissions', 'Studio fifty passing submissions', 'studio_fifty_passing_submissions.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (33, 'Studio One Hundred Passing Submissions', 'Studio one hundred passing submissions', 'studio_one_hundred_passing_submissions.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (34, 'Studio Two Hundred And Fifty Passing Submissions', 'Studio two hundred and fifty passing submissions', 'studio_two_hundred_and_fifty_passing_submissions.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (35, 'Studio Five Hundred Passing Submissions', 'Studio five hundred passing submissions', 'studio_five_hundred_passing_submissions.sql', 1, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (36, 'Studio First Milestone Prize', 'Studio first milestone prize', 'studio_first_milestone_prize.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (37, 'Studio Fifty Milestone Prize', 'Studio fifty milestone prize', 'studio_fifty_milestone_prize.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (38, 'Studio One Hundred Milestone Prize', 'Studio one hundred milestone prize', 'studio_one_hundred_milestone_prize.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (39, 'Studio Two Hundred And Fifty Milestone Prize', 'Studio two hundred and fifty milestone prize', 'studio_two_hundred_and_fifty_milestone_prize.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (40, 'Studio Five Hundred Milestone Prize', 'Studio five hundred milestone prize', 'studio_five_hundred_milestone_prize.sql', 1, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (41, 'Studio First Placement', 'Studio first placement', 'studio_first_placement.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (42, 'Studio Twenty Five Placements', 'Studio twenty five placements', 'studio_twenty_five_placements.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (43, 'Studio Fifty Placements', 'Studio fifty placements', 'studio_fifty_placements.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (44, 'Studio One hundred Placements', 'Studio one hundred placements', 'studio_one_hundred_placements.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (45, 'Studio Two Hundred And Fifty Placements', 'Studio two hundred and fifty placements', 'studio_two_hundred_and_fifty_placements.sql', 1, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (46, 'Studio First Win', 'Studio first win', 'studio_first_win.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (47, 'Studio Twenty Five First Placement Win', 'Studio twenty five first placement win', 'studio_twenty_five_first_win.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (48, 'Studio Fifty First Placement Win', 'Studio fifty first placement win', 'studio_fifty_first_win.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (49, 'Studio One Hundred First Placement Win', 'Studio one hundred first placement win', 'studio_one_hundred_first_win.sql', 1, 't');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (50, 'Studio Two Hundred And Fifty First Placement Win', 'Studio two hundred and fifty first placement win', 'studio_two_hundred_and_fifty_first_win.sql', 1, 't');


INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (51, 'Digital Run Winner', 'Digital run winner', 'digital_run_winner.sql', 3, 't', 'tcs_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (52, 'Digital Run Top Five', 'Digital run top five', 'digital_run_top_five.sql', 3, 't', 'tcs_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (53, 'Studio Cup Winner', 'Studio cup winner', 'studio_cup_winner.sql', 1, 't', 'tcs_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (54, 'Studio Cup Top Five', 'Studio cup top five', 'studio_cup_top_five.sql', 1, 't', 'tcs_dw');

--UI and graphic design
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (55, 'Wireframe', 'Wireframe', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (56, 'Desktop App UI', 'Desktop app UI', NULL, 2, 'f');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (57, 'Mobile UI', 'Mobile UI', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (58, 'Web UI', 'Web UI', NULL, 2, 'f');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (59, 'Branding /Marketing /Presentation', 'branding/marketing/presentation', NULL, 2, 'f');

--Implementation
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (60, 'UI Development', 'UI development', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (61, 'Architecture And Design', 'Architecture and design', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (62, 'Component Development', 'Component development', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (63, 'Assembly', 'Assembly', NULL, 2, 'f');

--Business analysis
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (64, 'Idea Generation', 'Idea generation', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (65, 'Conceptualization', 'Conceptualization', NULL, 2, 'f');

--Testing and QA
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (66, 'Test Scenarios', 'Test scenarios', NULL, 2, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (67, 'Bug Hunt', 'Bug hunt', NULL, 2, 'f');

--Analylitics
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (68, 'Big Data', 'Big data', NULL, 2, 'f');

--Special(Studio)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (69, 'TCO On-Site Competitor (Studio)', 'TCO on-site competitor', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (70, 'TCO Finalist (Studio)', 'TCO finalist', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (71, 'TCO Champion (Studio)', 'TCO champion', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (72, 'Member Of The Month (Studio)', 'Member of the month', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (73, 'TopCoder Event Trip Winner (Studio)', 'Topcoder event trip winner', NULL, 1, 'f');

--Special(Software)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (74, 'TCO On-Site Competitor (Software)', 'Topcoder event trip winner', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (75, 'TCO Finalist (Software)', 'TCO finalist', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (76, 'TCO Champion (Software)', 'Topcoder event trip winner', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (77, 'Member Of The Month (Software)', 'Topcoder event trip winner', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (78, 'TopCoder Event Trip Winner (Software)', 'Topcoder event trip winner', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (79, 'TCCC On-Site Competitor (Software)', 'TCCC on-site competitor', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (80, 'TCCC Finalist (Software)', 'TCCC finalist', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (81, 'TCCC Champion (Software)', 'TCCC champion', NULL, 3, 'f');

--Reviewing(Studio)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (82, 'Studio Spec Reviewer', 'Studio spec reviewer', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (83, 'Studio Screener', 'Studio screener', NULL, 1, 'f');
--Reviewing(Software)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (84, 'TopCoder Reviewer', 'TopCoder reviewer', NULL, 3, 'f');

--Community(Studio)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (85, 'Studio Spirit', 'Studio spirit', NULL, 1, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (86, 'Studio Mentor', 'Studio mentor', NULL, 1, 'f');

--Community(Software)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (87, 'Software Spirit', 'Software spirit', NULL, 3, 'f');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (88, 'Software Mentor', 'Software mentor', NULL, 3, 'f');

--Algo/MM Badges
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (89, 'First Rated Algorithm Competition', 'First Rated Algorithm Competition', 'first_rated_algorithm_participation.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (90, 'Five Rated Algorithm Competitions', 'Five Rated Algorithm Competitions', 'five_rated_algorithm_participation.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (91, 'Twenty Five Rated Algorithm Competitions', 'Twenty Five Rated Algorithm Competitions', 'twenty_five_rated_algorithm_participation.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (92, 'One Hundred Rated Algorithm Competitions', 'One Hundred Rated Algorithm Competitions', 'one_hundred_rated_algorithm_participation.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (93, 'Three Hundred Rated Algorithm Competitions', 'Three Hundred Rated Algorithm Competitions', 'three_hundred_rated_algorithm_participation.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (94, 'First SRM Room Win (Any Division)', 'First SRM Room Win (Any Division)', 'first_srm_room_win.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (95, 'Five SRM Room Wins (Any Division)', 'Five SRM Room Wins (Any Division)', 'five_srm_room_wins.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (96, 'Twenty SRM Room Wins (Any Division)', 'Twenty SRM Room Wins (Any Division)', 'twenty_srm_room_wins.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (97, 'Fifty SRM Room Wins (Any Division)', 'Fifty SRM Room Wins (Any Division)', 'fifty_srm_room_wins.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (98, 'One Hundred SRM Room Wins (Any Division)', 'One Hundred SRM Room Wins (Any Division)', 'one_hundred_srm_room_wins.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (99, 'First Solved Algorithm Problem', 'First Solved Algorithm Problem', 'first_srm_solved_problem.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (100, 'Ten Solved Algorithm Problems', 'Ten Solved Algorithm Problems', 'ten_srm_solved_problems.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (101, 'Fifty Solved Algorithm Problems', 'Fifty Solved Algorithm Problems', 'fifty_srm_solved_problems.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (102, 'Two Hundred Solved Algorithm Problems', 'Two Hundred Solved Algorithm Problems', 'two_hundred_srm_solved_problems.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (103, 'Five Hundred Solved Algorithm Problems', 'Five Hundred Solved Algorithm Problems', 'five_hundred_srm_solved_problems.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (104, 'First Successful Challenge', 'First Successful Challenge', 'first_successful_challenge.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (105, 'Five Successful Challenges', 'Five Successful Challenges', 'five_successful_challenges.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (106, 'Twenty Five Successful Challenges', 'Twenty Five Successful Challenges', 'twenty_five_successful_challenges.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (107, 'One Hundred Successful Challenges', 'One Hundred Successful Challenges', 'one_hundred_successful_challenges.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (108, 'Two Hundred Successful Challenges', 'Two Hundred Successful Challenges', 'two_hundred_and_fifty_successful_challenges.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (109, 'First Marathon Competition', 'First Marathon Competition', 'first_marathon_participation.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (110, 'Three Marathon Competitions', 'Three Marathon Competitions', 'three_marathon_participations.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (111, 'Ten Marathon Competitions', 'Ten Marathon Competitions', 'ten_marathon_participations.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (112, 'Twenty Marathon Competitions', 'Twenty Marathon Competitions', 'twenty_marathon_participations.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (113, 'Fifty Marathon Competitions', 'Fifty Marathon Competitions', 'fifty_marathon_participations.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (114, 'First Marathon Top-5 Placement', 'First Marathon Top-5 Placement', 'first_top5_marathon.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (115, 'Two Marathon Top-5 Placements', 'Two Marathon Top-5 Placements', 'two_top5_marathon.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (116, 'Four Marathon Top-5 Placements', 'Four Marathon Top-5 Placements', 'four_top5_marathon.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (117, 'Eight Marathon Top-5 Placements', 'Eight Marathon Top-5 Placements', 'eight_top5_marathon.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (118, 'Sixteen Marathon Top-5 Placements', 'Sixteen Marathon Top-5 Placements', 'sixteen_top5_marathon.sql', 3, 't', 'topcoder_dw');

--Special(Algo/MM)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (119, 'SRM Winner Div 1', 'SRM Winner Div 1', 'won_srm_div1.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (120, 'SRM Winner Div 2', 'SRM Winner Div 2', 'won_srm_div2.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (121, 'Marathon Match Winner', 'Marathon Match Winner', 'won_marathon.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (122, 'Algorithm Target', 'Algorithm Target', 'srm_target.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (123, 'Marathon Target', 'Marathon Target', 'marathon_target.sql', 3, 't', 'topcoder_dw');

--Skill(Algo/MM)
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (124, 'Algorithm Problem Writer', 'Algorithm Problem Writer', NULL, 3, 'f');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated) VALUES (125, 'Marathon Copilot / Problem Writer', 'Marathon Copilot / Problem Writer', NULL, 3, 'f');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (126, 'Solved Hard Div1 Problem in SRM', 'Solved Hard Div1 Problem in SRM', 'solved_div1_hard.sql', 3, 't', 'topcoder_dw');
INSERT INTO 'informix'.user_achievement_rule(user_achievement_rule_id, user_achievement_name, user_achievement_rule_desc, user_achievement_rule_sql_file, user_achievement_type_id, is_automated, db_schema) VALUES (127, 'Solved Hard Div2 Problem in SRM', 'Solved Hard Div2 Problem in SRM', 'solved_div2_hard.sql', 3, 't', 'topcoder_dw');

INSERT INTO 'informix'.log_type_lu (log_type_id, log_type_desc) values (4, 'TCS Load');
INSERT INTO 'informix'.log_type_lu (log_type_id, log_type_desc) values (5, 'Participation Metrics');
INSERT INTO 'informix'.log_type_lu (log_type_id, log_type_desc) VALUES (6, 'JIRA Load');
INSERT INTO 'informix'.log_type_lu (log_type_id, log_type_desc) VALUES (7, 'Copilot Stats');
INSERT INTO 'informix'.log_type_lu (log_type_id, log_type_desc) VALUES (8, 'Client Users Stats');





