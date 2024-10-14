/*
 Navicat Premium Data Transfer

 Source Server         : 本地-Mysql
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : localhost:3306
 Source Schema         : skf

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 14/10/2024 22:44:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_info
-- ----------------------------
DROP TABLE IF EXISTS `api_info`;
CREATE TABLE `api_info` (
  `api_id` int NOT NULL AUTO_INCREMENT COMMENT '接口ID',
  `api_name` varchar(255) NOT NULL COMMENT '接口名称',
  `project_id` int NOT NULL COMMENT '项目ID',
  `api_method` varchar(10) NOT NULL COMMENT '接口方法',
  `api_url` varchar(512) NOT NULL COMMENT '接口地址',
  `api_status` varchar(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `api_level` varchar(2) NOT NULL COMMENT '优先级（P0、P1、P2、P3）',
  `api_tags` json DEFAULT NULL COMMENT '标签',
  `request_data_type` int DEFAULT NULL COMMENT '请求数据类型',
  `request_data` json DEFAULT NULL COMMENT '请求数据',
  `request_headers` json DEFAULT NULL COMMENT '请求头',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`api_id`),
  KEY `ix_api_info_api_name` (`api_name`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='接口表';

-- ----------------------------
-- Records of api_info
-- ----------------------------
BEGIN;
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '测试本地接口', 1, 'GET', 'http://127.0.0.1:9099/dev-api/openapi.json', '0', 'P1', '[]', 0, '[]', '[]', 'admin', '2024-10-08 21:37:29', 'admin', '2024-10-08 21:37:29', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '登录接口', 1, 'POST', 'http://127.0.0.1:9099/dev-api/login', '0', 'P1', '[]', 0, '{\"code\": \"0\", \"uuid\": \"ranyong\", \"password\": \"admin123\", \"username\": \"admin\"}', '[]', 'admin', '2024-10-08 21:38:39', 'admin', '2024-10-08 21:38:39', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '会', 1, 'GET', '/login', '0', 'P1', '[\"登录\", \"注册\"]', 2, '[{\"key\": \"33\", \"type\": \"text\", \"value\": \"44\"}, {\"key\": \"11\", \"type\": \"text\", \"value\": \"44\"}, {\"key\": \"122\", \"type\": \"text\", \"value\": \"55\"}]', '[{\"key\": \"Authorization\", \"value\": \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsInVzZXJfbmFtZSI6ImFkbWluIiwiZGVwdF9uYW1lIjoiXHU3ODE0XHU1M2QxXHU5MGU4XHU5NWU4Iiwic2Vzc2lvbl9pZCI6ImE1YzQ5MDhhLTNjMTgtNDE1Ni1hNTkwLWFkMGIyZDY1NDNhYSIsImxvZ2luX2luZm8iOnsiaXBhZGRyIjoiMTEyLjk2LjIyNC4xMzgiLCJsb2dpbkxvY2F0aW9uIjoiXHU0ZTlhXHU2ZDMyLVx1NWU3Zlx1NGUxY1x1NzcwMSIsImJyb3dzZXIiOiJDaHJvbWUgMTA5Iiwib3MiOiJNYWMgT1MgWCAxMCIsImxvZ2luVGltZSI6IjIwMjQtMDktMjYgMjA6NTc6MzMifSwiZXhwIjoxNzI3NDQxODUzfQ.UMV9sONUcsMOje0eMmrfwJRlzST29DsQR5XaPinsSiU\", \"remarks\": \"这是一个请求头\"}]', 'admin', '2024-10-08 21:31:05', 'admin', '2024-10-08 21:31:05', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, '金', 1, 'GET', '/login', '0', 'P1', '[]', 0, '[]', '[{\"key\": \"Authorization\", \"value\": \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsInVzZXJfbmFtZSI6ImFkbWluIiwiZGVwdF9uYW1lIjoiXHU3ODE0XHU1M2QxXHU5MGU4XHU5NWU4Iiwic2Vzc2lvbl9pZCI6ImE1YzQ5MDhhLTNjMTgtNDE1Ni1hNTkwLWFkMGIyZDY1NDNhYSIsImxvZ2luX2luZm8iOnsiaXBhZGRyIjoiMTEyLjk2LjIyNC4xMzgiLCJsb2dpbkxvY2F0aW9uIjoiXHU0ZTlhXHU2ZDMyLVx1NWU3Zlx1NGUxY1x1NzcwMSIsImJyb3dzZXIiOiJDaHJvbWUgMTA5Iiwib3MiOiJNYWMgT1MgWCAxMCIsImxvZ2luVGltZSI6IjIwMjQtMDktMjYgMjA6NTc6MzMifSwiZXhwIjoxNzI3NDQxODUzfQ.UMV9sONUcsMOje0eMmrfwJRlzST29DsQR5XaPinsSiU\", \"remarks\": \"这是一个请求头\"}, {\"key\": \"Accept\", \"value\": \"application/json, text/plain, */*\", \"remarks\": \"\"}, {\"key\": \"Content-Type\", \"value\": \"application/json\", \"remarks\": \"\"}, {\"key\": \"User-Agent\", \"value\": \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\", \"remarks\": \"\"}]', 'admin', '2024-10-08 21:31:56', 'admin', '2024-10-08 21:31:56', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (34, '劳', 1, 'GET', '/login', '0', 'P1', '[\"登录\", \"注册\"]', 0, '[]', '[{\"key\": \"Authorization\", \"value\": \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsInVzZXJfbmFtZSI6ImFkbWluIiwiZGVwdF9uYW1lIjoiXHU3ODE0XHU1M2QxXHU5MGU4XHU5NWU4Iiwic2Vzc2lvbl9pZCI6ImE1YzQ5MDhhLTNjMTgtNDE1Ni1hNTkwLWFkMGIyZDY1NDNhYSIsImxvZ2luX2luZm8iOnsiaXBhZGRyIjoiMTEyLjk2LjIyNC4xMzgiLCJsb2dpbkxvY2F0aW9uIjoiXHU0ZTlhXHU2ZDMyLVx1NWU3Zlx1NGUxY1x1NzcwMSIsImJyb3dzZXIiOiJDaHJvbWUgMTA5Iiwib3MiOiJNYWMgT1MgWCAxMCIsImxvZ2luVGltZSI6IjIwMjQtMDktMjYgMjA6NTc6MzMifSwiZXhwIjoxNzI3NDQxODUzfQ.UMV9sONUcsMOje0eMmrfwJRlzST29DsQR5XaPinsSiU\", \"remarks\": \"这是一个请求头\"}]', 'admin', '2024-10-08 21:30:01', 'admin', '2024-10-08 21:30:01', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (47, '也', 1, 'GET', '/login', '0', 'P1', '[]', 0, '[]', '[]', 'admin', '2024-10-08 21:29:28', 'admin', '2024-10-08 21:29:28', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (63, '表', 1, 'GET', '123123', '0', 'P1', '[]', 0, '[]', '[]', 'admin', '2024-10-08 21:33:41', 'admin', '2024-10-08 21:33:41', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (68, '关', 1, 'GET', '/login', '0', 'P1', '[\"登录\", \"注册\"]', 3, '[{\"key\": \"ranyong\", \"value\": \"yong\", \"remarks\": \"这是 x_www_form_urlencoded\"}]', '[{\"key\": \"Authorization\", \"value\": \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsInVzZXJfbmFtZSI6ImFkbWluIiwiZGVwdF9uYW1lIjoiXHU3ODE0XHU1M2QxXHU5MGU4XHU5NWU4Iiwic2Vzc2lvbl9pZCI6ImE1YzQ5MDhhLTNjMTgtNDE1Ni1hNTkwLWFkMGIyZDY1NDNhYSIsImxvZ2luX2luZm8iOnsiaXBhZGRyIjoiMTEyLjk2LjIyNC4xMzgiLCJsb2dpbkxvY2F0aW9uIjoiXHU0ZTlhXHU2ZDMyLVx1NWU3Zlx1NGUxY1x1NzcwMSIsImJyb3dzZXIiOiJDaHJvbWUgMTA5Iiwib3MiOiJNYWMgT1MgWCAxMCIsImxvZ2luVGltZSI6IjIwMjQtMDktMjYgMjA6NTc6MzMifSwiZXhwIjoxNzI3NDQxODUzfQ.UMV9sONUcsMOje0eMmrfwJRlzST29DsQR5XaPinsSiU\", \"remarks\": \"这是一个请求头\"}]', 'admin', '2024-10-08 21:31:16', 'admin', '2024-10-08 21:31:16', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (83, '再', 1, 'GET', '/login', '0', 'P1', '[\"登录\", \"注册\"]', 0, '[]', '[]', 'admin', '2024-10-08 21:31:28', 'admin', '2024-10-08 21:31:28', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (89, '区', 1, 'GET', '/login', '0', 'P1', '[\"登录\", \"注册\"]', 1, '[{\"name\": \"ranyong\"}]', '[{\"key\": \"Authorization\", \"value\": \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsInVzZXJfbmFtZSI6ImFkbWluIiwiZGVwdF9uYW1lIjoiXHU3ODE0XHU1M2QxXHU5MGU4XHU5NWU4Iiwic2Vzc2lvbl9pZCI6ImE1YzQ5MDhhLTNjMTgtNDE1Ni1hNTkwLWFkMGIyZDY1NDNhYSIsImxvZ2luX2luZm8iOnsiaXBhZGRyIjoiMTEyLjk2LjIyNC4xMzgiLCJsb2dpbkxvY2F0aW9uIjoiXHU0ZTlhXHU2ZDMyLVx1NWU3Zlx1NGUxY1x1NzcwMSIsImJyb3dzZXIiOiJDaHJvbWUgMTA5Iiwib3MiOiJNYWMgT1MgWCAxMCIsImxvZ2luVGltZSI6IjIwMjQtMDktMjYgMjA6NTc6MzMifSwiZXhwIjoxNzI3NDQxODUzfQ.UMV9sONUcsMOje0eMmrfwJRlzST29DsQR5XaPinsSiU\", \"remarks\": \"这是一个请求头\"}]', 'admin', '2024-10-08 21:30:43', 'admin', '2024-10-08 21:30:43', 'string');
INSERT INTO `api_info` (`api_id`, `api_name`, `project_id`, `api_method`, `api_url`, `api_status`, `api_level`, `api_tags`, `request_data_type`, `request_data`, `request_headers`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (96, '所', 1, 'GET', '/login', '0', 'P1', '[]', 1, '[{\"age\": \"18\", \"sex\": \"man\", \"name\": \"ranyong\"}]', '[]', 'admin', '2024-10-08 21:31:42', 'admin', '2024-10-08 21:31:42', 'string');
COMMIT;

-- ----------------------------
-- Table structure for apscheduler_jobs
-- ----------------------------
DROP TABLE IF EXISTS `apscheduler_jobs`;
CREATE TABLE `apscheduler_jobs` (
  `id` varchar(191) NOT NULL,
  `next_run_time` double DEFAULT NULL,
  `job_state` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_apscheduler_jobs_next_run_time` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apscheduler_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS `data_source`;
CREATE TABLE `data_source` (
  `datasource_id` int NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `datasource_name` varchar(20) NOT NULL COMMENT '数据源名称',
  `datasource_type` varchar(10) NOT NULL COMMENT '数据源类型',
  `datasource_host` varchar(255) NOT NULL COMMENT '数据源地址',
  `datasource_port` varchar(10) NOT NULL COMMENT '数据源端口',
  `datasource_user` varchar(64) NOT NULL COMMENT '数据源用户名',
  `datasource_pwd` varchar(255) NOT NULL COMMENT '数据源密码',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`datasource_id`),
  KEY `ix_data_source_datasource_name` (`datasource_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源配置表';

-- ----------------------------
-- Records of data_source
-- ----------------------------
BEGIN;
INSERT INTO `data_source` (`datasource_id`, `datasource_name`, `datasource_type`, `datasource_host`, `datasource_port`, `datasource_user`, `datasource_pwd`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '本地数据库', 'mysql', '127.0.0.1', '3306', 'root', 'gAAAAABm74QnTpQZZtgyA-MHKFuEi217Zc-5-YmfFN6L9HhVcGX1PFJVSOi86lAfrhCuLTERDR4zZX8yssD13JVZkP4udo5ZUw==', 'admin', '2024-09-21 15:53:47', 'admin', '2024-09-22 10:54:55', '本地数据库测试连接');
INSERT INTO `data_source` (`datasource_id`, `datasource_name`, `datasource_type`, `datasource_host`, `datasource_port`, `datasource_user`, `datasource_pwd`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '测试加密', 'mysql', '127.0.0.1', '3306', 'root', 'gAAAAABm74cNOrk4vy5R8DbcqGQvdifLxDr9v7Y_eEWrnTeiZknIf3AycrXXUMoC3XqY-h4GWq5RmqZEJH9KGAkUijdewLUFUQ==', 'admin', '2024-09-22 01:04:36', 'admin', '2024-09-22 10:55:09', '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for project_info
-- ----------------------------
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE `project_info` (
  `project_id` int NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `project_name` varchar(10) NOT NULL COMMENT '项目名称',
  `responsible_name` varchar(10) NOT NULL COMMENT '负责人',
  `test_user` varchar(10) NOT NULL COMMENT '测试人员',
  `dev_user` varchar(10) NOT NULL COMMENT '开发人员',
  `publish_app` varchar(32) NOT NULL COMMENT '发布应用',
  `simple_desc` varchar(100) DEFAULT NULL COMMENT '简要描述',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`project_id`),
  KEY `ix_project_info_project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目表';

-- ----------------------------
-- Records of project_info
-- ----------------------------
BEGIN;
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '123123', 'string', 'string', 'string', 'string', 'string', 'string', '2024-09-15 09:00:39', 'admin', '2024-09-15 17:00:44', 'string');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '反无', '冉勇', '冉勇_测试', '冉勇_开发', 'web', '这是一个描述', 'admin', '2024-09-04 10:50:42', 'admin', '2024-09-04 10:50:42', '这是一个备注');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '异动通', '冉勇', '冉勇_测试', '冉勇_开发', 'web', '这是一个描述', 'admin', '2024-09-04 10:50:42', 'admin', '2024-09-10 21:54:43', '这是一个备注');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '冉勇', 'string', 'asda', 'string', 'string', 'string', 'admin', '2024-09-15 22:08:28', 'admin', '2024-09-15 22:09:03', 'string');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, '！@#！#', '！@#！#', '！@#！#', '！@#！#', '！@#！#', '', 'admin', '2024-09-10 21:57:14', 'admin', '2024-09-10 21:57:14', '');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, '1111111111', '2222222222', '4444444444', '3333333333', '5555555555', '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999', 'admin', '2024-09-10 22:36:27', 'admin', '2024-09-10 22:36:27', '8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888');
INSERT INTO `project_info` (`project_id`, `project_name`, `responsible_name`, `test_user`, `dev_user`, `publish_app`, `simple_desc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, '测试项目', '冉勇', '冉勇', '冉勇', 'web', '这是一个描述', 'admin', '2024-09-16 10:06:07', 'admin', '2024-09-20 22:31:33', '这是一个备注放放风1');
COMMIT;

-- ----------------------------
-- Table structure for robot_conf
-- ----------------------------
DROP TABLE IF EXISTS `robot_conf`;
CREATE TABLE `robot_conf` (
  `robot_id` int NOT NULL AUTO_INCREMENT COMMENT '机器人ID',
  `robot_name` varchar(10) NOT NULL COMMENT '机器人名称',
  `robot_webhook` varchar(255) NOT NULL COMMENT '机器人WebHook',
  `robot_type` varchar(10) NOT NULL COMMENT '机器人类型',
  `robot_template` varchar(255) NOT NULL COMMENT '机器人通知模板',
  `robot_status` varchar(1) NOT NULL COMMENT '机器人状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`robot_id`),
  KEY `ix_robot_conf_robot_name` (`robot_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='机器人配置表';

-- ----------------------------
-- Records of robot_conf
-- ----------------------------
BEGIN;
INSERT INTO `robot_conf` (`robot_id`, `robot_name`, `robot_webhook`, `robot_type`, `robot_template`, `robot_status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '企业微信机器人1', 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=55e6d5bc-61fc-4d26-9615-01ab51c82801', 'Wx_bot', '**${name}**\n项目：${project_name}\n时间：${start_time} ～ ${end_date}\n共测试：${run_count}次\n通过数：${run_success_count}\n异常数：${run_err_count}\n失败数：${run_fail_count}\n测试通过率：${rate}%\n详细统计：[点击查看](${url})', '0', 'admin', '2024-09-28 17:35:47', 'admin', '2024-09-28 17:46:11', '这是一个备注');
INSERT INTO `robot_conf` (`robot_id`, `robot_name`, `robot_webhook`, `robot_type`, `robot_template`, `robot_status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '企业微信机器人2', 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=55e6d5bc-61fc-4d26-9615-01ab51c82801', 'Wx_bot', '**${name}**\n项目：${project_name}\n时间：${start_time} ～ ${end_date}\n共测试：${run_count}次\n通过数：${run_success_count}\n异常数：${run_err_count}\n失败数：${run_fail_count}\n测试通过率：${rate}%\n详细统计：[点击查看](${url})', '1', 'admin', '2024-09-16 16:54:40', 'admin', '2024-09-28 17:36:19', '这是一个备注');
INSERT INTO `robot_conf` (`robot_id`, `robot_name`, `robot_webhook`, `robot_type`, `robot_template`, `robot_status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '企业微信机器人62', 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=55e6d5bc-61fc-4d26-9615-01ab51c82801', 'Wx_bot', '**${name}**\n项目：${project_name}\n时间：${start_time} ～ ${end_date}\n共测试：${run_count}次\n通过数：${run_success_count}\n异常数：${run_err_count}\n失败数：${run_fail_count}\n测试通过率：${rate}%\n详细统计：[点击查看](${url})', '0', 'admin', '2024-09-29 17:16:45', 'admin', '2024-09-29 17:16:45', '这是一个备注');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-08-13 18:18:19', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', 'Sakura_k', 0, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-08-13 18:18:19', 'admin', '2024-08-15 11:31:23');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳分公司', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-08-13 18:18:19', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-08-13 18:18:19', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '0', 'admin', '2024-08-13 18:18:19', 'admin', '2024-09-20 22:42:40');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '年糕', '15888888888', 'niangao@qq.com', '0', '2', 'admin', '2024-08-13 18:18:19', NULL, NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (200, 101, '0,100,101', 'demo', 0, '1', '13206269804', '1111@qq.com', '1', '2', 'admin', '2024-08-15 11:31:41', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'default', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '数据库', 'sqlalchemy', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '数据库分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 3, 'redis', 'redis', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, 'reids分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 1, '默认', 'default', 'sys_job_executor', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '线程池');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 2, '进程池', 'processpool', 'sys_job_executor', '', '', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '进程池');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (30, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (31, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (32, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '任务执行器', 'sys_job_executor', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '任务执行器列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '系统是否', 'sys_yes_no', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知类型', 'sys_notice_type', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '通知状态', 'sys_notice_status', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '操作类型', 'sys_oper_type', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, '系统状态', 'sys_common_status', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'default' COMMENT '任务组名',
  `job_executor` varchar(64) DEFAULT 'default' COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'default', 'default', 'module_task.scheduler_test.job', NULL, NULL, '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-08-06 10:15:16', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'default', 'default', 'module_task.scheduler_test.job', 'test', NULL, '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-08-06 10:15:16', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'default', 'default', 'module_task.scheduler_test.job', 'new', '{\"test\": 111}', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-08-06 10:15:16', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log.log', '', '', '0 0 0 * * ?', '1', '1', '0', 'admin', '2024-08-06 10:50:16', 'admin', '2024-08-23 00:24:19', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_executor` varchar(64) NOT NULL COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `job_trigger` varchar(255) DEFAULT '' COMMENT '任务触发器',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (53, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-24 00:00:00', '0', '', '2024-08-24 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (54, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-24 00:00:00', '0', '', '2024-08-24 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (55, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-25 07:26:07', '0', '', '2024-08-25 07:26:08');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (56, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-25 07:26:07', '0', '', '2024-08-25 07:26:08');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (57, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-26 00:00:00', '0', '', '2024-08-26 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (58, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-26 00:00:00', '0', '', '2024-08-26 00:00:00');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (59, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'date[2024-08-27 18:25:51 CST]', '事件类型: JobEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-27 18:25:50', '0', '', '2024-08-27 18:25:51');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (60, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-28 01:29:20', '0', '', '2024-08-28 01:29:20');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (61, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-28 01:29:20', '0', '', '2024-08-28 01:29:20');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (62, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'date[2024-08-29 00:46:01 CST]', '事件类型: JobEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-08-29 00:46:00', '0', '', '2024-08-29 00:46:01');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (63, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-04 04:25:44', '0', '', '2024-09-04 04:25:44');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (64, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-04 04:25:44', '0', '', '2024-09-04 04:25:44');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (65, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-05 04:28:53', '0', '', '2024-09-05 04:28:54');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (66, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-05 04:28:53', '0', '', '2024-09-05 04:28:54');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (67, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-06 05:16:23', '0', '', '2024-09-06 05:16:23');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (68, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-06 05:16:23', '0', '', '2024-09-06 05:16:23');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (69, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-12 09:00:28', '0', '', '2024-09-12 09:00:28');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (70, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-12 09:00:28', '0', '', '2024-09-12 09:00:28');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (71, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-16 01:11:22', '0', '', '2024-09-16 01:11:22');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (72, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-16 01:11:22', '0', '', '2024-09-16 01:11:22');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (73, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-17 01:17:02', '0', '', '2024-09-17 01:17:02');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (74, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-17 01:17:02', '0', '', '2024-09-17 01:17:02');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (75, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-18 06:03:58', '0', '', '2024-09-18 06:03:58');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (76, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-18 06:03:58', '0', '', '2024-09-18 06:03:58');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (77, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-20 01:33:09', '0', '', '2024-09-20 01:33:10');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (78, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-20 01:33:09', '0', '', '2024-09-20 01:33:10');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (79, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-23 05:08:45', '0', '', '2024-09-23 05:08:46');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (80, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-23 05:08:45', '0', '', '2024-09-23 05:08:46');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (81, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-24 11:30:40', '0', '', '2024-09-24 11:30:40');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (82, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-24 11:30:40', '0', '', '2024-09-24 11:30:40');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (83, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-25 08:37:07', '0', '', '2024-09-25 08:37:08');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (84, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-09-25 08:37:07', '0', '', '2024-09-25 08:37:08');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (85, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-10-01 02:08:46', '0', '', '2024-10-01 02:08:46');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (86, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-10-01 02:08:46', '0', '', '2024-10-01 02:08:46');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (87, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-10-01 02:08:46', '0', '', '2024-10-01 02:08:47');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (88, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobExecutionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-10-03 08:04:47', '0', '', '2024-10-03 08:04:48');
INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `job_executor`, `invoke_target`, `job_args`, `job_kwargs`, `job_trigger`, `job_message`, `status`, `exception_info`, `create_time`) VALUES (89, '打包、删除日志', 'default', 'default', 'module_task.scheduler_log:log', '', '{}', 'cron[month=\'*\', day=\'*\', hour=\'0\', minute=\'0\', second=\'0\']', '事件类型: JobSubmissionEvent, 任务ID: 4, 任务名称: 打包、删除日志, 执行于2024-10-03 08:04:47', '0', '', '2024-10-03 08:04:48');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2090 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1907, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-21 12:08:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1908, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-21 12:09:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1909, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-22 16:54:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1910, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-22 16:56:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1911, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-23 23:58:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1912, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-25 20:27:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1913, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-25 21:23:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1914, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-27 11:47:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1915, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-27 11:48:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1916, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-27 12:21:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1917, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-27 12:40:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1918, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '1', '验证码错误', '2024-08-27 18:25:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1919, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-27 18:25:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1920, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-29 00:44:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1921, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-08-29 10:27:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1922, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-07 17:17:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1923, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-08 10:53:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1924, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '1', '验证码错误', '2024-09-08 11:12:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1925, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-08 11:12:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1926, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-09 22:49:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1927, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-10 10:16:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1928, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-11 11:05:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1929, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-15 12:28:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1930, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-15 22:03:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1931, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-15 22:05:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1932, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-16 10:05:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1933, '', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-09-16 10:14:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1934, '', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-09-16 10:16:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1935, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-16 10:18:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1936, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-16 10:19:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1937, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-16 19:11:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1938, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-18 15:25:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1939, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-19 16:07:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1940, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-19 17:31:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1941, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-19 17:33:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1942, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-20 15:56:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1943, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-20 22:31:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1944, 'demo1', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-20 22:40:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1945, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '1', '验证码已失效', '2024-09-21 22:44:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1946, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-21 22:44:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1947, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-22 17:11:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1948, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-22 17:12:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1949, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-22 17:14:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1950, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-23 22:18:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1951, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-24 17:01:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1952, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-25 09:54:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1953, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-26 00:49:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1954, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '1', '验证码已失效', '2024-09-26 01:21:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1955, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-26 01:21:44');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1956, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-26 01:23:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1957, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-26 20:52:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1958, 'admin', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-09-27 17:31:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1959, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-27 17:32:35');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1960, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-28 00:47:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1961, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-09-28 17:10:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1962, 'admin', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-09-29 16:41:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1963, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-29 16:42:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1964, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-09-29 18:31:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1965, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-09-29 18:31:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1966, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-29 18:31:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1967, '', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-09-29 18:32:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1968, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-09-29 18:32:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1969, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-09-29 18:33:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1970, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-09-29 18:56:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1971, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-09-29 18:57:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1972, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-09-29 19:00:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1973, 'admin', '', '内网IP', 'Chrome 109', 'Mac OS X 10', '0', '登录成功', '2024-10-02 00:34:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1974, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 11:46:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1975, '', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-10-03 11:50:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1976, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-03 11:50:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1977, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:01:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1978, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:03:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1979, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:03:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1980, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:03:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1981, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1982, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1983, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1984, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1985, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1986, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:04:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1987, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:05:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1988, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:05:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1989, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:08:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1990, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:09:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1991, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:10:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1992, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:10:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1993, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:11:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1994, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:11:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1995, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:11:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1996, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:12:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1997, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:14:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1998, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:14:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1999, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:15:00');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2000, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:16:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2001, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:16:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2002, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:17:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2003, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:17:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2004, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:17:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2005, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:18:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2006, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:18:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2007, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:18:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2008, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:19:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2009, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:19:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2010, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:20:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2011, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:20:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2012, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:21:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2013, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:21:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2014, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:22:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2015, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:24:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2016, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:27:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2017, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:36:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2018, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:49:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2019, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-03 12:49:54');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2020, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:50:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2021, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:50:28');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2022, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:51:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2023, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-03 12:51:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2024, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:52:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2025, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:52:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2026, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:53:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2027, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:53:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2028, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:54:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2029, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 12:55:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2030, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 12:58:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2031, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:05:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2032, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:11:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2033, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:11:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2034, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:12:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2035, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:13:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2036, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:16:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2037, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-03 13:16:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2038, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:17:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2039, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:18:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2040, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:36:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2041, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:37:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2042, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:38:38');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2043, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:39:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2044, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:39:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2045, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:40:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2046, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:40:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2047, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:40:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2048, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:41:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2049, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:41:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2050, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:41:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2051, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:42:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2052, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:43:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2053, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:43:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2054, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:44:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2055, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:44:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2056, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:45:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2057, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-03 13:45:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2058, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:45:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2059, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:46:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2060, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:47:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2061, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-03 13:47:15');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2062, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-04 00:05:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2063, '', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-10-08 20:44:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2064, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-08 20:44:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2065, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:07:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2066, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:08:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2067, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:08:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2068, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:08:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2069, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:09:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2070, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:09:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2071, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:10:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2072, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-08 21:11:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2073, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:11:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2074, '', '', '内网IP', 'Python aiohttp 3', 'Other', '1', '验证码已失效', '2024-10-08 21:12:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2075, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:13:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2076, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:17:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2077, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:18:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2078, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:39:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2079, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:41:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2080, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:41:37');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2081, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:45:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2082, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-08 21:51:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2083, 'admin', '', '内网IP', 'Other', 'Other', '1', '验证码已失效', '2024-10-11 18:00:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2084, 'admin', '', '内网IP', 'Other', 'Other', '0', '登录成功', '2024-10-11 18:02:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2085, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-11 18:07:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2086, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-11 18:22:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2087, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-11 18:23:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2088, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-11 18:23:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (2089, 'admin', '', '内网IP', 'Python aiohttp 3', 'Other', '0', '登录成功', '2024-10-11 18:23:53');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-08-13 18:18:19', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-08-13 18:18:19', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-08-13 18:18:19', 'admin', '2024-09-16 10:33:46', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-08-13 18:18:19', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-08-13 18:18:19', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-08-13 18:18:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-08-13 18:18:19', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-08-13 18:18:19', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-08-13 18:18:19', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-08-13 18:18:19', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-08-13 18:18:19', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-08-13 18:18:19', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-08-13 18:18:19', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-08-13 18:18:19', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-08-13 18:18:19', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-08-13 18:18:19', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-08-13 18:18:19', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-08-13 18:18:19', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-08-13 18:18:19', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-08-13 18:18:19', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-08-13 18:18:19', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-08-13 18:18:19', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-08-13 18:18:19', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2001, '项目/模块', 0, 0, 'project', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dict', 'admin', '2024-09-10 15:30:34', 'admin', '2024-09-10 15:31:53', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2002, '项目列表', 2001, 1, 'project', 'project/index', NULL, '', 1, 0, 'C', '0', '0', 'auto:project:list', 'date', 'admin', '2024-09-10 15:32:32', 'admin', '2024-09-10 15:40:20', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2003, '项目新增', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'auto:project:add', '#', 'admin', '2024-09-10 15:41:06', 'admin', '2024-09-10 15:42:40', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2004, '项目编辑', 2002, 2, 'auto:project:edit', NULL, NULL, '', 1, 0, 'F', '0', '0', 'auto:project:edit', '#', 'admin', '2024-09-10 15:41:25', 'admin', '2024-09-10 15:43:35', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2005, '项目删除', 2002, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'auto:project:remove', '#', 'admin', '2024-09-10 15:41:53', 'admin', '2024-09-10 15:42:52', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2006, '项目查询', 2002, 0, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'auto:project:query', '#', 'admin', '2024-09-10 15:42:28', 'admin', '2024-09-10 15:42:28', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2007, '通用配置', 0, 3, 'commonConfig', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'slider', 'admin', '2024-09-16 10:31:57', 'admin', '2024-09-16 10:33:37', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2008, ' 机器人管理', 2007, 0, 'robot', 'robot/index', NULL, '', 1, 0, 'C', '0', '0', 'notify:robots:list', 'message', 'admin', '2024-09-16 10:32:51', 'admin', '2024-09-18 15:26:08', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2009, '机器人查询', 2008, 0, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'notify:robots:query', '#', 'admin', '2024-09-16 10:36:51', 'admin', '2024-09-16 10:38:55', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2010, ' 机器人新增', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'notify:robots:add', '#', 'admin', '2024-09-16 10:37:29', 'admin', '2024-09-16 10:37:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2011, ' 机器人编辑', 2008, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'notify:robots:edit', '#', 'admin', '2024-09-16 10:37:54', 'admin', '2024-09-16 10:37:54', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2012, '机器人删除', 2008, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'notify:robots:remove', '#', 'admin', '2024-09-16 10:38:15', 'admin', '2024-09-16 10:38:15', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2013, '数据源管理', 2007, 1, 'dataSource', 'datasource/index', NULL, '', 1, 0, 'C', '0', '0', 'commonConfig:dataSource:list', 'date', 'admin', '2024-09-18 15:33:10', 'admin', '2024-09-18 15:34:51', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2014, ' 数据源查询', 2013, 0, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'commonConfig:dataSource:query', '#', 'admin', '2024-09-18 18:19:06', 'admin', '2024-09-18 18:19:06', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2016, '数据源新增', 2013, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', '	 commonConfig:dataSource:add', '#', 'admin', '2024-09-20 22:33:00', 'admin', '2024-09-20 22:33:00', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2017, '数据源编辑', 2013, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', '	 commonConfig:dataSource:edit', '#', 'admin', '2024-09-20 22:33:19', 'admin', '2024-09-20 22:33:19', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2018, '数据源删除', 2013, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', '	 commonConfig:dataSource:remove', '#', 'admin', '2024-09-20 22:33:41', 'admin', '2024-09-20 22:33:41', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2021, ' 数据查询', 3, 4, 'querydb', 'tool/querydb/index', NULL, '', 1, 0, 'C', '0', '0', 'commonConfig:dataSource:databaseTable', '404', 'admin', '2024-09-22 17:17:34', 'admin', '2024-09-22 17:19:21', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2022, '执行SQL', 2021, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'commonConfig:dataSource:execute', '#', 'admin', '2024-09-22 17:19:53', 'admin', '2024-09-22 17:19:53', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 vfadmin新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 vfadmin系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=934 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-08-13 18:18:19', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-13 18:18:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 3, '1', 1, 1, '0', '0', 'admin', '2024-08-13 18:18:19', 'admin', '2024-09-20 22:40:40', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '开发者', ' dev', 2, '1', 1, 1, '0', '0', 'admin', '2024-08-14 17:32:10', 'admin', '2024-09-20 22:41:57', '这是一个开发者权限的角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 117);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 1060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2018);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '超级管理员', '00', 'ranyong@163.com', '15888888888', '0', '/profile/avatar/2024/08/25/avatar_20240825212523A344.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '172.0.29.1', '2024-10-11 18:23:53', 'admin', '2024-08-13 18:18:19', 'admin', '2024-09-16 19:10:20', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'niangao', '年糕', '00', 'niangao@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-08-13 18:18:19', 'admin', '2024-08-13 18:18:19', 'admin', '2024-09-20 22:45:06', '测试员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, 100, 'ranyong', 'ranyong', '00', '', '', '0', '', '$2b$12$iPYmQp3jjdIrZBqyaf6loOITsuvUQost39wHqNzzBCTOge7cmNblW', '0', '0', '', NULL, 'admin', '2024-08-13 20:47:13', 'admin', '2024-08-15 11:04:07', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 103, 'demo1', 'demo1', '00', '', '', '0', '', '$2b$12$bFu.K.grA9O/zrZ9aQTGzeE4PjKwRbXJMm9rgJpN8ZzT5Ri2LXsve', '0', '0', '', '2024-09-20 22:40:21', '', '2024-08-16 10:28:18', 'admin', '2024-09-20 22:44:56', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, NULL, 'Jason', 'Jason', '00', '', '', '0', '', '$2b$12$bDYfcn1CtgaTCJFtZHp0Z.E2sSmwJlCjmmEe5EWy4hwbC3r3OHk7e', '0', '2', '', '2024-08-19 11:08:18', '', '2024-08-16 11:26:38', 'admin', '2024-09-20 22:33:54', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, NULL, 'Robert', 'Robert', '00', '', '', '0', '', '$2b$12$wUoLMRIV5NGRiaTEnNEFv.n4xa8TySTvOm3ZTFLh2pjC6wdugN9ii', '0', '2', '', NULL, '', '2024-08-16 11:26:38', 'admin', '2024-08-19 10:09:30', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, NULL, 'ranyong123', 'ranyong123', '00', '', '', '0', '', '$2b$12$NfuBd5.zv64M1XGW0KB.Ueql1AZJNBLKMtk5cOHtP0g5VkmrKXFRC', '0', '2', '', NULL, '', '2024-09-25 11:14:52', 'admin', '2024-10-02 00:35:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (100, 100);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (101, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
