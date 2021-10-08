/*
Navicat MySQL Data Transfer

Source Server         : 192.168.64.130
Source Server Version : 50735
Source Host           : 192.168.64.130:3306
Source Database       : backend_manager

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2021-10-08 15:15:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `base_admin_permission`;
CREATE TABLE `base_admin_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `descpt` varchar(50) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单url',
  `create_time` varchar(64) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(64) DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) DEFAULT NULL COMMENT '删除标志（0:删除 1：存在）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of base_admin_permission
-- ----------------------------
INSERT INTO `base_admin_permission` VALUES ('1', 'systemManage', '0', '系统管理', '', '2018-11-30 10:27:34', '2018-11-30 10:27:34', '1');
INSERT INTO `base_admin_permission` VALUES ('2', 'accountManage', '1', '账号管理', '/user/userManage', '2018-11-30 11:44:41', '2018-11-30 11:56:34', '1');
INSERT INTO `base_admin_permission` VALUES ('3', 'roleManage', '1', '角色管理', '/role/roleManage', '2018-11-30 11:45:27', '2018-11-30 11:45:27', '1');
INSERT INTO `base_admin_permission` VALUES ('7', 'permissionManage', '1', '权限管理', '/permission/permissionManage', '2018-11-30 11:48:35', '2018-11-30 15:13:38', '1');
INSERT INTO `base_admin_permission` VALUES ('9', 'baseManage', '0', '基本设置', '', '2018-11-30 12:10:32', '2018-11-30 12:10:32', '1');
INSERT INTO `base_admin_permission` VALUES ('10', 'testManage', '9', '服务类目管理', '/goodsCategory/goodsCategoryManage', '2018-12-04 11:47:07', '2018-12-04 11:47:07', '1');
