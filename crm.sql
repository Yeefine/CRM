/*
Navicat MySQL Data Transfer

Source Server         : yeefine
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-07-10 15:46:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startDate` char(10) DEFAULT NULL,
  `endDate` char(10) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('0aa817d5817b4dc3b2e2fbdb21b0aaa7', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单1', '2021-06-29', '2021-07-30', '11', '1231', '2021-06-30 16:39:32', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('274d882b487d440ab7e19c4813b628ec', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单2', '2021-06-09', '2021-07-15', '13', '123134', '2021-06-30 16:39:52', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('4f7cb1149e794f58ada8bfec84272078', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单3', '2021-06-30', '2021-07-07', '11', '11', '2021-07-01 20:28:29', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('5059eee12c5146e6a553c60442431b42', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单4', '2021-06-30', '2021-07-14', '1000', '123', '2021-06-30 10:34:25', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('6bec2b0c10f24d88bc8c182200345229', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单5', '2021-06-15', '2021-07-20', '111', '12313412', '2021-06-30 16:40:07', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('722959fd65e24522b1b4204ae82f30a9', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单6', '2021-06-03', '2021-06-15', '13', 'asd', '2021-06-30 16:42:38', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('819a589bec7441b68a66317a2ca54d86', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单7', '2021-06-28', '2021-07-03', '13', '12', '2021-07-01 20:47:58', '张三', '2021-07-04 16:58:27', '张三');
INSERT INTO `tbl_activity` VALUES ('837e1ca426094033bc5fc854c2920987', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单8', '2021-06-23', '2021-06-24', '11', 'qwr', '2021-06-30 16:42:01', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('96c30d1bde53492d83bb4bc640e6752b', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单9', '2021-06-03', '2021-06-15', '13', 'asd', '2021-06-30 16:42:19', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('a658aa4f40f548e0a73ebfd27b22c32d', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单10', '2021-06-03', '2021-06-15', '13', 'asd', '2021-06-30 16:42:26', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('f05dee95d7694c5596518f735e5aef47', '40f6cdea0bd34aceb77492a1656d9fb3', '百度推广abc2', '2021-07-01', '2021-07-12', '1', '1', '2021-07-01 20:27:39', '张三', '2021-07-01 20:53:04', '张三');

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL COMMENT '0��ʾδ�޸ģ�1��ʾ���޸�',
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('4ea36ea119a9470a9eb29f7120983a82', '备注abc', '2021-07-02 16:32:24', '张三', '2021-07-04 17:07:17', '张三', '1', '819a589bec7441b68a66317a2ca54d86');
INSERT INTO `tbl_activity_remark` VALUES ('819a589bec7441b68a66317a2ca54da1', '备注1（百度推广aaa）', '2021-07-01 20:47:58', '张三', '2021-07-02 20:46:33', '张三', '1', '819a589bec7441b68a66317a2ca54d86');
INSERT INTO `tbl_activity_remark` VALUES ('819a589bec7441b68a66317a2ca54da2', '备注2（百度推广abc）', '2021-07-01 21:47:58', '张三', null, null, '0', '819a589bec7441b68a66317a2ca54d86');
INSERT INTO `tbl_activity_remark` VALUES ('819a589bec7441b68a66317a2ca54da4', '备注4（发传单1）', null, '张三', null, null, '0', '5059eee12c5146e6a553c60442431b42');
INSERT INTO `tbl_activity_remark` VALUES ('fc90b8452af94441811f99df6b6ba417', '备注123', '2021-07-04 17:06:20', '张三', null, null, '0', '4f7cb1149e794f58ada8bfec84272078');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue` (
  `id` char(32) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('100f196543b1458987c9de5b6acf5203', '王健林', '先生', '40f6cdea0bd34aceb77492a1656d9fb3', '万达集团', 'CEO', 'wjl@wd.com', '1373094289', 'www.wd.com', '1344524124', '将来联系', '公开媒介', '张三', '2021-07-05 14:47:56', null, null, '123', '123', '2021-07-21', '123');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation` (
  `id` char(32) NOT NULL,
  `clueId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('911cf0b34a554330bc709d665c7803bd', '100f196543b1458987c9de5b6acf5203', '5059eee12c5146e6a553c60442431b42');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `clueId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('911cf0b34a554330bc709d665c7803bd', '备注4（属于王健林）', null, null, null, null, null, '100f196543b1458987c9de5b6acf5203');

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('7f5c80e060b749c286bab134a1d0992c', '40f6cdea0bd34aceb77492a1656d9fb3', '合作伙伴', '52aa48bfb9df4dbe9aebfc838dd8c110', '马云', '先生', 'my@aliyun.com', '1243453', 'CEO', null, '张三', '2021-07-07 15:02:39', null, null, '描述123', '纪要123', '2021-07-14', '地址123');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation` (
  `id` char(32) NOT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('0c6dde56f1f4438ebf309763d24c238d', '7f5c80e060b749c286bab134a1d0992c', '0aa817d5817b4dc3b2e2fbdb21b0aaa7');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('6dc19e59e2214a399530bb6f54d6bece', '7f5c80e060b749c286bab134a1d0992c', '4f7cb1149e794f58ada8bfec84272078');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('e59072b064e04f328e03a5072923ca08', '7f5c80e060b749c286bab134a1d0992c', '274d882b487d440ab7e19c4813b628ec');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('5b2c28bf6a4b42d389d3de11fee7afbd', '备注1（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '7f5c80e060b749c286bab134a1d0992c');
INSERT INTO `tbl_contacts_remark` VALUES ('adbd33d46c4747df914411309f29b786', '备注3（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '7f5c80e060b749c286bab134a1d0992c');
INSERT INTO `tbl_contacts_remark` VALUES ('e07d47cb07aa41dc8134e22777addef1', '备注2（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '7f5c80e060b749c286bab134a1d0992c');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('03e1b21571af4c398ff80944f1ea0494', '40f6cdea0bd34aceb77492a1656d9fb3', '百度集团', null, null, '张三', '2021-07-08 10:25:58', null, null, '123', '2021-07-10', null, null);
INSERT INTO `tbl_customer` VALUES ('52aa48bfb9df4dbe9aebfc838dd8c110', '40f6cdea0bd34aceb77492a1656d9fb3', '阿里巴巴1', 'www.alibaba.com', '123535', '张三', '2021-07-07 15:02:39', null, null, '纪要123', '2021-07-14', '描述123', '地址123');
INSERT INTO `tbl_customer` VALUES ('52aa48bfb9df4dbe9aebfc838dd8c111', null, '阿里巴巴12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_customer` VALUES ('52aa48bfb9df4dbe9aebfc838dd8c112', null, '阿里巴巴123', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('0a2c56bad1394b51b09d9192ed8f5f26', '备注3（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '52aa48bfb9df4dbe9aebfc838dd8c110');
INSERT INTO `tbl_customer_remark` VALUES ('3e12d7552e6244e3ad403c767de74f5f', '备注1（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '52aa48bfb9df4dbe9aebfc838dd8c110');
INSERT INTO `tbl_customer_remark` VALUES ('76a93472290c46329287b3e9e2caf268', '备注2（属于马云）', '张三', '2021-07-07 15:02:39', null, null, '0', '52aa48bfb9df4dbe9aebfc838dd8c110');

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type` (
  `code` varchar(255) NOT NULL COMMENT '����������������Ϊ�գ����ܺ������ġ�',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value` (
  `id` char(32) NOT NULL COMMENT '����������UUID',
  `value` varchar(255) DEFAULT NULL COMMENT '����Ϊ�գ�����Ҫ��ͬһ���ֵ��������ֵ�ֵ�����ظ�������Ψһ�ԡ�',
  `text` varchar(255) DEFAULT NULL COMMENT '����Ϊ��',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '����Ϊ�գ�����Ϊ�յ�ʱ��Ҫ�������������',
  `typeCode` varchar(255) DEFAULT NULL COMMENT '���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07成交', '07成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01资质审查', '01资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08丢失的线索', '08丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09因竞争丢失关闭', '09因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02需求分析', '02需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05提案/报价', '05提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03价值建议', '03价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04确定决策者', '04确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06谈判/复审', '06谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('75a636224f9143a8919dbe8ed261d277', '40f6cdea0bd34aceb77492a1656d9fb3', '1000000', '一百万大交易', '2021-07-21', '03e1b21571af4c398ff80944f1ea0494', '02需求分析', '已有业务', '在线商场', '0aa817d5817b4dc3b2e2fbdb21b0aaa7', '7f5c80e060b749c286bab134a1d0992c', '张三', '2021-07-08 10:25:58', null, null, '123', '123', '2021-07-10');
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea10', null, null, null, null, null, '07成交', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea11', null, null, null, null, null, '08丢失的线索', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea12', null, null, null, null, null, '02需求分析', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea13', null, null, null, null, null, '03价值建议', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea14', null, null, null, null, null, '04确定决策者', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea15', null, null, null, null, null, '02需求分析', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea16', null, null, null, null, null, '09因竞争丢失关闭', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea17', '40f6cdea0bd34aceb77492a1656d9fb3', '10000', '交易123', '2021-07-31', '52aa48bfb9df4dbe9aebfc838dd8c110', '04确定决策者', '已有业务', '在线商场', '0aa817d5817b4dc3b2e2fbdb21b0aaa7', '7f5c80e060b749c286bab134a1d0992c', '张三', '2021-07-08 10:24:20', '张三', '2021-07-08 22:05:29', '123', '123', '2021-07-14');
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea18', null, null, null, null, null, '08丢失的线索', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('80ed29db33614e1da5f773e2834fea19', null, null, null, null, null, '03价值建议', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history` (
  `id` char(32) NOT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('0268e29d271b42149d3a083cdd678962', '09因竞争丢失关闭', '10000', '2021-07-31', '2021-07-08 22:05:28', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('0b94dd415c8d44d5a542bbd92400b3a1', '05提案/报价', '10000', '2021-07-31', '2021-07-08 22:02:26', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('0d031e995ea648b2ae80f4800f3c9430', '04确定决策者', '10000', '2021-07-31', '2021-07-08 22:05:29', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('12513301970c4c169c4824d21ed65b97', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:04:33', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('18e24912c8bc49e99501d7a48e0054db', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:05:25', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('223bf35cec4647f385af4d58ffc93856', '03价值建议', '10000', '2021-07-31', '2021-07-08 21:29:39', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('2797765c998a4454b2fb379b2f96599f', '04确定决策者', '10000', '2021-07-31', '2021-07-08 22:05:24', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('2972b06ab6f046878e7e1d75627caa02', '09因竞争丢失关闭', '10000', '2021-07-31', '2021-07-08 22:04:35', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('2e2d49cc2e434e1ea249c4354ae0385c', '06谈判/复审', '10000', '2021-07-31', '2021-07-08 22:04:37', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('4afd4cc67c894f7ea084fc80992513f4', '09因竞争丢失关闭', '10000', '2021-07-31', '2021-07-08 22:05:26', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('5ae6bc64b8544335948209b9d646c1d1', '02需求分析', '1000000', '2021-07-21', '2021-07-08 10:25:58', '张三', '75a636224f9143a8919dbe8ed261d277');
INSERT INTO `tbl_tran_history` VALUES ('61544d56820c4fd1b8cc51d70ebdb371', '07成交', '10000', '2021-07-31', '2021-07-08 21:29:31', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('6638c70370c44749b10bef39e8ee5090', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:04:34', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('8c483ec54fb94eb79060c4f073e6850a', '05提案/报价', '10000', '2021-07-31', '2021-07-08 22:04:31', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('939ecb4c410b460385a857b7a5b3a4a9', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:02:27', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('99a8e15b3d744ce095562c3f4ac266ca', '05提案/报价', '10000', '2021-07-31', '2021-07-08 21:29:28', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('9d4ce20502df4d43bad17852d4be3241', '07成交', '10000', '2021-07-31', '2021-07-08 22:04:32', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('a6fc1a5a6ea142ceb70c33ad00e6861a', '06谈判/复审', '10000', '2021-07-31', '2021-07-08 22:05:27', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('a81779a4fbb54fd099024fa57bdca3f9', '09因竞争丢失关闭', '10000', '2021-07-31', '2021-07-08 22:03:04', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('b410b95b2ded4dd1a97676c8d2e36343', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:02:51', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('b6bdecb74c8247f6883d590a366a1875', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:04:38', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('bb81a8acb20e45b1a82b124ad2a15f95', '09因竞争丢失关闭', '10000', '2021-07-31', '2021-07-08 22:02:28', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('c02c73783ea74472ac531fc19243ecae', '06谈判/复审', '10000', '2021-07-31', '2021-07-08 22:01:49', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('c2337cdd3edb4f5ea036c8524686879b', '08丢失的线索', '10000', '2021-07-31', '2021-07-08 22:01:51', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('c62ff68f277849ef8dc1b772005344d4', '04确定决策者', '10000', '2021-07-31', '2021-07-08 21:39:43', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('cde7c06fb44b41b0b27a6400525bf6e8', '03价值建议', '10000', '2021-07-31', '2021-07-08 10:24:20', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('e77142aa010645db87e48787184b3d0f', '03价值建议', '10000', '2021-07-31', '2021-07-08 22:01:47', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('f3cc3b528bb54d81ace63b2e5c7c84da', '03价值建议', '10000', '2021-07-31', '2021-07-08 22:04:30', '张三', '80ed29db33614e1da5f773e2834fea17');
INSERT INTO `tbl_tran_history` VALUES ('f99ba486f09449f2aafc673eca2988ad', '03价值建议', '10000', '2021-07-31', '2021-07-08 22:02:32', '张三', '80ed29db33614e1da5f773e2834fea17');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `loginPwd` varchar(255) DEFAULT NULL COMMENT '���벻�ܲ������Ĵ洢���������ģ�MD5����֮�������',
  `email` varchar(255) DEFAULT NULL,
  `expireTime` char(19) DEFAULT NULL COMMENT 'ʧЧʱ��Ϊ�յ�ʱ���ʾ����ʧЧ��ʧЧʱ��Ϊ2018-10-10 10:10:10�����ʾ�ڸ�ʱ��֮ǰ���˻����á�',
  `lockState` char(1) DEFAULT NULL COMMENT '����״̬Ϊ��ʱ��ʾ���ã�Ϊ0ʱ��ʾ������Ϊ1ʱ��ʾ���á�',
  `deptno` char(4) DEFAULT NULL,
  `allowIps` varchar(255) DEFAULT NULL COMMENT '�������ʵ�IPΪ��ʱ��ʾIP��ַ�������ޣ��������ʵ�IP������һ����Ҳ�����Ƕ���������IP��ַ��ʱ�򣬲��ð�Ƕ��ŷָ�������IP��192.168.100.2����ʾ���û�ֻ����IP��ַΪ192.168.100.2�Ļ�����ʹ�á�',
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '李四', '202cb962ac59075b964b07152d234b70', 'ls@163.com', '2018-11-27 21:50:05', '1', 'A001', '192.168.1.1', '2018-11-22 12:11:40', '李四', null, null);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '张三', '202cb962ac59075b964b07152d234b70', 'zs@qq.com', '2021-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2', '2018-11-22 11:37:34', '张三', null, null);
