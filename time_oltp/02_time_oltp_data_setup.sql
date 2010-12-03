database time_oltp;

-- Work in progress


INSERT INTO id_sequences (name, next_block_start, block_size, exhausted) VALUES ('client_id', 1, 20, 0);
INSERT INTO id_sequences (name, next_block_start, block_size, exhausted) VALUES ('client_status_id', 1, 20, 0);
INSERT INTO id_sequences (name, next_block_start, block_size, exhausted)
       VALUES ('com.topcoder.clients.manager.dao.DAOCompanyManager', 1, 20, 0);
INSERT INTO id_sequences (name, next_block_start, block_size, exhausted)
       VALUES ('com.topcoder.clients.manager.dao.DAOClientManager', 1, 20, 0);
INSERT INTO id_sequences (name, next_block_start, block_size, exhausted)
       VALUES ('com.topcoder.clients.manager.dao.DAOProjectManager', 1, 20, 0);


INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.security.authorization.Action',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.security.authorization.ActionContext',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.security.authorization.Principal',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.security.authorization.SecurityRole',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('TimeTrackerID',60000001,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('TimeTrackerUser',50000001,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.user.User',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.RejectReason',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.Company',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.RejectEmail',1,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.TaskType',500000,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.TimeEntry',600000,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.TimeStatus',700000000,20,0);
INSERT INTO id_sequences (name,next_block_start,block_size,exhausted) VALUES('com.topcoder.timetracker.entry.time.MileageRate',1,20,0);
INSERT INTO id_sequences (name, next_block_start, block_size,exhausted) VALUES ('com.topcoder.clients.model.User', 22800000, 10, 0);

insert into audit_action values (1, 'Insert', current, 'test', current, 'test');
insert into audit_action values (2, 'Update', current, 'test', current, 'test');
