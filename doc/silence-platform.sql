/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : silence-platform

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 28/09/2025 00:16:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_component
-- ----------------------------
DROP TABLE IF EXISTS `config_component`;
CREATE TABLE `config_component` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subsystem_id` bigint NOT NULL COMMENT '子系统ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统编码',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='组件表';

-- ----------------------------
-- Records of config_component
-- ----------------------------
BEGIN;
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 1, '老默 内容子系统 service服务', 'SILENCE-CONTENT-SERVICE@SILENCE-CONTENT', b'1', 'SERVICE 服务', '老默', '2024-04-21 00:00:15', 'SYSTEM', '2025-04-13 11:00:25');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 1, '老默 内容子系统 console服务', 'SILENCE-CONTENT-CONSOLE@SILENCE-CONTENT', b'1', 'CONSOLE 服务', '老默', '2024-04-21 00:01:01', 'SYSTEM', '2025-04-13 11:00:34');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 1, '内容子系统 bp服务', 'SILENCE-CONTENT-BP@SILENCE-CONTENT', b'1', 'BP服务', '老默', '2025-03-30 13:39:44', 'SYSTEM', '2025-04-13 11:00:41');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 2, 'Mcore子系统 service服务', 'SILENCE-MCORE-SERVICE@SILENCE-MCORE', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 2, 'Mcore子系统 console服务', 'SILENCE-MCORE-CONSOLE@SILENCE-MCORE', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, 2, 'Mcore子系统 bp服务', 'SILENCE-MCORE-BP@SILENCE-MCORE', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (7, 3, 'CCC子系统 service服务', 'SILENCE-CCC-SERVICE@SILENCE-CCC', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (8, 3, 'CCC子系统 console服务', 'SILENCE-CCC-CONSOLE@SILENCE-CCC', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (9, 3, 'CCC子系统 bp服务', 'SILENCE-CCC-BP@SILENCE-CCC', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (10, 4, 'DDD子系统 service服务', 'SILENCE-DDD-SERVICE@SILENCE-DDD', b'1', 'sssss', '老默', '2024-04-21 00:00:15', '老默', '2024-04-21 00:00:18');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (11, 4, 'DDD子系统 console服务', 'SILENCE-DDD-CONSOLE@SILENCE-DDD', b'1', 'sssss', '老默', '2024-04-21 00:01:01', '老默', '2024-04-21 00:01:04');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (12, 4, 'DDD子系统 bp服务', 'SILENCE-DDD-BP@SILENCE-DDD', b'1', 'sssss', '老默', '2025-03-30 13:39:44', '老默', '2025-03-30 13:39:47');
INSERT INTO `config_component` (`id`, `subsystem_id`, `name`, `code`, `status`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (13, 1, '内容子系统DB服务', 'SILENCE-CONTENT-DB@SILENCE-CONTENT', b'1', 'DB 服务', 'SYSTEM', '2025-04-13 11:01:57', NULL, '2025-04-13 11:01:57');
COMMIT;

-- ----------------------------
-- Table structure for config_environment
-- ----------------------------
DROP TABLE IF EXISTS `config_environment`;
CREATE TABLE `config_environment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_component_id` bigint unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '环境名称',
  `env_type` tinyint unsigned NOT NULL COMMENT '环境类型',
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '显示名称',
  `is_display` bit(1) NOT NULL COMMENT '是否显示',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='环境表';

-- ----------------------------
-- Records of config_environment
-- ----------------------------
BEGIN;
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 1, 'CI-1', 1, '开发1环境', b'1', '老默', '2024-04-21 00:04:22', '老默', '2024-04-21 00:04:25');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 2, 'STG-1', 2, '测试1环境', b'1', '老默', '2024-04-21 00:05:04', '老默', '2024-04-21 00:05:06');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 3, 'PRD-1', 3, '生产1环境', b'1', '老默', '2024-04-21 00:05:33', '老默', '2024-04-21 00:05:36');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 4, 'CI-1', 1, '开发1环境', b'1', '老默', '2025-03-30 13:46:07', '老默', '2025-03-30 13:46:10');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 1, 'CI-2', 1, '开发2环境', b'1', 'SYSTEM', '2025-04-13 12:07:30', '老默', '2025-04-13 12:07:30');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (10, 1, 'STG-1', 2, '测试1环境', b'1', 'SYSTEM', '2025-04-13 13:01:47', 'SYSTEM', '2025-04-13 13:01:47');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (12, 1, 'STG-5', 2, '测试5环境', b'1', 'SYSTEM', '2025-04-13 13:10:01', 'SYSTEM', '2025-04-13 13:10:01');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (13, 1, 'PRD-1', 3, '生产1环境', b'1', 'SYSTEM', '2025-04-13 13:45:02', 'SYSTEM', '2025-04-13 13:45:02');
INSERT INTO `config_environment` (`id`, `config_component_id`, `name`, `env_type`, `display_name`, `is_display`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (14, 1, 'PRD-2', 3, '生产2环境', b'1', 'SYSTEM', '2025-04-13 13:47:52', 'SYSTEM', '2025-04-13 13:47:52');
COMMIT;

-- ----------------------------
-- Table structure for config_item
-- ----------------------------
DROP TABLE IF EXISTS `config_item`;
CREATE TABLE `config_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_environment_id` bigint NOT NULL COMMENT '环境ID',
  `namespace_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '命名空间名称',
  `namespace_status` tinyint unsigned NOT NULL COMMENT '命名空间状态',
  `format_type` tinyint NOT NULL COMMENT '配置项格式类型',
  `type` tinyint unsigned NOT NULL COMMENT '配置项类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip 列表',
  `old_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '老的值',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配置内容',
  `md5` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配置项对应的md5值',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='配置表';

-- ----------------------------
-- Records of config_item
-- ----------------------------
BEGIN;
INSERT INTO `config_item` (`id`, `config_environment_id`, `namespace_id`, `namespace_status`, `format_type`, `type`, `ip`, `old_content`, `content`, `md5`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 1, 'application.yml', 1, 1, 1, '10.28.50.31', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3306/silence-content?allowPublicKeyRetrieval=true&autoReconnect=true&useServerPreparedStmts=false&rewriteBatchedStatements=true&characterEncoding=UTF-8&useSSL=false&allowMultiQueries=true&serverTimezone=Asia/Shanghai\r\n    username: root\r\n    password: 123456\r\n    driverClassName: com.mysql.jdbc.Driver\r\n\r\nrocketmq:\r\n  name-server: 127.0.0.1:9876  # NameServer地址\r\n  producer:\r\n    group: silence-content-producer-group   # 生产者组名\r\n    send-message-timeout: 3000 # 发送超时时间(ms)\r\n  consumer:\r\n    group: silence-content-consumer-group   # 消费者组名\r\n    consume-thread-max: 20     ', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/silence-content?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8\r\n    username: root\r\n    password: admin123456\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    hikari:\r\n      maximum-pool-size: 100\r\n  elasticsearch:\r\n    uris: http://14.103.187.231:9200', '15917fa43f7773d44a65d0070fced326', '老默', '2024-04-21 00:06:45', '老默', '2024-04-21 00:06:47');
INSERT INTO `config_item` (`id`, `config_environment_id`, `namespace_id`, `namespace_status`, `format_type`, `type`, `ip`, `old_content`, `content`, `md5`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 1, 'esg.properties', 2, 2, 2, '10.28.50.31', 'server.port=8081', 'server.port=8080', '76847eb03a7c34cea8f41da1553ec1b2', '老默', '2025-03-30 15:17:10', '老默', '2025-03-30 15:17:19');
INSERT INTO `config_item` (`id`, `config_environment_id`, `namespace_id`, `namespace_status`, `format_type`, `type`, `ip`, `old_content`, `content`, `md5`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 2, 'application.yml', 1, 2, 2, NULL, 'server:\n    port: 8082\n    servlet:\n        context-path: /\n\n', 'server:\n    port: 8082\n    servlet:\n        context-path: /\n\n', 'ca4d8a63ad1114dcae586794be27a167', NULL, NULL, NULL, NULL);
INSERT INTO `config_item` (`id`, `config_environment_id`, `namespace_id`, `namespace_status`, `format_type`, `type`, `ip`, `old_content`, `content`, `md5`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 3, 'application.yml', 1, 2, 2, NULL, 'server:\n    port: 38080\n    servlet:\n        context-path: /', 'server:\n    port: 38080\n    servlet:\n        context-path: /', '5266df774c5a083669090058e23ed536', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_item_history
-- ----------------------------
DROP TABLE IF EXISTS `config_item_history`;
CREATE TABLE `config_item_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_item_id` bigint NOT NULL COMMENT '子系统ID',
  `old_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '旧值',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '修改后的值',
  `operation_type` tinyint unsigned DEFAULT NULL COMMENT '操作类型',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='配置版本表';

