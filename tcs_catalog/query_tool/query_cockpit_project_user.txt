select d.project_id
from  project p, corporate_oltp:tc_direct_project d
where p.tc_direct_project_id = d.project_id
and p.project_id = @pj@
and d.project_id in
(
select distinct tdp.project_id
from corporate_oltp:user_permission_grant g,
     user u,
     tc_direct_project tdp
where is_studio = 0
  and u.user_id = g.user_id
  and g.resource_id = tdp.project_id
  and u.user_id = @uid@
)