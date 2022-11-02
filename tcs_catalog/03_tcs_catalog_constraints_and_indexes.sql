database tcs_catalog;

alter table 'informix'.autopilot_phase_changes add constraint primary key
    (project_phase_id, end_or_start)
    constraint pk_autopilot_phase_changes;

alter table 'informix'.company_size add constraint primary key
    (company_size_id)
    constraint pk_company_size;

create unique cluster index 'informix'.comp_ctgy_i1 on 'informix'.comp_categories
    (
    component_id,
    category_id
    );

alter table 'informix'.comp_categories add constraint primary key
    (comp_categories_id)
    constraint pk_comp_categories;

create unique cluster index 'informix'.comp_depend_i1 on 'informix'.comp_dependencies
    (
    comp_vers_id,
    child_comp_vers_id
    );

alter table 'informix'.comp_dependencies add constraint primary key
    (comp_dependency_id)
    constraint pk_comp_dependenci;

alter table 'informix'.comp_documentation add constraint primary key
    (document_id)
    constraint pk_comp_documentat;

alter table 'informix'.comp_download add constraint primary key
    (download_id)
    constraint pk_comp_download;

alter table 'informix'.comp_examples add constraint primary key
    (example_id)
    constraint pk_comp_examples;

create unique cluster index 'informix'.comp_keywords_i1 on 'informix'.comp_keywords
    (
    component_id,
    keyword
    );

alter table 'informix'.comp_keywords add constraint primary key
    (comp_keywords_id)
    constraint pk_comp_keywords;

alter table 'informix'.comp_reviews add constraint primary key
    (comp_reviews_id)
    constraint pk_comp_reviews;

create unique cluster index 'informix'.comp_tech_i1 on 'informix'.comp_technology
    (
    comp_vers_id,
    technology_type_id
    );

alter table 'informix'.comp_technology add constraint primary key
    (comp_tech_id)
    constraint pk_comp_technology;

alter table 'informix'.contact_type add constraint primary key
    (contact_type_id)
    constraint pk_contact_type;

alter table 'informix'.country_codes add constraint primary key
    (country_code)
    constraint pk_country_codes;

alter table 'informix'.doc_types add constraint primary key
    (document_type_id)
    constraint pk_doc_types;

create cluster index 'informix'.download_track_i2 on 'informix'.download_tracking
    (
    comp_vers_id,
    login_id
    );

alter table 'informix'.download_tracking add constraint primary key
    (download_track_id)
    constraint pk_download_tracki;

alter table 'informix'.key_generation add constraint primary key
    (user_def)
    constraint pk_key_generation;

alter table 'informix'.license_level add constraint primary key
    (license_level_id)
    constraint pk_license_level;

alter table 'informix'.phase add constraint primary key
    (phase_id)
    constraint pk_phase;

alter table 'informix'.price_tiers add constraint primary key
    (tier_id)
    constraint pk_price_tiers;

alter table 'informix'.roles add constraint primary key
    (role_id)
    constraint pk_roles;

alter table 'informix'.status add constraint primary key
    (status_id)
    constraint pk_status;

alter table 'informix'.technology_types add constraint primary key
    (technology_type_id)
    constraint pk_technology_type;

alter table 'informix'.user_contact add constraint primary key
    (user_contact_id)
    constraint pk_user_contact;

alter table 'informix'.user_member add constraint primary key
    (user_member_id)
    constraint pk_user_member;

create unique cluster index 'informix'.user_techology_i2 on 'informix'.user_technologies
    (
    technology_type_id,
    login_id
    );

alter table 'informix'.user_technologies add constraint primary key
    (user_tech_id)
    constraint pk_user_technologi;

create cluster index 'informix'.word_search_i2 on 'informix'.word_search
    (
    index_word
    );

create unique index 'informix'.word_search_i3 on 'informix'.word_search
    (
    document_id,
    index_word
    );

alter table 'informix'.word_search add constraint primary key
    (word_search_id)
    constraint pk_word_search;

create unique cluster index 'informix'.word_srch_ctgy_i2 on 'informix'.word_search_ctgy
    (
    category_id,
    document_id
    );

create index 'informix'.word_srch_ctgy_i3 on 'informix'.word_search_ctgy
    (
    document_id
    );

alter table 'informix'.word_search_ctgy add constraint primary key
    (word_srch_ctgy_id)
    constraint pk_word_search_ctg;

alter table 'informix'.word_search_doc add constraint primary key
    (document_id)
    constraint pk_word_search_doc;

alter table 'informix'.word_search_excl add constraint primary key
    (word_srch_exl_id)
    constraint pk_word_search_exc;

alter table 'informix'.command_group_lu add constraint primary key
    (command_group_id)
    constraint command_group_lu_pk;

alter table 'informix'.command add constraint primary key
    (command_id)
    constraint command_pk;

alter table 'informix'.query add constraint primary key
    (query_id)
    constraint query_pk;

create unique index 'informix'.inputlu_inputcode_idx on 'informix'.input_lu
    (
    input_code
    );

alter table 'informix'.input_lu add constraint primary key
    (input_id)
    constraint input_lu_pkey;

alter table 'informix'.query_input_xref add constraint primary key
    (query_id, input_id)
    constraint query_input_pk;

alter table 'informix'.command_query_xref add constraint primary key
    (command_id, query_id)
    constraint commandqueryxref_pk;

alter table 'informix'.tc_user_xref add constraint unique
    (tc_coder_id)
    constraint u144_151;

alter table 'informix'.tc_user_xref add constraint primary key
    (user_id)
    constraint u144_152;

create index 'informix'.compinquiry_idx1 on 'informix'.component_inquiry
    (
    component_id,
    phase,
    version
    );

create index 'informix'.compinquiry_idx2 on 'informix'.component_inquiry
    (
    user_id
    );

create index 'informix'.compinquiry_idx3 on 'informix'.component_inquiry
    (
    project_id
    );

create index 'informix'.compinquiry_idx4 on 'informix'.component_inquiry
    (
    tc_user_id
    );

alter table 'informix'.component_inquiry add constraint primary key
    (component_inquiry_id)
    constraint pk_component_inquiry_id;

create index 'informix'.compverdates_idx1 on 'informix'.comp_version_dates
    (
    status_id
    );

create index 'informix'.compverdates_idx2 on 'informix'.comp_version_dates
    (
    comp_vers_id,
    phase_id
    );

alter table 'informix'.comp_version_dates add constraint primary key
    (comp_version_dates_id)
    constraint pk_comp_version_dates_id;

alter table 'informix'.comp_level add constraint primary key
    (level_id)
    constraint pk_comp_level;

alter table 'informix'.user_master_tmp add constraint primary key
    (login_id)
    constraint pk_user_master_tmp;

alter table 'informix'.user_master add constraint primary key
    (login_id)
    constraint pk_user_master;

alter table 'informix'.comp_version_dates_history add constraint primary key
    (comp_version_dates_history_id)
    constraint pk_comp_version_dates_history_id;

alter table 'informix'.review_resp add constraint primary key
    (review_resp_id)
    constraint u159_231;

alter table 'informix'.comp_level_phase add constraint primary key
    (level_id, phase_id)
    constraint pk_comp_level_phase;

alter table 'informix'.user_component_score add constraint primary key
    (user_component_score_id)
    constraint pk_user_comp_score_id;

alter table 'informix'.user_rating add constraint primary key
    (user_id, phase_id)
    constraint pk_user_rating;

alter table 'informix'.rboard_status_lu add constraint primary key
    (status_id)
    constraint rboard_stat_lu_pk;

alter table 'informix'.contest_type_lu add constraint primary key
    (contest_type_id)
    constraint contest_type_lu_pkey;

alter table 'informix'.contest add constraint primary key
    (contest_id)
    constraint contest_pkey;

alter table 'informix'.contest_project_xref add constraint primary key
    (contest_id, project_id)
    constraint contest_project_xref_pkey;

alter table 'informix'.prize_type_lu add constraint primary key
    (prize_type_id)
    constraint prize_type_lu_pkey;

alter table 'informix'.user_contest_prize add constraint primary key
    (contest_prize_id, user_id)
    constraint user_contest_prize_pkey;

create index 'informix'.proj_result_idx1 on 'informix'.project_result
    (
    project_id
    );

alter table 'informix'.project_result add constraint primary key
    (user_id, project_id)
    constraint project_result_pkey;

alter table 'informix'.user_reliability add constraint primary key
    (user_id, phase_id)
    constraint user_reliability_pkey;

create index 'informix'.royalty_idx1 on 'informix'.royalty
    (
    user_id
    );

alter table 'informix'.user_event_xref add constraint primary key
    (user_id, event_id)
    constraint usereventxref_pkey;

alter table 'informix'.notification_mail_type_lu add constraint primary key
    (notification_mail_type_id)
    constraint notificationmailtype_pkey;

create index 'informix'.idx_event_on_notification_event on 'informix'.notification_event
    (
    event
    );

alter table 'informix'.notification_event add constraint primary key
    (notification_event_id)
    constraint notificationevent_pkey;

alter table 'informix'.user_notification_event_xref add constraint primary key
    (notification_event_id, user_id)
    constraint usernotificationeventxref_pkey;

alter table 'informix'.comp_reg_answer add constraint primary key
    (comp_reg_answer_id)
    constraint pk_comp_reg_ans809;

alter table 'informix'.question_style add constraint primary key
    (question_style_id)
    constraint question_style_pkey;

alter table 'informix'.comp_reg_question add constraint primary key
    (comp_reg_question_id)
    constraint pk_comp_reg_que516;

