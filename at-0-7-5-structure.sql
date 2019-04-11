-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: at075
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `condition`
--

DROP TABLE IF EXISTS `condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condition` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(35) COLLATE utf8_bin NOT NULL,
  `iconID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `abilityEffect` text COLLATE utf8_bin,
  `roundEffect` text COLLATE utf8_bin,
  `fullRoundEffect` text COLLATE utf8_bin,
  `isStacking` tinyint(1) unsigned DEFAULT NULL,
  `isPositive` tinyint(1) unsigned DEFAULT NULL,
  `increaseBlockChance` tinyint(4) DEFAULT NULL,
  `increaseDamageResistance` tinyint(4) DEFAULT NULL,
  `increaseAttackCost` tinyint(4) DEFAULT NULL,
  `increaseAttackChance` tinyint(4) DEFAULT NULL,
  `increaseAttackDamageMin` tinyint(4) DEFAULT NULL,
  `increaseAttackDamageMax` tinyint(4) DEFAULT NULL,
  `increaseCriticalSkill` tinyint(4) DEFAULT NULL,
  `increaseMoveCost` tinyint(4) DEFAULT NULL,
  `increaseUseItemCost` tinyint(4) DEFAULT NULL,
  `increaseReequipCost` tinyint(4) DEFAULT NULL,
  `increaseMaxHP` tinyint(4) DEFAULT NULL,
  `increaseMaxAP` tinyint(4) DEFAULT NULL,
  `visualEffectID` varchar(30) COLLATE utf8_bin NULL,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition`
--

