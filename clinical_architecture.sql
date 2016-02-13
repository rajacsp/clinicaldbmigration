-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rt4_clinical_3
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `ACL`
--

DROP TABLE IF EXISTS `ACL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PrincipalType` varchar(25) CHARACTER SET ascii NOT NULL,
  `PrincipalId` int(11) NOT NULL DEFAULT '0',
  `RightName` varchar(25) CHARACTER SET ascii NOT NULL,
  `ObjectType` varchar(25) CHARACTER SET ascii NOT NULL,
  `ObjectId` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ACL1` (`RightName`,`ObjectType`,`ObjectId`,`PrincipalType`,`PrincipalId`)
) ENGINE=InnoDB AUTO_INCREMENT=990 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Articles`
--

DROP TABLE IF EXISTS `Articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Summary` varchar(255) NOT NULL DEFAULT '',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Class` int(11) NOT NULL DEFAULT '0',
  `Parent` int(11) NOT NULL DEFAULT '0',
  `URI` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Attachments`
--

DROP TABLE IF EXISTS `Attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionId` int(11) NOT NULL,
  `Parent` int(11) NOT NULL DEFAULT '0',
  `MessageId` varchar(160) CHARACTER SET ascii DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `ContentType` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `ContentEncoding` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `Content` longblob,
  `Headers` longtext,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Attachments2` (`TransactionId`),
  KEY `Attachments3` (`Parent`,`TransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=13731 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Attributes`
--

DROP TABLE IF EXISTS `Attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Content` blob,
  `ContentType` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `ObjectType` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Attributes1` (`Name`),
  KEY `Attributes2` (`ObjectType`,`ObjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CachedGroupMembers`
--

DROP TABLE IF EXISTS `CachedGroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CachedGroupMembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) DEFAULT NULL,
  `MemberId` int(11) DEFAULT NULL,
  `Via` int(11) DEFAULT NULL,
  `ImmediateParentId` int(11) DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DisGrouMem` (`GroupId`,`MemberId`,`Disabled`),
  KEY `CachedGroupMembers3` (`MemberId`,`ImmediateParentId`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Classes`
--

DROP TABLE IF EXISTS `Classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Disabled` int(2) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `HotList` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomFieldValues`
--

DROP TABLE IF EXISTS `CustomFieldValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomFieldValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomField` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Category` varchar(255) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomFieldValues1` (`CustomField`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomFields`
--

DROP TABLE IF EXISTS `CustomFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Type` varchar(200) CHARACTER SET ascii DEFAULT NULL,
  `RenderType` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `MaxValues` int(11) DEFAULT NULL,
  `Pattern` text,
  `Repeated` smallint(6) NOT NULL DEFAULT '0',
  `BasedOn` int(11) DEFAULT NULL,
  `ValuesClass` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `LookupType` varchar(255) CHARACTER SET ascii NOT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GroupMembers`
--

DROP TABLE IF EXISTS `GroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupMembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) NOT NULL DEFAULT '0',
  `MemberId` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GroupMembers1` (`GroupId`,`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Domain` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `Type` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Groups1` (`Domain`,`Instance`,`Type`,`id`),
  KEY `Groups2` (`Type`,`Instance`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Links`
--

DROP TABLE IF EXISTS `Links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Base` varchar(240) DEFAULT NULL,
  `Target` varchar(240) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `LocalTarget` int(11) NOT NULL DEFAULT '0',
  `LocalBase` int(11) NOT NULL DEFAULT '0',
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Links2` (`Base`,`Type`),
  KEY `Links3` (`Target`,`Type`),
  KEY `Links4` (`Type`,`LocalBase`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ObjectClasses`
--

DROP TABLE IF EXISTS `ObjectClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectClasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Class` int(11) NOT NULL DEFAULT '0',
  `ObjectType` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `ObjectId` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ObjectCustomFieldValues`
--

DROP TABLE IF EXISTS `ObjectCustomFieldValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectCustomFieldValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomField` int(11) NOT NULL,
  `ObjectType` varchar(255) CHARACTER SET ascii NOT NULL,
  `ObjectId` int(11) NOT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Content` varchar(255) DEFAULT NULL,
  `LargeContent` longblob,
  `ContentType` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `ContentEncoding` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ocfvUnique` (`CustomField`,`ObjectType`,`ObjectId`,`Content`),
  KEY `ObjectCustomFieldValues1` (`Content`),
  KEY `ObjectCustomFieldValues2` (`CustomField`,`ObjectType`,`ObjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=5665562 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ObjectCustomFields`
--

DROP TABLE IF EXISTS `ObjectCustomFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectCustomFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomField` int(11) NOT NULL,
  `ObjectId` int(11) NOT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ObjectTopics`
--

DROP TABLE IF EXISTS `ObjectTopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectTopics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Topic` int(11) NOT NULL DEFAULT '0',
  `ObjectType` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '',
  `ObjectId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Principals`
--

DROP TABLE IF EXISTS `Principals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PrincipalType` varchar(16) NOT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Principals2` (`ObjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Queues`
--

DROP TABLE IF EXISTS `Queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Queues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CorrespondAddress` varchar(120) CHARACTER SET ascii DEFAULT NULL,
  `CommentAddress` varchar(120) CHARACTER SET ascii DEFAULT NULL,
  `Lifecycle` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `SubjectTag` varchar(120) DEFAULT NULL,
  `InitialPriority` int(11) NOT NULL DEFAULT '0',
  `FinalPriority` int(11) NOT NULL DEFAULT '0',
  `DefaultDueIn` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Queues1` (`Name`),
  KEY `Queues2` (`Disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ScripActions`
--

DROP TABLE IF EXISTS `ScripActions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScripActions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ExecModule` varchar(60) CHARACTER SET ascii DEFAULT NULL,
  `Argument` varbinary(255) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ScripConditions`
--

DROP TABLE IF EXISTS `ScripConditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScripConditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ExecModule` varchar(60) CHARACTER SET ascii DEFAULT NULL,
  `Argument` varbinary(255) DEFAULT NULL,
  `ApplicableTransTypes` varchar(60) CHARACTER SET ascii DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Scrips`
--

DROP TABLE IF EXISTS `Scrips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scrips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `ScripCondition` int(11) NOT NULL DEFAULT '0',
  `ScripAction` int(11) NOT NULL DEFAULT '0',
  `ConditionRules` text,
  `ActionRules` text,
  `CustomIsApplicableCode` text,
  `CustomPrepareCode` text,
  `CustomCommitCode` text,
  `Stage` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `Queue` int(11) NOT NULL DEFAULT '0',
  `Template` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Templates`
--

DROP TABLE IF EXISTS `Templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Queue` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(200) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Type` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `Language` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `TranslationOf` int(11) NOT NULL DEFAULT '0',
  `Content` text,
  `LastUpdated` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EffectiveId` int(11) NOT NULL DEFAULT '0',
  `Queue` int(11) NOT NULL DEFAULT '0',
  `Type` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `IssueStatement` int(11) NOT NULL DEFAULT '0',
  `Resolution` int(11) NOT NULL DEFAULT '0',
  `Owner` int(11) NOT NULL DEFAULT '0',
  `Subject` varchar(200) DEFAULT '[no subject]',
  `InitialPriority` int(11) NOT NULL DEFAULT '0',
  `FinalPriority` int(11) NOT NULL DEFAULT '0',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `TimeEstimated` int(11) NOT NULL DEFAULT '0',
  `TimeWorked` int(11) NOT NULL DEFAULT '0',
  `Status` varchar(64) DEFAULT NULL,
  `TimeLeft` int(11) NOT NULL DEFAULT '0',
  `Told` datetime DEFAULT NULL,
  `Starts` datetime DEFAULT NULL,
  `Started` datetime DEFAULT NULL,
  `Due` datetime DEFAULT NULL,
  `Resolved` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Tickets1` (`Queue`,`Status`),
  KEY `Tickets2` (`Owner`),
  KEY `Tickets6` (`EffectiveId`,`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=13771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Topics`
--

DROP TABLE IF EXISTS `Topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Parent` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `ObjectType` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '',
  `ObjectId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectType` varchar(64) CHARACTER SET ascii NOT NULL,
  `ObjectId` int(11) NOT NULL DEFAULT '0',
  `TimeTaken` int(11) NOT NULL DEFAULT '0',
  `Type` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `Field` varchar(40) CHARACTER SET ascii DEFAULT NULL,
  `OldValue` varchar(255) DEFAULT NULL,
  `NewValue` varchar(255) DEFAULT NULL,
  `ReferenceType` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `OldReference` int(11) DEFAULT NULL,
  `NewReference` int(11) DEFAULT NULL,
  `Data` varchar(255) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Transactions1` (`ObjectType`,`ObjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=54951 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Password` varchar(256) DEFAULT NULL,
  `AuthToken` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `Comments` text,
  `Signature` text,
  `EmailAddress` varchar(120) DEFAULT NULL,
  `FreeformContactInfo` text,
  `Organization` varchar(200) DEFAULT NULL,
  `RealName` varchar(120) DEFAULT NULL,
  `NickName` varchar(16) DEFAULT NULL,
  `Lang` varchar(16) DEFAULT NULL,
  `EmailEncoding` varchar(16) DEFAULT NULL,
  `WebEncoding` varchar(16) DEFAULT NULL,
  `ExternalContactInfoId` varchar(100) DEFAULT NULL,
  `ContactInfoSystem` varchar(30) DEFAULT NULL,
  `ExternalAuthId` varchar(100) DEFAULT NULL,
  `AuthSystem` varchar(30) DEFAULT NULL,
  `Gecos` varchar(16) DEFAULT NULL,
  `HomePhone` varchar(30) DEFAULT NULL,
  `WorkPhone` varchar(30) DEFAULT NULL,
  `MobilePhone` varchar(30) DEFAULT NULL,
  `PagerPhone` varchar(30) DEFAULT NULL,
  `Address1` varchar(200) DEFAULT NULL,
  `Address2` varchar(200) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Zip` varchar(16) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Timezone` varchar(50) DEFAULT NULL,
  `PGPKey` text,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users1` (`Name`),
  KEY `Users4` (`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionId` int(11) NOT NULL,
  `Parent` int(11) NOT NULL DEFAULT '0',
  `MessageId` varchar(160) CHARACTER SET ascii DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `ContentType` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `ContentEncoding` varchar(80) CHARACTER SET ascii DEFAULT NULL,
  `Content` longblob,
  `Headers` longtext,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Attachments2` (`TransactionId`),
  KEY `Attachments3` (`Parent`,`TransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` char(32) NOT NULL,
  `a_session` longblob,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EffectiveId` int(11) NOT NULL DEFAULT '0',
  `Queue` int(11) NOT NULL DEFAULT '0',
  `Type` varchar(16) CHARACTER SET ascii DEFAULT NULL,
  `IssueStatement` int(11) NOT NULL DEFAULT '0',
  `Resolution` int(11) NOT NULL DEFAULT '0',
  `Owner` int(11) NOT NULL DEFAULT '0',
  `Subject` varchar(200) DEFAULT '[no subject]',
  `InitialPriority` int(11) NOT NULL DEFAULT '0',
  `FinalPriority` int(11) NOT NULL DEFAULT '0',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `TimeEstimated` int(11) NOT NULL DEFAULT '0',
  `TimeWorked` int(11) NOT NULL DEFAULT '0',
  `Status` varchar(64) DEFAULT NULL,
  `TimeLeft` int(11) NOT NULL DEFAULT '0',
  `Told` datetime DEFAULT NULL,
  `Starts` datetime DEFAULT NULL,
  `Started` datetime DEFAULT NULL,
  `Due` datetime DEFAULT NULL,
  `Resolved` datetime DEFAULT NULL,
  `LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
  `LastUpdated` datetime DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `Created` datetime DEFAULT NULL,
  `Disabled` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Tickets1` (`Queue`,`Status`),
  KEY `Tickets2` (`Owner`),
  KEY `Tickets6` (`EffectiveId`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-16 22:09:29
