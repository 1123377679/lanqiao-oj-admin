/*
 Navicat Premium Dump SQL

 Source Server         : LMX
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : my_oj

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 19/11/2024 22:17:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '帖子收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '帖子点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目答案',
  `submitNum` int NOT NULL DEFAULT 0 COMMENT '题目提交数',
  `acceptedNum` int NOT NULL DEFAULT 0 COMMENT '题目通过数',
  `judgeCase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题用例（json 数组）',
  `judgeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题配置（json 对象）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `codeTemplate` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目代码模版',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1853788763736973314 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1846035594214785025, 'AA', '# 题目介绍\n\n实现A+B\n\n# 输入\n\n两个参数 a b\n\n# 输出\n\na+b\n\n# 实例\n\n```\n1 2\n```\n\n# 输出\n\n```\n3\n```\n\n', '[\"堆\",\"简单\"]', '暴力', 0, 0, '[{\"input\":\"2 2\",\"output\":\"4\"}]', '{\"timeLimit\":6000,\"memoryLimit\":6000,\"stackLimit\":6000}', 0, 0, 1846030530901323778, '2024-10-15 11:49:18', '2024-11-05 11:00:12', 0, 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b) {\r\n        // 补全代码\r\n       \r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}');
INSERT INTO `question` VALUES (1853077086003421186, '确定字符串是否包含唯一字符', '# 题目描述\n实现一个算法来识别一个字符串的字符是否是唯一的（忽略字母大小写）。\n\n若唯一，则输出YES，否则输出NO。\n\n# 输入描述\n输入一行字符串，长度不超过 100。\n\n# 输出描述\n输出一行，若字符串的字符是唯一的，则输出YES，否则输出NO。\n\n# 输入输出样例\n## 示例\n输入\n\nabd25+\n\n输出\n\nYES\n\n# 运行限制\n最大运行时间：1s\n最大运行内存: 256M', '[\"新手\"]', '', 0, 0, '[{\"input\":\"abd25+\",\"output\":\"YES\"},{\"input\":\"aaabbb\",\"output\":\"NO\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1846030530901323778, '2024-11-03 22:09:40', '2024-11-03 22:10:24', 0, '');
INSERT INTO `question` VALUES (1853788580299087873, '音节判断', '# 题目描述\n小明对类似于 hello 这种单词非常感兴趣，这种单词可以正好分为四段，第一段由一个或多个辅音字母组成，第二段由一个或多个元音字母组成，第三段由一个或多个辅音字母组成，第四段由一个或多个元音字母组成。\n\n给定一个单词，请判断这个单词是否也是这种单词，如果是请输出yes，否则请输出no。\n\n元音字母包括 a, e, i, o, u，共五个，其他均为辅音字母。\n\n# 输入描述\n输入一行，包含一个单词，单词中只包含小写英文字母。单词中的字母个数不超过 100。\n\n# 输出描述\n输出答案，或者为yes，或者为no。\n\n# 输入输出样例\n示例\n输入\n\n`lanqiao`\n\n输出\nyes\n\n运行限制\n最大运行时间：1s\n最大运行内存: 256M', '[\"模拟\"]', '', 0, 0, '[{\"input\":\"lanqiao\",\"output\":\"yes\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1846030530901323778, '2024-11-05 21:16:53', '2024-11-05 21:17:46', 1, 'public class Main {\n\n        public static void main(String[] args) {\n            String str = String.valueOf(args[0]);\n            boolean extracted = extracted(str);\n            if (extracted){\n                System.out.println(\"yes\");\n            }else {\n                System.out.println(\"no\");\n            }\n        }\n    \n        //实现题目算法\n        private static boolean extracted(String str) {\n            \n        }\n}');
INSERT INTO `question` VALUES (1853788599639023618, '音节判断', '# 题目描述\n小明对类似于 hello 这种单词非常感兴趣，这种单词可以正好分为四段，第一段由一个或多个辅音字母组成，第二段由一个或多个元音字母组成，第三段由一个或多个辅音字母组成，第四段由一个或多个元音字母组成。\n\n给定一个单词，请判断这个单词是否也是这种单词，如果是请输出yes，否则请输出no。\n\n元音字母包括 a, e, i, o, u，共五个，其他均为辅音字母。\n\n# 输入描述\n输入一行，包含一个单词，单词中只包含小写英文字母。单词中的字母个数不超过 100。\n\n# 输出描述\n输出答案，或者为yes，或者为no。\n\n# 输入输出样例\n示例\n输入\n\n`lanqiao`\n\n输出\nyes\n\n运行限制\n最大运行时间：1s\n最大运行内存: 256M', '[\"模拟\"]', '', 0, 0, '[{\"input\":\"lanqiao\",\"output\":\"yes\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1846030530901323778, '2024-11-05 21:16:58', '2024-11-05 21:17:47', 1, 'public class Main {\n\n        public static void main(String[] args) {\n            String str = String.valueOf(args[0]);\n            boolean extracted = extracted(str);\n            if (extracted){\n                System.out.println(\"yes\");\n            }else {\n                System.out.println(\"no\");\n            }\n        }\n    \n        //实现题目算法\n        private static boolean extracted(String str) {\n            \n        }\n}');
INSERT INTO `question` VALUES (1853788763736973313, '音节判断', '# 题目描述\n小明对类似于 hello 这种单词非常感兴趣，这种单词可以正好分为四段，第一段由一个或多个辅音字母组成，第二段由一个或多个元音字母组成，第三段由一个或多个辅音字母组成，第四段由一个或多个元音字母组成。\n\n给定一个单词，请判断这个单词是否也是这种单词，如果是请输出yes，否则请输出no。\n\n元音字母包括 a, e, i, o, u，共五个，其他均为辅音字母。\n\n# 输入描述\n输入一行，包含一个单词，单词中只包含小写英文字母。单词中的字母个数不超过 100。\n\n# 输出描述\n输出答案，或者为yes，或者为no。\n\n# 输入输出样例\n示例\n输入\n\n`lanqiao`\n\n输出\nyes\n\n运行限制\n最大运行时间：1s\n最大运行内存: 256M', '[\"模拟\"]', '', 0, 0, '[{\"input\":\"lanqiao\",\"output\":\"yes\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1846030530901323778, '2024-11-05 21:17:37', '2024-11-05 21:17:37', 0, 'public class Main {\n\n        public static void main(String[] args) {\n            String str = String.valueOf(args[0]);\n            boolean extracted = extracted(str);\n            if (extracted){\n                System.out.println(\"yes\");\n            }else {\n                System.out.println(\"no\");\n            }\n        }\n    \n        //实现题目算法\n        private static boolean extracted(String str) {\n            \n        }\n}');

-- ----------------------------
-- Table structure for question_submit
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编程语言',
  `code` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户代码',
  `judgeInfo` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '判题信息（json 对象）',
  `status` int NOT NULL DEFAULT 0 COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint NOT NULL COMMENT '题目 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionId`(`questionId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1854131762043998211 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '题目提交' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES (1845862339256389633, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:20:50', '2024-10-15 00:20:50', 0);
INSERT INTO `question_submit` VALUES (1845863115282321410, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:23:55', '2024-10-15 00:23:55', 0);
INSERT INTO `question_submit` VALUES (1845864045474091009, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:27:37', '2024-10-15 00:27:37', 0);
INSERT INTO `question_submit` VALUES (1845864699374505986, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:30:13', '2024-10-15 00:30:13', 0);
INSERT INTO `question_submit` VALUES (1845865419616182274, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:33:05', '2024-10-15 00:33:05', 0);
INSERT INTO `question_submit` VALUES (1845866937778073602, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:39:07', '2024-10-15 00:39:07', 0);
INSERT INTO `question_submit` VALUES (1845867021966143489, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:39:27', '2024-10-15 00:39:27', 0);
INSERT INTO `question_submit` VALUES (1845867245300228097, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:40:20', '2024-10-15 00:40:31', 0);
INSERT INTO `question_submit` VALUES (1845867849678503937, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:42:44', '2024-10-15 00:42:44', 0);
INSERT INTO `question_submit` VALUES (1845868191728164865, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        System.out.println(1111)\r\n        sss\r\n    }\r\n}', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:44:06', '2024-10-15 00:44:06', 0);
INSERT INTO `question_submit` VALUES (1845868506707824641, 'java', 'aaaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:45:21', '2024-10-15 00:45:21', 0);
INSERT INTO `question_submit` VALUES (1845870267707334658, 'java', 'aaaaaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:52:21', '2024-10-15 00:52:21', 0);
INSERT INTO `question_submit` VALUES (1845870465074503681, 'java', 'aaaaaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 00:53:08', '2024-10-15 00:53:08', 0);
INSERT INTO `question_submit` VALUES (1845871147592622082, 'java', 'aaaaa', '{}', 1, 2, 1844390018243018754, '2024-10-15 00:55:50', '2024-10-15 00:55:50', 0);
INSERT INTO `question_submit` VALUES (1845871462345805826, 'java', 'aaaaa', '{}', 1, 2, 1844390018243018754, '2024-10-15 00:57:05', '2024-10-15 00:57:05', 0);
INSERT INTO `question_submit` VALUES (1845871677215817729, 'java', 'aaa', '{}', 1, 2, 1844390018243018754, '2024-10-15 00:57:57', '2024-10-15 00:57:57', 0);
INSERT INTO `question_submit` VALUES (1845872224048123906, 'java', 'aaa', '{}', 1, 2, 1844390018243018754, '2024-10-15 01:00:07', '2024-10-15 01:00:07', 0);
INSERT INTO `question_submit` VALUES (1845874398924816386, 'java', 'aa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:08:46', '2024-10-15 01:08:46', 0);
INSERT INTO `question_submit` VALUES (1845875047007698946, 'java', 'aa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:11:20', '2024-10-15 01:11:20', 0);
INSERT INTO `question_submit` VALUES (1845875609489039362, 'java', 'aaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:13:34', '2024-10-15 01:13:34', 0);
INSERT INTO `question_submit` VALUES (1845877497101971457, 'java', 'aaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:21:04', '2024-10-15 01:21:32', 0);
INSERT INTO `question_submit` VALUES (1845878371580825602, 'java', 'aaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:24:33', '2024-10-15 01:24:53', 0);
INSERT INTO `question_submit` VALUES (1845878843565830145, 'java', 'aaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:26:25', '2024-10-15 01:26:25', 0);
INSERT INTO `question_submit` VALUES (1845879854690918401, 'java', 'aaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:30:26', '2024-10-15 01:30:26', 0);
INSERT INTO `question_submit` VALUES (1845880976046485506, 'java', 'aaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:34:54', '2024-10-15 01:34:54', 0);
INSERT INTO `question_submit` VALUES (1845882382895730689, 'java', 'aaaaaa', '{}', 1, 1, 1844390018243018754, '2024-10-15 01:40:29', '2024-10-15 01:40:29', 0);
INSERT INTO `question_submit` VALUES (1846030866680524801, 'java', 'aaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:30:30', '2024-10-15 11:30:30', 0);
INSERT INTO `question_submit` VALUES (1846031300761632769, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:32:14', '2024-10-15 11:32:14', 0);
INSERT INTO `question_submit` VALUES (1846032072207441922, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:35:18', '2024-10-15 11:35:18', 0);
INSERT INTO `question_submit` VALUES (1846032098161795073, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:35:24', '2024-10-15 11:35:24', 0);
INSERT INTO `question_submit` VALUES (1846032424642224129, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:36:42', '2024-10-15 11:36:42', 0);
INSERT INTO `question_submit` VALUES (1846033034892476417, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:39:07', '2024-10-15 11:39:07', 0);
INSERT INTO `question_submit` VALUES (1846033069956857857, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:39:16', '2024-10-15 11:39:16', 0);
INSERT INTO `question_submit` VALUES (1846033202266177537, 'java', 'aaaaaa', '{}', 1, 1, 1846030530901323778, '2024-10-15 11:39:47', '2024-10-15 11:39:47', 0);
INSERT INTO `question_submit` VALUES (1846035638523412481, 'java', 'aaaaaa', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-10-15 11:49:28', '2024-10-15 11:49:28', 0);
INSERT INTO `question_submit` VALUES (1846038394483130369, 'java', '3 3 ', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-10-15 12:00:25', '2024-10-15 12:00:25', 0);
INSERT INTO `question_submit` VALUES (1852027724922019842, 'java', 'asdasdsads', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:39:53', '2024-11-01 00:39:53', 0);
INSERT INTO `question_submit` VALUES (1852027823341363201, 'java', 'asdasdsads=', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:40:16', '2024-11-01 00:40:16', 0);
INSERT INTO `question_submit` VALUES (1852028943342166018, 'java', 'asdasdsads=', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:44:43', '2024-11-01 00:44:43', 0);
INSERT INTO `question_submit` VALUES (1852029116785025026, 'java', 'asdasdsads=', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:45:25', '2024-11-01 00:45:25', 0);
INSERT INTO `question_submit` VALUES (1852029263237537793, 'java', 'asdasdsads=', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:46:00', '2024-11-01 00:46:00', 0);
INSERT INTO `question_submit` VALUES (1852029568947769346, 'java', 'asdasdsads=', '{\"message\":\"Wrong Answer\",\"memory\":100,\"time\":100}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:47:12', '2024-11-01 00:47:13', 0);
INSERT INTO `question_submit` VALUES (1852030277306957825, 'java', 'asdasdsads=', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-01 00:50:01', '2024-11-01 00:50:01', 0);
INSERT INTO `question_submit` VALUES (1852030744137187330, 'java', 'public class Main{\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果是:\"+(a+b));\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"time\":103}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:51:53', '2024-11-01 00:52:07', 0);
INSERT INTO `question_submit` VALUES (1852030867932069890, 'java', 'public class Main{\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果是:\"+(a+b));\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"time\":96}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:52:22', '2024-11-01 00:52:30', 0);
INSERT INTO `question_submit` VALUES (1852031602962874369, 'java', 'public class Main{\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果是:\"+(a+b));\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"time\":122}', 2, 1846035594214785025, 1846030530901323778, '2024-11-01 00:55:17', '2024-11-01 00:57:12', 0);
INSERT INTO `question_submit` VALUES (1853046746174140418, 'java', 'public class Main{\r\n    Scanner sc = new Scanner(System.in);\r\n    int a = sc.nextInt();\r\n    int b = sc.nextInt();\r\n    System.out.println(a+b);\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:09:06', '2024-11-03 20:09:06', 0);
INSERT INTO `question_submit` VALUES (1853048453599801345, 'java', 'public class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:15:53', '2024-11-03 20:15:53', 0);
INSERT INTO `question_submit` VALUES (1853048606293430273, 'java', 'public class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:16:30', '2024-11-03 20:16:30', 0);
INSERT INTO `question_submit` VALUES (1853048724522471425, 'java', 'public class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:16:58', '2024-11-03 20:16:58', 0);
INSERT INTO `question_submit` VALUES (1853048779883089922, 'java', 'public class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:17:11', '2024-11-03 20:17:11', 0);
INSERT INTO `question_submit` VALUES (1853048885139148802, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:17:36', '2024-11-03 20:17:36', 0);
INSERT INTO `question_submit` VALUES (1853049043667116034, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:18:14', '2024-11-03 20:18:14', 0);
INSERT INTO `question_submit` VALUES (1853049179990384642, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:18:47', '2024-11-03 20:18:47', 0);
INSERT INTO `question_submit` VALUES (1853049318645686273, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:19:20', '2024-11-03 20:19:20', 0);
INSERT INTO `question_submit` VALUES (1853049786818093058, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:21:11', '2024-11-03 20:21:25', 0);
INSERT INTO `question_submit` VALUES (1853052595697344514, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:32:21', '2024-11-03 20:32:23', 0);
INSERT INTO `question_submit` VALUES (1853052717034364930, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:32:50', '2024-11-03 20:33:06', 0);
INSERT INTO `question_submit` VALUES (1853053781632606210, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:37:05', '2024-11-03 20:37:07', 0);
INSERT INTO `question_submit` VALUES (1853053981470171137, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:37:51', '2024-11-03 20:37:59', 0);
INSERT INTO `question_submit` VALUES (1853054055000498177, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:38:09', '2024-11-03 20:38:09', 0);
INSERT INTO `question_submit` VALUES (1853054133723389953, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:38:28', '2024-11-03 20:38:28', 0);
INSERT INTO `question_submit` VALUES (1853054225679310849, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:38:50', '2024-11-03 20:38:50', 0);
INSERT INTO `question_submit` VALUES (1853054493896622082, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:39:54', '2024-11-03 20:39:54', 0);
INSERT INTO `question_submit` VALUES (1853055433873735681, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:43:38', '2024-11-03 20:43:38', 0);
INSERT INTO `question_submit` VALUES (1853055946233135105, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 20:45:40', '2024-11-03 20:45:40', 0);
INSERT INTO `question_submit` VALUES (1853056311284359170, 'java', 'import java.util.Scanner;\r\npublic class Main{\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5017}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:47:07', '2024-11-03 20:47:12', 0);
INSERT INTO `question_submit` VALUES (1853056889905373185, 'java', 'import java.util.Scanner;\r\npublic class Main{\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5021}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:49:25', '2024-11-03 20:49:30', 0);
INSERT INTO `question_submit` VALUES (1853057289609961473, 'java', 'import java.util.Scanner;\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5037}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:51:00', '2024-11-03 20:51:06', 0);
INSERT INTO `question_submit` VALUES (1853058106232561666, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":3730}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:54:15', '2024-11-03 20:56:23', 0);
INSERT INTO `question_submit` VALUES (1853058668533538817, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":126440}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:56:29', '2024-11-03 20:59:06', 0);
INSERT INTO `question_submit` VALUES (1853059348023369730, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":22935}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 20:59:11', '2024-11-03 21:01:21', 0);
INSERT INTO `question_submit` VALUES (1853060333013721089, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":56397}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:03:06', '2024-11-03 21:05:46', 0);
INSERT INTO `question_submit` VALUES (1853061610426753025, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public staitc void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-03 21:08:10', '2024-11-03 21:08:10', 0);
INSERT INTO `question_submit` VALUES (1853061736620777473, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5010}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:08:40', '2024-11-03 21:08:49', 0);
INSERT INTO `question_submit` VALUES (1853061941114068993, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":10016}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:09:29', '2024-11-03 21:09:40', 0);
INSERT INTO `question_submit` VALUES (1853063058002698241, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5012}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:13:55', '2024-11-03 21:14:01', 0);
INSERT INTO `question_submit` VALUES (1853063703099236353, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n       int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果是:\"+(a+b));\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":87}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:16:29', '2024-11-03 21:16:30', 0);
INSERT INTO `question_submit` VALUES (1853064386913394690, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n       int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a+b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":87}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:19:12', '2024-11-03 21:19:13', 0);
INSERT INTO `question_submit` VALUES (1853065335908229121, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a+b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":88}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:22:59', '2024-11-03 21:22:59', 0);
INSERT INTO `question_submit` VALUES (1853065556155326465, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5023}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:23:51', '2024-11-03 21:23:57', 0);
INSERT INTO `question_submit` VALUES (1853065866823229441, 'java', 'import java.util.Scanner;\r\n\r\npublic class Main{\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int a = sc.nextInt();\r\n        int b = sc.nextInt();\r\n        System.out.println(a+ b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5016}', 2, 1846035594214785025, 1846030530901323778, '2024-11-03 21:25:05', '2024-11-03 21:25:11', 0);
INSERT INTO `question_submit` VALUES (1853077396948148226, 'java', 'import java.util.Scanner;\r\n\r\n/**\r\n * @Author: 李某人\r\n * @Date: 2024/04/25/18:06\r\n * @Description:\r\n */\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        String str = sc.next();\r\n        boolean result = true;\r\n        outerloop:\r\n        for (int i = 0 ; i < str.length();i++){\r\n            for (int j = i+1 ; j<str.length();j++){\r\n                char a = str.charAt(i);\r\n                char b = str.charAt(j);\r\n                if (String.valueOf(a).equals(String.valueOf(b))){\r\n                    System.out.println(\"NO\");\r\n                    result = false;\r\n                    break outerloop;\r\n                }\r\n            }\r\n        }\r\n        if (result){\r\n            System.out.println(\"YES\");\r\n        }\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":5035}', 2, 1853077086003421186, 1846030530901323778, '2024-11-03 22:10:54', '2024-11-03 22:11:05', 0);
INSERT INTO `question_submit` VALUES (1853077666574786561, 'java', 'import java.util.Scanner;\r\n\r\n/**\r\n * @Author: 李某人\r\n * @Date: 2024/04/25/18:06\r\n * @Description:\r\n */\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        String a = String.valueOf(args[0]);\r\n        boolean result = true;\r\n        outerloop:\r\n        for (int i = 0 ; i < str.length();i++){\r\n            for (int j = i+1 ; j<str.length();j++){\r\n                char a = str.charAt(i);\r\n                char b = str.charAt(j);\r\n                if (String.valueOf(a).equals(String.valueOf(b))){\r\n                    System.out.println(\"NO\");\r\n                    result = false;\r\n                    break outerloop;\r\n                }\r\n            }\r\n        }\r\n        if (result){\r\n            System.out.println(\"YES\");\r\n        }\r\n    }\r\n}', '{}', 1, 1853077086003421186, 1846030530901323778, '2024-11-03 22:11:58', '2024-11-03 22:11:58', 0);
INSERT INTO `question_submit` VALUES (1853077795901956098, 'java', 'import java.util.Scanner;\r\n\r\n/**\r\n * @Author: 李某人\r\n * @Date: 2024/04/25/18:06\r\n * @Description:\r\n */\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        String str = String.valueOf(args[0]);\r\n        boolean result = true;\r\n        outerloop:\r\n        for (int i = 0 ; i < str.length();i++){\r\n            for (int j = i+1 ; j<str.length();j++){\r\n                char a = str.charAt(i);\r\n                char b = str.charAt(j);\r\n                if (String.valueOf(a).equals(String.valueOf(b))){\r\n                    System.out.println(\"NO\");\r\n                    result = false;\r\n                    break outerloop;\r\n                }\r\n            }\r\n        }\r\n        if (result){\r\n            System.out.println(\"YES\");\r\n        }\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":90}', 2, 1853077086003421186, 1846030530901323778, '2024-11-03 22:12:29', '2024-11-03 22:12:30', 0);
INSERT INTO `question_submit` VALUES (1853632404953423874, 'java', 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b) {\r\n        // 用户只需要专注于实现计算逻辑\r\n        return a + b;\r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":122}', 2, 1846035594214785025, 1846030530901323778, '2024-11-05 10:56:18', '2024-11-05 10:56:20', 0);
INSERT INTO `question_submit` VALUES (1853632600605122562, 'java', 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b,int c) {\r\n        // 用户只需要专注于实现计算逻辑\r\n        return a + b + c;\r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b,c);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}', '{}', 1, 1846035594214785025, 1846030530901323778, '2024-11-05 10:57:05', '2024-11-05 10:57:05', 0);
INSERT INTO `question_submit` VALUES (1853724147254251522, 'java', 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b) {\r\n        // 补全代码\r\n        return a + b;\r\n       \r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":128}', 2, 1846035594214785025, 1846030530901323778, '2024-11-05 17:00:51', '2024-11-05 17:00:53', 0);
INSERT INTO `question_submit` VALUES (1853789029911699458, 'java', 'public class Main {\r\n\r\n        public static void main(String[] args) {\r\n            String str = String.valueOf(args[0]);\r\n            boolean extracted = extracted(str);\r\n            if (extracted){\r\n                System.out.println(\"yes\");\r\n            }else {\r\n                System.out.println(\"no\");\r\n            }\r\n        }\r\n    \r\n        //实现题目算法\r\n        private static boolean extracted(String str) {\r\n              if(str.matches(\"[^a|^e|^i|^o|^u]+[a|e|i|o|u]+[^a|^e|^i|^o|^u]+[a|e|i|o|u]+\")) {\r\n            return true;\r\n        }else {\r\n            return false;\r\n        }\r\n        }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":108}', 2, 1853788763736973313, 1846030530901323778, '2024-11-05 21:18:41', '2024-11-05 21:18:42', 0);
INSERT INTO `question_submit` VALUES (1853789317452210178, 'java', 'public class Main {\r\n\r\n        public static void main(String[] args) {\r\n            String str = String.valueOf(args[0]);\r\n            boolean extracted = extracted(str);\r\n            if (extracted){\r\n                System.out.println(\"yes\");\r\n            }else {\r\n                System.out.println(\"no\");\r\n            }\r\n        }\r\n    \r\n        //实现题目算法\r\n        private static boolean extracted(String str) {\r\n               if(str.matches(\"[^a|^e|^i|^o|^u]+[a|e|i|o|u]+[^a|^e|^i|^o|^u]+[a|e|i|o|u]+\")) {\r\n            return true;\r\n        }else {\r\n            return false;\r\n        }\r\n        }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":157}', 2, 1853788763736973313, 1846030530901323778, '2024-11-05 21:19:49', '2024-11-05 21:19:50', 0);
INSERT INTO `question_submit` VALUES (1854005229870522369, 'java', 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b) {\r\n        // 补全代码\r\n        return a + b;\r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}\r\n', '{\"message\":\"Accepted\",\"memory\":0,\"time\":85}', 2, 1846035594214785025, 1846030530901323778, '2024-11-06 11:37:47', '2024-11-06 11:37:48', 0);
INSERT INTO `question_submit` VALUES (1854131762043998210, 'java', 'public class Main{\r\n    // 方法用于检查输入并计算结果\r\n    public static int calculateSum(int a, int b) {\r\n        // 补全代码\r\n       return a +b;\r\n    }\r\n    public static void main(String[] args) {\r\n        // 平台负责读取输入\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        int result  = calculateSum(a, b);\r\n        // 平台负责输出\r\n        System.out.println(result);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":81}', 2, 1846035594214785025, 1846030530901323778, '2024-11-06 20:00:34', '2024-11-06 20:00:35', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1854007754610843650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1843640161903554562, 'lmx66', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, NULL, NULL, NULL, 'user', '2024-10-08 21:10:42', '2024-10-08 21:10:42', 0);
INSERT INTO `user` VALUES (1844390018243018754, 'lmx123', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, 'lmx', NULL, NULL, 'admin', '2024-10-10 22:50:22', '2024-10-10 22:57:38', 0);
INSERT INTO `user` VALUES (1846030530901323778, 'lmxdxl', 'ec5f9ea8e6edf7e4259d982b89ca9dea', NULL, NULL, 'lmx', NULL, NULL, 'admin', '2024-10-15 11:29:10', '2024-11-01 16:05:16', 0);
INSERT INTO `user` VALUES (1854007754610843649, 'dxl123', 'ec5f9ea8e6edf7e4259d982b89ca9dea', NULL, NULL, 'dxl', NULL, NULL, 'user', '2024-11-06 11:47:49', '2024-11-06 11:47:49', 0);

SET FOREIGN_KEY_CHECKS = 1;