alter table 'informix'.project_wager add constraint primary key
    (user_id, project_id)
    constraint project_wager_pkey;

alter table 'informix'.catalog add constraint primary key
    (catalog_id)
    constraint catalog_pk;

alter table 'informix'.rboard_user add constraint primary key
    (user_id, project_type_id, catalog_id)
    constraint rboard_user_pk;

alter table 'informix'.category_catalog add constraint primary key
    (category_id)
    constraint catalog_category_xref_pk;

alter table 'informix'.specification_type add constraint primary key
    (specification_type_id)
    constraint pk_specification_type;

alter table 'informix'.specification add constraint primary key
    (specification_id)
    constraint pk_specification;

alter table 'informix'.project_type_lu add constraint primary key
    (project_type_id)
    constraint pk_project_type_lu;

ALTER TABLE 'informix'.project_catalog_lu ADD CONSTRAINT PRIMARY KEY
    (project_catalog_id)
    CONSTRAINT pk_project_catalog_lu;

alter table 'informix'.project_category_lu add constraint primary key
    (project_category_id)
    constraint pk_project_category_lu;

alter table 'informix'.scorecard_type_lu add constraint primary key
    (scorecard_type_id)
    constraint pk_scorecard_type_lu;

alter table 'informix'.scorecard_status_lu add constraint primary key
    (scorecard_status_id)
    constraint pk_scorecard_status_lu;

alter table 'informix'.scorecard add constraint primary key
    (scorecard_id)
    constraint pk_scorecard;

alter table 'informix'.scorecard_group add constraint primary key
    (scorecard_group_id)
    constraint pk_scorecard_group;

alter table 'informix'.scorecard_question_type_lu add constraint primary key
    (scorecard_question_type_id)
    constraint pk_scorecard_question_type_lu;

alter table 'informix'.scorecard_question add constraint primary key
    (scorecard_question_id)
    constraint pk_scorecard_question;

alter table 'informix'.project_status_lu add constraint primary key
    (project_status_id)
    constraint pk_project_status_lu;

alter table 'informix'.project add constraint primary key
    (project_id)
    constraint pk_project;

alter table 'informix'.project_info_type_lu add constraint primary key
    (project_info_type_id)
    constraint pk_project_info_type_lu;

alter table 'informix'.phase_status_lu add constraint primary key
    (phase_status_id)
    constraint pk_phase_status_lu;

alter table 'informix'.phase_type_lu add constraint primary key
    (phase_type_id)
    constraint pk_phase_type_lu;

alter table 'informix'.project_phase add constraint primary key
    (project_phase_id)
    constraint pk_project_phase;

alter table 'informix'.phase_dependency add constraint primary key
    (dependency_phase_id, dependent_phase_id)
    constraint pk_phase_dependency;

alter table 'informix'.phase_criteria_type_lu add constraint primary key
    (phase_criteria_type_id)
    constraint pk_phase_criteria_type_lu;

alter table 'informix'.phase_criteria add constraint primary key
    (project_phase_id, phase_criteria_type_id)
    constraint pk_phase_criteria;

alter table 'informix'.resource_role_lu add constraint primary key
    (resource_role_id)
    constraint pk_resource_role_lu;

alter table 'informix'.resource add constraint primary key
    (resource_id)
    constraint pk_resource;

create cluster index 'informix'.resource_resourcerule_idx on 'informix'.resource
    (
    resource_role_id
    );

alter table 'informix'.resource_info_type_lu add constraint primary key
    (resource_info_type_id)
    constraint pk_resource_info_type_lu;

alter table 'informix'.upload_type_lu add constraint primary key
    (upload_type_id)
    constraint pk_upload_type_lu;

alter table 'informix'.upload_status_lu add constraint primary key
    (upload_status_id)
    constraint pk_upload_status_lu;

alter table 'informix'.upload add constraint primary key
    (upload_id)
    constraint pk_upload;

alter table 'informix'.submission_status_lu add constraint primary key
    (submission_status_id)
    constraint pk_submission_status_lu;

alter table 'informix'.submission_type_lu add constraint primary key
    (submission_type_id)
    constraint pk_submission_type_lu;

alter table 'informix'.submission add constraint primary key
    (submission_id)
    constraint pk_submission;

alter table 'informix'.resource_submission add constraint primary key
    (resource_id, submission_id)
    constraint pk_resource_submission;

alter table 'informix'.comment_type_lu add constraint primary key
    (comment_type_id)
    constraint pk_comment_type_lu;

alter table 'informix'.review add constraint primary key
    (review_id)
    constraint pk_review;

alter table 'informix'.review_item add constraint primary key
    (review_item_id)
    constraint pk_review_item;

alter table 'informix'.review_comment add constraint primary key
    (review_comment_id)
    constraint pk_review_comment;

alter table 'informix'.review_item_comment add constraint primary key
    (review_item_comment_id)
    constraint pk_review_item_comment;

alter table 'informix'.deliverable_lu add constraint primary key
    (deliverable_id)
    constraint pk_deliverable_lu;

alter table 'informix'.project_audit add constraint primary key
    (project_audit_id)
    constraint pk_project_audit;

alter table 'informix'.notification_type_lu add constraint primary key
    (notification_type_id)
    constraint pk_notification_type_lu;

alter table 'informix'.notification add constraint primary key
    (project_id, external_ref_id, notification_type_id)
    constraint pk_notification;

alter table 'informix'.screening_status_lu add constraint primary key
    (screening_status_id)
    constraint pk_screening_status_lu;

alter table 'informix'.screening_task add constraint primary key
    (screening_task_id)
    constraint pk_screening_task;

alter table 'informix'.response_severity_lu add constraint primary key
    (response_severity_id)
    constraint pk_response_severity_lu;

alter table 'informix'.screening_response_lu add constraint primary key
    (screening_response_id)
    constraint pk_screening_response_lu;

alter table 'informix'.screening_result add constraint primary key
    (screening_result_id)
    constraint pk_screening_result;

alter table 'informix'.default_scorecard add constraint primary key
    (project_category_id, scorecard_type_id)
    constraint pk_default_scorecard;

alter table 'informix'.user_role add constraint primary key
    (user_role_id)
    constraint pk_user_role;

create index 'informix'.resource_info_val_idx on 'informix'.resource_info
    (
    value
    );

alter table 'informix'.resource_info add constraint primary key
    (resource_id, resource_info_type_id)
    constraint pk_resource_info;

create index 'informix'.project_info_val_idx on 'informix'.project_info
    (
    value
    );

alter table 'informix'.project_info add constraint primary key
    (project_id, project_info_type_id)
    constraint pk_project_info;

create unique cluster index 'informix'.comp_versions_i2 on 'informix'.comp_versions
    (
    component_id,
    version
    );

alter table 'informix'.comp_versions add constraint primary key
    (comp_vers_id)
    constraint pk_comp_versions;

alter table 'informix'.comp_jive_category_xref add constraint primary key
    (jive_category_id, comp_vers_id)
    constraint pk_comp_jive_xr643;

alter table 'informix'.contest_prize add constraint primary key
    (contest_prize_id)
    constraint contest_prize_pkey;

alter table 'informix'.season add constraint primary key
    (season_id)
    constraint season_id_pk;

alter table 'informix'.stage add constraint primary key
    (stage_id)
    constraint stage_id_pk;

alter table 'informix'.contest_stage_xref add constraint primary key
    (contest_id, stage_id)
    constraint contest_stage_xref_pk;

alter table 'informix'.contest_season_xref add constraint primary key
    (contest_id, season_id)
    constraint contest_season_xref_pk;

alter table 'informix'.contest_result_calculator_lu add constraint primary key
    (contest_result_calculator_id)
    constraint contest_result_calculator_lu_pk;

alter table 'informix'.scorecard_section add constraint primary key
    (scorecard_section_id)
    constraint pk_scorecard_section;

alter table 'informix'.member_ban add constraint primary key
    (ban_id)
    constraint pk_member_ban_ban_id;

alter table 'informix'.message add constraint primary key
    (message_id)
    constraint pk_message_message_id;

alter table 'informix'.message_to_handle add constraint primary key
    (message_id, to_handle)
    constraint pk_message_to_handle;

alter table 'informix'.status_assignment add constraint primary key
    (status_assignment_id)
    constraint pk_status_assignment_status_assignment_id;

alter table 'informix'.offer add constraint primary key
    (offer_id)
    constraint pk_offer_offer_id;

alter table 'informix'.team_header add constraint primary key
    (team_id)
    constraint pk_team_header_team_id;

alter table 'informix'.team_properties add constraint primary key
    (team_id, key)
    constraint pk_team_properties;

alter table 'informix'.team_position add constraint primary key
    (position_id)
    constraint pk_team_position;

alter table 'informix'.team_position_properties add constraint primary key
    (position_id, key)
    constraint pk_team_position_properties;

alter table 'informix'.team_manager_audit add constraint primary key
    (team_manager_audit_id)
    constraint pk_team_manager_audit;

alter table 'informix'.team_manager_audit_details add constraint primary key
    (team_manager_audit_id, name)
    constraint pk_team_manager_audit_details;

alter table 'informix'.team_manager_audit_custom_details add constraint primary key
    (team_manager_audit_id, name)
    constraint pk_team_manager_audit_custom_details;

alter table 'informix'.facade_audit add constraint primary key
    (create_date, create_user)
    constraint pk_facade_audit;

