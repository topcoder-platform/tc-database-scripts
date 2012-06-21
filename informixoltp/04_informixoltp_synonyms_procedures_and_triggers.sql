database informixoltp;

create synonym 'informix'.address
for common_oltp:'informix'.address;

create synonym 'informix'.calendar
for common_oltp:'informix'.calendar;

create synonym 'informix'.company
for common_oltp:'informix'.company;

create synonym 'informix'.company_datasource_xref
for common_oltp:'informix'.company_datasource_xref;

create synonym 'informix'.contact
for common_oltp:'informix'.contact;

create synonym 'informix'.country
for common_oltp:'informix'.country;

create synonym 'informix'.datasource_lu
for common_oltp:'informix'.datasource_lu;

create synonym 'informix'.datasource_type_lu
for common_oltp:'informix'.datasource_type_lu;

create synonym 'informix'.demographic_answer
for common_oltp:'informix'.demographic_answer;

create synonym 'informix'.demographic_assignment
for common_oltp:'informix'.demographic_assignment;

create synonym 'informix'.demographic_question
for common_oltp:'informix'.demographic_question;

create synonym 'informix'.demographic_response
for common_oltp:'informix'.demographic_response;

create synonym 'informix'.email
for common_oltp:'informix'.email;

create synonym 'informix'.email_user
for common_oltp:'informix'.email_user;

create synonym 'informix'.event
for common_oltp:'informix'.event;

--BUGR-4316 : 206: The specified table (common_oltp:informix.event_question_xref) is not in the database.
--create synonym 'informix'.event_question_xref
--for common_oltp:'informix'.event_question_xref;

create synonym 'informix'.event_registration
for common_oltp:'informix'.event_registration;

create synonym 'informix'.event_type_lu
for common_oltp:'informix'.event_type_lu;

create synonym 'informix'.group_role_xref
for common_oltp:'informix'.group_role_xref;

create synonym 'informix'.id_sequences
for common_oltp:'informix'.id_sequences;

create synonym 'informix'.note
for common_oltp:'informix'.note;

create synonym 'informix'.note_type_lu
for common_oltp:'informix'.note_type_lu;

create synonym 'informix'.notify_lu
for common_oltp:'informix'.notify_lu;

create synonym 'informix'.notify_type_lu
for common_oltp:'informix'.notify_type_lu;

create synonym 'informix'.password_recovery
for common_oltp:'informix'.password_recovery;

create synonym 'informix'.phone
for common_oltp:'informix'.phone;

create synonym 'informix'.preference_group_lu
for common_oltp:'informix'.preference_group_lu;

create synonym 'informix'.preference_lu
for common_oltp:'informix'.preference_lu;

create synonym 'informix'.preference_type_lu
for common_oltp:'informix'.preference_type_lu;

create synonym 'informix'.preference_value
for common_oltp:'informix'.preference_value;

create synonym 'informix'.professor
for common_oltp:'informix'.professor;

create synonym 'informix'.professor_status_lu
for common_oltp:'informix'.professor_status_lu;

create synonym 'informix'.registration_type_lu
for common_oltp:'informix'.registration_type_lu;

create synonym 'informix'.registration_type_notify_xref
for common_oltp:'informix'.registration_type_notify_xref;

create synonym 'informix'.registration_type_preference_xref
for common_oltp:'informix'.registration_type_preference_xref;

create synonym 'informix'.school
for common_oltp:'informix'.school;

create synonym 'informix'.school_association_type_lu
for common_oltp:'informix'.school_association_type_lu;

create synonym 'informix'.school_type_lu
for common_oltp:'informix'.school_type_lu;

create synonym 'informix'.secret_question
for common_oltp:'informix'.secret_question;

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

create synonym 'informix'.state
for common_oltp:'informix'.state;

create synonym 'informix'.terms_of_use
for common_oltp:'informix'.terms_of_use;

create synonym 'informix'.terms_of_use_type
for common_oltp:'informix'.terms_of_use_type;

create synonym 'informix'.timezone_lu
for common_oltp:'informix'.timezone_lu;

create synonym 'informix'.user
for common_oltp:'informix'.user;

create synonym 'informix'.user_achievement
for common_oltp:'informix'.user_achievement;

create synonym 'informix'.user_address_xref
for common_oltp:'informix'.user_address_xref;

create synonym 'informix'.user_group_xref
for common_oltp:'informix'.user_group_xref;

create synonym 'informix'.user_note_xref
for common_oltp:'informix'.user_note_xref;

create synonym 'informix'.user_notify_xref
for common_oltp:'informix'.user_notify_xref;

create synonym 'informix'.user_preference
for common_oltp:'informix'.user_preference;

