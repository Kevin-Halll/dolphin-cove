-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dolphin_cove
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `program_id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `hotel` varchar(100) NOT NULL DEFAULT 'Walk-in',
  `participant_num` int NOT NULL,
  `booked_dt` date NOT NULL,
  `appointment_dt` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (98,22,1,'JUTA','Tours','3',30,'2022-06-19','2022-06-26'),(99,22,2,'Arthur','Vivian','5',42,'2022-06-19','2022-07-08'),(100,22,3,'Nicole','Ivan','2',25,'2022-06-19','2022-06-19'),(101,24,1,'Yardley','Derek','2',6,'2022-06-20','2022-06-29'),(102,0,1,'Reagan','Adara','5',1,'2022-06-20','2022-06-28'),(103,0,1,'Gloria','Wayne','5',4,'2022-06-20','2022-06-20'),(104,18,2,'Nero','Grace','4',3,'2022-06-21','2022-06-23'),(105,18,2,'Kevin','Hall','1',1,'2022-06-21','2022-06-23');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Walk In'),(2,'S Hotel Jamaica'),(3,'Altamont West Hotel '),(4,'Toby\'s Resort '),(5,'Verney House Resort');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `method_UNIQUE` (`method`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (3,'Card'),(1,'Cash'),(2,'Cheque'),(5,'On Credit'),(4,'Transfer');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `payment_dt` date NOT NULL,
  `payment_total` float NOT NULL,
  `payment_status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (93,98,1,'2022-06-19',3000,1),(94,99,1,'2022-06-19',6300,1),(95,100,1,'2022-06-19',7500,1),(96,101,4,'2022-06-20',600,0),(97,102,4,'2022-06-20',100,1),(98,103,3,'2022-06-20',400,1),(99,104,3,'2022-06-21',450,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_events`
--

DROP TABLE IF EXISTS `program_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program` varchar(200) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `cover` varchar(500) NOT NULL,
  `time_schedule` varchar(100) NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `program_UNIQUE` (`program`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_events`
--

LOCK TABLES `program_events` WRITE;
/*!40000 ALTER TABLE `program_events` DISABLE KEYS */;
INSERT INTO `program_events` VALUES (1,'Encounter','a day of fun','They will give you a kiss and allow you to caress them while standing in knee deep water. This adventure is best for those who are not comfortable swimming in the sea and the very young.','/assets/images/program-1.jpg','8:30am - 10:30am',100),(2,'Swim Adventure','swim with the dolphins','At Dolphin Cove, interact with one dolphin while swimming in the deep. Enjoy a kiss, try a dance, perhaps you will get a splash or two and have a real up close experience.','/assets/images/program-2.jpg','10:30am - 1:00pm',150),(3,'Royal Swim','fun to the limit','The most fun and unique program, designed to exceed all your expectations.Feel the thrill of foot-push; The dolphins will rise you above the water surface by pushing you from the soles of your feet.','/assets/images/program-3.jpg','1:00pm - 4pm',300),(9,'Jenette Franks','Eos ut voluptatem i','Tempora quidem facil','/assets/images/galeria-dolphin-swim-in-moon-palace-jamaica-3.jpg','8:30am - 10:30am',42);
/*!40000 ALTER TABLE `program_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_companies`
--

DROP TABLE IF EXISTS `tour_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_nm` varchar(100) NOT NULL,
  `phone_num` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `company_nm_UNIQUE` (`company_nm`),
  UNIQUE KEY `phone_num_UNIQUE` (`phone_num`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_companies`
--

LOCK TABLES `tour_companies` WRITE;
/*!40000 ALTER TABLE `tour_companies` DISABLE KEYS */;
INSERT INTO `tour_companies` VALUES (1,'Dolphin Cove','1-877-344-3385','dolphincoveja@gmail.com'),(23,'Jordan Byrd Plc','+1 (695) 589-7212','gogysorosy@mailinator.com'),(24,'JUTA Tours','+1 (288) 453-3592','juta@toursja.com'),(25,'JTB Co.','+1 (156) 409-9358','dejojax@mailinator.com'),(26,'Tours JA','+1 (692) 632-2236','toursja@fun.com');
/*!40000 ALTER TABLE `tour_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'company'),(4,'guest'),(3,'staff');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `user_nm` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,4,'Online','online@default.com','default'),(18,3,'Admin1','admin@dcove.com','admin123'),(19,2,'Durham and Levine LLC','tifa@mailinator.com','Pa$$w0rd!'),(20,2,'Jordan Byrd Plc','gogysorosy@mailinator.com','Pa$$w0rd!'),(22,2,'JUTA Tours','juta@toursja.com','Pa$$w0rd!'),(23,2,'JTB Co.','jbt@toursja.com','Pa$$w0rd!'),(24,2,'Tours JA','toursja@fun.com','Pa$$w0rd!');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `payment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (20,29,25),(21,30,26),(22,31,27),(23,32,28),(24,33,29),(25,34,30),(26,35,31),(27,36,32),(28,37,33),(29,38,34),(30,39,35),(31,40,36),(32,41,37),(33,42,38),(34,43,39),(35,44,40),(36,45,41),(37,46,42),(38,47,43),(39,48,44),(40,49,45),(41,50,46),(42,51,47),(43,52,48),(44,53,49),(45,54,50),(46,55,51),(47,56,52),(48,57,53),(49,58,54),(50,59,55),(51,60,56),(52,61,57),(53,62,58),(54,63,59),(55,64,60),(56,66,61),(57,67,62),(58,68,63),(59,69,64),(60,70,65),(61,71,66),(62,72,67),(63,73,68),(64,74,69),(65,75,70),(66,76,71),(67,77,72),(68,78,73),(69,79,74),(70,80,75),(71,81,76),(72,82,77),(73,83,78),(74,84,79),(75,85,80),(76,86,81),(77,87,82),(78,88,83),(79,89,84),(80,90,85),(81,91,86),(82,92,87),(83,93,88),(84,94,89),(85,95,90),(86,96,91),(87,97,92),(88,98,93),(89,99,94),(90,100,95),(91,101,96),(92,102,97),(93,103,98),(94,104,99);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 20:32:37
