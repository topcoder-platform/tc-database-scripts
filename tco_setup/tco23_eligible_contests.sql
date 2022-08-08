-- This script needs to run on the oltp01 database server. Login as informix and add it under /home/informix/cron_scripts/tco/ and
-- update the crontab to run the script every 5 minutes. (crontab -e)

set lock mode to wait 5;

-- DEVELOPMENT

-- Stage 1
insert into contest_project_xref
SELECT 767, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-07-01 00:00:00.000' and pp.actual_start_time <  '2022-10-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id in (38,39) ) -- Code, F2F challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39,38) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (767)) -- make sure we exclude from tco
   and p.project_id not in (select project_id from project_platform where project_platform_id in (36)) -- exclude challenges with platform Automated Testing as they are QA
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and not exists (SELECT 1 FROM comp_technology
               --     WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
               -- WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,27621212)) -- exclude QA/QA - Regression/QA - Hunt/QA - Test Case Writing/Data Science Challenges from Dev
                 WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,497,541)) -- excludes from Development by Tags:
                 -- 78: QA
                 -- 481: QA - Regression
                 -- 482: QA - Hunt
                 -- 483: QA - Test Case Writing
                 -- 497: Automation Testing
                 -- 514 - Idea Generation
   and 1 = 1;


-- Stage 2
insert into contest_project_xref
SELECT 769, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-10-01 00:00:00.000' and pp.actual_start_time <  '2023-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id in (38,39) ) -- Code, F2F challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39,38) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (769)) -- make sure we exclude from tco
   and p.project_id not in (select project_id from project_platform where project_platform_id in (36)) -- exclude challenges with platform Automated Testing as they are QA
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
--   and p.project_id not in (30128882) --excluding practice contest
   and not exists (SELECT 1 FROM comp_technology
                 --   WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
                 -- WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,27621212)) -- exclude QA/QA - Regression/QA - Hunt/QA - Test Case Writing/Data Science Challenges from Dev
                  WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,497,541)) -- exclude per Tags, see above (S1 for desc)
   and 1 = 1;

-- Stage 3
insert into contest_project_xref
SELECT 770, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2023-01-01 00:00:00.000' and pp.actual_start_time <  '2023-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id in (38,39) ) -- Code, F2F challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14,39,38) -- exclude UI Prototype track as well
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (770)) -- make sure we exclude from tco
   and p.project_id not in (select project_id from project_platform where project_platform_id in (36)) -- exclude challenges with platform Automated Testing as they are QA
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407) -- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
--   and p.project_id not in (30128882) --excluding practice contest
   and not exists (SELECT 1 FROM comp_technology
                 --   WHERE comp_vers_id = pi1.value AND technology_type_id = 78) -- exclude QA Challenges from Dev
                 -- WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,27621212)) -- exclude QA/QA - Regression/QA - Hunt/QA - Test Case Writing/Data Science Challenges from Dev
                  WHERE comp_vers_id = pi1.value AND technology_type_id in (78,481,482,483,497,541)) -- exclude per Tags, see above (S1 for desc)
   and 1 = 1;



-- QA Track Challenges
-- Stage 1
insert into contest_project_xref
SELECT 773, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-07-01 00:00:00.000' and pp.actual_start_time <  '2022-10-01 00:00:00.000'
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
                    AND technology_type_id in (78,481,482,483)) -- if the challlenge is tagged as QA/QA - Regression/QA - Hunt/QA - Test Case Writing
   )
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (773)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;

-- Stage 2
insert into contest_project_xref
SELECT 772, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-10-01 00:00:00.000' and pp.actual_start_time <  '2023-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
--INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
INNER JOIN project_info pi1  ON pi1.project_id  = p.project_id and pi1.project_info_type_id = 1

LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
    and
   (
     p.project_category_id in (9,13) -- include Bug Hunt and Test Suites
     OR
     exists (SELECT 1 FROM comp_technology
                    WHERE comp_vers_id = pi1.value
                    AND technology_type_id in (78,481,482,483)) -- if the challlenge is tagged as QA/QA - Regression/QA - Hunt/QA - Test Case Writing
   )
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (772)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;

-- Stage 3
insert into contest_project_xref
SELECT 771, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2023-01-01 00:00:00.000' and pp.actual_start_time <  '2023-04-01 00:00:00.000'
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
                    AND technology_type_id in (78,481,482,483)) -- if the challlenge is tagged as QA/QA - Regression/QA - Hunt/QA - Test Case Writing
   )
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (771)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;



