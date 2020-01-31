-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: helpinghands
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `a_username` varchar(45) NOT NULL,
  `a_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`a_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('anish','anish');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allmedicine`
--

DROP TABLE IF EXISTS `allmedicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allmedicine` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(45) DEFAULT NULL,
  `m_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allmedicine`
--

LOCK TABLES `allmedicine` WRITE;
/*!40000 ALTER TABLE `allmedicine` DISABLE KEYS */;
INSERT INTO `allmedicine` VALUES (1,'Dolo','strip'),(2,'crocin','strip'),(3,'calpol','bottle'),(4,'electral','sachet'),(5,'Benadryl','bottle'),(7,'sriworm','strip');
/*!40000 ALTER TABLE `allmedicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `d_id` int(11) NOT NULL,
  `d_username` varchar(45) DEFAULT NULL,
  `d_password` varchar(45) DEFAULT NULL,
  `d_name` varchar(45) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `d_gender` varchar(45) DEFAULT NULL,
  `d_email` varchar(45) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (3,'anish','anish','Anish','8778654532','male','anish@gmail.com','varanasi','Varanasi','varanasi',221003),(4,'shivam','shivam','ShivamSingh','9231234334','male','shivam@gmail.com','Ghazipur','Ghazipur','Ghazipur',220456),(13,'raghu123','raghu','Ram Singh','8231231231','male','ram@gmail.com','SH 17/42 A-R-5 Indrapur Khori Shivpur ','lane2','Tiruchirappalli',621302),(15,'shyam','shyam','Shyam patel','9231287237','male','shaym@gmail.com','SH 17/42 A-R-5 Indrapur Khori Shivpur','lane2','Tiruchirappalli',621302);
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `med_serial` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) DEFAULT NULL,
  `expdate` date DEFAULT NULL,
  `donationdate` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `n_registrationno` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`med_serial`),
  KEY `donor` (`d_id`),
  KEY `med` (`m_id`),
  KEY `reg` (`n_registrationno`),
  CONSTRAINT `donor` FOREIGN KEY (`d_id`) REFERENCES `donor` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `med` FOREIGN KEY (`m_id`) REFERENCES `allmedicine` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reg` FOREIGN KEY (`n_registrationno`) REFERENCES `ngo` (`n_registrationno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,1,'2022-12-12','2017-11-04',10,4,104232,1),(2,2,'2023-03-05','2020-01-01',30,13,102231,1),(21,1,'2020-12-12','2010-12-12',2,3,102231,1),(24,1,'2020-04-22','2020-01-09',2,3,102231,1),(25,5,'2020-03-15','2020-01-23',123,4,104232,0),(27,5,'2020-02-14','2020-01-28',123,3,103343,1),(28,2,'2020-03-31','2020-03-31',0,13,104232,0),(29,7,'2020-04-22','2020-03-30',12,4,104232,1),(36,1,'2021-12-12','2010-12-12',2,3,102231,0),(38,1,'2021-12-12','2010-12-12',2,3,102231,0),(46,4,'2020-03-31','2020-03-30',21,4,103343,0),(47,1,'2020-04-29','2020-03-31',32,4,104232,0);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngo`
--

DROP TABLE IF EXISTS `ngo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngo` (
  `n_username` varchar(45) DEFAULT NULL,
  `n_password` varchar(45) DEFAULT NULL,
  `n_name` varchar(45) DEFAULT NULL,
  `n_registrationno` int(11) NOT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `n_email` varchar(45) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`n_registrationno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngo`
--

LOCK TABLES `ngo` WRITE;
/*!40000 ALTER TABLE `ngo` DISABLE KEYS */;
INSERT INTO `ngo` VALUES ('bskul ','bakul007','Bakul foundation',102231,'9879879812','bakul@gmail.com','line1','line2','pune',411038),('udai007','udai007','Uday Foundations',102367,'9876532121','udai@gmail.com','line 1','line2','Tiruchirappali',621308),('Ghanshyam','ghanshyam','Ghanshyam Medics',103343,'7776532121','ghan@gmail.com','line1','line3','pune',123321),('ganesh','ganesh','Ganpati Foundation',104232,'8886532121','ganesh@gmail.com','line2`line4','line5','Karnal',345432),('priyam','priyam','Priyam',123222,'9876532121','priyam@gmail.com','line 1','line 4','Varanasi',221002),('Jayesh07','Jayesh07','Jayesh Helping Foundation',142356,'9786524512','jayesh@gmail.com','L-14 A-98','Deccan','pune',411006);
/*!40000 ALTER TABLE `ngo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30 16:51:20
