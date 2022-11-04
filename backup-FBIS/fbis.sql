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

 Date: 04/11/2022 09:48:59
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
-- Table structure for tbl_branches
-- ----------------------------
DROP TABLE IF EXISTS `tbl_branches`;
CREATE TABLE `tbl_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
