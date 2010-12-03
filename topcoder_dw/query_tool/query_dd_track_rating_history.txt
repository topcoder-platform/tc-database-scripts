--
-- dd_track_rating_history
--
SELECT c.handle
     , c.coder_id
     , p.project_id
     , p.component_name
     , p.category_desc
     , p.posting_date
     , p.submitby_date
     , pr.final_score
     , pr.submit_timestamp
     , pr.payment
     , pr.placed
     , pr.old_rating
     , pr.new_rating
     , p.rating_date
     , pr.rating_order
  FROM coder c
     , tcs_dw:project_result pr
     , tcs_dw:project p
 WHERE c.coder_id = @cr@
   AND pr.user_id = c.coder_id
   AND p.project_id = pr.project_id
   AND p.phase_id = @ph@
   AND p.status_id in (4,5,7,8)
   AND pr.new_rating > 0
   AND pr.rating_ind = 1
 ORDER BY pr.rating_order