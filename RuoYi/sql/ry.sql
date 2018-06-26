/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-06-26 09:54:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_100', 'DEFAULT', '0/10 * * * *  ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_101', 'DEFAULT', '0 0/2 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_100', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E707400007070700000000174000F302F3130202A202A202A202A20203F740012E88194E59088E4BFA1E681AFE4BBBBE58AA17372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740001337400026C6874000272797800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_101', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E70740006E6B58BE8AF957070700000000174000D3020302F32202A202A202A203F740006E6B58BE8AF957372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000065740004746573747400087279506172616D73740006E59388E593887800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707070700000000174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D7374000272797800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'yff-PC1529651371823', '1529651541947', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_100', 'DEFAULT', 'TASK_100', 'DEFAULT', null, '1527672420000', '-1', '5', 'PAUSED', 'CRON', '1527672415000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000163B05F231878707070700000000174000F302F3130202A202A202A202A20203F740012E88194E59088E4BFA1E681AFE4BBBBE58AA17372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740001337400026C6874000272797800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_101', 'DEFAULT', 'TASK_101', 'DEFAULT', null, '1527746880000', '-1', '5', 'PAUSED', 'CRON', '1527746873000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000163B4CF46A878707070700000000174000D3020302F32202A202A202A203F740006E6B58BE8AF957372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006574000672795461736B7400087279506172616D7374000274797800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1527671360000', '-1', '5', 'PAUSED', 'CRON', '1527671341000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707070700000000174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D7374000272797800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-06-04 16:45:31', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '系统名称', 'sys.name', '联合管理系统', 'Y', '', '2018-06-05 11:04:46', '', '2018-06-05 16:05:44', '自定义系统名称！');
INSERT INTO `sys_config` VALUES ('4', '登录框标语', 'sys.login.slogan', '你若不离不弃，我必生死相依', 'Y', '', '2018-06-06 10:54:06', '', null, '');
INSERT INTO `sys_config` VALUES ('5', '版权', 'sys.login.copyright', '© 2018 All Rights Reserved.', 'Y', '', '2018-06-06 11:07:25', '', '2018-06-06 12:59:58', '登录页面底部版权');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `email` varchar(20) DEFAULT '' COMMENT '邮箱',
  `status` int(1) DEFAULT '0' COMMENT '部门状态:0正常,1停用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '联合信息', '0', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '研发部门', '1', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '市场部门', '2', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '100', '测试部门', '3', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '100', '财务部门', '4', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '100', '运维部门', '5', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '研发一部', '1', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '研发二部', '2', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '市场一部', '1', '许玮', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '市场二部', '2', '许玮', '15888888888', 'ry@qq.com', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', 'radio radio-warning radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_menu_visible', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_menu_visible', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_dept_status', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_dept_status', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_dict_status', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '停用', '1', 'sys_dict_status', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '正常', '0', 'sys_post_status', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '停用', '1', 'sys_post_status', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '正常', '0', 'sys_job_status', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '暂停', '1', 'sys_job_status', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '是', 'Y', 'sys_yes_no', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '否', 'N', 'sys_yes_no', 'radio radio-danger radio-inline', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES ('17', '1', '本窗口', '0', 'sys_menu_openmode', 'radio radio-info radio-inline', 'Y', '0', 'admin', '2018-06-08 14:53:41', 'admin', '2018-06-15 15:23:59', '');
INSERT INTO `sys_dict_data` VALUES ('18', '2', '新窗口', '1', 'sys_menu_openmode', 'radio radio-warning radio-inline', 'N', '0', 'admin', '2018-06-08 14:54:46', 'admin', '2018-06-15 15:24:17', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_menu_visible', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '部门状态', 'sys_dept_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门状态列表');
INSERT INTO `sys_dict_type` VALUES ('4', '岗位状态', 'sys_post_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '字典状态', 'sys_dict_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典状态列表');
INSERT INTO `sys_dict_type` VALUES ('6', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('7', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('8', '打开方式', 'sys_menu_openmode', '0', 'admin', '2018-06-08 14:51:03', 'admin', '2018-06-08 14:55:27', '菜单页面打开方式列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('100', '3', '联合信息任务', 'lh', 'ry', '0/10 * * * *  ?', '1', 'admin', '2018-05-30 17:26:55', '', null, '');
INSERT INTO `sys_job` VALUES ('101', 'ryTask', '测试', 'ryParams', 'ty', '0 0/2 * * * ?', '1', 'admin', '2018-05-31 14:07:53', 'admin', '2018-05-31 14:14:18', 'test');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` int(1) DEFAULT '0' COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('2', 'test', '测试', 'ryParams', '哈哈', 'test 总共耗时：1毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'test\' available', '2018-05-31 14:10:00');
INSERT INTO `sys_job_log` VALUES ('3', 'ryTask', '测试', 'ryParams', 'ty', 'ryTask 总共耗时：2毫秒', '0', null, '2018-05-31 14:11:15');
INSERT INTO `sys_job_log` VALUES ('4', 'ryTask', '测试', 'ryParams', 'ty', 'ryTask 总共耗时：1毫秒', '0', null, '2018-05-31 14:12:00');
INSERT INTO `sys_job_log` VALUES ('5', 'ryTask', '测试', 'ryParams', 'ty', 'ryTask 总共耗时：2毫秒', '0', null, '2018-05-31 14:14:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` int(1) DEFAULT '0' COMMENT '登录状态 0成功 1失败',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-30 17:24:30');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-30 18:06:53');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-30 18:17:12');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 09:19:13');
INSERT INTO `sys_logininfor` VALUES ('104', 'adminn', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '用户不存在/密码错误', '2018-05-31 09:41:05');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 09:41:18');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-05-31 09:43:17');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 09:43:20');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-05-31 09:44:18');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 09:44:20');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-05-31 10:08:39');
INSERT INTO `sys_logininfor` VALUES ('111', 'common', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '用户不存在/密码错误', '2018-05-31 10:08:45');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 10:08:53');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 11:27:11');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 14:06:06');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 15:22:18');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 17:11:43');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-05-31 17:59:45');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 09:32:06');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 11:46:21');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 13:50:54');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 14:36:42');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '192.168.1.26', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 15:19:11');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-01 18:11:40');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '用户不存在/密码错误', '2018-06-04 10:48:51');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次，123456', '2018-06-04 10:48:57');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误2次，123456', '2018-06-04 10:49:03');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误3次，1223456', '2018-06-04 10:49:28');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 10:52:50');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 13:01:00');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:22:38');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-04 16:25:39');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:25:45');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-04 16:26:29');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:26:37');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-04 16:29:22');
INSERT INTO `sys_logininfor` VALUES ('136', 'ry', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:29:32');
INSERT INTO `sys_logininfor` VALUES ('137', 'ry', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-04 16:30:09');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:30:27');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-04 16:45:47');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-04 16:45:54');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次，admin123', '2018-06-05 09:56:21');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 09:56:28');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次，admin123', '2018-06-05 11:38:27');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 11:38:33');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-05 11:40:47');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 11:41:01');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 11:51:35');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 13:35:59');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2018-06-05 14:20:27');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 14:20:33');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 14:37:00');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 14:56:50');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 16:03:39');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 16:08:19');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 17:22:23');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 17:28:10');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 17:42:57');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 17:54:47');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-05 18:04:38');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 10:00:00');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 10:51:19');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 11:02:27');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 11:04:07');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 11:19:28');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 12:27:50');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:04:28');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:07:04');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:08:01');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:08:41');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:12:19');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:36:15');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:38:50');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 13:56:58');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 14:23:39');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 14:25:53');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:20:31');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:31:31');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:32:33');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:37:58');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:39:58');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:41:55');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:55:48');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 15:58:44');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 16:23:41');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 16:46:44');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 17:08:15');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-06 17:09:57');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 09:43:12');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:12:36');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:28:14');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:30:04');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:47:32');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:52:01');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 10:52:58');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 11:11:35');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 11:18:36');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 11:33:46');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 11:35:55');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 12:58:11');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 13:34:11');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 13:35:14');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 13:40:28');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 13:48:57');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:02:34');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:21:04');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:27:12');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:28:28');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:33:07');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:36:33');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:40:59');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-07 14:46:03');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 09:34:03');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 10:06:14');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 10:08:32');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 10:11:14');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 10:16:06');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 14:11:57');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 15:19:20');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 15:25:24');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 16:30:12');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 16:32:43');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 16:36:37');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 17:01:41');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-08 17:16:37');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 09:41:26');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 10:01:18');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 10:20:02');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 10:53:57');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 10:58:25');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 11:05:22');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 12:42:22');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 13:05:42');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 13:33:01');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 13:38:00');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 13:39:56');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 13:42:19');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 15:28:48');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 15:29:36');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 16:19:08');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-11 17:25:13');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-12 14:38:36');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-13 17:51:36');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-15 11:45:23');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-15 15:22:57');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', null, 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-15 15:56:31');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-15 16:34:34');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-15 16:52:05');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-19 09:39:06');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2018-06-22 15:10:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT NULL COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '类型:M目录,C菜单,F按钮',
  `visible` int(1) DEFAULT '0' COMMENT '菜单状态:0显示,1隐藏',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `open_mode` tinyint(1) DEFAULT '0' COMMENT '菜单页面打开方式:本窗口0,新窗口1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录', '0');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-06 10:01:10', '系统工具目录', '0');
