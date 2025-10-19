/*
 Navicat Premium Dump SQL

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : www.silence-ci.com:3306
 Source Schema         : silence-platform

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 20/10/2025 00:47:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_component
-- ----------------------------
DROP TABLE IF EXISTS `config_component`;
CREATE TABLE `config_component`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subsystem_id` bigint NOT NULL COMMENT '子系统ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统编码',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '组件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_component
-- ----------------------------
INSERT INTO `config_component` VALUES (1, 1, '老默 内容子系统 service服务', 'SILENCE-CONTENT-SERVICE@SILENCE-CONTENT', b'1', 'SERVICE 服务', '老默', '2024-04-21 00:00:15', 'SYSTEM', '2025-04-13 11:00:25');
INSERT INTO `config_component` VALUES (2, 1, '老默 内容子系统 console服务', 'SILENCE-CONTENT-CONSOLE@SILENCE-CONTENT', b'1', 'CONSOLE 服务', '老默', '2024-04-21 00:01:01', 'SYSTEM', '2025-04-13 11:00:34');
INSERT INTO `config_component` VALUES (3, 1, '内容子系统 bp服务', 'SILENCE-CONTENT-BP@SILENCE-CONTENT', b'1', 'BP服务', '老默', '2025-03-30 13:39:44', 'SYSTEM', '2025-04-13 11:00:41');
INSERT INTO `config_component` VALUES (4, 2, 'Mcore子系统 service服务', 'SILENCE-MCORE-SERVICE@SILENCE-MCORE', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` VALUES (5, 2, 'Mcore子系统 console服务', 'SILENCE-MCORE-CONSOLE@SILENCE-MCORE', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` VALUES (6, 2, 'Mcore子系统 bp服务', 'SILENCE-MCORE-BP@SILENCE-MCORE', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` VALUES (7, 3, 'CCC子系统 service服务', 'SILENCE-CCC-SERVICE@SILENCE-CCC', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` VALUES (8, 3, 'CCC子系统 console服务', 'SILENCE-CCC-CONSOLE@SILENCE-CCC', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` VALUES (9, 3, 'CCC子系统 bp服务', 'SILENCE-CCC-BP@SILENCE-CCC', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` VALUES (10, 4, 'DDD子系统 service服务', 'SILENCE-DDD-SERVICE@SILENCE-DDD', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` VALUES (11, 4, 'DDD子系统 console服务', 'SILENCE-DDD-CONSOLE@SILENCE-DDD', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` VALUES (12, 4, 'DDD子系统 bp服务', 'SILENCE-DDD-BP@SILENCE-DDD', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` VALUES (13, 1, '内容子系统DB服务', 'SILENCE-CONTENT-DB@SILENCE-CONTENT', b'1', 'DB 服务', 'SYSTEM', '2025-04-13 11:01:57', NULL, '2025-04-13 11:01:57');

-- ----------------------------
-- Table structure for config_environment
-- ----------------------------
DROP TABLE IF EXISTS `config_environment`;
CREATE TABLE `config_environment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_component_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '环境名称',
  `env_type` tinyint UNSIGNED NOT NULL COMMENT '环境类型',
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '显示名称',
  `is_display` bit(1) NOT NULL COMMENT '是否显示',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '环境表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_environment
-- ----------------------------
INSERT INTO `config_environment` VALUES (1, 1, 'CI-1', 1, '开发1环境', b'1', '老默', '2024-04-21 00:04:22', '老默', '2024-04-21 00:04:25');
INSERT INTO `config_environment` VALUES (2, 2, 'STG-1', 2, '测试1环境', b'1', '老默', '2024-04-21 00:05:04', '老默', '2024-04-21 00:05:06');
INSERT INTO `config_environment` VALUES (3, 3, 'PRD-1', 3, '生产1环境', b'1', '老默', '2024-04-21 00:05:33', '老默', '2024-04-21 00:05:36');
INSERT INTO `config_environment` VALUES (4, 4, 'CI-1', 1, '开发1环境', b'1', '老默', '2025-03-30 13:46:07', '老默', '2025-03-30 13:46:10');
INSERT INTO `config_environment` VALUES (5, 1, 'CI-2', 1, '开发2环境', b'1', 'SYSTEM', '2025-04-13 12:07:30', '老默', '2025-04-13 12:07:30');
INSERT INTO `config_environment` VALUES (10, 1, 'STG-1', 2, '测试1环境', b'1', 'SYSTEM', '2025-04-13 13:01:47', 'SYSTEM', '2025-04-13 13:01:47');
INSERT INTO `config_environment` VALUES (12, 1, 'STG-5', 2, '测试5环境', b'1', 'SYSTEM', '2025-04-13 13:10:01', 'SYSTEM', '2025-04-13 13:10:01');
INSERT INTO `config_environment` VALUES (13, 1, 'PRD-1', 3, '生产1环境', b'1', 'SYSTEM', '2025-04-13 13:45:02', 'SYSTEM', '2025-04-13 13:45:02');
INSERT INTO `config_environment` VALUES (14, 1, 'PRD-2', 3, '生产2环境', b'1', 'SYSTEM', '2025-04-13 13:47:52', 'SYSTEM', '2025-04-13 13:47:52');

-- ----------------------------
-- Table structure for config_item
-- ----------------------------
DROP TABLE IF EXISTS `config_item`;
CREATE TABLE `config_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_environment_id` bigint NOT NULL COMMENT '环境ID',
  `namespace_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '命名空间名称',
  `namespace_status` tinyint UNSIGNED NOT NULL COMMENT '命名空间状态',
  `format_type` tinyint NOT NULL COMMENT '配置项格式类型',
  `type` tinyint UNSIGNED NOT NULL COMMENT '配置项类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ip 列表',
  `old_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老的值',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '配置内容',
  `md5` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '配置项对应的md5值',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_item
-- ----------------------------
INSERT INTO `config_item` VALUES (1, 1, 'application.yml', 1, 1, 1, '10.28.50.31', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/silence-content?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8\r\n    username: root\r\n    password: 123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      maximum-pool-size: 100\r\n  elasticsearch:\r\n    uris: http://14.103.187.231:9200', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/silence-content?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8\r\n    username: root\r\n    password: 123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      maximum-pool-size: 100\r\n  elasticsearch:\r\n    uris: http://127.0.0.1:9200', 'fb1828764f8854763cad0c9bd3fcfb04', '老默', '2024-04-21 00:06:45', '老默', '2024-04-21 00:06:47');
INSERT INTO `config_item` VALUES (2, 1, 'esg.properties', 2, 2, 2, '10.28.50.31', 'server.port=808011', 'server.port=8080111', 'd44be187e572c129d1c91a86fe2fb278', '老默', '2025-03-30 15:17:10', '老默', '2025-03-30 15:17:19');
INSERT INTO `config_item` VALUES (3, 2, 'application.yml', 1, 2, 2, NULL, 'server:\n    port: 8082\n    servlet:\n        context-path: /\n\n', 'server:\n    port: 8082\n    servlet:\n        context-path: /\n\n', 'ca4d8a63ad1114dcae586794be27a167', NULL, NULL, NULL, NULL);
INSERT INTO `config_item` VALUES (4, 3, 'application.yml', 1, 2, 2, NULL, 'server:\n    port: 38080\n    servlet:\n        context-path: /', 'server:\n    port: 38080\n    servlet:\n        context-path: /', '5266df774c5a083669090058e23ed536', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for config_item_history
-- ----------------------------
DROP TABLE IF EXISTS `config_item_history`;
CREATE TABLE `config_item_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_item_id` bigint NOT NULL COMMENT '子系统ID',
  `old_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '旧值',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '修改后的值',
  `operation_type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '操作类型',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_item_history
-- ----------------------------
INSERT INTO `config_item_history` VALUES (1, 1, 'nacos.test: 111', 'nacos.test: 111', 1, '贺显', '2025-03-30 16:34:23', '贺显', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (2, 1, 'nacos.test: 111', 'nacos.test: 222', 2, '贺显', '2025-03-30 16:34:23', '王波', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (3, 1, 'nacos.test: 222', 'nacos.test: 333', 2, '贺显', '2025-03-30 16:34:23', '徐洋洋', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (4, 1, 'nacos.test: 333', 'nacos.test: 444', 2, '贺显', '2025-03-30 16:34:23', '严晓仪', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (5, 1, 'nacos.test: 444', 'nacos.test: 555', 2, '贺显', '2025-03-30 16:34:23', '李羿楠', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (6, 2, 'server.port=808011', 'server.port=8080111', 1, '张默默', '2025-10-20 00:36:25', '张默默', '2025-10-20 00:36:30');

-- ----------------------------
-- Table structure for config_item_release_history
-- ----------------------------
DROP TABLE IF EXISTS `config_item_release_history`;
CREATE TABLE `config_item_release_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_item_id` bigint NOT NULL COMMENT '子系统ID',
  `release_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '发布名称',
  `old_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '旧值',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '修改后的值',
  `release_type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '发布类型',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_item_release_history
-- ----------------------------
INSERT INTO `config_item_release_history` VALUES (6, 1, '20250330173122-release', 'nacos.test: 111', 'nacos:test:222', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` VALUES (7, 1, '20250319173122-release', 'nacos.test: 222', 'nacos:test:333', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` VALUES (8, 1, '20250321173122-release', 'nacos.test: 333', 'nacos:test:444', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` VALUES (9, 1, '20250322173122-release', 'nacos.test: 444', 'nacos:test:555', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');

-- ----------------------------
-- Table structure for config_subsystem
-- ----------------------------
DROP TABLE IF EXISTS `config_subsystem`;
CREATE TABLE `config_subsystem`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统编码',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '子系统表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_subsystem
-- ----------------------------
INSERT INTO `config_subsystem` VALUES (1, '内容子系统', 'SILENCE-CONTENT', '内容子系统', '老默', '2024-04-20 23:58:34', 'SYSTEM', '2025-04-13 11:04:49');
INSERT INTO `config_subsystem` VALUES (2, 'MCORE系统', 'SILENCE-MCORE', 'MCORE子系统', '老默', '2025-03-30 13:32:34', 'SYSTEM', '2025-04-13 11:04:56');
INSERT INTO `config_subsystem` VALUES (3, 'CCC系统', 'SILENCE-CCC', 'CCC子系统', '老默', '2025-03-30 13:33:05', 'SYSTEM', '2025-04-13 11:05:04');
INSERT INTO `config_subsystem` VALUES (4, 'DDD系统', 'SILENCE-DDD', 'DDD子系统', '老默', '2025-03-30 13:33:56', 'SYSTEM', '2025-04-13 11:05:10');
INSERT INTO `config_subsystem` VALUES (5, 'EEE系统', 'SILENCE-EEE', 'EEE子系统', '老默', '2025-03-30 13:34:15', 'SYSTEM', '2025-04-13 11:05:18');
INSERT INTO `config_subsystem` VALUES (6, '营销子系统', 'SILENCE-MARKETING', '营销子系统', 'SYSTEM', '2025-04-13 11:02:50', NULL, '2025-04-13 11:02:50');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_id` bigint UNSIGNED NULL DEFAULT NULL,
  `sender_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '收到了14分新周报', '描述信息', 1, 'VB', 1, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:21:58');
INSERT INTO `notice` VALUES (2, '回复了你', '描述信息', 1, '朱偏右', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` VALUES (3, '评论了你', '描述信息', 1, '曲丽丽', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` VALUES (4, '待办提醒', '描述信息', 1, '待办提醒', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` VALUES (5, 'aa', 'bb', 1, '大萨达撒', 0, '2025-05-11 15:04:15', 'SYSTEM', 'SYSTEM', '2025-10-13 23:48:19');

-- ----------------------------
-- Table structure for sj_distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `sj_distributed_lock`;
CREATE TABLE `sj_distributed_lock`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '锁名称',
  `lock_until` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '锁定时长',
  `locked_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '锁定时间',
  `locked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '锁定者',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_sj_distributed_lock_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '锁定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_distributed_lock
-- ----------------------------
INSERT INTO `sj_distributed_lock` VALUES (2671, 'registerNode', '2025-10-20 00:47:04.796', '2025-10-20 00:46:59.796', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2672, 'clearLog', '2025-10-19 23:18:51.762', '2025-10-19 23:17:51.762', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2673, 'clearOfflineNode', '2025-10-20 00:47:04.796', '2025-10-20 00:46:59.796', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2674, 'retryErrorMoreThreshold', '2025-10-20 00:38:52.721', '2025-10-20 00:37:52.721', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2675, 'retryLogMerge', '2025-10-20 00:18:51.773', '2025-10-20 00:17:51.773', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2676, 'retrySummaryDashboard', '2025-10-20 00:47:11.772', '2025-10-20 00:46:51.772', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2677, 'retryTaskMoreThreshold', '2025-10-20 00:38:52.729', '2025-10-20 00:37:52.729', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2678, 'jobClearLog', '2025-10-19 23:18:52.135', '2025-10-19 23:17:52.135', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2679, 'jobLogMerge', '2025-10-20 00:47:51.772', '2025-10-20 00:46:51.772', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2680, 'jobSummaryDashboard', '2025-10-20 00:47:11.772', '2025-10-20 00:46:51.772', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');
INSERT INTO `sj_distributed_lock` VALUES (2681, 'workflowJobSummarySchedule', '2025-10-20 00:47:11.772', '2025-10-20 00:46:51.772', '1979929971357294592', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:52');

-- ----------------------------
-- Table structure for sj_group_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_group_config`;
CREATE TABLE `sj_group_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组描述',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT' COMMENT 'token',
  `group_status` tinyint NOT NULL DEFAULT 0 COMMENT '组状态 0、未启用 1、启用',
  `version` int NOT NULL COMMENT '版本号',
  `group_partition` int NOT NULL COMMENT '分区',
  `id_generator_mode` tinyint NOT NULL DEFAULT 1 COMMENT '唯一id生成模式 默认号段模式',
  `init_scene` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否初始化场景 0:否 1:是',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '组配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_group_config
-- ----------------------------
INSERT INTO `sj_group_config` VALUES (1, 'namespaceId', 'das', '测试分组，客户端需要保持组名/Token 一致', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 1, 2, b'1', 'SYSTEM', '2025-06-07 13:31:28', 'SYSTEM', '2025-06-07 13:31:38');
INSERT INTO `sj_group_config` VALUES (2, 'namespaceId', 'ddd', 'dadad', 'SJ_8hvZV6z6cmJGK5cxEiK1yG8Id1WltjaM', 1, 1, 1, 1, b'1', '', '2025-10-09 20:12:05', '', '2025-10-09 20:12:05');

-- ----------------------------
-- Table structure for sj_job
-- ----------------------------
DROP TABLE IF EXISTS `sj_job`;
CREATE TABLE `sj_job`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `job_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '任务状态 0、关闭、1、开启',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、集群 2、广播 3、切片',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `executor_type` tinyint NOT NULL DEFAULT 1 COMMENT '执行器类型',
  `executor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '执行器名称',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '间隔时长',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行 4、恢复',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `max_retry_times` int NOT NULL DEFAULT 0 COMMENT '最大重试次数',
  `parallel_num` int NOT NULL DEFAULT 1 COMMENT '并行数',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '重试间隔(s)',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `resident` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否是常驻任务',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `owner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_job_status_bucket_index`(`job_status` ASC, `bucket_index` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job
-- ----------------------------
INSERT INTO `sj_job` VALUES (1, 'namespaceId', 'das', '第一个任务', NULL, 1, 1759047840000, b'1', 1, 4, 1, 'testJob', 3, '0 0/2 * * * ? ', 1, 0, 0, 1, 0, 0, b'0', '', 1, '王波', '1我去问的五千多', '五千多我去', 0, 'SYSTEM', '2025-06-07 13:58:47', 'SYSTEM', '2025-06-07 13:58:47');
INSERT INTO `sj_job` VALUES (2, 'namespaceId', '1', '第二个任务', '', 1, 1749641303680, b'1', 1, 1, 1, 'sssHandler', 2, '60', 1, 60, 3, 1, 1, 63, b'0', '', 1, '王波', '1111', '', 0, '', '2025-06-11 19:27:23', '', '2025-06-11 19:27:23');
INSERT INTO `sj_job` VALUES (3, 'namespaceId', '1', '第三个任务', 'ccc', 1, 1749641736870, b'1', 1, 1, 1, 'http', 2, '60', 1, 60, 3, 1, 1, 110, b'0', '', 1, '王波', 'asdsadsa', '', 0, '', '2025-06-11 19:34:36', '', '2025-06-11 19:34:36');
INSERT INTO `sj_job` VALUES (4, 'namespaceId', '1', '第四个任务', '{\\\"method\\\":\\\"POST\\\",\\\"url\\\":\\\"/aaaa\\\",\\\"headers\\\":{},\\\"body\\\":\\\"\\\",\\\"mediaType\\\":\\\"application/json\\\",\\\"timeout\\\":60}', 2, 1749642698913, b'1', 1, 1, 1, 'http', 2, '60', 1, 60, 3, 1, 1, 20, b'0', '', 1, '王波', '', '', 0, '', '2025-06-11 19:47:19', '', '2025-06-11 19:47:19');
INSERT INTO `sj_job` VALUES (5, 'namespaceId', 'das', '第一个任务_副本', NULL, 1, 1760014920000, b'1', 1, 4, 1, 'testJob', 3, '0 0/2 * * * ? ', 1, 0, 0, 1, 0, 82, b'0', '', 1, NULL, '1我去问的五千多', '', 0, '', '2025-10-09 21:00:55', '', '2025-10-09 21:00:55');

-- ----------------------------
-- Table structure for sj_job_executor
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_executor`;
CREATE TABLE `sj_job_executor`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `executor_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务执行器名称',
  `executor_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1:java 2:python 3:go',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_create_dt`(`created_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务执行器信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_executor
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_log_message`;
CREATE TABLE `sj_job_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '任务批次id',
  `task_id` bigint NOT NULL COMMENT '调度任务id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_id`(`task_batch_id` ASC, `task_id` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_summary`;
CREATE TABLE `sj_job_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `business_id` bigint NOT NULL COMMENT '业务id (job_id或workflow_id)',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `success_num` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `fail_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `stop_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `stop_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `cancel_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `cancel_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trigger_at_system_task_type_business_id`(`trigger_at` ASC, `system_task_type` ASC, `business_id` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name_business_id`(`namespace_id` ASC, `group_name` ASC, `business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'DashBoard_Job' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_summary
-- ----------------------------
INSERT INTO `sj_job_summary` VALUES (1, '764d604ec6fc45f68cd92514c40e9e1a', 'daas', 1, 3, '2025-06-13 00:00:00', 0, 0, '[]', 0, '[]', 0, '[]', '', '2025-06-13 19:54:10', '', '2025-06-13 19:54:10');
INSERT INTO `sj_job_summary` VALUES (2, 'namespaceId', 'das', 1, 3, '2025-09-26 00:00:00', 0, 0, '[]', 0, '[]', 3, '[{\"reason\":2,\"total\":3}]', '', '2025-09-26 19:09:36', '', '2025-09-26 19:09:36');
INSERT INTO `sj_job_summary` VALUES (3, 'namespaceId', 'das', 1, 3, '2025-09-28 00:00:00', 0, 0, '[]', 0, '[]', 4, '[{\"reason\":2,\"total\":4}]', '', '2025-09-28 16:23:54', '', '2025-09-28 16:23:54');
INSERT INTO `sj_job_summary` VALUES (4, 'namespaceId', 'das', 1, 3, '2025-09-30 00:00:00', 0, 22, '[{\"reason\":0,\"total\":22}]', 10, '[{\"reason\":1,\"total\":10}]', 1, '[{\"reason\":2,\"total\":1}]', '', '2025-09-30 15:12:10', '', '2025-09-30 15:12:10');
INSERT INTO `sj_job_summary` VALUES (5, 'namespaceId', 'das', 1, 3, '2025-10-09 00:00:00', 1, 10, '[{\"reason\":0,\"total\":10}]', 6, '[{\"reason\":1,\"total\":6}]', 0, '[]', '', '2025-10-09 15:14:14', '', '2025-10-09 15:14:14');
INSERT INTO `sj_job_summary` VALUES (6, 'namespaceId', 'das', 1, 3, '2025-10-10 00:00:00', 1, 0, '[]', 0, '[]', 0, '[]', '', '2025-10-10 00:18:33', '', '2025-10-10 00:18:33');

-- ----------------------------
-- Table structure for sj_job_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task`;
CREATE TABLE `sj_job_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '调度任务id',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父执行器id',
  `task_status` tinyint NOT NULL DEFAULT 0 COMMENT '执行的状态 0、失败 1、成功',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `mr_stage` tinyint NULL DEFAULT NULL COMMENT '动态分片所处阶段 1:map 2:reduce 3:mergeReduce',
  `leaf` bit(1) NOT NULL DEFAULT b'1' COMMENT '叶子节点',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '工作流全局上下文',
  `result_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行结果',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_status`(`task_batch_id` ASC, `task_status` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task
-- ----------------------------
INSERT INTO `sj_job_task` VALUES (50, 'namespaceId', 'das', 1, 59, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:24:04', '', '2025-10-09 15:24:04');
INSERT INTO `sj_job_task` VALUES (51, 'namespaceId', 'das', 1, 60, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:40:07', '', '2025-10-09 15:40:07');
INSERT INTO `sj_job_task` VALUES (52, 'namespaceId', 'das', 1, 61, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:43:11', '', '2025-10-09 15:43:11');
INSERT INTO `sj_job_task` VALUES (53, 'namespaceId', 'das', 1, 62, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:47:05', '', '2025-10-09 15:47:05');
INSERT INTO `sj_job_task` VALUES (54, 'namespaceId', 'das', 1, 63, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:47:34', '', '2025-10-09 15:47:34');
INSERT INTO `sj_job_task` VALUES (55, 'namespaceId', 'das', 1, 64, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:58:55', '', '2025-10-09 15:58:55');
INSERT INTO `sj_job_task` VALUES (56, 'namespaceId', 'das', 1, 65, 0, 5, 0, NULL, b'1', 'CLUSTER_TASK', '1976222517855428608@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 17:45:56', '', '2025-10-09 17:45:56');
INSERT INTO `sj_job_task` VALUES (57, 'namespaceId', 'das', 1, 66, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976224420777562112@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 17:53:23', '', '2025-10-09 17:53:23');
INSERT INTO `sj_job_task` VALUES (58, 'namespaceId', 'das', 1, 67, 0, 3, 0, NULL, b'1', 'CLUSTER_TASK', '1976224420777562112@127.0.0.1:17889', NULL, '测试成功', '{}', 2, '', '', '2025-10-09 18:13:56', '', '2025-10-09 18:13:56');

-- ----------------------------
-- Table structure for sj_job_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task_batch`;
CREATE TABLE `sj_job_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流节点id',
  `parent_workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务父批次id',
  `workflow_task_batch_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务批次id',
  `task_batch_status` tinyint NOT NULL DEFAULT 1 COMMENT '任务批次状态',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '父节点',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`job_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_workflow_task_batch_id_workflow_node_id`(`workflow_task_batch_id` ASC, `workflow_node_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task_batch
-- ----------------------------
INSERT INTO `sj_job_task_batch` VALUES (41, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226147495, 3, '', '', 1, '', '2025-09-30 17:55:47', '', '2025-09-30 17:55:48');
INSERT INTO `sj_job_task_batch` VALUES (42, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226169279, 3, '', '', 1, '', '2025-09-30 17:56:09', '', '2025-09-30 17:56:09');
INSERT INTO `sj_job_task_batch` VALUES (43, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226249976, 3, '', '', 1, '', '2025-09-30 17:57:30', '', '2025-09-30 17:57:30');
INSERT INTO `sj_job_task_batch` VALUES (44, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226363242, 3, '', '', 1, '', '2025-09-30 17:59:23', '', '2025-09-30 17:59:24');
INSERT INTO `sj_job_task_batch` VALUES (45, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226455525, 3, '', '', 1, '', '2025-09-30 18:00:55', '', '2025-09-30 18:00:56');
INSERT INTO `sj_job_task_batch` VALUES (46, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226496626, 3, '', '', 1, '', '2025-09-30 18:01:37', '', '2025-09-30 18:01:55');
INSERT INTO `sj_job_task_batch` VALUES (47, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226582029, 3, '', '', 1, '', '2025-09-30 18:03:02', '', '2025-09-30 18:03:02');
INSERT INTO `sj_job_task_batch` VALUES (48, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759226635327, 3, '', '', 1, '', '2025-09-30 18:03:55', '', '2025-09-30 18:03:55');
INSERT INTO `sj_job_task_batch` VALUES (49, 'namespaceId', 'das', 1, 0, 0, 0, 5, 1, 1759226653027, 3, '', '', 1, '', '2025-09-30 18:04:13', '', '2025-09-30 18:04:14');
INSERT INTO `sj_job_task_batch` VALUES (50, 'namespaceId', 'das', 1, 0, 0, 0, 2, 0, 1759992427598, 3, '', '', 1, '', '2025-10-09 14:47:07', '', '2025-10-09 14:47:07');
INSERT INTO `sj_job_task_batch` VALUES (51, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994089596, 3, '', '', 1, '', '2025-10-09 15:14:49', '', '2025-10-09 15:14:50');
INSERT INTO `sj_job_task_batch` VALUES (52, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994134792, 3, '', '', 1, '', '2025-10-09 15:15:35', '', '2025-10-09 15:15:35');
INSERT INTO `sj_job_task_batch` VALUES (53, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994160997, 3, '', '', 1, '', '2025-10-09 15:16:01', '', '2025-10-09 15:16:01');
INSERT INTO `sj_job_task_batch` VALUES (54, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994245991, 3, '', '', 1, '', '2025-10-09 15:17:26', '', '2025-10-09 15:17:26');
INSERT INTO `sj_job_task_batch` VALUES (55, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994302001, 3, '', '', 1, '', '2025-10-09 15:18:22', '', '2025-10-09 15:18:22');
INSERT INTO `sj_job_task_batch` VALUES (56, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994341091, 3, '', '', 1, '', '2025-10-09 15:19:01', '', '2025-10-09 15:19:24');
INSERT INTO `sj_job_task_batch` VALUES (57, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994399093, 3, '', '', 1, '', '2025-10-09 15:19:59', '', '2025-10-10 12:14:05');
INSERT INTO `sj_job_task_batch` VALUES (58, 'namespaceId', 'das', 1, 0, 0, 0, 5, 1, 1759994547590, 3, '', '', 1, '', '2025-10-09 15:22:28', '', '2025-10-09 15:22:28');
INSERT INTO `sj_job_task_batch` VALUES (68, 'namespaceId', 'das', 1, 0, 0, 0, 3, 0, 1760026667841, 3, '', '', 1, '', '2025-10-10 00:17:48', '', '2025-10-10 00:17:48');

-- ----------------------------
-- Table structure for sj_namespace
-- ----------------------------
DROP TABLE IF EXISTS `sj_namespace`;
CREATE TABLE `sj_namespace`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '唯一id',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_id`(`unique_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_namespace
-- ----------------------------
INSERT INTO `sj_namespace` VALUES (1, 'Default', 'namespaceId', '2', 0, '', '2025-04-16 17:02:13', 'SYSTEM', '2025-05-10 23:38:53');
INSERT INTO `sj_namespace` VALUES (2, 'UAT', '96677cc7151f4738961e7cfaf7968209', '1', 0, 'SYSTEM', '2025-05-10 23:29:50', 'SYSTEM', '2025-05-10 23:35:02');
INSERT INTO `sj_namespace` VALUES (3, 'PRD', 'ca87790c0dfb43b79481795e3bbad2a0', '222', 0, '', '2025-10-09 20:21:29', '', '2025-10-09 20:21:29');

-- ----------------------------
-- Table structure for sj_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_config`;
CREATE TABLE `sj_notify_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `notify_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知名称',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 1. 重试任务 2. 重试回调 3、JOB任务 4、WORKFLOW任务',
  `notify_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '通知状态 0、未启用 1、启用',
  `recipient_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接收人id列表',
  `notify_threshold` int NOT NULL DEFAULT 0 COMMENT '通知阈值',
  `notify_scene` tinyint NOT NULL DEFAULT 0 COMMENT '通知场景',
  `rate_limiter_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '限流状态 0、未启用 1、启用',
  `rate_limiter_threshold` int NOT NULL DEFAULT 0 COMMENT '每秒限流阈值',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_config
-- ----------------------------
INSERT INTO `sj_notify_config` VALUES (1, 'namespaceId', 'das', '啊啦啦啦啦', 1, b'1', '[1]', 16, 1, b'1', 100, '大神多', '', '2025-10-12 01:03:11', '', '2025-10-12 01:03:11');

-- ----------------------------
-- Table structure for sj_notify_recipient
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_recipient`;
CREATE TABLE `sj_notify_recipient`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接收人名称',
  `notify_type` tinyint NOT NULL DEFAULT 0 COMMENT '通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书 5 webhook',
  `notify_attribute` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置属性',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id`(`namespace_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '告警通知接收人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_recipient
-- ----------------------------
INSERT INTO `sj_notify_recipient` VALUES (1, 'namespaceId', '谭萌翔', 1, 'namespaceId', '111', 'SYSTEM', '2025-10-10 16:54:09', 'SYSTEM', '2025-10-10 16:54:09');
INSERT INTO `sj_notify_recipient` VALUES (2, 'namespaceId', '张孟伟', 1, 'namespaceId', '111', 'SYSTEM', '2025-10-10 16:54:09', 'SYSTEM', '2025-10-10 16:54:09');
INSERT INTO `sj_notify_recipient` VALUES (3, 'namespaceId', '张默默', 1, '{\"webhookUrl\":\"www.baidu.com\",\"ats\":[\"moryzang\"]}', 'sdadsad', 'SYSTEM', '2025-10-10 18:34:23', 'SYSTEM', '2025-10-10 18:34:23');
INSERT INTO `sj_notify_recipient` VALUES (4, 'namespaceId', '贺显', 2, '{\"tos\":[\"15762181328@qq.com\"]}', 'qq邮箱', '', '2025-10-10 18:39:54', '', '2025-10-10 18:39:54');
INSERT INTO `sj_notify_recipient` VALUES (5, 'namespaceId', '毕玉生', 3, '{\"webhookUrl\":\"https://api.3dept.com/?msg_signature=ASDFQWEXZCVAQFASDFASDFSS&timestamp=13500001234&nonce=123412323&echostr=ENCRYPT_STR\",\"ats\":[\"毕玉生\"]}', '11', '', '2025-10-10 18:41:13', '', '2025-10-10 18:41:13');
INSERT INTO `sj_notify_recipient` VALUES (6, 'namespaceId', '点到的', 4, '{\"webhookUrl\":\"https://api.3dept.com/?msg_signature=ASDFQWEXZCVAQFASDFASDFSS&timestamp=13500001234&nonce=123412323&echostr=ENCRYPT_STR\",\"ats\":[\"嗒嗒嗒\"]}', '222', '', '2025-10-10 18:49:15', '', '2025-10-10 18:49:15');
INSERT INTO `sj_notify_recipient` VALUES (7, 'namespaceId', '都是啊', 5, '{\"webhookUrl\":\"https://api.3dept.com/?msg_signature=ASDFQWEXZCVAQFASDFASDFSS&timestamp=13500001234&nonce=123412323&echostr=ENCRYPT_STR\",\"contentType\":1,\"secret\":\"asasa\"}', '我去额', '', '2025-10-10 19:05:06', '', '2025-10-10 19:05:06');

-- ----------------------------
-- Table structure for sj_retry
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry`;
CREATE TABLE `sj_retry`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '扩展字段',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_status` tinyint NOT NULL DEFAULT 0 COMMENT '重试状态 0、重试中 1、成功 2、最大重试次数',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父节点id',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name_task_type_idempotent_id_is_deleted`(`namespace_id` ASC, `group_name` ASC, `task_type` ASC, `idempotent_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name_retry_status`(`namespace_id` ASC, `group_name` ASC, `retry_status` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '重试信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry
-- ----------------------------
INSERT INTO `sj_retry` VALUES (1, 'namespaceId', 'das', 'sss666', '1111', 'dasdsadas', 'testJob', '{\"aaa\":\"1\"}', '', 1760892441910, 0, 0, 1, 45, 0, b'0', '', '2025-10-12 17:35:53', '', '2025-10-12 17:35:53');
INSERT INTO `sj_retry` VALUES (3, 'namespaceId', 'das', 'sss666', 'dasdsada', 'dasdasd', 'dassdsa', '{}', '{}', 1760892441910, 0, 0, 1, 126, 0, b'0', '', '2025-10-12 19:06:15', '', '2025-10-12 19:06:15');

-- ----------------------------
-- Table structure for sj_retry_dead_letter
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_dead_letter`;
CREATE TABLE `sj_retry_dead_letter`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '死信队列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_dead_letter
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_scene_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_scene_config`;
CREATE TABLE `sj_retry_scene_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '组状态 0、未启用 1、启用',
  `max_retry_count` int NOT NULL DEFAULT 5 COMMENT '最大重试次数',
  `back_off` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '间隔时长',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `deadline_request` bigint UNSIGNED NOT NULL DEFAULT 60000 COMMENT 'Deadline Request 调用链超时 单位毫秒',
  `executor_timeout` int UNSIGNED NOT NULL DEFAULT 5 COMMENT '任务执行超时时间，单位秒',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `cb_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '回调状态 0、不开启 1、开启',
  `cb_trigger_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `cb_max_count` int NOT NULL DEFAULT 16 COMMENT '回调的最大执行次数',
  `cb_trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '回调的最大执行次数',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '场景配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_scene_config
-- ----------------------------
INSERT INTO `sj_retry_scene_config` VALUES (1, 'namespaceId', 'sss666', 'das', b'1', 1, 2, '60', '[1]', 60000, 60, 3, 1, b'0', 4, 16, '10', '凄凄切切', '', '2025-10-12 12:04:22', '', '2025-10-12 12:04:22');
INSERT INTO `sj_retry_scene_config` VALUES (2, 'namespaceId', 'sss777', 'das', b'1', 1, 2, '60', '[1]', 60000, 60, 3, 1, b'0', 4, 16, '10', '大晚上大晚上的', '', '2025-10-12 15:21:09', '', '2025-10-12 15:21:09');
INSERT INTO `sj_retry_scene_config` VALUES (3, 'namespaceId', 'sss888', 'das', b'0', 1, 2, '60', '[1]', 60000, 60, 3, 1, b'0', 4, 0, '10', '企鹅企鹅企鹅', '', '2025-10-12 15:24:38', '', '2025-10-12 15:24:38');

-- ----------------------------
-- Table structure for sj_retry_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_summary`;
CREATE TABLE `sj_retry_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `scene_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '场景名称',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `running_num` int NOT NULL DEFAULT 0 COMMENT '重试中-日志数量',
  `finish_num` int NOT NULL DEFAULT 0 COMMENT '重试完成-日志数量',
  `max_count_num` int NOT NULL DEFAULT 0 COMMENT '重试到达最大次数-日志数量',
  `suspend_num` int NOT NULL DEFAULT 0 COMMENT '暂停重试-日志数量',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scene_name_trigger_at`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC, `trigger_at` ASC) USING BTREE,
  INDEX `idx_trigger_at`(`trigger_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'DashBoard_Retry' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_summary
-- ----------------------------
INSERT INTO `sj_retry_summary` VALUES (1, 'namespaceId', 'das', 'sss666', '2025-10-12 00:00:00', 2, 0, 0, 0, '', '2025-10-12 17:36:48', '', '2025-10-12 17:36:48');

-- ----------------------------
-- Table structure for sj_retry_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task`;
CREATE TABLE `sj_retry_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '扩展字段',
  `task_status` tinyint NOT NULL DEFAULT 1 COMMENT '重试状态',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `task_status`(`task_status` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_retry_id`(`retry_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2831 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '重试任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task
-- ----------------------------
INSERT INTO `sj_retry_task` VALUES (60, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:37:06', '', '2025-10-12 18:37:06');
INSERT INTO `sj_retry_task` VALUES (61, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:38:06', '', '2025-10-12 18:38:06');
INSERT INTO `sj_retry_task` VALUES (62, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:39:06', '', '2025-10-12 18:39:06');
INSERT INTO `sj_retry_task` VALUES (63, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:40:06', '', '2025-10-12 18:40:06');
INSERT INTO `sj_retry_task` VALUES (64, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:41:06', '', '2025-10-12 18:41:06');
INSERT INTO `sj_retry_task` VALUES (65, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:42:18', '', '2025-10-12 18:42:18');
INSERT INTO `sj_retry_task` VALUES (66, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:43:18', '', '2025-10-12 18:43:18');
INSERT INTO `sj_retry_task` VALUES (67, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:44:41', '', '2025-10-12 18:44:41');
INSERT INTO `sj_retry_task` VALUES (68, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:45:34', '', '2025-10-12 18:45:34');
INSERT INTO `sj_retry_task` VALUES (69, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:46:34', '', '2025-10-12 18:46:34');
INSERT INTO `sj_retry_task` VALUES (70, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:47:41', '', '2025-10-12 18:47:41');
INSERT INTO `sj_retry_task` VALUES (71, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:49:41', '', '2025-10-12 18:49:41');
INSERT INTO `sj_retry_task` VALUES (72, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:50:48', '', '2025-10-12 18:50:48');
INSERT INTO `sj_retry_task` VALUES (73, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:51:38', '', '2025-10-12 18:51:38');
INSERT INTO `sj_retry_task` VALUES (74, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:52:38', '', '2025-10-12 18:52:38');
INSERT INTO `sj_retry_task` VALUES (75, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:53:38', '', '2025-10-12 18:53:38');
INSERT INTO `sj_retry_task` VALUES (76, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:54:38', '', '2025-10-12 18:54:38');
INSERT INTO `sj_retry_task` VALUES (77, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:55:38', '', '2025-10-12 18:55:38');
INSERT INTO `sj_retry_task` VALUES (78, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:56:38', '', '2025-10-12 18:56:38');
INSERT INTO `sj_retry_task` VALUES (79, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:57:38', '', '2025-10-12 18:57:38');
INSERT INTO `sj_retry_task` VALUES (80, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:58:38', '', '2025-10-12 18:58:38');
INSERT INTO `sj_retry_task` VALUES (81, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 18:59:38', '', '2025-10-12 18:59:38');
INSERT INTO `sj_retry_task` VALUES (82, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:00:38', '', '2025-10-12 19:00:38');
INSERT INTO `sj_retry_task` VALUES (83, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:01:38', '', '2025-10-12 19:01:38');
INSERT INTO `sj_retry_task` VALUES (84, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:04:13', '', '2025-10-12 19:04:13');
INSERT INTO `sj_retry_task` VALUES (85, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:04:13', '', '2025-10-12 19:04:13');
INSERT INTO `sj_retry_task` VALUES (86, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:04:13', '', '2025-10-12 19:04:13');
INSERT INTO `sj_retry_task` VALUES (87, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:06:57', '', '2025-10-12 19:06:57');
INSERT INTO `sj_retry_task` VALUES (88, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:07:07', '', '2025-10-12 19:07:07');
INSERT INTO `sj_retry_task` VALUES (89, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:07:57', '', '2025-10-12 19:07:57');
INSERT INTO `sj_retry_task` VALUES (90, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:08:07', '', '2025-10-12 19:08:07');
INSERT INTO `sj_retry_task` VALUES (91, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:08:57', '', '2025-10-12 19:08:57');
INSERT INTO `sj_retry_task` VALUES (92, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:09:07', '', '2025-10-12 19:09:07');
INSERT INTO `sj_retry_task` VALUES (93, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:09:57', '', '2025-10-12 19:09:57');
INSERT INTO `sj_retry_task` VALUES (94, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:10:07', '', '2025-10-12 19:10:07');
INSERT INTO `sj_retry_task` VALUES (95, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:10:57', '', '2025-10-12 19:10:57');
INSERT INTO `sj_retry_task` VALUES (96, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:11:07', '', '2025-10-12 19:11:07');
INSERT INTO `sj_retry_task` VALUES (97, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:11:57', '', '2025-10-12 19:11:57');
INSERT INTO `sj_retry_task` VALUES (98, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:12:07', '', '2025-10-12 19:12:07');
INSERT INTO `sj_retry_task` VALUES (99, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:12:57', '', '2025-10-12 19:12:57');
INSERT INTO `sj_retry_task` VALUES (100, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:13:07', '', '2025-10-12 19:13:07');
INSERT INTO `sj_retry_task` VALUES (101, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:13:57', '', '2025-10-12 19:13:57');
INSERT INTO `sj_retry_task` VALUES (102, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:14:07', '', '2025-10-12 19:14:07');
INSERT INTO `sj_retry_task` VALUES (103, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:14:57', '', '2025-10-12 19:14:57');
INSERT INTO `sj_retry_task` VALUES (104, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:15:07', '', '2025-10-12 19:15:07');
INSERT INTO `sj_retry_task` VALUES (105, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:15:57', '', '2025-10-12 19:15:57');
INSERT INTO `sj_retry_task` VALUES (106, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:16:07', '', '2025-10-12 19:16:07');
INSERT INTO `sj_retry_task` VALUES (107, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:16:57', '', '2025-10-12 19:16:57');
INSERT INTO `sj_retry_task` VALUES (108, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:17:07', '', '2025-10-12 19:17:07');
INSERT INTO `sj_retry_task` VALUES (109, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:17:57', '', '2025-10-12 19:17:57');
INSERT INTO `sj_retry_task` VALUES (110, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:18:07', '', '2025-10-12 19:18:07');
INSERT INTO `sj_retry_task` VALUES (111, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:18:57', '', '2025-10-12 19:18:57');
INSERT INTO `sj_retry_task` VALUES (112, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:19:07', '', '2025-10-12 19:19:07');
INSERT INTO `sj_retry_task` VALUES (113, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:19:57', '', '2025-10-12 19:19:57');
INSERT INTO `sj_retry_task` VALUES (114, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:20:07', '', '2025-10-12 19:20:07');
INSERT INTO `sj_retry_task` VALUES (115, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:20:57', '', '2025-10-12 19:20:57');
INSERT INTO `sj_retry_task` VALUES (116, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:21:07', '', '2025-10-12 19:21:07');
INSERT INTO `sj_retry_task` VALUES (117, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:21:57', '', '2025-10-12 19:21:57');
INSERT INTO `sj_retry_task` VALUES (118, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:22:07', '', '2025-10-12 19:22:07');
INSERT INTO `sj_retry_task` VALUES (119, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:22:57', '', '2025-10-12 19:22:57');
INSERT INTO `sj_retry_task` VALUES (120, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:23:07', '', '2025-10-12 19:23:07');
INSERT INTO `sj_retry_task` VALUES (121, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:23:57', '', '2025-10-12 19:23:57');
INSERT INTO `sj_retry_task` VALUES (122, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:24:07', '', '2025-10-12 19:24:07');
INSERT INTO `sj_retry_task` VALUES (123, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:24:57', '', '2025-10-12 19:24:57');
INSERT INTO `sj_retry_task` VALUES (124, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:25:07', '', '2025-10-12 19:25:07');
INSERT INTO `sj_retry_task` VALUES (125, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:25:57', '', '2025-10-12 19:25:57');
INSERT INTO `sj_retry_task` VALUES (126, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:26:07', '', '2025-10-12 19:26:07');
INSERT INTO `sj_retry_task` VALUES (127, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:26:57', '', '2025-10-12 19:26:57');
INSERT INTO `sj_retry_task` VALUES (128, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:27:07', '', '2025-10-12 19:27:07');
INSERT INTO `sj_retry_task` VALUES (129, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:27:57', '', '2025-10-12 19:27:57');
INSERT INTO `sj_retry_task` VALUES (130, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:28:07', '', '2025-10-12 19:28:07');
INSERT INTO `sj_retry_task` VALUES (131, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:28:57', '', '2025-10-12 19:28:57');
INSERT INTO `sj_retry_task` VALUES (132, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:29:07', '', '2025-10-12 19:29:07');
INSERT INTO `sj_retry_task` VALUES (133, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:29:57', '', '2025-10-12 19:29:57');
INSERT INTO `sj_retry_task` VALUES (134, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:30:07', '', '2025-10-12 19:30:07');
INSERT INTO `sj_retry_task` VALUES (135, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:30:57', '', '2025-10-12 19:30:57');
INSERT INTO `sj_retry_task` VALUES (136, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:31:07', '', '2025-10-12 19:31:07');
INSERT INTO `sj_retry_task` VALUES (137, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:31:57', '', '2025-10-12 19:31:57');
INSERT INTO `sj_retry_task` VALUES (138, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:32:07', '', '2025-10-12 19:32:07');
INSERT INTO `sj_retry_task` VALUES (139, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:32:57', '', '2025-10-12 19:32:57');
INSERT INTO `sj_retry_task` VALUES (140, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:33:07', '', '2025-10-12 19:33:07');
INSERT INTO `sj_retry_task` VALUES (141, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:33:57', '', '2025-10-12 19:33:57');
INSERT INTO `sj_retry_task` VALUES (142, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:34:07', '', '2025-10-12 19:34:07');
INSERT INTO `sj_retry_task` VALUES (143, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:34:57', '', '2025-10-12 19:34:57');
INSERT INTO `sj_retry_task` VALUES (144, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:35:07', '', '2025-10-12 19:35:07');
INSERT INTO `sj_retry_task` VALUES (145, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:35:57', '', '2025-10-12 19:35:57');
INSERT INTO `sj_retry_task` VALUES (146, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:36:07', '', '2025-10-12 19:36:07');
INSERT INTO `sj_retry_task` VALUES (147, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:36:57', '', '2025-10-12 19:36:57');
INSERT INTO `sj_retry_task` VALUES (148, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:37:07', '', '2025-10-12 19:37:07');
INSERT INTO `sj_retry_task` VALUES (149, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:37:57', '', '2025-10-12 19:37:57');
INSERT INTO `sj_retry_task` VALUES (150, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:38:07', '', '2025-10-12 19:38:07');
INSERT INTO `sj_retry_task` VALUES (151, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:38:57', '', '2025-10-12 19:38:57');
INSERT INTO `sj_retry_task` VALUES (152, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:39:07', '', '2025-10-12 19:39:07');
INSERT INTO `sj_retry_task` VALUES (153, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:39:57', '', '2025-10-12 19:39:57');
INSERT INTO `sj_retry_task` VALUES (154, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:40:07', '', '2025-10-12 19:40:07');
INSERT INTO `sj_retry_task` VALUES (155, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:40:57', '', '2025-10-12 19:40:57');
INSERT INTO `sj_retry_task` VALUES (156, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:41:07', '', '2025-10-12 19:41:07');
INSERT INTO `sj_retry_task` VALUES (157, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:41:57', '', '2025-10-12 19:41:57');
INSERT INTO `sj_retry_task` VALUES (158, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:42:07', '', '2025-10-12 19:42:07');
INSERT INTO `sj_retry_task` VALUES (159, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:42:57', '', '2025-10-12 19:42:57');
INSERT INTO `sj_retry_task` VALUES (160, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:43:07', '', '2025-10-12 19:43:07');
INSERT INTO `sj_retry_task` VALUES (161, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:43:57', '', '2025-10-12 19:43:57');
INSERT INTO `sj_retry_task` VALUES (162, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:44:07', '', '2025-10-12 19:44:07');
INSERT INTO `sj_retry_task` VALUES (163, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:44:57', '', '2025-10-12 19:44:57');
INSERT INTO `sj_retry_task` VALUES (164, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:45:07', '', '2025-10-12 19:45:07');
INSERT INTO `sj_retry_task` VALUES (165, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:45:57', '', '2025-10-12 19:45:57');
INSERT INTO `sj_retry_task` VALUES (166, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:46:07', '', '2025-10-12 19:46:07');
INSERT INTO `sj_retry_task` VALUES (167, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:46:57', '', '2025-10-12 19:46:57');
INSERT INTO `sj_retry_task` VALUES (168, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:47:07', '', '2025-10-12 19:47:07');
INSERT INTO `sj_retry_task` VALUES (169, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:47:57', '', '2025-10-12 19:47:57');
INSERT INTO `sj_retry_task` VALUES (170, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:48:07', '', '2025-10-12 19:48:07');
INSERT INTO `sj_retry_task` VALUES (171, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:48:57', '', '2025-10-12 19:48:57');
INSERT INTO `sj_retry_task` VALUES (172, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:49:07', '', '2025-10-12 19:49:07');
INSERT INTO `sj_retry_task` VALUES (173, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:49:57', '', '2025-10-12 19:49:57');
INSERT INTO `sj_retry_task` VALUES (174, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:50:07', '', '2025-10-12 19:50:07');
INSERT INTO `sj_retry_task` VALUES (175, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:50:57', '', '2025-10-12 19:50:57');
INSERT INTO `sj_retry_task` VALUES (176, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:51:07', '', '2025-10-12 19:51:07');
INSERT INTO `sj_retry_task` VALUES (177, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:51:57', '', '2025-10-12 19:51:57');
INSERT INTO `sj_retry_task` VALUES (178, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:52:07', '', '2025-10-12 19:52:07');
INSERT INTO `sj_retry_task` VALUES (179, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:52:57', '', '2025-10-12 19:52:57');
INSERT INTO `sj_retry_task` VALUES (180, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:53:07', '', '2025-10-12 19:53:07');
INSERT INTO `sj_retry_task` VALUES (181, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:53:57', '', '2025-10-12 19:53:57');
INSERT INTO `sj_retry_task` VALUES (182, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:54:07', '', '2025-10-12 19:54:07');
INSERT INTO `sj_retry_task` VALUES (183, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:54:57', '', '2025-10-12 19:54:57');
INSERT INTO `sj_retry_task` VALUES (184, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:55:07', '', '2025-10-12 19:55:07');
INSERT INTO `sj_retry_task` VALUES (185, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:55:57', '', '2025-10-12 19:55:57');
INSERT INTO `sj_retry_task` VALUES (186, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:56:07', '', '2025-10-12 19:56:07');
INSERT INTO `sj_retry_task` VALUES (187, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:56:57', '', '2025-10-12 19:56:57');
INSERT INTO `sj_retry_task` VALUES (188, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:57:07', '', '2025-10-12 19:57:07');
INSERT INTO `sj_retry_task` VALUES (189, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:57:57', '', '2025-10-12 19:57:57');
INSERT INTO `sj_retry_task` VALUES (190, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:58:07', '', '2025-10-12 19:58:07');
INSERT INTO `sj_retry_task` VALUES (191, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:58:57', '', '2025-10-12 19:58:57');
INSERT INTO `sj_retry_task` VALUES (192, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 19:59:07', '', '2025-10-12 19:59:07');
INSERT INTO `sj_retry_task` VALUES (193, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 19:59:57', '', '2025-10-12 19:59:57');
INSERT INTO `sj_retry_task` VALUES (194, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:00:07', '', '2025-10-12 20:00:07');
INSERT INTO `sj_retry_task` VALUES (195, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:00:57', '', '2025-10-12 20:00:57');
INSERT INTO `sj_retry_task` VALUES (196, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:01:07', '', '2025-10-12 20:01:07');
INSERT INTO `sj_retry_task` VALUES (197, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:01:57', '', '2025-10-12 20:01:57');
INSERT INTO `sj_retry_task` VALUES (198, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:02:07', '', '2025-10-12 20:02:07');
INSERT INTO `sj_retry_task` VALUES (199, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:02:57', '', '2025-10-12 20:02:57');
INSERT INTO `sj_retry_task` VALUES (200, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:03:07', '', '2025-10-12 20:03:07');
INSERT INTO `sj_retry_task` VALUES (201, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:03:57', '', '2025-10-12 20:03:57');
INSERT INTO `sj_retry_task` VALUES (202, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:04:07', '', '2025-10-12 20:04:07');
INSERT INTO `sj_retry_task` VALUES (203, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:04:57', '', '2025-10-12 20:04:57');
INSERT INTO `sj_retry_task` VALUES (204, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:05:07', '', '2025-10-12 20:05:07');
INSERT INTO `sj_retry_task` VALUES (205, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:05:57', '', '2025-10-12 20:05:57');
INSERT INTO `sj_retry_task` VALUES (206, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:06:07', '', '2025-10-12 20:06:07');
INSERT INTO `sj_retry_task` VALUES (207, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:06:57', '', '2025-10-12 20:06:57');
INSERT INTO `sj_retry_task` VALUES (208, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:07:07', '', '2025-10-12 20:07:07');
INSERT INTO `sj_retry_task` VALUES (209, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:07:57', '', '2025-10-12 20:07:57');
INSERT INTO `sj_retry_task` VALUES (210, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:08:07', '', '2025-10-12 20:08:07');
INSERT INTO `sj_retry_task` VALUES (211, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:08:57', '', '2025-10-12 20:08:57');
INSERT INTO `sj_retry_task` VALUES (212, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:09:07', '', '2025-10-12 20:09:07');
INSERT INTO `sj_retry_task` VALUES (213, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:09:57', '', '2025-10-12 20:09:57');
INSERT INTO `sj_retry_task` VALUES (214, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:10:07', '', '2025-10-12 20:10:07');
INSERT INTO `sj_retry_task` VALUES (215, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:10:57', '', '2025-10-12 20:10:57');
INSERT INTO `sj_retry_task` VALUES (216, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:11:07', '', '2025-10-12 20:11:07');
INSERT INTO `sj_retry_task` VALUES (217, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:11:57', '', '2025-10-12 20:11:57');
INSERT INTO `sj_retry_task` VALUES (218, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:12:07', '', '2025-10-12 20:12:07');
INSERT INTO `sj_retry_task` VALUES (219, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:12:57', '', '2025-10-12 20:12:57');
INSERT INTO `sj_retry_task` VALUES (220, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:13:07', '', '2025-10-12 20:13:07');
INSERT INTO `sj_retry_task` VALUES (221, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:13:57', '', '2025-10-12 20:13:57');
INSERT INTO `sj_retry_task` VALUES (222, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:14:07', '', '2025-10-12 20:14:07');
INSERT INTO `sj_retry_task` VALUES (223, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:14:57', '', '2025-10-12 20:14:57');
INSERT INTO `sj_retry_task` VALUES (224, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:15:07', '', '2025-10-12 20:15:07');
INSERT INTO `sj_retry_task` VALUES (225, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:15:57', '', '2025-10-12 20:15:57');
INSERT INTO `sj_retry_task` VALUES (226, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:16:07', '', '2025-10-12 20:16:07');
INSERT INTO `sj_retry_task` VALUES (227, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:16:57', '', '2025-10-12 20:16:57');
INSERT INTO `sj_retry_task` VALUES (228, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:17:07', '', '2025-10-12 20:17:07');
INSERT INTO `sj_retry_task` VALUES (229, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:17:57', '', '2025-10-12 20:17:57');
INSERT INTO `sj_retry_task` VALUES (230, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:18:07', '', '2025-10-12 20:18:07');
INSERT INTO `sj_retry_task` VALUES (231, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:18:57', '', '2025-10-12 20:18:57');
INSERT INTO `sj_retry_task` VALUES (232, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:19:07', '', '2025-10-12 20:19:07');
INSERT INTO `sj_retry_task` VALUES (233, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:19:57', '', '2025-10-12 20:19:57');
INSERT INTO `sj_retry_task` VALUES (234, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:20:07', '', '2025-10-12 20:20:07');
INSERT INTO `sj_retry_task` VALUES (235, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:20:57', '', '2025-10-12 20:20:57');
INSERT INTO `sj_retry_task` VALUES (236, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:21:07', '', '2025-10-12 20:21:07');
INSERT INTO `sj_retry_task` VALUES (237, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:21:57', '', '2025-10-12 20:21:57');
INSERT INTO `sj_retry_task` VALUES (238, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:22:07', '', '2025-10-12 20:22:07');
INSERT INTO `sj_retry_task` VALUES (239, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:22:57', '', '2025-10-12 20:22:57');
INSERT INTO `sj_retry_task` VALUES (240, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:23:07', '', '2025-10-12 20:23:07');
INSERT INTO `sj_retry_task` VALUES (241, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:23:57', '', '2025-10-12 20:23:57');
INSERT INTO `sj_retry_task` VALUES (242, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:24:07', '', '2025-10-12 20:24:07');
INSERT INTO `sj_retry_task` VALUES (243, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:24:57', '', '2025-10-12 20:24:57');
INSERT INTO `sj_retry_task` VALUES (244, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:25:07', '', '2025-10-12 20:25:07');
INSERT INTO `sj_retry_task` VALUES (245, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:25:57', '', '2025-10-12 20:25:57');
INSERT INTO `sj_retry_task` VALUES (246, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:26:07', '', '2025-10-12 20:26:07');
INSERT INTO `sj_retry_task` VALUES (247, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:26:57', '', '2025-10-12 20:26:57');
INSERT INTO `sj_retry_task` VALUES (248, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:27:07', '', '2025-10-12 20:27:07');
INSERT INTO `sj_retry_task` VALUES (249, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:27:57', '', '2025-10-12 20:27:57');
INSERT INTO `sj_retry_task` VALUES (250, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:28:07', '', '2025-10-12 20:28:07');
INSERT INTO `sj_retry_task` VALUES (251, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:28:57', '', '2025-10-12 20:28:57');
INSERT INTO `sj_retry_task` VALUES (252, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:29:07', '', '2025-10-12 20:29:07');
INSERT INTO `sj_retry_task` VALUES (253, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:29:57', '', '2025-10-12 20:29:57');
INSERT INTO `sj_retry_task` VALUES (254, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:30:07', '', '2025-10-12 20:30:07');
INSERT INTO `sj_retry_task` VALUES (255, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:30:57', '', '2025-10-12 20:30:57');
INSERT INTO `sj_retry_task` VALUES (256, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:31:07', '', '2025-10-12 20:31:07');
INSERT INTO `sj_retry_task` VALUES (257, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:31:57', '', '2025-10-12 20:31:57');
INSERT INTO `sj_retry_task` VALUES (258, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:32:07', '', '2025-10-12 20:32:07');
INSERT INTO `sj_retry_task` VALUES (259, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:32:57', '', '2025-10-12 20:32:57');
INSERT INTO `sj_retry_task` VALUES (260, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:33:07', '', '2025-10-12 20:33:07');
INSERT INTO `sj_retry_task` VALUES (261, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:33:57', '', '2025-10-12 20:33:57');
INSERT INTO `sj_retry_task` VALUES (262, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:34:07', '', '2025-10-12 20:34:07');
INSERT INTO `sj_retry_task` VALUES (263, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:34:57', '', '2025-10-12 20:34:57');
INSERT INTO `sj_retry_task` VALUES (264, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:35:07', '', '2025-10-12 20:35:07');
INSERT INTO `sj_retry_task` VALUES (265, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:35:57', '', '2025-10-12 20:35:57');
INSERT INTO `sj_retry_task` VALUES (266, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:36:07', '', '2025-10-12 20:36:07');
INSERT INTO `sj_retry_task` VALUES (267, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:36:57', '', '2025-10-12 20:36:57');
INSERT INTO `sj_retry_task` VALUES (268, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:37:07', '', '2025-10-12 20:37:07');
INSERT INTO `sj_retry_task` VALUES (269, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:37:57', '', '2025-10-12 20:37:57');
INSERT INTO `sj_retry_task` VALUES (270, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:38:07', '', '2025-10-12 20:38:07');
INSERT INTO `sj_retry_task` VALUES (271, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:38:57', '', '2025-10-12 20:38:57');
INSERT INTO `sj_retry_task` VALUES (272, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:39:07', '', '2025-10-12 20:39:07');
INSERT INTO `sj_retry_task` VALUES (273, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:39:57', '', '2025-10-12 20:39:57');
INSERT INTO `sj_retry_task` VALUES (274, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:40:07', '', '2025-10-12 20:40:07');
INSERT INTO `sj_retry_task` VALUES (275, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:40:57', '', '2025-10-12 20:40:57');
INSERT INTO `sj_retry_task` VALUES (276, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:41:07', '', '2025-10-12 20:41:07');
INSERT INTO `sj_retry_task` VALUES (277, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:41:57', '', '2025-10-12 20:41:57');
INSERT INTO `sj_retry_task` VALUES (278, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:42:07', '', '2025-10-12 20:42:07');
INSERT INTO `sj_retry_task` VALUES (279, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:42:57', '', '2025-10-12 20:42:57');
INSERT INTO `sj_retry_task` VALUES (280, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:43:07', '', '2025-10-12 20:43:07');
INSERT INTO `sj_retry_task` VALUES (281, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:43:57', '', '2025-10-12 20:43:57');
INSERT INTO `sj_retry_task` VALUES (282, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:44:07', '', '2025-10-12 20:44:07');
INSERT INTO `sj_retry_task` VALUES (283, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:44:57', '', '2025-10-12 20:44:57');
INSERT INTO `sj_retry_task` VALUES (284, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:45:07', '', '2025-10-12 20:45:07');
INSERT INTO `sj_retry_task` VALUES (285, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 20:45:57', '', '2025-10-12 20:45:57');
INSERT INTO `sj_retry_task` VALUES (286, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 20:46:07', '', '2025-10-12 20:46:07');
INSERT INTO `sj_retry_task` VALUES (287, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:05:16', '', '2025-10-12 23:05:16');
INSERT INTO `sj_retry_task` VALUES (288, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:05:16', '', '2025-10-12 23:05:16');
INSERT INTO `sj_retry_task` VALUES (289, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:06:16', '', '2025-10-12 23:06:16');
INSERT INTO `sj_retry_task` VALUES (290, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:06:16', '', '2025-10-12 23:06:16');
INSERT INTO `sj_retry_task` VALUES (291, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:07:16', '', '2025-10-12 23:07:16');
INSERT INTO `sj_retry_task` VALUES (292, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:07:16', '', '2025-10-12 23:07:16');
INSERT INTO `sj_retry_task` VALUES (293, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:08:16', '', '2025-10-12 23:08:16');
INSERT INTO `sj_retry_task` VALUES (294, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:08:16', '', '2025-10-12 23:08:16');
INSERT INTO `sj_retry_task` VALUES (295, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:09:16', '', '2025-10-12 23:09:16');
INSERT INTO `sj_retry_task` VALUES (296, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:09:16', '', '2025-10-12 23:09:16');
INSERT INTO `sj_retry_task` VALUES (297, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:10:16', '', '2025-10-12 23:10:16');
INSERT INTO `sj_retry_task` VALUES (298, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:10:16', '', '2025-10-12 23:10:16');
INSERT INTO `sj_retry_task` VALUES (299, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:11:16', '', '2025-10-12 23:11:16');
INSERT INTO `sj_retry_task` VALUES (300, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:11:16', '', '2025-10-12 23:11:16');
INSERT INTO `sj_retry_task` VALUES (301, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:12:16', '', '2025-10-12 23:12:16');
INSERT INTO `sj_retry_task` VALUES (302, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:12:16', '', '2025-10-12 23:12:16');
INSERT INTO `sj_retry_task` VALUES (303, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:13:16', '', '2025-10-12 23:13:16');
INSERT INTO `sj_retry_task` VALUES (304, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:13:16', '', '2025-10-12 23:13:16');
INSERT INTO `sj_retry_task` VALUES (305, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:14:16', '', '2025-10-12 23:14:16');
INSERT INTO `sj_retry_task` VALUES (306, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:14:16', '', '2025-10-12 23:14:16');
INSERT INTO `sj_retry_task` VALUES (307, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:15:16', '', '2025-10-12 23:15:16');
INSERT INTO `sj_retry_task` VALUES (308, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:15:16', '', '2025-10-12 23:15:16');
INSERT INTO `sj_retry_task` VALUES (309, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:16:16', '', '2025-10-12 23:16:16');
INSERT INTO `sj_retry_task` VALUES (310, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:16:16', '', '2025-10-12 23:16:16');
INSERT INTO `sj_retry_task` VALUES (311, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:17:16', '', '2025-10-12 23:17:16');
INSERT INTO `sj_retry_task` VALUES (312, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:17:16', '', '2025-10-12 23:17:16');
INSERT INTO `sj_retry_task` VALUES (313, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:18:16', '', '2025-10-12 23:18:16');
INSERT INTO `sj_retry_task` VALUES (314, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:18:16', '', '2025-10-12 23:18:16');
INSERT INTO `sj_retry_task` VALUES (315, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:19:16', '', '2025-10-12 23:19:16');
INSERT INTO `sj_retry_task` VALUES (316, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:19:16', '', '2025-10-12 23:19:16');
INSERT INTO `sj_retry_task` VALUES (317, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:20:16', '', '2025-10-12 23:20:16');
INSERT INTO `sj_retry_task` VALUES (318, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:20:16', '', '2025-10-12 23:20:16');
INSERT INTO `sj_retry_task` VALUES (319, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:21:16', '', '2025-10-12 23:21:16');
INSERT INTO `sj_retry_task` VALUES (320, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:21:16', '', '2025-10-12 23:21:16');
INSERT INTO `sj_retry_task` VALUES (321, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:22:16', '', '2025-10-12 23:22:16');
INSERT INTO `sj_retry_task` VALUES (322, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:22:16', '', '2025-10-12 23:22:16');
INSERT INTO `sj_retry_task` VALUES (323, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:23:16', '', '2025-10-12 23:23:16');
INSERT INTO `sj_retry_task` VALUES (324, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:23:16', '', '2025-10-12 23:23:16');
INSERT INTO `sj_retry_task` VALUES (325, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:24:16', '', '2025-10-12 23:24:16');
INSERT INTO `sj_retry_task` VALUES (326, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:24:16', '', '2025-10-12 23:24:16');
INSERT INTO `sj_retry_task` VALUES (327, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:25:16', '', '2025-10-12 23:25:16');
INSERT INTO `sj_retry_task` VALUES (328, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:25:16', '', '2025-10-12 23:25:16');
INSERT INTO `sj_retry_task` VALUES (329, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:26:16', '', '2025-10-12 23:26:16');
INSERT INTO `sj_retry_task` VALUES (330, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:26:16', '', '2025-10-12 23:26:16');
INSERT INTO `sj_retry_task` VALUES (331, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:27:16', '', '2025-10-12 23:27:16');
INSERT INTO `sj_retry_task` VALUES (332, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:27:16', '', '2025-10-12 23:27:16');
INSERT INTO `sj_retry_task` VALUES (333, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:28:16', '', '2025-10-12 23:28:16');
INSERT INTO `sj_retry_task` VALUES (334, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:28:16', '', '2025-10-12 23:28:16');
INSERT INTO `sj_retry_task` VALUES (335, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:29:16', '', '2025-10-12 23:29:16');
INSERT INTO `sj_retry_task` VALUES (336, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:29:16', '', '2025-10-12 23:29:16');
INSERT INTO `sj_retry_task` VALUES (337, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:30:16', '', '2025-10-12 23:30:16');
INSERT INTO `sj_retry_task` VALUES (338, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:30:16', '', '2025-10-12 23:30:16');
INSERT INTO `sj_retry_task` VALUES (339, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:31:16', '', '2025-10-12 23:31:16');
INSERT INTO `sj_retry_task` VALUES (340, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:31:16', '', '2025-10-12 23:31:16');
INSERT INTO `sj_retry_task` VALUES (341, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:32:16', '', '2025-10-12 23:32:16');
INSERT INTO `sj_retry_task` VALUES (342, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:32:16', '', '2025-10-12 23:32:16');
INSERT INTO `sj_retry_task` VALUES (343, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:33:16', '', '2025-10-12 23:33:16');
INSERT INTO `sj_retry_task` VALUES (344, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:33:16', '', '2025-10-12 23:33:16');
INSERT INTO `sj_retry_task` VALUES (345, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:34:16', '', '2025-10-12 23:34:16');
INSERT INTO `sj_retry_task` VALUES (346, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:34:16', '', '2025-10-12 23:34:16');
INSERT INTO `sj_retry_task` VALUES (347, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:35:16', '', '2025-10-12 23:35:16');
INSERT INTO `sj_retry_task` VALUES (348, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:35:16', '', '2025-10-12 23:35:16');
INSERT INTO `sj_retry_task` VALUES (349, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:36:16', '', '2025-10-12 23:36:16');
INSERT INTO `sj_retry_task` VALUES (350, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:36:16', '', '2025-10-12 23:36:16');
INSERT INTO `sj_retry_task` VALUES (351, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:37:16', '', '2025-10-12 23:37:16');
INSERT INTO `sj_retry_task` VALUES (352, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:37:16', '', '2025-10-12 23:37:16');
INSERT INTO `sj_retry_task` VALUES (353, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:38:16', '', '2025-10-12 23:38:16');
INSERT INTO `sj_retry_task` VALUES (354, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:38:16', '', '2025-10-12 23:38:16');
INSERT INTO `sj_retry_task` VALUES (355, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:39:16', '', '2025-10-12 23:39:16');
INSERT INTO `sj_retry_task` VALUES (356, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:39:16', '', '2025-10-12 23:39:16');
INSERT INTO `sj_retry_task` VALUES (357, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:40:16', '', '2025-10-12 23:40:16');
INSERT INTO `sj_retry_task` VALUES (358, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:40:16', '', '2025-10-12 23:40:16');
INSERT INTO `sj_retry_task` VALUES (359, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:41:16', '', '2025-10-12 23:41:16');
INSERT INTO `sj_retry_task` VALUES (360, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:41:16', '', '2025-10-12 23:41:16');
INSERT INTO `sj_retry_task` VALUES (361, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:42:16', '', '2025-10-12 23:42:16');
INSERT INTO `sj_retry_task` VALUES (362, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:42:16', '', '2025-10-12 23:42:16');
INSERT INTO `sj_retry_task` VALUES (363, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-12 23:43:16', '', '2025-10-12 23:43:16');
INSERT INTO `sj_retry_task` VALUES (364, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-12 23:43:16', '', '2025-10-12 23:43:16');
INSERT INTO `sj_retry_task` VALUES (365, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:41:14', '', '2025-10-13 19:41:14');
INSERT INTO `sj_retry_task` VALUES (366, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:41:14', '', '2025-10-13 19:41:14');
INSERT INTO `sj_retry_task` VALUES (367, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:42:14', '', '2025-10-13 19:42:14');
INSERT INTO `sj_retry_task` VALUES (368, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:42:14', '', '2025-10-13 19:42:14');
INSERT INTO `sj_retry_task` VALUES (369, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:43:14', '', '2025-10-13 19:43:14');
INSERT INTO `sj_retry_task` VALUES (370, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:43:14', '', '2025-10-13 19:43:14');
INSERT INTO `sj_retry_task` VALUES (371, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:44:14', '', '2025-10-13 19:44:14');
INSERT INTO `sj_retry_task` VALUES (372, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:44:14', '', '2025-10-13 19:44:14');
INSERT INTO `sj_retry_task` VALUES (373, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:45:14', '', '2025-10-13 19:45:14');
INSERT INTO `sj_retry_task` VALUES (374, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:45:14', '', '2025-10-13 19:45:14');
INSERT INTO `sj_retry_task` VALUES (375, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:46:14', '', '2025-10-13 19:46:14');
INSERT INTO `sj_retry_task` VALUES (376, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:46:14', '', '2025-10-13 19:46:14');
INSERT INTO `sj_retry_task` VALUES (377, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:47:14', '', '2025-10-13 19:47:14');
INSERT INTO `sj_retry_task` VALUES (378, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:47:14', '', '2025-10-13 19:47:14');
INSERT INTO `sj_retry_task` VALUES (379, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:48:14', '', '2025-10-13 19:48:14');
INSERT INTO `sj_retry_task` VALUES (380, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:48:14', '', '2025-10-13 19:48:14');
INSERT INTO `sj_retry_task` VALUES (381, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:49:14', '', '2025-10-13 19:49:14');
INSERT INTO `sj_retry_task` VALUES (382, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:49:14', '', '2025-10-13 19:49:14');
INSERT INTO `sj_retry_task` VALUES (383, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:50:14', '', '2025-10-13 19:50:14');
INSERT INTO `sj_retry_task` VALUES (384, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:50:14', '', '2025-10-13 19:50:14');
INSERT INTO `sj_retry_task` VALUES (385, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:51:14', '', '2025-10-13 19:51:14');
INSERT INTO `sj_retry_task` VALUES (386, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:51:14', '', '2025-10-13 19:51:14');
INSERT INTO `sj_retry_task` VALUES (387, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:52:14', '', '2025-10-13 19:52:14');
INSERT INTO `sj_retry_task` VALUES (388, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:52:14', '', '2025-10-13 19:52:14');
INSERT INTO `sj_retry_task` VALUES (389, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:53:14', '', '2025-10-13 19:53:14');
INSERT INTO `sj_retry_task` VALUES (390, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:53:14', '', '2025-10-13 19:53:14');
INSERT INTO `sj_retry_task` VALUES (391, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:54:14', '', '2025-10-13 19:54:14');
INSERT INTO `sj_retry_task` VALUES (392, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:54:14', '', '2025-10-13 19:54:14');
INSERT INTO `sj_retry_task` VALUES (393, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:55:14', '', '2025-10-13 19:55:14');
INSERT INTO `sj_retry_task` VALUES (394, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:55:14', '', '2025-10-13 19:55:14');
INSERT INTO `sj_retry_task` VALUES (395, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:56:14', '', '2025-10-13 19:56:14');
INSERT INTO `sj_retry_task` VALUES (396, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:56:14', '', '2025-10-13 19:56:14');
INSERT INTO `sj_retry_task` VALUES (397, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:57:14', '', '2025-10-13 19:57:14');
INSERT INTO `sj_retry_task` VALUES (398, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:57:14', '', '2025-10-13 19:57:14');
INSERT INTO `sj_retry_task` VALUES (399, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:58:14', '', '2025-10-13 19:58:14');
INSERT INTO `sj_retry_task` VALUES (400, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:58:14', '', '2025-10-13 19:58:14');
INSERT INTO `sj_retry_task` VALUES (401, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 19:59:25', '', '2025-10-13 19:59:25');
INSERT INTO `sj_retry_task` VALUES (402, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 19:59:25', '', '2025-10-13 19:59:25');
INSERT INTO `sj_retry_task` VALUES (403, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:00:25', '', '2025-10-13 20:00:25');
INSERT INTO `sj_retry_task` VALUES (404, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:00:25', '', '2025-10-13 20:00:25');
INSERT INTO `sj_retry_task` VALUES (405, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:01:25', '', '2025-10-13 20:01:25');
INSERT INTO `sj_retry_task` VALUES (406, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:01:25', '', '2025-10-13 20:01:25');
INSERT INTO `sj_retry_task` VALUES (407, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:02:25', '', '2025-10-13 20:02:25');
INSERT INTO `sj_retry_task` VALUES (408, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:02:25', '', '2025-10-13 20:02:25');
INSERT INTO `sj_retry_task` VALUES (409, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:03:25', '', '2025-10-13 20:03:25');
INSERT INTO `sj_retry_task` VALUES (410, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:03:25', '', '2025-10-13 20:03:25');
INSERT INTO `sj_retry_task` VALUES (411, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:04:25', '', '2025-10-13 20:04:25');
INSERT INTO `sj_retry_task` VALUES (412, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:04:25', '', '2025-10-13 20:04:25');
INSERT INTO `sj_retry_task` VALUES (413, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:05:25', '', '2025-10-13 20:05:25');
INSERT INTO `sj_retry_task` VALUES (414, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:05:25', '', '2025-10-13 20:05:25');
INSERT INTO `sj_retry_task` VALUES (415, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:06:25', '', '2025-10-13 20:06:25');
INSERT INTO `sj_retry_task` VALUES (416, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:06:25', '', '2025-10-13 20:06:25');
INSERT INTO `sj_retry_task` VALUES (417, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:07:25', '', '2025-10-13 20:07:25');
INSERT INTO `sj_retry_task` VALUES (418, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:07:25', '', '2025-10-13 20:07:25');
INSERT INTO `sj_retry_task` VALUES (419, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:08:25', '', '2025-10-13 20:08:25');
INSERT INTO `sj_retry_task` VALUES (420, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:08:25', '', '2025-10-13 20:08:25');
INSERT INTO `sj_retry_task` VALUES (421, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:09:25', '', '2025-10-13 20:09:25');
INSERT INTO `sj_retry_task` VALUES (422, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:09:25', '', '2025-10-13 20:09:25');
INSERT INTO `sj_retry_task` VALUES (423, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:10:25', '', '2025-10-13 20:10:25');
INSERT INTO `sj_retry_task` VALUES (424, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:10:25', '', '2025-10-13 20:10:25');
INSERT INTO `sj_retry_task` VALUES (425, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:11:25', '', '2025-10-13 20:11:25');
INSERT INTO `sj_retry_task` VALUES (426, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:11:25', '', '2025-10-13 20:11:25');
INSERT INTO `sj_retry_task` VALUES (427, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:12:25', '', '2025-10-13 20:12:25');
INSERT INTO `sj_retry_task` VALUES (428, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:12:25', '', '2025-10-13 20:12:25');
INSERT INTO `sj_retry_task` VALUES (429, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:13:25', '', '2025-10-13 20:13:25');
INSERT INTO `sj_retry_task` VALUES (430, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:13:25', '', '2025-10-13 20:13:25');
INSERT INTO `sj_retry_task` VALUES (431, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:14:25', '', '2025-10-13 20:14:25');
INSERT INTO `sj_retry_task` VALUES (432, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:14:25', '', '2025-10-13 20:14:25');
INSERT INTO `sj_retry_task` VALUES (433, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:15:25', '', '2025-10-13 20:15:25');
INSERT INTO `sj_retry_task` VALUES (434, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:15:25', '', '2025-10-13 20:15:25');
INSERT INTO `sj_retry_task` VALUES (435, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:16:25', '', '2025-10-13 20:16:25');
INSERT INTO `sj_retry_task` VALUES (436, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:16:25', '', '2025-10-13 20:16:25');
INSERT INTO `sj_retry_task` VALUES (437, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:17:25', '', '2025-10-13 20:17:25');
INSERT INTO `sj_retry_task` VALUES (438, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:17:25', '', '2025-10-13 20:17:25');
INSERT INTO `sj_retry_task` VALUES (439, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:18:25', '', '2025-10-13 20:18:25');
INSERT INTO `sj_retry_task` VALUES (440, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:18:25', '', '2025-10-13 20:18:25');
INSERT INTO `sj_retry_task` VALUES (441, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:19:25', '', '2025-10-13 20:19:25');
INSERT INTO `sj_retry_task` VALUES (442, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:19:25', '', '2025-10-13 20:19:25');
INSERT INTO `sj_retry_task` VALUES (443, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:20:25', '', '2025-10-13 20:20:25');
INSERT INTO `sj_retry_task` VALUES (444, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:20:25', '', '2025-10-13 20:20:25');
INSERT INTO `sj_retry_task` VALUES (445, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:21:25', '', '2025-10-13 20:21:25');
INSERT INTO `sj_retry_task` VALUES (446, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:21:25', '', '2025-10-13 20:21:25');
INSERT INTO `sj_retry_task` VALUES (447, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:22:25', '', '2025-10-13 20:22:25');
INSERT INTO `sj_retry_task` VALUES (448, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:22:25', '', '2025-10-13 20:22:25');
INSERT INTO `sj_retry_task` VALUES (449, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:23:25', '', '2025-10-13 20:23:25');
INSERT INTO `sj_retry_task` VALUES (450, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:23:25', '', '2025-10-13 20:23:25');
INSERT INTO `sj_retry_task` VALUES (451, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:24:25', '', '2025-10-13 20:24:25');
INSERT INTO `sj_retry_task` VALUES (452, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:24:25', '', '2025-10-13 20:24:25');
INSERT INTO `sj_retry_task` VALUES (453, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:25:25', '', '2025-10-13 20:25:25');
INSERT INTO `sj_retry_task` VALUES (454, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:25:25', '', '2025-10-13 20:25:25');
INSERT INTO `sj_retry_task` VALUES (455, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:26:25', '', '2025-10-13 20:26:25');
INSERT INTO `sj_retry_task` VALUES (456, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:26:25', '', '2025-10-13 20:26:25');
INSERT INTO `sj_retry_task` VALUES (457, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:27:25', '', '2025-10-13 20:27:25');
INSERT INTO `sj_retry_task` VALUES (458, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:27:25', '', '2025-10-13 20:27:25');
INSERT INTO `sj_retry_task` VALUES (459, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:28:25', '', '2025-10-13 20:28:25');
INSERT INTO `sj_retry_task` VALUES (460, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:28:25', '', '2025-10-13 20:28:25');
INSERT INTO `sj_retry_task` VALUES (461, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:29:25', '', '2025-10-13 20:29:25');
INSERT INTO `sj_retry_task` VALUES (462, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:29:25', '', '2025-10-13 20:29:25');
INSERT INTO `sj_retry_task` VALUES (463, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:30:25', '', '2025-10-13 20:30:25');
INSERT INTO `sj_retry_task` VALUES (464, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:30:25', '', '2025-10-13 20:30:25');
INSERT INTO `sj_retry_task` VALUES (465, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:31:25', '', '2025-10-13 20:31:25');
INSERT INTO `sj_retry_task` VALUES (466, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:31:25', '', '2025-10-13 20:31:25');
INSERT INTO `sj_retry_task` VALUES (467, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:32:25', '', '2025-10-13 20:32:25');
INSERT INTO `sj_retry_task` VALUES (468, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:32:25', '', '2025-10-13 20:32:25');
INSERT INTO `sj_retry_task` VALUES (469, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:33:25', '', '2025-10-13 20:33:25');
INSERT INTO `sj_retry_task` VALUES (470, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:33:25', '', '2025-10-13 20:33:25');
INSERT INTO `sj_retry_task` VALUES (471, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:34:25', '', '2025-10-13 20:34:25');
INSERT INTO `sj_retry_task` VALUES (472, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:34:25', '', '2025-10-13 20:34:25');
INSERT INTO `sj_retry_task` VALUES (473, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:35:25', '', '2025-10-13 20:35:25');
INSERT INTO `sj_retry_task` VALUES (474, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:35:25', '', '2025-10-13 20:35:25');
INSERT INTO `sj_retry_task` VALUES (475, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:36:25', '', '2025-10-13 20:36:25');
INSERT INTO `sj_retry_task` VALUES (476, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:36:25', '', '2025-10-13 20:36:25');
INSERT INTO `sj_retry_task` VALUES (477, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:37:25', '', '2025-10-13 20:37:25');
INSERT INTO `sj_retry_task` VALUES (478, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:37:25', '', '2025-10-13 20:37:25');
INSERT INTO `sj_retry_task` VALUES (479, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:38:25', '', '2025-10-13 20:38:25');
INSERT INTO `sj_retry_task` VALUES (480, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:38:25', '', '2025-10-13 20:38:25');
INSERT INTO `sj_retry_task` VALUES (481, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:39:25', '', '2025-10-13 20:39:25');
INSERT INTO `sj_retry_task` VALUES (482, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:39:25', '', '2025-10-13 20:39:25');
INSERT INTO `sj_retry_task` VALUES (483, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:40:25', '', '2025-10-13 20:40:25');
INSERT INTO `sj_retry_task` VALUES (484, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:40:25', '', '2025-10-13 20:40:25');
INSERT INTO `sj_retry_task` VALUES (485, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:41:25', '', '2025-10-13 20:41:25');
INSERT INTO `sj_retry_task` VALUES (486, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:41:25', '', '2025-10-13 20:41:25');
INSERT INTO `sj_retry_task` VALUES (487, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:42:25', '', '2025-10-13 20:42:25');
INSERT INTO `sj_retry_task` VALUES (488, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:42:25', '', '2025-10-13 20:42:25');
INSERT INTO `sj_retry_task` VALUES (489, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:43:25', '', '2025-10-13 20:43:25');
INSERT INTO `sj_retry_task` VALUES (490, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:43:25', '', '2025-10-13 20:43:25');
INSERT INTO `sj_retry_task` VALUES (491, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:44:25', '', '2025-10-13 20:44:25');
INSERT INTO `sj_retry_task` VALUES (492, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:44:25', '', '2025-10-13 20:44:25');
INSERT INTO `sj_retry_task` VALUES (493, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:45:25', '', '2025-10-13 20:45:25');
INSERT INTO `sj_retry_task` VALUES (494, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:45:25', '', '2025-10-13 20:45:25');
INSERT INTO `sj_retry_task` VALUES (495, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:46:25', '', '2025-10-13 20:46:25');
INSERT INTO `sj_retry_task` VALUES (496, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:46:25', '', '2025-10-13 20:46:25');
INSERT INTO `sj_retry_task` VALUES (497, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:47:25', '', '2025-10-13 20:47:25');
INSERT INTO `sj_retry_task` VALUES (498, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:47:25', '', '2025-10-13 20:47:25');
INSERT INTO `sj_retry_task` VALUES (499, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:48:25', '', '2025-10-13 20:48:25');
INSERT INTO `sj_retry_task` VALUES (500, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:48:25', '', '2025-10-13 20:48:25');
INSERT INTO `sj_retry_task` VALUES (501, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:49:25', '', '2025-10-13 20:49:25');
INSERT INTO `sj_retry_task` VALUES (502, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:49:25', '', '2025-10-13 20:49:25');
INSERT INTO `sj_retry_task` VALUES (503, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:50:25', '', '2025-10-13 20:50:25');
INSERT INTO `sj_retry_task` VALUES (504, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:50:25', '', '2025-10-13 20:50:25');
INSERT INTO `sj_retry_task` VALUES (505, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:51:25', '', '2025-10-13 20:51:25');
INSERT INTO `sj_retry_task` VALUES (506, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:51:25', '', '2025-10-13 20:51:25');
INSERT INTO `sj_retry_task` VALUES (507, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:52:25', '', '2025-10-13 20:52:25');
INSERT INTO `sj_retry_task` VALUES (508, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:52:25', '', '2025-10-13 20:52:25');
INSERT INTO `sj_retry_task` VALUES (509, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:53:25', '', '2025-10-13 20:53:25');
INSERT INTO `sj_retry_task` VALUES (510, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:53:25', '', '2025-10-13 20:53:25');
INSERT INTO `sj_retry_task` VALUES (511, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:54:25', '', '2025-10-13 20:54:25');
INSERT INTO `sj_retry_task` VALUES (512, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:54:25', '', '2025-10-13 20:54:25');
INSERT INTO `sj_retry_task` VALUES (513, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:55:25', '', '2025-10-13 20:55:25');
INSERT INTO `sj_retry_task` VALUES (514, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:55:25', '', '2025-10-13 20:55:25');
INSERT INTO `sj_retry_task` VALUES (515, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:56:25', '', '2025-10-13 20:56:25');
INSERT INTO `sj_retry_task` VALUES (516, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:56:25', '', '2025-10-13 20:56:25');
INSERT INTO `sj_retry_task` VALUES (517, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:57:25', '', '2025-10-13 20:57:25');
INSERT INTO `sj_retry_task` VALUES (518, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:57:25', '', '2025-10-13 20:57:25');
INSERT INTO `sj_retry_task` VALUES (519, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:58:25', '', '2025-10-13 20:58:25');
INSERT INTO `sj_retry_task` VALUES (520, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:58:25', '', '2025-10-13 20:58:25');
INSERT INTO `sj_retry_task` VALUES (521, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 20:59:25', '', '2025-10-13 20:59:25');
INSERT INTO `sj_retry_task` VALUES (522, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 20:59:25', '', '2025-10-13 20:59:25');
INSERT INTO `sj_retry_task` VALUES (523, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:00:25', '', '2025-10-13 21:00:25');
INSERT INTO `sj_retry_task` VALUES (524, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:00:25', '', '2025-10-13 21:00:25');
INSERT INTO `sj_retry_task` VALUES (525, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:01:25', '', '2025-10-13 21:01:25');
INSERT INTO `sj_retry_task` VALUES (526, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:01:25', '', '2025-10-13 21:01:25');
INSERT INTO `sj_retry_task` VALUES (527, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:02:25', '', '2025-10-13 21:02:25');
INSERT INTO `sj_retry_task` VALUES (528, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:02:25', '', '2025-10-13 21:02:25');
INSERT INTO `sj_retry_task` VALUES (529, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:03:25', '', '2025-10-13 21:03:25');
INSERT INTO `sj_retry_task` VALUES (530, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:03:25', '', '2025-10-13 21:03:25');
INSERT INTO `sj_retry_task` VALUES (531, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:04:25', '', '2025-10-13 21:04:25');
INSERT INTO `sj_retry_task` VALUES (532, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:04:25', '', '2025-10-13 21:04:25');
INSERT INTO `sj_retry_task` VALUES (533, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:05:25', '', '2025-10-13 21:05:25');
INSERT INTO `sj_retry_task` VALUES (534, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:05:25', '', '2025-10-13 21:05:25');
INSERT INTO `sj_retry_task` VALUES (535, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:06:25', '', '2025-10-13 21:06:25');
INSERT INTO `sj_retry_task` VALUES (536, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:06:25', '', '2025-10-13 21:06:25');
INSERT INTO `sj_retry_task` VALUES (537, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:07:25', '', '2025-10-13 21:07:25');
INSERT INTO `sj_retry_task` VALUES (538, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:07:25', '', '2025-10-13 21:07:25');
INSERT INTO `sj_retry_task` VALUES (539, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:08:25', '', '2025-10-13 21:08:25');
INSERT INTO `sj_retry_task` VALUES (540, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:08:25', '', '2025-10-13 21:08:25');
INSERT INTO `sj_retry_task` VALUES (541, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:09:25', '', '2025-10-13 21:09:25');
INSERT INTO `sj_retry_task` VALUES (542, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:09:25', '', '2025-10-13 21:09:25');
INSERT INTO `sj_retry_task` VALUES (543, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:10:25', '', '2025-10-13 21:10:25');
INSERT INTO `sj_retry_task` VALUES (544, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:10:25', '', '2025-10-13 21:10:25');
INSERT INTO `sj_retry_task` VALUES (545, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:11:25', '', '2025-10-13 21:11:25');
INSERT INTO `sj_retry_task` VALUES (546, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:11:25', '', '2025-10-13 21:11:25');
INSERT INTO `sj_retry_task` VALUES (547, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:12:25', '', '2025-10-13 21:12:25');
INSERT INTO `sj_retry_task` VALUES (548, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:12:25', '', '2025-10-13 21:12:25');
INSERT INTO `sj_retry_task` VALUES (549, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:13:25', '', '2025-10-13 21:13:25');
INSERT INTO `sj_retry_task` VALUES (550, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:13:25', '', '2025-10-13 21:13:25');
INSERT INTO `sj_retry_task` VALUES (551, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:14:25', '', '2025-10-13 21:14:25');
INSERT INTO `sj_retry_task` VALUES (552, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:14:25', '', '2025-10-13 21:14:25');
INSERT INTO `sj_retry_task` VALUES (553, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:15:25', '', '2025-10-13 21:15:25');
INSERT INTO `sj_retry_task` VALUES (554, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:15:25', '', '2025-10-13 21:15:25');
INSERT INTO `sj_retry_task` VALUES (555, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:16:25', '', '2025-10-13 21:16:25');
INSERT INTO `sj_retry_task` VALUES (556, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:16:25', '', '2025-10-13 21:16:25');
INSERT INTO `sj_retry_task` VALUES (557, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:17:25', '', '2025-10-13 21:17:25');
INSERT INTO `sj_retry_task` VALUES (558, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:17:25', '', '2025-10-13 21:17:25');
INSERT INTO `sj_retry_task` VALUES (559, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:18:25', '', '2025-10-13 21:18:25');
INSERT INTO `sj_retry_task` VALUES (560, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:18:25', '', '2025-10-13 21:18:25');
INSERT INTO `sj_retry_task` VALUES (561, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:19:25', '', '2025-10-13 21:19:25');
INSERT INTO `sj_retry_task` VALUES (562, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:19:25', '', '2025-10-13 21:19:25');
INSERT INTO `sj_retry_task` VALUES (563, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:20:25', '', '2025-10-13 21:20:25');
INSERT INTO `sj_retry_task` VALUES (564, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:20:25', '', '2025-10-13 21:20:25');
INSERT INTO `sj_retry_task` VALUES (565, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:21:25', '', '2025-10-13 21:21:25');
INSERT INTO `sj_retry_task` VALUES (566, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:21:25', '', '2025-10-13 21:21:25');
INSERT INTO `sj_retry_task` VALUES (567, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:22:25', '', '2025-10-13 21:22:25');
INSERT INTO `sj_retry_task` VALUES (568, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:22:25', '', '2025-10-13 21:22:25');
INSERT INTO `sj_retry_task` VALUES (569, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:23:25', '', '2025-10-13 21:23:25');
INSERT INTO `sj_retry_task` VALUES (570, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:23:25', '', '2025-10-13 21:23:25');
INSERT INTO `sj_retry_task` VALUES (571, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:24:25', '', '2025-10-13 21:24:25');
INSERT INTO `sj_retry_task` VALUES (572, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:24:25', '', '2025-10-13 21:24:25');
INSERT INTO `sj_retry_task` VALUES (573, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:25:25', '', '2025-10-13 21:25:25');
INSERT INTO `sj_retry_task` VALUES (574, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:25:25', '', '2025-10-13 21:25:25');
INSERT INTO `sj_retry_task` VALUES (575, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:26:25', '', '2025-10-13 21:26:25');
INSERT INTO `sj_retry_task` VALUES (576, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:26:25', '', '2025-10-13 21:26:25');
INSERT INTO `sj_retry_task` VALUES (577, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:27:25', '', '2025-10-13 21:27:25');
INSERT INTO `sj_retry_task` VALUES (578, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:27:25', '', '2025-10-13 21:27:25');
INSERT INTO `sj_retry_task` VALUES (579, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:28:25', '', '2025-10-13 21:28:25');
INSERT INTO `sj_retry_task` VALUES (580, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:28:25', '', '2025-10-13 21:28:25');
INSERT INTO `sj_retry_task` VALUES (581, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:29:25', '', '2025-10-13 21:29:25');
INSERT INTO `sj_retry_task` VALUES (582, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:29:25', '', '2025-10-13 21:29:25');
INSERT INTO `sj_retry_task` VALUES (583, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:30:25', '', '2025-10-13 21:30:25');
INSERT INTO `sj_retry_task` VALUES (584, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:30:25', '', '2025-10-13 21:30:25');
INSERT INTO `sj_retry_task` VALUES (585, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:31:25', '', '2025-10-13 21:31:25');
INSERT INTO `sj_retry_task` VALUES (586, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:31:25', '', '2025-10-13 21:31:25');
INSERT INTO `sj_retry_task` VALUES (587, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:32:25', '', '2025-10-13 21:32:25');
INSERT INTO `sj_retry_task` VALUES (588, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:32:25', '', '2025-10-13 21:32:25');
INSERT INTO `sj_retry_task` VALUES (589, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:33:25', '', '2025-10-13 21:33:25');
INSERT INTO `sj_retry_task` VALUES (590, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:33:25', '', '2025-10-13 21:33:25');
INSERT INTO `sj_retry_task` VALUES (591, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:34:25', '', '2025-10-13 21:34:25');
INSERT INTO `sj_retry_task` VALUES (592, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:34:25', '', '2025-10-13 21:34:25');
INSERT INTO `sj_retry_task` VALUES (593, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:35:25', '', '2025-10-13 21:35:25');
INSERT INTO `sj_retry_task` VALUES (594, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:35:25', '', '2025-10-13 21:35:25');
INSERT INTO `sj_retry_task` VALUES (595, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:36:25', '', '2025-10-13 21:36:25');
INSERT INTO `sj_retry_task` VALUES (596, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:36:25', '', '2025-10-13 21:36:25');
INSERT INTO `sj_retry_task` VALUES (597, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:37:25', '', '2025-10-13 21:37:25');
INSERT INTO `sj_retry_task` VALUES (598, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:37:25', '', '2025-10-13 21:37:25');
INSERT INTO `sj_retry_task` VALUES (599, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:38:25', '', '2025-10-13 21:38:25');
INSERT INTO `sj_retry_task` VALUES (600, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:38:25', '', '2025-10-13 21:38:25');
INSERT INTO `sj_retry_task` VALUES (601, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:39:25', '', '2025-10-13 21:39:25');
INSERT INTO `sj_retry_task` VALUES (602, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:39:25', '', '2025-10-13 21:39:25');
INSERT INTO `sj_retry_task` VALUES (603, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:40:25', '', '2025-10-13 21:40:25');
INSERT INTO `sj_retry_task` VALUES (604, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:40:25', '', '2025-10-13 21:40:25');
INSERT INTO `sj_retry_task` VALUES (605, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:41:25', '', '2025-10-13 21:41:25');
INSERT INTO `sj_retry_task` VALUES (606, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:41:25', '', '2025-10-13 21:41:25');
INSERT INTO `sj_retry_task` VALUES (607, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:42:25', '', '2025-10-13 21:42:25');
INSERT INTO `sj_retry_task` VALUES (608, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:42:25', '', '2025-10-13 21:42:25');
INSERT INTO `sj_retry_task` VALUES (609, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:43:25', '', '2025-10-13 21:43:25');
INSERT INTO `sj_retry_task` VALUES (610, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:43:25', '', '2025-10-13 21:43:25');
INSERT INTO `sj_retry_task` VALUES (611, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:44:25', '', '2025-10-13 21:44:25');
INSERT INTO `sj_retry_task` VALUES (612, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:44:25', '', '2025-10-13 21:44:25');
INSERT INTO `sj_retry_task` VALUES (613, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:45:25', '', '2025-10-13 21:45:25');
INSERT INTO `sj_retry_task` VALUES (614, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:45:25', '', '2025-10-13 21:45:25');
INSERT INTO `sj_retry_task` VALUES (615, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:46:25', '', '2025-10-13 21:46:25');
INSERT INTO `sj_retry_task` VALUES (616, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:46:25', '', '2025-10-13 21:46:25');
INSERT INTO `sj_retry_task` VALUES (617, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:47:25', '', '2025-10-13 21:47:25');
INSERT INTO `sj_retry_task` VALUES (618, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:47:25', '', '2025-10-13 21:47:25');
INSERT INTO `sj_retry_task` VALUES (619, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:48:25', '', '2025-10-13 21:48:25');
INSERT INTO `sj_retry_task` VALUES (620, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:48:25', '', '2025-10-13 21:48:25');
INSERT INTO `sj_retry_task` VALUES (621, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:49:25', '', '2025-10-13 21:49:25');
INSERT INTO `sj_retry_task` VALUES (622, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:49:25', '', '2025-10-13 21:49:25');
INSERT INTO `sj_retry_task` VALUES (623, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:50:25', '', '2025-10-13 21:50:25');
INSERT INTO `sj_retry_task` VALUES (624, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:50:25', '', '2025-10-13 21:50:25');
INSERT INTO `sj_retry_task` VALUES (625, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:51:25', '', '2025-10-13 21:51:25');
INSERT INTO `sj_retry_task` VALUES (626, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:51:25', '', '2025-10-13 21:51:25');
INSERT INTO `sj_retry_task` VALUES (627, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:52:25', '', '2025-10-13 21:52:25');
INSERT INTO `sj_retry_task` VALUES (628, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:52:25', '', '2025-10-13 21:52:25');
INSERT INTO `sj_retry_task` VALUES (629, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:53:25', '', '2025-10-13 21:53:25');
INSERT INTO `sj_retry_task` VALUES (630, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:53:25', '', '2025-10-13 21:53:25');
INSERT INTO `sj_retry_task` VALUES (631, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:54:25', '', '2025-10-13 21:54:25');
INSERT INTO `sj_retry_task` VALUES (632, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:54:25', '', '2025-10-13 21:54:25');
INSERT INTO `sj_retry_task` VALUES (633, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:55:25', '', '2025-10-13 21:55:25');
INSERT INTO `sj_retry_task` VALUES (634, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:55:25', '', '2025-10-13 21:55:25');
INSERT INTO `sj_retry_task` VALUES (635, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:56:25', '', '2025-10-13 21:56:25');
INSERT INTO `sj_retry_task` VALUES (636, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:56:25', '', '2025-10-13 21:56:25');
INSERT INTO `sj_retry_task` VALUES (637, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:57:25', '', '2025-10-13 21:57:25');
INSERT INTO `sj_retry_task` VALUES (638, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:57:25', '', '2025-10-13 21:57:25');
INSERT INTO `sj_retry_task` VALUES (639, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:58:25', '', '2025-10-13 21:58:25');
INSERT INTO `sj_retry_task` VALUES (640, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:58:25', '', '2025-10-13 21:58:25');
INSERT INTO `sj_retry_task` VALUES (641, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 21:59:25', '', '2025-10-13 21:59:25');
INSERT INTO `sj_retry_task` VALUES (642, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 21:59:25', '', '2025-10-13 21:59:25');
INSERT INTO `sj_retry_task` VALUES (643, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:00:25', '', '2025-10-13 22:00:25');
INSERT INTO `sj_retry_task` VALUES (644, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:00:25', '', '2025-10-13 22:00:25');
INSERT INTO `sj_retry_task` VALUES (645, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:01:25', '', '2025-10-13 22:01:25');
INSERT INTO `sj_retry_task` VALUES (646, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:01:25', '', '2025-10-13 22:01:25');
INSERT INTO `sj_retry_task` VALUES (647, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:02:25', '', '2025-10-13 22:02:25');
INSERT INTO `sj_retry_task` VALUES (648, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:02:25', '', '2025-10-13 22:02:25');
INSERT INTO `sj_retry_task` VALUES (649, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:03:25', '', '2025-10-13 22:03:25');
INSERT INTO `sj_retry_task` VALUES (650, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:03:25', '', '2025-10-13 22:03:25');
INSERT INTO `sj_retry_task` VALUES (651, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:04:25', '', '2025-10-13 22:04:25');
INSERT INTO `sj_retry_task` VALUES (652, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:04:25', '', '2025-10-13 22:04:25');
INSERT INTO `sj_retry_task` VALUES (653, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:05:25', '', '2025-10-13 22:05:25');
INSERT INTO `sj_retry_task` VALUES (654, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:05:25', '', '2025-10-13 22:05:25');
INSERT INTO `sj_retry_task` VALUES (655, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:06:25', '', '2025-10-13 22:06:25');
INSERT INTO `sj_retry_task` VALUES (656, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:06:25', '', '2025-10-13 22:06:25');
INSERT INTO `sj_retry_task` VALUES (657, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:07:25', '', '2025-10-13 22:07:25');
INSERT INTO `sj_retry_task` VALUES (658, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:07:25', '', '2025-10-13 22:07:25');
INSERT INTO `sj_retry_task` VALUES (659, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:08:25', '', '2025-10-13 22:08:25');
INSERT INTO `sj_retry_task` VALUES (660, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:08:25', '', '2025-10-13 22:08:25');
INSERT INTO `sj_retry_task` VALUES (661, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:09:25', '', '2025-10-13 22:09:25');
INSERT INTO `sj_retry_task` VALUES (662, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:09:25', '', '2025-10-13 22:09:25');
INSERT INTO `sj_retry_task` VALUES (663, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:10:25', '', '2025-10-13 22:10:25');
INSERT INTO `sj_retry_task` VALUES (664, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:10:25', '', '2025-10-13 22:10:25');
INSERT INTO `sj_retry_task` VALUES (665, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:11:25', '', '2025-10-13 22:11:25');
INSERT INTO `sj_retry_task` VALUES (666, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:11:25', '', '2025-10-13 22:11:25');
INSERT INTO `sj_retry_task` VALUES (667, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:12:25', '', '2025-10-13 22:12:25');
INSERT INTO `sj_retry_task` VALUES (668, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:12:25', '', '2025-10-13 22:12:25');
INSERT INTO `sj_retry_task` VALUES (669, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:13:25', '', '2025-10-13 22:13:25');
INSERT INTO `sj_retry_task` VALUES (670, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:13:25', '', '2025-10-13 22:13:25');
INSERT INTO `sj_retry_task` VALUES (671, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:14:25', '', '2025-10-13 22:14:25');
INSERT INTO `sj_retry_task` VALUES (672, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:14:25', '', '2025-10-13 22:14:25');
INSERT INTO `sj_retry_task` VALUES (673, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:15:25', '', '2025-10-13 22:15:25');
INSERT INTO `sj_retry_task` VALUES (674, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:15:25', '', '2025-10-13 22:15:25');
INSERT INTO `sj_retry_task` VALUES (675, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:16:25', '', '2025-10-13 22:16:25');
INSERT INTO `sj_retry_task` VALUES (676, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:16:25', '', '2025-10-13 22:16:25');
INSERT INTO `sj_retry_task` VALUES (677, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:17:25', '', '2025-10-13 22:17:25');
INSERT INTO `sj_retry_task` VALUES (678, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:17:25', '', '2025-10-13 22:17:25');
INSERT INTO `sj_retry_task` VALUES (679, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:18:25', '', '2025-10-13 22:18:25');
INSERT INTO `sj_retry_task` VALUES (680, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:18:25', '', '2025-10-13 22:18:25');
INSERT INTO `sj_retry_task` VALUES (681, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:19:25', '', '2025-10-13 22:19:25');
INSERT INTO `sj_retry_task` VALUES (682, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:19:25', '', '2025-10-13 22:19:25');
INSERT INTO `sj_retry_task` VALUES (683, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:20:25', '', '2025-10-13 22:20:25');
INSERT INTO `sj_retry_task` VALUES (684, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:20:25', '', '2025-10-13 22:20:25');
INSERT INTO `sj_retry_task` VALUES (685, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:21:25', '', '2025-10-13 22:21:25');
INSERT INTO `sj_retry_task` VALUES (686, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:21:25', '', '2025-10-13 22:21:25');
INSERT INTO `sj_retry_task` VALUES (687, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:22:25', '', '2025-10-13 22:22:25');
INSERT INTO `sj_retry_task` VALUES (688, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:22:25', '', '2025-10-13 22:22:25');
INSERT INTO `sj_retry_task` VALUES (689, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:23:25', '', '2025-10-13 22:23:25');
INSERT INTO `sj_retry_task` VALUES (690, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:23:25', '', '2025-10-13 22:23:25');
INSERT INTO `sj_retry_task` VALUES (691, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:24:25', '', '2025-10-13 22:24:25');
INSERT INTO `sj_retry_task` VALUES (692, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:24:25', '', '2025-10-13 22:24:25');
INSERT INTO `sj_retry_task` VALUES (693, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:25:25', '', '2025-10-13 22:25:25');
INSERT INTO `sj_retry_task` VALUES (694, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:25:25', '', '2025-10-13 22:25:25');
INSERT INTO `sj_retry_task` VALUES (695, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:26:25', '', '2025-10-13 22:26:25');
INSERT INTO `sj_retry_task` VALUES (696, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:26:25', '', '2025-10-13 22:26:25');
INSERT INTO `sj_retry_task` VALUES (697, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:27:25', '', '2025-10-13 22:27:25');
INSERT INTO `sj_retry_task` VALUES (698, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:27:25', '', '2025-10-13 22:27:25');
INSERT INTO `sj_retry_task` VALUES (699, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:28:25', '', '2025-10-13 22:28:25');
INSERT INTO `sj_retry_task` VALUES (700, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:28:25', '', '2025-10-13 22:28:25');
INSERT INTO `sj_retry_task` VALUES (701, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:29:25', '', '2025-10-13 22:29:25');
INSERT INTO `sj_retry_task` VALUES (702, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:29:25', '', '2025-10-13 22:29:25');
INSERT INTO `sj_retry_task` VALUES (703, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:30:25', '', '2025-10-13 22:30:25');
INSERT INTO `sj_retry_task` VALUES (704, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:30:25', '', '2025-10-13 22:30:25');
INSERT INTO `sj_retry_task` VALUES (705, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:31:25', '', '2025-10-13 22:31:25');
INSERT INTO `sj_retry_task` VALUES (706, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:31:25', '', '2025-10-13 22:31:25');
INSERT INTO `sj_retry_task` VALUES (707, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:32:25', '', '2025-10-13 22:32:25');
INSERT INTO `sj_retry_task` VALUES (708, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:32:25', '', '2025-10-13 22:32:25');
INSERT INTO `sj_retry_task` VALUES (709, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:33:25', '', '2025-10-13 22:33:25');
INSERT INTO `sj_retry_task` VALUES (710, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:33:25', '', '2025-10-13 22:33:25');
INSERT INTO `sj_retry_task` VALUES (711, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:34:25', '', '2025-10-13 22:34:25');
INSERT INTO `sj_retry_task` VALUES (712, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:34:25', '', '2025-10-13 22:34:25');
INSERT INTO `sj_retry_task` VALUES (713, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:35:25', '', '2025-10-13 22:35:25');
INSERT INTO `sj_retry_task` VALUES (714, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:35:25', '', '2025-10-13 22:35:25');
INSERT INTO `sj_retry_task` VALUES (715, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:36:25', '', '2025-10-13 22:36:25');
INSERT INTO `sj_retry_task` VALUES (716, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:36:25', '', '2025-10-13 22:36:25');
INSERT INTO `sj_retry_task` VALUES (717, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:37:25', '', '2025-10-13 22:37:25');
INSERT INTO `sj_retry_task` VALUES (718, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:37:25', '', '2025-10-13 22:37:25');
INSERT INTO `sj_retry_task` VALUES (719, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:38:25', '', '2025-10-13 22:38:25');
INSERT INTO `sj_retry_task` VALUES (720, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:38:25', '', '2025-10-13 22:38:25');
INSERT INTO `sj_retry_task` VALUES (721, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:39:25', '', '2025-10-13 22:39:25');
INSERT INTO `sj_retry_task` VALUES (722, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:39:25', '', '2025-10-13 22:39:25');
INSERT INTO `sj_retry_task` VALUES (723, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:40:25', '', '2025-10-13 22:40:25');
INSERT INTO `sj_retry_task` VALUES (724, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:40:25', '', '2025-10-13 22:40:25');
INSERT INTO `sj_retry_task` VALUES (725, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:41:25', '', '2025-10-13 22:41:25');
INSERT INTO `sj_retry_task` VALUES (726, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:41:25', '', '2025-10-13 22:41:25');
INSERT INTO `sj_retry_task` VALUES (727, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:42:25', '', '2025-10-13 22:42:25');
INSERT INTO `sj_retry_task` VALUES (728, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:42:25', '', '2025-10-13 22:42:25');
INSERT INTO `sj_retry_task` VALUES (729, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:43:25', '', '2025-10-13 22:43:25');
INSERT INTO `sj_retry_task` VALUES (730, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:43:25', '', '2025-10-13 22:43:25');
INSERT INTO `sj_retry_task` VALUES (731, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:44:25', '', '2025-10-13 22:44:25');
INSERT INTO `sj_retry_task` VALUES (732, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:44:25', '', '2025-10-13 22:44:25');
INSERT INTO `sj_retry_task` VALUES (733, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:45:25', '', '2025-10-13 22:45:25');
INSERT INTO `sj_retry_task` VALUES (734, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:45:25', '', '2025-10-13 22:45:25');
INSERT INTO `sj_retry_task` VALUES (735, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:46:25', '', '2025-10-13 22:46:25');
INSERT INTO `sj_retry_task` VALUES (736, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:46:25', '', '2025-10-13 22:46:25');
INSERT INTO `sj_retry_task` VALUES (737, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:47:25', '', '2025-10-13 22:47:25');
INSERT INTO `sj_retry_task` VALUES (738, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:47:25', '', '2025-10-13 22:47:25');
INSERT INTO `sj_retry_task` VALUES (739, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:48:25', '', '2025-10-13 22:48:25');
INSERT INTO `sj_retry_task` VALUES (740, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:48:25', '', '2025-10-13 22:48:25');
INSERT INTO `sj_retry_task` VALUES (741, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:49:25', '', '2025-10-13 22:49:25');
INSERT INTO `sj_retry_task` VALUES (742, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:49:25', '', '2025-10-13 22:49:25');
INSERT INTO `sj_retry_task` VALUES (743, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:50:25', '', '2025-10-13 22:50:25');
INSERT INTO `sj_retry_task` VALUES (744, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:50:25', '', '2025-10-13 22:50:25');
INSERT INTO `sj_retry_task` VALUES (745, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:51:25', '', '2025-10-13 22:51:25');
INSERT INTO `sj_retry_task` VALUES (746, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:51:25', '', '2025-10-13 22:51:25');
INSERT INTO `sj_retry_task` VALUES (747, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:52:25', '', '2025-10-13 22:52:25');
INSERT INTO `sj_retry_task` VALUES (748, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:52:25', '', '2025-10-13 22:52:25');
INSERT INTO `sj_retry_task` VALUES (749, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:53:25', '', '2025-10-13 22:53:25');
INSERT INTO `sj_retry_task` VALUES (750, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:53:25', '', '2025-10-13 22:53:25');
INSERT INTO `sj_retry_task` VALUES (751, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:54:25', '', '2025-10-13 22:54:25');
INSERT INTO `sj_retry_task` VALUES (752, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:54:25', '', '2025-10-13 22:54:25');
INSERT INTO `sj_retry_task` VALUES (753, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:55:25', '', '2025-10-13 22:55:25');
INSERT INTO `sj_retry_task` VALUES (754, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:55:25', '', '2025-10-13 22:55:25');
INSERT INTO `sj_retry_task` VALUES (755, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:56:25', '', '2025-10-13 22:56:25');
INSERT INTO `sj_retry_task` VALUES (756, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:56:25', '', '2025-10-13 22:56:25');
INSERT INTO `sj_retry_task` VALUES (757, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:57:25', '', '2025-10-13 22:57:25');
INSERT INTO `sj_retry_task` VALUES (758, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:57:25', '', '2025-10-13 22:57:25');
INSERT INTO `sj_retry_task` VALUES (759, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:58:25', '', '2025-10-13 22:58:25');
INSERT INTO `sj_retry_task` VALUES (760, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:58:25', '', '2025-10-13 22:58:25');
INSERT INTO `sj_retry_task` VALUES (761, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 22:59:25', '', '2025-10-13 22:59:25');
INSERT INTO `sj_retry_task` VALUES (762, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 22:59:25', '', '2025-10-13 22:59:25');
INSERT INTO `sj_retry_task` VALUES (763, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:00:25', '', '2025-10-13 23:00:25');
INSERT INTO `sj_retry_task` VALUES (764, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:00:25', '', '2025-10-13 23:00:25');
INSERT INTO `sj_retry_task` VALUES (765, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:01:25', '', '2025-10-13 23:01:25');
INSERT INTO `sj_retry_task` VALUES (766, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:01:25', '', '2025-10-13 23:01:25');
INSERT INTO `sj_retry_task` VALUES (767, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:02:25', '', '2025-10-13 23:02:25');
INSERT INTO `sj_retry_task` VALUES (768, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:02:25', '', '2025-10-13 23:02:25');
INSERT INTO `sj_retry_task` VALUES (769, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:03:25', '', '2025-10-13 23:03:25');
INSERT INTO `sj_retry_task` VALUES (770, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:03:25', '', '2025-10-13 23:03:25');
INSERT INTO `sj_retry_task` VALUES (771, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:04:25', '', '2025-10-13 23:04:25');
INSERT INTO `sj_retry_task` VALUES (772, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:04:25', '', '2025-10-13 23:04:25');
INSERT INTO `sj_retry_task` VALUES (773, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:05:25', '', '2025-10-13 23:05:25');
INSERT INTO `sj_retry_task` VALUES (774, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:05:25', '', '2025-10-13 23:05:25');
INSERT INTO `sj_retry_task` VALUES (775, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:06:25', '', '2025-10-13 23:06:25');
INSERT INTO `sj_retry_task` VALUES (776, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:06:25', '', '2025-10-13 23:06:25');
INSERT INTO `sj_retry_task` VALUES (777, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:07:25', '', '2025-10-13 23:07:25');
INSERT INTO `sj_retry_task` VALUES (778, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:07:25', '', '2025-10-13 23:07:25');
INSERT INTO `sj_retry_task` VALUES (779, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:08:25', '', '2025-10-13 23:08:25');
INSERT INTO `sj_retry_task` VALUES (780, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:08:25', '', '2025-10-13 23:08:25');
INSERT INTO `sj_retry_task` VALUES (781, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:09:25', '', '2025-10-13 23:09:25');
INSERT INTO `sj_retry_task` VALUES (782, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:09:25', '', '2025-10-13 23:09:25');
INSERT INTO `sj_retry_task` VALUES (783, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:10:25', '', '2025-10-13 23:10:25');
INSERT INTO `sj_retry_task` VALUES (784, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:10:25', '', '2025-10-13 23:10:25');
INSERT INTO `sj_retry_task` VALUES (785, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:11:25', '', '2025-10-13 23:11:25');
INSERT INTO `sj_retry_task` VALUES (786, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:11:25', '', '2025-10-13 23:11:25');
INSERT INTO `sj_retry_task` VALUES (787, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:12:25', '', '2025-10-13 23:12:25');
INSERT INTO `sj_retry_task` VALUES (788, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:12:25', '', '2025-10-13 23:12:25');
INSERT INTO `sj_retry_task` VALUES (789, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:13:25', '', '2025-10-13 23:13:25');
INSERT INTO `sj_retry_task` VALUES (790, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:13:25', '', '2025-10-13 23:13:25');
INSERT INTO `sj_retry_task` VALUES (791, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:14:25', '', '2025-10-13 23:14:25');
INSERT INTO `sj_retry_task` VALUES (792, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:14:25', '', '2025-10-13 23:14:25');
INSERT INTO `sj_retry_task` VALUES (793, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:15:25', '', '2025-10-13 23:15:25');
INSERT INTO `sj_retry_task` VALUES (794, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:15:25', '', '2025-10-13 23:15:25');
INSERT INTO `sj_retry_task` VALUES (795, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:16:25', '', '2025-10-13 23:16:25');
INSERT INTO `sj_retry_task` VALUES (796, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:16:25', '', '2025-10-13 23:16:25');
INSERT INTO `sj_retry_task` VALUES (797, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:17:25', '', '2025-10-13 23:17:25');
INSERT INTO `sj_retry_task` VALUES (798, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:17:25', '', '2025-10-13 23:17:25');
INSERT INTO `sj_retry_task` VALUES (799, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:18:25', '', '2025-10-13 23:18:25');
INSERT INTO `sj_retry_task` VALUES (800, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:18:25', '', '2025-10-13 23:18:25');
INSERT INTO `sj_retry_task` VALUES (801, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:19:25', '', '2025-10-13 23:19:25');
INSERT INTO `sj_retry_task` VALUES (802, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:19:25', '', '2025-10-13 23:19:25');
INSERT INTO `sj_retry_task` VALUES (803, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:20:25', '', '2025-10-13 23:20:25');
INSERT INTO `sj_retry_task` VALUES (804, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:20:25', '', '2025-10-13 23:20:25');
INSERT INTO `sj_retry_task` VALUES (805, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:21:25', '', '2025-10-13 23:21:25');
INSERT INTO `sj_retry_task` VALUES (806, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:21:25', '', '2025-10-13 23:21:25');
INSERT INTO `sj_retry_task` VALUES (807, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:22:25', '', '2025-10-13 23:22:25');
INSERT INTO `sj_retry_task` VALUES (808, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:22:25', '', '2025-10-13 23:22:25');
INSERT INTO `sj_retry_task` VALUES (809, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:23:25', '', '2025-10-13 23:23:25');
INSERT INTO `sj_retry_task` VALUES (810, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:23:25', '', '2025-10-13 23:23:25');
INSERT INTO `sj_retry_task` VALUES (811, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:24:25', '', '2025-10-13 23:24:25');
INSERT INTO `sj_retry_task` VALUES (812, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:24:25', '', '2025-10-13 23:24:25');
INSERT INTO `sj_retry_task` VALUES (813, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:25:25', '', '2025-10-13 23:25:25');
INSERT INTO `sj_retry_task` VALUES (814, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:25:25', '', '2025-10-13 23:25:25');
INSERT INTO `sj_retry_task` VALUES (815, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:26:25', '', '2025-10-13 23:26:25');
INSERT INTO `sj_retry_task` VALUES (816, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:26:25', '', '2025-10-13 23:26:25');
INSERT INTO `sj_retry_task` VALUES (817, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:27:25', '', '2025-10-13 23:27:25');
INSERT INTO `sj_retry_task` VALUES (818, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:27:25', '', '2025-10-13 23:27:25');
INSERT INTO `sj_retry_task` VALUES (819, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:28:25', '', '2025-10-13 23:28:25');
INSERT INTO `sj_retry_task` VALUES (820, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:28:25', '', '2025-10-13 23:28:25');
INSERT INTO `sj_retry_task` VALUES (821, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:29:25', '', '2025-10-13 23:29:25');
INSERT INTO `sj_retry_task` VALUES (822, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:29:25', '', '2025-10-13 23:29:25');
INSERT INTO `sj_retry_task` VALUES (823, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:30:25', '', '2025-10-13 23:30:25');
INSERT INTO `sj_retry_task` VALUES (824, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:30:25', '', '2025-10-13 23:30:25');
INSERT INTO `sj_retry_task` VALUES (825, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:31:25', '', '2025-10-13 23:31:25');
INSERT INTO `sj_retry_task` VALUES (826, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:31:25', '', '2025-10-13 23:31:25');
INSERT INTO `sj_retry_task` VALUES (827, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:32:25', '', '2025-10-13 23:32:25');
INSERT INTO `sj_retry_task` VALUES (828, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:32:25', '', '2025-10-13 23:32:25');
INSERT INTO `sj_retry_task` VALUES (829, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:33:25', '', '2025-10-13 23:33:25');
INSERT INTO `sj_retry_task` VALUES (830, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:33:25', '', '2025-10-13 23:33:25');
INSERT INTO `sj_retry_task` VALUES (831, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:34:25', '', '2025-10-13 23:34:25');
INSERT INTO `sj_retry_task` VALUES (832, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:34:25', '', '2025-10-13 23:34:25');
INSERT INTO `sj_retry_task` VALUES (833, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:35:25', '', '2025-10-13 23:35:25');
INSERT INTO `sj_retry_task` VALUES (834, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:35:25', '', '2025-10-13 23:35:25');
INSERT INTO `sj_retry_task` VALUES (835, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:36:25', '', '2025-10-13 23:36:25');
INSERT INTO `sj_retry_task` VALUES (836, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:36:25', '', '2025-10-13 23:36:25');
INSERT INTO `sj_retry_task` VALUES (837, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:37:25', '', '2025-10-13 23:37:25');
INSERT INTO `sj_retry_task` VALUES (838, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:37:25', '', '2025-10-13 23:37:25');
INSERT INTO `sj_retry_task` VALUES (839, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:38:25', '', '2025-10-13 23:38:25');
INSERT INTO `sj_retry_task` VALUES (840, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:38:25', '', '2025-10-13 23:38:25');
INSERT INTO `sj_retry_task` VALUES (841, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:39:25', '', '2025-10-13 23:39:25');
INSERT INTO `sj_retry_task` VALUES (842, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:39:25', '', '2025-10-13 23:39:25');
INSERT INTO `sj_retry_task` VALUES (843, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:40:25', '', '2025-10-13 23:40:25');
INSERT INTO `sj_retry_task` VALUES (844, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:40:25', '', '2025-10-13 23:40:25');
INSERT INTO `sj_retry_task` VALUES (845, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:41:25', '', '2025-10-13 23:41:25');
INSERT INTO `sj_retry_task` VALUES (846, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:41:25', '', '2025-10-13 23:41:25');
INSERT INTO `sj_retry_task` VALUES (847, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:42:25', '', '2025-10-13 23:42:25');
INSERT INTO `sj_retry_task` VALUES (848, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:42:25', '', '2025-10-13 23:42:25');
INSERT INTO `sj_retry_task` VALUES (849, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:43:25', '', '2025-10-13 23:43:25');
INSERT INTO `sj_retry_task` VALUES (850, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:43:25', '', '2025-10-13 23:43:25');
INSERT INTO `sj_retry_task` VALUES (851, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:44:25', '', '2025-10-13 23:44:25');
INSERT INTO `sj_retry_task` VALUES (852, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:44:25', '', '2025-10-13 23:44:25');
INSERT INTO `sj_retry_task` VALUES (853, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:45:25', '', '2025-10-13 23:45:25');
INSERT INTO `sj_retry_task` VALUES (854, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:45:25', '', '2025-10-13 23:45:25');
INSERT INTO `sj_retry_task` VALUES (855, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:46:25', '', '2025-10-13 23:46:25');
INSERT INTO `sj_retry_task` VALUES (856, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:46:25', '', '2025-10-13 23:46:25');
INSERT INTO `sj_retry_task` VALUES (857, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:47:25', '', '2025-10-13 23:47:25');
INSERT INTO `sj_retry_task` VALUES (858, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:47:25', '', '2025-10-13 23:47:25');
INSERT INTO `sj_retry_task` VALUES (859, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:48:25', '', '2025-10-13 23:48:25');
INSERT INTO `sj_retry_task` VALUES (860, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:48:25', '', '2025-10-13 23:48:25');
INSERT INTO `sj_retry_task` VALUES (861, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:49:25', '', '2025-10-13 23:49:25');
INSERT INTO `sj_retry_task` VALUES (862, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:49:25', '', '2025-10-13 23:49:25');
INSERT INTO `sj_retry_task` VALUES (863, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:50:25', '', '2025-10-13 23:50:25');
INSERT INTO `sj_retry_task` VALUES (864, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:50:25', '', '2025-10-13 23:50:25');
INSERT INTO `sj_retry_task` VALUES (865, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:51:25', '', '2025-10-13 23:51:25');
INSERT INTO `sj_retry_task` VALUES (866, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:51:25', '', '2025-10-13 23:51:25');
INSERT INTO `sj_retry_task` VALUES (867, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:52:25', '', '2025-10-13 23:52:25');
INSERT INTO `sj_retry_task` VALUES (868, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:52:25', '', '2025-10-13 23:52:25');
INSERT INTO `sj_retry_task` VALUES (869, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:53:25', '', '2025-10-13 23:53:25');
INSERT INTO `sj_retry_task` VALUES (870, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:53:25', '', '2025-10-13 23:53:25');
INSERT INTO `sj_retry_task` VALUES (871, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:54:25', '', '2025-10-13 23:54:25');
INSERT INTO `sj_retry_task` VALUES (872, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:54:25', '', '2025-10-13 23:54:25');
INSERT INTO `sj_retry_task` VALUES (873, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:55:25', '', '2025-10-13 23:55:25');
INSERT INTO `sj_retry_task` VALUES (874, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:55:25', '', '2025-10-13 23:55:25');
INSERT INTO `sj_retry_task` VALUES (875, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:56:25', '', '2025-10-13 23:56:25');
INSERT INTO `sj_retry_task` VALUES (876, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:56:25', '', '2025-10-13 23:56:25');
INSERT INTO `sj_retry_task` VALUES (877, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:57:25', '', '2025-10-13 23:57:25');
INSERT INTO `sj_retry_task` VALUES (878, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:57:25', '', '2025-10-13 23:57:25');
INSERT INTO `sj_retry_task` VALUES (879, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:58:25', '', '2025-10-13 23:58:25');
INSERT INTO `sj_retry_task` VALUES (880, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:58:25', '', '2025-10-13 23:58:25');
INSERT INTO `sj_retry_task` VALUES (881, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-13 23:59:25', '', '2025-10-13 23:59:25');
INSERT INTO `sj_retry_task` VALUES (882, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-13 23:59:25', '', '2025-10-13 23:59:25');
INSERT INTO `sj_retry_task` VALUES (883, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:00:25', '', '2025-10-14 00:00:25');
INSERT INTO `sj_retry_task` VALUES (884, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:00:25', '', '2025-10-14 00:00:25');
INSERT INTO `sj_retry_task` VALUES (885, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:01:25', '', '2025-10-14 00:01:25');
INSERT INTO `sj_retry_task` VALUES (886, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:01:25', '', '2025-10-14 00:01:25');
INSERT INTO `sj_retry_task` VALUES (887, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:02:25', '', '2025-10-14 00:02:25');
INSERT INTO `sj_retry_task` VALUES (888, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:02:25', '', '2025-10-14 00:02:25');
INSERT INTO `sj_retry_task` VALUES (889, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:03:25', '', '2025-10-14 00:03:25');
INSERT INTO `sj_retry_task` VALUES (890, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:03:25', '', '2025-10-14 00:03:25');
INSERT INTO `sj_retry_task` VALUES (891, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:04:25', '', '2025-10-14 00:04:25');
INSERT INTO `sj_retry_task` VALUES (892, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:04:25', '', '2025-10-14 00:04:25');
INSERT INTO `sj_retry_task` VALUES (893, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:05:25', '', '2025-10-14 00:05:25');
INSERT INTO `sj_retry_task` VALUES (894, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:05:25', '', '2025-10-14 00:05:25');
INSERT INTO `sj_retry_task` VALUES (895, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:06:25', '', '2025-10-14 00:06:25');
INSERT INTO `sj_retry_task` VALUES (896, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:06:25', '', '2025-10-14 00:06:25');
INSERT INTO `sj_retry_task` VALUES (897, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:07:25', '', '2025-10-14 00:07:25');
INSERT INTO `sj_retry_task` VALUES (898, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:07:25', '', '2025-10-14 00:07:25');
INSERT INTO `sj_retry_task` VALUES (899, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:08:25', '', '2025-10-14 00:08:25');
INSERT INTO `sj_retry_task` VALUES (900, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:08:25', '', '2025-10-14 00:08:25');
INSERT INTO `sj_retry_task` VALUES (901, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:09:25', '', '2025-10-14 00:09:25');
INSERT INTO `sj_retry_task` VALUES (902, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:09:25', '', '2025-10-14 00:09:25');
INSERT INTO `sj_retry_task` VALUES (903, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:10:25', '', '2025-10-14 00:10:25');
INSERT INTO `sj_retry_task` VALUES (904, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:10:25', '', '2025-10-14 00:10:25');
INSERT INTO `sj_retry_task` VALUES (905, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:11:25', '', '2025-10-14 00:11:25');
INSERT INTO `sj_retry_task` VALUES (906, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:11:25', '', '2025-10-14 00:11:25');
INSERT INTO `sj_retry_task` VALUES (907, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-14 00:12:25', '', '2025-10-14 00:12:25');
INSERT INTO `sj_retry_task` VALUES (908, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-14 00:12:25', '', '2025-10-14 00:12:25');
INSERT INTO `sj_retry_task` VALUES (909, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:28:52', '', '2025-10-18 11:28:52');
INSERT INTO `sj_retry_task` VALUES (910, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:28:52', '', '2025-10-18 11:28:52');
INSERT INTO `sj_retry_task` VALUES (911, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:29:52', '', '2025-10-18 11:29:52');
INSERT INTO `sj_retry_task` VALUES (912, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:29:52', '', '2025-10-18 11:29:52');
INSERT INTO `sj_retry_task` VALUES (913, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:30:52', '', '2025-10-18 11:30:52');
INSERT INTO `sj_retry_task` VALUES (914, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:30:52', '', '2025-10-18 11:30:52');
INSERT INTO `sj_retry_task` VALUES (915, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:32:54', '', '2025-10-18 11:32:54');
INSERT INTO `sj_retry_task` VALUES (916, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:32:54', '', '2025-10-18 11:32:54');
INSERT INTO `sj_retry_task` VALUES (917, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:33:54', '', '2025-10-18 11:33:54');
INSERT INTO `sj_retry_task` VALUES (918, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:33:54', '', '2025-10-18 11:33:54');
INSERT INTO `sj_retry_task` VALUES (919, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:34:54', '', '2025-10-18 11:34:54');
INSERT INTO `sj_retry_task` VALUES (920, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:34:54', '', '2025-10-18 11:34:54');
INSERT INTO `sj_retry_task` VALUES (921, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:35:54', '', '2025-10-18 11:35:54');
INSERT INTO `sj_retry_task` VALUES (922, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:35:54', '', '2025-10-18 11:35:54');
INSERT INTO `sj_retry_task` VALUES (923, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:36:54', '', '2025-10-18 11:36:54');
INSERT INTO `sj_retry_task` VALUES (924, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:36:54', '', '2025-10-18 11:36:54');
INSERT INTO `sj_retry_task` VALUES (925, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:37:54', '', '2025-10-18 11:37:54');
INSERT INTO `sj_retry_task` VALUES (926, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:37:54', '', '2025-10-18 11:37:54');
INSERT INTO `sj_retry_task` VALUES (927, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:38:54', '', '2025-10-18 11:38:54');
INSERT INTO `sj_retry_task` VALUES (928, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:38:54', '', '2025-10-18 11:38:54');
INSERT INTO `sj_retry_task` VALUES (929, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:39:54', '', '2025-10-18 11:39:54');
INSERT INTO `sj_retry_task` VALUES (930, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:39:54', '', '2025-10-18 11:39:54');
INSERT INTO `sj_retry_task` VALUES (931, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:40:54', '', '2025-10-18 11:40:54');
INSERT INTO `sj_retry_task` VALUES (932, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:40:54', '', '2025-10-18 11:40:54');
INSERT INTO `sj_retry_task` VALUES (933, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:41:54', '', '2025-10-18 11:41:54');
INSERT INTO `sj_retry_task` VALUES (934, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:41:54', '', '2025-10-18 11:41:54');
INSERT INTO `sj_retry_task` VALUES (935, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:42:54', '', '2025-10-18 11:42:54');
INSERT INTO `sj_retry_task` VALUES (936, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:42:54', '', '2025-10-18 11:42:54');
INSERT INTO `sj_retry_task` VALUES (937, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:43:54', '', '2025-10-18 11:43:54');
INSERT INTO `sj_retry_task` VALUES (938, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:43:54', '', '2025-10-18 11:43:54');
INSERT INTO `sj_retry_task` VALUES (939, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:45:12', '', '2025-10-18 11:45:12');
INSERT INTO `sj_retry_task` VALUES (940, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:45:12', '', '2025-10-18 11:45:12');
INSERT INTO `sj_retry_task` VALUES (941, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:46:12', '', '2025-10-18 11:46:12');
INSERT INTO `sj_retry_task` VALUES (942, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:46:12', '', '2025-10-18 11:46:12');
INSERT INTO `sj_retry_task` VALUES (943, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:47:12', '', '2025-10-18 11:47:12');
INSERT INTO `sj_retry_task` VALUES (944, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:47:12', '', '2025-10-18 11:47:12');
INSERT INTO `sj_retry_task` VALUES (945, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:48:12', '', '2025-10-18 11:48:12');
INSERT INTO `sj_retry_task` VALUES (946, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:48:12', '', '2025-10-18 11:48:12');
INSERT INTO `sj_retry_task` VALUES (947, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:49:12', '', '2025-10-18 11:49:12');
INSERT INTO `sj_retry_task` VALUES (948, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:49:12', '', '2025-10-18 11:49:12');
INSERT INTO `sj_retry_task` VALUES (949, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:50:12', '', '2025-10-18 11:50:12');
INSERT INTO `sj_retry_task` VALUES (950, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:50:12', '', '2025-10-18 11:50:12');
INSERT INTO `sj_retry_task` VALUES (951, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:51:12', '', '2025-10-18 11:51:12');
INSERT INTO `sj_retry_task` VALUES (952, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:51:12', '', '2025-10-18 11:51:12');
INSERT INTO `sj_retry_task` VALUES (953, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:52:12', '', '2025-10-18 11:52:12');
INSERT INTO `sj_retry_task` VALUES (954, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:52:12', '', '2025-10-18 11:52:12');
INSERT INTO `sj_retry_task` VALUES (955, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:53:12', '', '2025-10-18 11:53:12');
INSERT INTO `sj_retry_task` VALUES (956, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:53:12', '', '2025-10-18 11:53:12');
INSERT INTO `sj_retry_task` VALUES (957, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:54:12', '', '2025-10-18 11:54:12');
INSERT INTO `sj_retry_task` VALUES (958, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:54:12', '', '2025-10-18 11:54:12');
INSERT INTO `sj_retry_task` VALUES (959, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:55:12', '', '2025-10-18 11:55:12');
INSERT INTO `sj_retry_task` VALUES (960, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:55:12', '', '2025-10-18 11:55:12');
INSERT INTO `sj_retry_task` VALUES (961, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:56:12', '', '2025-10-18 11:56:12');
INSERT INTO `sj_retry_task` VALUES (962, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:56:12', '', '2025-10-18 11:56:12');
INSERT INTO `sj_retry_task` VALUES (963, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:57:12', '', '2025-10-18 11:57:12');
INSERT INTO `sj_retry_task` VALUES (964, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:57:12', '', '2025-10-18 11:57:12');
INSERT INTO `sj_retry_task` VALUES (965, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:58:12', '', '2025-10-18 11:58:12');
INSERT INTO `sj_retry_task` VALUES (966, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:58:12', '', '2025-10-18 11:58:12');
INSERT INTO `sj_retry_task` VALUES (967, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 11:59:12', '', '2025-10-18 11:59:12');
INSERT INTO `sj_retry_task` VALUES (968, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 11:59:12', '', '2025-10-18 11:59:12');
INSERT INTO `sj_retry_task` VALUES (969, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:00:12', '', '2025-10-18 12:00:12');
INSERT INTO `sj_retry_task` VALUES (970, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:00:12', '', '2025-10-18 12:00:12');
INSERT INTO `sj_retry_task` VALUES (971, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:01:12', '', '2025-10-18 12:01:12');
INSERT INTO `sj_retry_task` VALUES (972, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:01:12', '', '2025-10-18 12:01:12');
INSERT INTO `sj_retry_task` VALUES (973, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:02:12', '', '2025-10-18 12:02:12');
INSERT INTO `sj_retry_task` VALUES (974, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:02:12', '', '2025-10-18 12:02:12');
INSERT INTO `sj_retry_task` VALUES (975, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:03:12', '', '2025-10-18 12:03:12');
INSERT INTO `sj_retry_task` VALUES (976, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:03:12', '', '2025-10-18 12:03:12');
INSERT INTO `sj_retry_task` VALUES (977, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:04:12', '', '2025-10-18 12:04:12');
INSERT INTO `sj_retry_task` VALUES (978, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:04:12', '', '2025-10-18 12:04:12');
INSERT INTO `sj_retry_task` VALUES (979, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:05:12', '', '2025-10-18 12:05:12');
INSERT INTO `sj_retry_task` VALUES (980, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:05:12', '', '2025-10-18 12:05:12');
INSERT INTO `sj_retry_task` VALUES (981, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:06:12', '', '2025-10-18 12:06:12');
INSERT INTO `sj_retry_task` VALUES (982, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:06:12', '', '2025-10-18 12:06:12');
INSERT INTO `sj_retry_task` VALUES (983, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:07:12', '', '2025-10-18 12:07:12');
INSERT INTO `sj_retry_task` VALUES (984, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:07:12', '', '2025-10-18 12:07:12');
INSERT INTO `sj_retry_task` VALUES (985, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:08:12', '', '2025-10-18 12:08:12');
INSERT INTO `sj_retry_task` VALUES (986, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:08:12', '', '2025-10-18 12:08:12');
INSERT INTO `sj_retry_task` VALUES (987, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:09:12', '', '2025-10-18 12:09:12');
INSERT INTO `sj_retry_task` VALUES (988, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:09:12', '', '2025-10-18 12:09:12');
INSERT INTO `sj_retry_task` VALUES (989, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:10:12', '', '2025-10-18 12:10:12');
INSERT INTO `sj_retry_task` VALUES (990, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:10:12', '', '2025-10-18 12:10:12');
INSERT INTO `sj_retry_task` VALUES (991, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:11:12', '', '2025-10-18 12:11:12');
INSERT INTO `sj_retry_task` VALUES (992, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:11:12', '', '2025-10-18 12:11:12');
INSERT INTO `sj_retry_task` VALUES (993, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:12:12', '', '2025-10-18 12:12:12');
INSERT INTO `sj_retry_task` VALUES (994, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:12:12', '', '2025-10-18 12:12:12');
INSERT INTO `sj_retry_task` VALUES (995, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:13:12', '', '2025-10-18 12:13:12');
INSERT INTO `sj_retry_task` VALUES (996, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:13:12', '', '2025-10-18 12:13:12');
INSERT INTO `sj_retry_task` VALUES (997, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:14:12', '', '2025-10-18 12:14:12');
INSERT INTO `sj_retry_task` VALUES (998, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:14:12', '', '2025-10-18 12:14:12');
INSERT INTO `sj_retry_task` VALUES (999, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:15:12', '', '2025-10-18 12:15:12');
INSERT INTO `sj_retry_task` VALUES (1000, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:15:12', '', '2025-10-18 12:15:12');
INSERT INTO `sj_retry_task` VALUES (1001, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:16:12', '', '2025-10-18 12:16:12');
INSERT INTO `sj_retry_task` VALUES (1002, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:16:12', '', '2025-10-18 12:16:12');
INSERT INTO `sj_retry_task` VALUES (1003, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:17:12', '', '2025-10-18 12:17:12');
INSERT INTO `sj_retry_task` VALUES (1004, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:17:12', '', '2025-10-18 12:17:12');
INSERT INTO `sj_retry_task` VALUES (1005, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:18:12', '', '2025-10-18 12:18:12');
INSERT INTO `sj_retry_task` VALUES (1006, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:18:12', '', '2025-10-18 12:18:12');
INSERT INTO `sj_retry_task` VALUES (1007, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:19:12', '', '2025-10-18 12:19:12');
INSERT INTO `sj_retry_task` VALUES (1008, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:19:12', '', '2025-10-18 12:19:12');
INSERT INTO `sj_retry_task` VALUES (1009, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:20:12', '', '2025-10-18 12:20:12');
INSERT INTO `sj_retry_task` VALUES (1010, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:20:12', '', '2025-10-18 12:20:12');
INSERT INTO `sj_retry_task` VALUES (1011, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:21:12', '', '2025-10-18 12:21:12');
INSERT INTO `sj_retry_task` VALUES (1012, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:21:12', '', '2025-10-18 12:21:12');
INSERT INTO `sj_retry_task` VALUES (1013, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:22:12', '', '2025-10-18 12:22:12');
INSERT INTO `sj_retry_task` VALUES (1014, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:22:12', '', '2025-10-18 12:22:12');
INSERT INTO `sj_retry_task` VALUES (1015, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:23:12', '', '2025-10-18 12:23:12');
INSERT INTO `sj_retry_task` VALUES (1016, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:23:12', '', '2025-10-18 12:23:12');
INSERT INTO `sj_retry_task` VALUES (1017, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:24:12', '', '2025-10-18 12:24:12');
INSERT INTO `sj_retry_task` VALUES (1018, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:24:12', '', '2025-10-18 12:24:12');
INSERT INTO `sj_retry_task` VALUES (1019, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:25:12', '', '2025-10-18 12:25:12');
INSERT INTO `sj_retry_task` VALUES (1020, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:25:12', '', '2025-10-18 12:25:12');
INSERT INTO `sj_retry_task` VALUES (1021, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:26:12', '', '2025-10-18 12:26:12');
INSERT INTO `sj_retry_task` VALUES (1022, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:26:12', '', '2025-10-18 12:26:12');
INSERT INTO `sj_retry_task` VALUES (1023, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:27:12', '', '2025-10-18 12:27:12');
INSERT INTO `sj_retry_task` VALUES (1024, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:27:12', '', '2025-10-18 12:27:12');
INSERT INTO `sj_retry_task` VALUES (1025, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:28:12', '', '2025-10-18 12:28:12');
INSERT INTO `sj_retry_task` VALUES (1026, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:28:12', '', '2025-10-18 12:28:12');
INSERT INTO `sj_retry_task` VALUES (1027, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:29:12', '', '2025-10-18 12:29:12');
INSERT INTO `sj_retry_task` VALUES (1028, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:29:12', '', '2025-10-18 12:29:12');
INSERT INTO `sj_retry_task` VALUES (1029, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:30:12', '', '2025-10-18 12:30:12');
INSERT INTO `sj_retry_task` VALUES (1030, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:30:12', '', '2025-10-18 12:30:12');
INSERT INTO `sj_retry_task` VALUES (1031, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:31:12', '', '2025-10-18 12:31:12');
INSERT INTO `sj_retry_task` VALUES (1032, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:31:12', '', '2025-10-18 12:31:12');
INSERT INTO `sj_retry_task` VALUES (1033, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:32:12', '', '2025-10-18 12:32:12');
INSERT INTO `sj_retry_task` VALUES (1034, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:32:12', '', '2025-10-18 12:32:12');
INSERT INTO `sj_retry_task` VALUES (1035, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:33:12', '', '2025-10-18 12:33:12');
INSERT INTO `sj_retry_task` VALUES (1036, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:33:12', '', '2025-10-18 12:33:12');
INSERT INTO `sj_retry_task` VALUES (1037, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:34:12', '', '2025-10-18 12:34:12');
INSERT INTO `sj_retry_task` VALUES (1038, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:34:12', '', '2025-10-18 12:34:12');
INSERT INTO `sj_retry_task` VALUES (1039, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:35:12', '', '2025-10-18 12:35:12');
INSERT INTO `sj_retry_task` VALUES (1040, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:35:12', '', '2025-10-18 12:35:12');
INSERT INTO `sj_retry_task` VALUES (1041, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:36:12', '', '2025-10-18 12:36:12');
INSERT INTO `sj_retry_task` VALUES (1042, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:36:12', '', '2025-10-18 12:36:12');
INSERT INTO `sj_retry_task` VALUES (1043, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:37:12', '', '2025-10-18 12:37:12');
INSERT INTO `sj_retry_task` VALUES (1044, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:37:12', '', '2025-10-18 12:37:12');
INSERT INTO `sj_retry_task` VALUES (1045, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:38:12', '', '2025-10-18 12:38:12');
INSERT INTO `sj_retry_task` VALUES (1046, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:38:12', '', '2025-10-18 12:38:12');
INSERT INTO `sj_retry_task` VALUES (1047, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:39:12', '', '2025-10-18 12:39:12');
INSERT INTO `sj_retry_task` VALUES (1048, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:39:12', '', '2025-10-18 12:39:12');
INSERT INTO `sj_retry_task` VALUES (1049, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:40:12', '', '2025-10-18 12:40:12');
INSERT INTO `sj_retry_task` VALUES (1050, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:40:12', '', '2025-10-18 12:40:12');
INSERT INTO `sj_retry_task` VALUES (1051, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:41:12', '', '2025-10-18 12:41:12');
INSERT INTO `sj_retry_task` VALUES (1052, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:41:12', '', '2025-10-18 12:41:12');
INSERT INTO `sj_retry_task` VALUES (1053, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:42:12', '', '2025-10-18 12:42:12');
INSERT INTO `sj_retry_task` VALUES (1054, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:42:12', '', '2025-10-18 12:42:12');
INSERT INTO `sj_retry_task` VALUES (1055, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:43:12', '', '2025-10-18 12:43:12');
INSERT INTO `sj_retry_task` VALUES (1056, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:43:12', '', '2025-10-18 12:43:12');
INSERT INTO `sj_retry_task` VALUES (1057, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:44:12', '', '2025-10-18 12:44:12');
INSERT INTO `sj_retry_task` VALUES (1058, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:44:12', '', '2025-10-18 12:44:12');
INSERT INTO `sj_retry_task` VALUES (1059, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:45:12', '', '2025-10-18 12:45:12');
INSERT INTO `sj_retry_task` VALUES (1060, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:45:12', '', '2025-10-18 12:45:12');
INSERT INTO `sj_retry_task` VALUES (1061, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:46:12', '', '2025-10-18 12:46:12');
INSERT INTO `sj_retry_task` VALUES (1062, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:46:12', '', '2025-10-18 12:46:12');
INSERT INTO `sj_retry_task` VALUES (1063, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:47:12', '', '2025-10-18 12:47:12');
INSERT INTO `sj_retry_task` VALUES (1064, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:47:12', '', '2025-10-18 12:47:12');
INSERT INTO `sj_retry_task` VALUES (1065, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:48:12', '', '2025-10-18 12:48:12');
INSERT INTO `sj_retry_task` VALUES (1066, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:48:12', '', '2025-10-18 12:48:12');
INSERT INTO `sj_retry_task` VALUES (1067, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:49:12', '', '2025-10-18 12:49:12');
INSERT INTO `sj_retry_task` VALUES (1068, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:49:12', '', '2025-10-18 12:49:12');
INSERT INTO `sj_retry_task` VALUES (1069, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:50:12', '', '2025-10-18 12:50:12');
INSERT INTO `sj_retry_task` VALUES (1070, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:50:12', '', '2025-10-18 12:50:12');
INSERT INTO `sj_retry_task` VALUES (1071, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:51:12', '', '2025-10-18 12:51:12');
INSERT INTO `sj_retry_task` VALUES (1072, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:51:12', '', '2025-10-18 12:51:12');
INSERT INTO `sj_retry_task` VALUES (1073, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:52:12', '', '2025-10-18 12:52:12');
INSERT INTO `sj_retry_task` VALUES (1074, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:52:12', '', '2025-10-18 12:52:12');
INSERT INTO `sj_retry_task` VALUES (1075, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:53:12', '', '2025-10-18 12:53:12');
INSERT INTO `sj_retry_task` VALUES (1076, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:53:12', '', '2025-10-18 12:53:12');
INSERT INTO `sj_retry_task` VALUES (1077, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:54:12', '', '2025-10-18 12:54:12');
INSERT INTO `sj_retry_task` VALUES (1078, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:54:12', '', '2025-10-18 12:54:12');
INSERT INTO `sj_retry_task` VALUES (1079, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:55:12', '', '2025-10-18 12:55:12');
INSERT INTO `sj_retry_task` VALUES (1080, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:55:12', '', '2025-10-18 12:55:12');
INSERT INTO `sj_retry_task` VALUES (1081, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:56:12', '', '2025-10-18 12:56:12');
INSERT INTO `sj_retry_task` VALUES (1082, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:56:12', '', '2025-10-18 12:56:12');
INSERT INTO `sj_retry_task` VALUES (1083, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:57:12', '', '2025-10-18 12:57:12');
INSERT INTO `sj_retry_task` VALUES (1084, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:57:12', '', '2025-10-18 12:57:12');
INSERT INTO `sj_retry_task` VALUES (1085, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:58:12', '', '2025-10-18 12:58:12');
INSERT INTO `sj_retry_task` VALUES (1086, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:58:12', '', '2025-10-18 12:58:12');
INSERT INTO `sj_retry_task` VALUES (1087, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 12:59:12', '', '2025-10-18 12:59:12');
INSERT INTO `sj_retry_task` VALUES (1088, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 12:59:12', '', '2025-10-18 12:59:12');
INSERT INTO `sj_retry_task` VALUES (1089, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:00:12', '', '2025-10-18 13:00:12');
INSERT INTO `sj_retry_task` VALUES (1090, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:00:12', '', '2025-10-18 13:00:12');
INSERT INTO `sj_retry_task` VALUES (1091, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:01:12', '', '2025-10-18 13:01:12');
INSERT INTO `sj_retry_task` VALUES (1092, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:01:12', '', '2025-10-18 13:01:12');
INSERT INTO `sj_retry_task` VALUES (1093, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:02:12', '', '2025-10-18 13:02:12');
INSERT INTO `sj_retry_task` VALUES (1094, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:02:12', '', '2025-10-18 13:02:12');
INSERT INTO `sj_retry_task` VALUES (1095, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:03:12', '', '2025-10-18 13:03:12');
INSERT INTO `sj_retry_task` VALUES (1096, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:03:12', '', '2025-10-18 13:03:12');
INSERT INTO `sj_retry_task` VALUES (1097, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:04:12', '', '2025-10-18 13:04:12');
INSERT INTO `sj_retry_task` VALUES (1098, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:04:12', '', '2025-10-18 13:04:12');
INSERT INTO `sj_retry_task` VALUES (1099, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:05:12', '', '2025-10-18 13:05:12');
INSERT INTO `sj_retry_task` VALUES (1100, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:05:12', '', '2025-10-18 13:05:12');
INSERT INTO `sj_retry_task` VALUES (1101, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:06:12', '', '2025-10-18 13:06:12');
INSERT INTO `sj_retry_task` VALUES (1102, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:06:12', '', '2025-10-18 13:06:12');
INSERT INTO `sj_retry_task` VALUES (1103, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:07:12', '', '2025-10-18 13:07:12');
INSERT INTO `sj_retry_task` VALUES (1104, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:07:12', '', '2025-10-18 13:07:12');
INSERT INTO `sj_retry_task` VALUES (1105, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:08:12', '', '2025-10-18 13:08:12');
INSERT INTO `sj_retry_task` VALUES (1106, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:08:12', '', '2025-10-18 13:08:12');
INSERT INTO `sj_retry_task` VALUES (1107, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:09:12', '', '2025-10-18 13:09:12');
INSERT INTO `sj_retry_task` VALUES (1108, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:09:12', '', '2025-10-18 13:09:12');
INSERT INTO `sj_retry_task` VALUES (1109, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:10:12', '', '2025-10-18 13:10:12');
INSERT INTO `sj_retry_task` VALUES (1110, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:10:12', '', '2025-10-18 13:10:12');
INSERT INTO `sj_retry_task` VALUES (1111, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:11:12', '', '2025-10-18 13:11:12');
INSERT INTO `sj_retry_task` VALUES (1112, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:11:12', '', '2025-10-18 13:11:12');
INSERT INTO `sj_retry_task` VALUES (1113, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:12:12', '', '2025-10-18 13:12:12');
INSERT INTO `sj_retry_task` VALUES (1114, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:12:12', '', '2025-10-18 13:12:12');
INSERT INTO `sj_retry_task` VALUES (1115, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:13:12', '', '2025-10-18 13:13:12');
INSERT INTO `sj_retry_task` VALUES (1116, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:13:12', '', '2025-10-18 13:13:12');
INSERT INTO `sj_retry_task` VALUES (1117, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:14:12', '', '2025-10-18 13:14:12');
INSERT INTO `sj_retry_task` VALUES (1118, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:14:12', '', '2025-10-18 13:14:12');
INSERT INTO `sj_retry_task` VALUES (1119, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:15:12', '', '2025-10-18 13:15:12');
INSERT INTO `sj_retry_task` VALUES (1120, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:15:12', '', '2025-10-18 13:15:12');
INSERT INTO `sj_retry_task` VALUES (1121, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:16:12', '', '2025-10-18 13:16:12');
INSERT INTO `sj_retry_task` VALUES (1122, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:16:12', '', '2025-10-18 13:16:12');
INSERT INTO `sj_retry_task` VALUES (1123, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:17:12', '', '2025-10-18 13:17:12');
INSERT INTO `sj_retry_task` VALUES (1124, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:17:12', '', '2025-10-18 13:17:12');
INSERT INTO `sj_retry_task` VALUES (1125, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:18:12', '', '2025-10-18 13:18:12');
INSERT INTO `sj_retry_task` VALUES (1126, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:18:12', '', '2025-10-18 13:18:12');
INSERT INTO `sj_retry_task` VALUES (1127, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:19:12', '', '2025-10-18 13:19:12');
INSERT INTO `sj_retry_task` VALUES (1128, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:19:12', '', '2025-10-18 13:19:12');
INSERT INTO `sj_retry_task` VALUES (1129, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:20:12', '', '2025-10-18 13:20:12');
INSERT INTO `sj_retry_task` VALUES (1130, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:20:12', '', '2025-10-18 13:20:12');
INSERT INTO `sj_retry_task` VALUES (1131, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:21:12', '', '2025-10-18 13:21:12');
INSERT INTO `sj_retry_task` VALUES (1132, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:21:12', '', '2025-10-18 13:21:12');
INSERT INTO `sj_retry_task` VALUES (1133, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:22:12', '', '2025-10-18 13:22:12');
INSERT INTO `sj_retry_task` VALUES (1134, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:22:12', '', '2025-10-18 13:22:12');
INSERT INTO `sj_retry_task` VALUES (1135, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:23:12', '', '2025-10-18 13:23:12');
INSERT INTO `sj_retry_task` VALUES (1136, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:23:12', '', '2025-10-18 13:23:12');
INSERT INTO `sj_retry_task` VALUES (1137, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:24:12', '', '2025-10-18 13:24:12');
INSERT INTO `sj_retry_task` VALUES (1138, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:24:12', '', '2025-10-18 13:24:12');
INSERT INTO `sj_retry_task` VALUES (1139, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:25:12', '', '2025-10-18 13:25:12');
INSERT INTO `sj_retry_task` VALUES (1140, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:25:12', '', '2025-10-18 13:25:12');
INSERT INTO `sj_retry_task` VALUES (1141, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:26:12', '', '2025-10-18 13:26:12');
INSERT INTO `sj_retry_task` VALUES (1142, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:26:12', '', '2025-10-18 13:26:12');
INSERT INTO `sj_retry_task` VALUES (1143, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:27:12', '', '2025-10-18 13:27:12');
INSERT INTO `sj_retry_task` VALUES (1144, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:27:12', '', '2025-10-18 13:27:12');
INSERT INTO `sj_retry_task` VALUES (1145, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:28:12', '', '2025-10-18 13:28:12');
INSERT INTO `sj_retry_task` VALUES (1146, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:28:12', '', '2025-10-18 13:28:12');
INSERT INTO `sj_retry_task` VALUES (1147, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:29:12', '', '2025-10-18 13:29:12');
INSERT INTO `sj_retry_task` VALUES (1148, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:29:12', '', '2025-10-18 13:29:12');
INSERT INTO `sj_retry_task` VALUES (1149, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:30:12', '', '2025-10-18 13:30:12');
INSERT INTO `sj_retry_task` VALUES (1150, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:30:12', '', '2025-10-18 13:30:12');
INSERT INTO `sj_retry_task` VALUES (1151, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:31:12', '', '2025-10-18 13:31:12');
INSERT INTO `sj_retry_task` VALUES (1152, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:31:12', '', '2025-10-18 13:31:12');
INSERT INTO `sj_retry_task` VALUES (1153, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:32:12', '', '2025-10-18 13:32:12');
INSERT INTO `sj_retry_task` VALUES (1154, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:32:12', '', '2025-10-18 13:32:12');
INSERT INTO `sj_retry_task` VALUES (1155, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:33:12', '', '2025-10-18 13:33:12');
INSERT INTO `sj_retry_task` VALUES (1156, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:33:12', '', '2025-10-18 13:33:12');
INSERT INTO `sj_retry_task` VALUES (1157, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:34:12', '', '2025-10-18 13:34:12');
INSERT INTO `sj_retry_task` VALUES (1158, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:34:12', '', '2025-10-18 13:34:12');
INSERT INTO `sj_retry_task` VALUES (1159, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:35:12', '', '2025-10-18 13:35:12');
INSERT INTO `sj_retry_task` VALUES (1160, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:35:12', '', '2025-10-18 13:35:12');
INSERT INTO `sj_retry_task` VALUES (1161, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:36:12', '', '2025-10-18 13:36:12');
INSERT INTO `sj_retry_task` VALUES (1162, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:36:12', '', '2025-10-18 13:36:12');
INSERT INTO `sj_retry_task` VALUES (1163, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:37:12', '', '2025-10-18 13:37:12');
INSERT INTO `sj_retry_task` VALUES (1164, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:37:12', '', '2025-10-18 13:37:12');
INSERT INTO `sj_retry_task` VALUES (1165, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:38:12', '', '2025-10-18 13:38:12');
INSERT INTO `sj_retry_task` VALUES (1166, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:38:12', '', '2025-10-18 13:38:12');
INSERT INTO `sj_retry_task` VALUES (1167, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:39:12', '', '2025-10-18 13:39:12');
INSERT INTO `sj_retry_task` VALUES (1168, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:39:12', '', '2025-10-18 13:39:12');
INSERT INTO `sj_retry_task` VALUES (1169, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:40:12', '', '2025-10-18 13:40:12');
INSERT INTO `sj_retry_task` VALUES (1170, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:40:12', '', '2025-10-18 13:40:12');
INSERT INTO `sj_retry_task` VALUES (1171, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:41:12', '', '2025-10-18 13:41:12');
INSERT INTO `sj_retry_task` VALUES (1172, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:41:12', '', '2025-10-18 13:41:12');
INSERT INTO `sj_retry_task` VALUES (1173, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:42:12', '', '2025-10-18 13:42:12');
INSERT INTO `sj_retry_task` VALUES (1174, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:42:12', '', '2025-10-18 13:42:12');
INSERT INTO `sj_retry_task` VALUES (1175, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:43:12', '', '2025-10-18 13:43:12');
INSERT INTO `sj_retry_task` VALUES (1176, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:43:12', '', '2025-10-18 13:43:12');
INSERT INTO `sj_retry_task` VALUES (1177, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:44:12', '', '2025-10-18 13:44:12');
INSERT INTO `sj_retry_task` VALUES (1178, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:44:12', '', '2025-10-18 13:44:12');
INSERT INTO `sj_retry_task` VALUES (1179, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:45:12', '', '2025-10-18 13:45:12');
INSERT INTO `sj_retry_task` VALUES (1180, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:45:12', '', '2025-10-18 13:45:12');
INSERT INTO `sj_retry_task` VALUES (1181, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:46:12', '', '2025-10-18 13:46:12');
INSERT INTO `sj_retry_task` VALUES (1182, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:46:12', '', '2025-10-18 13:46:12');
INSERT INTO `sj_retry_task` VALUES (1183, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:47:12', '', '2025-10-18 13:47:12');
INSERT INTO `sj_retry_task` VALUES (1184, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:47:12', '', '2025-10-18 13:47:12');
INSERT INTO `sj_retry_task` VALUES (1185, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:48:12', '', '2025-10-18 13:48:12');
INSERT INTO `sj_retry_task` VALUES (1186, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:48:12', '', '2025-10-18 13:48:12');
INSERT INTO `sj_retry_task` VALUES (1187, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:49:12', '', '2025-10-18 13:49:12');
INSERT INTO `sj_retry_task` VALUES (1188, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:49:12', '', '2025-10-18 13:49:12');
INSERT INTO `sj_retry_task` VALUES (1189, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:50:12', '', '2025-10-18 13:50:12');
INSERT INTO `sj_retry_task` VALUES (1190, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:50:12', '', '2025-10-18 13:50:12');
INSERT INTO `sj_retry_task` VALUES (1191, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:51:12', '', '2025-10-18 13:51:12');
INSERT INTO `sj_retry_task` VALUES (1192, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:51:12', '', '2025-10-18 13:51:12');
INSERT INTO `sj_retry_task` VALUES (1193, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:52:12', '', '2025-10-18 13:52:12');
INSERT INTO `sj_retry_task` VALUES (1194, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:52:12', '', '2025-10-18 13:52:12');
INSERT INTO `sj_retry_task` VALUES (1195, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:53:12', '', '2025-10-18 13:53:12');
INSERT INTO `sj_retry_task` VALUES (1196, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:53:12', '', '2025-10-18 13:53:12');
INSERT INTO `sj_retry_task` VALUES (1197, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:54:12', '', '2025-10-18 13:54:12');
INSERT INTO `sj_retry_task` VALUES (1198, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:54:12', '', '2025-10-18 13:54:12');
INSERT INTO `sj_retry_task` VALUES (1199, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:55:12', '', '2025-10-18 13:55:12');
INSERT INTO `sj_retry_task` VALUES (1200, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:55:12', '', '2025-10-18 13:55:12');
INSERT INTO `sj_retry_task` VALUES (1201, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:56:12', '', '2025-10-18 13:56:12');
INSERT INTO `sj_retry_task` VALUES (1202, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:56:12', '', '2025-10-18 13:56:12');
INSERT INTO `sj_retry_task` VALUES (1203, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:57:12', '', '2025-10-18 13:57:12');
INSERT INTO `sj_retry_task` VALUES (1204, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:57:12', '', '2025-10-18 13:57:12');
INSERT INTO `sj_retry_task` VALUES (1205, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:58:12', '', '2025-10-18 13:58:12');
INSERT INTO `sj_retry_task` VALUES (1206, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:58:12', '', '2025-10-18 13:58:12');
INSERT INTO `sj_retry_task` VALUES (1207, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 13:59:12', '', '2025-10-18 13:59:12');
INSERT INTO `sj_retry_task` VALUES (1208, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 13:59:12', '', '2025-10-18 13:59:12');
INSERT INTO `sj_retry_task` VALUES (1209, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:00:12', '', '2025-10-18 14:00:12');
INSERT INTO `sj_retry_task` VALUES (1210, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:00:12', '', '2025-10-18 14:00:12');
INSERT INTO `sj_retry_task` VALUES (1211, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:01:12', '', '2025-10-18 14:01:12');
INSERT INTO `sj_retry_task` VALUES (1212, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:01:12', '', '2025-10-18 14:01:12');
INSERT INTO `sj_retry_task` VALUES (1213, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:02:12', '', '2025-10-18 14:02:12');
INSERT INTO `sj_retry_task` VALUES (1214, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:02:12', '', '2025-10-18 14:02:12');
INSERT INTO `sj_retry_task` VALUES (1215, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:03:12', '', '2025-10-18 14:03:12');
INSERT INTO `sj_retry_task` VALUES (1216, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:03:12', '', '2025-10-18 14:03:12');
INSERT INTO `sj_retry_task` VALUES (1217, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:04:12', '', '2025-10-18 14:04:12');
INSERT INTO `sj_retry_task` VALUES (1218, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:04:12', '', '2025-10-18 14:04:12');
INSERT INTO `sj_retry_task` VALUES (1219, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:05:12', '', '2025-10-18 14:05:12');
INSERT INTO `sj_retry_task` VALUES (1220, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:05:12', '', '2025-10-18 14:05:12');
INSERT INTO `sj_retry_task` VALUES (1221, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:06:12', '', '2025-10-18 14:06:12');
INSERT INTO `sj_retry_task` VALUES (1222, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:06:12', '', '2025-10-18 14:06:12');
INSERT INTO `sj_retry_task` VALUES (1223, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-18 14:07:12', '', '2025-10-18 14:07:12');
INSERT INTO `sj_retry_task` VALUES (1224, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-18 14:07:12', '', '2025-10-18 14:07:12');
INSERT INTO `sj_retry_task` VALUES (1225, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 10:55:33', '', '2025-10-19 10:55:33');
INSERT INTO `sj_retry_task` VALUES (1226, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 10:55:33', '', '2025-10-19 10:55:33');
INSERT INTO `sj_retry_task` VALUES (1227, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 10:56:33', '', '2025-10-19 10:56:33');
INSERT INTO `sj_retry_task` VALUES (1228, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 10:56:33', '', '2025-10-19 10:56:33');
INSERT INTO `sj_retry_task` VALUES (1229, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 10:57:33', '', '2025-10-19 10:57:33');
INSERT INTO `sj_retry_task` VALUES (1230, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 10:57:33', '', '2025-10-19 10:57:33');
INSERT INTO `sj_retry_task` VALUES (1231, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 10:58:33', '', '2025-10-19 10:58:33');
INSERT INTO `sj_retry_task` VALUES (1232, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 10:58:33', '', '2025-10-19 10:58:33');
INSERT INTO `sj_retry_task` VALUES (1233, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 10:59:33', '', '2025-10-19 10:59:33');
INSERT INTO `sj_retry_task` VALUES (1234, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 10:59:33', '', '2025-10-19 10:59:33');
INSERT INTO `sj_retry_task` VALUES (1235, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:00:33', '', '2025-10-19 11:00:33');
INSERT INTO `sj_retry_task` VALUES (1236, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:00:33', '', '2025-10-19 11:00:33');
INSERT INTO `sj_retry_task` VALUES (1237, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:01:33', '', '2025-10-19 11:01:33');
INSERT INTO `sj_retry_task` VALUES (1238, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:01:33', '', '2025-10-19 11:01:33');
INSERT INTO `sj_retry_task` VALUES (1239, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:02:33', '', '2025-10-19 11:02:33');
INSERT INTO `sj_retry_task` VALUES (1240, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:02:33', '', '2025-10-19 11:02:33');
INSERT INTO `sj_retry_task` VALUES (1241, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:03:33', '', '2025-10-19 11:03:33');
INSERT INTO `sj_retry_task` VALUES (1242, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:03:33', '', '2025-10-19 11:03:33');
INSERT INTO `sj_retry_task` VALUES (1243, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:04:33', '', '2025-10-19 11:04:33');
INSERT INTO `sj_retry_task` VALUES (1244, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:04:33', '', '2025-10-19 11:04:33');
INSERT INTO `sj_retry_task` VALUES (1245, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:05:34', '', '2025-10-19 11:05:34');
INSERT INTO `sj_retry_task` VALUES (1246, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:05:34', '', '2025-10-19 11:05:34');
INSERT INTO `sj_retry_task` VALUES (1247, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:06:33', '', '2025-10-19 11:06:33');
INSERT INTO `sj_retry_task` VALUES (1248, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:06:33', '', '2025-10-19 11:06:33');
INSERT INTO `sj_retry_task` VALUES (1249, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:07:33', '', '2025-10-19 11:07:33');
INSERT INTO `sj_retry_task` VALUES (1250, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:07:33', '', '2025-10-19 11:07:33');
INSERT INTO `sj_retry_task` VALUES (1251, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:08:33', '', '2025-10-19 11:08:33');
INSERT INTO `sj_retry_task` VALUES (1252, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:08:33', '', '2025-10-19 11:08:33');
INSERT INTO `sj_retry_task` VALUES (1253, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:09:33', '', '2025-10-19 11:09:33');
INSERT INTO `sj_retry_task` VALUES (1254, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:09:33', '', '2025-10-19 11:09:33');
INSERT INTO `sj_retry_task` VALUES (1255, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:10:33', '', '2025-10-19 11:10:33');
INSERT INTO `sj_retry_task` VALUES (1256, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:10:33', '', '2025-10-19 11:10:33');
INSERT INTO `sj_retry_task` VALUES (1257, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:11:33', '', '2025-10-19 11:11:33');
INSERT INTO `sj_retry_task` VALUES (1258, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:11:33', '', '2025-10-19 11:11:33');
INSERT INTO `sj_retry_task` VALUES (1259, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:12:33', '', '2025-10-19 11:12:33');
INSERT INTO `sj_retry_task` VALUES (1260, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:12:33', '', '2025-10-19 11:12:33');
INSERT INTO `sj_retry_task` VALUES (1261, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:13:33', '', '2025-10-19 11:13:33');
INSERT INTO `sj_retry_task` VALUES (1262, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:13:33', '', '2025-10-19 11:13:33');
INSERT INTO `sj_retry_task` VALUES (1263, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:14:33', '', '2025-10-19 11:14:33');
INSERT INTO `sj_retry_task` VALUES (1264, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:14:33', '', '2025-10-19 11:14:33');
INSERT INTO `sj_retry_task` VALUES (1265, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:15:33', '', '2025-10-19 11:15:33');
INSERT INTO `sj_retry_task` VALUES (1266, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:15:33', '', '2025-10-19 11:15:33');
INSERT INTO `sj_retry_task` VALUES (1267, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:16:33', '', '2025-10-19 11:16:33');
INSERT INTO `sj_retry_task` VALUES (1268, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:16:33', '', '2025-10-19 11:16:33');
INSERT INTO `sj_retry_task` VALUES (1269, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:17:33', '', '2025-10-19 11:17:33');
INSERT INTO `sj_retry_task` VALUES (1270, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:17:33', '', '2025-10-19 11:17:33');
INSERT INTO `sj_retry_task` VALUES (1271, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:18:33', '', '2025-10-19 11:18:33');
INSERT INTO `sj_retry_task` VALUES (1272, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:18:33', '', '2025-10-19 11:18:33');
INSERT INTO `sj_retry_task` VALUES (1273, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:19:33', '', '2025-10-19 11:19:33');
INSERT INTO `sj_retry_task` VALUES (1274, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:19:33', '', '2025-10-19 11:19:33');
INSERT INTO `sj_retry_task` VALUES (1275, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:20:33', '', '2025-10-19 11:20:33');
INSERT INTO `sj_retry_task` VALUES (1276, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:20:33', '', '2025-10-19 11:20:33');
INSERT INTO `sj_retry_task` VALUES (1277, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:21:33', '', '2025-10-19 11:21:33');
INSERT INTO `sj_retry_task` VALUES (1278, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:21:33', '', '2025-10-19 11:21:33');
INSERT INTO `sj_retry_task` VALUES (1279, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:22:33', '', '2025-10-19 11:22:33');
INSERT INTO `sj_retry_task` VALUES (1280, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:22:33', '', '2025-10-19 11:22:33');
INSERT INTO `sj_retry_task` VALUES (1281, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:23:34', '', '2025-10-19 11:23:34');
INSERT INTO `sj_retry_task` VALUES (1282, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:23:34', '', '2025-10-19 11:23:34');
INSERT INTO `sj_retry_task` VALUES (1283, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:24:33', '', '2025-10-19 11:24:33');
INSERT INTO `sj_retry_task` VALUES (1284, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:24:33', '', '2025-10-19 11:24:33');
INSERT INTO `sj_retry_task` VALUES (1285, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:25:33', '', '2025-10-19 11:25:33');
INSERT INTO `sj_retry_task` VALUES (1286, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:25:33', '', '2025-10-19 11:25:33');
INSERT INTO `sj_retry_task` VALUES (1287, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:26:33', '', '2025-10-19 11:26:33');
INSERT INTO `sj_retry_task` VALUES (1288, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:26:33', '', '2025-10-19 11:26:33');
INSERT INTO `sj_retry_task` VALUES (1289, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:27:33', '', '2025-10-19 11:27:33');
INSERT INTO `sj_retry_task` VALUES (1290, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:27:33', '', '2025-10-19 11:27:33');
INSERT INTO `sj_retry_task` VALUES (1291, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:28:33', '', '2025-10-19 11:28:33');
INSERT INTO `sj_retry_task` VALUES (1292, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:28:33', '', '2025-10-19 11:28:33');
INSERT INTO `sj_retry_task` VALUES (1293, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:29:33', '', '2025-10-19 11:29:33');
INSERT INTO `sj_retry_task` VALUES (1294, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:29:33', '', '2025-10-19 11:29:33');
INSERT INTO `sj_retry_task` VALUES (1295, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:30:33', '', '2025-10-19 11:30:33');
INSERT INTO `sj_retry_task` VALUES (1296, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:30:33', '', '2025-10-19 11:30:33');
INSERT INTO `sj_retry_task` VALUES (1297, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:31:33', '', '2025-10-19 11:31:33');
INSERT INTO `sj_retry_task` VALUES (1298, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:31:33', '', '2025-10-19 11:31:33');
INSERT INTO `sj_retry_task` VALUES (1299, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:32:33', '', '2025-10-19 11:32:33');
INSERT INTO `sj_retry_task` VALUES (1300, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:32:33', '', '2025-10-19 11:32:33');
INSERT INTO `sj_retry_task` VALUES (1301, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:33:33', '', '2025-10-19 11:33:33');
INSERT INTO `sj_retry_task` VALUES (1302, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:33:33', '', '2025-10-19 11:33:33');
INSERT INTO `sj_retry_task` VALUES (1303, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:34:33', '', '2025-10-19 11:34:33');
INSERT INTO `sj_retry_task` VALUES (1304, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:34:33', '', '2025-10-19 11:34:33');
INSERT INTO `sj_retry_task` VALUES (1305, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:35:33', '', '2025-10-19 11:35:33');
INSERT INTO `sj_retry_task` VALUES (1306, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:35:33', '', '2025-10-19 11:35:33');
INSERT INTO `sj_retry_task` VALUES (1307, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:36:34', '', '2025-10-19 11:36:34');
INSERT INTO `sj_retry_task` VALUES (1308, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:36:34', '', '2025-10-19 11:36:34');
INSERT INTO `sj_retry_task` VALUES (1309, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:37:33', '', '2025-10-19 11:37:33');
INSERT INTO `sj_retry_task` VALUES (1310, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:37:33', '', '2025-10-19 11:37:33');
INSERT INTO `sj_retry_task` VALUES (1311, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:38:33', '', '2025-10-19 11:38:33');
INSERT INTO `sj_retry_task` VALUES (1312, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:38:33', '', '2025-10-19 11:38:33');
INSERT INTO `sj_retry_task` VALUES (1313, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:39:33', '', '2025-10-19 11:39:33');
INSERT INTO `sj_retry_task` VALUES (1314, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:39:33', '', '2025-10-19 11:39:33');
INSERT INTO `sj_retry_task` VALUES (1315, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:40:33', '', '2025-10-19 11:40:33');
INSERT INTO `sj_retry_task` VALUES (1316, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:40:33', '', '2025-10-19 11:40:33');
INSERT INTO `sj_retry_task` VALUES (1317, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:41:33', '', '2025-10-19 11:41:33');
INSERT INTO `sj_retry_task` VALUES (1318, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:41:33', '', '2025-10-19 11:41:33');
INSERT INTO `sj_retry_task` VALUES (1319, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:42:33', '', '2025-10-19 11:42:33');
INSERT INTO `sj_retry_task` VALUES (1320, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:42:33', '', '2025-10-19 11:42:33');
INSERT INTO `sj_retry_task` VALUES (1321, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:43:33', '', '2025-10-19 11:43:33');
INSERT INTO `sj_retry_task` VALUES (1322, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:43:33', '', '2025-10-19 11:43:33');
INSERT INTO `sj_retry_task` VALUES (1323, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:44:33', '', '2025-10-19 11:44:33');
INSERT INTO `sj_retry_task` VALUES (1324, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:44:33', '', '2025-10-19 11:44:33');
INSERT INTO `sj_retry_task` VALUES (1325, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:45:33', '', '2025-10-19 11:45:33');
INSERT INTO `sj_retry_task` VALUES (1326, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:45:33', '', '2025-10-19 11:45:33');
INSERT INTO `sj_retry_task` VALUES (1327, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:46:33', '', '2025-10-19 11:46:33');
INSERT INTO `sj_retry_task` VALUES (1328, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:46:33', '', '2025-10-19 11:46:33');
INSERT INTO `sj_retry_task` VALUES (1329, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:47:34', '', '2025-10-19 11:47:34');
INSERT INTO `sj_retry_task` VALUES (1330, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:47:34', '', '2025-10-19 11:47:34');
INSERT INTO `sj_retry_task` VALUES (1331, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:48:33', '', '2025-10-19 11:48:33');
INSERT INTO `sj_retry_task` VALUES (1332, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:48:33', '', '2025-10-19 11:48:33');
INSERT INTO `sj_retry_task` VALUES (1333, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:49:33', '', '2025-10-19 11:49:33');
INSERT INTO `sj_retry_task` VALUES (1334, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:49:33', '', '2025-10-19 11:49:33');
INSERT INTO `sj_retry_task` VALUES (1335, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:50:33', '', '2025-10-19 11:50:33');
INSERT INTO `sj_retry_task` VALUES (1336, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:50:33', '', '2025-10-19 11:50:33');
INSERT INTO `sj_retry_task` VALUES (1337, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:51:33', '', '2025-10-19 11:51:33');
INSERT INTO `sj_retry_task` VALUES (1338, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:51:33', '', '2025-10-19 11:51:33');
INSERT INTO `sj_retry_task` VALUES (1339, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:52:33', '', '2025-10-19 11:52:33');
INSERT INTO `sj_retry_task` VALUES (1340, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:52:33', '', '2025-10-19 11:52:33');
INSERT INTO `sj_retry_task` VALUES (1341, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:53:33', '', '2025-10-19 11:53:33');
INSERT INTO `sj_retry_task` VALUES (1342, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:53:33', '', '2025-10-19 11:53:33');
INSERT INTO `sj_retry_task` VALUES (1343, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:54:33', '', '2025-10-19 11:54:33');
INSERT INTO `sj_retry_task` VALUES (1344, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:54:33', '', '2025-10-19 11:54:33');
INSERT INTO `sj_retry_task` VALUES (1345, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:55:33', '', '2025-10-19 11:55:33');
INSERT INTO `sj_retry_task` VALUES (1346, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:55:33', '', '2025-10-19 11:55:33');
INSERT INTO `sj_retry_task` VALUES (1347, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:56:33', '', '2025-10-19 11:56:33');
INSERT INTO `sj_retry_task` VALUES (1348, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:56:33', '', '2025-10-19 11:56:33');
INSERT INTO `sj_retry_task` VALUES (1349, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:57:33', '', '2025-10-19 11:57:33');
INSERT INTO `sj_retry_task` VALUES (1350, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:57:33', '', '2025-10-19 11:57:33');
INSERT INTO `sj_retry_task` VALUES (1351, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:58:33', '', '2025-10-19 11:58:33');
INSERT INTO `sj_retry_task` VALUES (1352, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:58:33', '', '2025-10-19 11:58:33');
INSERT INTO `sj_retry_task` VALUES (1353, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 11:59:33', '', '2025-10-19 11:59:33');
INSERT INTO `sj_retry_task` VALUES (1354, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 11:59:33', '', '2025-10-19 11:59:33');
INSERT INTO `sj_retry_task` VALUES (1355, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:00:34', '', '2025-10-19 12:00:34');
INSERT INTO `sj_retry_task` VALUES (1356, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:00:34', '', '2025-10-19 12:00:34');
INSERT INTO `sj_retry_task` VALUES (1357, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:01:33', '', '2025-10-19 12:01:33');
INSERT INTO `sj_retry_task` VALUES (1358, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:01:33', '', '2025-10-19 12:01:33');
INSERT INTO `sj_retry_task` VALUES (1359, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:02:33', '', '2025-10-19 12:02:33');
INSERT INTO `sj_retry_task` VALUES (1360, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:02:33', '', '2025-10-19 12:02:33');
INSERT INTO `sj_retry_task` VALUES (1361, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:03:33', '', '2025-10-19 12:03:33');
INSERT INTO `sj_retry_task` VALUES (1362, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:03:33', '', '2025-10-19 12:03:33');
INSERT INTO `sj_retry_task` VALUES (1363, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:04:33', '', '2025-10-19 12:04:33');
INSERT INTO `sj_retry_task` VALUES (1364, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:04:33', '', '2025-10-19 12:04:33');
INSERT INTO `sj_retry_task` VALUES (1365, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:05:33', '', '2025-10-19 12:05:33');
INSERT INTO `sj_retry_task` VALUES (1366, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:05:33', '', '2025-10-19 12:05:33');
INSERT INTO `sj_retry_task` VALUES (1367, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:06:33', '', '2025-10-19 12:06:33');
INSERT INTO `sj_retry_task` VALUES (1368, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:06:33', '', '2025-10-19 12:06:33');
INSERT INTO `sj_retry_task` VALUES (1369, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:07:33', '', '2025-10-19 12:07:33');
INSERT INTO `sj_retry_task` VALUES (1370, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:07:33', '', '2025-10-19 12:07:33');
INSERT INTO `sj_retry_task` VALUES (1371, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:08:33', '', '2025-10-19 12:08:33');
INSERT INTO `sj_retry_task` VALUES (1372, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:08:33', '', '2025-10-19 12:08:33');
INSERT INTO `sj_retry_task` VALUES (1373, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:09:33', '', '2025-10-19 12:09:33');
INSERT INTO `sj_retry_task` VALUES (1374, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:09:33', '', '2025-10-19 12:09:33');
INSERT INTO `sj_retry_task` VALUES (1375, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:10:33', '', '2025-10-19 12:10:33');
INSERT INTO `sj_retry_task` VALUES (1376, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:10:33', '', '2025-10-19 12:10:33');
INSERT INTO `sj_retry_task` VALUES (1377, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:11:33', '', '2025-10-19 12:11:33');
INSERT INTO `sj_retry_task` VALUES (1378, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:11:33', '', '2025-10-19 12:11:33');
INSERT INTO `sj_retry_task` VALUES (1379, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:12:33', '', '2025-10-19 12:12:33');
INSERT INTO `sj_retry_task` VALUES (1380, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:12:33', '', '2025-10-19 12:12:33');
INSERT INTO `sj_retry_task` VALUES (1381, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:13:34', '', '2025-10-19 12:13:34');
INSERT INTO `sj_retry_task` VALUES (1382, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:13:34', '', '2025-10-19 12:13:34');
INSERT INTO `sj_retry_task` VALUES (1383, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:14:33', '', '2025-10-19 12:14:33');
INSERT INTO `sj_retry_task` VALUES (1384, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:14:33', '', '2025-10-19 12:14:33');
INSERT INTO `sj_retry_task` VALUES (1385, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:15:33', '', '2025-10-19 12:15:33');
INSERT INTO `sj_retry_task` VALUES (1386, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:15:33', '', '2025-10-19 12:15:33');
INSERT INTO `sj_retry_task` VALUES (1387, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:16:33', '', '2025-10-19 12:16:33');
INSERT INTO `sj_retry_task` VALUES (1388, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:16:33', '', '2025-10-19 12:16:33');
INSERT INTO `sj_retry_task` VALUES (1389, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:17:33', '', '2025-10-19 12:17:33');
INSERT INTO `sj_retry_task` VALUES (1390, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:17:33', '', '2025-10-19 12:17:33');
INSERT INTO `sj_retry_task` VALUES (1391, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:18:33', '', '2025-10-19 12:18:33');
INSERT INTO `sj_retry_task` VALUES (1392, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:18:33', '', '2025-10-19 12:18:33');
INSERT INTO `sj_retry_task` VALUES (1393, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:19:33', '', '2025-10-19 12:19:33');
INSERT INTO `sj_retry_task` VALUES (1394, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:19:33', '', '2025-10-19 12:19:33');
INSERT INTO `sj_retry_task` VALUES (1395, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:20:33', '', '2025-10-19 12:20:33');
INSERT INTO `sj_retry_task` VALUES (1396, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:20:33', '', '2025-10-19 12:20:33');
INSERT INTO `sj_retry_task` VALUES (1397, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:21:33', '', '2025-10-19 12:21:33');
INSERT INTO `sj_retry_task` VALUES (1398, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:21:33', '', '2025-10-19 12:21:33');
INSERT INTO `sj_retry_task` VALUES (1399, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:22:33', '', '2025-10-19 12:22:33');
INSERT INTO `sj_retry_task` VALUES (1400, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:22:33', '', '2025-10-19 12:22:33');
INSERT INTO `sj_retry_task` VALUES (1401, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:23:33', '', '2025-10-19 12:23:33');
INSERT INTO `sj_retry_task` VALUES (1402, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:23:33', '', '2025-10-19 12:23:33');
INSERT INTO `sj_retry_task` VALUES (1403, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:24:33', '', '2025-10-19 12:24:33');
INSERT INTO `sj_retry_task` VALUES (1404, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:24:33', '', '2025-10-19 12:24:33');
INSERT INTO `sj_retry_task` VALUES (1405, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:25:33', '', '2025-10-19 12:25:33');
INSERT INTO `sj_retry_task` VALUES (1406, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:25:33', '', '2025-10-19 12:25:33');
INSERT INTO `sj_retry_task` VALUES (1407, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:26:33', '', '2025-10-19 12:26:33');
INSERT INTO `sj_retry_task` VALUES (1408, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:26:33', '', '2025-10-19 12:26:33');
INSERT INTO `sj_retry_task` VALUES (1409, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:27:33', '', '2025-10-19 12:27:33');
INSERT INTO `sj_retry_task` VALUES (1410, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:27:33', '', '2025-10-19 12:27:33');
INSERT INTO `sj_retry_task` VALUES (1411, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:28:33', '', '2025-10-19 12:28:33');
INSERT INTO `sj_retry_task` VALUES (1412, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:28:33', '', '2025-10-19 12:28:33');
INSERT INTO `sj_retry_task` VALUES (1413, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:29:33', '', '2025-10-19 12:29:33');
INSERT INTO `sj_retry_task` VALUES (1414, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:29:33', '', '2025-10-19 12:29:33');
INSERT INTO `sj_retry_task` VALUES (1415, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:30:33', '', '2025-10-19 12:30:33');
INSERT INTO `sj_retry_task` VALUES (1416, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:30:33', '', '2025-10-19 12:30:33');
INSERT INTO `sj_retry_task` VALUES (1417, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:31:33', '', '2025-10-19 12:31:33');
INSERT INTO `sj_retry_task` VALUES (1418, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:31:33', '', '2025-10-19 12:31:33');
INSERT INTO `sj_retry_task` VALUES (1419, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:32:33', '', '2025-10-19 12:32:33');
INSERT INTO `sj_retry_task` VALUES (1420, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:32:33', '', '2025-10-19 12:32:33');
INSERT INTO `sj_retry_task` VALUES (1421, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:33:33', '', '2025-10-19 12:33:33');
INSERT INTO `sj_retry_task` VALUES (1422, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:33:33', '', '2025-10-19 12:33:33');
INSERT INTO `sj_retry_task` VALUES (1423, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:34:33', '', '2025-10-19 12:34:33');
INSERT INTO `sj_retry_task` VALUES (1424, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:34:33', '', '2025-10-19 12:34:33');
INSERT INTO `sj_retry_task` VALUES (1425, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:35:33', '', '2025-10-19 12:35:33');
INSERT INTO `sj_retry_task` VALUES (1426, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:35:33', '', '2025-10-19 12:35:33');
INSERT INTO `sj_retry_task` VALUES (1427, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:36:33', '', '2025-10-19 12:36:33');
INSERT INTO `sj_retry_task` VALUES (1428, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:36:33', '', '2025-10-19 12:36:33');
INSERT INTO `sj_retry_task` VALUES (1429, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:37:33', '', '2025-10-19 12:37:33');
INSERT INTO `sj_retry_task` VALUES (1430, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:37:33', '', '2025-10-19 12:37:33');
INSERT INTO `sj_retry_task` VALUES (1431, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:38:33', '', '2025-10-19 12:38:33');
INSERT INTO `sj_retry_task` VALUES (1432, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:38:33', '', '2025-10-19 12:38:33');
INSERT INTO `sj_retry_task` VALUES (1433, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:39:33', '', '2025-10-19 12:39:33');
INSERT INTO `sj_retry_task` VALUES (1434, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:39:33', '', '2025-10-19 12:39:33');
INSERT INTO `sj_retry_task` VALUES (1435, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:40:33', '', '2025-10-19 12:40:33');
INSERT INTO `sj_retry_task` VALUES (1436, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:40:33', '', '2025-10-19 12:40:33');
INSERT INTO `sj_retry_task` VALUES (1437, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:41:33', '', '2025-10-19 12:41:33');
INSERT INTO `sj_retry_task` VALUES (1438, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:41:33', '', '2025-10-19 12:41:33');
INSERT INTO `sj_retry_task` VALUES (1439, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:42:33', '', '2025-10-19 12:42:33');
INSERT INTO `sj_retry_task` VALUES (1440, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:42:33', '', '2025-10-19 12:42:33');
INSERT INTO `sj_retry_task` VALUES (1441, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:43:33', '', '2025-10-19 12:43:33');
INSERT INTO `sj_retry_task` VALUES (1442, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:43:33', '', '2025-10-19 12:43:33');
INSERT INTO `sj_retry_task` VALUES (1443, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:44:33', '', '2025-10-19 12:44:33');
INSERT INTO `sj_retry_task` VALUES (1444, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:44:33', '', '2025-10-19 12:44:33');
INSERT INTO `sj_retry_task` VALUES (1445, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:45:33', '', '2025-10-19 12:45:33');
INSERT INTO `sj_retry_task` VALUES (1446, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:45:33', '', '2025-10-19 12:45:33');
INSERT INTO `sj_retry_task` VALUES (1447, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:46:33', '', '2025-10-19 12:46:33');
INSERT INTO `sj_retry_task` VALUES (1448, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:46:33', '', '2025-10-19 12:46:33');
INSERT INTO `sj_retry_task` VALUES (1449, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:47:33', '', '2025-10-19 12:47:33');
INSERT INTO `sj_retry_task` VALUES (1450, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:47:33', '', '2025-10-19 12:47:33');
INSERT INTO `sj_retry_task` VALUES (1451, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:48:33', '', '2025-10-19 12:48:33');
INSERT INTO `sj_retry_task` VALUES (1452, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:48:33', '', '2025-10-19 12:48:33');
INSERT INTO `sj_retry_task` VALUES (1453, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:49:33', '', '2025-10-19 12:49:33');
INSERT INTO `sj_retry_task` VALUES (1454, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:49:33', '', '2025-10-19 12:49:33');
INSERT INTO `sj_retry_task` VALUES (1455, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:50:34', '', '2025-10-19 12:50:34');
INSERT INTO `sj_retry_task` VALUES (1456, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:50:34', '', '2025-10-19 12:50:34');
INSERT INTO `sj_retry_task` VALUES (1457, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:51:33', '', '2025-10-19 12:51:33');
INSERT INTO `sj_retry_task` VALUES (1458, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:51:33', '', '2025-10-19 12:51:33');
INSERT INTO `sj_retry_task` VALUES (1459, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:52:33', '', '2025-10-19 12:52:33');
INSERT INTO `sj_retry_task` VALUES (1460, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:52:33', '', '2025-10-19 12:52:33');
INSERT INTO `sj_retry_task` VALUES (1461, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:53:33', '', '2025-10-19 12:53:33');
INSERT INTO `sj_retry_task` VALUES (1462, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:53:33', '', '2025-10-19 12:53:33');
INSERT INTO `sj_retry_task` VALUES (1463, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:54:33', '', '2025-10-19 12:54:33');
INSERT INTO `sj_retry_task` VALUES (1464, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:54:33', '', '2025-10-19 12:54:33');
INSERT INTO `sj_retry_task` VALUES (1465, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:55:33', '', '2025-10-19 12:55:33');
INSERT INTO `sj_retry_task` VALUES (1466, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:55:33', '', '2025-10-19 12:55:33');
INSERT INTO `sj_retry_task` VALUES (1467, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:56:33', '', '2025-10-19 12:56:33');
INSERT INTO `sj_retry_task` VALUES (1468, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:56:33', '', '2025-10-19 12:56:33');
INSERT INTO `sj_retry_task` VALUES (1469, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:57:33', '', '2025-10-19 12:57:33');
INSERT INTO `sj_retry_task` VALUES (1470, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:57:33', '', '2025-10-19 12:57:33');
INSERT INTO `sj_retry_task` VALUES (1471, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:58:33', '', '2025-10-19 12:58:33');
INSERT INTO `sj_retry_task` VALUES (1472, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:58:33', '', '2025-10-19 12:58:33');
INSERT INTO `sj_retry_task` VALUES (1473, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 12:59:33', '', '2025-10-19 12:59:33');
INSERT INTO `sj_retry_task` VALUES (1474, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 12:59:33', '', '2025-10-19 12:59:33');
INSERT INTO `sj_retry_task` VALUES (1475, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:00:33', '', '2025-10-19 13:00:33');
INSERT INTO `sj_retry_task` VALUES (1476, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:00:33', '', '2025-10-19 13:00:33');
INSERT INTO `sj_retry_task` VALUES (1477, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:01:33', '', '2025-10-19 13:01:33');
INSERT INTO `sj_retry_task` VALUES (1478, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:01:33', '', '2025-10-19 13:01:33');
INSERT INTO `sj_retry_task` VALUES (1479, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:02:33', '', '2025-10-19 13:02:33');
INSERT INTO `sj_retry_task` VALUES (1480, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:02:33', '', '2025-10-19 13:02:33');
INSERT INTO `sj_retry_task` VALUES (1481, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:03:33', '', '2025-10-19 13:03:33');
INSERT INTO `sj_retry_task` VALUES (1482, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:03:33', '', '2025-10-19 13:03:33');
INSERT INTO `sj_retry_task` VALUES (1483, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:04:33', '', '2025-10-19 13:04:33');
INSERT INTO `sj_retry_task` VALUES (1484, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:04:33', '', '2025-10-19 13:04:33');
INSERT INTO `sj_retry_task` VALUES (1485, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:05:34', '', '2025-10-19 13:05:34');
INSERT INTO `sj_retry_task` VALUES (1486, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:05:34', '', '2025-10-19 13:05:34');
INSERT INTO `sj_retry_task` VALUES (1487, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:06:33', '', '2025-10-19 13:06:33');
INSERT INTO `sj_retry_task` VALUES (1488, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:06:33', '', '2025-10-19 13:06:33');
INSERT INTO `sj_retry_task` VALUES (1489, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:07:33', '', '2025-10-19 13:07:33');
INSERT INTO `sj_retry_task` VALUES (1490, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:07:33', '', '2025-10-19 13:07:33');
INSERT INTO `sj_retry_task` VALUES (1491, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:08:33', '', '2025-10-19 13:08:33');
INSERT INTO `sj_retry_task` VALUES (1492, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:08:33', '', '2025-10-19 13:08:33');
INSERT INTO `sj_retry_task` VALUES (1493, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:09:33', '', '2025-10-19 13:09:33');
INSERT INTO `sj_retry_task` VALUES (1494, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:09:33', '', '2025-10-19 13:09:33');
INSERT INTO `sj_retry_task` VALUES (1495, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:10:33', '', '2025-10-19 13:10:33');
INSERT INTO `sj_retry_task` VALUES (1496, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:10:33', '', '2025-10-19 13:10:33');
INSERT INTO `sj_retry_task` VALUES (1497, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:11:33', '', '2025-10-19 13:11:33');
INSERT INTO `sj_retry_task` VALUES (1498, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:11:33', '', '2025-10-19 13:11:33');
INSERT INTO `sj_retry_task` VALUES (1499, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:12:33', '', '2025-10-19 13:12:33');
INSERT INTO `sj_retry_task` VALUES (1500, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:12:33', '', '2025-10-19 13:12:33');
INSERT INTO `sj_retry_task` VALUES (1501, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:13:33', '', '2025-10-19 13:13:33');
INSERT INTO `sj_retry_task` VALUES (1502, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:13:33', '', '2025-10-19 13:13:33');
INSERT INTO `sj_retry_task` VALUES (1503, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:14:33', '', '2025-10-19 13:14:33');
INSERT INTO `sj_retry_task` VALUES (1504, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:14:33', '', '2025-10-19 13:14:33');
INSERT INTO `sj_retry_task` VALUES (1505, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:15:33', '', '2025-10-19 13:15:33');
INSERT INTO `sj_retry_task` VALUES (1506, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:15:33', '', '2025-10-19 13:15:33');
INSERT INTO `sj_retry_task` VALUES (1507, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:16:33', '', '2025-10-19 13:16:33');
INSERT INTO `sj_retry_task` VALUES (1508, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:16:33', '', '2025-10-19 13:16:33');
INSERT INTO `sj_retry_task` VALUES (1509, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:17:33', '', '2025-10-19 13:17:33');
INSERT INTO `sj_retry_task` VALUES (1510, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:17:33', '', '2025-10-19 13:17:33');
INSERT INTO `sj_retry_task` VALUES (1511, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:18:33', '', '2025-10-19 13:18:33');
INSERT INTO `sj_retry_task` VALUES (1512, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:18:33', '', '2025-10-19 13:18:33');
INSERT INTO `sj_retry_task` VALUES (1513, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:19:33', '', '2025-10-19 13:19:33');
INSERT INTO `sj_retry_task` VALUES (1514, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:19:33', '', '2025-10-19 13:19:33');
INSERT INTO `sj_retry_task` VALUES (1515, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:20:33', '', '2025-10-19 13:20:33');
INSERT INTO `sj_retry_task` VALUES (1516, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:20:33', '', '2025-10-19 13:20:33');
INSERT INTO `sj_retry_task` VALUES (1517, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:21:33', '', '2025-10-19 13:21:33');
INSERT INTO `sj_retry_task` VALUES (1518, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:21:33', '', '2025-10-19 13:21:33');
INSERT INTO `sj_retry_task` VALUES (1519, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:22:33', '', '2025-10-19 13:22:33');
INSERT INTO `sj_retry_task` VALUES (1520, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:22:33', '', '2025-10-19 13:22:33');
INSERT INTO `sj_retry_task` VALUES (1521, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:23:33', '', '2025-10-19 13:23:33');
INSERT INTO `sj_retry_task` VALUES (1522, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:23:33', '', '2025-10-19 13:23:33');
INSERT INTO `sj_retry_task` VALUES (1523, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:24:33', '', '2025-10-19 13:24:33');
INSERT INTO `sj_retry_task` VALUES (1524, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:24:33', '', '2025-10-19 13:24:33');
INSERT INTO `sj_retry_task` VALUES (1525, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:25:33', '', '2025-10-19 13:25:33');
INSERT INTO `sj_retry_task` VALUES (1526, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:25:33', '', '2025-10-19 13:25:33');
INSERT INTO `sj_retry_task` VALUES (1527, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:26:33', '', '2025-10-19 13:26:33');
INSERT INTO `sj_retry_task` VALUES (1528, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:26:33', '', '2025-10-19 13:26:33');
INSERT INTO `sj_retry_task` VALUES (1529, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:27:34', '', '2025-10-19 13:27:34');
INSERT INTO `sj_retry_task` VALUES (1530, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:27:34', '', '2025-10-19 13:27:34');
INSERT INTO `sj_retry_task` VALUES (1531, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:28:33', '', '2025-10-19 13:28:33');
INSERT INTO `sj_retry_task` VALUES (1532, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:28:33', '', '2025-10-19 13:28:33');
INSERT INTO `sj_retry_task` VALUES (1533, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:29:33', '', '2025-10-19 13:29:33');
INSERT INTO `sj_retry_task` VALUES (1534, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:29:33', '', '2025-10-19 13:29:33');
INSERT INTO `sj_retry_task` VALUES (1535, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:30:33', '', '2025-10-19 13:30:33');
INSERT INTO `sj_retry_task` VALUES (1536, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:30:33', '', '2025-10-19 13:30:33');
INSERT INTO `sj_retry_task` VALUES (1537, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:31:33', '', '2025-10-19 13:31:33');
INSERT INTO `sj_retry_task` VALUES (1538, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:31:33', '', '2025-10-19 13:31:33');
INSERT INTO `sj_retry_task` VALUES (1539, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:32:33', '', '2025-10-19 13:32:33');
INSERT INTO `sj_retry_task` VALUES (1540, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:32:33', '', '2025-10-19 13:32:33');
INSERT INTO `sj_retry_task` VALUES (1541, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:33:33', '', '2025-10-19 13:33:33');
INSERT INTO `sj_retry_task` VALUES (1542, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:33:33', '', '2025-10-19 13:33:33');
INSERT INTO `sj_retry_task` VALUES (1543, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:34:33', '', '2025-10-19 13:34:33');
INSERT INTO `sj_retry_task` VALUES (1544, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:34:33', '', '2025-10-19 13:34:33');
INSERT INTO `sj_retry_task` VALUES (1545, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:35:33', '', '2025-10-19 13:35:33');
INSERT INTO `sj_retry_task` VALUES (1546, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:35:33', '', '2025-10-19 13:35:33');
INSERT INTO `sj_retry_task` VALUES (1547, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:36:33', '', '2025-10-19 13:36:33');
INSERT INTO `sj_retry_task` VALUES (1548, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:36:33', '', '2025-10-19 13:36:33');
INSERT INTO `sj_retry_task` VALUES (1549, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:37:33', '', '2025-10-19 13:37:33');
INSERT INTO `sj_retry_task` VALUES (1550, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:37:33', '', '2025-10-19 13:37:33');
INSERT INTO `sj_retry_task` VALUES (1551, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:38:33', '', '2025-10-19 13:38:33');
INSERT INTO `sj_retry_task` VALUES (1552, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:38:33', '', '2025-10-19 13:38:33');
INSERT INTO `sj_retry_task` VALUES (1553, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:39:33', '', '2025-10-19 13:39:33');
INSERT INTO `sj_retry_task` VALUES (1554, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:39:33', '', '2025-10-19 13:39:33');
INSERT INTO `sj_retry_task` VALUES (1555, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:40:33', '', '2025-10-19 13:40:33');
INSERT INTO `sj_retry_task` VALUES (1556, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:40:33', '', '2025-10-19 13:40:33');
INSERT INTO `sj_retry_task` VALUES (1557, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:41:33', '', '2025-10-19 13:41:33');
INSERT INTO `sj_retry_task` VALUES (1558, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:41:33', '', '2025-10-19 13:41:33');
INSERT INTO `sj_retry_task` VALUES (1559, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:42:34', '', '2025-10-19 13:42:34');
INSERT INTO `sj_retry_task` VALUES (1560, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:42:34', '', '2025-10-19 13:42:34');
INSERT INTO `sj_retry_task` VALUES (1561, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:43:33', '', '2025-10-19 13:43:33');
INSERT INTO `sj_retry_task` VALUES (1562, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:43:33', '', '2025-10-19 13:43:33');
INSERT INTO `sj_retry_task` VALUES (1563, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:44:33', '', '2025-10-19 13:44:33');
INSERT INTO `sj_retry_task` VALUES (1564, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:44:33', '', '2025-10-19 13:44:33');
INSERT INTO `sj_retry_task` VALUES (1565, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:45:33', '', '2025-10-19 13:45:33');
INSERT INTO `sj_retry_task` VALUES (1566, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:45:33', '', '2025-10-19 13:45:33');
INSERT INTO `sj_retry_task` VALUES (1567, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:46:33', '', '2025-10-19 13:46:33');
INSERT INTO `sj_retry_task` VALUES (1568, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:46:33', '', '2025-10-19 13:46:33');
INSERT INTO `sj_retry_task` VALUES (1569, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:47:33', '', '2025-10-19 13:47:33');
INSERT INTO `sj_retry_task` VALUES (1570, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:47:33', '', '2025-10-19 13:47:33');
INSERT INTO `sj_retry_task` VALUES (1571, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:48:33', '', '2025-10-19 13:48:33');
INSERT INTO `sj_retry_task` VALUES (1572, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:48:33', '', '2025-10-19 13:48:33');
INSERT INTO `sj_retry_task` VALUES (1573, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:49:33', '', '2025-10-19 13:49:33');
INSERT INTO `sj_retry_task` VALUES (1574, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:49:33', '', '2025-10-19 13:49:33');
INSERT INTO `sj_retry_task` VALUES (1575, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:50:33', '', '2025-10-19 13:50:33');
INSERT INTO `sj_retry_task` VALUES (1576, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:50:33', '', '2025-10-19 13:50:33');
INSERT INTO `sj_retry_task` VALUES (1577, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:51:33', '', '2025-10-19 13:51:33');
INSERT INTO `sj_retry_task` VALUES (1578, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:51:33', '', '2025-10-19 13:51:33');
INSERT INTO `sj_retry_task` VALUES (1579, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:52:33', '', '2025-10-19 13:52:33');
INSERT INTO `sj_retry_task` VALUES (1580, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:52:33', '', '2025-10-19 13:52:33');
INSERT INTO `sj_retry_task` VALUES (1581, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:53:33', '', '2025-10-19 13:53:33');
INSERT INTO `sj_retry_task` VALUES (1582, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:53:33', '', '2025-10-19 13:53:33');
INSERT INTO `sj_retry_task` VALUES (1583, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:54:33', '', '2025-10-19 13:54:33');
INSERT INTO `sj_retry_task` VALUES (1584, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:54:33', '', '2025-10-19 13:54:33');
INSERT INTO `sj_retry_task` VALUES (1585, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:55:33', '', '2025-10-19 13:55:33');
INSERT INTO `sj_retry_task` VALUES (1586, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:55:33', '', '2025-10-19 13:55:33');
INSERT INTO `sj_retry_task` VALUES (1587, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:56:33', '', '2025-10-19 13:56:33');
INSERT INTO `sj_retry_task` VALUES (1588, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:56:33', '', '2025-10-19 13:56:33');
INSERT INTO `sj_retry_task` VALUES (1589, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:57:33', '', '2025-10-19 13:57:33');
INSERT INTO `sj_retry_task` VALUES (1590, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:57:33', '', '2025-10-19 13:57:33');
INSERT INTO `sj_retry_task` VALUES (1591, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:58:33', '', '2025-10-19 13:58:33');
INSERT INTO `sj_retry_task` VALUES (1592, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:58:33', '', '2025-10-19 13:58:33');
INSERT INTO `sj_retry_task` VALUES (1593, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 13:59:33', '', '2025-10-19 13:59:33');
INSERT INTO `sj_retry_task` VALUES (1594, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 13:59:33', '', '2025-10-19 13:59:33');
INSERT INTO `sj_retry_task` VALUES (1595, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:00:33', '', '2025-10-19 14:00:33');
INSERT INTO `sj_retry_task` VALUES (1596, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:00:33', '', '2025-10-19 14:00:33');
INSERT INTO `sj_retry_task` VALUES (1597, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:01:33', '', '2025-10-19 14:01:33');
INSERT INTO `sj_retry_task` VALUES (1598, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:01:33', '', '2025-10-19 14:01:33');
INSERT INTO `sj_retry_task` VALUES (1599, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:02:33', '', '2025-10-19 14:02:33');
INSERT INTO `sj_retry_task` VALUES (1600, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:02:33', '', '2025-10-19 14:02:33');
INSERT INTO `sj_retry_task` VALUES (1601, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:03:33', '', '2025-10-19 14:03:33');
INSERT INTO `sj_retry_task` VALUES (1602, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:03:33', '', '2025-10-19 14:03:33');
INSERT INTO `sj_retry_task` VALUES (1603, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:04:33', '', '2025-10-19 14:04:33');
INSERT INTO `sj_retry_task` VALUES (1604, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:04:33', '', '2025-10-19 14:04:33');
INSERT INTO `sj_retry_task` VALUES (1605, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:05:33', '', '2025-10-19 14:05:33');
INSERT INTO `sj_retry_task` VALUES (1606, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:05:33', '', '2025-10-19 14:05:33');
INSERT INTO `sj_retry_task` VALUES (1607, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:06:33', '', '2025-10-19 14:06:33');
INSERT INTO `sj_retry_task` VALUES (1608, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:06:33', '', '2025-10-19 14:06:33');
INSERT INTO `sj_retry_task` VALUES (1609, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:07:33', '', '2025-10-19 14:07:33');
INSERT INTO `sj_retry_task` VALUES (1610, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:07:33', '', '2025-10-19 14:07:33');
INSERT INTO `sj_retry_task` VALUES (1611, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:08:33', '', '2025-10-19 14:08:33');
INSERT INTO `sj_retry_task` VALUES (1612, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:08:33', '', '2025-10-19 14:08:33');
INSERT INTO `sj_retry_task` VALUES (1613, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:09:33', '', '2025-10-19 14:09:33');
INSERT INTO `sj_retry_task` VALUES (1614, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:09:33', '', '2025-10-19 14:09:33');
INSERT INTO `sj_retry_task` VALUES (1615, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:10:33', '', '2025-10-19 14:10:33');
INSERT INTO `sj_retry_task` VALUES (1616, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:10:33', '', '2025-10-19 14:10:33');
INSERT INTO `sj_retry_task` VALUES (1617, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:11:33', '', '2025-10-19 14:11:33');
INSERT INTO `sj_retry_task` VALUES (1618, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:11:33', '', '2025-10-19 14:11:33');
INSERT INTO `sj_retry_task` VALUES (1619, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:12:33', '', '2025-10-19 14:12:33');
INSERT INTO `sj_retry_task` VALUES (1620, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:12:33', '', '2025-10-19 14:12:33');
INSERT INTO `sj_retry_task` VALUES (1621, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:13:33', '', '2025-10-19 14:13:33');
INSERT INTO `sj_retry_task` VALUES (1622, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:13:33', '', '2025-10-19 14:13:33');
INSERT INTO `sj_retry_task` VALUES (1623, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:14:33', '', '2025-10-19 14:14:33');
INSERT INTO `sj_retry_task` VALUES (1624, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:14:33', '', '2025-10-19 14:14:33');
INSERT INTO `sj_retry_task` VALUES (1625, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:15:33', '', '2025-10-19 14:15:33');
INSERT INTO `sj_retry_task` VALUES (1626, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:15:33', '', '2025-10-19 14:15:33');
INSERT INTO `sj_retry_task` VALUES (1627, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:16:33', '', '2025-10-19 14:16:33');
INSERT INTO `sj_retry_task` VALUES (1628, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:16:33', '', '2025-10-19 14:16:33');
INSERT INTO `sj_retry_task` VALUES (1629, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:17:33', '', '2025-10-19 14:17:33');
INSERT INTO `sj_retry_task` VALUES (1630, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:17:33', '', '2025-10-19 14:17:33');
INSERT INTO `sj_retry_task` VALUES (1631, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:18:33', '', '2025-10-19 14:18:33');
INSERT INTO `sj_retry_task` VALUES (1632, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:18:33', '', '2025-10-19 14:18:33');
INSERT INTO `sj_retry_task` VALUES (1633, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:19:33', '', '2025-10-19 14:19:33');
INSERT INTO `sj_retry_task` VALUES (1634, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:19:33', '', '2025-10-19 14:19:33');
INSERT INTO `sj_retry_task` VALUES (1635, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:20:33', '', '2025-10-19 14:20:33');
INSERT INTO `sj_retry_task` VALUES (1636, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:20:33', '', '2025-10-19 14:20:33');
INSERT INTO `sj_retry_task` VALUES (1637, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:21:33', '', '2025-10-19 14:21:33');
INSERT INTO `sj_retry_task` VALUES (1638, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:21:33', '', '2025-10-19 14:21:33');
INSERT INTO `sj_retry_task` VALUES (1639, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:22:33', '', '2025-10-19 14:22:33');
INSERT INTO `sj_retry_task` VALUES (1640, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:22:33', '', '2025-10-19 14:22:33');
INSERT INTO `sj_retry_task` VALUES (1641, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:23:33', '', '2025-10-19 14:23:33');
INSERT INTO `sj_retry_task` VALUES (1642, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:23:33', '', '2025-10-19 14:23:33');
INSERT INTO `sj_retry_task` VALUES (1643, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:24:33', '', '2025-10-19 14:24:33');
INSERT INTO `sj_retry_task` VALUES (1644, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:24:33', '', '2025-10-19 14:24:33');
INSERT INTO `sj_retry_task` VALUES (1645, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:25:33', '', '2025-10-19 14:25:33');
INSERT INTO `sj_retry_task` VALUES (1646, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:25:33', '', '2025-10-19 14:25:33');
INSERT INTO `sj_retry_task` VALUES (1647, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:26:33', '', '2025-10-19 14:26:33');
INSERT INTO `sj_retry_task` VALUES (1648, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:26:33', '', '2025-10-19 14:26:33');
INSERT INTO `sj_retry_task` VALUES (1649, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:27:33', '', '2025-10-19 14:27:33');
INSERT INTO `sj_retry_task` VALUES (1650, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:27:33', '', '2025-10-19 14:27:33');
INSERT INTO `sj_retry_task` VALUES (1651, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:28:33', '', '2025-10-19 14:28:33');
INSERT INTO `sj_retry_task` VALUES (1652, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:28:33', '', '2025-10-19 14:28:33');
INSERT INTO `sj_retry_task` VALUES (1653, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:29:34', '', '2025-10-19 14:29:34');
INSERT INTO `sj_retry_task` VALUES (1654, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:29:34', '', '2025-10-19 14:29:34');
INSERT INTO `sj_retry_task` VALUES (1655, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:30:33', '', '2025-10-19 14:30:33');
INSERT INTO `sj_retry_task` VALUES (1656, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:30:33', '', '2025-10-19 14:30:33');
INSERT INTO `sj_retry_task` VALUES (1657, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:31:33', '', '2025-10-19 14:31:33');
INSERT INTO `sj_retry_task` VALUES (1658, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:31:33', '', '2025-10-19 14:31:33');
INSERT INTO `sj_retry_task` VALUES (1659, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:32:33', '', '2025-10-19 14:32:33');
INSERT INTO `sj_retry_task` VALUES (1660, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:32:33', '', '2025-10-19 14:32:33');
INSERT INTO `sj_retry_task` VALUES (1661, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:33:33', '', '2025-10-19 14:33:33');
INSERT INTO `sj_retry_task` VALUES (1662, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:33:33', '', '2025-10-19 14:33:33');
INSERT INTO `sj_retry_task` VALUES (1663, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:34:33', '', '2025-10-19 14:34:33');
INSERT INTO `sj_retry_task` VALUES (1664, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:34:33', '', '2025-10-19 14:34:33');
INSERT INTO `sj_retry_task` VALUES (1665, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:35:33', '', '2025-10-19 14:35:33');
INSERT INTO `sj_retry_task` VALUES (1666, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:35:33', '', '2025-10-19 14:35:33');
INSERT INTO `sj_retry_task` VALUES (1667, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:36:33', '', '2025-10-19 14:36:33');
INSERT INTO `sj_retry_task` VALUES (1668, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:36:33', '', '2025-10-19 14:36:33');
INSERT INTO `sj_retry_task` VALUES (1669, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:37:33', '', '2025-10-19 14:37:33');
INSERT INTO `sj_retry_task` VALUES (1670, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:37:33', '', '2025-10-19 14:37:33');
INSERT INTO `sj_retry_task` VALUES (1671, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:38:33', '', '2025-10-19 14:38:33');
INSERT INTO `sj_retry_task` VALUES (1672, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:38:33', '', '2025-10-19 14:38:33');
INSERT INTO `sj_retry_task` VALUES (1673, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:39:33', '', '2025-10-19 14:39:33');
INSERT INTO `sj_retry_task` VALUES (1674, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:39:33', '', '2025-10-19 14:39:33');
INSERT INTO `sj_retry_task` VALUES (1675, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:40:33', '', '2025-10-19 14:40:33');
INSERT INTO `sj_retry_task` VALUES (1676, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:40:33', '', '2025-10-19 14:40:33');
INSERT INTO `sj_retry_task` VALUES (1677, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:41:33', '', '2025-10-19 14:41:33');
INSERT INTO `sj_retry_task` VALUES (1678, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:41:33', '', '2025-10-19 14:41:33');
INSERT INTO `sj_retry_task` VALUES (1679, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:42:33', '', '2025-10-19 14:42:33');
INSERT INTO `sj_retry_task` VALUES (1680, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:42:33', '', '2025-10-19 14:42:33');
INSERT INTO `sj_retry_task` VALUES (1681, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:43:33', '', '2025-10-19 14:43:33');
INSERT INTO `sj_retry_task` VALUES (1682, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:43:33', '', '2025-10-19 14:43:33');
INSERT INTO `sj_retry_task` VALUES (1683, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:44:33', '', '2025-10-19 14:44:33');
INSERT INTO `sj_retry_task` VALUES (1684, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:44:33', '', '2025-10-19 14:44:33');
INSERT INTO `sj_retry_task` VALUES (1685, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:45:33', '', '2025-10-19 14:45:33');
INSERT INTO `sj_retry_task` VALUES (1686, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:45:33', '', '2025-10-19 14:45:33');
INSERT INTO `sj_retry_task` VALUES (1687, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:46:33', '', '2025-10-19 14:46:33');
INSERT INTO `sj_retry_task` VALUES (1688, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:46:33', '', '2025-10-19 14:46:33');
INSERT INTO `sj_retry_task` VALUES (1689, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:47:33', '', '2025-10-19 14:47:33');
INSERT INTO `sj_retry_task` VALUES (1690, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:47:33', '', '2025-10-19 14:47:33');
INSERT INTO `sj_retry_task` VALUES (1691, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:48:33', '', '2025-10-19 14:48:33');
INSERT INTO `sj_retry_task` VALUES (1692, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:48:33', '', '2025-10-19 14:48:33');
INSERT INTO `sj_retry_task` VALUES (1693, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:49:33', '', '2025-10-19 14:49:33');
INSERT INTO `sj_retry_task` VALUES (1694, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:49:33', '', '2025-10-19 14:49:33');
INSERT INTO `sj_retry_task` VALUES (1695, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:50:33', '', '2025-10-19 14:50:33');
INSERT INTO `sj_retry_task` VALUES (1696, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:50:33', '', '2025-10-19 14:50:33');
INSERT INTO `sj_retry_task` VALUES (1697, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:51:33', '', '2025-10-19 14:51:33');
INSERT INTO `sj_retry_task` VALUES (1698, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:51:33', '', '2025-10-19 14:51:33');
INSERT INTO `sj_retry_task` VALUES (1699, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:52:33', '', '2025-10-19 14:52:33');
INSERT INTO `sj_retry_task` VALUES (1700, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:52:33', '', '2025-10-19 14:52:33');
INSERT INTO `sj_retry_task` VALUES (1701, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:53:33', '', '2025-10-19 14:53:33');
INSERT INTO `sj_retry_task` VALUES (1702, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:53:33', '', '2025-10-19 14:53:33');
INSERT INTO `sj_retry_task` VALUES (1703, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:54:33', '', '2025-10-19 14:54:33');
INSERT INTO `sj_retry_task` VALUES (1704, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:54:33', '', '2025-10-19 14:54:33');
INSERT INTO `sj_retry_task` VALUES (1705, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:55:33', '', '2025-10-19 14:55:33');
INSERT INTO `sj_retry_task` VALUES (1706, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:55:33', '', '2025-10-19 14:55:33');
INSERT INTO `sj_retry_task` VALUES (1707, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:56:33', '', '2025-10-19 14:56:33');
INSERT INTO `sj_retry_task` VALUES (1708, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:56:33', '', '2025-10-19 14:56:33');
INSERT INTO `sj_retry_task` VALUES (1709, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:57:33', '', '2025-10-19 14:57:33');
INSERT INTO `sj_retry_task` VALUES (1710, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:57:33', '', '2025-10-19 14:57:33');
INSERT INTO `sj_retry_task` VALUES (1711, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:58:33', '', '2025-10-19 14:58:33');
INSERT INTO `sj_retry_task` VALUES (1712, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:58:33', '', '2025-10-19 14:58:33');
INSERT INTO `sj_retry_task` VALUES (1713, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 14:59:33', '', '2025-10-19 14:59:33');
INSERT INTO `sj_retry_task` VALUES (1714, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 14:59:33', '', '2025-10-19 14:59:33');
INSERT INTO `sj_retry_task` VALUES (1715, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:00:33', '', '2025-10-19 15:00:33');
INSERT INTO `sj_retry_task` VALUES (1716, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:00:33', '', '2025-10-19 15:00:33');
INSERT INTO `sj_retry_task` VALUES (1717, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:01:33', '', '2025-10-19 15:01:33');
INSERT INTO `sj_retry_task` VALUES (1718, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:01:33', '', '2025-10-19 15:01:33');
INSERT INTO `sj_retry_task` VALUES (1719, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:02:33', '', '2025-10-19 15:02:33');
INSERT INTO `sj_retry_task` VALUES (1720, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:02:33', '', '2025-10-19 15:02:33');
INSERT INTO `sj_retry_task` VALUES (1721, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:03:33', '', '2025-10-19 15:03:33');
INSERT INTO `sj_retry_task` VALUES (1722, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:03:33', '', '2025-10-19 15:03:33');
INSERT INTO `sj_retry_task` VALUES (1723, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:04:33', '', '2025-10-19 15:04:33');
INSERT INTO `sj_retry_task` VALUES (1724, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:04:33', '', '2025-10-19 15:04:33');
INSERT INTO `sj_retry_task` VALUES (1725, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:05:33', '', '2025-10-19 15:05:33');
INSERT INTO `sj_retry_task` VALUES (1726, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:05:33', '', '2025-10-19 15:05:33');
INSERT INTO `sj_retry_task` VALUES (1727, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:06:33', '', '2025-10-19 15:06:33');
INSERT INTO `sj_retry_task` VALUES (1728, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:06:33', '', '2025-10-19 15:06:33');
INSERT INTO `sj_retry_task` VALUES (1729, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:07:33', '', '2025-10-19 15:07:33');
INSERT INTO `sj_retry_task` VALUES (1730, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:07:33', '', '2025-10-19 15:07:33');
INSERT INTO `sj_retry_task` VALUES (1731, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:08:33', '', '2025-10-19 15:08:33');
INSERT INTO `sj_retry_task` VALUES (1732, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:08:33', '', '2025-10-19 15:08:33');
INSERT INTO `sj_retry_task` VALUES (1733, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:09:33', '', '2025-10-19 15:09:33');
INSERT INTO `sj_retry_task` VALUES (1734, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:09:33', '', '2025-10-19 15:09:33');
INSERT INTO `sj_retry_task` VALUES (1735, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:10:33', '', '2025-10-19 15:10:33');
INSERT INTO `sj_retry_task` VALUES (1736, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:10:33', '', '2025-10-19 15:10:33');
INSERT INTO `sj_retry_task` VALUES (1737, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:11:33', '', '2025-10-19 15:11:33');
INSERT INTO `sj_retry_task` VALUES (1738, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:11:33', '', '2025-10-19 15:11:33');
INSERT INTO `sj_retry_task` VALUES (1739, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:12:33', '', '2025-10-19 15:12:33');
INSERT INTO `sj_retry_task` VALUES (1740, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:12:33', '', '2025-10-19 15:12:33');
INSERT INTO `sj_retry_task` VALUES (1741, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:13:33', '', '2025-10-19 15:13:33');
INSERT INTO `sj_retry_task` VALUES (1742, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:13:33', '', '2025-10-19 15:13:33');
INSERT INTO `sj_retry_task` VALUES (1743, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:14:33', '', '2025-10-19 15:14:33');
INSERT INTO `sj_retry_task` VALUES (1744, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:14:33', '', '2025-10-19 15:14:33');
INSERT INTO `sj_retry_task` VALUES (1745, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:15:33', '', '2025-10-19 15:15:33');
INSERT INTO `sj_retry_task` VALUES (1746, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:15:33', '', '2025-10-19 15:15:33');
INSERT INTO `sj_retry_task` VALUES (1747, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:16:33', '', '2025-10-19 15:16:33');
INSERT INTO `sj_retry_task` VALUES (1748, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:16:33', '', '2025-10-19 15:16:33');
INSERT INTO `sj_retry_task` VALUES (1749, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:17:33', '', '2025-10-19 15:17:33');
INSERT INTO `sj_retry_task` VALUES (1750, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:17:33', '', '2025-10-19 15:17:33');
INSERT INTO `sj_retry_task` VALUES (1751, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:18:33', '', '2025-10-19 15:18:33');
INSERT INTO `sj_retry_task` VALUES (1752, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:18:33', '', '2025-10-19 15:18:33');
INSERT INTO `sj_retry_task` VALUES (1753, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:19:33', '', '2025-10-19 15:19:33');
INSERT INTO `sj_retry_task` VALUES (1754, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:19:33', '', '2025-10-19 15:19:33');
INSERT INTO `sj_retry_task` VALUES (1755, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:20:33', '', '2025-10-19 15:20:33');
INSERT INTO `sj_retry_task` VALUES (1756, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:20:33', '', '2025-10-19 15:20:33');
INSERT INTO `sj_retry_task` VALUES (1757, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:21:33', '', '2025-10-19 15:21:33');
INSERT INTO `sj_retry_task` VALUES (1758, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:21:33', '', '2025-10-19 15:21:33');
INSERT INTO `sj_retry_task` VALUES (1759, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:22:33', '', '2025-10-19 15:22:33');
INSERT INTO `sj_retry_task` VALUES (1760, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:22:33', '', '2025-10-19 15:22:33');
INSERT INTO `sj_retry_task` VALUES (1761, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:23:33', '', '2025-10-19 15:23:33');
INSERT INTO `sj_retry_task` VALUES (1762, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:23:33', '', '2025-10-19 15:23:33');
INSERT INTO `sj_retry_task` VALUES (1763, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:24:33', '', '2025-10-19 15:24:33');
INSERT INTO `sj_retry_task` VALUES (1764, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:24:33', '', '2025-10-19 15:24:33');
INSERT INTO `sj_retry_task` VALUES (1765, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:25:33', '', '2025-10-19 15:25:33');
INSERT INTO `sj_retry_task` VALUES (1766, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:25:33', '', '2025-10-19 15:25:33');
INSERT INTO `sj_retry_task` VALUES (1767, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:26:33', '', '2025-10-19 15:26:33');
INSERT INTO `sj_retry_task` VALUES (1768, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:26:33', '', '2025-10-19 15:26:33');
INSERT INTO `sj_retry_task` VALUES (1769, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:27:33', '', '2025-10-19 15:27:33');
INSERT INTO `sj_retry_task` VALUES (1770, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:27:33', '', '2025-10-19 15:27:33');
INSERT INTO `sj_retry_task` VALUES (1771, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:28:33', '', '2025-10-19 15:28:33');
INSERT INTO `sj_retry_task` VALUES (1772, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:28:33', '', '2025-10-19 15:28:33');
INSERT INTO `sj_retry_task` VALUES (1773, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:29:33', '', '2025-10-19 15:29:33');
INSERT INTO `sj_retry_task` VALUES (1774, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:29:33', '', '2025-10-19 15:29:33');
INSERT INTO `sj_retry_task` VALUES (1775, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:30:33', '', '2025-10-19 15:30:33');
INSERT INTO `sj_retry_task` VALUES (1776, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:30:33', '', '2025-10-19 15:30:33');
INSERT INTO `sj_retry_task` VALUES (1777, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:31:33', '', '2025-10-19 15:31:33');
INSERT INTO `sj_retry_task` VALUES (1778, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:31:33', '', '2025-10-19 15:31:33');
INSERT INTO `sj_retry_task` VALUES (1779, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:32:33', '', '2025-10-19 15:32:33');
INSERT INTO `sj_retry_task` VALUES (1780, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:32:33', '', '2025-10-19 15:32:33');
INSERT INTO `sj_retry_task` VALUES (1781, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:33:33', '', '2025-10-19 15:33:33');
INSERT INTO `sj_retry_task` VALUES (1782, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:33:33', '', '2025-10-19 15:33:33');
INSERT INTO `sj_retry_task` VALUES (1783, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:34:33', '', '2025-10-19 15:34:33');
INSERT INTO `sj_retry_task` VALUES (1784, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:34:33', '', '2025-10-19 15:34:33');
INSERT INTO `sj_retry_task` VALUES (1785, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:35:33', '', '2025-10-19 15:35:33');
INSERT INTO `sj_retry_task` VALUES (1786, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:35:33', '', '2025-10-19 15:35:33');
INSERT INTO `sj_retry_task` VALUES (1787, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:36:33', '', '2025-10-19 15:36:33');
INSERT INTO `sj_retry_task` VALUES (1788, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:36:33', '', '2025-10-19 15:36:33');
INSERT INTO `sj_retry_task` VALUES (1789, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:37:33', '', '2025-10-19 15:37:33');
INSERT INTO `sj_retry_task` VALUES (1790, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:37:33', '', '2025-10-19 15:37:33');
INSERT INTO `sj_retry_task` VALUES (1791, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:38:33', '', '2025-10-19 15:38:33');
INSERT INTO `sj_retry_task` VALUES (1792, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:38:33', '', '2025-10-19 15:38:33');
INSERT INTO `sj_retry_task` VALUES (1793, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:39:33', '', '2025-10-19 15:39:33');
INSERT INTO `sj_retry_task` VALUES (1794, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:39:33', '', '2025-10-19 15:39:33');
INSERT INTO `sj_retry_task` VALUES (1795, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:40:33', '', '2025-10-19 15:40:33');
INSERT INTO `sj_retry_task` VALUES (1796, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:40:33', '', '2025-10-19 15:40:33');
INSERT INTO `sj_retry_task` VALUES (1797, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:41:33', '', '2025-10-19 15:41:33');
INSERT INTO `sj_retry_task` VALUES (1798, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:41:33', '', '2025-10-19 15:41:33');
INSERT INTO `sj_retry_task` VALUES (1799, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:42:33', '', '2025-10-19 15:42:33');
INSERT INTO `sj_retry_task` VALUES (1800, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:42:33', '', '2025-10-19 15:42:33');
INSERT INTO `sj_retry_task` VALUES (1801, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:43:33', '', '2025-10-19 15:43:33');
INSERT INTO `sj_retry_task` VALUES (1802, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:43:33', '', '2025-10-19 15:43:33');
INSERT INTO `sj_retry_task` VALUES (1803, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:44:33', '', '2025-10-19 15:44:33');
INSERT INTO `sj_retry_task` VALUES (1804, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:44:33', '', '2025-10-19 15:44:33');
INSERT INTO `sj_retry_task` VALUES (1805, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:45:33', '', '2025-10-19 15:45:33');
INSERT INTO `sj_retry_task` VALUES (1806, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:45:33', '', '2025-10-19 15:45:33');
INSERT INTO `sj_retry_task` VALUES (1807, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:46:33', '', '2025-10-19 15:46:33');
INSERT INTO `sj_retry_task` VALUES (1808, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:46:33', '', '2025-10-19 15:46:33');
INSERT INTO `sj_retry_task` VALUES (1809, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:47:33', '', '2025-10-19 15:47:33');
INSERT INTO `sj_retry_task` VALUES (1810, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:47:33', '', '2025-10-19 15:47:33');
INSERT INTO `sj_retry_task` VALUES (1811, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:48:33', '', '2025-10-19 15:48:33');
INSERT INTO `sj_retry_task` VALUES (1812, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:48:33', '', '2025-10-19 15:48:33');
INSERT INTO `sj_retry_task` VALUES (1813, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:49:33', '', '2025-10-19 15:49:33');
INSERT INTO `sj_retry_task` VALUES (1814, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:49:33', '', '2025-10-19 15:49:33');
INSERT INTO `sj_retry_task` VALUES (1815, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:50:33', '', '2025-10-19 15:50:33');
INSERT INTO `sj_retry_task` VALUES (1816, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:50:33', '', '2025-10-19 15:50:33');
INSERT INTO `sj_retry_task` VALUES (1817, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:51:33', '', '2025-10-19 15:51:33');
INSERT INTO `sj_retry_task` VALUES (1818, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:51:33', '', '2025-10-19 15:51:33');
INSERT INTO `sj_retry_task` VALUES (1819, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:52:33', '', '2025-10-19 15:52:33');
INSERT INTO `sj_retry_task` VALUES (1820, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:52:33', '', '2025-10-19 15:52:33');
INSERT INTO `sj_retry_task` VALUES (1821, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:53:33', '', '2025-10-19 15:53:33');
INSERT INTO `sj_retry_task` VALUES (1822, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:53:33', '', '2025-10-19 15:53:33');
INSERT INTO `sj_retry_task` VALUES (1823, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:54:33', '', '2025-10-19 15:54:33');
INSERT INTO `sj_retry_task` VALUES (1824, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:54:33', '', '2025-10-19 15:54:33');
INSERT INTO `sj_retry_task` VALUES (1825, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:55:33', '', '2025-10-19 15:55:33');
INSERT INTO `sj_retry_task` VALUES (1826, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:55:33', '', '2025-10-19 15:55:33');
INSERT INTO `sj_retry_task` VALUES (1827, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:56:34', '', '2025-10-19 15:56:34');
INSERT INTO `sj_retry_task` VALUES (1828, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:56:34', '', '2025-10-19 15:56:34');
INSERT INTO `sj_retry_task` VALUES (1829, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:57:34', '', '2025-10-19 15:57:34');
INSERT INTO `sj_retry_task` VALUES (1830, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:57:34', '', '2025-10-19 15:57:34');
INSERT INTO `sj_retry_task` VALUES (1831, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:58:33', '', '2025-10-19 15:58:33');
INSERT INTO `sj_retry_task` VALUES (1832, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:58:33', '', '2025-10-19 15:58:33');
INSERT INTO `sj_retry_task` VALUES (1833, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 15:59:33', '', '2025-10-19 15:59:33');
INSERT INTO `sj_retry_task` VALUES (1834, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 15:59:33', '', '2025-10-19 15:59:33');
INSERT INTO `sj_retry_task` VALUES (1835, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:00:33', '', '2025-10-19 16:00:33');
INSERT INTO `sj_retry_task` VALUES (1836, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:00:33', '', '2025-10-19 16:00:33');
INSERT INTO `sj_retry_task` VALUES (1837, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:01:33', '', '2025-10-19 16:01:33');
INSERT INTO `sj_retry_task` VALUES (1838, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:01:33', '', '2025-10-19 16:01:33');
INSERT INTO `sj_retry_task` VALUES (1839, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:02:33', '', '2025-10-19 16:02:33');
INSERT INTO `sj_retry_task` VALUES (1840, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:02:33', '', '2025-10-19 16:02:33');
INSERT INTO `sj_retry_task` VALUES (1841, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:03:33', '', '2025-10-19 16:03:33');
INSERT INTO `sj_retry_task` VALUES (1842, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:03:33', '', '2025-10-19 16:03:33');
INSERT INTO `sj_retry_task` VALUES (1843, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:04:33', '', '2025-10-19 16:04:33');
INSERT INTO `sj_retry_task` VALUES (1844, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:04:33', '', '2025-10-19 16:04:33');
INSERT INTO `sj_retry_task` VALUES (1845, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:05:33', '', '2025-10-19 16:05:33');
INSERT INTO `sj_retry_task` VALUES (1846, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:05:33', '', '2025-10-19 16:05:33');
INSERT INTO `sj_retry_task` VALUES (1847, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:06:34', '', '2025-10-19 16:06:34');
INSERT INTO `sj_retry_task` VALUES (1848, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:06:34', '', '2025-10-19 16:06:34');
INSERT INTO `sj_retry_task` VALUES (1849, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:07:33', '', '2025-10-19 16:07:33');
INSERT INTO `sj_retry_task` VALUES (1850, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:07:33', '', '2025-10-19 16:07:33');
INSERT INTO `sj_retry_task` VALUES (1851, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:08:33', '', '2025-10-19 16:08:33');
INSERT INTO `sj_retry_task` VALUES (1852, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:08:33', '', '2025-10-19 16:08:33');
INSERT INTO `sj_retry_task` VALUES (1853, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:09:33', '', '2025-10-19 16:09:33');
INSERT INTO `sj_retry_task` VALUES (1854, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:09:33', '', '2025-10-19 16:09:33');
INSERT INTO `sj_retry_task` VALUES (1855, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:10:33', '', '2025-10-19 16:10:33');
INSERT INTO `sj_retry_task` VALUES (1856, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:10:33', '', '2025-10-19 16:10:33');
INSERT INTO `sj_retry_task` VALUES (1857, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:11:33', '', '2025-10-19 16:11:33');
INSERT INTO `sj_retry_task` VALUES (1858, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:11:33', '', '2025-10-19 16:11:33');
INSERT INTO `sj_retry_task` VALUES (1859, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:12:33', '', '2025-10-19 16:12:33');
INSERT INTO `sj_retry_task` VALUES (1860, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:12:33', '', '2025-10-19 16:12:33');
INSERT INTO `sj_retry_task` VALUES (1861, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:13:33', '', '2025-10-19 16:13:33');
INSERT INTO `sj_retry_task` VALUES (1862, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:13:33', '', '2025-10-19 16:13:33');
INSERT INTO `sj_retry_task` VALUES (1863, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:14:33', '', '2025-10-19 16:14:33');
INSERT INTO `sj_retry_task` VALUES (1864, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:14:33', '', '2025-10-19 16:14:33');
INSERT INTO `sj_retry_task` VALUES (1865, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:15:33', '', '2025-10-19 16:15:33');
INSERT INTO `sj_retry_task` VALUES (1866, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:15:33', '', '2025-10-19 16:15:33');
INSERT INTO `sj_retry_task` VALUES (1867, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:16:33', '', '2025-10-19 16:16:33');
INSERT INTO `sj_retry_task` VALUES (1868, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:16:33', '', '2025-10-19 16:16:33');
INSERT INTO `sj_retry_task` VALUES (1869, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:17:33', '', '2025-10-19 16:17:33');
INSERT INTO `sj_retry_task` VALUES (1870, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:17:33', '', '2025-10-19 16:17:33');
INSERT INTO `sj_retry_task` VALUES (1871, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:18:33', '', '2025-10-19 16:18:33');
INSERT INTO `sj_retry_task` VALUES (1872, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:18:33', '', '2025-10-19 16:18:33');
INSERT INTO `sj_retry_task` VALUES (1873, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:19:33', '', '2025-10-19 16:19:33');
INSERT INTO `sj_retry_task` VALUES (1874, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:19:33', '', '2025-10-19 16:19:33');
INSERT INTO `sj_retry_task` VALUES (1875, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:20:33', '', '2025-10-19 16:20:33');
INSERT INTO `sj_retry_task` VALUES (1876, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:20:33', '', '2025-10-19 16:20:33');
INSERT INTO `sj_retry_task` VALUES (1877, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:21:33', '', '2025-10-19 16:21:33');
INSERT INTO `sj_retry_task` VALUES (1878, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:21:33', '', '2025-10-19 16:21:33');
INSERT INTO `sj_retry_task` VALUES (1879, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:22:33', '', '2025-10-19 16:22:33');
INSERT INTO `sj_retry_task` VALUES (1880, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:22:33', '', '2025-10-19 16:22:33');
INSERT INTO `sj_retry_task` VALUES (1881, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:23:33', '', '2025-10-19 16:23:33');
INSERT INTO `sj_retry_task` VALUES (1882, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:23:33', '', '2025-10-19 16:23:33');
INSERT INTO `sj_retry_task` VALUES (1883, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:24:33', '', '2025-10-19 16:24:33');
INSERT INTO `sj_retry_task` VALUES (1884, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:24:33', '', '2025-10-19 16:24:33');
INSERT INTO `sj_retry_task` VALUES (1885, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:25:33', '', '2025-10-19 16:25:33');
INSERT INTO `sj_retry_task` VALUES (1886, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:25:33', '', '2025-10-19 16:25:33');
INSERT INTO `sj_retry_task` VALUES (1887, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:26:33', '', '2025-10-19 16:26:33');
INSERT INTO `sj_retry_task` VALUES (1888, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:26:33', '', '2025-10-19 16:26:33');
INSERT INTO `sj_retry_task` VALUES (1889, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:27:33', '', '2025-10-19 16:27:33');
INSERT INTO `sj_retry_task` VALUES (1890, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:27:33', '', '2025-10-19 16:27:33');
INSERT INTO `sj_retry_task` VALUES (1891, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:28:33', '', '2025-10-19 16:28:33');
INSERT INTO `sj_retry_task` VALUES (1892, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:28:33', '', '2025-10-19 16:28:33');
INSERT INTO `sj_retry_task` VALUES (1893, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:29:33', '', '2025-10-19 16:29:33');
INSERT INTO `sj_retry_task` VALUES (1894, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:29:33', '', '2025-10-19 16:29:33');
INSERT INTO `sj_retry_task` VALUES (1895, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:30:33', '', '2025-10-19 16:30:33');
INSERT INTO `sj_retry_task` VALUES (1896, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:30:33', '', '2025-10-19 16:30:33');
INSERT INTO `sj_retry_task` VALUES (1897, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:31:33', '', '2025-10-19 16:31:33');
INSERT INTO `sj_retry_task` VALUES (1898, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:31:33', '', '2025-10-19 16:31:33');
INSERT INTO `sj_retry_task` VALUES (1899, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:32:33', '', '2025-10-19 16:32:33');
INSERT INTO `sj_retry_task` VALUES (1900, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:32:33', '', '2025-10-19 16:32:33');
INSERT INTO `sj_retry_task` VALUES (1901, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:33:33', '', '2025-10-19 16:33:33');
INSERT INTO `sj_retry_task` VALUES (1902, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:33:33', '', '2025-10-19 16:33:33');
INSERT INTO `sj_retry_task` VALUES (1903, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:34:33', '', '2025-10-19 16:34:33');
INSERT INTO `sj_retry_task` VALUES (1904, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:34:33', '', '2025-10-19 16:34:33');
INSERT INTO `sj_retry_task` VALUES (1905, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:35:33', '', '2025-10-19 16:35:33');
INSERT INTO `sj_retry_task` VALUES (1906, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:35:33', '', '2025-10-19 16:35:33');
INSERT INTO `sj_retry_task` VALUES (1907, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:36:33', '', '2025-10-19 16:36:33');
INSERT INTO `sj_retry_task` VALUES (1908, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:36:33', '', '2025-10-19 16:36:33');
INSERT INTO `sj_retry_task` VALUES (1909, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:37:34', '', '2025-10-19 16:37:34');
INSERT INTO `sj_retry_task` VALUES (1910, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:37:34', '', '2025-10-19 16:37:34');
INSERT INTO `sj_retry_task` VALUES (1911, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:38:33', '', '2025-10-19 16:38:33');
INSERT INTO `sj_retry_task` VALUES (1912, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:38:33', '', '2025-10-19 16:38:33');
INSERT INTO `sj_retry_task` VALUES (1913, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:39:33', '', '2025-10-19 16:39:33');
INSERT INTO `sj_retry_task` VALUES (1914, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:39:33', '', '2025-10-19 16:39:33');
INSERT INTO `sj_retry_task` VALUES (1915, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:40:33', '', '2025-10-19 16:40:33');
INSERT INTO `sj_retry_task` VALUES (1916, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:40:33', '', '2025-10-19 16:40:33');
INSERT INTO `sj_retry_task` VALUES (1917, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:41:33', '', '2025-10-19 16:41:33');
INSERT INTO `sj_retry_task` VALUES (1918, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:41:33', '', '2025-10-19 16:41:33');
INSERT INTO `sj_retry_task` VALUES (1919, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:42:34', '', '2025-10-19 16:42:34');
INSERT INTO `sj_retry_task` VALUES (1920, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:42:34', '', '2025-10-19 16:42:34');
INSERT INTO `sj_retry_task` VALUES (1921, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:43:33', '', '2025-10-19 16:43:33');
INSERT INTO `sj_retry_task` VALUES (1922, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:43:33', '', '2025-10-19 16:43:33');
INSERT INTO `sj_retry_task` VALUES (1923, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:44:33', '', '2025-10-19 16:44:33');
INSERT INTO `sj_retry_task` VALUES (1924, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:44:33', '', '2025-10-19 16:44:33');
INSERT INTO `sj_retry_task` VALUES (1925, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:45:33', '', '2025-10-19 16:45:33');
INSERT INTO `sj_retry_task` VALUES (1926, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:45:33', '', '2025-10-19 16:45:33');
INSERT INTO `sj_retry_task` VALUES (1927, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:46:33', '', '2025-10-19 16:46:33');
INSERT INTO `sj_retry_task` VALUES (1928, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:46:33', '', '2025-10-19 16:46:33');
INSERT INTO `sj_retry_task` VALUES (1929, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:47:33', '', '2025-10-19 16:47:33');
INSERT INTO `sj_retry_task` VALUES (1930, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:47:33', '', '2025-10-19 16:47:33');
INSERT INTO `sj_retry_task` VALUES (1931, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:48:33', '', '2025-10-19 16:48:33');
INSERT INTO `sj_retry_task` VALUES (1932, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:48:33', '', '2025-10-19 16:48:33');
INSERT INTO `sj_retry_task` VALUES (1933, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:49:33', '', '2025-10-19 16:49:33');
INSERT INTO `sj_retry_task` VALUES (1934, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:49:33', '', '2025-10-19 16:49:33');
INSERT INTO `sj_retry_task` VALUES (1935, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:50:33', '', '2025-10-19 16:50:33');
INSERT INTO `sj_retry_task` VALUES (1936, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:50:33', '', '2025-10-19 16:50:33');
INSERT INTO `sj_retry_task` VALUES (1937, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:51:33', '', '2025-10-19 16:51:33');
INSERT INTO `sj_retry_task` VALUES (1938, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:51:33', '', '2025-10-19 16:51:33');
INSERT INTO `sj_retry_task` VALUES (1939, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:52:33', '', '2025-10-19 16:52:33');
INSERT INTO `sj_retry_task` VALUES (1940, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:52:33', '', '2025-10-19 16:52:33');
INSERT INTO `sj_retry_task` VALUES (1941, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:53:33', '', '2025-10-19 16:53:33');
INSERT INTO `sj_retry_task` VALUES (1942, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:53:33', '', '2025-10-19 16:53:33');
INSERT INTO `sj_retry_task` VALUES (1943, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:54:33', '', '2025-10-19 16:54:33');
INSERT INTO `sj_retry_task` VALUES (1944, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:54:33', '', '2025-10-19 16:54:33');
INSERT INTO `sj_retry_task` VALUES (1945, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:55:33', '', '2025-10-19 16:55:33');
INSERT INTO `sj_retry_task` VALUES (1946, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:55:33', '', '2025-10-19 16:55:33');
INSERT INTO `sj_retry_task` VALUES (1947, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:56:33', '', '2025-10-19 16:56:33');
INSERT INTO `sj_retry_task` VALUES (1948, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:56:33', '', '2025-10-19 16:56:33');
INSERT INTO `sj_retry_task` VALUES (1949, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:57:33', '', '2025-10-19 16:57:33');
INSERT INTO `sj_retry_task` VALUES (1950, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:57:33', '', '2025-10-19 16:57:33');
INSERT INTO `sj_retry_task` VALUES (1951, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:58:33', '', '2025-10-19 16:58:33');
INSERT INTO `sj_retry_task` VALUES (1952, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:58:33', '', '2025-10-19 16:58:33');
INSERT INTO `sj_retry_task` VALUES (1953, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 16:59:33', '', '2025-10-19 16:59:33');
INSERT INTO `sj_retry_task` VALUES (1954, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 16:59:33', '', '2025-10-19 16:59:33');
INSERT INTO `sj_retry_task` VALUES (1955, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:00:33', '', '2025-10-19 17:00:33');
INSERT INTO `sj_retry_task` VALUES (1956, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:00:33', '', '2025-10-19 17:00:33');
INSERT INTO `sj_retry_task` VALUES (1957, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:01:33', '', '2025-10-19 17:01:33');
INSERT INTO `sj_retry_task` VALUES (1958, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:01:33', '', '2025-10-19 17:01:33');
INSERT INTO `sj_retry_task` VALUES (1959, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:02:33', '', '2025-10-19 17:02:33');
INSERT INTO `sj_retry_task` VALUES (1960, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:02:33', '', '2025-10-19 17:02:33');
INSERT INTO `sj_retry_task` VALUES (1961, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:03:33', '', '2025-10-19 17:03:33');
INSERT INTO `sj_retry_task` VALUES (1962, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:03:33', '', '2025-10-19 17:03:33');
INSERT INTO `sj_retry_task` VALUES (1963, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:04:33', '', '2025-10-19 17:04:33');
INSERT INTO `sj_retry_task` VALUES (1964, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:04:33', '', '2025-10-19 17:04:33');
INSERT INTO `sj_retry_task` VALUES (1965, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:05:33', '', '2025-10-19 17:05:33');
INSERT INTO `sj_retry_task` VALUES (1966, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:05:33', '', '2025-10-19 17:05:33');
INSERT INTO `sj_retry_task` VALUES (1967, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:06:33', '', '2025-10-19 17:06:33');
INSERT INTO `sj_retry_task` VALUES (1968, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:06:33', '', '2025-10-19 17:06:33');
INSERT INTO `sj_retry_task` VALUES (1969, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:07:33', '', '2025-10-19 17:07:33');
INSERT INTO `sj_retry_task` VALUES (1970, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:07:33', '', '2025-10-19 17:07:33');
INSERT INTO `sj_retry_task` VALUES (1971, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:08:33', '', '2025-10-19 17:08:33');
INSERT INTO `sj_retry_task` VALUES (1972, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:08:33', '', '2025-10-19 17:08:33');
INSERT INTO `sj_retry_task` VALUES (1973, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:09:33', '', '2025-10-19 17:09:33');
INSERT INTO `sj_retry_task` VALUES (1974, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:09:33', '', '2025-10-19 17:09:33');
INSERT INTO `sj_retry_task` VALUES (1975, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:10:33', '', '2025-10-19 17:10:33');
INSERT INTO `sj_retry_task` VALUES (1976, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:10:33', '', '2025-10-19 17:10:33');
INSERT INTO `sj_retry_task` VALUES (1977, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:11:33', '', '2025-10-19 17:11:33');
INSERT INTO `sj_retry_task` VALUES (1978, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:11:33', '', '2025-10-19 17:11:33');
INSERT INTO `sj_retry_task` VALUES (1979, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:12:33', '', '2025-10-19 17:12:33');
INSERT INTO `sj_retry_task` VALUES (1980, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:12:33', '', '2025-10-19 17:12:33');
INSERT INTO `sj_retry_task` VALUES (1981, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:13:33', '', '2025-10-19 17:13:33');
INSERT INTO `sj_retry_task` VALUES (1982, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:13:33', '', '2025-10-19 17:13:33');
INSERT INTO `sj_retry_task` VALUES (1983, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:14:33', '', '2025-10-19 17:14:33');
INSERT INTO `sj_retry_task` VALUES (1984, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:14:33', '', '2025-10-19 17:14:33');
INSERT INTO `sj_retry_task` VALUES (1985, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:15:33', '', '2025-10-19 17:15:33');
INSERT INTO `sj_retry_task` VALUES (1986, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:15:33', '', '2025-10-19 17:15:33');
INSERT INTO `sj_retry_task` VALUES (1987, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:16:33', '', '2025-10-19 17:16:33');
INSERT INTO `sj_retry_task` VALUES (1988, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:16:33', '', '2025-10-19 17:16:33');
INSERT INTO `sj_retry_task` VALUES (1989, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:17:33', '', '2025-10-19 17:17:33');
INSERT INTO `sj_retry_task` VALUES (1990, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:17:33', '', '2025-10-19 17:17:33');
INSERT INTO `sj_retry_task` VALUES (1991, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:18:33', '', '2025-10-19 17:18:33');
INSERT INTO `sj_retry_task` VALUES (1992, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:18:33', '', '2025-10-19 17:18:33');
INSERT INTO `sj_retry_task` VALUES (1993, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:19:33', '', '2025-10-19 17:19:33');
INSERT INTO `sj_retry_task` VALUES (1994, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:19:33', '', '2025-10-19 17:19:33');
INSERT INTO `sj_retry_task` VALUES (1995, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:20:33', '', '2025-10-19 17:20:33');
INSERT INTO `sj_retry_task` VALUES (1996, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:20:33', '', '2025-10-19 17:20:33');
INSERT INTO `sj_retry_task` VALUES (1997, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:21:33', '', '2025-10-19 17:21:33');
INSERT INTO `sj_retry_task` VALUES (1998, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:21:33', '', '2025-10-19 17:21:33');
INSERT INTO `sj_retry_task` VALUES (1999, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:22:33', '', '2025-10-19 17:22:33');
INSERT INTO `sj_retry_task` VALUES (2000, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:22:33', '', '2025-10-19 17:22:33');
INSERT INTO `sj_retry_task` VALUES (2001, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:23:33', '', '2025-10-19 17:23:33');
INSERT INTO `sj_retry_task` VALUES (2002, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:23:33', '', '2025-10-19 17:23:33');
INSERT INTO `sj_retry_task` VALUES (2003, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:24:33', '', '2025-10-19 17:24:33');
INSERT INTO `sj_retry_task` VALUES (2004, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:24:33', '', '2025-10-19 17:24:33');
INSERT INTO `sj_retry_task` VALUES (2005, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:25:33', '', '2025-10-19 17:25:33');
INSERT INTO `sj_retry_task` VALUES (2006, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:25:33', '', '2025-10-19 17:25:33');
INSERT INTO `sj_retry_task` VALUES (2007, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:26:33', '', '2025-10-19 17:26:33');
INSERT INTO `sj_retry_task` VALUES (2008, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:26:33', '', '2025-10-19 17:26:33');
INSERT INTO `sj_retry_task` VALUES (2009, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:27:33', '', '2025-10-19 17:27:33');
INSERT INTO `sj_retry_task` VALUES (2010, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:27:33', '', '2025-10-19 17:27:33');
INSERT INTO `sj_retry_task` VALUES (2011, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:28:33', '', '2025-10-19 17:28:33');
INSERT INTO `sj_retry_task` VALUES (2012, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:28:33', '', '2025-10-19 17:28:33');
INSERT INTO `sj_retry_task` VALUES (2013, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:29:33', '', '2025-10-19 17:29:33');
INSERT INTO `sj_retry_task` VALUES (2014, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:29:33', '', '2025-10-19 17:29:33');
INSERT INTO `sj_retry_task` VALUES (2015, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:30:33', '', '2025-10-19 17:30:33');
INSERT INTO `sj_retry_task` VALUES (2016, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:30:33', '', '2025-10-19 17:30:33');
INSERT INTO `sj_retry_task` VALUES (2017, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:31:33', '', '2025-10-19 17:31:33');
INSERT INTO `sj_retry_task` VALUES (2018, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:31:33', '', '2025-10-19 17:31:33');
INSERT INTO `sj_retry_task` VALUES (2019, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:32:33', '', '2025-10-19 17:32:33');
INSERT INTO `sj_retry_task` VALUES (2020, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:32:33', '', '2025-10-19 17:32:33');
INSERT INTO `sj_retry_task` VALUES (2021, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:33:33', '', '2025-10-19 17:33:33');
INSERT INTO `sj_retry_task` VALUES (2022, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:33:33', '', '2025-10-19 17:33:33');
INSERT INTO `sj_retry_task` VALUES (2023, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:34:33', '', '2025-10-19 17:34:33');
INSERT INTO `sj_retry_task` VALUES (2024, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:34:33', '', '2025-10-19 17:34:33');
INSERT INTO `sj_retry_task` VALUES (2025, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:35:33', '', '2025-10-19 17:35:33');
INSERT INTO `sj_retry_task` VALUES (2026, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:35:33', '', '2025-10-19 17:35:33');
INSERT INTO `sj_retry_task` VALUES (2027, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:36:33', '', '2025-10-19 17:36:33');
INSERT INTO `sj_retry_task` VALUES (2028, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:36:33', '', '2025-10-19 17:36:33');
INSERT INTO `sj_retry_task` VALUES (2029, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:37:33', '', '2025-10-19 17:37:33');
INSERT INTO `sj_retry_task` VALUES (2030, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:37:33', '', '2025-10-19 17:37:33');
INSERT INTO `sj_retry_task` VALUES (2031, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:38:33', '', '2025-10-19 17:38:33');
INSERT INTO `sj_retry_task` VALUES (2032, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:38:33', '', '2025-10-19 17:38:33');
INSERT INTO `sj_retry_task` VALUES (2033, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:39:33', '', '2025-10-19 17:39:33');
INSERT INTO `sj_retry_task` VALUES (2034, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:39:33', '', '2025-10-19 17:39:33');
INSERT INTO `sj_retry_task` VALUES (2035, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:40:33', '', '2025-10-19 17:40:33');
INSERT INTO `sj_retry_task` VALUES (2036, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:40:33', '', '2025-10-19 17:40:33');
INSERT INTO `sj_retry_task` VALUES (2037, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:41:33', '', '2025-10-19 17:41:33');
INSERT INTO `sj_retry_task` VALUES (2038, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:41:33', '', '2025-10-19 17:41:33');
INSERT INTO `sj_retry_task` VALUES (2039, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:42:33', '', '2025-10-19 17:42:33');
INSERT INTO `sj_retry_task` VALUES (2040, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:42:33', '', '2025-10-19 17:42:33');
INSERT INTO `sj_retry_task` VALUES (2041, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:43:33', '', '2025-10-19 17:43:33');
INSERT INTO `sj_retry_task` VALUES (2042, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:43:33', '', '2025-10-19 17:43:33');
INSERT INTO `sj_retry_task` VALUES (2043, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:44:33', '', '2025-10-19 17:44:33');
INSERT INTO `sj_retry_task` VALUES (2044, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:44:33', '', '2025-10-19 17:44:33');
INSERT INTO `sj_retry_task` VALUES (2045, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:45:33', '', '2025-10-19 17:45:33');
INSERT INTO `sj_retry_task` VALUES (2046, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:45:33', '', '2025-10-19 17:45:33');
INSERT INTO `sj_retry_task` VALUES (2047, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:46:33', '', '2025-10-19 17:46:33');
INSERT INTO `sj_retry_task` VALUES (2048, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:46:33', '', '2025-10-19 17:46:33');
INSERT INTO `sj_retry_task` VALUES (2049, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:47:33', '', '2025-10-19 17:47:33');
INSERT INTO `sj_retry_task` VALUES (2050, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:47:33', '', '2025-10-19 17:47:33');
INSERT INTO `sj_retry_task` VALUES (2051, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:48:33', '', '2025-10-19 17:48:33');
INSERT INTO `sj_retry_task` VALUES (2052, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:48:33', '', '2025-10-19 17:48:33');
INSERT INTO `sj_retry_task` VALUES (2053, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:49:33', '', '2025-10-19 17:49:33');
INSERT INTO `sj_retry_task` VALUES (2054, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:49:33', '', '2025-10-19 17:49:33');
INSERT INTO `sj_retry_task` VALUES (2055, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:50:33', '', '2025-10-19 17:50:33');
INSERT INTO `sj_retry_task` VALUES (2056, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:50:33', '', '2025-10-19 17:50:33');
INSERT INTO `sj_retry_task` VALUES (2057, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:51:33', '', '2025-10-19 17:51:33');
INSERT INTO `sj_retry_task` VALUES (2058, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:51:33', '', '2025-10-19 17:51:33');
INSERT INTO `sj_retry_task` VALUES (2059, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 17:52:33', '', '2025-10-19 17:52:33');
INSERT INTO `sj_retry_task` VALUES (2060, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 17:52:33', '', '2025-10-19 17:52:33');
INSERT INTO `sj_retry_task` VALUES (2061, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:21:58', '', '2025-10-19 18:21:58');
INSERT INTO `sj_retry_task` VALUES (2062, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:21:58', '', '2025-10-19 18:21:58');
INSERT INTO `sj_retry_task` VALUES (2063, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:22:58', '', '2025-10-19 18:22:58');
INSERT INTO `sj_retry_task` VALUES (2064, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:22:58', '', '2025-10-19 18:22:58');
INSERT INTO `sj_retry_task` VALUES (2065, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:23:58', '', '2025-10-19 18:23:58');
INSERT INTO `sj_retry_task` VALUES (2066, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:23:58', '', '2025-10-19 18:23:58');
INSERT INTO `sj_retry_task` VALUES (2067, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:24:58', '', '2025-10-19 18:24:58');
INSERT INTO `sj_retry_task` VALUES (2068, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:24:58', '', '2025-10-19 18:24:58');
INSERT INTO `sj_retry_task` VALUES (2069, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:25:57', '', '2025-10-19 18:25:57');
INSERT INTO `sj_retry_task` VALUES (2070, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:25:57', '', '2025-10-19 18:25:57');
INSERT INTO `sj_retry_task` VALUES (2071, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:26:58', '', '2025-10-19 18:26:58');
INSERT INTO `sj_retry_task` VALUES (2072, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:26:58', '', '2025-10-19 18:26:58');
INSERT INTO `sj_retry_task` VALUES (2073, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:27:57', '', '2025-10-19 18:27:57');
INSERT INTO `sj_retry_task` VALUES (2074, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:27:57', '', '2025-10-19 18:27:57');
INSERT INTO `sj_retry_task` VALUES (2075, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:28:57', '', '2025-10-19 18:28:57');
INSERT INTO `sj_retry_task` VALUES (2076, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:28:57', '', '2025-10-19 18:28:57');
INSERT INTO `sj_retry_task` VALUES (2077, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:29:58', '', '2025-10-19 18:29:58');
INSERT INTO `sj_retry_task` VALUES (2078, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:29:58', '', '2025-10-19 18:29:58');
INSERT INTO `sj_retry_task` VALUES (2079, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:30:58', '', '2025-10-19 18:30:58');
INSERT INTO `sj_retry_task` VALUES (2080, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:30:58', '', '2025-10-19 18:30:58');
INSERT INTO `sj_retry_task` VALUES (2081, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:31:57', '', '2025-10-19 18:31:57');
INSERT INTO `sj_retry_task` VALUES (2082, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:31:57', '', '2025-10-19 18:31:57');
INSERT INTO `sj_retry_task` VALUES (2083, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:32:58', '', '2025-10-19 18:32:58');
INSERT INTO `sj_retry_task` VALUES (2084, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:32:58', '', '2025-10-19 18:32:58');
INSERT INTO `sj_retry_task` VALUES (2085, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:33:57', '', '2025-10-19 18:33:57');
INSERT INTO `sj_retry_task` VALUES (2086, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:33:57', '', '2025-10-19 18:33:57');
INSERT INTO `sj_retry_task` VALUES (2087, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:34:58', '', '2025-10-19 18:34:58');
INSERT INTO `sj_retry_task` VALUES (2088, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:34:58', '', '2025-10-19 18:34:58');
INSERT INTO `sj_retry_task` VALUES (2089, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:35:58', '', '2025-10-19 18:35:58');
INSERT INTO `sj_retry_task` VALUES (2090, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:35:58', '', '2025-10-19 18:35:58');
INSERT INTO `sj_retry_task` VALUES (2091, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:36:57', '', '2025-10-19 18:36:57');
INSERT INTO `sj_retry_task` VALUES (2092, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:36:57', '', '2025-10-19 18:36:57');
INSERT INTO `sj_retry_task` VALUES (2093, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:37:58', '', '2025-10-19 18:37:58');
INSERT INTO `sj_retry_task` VALUES (2094, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:37:58', '', '2025-10-19 18:37:58');
INSERT INTO `sj_retry_task` VALUES (2095, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:38:57', '', '2025-10-19 18:38:57');
INSERT INTO `sj_retry_task` VALUES (2096, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:38:57', '', '2025-10-19 18:38:57');
INSERT INTO `sj_retry_task` VALUES (2097, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:39:58', '', '2025-10-19 18:39:58');
INSERT INTO `sj_retry_task` VALUES (2098, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:39:58', '', '2025-10-19 18:39:58');
INSERT INTO `sj_retry_task` VALUES (2099, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:40:57', '', '2025-10-19 18:40:57');
INSERT INTO `sj_retry_task` VALUES (2100, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:40:57', '', '2025-10-19 18:40:57');
INSERT INTO `sj_retry_task` VALUES (2101, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:41:58', '', '2025-10-19 18:41:58');
INSERT INTO `sj_retry_task` VALUES (2102, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:41:58', '', '2025-10-19 18:41:58');
INSERT INTO `sj_retry_task` VALUES (2103, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:42:58', '', '2025-10-19 18:42:58');
INSERT INTO `sj_retry_task` VALUES (2104, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:42:58', '', '2025-10-19 18:42:58');
INSERT INTO `sj_retry_task` VALUES (2105, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:43:58', '', '2025-10-19 18:43:58');
INSERT INTO `sj_retry_task` VALUES (2106, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:43:58', '', '2025-10-19 18:43:58');
INSERT INTO `sj_retry_task` VALUES (2107, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:44:57', '', '2025-10-19 18:44:57');
INSERT INTO `sj_retry_task` VALUES (2108, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:44:57', '', '2025-10-19 18:44:57');
INSERT INTO `sj_retry_task` VALUES (2109, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:45:57', '', '2025-10-19 18:45:57');
INSERT INTO `sj_retry_task` VALUES (2110, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:45:57', '', '2025-10-19 18:45:57');
INSERT INTO `sj_retry_task` VALUES (2111, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:46:58', '', '2025-10-19 18:46:58');
INSERT INTO `sj_retry_task` VALUES (2112, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:46:58', '', '2025-10-19 18:46:58');
INSERT INTO `sj_retry_task` VALUES (2113, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:47:58', '', '2025-10-19 18:47:58');
INSERT INTO `sj_retry_task` VALUES (2114, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:47:58', '', '2025-10-19 18:47:58');
INSERT INTO `sj_retry_task` VALUES (2115, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:48:58', '', '2025-10-19 18:48:58');
INSERT INTO `sj_retry_task` VALUES (2116, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:48:58', '', '2025-10-19 18:48:58');
INSERT INTO `sj_retry_task` VALUES (2117, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:49:58', '', '2025-10-19 18:49:58');
INSERT INTO `sj_retry_task` VALUES (2118, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:49:58', '', '2025-10-19 18:49:58');
INSERT INTO `sj_retry_task` VALUES (2119, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:50:58', '', '2025-10-19 18:50:58');
INSERT INTO `sj_retry_task` VALUES (2120, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:50:58', '', '2025-10-19 18:50:58');
INSERT INTO `sj_retry_task` VALUES (2121, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:51:58', '', '2025-10-19 18:51:58');
INSERT INTO `sj_retry_task` VALUES (2122, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:51:58', '', '2025-10-19 18:51:58');
INSERT INTO `sj_retry_task` VALUES (2123, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:52:57', '', '2025-10-19 18:52:57');
INSERT INTO `sj_retry_task` VALUES (2124, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:52:57', '', '2025-10-19 18:52:57');
INSERT INTO `sj_retry_task` VALUES (2125, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:53:58', '', '2025-10-19 18:53:58');
INSERT INTO `sj_retry_task` VALUES (2126, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:53:58', '', '2025-10-19 18:53:58');
INSERT INTO `sj_retry_task` VALUES (2127, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:54:57', '', '2025-10-19 18:54:57');
INSERT INTO `sj_retry_task` VALUES (2128, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:54:57', '', '2025-10-19 18:54:57');
INSERT INTO `sj_retry_task` VALUES (2129, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:55:58', '', '2025-10-19 18:55:58');
INSERT INTO `sj_retry_task` VALUES (2130, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:55:58', '', '2025-10-19 18:55:58');
INSERT INTO `sj_retry_task` VALUES (2131, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:56:58', '', '2025-10-19 18:56:58');
INSERT INTO `sj_retry_task` VALUES (2132, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:56:58', '', '2025-10-19 18:56:58');
INSERT INTO `sj_retry_task` VALUES (2133, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:57:58', '', '2025-10-19 18:57:58');
INSERT INTO `sj_retry_task` VALUES (2134, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:57:58', '', '2025-10-19 18:57:58');
INSERT INTO `sj_retry_task` VALUES (2135, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:58:58', '', '2025-10-19 18:58:58');
INSERT INTO `sj_retry_task` VALUES (2136, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:58:58', '', '2025-10-19 18:58:58');
INSERT INTO `sj_retry_task` VALUES (2137, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 18:59:58', '', '2025-10-19 18:59:58');
INSERT INTO `sj_retry_task` VALUES (2138, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 18:59:58', '', '2025-10-19 18:59:58');
INSERT INTO `sj_retry_task` VALUES (2139, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:00:57', '', '2025-10-19 19:00:57');
INSERT INTO `sj_retry_task` VALUES (2140, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:00:57', '', '2025-10-19 19:00:57');
INSERT INTO `sj_retry_task` VALUES (2141, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:01:58', '', '2025-10-19 19:01:58');
INSERT INTO `sj_retry_task` VALUES (2142, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:01:58', '', '2025-10-19 19:01:58');
INSERT INTO `sj_retry_task` VALUES (2143, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:02:57', '', '2025-10-19 19:02:57');
INSERT INTO `sj_retry_task` VALUES (2144, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:02:57', '', '2025-10-19 19:02:57');
INSERT INTO `sj_retry_task` VALUES (2145, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:03:57', '', '2025-10-19 19:03:57');
INSERT INTO `sj_retry_task` VALUES (2146, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:03:57', '', '2025-10-19 19:03:57');
INSERT INTO `sj_retry_task` VALUES (2147, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:04:57', '', '2025-10-19 19:04:57');
INSERT INTO `sj_retry_task` VALUES (2148, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:04:57', '', '2025-10-19 19:04:57');
INSERT INTO `sj_retry_task` VALUES (2149, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:05:57', '', '2025-10-19 19:05:57');
INSERT INTO `sj_retry_task` VALUES (2150, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:05:57', '', '2025-10-19 19:05:57');
INSERT INTO `sj_retry_task` VALUES (2151, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:06:57', '', '2025-10-19 19:06:57');
INSERT INTO `sj_retry_task` VALUES (2152, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:06:57', '', '2025-10-19 19:06:57');
INSERT INTO `sj_retry_task` VALUES (2153, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:07:57', '', '2025-10-19 19:07:57');
INSERT INTO `sj_retry_task` VALUES (2154, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:07:57', '', '2025-10-19 19:07:57');
INSERT INTO `sj_retry_task` VALUES (2155, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:08:57', '', '2025-10-19 19:08:57');
INSERT INTO `sj_retry_task` VALUES (2156, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:08:57', '', '2025-10-19 19:08:57');
INSERT INTO `sj_retry_task` VALUES (2157, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:09:58', '', '2025-10-19 19:09:58');
INSERT INTO `sj_retry_task` VALUES (2158, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:09:58', '', '2025-10-19 19:09:58');
INSERT INTO `sj_retry_task` VALUES (2159, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:10:58', '', '2025-10-19 19:10:58');
INSERT INTO `sj_retry_task` VALUES (2160, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:10:58', '', '2025-10-19 19:10:58');
INSERT INTO `sj_retry_task` VALUES (2161, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:11:58', '', '2025-10-19 19:11:58');
INSERT INTO `sj_retry_task` VALUES (2162, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:11:58', '', '2025-10-19 19:11:58');
INSERT INTO `sj_retry_task` VALUES (2163, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:12:57', '', '2025-10-19 19:12:57');
INSERT INTO `sj_retry_task` VALUES (2164, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:12:57', '', '2025-10-19 19:12:57');
INSERT INTO `sj_retry_task` VALUES (2165, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:13:58', '', '2025-10-19 19:13:58');
INSERT INTO `sj_retry_task` VALUES (2166, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:13:58', '', '2025-10-19 19:13:58');
INSERT INTO `sj_retry_task` VALUES (2167, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:14:57', '', '2025-10-19 19:14:57');
INSERT INTO `sj_retry_task` VALUES (2168, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:14:57', '', '2025-10-19 19:14:57');
INSERT INTO `sj_retry_task` VALUES (2169, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:15:58', '', '2025-10-19 19:15:58');
INSERT INTO `sj_retry_task` VALUES (2170, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:15:58', '', '2025-10-19 19:15:58');
INSERT INTO `sj_retry_task` VALUES (2171, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:16:57', '', '2025-10-19 19:16:57');
INSERT INTO `sj_retry_task` VALUES (2172, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:16:57', '', '2025-10-19 19:16:57');
INSERT INTO `sj_retry_task` VALUES (2173, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:17:58', '', '2025-10-19 19:17:58');
INSERT INTO `sj_retry_task` VALUES (2174, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:17:58', '', '2025-10-19 19:17:58');
INSERT INTO `sj_retry_task` VALUES (2175, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:18:57', '', '2025-10-19 19:18:57');
INSERT INTO `sj_retry_task` VALUES (2176, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:18:57', '', '2025-10-19 19:18:57');
INSERT INTO `sj_retry_task` VALUES (2177, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:19:58', '', '2025-10-19 19:19:58');
INSERT INTO `sj_retry_task` VALUES (2178, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:19:58', '', '2025-10-19 19:19:58');
INSERT INTO `sj_retry_task` VALUES (2179, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:20:57', '', '2025-10-19 19:20:57');
INSERT INTO `sj_retry_task` VALUES (2180, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:20:57', '', '2025-10-19 19:20:57');
INSERT INTO `sj_retry_task` VALUES (2181, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:21:58', '', '2025-10-19 19:21:58');
INSERT INTO `sj_retry_task` VALUES (2182, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:21:58', '', '2025-10-19 19:21:58');
INSERT INTO `sj_retry_task` VALUES (2183, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:22:58', '', '2025-10-19 19:22:58');
INSERT INTO `sj_retry_task` VALUES (2184, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:22:58', '', '2025-10-19 19:22:58');
INSERT INTO `sj_retry_task` VALUES (2185, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:23:57', '', '2025-10-19 19:23:57');
INSERT INTO `sj_retry_task` VALUES (2186, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:23:57', '', '2025-10-19 19:23:57');
INSERT INTO `sj_retry_task` VALUES (2187, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:24:58', '', '2025-10-19 19:24:58');
INSERT INTO `sj_retry_task` VALUES (2188, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:24:58', '', '2025-10-19 19:24:58');
INSERT INTO `sj_retry_task` VALUES (2189, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:25:57', '', '2025-10-19 19:25:57');
INSERT INTO `sj_retry_task` VALUES (2190, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:25:57', '', '2025-10-19 19:25:57');
INSERT INTO `sj_retry_task` VALUES (2191, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:26:57', '', '2025-10-19 19:26:57');
INSERT INTO `sj_retry_task` VALUES (2192, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:26:57', '', '2025-10-19 19:26:57');
INSERT INTO `sj_retry_task` VALUES (2193, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:27:57', '', '2025-10-19 19:27:57');
INSERT INTO `sj_retry_task` VALUES (2194, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:27:57', '', '2025-10-19 19:27:57');
INSERT INTO `sj_retry_task` VALUES (2195, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:28:57', '', '2025-10-19 19:28:57');
INSERT INTO `sj_retry_task` VALUES (2196, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:28:57', '', '2025-10-19 19:28:57');
INSERT INTO `sj_retry_task` VALUES (2197, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:29:57', '', '2025-10-19 19:29:57');
INSERT INTO `sj_retry_task` VALUES (2198, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:29:57', '', '2025-10-19 19:29:57');
INSERT INTO `sj_retry_task` VALUES (2199, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:30:58', '', '2025-10-19 19:30:58');
INSERT INTO `sj_retry_task` VALUES (2200, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:30:58', '', '2025-10-19 19:30:58');
INSERT INTO `sj_retry_task` VALUES (2201, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:31:58', '', '2025-10-19 19:31:58');
INSERT INTO `sj_retry_task` VALUES (2202, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:31:58', '', '2025-10-19 19:31:58');
INSERT INTO `sj_retry_task` VALUES (2203, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:32:57', '', '2025-10-19 19:32:57');
INSERT INTO `sj_retry_task` VALUES (2204, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:32:57', '', '2025-10-19 19:32:57');
INSERT INTO `sj_retry_task` VALUES (2205, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:33:57', '', '2025-10-19 19:33:57');
INSERT INTO `sj_retry_task` VALUES (2206, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:33:57', '', '2025-10-19 19:33:57');
INSERT INTO `sj_retry_task` VALUES (2207, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:34:58', '', '2025-10-19 19:34:58');
INSERT INTO `sj_retry_task` VALUES (2208, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:34:58', '', '2025-10-19 19:34:58');
INSERT INTO `sj_retry_task` VALUES (2209, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:35:58', '', '2025-10-19 19:35:58');
INSERT INTO `sj_retry_task` VALUES (2210, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:35:58', '', '2025-10-19 19:35:58');
INSERT INTO `sj_retry_task` VALUES (2211, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:36:58', '', '2025-10-19 19:36:58');
INSERT INTO `sj_retry_task` VALUES (2212, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:36:58', '', '2025-10-19 19:36:58');
INSERT INTO `sj_retry_task` VALUES (2213, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:37:57', '', '2025-10-19 19:37:57');
INSERT INTO `sj_retry_task` VALUES (2214, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:37:57', '', '2025-10-19 19:37:57');
INSERT INTO `sj_retry_task` VALUES (2215, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:38:58', '', '2025-10-19 19:38:58');
INSERT INTO `sj_retry_task` VALUES (2216, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:38:58', '', '2025-10-19 19:38:58');
INSERT INTO `sj_retry_task` VALUES (2217, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:39:57', '', '2025-10-19 19:39:57');
INSERT INTO `sj_retry_task` VALUES (2218, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:39:57', '', '2025-10-19 19:39:57');
INSERT INTO `sj_retry_task` VALUES (2219, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:40:57', '', '2025-10-19 19:40:57');
INSERT INTO `sj_retry_task` VALUES (2220, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:40:57', '', '2025-10-19 19:40:57');
INSERT INTO `sj_retry_task` VALUES (2221, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:41:58', '', '2025-10-19 19:41:58');
INSERT INTO `sj_retry_task` VALUES (2222, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:41:58', '', '2025-10-19 19:41:58');
INSERT INTO `sj_retry_task` VALUES (2223, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:42:57', '', '2025-10-19 19:42:57');
INSERT INTO `sj_retry_task` VALUES (2224, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:42:57', '', '2025-10-19 19:42:57');
INSERT INTO `sj_retry_task` VALUES (2225, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:43:57', '', '2025-10-19 19:43:57');
INSERT INTO `sj_retry_task` VALUES (2226, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:43:57', '', '2025-10-19 19:43:57');
INSERT INTO `sj_retry_task` VALUES (2227, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:44:57', '', '2025-10-19 19:44:57');
INSERT INTO `sj_retry_task` VALUES (2228, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:44:57', '', '2025-10-19 19:44:57');
INSERT INTO `sj_retry_task` VALUES (2229, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:45:57', '', '2025-10-19 19:45:57');
INSERT INTO `sj_retry_task` VALUES (2230, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:45:57', '', '2025-10-19 19:45:57');
INSERT INTO `sj_retry_task` VALUES (2231, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:46:58', '', '2025-10-19 19:46:58');
INSERT INTO `sj_retry_task` VALUES (2232, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:46:58', '', '2025-10-19 19:46:58');
INSERT INTO `sj_retry_task` VALUES (2233, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:47:58', '', '2025-10-19 19:47:58');
INSERT INTO `sj_retry_task` VALUES (2234, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:47:58', '', '2025-10-19 19:47:58');
INSERT INTO `sj_retry_task` VALUES (2235, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:48:58', '', '2025-10-19 19:48:58');
INSERT INTO `sj_retry_task` VALUES (2236, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:48:58', '', '2025-10-19 19:48:58');
INSERT INTO `sj_retry_task` VALUES (2237, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:49:58', '', '2025-10-19 19:49:58');
INSERT INTO `sj_retry_task` VALUES (2238, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:49:58', '', '2025-10-19 19:49:58');
INSERT INTO `sj_retry_task` VALUES (2239, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:50:57', '', '2025-10-19 19:50:57');
INSERT INTO `sj_retry_task` VALUES (2240, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:50:57', '', '2025-10-19 19:50:57');
INSERT INTO `sj_retry_task` VALUES (2241, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:51:57', '', '2025-10-19 19:51:57');
INSERT INTO `sj_retry_task` VALUES (2242, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:51:57', '', '2025-10-19 19:51:57');
INSERT INTO `sj_retry_task` VALUES (2243, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:52:57', '', '2025-10-19 19:52:57');
INSERT INTO `sj_retry_task` VALUES (2244, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:52:57', '', '2025-10-19 19:52:57');
INSERT INTO `sj_retry_task` VALUES (2245, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:53:58', '', '2025-10-19 19:53:58');
INSERT INTO `sj_retry_task` VALUES (2246, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:53:58', '', '2025-10-19 19:53:58');
INSERT INTO `sj_retry_task` VALUES (2247, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:54:57', '', '2025-10-19 19:54:57');
INSERT INTO `sj_retry_task` VALUES (2248, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:54:57', '', '2025-10-19 19:54:57');
INSERT INTO `sj_retry_task` VALUES (2249, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:55:58', '', '2025-10-19 19:55:58');
INSERT INTO `sj_retry_task` VALUES (2250, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:55:58', '', '2025-10-19 19:55:58');
INSERT INTO `sj_retry_task` VALUES (2251, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:56:58', '', '2025-10-19 19:56:58');
INSERT INTO `sj_retry_task` VALUES (2252, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:56:58', '', '2025-10-19 19:56:58');
INSERT INTO `sj_retry_task` VALUES (2253, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:57:57', '', '2025-10-19 19:57:57');
INSERT INTO `sj_retry_task` VALUES (2254, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:57:57', '', '2025-10-19 19:57:57');
INSERT INTO `sj_retry_task` VALUES (2255, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:58:57', '', '2025-10-19 19:58:57');
INSERT INTO `sj_retry_task` VALUES (2256, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:58:57', '', '2025-10-19 19:58:57');
INSERT INTO `sj_retry_task` VALUES (2257, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 19:59:58', '', '2025-10-19 19:59:58');
INSERT INTO `sj_retry_task` VALUES (2258, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 19:59:58', '', '2025-10-19 19:59:58');
INSERT INTO `sj_retry_task` VALUES (2259, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:00:58', '', '2025-10-19 20:00:58');
INSERT INTO `sj_retry_task` VALUES (2260, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:00:58', '', '2025-10-19 20:00:58');
INSERT INTO `sj_retry_task` VALUES (2261, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:01:57', '', '2025-10-19 20:01:57');
INSERT INTO `sj_retry_task` VALUES (2262, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:01:57', '', '2025-10-19 20:01:57');
INSERT INTO `sj_retry_task` VALUES (2263, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:02:58', '', '2025-10-19 20:02:58');
INSERT INTO `sj_retry_task` VALUES (2264, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:02:58', '', '2025-10-19 20:02:58');
INSERT INTO `sj_retry_task` VALUES (2265, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:03:58', '', '2025-10-19 20:03:58');
INSERT INTO `sj_retry_task` VALUES (2266, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:03:58', '', '2025-10-19 20:03:58');
INSERT INTO `sj_retry_task` VALUES (2267, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:04:58', '', '2025-10-19 20:04:58');
INSERT INTO `sj_retry_task` VALUES (2268, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:04:58', '', '2025-10-19 20:04:58');
INSERT INTO `sj_retry_task` VALUES (2269, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:05:58', '', '2025-10-19 20:05:58');
INSERT INTO `sj_retry_task` VALUES (2270, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:05:58', '', '2025-10-19 20:05:58');
INSERT INTO `sj_retry_task` VALUES (2271, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:06:58', '', '2025-10-19 20:06:58');
INSERT INTO `sj_retry_task` VALUES (2272, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:06:58', '', '2025-10-19 20:06:58');
INSERT INTO `sj_retry_task` VALUES (2273, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:07:57', '', '2025-10-19 20:07:57');
INSERT INTO `sj_retry_task` VALUES (2274, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:07:57', '', '2025-10-19 20:07:57');
INSERT INTO `sj_retry_task` VALUES (2275, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:08:57', '', '2025-10-19 20:08:57');
INSERT INTO `sj_retry_task` VALUES (2276, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:08:57', '', '2025-10-19 20:08:57');
INSERT INTO `sj_retry_task` VALUES (2277, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:09:58', '', '2025-10-19 20:09:58');
INSERT INTO `sj_retry_task` VALUES (2278, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:09:58', '', '2025-10-19 20:09:58');
INSERT INTO `sj_retry_task` VALUES (2279, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:10:58', '', '2025-10-19 20:10:58');
INSERT INTO `sj_retry_task` VALUES (2280, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:10:58', '', '2025-10-19 20:10:58');
INSERT INTO `sj_retry_task` VALUES (2281, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:11:58', '', '2025-10-19 20:11:58');
INSERT INTO `sj_retry_task` VALUES (2282, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:11:58', '', '2025-10-19 20:11:58');
INSERT INTO `sj_retry_task` VALUES (2283, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:12:57', '', '2025-10-19 20:12:57');
INSERT INTO `sj_retry_task` VALUES (2284, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:12:57', '', '2025-10-19 20:12:57');
INSERT INTO `sj_retry_task` VALUES (2285, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:13:57', '', '2025-10-19 20:13:57');
INSERT INTO `sj_retry_task` VALUES (2286, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:13:57', '', '2025-10-19 20:13:57');
INSERT INTO `sj_retry_task` VALUES (2287, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:14:57', '', '2025-10-19 20:14:57');
INSERT INTO `sj_retry_task` VALUES (2288, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:14:57', '', '2025-10-19 20:14:57');
INSERT INTO `sj_retry_task` VALUES (2289, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:15:57', '', '2025-10-19 20:15:57');
INSERT INTO `sj_retry_task` VALUES (2290, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:15:57', '', '2025-10-19 20:15:57');
INSERT INTO `sj_retry_task` VALUES (2291, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:16:57', '', '2025-10-19 20:16:57');
INSERT INTO `sj_retry_task` VALUES (2292, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:16:57', '', '2025-10-19 20:16:57');
INSERT INTO `sj_retry_task` VALUES (2293, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:17:58', '', '2025-10-19 20:17:58');
INSERT INTO `sj_retry_task` VALUES (2294, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:17:58', '', '2025-10-19 20:17:58');
INSERT INTO `sj_retry_task` VALUES (2295, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:18:58', '', '2025-10-19 20:18:58');
INSERT INTO `sj_retry_task` VALUES (2296, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:18:58', '', '2025-10-19 20:18:58');
INSERT INTO `sj_retry_task` VALUES (2297, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:19:57', '', '2025-10-19 20:19:57');
INSERT INTO `sj_retry_task` VALUES (2298, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:19:57', '', '2025-10-19 20:19:57');
INSERT INTO `sj_retry_task` VALUES (2299, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:20:57', '', '2025-10-19 20:20:57');
INSERT INTO `sj_retry_task` VALUES (2300, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:20:57', '', '2025-10-19 20:20:57');
INSERT INTO `sj_retry_task` VALUES (2301, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:21:57', '', '2025-10-19 20:21:57');
INSERT INTO `sj_retry_task` VALUES (2302, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:21:57', '', '2025-10-19 20:21:57');
INSERT INTO `sj_retry_task` VALUES (2303, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:22:58', '', '2025-10-19 20:22:58');
INSERT INTO `sj_retry_task` VALUES (2304, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:22:58', '', '2025-10-19 20:22:58');
INSERT INTO `sj_retry_task` VALUES (2305, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:23:57', '', '2025-10-19 20:23:57');
INSERT INTO `sj_retry_task` VALUES (2306, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:23:57', '', '2025-10-19 20:23:57');
INSERT INTO `sj_retry_task` VALUES (2307, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:24:58', '', '2025-10-19 20:24:58');
INSERT INTO `sj_retry_task` VALUES (2308, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:24:58', '', '2025-10-19 20:24:58');
INSERT INTO `sj_retry_task` VALUES (2309, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:25:58', '', '2025-10-19 20:25:58');
INSERT INTO `sj_retry_task` VALUES (2310, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:25:58', '', '2025-10-19 20:25:58');
INSERT INTO `sj_retry_task` VALUES (2311, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:26:57', '', '2025-10-19 20:26:57');
INSERT INTO `sj_retry_task` VALUES (2312, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:26:57', '', '2025-10-19 20:26:57');
INSERT INTO `sj_retry_task` VALUES (2313, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:27:57', '', '2025-10-19 20:27:57');
INSERT INTO `sj_retry_task` VALUES (2314, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:27:57', '', '2025-10-19 20:27:57');
INSERT INTO `sj_retry_task` VALUES (2315, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:28:57', '', '2025-10-19 20:28:57');
INSERT INTO `sj_retry_task` VALUES (2316, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:28:57', '', '2025-10-19 20:28:57');
INSERT INTO `sj_retry_task` VALUES (2317, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:29:57', '', '2025-10-19 20:29:57');
INSERT INTO `sj_retry_task` VALUES (2318, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:29:57', '', '2025-10-19 20:29:57');
INSERT INTO `sj_retry_task` VALUES (2319, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:30:57', '', '2025-10-19 20:30:57');
INSERT INTO `sj_retry_task` VALUES (2320, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:30:57', '', '2025-10-19 20:30:57');
INSERT INTO `sj_retry_task` VALUES (2321, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:31:58', '', '2025-10-19 20:31:58');
INSERT INTO `sj_retry_task` VALUES (2322, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:31:58', '', '2025-10-19 20:31:58');
INSERT INTO `sj_retry_task` VALUES (2323, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:32:57', '', '2025-10-19 20:32:57');
INSERT INTO `sj_retry_task` VALUES (2324, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:32:57', '', '2025-10-19 20:32:57');
INSERT INTO `sj_retry_task` VALUES (2325, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:33:58', '', '2025-10-19 20:33:58');
INSERT INTO `sj_retry_task` VALUES (2326, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:33:58', '', '2025-10-19 20:33:58');
INSERT INTO `sj_retry_task` VALUES (2327, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:34:58', '', '2025-10-19 20:34:58');
INSERT INTO `sj_retry_task` VALUES (2328, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:34:58', '', '2025-10-19 20:34:58');
INSERT INTO `sj_retry_task` VALUES (2329, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:35:57', '', '2025-10-19 20:35:57');
INSERT INTO `sj_retry_task` VALUES (2330, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:35:57', '', '2025-10-19 20:35:57');
INSERT INTO `sj_retry_task` VALUES (2331, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:36:57', '', '2025-10-19 20:36:57');
INSERT INTO `sj_retry_task` VALUES (2332, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:36:57', '', '2025-10-19 20:36:57');
INSERT INTO `sj_retry_task` VALUES (2333, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:37:58', '', '2025-10-19 20:37:58');
INSERT INTO `sj_retry_task` VALUES (2334, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:37:58', '', '2025-10-19 20:37:58');
INSERT INTO `sj_retry_task` VALUES (2335, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:38:58', '', '2025-10-19 20:38:58');
INSERT INTO `sj_retry_task` VALUES (2336, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:38:58', '', '2025-10-19 20:38:58');
INSERT INTO `sj_retry_task` VALUES (2337, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:39:58', '', '2025-10-19 20:39:58');
INSERT INTO `sj_retry_task` VALUES (2338, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:39:58', '', '2025-10-19 20:39:58');
INSERT INTO `sj_retry_task` VALUES (2339, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:40:58', '', '2025-10-19 20:40:58');
INSERT INTO `sj_retry_task` VALUES (2340, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:40:58', '', '2025-10-19 20:40:58');
INSERT INTO `sj_retry_task` VALUES (2341, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:41:58', '', '2025-10-19 20:41:58');
INSERT INTO `sj_retry_task` VALUES (2342, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:41:58', '', '2025-10-19 20:41:58');
INSERT INTO `sj_retry_task` VALUES (2343, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:42:57', '', '2025-10-19 20:42:57');
INSERT INTO `sj_retry_task` VALUES (2344, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:42:57', '', '2025-10-19 20:42:57');
INSERT INTO `sj_retry_task` VALUES (2345, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:43:58', '', '2025-10-19 20:43:58');
INSERT INTO `sj_retry_task` VALUES (2346, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:43:58', '', '2025-10-19 20:43:58');
INSERT INTO `sj_retry_task` VALUES (2347, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:44:57', '', '2025-10-19 20:44:57');
INSERT INTO `sj_retry_task` VALUES (2348, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:44:57', '', '2025-10-19 20:44:57');
INSERT INTO `sj_retry_task` VALUES (2349, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:45:57', '', '2025-10-19 20:45:57');
INSERT INTO `sj_retry_task` VALUES (2350, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:45:57', '', '2025-10-19 20:45:57');
INSERT INTO `sj_retry_task` VALUES (2351, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:46:58', '', '2025-10-19 20:46:58');
INSERT INTO `sj_retry_task` VALUES (2352, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:46:58', '', '2025-10-19 20:46:58');
INSERT INTO `sj_retry_task` VALUES (2353, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:47:57', '', '2025-10-19 20:47:57');
INSERT INTO `sj_retry_task` VALUES (2354, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:47:57', '', '2025-10-19 20:47:57');
INSERT INTO `sj_retry_task` VALUES (2355, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:48:58', '', '2025-10-19 20:48:58');
INSERT INTO `sj_retry_task` VALUES (2356, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:48:58', '', '2025-10-19 20:48:58');
INSERT INTO `sj_retry_task` VALUES (2357, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:49:58', '', '2025-10-19 20:49:58');
INSERT INTO `sj_retry_task` VALUES (2358, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:49:58', '', '2025-10-19 20:49:58');
INSERT INTO `sj_retry_task` VALUES (2359, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:50:57', '', '2025-10-19 20:50:57');
INSERT INTO `sj_retry_task` VALUES (2360, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:50:57', '', '2025-10-19 20:50:57');
INSERT INTO `sj_retry_task` VALUES (2361, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:51:57', '', '2025-10-19 20:51:57');
INSERT INTO `sj_retry_task` VALUES (2362, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:51:57', '', '2025-10-19 20:51:57');
INSERT INTO `sj_retry_task` VALUES (2363, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:52:58', '', '2025-10-19 20:52:58');
INSERT INTO `sj_retry_task` VALUES (2364, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:52:58', '', '2025-10-19 20:52:58');
INSERT INTO `sj_retry_task` VALUES (2365, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:53:58', '', '2025-10-19 20:53:58');
INSERT INTO `sj_retry_task` VALUES (2366, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:53:58', '', '2025-10-19 20:53:58');
INSERT INTO `sj_retry_task` VALUES (2367, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:54:58', '', '2025-10-19 20:54:58');
INSERT INTO `sj_retry_task` VALUES (2368, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:54:58', '', '2025-10-19 20:54:58');
INSERT INTO `sj_retry_task` VALUES (2369, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:55:57', '', '2025-10-19 20:55:57');
INSERT INTO `sj_retry_task` VALUES (2370, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:55:57', '', '2025-10-19 20:55:57');
INSERT INTO `sj_retry_task` VALUES (2371, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:56:57', '', '2025-10-19 20:56:57');
INSERT INTO `sj_retry_task` VALUES (2372, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:56:57', '', '2025-10-19 20:56:57');
INSERT INTO `sj_retry_task` VALUES (2373, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:57:57', '', '2025-10-19 20:57:57');
INSERT INTO `sj_retry_task` VALUES (2374, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:57:57', '', '2025-10-19 20:57:57');
INSERT INTO `sj_retry_task` VALUES (2375, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:58:57', '', '2025-10-19 20:58:57');
INSERT INTO `sj_retry_task` VALUES (2376, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:58:57', '', '2025-10-19 20:58:57');
INSERT INTO `sj_retry_task` VALUES (2377, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 20:59:57', '', '2025-10-19 20:59:57');
INSERT INTO `sj_retry_task` VALUES (2378, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 20:59:57', '', '2025-10-19 20:59:57');
INSERT INTO `sj_retry_task` VALUES (2379, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:00:57', '', '2025-10-19 21:00:57');
INSERT INTO `sj_retry_task` VALUES (2380, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:00:57', '', '2025-10-19 21:00:57');
INSERT INTO `sj_retry_task` VALUES (2381, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:01:57', '', '2025-10-19 21:01:57');
INSERT INTO `sj_retry_task` VALUES (2382, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:01:57', '', '2025-10-19 21:01:57');
INSERT INTO `sj_retry_task` VALUES (2383, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:02:57', '', '2025-10-19 21:02:57');
INSERT INTO `sj_retry_task` VALUES (2384, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:02:57', '', '2025-10-19 21:02:57');
INSERT INTO `sj_retry_task` VALUES (2385, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:03:57', '', '2025-10-19 21:03:57');
INSERT INTO `sj_retry_task` VALUES (2386, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:03:57', '', '2025-10-19 21:03:57');
INSERT INTO `sj_retry_task` VALUES (2387, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:04:57', '', '2025-10-19 21:04:57');
INSERT INTO `sj_retry_task` VALUES (2388, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:04:57', '', '2025-10-19 21:04:57');
INSERT INTO `sj_retry_task` VALUES (2389, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:05:57', '', '2025-10-19 21:05:57');
INSERT INTO `sj_retry_task` VALUES (2390, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:05:57', '', '2025-10-19 21:05:57');
INSERT INTO `sj_retry_task` VALUES (2391, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:06:57', '', '2025-10-19 21:06:57');
INSERT INTO `sj_retry_task` VALUES (2392, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:06:57', '', '2025-10-19 21:06:57');
INSERT INTO `sj_retry_task` VALUES (2393, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:07:57', '', '2025-10-19 21:07:57');
INSERT INTO `sj_retry_task` VALUES (2394, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:07:57', '', '2025-10-19 21:07:57');
INSERT INTO `sj_retry_task` VALUES (2395, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:08:57', '', '2025-10-19 21:08:57');
INSERT INTO `sj_retry_task` VALUES (2396, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:08:57', '', '2025-10-19 21:08:57');
INSERT INTO `sj_retry_task` VALUES (2397, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:09:57', '', '2025-10-19 21:09:57');
INSERT INTO `sj_retry_task` VALUES (2398, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:09:57', '', '2025-10-19 21:09:57');
INSERT INTO `sj_retry_task` VALUES (2399, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:10:57', '', '2025-10-19 21:10:57');
INSERT INTO `sj_retry_task` VALUES (2400, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:10:57', '', '2025-10-19 21:10:57');
INSERT INTO `sj_retry_task` VALUES (2401, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:11:57', '', '2025-10-19 21:11:57');
INSERT INTO `sj_retry_task` VALUES (2402, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:11:57', '', '2025-10-19 21:11:57');
INSERT INTO `sj_retry_task` VALUES (2403, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:12:57', '', '2025-10-19 21:12:57');
INSERT INTO `sj_retry_task` VALUES (2404, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:12:57', '', '2025-10-19 21:12:57');
INSERT INTO `sj_retry_task` VALUES (2405, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:13:57', '', '2025-10-19 21:13:57');
INSERT INTO `sj_retry_task` VALUES (2406, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:13:57', '', '2025-10-19 21:13:57');
INSERT INTO `sj_retry_task` VALUES (2407, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:14:57', '', '2025-10-19 21:14:57');
INSERT INTO `sj_retry_task` VALUES (2408, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:14:57', '', '2025-10-19 21:14:57');
INSERT INTO `sj_retry_task` VALUES (2409, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:15:57', '', '2025-10-19 21:15:57');
INSERT INTO `sj_retry_task` VALUES (2410, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:15:57', '', '2025-10-19 21:15:57');
INSERT INTO `sj_retry_task` VALUES (2411, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:16:57', '', '2025-10-19 21:16:57');
INSERT INTO `sj_retry_task` VALUES (2412, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:16:57', '', '2025-10-19 21:16:57');
INSERT INTO `sj_retry_task` VALUES (2413, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:17:57', '', '2025-10-19 21:17:57');
INSERT INTO `sj_retry_task` VALUES (2414, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:17:57', '', '2025-10-19 21:17:57');
INSERT INTO `sj_retry_task` VALUES (2415, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:18:57', '', '2025-10-19 21:18:57');
INSERT INTO `sj_retry_task` VALUES (2416, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:18:57', '', '2025-10-19 21:18:57');
INSERT INTO `sj_retry_task` VALUES (2417, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:19:57', '', '2025-10-19 21:19:57');
INSERT INTO `sj_retry_task` VALUES (2418, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:19:57', '', '2025-10-19 21:19:57');
INSERT INTO `sj_retry_task` VALUES (2419, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:20:57', '', '2025-10-19 21:20:57');
INSERT INTO `sj_retry_task` VALUES (2420, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:20:57', '', '2025-10-19 21:20:57');
INSERT INTO `sj_retry_task` VALUES (2421, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:21:57', '', '2025-10-19 21:21:57');
INSERT INTO `sj_retry_task` VALUES (2422, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:21:57', '', '2025-10-19 21:21:57');
INSERT INTO `sj_retry_task` VALUES (2423, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:22:57', '', '2025-10-19 21:22:57');
INSERT INTO `sj_retry_task` VALUES (2424, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:22:57', '', '2025-10-19 21:22:57');
INSERT INTO `sj_retry_task` VALUES (2425, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:23:57', '', '2025-10-19 21:23:57');
INSERT INTO `sj_retry_task` VALUES (2426, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:23:57', '', '2025-10-19 21:23:57');
INSERT INTO `sj_retry_task` VALUES (2427, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:24:57', '', '2025-10-19 21:24:57');
INSERT INTO `sj_retry_task` VALUES (2428, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:24:57', '', '2025-10-19 21:24:57');
INSERT INTO `sj_retry_task` VALUES (2429, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:25:57', '', '2025-10-19 21:25:57');
INSERT INTO `sj_retry_task` VALUES (2430, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:25:57', '', '2025-10-19 21:25:57');
INSERT INTO `sj_retry_task` VALUES (2431, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:26:57', '', '2025-10-19 21:26:57');
INSERT INTO `sj_retry_task` VALUES (2432, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:26:57', '', '2025-10-19 21:26:57');
INSERT INTO `sj_retry_task` VALUES (2433, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:27:57', '', '2025-10-19 21:27:57');
INSERT INTO `sj_retry_task` VALUES (2434, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:27:57', '', '2025-10-19 21:27:57');
INSERT INTO `sj_retry_task` VALUES (2435, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:28:57', '', '2025-10-19 21:28:57');
INSERT INTO `sj_retry_task` VALUES (2436, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:28:57', '', '2025-10-19 21:28:57');
INSERT INTO `sj_retry_task` VALUES (2437, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:29:57', '', '2025-10-19 21:29:57');
INSERT INTO `sj_retry_task` VALUES (2438, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:29:57', '', '2025-10-19 21:29:57');
INSERT INTO `sj_retry_task` VALUES (2439, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:30:57', '', '2025-10-19 21:30:57');
INSERT INTO `sj_retry_task` VALUES (2440, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:30:57', '', '2025-10-19 21:30:57');
INSERT INTO `sj_retry_task` VALUES (2441, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:31:57', '', '2025-10-19 21:31:57');
INSERT INTO `sj_retry_task` VALUES (2442, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:31:57', '', '2025-10-19 21:31:57');
INSERT INTO `sj_retry_task` VALUES (2443, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:32:57', '', '2025-10-19 21:32:57');
INSERT INTO `sj_retry_task` VALUES (2444, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:32:57', '', '2025-10-19 21:32:57');
INSERT INTO `sj_retry_task` VALUES (2445, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:33:57', '', '2025-10-19 21:33:57');
INSERT INTO `sj_retry_task` VALUES (2446, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:33:57', '', '2025-10-19 21:33:57');
INSERT INTO `sj_retry_task` VALUES (2447, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:34:57', '', '2025-10-19 21:34:57');
INSERT INTO `sj_retry_task` VALUES (2448, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:34:57', '', '2025-10-19 21:34:57');
INSERT INTO `sj_retry_task` VALUES (2449, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:35:57', '', '2025-10-19 21:35:57');
INSERT INTO `sj_retry_task` VALUES (2450, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:35:57', '', '2025-10-19 21:35:57');
INSERT INTO `sj_retry_task` VALUES (2451, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:36:57', '', '2025-10-19 21:36:57');
INSERT INTO `sj_retry_task` VALUES (2452, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:36:57', '', '2025-10-19 21:36:57');
INSERT INTO `sj_retry_task` VALUES (2453, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:37:57', '', '2025-10-19 21:37:57');
INSERT INTO `sj_retry_task` VALUES (2454, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:37:57', '', '2025-10-19 21:37:57');
INSERT INTO `sj_retry_task` VALUES (2455, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:38:57', '', '2025-10-19 21:38:57');
INSERT INTO `sj_retry_task` VALUES (2456, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:38:57', '', '2025-10-19 21:38:57');
INSERT INTO `sj_retry_task` VALUES (2457, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:39:57', '', '2025-10-19 21:39:57');
INSERT INTO `sj_retry_task` VALUES (2458, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:39:57', '', '2025-10-19 21:39:57');
INSERT INTO `sj_retry_task` VALUES (2459, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:40:57', '', '2025-10-19 21:40:57');
INSERT INTO `sj_retry_task` VALUES (2460, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:40:57', '', '2025-10-19 21:40:57');
INSERT INTO `sj_retry_task` VALUES (2461, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:41:57', '', '2025-10-19 21:41:57');
INSERT INTO `sj_retry_task` VALUES (2462, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:41:57', '', '2025-10-19 21:41:57');
INSERT INTO `sj_retry_task` VALUES (2463, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:42:57', '', '2025-10-19 21:42:57');
INSERT INTO `sj_retry_task` VALUES (2464, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:42:57', '', '2025-10-19 21:42:57');
INSERT INTO `sj_retry_task` VALUES (2465, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:43:57', '', '2025-10-19 21:43:57');
INSERT INTO `sj_retry_task` VALUES (2466, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:43:57', '', '2025-10-19 21:43:57');
INSERT INTO `sj_retry_task` VALUES (2467, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:44:57', '', '2025-10-19 21:44:57');
INSERT INTO `sj_retry_task` VALUES (2468, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:44:57', '', '2025-10-19 21:44:57');
INSERT INTO `sj_retry_task` VALUES (2469, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:45:57', '', '2025-10-19 21:45:57');
INSERT INTO `sj_retry_task` VALUES (2470, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:45:57', '', '2025-10-19 21:45:57');
INSERT INTO `sj_retry_task` VALUES (2471, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:46:57', '', '2025-10-19 21:46:57');
INSERT INTO `sj_retry_task` VALUES (2472, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:46:57', '', '2025-10-19 21:46:57');
INSERT INTO `sj_retry_task` VALUES (2473, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:47:58', '', '2025-10-19 21:47:58');
INSERT INTO `sj_retry_task` VALUES (2474, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:47:58', '', '2025-10-19 21:47:58');
INSERT INTO `sj_retry_task` VALUES (2475, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:48:57', '', '2025-10-19 21:48:57');
INSERT INTO `sj_retry_task` VALUES (2476, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:48:57', '', '2025-10-19 21:48:57');
INSERT INTO `sj_retry_task` VALUES (2477, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:49:57', '', '2025-10-19 21:49:57');
INSERT INTO `sj_retry_task` VALUES (2478, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:49:57', '', '2025-10-19 21:49:57');
INSERT INTO `sj_retry_task` VALUES (2479, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:50:57', '', '2025-10-19 21:50:57');
INSERT INTO `sj_retry_task` VALUES (2480, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:50:57', '', '2025-10-19 21:50:57');
INSERT INTO `sj_retry_task` VALUES (2481, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:51:57', '', '2025-10-19 21:51:57');
INSERT INTO `sj_retry_task` VALUES (2482, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:51:57', '', '2025-10-19 21:51:57');
INSERT INTO `sj_retry_task` VALUES (2483, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:52:58', '', '2025-10-19 21:52:58');
INSERT INTO `sj_retry_task` VALUES (2484, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:52:58', '', '2025-10-19 21:52:58');
INSERT INTO `sj_retry_task` VALUES (2485, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:53:57', '', '2025-10-19 21:53:57');
INSERT INTO `sj_retry_task` VALUES (2486, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:53:57', '', '2025-10-19 21:53:57');
INSERT INTO `sj_retry_task` VALUES (2487, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:54:58', '', '2025-10-19 21:54:58');
INSERT INTO `sj_retry_task` VALUES (2488, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:54:58', '', '2025-10-19 21:54:58');
INSERT INTO `sj_retry_task` VALUES (2489, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:55:57', '', '2025-10-19 21:55:57');
INSERT INTO `sj_retry_task` VALUES (2490, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:55:57', '', '2025-10-19 21:55:57');
INSERT INTO `sj_retry_task` VALUES (2491, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:56:58', '', '2025-10-19 21:56:58');
INSERT INTO `sj_retry_task` VALUES (2492, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:56:58', '', '2025-10-19 21:56:58');
INSERT INTO `sj_retry_task` VALUES (2493, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:57:57', '', '2025-10-19 21:57:57');
INSERT INTO `sj_retry_task` VALUES (2494, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:57:57', '', '2025-10-19 21:57:57');
INSERT INTO `sj_retry_task` VALUES (2495, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:58:57', '', '2025-10-19 21:58:57');
INSERT INTO `sj_retry_task` VALUES (2496, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:58:57', '', '2025-10-19 21:58:57');
INSERT INTO `sj_retry_task` VALUES (2497, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 21:59:57', '', '2025-10-19 21:59:57');
INSERT INTO `sj_retry_task` VALUES (2498, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 21:59:57', '', '2025-10-19 21:59:57');
INSERT INTO `sj_retry_task` VALUES (2499, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:00:58', '', '2025-10-19 22:00:58');
INSERT INTO `sj_retry_task` VALUES (2500, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:00:58', '', '2025-10-19 22:00:58');
INSERT INTO `sj_retry_task` VALUES (2501, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:01:57', '', '2025-10-19 22:01:57');
INSERT INTO `sj_retry_task` VALUES (2502, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:01:57', '', '2025-10-19 22:01:57');
INSERT INTO `sj_retry_task` VALUES (2503, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:02:57', '', '2025-10-19 22:02:57');
INSERT INTO `sj_retry_task` VALUES (2504, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:02:57', '', '2025-10-19 22:02:57');
INSERT INTO `sj_retry_task` VALUES (2505, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:03:57', '', '2025-10-19 22:03:57');
INSERT INTO `sj_retry_task` VALUES (2506, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:03:57', '', '2025-10-19 22:03:57');
INSERT INTO `sj_retry_task` VALUES (2507, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:04:57', '', '2025-10-19 22:04:57');
INSERT INTO `sj_retry_task` VALUES (2508, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:04:57', '', '2025-10-19 22:04:57');
INSERT INTO `sj_retry_task` VALUES (2509, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:05:58', '', '2025-10-19 22:05:58');
INSERT INTO `sj_retry_task` VALUES (2510, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:05:58', '', '2025-10-19 22:05:58');
INSERT INTO `sj_retry_task` VALUES (2511, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:06:58', '', '2025-10-19 22:06:58');
INSERT INTO `sj_retry_task` VALUES (2512, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:06:58', '', '2025-10-19 22:06:58');
INSERT INTO `sj_retry_task` VALUES (2513, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:07:57', '', '2025-10-19 22:07:57');
INSERT INTO `sj_retry_task` VALUES (2514, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:07:57', '', '2025-10-19 22:07:57');
INSERT INTO `sj_retry_task` VALUES (2515, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:08:58', '', '2025-10-19 22:08:58');
INSERT INTO `sj_retry_task` VALUES (2516, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:08:58', '', '2025-10-19 22:08:58');
INSERT INTO `sj_retry_task` VALUES (2517, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:09:58', '', '2025-10-19 22:09:58');
INSERT INTO `sj_retry_task` VALUES (2518, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:09:58', '', '2025-10-19 22:09:58');
INSERT INTO `sj_retry_task` VALUES (2519, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:10:57', '', '2025-10-19 22:10:57');
INSERT INTO `sj_retry_task` VALUES (2520, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:10:57', '', '2025-10-19 22:10:57');
INSERT INTO `sj_retry_task` VALUES (2521, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:11:57', '', '2025-10-19 22:11:57');
INSERT INTO `sj_retry_task` VALUES (2522, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:11:57', '', '2025-10-19 22:11:57');
INSERT INTO `sj_retry_task` VALUES (2523, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:12:58', '', '2025-10-19 22:12:58');
INSERT INTO `sj_retry_task` VALUES (2524, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:12:58', '', '2025-10-19 22:12:58');
INSERT INTO `sj_retry_task` VALUES (2525, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:13:58', '', '2025-10-19 22:13:58');
INSERT INTO `sj_retry_task` VALUES (2526, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:13:58', '', '2025-10-19 22:13:58');
INSERT INTO `sj_retry_task` VALUES (2527, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:14:58', '', '2025-10-19 22:14:58');
INSERT INTO `sj_retry_task` VALUES (2528, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:14:58', '', '2025-10-19 22:14:58');
INSERT INTO `sj_retry_task` VALUES (2529, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:15:57', '', '2025-10-19 22:15:57');
INSERT INTO `sj_retry_task` VALUES (2530, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:15:57', '', '2025-10-19 22:15:57');
INSERT INTO `sj_retry_task` VALUES (2531, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:16:57', '', '2025-10-19 22:16:57');
INSERT INTO `sj_retry_task` VALUES (2532, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:16:57', '', '2025-10-19 22:16:57');
INSERT INTO `sj_retry_task` VALUES (2533, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:17:58', '', '2025-10-19 22:17:58');
INSERT INTO `sj_retry_task` VALUES (2534, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:17:58', '', '2025-10-19 22:17:58');
INSERT INTO `sj_retry_task` VALUES (2535, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:18:58', '', '2025-10-19 22:18:58');
INSERT INTO `sj_retry_task` VALUES (2536, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:18:58', '', '2025-10-19 22:18:58');
INSERT INTO `sj_retry_task` VALUES (2537, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:19:57', '', '2025-10-19 22:19:57');
INSERT INTO `sj_retry_task` VALUES (2538, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:19:57', '', '2025-10-19 22:19:57');
INSERT INTO `sj_retry_task` VALUES (2539, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:20:57', '', '2025-10-19 22:20:57');
INSERT INTO `sj_retry_task` VALUES (2540, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:20:57', '', '2025-10-19 22:20:57');
INSERT INTO `sj_retry_task` VALUES (2541, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:21:57', '', '2025-10-19 22:21:57');
INSERT INTO `sj_retry_task` VALUES (2542, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:21:57', '', '2025-10-19 22:21:57');
INSERT INTO `sj_retry_task` VALUES (2543, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:22:57', '', '2025-10-19 22:22:57');
INSERT INTO `sj_retry_task` VALUES (2544, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:22:57', '', '2025-10-19 22:22:57');
INSERT INTO `sj_retry_task` VALUES (2545, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:23:58', '', '2025-10-19 22:23:58');
INSERT INTO `sj_retry_task` VALUES (2546, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:23:58', '', '2025-10-19 22:23:58');
INSERT INTO `sj_retry_task` VALUES (2547, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:24:58', '', '2025-10-19 22:24:58');
INSERT INTO `sj_retry_task` VALUES (2548, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:24:58', '', '2025-10-19 22:24:58');
INSERT INTO `sj_retry_task` VALUES (2549, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:25:57', '', '2025-10-19 22:25:57');
INSERT INTO `sj_retry_task` VALUES (2550, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:25:57', '', '2025-10-19 22:25:57');
INSERT INTO `sj_retry_task` VALUES (2551, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:26:57', '', '2025-10-19 22:26:57');
INSERT INTO `sj_retry_task` VALUES (2552, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:26:57', '', '2025-10-19 22:26:57');
INSERT INTO `sj_retry_task` VALUES (2553, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:27:57', '', '2025-10-19 22:27:57');
INSERT INTO `sj_retry_task` VALUES (2554, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:27:57', '', '2025-10-19 22:27:57');
INSERT INTO `sj_retry_task` VALUES (2555, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:28:58', '', '2025-10-19 22:28:58');
INSERT INTO `sj_retry_task` VALUES (2556, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:28:58', '', '2025-10-19 22:28:58');
INSERT INTO `sj_retry_task` VALUES (2557, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:29:57', '', '2025-10-19 22:29:57');
INSERT INTO `sj_retry_task` VALUES (2558, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:29:57', '', '2025-10-19 22:29:57');
INSERT INTO `sj_retry_task` VALUES (2559, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:30:58', '', '2025-10-19 22:30:58');
INSERT INTO `sj_retry_task` VALUES (2560, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:30:58', '', '2025-10-19 22:30:58');
INSERT INTO `sj_retry_task` VALUES (2561, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:31:58', '', '2025-10-19 22:31:58');
INSERT INTO `sj_retry_task` VALUES (2562, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:31:58', '', '2025-10-19 22:31:58');
INSERT INTO `sj_retry_task` VALUES (2563, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:32:58', '', '2025-10-19 22:32:58');
INSERT INTO `sj_retry_task` VALUES (2564, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:32:58', '', '2025-10-19 22:32:58');
INSERT INTO `sj_retry_task` VALUES (2565, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:33:57', '', '2025-10-19 22:33:57');
INSERT INTO `sj_retry_task` VALUES (2566, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:33:57', '', '2025-10-19 22:33:57');
INSERT INTO `sj_retry_task` VALUES (2567, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:34:57', '', '2025-10-19 22:34:57');
INSERT INTO `sj_retry_task` VALUES (2568, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:34:57', '', '2025-10-19 22:34:57');
INSERT INTO `sj_retry_task` VALUES (2569, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:35:57', '', '2025-10-19 22:35:57');
INSERT INTO `sj_retry_task` VALUES (2570, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:35:57', '', '2025-10-19 22:35:57');
INSERT INTO `sj_retry_task` VALUES (2571, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:36:57', '', '2025-10-19 22:36:57');
INSERT INTO `sj_retry_task` VALUES (2572, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:36:57', '', '2025-10-19 22:36:57');
INSERT INTO `sj_retry_task` VALUES (2573, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:37:57', '', '2025-10-19 22:37:57');
INSERT INTO `sj_retry_task` VALUES (2574, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:37:57', '', '2025-10-19 22:37:57');
INSERT INTO `sj_retry_task` VALUES (2575, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:38:57', '', '2025-10-19 22:38:57');
INSERT INTO `sj_retry_task` VALUES (2576, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:38:57', '', '2025-10-19 22:38:57');
INSERT INTO `sj_retry_task` VALUES (2577, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:39:57', '', '2025-10-19 22:39:57');
INSERT INTO `sj_retry_task` VALUES (2578, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:39:57', '', '2025-10-19 22:39:57');
INSERT INTO `sj_retry_task` VALUES (2579, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:40:57', '', '2025-10-19 22:40:57');
INSERT INTO `sj_retry_task` VALUES (2580, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:40:57', '', '2025-10-19 22:40:57');
INSERT INTO `sj_retry_task` VALUES (2581, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:41:57', '', '2025-10-19 22:41:57');
INSERT INTO `sj_retry_task` VALUES (2582, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:41:57', '', '2025-10-19 22:41:57');
INSERT INTO `sj_retry_task` VALUES (2583, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:42:57', '', '2025-10-19 22:42:57');
INSERT INTO `sj_retry_task` VALUES (2584, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:42:57', '', '2025-10-19 22:42:57');
INSERT INTO `sj_retry_task` VALUES (2585, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:43:57', '', '2025-10-19 22:43:57');
INSERT INTO `sj_retry_task` VALUES (2586, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:43:57', '', '2025-10-19 22:43:57');
INSERT INTO `sj_retry_task` VALUES (2587, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:44:57', '', '2025-10-19 22:44:57');
INSERT INTO `sj_retry_task` VALUES (2588, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:44:57', '', '2025-10-19 22:44:57');
INSERT INTO `sj_retry_task` VALUES (2589, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:45:58', '', '2025-10-19 22:45:58');
INSERT INTO `sj_retry_task` VALUES (2590, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:45:58', '', '2025-10-19 22:45:58');
INSERT INTO `sj_retry_task` VALUES (2591, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:46:57', '', '2025-10-19 22:46:57');
INSERT INTO `sj_retry_task` VALUES (2592, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:46:57', '', '2025-10-19 22:46:57');
INSERT INTO `sj_retry_task` VALUES (2593, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:47:57', '', '2025-10-19 22:47:57');
INSERT INTO `sj_retry_task` VALUES (2594, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:47:57', '', '2025-10-19 22:47:57');
INSERT INTO `sj_retry_task` VALUES (2595, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:48:58', '', '2025-10-19 22:48:58');
INSERT INTO `sj_retry_task` VALUES (2596, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:48:58', '', '2025-10-19 22:48:58');
INSERT INTO `sj_retry_task` VALUES (2597, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:49:57', '', '2025-10-19 22:49:57');
INSERT INTO `sj_retry_task` VALUES (2598, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:49:57', '', '2025-10-19 22:49:57');
INSERT INTO `sj_retry_task` VALUES (2599, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:50:58', '', '2025-10-19 22:50:58');
INSERT INTO `sj_retry_task` VALUES (2600, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:50:58', '', '2025-10-19 22:50:58');
INSERT INTO `sj_retry_task` VALUES (2601, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:51:57', '', '2025-10-19 22:51:57');
INSERT INTO `sj_retry_task` VALUES (2602, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:51:57', '', '2025-10-19 22:51:57');
INSERT INTO `sj_retry_task` VALUES (2603, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:52:58', '', '2025-10-19 22:52:58');
INSERT INTO `sj_retry_task` VALUES (2604, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:52:58', '', '2025-10-19 22:52:58');
INSERT INTO `sj_retry_task` VALUES (2605, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:53:57', '', '2025-10-19 22:53:57');
INSERT INTO `sj_retry_task` VALUES (2606, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:53:57', '', '2025-10-19 22:53:57');
INSERT INTO `sj_retry_task` VALUES (2607, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:54:57', '', '2025-10-19 22:54:57');
INSERT INTO `sj_retry_task` VALUES (2608, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:54:57', '', '2025-10-19 22:54:57');
INSERT INTO `sj_retry_task` VALUES (2609, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:55:57', '', '2025-10-19 22:55:57');
INSERT INTO `sj_retry_task` VALUES (2610, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:55:57', '', '2025-10-19 22:55:57');
INSERT INTO `sj_retry_task` VALUES (2611, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:56:57', '', '2025-10-19 22:56:57');
INSERT INTO `sj_retry_task` VALUES (2612, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:56:57', '', '2025-10-19 22:56:57');
INSERT INTO `sj_retry_task` VALUES (2613, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:57:57', '', '2025-10-19 22:57:57');
INSERT INTO `sj_retry_task` VALUES (2614, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:57:57', '', '2025-10-19 22:57:57');
INSERT INTO `sj_retry_task` VALUES (2615, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:58:57', '', '2025-10-19 22:58:57');
INSERT INTO `sj_retry_task` VALUES (2616, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:58:57', '', '2025-10-19 22:58:57');
INSERT INTO `sj_retry_task` VALUES (2617, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 22:59:58', '', '2025-10-19 22:59:58');
INSERT INTO `sj_retry_task` VALUES (2618, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 22:59:58', '', '2025-10-19 22:59:58');
INSERT INTO `sj_retry_task` VALUES (2619, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:00:58', '', '2025-10-19 23:00:58');
INSERT INTO `sj_retry_task` VALUES (2620, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:00:58', '', '2025-10-19 23:00:58');
INSERT INTO `sj_retry_task` VALUES (2621, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:01:57', '', '2025-10-19 23:01:57');
INSERT INTO `sj_retry_task` VALUES (2622, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:01:57', '', '2025-10-19 23:01:57');
INSERT INTO `sj_retry_task` VALUES (2623, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:02:58', '', '2025-10-19 23:02:58');
INSERT INTO `sj_retry_task` VALUES (2624, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:02:58', '', '2025-10-19 23:02:58');
INSERT INTO `sj_retry_task` VALUES (2625, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:03:57', '', '2025-10-19 23:03:57');
INSERT INTO `sj_retry_task` VALUES (2626, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:03:57', '', '2025-10-19 23:03:57');
INSERT INTO `sj_retry_task` VALUES (2627, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:04:57', '', '2025-10-19 23:04:57');
INSERT INTO `sj_retry_task` VALUES (2628, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:04:57', '', '2025-10-19 23:04:57');
INSERT INTO `sj_retry_task` VALUES (2629, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:05:57', '', '2025-10-19 23:05:57');
INSERT INTO `sj_retry_task` VALUES (2630, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:05:57', '', '2025-10-19 23:05:57');
INSERT INTO `sj_retry_task` VALUES (2631, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:06:57', '', '2025-10-19 23:06:57');
INSERT INTO `sj_retry_task` VALUES (2632, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:06:57', '', '2025-10-19 23:06:57');
INSERT INTO `sj_retry_task` VALUES (2633, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:07:57', '', '2025-10-19 23:07:57');
INSERT INTO `sj_retry_task` VALUES (2634, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:07:57', '', '2025-10-19 23:07:57');
INSERT INTO `sj_retry_task` VALUES (2635, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:08:57', '', '2025-10-19 23:08:57');
INSERT INTO `sj_retry_task` VALUES (2636, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:08:57', '', '2025-10-19 23:08:57');
INSERT INTO `sj_retry_task` VALUES (2637, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:09:57', '', '2025-10-19 23:09:57');
INSERT INTO `sj_retry_task` VALUES (2638, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:09:57', '', '2025-10-19 23:09:57');
INSERT INTO `sj_retry_task` VALUES (2639, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:10:57', '', '2025-10-19 23:10:57');
INSERT INTO `sj_retry_task` VALUES (2640, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:10:57', '', '2025-10-19 23:10:57');
INSERT INTO `sj_retry_task` VALUES (2641, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:11:57', '', '2025-10-19 23:11:57');
INSERT INTO `sj_retry_task` VALUES (2642, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:11:57', '', '2025-10-19 23:11:57');
INSERT INTO `sj_retry_task` VALUES (2643, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:12:57', '', '2025-10-19 23:12:57');
INSERT INTO `sj_retry_task` VALUES (2644, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:12:57', '', '2025-10-19 23:12:57');
INSERT INTO `sj_retry_task` VALUES (2645, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:13:57', '', '2025-10-19 23:13:57');
INSERT INTO `sj_retry_task` VALUES (2646, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:13:57', '', '2025-10-19 23:13:57');
INSERT INTO `sj_retry_task` VALUES (2647, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:14:57', '', '2025-10-19 23:14:57');
INSERT INTO `sj_retry_task` VALUES (2648, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:14:57', '', '2025-10-19 23:14:57');
INSERT INTO `sj_retry_task` VALUES (2649, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:15:57', '', '2025-10-19 23:15:57');
INSERT INTO `sj_retry_task` VALUES (2650, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:15:57', '', '2025-10-19 23:15:57');
INSERT INTO `sj_retry_task` VALUES (2651, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:16:57', '', '2025-10-19 23:16:57');
INSERT INTO `sj_retry_task` VALUES (2652, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:16:57', '', '2025-10-19 23:16:57');
INSERT INTO `sj_retry_task` VALUES (2653, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:18:16', '', '2025-10-19 23:18:16');
INSERT INTO `sj_retry_task` VALUES (2654, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:18:16', '', '2025-10-19 23:18:16');
INSERT INTO `sj_retry_task` VALUES (2655, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:19:16', '', '2025-10-19 23:19:16');
INSERT INTO `sj_retry_task` VALUES (2656, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:19:16', '', '2025-10-19 23:19:16');
INSERT INTO `sj_retry_task` VALUES (2657, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:20:16', '', '2025-10-19 23:20:16');
INSERT INTO `sj_retry_task` VALUES (2658, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:20:16', '', '2025-10-19 23:20:16');
INSERT INTO `sj_retry_task` VALUES (2659, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:21:16', '', '2025-10-19 23:21:16');
INSERT INTO `sj_retry_task` VALUES (2660, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:21:16', '', '2025-10-19 23:21:16');
INSERT INTO `sj_retry_task` VALUES (2661, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:22:16', '', '2025-10-19 23:22:16');
INSERT INTO `sj_retry_task` VALUES (2662, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:22:16', '', '2025-10-19 23:22:16');
INSERT INTO `sj_retry_task` VALUES (2663, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:23:16', '', '2025-10-19 23:23:16');
INSERT INTO `sj_retry_task` VALUES (2664, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:23:16', '', '2025-10-19 23:23:16');
INSERT INTO `sj_retry_task` VALUES (2665, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:24:16', '', '2025-10-19 23:24:16');
INSERT INTO `sj_retry_task` VALUES (2666, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:24:16', '', '2025-10-19 23:24:16');
INSERT INTO `sj_retry_task` VALUES (2667, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:25:16', '', '2025-10-19 23:25:16');
INSERT INTO `sj_retry_task` VALUES (2668, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:25:16', '', '2025-10-19 23:25:16');
INSERT INTO `sj_retry_task` VALUES (2669, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:26:17', '', '2025-10-19 23:26:17');
INSERT INTO `sj_retry_task` VALUES (2670, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:26:17', '', '2025-10-19 23:26:17');
INSERT INTO `sj_retry_task` VALUES (2671, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:27:16', '', '2025-10-19 23:27:16');
INSERT INTO `sj_retry_task` VALUES (2672, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:27:16', '', '2025-10-19 23:27:16');
INSERT INTO `sj_retry_task` VALUES (2673, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:28:16', '', '2025-10-19 23:28:16');
INSERT INTO `sj_retry_task` VALUES (2674, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:28:16', '', '2025-10-19 23:28:16');
INSERT INTO `sj_retry_task` VALUES (2675, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:29:16', '', '2025-10-19 23:29:16');
INSERT INTO `sj_retry_task` VALUES (2676, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:29:16', '', '2025-10-19 23:29:16');
INSERT INTO `sj_retry_task` VALUES (2677, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:30:16', '', '2025-10-19 23:30:16');
INSERT INTO `sj_retry_task` VALUES (2678, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:30:16', '', '2025-10-19 23:30:16');
INSERT INTO `sj_retry_task` VALUES (2679, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:31:16', '', '2025-10-19 23:31:16');
INSERT INTO `sj_retry_task` VALUES (2680, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:31:16', '', '2025-10-19 23:31:16');
INSERT INTO `sj_retry_task` VALUES (2681, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:32:16', '', '2025-10-19 23:32:16');
INSERT INTO `sj_retry_task` VALUES (2682, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:32:16', '', '2025-10-19 23:32:16');
INSERT INTO `sj_retry_task` VALUES (2683, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:33:16', '', '2025-10-19 23:33:16');
INSERT INTO `sj_retry_task` VALUES (2684, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:33:16', '', '2025-10-19 23:33:16');
INSERT INTO `sj_retry_task` VALUES (2685, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:34:16', '', '2025-10-19 23:34:16');
INSERT INTO `sj_retry_task` VALUES (2686, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:34:16', '', '2025-10-19 23:34:16');
INSERT INTO `sj_retry_task` VALUES (2687, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:35:16', '', '2025-10-19 23:35:16');
INSERT INTO `sj_retry_task` VALUES (2688, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:35:16', '', '2025-10-19 23:35:16');
INSERT INTO `sj_retry_task` VALUES (2689, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:36:16', '', '2025-10-19 23:36:16');
INSERT INTO `sj_retry_task` VALUES (2690, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:36:16', '', '2025-10-19 23:36:16');
INSERT INTO `sj_retry_task` VALUES (2691, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:37:16', '', '2025-10-19 23:37:16');
INSERT INTO `sj_retry_task` VALUES (2692, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:37:16', '', '2025-10-19 23:37:16');
INSERT INTO `sj_retry_task` VALUES (2693, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:38:16', '', '2025-10-19 23:38:16');
INSERT INTO `sj_retry_task` VALUES (2694, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:38:16', '', '2025-10-19 23:38:16');
INSERT INTO `sj_retry_task` VALUES (2695, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:39:16', '', '2025-10-19 23:39:16');
INSERT INTO `sj_retry_task` VALUES (2696, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:39:16', '', '2025-10-19 23:39:16');
INSERT INTO `sj_retry_task` VALUES (2697, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:40:16', '', '2025-10-19 23:40:16');
INSERT INTO `sj_retry_task` VALUES (2698, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:40:16', '', '2025-10-19 23:40:16');
INSERT INTO `sj_retry_task` VALUES (2699, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:41:16', '', '2025-10-19 23:41:16');
INSERT INTO `sj_retry_task` VALUES (2700, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:41:16', '', '2025-10-19 23:41:16');
INSERT INTO `sj_retry_task` VALUES (2701, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:42:16', '', '2025-10-19 23:42:16');
INSERT INTO `sj_retry_task` VALUES (2702, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:42:16', '', '2025-10-19 23:42:16');
INSERT INTO `sj_retry_task` VALUES (2703, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:43:16', '', '2025-10-19 23:43:16');
INSERT INTO `sj_retry_task` VALUES (2704, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:43:16', '', '2025-10-19 23:43:16');
INSERT INTO `sj_retry_task` VALUES (2705, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:44:16', '', '2025-10-19 23:44:16');
INSERT INTO `sj_retry_task` VALUES (2706, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:44:16', '', '2025-10-19 23:44:16');
INSERT INTO `sj_retry_task` VALUES (2707, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:45:16', '', '2025-10-19 23:45:16');
INSERT INTO `sj_retry_task` VALUES (2708, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:45:16', '', '2025-10-19 23:45:16');
INSERT INTO `sj_retry_task` VALUES (2709, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:46:16', '', '2025-10-19 23:46:16');
INSERT INTO `sj_retry_task` VALUES (2710, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:46:16', '', '2025-10-19 23:46:16');
INSERT INTO `sj_retry_task` VALUES (2711, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:47:16', '', '2025-10-19 23:47:16');
INSERT INTO `sj_retry_task` VALUES (2712, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:47:16', '', '2025-10-19 23:47:16');
INSERT INTO `sj_retry_task` VALUES (2713, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:48:16', '', '2025-10-19 23:48:16');
INSERT INTO `sj_retry_task` VALUES (2714, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:48:16', '', '2025-10-19 23:48:16');
INSERT INTO `sj_retry_task` VALUES (2715, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:49:16', '', '2025-10-19 23:49:16');
INSERT INTO `sj_retry_task` VALUES (2716, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:49:16', '', '2025-10-19 23:49:16');
INSERT INTO `sj_retry_task` VALUES (2717, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:50:16', '', '2025-10-19 23:50:16');
INSERT INTO `sj_retry_task` VALUES (2718, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:50:16', '', '2025-10-19 23:50:16');
INSERT INTO `sj_retry_task` VALUES (2719, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:51:16', '', '2025-10-19 23:51:16');
INSERT INTO `sj_retry_task` VALUES (2720, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:51:16', '', '2025-10-19 23:51:16');
INSERT INTO `sj_retry_task` VALUES (2721, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:52:16', '', '2025-10-19 23:52:16');
INSERT INTO `sj_retry_task` VALUES (2722, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:52:16', '', '2025-10-19 23:52:16');
INSERT INTO `sj_retry_task` VALUES (2723, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:53:16', '', '2025-10-19 23:53:16');
INSERT INTO `sj_retry_task` VALUES (2724, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:53:16', '', '2025-10-19 23:53:16');
INSERT INTO `sj_retry_task` VALUES (2725, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:54:16', '', '2025-10-19 23:54:16');
INSERT INTO `sj_retry_task` VALUES (2726, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:54:16', '', '2025-10-19 23:54:16');
INSERT INTO `sj_retry_task` VALUES (2727, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:55:16', '', '2025-10-19 23:55:16');
INSERT INTO `sj_retry_task` VALUES (2728, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:55:16', '', '2025-10-19 23:55:16');
INSERT INTO `sj_retry_task` VALUES (2729, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:56:16', '', '2025-10-19 23:56:16');
INSERT INTO `sj_retry_task` VALUES (2730, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:56:16', '', '2025-10-19 23:56:16');
INSERT INTO `sj_retry_task` VALUES (2731, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:57:16', '', '2025-10-19 23:57:16');
INSERT INTO `sj_retry_task` VALUES (2732, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:57:16', '', '2025-10-19 23:57:16');
INSERT INTO `sj_retry_task` VALUES (2733, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:58:16', '', '2025-10-19 23:58:16');
INSERT INTO `sj_retry_task` VALUES (2734, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:58:16', '', '2025-10-19 23:58:16');
INSERT INTO `sj_retry_task` VALUES (2735, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-19 23:59:16', '', '2025-10-19 23:59:16');
INSERT INTO `sj_retry_task` VALUES (2736, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-19 23:59:16', '', '2025-10-19 23:59:16');
INSERT INTO `sj_retry_task` VALUES (2737, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:00:16', '', '2025-10-20 00:00:16');
INSERT INTO `sj_retry_task` VALUES (2738, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:00:16', '', '2025-10-20 00:00:16');
INSERT INTO `sj_retry_task` VALUES (2739, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:01:16', '', '2025-10-20 00:01:16');
INSERT INTO `sj_retry_task` VALUES (2740, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:01:16', '', '2025-10-20 00:01:16');
INSERT INTO `sj_retry_task` VALUES (2741, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:02:16', '', '2025-10-20 00:02:16');
INSERT INTO `sj_retry_task` VALUES (2742, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:02:16', '', '2025-10-20 00:02:16');
INSERT INTO `sj_retry_task` VALUES (2743, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:03:16', '', '2025-10-20 00:03:16');
INSERT INTO `sj_retry_task` VALUES (2744, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:03:16', '', '2025-10-20 00:03:16');
INSERT INTO `sj_retry_task` VALUES (2745, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:04:16', '', '2025-10-20 00:04:16');
INSERT INTO `sj_retry_task` VALUES (2746, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:04:16', '', '2025-10-20 00:04:16');
INSERT INTO `sj_retry_task` VALUES (2747, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:05:16', '', '2025-10-20 00:05:16');
INSERT INTO `sj_retry_task` VALUES (2748, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:05:16', '', '2025-10-20 00:05:16');
INSERT INTO `sj_retry_task` VALUES (2749, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:06:16', '', '2025-10-20 00:06:16');
INSERT INTO `sj_retry_task` VALUES (2750, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:06:16', '', '2025-10-20 00:06:16');
INSERT INTO `sj_retry_task` VALUES (2751, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:07:16', '', '2025-10-20 00:07:16');
INSERT INTO `sj_retry_task` VALUES (2752, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:07:16', '', '2025-10-20 00:07:16');
INSERT INTO `sj_retry_task` VALUES (2753, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:08:16', '', '2025-10-20 00:08:16');
INSERT INTO `sj_retry_task` VALUES (2754, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:08:16', '', '2025-10-20 00:08:16');
INSERT INTO `sj_retry_task` VALUES (2755, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:09:16', '', '2025-10-20 00:09:16');
INSERT INTO `sj_retry_task` VALUES (2756, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:09:16', '', '2025-10-20 00:09:16');
INSERT INTO `sj_retry_task` VALUES (2757, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:10:16', '', '2025-10-20 00:10:16');
INSERT INTO `sj_retry_task` VALUES (2758, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:10:16', '', '2025-10-20 00:10:16');
INSERT INTO `sj_retry_task` VALUES (2759, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:11:16', '', '2025-10-20 00:11:16');
INSERT INTO `sj_retry_task` VALUES (2760, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:11:16', '', '2025-10-20 00:11:16');
INSERT INTO `sj_retry_task` VALUES (2761, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:12:16', '', '2025-10-20 00:12:16');
INSERT INTO `sj_retry_task` VALUES (2762, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:12:16', '', '2025-10-20 00:12:16');
INSERT INTO `sj_retry_task` VALUES (2763, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:13:16', '', '2025-10-20 00:13:16');
INSERT INTO `sj_retry_task` VALUES (2764, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:13:16', '', '2025-10-20 00:13:16');
INSERT INTO `sj_retry_task` VALUES (2765, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:14:16', '', '2025-10-20 00:14:16');
INSERT INTO `sj_retry_task` VALUES (2766, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:14:16', '', '2025-10-20 00:14:16');
INSERT INTO `sj_retry_task` VALUES (2767, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:15:16', '', '2025-10-20 00:15:16');
INSERT INTO `sj_retry_task` VALUES (2768, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:15:16', '', '2025-10-20 00:15:16');
INSERT INTO `sj_retry_task` VALUES (2769, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:16:16', '', '2025-10-20 00:16:16');
INSERT INTO `sj_retry_task` VALUES (2770, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:16:16', '', '2025-10-20 00:16:16');
INSERT INTO `sj_retry_task` VALUES (2771, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:17:16', '', '2025-10-20 00:17:16');
INSERT INTO `sj_retry_task` VALUES (2772, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:17:16', '', '2025-10-20 00:17:16');
INSERT INTO `sj_retry_task` VALUES (2773, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:18:16', '', '2025-10-20 00:18:16');
INSERT INTO `sj_retry_task` VALUES (2774, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:18:16', '', '2025-10-20 00:18:16');
INSERT INTO `sj_retry_task` VALUES (2775, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:19:16', '', '2025-10-20 00:19:16');
INSERT INTO `sj_retry_task` VALUES (2776, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:19:16', '', '2025-10-20 00:19:16');
INSERT INTO `sj_retry_task` VALUES (2777, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:20:16', '', '2025-10-20 00:20:16');
INSERT INTO `sj_retry_task` VALUES (2778, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:20:16', '', '2025-10-20 00:20:16');
INSERT INTO `sj_retry_task` VALUES (2779, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:21:16', '', '2025-10-20 00:21:16');
INSERT INTO `sj_retry_task` VALUES (2780, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:21:16', '', '2025-10-20 00:21:16');
INSERT INTO `sj_retry_task` VALUES (2781, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:22:16', '', '2025-10-20 00:22:16');
INSERT INTO `sj_retry_task` VALUES (2782, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:22:16', '', '2025-10-20 00:22:16');
INSERT INTO `sj_retry_task` VALUES (2783, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:23:16', '', '2025-10-20 00:23:16');
INSERT INTO `sj_retry_task` VALUES (2784, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:23:16', '', '2025-10-20 00:23:16');
INSERT INTO `sj_retry_task` VALUES (2785, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:24:16', '', '2025-10-20 00:24:16');
INSERT INTO `sj_retry_task` VALUES (2786, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:24:16', '', '2025-10-20 00:24:16');
INSERT INTO `sj_retry_task` VALUES (2787, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:25:16', '', '2025-10-20 00:25:16');
INSERT INTO `sj_retry_task` VALUES (2788, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:25:16', '', '2025-10-20 00:25:16');
INSERT INTO `sj_retry_task` VALUES (2789, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:26:16', '', '2025-10-20 00:26:16');
INSERT INTO `sj_retry_task` VALUES (2790, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:26:16', '', '2025-10-20 00:26:16');
INSERT INTO `sj_retry_task` VALUES (2791, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:27:16', '', '2025-10-20 00:27:16');
INSERT INTO `sj_retry_task` VALUES (2792, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:27:16', '', '2025-10-20 00:27:16');
INSERT INTO `sj_retry_task` VALUES (2793, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:28:16', '', '2025-10-20 00:28:16');
INSERT INTO `sj_retry_task` VALUES (2794, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:28:16', '', '2025-10-20 00:28:16');
INSERT INTO `sj_retry_task` VALUES (2795, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:29:16', '', '2025-10-20 00:29:16');
INSERT INTO `sj_retry_task` VALUES (2796, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:29:16', '', '2025-10-20 00:29:16');
INSERT INTO `sj_retry_task` VALUES (2797, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:30:16', '', '2025-10-20 00:30:16');
INSERT INTO `sj_retry_task` VALUES (2798, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:30:16', '', '2025-10-20 00:30:16');
INSERT INTO `sj_retry_task` VALUES (2799, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:31:16', '', '2025-10-20 00:31:16');
INSERT INTO `sj_retry_task` VALUES (2800, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:31:16', '', '2025-10-20 00:31:16');
INSERT INTO `sj_retry_task` VALUES (2801, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:32:16', '', '2025-10-20 00:32:16');
INSERT INTO `sj_retry_task` VALUES (2802, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:32:16', '', '2025-10-20 00:32:16');
INSERT INTO `sj_retry_task` VALUES (2803, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:33:16', '', '2025-10-20 00:33:16');
INSERT INTO `sj_retry_task` VALUES (2804, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:33:16', '', '2025-10-20 00:33:16');
INSERT INTO `sj_retry_task` VALUES (2805, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:34:16', '', '2025-10-20 00:34:16');
INSERT INTO `sj_retry_task` VALUES (2806, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:34:16', '', '2025-10-20 00:34:16');
INSERT INTO `sj_retry_task` VALUES (2807, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:35:16', '', '2025-10-20 00:35:16');
INSERT INTO `sj_retry_task` VALUES (2808, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:35:16', '', '2025-10-20 00:35:16');
INSERT INTO `sj_retry_task` VALUES (2809, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:36:16', '', '2025-10-20 00:36:16');
INSERT INTO `sj_retry_task` VALUES (2810, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:36:16', '', '2025-10-20 00:36:16');
INSERT INTO `sj_retry_task` VALUES (2811, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:37:16', '', '2025-10-20 00:37:16');
INSERT INTO `sj_retry_task` VALUES (2812, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:37:16', '', '2025-10-20 00:37:16');
INSERT INTO `sj_retry_task` VALUES (2813, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:38:16', '', '2025-10-20 00:38:16');
INSERT INTO `sj_retry_task` VALUES (2814, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:38:16', '', '2025-10-20 00:38:16');
INSERT INTO `sj_retry_task` VALUES (2815, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:39:16', '', '2025-10-20 00:39:16');
INSERT INTO `sj_retry_task` VALUES (2816, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:39:16', '', '2025-10-20 00:39:16');
INSERT INTO `sj_retry_task` VALUES (2817, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:40:16', '', '2025-10-20 00:40:16');
INSERT INTO `sj_retry_task` VALUES (2818, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:40:16', '', '2025-10-20 00:40:16');
INSERT INTO `sj_retry_task` VALUES (2819, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:41:16', '', '2025-10-20 00:41:16');
INSERT INTO `sj_retry_task` VALUES (2820, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:41:16', '', '2025-10-20 00:41:16');
INSERT INTO `sj_retry_task` VALUES (2821, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:42:16', '', '2025-10-20 00:42:16');
INSERT INTO `sj_retry_task` VALUES (2822, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:42:16', '', '2025-10-20 00:42:16');
INSERT INTO `sj_retry_task` VALUES (2823, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:43:16', '', '2025-10-20 00:43:16');
INSERT INTO `sj_retry_task` VALUES (2824, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:43:16', '', '2025-10-20 00:43:16');
INSERT INTO `sj_retry_task` VALUES (2825, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:44:16', '', '2025-10-20 00:44:16');
INSERT INTO `sj_retry_task` VALUES (2826, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:44:16', '', '2025-10-20 00:44:16');
INSERT INTO `sj_retry_task` VALUES (2827, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:45:16', '', '2025-10-20 00:45:16');
INSERT INTO `sj_retry_task` VALUES (2828, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:45:16', '', '2025-10-20 00:45:16');
INSERT INTO `sj_retry_task` VALUES (2829, 'namespaceId', 'das', 'sss666', 1, '', 6, 1, 2, NULL, '', '2025-10-20 00:46:16', '', '2025-10-20 00:46:16');
INSERT INTO `sj_retry_task` VALUES (2830, 'namespaceId', 'das', 'sss666', 3, '', 6, 1, 2, NULL, '', '2025-10-20 00:46:16', '', '2025-10-20 00:46:16');

-- ----------------------------
-- Table structure for sj_retry_task_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task_log_message`;
CREATE TABLE `sj_retry_task_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `retry_task_id` bigint NOT NULL COMMENT '重试任务Id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '异常信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_retry_task_id`(`namespace_id` ASC, `group_name` ASC, `retry_task_id` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务调度日志信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_sequence_alloc
-- ----------------------------
DROP TABLE IF EXISTS `sj_sequence_alloc`;
CREATE TABLE `sj_sequence_alloc`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `max_id` bigint NOT NULL DEFAULT 1 COMMENT '最大id',
  `step` int NOT NULL DEFAULT 100 COMMENT '步长',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '号段模式序号ID分配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_sequence_alloc
-- ----------------------------

-- ----------------------------
-- Table structure for sj_server_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_server_node`;
CREATE TABLE `sj_server_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `host_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主机id',
  `host_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '机器ip',
  `host_port` int NOT NULL COMMENT '机器端口',
  `expire_at` datetime NOT NULL COMMENT '过期时间',
  `node_type` tinyint UNSIGNED NOT NULL COMMENT '节点类型 1、客户端 2、是服务端',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_host_id_host_ip`(`host_id` ASC, `host_ip` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_expire_at_node_type`(`expire_at` ASC, `node_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 408 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '服务器节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_server_node
-- ----------------------------
INSERT INTO `sj_server_node` VALUES (407, 'DEFAULT_SERVER_NAMESPACE_ID', 'DEFAULT_SERVER', '1979929971357294592', '192.168.50.57', 17888, '2025-10-20 00:47:22', 2, '{\"webPort\":8098}', '', '2025-10-19 23:17:52', '', '2025-10-19 23:17:47');

-- ----------------------------
-- Table structure for sj_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user`;
CREATE TABLE `sj_system_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL DEFAULT 0 COMMENT '角色：1-普通用户、2-管理员',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user
-- ----------------------------
INSERT INTO `sj_system_user` VALUES (1, 'admin', '465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac', 2, '', '2025-04-16 17:03:00', '', '2025-04-16 17:03:00');

-- ----------------------------
-- Table structure for sj_system_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user_permission`;
CREATE TABLE `sj_system_user_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `system_user_id` bigint NOT NULL COMMENT '系统用户id',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_system_user_id`(`namespace_id` ASC, `group_name` ASC, `system_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow`;
CREATE TABLE `sj_workflow`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workflow_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '工作流名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `workflow_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '工作流状态 0、关闭、1、开启',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '间隔时长',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '上下文',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_node`;
CREATE TABLE `sj_workflow_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `node_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '节点名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `workflow_id` bigint NOT NULL COMMENT '工作流ID',
  `node_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、任务节点 2、条件节点',
  `expression_type` tinyint NOT NULL DEFAULT 0 COMMENT '1、SpEl、2、Aviator 3、QL',
  `fail_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '失败策略 1、跳过 2、阻塞',
  `workflow_node_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '工作流节点状态 0、关闭、1、开启',
  `priority_level` int NOT NULL DEFAULT 1 COMMENT '优先级',
  `node_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '节点信息 ',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_node
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_task_batch`;
CREATE TABLE `sj_workflow_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `workflow_id` bigint NOT NULL COMMENT '工作流任务id',
  `task_batch_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '全局上下文',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '扩展字段',
  `version` int NOT NULL DEFAULT 1 COMMENT '版本号',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`workflow_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_created_date`(`created_date` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_task_batch
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `module_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单所属模块',
  `type` tinyint UNSIGNED NOT NULL COMMENT '菜单类型：1-目录，2-菜单，3-按钮',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由路径',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `redirect` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `meta` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态：0-禁用，1-启用',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'SYSTEM', 1, '/system', '', '', '{\"title\":\"系统管理\",\"icon\":\"SettingTwoTone\",\"show\":true,\"requiresAuth\":true}', 4, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:43:12');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'SYSTEM', 2, '/user', '/system/user', '', '{\"title\":\"用户管理\",\"icon\":\"EyeFilled\",\"show\":true,\"requiresAuth\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:43:10');
INSERT INTO `sys_menu` VALUES (3, 2, '用户新增', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"新增\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:add\"}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:35:51');
INSERT INTO `sys_menu` VALUES (4, 2, '用户编辑', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"编辑\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:edit\"}', 2, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:35:35');
INSERT INTO `sys_menu` VALUES (5, 2, '用户删除', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"删除\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:delete\"}', 3, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:35:21');
INSERT INTO `sys_menu` VALUES (6, 2, '重置密码', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"重置密码\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:reset-password\"}', 4, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:34:55');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', 'SYSTEM', 2, '/role', '/system/role', '', '{\"title\":\"角色管理\",\"icon\":\"FilterTwoTone\",\"show\":true,\"requiresAuth\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:43:08');
INSERT INTO `sys_menu` VALUES (8, 7, '角色新增', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"新增\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:add\"}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:36:15');
INSERT INTO `sys_menu` VALUES (9, 7, '角色编辑', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"编辑\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:edit\"}', 2, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:36:35');
INSERT INTO `sys_menu` VALUES (10, 7, '角色删除', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"删除\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:delete\"}', 3, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:36:50');
INSERT INTO `sys_menu` VALUES (11, 7, '分配权限', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"分配角色\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:assign-permissions\"}', 4, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 15:28:02');
INSERT INTO `sys_menu` VALUES (12, 1, '菜单管理', 'SYSTEM', 2, '/menu', '/system/menu', '', '{\"title\":\"菜单管理\",\"icon\":\"FolderTwoTone\",\"show\":true,\"requiresAuth\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:43:01');
INSERT INTO `sys_menu` VALUES (13, 12, '菜单新增', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"新增\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:menu:add\"}', 1, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:37:39');
INSERT INTO `sys_menu` VALUES (14, 12, '菜单编辑', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"编辑\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:menu:edit\"}', 2, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:37:54');
INSERT INTO `sys_menu` VALUES (15, 12, '菜单删除', 'SYSTEM', 3, NULL, NULL, NULL, '{\"title\":\"删除\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:menu:delete\"}', 3, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-19 14:38:07');
INSERT INTO `sys_menu` VALUES (21, 1, '通知管理', 'SYSTEM', 2, '/notice', '/system/notice', '', '{\"title\":\"通知管理\",\"icon\":\"NotificationTwoTone\",\"show\":true,\"requiresAuth\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:09:27', 'SYSTEM', '2025-10-19 14:42:59');
INSERT INTO `sys_menu` VALUES (22, 0, '配置中心', 'CONFIG', 1, '/cc-config', '', '', '{\"title\":\"配置中心\",\"icon\":\"GiftTwoTone\",\"show\":true,\"requiresAuth\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:43:48', 'SYSTEM', '2025-10-19 14:43:17');
INSERT INTO `sys_menu` VALUES (23, 22, '配置管理', 'CONFIG', 2, '/center', '/cc-config/center', NULL, '{\"title\":\"配置管理\",\"icon\":\"ContainerOutlined\",\"permission\":\"system:config:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:58:19', 'SYSTEM', '2025-10-13 20:06:59');
INSERT INTO `sys_menu` VALUES (24, 22, '子系统管理', 'CONFIG', 2, '/subsystem', '/cc-config/subsystem', NULL, '{\"title\":\"子系统管理\",\"icon\":\"SubnodeOutlined\",\"permission\":\"system:subsystem:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 22:00:42', 'SYSTEM', '2025-10-13 20:06:59');
INSERT INTO `sys_menu` VALUES (25, 0, '消息队列', 'MQ', 1, '/mq', '', '', '{\"title\":\"消息队列\",\"icon\":\"RocketTwoTone\",\"show\":true,\"requiresAuth\":true}', 2, b'1', b'0', 'SYSTEM', '2025-05-02 02:44:38', 'SYSTEM', '2025-10-19 14:43:15');
INSERT INTO `sys_menu` VALUES (26, 25, 'Mq仪表盘', 'MQ', 2, '/dashboard', '/mq/dashboardView', '', '{\"title\":\"MQ仪表盘\",\"icon\":\"DashOutlined\",\"permission\":\"system:mm:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:10');
INSERT INTO `sys_menu` VALUES (27, 25, '集群', 'MQ', 2, 'cluster', '/mq/clusterView', '', '{\"title\":\"集群\",\"icon\":\"DashOutlined\",\"permission\":\"system:cluster:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:12');
INSERT INTO `sys_menu` VALUES (28, 25, 'topic管理', 'MQ', 2, '/topic', '/mq/topicView', '', '{\"title\":\"主题管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:topic:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:14');
INSERT INTO `sys_menu` VALUES (29, 25, '生产者', 'MQ', 2, '/producer', '/mq/producerView', '', '{\"title\":\"生产者\",\"icon\":\"DashOutlined\",\"permission\":\"system:producer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:16');
INSERT INTO `sys_menu` VALUES (30, 25, '消费者', 'MQ', 2, '/consumer', '/mq/consumerView', '', '{\"title\":\"消费者\",\"icon\":\"DashOutlined\",\"permission\":\"system:consumer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:18');
INSERT INTO `sys_menu` VALUES (31, 25, '消息管理', 'MQ', 2, '/message', '/mq/messageView', '', '{\"title\":\"消息管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:message:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:20');
INSERT INTO `sys_menu` VALUES (32, 25, '消息轨迹', 'MQ', 2, '/messageTrace', '/mq/messageTraceView', '', '{\"title\":\"消息轨迹\",\"icon\":\"DashOutlined\",\"permission\":\"system:messageTrace:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:23');
INSERT INTO `sys_menu` VALUES (33, 25, '死信消息', 'MQ', 2, '/dlqMessage', '/mq/dlqMessageView', '', '{\"title\":\"死信消息\",\"icon\":\"DashOutlined\",\"permission\":\"system:dlqMessage:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:26');
INSERT INTO `sys_menu` VALUES (34, 25, '权限管理', 'MQ', 2, '/acl', '/mq/aclView', '', '{\"title\":\"权限管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:acl:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-19 12:34:28');
INSERT INTO `sys_menu` VALUES (35, 0, '定时任务', 'JOB', 1, '/job', '', '', '{\"title\":\"定时任务\",\"icon\":\"CloudTwoTone\",\"show\":true,\"requiresAuth\":true}', 3, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-19 14:43:13');
INSERT INTO `sys_menu` VALUES (36, 35, '首页', 'JOB', 2, '/job/home', '/job/home/homeView', '', '{\"title\":\"首页\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-19 11:54:20');
INSERT INTO `sys_menu` VALUES (37, 35, '在线机器', 'JOB', 2, '/job/pods', '/job/pods/podsView', '', '{\"title\":\"在线机器\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 2, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-19 11:54:24');
INSERT INTO `sys_menu` VALUES (38, 35, '组管理', 'JOB', 2, '/job/group', '/job/group/groupView', '', '{\"title\":\"组管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 4, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-19 11:54:26');
INSERT INTO `sys_menu` VALUES (51, 35, '定时任务', 'JOB', 1, '/job/task', NULL, NULL, '{\"title\":\"定时任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 5, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-19 11:54:27');
INSERT INTO `sys_menu` VALUES (52, 35, '工作流', 'JOB', 1, '/job/workflow', NULL, NULL, '{\"title\":\"工作流\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 6, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-19 11:54:30');
INSERT INTO `sys_menu` VALUES (53, 35, '重试任务', 'JOB', 1, '/job/retry', NULL, NULL, '{\"title\":\"重试任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 7, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-19 11:54:34');
INSERT INTO `sys_menu` VALUES (54, 35, '告警配置', 'JOB', 1, '/job/notify', NULL, NULL, '{\"title\":\"告警配置\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 8, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-19 11:54:38');
INSERT INTO `sys_menu` VALUES (55, 51, '任务管理', 'JOB', 2, '/task-info', '/job/task/taskView', '', '{\"title\":\"任务管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (56, 51, '执行批次管理', 'JOB', 2, '/task-batch', '/job/batch/jobBatchView', '', '{\"title\":\"执行批次\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (57, 52, '任务管理', 'JOB', 2, '/workflow-task', '/job/workflow/task/workflowTaskView', '', '{\"title\":\"任务管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (58, 52, '执行批次', 'JOB', 2, '/workflow-batch', '/job/workflow/batch/workflowBatchView', '', '{\"title\":\"执行批次\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (59, 53, '任务管理', 'JOB', 2, '/retry-info', '/job/retry/retryInfoView', '', '{\"title\":\"任务管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (60, 53, '重试任务', 'JOB', 2, '/retry-task', '/job/retry/retryTaskView', '', '{\"title\":\"重试任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 2, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (61, 53, '重试场景', 'JOB', 2, '/retry-scene', '/job/retry/retrySceneView', '', '{\"title\":\"重试场景\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 3, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (62, 53, '死信任务', 'JOB', 2, '/retry-dead-letter', '/job/retry/retryDeadLetterView', '', '{\"title\":\"死信任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 4, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (63, 54, '通知配置', 'JOB', 2, '/notify-config', '/job/notify/config/configView', '', '{\"title\":\"通知配置\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (64, 54, '通知人', 'JOB', 2, '/notify-recipient', '/job/notify/recipient/recipientView', '', '{\"title\":\"通知人\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (65, 35, '命名空间管理', 'JOB', 1, '/job/namespace', '/job/namespace/namespaceView', '', '{\"title\":\"命名空间\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 3, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-19 11:54:41');
INSERT INTO `sys_menu` VALUES (66, 35, '执行器', 'JOB', 1, '/job/executor', '/job/executor/executorView', '', '{\"title\":\"执行器管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-19 11:54:43');
INSERT INTO `sys_menu` VALUES (67, 57, '添加', 'JOB', 2, '/workflow/form/add', '/job/workflow/form/add/index', '', '{\"title\":\"添加\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (68, 57, '批次', 'JOB', 2, '/workflow/form/batch', '/job/workflow/form/batch/index', '', '{\"title\":\"批次\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (69, 57, '复制', 'JOB', 2, '/workflow/form/copy', '/job/workflow/form/copy/index', '', '{\"title\":\"复制\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');
INSERT INTO `sys_menu` VALUES (70, 57, '详情', 'JOB', 2, '/workflow/form/detail', '/job/workflow/form/detail/index', '', '{\"title\":\"详情\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');
INSERT INTO `sys_menu` VALUES (71, 57, '编辑', 'JOB', 2, '/workflow/form/edit', '/job/workflow/form/edit/index', '', '{\"title\":\"编辑\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');
INSERT INTO `sys_menu` VALUES (72, 2, '搜索', 'SYSTEM', 3, '', '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:page\"}', 1, b'1', b'0', 'SYSTEM', '2025-10-19 14:59:01', 'SYSTEM', '2025-10-19 15:02:16');
INSERT INTO `sys_menu` VALUES (73, 2, '启用', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:enable\"}', 1, b'1', b'0', NULL, '2025-10-19 15:11:57', NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 2, '禁用', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:user:disable\"}', 1, b'1', b'0', NULL, '2025-10-19 15:12:29', NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 7, '搜索', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:page\"}', 1, b'1', b'0', NULL, '2025-10-19 15:32:09', NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 12, '列表', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:menu:list\"}', 1, b'1', b'0', NULL, '2025-10-19 15:45:41', NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 7, '列表', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:list\"}', 1, b'1', b'0', NULL, '2025-10-19 18:32:41', NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 7, '角色树', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:role:tree\"}', 1, b'1', b'0', NULL, '2025-10-19 18:49:46', NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 21, '搜索', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:page\"}', 1, b'1', b'0', NULL, '2025-10-19 18:50:43', NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 21, '列表', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:list\"}', 1, b'1', b'0', NULL, '2025-10-19 18:51:20', NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 21, '新增', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:add\"}', 1, b'1', b'0', NULL, '2025-10-19 18:51:39', NULL, NULL);
INSERT INTO `sys_menu` VALUES (82, 21, '编辑', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:edit\"}', 1, b'1', b'0', NULL, '2025-10-19 18:51:59', NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 21, '已读', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:read\"}', 1, b'1', b'0', NULL, '2025-10-19 18:52:21', NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, 21, '全部已读', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:readAll\"}', 1, b'1', b'0', NULL, '2025-10-19 18:53:36', NULL, NULL);
INSERT INTO `sys_menu` VALUES (85, 21, '清除全部', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:clear\"}', 1, b'1', b'0', NULL, '2025-10-19 18:54:16', NULL, NULL);
INSERT INTO `sys_menu` VALUES (86, 21, '删除', 'SYSTEM', 3, NULL, '', '', '{\"title\":\"\",\"icon\":\"\",\"show\":true,\"requiresAuth\":true,\"permission\":\"system:notice:delete\"}', 1, b'1', b'0', NULL, '2025-10-19 18:54:29', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色编码',
  `app_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色所属应用',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROLE_ADMIN', 'SILENCE-CONTENT', '系统超级管理员，拥有所有权限', 1, 0, 'SYSTEM', '2025-04-13 16:30:34', 'SYSTEM', '2025-09-22 17:24:15');
INSERT INTO `sys_role` VALUES (2, '内容管理员', 'CONTENT_ADMIN', 'SILENCE-CONTENT', '子系统内容管理员', 1, 0, 'SYSTEM', '2025-04-15 15:51:48', 'SYSTEM', '2025-09-22 17:24:17');
INSERT INTO `sys_role` VALUES (4, '运营管理员', 'MATAIN_ADMIN', 'SILENCE_CONTENT', '111', 1, 0, 'SYSTEM', '2025-10-13 23:23:34', 'SYSTEM', '2025-10-13 23:41:41');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:28:51');
INSERT INTO `sys_role_menu` VALUES (2, 1, 2, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:01');
INSERT INTO `sys_role_menu` VALUES (3, 1, 3, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:04');
INSERT INTO `sys_role_menu` VALUES (4, 1, 4, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:07');
INSERT INTO `sys_role_menu` VALUES (5, 1, 5, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (6, 1, 6, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (7, 1, 7, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (8, 1, 8, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (9, 1, 9, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (10, 1, 10, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (11, 1, 11, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (12, 1, 12, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (13, 1, 13, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (14, 1, 14, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (15, 1, 15, 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 23:29:08');
INSERT INTO `sys_role_menu` VALUES (115, 2, 7, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (116, 2, 21, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (117, 2, 2, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (118, 2, 72, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (119, 2, 73, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (120, 2, 74, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (121, 2, 3, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (122, 2, 4, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (123, 2, 5, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (124, 2, 6, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (125, 2, 75, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (126, 2, 77, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (127, 2, 78, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (128, 2, 8, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (129, 2, 9, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (130, 2, 10, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (131, 2, 11, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (132, 2, 79, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (133, 2, 80, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (134, 2, 81, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (135, 2, 82, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (136, 2, 83, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (137, 2, 84, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (138, 2, 85, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (139, 2, 86, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (140, 2, 12, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (141, 2, 76, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (142, 2, 13, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (143, 2, 14, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (144, 2, 15, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');
INSERT INTO `sys_role_menu` VALUES (145, 2, 1, NULL, '2025-10-19 18:57:17', NULL, '2025-10-19 18:57:17');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像URL',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态：0-禁用，1-启用',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$DQoPpZke.gTvFkXSmgWY/uEA5JvcVnyoecR0Ah/qeNjYj3pLzwWYS', '超级管理员', '/src/assets/images/bubble.png', '13611988536@163.com', '13856854188', b'1', b'0', 'SYSYTEM', '2025-04-13 16:30:34', 'SYSTEM', '2025-10-19 13:12:14');
INSERT INTO `sys_user` VALUES (2, 'hexian', '$2a$2a$10$ns24hvhbVrer2jzZaeHyJu4RsJZj7yItt7UxEED34ZM3C7TC1eW6u', '贺老板', '/src/assets/images/cute.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 18:59:16', 'SYSTEM', '2025-10-13 23:58:17');
INSERT INTO `sys_user` VALUES (3, 'wangbo', '$2a$2a$10$ns24hvhbVrer2jzZaeHyJu4RsJZj7yItt7UxEED34ZM3C7TC1eW6u', '王老板', '/src/assets/images/doraemon.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-10-13 23:58:16');
INSERT INTO `sys_user` VALUES (4, 'tmx', '$2a$10$qv1SWerAuBQ0ibuGqE.gVu0x1Mq2ea27Eo2EcFCT0DlPC3HIouAwq', '老谭', '/src/assets/images/girl.png', '2634603838@qq.com', '13856854188', b'1', b'0', NULL, '2025-10-13 22:55:26', NULL, '2025-10-19 13:19:26');
INSERT INTO `sys_user` VALUES (5, 'tmx1', '$2a$10$1.Upe92eAlCui5LXnIe2/OiiDfmLkjb3AdDoJeihh2LbxaWCtoH.K', '老谭', '/src/assets/images/doraemon.png', '2634603838@qq.com', '13856854188', b'1', b'1', NULL, '2025-10-13 22:56:03', NULL, '2025-10-13 22:57:51');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_role`(`user_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (4, 2, 2, 'SYSTEM', '2025-04-15 19:09:29', 'SYSTEM', '2025-04-15 19:09:29');
INSERT INTO `sys_user_role` VALUES (5, 3, 1, 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-04-15 19:09:49');
INSERT INTO `sys_user_role` VALUES (18, 4, 2, NULL, '2025-10-19 13:17:57', NULL, NULL);
INSERT INTO `sys_user_role` VALUES (19, 1, 1, NULL, '2025-10-19 14:31:09', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
