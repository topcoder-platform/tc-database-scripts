database time_oltp;

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
CREATE PROCEDURE moverate()
	DEFINE rateid INTEGER;
	DEFINE rate_tmp MONEY(7,3);

	ALTER TABLE rate MODIFY rate MONEY(7,3) NOT NULL;
	ALTER TABLE comp_rate ADD rate MONEY(7,3) BEFORE creation_date;

	FOREACH cursor1 FOR SELECT rate_id INTO rateid FROM comp_rate
		SELECT rate INTO rate_tmp FROM rate WHERE rate_id = rateid;
		UPDATE comp_rate SET rate = rate_tmp WHERE rate_id = rateid;
	END FOREACH

	ALTER TABLE comp_rate MODIFY rate MONEY(7,3) NOT NULL;
	ALTER TABLE rate DROP rate;
END PROCEDURE;
CREATE PROCEDURE address_relation()
	DEFINE user_account_id_var INTEGER;
	DEFINE user_address_id_var INTEGER;
	DEFINE user_creation_date_var DATETIME YEAR TO SECOND;
	DEFINE user_creation_user_var VARCHAR(64);
	DEFINE user_modification_date_var DATETIME YEAR TO SECOND;
	DEFINE user_modification_user_var VARCHAR(64);
	DEFINE company_id_var INTEGER;
	DEFINE company_address_id_var INTEGER;
	DEFINE company_creation_date_var DATETIME YEAR TO SECOND;
	DEFINE company_creation_user_var VARCHAR(64);
	DEFINE company_modification_date_var DATETIME YEAR TO SECOND;
	DEFINE company_modification_user_var VARCHAR(64);

	FOREACH cursor1 FOR SELECT user_account_id, address_id, creation_date, creation_user, modification_date, modification_user INTO user_account_id_var, user_address_id_var, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var FROM user_address
		INSERT INTO address_relation (entity_id, address_type_id, creation_date, creation_user, modification_date, modification_user, address_id) VALUES (user_account_id_var, 4, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var, user_address_id_var);
	END FOREACH

	FOREACH cursor2 FOR SELECT company_id, address_id, creation_date, creation_user, modification_date, modification_user INTO company_id_var, company_address_id_var, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var FROM company_address
		INSERT INTO address_relation (entity_id, address_type_id, creation_date, creation_user, modification_date, modification_user, address_id) VALUES (company_id_var, 3, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var, company_address_id_var);
	END FOREACH
END PROCEDURE;
CREATE PROCEDURE contact_relation()
	DEFINE user_account_id_var INTEGER;
	DEFINE user_contact_id_var INTEGER;
	DEFINE user_creation_date_var DATETIME YEAR TO SECOND;
	DEFINE user_creation_user_var VARCHAR(64);
	DEFINE user_modification_date_var DATETIME YEAR TO SECOND;
	DEFINE user_modification_user_var VARCHAR(64);
	DEFINE company_id_var INTEGER;
	DEFINE company_contact_id_var INTEGER;
	DEFINE company_creation_date_var DATETIME YEAR TO SECOND;
	DEFINE company_creation_user_var VARCHAR(64);
	DEFINE company_modification_date_var DATETIME YEAR TO SECOND;
	DEFINE company_modification_user_var VARCHAR(64);

	FOREACH cursor1 FOR SELECT user_account_id, contact_id, creation_date, creation_user, modification_date, modification_user INTO user_account_id_var, user_contact_id_var, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var FROM user_contact
		INSERT INTO contact_relation (entity_id, creation_date, creation_user, modification_date, modification_user, contact_id, contact_type_id) VALUES (user_account_id_var, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var, user_contact_id_var, 4);
	END FOREACH

	FOREACH cursor2 FOR SELECT company_id, contact_id, creation_date, creation_user, modification_date, modification_user INTO company_id_var, company_contact_id_var, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var FROM company_contact
		INSERT INTO contact_relation (entity_id, creation_date, creation_user, modification_date, modification_user, contact_id, contact_type_id) VALUES (company_id_var, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var, company_contact_id_var, 3);
	END FOREACH
