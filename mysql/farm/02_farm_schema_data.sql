-- MySQL dump 10.9
--
-- Host: localhost    Database: farm
-- ------------------------------------------------------
-- Server version	5.0.27-standard

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `FARM_CLIENT`
--

DROP TABLE IF EXISTS `FARM_CLIENT`;
CREATE TABLE `FARM_CLIENT` (
  `CLI_ID` bigint(20) NOT NULL auto_increment,
  `DB_VERSION` int(11) NOT NULL,
  `NAME` varchar(30) default NULL,
  `TTL` bigint(20) NOT NULL,
  `ASSIGN_TTL` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  PRIMARY KEY  (`CLI_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_CLIENT`
--


/*!40000 ALTER TABLE `FARM_CLIENT` DISABLE KEYS */;
LOCK TABLES `FARM_CLIENT` WRITE;
INSERT INTO `FARM_CLIENT` VALUES 
	(1,0,'LongTester-TestSvc',864000000,600000,500),
	(2,0,'LongTester-MPSQAS',864000000,600000,450),
	(3,0,'Compiler-MPSQAS',30000,25000,200),
	(4,0,'Compiler-LS-TestSvc',30000,25000,400),
	(5,0,'Compiler-ReRound',30000,25000,400),
	(6,0,'SRMComp-Processor',60000,25000,400),
	(7,0,'SRMComp-admin',3600000,25000,350),
	(8,1,'SRMTest-Core',172800000,15000,400),
	(9,1,'MPSQASTest-MPSQAS',3600000,15000,200);
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_CLIENT` ENABLE KEYS */;

--
-- Table structure for table `FARM_INVOCATION`
--

DROP TABLE IF EXISTS `FARM_INVOCATION`;
CREATE TABLE `FARM_INVOCATION` (
  `INV_ID` bigint(20) NOT NULL auto_increment,
  `CLIENT_NAME` varchar(30) default NULL,
  `CLIENT_REQ_ID` varchar(60) default NULL,
  `CLIENT_ATTACHMENT` longblob,
  `RECEIVE_DATE` datetime NOT NULL,
  `DROP_DATE` datetime NOT NULL,
  `ASSIGN_DATE` datetime default NULL,
  `ASSIGN_TTL` bigint(20) NOT NULL,
  `SOLVE_DATE` datetime default NULL,
  `NOTIFY_DATE` datetime default NULL,
  `ASSIGN_PROCESSOR` varchar(30) default NULL,
  `STATUS` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `REQ_RESOURCES` int(11) NOT NULL,
  `REQUIREMENTS` longblob,
  `INVOCATION` longblob,
  `RESULT` longblob,
  PRIMARY KEY  (`INV_ID`),
  UNIQUE KEY `CLIENT_NAME` (`CLIENT_NAME`,`CLIENT_REQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_INVOCATION`
--


/*!40000 ALTER TABLE `FARM_INVOCATION` DISABLE KEYS */;
LOCK TABLES `FARM_INVOCATION` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_INVOCATION` ENABLE KEYS */;

--
-- Table structure for table `FARM_INVOCATION_PROPERTY`
--

DROP TABLE IF EXISTS `FARM_INVOCATION_PROPERTY`;
CREATE TABLE `FARM_INVOCATION_PROPERTY` (
  `IPR_ID` bigint(20) NOT NULL auto_increment,
  `INV_ID` bigint(20) NOT NULL,
  `PROP_NAME` varchar(30) NOT NULL,
  `SHO_ID` bigint(20) default NULL,
  PRIMARY KEY  (`IPR_ID`),
  UNIQUE KEY `INV_ID` (`INV_ID`,`PROP_NAME`),
  KEY `FK_FARM_INVPRO_SHO` (`SHO_ID`),
  KEY `FK_FARM_INVPRO_INV` (`INV_ID`),
  CONSTRAINT `FK_FARM_INVPRO_INV` FOREIGN KEY (`INV_ID`) REFERENCES `FARM_INVOCATION` (`INV_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_FARM_INVPRO_SHO` FOREIGN KEY (`SHO_ID`) REFERENCES `FARM_SHARED_OBJECT` (`SHO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_INVOCATION_PROPERTY`
--


/*!40000 ALTER TABLE `FARM_INVOCATION_PROPERTY` DISABLE KEYS */;
LOCK TABLES `FARM_INVOCATION_PROPERTY` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_INVOCATION_PROPERTY` ENABLE KEYS */;

--
-- Table structure for table `FARM_PROCESSOR`
--

DROP TABLE IF EXISTS `FARM_PROCESSOR`;
CREATE TABLE `FARM_PROCESSOR` (
  `PRC_ID` bigint(20) NOT NULL auto_increment,
  `DB_VERSION` int(11) NOT NULL,
  `NAME` varchar(20) default NULL,
  `MAX_TASKS` int(11) NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `PROC_PROPERTIES_ID` bigint(20) NOT NULL,
  PRIMARY KEY  (`PRC_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `FK_FARMPROC_TO_PROCPROPS` (`PROC_PROPERTIES_ID`),
  CONSTRAINT `FK_FARMPROC_TO_PROCPROPS` FOREIGN KEY (`PROC_PROPERTIES_ID`) REFERENCES `FARM_PROCESSOR_PROPERTIES` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_PROCESSOR`
--


/*!40000 ALTER TABLE `FARM_PROCESSOR` DISABLE KEYS */;
LOCK TABLES `FARM_PROCESSOR` WRITE;
INSERT INTO `FARM_PROCESSOR` VALUES (1,0,'PR-LX-1',2,'',1),(2,0,'PR-WN-1',2,'',2),(3,0,'LX-MM-TEST-CJP-1',1,'',3),(4,0,'LX-MM-TEST-CJP-2',1,'',3),(5,0,'LX-MM-TEST-CJP-3',1,'',3),(6,0,'WN-MM-TEST-NET-1',1,'',4),(7,0,'WN-MM-TEST-NET-2',1,'',4),(8,0,'WN-MM-TEST-NET-3',1,'',4),(9,0,'LX-IMM-COMP-CJP-1',2,'',5),(10,0,'LX-IMM-COMP-CJP-2',2,'',5),(11,0,'LX-IMM-TEST-CJP-1',1,'',10),(12,0,'LX-IMM-TEST-CJP-2',1,'',6),(13,0,'LX-IMM-TEST-CJP-3',1,'',6),(14,0,'WN-IMM-TEST-NET-1',1,'',7),(15,0,'WN-IMM-TEST-NET-2',1,'',7),(16,0,'WN-IMM-TEST-NET-3',1,'',7),(17,1,'LX-GEN-1',8,'',8),(18,0,'LX-GEN-2',2,'',8),(19,0,'LX-GEN-3',2,'',8),(20,0,'LX-GEN-4',2,'',8),(21,0,'LX-GEN-5',2,'',8),(22,0,'LX-GEN-6',2,'',8),(23,0,'LX-GEN-7',2,'',8),(24,0,'LX-GEN-8',2,'',8),(25,0,'LX-GEN-9',2,'',8),(26,0,'LX-GEN-10',2,'',8),(27,0,'LX-GEN-11',2,'',8),(28,0,'LX-GEN-12',2,'',8),(29,0,'LX-GEN-13',2,'',8),(30,0,'LX-GEN-14',2,'',8),(31,0,'LX-GEN-15',2,'',8),(32,0,'WN-GEN-1',2,'',9),(33,0,'WN-GEN-2',2,'',9),(34,0,'WN-GEN-3',2,'',9),(35,0,'WN-GEN-4',2,'',9),(36,0,'WN-GEN-5',2,'',9),(37,1,'AMD-1',1,'',10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_PROCESSOR` ENABLE KEYS */;

--
-- Table structure for table `FARM_PROCESSOR_PROPERTIES`
--

DROP TABLE IF EXISTS `FARM_PROCESSOR_PROPERTIES`;
CREATE TABLE `FARM_PROCESSOR_PROPERTIES` (
  `PRO_ID` bigint(20) NOT NULL auto_increment,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_PROCESSOR_PROPERTIES`
--


/*!40000 ALTER TABLE `FARM_PROCESSOR_PROPERTIES` DISABLE KEYS */;
LOCK TABLES `FARM_PROCESSOR_PROPERTIES` WRITE;
INSERT INTO `FARM_PROCESSOR_PROPERTIES` VALUES (1,'Linux Dev Generic'),(2,'Windows Dev Generic'),(3,'Linux MM Tester'),(4,'Windows MM Tester'),(5,'Linux IMM Compiler'),(6,'Linux IMM Tester'),(7,'Windows IMM Tester'),(8,'Linux Generic Processor'),(9,'Windows Generic Processor'),(10,'AMD Tester/Compiler'),(11,'AMD Compiler');
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_PROCESSOR_PROPERTIES` ENABLE KEYS */;

--
-- Table structure for table `FARM_PROC_PROPERTIES_MAP`
--

DROP TABLE IF EXISTS `FARM_PROC_PROPERTIES_MAP`;
CREATE TABLE `FARM_PROC_PROPERTIES_MAP` (
  `PRO_ID` bigint(20) NOT NULL,
  `PROPERTY_VALUE` longtext,
  `PROPERTY_NAME` varchar(50) NOT NULL,
  PRIMARY KEY  (`PRO_ID`,`PROPERTY_NAME`),
  KEY `FARMPROCPROPS_TO_PROCPROPMAP` (`PRO_ID`),
  CONSTRAINT `FARMPROCPROPS_TO_PROCPROPMAP` FOREIGN KEY (`PRO_ID`) REFERENCES `FARM_PROCESSOR_PROPERTIES` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_PROC_PROPERTIES_MAP`
--


/*!40000 ALTER TABLE `FARM_PROC_PROPERTIES_MAP` DISABLE KEYS */;
LOCK TABLES `FARM_PROC_PROPERTIES_MAP` WRITE;
INSERT INTO `FARM_PROC_PROPERTIES_MAP` VALUES (1,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(1,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.compiler.languages'),(1,'<boolean>false</boolean>','deploy.module.compiler.threading'),(1,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.long-test.languages'),(1,'<set><int>15</int><int>13</int><int>16</int><int>14</int><int>19</int></set>','deploy.module.long-test.roundTypes'),(1,'<set><int>4</int><int>6</int><int>3</int><int>7</int><int>5</int></set>','deploy.module.srm-test.action'),(1,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.srm-test.languages'),(1,'<set><string>compiler</string><string>srm-test</string><string>long-test</string></set>','deployed.modules'),(1,'<int>1024</int>','memory.available'),(1,'<string>linux</string>','os.type'),(2,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(2,'<set><int>4</int><int>5</int></set>','deploy.module.compiler.languages'),(2,'<boolean>false</boolean>','deploy.module.compiler.threading'),(2,'<set><int>4</int><int>5</int></set>','deploy.module.long-test.languages'),(2,'<set><int>15</int><int>13</int><int>16</int><int>14</int><int>19</int></set>','deploy.module.long-test.roundTypes'),(2,'<set><int>4</int><int>6</int><int>3</int><int>7</int><int>5</int></set>','deploy.module.srm-test.action'),(2,'<set><int>4</int><int>5</int></set>','deploy.module.srm-test.languages'),(2,'<set><string>compiler</string><string>srm-test</string><string>long-test</string></set>','deployed.modules'),(2,'<int>1024</int>','memory.available'),(2,'<string>linux</string>','os.type'),(3,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.long-test.languages'),(3,'<set><int>13</int><int>14</int><int>19</int></set>','deploy.module.long-test.roundTypes'),(3,'<set><string>long-test</string></set>','deployed.modules'),(3,'<int>2048</int>','memory.available'),(3,'<string>linux</string>','os.type'),(4,'<set><int>4</int><int>5</int></set>','deploy.module.long-test.languages'),(4,'<set><int>13</int><int>14</int><int>19</int></set>','deploy.module.long-test.roundTypes'),(4,'<set><string>long-test</string></set>','deployed.modules'),(4,'<int>2048</int>','memory.available'),(4,'<string>windows</string>','os.type'),(5,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(5,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.compiler.languages'),(5,'<boolean>true</boolean>','deploy.module.compiler.threading'),(5,'<set><string>compiler</string></set>','deployed.modules'),(5,'<int>8192</int>','memory.available'),(5,'<string>linux</string>','os.type'),(6,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.long-test.languages'),(6,'<set><int>15</int><int>16</int></set>','deploy.module.long-test.roundTypes'),(6,'<set><string>long-test</string></set>','deployed.modules'),(6,'<int>8192</int>','memory.available'),(6,'<string>linux</string>','os.type'),(7,'<set><int>4</int><int>5</int></set>','deploy.module.long-test.languages'),(7,'<set><int>15</int><int>16</int></set>','deploy.module.long-test.roundTypes'),(7,'<set><string>long-test</string></set>','deployed.modules'),(7,'<int>8192</int>','memory.available'),(7,'<string>windows</string>','os.type'),(8,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(8,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.compiler.languages'),(8,'<boolean>false</boolean>','deploy.module.compiler.threading'),(8,'<set><int>4</int><int>6</int><int>3</int><int>7</int><int>5</int></set>','deploy.module.srm-test.action'),(8,'<set><int>6</int><int>1</int><int>3</int></set>','deploy.module.srm-test.languages'),(8,'<set><string>compiler</string><string>srm-test</string></set>','deployed.modules'),(8,'<int>2048</int>','memory.available'),(8,'<string>linux</string>','os.type'),(9,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(9,'<set><int>4</int><int>5</int></set>','deploy.module.compiler.languages'),(9,'<set><int>4</int><int>6</int><int>3</int><int>7</int><int>5</int></set>','deploy.module.srm-test.action'),(9,'<set><int>4</int><int>5</int></set>','deploy.module.srm-test.languages'),(9,'<set><string>compiler</string><string>srm-test</string></set>','deployed.modules'),(9,'<int>2048</int>','memory.available'),(9,'<string>windows</string>','os.type'),(10,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(10,'<set><int>3</int><int>1</int></set>','deploy.module.compiler.languages'),(10,'<boolean>true</boolean>','deploy.module.compiler.threading'),(10,'<set><int>3</int><int>1</int></set>','deploy.module.long-test.languages'),(10,'<set><int>23</int><int>22</int></set>','deploy.module.long-test.roundTypes'),(10,'<set><string>long-test</string><string>compiler</string></set>','deployed.modules'),(10,'<int>8192</int>','memory.available'),(10,'<string>linux</string>','os.type'),(11,'<set><int>2</int><int>11</int><int>1</int></set>','deploy.module.compiler.action'),(11,'<set><int>3</int></set>','deploy.module.compiler.languages'),(11,'<boolean>true</boolean>','deploy.module.compiler.threading'),(11,'<set><string>long-test</string><string>compiler</string></set>','deployed.modules'),(11,'<int>8192</int>','memory.available'),(11,'<string>linux</string>','os.type');
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_PROC_PROPERTIES_MAP` ENABLE KEYS */;

--
-- Table structure for table `FARM_SHARED_OBJECT`
--

DROP TABLE IF EXISTS `FARM_SHARED_OBJECT`;
CREATE TABLE `FARM_SHARED_OBJECT` (
  `SHO_ID` bigint(20) NOT NULL auto_increment,
  `CLI_NAME` varchar(30) default NULL,
  `OBJ_KEY` varchar(50) default NULL,
  `OBJECT` longblob,
  `STORAGE_DATE` datetime default NULL,
  PRIMARY KEY  (`SHO_ID`),
  UNIQUE KEY `CLI_NAME` (`CLI_NAME`,`OBJ_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FARM_SHARED_OBJECT`
--

/*!40000 ALTER TABLE `FARM_SHARED_OBJECT` DISABLE KEYS */;
LOCK TABLES `FARM_SHARED_OBJECT` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `FARM_SHARED_OBJECT` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

update FARM_PROCESSOR set MAX_TASKS = 1 where PRC_ID = 1;
update FARM_PROCESSOR set MAX_TASKS = 1 where PRC_ID = 2;
