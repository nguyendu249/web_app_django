/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : webapp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 22/09/2022 13:56:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add source', 7, 'add_source');
INSERT INTO `auth_permission` VALUES (26, 'Can change source', 7, 'change_source');
INSERT INTO `auth_permission` VALUES (27, 'Can delete source', 7, 'delete_source');
INSERT INTO `auth_permission` VALUES (28, 'Can view source', 7, 'view_source');
INSERT INTO `auth_permission` VALUES (29, 'Can add thumbnail', 8, 'add_thumbnail');
INSERT INTO `auth_permission` VALUES (30, 'Can change thumbnail', 8, 'change_thumbnail');
INSERT INTO `auth_permission` VALUES (31, 'Can delete thumbnail', 8, 'delete_thumbnail');
INSERT INTO `auth_permission` VALUES (32, 'Can view thumbnail', 8, 'view_thumbnail');
INSERT INTO `auth_permission` VALUES (33, 'Can add thumbnail dimensions', 9, 'add_thumbnaildimensions');
INSERT INTO `auth_permission` VALUES (34, 'Can change thumbnail dimensions', 9, 'change_thumbnaildimensions');
INSERT INTO `auth_permission` VALUES (35, 'Can delete thumbnail dimensions', 9, 'delete_thumbnaildimensions');
INSERT INTO `auth_permission` VALUES (36, 'Can view thumbnail dimensions', 9, 'view_thumbnaildimensions');
INSERT INTO `auth_permission` VALUES (37, 'Can add category', 10, 'add_category');
INSERT INTO `auth_permission` VALUES (38, 'Can change category', 10, 'change_category');
INSERT INTO `auth_permission` VALUES (39, 'Can delete category', 10, 'delete_category');
INSERT INTO `auth_permission` VALUES (40, 'Can view category', 10, 'view_category');
INSERT INTO `auth_permission` VALUES (41, 'Can add product', 11, 'add_product');
INSERT INTO `auth_permission` VALUES (42, 'Can change product', 11, 'change_product');
INSERT INTO `auth_permission` VALUES (43, 'Can delete product', 11, 'delete_product');
INSERT INTO `auth_permission` VALUES (44, 'Can view product', 11, 'view_product');
INSERT INTO `auth_permission` VALUES (45, 'Can add order', 12, 'add_order');
INSERT INTO `auth_permission` VALUES (46, 'Can change order', 12, 'change_order');
INSERT INTO `auth_permission` VALUES (47, 'Can delete order', 12, 'delete_order');
INSERT INTO `auth_permission` VALUES (48, 'Can view order', 12, 'view_order');
INSERT INTO `auth_permission` VALUES (49, 'Can add order item', 13, 'add_orderitem');
INSERT INTO `auth_permission` VALUES (50, 'Can change order item', 13, 'change_orderitem');
INSERT INTO `auth_permission` VALUES (51, 'Can delete order item', 13, 'delete_orderitem');
INSERT INTO `auth_permission` VALUES (52, 'Can view order item', 13, 'view_orderitem');
INSERT INTO `auth_permission` VALUES (53, 'Can add course', 14, 'add_course');
INSERT INTO `auth_permission` VALUES (54, 'Can change course', 14, 'change_course');
INSERT INTO `auth_permission` VALUES (55, 'Can delete course', 14, 'delete_course');
INSERT INTO `auth_permission` VALUES (56, 'Can view course', 14, 'view_course');
INSERT INTO `auth_permission` VALUES (57, 'Can add type_course', 15, 'add_type_course');
INSERT INTO `auth_permission` VALUES (58, 'Can change type_course', 15, 'change_type_course');
INSERT INTO `auth_permission` VALUES (59, 'Can delete type_course', 15, 'delete_type_course');
INSERT INTO `auth_permission` VALUES (60, 'Can view type_course', 15, 'view_type_course');
INSERT INTO `auth_permission` VALUES (61, 'Can add topic', 16, 'add_topic');
INSERT INTO `auth_permission` VALUES (62, 'Can change topic', 16, 'change_topic');
INSERT INTO `auth_permission` VALUES (63, 'Can delete topic', 16, 'delete_topic');
INSERT INTO `auth_permission` VALUES (64, 'Can view topic', 16, 'view_topic');
INSERT INTO `auth_permission` VALUES (65, 'Can add lesson', 17, 'add_lesson');
INSERT INTO `auth_permission` VALUES (66, 'Can change lesson', 17, 'change_lesson');
INSERT INTO `auth_permission` VALUES (67, 'Can delete lesson', 17, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view lesson', 17, 'view_lesson');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$390000$AYs2cVihABTj9TO6W6THhG$h3f6jBrkrPzxD6wQrCOqBikMcnwDOS98i+Kbz9hhO+o=', '2022-09-22 13:30:45.332820', 1, 'admin', 'Sang', 'Nguyen Van', 'admin@gmail.com', 1, 1, '2022-09-16 10:14:58.031230');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$390000$8yRH0J6sKMAdX1KWMdIbqL$fupnLPH6lzt/295XsueRTpntc0snsztXxgeb2F4jH14=', '2022-09-22 13:32:58.866555', 0, 'nguyensang02610', '', '', '', 0, 1, '2022-09-22 01:39:47.497798');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for course_course
-- ----------------------------
DROP TABLE IF EXISTS `course_course`;
CREATE TABLE `course_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(1500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `updated` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `type_course_id` bigint(20) NOT NULL,
  `video_intro` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_course_type_course_id_c331c60d_fk_course_type_course_id`(`type_course_id`) USING BTREE,
  INDEX `course_course_id_slug_48390898_idx`(`id`, `slug`) USING BTREE,
  INDEX `course_course_slug_8ca9d9ef`(`slug`) USING BTREE,
  CONSTRAINT `course_course_type_course_id_c331c60d_fk_course_type_course_id` FOREIGN KEY (`type_course_id`) REFERENCES `course_type_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_course
-- ----------------------------
INSERT INTO `course_course` VALUES (1, '1 Hour HTML', '1-hour-html', 'Have you ever wanted to learn to code but don\'t know where to start? Learning how to code can get you a better job and lead to a better future. This course starts you off with the basic coding language of HTML. This is a very condensed 1 hour tutorial that will show you how to code in HTML. Enroll to begin your journey to be a web development master', 'Paid', 150, 'media/course/2022/09/21/xml-vs-html.jpg', '2022-09-22 02:35:01.510651', '2022-09-22 02:35:01.510651', 2, '<iframe width=\"100%\" height=\"250\" src=\"https://www.youtube.com/embed/DEoyBXf_h5U\" title=\"Duyên Duyên Số Số - Du Uyên x Nguyễn Thương (Air Remix) - Gặp Gỡ Để Chia Ly Chia Ly Để Gặp Gỡ Remix\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `course_course` VALUES (11, 'How to Learn JavaScript', 'how-to-learn-javascript', 'A Brief Introduction to JavaScript\r\nJavaScript, commonly abbreviated as ‘JS’, is a programming language primarily used to create complex features on websites. HTML, CSS, and JavaScript make up the framework of web design.\r\n\r\nYou can think of HTML as the most basic component, CSS as defining fundamental visual elements, and JavaScript as the code that handles the most advanced features. For instance, JavaScript is responsible for most interactive content on the web.\r\n\r\nFor example, browser games function thanks to JavaScript events. When you use an interactive map, you’re looking at JS as well. Features like clicking and dragging routes, loading local data, and even animations depend on this core language.\r\n\r\nGoogle Maps usage of JavaScript\r\nEssentially, HTML and CSS are used to define the basic look and makeup of elements on the web. JavaScript allows those elements to do more than just statically display information on the screen.\r\n\r\nFurthermore, JavaScript is used to animate objects both large and small on the web. This can be as simple as a notification icon for an app or as complicated as a weather radar map. Essentially, JavaScript controls how CSS elements function in order to create powerful animations with only a few lines of code.\r\n\r\nYou might want to think of JavaScript as the conductor of an orchestra. HTML is the instruments, CSS is the performers, and JavaScript is running the show.', 'Paid', 2000, 'media/course/2022/09/21/Learn-JavaScript-Social.jpeg', '2022-09-22 02:35:04.503990', '2022-09-22 02:35:04.503990', 2, '<iframe width=\"100%\" height=\"250\" src=\"https://www.youtube.com/embed/CHw1b_1LVBA?list=RDMMCHw1b_1LVBA\" title=\"MONO - Waiting For You (Album 22 - Track No.10)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `course_course` VALUES (12, 'Django for Web Development', 'django-for-web-development', 'In this learning path, you’ll get started with Django and build projects along the way. Django is a high-level web application framework with loads of features. It’s great for anyone new to web development in Python because of its fantastic documentation.', 'Paid', 250, 'media/course/2022/09/21/Python-and-Django-for-Web-Development.jpg', '2022-09-22 02:35:07.350330', '2022-09-22 02:35:07.350330', 2, '<iframe width=\"100%\" height=\"250\" src=\"https://www.youtube.com/embed/_Qbyza9z4pk?list=RDMMCHw1b_1LVBA\" title=\"Tấm Lòng Son Remix -Giọt Buồn Vương Trên Màu Mắt Ai Remix Hot TikTok | Nhạc Remix Gây Nghiện 2022\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');

-- ----------------------------
-- Table structure for course_lesson
-- ----------------------------
DROP TABLE IF EXISTS `course_lesson`;
CREATE TABLE `course_lesson`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `video` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_lesson_topic_id_531aa78d_fk_course_topic_id`(`topic_id`) USING BTREE,
  CONSTRAINT `course_lesson_topic_id_531aa78d_fk_course_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `course_topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for course_topic
