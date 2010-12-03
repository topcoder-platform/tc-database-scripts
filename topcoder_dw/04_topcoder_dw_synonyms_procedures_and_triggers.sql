database topcoder_dw;

create synonym 'informix'.rating_dim
for common_dw:'informix'.rating_dim;

create procedure "informix".category_list( i_problem_id decimal(12)  )
returning nvarchar(255);

define o_cat_list nvarchar(255);
define t_cat_desc nvarchar(255);

let o_cat_list = "";

foreach
  select
    l.problem_category_desc
  into t_cat_desc
  from
    problem_category_lu l,
    problem_category_xref x
  where
    x.problem_id = i_problem_id and
    x.problem_category_id = l.problem_category_id
  order by l.problem_category_desc

  if length(o_cat_list) = 0 then
    let o_cat_list = t_cat_desc;
  else
    let o_cat_list = o_cat_list || ", " || t_cat_desc;
  end if

end foreach

return o_cat_list;

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

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure category_list(decimal) to 'public' as 'informix';

grant execute on procedure millis_to_time(decimal) to 'public' as 'informix';

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

create trigger "informix".trig_coder_update update of handle on "informix".coder referencing old as o new as n                                                                                                                                                      for each row
        (
        execute function "informix".lower(n.handle ) into "informix".coder.handle_lower);
create trigger "informix".trig_coder_insert insert on "informix".coder referencing new as n                                                                                                                                                                         for each row
        (
        execute function "informix".lower(n.handle ) into "informix".coder.handle_lower);

