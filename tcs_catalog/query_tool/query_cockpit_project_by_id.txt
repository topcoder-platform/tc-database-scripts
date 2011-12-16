SELECT project_id AS tc_direct_project_id, name AS tc_direct_project_name
FROM corporate_oltp:tc_direct_project
WHERE project_id = @pj@