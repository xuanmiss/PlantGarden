/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.20-0ubuntu0.16.04.1 : Database - test_more
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_more` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_more`;

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentinfo` varchar(1000) DEFAULT NULL,
  `forumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `comtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (1,'用户自己的评论11111',1,9,'admin','2018-01-11 17:01:37');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (2,'士大夫首发式地方是',0,9,'admin','2018-01-11 17:05:10');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (3,'对方身份的',0,9,'admin','2018-01-11 17:07:49');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (4,'撒旦发撒飞洒地方',8,9,'admin','2018-01-11 17:08:50');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (5,'第二个帖子的评论，字数超过十个。',8,9,'admin','2018-01-11 17:12:57');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (6,'石帆胜丰士大夫手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀是似的发射点发射点发生发射点发射点发射点',8,9,'admin','2018-01-11 17:15:18');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (7,'士大夫士大夫十分是二士大夫士大夫十分是二士大夫士大夫十分是二士大夫士大夫十分是二士大夫士大夫十分是二',8,9,'admin','2018-01-11 17:21:15');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (8,'是的发生发射点',8,9,'admin','2018-01-11 17:25:13');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (9,'撒旦飞洒地方撒旦飞洒的规划行业经营精英',8,9,'admin','2018-01-11 17:25:25');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (10,'第四个帖子的评论第四个帖子的评论第四个帖子的评论第四个帖子的评论第四个帖子的评论第四个帖子的评论第四个帖子的评论第四个帖子的评论',4,9,'admin','2018-01-11 17:34:19');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (11,'十分士大夫手动阀手动阀撒旦发士大夫撒地方手动阀撒地方撒地方撒地方士大夫但是沟通好玉筋鱼科于今天有就今天已经通用',1,9,'admin','2018-01-11 17:38:17');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (12,'批林批孔吗vi几个截图光荣而宽广i电脑覅v的护国韩国i手机发啊事发地收到附件是的符合双方嗯我就发士大夫',1,9,'admin','2018-01-11 17:45:22');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (13,'士大夫撒旦发生大收到粉丝的积分谁都付款微积分俄日公司的房间的司法和i嗯我就覅收到甲方撒地方就是地方但是',2,9,'admin','2018-01-11 17:45:43');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (14,'但是发射点发射点敢于突破困局保护与沟通以后不能家门口，咯耳朵日方提供用户几口，了',2,9,'admin','2018-01-11 17:46:11');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (15,'真漂亮的花。在哪里拍的啊，哇~~~~~~~',3,11,'zps','2018-01-11 20:49:26');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (16,'我也很喜欢梅花',10,13,'张三','2018-01-11 21:28:24');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (17,'sdfasdfsad',1,9,'admin','2018-01-11 21:43:16');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (18,'sdfsdf ',1,9,'admin','2018-01-11 21:44:45');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (19,'sdf',1,9,'admin','2018-01-11 21:47:23');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (20,'fsdfsdafsadf ',1,9,'admin','2018-01-11 22:03:53');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (21,'dsafsadfsdf ',2,9,'admin','2018-01-11 22:10:17');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (22,'sdfsdfsdf',2,9,'admin','2018-01-11 22:13:43');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (23,'sdfsdfsdfsdfsdfsdf',3,9,'admin','2018-01-11 22:15:00');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (24,'sdf',4,9,'admin','2018-01-11 22:17:33');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (25,'sdfsfasfsadfsadf',9,9,'admin','2018-01-11 22:17:59');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (26,'sdfsfsfsaf',5,9,'admin','2018-01-11 22:19:34');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (27,'sdfsdfsdf',7,9,'admin','2018-01-11 22:20:15');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (28,'sdfsdfsdfsdfsdfsdfsdfnhbvcdx',5,9,'admin','2018-01-11 22:20:46');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (29,'sdfsdfsdfsdfsdf',6,9,'admin','2018-01-11 22:20:57');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (30,'sdfsdfsdf',7,9,'admin','2018-01-11 22:21:42');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (31,'sdfsdf',9,9,'admin','2018-01-11 22:21:50');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (32,'sdfsdfs',10,9,'admin','2018-01-11 22:21:55');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (33,'dsfsdfs',1,9,'admin','2018-01-11 22:22:08');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (34,'是的烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦',11,9,'admin','2018-01-11 22:22:45');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (35,' 考虑',5,11,'zps','2018-01-11 22:25:53');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (36,'和国际经济iiii你',6,11,'zps','2018-01-11 22:27:13');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (37,'手动阀手动阀士大夫',6,11,'zps','2018-01-11 22:28:45');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (38,'和急急急急急急急急急急急急急急急',9,11,'zps','2018-01-11 22:29:02');
insert  into `t_comment`(`id`,`commentinfo`,`forumid`,`userid`,`username`,`comtime`) values (39,'了怕怕怕怕怕怕怕怕怕怕',10,11,'zps','2018-01-11 22:30:01');

/*Table structure for table `t_forum` */

DROP TABLE IF EXISTS `t_forum`;

CREATE TABLE `t_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foruminfo` varchar(2000) NOT NULL,
  `userid` int(11) NOT NULL,
  `imgsrcs` varchar(1000) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `pubtime` datetime DEFAULT NULL,
  `commentcnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='帖子区';

