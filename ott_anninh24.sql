/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ott_anninh24

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-06-17 19:39:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
INSERT INTO `tbl_categories` VALUES ('1', '0', 'Nhóm 1', 'nhom-1', '1', null, null, null, '1');
INSERT INTO `tbl_categories` VALUES ('2', '0', 'Nhóm 2', 'nhom-2', '2', null, null, null, '1');
INSERT INTO `tbl_categories` VALUES ('3', '2', 'Nhóm 3', 'nhom-3', '2_3', '', '', '', '1');
INSERT INTO `tbl_categories` VALUES ('4', '3', 'Nhóm 4', 'nhom-4', '2_3_4', '', 'Hehe', 'Haha', '1');

-- ----------------------------
-- Table structure for tbl_channels
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channels`;
CREATE TABLE `tbl_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_channels
-- ----------------------------
INSERT INTO `tbl_channels` VALUES ('1', 'abc', null, 'dfsfdsf', null, null, null, null, '1');

-- ----------------------------
-- Table structure for tbl_channel_list
-- ----------------------------
DROP TABLE IF EXISTS `tbl_channel_list`;
CREATE TABLE `tbl_channel_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `ftime` int(11) DEFAULT NULL,
  `ttime` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_channel_list
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_configsite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configsite`;
CREATE TABLE `tbl_configsite` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification` int(11) DEFAULT NULL,
  `work_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_descript` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_id` int(11) NOT NULL DEFAULT 0,
  `contact` text COLLATE utf8_unicode_ci NOT NULL,
  `footer` text COLLATE utf8_unicode_ci NOT NULL,
  `nick_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `skype1` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `skype2` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gplus` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email_notification` int(11) DEFAULT NULL,
  `sms_notification` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_configsite
-- ----------------------------
INSERT INTO `tbl_configsite` VALUES ('1', '0', '', 'ClassHub', '', 'Văn phòng 5g Media Kim Mã - Hà Nội', '096.954.9903', '096.954.9903  |  096.954.9903', '', 'tranviethiepdz@gmail.com', '5', '8:00 - 17:30, Thứ Hai - Chủ Nhật', '', '', '', 'classhub, họp online, họp trực tuyến, meeting online', 'ClassHub - phần mềm họp trực tuyến', '0', '', '', '', '', '', '', 'https://twitter.com/', 'https://plus.google.com/?hl=vi', 'https://www.facebook.com/', 'https://www.youtube.com/', null, null);

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member` (
  `idi` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `vodlike` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gsecret` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isfa2` tinyint(4) DEFAULT 0,
  `cdate` int(11) DEFAULT NULL,
  `is_trash` tinyint(4) DEFAULT 0,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`idi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_member
-- ----------------------------
INSERT INTO `tbl_member` VALUES ('1', 'tranviethiepdz@gmail.com', 'd93fc24a5f68f2d6621e2d3aff26b5600f38f1b6876ff04f0070b38a54b2d2f8|cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', null, null, null, null, null, null, '0', null, '0', '1');

-- ----------------------------
-- Table structure for tbl_member_folder
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_folder`;
CREATE TABLE `tbl_member_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `vods` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_member_folder
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_member_login
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_login`;
CREATE TABLE `tbl_member_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx` (`isactive`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_member_login
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `gsecret` varchar(50) DEFAULT NULL,
  `isfa2` tinyint(4) DEFAULT 0,
  `isadmin` tinyint(4) DEFAULT 0,
  `cdate` int(11) DEFAULT NULL,
  `is_trash` tinyint(4) DEFAULT 0,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
INSERT INTO `tbl_users` VALUES ('nxtuyen.pro@gmail.com', 'a25342213446980b5f750b37daed053ce347ec766265b78aa81d90c8217e5e39|cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', 'Nguyễn Xuân Tuyền', '0936831277', 'nxtuyen.pro@gmail.com', '1', null, '1', '1', '1586660652', '0', '1');
INSERT INTO `tbl_users` VALUES ('tranviethiepdz@gmail.com', 'd93fc24a5f68f2d6621e2d3aff26b5600f38f1b6876ff04f0070b38a54b2d2f8|cdf4a007e2b02a0c49fc9b7ccfbb8a10c644f635e1765dcf2a7ab794ddc7edac', 'Trần Hiệp', '096.954.990', 'tranviethiepdz@gmail.com', '2', null, '0', '1', '1591860947', '0', '1');

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isadmin` int(11) DEFAULT 1,
  `isactive` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_active` (`isactive`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_user_group
-- ----------------------------
INSERT INTO `tbl_user_group` VALUES ('1', '0', 'Origin', '', '1', '1', '1');
INSERT INTO `tbl_user_group` VALUES ('2', '1', 'Team công nghệ', '', '1_2', '1', '1');
INSERT INTO `tbl_user_group` VALUES ('3', '5', 'Báo điện tử', '', '1_4_5_3', '1', '1');
INSERT INTO `tbl_user_group` VALUES ('4', '1', 'Phòng dựng', '', '1_4', '1', '1');
INSERT INTO `tbl_user_group` VALUES ('5', '4', 'Nội dung số', '', '1_4_5', '1', '1');

-- ----------------------------
-- Table structure for tbl_user_login
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_login`;
CREATE TABLE `tbl_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx` (`isactive`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user_login
-- ----------------------------
INSERT INTO `tbl_user_login` VALUES ('1', 'nxtuyen.pro@gmail.com', '1591691016', '1591691016', '0');
INSERT INTO `tbl_user_login` VALUES ('2', 'nxtuyen.pro@gmail.com', '1591691462', '1591691462', '0');
INSERT INTO `tbl_user_login` VALUES ('3', 'nxtuyen.pro@gmail.com', '1591691505', '1591691505', '0');
INSERT INTO `tbl_user_login` VALUES ('4', 'nxtuyen.pro@gmail.com', '1591691535', '1591691535', '0');
INSERT INTO `tbl_user_login` VALUES ('5', 'nxtuyen.pro@gmail.com', '1591846685', '1591846685', '0');
INSERT INTO `tbl_user_login` VALUES ('6', 'nxtuyen.pro@gmail.com', '1591860927', '1591860927', '0');
INSERT INTO `tbl_user_login` VALUES ('7', 'tranviethiepdz@gmail.com', '1591860961', '1591860961', '0');
INSERT INTO `tbl_user_login` VALUES ('8', 'tranviethiepdz@gmail.com', '1591864790', '1591864790', '0');
INSERT INTO `tbl_user_login` VALUES ('9', 'tranviethiepdz@gmail.com', '1591870375', '1591870375', '0');
INSERT INTO `tbl_user_login` VALUES ('10', 'tranviethiepdz@gmail.com', '1591928118', '1591928118', '0');
INSERT INTO `tbl_user_login` VALUES ('11', 'tranviethiepdz@gmail.com', '1591928142', '1591928142', '0');
INSERT INTO `tbl_user_login` VALUES ('12', 'tranviethiepdz@gmail.com', '1591943359', '1591943359', '0');
INSERT INTO `tbl_user_login` VALUES ('13', 'tranviethiepdz@gmail.com', '1592188854', '1592188854', '0');
INSERT INTO `tbl_user_login` VALUES ('14', 'tranviethiepdz@gmail.com', '1592192613', '1592192613', '0');
INSERT INTO `tbl_user_login` VALUES ('15', 'tranviethiepdz@gmail.com', '1592206834', '1592206834', '0');
INSERT INTO `tbl_user_login` VALUES ('16', 'tranviethiepdz@gmail.com', '1592273320', '1592273320', '0');
INSERT INTO `tbl_user_login` VALUES ('17', 'tranviethiepdz@gmail.com', '1592294102', '1592294102', '0');
INSERT INTO `tbl_user_login` VALUES ('18', 'tranviethiepdz@gmail.com', '1592363890', '1592363890', '0');
INSERT INTO `tbl_user_login` VALUES ('19', 'tranviethiepdz@gmail.com', '1592368001', '1592368001', '0');
INSERT INTO `tbl_user_login` VALUES ('20', 'tranviethiepdz@gmail.com', '1592379908', '1592379908', '1');

-- ----------------------------
-- Table structure for tbl_vods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vods`;
CREATE TABLE `tbl_vods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `chanel_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `sapo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `fulltext` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `pdate` int(11) DEFAULT NULL,
  `visited` int(11) DEFAULT NULL,
  `liked` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `is_trash` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_vods
-- ----------------------------
INSERT INTO `tbl_vods` VALUES ('1', '1', '2', '1', 'Phòng công nghệ', 'phong-cong-nghe', 'Phòng công nghệ', 'medias/vods/videos/do-thi-nghich-thien-tien-ton_18e.jpg', '[]', '4', 'Phòng công nghệ', '1590404033', '1590404281', null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('2', '4', '3', '2', 'Team công nghệ', 'team-cong-nghe', '<p>Team công nghệ<br></p>', 'medias/vods/videos/Sơn Hải Phong Thần.jpg', '[]', '1', 'Team công nghệ', null, null, null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('3', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau:\r\n- Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới  \r\n- Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen  \r\n- WHO quan ngại về tình hình covid-19 tại nhiều nước\r\n- Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19\r\n- Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á\r\n- Thêm 1 ca mắc covid-19 mới </span><br></p>', '', '[]', '1', '', '1592117719', null, null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('4', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '3', '', '1592117719', '1592369440', null, null, null, '1', null);
INSERT INTO `tbl_vods` VALUES ('5', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '1', null);
INSERT INTO `tbl_vods` VALUES ('6', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '1', null);
INSERT INTO `tbl_vods` VALUES ('7', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '1', null);
INSERT INTO `tbl_vods` VALUES ('8', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '1', null);
INSERT INTO `tbl_vods` VALUES ('9', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('10', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('11', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('12', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('13', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('14', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '3', null);
INSERT INTO `tbl_vods` VALUES ('15', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '3', null);
INSERT INTO `tbl_vods` VALUES ('16', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '3', null);
INSERT INTO `tbl_vods` VALUES ('17', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '3', null);
INSERT INTO `tbl_vods` VALUES ('18', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '3', null);
INSERT INTO `tbl_vods` VALUES ('19', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '4', null);
INSERT INTO `tbl_vods` VALUES ('20', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '4', null);
INSERT INTO `tbl_vods` VALUES ('21', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '4', null);
INSERT INTO `tbl_vods` VALUES ('22', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '4', null);
INSERT INTO `tbl_vods` VALUES ('23', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '4', null);
INSERT INTO `tbl_vods` VALUES ('24', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('25', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('26', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('27', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('28', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('29', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '6', null);
INSERT INTO `tbl_vods` VALUES ('30', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '6', null);
INSERT INTO `tbl_vods` VALUES ('31', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '6', null);
INSERT INTO `tbl_vods` VALUES ('32', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '6', null);
INSERT INTO `tbl_vods` VALUES ('33', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '6', null);
INSERT INTO `tbl_vods` VALUES ('34', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('35', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('36', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('37', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('38', '3', '1', '1', 'Tin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 Thêm 1 ca mắc virus corona mới, tổng số 334 ca bệnh', 'tin-tuc-dich-benh-corona-covid-19-sang-146-them-1-ca-mac-virus-corona-moi-tong-so-334-ca-benh', '\r\nTin tức dịch bệnh corona ( Covid-19 ) sáng 14/6 gồm những nội dung chính sau: - Trung Quốc phong tỏa một phần Bắc Kinh vì phát hiện ổ dịch mới - Pháp lên kế hoạch mở cửa biên giới với các nước ngoài Schengen - WHO quan ngại về tình hình covid-19 tại nhiều nước - Bắc Kinh - điểm nóng mới về nguy cơ tái bùng phạt dịch covid-19 - Đại dịch covid-19 \"bóp nghẹt\" lái xe công nghệ ở Đông Nam Á - Thêm 1 ca mắc covid-19 mới\r\n\r\n', '', '[]', '1', '', '1592117719', null, null, null, null, '2', null);
INSERT INTO `tbl_vods` VALUES ('39', '2', '2', '1', 'Thời điểm tốt giúp Việt Nam có cơ hội hóa rồng', 'thoi-diem-tot-giup-viet-nam-co-co-hoi-hoa-rong', '<p><font color=\"#333333\" face=\"Noto Serif, serif\"><span style=\"font-size: 17.6px;\">Chúng ta đã biến nguy thành cơ, cải thiện uy tín của Việt Nam trên trường quốc tế, biến Việt Nam thành điểm đến hấp dẫn của thị trường đầu tư\", đại biểu Hoàng Văn Cường đánh giá.</span></font><br></p>', '', '[]', '1', '', '1592209141', '1592216007', null, null, null, '5', null);
INSERT INTO `tbl_vods` VALUES ('40', '4', '4', '1', 'Chào Buổi Sáng | Tin tức 24h mới nhất hôm nay 16/6/2020 | chuyển động 24h | Tin tức | TT24h', 'chao-buoi-sang-tin-tuc-24h-moi-nhat-hom-nay-1662020-chuyen-dong-24h-tin-tuc-tt24h', '', '', '[]', '1', '', '1592280255', null, null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('41', '4', '4', '1', 'Chào Buổi Sáng | Tin tức 24h mới nhất hôm nay 16/6/2020 | chuyển động 24h | Tin tức | TT24h', 'chao-buoi-sang-tin-tuc-24h-moi-nhat-hom-nay-1662020-chuyen-dong-24h-tin-tuc-tt24h', '', '', '[]', '1', '', '1592280274', null, null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('42', '4', '4', '1', 'Chào Buổi Sáng | Tin tức 24h mới nhất hôm nay 16/6/2020 | chuyển động 24h | Tin tức | TT24h', 'chao-buoi-sang-tin-tuc-24h-moi-nhat-hom-nay-1662020-chuyen-dong-24h-tin-tuc-tt24h', '', '', '[]', '1', '', '1592280328', null, null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('43', '4', '4', '1', 'Tin tức dịch Covid-19 mới nhất ngày 16 tháng 6,2020 | Tổng hợp tin virus Corona hôm nay | FBNC', 'tin-tuc-dich-covid-19-moi-nhat-ngay-16-thang-62020-tong-hop-tin-virus-corona-hom-nay-fbnc', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">FBNC (Financial Business News Channel) là kênh truyền hình của HTVC  dành cho giới kinh doanh, thông tin chuyên sâu về  kinh tế Việt Nam, bất động sản,  tài chính ngân hàng,  chứng khoán và cổ phiếu, giá vàng và khởi nghiệp,… Nếu bạn đã, đang và sẽ định giá doanh nghiệp. Hãy đồng hành cùng FBNC TV!</span><br></p>', '', '[]', '1', '', '1592280404', '1592298519', null, null, null, '0', null);
INSERT INTO `tbl_vods` VALUES ('44', '4', '4', '1', 'Tin tức dịch Covid-19 mới nhất ngày 16 tháng 6,2020 | Tổng hợp tin virus Corona hôm nay | FBNC', 'tin-tuc-dich-covid-19-moi-nhat-ngay-16-thang-62020-tong-hop-tin-virus-corona-hom-nay-fbnc', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">FBNC (Financial Business News Channel) là kênh truyền hình của HTVC  dành cho giới kinh doanh, thông tin chuyên sâu về  kinh tế Việt Nam, bất động sản,  tài chính ngân hàng,  chứng khoán và cổ phiếu, giá vàng và khởi nghiệp,… Nếu bạn đã, đang và sẽ định giá doanh nghiệp. Hãy đồng hành cùng FBNC TV!</span><br></p>', '', '[]', '3', '', '1592280470', '1592294848', null, null, null, '0', null);
