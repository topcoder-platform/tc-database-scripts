SELECT p.project_id, p.name as project_name FROM time_oltp:project AS p
LEFT JOIN time_oltp:client_project AS cp ON p.project_id = cp.project_id
LEFT JOIN time_oltp:client AS c ON c.client_id = cp.client_id AND (c.is_deleted = 0 OR c.is_deleted IS NULL)
WHERE
p.active = 1 AND
(p.start_date <= current AND current <= p.end_date) AND
(p.is_deleted = 0 OR p.is_deleted IS NULL)
ORDER BY UPPER(p.name)