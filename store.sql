/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.18-nt : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `store`;

/*Table structure for table `dingdan` */

DROP TABLE IF EXISTS `dingdan`;

CREATE TABLE `dingdan` (
  `ID` int(11) NOT NULL auto_increment,
  `MeberID` varbinary(20) default '',
  `proname` varchar(200) default '',
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `toall` float default NULL,
  `pername` varchar(20) default NULL,
  `dizhi` varchar(30) default NULL,
  `haoma` varchar(20) default NULL,
  `liuyan` varchar(200) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dingdan` */

insert  into `dingdan`(`ID`,`MeberID`,`proname`,`time`,`toall`,`pername`,`dizhi`,`haoma`,`liuyan`) values (104,'66','口红','2022-08-09 10:44:11',780,'小三三','重庆邮电大学','1234567',''),(105,'66','口红,帽子,棉鞋,','2022-08-09 11:01:09',1418,'小三三','重庆邮电大学','1234567','');

/*Table structure for table `gouwuche` */

DROP TABLE IF EXISTS `gouwuche`;

CREATE TABLE `gouwuche` (
  `merberid` varchar(20) NOT NULL default '',
  `proname` varchar(200) NOT NULL default '',
  `num` int(11) default NULL,
  PRIMARY KEY  (`merberid`,`proname`),
  KEY `FK_gouwuche` (`proname`),
  CONSTRAINT `FK_gouwuche` FOREIGN KEY (`proname`) REFERENCES `productsall` (`proname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gouwuche` */

insert  into `gouwuche`(`merberid`,`proname`,`num`) values ('1','口红',6),('1','围巾',1),('1','棉鞋',1),('11','口红',2),('11','围巾',1),('11','帽子',9),('66','口红',1),('66','帽子',10),('66','棉鞋',10),('66','粉底',1),('78','口红',8),('78','帽子',1),('90','口红',1),('90','帽子',1),('90','棉服',1),('951','电脑',6),('98','口红',3),('98','围巾',4),('98','帽子',1),('99','口红',1),('99','围巾',7);

/*Table structure for table `merbvip` */

DROP TABLE IF EXISTS `merbvip`;

CREATE TABLE `merbvip` (
  `merberid` varchar(20) NOT NULL,
  `merbname` varchar(200) default NULL,
  `logontimes` int(11) default NULL,
  `pwd` int(11) default NULL,
  `phonenum` int(11) default NULL,
  `zipcode` varchar(30) default NULL,
  `adress` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `vip` varchar(1) default NULL,
  PRIMARY KEY  (`merberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `merbvip` */

insert  into `merbvip`(`merberid`,`merbname`,`logontimes`,`pwd`,`phonenum`,`zipcode`,`adress`,`email`,`vip`) values ('2','小二',1,123456,2147483647,'2001','重庆yioudian大学','paner@qq.com','1'),('66','小三三',20,66,1234567,'3094','重庆邮电大学','pan90660@qq.com','1'),('90','美股',4,12,1234567,'1000','重庆','pan90660@qq.com','1'),('951','邱海峰',1,951986,1234567,'3090','重庆邮电大学','pan90660@qq.com','1'),('98','小三三',1,123,1234567,'1000','重庆','pan90660@qq.com','1');

/*Table structure for table `productsall` */

DROP TABLE IF EXISTS `productsall`;

CREATE TABLE `productsall` (
  `proname` varchar(200) NOT NULL default '',
  `properson` varchar(20) default NULL,
  `protime` varchar(10) default NULL,
  `prosallnum` int(11) default NULL,
  PRIMARY KEY  (`proname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productsall` */

insert  into `productsall`(`proname`,`properson`,`protime`,`prosallnum`) values ('ff','小水国','00:00:00',0),('口红','小屋','00:00:00',159),('喜羊羊','羊村','00:00:00',0),('围巾','小店','00:20:21',31),('帽子','小房','00:20:21',182),('棉服','小屋','00:20:20',11),('棉鞋','小店','00:00:00',140),('玫瑰','小花','00:00:00',0),('电脑','小电','00:59:00',90),('粉底','小屋','00:12:34',90),('美股','小电','00:00:00',0),('羽绒服','小家','10:50:00',908),('香蕉','小水国','00:00:00',0),('鲜花','小花','00:00:00',0);

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `proid` varchar(20) NOT NULL default '',
  `proname` varchar(200) NOT NULL,
  `protype` varchar(20) default NULL,
  `proprice` double default NULL,
  `pronum` int(11) default NULL,
  `picture` varchar(50) default NULL,
  PRIMARY KEY  (`proname`),
  KEY `FK_project` (`protype`),
  CONSTRAINT `FK_project` FOREIGN KEY (`protype`) REFERENCES `prostype` (`protype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`proid`,`proname`,`protype`,`proprice`,`pronum`,`picture`) values ('1','口红','化妆品',78,67,'口红.webp'),('98','喜羊羊','肉类',90,2000,'屏幕截图 2022-08-09 103159.jpg'),('3','帽子','冬季饰品',45,900,'帽子.webp'),('4','棉服','冬季衣服',200,2000,'棉服.jfif'),('5','棉鞋','冬季衣服',89,1000,'棉鞋.jfif'),('7','电脑','电子产品',5000,900,'电脑.jfif'),('98','百科全书4e','电子产品',90,2000,'屏幕截图 2022-08-09 103159.jpg'),('8','短裤','夏季裤子',80,500,'短裤.jfif'),('9','粉底','化妆品',300,1090,'粉底.jfif'),('10','羽绒服','冬季衣服',400,70,'羽绒服.jfif'),('11','香蕉','水果',90,2000,'香蕉.jfif');

/*Table structure for table `prostype` */

DROP TABLE IF EXISTS `prostype`;

CREATE TABLE `prostype` (
  `proid` int(11) NOT NULL auto_increment,
  `protype` varchar(20) NOT NULL,
  PRIMARY KEY  (`protype`),
  UNIQUE KEY `proid` (`proid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prostype` */

insert  into `prostype`(`proid`,`protype`) values (1,'电子产品'),(2,'水果'),(3,'夏季裤子'),(4,'冬季饰品'),(5,'鲜花'),(6,'冬季衣服'),(7,'化妆品'),(9,'书籍'),(15,'肉类');

/*Table structure for table `protype` */

DROP TABLE IF EXISTS `protype`;

CREATE TABLE `protype` (
  `protype` varchar(20) default '',
  `proname` varchar(200) NOT NULL,
  PRIMARY KEY  (`proname`),
  KEY `FK_protype` (`protype`),
  CONSTRAINT `FK_protype` FOREIGN KEY (`protype`) REFERENCES `prostype` (`protype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `protype` */

insert  into `protype`(`protype`,`proname`) values ('冬季衣服','棉服'),('冬季饰品','围巾'),('化妆品','口红'),('夏季裤子','短裤'),('水果','香蕉'),('电子产品','电脑'),('电子产品','美股'),('鲜花','玫瑰');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