-- ----------------------------
DROP TABLE IF EXISTS `course_topic`;
CREATE TABLE `course_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_topic_course_id_0f9461f0_fk_course_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `course_topic_course_id_0f9461f0_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_topic
-- ----------------------------
INSERT INTO `course_topic` VALUES (1, 'Hi i am sang', 'Hi i am sang', 1);

-- ----------------------------
-- Table structure for course_type_course
-- ----------------------------
DROP TABLE IF EXISTS `course_type_course`;
CREATE TABLE `course_type_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_type_course
-- ----------------------------
INSERT INTO `course_type_course` VALUES (1, 'Designer', '2022-09-20 19:45:55.032524');
INSERT INTO `course_type_course` VALUES (2, 'IT - Solutions', '2022-09-21 02:11:45.952734');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2022-09-16 10:18:45.129698', '2', 'Long dress', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (2, '2022-09-16 10:19:42.067406', '1', 'T shirt', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (3, '2022-09-16 10:20:05.262186', '1', 'T shirt', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (4, '2022-09-16 19:05:37.584922', '3', 'Crop Top', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (5, '2022-09-16 19:06:04.874685', '2', 'Dres CropTOP', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (6, '2022-09-20 19:45:55.034518', '1', 'Designer', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (7, '2022-09-20 19:46:53.981199', '1', 'Be come an profession desigher', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (8, '2022-09-20 19:49:34.893584', '1', 'Topic object (1)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (9, '2022-09-21 01:39:58.828683', '1', 'Be come an profession designer', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (10, '2022-09-21 02:07:24.767669', '1', '1 Hour HTML', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\", \"Description\", \"Type\", \"Video intro\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (11, '2022-09-21 02:08:52.871468', '1', '1 Hour HTML', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (12, '2022-09-21 02:11:45.953354', '2', 'IT - Solutions', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (13, '2022-09-21 02:13:35.342624', '11', 'How to Learn JavaScript', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (14, '2022-09-21 02:20:03.582636', '12', 'Django for Web Development', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (15, '2022-09-21 02:20:07.920785', '1', '1 Hour HTML', 2, '[{\"changed\": {\"fields\": [\"Type course\"]}}]', 14, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'course', 'course');
INSERT INTO `django_content_type` VALUES (17, 'course', 'lesson');
INSERT INTO `django_content_type` VALUES (16, 'course', 'topic');
INSERT INTO `django_content_type` VALUES (15, 'course', 'type_course');
INSERT INTO `django_content_type` VALUES (7, 'easy_thumbnails', 'source');
INSERT INTO `django_content_type` VALUES (8, 'easy_thumbnails', 'thumbnail');
INSERT INTO `django_content_type` VALUES (9, 'easy_thumbnails', 'thumbnaildimensions');
INSERT INTO `django_content_type` VALUES (12, 'orders', 'order');
INSERT INTO `django_content_type` VALUES (13, 'orders', 'orderitem');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (10, 'store', 'category');
INSERT INTO `django_content_type` VALUES (11, 'store', 'product');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-09-16 10:14:32.833539');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-09-16 10:14:33.286213');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-09-16 10:14:33.396455');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-09-16 10:14:33.403439');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-16 10:14:33.411416');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-09-16 10:14:33.486144');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-09-16 10:14:33.501963');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-09-16 10:14:33.522909');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-09-16 10:14:33.529888');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-09-16 10:14:33.573771');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-09-16 10:14:33.577761');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-16 10:14:33.584742');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-09-16 10:14:33.600699');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-16 10:14:33.620646');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-09-16 10:14:33.638597');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-09-16 10:14:33.647575');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-16 10:14:33.664528');
INSERT INTO `django_migrations` VALUES (18, 'easy_thumbnails', '0001_initial', '2022-09-16 10:14:33.839285');
INSERT INTO `django_migrations` VALUES (19, 'easy_thumbnails', '0002_thumbnaildimensions', '2022-09-16 10:14:33.904326');
INSERT INTO `django_migrations` VALUES (20, 'store', '0001_initial', '2022-09-16 10:14:34.023492');
INSERT INTO `django_migrations` VALUES (21, 'store', '0002_auto_20200916_1323', '2022-09-16 10:14:34.106369');
INSERT INTO `django_migrations` VALUES (22, 'store', '0003_auto_20200916_1333', '2022-09-16 10:14:34.121214');
INSERT INTO `django_migrations` VALUES (23, 'store', '0004_auto_20200916_1357', '2022-09-16 10:14:34.125920');
INSERT INTO `django_migrations` VALUES (24, 'orders', '0001_initial', '2022-09-16 10:14:34.317283');
INSERT INTO `django_migrations` VALUES (25, 'orders', '0002_order_total_price', '2022-09-16 10:14:34.364477');
INSERT INTO `django_migrations` VALUES (26, 'orders', '0003_auto_20200917_1334', '2022-09-16 10:14:34.375189');
INSERT INTO `django_migrations` VALUES (27, 'orders', '0004_auto_20200917_1340', '2022-09-16 10:14:34.384164');
INSERT INTO `django_migrations` VALUES (28, 'orders', '0005_auto_20200917_1517', '2022-09-16 10:14:34.393141');
INSERT INTO `django_migrations` VALUES (29, 'orders', '0006_auto_20200918_1458', '2022-09-16 10:14:34.409078');
INSERT INTO `django_migrations` VALUES (30, 'orders', '0007_orderitem_total', '2022-09-16 10:14:34.456981');
INSERT INTO `django_migrations` VALUES (31, 'sessions', '0001_initial', '2022-09-16 10:14:34.494029');
INSERT INTO `django_migrations` VALUES (32, 'store', '0005_auto_20211104_0957', '2022-09-16 10:14:34.551437');
INSERT INTO `django_migrations` VALUES (33, 'course', '0001_initial', '2022-09-20 19:38:25.053519');
INSERT INTO `django_migrations` VALUES (34, 'course', '0002_alter_lesson_description_alter_topic_description', '2022-09-21 00:18:14.565902');
INSERT INTO `django_migrations` VALUES (35, 'course', '0003_alter_course_description', '2022-09-21 00:20:28.819630');
INSERT INTO `django_migrations` VALUES (36, 'course', '0002_alter_course_description_alter_lesson_description_and_more', '2022-09-21 00:22:32.142551');
INSERT INTO `django_migrations` VALUES (37, 'course', '0003_alter_course_description_alter_lesson_description_and_more', '2022-09-21 00:23:23.796337');
INSERT INTO `django_migrations` VALUES (38, 'course', '0004_course_video_intro', '2022-09-21 01:22:34.901463');
INSERT INTO `django_migrations` VALUES (39, 'course', '0005_course_title', '2022-09-21 02:01:58.776184');
INSERT INTO `django_migrations` VALUES (40, 'course', '0005_alter_course_description_alter_course_name_and_more', '2022-09-21 02:06:32.374541');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('j98pe3cfj002nm22bbaj4ty3xht5viak', '.eJxVjEEOgyAQRe8y64ZIYcrgsnvPYAYGim2jCerKePfWxI3b_977G0SuC7TbfoOe16X065xqPwi0oOGyBY6fNB5A3jy-JhWncalDUIeiTjqrbpL0fZ7u5aDwXP71wxOJYRQk0ejYJJOssfcGPTbOuJC9JsEQPOdG0GI24rLOwRJRjAT7DxAVOt8:1oZ9Sq:cVhsyTC8oRx6jplk_ljWGt33lad2S6KlPPT5TsmZDR4', '2022-09-30 18:24:56.502878');
INSERT INTO `django_session` VALUES ('ryal41bklw2xocdtjy4xcfo3tu8v6p2d', '.eJxVjDEOgzAMRe_iuYoIiWXC2L1nQE4cF9oKJAgT4u4UiYX1v_f-BonnAu22P6DjtfTduuS5GwRaqOG2RU7fPJ5APjy-J5OmscxDNKdiLrqY1yT597zc20HPS_-vUb2tnGuIAoVQC2ogrz5KJezIJ60zViqC0sSIijY6y5is9USoLsF-ABW3Ov0:1obFlc:bd7kaJCCoBPhCK9BTPX4N8B2K8525nUXxaaWBMkXuRw', '2022-10-06 13:33:00.260361');

-- ----------------------------
-- Table structure for easy_thumbnails_source
-- ----------------------------
DROP TABLE IF EXISTS `easy_thumbnails_source`;
CREATE TABLE `easy_thumbnails_source`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `easy_thumbnails_source_storage_hash_name_481ce32d_uniq`(`storage_hash`, `name`) USING BTREE,
  INDEX `easy_thumbnails_source_storage_hash_946cbcc9`(`storage_hash`) USING BTREE,
  INDEX `easy_thumbnails_source_name_5fe0edc6`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easy_thumbnails_source
-- ----------------------------
INSERT INTO `easy_thumbnails_source` VALUES (1, 'f9bde26a1556cd667f742bd34ec7c55e', 'media/products/2022/09/16/2.png', '2022-09-16 10:20:10.367682');
INSERT INTO `easy_thumbnails_source` VALUES (2, 'f9bde26a1556cd667f742bd34ec7c55e', 'media/products/2022/09/16/2a0e4e55a6ca699430db.jpg', '2022-09-20 17:03:39.868502');

-- ----------------------------
-- Table structure for easy_thumbnails_thumbnail
-- ----------------------------
DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
CREATE TABLE `easy_thumbnails_thumbnail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq`(`storage_hash`, `name`, `source_id`) USING BTREE,
  INDEX `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum`(`source_id`) USING BTREE,
  INDEX `easy_thumbnails_thumbnail_storage_hash_f1435f49`(`storage_hash`) USING BTREE,
  INDEX `easy_thumbnails_thumbnail_name_b5882c31`(`name`) USING BTREE,
  CONSTRAINT `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easy_thumbnails_thumbnail
