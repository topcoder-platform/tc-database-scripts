-- This script needs to run on the oltp01 database server. Login as informix and add it under /home/informix/cron_scripts/tco/ and
-- update the crontab to run the script every 5 minutes. (crontab -e)

set lock mode to wait 5;

-- DEVELOPMENT

-- Stage 1
insert into contest_project_xref
SELECT 698, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-10-01 00:00:00.000' and pp.actual_start_time <  '2020-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (698, 697)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and p.project_id not in (30070720, 30070724, 30070725, 30070727) -- IBM Hackathon Challenges to be excluded
-- and mod(p.project_id, 2) = 0

   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and not exists (SELECT 1 FROM comp_technology 
               --    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
                    WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from Dev
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 699, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-01-01 00:00:00.000' and pp.actual_start_time <  '2020-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (699, 697)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and not exists (SELECT 1 FROM comp_technology 
               --     WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
                WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from Dev
   and 1 = 1; 


-- Stage 3
insert into contest_project_xref
SELECT 700, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-04-01 00:00:00.000' and pp.actual_start_time <  '2020-07-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82  
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (700, 697)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30128882) --excluding practice contest
   and not exists (SELECT 1 FROM comp_technology 
                 --   WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
                  WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from Dev
   and 1 = 1; 

   
   
-- QA Track Challenges

-- Stage 1
insert into contest_project_xref
SELECT 693, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-10-01 00:00:00.000' and pp.actual_start_time <  '2020-01-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (693, 692)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30108180) --excluding practice contest
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 694, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-01-01 00:00:00.000' and pp.actual_start_time <  '2020-04-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (694, 692)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 695, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-04-01 00:00:00.000' and pp.actual_start_time <  '2020-07-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (695, 692)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1; 



-- DESIGN

-- Stage 1
insert into contest_project_xref
SELECT 688, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-10-01 00:00:00.000' and pp.actual_start_time <  '2020-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (688, 687)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 689, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-01-01 00:00:00.000' and pp.actual_start_time <  '2020-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (689, 687)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 690, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-04-01 00:00:00.000' and pp.actual_start_time <  '2020-07-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (690, 687)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30129083) --excluding practice contest
   and 1 = 1; 

-- F2F

-- Stage 1
insert into contest_project_xref
SELECT 683, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-10-01 00:00:00.000' and pp.actual_start_time <  '2020-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (683, 682)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
--   and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
               --  WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
                   WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from F2F 
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;

-- Stage 2
insert into contest_project_xref
SELECT 684, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-01-01 00:00:00.000' and pp.actual_start_time <  '2020-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (684, 682)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks 
   and p.tc_direct_project_id not in (16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                --    WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
                    WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from F2F 
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1=1;

-- Stage 3
insert into contest_project_xref
SELECT 685, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-04-01 00:00:00.000' and pp.actual_start_time <  '2020-07-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (685, 682)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and not exists (SELECT 1 FROM comp_technology 
                  --  WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from F2F
                    WHERE comp_vers_id = pi1.value AND technology_type_id in (78,27621212)) -- exclude QA/Data Science Challenges from F2F 
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;


-- MM
--As per community team, Challenges tagged with Data Science are removed from Marathon Match tag. 
--They will not be counted for any leaderboards for tco20

-- Stage 1
insert into contest_project_xref
SELECT 703, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2019-10-01 00:00:00.000' and pp.actual_start_time <  '2020-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1 
WHERE p.project_status_id = 1
   and 
   --(
       p.project_category_id in (37) -- include marathon matches always
   --    OR
   --    exists (SELECT 1 FROM comp_technology
   --                WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- if the challlenge is tagged as Data Science
   --)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (703,702)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1; 

-- Stage 2
insert into contest_project_xref
SELECT 704, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-01-01 00:00:00.000' and pp.actual_start_time <  '2020-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1 
WHERE p.project_status_id = 1
   and 
   --(
       p.project_category_id in (37) -- include marathon matches always
   --    OR
   --    exists (SELECT 1 FROM comp_technology
   --                WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- if the challlenge is tagged as Data Science
   --)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (704,702)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in ( 30114809, 30116975, 30116520 ) --excluding specific challenge
   and 1 = 1; 

-- Stage 3
insert into contest_project_xref
SELECT 705, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2020-04-01 00:00:00.000' and pp.actual_start_time <  '2020-07-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1 
WHERE p.project_status_id = 1
   and
   --(
       p.project_category_id in (37) -- include marathon matches always
   --    OR
   --    exists (SELECT 1 FROM comp_technology
   --                WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- if the challlenge is tagged as Data Science
   --) 
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (705,702)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30129332) --excluding practice contest
   and 1 = 1; 


