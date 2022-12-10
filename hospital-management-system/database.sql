-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.30

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

Drop database if exists hospital_management;

create database hospital_management;

use hospital_management;

--
-- Table structure for table `doctordetails`
--

DROP TABLE IF EXISTS `doctordetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctordetails` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(255) DEFAULT NULL,
  `doctor_specialization` varchar(255) DEFAULT NULL,
  `experience` double DEFAULT NULL,
  `doctor_status` enum('AVAILABLE','UNAVAILABLE') DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctordetails`
--

LOCK TABLES `doctordetails` WRITE;
/*!40000 ALTER TABLE `doctordetails` DISABLE KEYS */;
INSERT INTO `doctordetails` VALUES (1,'Dr Sachin Pandey','All Rounder',10,'UNAVAILABLE'),(2,'Dr Kishore','Cardiologist',8,'UNAVAILABLE'),(3,'Dr Likhita','Dentist',10,'AVAILABLE'),(4,'Dr Bhagyashree','Oncologist',11,'AVAILABLE'),(5,'Dr Sahithi','Dermatologist',14,'UNAVAILABLE'),(6,'Dr Prasanna','Neurologist',30,'UNAVAILABLE'),(7,'Dr Raghavendra','Neurosurgeon',10,'AVAILABLE'),(8,'Dr Swathi','Gynecologist',15,'AVAILABLE'),(9,'Dr Harshit','Veterinarian',1,'AVAILABLE'),(10,'Dr Javed','Pulmonologist',5,'AVAILABLE'),(21,'Dr Raghav','Can\'t think any rn',1,'AVAILABLE'),(22,'Dr Raghav','Can\'t think any rn',1,'AVAILABLE'),(23,'Dr Whoever','Whatever',10,'AVAILABLE'),(24,'Dr Y Likhitha','Nothing',0,'AVAILABLE'),(25,'Dr Raghav','Whatever',10,'AVAILABLE'),(26,'Dr Raghav','Whatever',10,'AVAILABLE'),(27,'Dr Raghav','Whatever',10,'AVAILABLE'),(28,'Dr Raghav','Whatever',10,'AVAILABLE'),(29,'Dr Kishor','ENT',10,'AVAILABLE'),(30,'Dr Raghav','faaa',3,'AVAILABLE'),(31,'madhu','faaa',3,'AVAILABLE'),(32,'Dr Sachin','Specialization',0,'AVAILABLE'),(33,'Dr Sachin','Specialization',2,'AVAILABLE'),(34,'Dr Sachin','Specialization',2,'AVAILABLE'),(35,'Dr Sachin','Specialization',2,'AVAILABLE'),(36,'Dr Sachin','Specialization',2,'AVAILABLE'),(37,'Dr Sachin','Specialization',2,'AVAILABLE'),(38,'Dr Sachin','Specialization',2,'AVAILABLE'),(39,'Dr Sachin','Specialization',2,'AVAILABLE'),(40,'Dr Sachin','Specialization',2,'AVAILABLE'),(41,'Dr Sachin','Specialization',2,'AVAILABLE'),(42,'Dr Sachin','Specialization',2,'AVAILABLE'),(43,'Dr Sachin','Specialization',2,'AVAILABLE'),(44,'Dr Sachin','Specialization',2,'AVAILABLE'),(45,'Dr Sachin','Specialization',2,'AVAILABLE'),(46,'Dr Sachin','Specialization',2,'AVAILABLE'),(47,'Dr Sachin','Specialization',2,'AVAILABLE');
/*!40000 ALTER TABLE `doctordetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `issue` varchar(255) NOT NULL,
  `treatment_cost` double DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,'Fever',100),(2,'Cancer',50000),(3,'Heart Attack',50000),(4,'Checkup',1000);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `med_his_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `treatment_day` int DEFAULT NULL,
  `treatment_description` text,
  PRIMARY KEY (`med_his_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patientdetails` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES (1,1,2,'dolo650,'),(2,1,2,'dolo650,'),(13,30,1,'Dolo 650'),(14,10,10,'Shdasj 21');
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientdetails`
--

DROP TABLE IF EXISTS `patientdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientdetails` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(255) DEFAULT NULL,
  `patient_address` text,
  `patient_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientdetails`