create synonym 'informix'.user_role_xref
for common_oltp:'informix'.user_role_xref;

create synonym 'informix'.user_school
for common_oltp:'informix'.user_school;

create synonym 'informix'.user_terms_of_use_xref
for common_oltp:'informix'.user_terms_of_use_xref;

create synonym 'informix'.user_security_key
for common_oltp:'informix'.user_security_key;

create synonym 'informix'.terms_of_use_agreeability_type_lu
for common_oltp:'informix'.terms_of_use_agreeability_type_lu;

create synonym 'informix'.invalid_handles
for common_oltp:'informix'.invalid_handles;

create procedure "informix".calc_seconds( start datetime year to fraction(3) , 
                                      end   datetime year to fraction(3) )
returning int;
 define x int;
   define i interval second(9) to second ;
let i = end - start;
let x = i::varchar(20)::numeric;
return x;
end procedure;
create procedure "informix".nextval(i_seqnum INTEGER)
returning int;
   define v numeric;
   define doCommit varchar(5,0);
   set lock mode to wait 5;
   set isolation to committed read;
   let doCommit = 'true';
   BEGIN
     on exception in (-535)
       let doCommit = 'false';
     end exception with resume;
     begin work;
   END
   update sequence_object set current_value = current_value +1 where id = i_seqnum;
   let v = nvl ( (select current_value from sequence_object where id = i_seqnum), -1);
   if (doCommit = 'true') then
      commit;
   end if;
   return v;
end procedure;
create procedure "informix".get_current() returning datetime year to fraction(3);
  return CURRENT;
end procedure;
create procedure "informix".proc_ratinghistory(
  i_roundId           INTEGER
, i_coderId           INTEGER 
, i_new_rating        INTEGER, i_old_rating INTEGER
, i_new_num_ratings   INTEGER, i_old_num_ratings INTEGER
, i_new_vol           INTEGER, i_old_vol INTEGER
, i_new_rating_no_vol INTEGER, i_old_rating_no_vol INTEGER 
)
  INSERT INTO rating_history
       (round_id, coder_id
       , new_rating, old_rating
       , new_num_ratings, old_num_ratings
       , new_vol, old_vol
       , new_rating_no_vol, old_rating_no_vol, timestamp)
  VALUES (i_roundId, i_coderId
       , i_new_rating, i_old_rating
       , i_new_num_ratings, i_old_num_ratings
       , i_new_vol ,  i_old_vol
       , i_new_rating_no_vol, i_old_rating_no_vol,  current year to fraction(3) );
update rating set modify_date = current year to fraction(3) where coder_id = i_coderId ;
end procedure;
create procedure "informix".jmsfix()
set lock mode to wait 5;
select consumerid, messageid, state FROM JMSMessageQueue 
WHERE EXISTS (SELECT *  FROM  JMSMessageQueue MQ1  
              WHERE JMSMessageQueue.state  < MQ1.state   
                AND JMSMessageQueue.messageId  = MQ1.messageId     
                AND JMSMessageQueue.consumerId = MQ1.consumerId) into temp jmsfix1 ;
delete from jmsmessagequeue where exists (select * from jmsfix1 where 
                    jmsmessagequeue.state = jmsfix1.state
                AND JMSMessageQueue.messageId  = jmsfix1.messageId     
                AND JMSMessageQueue.consumerId = jmsfix1.consumerId) ;
drop table jmsfix1;
end procedure;
create procedure "informix".proc_problem_insert(i_problemId decimal (10,0))
  update problem set create_date = current year to fraction(3)
  where problem_id = i_problemId;
end procedure ;
create procedure "informix".proc_coder_update(
v_oldcoder_id decimal(10,0),
v_oldquote varchar(255),v_newquote varchar (255),
v_oldlanguage_id decimal(3,0), v_newlanguage_id decimal(3,0),
v_oldcoder_type_id decimal(3,0), v_newcoder_type_id decimal(3,0),
v_oldcomp_country_code varchar(3), v_newcomp_country_code varchar(3)
)
 
      if (v_oldquote != v_newquote) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('QUOTE', v_oldquote , v_newquote, v_oldcoder_id);
      End if;

      if (v_oldcoder_type_id != v_newcoder_type_id) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('CODER_TYPE', v_oldcoder_type_id , v_newcoder_type_id, v_oldcoder_id);
      End if;

      if (v_oldlanguage_id != v_newlanguage_id) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('LANGUAGE', v_oldlanguage_id , v_newlanguage_id, v_oldcoder_id);
      End if;

      if (v_oldcomp_country_code != v_newcomp_country_code) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('COMP_COUNTRY', v_oldcomp_country_code , v_newcomp_country_code, v_oldcoder_id);
      End if;
 
   update coder set modify_date = current where coder_id = v_oldcoder_id;