create index 'informix'.comp_catalog_root_cat_id_idx on 'informix'.comp_catalog
    (
    root_category_id
    );

alter table 'informix'.comp_catalog add constraint primary key
    (component_id)
    constraint pk_comp_catalog;

alter table 'informix'.framework add constraint primary key
    (framework_id)
    constraint pk_framework1;

alter table 'informix'.widget add constraint primary key
    (widget_id)
    constraint pk_widget1;

alter table 'informix'.widget_version add constraint primary key
    (widget_version_id)
    constraint pk_widgetversio310;

alter table 'informix'.widget_version add constraint unique
    (widget_id, version_major, version_minor, version_increment, version_build)
    constraint u376_1513;

alter table 'informix'.dr_points add constraint primary key
    (dr_points_id)
    constraint pk_dr_points;

alter table 'informix'.dr_points_operation_lu add constraint primary key
    (dr_points_operation_id)
    constraint pk_dr_points_operation_lu;

alter table 'informix'.dr_points_reference_type_lu add constraint primary key
    (dr_points_reference_type_id)
    constraint pk_dr_points_reference_type_lu;

alter table 'informix'.dr_points_type_lu add constraint primary key
    (dr_points_type_id)
    constraint pk_dr_points_type_lu;

alter table 'informix'.dr_points_status_lu add constraint primary key
    (dr_points_status_id)
    constraint pk_dr_points_status_lu;

alter table 'informix'.points_calculator_lu add constraint primary key
    (points_calculator_id)
    constraint pk_points_calculator_lu;

alter table 'informix'.track add constraint primary key
    (track_id)
    constraint pk_track;

alter table 'informix'.track_contest add constraint primary key
    (track_contest_id)
    constraint pk_track_contest;

alter table 'informix'.track_contest_result_calculator_lu add constraint primary key
    (track_contest_result_calculator_id)
    constraint pk_track_contest_result_calculator_lu;

alter table 'informix'.track_contest_type_lu add constraint primary key
    (track_contest_type_id)
    constraint pk_track_contest_type_lu;

alter table 'informix'.track_project_category_xref add constraint primary key
    (track_id, project_category_id)
    constraint pk_track_project_category_xref;

alter table 'informix'.track_type_lu add constraint primary key
    (track_type_id)
    constraint pk_track_type_lu;

alter table 'informix'.track_status_lu add constraint primary key
    (track_status_id)
    constraint pk_track_status_lu;

alter table 'informix'.categories add constraint primary key
    (category_id)
    constraint pk_categories;

alter table 'informix'.comp_client add constraint primary key
    (component_id, client_id)
    constraint comp_client_pk;

alter table 'informix'.comp_user add constraint primary key
    (component_id, user_id)
    constraint comp_user_pk;

alter table 'informix'.third_party_library add constraint primary key
     (third_party_library_id)
     constraint third_party_library_pk;

alter table 'informix'.client_billing_config_type_lu add constraint primary key
(client_billing_config_type_id )
constraint pk_client_billing_config_type_lu;

alter table 'informix'.client_billing_config add constraint primary key
(client_billing_id, client_billing_config_type_id)
constraint pk_client_billing_config;


alter table 'informix'.copilot_profile add constraint primary key
  (copilot_profile_id)
  constraint pk_copilot_profile;

alter table 'informix'.copilot_profile_status add constraint primary key
  (copilot_profile_status_id)
  constraint pk_copilot_profile_status;

alter table 'informix'.copilot_profile_info add constraint primary key
  (copilot_profile_info_id)
  constraint pk_copilot_profile_info;

alter table 'informix'.copilot_profile_info_type add constraint primary key
  (copilot_profile_info_type_id)
  constraint pk_copilot_profile_info_type;

alter table 'informix'.late_deliverable_type_lu add constraint primary key
  (late_deliverable_type_id)
  constraint pk_late_deliverable_type_lu;

alter table 'informix'.late_deliverable add constraint primary key
  (late_deliverable_id)
  constraint pk_late_deliverable;

alter table 'informix'.review_feedback add constraint primary key
  (review_feedback_id)
  constraint pk_review_feedback;

alter table 'informix'.review_feedback_detail add constraint primary key
  (review_feedback_id, reviewer_user_id)
  constraint pk_review_feedback_detail;

alter table 'informix'.project_reliability add constraint primary key
    (project_id, user_id)
    constraint pk_project_reliability;

alter table 'informix'.file_type_lu add constraint primary key
    (file_type_id)
    constraint pk_file_type_lu;

alter table 'informix'.prize add constraint primary key
    (prize_id)
    constraint pk_prize;

alter table 'informix'.project_studio_specification add constraint primary key
    (project_studio_spec_id)
    constraint pk_project_studio_spec;

alter table 'informix'.project_mm_specification add constraint primary key
    (project_mm_spec_id)
    constraint pk_project_mm_spec;

alter table 'informix'.project_file_type_xref add constraint primary key
    (project_id, file_type_id)
    constraint pk_project_file_type_xref;

alter table 'informix'.mime_type_lu add constraint primary key
    (mime_type_id)
    constraint pk_mime_type_lu;


alter table 'informix'.project_copilot_type_lu add constraint primary key
  (project_copilot_type_id)
  constraint project_copilot_type_lu_pk;

alter table 'informix'.project_copilot_type add constraint primary key
  (project_id, project_copilot_type_id)
  constraint project_copilot_type_pk;

alter table 'informix'.copilot_contest_extra_info_type add constraint primary key
  (copilot_contest_extra_info_type_id)
  constraint pk_copilot_contest_extra_info_type;

alter table 'informix'.copilot_contest_extra_info add constraint primary key
  (copilot_posting_contest_id, copilot_contest_extra_info_type_id)
  constraint pk_copilot_contest_extra_info;

alter table 'informix'.project_milestone add constraint primary key
    (project_milestone_id)
    constraint project_milestone_pk;

alter table 'informix'.project_milestone_owner add constraint primary key
    (project_milestone_owner_id)
    constraint project_milestone_owner_pk;

alter table 'informix'.comp_milestone_feedback add constraint primary key
	(comp_milestone_feedback_id)
	constraint pk_comp_milestone_feedback_id;

ALTER TABLE 'informix'.customer_group
	ADD CONSTRAINT PRIMARY KEY (group_id)
	CONSTRAINT pk_security_group;

ALTER TABLE 'informix'.group_associated_billing_accounts
	ADD CONSTRAINT PRIMARY KEY(group_id, billing_account_id)
	CONSTRAINT pk_group_associated_billing_accounts;

ALTER TABLE 'informix'.group_associated_direct_projects
	ADD CONSTRAINT PRIMARY KEY(group_direct_project_id)
	CONSTRAINT pk_group_associated_direct_projects;

ALTER TABLE 'informix'.customer_administrator
	ADD CONSTRAINT PRIMARY KEY(customer_administrator_id)
	CONSTRAINT pk_customer_administrator;

ALTER TABLE 'informix'.group_member ADD CONSTRAINT PRIMARY KEY(group_member_id)
	CONSTRAINT pk_group_member;

ALTER TABLE 'informix'.group_invitation ADD CONSTRAINT PRIMARY KEY(group_invitation_id)
	CONSTRAINT pk_group_invitation;

ALTER TABLE 'informix'.group_audit_record ADD CONSTRAINT PRIMARY KEY(id)
	CONSTRAINT pk_group_audit_record;


alter table 'informix'.review_auction_category_lu add constraint primary key
    (review_auction_category_id)
    constraint review_auction_category_lu_pk;

alter table 'informix'.review_auction_type_lu add constraint primary key
    (review_auction_type_id)
    constraint review_auction_type_lu_pk;

alter table 'informix'.review_application_role_lu add constraint primary key
    (review_application_role_id)
    constraint review_application_role_lu_pk;

alter table 'informix'.review_application_role_resource_role_xref add constraint primary key
    (review_application_role_id, resource_role_id)
    constraint review_application_role_resource_role_xref_pk;

alter table 'informix'.review_application_status_lu add constraint primary key
    (review_application_status_id)
    constraint review_application_status_lu_pk;

alter table 'informix'.review_auction add constraint primary key
    (review_auction_id)
    constraint review_auction_pk;

alter table 'informix'.review_application add constraint primary key
    (review_application_id)
    constraint review_application_pk;

alter table 'informix'.project_payment_type_lu add constraint primary key
    (project_payment_type_id)
    constraint project_payment_type_lu_pk;

alter table 'informix'.project_payment add constraint primary key
    (project_payment_id)
    constraint project_payment_pk;

alter table 'informix'.project_payment_adjustment add constraint primary key
    (project_id, resource_role_id)
    constraint project_payment_adjustment_pk;

alter table 'informix'.default_project_payment add constraint primary key
    (project_category_id, resource_role_id)
    constraint default_project_payment_pk;

alter table 'informix'.reviewer_rating add constraint primary key
    (project_id, user_id)
    constraint reviewer_rating_pk;

alter table 'informix'.collaborating_members add constraint primary key
    (collaborating_group_id, user_id)
    constraint pk_collaborating_members;

alter table direct_project_task_list add constraint primary key
	(direct_project_task_list_id)
	constraint pk_direct_project_task_list;




alter table direct_project_task_list_permitted_user add constraint primary key
	(direct_project_task_list_id, user_id)
	constraint pk_direct_project_task_list_permitted_user;



alter table direct_project_task_status add constraint primary key
	(direct_project_task_status_id)
	constraint pk_direct_project_task_status_id;



alter table direct_project_task_priority add constraint primary key
	(direct_project_task_priority_id)
	constraint pk_direct_project_task_priority;


