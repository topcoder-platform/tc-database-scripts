database tcs_catalog;

create synonym 'informix'.calendar
for common_oltp:'informix'.calendar;

create synonym 'informix'.company
for common_oltp:'informix'.company;

create synonym 'informix'.contact
for common_oltp:'informix'.contact;

create synonym 'informix'.email
for common_oltp:'informix'.email;

create synonym 'informix'.event
for common_oltp:'informix'.event;

create synonym 'informix'.group_role_xref
for common_oltp:'informix'.group_role_xref;

create synonym 'informix'.id_sequences
for common_oltp:'informix'.id_sequences;

create synonym 'informix'.permission_code
for common_oltp:'informix'.permission_code;

create synonym 'informix'.security_groups
for common_oltp:'informix'.security_groups;

create synonym 'informix'.security_perms
for common_oltp:'informix'.security_perms;

create synonym 'informix'.security_roles
for common_oltp:'informix'.security_roles;

create synonym 'informix'.security_user
for common_oltp:'informix'.security_user;

create synonym 'informix'.sequence_object
for common_oltp:'informix'.sequence_object;

create synonym 'informix'.terms_of_use
for common_oltp:'informix'.terms_of_use;

create synonym 'informix'.user
for common_oltp:'informix'.user;

create synonym 'informix'.user_group_xref
for common_oltp:'informix'.user_group_xref;

create synonym 'informix'.user_role_xref
for common_oltp:'informix'.user_role_xref;

create synonym 'informix'.user_status
for common_oltp:'informix'.user_status;

create synonym 'informix'.user_terms_of_use_xref
for common_oltp:'informix'.user_terms_of_use_xref;

create synonym 'informix'.project_role_terms_of_use_xref
for common_oltp:'informix'.project_role_terms_of_use_xref;

create synonym 'informix'.client
for time_oltp:'informix'.client;

    
create synonym 'informix'.tt_project
for time_oltp:'informix'.project;

create synonym 'informix'.tt_client
for time_oltp:'informix'.client;


create synonym 'informix'.tt_client_project
for time_oltp:'informix'.client_project;

create synonym 'informix'.tt_user_account
for time_oltp:'informix'.user_account;


create synonym 'informix'.tt_project_worker
for time_oltp:'informix'.project_worker;

create synonym 'informix'.tt_project_manager
for time_oltp:'informix'.project_manager;

create synonym 'informix'.contest_eligibility
for common_oltp:'informix'.contest_eligibility;

create synonym 'informix'.group_contest_eligibility
for common_oltp:'informix'.group_contest_eligibility;

create synonym 'informix'.client_terms_mapping
for common_oltp:'informix'.client_terms_mapping;

-- CORPORATE_OLTP SYNONYMS

create synonym "informix".tc_direct_project 
for corporate_oltp:"informix".tc_direct_project;

create synonym "informix".permission_type 
for corporate_oltp:"informix".permission_type;

create synonym "informix".user_permission_grant 
for corporate_oltp:"informix".user_permission_grant;

create synonym 'informix'.PERMISSION_SEQ
for corporate_oltp:'informix'.PERMISSION_SEQ;

create synonym 'informix'.spec_review_status_type_lu
for corporate_oltp:'informix'.spec_review_status_type_lu;

create synonym 'informix'.spec_review_section_type_lu
for corporate_oltp:'informix'.spec_review_section_type_lu;

create synonym 'informix'.spec_review_user_role_type_lu
for corporate_oltp:'informix'.spec_review_user_role_type_lu;

create synonym 'informix'.spec_review
for corporate_oltp:'informix'.spec_review;

create synonym 'informix'.spec_review_reviewer_xref
for corporate_oltp:'informix'.spec_review_reviewer_xref;

create synonym 'informix'.spec_section_review
for corporate_oltp:'informix'.spec_section_review;

create synonym 'informix'.spec_section_review_comment
for corporate_oltp:'informix'.spec_section_review_comment;

create synonym 'informix'.spec_review_comment_view
for corporate_oltp:'informix'.spec_review_comment_view;