end procedure;
create procedure "informix".proc_current_school_update(
old_coder_id DECIMAL(10,0),
old_school_id decimal(10,0),
new_school_id decimal(10,0),
old_gpa decimal(4,2),
new_gpa decimal(4,2),
old_gpa_scale decimal(4,2),
new_gpa_scale decimal(4,2),
old_viewable VARCHAR(1,0),
new_viewable VARCHAR(1,0)
)
 
      if (old_school_id != new_school_id or old_viewable != new_viewable or old_gpa != new_gpa or old_gpa_scale != new_gpa_scale) then
         insert into current_school_audit (coder_id, school_id, gpa, gpa_scale, viewable)
         values (old_coder_id, old_school_id, old_gpa, old_gpa_scale, old_viewable);
      End if;

      update current_school set modify_date = current where coder_id = old_coder_id;

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

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure calc_seconds(datetime,datetime) to 'public' as 'informix';

grant execute on procedure nextval(integer) to 'public' as 'informix';

grant execute on procedure get_current() to 'public' as 'informix';

grant execute on procedure proc_ratinghistory(integer,integer,integer,integer,integer,integer,integer,integer,integer,integer) to 'public' as 'informix';

grant execute on procedure jmsfix() to 'public' as 'informix';

grant execute on procedure proc_problem_insert(decimal) to 'public' as 'informix';

grant execute on procedure proc_coder_update(decimal,varchar,varchar,decimal,decimal,decimal,decimal,varchar,varchar) to 'public' as 'informix';

grant execute on procedure proc_current_school_update(decimal,decimal,decimal,decimal,decimal,decimal,decimal,varchar,varchar) to 'public' as 'informix';

grant execute on procedure millis_to_time(decimal) to 'public' as 'informix';

create trigger "informix".trig_coder_skill_modified update of coder_id,skill_id,ranking on "informix".coder_skill referencing old as old                                                                                                                            for each row
        (
        update "informix".coder_skill set "informix".coder_skill.modify_date = CURRENT year to fraction(3)  where ((skill_id = old.skill_id ) AND (coder_id = old.coder_id ) ) );
create trigger "informix".trig_skill_type_modified update of skill_type_desc,skill_type_order,status on "informix".skill_type referencing old as old                                                                                                                for each row
        (
        update "informix".skill_type set "informix".skill_type.modify_date = CURRENT year to fraction(3)  where (skill_type_id = old.skill_type_id ) );
create trigger "informix".trig_audit_coder update of quote,language_id,coder_type_id,comp_country_code on "informix".coder referencing old as old new as new                                                                                                        for each row
        (
        execute procedure "informix".proc_coder_update(old.coder_id ,old.quote ,new.quote ,old.language_id ,new.language_id ,old.coder_type_id ,new.coder_type_id ,old.comp_country_code ,new.comp_country_code ));
create trigger "informix".trig_server_connections_insert insert on "informix".server_connection referencing new as nw                                                                                                                                               for each row
        (
        insert into "informix".connection_history (coder_id,start_time,client_ip,server_id,connection_id)  values (nw.coder_id ,CURRENT year to fraction(3) ,nw.client_ip ,nw.server_id ,nw.connection_id ));
create trigger "informix".trig_server_connections_delete delete on "informix".server_connection referencing old as older                                                                                                                                            for each row
        (
        update "informix".connection_history set "informix".connection_history.end_time = CURRENT year to fraction(3)  where ((server_id = older.server_id ) AND (connection_id = older.connection_id ) ) );
create trigger "informix".trig_image_modified update of file_name,image_type_id,path_id,link,height,width on "informix".image referencing old as old                                                                                                                for each row
        (
        update "informix".image set "informix".image.modify_date = CURRENT year to fraction(3)  where (image_id = old.image_id ) );
create trigger "informix".trig_coderimagexref_modified update of display_flag on "informix".coder_image_xref referencing old as old                                                                                                                                 for each row
        (
        update "informix".coder_image_xref set "informix".coder_image_xref.modify_date = CURRENT year to fraction(3)  where ((coder_id = old.coder_id ) AND (image_id = old.image_id ) ) );
create trigger "informix".trig_path_modified update of path on "informix".path referencing old as old                                                                                                                                                               for each row
        (
        update "informix".path set "informix".path.modify_date = CURRENT year to fraction(3)  where (path_id = old.path_id ) );
create trigger "informix".trig_resume_modified update of coder_id,file_name,file_type_id,file on "informix".resume referencing old as old                                                                                                                           for each row
        (
        execute function "informix".get_current() into "informix".resume.timestamp);
