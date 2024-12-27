-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: azkernia
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `defenses`
--

DROP TABLE IF EXISTS `defenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kingdom_id` int NOT NULL,
  `troop_id` int NOT NULL,
  `quantity_used` int DEFAULT '0',
  `result` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kingdom_id` (`kingdom_id`),
  KEY `troop_id` (`troop_id`),
  CONSTRAINT `defenses_ibfk_1` FOREIGN KEY (`kingdom_id`) REFERENCES `kingdoms` (`id`),
  CONSTRAINT `defenses_ibfk_2` FOREIGN KEY (`troop_id`) REFERENCES `troops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defenses`
--

LOCK TABLES `defenses` WRITE;
/*!40000 ALTER TABLE `defenses` DISABLE KEYS */;
INSERT INTO `defenses` VALUES (1,1,1,20,1,'2024-12-19 11:53:48'),(2,1,2,10,0,'2024-12-19 11:53:48'),(3,2,3,15,1,'2024-12-19 11:53:48'),(4,2,4,5,0,'2024-12-19 11:53:48');
/*!40000 ALTER TABLE `defenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kingdoms`
--

DROP TABLE IF EXISTS `kingdoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kingdoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `kingdoms_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kingdoms`
--

LOCK TABLES `kingdoms` WRITE;
/*!40000 ALTER TABLE `kingdoms` DISABLE KEYS */;
INSERT INTO `kingdoms` VALUES (1,1,'Kingdom Alpha'),(2,2,'Kingdom Beta');
/*!40000 ALTER TABLE `kingdoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2024_12_10_155706_create_defenses_table',1),(2,'2024_12_10_155706_create_kingdoms_table',1),(3,'2024_12_10_155706_create_resources_table',1),(4,'2024_12_10_155706_create_troops_table',1),(5,'2024_12_10_155706_create_users_table',1),(6,'2024_12_10_155709_add_foreign_keys_to_defenses_table',1),(7,'2024_12_10_155709_add_foreign_keys_to_kingdoms_table',1),(8,'2024_12_10_155709_add_foreign_keys_to_resources_table',1),(9,'2024_12_10_155709_add_foreign_keys_to_troops_table',1),(10,'2024_12_10_161520_create_sessions_table',1),(11,'2024_12_18_110553_create_missions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('SELECT','INSERT','UPDATE','DELETE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty` enum('Easy','Medium','Hard') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward_resources` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reward_troops` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,'Seleccionar todos los reinos','¿Cómo obtener todos los reinos registrados?','Escribe la consulta SQL para seleccionar todos los registros de la tabla `kingdoms`.','SELECT * FROM kingdoms;','SELECT','Easy','gold:100','soldiers:5',NULL,NULL),(2,'Obtener recursos de un reino','¿Cómo obtener los recursos asociados a un reino específico?','Escribe la consulta SQL para seleccionar todos los recursos del reino con id 2.','SELECT * FROM resources WHERE kingdom_id = 2;','SELECT','Medium','wood:200',NULL,NULL,NULL),(3,'Contar tropas por reino','¿Cómo contar cuántas tropas tiene cada reino?','Escribe la consulta SQL para contar las tropas por reino.','SELECT kingdom_id, COUNT(*) AS total_troops FROM troops GROUP BY kingdom_id;','SELECT','Hard',NULL,'archers:10',NULL,NULL),(4,'Seleccionar defensas exitosas','¿Cómo seleccionar las defensas exitosas?','Escribe la consulta SQL para obtener todas las defensas con resultado exitoso.','SELECT * FROM defenses WHERE result = 1;','SELECT','Easy','stone:300',NULL,NULL,NULL),(5,'Obtener detalles de las tropas usadas','¿Cómo obtener los detalles de tropas usadas en defensas?','Escribe la consulta SQL para obtener la cantidad usada y el id de tropa en cada defensa.','SELECT troop_id, quantity_used FROM defenses;','SELECT','Medium','gold:50','cavalry:3',NULL,NULL),(6,'Listar reinos con más de 500 recursos','¿Cómo listar reinos que tengan más de 500 recursos?','Escribe la consulta SQL para obtener reinos con más de 500 unidades de cualquier recurso.','SELECT * FROM kingdoms WHERE resources > 500;','SELECT','Hard',NULL,'soldiers:15',NULL,NULL),(7,'Seleccionar tropas específicas','¿Cómo seleccionar tropas cuyo id esté entre 5 y 10?','Escribe la consulta SQL para seleccionar tropas con id entre 5 y 10.','SELECT * FROM troops WHERE id BETWEEN 5 AND 10;','SELECT','Medium','gold:100',NULL,NULL,NULL),(8,'Añadir un nuevo reino','¿Cómo añadir un nuevo reino llamado \"Reino del Oeste\"?','Escribe la consulta SQL para insertar un nuevo reino con nombre \"Reino del Oeste\".','INSERT INTO kingdoms (name, user_id) VALUES (\"Reino del Oeste\", 1);','INSERT','Easy','gold:200',NULL,NULL,NULL),(9,'Añadir recursos iniciales','¿Cómo añadir 1000 de madera al reino con id 4?','Escribe la consulta SQL para insertar recursos iniciales de madera al reino 4.','INSERT INTO resources (kingdom_id, wood) VALUES (2, 1000);','INSERT','Easy','wood:500',NULL,NULL,NULL),(10,'Añadir tropas al reino','¿Cómo añadir 100 soldados al reino con id 5?','Escribe la consulta SQL para insertar tropas de tipo \"soldado\" al reino 5.','INSERT INTO troops (kingdom_id, type, quantity) VALUES (2, \"soldier\", 100);','INSERT','Medium','stone:300',NULL,NULL,NULL),(11,'Insertar nueva defensa','¿Cómo insertar una nueva defensa con id de reino 2 y 50 tropas?','Escribe la consulta SQL para insertar una defensa al reino 2.','INSERT INTO defenses (kingdom_id, troop_id, quantity_used) VALUES (2, 1, 50);','INSERT','Medium','gold:150',NULL,NULL,NULL),(12,'Actualizar el nombre de un reino','¿Cómo cambiar el nombre del reino con id 1 a \"Reino Unido\"?','Escribe la consulta SQL para actualizar el nombre del reino con id 1.','UPDATE kingdoms SET name = \"Reino Unido\" WHERE id = 1;','UPDATE','Easy','gold:100',NULL,NULL,NULL),(13,'Actualizar cantidad de tropas','¿Cómo actualizar la cantidad de tropas en el reino con id 3 a 200?','Escribe la consulta SQL para actualizar la cantidad de tropas en el reino con id 3.','UPDATE troops SET quantity = 200 WHERE kingdom_id = 3;','UPDATE','Medium','stone:400','archers:5',NULL,NULL),(14,'Eliminar todas las tropas de un reino','¿Cómo eliminar todas las tropas asociadas al reino con id 3?','Escribe la consulta SQL para eliminar tropas del reino con id 3.','DELETE FROM troops WHERE kingdom_id = 3;','DELETE','Medium',NULL,'soldiers:10',NULL,NULL),(15,'Eliminar reino específico','¿Cómo eliminar el reino con id 6?','Escribe la consulta SQL para eliminar el reino con id 6.','DELETE FROM kingdoms WHERE id = 6;','DELETE','Hard',NULL,'archers:5',NULL,NULL);
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kingdom_id` int NOT NULL,
  `gears` int DEFAULT '500',
  `empty_valves` int DEFAULT '500',
  `steam` int DEFAULT '500',
  PRIMARY KEY (`id`),
  KEY `kingdom_id` (`kingdom_id`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`kingdom_id`) REFERENCES `kingdoms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,1,1000,800,1200),(2,2,900,700,1100);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('YYIwj7sVt2Fdzuwz2qX13lFZGNNo2QgqpVSKGyht',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVk44SGY4M1gwVkJpRGlCMzRvOHUxdUd6MXczWkgzMDJLRVlzQUc2diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93ZWxjb21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1734611087);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troops`
--

DROP TABLE IF EXISTS `troops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `troops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kingdom_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `kingdom_id` (`kingdom_id`),
  CONSTRAINT `troops_ibfk_1` FOREIGN KEY (`kingdom_id`) REFERENCES `kingdoms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troops`
--

LOCK TABLES `troops` WRITE;
/*!40000 ALTER TABLE `troops` DISABLE KEYS */;
INSERT INTO `troops` VALUES (1,1,'Soldier',100),(2,1,'Scout',50),(3,2,'Archer',80),(4,2,'Knight',30);
/*!40000 ALTER TABLE `troops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adrian','$2y$12$v8zVrKNwi27lVGSSZMo1heHGBtrgUitW5O5ASuYfcCi1IRJSnBPt.','a','a','a@a.es','2024-12-19 10:53:14','2024-12-19 10:53:14'),(2,'pila','$2y$12$uv2RINfbiJ2ZU07kolGmyOvzZ1Xmf91Lahs6vpU5Ll7kf5UUgQXZ2','p','p','p@p.es','2024-12-19 10:53:22','2024-12-19 10:53:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 13:35:25
