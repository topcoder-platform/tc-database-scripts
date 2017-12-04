-- This script needs to run on the oltp01 database server. Login as informix and add it under /home/informix/cron_scripts/tco/ and
-- update the crontab to run the script every 5 minutes. (crontab -e)

set lock mode to wait 5;

-- DEVELOPMENT

-- Stage 1
insert into contest_project_xref
SELECT 653, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-08-01 00:00:00.000' and pp.actual_start_time <  '2017-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (653, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 2
insert into contest_project_xref
SELECT 654, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-11-01 00:00:00.000' and pp.actual_start_time <  '2018-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (654, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30059771) -- exceptions to exclude
--   and mod(p.project_id, 2) = 0;
   and 1=1;


-- Stage 3
insert into contest_project_xref
SELECT 655, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-01-01 00:00:00.000' and pp.actual_start_time <  '2018-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (655, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30057468, 30057606); -- exclude specific challenges
--   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 656, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-05-01 00:00:00.000' and pp.actual_start_time <  '2018-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (656, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30057968); -- exclude specific challenges
--   and mod(p.project_id, 2) = 0;



-- UI PROTO

-- Stage 1
insert into contest_project_xref
SELECT 648, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-08-01 00:00:00.000' and pp.actual_start_time <  '2017-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (648, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 2
insert into contest_project_xref
SELECT 649, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-11-01 00:00:00.000' and pp.actual_start_time <  '2018-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (649, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 650, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-01-01 00:00:00.000' and pp.actual_start_time <  '2018-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (650, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%'; -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 651, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-05-01 00:00:00.000' and pp.actual_start_time <  '2018-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (651, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%'; -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;



-- DESIGN

-- Stage 1
insert into contest_project_xref
SELECT 643, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-08-01 00:00:00.000' and pp.actual_start_time <  '2017-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (643, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 2
insert into contest_project_xref
SELECT 644, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-11-01 00:00:00.000' and pp.actual_start_time <  '2018-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (644, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
  and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 645, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-01-01 00:00:00.000' and pp.actual_start_time <  '2018-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (645, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
   and p.project_id not in (30057516); -- exclude specific challenges
--   and mod(p.project_id, 2) = 0;


-- Stage 4
insert into contest_project_xref
SELECT 646, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-05-01 00:00:00.000' and pp.actual_start_time <  '2018-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (646, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%'; -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;


-- F2F

-- Stage 1
insert into contest_project_xref
SELECT 638, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-08-01 00:00:00.000' and pp.actual_start_time <  '2017-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (638, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 2
insert into contest_project_xref
SELECT 639, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2017-11-01 00:00:00.000' and pp.actual_start_time <  '2018-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (639, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%' -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 640, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-01-01 00:00:00.000' and pp.actual_start_time <  '2018-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (640, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%'; -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;

-- Stage 4
insert into contest_project_xref
SELECT 641, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-05-01 00:00:00.000' and pp.actual_start_time <  '2018-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (641, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce)
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.project_id not in (30057968,30057832,30057829,30057831) -- exclude specific challenges   
   and (select lower(value) from project_info where project_id = p.project_id and project_info_type_id = 6) not like 'ibm cognitive%'; -- exclude IBM Cognitive Community Segment
--   and mod(p.project_id, 2) = 0;

