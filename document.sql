-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: datapan
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `accounts_agree`
--

DROP TABLE IF EXISTS `accounts_agree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_agree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(500) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `applicant` varchar(200) DEFAULT NULL,
  `date_created` datetime(6),
  PRIMARY KEY (`id`),
  KEY `accounts_agree_group_id_5f077588_fk_accounts_group_id` (`group_id`),
  CONSTRAINT `accounts_agree_group_id_5f077588_fk_accounts_group_id` FOREIGN KEY (`group_id`) REFERENCES `accounts_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_agree`
--

LOCK TABLES `accounts_agree` WRITE;
/*!40000 ALTER TABLE `accounts_agree` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_agree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_document`
--

DROP TABLE IF EXISTS `accounts_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docname` varchar(200) DEFAULT NULL,
  `doc` varchar(100) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `use_id` int(11) NOT NULL,
  `date_created` datetime(6),
  `group_id` int(11) DEFAULT NULL,
  `errormsg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_document_use_id_9ddff1e9_fk_accounts_user_id` (`use_id`),
  KEY `accounts_document_group_id_82cc2f49_fk_accounts_group_id` (`group_id`),
  CONSTRAINT `accounts_document_group_id_82cc2f49_fk_accounts_group_id` FOREIGN KEY (`group_id`) REFERENCES `accounts_group` (`id`),
  CONSTRAINT `accounts_document_use_id_9ddff1e9_fk_accounts_user_id` FOREIGN KEY (`use_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_document`
--

LOCK TABLES `accounts_document` WRITE;
/*!40000 ALTER TABLE `accounts_document` DISABLE KEYS */;
INSERT INTO `accounts_document` VALUES (1,'JinText','小型文件管理系统.docx','Error',3,'2020-03-23 12:23:42.731835',1,'该文件不符合规则'),(2,'JinText2','Spark作业.docx','Delivered',3,'2020-03-23 12:24:01.953744',2,NULL),(23,'Jhontest','java_web_NnqVP7i.txt','Pending',2,'2020-03-31 12:41:44.299519',3,''),(30,'test','ENGLISH_MinXhQs.txt','Pending',11,'2020-05-12 01:52:19.353052',1,NULL);
/*!40000 ALTER TABLE `accounts_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_group`
--

DROP TABLE IF EXISTS `accounts_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(500) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_group_name_5311469e_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_group`
--

LOCK TABLES `accounts_group` WRITE;
/*!40000 ALTER TABLE `accounts_group` DISABLE KEYS */;
INSERT INTO `accounts_group` VALUES (1,'测试组1','2020-03-18 04:09:51.955348','Test-1'),(2,'测试组2-test','2020-03-18 04:10:13.490576','Test-2-test'),(3,'测试组3','2020-03-18 04:10:28.829927','Test-3'),(32,'测试组','2020-05-12 02:01:44.061551','测试组12');
/*!40000 ALTER TABLE `accounts_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `authority` varchar(10) NOT NULL,
  `date_created` datetime(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'superuser','123','123@admin.com','1','2020-03-17 14:36:49.619368'),(2,'Jhon','456','Jhon@gmail.com','3','2020-03-17 14:36:49.619368'),(3,'Jin','456','Jin@gamil.com','3','2020-03-17 14:36:49.619368'),(5,'Shaun','789','Shaun@gmail.com','2','2020-03-17 14:36:49.619368'),(6,'Krol','789','Krol@gmail.com','2','2020-03-17 14:36:49.619368'),(11,'Pann','456','Pann@gmail.com','3','2020-05-12 01:50:09.287225'),(12,'test','456','test@gamil.com','3','2020-05-12 01:56:12.497102');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_group`
--

DROP TABLE IF EXISTS `accounts_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_group_user_id_group_id_8f823393_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_group_group_id_6b5ea533_fk_accounts_group_id` (`group_id`),
  CONSTRAINT `accounts_user_group_group_id_6b5ea533_fk_accounts_group_id` FOREIGN KEY (`group_id`) REFERENCES `accounts_group` (`id`),
  CONSTRAINT `accounts_user_group_user_id_5e08a261_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_group`
--

LOCK TABLES `accounts_user_group` WRITE;
/*!40000 ALTER TABLE `accounts_user_group` DISABLE KEYS */;
INSERT INTO `accounts_user_group` VALUES (4,2,2),(5,2,3),(2,3,1),(3,3,2),(7,5,2),(28,5,3),(43,5,32),(6,6,1),(41,11,1),(42,12,2);
/*!40000 ALTER TABLE `accounts_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add agree',9,'add_agree'),(34,'Can change agree',9,'change_agree'),(35,'Can delete agree',9,'delete_agree'),(36,'Can view agree',9,'view_agree'),(37,'Can add document',10,'add_document'),(38,'Can change document',10,'change_document'),(39,'Can delete document',10,'delete_document'),(40,'Can view document',10,'view_document');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$c7l4Ck6jHJUx$NpWARIwwi3JdIJCTsUmkbrddhBJ2wKzaVLRqwZSWTAg=','2020-05-10 02:40:20.472423',1,'lenovo3','','','pan36278@gmail.com',1,1,'2020-03-16 09:09:55.424729');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-17 14:02:28.136468','1','User object (1)',1,'[{\"added\": {}}]',7,1),(2,'2020-03-17 14:03:28.486196','2','Jhon',1,'[{\"added\": {}}]',7,1),(3,'2020-03-17 14:03:54.633225','3','Jin',1,'[{\"added\": {}}]',7,1),(4,'2020-03-17 14:04:41.388799','4','Charlie',1,'[{\"added\": {}}]',7,1),(5,'2020-03-17 14:05:09.697653','5','Shaun',1,'[{\"added\": {}}]',7,1),(6,'2020-03-17 14:05:33.911235','6','Krol',1,'[{\"added\": {}}]',7,1),(7,'2020-03-18 04:09:51.955348','1','Group object (1)',1,'[{\"added\": {}}]',8,1),(8,'2020-03-18 04:10:13.491612','2','Group object (2)',1,'[{\"added\": {}}]',8,1),(9,'2020-03-18 04:10:28.830889','3','Group object (3)',1,'[{\"added\": {}}]',8,1),(10,'2020-03-18 04:11:48.093704','4','Charlie',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(11,'2020-03-18 04:11:57.406700','3','Jin',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(12,'2020-03-18 04:12:04.435949','2','Jhon',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(13,'2020-03-18 04:12:09.970976','6','Krol',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(14,'2020-03-18 04:12:14.408682','5','Shaun',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(15,'2020-03-18 12:38:57.798254','7','Park',3,'',7,1),(16,'2020-03-19 05:55:25.644287','10','Text-10',3,'',8,1),(17,'2020-03-19 05:55:29.763704','9','Test-8',3,'',8,1),(18,'2020-03-19 05:55:32.799697','7','Text-6',3,'',8,1),(19,'2020-03-19 05:56:20.887054','13','Test-13',3,'',8,1),(20,'2020-03-19 06:08:39.021513','16','Text-15',3,'',8,1),(21,'2020-03-19 06:08:42.831337','15','Text-15',3,'',8,1),(22,'2020-03-19 14:18:16.467453','5','Shaun',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(23,'2020-03-19 14:18:38.121608','20','Test-14',3,'',8,1),(24,'2020-03-19 14:18:41.488129','19','Test-14',3,'',8,1),(25,'2020-03-19 14:18:44.755933','18','Test-14',3,'',8,1),(26,'2020-03-19 14:18:47.831376','17','Test-14',3,'',8,1),(27,'2020-03-19 14:18:50.385482','14','Test-13',3,'',8,1),(28,'2020-03-19 14:18:52.706814','12','Test-12',3,'',8,1),(29,'2020-03-19 14:18:55.223454','11','Test-11',3,'',8,1),(30,'2020-03-19 14:18:59.525511','5','Test-4',3,'',8,1),(31,'2020-03-19 14:19:03.019179','21','Test-12',3,'',8,1),(32,'2020-03-19 15:32:46.622257','2','Jhon',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(33,'2020-03-19 15:34:27.962328','2','Jhon',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(34,'2020-03-23 12:23:42.735863','1','Document object (1)',1,'[{\"added\": {}}]',10,1),(35,'2020-03-23 12:24:01.955760','2','Document object (2)',1,'[{\"added\": {}}]',10,1),(36,'2020-03-26 13:28:26.345277','2','Document object (2)',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',10,1),(37,'2020-03-26 13:28:31.474984','1','Document object (1)',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',10,1),(38,'2020-03-26 14:49:29.295385','4','Document object (4)',3,'',10,1),(39,'2020-03-26 14:54:01.600394','3','Document object (3)',3,'',10,1),(40,'2020-03-26 15:25:36.168947','5','Document object (5)',3,'',10,1),(41,'2020-03-26 15:28:20.167457','6','Document object (6)',3,'',10,1),(42,'2020-03-26 15:35:56.014871','8','Document object (8)',3,'',10,1),(43,'2020-03-26 15:36:00.121889','7','Document object (7)',3,'',10,1),(44,'2020-03-26 15:59:15.263326','9','Document object (9)',3,'',10,1),(45,'2020-03-26 16:07:58.850294','11','Document object (11)',3,'',10,1),(46,'2020-03-26 16:08:01.821349','10','Document object (10)',3,'',10,1),(47,'2020-03-26 16:18:43.877534','12','Document object (12)',3,'',10,1),(48,'2020-03-28 05:54:32.217224','3','Jin',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(49,'2020-03-28 06:06:37.878016','3','Jin',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(50,'2020-03-31 12:41:44.304505','23','Document object (23)',1,'[{\"added\": {}}]',10,1),(51,'2020-03-31 12:42:13.839471','5','Shaun',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(52,'2020-03-31 12:51:14.872281','5','Shaun',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(53,'2020-03-31 13:48:12.331363','24','Document object (24)',3,'',10,1),(54,'2020-03-31 13:48:15.695369','25','Document object (25)',3,'',10,1),(55,'2020-03-31 14:10:27.159958','26','Document object (26)',3,'',10,1),(56,'2020-03-31 14:41:29.948896','27','Document object (27)',3,'',10,1),(57,'2020-03-31 15:42:10.989077','2','Test-2',2,'[{\"changed\": {\"fields\": [\"note\"]}}]',8,1),(58,'2020-03-31 15:42:48.106464','2','Test-2',2,'[{\"changed\": {\"fields\": [\"note\"]}}]',8,1),(59,'2020-04-02 03:56:09.827091','1','Document object (1)',2,'[{\"changed\": {\"fields\": [\"errormsg\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','agree'),(10,'accounts','document'),(8,'accounts','group'),(7,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-16 09:08:46.412796'),(2,'auth','0001_initial','2020-03-16 09:08:47.192713'),(3,'admin','0001_initial','2020-03-16 09:08:47.385195'),(4,'admin','0002_logentry_remove_auto_add','2020-03-16 09:08:47.396205'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-16 09:08:47.424135'),(6,'contenttypes','0002_remove_content_type_name','2020-03-16 09:08:47.546763'),(7,'auth','0002_alter_permission_name_max_length','2020-03-16 09:08:47.618571'),(8,'auth','0003_alter_user_email_max_length','2020-03-16 09:08:47.695409'),(9,'auth','0004_alter_user_username_opts','2020-03-16 09:08:47.709363'),(10,'auth','0005_alter_user_last_login_null','2020-03-16 09:08:47.775191'),(11,'auth','0006_require_contenttypes_0002','2020-03-16 09:08:47.791152'),(12,'auth','0007_alter_validators_add_error_messages','2020-03-16 09:08:47.801085'),(13,'auth','0008_alter_user_username_max_length','2020-03-16 09:08:47.878877'),(14,'auth','0009_alter_user_last_name_max_length','2020-03-16 09:08:47.953677'),(15,'sessions','0001_initial','2020-03-16 09:08:47.999595'),(16,'accounts','0001_initial','2020-03-17 13:58:49.609394'),(17,'accounts','0002_user_date_created','2020-03-17 14:36:49.659247'),(18,'accounts','0003_group','2020-03-17 15:33:15.529613'),(19,'accounts','0004_auto_20200318_1207','2020-03-18 04:08:11.843240'),(20,'accounts','0005_agree','2020-03-19 13:30:37.308503'),(21,'accounts','0006_agree_applicant','2020-03-19 13:35:20.711883'),(22,'accounts','0007_document','2020-03-19 13:43:17.791582'),(23,'accounts','0008_auto_20200319_2147','2020-03-19 13:47:40.510599'),(24,'accounts','0009_auto_20200319_2221','2020-03-19 14:21:28.053960'),(25,'accounts','0010_document_group','2020-03-26 13:27:34.019774'),(26,'accounts','0011_auto_20200327_0006','2020-03-26 16:06:48.733791'),(27,'accounts','0012_auto_20200327_0008','2020-03-26 16:08:27.440842'),(28,'accounts','0013_document_errormsg','2020-04-02 03:54:18.313972'),(29,'accounts','0014_auto_20200402_1727','2020-04-02 09:27:58.724250');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0alb195jv8n1bqqlpe649hhcfv3mue9g','Mzc1YTE5N2RhNTM3MzQyNDc5MzI3MGI4YWFlZDk2YzhkMmEzZDM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MzM1ZWFlNDVlNzUyMTA1MzFmMmEzMGZhZWYzMjUxMjNkZmI5NWQzIiwiaXNfbG9naW4iOnRydWUsIm5hbWUiOiJKaW4ifQ==','2020-04-06 12:24:36.472785'),('2tfwo5k56c4zd95ggec4ynj1l42y3dlr','OGIwN2JhNDllYmIyMDdmMzk0ZmFiY2JkZGM4ZjlhMTA2ZjRiZDUwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MzM1ZWFlNDVlNzUyMTA1MzFmMmEzMGZhZWYzMjUxMjNkZmI5NWQzIn0=','2020-04-01 09:56:19.010128'),('c4hbd4zip196ueh0dh82cy73ubomtclc','OGIwN2JhNDllYmIyMDdmMzk0ZmFiY2JkZGM4ZjlhMTA2ZjRiZDUwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MzM1ZWFlNDVlNzUyMTA1MzFmMmEzMGZhZWYzMjUxMjNkZmI5NWQzIn0=','2020-03-30 09:11:35.538447'),('lcao2g572rzwyabad7d3z51jkm7y4mo9','YTkwZGRhODkzZDhhZTg0MGI2MTQ0NzIyNTlmZjdhMzRmYjBjNWI2Mzp7ImlzX2xvZ2luIjp0cnVlLCJuYW1lIjoiU2hhdW4iLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODMzNWVhZTQ1ZTc1MjEwNTMxZjJhMzBmYWVmMzI1MTIzZGZiOTVkMyJ9','2020-04-02 03:04:29.961342'),('p157p70icv7qi2pexnytkcvhmn9c4k3z','NzE4ODQ5ZjgwNzZkN2NjZTU0NmM1NjQwYTZkMGI3ODQwMzMwYzQzNTp7ImlzX2xvZ2luIjp0cnVlLCJuYW1lIjoiSmluIiwiaWQiOjMsImF1dGhvcml0eSI6IjMifQ==','2020-05-04 13:52:27.493187'),('r7y1jwdm55sfaxcmm7to0k3lpygzreli','OGIwN2JhNDllYmIyMDdmMzk0ZmFiY2JkZGM4ZjlhMTA2ZjRiZDUwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MzM1ZWFlNDVlNzUyMTA1MzFmMmEzMGZhZWYzMjUxMjNkZmI5NWQzIn0=','2020-03-31 13:59:34.259803'),('x0krcmuhww9ubnwztci42d3f221cdnta','NzAwOWY3MmZmMTI4MjI3YjdhOTY0MGIwNzUyNGMzODgzZTE5OGY1Yjp7ImlzX2xvZ2luIjp0cnVlLCJuYW1lIjoiSmluIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjgzMzVlYWU0NWU3NTIxMDUzMWYyYTMwZmFlZjMyNTEyM2RmYjk1ZDMifQ==','2020-04-06 13:12:55.812859'),('yxmoe0pbr55s9jvga8yicyfrbxx89hz0','MmFlNWQ3ODMxYmQzY2JjMjU5OTY0OWY5ZjExNGMwOWQ4MTRmZGE2Njp7ImlzX2xvZ2luIjp0cnVlLCJuYW1lIjoiU2hhdW4ifQ==','2020-04-01 14:18:36.048093');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-12 10:35:36