create trigger "informix".trig_problem_modified update of problem_id,problem_text,problem_type_id,proposed_division_id,proposed_difficulty_id,create_date,status_id,name on "informix".problem referencing old as old                                               for each row
        (
        update "informix".problem set "informix".problem.modify_date = CURRENT year to fraction(3)  where (problem_id = old.problem_id ) );
create trigger "informix".trig_problem_inserted insert on "informix".problem referencing new as new                                                                                                                                                                 for each row
        (
        execute procedure "informix".proc_problem_insert(new.problem_id ));
create trigger "informix".trig_team_modified update of team_name,team_type,school_id on "informix".team referencing old as old                                                                                                                                      for each row
        (
        execute function "informix".get_current() into "informix".team.modify_date);
create trigger "informix".trig_coderteam_delete delete on "informix".team_coder_xref referencing old as old                                                                                                                                                         for each row
        (
        insert into "informix".audit_coder (user_id,column_name,old_value,new_value,timestamp)  values (old.coder_id ,'TEAM' ,old.team_id ,NULL ,CURRENT year to fraction(3) ));
create trigger "informix".trig_coderteam_modified update of team_id on "informix".team_coder_xref referencing old as old new as new                                                                                                                                 for each row
        (
        insert into "informix".audit_coder (user_id,column_name,old_value,new_value,timestamp)  values (old.coder_id ,'TEAM' ,old.team_id ,new.team_id ,CURRENT year to fraction(3) ));
create trigger "informix".trig_skill_modified update of skill_type_id,skill_desc,status,skill_order on "informix".skill referencing old as old                                                                                                                      for each row
        (
        update "informix".skill set "informix".skill.modify_date = CURRENT year to fraction(3)  where (skill_id = old.skill_id ) );
create trigger "informix".trig_systemtest_modified update of args,expected_result,component_id on "informix".system_test_case referencing old as old new as new                                                                                                     for each row
        (
        update "informix".system_test_case set "informix".system_test_case.modify_date = CURRENT year to fraction(3)  where ((test_case_id = old.test_case_id ) AND (component_id = old.component_id ) ) );
create trigger "informix".trig_message_insert insert on "informix".message referencing new as nw                                                                                                                                                                    for each row
        (
        execute function "informix".get_current() into "informix".message.create_date);
create trigger "informix".trig_user_message_insert insert on "informix".user_message referencing new as nw                                                                                                                                                          for each row
        (
        execute function "informix".get_current() into "informix".user_message.create_date);
create trigger "informix".trig_algo_rating_modified update of rating,vol,round_id,num_ratings,algo_rating_type_id on "informix".algo_rating referencing old as old                                                                                                  for each row
        (
        execute function "informix".get_current() into "informix".algo_rating.modify_date);
create trigger "informix".trig_season_algo_rating_modified update of rating,vol,round_id,num_ratings on "informix".season_algo_rating referencing old as old                                                                                                        for each row
        (
        execute function "informix".get_current() into "informix".season_algo_rating.modify_date);
create trigger "informix".trig_audit_current_school update of school_id,gpa,gpa_scale,viewable on "informix".current_school referencing old as old new as new                                                                                                       for each row
        (
        execute procedure "informix".proc_current_school_update(old.coder_id ,old.school_id ,new.school_id ,old.gpa ,new.gpa ,old.gpa_scale ,new.gpa_scale ,old.viewable ,new.viewable ));
create trigger "informix".trig_payment_type_modified update of payment_type_desc,show_in_profile_ind,show_details_ind,payment_reference_id,due_date_interval on "informix".payment_type_lu referencing old as old                                                   for each row
        (
        update "informix".payment_type_lu set "informix".payment_type_lu.modify_date = CURRENT year to fraction(3)  where (payment_type_id = old.payment_type_id ) );
create trigger "informix".trig_payment_detail_modified update of net_amount,date_paid,gross_amount,payment_status_id,payment_address_id,modification_rationale_id,payment_desc,payment_type_id,date_due,payment_method_id,client,algorithm_round_id,algorithm_problem_id,component_contest_id,component_project_id,studio_contest_id,digital_run_stage_id,digital_run_season_id,parent_payment_id,charity_ind,total_amount,installment_number on "informix".payment_detail referencing old as old                                   for each row
        (
        execute function "informix".get_current() into "informix".payment_detail.date_modified);
create trigger "informix".trig_payment_modified update of user_id,most_recent_detail_id,referral_payment_id,pay_referrer on "informix".payment referencing old as old                                                                                               for each row
        (
        execute function "informix".get_current() into "informix".payment.modify_date);

--BUGR-4316 : 556: Cannot create, drop, or modify an object that is external to current database.
database common_oltp;
GRANT SELECT ON 'informix'.user_security_key TO coder;