-- DESIGN
-- Stage 1
insert into contest_project_xref
SELECT 776, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-07-01 00:00:00.000' and pp.actual_start_time <  '2022-10-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34,40) -- add design F2Fs
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (776)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;

-- Stage 2
insert into contest_project_xref
SELECT 777, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-10-01 00:00:00.000' and pp.actual_start_time <  '2023-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34,40) -- add design F2Fs
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (777)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
 --  and p.project_id not in (30129083) --excluding practice contest
   and 1 = 1;

-- Stage 3

insert into contest_project_xref
SELECT 778, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2023-01-01 00:00:00.000' and pp.actual_start_time <  '2023-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34,40) -- add design F2Fs
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (778)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
 --  and p.project_id not in (30129083) --excluding practice contest
   and 1 = 1;


-- MM
--As per community team, Challenges tagged with Data Science are removed from Marathon Match tag.
--They will be counted for data science leaderboards for tco21

-- Stage 1
insert into contest_project_xref
SELECT 784, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-07-01 00:00:00.000' and pp.actual_start_time <  '2022-10-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (784)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30145483) --excluding as per support ticket 71633
   and p.project_id not in (30153848) --excluding as per support ticket 75389
   --comment
--  and p.project_id not in ( 30114809, 30116975, 30116520 ) --excluding specific challenge
   and 1 = 1;

-- Stage 2
insert into contest_project_xref
SELECT 785, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-10-01 00:00:00.000' and pp.actual_start_time <  '2023-01-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (785)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and p.project_id not in (30171936) --excluding as per support ticket 81794
--   and p.project_id not in (30129332) --excluding practice contest
   and 1 = 1;

-- Stage 3
insert into contest_project_xref
SELECT 786, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2023-01-01 00:00:00.000' and pp.actual_start_time <  '2023-04-01 00:00:00.000'
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
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (786)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
--   and p.project_id not in (30129332) --excluding practice contest
   and 1 = 1;

-- Data Science
--As per community team, Challenges with category code and tagged with Data Science
--are only counted in Data Science leaderboard


--Stage 1

insert into contest_project_xref
SELECT 788, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-07-01 00:00:00.000' and pp.actual_start_time <  '2022-10-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and
   --(
       p.project_category_id in (39,22) -- include code matches always
           and
       exists (SELECT 1 FROM comp_technology
                   WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- to check if the challlenge is tagged as Data Science
   --)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (788)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;


   --Stage 2

insert into contest_project_xref
SELECT 789, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2022-10-01 00:00:00.000' and pp.actual_start_time <  '2023-01-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and
   --(
       p.project_category_id in (39,22) -- include code matches always
           and
       exists (SELECT 1 FROM comp_technology
                   WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- to check if the challlenge is tagged as Data Science
   --)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (789)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;


--Stage 3

insert into contest_project_xref
SELECT 790, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2023-01-01 00:00:00.000' and pp.actual_start_time <  '2023-04-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
LEFT OUTER JOIN project_info pi82 ON pi82.project_id = p.project_id and pi82.project_info_type_id = 82
LEFT OUTER JOIN project_info pi1 ON pi1.project_id = p.project_id and pi1.project_info_type_id = 1
WHERE p.project_status_id = 1
   and
   --(
       p.project_category_id in (39,22) -- include code matches always
           and
       exists (SELECT 1 FROM comp_technology
                   WHERE comp_vers_id = pi1.value AND technology_type_id = 27621212) -- to check if the challlenge is tagged as Data Science
   --)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (790)) -- make sure we exclude from tco
   and NVL(pi82.value, 0) = 0 -- No TCO if these are tasks
   and p.tc_direct_project_id not in (8943, 16411, 16412, 16413, 16406, 16399, 16407)-- exclude projects for fun and university challenges
   and p.tc_direct_project_id not in ( 22249 ) --Rodeo Challenges to be excluded
   and p.tc_direct_project_id not in ( 26910 ) --USBR Streamflow Forecasting challenges to be excluded
-- and mod(p.project_id, 2) = 0
   and p.project_id not in (select ce.contest_id from contest_eligibility ce) --excluding private challenges
   and 1 = 1;
