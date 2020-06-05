/*
Navicat MySQL Data Transfer

Source Server         : lhp
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : qr_data

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-06-05 17:34:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `head_pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`username`,`email`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '超级管理员', 'https://api.vipysp.com/uploads/20200415/202004151700364307.jpg', 'FoFuK-WrcOayDI0_kLdRwGavKN-6mXs6', '$2y$13$bK1PVK/hcl2YZzuRsp7gT.1aY74UZKg6iA4JfxwFKkbJeZ3pr3CaG', null, '***********@qq.com', '10', '1584689376', '1589266787');
INSERT INTO `t_admin` VALUES ('3', '青商', '青商管理员', 'https://api.vipysp.com/uploads/20200513/202005131418212302.png', 'dZvXkJq0QYLEgyHx7I29ypjZNUlSoQc4', '$2y$13$hCbm4mG6v0MkJagH8WbIBe7vJGUba4wfEtNYrAqZgQhlxJ561gEMe', null, '****@qq.com', '10', '1589350718', '1589443093');

-- ----------------------------
-- Table structure for `t_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_log`;
CREATE TABLE `t_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gets` text COLLATE utf8_unicode_ci,
  `posts` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin_log
-- ----------------------------
INSERT INTO `t_admin_log` VALUES ('1', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734043', '1590734043');
INSERT INTO `t_admin_log` VALUES ('2', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734090', '1590734090');
INSERT INTO `t_admin_log` VALUES ('3', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734148', '1590734148');
INSERT INTO `t_admin_log` VALUES ('4', 'system/config/index', 'http://www.qr.com/system/config/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734308', '1590734308');
INSERT INTO `t_admin_log` VALUES ('5', 'backup/export/index', 'http://www.qr.com/backup/export/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734314', '1590734314');
INSERT INTO `t_admin_log` VALUES ('6', 'backup/import/index', 'http://www.qr.com/backup/import/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734315', '1590734315');
INSERT INTO `t_admin_log` VALUES ('7', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734323', '1590734323');
INSERT INTO `t_admin_log` VALUES ('8', 'backup/import/index', 'http://www.qr.com/backup/import/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734323', '1590734323');
INSERT INTO `t_admin_log` VALUES ('9', 'backup/export/index', 'http://www.qr.com/backup/export/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734324', '1590734324');
INSERT INTO `t_admin_log` VALUES ('10', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734324', '1590734324');
INSERT INTO `t_admin_log` VALUES ('11', 'system/config/index', 'http://www.qr.com/system/config/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734324', '1590734324');
INSERT INTO `t_admin_log` VALUES ('12', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734324', '1590734324');
INSERT INTO `t_admin_log` VALUES ('13', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734324', '1590734324');
INSERT INTO `t_admin_log` VALUES ('14', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734328', '1590734328');
INSERT INTO `t_admin_log` VALUES ('15', 'rbac/user/delete', 'http://www.qr.com/rbac/user/delete?id=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"2\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734339', '1590734339');
INSERT INTO `t_admin_log` VALUES ('16', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734340', '1590734340');
INSERT INTO `t_admin_log` VALUES ('17', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590734415', '1590734415');
INSERT INTO `t_admin_log` VALUES ('18', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590735225', '1590735225');
INSERT INTO `t_admin_log` VALUES ('19', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590742301', '1590742301');
INSERT INTO `t_admin_log` VALUES ('20', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590742311', '1590742311');
INSERT INTO `t_admin_log` VALUES ('21', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590744285', '1590744285');
INSERT INTO `t_admin_log` VALUES ('22', 'backup/export/index', 'http://www.qr.com/backup/export/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590744308', '1590744308');
INSERT INTO `t_admin_log` VALUES ('23', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590744380', '1590744380');
INSERT INTO `t_admin_log` VALUES ('24', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590976229', '1590976229');
INSERT INTO `t_admin_log` VALUES ('25', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590976294', '1590976294');
INSERT INTO `t_admin_log` VALUES ('26', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590976360', '1590976360');
INSERT INTO `t_admin_log` VALUES ('27', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590976362', '1590976362');
INSERT INTO `t_admin_log` VALUES ('28', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1590976366', '1590976366');
INSERT INTO `t_admin_log` VALUES ('29', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152936', '1591152936');
INSERT INTO `t_admin_log` VALUES ('30', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152941', '1591152941');
INSERT INTO `t_admin_log` VALUES ('31', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('32', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('33', 'backup/export/index', 'http://www.qr.com/backup/export/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('34', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('35', 'site/error', 'http://www.qr.com/rbac/user/delete?id=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"2\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('36', 'system/config/index', 'http://www.qr.com/system/config/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152957', '1591152957');
INSERT INTO `t_admin_log` VALUES ('37', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('38', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('39', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('40', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('41', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('42', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152958', '1591152958');
INSERT INTO `t_admin_log` VALUES ('43', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152961', '1591152961');
INSERT INTO `t_admin_log` VALUES ('44', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152968', '1591152968');
INSERT INTO `t_admin_log` VALUES ('45', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591152971', '1591152971');
INSERT INTO `t_admin_log` VALUES ('46', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591153003', '1591153003');
INSERT INTO `t_admin_log` VALUES ('47', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"_csrf-backend\":\"QMWKZBSlDvwLoS9wXcbUDqOYrz_AqHbMn3okPAktAw8thv0qJN93uE7lRyQUk75i2tLeU4LEQo7MEHt-MVtLWA==\",\"Menu\":{\"parent\":\"\",\"name\":\"\\u9752\\u9510\\u7ba1\\u7406\",\"parent_name\":\"\",\"route\":\"\",\"order\":\"7\",\"icon\":\"\"}}', '1', '***********@qq.com', '127.0.0.1', '1591153030', '1591153030');
INSERT INTO `t_admin_log` VALUES ('48', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591153030', '1591153030');
INSERT INTO `t_admin_log` VALUES ('49', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591154641', '1591154641');
INSERT INTO `t_admin_log` VALUES ('50', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591154644', '1591154644');
INSERT INTO `t_admin_log` VALUES ('51', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162151', '1591162151');
INSERT INTO `t_admin_log` VALUES ('52', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162153', '1591162153');
INSERT INTO `t_admin_log` VALUES ('53', 'rbac/route/assign', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"routes\":[\"\\/qingrui\\/customer\\/index\",\"\\/qingrui\\/customer\\/view\",\"\\/qingrui\\/customer\\/create\",\"\\/qingrui\\/customer\\/update\",\"\\/qingrui\\/customer\\/delete\",\"\\/qingrui\\/customer\\/delete-all\",\"\\/qingrui\\/customer\\/status\",\"\\/qingrui\\/customer\\/*\",\"\\/qingrui\\/*\"]}', '1', '***********@qq.com', '127.0.0.1', '1591162161', '1591162161');
INSERT INTO `t_admin_log` VALUES ('54', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162163', '1591162163');
INSERT INTO `t_admin_log` VALUES ('55', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('56', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('57', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('58', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('59', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('60', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162164', '1591162164');
INSERT INTO `t_admin_log` VALUES ('61', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162165', '1591162165');
INSERT INTO `t_admin_log` VALUES ('62', 'site/error', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162165', '1591162165');
INSERT INTO `t_admin_log` VALUES ('63', 'site/error', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162165', '1591162165');
INSERT INTO `t_admin_log` VALUES ('64', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162165', '1591162165');
INSERT INTO `t_admin_log` VALUES ('65', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162166', '1591162166');
INSERT INTO `t_admin_log` VALUES ('66', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162166', '1591162166');
INSERT INTO `t_admin_log` VALUES ('67', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162166', '1591162166');
INSERT INTO `t_admin_log` VALUES ('68', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162166', '1591162166');
INSERT INTO `t_admin_log` VALUES ('69', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162166', '1591162166');
INSERT INTO `t_admin_log` VALUES ('70', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162171', '1591162171');
INSERT INTO `t_admin_log` VALUES ('71', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"_csrf-backend\":\"N_x3n9P_v3QPKiga4syN2onW2o7zV6W078A2wrBRcmhyvSHbkqjPNkBMXn6kosGo84eF4KQ_6PKVo0a24g4DDg==\",\"Menu\":{\"parent\":\"\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"parent_name\":\"\\u9752\\u9510\\u7ba1\\u7406\",\"route\":\"\\/qingrui\\/customer\\/index\",\"order\":\"1\",\"icon\":\"\"}}', '1', '***********@qq.com', '127.0.0.1', '1591162191', '1591162191');
INSERT INTO `t_admin_log` VALUES ('72', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"50\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162191', '1591162191');
INSERT INTO `t_admin_log` VALUES ('73', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162193', '1591162193');
INSERT INTO `t_admin_log` VALUES ('74', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162194', '1591162194');
INSERT INTO `t_admin_log` VALUES ('75', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162194', '1591162194');
INSERT INTO `t_admin_log` VALUES ('76', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162194', '1591162194');
INSERT INTO `t_admin_log` VALUES ('77', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162194', '1591162194');
INSERT INTO `t_admin_log` VALUES ('78', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162194', '1591162194');
INSERT INTO `t_admin_log` VALUES ('79', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('80', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"50\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('81', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('82', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('83', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('84', 'site/error', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('85', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('86', 'site/error', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('87', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('88', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('89', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162195', '1591162195');
INSERT INTO `t_admin_log` VALUES ('90', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162196', '1591162196');
INSERT INTO `t_admin_log` VALUES ('91', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162196', '1591162196');
INSERT INTO `t_admin_log` VALUES ('92', 'rbac/role/view', 'http://www.qr.com/rbac/role/view?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162201', '1591162201');
INSERT INTO `t_admin_log` VALUES ('93', 'rbac/role/assign', 'http://www.qr.com/rbac/role/assign?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '{\"items\":[\"\\/qingrui\\/*\",\"\\/qingrui\\/customer\\/*\",\"\\/qingrui\\/customer\\/create\",\"\\/qingrui\\/customer\\/delete\",\"\\/qingrui\\/customer\\/delete-all\",\"\\/qingrui\\/customer\\/index\",\"\\/qingrui\\/customer\\/status\",\"\\/qingrui\\/customer\\/update\",\"\\/qingrui\\/customer\\/view\"]}', '1', '***********@qq.com', '127.0.0.1', '1591162210', '1591162210');
INSERT INTO `t_admin_log` VALUES ('94', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162212', '1591162212');
INSERT INTO `t_admin_log` VALUES ('95', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162213', '1591162213');
INSERT INTO `t_admin_log` VALUES ('96', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162213', '1591162213');
INSERT INTO `t_admin_log` VALUES ('97', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162213', '1591162213');
INSERT INTO `t_admin_log` VALUES ('98', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('99', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('100', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('101', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('102', 'rbac/role/view', 'http://www.qr.com/rbac/role/view?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('103', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('104', 'site/error', 'http://www.qr.com/rbac/role/assign?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('105', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162214', '1591162214');
INSERT INTO `t_admin_log` VALUES ('106', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('107', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"50\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('108', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('109', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('110', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('111', 'site/error', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('112', 'site/error', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('113', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('114', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162215', '1591162215');
INSERT INTO `t_admin_log` VALUES ('115', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162223', '1591162223');
INSERT INTO `t_admin_log` VALUES ('116', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162224', '1591162224');
INSERT INTO `t_admin_log` VALUES ('117', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162333', '1591162333');
INSERT INTO `t_admin_log` VALUES ('118', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162334', '1591162334');
INSERT INTO `t_admin_log` VALUES ('119', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162334', '1591162334');
INSERT INTO `t_admin_log` VALUES ('120', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162335', '1591162335');
INSERT INTO `t_admin_log` VALUES ('121', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162335', '1591162335');
INSERT INTO `t_admin_log` VALUES ('122', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162335', '1591162335');
INSERT INTO `t_admin_log` VALUES ('123', 'site/error', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162335', '1591162335');
INSERT INTO `t_admin_log` VALUES ('124', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162336', '1591162336');
INSERT INTO `t_admin_log` VALUES ('125', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"50\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162336', '1591162336');
INSERT INTO `t_admin_log` VALUES ('126', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162336', '1591162336');
INSERT INTO `t_admin_log` VALUES ('127', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162336', '1591162336');
INSERT INTO `t_admin_log` VALUES ('128', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162336', '1591162336');
INSERT INTO `t_admin_log` VALUES ('129', 'site/error', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('130', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('131', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('132', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('133', 'rbac/role/view', 'http://www.qr.com/rbac/role/view?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('134', 'site/error', 'http://www.qr.com/rbac/role/assign?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('135', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162337', '1591162337');
INSERT INTO `t_admin_log` VALUES ('136', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162371', '1591162371');
INSERT INTO `t_admin_log` VALUES ('137', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162371', '1591162371');
INSERT INTO `t_admin_log` VALUES ('138', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162372', '1591162372');
INSERT INTO `t_admin_log` VALUES ('139', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162372', '1591162372');
INSERT INTO `t_admin_log` VALUES ('140', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162372', '1591162372');
INSERT INTO `t_admin_log` VALUES ('141', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162373', '1591162373');
INSERT INTO `t_admin_log` VALUES ('142', 'rbac/role/view', 'http://www.qr.com/rbac/role/view?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162373', '1591162373');
INSERT INTO `t_admin_log` VALUES ('143', 'rbac/user/index', 'http://www.qr.com/rbac/user/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162373', '1591162373');
INSERT INTO `t_admin_log` VALUES ('144', 'site/error', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162373', '1591162373');
INSERT INTO `t_admin_log` VALUES ('145', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"49\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162374', '1591162374');
INSERT INTO `t_admin_log` VALUES ('146', 'rbac/menu/create', 'http://www.qr.com/rbac/menu/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162374', '1591162374');
INSERT INTO `t_admin_log` VALUES ('147', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162374', '1591162374');
INSERT INTO `t_admin_log` VALUES ('148', 'rbac/menu/view', 'http://www.qr.com/rbac/menu/view?id=50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"50\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162374', '1591162374');
INSERT INTO `t_admin_log` VALUES ('149', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162374', '1591162374');
INSERT INTO `t_admin_log` VALUES ('150', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162375', '1591162375');
INSERT INTO `t_admin_log` VALUES ('151', 'site/error', 'http://www.qr.com/rbac/role/assign?id=%E7%AE%A1%E7%90%86%E5%91%98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u7ba1\\u7406\\u5458\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162375', '1591162375');
INSERT INTO `t_admin_log` VALUES ('152', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162375', '1591162375');
INSERT INTO `t_admin_log` VALUES ('153', 'content/navigation/index', 'http://www.qr.com/content/navigation/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162375', '1591162375');
INSERT INTO `t_admin_log` VALUES ('154', 'site/error', 'http://www.qr.com/rbac/route/assign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162376', '1591162376');
INSERT INTO `t_admin_log` VALUES ('155', 'rbac/assignment/view', 'http://www.qr.com/rbac/assignment/view?id=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"1\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591162376', '1591162376');
INSERT INTO `t_admin_log` VALUES ('156', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163012', '1591163012');
INSERT INTO `t_admin_log` VALUES ('157', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163065', '1591163065');
INSERT INTO `t_admin_log` VALUES ('158', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163350', '1591163350');
INSERT INTO `t_admin_log` VALUES ('159', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163368', '1591163368');
INSERT INTO `t_admin_log` VALUES ('160', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163446', '1591163446');
INSERT INTO `t_admin_log` VALUES ('161', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163502', '1591163502');
INSERT INTO `t_admin_log` VALUES ('162', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163511', '1591163511');
INSERT INTO `t_admin_log` VALUES ('163', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591163576', '1591163576');
INSERT INTO `t_admin_log` VALUES ('164', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591164246', '1591164246');
INSERT INTO `t_admin_log` VALUES ('165', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591164248', '1591164248');
INSERT INTO `t_admin_log` VALUES ('166', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591164435', '1591164435');
INSERT INTO `t_admin_log` VALUES ('167', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591164440', '1591164440');
INSERT INTO `t_admin_log` VALUES ('168', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"_csrf-backend\":\"77XnMxYjEWeqNa2qxnh3vuFVHqnGKsUzr1S05BCGkYSq9LF3V3RhJeVT286AFjvMmwRBx5FCiHXVN8SQQtng4g==\",\"Customer\":{\"name\":\"\\u5f20\\u4e09\",\"contact\":\"15656565656\",\"email\":\"112@qq.com\",\"post\":\"ceo\",\"sex\":\"3\",\"status\":\"1\"}}', '1', '***********@qq.com', '127.0.0.1', '1591164471', '1591164471');
INSERT INTO `t_admin_log` VALUES ('169', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591165935', '1591165935');
INSERT INTO `t_admin_log` VALUES ('170', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591165955', '1591165955');
INSERT INTO `t_admin_log` VALUES ('171', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=%E5%BC%A0%E4%B8%89&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\\u5f20\\u4e09\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591165959', '1591165959');
INSERT INTO `t_admin_log` VALUES ('172', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=%E5%BC%A0%E4%B8%89a&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\\u5f20\\u4e09a\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591165962', '1591165962');
INSERT INTO `t_admin_log` VALUES ('173', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591165965', '1591165965');
INSERT INTO `t_admin_log` VALUES ('174', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166218', '1591166218');
INSERT INTO `t_admin_log` VALUES ('175', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166239', '1591166239');
INSERT INTO `t_admin_log` VALUES ('176', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166546', '1591166546');
INSERT INTO `t_admin_log` VALUES ('177', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166579', '1591166579');
INSERT INTO `t_admin_log` VALUES ('178', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166616', '1591166616');
INSERT INTO `t_admin_log` VALUES ('179', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166622', '1591166622');
INSERT INTO `t_admin_log` VALUES ('180', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"_csrf-backend\":\"v3rwhG3OXXhzzZl8TnEJujKuEh4W15zlP__Or3H0Gir6O6bALJktOjyr7xgIH0XISP9NcEG_0aNFnL7bI6trTA==\",\"Customer\":{\"name\":\"\\u674e\\u56db\",\"contact\":\"15656565656\",\"email\":\"112@qq.com\",\"post\":\"ceo\",\"sex\":\"1\",\"status\":\"1\"}}', '1', '***********@qq.com', '127.0.0.1', '1591166646', '1591166646');
INSERT INTO `t_admin_log` VALUES ('181', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"2\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166646', '1591166646');
INSERT INTO `t_admin_log` VALUES ('182', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166648', '1591166648');
INSERT INTO `t_admin_log` VALUES ('183', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166652', '1591166652');
INSERT INTO `t_admin_log` VALUES ('184', 'qingrui/customer/create', 'http://www.qr.com/qingrui/customer/create', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"_csrf-backend\":\"XTq9VcyL2GBoKaX25RRsWJMVWZlhJ0xJlaPea7YX1MUYe-sRjdyoIidP05KjeiAq6UQG9zZPAQ_vwK4f5Eilow==\",\"Customer\":{\"name\":\"\\u963f\\u4e09\",\"contact\":\"15656565656\",\"email\":\"112@qq.com\",\"post\":\"ceo\",\"sex\":\"2\",\"status\":\"1\"}}', '1', '***********@qq.com', '127.0.0.1', '1591166666', '1591166666');
INSERT INTO `t_admin_log` VALUES ('185', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166666', '1591166666');
INSERT INTO `t_admin_log` VALUES ('186', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166668', '1591166668');
INSERT INTO `t_admin_log` VALUES ('187', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166705', '1591166705');
INSERT INTO `t_admin_log` VALUES ('188', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=sss&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"sss\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166709', '1591166709');
INSERT INTO `t_admin_log` VALUES ('189', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=admin&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"admin\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166712', '1591166712');
INSERT INTO `t_admin_log` VALUES ('190', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=admin&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"admin\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166877', '1591166877');
INSERT INTO `t_admin_log` VALUES ('191', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591166880', '1591166880');
INSERT INTO `t_admin_log` VALUES ('192', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167030', '1591167030');
INSERT INTO `t_admin_log` VALUES ('193', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167038', '1591167038');
INSERT INTO `t_admin_log` VALUES ('194', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167058', '1591167058');
INSERT INTO `t_admin_log` VALUES ('195', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167060', '1591167060');
INSERT INTO `t_admin_log` VALUES ('196', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167108', '1591167108');
INSERT INTO `t_admin_log` VALUES ('197', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167110', '1591167110');
INSERT INTO `t_admin_log` VALUES ('198', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"2\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167119', '1591167119');
INSERT INTO `t_admin_log` VALUES ('199', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"2\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167122', '1591167122');
INSERT INTO `t_admin_log` VALUES ('200', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167126', '1591167126');
INSERT INTO `t_admin_log` VALUES ('201', 'qingrui/customer/status', 'http://www.qr.com/qingrui/customer/status?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '{\"status\":\"1\"}', '1', '***********@qq.com', '127.0.0.1', '1591167129', '1591167129');
INSERT INTO `t_admin_log` VALUES ('202', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167217', '1591167217');
INSERT INTO `t_admin_log` VALUES ('203', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167244', '1591167244');
INSERT INTO `t_admin_log` VALUES ('204', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167320', '1591167320');
INSERT INTO `t_admin_log` VALUES ('205', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167339', '1591167339');
INSERT INTO `t_admin_log` VALUES ('206', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=2&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"2\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167344', '1591167344');
INSERT INTO `t_admin_log` VALUES ('207', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167348', '1591167348');
INSERT INTO `t_admin_log` VALUES ('208', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167654', '1591167654');
INSERT INTO `t_admin_log` VALUES ('209', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167658', '1591167658');
INSERT INTO `t_admin_log` VALUES ('210', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167812', '1591167812');
INSERT INTO `t_admin_log` VALUES ('211', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167813', '1591167813');
INSERT INTO `t_admin_log` VALUES ('212', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167815', '1591167815');
INSERT INTO `t_admin_log` VALUES ('213', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167816', '1591167816');
INSERT INTO `t_admin_log` VALUES ('214', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=status', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"status\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167817', '1591167817');
INSERT INTO `t_admin_log` VALUES ('215', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-status', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-status\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167818', '1591167818');
INSERT INTO `t_admin_log` VALUES ('216', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=post', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"post\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167819', '1591167819');
INSERT INTO `t_admin_log` VALUES ('217', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-post', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-post\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167819', '1591167819');
INSERT INTO `t_admin_log` VALUES ('218', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167823', '1591167823');
INSERT INTO `t_admin_log` VALUES ('219', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591167827', '1591167827');
INSERT INTO `t_admin_log` VALUES ('220', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591168621', '1591168621');
INSERT INTO `t_admin_log` VALUES ('221', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591168625', '1591168625');
INSERT INTO `t_admin_log` VALUES ('222', 'qingrui/customer/status', 'http://www.qr.com/qingrui/customer/status?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '{\"status\":\"1\"}', '1', '***********@qq.com', '127.0.0.1', '1591168672', '1591168672');
INSERT INTO `t_admin_log` VALUES ('223', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591168888', '1591168888');
INSERT INTO `t_admin_log` VALUES ('224', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '{\"_csrf-backend\":\"PN4HVNGSL4OF6P-RzrIztf4Fz14n6vyqOTmUhPbl6Zx5n1EQkMVfwcqOifWI3H_HhFSQMHCCsexDWuTwpLqY-g==\",\"Customer\":{\"name\":\"\\u963f\\u4e09\",\"contact\":\"15656565656\",\"email\":\"112@qq.com\",\"post\":\"ceo\",\"sex\":\"2\",\"status\":\"1\"}}', '1', '***********@qq.com', '127.0.0.1', '1591168902', '1591168902');
INSERT INTO `t_admin_log` VALUES ('225', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591168902', '1591168902');
INSERT INTO `t_admin_log` VALUES ('226', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169013', '1591169013');
INSERT INTO `t_admin_log` VALUES ('227', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169014', '1591169014');
INSERT INTO `t_admin_log` VALUES ('228', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '{\"_csrf-backend\":\"dJLC_rkiESMCKrXe5uv34YHbLgVpvqrSKKhZY86tG5Ax05S6-HVhYU1Mw7qghbuT-4pxaz7W55RSyykXnPJq9g==\",\"Customer\":{\"name\":\"\\u963f\\u4e09\",\"contact\":\"15656565656\",\"email\":\"112@qq.com\",\"post\":\"ceo\",\"sex\":\"2\",\"status\":\"1\"}}', '1', '***********@qq.com', '127.0.0.1', '1591169019', '1591169019');
INSERT INTO `t_admin_log` VALUES ('229', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169019', '1591169019');
INSERT INTO `t_admin_log` VALUES ('230', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169042', '1591169042');
INSERT INTO `t_admin_log` VALUES ('231', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169047', '1591169047');
INSERT INTO `t_admin_log` VALUES ('232', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169050', '1591169050');
INSERT INTO `t_admin_log` VALUES ('233', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591169725', '1591169725');
INSERT INTO `t_admin_log` VALUES ('234', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236567', '1591236567');
INSERT INTO `t_admin_log` VALUES ('235', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236569', '1591236569');
INSERT INTO `t_admin_log` VALUES ('236', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236569', '1591236569');
INSERT INTO `t_admin_log` VALUES ('237', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236570', '1591236570');
INSERT INTO `t_admin_log` VALUES ('238', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236570', '1591236570');
INSERT INTO `t_admin_log` VALUES ('239', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236570', '1591236570');
INSERT INTO `t_admin_log` VALUES ('240', 'qingrui/customer/status', 'http://www.qr.com/qingrui/customer/status?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236570', '1591236570');
INSERT INTO `t_admin_log` VALUES ('241', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236571', '1591236571');
INSERT INTO `t_admin_log` VALUES ('242', 'qingrui/customer/update', 'http://www.qr.com/qingrui/customer/update?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236571', '1591236571');
INSERT INTO `t_admin_log` VALUES ('243', 'qingrui/customer/view', 'http://www.qr.com/qingrui/customer/view?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"3\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236571', '1591236571');
INSERT INTO `t_admin_log` VALUES ('244', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=post', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"post\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236572', '1591236572');
INSERT INTO `t_admin_log` VALUES ('245', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-post', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-post\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236572', '1591236572');
INSERT INTO `t_admin_log` VALUES ('246', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=-status', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"-status\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236572', '1591236572');
INSERT INTO `t_admin_log` VALUES ('247', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index?Customer%5Bname%5D=&Customer%5Bpost%5D=&Customer%5Busername%5D=&Customer%5Bstatus%5D=&Customer%5Bsex%5D=&file=&sort=updated_at', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Customer\":{\"name\":\"\",\"post\":\"\",\"username\":\"\",\"status\":\"\",\"sex\":\"\"},\"file\":\"\",\"sort\":\"updated_at\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236573', '1591236573');
INSERT INTO `t_admin_log` VALUES ('248', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236827', '1591236827');
INSERT INTO `t_admin_log` VALUES ('249', 'rbac/route/remove', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"routes\":[\"\\/official\\/*\",\"\\/official\\/guan-goods-attribute\\/*\",\"\\/official\\/guan-goods-attribute\\/create\",\"\\/official\\/guan-goods-attribute\\/delete\",\"\\/official\\/guan-goods-attribute\\/delete-all\",\"\\/official\\/guan-goods-attribute\\/index\",\"\\/official\\/guan-goods-attribute\\/update\",\"\\/official\\/guan-goods-attribute\\/view\",\"\\/official\\/guan-goods\\/*\",\"\\/official\\/guan-goods\\/create\",\"\\/official\\/guan-goods\\/delete\",\"\\/official\\/guan-goods\\/delete-all\",\"\\/official\\/guan-goods\\/index\",\"\\/official\\/guan-goods\\/status\",\"\\/official\\/guan-goods\\/update\",\"\\/official\\/guan-goods\\/view\",\"\\/official\\/guan-navigation\\/*\",\"\\/official\\/guan-navigation\\/create\",\"\\/official\\/guan-navigation\\/delete\",\"\\/official\\/guan-navigation\\/delete-all\",\"\\/official\\/guan-navigation\\/index\",\"\\/official\\/guan-navigation\\/update\",\"\\/official\\/guan-navigation\\/view\",\"\\/official\\/guan-product-type\\/*\",\"\\/official\\/guan-product-type\\/create\",\"\\/official\\/guan-product-type\\/delete\",\"\\/official\\/guan-product-type\\/delete-all\",\"\\/official\\/guan-product-type\\/index\",\"\\/official\\/guan-product-type\\/update\",\"\\/official\\/guan-product-type\\/view\",\"\\/official\\/guan-product\\/*\",\"\\/official\\/guan-product\\/create\",\"\\/official\\/guan-product\\/delete\",\"\\/official\\/guan-product\\/delete-all\",\"\\/official\\/guan-product\\/index\",\"\\/official\\/guan-product\\/status\",\"\\/official\\/guan-product\\/update\",\"\\/official\\/guan-product\\/view\",\"\\/official\\/guan-type\\/*\",\"\\/official\\/guan-type\\/create\",\"\\/official\\/guan-type\\/delete\",\"\\/official\\/guan-type\\/delete-all\",\"\\/official\\/guan-type\\/index\",\"\\/official\\/guan-type\\/update\",\"\\/official\\/guan-type\\/view\"]}', '1', '***********@qq.com', '127.0.0.1', '1591236858', '1591236858');
INSERT INTO `t_admin_log` VALUES ('250', 'rbac/route/remove', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"routes\":[\"\\/content\\/*\",\"\\/content\\/blogroll\\/*\",\"\\/content\\/blogroll\\/active\",\"\\/content\\/blogroll\\/create\",\"\\/content\\/blogroll\\/delete\",\"\\/content\\/blogroll\\/delete-all\",\"\\/content\\/blogroll\\/index\",\"\\/content\\/blogroll\\/update\",\"\\/content\\/blogroll\\/view\",\"\\/content\\/company-type\\/*\",\"\\/content\\/company-type\\/create\",\"\\/content\\/company-type\\/delete\",\"\\/content\\/company-type\\/delete-all\",\"\\/content\\/company-type\\/index\",\"\\/content\\/company-type\\/update\",\"\\/content\\/company-type\\/view\",\"\\/content\\/company\\/*\",\"\\/content\\/company\\/active\",\"\\/content\\/company\\/create\",\"\\/content\\/company\\/delete\",\"\\/content\\/company\\/delete-all\",\"\\/content\\/company\\/index\",\"\\/content\\/company\\/status\",\"\\/content\\/company\\/update\",\"\\/content\\/company\\/view\",\"\\/content\\/navigation\\/*\",\"\\/content\\/navigation\\/create\",\"\\/content\\/navigation\\/delete\",\"\\/content\\/navigation\\/delete-all\",\"\\/content\\/navigation\\/index\",\"\\/content\\/navigation\\/update\",\"\\/content\\/navigation\\/view\",\"\\/content\\/strict-type\\/*\",\"\\/content\\/strict-type\\/create\",\"\\/content\\/strict-type\\/delete\",\"\\/content\\/strict-type\\/delete-all\",\"\\/content\\/strict-type\\/index\",\"\\/content\\/strict-type\\/update\",\"\\/content\\/strict-type\\/view\"]}', '1', '***********@qq.com', '127.0.0.1', '1591236868', '1591236868');
INSERT INTO `t_admin_log` VALUES ('251', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AF%BC%E8%88%AA&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5bfc\\u822a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236888', '1591236888');
INSERT INTO `t_admin_log` VALUES ('252', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"36\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236894', '1591236894');
INSERT INTO `t_admin_log` VALUES ('253', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AF%BC%E8%88%AA&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5bfc\\u822a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236895', '1591236895');
INSERT INTO `t_admin_log` VALUES ('254', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"43\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236897', '1591236897');
INSERT INTO `t_admin_log` VALUES ('255', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AF%BC%E8%88%AA&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5bfc\\u822a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236897', '1591236897');
INSERT INTO `t_admin_log` VALUES ('256', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236904', '1591236904');
INSERT INTO `t_admin_log` VALUES ('257', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236908', '1591236908');
INSERT INTO `t_admin_log` VALUES ('258', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236911', '1591236911');
INSERT INTO `t_admin_log` VALUES ('259', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"37\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236915', '1591236915');
INSERT INTO `t_admin_log` VALUES ('260', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236916', '1591236916');
INSERT INTO `t_admin_log` VALUES ('261', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"38\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236917', '1591236917');
INSERT INTO `t_admin_log` VALUES ('262', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236918', '1591236918');
INSERT INTO `t_admin_log` VALUES ('263', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%8F%8B%E6%83%85&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u53cb\\u60c5\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236923', '1591236923');
INSERT INTO `t_admin_log` VALUES ('264', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"39\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236925', '1591236925');
INSERT INTO `t_admin_log` VALUES ('265', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%8F%8B%E6%83%85&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u53cb\\u60c5\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236926', '1591236926');
INSERT INTO `t_admin_log` VALUES ('266', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236931', '1591236931');
INSERT INTO `t_admin_log` VALUES ('267', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"40\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236933', '1591236933');
INSERT INTO `t_admin_log` VALUES ('268', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236934', '1591236934');
INSERT INTO `t_admin_log` VALUES ('269', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236936', '1591236936');
INSERT INTO `t_admin_log` VALUES ('270', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236938', '1591236938');
INSERT INTO `t_admin_log` VALUES ('271', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236938', '1591236938');
INSERT INTO `t_admin_log` VALUES ('272', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236938', '1591236938');
INSERT INTO `t_admin_log` VALUES ('273', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('274', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('275', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('276', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"40\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('277', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%8F%8B%E6%83%85&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u53cb\\u60c5\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('278', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"39\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('279', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"38\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236939', '1591236939');
INSERT INTO `t_admin_log` VALUES ('280', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"37\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('281', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('282', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"43\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('283', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AF%BC%E8%88%AA&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5bfc\\u822a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('284', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"36\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('285', 'site/error', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236940', '1591236940');
INSERT INTO `t_admin_log` VALUES ('286', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236941', '1591236941');
INSERT INTO `t_admin_log` VALUES ('287', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"32\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236945', '1591236945');
INSERT INTO `t_admin_log` VALUES ('288', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236946', '1591236946');
INSERT INTO `t_admin_log` VALUES ('289', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236947', '1591236947');
INSERT INTO `t_admin_log` VALUES ('290', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236949', '1591236949');
INSERT INTO `t_admin_log` VALUES ('291', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236949', '1591236949');
INSERT INTO `t_admin_log` VALUES ('292', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236949', '1591236949');
INSERT INTO `t_admin_log` VALUES ('293', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236949', '1591236949');
INSERT INTO `t_admin_log` VALUES ('294', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236949', '1591236949');
INSERT INTO `t_admin_log` VALUES ('295', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"32\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('296', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('297', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BC%81%E4%B8%9A%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4f01\\u4e1a\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('298', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('299', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"43\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('300', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AF%BC%E8%88%AA&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5bfc\\u822a\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236950', '1591236950');
INSERT INTO `t_admin_log` VALUES ('301', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"36\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('302', 'site/error', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('303', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"37\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('304', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('305', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('306', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"40\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('307', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%8F%8B%E6%83%85&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u53cb\\u60c5\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('308', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"39\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236951', '1591236951');
INSERT INTO `t_admin_log` VALUES ('309', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"38\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236952', '1591236952');
INSERT INTO `t_admin_log` VALUES ('310', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236952', '1591236952');
INSERT INTO `t_admin_log` VALUES ('311', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236952', '1591236952');
INSERT INTO `t_admin_log` VALUES ('312', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AE%98%E7%BD%91&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5b98\\u7f51\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236959', '1591236959');
INSERT INTO `t_admin_log` VALUES ('313', 'rbac/menu/delete-all', 'http://www.qr.com/rbac/menu/delete-all', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"keys\":[\"44\",\"45\"]}', '1', '***********@qq.com', '127.0.0.1', '1591236965', '1591236965');
INSERT INTO `t_admin_log` VALUES ('314', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AE%98%E7%BD%91&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5b98\\u7f51\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236966', '1591236966');
INSERT INTO `t_admin_log` VALUES ('315', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BA%A7%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4ea7\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236970', '1591236970');
INSERT INTO `t_admin_log` VALUES ('316', 'rbac/menu/delete-all', 'http://www.qr.com/rbac/menu/delete-all', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"keys\":[\"47\",\"48\"]}', '1', '***********@qq.com', '127.0.0.1', '1591236975', '1591236975');
INSERT INTO `t_admin_log` VALUES ('317', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BA%A7%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4ea7\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236976', '1591236976');
INSERT INTO `t_admin_log` VALUES ('318', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%95%86%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5546\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236979', '1591236979');
INSERT INTO `t_admin_log` VALUES ('319', 'rbac/menu/delete-all', 'http://www.qr.com/rbac/menu/delete-all', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '{\"keys\":[\"46\"]}', '1', '***********@qq.com', '127.0.0.1', '1591236983', '1591236983');
INSERT INTO `t_admin_log` VALUES ('320', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%95%86%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5546\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236984', '1591236984');
INSERT INTO `t_admin_log` VALUES ('321', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236985', '1591236985');
INSERT INTO `t_admin_log` VALUES ('322', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236986', '1591236986');
INSERT INTO `t_admin_log` VALUES ('323', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236987', '1591236987');
INSERT INTO `t_admin_log` VALUES ('324', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236987', '1591236987');
INSERT INTO `t_admin_log` VALUES ('325', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236987', '1591236987');
INSERT INTO `t_admin_log` VALUES ('326', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236987', '1591236987');
INSERT INTO `t_admin_log` VALUES ('327', 'rbac/menu/delete-all', 'http://www.qr.com/rbac/menu/delete-all', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236987', '1591236987');
INSERT INTO `t_admin_log` VALUES ('328', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%95%86%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5546\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('329', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('330', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BA%A7%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4ea7\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('331', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AE%98%E7%BD%91&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5b98\\u7f51\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('332', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"38\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('333', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236988', '1591236988');
INSERT INTO `t_admin_log` VALUES ('334', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('335', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"36\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('336', 'site/error', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('337', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"37\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('338', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('339', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('340', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"40\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236989', '1591236989');
INSERT INTO `t_admin_log` VALUES ('341', 'rbac/menu/delete', 'http://www.qr.com/rbac/menu/delete?id=42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"42\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236992', '1591236992');
INSERT INTO `t_admin_log` VALUES ('342', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236993', '1591236993');
INSERT INTO `t_admin_log` VALUES ('343', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236995', '1591236995');
INSERT INTO `t_admin_log` VALUES ('344', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236996', '1591236996');
INSERT INTO `t_admin_log` VALUES ('345', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236996', '1591236996');
INSERT INTO `t_admin_log` VALUES ('346', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236996', '1591236996');
INSERT INTO `t_admin_log` VALUES ('347', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('348', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('349', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"36\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('350', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"42\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('351', 'site/error', 'http://www.qr.com/rbac/route/remove', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('352', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236997', '1591236997');
INSERT INTO `t_admin_log` VALUES ('353', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('354', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"37\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('355', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('356', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%B8%A5%E9%80%89%E7%B1%BB%E5%88%AB&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4e25\\u9009\\u7c7b\\u522b\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('357', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"40\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('358', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%95%86%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5546\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('359', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E4%BA%A7%E5%93%81&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u4ea7\\u54c1\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236998', '1591236998');
INSERT INTO `t_admin_log` VALUES ('360', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index?Menu%5Bname%5D=%E5%AE%98%E7%BD%91&Menu%5Broute%5D=', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"Menu\":{\"name\":\"\\u5b98\\u7f51\",\"route\":\"\"}}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236999', '1591236999');
INSERT INTO `t_admin_log` VALUES ('361', 'site/error', 'http://www.qr.com/rbac/menu/delete?id=38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"38\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236999', '1591236999');
INSERT INTO `t_admin_log` VALUES ('362', 'rbac/log/index', 'http://www.qr.com/rbac/log/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591236999', '1591236999');
INSERT INTO `t_admin_log` VALUES ('363', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591237024', '1591237024');
INSERT INTO `t_admin_log` VALUES ('364', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240141', '1591240141');
INSERT INTO `t_admin_log` VALUES ('365', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240141', '1591240141');
INSERT INTO `t_admin_log` VALUES ('366', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240630', '1591240630');
INSERT INTO `t_admin_log` VALUES ('367', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240691', '1591240691');
INSERT INTO `t_admin_log` VALUES ('368', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240695', '1591240695');
INSERT INTO `t_admin_log` VALUES ('369', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240717', '1591240717');
INSERT INTO `t_admin_log` VALUES ('370', 'rbac/role/delete', 'http://www.qr.com/rbac/role/delete?id=%E4%B8%A5%E9%80%89%E7%AE%A1%E7%90%86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u4e25\\u9009\\u7ba1\\u7406\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240723', '1591240723');
INSERT INTO `t_admin_log` VALUES ('371', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240723', '1591240723');
INSERT INTO `t_admin_log` VALUES ('372', 'rbac/role/delete', 'http://www.qr.com/rbac/role/delete?id=%E5%AE%98%E7%BD%91%E7%AE%A1%E7%90%86', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u5b98\\u7f51\\u7ba1\\u7406\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240728', '1591240728');
INSERT INTO `t_admin_log` VALUES ('373', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240729', '1591240729');
INSERT INTO `t_admin_log` VALUES ('374', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240731', '1591240731');
INSERT INTO `t_admin_log` VALUES ('375', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240734', '1591240734');
INSERT INTO `t_admin_log` VALUES ('376', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240760', '1591240760');
INSERT INTO `t_admin_log` VALUES ('377', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240761', '1591240761');
INSERT INTO `t_admin_log` VALUES ('378', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240762', '1591240762');
INSERT INTO `t_admin_log` VALUES ('379', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240762', '1591240762');
INSERT INTO `t_admin_log` VALUES ('380', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240762', '1591240762');
INSERT INTO `t_admin_log` VALUES ('381', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240767', '1591240767');
INSERT INTO `t_admin_log` VALUES ('382', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240770', '1591240770');
INSERT INTO `t_admin_log` VALUES ('383', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240770', '1591240770');
INSERT INTO `t_admin_log` VALUES ('384', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240770', '1591240770');
INSERT INTO `t_admin_log` VALUES ('385', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240771', '1591240771');
INSERT INTO `t_admin_log` VALUES ('386', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240771', '1591240771');
INSERT INTO `t_admin_log` VALUES ('387', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240778', '1591240778');
INSERT INTO `t_admin_log` VALUES ('388', 'rbac/assignment/index', 'http://www.qr.com/rbac/assignment/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240779', '1591240779');
INSERT INTO `t_admin_log` VALUES ('389', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240779', '1591240779');
INSERT INTO `t_admin_log` VALUES ('390', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240779', '1591240779');
INSERT INTO `t_admin_log` VALUES ('391', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240780', '1591240780');
INSERT INTO `t_admin_log` VALUES ('392', 'rbac/assignment/view', 'http://www.qr.com/rbac/assignment/view?id=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"1\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240786', '1591240786');
INSERT INTO `t_admin_log` VALUES ('393', 'rbac/role/view', 'http://www.qr.com/rbac/role/view?id=%E6%BC%94%E7%A4%BA%E8%A7%92%E8%89%B2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"\\u6f14\\u793a\\u89d2\\u8272\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240794', '1591240794');
INSERT INTO `t_admin_log` VALUES ('394', 'rbac/user/update-self', 'http://www.qr.com/rbac/user/update-self?id=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"id\":\"1\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240817', '1591240817');
INSERT INTO `t_admin_log` VALUES ('395', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240904', '1591240904');
INSERT INTO `t_admin_log` VALUES ('396', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240905', '1591240905');
INSERT INTO `t_admin_log` VALUES ('397', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240906', '1591240906');
INSERT INTO `t_admin_log` VALUES ('398', 'site/index', 'http://www.qr.com/?r=gii', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"r\":\"gii\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240935', '1591240935');
INSERT INTO `t_admin_log` VALUES ('399', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240936', '1591240936');
INSERT INTO `t_admin_log` VALUES ('400', 'site/index', 'http://www.qr.com/?r=gii', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"r\":\"gii\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240939', '1591240939');
INSERT INTO `t_admin_log` VALUES ('401', 'rbac/role/index', 'http://www.qr.com/rbac/role/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240940', '1591240940');
INSERT INTO `t_admin_log` VALUES ('402', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240956', '1591240956');
INSERT INTO `t_admin_log` VALUES ('403', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240957', '1591240957');
INSERT INTO `t_admin_log` VALUES ('404', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591240960', '1591240960');
INSERT INTO `t_admin_log` VALUES ('405', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241007', '1591241007');
INSERT INTO `t_admin_log` VALUES ('406', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241007', '1591241007');
INSERT INTO `t_admin_log` VALUES ('407', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241008', '1591241008');
INSERT INTO `t_admin_log` VALUES ('408', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241030', '1591241030');
INSERT INTO `t_admin_log` VALUES ('409', 'rbac/route/index', 'http://www.qr.com/rbac/route/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241031', '1591241031');
INSERT INTO `t_admin_log` VALUES ('410', 'rbac/route/refresh', 'http://www.qr.com/rbac/route/refresh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241097', '1591241097');
INSERT INTO `t_admin_log` VALUES ('411', 'site/index', 'http://www.qr.com/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241104', '1591241104');
INSERT INTO `t_admin_log` VALUES ('412', 'rbac/menu/index', 'http://www.qr.com/rbac/menu/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241109', '1591241109');
INSERT INTO `t_admin_log` VALUES ('413', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241184', '1591241184');
INSERT INTO `t_admin_log` VALUES ('414', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241193', '1591241193');
INSERT INTO `t_admin_log` VALUES ('415', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241244', '1591241244');
INSERT INTO `t_admin_log` VALUES ('416', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241258', '1591241258');
INSERT INTO `t_admin_log` VALUES ('417', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241268', '1591241268');
INSERT INTO `t_admin_log` VALUES ('418', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241275', '1591241275');
INSERT INTO `t_admin_log` VALUES ('419', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241285', '1591241285');
INSERT INTO `t_admin_log` VALUES ('420', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241292', '1591241292');
INSERT INTO `t_admin_log` VALUES ('421', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241305', '1591241305');
INSERT INTO `t_admin_log` VALUES ('422', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241376', '1591241376');
INSERT INTO `t_admin_log` VALUES ('423', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241446', '1591241446');
INSERT INTO `t_admin_log` VALUES ('424', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241453', '1591241453');
INSERT INTO `t_admin_log` VALUES ('425', 'qingrui/customer/index', 'http://www.qr.com/qingrui/customer/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591241468', '1591241468');
INSERT INTO `t_admin_log` VALUES ('426', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591242968', '1591242968');
INSERT INTO `t_admin_log` VALUES ('427', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591334644', '1591334644');
INSERT INTO `t_admin_log` VALUES ('428', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591334679', '1591334679');
INSERT INTO `t_admin_log` VALUES ('429', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591334811', '1591334811');
INSERT INTO `t_admin_log` VALUES ('430', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335116', '1591335116');
INSERT INTO `t_admin_log` VALUES ('431', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335129', '1591335129');
INSERT INTO `t_admin_log` VALUES ('432', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335157', '1591335157');
INSERT INTO `t_admin_log` VALUES ('433', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335178', '1591335178');
INSERT INTO `t_admin_log` VALUES ('434', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335209', '1591335209');
INSERT INTO `t_admin_log` VALUES ('435', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335263', '1591335263');
INSERT INTO `t_admin_log` VALUES ('436', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335272', '1591335272');
INSERT INTO `t_admin_log` VALUES ('437', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335295', '1591335295');
INSERT INTO `t_admin_log` VALUES ('438', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335311', '1591335311');
INSERT INTO `t_admin_log` VALUES ('439', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335334', '1591335334');
INSERT INTO `t_admin_log` VALUES ('440', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335345', '1591335345');
INSERT INTO `t_admin_log` VALUES ('441', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335351', '1591335351');
INSERT INTO `t_admin_log` VALUES ('442', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335363', '1591335363');
INSERT INTO `t_admin_log` VALUES ('443', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335532', '1591335532');
INSERT INTO `t_admin_log` VALUES ('444', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335610', '1591335610');
INSERT INTO `t_admin_log` VALUES ('445', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index?sort=sex', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '{\"sort\":\"sex\"}', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335616', '1591335616');
INSERT INTO `t_admin_log` VALUES ('446', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335624', '1591335624');
INSERT INTO `t_admin_log` VALUES ('447', 'qingrui/resume/index', 'http://www.qr.com/qingrui/resume/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591335669', '1591335669');
INSERT INTO `t_admin_log` VALUES ('448', 'qingrui/resume/upload', 'http://www.qr.com/qingrui/resume/upload', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '[]', '[]', '1', '***********@qq.com', '127.0.0.1', '1591342142', '1591342142');

-- ----------------------------
-- Table structure for `t_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_assignment`;
CREATE TABLE `t_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `t_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_auth_assignment
-- ----------------------------
INSERT INTO `t_auth_assignment` VALUES ('文章管理权限', '1', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('文章管理权限', '10', '1512542277');
INSERT INTO `t_auth_assignment` VALUES ('演示角色', '1', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('演示角色', '2', '1589350334');
INSERT INTO `t_auth_assignment` VALUES ('演示角色', '3', '1589350789');
INSERT INTO `t_auth_assignment` VALUES ('管理员', '1', '1516773830');

-- ----------------------------
-- Table structure for `t_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item`;
CREATE TABLE `t_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `t_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `t_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_auth_item
-- ----------------------------
INSERT INTO `t_auth_item` VALUES ('/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/init', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/optimize', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/repair', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/start', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/del', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/init', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/start', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/qingrui/*', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/*', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/create', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/delete', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/delete-all', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/index', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/status', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/update', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/qingrui/customer/view', '2', null, null, null, '1591162161', '1591162161');
INSERT INTO `t_auth_item` VALUES ('/rbac/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/revoke', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/*', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/index', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/view', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/refresh', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/active', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/change-password', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/inactive', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/login', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/logout', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/request-password-reset', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/reset-password', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/signup', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/update-self', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/dashboard', '2', null, null, null, '1516773692', '1516773692');
INSERT INTO `t_auth_item` VALUES ('/site/error', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/test', '2', null, null, null, '1539312029', '1539312029');
INSERT INTO `t_auth_item` VALUES ('/system/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/*', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/create', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/delete', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/delete-all', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/index', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/update', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/view', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/*', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/create', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/delete', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/delete-all', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/index', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/update', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/view', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/active', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/inactive', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/online-users', '2', null, null, null, '1518083077', '1518083077');
INSERT INTO `t_auth_item` VALUES ('/system/user/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/ico', '2', null, null, null, '1539334899', '1539334899');
INSERT INTO `t_auth_item` VALUES ('/tools/import', '2', null, null, null, '1588744483', '1588744483');
INSERT INTO `t_auth_item` VALUES ('/tools/upload', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/upload-editor', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/upload-pdf', '2', null, null, null, '1585548314', '1585548314');
INSERT INTO `t_auth_item` VALUES ('/tools/uploadedit', '2', null, null, null, '1585107252', '1585107252');
INSERT INTO `t_auth_item` VALUES ('文章管理权限', '1', '管理后台文章权限', null, null, '1512542259', '1512542259');
INSERT INTO `t_auth_item` VALUES ('演示角色', '1', '用于演示的角色', null, null, '1521768107', '1521768107');
INSERT INTO `t_auth_item` VALUES ('管理员', '1', '超级管理员权限', null, null, '1498697175', '1512542127');

-- ----------------------------
-- Table structure for `t_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item_child`;
CREATE TABLE `t_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `t_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_auth_item_child
-- ----------------------------
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/*');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/backup/export/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/init');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/optimize');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/repair');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/start');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/del');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/backup/import/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/init');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/start');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/db-explain');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/download-mail');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/toolbar');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/reset-identity');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/set-identity');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/action');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/diff');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/preview');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/status');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/qingrui/customer/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/assign');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/assignment/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/revoke');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/assignment/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/menu/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/menu/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/permission/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/permission/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/role/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/role/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/create');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/route/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/refresh');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/rule/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/rule/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/active');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/change-password');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/inactive');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/index');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/login');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/login');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/logout');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/logout');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/request-password-reset');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/reset-password');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/signup');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/update-self');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/*');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/site/dashboard');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/dashboard');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/error');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/site/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/test');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/system/user-rank/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/system/user-rank/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/active');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/inactive');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/online-users');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/system/user/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/ico');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/upload');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/upload-editor');

-- ----------------------------
-- Table structure for `t_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule`;
CREATE TABLE `t_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `t_blogroll`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogroll`;
CREATE TABLE `t_blogroll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bl_name` varchar(50) NOT NULL COMMENT '友情链接名称',
  `bl_url` varchar(100) DEFAULT NULL COMMENT '友情链接地址',
  `bl_sort` int(11) NOT NULL DEFAULT '1' COMMENT '友情链接排序',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogroll
-- ----------------------------
INSERT INTO `t_blogroll` VALUES ('1', '青商创服', 'http://www.qingscf.com/', '1', '1585281188', '1585281188');
INSERT INTO `t_blogroll` VALUES ('2', '青锐国际', 'http://www.qingruigj.com/', '2', '1585281360', '1585281360');
INSERT INTO `t_blogroll` VALUES ('3', '青鼎知识产权', 'http://qingdingzscq.com/', '3', '1585281422', '1585281422');
INSERT INTO `t_blogroll` VALUES ('4', '顿飞信息', 'http://www.dophy.cn/', '4', '1585281468', '1585281468');
INSERT INTO `t_blogroll` VALUES ('5', '好办租赁', '', '5', '1585281637', '1585285896');
INSERT INTO `t_blogroll` VALUES ('6', '青宣传媒', '', '6', '1585281681', '1585285415');
INSERT INTO `t_blogroll` VALUES ('8', '荣正咨询', 'http://www.realize.com.cn/', '8', '1585281769', '1587694576');
INSERT INTO `t_blogroll` VALUES ('9', '易点租', 'https://www.edianzu.com/', '9', '1585281804', '1585281827');
INSERT INTO `t_blogroll` VALUES ('10', '优客工场', 'https://www.ucommune.com/', '10', '1585281879', '1585281892');
INSERT INTO `t_blogroll` VALUES ('11', '律石诉讼资助', 'http://www.litigationfunding.cn/', '11', '1585281974', '1587694542');
INSERT INTO `t_blogroll` VALUES ('12', '海太欧林家具', 'http://www.ht-ol.com/', '12', '1586312553', '1586312553');
INSERT INTO `t_blogroll` VALUES ('13', '品邦广告', 'http://cd.pinbang.cn/', '13', '1586312572', '1586312572');
INSERT INTO `t_blogroll` VALUES ('14', '法大大', 'https://www.fadada.com/', '14', '1586312589', '1586312589');
INSERT INTO `t_blogroll` VALUES ('15', '信永中和', 'https://www.shinewing.com/', '15', '1586312604', '1586312604');
INSERT INTO `t_blogroll` VALUES ('16', '优适酒', '', '16', '1586312616', '1586312616');
INSERT INTO `t_blogroll` VALUES ('18', '每刻报销', 'https://www.maycur.com/', '18', '1587693984', '1587694002');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `company_allname` varchar(50) DEFAULT NULL COMMENT '企业全称',
  `company_logo` varchar(100) DEFAULT NULL COMMENT '企业logo地址',
  `pro_describe` varchar(255) DEFAULT NULL COMMENT '产品具体介绍',
  `pro_superiority` varchar(100) DEFAULT NULL COMMENT '产品优势',
  `company_describe` text COMMENT '公司描述',
  `linkman` varchar(30) NOT NULL COMMENT '公司联系人',
  `phone` varchar(15) NOT NULL COMMENT '联系方式',
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  `check` tinyint(2) DEFAULT '2' COMMENT '是否本公司  1是  2否',
  `state` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否严选 1是  2 否',
  `strict_id` int(11) DEFAULT NULL COMMENT '严选类型id',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `reason` varchar(50) DEFAULT NULL COMMENT '原因',
  `strict_state` tinyint(2) DEFAULT '2' COMMENT '严选状态 1是  2否',
  `company_pdf` varchar(100) DEFAULT NULL COMMENT '企业上传pdf文件',
  `service_charge` varchar(100) DEFAULT NULL COMMENT '服务费',
  `company_url` varchar(100) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_company_type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('2', '青商创服', '青商创服', 'https://api.vipysp.com/uploads/20200330/202003301117191619.jpg', '代理记账;纳税申报;工商注册; 社保代理', null, '青商创服是一家专业的创业企业商务代理服务公司。', '', '', '', '2', '1', '1', '1', null, '1', 'https://api.vipysp.com/uploads/PDF/青商创服.pdf', '', 'http://www.qingscf.com/', '1585030878', '1587692935');
INSERT INTO `t_company` VALUES ('11', '青锐国际', '青锐国际传媒投资（北京）有限公司', 'https://api.vipysp.com/uploads/20200330/202003301455068787.png', '80万人才信息;500人猎头团队;3万签约企业;70个服务覆盖城市', null, '青锐国际创建于2018年，在北京、上海、深圳三地均有OFFICE。', '', '', '', '2', '1', '2', '20', null, '1', 'https://api.vipysp.com/uploads/PDF/青锐国际.pdf', '', 'http://www.qingruigj.com/', '1585545129', '1585555312');
INSERT INTO `t_company` VALUES ('12', '青鼎知识产权', '青鼎知识产权', 'https://api.vipysp.com/uploads/20200330/202003301500084355.png', '商标注册;版权登记;专利申请;商标续展', null, '青鼎知识产权是专业的知识产权代理机构，我司致力发展成为中国最大的知识产权代理机构。', '', '', '', '2', '1', '3', '5', '', '2', 'https://api.vipysp.com/uploads/PDF/青鼎知识产权.pdf', '', 'http://qingdingzscq.com/', '1585551613', '1588838500');
INSERT INTO `t_company` VALUES ('13', '顿飞信息', '上海顿飞信息科技有限公司', 'https://api.vipysp.com/uploads/20200330/202003301503338355.png', '云计算服务;数据中心构建;系统集成服务', null, '顿飞信息基于多年IT产品分销及行业服务经验，致力于为各行业提供综合性IT解决方案及服务。', '', '', '', '2', '1', '4', '4', null, '1', 'https://api.vipysp.com/uploads/PDF/顿飞信息.pdf', '', 'http://www.dophy.cn/', '1585551830', '1585619339');
INSERT INTO `t_company` VALUES ('14', '好办租赁', '好办租赁', 'https://api.vipysp.com/uploads/20200330/202003301506396974.png', '企业办公室租赁;一对一看房;商业地产服务平台;线下看房团队', null, '好办是创新型企业办公室租赁服务商，主要是为企业提供办公室租赁服务。', '张三', '15662765678', 'ceo', '2', '1', '5', '35', null, '1', 'https://api.vipysp.com/uploads/PDF/好办租赁.pdf', '', '', '1585552043', '1588231202');
INSERT INTO `t_company` VALUES ('15', '青宣传媒', '青宣传媒', 'https://api.vipysp.com/uploads/20200330/202003301510263821.png', '创意设计;方案策划;媒体计划;媒体投放', null, '青宣传媒是青成集团旗下专业的从创意设计到投放全流程整合传播营销服务商。', '', '', '', '2', '1', '6', '24', '', '2', 'https://api.vipysp.com/uploads/PDF/青宣传媒.pdf', '', '', '1585552229', '1588838690');
INSERT INTO `t_company` VALUES ('16', '青合财税', '青合财税', 'https://api.vipysp.com/uploads/20200330/202003301513073610.png', '企业税务顾问;税务策划;财务管理;IPO前期财务合规', null, '青合财税是一家专业的财税服务公司，拥有一批经验丰富的自身注册会计师、税务师、评估师等专业人员。', '', '', '', '2', '1', '7', '14', '', '2', 'https://api.vipysp.com/uploads/PDF/青合财税.pdf', '', 'http://qhcaishui.com/', '1585552466', '1588838824');
INSERT INTO `t_company` VALUES ('17', '海太欧林家具', '海太欧林集团有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200417/202004171638015661.jpg', '功能实用;材质环保;设计时尚;人性办公', null, '中国办公家具十大品牌。\r\n广东办公家具著名商标。\r\n海太欧林家具始终致力于办公家具得研发、生产、销售与服务。', '', '', '', '2', '1', '8', '15', null, '1', 'https://api.vipysp.com/uploads/yanxuan/PDF/202004201105405444.pdf', '面议', 'http://www.ht-ol.com/', '1585552667', '1587890778');
INSERT INTO `t_company` VALUES ('18', '荣正咨询', '上海荣正投资咨询股份有限公司', 'https://api.vipysp.com/uploads/20200330/202003301518248842.png', '薪酬绩效咨询服务;税务筹划咨询服务;并购重组咨询服务;股权激励咨询服务', null, '荣正咨询以股权激励咨询服务起家，立足资本市场，为客户提供创意丰富的专业化咨询服务。', '', '', '', '2', '1', '9', '10', null, '1', 'https://api.vipysp.com/uploads/PDF/荣正咨询.pdf', '', 'http://www.realize.com.cn/', '1585552769', '1587694382');
INSERT INTO `t_company` VALUES ('19', '易点租', '北京易点淘网络技术有限公司', 'https://api.vipysp.com/uploads/20200330/202003301520531849.png', '免押金 按月付;全新电脑随租随还;4小时上门修复解决;IT轻资产管理', null, '易点租是行业的开创者。用创新思维与极致的服务，颠覆了传统的企业设备购买模式，开创了中国企业IT租赁服务新时代。', '', '', '', '2', '1', '10', '16', null, '1', 'https://api.vipysp.com/uploads/PDF/易点租.pdf', '', 'https://www.edianzu.com/', '1585552950', '1585552950');
INSERT INTO `t_company` VALUES ('20', '优客工场', '优客工场(北京)创业投资有限公司', 'https://api.vipysp.com/uploads/20200330/202003301525199194.png', '标准化空间U Space;小型办公空间U Studio;定制化空间U Design;U Partner资产托管模式', null, '优客工场是中国的联合办公空间运营商，截至2019年9月30日，共覆盖包括中国一线和新一线城市以及新加坡在内的42个城市。', '', '', '', '2', '1', '11', '35', '', '1', 'https://api.vipysp.com/uploads/PDF/优客工场.pdf', '', 'https://www.ucommune.com/', '1585553122', '1588838765');
INSERT INTO `t_company` VALUES ('21', '律石诉讼资助', '律石诉讼资助', 'https://api.vipysp.com/uploads/20200330/202003301526491528.png', '资深诉讼律师;律所专业部门负责人;公司法务总监;国际仲裁专家律师', null, '律石是由资深法律和专业人士组建成立的中国领先的诉讼资助服务机构。', '', '', '', '2', '1', '12', '7', null, '1', 'https://api.vipysp.com/uploads/PDF/律石诉讼资助.pdf', '', 'http://www.litigationfunding.cn/', '1585553214', '1587694532');
INSERT INTO `t_company` VALUES ('22', '青成企服严选', '青鼎（上海）信息科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200513/202005131514452506.png', '无', null, '青成企服严选作为一个开放但品控严格的企业服务供应商互联网智能展示平台，通过大数据、人工智能算法等方式严格把控入驻供应商的资质、质量、口碑、售后服务等各个环节，与一线大牌企业服务商合作，为企业用户提供高品质服务，青成企服严选引入大批优质的、拥有完整链条服务能力的第三方企业服务品牌供应商，并扶持三方服务品牌发展，共同助力中国企业发展。', '', '', '', '1', '1', null, '1', null, '2', '', '面议', '', '1585555148', '1589781655');
INSERT INTO `t_company` VALUES ('27', '品邦广告', '上海品邦广告有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200424/202004241324378546.jpg', '全球会展营销服务;全球活动创意概念;展厅展馆创意规划', null, '品邦广告有限公司成立于2006年，拥有14年全国品牌创意营销及专业性展示服务经验，公司拥有完善运作体系和高效执行团队，致力于会展营销服务、品牌运营活动和展厅展馆空间设计施工一体化三大业务板块，为客户提供服务一体化综合展示解决方案。', '', '', '', '2', '1', null, '26', '', '1', '', '面议', 'https://www.pinbang.com/', '1587700615', '1587887561');
INSERT INTO `t_company` VALUES ('28', '法大大', '深圳法大大网络科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200424/202004241324245959.jpg', '电子合同服务;区块链证据保全;证据保全邮', null, '深圳法大大网络科技有限公司是国内领先的第三方电子合同平台，主要各行业以及政府机构提供电子合同、电子文件签署及证据保全服务，同时整合提供司法鉴定和律师服务等增值服务。', '', '', '', '2', '1', null, '32', '', '1', '', '面议', 'https://www.fadada.com/', '1587704752', '1587705867');
INSERT INTO `t_company` VALUES ('29', '每刻报销', '杭州每刻科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200424/202004241324473257.jpg', '费用管理SaaS平台;智能费用报销;无纸化绿色财务', null, '每刻报销是国内领先的企业差旅及费用管理SaaS平台，为企业提供差旅预订、费用报销管理、全流程费用管控服务，降低企业费用采购成本， 提高费用采购和审批审核的效率。', '', '', '', '2', '1', null, '33', '', '1', '', '', 'https://www.maycur.com/', '1587704856', '1587710248');
INSERT INTO `t_company` VALUES ('30', '优适酒', '优适酒', 'https://api.vipysp.com/uploads/yanxuan/20200424/202004241433159973.jpg', '选酒;辨别;品鉴;购买渠道', null, '优适酒APP是一个可实现智能识别、便捷选酒及垂直销售的葡萄酒查选平台，主要是为葡萄酒消费者解决选酒、辨别、品鉴、购买渠道这四个核心痛点。', '', '', '', '2', '1', null, '12', '', '1', 'https://api.vipysp.com/uploads/yanxuan/PDF/202004241433282338.pdf', '', '', '1587710013', '1587710024');
INSERT INTO `t_company` VALUES ('31', '信永中和', '信永中和（北京）国际投资管理有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271056164263.png', '审计鉴证;管理咨询;税务及会计服务;工程管理咨询', null, '信永中和是中国真正实现了一体化、矩阵制管理的大型专业服务机构，并已经初步形成“共享服务中心”的管理模式。', '', '', '', '2', '1', null, '21', '', '2', '', '面议', 'https://www.shinewing.com/', '1587956526', '1587956536');
INSERT INTO `t_company` VALUES ('32', '用友', '用友网络科技股份有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271106467472.png', '软件及服务业务;企业互联网服务;互联网金融服务', null, '用友网络是一家企业与公共组织软件、云服务、金融服务提供商提供商，业务范围涵盖数字营销与客服、社交与协同办公、智能制造、财务/人力共享服务、企业金融服务等领域。', '', '', '', '2', '1', null, '34', '', '2', '', '面议', 'https://www.yonyou.com/', '1587957157', '1587957245');
INSERT INTO `t_company` VALUES ('33', '在路上', '在路上(上海)国际旅行社有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271120364997.png', '集中采购、集中支付;第三方结算公司介入服务流程;自动化、快速预订', null, '在路上旅业是一家国内商务旅行管理顾问，专注于旅行成本及大数据的管理，利用互联网+的技术和创新，提高客户商务旅行计划的整体效率及商务旅客的旅行体验，整合航空公司资源为客户提供商务旅行方案。', '', '', '', '2', '1', null, '29', '', '2', '', '', 'https://www.otw.cn/', '1587958284', '1587958376');
INSERT INTO `t_company` VALUES ('34', '会小二', '北京云动数字媒体技术有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271134555094.png', '海量资源;高效服务;服务对接;省钱省力', null, '会小二是北京云动数字媒体技术有限公司旗下品牌，是中国领先的会议场地、会议酒店、会议室，活动资源在线预订平台。', '', '', '', '2', '1', null, '25', '', '2', '', '', 'https://www.huixiaoer.com/', '1587959991', '1587959998');
INSERT INTO `t_company` VALUES ('35', '印乎网', '北京景秀宏图科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271322513037.png', '企业策划;专家级网站设计', null, '印乎网是一家IT整包服务互联网平台，包括平面广告设计、UI设计、APP开发、小程序开发等服务。平台签约有上千名经过严格审核的行业前5%的优秀人才，是领先的IT外包服务平台。', '', '', '', '2', '1', null, '2', '', '2', '', '', 'http://hao.yinhu360.com/', '1587965299', '1587965334');
INSERT INTO `t_company` VALUES ('36', '51社保', '北京众合天下管理咨询有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271332598215.png', '社保服务;薪酬服务;外包与派遣服务;收入结算', null, '51社保作为中国互联网社保的开创者，是一家以技术驱动的企业社保服务提供商。通过独特创新的4S模式针对标准化用工、灵活用工和特殊人才用工等多种用工形式，为企业提供综合性人力资源共享服务解决方案。', '', '', '', '2', '1', null, '8', '', '2', '', '', 'https://www.51shebao.com/', '1587965817', '1587966397');
INSERT INTO `t_company` VALUES ('37', '民生银行', '中国民生银行股份有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200427/202004271343108490.png', '民营企业;科技金融;综合服务', null, '中国民生银行于1996年1月12日在北京正式成立，是中国第一家主要由民营企业发起设立的全国性股份制商业银行，也是严格按照中国《公司法》和《商业银行法》设立的一家现代金融企业。 ', '', '', '', '2', '1', null, '19', '', '2', '', '', 'http://www.cmbc.com.cn/', '1587966383', '1587966392');
INSERT INTO `t_company` VALUES ('39', '创客贴', '北京艺源酷科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301405282393.png', '丰富的模板;在线设计;多终端协作', null, '创客贴隶属于北京艺源酷科技有限公司，是一款简单易用、功能强大的线上图形设计工具，用户可使用平台提供的大量的图片、字体、模板等设计元素，通过简单的拖、拉、拽就可以制作出自己所需要的图片或设计，在平台上轻松地表达想法和创意，让想法与实现之间不再是专业软件的繁杂和枯燥而是享受创客贴带来的简单与乐趣。', '', '', '', '2', '1', null, '2', '', '2', '', '', 'https://www.chuangkit.com/', '1588227140', '1588227148');
INSERT INTO `t_company` VALUES ('40', '谱时', '承影互联（北京）科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301425164741.png', '高品质照片呈现;实时交付分享;页面呈现丰富;品牌多元化营销', null, '“谱时图片直播”—活动云拍摄全案专家，是承影互联（北京）科技有限公司旗下为企业提供云拍摄的专业影像拍摄服务机构，通过自主研发的实时图像传输系统及基于人工智能的图像处理云结合专业摄影摄像团队，为用户提供专业极速的影像直播拍摄服务，同时提供丰富的影像交互功能和传播玩法，帮助品牌在互联网媒体中快速传播分享，赋予品牌、活动和产品更大的营销价值。', '', '', '', '2', '1', null, '37', '', '1', '', '', 'http://www.plusx.cn/', '1588227921', '1588838552');
INSERT INTO `t_company` VALUES ('41', '顺丰速运', '中山顺丰速运有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301433339778.png', '快递服务、冷运服务、仓储服务;信贷业务、综合支付、金融科技', null, '顺丰是国内领先的快递物流综合服务商，是一家具有网络规模优势的智能物流运营商，采用直营的经营模式，由总部对各分支机构实施统一经营、统一管理，保障了网络整体运营质量。', '', '', '', '2', '1', null, '27', '', '2', '', '', 'https://www.sf-express.com/', '1588228696', '1588228702');
INSERT INTO `t_company` VALUES ('42', '博涵财经', '上海博涵公共关系管理咨询股份有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301444457442.png', '企业形象管理;财经传播及媒体关系管理;投资者关系管理;危机管理', null, '上海博涵公共关系管理咨询股份有限公司（以下简称“博涵财经”）是专注于财经传播和投资者关系管理一站式服务解决方案提供商，目前已为境内外百余家A股及H股上市公司、新三板挂牌公司、金融机构等提供专业服务。', '', '', '', '2', '1', null, '23', '', '2', '', '', 'http://www.brighthand.cn/', '1588229348', '1588229355');
INSERT INTO `t_company` VALUES ('43', '北大纵横', '北京北大纵横管理咨询有限责任公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301500245939.png', '管理咨询;纵横商学;纵横智库;纵横投资', null, '北大纵横管理咨询集团成立于1996年，是国内第一家注册成立的管理咨询公司。北大纵横以管理咨询为核心，大力拓展商学、资本、人才等多个领域的业务，为企业提供全方位、全生命周期的智力服务。', '', '', '', '2', '1', null, '10', '', '2', '', '', 'http://www.allpku.com/', '1588230232', '1588230241');
INSERT INTO `t_company` VALUES ('44', '有道翻译', '北京网易有道计算机系统有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301515236788.png', '语言翻译;在线教育;智能硬件;云应用', null, '网易有道是中国领先的智能学习公司，致力于提供100%以用户为导向的学习产品和服务。有道成立于2006年，打造了一系列深受用户喜欢的口碑型大众学习工具产品。', '', '', '', '2', '1', null, '9', '', '2', '', '', 'http://fanyi.youdao.com/', '1588231112', '1588231118');
INSERT INTO `t_company` VALUES ('45', '青商创服', '青商创服', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301521469441.png', '代理记账;纳税申报;工商注册; 社保代理', null, '青商创服是一家专业的创业企业商务代理服务公司。', '', '', '', '2', '1', null, '6', '', '2', '', '', 'http://www.qingscf.com/', '1588231321', '1588231409');
INSERT INTO `t_company` VALUES ('46', '青商创服', '青商创服', 'https://api.vipysp.com/uploads/yanxuan/20200430/202004301523021271.png', '代理记账;纳税申报;工商注册; 社保代理', null, '青商创服是一家专业的创业企业商务代理服务公司。', '', '', '', '2', '1', null, '13', '', '2', '', '', 'http://www.qingscf.com/', '1588231391', '1588231403');
INSERT INTO `t_company` VALUES ('47', '企课网', '北京企课信息技术有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071040212114.png', '云课堂;轻OA;大数据', null, '企课网是国内首家实效型企业学习平台，公司致力于打造中国企业大学领导品牌，企课大学借助互联网/移动互联网助力中国千万家中小型企业搭建自己的企业人才培养系统。', '', '', '', '2', '1', null, '11', '', '2', '', '', 'http://www.qikevip.com/', '1588729546', '1588819357');
INSERT INTO `t_company` VALUES ('48', '佳世国际', '北京佳世国际科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200506/202005060957231101.png', '代做标书;代做预算;造价咨询;图形算量', null, '北京佳世国际科技有限公司，提供招投标领域全链条多元化服务，大数据互联网平台高质量合作企业，以及权威质量信誉认证机构合作，为客户提供高效优质的服务。', '', '', '', '2', '1', null, '22', '', '2', '', '', 'https://www.bszj168.com/', '1588730367', '1588730373');
INSERT INTO `t_company` VALUES ('49', '商祺礼品', '上海商祺礼品有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200506/202005061007077586.png', '免费打样;交货迅速;完善的售后服务', null, '上海商祺礼品有限公司拥有从策划到设计、再到制作、配送的完整产业链，为客户的不同需求，策划礼品方案和礼品外观个性设计，严格把关制作和配送的每一个环节，让每个小礼品都注入新的生命和活力，使之成为拉动客户关系的纽带，提升企业形象的代言人。', '', '', '', '2', '1', null, '28', '', '2', '', '', 'https://www.sunte.com/', '1588731160', '1588731167');
INSERT INTO `t_company` VALUES ('50', '享趣团建', '上海享趣文化传播有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200506/202005061028385024.png', '团建策划;拓展训练;企业旅行', null, '上海享趣文化传播有限公司是一家专业从事“体验式培训”研究和推广的培训机构。本公司一直通过国际社会流行的户外训练方式，依托强大的管理顾问团队及其专业化的师资队伍，致力于为个人、团队及组织提供最适合的团建课程，并设计定制了一系列的个性化与标准化实施相结合的培训模式。公司有其深刻的训练内涵、先进的训练模式、独特的训练风格及完善的服务流程。', '', '', '', '2', '1', null, '30', '', '2', '', '', 'https://www.qiyetuozhan.com/', '1588734370', '1588734377');
INSERT INTO `t_company` VALUES ('51', 'CDP集团', '薪得付信息技术（上海）有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200506/202005061113358660.png', '弹性福利服务;健康管理;薪酬管理服务', null, 'CDP集团成立于2004年，作为人力资本管理服务创新机构，CDP集团秉承“成就企业、造福员工”的品牌理念而创立。', '', '', '', '2', '1', null, '31', '', '2', '', '', 'http://www.cdpgroupltd.com/', '1588734943', '1588734948');
INSERT INTO `t_company` VALUES ('52', '泰合资本', '泰合资本', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005070953547385.png', '交易;赋能;视野', null, '泰合资本创立于2012年,为新经济头部创业企业提供全生命周期价值的投行服务。以成就未来商业领袖为使命,以打造世界级投资银行为愿景。', '', '', '', '2', '1', null, '3', '', '2', '', '', 'http://www.taihecap.com/', '1588735382', '1588816586');
INSERT INTO `t_company` VALUES ('53', '国泰君安', '国泰君安证券股份有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005070945427200.png', '券商资管;银行理财;公募基金:私募基金', null, '·国泰君安，中国证券行业长期、持续、全面领先的综合金融服务商。国泰君安跨越了中国资本市场发展的全部历程和多个周期，始终以客户为中心，深耕中国市场，为个人和机构客户提供各类金融服务，确立了全方位的行业领先地位。', '', '', '', '2', '1', null, '18', '', '2', '', '', 'https://www.gtja.com/', '1588816098', '1588816597');
INSERT INTO `t_company` VALUES ('54', '光源资本', '光源资本', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071000057029.png', '战略驱动;资本赋能;资源加持', null, '光源资本是中国领先的新经济精品投行，专注于新经济领域，致力于成为1%顶尖新经济企业家战略与资本的合伙人。', '', '', '', '2', '1', null, '3', '', '2', '', '', 'http://www.lighthousecap.cn/', '1588816898', '1588816906');
INSERT INTO `t_company` VALUES ('55', '分众传媒', '分众传媒', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071005316938.png', '电梯电视;电梯海报;晶视影院:终视卖场', null, '分众传媒诞生于2003年，创建了电梯媒体广告模式，2005年成为首家在美国纳斯达克上市的中国广告传媒股，并于2007年入选纳斯达克100指数。', '', '', '', '2', '1', null, '24', '', '1', '', '', 'https://www.focusmedia.cn/', '1588817230', '1588838677');
INSERT INTO `t_company` VALUES ('56', '新潮传媒', '成都新潮传媒集团有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071614483531.png', '新潮传媒;新潮LCD;美框300', null, '成都新潮传媒集团有限公司是一家“传统媒体+互联网”的科技媒体创新企业。新潮传媒作为专注中产家庭消费的社区媒体平台，截至目前，已在全国100个城市有60万部电梯智慧屏，每天覆盖2亿中产家庭人群，已经成为23000多个客户的共同选择。', '', '', '', '2', '1', null, '24', '', '2', '', '', 'https://www.xinchao.com/', '1588817505', '1588839443');
INSERT INTO `t_company` VALUES ('57', '梯影传媒', '北京梯影传媒科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071014341039.png', '时效性强;品质高端;受众精;准区域性强', null, '北京梯影传媒科技有限公司是创新楼宇电梯媒体的前瞻性广告公司。公司自主研发并拥有知识产权的电梯投影设备是颠覆现有平面传播介质，实现移动互联、具备程序化下单及大数据分析功能的新型媒体形式。', '', '', '', '2', '1', null, '24', '', '2', '', '', 'http://www.tikinmedia.com/', '1588817777', '1588817791');
INSERT INTO `t_company` VALUES ('58', '青松基金', '青松基金', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071024287821.png', '文化教育;大消费;创新科技及应用', null, '青松基金由刘晓松、董占斌、苏蔚三位互联网及投资圈资深人士于2012年6月创办，是一家专注于文化教育、大消费、创新科技及应用等投资领域的早期风险投资机构。', '', '', '', '2', '1', null, '17', '', '2', '', '', 'http://www.qingsongfund.com/', '1588818435', '1588838564');
INSERT INTO `t_company` VALUES ('59', '光合创投', '光合创投', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071032225466.png', '互联网/移动/高科技;生活消费/新型服务;电子商务/品牌;文化娱乐/旅游', null, '光合基金是一家早期投资机构，投资面向于互联网、IT、其它高科技、新媒体和数字娱乐行业的早期项目，包括筹备期直至项目开始后三年内的发展期。光合基金拥有技术、产品专业人才储备，可以在早期项目至关重要的技术和产品领域对创业项目提供助力。', '', '', '', '2', '1', null, '17', '', '2', '', '', 'http://www.ghvc.cn/', '1588818827', '1588818839');
INSERT INTO `t_company` VALUES ('60', '行动成功', '上海行动教育科技股份有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071046184556.png', '实效管理培训;咨询辅导;年度顾问;学习工具', null, '行动成功，全称上海行动教育科技股份有限公司，是一家业内知名的管理培训公司，是中国首家专注于帮助企业建立实效商学院的建设专家，不仅为企业提供系列公开课和内训课的知识体系，还为企业提供配套的、量身定制的教育体系和管理体系。', '', '', '', '2', '1', null, '11', '', '2', '', '', 'http://www.xdjy100.com/', '1588819727', '1588819761');
INSERT INTO `t_company` VALUES ('61', '宗师猫', '北京市律购信息技术有限责任公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071106121221.png', '商标服务;专利服务;版权与设计;商标交易', null, '宗师猫隶属于北京市律购信息技术有限责任公司，律购专注于互联网法律服务。旗下品牌宗师猫，一个没有驳回焦虑的知识产权平台，致力于商标、版权、专利申请及维权，尤其是疑难商标的解决方案为数千家企业破解了难题，如火币、滴滴、小米、腾讯等。', '', '', '', '2', '1', null, '5', '', '1', '', '', 'http://www.zongshimao.com/', '1588820909', '1588838490');
INSERT INTO `t_company` VALUES ('62', '易代储', '北京易代储科技有限公司', 'https://api.vipysp.com/uploads/yanxuan/20200507/202005071111324508.png', '精选仓;专业团队;急速响应;智能监管', null, '易代储，定位于满足中小微企业灵活仓储需求的互联网仓储运营服务平台，通过产品+服务模式，整合各类优质仓库资源，搭建全国区域广、库房多、服务优的管理平台，为客户提供仓储一站式解决方案。以灵活时间、灵活空间的仓储租赁方式，标准化的库内操作管理，不断推动仓储行业各环节升级和创新，提升供应链管理价值。', '', '', '', '2', '1', null, '35', '', '2', '', '', 'http://www.yidaichu.com/', '1588821212', '1588821219');

-- ----------------------------
-- Table structure for `t_company_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_type`;
CREATE TABLE `t_company_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL DEFAULT '类型名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) NOT NULL COMMENT '新增时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company_type
-- ----------------------------
INSERT INTO `t_company_type` VALUES ('1', '注册代办', null, null, '1586404511', '1586404511');
INSERT INTO `t_company_type` VALUES ('2', '品牌设计', null, null, '1586404573', '1586404573');
INSERT INTO `t_company_type` VALUES ('3', '财务顾问', null, null, '1586404587', '1588816143');
INSERT INTO `t_company_type` VALUES ('4', 'IT/软件', null, null, '1586404599', '1586404599');
INSERT INTO `t_company_type` VALUES ('5', '知识产权', null, null, '1586404608', '1586404608');
INSERT INTO `t_company_type` VALUES ('6', '资质代办', null, null, '1586404617', '1587887804');
INSERT INTO `t_company_type` VALUES ('7', '法律服务', null, null, '1586404629', '1586404629');
INSERT INTO `t_company_type` VALUES ('8', '人力社保', null, null, '1586404638', '1587888552');
INSERT INTO `t_company_type` VALUES ('9', '翻译服务', null, null, '1586404648', '1586404648');
INSERT INTO `t_company_type` VALUES ('10', '咨询服务', null, null, '1586404658', '1586404658');
INSERT INTO `t_company_type` VALUES ('11', '教育培训', null, null, '1586404706', '1586404706');
INSERT INTO `t_company_type` VALUES ('12', '企业用酒', null, null, '1586404720', '1586404720');
INSERT INTO `t_company_type` VALUES ('13', '财务代理', null, null, '1586404731', '1586404731');
INSERT INTO `t_company_type` VALUES ('14', '税务筹划', null, null, '1586404743', '1586404743');
INSERT INTO `t_company_type` VALUES ('15', '办公家具', null, null, '1586404754', '1586404754');
INSERT INTO `t_company_type` VALUES ('16', '办公用品', null, null, '1586404766', '1586404766');
INSERT INTO `t_company_type` VALUES ('17', '股权投资', null, null, '1586404777', '1588818034');
INSERT INTO `t_company_type` VALUES ('18', '证券投行', null, null, '1586404786', '1588739085');
INSERT INTO `t_company_type` VALUES ('19', '金融服务', null, null, '1586404796', '1587888774');
INSERT INTO `t_company_type` VALUES ('20', '猎头招聘', null, null, '1586404805', '1587890099');
INSERT INTO `t_company_type` VALUES ('21', '审计服务', null, null, '1586404816', '1587887864');
INSERT INTO `t_company_type` VALUES ('22', '标书制作', null, null, '1586404830', '1586404830');
INSERT INTO `t_company_type` VALUES ('23', '公关服务', null, null, '1586404839', '1586404839');
INSERT INTO `t_company_type` VALUES ('24', '广告传媒', null, null, '1586404850', '1586404850');
INSERT INTO `t_company_type` VALUES ('25', '会议服务', null, null, '1586404858', '1586404858');
INSERT INTO `t_company_type` VALUES ('26', '展会服务', null, null, '1586404869', '1586404869');
INSERT INTO `t_company_type` VALUES ('27', '物流服务', null, null, '1586404882', '1586404882');
INSERT INTO `t_company_type` VALUES ('28', '企业礼品', null, null, '1586404891', '1586404891');
INSERT INTO `t_company_type` VALUES ('29', '商旅机票', null, null, '1586404902', '1586404902');
INSERT INTO `t_company_type` VALUES ('30', '团建拓展', null, null, '1586404914', '1586404914');
INSERT INTO `t_company_type` VALUES ('31', '员工福利', null, null, '1586404926', '1586404926');
INSERT INTO `t_company_type` VALUES ('32', '电子合同', null, null, '1587704552', '1587704552');
INSERT INTO `t_company_type` VALUES ('33', '报销服务', null, null, '1587704617', '1587704617');
INSERT INTO `t_company_type` VALUES ('34', '软件公司', null, null, '1587887931', '1587887931');
INSERT INTO `t_company_type` VALUES ('35', '场地租赁', null, null, '1587888010', '1587888010');
INSERT INTO `t_company_type` VALUES ('36', '国内上市', '18', null, '1587889952', '1587889952');
INSERT INTO `t_company_type` VALUES ('37', '照相摄影', null, null, '1588227253', '1588227253');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `value` text COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`name`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', 'WEB_SITE_TITLE', '网站标题', '青成企服严选', '网站标题前台显示标题', '0', '0', '1585288904', '1588758942');
INSERT INTO `t_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '网站描述', '青成企服严选作为一个开放但品控严格的企业服务供应商互联网智能展示平台，通过大数据、人工智能算法等方式严格把控入驻供应商的资质、质量、口碑、售后服务等各个环节，与一线大牌企业服务商合作，为企业用户提供高品质服务，青成企服严选引入大批优质的、拥有完整链条服务能力的第三方企业服务品牌供应商，并扶持三方服务品牌发展，共同助力中国企业发展。', '网站搜索引擎描述', '1', '0', '1585288904', '1589781614');
INSERT INTO `t_config` VALUES ('3', 'WEB_SITE_KEYWORD', '网站关键字', '大品牌、服务好、有保障、放心用', '网站搜索引擎关键字', '8', '0', '1585288904', '1588579266');
INSERT INTO `t_config` VALUES ('10', 'WEB_SITE_ICP', '网站备案号', '<p data-v-40ab164b=\"\">© 2020&nbsp;青隆（上海）信息科技有限公司</p><p data-v-40ab164b=\"\"><a target=\"_blank\" href=\"http://beian.miit.gov.cn/\">沪ICP备19027376号-2</a></p><p data-v-40ab164b=\"\">&nbsp;<img src=\"https://api.vipysp.com/uploads/20200518/202005181701301769.png\" alt=\"undefined\">&nbsp;&nbsp;<a target=\"_blank\" href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010602005530\">沪公网安备 31010602005530号</a></p>', '设置在网站底部显示的备案号', '9', '0', '1585554254', '1589792881');
INSERT INTO `t_config` VALUES ('11', 'WEB_SITE_RESOURCES_URL', '上传图片服务器域名（可用二级域名）', '<p>https://api.vipysp.com/</p>', '域名格式（https://api.vipysp.com/）', '3', '0', '1586317820', '1586488975');
INSERT INTO `t_config` VALUES ('13', 'COLOR_STYLE', '后台色系', 'default_color', '后台颜色风格', '10', '1', '1586317820', '1586317820');
INSERT INTO `t_config` VALUES ('20', 'WEB_SITE_ALLOW_UPLOAD_TYPE', '站点允许上传文件类型', 'jpg,rar,png,gif,rar,jpeg,pdf', '只需要填写后缀即可', '1', '1', '1585299561', '1585299561');
INSERT INTO `t_config` VALUES ('25', 'WEB_SITE_LOGO', '网站logo', '<img src=\"https://api.vipysp.com/uploads/20200415/202004151313225844.png\" alt=\"undefined\">', '网站logo', '6', '1', '1585538177', '1586927604');
INSERT INTO `t_config` VALUES ('23', 'WEB_SITE_BACKGROUND', '站点头部背景图', '<img src=\"https://api.vipysp.com/uploads/20200420/202004201552441206.jpg\" alt=\"undefined\"><img src=\"https://api.vipysp.com/uploads/20200420/202004201422341582.jpg\" alt=\"undefined\"><img src=\"https://api.vipysp.com/uploads/20200420/202004201420226739.jpg\" alt=\"undefined\">', '站点头部背景图', '3', '1', '1585553915', '1587369169');
INSERT INTO `t_config` VALUES ('26', 'WEB_SITE_IMAGE_SIZE', '上传图片大小', '512000', '文件大小限制', '7', '1', '1585536536', '1585536536');
INSERT INTO `t_config` VALUES ('28', 'WEB_SITE_WEB_SERVICE', '网站客服', '<script>var _hmt = _hmt || [];(function() {var hm = document.createElement(\"script\");hm.src = \"https://hm.baidu.com/hm.js?ada62a85f391483698a88b1ce46ab49f\";var s = document.getElementsByTagName(\"script\")[0]; s.parentNode.insertBefore(hm, s);})();</script>', '网站客服', '8', '1', '1585723888', '1585723888');
INSERT INTO `t_config` VALUES ('29', 'WEB_SITE_DEFAULT_PDF', '网站默认pdf', 'https://api.vipysp.com/uploads/PDF/业务介绍示例.pdf', '业务介绍示例', '10', '1', '1585899335', '1586488995');
INSERT INTO `t_config` VALUES ('30', 'WEB_SITE_GUAN_TITLE', '官网网站标题', '青商创服', '青商创服', '11', '1', '1587353704', '1589420955');
INSERT INTO `t_config` VALUES ('31', 'WEB_SITE_GUAN-DESCRIPTION', '官网网站描述', '青商创服隶属北京青成创新科技有限公司，是一家专业的创业企业商务代理服务公司，拥有一批精通各类企业的代理记账、纳税申报、工商注册、社保代理等专业服务人员。青商创服业务聚焦初创中小企业，提供中小企业记账、财务外包、财务整理、纳税申报、所得税汇算清缴、公司变更注册等一站式代理服务。青商创服愿与广大中小型企业携手共赢，共同成长。', '官网网站描述', '12', '1', '1587353881', '1589421035');
INSERT INTO `t_config` VALUES ('32', 'WEB_SITE_GUAN_KEYWORD', '官网网站关键字', '青成集团、注册记账、知识产权、青成、官网', '官网网站关键字', '13', '1', '1587353951', '1587714978');
INSERT INTO `t_config` VALUES ('33', 'WEB_SITE_GUAN_ICP', '官网网站备案号', '<p><span style=\"text-align: center;\">© 2020 青鼎（上海）信息科技有限公司 版权所有&nbsp;</span><a target=\"_blank\" href=\"http://beian.miit.gov.cn/\">沪ICP备20008423号-2</a>&nbsp;&nbsp;<img src=\"https://api.vipysp.com/uploads/20200525/202005251703177775.png\" alt=\"undefined\"><a target=\"_blank\" href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010602005558\">沪公网安备 31010602005558号</a></p>', '官网网站备案号', '13', '1', '1587354367', '1590397435');
INSERT INTO `t_config` VALUES ('34', 'WEB_SITE_GUAN_LOGO', '官网网站log', '<img src=\"https://api.vipysp.com/uploads/20200514/202005140946122746.png\" alt=\"undefined\">', '官网网站logo', '14', '1', '1587360809', '1589420774');
INSERT INTO `t_config` VALUES ('35', 'WEB_SITE_GUAN_BACKGROUND', '官网网站广告图', '<img src=\"https://api.vipysp.com/uploads/20200420/202004201335056653.jpg\" alt=\"undefined\"><img src=\"https://api.vipysp.com/uploads/20200420/202004201334463480.jpg\" alt=\"undefined\">', '官网网站广告图', '15', '1', '1587360915', '1587360915');
INSERT INTO `t_config` VALUES ('36', 'WEB_SITE_ADVERTISING_IMG', '青成严选广告图', '<img src=\"https://api.vipysp.com/uploads/20200506/202005061351523973.jpg\" alt=\"undefined\">', '青成严选广告图', '16', '1', '1588744316', '1588744354');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '客户姓名',
  `contact` int(20) NOT NULL COMMENT '联系方式',
  `sex` tinyint(2) DEFAULT '3' COMMENT '性别  1男  2女 3未知',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `post` varchar(100) DEFAULT NULL COMMENT '职位',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1显示  2隐藏',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '张三', '2147483647', '3', '112@qq.com', 'ceo', '1', '1591164471', '1591164471', '1');
INSERT INTO `t_customer` VALUES ('2', '李四', '2147483647', '1', '112@qq.com', 'ceo', '1', '1591166646', '1591166646', '1');
INSERT INTO `t_customer` VALUES ('3', '阿三', '2147483647', '2', '112@qq.com', 'ceo', '1', '1591166666', '1591169019', '1');

-- ----------------------------
-- Table structure for `t_guan_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_goods`;
CREATE TABLE `t_guan_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '类别id 二级id',
  `intro` varchar(100) NOT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `cost` varchar(100) NOT NULL COMMENT '费用',
  `attr_id` int(10) unsigned DEFAULT NULL COMMENT '属性id',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示   1是 2否',
  `cover_img` varchar(100) DEFAULT NULL COMMENT '图片',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_goods
-- ----------------------------
INSERT INTO `t_guan_goods` VALUES ('1', '2', '足不出户 创办公司', '<p><br/></p><p style=\"text-align: left;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271413014072.jpg\" title=\"202005271413014072.jpg\" alt=\"202005271413014072.jpg\" width=\"417\" height=\"134\"/></p><p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"></span></p><p style=\"white-space: normal;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">上海青本企业管理咨询有限公司</span></strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">：</span><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">是经上海市工商管理局核准具有企业登记代理资质的正规</span><a href=\"http://www.shzcgs.org/\" target=\"_blank\" title=\"注册公司\" style=\"color: rgb(28, 87, 196); white-space: normal; background-color: rgb(255, 255, 255); text-decoration: underline; font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">代理注册公司</span></a><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">.我们致力于打造一个既能为积极创业的朋友和逐步扩大的公司提供迅速、全面、安全、可靠、优惠的注册服务。（并且可以提供税务一条龙服务。以及商标注册、行政外包，为您分担注册、税务等方面的烦恼。）公司现有专门的注册顾问为广大需要注册的朋友提供专业的注册咨询。且有先进的会计电算化处理系统，能为客户提供及时准确的会计信息。</span><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 18px;\"><span style=\"color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); font-size: 20px;\"></span><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"></span></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><br/></span></p><p style=\"white-space: normal;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271411357541.jpg\" title=\"202005271411357541.jpg\" alt=\"94fd4c93806dbec3ae982bae0acc392a.jpg\" width=\"829\" height=\"192\"/></p><p style=\"white-space: normal;\"><span style=\"font-size: 24px;\"><strong style=\"white-space: normal;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">青本提供给您的服务：</span></strong></span></p><p style=\"white-space: normal;\"><strong style=\"white-space: normal;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\"><br/></span></strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>提供最合适的注册公司方案</p></li><li><p style=\"white-space: normal; line-height: 2em;\">提供最合适的经营范围描述</p></li><li><p style=\"white-space: normal; line-height: 2em;\">产品明码标价，办理进度全透明</p></li><li><p style=\"white-space: normal; line-height: 2em;\">完善的售后保障体系</p><p style=\"white-space: normal; line-height: 2em;\"><br/></p></li></ul><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\"><strong><span style=\"font-size: 24px;\">需要您准备的材料和您将拿到的材料</span></strong></span><br/></p><p style=\"white-space: normal; line-height: 2em;\">&nbsp;&nbsp;<img src=\"https://api.vipysp.com//uploads/20200527/202005271522113574.png\" title=\"202005271522113574.png\" alt=\"image.png\"/><img src=\"https://api.vipysp.com//uploads/20200527/202005271527036615.png\" title=\"202005271527036615.png\" alt=\"image.png\" width=\"654\" height=\"457\"/></p><p style=\"white-space: normal; line-height: 2em;\"><span style=\"font-size: 24px;\">咨询电话：杨女士&nbsp; 18540272282</span></p>', '699', '1', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586754757', '1590566013');
INSERT INTO `t_guan_goods` VALUES ('2', '3', '专人办理 省心省力', '<p><br/></p><h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><strong><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 36px;\">银行开户</span></strong></h1><p><img src=\"http://img.baidu.com/hi/youa/y_0034.gif\" width=\"300\" height=\"200\"/></p><p><strong><img src=\"https://api.vipysp.com//uploads/20200527/202005271616499924.png\" title=\"202005271616499924.png\" alt=\"image.png\"/></strong></p><p><strong><br/></strong></p><p><strong><span style=\"font-size: 18px;\">&nbsp; &nbsp; 用心服务 ，口碑经营 是<strong style=\"white-space: normal;\">上海青本企业管理咨询有限公司<span style=\"font-size: 18px;\">&nbsp;发展的立足之本我们本着“做人真诚正直，&nbsp; &nbsp; &nbsp; 做事精致完美”的宗旨，深得上海中小企业的好评。</span></strong></span></strong></p><p><img src=\"http://img.baidu.com/hi/youa/y_0040.gif\" width=\"300\" height=\"300\"/><span style=\"font-size: 20px;\">咨询电话：杨女士&nbsp; 18540272282<span style=\"font-size: 24px;\"></span></span></p><p><span style=\"font-size: 20px;\"><br/></span></p><p><br/></p><p><br/></p><p><br/></p>', '699', '1', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586766901', '1590567991');
INSERT INTO `t_guan_goods` VALUES ('3', '5', '工商变更 一步到位', '<p style=\"text-align: left;\"><span style=\"color:#e36c09\">股权变更</span></p><table width=\"822\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"300\" style=\"text-align:center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271630243100.jpeg\" title=\"202005271630243100.jpeg\" alt=\"340a241b88061b62a851c58ed0851ae0.jpeg\"/></td><td width=\"482\"><p><span style=\"color: rgb(192, 80, 77); font-size: 24px;\">上海青本企业管理咨询有限公司</span></p><p style=\"text-align: left;\"><span style=\"color: rgb(192, 80, 77); font-size: 24px;\">联系电话：杨女士&nbsp; &nbsp;18540272282</span></p><p><br/></p></td></tr></tbody></table><p style=\"text-indent: 2em; text-align: center;\"><span style=\"font-size: 24px; color: rgb(192, 80, 77);\"><br/></span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 24px; color: rgb(192, 80, 77);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司变更业务</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 24px; color: rgb(192, 80, 77);\"><br/></span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 24px; text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp;三大公司类型</span><br/></p><p style=\"text-indent: 2em; text-align: left;\"><span style=\"font-size: 24px;\"><br/></span></p><p style=\"text-indent: 2em; text-align: left;\"><span style=\"text-indent: 2em; font-size: 20px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://api.vipysp.com//uploads/20200527/202005271642429929.png\" title=\"202005271642429929.png\" alt=\"image.png\"/><img src=\"https://api.vipysp.com//uploads/20200527/202005271643352393.png\" title=\"202005271643352393.png\" alt=\"image.png\"/><img src=\"https://api.vipysp.com//uploads/20200527/202005271643567791.png\" title=\"202005271643567791.png\" alt=\"image.png\"/></span></p><p style=\"text-indent: 2em;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271649596774.png\" title=\"202005271649596774.png\" alt=\"image.png\"/><img src=\"https://api.vipysp.com//uploads/20200527/202005271650187190.png\" title=\"202005271650187190.png\" alt=\"image.png\"/><img src=\"https://api.vipysp.com//uploads/20200527/202005271651011762.png\" title=\"202005271651011762.png\" alt=\"image.png\"/></p><p style=\"text-indent: 2em; text-align: center;\"><span style=\"color: rgb(192, 80, 77); font-size: 36px;\">交给青本一切就是么简单<span style=\"color: rgb(192, 80, 77); text-indent: 2em;\">这</span></span></p>', '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829506', '1590569566');
INSERT INTO `t_guan_goods` VALUES ('4', '13', '专业过关 经验丰富', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829549', '1586832219');
INSERT INTO `t_guan_goods` VALUES ('5', '10', '免费定制节税方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829701', '1586832231');
INSERT INTO `t_guan_goods` VALUES ('6', '9', '专人会计 专业代帐', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829726', '1586832241');
INSERT INTO `t_guan_goods` VALUES ('7', '11', '专人服务 全程办理', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829763', '1586832252');
INSERT INTO `t_guan_goods` VALUES ('8', '14', '注会协会贴标 正规专业', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829783', '1586832262');
INSERT INTO `t_guan_goods` VALUES ('9', '8', '专人负责 高效办理', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">五证合一</span></h1><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271700033559.png\" title=\"202005271700033559.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271715121606.png\" title=\"202005271715121606.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271715439062.png\" title=\"202005271715439062.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271716334201.png\" title=\"202005271716334201.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271717034762.png\" title=\"202005271717034762.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271718519727.png\" title=\"202005271718519727.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271719112193.png\" title=\"202005271719112193.png\" alt=\"image.png\"/></p><p style=\"text-align: center;\"><img src=\"https://api.vipysp.com//uploads/20200527/202005271719497296.png\" title=\"202005271719497296.png\" alt=\"image.png\"/></p><p style=\"display:none;\"><br/></p>', '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586829802', '1590571311');
INSERT INTO `t_guan_goods` VALUES ('10', '19', '专业顾问 极速响应', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231616428991.png', '1586829857', '1587629804');
INSERT INTO `t_guan_goods` VALUES ('11', '20', '现成好标 任您挑选', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044491063.png', '1586830621', '1586832291');
INSERT INTO `t_guan_goods` VALUES ('12', '24', '购买交易 轻松拥有好品牌', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045109299.png', '1586830642', '1586832312');
INSERT INTO `t_guan_goods` VALUES ('13', '25', '杜绝剽窃 维护权益', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045219251.png', '1586830659', '1586832322');
INSERT INTO `t_guan_goods` VALUES ('14', '28', '保护您的软件源代码', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045312859.png', '1586830690', '1586832333');
INSERT INTO `t_guan_goods` VALUES ('15', '55', '高含金量 发展必备', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045419810.png', '1586831045', '1586832343');
INSERT INTO `t_guan_goods` VALUES ('16', '26', '保护原创 独家专属', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045501231.png', '1586831069', '1586832352');
INSERT INTO `t_guan_goods` VALUES ('17', '27', '专业代理 快速办理', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141046018899.png', '1586831086', '1586832363');
INSERT INTO `t_guan_goods` VALUES ('18', '29', '专业顾问 快速响应', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141046117115.png', '1586831105', '1586832372');
INSERT INTO `t_guan_goods` VALUES ('19', '56', '海量房源 快速成交', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617071767.png', '1586832516', '1587629829');
INSERT INTO `t_guan_goods` VALUES ('20', '32', '位置优越 配套完善', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141049277450.png', '1586832570', '1586832570');
INSERT INTO `t_guan_goods` VALUES ('21', '33', '更灵活的商业运作', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141049576050.png', '1586832599', '1586832599');
INSERT INTO `t_guan_goods` VALUES ('22', '35', '多态商圈 汇聚商机', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141050206352.png', '1586832622', '1586832622');
INSERT INTO `t_guan_goods` VALUES ('23', '39', '更专业更快捷更高效', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617225468.png', '1586832673', '1587629844');
INSERT INTO `t_guan_goods` VALUES ('24', '38', '贴心服务 专属方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141051329587.png', '1586832694', '1586832694');
INSERT INTO `t_guan_goods` VALUES ('25', '37', '专业团队 高效匹配', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141051569936.png', '1586832718', '1586832718');
INSERT INTO `t_guan_goods` VALUES ('26', '54', '优质人才信息供应商', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141052176309.png', '1586832739', '1586832739');
INSERT INTO `t_guan_goods` VALUES ('27', '41', '为企业提供完整的云解决方案', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617413100.png', '1586832765', '1590129159');
INSERT INTO `t_guan_goods` VALUES ('28', '45', '为客户提供全面网络解决方案', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141053137406.png', '1586832794', '1590129274');
INSERT INTO `t_guan_goods` VALUES ('29', '44', '为客户提供信息系统构筑', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141053494303.png', '1586832831', '1590129287');
INSERT INTO `t_guan_goods` VALUES ('30', '47', '定制服务 个性化开发', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141054214516.png', '1586832872', '1590129298');
INSERT INTO `t_guan_goods` VALUES ('31', '50', '设计创意视频制作', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618022092.png', '1586832912', '1590129360');
INSERT INTO `t_guan_goods` VALUES ('32', '51', '制定传播策略 预估效果', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141055304576.png', '1586832932', '1590129378');
INSERT INTO `t_guan_goods` VALUES ('33', '52', '全方位定制化投放方案', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141055522476.png', '1586832953', '1590129392');
INSERT INTO `t_guan_goods` VALUES ('34', '53', '方案执行 追踪效果', null, '699', null, '2', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141056126613.png', '1586832973', '1590129417');
INSERT INTO `t_guan_goods` VALUES ('35', '59', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618549814.png', '1586835501', '1587629937');
INSERT INTO `t_guan_goods` VALUES ('36', '61', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618407746.png', '1586835523', '1587629923');
INSERT INTO `t_guan_goods` VALUES ('37', '65', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161321523412.png', '1587014516', '1587014516');
INSERT INTO `t_guan_goods` VALUES ('38', '62', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161322242873.png', '1587014546', '1587101964');
INSERT INTO `t_guan_goods` VALUES ('39', '63', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161322371139.png', '1587014559', '1587101977');
INSERT INTO `t_guan_goods` VALUES ('40', '64', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161323274698.png', '1587014609', '1587101987');
INSERT INTO `t_guan_goods` VALUES ('41', '66', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161323574910.png', '1587014638', '1587014638');
INSERT INTO `t_guan_goods` VALUES ('42', '67', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324164875.png', '1587014658', '1587014658');
INSERT INTO `t_guan_goods` VALUES ('43', '68', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324283291.png', '1587014670', '1587014670');
INSERT INTO `t_guan_goods` VALUES ('44', '69', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324413338.png', '1587014683', '1587014683');
INSERT INTO `t_guan_goods` VALUES ('48', '74', '专人办理 省心省力', null, '699', null, '1', null, '1590458201', '1590458201');
INSERT INTO `t_guan_goods` VALUES ('49', '75', '专人办理 省心省力', null, '699', null, '1', null, '1590458243', '1590458243');

-- ----------------------------
-- Table structure for `t_guan_goods_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_goods_attribute`;
CREATE TABLE `t_guan_goods_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL COMMENT '服务商品id',
  `attribute` varchar(100) NOT NULL COMMENT '属性名称',
  `cost` decimal(10,2) NOT NULL COMMENT '价格',
  `sort` int(11) NOT NULL COMMENT '排序',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_goods_attribute
-- ----------------------------
INSERT INTO `t_guan_goods_attribute` VALUES ('1', '1', '有限责任公司注册', '699.00', '1', '1586847211', '1586847211');
INSERT INTO `t_guan_goods_attribute` VALUES ('2', '2', '海外银行开户', '699.00', '1', '1586848386', '1586848386');
INSERT INTO `t_guan_goods_attribute` VALUES ('3', '1', '海外公司注册', '688.00', '2', '1586849110', '1586849110');

-- ----------------------------
-- Table structure for `t_guan_goods_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_goods_copy`;
CREATE TABLE `t_guan_goods_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '类别id 二级id',
  `intro` varchar(100) NOT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `cost` varchar(100) NOT NULL COMMENT '费用',
  `attr_id` int(10) unsigned DEFAULT NULL COMMENT '属性id',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示   1是 2否',
  `cover_img` varchar(100) DEFAULT NULL COMMENT '图片',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_goods_copy
-- ----------------------------
INSERT INTO `t_guan_goods_copy` VALUES ('1', '2', '足不出户 创办公司', '<p><img src=\"http://192.168.1.197/uploads/guanwang/20200414/202004141613203667.png\" alt=\"undefined\"/></p>', '699', '1', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', '1586754757', '1587629654');
INSERT INTO `t_guan_goods_copy` VALUES ('2', '3', '专人办理 省心省力', null, '699', '1', '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141039447490.png', '1586766901', '1586831992');
INSERT INTO `t_guan_goods_copy` VALUES ('3', '5', '工商变更 一步到位', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141043023057.png', '1586829506', '1586832183');
INSERT INTO `t_guan_goods_copy` VALUES ('4', '13', '专业过关 经验丰富', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141043372792.png', '1586829549', '1586832219');
INSERT INTO `t_guan_goods_copy` VALUES ('5', '10', '免费定制节税方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141043497778.png', '1586829701', '1586832231');
INSERT INTO `t_guan_goods_copy` VALUES ('6', '9', '专人会计 专业代帐', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044006803.png', '1586829726', '1586832241');
INSERT INTO `t_guan_goods_copy` VALUES ('7', '11', '专人服务 全程办理', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044119328.png', '1586829763', '1586832252');
INSERT INTO `t_guan_goods_copy` VALUES ('8', '14', '注会协会贴标 正规专业', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044211520.png', '1586829783', '1586832262');
INSERT INTO `t_guan_goods_copy` VALUES ('9', '8', '专人负责 高效办理', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044317737.png', '1586829802', '1586832273');
INSERT INTO `t_guan_goods_copy` VALUES ('10', '19', '专业顾问 极速响应', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231616428991.png', '1586829857', '1587629804');
INSERT INTO `t_guan_goods_copy` VALUES ('11', '20', '现成好标 任您挑选', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141044491063.png', '1586830621', '1586832291');
INSERT INTO `t_guan_goods_copy` VALUES ('12', '24', '购买交易 轻松拥有好品牌', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045109299.png', '1586830642', '1586832312');
INSERT INTO `t_guan_goods_copy` VALUES ('13', '25', '杜绝剽窃 维护权益', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045219251.png', '1586830659', '1586832322');
INSERT INTO `t_guan_goods_copy` VALUES ('14', '28', '保护您的软件源代码', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045312859.png', '1586830690', '1586832333');
INSERT INTO `t_guan_goods_copy` VALUES ('15', '55', '高含金量 发展必备', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045419810.png', '1586831045', '1586832343');
INSERT INTO `t_guan_goods_copy` VALUES ('16', '26', '保护原创 独家专属', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141045501231.png', '1586831069', '1586832352');
INSERT INTO `t_guan_goods_copy` VALUES ('17', '27', '专业代理 快速办理', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141046018899.png', '1586831086', '1586832363');
INSERT INTO `t_guan_goods_copy` VALUES ('18', '29', '专业顾问 快速响应', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141046117115.png', '1586831105', '1586832372');
INSERT INTO `t_guan_goods_copy` VALUES ('19', '56', '海量房源 快速成交', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617071767.png', '1586832516', '1587629829');
INSERT INTO `t_guan_goods_copy` VALUES ('20', '32', '位置优越 配套完善', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141049277450.png', '1586832570', '1586832570');
INSERT INTO `t_guan_goods_copy` VALUES ('21', '33', '更灵活的商业运作', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141049576050.png', '1586832599', '1586832599');
INSERT INTO `t_guan_goods_copy` VALUES ('22', '35', '多态商圈 汇聚商机', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141050206352.png', '1586832622', '1586832622');
INSERT INTO `t_guan_goods_copy` VALUES ('23', '39', '更专业更快捷更高效', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617225468.png', '1586832673', '1587629844');
INSERT INTO `t_guan_goods_copy` VALUES ('24', '38', '贴心服务 专属方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141051329587.png', '1586832694', '1586832694');
INSERT INTO `t_guan_goods_copy` VALUES ('25', '37', '专业团队 高效匹配', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141051569936.png', '1586832718', '1586832718');
INSERT INTO `t_guan_goods_copy` VALUES ('26', '54', '优质人才信息供应商', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141052176309.png', '1586832739', '1586832739');
INSERT INTO `t_guan_goods_copy` VALUES ('27', '41', '为企业提供完整的云解决方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617413100.png', '1586832765', '1587629863');
INSERT INTO `t_guan_goods_copy` VALUES ('28', '45', '为客户提供全面网络解决方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141053137406.png', '1586832794', '1586832794');
INSERT INTO `t_guan_goods_copy` VALUES ('29', '44', '为客户提供信息系统构筑', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141053494303.png', '1586832831', '1586832831');
INSERT INTO `t_guan_goods_copy` VALUES ('30', '47', '定制服务 个性化开发', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141054214516.png', '1586832872', '1586832872');
INSERT INTO `t_guan_goods_copy` VALUES ('31', '50', '设计创意视频制作', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618022092.png', '1586832912', '1587629883');
INSERT INTO `t_guan_goods_copy` VALUES ('32', '51', '制定传播策略 预估效果', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141055304576.png', '1586832932', '1586832932');
INSERT INTO `t_guan_goods_copy` VALUES ('33', '52', '全方位定制化投放方案', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141055522476.png', '1586832953', '1586832953');
INSERT INTO `t_guan_goods_copy` VALUES ('34', '53', '方案执行 追踪效果', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200414/202004141056126613.png', '1586832973', '1586832973');
INSERT INTO `t_guan_goods_copy` VALUES ('35', '59', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618549814.png', '1586835501', '1587629937');
INSERT INTO `t_guan_goods_copy` VALUES ('36', '61', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618407746.png', '1586835523', '1587629923');
INSERT INTO `t_guan_goods_copy` VALUES ('37', '65', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161321523412.png', '1587014516', '1587014516');
INSERT INTO `t_guan_goods_copy` VALUES ('38', '62', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161322242873.png', '1587014546', '1587101964');
INSERT INTO `t_guan_goods_copy` VALUES ('39', '63', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161322371139.png', '1587014559', '1587101977');
INSERT INTO `t_guan_goods_copy` VALUES ('40', '64', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161323274698.png', '1587014609', '1587101987');
INSERT INTO `t_guan_goods_copy` VALUES ('41', '66', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161323574910.png', '1587014638', '1587014638');
INSERT INTO `t_guan_goods_copy` VALUES ('42', '67', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324164875.png', '1587014658', '1587014658');
INSERT INTO `t_guan_goods_copy` VALUES ('43', '68', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324283291.png', '1587014670', '1587014670');
INSERT INTO `t_guan_goods_copy` VALUES ('44', '69', '专人办理 省心省力', null, '699', null, '1', 'https://api.vipysp.com/uploads/20200416/202004161324413338.png', '1587014683', '1587014683');

-- ----------------------------
-- Table structure for `t_guan_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_navigation`;
CREATE TABLE `t_guan_navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n_name` varchar(100) DEFAULT NULL COMMENT '导航栏名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转链接url',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_navigation
-- ----------------------------
INSERT INTO `t_guan_navigation` VALUES ('1', '关于公司', null, null, '1', '1586763351', '1586763351');
INSERT INTO `t_guan_navigation` VALUES ('2', '服务咨询', null, null, '2', '1586763384', '1586763384');
INSERT INTO `t_guan_navigation` VALUES ('3', '新闻资讯', null, null, '3', '1586763407', '1586763407');
INSERT INTO `t_guan_navigation` VALUES ('4', '精彩活动', null, null, '4', '1586763429', '1586763429');
INSERT INTO `t_guan_navigation` VALUES ('5', '联系我们', null, null, '5', '1586763446', '1586763446');

-- ----------------------------
-- Table structure for `t_guan_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_product`;
CREATE TABLE `t_guan_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) NOT NULL COMMENT '产品名称',
  `pro_intro` varchar(100) DEFAULT NULL COMMENT '产品简介',
  `nav_id` int(11) NOT NULL COMMENT '产品类别id',
  `type_id` int(11) DEFAULT NULL,
  `content` text COMMENT '产品内容',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '审核   1是  2否',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `cover_img` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `created_at` int(11) DEFAULT NULL COMMENT '新增时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_product
-- ----------------------------
INSERT INTO `t_guan_product` VALUES ('1', '新闻咨询', '新闻页面展示简介', '3', '1', '<b><img src=\"http://www.qc.com/plugins/layui/images/face/4.gif\" alt=\"[可怜]\">超爆炸新闻 ，走过路过，不要错过</b>', '1', '1', 'http://192.168.1.197/uploads/guanwang/20200415/202004151347042859.jpg', '1586929670', '1586934182');

-- ----------------------------
-- Table structure for `t_guan_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_product_type`;
CREATE TABLE `t_guan_product_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `intro` varchar(100) DEFAULT NULL COMMENT '简介',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_product_type
-- ----------------------------
INSERT INTO `t_guan_product_type` VALUES ('1', '新闻中心', '最新新闻', '1', '1586933786', '1586933786');

-- ----------------------------
-- Table structure for `t_guan_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_guan_type`;
CREATE TABLE `t_guan_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL DEFAULT '类型名称',
  `intro` varchar(100) DEFAULT NULL COMMENT '简介',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) NOT NULL COMMENT '新增时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '1显示  2隐藏',
  `cover_img` varchar(100) DEFAULT NULL COMMENT 'logo',
  `wechat_img` varchar(100) DEFAULT NULL COMMENT '小程序img',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guan_type
-- ----------------------------
INSERT INTO `t_guan_type` VALUES ('1', '注册记账', '公司设立、财税服务一站式解决', null, '1', '1586762238', '1590462732', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231614102244.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261112073365.jpg');
INSERT INTO `t_guan_type` VALUES ('2', '公司注册', null, '1', '1', '1586762253', '1586762253', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('3', '银行开户', null, '1', '2', '1586762278', '1586762278', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('4', '公司变更', null, '1', '3', '1586762292', '1586762292', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('5', '股权变更', null, '1', '4', '1586762321', '1586762321', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('6', '公司注销', null, '1', '5', '1586762337', '1586762337', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('7', '年报公示', null, '1', '6', '1586762348', '1586762348', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('8', '五证合一', null, '1', '7', '1586762361', '1586762361', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('9', '代理记账', null, '1', '8', '1586762372', '1586762372', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('10', '税收筹划', null, '1', '9', '1586762383', '1586762383', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('11', '税务代办', null, '1', '10', '1586762394', '1586762394', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('12', '发票代办', null, '1', '11', '1586762405', '1586762405', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('13', '财务审计', null, '1', '12', '1586762416', '1586762416', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('14', '验资报告', null, '1', '13', '1586762427', '1586762427', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('15', '资产评估', null, '1', '14', '1586762438', '1586762438', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('16', '汇缴清算', null, '1', '15', '1586762450', '1586762450', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('17', '税务解锁', null, '1', '16', '1586762462', '1586762462', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('18', '税务筹划', null, null, '2', '1586762478', '1590463382', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618549814.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261123002064.jpg');
INSERT INTO `t_guan_type` VALUES ('19', '商标注册', null, '58', '1', '1586762501', '1586762501', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('20', '商标交易', null, '58', '2', '1586762516', '1586762516', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('21', '商标异议', null, '58', '3', '1586762529', '1586762529', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('22', '商标撤三', null, '58', '4', '1586762541', '1586762541', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('23', '商标变更', null, '58', '5', '1586762553', '1586762553', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('24', '商标转让', null, '58', '6', '1586762565', '1586762565', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('25', '版权登记', null, '58', '7', '1586762577', '1586762577', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('26', '专利申请', null, '58', '8', '1586762588', '1586762588', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('27', '专利转让', null, '58', '9', '1586762599', '1586762599', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('28', '软件著作权 ', null, '58', '10', '1586762609', '1586762609', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('29', '作品著作权', null, '58', '12', '1586762624', '1586762624', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('30', '资质审批', null, null, '3', '1586762647', '1590463412', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618407746.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261123232749.jpg');
INSERT INTO `t_guan_type` VALUES ('31', '写字楼出租', null, '60', '2', '1586762681', '1586762681', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('32', '写字楼出售', null, '60', '3', '1586762695', '1586762695', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('33', '共享办公', null, '60', '4', '1586762707', '1586762707', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('34', '商铺出租', null, '60', '5', '1586762719', '1586762719', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('35', '商铺出售', null, '60', '6', '1586762731', '1586762731', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('36', '猎头招聘', '满足企业对中高端人才对需求', null, '4', '1586762754', '1590463429', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617225468.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261123485132.jpg');
INSERT INTO `t_guan_type` VALUES ('37', '智能优选', null, '36', '3', '1586762767', '1586762767', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('38', '专属服务', null, '36', '2', '1586762780', '1586762780', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('39', '资深猎头', null, '36', '1', '1586762797', '1586762797', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('40', 'IT服务', '全力为客户打造极具价值的IT解决方案', null, '5', '1586762809', '1590388927', '2', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617413100.png', null);
INSERT INTO `t_guan_type` VALUES ('41', '云计算服务', null, '40', '1', '1586762830', '1590388770', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('42', '大数据', null, '40', '2', '1586762842', '1586762842', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('43', '电子商务', null, '40', '3', '1586762859', '1586762859', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('44', '系统集成', null, '40', '4', '1586762873', '1586762873', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('45', '网络安全', null, '40', '6', '1586762902', '1586762902', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('46', '运维', null, '40', '7', '1586762919', '1586762919', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('47', '软件开发', null, '40', '8', '1586762933', '1586762933', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('48', '软件外包', null, '40', '8', '1586762946', '1586762946', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('49', '广告宣传', '专业的从创意设计到投放全流程整合传播营方案', null, '6', '1586762968', '1586762968', '2', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231618022092.png', null);
INSERT INTO `t_guan_type` VALUES ('50', '创意设计', null, '49', '1', '1586762982', '1586762982', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('51', '方案策划', null, '49', '2', '1586763005', '1586763005', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('52', '媒体计划', null, '49', '3', '1586763022', '1586763022', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('53', '媒体投放', null, '49', '4', '1586763043', '1586763043', '2', null, null);
INSERT INTO `t_guan_type` VALUES ('54', '人才信息', null, '36', '4', '1586829376', '1586829376', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('55', '发明专利', null, '58', '7', '1586830938', '1586830938', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('56', '办公室租赁', null, '60', '1', '1586832441', '1586832441', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('57', '更多', null, null, '7', '1586834896', '1590392512', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('58', '知识产权', '为产品提供360度全方位保护', null, '6', '1586834931', '1590463448', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231616428991.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261124069362.jpg');
INSERT INTO `t_guan_type` VALUES ('59', '税务筹划', null, '18', '1', '1586835107', '1587525482', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('60', '办公租赁', '为商业发展提供最好多运作方式', null, '6', '1586835163', '1590463462', '1', 'https://api.vipysp.com/uploads/guanwang/20200423/202004231617071767.png', 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261124208839.jpg');
INSERT INTO `t_guan_type` VALUES ('61', '资质审批', null, '30', '2', '1586835172', '1587525663', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('62', '社保合规诊断', null, '18', '2', '1587101706', '1587525497', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('63', '高新企业认定', null, '18', '3', '1587101764', '1587101764', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('64', '灵活用工', null, '18', '4', '1587101793', '1587101793', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('65', '税务风险诊断', null, '18', '4', '1587101793', '1587101793', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('66', '免费核名', null, '30', '2', '1587102599', '1587525672', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('67', 'Saas代账', null, '30', '3', '1587102647', '1587102647', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('68', 'ICP资质', null, '30', '4', '1587102684', '1587102684', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('69', '文网文许可证', null, '30', '5', '1587102801', '1587102801', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('72', '政府审批', null, '57', '1', '1590392419', '1590463481', '1', null, 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261124403375.jpg');
INSERT INTO `t_guan_type` VALUES ('73', '企业用酒', null, '57', '2', '1590392712', '1590463494', '1', null, 'https://api.vipysp.com/uploads/guanwang_wechat/20200526/202005261124526591.jpg');
INSERT INTO `t_guan_type` VALUES ('74', '政府补助', null, '72', '1', '1590458101', '1590458101', '1', null, null);
INSERT INTO `t_guan_type` VALUES ('75', '优适酒', null, '73', '1', '1590458133', '1590458133', '1', null, null);

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '1 显示  2隐藏',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '权限管理', null, null, '3', 'fa fa-bullhorn', '2');
INSERT INTO `t_menu` VALUES ('2', '角色列表', '1', '/rbac/role/index', '34', '&#xe6bf;', '1');
INSERT INTO `t_menu` VALUES ('3', '路由列表', '1', '/rbac/route/index', '46', '&#xea3a;', '1');
INSERT INTO `t_menu` VALUES ('5', '分配权限', '1', '/rbac/assignment/index', '37', '&#xe609;', '1');
INSERT INTO `t_menu` VALUES ('6', '菜单列表', '1', '/rbac/menu/index', '36', '&#xe65e;', '1');
INSERT INTO `t_menu` VALUES ('8', '后台用户', '1', '/rbac/user/index', '32', '&#xe60d;', '1');
INSERT INTO `t_menu` VALUES ('14', '系统管理', null, null, '2', '&#xe602;', '1');
INSERT INTO `t_menu` VALUES ('15', '配置设置', '14', '/system/config/index', '23', '&#xe609;', '1');
INSERT INTO `t_menu` VALUES ('21', '数据备份', '14', '/backup/export/index', '24', '&#xe778;', '1');
INSERT INTO `t_menu` VALUES ('22', '数据恢复', '14', '/backup/import/index', '25', '&#xe777;', '1');
INSERT INTO `t_menu` VALUES ('26', '日志记录', '1', '/rbac/log/index', '31', '&#xe7b8;', '1');
INSERT INTO `t_menu` VALUES ('49', '青锐管理', null, null, '7', null, '1');
INSERT INTO `t_menu` VALUES ('50', '客户管理', '49', '/qingrui/customer/index', '1', null, '1');

-- ----------------------------
-- Table structure for `t_menu_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_copy`;
CREATE TABLE `t_menu_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `t_menu_copy_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_copy
-- ----------------------------
INSERT INTO `t_menu_copy` VALUES ('1', '权限管理', null, null, '3', 'fa fa-bullhorn');
INSERT INTO `t_menu_copy` VALUES ('2', '角色列表', '1', '/rbac/role/index', '34', '&#xe6bf;');
INSERT INTO `t_menu_copy` VALUES ('3', '路由列表', '1', '/rbac/route/index', '46', '&#xea3a;');
INSERT INTO `t_menu_copy` VALUES ('5', '分配权限', '1', '/rbac/assignment/index', '37', '&#xe609;');
INSERT INTO `t_menu_copy` VALUES ('6', '菜单列表', '1', '/rbac/menu/index', '36', '&#xe65e;');
INSERT INTO `t_menu_copy` VALUES ('8', '后台用户', '1', '/rbac/user/index', '32', '&#xe60d;');
INSERT INTO `t_menu_copy` VALUES ('14', '系统管理', null, null, '2', '&#xe602;');
INSERT INTO `t_menu_copy` VALUES ('15', '配置设置', '14', '/system/config/index', '23', '&#xe609;');
INSERT INTO `t_menu_copy` VALUES ('21', '数据备份', '14', '/backup/export/index', '24', '&#xe778;');
INSERT INTO `t_menu_copy` VALUES ('22', '数据恢复', '14', '/backup/import/index', '25', '&#xe777;');
INSERT INTO `t_menu_copy` VALUES ('26', '日志记录', '1', '/rbac/log/index', '31', '&#xe7b8;');
INSERT INTO `t_menu_copy` VALUES ('32', '内容管理', null, null, '4', 'fa fa-archive');
INSERT INTO `t_menu_copy` VALUES ('36', '导航列表', null, '/content/navigation/index', '1', null);
INSERT INTO `t_menu_copy` VALUES ('37', '企业类型', null, '/content/company-type/index', '2', null);
INSERT INTO `t_menu_copy` VALUES ('38', '企业列表', null, '/content/company/index', '3', null);
INSERT INTO `t_menu_copy` VALUES ('39', '友情链接', null, '/content/blogroll/index', '3', null);
INSERT INTO `t_menu_copy` VALUES ('40', '严选类别', null, '/content/strict-type/index', '5', null);

-- ----------------------------
-- Table structure for `t_migration`
-- ----------------------------
DROP TABLE IF EXISTS `t_migration`;
CREATE TABLE `t_migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_migration
-- ----------------------------
INSERT INTO `t_migration` VALUES ('m000000_000000_base', '1498633414');
INSERT INTO `t_migration` VALUES ('m140602_111327_create_menu_table', '1498633912');
INSERT INTO `t_migration` VALUES ('m160312_050000_create_user', '1498633912');
INSERT INTO `t_migration` VALUES ('m140516_214808_actionlog', '1506561803');

-- ----------------------------
-- Table structure for `t_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation`;
CREATE TABLE `t_navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n_name` varchar(100) DEFAULT NULL COMMENT '导航栏名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转链接url',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_navigation
-- ----------------------------
INSERT INTO `t_navigation` VALUES ('19', '首页', null, null, '1', '1585037285', '1585037285');
INSERT INTO `t_navigation` VALUES ('20', '严选服务', null, null, '2', '1585037301', '1585037301');
INSERT INTO `t_navigation` VALUES ('21', '广告电商', null, null, '3', '1585037340', '1585037340');

-- ----------------------------
-- Table structure for `t_resume`
-- ----------------------------
DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT '3' COMMENT '1男  2女  3未知',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `native` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `politic` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `ethnic` varchar(50) DEFAULT NULL COMMENT '民族',
  `major` varchar(50) DEFAULT NULL COMMENT '专业',
  `school` varchar(100) DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(10) DEFAULT NULL COMMENT '学历',
  `idcard` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `birthday` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `marriage` varchar(20) DEFAULT NULL COMMENT '婚姻状态',
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `resume_photo` varchar(100) DEFAULT NULL COMMENT '简历照片',
  `expected_pay` varchar(50) DEFAULT NULL COMMENT '期望薪资',
  `worktime` varchar(50) DEFAULT NULL COMMENT '参加工作时间',
  `major_backg` text COMMENT '专业背景',
  `job_intention` text COMMENT '求职意向',
  `work_experience` text COMMENT '工作经历',
  `evaluation` varchar(255) DEFAULT NULL COMMENT '自我评价',
  `other` text COMMENT '其他说明',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '操作者id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume
-- ----------------------------
INSERT INTO `t_resume` VALUES ('1', '张三', '2', '18', '中国', '汗', null, null, null, '本科', null, null, '', 'ceo', '12222', '232@qq.com', '但是', null, null, null, null, null, null, null, null, '1591335230', '1591335230', '1', null);

-- ----------------------------
-- Table structure for `t_strict_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_strict_type`;
CREATE TABLE `t_strict_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '严选类型名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `state` tinyint(2) DEFAULT '1' COMMENT '状态 1是  2否',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_strict_type
-- ----------------------------
INSERT INTO `t_strict_type` VALUES ('1', '代理记账严选服务商', '1', '2', '1585557926', '1589274742');
INSERT INTO `t_strict_type` VALUES ('2', '人力资源严选服务商', '2', '1', '1585557951', '1585557951');
INSERT INTO `t_strict_type` VALUES ('3', '知识产权严选服务商', '3', '1', '1585557966', '1585557966');
INSERT INTO `t_strict_type` VALUES ('4', '信息技术严选服务商', '4', '1', '1585558015', '1585558015');
INSERT INTO `t_strict_type` VALUES ('5', '办公租赁严选服务商', '5', '1', '1585558033', '1585558033');
INSERT INTO `t_strict_type` VALUES ('6', '传播营销严选服务商', '6', '1', '1585558050', '1585558050');
INSERT INTO `t_strict_type` VALUES ('7', '财税业务严选服务商', '7', '1', '1585558076', '1585558076');
INSERT INTO `t_strict_type` VALUES ('8', '证券投资严选服务商', '8', '1', '1585558094', '1585558094');
INSERT INTO `t_strict_type` VALUES ('9', '股权激励严选服务商', '9', '1', '1585558114', '1585558135');
INSERT INTO `t_strict_type` VALUES ('10', '办公用品严选服务商', '10', '1', '1585558153', '1585558153');
INSERT INTO `t_strict_type` VALUES ('11', '办公空间严选服务商', '11', '1', '1585558172', '1585558172');
INSERT INTO `t_strict_type` VALUES ('12', '诉讼资助严选服务商', '12', '1', '1585558186', '1585559145');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `head_pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码hash',
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '重置密码凭据',
  `access_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户访问数据凭证',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户电子邮箱',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '用户状态',
  `r_id` int(11) unsigned NOT NULL COMMENT '用户等级',
  `created_at` int(11) NOT NULL COMMENT '注册账号时间',
  `created_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册账号的地点',
  `created_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册账号的IP',
  `last_login_date` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后一次登录IP',
  `last_login_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后一次登录地点',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `balance` decimal(10,0) DEFAULT '0' COMMENT '余额',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`username`,`mobile`,`email`,`r_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'alilinet', 'Aili', 'https://resources.alilinet.com/20170609/caec0ef6f07036203d555810fd81c75a.jpg', 'gOQEd6Q8nKh6J8WnVWbf466wqgXKUh8V', '$2y$13$w5oLa8hCsNC3IXM17ADODOjRoNzyGd0rL5A8icjI9UxgGBlMJ5rWO', null, 'lTn0p3L-HstHiS3EzPHH5kpa7gEUpf1__1537259088', '18888888888', 'alilinet@alilinet.com', '10', '6', '1483534763', '上海市闸北区 电信ADSL', '218.81.204.109', '1537256688', '101.81.232.103', '上海市 电信', '0', '0', '1537256688');

-- ----------------------------
-- Table structure for `t_user_rank`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_rank`;
CREATE TABLE `t_user_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '等级名称',
  `score` int(8) NOT NULL COMMENT '积分界限',
  `discount` decimal(6,2) NOT NULL COMMENT '折扣百分比',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`name`,`discount`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_rank
-- ----------------------------
INSERT INTO `t_user_rank` VALUES ('1', '普通会员', '0', '1.00', '1');
INSERT INTO `t_user_rank` VALUES ('2', '一级会员', '2000', '0.95', '1');
INSERT INTO `t_user_rank` VALUES ('3', '二级会员', '5000', '0.90', '1');
INSERT INTO `t_user_rank` VALUES ('4', 'VIP会员', '10000', '0.85', '1');
INSERT INTO `t_user_rank` VALUES ('5', '钻石会员', '100000', '0.80', '1');
INSERT INTO `t_user_rank` VALUES ('6', '超级会员', '10000000', '0.50', '1');
