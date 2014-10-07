/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 10.0.13-MariaDB : Database - enong
*********************************************************************
*/
USE `enong`;

DROP TABLE IF EXISTS `e_district`;

CREATE TABLE `e_district` (
  `id` bigint(12) NOT NULL,
  `parent_id` bigint(12) NOT NULL,
  `level` tinyint NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sequence` int NOT NULL,
  `state` char(1) NOT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `e_district` */

DROP TABLE IF EXISTS `e_address`;

CREATE TABLE `e_address` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(12) NOT NULL,
  `district_1` bigint(12) NOT NULL,
  `district_2` bigint(12) ,
  `district_3` bigint(12) NOT NULL,
  `district_4` bigint(12) ,
  `address` varchar(255) NOT NULL,
  `symbolic_building` varchar(255) NOT NULL,
  `company` varchar(255),
  `consignee` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `time` varchar(50),
  `is_default` char(1) NOT NULL,
  `create_date` date NOT NULL,
  `remark` varchar(255),
  `state` char(1) NOT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*Table structure for table `e_address` */


DROP TABLE IF EXISTS `e_bankcard`;

CREATE TABLE `e_bankcard` (
  `id` bigint(12) NOT NULL,
  `user_id` bigint(12) NOT NULL,
  `card_code` varchar(255) NOT NULL,
  `card_holder` varchar(255) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `validity` varchar(255) NOT NULL,
  `credential_type` varchar(50) NOT NULL,
  `credential_code` varchar(255) NOT NULL,
  `is_easypay` char(1) NOT NULL,
  `is_default` char(1) NOT NULL,
  `create_date` date NOT NULL,
  `state` char(1) NOT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `e_bankcard` */