END PROCEDURE;
CREATE PROCEDURE client_proj_addr_contact()
	DEFINE max_address_id INTEGER;
	DEFINE max_contact_id INTEGER;
	DEFINE client_id_var INTEGER;
	DEFINE project_id_var INTEGER;

	SELECT MAX(address_id)+20 INTO max_address_id FROM address;
	SELECT MAX(contact_id)+20 INTO max_contact_id FROM contact;

	FOREACH cursor1 FOR SELECT client_id INTO client_id_var FROM client
		INSERT INTO address(address_id, line1, city, country_name_id, state_name_id, zip_code, creation_date, creation_user, modification_date, modification_user) VALUES(max_address_id, '703 Hebron Avenue', 'Glastonbury', 840, 7, '06033', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO address_relation(entity_id, address_type_id, address_id, creation_date, creation_user, modification_date, modification_user) VALUES(client_id_var, 2, max_address_id, CURRENT, 'System', CURRENT, 'System');

		INSERT INTO contact(contact_id, first_name, last_name, phone, email, creation_date, creation_user, modification_date, modification_user) VALUES(max_contact_id, 'Bogus name', 'Auto generated', '860-633-5540', 'notexistent@topcoder.com', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO contact_relation(entity_id, contact_type_id, contact_id, creation_date, creation_user, modification_date, modification_user) VALUES(client_id_var, 2, max_contact_id, CURRENT, 'System', CURRENT, 'System');
		
		SELECT MAX(address_id)+1 INTO max_address_id FROM address;
		SELECT MAX(contact_id)+1 INTO max_contact_id FROM contact;
	END FOREACH

	SELECT MAX(address_id)+20 INTO max_address_id FROM address;
	SELECT MAX(contact_id)+20 INTO max_contact_id FROM contact;

	FOREACH cursor1 FOR SELECT project_id INTO project_id_var FROM project
		INSERT INTO address(address_id, line1, city, country_name_id, state_name_id, zip_code, creation_date, creation_user, modification_date, modification_user) VALUES(max_address_id, '703 Hebron Avenue', 'Glastonbury', 840, 7, '06033', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO address_relation(entity_id, address_type_id, address_id, creation_date, creation_user, modification_date, modification_user) VALUES(project_id_var, 1, max_address_id, CURRENT, 'System', CURRENT, 'System');

		INSERT INTO contact(contact_id, first_name, last_name, phone, email, creation_date, creation_user, modification_date, modification_user) VALUES(max_contact_id, 'Bogus name', 'Auto generated', '860-633-5540', 'notexistent@topcoder.com', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO contact_relation(entity_id, contact_type_id, contact_id, creation_date, creation_user, modification_date, modification_user) VALUES(project_id_var, 1, max_contact_id, CURRENT, 'System', CURRENT, 'System');
		
		SELECT MAX(address_id)+1 INTO max_address_id FROM address;
		SELECT MAX(contact_id)+1 INTO max_contact_id FROM contact;
	END FOREACH
END PROCEDURE;
CREATE PROCEDURE project_relation()
	DEFINE client_id_var INTEGER;
	DEFINE project_id_var INTEGER;
	DEFINE entry_id_var INTEGER;

	FOREACH cursor1 FOR SELECT project_id, time_entry_id INTO project_id_var, entry_id_var FROM project_time
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE time_entry SET client_id = client_id_var, project_id = project_id_var WHERE time_entry.time_entry_id = entry_id_var;
	END FOREACH

	DELETE FROM time_entry WHERE client_id IS NULL AND project_id IS NULL;

	ALTER TABLE time_entry MODIFY client_id INTEGER NOT NULL;
	ALTER TABLE time_entry MODIFY project_id INTEGER NOT NULL;

	FOREACH cursor1 FOR SELECT project_id, expense_entry_id INTO project_id_var, entry_id_var FROM project_expense
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE expense_entry SET client_id = client_id_var, project_id = project_id_var WHERE expense_entry.expense_entry_id = entry_id_var;
	END FOREACH

	DELETE FROM expense_entry WHERE client_id IS NULL AND project_id IS NULL;

	ALTER TABLE expense_entry MODIFY client_id INTEGER NOT NULL;
	ALTER TABLE expense_entry MODIFY project_id INTEGER NOT NULL;

	FOREACH cursor1 FOR SELECT project_id, fix_bill_entry_id INTO project_id_var, entry_id_var FROM project_fix_bill
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE fix_bill_entry SET client_id = client_id_var, project_id = project_id_var WHERE fix_bill_entry.fix_bill_entry_id = entry_id_var;
	END FOREACH
END PROCEDURE;

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure millis_to_time(decimal) to 'public' as 'informix';

grant execute on procedure moverate() to 'public' as 'informix';

grant execute on procedure address_relation() to 'public' as 'informix';

grant execute on procedure contact_relation() to 'public' as 'informix';

grant execute on procedure client_proj_addr_contact() to 'public' as 'informix';

grant execute on procedure project_relation() to 'public' as 'informix';

create trigger "informix".trig_insert_account_status insert on "informix".account_status referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.account_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_account_status update on "informix".account_status referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.account_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_account_status delete on "informix".account_status referencing old as pre                                                                                                                                                     for each row
        (
        insert into "informix".account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.account_status_id ,pre.description ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_state_name insert on "informix".state_name referencing new as post                                                                                                                                                            for each row
        (
        insert into "informix".state_name_audit (audit_action_id,state_name_id,name,abbreviation,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.state_name_id ,post.name ,post.abbreviation ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_state_name update on "informix".state_name referencing new as post                                                                                                                                                            for each row
        (
        insert into "informix".state_name_audit (audit_action_id,state_name_id,name,abbreviation,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.state_name_id ,post.name ,post.abbreviation ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_state_name delete on "informix".state_name referencing old as pre                                                                                                                                                             for each row
        (
        insert into "informix".state_name_audit (audit_action_id,state_name_id,name,abbreviation,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.state_name_id ,pre.name ,pre.abbreviation ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_reject_reason insert on "informix".reject_reason referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.reject_reason_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_reject_reason update on "informix".reject_reason referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.reject_reason_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_reject_reason delete on "informix".reject_reason referencing old as pre                                                                                                                                                       for each row
        (
        insert into "informix".reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.reject_reason_id ,pre.description ,pre.active ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_address insert on "informix".address referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.address_id ,post.line1 ,post.line2 ,post.city ,post.state_name_id ,post.zip_code ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_address update on "informix".address referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.address_id ,post.line1 ,post.line2 ,post.city ,post.state_name_id ,post.zip_code ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_address delete on "informix".address referencing old as pre                                                                                                                                                                          for each row
        (
        insert into "informix".address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.address_id ,pre.line1 ,pre.line2 ,pre.city ,pre.state_name_id ,pre.zip_code ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_company insert on "informix".company referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.company_id ,post.name ,post.passcode ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_company update on "informix".company referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.company_id ,post.name ,post.passcode ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_company delete on "informix".company referencing old as pre                                                                                                                                                                   for each row
        (
        insert into "informix".company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.company_id ,pre.name ,pre.passcode ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_user_account insert on "informix".user_account referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.user_account_id ,post.company_id ,post.account_status_id ,post.user_name ,post.password ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_user_account update on "informix".user_account referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.user_account_id ,post.company_id ,post.account_status_id ,post.user_name ,post.password ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_user_account delete on "informix".user_account referencing old as pre                                                                                                                                                         for each row
        (
        insert into "informix".user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.user_account_id ,pre.company_id ,pre.account_status_id ,pre.user_name ,pre.password ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_contact insert on "informix".contact referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.contact_id ,post.first_name ,post.last_name ,post.phone ,post.email ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_contact update on "informix".contact referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.contact_id ,post.first_name ,post.last_name ,post.phone ,post.email ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_contact delete on "informix".contact referencing old as pre                                                                                                                                                                   for each row
        (
        insert into "informix".contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.contact_id ,pre.first_name ,pre.last_name ,pre.phone ,pre.email ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_comp_rej_reason insert on "informix".comp_rej_reason referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.company_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_comp_rej_reason update on "informix".comp_rej_reason referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.company_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_comp_rej_reason delete on "informix".comp_rej_reason referencing old as pre                                                                                                                                                   for each row
        (
        insert into "informix".comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.company_id ,pre.reject_reason_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_reject_email insert on "informix".reject_email referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.reject_email_id ,post.body ::varchar(255) ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_reject_email update on "informix".reject_email referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.reject_email_id ,post.body ::varchar(255) ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_reject_email delete on "informix".reject_email referencing old as pre                                                                                                                                                         for each row
        (
        insert into "informix".reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.reject_email_id ,pre.body ::varchar(255) ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_expense_status insert on "informix".expense_status referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.expense_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_expense_status update on "informix".expense_status referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.expense_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_expense_status delete on "informix".expense_status referencing old as pre                                                                                                                                                     for each row
        (
        insert into "informix".expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.expense_status_id ,pre.description ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_expense_type insert on "informix".expense_type referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.expense_type_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_expense_type update on "informix".expense_type referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.expense_type_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_expense_type delete on "informix".expense_type referencing old as pre                                                                                                                                                         for each row
        (
        insert into "informix".expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.expense_type_id ,pre.description ,pre.active ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_expense_entry insert on "informix".expense_entry referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.expense_entry_id ,post.company_id ,post.expense_type_id ,post.expense_status_id ,post.description ,post.entry_date ,post.amount ,post.billable ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_expense_entry update on "informix".expense_entry referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.expense_entry_id ,post.company_id ,post.expense_type_id ,post.expense_status_id ,post.description ,post.entry_date ,post.amount ,post.billable ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_expense_entry delete on "informix".expense_entry referencing old as pre                                                                                                                                                       for each row
        (
        insert into "informix".expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.expense_entry_id ,pre.company_id ,pre.expense_type_id ,pre.expense_status_id ,pre.description ,pre.entry_date ,pre.amount ,pre.billable ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_exp_reject_reason insert on "informix".exp_reject_reason referencing new as post                                                                                                                                              for each row
        (
        insert into "informix".exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.expense_entry_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_exp_reject_reason update on "informix".exp_reject_reason referencing new as post                                                                                                                                              for each row
        (
        insert into "informix".exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.expense_entry_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_exp_reject_reason delete on "informix".exp_reject_reason referencing old as pre                                                                                                                                               for each row
        (
        insert into "informix".exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.expense_entry_id ,pre.reject_reason_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_comp_exp_type insert on "informix".comp_exp_type referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.company_id ,post.expense_type_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_comp_exp_type update on "informix".comp_exp_type referencing new as post                                                                                                                                                      for each row
        (
        insert into "informix".comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.company_id ,post.expense_type_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_comp_exp_type delete on "informix".comp_exp_type referencing old as pre                                                                                                                                                       for each row
        (
        insert into "informix".comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.company_id ,pre.expense_type_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_project insert on "informix".project referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.project_id ,post.company_id ,post.name ,post.description ,post.start_date ,post.end_date ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_project update on "informix".project referencing new as post                                                                                                                                                                  for each row
        (
        insert into "informix".project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.project_id ,post.company_id ,post.name ,post.description ,post.start_date ,post.end_date ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_project delete on "informix".project referencing old as pre                                                                                                                                                                   for each row
        (
        insert into "informix".project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.project_id ,pre.company_id ,pre.name ,pre.description ,pre.start_date ,pre.end_date ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_project_expense insert on "informix".project_expense referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)  values (1 ,post.project_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ,post.expense_entry_id ));
create trigger "informix".trig_update_project_expense update on "informix".project_expense referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)  values (2 ,post.project_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ,post.expense_entry_id ));
create trigger "informix".trig_delete_project_expense delete on "informix".project_expense referencing old as pre                                                                                                                                                   for each row
        (
        insert into "informix".project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)  values (3 ,pre.project_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ,pre.expense_entry_id ));
create trigger "informix".trig_insert_time_status insert on "informix".time_status referencing new as post                                                                                                                                                          for each row
        (
        insert into "informix".time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.time_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_time_status update on "informix".time_status referencing new as post                                                                                                                                                          for each row
        (
        insert into "informix".time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.time_status_id ,post.description ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_time_status delete on "informix".time_status referencing old as pre                                                                                                                                                           for each row
        (
        insert into "informix".time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.time_status_id ,pre.description ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_task_type insert on "informix".task_type referencing new as post                                                                                                                                                              for each row
        (
        insert into "informix".task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.task_type_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_task_type update on "informix".task_type referencing new as post                                                                                                                                                              for each row
        (
        insert into "informix".task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.task_type_id ,post.description ,post.active ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_task_type delete on "informix".task_type referencing old as pre                                                                                                                                                               for each row
        (
        insert into "informix".task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.task_type_id ,pre.description ,pre.active ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_time_entry insert on "informix".time_entry referencing new as post                                                                                                                                                            for each row
        (
        insert into "informix".time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.time_entry_id ,post.company_id ,post.time_status_id ,post.task_type_id ,post.description ,post.entry_date ,post.hours ,post.billable ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_time_entry update on "informix".time_entry referencing new as post                                                                                                                                                            for each row
        (
        insert into "informix".time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.time_entry_id ,post.company_id ,post.time_status_id ,post.task_type_id ,post.description ,post.entry_date ,post.hours ,post.billable ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_time_entry delete on "informix".time_entry referencing old as pre                                                                                                                                                             for each row
        (
        insert into "informix".time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.time_entry_id ,pre.company_id ,pre.time_status_id ,pre.task_type_id ,pre.description ,pre.entry_date ,pre.hours ,pre.billable ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_time_reject_reason insert on "informix".time_reject_reason referencing new as post                                                                                                                                            for each row
        (
        insert into "informix".time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.time_entry_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_time_reject_reason update on "informix".time_reject_reason referencing new as post                                                                                                                                            for each row
        (
        insert into "informix".time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.time_entry_id ,post.reject_reason_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_time_reject_reason delete on "informix".time_reject_reason referencing old as pre                                                                                                                                             for each row
        (
        insert into "informix".time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.time_entry_id ,pre.reject_reason_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_comp_task_type insert on "informix".comp_task_type referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.company_id ,post.task_type_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_comp_task_type update on "informix".comp_task_type referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.company_id ,post.task_type_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_comp_task_type delete on "informix".comp_task_type referencing old as pre                                                                                                                                                     for each row
        (
        insert into "informix".comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.company_id ,pre.task_type_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_project_time insert on "informix".project_time referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.project_id ,post.time_entry_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_project_time update on "informix".project_time referencing new as post                                                                                                                                                        for each row
        (
        insert into "informix".project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.project_id ,post.time_entry_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_project_time delete on "informix".project_time referencing old as pre                                                                                                                                                         for each row
        (
        insert into "informix".project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.project_id ,pre.time_entry_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_project_manager insert on "informix".project_manager referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.project_id ,post.user_account_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_project_manager update on "informix".project_manager referencing new as post                                                                                                                                                  for each row
        (
        insert into "informix".project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.project_id ,post.user_account_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_project_manager delete on "informix".project_manager referencing old as pre                                                                                                                                                   for each row
        (
        insert into "informix".project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.project_id ,pre.user_account_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_project_worker insert on "informix".project_worker referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.project_id ,post.user_account_id ,post.start_date ,post.end_date ,post.pay_rate ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_project_worker update on "informix".project_worker referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.project_id ,post.user_account_id ,post.start_date ,post.end_date ,post.pay_rate ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_project_worker delete on "informix".project_worker referencing old as pre                                                                                                                                                     for each row
        (
        insert into "informix".project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.project_id ,pre.user_account_id ,pre.start_date ,pre.end_date ,pre.pay_rate ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_client insert on "informix".client referencing new as post                                                                                                                                                                    for each row
        (
        insert into "informix".client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.client_id ,post.name ,post.company_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_client update on "informix".client referencing new as post                                                                                                                                                                    for each row
        (
        insert into "informix".client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.client_id ,post.name ,post.company_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_client delete on "informix".client referencing old as pre                                                                                                                                                                     for each row
        (
        insert into "informix".client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,pre.client_id ,pre.name ,pre.company_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));
create trigger "informix".trig_insert_client_project insert on "informix".client_project referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)  values (1 ,post.client_id ,post.project_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_update_client_project update on "informix".client_project referencing new as post                                                                                                                                                    for each row
        (
        insert into "informix".client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)  values (2 ,post.client_id ,post.project_id ,post.creation_date ,post.creation_user ,post.modification_date ,post.modification_user ));
create trigger "informix".trig_delete_client_project delete on "informix".client_project referencing old as pre                                                                                                                                                     for each row
        (
        insert into "informix".client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)  values (3 ,pre.client_id ,pre.project_id ,pre.creation_date ,pre.creation_user ,pre.modification_date ,pre.modification_user ));


CREATE SYNONYM client_company FOR company;

create synonym 'informix'.project_category_lu
for tcs_catalog:'informix'.project_category_lu;

 

