-- MySQL dump 10.13  Distrib 5.7.22-22, for Linux (x86_64)
--
-- Host: 178.208.83.32    Database: a320992_2
-- ------------------------------------------------------
-- Server version	5.7.22-22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photos_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,6,1,'dwdw'),(2,6,1,'dw'),(3,2,4,'dwlkmd'),(4,3,4,'dqwkldm'),(5,8,1,'ksnc'),(6,9,4,'asd'),(7,11,2,'sudo'),(8,11,2,'o, hallo'),(13,26,10,'ASD'),(14,26,10,'BEST LOOK BRO'),(16,27,10,'!'),(17,27,4,'drthr'),(18,28,4,'hdhgt'),(19,27,4,'fghgdtghde'),(20,27,4,'nfghdf'),(21,27,4,'fdgd'),(22,27,4,'1'),(23,29,4,'ghxf'),(24,28,4,'\nTo Sherlock Holmes she is always the woman. I have seldom heard him mention her under any other name. In his eyes she eclipses and predominates the whole of her sex. It was not that he felt any emotion akin to love for Irene Adler. All emo'),(25,28,14,'hey'),(26,28,14,'sd'),(27,29,2,'sdfgdf'),(28,29,2,'sdgfsdf'),(29,29,2,'sdfgsdfgsd'),(30,29,2,'sdfgsdfg'),(31,29,2,'sdfgsdfg'),(32,29,2,'sdfgsdfg'),(33,29,2,'sdfgsdfg'),(34,29,2,'sgdfhjkl;\'hkjghfgdfsdsaaghjkll'),(35,29,2,'gfdshjkl;hjghgfsgdhfjgkhlj;kjhgfdhjhklljghgfdhjygkhljkhgfdjgkhlj;kljhgjfhkljk;ljhjhghjhfklj;kjhgfxjhkjlkgfdshjkl;hjghgfsgdhfjgkhlj;kjhgfdhjhklljghgfdhjygkhljkhgfdjgkhlj;kljhgjfhkljk;ljhjhghjhfklj;kjhgfxjhkjlkgfdshjkl;hjghgfsgdhfjgkhlj;kjhgf'),(36,38,2,'dsfghjgfdghjk'),(37,38,2,'fghjkgfdghj'),(38,10,2,'ohoho]');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photos_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,5,1),(2,6,4),(3,4,4),(4,2,4),(5,3,4),(6,8,1),(7,7,1),(8,9,4),(21,26,10),(10,11,4),(24,11,10),(23,25,10),(13,9,2),(19,18,4),(25,4,10),(26,27,10),(27,23,4),(28,24,4),(29,20,4),(42,27,14),(43,38,2),(44,37,2),(45,36,2),(46,10,2),(47,41,15),(48,40,15),(49,39,15),(50,38,15);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image` varbinary(256) DEFAULT NULL,
  `legend` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,'1581248338.png','dwl'),(2,1,'1581248433.png','dw'),(3,1,'1581251487.png','fswf'),(4,1,'1581252298.png','РµС€СЊ'),(5,1,'1581253900.png','dwf'),(6,1,'1581253930.png','dw'),(7,4,'1581257281.png','dqwd'),(8,4,'1581257289.png','dqwd'),(9,1,'1581258239.png','asd'),(10,5,'1581259015.png','wd'),(11,2,'1581325880.png','sir'),(12,4,'1581357346.png','РІС†РѕС‚'),(13,2,'1581424354.png','11'),(15,4,'1581437057.png',','),(16,4,'1581437184.png','knk'),(17,4,'1581443111.png','dwed'),(18,4,'1581513683.png','bvgh'),(19,4,'1581513727.png','Ghjg'),(20,2,'1581525308.png','dsfgh'),(21,2,'1581528739.png','11'),(22,2,'1581528776.png','ttt'),(23,2,'1581528944.png','222'),(24,4,'1581533934.png','p;l,'),(25,4,'1581593860.png','hello'),(26,4,'1581601619.png','cs'),(27,10,'1581672848.png','hehe'),(28,2,'1581937176.png','hay'),(29,2,'1581937231.png','dnc'),(30,4,'1581961134.png','utu'),(31,4,'1581966072.png','fdsgesfdjawpifjeapsoifjnae;ijonfaewpijnfrwaiopnraweiopuhnrwe'),(32,4,'1581966192.png','feslfjeofjewoijfewiofjseijofnsdoijnfsdijnfgidsnfihfsdiufnsdi'),(34,2,'1582041263.png','11'),(35,2,'1582044978.png','retyu'),(36,2,'1582045657.png','987987'),(37,2,'1582048750.png','nkefjgrekjgn'),(38,2,'1582049930.png','lkjhgfds'),(39,2,'1582052387.png','1'),(40,2,'1582052423.png','444'),(41,2,'1582054231.png','yyyas');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwreset`
