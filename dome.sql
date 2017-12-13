/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : dome

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 13/12/2017 20:43:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ctime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (1, '12', '12', '2017-12-13 11:52:22', 7);
INSERT INTO `articles` VALUES (2, '12', '12', '2017-12-13 11:57:13', 7);
INSERT INTO `articles` VALUES (3, '12', '12', '2017-12-13 11:58:53', 7);
INSERT INTO `articles` VALUES (4, '12', '12', '2017-12-13 11:59:56', 7);
INSERT INTO `articles` VALUES (5, '12', '12', '2017-12-13 12:40:43', 7);
INSERT INTO `articles` VALUES (6, 'qw', 'qw', '2017-12-13 12:42:52', 7);
INSERT INTO `articles` VALUES (7, '12', '12', '2017-12-13 12:49:40', 7);
INSERT INTO `articles` VALUES (8, '12', '12', '2017-12-13 12:56:32', 7);
INSERT INTO `articles` VALUES (9, 'Node.js - day6（黑马博客案例）', '\r\n\r\n## 学完这个黑马博客以后可以做什么\r\n1. 可以自己尝试着买一个月的阿里 ECS 服务器（不要买虚拟主机）\r\n2. 可以使用Node，利用黑马博客的一些技术点，自己做一个 完整的、带有前后台交互的网站\r\n3. 把做好的网站，部署到自己的 阿里云 ECS 服务器中\r\n4. 这样，只要你把 自己服务器的IP地址，以 80 端口暴露出来，这样，别人就能随时访问你的网站了；\r\n5. 对于网站开发来说，前端是颜值， 后端是灵魂；\r\n\r\n\r\n\r\n## 使用模板引擎处理公共部分\r\n在PHP中，抽取公共的区域，直接使用PHP语法就行；\r\n但是，在Express的框架中，并没有抽取页面公共部分的语法，需要模板引擎提供这样的语法；\r\n\r\n\r\n\r\n## 添加文章并跳转到文章详情\r\n1. 发表文章之前，需要使用 第三方的插件，叫做 `markdown + editor` => `mditor`\r\n2. 注意：`mditor`这个第三方模块，提供了两个功能：\r\n + 功能1： 可以当作一个纯粹的MarkDown编辑器插件，在前端页面中使用；\r\n + 功能2： 在Node端，我们可以`require(\'mditor\')`，使用这个模块，提供的方法，把`markdown`文本，解析转换为`HTML`内容；\r\n\r\n\r\n## 设计文章表的字段\r\n![文章字段设计](./文章表字段设计.png)\r\n\r\n\r\n## 完成文章编辑功能\r\n\r\n\r\n## 首页文章列表渲染\r\n\r\n\r\n## 使用Sql语句进行联表查询\r\n\r\n\r\n## 首页文章列表分页功能的实现\r\n\r\n\r\n## 相关文章\r\n1. [node.js中express-session配置项详解](http://blog.csdn.net/liangklfang/article/details/50998959)\r\n2. [MD5在线生成器1](http://www.cmd5.com/)\r\n3. [MD5在线生成器2](http://pmd5.com/)\r\n4. [JavaScript-MD5](https://github.com/blueimp/JavaScript-MD5)', '2017-12-13 13:19:24', 7);
INSERT INTO `articles` VALUES (10, '12', '12', '2017-12-13 14:50:48', 7);
INSERT INTO `articles` VALUES (11, '12', '1212', '2017-12-13 17:02:09', 7);
INSERT INTO `articles` VALUES (12, '12', '1212', '2017-12-13 17:08:37', 7);
INSERT INTO `articles` VALUES (13, '12', '121212', '2017-12-13 17:25:31', 7);

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdel` tinyint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 'ls', '123', '12', 0);
INSERT INTO `blog` VALUES (2, 'haha', '123', '12', 0);
INSERT INTO `blog` VALUES (3, 'wh', '12345', '12', 0);
INSERT INTO `blog` VALUES (4, '哈哈', '12', '12', 0);
INSERT INTO `blog` VALUES (5, '宁', '12', '小宁', 0);
INSERT INTO `blog` VALUES (6, 'hehe', '12', '12', 0);
INSERT INTO `blog` VALUES (7, '12', '12', '12', 0);
INSERT INTO `blog` VALUES (8, '121', '12', '12', 0);
INSERT INTO `blog` VALUES (9, '123', '123', '12', 0);
INSERT INTO `blog` VALUES (10, '12345', '12', '12', 0);
INSERT INTO `blog` VALUES (11, '123456', '12', '12', 0);
INSERT INTO `blog` VALUES (12, '123432', '12', '12', 0);
INSERT INTO `blog` VALUES (13, 'heihei', '12', 'nn', 0);

-- ----------------------------
-- Table structure for heros
-- ----------------------------
DROP TABLE IF EXISTS `heros`;
CREATE TABLE `heros`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctime` varchar(222) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdel` tinyint(255) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heros
-- ----------------------------
INSERT INTO `heros` VALUES (1, '王昭君', '女', '2010-12-12 12:12:12', 0);
INSERT INTO `heros` VALUES (2, '鲁班', '男', '20-12-12', 0);
INSERT INTO `heros` VALUES (3, '亚瑟', '男', '2012-12-12', 0);
INSERT INTO `heros` VALUES (4, '李白', '男', '2012-12-12', 0);
INSERT INTO `heros` VALUES (5, '哈哈', 'yao', '2012-12-1', 1);
INSERT INTO `heros` VALUES (6, '哈哈', 'yao', '2017-12-10 17:38:22', 0);
INSERT INTO `heros` VALUES (7, '哈哈', 'yao', '2017-12-10 17:38:54', 0);
INSERT INTO `heros` VALUES (8, '哈哈', 'yao', '2017-12-10 17:40:00', 0);
INSERT INTO `heros` VALUES (9, '哈哈', 'yao', '2017-12-10 17:40:53', 0);
INSERT INTO `heros` VALUES (10, '哈哈', 'yao', '2017-12-10 17:59:48', 0);

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `artist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `images` int(11) DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (2, '飘扬', '刘德华', 1, '12');
INSERT INTO `song` VALUES (3, '哈哈', 'cc', 34, 'dd');
INSERT INTO `song` VALUES (4, '宁宁', 'pp', 3, '22');
INSERT INTO `song` VALUES (5, '宁宁', '宁宁', 221, 'abc');
INSERT INTO `song` VALUES (6, '宁宁', '宁宁', 221, 'abc');
INSERT INTO `song` VALUES (7, '宁宁', '宁宁', 221, 'abc');
INSERT INTO `song` VALUES (8, '宁宁', '宁宁', 221, 'abc');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (1, '品牌女装', 0);
INSERT INTO `title` VALUES (2, '精品男装', 0);
INSERT INTO `title` VALUES (3, '精品内衣', 0);
INSERT INTO `title` VALUES (4, '服饰配件', 0);
INSERT INTO `title` VALUES (5, '裙子', 1);
INSERT INTO `title` VALUES (6, '半身裙', 5);
INSERT INTO `title` VALUES (7, '旗袍', 5);
INSERT INTO `title` VALUES (8, '针织衫', 1);
INSERT INTO `title` VALUES (9, '皮衣', 2);
INSERT INTO `title` VALUES (10, '皮夹克', 9);

SET FOREIGN_KEY_CHECKS = 1;
