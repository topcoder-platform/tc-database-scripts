DATABASE tcs_catalog;
INSERT INTO rboard_user SELECT u.user_id, c.project_category_id, 12, 100, 0
                        FROM user u, project_category_lu c
                        WHERE c.project_type_id = 3;

INSERT INTO review_resp (review_resp_id, review_resp_name, phase_id, resource_role_id) 
       VALUES (68, 'Wireframes Reviewer', 129, 4);
