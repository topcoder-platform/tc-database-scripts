database tcs_dw;

create synonym 'informix'.calendar
for topcoder_dw:'informix'.calendar;

create synonym 'informix'.calendar_month
for topcoder_dw:'informix'.calendar_month;

create synonym 'informix'.calendar_week
for topcoder_dw:'informix'.calendar_week;

create synonym 'informix'.coder
for topcoder_dw:'informix'.coder;

create synonym 'informix'.country
for topcoder_dw:'informix'.country;

create synonym 'informix'.current_school
for topcoder_dw:'informix'.current_school;

create synonym 'informix'.payment
for topcoder_dw:'informix'.payment;

create synonym 'informix'.rating_dim
for common_dw:'informix'.rating_dim;

create synonym 'informix'.time
for topcoder_dw:'informix'.time;

create synonym 'informix'.user_payment
for topcoder_dw:'informix'.user_payment;

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

-- design_project_result
create trigger "informix".design_project_result_update update on "informix".design_project_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".design_project_result_insert insert on "informix".design_project_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- project_result
create trigger "informix".project_result_update update on "informix".project_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".project_result_insert insert on "informix".project_result
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- user_rating
create trigger "informix".user_rating_update update on "informix".user_rating
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".user_rating_insert insert on "informix".user_rating
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- user_reliability
create trigger "informix".user_reliability_update update on "informix".user_reliability
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".user_reliability_insert insert on "informix".user_reliability
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- user_rank
create trigger "informix".user_rank_update update on "informix".user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".user_rank_insert insert on "informix".user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- school_user_rank
create trigger "informix".school_user_rank_update update on "informix".school_user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".school_user_rank_insert insert on "informix".school_user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- country_user_rank
create trigger "informix".country_user_rank_update update on "informix".country_user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".country_user_rank_insert insert on "informix".country_user_rank
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

-- copilot_statistics
create trigger "informix".copilot_statistics_update update on "informix".copilot_statistics
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);

create trigger "informix".copilot_statistics_insert insert on "informix".copilot_statistics
referencing new as new for each row
(
  update "informix".coder set dw_stats_updated_time=current where coder_id=new.user_id
);
