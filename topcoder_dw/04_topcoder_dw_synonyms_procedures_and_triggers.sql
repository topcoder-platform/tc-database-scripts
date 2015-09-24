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
        
-- create stored procedure to get current time
create procedure "informix".get_current() returning datetime year to fraction(3);
  return CURRENT;
end procedure;

-- coder
create trigger "informix".coder_update update on "informix".coder
for each row
(
  execute function "informix".get_current() into "informix".coder.dw_stats_updated_time
);

create trigger "informix".coder_insert insert on "informix".coder
for each row
(
  execute function "informix".get_current() into "informix".coder.dw_stats_updated_time
);

-- algo_rating
create trigger "informix".algo_rating_update update on "informix".algo_rating
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".algo_rating_insert insert on "informix".algo_rating
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- coder_rank
create trigger "informix".coder_rank_update update on "informix".coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".coder_rank_insert insert on "informix".coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- coder_rank_history
create trigger "informix".coder_rank_history_update update on "informix".coder_rank_history
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".coder_rank_history_insert insert on "informix".coder_rank_history
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- country_coder_rank
create trigger "informix".country_coder_rank_update update on "informix".country_coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".country_coder_rank_insert insert on "informix".country_coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- school_coder_rank
create trigger "informix".school_coder_rank_update update on "informix".school_coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".school_coder_rank_insert insert on "informix".school_coder_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- coder_level
create trigger "informix".coder_level_update update on "informix".coder_level
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".coder_level_insert insert on "informix".coder_level
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- room_result
create trigger "informix".room_result_update update on "informix".room_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".room_result_insert insert on "informix".room_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

-- long_comp_result
create trigger "informix".long_comp_result_update update on "informix".long_comp_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

create trigger "informix".long_comp_result_insert insert on "informix".long_comp_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.coder_id
);

