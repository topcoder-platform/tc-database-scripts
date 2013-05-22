database jive;

create index "informix".jiveforum_cat_idx on "informix".jiveforum 
    (categoryid) using btree  in datadbs ;
create index "informix".jiveforum_forumidxctr_idx on "informix"
    .jiveforum (forumindexcounter) using btree  in datadbs ;
create index "informix".jivefourm_cdate_idx on "informix".jiveforum 
    (creationdate) using btree  in datadbs ;
create index "informix".jivefourm_mdate_idx on "informix".jiveforum 
    (modificationdate) using btree  in datadbs ;
create unique index "informix".nntp_unique_idx on "informix".jiveforum 
    (nntpname) using btree  in datadbs ;
create index "informix".jiveannounce_container_idx on "informix"
    .jiveannounce (objecttype,objectid) using btree  in datadbs 
    ;
create index "informix".jiveannounce_edate_idx on "informix".jiveannounce 
    (enddate) using btree  in datadbs ;
create index "informix".jiveannounce_sdate_idx on "informix".jiveannounce 
    (startdate) using btree  in datadbs ;
create index "informix".jiveannounce_user_idx on "informix".jiveannounce 
    (userid) using btree  in datadbs ;
create index "informix".jivepmessage_rid_idx on "informix".jivepmessage 
    (recipientid) using btree  in datadbs ;
create index "informix".jiveuserperm_object_idx on "informix".jiveuserperm 
    (objecttype,objectid) using btree  in datadbs ;
create index "informix".jiveuserperm_userid_idx on "informix".jiveuserperm 
    (userid) using btree  in datadbs ;
create index "informix".jivegroup_cdate_idx on "informix".jivegroup 
    (creationdate) using btree  in datadbs ;
create unique index "informix".name_unique_idx on "informix".jivegroup 
    (name) using btree  in datadbs ;
create index "informix".jivegroupperm_groupid_idx on "informix"
    .jivegroupperm (groupid) using btree  in datadbs ;
create index "informix".jivegroupperm_object_idx on "informix"
    .jivegroupperm (objecttype,objectid) using btree  in datadbs 
    ;
create index "informix".jivegroupuser_userid_idx on "informix"
    .jivegroupuser (userid) using btree  in datadbs ;
create index "informix".jivemoderation_objectid_idx on "informix"
    .jivemoderation (objectid) using btree  in datadbs ;
create index "informix".jivemoderation_objecttype_idx on "informix"
    .jivemoderation (objecttype) using btree  in datadbs ;
create index "informix".jivemoderation_userid_idx on "informix"
    .jivemoderation (userid) using btree  in datadbs ;
create index "informix".jivewatch_combo_idx on "informix".jivewatch 
    (objecttype,objectid,watchtype) using btree  in datadbs ;
    
create index "informix".jivewatch_objectid_idx on "informix".jivewatch 
    (objectid) using btree  in datadbs ;
create index "informix".jivewatch_objecttype_idx on "informix"
    .jivewatch (objecttype) using btree  in datadbs ;
create index "informix".jivewatch_userid_idx on "informix".jivewatch 
    (userid) using btree  in datadbs ;
create index "informix".jivereward_creationdate_idx on "informix"
    .jivereward (creationdate) using btree  in datadbs ;
create index "informix".jivereward_messageid_idx on "informix"
    .jivereward (messageid) using btree  in datadbs ;
create index "informix".jivereward_threadid_idx on "informix".jivereward 
    (threadid) using btree  in datadbs ;
create index "informix".jivereward_userid_idx on "informix".jivereward 
    (userid) using btree  in datadbs ;
create index "informix".jiveattachment_object_idx on "informix"
    .jiveattachment (objecttype,objectid) using btree  in datadbs 
    ;
create index "informix".jivecategory_lft_idx on "informix".jivecategory 
    (lft) using btree  in datadbs ;
create index "informix".jivecategory_rgt_idx on "informix".jivecategory 
    (rgt) using btree  in datadbs ;
create index "informix".jiverating_oid_otype_idx on "informix"
    .jiverating (objectid,objecttype) using btree  in datadbs 
    ;
create index "informix".jiverating_userid_idx on "informix".jiverating 
    (userid) using btree  in datadbs ;
create index "informix".jivepollvote_pollid_idx on "informix".jivepollvote 
    (pollid) using btree  in datadbs ;
create index "informix".jivesearch_type_idx on "informix".jivesearch 
    (searchtype) using btree  in datadbs ;
create index "informix".jivesearch_userid_idx on "informix".jivesearch 
    (userid) using btree  in datadbs ;
create index "informix".jivesearchcrit_sid_idx on "informix".jivesearchcriteria 
    (searchid) using btree  in datadbs ;
create index "informix".jiveviewcount_po_idx on "informix".jiveviewcount 
    (parentobjectid) using btree  in datadbs ;
create index "informix".jiveviewcount_vc_idx on "informix".jiveviewcount 
    (viewcount) using btree  in datadbs ;
create index "informix".jivereadstat_cd_idx on "informix".jivereadstat 
    (creationdate) using btree  in datadbs ;
create index "informix".jiverss_cd_idx on "informix".jivereadstatsession 
    (creationdate) using btree  in datadbs ;
create index "informix".jivehrss_bs_idx on "informix".jivehttpreadstatsession 
    (bytessent) using btree  in datadbs ;
