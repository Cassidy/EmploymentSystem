/*
MySQL Data Transfer
Source Host: localhost
Source Database: online
Target Host: localhost
Target Database: online
Date: 2010-9-5 ���� 01:50:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Auser` char(10) NOT NULL DEFAULT '',
  `Apassword` char(10) DEFAULT NULL,
  PRIMARY KEY (`Auser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for candidates
-- ----------------------------
DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates` (
  `Yuser` char(10) NOT NULL,
  `Ypassword` char(10) DEFAULT NULL,
  `Ysex` char(2) DEFAULT NULL,
  `Ytel` char(20) DEFAULT NULL,
  `Ymail` char(20) DEFAULT NULL,
  `Yintro` char(200) DEFAULT NULL,
  PRIMARY KEY (`Yuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `Nid` int(11) NOT NULL AUTO_INCREMENT,
  `Auser` char(10) DEFAULT NULL,
  `Ntitle` char(20) DEFAULT NULL,
  `Ntime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ncontent` text,
  PRIMARY KEY (`Nid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for postnews
-- ----------------------------
DROP TABLE IF EXISTS `postnews`;
CREATE TABLE `postnews` (
  `Zuser` char(10) NOT NULL,
  `Ztimea` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ztitle` char(20) DEFAULT NULL,
  `Znum` int(2) DEFAULT NULL,
  `Zgrade` char(10) DEFAULT NULL,
  `Zcontent` char(200) DEFAULT NULL,
  `Ztimeb` datetime NOT NULL,
  `Yuser` char(10) DEFAULT NULL,
  PRIMARY KEY (`Zuser`,`Ztimea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recruiters
-- ----------------------------
DROP TABLE IF EXISTS `recruiters`;
CREATE TABLE `recruiters` (
  `Zuser` char(10) NOT NULL,
  `Zpassword` char(10) DEFAULT NULL,
  `Zmail` char(20) DEFAULT NULL,
  `Zintro` char(100) DEFAULT NULL,
  PRIMARY KEY (`Zuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');
INSERT INTO `candidates` VALUES ('test', 'test', '男', '123456789999', '646749375@qq.com', '你好。。。。。。你好。。。。。。你好。。。。。。你好。。。。。。你好。。。。。。你好。。。。。。');
INSERT INTO `news` VALUES ('1', 'admin', '大家好！我叫Google~许波老师好！', '2010-09-04 01:10:52', 'OK~~~~~~~~~~~~~~~~~~~~~');
INSERT INTO `news` VALUES ('2', 'admin', '外号外号~', '2010-09-14 02:18:27', 'A BIG ORANGEUUUUUUUA BIG ORANGEUUUUUUUA BIG ORANGEUUUUUUU');
INSERT INTO `news` VALUES ('3', 'admin', '今天检了一分钱！', '2010-09-04 02:34:47', '今天检了一分钱！今天检了一分钱！今天检了一分钱！今天检了一分钱！');
INSERT INTO `postnews` VALUES ('test', '2010-09-08 00:08:14', '大招聘', '55', '英语四级', '一不留神，针刺进了她的手', '2010-09-05 23:14:07', null);
INSERT INTO `postnews` VALUES ('test', '2010-09-12 00:52:40', '你想干什么呢？', '66', '博士', '我靠我靠我靠我靠我靠我靠', '2010-09-16 23:13:58', null);
INSERT INTO `postnews` VALUES ('test', '2010-09-20 00:41:30', '大招聘', '2', '大学本科', '一不留神，针刺进了她的手指，红红的鲜血从针口流了出来，有三点血滴落在飘进窗子的雪花上。\r\n她若有所思地凝视着点缀在白雪上的鲜红血滴，又看了看乌木窗台，说道：“但愿我小女儿的皮肤\r\n长得白里透红，看起来就像这洁白的雪和鲜红的血一样，那么艳丽，那么骄嫩，头发长得就像这窗\r\n子的乌木一般又黑又亮！', '2010-09-21 23:13:54', null);
INSERT INTO `postnews` VALUES ('test', '2010-09-30 00:52:00', '大招聘', '4', '小学生', '一不留神，针刺进了她的手', '2010-09-12 23:14:02', null);
INSERT INTO `recruiters` VALUES ('test', 'test', '110', 'IBM 公司欢迎你！！！！');
