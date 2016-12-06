/*
Navicat MySQL Data Transfer

Source Server         : CloudMysql
Source Server Version : 50550
Source Host           : 123.207.88.18:3306
Source Database       : crm_system

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-10-30 14:46:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Activity
-- ----------------------------
DROP TABLE IF EXISTS `Activity`;
CREATE TABLE `Activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityName` varchar(20) DEFAULT NULL,
  `AccountID` int(11) NOT NULL,
  `ActivityStartTime` datetime DEFAULT NULL,
  `ActivityCutTime` datetime DEFAULT NULL,
  `ActivityDetail` varchar(100) DEFAULT NULL,
  `ActivityPic` varchar(50) DEFAULT NULL,
  `ActivityState` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ActivityID`),
  KEY `FK_SupportActivity` (`AccountID`),
  CONSTRAINT `FK_SupportActivity` FOREIGN KEY (`AccountID`) REFERENCES `Shopowner` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for Customer
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `TelephoneNumber` char(11) NOT NULL,
  `CustomName` varchar(20) NOT NULL,
  `BonusPoint` int(11) NOT NULL,
  `CustomID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomPic` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CustomID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Goods
-- ----------------------------
DROP TABLE IF EXISTS `Goods`;
CREATE TABLE `Goods` (
  `GoodsID` int(11) NOT NULL AUTO_INCREMENT,
  `GoodsName` varchar(20) NOT NULL,
  `GoodsMoney` float NOT NULL,
  `GoodsStorage` int(11),
  `GoodsPic` varchar(40) DEFAULT NULL,
  `GoodsDetail` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GoodsID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Purchasedetail
-- ----------------------------
DROP TABLE IF EXISTS `Purchasedetail`;
CREATE TABLE `Purchasedetail` (
  `RecordID` int(11) NOT NULL,
  `GoodsID` int(11) NOT NULL,
  `GoodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecordID`,`GoodsID`),
  KEY `FK_DetailGoods` (`GoodsID`),
  CONSTRAINT `FK_DetailGoods` FOREIGN KEY (`GoodsID`) REFERENCES `Goods` (`GoodsID`),
  CONSTRAINT `FK_Relation1` FOREIGN KEY (`RecordID`) REFERENCES `Purchasehistory` (`RecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Purchasehistory
-- ----------------------------
DROP TABLE IF EXISTS `Purchasehistory`;
CREATE TABLE `Purchasehistory` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomID` int(11) NOT NULL,
  `RecordTime` datetime NOT NULL,
  `RecordMoney` float NOT NULL,
  `Remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `FK_RecordOfCustomer` (`CustomID`),
  CONSTRAINT `FK_RecordOfCustomer` FOREIGN KEY (`CustomID`) REFERENCES `Customer` (`CustomID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Shopowner
-- ----------------------------
DROP TABLE IF EXISTS `Shopowner`;
CREATE TABLE `Shopowner` (
  `AccountID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(20) NOT NULL,
  `AccountPwd` varchar(20) DEFAULT NULL,
  `AccountAddress` varchar(50) DEFAULT NULL,
  `OpeningTime` time DEFAULT NULL,
  `ClosingTime` time DEFAULT NULL,
  `AccountDetail` varchar(100) DEFAULT NULL,
  `AccountPic` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
