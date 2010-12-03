CREATE DATABASE jive IN datadbs WITH BUFFERED LOG;
database jive;

grant dba to "informix";
grant connect to "coder";


create table "informix".dual 
  (
    value integer
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".dual from "public" as "informix";


create table "informix".jiveforum 
  (
    forumid integer not null ,
    name varchar(255) not null ,
    nntpname varchar(255) not null ,
    description lvarchar,
    moddefaultthreadval integer not null ,
    moddefaultmsgval integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    categoryid integer not null ,
    categoryindex integer not null ,
    forumindexcounter integer not null ,
    primary key (forumid)  constraint "informix".jiveforum_pk
  )  
  extent size 40000 next size 40000 
  lock mode row;
revoke all on "informix".jiveforum from "public" as "informix";


create table "informix".jiveforumprop 
  (
    forumid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (forumid,name)  constraint "informix".jiveforumprop_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveforumprop from "public" as "informix";


create table "informix".jivethreadprop 
  (
    threadid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (threadid,name)  constraint "informix".jivethreadprop_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivethreadprop from "public" as "informix";


create table "informix".jivemessageprop 
  (
    messageid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (messageid,name)  constraint "informix".jivemessageprop_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivemessageprop from "public" as "informix";


create table "informix".jiveannounce 
  (
    announcementid integer not null ,
    objecttype integer not null ,
    objectid integer,
    userid integer not null ,
    subject varchar(255),
    body text,
    startdate decimal(14,0) not null ,
    enddate decimal(14,0),
    primary key (announcementid)  constraint "informix".jiveannounce_pk
  )  
  extent size 512 next size 512 
  lock mode row;
revoke all on "informix".jiveannounce from "public" as "informix";


create table "informix".jiveannounceprop 
  (
    announcementid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (announcementid,name)  constraint "informix".jiveannounceprop_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveannounceprop from "public" as "informix";


create table "informix".jivepmessage 
  (
    pmessageid integer not null ,
    ownerid integer not null ,
    senderid integer,
    recipientid integer,
    subject varchar(255),
    body text,
    readstatus integer not null ,
    folderid integer not null ,
    pmessagedate decimal(14,0) not null ,
    primary key (pmessageid)  constraint "informix".jivepmessage_pmid_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepmessage from "public" as "informix";


create table "informix".jivepmessageprop 
  (
    pmessageid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (pmessageid,name)  constraint "informix".jivepmp_pmid_name_idx
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepmessageprop from "public" as "informix";


create table "informix".jivepmessagefldr 
  (
    folderid integer not null ,
    userid integer not null ,
    name varchar(255) not null ,
    primary key (folderid,userid)  constraint "informix".jivepf_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepmessagefldr from "public" as "informix";


create table "informix".jiveuserperm 
  (
    objecttype integer not null ,
    objectid integer not null ,
    userid integer not null ,
    permissiontype integer not null ,
    permission integer not null 
  )  
  extent size 10000 next size 10000 
  lock mode row;
revoke all on "informix".jiveuserperm from "public" as "informix";


create table "informix".jiveuserprop 
  (
    userid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (userid,name)  constraint "informix".jiveuserprop_pk
  )  
  extent size 6000 next size 6000 
  lock mode row;
revoke all on "informix".jiveuserprop from "public" as "informix";


create table "informix".jivegroup 
  (
    groupid integer not null ,
    name varchar(100) not null ,
    description varchar(255),
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (groupid)  constraint "informix".jivegroup_pk
  )  
  extent size 3000 next size 3000 
  lock mode row;
revoke all on "informix".jivegroup from "public" as "informix";


create table "informix".jivegroupperm 
  (
    objecttype integer not null ,
    objectid integer not null ,
    groupid integer not null ,
    permissiontype integer not null ,
    permission integer not null 
  )  
  extent size 10000 next size 10000 
  lock mode row;
revoke all on "informix".jivegroupperm from "public" as "informix";


create table "informix".jivegroupprop 
  (
    groupid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (groupid,name)  constraint "informix".jivegroupprop_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivegroupprop from "public" as "informix";


create table "informix".jivegroupuser 
  (
    groupid integer not null ,
    userid integer not null ,
    administrator integer not null ,
    primary key (groupid,userid,administrator)  constraint "informix".jivegroupuser_pk
  )  
  extent size 3000 next size 3000 
  lock mode row;
revoke all on "informix".jivegroupuser from "public" as "informix";


create table "informix".jiveid 
  (
    idtype integer not null ,
    id integer not null ,
    primary key (idtype)  constraint "informix".jiveid_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveid from "public" as "informix";


create table "informix".jiveproperty 
  (
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (name)  constraint "informix".jiveproperty_pk
  )  
  extent size 256 next size 256 
  lock mode row;
revoke all on "informix".jiveproperty from "public" as "informix";


create table "informix".jivemoderation 
  (
    objectid integer not null ,
    objecttype integer not null ,
    userid integer,
    moddate decimal(14,0) not null ,
    modvalue integer not null 
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivemoderation from "public" as "informix";


create table "informix".jivewatch 
  (
    userid integer not null ,
    objectid integer not null ,
    objecttype integer not null ,
    watchtype integer not null ,
    expirable integer not null ,
    primary key (userid,objectid,objecttype,watchtype)  constraint "informix".jivewatch_pk
  )  
  extent size 512 next size 512 
  lock mode row;
revoke all on "informix".jivewatch from "public" as "informix";


create table "informix".jivebatchwatch 
  (
    userid integer not null ,
    frequency varchar(50) not null ,
    prevemaildate decimal(14,0),
    primary key (userid)  constraint "informix".jivebatchwatch_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivebatchwatch from "public" as "informix";


create table "informix".jivereward 
  (
    userid integer not null ,
    creationdate decimal(14,0) not null ,
    rewardpoints integer not null ,
    messageid integer,
    threadid integer
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivereward from "public" as "informix";


create table "informix".jiveuserreward 
  (
    userid integer not null ,
    rewardpoints integer not null ,
    primary key (userid)  constraint "informix".jiveuserreward_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveuserreward from "public" as "informix";


create table "informix".jiveattachment 
  (
    attachmentid integer not null ,
    objecttype integer not null ,
    objectid integer,
    filename varchar(255) not null ,
    filesize integer not null ,
    contenttype varchar(50) not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (attachmentid)  constraint "informix".jiveattachment_pk
  )  
  extent size 1000 next size 1000 
  lock mode row;
revoke all on "informix".jiveattachment from "public" as "informix";


create table "informix".jiveattachdata 
  (
    attachmentid integer not null ,
    attachmentdata byte not null ,
    primary key (attachmentid)  constraint "informix".jiveattachdata_pk
  )  
  extent size 512 next size 512 
  lock mode row;
revoke all on "informix".jiveattachdata from "public" as "informix";


create table "informix".jiveattachmentprop 
  (
    attachmentid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (attachmentid,name)  constraint "informix".jiveattachmentprop_pk
  )  
  extent size 1000 next size 1000 
  lock mode row;
revoke all on "informix".jiveattachmentprop from "public" as "informix";

create table "informix".jivecategory 
  (
    categoryid integer not null ,
    name varchar(255) not null ,
    description lvarchar,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    lft integer not null ,
    rgt integer not null ,
    primary key (categoryid)  constraint "informix".jivecategory_pk
  )  
  extent size 3000 next size 3000 
  lock mode row;
revoke all on "informix".jivecategory from "public" as "informix";


create table "informix".jivecategoryprop 
  (
    categoryid integer not null ,
    name varchar(100) not null ,
    propvalue lvarchar not null ,
    primary key (categoryid,name)  constraint "informix".jivecategoryprop_pk
  )  
  extent size 4000 next size 4000 
  lock mode row;
revoke all on "informix".jivecategoryprop from "public" as "informix";


create table "informix".jiveuserroster 
  (
    userid integer not null ,
    subuserid integer not null ,
    primary key (userid,subuserid)  constraint "informix".jiveuserroster_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveuserroster from "public" as "informix";


create table "informix".jivereadtracker 
  (
    userid integer not null ,
    objecttype integer not null ,
    objectid integer not null ,
    readdate decimal(14,0) not null ,
    primary key (userid,objecttype,objectid)  constraint "informix".jivereadtracker_pk
  )  
  extent size 50000 next size 50000 
  lock mode row;
revoke all on "informix".jivereadtracker from "public" as "informix";


create table "informix".jiveratingtype 
  (
    score integer not null ,
    description varchar(255) not null ,
    primary key (score)  constraint "informix".jiveratingtype_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jiveratingtype from "public" as "informix";


create table "informix".jiverating 
  (
    objectid integer not null ,
    objecttype integer not null ,
    userid integer,
    score integer not null 
  )  
  extent size 6000 next size 6000 
  lock mode row;
revoke all on "informix".jiverating from "public" as "informix";


create table "informix".jivepolloption 
  (
    pollid integer not null ,
    optionindex integer not null ,
    optiontext varchar(255) not null ,
    primary key (pollid,optionindex)  constraint "informix".jivepolloption_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepolloption from "public" as "informix";


create table "informix".jivepollvote 
  (
    pollid integer not null ,
    userid integer,
    guestid varchar(255),
    optionindex integer not null ,
    votedate decimal(15,0) not null 
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepollvote from "public" as "informix";


create table "informix".jivesearch 
  (
    searchid integer not null ,
    searchtype integer not null ,
    userid integer,
    query lvarchar not null ,
    searchduration integer not null ,
    numresults integer not null ,
    searchdate decimal(14,0) not null ,
    primary key (searchid)  constraint "informix".jivesearch_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivesearch from "public" as "informix";


create table "informix".jivesearchcriteria 
  (
    searchid integer not null ,
    criterianame varchar(100) not null ,
    criteriavalue lvarchar not null 
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivesearchcriteria from "public" as "informix";


create table "informix".jivesearchclick 
  (
    searchid integer not null ,
    messageid integer not null ,
    clickdate decimal(14,0) not null ,
    primary key (searchid,messageid,clickdate)  constraint "informix".jivesearchclick_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivesearchclick from "public" as "informix";


create table "informix".jiveviewcount 
  (
    objecttype integer not null ,
    objectid integer not null ,
    parentobjectid integer,
    viewcount integer 
        default 0,
    primary key (objecttype,objectid)  constraint "informix".jiveviewcount_pk
  )  
  extent size 2000 next size 2000 
  lock mode row;
revoke all on "informix".jiveviewcount from "public" as "informix";


create table "informix".jivereadstat 
  (
    readstatid integer not null ,
    userid integer,
    objecttype integer not null ,
    objectid integer not null ,
    creationdate decimal(14,0) not null ,
    sessionid integer not null ,
    primary key (readstatid)  constraint "informix".jivereadstat_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivereadstat from "public" as "informix";


create table "informix".jivereadstatsession 
  (
    sessionid integer not null ,
    visitorid varchar(32),
    creationdate decimal(14,0) not null ,
    primary key (sessionid)  constraint "informix".jiverss_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivereadstatsession from "public" as "informix";


create table "informix".jivehttpreadstatsession 
  (
    referrer varchar(255),
    useragent varchar(255),
    ip varchar(16),
    country varchar(4),
    bytessent integer 
        default 0,
    sessionid integer not null 
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivehttpreadstatsession from "public" as "informix";


create table "informix".jivenntpreadstatsession 
  (
    creationdate decimal(14,0) not null ,
    enddate decimal(14,0),
    bytesreceived integer 
        default 0,
    bytessent integer 
        default 0,
    ip varchar(16),
    country varchar(4),
    sessionid integer not null 
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivenntpreadstatsession from "public" as "informix";


create table "informix".jivemessage 
  (
    messageid integer not null ,
    parentmessageid integer,
    threadid integer not null ,
    forumid integer not null ,
    forumindex integer not null ,
    userid integer,
    subject varchar(255),
    body text,
    modvalue integer not null ,
    rewardpoints integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (messageid)  constraint "informix".jivemessage_pk
  )  
  extent size 500000 next size 500000 
  lock mode row;
revoke all on "informix".jivemessage from "public" as "informix";


create table "informix".jivethread 
  (
    threadid integer not null ,
    forumid integer not null ,
    rootmessageid integer not null ,
    modvalue integer not null ,
    rewardpoints integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (threadid)  constraint "informix".jivethread_pk
  )  
  extent size 5000 next size 5000 
  lock mode row;
revoke all on "informix".jivethread from "public" as "informix";


create table "informix".message_history 
  (
    historyid serial not null ,
    messageid integer,
    subject varchar(255),
    body text,
    modificationdate decimal(14,0),
    primary key (historyid)  constraint "informix".message_history_pk
  )  
  extent size 100000 next size 50000 
  lock mode row;
revoke all on "informix".message_history from "public" as "informix";


create table "informix".jivepoll 
  (
    pollid integer not null ,
    objecttype integer not null ,
    objectid integer not null ,
    userid integer,
    name varchar(255) not null ,
    description lvarchar,
    pollmode integer not null ,
    creationdate decimal(15,0) not null ,
    modificationdate decimal(15,0) not null ,
    startdate decimal(14,0) not null ,
    enddate decimal(15,0) not null ,
    expiredate decimal(15,0) not null ,
    primary key (pollid)  constraint "informix".jivepoll_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepoll from "public" as "informix";


create table "informix".template 
  (
    template_id integer not null ,
    template_type integer not null ,
    description varchar(255) not null ,
    primary key (template_id)  constraint "informix".pk_template1
  )  
  extent size 32 next size 32 
  lock mode row;
revoke all on "informix".template from "public" as "informix";


create table "informix".template_forum 
  (
    template_forum_id integer not null ,
    template_id integer,
    name varchar(255) not null ,
    description varchar(255) not null ,
    display_order integer not null ,
    project_category_id integer,
    primary key (template_forum_id)  constraint "informix".pk_template_for329
  )  
  extent size 32 next size 32 
  lock mode page;
revoke all on "informix".template_forum from "public" as "informix";


grant select on "informix".dual to "public" as "informix";
grant update on "informix".dual to "public" as "informix";
grant insert on "informix".dual to "public" as "informix";
grant delete on "informix".dual to "public" as "informix";
grant index on "informix".dual to "public" as "informix";
grant select on "informix".jiveforum to "public" as "informix";
grant update on "informix".jiveforum to "public" as "informix";
grant insert on "informix".jiveforum to "public" as "informix";
grant delete on "informix".jiveforum to "public" as "informix";
grant index on "informix".jiveforum to "public" as "informix";
grant select on "informix".jiveforumprop to "public" as "informix";
grant update on "informix".jiveforumprop to "public" as "informix";
grant insert on "informix".jiveforumprop to "public" as "informix";
grant delete on "informix".jiveforumprop to "public" as "informix";
grant index on "informix".jiveforumprop to "public" as "informix";
grant select on "informix".jivethreadprop to "public" as "informix";
grant update on "informix".jivethreadprop to "public" as "informix";
grant insert on "informix".jivethreadprop to "public" as "informix";
grant delete on "informix".jivethreadprop to "public" as "informix";
grant index on "informix".jivethreadprop to "public" as "informix";
grant select on "informix".jivemessageprop to "public" as "informix";
grant update on "informix".jivemessageprop to "public" as "informix";
grant insert on "informix".jivemessageprop to "public" as "informix";
grant delete on "informix".jivemessageprop to "public" as "informix";
grant index on "informix".jivemessageprop to "public" as "informix";
grant select on "informix".jiveannounce to "public" as "informix";
grant update on "informix".jiveannounce to "public" as "informix";
grant insert on "informix".jiveannounce to "public" as "informix";
grant delete on "informix".jiveannounce to "public" as "informix";
grant index on "informix".jiveannounce to "public" as "informix";
grant select on "informix".jiveannounceprop to "public" as "informix";
grant update on "informix".jiveannounceprop to "public" as "informix";
grant insert on "informix".jiveannounceprop to "public" as "informix";
grant delete on "informix".jiveannounceprop to "public" as "informix";
grant index on "informix".jiveannounceprop to "public" as "informix";
grant select on "informix".jivepmessage to "public" as "informix";
grant update on "informix".jivepmessage to "public" as "informix";
grant insert on "informix".jivepmessage to "public" as "informix";
grant delete on "informix".jivepmessage to "public" as "informix";
grant index on "informix".jivepmessage to "public" as "informix";
grant select on "informix".jivepmessageprop to "public" as "informix";
grant update on "informix".jivepmessageprop to "public" as "informix";
grant insert on "informix".jivepmessageprop to "public" as "informix";
grant delete on "informix".jivepmessageprop to "public" as "informix";
grant index on "informix".jivepmessageprop to "public" as "informix";
grant select on "informix".jivepmessagefldr to "public" as "informix";
grant update on "informix".jivepmessagefldr to "public" as "informix";
grant insert on "informix".jivepmessagefldr to "public" as "informix";
grant delete on "informix".jivepmessagefldr to "public" as "informix";
grant index on "informix".jivepmessagefldr to "public" as "informix";
grant select on "informix".jiveuserperm to "public" as "informix";
grant update on "informix".jiveuserperm to "public" as "informix";
grant insert on "informix".jiveuserperm to "public" as "informix";
grant delete on "informix".jiveuserperm to "public" as "informix";
grant index on "informix".jiveuserperm to "public" as "informix";
grant select on "informix".jiveuserprop to "public" as "informix";
grant update on "informix".jiveuserprop to "public" as "informix";
grant insert on "informix".jiveuserprop to "public" as "informix";
grant delete on "informix".jiveuserprop to "public" as "informix";
grant index on "informix".jiveuserprop to "public" as "informix";
grant select on "informix".jivegroup to "public" as "informix";
grant update on "informix".jivegroup to "public" as "informix";
grant insert on "informix".jivegroup to "public" as "informix";
grant delete on "informix".jivegroup to "public" as "informix";
grant index on "informix".jivegroup to "public" as "informix";
grant select on "informix".jivegroupperm to "public" as "informix";
grant update on "informix".jivegroupperm to "public" as "informix";
grant insert on "informix".jivegroupperm to "public" as "informix";
grant delete on "informix".jivegroupperm to "public" as "informix";
grant index on "informix".jivegroupperm to "public" as "informix";
grant select on "informix".jivegroupprop to "public" as "informix";
grant update on "informix".jivegroupprop to "public" as "informix";
grant insert on "informix".jivegroupprop to "public" as "informix";
grant delete on "informix".jivegroupprop to "public" as "informix";
grant index on "informix".jivegroupprop to "public" as "informix";
grant select on "informix".jivegroupuser to "public" as "informix";
grant update on "informix".jivegroupuser to "public" as "informix";
grant insert on "informix".jivegroupuser to "public" as "informix";
grant delete on "informix".jivegroupuser to "public" as "informix";
grant index on "informix".jivegroupuser to "public" as "informix";
grant select on "informix".jiveid to "public" as "informix";
grant update on "informix".jiveid to "public" as "informix";
grant insert on "informix".jiveid to "public" as "informix";
grant delete on "informix".jiveid to "public" as "informix";
grant index on "informix".jiveid to "public" as "informix";
grant select on "informix".jiveproperty to "public" as "informix";
grant update on "informix".jiveproperty to "public" as "informix";
grant insert on "informix".jiveproperty to "public" as "informix";
grant delete on "informix".jiveproperty to "public" as "informix";
grant index on "informix".jiveproperty to "public" as "informix";
grant select on "informix".jivemoderation to "public" as "informix";
grant update on "informix".jivemoderation to "public" as "informix";
grant insert on "informix".jivemoderation to "public" as "informix";
grant delete on "informix".jivemoderation to "public" as "informix";
grant index on "informix".jivemoderation to "public" as "informix";
grant select on "informix".jivewatch to "public" as "informix";
grant update on "informix".jivewatch to "public" as "informix";
grant insert on "informix".jivewatch to "public" as "informix";
grant delete on "informix".jivewatch to "public" as "informix";
grant index on "informix".jivewatch to "public" as "informix";
grant select on "informix".jivebatchwatch to "public" as "informix";
grant update on "informix".jivebatchwatch to "public" as "informix";
grant insert on "informix".jivebatchwatch to "public" as "informix";
grant delete on "informix".jivebatchwatch to "public" as "informix";
grant index on "informix".jivebatchwatch to "public" as "informix";
grant select on "informix".jivereward to "public" as "informix";
grant update on "informix".jivereward to "public" as "informix";
grant insert on "informix".jivereward to "public" as "informix";
grant delete on "informix".jivereward to "public" as "informix";
grant index on "informix".jivereward to "public" as "informix";
grant select on "informix".jiveuserreward to "public" as "informix";
grant update on "informix".jiveuserreward to "public" as "informix";
grant insert on "informix".jiveuserreward to "public" as "informix";
grant delete on "informix".jiveuserreward to "public" as "informix";
grant index on "informix".jiveuserreward to "public" as "informix";
grant select on "informix".jiveattachment to "public" as "informix";
grant update on "informix".jiveattachment to "public" as "informix";
grant insert on "informix".jiveattachment to "public" as "informix";
grant delete on "informix".jiveattachment to "public" as "informix";
grant index on "informix".jiveattachment to "public" as "informix";
grant select on "informix".jiveattachdata to "public" as "informix";
grant update on "informix".jiveattachdata to "public" as "informix";
grant insert on "informix".jiveattachdata to "public" as "informix";
grant delete on "informix".jiveattachdata to "public" as "informix";
grant index on "informix".jiveattachdata to "public" as "informix";
grant select on "informix".jiveattachmentprop to "public" as "informix";
grant update on "informix".jiveattachmentprop to "public" as "informix";
grant insert on "informix".jiveattachmentprop to "public" as "informix";
grant delete on "informix".jiveattachmentprop to "public" as "informix";
grant index on "informix".jiveattachmentprop to "public" as "informix";
grant select on "informix".jivecategory to "public" as "informix";
grant update on "informix".jivecategory to "public" as "informix";
grant insert on "informix".jivecategory to "public" as "informix";
grant delete on "informix".jivecategory to "public" as "informix";
grant index on "informix".jivecategory to "public" as "informix";
grant select on "informix".jivecategoryprop to "public" as "informix";
grant update on "informix".jivecategoryprop to "public" as "informix";
grant insert on "informix".jivecategoryprop to "public" as "informix";
grant delete on "informix".jivecategoryprop to "public" as "informix";
grant index on "informix".jivecategoryprop to "public" as "informix";
grant select on "informix".jiveuserroster to "public" as "informix";
grant update on "informix".jiveuserroster to "public" as "informix";
grant insert on "informix".jiveuserroster to "public" as "informix";
grant delete on "informix".jiveuserroster to "public" as "informix";
grant index on "informix".jiveuserroster to "public" as "informix";
grant select on "informix".jivereadtracker to "public" as "informix";
grant update on "informix".jivereadtracker to "public" as "informix";
grant insert on "informix".jivereadtracker to "public" as "informix";
grant delete on "informix".jivereadtracker to "public" as "informix";
grant index on "informix".jivereadtracker to "public" as "informix";
grant select on "informix".jiveratingtype to "public" as "informix";
grant update on "informix".jiveratingtype to "public" as "informix";
grant insert on "informix".jiveratingtype to "public" as "informix";
grant delete on "informix".jiveratingtype to "public" as "informix";
grant index on "informix".jiveratingtype to "public" as "informix";
grant select on "informix".jiverating to "public" as "informix";
grant update on "informix".jiverating to "public" as "informix";
grant insert on "informix".jiverating to "public" as "informix";
grant delete on "informix".jiverating to "public" as "informix";
grant index on "informix".jiverating to "public" as "informix";
grant select on "informix".jivepolloption to "public" as "informix";
grant update on "informix".jivepolloption to "public" as "informix";
grant insert on "informix".jivepolloption to "public" as "informix";
grant delete on "informix".jivepolloption to "public" as "informix";
grant index on "informix".jivepolloption to "public" as "informix";
grant select on "informix".jivepollvote to "public" as "informix";
grant update on "informix".jivepollvote to "public" as "informix";
grant insert on "informix".jivepollvote to "public" as "informix";
grant delete on "informix".jivepollvote to "public" as "informix";
grant index on "informix".jivepollvote to "public" as "informix";
grant select on "informix".jivesearch to "public" as "informix";
grant update on "informix".jivesearch to "public" as "informix";
grant insert on "informix".jivesearch to "public" as "informix";
grant delete on "informix".jivesearch to "public" as "informix";
grant index on "informix".jivesearch to "public" as "informix";
grant select on "informix".jivesearchcriteria to "public" as "informix";
grant update on "informix".jivesearchcriteria to "public" as "informix";
grant insert on "informix".jivesearchcriteria to "public" as "informix";
grant delete on "informix".jivesearchcriteria to "public" as "informix";
grant index on "informix".jivesearchcriteria to "public" as "informix";
grant select on "informix".jivesearchclick to "public" as "informix";
grant update on "informix".jivesearchclick to "public" as "informix";
grant insert on "informix".jivesearchclick to "public" as "informix";
grant delete on "informix".jivesearchclick to "public" as "informix";
grant index on "informix".jivesearchclick to "public" as "informix";
grant select on "informix".jiveviewcount to "public" as "informix";
grant update on "informix".jiveviewcount to "public" as "informix";
grant insert on "informix".jiveviewcount to "public" as "informix";
grant delete on "informix".jiveviewcount to "public" as "informix";
grant index on "informix".jiveviewcount to "public" as "informix";
grant select on "informix".jivereadstat to "public" as "informix";
grant update on "informix".jivereadstat to "public" as "informix";
grant insert on "informix".jivereadstat to "public" as "informix";
grant delete on "informix".jivereadstat to "public" as "informix";
grant index on "informix".jivereadstat to "public" as "informix";
grant select on "informix".jivereadstatsession to "public" as "informix";
grant update on "informix".jivereadstatsession to "public" as "informix";
grant insert on "informix".jivereadstatsession to "public" as "informix";
grant delete on "informix".jivereadstatsession to "public" as "informix";
grant index on "informix".jivereadstatsession to "public" as "informix";
grant select on "informix".jivehttpreadstatsession to "public" as "informix";
grant update on "informix".jivehttpreadstatsession to "public" as "informix";
grant insert on "informix".jivehttpreadstatsession to "public" as "informix";
grant delete on "informix".jivehttpreadstatsession to "public" as "informix";
grant index on "informix".jivehttpreadstatsession to "public" as "informix";
grant select on "informix".jivenntpreadstatsession to "public" as "informix";
grant update on "informix".jivenntpreadstatsession to "public" as "informix";
grant insert on "informix".jivenntpreadstatsession to "public" as "informix";
grant delete on "informix".jivenntpreadstatsession to "public" as "informix";
grant index on "informix".jivenntpreadstatsession to "public" as "informix";
grant select on "informix".jivemessage to "public" as "informix";
grant update on "informix".jivemessage to "public" as "informix";
grant insert on "informix".jivemessage to "public" as "informix";
grant delete on "informix".jivemessage to "public" as "informix";
grant index on "informix".jivemessage to "public" as "informix";
grant select on "informix".jivethread to "public" as "informix";
grant update on "informix".jivethread to "public" as "informix";
grant insert on "informix".jivethread to "public" as "informix";
grant delete on "informix".jivethread to "public" as "informix";
grant index on "informix".jivethread to "public" as "informix";
grant select on "informix".message_history to "public" as "informix";
grant update on "informix".message_history to "public" as "informix";
grant insert on "informix".message_history to "public" as "informix";
grant delete on "informix".message_history to "public" as "informix";
grant index on "informix".message_history to "public" as "informix";
grant select on "informix".jivepoll to "public" as "informix";
grant update on "informix".jivepoll to "public" as "informix";
grant insert on "informix".jivepoll to "public" as "informix";
grant delete on "informix".jivepoll to "public" as "informix";
grant index on "informix".jivepoll to "public" as "informix";
grant select on "informix".template to "public" as "informix";
grant update on "informix".template to "public" as "informix";
grant insert on "informix".template to "public" as "informix";
grant delete on "informix".template to "public" as "informix";
grant select on "informix".template_forum to "public" as "informix";
grant update on "informix".template_forum to "public" as "informix";
grant insert on "informix".template_forum to "public" as "informix";
grant delete on "informix".template_forum to "public" as "informix";