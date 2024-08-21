-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: du_lich
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

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (3,'1','1','bangmuaha123123@gmail.com'),(4,'2','1','1@s.com'),(5,'222','222','123123@gmail.com'),(6,'122','212','23@a.com'),(7,'12','123','123@a.com');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_3d`
--

DROP TABLE IF EXISTS `model_3d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_3d` (
  `id_model` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `view_id` int NOT NULL,
  `embedded` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id_model`),
  KEY `ID_idx1` (`view_id`),
  CONSTRAINT `model` FOREIGN KEY (`view_id`) REFERENCES `view` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_3d`
--

LOCK TABLES `model_3d` WRITE;
/*!40000 ALTER TABLE `model_3d` DISABLE KEYS */;
INSERT INTO `model_3d` VALUES (1,'Cổng đình An Khánh',35.76717120348025,-34.89330610961454,-0.24336971338305968,32,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(2,'Cổng đình An Khánh',48.00844254840083,13.705419918719997,-0.8182046185792762,39,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(3,'Cổng đình An Khánh',-48,-3.05206890918958,-0.74,40,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(4,'Cổng đình An Khánh',25.490581583007113,6.772585528775989,42.39120382299758,41,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(5,'Cổng đình An Khánh',29.661219669943865,4.956697395718022,-39.79768709159836,42,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(7,'đỉnh',49.75423229315793,-3.583839622581005,-0.9901401295004258,43,'https://sketchfab.com/models/dca31c4ff17a441d8ddc4ceb56d24989/embed?autostart=1&preload=1'),(8,'đỉnh',-47.25423543807191,-2.8758423550276597,15.758649469480892,44,'https://sketchfab.com/models/dca31c4ff17a441d8ddc4ceb56d24989/embed?autostart=1&preload=1'),(9,'bia ông lân',49.683599276520795,-4.744861109649985,1.0488640347647238,40,'https://sketchfab.com/models/0992462979dc445fa5042bd4a9aed37b/embed?autostart=1&preload=1'),(10,'bia ông lân',-49.800517887110175,-4.056241309865989,0.22512760580983743,43,'https://sketchfab.com/models/0992462979dc445fa5042bd4a9aed37b/embed?autostart=1&preload=1'),(11,'bia ông lân',-29.098715147839794,-0.45321908239194125,40.52241878993126,44,'https://sketchfab.com/models/0992462979dc445fa5042bd4a9aed37b/embed?autostart=1&preload=1'),(12,'miếu thờ chủ',48.38644099409188,-12.323923188954915,1.0717989679441808,44,'https://sketchfab.com/models/8a5484e6a00a408fbc7c07a8afd3cdf0/embed?autostart=1&preload=1'),(13,'miếu thờ chủ',26.998104552844683,5.522588369354349,41.66656389320499,43,'https://sketchfab.com/models/8a5484e6a00a408fbc7c07a8afd3cdf0/embed?autostart=1&preload=1'),(14,'Chính điện',46.862375432802615,-17.357812106632185,0.06199958728042208,32,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(15,'Chính điện',47.02502718304432,16.89573352258154,-0.12092087242582138,43,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(16,'Chính điện',-9.641479839208392,-48.34301570740134,-8.278612328912654,29,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(17,'Chính điện',5.110251499968106,-46.542664488280536,17.499565325995246,28,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(18,'Chính điện',35.42739944727701,-35.09255097388219,2.4769799715501293,35,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(19,'Chính điện',43.908639250385896,-20.920819169660327,11.49282253290384,37,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(20,'Chính điện',23.298271532097655,-28.463580915369057,33.75021788195606,36,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(21,'Chính điện',-24.680609924341482,-1.1895432965026014,-43.334204155971534,44,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(22,'Chính điện',49.117524225238434,4.512040336713925,7.609434238205627,46,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(23,'Chính điện',48.58493815721565,5.711456565386911,9.797472646393954,47,'https://sketchfab.com/models/9fad6ce7f659460c94480e6dc0b032a3/embed?autostart=1&preload=1'),(24,'Miếu thần nông',27.37830665761448,-4.243222431942337,-41.53952093013455,43,'https://sketchfab.com/models/68120ae7a30f439d96b3af6f2bf2ffcb/embed?autostart=1&preload=1'),(25,'Miếu thần nông',-49.85679048251045,-2.731771825891561,-0.9117182429872431,44,'https://sketchfab.com/models/68120ae7a30f439d96b3af6f2bf2ffcb/embed?autostart=1&preload=1'),(27,'Bản đồ tổng thể',29.258247233197693,-35.918513846765265,-18.635001624896635,35,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1'),(28,'Cổng đình An Khánh',29.306536724195226,-27.156814996582398,-29.937504392237447,35,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(29,'Bản đồ tổng thể',34.97661053050171,-34.267428818015944,9.94049331257269,37,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1'),(30,'Bản đồ tổng thể',12.166616048513808,-27.664411204387385,39.764482655858316,36,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1'),(31,'Cổng đình An Khánh',-4.096214227562292,-20.009608054975928,45.55040147458448,36,'https://sketchfab.com/models/f8ac64c77cca41d68b9940e8d35ed208/embed?autostart=1&preload=1'),(32,'Bản đồ tổng thể',9.00101427866923,-48.82092781556955,5.7125274432754924,29,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1'),(33,'Bản đồ tổng thể',3.1294052805752357,-30.53170141114826,39.40511423560797,28,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1'),(34,'Bản đồ tổng thể',36.5090613037792,-31.919859759737054,11.923759322390147,32,'https://sketchfab.com/models/33a54db7389a403faa07b6daf55bfc38/embed?autostart=1&preload=1');
/*!40000 ALTER TABLE `model_3d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `point_ID` int NOT NULL AUTO_INCREMENT,
  `href` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `info` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `view_id` int NOT NULL,
  `type` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`point_ID`),
  KEY `ID_idx` (`view_id`),
  CONSTRAINT `ID` FOREIGN KEY (`view_id`) REFERENCES `view` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (4,'/view/id=@(106.64719990484934,10.776696172524144)','Quận Bình Chánh','Bình Chánh là một quận nằm ở phía Tây của thành phố',-23.16599687918243,10.0578430681216,-42.86906276504491,23,'địa điểm'),(5,'/view/id=@(106.64719990484934,10.776696172524144)','Quận Gò Vấp','Quận Gò Vấp là một trong những quận nằm ở phía Đông Nam của thành phố Hồ Chí Minh, Việt Nam. Với vị trí địa lý thuận lợi và sự phát triển nhanh chóng, Gò Vấp đã trở thành một khu vực đa dạng về kinh tế, văn hóa và xã hội.',2.1270945987303813,9.265665671561868,48.90227817199732,23,'địa điểm'),(6,'/view/id=@(106.61829631892392,10.81628341578755)','Quận 3','Quận 3 là một trong những quận nằm ở trung tâm thành phố, mang trong mình nét đặc trưng của cuộc sống đô thị sôi động và đa dạng',39.72476637934639,7.881758836113841,28.95983787171868,23,'địa điểm'),(7,'/view/id=@(106.65850189525287,10.849218030647874)','Thành phố Thủ Đức','Thành phố Thủ Đức là một trong những thành phố phát triển nhanh chóng và đầy sức sống tại Việt Nam. ',10.957651354593596,3.6235975946028702,-48.48916692121837,23,'địa điểm'),(8,'/view/id=@(106.63927637983157,10.812109320324586)','trung tâm thành phố','Trung tâm thành phố là nơi tập trung những hoạt động sôi động và sự phát triển nhanh chóng của một thành phố',43.52971172209092,8.91834158686806,-5.203428792252521,27,'địa điểm'),(9,'/view/id=@(106.63927637983157,10.812109320324586)','trung tâm thành phố','Trung tâm thành phố là nơi tập trung những hoạt động sôi động và sự phát triển nhanh chóng của một thành phố',43.52971172209092,8.91834158686806,-5.203428792252521,26,'địa điểm'),(10,'/view/id=@(106.63927637983157,10.812109320324586)','trung tâm thành phố','Trung tâm thành phố là nơi tập trung những hoạt động sôi động và sự phát triển nhanh chóng của một thành phố',43.52971172209092,8.91834158686806,-5.203428792252521,25,'địa điểm'),(11,'/view/id=@(106.63927637983157,10.812109320324586)','trung tâm thành phố','Trung tâm thành phố là nơi tập trung những hoạt động sôi động và sự phát triển nhanh chóng của một thành phố',43.52971172209092,8.91834158686806,-5.203428792252521,24,'địa điểm'),(12,'/view/id=@(106.71102760845834,10.775720092670602)','Mạn trái','Đình thần An Khánh',33.412839345412756,-33.24567224253008,16.165751867808247,28,'tôn giáo'),(13,'/view/id=@(106.71094958954794,10.775409181090726)','Mạn phải','Đình thần An Khánh',-33.05192028420071,-33.43396175581909,16.480707341741507,28,'tôn giáo'),(14,'/view/id=@(106.71098474715116,10.775582198825916)','Sân trước','Đình thần An Khánh',33.60092801650213,-32.26654880489483,-17.687343317556167,35,'tôn giáo'),(15,'/view/id=@(106.71098474715116,10.775582198825916)','Sân trước','Đình thần An Khánh',5.918402029866519,-26.40527407002902,42.23959267634836,36,'tôn giáo'),(16,'/view/id=@(106.71080373624169,10.775659848889486)','Nóc Đình','Đình thần An Khánh',4.154780069299891,-38.55722526125202,31.413393413683625,28,'tôn giáo'),(17,'/view/id=@(106.71141904794094,10.775489431314108)','Cổng vào','Đình thần An Khánh',1.7855108915737283,-8.414431664513675,-49.16834898577936,28,'tôn giáo'),(18,'/view/id=@(106.71098474715116,10.775582198825916)','Sân trước','Đình thần An Khánh',49.68666010262661,2,2.5,32,'tôn giáo'),(19,'/view/id=@(106.71102760845834,10.775720092670602)','Mạn trái','Đình thần An Khánh',39,-21,-22,32,'tôn giáo'),(20,'/view/id=@(106.71094958954794,10.775409181090726)','Mạn phải','Đình thần An Khánh',40.69648173690278,-20.126022427591057,20.393851429240446,32,'tôn giáo'),(21,'/view/id=@(106.71098474715116,10.775582198825916)','Sân trước','Đình thần An Khánh',-35.63472695955368,-23.89344864266392,-25.643085158768244,29,'tôn giáo'),(22,'/view/id=@(106.71039302361783,10.77574511238173)','Đằng Sau','Đình thần An Khánh',34.843003642763065,-27.74864691418546,22.618570643211335,29,'tôn giáo'),(23,'/view/id=@(106.71080373624169,10.775659848889486)','Nóc Đình','Đình thần An Khánh',45.22733232788382,-14.248910477801772,13.430234606091947,37,'tôn giáo'),(24,'/view/id=@(106.71094958954794,10.775409181090726)','Mạn phải','Đình thần An Khánh',46.22733232788382,-16.850822808488726,-8.194990654133832,37,'tôn giáo'),(25,'/view/id=@(106.71102760845834,10.775720092670602)','Mạn trái','Đình thần An Khánh',36.277463244873736,-16.218725481579185,29.895881019392895,37,'tôn giáo'),(27,'/view/id=@(106.71039302361783,10.77574511238173)','Đằng Sau','Đình thần An Khánh',46.29743323662037,-16.567073182126787,2.935163884419712,36,'tôn giáo'),(28,'/view/id=@(106.71039302361783,10.77574511238173)','Đằng Sau','Đình thần An Khánh',27.61753406530374,-16.62644295041717,37.96083265704819,35,'tôn giáo'),(29,'/view/id=@(106.71141904794094,10.775489431314108)','','Đình thần An Khánh',0,50,0,39,'tôn giáo'),(30,'/view/id=@(106.71102000407842,10.77554680281915)',' ','Đình thần An Khánh',50,1.8,-0.17325,39,'tôn giáo'),(31,'/view/id=@(106.71105418259636,10.775555350646826)','Lối vào','Đình thần An Khánh',29.169154812847857,-40.53967417801201,0.033355368594654496,32,'tôn giáo'),(32,'/view/id=@(106.71105418259636,10.775555350646826)','lỗi vào',' ',-50,-10.5399,5.8,40,'tôn giáo'),(33,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',45,-21,1.4,40,'tôn giáo'),(34,'/view/id=@(106.71103361448024,10.775464885432488)',' ',' ',-8.008,-0.331,49.194,40,'tôn giáo'),(35,'/view/id=@(106.71109252846291,10.775729850373708)',' ',' ',-10.58,-1.755,-48.544,40,'tôn giáo'),(36,'/view/id=@(106.71102000407842,10.77554680281915)',' ',' ',-50,-10.35,0.38,43,'tôn giáo'),(37,'/view/id=@(106.71109252846291,10.775729850373708)',' ',' ',-33.401,-2.28,-36.81,43,'tôn giáo'),(38,'/view/id=@(106.71103361448024,10.775464885432488)',' ',' ',-29.49,0.0727,40.157,43,'tôn giáo'),(39,'/view/id=@(106.71084195054259,10.775530196561638)',' ',' ',23.6,-1.77,44,43,'tôn giáo'),(40,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',47.68,0.23,-14.6,43,'tôn giáo'),(41,'/view/id=@(106.71088205930667,10.775574974866851)',' ','Đình thần An Khánh',0.5470647866086714,-49.9722079095317,-0.1360261330859247,28,'tôn giáo'),(42,'/view/id=@(106.71098474715116,10.775582198825916)',' ',' ',0,50,0,43,'tôn giáo'),(43,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',-48.71336114528776,-0.025139274201868,9.940261973717758,44,'tôn giáo'),(44,'/view/id=@(106.71102000407842,10.77554680281915)',' ',' ',-21.984763987877187,0.6758045562195253,44.632840631456794,44,'tôn giáo'),(45,'/view/id=@(106.71060208247685,10.775788583570721)',' ',' ',45.89281385959867,0.2579920798404808,-19.653808054910844,41,'tôn giáo'),(46,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',44.34700998455669,-0.41811289542596297,22.92701675257239,41,'tôn giáo'),(47,'/view/id=@(106.71102000407842,10.77554680281915)',' ',' ',25.98908431150351,-0.6365542775734189,42.634656713927065,41,'tôn giáo'),(49,'/view/id=@(106.71102000407842,10.77554680281915)',' ',' ',37.750455762927814,-3.445733290561123,-32.45368106679939,42,'tôn giáo'),(50,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',48.76059323453673,-0.4932363130632836,-10.614490979344028,42,'tôn giáo'),(51,'/view/id=@(106.71053502603377,10.77555671123728)',' ',' ',41.931505950352786,1.0022815484843957,26.99745529642965,42,'tôn giáo'),(52,'/view/id=@(106.71103361448024,10.775464885432488)',' ',' ',39.863371327909135,-0.47856949533144033,-30.075856874933685,46,'tôn giáo'),(53,'/view/id=@(106.71060208247685,10.775788583570721)',' ',' ',34.71080712573395,0.5419081137948548,35.835778596904966,46,'tôn giáo'),(54,'/view/id=@(106.71053502603377,10.77555671123728)',' ',' ',44.48440061901076,-1.0247617709538084,-22.59035698292576,47,'tôn giáo'),(55,'/view/id=@(106.71109252846291,10.775729850373708)',' ',' ',25.846054844102017,0.7229551333769367,42.71019578542237,47,'tôn giáo'),(56,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',-48.899867446084585,0.9188686026819638,19.81314694841844,45,'tôn giáo'),(57,'/view/id=@(106.71132093812005,10.77555393222652)',' ',' ',-0.550259676869582,-9.437726355949016,49.00213112586342,45,'tôn giáo'),(58,'/view/id=@(106.71119699977622,10.775478256656182)',' ',' ',-0.37873143582465735,-10.73886748547832,-48.71186521641906,45,'tôn giáo'),(59,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',-47.553284412521926,-12.094102901405801,9.064642121175913,48,'tôn giáo'),(60,'/view/id=@(106.71115570714609,10.775488203468212)',' ',' ',1.04495165056272,-13.074493276343953,-48.14802515925493,48,'tôn giáo'),(61,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',-27.230186023888706,-4.086737201753432,41.66538490745672,48,'tôn giáo'),(62,'/view/id=@(106.71115570714609,10.775488203468212)',' ',' ',34.53866336124938,-6.225762651121546,35.48625460234813,45,'tôn giáo'),(63,'/view/id=@(106.71120664872319,10.775576386802017)',' ',' ',34.328055814137144,-7.1510470342713415,-35.48696202086919,45,'tôn giáo'),(64,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',46.052310483550926,-6.062302900604384,-18.45499012852162,45,'tôn giáo'),(65,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',-28.84319690327669,-3.453508013293458,-40.567306745017376,48,'tôn giáo'),(66,'/view/id=@(106.71132093812005,10.77555393222652)',' ',' ',-47.48298332651576,-15.371055968892241,-1.4785818861734066,49,'tôn giáo'),(67,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',-32.636902618617924,-9.97066732693811,-36.409989292294206,49,'tôn giáo'),(68,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',22.17776689267148,-4.435942853981044,-44.50079185133633,49,'tôn giáo'),(69,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',-27.79040961610117,-7.901666865709824,-40.68469251498985,50,'tôn giáo'),(70,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',-46.26997117434812,-12.391039599331362,-14.03783659890677,50,'tôn giáo'),(71,'/view/id=@(106.71120664872319,10.775576386802017)',' ',' ',1.6969562824855868,-14.470520868781644,47.74324187242137,50,'tôn giáo'),(72,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',-30.708870425294457,-2.13906511251334,39.28721607730575,50,'tôn giáo'),(73,'/view/id=@(106.71119699977622,10.775478256656182)',' ',' ',-47.51556000230297,-15.389263945346922,0.8767111493729719,51,'tôn giáo'),(74,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',-35.104523295003204,-8.115892647225865,34.54858989448977,51,'tôn giáo'),(75,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',19.93117720163531,-2.5464868811950594,45.69303891558646,51,'tôn giáo'),(76,'/view/id=@(106.71120664872319,10.775576386802017)',' ',' ',-22.162492424327265,-9.910520821610728,-43.614631244474666,52,'tôn giáo'),(77,'/view/id=@(106.71084859220788,10.775580172690336)',' ',' ',-49.69451118363099,-4.960495486269453,0.5514377516750547,52,'tôn giáo'),(78,'/view/id=@(106.71115570714609,10.775488203468212)',' ',' ',-18.212802434575746,-7.24314813659418,45.87007088944162,52,'tôn giáo'),(79,'/view/id=@(106.71118682925078,10.775530218000307)',' ',' ',46.11458787510043,-12.223730325192381,-14.63684279924953,52,'tôn giáo'),(80,'/view/id=@(106.71115595239164,10.77557515563398)',' ',' ',19.93962516633516,-11.669671815689165,-44.27295012733869,53,'tôn giáo'),(81,'/view/id=@(106.71121901537941,10.775603995586815)',' ',' ',20.398123452107267,-8.806295313784155,44.73908939723272,53,'tôn giáo'),(82,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',-48.16505566851471,-13.251675735190188,0.4242019392372735,53,'tôn giáo'),(83,'/view/id=@(106.71119350379224,10.775527727183043)',' ',' ',48.095546679969566,-13.026581332297297,2.5684584212470116,53,'tôn giáo'),(84,'/view/id=@(106.71118682925078,10.775530218000307)',' ',' ',-43.18561143265339,-11.336204909159251,22.319300789660392,55,'tôn giáo'),(85,'/view/id=@(106.7111090461066,10.775482789542295)',' ',' ',4.027446613332506,-11.845513181963948,-48.34140149985991,55,'tôn giáo'),(86,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',-32.064415157402024,-7.422565169011637,37.55378419590257,55,'tôn giáo'),(87,'/view/id=@(106.71107414688282,10.775542219210518)',' ',' ',-44.848505947558635,-12.630081387664093,-18.076836843945888,55,'tôn giáo'),(88,'/view/id=@(106.71121901537941,10.775603995586815)',' ',' ',-49.02676380540154,-9.251580767172504,1.6880856156350779,56,'tôn giáo'),(89,'/view/id=@(106.71119350379224,10.775527727183043)',' ',' ',-33.44264896179324,-9.698521390636458,-35.73662771765746,56,'tôn giáo'),(90,'/view/id=@(106.71114927876737,10.775596090846268)',' ',' ',1.5042863757201659,-4.629205564192999,-49.662329958176606,56,'tôn giáo'),(91,'/view/id=@(106.7111090461066,10.775482789542295)',' ',' ',3.5426964793148654,-3.964956708939913,49.67266198826243,57,'tôn giáo'),(92,'/view/id=@(106.71119350379224,10.775527727183043)',' ',' ',-29.155360427788793,-9.494118543023706,39.371802912712404,57,'tôn giáo'),(93,'/view/id=@(106.71115595239164,10.77557515563398)',' ',' ',-47.84652681745849,-13.505811818500948,-4.3135318395690785,57,'tôn giáo'),(94,'/view/id=@(106.71114927876737,10.775596090846268)',' ',' ',5.447465720505196,-11.392037519258562,48.26398001757664,54,'tôn giáo'),(95,'/view/id=@(106.71107414688282,10.775542219210518)',' ',' ',-45.6576983767742,-11.659456735359276,16.450368790300374,54,'tôn giáo'),(96,'/view/id=@(106.71118682925078,10.775530218000307)',' ',' ',-44.56385826169579,-11.330795085576396,-19.393216329032676,54,'tôn giáo'),(97,'/view/id=@(106.71118247306863,10.775531621254785)',' ',' ',-32.86735917489797,-8.233346266309791,-36.62395695732352,54,'tôn giáo'),(98,'/view/id=@(106.71107414688282,10.775542219210518)',' ',' ',49.34039167091664,-7.677487488373994,0.6658255169116213,58,'tôn giáo'),(99,'/view/id=@(106.71118682925078,10.775530218000307)',' ',' ',-39.621272871074005,-30.223153687776108,-2.9046336164951607,58,'tôn giáo'),(100,'/view/id=@(106.7111090461066,10.775482789542295)',' ',' ',34.95825915561052,-6.028310327737918,35.117782078451675,58,'tôn giáo'),(101,'/view/id=@(106.71114927876737,10.775596090846268)',' ',' ',36.21300810946123,-6.96516610414953,-33.72140716402572,58,'tôn giáo'),(102,'/view/id=@(106.71119350379224,10.775527727183043)',' ',' ',-47.907003641800365,-13.632413376383909,-2.767661049337986,59,'tôn giáo'),(103,'/view/id=@(106.7111090461066,10.775482789542295)',' ','',15.797180834984179,-7.537819122271987,46.77638600304687,59,'tôn giáo'),(104,'/view/id=@(106.71114927876737,10.775596090846268)',' ',' ',9.70360900929054,-9.974632727247883,-47.976431400970455,59,'tôn giáo'),(105,'/view/id=@(106.71088205930667,10.775574974866851)',' ',' ',42,-27,0.14,32,'tôn giáo'),(106,'/view/id=@(106.71141904794094,10.775489431314108)','Đình An Khánh',' ',-38.791470502648814,-2.0158138802940813,-31.013050860128118,78,'tôn giáo'),(109,'/view/id=@(106.7540699888154,10.775338274730746)','Ủy ban nhân dân thành phố Thủ Đức',' ',-49.21102315500424,0.41340504952345175,7.80441685245047,32,'tôn giáo');
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `view_name` varchar(1000) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `represent` int NOT NULL,
  `video` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PRIMARY_idx` (`represent`),
  CONSTRAINT `PRIMARY` FOREIGN KEY (`represent`) REFERENCES `view` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Đình An Khánh','Đình An Khánh là một trong ba ngôi đình làng chính tại Thủ Thiêm được xây dựng từ cuối thế kỉ 17, đầu thế kỉ 18 và là một trong số các đình làng cổ nhất tại Sài Gòn - Gia Định xưa. Năm 2014, Đình thần An Khánh phải di dời để xây dựng khu đô thị Thủ Thiêm và thành phố mới Thủ Đức. Đến năm 2022, lãnh đạo thành phố Thủ Đức quyết định phục dựng đình thần ở vị trí mới trên tinh thần bảo tồn kiến trúc nguyên thủy của đình làng Nam Bộ.',32,'https://www.youtube.com/embed/OPJrBy2TM-o'),(2,'trung tâm thành phố','Trung tâm thành phố là nơi tập trung những hoạt động sôi động và sự phát triển nhanh chóng của một thành phố. Đây là nơi quy tụ những tòa nhà cao tầng, cửa hàng, chợ, nhà hàng, trung tâm thương mại và các điểm du lịch hấp dẫn. Khi đặt chân vào trung tâm thành phố, ta sẽ cảm nhận được sự sôi động và hối hả của cuộc sống đô thị.',23,''),(3,'Quận 3','Quận 3 là một trong những quận nằm ở trung tâm thành phố, mang trong mình nét đặc trưng của cuộc sống đô thị sôi động và đa dạng. Với vị trí đắc địa, quận 3 trở thành một trung tâm kinh tế, văn hóa và giải trí quan trọng của thành phố.',24,''),(4,'Thành phố Thủ Đức','Thành phố Thủ Đức là một trong những thành phố phát triển nhanh chóng và đầy sức sống tại Việt Nam. Với vị trí nằm ở phía Đông Bắc của Thành phố Hồ Chí Minh, Thủ Đức đã trở thành một trung tâm kinh tế, giáo dục và văn hóa quan trọng.',25,''),(5,'Quận Gò Vấp','Quận Gò Vấp là một trong những quận nằm ở phía Đông Nam của thành phố Hồ Chí Minh, Việt Nam. Với vị trí địa lý thuận lợi và sự phát triển nhanh chóng, Gò Vấp đã trở thành một khu vực đa dạng về kinh tế, văn hóa và xã hội.',26,''),(6,'Quận Bình Chánh','Bình Chánh là một quận nằm ở phía Tây của thành phố Hồ Chí Minh, Việt Nam. Với vị trí địa lý thuận lợi và sự phát triển nhanh chóng, Bình Chánh đã trở thành một khu vực đa dạng về kinh tế, nông nghiệp và công nghiệp.',27,''),(7,'UBND thành phố Thủ Đức','Thành phố Thủ Đức trực thuộc TP.HCM đã được Ủy ban thường vụ Quốc hội chính thức thông qua Nghị quyết thành lập vào ngày 24/7/2020. Tỷ lệ bỏ phiếu tán thành 100%. Nghị quyết được đưa ra trên cơ sở nhập toàn bộ diện tích tự nhiên và dân số của 3 quận gồm: quận 2, quận 9 và quận Thủ Đức. Thời gian có hiệu lực thi hành kể từ ngày 01/01/2021. Ngoài ra, thành phố Thủ Đức có vị trí rất thuận lợi để phát triển ngành hậu cần logistics. Điều phối vận chuyển hàng hóa, đa dạng phương thức vận chuyển.',78,'https://www.youtube.com/embed/jNs2PjpHB-Q');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `view_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `image` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `level` int NOT NULL,
  `parent` int DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `new_idx` (`parent`),
  CONSTRAINT `new` FOREIGN KEY (`parent`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
INSERT INTO `view` VALUES (23,'trung tâm thành phố',106.63927637983157,10.812109320324586,'id=@(106.63927637983157,10.812109320324586)','/upload/resize1687489578966.jpg',1,2,NULL),(24,'Quận 3',106.61829631892392,10.81628341578755,'id=@(106.61829631892392,10.81628341578755)','/upload/resize1687490039428.jpg',1,3,NULL),(25,'Thành phố Thủ Đức',106.65850189525287,10.849218030647874,'id=@(106.65850189525287,10.849218030647874)','/upload/resize1687490213565.jpg',1,4,NULL),(26,'Quận Gò Vấp',106.70839866628314,10.813250206705805,'id=@(106.70839866628314,10.813250206705805)','/upload/resize1687490295700.jpg',1,5,NULL),(27,'Quận Bình Chánh',106.64719990484934,10.776696172524144,'id=@(106.64719990484934,10.776696172524144)','/upload/resize1687490509322.jpg',1,6,NULL),(28,NULL,106.710964211574,10.775581658782706,'id=@(106.71098474715116,10.775582198825916)','/upload/resize1687765922112.jpg',2,1,NULL),(29,NULL,106.71075498476448,10.775658103542268,'id=@(106.71080373624169,10.775659848889486)','/upload/resize1687766314096.jpg',2,1,NULL),(32,'Đình An Khánh',106.71141904794094,10.775489431314108,'id=@(106.71141904794094,10.775489431314108)','/upload/resize1687770098029.jpg',1,1,'https://www.youtube.com/embed/OPJrBy2TM-o'),(35,NULL,106.71087570343978,10.775883109899585,'id=@(106.71094958954794,10.775409181090726)','/upload/resize1687770750753.jpg',2,1,'https://www.youtube.com/embed/WxyWhtpf5V0'),(36,NULL,106.71073489504448,10.775330229890987,'id=@(106.71102760845834,10.775720092670602)','/upload/resize1687770724720.jpg',2,1,'https://www.youtube.com/embed/edqbxNflPUw'),(37,NULL,106.71030308263208,10.775718562384107,'id=@(106.71039302361783,10.77574511238173)','/upload/resize1687771177132.jpg',2,1,NULL),(39,NULL,106.71135042621658,10.775497384563485,'id=@(106.71105418259636,10.775555350646826)','/upload/resize1687838170098.jpg',2,1,NULL),(40,NULL,106.71108892758127,10.775576393258314,'id=@(106.71102000407842,10.77554680281915)','/upload/resize1687841770934.jpg',2,1,NULL),(41,NULL,106.71103930938484,10.775444755119015,'id=@(106.71109252846291,10.775729850373708)','/upload/resize1687850039633.jpg',2,1,NULL),(42,NULL,106.71109831480763,10.775717246003618,'id=@(106.71103361448024,10.775464885432488)','/upload/resize1687850092149.jpg',2,1,NULL),(43,NULL,106.71093470886261,10.775588240688018,'id=@(106.71088205930667,10.775574974866851)','/upload/resize1687852073099.jpg',2,1,'https://www.youtube.com/embed/lzSxOnBBY2I'),(44,NULL,106.71095080125062,10.775690918392693,'id=@(106.71084195054259,10.775530196561638)','/upload/resize1687853558663.jpg',2,1,NULL),(45,NULL,106.71085556442699,10.77563447538474,'id=@(106.71084859220788,10.775580172690336)','/upload/resize1687853593124.jpg',2,1,'https://www.youtube.com/embed/NSnkb1IAjbE'),(46,NULL,106.71053502603377,10.77555671123728,'id=@(106.71053502603377,10.77555671123728)','/upload/resize1687876775852.jpg',2,1,NULL),(47,NULL,106.71060208247685,10.775788583570721,'id=@(106.71060208247685,10.775788583570721)','/upload/resize1687876813375.jpg',2,1,NULL),(48,NULL,106.71086763371804,10.775710825464433,'id=@(106.71132093812005,10.77555393222652)','/upload/resize1687919941673.jpg',2,1,NULL),(49,NULL,106.71080862605793,10.775718657050595,'id=@(106.71115570714609,10.775488203468212)','/upload/resize1687920251267.jpg',2,1,NULL),(50,NULL,106.71083276687732,10.775552859760898,'id=@(106.71119699977622,10.775478256656182)','/upload/resize1687920631637.jpg',2,1,NULL),(51,NULL,106.71077241818487,10.775583069830294,'id=@(106.71120664872319,10.775576386802017)','/upload/resize1687922978583.jpg',2,1,NULL),(52,NULL,106.71077644128185,10.775654154400009,'id=@(106.71118247306863,10.775531621254785)','/upload/resize1687923016944.jpg',2,1,NULL),(53,NULL,106.71073352824708,10.77566205268449,'id=@(106.71118682925078,10.775530218000307)','/upload/resize1687926254443.jpg',2,1,NULL),(54,NULL,106.7106971896639,10.77558687159491,'id=@(106.71115595239164,10.77557515563398)','/upload/resize1687927816540.jpg',2,1,NULL),(55,NULL,106.71072938059876,10.775739571759079,'id=@(106.71121901537941,10.775603995586815)','/upload/resize1687927837655.jpg',2,1,NULL),(56,NULL,106.71064487939469,10.775755368323384,'id=@(106.7111090461066,10.775482789542295)','/upload/resize1687927860127.jpg',2,1,NULL),(57,NULL,106.71060210707812,10.77561203021258,'id=@(106.71114927876737,10.775596090846268)','/upload/resize1687927877434.jpg',2,1,NULL),(58,NULL,106.71067720488897,10.77569101305918,'id=@(106.71119350379224,10.775527727183043)','/upload/resize1687930588401.jpg',2,1,NULL),(59,NULL,106.71061685843384,10.775688380297945,'id=@(106.71107414688282,10.775542219210518)','/upload/resize1687932814459.jpg',2,1,NULL),(78,'Ủy ban nhân dân thành phố Thủ Đức',106.7540699888154,10.775338274730746,'id=@(106.7540699888154,10.775338274730746)','/upload/resize1697388902847.jpg',1,7,NULL);
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 13:04:31