--

DROP TABLE IF EXISTS `pwreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pwreset` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwreset`
--

LOCK TABLES `pwreset` WRITE;
/*!40000 ALTER TABLE `pwreset` DISABLE KEYS */;
INSERT INTO `pwreset` VALUES (1,'de309d6a23124171f70b23ad97818afb'),(2,'1069f7ff08e34e2241bc63fbb5e830fc'),(3,'682b9c336323135cc37e951da0c65232'),(4,'11a69bbb3720145593e02d7743f7caa7'),(5,'46fd1d2bc2efc3766c7b8591af8a2839'),(6,'00963f1e660d57171bcbb96bb92a2ae2'),(7,'227758bab6d1e6691d6ab829d2d328f3'),(8,'97258a21f5cb8455a32e502137acf7b3'),(9,'8dfc23ab3ea9ec0b577c1a996eef67f4'),(10,'ea525729a55a11ce7894e9e28ccb18fd'),(11,'62ad93d3b057746a17775a1cbeba8090'),(12,'245e83302abfa40574da12df5d1988ed'),(13,'2ee811b3841271f8231ea49004fb26c1'),(14,'4c8f2095f5d62c3dd70ae71a0f142478'),(15,'c53042480494e2e54b85accdb73b47fc');
/*!40000 ALTER TABLE `pwreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `notif_on` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,0),(15,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `pwd` varchar(128) DEFAULT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `profile_pic` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mcom','becari5227@eigoemail.com','73fa2bd2d68379d63ec35142d32d25f20c457a2e66360f52045ae8d7d4a7e09a81b9029936aa7cb3b0aed32eb7bf0da4ebcb2808af231089621b979ddd4444dd','BnFKgdJslP5MpqI0OkH','profile_pics/mcom.png'),(2,'pthuy','meleno9462@eigoemail.com','4200b86b1d2e161aaa105ce23870b572647189422db854d1ce3209063a22cc20e49288072fba36255d4324fe281a7e733e242166b31dbe6079dd3a2593d67be1','PiVzELzRSMqnwftaOIo','profile_pics/pthuy.png'),(3,'mcomet','holade8506@qmailers.com','ab87d1fd32642d0768bcc50b626475808bed6cc4f1febe03f57dd720600822b02220c5fa0f9bc676f649b249b588a6d8617ae80d0bede56434896ff538d77163','z6Zgfdymnn1ilRb97Tx','profile_pics/mcomet.png'),(4,'mcomet1','becari5227@eigoemail.com','23459fdbb8a4d82934deb5ba171a86e8b5d05c3ae2593b212ba56fab6dfe120495801c17a1d401ebee0c026a2483801a4b48637903ac70c7298b61c237464132','FVNPGxFWYEWtTKZunIB','profile_pics/mcomet1.png'),(5,'hacker1','dq@mailboxt.net','161a535ba373e641ed70e543f8f6dc4915a3507cfc0ae28585d06b3634b86e8d1626c3b5966ff4fa68b606e746ee0de5e277c25df82e980de372ab1ed7d2c4f0','D7qHkqL56hAXhRU3cTt','profile_pics/hacker.png'),(6,'anton','dq@mailbox.net','85de683be5f25b21c031b0ba8e282bdf9fb35bf3f2f7894a52a76c38147f72685d82eb101841e2aff809c9002d817405daca89d576ff295a587f89f821adb557','Mg9vlPNJNMGrPBbTNNE','profile_pics/anton.png'),(7,'lalala','rudy@bk.ru','0d034733a8268b16b536646a24c04dae79c611332d1d94752cecd4805adfec46f6602efdf1a09920c1d5c5ebef0f16e19e691fafa38763f3d05199e07666cf99','ERTfizU5oxNCXeG7E68','profile_pics/lalala.png'),(8,'apereverzev','artem.pereverzev$$$$$@infobip.com','dcc4afb71293989e277ddf79f0cbdc1af90fdd1311a045d213e85c3c6f91df468ea36694f9a9ae10006b592ce530ee5254a24a0aa19713508c72a3c383e46e9c','NzZwdGhuv2ZqIoIdlaa','profile_pics/apereverzev.png'),(9,'artit','artem.pereverzev@infobip.com','324df9b391e1e8a6b21822a74f7be556a70dd1ca48b03c70e2550d3af97e282ade35bc5d7e4a890b7d0b92039cca9506c3d7a40efdf947aa6273e36d65e27c81','eS4nMndCYFRHWv3VoRy','profile_pics/artit.png'),(10,'mcomet2','artpereverzev@gmail.com','8322d912e1b8039b9b7afc9ef7fbed27c687e71fa64bcddafb78b9ad68f849f2b4e2983a783023ae72e20dba222a75f5242d3182166fd8c9835996d2088d2f5e','yGybZmF4ujxf50n8q2q','profile_pics/mcomet2.png'),(11,'chubakka','rojiv19403@xhyemail.com','9993fa28f393e151117a2f99a0cbf382bd7277272d158cf580252cb766847c670f03a54ead2997f8a232cf99847c8350e09c98f0259bac7d2031273ab6db47e9','DAOsOhlCzDpwNgtZ3mq','profile_pics/chubakka.png'),(12,'tydryudr','wiwabe7688@adramail.com','941f58e4534f0de3e07087006476317d6d9d9282c4487aee34812a59d35646f3b4de96517768a806a5732d339e7986f09acad47ce6a4d65ed26bdde6f4fe42f2','hd1Jti8W5Lympj6AFfy','profile_pics/tydryudr.png'),(13,'travis','fake_id@mail.ru','cb5363256cec387e7e7e2043a1cc1d55abc8fdd931eb2eae3d21d39fdfd1aad6a48546a9d050e4fdbaaec7bb9cd29a0b947dd2bd2f1f8b26c0e8ee99eeb27a04','L7KYHatRlpOba833BQu','profile_pics/travis.png'),(14,'oupsnew','artpereverzev@gmail.com','cd92be2f1f680882969773a3510cb5d9f56104b3c8300e699096f4bcb22dd54a7919475df837f10ece1c23da100c148a84fbda91cf9aa501e6a82f3c8f9e4c55','1NRvfqk06xnc8AV4zgK','profile_pics/oupsnew.png'),(15,'jojo','yenimig918@xhyemail.com','08b0adb83654513af51f3604ef9a751e6f71a6d07488b3bb9c3f383fef8c0a5640fdbd896a362ba78e50c85a107030783017a20da0c7c970f1b6fcf980b58656','X3WWn0K6ki5UpDdkTVe','profile_pics/jojo.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified`
--

DROP TABLE IF EXISTS `verified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified`
--

LOCK TABLES `verified` WRITE;
/*!40000 ALTER TABLE `verified` DISABLE KEYS */;
INSERT INTO `verified` VALUES (1,'63c7c765663d245dd423e3fa0ac717a7',1),(2,'afdc7c8ac44801625176fd7ff065eec3',1),(3,'19f474cc114be4e878510911f182f343',0),(4,'2eaaa6f144b03289d4359f1af0c9db01',1),(5,'4b5cc8c5c5e20d6e6a40b3efd31fcafd',1),(6,'1b4c52809901472e605346373e65d89a',0),(7,'96d929e7227117d62f43dc6297385c67',0),(8,'5bbecd1afb927e189d1803e27ec06623',0),(9,'b665d12b2e78f752e995aa3e4d4c0d30',0),(10,'3046011b3fc64b68ce656139708f8e63',1),(11,'fe77bf489c6cf663dcc525e10313112e',1),(12,'a19417da14d90a6c8879aac4dedde517',0),(13,'e85f3729616f8dd81c07d7964879d2de',0),(14,'7f914474224a89655728fb491fe68781',1),(15,'4f39d7613de72a9ef1e26f3aa621f650',1);
/*!40000 ALTER TABLE `verified` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-18 22:50:32
