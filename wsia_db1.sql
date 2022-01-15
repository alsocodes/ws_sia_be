/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL 26
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3307
 Source Schema         : wsia_db1

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/01/2022 15:52:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album-galleries
-- ----------------------------
DROP TABLE IF EXISTS `album-galleries`;
CREATE TABLE `album-galleries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `album_id`(`album_id`) USING BTREE,
  INDEX `gallery_id`(`gallery_id`) USING BTREE,
  CONSTRAINT `album-galleries_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album-galleries_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of album-galleries
-- ----------------------------

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of albums
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` enum('post','file') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'post',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for category_posts
-- ----------------------------
DROP TABLE IF EXISTS `category_posts`;
CREATE TABLE `category_posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_posts
-- ----------------------------

-- ----------------------------
-- Table structure for classrooms
-- ----------------------------
DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE `classrooms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classrooms
-- ----------------------------
INSERT INTO `classrooms` VALUES (1, 'VII', 'A', 'Kelas VII-A', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (2, 'VII', 'B', 'Kelas VII-B', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (3, 'VII', 'C', 'Kelas VII-C', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (4, 'VII', 'D', 'Kelas VII-D', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (5, 'VII', 'E', 'Kelas VII-E', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (6, 'VII', 'G', 'Kelas VII-G', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (7, 'VII', 'F', 'Kelas VII-F', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (8, 'VII', 'H', 'Kelas VII-H', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (9, 'VII', 'J', 'Kelas VII-J', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (10, 'VIII', 'A', 'Kelas VIII-A', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (11, 'VIII', 'B', 'Kelas VIII-B', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (12, 'VII', 'I', 'Kelas VII-I', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (13, 'VIII', 'C', 'Kelas VIII-C', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (14, 'VIII', 'D', 'Kelas VIII-D', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (15, 'VIII', 'E', 'Kelas VIII-E', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (16, 'VIII', 'F', 'Kelas VIII-F', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (17, 'VIII', 'G', 'Kelas VIII-G', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (18, 'VIII', 'H', 'Kelas VIII-H', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (19, 'VIII', 'I', 'Kelas VIII-I', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (20, 'VIII', 'J', 'Kelas VIII-J', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (21, 'IX', 'A', 'Kelas IX-A', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (22, 'IX', 'B', 'Kelas IX-B', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (23, 'IX', 'C', 'Kelas IX-C', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (24, 'IX', 'D', 'Kelas IX-D', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (25, 'IX', 'E', 'Kelas IX-E', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (26, 'IX', 'F', 'Kelas IX-F', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (27, 'IX', 'G', 'Kelas IX-G', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (28, 'IX', 'H', 'Kelas IX-H', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (29, 'IX', 'I', 'Kelas IX-I', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);
INSERT INTO `classrooms` VALUES (30, 'IX', 'J', 'Kelas IX-J', '2022-01-12 19:48:58', '2022-01-12 19:48:58', NULL);

-- ----------------------------
-- Table structure for eduyears
-- ----------------------------
DROP TABLE IF EXISTS `eduyears`;
CREATE TABLE `eduyears`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('passed','active','draft') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'draft',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of eduyears
-- ----------------------------
INSERT INTO `eduyears` VALUES (1, '2021', '2021/2022', 'active', '2022-01-12 19:51:14', '2022-01-12 19:51:17', NULL);

-- ----------------------------
-- Table structure for galleries
-- ----------------------------
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` enum('image','video') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'image',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of galleries
-- ----------------------------
INSERT INTO `galleries` VALUES (1, 'Galleri 1', 'deskripsi galeri satu', 'gallery-1640219026794.jpg', 'image', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `galleries` VALUES (2, 'Galleri 2', 'deskripsi galeri dua', 'gallery-1641302468757.jpg', 'image', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `galleries` VALUES (3, 'Galleri 3', 'deskripsi galeri tiga', '03H1RPOh0Q8', 'video', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `galleries` VALUES (4, 'Galleri 4', 'deskripsi galeri empat', 'gallery-1641302378216.jpg', 'image', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);

-- ----------------------------
-- Table structure for generals
-- ----------------------------
DROP TABLE IF EXISTS `generals`;
CREATE TABLE `generals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of generals
-- ----------------------------
INSERT INTO `generals` VALUES (1, 'site name', 'smpn33-sby.sch.id', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (2, 'logo', '', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (3, 'phone', '031-3456789', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (4, 'organization', 'SMP Negeri 33 Surabaya', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (5, 'email', 'smpn33@gmail.com', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (6, 'youtube', 'https://youtube.com', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (7, 'address', 'Jl. Bukit Darmo Golf No.3, Putat Gede, Kec. Sukomanunggal, Kota SBY, Jawa Timur 60189', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (8, 'facebook', 'https://facebook.com', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (9, 'twitter', '', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `generals` VALUES (10, 'instagram', 'https://instagram.com', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);

-- ----------------------------
-- Table structure for lesson_class_materials
-- ----------------------------
DROP TABLE IF EXISTS `lesson_class_materials`;
CREATE TABLE `lesson_class_materials`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_class_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `attachment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lesson_class_materials
-- ----------------------------

-- ----------------------------
-- Table structure for lesson_class_students
-- ----------------------------
DROP TABLE IF EXISTS `lesson_class_students`;
CREATE TABLE `lesson_class_students`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_class_id` int(11) NOT NULL,
  `student_class_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `final_value` double NULL DEFAULT 0,
  `status` enum('active','passed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'active',
  `passed_at` datetime(0) NULL DEFAULT NULL,
  `passed_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lesson_class_students
-- ----------------------------
INSERT INTO `lesson_class_students` VALUES (41, 21, NULL, 2, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (42, 21, NULL, 3, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (43, 21, NULL, 4, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (44, 21, NULL, 6, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (45, 21, NULL, 7, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (46, 21, NULL, 8, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (47, 21, NULL, 5, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (48, 21, NULL, 9, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (49, 21, NULL, 10, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (50, 21, NULL, 11, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (51, 21, NULL, 12, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (52, 21, NULL, 13, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (53, 21, NULL, 14, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (54, 21, NULL, 15, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (55, 21, NULL, 16, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (56, 21, NULL, 17, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (57, 21, NULL, 18, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (58, 21, NULL, 19, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (59, 21, NULL, 20, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (60, 21, NULL, 21, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (61, 21, NULL, 22, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:56', '2022-01-13 21:31:56', NULL);
INSERT INTO `lesson_class_students` VALUES (62, 21, NULL, 23, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (63, 21, NULL, 24, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (64, 21, NULL, 25, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (65, 21, NULL, 26, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (66, 21, NULL, 27, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (67, 21, NULL, 28, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (68, 21, NULL, 29, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (69, 21, NULL, 30, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (70, 21, NULL, 31, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (71, 21, NULL, 32, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (72, 21, NULL, 33, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (73, 21, NULL, 34, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (74, 21, NULL, 35, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (75, 21, NULL, 36, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (76, 21, NULL, 37, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (77, 21, NULL, 38, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (78, 21, NULL, 39, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (79, 21, NULL, 40, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (80, 21, NULL, 41, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:31:57', '2022-01-13 21:31:57', NULL);
INSERT INTO `lesson_class_students` VALUES (81, 21, NULL, 1, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 21:41:14', '2022-01-13 21:41:14', NULL);
INSERT INTO `lesson_class_students` VALUES (82, 4, NULL, 74, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (83, 4, NULL, 78, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (84, 4, NULL, 76, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (85, 4, NULL, 75, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (86, 4, NULL, 77, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (87, 4, NULL, 79, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (88, 4, NULL, 80, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (89, 4, NULL, 81, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (90, 4, NULL, 82, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (91, 4, NULL, 83, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (92, 4, NULL, 84, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (93, 4, NULL, 85, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (94, 4, NULL, 86, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (95, 4, NULL, 87, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (96, 4, NULL, 88, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (97, 4, NULL, 89, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (98, 4, NULL, 90, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (99, 4, NULL, 91, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (100, 4, NULL, 92, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (101, 4, NULL, 93, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (102, 4, NULL, 94, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (103, 4, NULL, 95, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (104, 4, NULL, 96, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (105, 4, NULL, 97, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (106, 4, NULL, 98, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (107, 4, NULL, 99, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (108, 4, NULL, 100, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (109, 4, NULL, 101, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (110, 4, NULL, 102, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:04', '2022-01-14 06:12:04', NULL);
INSERT INTO `lesson_class_students` VALUES (111, 7, NULL, 74, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (112, 7, NULL, 75, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (113, 7, NULL, 78, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (114, 7, NULL, 79, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (115, 7, NULL, 76, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (116, 7, NULL, 77, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (117, 7, NULL, 80, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (118, 7, NULL, 81, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (119, 7, NULL, 82, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (120, 7, NULL, 83, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (121, 7, NULL, 84, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (122, 7, NULL, 85, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (123, 7, NULL, 86, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (124, 7, NULL, 87, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (125, 7, NULL, 88, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (126, 7, NULL, 89, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (127, 7, NULL, 90, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (128, 7, NULL, 91, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (129, 7, NULL, 92, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (130, 7, NULL, 93, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (131, 7, NULL, 94, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (132, 7, NULL, 95, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (133, 7, NULL, 96, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (134, 7, NULL, 97, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (135, 7, NULL, 98, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (136, 7, NULL, 99, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (137, 7, NULL, 100, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (138, 7, NULL, 101, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (139, 7, NULL, 102, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:18', '2022-01-14 06:12:18', NULL);
INSERT INTO `lesson_class_students` VALUES (140, 8, NULL, 74, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (141, 8, NULL, 77, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (142, 8, NULL, 75, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (143, 8, NULL, 76, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (144, 8, NULL, 79, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (145, 8, NULL, 80, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (146, 8, NULL, 81, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (147, 8, NULL, 78, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (148, 8, NULL, 82, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (149, 8, NULL, 83, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (150, 8, NULL, 84, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (151, 8, NULL, 85, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (152, 8, NULL, 86, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (153, 8, NULL, 87, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (154, 8, NULL, 88, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (155, 8, NULL, 89, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (156, 8, NULL, 90, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (157, 8, NULL, 91, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (158, 8, NULL, 92, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (159, 8, NULL, 93, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (160, 8, NULL, 94, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (161, 8, NULL, 95, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (162, 8, NULL, 96, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (163, 8, NULL, 97, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (164, 8, NULL, 98, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (165, 8, NULL, 99, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (166, 8, NULL, 100, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (167, 8, NULL, 101, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (168, 8, NULL, 102, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:34', '2022-01-14 06:12:34', NULL);
INSERT INTO `lesson_class_students` VALUES (169, 14, NULL, 75, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (170, 14, NULL, 78, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (171, 14, NULL, 76, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (172, 14, NULL, 74, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (173, 14, NULL, 77, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (174, 14, NULL, 79, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (175, 14, NULL, 80, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (176, 14, NULL, 81, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (177, 14, NULL, 82, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (178, 14, NULL, 83, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (179, 14, NULL, 84, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (180, 14, NULL, 85, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (181, 14, NULL, 86, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (182, 14, NULL, 87, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (183, 14, NULL, 88, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (184, 14, NULL, 89, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (185, 14, NULL, 90, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (186, 14, NULL, 91, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (187, 14, NULL, 92, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (188, 14, NULL, 93, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (189, 14, NULL, 94, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (190, 14, NULL, 95, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (191, 14, NULL, 96, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (192, 14, NULL, 97, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (193, 14, NULL, 98, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (194, 14, NULL, 99, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (195, 14, NULL, 100, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (196, 14, NULL, 101, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (197, 14, NULL, 102, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:12:58', '2022-01-14 06:12:58', NULL);
INSERT INTO `lesson_class_students` VALUES (198, 15, NULL, 74, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (199, 15, NULL, 78, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (200, 15, NULL, 75, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (201, 15, NULL, 76, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (202, 15, NULL, 77, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (203, 15, NULL, 79, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (204, 15, NULL, 80, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (205, 15, NULL, 81, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (206, 15, NULL, 82, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (207, 15, NULL, 83, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (208, 15, NULL, 84, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (209, 15, NULL, 85, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (210, 15, NULL, 86, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (211, 15, NULL, 87, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (212, 15, NULL, 88, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (213, 15, NULL, 89, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (214, 15, NULL, 90, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (215, 15, NULL, 91, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (216, 15, NULL, 92, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (217, 15, NULL, 93, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (218, 15, NULL, 94, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (219, 15, NULL, 95, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (220, 15, NULL, 96, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (221, 15, NULL, 97, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (222, 15, NULL, 98, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (223, 15, NULL, 99, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (224, 15, NULL, 100, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (225, 15, NULL, 101, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);
INSERT INTO `lesson_class_students` VALUES (226, 15, NULL, 102, 0, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:13:12', '2022-01-14 06:13:12', NULL);

-- ----------------------------
-- Table structure for lesson_class_task_submits
-- ----------------------------
DROP TABLE IF EXISTS `lesson_class_task_submits`;
CREATE TABLE `lesson_class_task_submits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_class_task_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `answer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `attachment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('draft','submit') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `submitted_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lesson_class_task_submits
-- ----------------------------

-- ----------------------------
-- Table structure for lesson_class_tasks
-- ----------------------------
DROP TABLE IF EXISTS `lesson_class_tasks`;
CREATE TABLE `lesson_class_tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_class_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `attachment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deadline_at` datetime(0) NOT NULL,
  `status` enum('draft','open','close') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `open_at` datetime(0) NULL DEFAULT NULL,
  `close_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lesson_class_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for lesson_classes
-- ----------------------------
DROP TABLE IF EXISTS `lesson_classes`;
CREATE TABLE `lesson_classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) NOT NULL,
  `eduyear_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `semester_id` int(11) NOT NULL,
  `status` enum('active','passed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'active',
  `passed_at` datetime(0) NULL DEFAULT NULL,
  `passed_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `classroom_id`(`classroom_id`) USING BTREE,
  INDEX `eduyear_id`(`eduyear_id`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `lesson_classes_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_classes_ibfk_2` FOREIGN KEY (`eduyear_id`) REFERENCES `eduyears` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_classes_ibfk_3` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_classes_ibfk_4` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_classes_ibfk_5` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lesson_classes
-- ----------------------------
INSERT INTO `lesson_classes` VALUES (4, 1, 1, 1, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 07:47:29', '2022-01-13 07:47:29', NULL);
INSERT INTO `lesson_classes` VALUES (7, 1, 1, 4, 2, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:18:50', '2022-01-13 08:18:50', NULL);
INSERT INTO `lesson_classes` VALUES (8, 1, 1, 3, 7, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:18:50', '2022-01-13 08:18:50', NULL);
INSERT INTO `lesson_classes` VALUES (9, 1, 1, 2, 13, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:21:26', '2022-01-13 08:22:10', '2022-01-13 08:22:10');
INSERT INTO `lesson_classes` VALUES (10, 1, 1, 5, 9, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:21:26', '2022-01-13 08:21:35', '2022-01-13 08:21:35');
INSERT INTO `lesson_classes` VALUES (11, 1, 1, 7, 1, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:10', '2022-01-13 08:22:10', NULL);
INSERT INTO `lesson_classes` VALUES (12, 1, 1, 8, 2, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:10', '2022-01-13 08:22:10', NULL);
INSERT INTO `lesson_classes` VALUES (13, 1, 1, 9, 3, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:10', '2022-01-13 08:22:10', NULL);
INSERT INTO `lesson_classes` VALUES (14, 1, 1, 2, 2, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (15, 1, 1, 5, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (16, 1, 1, 6, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (17, 1, 1, 10, 5, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (18, 1, 1, 11, 2, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (19, 1, 1, 13, 5, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (20, 1, 1, 12, 3, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 08:22:48', '2022-01-13 08:22:48', NULL);
INSERT INTO `lesson_classes` VALUES (21, 21, 1, 1, 2, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (22, 21, 1, 2, 3, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (23, 21, 1, 3, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (24, 21, 1, 4, 5, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (25, 21, 1, 5, 8, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (26, 21, 1, 6, 7, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (27, 21, 1, 7, 9, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (28, 21, 1, 9, 30, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (29, 21, 1, 8, 30, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (30, 21, 1, 10, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (31, 21, 1, 12, 4, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (32, 21, 1, 13, 14, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);
INSERT INTO `lesson_classes` VALUES (33, 21, 1, 11, 6, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-13 19:50:59', '2022-01-13 19:50:59', NULL);

-- ----------------------------
-- Table structure for lessons
-- ----------------------------
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lessons
-- ----------------------------
INSERT INTO `lessons` VALUES (1, 'MTK', 'Matematika', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (2, 'BID', 'Bahasa Indonesia', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (3, 'IPS', 'Ilmu Pengetahuan Sosial', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (4, 'BIG', 'Bahasa Inggris', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (5, 'IPA', 'Ilmu Pengetahuan Alam', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (6, 'PAK', 'Pendidikan Agama Kristen', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (7, 'PAH', 'Pendidikan Agama Hindu', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (8, 'PAI', 'Pendidikan Agama Islam', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (9, 'PKN', 'Pendidikan Kewarganegaraan', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (10, 'PJO', 'Penjas / PJOK', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (11, 'SBD', 'Seni Budaya', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (12, 'PRK', 'Prakarya', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);
INSERT INTO `lessons` VALUES (13, 'BJW', 'Bahasa Jawa', '2022-01-12 19:24:22', '2022-01-12 19:24:22', NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT 0,
  `post_id` int(11) NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `target` enum('self','blank','parent','top') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'parent',
  `urut` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'Beranda', 0, NULL, '', 'parent', '00', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `menus` VALUES (2, 'Profil', 0, NULL, 'profil-smpn-33-surabaya', 'parent', '01', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `menus` VALUES (3, 'Pengumuman', 0, NULL, 'pengumuman', 'parent', '02', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `menus` VALUES (4, 'Agenda', 0, NULL, 'agenda', 'parent', '03', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `menus` VALUES (5, 'Galeri', 0, NULL, 'galeri', 'parent', '04', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);
INSERT INTO `menus` VALUES (6, 'Kontak', 0, NULL, 'kontak', 'parent', '05', 'main', '2022-01-12 19:23:47', '2022-01-12 19:23:47', NULL);

-- ----------------------------
-- Table structure for post_meta
-- ----------------------------
DROP TABLE IF EXISTS `post_meta`;
CREATE TABLE `post_meta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  CONSTRAINT `post_meta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_meta
-- ----------------------------
INSERT INTO `post_meta` VALUES (1, 5, 'mtdt_headline_one', '1', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `post_meta` VALUES (2, 6, 'mtdt_headline_one', '1', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `post_meta` VALUES (3, 17, 'mtdt_headline_one', '1', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `post_meta` VALUES (4, 18, 'mtdt_headline_one', '1', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `excerpt` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `type` enum('article','page','agenda','news','preface') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('publish','draft') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'publish',
  `visibility` enum('public','private') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'public',
  `comment_status` enum('open','close') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'close',
  `slug` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `sub` int(11) NULL DEFAULT NULL,
  `agenda_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'Mencoba membuat tulisan baru', '<p><strong><em>tulisan ini dicetak tebal dan miring serta </em></strong><strong><em><ins>underlined</ins></em></strong></p>\n', 'Ini ringkasannya', 'img-1639983416272.jpg', 1, 'article', 'publish', 'public', 'close', 'mencoba-membuat-tulisan-baru', 'k1,k2', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (2, 'Mencoba membuat tulisan baru lagi', '<p><strong>xlwjdwdjdjwdjwldjwl</strong></p>\n', 'lalalalalasdsw', 'img-1639983840015.jpg', 1, 'article', 'publish', 'public', 'close', 'mencoba-membuat-tulisan-baru-lagi', 'k1,k2', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (3, 'Dimana aku disini dan kemana aku disana', '<p><strong>dwkdjwkwssxwwdwdwdwdwdwdwdwdw111111111</strong></p>\n<p><strong><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"IMG-20170410-WA0005.jpg\" src=\"http://localhost:3007/public/images/img-1640126359665.jpg\" alt=\"\" width=\"300\" height=\"215\" /></strong></p>\n<p><strong><img title=\"ss_notif_KC.JPG\" src=\"http://localhost:3007/public/images/img-1640126440108.jpg\" alt=\"\" width=\"625\" height=\"286\" /></strong></p>', 'dwkdwhkssss', 'img-1640089556587.jpg', 1, 'article', 'publish', 'public', 'close', 'dimana-aku-disinixx', 'kk11k1k1', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (4, 'Profil SMPN 33 Surabaya', '<p>A school is an educational institution designed to provide learning spaces and learning environments for the teaching of students under the direction of teachers. Most countries have systems of formal education, which is sometimes compulsory. In these systems...</p>\n<p>&nbsp;</p>', '', 'img-1641209764890.jpg', 1, 'page', 'publish', 'public', 'close', 'profil-smpn-33-surabaya', '', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (5, 'Hasil seleksi peserta olimiade', '<p>ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"New Project (3).png\" src=\"http://localhost:3007/public/images/img-1640130592509.png\" alt=\"\" width=\"358\" height=\"409\" /></p>', 'Telah dibuka hasil selesksi peserta olimiapde dari SMPN 33 yang akan mengikuti pertandingan pada 17 Agustus 2022.', 'img-1640971481880.jpg', 1, 'news', 'publish', 'public', 'close', 'hasil-seleksi-peserta-olimiade', '', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (6, 'Informasi daftar ulang', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'img-1640971383749.jpg', 1, 'news', 'publish', 'public', 'close', 'informasi-daftar-ulang', '', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (7, 'Pelantikan pengurus osis 2021', '<p>Pelantikan pengurus osis 2021</p>', 'Pelantikan pengurus osis 2021', 'img-1640131102831.jpeg', 1, 'agenda', 'publish', 'public', 'close', 'pelantikan-pengurus-osis-2021', 'Pelantikan pengurus osis 2021', 0, NULL, '2022-03-24 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (8, 'SMPN33 Surabaya menyiapkan generasi unggul untuk Indonesia Maju', '<p>Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.</p>\n<p>Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.</p>\n<p>Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.</p>\n<p>Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.</p>', 'Quisquam vel ut sint cum eos hic dolores aperiam.Sed deserunt et.Inventore et et dolor consequatur itaque ut voluptate sed et.Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.', 'img-1640212234027.jpg', 1, 'preface', 'publish', 'public', 'close', 'smpn33-surabaya-menyiapkan-generasi-unggul-untuk-indonesia-maju', 'rwrwrwrw', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (9, 'Persami dalam rangka penyambutan siswa baru 2022', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatio</p>\n<p>n ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in re</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'img-1640960659228.jpg', 1, 'agenda', 'publish', 'public', 'close', 'persami-dalam-rangka-penyambutan-siswa-baru-2022', 'kkka1', 0, NULL, '2022-02-12 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (10, 'Lllo inventore veritatis et quasi architecto ', '<p>&nbsp;ab illo inventore veritatis Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciu</p>\n<p>&nbsp;ab illo inventore veritatis Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatet quasi architecto&nbsp; ab illo inventore veritatis et quasi architecto</p>\n<p>nt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatet quasi architecto&nbsp; ab illo inventore veritatis et quasi architecto&nbsp;</p>', ' ab illo inventore veritatis Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatet quasi architecto  ab illo inventore veritatis et quasi architecto ', 'img-1640960946787.jpg', 1, 'agenda', 'publish', 'public', 'close', 'lllo-inventore-veritatis-et-quasi-architecto', 'k1,k2', 0, NULL, '2022-04-14 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (11, 'But I must explain to you how all this mistaken idea of denouncing pleasure', '<p><strong>But I must explain to you how all this mistaken idea of denouncing pleasure and praising </strong></p>\n<p>pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,</p>\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,</p>', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure,', 'img-1640963849413.jpg', 1, 'agenda', 'publish', 'public', 'close', 'but-i-must-explain-to-you-how-all-this-mistaken-idea-of-denouncing-pleasure', '', 0, NULL, '2022-06-13 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (12, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet</p>\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet</p>', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet', 'img-1640964027118.jpg', 1, 'agenda', 'publish', 'public', 'close', 'there-are-many-variations-of-passages-of-lorem-ipsum-available-but-the-majority-have-suffered', '', 0, NULL, '2022-07-19 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (13, 'The standard chunk of Lorem Ipsum used since the 1500s', '<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions fr</p>\n<p>om the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'img-1640963151946.jpg', 1, 'agenda', 'publish', 'public', 'close', 'the-standard-chunk-of-lorem-ipsum-used-since-the-1500s', '', 0, NULL, '2022-05-21 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'img-1640964046084.jpg', 1, 'agenda', 'publish', 'public', 'close', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', '', 0, NULL, '2022-08-31 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (15, 'Rnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt', '<p>rnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n<p>rnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'rnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'img-1640963992242.jpg', 1, 'agenda', 'publish', 'public', 'close', 'rnatur-aut-odit-aut-fugit-sed-quia-consequuntur-magni-dolores-eos-qui-ratione-voluptatem-sequi-nesciunt', '', 0, NULL, '2022-01-22 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (16, 'Anter consequences that are extremely painful', '<p>nter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleanter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a plea</p>', 'nter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a plea', 'img-1640962978385.jpg', 1, 'agenda', 'publish', 'public', 'close', 'anter-consequences-that-are-extremely-painful', '', 0, NULL, '2022-05-15 07:00:00', 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (17, 'Sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'img-1640971301039.jpg', 1, 'news', 'publish', 'public', 'close', 'sunt-in-culpa-qui-officia-deserunt-mollit-anim-id-est-laborum', '', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `posts` VALUES (18, 'Ullamco laboris nisi ut aliquip ex ea commodo consequat', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'img-1640972589152.jpg', 1, 'news', 'publish', 'public', 'close', 'ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat', '', 0, NULL, NULL, 1, NULL, NULL, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);

-- ----------------------------
-- Table structure for role_menu_actions
-- ----------------------------
DROP TABLE IF EXISTS `role_menu_actions`;
CREATE TABLE `role_menu_actions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sia_menu_id` int(11) NULL DEFAULT NULL,
  `sia_menu_action_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu_actions
-- ----------------------------
INSERT INTO `role_menu_actions` VALUES (1, 1, 1, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (2, 2, 2, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (3, 3, 3, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (4, 4, 4, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (5, 5, 5, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (6, 6, 6, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (7, 7, 7, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (8, 8, 8, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (9, 9, 9, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (10, 10, 10, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (11, 11, 11, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (12, 12, 12, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (13, 13, 13, 1, '2022-01-14 08:19:50', '2022-01-14 08:19:50', NULL);
INSERT INTO `role_menu_actions` VALUES (14, 1, 14, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);
INSERT INTO `role_menu_actions` VALUES (15, 1, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);
INSERT INTO `role_menu_actions` VALUES (16, 1, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super admin', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `roles` VALUES (2, 'student', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `roles` VALUES (3, 'teacher', '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);

-- ----------------------------
-- Table structure for semesters
-- ----------------------------
DROP TABLE IF EXISTS `semesters`;
CREATE TABLE `semesters`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('inactive','active') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'inactive',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of semesters
-- ----------------------------
INSERT INTO `semesters` VALUES (1, 'GANJIL', 'Ganjl', 'inactive', '2022-01-12 19:52:05', '2022-01-12 19:52:05', NULL);
INSERT INTO `semesters` VALUES (2, 'GENAP', 'Genap', 'active', '2022-01-12 19:52:05', '2022-01-12 19:52:05', NULL);

-- ----------------------------
-- Table structure for sia_menu_actions
-- ----------------------------
DROP TABLE IF EXISTS `sia_menu_actions`;
CREATE TABLE `sia_menu_actions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sia_menu_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sia_menu_actions
-- ----------------------------
INSERT INTO `sia_menu_actions` VALUES (1, 1, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (2, 2, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (3, 3, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (4, 4, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (5, 5, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (6, 6, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (7, 7, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (8, 8, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (9, 9, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (10, 10, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (11, 11, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (12, 12, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (13, 13, 'view', '2022-01-14 08:16:35', '2022-01-14 08:16:38', NULL);
INSERT INTO `sia_menu_actions` VALUES (14, 1, 'view_report_dashboard', '2022-01-14 08:16:35', '2022-01-14 08:16:35', NULL);

-- ----------------------------
-- Table structure for sia_menus
-- ----------------------------
DROP TABLE IF EXISTS `sia_menus`;
CREATE TABLE `sia_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `label` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_sia` tinyint(1) NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `devider` tinyint(1) NULL DEFAULT 0,
  `urut` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sia_menus
-- ----------------------------
INSERT INTO `sia_menus` VALUES (1, 'dashboard', 0, 'Dashboard', 'Dasboard', NULL, '/', NULL, NULL, NULL, 0, '00', '2022-01-14 06:28:18', '2022-01-14 06:28:18', NULL);
INSERT INTO `sia_menus` VALUES (2, 'sia', 0, '(SIA) Sistem Informasi Akademik', 'SIA', NULL, '/sia', 1, 0, NULL, 0, NULL, '2022-01-14 06:28:18', '2022-01-14 06:28:18', NULL);
INSERT INTO `sia_menus` VALUES (3, 'sia-master', 0, 'Master', 'Master', NULL, '/sia/master', 1, 0, NULL, 0, NULL, '2022-01-14 06:28:18', '2022-01-14 06:28:18', NULL);
INSERT INTO `sia_menus` VALUES (4, 'sia-master-lesson', 3, 'Pelajaran', 'Pelajaran', NULL, '/sia/master/lesson', 1, 0, NULL, 0, NULL, '2022-01-14 06:28:18', '2022-01-14 06:28:18', NULL);
INSERT INTO `sia_menus` VALUES (5, 'sia-master-classroom', 3, 'Kelas', 'Kelas & Rombel', NULL, '/sia/master/classroom', 1, 0, NULL, 0, NULL, '2022-01-14 06:28:18', '2022-01-14 06:28:18', NULL);
INSERT INTO `sia_menus` VALUES (6, 'sia-master-eduyear', 3, 'Tahun Ajaran', 'Tahun Ajaran', NULL, '/sia/master/eduyear', 1, 0, NULL, 0, NULL, '2022-01-14 06:38:54', '2022-01-14 06:38:54', NULL);
INSERT INTO `sia_menus` VALUES (7, 'sia-master-student', 3, 'Siswa', 'Data Siswa', NULL, '/sia/master/student', 1, 0, NULL, 0, NULL, '2022-01-14 06:38:54', '2022-01-14 06:38:54', NULL);
INSERT INTO `sia_menus` VALUES (8, 'sia-master-teacher', 3, 'Guru', 'Data Guru', NULL, '/sia/master/teacher', 1, 0, NULL, 0, NULL, '2022-01-14 06:38:54', '2022-01-14 06:38:54', NULL);
INSERT INTO `sia_menus` VALUES (9, 'sia-master-setting', 3, 'Setting', 'Pengaturan SIA', NULL, '/sia/master/setting', 1, 0, NULL, 0, NULL, '2022-01-14 06:46:27', '2022-01-14 06:46:27', NULL);
INSERT INTO `sia_menus` VALUES (10, 'sia-activity', 0, 'Aktivitas', 'Aktivitas', NULL, '/sia/activity', 1, 0, NULL, 0, NULL, '2022-01-14 06:46:27', '2022-01-14 06:46:27', NULL);
INSERT INTO `sia_menus` VALUES (11, 'sia-activity-student-class', 10, 'Peserta Kelas', 'Peserta Kelas', NULL, '/sia/activity/student-class', 1, 0, NULL, 0, NULL, '2022-01-14 06:46:27', '2022-01-14 06:46:27', NULL);
INSERT INTO `sia_menus` VALUES (12, 'sia-activity-lesson-class', 10, 'Pembelajaran', 'Pembelajaran', NULL, '/sia/activity/lesson-class', 1, 0, NULL, 0, NULL, '2022-01-14 06:46:27', '2022-01-14 06:46:27', NULL);
INSERT INTO `sia_menus` VALUES (13, 'sia-activity-lesson-class-student', 10, 'Pelajaran Siswa', 'Pelajaran Siswa', NULL, '/sia/activity/lesson-class-student', 1, 0, NULL, 0, NULL, '2022-01-14 06:46:27', '2022-01-14 06:46:27', NULL);

-- ----------------------------
-- Table structure for slides
-- ----------------------------
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slides
-- ----------------------------
INSERT INTO `slides` VALUES (1, 'Slide ke satu', 'slide urutan nomor satu', 'link', 'slide-1640213972432.jpg', 2, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `slides` VALUES (2, 'Slide ke empat', 'slide urutan nomor empat', 'link', 'slide-1640702107825.jpg', 0, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `slides` VALUES (3, 'Slide ke dua', 'slide urutan nomor dua', 'link', 'slide-1640214198882.jpg', 1, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `slides` VALUES (4, 'Slide ke tiga', 'slide urutan nomor tiga', 'link', 'slide-1640702067335.jpg', 3, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);

-- ----------------------------
-- Table structure for student_classes
-- ----------------------------
DROP TABLE IF EXISTS `student_classes`;
CREATE TABLE `student_classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) NOT NULL,
  `eduyear_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('active','passed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'active',
  `passed_at` datetime(0) NULL DEFAULT NULL,
  `passed_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `classroom_id`(`classroom_id`) USING BTREE,
  INDEX `eduyear_id`(`eduyear_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `student_classes_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_classes_ibfk_2` FOREIGN KEY (`eduyear_id`) REFERENCES `eduyears` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_classes_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_classes
-- ----------------------------
INSERT INTO `student_classes` VALUES (1, 21, 1, 1, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:26', '2022-01-12 20:37:05', NULL);
INSERT INTO `student_classes` VALUES (2, 21, 1, 2, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `student_classes` VALUES (3, 21, 1, 3, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `student_classes` VALUES (4, 21, 1, 4, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `student_classes` VALUES (5, 21, 1, 5, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `student_classes` VALUES (6, 21, 1, 6, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (7, 21, 1, 7, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (8, 21, 1, 8, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (9, 21, 1, 9, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (10, 21, 1, 10, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (11, 21, 1, 11, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (12, 21, 1, 12, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (13, 21, 1, 13, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (14, 21, 1, 14, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (15, 21, 1, 15, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (16, 21, 1, 16, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (17, 21, 1, 17, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (18, 21, 1, 18, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (19, 21, 1, 19, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (20, 21, 1, 20, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (21, 21, 1, 21, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (22, 21, 1, 22, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (23, 21, 1, 23, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (24, 21, 1, 24, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (25, 21, 1, 25, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (26, 21, 1, 26, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (27, 21, 1, 27, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (28, 21, 1, 28, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (29, 21, 1, 29, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (30, 21, 1, 30, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (31, 21, 1, 31, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (32, 21, 1, 32, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `student_classes` VALUES (33, 21, 1, 33, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (34, 21, 1, 34, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (35, 21, 1, 35, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (36, 21, 1, 36, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (37, 21, 1, 37, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (38, 21, 1, 38, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (39, 21, 1, 39, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (40, 21, 1, 40, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (41, 21, 1, 41, 'active', NULL, NULL, 1, 1, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `student_classes` VALUES (74, 1, 1, 74, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (75, 1, 1, 75, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (76, 1, 1, 76, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (77, 1, 1, 77, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (78, 1, 1, 78, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (79, 1, 1, 79, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (80, 1, 1, 80, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (81, 1, 1, 81, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (82, 1, 1, 82, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `student_classes` VALUES (83, 1, 1, 83, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (84, 1, 1, 84, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (85, 1, 1, 85, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (86, 1, 1, 86, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (87, 1, 1, 87, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (88, 1, 1, 88, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (89, 1, 1, 89, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (90, 1, 1, 90, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (91, 1, 1, 91, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (92, 1, 1, 92, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (93, 1, 1, 93, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (94, 1, 1, 94, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (95, 1, 1, 95, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (96, 1, 1, 96, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (97, 1, 1, 97, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (98, 1, 1, 98, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (99, 1, 1, 99, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (100, 1, 1, 100, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (101, 1, 1, 101, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (102, 1, 1, 102, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (103, 2, 1, 103, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (104, 2, 1, 104, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (105, 2, 1, 105, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (106, 2, 1, 106, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (107, 2, 1, 107, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (108, 2, 1, 108, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (109, 2, 1, 109, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `student_classes` VALUES (110, 2, 1, 110, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (111, 2, 1, 111, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (112, 2, 1, 112, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (113, 2, 1, 113, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (114, 2, 1, 114, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (115, 2, 1, 115, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (116, 2, 1, 116, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (117, 2, 1, 117, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (118, 2, 1, 118, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (119, 2, 1, 119, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (120, 2, 1, 120, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (121, 2, 1, 121, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (122, 2, 1, 122, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (123, 2, 1, 123, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (124, 2, 1, 124, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (125, 2, 1, 125, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (126, 2, 1, 126, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (127, 2, 1, 127, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (128, 2, 1, 128, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (129, 2, 1, 129, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (130, 2, 1, 130, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (131, 2, 1, 131, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (132, 2, 1, 132, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (133, 3, 1, 133, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (134, 3, 1, 134, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (135, 3, 1, 135, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (136, 3, 1, 136, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (137, 3, 1, 137, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (138, 3, 1, 138, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `student_classes` VALUES (139, 3, 1, 139, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (140, 3, 1, 140, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (141, 3, 1, 141, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (142, 3, 1, 142, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (143, 3, 1, 143, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (144, 3, 1, 144, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (145, 3, 1, 145, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (146, 3, 1, 146, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (147, 3, 1, 147, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (148, 3, 1, 148, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (149, 3, 1, 149, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (150, 3, 1, 150, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (151, 3, 1, 151, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (152, 3, 1, 152, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (153, 3, 1, 153, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (154, 3, 1, 154, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (155, 3, 1, 155, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (156, 3, 1, 156, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (157, 3, 1, 157, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (158, 3, 1, 158, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (159, 3, 1, 159, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (160, 3, 1, 160, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (161, 3, 1, 161, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (162, 4, 1, 162, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (163, 3, 1, 163, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (164, 4, 1, 164, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (165, 4, 1, 165, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (166, 4, 1, 166, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (167, 4, 1, 167, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `student_classes` VALUES (168, 4, 1, 168, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (169, 4, 1, 169, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (170, 4, 1, 170, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (171, 4, 1, 171, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (172, 4, 1, 172, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (173, 4, 1, 173, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (174, 4, 1, 174, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (175, 4, 1, 175, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (176, 4, 1, 176, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (177, 4, 1, 177, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (178, 4, 1, 178, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (179, 4, 1, 179, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (180, 4, 1, 180, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (181, 4, 1, 181, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (182, 4, 1, 182, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (183, 4, 1, 183, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (184, 4, 1, 184, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (185, 4, 1, 185, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (186, 4, 1, 186, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (187, 4, 1, 187, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (188, 4, 1, 188, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (189, 4, 1, 189, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (190, 4, 1, 190, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (191, 4, 1, 191, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (192, 5, 1, 192, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (193, 5, 1, 193, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (194, 4, 1, 194, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (195, 5, 1, 195, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `student_classes` VALUES (196, 5, 1, 196, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (197, 5, 1, 197, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (198, 5, 1, 198, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (199, 5, 1, 199, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (200, 5, 1, 200, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (201, 5, 1, 201, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (202, 5, 1, 202, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (203, 5, 1, 203, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (204, 5, 1, 204, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (205, 5, 1, 205, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (206, 5, 1, 206, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (207, 5, 1, 207, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (208, 5, 1, 208, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (209, 5, 1, 209, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (210, 5, 1, 210, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (211, 5, 1, 211, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (212, 5, 1, 212, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (213, 5, 1, 213, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (214, 5, 1, 214, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (215, 5, 1, 215, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (216, 5, 1, 216, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (217, 5, 1, 217, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (218, 5, 1, 218, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (219, 5, 1, 219, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (220, 5, 1, 220, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (221, 5, 1, 221, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (222, 5, 1, 222, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (223, 7, 1, 223, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (224, 7, 1, 224, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (225, 7, 1, 225, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (226, 7, 1, 226, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `student_classes` VALUES (227, 7, 1, 227, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (228, 7, 1, 228, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (229, 7, 1, 229, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (230, 7, 1, 230, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (231, 7, 1, 231, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (232, 7, 1, 232, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (233, 7, 1, 233, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (234, 7, 1, 234, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (235, 7, 1, 235, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (236, 7, 1, 236, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (237, 7, 1, 237, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (238, 7, 1, 238, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (239, 7, 1, 239, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (240, 7, 1, 240, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (241, 7, 1, 241, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (242, 7, 1, 242, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (243, 7, 1, 243, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (244, 7, 1, 244, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (245, 7, 1, 245, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (246, 7, 1, 246, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (247, 7, 1, 247, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (248, 7, 1, 248, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (249, 7, 1, 249, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (250, 7, 1, 250, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (251, 7, 1, 251, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (252, 7, 1, 252, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (253, 6, 1, 253, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (254, 6, 1, 254, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (255, 6, 1, 255, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `student_classes` VALUES (256, 6, 1, 256, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (257, 6, 1, 257, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (258, 6, 1, 258, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (259, 6, 1, 259, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (260, 6, 1, 260, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (261, 6, 1, 261, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (262, 6, 1, 262, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (263, 6, 1, 263, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (264, 6, 1, 264, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (265, 6, 1, 265, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (266, 6, 1, 266, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (267, 6, 1, 267, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (268, 6, 1, 268, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (269, 6, 1, 269, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (270, 6, 1, 270, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (271, 6, 1, 271, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (272, 6, 1, 272, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (273, 6, 1, 273, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (274, 6, 1, 274, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (275, 6, 1, 275, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (276, 6, 1, 276, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (277, 6, 1, 277, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (278, 6, 1, 278, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (279, 6, 1, 279, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (280, 6, 1, 280, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (281, 6, 1, 281, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (282, 6, 1, 282, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (283, 8, 1, 283, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (284, 8, 1, 284, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `student_classes` VALUES (285, 8, 1, 285, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (286, 8, 1, 286, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (287, 8, 1, 287, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (288, 8, 1, 288, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (289, 8, 1, 289, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (290, 8, 1, 290, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (291, 8, 1, 291, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (292, 8, 1, 292, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (293, 8, 1, 293, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (294, 8, 1, 294, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (295, 8, 1, 295, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (296, 8, 1, 296, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (297, 8, 1, 297, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (298, 8, 1, 298, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (299, 8, 1, 299, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (300, 8, 1, 300, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (301, 8, 1, 301, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (302, 8, 1, 302, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (303, 8, 1, 303, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (304, 8, 1, 304, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (305, 8, 1, 305, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (306, 8, 1, 306, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (307, 8, 1, 307, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (308, 8, 1, 308, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (309, 8, 1, 309, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (310, 8, 1, 310, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (311, 8, 1, 311, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (312, 8, 1, 312, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `student_classes` VALUES (313, 12, 1, 313, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (314, 12, 1, 314, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (315, 12, 1, 315, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (316, 12, 1, 316, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (317, 12, 1, 317, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (318, 12, 1, 318, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (319, 12, 1, 319, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (320, 12, 1, 320, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (321, 12, 1, 321, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (322, 12, 1, 322, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (323, 12, 1, 323, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (324, 12, 1, 324, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (325, 12, 1, 325, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (326, 12, 1, 326, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (327, 12, 1, 327, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (328, 12, 1, 328, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (329, 12, 1, 329, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (330, 12, 1, 330, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (331, 12, 1, 331, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (332, 12, 1, 332, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (333, 12, 1, 333, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (334, 12, 1, 334, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (335, 12, 1, 335, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (336, 12, 1, 336, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (337, 12, 1, 337, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (338, 12, 1, 338, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (339, 12, 1, 339, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (340, 12, 1, 340, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (341, 12, 1, 341, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `student_classes` VALUES (342, 12, 1, 342, 'active', NULL, NULL, 1, 1, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nisn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nis` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_akta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gender` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `place_birth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day_birth` date NULL DEFAULT NULL,
  `religion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `special_needs` tinyint(1) NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rw` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `urban` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sub_district` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `father_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `father_job` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `father_education` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `father_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `father_phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_job` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_education` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `guardian_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `entry_year` date NULL DEFAULT NULL,
  `out_year` date NULL DEFAULT NULL,
  `out_reason` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 46, '0064545784', '197961', '3578271404060004', '1111/2007', 'ACHMAD RAFLI MAULANA', 'L', 'SURABAYA', '2006-04-14', 'Islam', 154, 40, 0, '', '083857391488', 'DUKUH JURANG INDAH 34', '1', '3', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AHMAD TASIM', 'PEDAGANG', 'SMP/SEDERAJAT', '', '', 'SUGIYARTI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (2, 47, '0078604383', '197970', '3578274301070001', '7213/2011', 'AGNESIA MERYNATALIVIA', 'P', 'SURABAYA', '2007-01-03', 'Kristen', 138, 35, 0, '', '081333595838', 'PUTAT GEDE TIMUR 04/34', '4', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'RISBIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUKINI MAHDAWATI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (3, 48, '0062663957', '198001', '3578215805060002', '6142/2010', 'ANGELINA AGNES SOEGIARTO INKIRIWANG', 'P', 'SURABAYA', '2006-05-18', 'Kristen', 155, 40, 0, '', '081234178571', 'DUKUH PAKIS 6 - A/35 - 37', '7', '3', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'KRISTINI R. INKIRIWANG', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KRISTINI R. INKIRIWANG', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (4, 49, '0068061182', '197954', '3578062908060005', '10537/2006', 'ABIYAN NAUFAL ADITYA', 'L', 'SURABAYA', '2006-08-29', 'Islam', 133, 31, 0, '', '085745959591', 'SIMO GUNUNG KRAMAT TIMUR 1/4', '3', '2', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60256', 'NURHADI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NURUL IKEWATI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (5, 50, '0084013021', '198006', '3578276811060002', '16475/2007', 'ANINDYA RAHMA NOVIANANDA', 'P', 'SURABAYA', '2006-11-28', 'Islam', 150, 43, 0, '', '081553726057', 'SIMO POMAHAN BARU 12/30', '8', '5', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'SUJANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MASLIL RUCHAYANI S.Ag', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (6, 51, '0065098688', '198003', '3578014307060002', '23367/2009', 'ANGGUN ADELIA FRISCA HARYANTO', 'P', 'SURABAYA', '2006-07-03', 'Kristen', 155, 40, 0, '', '085100933323', 'SIMO HILIR BARAT 5 BLOK 07C/01', '8', '4', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'AGUS HARIYANTO', 'PEGAWAI NEGERI SIPIL(PNS)', 'SMA/SEDERAJAT', '', '', 'DEASI SUGIATI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `students` VALUES (7, 52, '0063627181', '198027', '3578272307060001', '8451/2006', 'BAGUS PRIAMBODHO', 'L', 'SURABAYA', '2006-07-23', 'Islam', 165, 47, 0, '', '081232352314', 'PUTAT GEDE BARAT 2/24-B', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'TAKIM', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'TRI LESTARI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (8, 53, '0074729658', '198051', '3578275505070001', '804/2007', 'CHRISTINE ANGELICA SANTOSO', 'P', 'SURABAYA', '2007-05-15', 'Kristen', 140, 35, 0, '', '082230903377', 'SIMO POMAHAN 1/12', '8', '2', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'BAMBANG MEI SANTOSO, DRH', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'MARGARYTHA TITIK SUWARSI', 'BELUM/TIDAK BEKERJA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (9, 54, '0055807766', '198097', '3578172712050002', '560/2007', 'FAHMI WAHYU DEVAN', 'L', 'SURABAYA', '2005-12-27', 'Islam', 136, 35, 0, '', '087854030889', 'DUKUH NGAGLIK PUTAT GEDE 11', '5', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'EKO WAHYUDI', 'PEDAGANG', 'SMA/SEDERAJAT', '', '', 'SRI SUNARSIH', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (10, 55, '0075795720', '198091', '3578214305070003', '560/2007', 'ESTHER GRACE MAYLANIA', 'P', 'SURABAYA', '2007-05-03', 'Kristen', 158, 70, 0, '', '082225557099', 'DUKUH KUPANG BARAT 9/7', '2', '4', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60294', 'ABRAHAM    PUTRA YVONNE', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LENY WINATA', 'BELUM/TIDAK BEKERJA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (11, 56, '0078149784', '198110', '3577010505070001', '1920 NO.751.JO.STBL.1927.NO.564', 'FRANS YEHEZKIEL HARIYANTO', 'L', 'SURABAYA', '2007-05-05', 'Kristen', 144, 45, 0, '', '081234144189', 'NGESONG DUKUH KUPANG 2/49-A', '3', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'IGNATIUS HARIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'JANNY IVONE LORINA TANGKA', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (12, 57, '0079286151', '198123', '3578274208070002', '13028/2008', 'HALIMATUS SA\'DIAH', 'P', 'SURABAYA', '2007-08-02', 'Islam', 143, 39, 0, '', '085735550170', 'SIMO GUNUNG BARAT TOL 2/70', '6', '8', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'SUMANTO', 'BURUH HARIAN LEPAS', 'SD/SEDERAJAT', '', '', 'QORI\'AH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (13, 58, '0075153857', '198115', '3578210505070001', '11271/2007', 'GIBRAN ANAK LANANG', 'L', 'SURABAYA', '2007-05-05', 'Islam', NULL, NULL, 0, '', ' 082143211207', 'PRADAH KALIKENDAL 1/2-A', '1', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUMADJI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NURUL HIDAYAH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (14, 59, '0069830682', '198065', '3578216808060005', '3578-LT-17102011-0311', 'DHEA AGUSTIN', 'P', 'SURABAYA', '2006-08-28', 'Islam', NULL, 39, 0, '', '087855876208', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'TEGUH SULISTIYO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'SUKARSIH', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (15, 60, '0065708442', '198131', '3578212907060001', '015694/2006', 'I KETUT AGUS PRAWIRA DIHARJA JOHNSEN', 'L', 'SURABAYA', '2006-07-29', 'Hindu', 115, 19, 0, '', '085230683636', 'DARMO PERMAI SELATAN 6/6', '3', '5', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'I MADE DJONSEN Ir', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'RINI WINARTI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (16, 61, '0067300251', '198142', '3578064612060011', '850/2007', 'ISABEL NATHANIA HERWINDO', 'P', 'SURABAYA', '2006-12-06', 'Kristen', 154, 41, 0, '', '082190512389', 'BANYU URIP KIDUL MOLIN 2B/79', '8', '4', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'TOMY ANDREAS TOTOK HERWINDO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'MIEKE PUSUNG', 'PEDAGANG', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (17, 62, '0074348915', '198147', '3578214906070001', '29887/2010', 'JESSA PUTRI ERVIANA', 'P', 'SURABAYA', '2007-06-09', 'Islam', 156, 45, 0, '', '081334271055', 'DUKUH KALIKENDAL', '2', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'WANDIK ERPIYANTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'WINARTI', 'BELUM/TIDAK BEKERJA', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (18, 63, '0065076674', '198144', '3578082904070001', '6095/2007', 'JASON MARLON ASSA', 'L', 'SURABAYA', '2007-04-29', 'Kristen', 149, 38, 0, '', '081296818190', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'RUDDY ASSA', 'PEDAGANG', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'NGATINI', 'PEDAGANG', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (19, 64, '0066756588', '198148', '3578065205060005', '17319/2009', 'JESSICA MEILANNY PURNOMO', 'P', 'SURABAYA ', '2006-05-12', 'Katholik', 150, 35, 0, '', '081334214520', 'KUPANG GUNUNG JAYA 5/6', '5', '7', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'JULI PURNOMO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LINDAWATI', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (20, 65, '0072726444', '198150', '3578060805070007', '594/2007', 'JONATAN PUTRA RAHARDJO', 'L', 'SURABAYA', '2007-05-08', 'Kristen', 135, 33, 0, '', '082229228668', 'PUTAT JAYA 4-A/6', '11', '3', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'SEPTANTO RAHARDJO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ENDANG WAITU NINGSIH.', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (21, 66, '0053569078', '198151', '3578271305050001', '1266/WNI/2005', 'JONATHAN VIERI', 'L', 'SURABAYA', '2005-05-13', 'Kristen', 140, 40, 0, '', '082331342096', 'PUTAT GEDE TIMUR 04/34', '4', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ROBY SUBAGIO', '', '', '', '', 'MARIA IRAWATI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (22, 67, '0062886458', '198152', '3578270711060003', 'CSLA250559', 'JOSHUA NIXON', 'L', 'SURABAYA', '2006-11-07', 'Islam', 170, 55, 0, '', '082214696940', 'JL. SONO INDAH 3/33', '3', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BUDI NOORCAHYO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'TARMI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (23, 68, '0077350874', '198161', '3578066607070001', '11615/2007', 'LATIFAH NURJANAH', 'P', 'SURABAYA', '2007-07-26', 'Islam', 152, 40, 0, '', '085100259071', 'JL. TIDAR 239-E', '4', '2', 'Petemon', 'Kec. Sawahan', 'SURABAYA', '60252', 'SUGENG', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'PUDJIATI', 'BELUM/TIDAK BEKERJA', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (24, 69, '0078512436', '198163', '3578275301070003', '17/2007', 'LINA KHAIRUN NISA\'', 'P', 'PASURUAN', '2007-01-13', 'Islam', 156, 37, 0, '', '081334510692', 'SIMO POMAHAN 3/27', '9', '2', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'MOCHAMAD YUSUP', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SITI AISAH, SE', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (25, 70, '0068236691', '198168', '3578062810060013', '4631/2011', 'MADE YOGISWARA SURYA PUTRA', 'L', 'SURABAYA', '2006-10-28', 'Hindu', 160, 60, 0, '', '081913753176', 'SIMO KATRUNGAN KIDUL 1/10', '7', '1', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'WARSITO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KADEK KERTI', 'BELUM/TIDAK BEKERJA', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (26, 71, '0061762572', '198178', '3578272109060005', '27829/2010', 'MOCH. FACHRY EKA PUTRA', 'L', 'SURABAYA', '2006-09-21', 'Islam', 162, 85, 0, '', '081555395341', 'SIMO KATRUNGAN KIDUL 33', '8', '1', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60181', 'MOCH. SAFI\'I', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IKA SRI WAHYUNINGSIH', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (27, 72, '0069426200', '198192', '3504032310060002', '6879.1/IST/2009', 'MOH ANDHIKA FIRMAN PRATAMA', 'L', 'TULUNGAGUNG', '2006-10-23', 'Islam', 150, 65, 0, '', '081234449194', 'PUTAT GEDE BARAT 1/24', '1', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60186', 'HENDRY SUNARTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'ENDANG TRI WAHYUNI', 'BELUM/TIDAK BEKERJA', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (28, 73, '0062507707', '198232', '3578212104060001', '4907/2006', 'NAUFAL HAFIZH SAIFUDDIN', 'L', 'SURABAYA', '2006-04-21', 'Islam', 166, 50, 0, '', '085732569363', 'DUKUH PAKIS BARU 2.C/10', '4', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'PARMAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'TRIMUDJI RAHAYU', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (29, 74, '0068611891', '198258', '3578066011060003', '633/2007', 'PUTU DEWI NILAM SARI', 'P', 'SURABAYA', '2006-11-20', 'Islam', 144, 30, 0, '0', '0832332141583', 'SIMO GUNUNG KRAMAT TIMUR 8/25', '8', '2', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'SIDEMAN SAPUTRO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'NASROH', 'BELUM/TIDAK BEKERJA', 'SMP/SEDERAJAT', '', '', '0', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (30, 75, '0079230873', '198270', '3578071004070001', '7958/2007', 'RANDHY DIMAS DWI APRITARTO PUTRA', 'L', 'SURABAYA', '2007-04-10', 'Islam', 149, 30, 0, '', '082233649898', 'PUTAT GEDE BARAT 1/40', '1', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60819', 'SUGIARTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'WAODE RITA', 'BELUM/TIDAK BEKERJA', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (31, 76, '0069082782', '198290', '3578114108060006', '3578-LT-10072013-0072', 'ROSI AGUSTINI LEDE', 'P', 'SURABAYA', '2006-08-01', 'Kristen', 150, 40, 0, '', '082132011207', 'JL. DUKUH KAWAL KALI ENDAL', '5', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AHMAD YANI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'ROMLAH', '', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (32, 77, '0073872688', '198262', '3578060109070003', '755/11/TERLAMBAT/2010', 'RADITHYA CHRISTIAN BATE', 'L', 'SURABAYA', '2007-09-01', 'Kristen', 140, 30, 0, '', '081249218347', 'SIMO GUNUNG KRAMAT TIMUR 54', '1', '2', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'ANFRIDUS BATE', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KRISTINA EKAWATI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `students` VALUES (33, 78, '0067093763', '198285', '3578214201060001', '1375/2006', 'RHEYZITA PUTRI HAWA', 'P', 'SURABAYA', '2006-01-02', 'Islam', 155, 49, 0, '', '-', 'PRADAH INDAH', '8', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HERU SISMONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RHAINI AYU KHISARI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (34, 79, '0056033999', '198297', '3578274109050002', '3578-LT-11042019-0003', 'SALSABILLAH SEPTIAN INDAH RACHMAWATI', 'P', 'SURABAYA', '2005-09-01', 'Kristen', 143, 28, 0, '', '081267175827', 'SIMOREJO SARI B-6/24', '2', '7', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60281', '', 'BURUH HARIAN LEPAS', 'SD/SEDERAJAT', '', '', 'INDAH TRIWULANDARI', 'BURUH HARIAN LEPAS', 'SMP/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (35, 80, '0066276037', '198300', '3578064309060005', '3578-LT-31052013-0434', 'SALWA AZZAHRO K.', 'P', 'SURABAYA', '2006-09-03', 'Islam', NULL, NULL, 0, '0', '085850210822', 'SIMO GUNUNG I/1-C', '1', '1', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'MOH. YUSUF', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'ISNAINI TRI RAHAYU, S.PD', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (36, 81, '0066933719', '198307', '3578066608060003', '3578-LT-22012013-0008', 'SENNIA META SAHARA', 'P', 'SURABAYA', '2006-08-26', 'Islam', 140, 24, 0, '', '082337224250', 'SIMO GUNUNG 1-A/23', '9', '1', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'SLAMET WIBOWO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'IDA RATNASARI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (37, 82, '0069606599', '198316', '3578272004060004', '474.1/4267/2007', 'SHOKHIFUL ARIF', 'L', 'SURABAYA', '2006-04-20', 'Islam', 153, 30, 0, '', '081330554495', 'SIMO JAWAR 7C-1/11', '3', '10', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'CHOIRUL HUDA', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'MARMIASIH', 'BELUM/TIDAK BEKERJA', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (38, 83, '0073298372', '198313', '3578064108070004', 'DKPS.478.2/16.638/PKD/I/2008', 'SHEREN JESSICA BANON', 'P', 'SURABAYA', '2007-08-01', 'Kristen', 124, 26, 0, '', '-', 'WONOKITRI 2/92-B', '2', '1', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'SULIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ROHANA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (39, 84, '0073270436', '198319', '3578062602070001', '271/2007', 'SILVERADO OMEGA FIBIANA', 'L', 'SURABAYA', '2007-02-26', 'Kristen', 140, 35, 0, '', '081234413377', 'BANYU URIP LOR 8/2', '3', '7', 'Kupang Krajan', 'Kec. Sawahan', 'SURABAYA', '60251', 'AYUB RABIANA', 'GURU', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'FIGU RATMAYASARI', 'PEDAGANG', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (40, 85, '0065838374', '198330', '3578276209060001', '10353/2006', 'SYEFIANA DEVA ADYA WARISTA', 'P', 'SURABAYA', '2006-09-22', 'Islam', 160, 55, 0, '', '081226512168', 'SIMO GUNUNG BARAT TOL 3/69', '3', '8', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'M. AZWAR ARSYAD', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', 'DIAN MARLYANTINA PUTRI', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (41, 86, '0078317866', '198338', '3578275202070002', '11424/2008', 'TIARA AULIA AJENG AYU PRATIWI', 'P', 'SURABAYA', '2007-02-12', 'Islam', 145, 45, 0, '', '081234573693', 'PUTAT GEDE BARAT 4/6', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'CHOIRUL SAMIAN', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'SULAENI ARUM AMURTI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2019-06-01', NULL, NULL, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `students` VALUES (74, 120, '218644', '3086185061', '3372033006080003', '5400/TP/2011', 'ADIT PRAMUDYA AKBAR', 'L', 'SURABAYA', '2008-06-30', 'Islam', 155, 43, 0, '', '083831207718', 'DARMO PERMAI UTARA 4/43', '4', '1', 'Tanjungsari', 'Kec. Sukomanunggal', 'SURABAYA', '60187', '', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI SUPARNI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (75, 121, '218661', '0088289395', '3503106306080003', '3503-LT-16102012-0078', 'AMANDA WIDYA SETIA PUTRI', 'P', 'TRENGGALEK', '2008-06-23', 'Islam', 154, 45, 0, '', '085604849466', 'NGESONG DUKUH KUPANG 2 / 57-B', '3', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'EDY PRASETIYO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'TITIN WIDAYANTI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (76, 122, '218648', '0086836865', '3501100812080003', '1505/IST/16/2009', 'AGUNG ISA PRADANA', 'L', 'PACITAN', '2008-12-08', 'Islam', 140, 34, 0, '', '085331033658', 'PRADAH PERMAI 3/29', '3', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ARIFIN', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'MARYATUN', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (77, 123, '218693', '0088238768', '3578045412080002', '7324/2010', 'CANTHIKA PUTRI NUR SALSABILLA', 'P', 'SURABAYA', '2008-12-14', 'Islam', 160, 27, 0, '', '082144132347', 'KEMBANG KUNING 4/1', '11', '9', 'Darmo', 'Kec. Wonokromo', 'SURABAYA', '60241', 'EKO AJIZ SUWANTORO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NUR BADRIYAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (78, 124, '218684', '0095468938', '3578216502090002', '3042/2011', 'AVRIL RESTI FELISA', 'P', 'SURABAYA', '2009-02-25', 'Islam', 165, 43, 0, '', '085784911138', 'DUKUH KALIKENDAL', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'CHRISTIAN EKO WAHYUDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'GUSTI RACHMAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (79, 125, '218696', '0094121613', '3578047103090007', '1395/2011', 'CIECILIA ANGGUN ZAZKIA', 'P', 'SURABAYA', '2009-03-31', 'Islam', 158, 45, 0, '', '085231700036', 'PULO TEGALSARI 5-B/49', '9', '7', 'Wonokromo', 'Kec. Wonokromo', 'SURABAYA', '60243', 'SUNARYO', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', 'EVI NURMASARI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (80, 126, '218670', '0087744294', '3522246106080003', '3522-LT-22062015-0055', 'ANNATASYA ALTHAFUNNISA', 'P', 'SURABAYA', '2008-06-21', 'Islam', 157, 72, 0, '', '081252582074', 'DK. NGAGLIK PUTAT GEDE', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'PUGUH SETIAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LASMIATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (81, 127, '218720', '0081708663', '3578272306080003', '03594/IND/GRTS/2008', 'EDGAR EFRATA ABADI', 'L', 'JOMBANG', '2008-06-22', 'Kristen', 160, 69, 0, '', '085707005499', 'DUKUH NGAGLIK PUTAT GEDE', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ABADI', '', 'SMA/SEDERAJAT', '', '', 'KUSMIATIN', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (82, 128, '218738', '0086102672', '3578272306080004', '3522/ALI/2009/39241', 'FERDINAN TITO HARDIANTO', 'L', 'BOJONEGORO', '2008-06-23', 'Islam', 155, 55, 0, '', '082244782393', 'PUTAT GEDE BARAT 4/2', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'HARIYANTO', '', 'SMA/SEDERAJAT', '', '', 'DIAH SULISTYOWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (83, 129, '218773', '0097910577', '3578270202090003', '1212CLU07022009578', 'KEVIN FEBRIAN SIMANJUNTAK', 'L', 'DOLOK NAULI', '2009-02-02', 'Kristen', 137, 26, 0, '', '082141552532', 'SIMOREJO SARI A NO. 46', '14', '5', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'MARTINUS SIMANJUTAK', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RONTI ANITA SIRAIT', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (84, 130, '218739', '0095285579', '3578310304090002', '4367/2009', 'FERNANDO AURELIO SAHUSILAWANE', 'L', 'SURABAYA', '2009-04-03', 'Kristen', 160, 50, 0, '', '081257756160', 'SIMPANG DARMO PERMAI SELATAN XV / 113', '1', '11', 'Lontar', 'Kec. Sambikerep', 'SURABAYA', '60216', 'WARREN ANDERSON SAHUSILAWANE', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'VANNY RATIH PUTRI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `students` VALUES (85, 131, '218766', '0088344013', '3578275310080004', '3113/TP/2009', 'JUDITH AZARYA RAHARDJO', 'P', 'SURABAYA', '2008-10-13', 'Kristen', 155, 45, 0, '', '081803082709', 'PUTAT GEDE BARAT 4/4', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'YUDY SETIAWAN RAHARDJO', '', 'SMP/SEDERAJAT', '', '', 'ERLINA SETYONINGSIH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (86, 132, '218772', '0088036416', '3578272707080002', '13535/2008', 'KEVIN CHRISTIAN FERNANDO UTOMO', 'L', 'SURABAYA', '2008-07-27', 'Kristen', 165, 45, 0, '', '085704284240', 'PUTAT GEDE TIMUR 4/66', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MARDI UTOMO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NANIK NOFARIDHA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (87, 133, '218775', '0089383725', '3506046709080005', '16321/P/X/2008', 'KEYLA PUGANDA RISMA CITRA SAFITRI', 'P', 'KEDIRI', '2008-09-27', 'Islam', 145, 40, 0, '', '081327928766', 'DUKUH PAKIS 2/44-D', '2', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'DJOKO PUGUH SANTOSO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'UMI SAFITRI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (88, 134, '218833', '0081898669', '3578276411080001', '16484/2008', 'NOVELYN NANDA ARIE GUNAWAN', 'P', 'SURABAYA', '2008-11-24', 'Kristen', 133, 29, 0, '', '081252678972', 'SIMOMULYO BARU A-1/31', '12', '3', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'JONATAN BUDIONO GUNAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'WIDIJAWATI ARIASTOETY', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (89, 135, '218791', '0083514652', '3578064212080003', '3507.AL.2011.005857', 'LUYA ADITYA', 'P', 'MALANG', '2008-12-02', 'Kristen', 154, 53, 0, '', '082331684625', 'PUTAT JAYA C BARAT 10/53', '4', '13', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'SULIADI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'CITRO WORO', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (90, 136, '218839', '0087880290', '3517134307080004', '3578-LT-13062013-0303', 'OLIVIA CARISSA PUTRI', 'P', 'SURABAYA', '2008-07-03', 'Islam', 159, 40, 0, '', '085608397202', 'DK. GEMOL I/10-A', '5', '3', 'Jajar Tunggal', 'Kec. Wiyung', 'SURABAYA', '60229', 'MATORI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUMIATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (91, 137, '218852', '0097566183', '3578230107090001', '9362/2009', 'RAKA BRAHMANA BAGUS SUKMANA PUTRA', 'L', 'SURABAYA', '2009-07-01', 'Kristen', 159, 51, 0, '', '082232504299', 'JL. SIMPANG DARMO PERMAI SEL. XVI / 28', '1', '11', 'Lontar', 'Kec. Sambikerep', 'SURABAYA', '60216', 'DANY CHRISTIAWAN SUKMANA P', 'TENTARA NASIONAL INDONESIA (TNI)', 'DIPLOMA III (D3)', '', '', 'I.G.A NGURAH DEWI CIPTAYANI SP.', 'DOKTER', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (92, 138, '218859', '0097506016', '3507036702090002', '3507.AL.2010.015472', 'REGI SEFINA PUTRI', 'P', 'MALANG', '2009-02-27', 'Islam', 157, 49, 0, '', '085755772131', 'JL.PUTAT GEDE TIMUR 3/78', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'NGATIYO', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'TIAMI', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (93, 139, '218862', '0091938973', '3578271201090002', '4043/2009', 'REVELINO JEVON PURWADIATA', 'L', 'MALANG', '2009-01-12', 'Katholik', 150, 75, 0, '', '08113612019', 'PUTAT GEDE 46', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'PURWANTO', '', 'SMA/SEDERAJAT', '', '', 'ELLISABET IDA SRIWAHYUNI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (94, 140, '218880', '0085261539', '3578270107080001', '11051/2008', 'SATRIA DHARMA PUTRA JAYA SUTRISNA', 'L', 'SURABAYA', '2008-07-01', 'Islam', 152, 35, 0, '', '085730956100', 'DONOWATI 4/54', '5', '1', 'Sukomanunggal', 'Kec. Sukomanunggal', 'SURABAYA', '60188', 'SUTRISNO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SANTINI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (95, 141, '218869', '0084901661', '3313085104080002', '6866/TP/2008', 'RISMA APRILIANTY', 'P', 'KARANGANYAR', '2008-04-11', 'Islam', 160, 70, 0, '', '089514996735', 'NGAGLIK PUTAT GEDE', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AGUS SUGIYANTO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'SUWARSI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (96, 142, '218887', '0084470367', '3578217009080004', '7347/D/VII/2009', 'SUSANA MARIANE HERI', 'P', 'KEDIRI', '2008-09-30', 'Kristen', 150, 39, 0, '', '081233395276', 'DUKUH PAKIS 3/14', '3', '6', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'PRIYO HERI SUSANTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RINI IDHAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (97, 143, '218889', '0089008991', '3578211610080001', '8678/2009', 'SYALLOM FIRDAUS PUTRA KRISTIANTO', 'L', 'SURABAYA', '2008-10-16', 'Kristen', 166, 55, 0, '', '088217605947', 'DUKUH PAKIS 2-C/18-C', '4', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'SUTARDJI', 'PENSIUNAN', 'SD/SEDERAJAT', '', '', 'RINI WINARTI', 'PENSIUNAN', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (98, 144, '218893', '0099264558', '3578211706090002', '6789/2009', 'TEOFILUS ANDREW SAMBIRA', 'L', 'SURABAYA', '2009-06-17', 'Kristen', 147, 39, 0, '', '085331516597', 'DUKUH KUPANG BARAT 11/17', '2', '4', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'HERI SAMBIRA', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'GINTEN', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (99, 145, '218890', '0094155727', '3578275301090001', '1190/2009', 'SYIFANA LATISA HARIYANTO', 'P', 'SURABAYA', '2009-01-13', 'Islam', 163, 62, 0, '', '081338371195', 'SONO INDAH 5/6', '4', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'DWI HARIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MARIA ULFAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (100, 146, '218895', '0091733224', '3578216903090001', '11845/2009', 'TIRTA PRAMUDITA SUBIYANTO', 'P', 'SURABAYA', '2009-03-29', 'Islam', 152, 48, 0, '', '081553172720', 'DUKUH PAKIS 3.A/73', '5', '2', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'DIDIK SUBIYANTO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'TRI RAHAYU AGUSTIN', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (101, 147, '218896', '0086377325', '3519156009080001', '03980/IST/U/0080/2009 ', 'UNZILA RIZKIKA RAMADANI', 'P', 'MADIUN', '2008-09-20', 'Islam', 155, 45, 0, '', '085655433639', 'DUKUH JURANG INDAH 26', '1', '3', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60186', 'IMAM SUHADI', 'SOPIR', 'SMP/SEDERAJAT', '', '', 'SEMI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (102, 148, '218902', '0081701938', '3578141209080003', '21541/2008', 'ZIDAN ARRAFI', 'L', 'SURABAYA', '2008-09-12', 'Islam', 157, 34, 0, '', '085106130123', 'JL.MANUKAN LOKA BLK 8-D/21', '4', '2', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'IMAM SUBEKHAN', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LUCY SETIAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (103, 149, '218640', '0098829058', '3572025604090001', '3572-LT-28122010-0025', 'ABHISTA NARESWARI SUGIYANTO', 'P', 'SURABAYA', '2009-04-16', 'Islam', 145, 45, 0, '', '08179601204', 'DUKUH KALIKENDAL', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ANDIK SUGIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'AL KHASANAH FITRI ASTUTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (104, 150, '218662', '0097895320', '3578214401090003', '16813/2009', 'AMELIA', 'P', 'SURABAYA', '2009-01-04', 'Islam', 138, 40, 0, '', '081330551578', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HERU SANTOSO', '', 'SMA/SEDERAJAT', '', '', 'KUSMINAH', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (105, 151, '218707', '0088580360', '3578064308080001', '13498/2008', 'DAYANA ANASTASIA PRATISTA', 'P', 'SURABAYA', '2008-08-03', 'Islam', 147, 36, 0, '', '082330838389', 'DUKUH KUPANG TIMUR 13/34', '1', '9', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'DWI BIJANTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RISMAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (106, 152, '218679', '0096384719', '3578214304090003', '22894/2010', 'ATHAYA NAURA AZELEA PRIBADI', 'P', 'SURABAYA', '2009-04-03', 'Islam', 142, 42, 0, '', '083119766833', 'PRADAH PERMAI 6/20', '2', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HENDRO PRIBADI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'EMMY IDAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (107, 153, '218706', '0098330606', '3578056301090002', '7814/2009', 'DAVANIA PUTRI EKA PRATAMA', 'P', 'SURABAYA', '2009-01-23', 'Islam', NULL, NULL, 0, '', '082232325241', 'TEMPEL SUKOREJO 1/16-D', '2', '7', '', 'Kec. Tegalsari', 'SURABAYA', '60263', 'DANNI EGA PRATAMA', '', '', '', '', 'MASTUFAH', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (108, 154, '218716', '0088238085', '3516152303080001', '3083/UM/2000/KAB MR', 'DIYAS ROMI MAULANA', 'L', 'SURABAYA', '2008-03-23', 'Islam', NULL, NULL, 0, '', '087855712501', 'PUTAT GEDE BARAT 3/35', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60186', 'ROBI', '', '', '', '', 'SITI  NUR  HALIMAH', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (109, 155, '218757', '0089462221', '3578064208080006', '12730/2008', 'INTAN DWI AGUSTIN', 'P', 'SURABAYA', '2008-08-02', 'Islam', 159, 60, 0, '', '087863942579', 'PAKIS SIDOKUMPUL NO. 9', '2', '7', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'SUHARDIYANTO, ALM', '', 'DIPLOMA I (D1)', '', '', 'SONTEN', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (110, 156, '218774', '0088839047', '3578276604080003', '3578-LT-08122011-0119', 'KEYLA DWI APRILIA', 'P', 'SURABAYA', '2008-04-26', 'Islam', NULL, NULL, 0, '', '085860378023', 'SONO INDAH 2/40', '2', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUBAKTI', '', '', '', '', 'AYU NARIMAWATI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (111, 157, '218763', '0089692709', '3578216006080002', '19732/2009', 'JESIKA AGUSTIN', 'P', 'SURABAYA', '2008-06-20', 'Islam', 153, 50, 0, '', '089696417884', 'PRADAH KALIKENDAL', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AGUS WAJUDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'WIDIAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `students` VALUES (112, 158, '218767', '0085207132', '3578214106080003', '3578-LT-06022012-0415', 'KASIH AZIZATUN AKHIROH', 'P', 'BOJONEGORO', '2008-06-01', 'Islam', 154, 55, 0, '', '085754381340', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AYIS DWI HANDOKO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NOVA EKA ANA', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (113, 159, '218784', '0081865580', '3515065511080001', '025129/2008', 'KIRANNI NOVELLIA BAHARIZKY', 'P', 'SIDOARJO', '2008-11-15', 'Islam', 140, 32, 0, '', '081217718196', 'SONO INDAH 4/9-A', '3', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUNARSO, SE', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'SRI RAHAYU PISTIANA', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (114, 160, '218793', '0099824656', '3509030807090001', '3509-LT-02022016-0074', 'M. HAFIZ ZAIN AL FARUQ', 'L', 'JEMBER', '2009-04-09', 'Islam', 156, 41, 0, '', '081234615816', 'NGANGLIK PUTAT GEDE', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'TAUFIQ', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'YUNITA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (115, 161, '218768', '0081644306', '3578216411080002', '2220/2009', 'KAYLA SALSABBILAH', 'P', 'SURABAYA', '2008-11-24', 'Islam', 152, 45, 0, '', '085856242392', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUKIN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SADIAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (116, 162, '218806', '0087083198', '3578270212080002', '3578-LT-05122011-0292', 'MUHAMAD AMRIZAL WAHYU KRISNADI', 'L', 'SURABAYA', '2008-12-02', 'Islam', 145, 35, 0, '', '0881027330366', 'PUTAT GEDE TIMUR 4/47-F', '4', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'PONADI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'SULISWATI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (117, 163, '218810', '0086148408', '3578210510080004', '134/2009', 'MUHAMMAD AZRIL RAMADHAN', 'L', 'SURABAYA', '2008-10-05', 'Islam', 158, 47, 0, '', '081216373820', 'PRADAH KALIKENDAL 12/117', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'Ir BUDI ATIM', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'ROFI\'AH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (118, 164, '218813', '0071547160', '3578270812070004', '11222/2010', 'MUHAMMAD IQBAL PURWANTO', 'L', 'SURABAYA', '2007-12-08', 'Islam', NULL, NULL, 0, '', '081803504489', 'PUTAT GEDE BARAT 02/4', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUWANTO', '', '', '', '', 'PONITRI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (119, 165, '218814', '0077560739', '3525041105070003', '2534/T/2010', 'MUHAMMAD KHOIRUL RIZAL', 'L', 'GRESIK', '2007-05-11', 'Islam', 140, 35, 0, '', '0895400955551', 'PRADAH KALIKENDAL', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AGUS SETIAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NANI SUDARWATI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (120, 166, '218834', '0096106241', '3403126911090001', '3578-LT-14052013-0108', 'NOVITA DWI PUTRI ANGRAINI', 'P', 'SURABAYA', '2009-11-29', 'Islam', 132, 30, 0, '', '085591110430', 'JL. KUPANG INDAH II/48', '2', '5', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BUDI', '', 'SD/SEDERAJAT', '', '', 'SARTI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (121, 167, '218844', '0085419799', '3578270808080001', '12757/P/2008', 'RADITYA PUTRA FIRMANSYA', 'L', 'SURABAYA', '2008-08-08', 'Islam', NULL, NULL, 0, '', '081331611761', 'PUTAT GEDE BARAT 5/12', '5', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AGUNG ARYWIBOWO', '', '', '', '', 'FERA SUSANTI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (122, 168, '218857', '0084455618', '3513241503080002', '1229/CLT/2015', 'RAY MAJD AL - FARIZY MULYANTO', 'L', 'PROBOLINGGO', '2008-03-15', 'Islam', NULL, NULL, 0, '', '085231525209', 'JL. SONOREJO I/34', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BUNALI RUDY HADI SANTOSO', '', '', '', '', 'MUSIAMAH', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (123, 169, '218855', '', '3578062112080002', '3578-LT-02012012-0085', 'RAKHA SIMON PURUHITA DAMANIK', 'L', 'SURABAYA', '2008-12-21', 'Islam', 153, 42, 0, '', '081803080734', 'SIMO LANGIT 13/85', '2', '1', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'ROMARD TOGARMA DAMANIK', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SYAM RIZKY PURUHITA', 'KARYAWAN SWASTA', 'STRATA II (S2)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (124, 170, '218867', '0083861185', '3578210905080001', '7170/2008', 'RIAS ADI PRANATA', 'L', 'SURABAYA', '2008-05-09', 'Islam', 155, 42, 0, '', '083849277404', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'KARJONO', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'WAHYUNI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (125, 171, '218865', '0085173022', '3578031010080001', '15560/2008', 'RHIZA RHAFSANZANI ANANDA ASVA', 'L', 'SURABAYA', '2008-10-10', 'Islam', 145, 37, 0, '', '081311261334', 'JL. DUKUH PAKIS I/4', '1', '6', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ASEP SUKANDAR', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'EVA INDAH KURNIAWATI ,ST', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (126, 172, '218868', '0087340407', '3578212306080001', '9934/2008', 'RIFALDO ZAKI SAMUDRA', 'L', 'SURABAYA', '2008-06-23', 'Islam', 155, 56, 0, '', '085336878506', 'DUKUH KUPANG 1/61-B', '1', '2', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ALI HUSNI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SAKIYANTI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (127, 173, '218872', '0081350373', '3509183010080001', '0', 'RONALD OKTA VALENTYNO TRI WIJAYANTO', 'L', 'JEMBER', '2008-10-30', 'Islam', NULL, NULL, 0, '', '085730874842', 'PUTAT GEDE BARAT 3/40', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'WIJIYANTO ADI PRASTYO', '', '', '', '', 'SRI WAHYUNI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (128, 174, '218885', '0096112840', '3578064707090001', '3578-LT-08122011-0330', 'SILVIANTI SALSABILA PUTRI FARIZAL', 'P', 'SURABAYA', '2009-07-07', 'Islam', 158, 48, 0, '', '08872808711', 'DUKUH KALIKENDAL', '5', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AHMAD FARIZAL', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI SUNDARI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (129, 175, '218873', '0093956993', '3578211804090001', '5008/2009', 'SABILILLAH RIZKI', 'L', 'SURABAYA', '2009-04-18', 'Islam', 154, 51, 0, '', '081333457546', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MOCH.REFANUL MASHURI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'TRISNO WATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (130, 176, '218892', '0094093815', '3578055004090002', '3578-LT-12022014-0029', 'TANTRI INDY SYAFIRA PUTRI', 'P', 'SURABAYA', '2009-04-10', 'Islam', 154, 48, 0, '', '081332902922', 'WONOREJO 2/ 95', '4', '4', '', 'Kec. Tegalsari', 'SURABAYA', '60263', 'TOTOK SUGIARTO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LITA WAHYUNING HERIWATI', '', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (131, 177, '218897', '0081968663', '3578064506080006', '20850/2008', 'VELISHA PUSPITA DEWI', 'P', 'SURABAYA', '2008-06-05', 'Islam', 158, 50, 0, '', '082230968558', 'KEMBANG KUNING KRAMAT 1/30-B', '9', '6', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'MAS\'UD', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'NURYATI', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (132, 178, '218903', '0086547374', '3578064308080004', '13497/2008', 'ZIVANNA BRIGITTA PRATISTA', 'P', 'SURABAYA', '2008-08-03', 'Islam', 146, 36, 0, '', '082330838389', 'DUKUH KUPANG TIMUR 13/34', '1', '9', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'DWI BIJANTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RISMAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (133, 179, '218647', '0088581889', '3578100312080005', '2434/2010', 'AGATHA GALANG MIKOLA', 'L', 'SURABAYA', '2008-12-03', 'Islam', 158, 58, 0, '', '081805316415', 'PUTAT GEDE 30', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'YOYOK YULIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'AGUSTINA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (134, 180, '218656', '0081106826', '3578064508080002', '16217/P/X/2008', 'ALIFYA CALLISTA PUTRI ARYANTI', 'P', 'KEDIRI', '2008-08-05', 'Islam', 147, 47, 0, '', '081231383279', 'DUKUH KUPANG TIMUR 11/10', '4', '8', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'EKO HARIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'YANTI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (135, 181, '218669', '0089605855', '3578214409080003', '3578-LT-16122011-0029', 'ANDITA SEPTIA RAHMADANI', 'P', 'SURABAYA', '2008-09-04', 'Islam', 152, 45, 0, '', '083122456649', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ARIFIN BUDI WALUYO', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'NANIK SAFITRI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (136, 182, '218672', '0086232913', '3578214404080001', '7934/2008', 'APRILIA PUTRI WAHYUNI', 'P', 'SURABAYA', '2008-04-04', 'Islam', 149, 36, 0, '', '081333773015', 'PRADAH INDAH 5/15', '8', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'YATENO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RIRIN SETIANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (137, 183, '218673', '0081329580', '3578065304080005', '3578-LT-06052015-0204', 'AQIDAH AZAHRA SALSABILLAH', 'P', 'SURABAYA', '2008-04-13', 'Islam', 167, 45, 0, '', '0895803308824', 'PUTAT JAYA C BARAT 8/4', '2', '13', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'AGUS SETIAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MUDI RAHAYU', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (138, 184, '218683', '0084878302', '3578066008080004', '20256/2008', 'AURELIA PUTRI', 'P', 'SURABAYA', '2008-08-20', 'Islam', 155, 40, 0, '', '081230179797', 'PAKIS SIDOKUMPUL NO. 1', '1', '7', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'AGUS ARIBOWO', 'WIRASWASTA', 'DIPLOMA I (D1)', '', '', 'ENY SUPRIHATIN', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (139, 185, '218681', '0081736419', '3578214412080002', '000756/2009', 'AUDREY NATHANIA ZAHWA', 'P', 'SIDOARJO', '2008-12-04', 'Islam', 157, 43, 0, '', '081259108464', 'JL RAYA DUKUH KUPANG BARAT 151', '5', '8', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ZAID WAHYUDI', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'APRIL LIKE HERAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `students` VALUES (140, 186, '218691', '0082084248', '3578172512080008', '0', 'BINTANG MUHAMMAD FAJAR', 'L', 'SURABAYA', '2008-12-25', 'Islam', 123, 29, 0, '', '087854030889', 'DUKUH NGAGLIK PUTAT GEDE 11', '5', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'EKO WAHYUDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI SUNARSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (141, 187, '218690', '0084352644', '3578210403080002', '3578-LT-20012012-0346', 'BEVAN ARYESTA PUTRA ZAENAL', 'L', 'SURABAYA', '2008-03-04', 'Islam', 150, 34, 0, '', '087864452108', 'PRADAH KALIKENDAL 2/24', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'JAENAL', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'ASIYAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (142, 188, '218692', '0082102978', '3578214512080002', '3578-LT-10122011-0553', 'CALLYSTA PUTRI FADHILAH', 'P', 'SURABAYA', '2008-12-05', 'Islam', 144, 38, 0, '', '081232935546', 'PRADAH KALIKENDAL 9/75', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'KOIRUL SOLEH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KUSYANTI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (143, 189, '218705', '0088140728', '3578277005080001', '9935/2008', 'DARA TRESYA PUSPITA', 'P', 'SURABAYA', '2008-05-30', 'Islam', 148, 43, 0, '', '081235062530', 'RAYA PUTAT GEDE 29', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'EDY SUTRISNO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'HENNY SOPYAN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (144, 190, '218715', '0093155908', '3578210107090001', '762/2011', 'DITTO ADRIANSYAH EMERALD', 'L', 'SURABAYA', '2009-07-01', 'Islam', 147, 47, 0, '', '081330104380', 'GOLF 9/21', '6', '4', 'Gunung Sari', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'DIRMANTO', 'TENTARA NASIONAL INDONESIA (TNI)', 'SMA/SEDERAJAT', '', '', 'EVA FUDIARIYANTI', 'TENTARA NASIONAL INDONESIA (TNI)', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (145, 191, '218730', '0083900461', '3578214511080001', '24236/2009', 'FARAH AURELLIA PUTRI OKTAVIYANI', 'P', 'SURABAYA', '2008-11-05', 'Islam', 168, 71, 0, '', '0895395082352', 'NGESONG DUKUH KUPANG 1/55', '3', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'TRI OKTAVIANTO', 'BURUH HARIAN LEPAS', 'SMP/SEDERAJAT', '', '', 'YANI PRIHARTINI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (146, 192, '218734', '0089810739', '3578210208080003', '9442/2009', 'FARREL HAGI PRATAMA', 'L', 'SURABAYA', '2008-08-02', 'Islam', 170, 107, 0, '', '08563255287', 'PRADAH KALIKENDAL', '1', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HARIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUGIATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (147, 193, '218779', '0084820912', '3578065308080001', '13069/2008', 'KHANSA NAVITA BASUWARDI', 'P', 'SURABAYA', '2008-08-13', 'Islam', 140, 30, 0, '', '081242124407', 'SIMO LANGIT 14/33', '1', '1', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'YULIAN WARDI, ST,MM', 'PEGAWAI NEGERI SIPIL(PNS)', 'STRATA II (S2)', '', '', 'DYAH RETNO PALUPI, S.SOS', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (148, 194, '218782', '0082249736', '3578066008080005', '9202/2009', 'KHEISYA ALMAQHVIRA RURI PUTRI', 'P', 'SURABAYA', '2008-08-20', 'Islam', 165, 58, 0, '', '081217661915', 'BANYU URIP KIDUL 6-E/7', '8', '9', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'HERU SUGIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RINI SUHARTATIK', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (149, 195, '218735', '0072236738', '3578217012070002', '3578-LT-01122011-0246', 'FATMA WULANDARI', 'P', 'SURABAYA', '2007-12-30', 'Islam', NULL, NULL, 0, '', '0882009690289', 'PRADAH KALIKENDAL GG TANDON', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'NUNUK RIYADI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'PUDJI ASTUTIK', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (150, 196, '218755', '0089257965', '3578215604080002', '3578-LT-19092013-0274', 'IHKFA SAUHAROH DINA SALSABILA', 'P', 'SURABAYA', '2008-04-16', 'Islam', 150, 50, 0, '', '08885457647', 'PRADAH KALIKENDAL 6/46-B', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'DIDIK WAHYUDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'TATIK HARIYANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (151, 197, '218785', '0097232469', '3578052501090001', '7916/2011', 'KITARO MUAZAM ADWAYA', 'L', 'SURABAYA', '2009-01-25', 'Islam', 158, 85, 0, '', '083857960768', 'PUTAT GEDE BARAT 5/16', '5', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ASTRIANSYAH ANDONO', 'SOPIR', 'SMA/SEDERAJAT', '', '', 'SULISTIYARINI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (152, 198, '218788', '0099423633', '3578214506090002', '3578-LT-16092014-0003', 'LAURA TIFANNI SUDARMONO AGASHI', 'P', 'SURABAYA', '2009-06-05', 'Islam', 154, 43, 0, '', '081336629336', 'PRADAH KALIKENDAL', '1', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUDARMONO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'NIDYA GIOVANNI PRIBADI', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (153, 199, '218792', '0082914177', '3578210411080001', '14514/2010', 'M. AJI PAMUNGKAS', 'L', 'SURABAYA', '2008-11-04', 'Islam', 150, 46, 0, '', '082335615996', 'PRADAH KALIKENDAL 1/05', '1', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ROCHMAD JULIANTO', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'RETNO YASWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (154, 200, '218805', '0086266477', '3578272110080002', '3578-LT-25092013-0007', 'MOHAMAD RIDHO SANTOSO', 'L', 'SURABAYA', '2008-10-21', 'Islam', 146, 40, 0, '', '081358839992', 'PUTAT GEDE BARAT 02/48', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'HAJI SANTOSO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'LILIK FATONIYAH', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (155, 201, '218807', '0089010882', '3578210306080002', '3578-LT-19012012-0693', 'MUHAMAD YUSTIFAR', 'L', 'SURABAYA', '2008-06-03', 'Islam', 147, 48, 0, '', '081233542261', 'PRADAH KALIKENDAL', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUKIMIN ABDUL ROCHIM', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'JEMANI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (156, 202, '218808', '0084716405', '3578272702080001', '20986/2008', 'MUHAMMAD ABDI FEBRIANTO', 'L', 'SURABAYA', '2008-02-27', 'Islam', 155, 40, 0, '', '083854590720', 'PUTAT GEDE BARAT 2/11', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'RIYONO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'IIN WAHYUNINGSIH', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (157, 203, '218851', '0086273167', '3516150407080001', '891/DS.T/2009/KAB.MR.', 'RAHMAT ADITYA PRATAMA', 'L', 'MOJOKERTO', '2008-07-04', 'Islam', 160, 40, 0, '', '088235417271', 'PUTAT GEDE BARAT 2/11', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'WAHYU HIDAYAT', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'LIA', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (158, 204, '218821', '0099866568', '3578141710090001', '11264/2009', 'MUHAMMAD ZIVEN OCTAVIAN ARKANANTA', 'L', 'SURABAYA', '2009-10-17', 'Islam', 160, 47, 0, '', '085931097319', 'MANUKAN TENGAH 8/6H 15', '2', '4', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'EDY PRIYONO, SE', '', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'TATI SULISTINA', 'MENGURUS RUMAH TANGGA', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (159, 205, '218840', '0083300185', '3578142209080002', '15136/2008', 'PERMANA SODIKHUN', 'L', 'SURABAYA', '2008-09-22', 'Islam', 155, 42, 0, '', '081230366927', 'JL. RAYA TUBANAN INDAH II', '1', '9', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60186', 'TOPO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'MINARSIH', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (160, 206, '218847', '0089573984', '3578142910080001', '15912/2008', 'RAFI ALFACHRY PRAYOGA', 'L', 'SURABAYA', '2008-10-29', 'Islam', 168, 50, 0, '', '085591110824', 'JL.RAYA TUBANAN', '4', '9', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60186', 'KAMIN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'TITIK LISTIYOWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (161, 207, '218883', '0085532437', '3578065107080001', '10923/2008', 'SHEVA DERYA MANZARASI', 'P', 'SURABAYA', '2008-07-11', 'Islam', 155, 55, 0, '', '085229767671', 'SIMO KATRUNGAN KIDUL 2/11', '7', '1', 'Banyu Urip', 'Kec. Sawahan', 'SURABAYA', '60254', 'CATUR WIDYA SASANGKA', 'WIRASWASTA', 'DIPLOMA II (D2)', '', '', 'RINI YULIANTRINI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (162, 208, '218641', '0088171275', '3578211311080002', '26093/2010', 'ACHMAD ROSIYANDI AKBAR ALIF', 'L', 'SURABAYA', '2008-11-13', 'Islam', 160, 56, 0, '', '085697339672', 'PRADAH PERMAI 6/30', '2', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'PAUDI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'ROSIANI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (163, 209, '218884', '0087772539', '3578214504080002', '5587/2008', 'SHOFIA KEYSHA RACHMAWATI', 'P', 'SURABAYA', '2008-04-05', 'Islam', 156, 42, 0, '', '085717649920', 'DUKUH PAKIS 2/111-C', '5', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'DIDIK SUSANTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'PURWANTI WIDJI ASTUTIK', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (164, 210, '218652', '0082867941', '3578214810080001', '3578-LT-30112011-0018', 'AISYAHTUL ALLIFANTI NABILA PUTRI', 'P', 'SURABAYA', '2008-10-08', 'Islam', 142, 42, 0, '', '081233855449', 'PRADAH INDAH', '8', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ARIFIN', 'BURUH HARIAN LEPAS', 'SMP/SEDERAJAT', '', '', 'RINA NOVITA', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (165, 211, '218657', '0085321742', '3578215303080001', '12258/T/2010', 'ALLIFTA NUR SURYANI', 'P', 'SURABAYA', '2008-03-13', 'Islam', NULL, NULL, 0, '', '082142132652', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUSILO', '', '', '', '', 'SULASTRI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (166, 212, '218667', '0088046921', '3578214812080001', '3578-LT-30112011-0138', 'ANDHINI CAHYA ALICHIA', 'P', 'SURABAYA', '2008-12-08', 'Islam', 153, 38, 0, '', '085606456750', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AHSETIONO', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'YULIYANTI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (167, 213, '218676', '3091028963', '3578214905090001', '5856/2009', 'ARLETHA DESTARASTRA', 'P', 'SURABAYA', '2009-05-09', 'Islam', 140, 38, 0, '', '08976425760', 'PRADAH KALIKENDAL I NO 15B', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUMARDIONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI AGUS YANTI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `students` VALUES (168, 214, '218700', '0089438170', '3578215308080001', '12756/2008', 'CLARISSA VALENTINA ARRYANTO', 'P', 'SURABAYA', '2008-08-13', 'Islam', 151, 43, 0, '', '085258214188', 'NGESONG DUKUH KUPANG 1/7', '2', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'MARKAN ARRYANTO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'NUR KAYATIN', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (169, 215, '218703', '0091411186', '3578066801090001', '3578-LT-22072013-0060', 'DANELLA ZAHRA ZANETA', 'P', 'SURABAYA', '2009-01-28', 'Islam', 160, 40, 0, '', '082144978315', 'BOMBER NO.11', '3', '1', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'DEDI SUPRIYONO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'SAVITRI RETNANTANDA DEVI', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (170, 216, '218721', '0095083611', '3578066304090004', '9190/2010', 'ELVARETTA GEMELLY ANAK HERLAMBANG', 'P', 'SURABAYA', '2009-04-23', 'Islam', 150, 38, 0, '', '085236312762', 'PETEMON BARAT 83', '2', '2', 'Kupang Krajan', 'Kec. Sawahan', 'SURABAYA', '60253', 'AGUS HERLAMBANG', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'NURIATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (171, 217, '218718', '0096781156', '3578270707090001', '8173/2009', 'DWI LUTFI MAHADIRKA', 'L', 'SURABAYA', '2009-07-07', 'Islam', NULL, NULL, 0, '', '081335775142', 'PUTAT GEDE TIMUR 4/61', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUWONDO PRIBADI', '', '', '', '', 'KUSNAWATI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (172, 218, '218722', '0093323832', '3578066304090003', '9189/2010', 'ELVETTA GEMELLY ANAK HERLAMBANG', 'P', 'SURABAYA', '2009-04-23', 'Islam', 150, 40, 0, '', '085236312762', 'PETEMON BARAT 83', '2', '2', 'Kupang Krajan', 'Kec. Sawahan', 'SURABAYA', '60253', 'AGUS HERLAMBANG', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'NURIATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (173, 219, '218723', '0095509329', '3578067001090003', '14802/2009', 'ENDAH PUJI LESTARI', 'P', 'SURABAYA', '2009-01-30', 'Islam', 157, 37, 0, '', '081235713111', 'DUKUH KUPANG TIMUR 18/32', '6', '9', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'ANDRI WIBOWO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SULISTYORINI, SE', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (174, 220, '218724', '0093617657', '3578211106090001', '3578-LT-02012012-0087', 'ERDY REZA ENDRAWAN', 'L', 'SURABAYA', '2009-06-11', 'Islam', 155, 30, 0, '', '081217502232', 'DUKUH KUPANG BARAT 1/102', '2', '4', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'EKO BOEDI POERWANTO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'PRIMA ENDRA SARI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (175, 221, '218737', '0091958937', '3578211206090001', '6842/2009', 'FEISAL RASYID LUBIS', 'L', 'SURABAYA', '2009-06-12', 'Islam', 145, 45, 0, '', '089522376081', 'PRADAH KALIKENDAL 12/115', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MUHAMMAD SALEH I', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', 'JENNI EMILAH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (176, 222, '218776', '0083652406', '3578066711080004', '12303/2010', 'KEYSHA AURELIA SISWANTO PUTRI', 'P', 'SURABAYA', '2008-11-27', 'Islam', 156, 50, 0, '', '08885140321', 'BANYU URIP LOR 1/8', '5', '5', 'Kupang Krajan', 'Kec. Sawahan', 'SURABAYA', '60253', 'TRI SISWANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NENENG KUSMIATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (177, 223, '218754', '0082174726', '3578215401080002', 'CAPIL SBY 4853/2008', 'IFTITA RIZKY NINGASTRI', 'P', 'SURABAYA', '2008-01-14', 'Islam', NULL, NULL, 0, '', '089644823274', 'PRADAH KALIKENDAL', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUKIMAN', '', '', '', '', 'PONATRI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (178, 224, '218764', '0083339668', '3578211010080002', '3578-LT-28052015-0002', 'JOERICO EGA PRATAMA PUTRA', 'L', 'SURABAYA', '2008-10-10', 'Islam', NULL, NULL, 0, '', '0895703224343', 'PRADAH KALIKENDAL', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUWAJI', '', '', '', '', 'SRI RETNO SULISTYORININGSIH', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (179, 225, '218781', '0089184960', '3578066509080002', '8311/2011', 'KHANZA RAMADHANIA PUTRI YOLANDA', 'P', 'SURABAYA', '2008-09-25', 'Islam', 169, 60, 0, '', '083849071472', 'JL.DUKUH KUPANG TIMUR 17/43', '5', '9', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'SOFAN YOLANDA', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'RISNA WILLYARTI RAMADHANI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (180, 226, '218795', '0106794306', '3578211803100001', '5403/2010', 'MARIO RAFFA YUSUF MAULANA', 'L', 'SURABAYA', '2010-03-18', 'Islam', 156, 30, 0, '', '081331686898', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'YUSUF SUGIHARTO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'WIWID MARIA RACHMAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (181, 227, '218787', '0089365819', '7371136511080007', '7371.AL.2011.019843', 'LATHIFA PUTRI ALINCHA', 'P', 'MAKASSAR', '2008-11-25', 'Islam', 155, 43, 0, '', '081335732451', 'PATTIMURA XII / 43', '5', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AHMAD KHAIRI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'FRIESKA IVONIA PANGESTU', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (182, 228, '218800', '0098091382', '3578211501090002', '2870/2009', 'MOCH. ADRIANSYAH TRI SAPUTRA', 'L', 'SURABAYA', '2009-01-15', 'Islam', 150, 68, 0, '', '085103189186', 'PRADAH KALIKENDAL', '8', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUYONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'TUATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (183, 229, '218802', '0085301554', '3578062111080009', '16191/2008', 'MOCHAMMAD NAFIS DIFFA RIZQULLAH YUNUS', 'L', 'SURABAYA', '2008-11-21', 'Islam', 155, 60, 0, '', '081359990282', 'PUTAT JAYA C BARAT 8/50', '2', '13', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'HENDRA SURJANA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'YUNI ASTUTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (184, 230, '218815', '0096857166', '3578060104090001', '4485/2009', 'MUHAMMAD MAULANA ALI RAMDHANI', 'L', 'SURABAYA', '2009-04-01', 'Islam', 160, 45, 0, '', '081703272727', 'DUKUH KUPANG TIMUR 14/28', '2', '9', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'MUHAMMAD MAJIDI AFFANDI', '', 'DIPLOMA III (D3)', '', '', 'SINTA CANDRA SARI', 'WIRASWASTA', 'STRATA II (S2)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (185, 231, '218816', '3093269260', '3578211303090003', '2790/2011', 'MUHAMMAD MUFID FATAHILLAH', 'L', 'SURABAYA', '2009-03-13', 'Islam', 155, 40, 0, '', '085707794429', 'PRADAH KALIKENDAL', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'TAIL SUPARMIN', '', 'SD/SEDERAJAT', '', '', 'PANITRI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (186, 232, '218831', '0082955919', '3578215911080001', '25994/2011', 'NAZWA NAGITA SLAVINA', 'P', 'SURABAYA', '2008-11-19', 'Islam', 120, 29, 0, '', '082213020980', 'PRADAH KALIKENDAL', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HADI WAHYONO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SULIS SETYOWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (187, 233, '218843', '0082776966', '3578211505080001', '9822/2008', 'RADITYA DIMAS ARDI FIRMANSYAH', 'L', 'SURABAYA', '2008-05-15', 'Islam', 156, 40, 0, '', '083833512539', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'TIKNO', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'RATNA DEWI SULISTYOWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (188, 234, '218866', '0085944307', '3578210809080001', '13974/2008', 'RIAN ANGGARA RAMADHANI', 'L', 'SURABAYA', '2008-09-08', 'Islam', 150, 31, 0, '', '083115090465', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'PONIRAN', 'BELUM/TIDAK BEKERJA', 'SD/SEDERAJAT', '', '', 'SUYATI', 'BELUM/TIDAK BEKERJA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (189, 235, '218856', '0083744673', '3578215508080001', '4864/2011', 'RATU SHABRINA', 'P', 'SURABAYA', '2008-08-15', 'Islam', 155, 60, 0, '', '082141422897', 'PRADAH KALIKENDAL 2/12', '1', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AGUS SUPRIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MUNAWAROH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (190, 236, '218874', '0086861398', '3578216806080002', '3578-LT-01022012-0278', 'SAFIRA PUTRI VINATA', 'P', 'SURABAYA', '2008-06-28', 'Islam', 160, 60, 0, '', '083833227938', 'DUKUH KALIKENDAL', '5', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'BUDI PURNOMO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ZURIAH', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (191, 237, '218881', '0089758059', '3578020511080001', '15118/2009', 'SCANDRIA RAFFA HARDIAWAN', 'L', 'SURABAYA', '2008-11-05', 'Islam', 160, 40, 0, '', '0818512142', 'TUBANAN BARU BLOK M/11', '3', '7', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60186', 'SATRIYA HARDIAWAN', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', 'ENDRI SUSANTI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (192, 238, '218638', '0079560489', '3578212203070002', '18453/2011', 'ABDUL MUFID MAULIDI', 'L', 'SURABAYA', '2007-03-22', 'Islam', 154, 41, 0, '', '083857242384', 'DUKUH KALIKENDAL', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MUSLIM', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'KUSNUL WIDJAWATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (193, 239, '218642', '0088456696', '3524051409080001', '474.1/52254/2008', 'ACHMAD SAIFUL RAHMADANI', 'L', 'SURABAYA', '2008-09-14', 'Islam', 147, 38, 0, '', '089530389075', 'PUTAT GEDE BARAT 3/22', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUPODO HADI.', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'SUMINI.', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (194, 240, '218899', '0084502156', '3578211009080002', '3578-LT-07122017-0093', 'YORDAN DWI RAMADHANI', 'L', 'SURABAYA', '2008-09-10', 'Islam', 152, 60, 0, '', '081283624413', 'DUKUH KALIKENDAL', '2', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MARJUKI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'KUSMIATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (195, 241, '218649', '0096956048', '3578211606090001', '6548/2009', 'AHMAD AFIF HIDAYAT', 'L', 'SURABAYA', '2009-06-16', 'Islam', 150, 38, 0, '', '085816999516', 'DUKUH KALIKENDAL 35', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MARTONO', '', 'SMA/SEDERAJAT', '', '', 'SUNARSIH DWI YANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (196, 242, '218663', '0099710953', '3578145603090003', '3578-LT-13022012-0201', 'AMELIA PUTRI KLASITA', 'P', 'SURABAYA', '2009-03-16', 'Islam', 150, 40, 0, '', '081235362129', 'MANUKAN TELAGA 32-N/35', '6', '14', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'KLASIYANTO', '', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'YUSNITA CATUR ISTIANA', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `students` VALUES (197, 243, '218668', '0087231085', '3578134306080001', '7998/2008', 'ANDIEN PUTRI YUNIARDI', 'P', 'SURABAYA', '2008-06-03', 'Islam', 159, 51, 0, '', '081331042843', 'JL. KALIBUTUH NO.124-C', '6', '2', 'Tembok Dukuh', 'Kec. Bubutan', 'SURABAYA', '60173', 'SUMARDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'YUNI ASTUTI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (198, 244, '218671', '0089520770', '3578215704080005', '27957/2010', 'APRILIA BUNGA CITRA LESTARI', 'P', 'SURABAYA', '2008-04-17', 'Islam', 157, 60, 0, '', '085736066838', 'DARMO PERMAI SELATAN 17/23', '6', '5', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SLAMET RIANTO', '', 'SMA/SEDERAJAT', '', '', 'MARIYATI', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (199, 245, '218675', '0088246379', '3578216112080001', '14686/2009', 'ARDIA PRAMESTIA CAHYANI', 'P', 'SURABAYA', '2008-12-21', 'Islam', 148, 37, 0, '', '082243353155', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ERNAWATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (200, 246, '218685', '0083609881', '3578276208080005', '3578-LT-06062015-0046', 'AYU AGUSTIA', 'P', 'SURABAYA', '2008-08-22', 'Islam', 150, 40, 0, '', '085931002030', 'PUTAT GEDE BARAT 2/7', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'WAHYU YULIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRIANAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (201, 247, '218689', '0081998349', '3578212103080003', '3578-LT-10072012-0172', 'BAGAS PANJI SAPUTRA', 'L', 'SURABAYA', '2008-03-21', 'Islam', 145, 42, 0, '', '081215032225', 'PRADAH KALIKENDAL 7/24-B', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ACHMAD SHOLEH', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'MARYATI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (202, 248, '218695', '0088088256', '3578275606080001', '28621/2010', 'CHIKA GENDIS SAFITRI', 'P', 'SURABAYA', '2008-06-16', 'Islam', 145, 32, 0, '', '087775669395', 'PUTAT GEDE TIMUR 4/22', '4', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60186', 'SUKRIYANTO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'WIWIK SUKMAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (203, 249, '218708', '3082980180', '3517111704080001', '3515-LT-10022014-0040', 'DENIS PUTRA DIAN ANUGRAH', 'L', 'SURABAYA', '2008-04-17', 'Islam', 165, 49, 0, '', '081939316887', 'DUKUH KALIKENDAL', '5', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60228', 'PRIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'DEWI SUKESI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (204, 250, '218712', '0089544176', '3578216308080002', '20195/2008', 'DHEA ADINDA AULIA', 'P', 'SURABAYA', '2008-08-23', 'Islam', 154, 45, 0, '', '081913052947', 'PRADAH KALIKENDAL', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MUJIADI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SATIAH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (205, 251, '218713', '0084606258', '3578145309080001', '12937/2008', 'DHONA PUTRI FAJAR PELANGI', 'P', 'SURABAYA', '2008-09-13', 'Islam', 149, 58, 0, '', '082141056656', 'MANUKAN KULON 1/25', '5', '10', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'ABDUL MUJAINI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'A\'IMA SOLICHAH, SPd', 'GURU', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (206, 252, '218717', '0088431607', '3305261311080002', '17505/2008', 'DRIANOVA ADIKA PRATAMA', 'L', 'KEBUMEN', '2008-11-13', 'Islam', 120, 35, 0, '', '087749189886', 'PUTAT GEDE TIMUR 4/15', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'DIDIK HERNANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LISTRIANA', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (207, 253, '218736', '0086447244', '3578067103080011', '19405/2008', 'FAUZIAH NUR LAILY', 'P', 'SURABAYA', '2008-03-31', 'Islam', 161, 50, 0, '', '081231160902', 'KEMBANG KUNING KRAMAT 1/25-D', '10', '6', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'SAMSUL HUDA', '', 'SMA/SEDERAJAT', '', '', 'CHOIRIYAH, SE', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (208, 254, '218743', '0086839847', '3578216007080001', '3578-LT-04122020-0017', 'FITRIA SALSABILA', 'P', 'SURABAYA', '2008-07-20', 'Islam', 130, 42, 0, '', '088230511601', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUGENG', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'NUR AINI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (209, 255, '218750', '0085436518', '3578212410080002', '3578-LT-15022021-0067', 'HENDRA KURNIAWAN', 'L', 'SURABAYA', '2008-10-24', 'Islam', 135, 45, 0, '', '087878511535', 'PRADAH KALIKENDAL 2', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HARI ISWANTO', '', '', '', '', 'SRIYATUN', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (210, 256, '218769', '0082509910', '3578216110080003', '15858/2008', 'KEISHA AULIA', 'P', 'SURABAYA', '2008-10-21', 'Islam', 150, 38, 0, '', '081332884306', 'PRADAH KALIKENDAL', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'WIRANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ARLIPAH IDAMAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (211, 257, '218770', '0087138420', '3578212101090001', '13814/2009', 'KELVIN ILHAM ARYAWAN', 'L', 'SURABAYA', '2009-01-21', 'Islam', 148, 56, 0, '', '082335473579', 'PRADAH KALIKENDAL', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HARI IRAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LILIK SUGIANI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (212, 258, '218786', '0088780875', '3578062511080003', '20568/2009', 'KUMARA HAFIDZ AL GHIFARI', 'L', 'SURABAYA', '2008-11-25', 'Islam', 160, 58, 0, '', '087852332199', 'PAKIS WETAN 6/10-A', '11', '3', 'Pakis', 'Kec. Sawahan', 'SURABAYA', '60256', 'OENTORO FADJAR', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RENI FEBRIYANTI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (213, 259, '218790', '0082166633', '3578211411080004', '13230/U/2008', 'LUTHFI AHNAF DWI SURURI', 'L', 'NGANJUK', '2008-11-14', 'Islam', 153, 52, 0, '', '082138375006', 'DUKUH PAKIS GG MASJID NO. 47', '2', '6', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'SAMIJAN, SH', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'SULISTIANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (214, 260, '218825', '0091158029', '3578215704090001', '25023/2009', 'NADINE RAFIFAH AZARIN FARYADI', 'P', 'SURABAYA', '2009-04-17', 'Islam', 157, 46, 0, '', '087774777362', 'JL. DUKUH KALIKENDAL NO.99', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SOFYAN FARYADI,SH.', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'SRI SUNARSIH,S.PD, M.SI', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (215, 261, '218828', '0082214776', '3578144411080001', '16212/2008', 'NANDHITA NURAYU NOVADILA', 'P', 'SURABAYA', '2008-11-04', 'Islam', 155, 46, 0, '', '089606950788', 'BALONGSARI MADYA 7-I/9', '6', '2', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60185', 'KHOIRI HADIL ASMA\'I', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SANI NUR HASANAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (216, 262, '218835', '0083679695', '3578215707080003', '7476/2009', 'NUR AINI ALTA FUNESA', 'P', 'SURABAYA', '2008-07-17', 'Islam', 158, 40, 0, '', '088235921282', 'PRADAH KALIKENDAL', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'TASUIN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KHUSNUL KHOTIMAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (217, 263, '218842', '0088490097', '3578144510080001', '15778/2008', 'RACHEL FAADIHILAH PRATAMA', 'L', 'SURABAYA', '2008-10-05', 'Islam', 135, 35, 0, '', '085648966985', 'TUBANAN BARU BLOK D/11', '3', '8', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60186', 'TRI MULYONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KARMIASEH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (218, 264, '218864', '3070586253', '3578212405070005', '3578-LT-04032021-0040', 'RHENO DWI PRASETYO', 'L', 'SURABAYA', '2007-05-24', 'Islam', 165, 50, 0, '', '087852824397', 'PRADAH KALIKENDAL', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ACHMAD DJAINURI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'RUKMIYATUN', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (219, 265, '218845', '0088676043', '3503062210080001', '3802/B/2008', 'RADITYA WAHYU SAPUTRA', 'L', 'TRENGGALEK', '2008-10-22', 'Islam', 165, 41, 0, '', '083833227954', 'PUTAT GEDE TIMUR 4/52', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'KADENI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'BINTI KHOLIFAH', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (220, 266, '218879', '0088103341', '3578212110080004', '14439/2008', 'SANDYKHA PRATAMA PESARISTO', 'L', 'SURABAYA', '2008-10-21', 'Islam', 160, 50, 0, '', '085106871100', 'DUKUH PAKIS 5.F/32', '2', '4', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'EKA ARIADI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'FITRI LESTARI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (221, 267, '218888', '0088501716', '3578044104080003', '5040/2008', 'SYAHDA ARYNI AURIA', 'P', 'SURABAYA', '2008-04-01', 'Islam', 154, 40, 0, '', '082150103069', 'WONOSARI KIDUL 3/6', '3', '3', 'Sawunggaling', 'Kec. Wonokromo', 'SURABAYA', '60242', 'RYAN BUDIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IMANIAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (222, 268, '218898', '0089908723', '3578214104080002', '3578-LT-23112011-0228', 'WULAN APRILIA', 'P', 'SURABAYA', '2008-04-01', 'Islam', 148, 39, 0, '', '0895623380016', 'DUKUH KALIKENDAL', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'NUHRUL HAYAT', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'SULIS SUGIARTI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (223, 269, '218643', '0098172933', '3578216601090004', '3578-LT-09072015-0062', 'ADELIA', 'P', 'SURABAYA', '2009-01-26', 'Islam', 155, 20, 0, '', '083849183538', 'PRADAH PERMAI 5/19', '3', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'IMAM SUPI\'I', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RIRIN TRIANINGSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (224, 270, '218645', '0095043625', '3578272501090002', '3578-LT-23112011-0199', 'ADITYA PUTRA YANDRI', 'L', 'SURABAYA', '2009-01-25', 'Islam', 130, 40, 0, '', '085546668241', 'RAYA PUTAT GEDE 83-A', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'MOH. SOPYAN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'INDRI ERNAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (225, 271, '218646', '0088058240', '3578212712080002', '3578-LT-15052013-0516', 'ADITYA WIRA SANTOSO', 'L', 'SURABAYA', '2008-12-27', 'Islam', 147, 48, 0, '', '08133366117', 'PRADAH KALIKENDAL 6/34', '4', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'DIDIK SANTOSO', 'PENSIUNAN', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'ENI JUSMIATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (226, 272, '218651', '0086399419', '3578146512080003', '24977/2009', 'AISYAH NATHALLIEA DESVANA', 'P', 'SURABAYA', '2008-12-25', 'Islam', 145, 33, 0, '', '085731140966', 'TANDES KIDUL GG.SAWAH NO.41', '1', '2', 'Tandes', 'Kec. Tandes', 'SURABAYA', '60187', 'MUHAMMAD HUDA', '', '', '', '', 'EMI FATMAWATI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `students` VALUES (227, 273, '218658', '0095638516', '3578215401090001', '6500/2009', 'ALVINA YOVITA SIXWANDI', 'P', 'SURABAYA', '2009-01-14', 'Islam', 153, 38, 0, '', '082366666177', 'KENCANASARI TIMUR 14/2-A', '2', '6', 'Gunung Sari', 'Kec. Dukuh Pakis', 'SURABAYA', '60224', 'BTARI YOFALINDA', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SEDI SIXWANDI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (228, 274, '218697', '0092511882', '3578274104090001', '7967/2010', 'CINTA CARISSA EFRILIA SAPUTRI', 'P', 'SURABAYA', '2009-04-01', 'Islam', 157, 42, 0, '', '089654303932', 'SONO INDAH 1/11', '1', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ADI SAPUTRO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'VIVIN SISWANTI ANINGSARI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (229, 275, '218659', '0094157390', '3578145703090004', '3578-LT-04042012-0044', 'ALZENA KIRANA DEWI', 'P', 'SURABAYA', '2009-03-17', 'Islam', 158, 42, 0, '', '082133152964', 'MANUKAN LOR 3-B/8', '4', '12', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'SUGITO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'DEWI NASTANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (230, 276, '218664', '0083638090', '3578214811080001', '17029/2008', 'AMIRAH MARSA ARISTAWIDYA', 'P', 'SURABAYA', '2008-11-08', 'Islam', 156, 41, 0, '', '081235919019', 'RAYA PRADAH INDAH NO. 34', '6', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AGUS SANTOSO', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'TITIK ANGGRAINI', 'WIRASWASTA', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (231, 277, '218728', '0083837015', '3508181309080002', '3508.AL.2010.019363', 'FALAH MAULANA RAMDANI', 'L', 'SURABAYA', '2008-09-13', 'Islam', 159, 50, 0, '', '082337744834', 'SONO INDAH 4/11', '3', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'PRIATNA CANDRA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SITI MORNI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (232, 278, '218725', '0081214369', '3578274111080001', '7807/2009', 'ERLINDA DWIJAYANTI SUPRIYADI', 'P', 'SURABAYA', '2008-11-01', 'Islam', 155, 40, 0, '', '083854582126', 'PUTAT GEDE BARAT 3 / 11', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BAMBANG SUPRIYADI,S.T', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'YUNITA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (233, 279, '218740', '0072175550', '3578212608070003', '3578-LT-04082014-0020', 'FERRY FERNANDA', 'L', 'SURABAYA', '2007-08-26', 'Islam', 167, 86, 0, '', '082230137441', 'PRADAH PERMAI 10/40', '2', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', '', 'BURUH HARIAN LEPAS', 'SMA/SEDERAJAT', '', '', 'PARTI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (234, 280, '218742', '0085710205', '3578271508080004', '1803/2011', 'FINDZA MAULANA SAPUTRA', 'L', 'SURABAYA', '2008-08-15', 'Islam', 164, 70, 0, '', '088803362601', 'SIMOMULYO BARU 07-C/9', '8', '4', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'ASEP MULYANA', 'BURUH HARIAN LEPAS', 'SMA/SEDERAJAT', '', '', 'WULAN JANUARTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (235, 281, '218744', '0086778797', '3578216208080002', '3578-LT-18012012-0537', 'FRIZA ANANTA', 'P', 'JOMBANG', '2008-08-22', 'Islam', 145, 31, 0, '', '085600380769', 'DUKUH KALIKENDAL', '4', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUWARNO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'VIVIN SETYANINGSIH', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (236, 282, '218745', '0085192038', '3578061607080005', '11305/2008', 'GALUH PRIMA DWI PUTRA', 'L', 'SURABAYA', '2008-07-16', 'Islam', 153, 30, 0, '', '08123028601', 'SIMO GUNUNG BARAT TOL 2/58-B', '6', '8', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'AGUS SUPRAPTO', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'WINARSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (237, 283, '218752', '0097725043', '3578271311090001', '3578-LT-08092011-0164', 'HIZKY RAIHANDRA SANIA RANA', 'L', 'SURABAYA', '2009-11-13', 'Islam', 148, 32, 0, '', '081805723344', 'PUTAT GEDE BARAT 2/52', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MUJIONO', 'PENATA BUSANA', 'SMA/SEDERAJAT', '', '', 'YULI RAMAYANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (238, 284, '218758', '0082607935', '3578082008080005', '20127/2008', 'IQBAL ADITYA ROZZAQ', 'L', 'SURABAYA', '2008-08-20', 'Islam', 165, 58, 0, '', '082334575577', 'JOJORAN 3 PERINTIS 31', '4', '13', 'Mojo', 'Kec. Gubeng', 'SURABAYA', '60285', 'SITRA HENDRA BUDIMAN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'RINI RUSTANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (239, 285, '218760', '0087258158', '3578213007080001', '11299/2008', 'IZAL WAHYU SAPUTRA', 'L', 'SURABAYA', '2008-07-30', 'Islam', 135, 35, 0, '', '085104448425', 'DARMO PERMAI SELATAN 17/57', '6', '5', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'WAHJOEDIANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUNARSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (240, 286, '218783', '0085714207', '3578216712080001', '1870/2009', 'KIRANI ALIFIA NUGRAHA', 'P', 'SURABAYA', '2008-12-27', 'Islam', 152, 35, 0, '', '083830198646', 'DUKUH PAKIS 2 TMP 9', '5', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'DJOKO NUGROHO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'NOVIA ARIYANTI', 'DOSEN', 'STRATA II (S2)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (241, 287, '218753', '0087684419', '3578275209080003', '3578-LT-29122011-0475', 'ICHA RAMADHANI', 'P', 'SURABAYA', '2008-09-12', 'Islam', NULL, NULL, 0, '', '081335780637', 'PUTAT GEDE TIMUR 4/22', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'DWI CAHYONO', '', '', '', '', 'IKA CANDRAWATI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (242, 288, '218803', '0088227146', '3578211906080005', '474.1/5600/2008', 'MOH. HAFIDZ AWALUL RAHMAN', 'L', 'LAMONGAN', '2008-06-19', 'Islam', 155, 35, 0, '', '085784827886', 'DUKUH PAKIS BARU 2C/18', '4', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'SUWITO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'ASFAROTUN', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (243, 289, '218818', '0081139970', '3578271407080002', '10679/2008', 'MUHAMMAD SOFWAN ARIFIN', 'L', 'SURABAYA', '2008-07-14', 'Islam', 138, 30, 0, '', '0895335386579', 'NGESONG DUKUH KUPANG 2/40-A', '3', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ANDI WAHYUDI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SRI SUMBAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (244, 290, '218823', '0086127336', '3578214105080002', '6694/2008', 'NADA SAVAIRA FALISHA', 'P', 'SURABAYA', '2008-05-01', 'Islam', 156, 38, 0, '', '085608293381', 'DUKUH KUPANG BARAT 11/20', '2', '4', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'SUYATNO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'DWI SUSANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (245, 291, '218826', '0083673264', '3578145710080003', '15699/2008', 'NADIVA FAUZIA ISLAMI GIONONI', 'P', 'SURABAYA', '2008-10-17', 'Islam', 154, 36, 0, '', '082233574445', 'MANUKAN MUKTI 10-B/7', '1', '9', 'Manukan Kulon', 'Kec. Tandes', 'SURABAYA', '60185', 'SOEGIONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NUR ANISA SHOLAWATI, SE', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (246, 292, '218849', '0095875432', '3578020406090001', '6904/2009', 'RAFIF IZZAN KHAIZURAN WIRASAKTI', 'L', 'SURABAYA', '2009-06-04', 'Islam', 155, 50, 0, '', '085330697053', 'JL. GOLF 6/1', '3', '4', 'Gunung Sari', 'Kec. Dukuh Pakis', 'SURABAYA', '60224', 'LASMIJAN,,S.Pd', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'ARI FADHILAH', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (247, 293, '218848', '0092585540', '3515131904090003', '006574/2009', 'RAFI PUTRA MARDHANI', 'L', 'SIDOARJO', '2009-04-19', 'Islam', 150, 60, 0, '', '0881036662167', 'DUKUH NGAGLIK PUTAT GEDE 6', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'DEDY MARDHANI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'I\'IN YUNIARNI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (248, 294, '218853', '0081882489', '3578212811080002', '25751/2009', 'RAKA VALDAZ CANSANOVELI', 'L', 'SURABAYA', '2008-11-28', 'Islam', 165, 56, 0, '', '081230434264', 'DUKUH PAKIS 2/96', '3', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'MOCHAMMAD AMIN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LISA INDRAYANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (249, 295, '218860', '0098977528', '3505056702090001', '3505CLT19011103341', 'REINA NATASYA EKA PRATIWI', 'P', 'BLITAR', '2009-02-27', 'Islam', 144, 39, 0, '', '082326865359', 'RAYA PUTAT GEDE 52-B', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'TUGIYAT', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'YUSTI PRASTIWI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (250, 296, '218861', '0089762668', '3578130102080001', '3229/2008', 'RENNO ARIANTO PUTRA', 'L', 'SURABAYA', '2008-02-01', 'Islam', 150, 39, 0, '', '083854591937', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '69022', 'MOCHAMAT CHAMBALI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUTINI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (251, 297, '187882', '0061914952', '3578061501060002', 'CSLA87654', 'RIFKY ALDO ADJI SYAHPUTRA', 'L', 'SURABAYA', '2006-01-15', 'Islam', 115, 22, 0, 'SP0333578061501060002@DISPENDIK.SURABAYA.GO.ID', '0', 'WONOREJO 3/7-B', '9', '5', '', 'Kec. Tegalsari', 'SURABAYA', '60256', 'RIADJI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ENDANG PUDJI RAHAYU', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (252, 298, '218891', '0089646143', '3578214209080001', '15267/2008', 'TALITHA PUSPA SABILILLAH RAMADHANNI', 'P', 'SURABAYA', '2008-09-02', 'Islam', 150, 40, 0, '', '087854685870', 'DUKUH PAKIS 1/26-A', '1', '6', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'AGUS SETIYO BUDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MELANTI PUSPARA', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (253, 299, '218660', '0091474493', '3578216302090001', '4785/P/IV/2009', 'AMANDA FEBRILIA', 'P', 'KEDIRI', '2009-02-23', 'Islam', 150, 40, 0, '', '08884994813', 'DUKUH KALIKENDAL', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUISWANDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NINING LIYAWATI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (254, 300, '218682', '0083160265', '3578275002080004', '3578-LT-09092011-0077', 'AURA DIFA PUTRIYONO', 'P', 'SURABAYA', '2008-02-10', 'Islam', 150, 54, 0, '', '0881036249980', 'PUTAT GEDE TIMUR 4/85', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUPRIYONO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SRI INDAYANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (255, 301, '218704', '0097215653', '3578275203090003', '6840/2011', 'DANNISA WARDIYATUL UMMAH', 'P', 'SURABAYA', '2009-03-12', 'Islam', 147, 40, 0, '', '082245745472', 'DARMO BARU BARAT 9', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'WARDI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'PONIMAH', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `students` VALUES (256, 302, '218709', '0085443042', '3578142209080003', '14755/2008', 'DEVIN ADRIAN PUTRA HARFIA', 'L', 'SURABAYA', '2008-09-22', 'Islam', 167, 55, 0, '', '087852208200', 'JL.BALONGSARI PRAJA II/25', '3', '6', 'Balongsari', 'Kec. Tandes', 'SURABAYA', '60186', 'HARI PRAMONO', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'FITRI AMELIA', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (257, 303, '218727', '0094227745', '3578141604090003', '4575/2009', 'FAJRUL ADHIM ASY SYAUQI', 'L', 'SURABAYA', '2009-04-16', 'Islam', 157, 55, 0, '', '082139435463', 'JL.TUBANAN MAKMUR VI', '2', '9', 'Karang Poh', 'Kec. Tandes', 'SURABAYA', '60186', 'AGUS SLAMET', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SOFIATUL FITRI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (258, 304, '218710', '0084933721', '3578276811080001', '11483/2009', 'DEVINA DWI RESTYA', 'P', 'SURABAYA', '2008-11-28', 'Islam', 150, 55, 0, '', '081228616343', 'KUPANG JAYA 1/28', '1', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUGIYONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'CHOLIFAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (259, 305, '218731', '0081562050', '3578274307080001', '20365/2008', 'FARIDA ROSI INOVIA', 'P', 'SURABAYA', '2008-07-03', 'Islam', 159, 62, 0, '', '081232377500', 'PUTAT GEDE TIMUR 3/8', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUPONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IYUS MAIDA WARDINI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (260, 306, '218726', '0087066811', '3578275905090003', '23705/2009', 'ERYCA PUTRI ANGGRAENI', 'P', 'SURABAYA', '2009-05-19', 'Islam', 149, 48, 0, '', '087784989292', 'PUTAT GEDE BARAT 2/33-A', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MOH. RIBUT KHOLIS BUDI ANSORI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'IKA WAHYUNINGSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (261, 307, '218732', '0081844335', '3578272805080001', '1755/2009', 'FARIS SURYANINGRAT', 'L', 'SURABAYA', '2008-05-28', 'Islam', 160, 60, 0, '', '085733249965', 'RAYA PUTAT GEDE NO. 1', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MUHAMMAD SYUEB', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'DHIENNA MURTININGRUM.S', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (262, 308, '218733', '0091810170', '3578266002090001', '3578-LT-10022012-0531', 'FARRA VALLIA PUTRI', 'P', 'SIDOARJO', '2009-02-20', 'Islam', 150, 35, 0, '', '08885544443', 'SUTOREJO SELATAN 11/16 SBY', '5', '8', 'Dukuh Sutorejo', 'Kec. Mulyorejo', 'SURABAYA', '60113', 'NOVAL HADIANTO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LILIK AGUSTIN', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (263, 309, '218746', '0097198702', '3578270202090002', '12264/2009', 'GANESHA AIRLANGGA HASTA PRAMADYA', 'L', 'SURABAYA', '2009-02-02', 'Islam', 155, 46, 0, '', '082230605482', 'KUPANG JAYA 1/12', '1', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'A. PRADANA SURYA SANJAYA,S.SN', 'WIRASWASTA', 'STRATA II (S2)', '', '', 'DEWI TRIYANTI,S.Sos', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (264, 310, '218741', '0093200788', '3578216805090002', '3578-LT-19062012-0004', 'FERRYSCHA PUTRI', 'P', 'SURABAYA', '2009-05-28', 'Islam', 150, 35, 0, '', '082257473439', 'DUKUH PAKIS 3-A/45', '5', '2', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'AGUS FERRY SANTOSO', 'BURUH HARIAN LEPAS', 'SMA/SEDERAJAT', '', '', 'NUNUK SAFITRI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (265, 311, '218756', '0086221144', '3578270806080002', '6080/2009', 'ILHAM ISYTIAK WALDANI', 'L', 'SURABAYA', '2008-06-08', 'Islam', 160, 47, 0, '', '081334086066', 'KUPANG JAYA 1/6', '1', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ISWANTO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'TITI ROHYANA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (266, 312, '218762', '0099873705', '3578270502090004', '3578-LT-11022014-0019', 'JAHRAKAL REDI', 'L', 'SURABAYA', '2009-02-05', 'Islam', 140, 35, 0, '', '082244473387', 'JL. PATTIMURA 12/43', '5', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SATRIYO REDI PERBOWO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'AULIA ISTIQOMAH PANGESTU', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (267, 313, '218761', '0097708680', '3578274203090002', '10323/2009', 'IZZAH AWWALYATUL FARIYAH', 'P', 'SURABAYA', '2009-03-02', 'Islam', 144, 40, 0, '', '083831853282', 'PUTAT GEDE TIMUR 3/76', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MOCHAMAD MOESTOFA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'MAYA ZUHRIYAH,SH', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (268, 314, '218777', '0086961090', '3578274109080002', '3578-LT-26092013-0073', 'KEYZA TRISSAVINA', 'P', 'SURABAYA', '2008-09-01', 'Islam', 143, 37, 0, '', '083852229336', 'RAYA PUTAT GEDE 27', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'RUDY SUTRISWANTO (ALM)', '', 'SD/SEDERAJAT', '', '', 'LILIS UMI MAISAROH', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (269, 315, '218778', '0081579073', '3578274108080001', '021364/2008', 'KHALDA JAMILAH NURFATIN', 'P', 'SURABAYA', '2008-08-01', 'Islam', 150, 38, 0, '', '085852619867', 'KUPANG JAYA 2/66', '3', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUGIYANTO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'MUSRIPAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (270, 316, '218780', '0089890868', '3578216909080001', '17290/2010', 'KHANZA FITRIA PUTRI WIDYANTO', 'P', 'SURABAYA', '2008-09-29', 'Islam', 155, 31, 0, '', '089616365727', 'DUKUH PAKIS 5.F/10', '2', '4', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ARIF WIDYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'DWI HENY MAHARANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (271, 317, '218796', '0085854692', '3578270407080001', '9673/2008', 'MAULANA FARRIS SETIAWAN', 'L', 'SURABAYA', '2008-07-04', 'Islam', 153, 45, 0, '', '083831963745', 'SONO INDAH 7/12', '1', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ARIF SUNARDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SETIYA NINGSIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (272, 318, '218797', '0092131732', '3578216104090004', '2244/2010', 'MERCY CALISTA NOR APRILIA', 'P', 'SURABAYA', '2009-04-21', 'Islam', 150, 42, 0, '', '085606669257', 'DUKUH KALIKENDAL', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SAHIBUDI NURWANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SITI KHOLIFAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (273, 319, '218794', '0094129783', '3578210102090002', '19708/2009', 'M. SOFWAN PUTRA NURHADI', 'L', 'SURABAYA', '2009-02-01', 'Islam', 150, 40, 0, '', '085731658568', 'PRADAH KALIKENDAL GG.4/22', '3', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'DIDIK NURHADI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IPAH SOPIAH', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (274, 320, '218817', '0089461711', '3578270309080001', '3578-LT-13032013-0214', 'MUHAMMAD RAFAIQ RAMADHANI', 'L', 'SURABAYA', '2008-09-03', 'Islam', 155, 49, 0, '', '085233525391', 'DUKUH NGAGLIK PUTAT GEDE GG. MANGGA NO. 3', '5', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'RIYANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KIKI FITRI AMALIA', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (275, 321, '218836', '0085463088', '3578270806080001', '9024/2008', 'NUR HADY AHMAD JUNY ANSYAH', 'L', 'SURABAYA', '2008-06-08', 'Islam', 165, 67, 0, '', '087863312096', 'PUTAT GEDE BARAT 3/6', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MULYOHADI', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'NURKHOLIMAH', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (276, 322, '218829', '0099256533', '3507125702090003', '3507.AL.2010.009466', 'NANIK NUR CAHYA', 'P', 'MALANG', '2009-02-17', 'Islam', 156, 32, 0, '', '085806371717', 'DUKUH KAWAL KALIKENDAL', '2', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60228', 'AGUS SUPRIYONO', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'TUNI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (277, 323, '218854', '0082677136', '3578273107080002', '2947/2009', 'RAKHA DWI JAYA FIRMANSYAH', 'L', 'SURABAYA', '2008-07-31', 'Islam', 155, 45, 0, '', '081330155631', 'DARMO BARU BARAT 23', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AGUS JAYA SUMITRO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SITI ROKATIN', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (278, 324, '218858', '0082739653', '3578270507080002', '10185/2008', 'RAYHAN JULIO RACHMAN', 'L', 'SURABAYA', '2008-07-05', 'Islam', 155, 50, 0, '', '0818175676', 'PUTAT GEDE BARU 9', '3', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'RACHMAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MARWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (279, 325, '218863', '0084755267', '3578274212080004', '3578-LT-17022021-0116', 'RHENATA CATUR SAFIRA', 'P', 'SURABAYA', '2008-12-02', 'Islam', 148, 48, 0, '', '081226662819', 'KUPANG JAYA 2/54 B', '2', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'EKO AYIEK PURWAHYUDI', '', '', '', '', 'SITI MUNAWAROH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (280, 326, '218876', '0099652603', '3578276507090002', '27383/T/2010', 'SALSABILA WABAROKAH SUSANTO', 'P', 'SURABAYA', '2009-07-25', 'Islam', 157, 46, 0, '', '082335629613', 'PUTAT GEDE TIMUR 3/26', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'HERU SUSANTO', 'PEGAWAI NEGERI SIPIL(PNS)', 'SMA/SEDERAJAT', '', '', 'TRIASTUTI NUR HANDAYANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (281, 327, '218877', '0085065363', '3578276110080002', '3578-LT-20102011-0171', 'SALVA PUTRI OKTAVIA', 'P', 'SURABAYA', '2008-10-21', 'Islam', 140, 39, 0, '', '083846812206', 'SIMOREJO 15/52', '6', '2', 'Simomulyo', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'ARIF KUNCORO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MINARTI NINGSIH', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (282, 328, '218894', '0084304916', '3523030707080001', '3523-LT-01062013-0021', 'TEUKU CHELVIN IRWANSYAH', 'L', 'TUBAN', '2008-07-07', 'Islam', 146, 35, 0, '', '082234545460', 'DUKUH PAKIS 2-A/6', '4', '1', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'NURIL HUDA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SRI ATIN', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (283, 329, '218665', '0094205957', '3578041308090003', '14506/TP/2009', 'ANANDA RAKA WIBOWO', 'L', 'CILACAP', '2009-08-13', 'Islam', 141, 35, 0, '', '08175062316', 'KUTEI 2/23-A', '9', '6', 'Darmo', 'Kec. Wonokromo', 'SURABAYA', '60241', 'YOYOK PRIYO WIBOWO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KRISWANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (284, 330, '218637', '0086234432', '3578271008080007', '3578-LT-11022015-0204', 'ABDUL GHOFUR', 'L', 'SURABAYA', '2008-08-10', 'Islam', NULL, NULL, 0, '', '089616082588', 'PUTAT GEDE PUNDEN 57', '4', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUJAK\'I', '', '', '', '', 'NABSIAH', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `students` VALUES (285, 331, '218666', '0082166080', '3578275512080001', '17298/2008', 'ANANDA SOFIA SAFITRI', 'P', 'SURABAYA', '2008-12-15', 'Islam', 155, 47, 0, '', '082140640203', 'DUKUH KALIKENDAL', '2', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SARDI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'TUMINI ALM', '', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (286, 332, '218677', '0081429820', '3578271211080001', '936/2009', 'ARTHUR SHEVA FERDINAN FAUZI', 'L', 'SURABAYA', '2008-11-12', 'Islam', 155, 62, 0, '', '082244437291', 'SIMOMULYO BARU 07-A/12-A', '10', '4', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'DIAN FAUJI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'KUSNUL KHOTIMA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (287, 333, '218680', '0086485367', '3578275507080002', '11443/2008', 'AUDREALINE HANUNDIAN PRYSHA', 'P', 'SURABAYA', '2008-07-15', 'Islam', 148, 25, 0, '', '081358236787', 'SIMOREJO SARI A-11/7', '7', '6', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'DIAN MINTRAHARDJA', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MUJIATI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (288, 334, '218678', '0094839267', '3578204702090002', '26208/2010', 'ASTRIVO GUSMAN NASUTION', 'P', 'SURABAYA', '2009-02-07', 'Islam', 154, 38, 0, '', '081231980766', 'WIYUNG', '4', '2', 'Wiyung', 'Kec. Wiyung', 'SURABAYA', '60228', 'SUKIROM', 'PEGAWAI NEGERI SIPIL(PNS)', 'SMA/SEDERAJAT', '', '', 'DWI ROCHMAWATI', 'MENGURUS RUMAH TANGGA', 'DIPLOMA I (D1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (289, 335, '218686', '0083093615', '3578275507080001', '10772/2008', 'AYU MELATI YULIA SARI', 'P', 'SURABAYA', '2008-07-15', 'Islam', 149, 49, 0, '', '081330351891', 'SONO INDAH 7/12', '1', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'SADINO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'ISMIYATI', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (290, 336, '218687', '0095420611', '3578065806090005', '2705/2011', 'AZARINE ASKA RAFIFA', 'P', 'SURABAYA', '2009-06-18', 'Islam', 165, 39, 0, '', '081330661797', 'PUTAT JAYA BARAT 8-B/48', '4', '11', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'CHOIRUL ISBIANTORO, SH', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LILIK NURHAYANI, SE', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (291, 337, '218694', '0084734655', '3578274112080007', '71660/DISP/2010', 'CHIKA AULIA ZHARA', 'P', 'JOMBANG', '2008-12-01', 'Islam', 145, 55, 0, '', '087701683563', 'SIMO GUNUNG BARAT 3-A/22-A', '5', '5', 'Simomulyo', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'DIDIT SETYAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LILIK', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (292, 338, '218698', '0091059623', '3578275403090003', '3578-LT-22122011-0025', 'CINTANAYYA MIKAYLA AL ANNISA', 'P', 'SURABAYA', '2009-03-14', 'Islam', 150, 38, 0, '', '081231818844', 'KUPANG JAYA 2/72-A', '3', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'A. KHALIQ', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'NINIK INDARWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (293, 339, '218699', '0087527188', '3578274809080002', '21477/2008', 'CLARISA SEPTALITHA PUTRI RAMADHINI', 'P', 'SURABAYA', '2008-09-08', 'Islam', 150, 58, 0, '', '0895347302226', 'PUTAT GEDE BARAT 3/32', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUYITNO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI UTAMI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (294, 340, '218729', '0085222791', '3578271011080005', '31073/2010', 'FANDI FERDIANTO', 'L', 'SURABAYA', '2008-11-10', 'Islam', 158, 50, 0, '', '081911080765', 'PUTAT GEDE BARAT 4 C/1', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'PILIANTO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SRI WAHYUNI', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (295, 341, '218751', '0094232339', '3578275401090002', '3850/2009', 'HEYLENA WIDAYANTI', 'P', 'SURABAYA', '2009-01-14', 'Islam', 162, 78, 0, '', '081241843988', 'KUPANG JAYA 2/56', '3', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BAMBANG WIDODO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'WAHYU NURY YUDIYANTI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (296, 342, '218759', '0094710711', '3578217006090002', '28467/2010', 'IVO JOENIAR DESTYN', 'P', 'SURABAYA', '2009-06-30', 'Islam', 148, 50, 0, '', '082132226030', 'PRADAH KALIKENDAL 2/45', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MANSUR', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IKA WIDYAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (297, 343, '218789', '0091974089', '3578273001090001', '12922/2009', 'LINTANG TORIN SYAPUTRA', 'L', 'SURABAYA', '2009-01-30', 'Islam', 142, 36, 0, '', '081232508481', 'PUTAT GEDE BARU 21-A', '3', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'SUHARTONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RINI ASIYAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (298, 344, '218799', '0085654331', '3578274105080004', '3578-LT-22052014-0053', 'MEY ADINDA LUCKYTASARI', 'P', 'SURABAYA', '2008-05-01', 'Islam', 149, 39, 0, '', '082140010224', 'JL. PATTIMURA 12/43', '5', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'VICKY CHRISTIAN PANGESTU', 'SOPIR', 'SMA/SEDERAJAT', '', '', 'SRI WILUJENG', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (299, 345, '218798', '0083146436', '3578275002080002', '12885/2008', 'MEVITA FEBRIANI', 'P', 'SURABAYA', '2008-02-10', 'Islam', 155, 42, 0, '', '083174901744', 'SIMO GUNUNG BARAT TOL 2/56', '6', '8', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'YULIANTO DARMAWAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'ISWAHYUNING ASIH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (300, 346, '218801', '0096787710', '3578272502090001', '28901/2010', 'MOCH. DANIEF HANAFI APRIYANTO', 'L', 'SURABAYA', '2009-02-25', 'Islam', 150, 43, 0, '', '08883620019', 'DK.NGAGLIK PUTAT GEDE', '2', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'JUJUK PRIYANTO', 'SOPIR', 'SMA/SEDERAJAT', '', '', 'DHINI PRIHASTUTI', 'PEMBANTU RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (301, 347, '218804', '0087172393', '3578271207080001', '4955/2008', 'MOHAMAD DWI FAREL SETIYAWAN', 'L', 'BANYUWANGI', '2008-07-12', 'Islam', 146, 47, 0, '', '082131636429', 'PUTAT GEDE BARAT 2/22', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60185', 'SAMIN', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'HOSNIYAH', 'KARYAWAN BUMD', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (302, 348, '218811', '0085093840', '3578270911080001', '15924/2008', 'MUHAMMAD DIMAS MAULANA', 'L', 'SURABAYA', '2008-11-09', 'Islam', 147, 54, 0, '', '085853765325', 'PUTAT GEDE BARU NO. 26', '3', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SUGIARTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUNARAH', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (303, 349, '218824', '0084720631', '3578276505080002', '16834/2008', 'NADHIFA MAYLINDA', 'P', 'SURABAYA', '2008-05-25', 'Islam', 153, 54, 0, '', '089612384464', 'PUTAT GEDE BARAT 2/29', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'KUSNADI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'PURWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (304, 350, '218819', '0086727718', '3578271407080001', '10678/2008', 'MUHAMMAD SUFYAN ARIFIN', 'L', 'SURABAYA', '2008-07-14', 'Islam', 135, 30, 0, '', '0895397037962', 'NGESONG DUKUH KUPANG 2/40-A', '3', '6', 'Dukuh Kupang', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'ANDI WAHYUDI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SRI SUMBAWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (305, 351, '218837', '0088554629', '3578271110080001', '28017/2010', 'OCTAVIAN EDI PRAYOGA', 'L', 'SURABAYA', '2008-10-11', 'Islam', 140, 40, 0, '', '081333767726', 'SONO INDAH 5/22 A', '4', '3', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ABDUL JUNAEDI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'YUNI PURWANTI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (306, 352, '218838', '0086848216', '3578274610080003', '3578-LT-10062014-0050', 'OKTAVIA SUGIANUR', 'P', 'SURABAYA', '2008-10-06', 'Islam', 152, 42, 0, '', '081217012178', 'SIMOMULYO BARU 5-B/22', '12', '4', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'KUSMIARSO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SRI HIDAJATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (307, 353, '218846', '0098367968', '3578271111090001', '241/2010', 'RAFA ADITYA', 'L', 'SURABAYA', '2009-11-11', 'Islam', 150, 30, 0, '', '081259304137', 'PUTATGEDE TIMUR 4/59', '2', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'NURIMAN', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'RINI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (308, 354, '218850', '0099510784', '3578275506090005', '4348/2010', 'RAHMA ALIYAH SHOFWAH', 'P', 'SURABAYA', '2009-06-15', 'Islam', 154, 53, 0, '', '085646104106', 'KUPANG JAYA 1/25', '1', '6', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'CANDRA SETYONO TRIYANTO', 'BELUM/TIDAK BEKERJA', 'SMA/SEDERAJAT', '', '', 'SILVY DWI ANDINI', 'KARYAWAN SWASTA', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (309, 355, '218870', '0086220561', '3578271009080001', '3578-LT-15112011-0303', 'RISWAN FAHRI', 'L', 'SURABAYA', '2008-09-10', 'Islam', 165, 48, 0, '', '081331080939', 'JL. PUTAT GEDE 83', '3', '2', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ARIF MUNAWAR.S', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SRI MARYATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (310, 356, '218882', '0083701704', '3578275208080001', '24831/2011', 'SEYSA VEXIA RENATA', 'P', 'SURABAYA', '2008-08-12', 'Islam', 154, 55, 0, '', '085604101618', 'PUTAT GEDE BARAT 2/16', '2', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AHMAD ABDURRAHMAN', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'ERNA SUSILOWATI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (311, 357, '218900', '0083994997', '3508031908080002', '3578-LT-13032018-0110', 'YUSUF FAHRI', 'L', 'LUMAJANG', '2008-08-19', 'Islam', 138, 30, 0, '', '082140748671', 'PRADAH PERMAI 5 NO 05', '1', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'AHMADI', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'SITI ROHANA', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (312, 358, '218901', '0095059919', '3578275002090002', '2575/2009', 'ZAHRA AFTAVIANI', 'P', 'SURABAYA', '2009-02-10', 'Islam', 152, 36, 0, '', '081231398698', 'SIMOMULYO BARU 07 J/20', '11', '4', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'YOYOK RINI EFENDI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'EKA ULLFA JULIANA', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `students` VALUES (313, 359, '218635', '0091896147', '3578272201090001', '16192/2009', 'ABDHI SAKHI MULIA', 'L', 'SURABAYA', '2009-01-22', 'Islam', 149, 48, 0, '', '085732455884', 'PUTAT GEDE BARU 10', '3', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BUDIONO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'LISMINARTI', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (314, 360, '218636', '3089339974', '3578063110080006', '3526-LT-19092013-0079', 'ABDUL AZIZUR ROHMAN', 'L', 'BANGKALAN', '2008-10-31', 'Islam', 148, 39, 0, '', '083830908365', 'PUTAT JAYA BARU II/9', '7', '11', 'Putat Jaya', 'Kec. Sawahan', 'SURABAYA', '60255', 'MISKI,  ALM', '', 'SD/SEDERAJAT', '', '', 'MARKENNA', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (315, 361, '218639', '0088408599', '3578272004080001', '17339/2009', 'ABHIRAMA IHSAN MULYA', 'L', 'SURABAYA', '2008-04-20', 'Islam', 150, 40, 0, '', '08580645812', 'DUKUH KAWAL KALIKENDAL', '2', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'MULYANTO', 'WIRASWASTA', 'SMP/SEDERAJAT', '', '', 'SURATINAH', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (316, 362, '218650', '0082284175', '3578212712080001', '13144/2009', 'AHMAD AMMAR MAULANA', 'L', 'SURABAYA', '2008-12-27', 'Islam', 157, 42, 0, '', '082234214239', 'PRADAH INDAH 1/33', '7', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SUKIRMAN', 'SOPIR', 'SMA/SEDERAJAT', '', '', 'RATNA PUSPITA DEWI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (317, 363, '218653', '0086321090', '3578276409080004', '17448/2009', 'ALESIA DEVINA YANUARDI', 'P', 'SURABAYA', '2008-09-24', 'Islam', 152, 48, 0, '', '083832696000', 'SIMO HILIR I-A-2/81', '13', '3', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'TOTOK YANUARDI, AMd', '', 'DIPLOMA III (D3)', '', '', 'SHINTA MEGAWATI, SPd', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (318, 364, '218674', '0094560469', '3578212805090002', '29123/2010', 'AR RAFI MAULANA PUTRA NUGRAHA', 'L', 'SURABAYA', '2009-05-28', 'Islam', 156, 36, 0, '', '085732688837', 'JL. PRADAH PERMAI IV NO.25', '3', '4', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'SINUNG NUGRAHA', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'JULIYAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (319, 365, '218654', '0084280280', '3578282812080002', '24706/2010', 'ALFADJRI IQBAL SAPUTRA', 'L', 'SURABAYA', '2008-12-28', 'Islam', 160, 55, 0, '', '083856155883', 'TAMBAK DALAM BARU III/26', '3', '5', 'Asem Rowo', 'Kec. Asem Rowo', 'SURABAYA', '60182', 'DEDY ARUMANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'WITRI YULIANI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (320, 366, '218655', '0082719324', '3578276912080001', '10138/2009', 'ALIFA SALSABILLAH MUKAROMAH', 'P', 'SURABAYA', '2008-12-29', 'Islam', 150, 45, 0, '', '083115851004', 'SUKOMANUNGGAL 6/14', '5', '2', 'Sukomanunggal', 'Kec. Sukomanunggal', 'SURABAYA', '60188', 'TOMI SUSANTO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'IMANUL LAILA', 'GURU', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (321, 367, '218701', '0094485219', '3578275905090002', '18280/2009', 'CORDELIA LAKEISHA AIMEE RAFAN', 'P', 'SURABAYA', '2009-05-19', 'Islam', 156, 55, 0, '', '082131623627', 'SIMO HILIR TIMUR RAYA 0I-K/10', '13', '3', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'ICHWAN NOVENDI', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'RR RENNY DHAMAYANTI,S.S.I', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (322, 368, '218688', '0086026997', '3578276811080002', '11833/2010', 'AZZAHRA KEYLA SALSABILLAH', 'P', 'SURABAYA', '2008-11-28', 'Islam', 160, 48, 0, '', '081252893439', 'SIMO GUNUNG BARAT TOL 2/34', '6', '8', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'ISMAIL IBRAHIM HP', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'YULIANA ELISTYAWATI, SE', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (323, 369, '218702', '0087084067', '3578271609080001', '10653/2010', 'DAFFA PRAMUDITHA ANGGARA', 'L', 'SURABAYA', '2008-09-16', 'Islam', NULL, NULL, 0, '', '085931042561', 'DARMO BARU BARAT 29', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'AGUS WIDODO', '', '', '', '', 'NURUL IDA YATI', '', '', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (324, 370, '218711', '0099906116', '3578276301090003', '3578-LT-05012012-0186', 'DEWI RAHAYU SULISTYO RINI', 'P', 'SURABAYA', '2009-01-23', 'Islam', 147, 35, 0, '', '08998964218', 'PUTAT GEDE BARAT 3/25', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ADI PRAMUKA', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'LILIK YUNI SURYANI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (325, 371, '218714', '0085529797', '3578276011080001', '1396/2009', 'DITA STEVANI PUTRI', 'P', 'SURABAYA', '2008-11-20', 'Islam', 140, 40, 0, '', '085232780782', 'DARMO BARU BARAT N0. 29', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'ABDUL ROKHIM', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'AGUSTINA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (326, 372, '218719', '0093821063', '3578217005090002', '26274/2011', 'DYAH AYU ESTY PURBANINGRUM', 'P', 'SURABAYA', '2009-05-30', 'Islam', 151, 38, 0, '', '085895661014', 'PRADAH KALIKENDAL 2/10', '2', '1', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'WAHYU SUSILO', 'KARYAWAN SWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'DYAH INGTYAS PITOLOKO', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (327, 373, '218748', '0097573227', '3578272704090006', '3578-LT-10042013-0193', 'HANIF AHMAD NURIL ANWAR', 'L', 'SURABAYA', '2009-04-27', 'Islam', 156, 40, 0, '', '088235530947', 'PUTAT GEDE BARAT 3/36', '3', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'YANUAR AKHMAD BASUKI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'SRI HIDAYATIN', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (328, 374, '218749', '0088834303', '3578276208080004', '2811/D/2009', 'HAWA ZEIN AUFA PRASTIYO', 'P', 'NGANJUK', '2008-08-22', 'Islam', 154, 41, 0, '', '089515522358', 'SONOREJO 2/12', '5', '1', 'Sonokwijenan', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'PRASTIJO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'IDA SUSANTI', 'MENGURUS RUMAH TANGGA', 'SMP/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (329, 375, '218765', '0099316711', '3507072310090001', '3507.AL.2009.001629', 'JOKO WICAKSONO SAPUTRO', 'L', 'MALANG', '2009-10-23', 'Islam', 173, 70, 0, '', '081283474880', 'PUTAT GEDE BARAT 1/7', '1', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'GUNAWAN INDRA PRASETYO', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', 'NINIK FIDIA', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (330, 376, '218747', '0098998173', '3578276008090001', '1339/2010', 'GEISCHA CALYA MAHESWARI', 'P', 'SURABAYA', '2009-08-20', 'Islam', 154, 56, 0, '', '082229000732', 'SIMO POMAHAN BARU 16-B/6', '9', '5', 'Simomulyo Baru', 'Kec. Sukomanunggal', 'SURABAYA', '60181', 'DEDIT WASONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'TRI WAHYUNI', 'PERAWAT', 'DIPLOMA III (D3)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (331, 377, '218809', '0085005485', '1809052707080005', '021837/2008', 'MUHAMMAD AKBAR AL BAHRI', 'L', 'SURABAYA', '2008-07-27', 'Islam', 154, 42, 0, '', '081234202023', 'JL. GOLF 3-B NO. 6', '1', '4', 'Gunung Sari', 'Kec. Dukuh Pakis', 'SURABAYA', '60224', 'SYAMSUL BAHRI', 'PEGAWAI NEGERI SIPIL(PNS)', 'STRATA II (S2)', '', '', 'IKA DEWI AYU', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (332, 378, '218812', '0084704017', '3578211906080004', '3578-LT-28022018-0012', 'MUHAMMAD FAREL RIZKY MAULANA', 'L', 'SURABAYA', '2008-03-19', 'Islam', 145, 35, 0, '', '089515910801', 'DUKUH PAKIS 1/71', '1', '6', 'Dukuh Pakis', 'Kec. Dukuh Pakis', 'SURABAYA', '60225', 'AGUS RAHMAD SANTOSO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'MUTAZILAH', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (333, 379, '218820', '0085215951', '3578212210080001', '021395/2008', 'MUHAMMAD WAHYU UTOMO', 'L', 'SIDOARJO', '2008-10-22', 'Islam', 155, 55, 0, '', '081333469670', 'KAWAL KALIKENDAL GG GANYANG 10.A', '1', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'HARI SUGIARTO', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'WULANSARI', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (334, 380, '218822', '0094235368', '3578276005090001', '7233/2009', 'NABILAH DWIPUTRI ANGRAINI', 'P', 'SURABAYA', '2009-05-20', 'Islam', 160, 60, 0, '', '0895340320121', 'PUTAT GEDE INDAH 35-A', '1', '4', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'BAMBANG SISWOYO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SISWATIK', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (335, 381, '218827', '0094827986', '3578275604090006', '814/2011', 'NADYA PUTRI APRILIA', 'P', 'SURABAYA', '2009-04-16', 'Islam', 145, 42, 0, '', '087742132020', 'PUTAT GEDE BARAT 4/12', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MUHAMMAD SODIK', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'SITI MARDIYAH', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (336, 382, '218830', '0099456187', '3578316203090001', '12326/2009', 'NAYLAH ZAHRATUL AULIA', 'P', 'SURABAYA', '2009-03-22', 'Islam', 150, 30, 0, '', '085730592743', 'LONTAR 147 SURABAYA', '1', '2', 'Lontar', 'Kec. Sambikerep', 'SURABAYA', '60216', 'SYAIFUL ANAM SE', 'WIRASWASTA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', 'MUTHOHAROTUN NISYA S.S', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (337, 383, '218832', '0082905926', '3578272510080003', '8032/2009', 'NICOLAS OKTA ABDUL GANI', 'L', 'SURABAYA', '2008-10-25', 'Islam', 149, 35, 0, '', '081270737603', 'PUTAT GEDE BARAT 5/5', '5', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'MAKHIRIN', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'NUR KHUYUM', 'MENGURUS RUMAH TANGGA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (338, 384, '218841', '0081066180', '3578271909080001', '13973/2008', 'PRAMANA PUTRA', 'L', 'SURABAYA', '2008-09-19', 'Islam', 155, 34, 0, '', '081222214209', 'PUTAT GEDE BARAT 5/7', '5', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60189', 'SAMPIR PRAWONO', 'KARYAWAN SWASTA', 'SMA/SEDERAJAT', '', '', 'SUGIH ARTI PUJI LESTARI', 'WIRASWASTA', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (339, 385, '218871', '0092696109', '3578277007090002', '3523-LT-26102011-0081', 'RIZKI AMELIA', 'P', 'TUBAN', '2009-07-30', 'Islam', 155, 45, 0, '', '083831519598', 'JL.PUTAT GEDE BARAT 3/7', '4', '1', 'Putat Gede', 'Kec. Sukomanunggal', 'SURABAYA', '60188', 'IRA YUNAWAR', 'KARYAWAN SWASTA', 'SMP/SEDERAJAT', '', '', 'TUMINAH', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (340, 386, '218875', '0088745655', '3578275408080001', '15970/JU/KL/2008', 'SALMA SALSABILA', 'P', 'JAKARTA', '2008-08-14', 'Islam', 150, 36, 0, '', '081315433893', 'DARMO PERMAI UTARA 2/11', '2', '1', 'Tanjungsari', 'Kec. Sukomanunggal', 'SURABAYA', '60187', 'SIGIT SANTOSO', 'PEGAWAI NEGERI SIPIL(PNS)', 'DIPLOMA III (D3)', '', '', 'LISTIYANTI DAMARWATI, SE', 'MENGURUS RUMAH TANGGA', 'DIPLOMA IV (D4)/STRATA I (S1)', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (341, 387, '218878', '3087847528', '3578316005080001', '3578-LT-03042018-0032', 'SALWA KEIN SATRYA', 'P', 'KARANGANYAR', '2008-05-20', 'Islam', 160, 65, 0, '', '081231616141', 'DK. BULU NO. 9', '4', '4', 'Lontar', 'Kec. Sambikerep', 'SURABAYA', '60216', 'ALUWI', 'KARYAWAN SWASTA', 'SD/SEDERAJAT', '', '', 'SITI MOCHA', '', 'SMA/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `students` VALUES (342, 388, '218886', '0092665943', '3527074404090002', '49155/DIS/2011', 'SINTA BELA', 'P', 'SAMPANG', '2009-04-04', 'Islam', 130, 25, 0, '', '085649298355', 'DUKUH KALIKENDAL ', '3', '2', 'Pradah Kalikendal', 'Kec. Dukuh Pakis', 'SURABAYA', '60226', 'ALWI', 'WIRASWASTA', 'SD/SEDERAJAT', '', '', 'HOZAIMAH', 'MENGURUS RUMAH TANGGA', 'SD/SEDERAJAT', '', '', '', '2021-06-01', NULL, NULL, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gender` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `place_birth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `day_birth` date NULL DEFAULT NULL,
  `religion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `employee_group` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_education` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `entry_year` date NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 15, '197105242006041000', '3578222405710000', 'HERNAWAN BUDWI SETIONO', 'L', '', NULL, '', '', '', 'Kepala Sekolah', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (2, 16, '196611071991032000', '3578274711660000', 'PURWANDARI DYAH P. N.', 'P', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (3, 17, '196505241990032000', '3578136405650000', 'SUKINAH', 'P', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (4, 18, '196504121990031000', '3578271204650000', 'SOMOJO HERSADHONO', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (5, 19, '197205222014122000', '3578036205720000', 'AINUL MARDIANA', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (6, 20, '197009221995122000', '3515146209700000', 'WINARNI', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (7, 21, '196303222008011000', '3578272203630000', 'ARIS SUPANDRI', 'L', '', NULL, '', '', '', 'Kepala Perpustakaan', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (8, 22, '196705061995122000', '3578064605670000', 'SRI HARINI', 'P', '', NULL, '', '', '', 'Kepala Laboratorium', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (9, 23, '198802152019022000', '3522155502880000', 'RIZQA ITSNI NUR FADILAH', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (10, 24, '198911252019022000', '3516106511890000', 'EKA LIDIA USTANTI', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (11, 25, '196509141998022000', '3578275309650000', 'ETI FAJARWATI', 'P', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (12, 26, '196403141991032000', '3578145403640000', 'MARTIANA', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (13, 27, '196205051989031000', '3578040505620000', 'MINO', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (14, 28, '196704151995022000', '3578185504670010', 'SOEDARWATI', 'P', '', NULL, '', '', '', '', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (15, 29, '196309291988032000', '3578186909630000', 'SULISTYOWATI INDRIANI', 'P', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (16, 30, '199101032019021000', '3316040301910000', 'TEGUH PRASETYO', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (17, 31, '196803122008011000', '3578211203680000', 'WINARTO', 'L', '', NULL, '', '', '', 'Guru PNS Pemda', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (18, 32, '196710121988032000', '3578045210670000', 'WIWIK NURHIDAYATI', 'P', '', NULL, '', '', '', '', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (19, 33, '197209032008012000', '3515114309720000', 'HERLINAWATI BORU PANJAITAN', 'P', '', NULL, '', '', '', 'Guru BK', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (20, 34, '196902182007012000', '3578065802690000', 'SANTI RISMAWATI', 'P', '', NULL, '', '', '', 'Guru BK', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (21, 35, '196205221988032000', '3578016205620000', 'TITIK UTAMI', 'P', '', NULL, '', '', '', 'Guru BK', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (22, 36, '', '3517091306820000', 'HERU SETIAWAN', 'L', '', NULL, '', '', '', 'Guru Tidak Tetap', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (23, 37, '', '3578310307900000', 'HASANUL MUCHLISIN', 'L', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (24, 38, '', '3578066603710000', 'NANI HARJANI', 'P', '', NULL, '', '', '', 'Guru Bantu (Jam Tambahan)', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (25, 39, '', '3578246409970000', 'DEVI NURLIASARI', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (26, 40, '', '3578274408950000', 'ELVIA NUGRAINI MARASTU PUTRI', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (27, 41, '', '3578306807940000', 'ISMIYATUL LAILI', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (28, 42, '', '3578204808950000', 'NARITA SURYA INES MAHARDIKA', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `teachers` VALUES (29, 43, '', '3578036401980000', 'PUTRI SUCI CHOIRUNNISAKH', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);
INSERT INTO `teachers` VALUES (30, 44, '', '3510060106950000', 'WAHYU DWI SETIAWAN', 'L', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);
INSERT INTO `teachers` VALUES (31, 45, '', '3578214907940000', 'YULIANA DWI SURYA ATMAJA', 'P', '', NULL, '', '', '', 'Guru Non PNS', '', '', '', NULL, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nisn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_type` enum('administrator','teacher','student') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'also', NULL, NULL, '$2b$10$ujBjKku3Qgu9f8jt/OIbD.MOp4PZmM2ni7WBakdFfSi7xGdwFGJ1G', 'Also codes', 'alsocodes@gmail.com', 'administrator', 1, '2022-01-12 19:23:46', '2022-01-12 19:23:46', NULL);
INSERT INTO `users` VALUES (15, NULL, NULL, '197105242006041000', '$2b$10$cNzNZ/fciQf.stAzAi4ejOj0u7jm3L99y0morhjGBv6bF4hxXRFTG', 'HERNAWAN BUDWI SETIONO', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (16, NULL, NULL, '196611071991032000', '$2b$10$i02KpjMxAPSU5IgJj9cjQuuMCZp.m8bWhx2KiqwoCr4662zQlB9sS', 'PURWANDARI DYAH P. N.', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (17, NULL, NULL, '196505241990032000', '$2b$10$mfzx3ma2tHIBPtpqClo3yOFyXCut8ZFiagyUTC4IuxvgVEbwLCVyC', 'SUKINAH', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (18, NULL, NULL, '196504121990031000', '$2b$10$PZpYgkcSxqg850O3CMhcoOjQ.wasb7vP4.cQYU516rzKtqZnhBV8O', 'SOMOJO HERSADHONO', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (19, NULL, NULL, '197205222014122000', '$2b$10$fO6gBv1Csqo4sJyYkPj6BeHRxUgG.eoZ95TvFWd3Wjx2XJzuNjEXq', 'AINUL MARDIANA', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (20, NULL, NULL, '197009221995122000', '$2b$10$L0tsEU4WsWQ3fSGnhkcE6uB1Jrgs2cjfo3fPJNQzOc44I8HeEi55m', 'WINARNI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (21, NULL, NULL, '196303222008011000', '$2b$10$TGqNQb0xY35AjEyYpBaD5OdNACsK0gDLNjX2ukKwXSjgqgKRO8T1e', 'ARIS SUPANDRI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (22, NULL, NULL, '196705061995122000', '$2b$10$e7Sr8ZrkaLkSTpBGRXgw6.Qe7q3.W6aNihLpJ/d9/0zmoca7cNp8.', 'SRI HARINI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (23, NULL, NULL, '198802152019022000', '$2b$10$7Uxoz1iefCAN.EcuPuTtl.R1o2Jx41sqywrjE0EAXq5IQHRBguKOu', 'RIZQA ITSNI NUR FADILAH', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (24, NULL, NULL, '198911252019022000', '$2b$10$7gpO2jYb2Mp.zZdJj2WSwueSZ5.rU9XjWncvdmju37jWs3VarunL2', 'EKA LIDIA USTANTI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (25, NULL, NULL, '196509141998022000', '$2b$10$eiCzp3dGPi4uDHJ13w7EF.orPjYO0NNCFhjW4ysqzBeak8oVhCMZ6', 'ETI FAJARWATI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (26, NULL, NULL, '196403141991032000', '$2b$10$got.v8BXWqKX9UJBOaQ4M.Jd6R/FjAzXpU8ZhSlS0uLy29iPOQGz6', 'MARTIANA', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (27, NULL, NULL, '196205051989031000', '$2b$10$GgPUOqcl1kaC9dbj7xJRUevtEt5eFrDXvkjgdp6aaNHM.IbxZcmpW', 'MINO', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (28, NULL, NULL, '196704151995022000', '$2b$10$Trv/5RYFtq2Osn.3.FQTJOhyr5AlskQkXpKwhoJCzOiqUqkfLpWLi', 'SOEDARWATI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (29, NULL, NULL, '196309291988032000', '$2b$10$qZ.Z4oYoJY0ynVsMMabDheXGREViRmAtCtnYess8.k8h8cmIJ940a', 'SULISTYOWATI INDRIANI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (30, NULL, NULL, '199101032019021000', '$2b$10$MIfEmuf8a1dMUtC8MSgqq.FLQKomkT8e16ywkE47eCBM5QOtA5Pue', 'TEGUH PRASETYO', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (31, NULL, NULL, '196803122008011000', '$2b$10$6JhoCB7VhP3CC0p8MAqRuusP8birGe0MjJdx6SEYe0w9i4VnnPJqO', 'WINARTO', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (32, NULL, NULL, '196710121988032000', '$2b$10$4D1qVxOQVuy4l8LiNb7yzeRqmfyT44VYOB70oKvMCseVjkBRYfZgW', 'WIWIK NURHIDAYATI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (33, NULL, NULL, '197209032008012000', '$2b$10$cGCT8m0UOROXEyLWAPXhfeJdbjBb48fzOT6dklaVLCsdTVtbzH30O', 'HERLINAWATI BORU PANJAITAN', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (34, NULL, NULL, '196902182007012000', '$2b$10$ZR5Ljds6AygB9uJshstP6.EJNNS2XDcjs0yKi.HC2bPaKvmeVCXza', 'SANTI RISMAWATI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (35, NULL, NULL, '196205221988032000', '$2b$10$SXOZkS.WQK13O6fnyemOX.1BDbVRvwMSGbbLx9JkhI74G59xphxwe', 'TITIK UTAMI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (36, NULL, NULL, '3517091306820000', '$2b$10$s1CHbyP6mvuafM3XLvB.yeCYfoxEp0cJZTJRwd2As3wvPmH6Aur3S', 'HERU SETIAWAN', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (37, NULL, NULL, '3578310307900000', '$2b$10$pTVigq1ueks/JGixvHMVZ.71GDn5ojJsmGUVWW1BIoyP/V9ZJEMWi', 'HASANUL MUCHLISIN', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (38, NULL, NULL, '3578066603710000', '$2b$10$MyGT1OXJhYAC1IVau.XsbuIvpP1C7rL82BFLD6UMCQwAQpdP4CtCi', 'NANI HARJANI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (39, NULL, NULL, '3578246409970000', '$2b$10$hbO/YPz4xsx2fRPzcSWekeMILFuvtYqkt.Ab75LD1TzZgTsDgJh1q', 'DEVI NURLIASARI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (40, NULL, NULL, '3578274408950000', '$2b$10$l.wW824ehGic9Ez6FUiiMuSFvoZCdZPb3WjPIrhc.DBoaabvupLaa', 'ELVIA NUGRAINI MARASTU PUTRI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (41, NULL, NULL, '3578306807940000', '$2b$10$wDBr/4BO3W7JakyyQJyE9eW6tqUPSxy/PZt31XnIu6ZVIHZM5gLIy', 'ISMIYATUL LAILI', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (42, NULL, NULL, '3578204808950000', '$2b$10$Nw8I7O9ze9KOZPYnWCzzOu8KATWqZtqABMWoSDD7cCPTckRZJlfiO', 'NARITA SURYA INES MAHARDIKA', '', 'teacher', 3, '2022-01-12 20:10:45', '2022-01-12 20:10:45', NULL);
INSERT INTO `users` VALUES (43, NULL, NULL, '3578036401980000', '$2b$10$DO7U2VaH8kX5/6oLbQskhumLRgSBT19Owzq31dSJMEo63NWWV/aKi', 'PUTRI SUCI CHOIRUNNISAKH', '', 'teacher', 3, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);
INSERT INTO `users` VALUES (44, NULL, NULL, '3510060106950000', '$2b$10$JGriZRIJTgMtNi42smzCVO8SNLJHaO0ruatfkywgUc8h.h7TMvd2y', 'WAHYU DWI SETIAWAN', '', 'teacher', 3, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);
INSERT INTO `users` VALUES (45, NULL, NULL, '3578214907940000', '$2b$10$fSTHVJ61kTFc1.q0tJ0xV.fu55FU.gr5rjP/sKwLGX1qXARC8mFV.', 'YULIANA DWI SURYA ATMAJA', '', 'teacher', 3, '2022-01-12 20:10:46', '2022-01-12 20:10:46', NULL);
INSERT INTO `users` VALUES (46, NULL, '0064545784', NULL, '$2b$10$Mez6pzoywETD8XiXksBkCeuMcYuQ6ZBRstDzWLmMgrm0IMxhk6RAS', 'ACHMAD RAFLI MAULANA', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (47, NULL, '0078604383', NULL, '$2b$10$s6o87EZjoo..i72CkOo4HO2wmvj8PY.y1RcZqSbQPhUmD8MAnIp/.', 'AGNESIA MERYNATALIVIA', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (48, NULL, '0062663957', NULL, '$2b$10$3NwOfLgD4bINUpFwpSq2fO08chTHJ6wyIKVemNx.mKuLZpI5gjiE2', 'ANGELINA AGNES SOEGIARTO INKIRIWANG', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (49, NULL, '0068061182', NULL, '$2b$10$agcK9jj1HB0kMx.z1Z0Nq.LFMbRmNIUEM9PFEADLBLOsoaF9ez8jS', 'ABIYAN NAUFAL ADITYA', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (50, NULL, '0084013021', NULL, '$2b$10$P0wNKCtilojPOEJJNXXyEOxrW5l1hStMziL5yDcC0VzpBPmsXDl3m', 'ANINDYA RAHMA NOVIANANDA', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (51, NULL, '0065098688', NULL, '$2b$10$ltp5LhvLDJzsjtUfDZdwf.pMCTHp67iWNpUdWgTGiYP6MSCEcADHG', 'ANGGUN ADELIA FRISCA HARYANTO', '', 'student', 2, '2022-01-12 20:13:26', '2022-01-12 20:13:26', NULL);
INSERT INTO `users` VALUES (52, NULL, '0063627181', NULL, '$2b$10$xFKkGhLntPpYji7HGvO1reyVlzVTltHz9sPaIQqZwkHS166pFgJNO', 'BAGUS PRIAMBODHO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (53, NULL, '0074729658', NULL, '$2b$10$l54poU/kbEOs3WFbgPX79uCGXbaa/ZaEqe4ILMutRYSIt6gHkpR36', 'CHRISTINE ANGELICA SANTOSO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (54, NULL, '0055807766', NULL, '$2b$10$GqZdLz5RWxf86bLDiZMDZ.5.MpYfijPYxByXt/euRaP6NBS4.nRQ.', 'FAHMI WAHYU DEVAN', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (55, NULL, '0075795720', NULL, '$2b$10$TzLu0nLSpVdxAqn5GBDp8OyTCfmrhad0vRbeTsoSyBwpe4r3QD3e.', 'ESTHER GRACE MAYLANIA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (56, NULL, '0078149784', NULL, '$2b$10$j/xM/YYMSJPfu6d8lS49TOzxFgnaV6iNg0jr2tMDpdX9KVkLYnAni', 'FRANS YEHEZKIEL HARIYANTO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (57, NULL, '0079286151', NULL, '$2b$10$sp9ZZKpENgu5GK6ei39hP.pXGQszp9GahNwzhXLV.WJALnvqQw2/a', 'HALIMATUS SA\'DIAH', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (58, NULL, '0075153857', NULL, '$2b$10$m5SRnb8tqeU4xmBWXKc4d.aKO3jg8fyZwYNdM8EpRwCog1SA9wHnW', 'GIBRAN ANAK LANANG', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (59, NULL, '0069830682', NULL, '$2b$10$pVE8ewwqhBmNxqdj2d/IVexe6ubrmhjon.NB4Zh.1S6pCJa7yzgKi', 'DHEA AGUSTIN', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (60, NULL, '0065708442', NULL, '$2b$10$QkIGYET7nMEZyiV.//kqo.EmUo2FaOCm3EL38AkwhGdx5sIMV.8gG', 'I KETUT AGUS PRAWIRA DIHARJA JOHNSEN', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (61, NULL, '0067300251', NULL, '$2b$10$TMBhXfoRWadVLPyLlNVsY.rAswK49jAdoMcRPWHdW3PHw7Eil29ci', 'ISABEL NATHANIA HERWINDO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (62, NULL, '0074348915', NULL, '$2b$10$aVt2sjyu74IHqpZnw0wmN.odB0NbOMmNln/4PX7Rx8.1.3euZ5Iay', 'JESSA PUTRI ERVIANA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (63, NULL, '0065076674', NULL, '$2b$10$tQaRoY92s0DrcJklhQQb5ue5SBdLlsI4aVFJLq8b.iv2liq9qQNvS', 'JASON MARLON ASSA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (64, NULL, '0066756588', NULL, '$2b$10$ye4VbmWk5YVU7Dco.58rGuxdDrJYgRn4AD10wwVHGaqkufzDmSo0S', 'JESSICA MEILANNY PURNOMO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (65, NULL, '0072726444', NULL, '$2b$10$ZYLrl53hkHk5A0jS/rx63OnmDJGuFW4Cy3i/L7fY/rrRL0tEl1eFK', 'JONATAN PUTRA RAHARDJO', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (66, NULL, '0053569078', NULL, '$2b$10$AikW5XNEFrjD6t2X6pjdVu24GRTcuxC17vyMgaHisH98GknlcuU76', 'JONATHAN VIERI', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (67, NULL, '0062886458', NULL, '$2b$10$CHK2IAFiwfBM47NY9KT.ZeKGvix9XWzqGjEl.2j4gvDgkAaUCHOkW', 'JOSHUA NIXON', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (68, NULL, '0077350874', NULL, '$2b$10$kj9SdXKihNmpWludKBtEf.HDXKLsPvZsdZg/4aYD1zTs3ZIxcPXZy', 'LATIFAH NURJANAH', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (69, NULL, '0078512436', NULL, '$2b$10$4zPavtnfeH.tqv5zpNYOz.Q3vVKHVD1XINNR7ghVbjPd4pw7.CDUm', 'LINA KHAIRUN NISA\'', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (70, NULL, '0068236691', NULL, '$2b$10$Mt7lpE1TZJlHhgP6St0gFuG8o9W3zztP1XJIViHu2vcYCLOgWMcoG', 'MADE YOGISWARA SURYA PUTRA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (71, NULL, '0061762572', NULL, '$2b$10$71HLJU5gLwvB1PG/9LvSdu1EJHj8CKIHa6cwBhXbzkvODW/e/uXu.', 'MOCH. FACHRY EKA PUTRA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (72, NULL, '0069426200', NULL, '$2b$10$IZz7rNOAP6neg/kw5AOYIOxbZp3M2b2F7JVdoLJAZcnYW1vZRU6fy', 'MOH ANDHIKA FIRMAN PRATAMA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (73, NULL, '0062507707', NULL, '$2b$10$G8QUi56KYG01XXBQKuTob..3Bbz75alaCXa.LJRfENhrQkC9R.00G', 'NAUFAL HAFIZH SAIFUDDIN', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (74, NULL, '0068611891', NULL, '$2b$10$cXNZM47N1qUPEDhqmLRxFOvj1nRW8NqqEoIsUKgkMosl2LWYGh9WG', 'PUTU DEWI NILAM SARI', '0', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (75, NULL, '0079230873', NULL, '$2b$10$BTIvC2bR8vSifAsKKo3eI.STzTKYCumR0jApItEZ.DkqDm/TWuCIO', 'RANDHY DIMAS DWI APRITARTO PUTRA', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (76, NULL, '0069082782', NULL, '$2b$10$2M9U6OTOXQYPi.WB5U6hheqwBqURB01r9JfHr7TNBETm3TKw09wcm', 'ROSI AGUSTINI LEDE', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (77, NULL, '0073872688', NULL, '$2b$10$7n0OhOBUYOiP3c9zJm/X5uP/gJ1L16iRJZZbZgeWMnmoT9xzNcs7K', 'RADITHYA CHRISTIAN BATE', '', 'student', 2, '2022-01-12 20:13:27', '2022-01-12 20:13:27', NULL);
INSERT INTO `users` VALUES (78, NULL, '0067093763', NULL, '$2b$10$uBIjla2Kz7wNc31DUhr7FOjVOftEc.t/ckujh34lc1PBVIGdfvr4.', 'RHEYZITA PUTRI HAWA', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (79, NULL, '0056033999', NULL, '$2b$10$AdzhHCTrP7grJxUkSBx/2uEjHuT1q1MIk8IylIw4sukZUyRqrlyz2', 'SALSABILLAH SEPTIAN INDAH RACHMAWATI', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (80, NULL, '0066276037', NULL, '$2b$10$XX5IzLEMLDIpuQgBE7hLp.ya70al.IW797fZKuTQ9Q.fpFJ7a2YYK', 'SALWA AZZAHRO K.', '0', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (81, NULL, '0066933719', NULL, '$2b$10$PZwYmSh8SukHRuFdSh8MJuOASMSMQXWJweliK1nQQDIsLO.L6J1Aa', 'SENNIA META SAHARA', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (82, NULL, '0069606599', NULL, '$2b$10$3NfbhKWDbJ6VJ3Y1wZC0Ru9gz4xAx3vTJOGdVQ2bY/2vdYIcxlcC2', 'SHOKHIFUL ARIF', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (83, NULL, '0073298372', NULL, '$2b$10$ARe0BftsK7ZRBsg0rxzeMuYvOkE0cjU5yLwX4JkFEDs4Y1Tt2.TEa', 'SHEREN JESSICA BANON', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (84, NULL, '0073270436', NULL, '$2b$10$WemsCR2w.z.7ZXetIBaiHeJB4oyD.Sd8UhBVRyL5g3kAVSyzb6zxi', 'SILVERADO OMEGA FIBIANA', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (85, NULL, '0065838374', NULL, '$2b$10$w1WU/RADfCeARke4OBKh4OQaHHGrc7sb6e.7NZJCKWNgcTfAy1Rq2', 'SYEFIANA DEVA ADYA WARISTA', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (86, NULL, '0078317866', NULL, '$2b$10$zrH5PWYwsiUAKlBtMpbbCewVfF3GAh8iB3CjqmD4ZacvgnL0t/Rmq', 'TIARA AULIA AJENG AYU PRATIWI', '', 'student', 2, '2022-01-12 20:13:28', '2022-01-12 20:13:28', NULL);
INSERT INTO `users` VALUES (120, NULL, '218644', NULL, '$2b$10$kyWCjHdPGgL0uUAUVQF.YeWJzvOo0JbDLh8kygv2tV2vBXjx.DQOm', 'ADIT PRAMUDYA AKBAR', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (121, NULL, '218661', NULL, '$2b$10$3JBDB3yVoIhCACt8elEs8O4MI45Ch0sxLrMi/92HLuxDINzO9yvoy', 'AMANDA WIDYA SETIA PUTRI', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (122, NULL, '218648', NULL, '$2b$10$lyTVDamvPLR5GKA0ZlJJEejdSr41DZID5.azKkhquWdo8BkeG1gXG', 'AGUNG ISA PRADANA', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (123, NULL, '218693', NULL, '$2b$10$mIqz8PqPW59USmuknkv3SuIpcqldzD4mrb8ehnm9DWoVt8jVxOMjy', 'CANTHIKA PUTRI NUR SALSABILLA', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (124, NULL, '218684', NULL, '$2b$10$Q.ljgLjrH/paLRboedBkTOkxA/mZ59PhGjkCattrOwr9ziRrGEPxa', 'AVRIL RESTI FELISA', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (125, NULL, '218696', NULL, '$2b$10$dqCR1rG0o23MsougIWmTsu.jyYYcuSViigdmzuggVikORFY/nNWoi', 'CIECILIA ANGGUN ZAZKIA', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (126, NULL, '218670', NULL, '$2b$10$i.1dqLd3LhDhNaycik6/5uFVnoe5EDXM30XT1FMOiQdzuKvgFr8YS', 'ANNATASYA ALTHAFUNNISA', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (127, NULL, '218720', NULL, '$2b$10$YI5Rj.9O0wCwOgdb8TkbR.3PetUW1UEuP9QconILKBRarelfHF.La', 'EDGAR EFRATA ABADI', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (128, NULL, '218738', NULL, '$2b$10$9wPnzM3QezZIh0V7OuwW3O5GwIK4V5FrZA6CSzV0H.Vwyrc8UHqJu', 'FERDINAN TITO HARDIANTO', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (129, NULL, '218773', NULL, '$2b$10$4JoKcYo/VOkmzMDy5pr91uZfB2w8Jc4ePt5HBtUPdYLLoyA.A6lny', 'KEVIN FEBRIAN SIMANJUNTAK', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (130, NULL, '218739', NULL, '$2b$10$aAO711qkW.NYoYqu3ClBLubPAXsJ39gnZINbY55rzFuFjCFbviGAS', 'FERNANDO AURELIO SAHUSILAWANE', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (131, NULL, '218766', NULL, '$2b$10$tVKFFlnsOKDbtt1m0OFDQeiz8m8CpCcPUfVEljInQA.LyDwQ9jz52', 'JUDITH AZARYA RAHARDJO', '', 'student', 2, '2022-01-14 06:09:20', '2022-01-14 06:09:20', NULL);
INSERT INTO `users` VALUES (132, NULL, '218772', NULL, '$2b$10$IZxjdqEHuyMs6WU4eN4f9ujrXcf7hbovbE3bNaeXtF2bkPNip7JdK', 'KEVIN CHRISTIAN FERNANDO UTOMO', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (133, NULL, '218775', NULL, '$2b$10$9qyu1tYBGIW0g6NLV1erU.IJ2jTFRe/9r6NcMG0cwA.BxaH5taFdy', 'KEYLA PUGANDA RISMA CITRA SAFITRI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (134, NULL, '218833', NULL, '$2b$10$wIQ8LtROuCKVfj/5NzrxceXy3zE.WU05MmNyqM22Dk1GdunAqn3Sm', 'NOVELYN NANDA ARIE GUNAWAN', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (135, NULL, '218791', NULL, '$2b$10$FcfkTu7PbC1Lx5O.Uq0Pm.K/CggY0VDafE8U2QJWF/N7lexSJWoUe', 'LUYA ADITYA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (136, NULL, '218839', NULL, '$2b$10$gFalpp9DXceZoChvHtPW4.rIR4SbUhJtpZvH1FI2LEfDfCCZOYr1K', 'OLIVIA CARISSA PUTRI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (137, NULL, '218852', NULL, '$2b$10$4lFIUAE5KOnd4bNGOkgrieLYCUPG0jgwYyRghJpWTRtkC8lBd0Oai', 'RAKA BRAHMANA BAGUS SUKMANA PUTRA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (138, NULL, '218859', NULL, '$2b$10$Hr4U5a.6jAHfleaU329qDuhJIOdI6xXoIi7l5Ila63CvbpkEZ.R0.', 'REGI SEFINA PUTRI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (139, NULL, '218862', NULL, '$2b$10$tDiozRShIL0iSuSEH4wLxuBx5zdbZFINzBcNqpBqukyKNVYsc8vg6', 'REVELINO JEVON PURWADIATA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (140, NULL, '218880', NULL, '$2b$10$WPzLRIWpzHyqMDQSenhQIuVfMwWyFzD.vDgCcp.cmMriN.jFhl1em', 'SATRIA DHARMA PUTRA JAYA SUTRISNA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (141, NULL, '218869', NULL, '$2b$10$LT3wqR3oeIpNEN4NNigMie7SQBkQfZINgo9i/ojolxg1CT/JN0Dum', 'RISMA APRILIANTY', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (142, NULL, '218887', NULL, '$2b$10$76lRm6mNzFpftKiHBlBuv.D8NnE/K4Q0cvdTdTvdiunznp1Q9BIrW', 'SUSANA MARIANE HERI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (143, NULL, '218889', NULL, '$2b$10$IMSWqkpByH31e2N6K84gwul8EMFbdyXcCrhannTgIUbtfQ.kaLzjW', 'SYALLOM FIRDAUS PUTRA KRISTIANTO', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (144, NULL, '218893', NULL, '$2b$10$sQItsKjlLEJuXfKxM3d7luNHPvnjkLSmzByg8TgQwk7eP62iJYrSq', 'TEOFILUS ANDREW SAMBIRA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (145, NULL, '218890', NULL, '$2b$10$0MpEk4.t5RtPh1TVhqr2fOdd1PfZbhIFnBW3dTfn7f9rBuIvASR4W', 'SYIFANA LATISA HARIYANTO', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (146, NULL, '218895', NULL, '$2b$10$9wo5oCIDWPx7BrRX.0gTs.U9/6eja6QVGoskrquzcSQQeb7GvICBG', 'TIRTA PRAMUDITA SUBIYANTO', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (147, NULL, '218896', NULL, '$2b$10$j/eZITcd4fPdvLbPDmIYOeeW499YxLTxsJLCQ.EugA3GiYkXOsvH6', 'UNZILA RIZKIKA RAMADANI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (148, NULL, '218902', NULL, '$2b$10$3EWOo1HwbS6nDBX34FbLE.aqkkXcaWE6mAb0nHfeLl70wv6/bSro.', 'ZIDAN ARRAFI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (149, NULL, '218640', NULL, '$2b$10$Tlq4rtmPE1PuK/i2EhInp.14BJHJe4BLQgUT3PCSGj4Z6cMKd6AMa', 'ABHISTA NARESWARI SUGIYANTO', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (150, NULL, '218662', NULL, '$2b$10$zZ42oK0p6UjndbkETZHQluFvGZwhDqp3psaI3VGUJdJ0WXEAipYsW', 'AMELIA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (151, NULL, '218707', NULL, '$2b$10$O.zLoshochjx2HIv3Ha...lSYdSCp.LYwTYnGRpBjPOJyQkpAbRxO', 'DAYANA ANASTASIA PRATISTA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (152, NULL, '218679', NULL, '$2b$10$yW4womsUOQPVbMITlHUcTevL7Flpzb7yS03Y2KlofX2c9rHziiVaK', 'ATHAYA NAURA AZELEA PRIBADI', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (153, NULL, '218706', NULL, '$2b$10$Jw9U2ksCiTyYf3dTnBOJEuvRr699cKdROGZVKyN8/wQEH4lMZwBW.', 'DAVANIA PUTRI EKA PRATAMA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (154, NULL, '218716', NULL, '$2b$10$5JMGkCeumsV3IqcXQuT6cOYSoEj0LZh/haMF6ItNkdEt9VubkA3te', 'DIYAS ROMI MAULANA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (155, NULL, '218757', NULL, '$2b$10$dNgCzKtCZQm.ik90QOGAfuWzKpjC0TQkEXw2aCwZIylTOLyrcpTEi', 'INTAN DWI AGUSTIN', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (156, NULL, '218774', NULL, '$2b$10$W4d/I8DZU/ulWATTw9i22uGaH1RJ4mRJhD7IUf8f4Ph2AN63sh5yC', 'KEYLA DWI APRILIA', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (157, NULL, '218763', NULL, '$2b$10$SZrfZ4xnJEHYYCMg65xMCekxIzvdsg.IT.QO2D/gz4aAF1PoAUW3C', 'JESIKA AGUSTIN', '', 'student', 2, '2022-01-14 06:09:21', '2022-01-14 06:09:21', NULL);
INSERT INTO `users` VALUES (158, NULL, '218767', NULL, '$2b$10$uznlCcZ8zw7lMv.XbPWSOOcLUgySvELxKEzJ93DJb4qlcCtfYMjoO', 'KASIH AZIZATUN AKHIROH', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (159, NULL, '218784', NULL, '$2b$10$6HK5utEXTzzZQmZjiC6.I.AfJsR8ZLpzwkjNs48MW/B7AotqSS0Sy', 'KIRANNI NOVELLIA BAHARIZKY', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (160, NULL, '218793', NULL, '$2b$10$2iJFGGP.L9tz6vhUSRiyDeJ3lIBrqxOfECycCsIHEFhyGwE9g/Fs6', 'M. HAFIZ ZAIN AL FARUQ', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (161, NULL, '218768', NULL, '$2b$10$er1doWZ0YLJDqsllfXvVn.FP9/kqF8eXcc4JReM/NW7SMZ2EiQIqC', 'KAYLA SALSABBILAH', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (162, NULL, '218806', NULL, '$2b$10$bhQjAKaFcq6O/.cwvNioxeKnqjgzf2WQbQp/AOPtLRi.n2twgpuVy', 'MUHAMAD AMRIZAL WAHYU KRISNADI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (163, NULL, '218810', NULL, '$2b$10$bLVm61F73DXAxte.vMWzVOLuJY/kT04yDSKHbBhv4initen2yNpwe', 'MUHAMMAD AZRIL RAMADHAN', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (164, NULL, '218813', NULL, '$2b$10$5uYzobR5tMGEmQISGomlduiXYzdDC/eAhkBK86IyQihlEWGYkDEH6', 'MUHAMMAD IQBAL PURWANTO', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (165, NULL, '218814', NULL, '$2b$10$UEV8RrgOQt70qptejx6/Luzt7q0bR2Bj0ap0Dc1BK4P9uVAiB.wOS', 'MUHAMMAD KHOIRUL RIZAL', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (166, NULL, '218834', NULL, '$2b$10$a7qfle6g3M4NYUmZDhhTYuHf8V4Q8yhc31CNcM8FlZmD7MVpKBS8q', 'NOVITA DWI PUTRI ANGRAINI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (167, NULL, '218844', NULL, '$2b$10$Ty6FBaY1wSmqyoBxA33xoeuxvuCN.OgqmYi6rvZekC6xukVqF9rOa', 'RADITYA PUTRA FIRMANSYA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (168, NULL, '218857', NULL, '$2b$10$S6tDBc1HCZf07I7vQvxB.ORhywSh3kD8oL7m2iInEWD1EfQGB4hZO', 'RAY MAJD AL - FARIZY MULYANTO', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (169, NULL, '218855', NULL, '$2b$10$mJ1/drW/BL5PanEOXcgJcOPUUkaJdSCWS.Jk8NEXo4qx4xdCFPtPm', 'RAKHA SIMON PURUHITA DAMANIK', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (170, NULL, '218867', NULL, '$2b$10$rwU21dvaf2TR0K6Vi2ILNe7PJACJ17/O3locA7nAHN.oeL4qiOcEm', 'RIAS ADI PRANATA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (171, NULL, '218865', NULL, '$2b$10$rwthkZtfYEISqRrQOJTmWOPWkmO.UMw1bVATZd0MLdYf7aG9KOBaS', 'RHIZA RHAFSANZANI ANANDA ASVA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (172, NULL, '218868', NULL, '$2b$10$4LWKyO1DT1Ss63MEogUCyuKYHuXtMRC5f90fpryNqaNaCz2pGeut2', 'RIFALDO ZAKI SAMUDRA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (173, NULL, '218872', NULL, '$2b$10$UFPUVDSeDyXvGacYrLLD.ucEGh0mvnbPoiCFnaHwiz9J1s45woele', 'RONALD OKTA VALENTYNO TRI WIJAYANTO', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (174, NULL, '218885', NULL, '$2b$10$6hWYPoNWTNdUJ.SltHLaBexb2FGgInAjXJu/J7319cQAEvzMmSRJ6', 'SILVIANTI SALSABILA PUTRI FARIZAL', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (175, NULL, '218873', NULL, '$2b$10$J1IAXXqpGFbu7TRjKwPohuOISiI5MHPi3ddx1hUA8KCP/20vP5tCi', 'SABILILLAH RIZKI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (176, NULL, '218892', NULL, '$2b$10$8AQIXelD48C1H.5teYWQcuJQKMSgWX4HwrveiccEKMWDV.iePkhMK', 'TANTRI INDY SYAFIRA PUTRI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (177, NULL, '218897', NULL, '$2b$10$IZIvRb/.RrsTysC9ipH8Iu95Q4SP53Ftfo7DPf05YFlrE6qzABqoC', 'VELISHA PUSPITA DEWI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (178, NULL, '218903', NULL, '$2b$10$4V46w6bZEfm.EhdTfBtlleNrzctQSEKzn5ZNtI7vinWL7wKaDzIRi', 'ZIVANNA BRIGITTA PRATISTA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (179, NULL, '218647', NULL, '$2b$10$b0/2bplhH8daSG2Pba37OuA/ezPYIJWpb6h.FmmvCcjVCNnhGpYfW', 'AGATHA GALANG MIKOLA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (180, NULL, '218656', NULL, '$2b$10$iERJEk6pVR0j525Nm.AxgeHfP7.Y/2b9ihL50N5eZwmBa44VtW/WW', 'ALIFYA CALLISTA PUTRI ARYANTI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (181, NULL, '218669', NULL, '$2b$10$yzhrzs41AFZ4Lt9gX1bbOeVFjjES80sceXOBdpAvRhIprKY.6yIvm', 'ANDITA SEPTIA RAHMADANI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (182, NULL, '218672', NULL, '$2b$10$xp/CWk//Ysl6BGWL.MZ2we.NFYYHUZYXM8QdEy08oP/YgPQNnoU46', 'APRILIA PUTRI WAHYUNI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (183, NULL, '218673', NULL, '$2b$10$MFRt88H6974G6S9Ian4oguCcU.3glqYevnK6iAV320kaGP8P6FTD.', 'AQIDAH AZAHRA SALSABILLAH', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (184, NULL, '218683', NULL, '$2b$10$EV2IFySgG0owC1y/NS43vuB7ffZCJstAScxi3Gszy0Jj9qSOPfOPi', 'AURELIA PUTRI', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (185, NULL, '218681', NULL, '$2b$10$J2wfMtLiGzzIR1gopJQA.O8gVC05HxxtOibxFBT.YjqRQERsa8F5m', 'AUDREY NATHANIA ZAHWA', '', 'student', 2, '2022-01-14 06:09:22', '2022-01-14 06:09:22', NULL);
INSERT INTO `users` VALUES (186, NULL, '218691', NULL, '$2b$10$gk9CJ4IHp19R0lHvuSkB7uN6VNmTgZjkCopXHzwlC4c2dNZ2oc/cm', 'BINTANG MUHAMMAD FAJAR', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (187, NULL, '218690', NULL, '$2b$10$HxTcLt3EwT7O/cJMXYFnUe5zGViqgppRKU53m3V/1FBEoWzS9tG/.', 'BEVAN ARYESTA PUTRA ZAENAL', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (188, NULL, '218692', NULL, '$2b$10$/lSMYIeo.SpSBkb.hz6Cr.46CQPICAbCCHsMPpQ0v9Hm4B7k.wntW', 'CALLYSTA PUTRI FADHILAH', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (189, NULL, '218705', NULL, '$2b$10$rsyy3yeRYEBxfCyCpMTQleYnU5BcltFOGzoqdmU7jQ6N6gLsXgZWS', 'DARA TRESYA PUSPITA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (190, NULL, '218715', NULL, '$2b$10$3lSBS4gEpHMfJim1vGzyGuAIT5r0/uuLRownZt1hoKuQtXv/70jeq', 'DITTO ADRIANSYAH EMERALD', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (191, NULL, '218730', NULL, '$2b$10$gAhHGFU.T7BzHXLQciwzs.yD/0s6nDsFTtgxa3mU5FHB6hX45KwwC', 'FARAH AURELLIA PUTRI OKTAVIYANI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (192, NULL, '218734', NULL, '$2b$10$hM2b5YdaOa0I1SgeC3cJbOPt064VocB/sSCVmiwofWzv/1vMBXLcW', 'FARREL HAGI PRATAMA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (193, NULL, '218779', NULL, '$2b$10$3mx8Qzj5BQIamadssTb5n.7s0LWBS4IlMsQeC6O0ZoLrfeKize.NG', 'KHANSA NAVITA BASUWARDI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (194, NULL, '218782', NULL, '$2b$10$ywVHvjiTgoF3HVVzkUQP8uh2mwKQyyJRLJskOYl6VFxgeQ.0EJx92', 'KHEISYA ALMAQHVIRA RURI PUTRI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (195, NULL, '218735', NULL, '$2b$10$j/FPay1wvMub7Dyv8HBNsOHzZRe93uoRw6.UOkjm3ijcOkVk2Wnf.', 'FATMA WULANDARI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (196, NULL, '218755', NULL, '$2b$10$xCBSfNPU./pDKpFYYEzO3uVmWzBKzNTHBowZg36l7qWIDtR8oQ/AC', 'IHKFA SAUHAROH DINA SALSABILA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (197, NULL, '218785', NULL, '$2b$10$0Sfe2WB7rQO5hskZMNTXP.mNpDQC1lDQyWrv6p0HiPFlGlX2GoQEi', 'KITARO MUAZAM ADWAYA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (198, NULL, '218788', NULL, '$2b$10$lSlqpYbzTLhTE5GeT0RqtOrBA8WG8CcK50DD6SnypuTZq.kq2Dtbm', 'LAURA TIFANNI SUDARMONO AGASHI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (199, NULL, '218792', NULL, '$2b$10$CxLxaKfxLhiqI3LAJ1vKl.rzHJKoSkCSpj.YBvghq64d/Ii.Ije5G', 'M. AJI PAMUNGKAS', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (200, NULL, '218805', NULL, '$2b$10$A3W06RzocRYpjnq4OXGt7elKM3xJspYU5MwLF/bpfq1EtZhj8/cj6', 'MOHAMAD RIDHO SANTOSO', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (201, NULL, '218807', NULL, '$2b$10$7ZVqCjT.t1rKZE03AHGis.d2viUZXzcarIGP.828wG7mJlgwx/QZS', 'MUHAMAD YUSTIFAR', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (202, NULL, '218808', NULL, '$2b$10$Mek2jXuuLiibxw/CqPAeF.2iX9v7.pYQaQJq1iYrahWr/05JneK4i', 'MUHAMMAD ABDI FEBRIANTO', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (203, NULL, '218851', NULL, '$2b$10$LKijQ9BHW4S8RmP0tZkMD.fhqpGzmwndPIeOYXax6mmH.TEP.rubm', 'RAHMAT ADITYA PRATAMA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (204, NULL, '218821', NULL, '$2b$10$3247d85LU/XWjLgROBST8e5WNIA5AEcztLXK7kTzi2e6tFWbU2kxW', 'MUHAMMAD ZIVEN OCTAVIAN ARKANANTA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (205, NULL, '218840', NULL, '$2b$10$oyft0pYJkWzCKA./3QO0aOayCPHsVv5gj3mV08aYarWbcJ9Lfjv02', 'PERMANA SODIKHUN', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (206, NULL, '218847', NULL, '$2b$10$EG3K3eDy9q/Fz.4RjHvWdea.bnFcj.aInpEg/66ugSDcpUbgpaXJy', 'RAFI ALFACHRY PRAYOGA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (207, NULL, '218883', NULL, '$2b$10$afcBQ6hIg31xO6r5yAyqAex95Tni8.pFX0PEw4EhL95B4SHopPn4W', 'SHEVA DERYA MANZARASI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (208, NULL, '218641', NULL, '$2b$10$u2rTjFPUyJSK2VMJW2UYB.HRl8Qek0alMHLKnw09QNpzbeGXSilKS', 'ACHMAD ROSIYANDI AKBAR ALIF', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (209, NULL, '218884', NULL, '$2b$10$NrgKGxcr6hogMVR/tdgNxO/fG6QNGE0K5IpKkRNNunq/obgfaRoKC', 'SHOFIA KEYSHA RACHMAWATI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (210, NULL, '218652', NULL, '$2b$10$A2YlCTjR6MNwH34VEE8FNufqV.Y.SpeLbtduRW.R4dan4X52wMt/G', 'AISYAHTUL ALLIFANTI NABILA PUTRI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (211, NULL, '218657', NULL, '$2b$10$5BLggXRJH1Z.D05EPlpfC.yUyB9oHhgZJwZNne77JlwrosnZN4p8S', 'ALLIFTA NUR SURYANI', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (212, NULL, '218667', NULL, '$2b$10$usequb/bjyZ7O4YlwskG.eiV/0NIlRMBOrIIlRJsOhHeeSC.kJvyG', 'ANDHINI CAHYA ALICHIA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (213, NULL, '218676', NULL, '$2b$10$o.DgGAng8IjnAT2ZXH6ETe.FPb4XjHjLtXapmj75bxhiYPgeDBlsa', 'ARLETHA DESTARASTRA', '', 'student', 2, '2022-01-14 06:09:23', '2022-01-14 06:09:23', NULL);
INSERT INTO `users` VALUES (214, NULL, '218700', NULL, '$2b$10$2PAeVHd8pfZArV92AqgrDuWJiKscMyT8ZQJPwOCm2DPo6nT9xJe3u', 'CLARISSA VALENTINA ARRYANTO', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (215, NULL, '218703', NULL, '$2b$10$Awc2IGDtuQnDt3Rj8PAd3.1ij2uNhh2iXepIM9J8cpRiqh0W4U.LG', 'DANELLA ZAHRA ZANETA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (216, NULL, '218721', NULL, '$2b$10$plktgTNvNao1unrYwRVsPuFs/Y/fBtvW47xDjzwzNpLxlnppNCOvi', 'ELVARETTA GEMELLY ANAK HERLAMBANG', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (217, NULL, '218718', NULL, '$2b$10$aY1zFRcacArv7DEdEozQd.efGlEDpbzoo3h1oTXE6A4LUZSut5E2W', 'DWI LUTFI MAHADIRKA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (218, NULL, '218722', NULL, '$2b$10$qo/BYLd9CFPIBTbVNvTQMexM.QgotMb0W.8jM/FpAq8qXTHCfss1q', 'ELVETTA GEMELLY ANAK HERLAMBANG', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (219, NULL, '218723', NULL, '$2b$10$oirGMGIgKtI6km8.qZBZ7OQTuko9L5KR4gOBzvuUd2fG7KP0wG9yi', 'ENDAH PUJI LESTARI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (220, NULL, '218724', NULL, '$2b$10$.Np3juj/sdLiGXMczIw71uYCroOBaTbbz8Ub0aoJGIPj3Fr83Y5mK', 'ERDY REZA ENDRAWAN', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (221, NULL, '218737', NULL, '$2b$10$6A0.lvVL7Kxc3aNI.1VBwuTQo7PinWy/DtQrxI24uxZyvtWAc.rti', 'FEISAL RASYID LUBIS', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (222, NULL, '218776', NULL, '$2b$10$bvEM4vdYTTcUsj83yNoaBuhLrFlnnfzkMDB.U6x4/qEX3q1sG9opm', 'KEYSHA AURELIA SISWANTO PUTRI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (223, NULL, '218754', NULL, '$2b$10$BVOKCV.pxYkn5Fws9nW6sO1t61ykrt1vGOiocFIwzyIi5xwEDuw5G', 'IFTITA RIZKY NINGASTRI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (224, NULL, '218764', NULL, '$2b$10$TOkLLIAnUaTYm47qmPnWAe6hXFWSYucPdOJh7MOjGng2yZhMWkhD2', 'JOERICO EGA PRATAMA PUTRA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (225, NULL, '218781', NULL, '$2b$10$wEpLZJbISunImd55nSbu5OANUQsoBc18SRuN1h6WcKeuCr9A6YptW', 'KHANZA RAMADHANIA PUTRI YOLANDA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (226, NULL, '218795', NULL, '$2b$10$9Ht11KtPv2wYmMtJMVjN8uiCMQHhxvhUU0uwARoWshuCUxmGxCqhK', 'MARIO RAFFA YUSUF MAULANA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (227, NULL, '218787', NULL, '$2b$10$YkJIL5wK7Yxx4RAPFrfEnOzjirRNbn1WQa8x/n6HiL1RsVC7bSTkq', 'LATHIFA PUTRI ALINCHA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (228, NULL, '218800', NULL, '$2b$10$vinh74BJ4WHLt10/D3d3A.fCBFa3yrXlIX34TahvkckYrBZUIu8Zu', 'MOCH. ADRIANSYAH TRI SAPUTRA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (229, NULL, '218802', NULL, '$2b$10$OIQgJa9IymX/tEGR7s9wr.ICY0bP6aBs0UKzdg2ts0tbcYe2DtPaq', 'MOCHAMMAD NAFIS DIFFA RIZQULLAH YUNUS', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (230, NULL, '218815', NULL, '$2b$10$EEPNFDG9eSXt2DDp3/PZx.jUvdSxh/hjzt30dzffGJnf3o33bUbRC', 'MUHAMMAD MAULANA ALI RAMDHANI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (231, NULL, '218816', NULL, '$2b$10$dsPIm/yCtQWZtqaC5kRWb.0IiBtx.RMc8o2uI1ZUbBDkXBZEgXdjS', 'MUHAMMAD MUFID FATAHILLAH', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (232, NULL, '218831', NULL, '$2b$10$yhXvi.zMGLmPMO5bGZPY8.1q89MNMqRU/iQw4AOTh0MAGi9XDxrZm', 'NAZWA NAGITA SLAVINA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (233, NULL, '218843', NULL, '$2b$10$WBYfwKSurvjj2Xckmxgrr.aMxdUTe4hQ5NcWAYRJLHet/goGHwATC', 'RADITYA DIMAS ARDI FIRMANSYAH', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (234, NULL, '218866', NULL, '$2b$10$PSG5fQsXiME5rPAL5bvn3eY.z/PlU7vf6MU/l9TaVx1fGKitP2KsC', 'RIAN ANGGARA RAMADHANI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (235, NULL, '218856', NULL, '$2b$10$5zz0Oir/xRxIJeTr1LNWJu4D95a/SU5cJGB3nsdbK4x8VmPLxUWA.', 'RATU SHABRINA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (236, NULL, '218874', NULL, '$2b$10$eoz6UbNuarGDcleeumaYnOqdgvtEWyjzeAiakAIimYvo9ybIrH1GO', 'SAFIRA PUTRI VINATA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (237, NULL, '218881', NULL, '$2b$10$92GsxQFLeeatOpy2X/mCteIKDEYlwoyJHMN./IA3PzKFdCVh/74BS', 'SCANDRIA RAFFA HARDIAWAN', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (238, NULL, '218638', NULL, '$2b$10$RwnJ1Gz0Xo3Lk8DPcXtQmuVLfrcCWB1Iu5aCjNtPzvjJr7qiF5AX.', 'ABDUL MUFID MAULIDI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (239, NULL, '218642', NULL, '$2b$10$/DblDfDPg9/T3IFDfHfQ..hUisQqjfl3bCf5Arx/hSqHcz0pWfgwO', 'ACHMAD SAIFUL RAHMADANI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (240, NULL, '218899', NULL, '$2b$10$ASCGrhB8xxkNJZq1n24RI.hT.u8gATAvtWJj42p40fz8nyQVZ2sli', 'YORDAN DWI RAMADHANI', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (241, NULL, '218649', NULL, '$2b$10$eoCjizBKRGLv10lb2EQKZuy5zXgRVamqKqG6Fwcr8nH3rqQELPbL.', 'AHMAD AFIF HIDAYAT', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (242, NULL, '218663', NULL, '$2b$10$X3vG7GAtBvWfTl724m6qgOiAgCOPPytWXv.8sYsJp3Xu90fe/6KSe', 'AMELIA PUTRI KLASITA', '', 'student', 2, '2022-01-14 06:09:24', '2022-01-14 06:09:24', NULL);
INSERT INTO `users` VALUES (243, NULL, '218668', NULL, '$2b$10$wstkZexyUHtmIqShcw.Jrud4zdgAa8G.7xDzonSLcd0m1fEJHZhPe', 'ANDIEN PUTRI YUNIARDI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (244, NULL, '218671', NULL, '$2b$10$LLzZTnHTwlk03i2aaoXYsuJGutTAsV515EODYOMo50CQhDB4JW3Xy', 'APRILIA BUNGA CITRA LESTARI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (245, NULL, '218675', NULL, '$2b$10$81YS.pdEJMYMtpVblIkGMuHZ2dGn9aX88baZzwcGVlanvt320/d/K', 'ARDIA PRAMESTIA CAHYANI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (246, NULL, '218685', NULL, '$2b$10$ZUH352YsyOe6YUpP3tuLy.VcNHTsoncHOnJ1sgscT2HRh3BcyCuym', 'AYU AGUSTIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (247, NULL, '218689', NULL, '$2b$10$om57jFp1aNtgx.bXkrFwY.DjA8j/43QlVrJ6IattOZRIxiUvC9T4e', 'BAGAS PANJI SAPUTRA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (248, NULL, '218695', NULL, '$2b$10$WXnYEl51UcefuVLfVxk/AecBhsNycZhcTDckj99BUqPpuwzwMSoQm', 'CHIKA GENDIS SAFITRI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (249, NULL, '218708', NULL, '$2b$10$nbqH6so/Y60qSJbmGWaBj.9dCaLO69UNcEn8NE5AExkBcYxRi1ZWC', 'DENIS PUTRA DIAN ANUGRAH', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (250, NULL, '218712', NULL, '$2b$10$pmfhi0zeK5aR9H/fitJo1OPXvZ136w5V4229/G70yaFIs7u4eY3jS', 'DHEA ADINDA AULIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (251, NULL, '218713', NULL, '$2b$10$U3PM3rhAUXt63q2CUgJE6ukFr/6dDLYD4tW08SEpnRu6WmHcoZ.Ta', 'DHONA PUTRI FAJAR PELANGI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (252, NULL, '218717', NULL, '$2b$10$kcIweKR4pZ7BMpq/pJV50eOsjwezzrMcGAheevqtLmKJZJZtIs.Fy', 'DRIANOVA ADIKA PRATAMA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (253, NULL, '218736', NULL, '$2b$10$2jlhIlccuD.rR1SolHeQK.XNcdXZ6sfzgMXicOI/gqmSNdGxcHfh.', 'FAUZIAH NUR LAILY', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (254, NULL, '218743', NULL, '$2b$10$nMent8HSjvl98dYkJybw0uigZ8DTTGG2pgJ5kKS1gc5GUnRdW7PL6', 'FITRIA SALSABILA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (255, NULL, '218750', NULL, '$2b$10$IuBWcH54CRpJEPHfc43xAuTtmEGtgj3/G./k8J0/J1V90iZP/wypy', 'HENDRA KURNIAWAN', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (256, NULL, '218769', NULL, '$2b$10$41MJys45xo.sxbGVwcf3auZbmHJXUgDyNteV7pUVaUO/vd8Nble92', 'KEISHA AULIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (257, NULL, '218770', NULL, '$2b$10$SZn/mjugkMRuTqX4BlkdJ.InVW7Y9xccmHwP5llcQgZahyP34ntzu', 'KELVIN ILHAM ARYAWAN', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (258, NULL, '218786', NULL, '$2b$10$MbZRFuwp314.NgeRpB2b7eQbAaa/NkBOw4zLFR1dtvkUNus.xQ/7e', 'KUMARA HAFIDZ AL GHIFARI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (259, NULL, '218790', NULL, '$2b$10$CfR.N1gJHwIixYCKvZMmL.NsR2nLpoBrUQBqhDlrhA9fykKSUUxha', 'LUTHFI AHNAF DWI SURURI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (260, NULL, '218825', NULL, '$2b$10$o6l5DaNJCnhNdzDGCu5BCuok/zVMu8bxl2..T7Pl/dZ2bzFFN0Icy', 'NADINE RAFIFAH AZARIN FARYADI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (261, NULL, '218828', NULL, '$2b$10$4HFzyrwFp.cejpfnCg/ybeo3P81EynIB4n1Od7.IGylkg.SR.keMu', 'NANDHITA NURAYU NOVADILA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (262, NULL, '218835', NULL, '$2b$10$jvkselhwHHrkSS.OTGcGDeLTlZOxo.mbfMDatuQaN6tElub8IjAO.', 'NUR AINI ALTA FUNESA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (263, NULL, '218842', NULL, '$2b$10$lOqMHl50aYyhtmwlyMy6AeSeWHJQhtaWcVRs91l5HOPGHPHiuXrla', 'RACHEL FAADIHILAH PRATAMA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (264, NULL, '218864', NULL, '$2b$10$ipoggCiet0QAxtIez9LPyOIP4bpMFsjrgMnWw8oZN1km.IMJRSxBO', 'RHENO DWI PRASETYO', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (265, NULL, '218845', NULL, '$2b$10$HrMa6rikeuXfXyJz4w4WW.CzKw3FIO3iL/pWTZvpdyKekiXiKI.GO', 'RADITYA WAHYU SAPUTRA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (266, NULL, '218879', NULL, '$2b$10$oaMMj2b3IoTGfBa1RvGv.O0Yn8yZGOpSA9cJh2xOj78bOCe.LQ5Ua', 'SANDYKHA PRATAMA PESARISTO', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (267, NULL, '218888', NULL, '$2b$10$NpXlIkbDtJW/BRSmDmL8u.i88j4CBLMezY9Dd819yMcjbEfSFvUQS', 'SYAHDA ARYNI AURIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (268, NULL, '218898', NULL, '$2b$10$PR6wRl5KbY65ULCJFoGdN.kpdzTrvYFwjeNl1PEeGwJDmQuQNjAIu', 'WULAN APRILIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (269, NULL, '218643', NULL, '$2b$10$ax7V7AKRy0Nk8LwlMrpw.OQwOUdcsFzUICrDPBU7SSa0.pd1KG89i', 'ADELIA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (270, NULL, '218645', NULL, '$2b$10$BLSwAasyu31AAtfiwXf5nOK08JOeIO1QqJBir0MwslUMtaHz4CqP.', 'ADITYA PUTRA YANDRI', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (271, NULL, '218646', NULL, '$2b$10$kYFOMen1/5HHAzrwZJt71..l38sI8H6SClzoZx2/Z3VsSUe5l3s1G', 'ADITYA WIRA SANTOSO', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (272, NULL, '218651', NULL, '$2b$10$tsqICB2Byxzp6em1N9vdu.0WNBi06Hxx9I9545hi2yiPYjct19BtS', 'AISYAH NATHALLIEA DESVANA', '', 'student', 2, '2022-01-14 06:09:25', '2022-01-14 06:09:25', NULL);
INSERT INTO `users` VALUES (273, NULL, '218658', NULL, '$2b$10$rdbz58DwhjqWABx9exnYZOvJYdsvlcVpVcq8YgbWbeeOltGBccAYa', 'ALVINA YOVITA SIXWANDI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (274, NULL, '218697', NULL, '$2b$10$aD4iw7VPxekF4whoEyvhp.WukCpsuZ4R9Ft/1gS2kC1F9cTc.l.9O', 'CINTA CARISSA EFRILIA SAPUTRI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (275, NULL, '218659', NULL, '$2b$10$vcBbPnNzN7qOCtrj7alVNe6ZfsVvAeY.dl1PNMeCOF0Q/PTRSKElS', 'ALZENA KIRANA DEWI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (276, NULL, '218664', NULL, '$2b$10$YmMVkj7KwD3yzplsSSUGqu5Llx7C7enSfEcD1e/SA5f.S8Pils07G', 'AMIRAH MARSA ARISTAWIDYA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (277, NULL, '218728', NULL, '$2b$10$fVVJ0jP4BKDhx4AK5Oz5AelbI3Cg8OFFKY4lrI5TZgFkfftbGeQV2', 'FALAH MAULANA RAMDANI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (278, NULL, '218725', NULL, '$2b$10$UgPBg/toa1CEoFqbqmg8qun7XCH3XWJVhTKt89qBcjE1f4BDkwn86', 'ERLINDA DWIJAYANTI SUPRIYADI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (279, NULL, '218740', NULL, '$2b$10$J.UZSNp8FmeaXgDJ7wOrcuvzqdInw9dhQv12wnHQkNbBjEzVYHyd6', 'FERRY FERNANDA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (280, NULL, '218742', NULL, '$2b$10$596lB2qSDmE9hKQxvylCiuAMOlADv5f/VrewWfW2Zbyo8bm1o2h56', 'FINDZA MAULANA SAPUTRA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (281, NULL, '218744', NULL, '$2b$10$OFJ00Cf6ilhM8pcoy1/.WuWes9ZFxc1LC3RggwzdYta8h1cfYSjjm', 'FRIZA ANANTA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (282, NULL, '218745', NULL, '$2b$10$1s1IIEUOk4qFu2y7f5ZF7O0RlFBAQ/HT4ipMOieDRx2Old16GIaoq', 'GALUH PRIMA DWI PUTRA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (283, NULL, '218752', NULL, '$2b$10$0H.BeSH9hxts8I9Q1j3XT.N0W3FsjYiqg5ePLwmuXX3drPO0lLXea', 'HIZKY RAIHANDRA SANIA RANA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (284, NULL, '218758', NULL, '$2b$10$YUU0EbGtM8CfA9sXnaxxJOks5gEboToHVzJ0o5dfWWNNpag9.rGTa', 'IQBAL ADITYA ROZZAQ', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (285, NULL, '218760', NULL, '$2b$10$mTHcBev0bfscrcQAuPa6eeoWZiaWmwKtYmg2k96jsqTwjtUuuyPkq', 'IZAL WAHYU SAPUTRA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (286, NULL, '218783', NULL, '$2b$10$UtNMYMInyXfuQ2YUHZltB.RxgGla0NDG08D6/U5B8320oTr7PaN3.', 'KIRANI ALIFIA NUGRAHA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (287, NULL, '218753', NULL, '$2b$10$Pm7pzUDg6PkBKu72pbL3gOC0khshHqLhCXinIyCMTNPjvGfrjq6MK', 'ICHA RAMADHANI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (288, NULL, '218803', NULL, '$2b$10$85pwAMwx5qnMQ9FQ64hzNOZt5mW4IVVzdnhsBZksKETDYvlet5hlO', 'MOH. HAFIDZ AWALUL RAHMAN', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (289, NULL, '218818', NULL, '$2b$10$iapSii9Jw3uOR7f9GWj2c.DIe0NynR3iLOoxdskgxRUdsVwy6jwCe', 'MUHAMMAD SOFWAN ARIFIN', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (290, NULL, '218823', NULL, '$2b$10$M65SNJJ3uhHT/vXE5tVajuqIs1OhaWbLOyV95XlXT0nT4ctYg9Iwi', 'NADA SAVAIRA FALISHA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (291, NULL, '218826', NULL, '$2b$10$.RhSlnMqK1jmz44iKyydg.fYh3JFHnX4SLijUb4HoWQVntMk7xL4C', 'NADIVA FAUZIA ISLAMI GIONONI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (292, NULL, '218849', NULL, '$2b$10$fylS.oQHvCr1Nks.uZTxOuoDdy9TWczefC7gbtk5HzxDcbMhhMdiS', 'RAFIF IZZAN KHAIZURAN WIRASAKTI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (293, NULL, '218848', NULL, '$2b$10$jQ3VsMqDJVpGgiC1Y74WqeQ8/EVv8kZ5YuPp0iZqzVZrQojnXeb36', 'RAFI PUTRA MARDHANI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (294, NULL, '218853', NULL, '$2b$10$e4o/KVrTOZLHl6eAVZvncO9dFIzC75gNorE0iScK1Lpl7f5W0tH96', 'RAKA VALDAZ CANSANOVELI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (295, NULL, '218860', NULL, '$2b$10$AOtQs6aJMnystgSQO8tmb.mXBQpjYZZqhcGcLBqNnaAEal2isXv2G', 'REINA NATASYA EKA PRATIWI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (296, NULL, '218861', NULL, '$2b$10$i3IAcaGoFeRYafZQr5e3Pec8mRxrVp.jzLu9sOraOVtlCrSdAhfHK', 'RENNO ARIANTO PUTRA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (297, NULL, '187882', NULL, '$2b$10$b2jHDVBbKJBHxisEALD.4uu9vlu373b6cSmknskrahbJr.rhRGD8G', 'RIFKY ALDO ADJI SYAHPUTRA', 'SP0333578061501060002@DISPENDIK.SURABAYA.GO.ID', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (298, NULL, '218891', NULL, '$2b$10$ai65WfK5EXy1ODE01K2Id.Ohzhr0jYsXk1pg2dyya6xaVFDTENeUC', 'TALITHA PUSPA SABILILLAH RAMADHANNI', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (299, NULL, '218660', NULL, '$2b$10$g2httzWYtpYZPSfsmr.kluU4ZKV3Ix50ntV0L1cxN2tV4zvqF9Xv2', 'AMANDA FEBRILIA', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (300, NULL, '218682', NULL, '$2b$10$Bz/BpfiopMQ.TOITYWfZiOazNeww9VvvdpkFkmTVzmw5mUX6V7rBq', 'AURA DIFA PUTRIYONO', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (301, NULL, '218704', NULL, '$2b$10$kgE1chBQgiVMBjklYoGVQu9bKIHSP12R7humLX2iEYsjQZrpCp0GW', 'DANNISA WARDIYATUL UMMAH', '', 'student', 2, '2022-01-14 06:09:26', '2022-01-14 06:09:26', NULL);
INSERT INTO `users` VALUES (302, NULL, '218709', NULL, '$2b$10$L/EKPBrspGSrzbgTyKNTwOEzLBDCwIFnY71ElNer5nstOpqIQxRG2', 'DEVIN ADRIAN PUTRA HARFIA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (303, NULL, '218727', NULL, '$2b$10$DGNQELKllr8xhszPilG9c.oS0F9lZjc6sLqzdydfLMdD3N2K0tpZm', 'FAJRUL ADHIM ASY SYAUQI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (304, NULL, '218710', NULL, '$2b$10$bQvK3nVstfX1tNWcDQBohOOSLDgbvWdQTIB0koFUV6On4Axcz4Jja', 'DEVINA DWI RESTYA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (305, NULL, '218731', NULL, '$2b$10$6CS8OCYk8nWlhbwLG4YiLesuS2G7To/pz2priVTI1o6nyszzRcxYK', 'FARIDA ROSI INOVIA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (306, NULL, '218726', NULL, '$2b$10$6LxITcx384Au5YjKPmBe7ekTPVEKy5anI6BLOui2lwruKA8uV8DAm', 'ERYCA PUTRI ANGGRAENI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (307, NULL, '218732', NULL, '$2b$10$76E6FOT0yNDT0CYiY/Vfauz.QeeLarIgu1eI/rl237Kt.HnHkgB76', 'FARIS SURYANINGRAT', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (308, NULL, '218733', NULL, '$2b$10$38gA6GHctngzvzv19.1Zr.ZwCLXjvg92V8yq05x7/xIVRqpeV4S1m', 'FARRA VALLIA PUTRI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (309, NULL, '218746', NULL, '$2b$10$ejo5n2vHrmu4toujQnbsp.R6OWkPo7o8/wQbjSAwZdHgwttS5FijK', 'GANESHA AIRLANGGA HASTA PRAMADYA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (310, NULL, '218741', NULL, '$2b$10$As2BgWmS5AMflmMKeDz.m.XS9rr48cmm9a9FCWp3cSem7o2GOnTxq', 'FERRYSCHA PUTRI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (311, NULL, '218756', NULL, '$2b$10$efN8H5qPRBkHE2T1DawODOugUU9hcdd/rvbX/t8izcF/RdwRh.f8u', 'ILHAM ISYTIAK WALDANI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (312, NULL, '218762', NULL, '$2b$10$b2W7rhWJ1ZPWDsYlhjbov.FwzbnhdgJ9vfvpQCTtHNufS4qNL/Ure', 'JAHRAKAL REDI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (313, NULL, '218761', NULL, '$2b$10$Im3klH7XMmEGEW6zO4Se1uRjQOnyOFF.1V63RKlmM0psTyfQ3JCB6', 'IZZAH AWWALYATUL FARIYAH', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (314, NULL, '218777', NULL, '$2b$10$xb7Ia.GWcX5hO9cZYQ8U3eBEYQxgo39q/uS1SsOorrPIm4E4TBfPC', 'KEYZA TRISSAVINA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (315, NULL, '218778', NULL, '$2b$10$ofQg.N5N0p8nkOmKDUpeSuto.EuPYwbaRMa2kqfTBls/RZSrQJVc2', 'KHALDA JAMILAH NURFATIN', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (316, NULL, '218780', NULL, '$2b$10$OAJyT94q/dZg.eB/YXxnqewXjEqOhbP778h4QaRYU0An9R0Dtr9vK', 'KHANZA FITRIA PUTRI WIDYANTO', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (317, NULL, '218796', NULL, '$2b$10$MeP88I2Yj4QVcoaJ1pu7m.SGwAmT4g6iCZ4yBaSURUZVj6BUpw5bO', 'MAULANA FARRIS SETIAWAN', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (318, NULL, '218797', NULL, '$2b$10$tVoN2RlulsjSZsY2c6kUBuxXoz/u..lA45Du6f7fn/w3IbZq.wck.', 'MERCY CALISTA NOR APRILIA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (319, NULL, '218794', NULL, '$2b$10$W39F3c3mvhZaZ0CLCyyyXO0xTMEEBqha4E1uUuLAlE9KqcYwT9Et2', 'M. SOFWAN PUTRA NURHADI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (320, NULL, '218817', NULL, '$2b$10$qQnl..baSSpRcs24YgjPkuJtMVM2KjfWmA.Rs45Vs2D1sNtnaewba', 'MUHAMMAD RAFAIQ RAMADHANI', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (321, NULL, '218836', NULL, '$2b$10$EVREzE4BrXTucsXBiE3Gv.g5lWhsY.MTKQOcXuf9nCAQ1LwVbwPQq', 'NUR HADY AHMAD JUNY ANSYAH', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (322, NULL, '218829', NULL, '$2b$10$SO44f4qDciVioNCmlBjYu.isQ0x39CALH0wyCWN4sXZ3xK6sv5p.G', 'NANIK NUR CAHYA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (323, NULL, '218854', NULL, '$2b$10$qSm1GWAIpFrC5xVAia5joeE86NJ73j5zLiylhYOoGx9ly4cksJWGq', 'RAKHA DWI JAYA FIRMANSYAH', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (324, NULL, '218858', NULL, '$2b$10$5XRz5ZN7oZiFhN.wnYY8MeBfPKYS0nMUTPeoUZzfv35PxcMK5UP6u', 'RAYHAN JULIO RACHMAN', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (325, NULL, '218863', NULL, '$2b$10$LQrJA3xIQHHgUguGjz1Z5OK1jxQN5s9I8TqX2mYVsfbUfD/Jd5cE2', 'RHENATA CATUR SAFIRA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (326, NULL, '218876', NULL, '$2b$10$qHTTFFR18PAxzK2Zt4dZAuM/gi8MtIZ.tywb2cuSLaVwblo4JC2Na', 'SALSABILA WABAROKAH SUSANTO', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (327, NULL, '218877', NULL, '$2b$10$qe.IUmCh9KGUgoRo57v8qObTCgA2uIZ8KLJSoWYaUcQSq25aEKbcq', 'SALVA PUTRI OKTAVIA', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (328, NULL, '218894', NULL, '$2b$10$ngfwAnn0vx4nvAsYGeceGOjSDvEYEUjSqJKfyNxTRdnY77Y226JN2', 'TEUKU CHELVIN IRWANSYAH', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (329, NULL, '218665', NULL, '$2b$10$yr6EJf/WkE9KtleJntsTM.pPHNMQ4ybcZqTmITMnBEYv37moaHoGG', 'ANANDA RAKA WIBOWO', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (330, NULL, '218637', NULL, '$2b$10$uER9xkkfxhdDnYpsw3K.QOl48CqkwQYXTXxeMJjACbkZ53KbgO70.', 'ABDUL GHOFUR', '', 'student', 2, '2022-01-14 06:09:27', '2022-01-14 06:09:27', NULL);
INSERT INTO `users` VALUES (331, NULL, '218666', NULL, '$2b$10$fFUknKn1CHRb.43TkzmYIOsx23Y2RbZLqi2QmusNJc.Fp5nNtrn3W', 'ANANDA SOFIA SAFITRI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (332, NULL, '218677', NULL, '$2b$10$qQNlSWbK3B4qpPua35DRMO1GbcD3KJLs7vOt9/XCXBYoVO6byMhjK', 'ARTHUR SHEVA FERDINAN FAUZI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (333, NULL, '218680', NULL, '$2b$10$cZ6Pt34JWBcbY7Eh2FYR1er40qjEVk9EjtrZLIkel.zdA/JceCrnO', 'AUDREALINE HANUNDIAN PRYSHA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (334, NULL, '218678', NULL, '$2b$10$9fr9/Zj57oge0jvuTLJtAesJ1FteJqff4mdRcIplHQB1udgbS2huG', 'ASTRIVO GUSMAN NASUTION', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (335, NULL, '218686', NULL, '$2b$10$VnQL/WvYTKRbuqg7jLNJ5O301iWibo981/9614YHkzcze0cliXDQm', 'AYU MELATI YULIA SARI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (336, NULL, '218687', NULL, '$2b$10$8UEz5DFw6wdyoceipsEKH.8aeMKhJtDo7SdQOa1OBxwPpUHB3L64a', 'AZARINE ASKA RAFIFA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (337, NULL, '218694', NULL, '$2b$10$y4mKDXDLesTSvqlB.0cFe.Sk9aS2Cxg4VqLNIlxg5z8m681ZVu4o2', 'CHIKA AULIA ZHARA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (338, NULL, '218698', NULL, '$2b$10$qsg9WyipYPKy9AQ.o0sq7u4oP/eO2VlTZQ092AY1PnifcGEdG4Iw2', 'CINTANAYYA MIKAYLA AL ANNISA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (339, NULL, '218699', NULL, '$2b$10$eAQTwH3p5AA3KcEwtH1Jf.DuZ1DZ.1jN.E1JlDFNgmiphpnDnsx8W', 'CLARISA SEPTALITHA PUTRI RAMADHINI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (340, NULL, '218729', NULL, '$2b$10$bwl/1fMnQBJtqzqkTj9c/em2av5BnmPG3Pjtdal/pq8k8qSP9dzwO', 'FANDI FERDIANTO', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (341, NULL, '218751', NULL, '$2b$10$hIqajffmHsrjbl5y.bgLUuaJb4LoQT27Un4Ov.LKcm7Uce3PRuiaK', 'HEYLENA WIDAYANTI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (342, NULL, '218759', NULL, '$2b$10$YHDwjiE/TIgbsXVvtsXMBOYX3kUPQrLUlCW874s/.vd4BhCv7H7/G', 'IVO JOENIAR DESTYN', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (343, NULL, '218789', NULL, '$2b$10$3SEYX1VYRZLoG0rXPo3XEuBn6JBGuYGqUT6RDSGoVJVsT3VIMeA1u', 'LINTANG TORIN SYAPUTRA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (344, NULL, '218799', NULL, '$2b$10$9ETIBfcTYFUJH/YcsjMZGe0eYQZOLyxWzQsqK1FPWwdCWODK8oEqi', 'MEY ADINDA LUCKYTASARI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (345, NULL, '218798', NULL, '$2b$10$LV2zoWpoitX.dS.MwG4hlOzKShFPdHo8ND6HutFWbR.8eHJUeP78i', 'MEVITA FEBRIANI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (346, NULL, '218801', NULL, '$2b$10$d5Z8aaEc9D5rUhySUg2A9uQCxMc.3SXZe7Fh8pnsB0qgnthoOBpi6', 'MOCH. DANIEF HANAFI APRIYANTO', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (347, NULL, '218804', NULL, '$2b$10$SqxMCKBOKaXtNT9y34dhoemYIHmiyM6VlgMTt7NXogf7besmNYdIK', 'MOHAMAD DWI FAREL SETIYAWAN', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (348, NULL, '218811', NULL, '$2b$10$o0bwvrbhu2SYVr75WlJLEecFbXRXBlQyvz3gB1j8Jc8JoS1VkD/Xy', 'MUHAMMAD DIMAS MAULANA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (349, NULL, '218824', NULL, '$2b$10$GyiA.MUPWq0bbW5cWG1RmOR7mdSXjkvumRGMohMkssfYcJ1bzBDRW', 'NADHIFA MAYLINDA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (350, NULL, '218819', NULL, '$2b$10$w7PK6Wz3yvnTtCbwMPhtuu2UKwW7OD8I2QwYQsxvZkuoij7A2RrVG', 'MUHAMMAD SUFYAN ARIFIN', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (351, NULL, '218837', NULL, '$2b$10$YjVnFX5j2KPRri7kn0LMbuZFN15RyUV6diiHiPVcZHBQ4wOdh7cn.', 'OCTAVIAN EDI PRAYOGA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (352, NULL, '218838', NULL, '$2b$10$qnwkF6qg4AVwaBIRJfhkMeU9Jd5BkFOvSN5JAOTVHp2ep5OMzKp16', 'OKTAVIA SUGIANUR', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (353, NULL, '218846', NULL, '$2b$10$2PpIGpb.jEBrfQH7tkW.oeIgRadvCZTZ.YZhf3h4inr8KvqEcsDdu', 'RAFA ADITYA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (354, NULL, '218850', NULL, '$2b$10$6nkbCK1rQzWmd1.rrX/yxOxr1CzF2B3ppv7orfbmU0mH7KFpvCpIy', 'RAHMA ALIYAH SHOFWAH', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (355, NULL, '218870', NULL, '$2b$10$QX5Cs2G1eXgwo2nELbRf1OaxlUYqpRzPeKH4ZMw43jO1YT1WaCFA2', 'RISWAN FAHRI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (356, NULL, '218882', NULL, '$2b$10$prdx1G98xBiV/PfLRJSN8.4nNu94DiZDHPTjginryVnWkm.rLKani', 'SEYSA VEXIA RENATA', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (357, NULL, '218900', NULL, '$2b$10$0x9f/IzsOYlyZYb.JrpxEusZ7fREw5mcQLF1FDC6XMOtCt0mlTRAG', 'YUSUF FAHRI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (358, NULL, '218901', NULL, '$2b$10$qzNl7zhi55gcPiin5v537ekAMLlpf9nOibeyLnyxCFIiolgUtdEhe', 'ZAHRA AFTAVIANI', '', 'student', 2, '2022-01-14 06:09:28', '2022-01-14 06:09:28', NULL);
INSERT INTO `users` VALUES (359, NULL, '218635', NULL, '$2b$10$iYXEfwDqReQp6nkdOKpPyeMYBnjBKA9L07ObSC4cC3x1QBP3q0T.i', 'ABDHI SAKHI MULIA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (360, NULL, '218636', NULL, '$2b$10$TD3BiOfbVB20mf9c7ZV9Xu7Ak8DjXKTtv0J6b.d21rVdC.1vdIRCm', 'ABDUL AZIZUR ROHMAN', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (361, NULL, '218639', NULL, '$2b$10$jg8Jnt0SYizaSUOnabcNJeH29Zcn.N5SU1QSzgTyN4pOsjMVMn8Ei', 'ABHIRAMA IHSAN MULYA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (362, NULL, '218650', NULL, '$2b$10$UzS3ZqzhLNlKJjnI92.nce/ou99.PZMkWweR030W15aLgWGPvl5Fu', 'AHMAD AMMAR MAULANA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (363, NULL, '218653', NULL, '$2b$10$XYZqTqcZGe9qbr5a1.wic.GRyVCfii8UMlcig0NLsAIiUyFxRqmLO', 'ALESIA DEVINA YANUARDI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (364, NULL, '218674', NULL, '$2b$10$ZspbYK2rKQoXx8xJFjHi/.IVdia0MU9N373fbfAnZZrYz5D9STXBO', 'AR RAFI MAULANA PUTRA NUGRAHA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (365, NULL, '218654', NULL, '$2b$10$bZCpnJN6UpNGBaHZmakp3upIbsX.BgHSqNDXSBe7Ac8AUV.okyTHG', 'ALFADJRI IQBAL SAPUTRA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (366, NULL, '218655', NULL, '$2b$10$cbs1D/uiHOtfDqFGVW4gL.iyNyz4EIOLH.T5Ouuq7JG697V4p7Hoe', 'ALIFA SALSABILLAH MUKAROMAH', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (367, NULL, '218701', NULL, '$2b$10$PaphywKndxxopEz.MebfrexJYTCLXbSqUOo1P8Z4ObYpqBgcnWTtm', 'CORDELIA LAKEISHA AIMEE RAFAN', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (368, NULL, '218688', NULL, '$2b$10$ZFHfYngSz2T7QE2FA071/u6SUD2/uM0O300z8WZweptIFm4X689LW', 'AZZAHRA KEYLA SALSABILLAH', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (369, NULL, '218702', NULL, '$2b$10$iEKOLnJYz0YR20v.IEU1ruYCTmbtq4STZ1g2v4wknC/x35C.WuuBa', 'DAFFA PRAMUDITHA ANGGARA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (370, NULL, '218711', NULL, '$2b$10$/0iqq/hSfdGtSg6PWlbQC.WmBAzCXyEMX/GaHsgvj1gVFleBtb3Pm', 'DEWI RAHAYU SULISTYO RINI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (371, NULL, '218714', NULL, '$2b$10$mfO2gR4zhTqOt0aTDkWqqOVzLJUNSC4pRFSE0VKAiFDZyNLueeDna', 'DITA STEVANI PUTRI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (372, NULL, '218719', NULL, '$2b$10$i4OhWkdIWjyQOxzJ891Eqe6.dWc7tOOxyzk5BHKzj.iWj1.BTJHAO', 'DYAH AYU ESTY PURBANINGRUM', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (373, NULL, '218748', NULL, '$2b$10$RenbWB3u91b6QIuQiJWGSu.geJjN3e2Z4alkjEqtQeZli7LgMrdVm', 'HANIF AHMAD NURIL ANWAR', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (374, NULL, '218749', NULL, '$2b$10$15EHIC97kwZ4yXOGL0VBSeXwnu.BhJcZswzhKP33.TTGwAOyRgMCW', 'HAWA ZEIN AUFA PRASTIYO', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (375, NULL, '218765', NULL, '$2b$10$HBZY97Nnw0IvyZWzHg/8VOTEID1WqG6CZFlz3kDCsZ7FEHDIVUphK', 'JOKO WICAKSONO SAPUTRO', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (376, NULL, '218747', NULL, '$2b$10$1RWwwWSn0CHFtFBSIAwZBuh/MVgPSj93xJY6iXhA63NErnvErGP1O', 'GEISCHA CALYA MAHESWARI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (377, NULL, '218809', NULL, '$2b$10$aLfn1CJ2WvtCFiB9kUX/Pus3qB0NTLlCLv.u2ZXFV0yGfMFG8TweS', 'MUHAMMAD AKBAR AL BAHRI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (378, NULL, '218812', NULL, '$2b$10$/W7HCX3OM54LxO/Mh43YVOG.Xe0SRMHju9e/0p8Tf7TIZA2/xKpti', 'MUHAMMAD FAREL RIZKY MAULANA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (379, NULL, '218820', NULL, '$2b$10$lZU/HfOtRQUhIjqIYpGLZ.xxVXghIBfGoXH6fwaN1O3c23L.iPJT2', 'MUHAMMAD WAHYU UTOMO', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (380, NULL, '218822', NULL, '$2b$10$u/rVAvr9CH9wfXQKa18yyeh8ZhjbLECST8oqqSYJkOUlbbej7GUSq', 'NABILAH DWIPUTRI ANGRAINI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (381, NULL, '218827', NULL, '$2b$10$DTrPTqkyKDMxDSgOYUwHw.n3aOMyrFZnv4Ch9ZpetoApiHKSxaK2S', 'NADYA PUTRI APRILIA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (382, NULL, '218830', NULL, '$2b$10$p.za9ZPhGrGEimeobCLAbeTVfKzQoPX0Tbcmf7lBMoCx.ICS/WvvK', 'NAYLAH ZAHRATUL AULIA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (383, NULL, '218832', NULL, '$2b$10$6cAGN2aKfzuwJSwjFy2vc.AQhci.tY/4qSILNKyvGm53.QSH/wNju', 'NICOLAS OKTA ABDUL GANI', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (384, NULL, '218841', NULL, '$2b$10$mF6iDT4wxGZjpMsRF4KVAeKi5UKqNCmNNFnvjq/pHVpf4eQwYIeTy', 'PRAMANA PUTRA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (385, NULL, '218871', NULL, '$2b$10$olsubZxntX20rzFX5HUs1OrmJtRV1Ji7AGvtqeMG2lUx5vx.TuFQm', 'RIZKI AMELIA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (386, NULL, '218875', NULL, '$2b$10$k.9P3LHNfLchreCOdhXaSeuM17pF9OZ4P1T.1z/m7LjManWG4VQ2G', 'SALMA SALSABILA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (387, NULL, '218878', NULL, '$2b$10$3FGzXoDaCSB5va0syRKmJOYLrSG0p6Pp5GpvxeeAkFDB4YEBh96tW', 'SALWA KEIN SATRYA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);
INSERT INTO `users` VALUES (388, NULL, '218886', NULL, '$2b$10$aXF/2U45swgNijdkbbQ/LunPJlQxO06YFUEbtLLunNuSXtR21WEkO', 'SINTA BELA', '', 'student', 2, '2022-01-14 06:09:29', '2022-01-14 06:09:29', NULL);

SET FOREIGN_KEY_CHECKS = 1;
