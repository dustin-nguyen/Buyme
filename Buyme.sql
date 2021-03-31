
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