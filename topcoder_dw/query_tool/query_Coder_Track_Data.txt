--
-- Coder_Track_Data
--
SELECT ur.rating
     , ur.vol
     , rank.rank
     , (SELECT count(*)
          FROM tcs_dw:project_result mx
             , tcs_dw:project mx1
         WHERE mx1.phase_id = @ph@
           AND mx1.project_id = mx.project_id
           AND user_id = ur.user_id
           AND mx1.status_id in (4,5,7,8))as num_ratings
     , url.rating as reliability
     , (SELECT min(new_rating)
          FROM tcs_dw:project_result mx
             , tcs_dw:project mx1
         WHERE mx1.phase_id = @ph@
           AND mx1.project_id = mx.project_id
           AND user_id = ur.user_id
           AND new_rating > 0) as min_rating
     , (SELECT max(new_rating)
          FROM tcs_dw:project_result mx
             , tcs_dw:project mx1
         WHERE mx1.phase_id = @ph@
           AND mx1.project_id = mx.project_id
           AND user_id = ur.user_id
           AND new_rating > 0) as max_rating
     , (SELECT NVL(SUM(payment),0)
          FROM coder c
             , OUTER(tcs_dw:project_result r
             , tcs_dw:project p)
         WHERE c.coder_id = ur.user_id
           AND c.coder_id = r.user_id
           AND p.project_id = r.project_id
           AND p.status_id not in (1)
           AND p.phase_id = @ph@)
     + (SELECT NVL(SUM(prize_payment),0)
          FROM coder c
             , OUTER( tcs_dw:user_contest_prize u
             , tcs_dw:contest ct)
         WHERE c.coder_id = ur.user_id
           AND c.coder_id = u.user_id
           AND ct.contest_id = u.contest_id
           AND ct.phase_id = @ph@) as earnings
     , sur.rank as school_rank
     , cur.rank as country_rank
     , (SELECT count(*)
          FROM tcs_dw:country_user_rank cur1
         WHERE cur1.user_rank_type_id = cur.user_rank_type_id
           AND cur1.phase_id = cur.phase_id
           AND cur1.country_code = cur.country_code) as num_country_ranked
     , (SELECT count(*)
          FROM tcs_dw:school_user_rank sur1
         WHERE sur1.user_rank_type_id = sur.user_rank_type_id
           AND sur1.phase_id = sur.phase_id
           AND sur1.school_id = sur.school_id) as num_school_ranked
     , (SELECT count(*)
          FROM tcs_dw:user_rank ur1
         WHERE ur1.user_rank_type_id = rank.user_rank_type_id
           AND user_rank_type_id = 2
           AND ur1.phase_id = rank.phase_id) as num_ranked
             , rank.percentile
  FROM tcs_dw:user_rating ur
     , OUTER(tcs_dw:user_reliability url)
     , OUTER tcs_dw:user_rank rank
     , OUTER tcs_dw:country_user_rank cur
     , OUTER tcs_dw:school_user_rank sur
 WHERE ur.user_id = @cr@
   AND ur.phase_id = @ph@
   AND rank.phase_id = ur.phase_id
   AND rank.user_id = ur.user_id
   AND rank.user_rank_type_id = 2
   AND url.user_id = ur.user_id
   AND url.phase_id = @ph@
   AND sur.user_id = ur.user_id
   AND sur.user_rank_type_id = 2
   AND sur.phase_id = @ph@
   AND cur.user_id = ur.user_id
   AND cur.user_rank_type_id = 2
   AND cur.phase_id = @ph@