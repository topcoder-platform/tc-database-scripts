-- MySQL dump 10.11
--
-- Host: localhost    Database: bugs_oltp
-- ------------------------------------------------------
-- Server version	5.0.67-community-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OS_CURRENTSTEP`
--

DROP TABLE IF EXISTS `OS_CURRENTSTEP`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `OS_CURRENTSTEP` (
  `ID` decimal(18,0) NOT NULL,
  `ENTRY_ID` decimal(18,0) default NULL,
  `STEP_ID` decimal(9,0) default NULL,
  `ACTION_ID` decimal(9,0) default NULL,
  `OWNER` varchar(60) collate utf8_bin default NULL,
  `START_DATE` datetime default NULL,
  `DUE_DATE` datetime default NULL,
  `FINISH_DATE` datetime default NULL,
  `STATUS` varchar(60) collate utf8_bin default NULL,
  `CALLER` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `wf_entryid` (`ENTRY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OS_CURRENTSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_CURRENTSTEP_PREV`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `OS_CURRENTSTEP_PREV` (
  `ID` decimal(18,0) NOT NULL,
  `PREVIOUS_ID` decimal(18,0) NOT NULL,
  PRIMARY KEY  (`ID`,`PREVIOUS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OS_HISTORYSTEP`
--

DROP TABLE IF EXISTS `OS_HISTORYSTEP`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `OS_HISTORYSTEP` (
  `ID` decimal(18,0) NOT NULL,
  `ENTRY_ID` decimal(18,0) default NULL,
  `STEP_ID` decimal(9,0) default NULL,
  `ACTION_ID` decimal(9,0) default NULL,
  `OWNER` varchar(60) collate utf8_bin default NULL,
  `START_DATE` datetime default NULL,
  `DUE_DATE` datetime default NULL,
  `FINISH_DATE` datetime default NULL,
  `STATUS` varchar(60) collate utf8_bin default NULL,
  `CALLER` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OS_HISTORYSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_HISTORYSTEP_PREV`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `OS_HISTORYSTEP_PREV` (
  `ID` decimal(18,0) NOT NULL,
  `PREVIOUS_ID` decimal(18,0) NOT NULL,
  PRIMARY KEY  (`ID`,`PREVIOUS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OS_WFENTRY`
--

DROP TABLE IF EXISTS `OS_WFENTRY`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `OS_WFENTRY` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `INITIALIZED` decimal(9,0) default NULL,
  `STATE` decimal(9,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SEQUENCE_VALUE_ITEM`
--

DROP TABLE IF EXISTS `SEQUENCE_VALUE_ITEM`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SEQUENCE_VALUE_ITEM` (
  `SEQ_NAME` varchar(60) collate utf8_bin NOT NULL,
  `SEQ_ID` decimal(18,0) default NULL,
  PRIMARY KEY  (`SEQ_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `avatar` (
  `ID` decimal(18,0) NOT NULL,
  `filename` varchar(255) collate utf8_bin default NULL,
  `contenttype` varchar(255) collate utf8_bin default NULL,
  `avatartype` varchar(60) collate utf8_bin default NULL,
  `owner` varchar(255) collate utf8_bin default NULL,
  `systemavatar` decimal(9,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `avatar_index` (`avatartype`,`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `changegroup`
--

DROP TABLE IF EXISTS `changegroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `changegroup` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) default NULL,
  `AUTHOR` varchar(255) collate utf8_bin default NULL,
  `CREATED` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `chggroup_issue` (`issueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `changeitem`
--

DROP TABLE IF EXISTS `changeitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `changeitem` (
  `ID` decimal(18,0) NOT NULL,
  `groupid` decimal(18,0) default NULL,
  `FIELDTYPE` varchar(255) collate utf8_bin default NULL,
  `FIELD` varchar(255) collate utf8_bin default NULL,
  `OLDVALUE` longtext collate utf8_bin,
  `OLDSTRING` longtext collate utf8_bin,
  `NEWVALUE` longtext collate utf8_bin,
  `NEWSTRING` longtext collate utf8_bin,
  PRIMARY KEY  (`ID`),
  KEY `chgitem_chggrp` (`groupid`),
  KEY `chgitem_field` (`FIELD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `columnlayout`
--

DROP TABLE IF EXISTS `columnlayout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `columnlayout` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) collate utf8_bin default NULL,
  `SEARCHREQUEST` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `columnlayoutitem`
--

DROP TABLE IF EXISTS `columnlayoutitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `columnlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `COLUMNLAYOUT` decimal(18,0) default NULL,
  `FIELDIDENTIFIER` varchar(255) collate utf8_bin default NULL,
  `HORIZONTALPOSITION` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command` (
  `command_id` int(11) NOT NULL,
  `command_desc` varchar(100) collate utf8_bin default NULL,
  `command_group_id` int(11) default NULL,
  PRIMARY KEY  (`command_id`),
  UNIQUE KEY `command_pkey` (`command_id`),
  KEY `command_command_group_fkey` (`command_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command_execution`
--

DROP TABLE IF EXISTS `command_execution`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command_execution` (
  `command_id` int(11) default NULL,
  `timestamp` date default NULL,
  `execution_time` int(11) default NULL,
  KEY `command_execution_command_fkey` (`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command_group_lu`
--

DROP TABLE IF EXISTS `command_group_lu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command_group_lu` (
  `command_group_id` int(11) NOT NULL,
  `command_group_name` varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (`command_group_id`),
  UNIQUE KEY `command_group_lu_pkey` (`command_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command_query_xref`
--

DROP TABLE IF EXISTS `command_query_xref`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command_query_xref` (
  `command_id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  `sort_order` int(11) default NULL,
  PRIMARY KEY  (`command_id`,`query_id`),
  UNIQUE KEY `command_query_xref_pkey` (`command_id`,`query_id`),
  KEY `command_query_query_fkey` (`query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `component` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECT` decimal(18,0) default NULL,
  `cname` varchar(255) collate utf8_bin default NULL,
  `description` text collate utf8_bin,
  `URL` varchar(255) collate utf8_bin default NULL,
  `LEAD` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEETYPE` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `configurationcontext`
--

DROP TABLE IF EXISTS `configurationcontext`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `configurationcontext` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECTCATEGORY` decimal(18,0) default NULL,
  `PROJECT` decimal(18,0) default NULL,
  `customfield` varchar(255) collate utf8_bin default NULL,
  `FIELDCONFIGSCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `confcontext` (`PROJECTCATEGORY`,`PROJECT`,`customfield`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customfield`
--

DROP TABLE IF EXISTS `customfield`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customfield` (
  `ID` decimal(18,0) NOT NULL,
  `CUSTOMFIELDTYPEKEY` varchar(255) collate utf8_bin default NULL,
  `CUSTOMFIELDSEARCHERKEY` varchar(255) collate utf8_bin default NULL,
  `cfname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `defaultvalue` varchar(255) collate utf8_bin default NULL,
  `FIELDTYPE` decimal(18,0) default NULL,
  `PROJECT` decimal(18,0) default NULL,
  `ISSUETYPE` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customfieldoption`
--

DROP TABLE IF EXISTS `customfieldoption`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customfieldoption` (
  `ID` decimal(18,0) NOT NULL,
  `CUSTOMFIELD` decimal(18,0) default NULL,
  `CUSTOMFIELDCONFIG` decimal(18,0) default NULL,
  `PARENTOPTIONID` decimal(18,0) default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `customvalue` varchar(255) collate utf8_bin default NULL,
  `optiontype` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `cf_cfoption` (`CUSTOMFIELD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customfieldvalue`
--

DROP TABLE IF EXISTS `customfieldvalue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customfieldvalue` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUE` decimal(18,0) default NULL,
  `CUSTOMFIELD` decimal(18,0) default NULL,
  `PARENTKEY` varchar(255) collate utf8_bin default NULL,
  `STRINGVALUE` varchar(255) collate utf8_bin default NULL,
  `NUMBERVALUE` decimal(18,6) default NULL,
  `TEXTVALUE` longtext collate utf8_bin,
  `DATEVALUE` datetime default NULL,
  `VALUETYPE` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `cfvalue_issue` (`ISSUE`,`CUSTOMFIELD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `external_entities`
--

DROP TABLE IF EXISTS `external_entities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `external_entities` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `entitytype` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ext_entity_name` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `externalgadget`
--

DROP TABLE IF EXISTS `externalgadget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `externalgadget` (
  `ID` decimal(18,0) NOT NULL,
  `GADGET_XML` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `favouriteassociations`
--

DROP TABLE IF EXISTS `favouriteassociations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `favouriteassociations` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) collate utf8_bin default NULL,
  `entitytype` varchar(60) collate utf8_bin default NULL,
  `entityid` decimal(18,0) default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `favourite_index` (`USERNAME`,`entitytype`,`entityid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldconfigscheme`
--

DROP TABLE IF EXISTS `fieldconfigscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldconfigscheme` (
  `ID` decimal(18,0) NOT NULL,
  `configname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `FIELDID` varchar(60) collate utf8_bin default NULL,
  `CUSTOMFIELD` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fcs_fieldid` (`FIELDID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldconfigschemeissuetype`
--

DROP TABLE IF EXISTS `fieldconfigschemeissuetype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldconfigschemeissuetype` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) collate utf8_bin default NULL,
  `FIELDCONFIGSCHEME` decimal(18,0) default NULL,
  `FIELDCONFIGURATION` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fcs_issuetype` (`ISSUETYPE`),
  KEY `fcs_scheme` (`FIELDCONFIGSCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldconfiguration`
--

DROP TABLE IF EXISTS `fieldconfiguration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `configname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `FIELDID` varchar(60) collate utf8_bin default NULL,
  `CUSTOMFIELD` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fc_fieldid` (`FIELDID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldlayout`
--

DROP TABLE IF EXISTS `fieldlayout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldlayout` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  `layout_type` varchar(255) collate utf8_bin default NULL,
  `LAYOUTSCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldlayoutitem`
--

DROP TABLE IF EXISTS `fieldlayoutitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDLAYOUT` decimal(18,0) default NULL,
  `FIELDIDENTIFIER` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `VERTICALPOSITION` decimal(18,0) default NULL,
  `ISHIDDEN` varchar(60) collate utf8_bin default NULL,
  `ISREQUIRED` varchar(60) collate utf8_bin default NULL,
  `RENDERERTYPE` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldlayoutscheme`
--

DROP TABLE IF EXISTS `fieldlayoutscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldlayoutscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldlayoutschemeassociation`
--

DROP TABLE IF EXISTS `fieldlayoutschemeassociation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldlayoutschemeassociation` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) collate utf8_bin default NULL,
  `PROJECT` decimal(18,0) default NULL,
  `FIELDLAYOUTSCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fl_scheme_assoc` (`PROJECT`,`ISSUETYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldlayoutschemeentity`
--

DROP TABLE IF EXISTS `fieldlayoutschemeentity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldlayoutschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) default NULL,
  `issuetype` varchar(255) collate utf8_bin default NULL,
  `FIELDLAYOUT` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fieldlayout_scheme` (`SCHEME`),
  KEY `fieldlayout_layout` (`FIELDLAYOUT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldscreen`
--

DROP TABLE IF EXISTS `fieldscreen`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldscreen` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldscreenlayoutitem`
--

DROP TABLE IF EXISTS `fieldscreenlayoutitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldscreenlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDIDENTIFIER` varchar(255) collate utf8_bin default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `FIELDSCREENTAB` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fieldscitem_tab` (`FIELDSCREENTAB`),
  KEY `fieldscreen_field` (`FIELDIDENTIFIER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldscreenscheme`
--

DROP TABLE IF EXISTS `fieldscreenscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldscreenscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldscreenschemeitem`
--

DROP TABLE IF EXISTS `fieldscreenschemeitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldscreenschemeitem` (
  `ID` decimal(18,0) NOT NULL,
  `OPERATION` decimal(18,0) default NULL,
  `FIELDSCREEN` decimal(18,0) default NULL,
  `FIELDSCREENSCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `screenitem_scheme` (`FIELDSCREENSCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fieldscreentab`
--

DROP TABLE IF EXISTS `fieldscreentab`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fieldscreentab` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `FIELDSCREEN` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fieldscreen_tab` (`FIELDSCREEN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fileattachment`
--

DROP TABLE IF EXISTS `fileattachment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fileattachment` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) default NULL,
  `MIMETYPE` varchar(255) collate utf8_bin default NULL,
  `FILENAME` varchar(255) collate utf8_bin default NULL,
  `CREATED` datetime default NULL,
  `FILESIZE` decimal(18,0) default NULL,
  `AUTHOR` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `attach_issue` (`issueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `filtersubscription`
--

DROP TABLE IF EXISTS `filtersubscription`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `filtersubscription` (
  `ID` decimal(18,0) NOT NULL,
  `FILTER_I_D` decimal(18,0) default NULL,
  `USERNAME` varchar(60) collate utf8_bin default NULL,
  `groupname` varchar(60) collate utf8_bin default NULL,
  `LAST_RUN` datetime default NULL,
  `EMAIL_ON_EMPTY` varchar(10) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `subscrpt_user` (`FILTER_I_D`,`USERNAME`),
  KEY `subscrptn_group` (`FILTER_I_D`,`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gadgetuserpreference`
--

DROP TABLE IF EXISTS `gadgetuserpreference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gadgetuserpreference` (
  `ID` decimal(18,0) NOT NULL,
  `PORTLETCONFIGURATION` decimal(18,0) default NULL,
  `USERPREFKEY` varchar(255) collate utf8_bin default NULL,
  `USERPREFVALUE` longtext collate utf8_bin,
  PRIMARY KEY  (`ID`),
  KEY `userpref_portletconfiguration` (`PORTLETCONFIGURATION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genericconfiguration`
--

DROP TABLE IF EXISTS `genericconfiguration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `genericconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `DATATYPE` varchar(60) collate utf8_bin default NULL,
  `DATAKEY` varchar(60) collate utf8_bin default NULL,
  `XMLVALUE` text collate utf8_bin,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `type_key` (`DATATYPE`,`DATAKEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `groupbase`
--

DROP TABLE IF EXISTS `groupbase`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groupbase` (
  `ID` decimal(18,0) NOT NULL,
  `groupname` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `osgroup_name` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `input_lu`
--

DROP TABLE IF EXISTS `input_lu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `input_lu` (
  `input_id` int(11) NOT NULL,
  `input_code` varchar(25) collate utf8_bin default NULL,
  `data_type_id` int(11) default NULL,
  `input_desc` varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (`input_id`),
  UNIQUE KEY `input_lu_pkey` (`input_id`),
  UNIQUE KEY `input_code_idx` (`input_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuelink`
--

DROP TABLE IF EXISTS `issuelink`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuelink` (
  `ID` decimal(18,0) NOT NULL,
  `LINKTYPE` decimal(18,0) default NULL,
  `SOURCE` decimal(18,0) default NULL,
  `DESTINATION` decimal(18,0) default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `issuelink_src` (`SOURCE`),
  KEY `issuelink_dest` (`DESTINATION`),
  KEY `issuelink_type` (`LINKTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuelinktype`
--

DROP TABLE IF EXISTS `issuelinktype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuelinktype` (
  `ID` decimal(18,0) NOT NULL,
  `LINKNAME` varchar(255) collate utf8_bin default NULL,
  `INWARD` varchar(255) collate utf8_bin default NULL,
  `OUTWARD` varchar(255) collate utf8_bin default NULL,
  `pstyle` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `linktypename` (`LINKNAME`),
  KEY `linktypestyle` (`pstyle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuesecurityscheme`
--

DROP TABLE IF EXISTS `issuesecurityscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuesecurityscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `DEFAULTLEVEL` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuestatus`
--

DROP TABLE IF EXISTS `issuestatus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuestatus` (
  `ID` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `pname` varchar(60) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `ICONURL` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuetype`
--

DROP TABLE IF EXISTS `issuetype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuetype` (
  `ID` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `pname` varchar(60) collate utf8_bin default NULL,
  `pstyle` varchar(60) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `ICONURL` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuetypescreenscheme`
--

DROP TABLE IF EXISTS `issuetypescreenscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuetypescreenscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `issuetypescreenschemeentity`
--

DROP TABLE IF EXISTS `issuetypescreenschemeentity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `issuetypescreenschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) collate utf8_bin default NULL,
  `SCHEME` decimal(18,0) default NULL,
  `FIELDSCREENSCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fieldscreen_scheme` (`FIELDSCREENSCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiraaction`
--

DROP TABLE IF EXISTS `jiraaction`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiraaction` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) default NULL,
  `AUTHOR` varchar(255) collate utf8_bin default NULL,
  `actiontype` varchar(255) collate utf8_bin default NULL,
  `actionlevel` varchar(255) collate utf8_bin default NULL,
  `rolelevel` decimal(18,0) default NULL,
  `actionbody` longtext collate utf8_bin,
  `CREATED` datetime default NULL,
  `UPDATEAUTHOR` varchar(255) collate utf8_bin default NULL,
  `UPDATED` datetime default NULL,
  `actionnum` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `action_issue` (`issueid`,`actiontype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiradraftworkflows`
--

DROP TABLE IF EXISTS `jiradraftworkflows`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiradraftworkflows` (
  `ID` decimal(18,0) NOT NULL,
  `PARENTNAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTOR` longtext collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiraeventtype`
--

DROP TABLE IF EXISTS `jiraeventtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiraeventtype` (
  `ID` decimal(18,0) NOT NULL,
  `TEMPLATE_ID` decimal(18,0) default NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `event_type` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiraissue`
--

DROP TABLE IF EXISTS `jiraissue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiraissue` (
  `ID` decimal(18,0) NOT NULL,
  `pkey` varchar(255) collate utf8_bin default NULL,
  `PROJECT` decimal(18,0) default NULL,
  `REPORTER` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE` varchar(255) collate utf8_bin default NULL,
  `issuetype` varchar(255) collate utf8_bin default NULL,
  `SUMMARY` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` longtext collate utf8_bin,
  `ENVIRONMENT` longtext collate utf8_bin,
  `PRIORITY` varchar(255) collate utf8_bin default NULL,
  `RESOLUTION` varchar(255) collate utf8_bin default NULL,
  `issuestatus` varchar(255) collate utf8_bin default NULL,
  `CREATED` datetime default NULL,
  `UPDATED` datetime default NULL,
  `DUEDATE` datetime default NULL,
  `RESOLUTIONDATE` datetime default NULL,
  `VOTES` decimal(18,0) default NULL,
  `TIMEORIGINALESTIMATE` decimal(18,0) default NULL,
  `TIMEESTIMATE` decimal(18,0) default NULL,
  `TIMESPENT` decimal(18,0) default NULL,
  `WORKFLOW_ID` decimal(18,0) default NULL,
  `SECURITY` decimal(18,0) default NULL,
  `FIXFOR` decimal(18,0) default NULL,
  `COMPONENT` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `issue_key` (`pkey`),
  KEY `issue_proj_status` (`PROJECT`,`issuestatus`),
  KEY `issue_assignee` (`ASSIGNEE`),
  KEY `issue_workflow` (`WORKFLOW_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiraperms`
--

DROP TABLE IF EXISTS `jiraperms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiraperms` (
  `ID` decimal(18,0) NOT NULL,
  `permtype` decimal(18,0) default NULL,
  `projectid` decimal(18,0) default NULL,
  `groupname` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jiraworkflows`
--

DROP TABLE IF EXISTS `jiraworkflows`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jiraworkflows` (
  `ID` decimal(18,0) NOT NULL,
  `workflowname` varchar(255) collate utf8_bin default NULL,
  `creatorname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTOR` longtext collate utf8_bin,
  `ISLOCKED` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `listenerconfig`
--

DROP TABLE IF EXISTS `listenerconfig`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `listenerconfig` (
  `ID` decimal(18,0) NOT NULL,
  `CLAZZ` varchar(255) collate utf8_bin default NULL,
  `listenername` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mailserver`
--

DROP TABLE IF EXISTS `mailserver`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mailserver` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `mailfrom` varchar(255) collate utf8_bin default NULL,
  `PREFIX` varchar(60) collate utf8_bin default NULL,
  `smtp_port` varchar(60) collate utf8_bin default NULL,
  `server_type` varchar(60) collate utf8_bin default NULL,
  `SERVERNAME` varchar(255) collate utf8_bin default NULL,
  `JNDILOCATION` varchar(255) collate utf8_bin default NULL,
  `mailusername` varchar(255) collate utf8_bin default NULL,
  `mailpassword` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membershipbase`
--

DROP TABLE IF EXISTS `membershipbase`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `membershipbase` (
  `ID` decimal(18,0) NOT NULL,
  `USER_NAME` varchar(255) collate utf8_bin default NULL,
  `GROUP_NAME` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `mshipbase_user` (`USER_NAME`),
  KEY `mshipbase_group` (`GROUP_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nodeassociation`
--

DROP TABLE IF EXISTS `nodeassociation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `nodeassociation` (
  `SOURCE_NODE_ID` decimal(18,0) NOT NULL,
  `SOURCE_NODE_ENTITY` varchar(60) collate utf8_bin NOT NULL,
  `SINK_NODE_ID` decimal(18,0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) collate utf8_bin NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(9,0) default NULL,
  PRIMARY KEY  (`SOURCE_NODE_ID`,`SOURCE_NODE_ENTITY`,`SINK_NODE_ID`,`SINK_NODE_ENTITY`,`ASSOCIATION_TYPE`),
  KEY `node_source` (`SOURCE_NODE_ID`,`SOURCE_NODE_ENTITY`),
  KEY `node_sink` (`SINK_NODE_ID`,`SINK_NODE_ENTITY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notification` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) default NULL,
  `EVENT` varchar(60) collate utf8_bin default NULL,
  `EVENT_TYPE_ID` decimal(18,0) default NULL,
  `TEMPLATE_ID` decimal(18,0) default NULL,
  `notif_type` varchar(60) collate utf8_bin default NULL,
  `notif_parameter` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ntfctn_scheme` (`SCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notificationinstance`
--

DROP TABLE IF EXISTS `notificationinstance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notificationinstance` (
  `ID` decimal(18,0) NOT NULL,
  `notificationtype` varchar(60) collate utf8_bin default NULL,
  `SOURCE` decimal(18,0) default NULL,
  `emailaddress` varchar(255) collate utf8_bin default NULL,
  `MESSAGEID` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `notif_source` (`SOURCE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notificationscheme`
--

DROP TABLE IF EXISTS `notificationscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notificationscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oauthconsumer`
--

DROP TABLE IF EXISTS `oauthconsumer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oauthconsumer` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime default NULL,
  `consumername` varchar(255) collate utf8_bin default NULL,
  `CONSUMER_KEY` varchar(255) collate utf8_bin default NULL,
  `consumerservice` varchar(255) collate utf8_bin default NULL,
  `PUBLIC_KEY` text collate utf8_bin,
  `PRIVATE_KEY` text collate utf8_bin,
  `DESCRIPTION` text collate utf8_bin,
  `CALLBACK` text collate utf8_bin,
  `SIGNATURE_METHOD` varchar(60) collate utf8_bin default NULL,
  `SHARED_SECRET` text collate utf8_bin,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `oauth_consumer_index` (`CONSUMER_KEY`),
  UNIQUE KEY `oauth_consumer_service_index` (`consumerservice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oauthconsumertoken`
--

DROP TABLE IF EXISTS `oauthconsumertoken`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oauthconsumertoken` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime default NULL,
  `TOKEN_KEY` varchar(255) collate utf8_bin default NULL,
  `TOKEN` varchar(255) collate utf8_bin default NULL,
  `TOKEN_SECRET` varchar(255) collate utf8_bin default NULL,
  `TOKEN_TYPE` varchar(60) collate utf8_bin default NULL,
  `CONSUMER_KEY` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `oauth_consumer_token_key_index` (`TOKEN_KEY`),
  KEY `oauth_consumer_token_index` (`TOKEN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oauthspconsumer`
--

DROP TABLE IF EXISTS `oauthspconsumer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oauthspconsumer` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime default NULL,
  `CONSUMER_KEY` varchar(255) collate utf8_bin default NULL,
  `consumername` varchar(255) collate utf8_bin default NULL,
  `PUBLIC_KEY` text collate utf8_bin,
  `DESCRIPTION` text collate utf8_bin,
  `CALLBACK` text collate utf8_bin,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `oauth_sp_consumer_index` (`CONSUMER_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oauthsptoken`
--

DROP TABLE IF EXISTS `oauthsptoken`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oauthsptoken` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime default NULL,
  `TOKEN` varchar(255) collate utf8_bin default NULL,
  `TOKEN_SECRET` varchar(255) collate utf8_bin default NULL,
  `TOKEN_TYPE` varchar(60) collate utf8_bin default NULL,
  `CONSUMER_KEY` varchar(255) collate utf8_bin default NULL,
  `USERNAME` varchar(255) collate utf8_bin default NULL,
  `TTL` decimal(18,0) default NULL,
  `spauth` varchar(60) collate utf8_bin default NULL,
  `CALLBACK` text collate utf8_bin,
  `spverifier` varchar(255) collate utf8_bin default NULL,
  `spversion` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `oauth_sp_token_index` (`TOKEN`),
  KEY `oauth_sp_consumer_key_index` (`CONSUMER_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `optionconfiguration`
--

DROP TABLE IF EXISTS `optionconfiguration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `optionconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDID` varchar(60) collate utf8_bin default NULL,
  `OPTIONID` varchar(60) collate utf8_bin default NULL,
  `FIELDCONFIG` decimal(18,0) default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fieldid_optionid` (`FIELDID`,`OPTIONID`),
  KEY `fieldid_fieldconf` (`FIELDID`,`FIELDCONFIG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `permissionscheme`
--

DROP TABLE IF EXISTS `permissionscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permissionscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pluginversion`
--

DROP TABLE IF EXISTS `pluginversion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pluginversion` (
  `ID` decimal(18,0) NOT NULL,
  `pluginname` varchar(255) collate utf8_bin default NULL,
  `pluginkey` varchar(255) collate utf8_bin default NULL,
  `pluginversion` varchar(255) collate utf8_bin default NULL,
  `CREATED` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portalpage`
--

DROP TABLE IF EXISTS `portalpage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portalpage` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) collate utf8_bin default NULL,
  `PAGENAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` varchar(255) collate utf8_bin default NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `FAV_COUNT` decimal(18,0) default NULL,
  `LAYOUT` varchar(255) collate utf8_bin default NULL,
  `ppversion` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portletconfiguration`
--

DROP TABLE IF EXISTS `portletconfiguration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portletconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `PORTALPAGE` decimal(18,0) default NULL,
  `PORTLET_ID` varchar(255) collate utf8_bin default NULL,
  `COLUMN_NUMBER` decimal(9,0) default NULL,
  `positionseq` decimal(9,0) default NULL,
  `GADGET_XML` text collate utf8_bin,
  `COLOR` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `priority` (
  `ID` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `pname` varchar(60) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `ICONURL` varchar(255) collate utf8_bin default NULL,
  `STATUS_COLOR` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `project` (
  `ID` decimal(18,0) NOT NULL,
  `pname` varchar(255) collate utf8_bin default NULL,
  `URL` varchar(255) collate utf8_bin default NULL,
  `LEAD` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `pkey` varchar(255) collate utf8_bin default NULL,
  `pcounter` decimal(18,0) default NULL,
  `ASSIGNEETYPE` decimal(18,0) default NULL,
  `AVATAR` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projectcategory`
--

DROP TABLE IF EXISTS `projectcategory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `projectcategory` (
  `ID` decimal(18,0) NOT NULL,
  `cname` varchar(255) collate utf8_bin default NULL,
  `description` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projectdependency`
--

DROP TABLE IF EXISTS `projectdependency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `projectdependency` (
  `PROJECT_ID` decimal(18,0) NOT NULL,
  `VERSION_ID` decimal(18,0) NOT NULL,
  `DEP_PROJECT_ID` decimal(18,0) NOT NULL,
  `DEP_VERSION_ID` decimal(18,0) NOT NULL,
  PRIMARY KEY  (`PROJECT_ID`,`VERSION_ID`,`DEP_PROJECT_ID`,`DEP_VERSION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projectrole`
--

DROP TABLE IF EXISTS `projectrole`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `projectrole` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projectroleactor`
--

DROP TABLE IF EXISTS `projectroleactor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `projectroleactor` (
  `ID` decimal(18,0) NOT NULL,
  `PID` decimal(18,0) default NULL,
  `PROJECTROLEID` decimal(18,0) default NULL,
  `ROLETYPE` varchar(255) collate utf8_bin default NULL,
  `ROLETYPEPARAMETER` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `role_player_idx` (`PROJECTROLEID`,`PID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projectversion`
--

DROP TABLE IF EXISTS `projectversion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `projectversion` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECT` decimal(18,0) default NULL,
  `vname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `SEQUENCE` decimal(18,0) default NULL,
  `RELEASED` varchar(10) collate utf8_bin default NULL,
  `ARCHIVED` varchar(10) collate utf8_bin default NULL,
  `URL` varchar(255) collate utf8_bin default NULL,
  `RELEASEDATE` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertydata`
--

DROP TABLE IF EXISTS `propertydata`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertydata` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` blob,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertydate`
--

DROP TABLE IF EXISTS `propertydate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertydate` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertydecimal`
--

DROP TABLE IF EXISTS `propertydecimal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertydecimal` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` decimal(18,6) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertyentry`
--

DROP TABLE IF EXISTS `propertyentry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertyentry` (
  `ID` decimal(18,0) NOT NULL,
  `ENTITY_NAME` varchar(255) collate utf8_bin default NULL,
  `ENTITY_ID` decimal(18,0) default NULL,
  `PROPERTY_KEY` varchar(255) collate utf8_bin default NULL,
  `propertytype` decimal(9,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `osproperty_all` (`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertynumber`
--

DROP TABLE IF EXISTS `propertynumber`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertynumber` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertystring`
--

DROP TABLE IF EXISTS `propertystring`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertystring` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propertytext`
--

DROP TABLE IF EXISTS `propertytext`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `propertytext` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` longtext collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_calendars` (
  `ID` decimal(18,0) default NULL,
  `CALENDAR_NAME` varchar(255) collate utf8_bin NOT NULL,
  `CALENDAR` text collate utf8_bin,
  PRIMARY KEY  (`CALENDAR_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_cron_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) default NULL,
  `cronExperssion` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_fired_triggers` (
  `ID` decimal(18,0) default NULL,
  `ENTRY_ID` varchar(255) collate utf8_bin NOT NULL,
  `trigger_id` decimal(18,0) default NULL,
  `TRIGGER_LISTENER` varchar(255) collate utf8_bin default NULL,
  `FIRED_TIME` datetime default NULL,
  `TRIGGER_STATE` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ENTRY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_job_details` (
  `ID` decimal(18,0) NOT NULL,
  `JOB_NAME` varchar(255) collate utf8_bin default NULL,
  `JOB_GROUP` varchar(255) collate utf8_bin default NULL,
  `CLASS_NAME` varchar(255) collate utf8_bin default NULL,
  `IS_DURABLE` varchar(60) collate utf8_bin default NULL,
  `IS_STATEFUL` varchar(60) collate utf8_bin default NULL,
  `REQUESTS_RECOVERY` varchar(60) collate utf8_bin default NULL,
  `JOB_DATA` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_job_listeners` (
  `ID` decimal(18,0) NOT NULL,
  `JOB` decimal(18,0) default NULL,
  `JOB_LISTENER` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_simple_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) default NULL,
  `REPEAT_COUNT` decimal(9,0) default NULL,
  `REPEAT_INTERVAL` decimal(18,0) default NULL,
  `TIMES_TRIGGERED` decimal(9,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_trigger_listeners` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) default NULL,
  `TRIGGER_LISTENER` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `qrtz_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `TRIGGER_NAME` varchar(255) collate utf8_bin default NULL,
  `TRIGGER_GROUP` varchar(255) collate utf8_bin default NULL,
  `JOB` decimal(18,0) default NULL,
  `NEXT_FIRE` datetime default NULL,
  `TRIGGER_STATE` varchar(255) collate utf8_bin default NULL,
  `TRIGGER_TYPE` varchar(60) collate utf8_bin default NULL,
  `START_TIME` datetime default NULL,
  `END_TIME` datetime default NULL,
  `CALENDAR_NAME` varchar(255) collate utf8_bin default NULL,
  `MISFIRE_INSTR` decimal(9,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `query` (
  `query_id` int(11) NOT NULL,
  `text` blob,
  `name` varchar(100) collate utf8_bin default NULL,
  `ranking` int(11) default NULL,
  `column_index` int(11) default NULL,
  PRIMARY KEY  (`query_id`),
  UNIQUE KEY `query_pkey` (`query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `query_input_xref`
--

DROP TABLE IF EXISTS `query_input_xref`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `query_input_xref` (
  `query_id` int(11) NOT NULL,
  `optional` char(1) collate utf8_bin default NULL,
  `default_value` varchar(100) collate utf8_bin default NULL,
  `input_id` int(11) NOT NULL,
  `sort_order` int(11) default NULL,
  PRIMARY KEY  (`query_id`,`input_id`),
  UNIQUE KEY `query_input_xref_pkey` (`query_id`,`input_id`),
  KEY `query_input_input_fkey` (`input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `resolution`
--

DROP TABLE IF EXISTS `resolution`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resolution` (
  `ID` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) default NULL,
  `pname` varchar(60) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `ICONURL` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `schemeissuesecurities`
--

DROP TABLE IF EXISTS `schemeissuesecurities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schemeissuesecurities` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) default NULL,
  `SECURITY` decimal(18,0) default NULL,
  `sec_type` varchar(255) collate utf8_bin default NULL,
  `sec_parameter` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `sec_scheme` (`SCHEME`),
  KEY `sec_security` (`SECURITY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `schemeissuesecuritylevels`
--

DROP TABLE IF EXISTS `schemeissuesecuritylevels`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schemeissuesecuritylevels` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `SCHEME` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `schemepermissions`
--

DROP TABLE IF EXISTS `schemepermissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schemepermissions` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) default NULL,
  `PERMISSION` decimal(18,0) default NULL,
  `perm_type` varchar(255) collate utf8_bin default NULL,
  `perm_parameter` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `prmssn_scheme` (`SCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `searchrequest`
--

DROP TABLE IF EXISTS `searchrequest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `searchrequest` (
  `ID` decimal(18,0) NOT NULL,
  `filtername` varchar(255) collate utf8_bin default NULL,
  `authorname` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  `username` varchar(255) collate utf8_bin default NULL,
  `groupname` varchar(255) collate utf8_bin default NULL,
  `projectid` decimal(18,0) default NULL,
  `reqcontent` longtext collate utf8_bin,
  `FAV_COUNT` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `sr_author` (`authorname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `serviceconfig`
--

DROP TABLE IF EXISTS `serviceconfig`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `serviceconfig` (
  `ID` decimal(18,0) NOT NULL,
  `delaytime` decimal(18,0) default NULL,
  `CLAZZ` varchar(255) collate utf8_bin default NULL,
  `servicename` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sharepermissions`
--

DROP TABLE IF EXISTS `sharepermissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sharepermissions` (
  `ID` decimal(18,0) NOT NULL,
  `entityid` decimal(18,0) default NULL,
  `entitytype` varchar(60) collate utf8_bin default NULL,
  `sharetype` varchar(10) collate utf8_bin default NULL,
  `PARAM1` varchar(255) collate utf8_bin default NULL,
  `PARAM2` varchar(60) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `share_index` (`entityid`,`entitytype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trackback_ping`
--

DROP TABLE IF EXISTS `trackback_ping`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trackback_ping` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUE` decimal(18,0) default NULL,
  `URL` varchar(255) collate utf8_bin default NULL,
  `TITLE` varchar(255) collate utf8_bin default NULL,
  `BLOGNAME` varchar(255) collate utf8_bin default NULL,
  `EXCERPT` varchar(255) collate utf8_bin default NULL,
  `CREATED` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trustedapp`
--

DROP TABLE IF EXISTS `trustedapp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trustedapp` (
  `ID` decimal(18,0) NOT NULL,
  `APPLICATION_ID` varchar(255) collate utf8_bin default NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `PUBLIC_KEY` text collate utf8_bin,
  `IP_MATCH` text collate utf8_bin,
  `URL_MATCH` text collate utf8_bin,
  `TIMEOUT` decimal(18,0) default NULL,
  `CREATED` datetime default NULL,
  `CREATED_BY` varchar(255) collate utf8_bin default NULL,
  `UPDATED` datetime default NULL,
  `UPDATED_BY` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `trustedapp_id` (`APPLICATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `upgradehistory`
--

DROP TABLE IF EXISTS `upgradehistory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `upgradehistory` (
  `ID` decimal(18,0) default NULL,
  `UPGRADECLASS` varchar(255) collate utf8_bin NOT NULL,
  `TARGETBUILD` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`UPGRADECLASS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `upgradeversionhistory`
--

DROP TABLE IF EXISTS `upgradeversionhistory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `upgradeversionhistory` (
  `ID` decimal(18,0) default NULL,
  `TIMEPERFORMED` datetime default NULL,
  `TARGETBUILD` varchar(255) collate utf8_bin NOT NULL,
  `TARGETVERSION` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`TARGETBUILD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userassociation`
--

DROP TABLE IF EXISTS `userassociation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userassociation` (
  `SOURCE_NAME` varchar(60) collate utf8_bin NOT NULL,
  `SINK_NODE_ID` decimal(18,0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) collate utf8_bin NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) collate utf8_bin NOT NULL,
  `SEQUENCE` decimal(9,0) default NULL,
  PRIMARY KEY  (`SOURCE_NAME`,`SINK_NODE_ID`,`SINK_NODE_ENTITY`,`ASSOCIATION_TYPE`),
  KEY `user_source` (`SOURCE_NAME`),
  KEY `user_sink` (`SINK_NODE_ID`,`SINK_NODE_ENTITY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userbase`
--

DROP TABLE IF EXISTS `userbase`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userbase` (
  `ID` decimal(18,0) NOT NULL,
  `username` varchar(255) default NULL,
  `PASSWORD_HASH` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `osuser_name` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userhistoryitem`
--

DROP TABLE IF EXISTS `userhistoryitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userhistoryitem` (
  `ID` decimal(18,0) NOT NULL,
  `entitytype` varchar(10) collate utf8_bin default NULL,
  `entityid` varchar(60) collate utf8_bin default NULL,
  `USERNAME` varchar(255) collate utf8_bin default NULL,
  `lastviewed` decimal(18,0) default NULL,
  `data` longtext collate utf8_bin,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `uh_type_user_entity` (`entitytype`,`USERNAME`,`entityid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `versioncontrol`
--

DROP TABLE IF EXISTS `versioncontrol`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `versioncontrol` (
  `ID` decimal(18,0) NOT NULL,
  `vcsname` varchar(255) collate utf8_bin default NULL,
  `vcsdescription` varchar(255) collate utf8_bin default NULL,
  `vcstype` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowscheme`
--

DROP TABLE IF EXISTS `workflowscheme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `workflowscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION` text collate utf8_bin,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowschemeentity`
--

DROP TABLE IF EXISTS `workflowschemeentity`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `workflowschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) default NULL,
  `WORKFLOW` varchar(255) collate utf8_bin default NULL,
  `issuetype` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`),
  KEY `workflow_scheme` (`SCHEME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worklog`
--

DROP TABLE IF EXISTS `worklog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `worklog` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) default NULL,
  `AUTHOR` varchar(255) collate utf8_bin default NULL,
  `grouplevel` varchar(255) collate utf8_bin default NULL,
  `rolelevel` decimal(18,0) default NULL,
  `worklogbody` longtext collate utf8_bin,
  `CREATED` datetime default NULL,
  `UPDATEAUTHOR` varchar(255) collate utf8_bin default NULL,
  `UPDATED` datetime default NULL,
  `STARTDATE` datetime default NULL,
  `timeworked` decimal(18,0) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `worklog_issue` (`issueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-22 19:51:07
