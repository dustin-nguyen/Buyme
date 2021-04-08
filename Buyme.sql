
CREATE DATABASE  IF NOT EXISTS `Buyme` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Buyme`;
-- Database: Buyme
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

-- Table structure for table `beers`
DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `account` (
  `username` varchar(50) NOT NULL ,
  `password` varchar(50) NOT NULL,
  `name`  varchar(50) DEFAULT NULL,
  `email`  varchar(50) DEFAULT NULL,
  `type` ENUM ('admin','representative','customers') DEFAULT 'customers',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Add admin and customers representative account
LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account`(`username`, `password`,`type`,`name`) VALUES ('admin','12345','admin','Duc'),('cusrep1','12345','representative','John'),('cusrep2','12345','representative','Sam');
INSERT INTO `account`(`username`, `password`,`type`,`name`,`email`) VALUES ('duc','12345','customers','Duc','ducrias@gmail.com');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `item`
DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `item` (
  `itemID` INT AUTO_INCREMENT Primary key ,
  `name`  varchar(50)  Not NULL,
  `type` ENUM ('laptop','phone','tablet') Not NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `sell`
DROP TABLE IF EXISTS `sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- Date=YYYY-MM-DD
CREATE TABLE `sell` (
  `itemID`  INT  Not NULL,
  `seller`  varchar(50)  Not NULL,
  `type` ENUM ('laptop','phone','tablet') Not NULL,
  `increment` INT NOT NULL,
  `inital_price` INT NOT NULL,
  `secert_price` INT NOT NULL,
  `close_date` Date NOT NULL,
  PRIMARY KEY (`itemID`,`seller`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `historyOfBid`
DROP TABLE IF EXISTS `historyOfBid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- Date=YYYY-MM-DD
CREATE TABLE `historyOfBid` (
  `itemID`  INT  Not NULL,
  `buyer`  varchar(50)  Not NULL,
  `type` ENUM ('laptop','phone','tablet') Not NULL,
  `price` INT NOT NULL,
  `date` Date NOT NULL,
  PRIMARY KEY (`itemID`,`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `wishList`
DROP TABLE IF EXISTS `wishList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- Date=YYYY-MM-DD
CREATE TABLE `wishList` (
  `itemID`  INT  Not NULL,
  `buyer`  varchar(50)  Not NULL,
  PRIMARY KEY (`itemID`,`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `question`
DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- Date=YYYY-MM-DD
CREATE TABLE `question` (
   `questID` INT AUTO_INCREMENT Primary key ,
  `username`  varchar(50)  Not NULL,
   `question`  varchar(500)  Not NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `answer`
DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- Date=YYYY-MM-DD
CREATE TABLE `answer` (
   `questID` int Not null Primary key,
  `cusrep`  varchar(50)  Not NULL,
   `answer`  varchar(500)  Not NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