/*Data for the table `t_forum` */

insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (1,'这是第一个帖子',11,'src/assets/1515648027025梅花.jpeg,src/assets/1515648024756黄花.jpeg','zps','2018-01-11 13:22:45',8);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (2,'这是第二个帖子',11,'src/assets/1515648537076竹子.jpeg,src/assets/1515648535170黄花.jpeg','zps','2018-01-11 13:28:58',3);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (3,'这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，',9,'src/assets/1515657360619黄花.jpeg,src/assets/1515657357990黄花.jpeg,src/assets/1515657355761梅花.jpeg','admin','2018-01-11 15:56:02',1);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (4,'这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖',9,'src/assets/1515657525655竹子.jpeg,src/assets/1515657523653竹子.jpeg','admin','2018-01-11 15:58:47',1);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (5,'这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！',9,'src/assets/1515659025356梅花.jpeg,src/assets/1515659022683黄花.jpeg,src/assets/1515659020387梅花.jpeg','admin','2018-01-11 16:23:52',3);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (6,'这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！',9,'src/assets/1515659258365黄花.jpeg,src/assets/1515659256073梅花.jpeg,src/assets/1515659253869黄花.jpeg,src/assets/1515659251952竹子.jpeg','admin','2018-01-11 16:27:40',3);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (7,'这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，这是第三个帖子，',9,'src/assets/1515659342063梅花.jpeg,src/assets/1515659339727黄花.jpeg,src/assets/1515659337950竹子.jpeg','admin','2018-01-11 16:29:02',2);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (8,'这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第6个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！这是第5个帖子！！！！',9,'src/assets/1515659416340黄花.jpeg,src/assets/1515659414524梅花.jpeg,src/assets/1515659413297竹子.jpeg','admin','2018-01-11 16:30:17',0);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (9,'今天看到的很漂亮的植物，大家一起看看',11,'src/assets/1515674035049梅花.jpeg,src/assets/1515674032095竹子.jpeg','zps','2018-01-11 20:34:26',3);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (10,'这是我的第一个帖子，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花，我喜欢梅花',22,'src/assets/1515677225616梅花.jpeg,src/assets/1515677222539梅花.jpeg,src/assets/1515677220426梅花.jpeg','david','2018-01-11 21:27:26',3);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (11,'我也不知道这是什么植物',9,'src/assets/1515680551368竹子.jpeg,src/assets/1515680549008梅花.jpeg','admin','2018-01-11 22:22:33',1);
insert  into `t_forum`(`id`,`foruminfo`,`userid`,`imgsrcs`,`username`,`pubtime`,`commentcnt`) values (12,'今天看到的花',11,'src/assets/1515680701238竹子.jpeg,src/assets/1515680653193黄花.jpeg,src/assets/1515680650946梅花.jpeg','zps','2018-01-11 22:25:02',0);

/*Table structure for table `t_garden` */

DROP TABLE IF EXISTS `t_garden`;

CREATE TABLE `t_garden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gardencode` varchar(11) NOT NULL,
  `gardenname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_garden` */

