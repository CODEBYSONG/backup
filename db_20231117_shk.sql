-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dbsong`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbsong` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbsong`;

--
-- Table structure for table `xe_action_forward`
--

DROP TABLE IF EXISTS `xe_action_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_action_forward` (
  `act` varchar(80) NOT NULL,
  `module` varchar(60) NOT NULL,
  `type` varchar(15) NOT NULL,
  UNIQUE KEY `idx_foward` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_action_forward`
--

LOCK TABLES `xe_action_forward` WRITE;
/*!40000 ALTER TABLE `xe_action_forward` DISABLE KEYS */;
INSERT INTO `xe_action_forward` VALUES ('rss','rss','view'),('atom','rss','view'),('IS','integration_search','view');
/*!40000 ALTER TABLE `xe_action_forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_addons`
--

DROP TABLE IF EXISTS `xe_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_addons` (
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `is_fixed` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_addons`
--

LOCK TABLES `xe_addons` WRITE;
/*!40000 ALTER TABLE `xe_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_addons_site`
--

DROP TABLE IF EXISTS `xe_addons_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_addons_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_addon_site` (`site_srl`,`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_addons_site`
--

LOCK TABLES `xe_addons_site` WRITE;
/*!40000 ALTER TABLE `xe_addons_site` DISABLE KEYS */;
INSERT INTO `xe_addons_site` VALUES (0,'autolink','Y','N',NULL,'20231120022656'),(0,'member_communication','Y','N',NULL,'20231120022656'),(0,'member_extra_info','Y','N',NULL,'20231120022656'),(0,'resize_image','Y','N',NULL,'20231120022656');
/*!40000 ALTER TABLE `xe_addons_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_admin_favorite`
--

DROP TABLE IF EXISTS `xe_admin_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_admin_favorite` (
  `admin_favorite_srl` bigint(11) NOT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_favorite_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_admin_favorite`
--

LOCK TABLES `xe_admin_favorite` WRITE;
/*!40000 ALTER TABLE `xe_admin_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_admin_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_admin_log`
--

DROP TABLE IF EXISTS `xe_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_admin_log` (
  `ipaddress` varchar(100) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `act` varchar(100) DEFAULT NULL,
  `request_vars` text,
  KEY `idx_admin_ip` (`ipaddress`),
  KEY `idx_admin_date` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_admin_log`
--

LOCK TABLES `xe_admin_log` WRITE;
/*!40000 ALTER TABLE `xe_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_ai_installed_packages`
--

DROP TABLE IF EXISTS `xe_ai_installed_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_ai_installed_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  `current_version` varchar(255) DEFAULT NULL,
  `need_update` char(1) DEFAULT 'N',
  KEY `idx_package_srl` (`package_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_ai_installed_packages`
--

LOCK TABLES `xe_ai_installed_packages` WRITE;
/*!40000 ALTER TABLE `xe_ai_installed_packages` DISABLE KEYS */;
INSERT INTO `xe_ai_installed_packages` VALUES (18324167,'1.7.1.1','1.7.2','N'),(18324266,'0.1','1.7','N'),(18324327,'0.1','1.7','N'),(18325662,'1.11.6','1.11.6','N'),(18378362,'0.2','1.7','N'),(18910976,'0.1','1.7','N'),(22590697,'1.0.0','1.0.0','N');
/*!40000 ALTER TABLE `xe_ai_installed_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_ai_remote_categories`
--

DROP TABLE IF EXISTS `xe_ai_remote_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_ai_remote_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_parent_srl` (`parent_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_ai_remote_categories`
--

LOCK TABLES `xe_ai_remote_categories` WRITE;
/*!40000 ALTER TABLE `xe_ai_remote_categories` DISABLE KEYS */;
INSERT INTO `xe_ai_remote_categories` VALUES (18322917,0,'프로그램',0),(18322907,18322917,'XE 코어',1),(18322923,18322917,'모듈',2),(18322925,18322917,'애드온',3),(18322927,18322917,'위젯',4),(18322929,18322917,'에디터컴포넌트',5),(18631347,18322917,'단락에디터컴포넌트',6),(18322919,0,'스킨',7),(18322954,18322919,'레이아웃',8),(18994172,18322919,'모바일 레이아웃',9),(18322943,18322919,'모듈 스킨',10),(18994170,18322919,'모듈 모바일 스킨',11),(18322950,18322919,'위젯 스킨',12),(18322952,18322919,'위젯 스타일',13),(18904838,18322919,'에디터 스타일',14),(18322977,18322919,'회원레벨 아이콘',15);
/*!40000 ALTER TABLE `xe_ai_remote_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_autoinstall_packages`
--

DROP TABLE IF EXISTS `xe_autoinstall_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_autoinstall_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) DEFAULT '0',
  `path` varchar(250) NOT NULL,
  `have_instance` char(1) NOT NULL DEFAULT 'N',
  `updatedate` varchar(14) DEFAULT NULL,
  `latest_item_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_path` (`path`),
  KEY `idx_package_srl` (`package_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_regdate` (`updatedate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_autoinstall_packages`
--

LOCK TABLES `xe_autoinstall_packages` WRITE;
/*!40000 ALTER TABLE `xe_autoinstall_packages` DISABLE KEYS */;
INSERT INTO `xe_autoinstall_packages` VALUES (18324167,18322923,'./modules/board','N','20231119212154',21940502,'1.7.1.1'),(18324168,18322923,'./modules/homepage','N','20231107223034',21854391,'1.7.0.1'),(19514473,18322943,'./modules/issuetracker','N','20231109000549',19539420,'1.1.0'),(18324171,18322923,'./modules/livexe','N','20231117203247',19624726,'0.6'),(18324175,18322923,'./modules/material','N','20231102084735',18669818,'1.0'),(18324186,18322923,'./modules/textyle','N','20231109024840',21795348,'1.7.0'),(18324187,18322923,'./modules/textylehub','N','20231109025733',21795365,'1.7.0'),(18324188,18322923,'./modules/planet','N','20231113213923',21015994,'0.1.4'),(18324189,18322923,'./modules/referer_old','N','20231107231737',18325389,'0.15'),(18324191,18322923,'./modules/resource','N','20231115012735',21854259,'1.7.0'),(18324199,18322923,'./modules/tccommentnotify','N','20231108004334',18365815,'1.1.0'),(18324210,18322923,'./modules/wiki','N','20231117203250',21985871,'1.7.0.1'),(18324211,18322943,'./modules/board/skins/xe_board','N','20231107210434',18325569,'0.1'),(18324212,18322943,'./modules/board/skins/xe_default','N','20231114065837',18325513,'0.1'),(18324213,18322943,'./modules/editor/skins/dreditor','N','20231104061555',18865892,'1.3.0'),(18324214,18322943,'./modules/editor/skins/fckeditor','N','20231107210439',18325501,'0.1'),(18324221,18322943,'./modules/editor/skins/xquared','N','20231107210454',18325496,'0.1'),(18324225,18322943,'./modules/textyle/skins/wordPressDefault','N','20231107210447',18325484,'0.1'),(18324226,18322925,'./addons/keyword_link','N','20231108011537',18325653,'0.1'),(18324227,18322925,'./addons/member_join_extend','N','20231107231818',18325647,'0.1'),(18324228,18322925,'./addons/planet_bookmark','N','20231109051306',21017018,'0.1.1'),(18324233,18322925,'./addons/planet_todo','N','20231106172914',21016986,'0.1.1'),(18324241,18322925,'./addons/referer_old','N','20231102085307',18325632,'0.1'),(18324247,18322925,'./addons/tccommentnotify','N','20231107231814',18365845,'1.0'),(18324248,18322925,'./addons/wiki_link','N','20231108001203',21813902,'1.7.0'),(18324261,18322929,'./modules/editor/components/cc_license','N','20231107231920',18325227,'0.1'),(18324266,18322929,'./modules/editor/components/emoticon','N','20231109014140',18325232,'0.1'),(18324273,18322929,'./modules/editor/components/quotation','N','20231117010510',18325248,'0.1'),(18324292,18322954,'./layouts/cafeXE','N','20231113153840',21802168,'1.7.0'),(18324297,18322954,'./layouts/ideation','N','20231108001327',18325198,'0.1'),(18324299,18322954,'./layouts/xe_official_v2','N','20231117095650',20391868,'1.0'),(18324320,18322927,'./widgets/archive_list','N','20231112031724',18325093,'0.1'),(18324321,18322927,'./widgets/calendar','N','20231107231830',20591626,'0.2'),(18324326,18322927,'./widgets/category','N','20231102085716',18325077,'0.1'),(18324327,18322927,'./widgets/counter_status','N','20231108122130',18325071,'0.1'),(18324328,18322927,'./widgets/DroArc_clock','N','20231107224004',18325065,'0.1'),(18324330,18322927,'./widgets/forum','N','20231107223949',18325054,'0.1'),(18324331,18322927,'./widgets/ideationBanner','N','20231107224036',18325042,'0.1'),(18324332,18322927,'./widgets/ideationPopular','N','20231107223959',18325026,'0.1'),(18324335,18322927,'./widgets/image_counter','N','20231119163727',19099243,'0.2'),(18324336,18322927,'./widgets/logged_members','N','20231105133639',18325004,'0.1'),(18324337,18322927,'./widgets/member_group','N','20231110182841',18324998,'0.1'),(18324338,18322927,'./widgets/navigator','N','20231119124447',21801528,'1.7.0'),(18324343,18322927,'./widgets/newest_comment','N','20231120102552',18324984,'0.1'),(18324344,18322927,'./widgets/newest_document','N','20231120103129',20893807,'1.0'),(18324345,18322927,'./widgets/newest_trackback','N','20231107224016',18324957,'0.1'),(18324346,18322927,'./widgets/planet_document','N','20231108122850',18327255,'0.2'),(18324348,18322927,'./widgets/rank_count','N','20231116213654',18324851,'1.5'),(18324352,18322927,'./widgets/rank_point','N','20231116101226',18324818,'1.0'),(18324353,18322927,'./widgets/rss_reader','N','20231107223508',18324791,'#7'),(18324355,18322927,'./widgets/site_info','N','20231105133644',21801496,'1.7.0'),(18324359,18322927,'./widgets/tab_newest_document','N','20231102090233',18324658,'0.1'),(18324360,18322927,'./widgets/tag_list','N','20231114231413',18324768,'0.1'),(18324361,18322927,'./widgets/webzine','N','20231105142831',18324711,'0.1'),(18324362,18322927,'./widgets/xeBanner','N','20231117193912',18324697,'0.1'),(18324391,18322950,'./widgets/content/skins/xeHome','N','20231105143544',18324681,'0.1'),(18324395,18322950,'./widgets/tab_newest_document/skins/ideationTab','N','20231114012055',18324647,'0.1'),(18324396,18322952,'./widgetstyles/colorbox','N','20231107221243',18324641,'0.1'),(18324398,18322952,'./widgetstyles/memo','N','20231107221644',18324622,'0.1'),(18324401,18322952,'./widgetstyles/postitWire','N','20231107220727',18324610,'0.1'),(18324402,18322952,'./widgetstyles/roundFace','N','20231107221143',18324603,'0.1'),(18324403,18322952,'./widgetstyles/roundWire','N','20231114024248',18324590,'0.1'),(18324404,18322952,'./widgetstyles/simpleRound','N','20231107220718',18324575,'0.1'),(18324405,18322952,'./widgetstyles/simpleSquare','N','20231107221250',18324565,'0.1'),(18324406,18322952,'./widgetstyles/simpleTitle','N','20231107220915',18324546,'0.1'),(18325662,18322907,'.','N','20231120102336',22756225,'1.11.6'),(18325755,18322927,'./widgets/popular_planet_document','N','20231113234852',18325772,'0.1'),(18325790,18322923,'./modules/ad','N','20231119175759',22756258,'0.7.0'),(18325791,18322927,'./widgets/lineadWidget','N','20231119175722',22756231,'0.9'),(18325803,18322929,'./modules/editor/components/code_highlighter','N','20231115023444',22754829,'1.4'),(18325813,18322925,'./addons/tag_relation','N','20231107182802',22274979,'1.4.1'),(18325941,18322923,'./modules/sms','N','20231114035658',18745231,'1.3.10'),(18325946,18322923,'./modules/minishop','N','20231119123119',22754398,'1.3.2'),(18325951,18322925,'./addons/sms_alert','N','20231107102813',18326173,'1.0'),(18325952,18322927,'./widgets/sms','N','20231105152320',18326180,'1.1'),(18325989,18322929,'./modules/editor/components/google_translate','N','20231105143501',18777700,'0.2'),(18326005,18322929,'./modules/editor/components/textbox','N','20231114081142',18326938,'0.1'),(18326011,18322925,'./addons/hidden_module','N','20231102122020',18337264,'0.3'),(18326030,18322923,'./modules/statistics','N','20231120105820',18327023,'1.0.1b'),(18326038,18322925,'./addons/statistics','N','20231119124452',18327083,'1.0.1b'),(18326351,18322925,'./addons/remove_id_search','N','20231102122211',18326429,'1.0'),(18326352,18322925,'./addons/guest_name','N','20231114115454',19010744,'1.1.2'),(18326353,18322925,'./addons/write_limit','N','20231102122443',18637861,'1.2.1'),(18326553,18322954,'./layouts/habile_layout','N','20231117040547',18330571,'1.3'),(18327285,18322954,'./layouts/bcptwta','N','20231105143916',18328111,'1.0'),(18327287,18322950,'./widgets/tag_list/skins/tagcloud','N','20231105135054',18328078,'1.0'),(18327419,18322954,'./layouts/mh_simple','N','20231109015444',18327611,'1.1'),(22245529,18322977,'./modules/point/icons/2sis_icon','N','20231030201652',22245577,'1'),(18327462,18322927,'./widgets/gagachat','N','20231120105925',22555267,'3.7'),(18327743,18322954,'./layouts/Treasurej_Heart_Note','N','20231102123058',19334770,'1.6'),(18327995,18322950,'./widgets/counter_status/skins/miznkiz_simple_counter','N','20231105141904',18339071,'0.1'),(18328243,18322927,'./widgets/CoolirisPlayer','N','20231111050829',18332482,'2.0'),(18328356,18322927,'./widgets/newest_medias','N','20231105140117',18330464,'v0.1'),(18328672,18322954,'./layouts/PXE_leaflet_lite','N','20231105153012',18339574,'1.02 Final'),(18328730,18322950,'./widgets/login_info/skins/treasurej_simple150px','N','20231102123623',18953730,'1.5.3'),(18330288,18322950,'./widgets/login_info/skins/sleepless_simple','N','20231105152844',18332123,'1.0.0'),(18330488,18322927,'./widgets/webzine/skins/LILY_GoodStyle','N','20231105144738',18333192,'1.0'),(18330513,18322950,'./widgets/tag_list/skins/treasurej_tagcloud','N','20231102124004',18778301,'1.2'),(18330814,18322954,'./layouts/messenger','N','20231105152939',18331384,'Messenger_v0.1'),(18331803,18322943,'./modules/board/skins/p_board_p','N','20231105152839',18845219,'3.2.0'),(18334573,18322952,'./widgetstyles/webslice','N','20231107220640',18338237,'0.0.1'),(18334938,18322923,'./modules/kin','N','20231108003805',21965762,'1.7.0'),(18334979,18322925,'./addons/popup','N','20231116183402',18335423,'0.1'),(18334980,18322925,'./addons/piclens','N','20231106173707',20168732,'1.5'),(18334989,18322925,'./addons/func_include','N','20231102124547',18336654,'v1.0'),(18334990,18322925,'./addons/entry','N','20231102124711',18685479,'1.2'),(18334996,18322923,'./modules/media','N','20231117120141',18336696,'v0.1'),(18335009,18322927,'./widgets/rnq_newest_document','N','20231105153355',18336745,'1.1.5'),(18335021,18322927,'./widgets/division','N','20231113153914',20582119,'1.1'),(18335028,18322950,'./widgets/login_info/skins/rnq_login','N','20231105153026',18337247,'v0.2'),(18335034,18322950,'./widgets/rnq_newest_document/skins/rnq_newest_integrate','N','20231105153031',18798607,'0.3.1'),(18335040,18322950,'./widgets/rnq_newest_document/skins/rnq_newest_default','N','20231105143542',18798214,'0.3'),(18335043,18322923,'./modules/nms','N','20231105153039',19520872,'0.9.0'),(18335048,18322927,'./widgets/nms_info','N','20231105154524',18349106,'0.1.3'),(18335090,18322943,'./modules/board/skins/xe_naradesign','N','20231107210424',18335100,'1.0'),(18335281,18322923,'./modules/join_extend','N','20231105132241',18988537,'0.5.3.4'),(18335356,18322943,'./modules/textyle/skins/corporate','N','20231107210832',18335357,'0.9'),(18335369,18322950,'./widgets/content/skins/naradesign','N','20231105140209',18335372,'0.3'),(18335382,18322950,'./widgets/login_info/skins/webmini','N','20231105143415',18336191,'3.1'),(18337279,18322950,'./widgets/rnq_newest_document/skins/rnq_newest_notice','N','20231105153034',18798196,'0.3'),(18338697,18322925,'./addons/uccup','N','20231102125638',18338747,'v2.3'),(18338699,18322943,'./modules/board/skins/xe_uccup','N','20231107210753',18338792,'v2.3'),(18342939,18322925,'./addons/comment_new','N','20231102125725',18670429,'1.1.1'),(18346921,18322927,'./widgets/randomchat','N','20231105152836',18517236,'1.2'),(18347510,18322954,'./layouts/aginet_official_v2','N','20231113120158',18575161,'2.0.7'),(18351409,18322923,'./modules/zzz_menu_new','N','20231114004132',21832040,'1.7.0'),(18354173,18322952,'./widgetstyles/sz_gradient','N','20231107221119',18354312,'0.1.0'),(18354463,18322977,'./modules/point/icons/lv','N','20231105143903',19013505,'0.2'),(18354979,18322977,'/ modules / point / icons','N','20231112143239',18355002,'SuddenAttack + 확장'),(18357476,18322954,'./layouts/xe_sunooDMLg','N','20231105153007',19462033,'1.0'),(18360610,18322927,'./widgets/flowing_pictures','N','20231104060224',18648791,'1.1.7'),(18362403,18322954,'./layouts/xe_sunooDMRg','N','20231105143919',19462101,'1.0'),(18366133,18322943,'./modules/join_extend/skins','N','20231107210543',18366143,'1'),(18378357,18322954,'./layouts/xe_cafe','N','20231107223427',21803889,'1.7.0'),(18378362,18322950,'./widgets/login_info/skins/default','N','20231113214121',20168245,'0.2'),(18381054,18322954,'./layouts/naver_photo_style','N','20231109024110',18429470,'1.2.1'),(18383233,18322954,'./layouts/Jungbok_layout_V3.0','N','20231107220950',18389790,'V3.0'),(18386463,18322943,'./modules/textyle/skins','N','20231114122441',19100013,'2.5'),(18388093,18322925,'./addons/bekmeProhibite','N','20231120043356',18388181,'1.0'),(18398352,18322943,'./modules/board/skins/xe_official_planner123','N','20231117203305',22756196,'5.7.0'),(18399622,18322977,'./modules/poin/954','N','20231117185340',18404551,'1.0.1'),(18409541,18322954,'./layouts/hankooktown2','N','20231114231549',19512809,'1.2.2'),(18409634,18322950,'./widgets/login_info/skins/hk','N','20231114231549',18547214,'0.4'),(18410867,18322923,'./modules/pointsend','N','20231119175716',22756269,'1.3.1'),(18410868,18322925,'./addons/member_pointsend','N','20231120035316',21227458,'0.2.2'),(18411910,18322950,'./widgets/newest_comment/skins','N','20231108125406',18413214,'1.0'),(18414428,18322954,'./layouts/Gom-e.net_Hankooktown2_Layout','N','20231105152945',18445386,'1.0.7'),(18419537,18322954,'./layouts/kindguyLayout(joins_200911_1)','N','20231105142907',18422597,'v.200911'),(18424676,18322954,'./layouts/gomenet_xe_official_v2','N','20231105143528',18426534,'1.0.1'),(22753921,18322954,'./layouts/J_Smart','N','20231117214930',22755938,'1.1'),(18432183,18322954,'./layouts/kindguyLayout(munhwa_200911_1)','N','20231105154508',18432699,'v.200911'),(18432187,18322954,'./layouts/kindguyLayout(munhwa_200911_2)','N','20231105143912',18432723,'v.200911'),(18435775,18322927,'./widgets/level_point','N','20231120035317',22595479,'1.0'),(18447927,18322954,'./layouts/Gom2netLayoutEngland','N','20231106173909',18454140,'1.0.1'),(18448761,18322943,'./modules/board/skins/xe_official_hancoma_title_skin','N','20231108125936',18461302,'0.2'),(18454611,18322954,'./layouts/kindguyLayout(khan_200911_1)','N','20231108001425',18454709,'v.200911'),(18454629,18322954,'./layouts/kindguyLayout(khan_200911_2)','N','20231108001547',18454718,'v.200911'),(18459111,18322925,'./addons/addthis','N','20231102132734',18459913,'0.1'),(18510031,18322943,'./modules/textyle/skins/zirho','N','20231102132753',18569108,'0.0.1'),(18511514,18322925,'./addons/adult_keyword','N','20231120035348',22754386,'1.0'),(18512505,18322954,'./layouts/kindguyLayout(BlueN_200912_1)','N','20231106173925',18516495,'200912'),(18512506,18322954,'./layouts/kindguyLayout(BlueN_200912_2)','N','20231106173929',18516511,'200912'),(18527888,18322923,'./modules/oneban','N','20231105144735',18529981,'1.0'),(18536532,18322952,'./widgetstyles/xe_official','N','20231120035355',22756206,'1.2.1'),(18539546,18322925,'./addons/addvote','N','20231108004437',21244042,'1.0'),(18555205,18322950,'./widgets/counter_status/skins/sworld_counter','N','20231117203320',22756184,'0.2'),(18555654,18322952,'./widgetstyles/tingenara','N','20231107220943',18557124,'1'),(18561875,18322923,'./modules/smsontextyle','N','20231107104049',18569729,'1.0.1'),(18561895,18322927,'./widgets/sms_textyle','N','20231107073844',18569743,'1.0.1'),(18572882,18322954,'./layouts/xdom_v2','N','20231105154516',19595474,'2.5.2.4'),(18572883,18322950,'./widgets/login_info/skins/xdom_login_v2','N','20231115054120',19051343,'2.3.1'),(18577507,18322927,'./widgets/chat25','N','20231105153134',18587408,'0.0.1'),(18579525,18322950,'./widgets/login_info/skins/tingenaralogin','N','20231102133231',18587232,'1'),(18589320,18322923,'./modules/cashbook','N','20231104175825',19603368,'0.3.7'),(18595500,18322943,'./modules/integration_search/skins/default_xgenesis','N','20231116144901',18596361,'0.1.1'),(18595504,18322954,'./layouts/xe_official_v2_xgenesis','N','20231106174002',18596408,'0.1.1'),(18595711,18322943,'./modules/communication/skins/name','N','20231105140125',18597241,'0.1'),(18604859,18322927,'./widgets/bannerWidget','N','20231117203323',22756248,'0.6'),(18606308,18322954,'./layouts/elkha_fge','N','20231118163058',18657582,'1.2'),(18606314,18322954,'./layouts/elkha_sky','N','20231107220130',19822870,'1.4.5'),(18606318,18322954,'./layouts/paper_layer','N','20231106174012',18611976,'1.0'),(18607436,18322923,'./modules/wizardxe','N','20231116185642',19150177,'0.0.6'),(18607444,18322927,'./widgets/gallery_frame','N','20231115150848',18619741,'0.0.2'),(18607471,18322927,'./widgets/bangbang_alltogether','N','20231102133644',18645219,'0.0.3'),(18607483,18322954,'./layouts/zirho_layout','N','20231106174020',18645390,'0.0.3'),(18610979,18322923,'./modules/msg_admin','N','20231108012107',18614159,'0.1'),(18612951,18322954,'./layouts/elkha_simple','N','20231106174026',18633735,'1.1'),(18617496,18322943,'./modules/textyle/skins/Viewfinder','N','20231105123219',18678663,'0.3'),(18618046,18322950,'./widgets/counter_status/skins/tingenara','N','20231102133744',18620661,'1'),(18621989,18322923,'./modules/gagafilemd5','N','20231105153118',18684166,'1.0'),(18627986,18322927,'./widgets/banner_script','N','20231108010706',18634779,'0.1'),(18631776,18322950,'./widgets/content/skins/official_board_style','N','20231114075520',18638860,'1.2'),(18631835,18322954,'./layouts/kindguyLayout(201001_Kindguy4_1_xe1.3.1.2)','N','20231106174029',18634134,'201001'),(18631838,18322954,'./layouts/kindguyLayout(201001_Kindguy4_2_xe1.3.1.2)','N','20231108044349',18634163,'201001'),(18632016,18322943,'./modules/board/skins/faq','N','20231119122704',18636828,'1.3'),(18634568,18322927,'./widgets/quick_menu','N','20231102133930',18638902,'0.1.0'),(18634632,18322927,'./widgets/lnb_menu','N','20231107125252',20558937,'0.2.0'),(18634838,18322954,'./layouts/vz_clear_blue','N','20231108044356',18635623,'0.2'),(18635216,18322950,'./widgets/login_info/skins/xgenesis_login','N','20231102134016',18638870,'0.1.0'),(18636930,18322927,'./widgets/MinionInXE','N','20231105143424',18835506,'1.4'),(18637860,18322954,'./layouts/xgenesis_official','N','20231114023149',19516685,'0.2.2'),(18640942,18322923,'./modules/pop_up','N','20231117123119',18646378,'0.0.4'),(18640943,18322925,'./addons/pop_up','N','20231119200221',19149746,'0.0.8'),(18642464,18322954,'./layouts/elkha_graystyle','N','20231117203326',22756125,'2.2.1'),(18642836,18322952,'./widgetstyles/gray_style','N','20231113133204',18826509,'1.2.1'),(18646646,18631347,'./modules/editor/skins/dreditor/drcomponents/iframe','N','20231108105650',18646655,'0.1'),(18647145,18322952,'./widgetstyles/mo_colorline','N','20231107221128',18654291,'0.3'),(18648969,18322925,'./addons/soo_for_muzik_player','N','20231108044504',19687129,'0.3.1'),(18649607,18322929,'./modules/editor/components/jowrney_logmap','N','20231108044509',19533339,'0.4.0'),(18649610,18322950,'./widgets/login_info/skins/2010_jowrney_release','N','20231107213443',18654744,'0.1.0'),(18649613,18322954,'./layouts/2010_jowrney','N','20231107213425',19060126,'0.2.5'),(18650492,18322954,'./layouts/elkha_sky2','N','20231114231359',18865308,'1.4.5'),(18650580,18322929,'./modules/editor/components/soo_naver_bookinfo','N','20231119132156',19044122,'0.3.1'),(18652557,18631347,'./modules/editor/skins/dreditor/drcomponents/code','N','20231108105519',18652761,'0.1'),(18655593,18322954,'./xe/layouts','N','20231108044533',18667484,'1.0'),(18662544,18322954,'./layouts/blooz_layout_ver3','N','20231113174441',18701665,'3.2'),(18663182,18322954,'./layouts/shx_chameleon','N','20231108044547',18668568,'0.1.1'),(18664319,18322925,'./addons/P3P','N','20231102134951',18668421,'1.0'),(18666669,18322923,'./modules/stopsmoking','N','20231113214233',19493136,'0.2.2'),(18669571,18322977,'./modules/point/icons/dark','N','20231105143859',18672429,'1.0'),(18673912,18322929,'./modules/editor/components/soo_google_map','N','20231115133943',22231835,'0.9'),(18677776,18322954,'./layouts/lay','N','20231108044647',18682153,'0.1'),(18678675,18322943,'./modules/textyle/skins/Emplode','N','20231119133246',18700716,'0.6'),(18679839,18322929,'./modules/editor/components/soo_naver_image','N','20231119133338',18690439,'1.0.2'),(18681809,18322925,'./addons/age_restrictions','N','20231108044656',18687595,'1.0'),(18682481,18322925,'./addons/soo_js_exif','N','20231109120256',18859459,'0.3.4'),(18682907,18322954,'./layouts/ueo','N','20231108044701',19051858,'0.2'),(18686122,18322943,'./modules/board/skins/elkha_xe_official','N','20231105160130',18687734,'1.0'),(18697182,18322927,'./widgets/calendar_plannerXE123','N','20231117203330',22756195,'5.7.0'),(18700386,18322954,'./layouts/koo','N','20231108044706',18707058,'0.1'),(18703085,18322954,'./layouts/jimseung_nate','N','20231108044718',18705555,'1.0'),(18703356,18322954,'./layouts/how','N','20231108044723',18707091,'0.1'),(18705012,18322954,'./layouts/layoutSkin(kindguy5.1_xe1.4.0.5)','N','20231108044728',18708750,'201002'),(18705013,18322954,'./layouts/layoutSkin(kindguy5.2_xe1.4.0.5)','N','20231108044734',18708767,'201002'),(18706109,18322954,'./layouts/jimseung_biz','N','20231108044740',18711864,'0.1'),(18706113,18322954,'./layouts/jimseung_simplesub','N','20231108044743',18709461,'1'),(18712555,18322954,'./layouts/nom','N','20231108044749',18712759,'0.1'),(18712640,18322927,'./widgets/JW_player','N','20231114124921',18712773,'1.0'),(18714842,18322954,'./layouts/eond_portal_main_2col_right','N','20231109051742',21776053,'0.7'),(18716138,18322954,'./layouts/bom','N','20231108044754',18722236,'0.1'),(18716480,18322954,'./layouts/voo','N','20231113133315',18722243,'0.1'),(19692912,18322925,'./addons/music24','N','20231108050237',19692913,'1.0.0'),(18722759,18322954,'./layouts/xe_sunooEmLg','N','20231116050006',19462122,'1.0'),(18730576,18322929,'./modules/editor/components/interpark_book_search','N','20231108092803',18740294,'0.1'),(18731809,18322943,'./modules/board/skins/loser_guestbook','N','20231105143430',19235463,'0.1'),(18735942,18322954,'./layouts/mediaOn','N','20231120012842',18746917,'1.02'),(18739967,18322950,'widgets/content/skins/YGH_line','N','20231105144400',18741565,'0.1'),(18745485,18322923,'./modules/syndication','N','20231117203347',22755525,'5.0.0'),(18748689,18322954,'./layouts/daerew_v4_layout','N','20231108044903',18926143,'1.2'),(18750254,18322950,'./widgets/login_info/skins/daerew_v4_login','N','20231105153519',18751630,'1.0'),(18766685,18322954,'./layouts/elkha_graystyle2_lite','N','20231108095316',18844159,'1.0.3'),(18766699,18322943,'./modules/board/skins/quiet_board','N','20231105153024',18766890,'2.3'),(18766704,18322925,'./addons/member_layer_config','N','20231109035108',18766875,'1.1'),(18773076,18322923,'./modules/blogshop','N','20231114062510',18920619,'1.1'),(18773077,18631347,'./modules/editor/skins/dreditor/drcomponents/blogshop_writer','N','20231114100446',18920604,'1.1'),(18775186,18322950,'xe/modules/member/skins/default','N','20231105142913',18784334,'0.2'),(18777712,18322925,'./addons/add_document','N','20231112124435',18794485,'0.1.1'),(18779239,18322925,'./addons/daumview_vote','N','20231113184518',18898435,'0.5.5'),(18790298,18322925,'./addon/hellomaster','N','20231108044933',18794783,'1.0.0'),(18790924,18322954,'./layouts/xe_sunooEmRg','N','20231105153417',19462147,'1.0'),(18800584,18322923,'./modules/sboard','N','20231105141000',18878072,'2.1.0'),(18802611,18322950,'./widgets/content/skins/daerew_webzine_notice','N','20231111020425',18810316,'1.0'),(18802619,18322950,'./widgets/counter_status/skins/daerew_counter','N','20231109015953',19433478,'1.1'),(18809955,18322943,'./modules/editor/skins/tinyMCE','N','20231102141545',18810260,'1.4'),(18818977,18322954,'./layouts/blackcity','N','20231120012846',18832088,'1.0'),(18827207,18322950,'./widgets/login_info/skins/git_login_simple','N','20231107130417',18993961,'2.0'),(18832037,18322954,'./layouts/rom','N','20231108044945',18837238,'0.1'),(18832352,18322923,'/editer/skins','N','20231120030717',18838645,'1.0'),(18835470,18322927,'./widgets/splanner','N','20231105135616',18878338,'0.3.0'),(18846103,18322954,'./layouts/SORRENT_LAYOUT_RELEASE','N','20231107220934',18851320,'1.0'),(18846109,18322950,'./widgets/login_info/skins/SORRENT_LOGIN','N','20231105130211',18851330,'1.0'),(18849332,18322954,'./layouts/layout_skin(xenara1.1_xe1.4.0.10)','N','20231108044951',18853151,'201004'),(18852198,18322952,'./widgetstyle','N','20231105153041',18853308,'1.0.0'),(18853350,18322925,'./addons/member_join_captcha','N','20231105143449',18855317,'0.1.4'),(18855088,18322954,'./layouts/elkha_dr4','N','20231107235840',19703575,'1.0.2'),(18864982,18322977,'./modules/point/icons/cs_level','N','20231105140226',18866619,'0.1a'),(18866481,18322954,'./layouts/Treasurej_Lifestyle','N','20231102142016',21971882,'1.1'),(18867310,18322923,'./modules/project','N','20231114053255',21278683,'1.3.1'),(18877427,18322954,'./layouts/Treasurej_Craftwork','N','20231108044956',19032188,'1.0.1'),(18882151,18322925,'./addons/facebook_social','N','20231116032043',18882152,'0.1'),(18900548,18322954,'./layouts/layout_skin(kindguy1.0_type1_xe1.4.1.1)','N','20231108045009',18901309,'201005'),(18900551,18322954,'./layouts/layout_skin(kindguy1.1_type2_xe1.4.1.1)','N','20231120053327',18901322,'201005'),(18904767,18322977,'./modules/point/icons/raycity_m','N','20231114004710',18908827,'0.1v'),(18904819,18322977,'./modules/point/icons/raycity_f','N','20231105140554',18908837,'0.1v'),(18905882,18322923,'./modules/loginlog','N','20231117191234',22756183,'1.5.0'),(18910976,18904838,'./modules/editor/styles/dreditor','N','20231107130252',18910977,'0.1'),(18915805,18322943,'./modules/textyle/skins/babyBlack','N','20231105154439',18918781,'v0.1'),(18917848,18322954,'./layouts/xeVector','N','20231108045244',18918526,'0.2'),(22753922,18322950,'./widgets/content/skins/J_Smart','N','20231117214931',22755918,'1.0'),(18929288,18322954,'./layouts/mcube','N','20231108045250',18957849,'0.2'),(18929292,18322923,'./modules/mcubeimg','N','20231105132350',18983143,'0.3'),(18939397,18322950,'./widgets/login_info/skins/kan_login','N','20231105154004',18948357,'0.1'),(18943118,18322943,'./modules/bodex/skins','N','20231105143402',18953950,'완성버전'),(18953963,18322943,'./modules/board/skins/xe_official_sky','N','20231107104621',18971884,'1.2'),(18956310,18322923,'./modules/iconshop','N','20231114084316',18999633,'0.4'),(18956315,18322925,'./addons/member_icon_print','N','20231108112808',18968140,'0.3'),(18957505,18322927,'./widgets/cu3er','N','20231105132403',18983161,'0.2'),(18959079,18322954,'./layouts/layoutskin_wave_blue','N','20231105152926',21382225,'1.1.0'),(18968288,18322954,'./layouts/kinesis_sitelist','N','20231105153403',19348039,'0.1.1'),(18975451,18322954,'./layouts/layout_skin(kindguy5.0_type2_xe1.4.1.1)','N','20231120053336',18981166,'201006'),(18975452,18322954,'./layouts/layout_skin(kindguy5.1_type2_xe1.4.1.1)','N','20231120053339',18981176,'201006'),(18980346,18322943,'./modules/board/skins/sejin7940_board','N','20231109000726',20120497,'3.7'),(18982154,18322925,'./addons/addfooter','N','20231108045311',18983942,'0.2'),(18982156,18322925,'./addons/additional_mid','N','20231107223925',18983989,'0.2'),(18982164,18322925,'./addons/header_editor','N','20231108100033',18984012,'0.3'),(18982175,18322925,'./addons/id_rejection','N','20231102142705',18984037,'0.2'),(18982191,18322925,'./addons/meta_add','N','20231110075234',19814958,'0.2.2'),(18982192,18322925,'./addons/q_emphasis','N','20231107223431',18984109,'0.1'),(18982195,18322925,'./addons/soo_add_content','N','20231113145102',22755412,'0.6a'),(18982196,18322925,'./addons/soo_autolang','N','20231102142813',19687115,'1.0.3'),(18982221,18322925,'./addons/soo_parking','N','20231119124431',22755425,'0.25'),(18990092,18322925,'./addons/IEblock','N','20231107212759',18993329,'0.1'),(18990133,18322925,'./addons/referercheck','N','20231107212119',19009627,'2.1'),(18990588,18322925,'./addons/soo_mcrblog_link','N','20231120080219',21924371,'1.2.14'),(18994748,18904838,'./modules/editor/components/emoticon/tpl/images/pink','N','20231106223215',18995710,'1.0'),(18995899,18322952,'./widgetstyles/sorrent_simplebox','N','20231108111212',18998803,'0.1'),(18997142,18322977,'./modules/point/icons/300','N','20231107212813',18998204,'1.0'),(18997930,18322923,'./modules/coupon','N','20231113095008',21627586,'1.0'),(18998734,18994172,'./m.layouts/naverstyle','N','20231108103042',19000655,'1.0'),(18999302,18322950,'./widgets/login_info/skins/kan_login_v2','N','20231105143601',19002080,'0.1'),(19009872,18904838,'./modules/editor/components/emoticon/tpl/images/congcon','N','20231107044455',19010544,'1.0'),(19015265,18322977,'./modules/point/icons/cool','N','20231105140551',19026346,'0.1v'),(19015269,18322977,'./modules/point/icons/CA_L_Mark','N','20231114182719',19026360,'0.1v'),(19018202,18322943,'./modules/board/skins/simple_blue','N','20231107103827',19023717,'1.0'),(19020313,18322943,'./modules/board/skins/pastel_light_purple','N','20231107130341',19028626,'1.0'),(19024107,18322923,'./modules/lottery','N','20231108112723',19027139,'0.1'),(19027281,18322950,'./widgets/attendance_check/skins/sky_next_line','N','20231105140548',19029151,'1'),(19030767,18322950,'./widgets/tab_newest_document/skins/tab_sky','N','20231105143857',19039476,'0.2'),(19030768,18322943,'./modules/attendance/skins/sky_at_board','N','20231113210033',19038444,'1'),(19031365,18322954,'./layouts/elkha_neutral','N','20231113151216',20692034,'0.5'),(19032971,18322954,'./layouts/Treasurej_Craftwork_C','N','20231108045329',19038047,'1.0.1'),(19034752,18322954,'./layouts/elkha_x610','N','20231108045339',19072093,'0.1'),(19044000,18322954,'./layouts/kom','N','20231108045344',19050135,'1.0'),(19044001,18322950,'./widgets/login_info/skins/tingenara','N','20231102143403',19050124,'1.0'),(19049200,18322925,'./addons/domain_check','N','20231120064218',19050476,'0.2'),(19050369,18322954,'./layouts/crom_fixy_layout_private','N','20231108045350',19053826,'1.0'),(19051939,18322954,'./layouts/zom','N','20231108045355',19087062,'0.2'),(19056755,18994170,'./modules/board/m.skins/xe_official_planner123','N','20231117203350',22756194,'5.7.0'),(19060125,18994172,'./m.layouts/2010_jowrney_mobile','N','20231108103405',19063585,'0.1.3'),(19060827,18322954,'./layouts/xom','N','20231113153834',19092257,'0.2'),(19064264,18322977,'./modules/point/icons/getam','N','20231105132230',19064959,'0.1a'),(19064410,18322977,'./modules/point/icons/simple_TS','N','20231105152856',19064414,'1.0'),(19068106,18322977,'./modules/point/icons/nova2','N','20231105132521',19068107,'0.1a'),(19069946,18322925,'./addons/cookie-free_domains','N','20231108045415',19070012,'1.0'),(19071245,18322950,'./widgets/point_status/skins/cloverworld_skin','N','20231105144332',19071386,'1.0.0.0'),(19073125,18322954,'./layouts/fsfsdas_neutral','N','20231114100058',19848942,'0.4.4'),(19073195,18322923,'./modules/krzip_popup','N','20231107185857',19073196,'0.1'),(19073227,18322943,'./modules/member/skins/default_krzip','N','20231117052727',19073228,'0.1'),(19076083,18322927,'./widgets/sayradio','N','20231105152350',19077336,'1.0.1'),(19077792,18322927,'./widgets/twitter_follow','N','20231105153104',19077793,'1.0'),(19080637,18322950,'./widgets/rank_point/skins/elkha','N','20231120002402',19080640,'0.1'),(19081557,18322950,'./widgets/newest_document/skins/layoutskin_webzine_v2','N','20231120052824',21596748,'1.2'),(19081914,18322925,'./addons/tweet_button','N','20231114035128',19083524,'0.1'),(21127741,18322927,'./widgets/contentextended','N','20231119121357',21189359,'2.45'),(19088764,18322954,'./layouts/crom_black_box_layout','N','20231108045430',19089573,'1.0'),(19090619,18322954,'./layouts/nabul2_milate_8T','N','20231108045439',19092504,'2.0'),(19097462,18322954,'./layouts/pb','N','20231108045447',19125110,'1.2'),(19098862,18322954,'./layouts/crom_groove_eco_private','N','20231108045452',19099350,'1.0'),(19099015,18322954,'./layouts/ure','N','20231119223909',19099016,'0.1'),(19100570,18322954,'./layouts/PXE_koi','N','20231105154033',19504533,'1.0.1'),(19109313,18322927,'./widgets/content_specificdoc','N','20231107222003',19109314,'0.2'),(19116278,18322954,'./layouts/modern_line','N','20231119151057',19135412,'1.0'),(19122280,18322952,'./widgets/widgetstyles','N','20231108110527',19122812,'1.0.0'),(19125571,18322943,'./moudles/board/skins','N','20231105140122',19128667,'v2'),(19130198,18322923,'./modules/analytics','N','20231120090811',22755256,'1.0.1'),(19130808,18322927,'./widgets/analytics_flash_counter','N','20231107225256',19157494,'0.2'),(19133209,18322927,'./widgets/newest_document_category','N','20231105144336',19134377,'0.1'),(19133654,18322954,'./layouts/Rebirth_A','N','20231108045610',19224091,'1.1.2'),(19135133,18322954,'./layouts/seven','N','20231107213655',19955250,'1.2'),(19135768,18322950,'./widgets/newest_document/skins/factory_basic_2','N','20231120012840',19135769,'2.0'),(19136412,18322950,'./widgets/newest_comment/skins/factory_basic_2','N','20231120012834',19136413,'2.0'),(19137447,18322925,'./addons/rainbow_link','N','20231108045618',19431548,'0.3'),(19138636,18322954,'./layouts/xenoriter_simple','N','20231108045622',19138637,'1.0'),(19141813,18322950,'./widgets/webzine/skins','N','20231120012837',19141814,'1.0'),(19145884,18322925,'./addons/always_follower','N','20231115061754',19503998,'1.1'),(19157569,18322925,'./addons/google_analytics','N','20231105152400',19157571,'1.0.0'),(19178969,18322954,'./layouts/xe_official_v2_TmaKing','N','20231108045631',19186638,'0.1.1'),(19182698,18322943,'./modules/board/skins/new_faq','N','20231120083428',20467493,'2.1'),(19187623,18322925,'./addons/refhide','N','20231108045638',19191147,'0.1.1'),(19197538,18322950,'./modules/editor/skins/webhard','N','20231113132820',19291157,'0.2'),(19197549,18322943,'./modules/board/skins/webhard','N','20231102145945',19291163,'0.2'),(19201015,18322954,'./layouts/kinesis_cs01f','N','20231108045741',19201021,'1.0.1'),(19201082,18322923,'./modules/mail_m9','N','20231119180323',19201083,'0.1'),(19202124,18322923,'./modules/lunar','N','20231107103704',19213083,'0.1.1'),(19202128,18322943,'./modules/member/skins/default(lunar)','N','20231105132342',19467792,'0.3'),(19202617,18322954,'./layouts/gom2net_layout','N','20231108045749',19204527,'1.0.2'),(19202629,18322925,'./addons/webfontface','N','20231111004552',19206513,'0.1'),(19208301,18322927,'./widgets/coinslider','N','20231115151225',20182294,'1.5'),(19212262,18322923,'./modules/lucene','N','20231119132242',19315303,'1.2'),(19213125,18322927,'./widgets/solarlunar','N','20231112210804',19213126,'0.1'),(19218468,18322927,'./widgets/birthday','N','20231105132337',19218473,'0.1'),(19219093,18322954,'./layouts/kia','N','20231118203841',19219094,'0.1'),(19219428,18322927,'./widgets/srchat','N','20231115030107',22754692,'219.48'),(19226818,18322954,'./layouts/gom2net_2nd_layout','N','20231113202722',19273763,'2.0.6'),(21344825,18322977,'./modules/point/icons/level','N','20231114072733',21360732,'2.0'),(19230703,18322954,'./layouts/eond_official','N','20231109050456',21382865,'1.4.1'),(19231437,18322950,'./widgets/planet_document/skins/eond','N','20231109020106',19283934,'1.0'),(19231709,18322952,'./widgetstyles/eond_webzine','N','20231108233257',19231710,'0.2'),(19231756,18322952,'./widgetstyles/eond_doubleline','N','20231109050324',19231762,'0.1'),(19232784,18322954,'./layouts/nabul2_Wishful','N','20231105154018',19232785,'1.0'),(19234197,18322954,'./layouts/eond_mynote','N','20231109050054',21723208,'1.4.4'),(19235403,18322943,'./modules/board/skins/eond_board','N','20231105143925',19235419,'0.2'),(19235552,18322950,'./widgets/login_info/skins/eond_mynote','N','20231113183823',21651021,'0.8'),(19235579,18322950,'./widgets/counter_status/skins/mynote','N','20231109020103',19252856,'0.1'),(19248816,18322954,'./layouts/xe_official_v2_Toyou','N','20231107130239',19258583,'c'),(19260194,18322927,'./widgets/contentslider','N','20231113201625',20199435,'2.1.1'),(19270268,18322950,'./widgets/bgw_menu/skins/naradesign','N','20231109020122',19270269,'0.1'),(19271512,18322950,'./widgets/point_status/skins/eond_official_login','N','20231109020450',19271513,'0.1'),(19274574,18322925,'./addons/a_soo_wikidoc_pointfixer','N','20231107224657',19274579,'1'),(19280154,18322954,'./layouts/kinesis_pl001f','N','20231105142854',19280155,'1.0'),(19283251,18322954,'./layouts/gom2net_3rd_layout','N','20231105153516',19283257,'3.0.1'),(19285120,18322943,'./modules/board/skins/win_guestbook','N','20231105153101',19295125,'0.5'),(19293487,18322925,'./addons/soo_mobile_top','N','20231117152124',20892008,'3'),(19299608,18322977,'./modules/point/icons/ToYou_level','N','20231107130439',19299609,'ToYou_level_icon v1.'),(19302110,18322954,'./layouts/gardenoforchids','N','20231107130355',19302111,'1.0'),(19306395,18322925,'./addons/shortcut','N','20231108045854',19306492,'0.9.9.2'),(19306873,18904838,'./modules/editor/components/emoticon/tpl/images/hicon','N','20231108233651',19310220,'1.0.0'),(19310933,18322927,'./widgets/xclient','N','20231116173209',19660872,'1.2.0'),(19320728,18322954,'./layouts/darkdream','N','20231107130521',19320733,'1.0'),(19322818,18322954,'./layouts/darkgrid','N','20231107220008',19322819,'1.0'),(19323693,18322923,'./modules/antiaccess','N','20231114062959',20181898,'1.0.3.1'),(19325680,18322923,'./modules/pipingxe','N','20231102151647',19546936,'1.0.5'),(22753439,18322927,'./widgets/tocplus','N','20231105121839',22754373,'0.3'),(19330741,18322950,'./widgets/tab_newest_document/skins/colorful','N','20231110082234',19330742,'1.0'),(19336589,18322925,'./addons/soo_block_UA','N','20231116031552',19336590,'0.1'),(19340331,18322954,'./layouts/CN_No1','N','20231107224019',19344956,'1.0.1'),(19344633,18322943,'./modules/member/skins','N','20231105144330',19349355,'1.0.0'),(19346257,18322927,'./widgets/googlesearch','N','20231105141006',19349099,'1.0.1'),(19348911,18322943,'./modules/board/skins/simpleborder_guestbook','N','20231107080120',19356183,'1.2'),(19349000,18322943,'./modules/board/skins/xe_board_extended','N','20231119132132',19349001,'1.0'),(19351727,18322954,'./layouts/crom_eco','N','20231115174140',19351728,'1.0'),(19353209,18322950,'./widgets/tab_newest_document/skins/tab_flash','N','20231109020056',19353210,'1.0'),(19355038,18322950,'./widgets/googlesearch/skin/multi_box','N','20231113172556',19355039,'1.0'),(19355511,18904838,'./modules/editor/skins/simple_editor','N','20231111004452',19355526,'1.0'),(19355521,18322950,'./widgets/googlesearch/skin/translate','N','20231109015658',19355602,'1.0'),(19360170,18322954,'./layouts/layout_skin(xenara_v1.0_type1_xe1.4.4.1)','N','20231120053303',19360187,'201010'),(19360171,18322954,'./layouts/layout_skin(xenara_v1.1_type3_xe1.4.4.1)','N','20231120053306',19360205,'201010'),(19426823,18322943,'./modules/poll/skins/clevis_poll','N','20231105135654',19440072,'0.3'),(19428586,18322954,'./layouts/fullmetal_by_daramkun','N','20231105154507',19432660,'1.0.0'),(19431275,18322943,'./module/board/skins','N','20231105143547',19432793,'0.2'),(19431519,18322925,'./addons/favicon','N','20231108045858',19434038,'1.1'),(19433415,18322925,'./addons/jquery_external_load','N','20231109013852',22674018,'2.0'),(19440527,18322954,'./layouts/CN_No2','N','20231105152942',19440528,'1.0.1'),(19442769,18322925,'./addons/sex_restrictions','N','20231114023904',19455388,'0.1.1'),(19456847,18322977,'modules/point/icons','N','20231105153057',19456896,'0.2'),(19456969,18322954,'./layouts/impress-06','N','20231105143532',19464583,'1.0.1'),(19458868,18322925,'./addons/soo_feed_delay','N','20231108050020',19458869,'0.1'),(19462008,18322927,'./widgets/login_sunoo','N','20231117180754',19462009,'1.0'),(19462173,18322954,'./layouts/xe_sunooNSLg','N','20231105152950',19462174,'1.0'),(19462195,18322954,'./layouts/xe_sunooWALg','N','20231112055554',19462196,'1.0'),(19473533,18322943,'./modules/integration_search/skins/xgenesis_official','N','20231102152954',19473716,'0.1.0'),(19476930,18322927,'./widgets/stopsmoking_status','N','20231107074648',19476931,'0.1.0'),(19491937,18322954,'./layouts/xe_sunooTALg','N','20231118042414',19491938,'1.0'),(19983564,18322977,'./modules/editor/components/emoticon/tpl/images','N','20231105131032',19984752,'1.4.5.10'),(19497436,18322923,'./modules/analysis','N','20231108073541',19528063,'0.1.2'),(19503269,18322925,'./addons/analysis','N','20231108050025',19527972,'0.1.2'),(19506416,18322954,'./layouts/PXE_clio','N','20231105152346',19506418,'1.1'),(19509849,18322954,'./layouts/hankooktown','N','20231102153248',19509864,'1.0'),(19510234,18322954,'./layouts/gallery_layout','N','20231110104632',19532739,'0.2'),(19510889,18322923,'./modules/portalpoint','N','20231110023112',19741258,'1.2'),(19512714,18322954,'./layouts/heaven','N','20231105131151',19514431,'Alpha'),(19513447,18322925,'./addons/sns_linker_lite','N','20231104112556',22754189,'1.1'),(19513978,18322954,'./layouts/layout_photoGalleryA_Free','N','20231111203211',19514630,'1.0'),(19514688,18322927,'./widgets/xgenesis_login','N','20231107075228',19539957,'0.1.1'),(19515289,18322927,'./widgets/minion4','N','20231113115624',19635737,'2.0.1'),(19515672,18322954,'./layouts/xe_sunooBCLg','N','20231105152956',19515673,'1.0'),(19518187,18322923,'./modules/socialxe','N','20231113150709',22123379,'1.0.11'),(19518188,18322923,'./modules/socialxeserver','N','20231115075303',22120897,'1.0.11'),(19518196,18322925,'./addons/socialxe_helper','N','20231107221955',20361435,'1.0.6'),(19518201,18322927,'./widgets/socialxe_comment','N','20231120110138',20361452,'1.0.8'),(19518204,18322927,'./widgets/socialxe_info','N','20231107074912',19679127,'1.0.6'),(19519171,18322950,'./widgets/tab_newest_document/skins/xe_official','N','20231109020204',19519369,'xe_official'),(19519182,18322923,'./modules/aroundmap','N','20231103140556',19519377,'0.2'),(19519186,18322925,'./addons/qrcode','N','20231108050030',19528193,'0.2'),(19519188,18322923,'./modules/rssboard','N','20231102153939',19539111,'0.3'),(19519235,18322923,'./modules/sphinx','N','20231102154009',19519336,'0.2'),(19522899,18322923,'./modules/bannermgm','N','20231117181016',19523059,'0.1'),(19522900,18322927,'./widgets/bannermgm_widget','N','20231117181016',19525794,'0.2'),(19524346,18322950,'./widgets/login_info/skins/gallery_layout_login','N','20231109020430',19527566,'0.2'),(19525249,18322943,'./modules/textyle/skins/fotowallXE','N','20231120111135',19526784,'0.4.0'),(19526505,18322927,'./widgets/bible_read','N','20231114061858',19585818,'1.1'),(19526573,18322943,'./modules/board/skins/lune_board','N','20231116164718',20290780,'1.04'),(19527443,18322925,'./addons/event_board','N','20231108050035',19527447,'0.1'),(19527550,18322927,'./widgets/gallery_layout_widget','N','20231114034031',19532746,'1.0.0'),(19527787,18322927,'./widgets/sitemap','N','20231120031100',19527788,'0.1.0'),(19529399,18322954,'./layouts/crom_iXE','N','20231105152931',19600243,'1.0.3'),(19529916,18322943,'./modules/editor/skins/jowrneyEditor','N','20231105140609',19533373,'0.1.0'),(19529917,18322977,'해당사항없음','N','20231107214024',19533355,'0.1.0'),(19530900,18322950,'./widgets/content/skins/church_skin','N','20231109015916',19532808,'0.2'),(19530901,18322950,'./widgets/login_info/skins/church_layout_login','N','20231109020350',19530913,'0.1'),(19532317,18322954,'./layouts/portal_layout','N','20231116064020',19533824,'0.3'),(19532779,18322954,'./layouts/church_layout','N','20231105131155',19532784,'0.2'),(19533731,18322977,'./modules/point/icons/xeicon_coa','N','20231118233916',19736559,'3.0'),(19534671,18322927,'./widgets/sejin7940_calendar','N','20231107075709',19534672,'1.0'),(19548524,18322927,'./widgets/newest_document_tab','N','20231107081052',19548663,'0.2'),(19549401,18322925,'./addons/source_marking','N','20231113050413',19549402,'0.3'),(19550402,18322925,'./addons/socialxe_mid_forwarder','N','20231105130134',20361446,'1.0.3'),(19551431,18322977,'./modules/document/tpl/icons','N','20231114011618',19551432,'0.1'),(19555797,18322925,'./addons/prettyphoto','N','20231108125217',21336236,'1.1.3.0'),(19555878,18322925,'./addons/webfont','N','20231118110109',21378394,'1.1.3.1'),(19555887,18322925,'./addons/css3pie','N','20231107222615',20878725,'1.3.3.0'),(19555890,18322954,'./layouts/sketchbook5','N','20231116044841',21336191,'1.6.3.6'),(19555903,18322943,'./modules/board/skins/sketchbook5','N','20231120052635',22754336,'1.7.0'),(19555926,18322925,'./addons/tag_relation/skins/default','N','20231107222745',19915132,'0.9.5'),(19555927,18322950,'./widgets/socialxe_comment/skins/sketchbook5','N','20231108125913',22509535,'1.7.0'),(19560898,18322943,'./modules/member/skins/photoGalleryA','N','20231109000854',19560902,'1.0'),(19565911,18322925,'./addons/soo_body_content','N','20231107224136',19565912,'0.2'),(19566135,18322977,'./modules/point/icons/NetCabin_Lvic','N','20231105130213',19576465,'0.1'),(19570840,18322954,'./layouts/CN_No3','N','20231105134705',19582438,'1.0.4'),(19574799,18322925,'./addons/smenubox_scaleupdown','N','20231111142738',19576713,'0.1'),(19583417,18322925,'./addons/wiki-link','N','20231108050202',19600787,'0.2'),(19594292,18994172,'./m.layouts/sketchbook5Mobile','N','20231119231818',20557098,'1.2.2.3'),(19594435,18994170,'./modules/board/m.skins/sketchbook5Mobile','N','20231118033744',20973906,'1.2.3.3'),(19600206,18322925,'./addons/autowww','N','20231108091555',19604227,'1.0'),(19608490,18322925,'./addons/del-www','N','20231114032530',19608585,'0.1'),(19618448,18322954,'./layouts/Tony','N','20231113193927',19620083,'0.1.1'),(19618480,18322950,'./widgets/login_info/skins/Tony','N','20231109020438',19618481,'0.1.0'),(19623053,18322950,'./widgets/login_info/skins/neutral','N','20231120012710',20803425,'0.2'),(19623082,18322950,'./widgets/login_info/skins/graystyle','N','20231117203419',22756124,'0.22'),(19623904,18322954,'./layouts/layout_photoGalleyA_sub','N','20231109024044',19623910,'1.2'),(19623994,18322954,'./layouts/layout_newsMagazine_free','N','20231109024204',19623995,'1.0'),(19624853,18322950,'./widgets/login_info/skins/Quad','N','20231109020026',19624859,'1.0.0'),(19624858,18322954,'./layouts/Quad','N','20231105131833',19630832,'1.0.3'),(19630138,18322954,'./layouts/SimpleDropDown','N','20231109023919',20467486,'2.0.0'),(19637507,18322943,'./modules/board/skins/JB_erebus_board','N','20231102155911',22450338,'1.3.1'),(19639463,18322952,'./widgetstyles/lineBox','N','20231107181046',19639464,'0.1'),(19655120,18322954,'./layouts/NetCabin_X3','N','20231120052335',20430977,'0.2.2'),(19657758,18322954,'./layouts/NetCabin_X2','N','20231120051339',19657761,'0.1'),(19657941,18322929,'./modules/editor/components/chess','N','20231108050226',19688815,'1.1.2'),(19673444,18904838,'./modules/editor/styles/NomarginPTag','N','20231109052623',19675462,'0.0.1.1'),(19674194,18904838,'./modules/editor/styles/misol','N','20231107043219',19674198,'0.1'),(19674471,18322927,'./widgets/twitter','N','20231107081157',19676523,'0.2'),(19684891,18322954,'./layouts/elkha_pieces','N','20231105140154',19788968,'0.2'),(19684961,18322950,'./widgets/login_info/skins/eond_gateway','N','20231105140109',19684962,'0.5'),(19692489,18322927,'./widgets/music24_kr_clock','N','20231107075726',19692490,'1.0.0'),(19700913,18322954,'./layouts/elkha_monochrome','N','20231107220707',19803893,'0.12'),(19702417,18322950,'./widgets/login_info/skins/monochrome','N','20231112184504',20803243,'0.2'),(19702419,18322950,'./widgets/language_select/skins/monochrome','N','20231105125627',19702444,'0.1'),(19705472,18322927,'./widgets/content/skins/XEgrid_content','N','20231113143940',19705666,'1.1'),(19707673,18322950,'./widgets/newest_document/skins/CN_No_series','N','20231105132614',19707678,'1.1'),(19707730,18322952,'./widgetstyles/CN_No_series','N','20231108110505',19707731,'1.1'),(19707750,18322954,'./layouts/CN_No4','N','20231113194115',19708324,'1.1'),(19708869,18322927,'./widgets/navigation','N','20231107081036',19712189,'0.4'),(19711536,18322954,'./layouts/people blue','N','20231102160542',19744693,'0.5'),(19712183,18322954,'./layouts/smart','N','20231114100223',20902184,'0.9.9'),(19712751,18322954,'./layouts/layout_skin(xenara_v1.2_type2_xe1.4.5.2)','N','20231120053329',19712752,'1.2'),(19723352,18322927,'./widgets/facebook','N','20231107080939',19723353,'0.1'),(19740666,18322943,'./modules/textyle/skins/PHOTOGRAPHER','N','20231109000917',19757669,'0.2'),(19740680,18322943,'./modules/textyle/skins/DESIGNER','N','20231114062205',19757652,'0.2'),(19740711,18322943,'./modules/textyle/skins/designspiration','N','20231109001040',19757610,'0.2'),(19744664,18322943,'./modules/textyle/skins/BlueMood','N','20231109000648',19757584,'0.2'),(19749792,18322954,'./layouts/layoutwotc_text','N','20231113142109',22596494,'1.0.7'),(19754728,18322977,'./modules/point/icons/ca_ladder_60','N','20231105130719',19755182,'0.1'),(19759864,18322927,'./widgets/google_map','N','20231106083025',19759892,'0.2'),(19765252,18322954,'./layouts/XEgrid_Free','N','20231105125646',19765321,'1.0.3'),(19767397,18322954,'./layouts/columnist','N','20231110104356',20270404,'1.5.1'),(19775760,18322950,'./widgets/content/skins/Photographer','N','20231105130159',19775761,'0.1'),(19775788,18322950,'./widgets/content/skins/default_new','N','20231105124934',19775789,'0.1'),(19775816,18322950,'./widgets/content/skins/default2','N','20231105134631',19775820,'0.1'),(19775829,18322950,'./widgets/tag_list/skins/default1','N','20231112083309',19775830,'0.1'),(19775849,18322950,'./widgets/tag_list/skins/default2','N','20231109024548',19775850,'0.1'),(19775878,18322950,'./widgets/tag_list/skins/default3','N','20231120061555',19775879,'0.1'),(19775899,18322950,'./widgets/counter_status/skins/Designspiration','N','20231105130203',19775901,'0.1'),(19775908,18322950,'./widgets/counter_status/skins/default_new','N','20231116110342',19775909,'0.1'),(19775924,18322950,'./widgets/counter_status/skins/default2','N','20231105130201',19775928,'0.1'),(19775942,18322950,'./widgets/category/skins/Designspiration','N','20231111234251',19775943,'0.1'),(19775958,18322950,'./widgets/category/skins/BlogskinDesigner','N','20231115024607',19775962,'0.1'),(19775971,18322950,'./widgets/category/skins/default_new','N','20231105130126',19775972,'0.1'),(19804189,18322925,'./addons/elkha_www','N','20231113212731',20702493,'0.11'),(19806836,18322977,'./modules/point/icons/elkha_poporina_zerostar50','N','20231107220550',19806837,'0.1'),(19807569,18322950,'./widgets/login_info/skins/webengine_black','N','20231102161708',19827659,'1.2'),(19816429,18322954,'./layouts/CN_No5','N','20231107220511',19816430,'1.0'),(19816467,18322950,'./widgets/newest_document/skins/CN_No5','N','20231107131137',19816468,'1.0'),(19816486,18322950,'./widgets/newest_comment/skins/CN_No5','N','20231105131906',19816487,'1.0'),(19817434,18322929,'./modules/editor/components/eh_player','N','20231117203422',22755204,'1.7'),(19818901,18322954,'./layouts/ikarusv1simple','N','20231105125048',19829113,'1.1.0'),(19831182,18322954,'./layouts/layout_skin(xenara_v3.0_type2_xe1.4.4.4)','N','20231120053320',19831183,'3.0'),(19831194,18322954,'./layouts/layout_skin(xenara_v3.1_type2_xe1.4.4.4)','N','20231120053322',19831195,'3.1'),(19833041,18322952,'./widgetstyles/sctb','N','20231108050338',20213631,'6.0'),(19834157,18322954,'xe/layouts','N','20231105134700',19834158,'0.2.1'),(19849619,18322952,'./widgetstyles/SteelblueRound','N','20231108100331',19849620,'0.1'),(19854096,18322927,'./widgets/qrcode_creator','N','20231105140129',19854097,'0.1'),(19859881,18322925,'./addons/googleplus','N','20231108050340',19864516,'0.1.1'),(19862381,18322925,'./addons/soo_googleplus','N','20231108050345',19890691,'0.2.1'),(22753528,18322925,'./addons/point_pangpang_plus','N','20231112063355',22754951,'0.2b'),(19875631,18322925,'./addons/gosite','N','20231108050349',19875632,'0.1'),(19885185,18322943,'./modules/board/skins/sr_memo','N','20231120053426',20959847,'0.9.1'),(19891355,18322954,'./layouts/steelblue4_Basic','N','20231120045803',19891356,'4'),(19894029,18322943,'./modules/bodex/skins/sw_contact','N','20231119010436',19902554,'0.9'),(19901434,18994170,'./modules/board/m.skins','N','20231119212203',19902394,'0.1'),(19906026,18322925,'./addons/mypeople','N','20231108050354',19906139,'0.0.1'),(19918081,18322943,'./modules/board/skins/CNboard','N','20231109000750',19918082,'1.0'),(19918823,18322954,'./layouts/cimple_plus','N','20231105124907',19921280,'1.3c'),(19923002,18322925,'./addons/sejin7940_write_limit','N','20231102162422',22687892,'1.5.2'),(19960240,18322925,'./addons/sejin7940_readed_count','N','20231119204337',19960243,'1.6'),(19962621,18322943,'./modules/member/skins/noangel_black','N','20231109000623',19962952,'1.0a'),(19964934,18322950,'./widgets/login_info/skins/cronos_free','N','20231120073551',20187569,'1.1'),(19974913,18322954,'./layouts/Dynamic','N','20231102162605',20429124,'3.0'),(19976643,18322950,'./modules/message/skins/naruCD','N','20231120064332',19984421,'0.1.2'),(19988049,18322977,'./modules/point/icons','N','20231120111316',19988222,'1.1.1'),(20003560,18322977,'레이아웃에서 직접 업로드','N','20231104122107',20003621,'1.0'),(20070033,18322927,'./widgets/widget_kgcalendar','N','20231120053324',20117642,'1.1'),(20070206,18322927,'./widgets/widget_kgcontent','N','20231120053331',20315271,'1.2'),(20074878,18322954,'./layouts/elkha_tskorea','N','20231117092258',22755825,'0.3'),(20075809,18322950,'./widgets/language_select/skins/tskorea','N','20231113231015',20092424,'0.1'),(20075810,18322927,'./widgets/layout_info','N','20231107220333',20092486,'0.1'),(20079764,18322950,'./widgets/counter_status/skins/flash','N','20231105125104',20079797,'0.1'),(20091784,18322927,'./widgets/shopxeslider','N','20231113223746',20123108,'V1.1'),(20092690,18322950,'widgets/content/skins/elkha_nivo','N','20231107045150',20092697,'0.1'),(20092760,18322925,'./addons/elkha_packer','N','20231107220815',20702463,'0.11'),(20117694,18322943,'.modules/board/skins','N','20231120110143',20117695,'1.0'),(20118343,18322925,'./addon/cufon','N','20231111174553',20190605,'0.1.0'),(20120961,18322927,'./widgets/treasurej_popular','N','20231115212359',22550390,'1.0.5'),(20122381,18322950,'./widgets/treasurej_popular/skins/treasurej_popular_tabr','N','20231114042957',21972737,'1.1'),(20155119,18322943,'./modules/member/skins/XET_member','N','20231102163237',21197586,'1.2'),(20155171,18322943,'./modules/communication/skins/XET_communication','N','20231102163259',21344485,'1.2.1'),(20168220,18322954,'./layouts/xe_cafe_site','N','20231108001441',21803913,'1.7.0'),(20168286,18322950,'./widgets/login_info/skins/cafe_site','N','20231107215719',21802090,'1.7.0'),(20168297,18322950,'./widgets/language_select/skins/cafe_site','N','20231107215712',21802140,'1.7.0'),(20185969,18322927,'./widgets/autoredirect','N','20231102163428',20185972,'1.0'),(20186750,18322950,'./widgets/treasurej_popular/skins/treasurej_popular_tabs','N','20231112201249',21972593,'1.1'),(20187337,18322923,'./modules/guestbook','N','20231116160832',21962590,'1.7.0.1'),(20187411,18322923,'./modules/faq','N','20231120070801',21854296,'1.7.0.1'),(20187450,18322923,'./modules/contact','N','20231114004523',21968983,'1.7.0.2'),(20236415,18322943,'./modules/attendance/skins/sr_at_skin','N','20231114045759',20236418,'0.1'),(20242228,18322943,'/modules/editor/skins','N','20231105131817',20624981,'0.1'),(20259612,18322954,'./layouts/HappyTravel_v1','N','20231105124605',20261781,'1.0'),(20276661,18322950,'./widgets/login_info/skins/cafe_official','N','20231107215646',21801927,'1.7.0'),(20276676,18322950,'./widgets/language_select/skins/xe_cafe_language','N','20231105134143',20276677,'0.1'),(20276726,18322954,'./layouts/xe_cafe_hub','N','20231107223251',21803871,'1.7.0'),(20277082,18322943,'./modules/homepage/skins/xe_cafe_v2','N','20231105142812',20309227,'0.1.1'),(20277901,18322925,'./addons/controlbox','N','20231111174558',20632434,'1.0.1'),(20279228,18322923,'./modules/boardauction','N','20231119121405',20295567,'0.1.1'),(20279332,18322943,'./modules/board/skins/xe_auction','N','20231119214632',20369078,'0.1.1'),(20290703,18994170,'./modules/board/m.skins/m_sr_memo','N','20231114130435',20300033,'0.3.6'),(20324298,18322923,'./modules/textmessage','N','20231117181121',22755760,'3.2.1'),(20324311,18322923,'./modules/notification','N','20231113111523',22755762,'2.4.2'),(20330088,18322954,'./layouts/layoutwotc_portal','N','20231105125056',20691619,'1.0.2'),(20340640,18322925,'./addons/iphone_checkbox','N','20231111174602',20409821,'1.0a'),(20350195,18322927,'./widgets/contentslist','N','20231105124915',20350196,'0.5'),(20393822,18322923,'./modules/newposts','N','20231115081950',22755538,'2.4'),(20401336,18322954,'./layouts/style_a_lite','N','20231114085042',22754751,'2.1.5'),(20415487,18322943,'./modules/lottery/skins/simple','N','20231114084304',20451828,'1.1'),(20427455,18322952,'./widgetstyles/admin_ws','N','20231116214846',20454155,'0.2'),(20453531,18322925,'./addons/bodyfade','N','20231111174748',21401825,'0.2.3'),(20458826,18322954,'./layouts/we_home','N','20231105125639',20980624,'1.8'),(20464644,18322927,'./widgets/vanner','N','20231114215951',20464663,'0.2'),(20466120,18322925,'./addons/elfinder','N','20231111174752',20480086,'0.1.1'),(20472943,18322954,'./layouts/xe_solid_enterprise_LeCiel_v1','N','20231113183914',20613484,'1.7'),(20473328,18904838,'./modules/editor/skins/fckplus','N','20231119132048',20487316,'1.1a'),(20473753,18322943,'./modules/editor/skins/xeed','N','20231105125821',20473754,'0.2'),(20476783,18904838,'./modules/editor/skins/fckplus_SimpleWhite','N','20231118220830',20487172,'1.1a'),(20476937,18322943,'./modules/contact/skins/cameron','N','20231114073403',21970579,'1.5'),(20493834,18322950,'./widgets/content/skins/updatenews','N','20231102164514',21134264,'1.8'),(20495669,18322943,'./modules/member/skins/simple','N','20231105124540',20507441,'0.1'),(20502461,18322943,'./modules/message/skins/cmd_message','N','20231105125622',20502462,'0.1'),(20509760,18322943,'./modules/page/skins/sejin7940_page','N','20231114063404',22572810,'1.4.1'),(20514706,18322943,'./modules/board/skins/simple_board','N','20231105130714',22754093,'1.3'),(20519604,18322943,'./modules/member/skins/simple_for_14','N','20231113182844',21193099,'0.2'),(20520233,18322952,'./widgetstyles/sketchbook5_wincomi','N','20231111174837',20798858,'3.0'),(20520855,18322925,'./addons/color_message','N','20231111174840',20520858,'1.1'),(20522778,18322925,'./addons/color_message_for_14','N','20231105125629',20522789,'1.0'),(20522820,18322950,'./widgets/bible_read/skins/KnDol','N','20231107213404',20590447,'1.1.0'),(20525058,18322925,'./addons/popup_menu_like_1_4','N','20231111174844',20798880,'1.0'),(20526823,18322925,'./addons/me2plugin_for_14','N','20231105125625',20526828,'1.0'),(20531619,18322954,'./layouts/white_square_layout','N','20231102164918',20882875,'1.3'),(20533710,18322950,'./widgets/xeBanner/skins','N','20231117194217',20533711,'1.0.0'),(20547035,18322925,'./addons/exif','N','20231114033252',21378417,'0.9.2.2'),(20557173,18322950,'./widgets/content/skins/xe2011_contributor_present','N','20231104152112',20557174,'0.1'),(20558958,18322950,'./widgets/lnb_menu/skins','N','20231102165050',20558964,'0.1.0'),(20564368,18322925,'./addons/sejin7940_align','N','20231110141749',20564370,'1.0'),(20579823,18322954,'./layouts/SilverCloud','N','20231109235543',20579824,'1.0'),(20605745,18322927,'./widgets/widget_kgmedia','N','20231120053342',20695833,'1.1'),(20612563,18322927,'./widgets/contentsmedia','N','20231107215937',20696865,'0.7'),(20644220,18322925,'./addons/prohibit_monologue','N','20231105125620',20644221,'0.1'),(20649732,18322925,'./addons/commentwritedownload','N','20231111174851',20681999,'0.3'),(20670102,18322923,'./modules/lisense','N','20231107220528',20692149,'0.1'),(20673638,18322925,'./addons/html5audio_flash','N','20231102165537',22541039,'1.5.1'),(20673640,18322925,'./addons/falling_snow','N','20231111174855',20697610,'1.5.0'),(20673970,18322923,'./modules/referer','N','20231117203430',22756252,'3.12.1'),(20673999,18322925,'./addons/referer','N','20231115225622',22755559,'3.5.1'),(20687933,18322954,'./layouts/xdt_offical_2','N','20231102170734',20949015,'1.4'),(20707031,18322943,'/modules/contact/skins','N','20231105135723',20707032,'1.0'),(20710471,18322923,'./modules/checkip','N','20231105124831',20765854,'0.2.2'),(20789735,18322943,'./modules/socialxe/skins/bootstrap.single','N','20231105124706',20789736,'1.0'),(20792413,18322950,'./widgets/content/skins/sticky_note','N','20231104205019',20792414,'1.0.3.0'),(20796792,18322927,'./widgets/notice','N','20231107212326',22755365,'1.0.6'),(20806148,18322925,'./addons/nonebutton','N','20231111174948',20823285,'0.1.1'),(20832909,18322927,'./widgets/user_finder','N','20231102171005',20836373,'0.1'),(20832931,18322923,'./modules/user_finder','N','20231103091441',20836347,'0.1'),(20908270,18322923,'./modules/detail_search','N','20231116185529',20949711,'0.1.1'),(20908354,18322950,'./widgets/dswidget','N','20231116185529',20950044,'0.1.1'),(20927819,18322950,'./widgets/login_info/skins/photo15','N','20231117050940',22253694,'1.1'),(20936395,18322923,'./modules/umessage','N','20231105124636',20943903,'1.1'),(20949728,18322925,'./addons/CssOutPlus','N','20231119205017',20952200,'1.1'),(20951206,18322925,'./addons/css3pie_js','N','20231102171218',20966650,'1.1.1'),(20954749,18322925,'./addons/message_alarm','N','20231111175009',21041089,'2.0'),(20957609,18322925,'./addons/wating_message','N','20231111175014',20957612,'0.1.1'),(20959091,18322925,'./addons/doc_viewer','N','20231120050117',20959094,'0.1.2'),(20966755,18322954,'./layouts/xdt_community','N','20231102171221',21002067,'1.1'),(20971314,18322925,'./addons/kakao_link','N','20231111175021',20975200,'0.2'),(20989209,18322954,'./layouts/Chemistry_lite','N','20231107213944',20989210,'1.0'),(20999893,18322927,'./widgets/sys_status','N','20231119205022',21005314,'3.1.1'),(21003996,18322927,'./widgets/xestream','N','20231115082901',21014531,'0.2'),(21004386,18322950,'./widgets/sys_status/skin/simple','N','20231119205015',21004387,'0.1'),(21009029,18322954,'./layouts/xdt_community_2','N','20231108124157',21009030,'1.0'),(21014822,18322929,'./modules/editor/components/soo_youtube','N','20231111175055',21039496,'0.5.1'),(21015635,18322925,'./addons/appoint_view_user','N','20231120064656',22755995,'2.0'),(21038796,18322950,'./widgets/point_status/skins/bootstrap','N','20231105124852',21146775,'1.2'),(21038825,18322950,'./widgets/content/skins/sketchbook5_style','N','20231119213417',22756032,'1.1.1'),(21090780,18322954,'./layouts/pleasure','N','20231114010208',21092056,'1.2'),(21092346,18322925,'./addons/xdt_button','N','20231111175126',21739119,'2.1'),(21124707,18322925,'./addons/soo_add_ssl','N','20231113091330',21124708,'0.1'),(21146815,18322950,'./widgets/sys_status/skins/tb','N','20231105124828',21146816,'1.0'),(21154641,18322925,'./addons/iframe_resize','N','20231119190436',21189969,'0.2'),(21189057,18322925,'./addons/settitle','N','20231111175140',21383555,'1.3'),(21189175,18322925,'./addons/texteffect','N','20231118073206',21197591,'0.2 beta'),(21190663,18322925,'./addons/report_addon','N','20231120053302',21194703,'0.2'),(21194822,18322929,'./modules/editor/components/simple_jw','N','20231111175202',21364752,'0.3.0'),(21194850,18322925,'./addons/bootstrap_btn','N','20231111175208',21194883,'1.0'),(21195053,18322925,'./addons/bootstrap_icon','N','20231111175213',21202617,'1.1a'),(21195185,18322923,'./modules/authentication','N','20231105124720',22754169,'3.1.2'),(21196855,18322927,'./widgets/camtv','N','20231105134154',21228634,'0.1'),(21204144,18322925,'./addons/number_display','N','20231111175217',21204145,'0.1'),(21211103,18322923,'./modules/sejin7940_comment','N','20231111175225',22755699,'1.8'),(21220010,18322925,'./addons/limit_message','N','20231118143217',21229637,'0.2'),(21221462,18322925,'./addons/naver_analytics','N','20231102171312',22658323,'1.2'),(21231044,18322923,'./modules/reset_password','N','20231114014257',22728311,'1.2'),(21245296,18322954,'./layouts/xe_official_v2.2','N','20231105131846',21295736,'v.2.2'),(21262112,18322925,'./addons/scrollbar','N','20231111175233',21262114,'0.9.1'),(21289114,18322925,'./addons/division','N','20231111175237',21294767,'1.0'),(21290615,18994170,'./modules/board/m.skins/xenon_m_board','N','20231111175306',21393065,'1.5'),(21290617,18994170,'./modules/page/m.skins/xenon_m_page','N','20231111175312',21295253,'1.1'),(21290626,18994170,'./modules/member/m.skins/xenon_m_member','N','20231113220557',21429905,'1.0'),(21290627,18994172,'./m.layouts/XenonMoblie','N','20231120021350',21815540,'1.9.1'),(21298003,18322925,'./addons/layerpopup','N','20231116183331',22754287,'1.10'),(21302525,18322954,'./layouts/xdt_pure','N','20231111175539',22755554,'1.6'),(21305288,18322952,'./widgetstyles/nico','N','20231115024508',21532773,'2.0'),(21305881,18322923,'./modules/xewall','N','20231104090833',22754355,'0.3.1'),(21352623,18322925,'./addons/mresizer','N','20231111175616',22755552,'1.6'),(21354730,18322925,'./addons/msg_point','N','20231107221241',21354731,'1.0'),(21354767,18322925,'./addons/change_nickname','N','20231107220852',22754182,'2.0'),(21364832,18322950,'./widgets/newest_comment/skins/mynote','N','20231102171403',21364833,'0.1'),(21367559,18322954,'/layout','N','20231105124730',21389903,'0.0.2'),(21369594,18322925,'./addons/my_comment_addon','N','20231111175619',21394119,'1.1.2'),(21369690,18322950,'./widgets/newest_comment/skins/xenon_m_com','N','20231107215936',21370425,'1.1'),(21369691,18322950,'./widgets/newest_document/skins/xenon_m_doc','N','20231105131805',21369734,'1.0'),(21369692,18322950,'./widgets/newest_document/skins/xenon_m_gel','N','20231107215811',21369738,'1.0'),(21370287,18322923,'./modules/smartux','N','20231119212218',21370289,'1.0.2'),(21373345,18322925,'./addons/searchhighlight','N','20231117235019',21394152,'0.2'),(21374711,18322923,'./modules/ncenterlite','N','20231117203434',22756275,'3.0.9'),(21378491,18994170,'./modules/board/m.skins/sketchbook5','N','20231120052636',22754337,'1.7.0'),(21382622,18322925,'./addon/jquery_snow','N','20231111175644',21391227,'0.0.1'),(21384926,18322925,'./addons/dragcolor','N','20231119212215',21385023,'1.0'),(21388442,18322923,'./modules/mobileex','N','20231105124716',22107721,'0.6.1'),(21391263,18322925,'./addons/mbanner','N','20231119204152',21391414,'1.0'),(21396254,18322950,'./widgets/content/skins/tb_sb','N','20231107220304',21396255,'1.0'),(21398290,18322925,'./addons/pagechange','N','20231115204349',21432465,'3.0'),(21400134,18322925,'./addons/securityPlus','N','20231119212212',21400135,'1.0.0'),(21410063,18322952,'./widgetstyles/xdt_windless','N','20231108110643',21410071,'1.0'),(21411060,18322943,'./modules/socialxe/skins/tb','N','20231104114508',22122003,'1.1'),(22753897,18322925,'./addons/floating_video','N','20231114040435',22755842,'0.6.0'),(21411087,18322943,'./modules/socialxeserver/skins/tb','N','20231105140054',21411095,'1.0'),(21411172,18322943,'./modules/contact/skins/tb','N','20231105124555',21411184,'1.0'),(21412475,18322923,'./modules/recruit','N','20231105124534',21412476,'1.0'),(21413017,18322927,'./widgets/xegallery','N','20231115145931',21433519,'0.3'),(21415137,18322925,'./addons/setitle2','N','20231119212210',21415140,'2.1.0'),(21428178,18322954,'./layouts/xdt_simple_home','N','20231102171632',22403086,'1.4'),(21439563,18322925,'./addons/kru_sslhelper','N','20231119205020',21711242,'3.0.1'),(21526323,18322925,'./addons/noclick','N','20231117071749',22754294,'1.3'),(21535219,18322954,'./layouts/live_login','N','20231105135651',21768603,'1.5.0.0'),(21591779,18322925,'./addons/radarURL','N','20231120070858',21594258,'1.2'),(21606824,18322925,'./addons/href_fixed1','N','20231102171645',21606841,'1.0'),(21620531,18322925,'./addons/opengraph','N','20231120050106',21620532,'0.0.2'),(21626541,18322925,'./addons/Redirection','N','20231105124543',21626542,'1.0a'),(21643081,18322950,'./widgets/content/skins/mynote','N','20231107220622',21643082,'0.1'),(21643233,18322954,'./layouts/Express999','N','20231107213808',21838875,'2.1'),(21648251,18322950,'./widgets/content/skins/tb_cw','N','20231107220008',21978061,'2.2'),(21651786,18322925,'./addons/scmplayer','N','20231104203248',22299133,'1.5'),(21715889,18322943,'./modules/message/skins/eond','N','20231102171725',21715890,'0.1'),(21717275,18322923,'./modules/okname','N','20231120050127',21726208,'0.2.0'),(21717279,18322925,'./addons/okname','N','20231120050122',21726233,'0.2.0'),(21736776,18322925,'./addons/kru_dab','N','20231119204538',21748943,'1.1'),(21749702,18994170,'./modules/textyle/m.skins','N','20231108233441',21762837,'0.9'),(21752944,18322925,'./addons/layerAlert','N','20231107220212',21753018,'1.1'),(21761048,18322954,'./layouts/eond_rosso','N','20231109051258',21791719,'0.3.3'),(21776217,18322954,'./layouts/eond_starter','N','20231120055804',21776218,'0.1'),(21782412,18322954,'./layouts/eond_compact','N','20231109051808',21782413,'0.8.4'),(21788706,18322925,'./addons/AntiProxy','N','20231107075753',21788708,'1.0.0'),(21798677,18322943,'./modules/ncenterlite/skins/playerplace','N','20231105125046',21798682,'1.0.1'),(21802016,18322943,'./modules/board/skins/xe_official_planner123/colorset','N','20231120033602',22754341,'0.4'),(21805731,18322925,'./addons/activescrollbar','N','20231105125049',21805732,'1.0'),(21807603,18322927,'./widgets/xehoverdir','N','20231107220115',21807604,'0.1'),(21810388,18322954,'./layouts/xdt_black_time','N','20231102171905',22403080,'1.2'),(21813965,18322943,'./modules/board/skins/xe_v3_gallery_haan','N','20231120090516',21814028,'0.3.1'),(21838367,18322927,'./widgets/foodin','N','20231105134636',21845017,'0.0.3'),(21838368,18322950,'./widgets/foodin/skin/simple','N','20231107220150',21845033,'0.0.1'),(21854312,18322923,'./modules/forum','N','20231108005214',21956789,'1.7.0.1'),(21855754,18322927,'./widgets/server_status','N','20231105140059',21885905,'0.2'),(21861240,18322943,'./modules/member/skins/tb','N','20231106175220',21861246,'1.0'),(21861251,18322943,'./modules/communication/skins/tb','N','20231106175221',21861263,'1.0'),(21861272,18322943,'./modules/message/skins/tb','N','20231105135725',21861277,'1.0'),(21861282,18322943,'./modules/integration_search/skins/tb','N','20231105131856',21861307,'1.0'),(21862798,18322954,'./layouts/brownwhite','N','20231114070619',21863022,'1.1'),(21876980,18322923,'./modules/multidomain','N','20231107205036',22755400,'1.4.1'),(21876999,18322925,'./addons/multidomain','N','20231107204623',22280906,'1.2'),(21883072,18322954,'./layouts/the_bootstrap','N','20231118143600',22755641,'3.5.2'),(21889835,18322925,'./addons/counter_ex','N','20231114125820',22754574,'1.1.0'),(21901097,18322925,'./addons/today_fortune','N','20231105084731',21908882,'1.0.1'),(21933112,18322925,'./addons/to_sns','N','20231111175813',22756009,'0.2.6'),(21933295,18322923,'./modules/realnotice','N','20231107220552',21933310,'0.5'),(21950613,18322925,'./addons/sejin7940_mustlogin','N','20231102172020',21959492,'0.2'),(21978106,18322925,'./addons/sejin7940_autotrash','N','20231102172024',21978124,'1.1.1'),(22069845,18322927,'./widgets/traffic_status','N','20231105123225',22069874,'1.0'),(22073155,18322923,'./modules/cash','N','20231104122331',22074809,'0.1'),(22115065,18322954,'./layouts/awake','N','20231120110111',22754348,'1.0.4'),(22115651,18322923,'./modules/pa','N','20231105142821',22121058,'1.0'),(22141994,18322977,'./modules/point/icons/level_icon','N','20231118174326',22734341,'SSS'),(22160991,18322977,'./modules/point/icons/wf_lv','N','20231119042051',22161011,'0.2'),(22186881,18322977,'./modules/point/icons/star','N','20231105140143',22186890,'S'),(22194465,18322925,'./addons/member_join_ex','N','20231107221230',22194483,'0.2.3'),(22208650,18322923,'/messageTalk','N','20231108140110',22208679,'1.1'),(22208653,18322925,'./addons/font-awesome','N','20231119190442',22226740,'1.0'),(22223413,18322925,'./addons/wiki_extend','N','20231107220854',22223443,'0.1'),(22228663,18322925,'./addons/addon_insert_sticker','N','20231119203002',22228684,'1.0'),(22235916,18322925,'./addons/zipped_xe','N','20231113123946',22278143,'0.3'),(22245450,18322943,'./widgets/logged_members/skins/w_redtokbox','N','20231105140132',22277385,'1.2'),(22260417,18322925,'./addons/301moved','N','20231107220632',22265949,'0.2'),(22263678,18322927,'./widgets/eh_whcarousel','N','20231117123340',22754205,'0.4'),(22266089,18322977,'./modules/point/icons/default_J','N','20231105140138',22266113,'PK_CP'),(22280542,18322954,'./layouts/simplestrap','N','20231119231942',22756198,'2.4.2'),(22282486,18322950,'./widgets/content/skins/simplestrap_sb','N','20231119231943',22756081,'1.1'),(22283649,18322943,'./modules/member/skins/simplestrap','N','20231119231943',22756205,'2.2'),(22283657,18322943,'./modules/communication/skins/simplestrap','N','20231119231943',22756200,'2.0.2'),(22288778,18322927,'./widgets/talkbox','N','20231119163710',22460980,'1.1'),(22301990,18322943,'./modules/board/skins/sketchbook5_youtube','N','20231120063835',22304077,'0.3'),(22303618,18322977,'./modules/point/icons/donek','N','20231105140141',22303661,'Acc'),(22305559,18322977,'./modules/point/icons/KJA_Love','N','20231105132447',22305588,'R'),(22332211,18322954,'./layouts/xdt_cool','N','20231108221341',22595789,'1.2.2'),(22337183,18322977,'./modules/point/icons/typical-t','N','20231105131826',22337194,'Timeless'),(22337993,18322954,'/layouts','N','20231105131831',22337998,'1.0.0'),(22348667,18322954,'./layouts/blue','N','20231107220125',22348685,'1.0'),(22753681,18322925,'./addons/hashtags','N','20231113133941',22755203,'1.2'),(22351328,18322943,'./modules/forum/skins/flat_forum_lite','N','20231105131821',22374400,'1.0.4'),(22356670,18322943,'./modules/integration_search/skins/yjsoft_ggcse','N','20231117203506',22756280,'0.2'),(22356680,18322977,'./modules/point/icons/zanazana','N','20231110101712',22356690,'I don\'t no'),(22359020,18322925,'./addons/elkha_simple_spam','N','20231111162638',22359071,'0.1'),(22377937,18322954,'./layouts/hestia','N','20231105123146',22754444,'2.1.4'),(22393789,18322950,'widgets/counter_status/skins/hestia_status','N','20231107215903',22393813,'1.0'),(22396862,18322954,'./layouts/xdt_style_b','N','20231114231319',22658304,'1.2.4'),(22402420,18322977,'./modules/point/icons/500-983','N','20231105123053',22402437,'fort'),(22440981,18322950,'./widgets/content/skins/eond_ygh','N','20231107220312',22440999,'0.3'),(22446815,18322923,'./modules/upgletyle','N','20231108125621',22692647,'0.1.4'),(22450636,18322943,'./modules/editor/skins/xpresseditor_axupload5','N','20231115081945',22755307,'1.2.1'),(22452877,18904838,'./modules/editor/styles/simplestrap','N','20231119231942',22452885,'0.1'),(22454021,18322923,'./messageTalk','N','20231119163710',22460914,'2.0.1'),(22455366,18322925,'./addons/block_document','N','20231104215053',22755330,'0.2'),(22456939,18322925,'./addons/xdt_scrollbar','N','20231102172842',22456955,'1.0'),(22467273,18322943,'./modules/board/skins/phiz_A_zine2','N','20231102172848',22471747,'1.0'),(22470148,18322954,'./layouts/layout_intermission','N','20231114082932',22545808,'0.9.6'),(22473723,18322954,'./layouts/daol_official','N','20231111175913',22755920,'1.3'),(22481310,18322977,'./modules/point/icons/Dandy_TJ','N','20231105123045',22481349,'I\'m very Dandy'),(22488105,18322954,'./layouts/webengine_white','N','20231107220159',22602278,'1.2'),(22497371,18322925,'./addons/url_shortener','N','20231104011517',22574332,'1.12'),(22501400,18322950,'./widgets/newest_document/skins/luke_doc','N','20231107220410',22502529,'v1.0'),(22501977,18322954,'./layouts/dark_white','N','20231105130704',22508454,'v1.1'),(22505945,18322950,'./widgets/newest_comment/skins/luke_doc','N','20231107220019',22505955,'v1.0'),(22511691,18322925,'./addons/member_activity_check','N','20231102173002',22754292,'0.4'),(22514693,18994172,'./m.layouts/xenon_nx','N','20231113224403',22754354,'0.9.3'),(22516532,18322925,'./addons/langfilter','N','20231119124939',22754507,'0.7'),(22526030,18322927,'./widgets/simple_clock','N','20231105131749',22537348,'1.1'),(22526528,18322925,'./addons/falling_snow2','N','20231102173019',22528351,'1.0.0'),(22526756,18322925,'./addons/falling_snow3','N','20231104062028',22528554,'1.0.0'),(22529686,18322927,'./widgets/simple_calendar','N','20231114091741',22579892,'1.3'),(22529898,18322950,'./widgets/browserWidget/skins/simplestrap','N','20231105124856',22529948,'0.1'),(22530581,18322943,'./modules/board/skins/contact_write','N','20231117203508',22755840,'1.14'),(22531811,18322950,'./widgets/treasurej_popular/skins/neat_popular_tabs','N','20231118110055',22754295,'1.1'),(22535332,18322954,'./layouts/xeschool_red','N','20231115215632',22535344,'red'),(22535350,18322977,'./modules/point/icons/redskiicons','N','20231105123049',22535354,'redski'),(22535360,18322977,'./modules/point/icons/plusalpine','N','20231113193942',22535364,'plusAlpha'),(22537451,18322925,'./addons/bootstrap3_css','N','20231107220418',22537493,'1.0'),(22539420,18322927,'./widgets/cute_clock','N','20231105124608',22539425,'1.0'),(22540074,18322954,'./layouts/s4us_1.0','N','20231105124557',22540131,'1.0'),(22540502,18322943,'./modules/contact/skins/phizContact','N','20231110063024',22540527,'1.0'),(22540996,18322929,'./modules/editor/components/multimedia_link','N','20231118110132',22616932,'1.2.0'),(22542943,18322954,'./layouts/Fresh','N','20231115232735',22543307,'1.0'),(22544858,18322925,'./addons/html5video_flash','N','20231102173212',22544908,'1.0.0'),(22547855,18994170,'./modules/member/m.skins/Blouse','N','20231111180219',22568070,'1.3'),(22549104,18322925,'./addons/recommend','N','20231117160005',22549119,'1.0'),(22553944,18322925,'./addons/xdt_css','N','20231102173223',22553960,'1.0'),(22556480,18322927,'./widgets/moonchat','N','20231118165939',22755858,'3.0.1'),(22562932,18322950,'./widgets/sitemap/skins/select','N','20231114014424',22585636,'0.3.3'),(22563110,18322950,'./widgets/content/skins/s4utabview','N','20231105125816',22563143,'1.0'),(22563158,18322954,'./layouts/nextep','N','20231105125724',22581078,'nextep v1.2'),(22566102,18322943,'./modules/board/skins/wmboard','N','20231114073340',22573020,'2.1'),(22568598,18322954,'./layouts/xdt_simple_home2','N','20231116180346',22715996,'1.0.1'),(22572346,18322927,'./widgets/hindole','N','20231114124901',22572496,'1.0'),(22572358,18322950,'./widgets/newest_comment/skins/hindole_v1_com','N','20231105135604',22572455,'1.0'),(22572362,18322954,'./layout/book_layout','N','20231105140151',22572485,'1.0'),(22572365,18322952,'./widgetstyles/hindole_box','N','20231114051611',22600170,'1.1'),(22572369,18322952,'./widgetstyles/simple-style','N','20231108110639',22572466,'1.0'),(22572375,18322950,'./widgets/newest_document/skins/hindole_v1_doc','N','20231105130725',22572430,'1.0'),(22577184,18322923,'./modules/sejin7940_copy','N','20231119205538',22756190,'1.4'),(22579388,18322923,'./modules/money','N','20231118191712',22702291,'0.1.3'),(22580059,18322925,'./addons/xesticky','N','20231107215950',22580144,'0.1'),(22581369,18322927,'./widgets/towc_new_docu','N','20231120070505',22638452,'1.9'),(22583905,18322950,'./widgets/content/skins/phiz_rwd_images','N','20231120050958',22583963,'1.0'),(22583972,18322954,'./layouts/phizRWDThemes','N','20231113215319',22714063,'1.2'),(22585779,18322943,'./modules/board/skins/sm','N','20231105131848',22696276,'1.9.7'),(22587055,18994170,'./modules/board/m.skins/sm','N','20231111180439',22693248,'0.5.8'),(22589792,18994172,'./m.layouts/webbuilder','N','20231117203519',22589821,'1.0.1'),(22590697,18322943,'./modules/editor/skins/ckeditor','N','20231113032754',22590711,'1.0.0'),(22591861,18322954,'./layouts/webbuilder_layout','N','20231120082138',22610423,'1.0.3'),(22594541,18322923,'./modules/nproduct','N','20231119190348',22755889,'2.6.2'),(22594546,18322923,'./modules/nstore','N','20231119190205',22755810,'2.5.2'),(22594548,18322923,'./modules/store_review','N','20231119190118',22755815,'2.5.2'),(22594549,18322923,'./modules/ncart','N','20231117032901',22755807,'2.5.2'),(22594556,18322923,'./modules/epay','N','20231119190049',22755804,'2.5.2'),(22594557,18322923,'./modules/nmileage','N','20231104094114',22755808,'2.5.2'),(22594571,18322927,'./widgets/frontdisplay','N','20231105124833',22596682,'1.0'),(22594576,18322927,'./widgets/category_menu','N','20231105131858',22596721,'1.2'),(22594585,18322925,'./addons/trolley','N','20231106145344',22596756,'0.3'),(22596809,18322923,'./modules/nstore_digital','N','20231108151157',22755812,'2.5.2'),(22596810,18322923,'./modules/nstore_digital_contents','N','20231102173615',22755811,'2.5.2'),(22597020,18322923,'./modules/license','N','20231105131746',22635123,'1.2.1'),(22597112,18322923,'./modules/cympusadmin','N','20231120112406',22755802,'2.5.2'),(22597120,18322923,'./modules/store_search','N','20231115172104',22755816,'2.5.2'),(22597227,18322923,'./modules/paynoty','N','20231107213734',22755890,'2.6.2'),(22597855,18322943,'./modules/board/skins/rest_default','N','20231105131201',22723910,'1.2.1'),(22605220,18322925,'./addons/cameron_plugin','N','20231107213737',22754521,'1.2'),(22607524,18322925,'./addons/dsori_submanager_free','N','20231102173642',22608742,'0.1740.2'),(22753629,18322927,'./widgets/Ding_Button_Collection','N','20231102181259',22754874,'1.1'),(22610153,18322943,'./modules/editor/skins/dsori_ckeditor','N','20231111180508',22624901,'0.1740.3'),(22753996,18322943,'./modules/board/skins/ena_board_set_simplemellow','N','20231117214622',22756265,'1.0.0'),(22610154,18322925,'./addons/dsori_ckeditor_setting','N','20231111180524',22624891,'0.1740.3'),(22610502,18322954,'./layouts/webbuilder_layout2','N','20231115234051',22614812,'1.0.3'),(22611192,18322925,'./addons/dsori_facebook_comment','N','20231111180536',22613855,'0.1740.2'),(22616427,18322925,'./addons/pushwing','N','20231110061809',22663888,'0.5'),(22616439,18322925,'./addons/pushwing_comment','N','20231102173656',22639689,'0.5'),(22617898,18322923,'./modules/automail','N','20231105131911',22617911,'0.1'),(22618830,18322925,'./addons/checklen','N','20231114011539',22754320,'1.3'),(22622633,18322925,'./addons/blockact','N','20231111180546',22755957,'1.1'),(22627992,18322954,'./layouts/orange_simple','N','20231113113319',22670250,'1.4'),(22631178,18322925,'./addons/mobile_redirect','N','20231102173739',22631183,'1.0'),(22631822,18322954,'./layouts/xeview_layout','N','20231105122630',22631830,'1.2'),(22631837,18322954,'./layouts/five_start','N','20231113175206',22631859,'1.0'),(22634250,18322925,'./addons/browser_helper','N','20231102173831',22634254,'1.0'),(22634927,18322952,'./widgetstyles/m_cronos_ws','N','20231111180549',22647143,'1.1'),(22634955,18322950,'./widgets/mcontent/skins/m_cronos_w','N','20231114023437',22647135,'1.1'),(22640952,18322925,'./addons/twoc_memo_del','N','20231119212208',22640972,'1.1'),(22641332,18322954,'./layouts/Imagemonster','N','20231110104458',22754363,'2.1'),(22641961,18322927,'./widgets/photoslider','N','20231114124859',22641966,'1.0'),(22643750,18322925,'./addons/bot_title_control','N','20231107230850',22643845,'0.2'),(22644317,18322925,'./addons/member_control','N','20231106184729',22644546,'0.1'),(22646356,18322943,'./modules/member/skins/sketchbook5_member_skin','N','20231113155752',22755492,'0.4.21'),(22646443,18322943,'./modules/communication/skins/sketchbook5_communication_skin','N','20231112233233',22755495,'0.4.21'),(22646468,18994170,'./modules/member/m.skins/sketchbook5_member_m.skin','N','20231111180619',22755493,'0.4.21'),(22646488,18994170,'./modules/communication/m.skins/sketchbook5_communication_m.skin','N','20231113161501',22755494,'0.4.21'),(22648755,18322923,'./modules/upgletyle_plugin_daumview','N','20231108125154',22648765,'0.1.0.b1'),(22648862,18322925,'./addons/robotcontrol','N','20231104202502',22649123,'1.1.0'),(22649096,18322925,'./addons/fa_loader','N','20231104173320',22754343,'4.2.0'),(22649328,18322925,'./addons/checkkorean','N','20231119013712',22651662,'1.1'),(22650410,18322925,'./addons/login_defencer','N','20231118190235',22650418,'1.0'),(22651543,18322954,'./layouts/flat_series','N','20231108124344',22754140,'1.0.22'),(22651552,18322950,'./widgets/login_info/skins/flat_series','N','20231114114512',22744104,'1.0.1'),(22652987,18322925,'./addons/confirm_declare','N','20231118134442',22754564,'1.1a'),(22653449,18322925,'./addons/block_ip','N','20231117010034',22754567,'2.1a'),(22654408,18322925,'./addons/authentication_change','N','20231115215118',22654433,'0.1'),(22655078,18322954,'./layouts/emergence','N','20231105124545',22660012,'1.0.0'),(22657234,18322925,'./addons/xdt_google_analytics','N','20231117203522',22756278,'1.2'),(22658404,18994170,'./modules/board/m.skins/sosifam_memo','N','20231108102137',22738369,'0.5'),(22658524,18322927,'./widgets/hb_bank','N','20231120040755',22658668,'0.1'),(22660923,18994172,'./m.layouts/phizMobileThemes','N','20231111180635',22754202,'1.2'),(22660940,18994170,'./modules/member/m.skins/phizMobile','N','20231108233108',22660950,'1.0'),(22660953,18994170,'./modules/communication/m.skin/phizMobile','N','20231108102553',22660956,'1.0'),(22664861,18322927,'./widgets/cameronSlider','N','20231114124855',22754523,'1.0.2'),(22664862,18322950,'./widgets/cameronSlider/skins/cameraSlider','N','20231118105948',22754329,'1.0.1'),(22665526,18322950,'./widgets/cameronSlider/skins/bxSlider','N','20231118105935',22754330,'1.0.1'),(22665670,18322950,'./widgets/cameronSlider/skins/FlexSlider2','N','20231118105918',22754331,'1.0.1'),(22668729,18322927,'./widgets/webcon_newswidget','N','20231105123029',22700746,'1.0.1'),(22669010,18322954,'./layouts/css3_simple','N','20231117090950',22687348,'1.1'),(22672196,18322925,'./addons/new_document_notify','N','20231106144447',22754335,'2.0'),(22673162,18322925,'./addons/fileicon','N','20231116052622',22716823,'1.1'),(22673736,18322925,'./addons/jqueryuicdn','N','20231102174218',22673740,'1.0'),(22677441,18322925,'./addons/jquerycdn','N','20231108125138',22714080,'1.0.3'),(22678118,18322927,'./widgets/webcon_smartTab','N','20231105121329',22680181,'1.0'),(22678527,18322954,'./layouts/awake2','N','20231113161547',22755684,'1.7'),(22678880,18322925,'./addons/jsecure_xe','N','20231116110650',22684436,'0.2'),(22690074,18322923,'./modules/sejin7940_vote','N','20231115214808',22755593,'1.3.1'),(22692696,18322927,'./widgets/webcon_mosaicGallery','N','20231105121853',22692724,'1.0'),(22692901,18322927,'./widgets/srchat_count','N','20231105121530',22692906,'1.0'),(22699529,18322927,'./widgets/webcon_carousel','N','20231116192621',22699542,'1.0'),(22703498,18322927,'./widgets/webcon_N_newsSearch','N','20231105121851',22703507,'1.0'),(22703903,18322927,'./widgets/webcon_verticalTab','N','20231119004614',22708158,'1.0.1'),(22703904,18322925,'./addons/xetrace','N','20231107222442',22703936,'1.0.0'),(22705169,18322923,'./modules/moneysend','N','20231114025758',22705176,'0.0.1'),(22706212,18322925,'./addons/hide_mid','N','20231108151321',22706230,'0.1.0'),(22711628,18322954,'./layouts/xelab_ll1','N','20231105124523',22712736,'1.0.2'),(22715595,18322925,'./addons/captbha','N','20231102174404',22715603,'0.5'),(22716306,18322954,'./layouts/firstkenta','N','20231105121456',22754179,'1.1'),(22716407,18322925,'./addons/autodeny','N','20231102174419',22716411,'0.7'),(22718180,18322927,'./widgets/webcon_effectSlider','N','20231110051026',22718196,'1.0'),(22718477,18322925,'./addons/fa_fileicon','N','20231110175553',22754338,'1.1.2'),(22720710,18322943,'./modules/upgletyle/skins/emplode','N','20231111000626',22720745,'0.7'),(22723913,18322925,'./addons/dyform_no_spam','N','20231104181211',22754947,'0.4'),(22726124,18322923,'./modules/ggmailing','N','20231118185911',22756092,'0.4.6'),(22730394,18322943,'./modules/sejin7940_comment/skins/sketchbook5_mycomment_skin','N','20231112233247',22755498,'1.0.4'),(22730395,18994170,'./modules/sejin7940_comment/m.skins/sketchbook5_mycomment_mskin','N','20231117203525',22755497,'1.0.4'),(22730560,18322954,'./layouts/purexe','N','20231110111308',22754180,'1.1'),(22753344,18322954,'./layouts/simple_is_best','N','20231102175205',22754147,'1.0'),(22735026,18322925,'./addons/sejin7940_mobile_resize','N','20231116183959',22735066,'1.0'),(22735793,18322927,'./widgets/webcon_mosaicContents','N','20231105121334',22735808,'1.0'),(22736227,18322925,'./addons/memberinfo','N','20231114040830',22754342,'1.10'),(22736353,18322925,'./addons/bbCode','N','20231107075246',22736356,'1.0'),(22736372,18322925,'./addons/placeHolders','N','20231107080827',22736378,'1.0'),(22737353,18322977,'./modules/point/icons/semo','N','20231105121339',22737363,'Volkswagen'),(22744282,18322925,'./addons/stop_spambot_xe','N','20231119225856',22756215,'2.8'),(22752234,18322925,'./addons/block_country','N','20231109001034',22752338,'0.2'),(22753306,18322927,'./widgets/ggboardmailing_widget','N','20231102174859',22755528,'0.3'),(22753312,18322925,'./addons/new_document_notify2','N','20231108134045',22754204,'1.0.12'),(22753313,18322923,'./modules/attendance','N','20231117013144',22756122,'7.2.5'),(22753314,18322923,'./modules/privilege','N','20231120035358',22756207,'0.1.3'),(22753315,18322925,'./addons/sns_card','N','20231109023240',22754099,'1.1'),(22753316,18322954,'./layouts/doorweb_v4','N','20231120080426',22754256,'1.7'),(22753317,18322950,'./widgets/content/skins/doorweb','N','20231102174932',22754080,'1.7'),(22753322,18322954,'./layouts/rkt001','N','20231105121401',22754084,'1.0.0'),(22753326,18322923,'./modules/ajaxboard','N','20231119043756',22754482,'2.1.1'),(22753327,18322950,'./widgets/content/skins/funnyxeGallery','N','20231120035349',22754107,'1.1'),(22753328,18322954,'./layouts/verti','N','20231107182829',22754108,'0.1.0'),(22753334,18322943,'./modules/editor/skins/xpresseditor_datauri','N','20231107182647',22754114,'1.7'),(22753336,18322925,'./addons/font_awesome_new','N','20231102175035',22754115,'1.0'),(22753339,18322954,'./layouts/rkt002','N','20231105121411',22754118,'1.0.0'),(22753340,18322925,'./addons/font_nanum_gothic','N','20231117011709',22754124,'1.0'),(22753341,18322954,'./layouts/The_Simple_Classic_Lite','N','20231108001827',22754141,'1.1'),(22753342,18322927,'./widgets/slideimg','N','20231117203531',22756263,'1.1.5'),(22753343,18322925,'./addons/multimedia_thumbnail','N','20231110220430',22756019,'2.5.0'),(22753345,18994172,'./m.layouts/simple_is_best_mobile','N','20231108102750',22754148,'1.0'),(22753346,18322923,'./modules/currency','N','20231119190041',22755801,'2.5.2'),(22753348,18322923,'./modules/inipay','N','20231105124552',22754422,'1.2'),(22753349,18322923,'./modules/inipaymobile','N','20231115003911',22755895,'2.6.3'),(22753783,18322923,'./modules/inipaystandard','N','20231119191536',22755887,'2.6.2'),(22753350,18322923,'./modules/kcp','N','20231102175231',22755806,'2.5.2'),(22753351,18322923,'./modules/cashpay','N','20231104054047',22755800,'2.5.2'),(22753352,18322923,'./modules/paypal','N','20231104144230',22755814,'2.5.2'),(22753353,18322954,'./layouts/kbfree','N','20231117161216',22754197,'1.2'),(22753675,18322923,'./modules/youtube','N','20231114022638',22755418,'1.1.1.'),(22753428,18322927,'./widgets/sejin7940_navermap','N','20231106115028',22754347,'0.2.1'),(22753356,18322923,'./modules/gdata','N','20231102175419',22754185,'0.5'),(22753358,18322927,'./widgets/picasa_recent_images','N','20231102175431',22754183,'0.1'),(22753359,18322925,'./addons/my_reading','N','20231102175438',22754203,'1.1'),(22753373,18322925,'./addons/updatecategory','N','20231107191220',22754190,'1.0'),(22753374,18322927,'./widgets/xelayout_weather','N','20231105121257',22754198,'0.2'),(22753381,18322925,'./addons/sxe_block_write','N','20231102175450',22754220,'0.2'),(22753382,18322925,'./addons/sxe_now_connected','N','20231102175456',22754221,'0.2'),(22753386,18322954,'./layouts/b_black','N','20231112105118',22754231,'1.0'),(22753387,18322925,'./addons/sxe_bbcode_lite','N','20231102175526',22754233,'0.1'),(22753388,18322923,'./modules/sejin7940_nick','N','20231111181654',22755824,'1.2'),(22753390,18322925,'./addons/sxe_writing_format','N','20231105165205',22754246,'0.2'),(22753393,18322925,'./addons/sxe_ncenter_plus','N','20231102175539',22754245,'0.2'),(22753396,18322923,'./modules/ximember','N','20231119185524',22754333,'1.4'),(22753397,18322923,'./modules/board_extend','N','20231120050057',22754254,'1.1'),(22753489,18322925,'./addons/member_ajaxboard','N','20231107181805',22754483,'2.1.1'),(22753399,18322943,'./modules/ncenterlite/skins/wild_ones','N','20231105121837',22754258,'0.1'),(22753403,18322927,'./widgets/opageWidget','N','20231108130150',22754271,'1.0'),(22753406,18322929,'./modules/editor/components/map_components','N','20231120063046',22755647,'1.4'),(22753408,18322925,'./addons/member_extra_vars_check','N','20231103135356',22754283,'1.0'),(22753411,18322925,'./addons/block_control','N','20231102175855',22754291,'1.0'),(22753413,18322927,'./widgets/sitemap_selectbox','N','20231107182550',22754293,'0.1.0'),(22753416,18322925,'./addons/auto_multimedia','N','20231108125000',22754308,'1.0'),(22753417,18322925,'./addons/addon_write_insert_media','N','20231119190925',22754309,'0.1'),(22753419,18322925,'./addons/addon_insert_video','N','20231120053315',22754313,'0.1'),(22753420,18322923,'./modules/pointhistory','N','20231118191632',22755663,'0.2.1'),(22753422,18322950,'./widgets/treasurej_popular/skins/smart_popular_tabs','N','20231118110013',22754327,'1.1'),(22753429,18322943,'./modules/board/skins/sosi_memo','N','20231109000659',22754360,'0.1'),(22753434,18322923,'./modules/profiler','N','20231117203550',22754941,'1.0'),(22753437,18322950,'./widgets/calendar/skins/UXF_CALENDER_TYPE_01','N','20231105121303',22754368,'1.1.0'),(22753449,18322925,'./addons/xss_session_protector','N','20231102180018',22754383,'0.1'),(22753457,18322954,'./layouts/simplicity','N','20231107215846',22754391,'1.0'),(22753458,18322925,'./addons/youtube_control','N','20231107221455',22754991,'1.3'),(22753459,18322923,'./modules/maps','N','20231114130310',22755385,'1.1.5'),(22753460,18322927,'./widgets/maps_widget','N','20231114124935',22755384,'1.1.5'),(22753462,18322925,'./addons/download_wanna_reply','N','20231103200507',22754407,'1.0'),(22753463,18322925,'./addons/image_preview','N','20231107220935',22754413,'1.0'),(22753464,18322943,'./modules/board/skins/mixitup','N','20231105121501',22754418,'1.0'),(22753465,18322923,'./modules/easyxe','N','20231120035740',22755347,'1.43.1'),(22753466,18322925,'./addons/auto_nick','N','20231107221542',22754428,'1.0'),(22753474,18322943,'./modules/lottery/skins/eond_v1','N','20231109000702',22754439,'0.1'),(22753475,18322943,'./modules/board/skins/bbsmusic','N','20231118165913',22754834,'1.7.105'),(22753476,18322954,'./layouts/CustomStrap','N','20231105121051',22754447,'1.0'),(22753478,18322927,'./widgets/ggwmmemberexcel_widget','N','20231119153208',22754450,'0.1'),(22753481,18322925,'./addons/sejin7940_kakao_link','N','20231104001709',22754488,'0.5.2'),(22753482,18322925,'./addons/tag_relation_add','N','20231102180232',22754457,'1.4.1'),(22753484,18322925,'./addons/html5multimedia_flash','N','20231102180239',22754465,'1.0.0'),(22753488,18322923,'./modules/sitemap','N','20231116202037',22755639,'1.3'),(22753492,18322925,'./addons/okiz_easyadmin_logout','N','20231120072557',22754522,'1.1'),(22753497,18994170,'./modules/board/m.skins/ms_m_board','N','20231117203558',22755358,'1.5.1'),(22753498,18322950,'./widgets/login_info/skins/eond_ppomppu','N','20231118132453',22754494,'1.0'),(22753500,18322925,'./addons/sejin7940_addvote','N','20231119093000',22755698,'1.3'),(22753501,18322925,'./addons/ssl_support','N','20231102180404',22754509,'0.1'),(22753504,18322923,'./modules/timeline','N','20231119212330',22755266,'1.0.2'),(22753506,18322925,'./addons/hot_document','N','20231108102726',22754766,'1.2.3'),(22753508,18322925,'./addons/sejin7940_all_notice','N','20231111181747',22754697,'1.4'),(22753510,18322925,'./addons/member_block_addon','N','20231107215506',22754665,'0.4'),(22753512,18322927,'./widgets/magiccontentWidget','N','20231114124953',22754746,'1.1'),(22753515,18322925,'./addons/denied_word','N','20231120044508',22754797,'1.002'),(22753517,18322923,'./modules/bulkmsg','N','20231120050110',22754543,'1.0'),(22753534,18322925,'./addons/auto_reply','N','20231115024833',22754579,'0.1a'),(22753535,18322927,'./widgets/doorweb_content','N','20231118105813',22754622,'1.7.2'),(22753538,18322954,'./layouts/doorweb_basic','N','20231118105814',22754722,'1.7.7'),(22753540,18322923,'./modules/stats','N','20231117001641',22754620,'1.1.1'),(22753541,18322923,'./modules/marketplace','N','20231114131518',22754737,'1.3'),(22753542,18994172,'./m.layouts/sweetMobile','N','20231117203602',22754694,'1.4'),(22753543,18322950,'./widgets/mcontent/skins/sweetMobileContent','N','20231108111458',22754588,'1.0'),(22753545,18322929,'./modules/editor/components/markdown','N','20231117203605',22756056,'1.1'),(22753546,18322925,'./addons/login_2sisstore','N','20231117191259',22755326,'1.1'),(22753550,18322925,'./addons/stats','N','20231117001641',22754602,'1.1'),(22753552,18322923,'./modules/pado_ajax_newsModule','N','20231114035605',22754727,'1.5'),(22753556,18322927,'./widgets/pado_ajax_newsWidget','N','20231107181213',22754726,'1.9'),(22753558,18994170,'./modules/board/m.skins/sweetMobileBoard','N','20231111223853',22754647,'1.2'),(22753559,18322954,'./layouts/xet_onecolor','N','20231119023959',22754842,'1.0.5'),(22753560,18322927,'./widgets/pado_board_rankingWidget','N','20231119062036',22755211,'1.2'),(22753561,18322954,'./layouts/ts_basic','N','20231105121020',22754619,'1.0'),(22753562,18322952,'./widgetstyles/sweetMobileWidgetStyle','N','20231108100325',22754626,'1.7'),(22753563,18322923,'./modules/apporix','N','20231108095104',22754631,'1.0'),(22753564,18322925,'./addons/apporix','N','20231108114025',22754645,'1.1'),(22753565,18322923,'./modules/smith','N','20231109063706',22754636,'1.1'),(22753566,18322943,'./modules/editor/skins/sejin7940_editor_fileupload','N','20231109000554',22754637,'0.5'),(22753567,18322950,'./widgets/login_info/skins/simplicity_login','N','20231108110334',22754649,'1.7'),(22753568,18322943,'./modules/editor/skins/sejin7940_editor_blank','N','20231109000053',22754639,'0.5'),(22753570,18322925,'./addons/message_btn','N','20231111181817',22754743,'1.1'),(22753571,18322923,'./modules/exam','N','20231108095615',22754771,'0.8'),(22753572,18322954,'./layouts/websitebuilder','N','20231107181615',22754679,'1.0.1'),(22753573,18994172,'./m.layouts/xenon_hs','N','20231118125542',22754659,'0.1.0'),(22753575,18322943,'./modules/board/skins/ASXE_FLAT','N','20231119004210',22754714,'1.1'),(22753576,18322954,'./layouts/ASXE_FLAT','N','20231114053645',22754715,'1.1'),(22753581,18322925,'./addons/apporix_native_alert','N','20231108124141',22754678,'0.1'),(22753582,18322927,'./widgets/ding_loginWidget','N','20231107220213',22755210,'0.6'),(22753587,18322954,'./layouts/miku_daisuki','N','20231105122002',22754733,'1.0'),(22753588,18322923,'./modules/moneyhistory','N','20231105121525',22754731,'0.1.4'),(22753594,18322925,'./addons/session_shield','N','20231102181044',22756003,'2.0.1'),(22753600,18322927,'./widgets/ding_member_ranking','N','20231119213829',22754905,'1.5'),(22753603,18322927,'./widgets/widget_marketplace','N','20231120053308',22754783,'0.1.1'),(22753605,18322927,'./widgets/padoLittleBanner','N','20231102181123',22754817,'0.4'),(22753685,18322925,'./addons/no_adblock','N','20231104054815',22755161,'1.1.3'),(22753606,18322925,'./addons/level_permit','N','20231114164603',22754795,'0.1'),(22753607,18322925,'./addons/member_doc','N','20231119100433',22754796,'0.2'),(22753608,18322925,'./addons/denied_exist','N','20231102181144',22754798,'0.2'),(22753609,18322925,'./addons/regdate_edit','N','20231109084959',22754803,'0.1'),(22753610,18322925,'./addons/poll_point','N','20231120012037',22754813,'0.2'),(22753612,18322925,'./addons/select_addon','N','20231109023746',22754818,'1.0'),(22753614,18322927,'./widgets/pado_image_news','N','20231107220553',22755163,'0.3'),(22753615,18322927,'./widgets/nkoclock','N','20231105121300',22754823,'0.1'),(22753616,18322927,'./widgets/uhachat','N','20231120021352',22755376,'0.3'),(22753617,18322923,'./modules/encryption','N','20231102181231',22755121,'1.2'),(22753620,18322927,'./widgets/fixedNotice','N','20231104093312',22754854,'0.3'),(22753622,18322925,'./addons/signoutdel','N','20231114061203',22754837,'0.1'),(22753624,18322923,'./modules/member_condition','N','20231111181820',22755317,'1.0.2'),(22753627,18322925,'./addons/fixed_notice','N','20231107235759',22754875,'1.1'),(22753634,18322927,'./widgets/soo_kma_rss','N','20231111181833',22755438,'0.3.1'),(22753633,18322925,'./addons/Ding_Fixed_Banner','N','20231114013406',22755314,'1.6'),(22753637,18322923,'./modules/androidpushapp','N','20231105120040',22755682,'2.1'),(22753636,18322923,'./modules/auto_login','N','20231102181318',22754942,'1.1.4'),(22753638,18322943,'./modules/editor/skins/ck_xpress','N','20231111181843',22754981,'1.0.2'),(22753639,18322925,'./addons/Ding_Light_Box','N','20231112104617',22755312,'1.2'),(22753640,18322925,'./addons/autolang','N','20231102181343',22754915,'1.0'),(22753645,18322950,'./widgets/content/skins/notice_slider','N','20231111181849',22754937,'1.1'),(22753646,18322925,'./addons/fix_domain','N','20231119142604',22754935,'1.0.0'),(22753647,18322923,'./modules/schedule','N','20231105121532',22754990,'1.1'),(22753648,18322925,'./addons/bot_challenge','N','20231104164124',22755249,'1.0.5'),(22753651,18322923,'./modules/vote','N','20231119220823',22755019,'1.1.4'),(22753652,18322925,'./addons/point_pangpang','N','20231102181427',22755059,'1.5.2'),(22753653,18322925,'./addons/content_regex_filter','N','20231102181434',22754961,'0.2'),(22753654,18322929,'./modules/editor/components/srook_maker','N','20231118135617',22754966,'1.0'),(22753655,18322923,'./modules/beluxe','N','20231105120045',22755255,'2.8.3'),(22753657,18322925,'./addons/remail','N','20231120072553',22754984,'1.0'),(22753658,18322925,'./addons/zipperupper','N','20231116025233',22755026,'0.3'),(22753660,18322954,'./layouts/ding_default_layout','N','20231104025208',22755044,'1.1'),(22753662,18322954,'./layouts/xe_kimtajo_layout','N','20231117112750',22755545,'2.03'),(22753663,18322923,'./modules/speedlimiter','N','20231105122005',22755981,'1.5'),(22753666,18322927,'./widgets/jwplayer','N','20231113195038',22755048,'2.0.0'),(22753667,18322925,'./addons/requirefile','N','20231111191537',22755038,'1.01'),(22753674,18322943,'./modules/beluxe/skins/dxblog','N','20231109000807',22755246,'1.3'),(22753677,18322923,'./modules/advanced_mailer','N','20231114213507',22756149,'1.8.4'),(22753678,18322927,'./widgets/youtube','N','20231114124944',22755381,'1.3.0.'),(22753680,18322943,'./modules/beluxe/skins/dxreview','N','20231105120619',22755245,'1.3'),(22753684,18322925,'./addons/lua_external_file','N','20231114153856',22755147,'0.0.3'),(22753688,18322927,'./widgets/best_content','N','20231105120043',22755148,'1.0'),(22753689,18322929,'./modules/editor/components/btn_add','N','20231117203628',22755152,'0.3'),(22753692,18322927,'./widgets/androidapp_login','N','20231105120213',22755388,'1.4'),(22753693,18322925,'./addons/outdated_browser','N','20231113015647',22755188,'1.1.1'),(22753695,18322925,'./addons/lua_hashtag','N','20231102181754',22755190,'0.0.1'),(22753696,18322925,'./addons/lua_shortcut','N','20231102181801',22755315,'1.1'),(22753698,18322950,'./widgets/sitemap/skins/eond_hmap','N','20231113053452',22755200,'0.1'),(22753699,18322950,'./widgets/planet_document/skins/eond_on','N','20231114085138',22755212,'0.3'),(22753702,18322925,'./addons/document_permission_control_by_author','N','20231113232804',22755263,'0.2'),(22753703,18322925,'./addons/image_new_windows','N','20231115044413',22755252,'1.1'),(22753706,18322925,'./addons/adsense_helper','N','20231108103914',22755268,'1.0'),(22753710,18322954,'./layouts/creative_sim','N','20231102181826',22755295,'1.0.1'),(22753711,18322954,'./layouts/sim_blog','N','20231117170201',22755296,'1.1.1'),(22753712,18322954,'./layouts/xit','N','20231114054655',22755284,'1.0'),(22753713,18322954,'./layouts/xecafe','N','20231105123756',22755285,'1.0'),(22753717,18322923,'./modules/member_expire','N','20231115024008',22756005,'1.2.7'),(22753720,18322954,'./layouts/simblog2','N','20231102181902',22755305,'1.0'),(22753721,18322927,'./widgets/daum_postcode','N','20231114124948',22755318,'0.1.1'),(22753722,18322925,'./addons/latex','N','20231102181914',22755316,'1.7'),(22753723,18322925,'./addons/auto_secret','N','20231120035341',22755355,'1.1'),(22753724,18322923,'./modules/freedownload','N','20231107220812',22755331,'1.1'),(22753725,18322927,'./widgets/pado_comment_rankingWidget','N','20231107220857',22755325,'1.0'),(22753726,18322923,'./modules/imageprocess','N','20231119203541',22756180,'2.6.6'),(22753727,18322943,'./modules/board/skins/ena_board_set_simpledashed','N','20231114084409',22755328,'1.0.0'),(22753733,18322927,'./widgets/kimtajo_subpage_widget','N','20231105121846',22755346,'1.0'),(22753815,18322925,'./addons/member_realname','N','20231102182451',22755592,'0.2'),(22753741,18322927,'./widgets/eond_fileboxBanner','N','20231111074024',22755364,'0.1'),(22753742,18322954,'./layouts/basic_tpl_c','N','20231105124145',22755404,'1.04'),(22753743,18322954,'./layouts/yourfoliomain','N','20231102182017',22755394,'0.1'),(22753745,18322925,'./addons/auto_comment_allow','N','20231109051407',22755397,'1.0'),(22753748,18322925,'./addons/admin_hide','N','20231120035352',22755416,'1.0'),(22753755,18322925,'./addons/fixed_img','N','20231109014638',22755449,'1.3'),(22753759,18322923,'./modules/laweb_xe','N','20231114055717',22755702,'3.10'),(22753768,18322927,'./widgets/contactfree','N','20231119113715',22755456,'1.0'),(22753769,18322954,'./layouts/freelancer','N','20231119205024',22755465,'1.00'),(22753770,18322925,'./addons/ggwoorimailscrap','N','20231102182137',22755522,'0.3'),(22753779,18994170,'./modules/board/m.skins/BlueRock','N','20231117203631',22755476,'0.1'),(22753780,18994172,'./m.layouts/BlueRock','N','20231117203635',22755477,'0.1'),(22753787,18322954,'./layouts/kimtajo_responsive_one_page','N','20231107102648',22755594,'1.03'),(22753791,18322923,'./modules/yeyak','N','20231113195211',22756169,'2.2.6'),(22753796,18322925,'./addons/fix_mysql_utf8','N','20231110180906',22755521,'1.0'),(22753797,18322925,'./addons/autoattach','N','20231118081702',22755954,'1.1.4'),(22753798,18322927,'./widgets/ggward','N','20231113171719',22755532,'0.2'),(22753799,18322927,'./widgets/ggnewsletter','N','20231102182353',22755533,'0.2'),(22753881,18322925,'./addons/clamav','N','20231108130343',22755764,'1.0.0'),(22753800,18322925,'./addons/web_fonts','N','20231118171833',22755550,'1.1'),(22753801,18322954,'./layouts/xedition_r','N','20231107220132',22755551,'1.9'),(22753802,18322950,'./widgets/uhachat/skins/pinklet','N','20231108110155',22755553,'0.1'),(22753806,18322923,'./modules/mailing','N','20231102182415',22755557,'0.5'),(22753807,18322925,'./addons/hello_member','N','20231109040107',22755565,'1.1.0.0'),(22753811,18322923,'./modules/opensearch','N','20231102182436',22755570,'1.0'),(22753817,18322943,'./modules/board/skins/simple_banner','N','20231111182524',22755613,'1.1'),(22753818,18322923,'./modules/phpexcel_module','N','20231110195037',22755598,'0.1'),(22753820,18322954,'./layouts/kimtajo_onepage_widget_layout','N','20231109014505',22755601,'1.00'),(22753822,18322927,'./widgets/onepage_about','N','20231108233943',22755603,'1.00'),(22753823,18322927,'./widgets/onepage_features','N','20231117160038',22755604,'1.00'),(22753824,18322927,'./widgets/onepage_pricing','N','20231030195411',22755605,'1.00'),(22753825,18322927,'./widgets/onepage_service','N','20231108233831',22755606,'1.00'),(22753826,18322927,'./widgets/onepage_team','N','20231107045301',22755607,'1.00'),(22753827,18322927,'./widgets/onepage_testimonial','N','20231108233935',22755608,'1.00'),(22753828,18322927,'./widgets/onepage_work','N','20231107045036',22755609,'1.00'),(22753833,18322943,'./modules/board/skins/Horizon','N','20231113234048',22755713,'1.4'),(22753835,18994172,'./m.layouts/phizmobile_m','N','20231118125422',22755630,'1.8.1'),(22753837,18994170,'./modules/page/m.skins/main02_MobileM','N','20231117203647',22755631,'1.0'),(22753838,18322923,'./modules/phizeditormobile','N','20231109013559',22755632,'1.8.0'),(22753840,18994170,'./modules/board/m.skins/phiz_mboard','N','20231113014706',22755633,'1.8.1'),(22753841,18322943,'./modules/board/skins/phiz_mboard','N','20231111234945',22755634,'1.8.1'),(22753842,18322923,'./modules/sitemaplite','N','20231118004631',22756007,'1.1.2'),(22753845,18322952,'./widgetstyles/clearstrap_ws','N','20231108110518',22755645,'1.0'),(22753846,18322925,'./addons/no_act','N','20231107220504',22755661,'0.3'),(22753847,18322954,'./layouts/stellar','N','20231111182555',22755946,'1.0.2'),(22753849,18322925,'./addons/block_search','N','20231102182612',22755674,'1.0'),(22753850,18322925,'./addons/login_redirect','N','20231102182619',22755675,'1.0'),(22753851,18322925,'./addons/backspace_killer','N','20231110014233',22755676,'1.0'),(22753852,18322925,'./addons/noduplicate','N','20231112071313',22755677,'1.0'),(22753856,18322954,'./layouts/magik','N','20231118233705',22755690,'1.0'),(22753857,18322923,'./modules/notifymessage','N','20231114165155',22755694,'1.0.1'),(22753859,18322927,'./widgets/widget_rssreader','N','20231119225536',22755695,'1.8.25'),(22753861,18322923,'./modules/roulette','N','20231105121519',22755708,'0.3'),(22753863,18322923,'./modules/couponsms','N','20231105120622',22755709,'1.0'),(22753864,18322923,'./modules/layout_manager','N','20231105121504',22755722,'0.1'),(22753865,18322923,'./modules/supercache','N','20231120040121',22756150,'1.3.7'),(22753866,18322927,'./widgets/widget_update_document','N','20231119190951',22755718,'0.1'),(22753867,18322954,'./layouts/Door_cpA_limit','N','20231120092548',22755752,'1.2'),(22753868,18322950,'./widgets/content/skins/Door_cpA','N','20231119023002',22755724,'0.1'),(22753870,18322927,'./widgets/uchat2','N','20231118173826',22756220,'1.0.8'),(22753871,18322954,'./layouts/Door_cpB_limit','N','20231107111746',22755754,'1.4'),(22753872,18322950,'./widgets/content/skins/Door_cpB','N','20231108233622',22755744,'1.7'),(22753876,18322952,'./widgetstyles/greenButtonStyle','N','20231120035346',22755756,'0.1'),(22753889,18322927,'./widgets/sitemap7','N','20231114011754',22755786,'0.1.0'),(22753885,18322925,'./addons/ext_ad_membership','N','20231102182901',22755775,'0.2'),(22753886,18322977,'./modules/point/icons/las_icon','N','20231112145055',22755781,'0.2'),(22753890,18322923,'./modules/blind','N','20231120013748',22755799,'0.3'),(22753891,18322923,'./modules/cympuser','N','20231120110301',22755803,'2.5.2'),(22753892,18322954,'./layouts/ena_creamy','N','20231118172915',22755817,'1.0'),(22753893,18322943,'./modules/board/skins/ena_board_set_mellow','N','20231120043704',22756262,'1.1.5'),(22753894,18322923,'./modules/randocument','N','20231107214124',22755828,'1.0'),(22753895,18322923,'./modules/etorrent','N','20231114110350',22755829,'0.1'),(22753896,18322927,'./widgets/etorrent_pop','N','20231107045555',22755830,'0.1'),(22753898,18322925,'./addons/datasaver_warning','N','20231102182930',22755847,'1.0'),(22753900,18322954,'./layouts/undeviating','N','20231111182757',22755942,'1.0.1'),(22753901,18322925,'./addons/zhttps','N','20231107190729',22755861,'1.0'),(22753902,18322925,'./addons/replace_word','N','20231120051408',22755873,'1.1'),(22753904,18322925,'./addons/only_once_comment','N','20231109023900',22755872,'1.0'),(22753905,18322923,'./modules/voteextend','N','20231118231720',22755884,'1.88'),(22753906,18322943,'./modules/message/skins/stalla','N','20231108100731',22755891,'1.0'),(22753907,18994170,'./modules/message/m.skins/stalla','N','20231117203655',22755892,'1.0'),(22753909,18322925,'./addons/google_recaptcha','N','20231116142303',22756168,'1.1'),(22753915,18322954,'./layouts/J_Furniture','N','20231118172312',22755994,'2.0'),(22753917,18322954,'./layouts/J_Finder','N','20231118171412',22756013,'1.3'),(22753916,18322950,'./widgets/content/skins/J_Furniture','N','20231118172312',22755993,'1.1'),(22753918,18322950,'./widgets/content/skins/J_Finder_scroll','N','20231118171413',22755914,'1.0'),(22753919,18322950,'./widgets/content/skins/J_Finder','N','20231118171413',22755915,'1.0'),(22753920,18322954,'./layouts/J_Flex','N','20231117181819',22755939,'1.4'),(22753925,18322954,'./layouts/J_Maltese','N','20231118171931',22755949,'1.4'),(22753926,18322950,'./widgets/content/skins/J_Maltese_Left','N','20231118171932',22755928,'1.0'),(22753927,18322950,'./widgets/content/skins/J_Maltese_Right','N','20231118171931',22755948,'1.1'),(22753929,18322950,'./widgets/login_info/skins/j_maltese_login','N','20231118171931',22755940,'1.1'),(22753930,18322925,'./addons/number_dice','N','20231109023801',22755945,'1.0'),(22753933,18322943,'./modules/board/skins/insp_yotube','N','20231120060408',22755979,'1.0'),(22753934,18322925,'./addons/zipdownload','N','20231115023718',22756123,'1.2'),(22753935,18322923,'./modules/admin_menu','N','20231104165945',22755982,'1.0'),(22753936,18322923,'./modules/file_log','N','20231102183038',22755983,'1.7'),(22753937,18322954,'./layouts/equeer_layout','N','20231120082805',22755985,'1.4.5'),(22753940,18322925,'./addons/theme_admin','N','20231110183049',22756006,'1.3'),(22753941,18322943,'./modules/board/skins/uikit','N','20231117203705',22756000,'1.0.15.1'),(22753939,18322950,'./widgets/point_status/skins/equeer_point','N','20231120015719',22755987,'0.2'),(22753942,18322954,'./layouts/root_basic_layout','N','20231117220726',22756191,'1.2.2'),(22753943,18322943,'./modules/board/skins/aplos_v2','N','20231117203729',22756132,'2.2.4'),(22753945,18322923,'./modules/something','N','20231105122454',22756057,'1.0.10'),(22753946,18322925,'./addons/prohibit_backlink','N','20231107103626',22756053,'1.0.3'),(22753947,18322923,'./modules/devcenter','N','20231114231515',22756118,'0.4.5'),(22753949,18322954,'./layouts/game_layout','N','20231117214814',22756074,'1.1'),(22753950,18322925,'./addons/prevent_deletion','N','20231101233708',22756080,'1.0'),(22753953,18322923,'./modules/google_calendar','N','20231114071654',22756094,'1.0.0'),(22753955,18322954,'./layouts/ena_paper','N','20231118172537',22756099,'1.0'),(22753957,18322923,'./modules/geoipxe','N','20231111183411',22756186,'0.1.1'),(22753958,18322925,'./addons/fontawesome5','N','20231101082054',22756130,'1.0.1'),(22753963,18322927,'./widgets/exchangeRateXE123','N','20231114124402',22756142,'1.1.0'),(22753967,18322954,'./layouts/mh_fullpage','N','20231118171832',22756147,'1.0'),(22753969,18322925,'./addons/typofix','N','20231115045505',22756154,'1.0'),(22753971,18322925,'./addons/meta_remove','N','20231031072632',22756165,'1.0'),(22753972,18322925,'./addons/google_tagmanager','N','20231103110000',22756167,'1.0'),(22753975,18322923,'./modules/pagelocker','N','20231117203838',22756270,'1.1.5'),(22753977,18322923,'./modules/import_excel','N','20231117203847',22756192,'1.0'),(22753982,18322925,'./addons/auto_comment_secret','N','20231120035344',22756201,'1.0'),(22753983,18322923,'./modules/dable','N','20231117203851',22756257,'0.9.4'),(22753984,18322950,'./widgets/counter_status/skins/counter','N','20231117203900',22756202,'1.0'),(22753986,18322923,'./modules/nowconnect','N','20231119175726',22756267,'1.0.8'),(22753988,18322925,'./addons/simple_mp3_player','N','20231117203903',22756219,'1.1.1'),(22753989,18322925,'./addons/tag_off','N','20231117203913',22756227,'0.1'),(22753992,18322925,'./addons/dsori_notifier_document','N','20231115105430',22756244,'0.6'),(22753993,18322925,'./addons/dsori_notifier_member','N','20231115105430',22756245,'0.6'),(22753994,18322925,'./addons/dsori_notifier_comment','N','20231117203918',22756246,'0.6'),(22753995,18322927,'./widgets/dsori_sms_form_solapi','N','20231117203922',22756247,'0.6');
/*!40000 ALTER TABLE `xe_autoinstall_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_declared`
--

DROP TABLE IF EXISTS `xe_comment_declared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_declared` (
  `comment_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_declared`
--

LOCK TABLES `xe_comment_declared` WRITE;
/*!40000 ALTER TABLE `xe_comment_declared` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_declared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_declared_log`
--

DROP TABLE IF EXISTS `xe_comment_declared_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_declared_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_declared_log`
--

LOCK TABLES `xe_comment_declared_log` WRITE;
/*!40000 ALTER TABLE `xe_comment_declared_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_declared_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comment_voted_log`
--

DROP TABLE IF EXISTS `xe_comment_voted_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comment_voted_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comment_voted_log`
--

LOCK TABLES `xe_comment_voted_log` WRITE;
/*!40000 ALTER TABLE `xe_comment_voted_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comment_voted_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comments`
--

DROP TABLE IF EXISTS `xe_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comments` (
  `comment_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `is_secret` char(1) NOT NULL DEFAULT 'N',
  `content` longtext NOT NULL,
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `status` bigint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`comment_srl`),
  UNIQUE KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_parent_srl` (`parent_srl`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comments`
--

LOCK TABLES `xe_comments` WRITE;
/*!40000 ALTER TABLE `xe_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_comments_list`
--

DROP TABLE IF EXISTS `xe_comments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_comments_list` (
  `comment_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `head` bigint(11) NOT NULL DEFAULT '0',
  `arrange` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `depth` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_list` (`document_srl`,`head`,`arrange`),
  KEY `idx_date` (`module_srl`,`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_comments_list`
--

LOCK TABLES `xe_comments_list` WRITE;
/*!40000 ALTER TABLE `xe_comments_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_comments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_log`
--

DROP TABLE IF EXISTS `xe_counter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_log` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `user_agent` varchar(250) DEFAULT NULL,
  KEY `idx_site_counter_log` (`site_srl`,`ipaddress`),
  KEY `idx_counter_log` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_log`
--

LOCK TABLES `xe_counter_log` WRITE;
/*!40000 ALTER TABLE `xe_counter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_site_status`
--

DROP TABLE IF EXISTS `xe_counter_site_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_site_status` (
  `site_srl` bigint(11) NOT NULL,
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  UNIQUE KEY `site_status` (`site_srl`,`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_site_status`
--

LOCK TABLES `xe_counter_site_status` WRITE;
/*!40000 ALTER TABLE `xe_counter_site_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_site_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_counter_status`
--

DROP TABLE IF EXISTS `xe_counter_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_counter_status` (
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  PRIMARY KEY (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_counter_status`
--

LOCK TABLES `xe_counter_status` WRITE;
/*!40000 ALTER TABLE `xe_counter_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_counter_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_aliases`
--

DROP TABLE IF EXISTS `xe_document_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_aliases` (
  `alias_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `alias_title` varchar(250) NOT NULL,
  PRIMARY KEY (`alias_srl`),
  UNIQUE KEY `idx_module_title` (`module_srl`,`alias_title`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_alias_title` (`alias_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_aliases`
--

LOCK TABLES `xe_document_aliases` WRITE;
/*!40000 ALTER TABLE `xe_document_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_categories`
--

DROP TABLE IF EXISTS `xe_document_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `expand` char(1) DEFAULT 'N',
  `document_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  `group_srls` text,
  `color` varchar(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_categories`
--

LOCK TABLES `xe_document_categories` WRITE;
/*!40000 ALTER TABLE `xe_document_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_declared`
--

DROP TABLE IF EXISTS `xe_document_declared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_declared` (
  `document_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_declared`
--

LOCK TABLES `xe_document_declared` WRITE;
/*!40000 ALTER TABLE `xe_document_declared` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_declared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_declared_log`
--

DROP TABLE IF EXISTS `xe_document_declared_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_declared_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_declared_log`
--

LOCK TABLES `xe_document_declared_log` WRITE;
/*!40000 ALTER TABLE `xe_document_declared_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_declared_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_extra_keys`
--

DROP TABLE IF EXISTS `xe_document_extra_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_extra_keys` (
  `module_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `var_name` varchar(250) NOT NULL,
  `var_type` varchar(50) NOT NULL,
  `var_is_required` char(1) NOT NULL DEFAULT 'N',
  `var_search` char(1) NOT NULL DEFAULT 'N',
  `var_default` text,
  `var_desc` text,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_module_keys` (`module_srl`,`var_idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_extra_keys`
--

LOCK TABLES `xe_document_extra_keys` WRITE;
/*!40000 ALTER TABLE `xe_document_extra_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_extra_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_extra_vars`
--

DROP TABLE IF EXISTS `xe_document_extra_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` longtext,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_extra_vars` (`module_srl`,`document_srl`,`var_idx`,`lang_code`),
  KEY `idx_document_list_order` (`document_srl`,`module_srl`,`var_idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_extra_vars`
--

LOCK TABLES `xe_document_extra_vars` WRITE;
/*!40000 ALTER TABLE `xe_document_extra_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_extra_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_histories`
--

DROP TABLE IF EXISTS `xe_document_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_histories` (
  `history_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `content` longtext,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`history_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_histories`
--

LOCK TABLES `xe_document_histories` WRITE;
/*!40000 ALTER TABLE `xe_document_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_readed_log`
--

DROP TABLE IF EXISTS `xe_document_readed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_readed_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_readed_log`
--

LOCK TABLES `xe_document_readed_log` WRITE;
/*!40000 ALTER TABLE `xe_document_readed_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_readed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_trash`
--

DROP TABLE IF EXISTS `xe_document_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_trash` (
  `trash_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `trash_date` varchar(14) DEFAULT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_trash_date` (`trash_date`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_member_srl` (`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_trash`
--

LOCK TABLES `xe_document_trash` WRITE;
/*!40000 ALTER TABLE `xe_document_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_document_voted_log`
--

DROP TABLE IF EXISTS `xe_document_voted_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_document_voted_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_document_voted_log`
--

LOCK TABLES `xe_document_voted_log` WRITE;
/*!40000 ALTER TABLE `xe_document_voted_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_document_voted_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_documents`
--

DROP TABLE IF EXISTS `xe_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_documents` (
  `document_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(10) NOT NULL DEFAULT '',
  `is_notice` char(1) NOT NULL DEFAULT 'N',
  `title` varchar(250) DEFAULT NULL,
  `title_bold` char(1) NOT NULL DEFAULT 'N',
  `title_color` varchar(7) DEFAULT NULL,
  `content` longtext NOT NULL,
  `readed_count` bigint(11) NOT NULL DEFAULT '0',
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `comment_count` bigint(11) NOT NULL DEFAULT '0',
  `trackback_count` bigint(11) NOT NULL DEFAULT '0',
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `tags` text,
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `last_updater` varchar(80) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `update_order` bigint(11) NOT NULL,
  `allow_trackback` char(1) NOT NULL DEFAULT 'Y',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `status` varchar(20) DEFAULT 'PUBLIC',
  `comment_status` varchar(20) DEFAULT 'ALLOW',
  PRIMARY KEY (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_is_notice` (`is_notice`),
  KEY `idx_readed_count` (`readed_count`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_comment_count` (`comment_count`),
  KEY `idx_trackback_count` (`trackback_count`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_update_order` (`update_order`),
  KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_update_order` (`module_srl`,`update_order`),
  KEY `idx_module_readed_count` (`module_srl`,`readed_count`),
  KEY `idx_module_voted_count` (`module_srl`,`voted_count`),
  KEY `idx_module_notice` (`module_srl`,`is_notice`),
  KEY `idx_module_document_srl` (`module_srl`,`document_srl`),
  KEY `idx_module_blamed_count` (`module_srl`,`blamed_count`),
  KEY `idx_module_status` (`module_srl`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_documents`
--

LOCK TABLES `xe_documents` WRITE;
/*!40000 ALTER TABLE `xe_documents` DISABLE KEYS */;
INSERT INTO `xe_documents` VALUES (90,65,0,'ko','N','Welcome XE','N','N','<link rel=\"stylesheet\" href=\"./layouts/xedition/css/welcome.css\" />\n<div class=\"welcomeXE\">\n	<section class=\"intro\">\n		<span class=\"noti\">WELCOME TO</span>\n		<h1 class=\"tit\">WELCOME TO XPRESSENGINE</h1>\n		<P class=\"cont\">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href=\"/xe/index.php?module=admin\" target=\"_blank\" class=\"btn_start\">XE 시작하기</a>\n	</section>\n</div>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022659','20231120022659',NULL,'192.168.10.129',-90,-90,'N','N','PUBLIC','DENY'),(91,65,0,'ko','N','Welcome mobile XE','N','N','<link rel=\"stylesheet\" href=\"./layouts/xedition/css/welcome.css\" />\n<div class=\"welcomeXE\">\n	<section class=\"intro\">\n		<span class=\"noti\">WELCOME TO</span>\n		<h1 class=\"tit\">WELCOME TO XPRESSENGINE</h1>\n		<P class=\"cont\">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href=\"/xe/index.php?module=admin\" target=\"_blank\" class=\"btn_start\">XE 시작하기</a>\n	</section>\n</div>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022659','20231120022659',NULL,'192.168.10.129',-91,-91,'N','N','PUBLIC','DENY'),(92,65,0,'ko','N','XEIcon (1)','N','N','<section class=\"main_title fixedwidth\">\n	<h1>Beautiful iconic font &amp; CSS toolkit</h1>\n	<p>\n		XEIcon은 웹사이트 제작에 최적화된 백터 그래픽 아이콘 툴킷입니다.<br />\n		한국 웹서비스 문화에 적합한 디자인과 카테고리를 고려하여 제작되었습니다.<br />\n		XEIcon으로 아름답고 직관적인 웹페이지를 만들어보세요!<br />\n	</p>\n</section>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022700','20231120022700',NULL,'192.168.10.129',-92,-92,'N','N','PUBLIC','DENY'),(93,65,0,'ko','N','XEIcon (2)','N','N','<section class=\"feature fixedwidth\">\n	<div class=\"tit\"><h1>FEATURE</h1></div>\n	<ul>\n	<li>\n		<div class=\"ico\"><i class=\"xi-cube\"></i></div>\n		<h2>한개의 폰트, 680개의 아이콘</h2>\n		<p>웹 콘텐츠의 목적에 맞는 아이콘을 다양한 구성에서 찾아볼 수 있습니다.<br /><a href=\"https://xpressengine.github.io/XEIcon/library_common.html\" target=\"_blank\">라이브러리</a>에서 필요한 아이콘을 찾아보세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-sitemap\"></i></div>\n		<h2>호환성</h2>\n		<p>XEIcon은 자바스크립트 없이 구현됩니다. <br />또한 다양한 브라우저에서도 동일한 뷰로 웹 페이지를 노출합니다.</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-layout-top-left\"></i></div>\n		<h2>최적화</h2>\n		<p>XpressEngine 뿐 아니라, 다양한 프레임워크에서 동일하게 구현됩니다. 여러 환경에서 자유롭게 이용해보세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-arrows-alt\"></i></div>\n		<h2>확장성</h2>\n		<p>백터 아이콘으로 만들어진 XEIcon은 어떤 크기로도 확장이 가능하며 높은 해상도의 화면에서도 선명한 형태를 유지합니다.</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-pen\"></i></div>\n		<h2>자유로운 변형</h2>\n		<p>CSS를 통해 아이콘의 색상, 크기 등을 손쉽게 변형할 수 있습니다. <a href=\"https://xpressengine.github.io/XEIcon/examples.html\" target=\"_blank\">LESS SASS</a>로 더 넓어진 활용 범위를 확인하세요!</p>\n	</li>\n	<li>\n		<div class=\"ico\"><i class=\"xi-present\"></i></div>\n		<h2>오픈소스</h2>\n		<p>XEIcon은 OFL 라이선스를 따르는 오픈소스로 모든 사용자에게 무료로 제공됩니다. <a href=\"https://xpressengine.github.io/XEIcon/license.html\" target=\"_blank\">라이선스</a>를 확인해 보세요!</p>\n	</li>\n	</ul>\n</section>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022700','20231120022700',NULL,'192.168.10.129',-93,-93,'N','N','PUBLIC','DENY'),(94,65,0,'ko','N','XEIcon (3)','N','N','<section class=\"get_started\">\n	<div class=\"fixedwidth\">\n		<div class=\"tit\"><h1>GET STARTED</h1></div>\n		<p class=\"cont\">XEIcon 사용과 설치 방법은 매우 간단합니다. 자세한 사용방법을 <a href=\"http://xpressengine.github.io/XEIcon/\">XEIcon 공식사이트</a>에서 확인해보세요!</p>\n		<ul>\n			<li>\n				<h2>최신버전 다운로드</h2>\n				<p>가장 최신버전 구성을 압축파일로<br />다운로드 받아볼 수 있습니다.</p>\n				<a href=\"https://github.com/xpressengine/XEIcon/archive/master.zip\"><i class=\"xeicon xi-download\"></i> Download</a>\n			</li>\n			<li>\n				<h2>Git 저장소 복제</h2>\n				<p>Github에서 로컬 저장소로 복제하여 사용할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#installation\" target=\"_blank\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n			<li>\n				<h2>CDN by jsDelivr</h2>\n				<p>한줄의 코드만 작성하면 다운로드 없이 XEIcon을 사용할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#cdn\" target=\"_blank\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n			<li>\n				<h2>Install with Bower</h2>\n				<p>Bower 서비스에서 XEIcon 패키지를 바로 설치할 수 있습니다.</p>\n				<a href=\"https://xpressengine.github.io/XEIcon/started.html#bower\"><i class=\"xeicon xi-arrow-right\"></i> check out</a>\n			</li>\n		</ul>\n	</div>\n</section>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022700','20231120022700',NULL,'192.168.10.129',-94,-94,'N','N','PUBLIC','DENY'),(95,65,0,'ko','N','XEIcon (4)','N','N','<section class=\"contribution fixedwidth\">\n	<div class=\"tit\"><h1>CONTRIBUTION</h1></div>\n	<p class=\"cont\">새로운 아이콘 요청이나 XEICON에 대한 제안이 있다면 자유롭게 이야기해주세요!<br />앞으로의 이야기들을 함께 만들어갈 third party 참여 또한 환영합니다.</p>\n	<a href=\"https://github.com/xpressengine/XEIcon\" target=\"_blank\" class=\"btn_github\">github</a>\n</section>\n',0,0,0,0,0,0,NULL,'song','admin','song',4,'song@gmail.com','',NULL,'N;','20231120022700','20231120022700',NULL,'192.168.10.129',-95,-95,'N','N','PUBLIC','DENY');
/*!40000 ALTER TABLE `xe_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_autosave`
--

DROP TABLE IF EXISTS `xe_editor_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_autosave` (
  `member_srl` bigint(11) DEFAULT '0',
  `ipaddress` varchar(128) DEFAULT NULL,
  `module_srl` bigint(11) DEFAULT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `content` longtext NOT NULL,
  `certify_key` varchar(100) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_certify_key` (`certify_key`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_autosave`
--

LOCK TABLES `xe_editor_autosave` WRITE;
/*!40000 ALTER TABLE `xe_editor_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_editor_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_components`
--

DROP TABLE IF EXISTS `xe_editor_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_components` (
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_components`
--

LOCK TABLES `xe_editor_components` WRITE;
/*!40000 ALTER TABLE `xe_editor_components` DISABLE KEYS */;
INSERT INTO `xe_editor_components` VALUES ('colorpicker_text','Y',NULL,41),('colorpicker_bg','Y',NULL,43),('emoticon','Y',NULL,45),('url_link','Y',NULL,47),('image_link','Y',NULL,49),('multimedia_link','Y',NULL,51),('quotation','Y',NULL,53),('table_maker','Y',NULL,55),('poll_maker','Y',NULL,57),('image_gallery','Y',NULL,59);
/*!40000 ALTER TABLE `xe_editor_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_editor_components_site`
--

DROP TABLE IF EXISTS `xe_editor_components_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_editor_components_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_component_site` (`site_srl`,`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_editor_components_site`
--

LOCK TABLES `xe_editor_components_site` WRITE;
/*!40000 ALTER TABLE `xe_editor_components_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_editor_components_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_files`
--

DROP TABLE IF EXISTS `xe_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_files` (
  `file_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL DEFAULT '0',
  `upload_target_type` char(3) DEFAULT NULL,
  `sid` varchar(60) DEFAULT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `download_count` bigint(11) NOT NULL DEFAULT '0',
  `direct_download` char(1) NOT NULL DEFAULT 'N',
  `source_filename` varchar(250) DEFAULT NULL,
  `uploaded_filename` varchar(250) DEFAULT NULL,
  `file_size` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `isvalid` char(1) DEFAULT 'N',
  `cover_image` char(1) NOT NULL DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`file_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_upload_target_type` (`upload_target_type`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_download_count` (`download_count`),
  KEY `idx_file_size` (`file_size`),
  KEY `idx_is_valid` (`isvalid`),
  KEY `idx_list_order` (`cover_image`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_files`
--

LOCK TABLES `xe_files` WRITE;
/*!40000 ALTER TABLE `xe_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_lang`
--

DROP TABLE IF EXISTS `xe_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_lang` (
  `site_srl` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` text,
  KEY `idx_lang` (`site_srl`,`name`,`lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_lang`
--

LOCK TABLES `xe_lang` WRITE;
/*!40000 ALTER TABLE `xe_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_layouts`
--

DROP TABLE IF EXISTS `xe_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_layouts` (
  `layout_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `extra_vars` text,
  `layout_path` varchar(250) DEFAULT NULL,
  `module_srl` bigint(12) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `layout_type` char(1) DEFAULT 'P',
  PRIMARY KEY (`layout_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_layouts`
--

LOCK TABLES `xe_layouts` WRITE;
/*!40000 ALTER TABLE `xe_layouts` DISABLE KEYS */;
INSERT INTO `xe_layouts` VALUES (88,0,'xedition','XEDITION','O:8:\"stdClass\":3:{s:3:\"GNB\";i:64;s:3:\"UNB\";i:75;s:3:\"FNB\";i:78;}',NULL,0,'20231120022659','P'),(89,0,'default','welcome_mobile_layout','O:8:\"stdClass\":4:{s:3:\"GNB\";i:64;s:3:\"UNB\";i:75;s:3:\"FNB\";i:78;s:9:\"main_menu\";i:64;}',NULL,0,'20231120022659','M');
/*!40000 ALTER TABLE `xe_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member`
--

DROP TABLE IF EXISTS `xe_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member` (
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  `email_host` varchar(160) DEFAULT NULL,
  `user_name` varchar(40) NOT NULL,
  `nick_name` varchar(40) NOT NULL,
  `find_account_question` bigint(11) DEFAULT NULL,
  `find_account_answer` varchar(250) DEFAULT NULL,
  `homepage` varchar(250) DEFAULT NULL,
  `blog` varchar(250) DEFAULT NULL,
  `birthday` char(8) DEFAULT NULL,
  `allow_mailing` char(1) NOT NULL DEFAULT 'Y',
  `allow_message` char(1) NOT NULL DEFAULT 'Y',
  `denied` char(1) DEFAULT 'N',
  `limit_date` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_login` varchar(14) DEFAULT NULL,
  `change_password_date` varchar(14) DEFAULT NULL,
  `is_admin` char(1) DEFAULT 'N',
  `description` text,
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`member_srl`),
  UNIQUE KEY `unique_user_id` (`user_id`),
  UNIQUE KEY `unique_email_address` (`email_address`),
  UNIQUE KEY `unique_nick_name` (`nick_name`),
  KEY `idx_email_host` (`email_host`),
  KEY `idx_allow_mailing` (`allow_mailing`),
  KEY `idx_is_denied` (`denied`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_login` (`last_login`),
  KEY `idx_is_admin` (`is_admin`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member`
--

LOCK TABLES `xe_member` WRITE;
/*!40000 ALTER TABLE `xe_member` DISABLE KEYS */;
INSERT INTO `xe_member` VALUES (4,'song','song@gmail.com','sha256:0008192:IzxObuGnojJg:awWmsePqIBhMSHKlNLR2gHw85ZioV3oD','song','gmail.com','admin','song',NULL,NULL,'','',NULL,'N','Y','N',NULL,'20231120022656','20231120022656','20231120022656','Y',NULL,NULL,-4),(129,'ssong','ssong@gmail.com','sha256:0008192:562SSjUNUVgE:gIjPxdfjw3LzHrRS3xGnT53QcCmiUOHt','ssong','gmail.com','ssong','ssong',NULL,NULL,'','',NULL,'N','Y','N','','20231120022806','20231120022806','20231120022806','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-129);
/*!40000 ALTER TABLE `xe_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_auth_mail`
--

DROP TABLE IF EXISTS `xe_member_auth_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_auth_mail` (
  `auth_key` varchar(60) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `new_password` varchar(80) NOT NULL,
  `is_register` char(1) DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_key` (`auth_key`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_auth_mail`
--

LOCK TABLES `xe_member_auth_mail` WRITE;
/*!40000 ALTER TABLE `xe_member_auth_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_auth_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_autologin`
--

DROP TABLE IF EXISTS `xe_member_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_autologin` (
  `autologin_key` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_key` (`autologin_key`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_autologin`
--

LOCK TABLES `xe_member_autologin` WRITE;
/*!40000 ALTER TABLE `xe_member_autologin` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_count_history`
--

DROP TABLE IF EXISTS `xe_member_count_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_count_history` (
  `member_srl` bigint(11) NOT NULL,
  `content` longtext NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_srl`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_count_history`
--

LOCK TABLES `xe_member_count_history` WRITE;
/*!40000 ALTER TABLE `xe_member_count_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_count_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_denied_nick_name`
--

DROP TABLE IF EXISTS `xe_member_denied_nick_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_denied_nick_name` (
  `nick_name` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`nick_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_denied_nick_name`
--

LOCK TABLES `xe_member_denied_nick_name` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_nick_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_denied_nick_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_denied_user_id`
--

DROP TABLE IF EXISTS `xe_member_denied_user_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_denied_user_id` (
  `user_id` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_denied_user_id`
--

LOCK TABLES `xe_member_denied_user_id` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_user_id` DISABLE KEYS */;
INSERT INTO `xe_member_denied_user_id` VALUES ('addon','20231120022656','',-5),('admin','20231120022656','',-6),('adminlogging','20231120022656','',-7),('autoinstall','20231120022656','',-8),('board','20231120022656','',-9),('comment','20231120022656','',-10),('communication','20231120022656','',-11),('counter','20231120022656','',-12),('document','20231120022656','',-13),('editor','20231120022656','',-14),('file','20231120022656','',-15),('importer','20231120022656','',-16),('install','20231120022656','',-17),('integration_search','20231120022656','',-18),('krzip','20231120022656','',-19),('layout','20231120022656','',-20),('member','20231120022656','',-21),('menu','20231120022656','',-22),('message','20231120022656','',-23),('module','20231120022656','',-24),('page','20231120022656','',-25),('point','20231120022656','',-26),('poll','20231120022656','',-27),('rss','20231120022656','',-28),('seo','20231120022656','',-29),('session','20231120022656','',-30),('spamfilter','20231120022656','',-31),('tag','20231120022656','',-32),('trash','20231120022656','',-33),('widget','20231120022656','',-34),('www','20231120022656','',-35),('root','20231120022656','',-36),('administrator','20231120022656','',-37),('telnet','20231120022656','',-38),('ftp','20231120022656','',-39),('http','20231120022656','',-40);
/*!40000 ALTER TABLE `xe_member_denied_user_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_friend`
--

DROP TABLE IF EXISTS `xe_member_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_friend` (
  `friend_srl` bigint(11) NOT NULL,
  `friend_group_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `target_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_srl`),
  KEY `idx_friend_group_srl` (`friend_group_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_target_srl` (`target_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_friend`
--

LOCK TABLES `xe_member_friend` WRITE;
/*!40000 ALTER TABLE `xe_member_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_friend_group`
--

DROP TABLE IF EXISTS `xe_member_friend_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_friend_group` (
  `friend_group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_group_srl`),
  KEY `index_owner_member_srl` (`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_friend_group`
--

LOCK TABLES `xe_member_friend_group` WRITE;
/*!40000 ALTER TABLE `xe_member_friend_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_friend_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_group`
--

DROP TABLE IF EXISTS `xe_member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_group` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `is_default` char(1) DEFAULT 'N',
  `is_admin` char(1) DEFAULT 'N',
  `image_mark` text,
  `description` text,
  PRIMARY KEY (`group_srl`),
  UNIQUE KEY `idx_site_title` (`site_srl`,`title`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_group`
--

LOCK TABLES `xe_member_group` WRITE;
/*!40000 ALTER TABLE `xe_member_group` DISABLE KEYS */;
INSERT INTO `xe_member_group` VALUES (0,1,1,'관리그룹','20231120022656','N','Y','',''),(0,2,2,'준회원','20231120022656','Y','N','',''),(0,3,3,'정회원','20231120022656','N','N','','');
/*!40000 ALTER TABLE `xe_member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_group_member`
--

DROP TABLE IF EXISTS `xe_member_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_group_member` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_site_srl` (`site_srl`),
  KEY `idx_group_member` (`group_srl`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_group_member`
--

LOCK TABLES `xe_member_group_member` WRITE;
/*!40000 ALTER TABLE `xe_member_group_member` DISABLE KEYS */;
INSERT INTO `xe_member_group_member` VALUES (0,1,4,'20231120022656'),(0,2,129,'20231120022806');
/*!40000 ALTER TABLE `xe_member_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_join_form`
--

DROP TABLE IF EXISTS `xe_member_join_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_join_form` (
  `member_join_form_srl` bigint(11) NOT NULL,
  `column_type` varchar(60) NOT NULL,
  `column_name` varchar(60) NOT NULL,
  `column_title` varchar(60) NOT NULL,
  `required` char(1) NOT NULL DEFAULT 'N',
  `default_value` text,
  `is_active` char(1) DEFAULT 'Y',
  `description` text,
  `list_order` bigint(11) NOT NULL DEFAULT '1',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_join_form_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_join_form`
--

LOCK TABLES `xe_member_join_form` WRITE;
/*!40000 ALTER TABLE `xe_member_join_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_join_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_login_count`
--

DROP TABLE IF EXISTS `xe_member_login_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_login_count` (
  `ipaddress` varchar(128) NOT NULL,
  `count` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_login_count`
--

LOCK TABLES `xe_member_login_count` WRITE;
/*!40000 ALTER TABLE `xe_member_login_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_login_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_message`
--

DROP TABLE IF EXISTS `xe_member_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_message` (
  `message_srl` bigint(11) NOT NULL,
  `related_srl` bigint(11) NOT NULL,
  `sender_srl` bigint(11) NOT NULL,
  `receiver_srl` bigint(11) NOT NULL,
  `message_type` char(1) NOT NULL DEFAULT 'S',
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `readed` char(1) NOT NULL DEFAULT 'N',
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `readed_date` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`message_srl`),
  KEY `idx_related_srl` (`related_srl`),
  KEY `idx_sender_srl` (`sender_srl`),
  KEY `idx_receiver_srl` (`receiver_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_message`
--

LOCK TABLES `xe_member_message` WRITE;
/*!40000 ALTER TABLE `xe_member_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_member_scrap`
--

DROP TABLE IF EXISTS `xe_member_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_member_scrap` (
  `member_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `target_member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_scrap` (`member_srl`,`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_member_scrap`
--

LOCK TABLES `xe_member_scrap` WRITE;
/*!40000 ALTER TABLE `xe_member_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_member_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu`
--

DROP TABLE IF EXISTS `xe_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu` (
  `menu_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_title` (`title`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu`
--

LOCK TABLES `xe_menu` WRITE;
/*!40000 ALTER TABLE `xe_menu` DISABLE KEYS */;
INSERT INTO `xe_menu` VALUES (64,0,'Main menu',-64,'20231120022656'),(75,0,'Utility menu',-75,'20231120022657'),(78,0,'Footer Menu',-78,'20231120022658'),(96,0,'__ADMINMENU_V17__',-96,'20231120022703');
/*!40000 ALTER TABLE `xe_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu_item`
--

DROP TABLE IF EXISTS `xe_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu_item` (
  `menu_item_srl` bigint(12) NOT NULL,
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `menu_srl` bigint(12) NOT NULL,
  `name` text,
  `desc` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `is_shortcut` char(1) DEFAULT 'N',
  `open_window` char(1) DEFAULT 'N',
  `expand` char(1) DEFAULT 'N',
  `normal_btn` varchar(255) DEFAULT NULL,
  `hover_btn` varchar(255) DEFAULT NULL,
  `active_btn` varchar(255) DEFAULT NULL,
  `group_srls` text,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_item_srl`),
  KEY `idx_menu_srl` (`menu_srl`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu_item`
--

LOCK TABLES `xe_menu_item` WRITE;
/*!40000 ALTER TABLE `xe_menu_item` DISABLE KEYS */;
INSERT INTO `xe_menu_item` VALUES (66,0,64,'Welcome Page','','index','N','N','N',NULL,NULL,NULL,NULL,-66,'20231120022656'),(68,0,64,'Board','','board','N','N','N',NULL,NULL,NULL,NULL,-68,'20231120022657'),(69,68,64,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-69,'20231120022657'),(70,69,64,'SAMPLE 1-1','','#','Y','N','N',NULL,NULL,NULL,NULL,-70,'20231120022657'),(71,68,64,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-71,'20231120022657'),(72,68,64,'SAMPLE 3','','#','Y','N','N',NULL,NULL,NULL,NULL,-72,'20231120022657'),(74,0,64,'XEIcon','','xeicon','N','N','N',NULL,NULL,NULL,NULL,-74,'20231120022657'),(76,0,75,'XE Official Site','','http://www.xpressengine.com','Y','N','N',NULL,NULL,NULL,NULL,-76,'20231120022657'),(77,0,75,'GitHub','','https://github.com/xpressengine','Y','N','N',NULL,NULL,NULL,NULL,-77,'20231120022658'),(79,0,78,'Welcome Page','','#','Y','N','N',NULL,NULL,NULL,NULL,-79,'20231120022658'),(80,79,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-80,'20231120022658'),(81,79,78,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-81,'20231120022658'),(82,79,78,'SAMPLE 3','','#','Y','N','N',NULL,NULL,NULL,NULL,-82,'20231120022658'),(83,0,78,'Board','','#','Y','N','N',NULL,NULL,NULL,NULL,-83,'20231120022658'),(84,83,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-84,'20231120022658'),(85,83,78,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-85,'20231120022658'),(86,0,78,'XEIcon','','#','Y','N','N',NULL,NULL,NULL,NULL,-86,'20231120022659'),(87,86,78,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-87,'20231120022659'),(97,0,96,'{$lang->menu_gnb[\'dashboard\']}',NULL,'index.php?module=admin','N','N','N',NULL,NULL,NULL,NULL,-97,'20231120022703'),(98,0,96,'{$lang->menu_gnb[\'menu\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-98,'20231120022703'),(99,0,96,'{$lang->menu_gnb[\'user\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-99,'20231120022703'),(100,0,96,'{$lang->menu_gnb[\'content\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-100,'20231120022703'),(101,0,96,'{$lang->menu_gnb[\'configuration\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-101,'20231120022703'),(102,0,96,'{$lang->menu_gnb[\'advanced\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-102,'20231120022703'),(103,98,96,'{$lang->menu_gnb_sub[\'siteMap\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteMap','N','N','N','','','','1',-103,'20231120022703'),(104,98,96,'{$lang->menu_gnb_sub[\'siteDesign\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteDesign','N','N','N','','','','1',-104,'20231120022703'),(105,99,96,'{$lang->menu_gnb_sub[\'userList\']}',NULL,'index.php?module=admin&act=dispMemberAdminList','N','N','N','','','','1',-105,'20231120022703'),(106,99,96,'{$lang->menu_gnb_sub[\'userSetting\']}',NULL,'index.php?module=admin&act=dispMemberAdminConfig','N','N','N','','','','1',-106,'20231120022703'),(107,99,96,'{$lang->menu_gnb_sub[\'userGroup\']}',NULL,'index.php?module=admin&act=dispMemberAdminGroupList','N','N','N','','','','1',-107,'20231120022703'),(108,100,96,'{$lang->menu_gnb_sub[\'document\']}',NULL,'index.php?module=admin&act=dispDocumentAdminList','N','N','N','','','','1',-108,'20231120022703'),(109,100,96,'{$lang->menu_gnb_sub[\'comment\']}',NULL,'index.php?module=admin&act=dispCommentAdminList','N','N','N','','','','1',-109,'20231120022703'),(110,100,96,'{$lang->menu_gnb_sub[\'file\']}',NULL,'index.php?module=admin&act=dispFileAdminList','N','N','N','','','','1',-110,'20231120022703'),(111,100,96,'{$lang->menu_gnb_sub[\'poll\']}',NULL,'index.php?module=admin&act=dispPollAdminList','N','N','N','','','','1',-111,'20231120022703'),(112,100,96,'{$lang->menu_gnb_sub[\'rss\']}',NULL,'index.php?module=admin&act=dispRssAdminIndex','N','N','N','','','','1',-112,'20231120022703'),(113,100,96,'{$lang->menu_gnb_sub[\'multilingual\']}',NULL,'index.php?module=admin&act=dispModuleAdminLangcode','N','N','N','','','','1',-113,'20231120022703'),(114,100,96,'{$lang->menu_gnb_sub[\'importer\']}',NULL,'index.php?module=admin&act=dispImporterAdminImportForm','N','N','N','','','','1',-114,'20231120022703'),(115,100,96,'{$lang->menu_gnb_sub[\'trash\']}',NULL,'index.php?module=admin&act=dispTrashAdminList','N','N','N','','','','1',-115,'20231120022703'),(116,102,96,'{$lang->menu_gnb_sub[\'easyInstall\']}',NULL,'index.php?module=admin&act=dispAutoinstallAdminIndex','N','N','N','','','','1',-116,'20231120022703'),(117,102,96,'{$lang->menu_gnb_sub[\'installedLayout\']}',NULL,'index.php?module=admin&act=dispLayoutAdminInstalledList','N','N','N','','','','1',-117,'20231120022703'),(118,102,96,'{$lang->menu_gnb_sub[\'installedModule\']}',NULL,'index.php?module=admin&act=dispModuleAdminContent','N','N','N','','','','1',-118,'20231120022703'),(119,102,96,'{$lang->menu_gnb_sub[\'installedWidget\']}',NULL,'index.php?module=admin&act=dispWidgetAdminDownloadedList','N','N','N','','','','1',-119,'20231120022703'),(120,102,96,'{$lang->menu_gnb_sub[\'installedAddon\']}',NULL,'index.php?module=admin&act=dispAddonAdminIndex','N','N','N','','','','1',-120,'20231120022703'),(121,102,96,'{$lang->menu_gnb_sub[\'editor\']}',NULL,'index.php?module=admin&act=dispEditorAdminIndex','N','N','N','','','','1',-121,'20231120022703'),(122,100,96,'{$lang->menu_gnb_sub[\'spamFilter\']}',NULL,'index.php?module=admin&act=dispSpamfilterAdminDeniedIPList','N','N','N','','','','1',-122,'20231120022703'),(123,101,96,'{$lang->menu_gnb_sub[\'adminConfigurationGeneral\']}',NULL,'index.php?module=admin&act=dispAdminConfigGeneral','N','N','N','','','','1',-123,'20231120022703'),(124,101,96,'{$lang->menu_gnb_sub[\'adminConfigurationFtp\']}',NULL,'index.php?module=admin&act=dispAdminConfigFtp','N','N','N','','','','1',-124,'20231120022703'),(125,101,96,'{$lang->menu_gnb_sub[\'adminMenuSetup\']}',NULL,'index.php?module=admin&act=dispAdminSetup','N','N','N','','','','1',-125,'20231120022703'),(126,101,96,'{$lang->menu_gnb_sub[\'fileUpload\']}',NULL,'index.php?module=admin&act=dispFileAdminConfig','N','N','N','','','','1',-126,'20231120022703'),(127,101,96,'{$lang->menu_gnb_sub[\'filebox\']}',NULL,'index.php?module=admin&act=dispModuleAdminFileBox','N','N','N','','','','1',-127,'20231120022703'),(128,99,96,'{$lang->menu_gnb_sub[\'point\']}',NULL,'index.php?module=admin&act=dispPointAdminConfig','N','N','N','','','','1',-128,'20231120022703');
/*!40000 ALTER TABLE `xe_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_menu_layout`
--

DROP TABLE IF EXISTS `xe_menu_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_menu_layout` (
  `menu_srl` bigint(12) NOT NULL,
  `layout_srl` bigint(12) NOT NULL,
  PRIMARY KEY (`menu_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_menu_layout`
--

LOCK TABLES `xe_menu_layout` WRITE;
/*!40000 ALTER TABLE `xe_menu_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_menu_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_admins`
--

DROP TABLE IF EXISTS `xe_module_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_admins` (
  `module_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_module_admin` (`module_srl`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_admins`
--

LOCK TABLES `xe_module_admins` WRITE;
/*!40000 ALTER TABLE `xe_module_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_categories`
--

DROP TABLE IF EXISTS `xe_module_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_categories` (
  `module_category_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_category_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_categories`
--

LOCK TABLES `xe_module_categories` WRITE;
/*!40000 ALTER TABLE `xe_module_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_config`
--

DROP TABLE IF EXISTS `xe_module_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_config` (
  `module` varchar(250) NOT NULL,
  `site_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_config`
--

LOCK TABLES `xe_module_config` WRITE;
/*!40000 ALTER TABLE `xe_module_config` DISABLE KEYS */;
INSERT INTO `xe_module_config` VALUES ('comment',0,'N;','20231120022656'),('editor',0,'N;','20231120022656'),('file',0,'O:8:\"stdClass\":3:{s:16:\"allowed_filesize\";s:1:\"2\";s:19:\"allowed_attach_size\";s:1:\"2\";s:17:\"allowed_filetypes\";s:3:\"*.*\";}','20231120022656'),('layout',0,'N;','20231120022656'),('point',0,'O:8:\"stdClass\":22:{s:11:\"able_module\";s:1:\"N\";s:9:\"max_level\";i:30;s:10:\"level_step\";a:30:{i:1;i:90;i:2;i:360;i:3;i:810;i:4;i:1440;i:5;i:2250;i:6;i:3240;i:7;i:4410;i:8;i:5760;i:9;i:7290;i:10;i:9000;i:11;i:10890;i:12;i:12960;i:13;i:15210;i:14;i:17640;i:15;i:20250;i:16;i:23040;i:17;i:26010;i:18;i:29160;i:19;i:32490;i:20;i:36000;i:21;i:39690;i:22;i:43560;i:23;i:47610;i:24;i:51840;i:25;i:56250;i:26;i:60840;i:27;i:65610;i:28;i:70560;i:29;i:75690;i:30;i:81000;}s:12:\"signup_point\";i:10;s:11:\"login_point\";i:5;s:10:\"point_name\";s:5:\"point\";s:10:\"level_icon\";s:7:\"default\";s:16:\"disable_download\";b:0;s:15:\"insert_document\";i:10;s:19:\"insert_document_act\";s:23:\"procBoardInsertDocument\";s:19:\"delete_document_act\";s:23:\"procBoardDeleteDocument\";s:14:\"insert_comment\";i:5;s:18:\"insert_comment_act\";s:44:\"procBoardInsertComment,procBlogInsertComment\";s:18:\"delete_comment_act\";s:44:\"procBoardDeleteComment,procBlogDeleteComment\";s:11:\"upload_file\";i:5;s:15:\"upload_file_act\";s:14:\"procFileUpload\";s:15:\"delete_file_act\";s:14:\"procFileDelete\";s:13:\"download_file\";i:-5;s:17:\"download_file_act\";s:16:\"procFileDownload\";s:13:\"read_document\";i:0;s:5:\"voted\";i:0;s:6:\"blamed\";i:0;}','20231120022656'),('rss',0,'N;','20231120022656'),('module',0,'O:8:\"stdClass\":1:{s:18:\"isUpdateFixedValue\";b:1;}','20231120022656'),('autoinstall',0,'O:8:\"stdClass\":1:{s:14:\"downloadServer\";s:33:\"http://download.xpressengine.com/\";}','20231120022656'),('poll',0,'O:8:\"stdClass\":2:{s:4:\"skin\";s:7:\"default\";s:8:\"colorset\";s:6:\"normal\";}','20231120022656'),('member',0,'O:8:\"stdClass\":19:{s:11:\"enable_join\";s:1:\"Y\";s:13:\"enable_openid\";s:1:\"N\";s:16:\"enable_auth_mail\";s:1:\"N\";s:10:\"image_name\";s:1:\"Y\";s:10:\"image_mark\";s:1:\"Y\";s:13:\"profile_image\";s:1:\"Y\";s:20:\"image_name_max_width\";s:2:\"90\";s:21:\"image_name_max_height\";s:2:\"20\";s:20:\"image_mark_max_width\";s:2:\"20\";s:21:\"image_mark_max_height\";s:2:\"20\";s:23:\"profile_image_max_width\";s:2:\"90\";s:24:\"profile_image_max_height\";s:2:\"90\";s:16:\"group_image_mark\";s:1:\"N\";s:17:\"password_strength\";s:6:\"normal\";s:26:\"password_hashing_algorithm\";s:6:\"pbkdf2\";s:28:\"password_hashing_work_factor\";i:8;s:29:\"password_hashing_auto_upgrade\";s:1:\"Y\";s:10:\"signupForm\";a:13:{i:0;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"email_address\";s:5:\"title\";s:13:\"email_address\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:1;}i:1;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:7:\"user_id\";s:5:\"title\";s:7:\"user_id\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:2;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"password\";s:5:\"title\";s:8:\"password\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:3;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"user_name\";s:5:\"title\";s:9:\"user_name\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:4;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"nick_name\";s:5:\"title\";s:9:\"nick_name\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:5;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:21:\"find_account_question\";s:5:\"title\";s:21:\"find_account_question\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:6;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"homepage\";s:5:\"title\";s:8:\"homepage\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:7;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:4:\"blog\";s:5:\"title\";s:4:\"blog\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:8;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"birthday\";s:5:\"title\";s:8:\"birthday\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:12:\"isIdentifier\";b:0;}i:9;O:8:\"stdClass\":9:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"signature\";s:5:\"title\";s:9:\"signature\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;}i:10;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"profile_image\";s:5:\"title\";s:13:\"profile_image\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}i:11;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_name\";s:5:\"title\";s:10:\"image_name\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}i:12;O:8:\"stdClass\":11:{s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_mark\";s:5:\"title\";s:10:\"image_mark\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:12:\"isIdentifier\";b:0;s:9:\"max_width\";N;s:10:\"max_height\";N;}}s:10:\"identifier\";s:13:\"email_address\";}','20231120022656');
/*!40000 ALTER TABLE `xe_module_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_extend`
--

DROP TABLE IF EXISTS `xe_module_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_extend` (
  `parent_module` varchar(80) NOT NULL,
  `extend_module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `kind` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_extend`
--

LOCK TABLES `xe_module_extend` WRITE;
/*!40000 ALTER TABLE `xe_module_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_extra_vars`
--

DROP TABLE IF EXISTS `xe_module_extra_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_vars` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_extra_vars`
--

LOCK TABLES `xe_module_extra_vars` WRITE;
/*!40000 ALTER TABLE `xe_module_extra_vars` DISABLE KEYS */;
INSERT INTO `xe_module_extra_vars` VALUES (65,'regdate','20231120022656'),(73,'regdate','20231120022657'),(65,'page_type','WIDGET'),(73,'page_type','WIDGET');
/*!40000 ALTER TABLE `xe_module_extra_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_filebox`
--

DROP TABLE IF EXISTS `xe_module_filebox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_filebox` (
  `module_filebox_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `fileextension` varchar(4) NOT NULL,
  `filesize` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_filebox_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_fileextension` (`fileextension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_filebox`
--

LOCK TABLES `xe_module_filebox` WRITE;
/*!40000 ALTER TABLE `xe_module_filebox` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_filebox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_grants`
--

DROP TABLE IF EXISTS `xe_module_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_grants` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `group_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_module` (`module_srl`,`name`,`group_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_grants`
--

LOCK TABLES `xe_module_grants` WRITE;
/*!40000 ALTER TABLE `xe_module_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_locks`
--

DROP TABLE IF EXISTS `xe_module_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_locks` (
  `lock_name` varchar(40) NOT NULL,
  `deadline` varchar(14) DEFAULT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  UNIQUE KEY `unique_lock_name` (`lock_name`),
  KEY `idx_deadline` (`deadline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_locks`
--

LOCK TABLES `xe_module_locks` WRITE;
/*!40000 ALTER TABLE `xe_module_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_mobile_skins`
--

DROP TABLE IF EXISTS `xe_module_mobile_skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_mobile_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_mobile_skins` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_mobile_skins`
--

LOCK TABLES `xe_module_mobile_skins` WRITE;
/*!40000 ALTER TABLE `xe_module_mobile_skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_mobile_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_part_config`
--

DROP TABLE IF EXISTS `xe_module_part_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_part_config` (
  `module` varchar(250) NOT NULL,
  `module_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_module_part_config` (`module`,`module_srl`),
  KEY `idx_module_part_config` (`module`,`module_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_part_config`
--

LOCK TABLES `xe_module_part_config` WRITE;
/*!40000 ALTER TABLE `xe_module_part_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_part_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_skins`
--

DROP TABLE IF EXISTS `xe_module_skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_skins` (`module_srl`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_skins`
--

LOCK TABLES `xe_module_skins` WRITE;
/*!40000 ALTER TABLE `xe_module_skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_module_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_trigger`
--

DROP TABLE IF EXISTS `xe_module_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_trigger` (
  `trigger_name` varchar(80) NOT NULL,
  `called_position` varchar(15) NOT NULL,
  `module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `called_method` varchar(80) NOT NULL,
  UNIQUE KEY `idx_trigger` (`trigger_name`,`called_position`,`module`,`type`,`called_method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_trigger`
--

LOCK TABLES `xe_module_trigger` WRITE;
/*!40000 ALTER TABLE `xe_module_trigger` DISABLE KEYS */;
INSERT INTO `xe_module_trigger` VALUES ('comment.deleteComment','after','file','controller','triggerCommentDeleteAttached'),('comment.deleteComment','after','poll','controller','triggerDeleteCommentPoll'),('comment.getCommentMenu','after','member','controller','triggerGetCommentMenu'),('comment.insertComment','after','file','controller','triggerCommentAttachFiles'),('comment.insertComment','after','poll','controller','triggerInsertCommentPoll'),('comment.insertComment','before','file','controller','triggerCommentCheckAttached'),('comment.insertComment','before','spamfilter','controller','triggerInsertComment'),('comment.updateComment','after','file','controller','triggerCommentAttachFiles'),('comment.updateComment','after','poll','controller','triggerUpdateCommentPoll'),('comment.updateComment','before','file','controller','triggerCommentCheckAttached'),('comment.updateComment','before','spamfilter','controller','triggerInsertComment'),('communication.sendMessage','before','spamfilter','controller','triggerSendMessage'),('display','before','editor','controller','triggerEditorComponentCompile'),('display','before','seo','controller','triggerBeforeDisplay'),('display','before','widget','controller','triggerWidgetCompile'),('document.deleteDocument','after','comment','controller','triggerDeleteDocumentComments'),('document.deleteDocument','after','file','controller','triggerDeleteAttached'),('document.deleteDocument','after','poll','controller','triggerDeleteDocumentPoll'),('document.deleteDocument','after','seo','controller','triggerAfterDocumentDeleteDocument'),('document.deleteDocument','after','tag','controller','triggerDeleteTag'),('document.getDocumentMenu','after','member','controller','triggerGetDocumentMenu'),('document.insertDocument','after','editor','controller','triggerDeleteSavedDoc'),('document.insertDocument','after','file','controller','triggerAttachFiles'),('document.insertDocument','after','poll','controller','triggerInsertDocumentPoll'),('document.insertDocument','after','tag','controller','triggerInsertTag'),('document.insertDocument','before','file','controller','triggerCheckAttached'),('document.insertDocument','before','spamfilter','controller','triggerInsertDocument'),('document.insertDocument','before','tag','controller','triggerArrangeTag'),('document.updateDocument','after','editor','controller','triggerDeleteSavedDoc'),('document.updateDocument','after','file','controller','triggerAttachFiles'),('document.updateDocument','after','poll','controller','triggerUpdateDocumentPoll'),('document.updateDocument','after','seo','controller','triggerAfterDocumentUpdateDocument'),('document.updateDocument','after','tag','controller','triggerInsertTag'),('document.updateDocument','before','file','controller','triggerCheckAttached'),('document.updateDocument','before','spamfilter','controller','triggerInsertDocument'),('document.updateDocument','before','tag','controller','triggerArrangeTag'),('editor.deleteSavedDoc','after','file','controller','triggerDeleteAttached'),('file.deleteFile','after','seo','controller','triggerAfterFileDeleteFile'),('member.getMemberMenu','after','board','controller','triggerMemberMenu'),('menu.getModuleListInSitemap','after','board','model','triggerModuleListInSitemap'),('module.deleteModule','after','comment','controller','triggerDeleteModuleComments'),('module.deleteModule','after','document','controller','triggerDeleteModuleDocuments'),('module.deleteModule','after','file','controller','triggerDeleteModuleFiles'),('module.deleteModule','after','tag','controller','triggerDeleteModuleTags'),('module.dispAdditionSetup','before','comment','view','triggerDispCommentAdditionSetup'),('module.dispAdditionSetup','before','document','view','triggerDispDocumentAdditionSetup'),('module.dispAdditionSetup','before','editor','view','triggerDispEditorAdditionSetup'),('module.dispAdditionSetup','before','file','view','triggerDispFileAdditionSetup'),('module.dispAdditionSetup','before','rss','view','triggerDispRssAdditionSetup'),('module.dispAdditionSetup','before','seo','view','triggerDispSeoAdditionSetup'),('module.procModuleAdminCopyModule','after','comment','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModuleExtraKeys'),('module.procModuleAdminCopyModule','after','editor','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','file','controller','triggerCopyModule'),('module.procModuleAdminCopyModule','after','rss','controller','triggerCopyModule'),('moduleHandler.proc','after','rss','controller','triggerRssUrlInsert'),('trackback.insertTrackback','before','spamfilter','controller','triggerInsertTrackback');
/*!40000 ALTER TABLE `xe_module_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_module_update`
--

DROP TABLE IF EXISTS `xe_module_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_module_update` (
  `update_id` varchar(250) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_module_update`
--

LOCK TABLES `xe_module_update` WRITE;
/*!40000 ALTER TABLE `xe_module_update` DISABLE KEYS */;
INSERT INTO `xe_module_update` VALUES ('addon.1.11.6.updated'),('admin.1.11.6.updated'),('autoinstall.1.11.6.updated'),('board.1.11.6.updated'),('comment.1.11.6.updated'),('communication.1.11.6.updated'),('counter.1.11.6.updated'),('document.1.11.6.updated'),('editor.1.11.6.updated'),('file.1.11.6.updated'),('integration_search.1.11.6.updated'),('layout.1.11.6.updated'),('member.1.11.6.updated'),('member.1.8.43.recreate_signup_ruleset'),('menu.1.11.6.updated'),('message.1.11.6.updated'),('module.1.11.6.updated'),('page.1.11.6.updated'),('poll.1.11.6.updated'),('rss.1.11.6.updated'),('session.1.11.6.updated'),('spamfilter.1.11.6.updated'),('tag.1.11.6.updated'),('widget.1.11.6.updated');
/*!40000 ALTER TABLE `xe_module_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_modules`
--

DROP TABLE IF EXISTS `xe_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_modules` (
  `module_srl` bigint(11) NOT NULL,
  `module` varchar(80) NOT NULL,
  `module_category_srl` bigint(11) DEFAULT '0',
  `layout_srl` bigint(11) DEFAULT '0',
  `use_mobile` char(1) DEFAULT 'N',
  `mlayout_srl` bigint(11) DEFAULT '0',
  `menu_srl` bigint(11) DEFAULT '0',
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `mid` varchar(40) NOT NULL,
  `is_skin_fix` char(1) NOT NULL DEFAULT 'Y',
  `skin` varchar(250) DEFAULT NULL,
  `is_mskin_fix` char(1) NOT NULL DEFAULT 'Y',
  `mskin` varchar(250) DEFAULT NULL,
  `browser_title` varchar(250) NOT NULL,
  `description` text,
  `is_default` char(1) NOT NULL DEFAULT 'N',
  `content` longtext,
  `mcontent` longtext,
  `open_rss` char(1) NOT NULL DEFAULT 'Y',
  `header_text` text,
  `footer_text` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_srl`),
  UNIQUE KEY `idx_site_mid` (`site_srl`,`mid`),
  KEY `idx_module` (`module`),
  KEY `idx_module_category` (`module_category_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_modules`
--

LOCK TABLES `xe_modules` WRITE;
/*!40000 ALTER TABLE `xe_modules` DISABLE KEYS */;
INSERT INTO `xe_modules` VALUES (65,'page',0,-1,'Y',-1,64,0,'index','N','/USE_DEFAULT/','N','/USE_DEFAULT/','Welcome Page','','N','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"90\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\"  />','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"91\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\"  />','Y','','','20231120022656'),(67,'board',0,-1,'Y',-1,64,0,'board','N',NULL,'N',NULL,'Board',NULL,'N',NULL,NULL,'Y',NULL,NULL,'20231120022657'),(73,'page',0,-1,'Y',-1,64,0,'xeicon','N','/USE_DEFAULT/','N','/USE_DEFAULT/','XEIcon','','N','<div widget=\"widgetBox\" style=\"float:left;width:100%;\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" css_class=\"XEicon\" ><div><div><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"92\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"93\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"94\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /><img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"float:left;padding:none;margin:none;width:100%;\" document_srl=\"95\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" /></div></div></div>',NULL,'Y','','','20231120022657');
/*!40000 ALTER TABLE `xe_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_point`
--

DROP TABLE IF EXISTS `xe_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_point` (
  `member_srl` bigint(11) NOT NULL,
  `point` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_srl`),
  KEY `idx_point` (`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_point`
--

LOCK TABLES `xe_point` WRITE;
/*!40000 ALTER TABLE `xe_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll`
--

DROP TABLE IF EXISTS `xe_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll` (
  `poll_srl` bigint(11) NOT NULL,
  `stop_date` varchar(14) DEFAULT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll`
--

LOCK TABLES `xe_poll` WRITE;
/*!40000 ALTER TABLE `xe_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_item`
--

DROP TABLE IF EXISTS `xe_poll_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_item` (
  `poll_item_srl` bigint(11) NOT NULL,
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_item_srl`),
  KEY `index_poll_srl` (`poll_srl`),
  KEY `idx_poll_index_srl` (`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_item`
--

LOCK TABLES `xe_poll_item` WRITE;
/*!40000 ALTER TABLE `xe_poll_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_log`
--

DROP TABLE IF EXISTS `xe_poll_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_log` (
  `poll_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_poll_srl` (`poll_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_log`
--

LOCK TABLES `xe_poll_log` WRITE;
/*!40000 ALTER TABLE `xe_poll_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_poll_title`
--

DROP TABLE IF EXISTS `xe_poll_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_poll_title` (
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `checkcount` bigint(11) NOT NULL DEFAULT '1',
  `poll_count` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  KEY `idx_poll_srl` (`poll_srl`,`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_poll_title`
--

LOCK TABLES `xe_poll_title` WRITE;
/*!40000 ALTER TABLE `xe_poll_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_poll_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_sequence`
--

DROP TABLE IF EXISTS `xe_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_sequence` (
  `seq` bigint(64) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_sequence`
--

LOCK TABLES `xe_sequence` WRITE;
/*!40000 ALTER TABLE `xe_sequence` DISABLE KEYS */;
INSERT INTO `xe_sequence` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129);
/*!40000 ALTER TABLE `xe_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_session`
--

DROP TABLE IF EXISTS `xe_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_session` (
  `session_key` varchar(255) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `expired` varchar(14) DEFAULT NULL,
  `val` longtext,
  `ipaddress` varchar(128) NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `cur_mid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`session_key`),
  KEY `idx_session_member_srl` (`member_srl`),
  KEY `idx_session_expired` (`expired`),
  KEY `idx_session_update` (`last_update`),
  KEY `idx_session_cur_mid` (`cur_mid`),
  KEY `idx_session_update_mid` (`member_srl`,`last_update`,`cur_mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_session`
--

LOCK TABLES `xe_session` WRITE;
/*!40000 ALTER TABLE `xe_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_site_admin`
--

DROP TABLE IF EXISTS `xe_site_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_site_admin` (
  `site_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `idx_site_admin` (`site_srl`,`member_srl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_site_admin`
--

LOCK TABLES `xe_site_admin` WRITE;
/*!40000 ALTER TABLE `xe_site_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_site_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_sites`
--

DROP TABLE IF EXISTS `xe_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_sites` (
  `site_srl` bigint(11) NOT NULL,
  `index_module_srl` bigint(11) DEFAULT '0',
  `domain` varchar(255) NOT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`site_srl`),
  UNIQUE KEY `unique_domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_sites`
--

LOCK TABLES `xe_sites` WRITE;
/*!40000 ALTER TABLE `xe_sites` DISABLE KEYS */;
INSERT INTO `xe_sites` VALUES (0,65,'www.gusiya.com/xe/','ko','20231120022655');
/*!40000 ALTER TABLE `xe_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_denied_ip`
--

DROP TABLE IF EXISTS `xe_spamfilter_denied_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_denied_ip` (
  `ipaddress` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_denied_ip`
--

LOCK TABLES `xe_spamfilter_denied_ip` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_denied_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_denied_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_denied_word`
--

DROP TABLE IF EXISTS `xe_spamfilter_denied_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_denied_word` (
  `word` varchar(250) NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `latest_hit` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`word`),
  KEY `idx_hit` (`hit`),
  KEY `idx_latest_hit` (`latest_hit`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_denied_word`
--

LOCK TABLES `xe_spamfilter_denied_word` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_denied_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_denied_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_spamfilter_log`
--

DROP TABLE IF EXISTS `xe_spamfilter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_spamfilter_log` (
  `spamfilter_log_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`spamfilter_log_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_spamfilter_log`
--

LOCK TABLES `xe_spamfilter_log` WRITE;
/*!40000 ALTER TABLE `xe_spamfilter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_spamfilter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_tags`
--

DROP TABLE IF EXISTS `xe_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_tags` (
  `tag_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `tag` varchar(240) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`tag_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_tag` (`document_srl`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_tags`
--

LOCK TABLES `xe_tags` WRITE;
/*!40000 ALTER TABLE `xe_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xe_trash`
--

DROP TABLE IF EXISTS `xe_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xe_trash` (
  `trash_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `origin_module` varchar(250) NOT NULL DEFAULT 'document',
  `serialized_object` longtext NOT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `remover_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xe_trash`
--

LOCK TABLES `xe_trash` WRITE;
/*!40000 ALTER TABLE `xe_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `xe_trash` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 11:38:00
