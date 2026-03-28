-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: HorseRacing
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horse` (
  `horseId` varchar(15) NOT NULL,
  `horseName` varchar(15) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `registration` int NOT NULL,
  `stableId` varchar(30) NOT NULL,
  PRIMARY KEY (`horseId`),
  KEY `stableId` (`stableId`),
  CONSTRAINT `horse_ibfk_1` FOREIGN KEY (`stableId`) REFERENCES `stable` (`stableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
INSERT INTO `horse` VALUES ('horse1','Warrior',2,'C',11111,'stable1'),('horse10','Formula One',6,'G',10101,'stable2'),('horse11','Frisky Frolic',3,'C',11011,'stable4'),('horse12','Fantastic',3,'F',12121,'stable2'),('horse13','Midnight',2,'C',13131,'stable3'),('horse14','Running Wild',4,'S',14141,'stable2'),('horse15','FastOffMyFeet',3,'C',15151,'stable1'),('horse16','Slow Poke',2,'C',16161,'stable3'),('horse17','Slinger',3,'F',17171,'stable2'),('horse18','Sublime',5,'M',18181,'stable6'),('horse19','Front Runner',4,'G',19191,'stable4'),('horse2','Conquerer',2,'F',22222,'stable6'),('horse20','Night',3,'C',20200,'stable1'),('horse21','Negative',3,'F',21210,'stable3'),('horse22','Lightening',2,'C',22220,'stable6'),('horse23','Lazy Loser',4,'G',23230,'stable1'),('horse24','Leaping Lizard',2,'C',24240,'stable1'),('horse25','Beautiful Brown',3,'F',25250,'stable6'),('horse26','Sick Winner',5,'M',26260,'stable2'),('horse3','Dove of Peace',3,'C',33333,'stable1'),('horse4','Ever Faster',3,'F',44444,'stable3'),('horse5','Slow Winner',2,'C',55555,'stable3'),('horse6','Windrunner',2,'F',66666,'stable2'),('horse7','Catapult',4,'M',77777,'stable6'),('horse8','Flying Force',2,'C',88888,'stable4'),('horse9','Laggard',2,'F',99999,'stable4');
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_horse_delete` BEFORE DELETE ON `horse` FOR EACH ROW BEGIN
    INSERT INTO old_info (horseId, horseName, age, gender, registration, stableId)
    VALUES (OLD.horseId, OLD.horseName, OLD.age, OLD.gender, OLD.registration, OLD.stableId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `old_info`
--

DROP TABLE IF EXISTS `old_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `old_info` (
  `horseId` varchar(15) DEFAULT NULL,
  `horseName` varchar(15) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `registration` int DEFAULT NULL,
  `stableId` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_info`
--

LOCK TABLES `old_info` WRITE;
/*!40000 ALTER TABLE `old_info` DISABLE KEYS */;
INSERT INTO `old_info` VALUES ('horse101','TestHorse',3,'C',99999,'stable1');
/*!40000 ALTER TABLE `old_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `ownerId` varchar(15) NOT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `fname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('owner1','Saeed','Ahmed'),('owner10','Faisal','Khan'),('owner11','Jabr','Mohammed'),('owner12','Faleh','Mahmood'),('owner13','Yahya','Mohammed'),('owner14','Sulaiman',''),('owner15','Saeed','Ali'),('owner16','Ahmed','Faisal'),('owner17','Saud','Mohammed'),('owner18','Nazir','Mohammed'),('owner19','Saleh','Fahd'),('owner2','Mohammed','Khalid'),('owner20','Mohammed','Naeem'),('owner3','Faisal','Mohammed'),('owner4','Fahd','Abdul Rahman'),('owner5','Nasr',''),('owner6','Mohammed','Sheikh'),('owner7','Abed','Ahmed'),('owner8','Mashour',''),('owner9','Said','Sheikh');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `ownerId` varchar(15) NOT NULL,
  `horseId` varchar(15) NOT NULL,
  PRIMARY KEY (`ownerId`,`horseId`),
  KEY `horseId` (`horseId`),
  CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `owner` (`ownerId`),
  CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`horseId`) REFERENCES `horse` (`horseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES ('owner14','horse1'),('owner18','horse10'),('owner3','horse10'),('owner4','horse11'),('owner16','horse12'),('owner17','horse13'),('owner15','horse14'),('owner15','horse15'),('owner20','horse16'),('owner4','horse17'),('owner8','horse18'),('owner6','horse19'),('owner3','horse2'),('owner12','horse20'),('owner7','horse21'),('owner7','horse22'),('owner10','horse23'),('owner9','horse23'),('owner12','horse24'),('owner13','horse25'),('owner2','horse26'),('owner2','horse3'),('owner2','horse4'),('owner1','horse5'),('owner12','horse5'),('owner14','horse5'),('owner1','horse6'),('owner5','horse6'),('owner20','horse7'),('owner19','horse8'),('owner2','horse9');
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `raceId` varchar(15) NOT NULL,
  `raceName` varchar(30) DEFAULT NULL,
  `trackName` varchar(30) DEFAULT NULL,
  `raceDate` date DEFAULT NULL,
  `raceTime` time DEFAULT NULL,
  PRIMARY KEY (`raceId`),
  KEY `trackName` (`trackName`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`trackName`) REFERENCES `track` (`trackName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES ('race1','Kings Cup','Riyadh','2007-05-03','14:00:00'),('race10','Claiming Stake','Sharjah','2007-06-02','12:30:00'),('race11','3-year-old fillies','Dubai','2007-04-02','10:30:00'),('race12','Handicap','Yanbu','2007-05-03','11:30:00'),('race13','3-year-old fillies','Yanbu','2007-05-03','11:00:00'),('race14','Handicap','Dhahran','2007-05-10','10:00:00'),('race15','3-year-old colts','Dubai','2007-05-12','15:00:00'),('race16','Claiming Stake','Yanbu','2007-05-20','14:30:00'),('race17','Handicap','Doha','2007-05-20','13:00:00'),('race18','3-year-old fillies','Sharjah','2007-05-21','08:00:00'),('race19','2-year-old colts','Dhahran','2007-05-25','11:00:00'),('race2','2-year-old fillies','Doha','2007-05-03','13:00:00'),('race20','Claiming Stake','Jeddah','2007-05-25','08:30:00'),('race21','3-year-old colts','Riyadh','2007-03-19','14:30:00'),('race22','Handicap','Dhahran','2007-03-27','15:00:00'),('race23','3-year-old fillies','Jeddah','2007-03-28','09:30:00'),('race24','3-year-old colts','Jubail','2007-03-28','13:30:00'),('race25','Claiming Stake','Jeddah','2007-03-29','10:00:00'),('race26','3-year-old colts','Yanbu','2007-03-30','12:30:00'),('race27','Handicap','Dubai','2007-04-03','14:00:00'),('race28','2-year-old fillies','Jeddah','2007-04-04','08:30:00'),('race29','3-year-old colts','Bahrain','2007-04-05','08:00:00'),('race3','2-year-old colts','Doha','2007-05-03','13:30:00'),('race30','Claiming Stake','Dhahran','2007-04-08','09:30:00'),('race31','Handicap','Dhahran','2007-04-08','09:00:00'),('race32','2-year-old colts','Jubail','2007-04-09','11:00:00'),('race33','Claiming Stake','Bahrain','2007-04-10','13:00:00'),('race34','3-year-old colts','Dubai','2007-05-12','12:00:00'),('race35','Handicap','Dubai','2007-04-13','10:30:00'),('race36','3-year-old colts','Jeddah','2007-05-03','14:30:00'),('race4','Handicap','Doha','2007-05-03','12:00:00'),('race5','Claiming Stake','Sharjah','2007-05-03','12:30:00'),('race6','3-year-old fillies','Jubail','2007-06-02','12:30:00'),('race7','Handicap','Jubail','2007-06-02','09:30:00'),('race8','2-year-old colts','Riyadh','2007-06-02','10:30:00'),('race9','2-year-old fillies','Jubail','2007-06-02','11:30:00');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raceresults`
--

DROP TABLE IF EXISTS `raceresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raceresults` (
  `raceId` varchar(15) NOT NULL,
  `horseId` varchar(15) NOT NULL,
  `results` varchar(15) DEFAULT NULL,
  `prize` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`raceId`,`horseId`),
  KEY `horseId` (`horseId`),
  CONSTRAINT `raceresults_ibfk_1` FOREIGN KEY (`raceId`) REFERENCES `race` (`raceId`),
  CONSTRAINT `raceresults_ibfk_2` FOREIGN KEY (`horseId`) REFERENCES `horse` (`horseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raceresults`
--

LOCK TABLES `raceresults` WRITE;
/*!40000 ALTER TABLE `raceresults` DISABLE KEYS */;
INSERT INTO `raceresults` VALUES ('race1','horse11','second',200000.00),('race1','horse15','third',500000.00),('race1','horse3','first',500000.00),('race10','horse18','fourth',500.00),('race11','horse12','first',50000.00),('race11','horse17','second',25000.00),('race11','horse21','fourth',10000.00),('race12','horse14','first',6000.00),('race12','horse18','second',5000.00),('race13','horse12','third',30000.00),('race13','horse25','first',100000.00),('race13','horse4','second',50000.00),('race14','horse23','first',25000.00),('race14','horse26','second',20000.00),('race15','horse11','second',10000.00),('race15','horse24','third',8000.00),('race16','horse10','second',5000.00),('race16','horse14','third',4000.00),('race17','horse10','second',1100.00),('race17','horse7','first',15000.00),('race18','horse6','first',70000.00),('race19','horse1','second',80000.00),('race19','horse22','first',1000000.00),('race19','horse8','third',60000.00),('race2','horse2','second',50000.00),('race2','horse20','third',20000.00),('race2','horse6','first',100000.00),('race20','horse10','fourth',500.00),('race20','horse14','second',1000.00),('race20','horse23','first',1500.00),('race20','horse26','third',800.00),('race21','horse15','second',55000.00),('race21','horse24','first',70000.00),('race21','horse3','third',40000.00),('race22','horse18','first',10000.00),('race22','horse19','second',8000.00),('race23','horse25','first',150000.00),('race24','horse7','first',10000.00),('race25','horse10','second',8000.00),('race25','horse20','fourth',2000.00),('race26','horse20','fourth',2000.00),('race26','horse24','first',8000.00),('race27','horse18','first',70000.00),('race27','horse23','third',40000.00),('race28','horse25','first',90000.00),('race29','horse15','first',80000.00),('race29','horse24','third',50000.00),('race29','horse3','second',65000.00),('race3','horse1','third',20000.00),('race3','horse22','first',70000.00),('race3','horse5','second',50000.00),('race30','horse10','fourth',500.00),('race30','horse14','second',1500.00),('race31','horse10','fourth',30000.00),('race31','horse23','third',50000.00),('race31','horse26','second',70000.00),('race31','horse7','first',90000.00),('race32','horse13','second',125000.00),('race32','horse16','third',100000.00),('race32','horse22','first',150000.00),('race33','horse23','second',1700.00),('race33','horse26','third',1200.00),('race34','horse11','first',50000.00),('race34','horse15','second',30000.00),('race35','horse19','second',25000.00),('race35','horse7','first',45000.00),('race36','horse11','first',100000.00),('race36','horse15','second',80000.00),('race36','horse20','third',50000.00),('race4','horse14','no show',0.00),('race4','horse18','no show',0.00),('race4','horse19','first',50000.00),('race6','horse25','first',5000.00),('race7','horse7','second',2000.00),('race9','horse11','last',0.00);
/*!40000 ALTER TABLE `raceresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stable`
--

DROP TABLE IF EXISTS `stable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stable` (
  `stableId` varchar(15) NOT NULL,
  `stableName` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `colors` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stable`
--

LOCK TABLES `stable` WRITE;
/*!40000 ALTER TABLE `stable` DISABLE KEYS */;
INSERT INTO `stable` VALUES ('stable1','Zobair Farm','Riyadh','orange'),('stable2','Zayed Farm','Dubai','kiwi'),('stable3','Zahra Farm','Jeddah','cinnamon'),('stable4','Sunny Stables','Jubail','lemon'),('stable5','Ajman Stables','Ajman','lemon'),('stable6','Dubai Stables','Dubai','bright blue');
/*!40000 ALTER TABLE `stable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track` (
  `trackName` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `length` int DEFAULT NULL,
  PRIMARY KEY (`trackName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES ('Bahrain','BH',18),('Dhahran','SA',20),('Doha','QT',20),('Dubai','UE',17),('Jeddah','SA',19),('Jubail','SA',15),('Riyadh','SA',22),('Sharjah','UE',20),('Yanbu','SA',18);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `trainerId` varchar(15) NOT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `stableId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`trainerId`),
  KEY `stableId` (`stableId`),
  CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`stableId`) REFERENCES `stable` (`stableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES ('trainer1','Mohammed','Fahd','stable2'),('trainer2','Saleh','Saeed','stable1'),('trainer3','Ali','Raad','stable4'),('trainer4','Sayed','Wasim','stable3'),('trainer5','Ahmed','Ali','stable3'),('trainer6','Faisal','Salah','stable5'),('trainer7','Hamid','Ahmed','stable6'),('trainer8','Khalid','Ahmed','stable6');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 18:03:21
