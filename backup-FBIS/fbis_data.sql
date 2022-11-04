/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : fbis

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 04/11/2022 10:16:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_academic_years
-- ----------------------------
DROP TABLE IF EXISTS `tbl_academic_years`;
CREATE TABLE `tbl_academic_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  `is_selected` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_academic_years
-- ----------------------------
BEGIN;
INSERT INTO `tbl_academic_years` VALUES (1, '2021-2022', '2021-12-11', '2022-10-20', 2, 1, '2022-09-26 18:26:50', 1, 1);
INSERT INTO `tbl_academic_years` VALUES (2, '2020-2021', '2020-10-01', '2021-10-11', 3, 1, '2022-09-13 23:16:48', 1, 0);
INSERT INTO `tbl_academic_years` VALUES (3, '2019-2020', '2019-10-01', '2020-10-11', 4, 1, '2022-09-13 23:24:20', 1, 0);
INSERT INTO `tbl_academic_years` VALUES (4, '2022-2023', '2022-10-02', '2023-10-08', 1, 1, '2022-09-13 23:16:41', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_action_date
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action_date`;
CREATE TABLE `tbl_action_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_applied_form
-- ----------------------------
DROP TABLE IF EXISTS `tbl_applied_form`;
CREATE TABLE `tbl_applied_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `regform_id` varchar(255) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `receiver_reg` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `get_brith_certificate` int(1) DEFAULT NULL,
  `get_study_book` int(1) DEFAULT NULL,
  `get_transfer_form` int(1) DEFAULT NULL,
  `get_photo` int(1) DEFAULT NULL,
  `get_result_book` int(1) DEFAULT NULL,
  `get_9_exam_certificate` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_attendances
