-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: establishmenthomework
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `establishment`
--

DROP TABLE IF EXISTS `establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_chain` tinyint(1) DEFAULT '0',
  `chain_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chain_id` (`chain_id`),
  CONSTRAINT `establishment_ibfk_1` FOREIGN KEY (`chain_id`) REFERENCES `establishment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment`
--

LOCK TABLES `establishment` WRITE;
/*!40000 ALTER TABLE `establishment` DISABLE KEYS */;
INSERT INTO `establishment` VALUES (1,'Starbucks',1,NULL),(2,'Starbucks New York1',0,1),(3,'Starbucks Philadelphia',0,1),(4,'Starbucks New York2',0,1),(5,'Starbucks Los Angeles1',0,1),(6,'Starbucks Los Angeles2',0,1),(7,'Masa',0,NULL),(8,'Beard Papas',0,NULL),(9,'Joanne',0,NULL),(10,'Brooklyn Fare',0,NULL),(11,'KFC',1,NULL),(12,'KFC Los Angeles',0,11),(13,'KFC New York',0,11),(14,'KFC Philadelphia',0,11),(15,'McDonald\'s',1,NULL),(16,'McDonald\'s Philadelphia',0,15),(17,'McDonald\'s Los Angeles',0,15),(18,'McDonald\'s New York',0,15);
/*!40000 ALTER TABLE `establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rate` double DEFAULT NULL,
  `TYPE` varchar(100) NOT NULL,
  `review_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,9.2,'FOOD',1),(2,9.1,'SERVICE',1),(3,7.1,'PRICES',1),(4,10,'INTERIOR',1),(5,7.8,'AMBIENCE',1),(6,3.9,'FOOD',2),(7,5.1,'SERVICE',2),(8,3.5,'PRICES',2),(9,4.9,'INTERIOR',2),(10,6.9,'AMBIENCE',2),(11,7,'FOOD',3),(12,8.5,'SERVICE',3),(13,5.4,'PRICES',3),(14,6.2,'INTERIOR',3),(15,5.4,'AMBIENCE',3),(16,7.6,'FOOD',4),(17,6.1,'SERVICE',4),(18,4.3,'PRICES',4),(19,7.8,'INTERIOR',4),(20,4.6,'AMBIENCE',4),(21,9.6,'FOOD',5),(22,9,'SERVICE',5),(23,7.4,'PRICES',5),(24,8.7,'INTERIOR',5),(25,8.3,'AMBIENCE',5),(26,0,'FOOD',6),(27,0,'SERVICE',6),(28,0,'PRICES',6),(29,0,'INTERIOR',6),(30,10,'AMBIENCE',6),(31,2,'FOOD',7),(32,9.1,'SERVICE',7),(33,8.8,'PRICES',7),(34,9,'INTERIOR',7),(35,8.9,'AMBIENCE',7),(36,9.1,'FOOD',8),(37,9.1,'SERVICE',8),(38,7.3,'PRICES',8),(39,9,'INTERIOR',8),(40,8.1,'AMBIENCE',8),(41,8.2,'FOOD',9),(42,8.1,'SERVICE',9),(43,7.5,'PRICES',9),(44,5.7,'INTERIOR',9),(45,8.4,'AMBIENCE',9),(46,4.9,'FOOD',10),(47,5.2,'SERVICE',10),(48,0,'PRICES',10),(49,8.2,'INTERIOR',10),(50,3.3,'AMBIENCE',10),(51,6.6,'FOOD',11),(52,5.1,'SERVICE',11),(53,5.3,'PRICES',11),(54,5.8,'INTERIOR',11),(55,6.4,'AMBIENCE',11),(56,9.4,'FOOD',12),(57,1.6,'SERVICE',12),(58,2.4,'PRICES',12),(59,2.3,'INTERIOR',12),(60,1.7,'AMBIENCE',12),(61,8.7,'FOOD',13),(62,8.4,'SERVICE',13),(63,7.1,'PRICES',13),(64,7.8,'INTERIOR',13),(65,6.8,'AMBIENCE',13),(66,5.3,'FOOD',14),(67,5.3,'SERVICE',14),(68,3.9,'PRICES',14),(69,7.4,'INTERIOR',14),(70,6.2,'AMBIENCE',14),(71,6.1,'FOOD',15),(72,5.6,'SERVICE',15),(73,6.3,'PRICES',15),(74,4,'INTERIOR',15),(75,5.3,'AMBIENCE',15),(76,10,'FOOD',16),(77,6,'SERVICE',16),(78,6.8,'PRICES',16),(79,9.7,'INTERIOR',16),(80,5,'AMBIENCE',16),(81,9.1,'FOOD',17),(82,5.1,'SERVICE',17),(83,8.2,'PRICES',17),(84,10,'INTERIOR',17),(85,8.2,'AMBIENCE',17),(86,8.8,'FOOD',18),(87,8.3,'SERVICE',18),(88,7.7,'PRICES',18),(89,7.8,'INTERIOR',18),(90,6.5,'AMBIENCE',18),(91,10,'FOOD',19),(92,10,'SERVICE',19),(93,10,'PRICES',19),(94,10,'INTERIOR',19),(95,10,'AMBIENCE',19),(96,9.4,'FOOD',20),(97,10,'SERVICE',20),(98,6.3,'PRICES',20),(99,7.8,'INTERIOR',20),(100,9.3,'AMBIENCE',20),(101,6.9,'FOOD',21),(102,6.2,'SERVICE',21),(103,4.2,'PRICES',21),(104,4.8,'INTERIOR',21),(105,9,'AMBIENCE',21),(106,0,'FOOD',22),(107,0,'SERVICE',22),(108,0,'PRICES',22),(109,0,'INTERIOR',22),(110,0,'AMBIENCE',22),(111,9.3,'FOOD',23),(112,7.9,'SERVICE',23),(113,6.6,'PRICES',23),(114,6.9,'INTERIOR',23),(115,6.4,'AMBIENCE',23),(116,4.4,'FOOD',24),(117,4.9,'SERVICE',24),(118,7.1,'PRICES',24),(119,3.4,'INTERIOR',24),(120,3.5,'AMBIENCE',24);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `establishment_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `establishment_id` (`establishment_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `establishment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,2),(2,2),(3,3),(4,3),(5,4),(6,5),(7,7),(8,8),(9,8),(10,8),(11,9),(12,10),(13,12),(14,13),(15,14),(16,16),(17,16),(18,16),(19,17),(20,17),(21,18),(22,18),(23,18),(24,18);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'establishmenthomework'
--

--
-- Dumping routines for database 'establishmenthomework'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 22:39:27