alter table direct_project_task add constraint primary key
	(direct_project_task_id)
	constraint pk_direct_project_task;

alter table direct_project_task_attachment add constraint primary key
	(direct_project_task_attachment_id)
	constraint pk_direct_project_task_attachment;

alter table direct_project_task_contest_xref add constraint primary key
	(direct_project_task_id, project_id)
	constraint pk_direct_project_task_contest_xref;



alter table direct_project_task_assignee add constraint primary key
	(direct_project_task_id, user_id)
	constraint pk_direct_project_task_assignee;




alter table direct_project_task_milestone_xref add constraint primary key
	(direct_project_task_id, project_milestone_id)
	constraint pk_direct_project_task_milestone_xref;




alter table direct_project_task_list_contest_xref add constraint primary key
	(direct_project_task_list_id, project_id)
	constraint pk_direct_project_task_list_contest_xref;


alter table direct_project_task_list_milestone_xref add constraint primary key
	(direct_project_task_list_id, project_milestone_id)
	constraint pk_direct_project_task_list_milestone_xref;

alter table 'informix'.contest_milestone_xref add constraint primary key
    (contest_id, project_milestone_id)
    constraint pk_contest_milestone_xref;

alter table 'informix'.project_sub_category_lu add constraint primary key
    (project_sub_category_id)
    constraint project_sub_category_pk;

alter table 'informix'.platform_lu add constraint primary key
    (platform_id)
    constraint platform_lu_pk;

alter table 'informix'.user_recent_item_type add constraint primary key
    (recent_item_type_id)
    constraint user_recent_item_type_pk;

alter table 'informix'.user_recent_item add constraint primary key
    (user_recent_item_id)
    constraint user_recent_item_pk;

ALTER TABLE 'informix'.user_recent_item
   ADD CONSTRAINT UNIQUE (user_id, item_id, recent_item_type_id) CONSTRAINT u_user_recent_item;

alter table 'informix'.project_platform_lu add constraint primary key
    (project_platform_id)
    constraint pk_project_platform_lu;

alter table 'informix'.project_platform add constraint primary key
    (project_id, project_platform_id)
    constraint pk_project_platform;

alter table 'informix'.comp_categories add constraint foreign key
    (category_id)
    references 'informix'.categories
    (category_id)
    constraint fk_comp_ctgy1;

alter table 'informix'.comp_categories add constraint foreign key
    (component_id)
    references 'informix'.comp_catalog
    (component_id)
    constraint fk_comp_ctgy2;

alter table 'informix'.comp_dependencies add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_depend1;

