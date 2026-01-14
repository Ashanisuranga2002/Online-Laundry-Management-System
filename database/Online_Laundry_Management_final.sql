-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: online_laundry_management
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nimal Perera','0771234567','nimal.perera@yahoo.com','No. 25, Galle Road, Colombo 03, Sri Lanka','2025-04-01 04:45:00'),(2,'Samantha Wijesinghe','0712345678','samantha.wijesinghe@gmail.com','45/2, Kandy Road, Kiribathgoda, Sri Lanka','2025-04-03 03:30:00'),(3,'Amal Fernando','0758765432','amal.fernando@gmail.com','12, Station Road, Negombo, Sri Lanka','2025-04-05 09:00:00'),(4,'Dilani Jayawardena','0769988776','dilani.j@gmail.com','34, Lake View Avenue, Nugegoda, Sri Lanka','2025-04-07 06:15:00'),(5,'Ruwan Silva','0781122334','ruwan.silva@gmail.com','88A, Matara Road, Galle, Sri Lanka','2025-04-10 10:50:00');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `shift_timing` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Saman Perera','Laundry Technician','+94 77 123 4567','saman.perera@gmail.com','08:00 AM - 04:00 PM','2025-04-12 06:26:43'),(2,'Nadeesha Silva','Manager','+94 71 987 6543','nadeesha.silva@laundry.lk','09:00 AM - 06:00 PM','2025-04-12 06:26:43'),(3,'Dinesh Kumara','Driver','+94 78 234 5678','dinesh.kumara@laundry.lk','06:00 AM - 02:00 PM','2025-04-12 06:26:43'),(4,'Chathurika Fernando','Customer Service Representative','+94 76 345 6789','chathurika.fernando@gmail.com','10:00 AM - 06:00 PM','2025-04-12 06:26:43'),(5,'Kumara Jayasinghe','Dry Cleaning Specialist','+94 75 456 7890','kumara.jayasinghe@laundry.lk','07:00 AM - 03:00 PM','2025-04-12 06:26:43');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) DEFAULT NULL,
  `description` text,
  `quantity_in_stock` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `last_restocked` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Laundry Detergent - 1kg','High-quality detergent powder for all laundry needs.',150,350.00,'ABC Distributors Ltd.','2025-04-01','2025-04-12 06:28:08'),(2,'Fabric Softener - 500ml','Softens fabrics and gives a fresh fragrance after every wash.',120,250.00,'Sri Lanka Cleaning Supplies','2025-03-25','2025-04-12 06:28:08'),(3,'Washing Machine Cleaner','Cleans washing machines to ensure better performance and hygiene.',75,650.00,'Swarna Distributors','2025-04-10','2025-04-12 06:28:08'),(4,'Laundry Bags - Set of 3','Durable laundry bags for washing delicate clothing items.',200,450.00,'Lanka Goods Suppliers','2025-03-28','2025-04-12 06:28:08'),(5,'Bleach - 1L','Effective bleach for whitening and stain removal.',100,500.00,'Colombo Chemicals Pvt Ltd.','2025-04-05','2025-04-12 06:28:08');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundry_orders`
--

DROP TABLE IF EXISTS `laundry_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laundry_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `laundry_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `laundry_orders_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundry_orders`
--

LOCK TABLES `laundry_orders` WRITE;
/*!40000 ALTER TABLE `laundry_orders` DISABLE KEYS */;
INSERT INTO `laundry_orders` VALUES (1,1,2,3,'2025-04-10','2025-04-12','Pending','Requires special handling for delicate items','2025-04-12 06:05:34'),(2,2,1,2,'2025-04-11','2025-04-13','In Progress','Regular laundry service, no special requests','2025-04-12 06:05:34'),(3,3,3,5,'2025-04-09','2025-04-11','Completed','Dry cleaning service for suits and dresses','2025-04-12 06:05:34'),(4,4,2,1,'2025-04-12','2025-04-14','Pending','Clothes need to be returned by 5 PM','2025-04-12 06:05:34'),(5,5,1,4,'2025-04-13','2025-04-15','In Progress','Laundry with ironing service requested','2025-04-12 06:05:34');
/*!40000 ALTER TABLE `laundry_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Paid','Pending') DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (6,1,15.50,'Paid','2025-04-10','Credit Card','2025-04-12 06:05:54'),(7,2,20.00,'Pending','2025-04-11','PayPal','2025-04-12 06:05:54'),(8,3,12.75,'Paid','2025-04-09','Debit Card','2025-04-12 06:05:54'),(9,4,30.00,'Paid','2025-04-08','Cash','2025-04-12 06:05:54'),(10,5,18.40,'Pending','2025-04-12','Bank Transfer','2025-04-12 06:05:54');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promo_id` int NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(50) DEFAULT NULL,
  `description` text,
  `discount_type` enum('Percentage','Fixed') DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `usage_limit` int DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,'AVURUDU2025','Celebrate Sinhala & Tamil New Year with 15% off on all laundry services!','Percentage',15.00,'2025-04-01','2025-04-20',500,'Active','2025-04-12 06:29:12'),(2,'VESAKCLEAN','Get a fresh start this Vesak! Flat Rs. 200 off on orders above Rs. 1000.','Fixed',200.00,'2025-05-01','2025-05-15',300,'Active','2025-04-12 06:29:12'),(3,'CMBLAUNCH','Exclusive Rs. 150 off for our new customers in Colombo!','Fixed',150.00,'2025-03-01','2025-06-01',200,'Active','2025-04-12 06:29:12'),(4,'LKA2025','Celebrate Sri Lanka’s Independence Day with 20% off!','Percentage',20.00,'2025-02-01','2025-02-10',100,'Inactive','2025-04-12 06:29:12'),(5,'WEEKENDWASH','10% off every weekend for express service orders.','Percentage',10.00,'2025-01-01','2025-12-31',1000,'Active','2025-04-12 06:29:12');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Wash & Fold','Basic washing and folding service for everyday clothes.',400.00,'2025-04-12 05:59:36'),(2,'Dry Cleaning','Professional dry cleaning for delicate garments.',850.00,'2025-04-12 05:59:36'),(3,'Ironing Only','Clothes will be neatly ironed and ready to wear.',300.00,'2025-04-12 05:59:36'),(4,'Express Laundry','Same-day laundry service with washing, drying, and folding.',700.00,'2025-04-12 05:59:36'),(5,'Curtain Cleaning','Deep cleaning for household curtains, charged per kg.',1200.00,'2025-04-12 05:59:36');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 12:02:32
