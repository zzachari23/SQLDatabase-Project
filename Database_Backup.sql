
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31


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

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;


--
-- Table structure for table `Collision_Damages`
--

DROP TABLE IF EXISTS `Collision_Damages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Collision_Damages` (
  `Collision_id` int NOT NULL,
  `Damage_id` int NOT NULL,
  PRIMARY KEY (`Collision_id`,`Damage_id`),
  KEY `fk_Collision_Damages_Collisions1_idx` (`Collision_id`),
  KEY `fk_Collision_Damages_Damages1_idx` (`Damage_id`),
  CONSTRAINT `fk_Collision_Damages_Collisions1` FOREIGN KEY (`Collision_id`) REFERENCES `Collisions` (`Collision_id`),
  CONSTRAINT `fk_Collision_Damages_Damages1` FOREIGN KEY (`Damage_id`) REFERENCES `Damages` (`Damage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collision_Damages`
--

LOCK TABLES `Collision_Damages` WRITE;
/*!40000 ALTER TABLE `Collision_Damages` DISABLE KEYS */;
INSERT INTO `Collision_Damages` VALUES (3406286,12),(3408309,10),(3408972,10),(3412874,9),(3415409,14),(3417512,8),(3421271,13),(3421549,7),(3423261,10),(3427920,3),(3428896,3),(3431094,5),(3433770,1),(3434230,9),(3434943,10),(3439078,1),(3441087,10),(3442499,5),(3444022,11),(3444319,4);
/*!40000 ALTER TABLE `Collision_Damages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Collisions`
--

DROP TABLE IF EXISTS `Collisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Collisions` (
  `Collision_id` int NOT NULL,
  `Driver_id` int NOT NULL,
  `Collision_Time` time NOT NULL,
  `Collision_Date` date NOT NULL,
  `Collision_Travel_Direction` varchar(45) NOT NULL,
  `Collision_Pre_Crash` varchar(45) NOT NULL,
  PRIMARY KEY (`Collision_id`),
  KEY `Driver_id_idx` (`Driver_id`),
  CONSTRAINT `Driver_id` FOREIGN KEY (`Driver_id`) REFERENCES `Driver` (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collisions`
--

LOCK TABLES `Collisions` WRITE;
/*!40000 ALTER TABLE `Collisions` DISABLE KEYS */;
INSERT INTO `Collisions` VALUES (3406286,7,'19:45:00','2016-03-17','North','Going Straight Ahead'),(3408309,16,'04:45:00','2016-04-09','South','Going Straight Ahead'),(3408972,20,'08:45:00','2016-04-19','South','Merging'),(3412874,15,'03:45:00','2016-03-27','North','Going Straight Ahead'),(3415409,18,'06:45:00','2016-04-18','East','Making Left Turn'),(3417512,3,'15:45:00','2016-04-15','Northwest','Making Right Turn'),(3421271,9,'21:45:00','2016-03-18','East','Passing'),(3421549,14,'02:45:00','2016-04-16','East','Entering Parked Position'),(3423261,4,'16:45:00','2016-03-30','South','Making Left Turn'),(3427920,10,'22:45:00','2016-03-29','North','Merging'),(3428896,13,'01:45:00','2016-03-31','East','Going Straight Ahead'),(3431094,5,'17:45:00','2016-05-01','West','Changing Lanes'),(3433770,11,'23:45:00','2016-05-01','South','Going Straight Ahead'),(3434230,17,'05:45:00','2016-04-30','Southwest','Going Straight Ahead'),(3434943,8,'20:45:00','2016-04-28','West','Merging'),(3439078,19,'07:45:00','2016-04-30','South','Merging'),(3441087,12,'00:45:00','2016-05-13','Northwest','Making Left Turn'),(3442499,2,'14:45:00','2016-05-10','South','Going Straight Ahead'),(3444022,6,'18:45:00','2016-05-11','West','Going Straight Ahead'),(3444319,1,'13:45:00','2016-05-18','North','Going Straight Ahead');
/*!40000 ALTER TABLE `Collisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contributing_Factor`
--

DROP TABLE IF EXISTS `Contributing_Factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contributing_Factor` (
  `Cont_Factor_id` int NOT NULL,
  `Contributing_Factor_1` varchar(45) NOT NULL,
  PRIMARY KEY (`Cont_Factor_id`),
  UNIQUE KEY `CONT_FACTOR_ID_UNIQUE` (`Cont_Factor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contributing_Factor`
--

LOCK TABLES `Contributing_Factor` WRITE;
/*!40000 ALTER TABLE `Contributing_Factor` DISABLE KEYS */;
INSERT INTO `Contributing_Factor` VALUES (1,'Pavement Slippery'),(2,'Reaction to Uninvolved Vehicle'),(3,'Driver Inattention/Distraction'),(4,'Turning Improperly'),(5,'Unsafe Lane Changing'),(6,'Following Too Closely'),(7,'Driver Inexperience'),(8,'Traffic Control Disregarded'),(9,'Fell Asleep'),(10,'Alcohol Involvement'),(11,'View Obstructed/Limited'),(12,'Other Vehicular'),(13,'Glare'),(14,'Passing Too Closely'),(15,'Failure to Yeild Right-of-Way');
/*!40000 ALTER TABLE `Contributing_Factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contributing_factor_info`
--

DROP TABLE IF EXISTS `contributing_factor_info`;
/*!50001 DROP VIEW IF EXISTS `contributing_factor_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contributing_factor_info` AS SELECT 
 1 AS `Contributing_Factor_1`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Damage_and_Contributing_Factor`
--

DROP TABLE IF EXISTS `Damage_and_Contributing_Factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Damage_and_Contributing_Factor` (
  `Cont_Factor_id` int NOT NULL,
  `Damage_id` int NOT NULL,
  `Collision_id` int NOT NULL,
  PRIMARY KEY (`Cont_Factor_id`,`Damage_id`,`Collision_id`),
  KEY `DAMAGE_ID_idx` (`Damage_id`),
  KEY `COLLISION_ID_idx` (`Collision_id`),
  CONSTRAINT `COLLISION_ID_1` FOREIGN KEY (`Collision_id`) REFERENCES `Collisions` (`Collision_id`),
  CONSTRAINT `CONT_FACTOR_ID` FOREIGN KEY (`Cont_Factor_id`) REFERENCES `Contributing_Factor` (`Cont_Factor_id`),
  CONSTRAINT `DAMAGE_ID` FOREIGN KEY (`Damage_id`) REFERENCES `Damages` (`Damage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Damage_and_Contributing_Factor`
--

LOCK TABLES `Damage_and_Contributing_Factor` WRITE;
/*!40000 ALTER TABLE `Damage_and_Contributing_Factor` DISABLE KEYS */;
INSERT INTO `Damage_and_Contributing_Factor` VALUES (6,1,3433770),(15,1,3408972),(3,3,3417512),(6,3,3421271),(8,4,3441087),(3,5,3444319),(11,5,3421549),(14,7,3439078),(12,8,3412874),(3,9,3431094),(6,9,3427920),(3,10,3423261),(3,10,3442499),(5,10,3434943),(13,10,3408309),(14,10,3434230),(8,11,3428896),(5,12,3406286),(14,13,3415409),(3,14,3444022);
/*!40000 ALTER TABLE `Damage_and_Contributing_Factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Damages`
--

DROP TABLE IF EXISTS `Damages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Damages` (
  `Damage_id` int NOT NULL,
  `Vehicle_Damage` varchar(45) NOT NULL,
  PRIMARY KEY (`Damage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Damages`
--

LOCK TABLES `Damages` WRITE;
/*!40000 ALTER TABLE `Damages` DISABLE KEYS */;
INSERT INTO `Damages` VALUES (1,'Center Front End'),(2,'Right Front Bumper'),(3,'Left Rear Quarter Panel'),(4,'Roof'),(5,'Left Side Doors'),(6,'Center Back End'),(7,'Right Side Doors'),(8,'Left Front Quarter Panel'),(9,'Left Front Bumper'),(10,'No Damage '),(11,'Right Front Quarter Panel'),(12,'Left Rear Bumper'),(13,'Right Rear Quarter Panel'),(14,'Trailer');
/*!40000 ALTER TABLE `Damages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Driver` (
  `Driver_id` int NOT NULL,
  `Driver_Sex` varchar(2) NOT NULL,
  `Driver_License_Status` varchar(45) NOT NULL,
  `Driver_License_Jurisdiction` varchar(2) NOT NULL,
  PRIMARY KEY (`Driver_id`),
  UNIQUE KEY `DRIVER_ID_UNIQUE` (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (1,'M','Licensed','MD'),(2,'F','Licensed','VA'),(3,'F','Licensed','NY'),(4,'M','Licensed','NY'),(5,'M','Licensed','DC'),(6,'F','Licensed','MD'),(7,'M','Licensed','FL'),(8,'M','Licensed','PA'),(9,'M','Licensed','CT'),(10,'M','Licensed','VA'),(11,'M','Permit','NY'),(12,'M','Unlicensed','MD'),(13,'M','Licensed','NB'),(14,'M','Licensed','VT'),(15,'F','Licensed','GA'),(16,'M','Unlicensed','NY'),(17,'M','Licensed','GA'),(18,'M','Licensed','DE'),(19,'M','Licensed','NC'),(20,'M','Licensed','NJ');
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `driver_crash_info`
--

DROP TABLE IF EXISTS `driver_crash_info`;
/*!50001 DROP VIEW IF EXISTS `driver_crash_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `driver_crash_info` AS SELECT 
 1 AS `Driver_id`,
 1 AS `Driver_Sex`,
 1 AS `Driver_License_Jurisdiction`,
 1 AS `Collision_Time`,
 1 AS `Collision_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Vehicle_Collisions`
--

DROP TABLE IF EXISTS `Vehicle_Collisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle_Collisions` (
  `Collision_id` int NOT NULL,
  `Unique_id` int NOT NULL,
  PRIMARY KEY (`Collision_id`,`Unique_id`),
  KEY `fk_Vehicle_Collisions_Collisions1_idx` (`Collision_id`),
  KEY `fk_Vehicle_Collisions_Vehicles1_idx` (`Unique_id`),
  CONSTRAINT `fk_Vehicle_Collisions_Collisions1` FOREIGN KEY (`Collision_id`) REFERENCES `Collisions` (`Collision_id`),
  CONSTRAINT `fk_Vehicle_Collisions_Vehicles1` FOREIGN KEY (`Unique_id`) REFERENCES `Vehicles` (`Unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle_Collisions`
--

LOCK TABLES `Vehicle_Collisions` WRITE;
/*!40000 ALTER TABLE `Vehicle_Collisions` DISABLE KEYS */;
INSERT INTO `Vehicle_Collisions` VALUES (3406286,16934859),(3408309,16976658),(3408972,16984419),(3412874,16944418),(3415409,16972815),(3417512,16972223),(3421271,16940112),(3421549,16975200),(3423261,16961202),(3427920,16953571),(3428896,16966069),(3431094,17037611),(3433770,17043236),(3434230,17038258),(3434943,17040542),(3439078,17055069),(3441087,17053961),(3442499,17070766),(3444022,17042163),(3444319,17060400);
/*!40000 ALTER TABLE `Vehicle_Collisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vehicle_info`
--

DROP TABLE IF EXISTS `vehicle_info`;
/*!50001 DROP VIEW IF EXISTS `vehicle_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehicle_info` AS SELECT 
 1 AS `Vehicle_Type`,
 1 AS `Vehicles Made After 2010`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Vehicles`
--

DROP TABLE IF EXISTS `Vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicles` (
  `Unique_id` int NOT NULL,
  `Vehicle_Type` varchar(45) NOT NULL,
  `Vehicle_Brand` varchar(45) NOT NULL,
  `Vehicle_Year` varchar(4) NOT NULL,
  `Vehicle_State_Registration` varchar(2) NOT NULL,
  PRIMARY KEY (`Unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles`
--

LOCK TABLES `Vehicles` WRITE;
/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
INSERT INTO `Vehicles` VALUES (16934859,'DODG ZZZ','DODG -CAR/SUV','2017','MD'),(16940112,'DODG DUR','DODG -CAR/SUV','2015','VA'),(16944418,'INFI FX3','INFI -CAR/SUV','2012','MD'),(16953571,'ACUR ATL','ACUR -CAR/SUV','2013','VA'),(16961202,'Passat','VOLK -CAR/SUV','2015','MD'),(16966069,'FORD TAU','FORD -CAR/SUV','2015','MD'),(16972223,'HOND ACC','HOND -CAR/SUV','1998','MD'),(16972815,'FRHT TK','FRHT-TRUCK/BUS','2016','MD'),(16975200,'CHEV IMP','CHEV -CAR/SUV','2010','MD'),(16976658,'M37X','INFI -CAR/SUV','2012','VA'),(16984419,'FRHT TK','FRHT-TRUCK/BUS','2015','VA'),(17037611,'HOND CRV','HOND -CAR/SUV','2012','DC'),(17038258,'EX FORTE','KIA -CAR/SUV','2013','VA'),(17040542,'INTL TK','INTL-TRUCK/BUS','2013','MD'),(17042163,'MAZD MZ2','MAZD -CAR/SUV','2011','MD'),(17043236,'FORD ECP','FORD -CAR/SUV','2006','VA'),(17053961,'HOND CIV','HOND -CAR/SUV','2006','MD'),(17055069,'GMC TK','GMC -CAR/SUV','2005','MD'),(17060400,'FORD F75','FORD-TRUCK/BUS','2005','MD'),(17070766,'LINC LS','LINC -CAR/SUV','2000','VA');
/*!40000 ALTER TABLE `Vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `contributing_factor_info`
--

/*!50001 DROP VIEW IF EXISTS `contributing_factor_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contributing_factor_info` AS select `t`.`Contributing_Factor_1` AS `Contributing_Factor_1`,count(`t`.`Contributing_Factor_1`) AS `Total` from (select `damage_and_contributing_factor`.`Damage_id` AS `Damage_id`,`damage_and_contributing_factor`.`Cont_Factor_id` AS `Cont_Factor_id`,`collisions`.`Collision_id` AS `Collision_id`,`driver`.`Driver_id` AS `Driver_id`,`driver`.`Driver_Sex` AS `Driver_Sex`,`driver`.`Driver_License_Status` AS `Driver_License_Status`,`driver`.`Driver_License_Jurisdiction` AS `Driver_License_Jurisdiction`,`collisions`.`Collision_Time` AS `Collision_Time`,`collisions`.`Collision_Date` AS `Collision_Date`,`collisions`.`Collision_Travel_Direction` AS `Collision_Travel_Direction`,`collisions`.`Collision_Pre_Crash` AS `Collision_Pre_Crash`,`contributing_factor`.`Contributing_Factor_1` AS `Contributing_Factor_1`,`damages`.`Vehicle_Damage` AS `Vehicle_Damage` from ((((`driver` join `collisions` on((`driver`.`Driver_id` = `collisions`.`Driver_id`))) join `damage_and_contributing_factor` on((`collisions`.`Collision_id` = `damage_and_contributing_factor`.`Collision_id`))) join `contributing_factor` on((`damage_and_contributing_factor`.`Cont_Factor_id` = `contributing_factor`.`Cont_Factor_id`))) join `damages` on((`damage_and_contributing_factor`.`Damage_id` = `damages`.`Damage_id`))) where (`damages`.`Vehicle_Damage` <> 'No Damage')) `t` group by `t`.`Contributing_Factor_1` order by `Total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `driver_crash_info`
--

/*!50001 DROP VIEW IF EXISTS `driver_crash_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `driver_crash_info` AS select `driver`.`Driver_id` AS `Driver_id`,`driver`.`Driver_Sex` AS `Driver_Sex`,`driver`.`Driver_License_Jurisdiction` AS `Driver_License_Jurisdiction`,`collisions`.`Collision_Time` AS `Collision_Time`,`collisions`.`Collision_Date` AS `Collision_Date` from (`driver` join `collisions` on((`driver`.`Driver_id` = `collisions`.`Driver_id`))) where ((`collisions`.`Collision_Date` > '2016-04-01') and (`collisions`.`Collision_Date` < '2016-05-30')) order by `collisions`.`Collision_Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicle_info`
--

/*!50001 DROP VIEW IF EXISTS `vehicle_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicle_info` AS select `vehicles`.`Vehicle_Type` AS `Vehicle_Type`,count(0) AS `Vehicles Made After 2010` from (`collisions` left join (`vehicle_collisions` left join `vehicles` on((`vehicle_collisions`.`Unique_id` = `vehicles`.`Unique_id`))) on((`collisions`.`Collision_id` = `vehicle_collisions`.`Collision_id`))) where (`vehicles`.`Vehicle_Year` > '2010') group by `vehicles`.`Vehicle_Type` with rollup */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 19:37:07