alter table 'informix'.comp_dependencies add constraint foreign key
    (child_comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_depend2;

alter table 'informix'.comp_documentation add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_doc1;

alter table 'informix'.comp_documentation add constraint foreign key
    (document_type_id)
    references 'informix'.doc_types
    (document_type_id)
    constraint fk_comp_doc_ref2;

alter table 'informix'.comp_download add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint comp_download_fk1;

alter table 'informix'.comp_examples add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_example;

alter table 'informix'.comp_keywords add constraint foreign key
    (component_id)
    references 'informix'.comp_catalog
    (component_id)
    constraint fk_comp_keyword;

alter table 'informix'.comp_reviews add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_com_review1;

alter table 'informix'.comp_technology add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_tech1;

alter table 'informix'.comp_technology add constraint foreign key
    (technology_type_id)
    references 'informix'.technology_types
    (technology_type_id)
    constraint fk_comp_tech2;

alter table 'informix'.contact_type add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_contact_status;

alter table 'informix'.doc_types add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_doc_status;

alter table 'informix'.download_tracking add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint download_track_fk1;

alter table 'informix'.download_tracking add constraint foreign key
    (license_level_id)
    references 'informix'.license_level
    (license_level_id)
    constraint download_track_fk3;

alter table 'informix'.download_tracking add constraint foreign key
    (download_id)
    references 'informix'.comp_download
    (download_id)
    constraint download_track_fk4;

alter table 'informix'.license_level add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint license_level_fk1;

alter table 'informix'.roles add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_role_status;

alter table 'informix'.technology_types add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_tech_status;

alter table 'informix'.user_contact add constraint foreign key
    (contact_type_id)
    references 'informix'.contact_type
    (contact_type_id)
    constraint fk_user_cont_info2;

alter table 'informix'.user_technologies add constraint foreign key
    (technology_type_id)
    references 'informix'.technology_types
    (technology_type_id)
    constraint fk_user_tech1;

alter table 'informix'.command add constraint foreign key
    (command_group_id)
    references 'informix'.command_group_lu
    (command_group_id)
    constraint command_command_group_fk;

alter table 'informix'.contest add constraint foreign key
    (contest_result_calculator_id)
    references 'informix'.contest_result_calculator_lu
    (contest_result_calculator_id)
    constraint contest_contest_result_calculator_id_fk;

alter table 'informix'.contest add constraint foreign key
    (contest_type_id)
    references 'informix'.contest_type_lu
    (contest_type_id)
    constraint contest_contesttypelu_fk;

alter table 'informix'.contest_project_xref add constraint foreign key
    (contest_id)
    references 'informix'.contest
    (contest_id)
    constraint contestprojectxref_contest_fk;

alter table 'informix'.user_reliability add constraint foreign key
    (phase_id)
    references 'informix'.phase
    (phase_id)
    constraint userreliability_phase_fk;

alter table 'informix'.notification_event add constraint foreign key
    (notification_mail_type_id)
    references 'informix'.notification_mail_type_lu
    (notification_mail_type_id)
    constraint notificationevent_notificationmailtype_fk;

alter table 'informix'.user_notification_event_xref add constraint foreign key
    (notification_event_id)
    references 'informix'.notification_event
    (notification_event_id)
    constraint usernotificationevent_notificationevent_fk;

alter table 'informix'.comp_reg_answer add constraint foreign key
    (comp_reg_question_id)
    references 'informix'.comp_reg_question
    (comp_reg_question_id)
    constraint compreganswer_compregquestion_fk;

alter table 'informix'.question_style add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint questionstyle_status_fk;

alter table 'informix'.comp_reg_question add constraint foreign key
    (question_style_id)
    references 'informix'.question_style
    (question_style_id)
    constraint compregquestion_questionstyle_fk;

alter table 'informix'.rboard_user add constraint foreign key
    (status_id)
    references 'informix'.rboard_status_lu
    (status_id)
    constraint rboard_user_status_fk;

alter table 'informix'.rboard_user add constraint foreign key
    (catalog_id)
    references 'informix'.catalog
    (catalog_id)
    constraint rboard_user_catalog_fk;

alter table 'informix'.category_catalog add constraint foreign key
    (catalog_id)
    references 'informix'.catalog
    (catalog_id)
    constraint category_catalog_catalog_fk;

alter table 'informix'.category_catalog add constraint foreign key
    (category_id)
    references 'informix'.categories
    (category_id)
    constraint category_catalog_category_fk;

alter table 'informix'.specification add constraint foreign key
    (specification_type_id)
    references 'informix'.specification_type
    (specification_type_id)
    constraint fk_specification_type;

alter table 'informix'.command_execution add constraint foreign key
    (command_id)
    references 'informix'.command
    (command_id)
    constraint commandexecution_command_fk;

alter table 'informix'.project_category_lu add constraint foreign key
    (project_type_id)
    references 'informix'.project_type_lu
    (project_type_id)
    constraint fk_projectcategorylu_projecttypelu_projecttypeid;

alter table 'informix'.scorecard add constraint foreign key
    (scorecard_type_id)
    references 'informix'.scorecard_type_lu
    (scorecard_type_id)
    constraint fk_scorecard_scorecardtypelu_scorecardtypeid;

alter table 'informix'.scorecard add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint fk_scorecard_projectcategorylu_projectcategoryid;

alter table 'informix'.scorecard add constraint foreign key
    (scorecard_status_id)
    references 'informix'.scorecard_status_lu
    (scorecard_status_id)
    constraint fk_scorecard_scorecardstatuslu_scorecardstatusid;

alter table 'informix'.scorecard_group add constraint foreign key
    (scorecard_id)
    references 'informix'.scorecard
    (scorecard_id)
    constraint fk_scorecardgroup_scorecard_scorecardid;

alter table 'informix'.scorecard_question add constraint foreign key
    (scorecard_section_id)
    references 'informix'.scorecard_section
    (scorecard_section_id)
    constraint fk_scorecardquestion_scorecardsection_scorecardsectionid;

alter table 'informix'.scorecard_question add constraint foreign key
    (scorecard_question_type_id)
    references 'informix'.scorecard_question_type_lu
    (scorecard_question_type_id)
    constraint fk_scorecardquestion_scorecardquestiontypelu_scorecardquestiontypeid;

alter table 'informix'.project add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint fk_project_projectcategorylu_projectcategoryid;

alter table 'informix'.project add constraint foreign key
    (project_status_id)
    references 'informix'.project_status_lu
    (project_status_id)
    constraint fk_project_projectstatuslu_projectstatusid;

alter table 'informix'.project_phase add constraint foreign key
    (phase_type_id)
    references 'informix'.phase_type_lu
    (phase_type_id)
    constraint fk_projectphase_phasetypelu_phasetypeid;

alter table 'informix'.project_phase add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_projectphase_project_projectid;

alter table 'informix'.project_phase add constraint foreign key
    (phase_status_id)
    references 'informix'.phase_status_lu
    (phase_status_id)
    constraint fk_projectphase_phasestatuslu_phasestatusid;

alter table 'informix'.phase_dependency add constraint foreign key
    (dependency_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_phasedependency_projectphase_dependencyphaseid;

alter table 'informix'.phase_dependency add constraint foreign key
    (dependent_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_phasedependency_projectphase_dependentphaseid;

alter table 'informix'.phase_criteria add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_phasecriteria_projectphase_projectphaseid;

alter table 'informix'.phase_criteria add constraint foreign key
    (phase_criteria_type_id)
    references 'informix'.phase_criteria_type_lu
    (phase_criteria_type_id)
    constraint fk_phasecriteria_phasecriteriatypelu_phasecriteriatypeid;

alter table 'informix'.resource_role_lu add constraint foreign key
    (phase_type_id)
    references 'informix'.phase_type_lu
    (phase_type_id)
    constraint fk_resourcerolelu_phasetypelu_phasetypeid;

alter table 'informix'.resource add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_resource_project_projectid;

alter table 'informix'.resource add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint fk_resource_resourcerolelu_resourceroleid;

alter table 'informix'.resource add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_resource_projectphase_projectphaseid;

alter table 'informix'.review_resp add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint fk_reviewresp_resourcerolelu_resourceroleid;

alter table 'informix'.upload add constraint foreign key
    (upload_type_id)
    references 'informix'.upload_type_lu
    (upload_type_id)
    constraint fk_upload_uploadtypelu_uploadtypeid;

alter table 'informix'.upload add constraint foreign key
    (upload_status_id)
    references 'informix'.upload_status_lu
    (upload_status_id)
    constraint fk_upload_uploadstatuslu_uploadstatusid;

alter table 'informix'.upload add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_upload_resource_resourceid;

alter table 'informix'.upload add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_upload_project_projectid;

alter table 'informix'.upload add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_upload_projectphase_projectphaseid;

alter table 'informix'.submission add constraint foreign key
    (submission_status_id)
    references 'informix'.submission_status_lu
    (submission_status_id)
    constraint fk_submission_submissionstatuslu_submissionstatusid;

alter table 'informix'.submission add constraint foreign key
        (submission_type_id)
    references 'informix'.submission_type_lu
    (submission_type_id)
    constraint fk_submission_submissiontypelu_submissiontypeid;

alter table 'informix'.submission add constraint foreign key
    (upload_id)
    references 'informix'.upload
    (upload_id)
    constraint fk_submission_upload_uploadid;

alter table 'informix'.resource_submission add constraint foreign key
    (submission_id)
    references 'informix'.submission
    (submission_id)
    constraint fk_resourcesubmission_submission_submissionid;

alter table 'informix'.resource_submission add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_resourcesubmission_resource_resourceid;

alter table 'informix'.review add constraint foreign key
    (scorecard_id)
    references 'informix'.scorecard
    (scorecard_id)
    constraint fk_review_scorecard_scorecardid;

alter table 'informix'.review add constraint foreign key
    (submission_id)
    references 'informix'.submission
    (submission_id)
    constraint fk_review_submission_submissionid;

alter table 'informix'.review add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_review_resource_resourceid;

alter table 'informix'.review add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint fk_review_projectphase_projectphaseid;

alter table 'informix'.review_item add constraint foreign key
    (review_id)
    references 'informix'.review
    (review_id)
    constraint fk_reviewitem_review_reviewid;

alter table 'informix'.review_item add constraint foreign key
    (scorecard_question_id)
    references 'informix'.scorecard_question
    (scorecard_question_id)
    constraint fk_reviewitem_scorecardquestion_scorecardquestionid;

alter table 'informix'.review_item add constraint foreign key
    (upload_id)
    references 'informix'.upload
    (upload_id)
    constraint fk_reviewitem_upload_uploadid;

alter table 'informix'.review_comment add constraint foreign key
    (review_id)
    references 'informix'.review
    (review_id)
    constraint fk_reviewcomment_review_reviewid;

alter table 'informix'.review_comment add constraint foreign key
    (comment_type_id)
    references 'informix'.comment_type_lu
    (comment_type_id)
    constraint fk_reviewcomment_commenttypelu_commenttypeid;

alter table 'informix'.review_comment add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_reviewcomment_resource_resourceid;

alter table 'informix'.review_item_comment add constraint foreign key
    (review_item_id)
    references 'informix'.review_item
    (review_item_id)
    constraint fk_reviewitemcomment_reviewitem_reviewitemid;

alter table 'informix'.review_item_comment add constraint foreign key
    (comment_type_id)
    references 'informix'.comment_type_lu
    (comment_type_id)
    constraint fk_reviewitemcomment_commenttypelu_commenttypeid;

alter table 'informix'.review_item_comment add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_reviewitemcomment_resource_resourceid;

alter table 'informix'.deliverable_lu add constraint foreign key
    (phase_type_id)
    references 'informix'.phase_type_lu
    (phase_type_id)
    constraint fk_deliverablelu_phasetypelu_phasetypeid;

alter table 'informix'.deliverable_lu add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint fk_deliverablelu_resourcerolelu_resourceroleid;

alter table 'informix'.deliverable_lu add constraint foreign key
        (submission_type_id)
    references 'informix'.submission_type_lu
    (submission_type_id)
    constraint fk_deliverablelu_submissiontypelu_submissiontypeid;

alter table 'informix'.project_audit add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_projectaudit_project_projectid;

alter table 'informix'.notification add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_notification_project_projectid;

alter table 'informix'.notification add constraint foreign key
    (notification_type_id)
    references 'informix'.notification_type_lu
    (notification_type_id)
    constraint fk_notification_notificationtypelu_notificationtypeid;

alter table 'informix'.screening_task add constraint foreign key
    (upload_id)
    references 'informix'.upload
    (upload_id)
    constraint fk_screeningtask_upload_uploadid;

alter table 'informix'.screening_task add constraint foreign key
    (screening_status_id)
    references 'informix'.screening_status_lu
    (screening_status_id)
    constraint fk_screeningtask_screeningstatuslu_screeningstatusid;

alter table 'informix'.screening_response_lu add constraint foreign key
    (response_severity_id)
    references 'informix'.response_severity_lu
    (response_severity_id)
    constraint fk_screeningresponselu_responseseveritylu_responseseverityid;

alter table 'informix'.screening_result add constraint foreign key
    (screening_task_id)
    references 'informix'.screening_task
    (screening_task_id)
    constraint fk_screeningresult_screeningtask_screeningtaskid;

alter table 'informix'.screening_result add constraint foreign key
    (screening_response_id)
    references 'informix'.screening_response_lu
    (screening_response_id)
    constraint fk_screeningresult_screeingresponselu_screeningresponseid;

alter table 'informix'.default_scorecard add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint fk_defaultscorecard_projectcategorylu_projectcategoryid;

alter table 'informix'.default_scorecard add constraint foreign key
    (scorecard_type_id)
    references 'informix'.scorecard_type_lu
    (scorecard_type_id)
    constraint fk_defaultscorecard_scorecardtypelu_scorecardtypeid;

alter table 'informix'.default_scorecard add constraint foreign key
    (scorecard_id)
    references 'informix'.scorecard
    (scorecard_id)
    constraint fk_defaultscorecard_scorecard_scorecardid;

alter table 'informix'.user_role add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_user_role2;

alter table 'informix'.user_role add constraint foreign key
    (role_id)
    references 'informix'.roles
    (role_id)
    constraint fk_user_role3;

alter table 'informix'.resource_info add constraint foreign key
    (resource_info_type_id)
    references 'informix'.resource_info_type_lu
    (resource_info_type_id)
    constraint fk_resourceinfo_resourceinfotypelu_resourceinfotypeid;

alter table 'informix'.resource_info add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_resourceinfo_resource_resourceid;

alter table 'informix'.project_info add constraint foreign key
    (project_info_type_id)
    references 'informix'.project_info_type_lu
    (project_info_type_id)
    constraint fk_projectinfo_projectinfotypelu_projectinfotypeid;

alter table 'informix'.project_info add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_projectinfo_project_projectid;

alter table 'informix'.comp_versions add constraint foreign key
    (component_id)
    references 'informix'.comp_catalog
    (component_id)
    constraint fk_comp_versions;

alter table 'informix'.comp_versions add constraint foreign key
    (phase_id)
    references 'informix'.phase
    (phase_id)
    constraint fk_comp_phase;

alter table 'informix'.comp_jive_category_xref add constraint foreign key
    (comp_vers_id)
    references 'informix'.comp_versions
    (comp_vers_id)
    constraint fk_comp_jive_ca109;

alter table 'informix'.season add constraint foreign key
    (next_rookie_season_id)
    references 'informix'.season
    (season_id)
    constraint next_rookie_season_id_fk;

alter table 'informix'.stage add constraint foreign key
    (season_id)
    references 'informix'.season
    (season_id)
    constraint stage_season_id_fk;

alter table 'informix'.contest_stage_xref add constraint foreign key
    (stage_id)
    references 'informix'.stage
    (stage_id)
    constraint contest_stage_stage_id_fk;

alter table 'informix'.contest_stage_xref add constraint foreign key
    (contest_id)
    references 'informix'.contest
    (contest_id)
    constraint contest_stage_contest_id_fk;

alter table 'informix'.contest_season_xref add constraint foreign key
    (season_id)
    references 'informix'.season
    (season_id)
    constraint contest_season_season_id_fk;

alter table 'informix'.contest_season_xref add constraint foreign key
    (contest_id)
    references 'informix'.contest
    (contest_id)
    constraint contest_season_contest_id_fk;

alter table 'informix'.scorecard_section add constraint foreign key
    (scorecard_group_id)
    references 'informix'.scorecard_group
    (scorecard_group_id)
    constraint fk_scorecardsection_scorecardgroup_scorecardgroupid;

alter table 'informix'.message_to_handle add constraint foreign key
    (message_id)
    references 'informix'.message
    (message_id)
    constraint fk_message_to_handle_message_id;

alter table 'informix'.offer add constraint foreign key
    (current_status_assignment_id)
    references 'informix'.status_assignment
    (status_assignment_id)
    constraint fk_offer_team_status_assignment_id;

alter table 'informix'.team_header add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_team_header_project_id;

alter table 'informix'.team_header add constraint foreign key
    (captain_resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_team_header_captain_resource_id;

alter table 'informix'.team_properties add constraint foreign key
    (team_id)
    references 'informix'.team_header
    (team_id)
    constraint fk_team_properties_team_id;

alter table 'informix'.team_position add constraint foreign key
    (team_id)
    references 'informix'.team_header
    (team_id)
    constraint fk_team_position_team_id;

alter table 'informix'.team_position add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint fk_team_position_resource_id;

alter table 'informix'.team_position_properties add constraint foreign key
    (position_id)
    references 'informix'.team_position
    (position_id)
    constraint fk_team_position_properties_team_position_id;

alter table 'informix'.team_manager_audit_details add constraint foreign key
    (team_manager_audit_id)
    references 'informix'.team_manager_audit
    (team_manager_audit_id)
    constraint fk_team_manager_audit_details_team_manager_audit_id;

alter table 'informix'.team_manager_audit_custom_details add constraint foreign key
    (team_manager_audit_id)
    references 'informix'.team_manager_audit
    (team_manager_audit_id)
    constraint fk_team_manager_audit_custom_details_team_manager_audit_id;

alter table 'informix'.comp_catalog add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_comp_status;

alter table 'informix'.widget add constraint foreign key
    (framework_id)
    references 'informix'.framework
    (framework_id)
    constraint fk_widget_framework;

alter table 'informix'.widget_version add constraint foreign key
    (widget_id)
    references 'informix'.widget
    (widget_id)
    constraint fk_widgetversion_widget;

alter table 'informix'.dr_points add constraint foreign key
    (track_id)
    references 'informix'.track
    (track_id)
    constraint dr_points_fkindex1;

alter table 'informix'.dr_points add constraint foreign key
    (dr_points_type_id)
    references 'informix'.dr_points_type_lu
    (dr_points_type_id)
    constraint dr_points_fkindex2;

alter table 'informix'.dr_points add constraint foreign key
    (dr_points_operation_id)
    references 'informix'.dr_points_operation_lu
    (dr_points_operation_id)
    constraint dr_points_fkindex3;

alter table 'informix'.dr_points add constraint foreign key
    (dr_points_reference_type_id)
    references 'informix'.dr_points_reference_type_lu
    (dr_points_reference_type_id)
    constraint dr_points_fkindex4;

alter table 'informix'.dr_points add constraint foreign key
    (dr_points_status_id)
    references 'informix'.dr_points_status_lu
    (dr_points_status_id)
    constraint dr_points_fkindex5;

alter table 'informix'.track add constraint foreign key
    (points_calculator_id)
    references 'informix'.points_calculator_lu
    (points_calculator_id)
    constraint track_fkindex1;

alter table 'informix'.track add constraint foreign key
    (track_type_id)
    references 'informix'.track_type_lu
    (track_type_id)
    constraint track_fkindex2;

alter table 'informix'.track add constraint foreign key
    (track_status_id)
    references 'informix'.track_status_lu
    (track_status_id)
    constraint track_fkindex3;

alter table 'informix'.track_contest add constraint foreign key
    (track_id)
    references 'informix'.track
    (track_id)
    constraint track_contest_fkindex1;

alter table 'informix'.track_contest add constraint foreign key
    (track_contest_type_id)
    references 'informix'.track_contest_type_lu
    (track_contest_type_id)
    constraint track_contest_fkindex2;

alter table 'informix'.track_contest add constraint foreign key
    (track_contest_result_calculator_id)
    references 'informix'.track_contest_result_calculator_lu
    (track_contest_result_calculator_id)
    constraint track_contest_fkindex3;

alter table 'informix'.track_project_category_xref add constraint foreign key
    (track_id)
    references 'informix'.track
    (track_id)
    constraint track_project_category_xref_fkindex1;

alter table 'informix'.track_project_category_xref add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint track_project_category_xref_fkindex2;

alter table 'informix'.categories add constraint foreign key
    (status_id)
    references 'informix'.status
    (status_id)
    constraint fk_ctgy_status;

alter table 'informix'.link_type_lu add constraint primary key
 (link_type_id)
 constraint pk_link_type_lu;

alter table 'informix'.linked_project_xref add constraint primary key
 (source_project_id, dest_project_id)
 constraint pk_linked_project_xref;

alter table 'informix'.linked_project_xref add constraint foreign key
 (source_project_id)
 references 'informix'.project
 (project_id)
 constraint fk_linked_project_xref_project_projectid;

alter table 'informix'.linked_project_xref add constraint foreign key
 (dest_project_id)
 references 'informix'.project
 (project_id)
 constraint fk_linked_project_xref_project_lu_destprojectid;

alter table 'informix'.linked_project_xref add constraint foreign key
 (link_type_id)
 references 'informix'.link_type_lu
 (link_type_id)
 constraint fk_linked_project_xref_link_type_lu_linktypeid;

 alter table 'informix'.project_spec add constraint primary key
 (project_spec_id)
 constraint pk_project_sepc;

alter table 'informix'.project_spec add constraint foreign key
 (project_id)
 references 'informix'.project
 (project_id)
 constraint fk_project_spec_project;


 ALTER TABLE 'informix'.sale_status_lu
        ADD CONSTRAINT ( PRIMARY KEY (sale_status_id) CONSTRAINT SALE_STATUS_LU_PK);

ALTER TABLE 'informix'.sale_type_lu
        ADD CONSTRAINT ( PRIMARY KEY (sale_type_id) CONSTRAINT SALE_TYPE_LU_PK);

ALTER TABLE 'informix'.contest_sale
        ADD CONSTRAINT ( PRIMARY KEY (contest_sale_id) CONSTRAINT CONTEST_SALE_PK);



alter table 'informix'.audit_action_type_lu add constraint primary key
    (audit_action_type_id)
    constraint audit_action_type_lu_pkey;

alter table 'informix'.project_user_audit add constraint primary key
    (project_user_audit_id)
    constraint project_user_audit_pkey;

alter table 'informix'.project_user_audit add constraint foreign key
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id)
    constraint project_user_audit_audit_action_type_lu_fk;

alter table 'informix'.project_user_audit add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint project_user_audit_project_fk;

alter table 'informix'.project_user_audit add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint project_user_audit_resource_role_lu_fk;

alter table 'informix'.project_info_audit add constraint foreign key
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id)
    constraint project_info_audit_audit_action_type_lu_fk;

alter table 'informix'.project_info_audit add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint project_info_audit_project_fk;

alter table 'informix'.project_info_audit add constraint foreign key
    (project_info_type_id)
    references 'informix'.project_info_type_lu
    (project_info_type_id)
    constraint project_info_audit_project_info_type_lu_fk;

alter table 'informix'.project_phase_audit add constraint foreign key
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id)
    constraint project_phase_audit_audit_action_type_lu_fk;

alter table 'informix'.project_phase_audit add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id)
    constraint project_phase_audit_project_phase_fk;