-- ----------------------------
-- Records of config_item_history
-- ----------------------------
BEGIN;
INSERT INTO `config_item_history` (`id`, `config_item_id`, `old_content`, `content`, `operation_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 1, 'nacos.test: 111', 'nacos.test: 111', 1, '贺显', '2025-03-30 16:34:23', '贺显', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` (`id`, `config_item_id`, `old_content`, `content`, `operation_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 1, 'nacos.test: 111', 'nacos.test: 222', 2, '贺显', '2025-03-30 16:34:23', '王波', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` (`id`, `config_item_id`, `old_content`, `content`, `operation_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 1, 'nacos.test: 222', 'nacos.test: 333', 2, '贺显', '2025-03-30 16:34:23', '徐洋洋', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` (`id`, `config_item_id`, `old_content`, `content`, `operation_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 1, 'nacos.test: 333', 'nacos.test: 444', 2, '贺显', '2025-03-30 16:34:23', '严晓仪', '2025-03-30 16:34:31');
INSERT INTO `config_item_history` (`id`, `config_item_id`, `old_content`, `content`, `operation_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 1, 'nacos.test: 444', 'nacos.test: 555', 2, '贺显', '2025-03-30 16:34:23', '李羿楠', '2025-03-30 16:34:31');
COMMIT;

-- ----------------------------
-- Table structure for config_item_release_history
-- ----------------------------
DROP TABLE IF EXISTS `config_item_release_history`;
CREATE TABLE `config_item_release_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_item_id` bigint NOT NULL COMMENT '子系统ID',
  `release_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '发布名称',
  `old_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '旧值',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '修改后的值',
  `release_type` tinyint unsigned DEFAULT NULL COMMENT '发布类型',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='配置版本表';

-- ----------------------------
-- Records of config_item_release_history
-- ----------------------------
BEGIN;
INSERT INTO `config_item_release_history` (`id`, `config_item_id`, `release_name`, `old_content`, `content`, `release_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, 1, '20250330173122-release', 'nacos.test: 111', 'nacos:test:222', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` (`id`, `config_item_id`, `release_name`, `old_content`, `content`, `release_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (7, 1, '20250319173122-release', 'nacos.test: 222', 'nacos:test:333', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` (`id`, `config_item_id`, `release_name`, `old_content`, `content`, `release_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (8, 1, '20250321173122-release', 'nacos.test: 333', 'nacos:test:444', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
INSERT INTO `config_item_release_history` (`id`, `config_item_id`, `release_name`, `old_content`, `content`, `release_type`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (9, 1, '20250322173122-release', 'nacos.test: 444', 'nacos:test:555', 1, '贺显', '2025-03-30 17:32:00', '贺显', '2025-03-30 17:32:03');
COMMIT;

-- ----------------------------
-- Table structure for config_subsystem
-- ----------------------------
DROP TABLE IF EXISTS `config_subsystem`;
CREATE TABLE `config_subsystem` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '子系统编码',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人员',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='子系统表';

-- ----------------------------
-- Records of config_subsystem
-- ----------------------------
BEGIN;
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '内容子系统', 'SILENCE-CONTENT', '内容子系统', '老默', '2024-04-20 23:58:34', 'SYSTEM', '2025-04-13 11:04:49');
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'MCORE系统', 'SILENCE-MCORE', 'MCORE子系统', '老默', '2025-03-30 13:32:34', 'SYSTEM', '2025-04-13 11:04:56');
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 'CCC系统', 'SILENCE-CCC', 'CCC子系统', '老默', '2025-03-30 13:33:05', 'SYSTEM', '2025-04-13 11:05:04');
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 'DDD系统', 'SILENCE-DDD', 'DDD子系统', '老默', '2025-03-30 13:33:56', 'SYSTEM', '2025-04-13 11:05:10');
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 'EEE系统', 'SILENCE-EEE', 'EEE子系统', '老默', '2025-03-30 13:34:15', 'SYSTEM', '2025-04-13 11:05:18');
INSERT INTO `config_subsystem` (`id`, `name`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, '营销子系统', 'SILENCE-MARKETING', '营销子系统', 'SYSTEM', '2025-04-13 11:02:50', NULL, '2025-04-13 11:02:50');
COMMIT;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_id` bigint unsigned DEFAULT NULL,
  `sender_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint unsigned DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` (`id`, `title`, `content`, `sender_id`, `sender_name`, `status`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES (1, '收到了14分新周报', '描述信息', 1, 'VB', 1, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:21:58');
INSERT INTO `notice` (`id`, `title`, `content`, `sender_id`, `sender_name`, `status`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES (2, '回复了你', '描述信息', 1, '朱偏右', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` (`id`, `title`, `content`, `sender_id`, `sender_name`, `status`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES (3, '评论了你', '描述信息', 1, '曲丽丽', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` (`id`, `title`, `content`, `sender_id`, `sender_name`, `status`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES (4, '待办提醒', '描述信息', 1, '待办提醒', 0, '2025-04-13 15:06:52', 'SYSTEM', 'SYSTEM', '2025-05-01 21:12:50');
INSERT INTO `notice` (`id`, `title`, `content`, `sender_id`, `sender_name`, `status`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES (5, 'aa', 'bb', NULL, NULL, NULL, '2025-05-11 15:04:15', 'SYSTEM', 'SYSTEM', '2025-05-11 15:04:15');
COMMIT;

-- ----------------------------
-- Table structure for sj_distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `sj_distributed_lock`;
CREATE TABLE `sj_distributed_lock` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '锁名称',
  `lock_until` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '锁定时长',
  `locked_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '锁定时间',
  `locked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '锁定者',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_sj_distributed_lock_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1676 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='锁定表';

-- ----------------------------
-- Records of sj_distributed_lock
-- ----------------------------
BEGIN;
INSERT INTO `sj_distributed_lock` (`id`, `name`, `lock_until`, `locked_at`, `locked_by`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1665, 'registerNode', '2025-09-26 20:16:25.254', '2025-09-26 20:16:20.254', '1971546500810596352', '', '2025-09-26 20:16:20', '', '2025-09-26 20:16:20');
COMMIT;

-- ----------------------------
-- Table structure for sj_group_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_group_config`;
CREATE TABLE `sj_group_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组描述',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT' COMMENT 'token',
  `group_status` tinyint NOT NULL DEFAULT '0' COMMENT '组状态 0、未启用 1、启用',
  `version` int NOT NULL COMMENT '版本号',
  `group_partition` int NOT NULL COMMENT '分区',
  `id_generator_mode` tinyint NOT NULL DEFAULT '1' COMMENT '唯一id生成模式 默认号段模式',
  `init_scene` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否初始化场景 0:否 1:是',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='组配置';

-- ----------------------------
-- Records of sj_group_config
-- ----------------------------
BEGIN;
INSERT INTO `sj_group_config` (`id`, `namespace_id`, `group_name`, `description`, `token`, `group_status`, `version`, `group_partition`, `id_generator_mode`, `init_scene`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 'namespaceId', 'das', 'dasdsa', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 1, 2, b'0', 'SYSTEM', '2025-06-07 13:31:28', 'SYSTEM', '2025-06-07 13:31:38');
COMMIT;

-- ----------------------------
-- Table structure for sj_job
-- ----------------------------
DROP TABLE IF EXISTS `sj_job`;
CREATE TABLE `sj_job` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT '1' COMMENT '参数类型 ',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `job_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '任务状态 0、关闭、1、开启',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、集群 2、广播 3、切片',
  `route_key` tinyint NOT NULL DEFAULT '4' COMMENT '路由策略',
  `executor_type` tinyint NOT NULL DEFAULT '1' COMMENT '执行器类型',
  `executor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行器名称',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '间隔时长',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行 4、恢复',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `max_retry_times` int NOT NULL DEFAULT '0' COMMENT '最大重试次数',
  `parallel_num` int NOT NULL DEFAULT '1' COMMENT '并行数',
  `retry_interval` int NOT NULL DEFAULT '0' COMMENT '重试间隔(s)',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `resident` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否是常驻任务',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `owner_id` bigint DEFAULT NULL COMMENT '负责人id',
  `owner_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE,
  KEY `idx_job_status_bucket_index` (`job_status`,`bucket_index`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='任务信息';

-- ----------------------------
-- Records of sj_job
-- ----------------------------
BEGIN;
INSERT INTO `sj_job` (`id`, `namespace_id`, `group_name`, `job_name`, `args_str`, `args_type`, `next_trigger_at`, `job_status`, `task_type`, `route_key`, `executor_type`, `executor_info`, `trigger_type`, `trigger_interval`, `block_strategy`, `executor_timeout`, `max_retry_times`, `parallel_num`, `retry_interval`, `bucket_index`, `resident`, `notify_ids`, `owner_id`, `owner_name`, `description`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 'namespaceId', 'das', '第一个任务', NULL, 1, 1758884400000, b'1', 1, 4, 1, '111', 3, '0 0/2 * * * ? ', 1, 0, 0, 1, 0, 0, b'0', '', 1, '王波', '1我去问的五千多', '五千多我去', 0, 'SYSTEM', '2025-06-07 13:58:47', 'SYSTEM', '2025-06-07 13:58:47');
INSERT INTO `sj_job` (`id`, `namespace_id`, `group_name`, `job_name`, `args_str`, `args_type`, `next_trigger_at`, `job_status`, `task_type`, `route_key`, `executor_type`, `executor_info`, `trigger_type`, `trigger_interval`, `block_strategy`, `executor_timeout`, `max_retry_times`, `parallel_num`, `retry_interval`, `bucket_index`, `resident`, `notify_ids`, `owner_id`, `owner_name`, `description`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'namespaceId', '1', '第二个任务', '', 1, 1749641303680, b'1', 1, 1, 1, 'sssHandler', 2, '60', 1, 60, 3, 1, 1, 63, b'0', '', 1, '王波', '1111', '', 0, '', '2025-06-11 19:27:23', '', '2025-06-11 19:27:23');
INSERT INTO `sj_job` (`id`, `namespace_id`, `group_name`, `job_name`, `args_str`, `args_type`, `next_trigger_at`, `job_status`, `task_type`, `route_key`, `executor_type`, `executor_info`, `trigger_type`, `trigger_interval`, `block_strategy`, `executor_timeout`, `max_retry_times`, `parallel_num`, `retry_interval`, `bucket_index`, `resident`, `notify_ids`, `owner_id`, `owner_name`, `description`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 'namespaceId', '1', '第三个任务', 'ccc', 1, 1749641736870, b'1', 1, 1, 1, 'http', 2, '60', 1, 60, 3, 1, 1, 110, b'0', '', 1, '王波', 'asdsadsa', '', 0, '', '2025-06-11 19:34:36', '', '2025-06-11 19:34:36');
INSERT INTO `sj_job` (`id`, `namespace_id`, `group_name`, `job_name`, `args_str`, `args_type`, `next_trigger_at`, `job_status`, `task_type`, `route_key`, `executor_type`, `executor_info`, `trigger_type`, `trigger_interval`, `block_strategy`, `executor_timeout`, `max_retry_times`, `parallel_num`, `retry_interval`, `bucket_index`, `resident`, `notify_ids`, `owner_id`, `owner_name`, `description`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 'namespaceId', '1', '第四个任务', '{\\\"method\\\":\\\"POST\\\",\\\"url\\\":\\\"/aaaa\\\",\\\"headers\\\":{},\\\"body\\\":\\\"\\\",\\\"mediaType\\\":\\\"application/json\\\",\\\"timeout\\\":60}', 2, 1749642698913, b'1', 1, 1, 1, 'http', 2, '60', 1, 60, 3, 1, 1, 20, b'0', '', 1, '王波', '', '', 0, '', '2025-06-11 19:47:19', '', '2025-06-11 19:47:19');
COMMIT;

-- ----------------------------
-- Table structure for sj_job_executor
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_executor`;
CREATE TABLE `sj_job_executor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) NOT NULL COMMENT '组名称',
  `executor_info` varchar(256) NOT NULL COMMENT '任务执行器名称',
  `executor_type` varchar(3) NOT NULL COMMENT '1:java 2:python 3:go',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`),
  KEY `idx_create_dt` (`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务执行器信息';

-- ----------------------------
-- Records of sj_job_executor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_job_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_log_message`;
CREATE TABLE `sj_job_log_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '任务批次id',
  `task_id` bigint NOT NULL COMMENT '调度任务id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度信息',
  `log_num` int NOT NULL DEFAULT '1' COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT '0' COMMENT '上报时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_task_batch_id_task_id` (`task_batch_id`,`task_id`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='调度日志';

-- ----------------------------
-- Records of sj_job_log_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_job_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_summary`;
CREATE TABLE `sj_job_summary` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `business_id` bigint NOT NULL COMMENT '业务id (job_id或workflow_id)',
  `system_task_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `success_num` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `fail_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `stop_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `stop_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `cancel_num` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `cancel_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trigger_at_system_task_type_business_id` (`trigger_at`,`system_task_type`,`business_id`) USING BTREE,
  KEY `idx_namespace_id_group_name_business_id` (`namespace_id`,`group_name`,`business_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='DashBoard_Job';

-- ----------------------------
-- Records of sj_job_summary
-- ----------------------------
BEGIN;
INSERT INTO `sj_job_summary` (`id`, `namespace_id`, `group_name`, `business_id`, `system_task_type`, `trigger_at`, `success_num`, `fail_num`, `fail_reason`, `stop_num`, `stop_reason`, `cancel_num`, `cancel_reason`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '764d604ec6fc45f68cd92514c40e9e1a', 'daas', 1, 3, '2025-06-13 00:00:00', 0, 0, '[]', 0, '[]', 0, '[]', '', '2025-06-13 19:54:10', '', '2025-06-13 19:54:10');
INSERT INTO `sj_job_summary` (`id`, `namespace_id`, `group_name`, `business_id`, `system_task_type`, `trigger_at`, `success_num`, `fail_num`, `fail_reason`, `stop_num`, `stop_reason`, `cancel_num`, `cancel_reason`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'namespaceId', 'das', 1, 3, '2025-09-26 00:00:00', 0, 0, '[]', 0, '[]', 3, '[{\"reason\":2,\"total\":3}]', '', '2025-09-26 19:09:36', '', '2025-09-26 19:09:36');
COMMIT;

-- ----------------------------
-- Table structure for sj_job_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task`;
CREATE TABLE `sj_job_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '调度任务id',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父执行器id',
  `task_status` tinyint NOT NULL DEFAULT '0' COMMENT '执行的状态 0、失败 1、成功',
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
  `mr_stage` tinyint DEFAULT NULL COMMENT '动态分片所处阶段 1:map 2:reduce 3:mergeReduce',
  `leaf` bit(1) NOT NULL DEFAULT b'1' COMMENT '叶子节点',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '工作流全局上下文',
  `result_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行结果',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT '1' COMMENT '参数类型 ',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_task_batch_id_task_status` (`task_batch_id`,`task_status`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='任务实例';

-- ----------------------------
-- Records of sj_job_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_job_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task_batch`;
CREATE TABLE `sj_job_task_batch` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `workflow_node_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流节点id',
  `parent_workflow_node_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流任务父批次id',
  `workflow_task_batch_id` bigint NOT NULL DEFAULT '0' COMMENT '工作流任务批次id',
  `task_batch_status` tinyint NOT NULL DEFAULT '1' COMMENT '任务批次状态',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `execution_at` bigint NOT NULL DEFAULT '0' COMMENT '任务执行时间',
  `system_task_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '父节点',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_job_id_task_batch_status` (`job_id`,`task_batch_status`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE,
  KEY `idx_workflow_task_batch_id_workflow_node_id` (`workflow_task_batch_id`,`workflow_node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='任务批次';

-- ----------------------------
-- Records of sj_job_task_batch
-- ----------------------------
BEGIN;
INSERT INTO `sj_job_task_batch` (`id`, `namespace_id`, `group_name`, `job_id`, `workflow_node_id`, `parent_workflow_node_id`, `workflow_task_batch_id`, `task_batch_status`, `operation_reason`, `execution_at`, `system_task_type`, `parent_id`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '764d604ec6fc45f68cd92514c40e9e1a', 'das', 1, 0, 0, 0, 1, 1, 0, 3, '', '', 1, 'SYSTEM', '2025-06-13 19:53:31', 'SYSTEM', '2025-06-13 19:53:31');
INSERT INTO `sj_job_task_batch` (`id`, `namespace_id`, `group_name`, `job_id`, `workflow_node_id`, `parent_workflow_node_id`, `workflow_task_batch_id`, `task_batch_status`, `operation_reason`, `execution_at`, `system_task_type`, `parent_id`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'namespaceId', 'das', 1, 0, 0, 0, 6, 2, 0, 3, '', '', 0, '', '2025-09-26 19:04:21', '', '2025-09-26 19:08:55');
INSERT INTO `sj_job_task_batch` (`id`, `namespace_id`, `group_name`, `job_id`, `workflow_node_id`, `parent_workflow_node_id`, `workflow_task_batch_id`, `task_batch_status`, `operation_reason`, `execution_at`, `system_task_type`, `parent_id`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 'namespaceId', 'das', 1, 0, 0, 0, 6, 2, 0, 3, '', '', 0, '', '2025-09-26 19:11:33', '', '2025-09-26 19:11:37');
INSERT INTO `sj_job_task_batch` (`id`, `namespace_id`, `group_name`, `job_id`, `workflow_node_id`, `parent_workflow_node_id`, `workflow_task_batch_id`, `task_batch_status`, `operation_reason`, `execution_at`, `system_task_type`, `parent_id`, `ext_attrs`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 'namespaceId', 'das', 1, 0, 0, 0, 6, 2, 0, 3, '', '', 0, '', '2025-09-26 19:11:55', '', '2025-09-26 19:11:58');
COMMIT;

-- ----------------------------
-- Table structure for sj_namespace
-- ----------------------------
DROP TABLE IF EXISTS `sj_namespace`;
CREATE TABLE `sj_namespace` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '唯一id',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_unique_id` (`unique_id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='命名空间';

-- ----------------------------
-- Records of sj_namespace
-- ----------------------------
BEGIN;
INSERT INTO `sj_namespace` (`id`, `name`, `unique_id`, `description`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 'Default', 'namespaceId', '2', 0, '', '2025-04-16 17:02:13', 'SYSTEM', '2025-05-10 23:38:53');
INSERT INTO `sj_namespace` (`id`, `name`, `unique_id`, `description`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'UAT', '96677cc7151f4738961e7cfaf7968209', '1', 0, 'SYSTEM', '2025-05-10 23:29:50', 'SYSTEM', '2025-05-10 23:35:02');
COMMIT;

-- ----------------------------
-- Table structure for sj_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_config`;
CREATE TABLE `sj_notify_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `notify_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知名称',
  `notify_type` tinyint NOT NULL DEFAULT '3' COMMENT '任务类型 1. 重试任务 2. 重试回调 3、JOB任务 4、WORKFLOW任务',
  `notify_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '通知状态 0、未启用 1、启用',
  `recipient_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接收人id列表',
  `notify_threshold` int NOT NULL DEFAULT '0' COMMENT '通知阈值',
  `notify_scene` tinyint NOT NULL DEFAULT '0' COMMENT '通知场景',
  `rate_limiter_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '限流状态 0、未启用 1、启用',
  `rate_limiter_threshold` int NOT NULL DEFAULT '0' COMMENT '每秒限流阈值',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='通知配置';

-- ----------------------------
-- Records of sj_notify_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_notify_recipient
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_recipient`;
CREATE TABLE `sj_notify_recipient` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接收人名称',
  `notify_type` tinyint NOT NULL DEFAULT '0' COMMENT '通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书 5 webhook',
  `notify_attribute` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置属性',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_namespace_id` (`namespace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='告警通知接收人';

-- ----------------------------
-- Records of sj_notify_recipient
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry`;
CREATE TABLE `sj_retry` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '扩展字段',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
  `retry_status` tinyint NOT NULL DEFAULT '0' COMMENT '重试状态 0、重试中 1、成功 2、最大重试次数',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、重试数据 2、回调数据',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父节点id',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name_task_type_idempotent_id_is_deleted` (`namespace_id`,`group_name`,`task_type`,`idempotent_id`,`is_deleted`) USING BTREE,
  KEY `idx_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`) USING BTREE,
  KEY `idx_namespace_id_group_name_retry_status` (`namespace_id`,`group_name`,`retry_status`) USING BTREE,
  KEY `idx_idempotent_id` (`idempotent_id`) USING BTREE,
  KEY `idx_biz_no` (`biz_no`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='重试信息表';

-- ----------------------------
-- Records of sj_retry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry_dead_letter
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_dead_letter`;
CREATE TABLE `sj_retry_dead_letter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  KEY `idx_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`) USING BTREE,
  KEY `idx_idempotent_id` (`idempotent_id`) USING BTREE,
  KEY `idx_biz_no` (`biz_no`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='死信队列表';

-- ----------------------------
-- Records of sj_retry_dead_letter
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry_scene_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_scene_config`;
CREATE TABLE `sj_retry_scene_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '组状态 0、未启用 1、启用',
  `max_retry_count` int NOT NULL DEFAULT '5' COMMENT '最大重试次数',
  `back_off` tinyint NOT NULL DEFAULT '1' COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '间隔时长',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `deadline_request` bigint unsigned NOT NULL DEFAULT '60000' COMMENT 'Deadline Request 调用链超时 单位毫秒',
  `executor_timeout` int unsigned NOT NULL DEFAULT '5' COMMENT '任务执行超时时间，单位秒',
  `route_key` tinyint NOT NULL DEFAULT '4' COMMENT '路由策略',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `cb_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '回调状态 0、不开启 1、开启',
  `cb_trigger_type` tinyint NOT NULL DEFAULT '1' COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `cb_max_count` int NOT NULL DEFAULT '16' COMMENT '回调的最大执行次数',
  `cb_trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '回调的最大执行次数',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_namespace_id_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='场景配置';

-- ----------------------------
-- Records of sj_retry_scene_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_summary`;
CREATE TABLE `sj_retry_summary` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `scene_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '场景名称',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `running_num` int NOT NULL DEFAULT '0' COMMENT '重试中-日志数量',
  `finish_num` int NOT NULL DEFAULT '0' COMMENT '重试完成-日志数量',
  `max_count_num` int NOT NULL DEFAULT '0' COMMENT '重试到达最大次数-日志数量',
  `suspend_num` int NOT NULL DEFAULT '0' COMMENT '暂停重试-日志数量',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_scene_name_trigger_at` (`namespace_id`,`group_name`,`scene_name`,`trigger_at`) USING BTREE,
  KEY `idx_trigger_at` (`trigger_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='DashBoard_Retry';

-- ----------------------------
-- Records of sj_retry_summary
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task`;
CREATE TABLE `sj_retry_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '场景名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '扩展字段',
  `task_status` tinyint NOT NULL DEFAULT '1' COMMENT '重试状态',
  `task_type` tinyint NOT NULL DEFAULT '1' COMMENT '任务类型 1、重试数据 2、回调数据',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_group_name_scene_name` (`namespace_id`,`group_name`,`scene_name`) USING BTREE,
  KEY `task_status` (`task_status`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_retry_id` (`retry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='重试任务表';

-- ----------------------------
-- Records of sj_retry_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_retry_task_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task_log_message`;
CREATE TABLE `sj_retry_task_log_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `retry_task_id` bigint NOT NULL COMMENT '重试任务Id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '异常信息',
  `log_num` int NOT NULL DEFAULT '1' COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT '0' COMMENT '上报时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_namespace_id_group_name_retry_task_id` (`namespace_id`,`group_name`,`retry_task_id`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='任务调度日志信息记录表';

-- ----------------------------
-- Records of sj_retry_task_log_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_sequence_alloc
-- ----------------------------
DROP TABLE IF EXISTS `sj_sequence_alloc`;
CREATE TABLE `sj_sequence_alloc` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '组名称',
  `max_id` bigint NOT NULL DEFAULT '1' COMMENT '最大id',
  `step` int NOT NULL DEFAULT '100' COMMENT '步长',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='号段模式序号ID分配表';

-- ----------------------------
-- Records of sj_sequence_alloc
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_server_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_server_node`;
CREATE TABLE `sj_server_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `host_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主机id',
  `host_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '机器ip',
  `host_port` int NOT NULL COMMENT '机器端口',
  `expire_at` datetime NOT NULL COMMENT '过期时间',
  `node_type` tinyint unsigned NOT NULL COMMENT '节点类型 1、客户端 2、是服务端',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_host_id_host_ip` (`host_id`,`host_ip`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE,
  KEY `idx_expire_at_node_type` (`expire_at`,`node_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='服务器节点';

-- ----------------------------
-- Records of sj_server_node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user`;
CREATE TABLE `sj_system_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '角色：1-普通用户、2-管理员',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sj_system_user
-- ----------------------------
BEGIN;
INSERT INTO `sj_system_user` (`id`, `username`, `password`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 'admin', '465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac', 2, '', '2025-04-16 17:03:00', '', '2025-04-16 17:03:00');
COMMIT;

-- ----------------------------
-- Table structure for sj_system_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user_permission`;
CREATE TABLE `sj_system_user_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `system_user_id` bigint NOT NULL COMMENT '系统用户id',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_namespace_id_group_name_system_user_id` (`namespace_id`,`group_name`,`system_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统用户权限表';

-- ----------------------------
-- Records of sj_system_user_permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_workflow
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow`;
CREATE TABLE `sj_workflow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workflow_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '工作流名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `workflow_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '工作流状态 0、关闭、1、开启',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '间隔时长',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `block_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '上下文',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `bucket_index` int NOT NULL DEFAULT '0' COMMENT 'bucket',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='工作流';

-- ----------------------------
-- Records of sj_workflow
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_node`;
CREATE TABLE `sj_workflow_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `node_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '节点名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `workflow_id` bigint NOT NULL COMMENT '工作流ID',
  `node_type` tinyint NOT NULL DEFAULT '1' COMMENT '1、任务节点 2、条件节点',
  `expression_type` tinyint NOT NULL DEFAULT '0' COMMENT '1、SpEl、2、Aviator 3、QL',
  `fail_strategy` tinyint NOT NULL DEFAULT '1' COMMENT '失败策略 1、跳过 2、阻塞',
  `workflow_node_status` bit(1) NOT NULL DEFAULT b'1' COMMENT '工作流节点状态 0、关闭、1、开启',
  `priority_level` int NOT NULL DEFAULT '1' COMMENT '优先级',
  `node_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '节点信息 ',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='工作流节点';

-- ----------------------------
-- Records of sj_workflow_node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sj_workflow_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_task_batch`;
CREATE TABLE `sj_workflow_task_batch` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '组名称',
  `workflow_id` bigint NOT NULL COMMENT '工作流任务id',
  `task_batch_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT '0' COMMENT '操作原因',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '全局上下文',
  `execution_at` bigint NOT NULL DEFAULT '0' COMMENT '任务执行时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '扩展字段',
  `version` int NOT NULL DEFAULT '1' COMMENT '版本号',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 1、删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_job_id_task_batch_status` (`workflow_id`,`task_batch_status`) USING BTREE,
  KEY `idx_created_date` (`created_date`) USING BTREE,
  KEY `idx_namespace_id_group_name` (`namespace_id`,`group_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='工作流批次';

-- ----------------------------
-- Records of sj_workflow_task_batch
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `type` tinyint unsigned NOT NULL COMMENT '菜单类型：1-目录，2-菜单，3-按钮',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由路径',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件路径',
  `redirect` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `meta` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单图标',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态：0-禁用，1-启用',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 0, '系统管理', 1, '/system', '', '', '{\"title\":\"系统管理\",\"icon\":\"DashboardOutlined\",\"permission\":\"system:dashboard:list\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-05-01 15:42:07');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 1, '用户管理', 2, '/user', '/system/user', NULL, '{\"title\":\"用户管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-05-01 17:01:46');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 2, '用户新增', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 2, '用户编辑', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 2, '用户删除', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, 2, '重置密码', 3, NULL, NULL, NULL, NULL, 4, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (7, 1, '角色管理', 2, '/role', '/system/role', NULL, '{\"title\":\"角色管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-05-01 15:44:01');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (8, 7, '角色新增', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (9, 7, '角色编辑', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (10, 7, '角色删除', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (11, 7, '分配权限', 3, NULL, NULL, NULL, NULL, 4, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (12, 1, '菜单管理', 2, '/menu', '/system/menu', '', '{\"title\":\"菜单管理\",\"icon\":\"MenuOutlined\",\"permission\":\"\",\"show\":true}', 11, b'1', b'0', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-05-01 15:44:13');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (13, 12, '菜单新增', 3, NULL, NULL, NULL, NULL, 1, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (14, 12, '菜单编辑', 3, NULL, NULL, NULL, NULL, 2, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (15, 12, '菜单删除', 3, NULL, NULL, NULL, NULL, 3, b'1', b'1', 'SYSTEM', '2025-04-13 16:31:02', 'SYSTEM', '2025-04-26 19:36:10');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (21, 1, '通知管理', 2, '/notice', '/system/notice', NULL, '{\"title\":\"通知\",\"icon\":\"NotificationOutlined\",\"permission\":\"system:notice:list\",\"show\":true}', 4, b'1', b'0', 'SYSTEM', '2025-04-29 21:09:27', 'SYSTEM', '2025-05-11 13:37:35');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (22, 0, '配置中心', 1, '/cc-config', '', '', '{\"title\":\"配置中心\",\"icon\":\"ContainerOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:43:48', 'SYSTEM', '2025-05-11 12:45:09');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (23, 22, '配置管理', 2, '/center', '/cc-config/center', NULL, '{\"title\":\"配置管理\",\"icon\":\"ContainerOutlined\",\"permission\":\"system:config:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 21:58:19', 'SYSTEM', '2025-05-11 12:45:14');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (24, 22, '子系统管理', 2, '/subsystem', '/cc-config/subsystem', NULL, '{\"title\":\"子系统管理\",\"icon\":\"SubnodeOutlined\",\"permission\":\"system:subsystem:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-04-29 22:00:42', 'SYSTEM', '2025-05-11 12:45:18');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (25, 0, '消息队列', 1, '/mq', '', '', '{\"title\":\"消息队列\",\"icon\":\"MessageOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:44:38', 'SYSTEM', '2025-05-02 02:47:41');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (26, 25, 'Mq仪表盘', 2, '/mq/dashboard', '/mq/dashboardView', '', '{\"title\":\"MQ仪表盘\",\"icon\":\"DashOutlined\",\"permission\":\"system:mm:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (27, 25, '集群', 2, '/mq/cluster', '/mq/clusterView', '', '{\"title\":\"集群\",\"icon\":\"DashOutlined\",\"permission\":\"system:cluster:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (28, 25, 'topic管理', 2, '/mq/topic', '/mq/topicView', '', '{\"title\":\"主题管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:topic:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (29, 25, '生产者', 2, '/mq/producer', '/mq/producerView', '', '{\"title\":\"生产者\",\"icon\":\"DashOutlined\",\"permission\":\"system:producer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-03 18:30:12');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (30, 25, '消费者', 2, '/mq/consumer', '/mq/consumerView', '', '{\"title\":\"消费者\",\"icon\":\"DashOutlined\",\"permission\":\"system:consumer:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (31, 25, '消息管理', 2, '/mq/message', '/mq/messageView', '', '{\"title\":\"消息管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:message:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (32, 25, '消息轨迹', 2, '/mq/messageTrace', '/mq/messageTraceView', '', '{\"title\":\"消息轨迹\",\"icon\":\"DashOutlined\",\"permission\":\"system:messageTrace:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (33, 25, '死信消息', 2, '/mq/dlqMessage', '/mq/dlqMessageView', '', '{\"title\":\"死信消息\",\"icon\":\"DashOutlined\",\"permission\":\"system:dlqMessage:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (34, 25, '权限管理', 2, '/mq/acl', '/mq/aclView', '', '{\"title\":\"权限管理\",\"icon\":\"DashOutlined\",\"permission\":\"system:acl:list\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-02 02:46:13', 'SYSTEM', '2025-05-02 02:49:26');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (35, 0, 'job管理', 2, '/job', '', '', '{\"title\":\"job管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:02:56');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (36, 35, '首页', 2, '/job/home', '/job/home/homeView', '', '{\"title\":\"首页\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 21:31:27');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (37, 35, '在线机器', 2, '/job/pods', '/job/pods/podsView', '', '{\"title\":\"在线机器\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 21:32:16');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (38, 35, '组管理', 2, '/job/group', '/job/group/groupView', '', '{\"title\":\"组管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-06-06 18:52:17');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (39, 35, '定时任务任务管理', 2, '/job/task', '/job/task/taskView', '', '{\"title\":\"定时任务任务管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-06-07 11:29:12');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (40, 35, '定时任务执行批次管理', 2, '/job/batch', '/job/batch/jobBatchView', '', '{\"title\":\"定时任务执行批次管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-06-13 16:55:29');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (41, 35, '工作流任务管理', 2, '/job/workflow/task', '/job/workflow/taskView', '', '{\"title\":\"工作流任务管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-06-06 18:52:07');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (42, 35, '工作流执行批次', 2, '/job/workflow/batch', '/job/workflow/batchView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (43, 35, '重试任务任务管理', 2, '/job/retry/info', '/job/retry/infoView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (44, 35, '重试任务', 2, '/job/retry/task', '/job/retry/taskView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (45, 35, '重试场景', 2, '/job/retry/scene', '/job/retry/sceneView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (46, 35, '死信任务', 2, '/job/retry/deadLetter', '/job/retry/deadLetterView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (47, 35, '通知配置', 2, '/job/notify/config', '/job/notify/configView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (48, 35, '通知人', 2, '/job/notify/recipient', '/job/notify/recipientView', '', '{\"title\":\"\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'1', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-09 20:01:52');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (49, 35, '命名空间管理', 2, '/job/namespace', '/job/namespace/namespaceView', '', '{\"title\":\"命名空间\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-05-09 19:39:56', 'SYSTEM', '2025-05-10 23:08:22');
INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `type`, `path`, `component`, `redirect`, `meta`, `sort`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (50, 35, '执行器', 2, '/job/executor', '/job/executor/executorView', '', '{\"title\":\"执行器管理\",\"icon\":\"SortAscendingOutlined\",\"show\":true}', 1, b'1', b'0', 'SYSTEM', '2025-09-26 15:49:23', 'SYSTEM', '2025-09-26 16:11:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色编码',
  `app_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色所属应用',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0-禁用，1-启用',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `name`, `code`, `app_code`, `description`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, '超级管理员', 'ROLE_ADMIN', 'SILENCE-CONTENT', '系统超级管理员，拥有所有权限', 1, 0, 'SYSTEM', '2025-04-13 16:30:34', 'SYSTEM', '2025-09-22 17:24:15');
INSERT INTO `sys_role` (`id`, `name`, `code`, `app_code`, `description`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, '内容管理员', 'CONTENT_ADMIN', 'SILENCE-CONTENT', '子系统内容管理员', 1, 0, 'SYSTEM', '2025-04-15 15:51:48', 'SYSTEM', '2025-09-22 17:24:17');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 1, 1, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 1, 2, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 1, 3, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 1, 4, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 1, 5, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, 1, 6, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (7, 1, 7, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (8, 1, 8, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (9, 1, 9, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (10, 1, 10, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (11, 1, 11, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (12, 1, 12, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (13, 1, 13, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (14, 1, 14, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (15, 1, 15, NULL, '2025-04-13 16:31:02', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (31, 2, 2, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (32, 2, 7, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (33, 2, 3, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (34, 2, 4, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (35, 2, 5, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (36, 2, 6, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (37, 2, 8, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (38, 2, 9, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (39, 2, 10, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (40, 2, 11, 'SYSTEM', '2025-04-15 16:45:00', 'SYSTEM', '2025-04-15 16:45:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像URL',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态：0-禁用，1-启用',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0-未删除，1-已删除',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `avatar`, `email`, `phone`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (1, 'admin', '123456', '超级管理员', '/src/assets/images/bubble.png', '13611988536@163.com', '13856854188', b'1', b'0', 'SYSYTEM', '2025-04-13 16:30:34', 'SYSTEM', '2025-04-15 19:11:52');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `avatar`, `email`, `phone`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (2, 'hexian', '123456', '贺老板', '/src/assets/images/cute.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 18:59:16', 'SYSTEM', '2025-04-15 19:09:29');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `avatar`, `email`, `phone`, `status`, `is_deleted`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (3, 'wangbo', '123456', '王老板', '/src/assets/images/doraemon.png', '11111111111@163.com', '13856854188', b'1', b'0', 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-04-15 19:09:49');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_role` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (4, 2, 2, 'SYSTEM', '2025-04-15 19:09:29', 'SYSTEM', '2025-04-15 19:09:29');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (5, 3, 1, 'SYSTEM', '2025-04-15 19:09:49', 'SYSTEM', '2025-04-15 19:09:49');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES (6, 1, 1, 'SYSTEM', '2025-04-15 19:11:52', 'SYSTEM', '2025-04-15 19:11:52');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
