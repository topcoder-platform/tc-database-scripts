DATABASE time_oltp;

INSERT INTO 'informix'.account_status (account_status_id,  description, creation_date, creation_user,  
                                       modification_date,  modification_user) 
       VALUES(1, 'active', CURRENT, '', CURRENT, '');
INSERT INTO 'informix'.project_status VALUES (1, 'Active', 'Active', 0, current, 'admin', current, 'admin');
insert into 'informix'.client_status values (1, 'Active', 'Active', 0, current, 'admin', current, 'admin');
