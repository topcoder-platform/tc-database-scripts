select p.name as project_name, p.project_id as project_id, demand_work_id 
 from tc_direct_project p
where p.project_id = @tcdirectid@