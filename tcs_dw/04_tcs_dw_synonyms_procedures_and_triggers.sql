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