alter table 'informix'.software_competition_pipeline_info add constraint foreign key
    (component_id)
    references 'informix'.comp_catalog
    (component_id)
    constraint pipeline_component_fk;

alter table 'informix'.software_competition_pipeline_info add constraint foreign key
    (competition_id)
    references 'informix'.project
    (project_id)
    constraint pipeline_project_fk;

alter table 'informix'.software_competition_change_history add constraint foreign key
    (software_competition_pipeline_info_id)
    references 'informix'.software_competition_pipeline_info
    (id)
    constraint pipeline_history_pipeline_fk;


alter table 'informix'.client_billing_config add constraint foreign key
(client_billing_config_type_id )
references 'informix'.client_billing_config_type_lu
            (client_billing_config_type_id)
constraint fk_client_billing_type_lu;


alter table 'informix'.copilot_profile add constraint foreign key
  (copilot_profile_status_id)
  references 'informix'.copilot_profile_status
  (copilot_profile_status_id)
  constraint fk_copilotProfile_copilotProfileStatus_copilotProfileStatusId;

/*alter table 'informix'.copilot_profile add constraint foreign key
  (user_id)
  references 'informix'.user
  (user_id)
  constraint fk_copilotProfile_userId;*/

alter table 'informix'.copilot_profile_info add constraint foreign key
  (copilot_profile_info_type_id)
  references 'informix'.copilot_profile_info_type
  (copilot_profile_info_type_id)
  constraint fk_copilotProfileInfo_copilotProfileInfoType_copilotProfileInfoTypeId;

alter table 'informix'.copilot_profile_info add constraint foreign key
  (copilot_profile_id)
  references 'informix'.copilot_profile
  (copilot_profile_id)
  constraint fk_copilotProfileInfo_copilotProfile_copilotProfileId;

