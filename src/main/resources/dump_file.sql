-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: learning
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `car3`
--

DROP TABLE IF EXISTS `car3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car3` (
  `carId` int NOT NULL,
  `carModel` varchar(100) NOT NULL,
  `showroomId` int DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `showroomId` (`showroomId`),
  CONSTRAINT `car3_ibfk_1` FOREIGN KEY (`showroomId`) REFERENCES `showroom3` (`showroomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car3`
--

LOCK TABLES `car3` WRITE;
/*!40000 ALTER TABLE `car3` DISABLE KEYS */;
/*!40000 ALTER TABLE `car3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car4`
--

DROP TABLE IF EXISTS `car4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car4` (
  `carId` int NOT NULL AUTO_INCREMENT,
  `carName` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `showroomId` int DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `showroomId` (`showroomId`),
  CONSTRAINT `car4_ibfk_1` FOREIGN KEY (`showroomId`) REFERENCES `showroom4` (`showroomId`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car4`
--

LOCK TABLES `car4` WRITE;
/*!40000 ALTER TABLE `car4` DISABLE KEYS */;
/*!40000 ALTER TABLE `car4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'TestUser','sssss','test@gmail.com','India');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `empno` bigint NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) NOT NULL,
  `sal` int NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `deptno` int DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Adam',2000,'A',1),(4,'Anil',1000,'kill',106),(5,'obito',3000,'M',106),(6,'jhon',5555,'D',1235),(7,'peter',6000,'B',567),(8,'chris',6075,'D',65),(9,'Max',7000,'R',6),(10,'Joe',8000,'G',32),(11,'Madie',3000,'A',46),(12,'newton  AJ',9000,'Y',89);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom`
--

DROP TABLE IF EXISTS `showroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showroom` (
  `showroomId` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`showroomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom`
--

LOCK TABLES `showroom` WRITE;
/*!40000 ALTER TABLE `showroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `showroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom3`
--

DROP TABLE IF EXISTS `showroom3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showroom3` (
  `showroomId` int NOT NULL,
  `showroomName` varchar(100) NOT NULL,
  PRIMARY KEY (`showroomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom3`
--

LOCK TABLES `showroom3` WRITE;
/*!40000 ALTER TABLE `showroom3` DISABLE KEYS */;
/*!40000 ALTER TABLE `showroom3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom4`
--

DROP TABLE IF EXISTS `showroom4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showroom4` (
  `showroomId` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`showroomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom4`
--

LOCK TABLES `showroom4` WRITE;
/*!40000 ALTER TABLE `showroom4` DISABLE KEYS */;
/*!40000 ALTER TABLE `showroom4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom_car4`
--

DROP TABLE IF EXISTS `showroom_car4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showroom_car4` (
  `showroom_id` int NOT NULL,
  `car_id` int NOT NULL,
  PRIMARY KEY (`showroom_id`,`car_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `showroom_car4_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `showroom4` (`showroomId`),
  CONSTRAINT `showroom_car4_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car4` (`carId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom_car4`
--

LOCK TABLES `showroom_car4` WRITE;
/*!40000 ALTER TABLE `showroom_car4` DISABLE KEYS */;
/*!40000 ALTER TABLE `showroom_car4` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 15:32:07
