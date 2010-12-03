database corporate_oltp;



create synonym "informix".user for common_oltp:"informix".user;
create synonym "informix".company for common_oltp:"informix".company;
create synonym "informix".contact for common_oltp:"informix".contact;
create synonym "informix".phone for common_oltp:"informix".phone;
create synonym "informix".address for common_oltp:"informix".address;
create synonym "informix".country for common_oltp:"informix".country;
create synonym "informix".email for common_oltp:"informix".email;
create synonym "informix".state for common_oltp:"informix".state;
create synonym "informix".user_address_xref for common_oltp:"informix".user_address_xref;
create synonym "informix".security_roles for common_oltp:"informix".security_roles;
create synonym "informix".user_group_xref for common_oltp:"informix".user_group_xref;
create synonym "informix".security_user for common_oltp:"informix".security_user;
create synonym "informix".user_role_xref for common_oltp:"informix".user_role_xref;
create synonym "informix".security_groups for common_oltp:"informix".security_groups;
create synonym "informix".key_generation for common_oltp:"informix".key_generation;
create synonym "informix".security_perms for common_oltp:"informix".security_perms;
create synonym "informix".group_role_xref for common_oltp:"informix".group_role_xref;
create synonym "informix".sequence_object for common_oltp:"informix".sequence_object;
create synonym "informix".terms_of_use for common_oltp:"informix".terms_of_use;
create synonym "informix".user_terms_of_use_xref for common_oltp:"informix".user_terms_of_use_xref;
create synonym "informix".timezone_lu for common_oltp:"informix".timezone_lu;




create procedure "informix".get_current() returning datetime year to
fraction(3);
  return CURRENT;
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


grant  execute on function "informix".get_current () to "public" as "informix";
grant  execute on function "informix".nextval (integer) to "public" as "informix";



create trigger "informix".unit_type_lu_upd update of unit_type_desc 
    on "informix".unit_type_lu referencing old as o new as n
    for each row
        (
        execute function "informix".get_current() into "informix"
    .unit_type_lu.modify_date);

create trigger "informix".unit_upd update of unit_desc,unit_type_id 
    on "informix".unit referencing old as o new as n
    for each row
        (
        execute function "informix".get_current() into "informix"
    .unit.modify_date);

create trigger "informix".product_upd update of product_desc,
    cost on "informix".product referencing old as o new as n
    for each row
        (
        execute function "informix".get_current() into "informix"
    .product.modify_date);

create trigger "informix".purchase_upd update of company_id,product_id,
    start_date,end_date,paid on "informix".purchase referencing 
    old as o new as n
    for each row
        (
        execute function "informix".get_current() into "informix"
    .purchase.modify_date);

create trigger "informix".product_unit_xref_upd update of num_units 
    on "informix".product_unit_xref referencing old as o new as 
    n
    for each row
        (
        execute function "informix".get_current() into "informix"
    .product_unit_xref.modify_date);








