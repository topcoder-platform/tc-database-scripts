-- This script needs to run on the oltp01 database server. Login as informix and add it under /home/informix/cron_scripts/tco/ and
-- update the crontab to run the script every 5 minutes. (crontab -e)

set lock mode to wait 5;

-- DEVELOPMENT

-- Stage 1
insert into contest_project_xref
SELECT 673, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-08-01 00:00:00.000' and pp.actual_start_time <  '2018-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (673, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.project_id not in (30070720, 30070724, 30070725, 30070727) -- IBM Hackathon Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 674, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-11-01 00:00:00.000' and pp.actual_start_time <  '2019-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (674, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
   and 1 = 1; 


-- Stage 3
insert into contest_project_xref
SELECT 675, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-02-01 00:00:00.000' and pp.actual_start_time <  '2019-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82  
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (675, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
   and 1 = 1; 

-- Stage 4
insert into contest_project_xref
SELECT 676, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-05-01 00:00:00.000' and pp.actual_start_time <  '2019-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (676, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
   and 1 = 1; 



-- QA Track Challenges

-- Stage 1
insert into contest_project_xref
SELECT 668, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-08-01 00:00:00.000' and pp.actual_start_time <  '2018-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
-- INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes' --This seems No for Bug Hunts
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82

WHERE p.project_status_id = 1
   and 
   ( 
     p.project_category_id in (9,13) -- include Bug Hunt and Test Suites always
     OR 
     exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- if the challlenge is tagged as QA
   )  
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (668, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 669, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-11-01 00:00:00.000' and pp.actual_start_time <  '2019-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
-- INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
INNER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and 
   ( 
     p.project_category_id in (9,13) -- include Bug Hunt and Test Suites always
     OR 
     exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value  
                    AND technology_type_id = 78) -- if the challlenge is tagged as QA
   )   
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (669, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi

   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 670, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-02-01 00:00:00.000' and pp.actual_start_time <  '2019-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
--INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
INNER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
    and 
   ( 
     p.project_category_id in (9,13) -- include Bug Hunt and Test Suites always
     OR 
     exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value 
                    AND technology_type_id = 78) -- if the challlenge is tagged as QA
   )   
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (670, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi

   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 4
insert into contest_project_xref
SELECT 671, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-05-01 00:00:00.000' and pp.actual_start_time <  '2019-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
--INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
INNER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
    and 
    ( 
      p.project_category_id in (9,13) -- include Bug Hunt and Test Suites always
      OR 
      exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value 
                    AND technology_type_id = 78) -- if the challlenge is tagged as QA
    )  
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (671, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 



-- DESIGN

-- Stage 1
insert into contest_project_xref
SELECT 663, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-08-01 00:00:00.000' and pp.actual_start_time <  '2018-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (663, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 664, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-11-01 00:00:00.000' and pp.actual_start_time <  '2019-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (664, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 665, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-02-01 00:00:00.000' and pp.actual_start_time <  '2019-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (665, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 



-- Stage 4
insert into contest_project_xref
SELECT 666, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-05-01 00:00:00.000' and pp.actual_start_time <  '2019-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (666, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
 --and mod(p.project_id, 2) = 0
   and 1 = 1;


-- F2F

-- Stage 1
insert into contest_project_xref
SELECT 658, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-08-01 00:00:00.000' and pp.actual_start_time <  '2018-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (658, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
--   and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
   and 1 = 1;

-- Stage 2
insert into contest_project_xref
SELECT 659, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-11-01 00:00:00.000' and pp.actual_start_time <  '2019-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (659, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks 
   and p.tc_direct_project_id not in (16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 660, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-02-01 00:00:00.000' and pp.actual_start_time <  '2019-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (660, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
   and 1 = 1;

-- Stage 4
insert into contest_project_xref
SELECT 661, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-05-01 00:00:00.000' and pp.actual_start_time <  '2019-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (661, 583)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) --exclude projects for fun and university challenges
   and not exists (SELECT 1 FROM comp_technology 
                    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
   
   and 1 = 1;


  -- MM

-- Stage 1
insert into contest_project_xref
SELECT 678, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-08-01 00:00:00.000' and pp.actual_start_time <  '2018-11-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (37)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (678)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 679, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2018-11-01 00:00:00.000' and pp.actual_start_time <  '2019-02-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (37)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (679)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 680, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-02-01 00:00:00.000' and pp.actual_start_time <  '2019-05-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (37)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (680)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and 1 = 1; 



-- Stage 4
insert into contest_project_xref
SELECT 681, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-05-01 00:00:00.000' and pp.actual_start_time <  '2019-08-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (37)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (681)) -- make sure we exclude from tco
   and p.project_id not in
      ( SELECT contest_id FROM contest_eligibility 
        WHERE contest_id NOT IN 
          (select contest_id from contest_eligibility ce inner join common_oltp:group_contest_eligibility gce 
           ON ce.contest_eligibility_id = gce.contest_eligibility_id 
           AND group_id = 20000002) 
      ) -- include challenges from Anemoi
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
 --and mod(p.project_id, 2) = 0
   and 1 = 1; 
