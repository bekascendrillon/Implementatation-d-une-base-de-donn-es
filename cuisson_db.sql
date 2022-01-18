-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: cuisson_db
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `nombre_calorie` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'rfc01','farine',NULL),(2,'rfc02','sucre',NULL),(3,'rfc03','sel',NULL),(4,'rfc04','manioc',NULL),(5,'rfc05','farine',NULL),(6,'rfc06','manioc',NULL),(7,'rfc07','sucre',NULL);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_péremption` date NOT NULL,
  `quantité` int DEFAULT NULL,
  `prix` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'prd001','produit de luxe','2022-07-10',45,15000),(2,'prd002','produit de marque','2022-10-12',30,15000),(3,'prd003','produit haute gamme ','2022-10-09',22,31000),(4,'prd004','produit haute gamme ','2022-10-09',30,20000),(5,'prd005','produit naturel','2022-10-26',18,20000),(6,'prd006','produit naturel','2022-02-26',18,35000);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rangements`
--

DROP TABLE IF EXISTS `rangements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rangements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `references` varchar(255) NOT NULL,
  `nom` varchar(155) NOT NULL,
  `id_produits` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id_produits`),
  KEY `tbl_produits` (`id_produits`),
  CONSTRAINT `tbl_produits` FOREIGN KEY (`id_produits`) REFERENCES `produits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rangements`
--

LOCK TABLES `rangements` WRITE;
/*!40000 ALTER TABLE `rangements` DISABLE KEYS */;
INSERT INTO `rangements` VALUES (2,'rangement1','naturel',2),(3,'rangement2','alimentaire',4),(4,'rangement1','produit alimentaire',3),(5,'rangement3','produit alimentaire',4),(6,'rangement4','produit alimentaire',5);
/*!40000 ALTER TABLE `rangements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recettes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `duree_preparation` varchar(20) NOT NULL,
  `duree_cuisson` varchar(20) NOT NULL,
  `nombre_calories` int NOT NULL,
  `nombre_parts` int NOT NULL,
  `niveau_difficulté` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recettes`
--

LOCK TABLES `recettes` WRITE;
/*!40000 ALTER TABLE `recettes` DISABLE KEYS */;
INSERT INTO `recettes` VALUES (1,'traditionnele','ceci est une recette de chez nous','2heures','15minutes',15,5,'moyen'),(2,'occidentale','ceci est une recette venue d ailleurs','30minutes','15minutes',15,5,'difficile'),(3,'africaine','ceci est une recette de chez nous','1heure','15minutes',15,5,'facile'),(4,'anglaise','ceci est une recette importee','3heures','15minutes',54,20,'facile'),(5,'oriental','ceci est une recette importee','15minutes','15minutes',60,20,'facile'),(6,'camerounaise','ceci est une recette importee','3heures','15minutes',34,25,'difficile'),(7,'anglaise','ceci est une recette importee','3heures','15minutes',20,10,'moyen');
/*!40000 ALTER TABLE `recettes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recettes_ingredients`
--

DROP TABLE IF EXISTS `recettes_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recettes_ingredients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_recettes` int unsigned NOT NULL,
  `id_ingredients` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id1` (`id`,`id_recettes`),
  KEY `tbl_recettes` (`id_recettes`),
  KEY `id2` (`id`,`id_ingredients`),
  KEY `tbl_ingredients` (`id_ingredients`),
  CONSTRAINT `tbl_ingredients` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `tbl_recettes` FOREIGN KEY (`id_recettes`) REFERENCES `recettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recettes_ingredients`
--

LOCK TABLES `recettes_ingredients` WRITE;
/*!40000 ALTER TABLE `recettes_ingredients` DISABLE KEYS */;
INSERT INTO `recettes_ingredients` VALUES (2,3,4),(3,4,5),(4,5,6),(5,6,7),(6,7,3);
/*!40000 ALTER TABLE `recettes_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeingredients`
--

DROP TABLE IF EXISTS `typeingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeingredients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `references` varchar(255) NOT NULL,
  `nom` varchar(155) NOT NULL,
  `id_ingred` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`id_ingred`),
  KEY `tbl_ingred` (`id_ingred`),
  CONSTRAINT `tbl_ingred` FOREIGN KEY (`id_ingred`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeingredients`
--

LOCK TABLES `typeingredients` WRITE;
/*!40000 ALTER TABLE `typeingredients` DISABLE KEYS */;
INSERT INTO `typeingredients` VALUES (1,'tpigd001','fecule',2),(2,'tpigd002','lactose',3),(3,'tpigd003','saccarose',4),(4,'tpigd004','proteine',5),(5,'tpigd005','fecule',6);
/*!40000 ALTER TABLE `typeingredients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 15:54:50
