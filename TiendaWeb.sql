-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: TiendaWeb
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Continentes` int(11) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Contraseña` varchar(80) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaRegistro` date NOT NULL,
  `Edad` varchar(2) AS (FechaRegistro-FechaNacimiento) VIRTUAL,
  PRIMARY KEY (`Usuario`),
  UNIQUE KEY `IdCliente` (`IdCliente`),
  KEY `Continentes` (`Continentes`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Continentes`) REFERENCES `continente` (`IdContiente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (3,'Stephany','Perez',5,'Angelloco','wsafrevc5','1990-01-13','2019-08-27','29'),(1,'Gabriel','Arispe',1,'GabrielRobot','wsaft80','1999-07-17','2019-08-27','20'),(2,'Jose','Angel',3,'PerrosVolador','wsafrer67','1997-03-16','2019-08-27','22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `IdCompras` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioCliente` varchar(80) NOT NULL,
  `SerialEquipo` varchar(30) NOT NULL,
  `FechaCompra` date NOT NULL,
  PRIMARY KEY (`IdCompras`),
  KEY `UsuarioCliente` (`UsuarioCliente`),
  KEY `SerialEquipo` (`SerialEquipo`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`UsuarioCliente`) REFERENCES `clientes` (`Usuario`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`SerialEquipo`) REFERENCES `equipos` (`Serial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'Angelloco','243523dfes','2019-08-27'),(2,'GabrielRobot','24356df23','2019-08-27'),(3,'PerrosVolador','24352sds','2019-08-27');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continente`
--

DROP TABLE IF EXISTS `continente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continente` (
  `IdContiente` int(11) NOT NULL AUTO_INCREMENT,
  `NombreContinente` varchar(35) NOT NULL,
  PRIMARY KEY (`IdContiente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continente`
--

LOCK TABLES `continente` WRITE;
/*!40000 ALTER TABLE `continente` DISABLE KEYS */;
INSERT INTO `continente` VALUES (1,'Asia'),(2,'America'),(3,'Africa'),(4,'Antartida'),(5,'Europa'),(6,'Oceania');
/*!40000 ALTER TABLE `continente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `Serial` varchar(30) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Tipo_Equipo` varchar(2) NOT NULL,
  `NGama` int(11) NOT NULL,
  `CantidadDisponible` int(11) NOT NULL,
  `Precio` float NOT NULL,
  PRIMARY KEY (`Serial`),
  KEY `Tipo_Equipo` (`Tipo_Equipo`),
  KEY `NGama` (`NGama`),
  CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`Tipo_Equipo`) REFERENCES `tipo` (`IdTipo`),
  CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`NGama`) REFERENCES `gama` (`Nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('243523dfes','Samsumg Galaxy S10','T',3,5,100.99),('24352sds','Laptops Hp Pavilton','C',2,5,50.5),('24356df23','Audifonos Beast','A',1,15,60.5);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gama`
--

DROP TABLE IF EXISTS `gama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gama` (
  `Nivel` int(11) NOT NULL,
  `DescripcionGama` varchar(20) NOT NULL,
  PRIMARY KEY (`Nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gama`
--

LOCK TABLES `gama` WRITE;
/*!40000 ALTER TABLE `gama` DISABLE KEYS */;
INSERT INTO `gama` VALUES (1,'Alta'),(2,'Media'),(3,'Baja');
/*!40000 ALTER TABLE `gama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `IdTipo` varchar(2) NOT NULL,
  `DescripcionTipo` varchar(30) NOT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('A','Audiculares'),('C','Computadoras'),('H','Hardaware'),('T','Telefonos');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-27  8:15:22
