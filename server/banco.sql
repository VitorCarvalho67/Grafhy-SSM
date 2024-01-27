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

-- Dump completed on 2024-01-27  0:45:31
