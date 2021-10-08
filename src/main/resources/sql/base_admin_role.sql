/*
Navicat MySQL Data Transfer

Source Server         : 192.168.64.130
Source Server Version : 50735
Source Host           : 192.168.64.130:3306
Source Database       : backend_manager

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2021-10-08 15:15:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `base_admin_role`;
CREATE TABLE `base_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `permissions` varchar(20) DEFAULT NULL COMMENT '权限',
  `create_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(64) DEFAULT NULL COMMENT '更新时间',
  `role_status` int(1) NOT NULL DEFAULT '1' COMMENT '1：有效 \r\n            0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户角色表';

-- ----------------------------
-- Records of base_admin_role
-- ----------------------------
INSERT INTO `base_admin_role` VALUES ('1', 'system manager', '系统管理员', '1,9', '2018-11-21 15:54:07', '2018-11-21 15:54:07', '1');
INSERT INTO `base_admin_role` VALUES ('2', 'base manager', '普通管理员', '9', '2018-11-21 15:11:44', '2018-12-03 19:09:57', '1');