INSERT INTO `sys_menu` VALUES ('4', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-11 13:42:44', '用户管理菜单', '1');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES ('6', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单', '0');
INSERT INTO `sys_menu` VALUES ('7', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单', '0');
INSERT INTO `sys_menu` VALUES ('8', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单', '0');
INSERT INTO `sys_menu` VALUES ('9', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单', '0');
INSERT INTO `sys_menu` VALUES ('10', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单', '0');
INSERT INTO `sys_menu` VALUES ('11', '操作日志', '2', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单', '0');
INSERT INTO `sys_menu` VALUES ('12', '登录日志', '2', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单', '0');
INSERT INTO `sys_menu` VALUES ('13', '在线用户', '2', '3', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单', '0');
INSERT INTO `sys_menu` VALUES ('14', '定时任务', '2', '4', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单', '0');
INSERT INTO `sys_menu` VALUES ('15', '数据监控', '2', '5', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单', '0');
INSERT INTO `sys_menu` VALUES ('16', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单', '0');
INSERT INTO `sys_menu` VALUES ('17', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单', '0');
INSERT INTO `sys_menu` VALUES ('18', '用户查询', '4', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '用户新增', '4', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '用户修改', '4', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '用户删除', '4', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '用户保存', '4', '5', '#', 'F', '0', 'system:user:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '批量删除', '4', '6', '#', 'F', '0', 'system:user:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '重置密码', '4', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('25', '角色查询', '5', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('26', '角色新增', '5', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '角色修改', '5', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '角色删除', '5', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '角色保存', '5', '5', '#', 'F', '0', 'system:role:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '批量删除', '5', '6', '#', 'F', '0', 'system:role:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('31', '菜单查询', '6', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '菜单新增', '6', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('33', '菜单修改', '6', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('34', '菜单删除', '6', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('35', '菜单保存', '6', '5', '#', 'F', '0', 'system:menu:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('36', '部门查询', '7', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('37', '部门新增', '7', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('38', '部门修改', '7', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('39', '部门删除', '7', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '部门保存', '7', '5', '#', 'F', '0', 'system:dept:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('41', '岗位查询', '8', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '岗位新增', '8', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('43', '岗位修改', '8', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('44', '岗位删除', '8', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('45', '岗位保存', '8', '5', '#', 'F', '0', 'system:post:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('46', '批量删除', '8', '6', '#', 'F', '0', 'system:post:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('47', '字典查询', '9', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('48', '字典新增', '9', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '字典修改', '9', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '字典删除', '9', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('51', '字典保存', '9', '5', '#', 'F', '0', 'system:dict:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('52', '批量删除', '9', '6', '#', 'F', '0', 'system:dict:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('53', '参数查询', '10', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '参数新增', '10', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('55', '参数修改', '10', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '参数删除', '10', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '参数保存', '10', '5', '#', 'F', '0', 'system:config:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '批量删除', '10', '6', '#', 'F', '0', 'system:config:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '操作查询', '11', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '批量删除', '11', '2', '#', 'F', '0', 'monitor:operlog:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('61', '详细信息', '11', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('62', '登录查询', '12', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '批量删除', '12', '2', '#', 'F', '0', 'monitor:logininfor:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('64', '在线查询', '13', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('65', '批量强退', '13', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('66', '单条强退', '13', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '任务查询', '14', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '任务新增', '14', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '任务修改', '14', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '任务删除', '14', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '任务保存', '14', '5', '#', 'F', '0', 'monitor:job:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '状态修改', '14', '6', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('73', '批量删除', '14', '7', '#', 'F', '0', 'monitor:job:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('74', '生成查询', '16', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('75', '生成代码', '16', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '', '0');
INSERT INTO `sys_menu` VALUES ('1000', '百度一下', '3', '3', 'http://www.baidu.com', 'C', '0', 'tool:build:view', '', 'admin', '2018-05-30 17:56:02', 'admin', '2018-06-11 13:52:03', '', '0');
INSERT INTO `sys_menu` VALUES ('1001', '主页', '0', '0', '#', 'M', '0', '', 'fa fa-home', 'admin', '2018-06-05 14:03:02', 'admin', '2018-06-15 11:47:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1004', '了解我们', '1001', '1', '/system/main', 'C', '0', 'system:main:view', '', 'admin', '2018-06-05 15:20:26', 'admin', '2018-06-15 16:35:40', '', '0');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `action` varchar(100) DEFAULT '' COMMENT '功能请求',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `channel` varchar(20) DEFAULT '' COMMENT '来源渠道',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态 0正常 1异常',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '监控管理', '定时任务-删除调度', 'com.ruoyi.project.monitor.job.controller.JobController.remove()', 'web', 'admin', '研发一部', '/monitor/job/remove/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:25:19');
INSERT INTO `sys_oper_log` VALUES ('101', '监控管理', '定时任务-新增调度', 'com.ruoyi.project.monitor.job.controller.JobController.add()', 'web', 'admin', '研发一部', '/monitor/job/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:25:25');
INSERT INTO `sys_oper_log` VALUES ('102', '监控管理', '定时任务-保存调度', 'com.ruoyi.project.monitor.job.controller.JobController.save()', 'web', 'admin', '研发一部', '/monitor/job/save', '127.0.0.1', 'XXXX内网IP', '{\"jobName\":[\"3\"],\"jobGroup\":[\"联合信息任务\"],\"methodName\":[\"lh\"],\"params\":[\"ry\"],\"cronExpression\":[\"0/10 * * * *  ?\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-05-30 17:26:56');
INSERT INTO `sys_oper_log` VALUES ('103', '监控管理', '定时任务-修改调度', 'com.ruoyi.project.monitor.job.controller.JobController.edit()', 'web', 'admin', '研发一部', '/monitor/job/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:34:09');
INSERT INTO `sys_oper_log` VALUES ('104', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:35:09');
INSERT INTO `sys_oper_log` VALUES ('105', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/32', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:39:14');
INSERT INTO `sys_oper_log` VALUES ('106', '监控管理', '定时任务-修改调度', 'com.ruoyi.project.monitor.job.controller.JobController.edit()', 'web', 'admin', '研发一部', '/monitor/job/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:41:42');
INSERT INTO `sys_oper_log` VALUES ('107', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/6', '127.0.0.1', null, '{}', '0', null, '2018-05-30 17:53:51');
INSERT INTO `sys_oper_log` VALUES ('108', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"www.baidu.com\"],\"perms\":[\"1\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-05-30 17:56:02');
INSERT INTO `sys_oper_log` VALUES ('109', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 17:57:32');
INSERT INTO `sys_oper_log` VALUES ('110', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"www.baidu.com\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-05-30 17:58:09');
INSERT INTO `sys_oper_log` VALUES ('111', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', null, '{}', '0', null, '2018-05-30 18:02:53');
INSERT INTO `sys_oper_log` VALUES ('112', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"/tool/baidu\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-05-30 18:03:13');
INSERT INTO `sys_oper_log` VALUES ('113', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:16:06');
INSERT INTO `sys_oper_log` VALUES ('114', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:17:36');
INSERT INTO `sys_oper_log` VALUES ('115', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-05-30 18:18:07');
INSERT INTO `sys_oper_log` VALUES ('116', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:18:16');
INSERT INTO `sys_oper_log` VALUES ('117', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-05-30 18:18:22');
INSERT INTO `sys_oper_log` VALUES ('118', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:18:29');
INSERT INTO `sys_oper_log` VALUES ('119', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:18:46');
INSERT INTO `sys_oper_log` VALUES ('120', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:19:03');
INSERT INTO `sys_oper_log` VALUES ('121', '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '研发一部', '/system/role/save', '127.0.0.1', 'XXXX内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,53,54,55,56,57,58', '0', null, '2018-05-30 18:19:08');
INSERT INTO `sys_oper_log` VALUES ('122', '监控管理', '定时任务-新增调度', 'com.ruoyi.project.monitor.job.controller.JobController.add()', 'web', 'admin', '研发一部', '/monitor/job/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-30 18:20:16');
INSERT INTO `sys_oper_log` VALUES ('123', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/system/user/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:20:53');
INSERT INTO `sys_oper_log` VALUES ('124', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:42:39');
INSERT INTO `sys_oper_log` VALUES ('125', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-yellow\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-05-31 09:43:02');
INSERT INTO `sys_oper_log` VALUES ('126', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:43:48');
INSERT INTO `sys_oper_log` VALUES ('127', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-05-31 09:43:59');
INSERT INTO `sys_oper_log` VALUES ('128', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:47:45');
INSERT INTO `sys_oper_log` VALUES ('129', '系统管理', '字典管理-新增字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.add()', 'web', 'admin', '研发一部', '/system/dict/data/add/sys_user_sex', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:47:55');
INSERT INTO `sys_oper_log` VALUES ('130', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 09:48:15');
INSERT INTO `sys_oper_log` VALUES ('131', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 10:07:57');
INSERT INTO `sys_oper_log` VALUES ('132', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 10:08:07');
INSERT INTO `sys_oper_log` VALUES ('133', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/system/user/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 10:11:03');
INSERT INTO `sys_oper_log` VALUES ('134', '监控管理', '定时任务-新增调度', 'com.ruoyi.project.monitor.job.controller.JobController.add()', 'web', 'admin', '研发一部', '/monitor/job/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 11:27:17');
INSERT INTO `sys_oper_log` VALUES ('135', '监控管理', '定时任务-新增调度', 'com.ruoyi.project.monitor.job.controller.JobController.add()', 'web', 'admin', '研发一部', '/monitor/job/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 14:06:12');
INSERT INTO `sys_oper_log` VALUES ('136', '监控管理', '定时任务-保存调度', 'com.ruoyi.project.monitor.job.controller.JobController.save()', 'web', 'admin', '研发一部', '/monitor/job/save', '127.0.0.1', 'XXXX内网IP', '{\"jobName\":[\"test\"],\"jobGroup\":[\"测试\"],\"methodName\":[\"ryParams\"],\"params\":[\"哈哈\"],\"cronExpression\":[\"0 0/2 * * * ?\"],\"status\":[\"0\"],\"remark\":[\"测试\"]}', '0', null, '2018-05-31 14:07:53');
INSERT INTO `sys_oper_log` VALUES ('137', '监控管理', '定时任务-状态修改', 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 'web', 'admin', '研发一部', '/monitor/job/changeStatus/', '127.0.0.1', 'XXXX内网IP', '{\"jobId\":[\"101\"],\"status\":[\"0\"]}', '0', null, '2018-05-31 14:08:03');
INSERT INTO `sys_oper_log` VALUES ('138', '监控管理', '定时任务-状态修改', 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 'web', 'admin', '研发一部', '/monitor/job/changeStatus/', '127.0.0.1', 'XXXX内网IP', '{\"jobId\":[\"101\"],\"status\":[\"1\"]}', '0', null, '2018-05-31 14:10:45');
INSERT INTO `sys_oper_log` VALUES ('139', '监控管理', '定时任务-修改调度', 'com.ruoyi.project.monitor.job.controller.JobController.edit()', 'web', 'admin', '研发一部', '/monitor/job/edit/101', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 14:10:51');
INSERT INTO `sys_oper_log` VALUES ('140', '监控管理', '定时任务-保存调度', 'com.ruoyi.project.monitor.job.controller.JobController.save()', 'web', 'admin', '研发一部', '/monitor/job/save', '127.0.0.1', 'XXXX内网IP', '{\"jobId\":[\"101\"],\"jobName\":[\"ryTask\"],\"jobGroup\":[\"测试\"],\"methodName\":[\"ryParams\"],\"params\":[\"ty\"],\"cronExpression\":[\"0 0/2 * * * ?\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '0', null, '2018-05-31 14:11:14');
INSERT INTO `sys_oper_log` VALUES ('141', '监控管理', '定时任务-状态修改', 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 'web', 'admin', '研发一部', '/monitor/job/changeStatus/', '127.0.0.1', 'XXXX内网IP', '{\"jobId\":[\"101\"],\"status\":[\"1\"]}', '0', null, '2018-05-31 14:14:18');
INSERT INTO `sys_oper_log` VALUES ('142', '监控管理', '定时任务-状态修改', 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 'web', 'admin', '研发一部', '/monitor/job/changeStatus/', '127.0.0.1', null, '{\"jobId\":[\"101\"],\"status\":[\"1\"]}', '0', null, '2018-05-31 14:14:20');
INSERT INTO `sys_oper_log` VALUES ('143', '监控管理', '定时任务-新增调度', 'com.ruoyi.project.monitor.job.controller.JobController.add()', 'web', 'admin', '研发一部', '/monitor/job/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 14:40:05');
INSERT INTO `sys_oper_log` VALUES ('144', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 15:42:04');
INSERT INTO `sys_oper_log` VALUES ('145', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/6', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 15:42:49');
INSERT INTO `sys_oper_log` VALUES ('146', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/7', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-05-31 15:42:56');
INSERT INTO `sys_oper_log` VALUES ('147', '系统管理', '个人信息-修改用户', 'com.ruoyi.project.system.user.controller.ProfileController.edit()', 'web', 'admin', '研发一部', '/system/user/profile/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-01 11:46:36');
INSERT INTO `sys_oper_log` VALUES ('148', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-01 11:46:44');
INSERT INTO `sys_oper_log` VALUES ('149', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/ry/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:23:18');
INSERT INTO `sys_oper_log` VALUES ('150', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/ry/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-04 16:24:16');
INSERT INTO `sys_oper_log` VALUES ('151', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/ry/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-04 16:24:24');
INSERT INTO `sys_oper_log` VALUES ('152', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/ry/system/user/profile/resetPwd/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:24:39');
INSERT INTO `sys_oper_log` VALUES ('153', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/ry/system/user/profile/resetPwd', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"oldPassword\":[\"admin123\"],\"password\":[\"123456\"],\"confirm\":[\"123456\"]}', '0', null, '2018-06-04 16:24:57');
INSERT INTO `sys_oper_log` VALUES ('154', '系统管理', '个人信息-修改用户', 'com.ruoyi.project.system.user.controller.ProfileController.edit()', 'web', 'admin', '研发一部', '/ry/system/user/profile/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:25:10');
INSERT INTO `sys_oper_log` VALUES ('155', '系统管理', '个人信息-保存用户', 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'web', 'admin', '研发一部', '/ry/system/user/profile/update', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"],\"userName\":[\"那谁\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"]}', '0', null, '2018-06-04 16:25:29');
INSERT INTO `sys_oper_log` VALUES ('156', '系统管理', '字典管理-修改字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.edit()', 'web', 'admin', '研发一部', '/ry/system/dict/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:26:47');
INSERT INTO `sys_oper_log` VALUES ('157', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/ry/system/dict/detail/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:26:56');
INSERT INTO `sys_oper_log` VALUES ('158', '系统管理', '字典管理-新增字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.add()', 'web', 'admin', '研发一部', '/ry/system/dict/data/add/sys_user_sex', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:27:00');
INSERT INTO `sys_oper_log` VALUES ('159', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/ry/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictLabel\":[\"不男不女\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_user_sex\"],\"cssClass\":[\"\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-04 16:28:06');
INSERT INTO `sys_oper_log` VALUES ('160', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/ry/system/dict/detail/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:28:07');
INSERT INTO `sys_oper_log` VALUES ('161', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/ry/system/user/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:28:15');
INSERT INTO `sys_oper_log` VALUES ('162', '系统管理', '用户管理-保存用户', 'com.ruoyi.project.system.user.controller.UserController.save()', 'web', 'admin', '研发一部', '/ry/system/user/save', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"106\"],\"userName\":[\"那谁\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"3\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2018-06-04 16:28:22');
INSERT INTO `sys_oper_log` VALUES ('163', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/ry/system/user/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:28:31');
INSERT INTO `sys_oper_log` VALUES ('164', '系统管理', '用户管理-保存用户', 'com.ruoyi.project.system.user.controller.UserController.save()', 'web', 'admin', '研发一部', '/ry/system/user/save', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"108\"],\"userName\":[\"许\"],\"email\":[\"ry@qq.com\"],\"phonenumber\":[\"15666666666\"],\"sex\":[\"3\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2018-06-04 16:28:35');
INSERT INTO `sys_oper_log` VALUES ('165', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/ry/system/user/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:28:52');
INSERT INTO `sys_oper_log` VALUES ('166', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/ry/system/user/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:30:47');
INSERT INTO `sys_oper_log` VALUES ('167', '系统管理', '用户管理-保存用户', 'com.ruoyi.project.system.user.controller.UserController.save()', 'web', 'admin', '研发一部', '/ry/system/user/save', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"108\"],\"userName\":[\"许\"],\"email\":[\"ry@qq.com\"],\"phonenumber\":[\"15666666666\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2018-06-04 16:30:55');
INSERT INTO `sys_oper_log` VALUES ('168', '系统管理', '岗位管理-修改岗位', 'com.ruoyi.project.system.post.controller.PostController.edit()', 'web', 'admin', '研发一部', '/ry/system/post/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:31:16');
INSERT INTO `sys_oper_log` VALUES ('169', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/ry/system/menu/add/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:32:14');
INSERT INTO `sys_oper_log` VALUES ('170', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/ry/system/config/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-04 16:45:04');
INSERT INTO `sys_oper_log` VALUES ('171', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/ry/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-default\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-06-04 16:45:31');
INSERT INTO `sys_oper_log` VALUES ('172', '监控管理', '定时任务-批量删除日志', 'com.ruoyi.project.monitor.job.controller.JobLogController.batchRemove()', 'web', 'admin', '研发一部', '/ry/monitor/jobLog/batchRemove', '127.0.0.1', 'XXXX内网IP', '{\"ids[]\":[\"1\"]}', '0', null, '2018-06-04 17:41:45');
INSERT INTO `sys_oper_log` VALUES ('173', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 10:09:34');
INSERT INTO `sys_oper_log` VALUES ('174', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 10:09:59');
INSERT INTO `sys_oper_log` VALUES ('175', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 10:19:01');
INSERT INTO `sys_oper_log` VALUES ('176', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 10:29:07');
INSERT INTO `sys_oper_log` VALUES ('177', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 10:37:34');
INSERT INTO `sys_oper_log` VALUES ('178', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 11:01:49');
INSERT INTO `sys_oper_log` VALUES ('179', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configName\":[\"系统名称\"],\"configKey\":[\"sys.name\"],\"configValue\":[\"联合管理系统\"],\"configType\":[\"Y\"],\"remark\":[\"自定义系统名称！\"]}', '0', null, '2018-06-05 11:04:46');
INSERT INTO `sys_oper_log` VALUES ('180', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/3', '127.0.0.1', null, '{}', '0', null, '2018-06-05 11:38:57');
INSERT INTO `sys_oper_log` VALUES ('181', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"3\"],\"configName\":[\"系统名称\"],\"configKey\":[\"sys.name\"],\"configValue\":[\"联合管理\"],\"configType\":[\"Y\"],\"remark\":[\"自定义系统名称！\"]}', '0', null, '2018-06-05 11:40:12');
INSERT INTO `sys_oper_log` VALUES ('182', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 13:54:44');
INSERT INTO `sys_oper_log` VALUES ('183', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 13:59:57');
INSERT INTO `sys_oper_log` VALUES ('184', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:03:02');
INSERT INTO `sys_oper_log` VALUES ('185', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:03:42');
INSERT INTO `sys_oper_log` VALUES ('186', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"admin\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:08:39');
INSERT INTO `sys_oper_log` VALUES ('187', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:08:57');
INSERT INTO `sys_oper_log` VALUES ('188', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:11:19');
INSERT INTO `sys_oper_log` VALUES ('189', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:13:31');
INSERT INTO `sys_oper_log` VALUES ('190', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:13:56');
INSERT INTO `sys_oper_log` VALUES ('191', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:14:13');
INSERT INTO `sys_oper_log` VALUES ('192', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:15:14');
INSERT INTO `sys_oper_log` VALUES ('193', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/main\"],\"perms\":[\"admin\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"]}', '0', null, '2018-06-05 14:15:16');
INSERT INTO `sys_oper_log` VALUES ('194', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:15:22');
INSERT INTO `sys_oper_log` VALUES ('195', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:15:27');
INSERT INTO `sys_oper_log` VALUES ('196', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/main\"],\"perms\":[\"admin\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:15:30');
INSERT INTO `sys_oper_log` VALUES ('197', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:27:33');
INSERT INTO `sys_oper_log` VALUES ('198', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:28:03');
INSERT INTO `sys_oper_log` VALUES ('199', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:28:29');
INSERT INTO `sys_oper_log` VALUES ('200', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:28:45');
INSERT INTO `sys_oper_log` VALUES ('201', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:28:53');
INSERT INTO `sys_oper_log` VALUES ('202', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:32:28');
INSERT INTO `sys_oper_log` VALUES ('203', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:49:57');
INSERT INTO `sys_oper_log` VALUES ('204', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"#\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:50:41');
INSERT INTO `sys_oper_log` VALUES ('205', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1002', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:50:54');
INSERT INTO `sys_oper_log` VALUES ('206', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1002\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:51:05');
INSERT INTO `sys_oper_log` VALUES ('207', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 14:51:44');
INSERT INTO `sys_oper_log` VALUES ('208', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 14:51:58');
INSERT INTO `sys_oper_log` VALUES ('209', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:14:11');
INSERT INTO `sys_oper_log` VALUES ('210', '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '研发一部', '/system/role/save', '127.0.0.1', 'XXXX内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,53,54,55,56,57,58', '0', null, '2018-06-05 15:14:16');
INSERT INTO `sys_oper_log` VALUES ('211', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:14:29');
INSERT INTO `sys_oper_log` VALUES ('212', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:14:35');
INSERT INTO `sys_oper_log` VALUES ('213', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:16:47');
INSERT INTO `sys_oper_log` VALUES ('214', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 15:16:51');
INSERT INTO `sys_oper_log` VALUES ('215', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:17:28');
INSERT INTO `sys_oper_log` VALUES ('216', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"parentId\":[\"\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 15:18:42');
INSERT INTO `sys_oper_log` VALUES ('217', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1003', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:19:02');
INSERT INTO `sys_oper_log` VALUES ('218', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:19:13');
INSERT INTO `sys_oper_log` VALUES ('219', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:19:26');
INSERT INTO `sys_oper_log` VALUES ('220', '系统管理', '菜单管理-删除菜单', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'web', 'admin', '研发一部', '/system/menu/remove/1003', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:19:43');
INSERT INTO `sys_oper_log` VALUES ('221', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:19:56');
INSERT INTO `sys_oper_log` VALUES ('222', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:20:00');
INSERT INTO `sys_oper_log` VALUES ('223', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-05 15:20:26');
INSERT INTO `sys_oper_log` VALUES ('224', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:20:51');
INSERT INTO `sys_oper_log` VALUES ('225', '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '研发一部', '/system/role/save', '127.0.0.1', 'XXXX内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,53,54,55,56,57,58', '0', null, '2018-06-05 15:20:54');
INSERT INTO `sys_oper_log` VALUES ('226', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:22:02');
INSERT INTO `sys_oper_log` VALUES ('227', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:22:16');
INSERT INTO `sys_oper_log` VALUES ('228', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:36:07');
INSERT INTO `sys_oper_log` VALUES ('229', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 15:38:43');
INSERT INTO `sys_oper_log` VALUES ('230', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 15:38:47');
INSERT INTO `sys_oper_log` VALUES ('231', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 15:48:34');
INSERT INTO `sys_oper_log` VALUES ('232', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 15:49:36');
INSERT INTO `sys_oper_log` VALUES ('233', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 15:49:50');
INSERT INTO `sys_oper_log` VALUES ('234', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:04:14');
INSERT INTO `sys_oper_log` VALUES ('235', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 16:04:43');
INSERT INTO `sys_oper_log` VALUES ('236', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:05:36');
INSERT INTO `sys_oper_log` VALUES ('237', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"3\"],\"configName\":[\"系统名称\"],\"configKey\":[\"sys.name\"],\"configValue\":[\"联合管理系统\"],\"configType\":[\"Y\"],\"remark\":[\"自定义系统名称！\"]}', '0', null, '2018-06-05 16:05:45');
INSERT INTO `sys_oper_log` VALUES ('238', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/system/user/profile/resetPwd/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:11:42');
INSERT INTO `sys_oper_log` VALUES ('239', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/system/user/profile/resetPwd/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:11:53');
INSERT INTO `sys_oper_log` VALUES ('240', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/system/user/profile/resetPwd', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"oldPassword\":[\"123456\"],\"password\":[\"admin123\"],\"confirm\":[\"admin123\"]}', '0', null, '2018-06-05 16:12:21');
INSERT INTO `sys_oper_log` VALUES ('241', '系统管理', '个人信息-修改用户', 'com.ruoyi.project.system.user.controller.ProfileController.edit()', 'web', 'admin', '研发一部', '/system/user/profile/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:12:26');
INSERT INTO `sys_oper_log` VALUES ('242', '系统管理', '个人信息-保存用户', 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'web', 'admin', '研发一部', '/system/user/profile/update', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"],\"userName\":[\"那谁\"],\"email\":[\"1888@163.com\"],\"phonenumber\":[\"15888888889\"],\"sex\":[\"0\"]}', '0', null, '2018-06-05 16:12:53');
INSERT INTO `sys_oper_log` VALUES ('243', '系统管理', '个人信息-重置密码', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'web', 'admin', '研发一部', '/system/user/profile/resetPwd/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:13:33');
INSERT INTO `sys_oper_log` VALUES ('244', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:13:40');
INSERT INTO `sys_oper_log` VALUES ('245', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 16:14:32');
INSERT INTO `sys_oper_log` VALUES ('246', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:39:23');
INSERT INTO `sys_oper_log` VALUES ('247', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:42:10');
INSERT INTO `sys_oper_log` VALUES ('248', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:42:25');
INSERT INTO `sys_oper_log` VALUES ('249', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/6', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 16:42:39');
INSERT INTO `sys_oper_log` VALUES ('250', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 17:28:15');
INSERT INTO `sys_oper_log` VALUES ('251', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 17:28:33');
INSERT INTO `sys_oper_log` VALUES ('252', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 17:28:40');
INSERT INTO `sys_oper_log` VALUES ('253', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/ry/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 17:43:03');
INSERT INTO `sys_oper_log` VALUES ('254', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/ry/system/user/profile/updateAvatar', '127.0.0.1', null, '{\"userId\":[\"1\"]}', '0', null, '2018-06-05 17:43:17');
INSERT INTO `sys_oper_log` VALUES ('255', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 17:55:19');
INSERT INTO `sys_oper_log` VALUES ('256', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configName\":[\"了解我们-提示消息栏\"],\"configKey\":[\"sys.main.info\"],\"configValue\":[\"欢迎来到召唤师峡谷！\"],\"configType\":[\"Y\"],\"remark\":[\"页面顶部信息\"]}', '0', null, '2018-06-05 17:58:03');
INSERT INTO `sys_oper_log` VALUES ('257', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 18:04:49');
INSERT INTO `sys_oper_log` VALUES ('258', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"4\"],\"configName\":[\"了解我们-提示消息栏\"],\"configKey\":[\"sys.main.info\"],\"configValue\":[\"欢迎来到召唤师<br/>峡谷！\"],\"configType\":[\"Y\"],\"remark\":[\"页面顶部信息\"]}', '0', null, '2018-06-05 18:05:52');
INSERT INTO `sys_oper_log` VALUES ('259', '系统管理', '参数配置-删除参数', 'com.ruoyi.project.system.config.controller.ConfigController.remove()', 'web', 'admin', '研发一部', '/system/config/remove/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-05 18:06:23');
INSERT INTO `sys_oper_log` VALUES ('260', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 10:00:44');
INSERT INTO `sys_oper_log` VALUES ('261', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 10:00:48');
INSERT INTO `sys_oper_log` VALUES ('262', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 10:00:53');
INSERT INTO `sys_oper_log` VALUES ('263', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 10:00:58');
INSERT INTO `sys_oper_log` VALUES ('264', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 10:01:07');
INSERT INTO `sys_oper_log` VALUES ('265', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 10:01:10');
INSERT INTO `sys_oper_log` VALUES ('266', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 10:01:13');
INSERT INTO `sys_oper_log` VALUES ('267', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 10:01:17');
INSERT INTO `sys_oper_log` VALUES ('268', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 10:51:35');
INSERT INTO `sys_oper_log` VALUES ('269', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configName\":[\"登录框标语\"],\"configKey\":[\"sys.login.slogan\"],\"configValue\":[\"你若不离不弃，我必生死相依\"],\"configType\":[\"Y\"],\"remark\":[\"\"]}', '0', null, '2018-06-06 10:54:06');
INSERT INTO `sys_oper_log` VALUES ('270', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:01:22');
INSERT INTO `sys_oper_log` VALUES ('271', '系统管理', '参数配置-新增参数', 'com.ruoyi.project.system.config.controller.ConfigController.add()', 'web', 'admin', '研发一部', '/system/config/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:04:16');
INSERT INTO `sys_oper_log` VALUES ('272', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', null, '{\"configName\":[\"版权\"],\"configKey\":[\"sys.login.copyright\"],\"configValue\":[\"© 2018 All Rights Reserved.\"],\"configType\":[\"Y\"],\"remark\":[\"登录页面底部版权\"]}', '0', null, '2018-06-06 11:07:27');
INSERT INTO `sys_oper_log` VALUES ('273', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:45:08');
INSERT INTO `sys_oper_log` VALUES ('274', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"]}', '0', null, '2018-06-06 11:45:12');
INSERT INTO `sys_oper_log` VALUES ('275', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:48:29');
INSERT INTO `sys_oper_log` VALUES ('276', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"1\"]}', '0', null, '2018-06-06 11:48:31');
INSERT INTO `sys_oper_log` VALUES ('277', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:49:21');
INSERT INTO `sys_oper_log` VALUES ('278', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 11:49:23');
INSERT INTO `sys_oper_log` VALUES ('279', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 11:49:29');
INSERT INTO `sys_oper_log` VALUES ('280', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 11:49:31');
INSERT INTO `sys_oper_log` VALUES ('281', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:29:02');
INSERT INTO `sys_oper_log` VALUES ('282', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 12:29:09');
INSERT INTO `sys_oper_log` VALUES ('283', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:29:29');
INSERT INTO `sys_oper_log` VALUES ('284', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"]}', '0', null, '2018-06-06 12:29:32');
INSERT INTO `sys_oper_log` VALUES ('285', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:30:30');
INSERT INTO `sys_oper_log` VALUES ('286', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 12:30:34');
INSERT INTO `sys_oper_log` VALUES ('287', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:31:00');
INSERT INTO `sys_oper_log` VALUES ('288', '系统管理', '菜单管理-删除菜单', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'web', 'admin', '研发一部', '/system/menu/remove/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:31:10');
INSERT INTO `sys_oper_log` VALUES ('289', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:31:32');
INSERT INTO `sys_oper_log` VALUES ('290', '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '研发一部', '/system/role/save', '127.0.0.1', 'XXXX内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,53,54,55,56,57,58', '0', null, '2018-06-06 12:31:42');
INSERT INTO `sys_oper_log` VALUES ('291', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:33:01');
INSERT INTO `sys_oper_log` VALUES ('292', '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '研发一部', '/system/role/save', '127.0.0.1', 'XXXX内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,4,18,19,20,21,22,23,24,5,25,26,27,28,29,30,6,31,32,33,34,35,7,36,37,38,39,40,8,41,42,43,44,45,46,9,47,48,49,50,51,52,10,53,54,55,56,57,58', '0', null, '2018-06-06 12:33:07');
INSERT INTO `sys_oper_log` VALUES ('293', '系统管理', '参数配置-修改参数', 'com.ruoyi.project.system.config.controller.ConfigController.edit()', 'web', 'admin', '研发一部', '/system/config/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 12:59:43');
INSERT INTO `sys_oper_log` VALUES ('294', '系统管理', '参数配置-保存参数', 'com.ruoyi.project.system.config.controller.ConfigController.save()', 'web', 'admin', '研发一部', '/system/config/save', '127.0.0.1', 'XXXX内网IP', '{\"configId\":[\"5\"],\"configName\":[\"版权\"],\"configKey\":[\"sys.login.copyright\"],\"configValue\":[\"© 2018 All Rights Reserved.\"],\"configType\":[\"Y\"],\"remark\":[\"登录页面底部版权\"]}', '0', null, '2018-06-06 12:59:58');
INSERT INTO `sys_oper_log` VALUES ('295', '系统管理', '角色管理-修改角色', 'com.ruoyi.project.system.role.controller.RoleController.edit()', 'web', 'admin', '研发一部', '/system/role/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:10:02');
INSERT INTO `sys_oper_log` VALUES ('296', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:10:14');
INSERT INTO `sys_oper_log` VALUES ('297', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:10:17');
INSERT INTO `sys_oper_log` VALUES ('298', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:27:03');
INSERT INTO `sys_oper_log` VALUES ('299', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:27:13');
INSERT INTO `sys_oper_log` VALUES ('300', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:31:08');
INSERT INTO `sys_oper_log` VALUES ('301', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:31:26');
INSERT INTO `sys_oper_log` VALUES ('302', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:31:57');
INSERT INTO `sys_oper_log` VALUES ('303', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:32:12');
INSERT INTO `sys_oper_log` VALUES ('304', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:36:58');
INSERT INTO `sys_oper_log` VALUES ('305', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"1\"]}', '0', null, '2018-06-06 13:37:02');
INSERT INTO `sys_oper_log` VALUES ('306', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:39:01');
INSERT INTO `sys_oper_log` VALUES ('307', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:39:04');
INSERT INTO `sys_oper_log` VALUES ('308', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:51:04');
INSERT INTO `sys_oper_log` VALUES ('309', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/index\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:51:26');
INSERT INTO `sys_oper_log` VALUES ('310', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:52:44');
INSERT INTO `sys_oper_log` VALUES ('311', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:52:51');
INSERT INTO `sys_oper_log` VALUES ('312', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:53:51');
INSERT INTO `sys_oper_log` VALUES ('313', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:54:10');
INSERT INTO `sys_oper_log` VALUES ('314', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:58:43');
INSERT INTO `sys_oper_log` VALUES ('315', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:58:49');
INSERT INTO `sys_oper_log` VALUES ('316', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 13:59:00');
INSERT INTO `sys_oper_log` VALUES ('317', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页o\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 13:59:28');
INSERT INTO `sys_oper_log` VALUES ('318', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 14:00:03');
INSERT INTO `sys_oper_log` VALUES ('319', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-06 14:00:39');
INSERT INTO `sys_oper_log` VALUES ('320', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-06 14:00:47');
INSERT INTO `sys_oper_log` VALUES ('321', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 14:03:14');
INSERT INTO `sys_oper_log` VALUES ('322', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-06 14:04:08');
INSERT INTO `sys_oper_log` VALUES ('323', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 14:15:07');
INSERT INTO `sys_oper_log` VALUES ('324', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 15:50:57');
INSERT INTO `sys_oper_log` VALUES ('325', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 15:51:04');
INSERT INTO `sys_oper_log` VALUES ('326', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 15:59:19');
INSERT INTO `sys_oper_log` VALUES ('327', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 15:59:31');
INSERT INTO `sys_oper_log` VALUES ('328', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-06 16:22:52');
INSERT INTO `sys_oper_log` VALUES ('329', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-06 16:22:59');
INSERT INTO `sys_oper_log` VALUES ('330', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 09:44:59');
INSERT INTO `sys_oper_log` VALUES ('331', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 09:45:09');
INSERT INTO `sys_oper_log` VALUES ('332', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 09:47:40');
INSERT INTO `sys_oper_log` VALUES ('333', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 10:08:35');
INSERT INTO `sys_oper_log` VALUES ('334', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 10:08:37');
INSERT INTO `sys_oper_log` VALUES ('335', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页o\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 10:08:42');
INSERT INTO `sys_oper_log` VALUES ('336', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 10:08:51');
INSERT INTO `sys_oper_log` VALUES ('337', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页o\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 10:08:55');
INSERT INTO `sys_oper_log` VALUES ('338', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 10:56:22');
INSERT INTO `sys_oper_log` VALUES ('339', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 10:56:26');
INSERT INTO `sys_oper_log` VALUES ('340', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 12:58:31');
INSERT INTO `sys_oper_log` VALUES ('341', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 12:58:41');
INSERT INTO `sys_oper_log` VALUES ('342', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 12:59:33');
INSERT INTO `sys_oper_log` VALUES ('343', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 12:59:40');
INSERT INTO `sys_oper_log` VALUES ('344', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 14:46:20');
INSERT INTO `sys_oper_log` VALUES ('345', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 14:46:30');
INSERT INTO `sys_oper_log` VALUES ('346', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 14:47:21');
INSERT INTO `sys_oper_log` VALUES ('347', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 14:47:27');
INSERT INTO `sys_oper_log` VALUES ('348', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 14:47:35');
INSERT INTO `sys_oper_log` VALUES ('349', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 14:47:48');
INSERT INTO `sys_oper_log` VALUES ('350', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 14:47:52');
INSERT INTO `sys_oper_log` VALUES ('351', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-07 14:48:27');
INSERT INTO `sys_oper_log` VALUES ('352', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-07 14:48:45');
INSERT INTO `sys_oper_log` VALUES ('353', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 09:34:28');
INSERT INTO `sys_oper_log` VALUES ('354', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/user\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-08 09:34:36');
INSERT INTO `sys_oper_log` VALUES ('355', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 10:02:14');
INSERT INTO `sys_oper_log` VALUES ('356', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-06-08 10:02:18');
INSERT INTO `sys_oper_log` VALUES ('357', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:12:10');
INSERT INTO `sys_oper_log` VALUES ('358', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:16:03');
INSERT INTO `sys_oper_log` VALUES ('359', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:19:05');
INSERT INTO `sys_oper_log` VALUES ('360', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:40:03');
INSERT INTO `sys_oper_log` VALUES ('361', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/0', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:41:02');
INSERT INTO `sys_oper_log` VALUES ('362', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/1', '127.0.0.1', null, '{}', '0', null, '2018-06-08 14:48:52');
INSERT INTO `sys_oper_log` VALUES ('363', '系统管理', '字典管理-删除字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', 'web', 'admin', '研发一部', '/system/dict/data/remove/16', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:48:57');
INSERT INTO `sys_oper_log` VALUES ('364', '系统管理', '字典管理-新增字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.add()', 'web', 'admin', '研发一部', '/system/dict/add', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:49:07');
INSERT INTO `sys_oper_log` VALUES ('365', '系统管理', '字典管理-保存字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.save()', 'web', 'admin', '研发一部', '/system/dict/save', '127.0.0.1', 'XXXX内网IP', '{\"dictName\":[\"打开方式\"],\"dictType\":[\"sys_menu_openmode\"],\"status\":[\"0\"],\"remark\":[\"菜单页面打开方式！\"]}', '0', null, '2018-06-08 14:51:03');
INSERT INTO `sys_oper_log` VALUES ('366', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:51:09');
INSERT INTO `sys_oper_log` VALUES ('367', '系统管理', '字典管理-新增字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.add()', 'web', 'admin', '研发一部', '/system/dict/data/add/sys_menu_openmode', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:51:11');
INSERT INTO `sys_oper_log` VALUES ('368', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:51:57');
INSERT INTO `sys_oper_log` VALUES ('369', '系统管理', '字典管理-新增字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.add()', 'web', 'admin', '研发一部', '/system/dict/data/add/sys_menu_openmode', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:52:53');
INSERT INTO `sys_oper_log` VALUES ('370', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictLabel\":[\"本窗口\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_menu_openmode\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-08 14:53:42');
INSERT INTO `sys_oper_log` VALUES ('371', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:53:42');
INSERT INTO `sys_oper_log` VALUES ('372', '系统管理', '字典管理-新增字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.add()', 'web', 'admin', '研发一部', '/system/dict/data/add/sys_menu_openmode', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:53:45');
INSERT INTO `sys_oper_log` VALUES ('373', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:54:21');
INSERT INTO `sys_oper_log` VALUES ('374', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictLabel\":[\"新窗口\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_menu_openmode\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"N\"],\"dictSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-08 14:54:46');
INSERT INTO `sys_oper_log` VALUES ('375', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:54:47');
INSERT INTO `sys_oper_log` VALUES ('376', '系统管理', '字典管理-修改字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.edit()', 'web', 'admin', '研发一部', '/system/dict/edit/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 14:55:10');
INSERT INTO `sys_oper_log` VALUES ('377', '系统管理', '字典管理-保存字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.save()', 'web', 'admin', '研发一部', '/system/dict/save', '127.0.0.1', 'XXXX内网IP', '{\"dictId\":[\"8\"],\"dictName\":[\"打开方式\"],\"dictType\":[\"sys_menu_openmode\"],\"status\":[\"0\"],\"remark\":[\"菜单页面打开方式列表\"]}', '0', null, '2018-06-08 14:55:27');
INSERT INTO `sys_oper_log` VALUES ('378', '系统管理', '字典管理-修改字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.edit()', 'web', 'admin', '研发一部', '/system/dict/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:27:51');
INSERT INTO `sys_oper_log` VALUES ('379', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:27:59');
INSERT INTO `sys_oper_log` VALUES ('380', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:28:14');
INSERT INTO `sys_oper_log` VALUES ('381', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:28:24');
INSERT INTO `sys_oper_log` VALUES ('382', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"17\"],\"dictLabel\":[\"本窗口\"],\"dictValue\":[\"_blank\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-08 15:28:55');
INSERT INTO `sys_oper_log` VALUES ('383', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:28:56');
INSERT INTO `sys_oper_log` VALUES ('384', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:28:59');
INSERT INTO `sys_oper_log` VALUES ('385', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"18\"],\"dictLabel\":[\"新窗口\"],\"dictValue\":[\"_blank\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"N\"],\"dictSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-08 15:29:04');
INSERT INTO `sys_oper_log` VALUES ('386', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:29:05');
INSERT INTO `sys_oper_log` VALUES ('387', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:29:07');
INSERT INTO `sys_oper_log` VALUES ('388', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"17\"],\"dictLabel\":[\"本窗口\"],\"dictValue\":[\"_parent\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-08 15:30:12');
INSERT INTO `sys_oper_log` VALUES ('389', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:30:13');
INSERT INTO `sys_oper_log` VALUES ('390', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 15:30:17');
INSERT INTO `sys_oper_log` VALUES ('391', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 16:36:52');
INSERT INTO `sys_oper_log` VALUES ('392', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-08 16:36:59');
INSERT INTO `sys_oper_log` VALUES ('393', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', null, '{}', '0', null, '2018-06-08 16:39:30');
INSERT INTO `sys_oper_log` VALUES ('394', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/10', '127.0.0.1', null, '{}', '0', null, '2018-06-08 16:41:15');
INSERT INTO `sys_oper_log` VALUES ('395', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:02:13');
INSERT INTO `sys_oper_log` VALUES ('396', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:02:51');
INSERT INTO `sys_oper_log` VALUES ('397', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:03:21');
INSERT INTO `sys_oper_log` VALUES ('398', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:03:34');
INSERT INTO `sys_oper_log` VALUES ('399', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-08 17:03:36');
INSERT INTO `sys_oper_log` VALUES ('400', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:03:41');
INSERT INTO `sys_oper_log` VALUES ('401', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:03:57');
INSERT INTO `sys_oper_log` VALUES ('402', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_parent\"]}', '0', null, '2018-06-08 17:04:02');
INSERT INTO `sys_oper_log` VALUES ('403', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:16:51');
INSERT INTO `sys_oper_log` VALUES ('404', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:17:18');
INSERT INTO `sys_oper_log` VALUES ('405', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:17:23');
INSERT INTO `sys_oper_log` VALUES ('406', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:17:29');
INSERT INTO `sys_oper_log` VALUES ('407', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:17:32');
INSERT INTO `sys_oper_log` VALUES ('408', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-08 17:17:38');
INSERT INTO `sys_oper_log` VALUES ('409', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:17:43');
INSERT INTO `sys_oper_log` VALUES ('410', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:18:09');
INSERT INTO `sys_oper_log` VALUES ('411', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:18:13');
INSERT INTO `sys_oper_log` VALUES ('412', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:18:17');
INSERT INTO `sys_oper_log` VALUES ('413', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:18:26');
INSERT INTO `sys_oper_log` VALUES ('414', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:18:37');
INSERT INTO `sys_oper_log` VALUES ('415', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:21:14');
INSERT INTO `sys_oper_log` VALUES ('416', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:21:18');
INSERT INTO `sys_oper_log` VALUES ('417', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-08 17:21:20');
INSERT INTO `sys_oper_log` VALUES ('418', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:20:32');
INSERT INTO `sys_oper_log` VALUES ('419', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:54:04');
INSERT INTO `sys_oper_log` VALUES ('420', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:58:33');
INSERT INTO `sys_oper_log` VALUES ('421', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:58:45');
INSERT INTO `sys_oper_log` VALUES ('422', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:59:13');
INSERT INTO `sys_oper_log` VALUES ('423', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 10:59:18');
INSERT INTO `sys_oper_log` VALUES ('424', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 11:06:53');
INSERT INTO `sys_oper_log` VALUES ('425', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 11:07:04');
INSERT INTO `sys_oper_log` VALUES ('426', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:42:41');
INSERT INTO `sys_oper_log` VALUES ('427', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-11 13:42:44');
INSERT INTO `sys_oper_log` VALUES ('428', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:42:49');
INSERT INTO `sys_oper_log` VALUES ('429', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:46:46');
INSERT INTO `sys_oper_log` VALUES ('430', '系统管理', '用户管理-修改用户', 'com.ruoyi.project.system.user.controller.UserController.edit()', 'web', 'admin', '研发一部', '/system/user/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:49:36');
INSERT INTO `sys_oper_log` VALUES ('431', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:51:28');
INSERT INTO `sys_oper_log` VALUES ('432', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-11 13:51:31');
INSERT INTO `sys_oper_log` VALUES ('433', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1000', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 13:52:01');
INSERT INTO `sys_oper_log` VALUES ('434', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1000\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"百度一下\"],\"url\":[\"http://www.baidu.com\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"_parent\"]}', '0', null, '2018-06-11 13:52:03');
INSERT INTO `sys_oper_log` VALUES ('435', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 15:32:59');
INSERT INTO `sys_oper_log` VALUES ('436', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 15:33:08');
INSERT INTO `sys_oper_log` VALUES ('437', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/7', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 15:33:12');
INSERT INTO `sys_oper_log` VALUES ('438', '系统管理', '菜单管理-新增菜单', 'com.ruoyi.project.system.menu.controller.MenuController.add()', 'web', 'admin', '研发一部', '/system/menu/add/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 15:33:26');
INSERT INTO `sys_oper_log` VALUES ('439', '系统管理', '部门管理-修改部门', 'com.ruoyi.project.system.dept.controller.DeptController.edit()', 'web', 'admin', '研发一部', '/system/dept/edit/101', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 16:19:17');
INSERT INTO `sys_oper_log` VALUES ('440', '系统管理', '个人信息-修改头像', 'com.ruoyi.project.system.user.controller.ProfileController.avatar()', 'web', 'admin', '研发一部', '/system/user/profile/avatar/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-11 17:27:32');
INSERT INTO `sys_oper_log` VALUES ('441', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-11 17:27:51');
INSERT INTO `sys_oper_log` VALUES ('442', '系统管理', '个人信息-保存头像', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'web', 'admin', '研发一部', '/system/user/profile/updateAvatar', '127.0.0.1', 'XXXX内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-06-11 17:27:54');
INSERT INTO `sys_oper_log` VALUES ('443', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/7', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:39:49');
INSERT INTO `sys_oper_log` VALUES ('444', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/6', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:39:59');
INSERT INTO `sys_oper_log` VALUES ('445', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:07');
INSERT INTO `sys_oper_log` VALUES ('446', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:12');
INSERT INTO `sys_oper_log` VALUES ('447', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:16');
INSERT INTO `sys_oper_log` VALUES ('448', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/2', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:20');
INSERT INTO `sys_oper_log` VALUES ('449', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:23');
INSERT INTO `sys_oper_log` VALUES ('450', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/3', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:27');
INSERT INTO `sys_oper_log` VALUES ('451', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:39');
INSERT INTO `sys_oper_log` VALUES ('452', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', null, '{}', '0', null, '2018-06-12 14:40:43');
INSERT INTO `sys_oper_log` VALUES ('453', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"18\"],\"dictLabel\":[\"新窗口\"],\"dictValue\":[\"_blank\"],\"cssClass\":[\"radio radio-warning radio-inline\"],\"isDefault\":[\"N\"],\"dictSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-12 14:40:49');
INSERT INTO `sys_oper_log` VALUES ('454', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:40:50');
INSERT INTO `sys_oper_log` VALUES ('455', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-12 14:41:04');
INSERT INTO `sys_oper_log` VALUES ('456', '系统管理', '字典管理-修改字典类型', 'com.ruoyi.project.system.dict.controller.DictTypeController.edit()', 'web', 'admin', '研发一部', '/system/dict/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 11:45:49');
INSERT INTO `sys_oper_log` VALUES ('457', '系统管理', '岗位管理-修改岗位', 'com.ruoyi.project.system.post.controller.PostController.edit()', 'web', 'admin', '研发一部', '/system/post/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 11:45:56');
INSERT INTO `sys_oper_log` VALUES ('458', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 11:46:01');
INSERT INTO `sys_oper_log` VALUES ('459', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', null, '{}', '0', null, '2018-06-15 11:46:27');
INSERT INTO `sys_oper_log` VALUES ('460', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"],\"openMode\":[\"_blank\"]}', '0', null, '2018-06-15 11:46:32');
INSERT INTO `sys_oper_log` VALUES ('461', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 11:46:58');
INSERT INTO `sys_oper_log` VALUES ('462', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1001', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 11:47:02');
INSERT INTO `sys_oper_log` VALUES ('463', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"主页\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"],\"openMode\":[\"_parent\"]}', '0', null, '2018-06-15 11:47:05');
INSERT INTO `sys_oper_log` VALUES ('464', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:23:07');
INSERT INTO `sys_oper_log` VALUES ('465', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:23:22');
INSERT INTO `sys_oper_log` VALUES ('466', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"17\"],\"dictLabel\":[\"本窗口\"],\"dictValue\":[\"0\"],\"cssClass\":[\"radio radio-info radio-inline\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-15 15:24:00');
INSERT INTO `sys_oper_log` VALUES ('467', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:24:01');
INSERT INTO `sys_oper_log` VALUES ('468', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:24:03');
INSERT INTO `sys_oper_log` VALUES ('469', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"18\"],\"dictLabel\":[\"新窗口\"],\"dictValue\":[\"2\"],\"cssClass\":[\"radio radio-warning radio-inline\"],\"isDefault\":[\"N\"],\"dictSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-15 15:24:11');
INSERT INTO `sys_oper_log` VALUES ('470', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:24:11');
INSERT INTO `sys_oper_log` VALUES ('471', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:24:14');
INSERT INTO `sys_oper_log` VALUES ('472', '系统管理', '字典管理-保存字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.save()', 'web', 'admin', '研发一部', '/system/dict/data/save', '127.0.0.1', 'XXXX内网IP', '{\"dictCode\":[\"18\"],\"dictLabel\":[\"新窗口\"],\"dictValue\":[\"1\"],\"cssClass\":[\"radio radio-warning radio-inline\"],\"isDefault\":[\"N\"],\"dictSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-06-15 15:24:17');
INSERT INTO `sys_oper_log` VALUES ('473', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:24:19');
INSERT INTO `sys_oper_log` VALUES ('474', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 15:57:12');
INSERT INTO `sys_oper_log` VALUES ('475', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:35:36');
INSERT INTO `sys_oper_log` VALUES ('476', '系统管理', '菜单管理-保存菜单', 'com.ruoyi.project.system.menu.controller.MenuController.save()', 'web', 'admin', '研发一部', '/system/menu/save', '127.0.0.1', 'XXXX内网IP', '{\"menuId\":[\"1004\"],\"parentId\":[\"1001\"],\"menuType\":[\"C\"],\"menuName\":[\"了解我们\"],\"url\":[\"/system/main\"],\"perms\":[\"system:main:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"openMode\":[\"0\"]}', '0', null, '2018-06-15 16:35:41');
INSERT INTO `sys_oper_log` VALUES ('477', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1004', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:35:50');
INSERT INTO `sys_oper_log` VALUES ('478', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', null, '{}', '0', null, '2018-06-15 16:36:21');
INSERT INTO `sys_oper_log` VALUES ('479', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:36:56');
INSERT INTO `sys_oper_log` VALUES ('480', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/6', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:37:09');
INSERT INTO `sys_oper_log` VALUES ('481', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:37:18');
INSERT INTO `sys_oper_log` VALUES ('482', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:37:29');
INSERT INTO `sys_oper_log` VALUES ('483', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/5', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:37:41');
INSERT INTO `sys_oper_log` VALUES ('484', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:37:48');
INSERT INTO `sys_oper_log` VALUES ('485', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/4', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:52:17');
INSERT INTO `sys_oper_log` VALUES ('486', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/1', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:52:48');
INSERT INTO `sys_oper_log` VALUES ('487', '系统管理', '菜单管理-修改菜单', 'com.ruoyi.project.system.menu.controller.MenuController.edit()', 'web', 'admin', '研发一部', '/system/menu/edit/10', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-15 16:52:57');
INSERT INTO `sys_oper_log` VALUES ('488', '系统管理', '字典管理-查询字典数据', 'com.ruoyi.project.system.dict.controller.DictTypeController.detail()', 'web', 'admin', '研发一部', '/system/dict/detail/8', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-19 09:40:01');
INSERT INTO `sys_oper_log` VALUES ('489', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/17', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-19 09:40:11');
INSERT INTO `sys_oper_log` VALUES ('490', '系统管理', '字典管理-修改字典数据', 'com.ruoyi.project.system.dict.controller.DictDataController.edit()', 'web', 'admin', '研发一部', '/system/dict/data/edit/18', '127.0.0.1', 'XXXX内网IP', '{}', '0', null, '2018-06-19 09:40:37');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(10) NOT NULL COMMENT '显示顺序',
  `status` int(1) DEFAULT '0' COMMENT '角色状态:0正常,1禁用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-06 12:33:07', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) DEFAULT '' COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `email` varchar(100) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(20) DEFAULT '' COMMENT '手机号码',
  `sex` char(20) DEFAULT '0' COMMENT '用户性别:0男,1女',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` varchar(100) DEFAULT '' COMMENT '盐加密',
  `status` int(1) DEFAULT '0' COMMENT '帐号状态（0正常 1禁用 2删除）',
  `login_ip` varchar(100) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '106', 'admin', '那谁', '1888@163.com', '15888888889', '0', '', '8f02c9f5377c332a359cdf2b3701b2e4', 'de88b6', '0', '127.0.0.1', '2018-06-22 15:10:49', 'admin', '2018-03-16 11:33:00', 'ry', '2018-06-22 15:10:48', '管理员');
INSERT INTO `sys_user` VALUES ('2', '108', 'ry', '许', 'ry@qq.com', '15666666666', '0', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '127.0.0.1', '2018-06-04 16:29:33', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-04 16:30:54', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestsamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('072fd64f-da9e-4f10-80af-64514f938f56', 'admin', '研发一部', '127.0.0.1', 'XXXX内网IP', 'Chrome', 'Windows 7', 'on_line', '2018-06-22 15:10:45', '2018-06-22 15:10:49', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
