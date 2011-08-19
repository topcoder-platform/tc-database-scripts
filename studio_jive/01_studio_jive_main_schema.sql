CREATE DATABASE studio_jive IN datadbs WITH BUFFERED LOG;
database studio_jive;

grant dba to "informix";
grant connect to "coder";


create table "informix".dual 
  (
    value integer
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".dual from "public" as "informix";


create table "informix".jivepmessage 
  (
    messageid integer not null ,
    parentmessageid integer,
    threadid integer not null ,
    forumid integer not nul,
    forumindex integer not nul,
    userid integer,
    subject varchar(255),
    body text,
    modvalue integer not null ,
    rewardpoints integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (messageid)  constraint "informix".jivepmessage_pmid_pk
  )  
  extent size 16 next size 16 
  lock mode row;
revoke all on "informix".jivepmessage from "public" as "informix";


grant select on "informix".dual to "public" as "informix";
grant update on "informix".dual to "public" as "informix";
grant insert on "informix".dual to "public" as "informix";
grant delete on "informix".dual to "public" as "informix";
grant index on "informix".dual to "public" as "informix";
