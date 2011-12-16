SELECT p.project_id, p.name as project_name FROM time_oltp:project AS p
LEFT JOIN time_oltp:client_project AS cp ON p.project_id = cp.project_id
LEFT JOIN time_oltp:client AS c ON c.client_id = cp.client_id AND (c.is_deleted = 0 OR c.is_deleted IS NULL)
WHERE
p.active = 1 AND
(p.start_date <= current AND current <= p.end_date) AND
(p.is_deleted = 0 OR p.is_deleted IS NULL) AND

p.project_id IN
(
    SELECT DISTINCT pm.project_id FROM time_oltp:project_manager pm
    INNER JOIN time_oltp:user_account ua ON pm.user_account_id = ua.user_account_id
    INNER JOIN common_oltp:user u ON ua.user_name = u.handle
    WHERE pm.active = 1 AND u.user_id = @uid@

    UNION

    SELECT DISTINCT pw.project_id FROM time_oltp:project_worker pw
    INNER JOIN time_oltp:user_account ua ON pw.user_account_id = ua.user_account_id
    INNER JOIN common_oltp:user u ON ua.user_name = u.handle
    WHERE pw.start_date <= current AND current <= pw.end_date AND pw.active = 1 AND u.user_id = @uid@
)

ORDER BY UPPER(p.name)