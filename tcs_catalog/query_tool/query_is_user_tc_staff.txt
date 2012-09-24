SELECT u.login_id FROM common_oltp:user_role_xref u, common_oltp:security_roles s
	WHERE u.login_id = @uid@ AND s.description = "TC Staff" AND s.role_id = u.role_id