ALTER TABLE 'informix'.contest_sale
        ADD CONSTRAINT ( FOREIGN KEY(sale_status_id)
        REFERENCES 'informix'.sale_status_lu(sale_status_id) CONSTRAINT CONTEST_SALE_SALE_STATUS_FK);

ALTER TABLE 'informix'.contest_sale
        ADD CONSTRAINT ( FOREIGN KEY(contest_id)
        REFERENCES 'informix'.project(project_id) CONSTRAINT CONTEST_SALE_PROJECT_FK);

ALTER TABLE 'informix'.contest_sale
        ADD CONSTRAINT ( FOREIGN KEY(sale_type_id)
        REFERENCES 'informix'.sale_type_lu(sale_type_id) CONSTRAINT CONTEST_SALE_SALE_TYPE_FK);

alter table 'informix'.late_deliverable add constraint foreign key
    (late_deliverable_type_id)
    references 'informix'.late_deliverable_type_lu
    (late_deliverable_type_id)
    constraint fk_latedeliverable_latedeliverabletypelu_latedeliverabletypeid;

alter table 'informix'.late_deliverable add constraint foreign key
    (project_phase_id)
    references 'informix'.project_phase
    (project_phase_id) on delete cascade
    constraint fk_latedeliverable_projectphase_projectphaseid;

alter table 'informix'.late_deliverable add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id) on delete cascade
    constraint fk_latedeliverable_resource_resource_id;

alter table 'informix'.late_deliverable add constraint foreign key
    (deliverable_id)
    references 'informix'.deliverable_lu
    (deliverable_id)
    constraint fk_latedeliverable_deliverablelu_deliverableid;

alter table 'informix'.review_feedback add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_reviewfeedback_project_projectid;

alter table 'informix'.review_feedback_audit add constraint foreign key
    (review_feedback_id)
    references 'informix'.review_feedback
    (review_feedback_id)
    constraint fk_reviewfeedbackaudit_reviewfeedback_reviewfeedbackid;

alter table 'informix'.review_feedback_audit add constraint foreign key
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id)
    constraint fk_reviewfeedbackaudit_auditactiontypelu_auditactiontypeid;

alter table 'informix'.review_feedback_detail add constraint foreign key
    (review_feedback_id)
    references 'informix'.review_feedback
    (review_feedback_id)
    constraint fk_reviewfeedbackdetail_reviewfeedback_reviewfeedbackid;

alter table 'informix'.review_feedback_detail_audit add constraint foreign key
    (review_feedback_id)
    references 'informix'.review_feedback
    (review_feedback_id)
    constraint fk_reviewfeedbackdetailaudit_reviewfeedback_reviewfeedbackid;

alter table 'informix'.review_feedback_detail_audit add constraint foreign key
    (audit_action_type_id)
    references 'informix'.audit_action_type_lu
    (audit_action_type_id)
    constraint fk_reviewfeedbackdetailaudit_auditactiontypelu_auditactiontypeid;

alter table 'informix'.project_reliability add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_projectreliability_project_projectid;

ALTER TABLE copilot_project ADD CONSTRAINT
    FOREIGN KEY (copilot_project_status_id )
    REFERENCES copilot_project_status(copilot_project_status_id ) ON DELETE CASCADE CONSTRAINT fk_copilot_project_copilot_project_status;

ALTER TABLE copilot_project ADD CONSTRAINT
    FOREIGN KEY (copilot_profile_id )
    REFERENCES copilot_profile(copilot_profile_id ) ON DELETE CASCADE CONSTRAINT fk_copilot_project_copilot_profile;

ALTER TABLE copilot_project ADD CONSTRAINT
    FOREIGN KEY (copilot_type_id )
    REFERENCES copilot_type(copilot_type_id ) ON DELETE CASCADE CONSTRAINT fk_copilot_project_copilot_type;

ALTER TABLE copilot_project_info ADD CONSTRAINT
    FOREIGN KEY (copilot_project_id )
    REFERENCES copilot_project(copilot_project_id ) ON DELETE CASCADE CONSTRAINT fk_copilot_project_info_copilot_project;

ALTER TABLE copilot_project_info ADD CONSTRAINT
    FOREIGN KEY (copilot_project_info_type_id )
    REFERENCES copilot_project_info_type(copilot_project_info_type_id ) ON DELETE CASCADE CONSTRAINT fk_copilot_project_info_copilot_project_info_type;

alter table 'informix'.comp_milestone_feedback add constraint foreign key
	(project_id)
	references 'informix'.project
	(project_id)
	constraint fk_comp_milestone_feedback_project_project_id;

create index 'informix'.project_idx_dpi
on 'informix'.project
(
tc_direct_project_id
);


alter table 'informix'.prize add constraint foreign key
    (prize_type_id)
    references 'informix'.prize_type_lu
    (prize_type_id)
    constraint prize_file_type_fk;

alter table 'informix'.prize add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint prize_project_fk;

alter table 'informix'.project add constraint foreign key
    (project_studio_spec_id)
    references 'informix'.project_studio_specification
    (project_studio_spec_id)
    constraint project_project_studio_spec_fk;

alter table 'informix'.project add constraint foreign key
    (project_mm_spec_id)
    references 'informix'.project_mm_specification
    (project_mm_spec_id)
    constraint project_project_mm_spec_fk;

alter table 'informix'.project_file_type_xref add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint project_project_file_type_xref_fk;

alter table 'informix'.project_file_type_xref add constraint foreign key
    (file_type_id)
    references 'informix'.file_type_lu
    (file_type_id)
    constraint file_type_project_file_type_xref_fk;

alter table 'informix'.submission add constraint foreign key
    (prize_id)
    references 'informix'.prize
    (prize_id)
    constraint prize_submission_fk;

alter table 'informix'.mime_type_lu add constraint foreign key
    (file_type_id)
    references 'informix'.file_type_lu
    (file_type_id)
    constraint mime_type_file_type_fk;

alter table 'informix'.submission_image add constraint foreign key
    (submission_id)
    references 'informix'.submission
    (submission_id) on delete cascade
    constraint submission_submission_image_fk;

alter table 'informix'.submission_declaration add constraint primary key
    (submission_declaration_id)
    constraint submission_declaration_pk;

alter table 'informix'.external_content_type add constraint primary key
    (external_content_type_id)
    constraint external_content_type_pk;

alter table 'informix'.submission_external_content add constraint primary key
    (external_content_id)
    constraint submission_external_content_pk;

alter table 'informix'.external_content_property add constraint primary key
    (external_content_property_id)
    constraint external_content_property_pk;

alter table 'informix'.submission_declaration add constraint foreign key
    (submission_id)
    references 'informix'.submission
    (submission_id)
    constraint submission_declaration_to_submission_fk;

alter table 'informix'.submission_external_content add constraint foreign key
    (submission_declaration_id)
    references 'informix'.submission_declaration
    (submission_declaration_id)
    constraint submission_external_content_to_submission_declaration_fk;

alter table 'informix'.external_content_property add constraint foreign key
    (external_content_id)
    references 'informix'.submission_external_content
    (external_content_id)
    constraint external_content_property_to_submission_external_content_fk;

alter table 'informix'.project_copilot_type add constraint foreign key
  (project_id)
  references 'informix'.project
  (project_id)
  constraint fk_project_copilot_type_pj;

alter table 'informix'.project_copilot_type add constraint foreign key
  (project_copilot_type_id)
  references 'informix'.project_copilot_type_lu
  (project_copilot_type_id)
  constraint fk_project_copilot_type_tp;

alter table 'informix'.copilot_contest_extra_info add constraint foreign key
  (copilot_posting_contest_id)
  references 'informix'.project
  (project_id)
  constraint fk_copilot_contest_extra_info_pj;
alter table 'informix'.copilot_contest_extra_info add constraint foreign key
  (copilot_contest_extra_info_type_id)
  references 'informix'.copilot_contest_extra_info_type
  (copilot_contest_extra_info_type_id)
  constraint fk_copilot_contest_extra_info_tp;

ALTER TABLE direct_project_metadata ADD CONSTRAINT FOREIGN KEY (project_metadata_key_id)
REFERENCES direct_project_metadata_key (project_metadata_key_id) CONSTRAINT fk_project_metadata_project_metadata_type;

ALTER TABLE direct_project_metadata_audit ADD CONSTRAINT FOREIGN KEY (audit_action_type_id)
REFERENCES audit_action_type_lu (audit_action_type_id) CONSTRAINT fk_project_metadata_audit_audit_action_type_lu1;

ALTER TABLE direct_project_metadata_key_audit ADD CONSTRAINT FOREIGN KEY (audit_action_type_id)
REFERENCES audit_action_type_lu (audit_action_type_id) CONSTRAINT fk_project_metadata_key_audit_audit_action_type_lu1;

ALTER TABLE direct_project_metadata_predefined_value ADD CONSTRAINT FOREIGN KEY (project_metadata_key_id)
REFERENCES direct_project_metadata_key (project_metadata_key_id) CONSTRAINT fk_project_metadata_type_value_project_metadata_type1;

ALTER TABLE direct_project_metadata_predefined_value_audit ADD CONSTRAINT FOREIGN KEY (audit_action_type_id)
REFERENCES audit_action_type_lu (audit_action_type_id) CONSTRAINT fk_project_metadata_predefined_value_audit_audit_action_type_1;


ALTER TABLE 'informix'.project_category_lu ADD CONSTRAINT FOREIGN KEY
    (project_catalog_id)
    REFERENCES 'informix'.project_catalog_lu
    (project_catalog_id)
    CONSTRAINT fk_projectcategorylu_projectcataloglu_projectcatalogid;



