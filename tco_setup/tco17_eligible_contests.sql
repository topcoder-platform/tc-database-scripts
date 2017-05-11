-- This script needs to run on the oltp01 database server. Login as informix and add it under /home/informix/cron_scripts/tco/ and
-- update the crontab to run the script every 5 minutes. (crontab -e)

set lock mode to wait 5;

-- DEVELOPMENT

-- Stage 1
insert into contest_project_xref
SELECT 628, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-09-01 00:00:00.000' and pp.actual_start_time <  '2016-12-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (628, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 2
insert into contest_project_xref
SELECT 629, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
--                               pp.actual_start_time >= '2016-12-01 00:00:00.000' and pp.actual_start_time <  '2017-03-01 00:00:00.000'
                               pp.actual_start_time >= '2017-02-01 00:00:00.000' and pp.actual_start_time <  '2017-02-15 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (629, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;


-- Stage 3
insert into contest_project_xref
SELECT 630, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-03-01 00:00:00.000' and pp.actual_start_time <  '2017-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (630, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30057468, 30057606) -- exclude specific challenges
   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 631, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-06-01 00:00:00.000' and pp.actual_start_time <  '2017-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (631, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;



-- UI PROTO

-- Stage 1
insert into contest_project_xref
SELECT 623, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-09-01 00:00:00.000' and pp.actual_start_time <  '2016-12-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (623, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 2
insert into contest_project_xref
SELECT 624, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
--                               pp.actual_start_time >= '2016-12-01 00:00:00.000' and pp.actual_start_time <  '2017-03-01 00:00:00.000'
                               pp.actual_start_time >= '2017-02-01 00:00:00.000' and pp.actual_start_time <  '2017-02-15 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (624, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 625, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-03-01 00:00:00.000' and pp.actual_start_time <  '2017-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (625, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 626, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-06-01 00:00:00.000' and pp.actual_start_time <  '2017-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (626, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;



-- DESIGN

-- Stage 1
insert into contest_project_xref
SELECT 618, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-09-01 00:00:00.000' and pp.actual_start_time <  '2016-12-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (618, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 2
insert into contest_project_xref
SELECT 619, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
--                               pp.actual_start_time >= '2016-12-01 00:00:00.000' and pp.actual_start_time <  '2017-03-01 00:00:00.000'
                               pp.actual_start_time >= '2017-02-01 00:00:00.000' and pp.actual_start_time <  '2017-02-15 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (619, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
  and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 620, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-03-01 00:00:00.000' and pp.actual_start_time <  '2017-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (620, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30057516) -- exclude specific challenges
   and mod(p.project_id, 2) = 0;


-- Stage 4
insert into contest_project_xref
SELECT 621, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-06-01 00:00:00.000' and pp.actual_start_time <  '2017-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (621, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;


-- F2F

-- Stage 1
insert into contest_project_xref
SELECT 613, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-09-01 00:00:00.000' and pp.actual_start_time <  '2016-12-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (613, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 2
insert into contest_project_xref
SELECT 614, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
--                               pp.actual_start_time >= '2016-12-01 00:00:00.000' and pp.actual_start_time <  '2017-03-01 00:00:00.000'
                               pp.actual_start_time >= '2017-02-01 00:00:00.000' and pp.actual_start_time <  '2017-02-15 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (614, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 615, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-03-01 00:00:00.000' and pp.actual_start_time <  '2017-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (615, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 616, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-06-01 00:00:00.000' and pp.actual_start_time <  '2017-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (616, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and mod(p.project_id, 2) = 0;


-- WIREFRAME

-- Stage 1
insert into contest_project_xref
SELECT 633, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-09-01 00:00:00.000' and pp.actual_start_time <  '2016-12-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (18)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (633, 583)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);

-- Stage 2
insert into contest_project_xref
SELECT 634, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
--                               pp.actual_start_time >= '2016-12-01 00:00:00.000' and pp.actual_start_time <  '2017-03-01 00:00:00.000'
                               pp.actual_start_time >= '2017-02-01 00:00:00.000' and pp.actual_start_time <  '2017-02-15 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (18)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (634, 583)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);

-- Stage 3
insert into contest_project_xref
SELECT 635, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-03-01 00:00:00.000' and pp.actual_start_time <  '2017-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (18)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (635, 583)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);

-- Stage 4
insert into contest_project_xref
SELECT 636, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-06-01 00:00:00.000' and pp.actual_start_time <  '2017-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (18)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (636, 583)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);


