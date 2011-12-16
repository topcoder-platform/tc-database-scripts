SELECT p.project_id, p.name as project_name FROM time_oltp:project AS p
WHERE
p.project_id = @pj@