-- ----------------------------
DROP TABLE IF EXISTS `tbl_attendances`;
CREATE TABLE `tbl_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `is_absence` int(11) DEFAULT NULL,
  `is_permission` int(11) DEFAULT NULL,
  `is_late` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_student` (`id_student`,`date`,`subject`,`session`) USING BTREE,
  CONSTRAINT `tbl_attendances_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `tbl_students` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_attendances
-- ----------------------------
BEGIN;
INSERT INTO `tbl_attendances` VALUES (1, 1, '2022-09-15', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'NULL', '2022-09-16 12:05:57', 1);
INSERT INTO `tbl_attendances` VALUES (2, 1, '2022-09-16', 2, 1, 1, 1, 1, 1, 1, 2, 2, 'NULL', '2022-09-16 10:46:06', 1);
INSERT INTO `tbl_attendances` VALUES (3, 1, '2022-09-16', 3, 1, 1, 1, 1, 1, 1, 2, 2, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (4, 1, '2022-09-16', 4, 1, 1, 1, 1, 1, 1, 3, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (5, 1, '2022-09-16', 5, 1, 1, 1, 1, 1, 1, 3, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (6, 1, '2022-09-14', 1, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (7, 1, '2022-09-14', 3, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (8, 1, '2022-08-16', 1, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (9, 1, '2022-08-16', 2, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (10, 1, '2022-08-16', 3, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (11, 1, '2022-07-16', 4, 1, 1, 1, 1, 1, 1, 3, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (12, 1, '2022-07-16', 5, 1, 1, 1, 1, 1, 1, 3, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (13, 1, '2022-07-14', 1, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (14, 1, '2022-07-14', 3, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (15, 1, '2022-06-20', 1, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (16, 1, '2022-06-17', 2, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
INSERT INTO `tbl_attendances` VALUES (17, 1, '2022-06-19', 3, 1, 1, 1, 1, 1, 1, 2, NULL, 'NULL', '2022-09-16 12:00:14', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_branch_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_branch_detail`;
CREATE TABLE `tbl_branch_detail` (
  `branch_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `linkmap` varchar(255) DEFAULT NULL,
  `imgmap` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE,
  KEY `fk_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_branch_detail
-- ----------------------------
BEGIN;
INSERT INTO `tbl_branch_detail` VALUES (1, 'ភូមិវត្តបូព៌ សង្កាត់សាលាកំរើក ក្រុងសៀមរាប ខេត្តសៀមរាប', '012523247', 'https://goo.gl/maps/qvvU46ii4kJyyY9x9', 'http://192.168.43.162/api_android/assets/images/campus2.png', '2022-09-12 11:11:04', 1);
INSERT INTO `tbl_branch_detail` VALUES (2, 'ភូមិសាលាកន្សែង សង្កាត់ស្វាយដង្គំ ក្រុងសៀមរាប ខេត្តសៀមរា', '09223344', 'https://goo.gl/maps/qvvU46ii4kJyyY9x9', 'http://192.168.43.162/api_android/assets/images/campus2.png', '2022-10-05 12:13:17', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_branches
-- ----------------------------
DROP TABLE IF EXISTS `tbl_branches`;
CREATE TABLE `tbl_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_branches
-- ----------------------------
BEGIN;
INSERT INTO `tbl_branches` VALUES (1, 'សាខាទី១');
INSERT INTO `tbl_branches` VALUES (2, 'សាខាទី២');
COMMIT;

-- ----------------------------
-- Table structure for tbl_change_school_rec
-- ----------------------------
DROP TABLE IF EXISTS `tbl_change_school_rec`;
CREATE TABLE `tbl_change_school_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `school_year` int(11) DEFAULT NULL,
  `education_level` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `reason` int(11) DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `newschool` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `advisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_class_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_class_type`;
CREATE TABLE `tbl_class_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_class_type
-- ----------------------------
BEGIN;
INSERT INTO `tbl_class_type` VALUES (1, 'Social Sciences', 'វិទ្យាសាស្ដ្រសង្គម');
INSERT INTO `tbl_class_type` VALUES (2, 'Sciences', 'វិទ្យាសាស្ដ្រ');
COMMIT;

-- ----------------------------
-- Table structure for tbl_countries
-- ----------------------------
DROP TABLE IF EXISTS `tbl_countries`;
CREATE TABLE `tbl_countries` (
  `id` int(11) NOT NULL,
  `phone_code` int(5) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_daily_workplan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_daily_workplan`;
CREATE TABLE `tbl_daily_workplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `action` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_plan` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `plan_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_education_levels
-- ----------------------------
DROP TABLE IF EXISTS `tbl_education_levels`;
CREATE TABLE `tbl_education_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_en` varchar(255) DEFAULT NULL,
  `level_kh` varchar(255) DEFAULT NULL,
  `study_program` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_education_levels
-- ----------------------------
BEGIN;
INSERT INTO `tbl_education_levels` VALUES (1, 'No', 'មតេ្ដយ្យសិក្សា', 1, 'មាន៣កម្រិត', 1, 1, '2022-08-22 12:56:44', 1);
INSERT INTO `tbl_education_levels` VALUES (2, 'No', 'បឋមសិក្សា', 1, 'ថ្នាក់ទី១ដល់ថ្នាក់ទី៦', 2, 1, '2022-08-23 12:48:09', 1);
INSERT INTO `tbl_education_levels` VALUES (3, 'No', 'អនុវិទ្យាល័យ', 1, 'ថ្នាក់ទី៧ដល់ថ្នាក់ទី៩', 3, 1, '2022-08-23 12:48:30', 1);
INSERT INTO `tbl_education_levels` VALUES (4, 'No', 'វិទ្យាល័យ', 1, 'ថ្នាក់ទី១០ដល់ថ្នាក់ទី១២', 4, 1, '2022-08-23 12:48:50', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_expected_outcomes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_expected_outcomes`;
CREATE TABLE `tbl_expected_outcomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expected_outcome` varchar(500) DEFAULT NULL,
  `actual_result` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_plan` int(11) DEFAULT NULL,
  `workplan_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `workplan_id` (`workplan_id`),
  CONSTRAINT `tbl_expected_outcomes_ibfk_1` FOREIGN KEY (`workplan_id`) REFERENCES `tbl_daily_workplan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_files_upload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_files_upload`;
CREATE TABLE `tbl_files_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `filesize` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uploaddate` datetime DEFAULT NULL,
  `uploadby` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_genders
-- ----------------------------
DROP TABLE IF EXISTS `tbl_genders`;
CREATE TABLE `tbl_genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex_en` varchar(10) DEFAULT NULL,
  `sex_kh` varchar(10) DEFAULT NULL,
  `short_en` varchar(1) DEFAULT NULL,
  `short_kh` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_genders
-- ----------------------------
BEGIN;
INSERT INTO `tbl_genders` VALUES (1, 'Male', 'ប្រុស', 'M', 'ប');
INSERT INTO `tbl_genders` VALUES (2, 'Female', 'ស្រី', 'F', 'ស');
COMMIT;

-- ----------------------------
-- Table structure for tbl_geo_area
-- ----------------------------
DROP TABLE IF EXISTS `tbl_geo_area`;
CREATE TABLE `tbl_geo_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_code` varchar(20) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `areatype_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_geo_area_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_geo_area_type`;
CREATE TABLE `tbl_geo_area_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_grade_levels
-- ----------------------------
DROP TABLE IF EXISTS `tbl_grade_levels`;
CREATE TABLE `tbl_grade_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_en` varchar(255) DEFAULT NULL,
  `grade_kh` varchar(255) DEFAULT NULL,
  `edu_level` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_grade_levels
-- ----------------------------
BEGIN;
INSERT INTO `tbl_grade_levels` VALUES (1, 'Grade 12', 'ថ្នាក់ទី 12', 1, 2, 1, '2022-08-22 10:15:35', 1);
INSERT INTO `tbl_grade_levels` VALUES (2, 'Grade 11', 'ថ្នាក់ទី 11', 1, 1, 1, '2022-08-22 10:16:40', 1);
INSERT INTO `tbl_grade_levels` VALUES (3, 'Grade 10', 'ថ្នាក់ទី 10', 1, 3, 1, '2022-08-23 10:41:18', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_groups
-- ----------------------------
DROP TABLE IF EXISTS `tbl_groups`;
CREATE TABLE `tbl_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `group_name_kh` varchar(255) DEFAULT '',
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `class_type` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `home_teacher` varchar(255) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_groups
-- ----------------------------
BEGIN;
INSERT INTO `tbl_groups` VALUES (1, '12A', '12ក', 1, 1, 1, 1, 1, 1, 1, '1', 2, '2022-08-22 10:13:59', 1);
INSERT INTO `tbl_groups` VALUES (2, '12B', '12ខ', 1, 1, 1, 2, 1, 3, 1, '1', 2, '2022-08-23 10:37:58', 1);
INSERT INTO `tbl_groups` VALUES (3, '11A', '11ក', 3, 2, 1, 1, 1, 2, 1, '1', 2, '2022-08-23 10:40:35', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_holiday
-- ----------------------------
DROP TABLE IF EXISTS `tbl_holiday`;
CREATE TABLE `tbl_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_holiday
-- ----------------------------
BEGIN;
INSERT INTO `tbl_holiday` VALUES (1, '2022-01-01', 'Global New Year');
INSERT INTO `tbl_holiday` VALUES (2, '2022-01-07', 'Victory Day over Genocide');
INSERT INTO `tbl_holiday` VALUES (3, '2022-03-08', 'International Women’s Da');
COMMIT;

-- ----------------------------
-- Table structure for tbl_job_condition
-- ----------------------------
DROP TABLE IF EXISTS `tbl_job_condition`;
CREATE TABLE `tbl_job_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_kh` varchar(255) DEFAULT NULL,
  `condition_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_job_occupation_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_job_occupation_type`;
CREATE TABLE `tbl_job_occupation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_kh` varchar(255) DEFAULT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_job_position
-- ----------------------------
DROP TABLE IF EXISTS `tbl_job_position`;
CREATE TABLE `tbl_job_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_kh` varchar(255) DEFAULT NULL,
  `position_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_job_position
-- ----------------------------
BEGIN;
INSERT INTO `tbl_job_position` VALUES (1, 'ប្រធានគ្រប់គ្រងការិយាល័យសិស្ស', 'Student Office Manager');
INSERT INTO `tbl_job_position` VALUES (2, 'ព័ត៌មានវិទ្យា', 'IT');
INSERT INTO `tbl_job_position` VALUES (3, 'គណនេយ្យករ', 'Accountant');
COMMIT;

-- ----------------------------
-- Table structure for tbl_job_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_job_type`;
CREATE TABLE `tbl_job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_kh` varchar(255) DEFAULT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_job_type
-- ----------------------------
BEGIN;
INSERT INTO `tbl_job_type` VALUES (1, 'ពេញម៉ោង', 'Full Time');
INSERT INTO `tbl_job_type` VALUES (2, 'ក្រៅ​ម៉ោង', 'Part Time');
COMMIT;

-- ----------------------------
-- Table structure for tbl_manager_job_annouce
-- ----------------------------
DROP TABLE IF EXISTS `tbl_manager_job_annouce`;
CREATE TABLE `tbl_manager_job_annouce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_kh` varchar(255) DEFAULT NULL,
  `manager_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_marital_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_marital_status`;
CREATE TABLE `tbl_marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marital_kh` varchar(255) DEFAULT NULL,
  `marital_en` varchar(255) DEFAULT NULL,
  `sort_kh` varchar(255) DEFAULT NULL,
  `sort_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_months
-- ----------------------------
DROP TABLE IF EXISTS `tbl_months`;
CREATE TABLE `tbl_months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `semester` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_months
-- ----------------------------
BEGIN;
INSERT INTO `tbl_months` VALUES (1, 'January', 'មករា', 1, '2022-09-25 11:10:09', 1, 2);
INSERT INTO `tbl_months` VALUES (2, 'February', 'កុម្ភៈ', 1, '2022-09-25 11:10:11', 1, 3);
INSERT INTO `tbl_months` VALUES (3, 'May', 'ឧសភា', 1, '2022-09-25 11:10:12', 2, 4);
INSERT INTO `tbl_months` VALUES (4, 'June', 'មិថុនា', 1, '2022-09-25 11:10:14', 2, 5);
INSERT INTO `tbl_months` VALUES (5, 'July', 'កក្កដា', 1, '2022-09-25 11:10:17', 2, 6);
INSERT INTO `tbl_months` VALUES (6, 'December', 'ធ្នូ', 1, '2022-09-17 23:39:10', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_nationalities
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nationalities`;
CREATE TABLE `tbl_nationalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `name_kh` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text,
  `type_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_news_type` (`type_id`) USING BTREE,
  KEY `fk_news_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_news_type` FOREIGN KEY (`type_id`) REFERENCES `tbl_type_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_news_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_news
-- ----------------------------
BEGIN;
INSERT INTO `tbl_news` VALUES (1, 'ការបើកបវេសនកាលថ្មី', 'https://fbis.edu.kh/images//sonisith2017/DSC_3452.jpg', 'ការបើកបវេសនកាលថ្មីឆ្នាំសិក្សា 2022-2023', 'ការបើកបវេសនកាលថ្មីឆ្នាំសិក្សា 2022-2023 ចូលរៀនថ្ងៃទី 18 ខែកញ្ញា ឆ្នាំ2022', 1, '2022-08-11 22:42:57', 1);
INSERT INTO `tbl_news` VALUES (2, 'ការប្រឡងបញ្ចប់ឆមាសទី២', 'https://fbis.edu.kh/images//sonisith2017/DSC_3466.jpg', 'ការប្រឡងបញ្ចប់ឆមាស', 'ការប្រឡងបញ្ចប់ឆ្នាំសិក្សា 2022-2023 ចូលរៀនថ្ងៃទី 10 ខែសីហា ឆ្នាំ2022', 1, '2022-08-11 22:42:57', 1);
INSERT INTO `tbl_news` VALUES (3, 'ដំណើរទស្សនៈកិច្ចរបស់សិស្សានុសិស្ស', 'NULL', 'ដំណើរទស្សនៈកិច្ចរបស់សិស្សានុស្សា', 'ដំណើរទស្សនៈកិច្ចរបស់សិស្សានុសិស្ស', 1, '2022-10-01 15:40:39', 1);
INSERT INTO `tbl_news` VALUES (4, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:47:45', 1);
INSERT INTO `tbl_news` VALUES (5, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:48:15', 1);
INSERT INTO `tbl_news` VALUES (6, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:48:30', 1);
INSERT INTO `tbl_news` VALUES (7, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:48:59', 1);
INSERT INTO `tbl_news` VALUES (8, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:49:59', 1);
INSERT INTO `tbl_news` VALUES (9, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:50:59', 1);
INSERT INTO `tbl_news` VALUES (10, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing T', 'Des', 1, '2022-10-21 04:51:18', 1);
INSERT INTO `tbl_news` VALUES (11, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 04:51:49', 1);
INSERT INTO `tbl_news` VALUES (12, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 04:52:16', 1);
INSERT INTO `tbl_news` VALUES (13, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 04:56:11', 1);
INSERT INTO `tbl_news` VALUES (14, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:13:17', 1);
INSERT INTO `tbl_news` VALUES (15, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:16:27', 1);
INSERT INTO `tbl_news` VALUES (16, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:22:40', 1);
INSERT INTO `tbl_news` VALUES (17, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:28:32', 1);
INSERT INTO `tbl_news` VALUES (18, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:28:47', 1);
INSERT INTO `tbl_news` VALUES (19, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:38:45', 1);
INSERT INTO `tbl_news` VALUES (20, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 05:39:03', 1);
INSERT INTO `tbl_news` VALUES (21, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:31:45', 1);
INSERT INTO `tbl_news` VALUES (22, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:32:01', 1);
INSERT INTO `tbl_news` VALUES (23, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:32:11', 1);
INSERT INTO `tbl_news` VALUES (24, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:33:30', 1);
INSERT INTO `tbl_news` VALUES (25, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:33:48', 1);
INSERT INTO `tbl_news` VALUES (26, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 08:34:04', 1);
INSERT INTO `tbl_news` VALUES (27, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:04:21', 1);
INSERT INTO `tbl_news` VALUES (28, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:04:48', 1);
INSERT INTO `tbl_news` VALUES (29, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:32:43', 1);
INSERT INTO `tbl_news` VALUES (30, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:33:29', 1);
INSERT INTO `tbl_news` VALUES (31, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:35:02', 1);
INSERT INTO `tbl_news` VALUES (32, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:54:56', 1);
INSERT INTO `tbl_news` VALUES (33, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:55:49', 1);
INSERT INTO `tbl_news` VALUES (34, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 09:56:57', 1);
INSERT INTO `tbl_news` VALUES (35, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:23:16', 1);
INSERT INTO `tbl_news` VALUES (36, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:27:04', 1);
INSERT INTO `tbl_news` VALUES (37, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:28:01', 1);
INSERT INTO `tbl_news` VALUES (38, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:29:46', 1);
INSERT INTO `tbl_news` VALUES (39, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:30:16', 1);
INSERT INTO `tbl_news` VALUES (40, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:32:39', 1);
INSERT INTO `tbl_news` VALUES (41, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:32:56', 1);
INSERT INTO `tbl_news` VALUES (42, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:33:34', 1);
INSERT INTO `tbl_news` VALUES (43, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:34:29', 1);
INSERT INTO `tbl_news` VALUES (44, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:34:52', 1);
INSERT INTO `tbl_news` VALUES (45, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:35:35', 1);
INSERT INTO `tbl_news` VALUES (46, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:38:45', 1);
INSERT INTO `tbl_news` VALUES (47, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:39:56', 1);
INSERT INTO `tbl_news` VALUES (48, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:47:22', 1);
INSERT INTO `tbl_news` VALUES (49, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:47:54', 1);
INSERT INTO `tbl_news` VALUES (50, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:50:56', 1);
INSERT INTO `tbl_news` VALUES (51, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 15:51:26', 1);
INSERT INTO `tbl_news` VALUES (52, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:16:09', 1);
INSERT INTO `tbl_news` VALUES (53, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:18:51', 1);
INSERT INTO `tbl_news` VALUES (54, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:19:41', 1);
INSERT INTO `tbl_news` VALUES (55, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:22:17', 1);
INSERT INTO `tbl_news` VALUES (56, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:23:38', 1);
INSERT INTO `tbl_news` VALUES (57, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:23:55', 1);
INSERT INTO `tbl_news` VALUES (58, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:24:08', 1);
INSERT INTO `tbl_news` VALUES (59, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:25:15', 1);
INSERT INTO `tbl_news` VALUES (60, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:25:33', 1);
INSERT INTO `tbl_news` VALUES (61, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:25:53', 1);
INSERT INTO `tbl_news` VALUES (62, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:26:38', 1);
INSERT INTO `tbl_news` VALUES (63, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:26:53', 1);
INSERT INTO `tbl_news` VALUES (64, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:28:07', 1);
INSERT INTO `tbl_news` VALUES (65, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:28:18', 1);
INSERT INTO `tbl_news` VALUES (66, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:29:38', 1);
INSERT INTO `tbl_news` VALUES (67, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:29:55', 1);
INSERT INTO `tbl_news` VALUES (68, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:30:12', 1);
INSERT INTO `tbl_news` VALUES (69, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:31:40', 1);
INSERT INTO `tbl_news` VALUES (70, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-21 16:31:57', 1);
INSERT INTO `tbl_news` VALUES (71, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:08:28', 1);
INSERT INTO `tbl_news` VALUES (72, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:08:53', 1);
INSERT INTO `tbl_news` VALUES (73, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:10:58', 1);
INSERT INTO `tbl_news` VALUES (74, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:11:37', 1);
INSERT INTO `tbl_news` VALUES (75, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:12:06', 1);
INSERT INTO `tbl_news` VALUES (76, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:12:30', 1);
INSERT INTO `tbl_news` VALUES (77, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:12:48', 1);
INSERT INTO `tbl_news` VALUES (78, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:14:01', 1);
INSERT INTO `tbl_news` VALUES (79, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:15:46', 1);
INSERT INTO `tbl_news` VALUES (80, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:16:06', 1);
INSERT INTO `tbl_news` VALUES (81, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:45:46', 1);
INSERT INTO `tbl_news` VALUES (82, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 07:46:22', 1);
INSERT INTO `tbl_news` VALUES (83, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:14:28', 1);
INSERT INTO `tbl_news` VALUES (84, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:14:47', 1);
INSERT INTO `tbl_news` VALUES (85, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:15:46', 1);
INSERT INTO `tbl_news` VALUES (86, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:19:36', 1);
INSERT INTO `tbl_news` VALUES (87, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:21:41', 1);
INSERT INTO `tbl_news` VALUES (88, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:22:14', 1);
INSERT INTO `tbl_news` VALUES (89, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:24:07', 1);
INSERT INTO `tbl_news` VALUES (90, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:25:14', 1);
INSERT INTO `tbl_news` VALUES (91, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:28:26', 1);
INSERT INTO `tbl_news` VALUES (92, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:29:51', 1);
INSERT INTO `tbl_news` VALUES (93, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:30:19', 1);
INSERT INTO `tbl_news` VALUES (94, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 10:31:10', 1);
INSERT INTO `tbl_news` VALUES (95, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:02:55', 1);
INSERT INTO `tbl_news` VALUES (96, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:03:18', 1);
INSERT INTO `tbl_news` VALUES (97, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:04:05', 1);
INSERT INTO `tbl_news` VALUES (98, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:05:51', 1);
INSERT INTO `tbl_news` VALUES (99, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:09:05', 1);
INSERT INTO `tbl_news` VALUES (100, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:10:27', 1);
INSERT INTO `tbl_news` VALUES (101, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:11:13', 1);
INSERT INTO `tbl_news` VALUES (102, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:13:24', 1);
INSERT INTO `tbl_news` VALUES (103, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:14:21', 1);
INSERT INTO `tbl_news` VALUES (104, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:15:07', 1);
INSERT INTO `tbl_news` VALUES (105, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:16:03', 1);
INSERT INTO `tbl_news` VALUES (106, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:25:36', 1);
INSERT INTO `tbl_news` VALUES (107, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:33:37', 1);
INSERT INTO `tbl_news` VALUES (108, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 11:37:29', 1);
INSERT INTO `tbl_news` VALUES (109, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:18:31', 1);
INSERT INTO `tbl_news` VALUES (110, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:19:42', 1);
INSERT INTO `tbl_news` VALUES (111, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:19:55', 1);
INSERT INTO `tbl_news` VALUES (112, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:20:50', 1);
INSERT INTO `tbl_news` VALUES (113, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:21:07', 1);
INSERT INTO `tbl_news` VALUES (114, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:21:14', 1);
INSERT INTO `tbl_news` VALUES (115, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:22:07', 1);
INSERT INTO `tbl_news` VALUES (116, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:24:40', 1);
INSERT INTO `tbl_news` VALUES (117, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:42:42', 1);
INSERT INTO `tbl_news` VALUES (118, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:42:57', 1);
INSERT INTO `tbl_news` VALUES (119, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:43:34', 1);
INSERT INTO `tbl_news` VALUES (120, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:43:43', 1);
INSERT INTO `tbl_news` VALUES (121, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 14:45:18', 1);
INSERT INTO `tbl_news` VALUES (122, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 15:13:05', 1);
INSERT INTO `tbl_news` VALUES (123, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 15:13:23', 1);
INSERT INTO `tbl_news` VALUES (124, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 15:14:29', 1);
INSERT INTO `tbl_news` VALUES (125, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-23 15:14:43', 1);
INSERT INTO `tbl_news` VALUES (126, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 03:15:33', 1);
INSERT INTO `tbl_news` VALUES (127, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 03:15:55', 1);
INSERT INTO `tbl_news` VALUES (128, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 03:17:12', 1);
INSERT INTO `tbl_news` VALUES (129, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 03:17:22', 1);
INSERT INTO `tbl_news` VALUES (130, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 09:34:36', 1);
INSERT INTO `tbl_news` VALUES (131, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 09:35:20', 1);
INSERT INTO `tbl_news` VALUES (132, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-10-24 09:36:00', 1);
INSERT INTO `tbl_news` VALUES (133, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:27:40', 1);
INSERT INTO `tbl_news` VALUES (134, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:28:55', 1);
INSERT INTO `tbl_news` VALUES (135, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:29:07', 1);
INSERT INTO `tbl_news` VALUES (136, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:34:36', 1);
INSERT INTO `tbl_news` VALUES (137, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:45:11', 1);
INSERT INTO `tbl_news` VALUES (138, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 08:59:43', 1);
INSERT INTO `tbl_news` VALUES (139, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:04:10', 1);
INSERT INTO `tbl_news` VALUES (140, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:06:09', 1);
INSERT INTO `tbl_news` VALUES (141, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:25:55', 1);
INSERT INTO `tbl_news` VALUES (142, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:38:16', 1);
INSERT INTO `tbl_news` VALUES (143, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:39:59', 1);
INSERT INTO `tbl_news` VALUES (144, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:42:42', 1);
INSERT INTO `tbl_news` VALUES (145, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 09:43:09', 1);
INSERT INTO `tbl_news` VALUES (146, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 17:02:44', 1);
INSERT INTO `tbl_news` VALUES (147, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 22:53:30', 1);
INSERT INTO `tbl_news` VALUES (148, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 22:56:39', 1);
INSERT INTO `tbl_news` VALUES (149, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 22:57:07', 1);
INSERT INTO `tbl_news` VALUES (150, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 23:00:54', 1);
INSERT INTO `tbl_news` VALUES (151, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 23:01:22', 1);
INSERT INTO `tbl_news` VALUES (152, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 23:02:40', 1);
INSERT INTO `tbl_news` VALUES (153, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 23:03:00', 1);
INSERT INTO `tbl_news` VALUES (154, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 1', 'Des', 1, '2022-11-03 23:06:54', 1);
INSERT INTO `tbl_news` VALUES (155, 'Hello FBIS App I\'m Testing.', 'https://th.bing.com/th/id/R.2cf1f2faa6b42c0f0faf5f4bdd9c4f08?rik=B6WT2F1d64%2bxTA&pid=ImgRaw&r=0', '1 day for Testing 2', 'Des 2', 1, '2022-11-03 23:07:24', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_notification_token_device
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notification_token_device`;
CREATE TABLE `tbl_notification_token_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_device` varchar(500) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `unread` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_notification_token_device
-- ----------------------------
BEGIN;
INSERT INTO `tbl_notification_token_device` VALUES (1, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 4, 1);
INSERT INTO `tbl_notification_token_device` VALUES (2, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 4, 1);
INSERT INTO `tbl_notification_token_device` VALUES (3, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 4, 1);
INSERT INTO `tbl_notification_token_device` VALUES (4, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 5, 1);
INSERT INTO `tbl_notification_token_device` VALUES (5, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 5, 1);
INSERT INTO `tbl_notification_token_device` VALUES (6, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 5, 1);
INSERT INTO `tbl_notification_token_device` VALUES (7, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 6, 1);
INSERT INTO `tbl_notification_token_device` VALUES (8, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 6, 1);
INSERT INTO `tbl_notification_token_device` VALUES (9, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 6, 1);
INSERT INTO `tbl_notification_token_device` VALUES (10, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 7, 1);
INSERT INTO `tbl_notification_token_device` VALUES (11, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 7, 1);
INSERT INTO `tbl_notification_token_device` VALUES (12, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 7, 1);
INSERT INTO `tbl_notification_token_device` VALUES (13, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 8, 1);
INSERT INTO `tbl_notification_token_device` VALUES (14, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 8, 1);
INSERT INTO `tbl_notification_token_device` VALUES (15, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 8, 1);
INSERT INTO `tbl_notification_token_device` VALUES (16, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 9, 1);
INSERT INTO `tbl_notification_token_device` VALUES (17, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 9, 1);
INSERT INTO `tbl_notification_token_device` VALUES (18, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 9, 1);
INSERT INTO `tbl_notification_token_device` VALUES (19, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 10, 0);
INSERT INTO `tbl_notification_token_device` VALUES (20, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 10, 1);
INSERT INTO `tbl_notification_token_device` VALUES (21, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 10, 1);
INSERT INTO `tbl_notification_token_device` VALUES (22, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 11, 0);
INSERT INTO `tbl_notification_token_device` VALUES (23, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 11, 1);
INSERT INTO `tbl_notification_token_device` VALUES (24, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 11, 1);
INSERT INTO `tbl_notification_token_device` VALUES (25, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 12, 0);
INSERT INTO `tbl_notification_token_device` VALUES (26, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 12, 1);
INSERT INTO `tbl_notification_token_device` VALUES (27, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 12, 1);
INSERT INTO `tbl_notification_token_device` VALUES (28, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 13, 1);
INSERT INTO `tbl_notification_token_device` VALUES (29, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 13, 1);
INSERT INTO `tbl_notification_token_device` VALUES (30, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 13, 1);
INSERT INTO `tbl_notification_token_device` VALUES (31, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 14, 1);
INSERT INTO `tbl_notification_token_device` VALUES (32, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 14, 1);
INSERT INTO `tbl_notification_token_device` VALUES (33, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 14, 1);
INSERT INTO `tbl_notification_token_device` VALUES (34, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 15, 0);
INSERT INTO `tbl_notification_token_device` VALUES (35, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 15, 1);
INSERT INTO `tbl_notification_token_device` VALUES (36, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 15, 1);
INSERT INTO `tbl_notification_token_device` VALUES (37, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 16, 1);
INSERT INTO `tbl_notification_token_device` VALUES (38, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 16, 1);
INSERT INTO `tbl_notification_token_device` VALUES (39, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 16, 1);
INSERT INTO `tbl_notification_token_device` VALUES (40, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 17, 1);
INSERT INTO `tbl_notification_token_device` VALUES (41, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 17, 1);
INSERT INTO `tbl_notification_token_device` VALUES (42, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 17, 1);
INSERT INTO `tbl_notification_token_device` VALUES (43, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 18, 1);
INSERT INTO `tbl_notification_token_device` VALUES (44, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 18, 1);
INSERT INTO `tbl_notification_token_device` VALUES (45, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 18, 1);
INSERT INTO `tbl_notification_token_device` VALUES (46, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 19, 1);
INSERT INTO `tbl_notification_token_device` VALUES (47, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 19, 1);
INSERT INTO `tbl_notification_token_device` VALUES (48, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 19, 1);
INSERT INTO `tbl_notification_token_device` VALUES (49, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 20, 1);
INSERT INTO `tbl_notification_token_device` VALUES (50, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 20, 1);
INSERT INTO `tbl_notification_token_device` VALUES (51, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 20, 1);
INSERT INTO `tbl_notification_token_device` VALUES (52, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 21, 0);
INSERT INTO `tbl_notification_token_device` VALUES (53, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 21, 1);
INSERT INTO `tbl_notification_token_device` VALUES (54, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 21, 1);
INSERT INTO `tbl_notification_token_device` VALUES (55, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 22, 1);
INSERT INTO `tbl_notification_token_device` VALUES (56, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 22, 1);
INSERT INTO `tbl_notification_token_device` VALUES (57, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 22, 1);
INSERT INTO `tbl_notification_token_device` VALUES (58, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 23, 1);
INSERT INTO `tbl_notification_token_device` VALUES (59, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 23, 1);
INSERT INTO `tbl_notification_token_device` VALUES (60, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 23, 1);
INSERT INTO `tbl_notification_token_device` VALUES (61, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 24, 1);
INSERT INTO `tbl_notification_token_device` VALUES (62, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 24, 1);
INSERT INTO `tbl_notification_token_device` VALUES (63, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 24, 1);
INSERT INTO `tbl_notification_token_device` VALUES (64, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 25, 0);
INSERT INTO `tbl_notification_token_device` VALUES (65, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 25, 1);
INSERT INTO `tbl_notification_token_device` VALUES (66, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 25, 1);
INSERT INTO `tbl_notification_token_device` VALUES (67, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 26, 1);
INSERT INTO `tbl_notification_token_device` VALUES (68, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 26, 1);
INSERT INTO `tbl_notification_token_device` VALUES (69, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 26, 1);
INSERT INTO `tbl_notification_token_device` VALUES (70, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 27, 1);
INSERT INTO `tbl_notification_token_device` VALUES (71, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 27, 1);
INSERT INTO `tbl_notification_token_device` VALUES (72, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 27, 1);
INSERT INTO `tbl_notification_token_device` VALUES (73, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 28, 1);
INSERT INTO `tbl_notification_token_device` VALUES (74, 'dPR4eRPeTpCuXivVFqo6ly:APA91bGoS0fwWupxS8uz6dtK0HlQOCIsxkkdQ8Y3ri6BnntE59xB3KOZgYo9yVo0UPWnhRyYZhgtmuo75V5QBGua52xOCxG2gcWPk1qNe2tDy_xUbj7AeJkFQgYpRIwTzTC4m__OZBh9', 28, 1);
INSERT INTO `tbl_notification_token_device` VALUES (75, 'cWUxfB3qRi6yGqqnbizOpu:APA91bFPkMIYJLoqFXE_QAJ2JYGjAHbZnoQJ_zuLSk9K2E6Ixy5DfGKhH2Gr6XoZ2KmEO7UwTo2egP-KnkdTm5Fpm86tuJWHWaJkLguJF2BsT8l2SI2NElCAM1oNI7n061r7bfQc-7zY', 28, 1);
INSERT INTO `tbl_notification_token_device` VALUES (76, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 29, 1);
INSERT INTO `tbl_notification_token_device` VALUES (77, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 29, 0);
INSERT INTO `tbl_notification_token_device` VALUES (78, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 30, 1);
INSERT INTO `tbl_notification_token_device` VALUES (79, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 30, 0);
INSERT INTO `tbl_notification_token_device` VALUES (80, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 31, 1);
INSERT INTO `tbl_notification_token_device` VALUES (81, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 31, 1);
INSERT INTO `tbl_notification_token_device` VALUES (82, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 32, 1);
INSERT INTO `tbl_notification_token_device` VALUES (83, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 32, 1);
INSERT INTO `tbl_notification_token_device` VALUES (84, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 33, 1);
INSERT INTO `tbl_notification_token_device` VALUES (85, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 33, 1);
INSERT INTO `tbl_notification_token_device` VALUES (86, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 34, 1);
INSERT INTO `tbl_notification_token_device` VALUES (87, 'deHk4TaHQjerZ4j-o0lbis:APA91bHMvVZjDTYE5LXyyNWBIIYGGWtBNiZnP_1RRLQRDL33Q0jXdUE9CsZWCyWeL4jFwEd74clS7vZ0smBiZFWU4Wdit0ULMVpKp1MIwek7CB4JOZm3Z7-Vw87vO4xj7lojzoITIGWN', 34, 1);
INSERT INTO `tbl_notification_token_device` VALUES (88, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 35, 1);
INSERT INTO `tbl_notification_token_device` VALUES (89, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 36, 1);
INSERT INTO `tbl_notification_token_device` VALUES (90, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 37, 1);
INSERT INTO `tbl_notification_token_device` VALUES (91, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 38, 1);
INSERT INTO `tbl_notification_token_device` VALUES (92, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 39, 1);
INSERT INTO `tbl_notification_token_device` VALUES (93, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 40, 1);
INSERT INTO `tbl_notification_token_device` VALUES (94, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 41, 1);
INSERT INTO `tbl_notification_token_device` VALUES (95, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 42, 1);
INSERT INTO `tbl_notification_token_device` VALUES (96, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 43, 1);
INSERT INTO `tbl_notification_token_device` VALUES (97, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 44, 1);
INSERT INTO `tbl_notification_token_device` VALUES (98, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 45, 1);
INSERT INTO `tbl_notification_token_device` VALUES (99, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 46, 1);
INSERT INTO `tbl_notification_token_device` VALUES (100, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 47, 1);
INSERT INTO `tbl_notification_token_device` VALUES (101, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 48, 1);
INSERT INTO `tbl_notification_token_device` VALUES (102, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 49, 1);
INSERT INTO `tbl_notification_token_device` VALUES (103, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 50, 1);
INSERT INTO `tbl_notification_token_device` VALUES (104, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 51, 1);
INSERT INTO `tbl_notification_token_device` VALUES (105, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 52, 1);
INSERT INTO `tbl_notification_token_device` VALUES (106, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 53, 1);
INSERT INTO `tbl_notification_token_device` VALUES (107, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 54, 1);
INSERT INTO `tbl_notification_token_device` VALUES (108, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 55, 1);
INSERT INTO `tbl_notification_token_device` VALUES (109, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 56, 0);
INSERT INTO `tbl_notification_token_device` VALUES (110, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 57, 1);
INSERT INTO `tbl_notification_token_device` VALUES (111, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 58, 1);
INSERT INTO `tbl_notification_token_device` VALUES (112, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 59, 0);
INSERT INTO `tbl_notification_token_device` VALUES (113, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 60, 1);
INSERT INTO `tbl_notification_token_device` VALUES (114, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 61, 1);
INSERT INTO `tbl_notification_token_device` VALUES (115, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 62, 1);
INSERT INTO `tbl_notification_token_device` VALUES (116, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 63, 1);
INSERT INTO `tbl_notification_token_device` VALUES (117, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 64, 0);
INSERT INTO `tbl_notification_token_device` VALUES (118, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 65, 1);
INSERT INTO `tbl_notification_token_device` VALUES (119, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 66, 1);
INSERT INTO `tbl_notification_token_device` VALUES (120, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 67, 0);
INSERT INTO `tbl_notification_token_device` VALUES (121, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 68, 0);
INSERT INTO `tbl_notification_token_device` VALUES (122, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 69, 0);
INSERT INTO `tbl_notification_token_device` VALUES (123, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 70, 1);
INSERT INTO `tbl_notification_token_device` VALUES (124, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 71, 1);
INSERT INTO `tbl_notification_token_device` VALUES (125, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 71, 0);
INSERT INTO `tbl_notification_token_device` VALUES (126, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 72, 1);
INSERT INTO `tbl_notification_token_device` VALUES (127, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 72, 1);
INSERT INTO `tbl_notification_token_device` VALUES (128, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 73, 1);
INSERT INTO `tbl_notification_token_device` VALUES (129, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 73, 0);
INSERT INTO `tbl_notification_token_device` VALUES (130, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 74, 1);
INSERT INTO `tbl_notification_token_device` VALUES (131, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 74, 1);
INSERT INTO `tbl_notification_token_device` VALUES (132, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 75, 1);
INSERT INTO `tbl_notification_token_device` VALUES (133, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 75, 1);
INSERT INTO `tbl_notification_token_device` VALUES (134, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 76, 1);
INSERT INTO `tbl_notification_token_device` VALUES (135, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 76, 0);
INSERT INTO `tbl_notification_token_device` VALUES (136, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 77, 1);
INSERT INTO `tbl_notification_token_device` VALUES (137, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 77, 1);
INSERT INTO `tbl_notification_token_device` VALUES (138, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 78, 1);
INSERT INTO `tbl_notification_token_device` VALUES (139, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 78, 0);
INSERT INTO `tbl_notification_token_device` VALUES (140, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 79, 1);
INSERT INTO `tbl_notification_token_device` VALUES (141, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 79, 0);
INSERT INTO `tbl_notification_token_device` VALUES (142, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 80, 1);
INSERT INTO `tbl_notification_token_device` VALUES (143, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 80, 1);
INSERT INTO `tbl_notification_token_device` VALUES (144, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 81, 1);
INSERT INTO `tbl_notification_token_device` VALUES (145, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 81, 0);
INSERT INTO `tbl_notification_token_device` VALUES (146, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 82, 1);
INSERT INTO `tbl_notification_token_device` VALUES (147, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 82, 1);
INSERT INTO `tbl_notification_token_device` VALUES (148, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 83, 1);
INSERT INTO `tbl_notification_token_device` VALUES (149, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 83, 1);
INSERT INTO `tbl_notification_token_device` VALUES (150, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 84, 1);
INSERT INTO `tbl_notification_token_device` VALUES (151, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 84, 1);
INSERT INTO `tbl_notification_token_device` VALUES (152, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 85, 1);
INSERT INTO `tbl_notification_token_device` VALUES (153, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 85, 1);
INSERT INTO `tbl_notification_token_device` VALUES (154, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 86, 1);
INSERT INTO `tbl_notification_token_device` VALUES (155, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 86, 1);
INSERT INTO `tbl_notification_token_device` VALUES (156, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 87, 1);
INSERT INTO `tbl_notification_token_device` VALUES (157, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 87, 1);
INSERT INTO `tbl_notification_token_device` VALUES (158, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 88, 1);
INSERT INTO `tbl_notification_token_device` VALUES (159, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 88, 1);
INSERT INTO `tbl_notification_token_device` VALUES (160, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 89, 1);
INSERT INTO `tbl_notification_token_device` VALUES (161, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 89, 1);
INSERT INTO `tbl_notification_token_device` VALUES (162, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 90, 1);
INSERT INTO `tbl_notification_token_device` VALUES (163, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 90, 1);
INSERT INTO `tbl_notification_token_device` VALUES (164, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 91, 1);
INSERT INTO `tbl_notification_token_device` VALUES (165, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 91, 1);
INSERT INTO `tbl_notification_token_device` VALUES (166, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 92, 1);
INSERT INTO `tbl_notification_token_device` VALUES (167, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 92, 0);
INSERT INTO `tbl_notification_token_device` VALUES (168, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 93, 1);
INSERT INTO `tbl_notification_token_device` VALUES (169, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 93, 1);
INSERT INTO `tbl_notification_token_device` VALUES (170, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 94, 1);
INSERT INTO `tbl_notification_token_device` VALUES (171, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 94, 1);
INSERT INTO `tbl_notification_token_device` VALUES (172, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 95, 1);
INSERT INTO `tbl_notification_token_device` VALUES (173, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 95, 1);
INSERT INTO `tbl_notification_token_device` VALUES (174, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 96, 1);
INSERT INTO `tbl_notification_token_device` VALUES (175, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 96, 1);
INSERT INTO `tbl_notification_token_device` VALUES (176, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 97, 1);
INSERT INTO `tbl_notification_token_device` VALUES (177, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 97, 1);
INSERT INTO `tbl_notification_token_device` VALUES (178, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 98, 1);
INSERT INTO `tbl_notification_token_device` VALUES (179, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 98, 1);
INSERT INTO `tbl_notification_token_device` VALUES (180, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 99, 0);
INSERT INTO `tbl_notification_token_device` VALUES (181, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 99, 1);
INSERT INTO `tbl_notification_token_device` VALUES (182, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 100, 1);
INSERT INTO `tbl_notification_token_device` VALUES (183, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 100, 1);
INSERT INTO `tbl_notification_token_device` VALUES (184, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 101, 1);
INSERT INTO `tbl_notification_token_device` VALUES (185, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 101, 1);
INSERT INTO `tbl_notification_token_device` VALUES (186, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 102, 1);
INSERT INTO `tbl_notification_token_device` VALUES (187, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 102, 1);
INSERT INTO `tbl_notification_token_device` VALUES (188, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 103, 0);
INSERT INTO `tbl_notification_token_device` VALUES (189, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 103, 1);
INSERT INTO `tbl_notification_token_device` VALUES (190, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 104, 0);
INSERT INTO `tbl_notification_token_device` VALUES (191, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 104, 1);
INSERT INTO `tbl_notification_token_device` VALUES (192, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 105, 1);
INSERT INTO `tbl_notification_token_device` VALUES (193, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 105, 1);
INSERT INTO `tbl_notification_token_device` VALUES (194, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 106, 1);
INSERT INTO `tbl_notification_token_device` VALUES (195, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 106, 1);
INSERT INTO `tbl_notification_token_device` VALUES (196, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 107, 0);
INSERT INTO `tbl_notification_token_device` VALUES (197, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 107, 1);
INSERT INTO `tbl_notification_token_device` VALUES (198, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 108, 1);
INSERT INTO `tbl_notification_token_device` VALUES (199, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 108, 1);
INSERT INTO `tbl_notification_token_device` VALUES (200, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 109, 1);
INSERT INTO `tbl_notification_token_device` VALUES (201, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 109, 1);
INSERT INTO `tbl_notification_token_device` VALUES (202, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 110, 0);
INSERT INTO `tbl_notification_token_device` VALUES (203, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 110, 1);
INSERT INTO `tbl_notification_token_device` VALUES (204, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 111, 1);
INSERT INTO `tbl_notification_token_device` VALUES (205, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 111, 1);
INSERT INTO `tbl_notification_token_device` VALUES (206, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 112, 1);
INSERT INTO `tbl_notification_token_device` VALUES (207, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 112, 1);
INSERT INTO `tbl_notification_token_device` VALUES (208, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 113, 1);
INSERT INTO `tbl_notification_token_device` VALUES (209, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 113, 1);
INSERT INTO `tbl_notification_token_device` VALUES (210, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 114, 1);
INSERT INTO `tbl_notification_token_device` VALUES (211, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 114, 1);
INSERT INTO `tbl_notification_token_device` VALUES (212, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 115, 0);
INSERT INTO `tbl_notification_token_device` VALUES (213, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 115, 1);
INSERT INTO `tbl_notification_token_device` VALUES (214, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 116, 1);
INSERT INTO `tbl_notification_token_device` VALUES (215, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 116, 1);
INSERT INTO `tbl_notification_token_device` VALUES (216, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 117, 0);
INSERT INTO `tbl_notification_token_device` VALUES (217, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 117, 1);
INSERT INTO `tbl_notification_token_device` VALUES (218, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 118, 1);
INSERT INTO `tbl_notification_token_device` VALUES (219, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 118, 1);
INSERT INTO `tbl_notification_token_device` VALUES (220, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 119, 1);
INSERT INTO `tbl_notification_token_device` VALUES (221, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 119, 1);
INSERT INTO `tbl_notification_token_device` VALUES (222, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 120, 1);
INSERT INTO `tbl_notification_token_device` VALUES (223, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 120, 1);
INSERT INTO `tbl_notification_token_device` VALUES (224, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 121, 1);
INSERT INTO `tbl_notification_token_device` VALUES (225, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 121, 1);
INSERT INTO `tbl_notification_token_device` VALUES (226, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 122, 1);
INSERT INTO `tbl_notification_token_device` VALUES (227, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 122, 1);
INSERT INTO `tbl_notification_token_device` VALUES (228, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 123, 1);
INSERT INTO `tbl_notification_token_device` VALUES (229, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 123, 1);
INSERT INTO `tbl_notification_token_device` VALUES (230, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 124, 1);
INSERT INTO `tbl_notification_token_device` VALUES (231, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 124, 1);
INSERT INTO `tbl_notification_token_device` VALUES (232, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 125, 1);
INSERT INTO `tbl_notification_token_device` VALUES (233, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 125, 1);
INSERT INTO `tbl_notification_token_device` VALUES (234, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 126, 1);
INSERT INTO `tbl_notification_token_device` VALUES (235, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 126, 1);
INSERT INTO `tbl_notification_token_device` VALUES (236, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 127, 1);
INSERT INTO `tbl_notification_token_device` VALUES (237, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 127, 1);
INSERT INTO `tbl_notification_token_device` VALUES (238, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 128, 1);
INSERT INTO `tbl_notification_token_device` VALUES (239, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 128, 1);
INSERT INTO `tbl_notification_token_device` VALUES (240, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 129, 1);
INSERT INTO `tbl_notification_token_device` VALUES (241, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 129, 1);
INSERT INTO `tbl_notification_token_device` VALUES (242, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 130, 1);
INSERT INTO `tbl_notification_token_device` VALUES (243, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 130, 1);
INSERT INTO `tbl_notification_token_device` VALUES (244, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 131, 0);
INSERT INTO `tbl_notification_token_device` VALUES (245, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 131, 1);
INSERT INTO `tbl_notification_token_device` VALUES (246, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 132, 0);
INSERT INTO `tbl_notification_token_device` VALUES (247, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 132, 1);
INSERT INTO `tbl_notification_token_device` VALUES (248, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 133, 0);
INSERT INTO `tbl_notification_token_device` VALUES (249, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 133, 1);
INSERT INTO `tbl_notification_token_device` VALUES (250, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 134, 1);
INSERT INTO `tbl_notification_token_device` VALUES (251, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 134, 1);
INSERT INTO `tbl_notification_token_device` VALUES (252, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 135, 1);
INSERT INTO `tbl_notification_token_device` VALUES (253, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 135, 1);
INSERT INTO `tbl_notification_token_device` VALUES (254, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 136, 0);
INSERT INTO `tbl_notification_token_device` VALUES (255, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 136, 1);
INSERT INTO `tbl_notification_token_device` VALUES (256, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 137, 1);
INSERT INTO `tbl_notification_token_device` VALUES (257, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 137, 1);
INSERT INTO `tbl_notification_token_device` VALUES (258, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 138, 1);
INSERT INTO `tbl_notification_token_device` VALUES (259, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 138, 1);
INSERT INTO `tbl_notification_token_device` VALUES (260, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 139, 0);
INSERT INTO `tbl_notification_token_device` VALUES (261, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 139, 1);
INSERT INTO `tbl_notification_token_device` VALUES (262, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 140, 0);
INSERT INTO `tbl_notification_token_device` VALUES (263, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 140, 1);
INSERT INTO `tbl_notification_token_device` VALUES (264, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 141, 0);
INSERT INTO `tbl_notification_token_device` VALUES (265, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 141, 1);
INSERT INTO `tbl_notification_token_device` VALUES (266, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 142, 1);
INSERT INTO `tbl_notification_token_device` VALUES (267, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 142, 1);
INSERT INTO `tbl_notification_token_device` VALUES (268, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 143, 1);
INSERT INTO `tbl_notification_token_device` VALUES (269, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 143, 1);
INSERT INTO `tbl_notification_token_device` VALUES (270, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 144, 0);
INSERT INTO `tbl_notification_token_device` VALUES (271, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 144, 1);
INSERT INTO `tbl_notification_token_device` VALUES (272, 'fpco9OJ9TA-OYFZz6bPuNN:APA91bGLN4do6m4Iku9_K7N0xCQ0gccHxiaUSvMhnd9sbVYu8qmw92jgDC4G_-NORoYGJXpVtppqFHZhdQGdkyFu5iGgxA2wZeBtH0MD69NniEbMx679NZpAwKWZH385bCjC2ZouSN8A', 145, 1);
INSERT INTO `tbl_notification_token_device` VALUES (273, 'e6UVdBXxSDeiHwn16uBXfh:APA91bHQ_EVLqnUKOoUK-P2Yp5C9MiokBdALBRWHSTyMz7MRjCnL7nxcUcAogc9JE7FL2fucXSJcAAF-lyFhKlAjJY8N0P3hjRecOq0EnSkGzREe7gEfWGq5-PoSxvovgOhC_ZRIpaMT', 145, 1);
INSERT INTO `tbl_notification_token_device` VALUES (274, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 146, 0);
INSERT INTO `tbl_notification_token_device` VALUES (275, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 147, 1);
INSERT INTO `tbl_notification_token_device` VALUES (276, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 149, 1);
INSERT INTO `tbl_notification_token_device` VALUES (277, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 150, 1);
INSERT INTO `tbl_notification_token_device` VALUES (278, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 151, 0);
INSERT INTO `tbl_notification_token_device` VALUES (279, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 152, 0);
INSERT INTO `tbl_notification_token_device` VALUES (280, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 153, 1);
INSERT INTO `tbl_notification_token_device` VALUES (281, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 154, 0);
INSERT INTO `tbl_notification_token_device` VALUES (282, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', 155, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_parents_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_parents_user`;
CREATE TABLE `tbl_parents_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_parent_create_by_user` (`createby`) USING BTREE,
  KEY `fk_parent_modify_by_user` (`modifyby`) USING BTREE,
  KEY `fk_parent_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_parents_user
-- ----------------------------
BEGIN;
INSERT INTO `tbl_parents_user` VALUES (1, 'Romdos Doeur', 'រំដោះ ឌឿ', '1', '22', '012334455', 1, 'https://static.vecteezy.com/system/resources/previews/000/376/355/original/user-management-vector-icon.jpg', '2022-08-16 12:53:02', 1, '2022-08-16 12:53:08', 1);
INSERT INTO `tbl_parents_user` VALUES (2, 'Hong Sothy', 'ហុង សុធី', '011223344', '123', '011223344', 1, 'https://static.vecteezy.com/system/resources/previews/000/376/355/original/user-management-vector-icon.jpg', '2022-08-16 13:01:47', 1, '2022-08-16 13:01:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_partners
-- ----------------------------
DROP TABLE IF EXISTS `tbl_partners`;
CREATE TABLE `tbl_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_partners_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_partners_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_partners
-- ----------------------------
BEGIN;
INSERT INTO `tbl_partners` VALUES (1, 'https://fbis.edu.kh/images/partner/6.png', '2022-08-11 13:01:41', 1);
INSERT INTO `tbl_partners` VALUES (2, 'https://fbis.edu.kh/images/partner/5.png', '2022-08-11 13:01:56', 1);
INSERT INTO `tbl_partners` VALUES (3, 'https://fbis.edu.kh/images/partner/4.png', '2022-08-11 13:17:00', 1);
INSERT INTO `tbl_partners` VALUES (4, 'https://fbis.edu.kh/images/partner/3.png', '2022-08-11 15:34:13', 1);
INSERT INTO `tbl_partners` VALUES (5, 'https://fbis.edu.kh/images/partner/2.png', '2022-08-11 15:34:24', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_pay_for
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay_for`;
CREATE TABLE `tbl_pay_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_for_kh` varchar(255) DEFAULT NULL,
  `pay_for_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_races
-- ----------------------------
DROP TABLE IF EXISTS `tbl_races`;
CREATE TABLE `tbl_races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `name_kh` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_reasons
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reasons`;
CREATE TABLE `tbl_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_en` varchar(255) DEFAULT NULL,
  `reason_kh` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_reasons
-- ----------------------------
BEGIN;
INSERT INTO `tbl_reasons` VALUES (1, 'Do not listen to the teacher', 'មិនស្ដាប់លោកគ្រូបង្រៀន', 1, 1, 1, '2022-08-23 22:58:36', 1);
INSERT INTO `tbl_reasons` VALUES (2, 'Chat in class while studying', 'ជជែកគ្នាក្នុងថ្នាក់ពេលកំពុងរៀន', 1, 2, 1, '2022-08-23 22:59:35', 1);
INSERT INTO `tbl_reasons` VALUES (3, 'Null', 'វាយគ្នាបែកបាក់សម្ភារៈសាលា', 1, 3, 1, '2022-08-23 23:00:26', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_registered_device_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_registered_device_token`;
CREATE TABLE `tbl_registered_device_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_token` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_registered_device_token
-- ----------------------------
BEGIN;
INSERT INTO `tbl_registered_device_token` VALUES (1, 'eK8ujoouSi6qchcBtIesuv:APA91bHLWCxpmbYlmlmAJueAj8tmy1VQb3KtsjgcpT7sn2rsYVCyCT4Ts1aCDPzvokF84b5UqCUi90LdoYUZA8lfhew06OSu9iSt-Kg11aLOAGUEjyjxO55cOrc5tn62JJj-uKUnVnm4', '2022-11-03 09:59:40');
COMMIT;

-- ----------------------------
-- Table structure for tbl_registration
-- ----------------------------
DROP TABLE IF EXISTS `tbl_registration`;
CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_kh` varchar(255) DEFAULT NULL,
  `old_school` varchar(255) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `study_time` int(11) DEFAULT NULL,
  `form_id` varchar(11) DEFAULT NULL,
  `is_new` int(11) DEFAULT NULL,
  `stu_id` varchar(255) DEFAULT NULL,
  `advisor` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `post_by` int(11) DEFAULT NULL,
  `pay_for` int(11) DEFAULT NULL,
  `edu_level` int(255) DEFAULT NULL,
  `old_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_registration_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_registration_status`;
CREATE TABLE `tbl_registration_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_kh` varchar(255) DEFAULT NULL,
  `status_en` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_report_field
-- ----------------------------
DROP TABLE IF EXISTS `tbl_report_field`;
CREATE TABLE `tbl_report_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_report_fieldlist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_report_fieldlist`;
CREATE TABLE `tbl_report_fieldlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `alignment` varchar(10) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_report_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_report_group`;
CREATE TABLE `tbl_report_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `name_kh` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_report_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_report_type`;
CREATE TABLE `tbl_report_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `name_kh` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_rooms
-- ----------------------------
DROP TABLE IF EXISTS `tbl_rooms`;
CREATE TABLE `tbl_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_en` varchar(255) DEFAULT NULL,
  `room_kh` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_rooms
-- ----------------------------
BEGIN;
INSERT INTO `tbl_rooms` VALUES (1, 'Angkor Wat', 'ប្រាសាទអង្គរវត្ត', 1, 1, '2022-08-22 10:18:56', 1);
INSERT INTO `tbl_rooms` VALUES (2, 'Neak Poan', 'ប្រាសាទនាគព័ន្ធ', 2, 1, '2022-08-22 10:19:16', 1);
INSERT INTO `tbl_rooms` VALUES (3, 'Cambodia', 'ប្រទេសកម្ពុជា', 3, 1, '2022-08-22 10:19:38', 1);
INSERT INTO `tbl_rooms` VALUES (4, 'Siem Reap', 'ខេត្តសៀមរាប', 4, 1, '2022-08-22 10:20:14', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_schedule_details
-- ----------------------------
DROP TABLE IF EXISTS `tbl_schedule_details`;
CREATE TABLE `tbl_schedule_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) DEFAULT NULL,
  `study_hour` int(11) DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL,
  `is_event` int(11) DEFAULT NULL,
  `event_desc` varchar(255) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule_id` (`schedule_id`,`study_hour`,`weekday`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_schedule_details
-- ----------------------------
BEGIN;
INSERT INTO `tbl_schedule_details` VALUES (1, 1, 1, 1, 0, NULL, 5, 1, 1, '2022-09-13 11:51:06', 1);
INSERT INTO `tbl_schedule_details` VALUES (2, 1, 2, 1, 0, NULL, 10, NULL, 1, '2022-09-13 12:09:35', 1);
INSERT INTO `tbl_schedule_details` VALUES (3, 1, 3, 1, 0, NULL, 11, 2, 1, '2022-09-13 11:51:06', 1);
INSERT INTO `tbl_schedule_details` VALUES (4, 1, 4, 1, 0, NULL, 8, 3, 1, '2022-09-13 10:55:19', 1);
INSERT INTO `tbl_schedule_details` VALUES (5, 1, 5, 1, 0, NULL, 8, 3, 1, '2022-09-13 10:55:19', 1);
INSERT INTO `tbl_schedule_details` VALUES (6, 1, 6, 1, 0, NULL, 12, 4, 1, '2022-09-13 10:56:01', 1);
INSERT INTO `tbl_schedule_details` VALUES (7, 1, 7, 1, 0, NULL, 12, 4, 1, '2022-09-13 10:56:01', 1);
INSERT INTO `tbl_schedule_details` VALUES (8, 1, 8, 1, 0, NULL, 13, NULL, 1, '2022-09-13 12:11:52', 1);
INSERT INTO `tbl_schedule_details` VALUES (9, 1, 1, 2, 0, NULL, 3, 5, 1, '2022-09-13 10:29:06', NULL);
INSERT INTO `tbl_schedule_details` VALUES (10, 1, 2, 2, 0, NULL, 3, 5, 1, NULL, NULL);
INSERT INTO `tbl_schedule_details` VALUES (11, 1, 3, 2, 0, NULL, 1, 6, 1, NULL, NULL);
INSERT INTO `tbl_schedule_details` VALUES (12, 1, 4, 2, 0, NULL, 1, 6, 1, NULL, NULL);
INSERT INTO `tbl_schedule_details` VALUES (13, 1, 5, 2, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (14, 1, 6, 2, 0, NULL, 6, 7, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (15, 1, 7, 2, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (16, 1, 8, 2, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (17, 1, 1, 3, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (18, 1, 2, 3, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (19, 1, 3, 3, 0, NULL, 7, 10, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (20, 1, 4, 3, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (21, 1, 5, 3, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (22, 1, 6, 3, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (23, 1, 7, 3, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (24, 1, 8, 3, 0, NULL, 13, NULL, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (25, 1, 1, 4, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (26, 1, 2, 4, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (27, 1, 3, 4, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (28, 1, 4, 4, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (29, 1, 5, 4, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (30, 1, 6, 4, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (31, 1, 7, 4, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (32, 1, 8, 4, 0, NULL, 14, NULL, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (33, 1, 1, 5, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (34, 1, 2, 5, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (35, 1, 3, 5, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (36, 1, 4, 5, 0, NULL, 5, 1, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (37, 1, 5, 5, 0, NULL, 5, 1, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (38, 1, 6, 5, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (39, 1, 7, 5, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (40, 1, 8, 5, 0, NULL, 7, 10, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (41, 1, 1, 6, 0, NULL, 5, 1, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (42, 1, 2, 6, 0, NULL, 10, NULL, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (43, 1, 3, 6, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (44, 1, 4, 6, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (45, 1, 5, 6, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (46, 1, 6, 6, 0, NULL, 6, 7, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (47, 1, 7, 6, 0, NULL, 9, 11, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (48, 1, 8, 6, 0, NULL, 9, 11, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (49, 2, 1, 2, NULL, NULL, 5, 1, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (50, 2, 2, 2, NULL, NULL, 10, 2, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (51, 2, 3, 2, NULL, NULL, 11, 2, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (52, 2, 4, 2, NULL, NULL, 8, 3, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (53, 2, 5, 2, NULL, NULL, 8, 3, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (54, 2, 6, 2, NULL, NULL, 12, 4, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (55, 2, 7, 2, NULL, NULL, 12, 4, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (56, 2, 8, 2, NULL, NULL, 13, 6, 2, '2022-09-13 12:47:29', NULL);
INSERT INTO `tbl_schedule_details` VALUES (57, 2, 1, 3, 0, NULL, 5, 1, 1, '2022-09-13 13:32:53', NULL);
INSERT INTO `tbl_schedule_details` VALUES (58, 2, 2, 3, 0, NULL, 10, NULL, 1, '2022-09-13 13:32:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (59, 2, 3, 3, 0, NULL, 1, 6, 1, '2022-09-13 13:32:56', NULL);
INSERT INTO `tbl_schedule_details` VALUES (60, 2, 4, 3, 0, NULL, 1, 6, 1, '2022-09-13 13:32:57', NULL);
INSERT INTO `tbl_schedule_details` VALUES (61, 2, 5, 3, 0, NULL, 1, 6, 1, '2022-09-13 13:32:58', NULL);
INSERT INTO `tbl_schedule_details` VALUES (62, 2, 6, 3, 0, NULL, 6, 7, 1, '2022-09-13 13:33:00', NULL);
INSERT INTO `tbl_schedule_details` VALUES (63, 2, 7, 3, 0, NULL, 9, 11, 1, '2022-09-13 13:33:01', NULL);
INSERT INTO `tbl_schedule_details` VALUES (64, 2, 8, 3, 0, NULL, 9, 11, 1, '2022-09-13 13:33:05', NULL);
INSERT INTO `tbl_schedule_details` VALUES (65, 2, 1, 1, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (66, 2, 2, 1, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (67, 2, 3, 1, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (68, 2, 4, 1, 0, NULL, 5, 1, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (69, 2, 5, 1, 0, NULL, 5, 1, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (70, 2, 6, 1, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (71, 2, 7, 1, 0, NULL, 12, 4, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (72, 2, 8, 1, 0, NULL, 7, 10, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (73, 2, 1, 6, 0, NULL, 4, 9, 1, '2022-09-13 13:33:08', NULL);
INSERT INTO `tbl_schedule_details` VALUES (74, 2, 2, 6, 0, NULL, 4, 9, 1, '2022-09-13 13:33:10', NULL);
INSERT INTO `tbl_schedule_details` VALUES (75, 2, 3, 6, 0, NULL, 7, 5, 1, '2022-09-13 13:33:11', NULL);
INSERT INTO `tbl_schedule_details` VALUES (76, 2, 4, 6, 0, NULL, 1, 6, 1, '2022-09-13 13:33:12', NULL);
INSERT INTO `tbl_schedule_details` VALUES (77, 2, 5, 6, 0, NULL, 1, 6, 1, '2022-09-13 13:33:13', NULL);
INSERT INTO `tbl_schedule_details` VALUES (78, 2, 6, 6, 0, NULL, 12, 8, 1, '2022-09-13 13:33:14', NULL);
INSERT INTO `tbl_schedule_details` VALUES (79, 2, 7, 6, 0, NULL, 12, 8, 1, '2022-09-13 13:33:15', NULL);
INSERT INTO `tbl_schedule_details` VALUES (80, 2, 8, 6, 0, NULL, 13, NULL, 1, '2022-09-13 13:33:18', NULL);
INSERT INTO `tbl_schedule_details` VALUES (81, 2, 1, 5, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (82, 2, 2, 5, 0, NULL, 4, 9, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (83, 2, 3, 5, 0, NULL, 3, 5, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (84, 2, 4, 5, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (85, 2, 5, 5, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (86, 2, 6, 5, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (87, 2, 7, 5, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (88, 2, 8, 5, 0, NULL, 14, NULL, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (89, 2, 1, 4, 0, NULL, 3, 5, 1, '2022-09-13 10:29:06', NULL);
INSERT INTO `tbl_schedule_details` VALUES (90, 2, 2, 4, 0, NULL, 3, 5, 1, '2022-09-13 10:29:06', NULL);
INSERT INTO `tbl_schedule_details` VALUES (91, 2, 3, 4, 0, NULL, 1, 6, 1, '2022-09-13 10:29:06', NULL);
INSERT INTO `tbl_schedule_details` VALUES (92, 2, 4, 4, 0, NULL, 1, 6, 1, '2022-09-13 10:29:06', NULL);
INSERT INTO `tbl_schedule_details` VALUES (93, 2, 5, 4, 0, NULL, 1, 6, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (94, 2, 6, 4, 0, NULL, 6, 7, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (95, 2, 7, 4, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
INSERT INTO `tbl_schedule_details` VALUES (96, 2, 8, 4, 0, NULL, 2, 8, 1, '2022-09-13 11:52:55', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_schedules
-- ----------------------------
DROP TABLE IF EXISTS `tbl_schedules`;
CREATE TABLE `tbl_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_schedules
-- ----------------------------
BEGIN;
INSERT INTO `tbl_schedules` VALUES (1, 'ថ្នាក់ទី១២ក', '2021-09-12', '2022-09-12', 1, 1, 1, '2021-09-12 16:35:07', 1, '2022-09-12 16:35:15', 1);
INSERT INTO `tbl_schedules` VALUES (2, 'ថ្នាក់ទី១២ខ', '2021-09-12', '2022-09-12', 1, 1, 2, '2021-09-12 16:35:07', 1, '2022-09-12 16:35:15', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_score_meaning
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score_meaning`;
CREATE TABLE `tbl_score_meaning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score_from` decimal(11,2) DEFAULT NULL,
  `score_to` decimal(11,2) DEFAULT NULL,
  `mention` varchar(255) DEFAULT '',
  `edu_level` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_score_meaning
-- ----------------------------
BEGIN;
INSERT INTO `tbl_score_meaning` VALUES (1, 0.00, 236.00, 'F', 4, '2022-08-26 18:04:17', 1);
INSERT INTO `tbl_score_meaning` VALUES (2, 237.00, 284.00, 'E', 4, '2022-08-26 18:04:19', 1);
INSERT INTO `tbl_score_meaning` VALUES (6, 428.00, 475.00, 'A', 4, '2022-09-19 00:16:59', 1);
INSERT INTO `tbl_score_meaning` VALUES (3, 285.00, 331.00, 'D', 4, '2022-08-26 18:07:17', 1);
INSERT INTO `tbl_score_meaning` VALUES (4, 332.00, 379.00, 'C', 4, '2022-08-26 18:07:43', 1);
INSERT INTO `tbl_score_meaning` VALUES (5, 380.00, 427.00, 'B', 4, '2022-08-26 18:10:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_slides
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slides`;
CREATE TABLE `tbl_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_slide` varchar(255) DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_slides_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_slides_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_slides
-- ----------------------------
BEGIN;
INSERT INTO `tbl_slides` VALUES (1, 'https://www.thoughtco.com/thmb/EWFL8eWB2NX6N1fe2VrAT8FIKyw=/4571x2571/smart/filters:no_upscale()/low-memorial-library-at-columbia-university-in-new-york-city-471491031-d6f0853dd28d456eaf6425f179c5fb1f.jpg', 1, '2022-08-10 15:10:16', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_staff_education
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_education`;
CREATE TABLE `tbl_staff_education` (
  `id` int(11) NOT NULL,
  `degree` int(11) DEFAULT NULL,
  `major` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `thesis_title` varchar(255) DEFAULT NULL,
  `staff` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_staff_exp_rec
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_exp_rec`;
CREATE TABLE `tbl_staff_exp_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `until` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `staff` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_staff_experience
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_experience`;
CREATE TABLE `tbl_staff_experience` (
  `id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `staff` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_staff_files_upload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_files_upload`;
CREATE TABLE `tbl_staff_files_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_staff_job_pos
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_job_pos`;
CREATE TABLE `tbl_staff_job_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `occupation` int(11) DEFAULT NULL,
  `announce_by` int(11) DEFAULT NULL,
  `work_condition` int(11) DEFAULT NULL,
  `work_type` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `in_charge_of` varchar(255) DEFAULT NULL,
  `staff` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_staff_job_pos
-- ----------------------------
BEGIN;
INSERT INTO `tbl_staff_job_pos` VALUES (1, 2, 1, 2, 1, 1, '2022-09-21', '2023-09-21', 'NULL', '1');
INSERT INTO `tbl_staff_job_pos` VALUES (2, 1, 1, 2, 1, 1, '2022-09-26', '2022-09-26', 'NULL', '3');
COMMIT;

-- ----------------------------
-- Table structure for tbl_staff_study_rec
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_study_rec`;
CREATE TABLE `tbl_staff_study_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_edu_level` int(11) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `country` int(255) DEFAULT NULL,
  `year_start` varchar(255) DEFAULT NULL,
  `year_end` varchar(255) DEFAULT NULL,
  `thesis_title` varchar(255) DEFAULT NULL,
  `staff` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_staffs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staffs`;
CREATE TABLE `tbl_staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `identity_no` varchar(255) DEFAULT NULL,
  `identity_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `pob_home_no` varchar(255) DEFAULT NULL,
  `pob_street_no` varchar(255) DEFAULT NULL,
  `pob_province` varchar(255) DEFAULT NULL,
  `pob_commune` varchar(255) DEFAULT NULL,
  `pob_district` varchar(255) DEFAULT NULL,
  `pob_village` varchar(255) DEFAULT NULL,
  `cur_home_no` varchar(255) DEFAULT NULL,
  `cur_street_no` varchar(255) DEFAULT NULL,
  `cur_province` int(11) DEFAULT NULL,
  `cur_commune` int(11) DEFAULT NULL,
  `cur_district` int(11) DEFAULT NULL,
  `cur_village` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `passport_exp` datetime DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_management` tinyint(1) DEFAULT NULL,
  `is_inspector` tinyint(1) DEFAULT NULL,
  `is_advisor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_staffs
-- ----------------------------
BEGIN;
INSERT INTO `tbl_staffs` VALUES (1, 's1012', 'ណាត វណ្ណៈ', 'NAT Vannak', 1, '2000-01-16', '0715923388', '2022-09-18 16:09:23', 1, '2022-09-18 16:09:23', 1, 1, 1, 1, '1', '2022-08-22', 'natvannak007@gmail.com', 'natvannak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 'Null', 1, 0, 0, 0);
INSERT INTO `tbl_staffs` VALUES (2, '1021', 'វុទ្ធី', 'Vuthy', 1, NULL, '012334455', '2022-09-26 18:11:40', 1, '2022-09-26 18:11:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'vuthy10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, 1, 0, 0);
INSERT INTO `tbl_staffs` VALUES (3, 's1511', 'សាង ជំនោរ', 'Sang Chumno', 1, NULL, '092338899', '2022-09-26 18:11:41', 1, '2022-09-26 18:11:41', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'https://t.me/chumnosang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE `tbl_status` (
  `id` int(255) NOT NULL,
  `status_en` varchar(255) DEFAULT NULL,
  `status_kh` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `for_stu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_status
-- ----------------------------
BEGIN;
INSERT INTO `tbl_status` VALUES (1, 'Active', 'កំពុងសិក្សា', '#00FF00', 0);
INSERT INTO `tbl_status` VALUES (2, 'Stop', 'ឈប់រៀន', '#FF0000', 0);
INSERT INTO `tbl_status` VALUES (3, 'Working', 'កំពុងធ្វើការ', '#FF0011', 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_discipline
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_discipline`;
CREATE TABLE `tbl_student_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reason` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `promise_date` date DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `tbl_student_discipline_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `tbl_students` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_discipline
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_discipline` VALUES (1, 1, 1, 1, 1, 1, '2022-08-21', 1, 1, '2022-08-23', 'ឈប់ប្រព្រិត្តរឿងបែបនេះទៀតហើយ', '2022-08-23 23:01:23', 1);
INSERT INTO `tbl_student_discipline` VALUES (2, 1, 1, 1, 2, 1, '2022-09-21', 2, 2, '2022-09-13', 'សូមសន្យា', '2022-09-17 16:48:39', 1);
INSERT INTO `tbl_student_discipline` VALUES (3, 1, 2, 2, 1, 2, '2022-08-23', 1, 6, '2022-08-23', 'សូមសន្យា', '2022-08-23 23:35:55', 1);
INSERT INTO `tbl_student_discipline` VALUES (4, 1, 1, 1, 2, 1, '2022-08-23', 1, 0, '2022-08-23', 'សូមសន្យា', '2022-08-23 23:56:04', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_files_upload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_files_upload`;
CREATE TABLE `tbl_student_files_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_student_make_card
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_make_card`;
CREATE TABLE `tbl_student_make_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `edu_level` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `done` int(11) DEFAULT NULL,
  `done_date` date DEFAULT NULL,
  `done_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  CONSTRAINT `tbl_student_make_card_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_students` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_student_monthly_result
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_monthly_result`;
CREATE TABLE `tbl_student_monthly_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `average` decimal(11,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `mention` int(11) DEFAULT NULL,
  `allow_announce` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`,`acad_year`,`grade`,`month`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_monthly_result
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_monthly_result` VALUES (1, 1, 1, 1, 6, 482.00, 43.82, 3, 6, 1, '2022-09-21 18:40:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_monthly_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_monthly_score`;
CREATE TABLE `tbl_student_monthly_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `score` decimal(11,2) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`acad_year`,`grade`,`month`,`subject`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_monthly_score
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_monthly_score` VALUES (1, 1, 1, 1, 6, 1, 120.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (2, 1, 1, 1, 6, 2, 65.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (3, 1, 1, 1, 6, 3, 70.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (4, 1, 1, 1, 6, 4, 69.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (5, 1, 1, 1, 6, 5, 73.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (6, 1, 1, 1, 6, 6, 40.00, '2022-09-19 00:23:03', 1);
INSERT INTO `tbl_student_monthly_score` VALUES (7, 1, 1, 1, 6, 7, 45.00, '2022-09-19 00:23:03', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_parents
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_parents`;
CREATE TABLE `tbl_student_parents` (
  `stu_id` int(11) NOT NULL,
  `parents_id` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_id`,`parents_id`) USING BTREE,
  KEY `fk_parents_user` (`parents_id`) USING BTREE,
  KEY `fk_create_by_user` (`createby`) USING BTREE,
  KEY `fk_modify_by_user` (`modifyby`) USING BTREE,
  KEY `fk_status` (`status`) USING BTREE,
  CONSTRAINT `fk_create_by_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_modify_by_user` FOREIGN KEY (`modifyby`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_parent_student` FOREIGN KEY (`stu_id`) REFERENCES `tbl_students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parents_user` FOREIGN KEY (`parents_id`) REFERENCES `tbl_parents_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status` FOREIGN KEY (`status`) REFERENCES `tbl_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_parents
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_parents` VALUES (1, 1, '2022-09-11 16:29:47', 1, 1, '2022-09-11 16:29:56', 1);
INSERT INTO `tbl_student_parents` VALUES (2, 1, '2022-09-11 16:30:04', 1, 1, '2022-09-11 16:30:10', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_semester_result
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_semester_result`;
CREATE TABLE `tbl_student_semester_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `semester_total` decimal(11,2) DEFAULT NULL,
  `semester_average` decimal(11,2) DEFAULT NULL,
  `semester_rank` int(11) DEFAULT NULL,
  `semester_meaning` int(11) DEFAULT NULL,
  `monthly_average` decimal(11,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `meaning` int(11) DEFAULT NULL,
  `allow_announce` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`,`acad_year`,`grade`,`semester`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_semester_result
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_semester_result` VALUES (1, 1, 1, 1, 1, 589.00, 47.12, 2, 6, 45.92, 2, 1, 1, '2022-09-21 22:58:34', 1);
INSERT INTO `tbl_student_semester_result` VALUES (2, 1, 1, 1, 2, 600.00, 48.00, 1, 6, 48.13, 5, 6, 1, '2022-09-21 23:55:26', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_semester_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_semester_score`;
CREATE TABLE `tbl_student_semester_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `score` decimal(11,2) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`acad_year`,`grade`,`semester`,`subject`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_semester_score
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_semester_score` VALUES (1, 1, 1, 1, 1, 1, 122.00, '2022-09-22 00:26:58', 1);
INSERT INTO `tbl_student_semester_score` VALUES (2, 1, 1, 1, 1, 2, 72.00, '2022-09-22 00:27:13', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_user`;
CREATE TABLE `tbl_student_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_user
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_user` VALUES (1, 'fbis221012', '777', 1, 1);
INSERT INTO `tbl_student_user` VALUES (2, 'fbis221015', '123', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_student_yearly_result
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student_yearly_result`;
CREATE TABLE `tbl_student_yearly_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester_1` decimal(11,2) DEFAULT NULL,
  `semester_2` decimal(11,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `meaning` int(11) DEFAULT NULL,
  `allow_announce` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`,`acad_year`,`grade`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_student_yearly_result
-- ----------------------------
BEGIN;
INSERT INTO `tbl_student_yearly_result` VALUES (1, 1, 1, 1, 48.12, 48.07, 2, 6, 1, '2022-09-22 00:35:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_students
-- ----------------------------
DROP TABLE IF EXISTS `tbl_students`;
CREATE TABLE `tbl_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `old_acadyear` int(11) DEFAULT NULL,
  `old_acadyear_result` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pob` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `english_level` varchar(255) DEFAULT NULL,
  `english_school` varchar(255) DEFAULT NULL,
  `previous_school` varchar(255) DEFAULT NULL,
  `school_address` int(11) DEFAULT NULL,
  `education_level` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `school_year` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `checkedby` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyby` int(11) DEFAULT NULL,
  `deletedate` datetime DEFAULT NULL,
  `deleteby` int(11) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_students
-- ----------------------------
BEGIN;
INSERT INTO `tbl_students` VALUES (1, 'fbis223388', 'NAT Vannak', 'ណាត វណ្ណៈ', 1, 1, 1, 2, 2, '2022-08-23', '0715923388', 'Siem Reap', 'Siem Reap', 'Null', 'Null', NULL, NULL, 4, 1, 1, 1, 1, 2, '2022-08-23', 1, 1, '2022-08-23 09:56:03', 1, '2022-08-23 09:56:08', 1, NULL, NULL, 1, 'https://vsedoramy.net/uploads/mini/fullstory/5a/8c98e6d0e808c550766e467f482fbd.jpg', '0715923388', '123');
INSERT INTO `tbl_students` VALUES (2, 'fbis221012', 'Ly Pich', 'លី ពេជ្រ', 2, 1, 1, 2, 2, '2022-09-11', 'NULL', 'NULL', 'Siem Reap', 'NULL', 'NULL', 'NULL', NULL, 4, 2, 1, 1, 2, 2, '2022-09-11', 1, 1, '2022-09-11 16:29:26', 1, '2022-09-11 16:29:29', 1, NULL, NULL, NULL, 'https://s.isanook.com/mv/0/ui/25/126525/1658119188-8185-th.jpeg', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_students_more_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_students_more_info`;
CREATE TABLE `tbl_students_more_info` (
  `id_student` int(11) NOT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_job` varchar(255) DEFAULT NULL,
  `father_phone` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_job` varchar(255) DEFAULT NULL,
  `mother_phone` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `contact_person_job` varchar(255) DEFAULT NULL,
  `contact_person_phone` varchar(255) DEFAULT NULL,
  `sponsor_name` varchar(255) DEFAULT NULL,
  `sponsor_job` varchar(255) DEFAULT NULL,
  `sponsor_phone` varchar(255) DEFAULT NULL,
  `urgent_name` varchar(255) DEFAULT NULL,
  `urgent_phone` varchar(255) DEFAULT NULL,
  `middle_exam_date` date DEFAULT NULL,
  `middle_exam_school` varchar(255) DEFAULT NULL,
  `middle_table_no` varchar(255) DEFAULT NULL,
  `middle_class_no` varchar(255) DEFAULT NULL,
  `middle_result` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  CONSTRAINT `tbl_students_more_info_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `tbl_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_study_hours
-- ----------------------------
DROP TABLE IF EXISTS `tbl_study_hours`;
CREATE TABLE `tbl_study_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hour_start` time DEFAULT NULL,
  `hour_end` time DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_study_hours
-- ----------------------------
BEGIN;
INSERT INTO `tbl_study_hours` VALUES (1, '07:00:00', '07:50:00', 1, 1);
INSERT INTO `tbl_study_hours` VALUES (2, '08:10:00', '09:00:00', 2, 1);
INSERT INTO `tbl_study_hours` VALUES (3, '09:00:00', '09:50:00', 3, 1);
INSERT INTO `tbl_study_hours` VALUES (4, '10:10:00', '10:00:00', 4, 1);
INSERT INTO `tbl_study_hours` VALUES (5, '11:00:00', '11:50:00', 5, 1);
INSERT INTO `tbl_study_hours` VALUES (6, '14:00:00', '14:50:00', 6, 1);
INSERT INTO `tbl_study_hours` VALUES (7, '15:00:00', '15:50:00', 7, 1);
INSERT INTO `tbl_study_hours` VALUES (8, '16:00:00', '16:50:00', 8, 1);
INSERT INTO `tbl_study_hours` VALUES (9, '17:00:00', '17:50:00', 9, 1);
INSERT INTO `tbl_study_hours` VALUES (10, '18:00:00', '18:50:00', 10, 1);
INSERT INTO `tbl_study_hours` VALUES (11, '19:00:00', '19:50:00', 11, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_study_program
-- ----------------------------
DROP TABLE IF EXISTS `tbl_study_program`;
CREATE TABLE `tbl_study_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_study_program_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_study_program_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_study_program
-- ----------------------------
BEGIN;
INSERT INTO `tbl_study_program` VALUES (1, 'កម្មវិធីសិក្សាចំណេះទូទៅខ្មែរ', 'https://fbis.edu.kh/images//sonisith2017/DSC_3456.jpg', 'រាប់ចាប់ពីកម្រិតមតេយ្យដល់ថ្នាក់ទី១២', '2022-08-11 20:11:00', 1);
INSERT INTO `tbl_study_program` VALUES (2, 'កម្មវិធីអប់រំភាសាអងគ្លេសទូទៅ (​ GEP ​)', 'https://fbis.edu.kh/images/19.jpg', 'GEP', '2022-08-11 22:09:24', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_study_records
-- ----------------------------
DROP TABLE IF EXISTS `tbl_study_records`;
CREATE TABLE `tbl_study_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `school_year` int(11) DEFAULT NULL,
  `education_level` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `activity` varchar(2000) DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `advisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `tbl_study_records_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `tbl_students` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_study_records
-- ----------------------------
BEGIN;
INSERT INTO `tbl_study_records` VALUES (1, 1, '2022-08-23', 1, 1, 4, 1, 1, 1, 1, 1, '1', 1, '2022-08-23 10:03:52', 1);
INSERT INTO `tbl_study_records` VALUES (2, 1, '2021-08-23', 1, 2, 4, 2, 1, 1, 3, 1, '1', 1, '2022-08-23 10:42:08', 1);
INSERT INTO `tbl_study_records` VALUES (3, 2, '2021-08-23', 1, 1, 4, 1, 1, 1, 2, 2, '1', 1, '2022-09-13 12:30:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_study_times
-- ----------------------------
DROP TABLE IF EXISTS `tbl_study_times`;
CREATE TABLE `tbl_study_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_en` varchar(50) NOT NULL,
  `time_kh` varchar(50) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_en` (`time_en`,`time_kh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_study_times
-- ----------------------------
BEGIN;
INSERT INTO `tbl_study_times` VALUES (1, 'Morning', 'ពេលព្រឹក', 1, 1, '2022-08-22 10:21:53', 1);
INSERT INTO `tbl_study_times` VALUES (2, 'Afternoon', 'ពេលរសៀល', 2, 1, '2022-08-22 10:22:15', 1);
INSERT INTO `tbl_study_times` VALUES (3, 'Everning', 'ពេលល្ងាច', 3, 1, '2022-08-22 10:22:32', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_subjects
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjects`;
CREATE TABLE `tbl_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_en` varchar(255) DEFAULT NULL,
  `subject_kh` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parents` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_subjects
-- ----------------------------
BEGIN;
INSERT INTO `tbl_subjects` VALUES (1, 'Math', 'គណិតវិទ្យា', 1, 1, 0, '2022-09-17 16:15:39', 1);
INSERT INTO `tbl_subjects` VALUES (2, 'Khmer', 'ភាសាខ្មែរ', 2, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (3, 'Physics', 'រូបវិទ្យា', 3, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (4, 'Chemistry', 'គីមីវិទ្យា', 4, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (5, 'Biology', 'ជីវវិទ្យា', 5, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (6, 'Geology', 'ផែនដីវិទ្យា', 6, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (7, 'History', 'ប្រវត្តិវិទ្យា', 7, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (8, 'Morality', 'សីលធម៍-ពលរដ្ឋ', 8, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (9, 'Geography', 'ភូមិវិទ្យា', 9, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (10, 'Computer', 'ទ្រឹស្ដីកុំព្យូទ៏រ', 10, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (11, 'Economy', 'សេដ្ឋកិច្ចវិទ្យា', 11, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (12, 'English', 'អង់គ្លេស', 12, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (13, 'Sport', 'កីឡា', 13, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (14, 'Health', 'អប់រំសុខភាព', 14, 1, 0, '2022-09-17 16:20:41', 1);
INSERT INTO `tbl_subjects` VALUES (15, '', 'សរសេរតាមដាន និងតែងសេចក្ដី', 15, 1, 2, '2022-09-17 16:25:26', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_subjects_by_acad_year
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjects_by_acad_year`;
CREATE TABLE `tbl_subjects_by_acad_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject` (`subject`,`grade`,`acad_year`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_subjects_by_grade
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjects_by_grade`;
CREATE TABLE `tbl_subjects_by_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject` (`subject`,`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_subjects_for_exam
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjects_for_exam`;
CREATE TABLE `tbl_subjects_for_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `class_type` int(11) DEFAULT NULL,
  `max_score` decimal(11,2) DEFAULT NULL,
  `pass_score` decimal(11,2) DEFAULT NULL,
  `multiplier` decimal(11,2) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subject` (`subject`,`grade`,`acad_year`,`class_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_subjects_for_exam
-- ----------------------------
BEGIN;
INSERT INTO `tbl_subjects_for_exam` VALUES (1, 1, 1, 1, 2, 125.00, 75.00, 3.00, '2022-09-19 00:29:42', 1);
INSERT INTO `tbl_subjects_for_exam` VALUES (2, 2, 1, 1, 2, 75.00, 37.00, 1.50, '2022-09-19 00:30:16', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_system_form
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_form`;
CREATE TABLE `tbl_system_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_system_right
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_right`;
CREATE TABLE `tbl_system_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_system_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_user_group`;
CREATE TABLE `tbl_system_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_system_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_user_permission`;
CREATE TABLE `tbl_system_user_permission` (
  `group` int(11) NOT NULL,
  `form` int(11) NOT NULL,
  `right` int(11) DEFAULT NULL,
  UNIQUE KEY `group_id` (`group`,`form`) USING BTREE,
  CONSTRAINT `tbl_system_user_permission_ibfk_1` FOREIGN KEY (`group`) REFERENCES `tbl_system_user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_system_user_permission_report
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_user_permission_report`;
CREATE TABLE `tbl_system_user_permission_report` (
  `group` int(11) DEFAULT NULL,
  `report` int(11) DEFAULT NULL,
  UNIQUE KEY `group` (`group`,`report`) USING BTREE,
  CONSTRAINT `tbl_system_user_permission_report_ibfk_1` FOREIGN KEY (`group`) REFERENCES `tbl_system_user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_committee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_committee`;
CREATE TABLE `tbl_teacher_assessment_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acad_year` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `score` decimal(10,3) DEFAULT NULL,
  `strength` text,
  `weakness` text,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acad_year` (`acad_year`,`teacher`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_committee_criteria
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_committee_criteria`;
CREATE TABLE `tbl_teacher_assessment_committee_criteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `multiply` decimal(10,0) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_committee_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_committee_score`;
CREATE TABLE `tbl_teacher_assessment_committee_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tscid` int(11) DEFAULT NULL,
  `criteria` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_teacher_assessment_committee_score_ibfk_1` (`tscid`),
  CONSTRAINT `tbl_teacher_assessment_committee_score_ibfk_1` FOREIGN KEY (`tscid`) REFERENCES `tbl_teacher_assessment_committee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly`;
CREATE TABLE `tbl_teacher_assessment_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `acad_year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `month` (`month`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly_criteria
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly_criteria`;
CREATE TABLE `tbl_teacher_assessment_monthly_criteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `multiply` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly_details
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly_details`;
CREATE TABLE `tbl_teacher_assessment_monthly_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assess_record_id` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assess_record_id` (`assess_record_id`),
  CONSTRAINT `tbl_teacher_assessment_monthly_details_ibfk_1` FOREIGN KEY (`assess_record_id`) REFERENCES `tbl_teacher_assessment_monthly_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly_records
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly_records`;
CREATE TABLE `tbl_teacher_assessment_monthly_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assess_id` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assess_id` (`assess_id`),
  CONSTRAINT `tbl_teacher_assessment_monthly_records_ibfk_1` FOREIGN KEY (`assess_id`) REFERENCES `tbl_teacher_assessment_monthly` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly_score`;
CREATE TABLE `tbl_teacher_assessment_monthly_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assess_detail_id` int(11) DEFAULT NULL,
  `criteria` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assess_detail_id` (`assess_detail_id`),
  CONSTRAINT `tbl_teacher_assessment_monthly_score_ibfk_1` FOREIGN KEY (`assess_detail_id`) REFERENCES `tbl_teacher_assessment_monthly_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_monthly_swot
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_monthly_swot`;
CREATE TABLE `tbl_teacher_assessment_monthly_swot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assess_id` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `strength` varchar(1000) DEFAULT NULL,
  `weakness` varchar(1000) DEFAULT NULL,
  `postby` int(11) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assess_id` (`assess_id`,`teacher`,`subject`) USING BTREE,
  KEY `teacher` (`teacher`),
  CONSTRAINT `tbl_teacher_assessment_monthly_swot_ibfk_1` FOREIGN KEY (`assess_id`) REFERENCES `tbl_teacher_assessment_monthly` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_teacher_assessment_monthly_swot_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `tbl_teachers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_assessment_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_assessment_score`;
CREATE TABLE `tbl_teacher_assessment_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_edu_level
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_edu_level`;
CREATE TABLE `tbl_teacher_edu_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(255) DEFAULT NULL,
  `edu_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_exp_rec
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_exp_rec`;
CREATE TABLE `tbl_teacher_exp_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `until` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `teacher` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_files_upload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_files_upload`;
CREATE TABLE `tbl_teacher_files_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` varchar(155) DEFAULT NULL,
  `file_id` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_grade
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_grade`;
CREATE TABLE `tbl_teacher_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_level
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_level`;
CREATE TABLE `tbl_teacher_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_level_kh` varchar(255) DEFAULT NULL,
  `t_level_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_study_rec
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_study_rec`;
CREATE TABLE `tbl_teacher_study_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_edu_level` int(11) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `country` int(255) DEFAULT NULL,
  `year_start` varchar(255) DEFAULT NULL,
  `year_end` varchar(255) DEFAULT NULL,
  `thesis_title` varchar(255) DEFAULT NULL,
  `teacher` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teacher_subject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_subject`;
CREATE TABLE `tbl_teacher_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(50) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_teachers
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teachers`;
CREATE TABLE `tbl_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createby` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `identity_no` varchar(255) DEFAULT NULL,
  `pob_province` varchar(255) DEFAULT NULL,
  `pob_district` varchar(255) DEFAULT NULL,
  `pob_commune` varchar(255) DEFAULT NULL,
  `pob_village` varchar(255) DEFAULT NULL,
  `pob_street_no` varchar(255) DEFAULT NULL,
  `pob_home_no` varchar(255) DEFAULT NULL,
  `cur_province` int(11) DEFAULT NULL,
  `cur_district` int(11) DEFAULT NULL,
  `cur_commune` int(11) DEFAULT NULL,
  `cur_village` int(11) DEFAULT NULL,
  `cur_street_no` varchar(255) DEFAULT NULL,
  `cur_home_no` varchar(255) DEFAULT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `idenpass_expire_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gender` (`gender`) USING BTREE,
  CONSTRAINT `tbl_teachers_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `tbl_genders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_teachers
-- ----------------------------
BEGIN;
INSERT INTO `tbl_teachers` VALUES (1, 'fbisfc221100', 'ហួត ផល្លា', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:52:10', 1, '2022-09-13 10:52:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (2, 'fbisfc221110', 'ម៉ន សុលី', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (3, 'fbisfc221101', 'មាស កញ្ចនា', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (4, 'fbisfc222100', 'ស៊ន់ ច័ន្ទសុភា', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (5, 'fbisfc221200', 'សួង វិសុទ្ធ', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (6, 'fbisfc221300', 'សៀក ម៉ាឌឿន', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (7, 'fbisfc222200', 'ឆេង តេងឈុន', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (8, 'fbisfc223200', 'ដាំ តក់', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (9, 'fbisfc221210', 'លាង លឹមអេង', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (10, 'fbisfc221211', 'សំ ចាន់លីដា', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_teachers` VALUES (11, 'fbisfc221212', 'អ៊ូ លីណែត', NULL, NULL, NULL, NULL, NULL, '2022-09-13 10:26:45', 1, '2022-09-13 10:26:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_type_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_type_news`;
CREATE TABLE `tbl_type_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_tpye_new_user` (`createby`) USING BTREE,
  CONSTRAINT `fk_tpye_new_user` FOREIGN KEY (`createby`) REFERENCES `tbl_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_type_news
-- ----------------------------
BEGIN;
INSERT INTO `tbl_type_news` VALUES (1, 'ការសិក្សា', 'ព័ត៌មានអំពីការសិក្សាទូទៅ', '2022-08-11 22:40:50', 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `skin` varchar(50) DEFAULT NULL,
  `default_row` int(11) DEFAULT NULL,
  `default_language` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifyby` int(11) DEFAULT NULL,
  `staffs` int(11) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
BEGIN;
INSERT INTO `tbl_users` VALUES (1, 'nat vannak', 'natvannak', '123', 1, '1', 1, 1, 1, '2022-08-10 15:11:01', 1, 1, 'null');
COMMIT;

-- ----------------------------
-- Table structure for tbl_weekday
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weekday`;
CREATE TABLE `tbl_weekday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_kh` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_weekday
-- ----------------------------
BEGIN;
INSERT INTO `tbl_weekday` VALUES (1, 'Monday', 'ចន្ទ', 1);
INSERT INTO `tbl_weekday` VALUES (2, 'Tuesday', 'អង្គារ៍', 2);
INSERT INTO `tbl_weekday` VALUES (3, 'Wednesday', 'ពុធ', 3);
INSERT INTO `tbl_weekday` VALUES (4, 'Thursday', 'ព្រហស្បត្តិ៍', 4);
INSERT INTO `tbl_weekday` VALUES (5, 'Friday', 'សុក្រ', 5);
INSERT INTO `tbl_weekday` VALUES (6, 'Saturday', 'សៅរ៍', 6);
INSERT INTO `tbl_weekday` VALUES (7, 'Sunday', 'អាទិត្យ', 7);
COMMIT;

-- ----------------------------
-- View structure for vw_attendances
-- ----------------------------
DROP VIEW IF EXISTS `vw_attendances`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_attendances` AS select `tbl_attendances`.`id` AS `id`,`tbl_attendances`.`id_student` AS `id_student`,`tbl_attendances`.`date` AS `date`,`tbl_attendances`.`is_permission` AS `is_permission`,`tbl_attendances`.`is_late` AS `is_late`,`tbl_attendances`.`acad_year` AS `acad_year`,`tbl_academic_years`.`academic_year` AS `academic_year`,`tbl_attendances`.`grade` AS `grade`,`tbl_grade_levels`.`grade_en` AS `grade_en`,`tbl_grade_levels`.`grade_kh` AS `grade_kh`,`tbl_attendances`.`group` AS `group`,`vw_groups`.`group_name` AS `group_name`,`vw_groups`.`room` AS `room`,`vw_groups`.`room_kh` AS `room_kh`,`vw_groups`.`room_en` AS `room_en`,`vw_groups`.`time` AS `time`,`vw_groups`.`time_en` AS `time_en`,`vw_groups`.`time_kh` AS `time_kh`,`tbl_attendances`.`subject` AS `subject`,`tbl_subjects`.`subject_en` AS `subject_en`,`tbl_subjects`.`subject_kh` AS `subject_kh`,`tbl_attendances`.`teacher` AS `teacher`,`tbl_teachers`.`name_kh` AS `teacher_kh`,`tbl_attendances`.`createdate` AS `createdate`,`tbl_attendances`.`createby` AS `createby`,`tbl_attendances`.`note` AS `note`,`tbl_attendances`.`session` AS `session` from (((((`tbl_attendances` left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_attendances`.`acad_year`))) left join `tbl_grade_levels` on((`tbl_grade_levels`.`id` = `tbl_attendances`.`grade`))) left join `vw_groups` on((`vw_groups`.`id` = `tbl_attendances`.`group`))) left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_attendances`.`subject`))) left join `tbl_teachers` on((`tbl_teachers`.`id` = `tbl_attendances`.`teacher`)));

-- ----------------------------
-- View structure for vw_daily_workplan
-- ----------------------------
DROP VIEW IF EXISTS `vw_daily_workplan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_daily_workplan` AS select `tbl_daily_workplan`.`id` AS `id`,`tbl_daily_workplan`.`date` AS `date`,`tbl_daily_workplan`.`action` AS `action`,`tbl_daily_workplan`.`user_id` AS `user_id`,`tbl_users`.`fullname` AS `fullname` from (`tbl_daily_workplan` left join `tbl_users` on((`tbl_daily_workplan`.`user_id` = `tbl_users`.`user_id`)));

-- ----------------------------
-- View structure for vw_dropout_student_report
-- ----------------------------
DROP VIEW IF EXISTS `vw_dropout_student_report`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_dropout_student_report` AS select `a`.`id` AS `id`,`a`.`student_id` AS `student_id`,`a`.`name_en` AS `name_en`,`a`.`name_kh` AS `name_kh`,`a`.`sex_en` AS `sex_en`,`a`.`sex_kh` AS `sex_kh`,`a`.`dob` AS `dob`,`a`.`group_name` AS `group_name`,`a`.`phone` AS `phone`,`a`.`father_name` AS `father_name`,`a`.`father_phone` AS `father_phone`,`a`.`mother_name` AS `mother_name`,`a`.`mother_phone` AS `mother_phone`,`a`.`contact_person_name` AS `contact_person_name`,`a`.`contact_person_phone` AS `contact_person_phone`,`b`.`status` AS `status`,`b`.`date` AS `date`,`b`.`school_year` AS `school_year`,`b`.`education_level` AS `education_level`,`b`.`grade` AS `grade`,`b`.`semester` AS `semester`,`b`.`time` AS `time`,`b`.`group` AS `group`,`b`.`room` AS `room`,`a`.`branch` AS `branch`,`a`.`gender` AS `gender`,substr(`b`.`activity`,(locate(' -- ',`b`.`activity`) + 3)) AS `description`,substr(`b`.`activity`,1,locate(' -- ',`b`.`activity`)) AS `reasonid`,`b`.`advisor` AS `advisor` from (`vw_students` `a` join `tbl_study_records` `b` on((`a`.`id` = `b`.`id_student`)));

-- ----------------------------
-- View structure for vw_geo_area
-- ----------------------------
DROP VIEW IF EXISTS `vw_geo_area`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_geo_area` AS select `tbl_geo_area`.`id` AS `id`,`tbl_geo_area`.`area_code` AS `area_code`,`tbl_geo_area`.`name_kh` AS `name_kh`,`tbl_geo_area`.`name_en` AS `name_en`,`tbl_geo_area`.`parent_id` AS `parent_id` from `tbl_geo_area`;

-- ----------------------------
-- View structure for vw_geo_area_by_group
-- ----------------------------
DROP VIEW IF EXISTS `vw_geo_area_by_group`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_geo_area_by_group` AS select `tbl_geo_area`.`id` AS `id`,`tbl_geo_area`.`area_code` AS `area_code`,`tbl_geo_area`.`name_kh` AS `name_kh`,`tbl_geo_area`.`name_en` AS `name_en`,`tbl_geo_area`.`parent_id` AS `parent_id`,`tbl_geo_area`.`areatype_id` AS `areatype_id`,`tbl_geo_area_type`.`name` AS `prefix` from (`tbl_geo_area` left join `tbl_geo_area_type` on((`tbl_geo_area`.`areatype_id` = `tbl_geo_area_type`.`id`))) where (`tbl_geo_area`.`areatype_id` <> 1);

-- ----------------------------
-- View structure for vw_geo_area_list
-- ----------------------------
DROP VIEW IF EXISTS `vw_geo_area_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_geo_area_list` AS select `province`.`id` AS `pid`,`province`.`prefix` AS `pprefix`,`province`.`name_kh` AS `pname_kh`,`province`.`name_en` AS `pname_en`,`district`.`id` AS `did`,`district`.`prefix` AS `dprefix`,`district`.`name_kh` AS `dname_kh`,`district`.`name_en` AS `dname_en`,`commune`.`id` AS `cid`,`commune`.`prefix` AS `cprefix`,`commune`.`name_kh` AS `cname_kh`,`commune`.`name_en` AS `cname_en`,`village`.`id` AS `vid`,`village`.`prefix` AS `vprefix`,`village`.`name_kh` AS `vname_kh`,`village`.`areatype_id` AS `areatype_id`,`village`.`name_en` AS `vname_en` from (((`vw_geo_area_by_group` `village` left join `vw_geo_area_by_group` `commune` on((`commune`.`id` = `village`.`parent_id`))) left join `vw_geo_area_by_group` `district` on((`district`.`id` = `commune`.`parent_id`))) left join `vw_geo_area_by_group` `province` on((`province`.`id` = `district`.`parent_id`))) order by `village`.`id`;

-- ----------------------------
-- View structure for vw_groups
-- ----------------------------
DROP VIEW IF EXISTS `vw_groups`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_groups` AS select `tbl_groups`.`id` AS `id`,`tbl_groups`.`group_name` AS `group_name`,`tbl_groups`.`acad_year` AS `acad_year`,`tbl_groups`.`grade` AS `grade`,`tbl_groups`.`time` AS `time`,`tbl_rooms`.`room_en` AS `room_en`,`tbl_rooms`.`room_kh` AS `room_kh`,`tbl_groups`.`sort` AS `sort`,`tbl_groups`.`status` AS `status`,`tbl_groups`.`home_teacher` AS `home_teacher`,`tbl_groups`.`modifydate` AS `modifydate`,`tbl_groups`.`modifyby` AS `modifyby`,`tbl_study_times`.`time_en` AS `time_en`,`tbl_study_times`.`time_kh` AS `time_kh`,`tbl_groups`.`room` AS `room`,`tbl_groups`.`class_type` AS `class_type`,`tbl_class_type`.`name_en` AS `class_type_en`,`tbl_class_type`.`name_kh` AS `class_type_kh`,`tbl_groups`.`branch` AS `branch`,`tbl_branches`.`branch_name` AS `branch_name`,`tbl_groups`.`group_name_kh` AS `group_name_kh` from ((((`tbl_groups` left join `tbl_rooms` on((`tbl_rooms`.`id` = `tbl_groups`.`room`))) left join `tbl_study_times` on((`tbl_study_times`.`id` = `tbl_groups`.`time`))) left join `tbl_class_type` on((`tbl_class_type`.`id` = `tbl_groups`.`class_type`))) left join `tbl_branches` on((`tbl_branches`.`id` = `tbl_groups`.`branch`)));

-- ----------------------------
-- View structure for vw_registration_form
-- ----------------------------
DROP VIEW IF EXISTS `vw_registration_form`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_registration_form` AS select `a`.`id` AS `id`,`a`.`name_kh` AS `name`,`a`.`old_school` AS `old_school`,`b`.`name_kh` AS `province_kh`,`a`.`province` AS `province`,`a`.`gender` AS `buyer_sex`,`a`.`grade` AS `grade`,`a`.`study_time` AS `time`,`c`.`grade_kh` AS `grade_kh`,`d`.`short_kh` AS `gender`,`e`.`time_kh` AS `study_time_kh`,`a`.`form_id` AS `form_id`,`a`.`is_new` AS `is_new`,`a`.`stu_id` AS `stu_id`,`f`.`name_kh` AS `student_name_kh`,`a`.`advisor` AS `advisor`,`g`.`name_kh` AS `staff_name_kh`,`a`.`date` AS `date`,`h`.`status_kh` AS `status_kh`,`a`.`note` AS `note`,`a`.`acad_year` AS `acad_year`,`a`.`phone` AS `phone`,`j`.`fullname` AS `postby_kh`,`a`.`post_by` AS `post_by`,`a`.`status` AS `status`,`h`.`color` AS `color`,`a`.`pay_for` AS `pay_for`,`a`.`edu_level` AS `edu_level`,`k`.`level_kh` AS `level_kh`,`l`.`pay_for_kh` AS `pay_for_kh`,`a`.`old_class` AS `old_class` from (((((((((((`tbl_registration` `a` left join `tbl_geo_area` `b` on((`a`.`province` = `b`.`id`))) left join `tbl_grade_levels` `c` on((`a`.`grade` = `c`.`id`))) left join `tbl_genders` `d` on((`a`.`gender` = `d`.`id`))) left join `tbl_study_times` `e` on((`a`.`study_time` = `e`.`id`))) left join `tbl_students` `f` on((`a`.`stu_id` = `f`.`student_id`))) left join `tbl_staffs` `g` on((`a`.`advisor` = `g`.`id`))) left join `tbl_registration_status` `h` on((`a`.`status` = `h`.`id`))) left join `tbl_academic_years` `i` on((`a`.`acad_year` = `i`.`id`))) left join `tbl_users` `j` on((`a`.`post_by` = `j`.`user_id`))) left join `tbl_education_levels` `k` on((`a`.`edu_level` = `k`.`id`))) left join `tbl_pay_for` `l` on((`a`.`pay_for` = `l`.`id`)));

-- ----------------------------
-- View structure for vw_schedules
-- ----------------------------
DROP VIEW IF EXISTS `vw_schedules`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_schedules` AS select `vw_groups`.`room` AS `room`,`vw_groups`.`branch` AS `branch`,`vw_groups`.`time` AS `time`,`vw_groups`.`group_name_kh` AS `group_name_kh`,`tbl_grade_levels`.`edu_level` AS `edu_level`,`tbl_schedules`.`id` AS `id`,`tbl_schedules`.`name` AS `name`,`tbl_schedules`.`start_date` AS `start_date`,`tbl_schedules`.`end_date` AS `end_date`,`tbl_schedules`.`acad_year` AS `acad_year`,`tbl_academic_years`.`academic_year` AS `academic_year`,`tbl_schedules`.`grade` AS `grade`,`tbl_grade_levels`.`grade_en` AS `grade_en`,`tbl_grade_levels`.`grade_kh` AS `grade_kh`,`tbl_schedules`.`group` AS `group`,`vw_groups`.`group_name` AS `group_name`,`vw_groups`.`room_en` AS `room_en`,`vw_groups`.`room_kh` AS `room_kh`,`vw_groups`.`time_en` AS `time_en`,`vw_groups`.`time_kh` AS `time_kh`,`tbl_schedules`.`createby` AS `createby`,`tbl_users`.`fullname` AS `createby_name` from ((((`tbl_schedules` left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_schedules`.`acad_year`))) left join `tbl_grade_levels` on((`tbl_grade_levels`.`id` = `tbl_schedules`.`grade`))) left join `vw_groups` on((`vw_groups`.`id` = `tbl_schedules`.`group`))) left join `tbl_users` on((`tbl_users`.`user_id` = `tbl_schedules`.`createby`)));

-- ----------------------------
-- View structure for vw_schedule_details
-- ----------------------------
DROP VIEW IF EXISTS `vw_schedule_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_schedule_details` AS select `tbl_schedule_details`.`id` AS `id`,`tbl_schedule_details`.`schedule_id` AS `schedule_id`,`tbl_schedule_details`.`study_hour` AS `study_hour`,`vw_study_hours`.`study_hour` AS `study_hour_all`,`tbl_schedule_details`.`weekday` AS `weekday`,`tbl_weekday`.`name_en` AS `day_en`,`tbl_weekday`.`name_kh` AS `day_kh`,`tbl_schedule_details`.`is_event` AS `is_event`,`tbl_schedule_details`.`event_desc` AS `event_desc`,`tbl_schedule_details`.`subject` AS `subject`,`tbl_subjects`.`subject_en` AS `subject_en`,`tbl_subjects`.`subject_kh` AS `subject_kh`,`tbl_schedule_details`.`teacher` AS `teacher`,`tbl_teachers`.`name_kh` AS `teacher_kh`,`tbl_teachers`.`name_en` AS `teacher_en`,`tbl_schedule_details`.`room` AS `room`,`tbl_rooms`.`room_en` AS `room_en`,`tbl_rooms`.`room_kh` AS `room_kh`,`tbl_teachers`.`phone` AS `teacher_phone` from (((((`tbl_schedule_details` left join `vw_study_hours` on((`vw_study_hours`.`id` = `tbl_schedule_details`.`study_hour`))) left join `tbl_weekday` on((`tbl_weekday`.`id` = `tbl_schedule_details`.`weekday`))) left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_schedule_details`.`subject`))) left join `tbl_teachers` on((`tbl_teachers`.`id` = `tbl_schedule_details`.`teacher`))) left join `tbl_rooms` on((`tbl_rooms`.`id` = `tbl_schedule_details`.`room`)));

-- ----------------------------
-- View structure for vw_staffs
-- ----------------------------
DROP VIEW IF EXISTS `vw_staffs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_staffs` AS select `tbl_staffs`.`id` AS `id`,`tbl_staffs`.`name_kh` AS `name_kh`,`tbl_staffs`.`name_en` AS `name_en`,`tbl_genders`.`sex_kh` AS `gender_kh`,`tbl_staffs`.`dob` AS `dob`,`tbl_staffs`.`modifyby` AS `modifyby`,`tbl_staffs`.`modifydate` AS `modifydate`,`tbl_staffs`.`phone` AS `phone`,`tbl_staffs`.`race` AS `race`,`tbl_staffs`.`nationality` AS `nationality`,`tbl_status`.`id` AS `status_id`,`tbl_status`.`status_kh` AS `status_kh`,`tbl_status`.`color` AS `color`,`tbl_users`.`fullname` AS `modifier`,`tbl_races`.`name_kh` AS `race_kh`,`tbl_nationalities`.`name_kh` AS `nationality_kh`,`tbl_users`.`user_id` AS `user_id`,`tbl_races`.`name_en` AS `race_en`,`tbl_races`.`id` AS `raceid`,`tbl_nationalities`.`id` AS `nationID`,`tbl_status`.`status_en` AS `status_en`,`tbl_genders`.`sex_en` AS `sex_en`,`tbl_staffs`.`identity_no` AS `identity_no`,`tbl_staffs`.`identity_date` AS `identity_date`,`tbl_staffs`.`status` AS `status`,`tbl_staffs`.`createby` AS `createby`,`tbl_staffs`.`createdate` AS `register_date`,`tbl_staffs`.`gender` AS `gender`,`tbl_marital_status`.`marital_kh` AS `marital_kh`,`tbl_marital_status`.`marital_en` AS `marital_en`,`tbl_staffs`.`staff_id` AS `staff_id`,`tbl_staffs`.`marital_status` AS `marital_status`,`tbl_staffs`.`pob_province` AS `pob_province`,`tbl_staffs`.`pob_district` AS `pob_district`,`tbl_staffs`.`pob_commune` AS `pob_commune`,`tbl_staffs`.`pob_village` AS `pob_village`,`tbl_staffs`.`pob_street_no` AS `pob_street_no`,`tbl_staffs`.`pob_home_no` AS `pob_home_no`,`tbl_staffs`.`cur_province` AS `cur_province`,`tbl_staffs`.`cur_district` AS `cur_district`,`tbl_staffs`.`cur_commune` AS `cur_commune`,`tbl_staffs`.`cur_village` AS `cur_village`,`tbl_staffs`.`cur_street_no` AS `cur_street_no`,`tbl_staffs`.`cur_home_no` AS `cur_home_no`,`tbl_geo_area`.`parent_id` AS `parent_id`,`tbl_geo_area`.`name_en` AS `area_en`,`tbl_geo_area`.`name_kh` AS `area_kh`,`tbl_geo_area`.`area_code` AS `area_code`,`tbl_staffs`.`passport_no` AS `passport_no`,`tbl_staffs`.`passport_exp` AS `passport_exp`,`tbl_staffs`.`email` AS `email`,`tbl_staffs`.`telegram` AS `telegram`,`tbl_staffs`.`img_path` AS `img_path`,`tbl_staffs`.`is_staff` AS `is_staff`,`tbl_staffs`.`is_management` AS `is_management`,`tbl_staffs`.`is_inspector` AS `is_inspector` from (((((((`tbl_staffs` left join `tbl_genders` on((`tbl_staffs`.`gender` = `tbl_genders`.`id`))) left join `tbl_status` on((`tbl_staffs`.`status` = `tbl_status`.`id`))) left join `tbl_users` on((`tbl_staffs`.`modifyby` = `tbl_users`.`user_id`))) left join `tbl_races` on((`tbl_staffs`.`race` = `tbl_races`.`id`))) left join `tbl_nationalities` on((`tbl_staffs`.`nationality` = `tbl_nationalities`.`id`))) left join `tbl_marital_status` on((`tbl_staffs`.`marital_status` = `tbl_marital_status`.`id`))) left join `tbl_geo_area` on(((`tbl_staffs`.`cur_village` = `tbl_geo_area`.`id`) and (`tbl_staffs`.`cur_province` = `tbl_geo_area`.`id`) and (`tbl_staffs`.`cur_district` = `tbl_geo_area`.`id`) and (`tbl_staffs`.`cur_commune` = `tbl_geo_area`.`id`))));

-- ----------------------------
-- View structure for vw_staffs_report
-- ----------------------------
DROP VIEW IF EXISTS `vw_staffs_report`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_staffs_report` AS select `tbl_staffs`.`id` AS `id`,`tbl_staffs`.`name_kh` AS `name_kh`,`tbl_staffs`.`name_en` AS `name_en`,`tbl_genders`.`sex_kh` AS `sex_kh`,`tbl_staffs`.`dob` AS `dob`,`tbl_staffs`.`modifyby` AS `modifyby`,`tbl_staffs`.`modifydate` AS `modifydate`,`tbl_staffs`.`phone` AS `phone`,`tbl_staffs`.`race` AS `race`,`tbl_staffs`.`nationality` AS `nationality`,`tbl_status`.`id` AS `status_id`,`tbl_status`.`status_kh` AS `status_kh`,`tbl_status`.`color` AS `color`,`tbl_users`.`fullname` AS `modifier`,`tbl_races`.`name_kh` AS `race_kh`,`tbl_nationalities`.`name_kh` AS `nation_kh`,`tbl_nationalities`.`name_en` AS `nation_en`,`tbl_users`.`user_id` AS `user_id`,`tbl_races`.`name_en` AS `race_en`,`tbl_races`.`id` AS `raceid`,`tbl_nationalities`.`id` AS `nationID`,`tbl_status`.`status_en` AS `status_en`,`tbl_genders`.`sex_en` AS `sex_en`,`tbl_staffs`.`identity_no` AS `identity_no`,`tbl_staffs`.`identity_date` AS `identity_date`,`tbl_staffs`.`status` AS `status`,`tbl_staffs`.`createby` AS `createby`,`tbl_staffs`.`createdate` AS `register_date`,`tbl_staffs`.`gender` AS `gender`,`tbl_marital_status`.`marital_kh` AS `marital_kh`,`tbl_marital_status`.`marital_en` AS `marital_en`,`tbl_staffs`.`staff_id` AS `staff_id`,`tbl_staffs`.`marital_status` AS `marital_status`,`tbl_staffs`.`pob_province` AS `pob_province`,`tbl_staffs`.`pob_district` AS `pob_district`,`tbl_staffs`.`pob_commune` AS `pob_commune`,`tbl_staffs`.`pob_village` AS `pob_village`,`tbl_staffs`.`pob_street_no` AS `pob_street_no`,`tbl_staffs`.`pob_home_no` AS `pob_home_no`,`vw_geo_area_list`.`cname_kh` AS `cur_commune_kh`,`vw_geo_area_list`.`vname_kh` AS `cur_village_kh`,`vw_geo_area_list`.`dname_kh` AS `cur_district_kh`,`vw_geo_area_list`.`pname_kh` AS `cur_province_kh`,`vw_geo_area_list`.`cname_en` AS `cur_commune_en`,`vw_geo_area_list`.`vname_en` AS `cur_village_en`,`vw_geo_area_list`.`dname_en` AS `cur_district_en`,`vw_geo_area_list`.`pname_en` AS `cur_province_en`,`vw_geo_area_list`.`cprefix` AS `cprefix`,`vw_geo_area_list`.`vprefix` AS `vprefix`,`vw_geo_area_list`.`dprefix` AS `dprefix`,`vw_geo_area_list`.`pprefix` AS `pprefix`,`tbl_staffs`.`cur_street_no` AS `cur_street_no`,`tbl_staffs`.`cur_home_no` AS `cur_home_no`,`tbl_staffs`.`passport_no` AS `passport_no`,`tbl_staffs`.`passport_exp` AS `passport_exp`,`tbl_staffs`.`email` AS `email`,`tbl_staffs`.`telegram` AS `telegram`,`tbl_staffs`.`img_path` AS `img_path`,`tbl_staffs`.`is_staff` AS `is_staff`,`tbl_staffs`.`is_management` AS `is_management`,`tbl_staffs`.`is_inspector` AS `is_inspector`,`vw_staff_position`.`in_charge_of` AS `in_charge_of`,`vw_staff_position`.`occupation` AS `occupation` from ((((((((`tbl_staffs` left join `vw_staff_position` on((`tbl_staffs`.`id` = `vw_staff_position`.`staff`))) left join `tbl_genders` on((`tbl_staffs`.`gender` = `tbl_genders`.`id`))) left join `tbl_status` on((`tbl_staffs`.`status` = `tbl_status`.`id`))) left join `tbl_users` on((`tbl_staffs`.`modifyby` = `tbl_users`.`user_id`))) left join `tbl_races` on((`tbl_staffs`.`race` = `tbl_races`.`id`))) left join `tbl_nationalities` on((`tbl_staffs`.`nationality` = `tbl_nationalities`.`id`))) left join `tbl_marital_status` on((`tbl_staffs`.`marital_status` = `tbl_marital_status`.`id`))) left join `vw_geo_area_list` on(((`tbl_staffs`.`cur_province` = `vw_geo_area_list`.`pid`) and (`tbl_staffs`.`cur_district` = `vw_geo_area_list`.`did`) and (`tbl_staffs`.`cur_commune` = `vw_geo_area_list`.`cid`) and (`tbl_staffs`.`cur_village` = `vw_geo_area_list`.`vid`))));

-- ----------------------------
-- View structure for vw_staff_position
-- ----------------------------
DROP VIEW IF EXISTS `vw_staff_position`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_staff_position` AS select `tbl_staff_job_pos`.`id` AS `id`,`tbl_staff_job_pos`.`position` AS `positionID`,`tbl_staff_job_pos`.`occupation` AS `occupationID`,`tbl_staff_job_pos`.`announce_by` AS `announce_byID`,`tbl_staff_job_pos`.`work_condition` AS `work_conditionID`,`tbl_staff_job_pos`.`work_type` AS `work_typeID`,`tbl_staff_job_pos`.`start_date` AS `start_date`,`tbl_staff_job_pos`.`end_date` AS `end_date`,`tbl_staff_job_pos`.`in_charge_of` AS `in_charge_of`,`tbl_staff_job_pos`.`staff` AS `staff`,`tbl_job_type`.`type_kh` AS `work_type`,`tbl_job_position`.`position_kh` AS `position`,`tbl_job_condition`.`condition_kh` AS `work_condition`,`tbl_job_occupation_type`.`type_kh` AS `occupation`,`tbl_manager_job_annouce`.`manager_kh` AS `announce_by` from (((((`tbl_staff_job_pos` left join `tbl_job_type` on((`tbl_staff_job_pos`.`work_type` = `tbl_job_type`.`id`))) left join `tbl_job_position` on((`tbl_staff_job_pos`.`position` = `tbl_job_position`.`id`))) left join `tbl_job_condition` on((`tbl_staff_job_pos`.`work_condition` = `tbl_job_condition`.`id`))) left join `tbl_job_occupation_type` on((`tbl_staff_job_pos`.`occupation` = `tbl_job_occupation_type`.`id`))) left join `tbl_manager_job_annouce` on((`tbl_staff_job_pos`.`announce_by` = `tbl_manager_job_annouce`.`id`)));

-- ----------------------------
-- View structure for vw_staff_study_rec
-- ----------------------------
DROP VIEW IF EXISTS `vw_staff_study_rec`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_staff_study_rec` AS select `tbl_staff_study_rec`.`id` AS `id`,`tbl_teacher_level`.`t_level_kh` AS `t_level_kh`,`tbl_staff_study_rec`.`major` AS `major`,`tbl_staff_study_rec`.`institution` AS `institution`,`tbl_countries`.`country_name` AS `country_name`,`tbl_staff_study_rec`.`year_start` AS `year_start`,`tbl_staff_study_rec`.`year_end` AS `year_end`,`tbl_staff_study_rec`.`thesis_title` AS `thesis_title`,`tbl_staff_study_rec`.`staff` AS `staff` from ((`tbl_staff_study_rec` left join `tbl_teacher_level` on((`tbl_staff_study_rec`.`t_edu_level` = `tbl_teacher_level`.`id`))) left join `tbl_countries` on((`tbl_staff_study_rec`.`country` = `tbl_countries`.`id`)));

-- ----------------------------
-- View structure for vw_students
-- ----------------------------
DROP VIEW IF EXISTS `vw_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_students` AS select `tbl_students`.`id` AS `id`,`tbl_students`.`student_id` AS `student_id`,`tbl_students`.`name_en` AS `name_en`,`tbl_students`.`name_kh` AS `name_kh`,`tbl_students`.`gender` AS `gender`,`tbl_genders`.`sex_en` AS `sex_en`,`tbl_genders`.`sex_kh` AS `sex_kh`,`tbl_students`.`nationality` AS `nationality`,`tbl_nationalities`.`name_en` AS `nation_en`,`tbl_nationalities`.`name_kh` AS `nation_kh`,`tbl_students`.`race` AS `race`,`tbl_races`.`name_en` AS `race_en`,`tbl_races`.`name_kh` AS `race_kh`,`tbl_students`.`old_acadyear` AS `old_acadyear`,`tbl_academic_years`.`academic_year` AS `old_academic_year`,`tbl_students`.`old_acadyear_result` AS `old_acadyear_result`,`tbl_students`.`phone` AS `phone`,`tbl_students`.`pob` AS `pob`,`tbl_students`.`address` AS `address`,`tbl_students`.`english_school` AS `english_school`,`tbl_students`.`education_level` AS `education_level`,`tbl_education_levels`.`level_en` AS `edu_level_en`,`tbl_education_levels`.`level_kh` AS `edu_level_kh`,`tbl_grade_levels`.`grade_en` AS `grade_en`,`tbl_grade_levels`.`grade_kh` AS `grade_kh`,`tbl_students`.`school_year` AS `school_year`,`school_years`.`academic_year` AS `school_academic_year`,`tbl_students`.`dob` AS `dob`,`tbl_students`.`grade` AS `grade`,if((now() < (`school_years`.`start_date` + interval 6 month)),1,2) AS `semester`,`tbl_study_times`.`time_en` AS `time_en`,`tbl_study_times`.`time_kh` AS `time_kh`,`tbl_students`.`previous_school` AS `previous_school`,`tbl_students`.`time` AS `time`,`tbl_students`.`register_date` AS `register_date`,`tbl_students`.`group` AS `group`,`tbl_groups`.`group_name` AS `group_name`,`tbl_groups`.`group_name_kh` AS `group_name_kh`,`tbl_students`.`school_address` AS `school_address`,`tbl_students`.`checkedby` AS `checkedby`,`checkers`.`fullname` AS `checkedby_name`,`tbl_students`.`status` AS `status`,`tbl_status`.`status_en` AS `status_en`,`tbl_status`.`status_kh` AS `status_kh`,`tbl_status`.`color` AS `status_color`,`tbl_groups`.`room` AS `room`,`tbl_rooms`.`room_en` AS `room_en`,`tbl_rooms`.`room_kh` AS `room_kh`,`tbl_groups`.`class_type` AS `class_type`,`tbl_class_type`.`name_en` AS `class_type_en`,`tbl_class_type`.`name_kh` AS `class_type_kh`,`tbl_students`.`english_level` AS `english_level`,`tbl_students`.`branch` AS `branch`,`tbl_branches`.`branch_name` AS `branch_name`,`tbl_students_more_info`.`father_name` AS `father_name`,`tbl_students_more_info`.`father_phone` AS `father_phone`,`tbl_students_more_info`.`mother_name` AS `mother_name`,`tbl_students_more_info`.`mother_phone` AS `mother_phone`,`tbl_students_more_info`.`contact_person_name` AS `contact_person_name`,`tbl_students_more_info`.`contact_person_phone` AS `contact_person_phone`,`tbl_students_more_info`.`father_job` AS `father_job`,`tbl_students_more_info`.`mother_job` AS `mother_job`,`tbl_students_more_info`.`contact_person_job` AS `contact_person_job`,`tbl_students_more_info`.`sponsor_name` AS `sponsor_name`,`tbl_students_more_info`.`sponsor_job` AS `sponsor_job`,`tbl_students_more_info`.`sponsor_phone` AS `sponsor_phone`,`tbl_students_more_info`.`urgent_name` AS `urgent_name`,`tbl_students_more_info`.`urgent_phone` AS `urgent_phone`,`tbl_students`.`is_new` AS `is_new`,`tbl_students`.`img_path` AS `img_path`,`tbl_students_more_info`.`middle_exam_date` AS `middle_exam_date`,`tbl_students_more_info`.`middle_exam_school` AS `middle_exam_school`,`tbl_students_more_info`.`middle_table_no` AS `middle_table_no`,`tbl_students_more_info`.`middle_class_no` AS `middle_class_no`,`tbl_students_more_info`.`middle_result` AS `middle_result`,`tbl_students`.`telegram` AS `telegram`,`tbl_students`.`createby` AS `createby`,`tbl_students`.`modifyby` AS `modifyby`,`checkers`.`fullname` AS `modifier`,`tbl_geo_area`.`name_kh` AS `school_address_kh` from ((((((((((((((((`tbl_students` left join `tbl_genders` on((`tbl_genders`.`id` = `tbl_students`.`gender`))) left join `tbl_nationalities` on((`tbl_nationalities`.`id` = `tbl_students`.`nationality`))) left join `tbl_races` on((`tbl_races`.`id` = `tbl_students`.`race`))) left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_students`.`old_acadyear`))) left join `tbl_education_levels` on((`tbl_education_levels`.`id` = `tbl_students`.`education_level`))) left join `tbl_grade_levels` on((`tbl_grade_levels`.`id` = `tbl_students`.`grade`))) left join `tbl_academic_years` `school_years` on((`school_years`.`id` = `tbl_students`.`school_year`))) left join `tbl_study_times` on((`tbl_study_times`.`id` = `tbl_students`.`time`))) left join `tbl_groups` on((`tbl_groups`.`id` = `tbl_students`.`group`))) left join `tbl_users` `checkers` on((`checkers`.`user_id` = `tbl_students`.`checkedby`))) left join `tbl_status` on((`tbl_status`.`id` = `tbl_students`.`status`))) left join `tbl_rooms` on((`tbl_rooms`.`id` = `tbl_groups`.`room`))) left join `tbl_class_type` on((`tbl_class_type`.`id` = `tbl_groups`.`class_type`))) left join `tbl_branches` on((`tbl_branches`.`id` = `tbl_students`.`branch`))) left join `tbl_students_more_info` on((`tbl_students_more_info`.`id_student` = `tbl_students`.`id`))) left join `tbl_geo_area` on((`tbl_geo_area`.`id` = `tbl_students`.`school_address`)));

-- ----------------------------
-- View structure for vw_students_cards
-- ----------------------------
DROP VIEW IF EXISTS `vw_students_cards`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_students_cards` AS select `a`.`id` AS `id`,`b`.`img_path` AS `img_path`,`a`.`student_id` AS `student_id`,`b`.`name_kh` AS `name_kh`,`b`.`name_en` AS `name_en`,`b`.`sex_kh` AS `sex`,`b`.`dob` AS `dob`,`c`.`academic_year` AS `academic_year`,`d`.`level_kh` AS `edu_level`,`e`.`grade_kh` AS `grade`,`f`.`branch_name` AS `branch`,`g`.`time_kh` AS `time`,`h`.`group_name_kh` AS `group`,`i`.`fullname` AS `added_by`,`a`.`date` AS `date`,`a`.`done` AS `done`,`a`.`done_date` AS `done_date`,`j`.`fullname` AS `done_by`,`b`.`room_kh` AS `room` from (((((((((`tbl_student_make_card` `a` left join `vw_students` `b` on((`b`.`student_id` = `a`.`student_id`))) left join `tbl_academic_years` `c` on((`c`.`id` = `a`.`acad_year`))) left join `tbl_education_levels` `d` on((`d`.`id` = `a`.`edu_level`))) left join `tbl_grade_levels` `e` on((`e`.`id` = `a`.`grade`))) left join `tbl_branches` `f` on((`f`.`id` = `a`.`branch`))) left join `tbl_study_times` `g` on((`g`.`id` = `a`.`time`))) left join `tbl_groups` `h` on((`h`.`id` = `a`.`group`))) left join `tbl_users` `i` on((`i`.`user_id` = `a`.`added_by`))) left join `tbl_users` `j` on((`j`.`user_id` = `a`.`done_by`)));

-- ----------------------------
-- View structure for vw_students_register
-- ----------------------------
DROP VIEW IF EXISTS `vw_students_register`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_students_register` AS select `a`.`id` AS `id`,`a`.`student_id` AS `student_id`,`a`.`name_en` AS `name_en`,`a`.`name_kh` AS `name_kh`,`a`.`gender` AS `gender`,`a`.`sex_en` AS `sex_en`,`a`.`sex_kh` AS `sex_kh`,`a`.`nationality` AS `nationality`,`a`.`nation_en` AS `nation_en`,`a`.`nation_kh` AS `nation_kh`,`a`.`race` AS `race`,`a`.`race_en` AS `race_en`,`a`.`race_kh` AS `race_kh`,`a`.`old_acadyear` AS `old_acadyear`,`a`.`old_academic_year` AS `old_academic_year`,`a`.`father_name` AS `father_name`,`a`.`father_phone` AS `father_phone`,`a`.`mother_name` AS `mother_name`,`a`.`mother_phone` AS `mother_phone`,`a`.`contact_person_name` AS `contact_person_name`,`a`.`contact_person_phone` AS `contact_person_phone`,`a`.`father_job` AS `father_job`,`a`.`mother_job` AS `mother_job`,`a`.`contact_person_job` AS `contact_person_job`,`a`.`sponsor_name` AS `sponsor_name`,`a`.`sponsor_job` AS `sponsor_job`,`a`.`sponsor_phone` AS `sponsor_phone`,`a`.`urgent_name` AS `urgent_name`,`a`.`urgent_phone` AS `urgent_phone`,`a`.`img_path` AS `img_path`,`a`.`middle_exam_date` AS `middle_exam_date`,`a`.`middle_exam_school` AS `middle_exam_school`,`a`.`middle_table_no` AS `middle_table_no`,`a`.`middle_class_no` AS `middle_class_no`,`a`.`middle_result` AS `middle_result`,`a`.`telegram` AS `telegram`,`a`.`dob` AS `dob`,`b`.`acad_year` AS `school_year`,`f`.`edu_level` AS `education_level`,`f`.`grade` AS `grade`,`f`.`time` AS `time`,`a`.`english_level` AS `english_level`,`b`.`regform_id` AS `regform_id`,`a`.`is_new` AS `is_new`,`a`.`checkedby` AS `checkedby`,`a`.`checkedby_name` AS `checkedby_name`,`c`.`fullname` AS `receiver_reg_name`,`a`.`createby` AS `createby`,`d`.`fullname` AS `createby_name`,`e`.`fullname` AS `modifier_name`,`a`.`modifyby` AS `modifyby`,`a`.`status` AS `status`,`a`.`status_color` AS `status_color`,`a`.`status_kh` AS `status_kh`,`a`.`status_en` AS `status_en`,`b`.`date` AS `register_date`,`b`.`receiver_reg` AS `receiver_reg`,`b`.`get_brith_certificate` AS `get_brith_certificate`,`b`.`get_study_book` AS `get_study_book`,`b`.`get_transfer_form` AS `get_transfer_form`,`b`.`get_photo` AS `get_photo`,`a`.`old_acadyear_result` AS `old_acadyear_result`,`a`.`school_address` AS `school_address`,`b`.`get_result_book` AS `get_result_book`,`b`.`get_9_exam_certificate` AS `get_9_exam_certificate`,`a`.`previous_school` AS `previous_school`,`a`.`school_address_kh` AS `school_address_kh`,`a`.`pob` AS `pob`,`a`.`address` AS `address`,`f`.`acad_year` AS `acad_year`,`f`.`grade_kh` AS `grade_kh`,`f`.`study_time_kh` AS `time_kh`,`f`.`level_kh` AS `edu_level_kh`,`g`.`academic_year` AS `school_academic_year`,`f`.`phone` AS `phone` from ((((((`vw_students` `a` join `tbl_applied_form` `b` on((`a`.`id` = `b`.`stu_id`))) left join `tbl_users` `c` on((`b`.`receiver_reg` = `c`.`user_id`))) left join `tbl_users` `d` on((`a`.`createby` = `d`.`user_id`))) left join `tbl_users` `e` on((`a`.`modifyby` = `e`.`user_id`))) left join `vw_registration_form` `f` on((`b`.`regform_id` = `f`.`form_id`))) left join `tbl_academic_years` `g` on((`f`.`acad_year` = `g`.`id`)));

-- ----------------------------
-- View structure for vw_student_discipline
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_discipline`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_discipline` AS select `tbl_student_discipline`.`id` AS `id`,`tbl_student_discipline`.`id_student` AS `id_student`,`tbl_academic_years`.`academic_year` AS `academic_year`,`tbl_academic_years`.`academic_year` AS `school_academic_year`,`tbl_grade_levels`.`grade_en` AS `grade_en`,`tbl_grade_levels`.`grade_kh` AS `grade_kh`,`tbl_student_discipline`.`semester` AS `semester`,`vw_groups`.`group_name` AS `group_name`,`vw_groups`.`room_en` AS `room_en`,`vw_groups`.`room_kh` AS `room_kh`,`vw_groups`.`time_en` AS `time_en`,`vw_groups`.`time_kh` AS `time_kh`,`vw_groups`.`class_type_en` AS `class_type_en`,`vw_groups`.`class_type_kh` AS `class_type_kh`,`tbl_student_discipline`.`date` AS `date`,`tbl_reasons`.`reason_en` AS `reason_en`,`tbl_reasons`.`reason_kh` AS `reason_kh`,`tbl_student_discipline`.`description` AS `description`,`tbl_student_discipline`.`promise_date` AS `promise_date`,`tbl_subjects`.`subject_en` AS `subject_en`,`tbl_subjects`.`subject_kh` AS `subject_kh`,`tbl_students`.`student_id` AS `student_id`,`tbl_students`.`name_en` AS `name_en`,`tbl_students`.`name_kh` AS `name_kh`,`tbl_genders`.`sex_en` AS `sex_en`,`tbl_genders`.`sex_kh` AS `sex_kh`,`tbl_students`.`dob` AS `dob`,`tbl_students`.`phone` AS `phone`,`tbl_students_more_info`.`father_name` AS `father_name`,`tbl_students_more_info`.`father_phone` AS `father_phone`,`tbl_students_more_info`.`mother_name` AS `mother_name`,`tbl_students_more_info`.`mother_phone` AS `mother_phone`,`tbl_students_more_info`.`contact_person_name` AS `contact_person_name`,`tbl_students_more_info`.`contact_person_phone` AS `contact_person_phone`,`tbl_students_more_info`.`sponsor_name` AS `sponsor_name`,`tbl_students_more_info`.`sponsor_phone` AS `sponsor_phone`,`tbl_students_more_info`.`urgent_name` AS `urgent_name`,`tbl_students_more_info`.`urgent_phone` AS `urgent_phone`,`tbl_education_levels`.`level_en` AS `edu_level_en`,`tbl_education_levels`.`level_kh` AS `edu_level_kh`,`tbl_student_discipline`.`acad_year` AS `acad_year`,`tbl_grade_levels`.`edu_level` AS `edu_level`,`tbl_student_discipline`.`group` AS `group`,`tbl_student_discipline`.`grade` AS `grade`,`tbl_student_discipline`.`reason` AS `reason`,`tbl_student_discipline`.`subject` AS `subject`,`vw_groups`.`time` AS `time`,`vw_groups`.`room` AS `room`,`vw_groups`.`branch` AS `branch`,`vw_groups`.`branch_name` AS `branch_name`,`vw_groups`.`group_name_kh` AS `group_name_kh`,`tbl_status`.`status_en` AS `status_en`,`tbl_status`.`status_kh` AS `status_kh`,`tbl_student_discipline`.`createby` AS `createby`,`tbl_users`.`fullname` AS `fullname` from (((((((((((`tbl_student_discipline` left join `tbl_users` on((`tbl_student_discipline`.`createby` = `tbl_users`.`user_id`))) left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_discipline`.`acad_year`))) left join `tbl_grade_levels` on((`tbl_grade_levels`.`id` = `tbl_student_discipline`.`grade`))) left join `vw_groups` on((`vw_groups`.`id` = `tbl_student_discipline`.`group`))) left join `tbl_reasons` on((`tbl_reasons`.`id` = `tbl_student_discipline`.`reason`))) left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_discipline`.`subject`))) join `tbl_students` on((`tbl_students`.`id` = `tbl_student_discipline`.`id_student`))) join `tbl_genders` on((`tbl_genders`.`id` = `tbl_students`.`gender`))) join `tbl_students_more_info` on((`tbl_students_more_info`.`id_student` = `tbl_students`.`id`))) join `tbl_education_levels` on((`tbl_education_levels`.`id` = `tbl_grade_levels`.`edu_level`))) join `tbl_status` on((`tbl_status`.`id` = `tbl_students`.`status`)));

-- ----------------------------
-- View structure for vw_student_discipline_by_id
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_discipline_by_id`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_discipline_by_id` AS select `tbl_student_discipline`.`id_student` AS `id_student`,`tbl_student_discipline`.`acad_year` AS `acad_year`,`tbl_academic_years`.`academic_year` AS `academic_year`,`tbl_student_discipline`.`date` AS `date`,`tbl_reasons`.`reason_kh` AS `reason_kh`,`tbl_student_discipline`.`description` AS `description`,`tbl_student_discipline`.`promise_date` AS `promise_date`,`tbl_subjects`.`subject_kh` AS `subject_kh`,`tbl_student_discipline`.`subject` AS `subject_id` from ((((`tbl_student_discipline` left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_discipline`.`acad_year`))) left join `tbl_grade_levels` on((`tbl_grade_levels`.`id` = `tbl_student_discipline`.`grade`))) left join `tbl_reasons` on((`tbl_reasons`.`id` = `tbl_student_discipline`.`reason`))) left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_discipline`.`subject`)));

-- ----------------------------
-- View structure for vw_student_month_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_month_result`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_month_result` AS select `tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_academic_years`.`id` AS `acad_year_id`,`tbl_student_monthly_result`.`total` AS `total`,`tbl_student_monthly_result`.`rank` AS `rank`,`tbl_student_monthly_result`.`average` AS `average`,`tbl_score_meaning`.`mention` AS `mention`,`tbl_student_monthly_result`.`student_id` AS `student_id`,`tbl_student_monthly_result`.`month` AS `month` from ((`tbl_student_monthly_result` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_monthly_result`.`acad_year`))) join `tbl_score_meaning` on((`tbl_score_meaning`.`id` = `tbl_student_monthly_result`.`mention`)));

-- ----------------------------
-- View structure for vw_student_month_score
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_month_score`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_month_score` AS select `tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_academic_years`.`id` AS `acad_year_id`,`tbl_subjects`.`subject_kh` AS `subject`,`tbl_student_monthly_score`.`score` AS `score`,`tbl_student_monthly_score`.`student_id` AS `student_id`,`tbl_student_monthly_score`.`month` AS `month` from ((`tbl_student_monthly_score` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_monthly_score`.`acad_year`))) join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_monthly_score`.`subject`)));

-- ----------------------------
-- View structure for vw_student_semester_exam_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_semester_exam_result`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_semester_exam_result` AS select `tbl_academic_years`.`id` AS `acad_year_id`,`tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_student_semester_result`.`student_id` AS `student_id`,`tbl_student_semester_result`.`semester` AS `semester`,`tbl_student_semester_result`.`semester_total` AS `total`,`tbl_student_semester_result`.`semester_average` AS `average`,`tbl_student_semester_result`.`semester_rank` AS `rank`,`tbl_score_meaning`.`mention` AS `meaning` from ((`tbl_student_semester_result` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_semester_result`.`acad_year`))) join `tbl_score_meaning` on((`tbl_score_meaning`.`id` = `tbl_student_semester_result`.`semester_meaning`)));

-- ----------------------------
-- View structure for vw_student_semester_exam_score
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_semester_exam_score`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_semester_exam_score` AS select `tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_academic_years`.`id` AS `acad_year_id`,`tbl_student_semester_score`.`student_id` AS `student_id`,`tbl_student_semester_score`.`semester` AS `semester`,`tbl_subjects`.`subject_kh` AS `subject`,`tbl_student_semester_score`.`score` AS `score` from ((`tbl_student_semester_score` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_semester_score`.`acad_year`))) join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_semester_score`.`subject`)));

-- ----------------------------
-- View structure for vw_student_semester_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_semester_result`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_semester_result` AS select `tbl_academic_years`.`id` AS `acad_year_id`,`tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_student_semester_result`.`student_id` AS `student_id`,`tbl_student_semester_result`.`semester` AS `semester`,`tbl_student_semester_result`.`monthly_average` AS `monthly_average`,`tbl_student_semester_result`.`semester_average` AS `semester_average`,format(((`tbl_student_semester_result`.`monthly_average` + `tbl_student_semester_result`.`semester_average`) / 2),2) AS `average`,`tbl_student_semester_result`.`rank` AS `rank`,`tbl_score_meaning`.`mention` AS `mention` from ((`tbl_student_semester_result` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_semester_result`.`acad_year`))) join `tbl_score_meaning` on((`tbl_score_meaning`.`id` = `tbl_student_semester_result`.`meaning`)));

-- ----------------------------
-- View structure for vw_student_subject_by_discipline
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_subject_by_discipline`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_subject_by_discipline` AS select distinct `tbl_subjects`.`subject_kh` AS `subject_kh` from ((`tbl_student_discipline` left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_discipline`.`subject`))) join `tbl_academic_years` on((`tbl_student_discipline`.`acad_year` = `tbl_academic_years`.`id`)));

-- ----------------------------
-- View structure for vw_student_yearly_result
-- ----------------------------
DROP VIEW IF EXISTS `vw_student_yearly_result`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_student_yearly_result` AS select `tbl_academic_years`.`id` AS `acad_year_id`,`tbl_academic_years`.`academic_year` AS `acad_year`,`tbl_student_yearly_result`.`student_id` AS `student_id`,`tbl_student_yearly_result`.`semester_1` AS `semester_1`,`tbl_student_yearly_result`.`semester_2` AS `semester_2`,format(((`tbl_student_yearly_result`.`semester_1` + `tbl_student_yearly_result`.`semester_2`) / 2),2) AS `average`,`tbl_student_yearly_result`.`rank` AS `rank`,`tbl_score_meaning`.`mention` AS `mention` from ((`tbl_student_yearly_result` join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_student_yearly_result`.`acad_year`))) join `tbl_score_meaning` on((`tbl_score_meaning`.`id` = `tbl_student_yearly_result`.`meaning`)));

-- ----------------------------
-- View structure for vw_study_hours
-- ----------------------------
DROP VIEW IF EXISTS `vw_study_hours`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_study_hours` AS select `tbl_study_hours`.`id` AS `id`,`tbl_study_hours`.`hour_start` AS `hour_start`,`tbl_study_hours`.`hour_end` AS `hour_end`,concat(time_format(`tbl_study_hours`.`hour_start`,'%Hh%i'),' - ',time_format(`tbl_study_hours`.`hour_end`,'%Hh%i')) AS `study_hour`,`tbl_study_hours`.`sort` AS `sort`,`tbl_study_hours`.`level` AS `level` from `tbl_study_hours`;

-- ----------------------------
-- View structure for vw_teachers
-- ----------------------------
DROP VIEW IF EXISTS `vw_teachers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_teachers` AS select `tbl_teachers`.`id` AS `id`,`tbl_teachers`.`name_kh` AS `name_kh`,`tbl_teachers`.`name_en` AS `name_en`,`tbl_genders`.`sex_kh` AS `gender_kh`,`tbl_teachers`.`dob` AS `dob`,`tbl_teachers`.`specialty` AS `specialty`,`tbl_teachers`.`modifyby` AS `modifyby`,`tbl_teachers`.`modifydate` AS `modifydate`,`tbl_teachers`.`phone` AS `phone`,`tbl_teachers`.`race` AS `race`,`tbl_teachers`.`nationality` AS `nationality`,`tbl_status`.`id` AS `status_id`,`tbl_status`.`status_kh` AS `status_kh`,`tbl_status`.`color` AS `color`,`tbl_users`.`fullname` AS `modifier`,`tbl_races`.`name_kh` AS `race_kh`,`tbl_nationalities`.`name_kh` AS `nationality_kh`,`tbl_users`.`user_id` AS `user_id`,`tbl_races`.`name_en` AS `race_en`,`tbl_races`.`id` AS `raceid`,`tbl_nationalities`.`id` AS `nationid`,`tbl_status`.`status_en` AS `status_en`,`tbl_genders`.`sex_en` AS `sex_en`,`tbl_teachers`.`identity_no` AS `identity_no`,`tbl_teachers`.`status` AS `status`,`tbl_teachers`.`createby` AS `createby`,`tbl_teachers`.`createdate` AS `register_date`,`tbl_teachers`.`gender` AS `gender`,`tbl_marital_status`.`marital_kh` AS `marital_kh`,`tbl_marital_status`.`marital_en` AS `marital_en`,`tbl_teachers`.`teacher_id` AS `teacher_id`,`tbl_teachers`.`marital_status` AS `marital_status`,`tbl_teachers`.`pob_province` AS `pob_province`,`tbl_teachers`.`pob_district` AS `pob_district`,`tbl_teachers`.`pob_commune` AS `pob_commune`,`tbl_teachers`.`pob_village` AS `pob_village`,`tbl_teachers`.`pob_street_no` AS `pob_street_no`,`tbl_teachers`.`pob_home_no` AS `pob_home_no`,`tbl_teachers`.`cur_province` AS `cur_province`,`tbl_teachers`.`cur_district` AS `cur_district`,`tbl_teachers`.`cur_commune` AS `cur_commune`,`tbl_teachers`.`cur_village` AS `cur_village`,`tbl_teachers`.`cur_street_no` AS `cur_street_no`,`tbl_teachers`.`cur_home_no` AS `cur_home_no`,`tbl_geo_area`.`parent_id` AS `parent_id`,`tbl_geo_area`.`name_en` AS `area_en`,`tbl_geo_area`.`name_kh` AS `area_kh`,`tbl_geo_area`.`area_code` AS `area_code`,`tbl_teachers`.`passport_no` AS `passport_no`,`tbl_teachers`.`idenpass_expire_date` AS `idenpass_expire_date`,`tbl_teachers`.`email` AS `email`,`tbl_teachers`.`telegram` AS `telegram`,`tbl_teachers`.`img_path` AS `img_path` from (((((((`tbl_teachers` left join `tbl_genders` on((`tbl_teachers`.`gender` = `tbl_genders`.`id`))) left join `tbl_status` on((`tbl_teachers`.`status` = `tbl_status`.`id`))) left join `tbl_users` on((`tbl_teachers`.`modifyby` = `tbl_users`.`user_id`))) left join `tbl_races` on((`tbl_teachers`.`race` = `tbl_races`.`id`))) left join `tbl_nationalities` on((`tbl_teachers`.`nationality` = `tbl_nationalities`.`id`))) left join `tbl_marital_status` on((`tbl_teachers`.`marital_status` = `tbl_marital_status`.`id`))) left join `tbl_geo_area` on(((`tbl_teachers`.`cur_village` = `tbl_geo_area`.`id`) and (`tbl_teachers`.`cur_province` = `tbl_geo_area`.`id`) and (`tbl_teachers`.`cur_district` = `tbl_geo_area`.`id`) and (`tbl_teachers`.`cur_commune` = `tbl_geo_area`.`id`))));

-- ----------------------------
-- View structure for vw_teacher_report
-- ----------------------------
DROP VIEW IF EXISTS `vw_teacher_report`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_teacher_report` AS select `t`.`teacher_id` AS `id`,`t`.`name_kh` AS `name_kh`,`t`.`name_en` AS `name_en`,`t`.`sex_en` AS `sex_en`,`t`.`gender_kh` AS `sex_kh`,`t`.`nationality_kh` AS `nation_kh`,`t`.`race_kh` AS `race_kh`,`t`.`phone` AS `phone`,`t`.`dob` AS `dob`,`t`.`status_kh` AS `status_kh`,`t`.`identity_no` AS `identity_no`,`t`.`idenpass_expire_date` AS `identity_date`,`t`.`idenpass_expire_date` AS `passport_exp`,`t`.`passport_no` AS `passport_no`,`t`.`marital_kh` AS `marital_kh`,`t`.`marital_en` AS `marital_en`,`t`.`img_path` AS `img_path`,`t`.`pob_province` AS `pob_province`,`t`.`pob_district` AS `pob_district`,`t`.`pob_commune` AS `pob_commune`,`t`.`pob_village` AS `pob_village`,`vw_geo_area_list`.`cname_kh` AS `cur_commune_kh`,`vw_geo_area_list`.`vname_kh` AS `cur_village_kh`,`vw_geo_area_list`.`dname_kh` AS `cur_district_kh`,`vw_geo_area_list`.`pname_kh` AS `cur_province_kh`,`vw_geo_area_list`.`cname_en` AS `cur_commune_en`,`vw_geo_area_list`.`vname_en` AS `cur_village_en`,`vw_geo_area_list`.`dname_en` AS `cur_district_en`,`vw_geo_area_list`.`pname_en` AS `cur_province_en`,`vw_geo_area_list`.`cprefix` AS `cprefix`,`vw_geo_area_list`.`vprefix` AS `vprefix`,`vw_geo_area_list`.`dprefix` AS `dprefix`,`vw_geo_area_list`.`pprefix` AS `pprefix`,group_concat(distinct `edu`.`level_kh` separator ',') AS `edu_level_kh`,group_concat(distinct `gl`.`grade_kh` separator ',') AS `grade_kh`,group_concat(distinct `sj`.`subject_kh` separator ',') AS `subject_kh`,group_concat(distinct `edu`.`id` separator ',') AS `edu_level`,group_concat(distinct `gl`.`id` separator ',') AS `grade`,group_concat(distinct `sj`.`id` separator ',') AS `subject`,`t`.`status` AS `status`,`t`.`gender` AS `gender` from (((((((`vw_teachers` `t` left join `tbl_teacher_edu_level` `tel` on((`tel`.`teacher` = `t`.`id`))) left join `tbl_education_levels` `edu` on((`edu`.`id` = `tel`.`edu_level`))) left join `tbl_teacher_grade` `tg` on((`tg`.`teacher` = `t`.`id`))) left join `tbl_grade_levels` `gl` on((`gl`.`id` = `tg`.`grade`))) left join `tbl_teacher_subject` `ts` on((`ts`.`teacher` = `t`.`id`))) left join `tbl_subjects` `sj` on((`ts`.`subject` = `sj`.`id`))) left join `vw_geo_area_list` on(((`t`.`cur_province` = `vw_geo_area_list`.`pid`) and (`t`.`cur_district` = `vw_geo_area_list`.`did`) and (`t`.`cur_commune` = `vw_geo_area_list`.`cid`) and (`t`.`cur_village` = `vw_geo_area_list`.`vid`)))) group by `t`.`name_kh`;

-- ----------------------------
-- View structure for vw_teacher_study_rec
-- ----------------------------
DROP VIEW IF EXISTS `vw_teacher_study_rec`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_teacher_study_rec` AS select `tbl_teacher_study_rec`.`id` AS `id`,`tbl_teacher_level`.`t_level_kh` AS `t_level_kh`,`tbl_teacher_study_rec`.`major` AS `major`,`tbl_teacher_study_rec`.`institution` AS `institution`,`tbl_countries`.`country_name` AS `country_name`,`tbl_teacher_study_rec`.`year_start` AS `year_start`,`tbl_teacher_study_rec`.`year_end` AS `year_end`,`tbl_teacher_study_rec`.`thesis_title` AS `thesis_title`,`tbl_teacher_study_rec`.`teacher` AS `teacher` from ((`tbl_teacher_study_rec` left join `tbl_teacher_level` on((`tbl_teacher_study_rec`.`t_edu_level` = `tbl_teacher_level`.`id`))) left join `tbl_countries` on((`tbl_teacher_study_rec`.`country` = `tbl_countries`.`id`)));

-- ----------------------------
-- Procedure structure for sp_assessment_result_by_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_assessment_result_by_id`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_assessment_result_by_id`(IN `survey_id` INT)
BEGIN
SET @sql = NULL;
	SELECT
		 GROUP_CONCAT(DISTINCT
			CONCAT('AVG(IF(tec.id = ', id, ', tsr.score, NULL)) AS `', id,'` ')
		) INTO @sql
	FROM tbl_teacher_assessment_monthly_criteria WHERE `status`=1;
	SET @sql = CONCAT('
		SELECT
				st.id,
				st.name_kh, tsc.subject, sub.subject_kh,
				count(*)/(SELECT count(*) FROM tbl_teacher_assessment_monthly_criteria WHERE `status`=1) as respond, ',@sql,'
				FROM tbl_teachers AS st
				inner join tbl_teacher_assessment_monthly_details AS tsc on st.id = tsc.teacher
				inner join tbl_subjects AS sub ON sub.id = tsc.subject
				inner join tbl_teacher_assessment_monthly_score AS tsr on tsc.id = tsr.assess_detail_id
				inner join tbl_teacher_assessment_monthly_criteria AS tec on tec.id = tsr.criteria
				where tsc.assess_record_id IN (SELECT id FROM tbl_teacher_assessment_monthly_records WHERE assess_id=',survey_id ,')
				group by st.id, st.name_kh, tsc.subject
				order by name_kh ASC');
	PREPARE stmt FROM @sql; 
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_assessment_result_yearly
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_assessment_result_yearly`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_assessment_result_yearly`(IN ayear INT, IN ateacher INT, IN amonth INT)
BEGIN
SET @sql = NULL;
	SELECT
		 GROUP_CONCAT(DISTINCT
			CONCAT('AVG(IF(tec.id = ', id, ', tsr.score, NULL)) AS `', id,'` ')
		) INTO @sql
	FROM tbl_teacher_assessment_monthly_criteria WHERE `status`=1;
	SET @sql = CONCAT('
		SELECT
				tar.assess_id AS id,
				tam.`month`,
				tam.acad_year,
				tam.grade,
				tam.class,
				tg.group_name,
				tg.group_name_kh,
				troom.room_kh,
				troom.room_en,
				tg.time,
				ttime.time_kh,
				ttime.time_en,
				tsc.`subject`,
				sub.subject_kh,
				sub.subject_en,
				tbl_grade_levels.grade_en,
				tbl_grade_levels.grade_kh,
				count(*)/(SELECT count(*) FROM tbl_teacher_assessment_monthly_criteria WHERE `status`=1) as respond, ',@sql,'
				FROM tbl_teacher_assessment_monthly_details AS tsc
				INNER JOIN tbl_subjects AS sub ON sub.id = tsc.`subject`
				INNER JOIN tbl_teacher_assessment_monthly_score AS tsr ON tsc.id = tsr.assess_detail_id
				INNER JOIN tbl_teacher_assessment_monthly_criteria AS tec ON tec.id = tsr.criteria
				INNER JOIN tbl_teacher_assessment_monthly_records AS tar ON tsc.assess_record_id = tar.id
				INNER JOIN tbl_teacher_assessment_monthly AS tam ON tar.assess_id = tam.id
				INNER JOIN tbl_groups AS tg ON tg.id = tam.class
				INNER JOIN tbl_rooms AS troom ON troom.id=tg.room
				INNER JOIN tbl_study_times AS ttime ON ttime.id=tg.time
				INNER JOIN tbl_grade_levels ON tbl_grade_levels.id = tam.grade
				WHERE tam.acad_year=',ayear,' AND `month`=',amonth,' AND teacher=',ateacher,'
				GROUP BY tam.acad_year, tam.`month`, tam.grade, tam.class, tsc.`subject` 
				ORDER BY grade_kh ASC');
	PREPARE stmt FROM @sql; 
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_attendances_by_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_attendances_by_id`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_attendances_by_id`(IN acad_year_id INT,IN month_no INT, IN stu_id INT)
BEGIN  
    select 
		`tbl_subjects`.`subject_kh` AS `subject_kh`,
		COUNT(`tbl_attendances`.`is_permission`) AS `is_permission`,
		COUNT(`tbl_attendances`.`is_late`) AS `is_late`,
		COUNT(`tbl_attendances`.`is_absence`) AS `is_absence`
		from ((`tbl_attendances` 
		left join `tbl_academic_years` on((`tbl_academic_years`.`id` = `tbl_attendances`.`acad_year`))) 
		left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_attendances`.`subject`)))
		WHERE `acad_year` = acad_year_id AND MONTH(`date`) = month_no AND `id_student` = stu_id
		GROUP BY `subject_kh`;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_contact
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_contact`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_contact`(IN stu_id INT)
BEGIN  
			SELECT CONCAT(IF(tbl_staffs.gender=1, "លោក", "លោកស្រី") ,' ' ,tbl_staffs.name_kh ) as name_kh, tbl_staffs.phone as phone , tbl_staffs.telegram as telegram, 'គណៈគ្រប់គ្រង' as position FROM tbl_staffs 
			WHERE tbl_staffs.is_management = 1 AND tbl_staffs.`status` = 3
			UNION ALL
			SELECT CONCAT(IF(tbl_staffs.gender=1, "លោក", "លោកស្រី"),' ' ,tbl_staffs.name_kh ) as name_kh, tbl_staffs.phone as phone , tbl_staffs.telegram as telegram , tbl_job_position.position_kh as position FROM tbl_staffs
			INNER JOIN tbl_staff_job_pos ON tbl_staff_job_pos.staff = tbl_staffs.id
			INNER JOIN tbl_job_position ON tbl_job_position.id = tbl_staff_job_pos.position 
			WHERE tbl_staffs.`status` = 3 AND tbl_staff_job_pos.position = 1
			UNION ALL
			SELECT CONCAT(IF(tbl_staffs.gender=1, "លោក", "លោកស្រី") ,' ' ,tbl_staffs.name_kh ) as name_kh , tbl_staffs.phone as phone , tbl_staffs.telegram as telegram,CONCAT('អ្នកកាន់បន្ទុកថ្នាក់ទី ',tbl_groups.group_name_kh) as position
			FROM tbl_study_records
			INNER JOIN tbl_groups ON tbl_groups.id = tbl_study_records.`group`
			INNER JOIN tbl_staffs ON tbl_staffs.id = tbl_groups.home_teacher
			INNER JOIN tbl_academic_years ON tbl_academic_years.id = tbl_groups.acad_year
			WHERE tbl_study_records.id_student = stu_id AND tbl_academic_years.is_selected = 1 AND tbl_staffs.`status` = 3;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_student_by_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_student_by_id`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_student_by_id`(IN stu_id INT)
BEGIN  
			SELECT tbl_students.name_kh, CONCAT ('ថ្នាក់ទី ', tbl_groups.group_name_kh) as grade , 
      tbl_students.img_path, tbl_rooms.room_kh, tbl_students.phone , tbl_students.student_id , tbl_students.address 
      FROM tbl_study_records
      INNER JOIN tbl_students ON tbl_study_records.id_student = tbl_students.id
      INNER JOIN tbl_groups ON tbl_study_records.`group` = tbl_groups.id
      INNER JOIN tbl_rooms ON tbl_rooms.id = tbl_groups.room
      INNER JOIN tbl_grade_levels ON tbl_grade_levels.id = tbl_groups.grade
      INNER JOIN tbl_academic_years ON tbl_academic_years.id = tbl_groups.acad_year
      WHERE tbl_students.id = stu_id ORDER BY tbl_academic_years.is_selected DESC LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_student_subject_by_discipline
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_student_subject_by_discipline`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_student_subject_by_discipline`(IN acad_year INT,IN stu_id INT)
BEGIN  
			select distinct `tbl_subjects`.`subject_kh` AS `subject_kh`,tbl_subjects.id, tbl_subjects.sort
			from ((`tbl_student_discipline` 
			left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_discipline`.`subject`))) 
			left join `tbl_academic_years` on((`tbl_student_discipline`.`acad_year` = `tbl_academic_years`.`id`)))
			WHERE tbl_student_discipline.id_student = stu_id AND tbl_student_discipline.acad_year = acad_year AND tbl_subjects.subject_kh IS NOT NULL
			ORDER BY tbl_subjects.sort;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_subject_by_academic
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_subject_by_academic`;
delimiter ;;
CREATE PROCEDURE `fbis`.`sp_subject_by_academic`(IN acad INT,IN stu_id INT)
BEGIN  
			select distinct `tbl_subjects`.`subject_kh` AS `subject_kh`, tbl_subjects.sort
			from ((`tbl_student_discipline` 
			left join `tbl_subjects` on((`tbl_subjects`.`id` = `tbl_student_discipline`.`subject`))) 
			left join `tbl_academic_years` on((`tbl_student_discipline`.`acad_year` = `tbl_academic_years`.`id`)))
			WHERE tbl_student_discipline.id_student = stu_id AND tbl_student_discipline.acad_year = acad AND tbl_subjects.subject_kh IS NOT NULL
			ORDER BY tbl_subjects.sort;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
