/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 90000 (9.0.0)
 Source Host           : localhost:3306
 Source Schema         : silence-platform

 Target Server Type    : MySQL
 Target Server Version : 90000 (9.0.0)
 File Encoding         : 65001

 Date: 14/10/2025 00:12:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '组件表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '环境表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_item
-- ----------------------------
INSERT INTO `config_item` VALUES (1, 1, 'application.yml', 1, 1, 1, '10.28.50.31', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3306/silence-content?allowPublicKeyRetrieval=true&autoReconnect=true&useServerPreparedStmts=false&rewriteBatchedStatements=true&characterEncoding=UTF-8&useSSL=false&allowMultiQueries=true&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: 123456\r\n    driverClassName: com.mysql.jdbc.Driver\r\n\r\nrocketmq:\r\n  name-server: 127.0.0.1:9876  # NameServer地址\r\n  producer:\r\n    group: silence-content-producer-group   # 生产者组名\r\n    send-message-timeout: 3000 # 发送超时时间(ms)\r\n  consumer:\r\n    group: silence-content-consumer-group   # 消费者组名\r\n    consume-thread-max: 20     ', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/silence-content?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8\r\n    username: root\r\n    password: admin123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      maximum-pool-size: 100\r\n  elasticsearch:\r\n    uris: http://14.103.187.231:9200', '15917fa43f7773d44a65d0070fced326', '老默', '2024-04-21 00:06:45', '老默', '2024-04-21 00:06:47');
INSERT INTO `config_item` VALUES (2, 1, 'esg.properties', 2, 2, 2, '10.28.50.31', 'server.port=8081', 'server.port=8080', '76847eb03a7c34cea8f41da1553ec1b2', '老默', '2025-03-30 15:17:10', '老默', '2025-03-30 15:17:19');
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置版本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_item_history
-- ----------------------------
INSERT INTO `config_item_history` VALUES (1, 1, 'nacos.test: 111', 'nacos.test: 111', 1, '贺显', '2025-03-30 16:34:23', '贺显', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (2, 1, 'nacos.test: 111', 'nacos.test: 222', 2, '贺显', '2025-03-30 16:34:23', '王波', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (3, 1, 'nacos.test: 222', 'nacos.test: 333', 2, '贺显', '2025-03-30 16:34:23', '徐洋洋', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (4, 1, 'nacos.test: 333', 'nacos.test: 444', 2, '贺显', '2025-03-30 16:34:23', '严晓仪', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` VALUES (5, 1, 'nacos.test: 444', 'nacos.test: 555', 2, '贺显', '2025-03-30 16:34:23', '李羿楠', '2025-03-30 16:34:31');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '配置版本表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '子系统表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2612 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '锁定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sj_distributed_lock
-- ----------------------------
INSERT INTO `sj_distributed_lock` VALUES (2599, 'clearOfflineNode', '2025-10-14 00:12:49.525', '2025-10-14 00:12:44.525', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2600, 'registerNode', '2025-10-14 00:12:49.525', '2025-10-14 00:12:44.525', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2601, 'retryErrorMoreThreshold', '2025-10-14 00:09:56.165', '2025-10-14 00:08:56.165', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2602, 'clearLog', '2025-10-13 23:59:55.194', '2025-10-13 23:58:55.194', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2603, 'retryLogMerge', '2025-10-13 23:59:55.194', '2025-10-13 23:58:55.194', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2604, 'retrySummaryDashboard', '2025-10-14 00:12:15.187', '2025-10-14 00:11:55.187', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2605, 'retryTaskMoreThreshold', '2025-10-14 00:09:56.187', '2025-10-14 00:08:56.187', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2606, 'jobClearLog', '2025-10-13 23:59:55.194', '2025-10-13 23:58:55.194', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2607, 'jobLogMerge', '2025-10-14 00:12:55.187', '2025-10-14 00:11:55.187', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2608, 'jobSummaryDashboard', '2025-10-14 00:12:15.187', '2025-10-14 00:11:55.187', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');
INSERT INTO `sj_distributed_lock` VALUES (2609, 'workflowJobSummarySchedule', '2025-10-14 00:12:15.187', '2025-10-14 00:11:55.187', '1977705578645954560', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '组配置' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务信息' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度日志' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'DashBoard_Job' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务实例' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sj_job_task
-- ----------------------------
INSERT INTO `sj_job_task` VALUES (41, 'namespaceId', 'das', 1, 50, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976177423907430400@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 14:47:07', '', '2025-10-09 14:47:07');
INSERT INTO `sj_job_task` VALUES (42, 'namespaceId', 'das', 1, 51, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:14:49', '', '2025-10-09 15:14:49');
INSERT INTO `sj_job_task` VALUES (43, 'namespaceId', 'das', 1, 52, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:15:34', '', '2025-10-09 15:15:34');
INSERT INTO `sj_job_task` VALUES (44, 'namespaceId', 'das', 1, 53, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:16:00', '', '2025-10-09 15:16:00');
INSERT INTO `sj_job_task` VALUES (45, 'namespaceId', 'das', 1, 54, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:17:25', '', '2025-10-09 15:17:25');
INSERT INTO `sj_job_task` VALUES (46, 'namespaceId', 'das', 1, 55, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:18:22', '', '2025-10-09 15:18:22');
INSERT INTO `sj_job_task` VALUES (47, 'namespaceId', 'das', 1, 56, 0, 5, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:19:01', '', '2025-10-09 15:19:01');
INSERT INTO `sj_job_task` VALUES (48, 'namespaceId', 'das', 1, 57, 0, 4, 2, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:19:59', '', '2025-10-09 15:19:59');
INSERT INTO `sj_job_task` VALUES (50, 'namespaceId', 'das', 1, 59, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:24:04', '', '2025-10-09 15:24:04');
INSERT INTO `sj_job_task` VALUES (51, 'namespaceId', 'das', 1, 60, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:40:07', '', '2025-10-09 15:40:07');
INSERT INTO `sj_job_task` VALUES (52, 'namespaceId', 'das', 1, 61, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:43:11', '', '2025-10-09 15:43:11');
INSERT INTO `sj_job_task` VALUES (53, 'namespaceId', 'das', 1, 62, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:47:05', '', '2025-10-09 15:47:05');
INSERT INTO `sj_job_task` VALUES (54, 'namespaceId', 'das', 1, 63, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:47:34', '', '2025-10-09 15:47:34');
INSERT INTO `sj_job_task` VALUES (55, 'namespaceId', 'das', 1, 64, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976184413790564352@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 15:58:55', '', '2025-10-09 15:58:55');
INSERT INTO `sj_job_task` VALUES (56, 'namespaceId', 'das', 1, 65, 0, 5, 0, NULL, b'1', 'CLUSTER_TASK', '1976222517855428608@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 17:45:56', '', '2025-10-09 17:45:56');
INSERT INTO `sj_job_task` VALUES (57, 'namespaceId', 'das', 1, 66, 0, 4, 0, NULL, b'1', 'CLUSTER_TASK', '1976224420777562112@127.0.0.1:17889', NULL, '', '{}', 2, '', '', '2025-10-09 17:53:23', '', '2025-10-09 17:53:23');
INSERT INTO `sj_job_task` VALUES (58, 'namespaceId', 'das', 1, 67, 0, 3, 0, NULL, b'1', 'CLUSTER_TASK', '1976224420777562112@127.0.0.1:17889', NULL, '测试成功', '{}', 2, '', '', '2025-10-09 18:13:56', '', '2025-10-09 18:13:56');
INSERT INTO `sj_job_task` VALUES (59, 'namespaceId', 'das', 1, 68, 0, 3, 0, NULL, b'1', 'CLUSTER_TASK', '1976277384753983488@127.0.0.1:17889', NULL, '测试成功', '{}', 2, '', '', '2025-10-10 00:17:47', '', '2025-10-10 00:17:47');

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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务批次' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sj_job_task_batch` VALUES (50, 'namespaceId', 'das', 1, 0, 0, 0, 2, 0, 1759992427598, 3, '', '', 0, '', '2025-10-09 14:47:07', '', '2025-10-09 14:47:07');
INSERT INTO `sj_job_task_batch` VALUES (51, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994089596, 3, '', '', 0, '', '2025-10-09 15:14:49', '', '2025-10-09 15:14:50');
INSERT INTO `sj_job_task_batch` VALUES (52, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994134792, 3, '', '', 0, '', '2025-10-09 15:15:35', '', '2025-10-09 15:15:35');
INSERT INTO `sj_job_task_batch` VALUES (53, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994160997, 3, '', '', 0, '', '2025-10-09 15:16:01', '', '2025-10-09 15:16:01');
INSERT INTO `sj_job_task_batch` VALUES (54, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994245991, 3, '', '', 0, '', '2025-10-09 15:17:26', '', '2025-10-09 15:17:26');
INSERT INTO `sj_job_task_batch` VALUES (55, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994302001, 3, '', '', 0, '', '2025-10-09 15:18:22', '', '2025-10-09 15:18:22');
INSERT INTO `sj_job_task_batch` VALUES (56, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994341091, 3, '', '', 0, '', '2025-10-09 15:19:01', '', '2025-10-09 15:19:24');
INSERT INTO `sj_job_task_batch` VALUES (57, 'namespaceId', 'das', 1, 0, 0, 0, 4, 0, 1759994399093, 3, '', '', 0, '', '2025-10-09 15:19:59', '', '2025-10-10 12:14:05');
INSERT INTO `sj_job_task_batch` VALUES (58, 'namespaceId', 'das', 1, 0, 0, 0, 5, 1, 1759994547590, 3, '', '', 1, '', '2025-10-09 15:22:28', '', '2025-10-09 15:22:28');
INSERT INTO `sj_job_task_batch` VALUES (68, 'namespaceId', 'das', 1, 0, 0, 0, 3, 0, 1760026667841, 3, '', '', 0, '', '2025-10-10 00:17:48', '', '2025-10-10 00:17:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '命名空间' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知配置' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '告警通知接收人' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '重试信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sj_retry
-- ----------------------------
INSERT INTO `sj_retry` VALUES (1, 'namespaceId', 'das', 'sss666', '1111', 'dasdsadas', 'testJob', '{\"aaa\":\"1\"}', '', 1760372005213, 0, 0, 1, 45, 0, b'0', '', '2025-10-12 17:35:53', '', '2025-10-12 17:35:53');
INSERT INTO `sj_retry` VALUES (3, 'namespaceId', 'das', 'sss666', 'dasdsada', 'dasdasd', 'dassdsa', '{}', '{}', 1760372005213, 0, 0, 1, 126, 0, b'0', '', '2025-10-12 19:06:15', '', '2025-10-12 19:06:15');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '死信队列表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '场景配置' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'DashBoard_Retry' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 909 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '重试任务表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务调度日志信息记录表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '号段模式序号ID分配表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '服务器节点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sj_server_node
-- ----------------------------
INSERT INTO `sj_server_node` VALUES (401, 'DEFAULT_SERVER_NAMESPACE_ID', 'DEFAULT_SERVER', '1977705578645954560', '192.168.50.57', 17888, '2025-10-14 00:13:05', 2, '{\"webPort\":8098}', '', '2025-10-13 19:58:55', '', '2025-10-13 19:58:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户权限表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流节点' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工作流批次' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'SYSTEM', 1, '/system', '', '', '{\"title\":\"系统管理\",\"icon\":\"DashboardOutlined\",\"permission\":\"system:dashboard:list\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:34');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'SYSTEM', 2, '/user', '/system/user', NULL, '{\"title\":\"用户管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (3, 2, '用户新增', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (4, 2, '用户编辑', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (5, 2, '用户删除', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (6, 2, '重置密码', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 4, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', 'SYSTEM', 2, '/role', '/system/role', NULL, '{\"title\":\"角色管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (8, 7, '角色新增', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (9, 7, '角色编辑', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (10, 7, '角色删除', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (11, 7, '分配权限', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 4, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (12, 1, '菜单管理', 'SYSTEM', 2, '/menu', '/system/menu', '', '{\"title\":\"菜单管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (13, 12, '菜单新增', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (14, 12, '菜单编辑', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (15, 12, '菜单删除', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-10-13 20:06:46');
INSERT INTO `sys_menu` VALUES (21, 1, '通知管理', 'SYSTEM', 2, '/notice', '/system/notice', NULL, '{\"title\":\"通知\",\"icon\":\"NotificationOutlined\",\"permission\":\"system:notice:list\",\"show\":true}', 4, b'1', b'0', 'SYSTEM', '2025-04-29 21:09:27', 'SYSTEM', '2025-10-13 20:06:51');
INSERT INTO `sys_menu` VALUES (22, 0, '配置中心', 'CONFIG', 1, '/cc-config', '', '', '{\"title\":\"配置中心\",\"icon\":\"ContainerOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:43:48', 'SYSTEM', '2025-10-13 20:06:59');
INSERT INTO `sys_menu` VALUES (23, 22, '配置管理', 'CONFIG', 2, '/center', '/cc-config/center', NULL, '{\"title\":\"配置管理\",\"icon\":\"ContainerOutlined\",\"permission\":\"system:config:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:58:19', 'SYSTEM', '2025-10-13 20:06:59');
INSERT INTO `sys_menu` VALUES (24, 22, '子系统管理', 'CONFIG', 2, '/subsystem', '/cc-config/subsystem', NULL, '{\"title\":\"子系统管理\",\"icon\":\"SubnodeOutlined\",\"permission\":\"system:subsystem:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 22:00:42', 'SYSTEM', '2025-10-13 20:06:59');
INSERT INTO `sys_menu` VALUES (25, 0, '消息队列', 'MQ', 1, '/mq', '', '', '{\"title\":\"消息队列\",\"icon\":\"MessageOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:44:38', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (26, 25, 'Mq仪表盘', 'MQ', 2, '/mq/dashboard', '/mq/dashboardView', '', '{\"title\":\"MQ仪表盘\",\"icon\":\"DashOutlined\",\"permission\":\"system:mm:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (27, 25, '集群', 'MQ', 2, '/mq/cluster', '/mq/clusterView', '', '{\"title\":\"集群\",\"icon\":\"DashOutlined\",\"permission\":\"system:cluster:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (28, 25, 'topic管理', 'MQ', 2, '/mq/topic', '/mq/topicView', '', '{\"title\":\"主题管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:topic:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (29, 25, '生产者', 'MQ', 2, '/mq/producer', '/mq/producerView', '', '{\"title\":\"生产者\",\"icon\":\"DashOutlined\",\"permission\":\"system:producer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (30, 25, '消费者', 'MQ', 2, '/mq/consumer', '/mq/consumerView', '', '{\"title\":\"消费者\",\"icon\":\"DashOutlined\",\"permission\":\"system:consumer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (31, 25, '消息管理', 'MQ', 2, '/mq/message', '/mq/messageView', '', '{\"title\":\"消息管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:message:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (32, 25, '消息轨迹', 'MQ', 2, '/mq/messageTrace', '/mq/messageTraceView', '', '{\"title\":\"消息轨迹\",\"icon\":\"DashOutlined\",\"permission\":\"system:messageTrace:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (33, 25, '死信消息', 'MQ', 2, '/mq/dlqMessage', '/mq/dlqMessageView', '', '{\"title\":\"死信消息\",\"icon\":\"DashOutlined\",\"permission\":\"system:dlqMessage:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (34, 25, '权限管理', 'MQ', 2, '/mq/acl', '/mq/aclView', '', '{\"title\":\"权限管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:acl:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-10-13 20:07:06');
INSERT INTO `sys_menu` VALUES (36, 0, '首页', 'JOB', 2, '/job/home', '/job/home/homeView', '', '{\"title\":\"首页\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (37, 0, '在线机器', 'JOB', 2, '/job/pods', '/job/pods/podsView', '', '{\"title\":\"在线机器\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 2, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (38, 0, '组管理', 'JOB', 2, '/job/group', '/job/group/groupView', '', '{\"title\":\"组管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 4, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (51, 0, '定时任务', 'JOB', 1, '/job/task', NULL, NULL, '{\"title\":\"定时任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 5, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (52, 0, '工作流', 'JOB', 1, '/job/workflow', NULL, NULL, '{\"title\":\"工作流\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 6, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (53, 0, '重试任务', 'JOB', 1, '/job/retry', NULL, NULL, '{\"title\":\"重试任务\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 7, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (54, 0, '告警配置', 'JOB', 1, '/job/notify', NULL, NULL, '{\"title\":\"告警配置\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 8, b'1', b'0', 'SYSTEM', '2025-10-10 12:19:41', 'SYSTEM', '2025-10-13 20:07:19');
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
INSERT INTO `sys_menu` VALUES (65, 0, '命名空间管理', 'JOB', 1, '/job/namespace', '/job/namespace/namespaceView', '', '{\"title\":\"命名空间\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 3, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (66, 0, '执行器', 'JOB', 1, '/job/executor', '/job/executor/executorView', '', '{\"title\":\"执行器管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (67, 57, '添加', 'JOB', 2, '/workflow/form/add', '/job/workflow/form/add/index', '', '{\"title\":\"添加\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (68, 57, '批次', 'JOB', 2, '/workflow/form/batch', '/job/workflow/form/batch/index', '', '{\"title\":\"批次\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:19');
INSERT INTO `sys_menu` VALUES (69, 57, '复制', 'JOB', 2, '/workflow/form/copy', '/job/workflow/form/copy/index', '', '{\"title\":\"复制\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');
INSERT INTO `sys_menu` VALUES (70, 57, '详情', 'JOB', 2, '/workflow/form/detail', '/job/workflow/form/detail/index', '', '{\"title\":\"详情\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');
INSERT INTO `sys_menu` VALUES (71, 57, '编辑', 'JOB', 2, '/workflow/form/edit', '/job/workflow/form/edit/index', '', '{\"title\":\"编辑\",\"icon\":\"SortAscendingOutlined\",\"show\":false}', 2, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-10-13 20:07:20');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_role_menu` VALUES (31, 2, 2, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (32, 2, 7, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (33, 2, 3, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (34, 2, 4, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (35, 2, 5, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (36, 2, 6, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (37, 2, 8, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (38, 2, 9, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (39, 2, 10, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` VALUES (40, 2, 11, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$2a$10$ns24hvhbVrer2jzZaeHyJu4RsJZj7yItt7UxEED34ZM3C7TC1eW6u', '超级管理员', '/src/assets/images/bubble.png', '13611988536@163.com', '13856854188', b'1', b'0', 'SYSYTEM', '2025-04-13 16:30:34', 'SYSTEM', '2025-10-13 23:58:20');
INSERT INTO `sys_user` VALUES (2, 'hexian', '$2a$2a$10$ns24hvhbVrer2jzZaeHyJu4RsJZj7yItt7UxEED34ZM3C7TC1eW6u', '贺老板', '/src/assets/images/cute.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 18:59:16', 'SYSTEM', '2025-10-13 23:58:17');
INSERT INTO `sys_user` VALUES (3, 'wangbo', '$2a$2a$10$ns24hvhbVrer2jzZaeHyJu4RsJZj7yItt7UxEED34ZM3C7TC1eW6u', '王老板', '/src/assets/images/doraemon.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-10-13 23:58:16');
INSERT INTO `sys_user` VALUES (4, 'tmx', '$2a$10$phdey1astSAjMzcvQTflUuNk9CIqWFMH3W7MnYWPzzzaO9n21lRtW', '老谭', '/src/assets/images/girl.png', '2634603838@qq.com', '13856854188', b'1', b'0', NULL, '2025-10-13 22:55:26', NULL, '2025-10-14 00:01:48');
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (4, 2, 2, 'SYSTEM', '2025-04-15 19:09:29', 'SYSTEM', '2025-04-15 19:09:29');
INSERT INTO `sys_user_role` VALUES (5, 3, 1, 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-04-15 19:09:49');
INSERT INTO `sys_user_role` VALUES (6, 1, 1, 'SYSTEM', '2025-04-15 19:11:52', 'SYSTEM', '2025-04-15 19:11:52');
INSERT INTO `sys_user_role` VALUES (17, 4, 4, NULL, '2025-10-13 23:44:55', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
