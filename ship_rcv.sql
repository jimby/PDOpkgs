-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: ship_rcv
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Current Database: `ship_rcv`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ship_rcv` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ship_rcv`;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'b1234');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `onumber` varchar(100) DEFAULT NULL,
  `odate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(10) unsigned DEFAULT NULL,
  `pnumber` char(255) DEFAULT NULL,
  `order_number` char(50) DEFAULT NULL,
  `invoice_number` char(50) DEFAULT NULL,
  `invoiced` varchar(100) DEFAULT NULL,
  `snumber` varchar(100) DEFAULT NULL,
  `preceived` varchar(50) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `wid` (`wid`),
  CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `warehouses` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (2,1,'9622080430009203817400786283319952',NULL,NULL,NULL,'4300092','2017-06-04',NULL),(3,1,'9612804278666171800369',NULL,NULL,NULL,'2786661','2017-06-04',NULL),(4,1,'1Z1E222F4401448485',NULL,NULL,NULL,'1E222F','2017-06-10',NULL),(5,1,'9611019383263204603846',NULL,NULL,NULL,'3832632','2017-06-10',NULL);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkginv`
--

DROP TABLE IF EXISTS `pkginv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkginv` (
  `piid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`piid`),
  KEY `pid` (`pid`),
  CONSTRAINT `pkginv_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `packages` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkginv`
--

LOCK TABLES `pkginv` WRITE;
/*!40000 ALTER TABLE `pkginv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkginv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkgpo`
--

DROP TABLE IF EXISTS `pkgpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkgpo` (
  `ppid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ppid`),
  KEY `oid` (`oid`),
  CONSTRAINT `pkgpo_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkgpo`
--

LOCK TABLES `pkgpo` WRITE;
/*!40000 ALTER TABLE `pkgpo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pkgpo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippers` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `shipno` varchar(100) DEFAULT NULL,
  `slocation` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (3,'artiface gringold lld','00000000','miami, florida'),(6,'Kipling USA.com','2786661','Martinsville VA 24112'),(7,'Toner Eagle, Customer Service','4300092','6285 Spring Street, Long Beach, CA 90808'),(8,'Amazon Fulfillment Services','3832632','1600 Worldwide Blvd, Hebron KY 41048'),(9,'C W - ATTN EC','00000000','1802 M St, NW, Door 15, Auburn WA 98001'),(10,'Shipping Manager','00000000','7485 Commercial Way #160, Henderson NV 89011'),(11,'Walmart.com','00000000','1900 Aerojet Way, North Las Vegas NV 89030'),(12,'Great Ballast','00000000','3837 Bay Lake Trail, #115, N. Las Vegas NV 89030'),(13,'Amazon Fulfillment Services','1E222F','172 Trade Street, Lexington KY 40511'),(14,'Newegg','00000000','17550 Rowland St, City of Industry, CA 91748');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` char(50) NOT NULL,
  `userPass` char(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jim','ttaskk'),(2,'Ralph','ttaskk');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouses` (
  `wid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wname` char(50) NOT NULL,
  `wlocation` char(255) NOT NULL,
  PRIMARY KEY (`wid`),
  UNIQUE KEY `wname` (`wname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'Merida','Goleta'),(2,'Sierra st','Santa Barbara');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-11 16:17:59