alter table 'informix'.project_milestone_owner add constraint foreign key
    (project_milestone_id)
    references 'informix'.project_milestone
    (project_milestone_id)
    constraint fk_project_milestone_owner_project_milestone;

create index 'informix'.direct_project_metadata_val_idx on 'informix'.direct_project_metadata
    (
    metadata_value
    );


ALTER TABLE 'informix'.group_associated_billing_accounts
	ADD CONSTRAINT FOREIGN KEY(group_id) REFERENCES 'informix'.customer_group(group_id)
	CONSTRAINT fk_group_associated_billing_accounts_group;


ALTER TABLE 'informix'.group_invitation ADD CONSTRAINT FOREIGN KEY(group_member_id) REFERENCES 'informix'.group_member(group_member_id)
	CONSTRAINT fk_group_invitation_group_member;

alter table 'informix'.review_auction_type_lu add constraint foreign key
    (review_auction_category_id)
    references 'informix'.review_auction_category_lu
    (review_auction_category_id)
    constraint reviewauctiontypelu_reviewauctioncategorylu_fk;

alter table 'informix'.review_application_role_lu add constraint foreign key
    (review_auction_type_id)
    references 'informix'.review_auction_type_lu
    (review_auction_type_id)
    constraint reviewapplicationrolelu_reviewauctiontypelu_fk;

alter table 'informix'.review_application_role_resource_role_xref add constraint foreign key
    (review_application_role_id)
    references 'informix'.review_application_role_lu
    (review_application_role_id)
    constraint reviewapplicationroleresourcerolexref_reviewapplicationrolelu_fk;

alter table 'informix'.review_application_role_resource_role_xref add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint reviewapplicationroleresourcerolexref_resourcerolelu_fk;

alter table 'informix'.review_auction add constraint foreign key
    (review_auction_type_id)
    references 'informix'.review_auction_type_lu
    (review_auction_type_id)
    constraint reviewauction_reviewauctiontypelu_fk;

alter table 'informix'.review_auction add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint reviewauction_project_fk;

alter table 'informix'.review_application add constraint foreign key
    (review_auction_id)
    references 'informix'.review_auction
    (review_auction_id) on delete cascade
    constraint reviewapplication_reviewauction_fk;

alter table 'informix'.review_application add constraint foreign key
    (review_application_role_id)
    references 'informix'.review_application_role_lu
    (review_application_role_id)
    constraint reviewapplication_reviewapplicationrolelu_fk;

alter table 'informix'.review_application add constraint foreign key
    (review_application_status_id)
    references 'informix'.review_application_status_lu
    (review_application_status_id)
    constraint reviewapplication_reviewapplicationstatuslu_fk;

alter table 'informix'.project_payment add constraint foreign key
    (project_payment_type_id)
    references 'informix'.project_payment_type_lu
    (project_payment_type_id)
    constraint projectpayment_projectpaymenttypelu_fk;

alter table 'informix'.project_payment add constraint foreign key
    (resource_id)
    references 'informix'.resource
    (resource_id)
    constraint projectpayment_resource_fk;

alter table 'informix'.project_payment add constraint foreign key
    (submission_id)
    references 'informix'.submission
    (submission_id)
    constraint projectpayment_submission_fk;

alter table 'informix'.project_payment_adjustment add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint projectpaymentadjustment_project_fk;

alter table 'informix'.project_payment_adjustment add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint projectpaymentadjustment_resourcerolelu_fk;

alter table 'informix'.default_project_payment add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint defaultprojectpayment_projectcategorylu_fk;

alter table 'informix'.default_project_payment add constraint foreign key
    (resource_role_id)
    references 'informix'.resource_role_lu
    (resource_role_id)
    constraint defaultprojectpayment_resourcerolelu_fk;

alter table 'informix'.reviewer_rating add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_reviewerrating_project_projectid;

alter table 'informix'.asset_version add constraint foreign key
    (asset_id)
    references 'informix'.asset (id )
    ON DELETE CASCADE
    constraint version_asset_id_ref;

alter table 'informix'.asset add constraint foreign key
    (current_version_id)
    references 'informix'.asset_version (id )
    constraint asset_current_version_id_ref;

alter table 'informix'.asset_category_mapping add constraint foreign key
    (asset_id)
    references 'informix'.asset (id )
    ON DELETE CASCADE
    constraint mapping_asset_id_ref;

alter table 'informix'.asset_category_mapping add constraint foreign key
    (category_id)
    references 'informix'.asset_category (id )
    ON DELETE CASCADE
    constraint mapping_category_id_ref;


create index 'informix'.group_archived_idx on 'informix'.customer_group
    (
    archived
    );

create index 'informix'.group_member_permission_idx on 'informix'.group_member
    (
    specific_permission
    );

create index 'informix'.group_member_active_idx on 'informix'.group_member
    (
    active
    );

alter table direct_project_task_list_permitted_user add constraint foreign key
	(direct_project_task_list_id)
	references direct_project_task_list
	(direct_project_task_list_id)
	constraint fk_task_list_permitted_user_to_task_list;

alter table direct_project_task add constraint foreign key
	(direct_project_task_list_id)
	references direct_project_task_list
	(direct_project_task_list_id)
	constraint fk_task_to_task_list;

alter table direct_project_task add constraint foreign key
	(status)
	references direct_project_task_status
	(direct_project_task_status_id)
	constraint fk_task_to_task_status;

alter table direct_project_task add constraint foreign key
	(priority)
	references direct_project_task_priority
	(direct_project_task_priority_id)
	constraint fk_task_to_task_priority;

alter table direct_project_task_attachment add constraint foreign key
	(direct_project_task_id)
	references direct_project_task
	(direct_project_task_id)
	constraint fk_task_attachment_to_task;

alter table direct_project_task_contest_xref add constraint foreign key
	(direct_project_task_id)
	references direct_project_task
	(direct_project_task_id)
	constraint fk_task_contest_xref_to_task;


alter table direct_project_task_assignee add constraint foreign key
	(direct_project_task_id)
	references direct_project_task
	(direct_project_task_id)
	constraint fk_task_assignee_to_task;

alter table direct_project_task_milestone_xref add constraint foreign key
	(direct_project_task_id)
	references direct_project_task
	(direct_project_task_id)
	constraint fk_task_milestone_xref_to_task;

alter table direct_project_task_milestone_xref add constraint foreign key
	(project_milestone_id)
	references project_milestone
	(project_milestone_id)
	constraint fk_task_milestone_xref_to_project;


alter table direct_project_task_list_contest_xref add constraint foreign key
	(direct_project_task_list_id)
	references direct_project_task_list
	(direct_project_task_list_id)
	constraint fk_task_list_context_xref_to_task_list;

alter table direct_project_task_list_milestone_xref add constraint foreign key
	(project_milestone_id)
	references project_milestone
	(project_milestone_id)
	constraint fk_task_list_milestone_xref_to_project;

alter table direct_project_task_list_milestone_xref add constraint foreign key
	(direct_project_task_list_id)
	references direct_project_task_list
	(direct_project_task_list_id)
	constraint fk_task_list_milestone_xref_to_task_list;

alter table 'informix'.contest_milestone_xref add constraint foreign key
    (contest_id)
    references 'informix'.project
    (project_id)
    constraint fk_contestmilestonexref_project_contestid;

alter table 'informix'.contest_milestone_xref add constraint foreign key
    (project_milestone_id)
    references 'informix'.project_milestone
    (project_milestone_id)
    constraint fk_contestmilestonexref_projectmilestone_projectmilestoneid;

alter table 'informix'.project_sub_category_lu add constraint foreign key
    (project_category_id)
    references 'informix'.project_category_lu
    (project_category_id)
    constraint project_sub_category_fk;

alter table 'informix'.project add constraint foreign key
    (project_sub_category_id)
    references 'informix'.project_sub_category_lu
    (project_sub_category_id)
    constraint project_project_sub_category_fk;

alter table 'informix'.user_recent_item add constraint foreign key
    (recent_item_type_id)
    references 'informix'.user_recent_item_type
    (recent_item_type_id)
    constraint user_recent_item_user_recent_item_type_fk;

alter table 'informix'.project_platform add constraint foreign key
    (project_id)
    references 'informix'.project
    (project_id)
    constraint fk_projectplatform_project_projectid;

alter table 'informix'.project_platform add constraint foreign key
    (project_platform_id)
    references 'informix'.project_platform_lu
    (project_platform_id)
    constraint fk_projectplatform_projectplatformlu_projectplatformid;

create index 'informix'.resource_user_id_idx on 'informix'.resource
	(
	user_id
	);


CREATE INDEX 'informix'.bac_id_ix ON group_associated_billing_accounts
    (
        billing_account_id
    );

CREATE INDEX 'informix'.group_associated_direct_projects_i1 ON group_associated_direct_projects
    (
        group_id
    );

CREATE INDEX 'informix'.group_associated_direct_projects_i2 ON group_associated_direct_projects
    (
        tc_direct_project_id
    );

CREATE INDEX 'informix'.customer_group_i1 ON customer_group
    (
        auto_grant
    );

CREATE INDEX 'informix'.customer_group_i2 ON customer_group
    (
        client_id
    );

CREATE INDEX 'informix'.group_member_i1 ON group_member
    (
        group_id
    );

CREATE INDEX 'informix'.group_member_i2 ON group_member
    (
        user_id
    );

CREATE INDEX 'informix'.project_idx_cu ON project
    (
        create_user
    );