-- ----------------------------
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1, 'd26becbf46ac48eda79c7a39a13a02dd', 'media/products/2022/09/16\\2.png.0x150_q85.jpg', '2022-09-16 10:20:08.149509', 1);
INSERT INTO `easy_thumbnails_thumbnail` VALUES (2, 'd26becbf46ac48eda79c7a39a13a02dd', 'media/products/2022/09/16\\2.png.500x0_q85.jpg', '2022-09-16 10:20:10.370674', 1);
INSERT INTO `easy_thumbnails_thumbnail` VALUES (3, 'd26becbf46ac48eda79c7a39a13a02dd', 'media/products/2022/09/16\\2a0e4e55a6ca699430db.jpg.0x150_q85.jpg', '2022-09-16 19:06:12.435861', 2);
INSERT INTO `easy_thumbnails_thumbnail` VALUES (4, 'd26becbf46ac48eda79c7a39a13a02dd', 'media/products/2022/09/16\\2a0e4e55a6ca699430db.jpg.500x0_q85.jpg', '2022-09-20 17:03:39.872491', 2);

-- ----------------------------
-- Table structure for easy_thumbnails_thumbnaildimensions
-- ----------------------------
DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
CREATE TABLE `easy_thumbnails_thumbnaildimensions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) UNSIGNED NULL DEFAULT NULL,
  `height` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `thumbnail_id`(`thumbnail_id`) USING BTREE,
  CONSTRAINT `easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easy_thumbnails_thumbnaildimensions
