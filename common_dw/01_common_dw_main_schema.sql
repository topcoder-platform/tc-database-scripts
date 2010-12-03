CREATE DATABASE common_dw IN datadbs;
database common_dw;

grant dba to informix ;
grant connect to coder ;
-- User public does not have connect privilege;
create table 'informix'.rating_dim (
    rating_id INT,
    rating INT,
    color VARCHAR(20),
    color_desc VARCHAR(20),
    color_sort INT
)
extent size 360 next size 64
lock mode row;

revoke all on rating_dim from 'public';
alter table 'informix'.rating_dim add constraint primary key 
	(rating_id)
	constraint ratingdim_pkey;

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

