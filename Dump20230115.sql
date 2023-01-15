-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `usuario_id_usuario` int NOT NULL,
  `id_receta` int DEFAULT NULL,
  PRIMARY KEY (`id_favorito`),
  KEY `fk_favorito_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_favorito_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES (1,1,1),(2,1,2),(3,2,1),(7,2,2),(8,2,3),(9,3,3);
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(45) DEFAULT NULL,
  `usuario_id_administrador` int DEFAULT NULL,
  KEY `fk_grupo_usuario2_idx` (`usuario_id_administrador`),
  KEY `fk_grupo_usuario_idx` (`id_grupo`),
  CONSTRAINT `fk_grupo_usuario` FOREIGN KEY (`id_grupo`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'sablina-ro',1),(2,'salbina-rosie',3),(3,'ro-rosie',2);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` varchar(45) NOT NULL,
  `unidades_cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'harina','g'),(2,'agua','ml'),(3,'sal','g'),(4,'huevos','unidades'),(5,'azucar','g'),(6,'levadura','g'),(7,'avena','g'),(8,'leche','ml');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente_lista_compra`
--

DROP TABLE IF EXISTS `ingrediente_lista_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente_lista_compra` (
  `ingrediente_id_ingrediente` int NOT NULL,
  `lista_compra_id_lista_compra` int NOT NULL,
  PRIMARY KEY (`ingrediente_id_ingrediente`,`lista_compra_id_lista_compra`),
  KEY `fk_ingrediente_has_lista_compra_lista_compra1_idx` (`lista_compra_id_lista_compra`),
  KEY `fk_ingrediente_has_lista_compra_ingrediente1_idx` (`ingrediente_id_ingrediente`),
  CONSTRAINT `fk_ingrediente_lista_compra_ingrediente` FOREIGN KEY (`ingrediente_id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`),
  CONSTRAINT `fk_ingrediente_lista_compra_lista-compra` FOREIGN KEY (`lista_compra_id_lista_compra`) REFERENCES `lista_compra` (`id_lista_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_lista_compra`
--

LOCK TABLES `ingrediente_lista_compra` WRITE;
/*!40000 ALTER TABLE `ingrediente_lista_compra` DISABLE KEYS */;
INSERT INTO `ingrediente_lista_compra` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(4,2),(5,2),(8,2);
/*!40000 ALTER TABLE `ingrediente_lista_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_compra`
--

DROP TABLE IF EXISTS `lista_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_compra` (
  `id_lista_compra` int NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` varchar(45) DEFAULT NULL,
  `cantidad_ingrediente` int DEFAULT NULL,
  `unidades_cantidad` varchar(45) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_lista_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_compra`
--

LOCK TABLES `lista_compra` WRITE;
/*!40000 ALTER TABLE `lista_compra` DISABLE KEYS */;
INSERT INTO `lista_compra` VALUES (1,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL),(6,'harina',500,'g',NULL),(7,'agua',200,'ml',NULL),(8,'sal',5,'g',NULL),(9,'levadura',25,'g',NULL),(13,'harina',500,'g',NULL),(14,'agua',200,'ml',NULL),(15,'sal',5,'g',NULL),(16,'levadura',25,'g',NULL),(20,'harina',500,'g',NULL),(21,'agua',200,'ml',NULL),(22,'sal',5,'g',NULL),(23,'levadura',25,'g',NULL),(24,'harina',500,'g',NULL),(25,'agua',200,'ml',NULL),(26,'sal',5,'g',NULL),(27,'levadura',25,'g',NULL),(28,'harina',500,'g',NULL),(29,'agua',200,'ml',NULL),(30,'sal',5,'g',NULL),(31,'levadura',25,'g',NULL),(35,'harina',500,'g',NULL),(36,'agua',200,'ml',NULL),(37,'sal',5,'g',NULL),(38,'levadura',25,'g',NULL),(42,'harina',500,'g',NULL),(43,'agua',200,'ml',NULL),(44,'sal',5,'g',NULL),(45,'levadura',25,'g',NULL),(46,'harina',500,'g',NULL),(47,'agua',200,'ml',NULL),(48,'sal',5,'g',NULL),(49,'levadura',25,'g',NULL),(50,'harina',500,'g',NULL),(51,'agua',200,'ml',NULL),(52,'sal',5,'g',NULL),(53,'levadura',25,'g',NULL),(57,'harina',500,'g',NULL),(58,'agua',200,'ml',NULL),(59,'sal',5,'g',NULL),(60,'levadura',25,'g',NULL),(64,'harina',500,'g',NULL),(65,'agua',200,'ml',NULL),(66,'sal',5,'g',NULL),(67,'levadura',25,'g',NULL),(68,'harina',500,'g',NULL),(69,'agua',200,'ml',NULL),(70,'sal',5,'g',NULL),(71,'levadura',25,'g',NULL),(72,'harina',500,'g',NULL),(73,'agua',200,'ml',NULL),(74,'sal',5,'g',NULL),(75,'levadura',25,'g',NULL),(79,'harina',500,'g',NULL),(80,'agua',200,'ml',NULL),(81,'sal',5,'g',NULL),(82,'levadura',25,'g',NULL),(83,'harina',500,'g',NULL),(84,'agua',200,'ml',NULL),(85,'sal',5,'g',NULL),(86,'levadura',25,'g',NULL),(87,'harina',500,'g',NULL),(88,'agua',200,'ml',NULL),(89,'sal',5,'g',NULL),(90,'levadura',25,'g',NULL);
/*!40000 ALTER TABLE `lista_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `semana` int DEFAULT NULL,
  `nombre_menu` varchar(45) DEFAULT NULL,
  `valoracion` int DEFAULT NULL,
  `comentarios` varchar(200) DEFAULT NULL,
  `num_veces_compartido` int DEFAULT NULL,
  `usuario_id_usuario` int DEFAULT NULL,
  `id_receta` int DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_menu_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_menu_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'menu1',4,NULL,3,1,1),(2,2,'menu2',3,NULL,2,1,2),(3,2,'menu-ro',2,NULL,5,2,3),(4,3,'menu-rosie',0,NULL,1,3,1),(7,1,'menu1',4,NULL,3,1,2),(8,2,'menu2',3,NULL,2,1,3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `nombre_receta` varchar(45) NOT NULL,
  `tipo_receta` varchar(45) NOT NULL,
  `valoracion` int DEFAULT NULL,
  `tiempo_cocina` int DEFAULT NULL,
  `num_visitas` int DEFAULT NULL,
  `num_veces_compartido` int DEFAULT NULL,
  `país` varchar(45) DEFAULT NULL,
  `comentarios` varchar(200) DEFAULT NULL,
  `usuario_id_usuario` int DEFAULT NULL,
  `favorito_id_favorito` int DEFAULT NULL,
  `grupo_id_grupo` int DEFAULT NULL,
  `publico_privado` varchar(10) DEFAULT NULL,
  `cantidad_receta` int DEFAULT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `fk_receta_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_receta_favorito1_idx` (`favorito_id_favorito`),
  KEY `fk_receta_grupo1_idx` (`grupo_id_grupo`),
  CONSTRAINT `fk_receta_favorito` FOREIGN KEY (`favorito_id_favorito`) REFERENCES `favorito` (`id_favorito`),
  CONSTRAINT `fk_receta_grupo` FOREIGN KEY (`grupo_id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `fk_receta_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,'pan','acompañamiento',5,120,2,0,'españa',NULL,3,NULL,NULL,'publico',NULL),(2,'bizcochuelo','postre',4,45,200,100,'peru',NULL,1,NULL,NULL,'privado',NULL),(3,'pancake avena','postre',5,20,4,2,'españa',NULL,2,NULL,NULL,'publico',NULL);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingrediente`
--

DROP TABLE IF EXISTS `receta_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingrediente` (
  `receta_id_receta` int NOT NULL,
  `ingrediente_id_ingrediente` int NOT NULL,
  `cantidad_ingrediente` int DEFAULT NULL,
  KEY `fk_ingrediente_receta_ingrediente_idx` (`ingrediente_id_ingrediente`),
  KEY `fk_ingrediente_receta_receta_idx` (`receta_id_receta`),
  CONSTRAINT `fk_ingrediente_receta_ingrediente` FOREIGN KEY (`ingrediente_id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`),
  CONSTRAINT `fk_ingrediente_receta_receta` FOREIGN KEY (`receta_id_receta`) REFERENCES `receta` (`id_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingrediente`
--

LOCK TABLES `receta_ingrediente` WRITE;
/*!40000 ALTER TABLE `receta_ingrediente` DISABLE KEYS */;
INSERT INTO `receta_ingrediente` VALUES (1,1,500),(1,2,200),(1,3,5),(1,6,25),(2,1,250),(2,4,6),(2,5,150),(3,4,2),(3,7,30),(3,8,25),(3,5,20);
/*!40000 ALTER TABLE `receta_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingrediente_lista_compra`
--

DROP TABLE IF EXISTS `receta_ingrediente_lista_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingrediente_lista_compra` (
  `ingrediente_id_ingrediente` int DEFAULT NULL,
  `cantidad_ingrediente` int DEFAULT NULL,
  `id_lista_compra` int DEFAULT NULL,
  KEY `fk_receta_ingrediente_lista_compra_lista-compra_idx` (`id_lista_compra`),
  KEY `fk_receta_ingrediente_lista_compra_receta-ingrediente_idx` (`ingrediente_id_ingrediente`),
  CONSTRAINT `fk_receta_ingrediente_lista_compra_ingrediente` FOREIGN KEY (`ingrediente_id_ingrediente`) REFERENCES `receta_ingrediente` (`ingrediente_id_ingrediente`),
  CONSTRAINT `fk_receta_ingrediente_lista_compra_lista-compra` FOREIGN KEY (`id_lista_compra`) REFERENCES `lista_compra` (`id_lista_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingrediente_lista_compra`
--

LOCK TABLES `receta_ingrediente_lista_compra` WRITE;
/*!40000 ALTER TABLE `receta_ingrediente_lista_compra` DISABLE KEYS */;
INSERT INTO `receta_ingrediente_lista_compra` VALUES (1,500,1),(2,200,1),(3,5,1),(6,25,1),(4,6,1),(5,150,1),(4,2,2),(5,20,2),(8,25,2);
/*!40000 ALTER TABLE `receta_ingrediente_lista_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_menu`
--

DROP TABLE IF EXISTS `receta_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_menu` (
  `receta_id_receta` int DEFAULT NULL,
  `menu_id_menu` int DEFAULT NULL,
  KEY `fk_receta_menu_receta_idx` (`receta_id_receta`),
  KEY `fk_receta_menu_menu_idx` (`menu_id_menu`),
  CONSTRAINT `fk_receta_menu_menu` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`),
  CONSTRAINT `fk_receta_menu_receta` FOREIGN KEY (`receta_id_receta`) REFERENCES `receta` (`id_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_menu`
--

LOCK TABLES `receta_menu` WRITE;
/*!40000 ALTER TABLE `receta_menu` DISABLE KEYS */;
INSERT INTO `receta_menu` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(1,3),(3,3),(2,4),(3,4);
/*!40000 ALTER TABLE `receta_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `contraseña_registro` varchar(15) DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  `insignias` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_lista_compra_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `lista_compra` (`id_lista_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'sablina','factoria1',1,3),(2,'ro','factoria2',2,4),(3,'rosie','factoria3',3,0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 18:39:56
