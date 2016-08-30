set lock mode to wait 5;

insert into contest_project_xref
SELECT 603, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-03-01 00:00:00.000' and pp.actual_start_time <  '2016-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and (pi13.value = 'Yes' or p.project_category_id = 39) -- Code challenges are included even if not rated
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
WHERE p.project_status_id = 1
   and p.project_category_id in (7,14, 39)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (603, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);


insert into contest_project_xref
SELECT 598, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-03-01 00:00:00.000' and pp.actual_start_time <  '2016-06-01 00:00:00.000'
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi13 ON p.project_id = pi13.project_id and pi13.project_info_type_id = 13 and pi13.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
WHERE p.project_status_id = 1
   and p.project_category_id in (19)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (598, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);


insert into contest_project_xref
SELECT 593, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-03-01 00:00:00.000' and pp.actual_start_time <  '2016-06-01 00:00:00.000'
--INNER JOIN project_phase pp2 ON p.project_id = pp2.project_id and pp2.phase_type_id = 2 and
--                                pp2.scheduled_end_time <  '2014-07-01 00:00:00.000' -- this is for the final period only
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
WHERE p.project_status_id = 1
   and p.project_category_id in (16, 17, 20, 21, 30, 32, 34)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (593, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);


insert into contest_project_xref
SELECT 588, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-03-01 00:00:00.000' and pp.actual_start_time <  '2016-06-01 00:00:00.000'
--INNER JOIN project_phase pp2 ON p.project_id = pp2.project_id and pp2.phase_type_id = 2 and
--                                pp2.scheduled_end_time <  '2014-07-01 00:00:00.000' -- this is for the final period only
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
WHERE p.project_status_id = 1
   and p.project_category_id in (38,40)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (588, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);


insert into contest_project_xref
SELECT 607, p.project_id, current
FROM project p
INNER JOIN project_phase pp ON p.project_id = pp.project_id and pp.phase_type_id = 1 and
                               pp.actual_start_time >= '2016-03-01 00:00:00.000' and pp.actual_start_time <  '2016-06-01 00:00:00.000'
--INNER JOIN project_phase pp2 ON p.project_id = pp2.project_id and pp2.phase_type_id = 2 and
--                                pp2.scheduled_end_time <  '2014-07-01 00:00:00.000' -- this is for the final period only
INNER JOIN project_info pi12 ON p.project_id = pi12.project_id and pi12.project_info_type_id = 12 and pi12.value = 'Yes'
INNER JOIN project_info pi14 ON p.project_id = pi14.project_id and pi14.project_info_type_id = 14 and pi14.value = 'Open'
WHERE p.project_status_id = 1
   and p.project_category_id in (18)
   and p.project_id not in (select project_id from contest_project_xref where contest_id in (607, 583)) -- make sure we exclude from tco
   and p.project_id not in (select ce.contest_id from contest_eligibility ce);
