/*
Navicat MySQL Data Transfer

Source Server         : 192.168.44.10
Source Server Version : 50637
Source Host           : 192.168.44.10:3306
Source Database       : db_iutils

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-08-25 01:10:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sys_name` varchar(255) NOT NULL COMMENT '系统名称',
  `module_name` varchar(255) NOT NULL COMMENT '模块名称',
  `config_name` varchar(255) NOT NULL COMMENT '配置key',
  `config_value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公共配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'sys', 'common', 'project.name', 'homework', '1', '2017-05-16 14:33:01', '1', '2017-08-24 21:44:43', '项目名称（注：系统配置，不可删）', '0');
INSERT INTO `sys_config` VALUES ('2', 'sys', 'common', 'project.copyright', 'CopyRight©2016 iutils.cn All Rights Reserved.', '1', '2017-05-16 14:46:29', '1', '2017-05-16 15:10:36', '版本信息（注：系统配置，不可删）', '0');

-- ----------------------------
-- Table structure for sys_msg_receive
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_receive`;
CREATE TABLE `sys_msg_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `msg_id` bigint(20) NOT NULL COMMENT '消息编号',
  `update_by` bigint(20) NOT NULL COMMENT '接收人',
  `update_date` datetime NOT NULL COMMENT '接收时间',
  `status` char(1) DEFAULT NULL COMMENT '状态 0未读 1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息接收表';

-- ----------------------------
-- Records of sys_msg_receive
-- ----------------------------
INSERT INTO `sys_msg_receive` VALUES ('11', '10', '1', '2017-04-12 14:00:23', '1');
INSERT INTO `sys_msg_receive` VALUES ('12', '11', '1', '2017-04-12 16:00:09', '1');
INSERT INTO `sys_msg_receive` VALUES ('13', '12', '1', '2017-04-12 16:02:33', '1');
INSERT INTO `sys_msg_receive` VALUES ('14', '13', '1', '2017-04-12 16:10:27', '1');
INSERT INTO `sys_msg_receive` VALUES ('15', '14', '1', '2017-08-24 22:05:28', '1');

-- ----------------------------
-- Table structure for sys_msg_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_send`;
CREATE TABLE `sys_msg_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(50) NOT NULL COMMENT '消息类型  系统通知  站内信 用户通知',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `level` int(1) DEFAULT NULL COMMENT '级别',
  `users` varchar(255) NOT NULL COMMENT '接收人',
  `create_by` bigint(20) DEFAULT NULL COMMENT '发送人',
  `create_date` datetime DEFAULT NULL COMMENT '发送时间',
  `status` char(1) DEFAULT NULL COMMENT '状态 0草稿 1已发送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息发送表';

-- ----------------------------
-- Records of sys_msg_send
-- ----------------------------
INSERT INTO `sys_msg_send` VALUES ('10', 'mail', '测试邮件', '                                                                                        \r\n                                        <p>测试邮件</p><p><br></p>\r\n                                        ', '0', '1,', '1', '2017-04-12 14:00:14', '0');
INSERT INTO `sys_msg_send` VALUES ('11', 'mail', '你好，我是管理员，现在测试站内信', '                                            \r\n                                        <p>你好，我是管理员，现在测试站内信</p><p><br></p>', '0', '1,', '1', '2017-04-12 16:00:09', '0');
INSERT INTO `sys_msg_send` VALUES ('12', 'notice', '请管理员来开会', '                                            \r\n                                        <p>请管理员来开会</p><p><br></p>', '0', '1,', '1', '2017-04-12 16:02:33', '0');
INSERT INTO `sys_msg_send` VALUES ('13', 'mail', '消息', '                                            \r\n                                        <p>是多少</p>', '0', '1,', '1', '2017-04-12 16:10:27', '0');
INSERT INTO `sys_msg_send` VALUES ('14', 'notice', '测试', '                                            \r\n                                        <p>哈哈哈</p>', '0', '1,', '1', '2017-08-24 22:05:28', '1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '组织机构名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父编号',
  `parent_ids` varchar(5000) DEFAULT NULL COMMENT '父编号列表',
  `available` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(225) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组织机构';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', 'university', '0', '0/', '1', null, null, '1', '2016-09-25 20:56:43', null, '0');
INSERT INTO `sys_organization` VALUES ('2', 'ISET', '1', '0/1/', '1', '1', '2017-02-18 18:12:43', '1', '2017-08-24 21:42:29', null, '0');
INSERT INTO `sys_organization` VALUES ('4', 'CS3', '2', '0/1/2/', '1', '1', '2017-04-10 16:16:51', '1', '2017-08-25 00:29:29', null, '0');
INSERT INTO `sys_organization` VALUES ('5', 'CS2', '2', '0/1/2/', '1', '1', '2017-08-24 22:15:36', null, null, null, '0');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `url` varchar(200) DEFAULT NULL COMMENT '资源路径',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父编号',
  `parent_ids` varchar(5000) DEFAULT NULL COMMENT '父编号列表',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限字符串',
  `available` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(225) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='资源';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '资源', 'menu', '', '', '0', '0/', '', '1', '0', '1', null, null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('2', '系统管理', 'menu', '', '', '1', '0/1/', 'sys:manage', '1', '10', '1', '2016-06-14 09:33:06', '1', '2016-11-18 01:21:14', null, '0');
INSERT INTO `sys_resource` VALUES ('11', '组织机构', 'menu', '', 'organization', '75', '0/1/75/', 'sys:organization', '1', '10', '1', null, '1', '2016-10-21 01:32:05', null, '0');
INSERT INTO `sys_resource` VALUES ('12', '查看', 'form', '', '', '11', '0/1/2/11/', 'sys:organization:view', '1', '1', '1', null, '1', '2017-01-10 14:43:53', null, '0');
INSERT INTO `sys_resource` VALUES ('13', '编辑', 'form', '', '', '11', '0/1/2/11/', 'sys:organization:edit', '1', '2', '1', null, '1', '2017-01-10 14:44:15', null, '0');
INSERT INTO `sys_resource` VALUES ('21', '用户管理', 'menu', '', 'user/list', '2', '0/1/2/', 'sys:user:view', '1', '10', '1', null, '1', '2017-02-18 18:11:51', null, '0');
INSERT INTO `sys_resource` VALUES ('22', '查看', 'form', '', '', '21', '0/1/2/21/', 'sys:user:view', '1', '4', '1', null, '1', '2017-01-10 10:38:16', null, '0');
INSERT INTO `sys_resource` VALUES ('23', '编辑', 'form', '', '', '21', '0/1/2/21/', 'sys:user:update', '1', '3', '1', null, '1', '2017-01-10 11:14:13', null, '0');
INSERT INTO `sys_resource` VALUES ('31', '资源管理', 'menu', '', 'resource', '75', '0/1/75/', 'sys:resource', '1', '20', '1', null, '1', '2016-10-21 01:32:27', null, '0');
INSERT INTO `sys_resource` VALUES ('32', '查看', 'form', '', '', '31', '0/1/2/31/', 'sys:resource:view', '1', '3', '1', null, '1', '2017-01-10 10:49:52', null, '0');
INSERT INTO `sys_resource` VALUES ('33', '编辑', 'form', '', '', '31', '0/1/2/31/', 'sys:resource:edit', '1', '1', '1', null, '1', '2017-01-10 10:49:08', null, '0');
INSERT INTO `sys_resource` VALUES ('41', '角色管理', 'menu', '', 'role', '75', '0/1/75/', 'sys:role:view', '1', '30', '1', null, '1', '2016-10-21 01:32:44', null, '0');
INSERT INTO `sys_resource` VALUES ('42', '查看', 'form', '', '', '41', '0/1/2/41/', 'sys:role:view', '1', '1', '1', null, '1', '2017-01-10 14:42:16', null, '0');
INSERT INTO `sys_resource` VALUES ('43', '编辑', 'form', '', '', '41', '0/1/2/41/', 'sys:role:edit', '1', '2', '1', null, '1', '2017-01-10 14:42:20', null, '0');
INSERT INTO `sys_resource` VALUES ('51', '会话管理', 'menu', '', 'sys/session', '2', '0/1/2/', 'sys:sessions', '1', '60', '1', null, '1', '2017-03-24 15:31:14', null, '0');
INSERT INTO `sys_resource` VALUES ('73', '任务调度', 'menu', '', 'scheduleJob', '2', '0/1/2/', 'sys:scheduleJob:*', '1', '50', '1', '2016-07-15 22:50:56', '1', '2017-01-10 10:40:03', null, '0');
INSERT INTO `sys_resource` VALUES ('74', '系统日志', 'menu', '', 'slog', '2', '0/1/2/', 'sys:slog:view', '1', '70', '1', '2016-10-02 14:02:51', '1', '2016-10-21 01:31:14', null, '0');
INSERT INTO `sys_resource` VALUES ('75', '系统设置', 'menu', '', '', '1', '0/1/', 'sys:setting', '1', '20', '1', '2016-10-09 00:04:34', '1', '2016-11-18 01:18:34', null, '0');
INSERT INTO `sys_resource` VALUES ('76', '查看', 'form', '', '', '74', '0/1/2/74/', 'sys:slog:view', '1', '0', '1', '2016-10-21 00:27:13', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('77', '编辑', 'form', '', '', '74', '0/1/2/74/', 'sys:slog:edit', '1', '0', '1', '2016-10-21 00:27:31', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('97', '新增', 'form', '', '', '21', '0/1/2/21/', 'sys:user:create', '1', '1', '1', '2017-01-10 10:30:07', '1', '2017-01-10 10:37:20', null, '0');
INSERT INTO `sys_resource` VALUES ('98', '删除', 'form', '', '', '21', '0/1/2/21/', 'sys:user:delete', '1', '2', '1', '2017-01-10 10:37:07', '1', '2017-01-10 10:50:33', null, '0');
INSERT INTO `sys_resource` VALUES ('100', '删除', 'form', '', '', '11', '0/1/75/11/', 'sys:organization:delete', '1', '3', '1', '2017-01-10 11:00:30', '1', '2017-01-10 11:00:40', null, '0');
INSERT INTO `sys_resource` VALUES ('101', '公共配置', 'menu', '', 'sys/config', '2', '0/1/2/', 'sys:config:view', '1', '20', '1', '2017-01-14 21:31:11', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('102', '新增', 'form', '', '', '101', '0/1/2/101/', 'sys:config:create', '1', '1', '1', '2017-01-14 21:31:37', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('103', '删除', 'form', '', '', '101', '0/1/2/101/', 'sys:config:delete', '1', '2', '1', '2017-01-14 21:31:55', '1', '2017-01-14 21:32:20', null, '0');
INSERT INTO `sys_resource` VALUES ('104', '修改', 'form', '', '', '101', '0/1/2/101/', 'sys:config:update', '1', '3', '1', '2017-01-14 21:32:12', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('105', '查看', 'form', '', '', '51', '0/1/2/51/', 'sys:session:view', '1', '0', '1', '2017-03-24 15:29:17', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('106', '强制注销', 'form', '', '', '51', '0/1/2/51/', 'sys:session:forceLogout', '1', '0', '1', '2017-03-24 15:30:48', null, null, null, '0');
INSERT INTO `sys_resource` VALUES ('107', '新建邮件和通知', 'form', '', '', '1', '0/1/', 'sys:msgSend:create', '1', '90', '1', '2017-04-11 14:28:28', '1', '2017-04-11 14:30:07', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `role` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `organization_id` bigint(20) NOT NULL COMMENT '归属机构',
  `resource_ids` varchar(5000) DEFAULT NULL COMMENT '资源编号集合',
  `data_scope` varchar(50) NOT NULL COMMENT '数据范围',
  `available` tinyint(1) DEFAULT '0' COMMENT '是否可用',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(225) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'teacher', '超级管理员', '1', '2,11,12,13,21,22,23,31,32,33,41,42,43,51,73,74,75,76,77,97,98,100,101,102,103,104,105,106,107,', 'self', '1', '1', '2016-10-08 12:32:47', '1', '2017-08-24 22:13:57', '至高权限', '0');
INSERT INTO `sys_role` VALUES ('2', 'student', '一般学生', '1', '2,51,105,', 'self', '1', '1', '2017-04-10 16:18:11', '1', '2017-08-24 22:13:44', '', '0');
INSERT INTO `sys_role` VALUES ('3', 'leader', '小组组长', '4', '', 'self', '1', '1', '2017-08-24 22:14:51', null, null, 'Group leader', '0');

-- ----------------------------
-- Table structure for sys_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务分组',
  `cron` varchar(200) DEFAULT NULL COMMENT 'cron表达式',
  `bean_class` varchar(500) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `is_concurrent` char(1) DEFAULT NULL COMMENT '是否有状态',
  `method_name` varchar(200) DEFAULT NULL COMMENT '任务调用的方法名',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` char(1) DEFAULT NULL COMMENT '任务状态 0禁用 1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务调度';

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
INSERT INTO `sys_schedule_job` VALUES ('1', '测试任务', '测试', '0/1 * * * * ?', 'com.david.task.TaskTest', '1', 'run', '1', '2016-07-15 09:44:53', '1', '2016-09-25 13:23:19', '每一秒执行一次', '0');
INSERT INTO `sys_schedule_job` VALUES ('2', '日志记录', '日志', '0/30 * * * * ?', 'com.david.task.TaskLog', '1', 'run', '1', '2016-07-19 13:28:42', '1', '2016-10-08 11:15:24', '30秒清理记录日志', '0');
INSERT INTO `sys_schedule_job` VALUES ('3', '会话管理', '会话', '0 * * * * ?', 'com.david.task.TaskSysSession', '1', 'start', '1', '2017-03-26 14:10:09', '1', '2017-08-24 21:48:30', '可以被覆盖', '1');

-- ----------------------------
-- Table structure for sys_sessions
-- ----------------------------
DROP TABLE IF EXISTS `sys_sessions`;
CREATE TABLE `sys_sessions` (
  `id` varchar(100) NOT NULL,
  `session` varchar(5000) DEFAULT NULL COMMENT 'session对象',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessions_index_id` (`id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session管理';

-- ----------------------------
-- Records of sys_sessions
-- ----------------------------
INSERT INTO `sys_sessions` VALUES ('074715ab-a78b-4457-8380-70efa44bdc2e', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJDA3NDcxNWFiLWE3OGItNDQ1Ny04MzgwLTcwZWZhNDRiZGMyZXNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAV4VM26teHNxAH4AA3cIAAABXhU0CXR4dxMAAAAAABt3QAAJMTI3LjAuMC4xc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAJ0ABFzaGlyb1NhdmVkUmVxdWVzdHNyACZvcmcuYXBhY2hlLnNoaXJvLndlYi51dGlsLlNhdmVkUmVxdWVzdK/OPK15gsq6AgADTAAGbWV0aG9kdAASTGphdmEvbGFuZy9TdHJpbmc7TAALcXVlcnlTdHJpbmdxAH4ACkwACnJlcXVlc3RVUklxAH4ACnhwdAADR0VUcHQAAi9hdAAHcGljY29kZXQABDlGVkN4eA==', '2017-08-25 01:04:06');

-- ----------------------------
-- Table structure for sys_slog
-- ----------------------------
DROP TABLE IF EXISTS `sys_slog`;
CREATE TABLE `sys_slog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `menu` varchar(255) NOT NULL COMMENT '菜单',
  `remote_addr` varchar(50) NOT NULL COMMENT '操作IP',
  `request_uri` varchar(200) NOT NULL COMMENT '请求地址',
  `method` varchar(5) NOT NULL COMMENT '操作方式',
  `params` text COMMENT '提交的数据',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `exception` text COMMENT '异常信息',
  `create_by` bigint(20) DEFAULT NULL COMMENT '记录人',
  `create_date` datetime NOT NULL COMMENT '记录时间',
  `time_consuming` varchar(50) NOT NULL COMMENT '耗时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Records of sys_slog
-- ----------------------------
INSERT INTO `sys_slog` VALUES ('1', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-19 17:17:48', '1.10');
INSERT INTO `sys_slog` VALUES ('2', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=ey9l', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-19 17:17:57', '33');
INSERT INTO `sys_slog` VALUES ('3', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:18:07', '1.459');
INSERT INTO `sys_slog` VALUES ('4', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:18:08', '1.22');
INSERT INTO `sys_slog` VALUES ('5', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:18:08', '512');
INSERT INTO `sys_slog` VALUES ('6', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:18:08', '504');
INSERT INTO `sys_slog` VALUES ('7', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:23', '761');
INSERT INTO `sys_slog` VALUES ('8', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:28', '492');
INSERT INTO `sys_slog` VALUES ('9', '', '127.0.0.1', '/a/scheduleJob', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:31', '534');
INSERT INTO `sys_slog` VALUES ('10', '', '127.0.0.1', '/a/sys/session', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:32', '487');
INSERT INTO `sys_slog` VALUES ('11', '', '127.0.0.1', '/a/slog', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:34', '517');
INSERT INTO `sys_slog` VALUES ('12', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-19 17:19:37', '680');
INSERT INTO `sys_slog` VALUES ('13', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-19 17:19:49', '24');
INSERT INTO `sys_slog` VALUES ('14', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 17:49:49', '2.600');
INSERT INTO `sys_slog` VALUES ('15', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=adsasd', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 17:50:34', '30');
INSERT INTO `sys_slog` VALUES ('16', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:50:41', '975');
INSERT INTO `sys_slog` VALUES ('17', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:50:42', '623');
INSERT INTO `sys_slog` VALUES ('18', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:50:42', '159');
INSERT INTO `sys_slog` VALUES ('19', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:50:42', '804');
INSERT INTO `sys_slog` VALUES ('20', '', '127.0.0.1', '/a/user/userInfo', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:50:48', '397');
INSERT INTO `sys_slog` VALUES ('21', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:51:14', '639');
INSERT INTO `sys_slog` VALUES ('22', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:51:17', '69');
INSERT INTO `sys_slog` VALUES ('23', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:51:18', '63');
INSERT INTO `sys_slog` VALUES ('24', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:51:59', '406');
INSERT INTO `sys_slog` VALUES ('25', '', '127.0.0.1', '/a/resource', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:52:02', '457');
INSERT INTO `sys_slog` VALUES ('26', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:52:10', '414');
INSERT INTO `sys_slog` VALUES ('27', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:52:26', '481');
INSERT INTO `sys_slog` VALUES ('28', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:52:28', '35');
INSERT INTO `sys_slog` VALUES ('29', '', '127.0.0.1', '/a/sys/config/update', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:52:46', '431');
INSERT INTO `sys_slog` VALUES ('30', '', '127.0.0.1', '/a/sys/config/update', 'POST', 'id=1&sysName=sys&moduleName=common&configName=project.name&configValue=项目名称&remarks=项目名称（注：系统配置，不可删）', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:02', '104');
INSERT INTO `sys_slog` VALUES ('31', '', '127.0.0.1', '/a/sys/config/update', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:03', '52');
INSERT INTO `sys_slog` VALUES ('32', '', '127.0.0.1', '/a/sys/config', 'POST', 'pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:03', '55');
INSERT INTO `sys_slog` VALUES ('33', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:06', '75');
INSERT INTO `sys_slog` VALUES ('34', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:06', '30');
INSERT INTO `sys_slog` VALUES ('35', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:06', '43');
INSERT INTO `sys_slog` VALUES ('36', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:06', '43');
INSERT INTO `sys_slog` VALUES ('37', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:06', '71');
INSERT INTO `sys_slog` VALUES ('38', '', '127.0.0.1', '/a/scheduleJob', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:14', '486');
INSERT INTO `sys_slog` VALUES ('39', '', '127.0.0.1', '/a/sys/session', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:16', '409');
INSERT INTO `sys_slog` VALUES ('40', '', '127.0.0.1', '/a/slog', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 17:53:18', '528');
INSERT INTO `sys_slog` VALUES ('41', '', '127.0.0.1', '/a/user/userInfo', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:05:15', '25');
INSERT INTO `sys_slog` VALUES ('42', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:06:06', '86');
INSERT INTO `sys_slog` VALUES ('43', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:06:06', '25');
INSERT INTO `sys_slog` VALUES ('44', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:06:07', '37');
INSERT INTO `sys_slog` VALUES ('45', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:06:07', '60');
INSERT INTO `sys_slog` VALUES ('46', '', '127.0.0.1', '/a/user/userInfo', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:06:07', '34');
INSERT INTO `sys_slog` VALUES ('47', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:12:32', '76');
INSERT INTO `sys_slog` VALUES ('48', '', '127.0.0.1', '/a/login;JSESSIONID=79aa4478-c010-44cc-a479-7615adde669b', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 18:53:02', '19');
INSERT INTO `sys_slog` VALUES ('49', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 18:53:02', '29');
INSERT INTO `sys_slog` VALUES ('50', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:10', '70');
INSERT INTO `sys_slog` VALUES ('51', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:10', '84');
INSERT INTO `sys_slog` VALUES ('52', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:10', '44');
INSERT INTO `sys_slog` VALUES ('53', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:10', '54');
INSERT INTO `sys_slog` VALUES ('54', '', '127.0.0.1', '/a/sys/session', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:14', '43');
INSERT INTO `sys_slog` VALUES ('55', '', '127.0.0.1', '/a/sys/session/79aa4478-c010-44cc-a479-7615adde669b/forceLogout', 'GET', 'pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-20 18:53:30', '30');
INSERT INTO `sys_slog` VALUES ('56', '', '127.0.0.1', '/a/login', 'GET', 'forceLogout=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 18:53:30', '35');
INSERT INTO `sys_slog` VALUES ('57', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-20 18:53:30', '17');
INSERT INTO `sys_slog` VALUES ('58', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 21:50:44', '1.19');
INSERT INTO `sys_slog` VALUES ('59', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=18Nm', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 21:50:54', '26');
INSERT INTO `sys_slog` VALUES ('60', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=58KJ', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 21:51:02', '31');
INSERT INTO `sys_slog` VALUES ('61', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:51:10', '936');
INSERT INTO `sys_slog` VALUES ('62', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:51:12', '1.274');
INSERT INTO `sys_slog` VALUES ('63', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:51:12', '539');
INSERT INTO `sys_slog` VALUES ('64', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:51:12', '549');
INSERT INTO `sys_slog` VALUES ('65', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:52:22', '802');
INSERT INTO `sys_slog` VALUES ('66', '', '127.0.0.1', '/a/user/create', 'GET', 'organizationId=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 21:55:41', '674');
INSERT INTO `sys_slog` VALUES ('67', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:37:23', '1.752');
INSERT INTO `sys_slog` VALUES ('68', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:37:25', '570');
INSERT INTO `sys_slog` VALUES ('69', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:37:25', '503');
INSERT INTO `sys_slog` VALUES ('70', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:37:25', '1.656');
INSERT INTO `sys_slog` VALUES ('71', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:26', '699');
INSERT INTO `sys_slog` VALUES ('72', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:27', '432');
INSERT INTO `sys_slog` VALUES ('73', '', '127.0.0.1', '/a/scheduleJob', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:29', '591');
INSERT INTO `sys_slog` VALUES ('74', '', '127.0.0.1', '/a/sys/session', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:30', '625');
INSERT INTO `sys_slog` VALUES ('75', '', '127.0.0.1', '/a/sys/session', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:31', '174');
INSERT INTO `sys_slog` VALUES ('76', '', '127.0.0.1', '/a/slog', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:32', '594');
INSERT INTO `sys_slog` VALUES ('77', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:38:35', '476');
INSERT INTO `sys_slog` VALUES ('78', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:56:18', '1.724');
INSERT INTO `sys_slog` VALUES ('79', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:56:19', '626');
INSERT INTO `sys_slog` VALUES ('80', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:56:20', '661');
INSERT INTO `sys_slog` VALUES ('81', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 22:56:20', '676');
INSERT INTO `sys_slog` VALUES ('82', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:13:07', '1.675');
INSERT INTO `sys_slog` VALUES ('83', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:13:09', '1.134');
INSERT INTO `sys_slog` VALUES ('84', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:13:09', '425');
INSERT INTO `sys_slog` VALUES ('85', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:13:09', '524');
INSERT INTO `sys_slog` VALUES ('86', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:27:37', '1.562');
INSERT INTO `sys_slog` VALUES ('87', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:27:37', '756');
INSERT INTO `sys_slog` VALUES ('88', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:27:38', '601');
INSERT INTO `sys_slog` VALUES ('89', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:27:38', '406');
INSERT INTO `sys_slog` VALUES ('90', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:33:20', '710');
INSERT INTO `sys_slog` VALUES ('91', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:40:16', '736');
INSERT INTO `sys_slog` VALUES ('92', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:40:36', '903');
INSERT INTO `sys_slog` VALUES ('93', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:40:37', '988');
INSERT INTO `sys_slog` VALUES ('94', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:40:37', '329');
INSERT INTO `sys_slog` VALUES ('95', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:40:37', '814');
INSERT INTO `sys_slog` VALUES ('96', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:45:33', '1.570');
INSERT INTO `sys_slog` VALUES ('97', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:45:34', '758');
INSERT INTO `sys_slog` VALUES ('98', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:45:34', '590');
INSERT INTO `sys_slog` VALUES ('99', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:45:34', '650');
INSERT INTO `sys_slog` VALUES ('100', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:02', '107');
INSERT INTO `sys_slog` VALUES ('101', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:02', '34');
INSERT INTO `sys_slog` VALUES ('102', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:02', '44');
INSERT INTO `sys_slog` VALUES ('103', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:02', '64');
INSERT INTO `sys_slog` VALUES ('104', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:14', '67');
INSERT INTO `sys_slog` VALUES ('105', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:15', '26');
INSERT INTO `sys_slog` VALUES ('106', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:15', '45');
INSERT INTO `sys_slog` VALUES ('107', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:46:15', '51');
INSERT INTO `sys_slog` VALUES ('108', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:47:54', '666');
INSERT INTO `sys_slog` VALUES ('109', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:48:22', '930');
INSERT INTO `sys_slog` VALUES ('110', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:48:23', '1.72');
INSERT INTO `sys_slog` VALUES ('111', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:48:24', '749');
INSERT INTO `sys_slog` VALUES ('112', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-23 23:48:24', '519');
INSERT INTO `sys_slog` VALUES ('113', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:48:40', '27');
INSERT INTO `sys_slog` VALUES ('114', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=1111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:48:49', '26');
INSERT INTO `sys_slog` VALUES ('115', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=asaa', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:49:12', '19');
INSERT INTO `sys_slog` VALUES ('116', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:49:24', '35');
INSERT INTO `sys_slog` VALUES ('117', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-23 23:50:05', '24');
INSERT INTO `sys_slog` VALUES ('118', '', '127.0.0.1', '/a/login', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-24 21:38:52', '913');
INSERT INTO `sys_slog` VALUES ('119', '', '127.0.0.1', '/a/login', 'POST', 'username=super&password=&jcaptchaCode=1Q11', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, null, '2017-08-24 21:39:27', '32');
INSERT INTO `sys_slog` VALUES ('120', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:39:37', '968');
INSERT INTO `sys_slog` VALUES ('121', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:39:38', '607');
INSERT INTO `sys_slog` VALUES ('122', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:39:39', '588');
INSERT INTO `sys_slog` VALUES ('123', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:39:39', '516');
INSERT INTO `sys_slog` VALUES ('124', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:39:41', '784');
INSERT INTO `sys_slog` VALUES ('125', '', '127.0.0.1', '/a/user/list', 'GET', 'organizationId=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:16', '84');
INSERT INTO `sys_slog` VALUES ('126', '', '127.0.0.1', '/a/sys/config', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:20', '411');
INSERT INTO `sys_slog` VALUES ('127', '', '127.0.0.1', '/a/user/list', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:22', '70');
INSERT INTO `sys_slog` VALUES ('128', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:31', '496');
INSERT INTO `sys_slog` VALUES ('129', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:44', '402');
INSERT INTO `sys_slog` VALUES ('130', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:46', '57');
INSERT INTO `sys_slog` VALUES ('131', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:40:53', '529');
INSERT INTO `sys_slog` VALUES ('132', '', '127.0.0.1', '/a/organization/update', 'POST', 'id=2&parentId=1&parentIds=0/1/&name=**大学&available=true', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:13', '125');
INSERT INTO `sys_slog` VALUES ('133', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:13', '80');
INSERT INTO `sys_slog` VALUES ('134', '', '127.0.0.1', '/a/organization', 'POST', 'id=1&pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:14', '120');
INSERT INTO `sys_slog` VALUES ('135', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:16', '43');
INSERT INTO `sys_slog` VALUES ('136', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:19', '105');
INSERT INTO `sys_slog` VALUES ('137', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:23', '46');
INSERT INTO `sys_slog` VALUES ('138', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:26', '53');
INSERT INTO `sys_slog` VALUES ('139', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:27', '43');
INSERT INTO `sys_slog` VALUES ('140', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:30', '53');
INSERT INTO `sys_slog` VALUES ('141', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:32', '53');
INSERT INTO `sys_slog` VALUES ('142', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:34', '43');
INSERT INTO `sys_slog` VALUES ('143', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:36', '61');
INSERT INTO `sys_slog` VALUES ('144', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:38', '47');
INSERT INTO `sys_slog` VALUES ('145', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:40', '68');
INSERT INTO `sys_slog` VALUES ('146', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:42', '43');
INSERT INTO `sys_slog` VALUES ('147', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:47', '50');
INSERT INTO `sys_slog` VALUES ('148', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:48', '44');
INSERT INTO `sys_slog` VALUES ('149', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:41:52', '67');
INSERT INTO `sys_slog` VALUES ('150', '', '127.0.0.1', '/a/organization/update', 'POST', 'id=4&parentId=2&parentIds=0/1/2/&name=**班级&available=true', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:00', '57');
INSERT INTO `sys_slog` VALUES ('151', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:00', '57');
INSERT INTO `sys_slog` VALUES ('152', '', '127.0.0.1', '/a/organization', 'POST', 'id=2&pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:00', '95');
INSERT INTO `sys_slog` VALUES ('153', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:06', '72');
INSERT INTO `sys_slog` VALUES ('154', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:07', '46');
INSERT INTO `sys_slog` VALUES ('155', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:13', '53');
INSERT INTO `sys_slog` VALUES ('156', '', '127.0.0.1', '/a/organization/update', 'POST', 'id=2&parentId=1&parentIds=0/1/&name=信息科学与工程技术学院&available=true', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:29', '26');
INSERT INTO `sys_slog` VALUES ('157', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:29', '60');
INSERT INTO `sys_slog` VALUES ('158', '', '127.0.0.1', '/a/organization', 'POST', 'id=1&pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:29', '99');
INSERT INTO `sys_slog` VALUES ('159', '', '127.0.0.1', '/a/organization', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:31', '44');
INSERT INTO `sys_slog` VALUES ('160', '', '127.0.0.1', '/a/organization', 'GET', 'id=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:33', '37');
INSERT INTO `sys_slog` VALUES ('161', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:36', '90');
INSERT INTO `sys_slog` VALUES ('162', '', '127.0.0.1', '/a/organization/update', 'POST', 'id=4&parentId=2&parentIds=0/1/2/&name=计算机科学与技术1班&available=true', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:45', '44');
INSERT INTO `sys_slog` VALUES ('163', '', '127.0.0.1', '/a/organization/update', 'GET', 'id=4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:45', '49');
INSERT INTO `sys_slog` VALUES ('164', '', '127.0.0.1', '/a/organization', 'POST', 'id=2&pageNo=0&pageSize=10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:45', '89');
INSERT INTO `sys_slog` VALUES ('165', '', '127.0.0.1', '/a', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:57', '67');
INSERT INTO `sys_slog` VALUES ('166', '', '127.0.0.1', '/a/welcome', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:57', '26');
INSERT INTO `sys_slog` VALUES ('167', '', '127.0.0.1', '/a/sys/msg/getMailPage', 'GET', 'msgSend.type=mail&status=0&pageSize=2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:57', '33');
INSERT INTO `sys_slog` VALUES ('168', '', '127.0.0.1', '/a/sys/msg/getNoticePage', 'GET', 'msgSend.type=notice&status=0&pageSize=3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:57', '35');
INSERT INTO `sys_slog` VALUES ('169', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:42:57', '51');
INSERT INTO `sys_slog` VALUES ('170', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:05', '74');
INSERT INTO `sys_slog` VALUES ('171', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:08', '38');
INSERT INTO `sys_slog` VALUES ('172', '', '127.0.0.1', '/a/organization', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:10', '42');
INSERT INTO `sys_slog` VALUES ('173', '', '127.0.0.1', '/a/resource', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:13', '418');
INSERT INTO `sys_slog` VALUES ('174', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:16', '47');
INSERT INTO `sys_slog` VALUES ('175', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:19', '34');
INSERT INTO `sys_slog` VALUES ('176', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:20', '37');
INSERT INTO `sys_slog` VALUES ('177', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:20', '57');
INSERT INTO `sys_slog` VALUES ('178', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:21', '38');
INSERT INTO `sys_slog` VALUES ('179', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:21', '41');
INSERT INTO `sys_slog` VALUES ('180', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:21', '45');
INSERT INTO `sys_slog` VALUES ('181', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:21', '34');
INSERT INTO `sys_slog` VALUES ('182', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:21', '39');
INSERT INTO `sys_slog` VALUES ('183', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:22', '93');
INSERT INTO `sys_slog` VALUES ('184', '', '127.0.0.1', '/a/role/update', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:28', '641');
INSERT INTO `sys_slog` VALUES ('185', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:35', '40');
INSERT INTO `sys_slog` VALUES ('186', '', '127.0.0.1', '/a/role/update', 'GET', 'id=1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:38', '167');
INSERT INTO `sys_slog` VALUES ('187', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:43:41', '36');
INSERT INTO `sys_slog` VALUES ('188', '', '127.0.0.1', '/a/resource', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:44:02', '80');
INSERT INTO `sys_slog` VALUES ('189', '', '127.0.0.1', '/a/organization', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:44:03', '39');
INSERT INTO `sys_slog` VALUES ('190', '', '127.0.0.1', '/a/role', 'GET', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', null, '1', '2017-08-24 21:44:04', '44');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `no` varchar(100) DEFAULT NULL COMMENT '用户编号',
  `organization_id` bigint(20) NOT NULL COMMENT '机构编号',
  `username` varchar(100) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL COMMENT '权限编号集合',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话号码',
  `mobile` varchar(45) DEFAULT NULL COMMENT '手机号码',
  `photo` varchar(1000) DEFAULT NULL COMMENT '头像',
  `login_ip` varchar(45) DEFAULT NULL COMMENT '登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '登录时间',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  `is_dept` tinyint(1) DEFAULT NULL COMMENT '是否部门管理员',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(225) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  KEY `idx_sys_user_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, '1', 'super', 'ff7e419b2147a346fcf97e8a0d439143', '7b5f5d3a1d3ba80fed0ad6256eb0fc3c', '1,', 'SuperManage', '553656977@qq.com', '', '11111', '', null, null, '0', '0', '1', '2016-10-15 17:13:38', '1', '2017-08-24 22:29:38', '', '0');
