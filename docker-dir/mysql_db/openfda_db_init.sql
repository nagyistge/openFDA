-- --------------------------------------------------------
-- Host:                         openfda.wasoftware.com
-- Server version:               5.6.25 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for openfda_test
CREATE DATABASE IF NOT EXISTS `openfda_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `openfda_test`;


-- Dumping structure for table openfda_test.DataSetLists
CREATE TABLE IF NOT EXISTS `DataSetLists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dataSetName` varchar(100) DEFAULT NULL,
  `dataSetType` varchar(100) DEFAULT NULL,
  `keyName` varchar(50) DEFAULT NULL,
  `valueName` varchar(50) DEFAULT NULL,
  `metadata` varchar(500) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `startdate` varchar(45) DEFAULT NULL,
  `enddate` varchar(45) DEFAULT NULL,
  `parameters`  varchar(200),
  PRIMARY KEY (`id`),
  KEY `FKDataSetLis818927` (`user_id`),
  CONSTRAINT `FKDataSetLis818927` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

alter table DataSetLists ADD COLUMN dateCreated DATETIME DEFAULT CURRENT_TIMESTAMP;

-- Dumping structure for table openfda_test.DataSets
CREATE TABLE IF NOT EXISTS `DataSets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataSetList_id` int(11) NOT NULL,
  `key` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDataSets355454` (`dataSetList_id`),
  CONSTRAINT `FKDataSets355454` FOREIGN KEY (`dataSetList_id`) REFERENCES `DataSetLists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- Dumping structure for table openfda_test.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table openfda_test.Users: ~1 rows (approximately)
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` (`id`, `username`, `password`) VALUES
        (1, 'user1', '123456');
INSERT INTO `Users` (`id`, `username`, `password`) VALUES
        (2, 'guest', 'guest1234');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
