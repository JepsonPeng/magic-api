SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for magic_api_info
-- ----------------------------
DROP TABLE IF EXISTS `magic_api_info`;
CREATE TABLE `magic_api_info`  (
  `id` varchar(32)  NOT NULL,
  `api_method` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `api_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `api_script` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口脚本',
  `api_parameter` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口参数',
  `api_option` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口选项',
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `api_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口分组',
  `api_create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `api_update_time` bigint(20) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of magic_api_info
-- ----------------------------
INSERT INTO `magic_api_info` VALUES ('180524e850124de7956d855bc94bcac9', 'GET', '/test/if', '/*\r\n    if 测试\r\n*/\r\nif(a == 1){\r\n    return 1;\r\n}else if(a == 2){\r\n    return 2;\r\n}else{\r\n    return 0;\r\n}', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', 'if测试', '未分组', 1593514724505, 1593514950491);
INSERT INTO `magic_api_info` VALUES ('6cf9a1ad659f4707be704528632778c5', 'GET', '/test/loop/map', '/*\r\n    测试循环Map\r\n*/\r\nvar map = {\r\n    key1 : 1,\r\n    key2 : 2,\r\n    key3 : 3\r\n};\r\nvar sum = 0;\r\nvar keys = \'\';\r\nfor(key,value in map){\r\n    sum = sum + value;\r\n    keys = keys + key\r\n}\r\nreturn keys + \'-\' + sum;', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试循环Map', '未分组', 1593515248339, 1593515248339);
INSERT INTO `magic_api_info` VALUES ('9815c54b31f64a9cb3a068934df21c25', 'GET', '/test/var', '/*\r\n    测试变量定义\r\n*/\r\nvar int = 1; \r\nvar double = 2.0d; //2.0D \r\nvar long =  3L; // 3l\r\nvar float =  4f; // 4F\r\nvar byte =  5b; // 5B;\r\nvar short = 6s; //6S\r\nvar boolean = true; //true or false;\r\nvar nullValue = null; // null\r\nvar list = [1,2,3,4,5]; //定义list\r\nvar map = {\r\n    k1 : 123,\r\n    k2 : \"456\",\r\n    k3 : 789L,\r\n    k4 : {\r\n        k5 : \'...\'\r\n    }\r\n};  //定义map\r\nvar string1 = \"str\";    //定义字符串\r\nvar string2 = \'str2\'; // \\t \\n \\r \\\' \\\" \\\\ 转义符是支持的，其它的不支持\r\n//文本块，主要用于定义SQL\r\nvar string3 = \"\"\"  \r\n    select \r\n        * \r\n    from table t1\r\n    join table2 t2 on t2.xx = t1.xx\r\n    where t1.id in (1,2,3,4,5,6)\r\n\"\"\"\r\n\r\nvar lambda = e=>e+1;    //定义lambda', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试定义变量', '未分组', 1593519576351, 1593520303156);
INSERT INTO `magic_api_info` VALUES ('b7df52ff308e481abceda07d7d3ef62c', 'GET', '/test/binary', '/*\r\n    各种操作符测试\r\n*/\r\nimport \'java.lang.System\' as system;\r\nvar a = 1;\r\nvar b = 2;\r\nsystem.out.println(\"a = \" + a + \", b = \" + b);\r\nvar c = a + b;\r\nsystem.out.println(\"a + b = \" + c);\r\nc = a - b;\r\nsystem.out.println(\"a - b = \" + c);\r\nc = a * b;\r\nsystem.out.println(\"a * b = \" + c);\r\nc = a / b;\r\nsystem.out.println(\"a / b = \" + c);\r\nc = a % b;\r\nsystem.out.println(\"a % b = \" + c);\r\nc = a > b;\r\nsystem.out.println(\"a > b = \" + c);\r\nc = a >= b;\r\nsystem.out.println(\"a >= b = \" + c);\r\nc = a == b;\r\nsystem.out.println(\"a == b = \" + c);\r\nc = a < b;\r\nsystem.out.println(\"a < b = \" + c);\r\nc = a <= b;\r\nsystem.out.println(\"a <= b = \" + c);\r\nc = a != b;\r\nsystem.out.println(\"a != b = \" + c);', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '操作符测试', '未分组', 1593514691506, 1593514691506);
INSERT INTO `magic_api_info` VALUES ('cd3c9e4c09fc44fdb82c0f1b783f59af', 'GET', '/test/loop/list', '/*\r\n    测试循环List\r\n*/\r\nvar list = [1,2,3,4,5];\r\nvar sum = 0;\r\nfor(val in list){\r\n    sum = sum + val;\r\n}\r\nreturn sum;', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试循环List', '未分组', 1593515155753, 1593515155753);
INSERT INTO `magic_api_info` VALUES ('d338de01930f4149b4ea85c9f1f88387', 'GET', '/test/lambda', '/*\r\n    测试Lambda\r\n*/\r\nvar lambda1 = e => e + 1; //单参数单行代码，省略括号,省略{}\r\nvar lambda2 = (e) => e +1; //单参数单行代码，不省略括号，省略{} 作用同上\r\nvar lambda4 = e => {e + 1};//单参数无返回值，不能省略{}\r\nvar lambda5 = e => {return e + 1};//单参数有返回值，省略括号,不省略{}\r\nvar lambda6 = (e) => {return e + 1};//单参数有返回值，不省略括号,不省略{}，作用同上\r\nvar lambda7 = (a,b) => a + b; //多参数单行代码，省略{}\r\nvar lambda7 = (a,b) => {return a + b}; //多参数单行代码，有返回值，作用同上\r\nvar lambda8 = (a,b) =>{ //多参数多行代码， 无法省略括号和{}\r\n    a = a + 1;\r\n    return a + b;\r\n}\r\nvar v1 = lambda1(1);    //返回2\r\nvar v2 = lambda2(v1);    //返回3\r\nreturn lambda8(v1,lambda7(v1,v2)); //返回8\r\n', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试lambda', '未分组', 1593518831250, 1593519140773);
INSERT INTO `magic_api_info` VALUES ('dccb42bc1d974d99b0ebd9a12d42c47b', 'GET', '/test/new', 'import \'java.util.Date\' as Date;\r\nimport \'java.text.SimpleDateFormat\' as SimpleDateFormat;\r\nvar now = new Date();\r\nvar df = new SimpleDateFormat(\'yyyy-MM-dd\');\r\nreturn df.format(now);', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试创建对象', '未分组', 1593525594254, 1593525594254);
INSERT INTO `magic_api_info` VALUES ('ee45724999ad400c927f5a267f6b8676', 'GET', '/test/for', '/*\r\n    测试循环\r\n*/\r\nvar sum = 0;\r\nfor(val in range(0,100)){   //包括0 包括100\r\n    if(val > 90){\r\n        break;  //跳出循环\r\n    }\r\n    if(val % 3 == 0){\r\n        continue;   //进入下一次循环\r\n    }\r\n    sum = sum + val;\r\n}\r\nreturn sum;', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试for循环', '未分组', 1593515005267, 1593520147849);
INSERT INTO `magic_api_info` VALUES ('ff2135698c6e4d1bad0db59195dfe706', 'GET', '/test/sql', 'var sql = \"\"\"\r\n    select \'${message}\' as user_name,#{id} as user_id\r\n\"\"\"\r\nreturn db.select(sql);', '{\r\n	\"request\" : {\r\n		\"message\" : \"Hello MagicAPI!\"\r\n	},\r\n	\"path\" : {\r\n		\"id\" : \"123456\"\r\n	},\r\n	\"header\" : {\r\n		\"token\" : \"tokenValue\"\r\n	},\r\n	\"cookie\" : {\r\n		\"cookieName\" : \"cookieValue\"\r\n	},\r\n	\"session\" : {\r\n		\"userId\" : \"123\"\r\n	}\r\n}', '{\r\n}', '测试执行SQL', '未分组', 1593005960511, 1593870914503);

SET FOREIGN_KEY_CHECKS = 1;
