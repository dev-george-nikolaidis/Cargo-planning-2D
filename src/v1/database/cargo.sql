-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cargo
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `triporders`
--

DROP TABLE IF EXISTS `triporders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triporders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int DEFAULT NULL,
  `load_order_number` int DEFAULT NULL,
  `offload_order_number` int DEFAULT NULL,
  `quantity_of_pallets` int DEFAULT NULL,
  `start_destination` varchar(255) DEFAULT NULL,
  `final_destination` varchar(255) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `pallet` enum('euro_pallet') DEFAULT 'euro_pallet',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `triporders_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triporders`
--

LOCK TABLES `triporders` WRITE;
/*!40000 ALTER TABLE `triporders` DISABLE KEYS */;
INSERT INTO `triporders` VALUES (1,1,1,3,12,'Start A1','End A1',1,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(2,1,2,1,10,'Start A2','End A2',2,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(3,1,3,2,11,'Start A3','End A3',3,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(4,2,1,1,12,'Start B1','End B1',5,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(5,2,2,2,8,'Start B2','End B2',6,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(6,2,3,3,10,'Start B3','End B3',7,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(7,2,4,4,3,'Start B4','End B4',8,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(8,3,1,1,11,'Start C1','End C1',9,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(9,3,2,2,6,'Start C2','End C2',10,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(10,4,1,1,4,'Start D1','End D1',13,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(11,4,2,2,8,'Start D2','End D2',14,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17'),(12,4,3,3,9,'Start D3','End D3',15,'euro_pallet','2024-01-27 14:13:17','2024-01-27 14:13:17');
/*!40000 ALTER TABLE `triporders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `load_direction` enum('back','side','top') DEFAULT 'back',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,1,'back','2024-01-27 14:13:17','2024-01-27 14:13:17'),(2,1,'side','2024-01-27 14:13:17','2024-01-27 14:13:17'),(3,1,'back','2024-01-27 14:13:17','2024-01-27 14:13:17'),(4,1,'side','2024-01-27 14:13:17','2024-01-27 14:13:17');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `role` enum('user','admin','owner') DEFAULT 'user',
  `password` text NOT NULL,
  `password_token_reset` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1@example.com','user','5f4dcc3b5aa765d61d8327deb882cf99',NULL,'2024-01-27 14:13:17','2024-01-27 14:13:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 12:19:48
