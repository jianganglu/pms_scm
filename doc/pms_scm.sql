/*
SQLyog v10.2 
MySQL - 5.0.22-community-nt : Database - pms_scm
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pms_scm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `pms_scm`;

/*Table structure for table `jeecg_demo` */

DROP TABLE IF EXISTS `jeecg_demo`;

CREATE TABLE `jeecg_demo` (
  `id` varchar(255) NOT NULL,
  `age` int(11) default NULL,
  `birthday` datetime default NULL,
  `create_time` datetime default NULL,
  `dep_id` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `mobile_phone` varchar(255) default NULL,
  `office_phone` varchar(255) default NULL,
  `salary` decimal(19,2) default NULL,
  `sex` varchar(4) default NULL,
  `user_name` varchar(32) NOT NULL COMMENT '备注',
  `status` varchar(4) default NULL COMMENT '0:未处理 1:已处理',
  `content` varchar(100) default NULL,
  `content1` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_DEMO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_demo` */

insert  into `jeecg_demo`(`id`,`age`,`birthday`,`create_time`,`dep_id`,`email`,`mobile_phone`,`office_phone`,`salary`,`sex`,`user_name`,`status`,`content`,`content1`) values ('8a8a8a813ef47c6e013ef48239820030',27,'2013-05-10 00:00:00','2013-05-24 04:16:09','297e5a493d9f2cbc013d9f4450530001','zhangdaiscott@163.com','13426342929','123456','20000.00','0','张代浩','1','1111',NULL),('8a8a8a813ef47c6e013ef48471220035',33,NULL,NULL,'150','zhangdaiscott@163.com','','123456','33.00','0','zhangdaiscott','0',NULL,NULL);

/*Table structure for table `jeecg_one_to_one` */

DROP TABLE IF EXISTS `jeecg_one_to_one`;

CREATE TABLE `jeecg_one_to_one` (
  `ID` varchar(36) NOT NULL COMMENT '主键',
  `NAME` varchar(32) default NULL COMMENT '用户名',
  `AGE` int(11) default NULL COMMENT '年龄',
  `SALARY` decimal(10,2) default NULL COMMENT '工资',
  `BIRTHDAY` date default NULL COMMENT '生日',
  `REGISTER_DT` datetime default NULL COMMENT '注册时间',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人ID',
  `CRTUSER_NAME` varchar(50) default NULL COMMENT '创建人',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IDX_ONE_TO_ONE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_one_to_one` */

/*Table structure for table `jeecg_order_custom` */

DROP TABLE IF EXISTS `jeecg_order_custom`;

CREATE TABLE `jeecg_order_custom` (
  `id` varchar(36) NOT NULL,
  `GORDER_ID` varchar(36) default NULL COMMENT '关联主订单外键',
  `go_order_code` varchar(36) NOT NULL COMMENT '团购订单号',
  `goc_cus_name` varchar(50) default NULL COMMENT '姓名',
  `goc_sex` varchar(2) default NULL COMMENT '性别',
  `goc_idcard` varchar(32) default NULL COMMENT '身份证号',
  `goc_passport_code` varchar(32) default NULL COMMENT '护照号',
  `goc_buss_content` varchar(100) default NULL COMMENT '业务',
  `goc_content` varchar(200) default NULL COMMENT '备注',
  `crtuser` varchar(36) default NULL COMMENT '创建人',
  `crtuser_name` varchar(32) default NULL COMMENT '创建人名字',
  `create_dt` datetime default NULL COMMENT '创建时间',
  `modifier` varchar(36) default NULL COMMENT '修改人',
  `modifier_name` varchar(32) default NULL COMMENT '修改人名字',
  `modify_dt` datetime default NULL COMMENT '修改时间',
  `delflag` int(11) default NULL COMMENT '删除标记',
  `del_dt` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_ORDER_CUSTOM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_order_custom` */

insert  into `jeecg_order_custom`(`id`,`GORDER_ID`,`go_order_code`,`goc_cus_name`,`goc_sex`,`goc_idcard`,`goc_passport_code`,`goc_buss_content`,`goc_content`,`crtuser`,`crtuser_name`,`create_dt`,`modifier`,`modifier_name`,`modify_dt`,`delflag`,`del_dt`) values ('8a8a8a813ed3f193013ed410b6530038',NULL,'9999','张三','0','123','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ed3f193013ed410b6920039',NULL,'9999','李四','0','456','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813edeee60013edeefe08f0003',NULL,'123456','','','','','','','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edeee60013edeefe09f0004',NULL,'123456','','','','','','','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edf898e013edf8b2b230002','8a8a8a813edf898e013edf8b2b140001','A01','张三','','','','','','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edf898e013edf8b2b230003','8a8a8a813edf898e013edf8b2b140001','A01','李四','','','','','','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813ee0d4fb013ee0d5ad2f0002','8a8a8a813ee0d4fb013ee0d5ad200001','213123','','','','','','','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813ef47c6e013ef47fbedd0017',NULL,'1231','222222','0','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef47fbedd0018',NULL,'1231','22222','1','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `jeecg_order_main` */

DROP TABLE IF EXISTS `jeecg_order_main`;

CREATE TABLE `jeecg_order_main` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `go_order_code` varchar(36) NOT NULL COMMENT '订单号',
  `goder_type` varchar(2) default NULL COMMENT '订单类型',
  `usertype` varchar(1) default NULL COMMENT '顾客类型 : 1直客 2同行',
  `go_contact_name` varchar(50) NOT NULL COMMENT '联系人',
  `go_telphone` varchar(20) default NULL COMMENT '手机',
  `go_order_count` int(11) default NULL COMMENT '订单人数',
  `go_all_price` decimal(10,2) NOT NULL COMMENT '总价(不含返款)',
  `go_return_price` decimal(10,2) default NULL COMMENT '返款',
  `go_content` varchar(200) default NULL COMMENT '备注',
  `crtuser` varchar(36) default NULL COMMENT '创建人',
  `crtuser_name` varchar(32) default NULL COMMENT '创建人名字',
  `create_dt` datetime default NULL COMMENT '创建时间',
  `modifier` varchar(36) default NULL COMMENT '修改人',
  `modifier_name` varchar(32) default NULL COMMENT '修改人名字',
  `modify_dt` datetime default NULL COMMENT '修改时间',
  `delflag` int(11) default NULL COMMENT '删除标记',
  `del_dt` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_ORDER_MAIN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_order_main` */

insert  into `jeecg_order_main`(`id`,`go_order_code`,`goder_type`,`usertype`,`go_contact_name`,`go_telphone`,`go_order_count`,`go_all_price`,`go_return_price`,`go_content`,`crtuser`,`crtuser_name`,`create_dt`,`modifier`,`modifier_name`,`modify_dt`,`delflag`,`del_dt`) values ('8a8a8a813ee37e07013ee37f599b0001','C001','1','1','2','',100,'200.00','3000.00','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8ab1c1153ee9df5a013ee9e153e30001','C002','2','1','123','',123123,'222.00','222.00','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `jeecg_order_product` */

DROP TABLE IF EXISTS `jeecg_order_product`;

CREATE TABLE `jeecg_order_product` (
  `id` varchar(36) NOT NULL,
  `GORDER_ID` varchar(36) default NULL COMMENT '关联主订单外键',
  `go_order_code` varchar(36) NOT NULL COMMENT '团购订单号',
  `gop_product_type` varchar(3) NOT NULL COMMENT '服务项目类型',
  `gop_product_name` varchar(100) default NULL COMMENT '产品名称',
  `gop_count` int(11) default NULL COMMENT '个数',
  `gop_one_price` decimal(10,2) default NULL COMMENT '单价',
  `gop_sum_price` decimal(10,2) default NULL COMMENT '小计',
  `gop_content` varchar(200) default NULL COMMENT '备注',
  `crtuser` varchar(36) default NULL COMMENT '创建人',
  `crtuser_name` varchar(32) default NULL COMMENT '创建人名字',
  `create_dt` datetime default NULL COMMENT '创建时间',
  `modifier` varchar(36) default NULL COMMENT '修改人',
  `modifier_name` varchar(32) default NULL COMMENT '修改人名字',
  `modify_dt` datetime default NULL COMMENT '修改时间',
  `delflag` int(11) default NULL COMMENT '删除标记',
  `del_dt` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_ORDER_PRODUCT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_order_product` */

insert  into `jeecg_order_product`(`id`,`GORDER_ID`,`go_order_code`,`gop_product_type`,`gop_product_name`,`gop_count`,`gop_one_price`,`gop_sum_price`,`gop_content`,`crtuser`,`crtuser_name`,`create_dt`,`modifier`,`modifier_name`,`modify_dt`,`delflag`,`del_dt`) values ('8a8a8a813ed3f193013ed410b5c70036',NULL,'9999','2','产品1234',1,'1.00',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ed3f193013ed410b6530037',NULL,'9999','2','产品123456',1,'1.00',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813edeee60013edeefe09f0005',NULL,'123456','','',NULL,NULL,NULL,'','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edeee60013edeefe09f0006',NULL,'123456','','',NULL,NULL,NULL,'','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edf898e013edf8b2b230004','8a8a8a813edf898e013edf8b2b140001','A01','1','苹果',NULL,NULL,NULL,'','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813edf898e013edf8b2b520005','8a8a8a813edf898e013edf8b2b140001','A01','2','栗子',NULL,NULL,NULL,'','','',NULL,'','',NULL,NULL,NULL),('8a8a8a813ef47c6e013ef47fbece0015',NULL,'1231','1','1233333',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef47fbedd0016',NULL,'1231','1','3333333',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef48071550022',NULL,'C002','1','产品名称11',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef48071640023',NULL,'C002','1','产品名称22',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef4807cce0025',NULL,'C001','2','产品名称11',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a8a8a813ef47c6e013ef4807cce0026',NULL,'C001','2','产品名称12',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8aa6cad73e9ddad8013e9dea18cc000b',NULL,'123456','2','1234456',1,'1.00',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8aa6cad73e9ddad8013e9dea18cc000c',NULL,'123456','1','21234456',2,'2.00',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8aa6cad73e9ddad8013e9dea18dc000d',NULL,'123456','1','31234456',3,'3.00',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `jg_person` */

DROP TABLE IF EXISTS `jg_person`;

CREATE TABLE `jg_person` (
  `id` varchar(255) NOT NULL,
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` date default NULL COMMENT '生日',
  `createdt` datetime NOT NULL COMMENT '出生日期',
  `name` varchar(255) default NULL COMMENT '用户名',
  `salary` decimal(19,2) NOT NULL COMMENT '工资',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_JG_PERSON` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jg_person` */

insert  into `jg_person`(`id`,`age`,`birthday`,`createdt`,`name`,`salary`) values ('8a8a8a813ed3f193013ed4146736003b',20,'2013-03-14','2013-03-12 02:52:45','张三','10000.00'),('8a8a8a813ed3f193013ed414685f003d',30,'2013-04-24','2013-04-24 04:43:26','李四','9000.00');

/*Table structure for table `t_s_attachment` */

DROP TABLE IF EXISTS `t_s_attachment`;

CREATE TABLE `t_s_attachment` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `userid` varchar(32) default NULL COMMENT '用户ID',
  `businesskey` varchar(32) default NULL,
  `infotypeid` varchar(32) default NULL COMMENT '类型ID',
  `attachmenttitle` varchar(100) default NULL,
  `realpath` varchar(100) default NULL COMMENT '附件路径',
  `subclassname` text,
  `createdate` datetime default NULL,
  `attachmentcontent` longblob COMMENT '附件内容',
  `swfpath` text COMMENT 'flash路径',
  `note` text,
  `extend` varchar(32) default NULL,
  `busentityname` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `IDX_ATTACHMENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_attachment` */

insert  into `t_s_attachment`(`id`,`userid`,`businesskey`,`infotypeid`,`attachmenttitle`,`realpath`,`subclassname`,`createdate`,`attachmentcontent`,`swfpath`,`note`,`extend`,`busentityname`) values ('297e5a493da6ed99013da7055cb00069',NULL,NULL,NULL,'系统iframe打开tab说明','upload/files/20130326220619IrYnrTQY.txt','jeecg.system.pojo.base.TSDocument','2013-03-26 22:06:19','\0ٵP@\0Ëƒt8̊ퟧ?Sʃ̂????˃ɓP̈????Hퟧ?𿈸u΀𨝗??[ʐÍ@\0鸿??iп??Sƀt-̘􅛴&J|9۽)Ӆʼ9ڿD$齻??1ӫ劙쫋D$麺??\0ēVWʃʖʏ裿??ƒt0̊􎼪9Ͻ&ƿ~\")񹏾ʏ)񁲍铙??ʘ̒??ɜ0\0\0_^[ÅtVSVWUʃʖʏ˒Rƒt̒􏽂1??ʗ̫􉰁멵\0\0\0X9ٵ˞ˆ͔/̈??𨷙??˖ʩ򨪙??^[Ðƀt@ƒt1SVWʆʗ̏??􊸛ʆF)Ҿ򮵐ʋVWʑ󦟞tʙ쭚1k1CZʸ)џ^[Í@\0SVWʃʖ1??H˃ƀt#ĸ퟇?ĨĂ	Pʠ蒖??Ƀʰ􆄆\0먉Ѩ򿿉ǋƀtʺ̈??ʱ鈘??譹??_^[ËSVWʃʖʏʈ蕹??~ʰ鎹??ʲə蟠??[Ë3ʨ\0\0\0ēʓʊ1Ʌܴ̋??跢??ۛꚢ??閗??tPj\0赁??Ť??΀\0ǐƒtR譁??@\0ːƒtȜ0\0\0\0\0PR薁??΀\0SVʃʖ˃ƀtǃ\0\0\0\0P鹁??Nu韛Í@\0ƒļ??J??ı??RP銁??ű??꘿??SVWU𿿐Ą􋱉$̸ƶ	̇鹿??ή½??\0}(V΄$̌$ۿ\0\0蹹??ƛ~Δ$̇̋躜0\0\0몋݋ǋԨ􄜰\0Vˇ̌$̓靮񿿋؅ܽ3ۋǋԨՄ\0\0\0\0]_^[ËɏĄ??QR蕀??ń????蓀??Rʢف\0\0\0鄿??ђʢف\0\0\0逿??бɅӴ!R:\nt:Jt:Jt:JtĂ쩂BBʑZ)ҩ??΀\01ɅӴ-Rf;\nt f;Jtf;Jtf;JtĂ줃ĂĂʑZ)ґꪔ??΀\01Ɋ\nB黾??WPQʗ1rfе??_魿??@\01ɅӴ̊????SVW\0??ً򋰁󿜰\0\0~ܿ\0\0\0̇障0\0\0;ٿ̃ƀu3kP΄$̏ۿ\0\0裷??}3k;ٽ̃Ȇƀ~Ζ̌Ҩ??\0\0\0_^[ÐƀtÐ\0\0زU@\0Ët̀??̀SVWUQ̪Ʉ$̅餿??ƛtB˄$̜0锿??̈́3銽??ƶ~̎ɋ׋$̜0萕??ɍw̅肕??$̗贽??_^[ÐSVWUĄퟤ?̪Ʉ$̅龿??̄$鳿??ƛuƶt1̈́顼??̋ɋ׋ƨ-ֿ??ɍ_̄$螕??$̗鐼??upload/files/20130326220619IrYnrTQY.swf',NULL,'txt',NULL),('297e5a493da6ed99013da706dc0d006a',NULL,NULL,NULL,'查询DB2表属性','upload/files/20130326220757GtOq6EUI.docx','jeecg.system.pojo.base.TSDocument','2013-03-26 22:07:57','\0ٵP@\0Ëƒt8̊ퟧ?Sʃ̂????˃ɓP̈????Hퟧ?𿈸u΀𨝗??[ʐÍ@\0鸿??iп??Sƀt-̘􅛴&J|9۽)Ӆʼ9ڿD$齻??1ӫ劙쫋D$麺??\0ēVWʃʖʏ裿??ƒt0̊􎼪9Ͻ&ƿ~\")񹏾ʏ)񁲍铙??ʘ̒??ɜ0\0\0_^[ÅtVSVWUʃʖʏ˒Rƒt̒􏽂1??ʗ̫􉰁멵\0\0\0X9ٵ˞ˆ͔/̈??𨷙??˖ʩ򨪙??^[Ðƀt@ƒt1SVWʆʗ̏??􊸛ʆF)Ҿ򮵐ʋVWʑ󦟞tʙ쭚1k1CZʸ)џ^[Í@\0SVWʃʖ1??H˃ƀt#ĸ퟇?ĨĂ	Pʠ蒖??Ƀʰ􆄆\0먉Ѩ򿿉ǋƀtʺ̈??ʱ鈘??譹??_^[ËSVWʃʖʏʈ蕹??~ʰ鎹??ʲə蟠??[Ë3ʨ\0\0\0ēʓʊ1Ʌܴ̋??跢??ۛꚢ??閗??tPj\0赁??Ť??΀\0ǐƒtR譁??@\0ːƒtȜ0\0\0\0\0PR薁??΀\0SVʃʖ˃ƀtǃ\0\0\0\0P鹁??Nu韛Í@\0ƒļ??J??ı??RP銁??ű??꘿??SVWU𿿐Ą􋱉$̸ƶ	̇鹿??ή½??\0}(V΄$̌$ۿ\0\0蹹??ƛ~Δ$̇̋躜0\0\0몋݋ǋԨ􄜰\0Vˇ̌$̓靮񿿋؅ܽ3ۋǋԨՄ\0\0\0\0]_^[ËɏĄ??QR蕀??ń????蓀??Rʢف\0\0\0鄿??ђʢف\0\0\0逿??бɅӴ!R:\nt:Jt:Jt:JtĂ쩂BBʑZ)ҩ??΀\01ɅӴ-Rf;\nt f;Jtf;Jtf;JtĂ줃ĂĂʑZ)ґꪔ??΀\01Ɋ\nB黾??WPQʗ1rfе??_魿??@\01ɅӴ̊????SVW\0??ً򋰁󿜰\0\0~ܿ\0\0\0̇障0\0\0;ٿ̃ƀu3kP΄$̏ۿ\0\0裷??}3k;ٽ̃Ȇƀ~Ζ̌Ҩ??\0\0\0_^[ÐƀtÐ\0\0زU@\0Ët̀??̀SVWUQ̪Ʉ$̅餿??ƛtB˄$̜0锿??̈́3銽??ƶ~̎ɋ׋$̜0萕??ɍw̅肕??$̗贽??_^[ÐSVWUĄퟤ?̪Ʉ$̅龿??̄$鳿??ƛuƶt1̈́顼??̋ɋ׋ƨ-ֿ??ɍ_̄$螕??$̗鐼??]_^[ēVRPʓ1LԐƉtA􊵲Ҩ蔼??ƋDܔʲƀt\n̈􁎨ٔ??ꛘ苼??[XͤտᄓVWʆʗ9ѴrƶtQƿtT̆􋗼)ѷÒªt&ˎ˟9ڵAJt̎̟9ڵ4ĆćJu㫆ĆćZĢtfˎf˟f9ڵ!k̗??̆??Zf9ڵ	©«f9ڟ^[Í@\0U̬SVW̹̰̆̚钾??}3ܫK;Ľ̘ƿ}3k+û𽂋ǋӃ҃֋MҨ߼??[]\0΀\0SVWUQ̨̹̅̚\0膾??ƶ~nĻ|i;󼥅??̆+ëǋퟗ?3??ƿu3	$빍鍻??$ƛ~̋ɋ$̅\0蓓??~+??0̈́p̏ɋ$͔Z鸓??˔$誻??_^[Í@\0SVWUĄퟭ?T$Ʉ$˄$鱽??ƶ~ū$̜0頽??Ļ}3ܫK;󽂋ߍ>醺??ƛ~̋ɋՋD$̜0靮Կ??ɍT]\0˄$黒??~\Z󍔵\0+󋏃ɋD$̜0̈́X青??$̕莺??]_^[ËtKƒt:SVWʆʗ̏??̖??x fˆĆ)Ҿ򦯵ʋVWʑ󦧟^tʙ쫚1k\n1CZʸ)ё頞[ēVW̸̲3ۅ??̆艺??ˇꀼ??~;𽂋ƋȃɋӋ酒??̓鸹??[Í@\0ːƒtP̊??R腻??Ĵ񿿉Ð1ʓˊVWʃδ\n̼˖̆؋ف\0\0\0茜0\0\0ĆO蠞[ÐƉĊ\0\0\0SVWʃʖʏ1Ҋ˖1ɼ\nt\"<t<t$<\rt3<tM<t<t\nЂ_^[Ꝝѿ??ÄO𫅉ʋʋʋăO૲Uʕ̔.\nʘ\\.̌.˒茿??鞫Uʕʘ\\.ʲ醿??𝟞[Ðف\0\0\0ꣿ??1ʓˊVWʃδ\n̼˖̆؋ف\0\0\0霧\0\0\0ĆO犘_^[Í@\0ý`М0\0t??М0ð貏??񜰏Š\0\0\0PSVWʃʖʏ1Ҋ˖<\nt%<t><tQ<\rt\\<tv<Ą\0\0\0<ċ\0\0\0阜0\0\0Ĺʘ\n薱??\0\0\0ʊ讱??\0\0\0Ĺʘ陸??ʊ騸??ʘă騿??󫟕ʕ̔.\nʘ\\.̌.˒飿??鞫AUʕʘ\\.ʲ霰??𝫫ʘă茒\0\0O󫜉؉򃃄韋\0\0O񫋟^[XЂꌎ??[XË9\0\0\0Ꝯ??бʓˊVWʃδ\n̼˖̆؋ف\0\0\0褜0\0\0ĆO蠞[Ðý`М0\0t??М0ð鲎??VWƉİ\0\0\0ʃʖʏ1Ҋ˖<\nt\"<t-<t8<\rtC<t]<to<tzЂ_^[鳎??ă蹴??󫮉؃Ä讽??󫟉؃Ð胿??󫐕ʕ̔.\nʘ\\.̌.˒龿??鞫2Uʕʘ\\.ʲ蠿??𝫜˃ă雑\0\0O󫜲˃ă衜n\0\0O󟞛Ðý`М0\0t??М0ð蚍??VWUʃʖ1
Aμ\n̯??O𑋏)¾ʂퟅ?Վ??˗˒˜ny\nt1yt=ytIy\rtUytpyĀ\0\0\0yĈ\0\0\0Ђ]_^[鮍??0٨+ဿ؄\0\0\0콋0٨b??\0\0\0쬍0٨Q??\0\0\0웱ɊJ????̌\nˉ͔0٨a\0\0\0X뻱ɊJ̌Qʑ͔0٨,??윢˔0٨o\0\0؄\0\0\0둉ы0٨d	\0\0؄\0\0\0GćMŔ??)¾\n͔𨋍??^[ËSVWUʃʖʏ̬$ʏy\nt1ytCytRy\rtayt}yđ\0\0\0yĜ\0\0\0Ђ]_^[鷌??˖趮??ĆMu祈\0\0\0ʘ˖駵??ĆMuךּʘʲ链??ĆMuﬦ1ɊOμ9ʘʲ̏??c??7Mu묅ʘʲʹ贾??ˇ\\8t8Mu櫨ʘ˖騏\0\0ăĆMu䀹ʘ˖ʹ隈\0\0ăĆMu힟^[\0ÐR觊??tP鰻??ѐ諼??,˿??\0茜0\0\0Ëh\0\0\0Ë軯??ч˨T?Í@\0SVW̹̰̆̚鑯??Ǩɱ??̗J̃葮??C\0\0̃_^[ēVQ̲̘ɜ$˄$髶??̎̃訿??[Í@\0SQ̘3	$̃齯??̄̓鎴??$Z[Í@\0Бꂊ??P̄$??KD$??K$??˙Y\0ĕSVW1??$̌$	ʵ	Ӵ\\	ܴX	ӹ\n??Ě\0ď	ʹ\n??ę\0ķʍڀ\0\0\0W1??ᒒҖҗ9ಋw9߲)ޙb蜷Á\0\0\0t??Ě\0_^[]\0??촃΀\0USVW1??$̌$	ʵ	Ӵ]	ܴY	ӹ\n??Ě\0ď	ʹ??ę\0ʍڀ\0\0\0W1??ᒒҖҗ9ಋw9߲)ޙb犰ʺ[??0\0\0t??Ě\0_^[]\0??ӫ򃐀񠼑y@|1ұCʂԢ1CƂԠă΀\0y |y@|1ұCʐ1ӓ郏ΐԪă΀\0U̬ĄݓVW̸̲3ۃ}\0u	Ľ\0Ӏ냏݀Ʌ??j\n̅̕蒿??}??\0??0Ē\0Ʉࠃj\0j\n̅̕鱾??ʕĽ\0u}\0uڀ}??Ǆ߭C¿??0\0~࠿\0\0\0؁\0\0\0̗+ӻѼ	Ƅ @;ѽ??\rK˔߈@ƛ󋐊̆酋??[̥]\0΀\0U̬S̘??u̓3h+??]\0̀SVWUĄ쉔$̰݁\0\0\03??\0\0\0\0Ȅ$\0\0\0\0ƶu˄$ɨꮁ\0\0E|.??Ǆ$\0˄.??Ǆ$E논+uEӁ|.??˄.????t|.??ۜ0\0\0ʄ.鍋??Ɗ\0\0\0|.??EE˄.??Ðj\nrB񀪆rB恪r캋ퟆ?\0\0\0į0똋ퟆ?\0\0\0į7닋ퟆ?\0\0\0įWļ$\0u	ļ$\0rG냼C¼$??u	ļ$??0.̇ڒP̄$̔$ł $T$Ąʄ$ʔ$E3ܩf??|$\0œ\0\0\0̄$̔$??\0??$ʔ$鸜0\0\0˄.??Ðj\nsb̸§??0\0į0ļ$\0u	ļ$\0rI냼E¼$͌̌u¼$͌͌v밿-j\0j\n̄$̔$觼??̇ك$T$Ąʄ$ʔ$E3ܫЀ|$\0t̄$̔$??\0??$ʔ$ļ$\0uļ$\0tļ$\0u\nļ$\0Ӏ냏݀:D$tM|.??ր\nٴ˄$ɨ뇋$3҉̄$̔$Ą]_^[Ðƀt̀􃨳??ÐU̬??¹??\0ѩĶ??hς\0\0ËU̬ĄᔖWʍퟯ?E􋝼˛̅˸ƿ\Zƿ}Є鿅??􋖨ſ??\0\03	Eퟕ?ī˃ʅퟎ?3
FƋƋPʕ茐ƒt˲낳??m芅䌅䚷??tЄ覅??䈅ܴûu5ʝ༽𽝅??Ã̗Е脂̍𫏋ר;??E̕婌ſ??쟿̅婽Ŀ??Eퟤ?;}?ʽ솶t*̕쏯U范Ā3ʨǎ??퐋U􋒋Ã̎閾??̍쏯M茓Ă̅􋜰鎆??\0\0\0ăɻă̗+U퟾?茅華Eퟌ?ʨ2Ͽ??~.ą??ƿ|\"Gȅ??0\0\0̅P̅􍄃̍ퟭ?ɾ??􏵦̅􉘟^[̥]\0TÄ$髾??Sƀt̘ī˛SQ3ʨ\0\0\0[Ë¨??0\0[ĕ̬Ą𓖗̹ʕퟤ?̵3ۃ}??ĺ\0\0\0̅ퟤ?ƿ}??E􃨄̜0;Ƚ̸̐+׻򾂋򅶽3??Ά\0\0\0̅퟿?Eퟬ?̀ʅ􋅰̀ƀt̜0ʅ𫅳	Eퟬ?m􃀈苂??ǃ\0\0\0ăɳăн􁽼ƶ~5Ľ𜰴̖Е􋃳ʨ\nο??ퟭ?̃顽??̎Ѝ􋓋E????̕𨛽??ɘ_^[̥]\0ЋƉt3Ȝ0\0\0\0\0𿉸u\'Pʈ1ɊJ̔ƒt̈􅉴˒蝳??艂??̀S˘ƒt𿂸ƛt𿋸uPRʊ??Ŀ??ɐ[Ðƀt𿀸Í@\0Ą媜Δ$RP蠭??$\0\0\0u̄$낳ĜËhԿ??SV𾿿̘Ļ\0u+h\0\0΄$P̃P饬??ҁ萂\0\0̰ʳƶu̃ʃ̃\0\0^[Ð˕<`М0ƒt;Bt\n;Bt;Bu̂虿??ƒu䄫P谬??Œtz\\uĕ̬ѽ??Wʕퟤ?̅􉅴hͩ@\0骬??ƶt@hݩ@\0V顬??ƛt/h\0\0ͅҽ??E??ƀt̅𐍅ҽ??E??Ϳ??\0\0̅􀸜\u8̅􀸁\\Ɯr\0\0̅􃀂饿??>\0ŷ\0\0\0Ά钿??>\0Ť\0\0\0놋u􃆂̞+]􍃁P̅??ҽ????颜0\0\0Ά虿??̇+ƋЃԂº\0\0ϟ\0\0\0@PVͅҽ??P逫??׾??ű??酫??ľ??谫??㿿??̿??À=\0\0UƄҽ??؅\0\0+ĈPͅ㿿??ҽ??@P頫??㿿??\̿??̷>\0Ɩ??E𐍅ҽ??E??̿??_^[̥]īernel32.dll\0\0\0\0GetLongPathNameA\0\0\0\0U̬῿??E??\0\0ͅ俿??0諪??΅𐨙\0\0j\0hᬀ\0h\0\0h嫿??@΅𐨙\0\0j\0hᬀ\0h\0\0hǪ??t\"΅𐨙\0\0j\0h??0h\0\0hɪ??ŉ\0\0\03Uh֪@\0d?? ȅ膜0\0\0ͅ俿??\0\0衽??鐍E\0j\0ͅ俿??𐨨˿??\"΅鐍E\0j\0hl@\0̅𐨊˿??ǅǅ򜰳ZYYdɐhݪ@\0̅𐨘˿??ڿ??\0\0̅??俿??ʿ??E󐪃辩??Щ??=俿??ţ\0\0\0}󜰵\n}œ\0\0\0ͅ俿??ʿ??ƣ??٫K;.t\nͅ俿??ퟴ???؏ĝ\0\0\0C}t(̓+и\0\0+Ð΅鞩??j\0ͅ俿??ʿ????}󜰴dͅ俿??и\0\0+Ð΅󐓨&ʿ??\0ͅ俿??ʿ????E??ƣ??ӫи\0\0+Ð΅󐓨𨿿jj\0ͅ俿??ɿ??Ǟ[̥]Ĝ0\0Software\\Borland\\Locales\0\0\0\0Software\\Borland\\Delphi\\Locales\0\0\0\0\0茜0\0\0Ëh+\0\0\0ËSVW̺̰˝<`М0ƛt̗̃??t˛ƛuࠞ[ËSVW̺̰˝<`М0ƛt̃腻????t˛ƛu젞[Ëh\0\0\0Ëh#\0\0\0ËS̘؈\0\0\0铼??@`М0ɐʘĀ`М0[ÐSV˵@`М0ƶt\"̖;ѵ`М0̜0Ā`М0ڈ\0\0\0̆赼??ËօӴ\'̜nƉt̙;ٵ̱ˁɂڈ\0\0\0̆靲ݿ??ƒuڞ[ËU̬Ą𓖗ʅ??М0ʅퟏ?\0t93UhOm@\0d?? ̝ퟬ???ZYYdɐ읮꽔??ٿ??̜0ʅퟏ?\0uȟ^[YY]Ë<`М0ɐü`М0ËU̬Qʅ??h宀\0d??\"̅􋀄鵿??ZYYdɐh쮀\0̅??`М0u̅􋜰ü`М0럡<`М0ƀtː;U??U􋒉놋\0ƀu넩ܖ??Y]ËƒtȜ0\0\0\0\0PR˂??Í@\0ƒtRP˂R??ˈМ0ƉuËQ??ˈƉɐtˁQ??ƒĴ??ʇj\0TQR˂??tЗ꽻??ƀtP̜0??ɇ_ÅtP̜0??ЃP裦??x\0tЂ釻??h??Ȁ\0\0\0Í@\0U̬S̝̍̕̃鵎??t3k؂@\0[]\0̀U̬̅ĀP遦??\0ѕ̬SV̝΃P賦??ƶu	ҁ̃ˈ??Ǟ[]\0ƀy̜r Q\0Ɖt˔$??鶻??U̬Ą𓖉Mퟥ?3҃}𜰏ĸ\0\0\03??ć\0\0\0쬋U퟿?JAĺwȔ0F왁򿇜0\0v1Ξ;]??ہ대̠Ȝ0̚«c?K\\0b?JT0Ć렍^;]??̚«K0b?JT0Ć;Ms;u??u??u􎆄0\0윢;Ms̅퟿?HAĺv\nº??\0vFFF;Mr㎖̂^[YY]\0U̬Ą𓖉M􉕸ʅ􃽴\0u\n3	E𩉁\0\0ȅ𿿿????\0ĩ\0\0\0郜0\0\0̕??2F??l;uĘ\0\0\0ġ???.̕􊔲F̚c