create synonym 'informix'.SPEC_REVIEW_REVIEWER_SEQ
for corporate_oltp:'informix'.SPEC_REVIEW_REVIEWER_SEQ;

create synonym 'informix'.coder 
for informixoltp:'informix'.coder;

create synonym 'informix'.current_school 
for informixoltp:'informix'.current_school;

create synonym 'informix'.coder_referral 
for informixoltp:'informix'.coder_referral;

create synonym 'informix'.secret_question 
for common_oltp:'informix'.secret_question;

create synonym 'informix'.professor 
for common_oltp:'informix'.professor;

create synonym 'informix'.professor_status_lu 
for common_oltp:'informix'.professor_status_lu;

create synonym 'informix'.user_security_key 
for common_oltp:'informix'.user_security_key;

create synonym "informix".image 
for informixoltp:"informix".image;

-- JIVE synonyms

create synonym 'informix'.jivecategory
for jive:'informix'.jivecategory;

create synonym 'informix'.jiveforum
for jive:'informix'.jiveforum;

create synonym 'informix'.jivemessage
for jive:'informix'.jivemessage;

create synonym "informix".event_registration 
for common_oltp:"informix".event_registration;


create synonym "informix".direct_project_type 
for corporate_oltp:"informix".direct_project_type;

create synonym "informix".direct_project_category 
for corporate_oltp:"informix".direct_project_category;

create synonym "informix".direct_project_account
for corporate_oltp:"informix".direct_project_account;

create role read_only ;
create procedure "informix".get_current() returning datetime year to fraction(3);
      return CURRENT;
    end procedure;
create procedure "informix".proc_rboard_update(
  user_id decimal(10,0),
  phase_id decimal(5,0),
  o_status_id decimal(3,0),
  n_status_id decimal(3,0),
  o_contract_ind decimal(1,0),
  n_contract_ind decimal(1,0),
  o_java_ind decimal(1,0),
  n_java_ind decimal(1,0),
  o_net_ind decimal(1,0),
  n_net_ind decimal(1,0),
  o_flash_ind decimal(1,0),
  n_flash_ind decimal(1,0)
)
 
  if (o_status_id != n_status_id) then
     insert into rboard_user_audit (user_id, phase_id, data_element, old_val, new_val)
     values (user_id, phase_id, 'STATUS_ID', o_status_id , n_status_id);
  end if;

  if (o_contract_ind != n_contract_ind) then
     insert into rboard_user_audit (user_id, phase_id, data_element, old_val, new_val)
     values (user_id, phase_id, 'CONTRACT_IND', o_contract_ind , n_contract_ind);
  end if;

  if (o_java_ind != n_java_ind) then
     insert into rboard_user_audit (user_id, phase_id, data_element, old_val, new_val)
     values (user_id, phase_id, 'JAVA_IND', o_java_ind , n_java_ind);
  end if;

  if (o_net_ind != n_net_ind) then
     insert into rboard_user_audit (user_id, phase_id, data_element, old_val, new_val)
     values (user_id, phase_id, 'NET_IND', o_net_ind , n_net_ind);
  end if;

  if (o_flash_ind != n_flash_ind) then
     insert into rboard_user_audit (user_id, phase_id, data_element, old_val, new_val)
     values (user_id, phase_id, 'FLASH_IND', o_flash_ind , n_flash_ind);
  end if;

end procedure;
CREATE PROCEDURE predictor(project_id DECIMAL(12,0)) RETURNING DECIMAL(5,4)
 	DEFINE reliability DECIMAL(5,4);
 	DEFINE product DECIMAL(5,4);

  	LET product = 1.0;

 	FOREACH SELECT NVL(ur.rating, 0.0)
                INTO reliability
                FROM project_result pr
                   , user_reliability ur
                   , project p
               WHERE pr.project_id = project_id 
                 AND pr.user_id = ur.user_id
                 AND pr.project_id = p.project_id
                 AND p.project_category_id + 111 = ur.phase_id
  		LET product = product * (1.0 - reliability);
 	END FOREACH

 	RETURN 1.0 - product;
 END PROCEDURE;
