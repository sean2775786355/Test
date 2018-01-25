/*
Navicat MySQL Data Transfer

Source Server         : db
Source Server Version : 50540
Source Host           : localhost:3366
Source Database       : hh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-08-20 13:33:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hh_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `hh_admin_user`;
CREATE TABLE `hh_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sailor_id` int(11) DEFAULT '0' COMMENT '雇员id',
  `username` varchar(100) DEFAULT ' ' COMMENT '用户名',
  `password` varchar(100) DEFAULT ' ' COMMENT '密码',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `head_pic` varchar(100) DEFAULT ' ' COMMENT '头像',
  `content` text COMMENT '描述',
  `status` tinyint(2) DEFAULT '1' COMMENT '账户状态：0，锁定；1，正常；2，禁用',
  `rank` int(5) DEFAULT '0' COMMENT '排序',
  `role_id` int(11) DEFAULT '0' COMMENT '角色表集合',
  `authority_id` varchar(255) DEFAULT '0' COMMENT '其他权限集合',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0：否；1：是；',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='登陆用户表';

-- ----------------------------
-- Records of hh_admin_user
-- ----------------------------
INSERT INTO `hh_admin_user` VALUES ('1', '1', ' admin', 'b8f0534b96bfd4a519c4894e0be3b138', '0', '0', ' ', '管理员', '1', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for `hh_attemper`
-- ----------------------------
DROP TABLE IF EXISTS `hh_attemper`;
CREATE TABLE `hh_attemper` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sailor_id` int(11) DEFAULT '0' COMMENT 'sailor表id',
  `name` varchar(20) DEFAULT ' ' COMMENT '船员姓名',
  `status` tinyint(2) DEFAULT '0' COMMENT '当前状态：0，待派；1，在船；2，休假；',
  `longevity_id` int(11) DEFAULT '0' COMMENT '当前海历id',
  `update_id` int(11) DEFAULT '0' COMMENT '更新id',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `boat_id` int(11) DEFAULT '0' COMMENT '当前所在船舶：0，无；',
  `duty` tinyint(2) DEFAULT '0' COMMENT '工作职位：0，水手；',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='船员调配表';

-- ----------------------------
-- Records of hh_attemper
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_authority`
-- ----------------------------
DROP TABLE IF EXISTS `hh_authority`;
CREATE TABLE `hh_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '描述',
  `rank` int(5) DEFAULT '0' COMMENT '排序',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of hh_authority
-- ----------------------------
INSERT INTO `hh_authority` VALUES ('1', '账户管理', '0', '1');
INSERT INTO `hh_authority` VALUES ('2', null, '0', '1');
INSERT INTO `hh_authority` VALUES ('3', null, '0', '1');
INSERT INTO `hh_authority` VALUES ('4', null, '0', '1');

-- ----------------------------
-- Table structure for `hh_boat`
-- ----------------------------
DROP TABLE IF EXISTS `hh_boat`;
CREATE TABLE `hh_boat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT ' ' COMMENT '船舶名称',
  `e_name` varchar(20) DEFAULT ' ' COMMENT '英文名称',
  `IMO` varchar(20) DEFAULT ' ' COMMENT 'IMO代码',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否禁用：0，否；1，是',
  `status` tinyint(2) DEFAULT '1' COMMENT '船舶状态：1，正常；2，在修',
  `type` tinyint(2) DEFAULT '0' COMMENT '船舶类型：0，；',
  `tonnage` int(7) DEFAULT '0' COMMENT '吨位（吨）',
  `horsepower` int(7) DEFAULT '0' COMMENT '主机马力',
  `model` varchar(20) DEFAULT ' ' COMMENT '主机型号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='船舶信息表';

-- ----------------------------
-- Records of hh_boat
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_boat_cwbt_relat`
-- ----------------------------
DROP TABLE IF EXISTS `hh_boat_cwbt_relat`;
CREATE TABLE `hh_boat_cwbt_relat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boat_id` int(11) DEFAULT '0',
  `service_level_id` int(11) DEFAULT '0',
  `content` text COMMENT '设备维护内容',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `equipment_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='船舶、CWBT关系表';

-- ----------------------------
-- Records of hh_boat_cwbt_relat
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_boat_manage`
-- ----------------------------
DROP TABLE IF EXISTS `hh_boat_manage`;
CREATE TABLE `hh_boat_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sailor_id` int(11) DEFAULT '0' COMMENT '职员id',
  `boat_id` int(11) DEFAULT '0' COMMENT '船舶id',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是；',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='船舶管理表';

-- ----------------------------
-- Records of hh_boat_manage
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `hh_certificate`;
CREATE TABLE `hh_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sailor_id` int(11) DEFAULT '0' COMMENT 'sailor表id',
  `name` varchar(40) DEFAULT ' ' COMMENT '证书名称',
  `num` int(20) DEFAULT '0' COMMENT '证书编号',
  `level` tinyint(2) DEFAULT '0' COMMENT '证书等级：0，；',
  `suit_level` tinyint(2) DEFAULT '0' COMMENT '适任职务：0，水手；',
  `work_date` int(11) DEFAULT '0' COMMENT '发证日期',
  `out_date` int(11) DEFAULT '0' COMMENT '过期日期',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1：是',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='证书信息表';

-- ----------------------------
-- Records of hh_certificate
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_cwbt`
-- ----------------------------
DROP TABLE IF EXISTS `hh_cwbt`;
CREATE TABLE `hh_cwbt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_1` char(2) DEFAULT '',
  `code_2` char(3) DEFAULT '000',
  `code_3` char(3) DEFAULT '000',
  `code_4` char(3) DEFAULT '000',
  `name` varchar(100) DEFAULT ' ' COMMENT '名称',
  `content` text COMMENT '描述',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CWBT代码表';

-- ----------------------------
-- Records of hh_cwbt
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_cwbt_1`
-- ----------------------------
DROP TABLE IF EXISTS `hh_cwbt_1`;
CREATE TABLE `hh_cwbt_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT '' COMMENT '代码',
  `name` varchar(100) DEFAULT ' ' COMMENT '名称',
  `e_name` varchar(100) DEFAULT ' ' COMMENT '英文名称',
  `content` text COMMENT '描述',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='CWBT主系统代码表';

-- ----------------------------
-- Records of hh_cwbt_1
-- ----------------------------
INSERT INTO `hh_cwbt_1` VALUES ('1', 'AS', '空气系统', 'AIR SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('2', 'BW', '海水系统', 'BITER WATER SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('3', 'BS', '压舱水系统', 'BILGE SYSTEMS', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('4', 'CG', '装卸货设备', ' CARGO HANDLING GEAR', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('5', 'DO', '加班船装设备', ' DECK OUEFITTINGS', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('6', 'ES', '电力系统', 'ELECTRIC SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('7', 'FW', '淡水系统', 'FRESH WATER SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('8', 'GD', '柴油发电原动机', 'DIESEL ENGINE GENERATOR', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('9', 'GT', '发电汽轮机', 'STEAM TURBINE ENGINE GENERATOR', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('10', 'GS', '蒸汽发电原动机', 'STEAM ENGINE GENERATOR', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('11', 'HS', '船体部分', 'HULL STRUCTURE', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('12', 'IC', '整数文件资料', 'INFORMATIONS AND CERTIFICATES', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('13', 'JF', '工程机械设备', 'JOB ENGINEERING FACILITIES', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('14', 'KP', '防污染设备', 'ANTI-POLLUTION EQUIPMENT', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('15', 'LO', '滑油系统', 'LUBRICATING OIL SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('16', 'MD', '柴油机主机', 'MAIN DIESEL ENGINE', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('17', 'MS', '蒸汽机主机', 'MAIN STEAM ENGINR', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('18', 'MT', '汽轮机主机', 'MAIN STEAM TURBINE ENGINE', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('20', 'MW', '射流主机', 'MAIN WATER SPRAY ENGINE', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('22', 'NC', ' 通讯导航设备', 'COMMUNICATION AND NAVIGATION EUQIOMENT', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('23', 'OE', '办公设备', 'OFFICE EQUIPMENT', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('24', 'OS', '燃油系统', 'FUEL OIL SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('25', 'PM', '船舶推进与操作系统', 'PROPULISION AND MANEUVERING SYSTEM FOR SHIP', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('26', 'QL', '生活设施', 'LIVING FACILITIES', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('27', 'RA', '冷藏空调通风系统', 'REFRIGERATION AIR CONDITIONING AND VENTILIATION SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('28', 'SE', '安全与应急设备', 'SAFETY SYSTEM AND EMERGENCY EQUIPMENT', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('29', 'TS', '蒸汽系统', 'STEAM SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('30', 'UA', '自动化检测与遥控系统', 'AUTOMATIC CONTROL AND REMOTE MONITORING SYSTEM', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('19', 'ME', '电动主机', 'MAIN ELECTRIC POWER ENGINE', null, '1', '0', '0');
INSERT INTO `hh_cwbt_1` VALUES ('21', 'MG', '燃气主机', 'MAIN GAS TURBINE ENGINE', null, '1', '0', '0');

-- ----------------------------
-- Table structure for `hh_cwbt_2`
-- ----------------------------
DROP TABLE IF EXISTS `hh_cwbt_2`;
CREATE TABLE `hh_cwbt_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) DEFAULT '000' COMMENT '代码',
  `name` varchar(100) DEFAULT ' ' COMMENT '设备名称',
  `content` text COMMENT '描述',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CWBT系统组件代码表';

-- ----------------------------
-- Records of hh_cwbt_2
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_cwbt_3`
-- ----------------------------
DROP TABLE IF EXISTS `hh_cwbt_3`;
CREATE TABLE `hh_cwbt_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) DEFAULT '000' COMMENT '代码',
  `name` varchar(100) DEFAULT ' ' COMMENT '设备名称',
  `content` text COMMENT '描述',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='CWBT维修部件代码表';

-- ----------------------------
-- Records of hh_cwbt_3
-- ----------------------------
INSERT INTO `hh_cwbt_3` VALUES ('1', '001', '气缸盖', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('2', '002', '进气阀', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('3', '003', '排气阀', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('4', '004', '喷油嘴', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('5', '005', '安全阀', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('6', '006', '示功阀', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('7', '007', '起动阀', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('8', '008', '摇臂装置', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('9', '009', '缸套', null, '0', '0', '1');
INSERT INTO `hh_cwbt_3` VALUES ('10', '010', '活塞', null, '0', '0', '1');

-- ----------------------------
-- Table structure for `hh_cwbt_4`
-- ----------------------------
DROP TABLE IF EXISTS `hh_cwbt_4`;
CREATE TABLE `hh_cwbt_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) DEFAULT '000' COMMENT '自定义代码',
  `name` varchar(100) DEFAULT ' ' COMMENT '自定义名称',
  `content` text COMMENT '描述',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，不可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CWBT自定义代码表';

-- ----------------------------
-- Records of hh_cwbt_4
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_date_count`
-- ----------------------------
DROP TABLE IF EXISTS `hh_date_count`;
CREATE TABLE `hh_date_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) DEFAULT '0' COMMENT '设备表id',
  `boat_id` int(11) DEFAULT '0' COMMENT '船舶表id',
  `service_level` char(1) DEFAULT 'A' COMMENT '设备维护级别：A,B,C,D,E,F,G,H',
  `day` int(4) DEFAULT '0' COMMENT '当前运行日期',
  `hour` int(6) DEFAULT '0' COMMENT '当前运行小时',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hh_date_count
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_duty`
-- ----------------------------
DROP TABLE IF EXISTS `hh_duty`;
CREATE TABLE `hh_duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duty_name` varchar(40) DEFAULT ' ' COMMENT '职务名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hh_duty
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_employee`
-- ----------------------------
DROP TABLE IF EXISTS `hh_employee`;
CREATE TABLE `hh_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '0' COMMENT '姓名',
  `age` tinyint(3) DEFAULT '0' COMMENT '年龄',
  `phone` int(11) DEFAULT '0' COMMENT '手机',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='雇员表';

-- ----------------------------
-- Records of hh_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_equipment`
-- ----------------------------
DROP TABLE IF EXISTS `hh_equipment`;
CREATE TABLE `hh_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT ' ' COMMENT '设备名称',
  `producer` varchar(200) DEFAULT ' ' COMMENT '生产商',
  `type` varchar(50) DEFAULT ' ' COMMENT '设备型号',
  `product_time` int(11) DEFAULT '0' COMMENT '生产时间',
  `create_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `boat_id` int(11) DEFAULT '0',
  `cwbt_id` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '设备状态：1，正常运行；2，维修中；3，设备故障',
  `daily_hour` int(4) DEFAULT '0' COMMENT '日均使用时间',
  `cwbt_code` char(14) DEFAULT '' COMMENT 'cwbt代码',
  `e_type` tinyint(2) DEFAULT '0' COMMENT '设备类型：0：轮机部；1：甲板部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设备信息表';

-- ----------------------------
-- Records of hh_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_longevity`
-- ----------------------------
DROP TABLE IF EXISTS `hh_longevity`;
CREATE TABLE `hh_longevity` (
  `id` int(11) NOT NULL,
  `sailor_id` int(11) DEFAULT '0' COMMENT 'sailor表id',
  `duty` tinyint(2) DEFAULT '0' COMMENT '工作职位：0，水手；',
  `onboard_time` int(11) DEFAULT '0' COMMENT '上船时间',
  `ashore_time` int(11) DEFAULT '0' COMMENT '下船时间',
  `boat_id` int(11) DEFAULT '0' COMMENT 'boat表id',
  `boat_name` varchar(20) DEFAULT ' ' COMMENT '船舶名称',
  `boat_IMO` varchar(20) DEFAULT ' ' COMMENT '船舶IMO代码',
  `boat_type` tinyint(2) DEFAULT '0' COMMENT '船舶类型：0，；',
  `tonnage` int(7) DEFAULT '0' COMMENT '吨位（吨）',
  `horsepower` int(7) DEFAULT '0' COMMENT '主机马力',
  `model` varchar(20) DEFAULT ' ' COMMENT '主机型号',
  `company` varchar(40) DEFAULT ' ' COMMENT '船舶公司',
  `create_id` int(11) DEFAULT '0' COMMENT '创建时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='海历信息表';

-- ----------------------------
-- Records of hh_longevity
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_menu`
-- ----------------------------
DROP TABLE IF EXISTS `hh_menu`;
CREATE TABLE `hh_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT ' ' COMMENT '菜单名称',
  `controller_name` varchar(20) DEFAULT ' ' COMMENT '控制器代码',
  `action_name` varchar(20) DEFAULT ' ' COMMENT '页面权限代码',
  `params` varchar(30) DEFAULT ' ' COMMENT '参数',
  `class_code` varchar(50) DEFAULT ' ' COMMENT '样式代码',
  `ptype` tinyint(2) DEFAULT '0' COMMENT '分类：0，最高级；1，次级；2最低级',
  `rank` int(5) DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示，1：显示；0不现实',
  `parent_id` int(11) DEFAULT '0' COMMENT '上级菜单id',
  `content` text,
  `is_power` tinyint(2) DEFAULT '1' COMMENT '是否参与权限控制，0：否；1，是',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `url` varchar(50) DEFAULT ' ' COMMENT '路径',
  `first_code` varchar(20) DEFAULT ' ' COMMENT '菜单样式',
  `second_code` varchar(20) DEFAULT ' ' COMMENT '菜单备用样式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of hh_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_role`
-- ----------------------------
DROP TABLE IF EXISTS `hh_role`;
CREATE TABLE `hh_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT ' ' COMMENT '角色名称',
  `content` text COMMENT '职位描述',
  `rank` int(5) DEFAULT '0' COMMENT '排序',
  `authority_id` varchar(255) DEFAULT '0' COMMENT '权限集合',
  `is_band` tinyint(2) DEFAULT '1' COMMENT '是否可用：1，可用；0，禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of hh_role
-- ----------------------------
INSERT INTO `hh_role` VALUES ('1', ' 管理员权限', '管理员权限', '0', '1,2,3,4,5,6,7,8,9,10,11', '1');

-- ----------------------------
-- Table structure for `hh_sailor`
-- ----------------------------
DROP TABLE IF EXISTS `hh_sailor`;
CREATE TABLE `hh_sailor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sailor_num` int(11) DEFAULT '0' COMMENT '船员编号',
  `name` varchar(20) DEFAULT ' ' COMMENT '中文名',
  `e_name` varchar(20) DEFAULT ' ' COMMENT '英文名',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别：0，男；1，女',
  `duty` tinyint(2) DEFAULT '0' COMMENT '职务：0，水手；20，岸基船舶管理员；',
  `birth` int(11) DEFAULT '0' COMMENT '出生日期',
  `native_place` varchar(100) DEFAULT ' ' COMMENT '籍贯',
  `edu` tinyint(2) DEFAULT '0' COMMENT '文化程度：0，小学；1，初中；2，高中；3，职高；4，本科；5，大专；6，硕士；7，博士',
  `length` int(3) DEFAULT '0' COMMENT '身高cm',
  `weight` int(3) DEFAULT '0' COMMENT '体重kg',
  `blood_type` varchar(2) DEFAULT 'A' COMMENT '血型：A，B , O , AB',
  `school` varchar(40) DEFAULT ' ' COMMENT '毕业学校',
  `major` varchar(40) DEFAULT ' ' COMMENT '专业',
  `gra_time` int(11) DEFAULT '0' COMMENT '毕业时间',
  `address` varchar(100) DEFAULT ' ' COMMENT '家庭地址',
  `phone` int(11) DEFAULT '0' COMMENT '联系电话',
  `marriage` tinyint(2) DEFAULT '0' COMMENT '婚姻状况：0，未婚；1，已婚',
  `health` tinyint(2) DEFAULT '0' COMMENT '健康状况：0，健康；1，不健康',
  `id_num` char(18) DEFAULT '0' COMMENT '身份证号',
  `relationship_name` varchar(20) DEFAULT ' ' COMMENT '亲属1姓名',
  `relationship` tinyint(2) DEFAULT '0' COMMENT '关系：0，父；1，母；2，配偶；3，子女；4，其他',
  `relationship_phone` int(11) DEFAULT '0' COMMENT '亲属联系电话',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_sailor` tinyint(2) DEFAULT '1' COMMENT '是否为船员：0，否；1，是；',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='船员信息表';

-- ----------------------------
-- Records of hh_sailor
-- ----------------------------
INSERT INTO `hh_sailor` VALUES ('1', '0', 'test', 'test', '0', '0', '0', ' ', '0', '0', '0', 'A', ' ', ' ', '0', ' ', '0', '0', '0', '0', ' ', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `hh_service_date`
-- ----------------------------
DROP TABLE IF EXISTS `hh_service_date`;
CREATE TABLE `hh_service_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) DEFAULT '0' COMMENT '设备id',
  `bcr_id` int(11) DEFAULT '0',
  `finish_time` int(11) DEFAULT '0' COMMENT '完成时间',
  `did_id` int(11) DEFAULT '0' COMMENT '维护者id',
  `check_id` int(11) DEFAULT '0' COMMENT '审核人',
  `check_status` tinyint(2) DEFAULT '0' COMMENT '工作卡状态：0，未分配；1，已分配未执行；2，已执行未审核；3，已执行审核未通过；4，已执行船上审核通过；5，岸上审核通过；6，岸上审核未通过',
  `is_band` tinyint(2) DEFAULT '0' COMMENT '是否放弃维护：0，否；1，是',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `is_done` tinyint(2) DEFAULT '0' COMMENT '是否完成：0，否；1，是',
  `content` text COMMENT '维护报告内容',
  `did_time` int(11) DEFAULT '0' COMMENT '维护完成时间',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `date_type` tinyint(2) DEFAULT '1' COMMENT '维护状态：1，正常维护；0，临时维护',
  `check_type` tinyint(2) DEFAULT '0' COMMENT '报告状态：0，未执行；1，按时完成；2，提前完成；3，过期完成；4，遗留完成；5，缺陷完成',
  `status` tinyint(2) DEFAULT '0' COMMENT '工作卡状态：0，未完成；1，计划；2，指令；3，超期；4，安排；5，遗留；6，取消',
  `service_level` char(11) DEFAULT 'A' COMMENT '维护等级：A，1天；B，1周；C，1月；D，3月；E，6月；F，12月；G，30月；H，60月',
  `service_content` text COMMENT '计划维护要求',
  `shore_id` int(11) DEFAULT '0' COMMENT '岸基审核人id',
  `boat_id` int(11) DEFAULT '0' COMMENT '船舶id',
  `shore_time` int(11) DEFAULT '0' COMMENT '岸基审核时间',
  `estimated_time` int(11) DEFAULT '0' COMMENT '预期完成时间',
  `shore_content` text COMMENT '岸基审核说明',
  `pre_id` int(11) DEFAULT '0',
  `type` tinyint(2) DEFAULT '0' COMMENT '计算方式：0，按日期；1，按小时',
  `check_content` text COMMENT '维护退回说明',
  `e_type` tinyint(2) DEFAULT '0' COMMENT '设备部门：0，轮机部；1：甲板部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设备维护周期表';

-- ----------------------------
-- Records of hh_service_date
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_service_level`
-- ----------------------------
DROP TABLE IF EXISTS `hh_service_level`;
CREATE TABLE `hh_service_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` char(1) DEFAULT 'A' COMMENT '维护等级：A，1天；B，1周；C，1月；D，3月；E，6月；F，12月；G，30月；H，60月',
  `min_lack_date` tinyint(2) DEFAULT '0' COMMENT '最小误差时间（天）',
  `max_Lack_date` tinyint(2) DEFAULT '0' COMMENT '最大误差时间（天）',
  `date` int(10) DEFAULT '0' COMMENT '维护周期（天）',
  `content` text COMMENT '描述',
  `hour` int(4) DEFAULT '0' COMMENT '维护周期（小时）',
  `min_lack_hour` int(4) DEFAULT '0' COMMENT '最小误差时间（小时）',
  `max_lack_hour` int(4) DEFAULT '0' COMMENT '最大误差时间（小时）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='维护等级表';

-- ----------------------------
-- Records of hh_service_level
-- ----------------------------
INSERT INTO `hh_service_level` VALUES ('1', 'A', '0', '0', '1', null, '24', '0', '0');
INSERT INTO `hh_service_level` VALUES ('2', 'B', '1', '1', '7', null, '168', '0', '0');
INSERT INTO `hh_service_level` VALUES ('3', 'C', '7', '7', '30', null, '500', '50', '50');
INSERT INTO `hh_service_level` VALUES ('4', 'D', '30', '30', '90', null, '1500', '200', '200');
INSERT INTO `hh_service_level` VALUES ('5', 'E', '30', '30', '180', null, '3000', '400', '400');
INSERT INTO `hh_service_level` VALUES ('6', 'F', '30', '30', '360', null, '6000', '600', '600');
INSERT INTO `hh_service_level` VALUES ('7', 'G', '90', '90', '900', null, '15000', '800', '800');
INSERT INTO `hh_service_level` VALUES ('8', 'H', '90', '0', '1800', null, '30000', '2160', '0');

-- ----------------------------
-- Table structure for `hh_service_storage`
-- ----------------------------
DROP TABLE IF EXISTS `hh_service_storage`;
CREATE TABLE `hh_service_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建id',
  `content` text COMMENT '维护报告',
  `service_date_id` int(11) DEFAULT '0',
  `plan_time` int(11) DEFAULT '0' COMMENT '计划维护时间',
  `did_id` int(11) DEFAULT '0' COMMENT '维护者id',
  `did_time` int(11) DEFAULT '0' COMMENT '维护完成时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='维护存档表';

-- ----------------------------
-- Records of hh_service_storage
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_training`
-- ----------------------------
DROP TABLE IF EXISTS `hh_training`;
CREATE TABLE `hh_training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '培训类型：',
  `time` int(11) DEFAULT '0' COMMENT '培训时间',
  `content` text COMMENT '内容',
  `sailor_id` int(11) DEFAULT '0' COMMENT 'sailor表id',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='培训信息表';

-- ----------------------------
-- Records of hh_training
-- ----------------------------

-- ----------------------------
-- Table structure for `hh_training_type`
-- ----------------------------
DROP TABLE IF EXISTS `hh_training_type`;
CREATE TABLE `hh_training_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT ' ' COMMENT '培训项目',
  `content` text COMMENT '项目内容',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '是否删除：0，否；1，是',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='培训项目表';

-- ----------------------------
-- Records of hh_training_type
-- ----------------------------
