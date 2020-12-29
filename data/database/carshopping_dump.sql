-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: carshopping
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car` (
  `id_car` int(11) NOT NULL AUTO_INCREMENT,
  `name_car` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` smallint(6) DEFAULT NULL,
  `name_brand` varchar(15) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_car`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'2 series',36895,3,'bmw','germany'),(2,'i8',148495,20,'bmw','germany'),(3,'a3',34295,9,'audi','germany'),(4,'e-tron',66994,4,'audi','germany'),(5,'blazer',29995,10,'chevrolet','america'),(6,'corvette',59995,16,'chevrolet','america'),(7,'488',33750,3,'ferrari','Italia'),(8,'sf90 Stradale',628750,1,'ferrari','Italia'),(9,'corolla hatchpack',21560,50,'toyota','Japan'),(10,'avalon',36870,24,'toyota','Japan'),(37,'cambry',2000,4,'toyota','japan'),(38,'lux a2',20000,1,'vinfast','viet nam'),(39,'civic ',10000,2,'honda','japan');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denomination`
--

DROP TABLE IF EXISTS `denomination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `denomination` (
  `id_denomi` char(2) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `money` int(11) DEFAULT '0',
  PRIMARY KEY (`id_denomi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denomination`
--

LOCK TABLES `denomination` WRITE;
/*!40000 ALTER TABLE `denomination` DISABLE KEYS */;
INSERT INTO `denomination` VALUES ('m1',1000),('m2',2000),('m5',5000),('n1',10000),('n2',20000);
/*!40000 ALTER TABLE `denomination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneycard`
--

DROP TABLE IF EXISTS `moneycard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moneycard` (
  `id_card` int(11) NOT NULL AUTO_INCREMENT,
  `carcode` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `id_denomi` char(2) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `amount` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_card`),
  UNIQUE KEY `carcode` (`carcode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneycard`
--

LOCK TABLES `moneycard` WRITE;
/*!40000 ALTER TABLE `moneycard` DISABLE KEYS */;
INSERT INTO `moneycard` VALUES (1,'Card123','m1',1),(2,'Card345','m2',2),(3,'Card678','n1',12),(4,'VipCard123','n2',0);
/*!40000 ALTER TABLE `moneycard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` char(8) DEFAULT NULL,
  `id_car` char(8) DEFAULT NULL,
  `buying_time` date DEFAULT NULL,
  `amount` smallint(6) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'3','4','2020-12-09',2,133988),(2,'4','9','2020-12-09',2,43120),(3,'6','2','2020-12-09',3,445485),(4,'3','1','2020-12-09',3,110685),(5,'3','36','2020-12-09',3,9000),(6,'3','4','2020-12-09',1,66994),(7,'3','1','2020-12-10',3,110685),(8,'6','10','2020-12-10',1,36870),(9,'5','37','2020-12-24',2,4000),(10,'7','8','2020-12-24',1,628750),(11,'7','1','2020-12-24',2,73790),(12,'3','37','2020-12-24',2,4000),(13,'7','36','2020-12-24',1,1000),(14,'7','36','2020-12-24',1,1000),(15,'7','37','2020-12-25',5,10000),(16,'7','3','2020-12-25',1,34295),(17,'6','38','2020-12-25',1,20000),(18,'7','39','2020-12-28',1,10000),(19,'9','37','2020-12-28',1,2000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `role` char(1) DEFAULT 'u',
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `fk_account_idx` (`id`),
  CONSTRAINT `fk_account` FOREIGN KEY (`id`) REFERENCES `person_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Hoang Linh','Nguyen','M','2000-01-01',3547,'Giong Rieng, Kien Giang','a'),(2,'abcd','123','F','2014-02-19',12554,'cantho','u'),(3,'Thuy Lieu','Bui','F','2020-11-16',3255,'Giong Rieng, Kien Giang','u'),(4,'Lap Nghiep','Nguyen','M','2020-07-31',996544,'Cái Răng, Cần Thơ','a'),(5,'nhat khang','nguyen','M','2020-12-24',1225588,'Mỏ cày nam, Bến tre','u'),(6,'thanh bình','trần','M','2000-08-15',789456,'An giang ','u'),(7,'the van','vo','M','2020-12-23',112233,'giong rieng, kien giang','u'),(8,'ngoc dinh','nguyen','M','2020-12-17',114441,'tra vinh','u'),(9,'trung hieu','nguyen','M','2000-06-06',321654,'hau giang','u');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_account`
--

DROP TABLE IF EXISTS `person_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pass_word` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `pass_word` (`pass_word`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_account`
--

LOCK TABLES `person_account` WRITE;
/*!40000 ALTER TABLE `person_account` DISABLE KEYS */;
INSERT INTO `person_account` VALUES (1,'linh','linh123',4000),(2,'abcd123','abc12345',4000),(3,'lieu','lieu123',7000),(4,'nghiep','lapnghiep123',4000),(5,'nhatkhang','nhatkhang123',4000),(6,'binh','binh321',4000),(7,'van','van123',1705),(8,'dinh','dinh123',1000),(9,'hieu','hieu321',0);
/*!40000 ALTER TABLE `person_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'carshopping'
--
/*!50003 DROP FUNCTION IF EXISTS `getAmountMoneyCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAmountMoneyCard`(cardCode varchar(10)) RETURNS int(11)
    DETERMINISTIC
BEGIN
return (select amount from moneycard where carcode = cardCode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getBalanceAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getBalanceAccount`(username char(15)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	declare balance  int ;
    set balance = (select balance from person_account where person_account.user_name in(username));
RETURN balance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getIdAccount` */;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getIdAccount`(username char(15)) RETURNS int(11)
    DETERMINISTIC
begin 
declare x int;
set x = (select id from person_account where username = person_account.user_name);
return x;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci ;
/*!50003 DROP FUNCTION IF EXISTS `isHasProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isHasProfile`(id_customer int) RETURNS tinyint(1)
    DETERMINISTIC
begin
	declare isHas int;
    set isHas = (select count(*) from person inner join person_account on person.id = person_account.id where person_account.id = id_customer) ;
    if(isHas > 0)
		then
			return true;
	else 
		return false;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isHaveEnoughMoney` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isHaveEnoughMoney`( id_customer int, minusMoney int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	declare currentMoney int ;
    set currentMoney = (select balance from person_account where person_account.id= id_customer);
    if(currentMoney >= minusMoney)
		then 
        return true;
        else 
        return false;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isValidAccount` */;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isValidAccount`(uN char(15),pW char(15)) RETURNS tinyint(1)
    DETERMINISTIC
begin 
	declare countAccount int ;
	set countAccount = (select count(*) from person_account where user_name = uN and pW = pass_Word );
	if(countAccount =1 )
		then 
        return true;
        else 
        return false;
	end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `addMoney` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMoney`(id_account int , carcode varchar(10))
BEGIN
	declare price int ;
    declare currentAmount int;
    set price = (select denomination.money from 
						denomination inner join moneycard 
                        on denomination.id_denomi = moneycard.id_denomi
                        where 
                        moneycard.carcode = carcode
                );
	if(price is null)
    then 
		set price = 0;
	end if;
    set currentAmount = (select amount from moneycard where carcode = moneycard.carcode);
    if(currentAmount = 0)
		then
        select "amout do not enough Please add amount to money car " as 'error';
        else 
        begin
			update person_account set balance = (person_account.balance + price) where id = id_account ;
			update moneycard set amount = amount -1 where carcode = moneycard.carcode;
		end;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findCar` */;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findCar`(namecar varchar(20))
begin
	declare regex varchar(22);
    set regex =  concat("%",namecar,"%");
	select * from car where name_car like regex;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `carshopping` CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `minusMoney` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `minusMoney`(id_customer int,money int)
begin 
	declare  currentMoney int ;
    set currentMoney = (select balance from person_account where person_account.id= id_customer);
    set currentMoney = currentMoney - money;
    update person_account set balance = currentMoney where id = id_customer;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showHistoryBuyingCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showHistoryBuyingCustomer`(id_customer int )
begin 
	if(id_customer = -1)
    then
		select id_order,car.id_car,car.name_car,person.id,person.first_name,orders.buying_time,person.last_name,orders.amount,orders.total 
		from ((orders inner join car on orders.id_car = car.id_car)  
		inner join person on orders.id_customer =  person.id);
    else 
		select id_order,car.id_car,car.name_car,person.id,person.first_name,person.last_name,orders.buying_time,orders.amount,orders.total 
		from ((orders inner join car on orders.id_car = car.id_car)  
		inner join person on orders.id_customer =  person.id)
		where orders.id_customer = id_customer;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAmountCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAmountCar`( id int ,minusAmount smallint)
BEGIN
	declare x int ;
    set x = (select amount from car where car.id_car = id);
    set x  = x - minusAmount;
    update car set amount = x where car.id_car = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-29  7:38:56
