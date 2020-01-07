-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: drf_shop
-- ------------------------------------------------------
-- Server version	5.7.26

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

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 首页轮播的商品',6,'add_banner'),(22,'Can change 首页轮播的商品',6,'change_banner'),(23,'Can delete 首页轮播的商品',6,'delete_banner'),(24,'Can add 商品',7,'add_goods'),(25,'Can change 商品',7,'change_goods'),(26,'Can delete 商品',7,'delete_goods'),(27,'Can add 商品分类',8,'add_goodscategory'),(28,'Can change 商品分类',8,'change_goodscategory'),(29,'Can delete 商品分类',8,'delete_goodscategory'),(30,'Can add 某一大类下的宣传商标',9,'add_goodscategorybrand'),(31,'Can change 某一大类下的宣传商标',9,'change_goodscategorybrand'),(32,'Can delete 某一大类下的宣传商标',9,'delete_goodscategorybrand'),(33,'Can add 商品轮播图',10,'add_goodsimage'),(34,'Can change 商品轮播图',10,'change_goodsimage'),(35,'Can delete 商品轮播图',10,'delete_goodsimage'),(36,'Can add 搜索栏下方热搜词',11,'add_hotsearchwords'),(37,'Can change 搜索栏下方热搜词',11,'change_hotsearchwords'),(38,'Can delete 搜索栏下方热搜词',11,'delete_hotsearchwords'),(39,'Can add 首页商品类别广告',12,'add_indexadgoods'),(40,'Can change 首页商品类别广告',12,'change_indexadgoods'),(41,'Can delete 首页商品类别广告',12,'delete_indexadgoods'),(42,'Can view 首页轮播的商品',6,'view_banner'),(43,'Can view 商品',7,'view_goods'),(44,'Can view 商品分类',8,'view_goodscategory'),(45,'Can view 某一大类下的宣传商标',9,'view_goodscategorybrand'),(46,'Can view 商品轮播图',10,'view_goodsimage'),(47,'Can view 搜索栏下方热搜词',11,'view_hotsearchwords'),(48,'Can view 首页商品类别广告',12,'view_indexadgoods'),(49,'Can add 订单内的商品详情',13,'add_ordergoods'),(50,'Can change 订单内的商品详情',13,'change_ordergoods'),(51,'Can delete 订单内的商品详情',13,'delete_ordergoods'),(52,'Can add 订单信息',14,'add_orderinfo'),(53,'Can change 订单信息',14,'change_orderinfo'),(54,'Can delete 订单信息',14,'delete_orderinfo'),(55,'Can add 购物车',15,'add_shoppingcart'),(56,'Can change 购物车',15,'change_shoppingcart'),(57,'Can delete 购物车',15,'delete_shoppingcart'),(58,'Can view 订单内的商品详情',13,'view_ordergoods'),(59,'Can view 订单信息',14,'view_orderinfo'),(60,'Can view 购物车',15,'view_shoppingcart'),(61,'Can add 用户信息',16,'add_user'),(62,'Can change 用户信息',16,'change_user'),(63,'Can delete 用户信息',16,'delete_user'),(64,'Can add 验证码',17,'add_verifycode'),(65,'Can change 验证码',17,'change_verifycode'),(66,'Can delete 验证码',17,'delete_verifycode'),(67,'Can view 用户信息',16,'view_user'),(68,'Can view 验证码',17,'view_verifycode'),(69,'Can add 用户收货地址',18,'add_useraddress'),(70,'Can change 用户收货地址',18,'change_useraddress'),(71,'Can delete 用户收货地址',18,'delete_useraddress'),(72,'Can add 用户收藏操作',19,'add_userfav'),(73,'Can change 用户收藏操作',19,'change_userfav'),(74,'Can delete 用户收藏操作',19,'delete_userfav'),(75,'Can add 用户留言',20,'add_userleavingmessage'),(76,'Can change 用户留言',20,'change_userleavingmessage'),(77,'Can delete 用户留言',20,'delete_userleavingmessage'),(78,'Can view 用户收货地址',18,'view_useraddress'),(79,'Can view 用户收藏操作',19,'view_userfav'),(80,'Can view 用户留言',20,'view_userleavingmessage'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add Token',25,'add_token'),(98,'Can change Token',25,'change_token'),(99,'Can delete Token',25,'delete_token'),(100,'Can view Token',25,'view_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `banner_goods_id_c9855df5_fk_goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `banner_goods_id_c9855df5_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-01-07 11:10:55.666803','16','714141681@qq.com',3,'',16,5),(2,'2020-01-07 11:10:55.697784','11','271927345@qq.com',3,'',16,5),(3,'2020-01-07 11:10:55.718772','8','599024399@qq.com',3,'',16,5),(4,'2020-01-07 11:10:55.810719','7','347227584@qq.com',3,'',16,5),(5,'2020-01-07 11:10:55.831706','6','1140786690@qq.com',3,'',16,5),(6,'2020-01-07 11:10:55.844700','1','cix',3,'',16,5),(7,'2020-01-07 11:11:06.819415','16','714141681@qq.com',3,'',16,5),(8,'2020-01-07 11:11:14.800857','11','271927345@qq.com',3,'',16,5),(9,'2020-01-07 11:11:14.820833','8','599024399@qq.com',3,'',16,5),(10,'2020-01-07 11:11:14.840822','7','347227584@qq.com',3,'',16,5),(11,'2020-01-07 11:11:14.862809','6','1140786690@qq.com',3,'',16,5),(12,'2020-01-07 11:11:14.883806','1','cix',3,'',16,5),(13,'2020-01-07 11:11:23.180046','11','271927345@qq.com',3,'',16,5),(14,'2020-01-07 11:11:23.218034','8','599024399@qq.com',3,'',16,5),(15,'2020-01-07 11:11:23.238012','7','347227584@qq.com',3,'',16,5),(16,'2020-01-07 11:11:23.258000','6','1140786690@qq.com',3,'',16,5),(17,'2020-01-07 11:11:23.270996','1','cix',3,'',16,5),(18,'2020-01-07 11:11:27.291692','11','271927345@qq.com',3,'',16,5),(19,'2020-01-07 11:11:27.312678','8','599024399@qq.com',3,'',16,5),(20,'2020-01-07 11:11:27.335681','7','347227584@qq.com',3,'',16,5),(21,'2020-01-07 11:11:27.357653','6','1140786690@qq.com',3,'',16,5),(22,'2020-01-07 11:11:27.379641','1','cix',3,'',16,5),(23,'2020-01-07 11:11:35.563953','11','271927345@qq.com',3,'',16,5),(24,'2020-01-07 11:11:44.782675','8','599024399@qq.com',3,'',16,5),(25,'2020-01-07 11:11:44.806672','7','347227584@qq.com',3,'',16,5),(26,'2020-01-07 11:11:52.472271','6','1140786690@qq.com',3,'',16,5),(27,'2020-01-07 11:11:52.497256','1','cix',3,'',16,5),(28,'2020-01-07 11:11:58.719693','6','1140786690@qq.com',3,'',16,5),(29,'2020-01-07 11:11:58.751673','1','cix',3,'',16,5),(30,'2020-01-07 11:12:02.222687','6','1140786690@qq.com',3,'',16,5),(31,'2020-01-07 11:12:07.272794','1','cix',3,'',16,5),(32,'2020-01-07 11:12:11.272505','1','cix',3,'',16,5),(34,'2020-01-07 11:19:24.832226','3','UserAddress object (3)',3,'',18,5),(35,'2020-01-07 11:19:24.865197','2','UserAddress object (2)',3,'',18,5),(36,'2020-01-07 11:19:24.878189','1','UserAddress object (1)',3,'',18,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'authtoken','token'),(4,'contenttypes','contenttype'),(6,'goods','banner'),(7,'goods','goods'),(8,'goods','goodscategory'),(9,'goods','goodscategorybrand'),(10,'goods','goodsimage'),(11,'goods','hotsearchwords'),(12,'goods','indexadgoods'),(5,'sessions','session'),(13,'trade','ordergoods'),(14,'trade','orderinfo'),(15,'trade','shoppingcart'),(16,'user','user'),(17,'user','verifycode'),(18,'user_operation','useraddress'),(19,'user_operation','userfav'),(20,'user_operation','userleavingmessage'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-19 10:34:01.321608'),(2,'contenttypes','0002_remove_content_type_name','2019-10-19 10:34:01.379463'),(3,'auth','0001_initial','2019-10-19 10:34:01.564936'),(4,'auth','0002_alter_permission_name_max_length','2019-10-19 10:34:01.600009'),(5,'auth','0003_alter_user_email_max_length','2019-10-19 10:34:01.610117'),(6,'auth','0004_alter_user_username_opts','2019-10-19 10:34:01.619178'),(7,'auth','0005_alter_user_last_login_null','2019-10-19 10:34:01.635131'),(8,'auth','0006_require_contenttypes_0002','2019-10-19 10:34:01.643142'),(9,'auth','0007_alter_validators_add_error_messages','2019-10-19 10:34:01.655400'),(10,'auth','0008_alter_user_username_max_length','2019-10-19 10:34:01.668313'),(11,'auth','0009_alter_user_last_name_max_length','2019-10-19 10:34:01.680454'),(12,'user','0001_initial','2019-10-19 10:34:01.921096'),(13,'admin','0001_initial','2019-10-19 10:34:02.007905'),(14,'admin','0002_logentry_remove_auto_add','2019-10-19 10:34:02.021637'),(15,'authtoken','0001_initial','2019-10-19 10:34:02.079542'),(16,'authtoken','0002_auto_20160226_1747','2019-10-19 10:34:02.160950'),(17,'goods','0001_initial','2019-10-19 10:34:02.564381'),(18,'sessions','0001_initial','2019-10-19 10:34:02.605672'),(19,'trade','0001_initial','2019-10-19 10:34:02.708663'),(20,'trade','0002_auto_20191018_2114','2019-10-19 10:34:02.975778'),(21,'user','0002_auto_20191018_2116','2019-10-19 10:34:02.998437'),(22,'user','0003_auto_20191019_1030','2019-10-19 10:34:03.039908'),(23,'user_operation','0001_initial','2019-10-19 10:34:03.335726'),(24,'xadmin','0001_initial','2019-10-19 10:34:03.568240'),(25,'xadmin','0002_log','2019-10-19 10:34:03.672638'),(26,'xadmin','0003_auto_20160715_0100','2019-10-19 10:34:03.725887'),(27,'user','0004_auto_20191019_1204','2019-10-19 12:04:59.779890'),(28,'user','0002_auto_20191021_0908','2019-10-21 09:08:31.786760'),(29,'user','0003_auto_20191021_0921','2019-10-21 09:21:19.902090'),(30,'user','0004_auto_20191021_0929','2019-10-21 09:29:25.417902'),(31,'user','0005_auto_20191021_0933','2019-10-21 09:33:43.994311'),(32,'user','0006_auto_20191021_1002','2019-10-21 10:02:42.086789'),(33,'user','0007_auto_20191021_1007','2019-10-21 10:07:24.470359'),(34,'user','0008_auto_20191021_1018','2019-10-21 10:18:42.954899'),(35,'trade','0003_auto_20191021_2026','2019-10-21 20:27:02.479257'),(36,'trade','0004_auto_20191021_2031','2019-10-21 20:31:25.731440'),(37,'trade','0005_auto_20191021_2258','2019-10-21 22:58:37.550500'),(38,'user','0009_auto_20191021_2258','2019-10-21 22:58:37.576966'),(39,'trade','0006_auto_20191022_0757','2019-10-22 07:58:01.248282'),(40,'user','0010_auto_20191022_0757','2019-10-22 07:58:01.286217'),(41,'trade','0007_auto_20191022_0804','2019-10-22 08:04:46.320910'),(42,'user','0011_auto_20191022_0804','2019-10-22 08:04:46.354596'),(43,'user_operation','0002_remove_userleavingmessage_file','2019-10-22 10:41:38.541461'),(44,'trade','0008_auto_20191022_1845','2019-10-22 18:45:42.151294'),(45,'user','0012_auto_20191022_1845','2019-10-22 18:45:42.178287');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8sqiyv2kprnzk9fxc89st2s5lgo0f62t','ZDdiZTAxZTJiNjIwOTIzMDQwZjMxNDhkOTBiOWI0MDdiZmJlMDhmNzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFiMjI2NGM0NmVhMGY5MGUzOWFkMzJiYzRhMTE5NDc5NTllZmY2MCIsInNpbXBsZXVpXzIwMjAwMTA3Ijp0cnVlfQ==','2020-01-21 11:09:20.395369'),('bdxvbn16ay471xir85w55amohpzefbfs','Y2Q3NDAxY2IwNThiZDJhMWE1MDZlZjFjOGRhY2M2NjdlMWNjNDhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIkxJU1RfUVVFUlkiOltbInVzZXJfb3BlcmF0aW9uIiwidXNlcmxlYXZpbmdtZXNzYWdlIl0sIiJdLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcCI6bnVsbCwic3RlcF9kYXRhIjp7fSwic3RlcF9maWxlcyI6e30sImV4dHJhX2RhdGEiOnt9fX0=','2019-11-05 11:01:36.616694'),('dunik4vi2b65a659c2ogdtiwwkuyswjc','ZTc4MDA4NmRiYjBkMzBmNmJhZTRhZDM0MWQ5ODMzNTk3MjZkZWJjNDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU4MjgyMGM5MmFiNTM4Y2Q1MmUyZWIxNzBiN2ZlYWRjMzM1OWQ5MSIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbInhhZG1pbiIsImxvZyJdLCJwPTMiXX0=','2019-11-11 09:53:28.738039'),('gj8nz6jsfrlavlubay2o4a4blh83rk31','OGZkMzkxMTllOGM3ZGU1ODk3ZDEyZTBlMWIzODQ3YTI1YzJjMjhjMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-08 14:35:34.987668'),('hwxdhf70q40pyo8g8qnbsr8lb6h11pph','Zjg5NjFjOTUxMDJiNTFlMTViYzM2ZjFkNjY4NWM5NDU1ZGY4MGI3OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbInVzZXIiLCJ1c2VyIl0sIiJdfQ==','2019-11-16 10:46:50.474322'),('jd1d91dmzkfu2cg62cclg9ccv4lua9gl','ZjNmYTc5MzNjOWFkZTZlMmU0ZTA3OWQzMzA0ZDIwNTM2OGRiZjFiMjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU4MjgyMGM5MmFiNTM4Y2Q1MmUyZWIxNzBiN2ZlYWRjMzM1OWQ5MSIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSJ9','2019-11-06 09:07:14.802043'),('kvmcjlm98ogpce4us3zsau3igqpkaoaw','OGZkMzkxMTllOGM3ZGU1ODk3ZDEyZTBlMWIzODQ3YTI1YzJjMjhjMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-08 22:28:10.505739'),('pihqcc6vdjcy568epdsgtcat4atumlfc','ZGU1ZWU0NTBmZDVjNDBhMjkyNDZjNzk3N2U2ZmRlNTUyNjY4ZTE4OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzY2MWRlZWM5MGJlZTQ4NGQyMjVjYTBkNDllMmI4OTBjMWJlNDcxNSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-03 11:40:32.736797'),('r9bg22oynac1r35zvt3lix59cbu33eww','YTEyYTdhNzU5YjBhZmY5N2UwODRmNmI5NzE4ZjUxM2RjYTVhMzZlODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU4MjgyMGM5MmFiNTM4Y2Q1MmUyZWIxNzBiN2ZlYWRjMzM1OWQ5MSIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbInVzZXJfb3BlcmF0aW9uIiwidXNlcmZhdiJdLCIiXX0=','2019-11-06 09:45:38.304953'),('rex3avlepmacxp2gzosf897tvvqmttp2','OGZkMzkxMTllOGM3ZGU1ODk3ZDEyZTBlMWIzODQ3YTI1YzJjMjhjMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-06 13:59:41.608216'),('tb05w1uh8r6vkebea7a4chvai2fox79m','OGJiMjFkNjUyNzM0NjA5NjFlZTliMDIwZmY4NTk0MzA0NjgxNjU4ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZkZWVhNDZjODAwOThlYjE0ZTU2ZDcyMjkzOTYzY2U5ZjBiNjFmNyIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-03 19:10:18.422525'),('xbrnu6kkpsrunb4ebo71gk9oadcn4ny6','YThhZDFiNDEyZjNkZTE2MjliMDVmOTAwZGVmNzMwNzI3NTI2YTRkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMjFiMjRiMWRmMDJmNzAwN2FkZGVlN2QzYTQ3NWM1MGU1NTU5NDhjIiwic2ltcGxldWlfMjAyMDAxMDMiOnRydWV9','2020-01-17 21:21:40.038944'),('yhfbcyodtjhg1iz4a9xo5sycynp0q8wi','ZjJiODUzNmRmMjdjOGNlM2Y1NzcwMzEyMDc4Y2RmNmE5ZjQ4M2UzMjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjU4MjgyMGM5MmFiNTM4Y2Q1MmUyZWIxNzBiN2ZlYWRjMzM1OWQ5MSIsIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU1MjA2XHU3YzdiXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9nb29kcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU2N2QwXHU0ZTAwXHU1OTI3XHU3YzdiXHU0ZTBiXHU3Njg0XHU1YmEzXHU0ZjIwXHU1NTQ2XHU2ODA3XCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnlicmFuZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogN30sIHtcInRpdGxlXCI6IFwiXHU1NTQ2XHU1NGMxXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzaW1hZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1OGY2ZVx1NjRhZFx1NzY4NFx1NTU0Nlx1NTRjMVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1NjQxY1x1N2QyMlx1NjgwZlx1NGUwYlx1NjViOVx1NzBlZFx1NjQxY1x1OGJjZFwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9ob3RzZWFyY2h3b3Jkcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OTk5Nlx1OTg3NVx1NTU0Nlx1NTRjMVx1N2M3Ylx1NTIyYlx1NWU3Zlx1NTQ0YVwiLCBcInVybFwiOiBcIi9hZG1pbi9nb29kcy9pbmRleGFkZ29vZHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2dvb2RzL2dvb2RzY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlx1NjRjZFx1NGY1Y1wiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyX29wZXJhdGlvbi91c2VyZmF2L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJhZGRyZXNzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3NTU5XHU4YTAwXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJfb3BlcmF0aW9uL3VzZXJsZWF2aW5nbWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlcl9vcGVyYXRpb24vdXNlcmZhdi9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXIvdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2VyL3ZlcmlmeWNvZGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vdXNlci91c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJhMlx1NTM1NVx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdThkMmRcdTcyNjlcdThmNjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdHJhZGUvc2hvcHBpbmdjYXJ0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM31dLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi90cmFkZS9vcmRlcmluZm8vXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9XSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19','2019-11-08 22:29:37.661312');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_category_id_565f1bd9_fk_goods_category_id` (`category_id`) USING BTREE,
  CONSTRAINT `goods_category_id_565f1bd9_fk_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'s','新鲜水果甜蜜香脆单果约800克',125,0,1,100,232,156,'食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',0,'goods/images/1_P_1449024889889.jpg',0,0,'2019-10-19 18:07:52.035874',73),(2,'s','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',116,2,2,100,106,88,'前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',0,'goods/images/2_P_1448945810202.jpg',0,0,'2019-10-19 18:07:52.082080',7),(3,'c','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐',119,18,2,100,286,238,'c','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',0,'goods/images/7_P_1448945104883.jpg',0,0,'2019-10-19 18:07:52.106058',15),(4,'s','日本蒜蓉粉丝扇贝270克6只装',29,2,0,100,156,108,'s','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',0,'goods/images/47_P_1448946213263.jpg',0,0,'2019-10-19 18:07:52.134209',20),(5,'','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材',2,0,0,100,106,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/10_P_1448944572085.jpg',0,0,'2019-10-19 18:07:52.160542',7),(6,'','乌拉圭进口牛肉卷特级肥牛卷',8,0,0,100,90,75,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/4_P_1448945381985.jpg',0,0,'2019-10-19 18:07:52.187461',21),(7,'','五星眼肉牛排套餐8片装原味原切生鲜牛肉',8,0,0,100,150,125,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/8_P_1448945032810.jpg',0,0,'2019-10-19 18:07:52.217128',23),(8,'','澳洲进口120天谷饲牛仔骨4份原味生鲜',7,0,0,100,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/11_P_1448944388277.jpg',0,0,'2019-10-19 18:07:52.240301',7),(9,'','潮香村澳洲进口牛排家庭团购套餐20片',7,0,0,100,239,199,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/6_P_1448945167279.jpg',0,0,'2019-10-19 18:07:52.272479',22),(10,'','爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g',2,0,0,100,202,168,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/9_P_1448944791617.jpg',0,0,'2019-10-19 18:07:52.298848',20),(11,'','澳洲进口牛尾巴300g新鲜肥牛肉',3,0,-1,101,306,255,'新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/3_P_1448945490837.jpg',0,0,'2019-10-19 18:07:52.333636',2),(12,'2334234','智力卡优奇酸奶果粒麦脆316g',233,6,1,100,126,88,'免煮学生营养早餐即食干吃燕麦代餐','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/3cd5916e77cf50fd.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/296d50cdbe94d0f8.jpg\"/></p><p><br/></p>',1,'goods/images/ee377cb5ed8d5259.jpg',1,0,'2019-10-19 18:07:52.357765',102),(13,'','澳洲进口安格斯牛切片上脑牛排1000g',1,0,0,100,144,120,'澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/5_P_1448945270390.jpg',0,0,'2019-10-19 18:07:52.388390',12),(14,'','帐篷出租',0,0,0,100,120,100,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'images/201705/goods_img/53_P_1495068879687.jpg',0,0,'2019-10-19 18:07:52.422322',21),(15,'','52度茅台集团国隆双喜酒500mlx6',15,0,0,100,23,19,'贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/16_P_1448947194687.jpg',0,0,'2019-10-19 18:07:52.438883',37),(16,'','52度水井坊臻酿八號500ml',49,0,0,100,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/14_P_1448947354031.jpg',0,0,'2019-10-19 18:07:52.454652',36),(17,'','53度茅台仁酒500ml',6,0,0,100,190,158,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/12_P_1448947547989.jpg',0,0,'2019-10-19 18:07:52.484037',32),(18,'','双响炮洋酒JimBeamwhiskey美国白占边',5,0,0,100,38,28,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/46_P_1448946598711.jpg',0,0,'2019-10-19 18:07:52.500830',29),(19,'2334234','伊利谷粒多燕麦牛奶饮品200ml*12盒*2提',14,0,0,101,55,46,'早餐营养燕麦片牛奶整箱批发9月新货','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/001e8c1051f5b888.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/7338f9cb188aad84.jpg\"/></p><p><br/></p>',0,'goods/images/518b1a5552dbc529.jpg',0,0,'2019-10-19 18:07:52.524243',102),(20,'','茅台53度飞天茅台500ml',3,0,0,100,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/15_P_1448947257324.jpg',0,0,'2019-10-19 18:07:52.546913',30),(21,'','52度兰陵·紫气东来1600mL山东名酒',0,0,0,100,42,35,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/13_P_1448947460386.jpg',0,0,'2019-10-19 18:07:52.571840',29),(22,'','JohnnieWalker尊尼获加黑牌威士忌',1,0,0,100,24,20,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/50_P_1448946543091.jpg',0,0,'2019-10-19 18:07:52.602957',36),(23,'','人头马CLUB特优香槟干邑350ml',1,0,0,100,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/51_P_1448946466595.jpg',0,0,'2019-10-19 18:07:52.624352',30),(24,'','张裕干红葡萄酒750ml*6支',1,0,0,100,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/17_P_1448947102246.jpg',0,0,'2019-10-19 18:07:52.648814',31),(25,'','原瓶原装进口洋酒烈酒法国云鹿XO白兰地',0,0,0,100,46,38,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/20_P_1448946850602.jpg',0,0,'2019-10-19 18:07:52.664383',29),(26,'','法国原装进口圣贝克干红葡萄酒750ml',0,0,0,100,82,68,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/19_P_1448946951581.jpg',0,0,'2019-10-19 18:07:52.679179',25),(27,'','法国百利威干红葡萄酒AOP级6支装',0,0,0,100,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/18_P_1448947011435.jpg',0,0,'2019-10-19 18:07:52.702227',25),(28,'','芝华士12年苏格兰威士忌700ml',0,0,0,100,71,59,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/22_P_1448946729629.jpg',0,0,'2019-10-19 18:07:52.718758',30),(29,'','深蓝伏特加巴维兰利口酒送预调酒',1,0,0,100,31,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',0,'goods/images/45_P_1448946661303.jpg',0,0,'2019-10-19 18:07:52.734260',36),(30,'s','赣南脐橙特级果10斤装',77,14,0,100,43,36,'s','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',0,'goods/images/32_P_1448948525620.jpg',0,0,'2019-10-19 18:07:52.749763',62),(31,'12312','泰国菠萝蜜16-18斤1个装',12,0,0,100,11,9,'【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/0e7bc5d235544a34.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/6edcab1cd9d3b9b0.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/569ad01f511e1ee7.jpg\"/></p><p><br/></p>',0,'goods/images/30_P_1448948663450.jpg',0,0,'2019-10-19 18:07:52.766953',66),(32,'12312','四川双流草莓新鲜水果礼盒2盒',1,0,0,100,22,18,'四川双流巧克力草莓\r\n新鲜红颜奶油大草梅孕妇水果','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/0de29c16f107dd5e.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/1ce9a54f34a9b04a.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/86ee233b1735a421.jpg\"/> </p><p><br/> </p>',0,'goods/images/31_P_1448948598947.jpg',0,0,'2019-10-19 18:07:52.799930',70),(33,'2334234','山西特产 新鲜紫薯2斤装',23,0,1,100,15,10,'农家自种地瓜番薯 紫心红薯蔬菜粗粮新鲜蔬菜','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/8df490af32803ef2.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/8f5108b2da8c679f.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/88e36941833e3cc9.jpg\"/> </p><p><br/> </p>',0,'goods/images/4d14a9f5f97bac8b.jpg',0,0,'2019-10-19 18:07:52.823546',58),(34,'12312','绿鲜知 菠菜 红根菠菜 赤根菜 约400g',2,0,0,100,6,5,'家常时蔬 优质产地 土壤肥沃 科学种植','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/583a982aN90bbc897.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/583a9827N33863cc3.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/583a9830Nc4e288f6.jpg\"/></p><p><br/></p>',0,'goods/images/58b3c601Na4f13da4.jpg',0,0,'2019-10-19 18:07:52.848105',58),(35,'2334234','海南产精品释迦果',3,0,0,100,70,65,'海南产精品释迦果,\r\n        释迦是水果中的贵族,\r\n        产量少,\r\n        味道很甜,\r\n        奶香十足,\r\n        非常可口,\r\n        果裹果园顺丰空运,\r\n        保证新鲜.果子个大,\r\n        一斤1-2个左右,\r\n        大个头的果子更尽兴!','<p>&nbsp;</p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/2f556a0497775c80.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/717851457ddc4391.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/dde3009ae3f559ee.jpg\"/></p><p><br/></p>',0,'goods/images/cabaab8e8772c2b4.jpg',0,0,'2019-10-19 18:07:52.870004',57),(36,'s','潍坊萝卜5斤/箱礼盒',0,40,0,100,46,38,'正宗山东潍坊水果萝卜潍县萝卜山东特产新鲜蔬菜季节原因较辣不甜','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5bcc7a7b7845742a.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5bebc1b8Nd4200a72.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/d4fc87ed16f9c454.jpg\"/></p><p><br/></p>',0,'goods/images/34_P_1448948399009.jpg',0,0,'2019-10-19 18:07:52.891955',70),(37,'12312','乐事（Lay\'s）薯片135克',10,0,0,100,15,11,'香浓纯正 自然好味 还原土豆片天然滋味','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/61e2d52934decffd.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/b9952fc4a07eb5de.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/dfdf0604de5c1d84.jpg\"/> </p><p><br/> </p>',0,'goods/images/b3ee37f8356b4321.jpg',1,1,'2019-10-19 18:07:52.908942',74),(38,'2334234','灯影牛肉丝100g',1,0,0,100,30,21,'麻辣味休闲零食品牛肉干小吃特产办公室零嘴零食','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/6b525bb99be57426.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5691b11dNee57099f.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/58d267a1Nb7e5c4e7.jpg\"/> </p><p><br/> </p>',0,'goods/images/5aab2bdbN1fad3ffc.jpg',0,0,'2019-10-19 18:07:52.924713',79),(39,'2334234','牛蹄筋零食小吃牛筋 香辣味200g',8,0,0,100,30,23,'锦城记自拌牛板筋牛肉干肉脯四川特产','<p><br/> </p><p><br/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5cdbc10dNc74e8a79.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/af465e5f2602569f.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5cdbc10eNdfc151c6.jpg\"/> </p><p><br/> </p>',0,'goods/images/5cdbc10fN731bb094.jpg',0,0,'2019-10-19 18:07:52.939774',48),(40,'2334234','五香牛肉粒100g/袋',1,0,0,100,20,18,'百草味 肉干肉脯 休闲零食小吃特产熟食肉类牛肉干','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5acacf5cNda1f9eeb.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5acacf5fN5abfcd50.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5bbf279cNc4d6a20f.jpg\"/> </p><p><br/> </p>',0,'goods/images/5bbf27a3N9d56a441.jpg',0,0,'2019-10-19 18:07:52.955366',95),(41,'2334234','烟熏咸腊肉腊肠500g',3,0,0,100,70,58,'湖南特产腊肉 唐人神 熟食腊味 肉干肉脯 农家咸肉','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ab8e03fN7f644a6f.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ab8e045N83521828.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/58a164ccN71a591de.jpg\"/> </p><p><br/> </p>',0,'goods/images/5ab8e030Ndb718fa7.jpg',0,0,'2019-10-19 18:07:52.972494',116),(42,'2334234','福建古田茶树菇  160g',1,0,0,100,38,22,'特产菌菇干货不开伞蘑菇  煲汤材料','<p><br/> </p><p><br/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/57ddfc9aN7c505901.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/57ddfc9fN241f480d.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/57ddfca3N39bcabfd.jpg\"/> </p><p><br/> </p>',0,'goods/images/db636fcfa7819d79.jpg',0,0,'2019-10-19 18:07:52.995750',109),(43,'d','飞鹤飞帆 幼儿配方奶粉 1600g',5,2,0,100,150,123,'精选优质奶源  品质有保证','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5abc753bNeef1cf5a.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5abc753eN0e27e535.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5abc7537Nc74ba36a.jpg\"/> </p><p><br/> </p>',0,'goods/images/5abc7534Nb413023d.jpg',0,1,'2019-10-19 18:07:53.015922',105),(44,'s','蒙牛 纯甄 常温风味酸牛奶 200g*24',0,11,0,100,90,89,'纯正生牛乳  醇香慢发酵','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/8d604121d67387fb.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ce23f47Nb97edf6a.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ce23f4dN06efe10d.jpg\"/></p><p><br/></p>',0,'goods/images/5ce23f4dN06efe10d_MgvU4Gx.jpg',0,0,'2019-10-19 18:07:53.032947',104),(45,'s','伊利 金典纯牛奶250ml*16盒',2,24,0,100,80,70,'源自伊利精选牧场   奶质纯正，口感香醇','<p></p><p></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/2512cd5b017a3e97.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/0bee2588f51c78b2.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/20f42d6f4d41872e.jpg\"/></p><p><br/></p>',0,'goods/images/2512cd5b017a3e97_AEJL99K.jpg',0,1,'2019-10-19 18:07:53.053890',103),(46,'2334234','鱼香肉丝调料  33.5g/袋',3,0,0,100,3,2.5,'吉得利 复合调味料 鱼香肉丝调料 炒菜佐料调味品 33.5g/袋','<p><br/> </p><p><br/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5b73c45eNee7a472c.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5b73c45fN7569322c.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/59ad4551N32a320d6.jpg\"/> </p><p>&nbsp;<br/> </p>',0,'goods/images/5ad07fbbN52a0203f.jpg',0,0,'2019-10-19 18:07:53.069964',51),(47,'2334234','千禾 酱油 1L',0,0,0,100,50,39,'千禾 酱油 零添加御藏本酿380天特级生抽 酿造酱油不使用添加剂 1L','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/39e2e78ca577e403.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/df1bea9cb185477e.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/9dbc0fa547fda835.jpg\"/> </p><p><br/> </p>',0,'goods/images/39e2e78ca577e403_MKQz5UY.jpg',0,0,'2019-10-19 18:07:53.085770',53),(48,'2334234','加碘精制盐 食盐 500g',0,0,0,100,4,3.5,'中盐 盐 加碘精制盐 食盐 500g 中盐出品','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/d0dfcbb8e5222171.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/0a04091d2a2dc44e.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/43ddc41ac319f3ab.jpg\"/> </p><p><br/> </p>',0,'goods/images/cc06b2db39e723db.jpg',0,0,'2019-10-19 18:07:53.102646',56),(49,'2334234','金龙鱼 东北大米5KG',1,0,0,100,40,30,'金龙鱼 东北大米 蟹稻共生 盘锦大米 健康有营养','<p><br/></p><p><br/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ad43db8N92685cad.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5ad43db8N895c0d34.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/1146ef79095cb4bc.jpg\"/> </p><p><br/> </p>',0,'goods/images/5a091d03N54e77227.jpg',0,0,'2019-10-19 18:07:53.119467',49),(50,'342342','山西黑米农家黑米4斤',58,1,0,101,11,9,'十月稻田 黑米（ 杂粮 粗粮 真空装 大米 粥米伴侣）','<p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/1bbcf5158777ed7b.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/3b22867f02f8b1c4.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/9442de6947e715bc.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/微信图片_20191025203430.jpg\"/> </p><p><br/> </p>',0,'goods/images/b300b8d8927d675c.jpg',1,1,'2019-10-19 18:07:53.141905',47),(51,'2334234','稻园牌稻米油粮油米糠油绿色植物油',5,0,0,100,160,149,'纯天然无公害植物油','<p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/25_P_1448947875346.jpg\"/> </p><p><img alt=\"74e65f10450b9bc6.jpg\" src=\"http://118.25.72.193:8996/media/goods/images/74e65f10450b9bc6.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/8b2c2213c5d347f7.jpg\"/> </p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/3428f5af81641917.jpg\"/> </p><p><br/> </p><p><img width=\"1\" height=\"1\" title=\"\" class=\"gkivNy \" style=\"border: 0px rgb(0, 102, 204); border-image: none; width: 1px; height: 1px; text-align: center; color: rgb(0, 102, 204); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; vertical-align: middle; white-space: normal; max-height: 75px; max-width: 121px; orphans: 2; -webkit-text-stroke-width: 0px; background-color: transparent;\" alt=\"\" src=\"https://paimgcdn.baidu.com/69342E77AB998421?src=http%3A%2F%2Fms.bdimg.com%2Fdsp-image%2F2613376303.jpg&rz=urar_2_968_600&v=0\" border=\"0\" vspace=\"0\"/> </p><p><br/> &nbsp;</p><p><br/> </p><p><br/> </p><p><br/> </p><p><br/> </p><p><br/> </p><p><br/> </p><p><br/> </p>',0,'goods/images/25_P_1448947875346.jpg',1,1,'2019-10-19 18:07:53.164284',47),(52,'12312','融氏纯玉米胚芽油5l桶',0,0,0,100,170,157,'转基因纯玉米胚芽油','<p><br/> </p><p><br/> </p><p>&nbsp;<img align=\"absmiddle\" style=\"background-color: transparent; border-bottom-color: rgb(102, 102, 102); border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: rgb(102, 102, 102); border-left-style: none; border-left-width: 0px; border-right-color: rgb(102, 102, 102); border-right-style: none; border-right-width: 0px; border-top-color: rgb(102, 102, 102); border-top-style: none; border-top-width: 0px; color: rgb(102, 102, 102); font-family: tahoma,arial,Microsoft YaHei,Hiragino Sans GB,&amp;quot;u5b8bu4f53&amp;quot;,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; max-width: 750px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; vertical-align: middle; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;\" src=\"https://img14.360buyimg.com/imgzone/jfs/t1/45934/25/5629/200599/5d32cae3E40beda06/26b28a0cae2e2981.jpg\"/> <img align=\"absmiddle\" style=\"background-color: transparent; border-bottom-color: rgb(102, 102, 102); border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: rgb(102, 102, 102); border-left-style: none; border-left-width: 0px; border-right-color: rgb(102, 102, 102); border-right-style: none; border-right-width: 0px; border-top-color: rgb(102, 102, 102); border-top-style: none; border-top-width: 0px; color: rgb(102, 102, 102); font-family: tahoma,arial,Microsoft YaHei,Hiragino Sans GB,&amp;quot;u5b8bu4f53&amp;quot;,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; max-width: 750px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; vertical-align: middle; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;\" src=\"https://img14.360buyimg.com/imgzone/jfs/t1/82281/36/4966/372925/5d32cae2E6bf67558/3ac04d44997a9bca.jpg\"/> </p>',0,'goods/images/29_P_1448947631994.jpg',1,0,'2019-10-19 18:07:53.185883',41),(53,'2334234','新希望 香蕉牛奶200ml*12盒 礼盒装',2,0,0,100,40,36,'诱人牛奶香蕉味\r\n入口丝滑甜而不腻','<p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/4a75c132a4f638de.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/df754f38ec709c01.jpg\"/></p><p><br/></p>',0,'goods/images/a299eeb1caa9b364.jpg',1,1,'2019-10-25 22:27:23.952587',102),(54,'2334234','奶酪奶片奶制品 含钙奶贝 500g',0,0,0,100,20,17,'可以嚼着吃的牛奶\r\n入口甜而不腻','<p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5aaf290eN38f2bb1e.jpg\"/></p><p><img style=\"\" src=\"http://118.25.72.193:8996/media/goods/images/5aaf2912N44d01bdd.jpg\"/></p><p><br/></p>',1,'goods/images/5aaf28deNc34f23fb.jpg',1,0,'2019-10-25 22:29:37.341424',102);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category`
--

DROP TABLE IF EXISTS `goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_category_parent_category_id_3230c112_fk_goods_category_id` (`parent_category_id`) USING BTREE,
  CONSTRAINT `goods_category_parent_category_id_3230c112_fk_goods_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (1,'生鲜食品','sxsp','sxsp',1,1,'2019-10-19 18:07:45.614323',NULL),(2,'精品肉类','jprl','',2,0,'2019-10-19 18:07:45.623261',1),(3,'羊肉','yr','',3,0,'2019-10-19 18:07:45.633279',2),(4,'禽类','ql','',3,0,'2019-10-19 18:07:45.646638',2),(5,'猪肉','zr','',3,0,'2019-10-19 18:07:45.654250',2),(6,'牛肉','nr','',3,0,'2019-10-19 18:07:45.666689',2),(7,'海鲜水产','hxsc','',2,0,'2019-10-19 18:07:45.674183',1),(8,'参鲍','cb','',3,0,'2019-10-19 18:07:45.686529',7),(9,'鱼','yu','',3,0,'2019-10-19 18:07:45.694171',7),(10,'虾','xia','',3,0,'2019-10-19 18:07:45.702175',7),(11,'蟹/贝','xb','',3,0,'2019-10-19 18:07:45.728640',7),(12,'蛋制品','dzp','',2,0,'2019-10-19 18:07:45.734121',1),(13,'松花蛋/咸鸭蛋','xhd_xyd','',3,0,'2019-10-19 18:07:45.741359',12),(14,'鸡蛋','jd','',3,0,'2019-10-19 18:07:45.749110',12),(15,'叶菜类','ycl','',2,0,'2019-10-19 18:07:45.756536',1),(16,'生菜','sc','',3,0,'2019-10-19 18:07:45.763865',15),(17,'菠菜','bc','',3,0,'2019-10-19 18:07:45.770696',15),(18,'圆椒','yj','',3,0,'2019-10-19 18:07:45.781845',15),(19,'西兰花','xlh','',3,0,'2019-10-19 18:07:45.789085',15),(20,'根茎类','gjl','',2,0,'2019-10-19 18:07:45.800783',1),(21,'茄果类','qgl','',2,0,'2019-10-19 18:07:45.808106',1),(22,'菌菇类','jgl','',2,0,'2019-10-19 18:07:45.815063',1),(23,'进口生鲜','jksx','',2,0,'2019-10-19 18:07:45.822091',1),(24,'酒水饮料','jsyl','jsyl',1,1,'2019-10-19 18:07:45.829308',NULL),(25,'白酒','bk','',2,0,'2019-10-19 18:07:45.835933',24),(26,'五粮液','wly','',3,0,'2019-10-19 18:07:45.847424',25),(27,'泸州老窖','lzlj','',3,0,'2019-10-19 18:07:45.854321',25),(28,'茅台','mt','',3,0,'2019-10-19 18:07:45.861405',25),(29,'葡萄酒','ptj','',2,0,'2019-10-19 18:07:45.869252',24),(30,'洋酒','yj','',2,0,'2019-10-19 18:07:45.875818',24),(31,'啤酒','pj','',2,0,'2019-10-19 18:07:45.883376',24),(32,'其他酒品','qtjp','',2,0,'2019-10-19 18:07:45.895041',24),(33,'其他品牌','qtpp','',3,0,'2019-10-19 18:07:45.902204',32),(34,'黄酒','hj','',3,0,'2019-10-19 18:07:45.908749',32),(35,'养生酒','ysj','',3,0,'2019-10-19 18:07:45.915358',32),(36,'饮料/水','yls','',2,0,'2019-10-19 18:07:45.924150',24),(37,'红酒','hj','',2,0,'2019-10-19 18:07:45.931996',24),(38,'白兰地','bld','',3,0,'2019-10-19 18:07:45.939818',37),(39,'威士忌','wsj','',3,0,'2019-10-19 18:07:45.947963',37),(40,'粮油副食','粮油副食','sss',1,1,'2019-10-19 18:07:45.955507',NULL),(41,'食用油','食用油','',2,0,'2019-10-19 18:07:45.963328',40),(42,'其他食用油','其他食用油','',3,0,'2019-10-19 18:07:45.970442',41),(43,'菜仔油','菜仔油','',3,0,'2019-10-19 18:07:45.977698',41),(44,'花生油','花生油','',3,0,'2019-10-19 18:07:45.985039',41),(45,'橄榄油','橄榄油','',3,0,'2019-10-19 18:07:45.991750',41),(46,'礼盒','礼盒','',3,0,'2019-10-19 18:07:45.999597',41),(47,'米面杂粮','米面杂粮','',2,0,'2019-10-19 18:07:46.007714',40),(48,'面粉/面条','面粉/面条','',3,0,'2019-10-19 18:07:46.014307',47),(49,'大米','大米','',3,0,'2019-10-19 18:07:46.021388',47),(50,'意大利面','意大利面','',3,0,'2019-10-19 18:07:46.028263',47),(51,'厨房调料','厨房调料','',2,0,'2019-10-19 18:07:46.034924',40),(52,'调味油/汁','调味油/汁','',3,0,'2019-10-19 18:07:46.046536',51),(53,'酱油/醋','酱油/醋','',3,0,'2019-10-19 18:07:46.053306',51),(54,'南北干货','南北干货','',2,0,'2019-10-19 18:07:46.059519',40),(55,'方便速食','方便速食','',2,0,'2019-10-19 18:07:46.066610',40),(56,'调味品','调味品','',2,0,'2019-10-19 18:07:46.074831',40),(57,'蔬菜水果','蔬菜水果','scsg',1,1,'2019-10-19 18:07:46.081788',NULL),(58,'有机蔬菜','有机蔬菜','',2,0,'2019-10-19 18:07:46.088645',57),(59,'西红柿','西红柿','',3,0,'2019-10-19 18:07:46.095291',58),(60,'韭菜','韭菜','',3,0,'2019-10-19 18:07:46.106531',58),(61,'青菜','青菜','',3,0,'2019-10-19 18:07:46.113646',58),(62,'精选蔬菜','精选蔬菜','',2,0,'2019-10-19 18:07:46.121146',57),(63,'甘蓝','甘蓝','',3,0,'2019-10-19 18:07:46.127929',62),(64,'胡萝卜','胡萝卜','',3,0,'2019-10-19 18:07:46.136047',62),(65,'黄瓜','黄瓜','',3,0,'2019-10-19 18:07:46.144524',62),(66,'进口水果','进口水果','',2,0,'2019-10-19 18:07:46.151823',57),(67,'火龙果','火龙果','',3,0,'2019-10-19 18:07:46.158328',66),(68,'菠萝蜜','菠萝蜜','',3,0,'2019-10-19 18:07:46.164654',66),(69,'奇异果','奇异果','',3,0,'2019-10-19 18:07:46.171204',66),(70,'国产水果','国产水果','',2,0,'2019-10-19 18:07:46.177967',57),(71,'水果礼盒','水果礼盒','',3,0,'2019-10-19 18:07:46.185047',70),(72,'苹果','苹果','',3,0,'2019-10-19 18:07:46.191734',70),(73,'雪梨','雪梨','',3,0,'2019-10-19 18:07:46.198129',70),(74,'休闲食品','休闲食品','xxsp',1,0,'2019-10-19 18:07:46.205772',NULL),(75,'休闲零食','休闲零食','',2,0,'2019-10-19 18:07:46.213267',74),(76,'果冻','果冻','',3,0,'2019-10-19 18:07:46.220600',75),(77,'枣类','枣类','',3,0,'2019-10-19 18:07:46.227379',75),(78,'蜜饯','蜜饯','',3,0,'2019-10-19 18:07:46.234416',75),(79,'肉类零食','肉类零食','',3,0,'2019-10-19 18:07:46.240903',75),(80,'坚果炒货','坚果炒货','',3,0,'2019-10-19 18:07:46.248410',75),(81,'糖果','糖果','',2,0,'2019-10-19 18:07:46.255222',74),(82,'创意喜糖','创意喜糖','',3,0,'2019-10-19 18:07:46.262216',81),(83,'口香糖','口香糖','',3,0,'2019-10-19 18:07:46.268896',81),(84,'软糖','软糖','',3,0,'2019-10-19 18:07:46.277564',81),(85,'棒棒糖','棒棒糖','',3,0,'2019-10-19 18:07:46.284332',81),(86,'巧克力','巧克力','',2,0,'2019-10-19 18:07:46.291537',74),(87,'夹心巧克力','夹心巧克力','',3,0,'2019-10-19 18:07:46.298424',86),(88,'白巧克力','白巧克力','',3,0,'2019-10-19 18:07:46.310263',86),(89,'松露巧克力','松露巧克力','',3,0,'2019-10-19 18:07:46.317534',86),(90,'黑巧克力','黑巧克力','',3,0,'2019-10-19 18:07:46.324270',86),(91,'肉干肉脯/豆干','肉干肉脯/豆干','',2,0,'2019-10-19 18:07:46.331111',74),(92,'牛肉干','牛肉干','',3,0,'2019-10-19 18:07:46.338175',91),(93,'猪肉脯','猪肉脯','',3,0,'2019-10-19 18:07:46.346339',91),(94,'牛肉粒','牛肉粒','',3,0,'2019-10-19 18:07:46.357744',91),(95,'猪肉干','猪肉干','',3,0,'2019-10-19 18:07:46.365451',91),(96,'鱿鱼丝/鱼干','鱿鱼丝/鱼干','',2,0,'2019-10-19 18:07:46.372566',74),(97,'鱿鱼足','鱿鱼足','',3,0,'2019-10-19 18:07:46.379183',96),(98,'鱿鱼丝','鱿鱼丝','',3,0,'2019-10-19 18:07:46.385975',96),(99,'墨鱼/乌贼','墨鱼/乌贼','',3,0,'2019-10-19 18:07:46.392470',96),(100,'鱿鱼仔','鱿鱼仔','',3,0,'2019-10-19 18:07:46.398887',96),(101,'鱿鱼片','鱿鱼片','',3,0,'2019-10-19 18:07:46.405150',96),(102,'奶类食品','奶类食品','nlsp',1,1,'2019-10-19 18:07:46.412887',NULL),(103,'进口奶品','进口奶品','',2,0,'2019-10-19 18:07:46.420126',102),(104,'国产奶品','国产奶品','',2,0,'2019-10-19 18:07:46.427677',102),(105,'奶粉','奶粉','',2,0,'2019-10-19 18:07:46.439178',102),(106,'有机奶','有机奶','',2,0,'2019-10-19 18:07:46.446049',102),(107,'原料奶','原料奶','',2,0,'2019-10-19 18:07:46.455075',102),(108,'天然干货','天然干货','trgh',1,0,'2019-10-19 18:07:46.463290',NULL),(109,'菌菇类','菌菇类','',2,0,'2019-10-19 18:07:46.476440',108),(110,'腌干海产','腌干海产','',2,0,'2019-10-19 18:07:46.485265',108),(111,'汤料','汤料','',2,0,'2019-10-19 18:07:46.492451',108),(112,'豆类','豆类','',2,0,'2019-10-19 18:07:46.499984',108),(113,'干菜/菜干','干菜/菜干','',2,0,'2019-10-19 18:07:46.506544',108),(114,'干果/果干','干果/果干','',2,0,'2019-10-19 18:07:46.514339',108),(115,'豆制品','豆制品','',2,0,'2019-10-19 18:07:46.521433',108),(116,'腊味','腊味','',2,0,'2019-10-19 18:07:46.528703',108),(117,'精选茗茶','精选茗茶','jpmc',1,0,'2019-10-19 18:07:46.535700',NULL),(118,'白茶','白茶','',2,0,'2019-10-19 18:07:46.542737',117),(119,'红茶','红茶','',2,0,'2019-10-19 18:07:46.550975',117),(120,'绿茶','绿茶','',2,0,'2019-10-19 18:07:46.561155',117);
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category_brand`
--

DROP TABLE IF EXISTS `goods_category_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_category_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_category_brand_category_id_923be371_fk_goods_category_id` (`category_id`) USING BTREE,
  CONSTRAINT `goods_category_brand_category_id_923be371_fk_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category_brand`
--

LOCK TABLES `goods_category_brand` WRITE;
/*!40000 ALTER TABLE `goods_category_brand` DISABLE KEYS */;
INSERT INTO `goods_category_brand` VALUES (1,'s','s','goods/images/lyfs-1.jpg','2019-10-19 21:44:57.120973',1),(2,'s','s','goods/images/lyfs-2.jpg','2019-10-19 21:45:09.755051',24),(3,'s','s','goods/images/scsg-2_G6LV34f.jpg','2019-10-19 21:45:21.215676',40),(4,'s','s','goods/images/scsg-2_s2g3L7M.jpg','2019-10-19 21:46:09.860937',57),(5,'s','s','goods/images/scsg-2.jpg','2019-10-19 21:46:20.891410',74),(6,'s','s','goods/images/scsg-3.jpg','2019-10-19 21:46:31.574439',102),(7,'s','s','goods/images/sxsp-1_HPZZvbI.jpg','2019-10-19 21:46:41.327584',102),(8,'s','s','goods/images/sxsp-1_KDntI6h.jpg','2019-10-19 21:46:51.939440',108),(9,'s','s','goods/images/sxsp-2.jpg','2019-10-19 21:47:01.251720',117),(10,'s','s','goods/images/sxsp-3.jpg','2019-10-19 22:02:40.681407',1),(11,'s','s','goods/images/sxsp-3_p6QnMEd.jpg','2019-10-19 22:02:48.598208',1),(12,'s','s','goods/images/sxsp-2_4RNZL6s.jpg','2019-10-19 22:02:57.454077',24),(13,'s','s','goods/images/scsg-2_qDFj3Yz.jpg','2019-10-19 22:03:05.411615',24),(14,'s','s','goods/images/sxsp-1_KDntI6h_7Vn79Os.jpg','2019-10-19 22:03:12.449404',40),(15,'s','s','goods/images/sxsp-3_p6QnMEd_K7dHCZe.jpg','2019-10-19 22:03:19.368631',40),(16,'s','s','goods/images/sxsp-3_jG6lwp4.jpg','2019-10-19 22:03:26.737728',57),(17,'s','s','goods/images/sxsp-2_8rgWoIo.jpg','2019-10-19 22:03:33.127027',57),(18,'s','s','goods/images/scsg-2_5tUgneR.jpg','2019-10-19 22:04:09.711291',74),(19,'s','s','goods/images/sxsp-3_jG6lwp4_oKnf1ne.jpg','2019-10-19 22:04:18.005361',74),(20,'s','s','goods/images/sxsp-3_jG6lwp4_QsrtU2S.jpg','2019-10-19 22:04:24.707106',102),(22,'s','s','goods/images/scsg-3_rONydvD.jpg','2019-10-19 22:04:41.557556',108),(23,'s','s','goods/images/sxsp-3_jG6lwp4_LfnRlQr.jpg','2019-10-19 22:04:48.248609',108),(24,'s','s','goods/images/sxsp-1_KDntI6h_MXWNfEs.jpg','2019-10-19 22:04:55.733458',117),(25,'s','s','goods/images/scsg-2_NWDelSB.jpg','2019-10-19 22:05:03.616204',117);
/*!40000 ALTER TABLE `goods_category_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_image_goods_id_78e993d4_fk_goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `goods_image_goods_id_78e993d4_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_image`
--

LOCK TABLES `goods_image` WRITE;
/*!40000 ALTER TABLE `goods_image` DISABLE KEYS */;
INSERT INTO `goods_image` VALUES (1,'goods/images/1_P_1449024889889.jpg','2019-10-19 18:07:52.042123',1),(2,'goods/images/1_P_1449024889264.jpg','2019-10-19 18:07:52.049081',1),(3,'goods/images/1_P_1449024889726.jpg','2019-10-19 18:07:52.056038',1),(4,'goods/images/1_P_1449024889018.jpg','2019-10-19 18:07:52.067311',1),(5,'goods/images/1_P_1449024889287.jpg','2019-10-19 18:07:52.073812',1),(6,'goods/images/2_P_1448945810202.jpg','2019-10-19 18:07:52.090553',2),(7,'goods/images/2_P_1448945810814.jpg','2019-10-19 18:07:52.097861',2),(8,'goods/images/7_P_1448945104883.jpg','2019-10-19 18:07:52.115518',3),(9,'goods/images/7_P_1448945104734.jpg','2019-10-19 18:07:52.121900',3),(10,'goods/images/47_P_1448946213263.jpg','2019-10-19 18:07:52.140744',4),(11,'goods/images/47_P_1448946213157.jpg','2019-10-19 18:07:52.147501',4),(12,'goods/images/10_P_1448944572085.jpg','2019-10-19 18:07:52.165520',5),(13,'goods/images/10_P_1448944572532.jpg','2019-10-19 18:07:52.172515',5),(14,'goods/images/10_P_1448944572872.jpg','2019-10-19 18:07:52.179152',5),(15,'goods/images/4_P_1448945381985.jpg','2019-10-19 18:07:52.194287',6),(16,'goods/images/4_P_1448945381013.jpg','2019-10-19 18:07:52.200986',6),(17,'goods/images/8_P_1448945032810.jpg','2019-10-19 18:07:52.224947',7),(18,'goods/images/8_P_1448945032646.jpg','2019-10-19 18:07:52.231899',7),(19,'goods/images/11_P_1448944388277.jpg','2019-10-19 18:07:52.246851',8),(20,'goods/images/11_P_1448944388034.jpg','2019-10-19 18:07:52.257933',8),(21,'goods/images/11_P_1448944388201.jpg','2019-10-19 18:07:52.264402',8),(22,'goods/images/6_P_1448945167279.jpg','2019-10-19 18:07:52.278867',9),(23,'goods/images/6_P_1448945167015.jpg','2019-10-19 18:07:52.290561',9),(24,'goods/images/9_P_1448944791617.jpg','2019-10-19 18:07:52.305528',10),(25,'goods/images/9_P_1448944791129.jpg','2019-10-19 18:07:52.312362',10),(26,'goods/images/9_P_1448944791077.jpg','2019-10-19 18:07:52.319398',10),(27,'goods/images/9_P_1448944791229.jpg','2019-10-19 18:07:52.325473',10),(28,'goods/images/3_P_1448945490837.jpg','2019-10-19 18:07:52.340019',11),(29,'goods/images/3_P_1448945490084.jpg','2019-10-19 18:07:52.347088',11),(30,'goods/images/ee377cb5ed8d5259_GVVGV14.jpg','2019-10-19 18:07:52.365389',12),(31,'goods/images/18046d4e9da6b322.jpg','2019-10-19 18:07:52.372521',12),(33,'goods/images/5_P_1448945270390.jpg','2019-10-19 18:07:52.395062',13),(34,'goods/images/5_P_1448945270067.jpg','2019-10-19 18:07:52.401936',13),(35,'goods/images/5_P_1448945270432.jpg','2019-10-19 18:07:52.408834',13),(36,'images/201705/goods_img/53_P_1495068879687.jpg','2019-10-19 18:07:52.430368',14),(37,'goods/images/16_P_1448947194687.jpg','2019-10-19 18:07:52.446049',15),(38,'goods/images/14_P_1448947354031.jpg','2019-10-19 18:07:52.463061',16),(39,'goods/images/14_P_1448947354433.jpg','2019-10-19 18:07:52.471969',16),(40,'goods/images/12_P_1448947547989.jpg','2019-10-19 18:07:52.491584',17),(41,'goods/images/46_P_1448946598711.jpg','2019-10-19 18:07:52.508473',18),(42,'goods/images/46_P_1448946598301.jpg','2019-10-19 18:07:52.515314',18),(43,'goods/images/518b1a5552dbc529_MGe1sJU.jpg','2019-10-19 18:07:52.531733',19),(44,'goods/images/970adfe7e5e0caed.jpg','2019-10-19 18:07:52.538823',19),(45,'goods/images/15_P_1448947257324.jpg','2019-10-19 18:07:52.554055',20),(46,'goods/images/15_P_1448947257580.jpg','2019-10-19 18:07:52.562593',20),(47,'goods/images/13_P_1448947460386.jpg','2019-10-19 18:07:52.579197',21),(48,'goods/images/13_P_1448947460276.jpg','2019-10-19 18:07:52.586250',21),(49,'goods/images/13_P_1448947460353.jpg','2019-10-19 18:07:52.593824',21),(50,'goods/images/50_P_1448946543091.jpg','2019-10-19 18:07:52.609682',22),(51,'goods/images/50_P_1448946542182.jpg','2019-10-19 18:07:52.615991',22),(52,'goods/images/51_P_1448946466595.jpg','2019-10-19 18:07:52.632635',23),(53,'goods/images/51_P_1448946466208.jpg','2019-10-19 18:07:52.639804',23),(54,'goods/images/17_P_1448947102246.jpg','2019-10-19 18:07:52.655973',24),(55,'goods/images/20_P_1448946850602.jpg','2019-10-19 18:07:52.670972',25),(56,'goods/images/19_P_1448946951581.jpg','2019-10-19 18:07:52.685607',26),(57,'goods/images/19_P_1448946951726.jpg','2019-10-19 18:07:52.692091',26),(58,'goods/images/18_P_1448947011435.jpg','2019-10-19 18:07:52.709704',27),(59,'goods/images/22_P_1448946729629.jpg','2019-10-19 18:07:52.725692',28),(60,'goods/images/45_P_1448946661303.jpg','2019-10-19 18:07:52.741438',29),(61,'goods/images/32_P_1448948525620.jpg','2019-10-19 18:07:52.756524',30),(62,'goods/images/30_P_1448948663450.jpg','2019-10-19 18:07:52.775196',31),(63,'goods/images/cb80dbfb0bc95ee3.jpg','2019-10-19 18:07:52.782740',31),(64,'goods/images/30_P_1448948663221.jpg','2019-10-19 18:07:52.790718',31),(65,'goods/images/31_P_1448948598947.jpg','2019-10-19 18:07:52.807140',32),(66,'goods/images/debfb0f1cf58ebff.jpg','2019-10-19 18:07:52.814336',32),(67,'goods/images/4d14a9f5f97bac8b_VCElJAS.jpg','2019-10-19 18:07:52.831860',33),(68,'goods/images/3624d4bc79895061.jpg','2019-10-19 18:07:52.839104',33),(69,'goods/images/58b3c601Na4f13da4_mTUyPPi.jpg','2019-10-19 18:07:52.855345',34),(70,'goods/images/583a9825N6c9d4d1c.jpg','2019-10-19 18:07:52.862111',34),(71,'goods/images/cabaab8e8772c2b4_KBQRMVf.jpg','2019-10-19 18:07:52.876988',35),(72,'goods/images/cda907976af8a3b5.jpg','2019-10-19 18:07:52.883655',35),(73,'goods/images/34_P_1448948399009.jpg','2019-10-19 18:07:52.898834',36),(74,'goods/images/b3ee37f8356b4321_qZ1UbO6.jpg','2019-10-19 18:07:52.916727',37),(75,'goods/images/5aab2bdbN1fad3ffc_XuTi8GF.jpg','2019-10-19 18:07:52.931984',38),(76,'goods/images/5cdbc10fN731bb094_mOSzD4y.jpg','2019-10-19 18:07:52.946861',39),(77,'goods/images/5bbf27a3N9d56a441_E9zUiV2.jpg','2019-10-19 18:07:52.962793',40),(78,'goods/images/5ab8e030Ndb718fa7_73mNiQb.jpg','2019-10-19 18:07:52.986069',41),(79,'goods/images/db636fcfa7819d79_vp6MY2E.jpg','2019-10-19 18:07:53.007609',42),(80,'goods/images/5abc7534Nb413023d_aiiZFwG.jpg','2019-10-19 18:07:53.022842',43),(81,'goods/images/5ce23f4dN06efe10d_iA4WX39.jpg','2019-10-19 18:07:53.041284',44),(82,'goods/images/2512cd5b017a3e97_6ky8f9r.jpg','2019-10-19 18:07:53.061164',45),(83,'goods/images/5ad07fbbN52a0203f_0RIRF14.jpg','2019-10-19 18:07:53.077179',46),(84,'goods/images/39e2e78ca577e403_y3N6XW2.jpg','2019-10-19 18:07:53.092810',47),(85,'goods/images/cc06b2db39e723db_LqzQA8W.jpg','2019-10-19 18:07:53.110784',48),(86,'goods/images/5a091d03N54e77227_0ywdwEU.jpg','2019-10-19 18:07:53.126429',49),(87,'goods/images/5a091d02N356761fb.jpg','2019-10-19 18:07:53.133816',49),(89,'goods/images/b300b8d8927d675c_63UMZ3Y.jpg','2019-10-19 18:07:53.155553',50),(90,'goods/images/449ac2ebd9956f17.jpg','2019-10-19 18:07:53.171730',51),(91,'goods/images/29_P_1448947631994.jpg','2019-10-19 18:07:53.193191',52),(92,'goods/images/430a24fad67843a2.jpg','2019-10-25 20:20:48.345898',51),(93,'goods/images/28_P_1448947699948_gs966Zd.jpg','2019-10-25 20:22:46.529870',52),(94,'goods/images/5750f36cN9e3c8ec0.jpg','2019-10-25 20:36:06.518691',50),(95,'goods/images/1146ef79095cb4bc_uI97sxb.jpg','2019-10-25 20:43:42.994541',49),(96,'goods/images/537867361b855291.jpg','2019-10-25 20:46:55.888283',48),(97,'goods/images/91f66a1c21d3b6a3.jpg','2019-10-25 20:51:16.755217',47),(98,'goods/images/5b73c45eNee7a472c_QtbH1WB.jpg','2019-10-25 21:06:11.063337',46),(99,'goods/images/32e0a02b68e421b8.jpg','2019-10-25 21:10:22.536901',45),(100,'goods/images/abcfbb9b8539ca8a.jpg','2019-10-25 21:16:55.777733',44),(101,'goods/images/5abc7537Nc74ba36a_tXgKEFQ.jpg','2019-10-25 21:23:04.477197',43),(102,'goods/images/57ddfc94N6d8772f9.jpg','2019-10-25 21:29:12.827338',42),(103,'goods/images/5ab8e037N25add5f5.jpg','2019-10-25 21:32:21.376533',41),(104,'goods/images/5bbf27a8N2555bbca.jpg','2019-10-25 21:34:53.370040',40),(105,'goods/images/6e896ae5093b042b.jpg','2019-10-25 21:38:04.318240',39),(106,'goods/images/5691b110Nea9e80a5.jpg','2019-10-25 21:40:25.510964',38),(107,'goods/images/b644a115626ce143.jpg','2019-10-25 21:42:49.081604',37),(108,'goods/images/5a18408aNb4317f31.jpg','2019-10-25 21:46:30.900192',36),(109,'goods/images/ecd1626a89cfee75.jpg','2019-10-25 22:01:22.335858',32),(110,'goods/images/46e9fafff567e063.jpg','2019-10-25 22:27:23.954433',53),(111,'goods/images/5aaf2908Na140285f.jpg','2019-10-25 22:29:37.343390',54);
/*!40000 ALTER TABLE `goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_search_words`
--

DROP TABLE IF EXISTS `hot_search_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hot_search_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(20) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_search_words`
--

LOCK TABLES `hot_search_words` WRITE;
/*!40000 ALTER TABLE `hot_search_words` DISABLE KEYS */;
INSERT INTO `hot_search_words` VALUES (1,'葡萄酒',1,'2019-10-19 18:08:14.851054'),(2,'牛肉',2,'2019-10-19 18:08:21.556658'),(3,'油',0,'2019-10-19 18:08:26.660728');
/*!40000 ALTER TABLE `hot_search_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_ad_goods`
--

DROP TABLE IF EXISTS `index_ad_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_ad_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_ad_goods_category_id_4e041cb8_fk_goods_category_id` (`category_id`) USING BTREE,
  KEY `index_ad_goods_goods_id_c3e83b7e_fk_goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `index_ad_goods_category_id_4e041cb8_fk_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`),
  CONSTRAINT `index_ad_goods_goods_id_c3e83b7e_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_ad_goods`
--

LOCK TABLES `index_ad_goods` WRITE;
/*!40000 ALTER TABLE `index_ad_goods` DISABLE KEYS */;
INSERT INTO `index_ad_goods` VALUES (1,'2019-10-19 21:38:01.158967',1,4),(4,'2019-10-19 22:35:55.695322',24,17),(5,'2019-10-19 22:38:17.837283',40,48),(6,'2019-10-19 22:38:56.961246',57,32),(7,'2019-10-19 22:39:04.027031',74,37),(8,'2019-10-19 22:39:16.651606',102,39),(9,'2019-10-19 22:40:26.081391',108,47),(10,'2019-10-19 22:41:12.280163',117,21);
/*!40000 ALTER TABLE `index_ad_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_goods_goods_id_3abecef8_fk_goods_id` (`goods_id`) USING BTREE,
  KEY `order_goods_order_id_8841e90f_fk_order_info_id` (`order_id`) USING BTREE,
  CONSTRAINT `order_goods_goods_id_3abecef8_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `order_goods_order_id_8841e90f_fk_order_info_id` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (64,1,'2019-11-02 09:40:28.241754',2,61);
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) NOT NULL,
  `nonce_str` varchar(50) NOT NULL,
  `trade_no` varchar(50) NOT NULL,
  `pay_status` varchar(20) NOT NULL,
  `pay_type` varchar(10) NOT NULL,
  `post_script` longtext,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `order_info_user_id_f2004c3f_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `order_info_user_id_f2004c3f_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (17,'20191022170253170','','','待支付','支付宝','',1000,NULL,'北京','张三','15189798787','2019-10-22 17:02:53.933990',1),(18,'20191022170347121','','','待支付','支付宝','',1200,NULL,'北京市','张三','15159398913','2019-10-22 17:03:47.799018',1),(19,'20191022170354140','','','待支付','支付宝','',1200,NULL,'北京市','张三','15159398913','2019-10-22 17:03:54.815641',1),(20,'20191022174232195','','','待支付','支付宝','',100,NULL,'北京','张三','15167899999','2019-10-22 17:42:32.083919',1),(21,'20191022174559153','','','待支付','支付宝','',1000,NULL,'1','1','1','2019-10-22 17:45:59.580528',1),(22,'20191022174630118','','','待支付','支付宝','',1000,NULL,'1','1','1','2019-10-22 17:46:30.663922',1),(23,'20191022174913141','','','待支付','支付宝','',1000,NULL,'1','1','1','2019-10-22 17:49:13.789528',1),(24,'20191022175546151','','','待支付','支付宝','',1000,NULL,'1','1','1','2019-10-22 17:55:46.680053',1),(53,'20191027202254552','','','待支付','支付宝','',100,NULL,'100','11000','11111','2019-10-27 20:22:54.902363',5),(61,'20191102094028199','','','待支付','支付宝','',100,NULL,'1','1','1','2019-11-02 09:40:28.198460',1);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shopping_cart_goods_id_85e76842_fk_goods_id` (`goods_id`) USING BTREE,
  KEY `shopping_cart_user_id_27d1bbc3_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `shopping_cart_goods_id_85e76842_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `shopping_cart_user_id_27d1bbc3_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `user_email_54dc62b2_uniq` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pbkdf2_sha256$150000$lOmLEq9YbQbQ$u50hJRbK0gvzNYKA4yCGaRg6i3UmBAdn9EAHrYsqurc=','2020-01-03 21:21:39.969133',1,'cix','','',1,1,'2019-10-19 10:34:00.000000',NULL,NULL,'15159398913@163.com','女',NULL,'2019-10-19 10:34:49.731393'),(5,'pbkdf2_sha256$150000$bPZkrqHTgXo4$EXwelbWJRZ5pF4KezfZmNgTHw5lqHZrlQRwThS/E5Cs=','2020-01-07 11:09:20.186483',1,'admin','','',1,1,'2019-10-20 14:32:52.251806',NULL,NULL,'admin@qq.com',NULL,'15159398913','2019-10-20 14:32:52.375411');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(10) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(30) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_address_user_id_64deb2c7_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_address_user_id_64deb2c7_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fav`
--

DROP TABLE IF EXISTS `user_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_fav_goods_id_fea3959d_fk_goods_id` (`goods_id`) USING BTREE,
  KEY `user_fav_user_id_49134900_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_fav_goods_id_fea3959d_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `user_fav_user_id_49134900_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav`
--

LOCK TABLES `user_fav` WRITE;
/*!40000 ALTER TABLE `user_fav` DISABLE KEYS */;
INSERT INTO `user_fav` VALUES (12,'2019-10-29 12:49:06.756853',2,5),(14,'2019-10-30 09:32:29.130952',3,1),(15,'2019-11-01 10:37:48.010580',1,1);
/*!40000 ALTER TABLE `user_fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_leaving_message`
--

DROP TABLE IF EXISTS `user_leaving_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_leaving_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_leaving_message_user_id_038a2b56_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_leaving_message_user_id_038a2b56_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leaving_message`
--

LOCK TABLES `user_leaving_message` WRITE;
/*!40000 ALTER TABLE `user_leaving_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_leaving_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_code`
--

DROP TABLE IF EXISTS `verify_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_code`
--

LOCK TABLES `verify_code` WRITE;
/*!40000 ALTER TABLE `verify_code` DISABLE KEYS */;
INSERT INTO `verify_code` VALUES (13,'9177','714141681@qq.com','2019-10-19 12:10:25.355697'),(14,'3940','714141681@qq.com','2019-10-19 12:12:25.914937'),(15,'7251','714141681@qq.com','2019-10-19 12:14:15.156273'),(16,'6256','714141681@qq.com','2019-10-19 12:15:30.815595'),(17,'6895','714141681@qq.com','2019-10-19 12:16:48.030410'),(18,'9804','714141681@qq.com','2019-10-19 15:17:35.864390'),(19,'5998','714141681@qq.com','2019-10-19 16:07:14.536109'),(20,'6713','714141681@qq.com','2019-10-19 16:08:42.502068'),(21,'0839','714141681@qq.com','2019-10-19 16:20:52.477667'),(22,'5160','714141681@qq.com','2019-10-22 22:31:13.036854'),(23,'0503','714141621@qq.com','2019-10-22 22:31:39.207983'),(24,'6179','1140786690@qq.com','2019-10-22 22:32:04.365226'),(25,'0425','347227584@qq.com','2019-10-22 22:55:52.111808'),(26,'3743','347227584@qq.com','2019-10-22 23:05:37.753022'),(27,'5443','347227584@qq.com','2019-10-22 23:10:19.087305'),(28,'0764','599024399@qq.com','2019-10-22 23:35:25.079866'),(29,'3247','714141681@qq.com','2019-10-23 15:40:54.966967'),(30,'6441','1021581924@qq.com','2019-10-25 14:36:18.366743'),(31,'7778','1021581924@qq.com','2019-10-25 14:36:19.679800'),(32,'0118','1021581924@qq.com','2019-10-25 14:36:19.758394'),(33,'9225','714141681@qq.com','2019-10-25 14:37:11.275029'),(34,'4946','714141681@qq.com','2019-10-25 15:31:42.156701'),(35,'0355','714141681@qq.com','2019-10-25 15:56:48.698181'),(36,'8387','714141681@qq.com','2019-10-25 16:01:32.636410'),(37,'6607','714141681@qq.com','2019-10-25 16:04:42.435677'),(38,'5821','714141681@qq.com','2019-10-25 16:14:23.393938'),(39,'8934','714141681@qq.com','2019-10-25 16:16:38.583087'),(40,'1545','850184676@qq.com','2019-10-25 17:26:37.119044'),(41,'1639','271927345@qq.com','2019-10-27 20:14:53.719089'),(42,'7577','714141681@qq.com','2019-10-31 14:28:28.372292'),(43,'5240','714141681@qq.com','2019-10-31 14:32:41.558792'),(44,'8551','714141681@qq.com','2019-10-31 14:34:46.986920'),(45,'8114','714141681@qq.com','2019-10-31 14:37:18.393764'),(46,'7984','714141681@qq.com','2019-10-31 15:00:06.533081'),(47,'4515','714141681@qq.com','2019-10-31 15:01:26.861747'),(48,'9997','714141681@qq.com','2019-10-31 15:02:52.989247'),(49,'8299','714141681@qq.com','2019-10-31 15:05:13.634033'),(50,'6354','714141681@qq.com','2019-10-31 15:07:03.227328'),(51,'8244','714141681@qq.com','2019-10-31 16:07:04.661071'),(52,'9635','714141681@qq.com','2019-10-31 16:23:02.112735'),(53,'3797','714141681@qq.com','2019-10-31 17:49:25.332110'),(54,'4620','714141681@qq.com','2019-10-31 18:06:43.422088'),(55,'4107','714141681@qq.com','2019-11-02 10:36:25.018045'),(56,'8119','714141681@qq.com','2019-11-02 10:43:28.975187'),(57,'6369','714141681@qq.com','2019-11-02 10:47:33.928902'),(58,'7595','714141681@qq.com','2019-11-02 11:04:23.279150');
/*!40000 ALTER TABLE `verify_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_user_id_bb16a176_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-10-19 12:06:32.350110','127.0.0.1',NULL,'','delete','批量删除 2 个 验证码',NULL,1),(2,'2019-10-19 12:07:03.889947','127.0.0.1',NULL,'','delete','批量删除 1 个 验证码',NULL,1),(3,'2019-10-19 12:07:47.600421','127.0.0.1',NULL,'','delete','批量删除 1 个 验证码',NULL,1),(4,'2019-10-19 12:08:29.419166','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(5,'2019-10-19 12:08:59.494840','127.0.0.1','1','cix','change','修改 last_login 和 email',16,1),(6,'2019-10-19 12:10:21.910347','127.0.0.1',NULL,'','delete','批量删除 2 个 验证码',NULL,1),(7,'2019-10-19 14:59:46.446401','127.0.0.1','3','714141681@qq.com','change','修改 gender',16,1),(8,'2019-10-19 14:59:54.396895','127.0.0.1','1','cix','change','修改 gender',16,1),(9,'2019-10-19 16:06:41.949454','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(10,'2019-10-19 18:08:14.852783','127.0.0.1','1','苹果','create','已添加。',11,1),(11,'2019-10-19 18:08:21.557791','127.0.0.1','2','香蕉','create','已添加。',11,1),(12,'2019-10-19 18:08:26.662203','127.0.0.1','3','橘子','create','已添加。',11,1),(13,'2019-10-19 18:14:11.962391','127.0.0.1','3','油','change','修改 keywords',11,1),(14,'2019-10-19 18:14:49.878681','127.0.0.1','2','牛肉','change','修改 keywords',11,1),(15,'2019-10-19 18:14:57.607419','127.0.0.1','1','葡萄酒','change','修改 keywords',11,1),(16,'2019-10-19 19:32:16.900167','127.0.0.1','117','精选茗茶','change','修改 desc 和 is_tab',8,1),(17,'2019-10-19 19:32:38.363477','127.0.0.1','108','天然干货','change','修改 desc 和 is_tab',8,1),(18,'2019-10-19 19:33:00.596098','127.0.0.1','57','蔬菜水果','change','修改 desc 和 is_tab',8,1),(19,'2019-10-19 19:33:12.633495','127.0.0.1','24','酒水饮料','change','修改 desc 和 is_tab',8,1),(20,'2019-10-19 19:33:30.826069','127.0.0.1','1','生鲜食品','change','修改 desc 和 is_tab',8,1),(21,'2019-10-19 19:33:58.897708','127.0.0.1','74','休闲食品','change','修改 desc 和 is_tab',8,1),(22,'2019-10-19 19:55:13.800263','127.0.0.1','1','ShoppingCart object (1)','create','已添加。',15,1),(23,'2019-10-19 19:55:21.277246','127.0.0.1','2','ShoppingCart object (2)','create','已添加。',15,1),(24,'2019-10-19 20:45:00.548810','127.0.0.1','3','ShoppingCart object (3)','create','已添加。',15,1),(25,'2019-10-19 20:45:07.556222','127.0.0.1','3','ShoppingCart object (3)','change','修改 num',15,1),(26,'2019-10-19 20:49:20.596764','127.0.0.1','4','ShoppingCart object (4)','create','已添加。',15,1),(27,'2019-10-19 20:49:44.681831','127.0.0.1','5','ShoppingCart object (5)','create','已添加。',15,1),(28,'2019-10-19 20:50:56.205266','127.0.0.1','6','ShoppingCart object (6)','create','已添加。',15,1),(29,'2019-10-19 20:51:05.181134','127.0.0.1','7','ShoppingCart object (7)','create','已添加。',15,1),(30,'2019-10-19 20:52:52.072458','127.0.0.1','8','ShoppingCart object (8)','create','已添加。',15,1),(31,'2019-10-19 20:52:59.013419','127.0.0.1','9','ShoppingCart object (9)','create','已添加。',15,1),(32,'2019-10-19 20:54:25.437453','127.0.0.1','10','ShoppingCart object (10)','create','已添加。',15,1),(33,'2019-10-19 20:54:32.198882','127.0.0.1','11','ShoppingCart object (11)','create','已添加。',15,1),(34,'2019-10-19 20:54:40.233078','127.0.0.1','12','ShoppingCart object (12)','create','已添加。',15,1),(35,'2019-10-19 20:57:17.346422','127.0.0.1','13','ShoppingCart object (13)','create','已添加。',15,1),(36,'2019-10-19 21:00:16.648435','127.0.0.1','52','融氏纯玉米胚芽油5l桶','change','修改 goods_sn，goods_brief，goods_desc 和 is_new',7,1),(37,'2019-10-19 21:01:05.969619','127.0.0.1','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 goods_sn，goods_brief，goods_desc 和 is_new',7,1),(38,'2019-10-19 21:01:21.725982','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_sn，goods_brief，goods_desc 和 is_new',7,1),(39,'2019-10-19 21:38:01.160358','127.0.0.1','1','新鲜水果甜蜜香脆单果约800克','create','已添加。',12,1),(40,'2019-10-19 21:38:52.251339','127.0.0.1','2','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐','create','已添加。',12,1),(41,'2019-10-19 21:44:57.122186','127.0.0.1','1','s','create','已添加。',9,1),(42,'2019-10-19 21:45:09.756349','127.0.0.1','2','s','create','已添加。',9,1),(43,'2019-10-19 21:45:21.216609','127.0.0.1','3','s','create','已添加。',9,1),(44,'2019-10-19 21:46:09.862718','127.0.0.1','4','s','create','已添加。',9,1),(45,'2019-10-19 21:46:20.892721','127.0.0.1','5','s','create','已添加。',9,1),(46,'2019-10-19 21:46:31.575620','127.0.0.1','6','s','create','已添加。',9,1),(47,'2019-10-19 21:46:41.329429','127.0.0.1','7','s','create','已添加。',9,1),(48,'2019-10-19 21:46:51.940618','127.0.0.1','8','s','create','已添加。',9,1),(49,'2019-10-19 21:47:01.252844','127.0.0.1','9','s','create','已添加。',9,1),(50,'2019-10-19 22:02:40.682041','127.0.0.1','10','s','create','已添加。',9,1),(51,'2019-10-19 22:02:48.599155','127.0.0.1','11','s','create','已添加。',9,1),(52,'2019-10-19 22:02:57.456564','127.0.0.1','12','s','create','已添加。',9,1),(53,'2019-10-19 22:03:05.413142','127.0.0.1','13','s','create','已添加。',9,1),(54,'2019-10-19 22:03:12.450774','127.0.0.1','14','s','create','已添加。',9,1),(55,'2019-10-19 22:03:19.369540','127.0.0.1','15','s','create','已添加。',9,1),(56,'2019-10-19 22:03:26.738616','127.0.0.1','16','s','create','已添加。',9,1),(57,'2019-10-19 22:03:33.128291','127.0.0.1','17','s','create','已添加。',9,1),(58,'2019-10-19 22:04:09.712377','127.0.0.1','18','s','create','已添加。',9,1),(59,'2019-10-19 22:04:18.006511','127.0.0.1','19','s','create','已添加。',9,1),(60,'2019-10-19 22:04:24.708218','127.0.0.1','20','s','create','已添加。',9,1),(61,'2019-10-19 22:04:32.451557','127.0.0.1','21','s','create','已添加。',9,1),(62,'2019-10-19 22:04:41.558905','127.0.0.1','22','s','create','已添加。',9,1),(63,'2019-10-19 22:04:48.250190','127.0.0.1','23','s','create','已添加。',9,1),(64,'2019-10-19 22:04:55.734462','127.0.0.1','24','s','create','已添加。',9,1),(65,'2019-10-19 22:05:03.617747','127.0.0.1','25','s','create','已添加。',9,1),(66,'2019-10-19 22:24:56.927860','127.0.0.1','1','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛','change','修改 goods',12,1),(67,'2019-10-19 22:30:38.062682','127.0.0.1','2','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材','change','修改 goods',12,1),(68,'2019-10-19 22:31:00.290380','127.0.0.1','2','日本蒜蓉粉丝扇贝270克6只装','change','修改 goods',12,1),(69,'2019-10-19 22:34:30.279621','127.0.0.1',NULL,'','delete','批量删除 1 个 首页商品类别广告',NULL,1),(70,'2019-10-19 22:34:38.129989','127.0.0.1','1','日本蒜蓉粉丝扇贝270克6只装','change','修改 goods',12,1),(71,'2019-10-19 22:34:58.019595','127.0.0.1','3','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛','create','已添加。',12,1),(72,'2019-10-19 22:35:55.696127','127.0.0.1','4','53度茅台仁酒500ml','create','已添加。',12,1),(73,'2019-10-19 22:38:17.838392','127.0.0.1','5','精炼一级大豆油5L色拉油粮油食用油','create','已添加。',12,1),(74,'2019-10-19 22:38:37.704902','127.0.0.1',NULL,'','delete','批量删除 1 个 首页商品类别广告',NULL,1),(75,'2019-10-19 22:38:56.962025','127.0.0.1','6','四川双流草莓新鲜水果礼盒2盒','create','已添加。',12,1),(76,'2019-10-19 22:39:04.028053','127.0.0.1','7','休闲零食膨化食品焦糖/奶油/椒麻味','create','已添加。',12,1),(77,'2019-10-19 22:39:16.653358','127.0.0.1','8','蒙牛特仑苏有机奶250ml×12盒','create','已添加。',12,1),(78,'2019-10-19 22:40:26.082406','127.0.0.1','9','糙米450gx3包粮油米面','create','已添加。',12,1),(79,'2019-10-19 22:41:12.281207','127.0.0.1','10','52度兰陵·紫气东来1600mL山东名酒','create','已添加。',12,1),(80,'2019-10-20 14:46:03.750083','127.0.0.1','1','cix','change','没有字段被修改。',16,5),(81,'2019-10-20 14:46:07.446232','127.0.0.1','1','cix','change','没有字段被修改。',16,5),(82,'2019-10-20 14:53:13.267301','127.0.0.1','117','精选茗茶','change','修改 is_tab',8,1),(83,'2019-10-20 14:53:23.508968','127.0.0.1','108','天然干货','change','修改 is_tab',8,1),(84,'2019-10-20 16:47:14.257966','127.0.0.1','74','休闲食品','change','修改 is_tab',8,1),(85,'2019-10-20 19:10:17.722445','127.0.0.1','1','新鲜水果甜蜜香脆单果约800克','change','修改 category，goods_sn 和 goods_desc',7,1),(86,'2019-10-20 19:40:37.506368','127.0.0.1','1','cix','change','修改 email',16,1),(87,'2019-10-20 21:34:46.987234','127.0.0.1','45','伊利官方直营全脂营养舒化奶250ml*12盒*2提','change','修改 goods_sn，sold_num，goods_brief 和 goods_desc',7,1),(88,'2019-10-20 21:35:00.432714','127.0.0.1','44','新西兰进口全脂奶粉900g','change','修改 goods_sn，sold_num，goods_brief 和 goods_desc',7,1),(89,'2019-10-20 21:35:16.201631','127.0.0.1','36','潍坊萝卜5斤/箱礼盒','change','修改 goods_sn，sold_num 和 goods_desc',7,1),(90,'2019-10-20 23:05:33.122210','127.0.0.1','2','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛','change','修改 goods_sn，goods_num 和 goods_desc',7,1),(91,'2019-10-21 09:13:20.275583','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(92,'2019-10-21 09:13:49.852132','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(93,'2019-10-21 09:17:36.082138','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(94,'2019-10-21 09:18:28.804353','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(95,'2019-10-21 09:18:51.435040','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(96,'2019-10-21 09:19:32.722389','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(97,'2019-10-21 09:21:45.590895','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(98,'2019-10-21 09:22:15.872488','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(99,'2019-10-21 09:22:45.308004','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(100,'2019-10-21 09:25:03.520652','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(101,'2019-10-21 09:36:36.417510','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(102,'2019-10-21 09:39:10.643607','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(103,'2019-10-21 09:39:49.304138','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(104,'2019-10-21 09:40:05.593296','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(105,'2019-10-21 09:42:55.028160','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(106,'2019-10-21 09:57:24.707006','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(107,'2019-10-21 09:59:50.906553','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(108,'2019-10-21 10:04:14.907115','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(109,'2019-10-21 10:05:17.212381','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(110,'2019-10-21 10:17:33.986596','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(111,'2019-10-21 10:19:13.093651','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(112,'2019-10-21 10:23:14.600817','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(113,'2019-10-21 10:24:13.691237','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(114,'2019-10-21 10:24:43.841945','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(115,'2019-10-21 10:29:52.942869','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(116,'2019-10-21 10:30:51.541022','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,1),(117,'2019-10-21 13:16:44.816162','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 click_num 和 goods_desc',7,1),(118,'2019-10-21 13:23:38.032452','127.0.0.1','50','山西黑米农家黑米4斤','change','修改 goods_desc 和 is_hot',7,1),(119,'2019-10-21 13:23:47.817758','127.0.0.1','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 is_hot',7,1),(120,'2019-10-21 13:24:00.571124','127.0.0.1','43','高钙液体奶200ml*24盒','change','修改 goods_sn，goods_brief，goods_desc 和 is_hot',7,1),(121,'2019-10-21 13:24:13.123075','127.0.0.1','45','伊利官方直营全脂营养舒化奶250ml*12盒*2提','change','修改 is_hot',7,1),(122,'2019-10-21 14:09:51.700660','127.0.0.1','3','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐','change','修改 goods_sn，goods_num，goods_brief 和 goods_desc',7,1),(123,'2019-10-21 14:10:32.093913','127.0.0.1','4','日本蒜蓉粉丝扇贝270克6只装','change','修改 goods_sn，goods_num，goods_brief 和 goods_desc',7,1),(124,'2019-10-21 14:11:00.314055','127.0.0.1','30','赣南脐橙特级果10斤装','change','修改 goods_sn，goods_num，goods_brief 和 goods_desc',7,1),(125,'2019-10-21 20:30:11.773621','127.0.0.1',NULL,'','delete','批量删除 1 个 订单信息',NULL,1),(126,'2019-10-22 08:01:16.135908','127.0.0.1',NULL,'','delete','批量删除 5 个 订单信息',NULL,1),(127,'2019-10-22 08:01:25.542144','127.0.0.1',NULL,'','delete','批量删除 1 个 订单信息',NULL,1),(128,'2019-10-22 08:06:53.152559','127.0.0.1',NULL,'','delete','批量删除 1 个 订单信息',NULL,1),(129,'2019-10-22 11:01:36.485858','127.0.0.1',NULL,'','delete','批量删除 2 个 用户留言',NULL,1),(130,'2019-10-23 13:59:08.874891','120.37.162.106','50','山西黑米农家黑米4斤','change','修改 goods_num',7,1),(131,'2019-10-23 13:59:41.281867','120.37.162.106','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 goods_num',7,1),(132,'2019-10-25 16:15:39.571690','120.37.162.106',NULL,'','delete','批量删除 1 个 用户信息',NULL,5),(133,'2019-10-25 16:16:15.393229','120.37.162.106',NULL,'','delete','批量删除 1 个 用户信息',NULL,5),(134,'2019-10-25 19:55:38.071365','112.38.165.245','52','融氏纯玉米胚芽油5l桶','change','修改 market_price，shop_price，goods_brief 和 goods_desc',7,5),(135,'2019-10-25 20:00:52.019707','112.38.165.245','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 click_num，market_price，shop_price，goods_brief 和 goods_desc',7,5),(136,'2019-10-25 20:09:00.027331','112.38.165.245','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 click_num，goods_brief 和 goods_desc',7,5),(137,'2019-10-25 20:14:52.068618','117.136.11.197','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 goods_desc',7,1),(138,'2019-10-25 20:20:00.715316','112.38.165.245','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 click_num 和 goods_desc',7,5),(139,'2019-10-25 20:20:48.343625','112.38.165.245','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 goods_desc',7,5),(140,'2019-10-25 20:21:11.715636','112.38.165.245','51','稻园牌稻米油粮油米糠油绿色植物油','change','修改 goods_desc',7,5),(141,'2019-10-25 20:22:46.528020','112.38.165.245','52','融氏纯玉米胚芽油5l桶','change','修改 goods_brief 和 goods_desc',7,5),(142,'2019-10-25 20:23:05.364427','112.38.165.245','52','融氏纯玉米胚芽油5l桶','change','修改 goods_desc',7,5),(143,'2019-10-25 20:35:46.777835','112.38.165.245','50','山西黑米农家黑米4斤','change','修改 category，goods_brief，goods_desc 和 goods_front_image',7,5),(144,'2019-10-25 20:36:06.515561','112.38.165.245','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,5),(145,'2019-10-25 20:36:25.516803','112.38.165.245','50','山西黑米农家黑米4斤','change','修改 goods_desc',7,5),(146,'2019-10-25 20:43:42.990308','112.38.165.245','49','金龙鱼 东北大米5KG','change','修改 category，goods_sn，name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(147,'2019-10-25 20:43:57.845084','112.38.165.245','49','金龙鱼 东北大米5KG','change','修改 goods_desc',7,5),(148,'2019-10-25 20:46:55.884952','112.38.165.245','48','加碘精制盐 食盐 500g','change','修改 goods_sn，name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(149,'2019-10-25 20:47:09.748345','112.38.165.245','48','加碘精制盐 食盐 500g','change','修改 goods_desc',7,5),(150,'2019-10-25 20:51:16.752592','112.38.165.245','47','千禾 酱油 1L','change','修改 category，goods_sn，name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(151,'2019-10-25 20:51:30.419666','112.38.165.245','47','千禾 酱油 1L','change','修改 goods_desc',7,5),(152,'2019-10-25 21:00:29.112489','112.38.165.245','46','太太乐 鸡精 227g','change','修改 goods_sn，name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(153,'2019-10-25 21:01:20.213374','112.38.165.245','46','太太乐 鸡精 227g','change','修改 goods_desc 和 goods_front_image',7,5),(154,'2019-10-25 21:06:11.060520','112.38.165.245','46','鱼香肉丝调料  33.5g/袋','change','修改 name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(155,'2019-10-25 21:06:24.951138','112.38.165.245','46','鱼香肉丝调料  33.5g/袋','change','修改 goods_desc',7,5),(156,'2019-10-25 21:10:22.534309','112.38.165.245','45','伊利 金典纯牛奶250ml*16盒','change','修改 name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(157,'2019-10-25 21:16:55.775095','112.38.165.245','44','蒙牛 纯甄 常温风味酸牛奶 200g*24','change','修改 name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(158,'2019-10-25 21:23:04.474259','112.38.165.245','43','高钙液体奶200ml*24盒','change','修改 goods_desc 和 goods_front_image',7,5),(159,'2019-10-25 21:24:51.205415','112.38.165.245','43','飞鹤飞帆 幼儿配方奶粉 1600g','change','修改 category，name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(160,'2019-10-25 21:29:12.824084','112.38.165.245','42','木糖醇红枣早餐奶即食豆奶粉538g','change','修改 category，goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(161,'2019-10-25 21:30:11.432661','112.38.165.245','42','福建古田茶树菇  160g','change','修改 name，shop_price，goods_brief 和 goods_desc',7,5),(162,'2019-10-25 21:30:36.405271','112.38.165.245','42','福建古田茶树菇  160g','change','修改 category 和 goods_desc',7,5),(163,'2019-10-25 21:32:21.357292','112.38.165.245','41','德运全脂新鲜纯牛奶1L*10盒装整箱','change','修改 category，goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(164,'2019-10-25 21:33:01.043847','112.38.165.245','41','烟熏咸腊肉腊肠500g','change','修改 name，goods_brief 和 goods_desc',7,5),(165,'2019-10-25 21:34:53.367461','112.38.165.245','40','1元支付测试商品','change','修改 category，goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(166,'2019-10-25 21:35:36.643735','112.38.165.245','40','五香牛肉粒100g/袋','change','修改 name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(167,'2019-10-25 21:38:04.315359','112.38.165.245','39','蒙牛特仑苏有机奶250ml×12盒','change','修改 category，goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(168,'2019-10-25 21:38:52.930642','112.38.165.245','39','牛蹄筋零食小吃牛筋 香辣味200g','change','修改 name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(169,'2019-10-25 21:40:25.507928','112.38.165.245','38','蒙牛未来星儿童成长牛奶骨力型190ml*15盒','change','修改 goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(170,'2019-10-25 21:41:19.801388','112.38.165.245','38','灯影牛肉丝100g','change','修改 category，name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(171,'2019-10-25 21:42:49.078698','112.38.165.245','37','休闲零食膨化食品焦糖/奶油/椒麻味','change','修改 goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(172,'2019-10-25 21:44:07.503164','112.38.165.245','37','乐事（Lay\'s）薯片135克','change','修改 name，market_price，shop_price，goods_brief，goods_desc，is_new 和 is_hot',7,5),(173,'2019-10-25 21:46:30.898650','112.38.165.245','36','潍坊萝卜5斤/箱礼盒','change','修改 goods_brief 和 goods_desc',7,5),(174,'2019-10-25 21:49:30.995516','112.38.165.245','35','海南产精品释迦果','change','修改 category，goods_sn，name，market_price，shop_price，goods_brief，goods_desc 和 goods_front_image',7,5),(175,'2019-10-25 21:53:13.032416','112.38.165.245','34','绿鲜知 菠菜 红根菠菜 赤根菜 约400g','change','修改 goods_sn，name，goods_brief，goods_desc 和 goods_front_image',7,5),(176,'2019-10-25 21:55:55.629364','112.38.165.245','33','新鲜头茬非洲冰草冰菜','change','修改 goods_sn，goods_brief，goods_desc 和 goods_front_image',7,5),(177,'2019-10-25 21:56:56.727330','112.38.165.245','33','山西特产 新鲜紫薯2斤装','change','修改 name，market_price，shop_price，goods_brief 和 goods_desc',7,5),(178,'2019-10-25 21:59:29.207588','112.38.165.245','31','泰国菠萝蜜16-18斤1个装','change','修改 goods_sn 和 goods_desc',7,5),(179,'2019-10-25 22:00:05.231271','120.37.162.106','40','粮油副食','change','修改 desc 和 is_tab',8,1),(180,'2019-10-25 22:00:42.137896','120.37.162.106','74','休闲食品','change','修改 is_tab',8,1),(181,'2019-10-25 22:01:05.410380','120.37.162.106','102','奶类食品','change','修改 desc 和 is_tab',8,1),(182,'2019-10-25 22:01:22.333070','112.38.165.245','32','四川双流草莓新鲜水果礼盒2盒','change','修改 goods_sn，goods_brief 和 goods_desc',7,5),(183,'2019-10-25 22:02:08.984245','112.38.165.245','32','四川双流草莓新鲜水果礼盒2盒','change','修改 goods_brief 和 goods_desc',7,5),(184,'2019-10-25 22:05:34.509459','120.37.162.106','108','天然干货','change','修改 is_tab',8,1),(185,'2019-10-25 22:05:52.165854','120.37.162.106','117','精选茗茶','change','修改 is_tab',8,1),(186,'2019-10-25 22:07:06.336429','120.37.162.106',NULL,'','delete','批量删除 1 个 某一大类下的宣传商标',NULL,1),(187,'2019-10-25 22:08:14.003100','120.37.162.106','117','精选茗茶','change','修改 is_tab',8,1),(188,'2019-10-25 22:15:02.727387','120.37.162.106','102','奶类食品','change','修改 is_tab',8,1),(189,'2019-10-25 22:15:38.782580','120.37.162.106','108','天然干货','change','修改 is_tab',8,1),(190,'2019-10-25 22:16:00.441526','120.37.162.106','102','奶类食品','change','修改 is_tab',8,1),(191,'2019-10-25 22:16:16.000003','112.38.165.245','19','伊利谷粒多燕麦牛奶饮品200ml*12盒*2提','change','修改 category，goods_sn，name，goods_brief，goods_desc 和 goods_front_image',7,5),(192,'2019-10-25 22:18:35.214085','112.38.165.245','12','智力卡优奇酸奶果粒麦脆316g','change','修改 category，goods_sn，name，goods_brief，goods_desc，ship_free，goods_front_image 和 is_new',7,5),(193,'2019-10-25 22:19:03.659986','120.37.162.106','74','休闲食品','change','修改 is_tab',8,1),(194,'2019-10-25 22:20:45.444043','120.37.162.106','39','牛蹄筋零食小吃牛筋 香辣味200g','change','修改 category 和 goods_desc',7,1),(195,'2019-10-25 22:22:33.268018','120.37.162.106','39','牛蹄筋零食小吃牛筋 香辣味200g','change','修改 category',7,1),(196,'2019-10-25 22:27:23.953136','112.38.165.245','53','新希望 香蕉牛奶200ml*12盒 礼盒装','create','已添加。',7,5),(197,'2019-10-25 22:29:37.342028','112.38.165.245','54','奶酪奶片奶制品 含钙奶贝 500g','create','已添加。',7,5),(198,'2019-10-31 16:24:34.452046','121.205.119.42',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(199,'2019-10-31 17:49:49.004601','121.205.119.42',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(200,'2019-10-31 17:52:12.351576','121.205.119.42',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(201,'2019-10-31 17:55:46.396724','121.205.119.42',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(202,'2019-10-31 18:07:08.545702','121.205.119.42',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(203,'2019-11-01 22:33:34.517740','117.136.11.25',NULL,'','delete','批量删除 1 个 用户留言',NULL,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','1',1),(2,'dashboard:home:pos','',5);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-07 11:20:48