create index "informix".jivehrss_sid_idx on "informix".jivehttpreadstatsession 
    (sessionid) using btree  in datadbs ;
create index "informix".jivenrss_cd_idx on "informix".jivenntpreadstatsession 
    (creationdate) using btree  in datadbs ;
create index "informix".jivenrss_ed_idx on "informix".jivenntpreadstatsession 
    (enddate) using btree  in datadbs ;
create index "informix".jivemessage_cdate_idx on "informix".jivemessage 
    (creationdate) using btree  in datadbs ;
create index "informix".jivemessage_forumid_idx on "informix".jivemessage 
    (forumid,forumindex) using btree  in datadbs ;
create index "informix".jivemessage_forumid_modval_idx on "informix"
    .jivemessage (forumid,modvalue) using btree  in datadbs ;
    
create index "informix".jivemessage_mdate_idx on "informix".jivemessage 
    (modificationdate desc) using btree  in datadbs ;
create index "informix".jivemessage_threadid_idx on "informix"
    .jivemessage (threadid) using btree  in datadbs ;
create index "informix".jivemessage_userid_idx on "informix".jivemessage 
    (userid) using btree  in datadbs ;
create index "informix".jivethread_cdate_idx on "informix".jivethread 
    (creationdate) using btree  in datadbs ;
create index "informix".jivethread_fid_mv_idx on "informix".jivethread 
    (forumid,modvalue) using btree  in datadbs ;
create index "informix".jivethread_forumid_idx on "informix".jivethread 
    (forumid) using btree  in datadbs ;
create index "informix".jivethread_mdate_idx on "informix".jivethread 
    (modificationdate desc) using btree  in datadbs ;
create index "informix".jivethread_modvalue_idx on "informix".jivethread 
    (modvalue) using btree  in datadbs ;
create index "informix".historyid_idx on "informix".message_history 
    (messageid) using btree  in datadbs ;
create index "informix".jivepoll_cdate_idx on "informix".jivepoll 
    (creationdate) using btree  in datadbs ;
create index "informix".jivepoll_edate_idx on "informix".jivepoll 
    (enddate desc) using btree  in datadbs ;
create index "informix".jivepoll_mdate_idx on "informix".jivepoll 
    (modificationdate desc) using btree  in datadbs ;
create index "informix".jivepoll_oid_otype_idx on "informix".jivepoll 
    (objectid,objecttype) using btree  in datadbs ;
create index "informix".jivepoll_sdate_idx on "informix".jivepoll 
    (startdate desc) using btree  in datadbs ;


alter table "informix".jiveforumprop add constraint (foreign 
    key (forumid) references "informix".jiveforum  constraint 
    "informix".jiveforumprop_forumid_fk);
alter table "informix".jiverating add constraint (foreign key 
    (score) references "informix".jiveratingtype  constraint "informix"
    .jiverating_score_fk);
alter table "informix".jivepolloption add constraint (foreign 
    key (pollid) references "informix".jivepoll  constraint "informix"
    .jivepolloption_pollid_fk);
alter table "informix".jivepollvote add constraint (foreign key 
    (pollid) references "informix".jivepoll  constraint "informix"
    .jivepollvote_pollid_fk);
alter table "informix".jivesearchcriteria add constraint (foreign 
    key (searchid) references "informix".jivesearch  constraint 
    "informix".jivesearchcriteria_sid_fk);
alter table "informix".jivesearchclick add constraint (foreign 
    key (searchid) references "informix".jivesearch  constraint 
    "informix".jivesearchclick_searchid_fk);
alter table "informix".jivenntpreadstatsession add constraint 
    (foreign key (sessionid) references "informix".jivereadstatsession 
     constraint "informix".jivenntpreadstatsession_sid_fk);
alter table "informix".jivehttpreadstatsession add constraint 
    (foreign key (sessionid) references "informix".jivereadstatsession 
     constraint "informix".jivehttpreadstatsession_sid_fk);
alter table "informix".jivemessage add constraint (foreign key 
    (threadid) references "informix".jivethread  constraint "informix"
    .jivemessage_threadid_fk);
alter table "informix".jivemessage add constraint (foreign key 
    (forumid) references "informix".jiveforum  constraint "informix"
    .jivemessage_forumid_fk);
alter table "informix".jivemessageprop add constraint (foreign 
    key (messageid) references "informix".jivemessage  constraint 
    "informix".jivemessageprop_msgid_fk);

alter table question_thread_xref add constraint foreign key
		(thread_id)
    references jivethread
    (threadid) 
    constraint question_thread_xref_thread_fk;

alter table question_thread_xref add constraint foreign key
		(forum_id)
    references jiveforum
    (forumid) 
    constraint question_thread_xref_forum_fk;
	
alter table comment_message_xref add constraint foreign key
		(message_id)
    references jivemessage
    (messageid) 
    constraint comment_message_xref_message_fk;

create unique index "informix".jive_reply_to_identifiers_identifier_idx on "informix".jive_reply_to_identifiers 
    (reply_to_identifier) using btree  in datadbs ;

create unique index "informix".jive_reply_to_identifiers_user_id_msg_id_idx on "informix".jive_reply_to_identifiers 
    (user_id, message_id) using btree  in datadbs ;
    
alter table "informix".jive_reply_to_identifiers add constraint (foreign 
    key (message_id) references "informix".jivemessage  constraint 
    "informix".jive_reply_to_identifiers_msgid_fk);