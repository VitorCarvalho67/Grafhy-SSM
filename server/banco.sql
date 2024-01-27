-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: grafhyPy
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comments` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `id_posts` int(11) NOT NULL,
  `data_comment` varchar(255) NOT NULL,
  `text_comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comments`),
  KEY `id_users` (`id_users`),
  KEY `id_posts` (`id_posts`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_posts`) REFERENCES `posts` (`id_posts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

--
-- Table structure for table `comunicados`
--

DROP TABLE IF EXISTS `comunicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunicados` (
  `id_comunicados` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `file_arquivo` longblob NOT NULL,
  PRIMARY KEY (`id_comunicados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicados`
--

/*!40000 ALTER TABLE `comunicados` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicados` ENABLE KEYS */;

--
-- Table structure for table `comunicados_teste`
--

DROP TABLE IF EXISTS `comunicados_teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunicados_teste` (
  `id_comunicados` int(11) NOT NULL AUTO_INCREMENT,
  `title_comunicado` varchar(255) NOT NULL,
  `message_comunicado` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  `hash_arquivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comunicados`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicados_teste`
--

/*!40000 ALTER TABLE `comunicados_teste` DISABLE KEYS */;
INSERT INTO `comunicados_teste` VALUES (29,'awdawd','awdawd','2024-1-25','b294ada97f27f9d5d5d90c3470732c195058599dfad81cb705db1aa867edbcf2.jpeg'),(30,'aaaaa','aaaa','2024-1-25','09fea83415cb6deeab3c77a2235f4ec803ba62124b7b6449a637350f16a2a89e.jpg'),(31,'awdawd','dawdawd','2024-1-26','46dad02a8c95757ba3d3c2d2bdf43fb1f9b548fbde341751e2530c5a39310a2f.jpg'),(32,'dawdawda','awdawda','2024-1-26','bf6ec354c87cb4cd5d03753752f54c0755563a22df1bb3f6c2347922f18697fa.jpg'),(33,'fes','sefsef','2024-1-27','07efdf5d5ab6291796cb3cdb0ebec0cb7f76e79b7f9de126186ce86595cfbaf2.jpg'),(34,'dawdawd','awdawdawd','2024-1-27','377619e43f1a04c37e9d75f0d76b8e73f19775195da197f3c685350055665881.png');
/*!40000 ALTER TABLE `comunicados_teste` ENABLE KEYS */;

--
-- Table structure for table `contacts_groupo`
--

DROP TABLE IF EXISTS `contacts_groupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_groupo` (
  `id_contacts` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) DEFAULT NULL,
  `id_groups` int(11) DEFAULT NULL,
  `type_contacts` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id_contacts`),
  KEY `ix_contacts_groupo_id_groups` (`id_groups`),
  KEY `ix_contacts_groupo_id_contacts` (`id_contacts`),
  KEY `ix_contacts_groupo_type_contacts` (`type_contacts`),
  KEY `ix_contacts_groupo_id_users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_groupo`
--

/*!40000 ALTER TABLE `contacts_groupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_groupo` ENABLE KEYS */;

--
-- Table structure for table `contacts_grupo`
--

DROP TABLE IF EXISTS `contacts_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_grupo` (
  `id_contacts` int(11) NOT NULL AUTO_INCREMENT,
  `id_groups` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `type_contact` enum('Criador','Admin','Participante') NOT NULL,
  PRIMARY KEY (`id_contacts`),
  KEY `id_groups` (`id_groups`),
  CONSTRAINT `contacts_grupo_ibfk_1` FOREIGN KEY (`id_groups`) REFERENCES `groups` (`id_groups`),
  CONSTRAINT `contacts_grupo_ibfk_2` FOREIGN KEY (`id_groups`) REFERENCES `groups` (`id_groups`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_grupo`
--

/*!40000 ALTER TABLE `contacts_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_grupo` ENABLE KEYS */;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id_contacts` int(11) NOT NULL AUTO_INCREMENT,
  `id_users1` int(11) NOT NULL,
  `id_users2` int(11) NOT NULL,
  PRIMARY KEY (`id_contacts`),
  KEY `id_users1` (`id_users1`),
  KEY `id_users2` (`id_users2`),
  CONSTRAINT `contacts_users_ibfk_1` FOREIGN KEY (`id_users1`) REFERENCES `users` (`id_users`),
  CONSTRAINT `contacts_users_ibfk_2` FOREIGN KEY (`id_users2`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
INSERT INTO `contacts_users` VALUES (22,1,13),(23,13,1),(24,1,14),(25,14,1);
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id_groups` int(11) NOT NULL AUTO_INCREMENT,
  `name_groups` varchar(255) NOT NULL,
  `photo_groups` varchar(255) NOT NULL,
  `description_groups` varchar(255) NOT NULL,
  PRIMARY KEY (`id_groups`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'string','string','string'),(2,'string','string','string'),(3,'AAAAAAAAAAAAAAA','AAAAAAAA','AAAAAAAAA');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id_likes` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `id_posts` int(11) NOT NULL,
  PRIMARY KEY (`id_likes`),
  KEY `id_users` (`id_users`),
  KEY `id_posts` (`id_posts`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_posts`) REFERENCES `posts` (`id_posts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

--
-- Table structure for table `messages_grupo`
--

DROP TABLE IF EXISTS `messages_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_grupo` (
  `id_messages_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `id_groups` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  PRIMARY KEY (`id_messages_grupo`),
  KEY `id_users` (`id_users`),
  KEY `id_groups` (`id_groups`),
  CONSTRAINT `messages_grupo_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  CONSTRAINT `messages_grupo_ibfk_2` FOREIGN KEY (`id_groups`) REFERENCES `groups` (`id_groups`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_grupo`
--

/*!40000 ALTER TABLE `messages_grupo` DISABLE KEYS */;
INSERT INTO `messages_grupo` VALUES (68,13,2,'a','2023-07-10 12:02:48'),(69,13,2,'ggg','2023-07-10 12:05:06'),(70,13,2,'jjj','2023-07-10 12:06:21'),(71,13,2,'a','2023-07-10 12:08:27'),(72,13,2,'awdawd','2023-07-10 12:12:04'),(73,13,2,'awdw','2023-07-10 12:12:04'),(74,13,3,'awdawdawdawdawdawd','2023-07-10 12:35:02'),(75,13,3,'OIIIIII','2023-07-10 12:38:12'),(76,13,3,'opa','2023-07-10 12:38:12'),(77,13,3,'Daniel','2023-07-10 12:42:34'),(78,13,2,'jkhj','2023-07-10 14:49:15'),(79,13,2,'oi','2023-07-10 15:28:48'),(80,13,2,'oiiiii','2023-07-10 17:58:07'),(81,13,2,'opa','2023-07-11 12:56:35'),(82,13,2,'awdawd','2023-07-11 14:17:14'),(83,13,2,'awdawdwa','2023-07-11 14:22:08'),(84,13,2,'fsefsef','2023-07-11 15:02:48'),(85,13,2,'fesfe','2023-07-12 17:13:30'),(86,13,2,'sfefsef','2023-07-13 14:56:32'),(87,13,2,'awdawdawd','2023-07-13 23:22:07'),(88,13,2,'Opa','2023-07-14 01:07:31'),(89,13,2,'awdawdawd','2023-07-14 14:20:16'),(90,13,2,'awdawd','2023-07-14 14:22:14'),(91,13,2,'a','2023-07-14 15:24:23'),(92,13,2,'a','2023-07-14 15:28:17'),(93,13,2,'adwdawdawd','2023-07-14 15:37:37'),(94,13,2,'Oiii','2023-07-14 15:40:38'),(95,13,2,'opa','2024-01-23 23:36:23'),(96,13,2,'awd','2024-01-24 23:50:37'),(97,13,2,'dwad','2024-01-25 00:24:44'),(98,13,2,'DDD','2024-01-25 00:47:20'),(99,13,2,'s','2024-01-25 01:08:16'),(100,13,2,'s','2024-01-25 01:08:16'),(101,13,2,'s','2024-01-25 01:08:16'),(102,13,2,'s','2024-01-25 01:08:16'),(103,13,2,'awdawd','2024-01-25 17:23:21');
/*!40000 ALTER TABLE `messages_grupo` ENABLE KEYS */;

--
-- Table structure for table `messages_users`
--

DROP TABLE IF EXISTS `messages_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_users` (
  `id_messages_users` int(11) NOT NULL AUTO_INCREMENT,
  `id_users1` int(11) NOT NULL,
  `id_users2` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  PRIMARY KEY (`id_messages_users`),
  KEY `id_users1` (`id_users1`),
  KEY `id_users2` (`id_users2`),
  CONSTRAINT `messages_users_ibfk_1` FOREIGN KEY (`id_users1`) REFERENCES `users` (`id_users`),
  CONSTRAINT `messages_users_ibfk_2` FOREIGN KEY (`id_users2`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_users`
--

/*!40000 ALTER TABLE `messages_users` DISABLE KEYS */;
INSERT INTO `messages_users` VALUES (1,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(2,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(3,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(4,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(5,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(6,1,4,'Olá, teste de envio','2023-07-13 11:40:30'),(7,8,8,'OIiii','2023-07-13T18:18:00.526Z'),(8,8,8,'d','2023-07-13T18:18:09.655Z'),(9,8,8,'','2023-07-13T18:20:01.244Z'),(10,8,8,'efsefsefsef','2023-07-13T18:20:09.931Z'),(11,8,8,'fenskeufhesufhsf','2023-07-13T18:22:26.528Z'),(12,8,8,'sefsefse','2023-07-13T18:22:29.873Z'),(13,13,13,'dawdawd','2023-07-13T18:22:54.610Z'),(14,13,13,'dawdwad','2023-07-13T18:45:21.572Z'),(15,1,1,'awdawdwa','2023-07-13T18:45:25.798Z'),(16,1,1,'dawdwa','2023-07-13T18:46:51.610Z'),(17,13,13,'awdawd','2023-07-13T18:46:56.241Z'),(18,1,1,'Olá Vitor sou o Daniel','2023-07-13T18:47:30.651Z'),(19,1,1,'oiiiiiii aqui é o vitor','2023-07-13T18:49:45.488Z'),(20,1,13,'oiiiiiiiii','2023-07-13T19:15:11.506Z'),(21,1,1,'esfefsefsef','2023-07-13T19:17:06.640Z'),(22,1,1,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2023-07-13T19:17:18.464Z'),(23,1,13,'aaaaaaaaaaaaaaaaaaaa','2023-07-13T19:17:26.399Z'),(24,1,1,'oi','2023-07-13T19:19:17.733Z'),(25,13,1,'Olá, teste de envio','2023-07-13 11:40:30'),(26,1,13,'qsqSqsQS','2023-07-13T19:33:51.446Z'),(27,1,13,'AWDAWDAWDWAD','2023-07-13T19:33:58.104Z'),(28,1,13,'DDDDDDDDDDDDDD','2023-07-13T19:38:29.177Z'),(29,13,1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','2023-07-13T19:38:39.867Z'),(30,13,1,'ddddddd','2023-07-13T19:42:27.571Z'),(31,13,1,'awdawd','2023-07-13T19:54:51.655Z'),(32,1,13,'awdawd','2023-07-13T19:55:01.831Z'),(33,1,13,'awdawd','2023-07-13T20:02:04.720Z'),(34,13,1,'awdawd','2023-07-13T20:02:06.153Z'),(35,1,13,'awdawd','2023-07-13T20:02:07.967Z'),(36,13,1,'wdawd','2023-07-13T20:02:09.553Z'),(37,1,13,'awdawd','2023-07-13T20:02:11.352Z'),(38,13,1,'awdawd','2023-07-13T20:02:13.033Z'),(39,1,13,'awdawdawd','2023-07-13T20:02:14.784Z'),(40,13,1,'awdawdawd','2023-07-13T20:02:16.449Z'),(41,1,13,'awdawdaw','2023-07-13T20:02:17.904Z'),(42,13,1,'awdawdawd','2023-07-13T20:02:19.984Z'),(43,1,13,'wadawdawd','2023-07-13T20:02:21.544Z'),(44,13,1,'awdawdawd','2023-07-13T20:02:23.313Z'),(45,1,13,'awdawdawd','2023-07-13T20:02:24.952Z'),(46,13,1,'awdawdawd','2023-07-13T20:02:26.906Z'),(47,1,13,'awdawdaw','2023-07-13T20:02:28.961Z'),(48,13,1,'awdawdawd','2023-07-13T20:02:31.187Z'),(49,13,1,'adawd','2023-07-13T20:02:38.538Z'),(50,13,1,'dawdawd','2023-07-13T20:16:40.450Z'),(51,1,13,'adwawda','2023-07-13T20:32:09.380Z'),(52,13,1,'ssss','2023-07-13T20:32:24.959Z'),(53,13,1,'dwadwada','2023-07-13T20:33:44.595Z'),(54,1,13,'awdawdaw','2023-07-13T20:33:48.216Z'),(55,1,13,'adawdwa','2023-07-13T20:33:52.410Z'),(56,13,1,'Opa','2023-07-13T23:09:10.715Z'),(57,13,1,'Olá, teste de envio','2023-07-12 11:40:30'),(58,13,1,'Legal','2023-07-13T23:48:39.295Z'),(59,13,1,'Teste','2023-07-13T23:50:15.953Z'),(60,13,1,'AAAAAAA','2023-07-13T23:50:19.825Z'),(61,1,13,'Olá','2023-07-13T23:50:35.593Z'),(62,13,1,'Opa','2023-07-14T01:06:01.087Z'),(63,13,1,'awdawdawd','2023-07-14T14:19:25.484Z'),(64,13,1,'dawdawd','2023-07-14T14:19:52.195Z'),(65,1,14,'banana','2023-07-14T15:30:06.321Z'),(66,14,1,'caganeira','2023-07-14T15:30:26.796Z'),(67,1,14,'OIIIIII ','2023-07-14T15:44:12.116Z'),(68,1,13,'oi','2023-07-14T16:46:58.165Z'),(69,1,13,'opa','2023-07-14T16:48:06.134Z'),(70,1,13,'olá','2023-07-14T16:48:10.719Z'),(71,1,13,'opa','2023-07-14T16:48:35.328Z'),(72,13,1,'Tudo bem?','2023-07-14T16:48:43.598Z'),(73,1,14,'wadadw','2023-07-14T17:13:26.069Z');
/*!40000 ALTER TABLE `messages_users` ENABLE KEYS */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id_posts` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `data_post` varchar(255) NOT NULL,
  `text_post` varchar(255) NOT NULL,
  `image_post` varchar(255) NOT NULL,
  PRIMARY KEY (`id_posts`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

--
-- Table structure for table `solicitation`
--

DROP TABLE IF EXISTS `solicitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitation` (
  `id_solicitation` int(11) NOT NULL AUTO_INCREMENT,
  `id_users1` int(11) NOT NULL,
  `id_users2` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitation`),
  KEY `id_users1` (`id_users1`),
  KEY `id_users2` (`id_users2`),
  CONSTRAINT `solicitation_ibfk_1` FOREIGN KEY (`id_users1`) REFERENCES `users` (`id_users`),
  CONSTRAINT `solicitation_ibfk_2` FOREIGN KEY (`id_users2`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitation`
--

/*!40000 ALTER TABLE `solicitation` DISABLE KEYS */;
INSERT INTO `solicitation` VALUES (23,8,13),(25,1,8);
/*!40000 ALTER TABLE `solicitation` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `name_users` varchar(255) NOT NULL,
  `email_users` varchar(255) NOT NULL,
  `password_users` varchar(255) NOT NULL,
  `photo_users` varchar(255) NOT NULL,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vitor','vitor10eduardo@gmail.com','123','str'),(4,'Nome do usuário','emaill@exemplo.com','senha123','linkdafoto.com/foto.jpg'),(8,'Amanda','email@exemplo.com','senha123','wdawdawd'),(13,'Daniel','Daniel@exemplo.com','daniel não lembra a senha','jkaldjwljdaiwdjpawod'),(14,'Lin','lin@exemplo.com','lin123','dwadawdawdawd'),(15,'dawdadawd','adwdaw@dawdaw','awdawdawd','awdawdawd'),(16,'awdawdaw','awdawd@dwadw','awdawdawd','awdawdawd'),(17,'awdawdaw','awdawd@wdadawd','awdawdawd','awdawd'),(18,'Daniel ','daniel.exemplo@gmail.com','+908754560912654TrfpHuln:;','Minha foto?'),(19,'a','a@gmail.com','aaa','a'),(20,'Teste','teste@teste.com','teste','teste'),(21,'dwadawd','awdawd@gmail.com','awdawd','awd');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Temporary table structure for view `view_comments`
--

DROP TABLE IF EXISTS `view_comments`;
/*!50001 DROP VIEW IF EXISTS `view_comments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_comments` AS SELECT
 1 AS `id_comments`,
  1 AS `id_users`,
  1 AS `id_posts`,
  1 AS `data_comment`,
  1 AS `text_comment`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_contacts_grupo`
--

DROP TABLE IF EXISTS `view_contacts_grupo`;
/*!50001 DROP VIEW IF EXISTS `view_contacts_grupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_contacts_grupo` AS SELECT
 1 AS `id_contacts`,
  1 AS `id_groups`,
  1 AS `id_users`,
  1 AS `type_contact`,
  1 AS `name_groups`,
  1 AS `photo_groups` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_contacts_users`
--

DROP TABLE IF EXISTS `view_contacts_users`;
/*!50001 DROP VIEW IF EXISTS `view_contacts_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_contacts_users` AS SELECT
 1 AS `id_contacts`,
  1 AS `id_users1`,
  1 AS `id_users2`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_likes`
--

DROP TABLE IF EXISTS `view_likes`;
/*!50001 DROP VIEW IF EXISTS `view_likes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_likes` AS SELECT
 1 AS `id_likes`,
  1 AS `id_users`,
  1 AS `id_posts`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_messages_grupo`
--

DROP TABLE IF EXISTS `view_messages_grupo`;
/*!50001 DROP VIEW IF EXISTS `view_messages_grupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_messages_grupo` AS SELECT
 1 AS `id_messages_grupo`,
  1 AS `id_users`,
  1 AS `id_groups`,
  1 AS `message`,
  1 AS `date_message`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_messages_users`
--

DROP TABLE IF EXISTS `view_messages_users`;
/*!50001 DROP VIEW IF EXISTS `view_messages_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_messages_users` AS SELECT
 1 AS `id_messages_users`,
  1 AS `id_users1`,
  1 AS `id_users2`,
  1 AS `message`,
  1 AS `date_message`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_posts`
--

DROP TABLE IF EXISTS `view_posts`;
/*!50001 DROP VIEW IF EXISTS `view_posts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_posts` AS SELECT
 1 AS `id_posts`,
  1 AS `id_users`,
  1 AS `data_post`,
  1 AS `text_post`,
  1 AS `image_post`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_solicitation`
--

DROP TABLE IF EXISTS `view_solicitation`;
/*!50001 DROP VIEW IF EXISTS `view_solicitation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_solicitation` AS SELECT
 1 AS `id_solicitation`,
  1 AS `id_users1`,
  1 AS `id_users2`,
  1 AS `name_users`,
  1 AS `photo_users` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'grafhyPy'
--

--
-- Final view structure for view `view_comments`
--

/*!50001 DROP VIEW IF EXISTS `view_comments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_comments` AS select `comments`.`id_comments` AS `id_comments`,`comments`.`id_users` AS `id_users`,`comments`.`id_posts` AS `id_posts`,`comments`.`data_comment` AS `data_comment`,`comments`.`text_comment` AS `text_comment`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`comments` join `users` on((`comments`.`id_users` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_contacts_grupo`
--

/*!50001 DROP VIEW IF EXISTS `view_contacts_grupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contacts_grupo` AS select `contacts_grupo`.`id_contacts` AS `id_contacts`,`contacts_grupo`.`id_groups` AS `id_groups`,`contacts_grupo`.`id_users` AS `id_users`,`contacts_grupo`.`type_contact` AS `type_contact`,`groups`.`name_groups` AS `name_groups`,`groups`.`photo_groups` AS `photo_groups` from (`contacts_grupo` join `groups` on((`contacts_grupo`.`id_groups` = `groups`.`id_groups`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_contacts_users`
--

/*!50001 DROP VIEW IF EXISTS `view_contacts_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contacts_users` AS select `contacts_users`.`id_contacts` AS `id_contacts`,`contacts_users`.`id_users1` AS `id_users1`,`contacts_users`.`id_users2` AS `id_users2`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`contacts_users` join `users` on((`contacts_users`.`id_users1` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_likes`
--

/*!50001 DROP VIEW IF EXISTS `view_likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_likes` AS select `likes`.`id_likes` AS `id_likes`,`likes`.`id_users` AS `id_users`,`likes`.`id_posts` AS `id_posts`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`likes` join `users` on((`likes`.`id_users` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_messages_grupo`
--

/*!50001 DROP VIEW IF EXISTS `view_messages_grupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_messages_grupo` AS select `messages_grupo`.`id_messages_grupo` AS `id_messages_grupo`,`messages_grupo`.`id_users` AS `id_users`,`messages_grupo`.`id_groups` AS `id_groups`,`messages_grupo`.`message` AS `message`,`messages_grupo`.`date_message` AS `date_message`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`messages_grupo` join `users` on((`messages_grupo`.`id_users` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_messages_users`
--

/*!50001 DROP VIEW IF EXISTS `view_messages_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_messages_users` AS select `messages_users`.`id_messages_users` AS `id_messages_users`,`messages_users`.`id_users1` AS `id_users1`,`messages_users`.`id_users2` AS `id_users2`,`messages_users`.`message` AS `message`,`messages_users`.`date_message` AS `date_message`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`messages_users` join `users` on((`messages_users`.`id_users1` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_posts`
--

/*!50001 DROP VIEW IF EXISTS `view_posts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_posts` AS select `posts`.`id_posts` AS `id_posts`,`posts`.`id_users` AS `id_users`,`posts`.`data_post` AS `data_post`,`posts`.`text_post` AS `text_post`,`posts`.`image_post` AS `image_post`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`posts` join `users` on((`posts`.`id_users` = `users`.`id_users`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_solicitation`
--

/*!50001 DROP VIEW IF EXISTS `view_solicitation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_solicitation` AS select `solicitation`.`id_solicitation` AS `id_solicitation`,`solicitation`.`id_users1` AS `id_users1`,`solicitation`.`id_users2` AS `id_users2`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`solicitation` join `users` on((`solicitation`.`id_users1` = `users`.`id_users`))) */;
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

-- Dump completed on 2024-01-27  0:34:09
