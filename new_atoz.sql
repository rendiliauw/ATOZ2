﻿# Host: localhost  (Version 5.5.5-10.1.35-MariaDB)
# Date: 2019-03-08 21:21:31
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES (54,'default','{\"displayName\":\"App\\\\Jobs\\\\CancelOrderJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CancelOrderJob\",\"command\":\"O:23:\\\"App\\\\Jobs\\\\CancelOrderJob\\\":7:{s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2019-03-08 21:21:38.267696\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:12:\\\"Asia\\/Jakarta\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1552054898,1552054598);

#
# Structure for table "migrations"
#

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "migrations"
#

INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_03_05_023727_create_prepaids_table',1),(4,'2019_03_05_032618_create_orders_table',1),(5,'2019_03_05_064357_create_order_prepaid',1),(6,'2019_03_05_132353_create_products',2),(7,'2019_03_05_132729_create_order_product',3),(8,'2019_03_06_013520_create_order_product',4),(9,'2019_03_07_041900_create_orderables',5),(10,'2019_03_07_102621_create_jobs_table',6);

#
# Structure for table "orderables"
#

DROP TABLE IF EXISTS `orderables`;
CREATE TABLE `orderables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `orderable_id` int(10) unsigned NOT NULL,
  `orderable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "orderables"
#

INSERT INTO `orderables` VALUES (1,1,1,'App\\Prepaid',NULL,NULL,NULL),(2,2,2,'App\\Prepaid',NULL,NULL,NULL),(4,4,2,'App\\Product',NULL,NULL,NULL),(5,5,3,'App\\Prepaid',NULL,NULL,NULL),(6,6,4,'App\\Prepaid',NULL,NULL,NULL),(7,7,5,'App\\Prepaid',NULL,NULL,NULL),(8,8,6,'App\\Prepaid',NULL,NULL,NULL),(9,9,7,'App\\Prepaid',NULL,NULL,NULL),(10,10,8,'App\\Prepaid',NULL,NULL,NULL),(11,11,9,'App\\Prepaid',NULL,NULL,NULL),(12,12,10,'App\\Prepaid',NULL,NULL,NULL),(13,13,11,'App\\Prepaid',NULL,NULL,NULL),(14,14,12,'App\\Prepaid',NULL,NULL,NULL),(15,15,3,'App\\Product',NULL,NULL,NULL),(16,16,4,'App\\Product',NULL,NULL,NULL),(17,17,13,'App\\Prepaid',NULL,NULL,NULL),(18,18,14,'App\\Prepaid',NULL,NULL,NULL),(19,19,15,'App\\Prepaid',NULL,NULL,NULL),(20,25,18,'App\\Prepaid',NULL,NULL,NULL),(21,27,9,'App\\Product',NULL,NULL,NULL),(22,28,10,'App\\Product',NULL,NULL,NULL),(23,29,11,'App\\Product',NULL,NULL,NULL),(24,30,12,'App\\Product',NULL,NULL,NULL),(25,31,13,'App\\Product',NULL,NULL,NULL),(26,32,14,'App\\Product',NULL,NULL,NULL),(27,33,19,'App\\Prepaid',NULL,NULL,NULL),(28,34,20,'App\\Prepaid',NULL,NULL,NULL),(29,35,15,'App\\Product',NULL,NULL,NULL),(30,36,16,'App\\Product',NULL,NULL,NULL),(31,37,17,'App\\Product',NULL,NULL,NULL),(32,38,18,'App\\Product',NULL,NULL,NULL),(33,39,19,'App\\Product',NULL,NULL,NULL),(34,40,20,'App\\Product',NULL,NULL,NULL),(35,41,21,'App\\Product',NULL,NULL,NULL),(36,42,22,'App\\Product',NULL,NULL,NULL),(37,43,23,'App\\Product',NULL,NULL,NULL),(38,44,24,'App\\Product',NULL,NULL,NULL),(39,45,25,'App\\Product',NULL,NULL,NULL),(40,46,26,'App\\Product',NULL,NULL,NULL),(41,47,27,'App\\Product',NULL,NULL,NULL),(42,48,28,'App\\Product',NULL,NULL,NULL),(43,49,29,'App\\Product',NULL,NULL,NULL),(44,50,30,'App\\Product',NULL,NULL,NULL),(45,51,31,'App\\Product',NULL,NULL,NULL),(46,52,33,'App\\Product',NULL,NULL,NULL),(47,53,34,'App\\Product',NULL,NULL,NULL),(48,55,22,'App\\Prepaid',NULL,NULL,NULL),(49,56,23,'App\\Prepaid',NULL,NULL,NULL),(50,57,24,'App\\Prepaid',NULL,NULL,NULL),(51,58,25,'App\\Prepaid',NULL,NULL,NULL),(52,59,26,'App\\Prepaid',NULL,NULL,NULL),(53,60,27,'App\\Prepaid',NULL,NULL,NULL),(54,62,29,'App\\Prepaid',NULL,NULL,NULL),(55,63,30,'App\\Prepaid',NULL,NULL,NULL),(56,64,31,'App\\Prepaid',NULL,NULL,NULL),(57,65,32,'App\\Prepaid',NULL,NULL,NULL),(58,66,33,'App\\Prepaid',NULL,NULL,NULL),(59,67,34,'App\\Prepaid',NULL,NULL,NULL),(60,68,35,'App\\Prepaid',NULL,NULL,NULL),(61,70,36,'App\\Product',NULL,NULL,NULL),(62,71,36,'App\\Prepaid',NULL,NULL,NULL),(63,72,37,'App\\Prepaid',NULL,NULL,NULL),(64,73,37,'App\\Product',NULL,NULL,NULL),(65,74,38,'App\\Prepaid',NULL,NULL,NULL),(66,75,39,'App\\Prepaid',NULL,NULL,NULL),(67,76,40,'App\\Prepaid',NULL,NULL,NULL),(68,77,41,'App\\Prepaid',NULL,NULL,NULL),(69,78,42,'App\\Prepaid',NULL,NULL,NULL),(70,79,43,'App\\Prepaid',NULL,NULL,NULL),(71,80,44,'App\\Prepaid',NULL,NULL,NULL),(72,81,45,'App\\Prepaid',NULL,NULL,NULL),(73,82,46,'App\\Prepaid',NULL,NULL,NULL),(74,83,47,'App\\Prepaid',NULL,NULL,NULL),(75,84,48,'App\\Prepaid',NULL,NULL,NULL),(76,85,49,'App\\Prepaid',NULL,NULL,NULL),(77,86,50,'App\\Prepaid',NULL,NULL,NULL),(78,87,51,'App\\Prepaid',NULL,NULL,NULL),(79,88,52,'App\\Prepaid',NULL,NULL,NULL),(80,89,53,'App\\Prepaid',NULL,NULL,NULL),(81,90,38,'App\\Product',NULL,NULL,NULL),(82,91,39,'App\\Product',NULL,NULL,NULL),(83,92,40,'App\\Product',NULL,NULL,NULL),(84,93,41,'App\\Product',NULL,NULL,NULL),(85,94,42,'App\\Product',NULL,NULL,NULL),(86,95,43,'App\\Product',NULL,NULL,NULL),(87,96,44,'App\\Product',NULL,NULL,NULL),(88,97,54,'App\\Prepaid',NULL,NULL,NULL),(89,98,45,'App\\Product',NULL,NULL,NULL),(90,99,46,'App\\Product',NULL,NULL,NULL),(91,100,55,'App\\Prepaid',NULL,NULL,NULL),(92,101,56,'App\\Prepaid',NULL,NULL,NULL),(93,102,57,'App\\Prepaid',NULL,NULL,NULL),(94,103,58,'App\\Prepaid',NULL,NULL,NULL),(95,104,47,'App\\Product',NULL,NULL,NULL),(97,106,60,'App\\Prepaid',NULL,NULL,NULL),(98,107,48,'App\\Product',NULL,NULL,NULL),(99,108,49,'App\\Product',NULL,NULL,NULL),(100,109,61,'App\\Prepaid',NULL,NULL,NULL),(101,110,62,'App\\Prepaid',NULL,NULL,NULL),(102,111,50,'App\\Product',NULL,NULL,NULL),(103,112,51,'App\\Product',NULL,NULL,NULL),(104,113,52,'App\\Product',NULL,NULL,NULL),(105,114,53,'App\\Product',NULL,NULL,NULL),(106,115,54,'App\\Product',NULL,NULL,NULL),(107,116,63,'App\\Prepaid',NULL,NULL,NULL),(108,117,64,'App\\Prepaid',NULL,NULL,NULL),(109,118,55,'App\\Product',NULL,NULL,NULL),(110,119,56,'App\\Product',NULL,NULL,NULL),(111,120,65,'App\\Prepaid',NULL,NULL,NULL),(112,121,66,'App\\Prepaid',NULL,NULL,NULL),(113,122,57,'App\\Product',NULL,NULL,NULL),(118,127,70,'App\\Prepaid',NULL,NULL,NULL),(119,128,71,'App\\Prepaid',NULL,NULL,NULL),(120,129,72,'App\\Prepaid',NULL,NULL,NULL),(121,130,73,'App\\Prepaid',NULL,NULL,NULL),(122,131,59,'App\\Product',NULL,NULL,NULL);

#
# Structure for table "password_resets"
#

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "password_resets"
#


#
# Structure for table "prepaids"
#

DROP TABLE IF EXISTS `prepaids`;
CREATE TABLE `prepaids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "prepaids"
#

INSERT INTO `prepaids` VALUES (2,'100000','082311458012',100000.00,'2019-03-07 04:56:09','2019-03-07 04:56:09'),(3,'50000','085883539077',50000.00,'2019-03-07 04:58:38','2019-03-07 04:58:38'),(4,'100000','085883539077',100000.00,'2019-03-07 05:00:38','2019-03-07 05:00:38'),(5,'10000','081345679999',10000.00,'2019-03-07 05:01:09','2019-03-07 05:01:09'),(6,'100000','082311908008',100000.00,'2019-03-07 05:01:28','2019-03-07 05:01:28'),(7,'10000','082311458012',10000.00,'2019-03-07 05:40:48','2019-03-07 05:40:48'),(8,'10000','082311458012',10000.00,'2019-03-07 05:59:51','2019-03-07 05:59:51'),(9,'10000','082311458012',10000.00,'2019-03-07 06:03:35','2019-03-07 06:03:35'),(10,NULL,'082311458012',NULL,'2019-03-07 06:03:58','2019-03-07 06:03:58'),(11,'10000','082311458012',10000.00,'2019-03-07 06:04:38','2019-03-07 06:04:38'),(12,'50000','082311458012',50000.00,'2019-03-07 06:05:25','2019-03-07 06:05:25'),(13,'50000','082311458012',50000.00,'2019-03-07 06:41:20','2019-03-07 06:41:20'),(14,'100000','082311458012',100000.00,'2019-03-07 06:41:49','2019-03-07 06:41:49'),(15,'10000','082311458012',10000.00,'2019-03-07 06:42:41','2019-03-07 06:42:41'),(16,'10000','082311458012',10000.00,'2019-03-07 11:22:18','2019-03-07 11:22:18'),(17,'100000','082311458012',100000.00,'2019-03-07 11:26:42','2019-03-07 11:26:42'),(18,'10000','082311458012',10000.00,'2019-03-07 11:28:22','2019-03-07 11:28:22'),(19,'10000','082311458012',10000.00,'2019-03-07 15:51:34','2019-03-07 15:51:34'),(20,'50000','085883539077',50000.00,'2019-03-07 15:54:37','2019-03-07 15:54:37'),(21,'10000','082311458012',10000.00,'2019-03-07 17:13:19','2019-03-07 17:13:19'),(22,'10000','082311458012',10000.00,'2019-03-07 17:13:33','2019-03-07 17:13:33'),(23,'50000','085883539077',50000.00,'2019-03-07 17:17:33','2019-03-07 17:17:33'),(24,'10000','082311458012',10000.00,'2019-03-07 17:18:38','2019-03-07 17:18:38'),(25,'10000','082311458012',10000.00,'2019-03-07 17:19:45','2019-03-07 17:19:45'),(26,'50000','082311458012',50000.00,'2019-03-07 17:21:08','2019-03-07 17:21:08'),(27,'50000','082311458012',50000.00,'2019-03-07 17:24:53','2019-03-07 17:24:53'),(28,'10000','082311458012',10000.00,'2019-03-07 17:28:50','2019-03-07 17:28:50'),(29,'10000','082311458012',10000.00,'2019-03-07 17:29:04','2019-03-07 17:29:04'),(30,'50000','082311458012',50000.00,'2019-03-07 17:32:04','2019-03-07 17:32:04'),(31,'50000','082311458012',50000.00,'2019-03-07 17:32:29','2019-03-07 17:32:29'),(32,'50000','082311458012',50000.00,'2019-03-07 17:36:14','2019-03-07 17:36:14'),(33,'50000','082311458012',50000.00,'2019-03-07 17:37:04','2019-03-07 17:37:04'),(34,'50000','081345679999',50000.00,'2019-03-07 17:43:05','2019-03-07 17:43:05'),(35,'10000','082311458012',10000.00,'2019-03-07 17:45:51','2019-03-07 17:45:51'),(36,'10000','082311458012',10000.00,'2019-03-07 17:49:36','2019-03-07 17:49:36'),(37,'100000','085883539077',100000.00,'2019-03-07 17:51:14','2019-03-07 17:51:14'),(38,'10000','082311458012',10000.00,'2019-03-07 17:53:06','2019-03-07 17:53:06'),(39,'10000','085883539077',10000.00,'2019-03-07 17:54:32','2019-03-07 17:54:32'),(40,'10000','082311458012',10000.00,'2019-03-07 17:58:44','2019-03-07 17:58:44'),(41,'50000','082311458012',50000.00,'2019-03-07 17:59:12','2019-03-07 17:59:12'),(42,'10000','082311458012',10000.00,'2019-03-08 07:03:18','2019-03-08 07:03:18'),(43,'50000','082311458012',50000.00,'2019-03-08 15:26:49','2019-03-08 15:26:49'),(44,'50000','082311458012',50000.00,'2019-03-08 15:28:06','2019-03-08 15:28:06'),(45,'10000','082311458012',10000.00,'2019-03-08 15:29:42','2019-03-08 15:29:42'),(46,'50000','082311458012',50000.00,'2019-03-08 15:30:36','2019-03-08 15:30:36'),(47,'10000','082311458012',10000.00,'2019-03-08 15:32:11','2019-03-08 15:32:11'),(48,'100000','082311458012',100000.00,'2019-03-08 15:32:48','2019-03-08 15:32:48'),(49,'50000','085883539077',50000.00,'2019-03-08 15:33:02','2019-03-08 15:33:02'),(50,'10000','082311458012',10000.00,'2019-03-08 15:34:07','2019-03-08 15:34:07'),(51,'100000','082311458012',100000.00,'2019-03-08 15:34:27','2019-03-08 15:34:27'),(52,'100000','081345679999',100000.00,'2019-03-08 15:34:39','2019-03-08 15:34:39'),(53,'100000','085883539077',100000.00,'2019-03-08 15:34:56','2019-03-08 15:34:56'),(54,'50000','085883539077',50000.00,'2019-03-08 15:51:02','2019-03-08 15:51:02'),(55,'50000','082311458012',50000.00,'2019-03-08 16:05:15','2019-03-08 16:05:15'),(56,'10000','082311458012',10000.00,'2019-03-08 16:08:11','2019-03-08 16:08:11'),(57,'50000','082311458012',50000.00,'2019-03-08 16:10:39','2019-03-08 16:10:39'),(58,'50000','085883539077',50000.00,'2019-03-08 16:11:38','2019-03-08 16:11:38'),(59,'50000','082311458012',50000.00,'2019-03-08 16:15:42','2019-03-08 16:15:42'),(60,'10000','085883539077',10000.00,'2019-03-08 16:17:04','2019-03-08 16:17:04'),(61,'10000','082311458012',10000.00,'2019-03-08 16:59:35','2019-03-08 16:59:35'),(62,'10000','082311458012',10000.00,'2019-03-08 17:01:38','2019-03-08 17:01:38'),(63,'50000','085883539077',50000.00,'2019-03-08 17:22:04','2019-03-08 17:22:04'),(64,'50000','082311458012',50000.00,'2019-03-08 17:24:34','2019-03-08 17:24:34'),(65,'10000','082311458012',10000.00,'2019-03-08 17:34:46','2019-03-08 17:34:46'),(66,'10000','085883539077',10000.00,'2019-03-08 17:35:40','2019-03-08 17:35:40'),(67,'50000','085883539077',50000.00,'2019-03-08 18:08:14','2019-03-08 18:08:14'),(68,'50000','085883539077',50000.00,'2019-03-08 18:08:46','2019-03-08 18:08:46'),(69,'10000','081345679999',10000.00,'2019-03-08 18:52:45','2019-03-08 18:52:45'),(70,'10000','081345679999',10000.00,'2019-03-08 18:53:28','2019-03-08 18:53:28'),(71,'50000','081345568099',50000.00,'2019-03-08 19:47:05','2019-03-08 19:47:05'),(72,'50000','081311458012',50000.00,'2019-03-08 21:15:48','2019-03-08 21:15:48'),(73,'50000','081311458012',50000.00,'2019-03-08 21:16:13','2019-03-08 21:16:13');

#
# Structure for table "products"
#

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "products"
#

INSERT INTO `products` VALUES (1,'Cas hanphone lenovo','Jl. Muwardi no 5. grogol petamburan jarakta barat',150000.00,'2019-03-07 04:57:54','2019-03-07 04:57:54'),(2,'Charger Xiaomi Type-C','Jl. palapa no 5',150000.00,'2019-03-07 04:58:28','2019-03-07 04:58:28'),(3,'Charger Xiaomi Type-C','Jl.mangga 2 b 39 Greenville',30000.00,'2019-03-07 06:19:14','2019-03-07 06:19:14'),(4,'Charger Xiaomi Type-C','Jl. mangga 8 B 17 Greenville - jakarta barat',150000.00,'2019-03-07 06:40:50','2019-03-07 06:40:50'),(5,'Charger Xiaomi Type-C','Jl. mangga 2 B 39 Greenville - jakarta barat',150000.00,'2019-03-07 11:15:01','2019-03-07 11:15:01'),(6,'Charger Xiaomi Type-C','Jl. mangga 2 b 39 greenville - jakarta barat',150000.00,'2019-03-07 11:21:37','2019-03-07 11:21:37'),(7,'Cas hanphone lenovo','Jl. Tj duren utara 9',150000.00,'2019-03-07 11:23:38','2019-03-07 11:23:38'),(8,'Charger Xiaomi Type-C','Jl. mangga 2 B 40 greenville - jakarta barat',230000.00,'2019-03-07 11:29:31','2019-03-07 11:29:31'),(9,'Charger Xiaomi Type-C','Jl. mangga 2 B 10 Greenville - jakarta barat',120000.00,'2019-03-07 11:30:09','2019-03-07 11:30:09'),(10,'Charger Xiaomi Type-C','Jl. muwardi No .43 Grogol petamburan - jakarta barat',210000.00,'2019-03-07 11:33:00','2019-03-07 11:33:00'),(11,'Charger Xiaomi Type-C','Jl. mangga 2 B 39 Greenville - jakarta barat',210000.00,'2019-03-07 12:04:20','2019-03-07 12:04:20'),(12,'Charger Xiaomi Type-C','Jl. mangga 2 B 39 greenville - jakarta barat',150000.00,'2019-03-07 15:42:09','2019-03-07 15:42:09'),(13,'Charger Xiaomi Type-C','Jl. mangga 2 B 9 Greenville - jakarta barat',150000.00,'2019-03-07 15:45:53','2019-03-07 15:45:53'),(14,'Charger Xiaomi Type-C','Jl. mangga 2 b 39',30000.00,'2019-03-07 15:50:18','2019-03-07 15:50:18'),(15,'Charger Xiaomi Type-C','JL. mangga 2 b 39 greenville - jakart a barat',123445.00,'2019-03-07 15:56:29','2019-03-07 15:56:29'),(16,'Cas hanphone lenovo','Jl. mangga 2 b 39 greenville - jarkata barat',250000.00,'2019-03-07 15:57:55','2019-03-07 15:57:55'),(17,'Cas hanphone lenovo','Kkkkkllllllllllllllllllllll',150000.00,'2019-03-07 16:00:25','2019-03-07 16:00:25'),(18,'Charger Xiaomi Type-C','Jl. mangga 2 b 39 greenville - jakarta barat',250000.00,'2019-03-07 16:11:10','2019-03-07 16:11:10'),(19,'Charger Xiaomi Type-C','Jl. manggadfsfdsf',150000.00,'2019-03-07 16:15:17','2019-03-07 16:15:17'),(20,'Charger Xiaomi Type-C','Jl. manggadfsfdsf',150000.00,'2019-03-07 16:15:27','2019-03-07 16:15:27'),(21,'Charger Xiaomi Type-C','Jl. manggadfsfdsf',150000.00,'2019-03-07 16:15:58','2019-03-07 16:15:58'),(22,'Charger Xiaomi Type-C','Jl. manggadfsfdsf',150000.00,'2019-03-07 16:16:18','2019-03-07 16:16:18'),(23,'Charger Xiaomi Type-C','Jl. manggadfsfdsf',150000.00,'2019-03-07 16:16:43','2019-03-07 16:16:43'),(24,'Cas hanphone lenovo','JL. tanjung duren utara 10 grogol petamburan - jakarta barat',250000.00,'2019-03-07 16:19:41','2019-03-07 16:19:41'),(25,'Cas hanphone lenovo','Jl. ketapang 1 no 240 jakarta utara',120000.00,'2019-03-07 16:28:26','2019-03-07 16:28:26'),(26,'Cas hanphone lenovo','Jl. ketapang 1 no 240 jakarta utara',120000.00,'2019-03-07 16:28:49','2019-03-07 16:28:49'),(27,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-07 16:31:37','2019-03-07 16:31:37'),(28,'Cas hanphone lenovo','Jl. mangga 2 b 39 gree;',30000.00,'2019-03-07 16:50:26','2019-03-07 16:50:26'),(29,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-07 16:52:23','2019-03-07 16:52:23'),(30,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',30000.00,'2019-03-07 16:53:51','2019-03-07 16:53:51'),(31,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-07 16:54:48','2019-03-07 16:54:48'),(32,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',30000.00,'2019-03-07 16:56:37','2019-03-07 16:56:37'),(33,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',30000.00,'2019-03-07 16:57:04','2019-03-07 16:57:04'),(34,'Charger Xiaomi Type-C','Jl. mangga 15 No 687 Greenville - jakarta barat',150000.00,'2019-03-07 17:04:39','2019-03-07 17:04:39'),(35,'Charger Xiaomi Type-C','Jl. mangga 8 no 140 greenville - jakarta  barat',250000.00,'2019-03-07 17:47:01','2019-03-07 17:47:01'),(36,'Charger Xiaomi Type-C','Jl. mangga 8 no 140 greenville - jakarta  barat',250000.00,'2019-03-07 17:47:32','2019-03-07 17:47:32'),(37,'Cas hanphone lenovo','Jl. tj duren raya no 4',120000.00,'2019-03-07 17:52:15','2019-03-07 17:52:15'),(38,'Charger Xiaomi Type-C','Jl. mangga 2 B 39 greenville - jakarta barat',150000.00,'2019-03-08 15:35:44','2019-03-08 15:35:44'),(39,'Cas hanphone lenovo','Jl. mangga 2 B 9 greenville - jakarta barat',250000.00,'2019-03-08 15:36:37','2019-03-08 15:36:37'),(40,'Charger Xiaomi Type-C','Jl. Testing jakarta barat',150000.00,'2019-03-08 15:37:24','2019-03-08 15:37:24'),(41,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',30000.00,'2019-03-08 15:38:41','2019-03-08 15:38:41'),(42,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',120000.00,'2019-03-08 15:40:22','2019-03-08 15:40:22'),(43,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',30000.00,'2019-03-08 15:41:08','2019-03-08 15:41:08'),(44,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-08 15:49:07','2019-03-08 15:49:07'),(45,'Charger Xiaomi Type-C','Jl. mangga 2 b 39 greenville - jarkata barat',210000.00,'2019-03-08 15:56:01','2019-03-08 15:56:01'),(46,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-08 16:04:37','2019-03-08 16:04:37'),(47,'Charger Xiaomi Type-C','Jl. mangga 2 b 39',120000.00,'2019-03-08 16:12:17','2019-03-08 16:12:17'),(48,'Cas hanphone lenovo','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-08 16:18:22','2019-03-08 16:18:22'),(49,'Charger Xiaomi Type-C','Jl. mangga 2',150000.00,'2019-03-08 16:19:31','2019-03-08 16:19:31'),(50,'Charger Xiaomi Type-C','Jl. mangga 2 B 39 greenville - jakarta barat',30000.00,'2019-03-08 17:03:59','2019-03-08 17:03:59'),(51,'Cas hanphone lenovo','Jl. mangga 2 B 39 greenville - jakarta barat',150000.00,'2019-03-08 17:05:29','2019-03-08 17:05:29'),(52,'Charger Xiaomi Type-C','Dddddddddddddddddddddddd',150000.00,'2019-03-08 17:06:10','2019-03-08 17:06:10'),(53,'Charger Xiaomi Type-C','Jl. mangga 2 b 39 greenville - jarkat barat',200000.00,'2019-03-08 17:15:19','2019-03-08 17:15:19'),(54,'Charger Xiaomi Type-C','Jl. Tanjung duren utara no 4 grogol petamburan - jakarta barat',150000.00,'2019-03-08 17:20:21','2019-03-08 17:20:21'),(55,'Power bank Mi 20000 Mah','Jl tomang raya no 4 jakarta barat',350000.00,'2019-03-08 17:25:13','2019-03-08 17:25:13'),(56,'Charger Xiaomi Type-C','Jl. mangga 8 no 17 greenville - jakarta barat',30000.00,'2019-03-08 17:31:23','2019-03-08 17:31:23'),(57,'Cas hanphone lenovo','Jl. mangga 2 B 50  greenville - jakarta barat',230000.00,'2019-03-08 17:36:15','2019-03-08 17:36:15'),(58,'Cas hanphone lenovo','Jl. kepa duri no 13 Greenville - jakarta barat',350000.00,'2019-03-08 18:06:16','2019-03-08 18:06:16'),(59,'Charger Xiaomi Type-C','Test 1234567890',240000.00,'2019-03-08 21:16:38','2019-03-08 21:16:38');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'Customer1','customer1@gmail.com',NULL,'$2y$10$UePr3FqiBv3dGmyP8MCC/ugAYwqHzNvhV7e5JrhlkKl.0UsMpIRiK',NULL,'2019-03-05 08:21:13','2019-03-05 08:21:13'),(2,'customer2','customer2@gmail.com',NULL,'$2y$10$9mdWyW/xpqbHUxCxdMHuGOYbyRZVySB7mlf6chj3S2MxErBYrNCB.',NULL,'2019-03-06 15:22:10','2019-03-06 15:22:10'),(3,'customer3','customer3@gmail.com',NULL,'$2y$10$TDjrFq9t9BCY6ifwRJygsORdHt6vQB55rzV/twjuYeNHgLrgPLohi',NULL,'2019-03-07 06:27:34','2019-03-07 06:27:34');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `shipping_code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('UNPAID','CANCELED','FAILED','SUCCESS') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UNPAID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `user_relationship` (`user_id`),
  CONSTRAINT `user_relationship` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (2,1,'2190703171',105000.00,NULL,'SUCCESS','2019-03-07 04:56:09','2019-03-07 04:57:27',NULL),(4,1,'4930703431',160000.00,NULL,'SUCCESS','2019-03-07 04:58:28','2019-03-07 05:00:57',NULL),(5,1,'3210703591',52500.00,NULL,'SUCCESS','2019-03-07 04:58:38','2019-03-07 05:00:52',NULL),(6,1,'4460703801',105000.00,NULL,'SUCCESS','2019-03-07 05:00:38','2019-03-07 05:00:46',NULL),(7,1,'3990703221',10500.00,NULL,'SUCCESS','2019-03-07 05:01:09','2019-03-07 05:01:15',NULL),(8,1,'4670703491',105000.00,NULL,'SUCCESS','2019-03-07 05:01:28','2019-03-07 05:01:38',NULL),(9,1,'4700703591',10500.00,NULL,'SUCCESS','2019-03-07 05:40:48','2019-03-07 05:51:20',NULL),(10,1,'4680703841',10500.00,NULL,'SUCCESS','2019-03-07 05:59:51','2019-03-07 06:03:53',NULL),(11,1,'4090703801',10500.00,NULL,'SUCCESS','2019-03-07 06:03:35','2019-03-07 06:03:48',NULL),(12,1,'2400703861',0.00,NULL,'SUCCESS','2019-03-07 06:03:58','2019-03-07 06:05:11',NULL),(13,1,'1800703681',10500.00,NULL,'SUCCESS','2019-03-07 06:04:38','2019-03-07 06:05:16',NULL),(14,1,'2790703301',52500.00,NULL,'SUCCESS','2019-03-07 06:05:25','2019-03-07 06:05:38',NULL),(15,1,'4010703161',40000.00,NULL,'SUCCESS','2019-03-07 06:19:14','2019-03-07 06:19:21',NULL),(16,1,'3750703321',160000.00,NULL,'SUCCESS','2019-03-07 06:40:50','2019-03-07 06:42:10',NULL),(17,1,'3280703261',52500.00,NULL,'SUCCESS','2019-03-07 06:41:20','2019-03-07 06:42:04',NULL),(18,1,'2770703921',105000.00,NULL,'SUCCESS','2019-03-07 06:41:49','2019-03-07 06:41:59',NULL),(19,1,'1650703901',10500.00,NULL,'SUCCESS','2019-03-07 06:42:41','2019-03-07 11:17:11',NULL),(20,1,'1560703861',160000.00,NULL,'SUCCESS','2019-03-07 11:15:01','2019-03-07 11:17:06',NULL),(21,1,'2070703621',160000.00,NULL,'SUCCESS','2019-03-07 11:21:37','2019-03-07 11:23:11',NULL),(22,1,'1610703121',10500.00,NULL,'SUCCESS','2019-03-07 11:22:18','2019-03-07 11:23:06',NULL),(23,1,'3110703521',160000.00,NULL,'SUCCESS','2019-03-07 11:23:38','2019-03-07 11:25:32',NULL),(24,1,'1650703441',105000.00,NULL,'SUCCESS','2019-03-07 11:26:42','2019-03-07 11:28:59',NULL),(25,1,'4450703421',10500.00,NULL,'SUCCESS','2019-03-07 11:28:22','2019-03-07 11:28:51',NULL),(26,1,'4280703581',240000.00,NULL,'SUCCESS','2019-03-07 11:29:31','2019-03-07 11:29:43',NULL),(27,1,'4190703721',130000.00,NULL,'SUCCESS','2019-03-07 11:30:09','2019-03-07 11:31:03',NULL),(28,1,'2860703391',220000.00,NULL,'SUCCESS','2019-03-07 11:33:00','2019-03-07 11:33:12',NULL),(29,1,'1450703731',220000.00,NULL,'SUCCESS','2019-03-07 12:04:20','2019-03-07 12:08:14',NULL),(30,1,'1230703771',160000.00,NULL,'SUCCESS','2019-03-07 15:42:09','2019-03-07 15:42:38',NULL),(31,1,'1450703871',160000.00,NULL,'SUCCESS','2019-03-07 15:45:53','2019-03-07 15:46:26',NULL),(32,1,'1030703701',40000.00,NULL,'SUCCESS','2019-03-07 15:50:18','2019-03-07 15:50:47',NULL),(33,1,'4100703931',10500.00,NULL,'SUCCESS','2019-03-07 15:51:34','2019-03-07 15:51:49',NULL),(34,1,'4140703181',52500.00,NULL,'CANCELED','2019-03-07 15:54:37','2019-03-07 15:54:37',NULL),(35,1,'1860703841',133445.00,NULL,'CANCELED','2019-03-07 15:56:29','2019-03-07 15:56:29',NULL),(36,1,'2940703301',260000.00,NULL,'CANCELED','2019-03-07 15:57:55','2019-03-07 15:57:55',NULL),(37,1,'3920703121',160000.00,NULL,'CANCELED','2019-03-07 16:00:25','2019-03-07 16:00:25',NULL),(38,1,'4440703921',260000.00,NULL,'CANCELED','2019-03-07 16:11:10','2019-03-07 16:11:10',NULL),(39,1,'2300703331',160000.00,NULL,'CANCELED','2019-03-07 16:15:17','2019-03-07 16:15:17',NULL),(40,1,'4870703631',160000.00,NULL,'CANCELED','2019-03-07 16:15:27','2019-03-07 16:15:27',NULL),(41,1,'4640703511',160000.00,NULL,'CANCELED','2019-03-07 16:15:58','2019-03-07 16:15:58',NULL),(42,1,'1830703411',160000.00,NULL,'CANCELED','2019-03-07 16:16:18','2019-03-07 16:16:18',NULL),(43,1,'3490703581',160000.00,NULL,'CANCELED','2019-03-07 16:16:43','2019-03-07 16:16:43',NULL),(44,1,'2560703611',260000.00,NULL,'CANCELED','2019-03-07 16:19:41','2019-03-07 16:19:41',NULL),(45,1,'1750703901',130000.00,NULL,'CANCELED','2019-03-07 16:28:26','2019-03-07 16:28:26',NULL),(46,1,'2100703851',130000.00,NULL,'CANCELED','2019-03-07 16:28:49','2019-03-07 16:28:49',NULL),(47,1,'1020703721',160000.00,NULL,'CANCELED','2019-03-07 16:31:37','2019-03-07 16:31:37',NULL),(48,1,'4810703621',40000.00,NULL,'CANCELED','2019-03-07 16:50:26','2019-03-07 16:50:26',NULL),(49,1,'2260703661',160000.00,NULL,'CANCELED','2019-03-07 16:52:23','2019-03-07 16:52:23',NULL),(50,1,'2790703551',40000.00,NULL,'CANCELED','2019-03-07 16:53:51','2019-03-07 16:53:51',NULL),(51,1,'2500703431',160000.00,NULL,'CANCELED','2019-03-07 16:54:48','2019-03-07 16:54:48',NULL),(52,1,'2020703111',40000.00,NULL,'CANCELED','2019-03-07 16:57:04','2019-03-07 16:57:04',NULL),(53,1,'2490703271',160000.00,NULL,'CANCELED','2019-03-07 17:04:39','2019-03-07 17:04:39',NULL),(54,1,'1460703401',10500.00,NULL,'CANCELED','2019-03-07 17:13:19','2019-03-07 17:13:19',NULL),(55,1,'2220703421',10500.00,NULL,'CANCELED','2019-03-07 17:13:33','2019-03-07 17:13:33',NULL),(56,1,'1290703441',52500.00,NULL,'CANCELED','2019-03-07 17:17:33','2019-03-07 17:17:33',NULL),(57,1,'2210703561',10500.00,NULL,'CANCELED','2019-03-07 17:18:38','2019-03-07 17:18:38',NULL),(58,1,'1760703281',10500.00,NULL,'CANCELED','2019-03-07 17:19:45','2019-03-07 17:19:45',NULL),(59,1,'4480703781',52500.00,NULL,'CANCELED','2019-03-07 17:21:08','2019-03-07 17:21:08',NULL),(60,1,'1660703851',52500.00,NULL,'CANCELED','2019-03-07 17:24:53','2019-03-07 17:24:53',NULL),(61,1,'2530703831',10500.00,NULL,'CANCELED','2019-03-07 17:28:50','2019-03-07 17:28:50',NULL),(62,1,'4080703861',10500.00,NULL,'SUCCESS','2019-03-07 17:29:04','2019-03-07 17:30:08',NULL),(63,1,'4480703451',52500.00,NULL,'CANCELED','2019-03-07 17:32:04','2019-03-07 17:32:04',NULL),(64,1,'2790703861',52500.00,NULL,'SUCCESS','2019-03-07 17:32:29','2019-03-07 17:32:37',NULL),(65,1,'4740703691',52500.00,NULL,'CANCELED','2019-03-07 17:36:14','2019-03-07 17:36:14',NULL),(66,1,'4820703831',52500.00,NULL,'CANCELED','2019-03-07 17:37:04','2019-03-07 17:37:04',NULL),(67,1,'2610703151',52500.00,NULL,'CANCELED','2019-03-07 17:43:05','2019-03-07 17:43:05',NULL),(68,1,'4010703271',10500.00,NULL,'CANCELED','2019-03-07 17:45:51','2019-03-07 17:45:51',NULL),(69,1,'4310703491',260000.00,NULL,'CANCELED','2019-03-07 17:47:01','2019-03-07 17:47:01',NULL),(70,1,'2050703821',260000.00,NULL,'CANCELED','2019-03-07 17:47:32','2019-03-07 17:47:32',NULL),(71,1,'4790703971',10500.00,NULL,'CANCELED','2019-03-07 17:49:36','2019-03-07 17:49:36',NULL),(72,1,'1260703921',105000.00,NULL,'CANCELED','2019-03-07 17:51:14','2019-03-07 17:51:14',NULL),(73,1,'2260703241',130000.00,NULL,'CANCELED','2019-03-07 17:52:15','2019-03-07 17:52:15',NULL),(74,1,'2540703811',10500.00,NULL,'SUCCESS','2019-03-07 17:53:06','2019-03-07 17:53:16',NULL),(75,1,'4790703991',10500.00,NULL,'CANCELED','2019-03-07 17:54:32','2019-03-07 17:54:32',NULL),(76,1,'2040703831',10500.00,NULL,'CANCELED','2019-03-07 17:58:44','2019-03-07 17:58:44',NULL),(77,2,'1780703421',52500.00,NULL,'SUCCESS','2019-03-07 17:59:12','2019-03-07 18:03:28',NULL),(78,1,'4650803551',10500.00,NULL,'CANCELED','2019-03-08 07:03:18','2019-03-08 07:03:18',NULL),(79,1,'3200803791',52500.00,NULL,'SUCCESS','2019-03-08 15:26:49','2019-03-08 15:27:02',NULL),(80,1,'2360803531',52500.00,NULL,'SUCCESS','2019-03-08 15:28:06','2019-03-08 15:28:11',NULL),(81,1,'2840803271',10500.00,NULL,'SUCCESS','2019-03-08 15:29:42','2019-03-08 15:29:48',NULL),(82,1,'4220803371',52500.00,NULL,'SUCCESS','2019-03-08 15:30:36','2019-03-08 15:30:42',NULL),(83,1,'2710803371',10500.00,NULL,'FAILED','2019-03-08 15:32:11','2019-03-08 15:32:36',NULL),(84,1,'2040803531',105000.00,NULL,'SUCCESS','2019-03-08 15:32:48','2019-03-08 15:32:53',NULL),(85,1,'4610803681',52500.00,NULL,'SUCCESS','2019-03-08 15:33:02','2019-03-08 15:33:07',NULL),(86,1,'2330803321',10500.00,NULL,'FAILED','2019-03-08 15:34:07','2019-03-08 15:34:19',NULL),(87,1,'1660803981',105000.00,NULL,'SUCCESS','2019-03-08 15:34:27','2019-03-08 15:34:31',NULL),(88,1,'2340803281',105000.00,NULL,'FAILED','2019-03-08 15:34:39','2019-03-08 15:34:46',NULL),(89,1,'3730803321',105000.00,NULL,'FAILED','2019-03-08 15:34:56','2019-03-08 15:35:01',NULL),(90,1,'2220803511',160000.00,NULL,'FAILED','2019-03-08 15:35:44','2019-03-08 15:35:52',NULL),(91,1,'2560803551',260000.00,NULL,'FAILED','2019-03-08 15:36:37','2019-03-08 15:36:42',NULL),(92,1,'2330803331',160000.00,NULL,'SUCCESS','2019-03-08 15:37:24','2019-03-08 15:37:29',NULL),(93,1,'2190803581',40000.00,NULL,'FAILED','2019-03-08 15:38:41','2019-03-08 15:38:46',NULL),(94,1,'4820803931',130000.00,NULL,'SUCCESS','2019-03-08 15:40:22','2019-03-08 15:40:28',NULL),(95,1,'2730803131',40000.00,NULL,'SUCCESS','2019-03-08 15:41:08','2019-03-08 15:41:13',NULL),(96,1,'3770803681',160000.00,NULL,'SUCCESS','2019-03-08 15:49:07','2019-03-08 15:53:48',NULL),(97,1,'1730803471',52500.00,NULL,'SUCCESS','2019-03-08 15:51:02','2019-03-08 15:51:06',NULL),(98,1,'3710803361',220000.00,NULL,'SUCCESS','2019-03-08 15:56:01','2019-03-08 15:56:05',NULL),(99,1,'2540803391',160000.00,'562D5F8KTL','SUCCESS','2019-03-08 16:04:37','2019-03-08 16:04:41',NULL),(100,1,'4600803181',52500.00,'5MF7DLARF3','SUCCESS','2019-03-08 16:05:15','2019-03-08 16:05:20',NULL),(101,1,'1420803781',10500.00,NULL,'CANCELED','2019-03-08 16:08:11','2019-03-08 16:08:11',NULL),(102,1,'2380803591',52500.00,'TGUBO5I571','SUCCESS','2019-03-08 16:10:39','2019-03-08 16:10:45',NULL),(103,1,'1850803421',52500.00,NULL,'CANCELED','2019-03-08 16:11:38','2019-03-08 16:11:38',NULL),(104,1,'4700803831',130000.00,NULL,'CANCELED','2019-03-08 16:12:17','2019-03-08 16:12:17',NULL),(106,1,'1110803301',10500.00,'MFT8SL1EI8','SUCCESS','2019-03-08 16:17:04','2019-03-08 16:17:08',NULL),(107,1,'3550803831',160000.00,NULL,'CANCELED','2019-03-08 16:18:22','2019-03-08 16:18:22',NULL),(108,1,'1530803961',160000.00,NULL,'CANCELED','2019-03-08 16:19:31','2019-03-08 16:19:31',NULL),(109,1,'1980803231',10500.00,'JHR696TDUO','SUCCESS','2019-03-08 16:59:35','2019-03-08 16:59:40',NULL),(110,1,'3110803671',10500.00,NULL,'SUCCESS','2019-03-08 17:01:38','2019-03-08 17:03:39',NULL),(111,1,'1200803841',40000.00,NULL,'FAILED','2019-03-08 17:03:59','2019-03-08 17:04:14',NULL),(112,1,'1210803681',160000.00,NULL,'FAILED','2019-03-08 17:05:29','2019-03-08 17:05:35',NULL),(113,1,'1410803951',160000.00,NULL,'CANCELED','2019-03-08 17:06:10','2019-03-08 17:06:10',NULL),(114,1,'2860803201',210000.00,NULL,'SUCCESS','2019-03-08 17:15:19','2019-03-08 17:18:53',NULL),(115,1,'3820803901',160000.00,NULL,'SUCCESS','2019-03-08 17:20:21','2019-03-08 17:21:08',NULL),(116,1,'1240803771',52500.00,NULL,'FAILED','2019-03-08 17:22:04','2019-03-08 17:22:13',NULL),(117,1,'2200803161',52500.00,NULL,'SUCCESS','2019-03-08 17:24:34','2019-03-08 17:24:40',NULL),(118,1,'1030803751',360000.00,NULL,'SUCCESS','2019-03-08 17:25:13','2019-03-08 17:25:18',NULL),(119,1,'1510803361',40000.00,'OA2R5GNBHP','SUCCESS','2019-03-08 17:31:23','2019-03-08 17:32:51',NULL),(120,1,'3280803941',10500.00,NULL,'FAILED','2019-03-08 17:34:46','2019-03-08 17:34:50',NULL),(121,1,'3220803281',10500.00,NULL,'CANCELED','2019-03-08 17:35:40','2019-03-08 21:12:33',NULL),(122,1,'1050803651',240000.00,NULL,'CANCELED','2019-03-08 17:36:15','2019-03-08 21:12:39',NULL),(127,1,'1620803641',10500.00,NULL,'CANCELED','2019-03-08 18:53:28','2019-03-08 21:14:18',NULL),(128,1,'4380803901',52500.00,NULL,'CANCELED','2019-03-08 19:47:05','2019-03-08 21:14:21',NULL),(129,1,'2290803771',52500.00,NULL,'FAILED','2019-03-08 21:15:48','2019-03-08 21:15:56',NULL),(130,1,'2340803541',52500.00,NULL,'SUCCESS','2019-03-08 21:16:13','2019-03-08 21:16:20',NULL),(131,1,'2870803441',250000.00,NULL,'CANCELED','2019-03-08 21:16:38','2019-03-08 21:16:38',NULL);