-- ----------------------------

-- ----------------------------
-- Table structure for orders_order
-- ----------------------------
DROP TABLE IF EXISTS `orders_order`;
CREATE TABLE `orders_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pin_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_order_user_id_e9b59eb1_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_order
-- ----------------------------
INSERT INTO `orders_order` VALUES (1, '30', '10000', 'zzzz', 0, '2022-09-20 17:03:50.288556', '2022-09-20 17:03:50.288556', 'Pending', 1, 200000);

-- ----------------------------
-- Table structure for orders_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orders_orderitem`;
CREATE TABLE `orders_orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_orderitem_order_id_fe61a34d_fk_orders_order_id`(`order_id`) USING BTREE,
  INDEX `orders_orderitem_product_id_afe4254a_fk_store_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_orderitem
-- ----------------------------
INSERT INTO `orders_orderitem` VALUES (1, 1, 1, 2, 200000);

-- ----------------------------
-- Table structure for store_category
-- ----------------------------
DROP TABLE IF EXISTS `store_category`;
CREATE TABLE `store_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_category
-- ----------------------------
INSERT INTO `store_category` VALUES (2, 'Long dress', 'long-dress');
INSERT INTO `store_category` VALUES (3, 'Crop Top', 'crop-top');

-- ----------------------------
-- Table structure for store_product
-- ----------------------------
DROP TABLE IF EXISTS `store_product`;
CREATE TABLE `store_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `availibility` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_product_category_id_574bae65_fk_store_category_id`(`category_id`) USING BTREE,
  INDEX `store_product_slug_6de8ee4b`(`slug`) USING BTREE,
  INDEX `store_product_id_slug_acb6888a_idx`(`id`, `slug`) USING BTREE,
  CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_product
-- ----------------------------
INSERT INTO `store_product` VALUES (1, 'T shirt', 't-shirt', 'how to use this in my website', 200000, '2022-09-16 10:19:42.066978', '2022-09-16 10:20:05.259189', 'media/products/2022/09/16/2.png', 1, 2);
INSERT INTO `store_product` VALUES (2, 'Dres CropTOP', 'dres-croptop', 'Dres CropTOP', 200000, '2022-09-16 19:06:04.871693', '2022-09-16 19:06:04.871693', 'media/products/2022/09/16/2a0e4e55a6ca699430db.jpg', 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