--

LOCK TABLES `patientdetails` WRITE;
/*!40000 ALTER TABLE `patientdetails` DISABLE KEYS */;
INSERT INTO `patientdetails` VALUES (1,'Sachin','7518693356','Siddharth Nagar','33sachinf@gmail.com'),(2,'Gaurav','6942069420','Muradabad','gaurav@hdsjak.com'),(3,'Raghav','7382473288','Lucknow','raghav@tripathi.com'),(4,'Krishna Kant','887404123','Pratap Garh','kk@krishnakant.com'),(10,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(11,'Likhitha','7482674234','Vijayawada','likhitha@gmail.com'),(12,'Y Likhitha','7482674234','Vijayawada','likhitha@gmail.com'),(13,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(14,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(15,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(16,'Likhitha','7482674234','Vijayawada','likhitha@gmail.com'),(17,'Kishor','6723848932','India','kishor@swamy.com'),(18,'Likhitha','7482674234','Vijayawada','likhitha@gmail.com'),(19,'kishore','2123456789','HYD','KISHORE@GMAIL.COM'),(20,'Sachin Pandey','7482674234','Vijayawada','likhitha@gmail.com'),(21,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(22,'Sachin Pandey','7623763742','Siddharth Nagar','sachin@gmail.com'),(23,'Javed','4782374327','Uttar Pradesh','javed@khan.com'),(24,'Javed Khan','4782374327','Uttar Pradesh','javed@khan.com'),(25,'Javed','dsd','Uttar Pradesh','javed@khan.com'),(26,'Javed','4782374327','Uttar Pradesh','javed@khan.com'),(27,'Javed','4782374327','Uttar Pradesh','javed@khan.com'),(28,'Shalini Agrahari','4782374327','Uttar Pradesh','shalini@khan.com'),(29,'31321','4782374327','Uttar Pradesh','javed@khan.com'),(30,'Sachin Pandey','7832873213','Siddharth Nagar, 272193','sachin@gmail.com');
/*!40000 ALTER TABLE `patientdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentdetails`
--

DROP TABLE IF EXISTS `paymentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentdetails` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `treatment_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `treatment_id_idx` (`treatment_id`),
  KEY `treatment_id_key` (`treatment_id`),
  CONSTRAINT `treatment_id` FOREIGN KEY (`treatment_id`) REFERENCES `treatmentdetails` (`treatment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentdetails`
--

LOCK TABLES `paymentdetails` WRITE;
/*!40000 ALTER TABLE `paymentdetails` DISABLE KEYS */;
INSERT INTO `paymentdetails` VALUES (1,50,100,'2022-11-17','UPI',1),(3,500,1600,'2022-11-17','Credit Card',2),(4,30000,21500,'2022-11-17','PayTM Wallet',31),(5,10,50,'2022-11-29','upI',1),(6,50,50,'2022-11-18','UPI',33),(7,10,40,'2022-11-18','Credit Card',33),(8,100,500,'2022-11-18','Credit Card',34),(9,500,1600,'2022-11-21','UPI',35),(10,500,0,'2022-11-21','UPI',34),(11,500,1100,'2022-11-21','PayTM Wallet',35),(14,500,500,'2022-11-21','UPI',40),(15,1000,49500,'2022-11-21','Credit Card',41),(16,500,100,'2022-11-21','PayTM Wallet',49),(17,5000,45000,'2022-11-29','UPI',51),(18,50000,500,'2022-11-29','PayTM Wallet',52),(19,5000,45500,'2022-11-29','UPI',53),(20,50,50,'2022-11-29','UPI',54),(21,50,50,'2022-11-29','Credit Card',55),(22,50,50,'2022-11-29','UPI',56),(23,50,50,'2022-11-30','UPI',57),(24,5000,45500,'2022-11-30','UPI',58),(25,5000,45000,'2022-11-30','UPI',50),(26,50500,0,'2022-11-30','CASH',64),(27,500,100,'2022-12-06','UPI',84),(28,100,0,'2022-12-08','UPI',85),(29,5000,46500,'2022-12-08','PayTM Wallet',79),(30,100,0,'2022-12-08','UPI',89),(31,50000,500,'2022-12-08','PayTM Wallet',90);
/*!40000 ALTER TABLE `paymentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_cost` double DEFAULT NULL,
  `status` enum('AVAILABLE','UNAVAILABLE') DEFAULT 'AVAILABLE',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,100,'UNAVAILABLE'),(2,100,'UNAVAILABLE'),(3,100,'UNAVAILABLE'),(4,500,'AVAILABLE'),(5,500,'AVAILABLE'),(6,500,'AVAILABLE'),(7,500,'AVAILABLE');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatmentdetails`
--

DROP TABLE IF EXISTS `treatmentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatmentdetails` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `visitingOrAdmitting` tinyint DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `issue_id` int NOT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `room_id_idx` (`room_id`),
  KEY `issue_id_idx` (`issue_id`),
  CONSTRAINT `issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`),
  CONSTRAINT `treatmentdetails_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patientdetails` (`patient_id`),
  CONSTRAINT `treatmentdetails_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctordetails` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmentdetails`
--

LOCK TABLES `treatmentdetails` WRITE;
/*!40000 ALTER TABLE `treatmentdetails` DISABLE KEYS */;
INSERT INTO `treatmentdetails` VALUES (1,1,3,0,'2022-11-17',NULL,0,1),(2,4,4,1,'2022-11-15','2022-11-17',4,1),(31,4,4,1,'2022-11-15','2022-11-17',4,3),(32,4,4,1,'2022-11-17','2022-11-21',4,1),(33,10,6,0,'2022-11-18',NULL,0,1),(34,11,3,1,'2022-11-18','2022-11-18',5,1),(35,11,3,1,'2022-11-18','2022-11-21',5,1),(36,11,3,1,'2022-11-18','2022-11-21',5,1),(37,1,3,0,'2022-11-21',NULL,0,1),(40,12,24,1,'2022-11-21','2022-11-21',0,4),(41,12,24,1,'2022-11-21','2022-11-21',4,2),(49,13,10,1,'2022-11-21','2022-11-21',4,1),(50,12,4,1,'2022-11-22','2022-11-21',4,2),(51,14,26,0,'2022-11-30',NULL,0,2),(52,14,7,1,'2022-11-29','2022-11-29',4,2),(53,15,3,1,'2022-11-29','2022-11-29',5,2),(54,15,27,0,'2022-11-29',NULL,0,1),(55,16,3,0,'2022-11-29',NULL,0,1),(56,12,8,0,'2022-11-29',NULL,0,1),(57,17,29,0,'2022-11-30',NULL,0,1),(58,18,29,1,'2022-11-30','2022-11-30',4,3),(59,18,23,1,'2022-11-30','2022-11-30',4,1),(60,19,10,0,'2022-11-30',NULL,0,1),(61,19,9,1,'2022-11-30','2022-11-30',5,2),(62,19,30,1,'2022-11-30','2022-11-30',4,1),(63,20,10,0,'2022-11-30',NULL,0,1),(64,21,25,1,'2022-11-30','2022-11-30',4,2),(65,1,1,1,'2022-12-05',NULL,1,1),(74,19,4,0,'2022-12-06',NULL,0,1),(76,25,7,0,'2022-12-06',NULL,0,1),(77,25,7,0,'2022-12-06',NULL,0,1),(78,25,7,0,'2022-12-06',NULL,0,1),(79,25,26,1,'2022-12-06','2022-12-08',4,2),(80,25,21,0,'2022-12-06',NULL,0,1),(81,19,4,0,'2022-12-06',NULL,0,1),(82,25,21,0,'2022-12-06',NULL,0,1),(84,27,27,1,'2022-12-06','2022-12-06',5,1),(85,28,3,0,'2022-12-08',NULL,0,1),(87,10,25,0,'2022-12-08',NULL,0,1),(88,4,25,0,'2022-12-08',NULL,0,1),(89,30,23,0,'2022-12-08',NULL,0,1),(90,12,27,1,'2022-12-08','2022-12-08',4,2);
/*!40000 ALTER TABLE `treatmentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sachinpandeyatd','spatd',1),(3,'sachin','pandey',0),(5,'spatd','spatd',0),(6,'raghav','tripathi',0),(7,'javed','khan',0);
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

-- Dump completed on 2022-12-09 10:58:05