create procedure "informix".proc_rating_update(
p_user_id DECIMAL(10,0),
p_phase_id decimal(3,0),
old_rating decimal(10,0),
new_rating decimal(10,0),
old_vol decimal(10,0),
new_vol decimal(10,0),
old_num_ratings decimal(5,0),
new_num_ratings decimal(5,0),
old_last_rated_project_id decimal(12,0),
new_last_rated_project_id decimal(12,0)
)
 
      if (old_rating != new_rating) then 
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('RATING', old_rating, new_rating, p_user_id, p_phase_id);
      End If;

      if (old_vol != new_vol) then 
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('VOL', old_vol, new_vol, p_user_id, p_phase_id);
      End If;

      if (old_num_ratings != new_num_ratings) then 
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('NUM_RATINGS', old_num_ratings, new_num_ratings, p_user_id, p_phase_id);
      End If;

      if (old_last_rated_project_id != new_last_rated_project_id) then 
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('LAST_RATED_PROJECT_ID', old_last_rated_project_id, new_last_rated_project_id, p_user_id, p_phase_id);
      End If;

      update user_rating set mod_date_time = current where user_id = p_user_id and phase_id = p_phase_id;

end procedure;
create procedure "informix".proc_reliability_update(
p_user_id DECIMAL(10,0),
p_phase_id decimal(3,0),
old_rating decimal(5,4),
new_rating decimal(5,4)
)
 
      if (old_rating != new_rating) then 
         insert into user_reliability_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('RATING', old_rating, new_rating, p_user_id, p_phase_id);
      End If;

      update user_reliability set modify_date = current where user_id = p_user_id and phase_id = p_phase_id;

end procedure;
create procedure "informix".millis_to_time(milli_val decimal(14,0))
 returning datetime year to fraction(3);

  define retval datetime year to fraction(3);
  define num_days int;
  define num_seconds int;
  define millis_in_day int;

  let millis_in_day = 86400000;
  let num_days = trunc(milli_val/millis_in_day,0);
  let num_seconds = (milli_val - (num_days * millis_in_day))/1000;

  let retval = extend(mdy(1,1,1970), year to fraction(3));
  let retval = retval + num_days units day;
  let retval = retval + num_seconds units second;

  return retval;

end procedure;
create procedure category_list( i_component_id decimal(12)  )
returning lvarchar(1000);

define o_cat_list lvarchar(1000);
define t_cat_desc lvarchar(1000);

let o_cat_list = "";

foreach
select cat.category_name 
  into t_cat_desc
from comp_categories cc, categories cat
where cc.category_id = cat.category_id
 and cc.component_id = i_component_id
order by cat.category_name

  if length(o_cat_list) = 0 then
    let o_cat_list = t_cat_desc;
  else
    let o_cat_list = o_cat_list || ", " || t_cat_desc;
  end if

end foreach

return o_cat_list;

end procedure;

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure get_current() to 'public' as 'informix';

grant execute on procedure proc_rboard_update(decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal) to 'public' as 'informix';

grant execute on procedure predictor(decimal) to 'public' as 'informix';

grant execute on procedure proc_rating_update(decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal) to 'public' as 'informix';

grant execute on procedure proc_reliability_update(decimal,decimal,decimal,decimal) to 'public' as 'informix';

grant execute on procedure millis_to_time(decimal) to 'public' as 'informix';

grant execute on procedure category_list(decimal) to 'public' as 'informix';
	