LOCK TABLES `condition` WRITE;
/*!40000 ALTER TABLE `condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumable`
--

DROP TABLE IF EXISTS `consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumable` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `iconID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `itemcategory_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `baseMarketCost` smallint(6) DEFAULT NULL,
  `increaseCurrentHPMin` tinyint(4) DEFAULT NULL,
  `increaseCurrentHPMax` tinyint(4) DEFAULT NULL,
  `increaseCurrentAPMin` tinyint(4) DEFAULT NULL,
  `increaseCurrentAPMax` tinyint(4) DEFAULT NULL,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemcategory_id` (`itemcategory_id`),
  CONSTRAINT `consumable_ibfk_2` FOREIGN KEY (`itemcategory_id`) REFERENCES `itemcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumable`
--

LOCK TABLES `consumable` WRITE;
/*!40000 ALTER TABLE `consumable` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumable_condition`
--

DROP TABLE IF EXISTS `consumable_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumable_condition` (
  `consumable_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `condition_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `event` varchar(20) COLLATE utf8_bin DEFAULT 'use',
  `target` varchar(20) COLLATE utf8_bin DEFAULT 'source',
  `magnitude` tinyint(3) DEFAULT NULL,
  `duration` tinyint(3) unsigned DEFAULT NULL,
  `chance` tinyint(3) unsigned DEFAULT NULL,
  KEY `consumables_id_condition_id` (`consumable_id`,`condition_id`),
  KEY `condition_id` (`condition_id`),
  KEY `consumable_id` (`consumable_id`),
  CONSTRAINT `consumable_condition_ibfk_3` FOREIGN KEY (`consumable_id`) REFERENCES `consumable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consumable_condition_ibfk_4` FOREIGN KEY (`condition_id`) REFERENCES `condition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumable_condition`
--

LOCK TABLES `consumable_condition` WRITE;
/*!40000 ALTER TABLE `consumable_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumable_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog`
--

DROP TABLE IF EXISTS `dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `switchToNPC` varchar(30) COLLATE utf8_bin NULL,
  `filename` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog`
--

LOCK TABLES `dialog` WRITE;
/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog_replies`
--

DROP TABLE IF EXISTS `dialog_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog_replies` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `dialog_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `nextPhraseID` varchar(30) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nextPhraseID` (`nextPhraseID`),
  KEY `dialog_id` (`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog_replies`
--

LOCK TABLES `dialog_replies` WRITE;
/*!40000 ALTER TABLE `dialog_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog_require`
--

DROP TABLE IF EXISTS `dialog_require`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog_require` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `dialog_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `next_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `requireType` varchar(20) COLLATE utf8_bin NOT NULL,
  `requireID` varchar(30) COLLATE utf8_bin NOT NULL,
  `value` smallint(6) DEFAULT NULL,
  `negate` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY(`id`),
  KEY `dialog_id` (`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog_require`
--

LOCK TABLES `dialog_require` WRITE;
/*!40000 ALTER TABLE `dialog_require` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_require` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog_reward`
--

DROP TABLE IF EXISTS `dialog_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog_reward` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `dialog_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `rewardType` varchar(20) COLLATE utf8_bin NOT NULL,
  `rewardID` varchar(30) COLLATE utf8_bin NOT NULL,
  `mapName` varchar(30) COLLATE utf8_bin NULL,
  `value` smallint(6) DEFAULT NULL,
  PRIMARY KEY(`id`),
  KEY `dialog_id` (`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog_reward`
--

LOCK TABLES `dialog_reward` WRITE;
/*!40000 ALTER TABLE `dialog_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droplist`
--

DROP TABLE IF EXISTS `droplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `droplist` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droplist`
--

LOCK TABLES `droplist` WRITE;
/*!40000 ALTER TABLE `droplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `droplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droplist_item`
--

DROP TABLE IF EXISTS `droplist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `droplist_item` (
  `droplist_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `itemID` varchar(30) COLLATE utf8_bin NOT NULL,
  `quantityMin` smallint(5) unsigned NOT NULL,
  `quantityMax` smallint(5) unsigned NOT NULL,
  `chance` float unsigned NOT NULL,
  PRIMARY KEY (`droplist_id`,`itemID`),
  KEY `itemID` (`itemID`),
  KEY `droplist_id` (`droplist_id`),
  CONSTRAINT `droplist_item_ibfk_3` FOREIGN KEY (`droplist_id`) REFERENCES `droplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `droplist_item_ibfk_4` FOREIGN KEY (`itemID`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droplist_item`
--

LOCK TABLES `droplist_item` WRITE;
/*!40000 ALTER TABLE `droplist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `droplist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `itemcategory_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `increaseBlockChance` tinyint(4) DEFAULT NULL,
  `increaseDamageResistance` tinyint(4) DEFAULT NULL,
  `increaseAttackCost` tinyint(4) DEFAULT NULL,
  `increaseAttackChance` tinyint(4) DEFAULT NULL,
  `increaseAttackDamageMin` tinyint(4) DEFAULT NULL,
  `increaseAttackDamageMax` tinyint(4) DEFAULT NULL,
  `increaseCriticalSkill` tinyint(4) DEFAULT NULL,
  `setCriticalMultiplier` float DEFAULT NULL,
  `increaseMoveCost` tinyint(4) DEFAULT NULL,
  `increaseUseItemCost` tinyint(4) DEFAULT NULL,
  `increaseReequipCost` tinyint(4) DEFAULT NULL,
  `increaseMaxHP` tinyint(4) DEFAULT NULL,
  `increaseMaxAP` tinyint(4) DEFAULT NULL,
  `displaytype` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `iconID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `baseMarketCost` smallint(6) DEFAULT NULL,
  `addedConditions` text COLLATE utf8_bin,
  `hitEffect` text COLLATE utf8_bin,
  `killEffect` text COLLATE utf8_bin,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemcategory_id` (`itemcategory_id`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`itemcategory_id`) REFERENCES `itemcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `iconID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `displaytype` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hasManualPrice` tinyint(1) unsigned DEFAULT NULL,
  `baseMarketCost` smallint(5) DEFAULT NULL,
  `equipEffect` text COLLATE utf8_bin,
  `hitEffect` text COLLATE utf8_bin,
  `killEffect` text COLLATE utf8_bin,
  `useEffect` text COLLATE utf8_bin,
  `hitReceivedEffect` text COLLATE utf8_bin,
  `description` text COLLATE utf8_bin,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category`) REFERENCES `itemcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `item` varchar(30) COLLATE utf8_bin NOT NULL,
  `condition` varchar(20) COLLATE utf8_bin NOT NULL,
  `event` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `magnitude` tinyint(3) unsigned DEFAULT NULL,
  `duration` tinyint(3) unsigned DEFAULT NULL,
  `chance` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `condition` (`condition`),
  KEY `item` (`item`),
  CONSTRAINT `item_condition_ibfk_3` FOREIGN KEY (`item`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_condition_ibfk_4` FOREIGN KEY (`condition`) REFERENCES `condition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcategory` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `actionType` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `inventorySlot` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `size` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcategory`
--

LOCK TABLES `itemcategory` WRITE;
/*!40000 ALTER TABLE `itemcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `area` tinyint(1) unsigned NOT NULL,
  `outside` tinyint(1) unsigned NOT NULL,
  `parent` varchar(30) COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `map_ibfk_3` FOREIGN KEY (`parent`) REFERENCES `map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monster`
--

DROP TABLE IF EXISTS `monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monster` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `monsterClass` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'humanoid',
  `blockChance` smallint(6) NOT NULL DEFAULT '0',
  `damageResistance` tinyint(4) NOT NULL DEFAULT '0',
  `attackCost` tinyint(4) NOT NULL DEFAULT '10',
  `attackChance` smallint(6) NOT NULL DEFAULT '0',
  `attackDamageMin` tinyint(4) DEFAULT '0',
  `attackDamageMax` tinyint(4) DEFAULT NULL,
  `criticalSkill` smallint(6) NOT NULL DEFAULT '0',
  `criticalMultiplier` float NOT NULL DEFAULT '0',
  `moveCost` tinyint(4) NOT NULL DEFAULT '0',
  `maxHP` smallint(6) NOT NULL DEFAULT '1',
  `maxAP` tinyint(4) NOT NULL DEFAULT '10',
  `size` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `spawn` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `faction` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `iconID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `phraseID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `droplistID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `movementAggressionType` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `unique` tinyint(1) unsigned DEFAULT NULL,
  `hitEffect` text COLLATE utf8_bin,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spawn` (`spawn`),
  KEY `droplistID` (`droplistID`),
  CONSTRAINT `monster_ibfk_3` FOREIGN KEY (`spawn`) REFERENCES `spawn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monster_ibfk_4` FOREIGN KEY (`droplistID`) REFERENCES `droplist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster`
--

LOCK TABLES `monster` WRITE;
/*!40000 ALTER TABLE `monster` DISABLE KEYS */;
/*!40000 ALTER TABLE `monster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monster_condition`
--

DROP TABLE IF EXISTS `monster_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monster_condition` (
  `monster` varchar(30) COLLATE utf8_bin NOT NULL,
  `condition` varchar(20) COLLATE utf8_bin NOT NULL,
  `event` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `magnitude` tinyint(3) unsigned DEFAULT NULL,
  `duration` tinyint(3) unsigned DEFAULT NULL,
  `chance` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`monster`,`condition`),
  KEY `condition` (`condition`),
  KEY `monster` (`monster`),
  CONSTRAINT `monster_condition_ibfk_3` FOREIGN KEY (`monster`) REFERENCES `monster` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monster_condition_ibfk_4` FOREIGN KEY (`condition`) REFERENCES `condition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster_condition`
--

LOCK TABLES `monster_condition` WRITE;
/*!40000 ALTER TABLE `monster_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `monster_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `showInLog` tinyint(1) unsigned NOT NULL,
  `filename` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_droplist`
--

DROP TABLE IF EXISTS `quest_droplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_droplist` (
  `quest_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `droplist_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `filename` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`quest_id`,`droplist_id`),
  KEY `quest_id` (`quest_id`),
  KEY `droplist_id` (`droplist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_droplist`
--

LOCK TABLES `quest_droplist` WRITE;
/*!40000 ALTER TABLE `quest_droplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_droplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_item`
--

DROP TABLE IF EXISTS `quest_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_item` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `quest_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monster_id` (`item_id`),
  KEY `quest_id` (`quest_id`),
  CONSTRAINT `quest_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quest_item_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_item`
--

LOCK TABLES `quest_item` WRITE;
/*!40000 ALTER TABLE `quest_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_monster`
--

DROP TABLE IF EXISTS `quest_monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_monster` (
  `monster_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `quest_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `filename` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`monster_id`,`quest_id`),
  KEY `monster_id` (`monster_id`),
  KEY `quest_id` (`quest_id`),
  CONSTRAINT `quest_monster_ibfk_3` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quest_monster_ibfk_4` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_monster`
--

LOCK TABLES `quest_monster` WRITE;
/*!40000 ALTER TABLE `quest_monster` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_monster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_stage`
--

DROP TABLE IF EXISTS `quest_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_stage` (
  `quest_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `progress` smallint(5) unsigned NOT NULL,
  `rewardExperience` smallint(5) unsigned DEFAULT NULL,
  `logText` text COLLATE utf8_bin NOT NULL,
  `finishesQuest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest_id`,`progress`),
  KEY `quest_id` (`quest_id`),
  KEY `progress` (`progress`),
  CONSTRAINT `quest_stage_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_stage`
--

LOCK TABLES `quest_stage` WRITE;
/*!40000 ALTER TABLE `quest_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spawn`
--

DROP TABLE IF EXISTS `spawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spawn` (
  `id` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spawn`
--

LOCK TABLES `spawn` WRITE;
/*!40000 ALTER TABLE `spawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `spawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spawn_map`
--

DROP TABLE IF EXISTS `spawn_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spawn_map` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `map` varchar(30) COLLATE utf8_bin NOT NULL,
  `spawnGroup` varchar(30) COLLATE utf8_bin NOT NULL,
  `quantity` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `spawnGroup` (`spawnGroup`),
  CONSTRAINT `spawn_map_ibfk_3` FOREIGN KEY (`spawnGroup`) REFERENCES `spawn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `spawn_map_ibfk_4` FOREIGN KEY (`map`) REFERENCES `map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spawn_map`
--

LOCK TABLES `spawn_map` WRITE;
/*!40000 ALTER TABLE `spawn_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `spawn_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-09 18:15:45