insert  into `t_garden`(`id`,`gardencode`,`gardenname`) values (1,'haitang','海棠园');
insert  into `t_garden`(`id`,`gardencode`,`gardenname`) values (2,'dingxiang','丁香园');
insert  into `t_garden`(`id`,`gardencode`,`gardenname`) values (3,'taohua','桃花园');
insert  into `t_garden`(`id`,`gardencode`,`gardenname`) values (4,'mulan','木兰园');
insert  into `t_garden`(`id`,`gardencode`,`gardenname`) values (5,'zhuyuan','竹园');

/*Table structure for table `t_plant_info` */

DROP TABLE IF EXISTS `t_plant_info`;

CREATE TABLE `t_plant_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mu` varchar(255) DEFAULT NULL,
  `ke` varchar(255) DEFAULT NULL,
  `shu` varchar(255) DEFAULT NULL,
  `zhong` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `plantinfo` varchar(2000) DEFAULT NULL,
  `chandi` varchar(2000) DEFAULT NULL,
  `xixing` varchar(2000) DEFAULT NULL,
  `gardencode` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_plant_info` */

insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (7,'1','2','3','4','5','src/assets/1515082545914梅花.jpeg','psdfkoskfoskfokspfkskdfskfpskdfpskfpskkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkdddddddddddddddddddddddddpkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk','呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜','sdfsafasdf','dingxiang');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (8,'sdf','s','g','g','3','src/assets/1515083385419梅花.jpeg','而体育健康节能环保高峰过后就看了看局会议通过乳房','8uhjnklme;w,f.\'d/tghyjk,l;.',' is大家覅哦圣诞节覅时间的覅竞赛奖覅十几分芙蓉峰男人就你敷吧感染','mulan');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (9,'玫瑰花','蔷薇','蔷薇科','蔷薇属','玫瑰种','src/assets/1515331513415黄花.jpeg','这是个玫瑰花','中国','没有习性','taohua');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (10,'黄花','黄花','黄花','黄花','技术打法就是看了','src/assets/1515331605709黄花.jpeg','这是一朵小黄花，不知道说什么','中国','角度思考JFK是垃圾','haitang');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (11,'小红花','红花','花','小花','花','src/assets/1515331680303梅花.jpeg','这是个小红花，红红花','中国','数据的房间里撒旦解放','haitang');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (12,'dfghjkl','','','','','src/assets/1515508779601梅花.jpeg','','fghjkl;\'','',NULL);
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (13,'海棠','海棠','海棠','海棠','海棠','src/assets/1515567096521梅花.jpeg','海棠','海棠','海棠',NULL);
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (14,'海棠','海棠','海棠','海棠','海棠','src/assets/1515567280942黄花.jpeg','海棠','海棠','海棠','海棠园');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (15,'时代发生地方','海棠','海棠','海棠','海棠','src/assets/1515567373002黄花.jpeg','这是个海棠','海棠','海棠','haitang');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (16,'这是个竹子','竹子','竹子','竹子','竹子','src/assets/1515568978409竹子.jpeg','竹子','竹子','竹子','zhuyuan');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (18,'小小的竹子','中国','中国','中国','中国','src/assets/1515576030401竹子.jpeg,src/assets/1515576025276竹子.jpeg,src/assets/1515576023255竹子.jpeg','中国','中国','中国','zhuyuan');
insert  into `t_plant_info`(`id`,`name`,`mu`,`ke`,`shu`,`zhong`,`imgsrc`,`plantinfo`,`chandi`,`xixing`,`gardencode`) values (19,'毛竹','竹','毛竹','毛竹','毛竹','src/assets/1515587449334黄花.jpeg,src/assets/1515587441252梅花.jpeg,src/assets/1515587437729竹子.jpeg','这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，这是产于四川的毛竹，','四川','喜欢潮湿','zhuyuan');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`name`,`email`,`password`) values (9,'admin','admin@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (11,'zps','zps@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (13,'张三','san@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (14,'李四','li@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (15,'王五','wang@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (21,'mike','mike@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (22,'david','david@miss.com','123456');
insert  into `t_user`(`id`,`name`,`email`,`password`) values (23,'fjm','fjm@miss.com','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
