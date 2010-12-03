database jive;

create synonym "informix".coder for informixoltp:"informix".coder;
create synonym "informix".image for informixoltp:"informix".image;
create synonym "informix".path for informixoltp:"informix".path;
create synonym "informix".coder_image_xref for informixoltp:"informix".coder_image_xref;
create synonym "informix".command for informixoltp:"informix".command;
create synonym "informix".query for informixoltp:"informix".query;
create synonym "informix".command_query_xref for informixoltp:"informix".command_query_xref;
create synonym "informix".query_input_xref for informixoltp:"informix".query_input_xref;
create synonym "informix".input_lu for informixoltp:"informix".input_lu;
create synonym "informix".data_type for informixoltp:"informix".data_type;
create synonym "informix".user for common_oltp:"informix".user;
create synonym "informix".email for common_oltp:"informix".email;

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


grant  execute on function "informix".millis_to_time (decimal) to "public" as "informix";

revoke usage on language SPL from public ;

grant usage on language SPL to public ;


create view "informix".jiveuser (userid,username,passwordhash,name,namevisible,email,emailvisible,creationdate,modificationdate) as 
  select x0.user_id ,x0.handle ,x0.password ,'' ,0 ,x1.address 
    ,0 ,0 ,0 from common_oltp:"informix".user x0 ,common_oltp:
    "informix".email x1 where ((x0.user_id = x1.user_id ) AND 
    (x1.primary_ind = 1. ) ) ;      