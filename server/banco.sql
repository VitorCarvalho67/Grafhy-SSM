/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS comments;
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

DROP TABLE IF EXISTS comunicados;
CREATE TABLE `comunicados` (
  `id_comunicados` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `file_arquivo` longblob NOT NULL,
  PRIMARY KEY (`id_comunicados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS comunicados_teste;
CREATE TABLE `comunicados_teste` (
  `id_comunicados` int(11) NOT NULL AUTO_INCREMENT,
  `title_comunicado` varchar(255) NOT NULL,
  `message_comunicado` varchar(255) NOT NULL,
  `date_message` varchar(255) NOT NULL,
  `hash_arquivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comunicados`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS contacts_groupo;
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

DROP TABLE IF EXISTS contacts_grupo;
CREATE TABLE `contacts_grupo` (
  `id_contacts` int(11) NOT NULL AUTO_INCREMENT,
  `id_groups` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `type_contact` enum('Criador','Admin','Participante') NOT NULL,
  PRIMARY KEY (`id_contacts`),
  KEY `id_groups` (`id_groups`),
  CONSTRAINT `contacts_grupo_ibfk_1` FOREIGN KEY (`id_groups`) REFERENCES `groups` (`id_groups`),
  CONSTRAINT `contacts_grupo_ibfk_2` FOREIGN KEY (`id_groups`) REFERENCES `groups` (`id_groups`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS contacts_users;
CREATE TABLE `contacts_users` (
  `id_contacts` int(11) NOT NULL AUTO_INCREMENT,
  `id_users1` int(11) NOT NULL,
  `id_users2` int(11) NOT NULL,
  PRIMARY KEY (`id_contacts`),
  KEY `id_users1` (`id_users1`),
  KEY `id_users2` (`id_users2`),
  CONSTRAINT `contacts_users_ibfk_1` FOREIGN KEY (`id_users1`) REFERENCES `users` (`id_users`),
  CONSTRAINT `contacts_users_ibfk_2` FOREIGN KEY (`id_users2`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id_groups` int(11) NOT NULL AUTO_INCREMENT,
  `name_groups` varchar(255) NOT NULL,
  `photo_groups` varchar(255) NOT NULL,
  `description_groups` varchar(255) NOT NULL,
  PRIMARY KEY (`id_groups`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS likes;
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

DROP TABLE IF EXISTS messages_grupo;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS messages_users;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS posts;
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

DROP TABLE IF EXISTS solicitation;
CREATE TABLE `solicitation` (
  `id_solicitation` int(11) NOT NULL AUTO_INCREMENT,
  `id_users1` int(11) NOT NULL,
  `id_users2` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitation`),
  KEY `id_users1` (`id_users1`),
  KEY `id_users2` (`id_users2`),
  CONSTRAINT `solicitation_ibfk_1` FOREIGN KEY (`id_users1`) REFERENCES `users` (`id_users`),
  CONSTRAINT `solicitation_ibfk_2` FOREIGN KEY (`id_users2`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `name_users` varchar(255) NOT NULL,
  `email_users` varchar(255) NOT NULL,
  `password_users` varchar(255) NOT NULL,
  `photo_users` varchar(255) NOT NULL,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE OR REPLACE VIEW `view_comments` AS select `comments`.`id_comments` AS `id_comments`,`comments`.`id_users` AS `id_users`,`comments`.`id_posts` AS `id_posts`,`comments`.`data_comment` AS `data_comment`,`comments`.`text_comment` AS `text_comment`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`comments` join `users` on((`comments`.`id_users` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_contacts_grupo` AS select `contacts_grupo`.`id_contacts` AS `id_contacts`,`contacts_grupo`.`id_groups` AS `id_groups`,`contacts_grupo`.`id_users` AS `id_users`,`contacts_grupo`.`type_contact` AS `type_contact`,`groups`.`name_groups` AS `name_groups`,`groups`.`photo_groups` AS `photo_groups` from (`contacts_grupo` join `groups` on((`contacts_grupo`.`id_groups` = `groups`.`id_groups`)));

CREATE OR REPLACE VIEW `view_contacts_users` AS select `contacts_users`.`id_contacts` AS `id_contacts`,`contacts_users`.`id_users1` AS `id_users1`,`contacts_users`.`id_users2` AS `id_users2`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`contacts_users` join `users` on((`contacts_users`.`id_users1` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_likes` AS select `likes`.`id_likes` AS `id_likes`,`likes`.`id_users` AS `id_users`,`likes`.`id_posts` AS `id_posts`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`likes` join `users` on((`likes`.`id_users` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_messages_grupo` AS select `messages_grupo`.`id_messages_grupo` AS `id_messages_grupo`,`messages_grupo`.`id_users` AS `id_users`,`messages_grupo`.`id_groups` AS `id_groups`,`messages_grupo`.`message` AS `message`,`messages_grupo`.`date_message` AS `date_message`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`messages_grupo` join `users` on((`messages_grupo`.`id_users` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_messages_users` AS select `messages_users`.`id_messages_users` AS `id_messages_users`,`messages_users`.`id_users1` AS `id_users1`,`messages_users`.`id_users2` AS `id_users2`,`messages_users`.`message` AS `message`,`messages_users`.`date_message` AS `date_message`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`messages_users` join `users` on((`messages_users`.`id_users1` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_posts` AS select `posts`.`id_posts` AS `id_posts`,`posts`.`id_users` AS `id_users`,`posts`.`data_post` AS `data_post`,`posts`.`text_post` AS `text_post`,`posts`.`image_post` AS `image_post`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`posts` join `users` on((`posts`.`id_users` = `users`.`id_users`)));

CREATE OR REPLACE VIEW `view_solicitation` AS select `solicitation`.`id_solicitation` AS `id_solicitation`,`solicitation`.`id_users1` AS `id_users1`,`solicitation`.`id_users2` AS `id_users2`,`users`.`name_users` AS `name_users`,`users`.`photo_users` AS `photo_users` from (`solicitation` join `users` on((`solicitation`.`id_users1` = `users`.`id_users`)));





INSERT INTO contacts_grupo(id_contacts,id_groups,id_users,type_contact) VALUES('1','2','13','\'Participante\'');


INSERT INTO `groups`(id_groups,name_groups,photo_groups,description_groups) VALUES('2','\'chat global\'','\'chat global\'','\'chat global\'');





INSERT INTO users(id_users,name_users,email_users,password_users,photo_users) VALUES('13','\'teste\'','\'teste@teste.com\'','\'123pass\'','\'teste\'');