create procedure component_developer(component_id decimal(12)) returning lvarchar(1000);
	define user_list lvarchar(1000);
	define users_desc lvarchar(1000);

	let users_desc = "";

	foreach
		select u.handle || "|" || u.user_id || "|mailto:" || e.address
		  into user_list
		  from resource r
			 , resource_info ri
			 , security_user s
			 , project_info pi
			 , project p
			 , comp_catalog c
			 , comp_versions v 
			 , user u
			 , email e
		 where r.resource_id = ri.resource_id
		   and ri.resource_info_type_id = 1 
		   and ri.value = s.login_id 
		   and r.project_id = pi.project_id
		   and r.project_id = p.project_id 
		   and pi.project_info_type_id = 1 
		   and (r.resource_role_id = 1 and exists (select 1 from project_info piW where piW.project_info_type_id = 23 and piW.project_id = p.project_id and piW.value = s.login_id ))
		   and c.component_id = component_id 
		   and p.project_status_id = 7
		   and p.project_category_id in (1,2)
		   and c.component_id = v.component_id
		   and pi.value = v.comp_vers_id 
		   and pi.value = v.comp_vers_id 
		   and c.current_version = v.version
		   and s.login_id = u.user_id
		   and e.user_id = u.user_id

  		if length(users_desc) = 0 then
    		let users_desc = user_list;
  		else
		    let users_desc = users_desc || "," || user_list;
 	 	end if
	end foreach

	return users_desc;
end procedure;

grant execute on component_developer to public as informix;

create procedure categories(i_component_vers_id decimal(12)) returning lvarchar(1000);
	define o_cat_list lvarchar(1000);
	define t_cat_desc lvarchar(1000);

	let o_cat_list = "";

	foreach
		select tt.technology_name || "|" || tt.technology_type_id
		  into t_cat_desc
		  from comp_technology ct, technology_types tt 
		 where ct.comp_vers_id = i_component_vers_id 
		   and ct.technology_type_id = tt.technology_type_id
		 order by tt.technology_name

  		if length(o_cat_list) = 0 then
    		let o_cat_list = t_cat_desc;
  		else
    		let o_cat_list = o_cat_list || "," || t_cat_desc;
  		end if
	end foreach

	return o_cat_list;
end procedure;

grant execute on categories to public as informix;

create procedure all_categories() returning lvarchar(1000);
	define o_cat_list lvarchar(1000);
	define t_cat_desc lvarchar(1000);

	let o_cat_list = "";

	foreach
		select tt.technology_name || "|" || tt.technology_type_id
		  into t_cat_desc
		  from  technology_types tt 
		 order by tt.technology_name

  		if length(o_cat_list) = 0 then
		    let o_cat_list = t_cat_desc;
  		else
	    	let o_cat_list = o_cat_list || "," || t_cat_desc;
  		end if
	end foreach

	return o_cat_list;
end procedure;

grant execute on all_categories to public as informix;

create procedure component_versions(i_component_vers_id decimal(12)) returning lvarchar(1000);
	define cv_desc lvarchar(1000);
	define cv_list lvarchar(1000);

	let cv_desc = "";

	foreach
		select cv.version_text || "|" || cv.create_time  || "|" ||  nvl(cv.revision, "  ")  || "|" ||  cv.comp_vers_id
		  into cv_list
		  from comp_versions cv
		 where cv.component_id = i_component_vers_id

  		if length(cv_desc) = 0 then
    		let cv_desc = cv_list;
  		else
    		let cv_desc = cv_desc || "," || cv_list;
  		end if
	end foreach

	return cv_desc;
end procedure;

grant execute on component_versions to public as informix;

create procedure technology_list( i_comp_vers_id decimal(12)  )
    returning lvarchar(1000);

    define o_cat_list lvarchar(1000);
    define t_cat_desc lvarchar(1000);

    let o_cat_list = "";

    foreach

        select tt.technology_name 
            into t_cat_desc
        from comp_technology ct, 
        technology_types tt
        where ct.technology_type_id = tt.technology_type_id
        and ct.comp_vers_id = i_comp_vers_id
        order by tt.technology_name

        if length(o_cat_list) = 0 then
            let o_cat_list = t_cat_desc;
        else
            let o_cat_list = o_cat_list || ", " || t_cat_desc;
        end if
    
    end foreach

return o_cat_list;

end procedure;

grant execute on technology_list to public as informix;

