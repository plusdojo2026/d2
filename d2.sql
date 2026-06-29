-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: d2
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost` (
  `OptionCost` int unsigned DEFAULT NULL,
  `OptionName` varchar(100) NOT NULL,
  PRIMARY KEY (`OptionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` VALUES (4000,'エアコン修理・クリーニング'),(3000,'しみ抜き'),(2000,'においプロック加工'),(3000,'下部洗浄'),(4000,'出張クリーニング'),(3000,'出張修理'),(3000,'出張廃品回収'),(5000,'出張洗車'),(3000,'回収物の破棄'),(3000,'大型粗大ごみ'),(3000,'家具の解体'),(4000,'撥水コーティング'),(3000,'撥水加工'),(2000,'水回り'),(3000,'泡ムース洗浄'),(3000,'鍵の交換・修理'),(3000,'鍵の交換・処理');
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finish`
--

DROP TABLE IF EXISTS `finish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finish` (
  `id_chara` int NOT NULL,
  `date_finish` varchar(30) NOT NULL,
  `time_finish` varchar(15) NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finish`
--

LOCK TABLES `finish` WRITE;
/*!40000 ALTER TABLE `finish` DISABLE KEYS */;
INSERT INTO `finish` VALUES (1,'2026年6月18日','12:00 〜 14:00','出張洗車',NULL),(1,'2026年6月19日','8:00 〜 10:00','出張洗車',NULL),(1,'2026年6月18日','14:00 〜 16:00','出張洗車',NULL),(29,'2026年6月19日','10:00 〜 12:00','出張洗車',NULL);
/*!40000 ALTER TABLE `finish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idpw`
--

DROP TABLE IF EXISTS `idpw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idpw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idpw`
--

LOCK TABLES `idpw` WRITE;
/*!40000 ALTER TABLE `idpw` DISABLE KEYS */;
INSERT INTO `idpw` VALUES (1,'demodemo','demodemo'),(26,'12345678','12345678'),(29,'0987654321','1234567890');
/*!40000 ALTER TABLE `idpw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id_info` int NOT NULL AUTO_INCREMENT,
  `date_info` varchar(30) NOT NULL,
  `title_info` varchar(50) NOT NULL,
  `message_info` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'2026/06/11','デモのお知らせ','これはデモだよinfoだよ');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `id_maintenance` int NOT NULL AUTO_INCREMENT,
  `date_maintenance` varchar(30) NOT NULL,
  `title_maintenance` varchar(50) NOT NULL,
  `message_maintenance` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_maintenance`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'2026/06/11','デモのメンテ','これはデモだよmainteだよ'),(2,'2026/06/10','デモのメンテ','これはデモだよmainteだよ'),(3,'2026/06/12','デモのメンテ','これはデモだよmainteだよ');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `id_chara` int DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `thisdate` varchar(10) DEFAULT NULL,
  `option1` varchar(100) DEFAULT NULL,
  `option2` varchar(100) DEFAULT NULL,
  `option3` varchar(100) DEFAULT NULL,
  `option4` varchar(100) DEFAULT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(13) NOT NULL,
  `tell` varchar(14) DEFAULT NULL,
  `mailaddress` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `total_amount` int unsigned DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,'出張洗車','2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月21日','14:00 〜 16:00','03-6685-5420','tarou@seplus.jp','東京都','','','paypay',11000,1),(2,1,'出張洗車','2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月20日','14:00 〜 16:00','03-6685-5420','tarou@seplus.jp','東京都','','','credit',11000,1),(3,1,NULL,'2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月15日','12:00 〜 14:00','03-6685-5420','tarou@seplus.jp','東京都','','',NULL,NULL,NULL),(4,1,NULL,'2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月15日','10:00 〜 12:00','03-6685-5420','tarou@seplus.jp','東京都','','',NULL,NULL,NULL),(5,1,'出張洗車','2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月15日','8:00 〜 10:00','03-6685-5420','tarou@seplus.jp','東京都','','',NULL,NULL,NULL),(6,1,'出張洗車','2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月16日','10:00 〜 12:00','03-6685-5420','tarou@seplus.jp','東京都','','','paypay',11000,1),(7,1,'出張洗車','2026-06-15','泡ムース洗浄','下部洗浄','撥水コーティング','','6月15日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',11000,1),(8,1,'出張洗車','2026-06-16','泡ムース洗浄','下部洗浄','撥水コーティング','','6月17日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',11000,1),(9,1,'出張洗車','2026-06-16','泡ムース洗浄','下部洗浄','撥水コーティング','','126年6月17日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',11000,1),(10,1,'出張洗車','2026-06-16','泡ムース洗浄','下部洗浄','','','2026年6月17日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(11,1,'出張洗車','2026-06-16','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月16日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',11000,1),(12,1,'出張修理','2026/06/12','水回り','','','','2026/06/15','8:00','080-4850-3839',NULL,'東京都','デモです',NULL,'PayPay',3600,0),(13,1,'出張洗車','2026-06-16','泡ムース洗浄','','','','2026年6月17日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',8000,1),(14,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','はっ水加工','','2026年6月16日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',9000,1),(15,1,'出張修理','2026-06-16','水色','鍵の交換・修理','エアコン修理・クリーニング','','2026年6月16日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',7000,1),(16,1,'出張修理','2026-06-16','水回り','鍵の交換・修理','エアコン修理・クリーニング','','2026年6月16日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',12000,1),(17,1,'出張廃品回収','2026-06-16','大型粗大ごみ','家具の解体','回収物の破棄','','2026年6月16日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',12000,1),(18,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',12000,1),(19,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',12000,1),(20,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',12000,1),(21,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','16:00 〜 18:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',12000,1),(22,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','18:00 〜 20:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,12000,1),(23,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','20:00 〜 22:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(24,1,'出張クリーニング','2026-06-16','しみ抜き','においブロック加工','撥水加工','','2026年6月16日','20:00 〜 22:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',12000,1),(25,1,'出張廃品回収','2026-06-16','大型粗大ごみ','','回収物の破棄','','2026年6月17日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','paypay',9000,1),(26,1,'出張洗車','2026-06-16','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月17日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',15000,1),(27,1,'出張洗車','2026-06-17','泡ムース洗浄','','','','2026年6月17日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',8000,1),(28,1,'出張洗車','2026年6月17日','泡ムース洗浄','','','','2026年6月18日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',8000,1),(29,1,'出張洗車','2026年6月17日','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月17日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',15000,1),(30,1,'出張廃品回収','2026年6月17日','','家具の解体','','','2026年6月17日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',6000,1),(31,1,'出張洗車','2026年6月17日','泡ムース洗浄','','撥水コーティング','','2026年6月17日','16:00 〜 18:00','083-4832-4930','sample@gmail.com','東京都台東区','','スクリーンショット 2026-06-04 163240.png','credit',12000,1),(32,1,'出張洗車','2026年6月17日','泡ムース洗浄','','','','2026年6月17日','18:00 〜 20:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(33,1,'出張洗車','2026年6月17日','泡ムース洗浄','','撥水コーティング','','2026年6月17日','18:00 〜 20:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(34,1,'出張洗車','2026年6月17日','泡ムース洗浄','','','','2026年6月17日','18:00 〜 20:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(35,1,'出張洗車','2026年6月18日','','','','','2026年6月18日','18:00 〜 20:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(36,1,'出張洗車','2026年6月18日','','','','','2026年6月18日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(37,1,'出張洗車','2026年6月18日','','','','','2026年6月18日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(38,1,'出張洗車','2026年6月18日','','','','','2026年6月18日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(39,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(40,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(41,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(42,1,'出張クリーニング','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','16:00 〜 18:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(43,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',8000,1),(44,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(45,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','',NULL,NULL,NULL),(46,1,'出張洗車','2026年6月18日','泡ムース洗浄','','','','2026年6月18日','12:00 〜 14:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',8000,1),(47,1,'出張洗車','2026年6月18日','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月19日','8:00 〜 10:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',15000,1),(48,1,'出張洗車','2026年6月18日','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月18日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','memo','スクリーンショット 2026-06-18 102642.png',NULL,NULL,NULL),(49,1,'出張洗車','2026年6月18日','泡ムース洗浄','下部洗浄','撥水コーティング','','2026年6月18日','14:00 〜 16:00','083-4832-4930','sample@gmail.com','東京都台東区','memo','','credit',15000,1),(50,29,'出張洗車','2026年6月19日','泡ムース洗浄','','','','2026年6月19日','10:00 〜 12:00','083-4832-4930','sample@gmail.com','東京都台東区','','','credit',8000,1);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `Vendor` varchar(30) DEFAULT NULL,
  `schedule` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-19 17:30:51