create trigger "informix".trig_comp_version_dates_modified update of comp_vers_id,phase_id,posting_date,initial_submission_date,winner_announced_date,final_submission_date,estimated_dev_date,price,total_submissions,status_id,level_id,screening_complete_date,review_complete_date,aggregation_complete_date,phase_complete_date,production_date,aggregation_complete_date_comment,phase_complete_date_comment,review_complete_date_comment,winner_announced_date_comment,initial_submission_date_comment,screening_complete_date_comment,final_submission_date_comment,production_date_comment on "informix".comp_version_dates referencing old as old                                                                                                                                         for each row
        (
        execute function "informix".get_current() into "informix".comp_version_dates.modify_date);
create trigger "informix".trig_rboardpayment_modified update of amount on "informix".rboard_payment referencing old as o new as n                                                                                                                                   for each row
        (
        execute function "informix".get_current() into "informix".rboard_payment.modify_date);
create trigger "informix".trig_contest_prize_modified update of contest_id,prize_type_id,place,prize_amount,prize_desc on "informix".contest_prize referencing old as old                                                                                           for each row
        (
        execute function "informix".get_current() into "informix".contest_prize.modify_date);
create trigger "informix".trig_royalty_modified update of user_id,amount,description,royalty_date on "informix".royalty referencing old as old                                                                                                                      for each row
        (
        execute function "informix".get_current() into "informix".royalty.modify_date);
create trigger "informix".trig_user_event_xref_modified update of user_id,event_id,create_date on "informix".user_event_xref referencing old as old                                                                                                                 for each row
        (
        execute function "informix".get_current() into "informix".user_event_xref.modify_date);
create trigger "informix".trig_comp_catalog_modified update of current_version,short_desc,description,function_desc,status_id,root_category_id on "informix".comp_catalog referencing old as old                                                                    for each row
        (
        execute function "informix".get_current() into "informix".comp_catalog.modify_date);
create trigger "informix".trig_audit_rating update of rating,vol,num_ratings,last_rated_project_id on "informix".user_rating referencing old as old new as new                                                                                                      for each row
        (
        execute procedure "informix".proc_rating_update(old.user_id ,old.phase_id ,old.rating ,new.rating ,old.vol ,new.vol ,old.num_ratings ,new.num_ratings ,old.last_rated_project_id ,new.last_rated_project_id ));
create trigger "informix".trig_reliability_audit update of rating on "informix".user_reliability referencing old as old new as new                                                                                                                                  for each row
        (
        execute procedure "informix".proc_reliability_update(old.user_id ,old.phase_id ,old.rating ,new.rating ));
create trigger "informix".trig_comp_versions_modified update of component_id,version,version_text,phase_id,phase_time,price,comments,suspended_ind on "informix".comp_versions referencing old as old                                                               for each row
        (
        execute function "informix".get_current() into "informix".comp_versions.modify_date);
create trigger "informix".trig_project_result_modified update of old_rating,new_rating,raw_score,final_score,payment,placed,rating_ind,valid_submission_ind,passed_review_ind,point_adjustment,rating_order on "informix".project_result referencing old as old                                                                                                                                                                     for each row
        (
        update "informix".project_result set "informix".project_result.modify_date = CURRENT year to fraction(3)  where ((project_id = old.project_id ) AND (user_id = old.user_id ) ) );
create trigger "informix".trig_season_modified update of name,rookie_competition_ind,next_rookie_season_id on "informix".season referencing old as old                                                                                                              for each row
        (
        execute function "informix".get_current() into "informix".season.modify_date);
create trigger "informix".trig_stage_modified update of season_id,name,start_date,end_date on "informix".stage referencing old as old                                                                                                                               for each row
        (
        execute function "informix".get_current() into "informix".stage.modify_date);
create trigger "informix".trig_contest_modified update of contest_name,phase_id,contest_type_id,start_date,end_date,event_id,contest_result_calculator_id on "informix".contest referencing old as old                                                              for each row
        (
        execute function "informix".get_current() into "informix".contest.modify_date);

