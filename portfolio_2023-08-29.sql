# ************************************************************
# Sequel Ace SQL dump
# Version 20035
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.27)
# Database: portfolio
# Generation Time: 2023-08-29 21:02:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table wp_actionscheduler_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint unsigned NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`)
VALUES
	(141,'action_scheduler/migration_hook','complete','2023-06-15 09:36:19','2023-06-15 09:36:19','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1686821779;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1686821779;}',1,1,'2023-06-15 09:36:23','2023-06-15 10:36:23',0,NULL),
	(142,'woocommerce_cleanup_draft_orders','complete','2023-06-15 09:35:20','2023-06-15 09:35:20','[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1686821720;s:18:\"\0*\0first_timestamp\";i:1686821720;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1686821720;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',0,1,'2023-06-15 09:36:23','2023-06-15 10:36:23',0,NULL),
	(143,'woocommerce_cleanup_draft_orders','pending','2023-06-16 09:36:23','2023-06-16 09:36:23','[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1686908183;s:18:\"\0*\0first_timestamp\";i:1686821720;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1686908183;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL);

/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_actionscheduler_claims
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_actionscheduler_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`)
VALUES
	(1,'action-scheduler-migration');

/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_actionscheduler_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`)
VALUES
	(1,141,'action created','2023-06-15 09:35:19','2023-06-15 09:35:19'),
	(2,142,'action created','2023-06-15 09:35:20','2023-06-15 09:35:20'),
	(3,142,'action started via Async Request','2023-06-15 09:36:23','2023-06-15 09:36:23'),
	(4,142,'action complete via Async Request','2023-06-15 09:36:23','2023-06-15 09:36:23'),
	(5,143,'action created','2023-06-15 09:36:23','2023-06-15 09:36:23'),
	(6,141,'action started via Async Request','2023-06-15 09:36:23','2023-06-15 09:36:23'),
	(7,141,'action complete via Async Request','2023-06-15 09:36:23','2023-06-15 09:36:23');

/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2023-04-28 14:07:24','2023-04-28 14:07:24','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);

/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=1287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','https://portfolio.localhost','yes'),
	(2,'home','https://portfolio.localhost','yes'),
	(3,'blogname','Blanchar Senga-Vita','yes'),
	(4,'blogdescription','Développeur Web','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','anchar2107@gmail.com','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/%postname%/','yes'),
	(29,'rewrite_rules','a:128:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"projet/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"projet/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"projet/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"projet/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"projet/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"projet/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"projet/([^/]+)/embed/?$\";s:39:\"index.php?projet=$matches[1]&embed=true\";s:27:\"projet/([^/]+)/trackback/?$\";s:33:\"index.php?projet=$matches[1]&tb=1\";s:35:\"projet/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?projet=$matches[1]&paged=$matches[2]\";s:42:\"projet/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?projet=$matches[1]&cpage=$matches[2]\";s:31:\"projet/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?projet=$matches[1]&page=$matches[2]\";s:23:\"projet/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"projet/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"projet/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"projet/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"projet/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"projet/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:35:\"message/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"message/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"message/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"message/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"message/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"message/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"message/([^/]+)/embed/?$\";s:40:\"index.php?message=$matches[1]&embed=true\";s:28:\"message/([^/]+)/trackback/?$\";s:34:\"index.php?message=$matches[1]&tb=1\";s:36:\"message/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?message=$matches[1]&paged=$matches[2]\";s:43:\"message/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?message=$matches[1]&cpage=$matches[2]\";s:32:\"message/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?message=$matches[1]&page=$matches[2]\";s:24:\"message/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"message/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"message/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"message/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"message/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"message/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=17&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:3:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";i:2;s:27:\"svg-support/svg-support.php\";}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','1','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','a:2:{i:0;s:94:\"/Users/blanchar/ecole/annee-4/design-web/sites/Portfolio/wp-content/themes/portfolio/style.css\";i:2;s:0:\"\";}','no'),
	(40,'template','portfolio','yes'),
	(41,'stylesheet','portfolio','yes'),
	(42,'comment_registration','0','yes'),
	(43,'html_type','text/html','yes'),
	(44,'use_trackback','0','yes'),
	(45,'default_role','subscriber','yes'),
	(46,'db_version','53496','yes'),
	(47,'uploads_use_yearmonth_folders','1','yes'),
	(48,'upload_path','','yes'),
	(49,'blog_public','1','yes'),
	(50,'default_link_category','2','yes'),
	(51,'show_on_front','page','yes'),
	(52,'tag_base','','yes'),
	(53,'show_avatars','1','yes'),
	(54,'avatar_rating','G','yes'),
	(55,'upload_url_path','','yes'),
	(56,'thumbnail_size_w','150','yes'),
	(57,'thumbnail_size_h','150','yes'),
	(58,'thumbnail_crop','1','yes'),
	(59,'medium_size_w','300','yes'),
	(60,'medium_size_h','300','yes'),
	(61,'avatar_default','mystery','yes'),
	(62,'large_size_w','1024','yes'),
	(63,'large_size_h','1024','yes'),
	(64,'image_default_link_type','none','yes'),
	(65,'image_default_size','','yes'),
	(66,'image_default_align','','yes'),
	(67,'close_comments_for_old_posts','0','yes'),
	(68,'close_comments_days_old','14','yes'),
	(69,'thread_comments','1','yes'),
	(70,'thread_comments_depth','5','yes'),
	(71,'page_comments','0','yes'),
	(72,'comments_per_page','50','yes'),
	(73,'default_comments_page','newest','yes'),
	(74,'comment_order','asc','yes'),
	(75,'sticky_posts','a:0:{}','yes'),
	(76,'widget_categories','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(77,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(78,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'uninstall_plugins','a:0:{}','no'),
	(80,'timezone_string','','yes'),
	(81,'page_for_posts','0','yes'),
	(82,'page_on_front','17','yes'),
	(83,'default_post_format','0','yes'),
	(84,'link_manager_enabled','0','yes'),
	(85,'finished_splitting_shared_terms','1','yes'),
	(86,'site_icon','0','yes'),
	(87,'medium_large_size_w','768','yes'),
	(88,'medium_large_size_h','0','yes'),
	(89,'wp_page_for_privacy_policy','55','yes'),
	(90,'show_comments_cookies_opt_in','1','yes'),
	(91,'admin_email_lifespan','1698242844','yes'),
	(92,'disallowed_keys','','no'),
	(93,'comment_previously_approved','1','yes'),
	(94,'auto_plugin_theme_update_emails','a:0:{}','no'),
	(95,'auto_update_core_dev','enabled','yes'),
	(96,'auto_update_core_minor','enabled','yes'),
	(97,'auto_update_core_major','enabled','yes'),
	(98,'wp_force_deactivated_plugins','a:0:{}','yes'),
	(99,'initial_db_version','53496','yes'),
	(100,'wp_user_roles','a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}','yes'),
	(101,'fresh_site','0','yes'),
	(102,'user_count','1','no'),
	(103,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(104,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','yes'),
	(105,'cron','a:14:{i:1693341387;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1693343247;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1693350000;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693361247;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1693361258;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1693366518;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1693388118;a:1:{s:14:\"wc_admin_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693388128;a:2:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693398918;a:2:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:31:\"woocommerce_cleanup_rate_limits\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693404447;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693404458;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693404460;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1693663647;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes'),
	(106,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(109,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(110,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(113,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(114,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(115,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(116,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(117,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(118,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(119,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(121,'recovery_keys','a:0:{}','yes'),
	(124,'theme_mods_twentytwentythree','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1682690909;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','yes'),
	(127,'https_detection_errors','a:2:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}s:19:\"bad_response_source\";a:1:{i:0;s:55:\"It looks like the response did not come from this site.\";}}','yes'),
	(141,'can_compress_scripts','0','no'),
	(155,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:20:\"anchar2107@gmail.com\";s:7:\"version\";s:3:\"6.2\";s:9:\"timestamp\";i:1682690873;}','no'),
	(157,'current_theme','Portfolio','yes'),
	(158,'theme_mods_hepl','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1682690949;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','yes'),
	(159,'theme_switched','','yes'),
	(162,'finished_updating_comment_type','1','yes'),
	(165,'theme_mods_twentytwentyone','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1682691993;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:9:\"sidebar-1\";a:0:{}}}}','yes'),
	(167,'theme_mods_portfolio','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:4:\"main\";i:4;s:6:\"footer\";i:5;}s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(168,'recently_activated','a:1:{s:43:\"envira-gallery-lite/envira-gallery-lite.php\";i:1692631151;}','yes'),
	(171,'WPLANG','fr_BE','yes'),
	(172,'new_admin_email','anchar2107@gmail.com','yes'),
	(194,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
	(207,'_transient_health-check-site-status-result','{\"good\":15,\"recommended\":6,\"critical\":0}','yes'),
	(221,'acf_version','6.0.6','yes'),
	(303,'_wp_suggested_policy_text_has_changed','not-changed','yes'),
	(559,'action_scheduler_hybrid_store_demarkation','140','yes'),
	(560,'schema-ActionScheduler_StoreSchema','6.0.1686821717','yes'),
	(561,'schema-ActionScheduler_LoggerSchema','3.0.1686821717','yes'),
	(564,'woocommerce_schema_version','430','yes'),
	(565,'woocommerce_store_address','','yes'),
	(566,'woocommerce_store_address_2','','yes'),
	(567,'woocommerce_store_city','','yes'),
	(568,'woocommerce_default_country','BE','yes'),
	(569,'woocommerce_store_postcode','','yes'),
	(570,'woocommerce_allowed_countries','all','yes'),
	(571,'woocommerce_all_except_countries','a:0:{}','yes'),
	(572,'woocommerce_specific_allowed_countries','a:0:{}','yes'),
	(573,'woocommerce_ship_to_countries','','yes'),
	(574,'woocommerce_specific_ship_to_countries','a:0:{}','yes'),
	(575,'woocommerce_default_customer_address','base','yes'),
	(576,'woocommerce_calc_taxes','no','yes'),
	(577,'woocommerce_enable_coupons','yes','yes'),
	(578,'woocommerce_calc_discounts_sequentially','no','no'),
	(579,'woocommerce_currency','EUR','yes'),
	(580,'woocommerce_currency_pos','left_space','yes'),
	(581,'woocommerce_price_thousand_sep','.','yes'),
	(582,'woocommerce_price_decimal_sep',',','yes'),
	(583,'woocommerce_price_num_decimals','2','yes'),
	(584,'woocommerce_shop_page_id','141','yes'),
	(585,'woocommerce_cart_redirect_after_add','no','yes'),
	(586,'woocommerce_enable_ajax_add_to_cart','yes','yes'),
	(587,'woocommerce_placeholder_image','140','yes'),
	(588,'woocommerce_weight_unit','kg','yes'),
	(589,'woocommerce_dimension_unit','cm','yes'),
	(590,'woocommerce_enable_reviews','yes','yes'),
	(591,'woocommerce_review_rating_verification_label','yes','no'),
	(592,'woocommerce_review_rating_verification_required','no','no'),
	(593,'woocommerce_enable_review_rating','yes','yes'),
	(594,'woocommerce_review_rating_required','yes','no'),
	(595,'woocommerce_manage_stock','yes','yes'),
	(596,'woocommerce_hold_stock_minutes','60','no'),
	(597,'woocommerce_notify_low_stock','yes','no'),
	(598,'woocommerce_notify_no_stock','yes','no'),
	(599,'woocommerce_stock_email_recipient','anchar2107@gmail.com','no'),
	(600,'woocommerce_notify_low_stock_amount','2','no'),
	(601,'woocommerce_notify_no_stock_amount','0','yes'),
	(602,'woocommerce_hide_out_of_stock_items','no','yes'),
	(603,'woocommerce_stock_format','','yes'),
	(604,'woocommerce_file_download_method','force','no'),
	(605,'woocommerce_downloads_redirect_fallback_allowed','no','no'),
	(606,'woocommerce_downloads_require_login','no','no'),
	(607,'woocommerce_downloads_grant_access_after_payment','yes','no'),
	(608,'woocommerce_downloads_deliver_inline','','no'),
	(609,'woocommerce_downloads_add_hash_to_filename','yes','yes'),
	(610,'woocommerce_attribute_lookup_enabled','no','yes'),
	(611,'woocommerce_attribute_lookup_direct_updates','no','yes'),
	(612,'woocommerce_prices_include_tax','no','yes'),
	(613,'woocommerce_tax_based_on','shipping','yes'),
	(614,'woocommerce_shipping_tax_class','inherit','yes'),
	(615,'woocommerce_tax_round_at_subtotal','no','yes'),
	(616,'woocommerce_tax_classes','','yes'),
	(617,'woocommerce_tax_display_shop','excl','yes'),
	(618,'woocommerce_tax_display_cart','excl','yes'),
	(619,'woocommerce_price_display_suffix','','yes'),
	(620,'woocommerce_tax_total_display','itemized','no'),
	(621,'woocommerce_enable_shipping_calc','yes','no'),
	(622,'woocommerce_shipping_cost_requires_address','no','yes'),
	(623,'woocommerce_ship_to_destination','billing','no'),
	(624,'woocommerce_shipping_debug_mode','no','yes'),
	(625,'woocommerce_enable_guest_checkout','yes','no'),
	(626,'woocommerce_enable_checkout_login_reminder','no','no'),
	(627,'woocommerce_enable_signup_and_login_from_checkout','no','no'),
	(628,'woocommerce_enable_myaccount_registration','no','no'),
	(629,'woocommerce_registration_generate_username','yes','no'),
	(630,'woocommerce_registration_generate_password','yes','no'),
	(631,'woocommerce_erasure_request_removes_order_data','no','no'),
	(632,'woocommerce_erasure_request_removes_download_data','no','no'),
	(633,'woocommerce_allow_bulk_remove_personal_data','no','no'),
	(634,'woocommerce_registration_privacy_policy_text','Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].','yes'),
	(635,'woocommerce_checkout_privacy_policy_text','Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].','yes'),
	(636,'woocommerce_delete_inactive_accounts','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','no'),
	(637,'woocommerce_trash_pending_orders','','no'),
	(638,'woocommerce_trash_failed_orders','','no'),
	(639,'woocommerce_trash_cancelled_orders','','no'),
	(640,'woocommerce_anonymize_completed_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','no'),
	(641,'woocommerce_email_from_name','Blanchar Senga-Vita','no'),
	(642,'woocommerce_email_from_address','anchar2107@gmail.com','no'),
	(643,'woocommerce_email_header_image','','no'),
	(644,'woocommerce_email_footer_text','{site_title} &mdash; Built with {WooCommerce}','no'),
	(645,'woocommerce_email_base_color','#7f54b3','no'),
	(646,'woocommerce_email_background_color','#f7f7f7','no'),
	(647,'woocommerce_email_body_background_color','#ffffff','no'),
	(648,'woocommerce_email_text_color','#3c3c3c','no'),
	(649,'woocommerce_merchant_email_notifications','no','no'),
	(650,'woocommerce_cart_page_id','142','no'),
	(651,'woocommerce_checkout_page_id','143','no'),
	(652,'woocommerce_myaccount_page_id','144','no'),
	(653,'woocommerce_terms_page_id','','no'),
	(654,'woocommerce_checkout_pay_endpoint','order-pay','yes'),
	(655,'woocommerce_checkout_order_received_endpoint','order-received','yes'),
	(656,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','yes'),
	(657,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','yes'),
	(658,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','yes'),
	(659,'woocommerce_myaccount_orders_endpoint','orders','yes'),
	(660,'woocommerce_myaccount_view_order_endpoint','view-order','yes'),
	(661,'woocommerce_myaccount_downloads_endpoint','downloads','yes'),
	(662,'woocommerce_myaccount_edit_account_endpoint','edit-account','yes'),
	(663,'woocommerce_myaccount_edit_address_endpoint','edit-address','yes'),
	(664,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','yes'),
	(665,'woocommerce_myaccount_lost_password_endpoint','lost-password','yes'),
	(666,'woocommerce_logout_endpoint','customer-logout','yes'),
	(667,'woocommerce_api_enabled','no','yes'),
	(668,'woocommerce_allow_tracking','yes','no'),
	(669,'woocommerce_show_marketplace_suggestions','yes','no'),
	(670,'woocommerce_analytics_enabled','yes','yes'),
	(671,'woocommerce_navigation_enabled','no','yes'),
	(672,'woocommerce_feature_product_block_editor_enabled','no','yes'),
	(673,'woocommerce_feature_custom_order_tables_enabled','no','yes'),
	(674,'woocommerce_single_image_width','600','yes'),
	(675,'woocommerce_thumbnail_image_width','300','yes'),
	(676,'woocommerce_checkout_highlight_required_fields','yes','yes'),
	(677,'woocommerce_demo_store','no','no'),
	(678,'wc_downloads_approved_directories_mode','enabled','yes'),
	(679,'woocommerce_permalinks','a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}','yes'),
	(680,'current_theme_supports_woocommerce','no','yes'),
	(681,'woocommerce_queue_flush_rewrite_rules','no','yes'),
	(682,'_transient_wc_attribute_taxonomies','a:0:{}','yes'),
	(683,'product_cat_children','a:0:{}','yes'),
	(684,'default_product_cat','19','yes'),
	(686,'woocommerce_refund_returns_page_id','145','yes'),
	(689,'woocommerce_paypal_settings','a:23:{s:7:\"enabled\";s:2:\"no\";s:5:\"title\";s:6:\"PayPal\";s:11:\"description\";s:85:\"Pay via PayPal; you can pay with your credit card if you don\'t have a PayPal account.\";s:5:\"email\";s:20:\"anchar2107@gmail.com\";s:8:\"advanced\";s:0:\"\";s:8:\"testmode\";s:2:\"no\";s:5:\"debug\";s:2:\"no\";s:16:\"ipn_notification\";s:3:\"yes\";s:14:\"receiver_email\";s:20:\"anchar2107@gmail.com\";s:14:\"identity_token\";s:0:\"\";s:14:\"invoice_prefix\";s:3:\"WC-\";s:13:\"send_shipping\";s:3:\"yes\";s:16:\"address_override\";s:2:\"no\";s:13:\"paymentaction\";s:4:\"sale\";s:9:\"image_url\";s:0:\"\";s:11:\"api_details\";s:0:\"\";s:12:\"api_username\";s:0:\"\";s:12:\"api_password\";s:0:\"\";s:13:\"api_signature\";s:0:\"\";s:20:\"sandbox_api_username\";s:0:\"\";s:20:\"sandbox_api_password\";s:0:\"\";s:21:\"sandbox_api_signature\";s:0:\"\";s:12:\"_should_load\";s:2:\"no\";}','yes'),
	(690,'woocommerce_version','7.8.0','yes'),
	(691,'woocommerce_db_version','7.8.0','yes'),
	(692,'woocommerce_admin_install_timestamp','1686821719','yes'),
	(693,'woocommerce_inbox_variant_assignment','10','yes'),
	(697,'_transient_jetpack_autoloader_plugin_paths','a:0:{}','yes'),
	(698,'action_scheduler_lock_async-request-runner','1686822236','yes'),
	(699,'woocommerce_admin_notices','a:0:{}','yes'),
	(700,'woocommerce_maxmind_geolocation_settings','a:1:{s:15:\"database_prefix\";s:32:\"VyjUlzDoNATpjiueRiZaeSLaBC7g5BKW\";}','yes'),
	(701,'_transient_woocommerce_webhook_ids_status_active','a:0:{}','yes'),
	(702,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(703,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(704,'widget_woocommerce_layered_nav','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(705,'widget_woocommerce_price_filter','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(706,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(707,'widget_woocommerce_product_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(708,'widget_woocommerce_product_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(709,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(710,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(711,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(712,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(713,'widget_woocommerce_rating_filter','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(717,'_transient_wc_count_comments','O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}','yes'),
	(722,'_transient_woocommerce_shipping_task_zone_count_transient','0','yes'),
	(723,'wc_blocks_db_schema_version','260','yes'),
	(724,'wc_remote_inbox_notifications_stored_state','O:8:\"stdClass\":2:{s:22:\"there_were_no_products\";b:1;s:22:\"there_are_now_products\";b:0;}','no'),
	(733,'_transient_woocommerce_reports-transient-version','1686821753','yes'),
	(740,'woocommerce_task_list_tracked_completed_tasks','a:1:{i:0;s:8:\"purchase\";}','yes'),
	(743,'wc_has_tracked_default_theme','1','yes'),
	(749,'woocommerce_onboarding_profile','a:10:{s:18:\"is_agree_marketing\";b:0;s:11:\"store_email\";s:20:\"anchar2107@gmail.com\";s:20:\"is_store_country_set\";b:1;s:8:\"industry\";a:1:{i:0;a:1:{s:4:\"slug\";s:22:\"education-and-learning\";}}s:13:\"product_types\";a:1:{i:0;s:8:\"physical\";}s:13:\"product_count\";s:4:\"1-10\";s:14:\"selling_venues\";s:2:\"no\";s:12:\"setup_client\";b:0;s:19:\"business_extensions\";a:0:{}s:9:\"completed\";b:1;}','yes'),
	(750,'woocommerce_task_list_dismissed_tasks','a:0:{}','yes'),
	(752,'woocommerce_task_list_prompt_shown','1','yes'),
	(764,'_transient_product_query-transient-version','1686822031','yes'),
	(767,'_transient_shipping-transient-version','1686822069','yes'),
	(778,'envira_gallery_116','1','yes'),
	(779,'envira_gallery_121','1','yes'),
	(780,'envira_gallery_review','a:2:{s:4:\"time\";i:1692469828;s:9:\"dismissed\";b:1;}','yes'),
	(781,'envira_gallery_subscribe','1','yes'),
	(1223,'bodhi_svgs_plugin_version','2.5.5','yes'),
	(1224,'bodhi_svgs_settings','a:4:{s:22:\"sanitize_svg_front_end\";s:2:\"on\";s:8:\"restrict\";a:1:{i:0;s:13:\"administrator\";}s:12:\"sanitize_svg\";s:2:\"on\";s:24:\"sanitize_on_upload_roles\";a:2:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";}}','yes'),
	(1267,'_transient_timeout_acf_plugin_updates','1693384100','no'),
	(1268,'_transient_acf_plugin_updates','a:5:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.2.0\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.3\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"5.8\";s:12:\"requires_php\";s:3:\"7.0\";s:12:\"release_date\";s:8:\"20230809\";}}s:9:\"no_update\";a:0:{}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.0.6\";}}','no'),
	(1275,'_site_transient_timeout_php_check_3ff15c6f1c82922bfe85d4421a79d9c5','1693816103','no'),
	(1276,'_site_transient_php_check_3ff15c6f1c82922bfe85d4421a79d9c5','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),
	(1281,'_site_transient_timeout_theme_roots','1693342000','no'),
	(1282,'_site_transient_theme_roots','a:1:{s:9:\"portfolio\";s:7:\"/themes\";}','no'),
	(1284,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.3.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.3.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.3.1\";s:7:\"version\";s:5:\"6.3.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.3.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.3.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.3.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.3.1\";s:7:\"version\";s:5:\"6.3.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.3.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-6.3-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.3\";s:7:\"version\";s:3:\"6.3\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.2.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.2.2-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.2.2-rollback-0.zip\";}s:7:\"current\";s:5:\"6.2.2\";s:7:\"version\";s:5:\"6.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:3:\"6.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1693340201;s:15:\"version_checked\";s:3:\"6.2\";s:12:\"translations\";a:0:{}}','no'),
	(1285,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1693340202;s:7:\"checked\";a:1:{s:9:\"portfolio\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
	(1286,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1693340202;s:8:\"response\";a:6:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"6.2.0\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.6.2.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=2892919\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=2892919\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.3.1\";s:12:\"requires_php\";s:3:\"7.0\";}s:43:\"envira-gallery-lite/envira-gallery-lite.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/envira-gallery-lite\";s:4:\"slug\";s:19:\"envira-gallery-lite\";s:6:\"plugin\";s:43:\"envira-gallery-lite/envira-gallery-lite.php\";s:11:\"new_version\";s:7:\"1.8.6.2\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/envira-gallery-lite/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/envira-gallery-lite.1.8.6.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/envira-gallery-lite/assets/icon-256x256.png?rev=2022837\";s:2:\"1x\";s:72:\"https://ps.w.org/envira-gallery-lite/assets/icon-128x128.png?rev=2022837\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/envira-gallery-lite/assets/banner-1544x500.jpg?rev=1686480\";s:2:\"1x\";s:74:\"https://ps.w.org/envira-gallery-lite/assets/banner-772x250.jpg?rev=1686480\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"5.0.0\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"5.6\";}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:22:\"w.org/plugins/polylang\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:5:\"3.4.5\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/polylang.3.4.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/polylang/assets/icon-256x256.png?rev=1331499\";s:2:\"1x\";s:61:\"https://ps.w.org/polylang/assets/icon-128x128.png?rev=1331499\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/polylang/assets/banner-1544x500.png?rev=1405299\";s:2:\"1x\";s:63:\"https://ps.w.org/polylang/assets/banner-772x250.png?rev=1405299\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.0\";}s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:35:\"w.org/plugins/regenerate-thumbnails\";s:4:\"slug\";s:21:\"regenerate-thumbnails\";s:6:\"plugin\";s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";s:11:\"new_version\";s:5:\"3.1.6\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/regenerate-thumbnails/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/regenerate-thumbnails.3.1.6.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:74:\"https://ps.w.org/regenerate-thumbnails/assets/icon-128x128.png?rev=1753390\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/regenerate-thumbnails/assets/banner-1544x500.jpg?rev=1753390\";s:2:\"1x\";s:76:\"https://ps.w.org/regenerate-thumbnails/assets/banner-772x250.jpg?rev=1753390\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.7\";s:6:\"tested\";s:5:\"6.3.1\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"8.0.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.8.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.gif?rev=2869506\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.gif?rev=2869506\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.2\";s:6:\"tested\";s:5:\"6.3.1\";s:12:\"requires_php\";s:3:\"7.3\";}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.2.0\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.3\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"5.8\";s:12:\"requires_php\";s:3:\"7.0\";s:12:\"release_date\";s:8:\"20230809\";}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"woocommerce\";s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"7.8.0\";s:7:\"updated\";s:19:\"2022-05-20 05:27:20\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/woocommerce/7.8.0/fr_BE.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:2:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}s:27:\"svg-support/svg-support.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/svg-support\";s:4:\"slug\";s:11:\"svg-support\";s:6:\"plugin\";s:27:\"svg-support/svg-support.php\";s:11:\"new_version\";s:5:\"2.5.5\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/svg-support/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/svg-support.2.5.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:56:\"https://ps.w.org/svg-support/assets/icon.svg?rev=1417738\";s:3:\"svg\";s:56:\"https://ps.w.org/svg-support/assets/icon.svg?rev=1417738\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/svg-support/assets/banner-1544x500.jpg?rev=1215377\";s:2:\"1x\";s:66:\"https://ps.w.org/svg-support/assets/banner-772x250.jpg?rev=1215377\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.8\";}}s:7:\"checked\";a:8:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"6.0.7\";s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.0.6\";s:43:\"envira-gallery-lite/envira-gallery-lite.php\";s:7:\"1.8.6.1\";s:9:\"hello.php\";s:5:\"1.7.2\";s:21:\"polylang/polylang.php\";s:5:\"3.3.2\";s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";s:5:\"3.1.5\";s:27:\"svg-support/svg-support.php\";s:5:\"2.5.5\";s:27:\"woocommerce/woocommerce.php\";s:5:\"7.8.0\";}}','no');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(4,5,'_menu_item_type','custom'),
	(5,5,'_menu_item_menu_item_parent','0'),
	(6,5,'_menu_item_object_id','5'),
	(7,5,'_menu_item_object','custom'),
	(8,5,'_menu_item_target',''),
	(9,5,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(10,5,'_menu_item_xfn',''),
	(11,5,'_menu_item_url','https://portfolio.localhost/'),
	(13,6,'_menu_item_type','custom'),
	(14,6,'_menu_item_menu_item_parent','0'),
	(15,6,'_menu_item_object_id','6'),
	(16,6,'_menu_item_object','custom'),
	(17,6,'_menu_item_target',''),
	(18,6,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(19,6,'_menu_item_xfn',''),
	(20,6,'_menu_item_url','https://portfolio.localhost/contact'),
	(22,7,'_menu_item_type','custom'),
	(23,7,'_menu_item_menu_item_parent','0'),
	(24,7,'_menu_item_object_id','7'),
	(25,7,'_menu_item_object','custom'),
	(26,7,'_menu_item_target',''),
	(27,7,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(28,7,'_menu_item_xfn',''),
	(29,7,'_menu_item_url','https://portfolio.localhost/#project'),
	(31,8,'_menu_item_type','custom'),
	(32,8,'_menu_item_menu_item_parent','0'),
	(33,8,'_menu_item_object_id','8'),
	(34,8,'_menu_item_object','custom'),
	(35,8,'_menu_item_target',''),
	(36,8,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(37,8,'_menu_item_xfn',''),
	(38,8,'_menu_item_url','https://portfolio.localhost/#quality'),
	(40,1,'_edit_lock','1683288266:1'),
	(41,10,'_edit_last','1'),
	(42,10,'_edit_lock','1692697038:1'),
	(44,17,'_edit_last','1'),
	(45,17,'_edit_lock','1692684258:1'),
	(46,17,'description_title','Je suis'),
	(47,17,'_description_title','field_6454f846332a5'),
	(48,17,'first_quality','Energetique'),
	(49,17,'_first_quality','field_6454fb267ba2b'),
	(50,17,'second_quality','Optimiste'),
	(51,17,'_second_quality','field_6454fb657ba2d'),
	(52,17,'third_quality','Imaginatif'),
	(53,17,'_third_quality','field_6454fb687ba2e'),
	(54,19,'description_title','Je suis'),
	(55,19,'_description_title','field_6454f846332a5'),
	(56,19,'first_quality','Energetique'),
	(57,19,'_first_quality','field_6454fb267ba2b'),
	(58,19,'second_quality','Optimiste'),
	(59,19,'_second_quality','field_6454fb657ba2d'),
	(60,19,'third_quality','Imaginatif'),
	(61,19,'_third_quality','field_6454fb687ba2e'),
	(68,17,'qualities_0_quality','Énergétique'),
	(69,17,'_qualities_0_quality','field_6455193f2107c'),
	(70,17,'qualities_0_image',''),
	(71,17,'_qualities_0_image','field_6455195e2107d'),
	(72,17,'qualities_1_quality','Optimiste'),
	(73,17,'_qualities_1_quality','field_6455193f2107c'),
	(74,17,'qualities_1_image',''),
	(75,17,'_qualities_1_image','field_6455195e2107d'),
	(76,17,'qualities_2_quality','Imaginatif'),
	(77,17,'_qualities_2_quality','field_6455193f2107c'),
	(78,17,'qualities_2_image',''),
	(79,17,'_qualities_2_image','field_6455195e2107d'),
	(84,17,'qualities','3'),
	(85,17,'_qualities','field_645502ddc0ba0'),
	(86,17,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\">excellent</span> développeur web.'),
	(87,17,'_description_0_paragraphe','field_645517a4a01fe'),
	(94,17,'description','1'),
	(95,17,'_description','field_6455160e66ede'),
	(96,47,'description_title','Je suis'),
	(97,47,'_description_title','field_6454f846332a5'),
	(98,47,'first_quality','Energetique'),
	(99,47,'_first_quality','field_6454fb267ba2b'),
	(100,47,'second_quality','Optimiste'),
	(101,47,'_second_quality','field_6454fb657ba2d'),
	(102,47,'third_quality','Imaginatif'),
	(103,47,'_third_quality','field_6454fb687ba2e'),
	(104,47,'qualities_0_quality','Énergétique'),
	(105,47,'_qualities_0_quality','field_6455193f2107c'),
	(106,47,'qualities_0_image',''),
	(107,47,'_qualities_0_image','field_6455195e2107d'),
	(108,47,'qualities_1_quality','Optimiste'),
	(109,47,'_qualities_1_quality','field_6455193f2107c'),
	(110,47,'qualities_1_image',''),
	(111,47,'_qualities_1_image','field_6455195e2107d'),
	(112,47,'qualities_2_quality','Imaginatif'),
	(113,47,'_qualities_2_quality','field_6455193f2107c'),
	(114,47,'qualities_2_image',''),
	(115,47,'_qualities_2_image','field_6455195e2107d'),
	(116,47,'qualities_3_quality',''),
	(117,47,'_qualities_3_quality','field_6455193f2107c'),
	(118,47,'qualities_3_image',''),
	(119,47,'_qualities_3_image','field_6455195e2107d'),
	(120,47,'qualities','4'),
	(121,47,'_qualities','field_645502ddc0ba0'),
	(122,47,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(123,47,'_description_0_paragraphe','field_645517a4a01fe'),
	(124,47,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(125,47,'_description_1_paragraphe','field_645517a4a01fe'),
	(126,47,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(127,47,'_description_2_paragraphe','field_645517a4a01fe'),
	(128,47,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(129,47,'_description_3_paragraphe','field_645517a4a01fe'),
	(130,47,'description','4'),
	(131,47,'_description','field_6455160e66ede'),
	(132,48,'description_title','Je suis'),
	(133,48,'_description_title','field_6454f846332a5'),
	(134,48,'first_quality','Energetique'),
	(135,48,'_first_quality','field_6454fb267ba2b'),
	(136,48,'second_quality','Optimiste'),
	(137,48,'_second_quality','field_6454fb657ba2d'),
	(138,48,'third_quality','Imaginatif'),
	(139,48,'_third_quality','field_6454fb687ba2e'),
	(140,48,'qualities_0_quality','Énergétique'),
	(141,48,'_qualities_0_quality','field_6455193f2107c'),
	(142,48,'qualities_0_image',''),
	(143,48,'_qualities_0_image','field_6455195e2107d'),
	(144,48,'qualities_1_quality','Optimiste'),
	(145,48,'_qualities_1_quality','field_6455193f2107c'),
	(146,48,'qualities_1_image',''),
	(147,48,'_qualities_1_image','field_6455195e2107d'),
	(148,48,'qualities_2_quality','Imaginatif'),
	(149,48,'_qualities_2_quality','field_6455193f2107c'),
	(150,48,'qualities_2_image',''),
	(151,48,'_qualities_2_image','field_6455195e2107d'),
	(152,48,'qualities','3'),
	(153,48,'_qualities','field_645502ddc0ba0'),
	(154,48,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(155,48,'_description_0_paragraphe','field_645517a4a01fe'),
	(156,48,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(157,48,'_description_1_paragraphe','field_645517a4a01fe'),
	(158,48,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(159,48,'_description_2_paragraphe','field_645517a4a01fe'),
	(160,48,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(161,48,'_description_3_paragraphe','field_645517a4a01fe'),
	(162,48,'description','4'),
	(163,48,'_description','field_6455160e66ede'),
	(164,50,'_edit_last','1'),
	(165,50,'_edit_lock','1692689271:1'),
	(166,50,'_wp_page_template','template-contact.php'),
	(167,54,'_edit_lock','1683714930:1'),
	(168,55,'_edit_last','1'),
	(169,55,'_edit_lock','1692689265:1'),
	(170,55,'_wp_page_template','template-mentions-legales.php'),
	(171,60,'_edit_last','1'),
	(172,60,'_edit_lock','1686938891:1'),
	(173,55,'surname','Senga-Vita'),
	(174,55,'_surname','field_645b94d4c7da5'),
	(175,55,'firstname','Blanchar'),
	(176,55,'_firstname','field_645b97aa13cb0'),
	(177,55,'phone_number','+32492520430'),
	(178,55,'_phone_number','field_645b973c77e0b'),
	(179,55,'street','Rue monlinvaux'),
	(180,55,'_street','field_645b977213caf'),
	(181,55,'street_number','73'),
	(182,55,'_street_number','field_645b985d903d0'),
	(183,55,'postal_code','4000'),
	(184,55,'_postal_code','field_645b986904d45'),
	(185,55,'Ville','Liège'),
	(186,55,'_Ville','field_645b9878b28fe'),
	(187,55,'Country','Belgique'),
	(188,55,'_Country','field_645b98a864563'),
	(189,59,'surname','Senga-Vita'),
	(190,59,'_surname','field_645b94d4c7da5'),
	(191,59,'firstname','Blanchar'),
	(192,59,'_firstname','field_645b97aa13cb0'),
	(193,59,'phone_number','+32492520430'),
	(194,59,'_phone_number','field_645b973c77e0b'),
	(195,59,'street','Rue monlinvaux'),
	(196,59,'_street','field_645b977213caf'),
	(197,59,'street_number','73'),
	(198,59,'_street_number','field_645b985d903d0'),
	(199,59,'postal_code','4000'),
	(200,59,'_postal_code','field_645b986904d45'),
	(201,59,'Ville','Liège'),
	(202,59,'_Ville','field_645b9878b28fe'),
	(203,59,'Country','Belgique'),
	(204,59,'_Country','field_645b98a864563'),
	(205,5,'_wp_old_date','2023-04-28'),
	(206,6,'_wp_old_date','2023-04-28'),
	(207,7,'_wp_old_date','2023-04-28'),
	(208,8,'_wp_old_date','2023-04-28'),
	(209,69,'_menu_item_type','post_type'),
	(210,69,'_menu_item_menu_item_parent','0'),
	(211,69,'_menu_item_object_id','55'),
	(212,69,'_menu_item_object','page'),
	(213,69,'_menu_item_target',''),
	(214,69,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(215,69,'_menu_item_xfn',''),
	(216,69,'_menu_item_url',''),
	(221,17,'_wp_page_template','template-accueil.php'),
	(222,17,'qualities_0_name','Énergétique'),
	(223,17,'_qualities_0_name','field_6455193f2107c'),
	(224,17,'qualities_1_name','Optimiste'),
	(225,17,'_qualities_1_name','field_6455193f2107c'),
	(226,17,'qualities_2_name','Imaginatif'),
	(227,17,'_qualities_2_name','field_6455193f2107c'),
	(228,72,'description_title','Je suis'),
	(229,72,'_description_title','field_6454f846332a5'),
	(230,72,'first_quality','Energetique'),
	(231,72,'_first_quality','field_6454fb267ba2b'),
	(232,72,'second_quality','Optimiste'),
	(233,72,'_second_quality','field_6454fb657ba2d'),
	(234,72,'third_quality','Imaginatif'),
	(235,72,'_third_quality','field_6454fb687ba2e'),
	(236,72,'qualities_0_quality','Énergétique'),
	(237,72,'_qualities_0_quality','field_6455193f2107c'),
	(238,72,'qualities_0_image',''),
	(239,72,'_qualities_0_image','field_6455195e2107d'),
	(240,72,'qualities_1_quality','Optimiste'),
	(241,72,'_qualities_1_quality','field_6455193f2107c'),
	(242,72,'qualities_1_image',''),
	(243,72,'_qualities_1_image','field_6455195e2107d'),
	(244,72,'qualities_2_quality','Imaginatif'),
	(245,72,'_qualities_2_quality','field_6455193f2107c'),
	(246,72,'qualities_2_image',''),
	(247,72,'_qualities_2_image','field_6455195e2107d'),
	(248,72,'qualities','3'),
	(249,72,'_qualities','field_645502ddc0ba0'),
	(250,72,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(251,72,'_description_0_paragraphe','field_645517a4a01fe'),
	(252,72,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(253,72,'_description_1_paragraphe','field_645517a4a01fe'),
	(254,72,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(255,72,'_description_2_paragraphe','field_645517a4a01fe'),
	(256,72,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(257,72,'_description_3_paragraphe','field_645517a4a01fe'),
	(258,72,'description','4'),
	(259,72,'_description','field_6455160e66ede'),
	(260,72,'qualities_0_name',''),
	(261,72,'_qualities_0_name','field_6455193f2107c'),
	(262,72,'qualities_1_name',''),
	(263,72,'_qualities_1_name','field_6455193f2107c'),
	(264,72,'qualities_2_name',''),
	(265,72,'_qualities_2_name','field_6455193f2107c'),
	(266,55,'_wp_suggested_privacy_policy_content','a:3:{s:11:\"plugin_name\";s:9:\"WordPress\";s:11:\"policy_text\";s:5288:\"<h2>Qui sommes-nous ?</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>L’adresse de notre site Web est : https://portfolio.localhost.</p><h2>Commentaires</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p><p>Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p><h2>Médias</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.</p><h2>Cookies</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse de messagerie et site web dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p><p>Si vous vous rendez sur la page de connexion, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p><p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez « Se souvenir de moi », votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p><p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p><h2>Contenu embarqué depuis d’autres sites</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p><p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p><h2>Utilisation et transmission de vos données personnelles</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous demandez une réinitialisation de votre mot de passe, votre adresse IP sera incluse dans l’e-mail de réinitialisation.</p><h2>Durées de stockage de vos données</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p><p>Pour les utilisateurs et utilisatrices qui s’enregistrent sur notre site (si cela est possible), nous stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p><h2>Les droits que vous avez sur vos données</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p><h2>Where your data is sent</h2><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p>\";s:5:\"added\";i:1683727786;}'),
	(270,77,'_edit_last','1'),
	(271,77,'_edit_lock','1692697029:1'),
	(272,55,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(273,55,'_Privacy Policy','field_645ba9161a0e2'),
	(274,59,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(275,59,'_Privacy Policy','field_645ba9161a0e2'),
	(276,79,'surname','Senga-Vita'),
	(277,79,'_surname','field_645b94d4c7da5'),
	(278,79,'firstname','Blanchar'),
	(279,79,'_firstname','field_645b97aa13cb0'),
	(280,79,'phone_number','+32492520430'),
	(281,79,'_phone_number','field_645b973c77e0b'),
	(282,79,'street','Rue monlinvaux'),
	(283,79,'_street','field_645b977213caf'),
	(284,79,'street_number','73'),
	(285,79,'_street_number','field_645b985d903d0'),
	(286,79,'postal_code','4000'),
	(287,79,'_postal_code','field_645b986904d45'),
	(288,79,'Ville','Liège'),
	(289,79,'_Ville','field_645b9878b28fe'),
	(290,79,'Country','Belgique'),
	(291,79,'_Country','field_645b98a864563'),
	(292,79,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression. \'éml;arez;malarklz'),
	(293,79,'_Privacy Policy','field_645ba9161a0e2'),
	(294,80,'surname','Senga-Vita'),
	(295,80,'_surname','field_645b94d4c7da5'),
	(296,80,'firstname','Blanchar'),
	(297,80,'_firstname','field_645b97aa13cb0'),
	(298,80,'phone_number','+32492520430'),
	(299,80,'_phone_number','field_645b973c77e0b'),
	(300,80,'street','Rue monlinvaux'),
	(301,80,'_street','field_645b977213caf'),
	(302,80,'street_number','73'),
	(303,80,'_street_number','field_645b985d903d0'),
	(304,80,'postal_code','4000'),
	(305,80,'_postal_code','field_645b986904d45'),
	(306,80,'Ville','Liège'),
	(307,80,'_Ville','field_645b9878b28fe'),
	(308,80,'Country','Belgique'),
	(309,80,'_Country','field_645b98a864563'),
	(310,80,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(311,80,'_Privacy Policy','field_645ba9161a0e2'),
	(312,81,'surname','Senga-Vita'),
	(313,81,'_surname','field_645b94d4c7da5'),
	(314,81,'firstname','Blanchar'),
	(315,81,'_firstname','field_645b97aa13cb0'),
	(316,81,'phone_number','+32492520430'),
	(317,81,'_phone_number','field_645b973c77e0b'),
	(318,81,'street','Rue monlinvaux'),
	(319,81,'_street','field_645b977213caf'),
	(320,81,'street_number','73'),
	(321,81,'_street_number','field_645b985d903d0'),
	(322,81,'postal_code','4000'),
	(323,81,'_postal_code','field_645b986904d45'),
	(324,81,'Ville','Liège'),
	(325,81,'_Ville','field_645b9878b28fe'),
	(326,81,'Country','Belgique'),
	(327,81,'_Country','field_645b98a864563'),
	(328,81,'Privacy Policy',''),
	(329,81,'_Privacy Policy','field_645ba9161a0e2'),
	(330,82,'surname','Senga-Vita'),
	(331,82,'_surname','field_645b94d4c7da5'),
	(332,82,'firstname','Blanchar'),
	(333,82,'_firstname','field_645b97aa13cb0'),
	(334,82,'phone_number','+32492520430'),
	(335,82,'_phone_number','field_645b973c77e0b'),
	(336,82,'street','Rue monlinvaux'),
	(337,82,'_street','field_645b977213caf'),
	(338,82,'street_number','73'),
	(339,82,'_street_number','field_645b985d903d0'),
	(340,82,'postal_code','4000'),
	(341,82,'_postal_code','field_645b986904d45'),
	(342,82,'Ville','Liège'),
	(343,82,'_Ville','field_645b9878b28fe'),
	(344,82,'Country','Belgique'),
	(345,82,'_Country','field_645b98a864563'),
	(346,82,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(347,82,'_Privacy Policy','field_645ba9161a0e2'),
	(348,83,'surname','Senga-Vita'),
	(349,83,'_surname','field_645b94d4c7da5'),
	(350,83,'firstname','Blanchar'),
	(351,83,'_firstname','field_645b97aa13cb0'),
	(352,83,'phone_number','+32492520430'),
	(353,83,'_phone_number','field_645b973c77e0b'),
	(354,83,'street','Rue monlinvaux'),
	(355,83,'_street','field_645b977213caf'),
	(356,83,'street_number','73'),
	(357,83,'_street_number','field_645b985d903d0'),
	(358,83,'postal_code','4000'),
	(359,83,'_postal_code','field_645b986904d45'),
	(360,83,'Ville','Liège'),
	(361,83,'_Ville','field_645b9878b28fe'),
	(362,83,'Country','Belgique'),
	(363,83,'_Country','field_645b98a864563'),
	(364,83,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(365,83,'_Privacy Policy','field_645ba9161a0e2'),
	(366,84,'surname','Senga-Vita'),
	(367,84,'_surname','field_645b94d4c7da5'),
	(368,84,'firstname','Blanchar'),
	(369,84,'_firstname','field_645b97aa13cb0'),
	(370,84,'phone_number','+32492520430'),
	(371,84,'_phone_number','field_645b973c77e0b'),
	(372,84,'street','Rue monlinvaux'),
	(373,84,'_street','field_645b977213caf'),
	(374,84,'street_number','73'),
	(375,84,'_street_number','field_645b985d903d0'),
	(376,84,'postal_code','4000'),
	(377,84,'_postal_code','field_645b986904d45'),
	(378,84,'Ville','Liège'),
	(379,84,'_Ville','field_645b9878b28fe'),
	(380,84,'Country','Belgique'),
	(381,84,'_Country','field_645b98a864563'),
	(382,84,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(383,84,'_Privacy Policy','field_645ba9161a0e2'),
	(384,85,'_edit_last','1'),
	(385,85,'_edit_lock','1692699740:1'),
	(386,87,'_edit_last','1'),
	(387,87,'_edit_lock','1692703305:1'),
	(393,89,'description_title','Je suis'),
	(394,89,'_description_title','field_6454f846332a5'),
	(395,89,'first_quality','Energetique'),
	(396,89,'_first_quality','field_6454fb267ba2b'),
	(397,89,'second_quality','Optimiste'),
	(398,89,'_second_quality','field_6454fb657ba2d'),
	(399,89,'third_quality','Imaginatif'),
	(400,89,'_third_quality','field_6454fb687ba2e'),
	(401,89,'qualities_0_quality','Énergétique'),
	(402,89,'_qualities_0_quality','field_6455193f2107c'),
	(403,89,'qualities_0_image',''),
	(404,89,'_qualities_0_image','field_6455195e2107d'),
	(405,89,'qualities_1_quality','Optimiste'),
	(406,89,'_qualities_1_quality','field_6455193f2107c'),
	(407,89,'qualities_1_image',''),
	(408,89,'_qualities_1_image','field_6455195e2107d'),
	(409,89,'qualities_2_quality','Imaginatif'),
	(410,89,'_qualities_2_quality','field_6455193f2107c'),
	(411,89,'qualities_2_image',''),
	(412,89,'_qualities_2_image','field_6455195e2107d'),
	(413,89,'qualities','3'),
	(414,89,'_qualities','field_645502ddc0ba0'),
	(415,89,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(416,89,'_description_0_paragraphe','field_645517a4a01fe'),
	(417,89,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(418,89,'_description_1_paragraphe','field_645517a4a01fe'),
	(419,89,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(420,89,'_description_2_paragraphe','field_645517a4a01fe'),
	(421,89,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(422,89,'_description_3_paragraphe','field_645517a4a01fe'),
	(423,89,'description','4'),
	(424,89,'_description','field_6455160e66ede'),
	(425,89,'qualities_0_name','Energetique'),
	(426,89,'_qualities_0_name','field_6455193f2107c'),
	(427,89,'qualities_1_name','Optimiste'),
	(428,89,'_qualities_1_name','field_6455193f2107c'),
	(429,89,'qualities_2_name','Imaginatif'),
	(430,89,'_qualities_2_name','field_6455193f2107c'),
	(431,93,'_edit_last','1'),
	(432,93,'_edit_lock','1692697651:1'),
	(433,17,'legends_picture_0_text','C\'est moi'),
	(434,17,'_legends_picture_0_text','field_647fa417cccb9'),
	(435,17,'legends_picture','1'),
	(436,17,'_legends_picture','field_647fa404cccb8'),
	(437,96,'description_title','Je suis'),
	(438,96,'_description_title','field_6454f846332a5'),
	(439,96,'first_quality','Energetique'),
	(440,96,'_first_quality','field_6454fb267ba2b'),
	(441,96,'second_quality','Optimiste'),
	(442,96,'_second_quality','field_6454fb657ba2d'),
	(443,96,'third_quality','Imaginatif'),
	(444,96,'_third_quality','field_6454fb687ba2e'),
	(445,96,'qualities_0_quality','Énergétique'),
	(446,96,'_qualities_0_quality','field_6455193f2107c'),
	(447,96,'qualities_0_image',''),
	(448,96,'_qualities_0_image','field_6455195e2107d'),
	(449,96,'qualities_1_quality','Optimiste'),
	(450,96,'_qualities_1_quality','field_6455193f2107c'),
	(451,96,'qualities_1_image',''),
	(452,96,'_qualities_1_image','field_6455195e2107d'),
	(453,96,'qualities_2_quality','Imaginatif'),
	(454,96,'_qualities_2_quality','field_6455193f2107c'),
	(455,96,'qualities_2_image',''),
	(456,96,'_qualities_2_image','field_6455195e2107d'),
	(457,96,'qualities','3'),
	(458,96,'_qualities','field_645502ddc0ba0'),
	(459,96,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(460,96,'_description_0_paragraphe','field_645517a4a01fe'),
	(461,96,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(462,96,'_description_1_paragraphe','field_645517a4a01fe'),
	(463,96,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(464,96,'_description_2_paragraphe','field_645517a4a01fe'),
	(465,96,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(466,96,'_description_3_paragraphe','field_645517a4a01fe'),
	(467,96,'description','4'),
	(468,96,'_description','field_6455160e66ede'),
	(469,96,'qualities_0_name','Energetique'),
	(470,96,'_qualities_0_name','field_6455193f2107c'),
	(471,96,'qualities_1_name','Optimiste'),
	(472,96,'_qualities_1_name','field_6455193f2107c'),
	(473,96,'qualities_2_name','Imaginatif'),
	(474,96,'_qualities_2_name','field_6455193f2107c'),
	(475,96,'legends_picture_0_text','C\'est moi'),
	(476,96,'_legends_picture_0_text','field_647fa417cccb9'),
	(477,96,'legends_picture','1'),
	(478,96,'_legends_picture','field_647fa404cccb8'),
	(479,17,'call_to_action_text','Dites-moi bonjour'),
	(480,17,'_call_to_action_text','field_648066b978e92'),
	(481,96,'call_to_action_text','Dites moi bonjour'),
	(482,96,'_call_to_action_text','field_648066b978e92'),
	(483,98,'description_title','Je suis'),
	(484,98,'_description_title','field_6454f846332a5'),
	(485,98,'first_quality','Energetique'),
	(486,98,'_first_quality','field_6454fb267ba2b'),
	(487,98,'second_quality','Optimiste'),
	(488,98,'_second_quality','field_6454fb657ba2d'),
	(489,98,'third_quality','Imaginatif'),
	(490,98,'_third_quality','field_6454fb687ba2e'),
	(491,98,'qualities_0_quality','Énergétique'),
	(492,98,'_qualities_0_quality','field_6455193f2107c'),
	(493,98,'qualities_0_image',''),
	(494,98,'_qualities_0_image','field_6455195e2107d'),
	(495,98,'qualities_1_quality','Optimiste'),
	(496,98,'_qualities_1_quality','field_6455193f2107c'),
	(497,98,'qualities_1_image',''),
	(498,98,'_qualities_1_image','field_6455195e2107d'),
	(499,98,'qualities_2_quality','Imaginatif'),
	(500,98,'_qualities_2_quality','field_6455193f2107c'),
	(501,98,'qualities_2_image',''),
	(502,98,'_qualities_2_image','field_6455195e2107d'),
	(503,98,'qualities','3'),
	(504,98,'_qualities','field_645502ddc0ba0'),
	(505,98,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(506,98,'_description_0_paragraphe','field_645517a4a01fe'),
	(507,98,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(508,98,'_description_1_paragraphe','field_645517a4a01fe'),
	(509,98,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(510,98,'_description_2_paragraphe','field_645517a4a01fe'),
	(511,98,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(512,98,'_description_3_paragraphe','field_645517a4a01fe'),
	(513,98,'description','4'),
	(514,98,'_description','field_6455160e66ede'),
	(515,98,'qualities_0_name','Energetique'),
	(516,98,'_qualities_0_name','field_6455193f2107c'),
	(517,98,'qualities_1_name','Optimiste'),
	(518,98,'_qualities_1_name','field_6455193f2107c'),
	(519,98,'qualities_2_name','Imaginatif'),
	(520,98,'_qualities_2_name','field_6455193f2107c'),
	(521,98,'legends_picture_0_text','C\'est moi'),
	(522,98,'_legends_picture_0_text','field_647fa417cccb9'),
	(523,98,'legends_picture','1'),
	(524,98,'_legends_picture','field_647fa404cccb8'),
	(525,98,'call_to_action_text','Dites-moi bonjour'),
	(526,98,'_call_to_action_text','field_648066b978e92'),
	(527,17,'call_to_action','Dites-moi <span class=\"bonjour\">bonjour</span>'),
	(528,17,'_call_to_action','field_648066b978e92'),
	(529,99,'description_title','Je suis'),
	(530,99,'_description_title','field_6454f846332a5'),
	(531,99,'first_quality','Energetique'),
	(532,99,'_first_quality','field_6454fb267ba2b'),
	(533,99,'second_quality','Optimiste'),
	(534,99,'_second_quality','field_6454fb657ba2d'),
	(535,99,'third_quality','Imaginatif'),
	(536,99,'_third_quality','field_6454fb687ba2e'),
	(537,99,'qualities_0_quality','Énergétique'),
	(538,99,'_qualities_0_quality','field_6455193f2107c'),
	(539,99,'qualities_0_image',''),
	(540,99,'_qualities_0_image','field_6455195e2107d'),
	(541,99,'qualities_1_quality','Optimiste'),
	(542,99,'_qualities_1_quality','field_6455193f2107c'),
	(543,99,'qualities_1_image',''),
	(544,99,'_qualities_1_image','field_6455195e2107d'),
	(545,99,'qualities_2_quality','Imaginatif'),
	(546,99,'_qualities_2_quality','field_6455193f2107c'),
	(547,99,'qualities_2_image',''),
	(548,99,'_qualities_2_image','field_6455195e2107d'),
	(549,99,'qualities','3'),
	(550,99,'_qualities','field_645502ddc0ba0'),
	(551,99,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(552,99,'_description_0_paragraphe','field_645517a4a01fe'),
	(553,99,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(554,99,'_description_1_paragraphe','field_645517a4a01fe'),
	(555,99,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(556,99,'_description_2_paragraphe','field_645517a4a01fe'),
	(557,99,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(558,99,'_description_3_paragraphe','field_645517a4a01fe'),
	(559,99,'description','4'),
	(560,99,'_description','field_6455160e66ede'),
	(561,99,'qualities_0_name','Energetique'),
	(562,99,'_qualities_0_name','field_6455193f2107c'),
	(563,99,'qualities_1_name','Optimiste'),
	(564,99,'_qualities_1_name','field_6455193f2107c'),
	(565,99,'qualities_2_name','Imaginatif'),
	(566,99,'_qualities_2_name','field_6455193f2107c'),
	(567,99,'legends_picture_0_text','C\'est moi'),
	(568,99,'_legends_picture_0_text','field_647fa417cccb9'),
	(569,99,'legends_picture','1'),
	(570,99,'_legends_picture','field_647fa404cccb8'),
	(571,99,'call_to_action_text','Dites-moi bonjour'),
	(572,99,'_call_to_action_text','field_648066b978e92'),
	(573,99,'call_to_action','Dites-moi bonjour'),
	(574,99,'_call_to_action','field_648066b978e92'),
	(575,17,'description_title_copier','Dites moi bonjour'),
	(576,17,'_description_title_copier','field_648069932e85e'),
	(577,99,'description_title_copier','Dites moi bonjour'),
	(578,99,'_description_title_copier','field_648069932e85e'),
	(579,101,'description_title','Je suis un'),
	(580,101,'_description_title','field_6454f846332a5'),
	(581,101,'first_quality','Energetique'),
	(582,101,'_first_quality','field_6454fb267ba2b'),
	(583,101,'second_quality','Optimiste'),
	(584,101,'_second_quality','field_6454fb657ba2d'),
	(585,101,'third_quality','Imaginatif'),
	(586,101,'_third_quality','field_6454fb687ba2e'),
	(587,101,'qualities_0_quality','Énergétique'),
	(588,101,'_qualities_0_quality','field_6455193f2107c'),
	(589,101,'qualities_0_image',''),
	(590,101,'_qualities_0_image','field_6455195e2107d'),
	(591,101,'qualities_1_quality','Optimiste'),
	(592,101,'_qualities_1_quality','field_6455193f2107c'),
	(593,101,'qualities_1_image',''),
	(594,101,'_qualities_1_image','field_6455195e2107d'),
	(595,101,'qualities_2_quality','Imaginatif'),
	(596,101,'_qualities_2_quality','field_6455193f2107c'),
	(597,101,'qualities_2_image',''),
	(598,101,'_qualities_2_image','field_6455195e2107d'),
	(599,101,'qualities','3'),
	(600,101,'_qualities','field_645502ddc0ba0'),
	(601,101,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(602,101,'_description_0_paragraphe','field_645517a4a01fe'),
	(603,101,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(604,101,'_description_1_paragraphe','field_645517a4a01fe'),
	(605,101,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(606,101,'_description_2_paragraphe','field_645517a4a01fe'),
	(607,101,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(608,101,'_description_3_paragraphe','field_645517a4a01fe'),
	(609,101,'description','4'),
	(610,101,'_description','field_6455160e66ede'),
	(611,101,'qualities_0_name','Energetique'),
	(612,101,'_qualities_0_name','field_6455193f2107c'),
	(613,101,'qualities_1_name','Optimiste'),
	(614,101,'_qualities_1_name','field_6455193f2107c'),
	(615,101,'qualities_2_name','Imaginatif'),
	(616,101,'_qualities_2_name','field_6455193f2107c'),
	(617,101,'legends_picture_0_text','C\'est moi'),
	(618,101,'_legends_picture_0_text','field_647fa417cccb9'),
	(619,101,'legends_picture','1'),
	(620,101,'_legends_picture','field_647fa404cccb8'),
	(621,101,'call_to_action_text','Dites-moi bonjour'),
	(622,101,'_call_to_action_text','field_648066b978e92'),
	(623,101,'call_to_action','Dites-moi bonjour'),
	(624,101,'_call_to_action','field_648066b978e92'),
	(625,101,'description_title_copier','Dites moi bonjour'),
	(626,101,'_description_title_copier','field_648069932e85e'),
	(627,102,'description_title','Je suis'),
	(628,102,'_description_title','field_6454f846332a5'),
	(629,102,'first_quality','Energetique'),
	(630,102,'_first_quality','field_6454fb267ba2b'),
	(631,102,'second_quality','Optimiste'),
	(632,102,'_second_quality','field_6454fb657ba2d'),
	(633,102,'third_quality','Imaginatif'),
	(634,102,'_third_quality','field_6454fb687ba2e'),
	(635,102,'qualities_0_quality','Énergétique'),
	(636,102,'_qualities_0_quality','field_6455193f2107c'),
	(637,102,'qualities_0_image',''),
	(638,102,'_qualities_0_image','field_6455195e2107d'),
	(639,102,'qualities_1_quality','Optimiste'),
	(640,102,'_qualities_1_quality','field_6455193f2107c'),
	(641,102,'qualities_1_image',''),
	(642,102,'_qualities_1_image','field_6455195e2107d'),
	(643,102,'qualities_2_quality','Imaginatif'),
	(644,102,'_qualities_2_quality','field_6455193f2107c'),
	(645,102,'qualities_2_image',''),
	(646,102,'_qualities_2_image','field_6455195e2107d'),
	(647,102,'qualities','3'),
	(648,102,'_qualities','field_645502ddc0ba0'),
	(649,102,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(650,102,'_description_0_paragraphe','field_645517a4a01fe'),
	(651,102,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(652,102,'_description_1_paragraphe','field_645517a4a01fe'),
	(653,102,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(654,102,'_description_2_paragraphe','field_645517a4a01fe'),
	(655,102,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(656,102,'_description_3_paragraphe','field_645517a4a01fe'),
	(657,102,'description','4'),
	(658,102,'_description','field_6455160e66ede'),
	(659,102,'qualities_0_name','Energetique'),
	(660,102,'_qualities_0_name','field_6455193f2107c'),
	(661,102,'qualities_1_name','Optimiste'),
	(662,102,'_qualities_1_name','field_6455193f2107c'),
	(663,102,'qualities_2_name','Imaginatif'),
	(664,102,'_qualities_2_name','field_6455193f2107c'),
	(665,102,'legends_picture_0_text','C\'est moi'),
	(666,102,'_legends_picture_0_text','field_647fa417cccb9'),
	(667,102,'legends_picture','1'),
	(668,102,'_legends_picture','field_647fa404cccb8'),
	(669,102,'call_to_action_text','Dites-moi bonjour'),
	(670,102,'_call_to_action_text','field_648066b978e92'),
	(671,102,'call_to_action','Dites-moi bonjour'),
	(672,102,'_call_to_action','field_648066b978e92'),
	(673,102,'description_title_copier','Dites moi bonjour'),
	(674,102,'_description_title_copier','field_648069932e85e'),
	(675,85,'project_title','Puissance 4'),
	(676,85,'_project_title','field_647fa78040a14'),
	(677,85,'project_description','Dans le cadre de ce projet, qui consitait à refaire un jeu simple mais célèbre, j\'ai voulu reproduire l\'emblématique jeu Puissance 4. C\'est un jeu de stratégie combinatoire abstrait qui se joue à 2 joueurs. Il a été commercialisé pour la première fois en 1974 par la Milton Bradley Company et est détenu depuis 1984 par la société Hasbro.'),
	(678,85,'_project_description','field_647fa7b340a15'),
	(679,85,'project_link','https://github.com/blancharSengaVita/Puissance-4'),
	(680,85,'_project_link','field_6480bd9b9b2cc'),
	(681,87,'project_title','SparklesNotes'),
	(682,87,'_project_title','field_647fa78040a14'),
	(683,87,'project_description','Une application qui ne laissera pas vos idées vous échapper, elle vous permettra de prendre des notes rapidement. Elle a été développée avec le framework Flutter pour le front-end et Firebase pour le back-end dans le cadre du cours de developpement d\'application mobile.\r\n\r\n'),
	(684,87,'_project_description','field_647fa7b340a15'),
	(685,87,'project_link',''),
	(686,87,'_project_link','field_6480bd9b9b2cc'),
	(687,104,'_edit_last','1'),
	(688,104,'project_title','CV'),
	(689,104,'_project_title','field_647fa78040a14'),
	(690,104,'project_description','Ce site est un projet pédagogique visant à reprendre le design du site et à refaire le HTML, le CSS et le JavaScript en l\'adaptant afin de pouvoir l\'utiliser comme un CV.\r\nJ\'ai choisi le site de <a target=\"_blank href=\"https://conceptstudio.com/\" title=\"aller vers le site de Concept Studio\">Concept Studio</a>.\r\n\r\n'),
	(691,104,'_project_description','field_647fa7b340a15'),
	(692,104,'project_link','https://blancharcv.netlify.app/'),
	(693,104,'_project_link','field_6480bd9b9b2cc'),
	(694,104,'_edit_lock','1692699731:1'),
	(695,55,'privacy_policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(696,55,'_privacy_policy','field_645ba9161a0e2'),
	(697,55,'email','anchar2107@gmail.com'),
	(698,55,'_email','field_6480d9d9c1f65'),
	(699,84,'privacy_policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(700,84,'_privacy_policy','field_645ba9161a0e2'),
	(701,84,'email','anchar2107@gmail.com'),
	(702,84,'_email','field_6480d9d9c1f65'),
	(727,118,'_wp_attached_file','2023/06/1-bg-remove.png'),
	(728,118,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:23:\"2023/06/1-bg-remove.png\";s:8:\"filesize\";i:203652;s:5:\"sizes\";a:10:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:79928;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23741;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:104581;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39132;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:79928;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23741;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"1-bg-remove-80x80.png\";s:5:\"width\";i:80;s:6:\"height\";i:80;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8165;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"1-bg-remove-60x60.png\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5048;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39132;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"1-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:104581;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(729,119,'_wp_attached_file','2023/06/2-bg-remove.png'),
	(730,119,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:23:\"2023/06/2-bg-remove.png\";s:8:\"filesize\";i:220041;s:5:\"sizes\";a:10:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87790;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:26321;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:114508;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:43136;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87790;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:26321;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"2-bg-remove-80x80.png\";s:5:\"width\";i:80;s:6:\"height\";i:80;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9114;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"2-bg-remove-60x60.png\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5617;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:43136;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"2-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:114508;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(731,120,'_wp_attached_file','2023/06/3-bg-remove.png'),
	(732,120,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:23:\"2023/06/3-bg-remove.png\";s:8:\"filesize\";i:251818;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"3-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:72860;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"3-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20735;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"3-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:93799;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(733,121,'_wp_attached_file','2023/06/4-bg-remove.png'),
	(734,121,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:23:\"2023/06/4-bg-remove.png\";s:8:\"filesize\";i:270228;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"4-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:76820;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"4-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21915;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"4-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:98765;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(735,122,'_wp_attached_file','2023/06/5-bg-remove.png'),
	(736,122,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:23:\"2023/06/5-bg-remove.png\";s:8:\"filesize\";i:259769;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"5-bg-remove-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:76616;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"5-bg-remove-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22207;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"5-bg-remove-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:98609;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(741,125,'_wp_attached_file','2023/06/image-9.png'),
	(742,125,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:4608;s:6:\"height\";i:5468;s:4:\"file\";s:19:\"2023/06/image-9.png\";s:8:\"filesize\";i:1977917;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"image-9-253x300.png\";s:5:\"width\";i:253;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:54628;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"image-9-863x1024.png\";s:5:\"width\";i:863;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:404459;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"image-9-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20712;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"image-9-768x911.png\";s:5:\"width\";i:768;s:6:\"height\";i:911;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:341435;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:21:\"image-9-1294x1536.png\";s:5:\"width\";i:1294;s:6:\"height\";i:1536;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:746776;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:21:\"image-9-1726x2048.png\";s:5:\"width\";i:1726;s:6:\"height\";i:2048;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1130952;}s:4:\"h500\";a:5:{s:4:\"file\";s:19:\"image-9-421x500.png\";s:5:\"width\";i:421;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:125975;}s:4:\"h350\";a:5:{s:4:\"file\";s:19:\"image-9-295x350.png\";s:5:\"width\";i:295;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:70259;}s:4:\"w900\";a:5:{s:4:\"file\";s:20:\"image-9-900x1068.png\";s:5:\"width\";i:900;s:6:\"height\";i:1068;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:431489;}s:4:\"w800\";a:5:{s:4:\"file\";s:19:\"image-9-800x949.png\";s:5:\"width\";i:800;s:6:\"height\";i:949;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:357405;}s:4:\"w500\";a:5:{s:4:\"file\";s:19:\"image-9-500x593.png\";s:5:\"width\";i:500;s:6:\"height\";i:593;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:166793;}s:4:\"w600\";a:5:{s:4:\"file\";s:19:\"image-9-600x712.png\";s:5:\"width\";i:600;s:6:\"height\";i:712;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:223627;}s:4:\"w200\";a:5:{s:4:\"file\";s:19:\"image-9-200x237.png\";s:5:\"width\";i:200;s:6:\"height\";i:237;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:36958;}s:4:\"w300\";a:5:{s:4:\"file\";s:19:\"image-9-300x356.png\";s:5:\"width\";i:300;s:6:\"height\";i:356;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:72222;}s:4:\"w150\";a:5:{s:4:\"file\";s:19:\"image-9-150x178.png\";s:5:\"width\";i:150;s:6:\"height\";i:178;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22986;}s:3:\"w80\";a:5:{s:4:\"file\";s:17:\"image-9-80x95.png\";s:5:\"width\";i:80;s:6:\"height\";i:95;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8504;}s:3:\"w60\";a:5:{s:4:\"file\";s:17:\"image-9-60x71.png\";s:5:\"width\";i:60;s:6:\"height\";i:71;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5424;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:19:\"image-9-169x200.png\";s:5:\"width\";i:169;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:27801;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:19:\"image-9-295x350.png\";s:5:\"width\";i:295;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:70259;}s:29:\"project_thumbnail_old_350x415\";a:5:{s:4:\"file\";s:19:\"image-9-350x415.png\";s:5:\"width\";i:350;s:6:\"height\";i:415;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:92840;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(745,127,'_wp_attached_file','2023/06/note.png'),
	(746,127,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:750;s:6:\"height\";i:900;s:4:\"file\";s:16:\"2023/06/note.png\";s:8:\"filesize\";i:235519;s:5:\"sizes\";a:14:{s:6:\"medium\";a:5:{s:4:\"file\";s:16:\"note-250x300.png\";s:5:\"width\";i:250;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:47867;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:16:\"note-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15895;}s:4:\"h500\";a:5:{s:4:\"file\";s:16:\"note-417x500.png\";s:5:\"width\";i:417;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:108090;}s:4:\"h350\";a:5:{s:4:\"file\";s:16:\"note-292x350.png\";s:5:\"width\";i:292;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:62127;}s:4:\"w500\";a:5:{s:4:\"file\";s:16:\"note-500x600.png\";s:5:\"width\";i:500;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:142674;}s:4:\"w600\";a:5:{s:4:\"file\";s:16:\"note-600x720.png\";s:5:\"width\";i:600;s:6:\"height\";i:720;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:189373;}s:4:\"w200\";a:5:{s:4:\"file\";s:16:\"note-200x240.png\";s:5:\"width\";i:200;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:34350;}s:4:\"w300\";a:5:{s:4:\"file\";s:16:\"note-300x360.png\";s:5:\"width\";i:300;s:6:\"height\";i:360;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:64011;}s:4:\"w150\";a:5:{s:4:\"file\";s:16:\"note-150x180.png\";s:5:\"width\";i:150;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21415;}s:3:\"w80\";a:5:{s:4:\"file\";s:14:\"note-80x96.png\";s:5:\"width\";i:80;s:6:\"height\";i:96;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7970;}s:3:\"w60\";a:5:{s:4:\"file\";s:14:\"note-60x72.png\";s:5:\"width\";i:60;s:6:\"height\";i:72;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5076;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:16:\"note-167x200.png\";s:5:\"width\";i:167;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:25335;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:16:\"note-292x350.png\";s:5:\"width\";i:292;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:62127;}s:29:\"project_thumbnail_old_350x420\";a:5:{s:4:\"file\";s:16:\"note-350x420.png\";s:5:\"width\";i:350;s:6:\"height\";i:420;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:81969;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(747,128,'_wp_attached_file','2023/06/puissance-4.png'),
	(748,128,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:900;s:4:\"file\";s:23:\"2023/06/puissance-4.png\";s:8:\"filesize\";i:733730;s:5:\"sizes\";a:15:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"puissance-4-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:121014;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:36686;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"puissance-4-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:606337;}s:4:\"h500\";a:5:{s:4:\"file\";s:23:\"puissance-4-500x500.png\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:293713;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"puissance-4-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:159205;}s:4:\"w800\";a:5:{s:4:\"file\";s:23:\"puissance-4-800x800.png\";s:5:\"width\";i:800;s:6:\"height\";i:800;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:647599;}s:4:\"w500\";a:5:{s:4:\"file\";s:23:\"puissance-4-500x500.png\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:293713;}s:4:\"w600\";a:5:{s:4:\"file\";s:23:\"puissance-4-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:399951;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"puissance-4-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:60357;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"puissance-4-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:121014;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"puissance-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:36686;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"puissance-4-80x80.png\";s:5:\"width\";i:80;s:6:\"height\";i:80;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12752;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"puissance-4-60x60.png\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7839;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"puissance-4-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:60357;}s:17:\"project_thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance-4-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:159205;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(751,125,'_wp_attachment_image_alt','une pile de CV'),
	(752,104,'_thumbnail_id','125'),
	(753,87,'_thumbnail_id','127'),
	(754,85,'_thumbnail_id','128'),
	(755,5,'_wp_old_date','2023-05-10'),
	(756,6,'_wp_old_date','2023-05-10'),
	(757,7,'_wp_old_date','2023-05-10'),
	(758,8,'_wp_old_date','2023-05-10'),
	(760,5,'_wp_old_date','2023-06-11'),
	(761,6,'_wp_old_date','2023-06-11'),
	(762,7,'_wp_old_date','2023-06-11'),
	(763,8,'_wp_old_date','2023-06-11'),
	(764,17,'project_section_title','Mes projets'),
	(765,17,'_project_section_title','field_6489899550733'),
	(766,102,'project_section_title','Mes projets'),
	(767,102,'_project_section_title','field_6489899550733'),
	(768,131,'description_title','Je suis'),
	(769,131,'_description_title','field_6454f846332a5'),
	(770,131,'first_quality','Energetique'),
	(771,131,'_first_quality','field_6454fb267ba2b'),
	(772,131,'second_quality','Optimiste'),
	(773,131,'_second_quality','field_6454fb657ba2d'),
	(774,131,'third_quality','Imaginatif'),
	(775,131,'_third_quality','field_6454fb687ba2e'),
	(776,131,'qualities_0_quality','Énergétique'),
	(777,131,'_qualities_0_quality','field_6455193f2107c'),
	(778,131,'qualities_0_image',''),
	(779,131,'_qualities_0_image','field_6455195e2107d'),
	(780,131,'qualities_1_quality','Optimiste'),
	(781,131,'_qualities_1_quality','field_6455193f2107c'),
	(782,131,'qualities_1_image',''),
	(783,131,'_qualities_1_image','field_6455195e2107d'),
	(784,131,'qualities_2_quality','Imaginatif'),
	(785,131,'_qualities_2_quality','field_6455193f2107c'),
	(786,131,'qualities_2_image',''),
	(787,131,'_qualities_2_image','field_6455195e2107d'),
	(788,131,'qualities','3'),
	(789,131,'_qualities','field_645502ddc0ba0'),
	(790,131,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(791,131,'_description_0_paragraphe','field_645517a4a01fe'),
	(792,131,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(793,131,'_description_1_paragraphe','field_645517a4a01fe'),
	(794,131,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(795,131,'_description_2_paragraphe','field_645517a4a01fe'),
	(796,131,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(797,131,'_description_3_paragraphe','field_645517a4a01fe'),
	(798,131,'description','4'),
	(799,131,'_description','field_6455160e66ede'),
	(800,131,'qualities_0_name','Energetique'),
	(801,131,'_qualities_0_name','field_6455193f2107c'),
	(802,131,'qualities_1_name','Optimiste'),
	(803,131,'_qualities_1_name','field_6455193f2107c'),
	(804,131,'qualities_2_name','Imaginatif'),
	(805,131,'_qualities_2_name','field_6455193f2107c'),
	(806,131,'legends_picture_0_text','C\'est moi'),
	(807,131,'_legends_picture_0_text','field_647fa417cccb9'),
	(808,131,'legends_picture','1'),
	(809,131,'_legends_picture','field_647fa404cccb8'),
	(810,131,'call_to_action_text','Dites-moi bonjour'),
	(811,131,'_call_to_action_text','field_648066b978e92'),
	(812,131,'call_to_action','Dites-moi bonjour '),
	(813,131,'_call_to_action','field_648066b978e92'),
	(814,131,'description_title_copier','Dites moi bonjour'),
	(815,131,'_description_title_copier','field_648069932e85e'),
	(816,131,'project_section_title','Mes projets'),
	(817,131,'_project_section_title','field_6489899550733'),
	(818,132,'description_title','Je suis'),
	(819,132,'_description_title','field_6454f846332a5'),
	(820,132,'first_quality','Energetique'),
	(821,132,'_first_quality','field_6454fb267ba2b'),
	(822,132,'second_quality','Optimiste'),
	(823,132,'_second_quality','field_6454fb657ba2d'),
	(824,132,'third_quality','Imaginatif'),
	(825,132,'_third_quality','field_6454fb687ba2e'),
	(826,132,'qualities_0_quality','Énergétique'),
	(827,132,'_qualities_0_quality','field_6455193f2107c'),
	(828,132,'qualities_0_image',''),
	(829,132,'_qualities_0_image','field_6455195e2107d'),
	(830,132,'qualities_1_quality','Optimiste'),
	(831,132,'_qualities_1_quality','field_6455193f2107c'),
	(832,132,'qualities_1_image',''),
	(833,132,'_qualities_1_image','field_6455195e2107d'),
	(834,132,'qualities_2_quality','Imaginatif'),
	(835,132,'_qualities_2_quality','field_6455193f2107c'),
	(836,132,'qualities_2_image',''),
	(837,132,'_qualities_2_image','field_6455195e2107d'),
	(838,132,'qualities','3'),
	(839,132,'_qualities','field_645502ddc0ba0'),
	(840,132,'description_0_paragraphe','Je suis un étudiant, habitant à Liège en Belgique, qui développe ses compétences afin de devenir un grand web developper full stack.'),
	(841,132,'_description_0_paragraphe','field_645517a4a01fe'),
	(842,132,'description_1_paragraphe','J’étudie actuellement à l’HEPL infographie ou j’apprends à concevoir des sites web en HTML, CSS, Javascript, Typescript et PHP.'),
	(843,132,'_description_1_paragraphe','field_645517a4a01fe'),
	(844,132,'description_2_paragraphe','Je suis attirés par des projets qui me demanderont de me surpasser et pouvoir faire preuve de créativité dans mon code. '),
	(845,132,'_description_2_paragraphe','field_645517a4a01fe'),
	(846,132,'description_3_paragraphe','Je me donnerai à fond pour mener à bien mes projets.'),
	(847,132,'_description_3_paragraphe','field_645517a4a01fe'),
	(848,132,'description','4'),
	(849,132,'_description','field_6455160e66ede'),
	(850,132,'qualities_0_name','Energetique'),
	(851,132,'_qualities_0_name','field_6455193f2107c'),
	(852,132,'qualities_1_name','Optimiste'),
	(853,132,'_qualities_1_name','field_6455193f2107c'),
	(854,132,'qualities_2_name','Imaginatif'),
	(855,132,'_qualities_2_name','field_6455193f2107c'),
	(856,132,'legends_picture_0_text','C\'est moi'),
	(857,132,'_legends_picture_0_text','field_647fa417cccb9'),
	(858,132,'legends_picture','1'),
	(859,132,'_legends_picture','field_647fa404cccb8'),
	(860,132,'call_to_action_text','Dites-moi bonjour'),
	(861,132,'_call_to_action_text','field_648066b978e92'),
	(862,132,'call_to_action','Dites-moi <span class=\"bonjour\"> bonjour </span>'),
	(863,132,'_call_to_action','field_648066b978e92'),
	(864,132,'description_title_copier','Dites moi bonjour'),
	(865,132,'_description_title_copier','field_648069932e85e'),
	(866,132,'project_section_title','Mes projets'),
	(867,132,'_project_section_title','field_6489899550733'),
	(868,133,'_wp_attached_file','2023/06/Capture-decran-2023-06-15-a-10.43.06.png'),
	(869,133,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1566;s:4:\"file\";s:48:\"2023/06/Capture-decran-2023-06-15-a-10.43.06.png\";s:8:\"filesize\";i:324870;s:5:\"sizes\";a:19:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-300x163.png\";s:5:\"width\";i:300;s:6:\"height\";i:163;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20391;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.06-1024x557.png\";s:5:\"width\";i:1024;s:6:\"height\";i:557;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:106060;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9190;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-768x418.png\";s:5:\"width\";i:768;s:6:\"height\";i:418;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:71025;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.06-1536x835.png\";s:5:\"width\";i:1536;s:6:\"height\";i:835;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:181365;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-06-15-a-10.43.06-2048x1114.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1114;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:272213;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-920x500.png\";s:5:\"width\";i:920;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:91576;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-644x350.png\";s:5:\"width\";i:644;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:55936;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-900x489.png\";s:5:\"width\";i:900;s:6:\"height\";i:489;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87378;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-800x435.png\";s:5:\"width\";i:800;s:6:\"height\";i:435;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:71946;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-500x272.png\";s:5:\"width\";i:500;s:6:\"height\";i:272;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39065;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-600x326.png\";s:5:\"width\";i:600;s:6:\"height\";i:326;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:50538;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11658;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-300x163.png\";s:5:\"width\";i:300;s:6:\"height\";i:163;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20391;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-06-15-a-10.43.06-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7984;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.06-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3402;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.06-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2332;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11658;}s:3:\"w50\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.06-500x272.png\";s:5:\"width\";i:500;s:6:\"height\";i:272;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39065;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(870,134,'_wp_attached_file','2023/06/Capture-decran-2023-06-15-a-10.43.19.png'),
	(871,134,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1576;s:4:\"file\";s:48:\"2023/06/Capture-decran-2023-06-15-a-10.43.19.png\";s:8:\"filesize\";i:1345549;s:5:\"sizes\";a:19:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23877;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.19-1024x560.png\";s:5:\"width\";i:1024;s:6:\"height\";i:560;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:141606;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11549;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-768x420.png\";s:5:\"width\";i:768;s:6:\"height\";i:420;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:92005;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.19-1536x841.png\";s:5:\"width\";i:1536;s:6:\"height\";i:841;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:275799;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-06-15-a-10.43.19-2048x1121.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1121;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:606472;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-914x500.png\";s:5:\"width\";i:914;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:120697;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-640x350.png\";s:5:\"width\";i:640;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:69479;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-900x493.png\";s:5:\"width\";i:900;s:6:\"height\";i:493;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:114918;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-800x438.png\";s:5:\"width\";i:800;s:6:\"height\";i:438;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:98622;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:50134;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-600x328.png\";s:5:\"width\";i:600;s:6:\"height\";i:328;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:66357;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13159;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23877;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-06-15-a-10.43.19-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8613;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.19-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3462;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.19-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2161;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13159;}s:3:\"w50\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.19-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:50134;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(872,135,'_wp_attached_file','2023/06/Capture-decran-2023-06-15-a-10.43.29.png'),
	(873,135,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1574;s:4:\"file\";s:48:\"2023/06/Capture-decran-2023-06-15-a-10.43.29.png\";s:8:\"filesize\";i:2557441;s:5:\"sizes\";a:19:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:43878;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.29-1024x560.png\";s:5:\"width\";i:1024;s:6:\"height\";i:560;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:369789;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31309;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-768x420.png\";s:5:\"width\";i:768;s:6:\"height\";i:420;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:225437;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.29-1536x839.png\";s:5:\"width\";i:1536;s:6:\"height\";i:839;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:727773;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-06-15-a-10.43.29-2048x1119.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1119;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1155178;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-915x500.png\";s:5:\"width\";i:915;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:304520;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-640x350.png\";s:5:\"width\";i:640;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:164040;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-900x492.png\";s:5:\"width\";i:900;s:6:\"height\";i:492;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:296307;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-800x437.png\";s:5:\"width\";i:800;s:6:\"height\";i:437;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:242106;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-500x273.png\";s:5:\"width\";i:500;s:6:\"height\";i:273;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:106868;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-600x328.png\";s:5:\"width\";i:600;s:6:\"height\";i:328;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:146721;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21943;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:43878;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-06-15-a-10.43.29-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13495;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.29-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4648;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.29-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2794;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21943;}s:3:\"w50\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.29-500x273.png\";s:5:\"width\";i:500;s:6:\"height\";i:273;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:106868;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(874,136,'_wp_attached_file','2023/06/Capture-decran-2023-06-15-a-10.43.45.png'),
	(875,136,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2878;s:6:\"height\";i:1576;s:4:\"file\";s:48:\"2023/06/Capture-decran-2023-06-15-a-10.43.45.png\";s:8:\"filesize\";i:1087540;s:5:\"sizes\";a:19:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20250;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.45-1024x561.png\";s:5:\"width\";i:1024;s:6:\"height\";i:561;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:101348;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10813;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-768x421.png\";s:5:\"width\";i:768;s:6:\"height\";i:421;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:70344;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-06-15-a-10.43.45-1536x841.png\";s:5:\"width\";i:1536;s:6:\"height\";i:841;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:226027;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-06-15-a-10.43.45-2048x1121.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1121;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:532845;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-913x500.png\";s:5:\"width\";i:913;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87748;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-639x350.png\";s:5:\"width\";i:639;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:54927;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-900x493.png\";s:5:\"width\";i:900;s:6:\"height\";i:493;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87783;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-800x438.png\";s:5:\"width\";i:800;s:6:\"height\";i:438;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:73374;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39855;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-600x329.png\";s:5:\"width\";i:600;s:6:\"height\";i:329;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:50588;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10891;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20250;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-06-15-a-10.43.45-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7386;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.45-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3009;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-06-15-a-10.43.45-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2056;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10891;}s:3:\"w50\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-06-15-a-10.43.45-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:39855;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(876,104,'project_pictures_0_picture','133'),
	(877,104,'_project_pictures_0_picture','field_648ad02421ed9'),
	(878,104,'project_pictures_1_picture','134'),
	(879,104,'_project_pictures_1_picture','field_648ad02421ed9'),
	(880,104,'project_pictures_2_picture','135'),
	(881,104,'_project_pictures_2_picture','field_648ad02421ed9'),
	(882,104,'project_pictures_3_picture','136'),
	(883,104,'_project_pictures_3_picture','field_648ad02421ed9'),
	(884,104,'project_pictures','4'),
	(885,104,'_project_pictures','field_648ad01b21ed8'),
	(886,104,'galeria','a:4:{i:0;s:3:\"133\";i:1;s:3:\"134\";i:2;s:3:\"135\";i:3;s:3:\"136\";}'),
	(887,104,'_galeria','field_648ad88d31c06'),
	(888,140,'_wp_attached_file','woocommerce-placeholder.png'),
	(889,140,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:8:\"filesize\";i:102644;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12475;}s:5:\"large\";a:5:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:98202;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4204;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:60014;}s:4:\"h350\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-350x350.png\";s:5:\"width\";i:350;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15882;}s:3:\"w50\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-500x500.png\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28778;}s:3:\"w80\";a:5:{s:4:\"file\";s:33:\"woocommerce-placeholder-80x80.png\";s:5:\"width\";i:80;s:6:\"height\";i:80;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1731;}s:3:\"w60\";a:5:{s:4:\"file\";s:33:\"woocommerce-placeholder-60x60.png\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1054;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6540;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(905,133,'_eg_has_gallery','a:1:{i:0;i:153;}'),
	(906,134,'_eg_has_gallery','a:1:{i:0;i:153;}'),
	(907,135,'_eg_has_gallery','a:1:{i:0;i:153;}'),
	(908,136,'_eg_has_gallery','a:1:{i:0;i:153;}'),
	(909,153,'_eg_in_gallery','a:4:{i:0;i:133;i:1;i:134;i:2;i:135;i:3;i:136;}'),
	(910,153,'_eg_gallery_data','a:3:{s:2:\"id\";i:153;s:7:\"gallery\";a:4:{i:133;a:7:{s:6:\"status\";s:6:\"active\";s:3:\"src\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\";s:5:\"title\";s:43:\"Capture d’écran 2023-06-15 à 10.43.06\";s:4:\"link\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\";s:3:\"alt\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:5:\"thumb\";s:0:\"\";}i:134;a:7:{s:6:\"status\";s:6:\"active\";s:3:\"src\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\";s:5:\"title\";s:43:\"Capture d’écran 2023-06-15 à 10.43.19\";s:4:\"link\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\";s:3:\"alt\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:5:\"thumb\";s:0:\"\";}i:135;a:7:{s:6:\"status\";s:6:\"active\";s:3:\"src\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\";s:5:\"title\";s:43:\"Capture d’écran 2023-06-15 à 10.43.29\";s:4:\"link\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\";s:3:\"alt\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:5:\"thumb\";s:0:\"\";}i:136;a:7:{s:6:\"status\";s:6:\"active\";s:3:\"src\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\";s:5:\"title\";s:43:\"Capture d’écran 2023-06-15 à 10.43.45\";s:4:\"link\";s:95:\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\";s:3:\"alt\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:5:\"thumb\";s:0:\"\";}}s:6:\"config\";a:22:{s:4:\"type\";s:7:\"default\";s:7:\"columns\";s:1:\"1\";s:13:\"gallery_theme\";s:4:\"base\";s:10:\"crop_width\";i:640;s:11:\"crop_height\";i:480;s:4:\"crop\";i:0;s:17:\"justified_margins\";i:1;s:12:\"lazy_loading\";i:1;s:18:\"lazy_loading_delay\";i:500;s:6:\"gutter\";i:1;s:6:\"margin\";i:1;s:10:\"image_size\";s:7:\"default\";s:20:\"justified_row_height\";i:150;s:16:\"lightbox_enabled\";i:1;s:20:\"gallery_link_enabled\";i:0;s:14:\"lightbox_theme\";s:4:\"base\";s:19:\"lightbox_image_size\";s:7:\"default\";s:13:\"title_display\";s:5:\"float\";s:7:\"classes\";a:1:{i:0;s:0:\"\";}s:3:\"rtl\";i:0;s:5:\"title\";s:0:\"\";s:4:\"slug\";s:10:\"galerie-cv\";}}'),
	(911,153,'_edit_last','1'),
	(912,153,'_edit_lock','1686824881:1'),
	(913,153,'_eg_just_published','1'),
	(917,159,'_edit_last','1'),
	(918,159,'_edit_lock','1692697020:1'),
	(919,50,'title','Créons quelque chose d\'incroyable ensemble !'),
	(920,50,'_title','field_648b4cc9575b4'),
	(921,51,'title','Créeons quelque chose d’incroyable ensemble !'),
	(922,51,'_title','field_648b4cc9575b4'),
	(923,55,'city','Liège'),
	(924,55,'_city','field_645b9878b28fe'),
	(925,84,'city','Liège'),
	(926,84,'_city','field_645b9878b28fe'),
	(927,166,'surname','Senga-Vita'),
	(928,166,'_surname','field_645b94d4c7da5'),
	(929,166,'firstname','Blanchar'),
	(930,166,'_firstname','field_645b97aa13cb0'),
	(931,166,'phone_number','+32492520430'),
	(932,166,'_phone_number','field_645b973c77e0b'),
	(933,166,'street','Rue monlinvaux'),
	(934,166,'_street','field_645b977213caf'),
	(935,166,'street_number','73'),
	(936,166,'_street_number','field_645b985d903d0'),
	(937,166,'postal_code','4000'),
	(938,166,'_postal_code','field_645b986904d45'),
	(939,166,'Ville','Liège'),
	(940,166,'_Ville','field_645b9878b28fe'),
	(941,166,'Country','Belgique'),
	(942,166,'_Country','field_645b98a864563'),
	(943,166,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(944,166,'_Privacy Policy','field_645ba9161a0e2'),
	(945,166,'privacy_policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(946,166,'_privacy_policy','field_645ba9161a0e2'),
	(947,166,'email','anchar2107@gmail.com'),
	(948,166,'_email','field_6480d9d9c1f65'),
	(949,166,'city','Liège'),
	(950,166,'_city','field_645b9878b28fe'),
	(951,167,'description_title','Je suis'),
	(952,167,'_description_title','field_6454f846332a5'),
	(953,167,'first_quality','Energetique'),
	(954,167,'_first_quality','field_6454fb267ba2b'),
	(955,167,'second_quality','Optimiste'),
	(956,167,'_second_quality','field_6454fb657ba2d'),
	(957,167,'third_quality','Imaginatif'),
	(958,167,'_third_quality','field_6454fb687ba2e'),
	(959,167,'qualities_0_quality','Énergétique'),
	(960,167,'_qualities_0_quality','field_6455193f2107c'),
	(961,167,'qualities_0_image',''),
	(962,167,'_qualities_0_image','field_6455195e2107d'),
	(963,167,'qualities_1_quality','Optimiste'),
	(964,167,'_qualities_1_quality','field_6455193f2107c'),
	(965,167,'qualities_1_image',''),
	(966,167,'_qualities_1_image','field_6455195e2107d'),
	(967,167,'qualities_2_quality','Imaginatif'),
	(968,167,'_qualities_2_quality','field_6455193f2107c'),
	(969,167,'qualities_2_image',''),
	(970,167,'_qualities_2_image','field_6455195e2107d'),
	(971,167,'qualities','3'),
	(972,167,'_qualities','field_645502ddc0ba0'),
	(973,167,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un excelent web developper full stack.'),
	(974,167,'_description_0_paragraphe','field_645517a4a01fe'),
	(975,167,'description','1'),
	(976,167,'_description','field_6455160e66ede'),
	(977,167,'qualities_0_name','Energetique'),
	(978,167,'_qualities_0_name','field_6455193f2107c'),
	(979,167,'qualities_1_name','Optimiste'),
	(980,167,'_qualities_1_name','field_6455193f2107c'),
	(981,167,'qualities_2_name','Imaginatif'),
	(982,167,'_qualities_2_name','field_6455193f2107c'),
	(983,167,'legends_picture_0_text','C\'est moi'),
	(984,167,'_legends_picture_0_text','field_647fa417cccb9'),
	(985,167,'legends_picture','1'),
	(986,167,'_legends_picture','field_647fa404cccb8'),
	(987,167,'call_to_action_text','Dites-moi bonjour'),
	(988,167,'_call_to_action_text','field_648066b978e92'),
	(989,167,'call_to_action','Dites-moi <span class=\"bonjour\"> bonjour </span>'),
	(990,167,'_call_to_action','field_648066b978e92'),
	(991,167,'description_title_copier','Dites moi bonjour'),
	(992,167,'_description_title_copier','field_648069932e85e'),
	(993,167,'project_section_title','Mes projets'),
	(994,167,'_project_section_title','field_6489899550733'),
	(995,153,'_eg_in_posts','a:1:{i:17;i:17;}'),
	(996,168,'description_title','Je suis'),
	(997,168,'_description_title','field_6454f846332a5'),
	(998,168,'first_quality','Energetique'),
	(999,168,'_first_quality','field_6454fb267ba2b'),
	(1000,168,'second_quality','Optimiste'),
	(1001,168,'_second_quality','field_6454fb657ba2d'),
	(1002,168,'third_quality','Imaginatif'),
	(1003,168,'_third_quality','field_6454fb687ba2e'),
	(1004,168,'qualities_0_quality','Énergétique'),
	(1005,168,'_qualities_0_quality','field_6455193f2107c'),
	(1006,168,'qualities_0_image',''),
	(1007,168,'_qualities_0_image','field_6455195e2107d'),
	(1008,168,'qualities_1_quality','Optimiste'),
	(1009,168,'_qualities_1_quality','field_6455193f2107c'),
	(1010,168,'qualities_1_image',''),
	(1011,168,'_qualities_1_image','field_6455195e2107d'),
	(1012,168,'qualities_2_quality','Imaginatif'),
	(1013,168,'_qualities_2_quality','field_6455193f2107c'),
	(1014,168,'qualities_2_image',''),
	(1015,168,'_qualities_2_image','field_6455195e2107d'),
	(1016,168,'qualities','3'),
	(1017,168,'_qualities','field_645502ddc0ba0'),
	(1018,168,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\"> excellent </span> web developper full stack.'),
	(1019,168,'_description_0_paragraphe','field_645517a4a01fe'),
	(1020,168,'description','1'),
	(1021,168,'_description','field_6455160e66ede'),
	(1022,168,'qualities_0_name','Energetique'),
	(1023,168,'_qualities_0_name','field_6455193f2107c'),
	(1024,168,'qualities_1_name','Optimiste'),
	(1025,168,'_qualities_1_name','field_6455193f2107c'),
	(1026,168,'qualities_2_name','Imaginatif'),
	(1027,168,'_qualities_2_name','field_6455193f2107c'),
	(1028,168,'legends_picture_0_text','C\'est moi'),
	(1029,168,'_legends_picture_0_text','field_647fa417cccb9'),
	(1030,168,'legends_picture','1'),
	(1031,168,'_legends_picture','field_647fa404cccb8'),
	(1032,168,'call_to_action_text','Dites-moi bonjour'),
	(1033,168,'_call_to_action_text','field_648066b978e92'),
	(1034,168,'call_to_action','Dites-moi <span class=\"bonjour\"> bonjour </span>'),
	(1035,168,'_call_to_action','field_648066b978e92'),
	(1036,168,'description_title_copier','Dites moi bonjour'),
	(1037,168,'_description_title_copier','field_648069932e85e'),
	(1038,168,'project_section_title','Mes projets'),
	(1039,168,'_project_section_title','field_6489899550733'),
	(1040,85,'project_pictures','1'),
	(1041,85,'_project_pictures','field_648ad01b21ed8'),
	(1042,85,'galeria','a:4:{i:0;s:3:\"172\";i:1;s:3:\"171\";i:2;s:3:\"170\";i:3;s:3:\"169\";}'),
	(1043,85,'_galeria','field_648ad88d31c06'),
	(1044,85,'project_pictures_0_picture',''),
	(1045,85,'_project_pictures_0_picture','field_648ad02421ed9'),
	(1046,169,'_wp_attached_file','2023/06/puissance40.png'),
	(1047,169,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1524;s:4:\"file\";s:23:\"2023/06/puissance40.png\";s:8:\"filesize\";i:206464;s:5:\"sizes\";a:19:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"puissance40-300x159.png\";s:5:\"width\";i:300;s:6:\"height\";i:159;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12154;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"puissance40-1024x542.png\";s:5:\"width\";i:1024;s:6:\"height\";i:542;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:59765;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance40-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11712;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"puissance40-768x406.png\";s:5:\"width\";i:768;s:6:\"height\";i:406;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28596;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:24:\"puissance40-1536x813.png\";s:5:\"width\";i:1536;s:6:\"height\";i:813;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:73698;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:25:\"puissance40-2048x1084.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1084;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:154249;}s:4:\"h500\";a:5:{s:4:\"file\";s:23:\"puissance40-945x500.png\";s:5:\"width\";i:945;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:54131;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"puissance40-661x350.png\";s:5:\"width\";i:661;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:34642;}s:4:\"w900\";a:5:{s:4:\"file\";s:23:\"puissance40-900x476.png\";s:5:\"width\";i:900;s:6:\"height\";i:476;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:29590;}s:4:\"w800\";a:5:{s:4:\"file\";s:23:\"puissance40-800x423.png\";s:5:\"width\";i:800;s:6:\"height\";i:423;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:44176;}s:4:\"w500\";a:5:{s:4:\"file\";s:23:\"puissance40-500x265.png\";s:5:\"width\";i:500;s:6:\"height\";i:265;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:25013;}s:4:\"w600\";a:5:{s:4:\"file\";s:23:\"puissance40-600x318.png\";s:5:\"width\";i:600;s:6:\"height\";i:318;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20979;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"puissance40-200x106.png\";s:5:\"width\";i:200;s:6:\"height\";i:106;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8156;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"puissance40-300x159.png\";s:5:\"width\";i:300;s:6:\"height\";i:159;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12154;}s:4:\"w150\";a:5:{s:4:\"file\";s:22:\"puissance40-150x79.png\";s:5:\"width\";i:150;s:6:\"height\";i:79;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6165;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"puissance40-80x42.png\";s:5:\"width\";i:80;s:6:\"height\";i:42;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3024;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"puissance40-60x32.png\";s:5:\"width\";i:60;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2041;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"puissance40-200x106.png\";s:5:\"width\";i:200;s:6:\"height\";i:106;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8156;}s:3:\"w50\";a:5:{s:4:\"file\";s:23:\"puissance40-500x265.png\";s:5:\"width\";i:500;s:6:\"height\";i:265;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:25013;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1048,170,'_wp_attached_file','2023/06/puissance41.gif'),
	(1049,170,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2014;s:6:\"height\";i:1458;s:4:\"file\";s:23:\"2023/06/puissance41.gif\";s:8:\"filesize\";i:693032;s:5:\"sizes\";a:18:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"puissance41-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:13535;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"puissance41-1024x741.gif\";s:5:\"width\";i:1024;s:6:\"height\";i:741;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:61535;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance41-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:7657;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"puissance41-768x556.gif\";s:5:\"width\";i:768;s:6:\"height\";i:556;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:53028;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:25:\"puissance41-1536x1112.gif\";s:5:\"width\";i:1536;s:6:\"height\";i:1112;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:74990;}s:4:\"h500\";a:5:{s:4:\"file\";s:23:\"puissance41-691x500.gif\";s:5:\"width\";i:691;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:51905;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"puissance41-483x350.gif\";s:5:\"width\";i:483;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:28396;}s:4:\"w900\";a:5:{s:4:\"file\";s:23:\"puissance41-900x652.gif\";s:5:\"width\";i:900;s:6:\"height\";i:652;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:53836;}s:4:\"w800\";a:5:{s:4:\"file\";s:23:\"puissance41-800x579.gif\";s:5:\"width\";i:800;s:6:\"height\";i:579;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:46367;}s:4:\"w500\";a:5:{s:4:\"file\";s:23:\"puissance41-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:29547;}s:4:\"w600\";a:5:{s:4:\"file\";s:23:\"puissance41-600x434.gif\";s:5:\"width\";i:600;s:6:\"height\";i:434;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:34427;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"puissance41-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:7092;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"puissance41-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:13535;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"puissance41-150x109.gif\";s:5:\"width\";i:150;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:5365;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"puissance41-80x58.gif\";s:5:\"width\";i:80;s:6:\"height\";i:58;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:2855;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"puissance41-60x43.gif\";s:5:\"width\";i:60;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:2148;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"puissance41-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:7092;}s:3:\"w50\";a:5:{s:4:\"file\";s:23:\"puissance41-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:29547;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1050,171,'_wp_attached_file','2023/06/puissance42.gif'),
	(1051,171,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2014;s:6:\"height\";i:1458;s:4:\"file\";s:23:\"2023/06/puissance42.gif\";s:8:\"filesize\";i:446834;s:5:\"sizes\";a:18:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"puissance42-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:12250;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"puissance42-1024x741.gif\";s:5:\"width\";i:1024;s:6:\"height\";i:741;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:47773;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance42-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:6971;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"puissance42-768x556.gif\";s:5:\"width\";i:768;s:6:\"height\";i:556;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:51352;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:25:\"puissance42-1536x1112.gif\";s:5:\"width\";i:1536;s:6:\"height\";i:1112;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:80821;}s:4:\"h500\";a:5:{s:4:\"file\";s:23:\"puissance42-691x500.gif\";s:5:\"width\";i:691;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:52501;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"puissance42-483x350.gif\";s:5:\"width\";i:483;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:28192;}s:4:\"w900\";a:5:{s:4:\"file\";s:23:\"puissance42-900x652.gif\";s:5:\"width\";i:900;s:6:\"height\";i:652;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:44327;}s:4:\"w800\";a:5:{s:4:\"file\";s:23:\"puissance42-800x579.gif\";s:5:\"width\";i:800;s:6:\"height\";i:579;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:46317;}s:4:\"w500\";a:5:{s:4:\"file\";s:23:\"puissance42-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:32930;}s:4:\"w600\";a:5:{s:4:\"file\";s:23:\"puissance42-600x434.gif\";s:5:\"width\";i:600;s:6:\"height\";i:434;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:38997;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"puissance42-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:6752;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"puissance42-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:12250;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"puissance42-150x109.gif\";s:5:\"width\";i:150;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:5542;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"puissance42-80x58.gif\";s:5:\"width\";i:80;s:6:\"height\";i:58;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:3118;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"puissance42-60x43.gif\";s:5:\"width\";i:60;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:2299;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"puissance42-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:6752;}s:3:\"w50\";a:5:{s:4:\"file\";s:23:\"puissance42-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:32930;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1052,172,'_wp_attached_file','2023/06/puissance43.gif'),
	(1053,172,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2014;s:6:\"height\";i:1458;s:4:\"file\";s:23:\"2023/06/puissance43.gif\";s:8:\"filesize\";i:613920;s:5:\"sizes\";a:18:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"puissance43-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:16538;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"puissance43-1024x741.gif\";s:5:\"width\";i:1024;s:6:\"height\";i:741;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:98138;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"puissance43-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:7246;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"puissance43-768x556.gif\";s:5:\"width\";i:768;s:6:\"height\";i:556;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:66536;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:25:\"puissance43-1536x1112.gif\";s:5:\"width\";i:1536;s:6:\"height\";i:1112;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:160799;}s:4:\"h500\";a:5:{s:4:\"file\";s:23:\"puissance43-691x500.gif\";s:5:\"width\";i:691;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:62044;}s:4:\"h350\";a:5:{s:4:\"file\";s:23:\"puissance43-483x350.gif\";s:5:\"width\";i:483;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:31811;}s:4:\"w900\";a:5:{s:4:\"file\";s:23:\"puissance43-900x652.gif\";s:5:\"width\";i:900;s:6:\"height\";i:652;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:76261;}s:4:\"w800\";a:5:{s:4:\"file\";s:23:\"puissance43-800x579.gif\";s:5:\"width\";i:800;s:6:\"height\";i:579;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:70791;}s:4:\"w500\";a:5:{s:4:\"file\";s:23:\"puissance43-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:28679;}s:4:\"w600\";a:5:{s:4:\"file\";s:23:\"puissance43-600x434.gif\";s:5:\"width\";i:600;s:6:\"height\";i:434;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:39317;}s:4:\"w200\";a:5:{s:4:\"file\";s:23:\"puissance43-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:8817;}s:4:\"w300\";a:5:{s:4:\"file\";s:23:\"puissance43-300x217.gif\";s:5:\"width\";i:300;s:6:\"height\";i:217;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:16538;}s:4:\"w150\";a:5:{s:4:\"file\";s:23:\"puissance43-150x109.gif\";s:5:\"width\";i:150;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:6601;}s:3:\"w80\";a:5:{s:4:\"file\";s:21:\"puissance43-80x58.gif\";s:5:\"width\";i:80;s:6:\"height\";i:58;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:3298;}s:3:\"w60\";a:5:{s:4:\"file\";s:21:\"puissance43-60x43.gif\";s:5:\"width\";i:60;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:2328;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:23:\"puissance43-200x145.gif\";s:5:\"width\";i:200;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:8817;}s:3:\"w50\";a:5:{s:4:\"file\";s:23:\"puissance43-500x362.gif\";s:5:\"width\";i:500;s:6:\"height\";i:362;s:9:\"mime-type\";s:9:\"image/gif\";s:8:\"filesize\";i:28679;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1054,173,'_wp_attached_file','2023/06/212947723-06569247-903e-4aff-91db-7b7f7ee56335.png'),
	(1055,173,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1376;s:6:\"height\";i:1716;s:4:\"file\";s:58:\"2023/06/212947723-06569247-903e-4aff-91db-7b7f7ee56335.png\";s:8:\"filesize\";i:362098;s:5:\"sizes\";a:18:{s:6:\"medium\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-241x300.png\";s:5:\"width\";i:241;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28714;}s:5:\"large\";a:5:{s:4:\"file\";s:59:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-821x1024.png\";s:5:\"width\";i:821;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:190098;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12816;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-768x958.png\";s:5:\"width\";i:768;s:6:\"height\";i:958;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:170755;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:60:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-1232x1536.png\";s:5:\"width\";i:1232;s:6:\"height\";i:1536;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:346421;}s:4:\"h500\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-401x500.png\";s:5:\"width\";i:401;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:63828;}s:4:\"h350\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-281x350.png\";s:5:\"width\";i:281;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:37221;}s:4:\"w900\";a:5:{s:4:\"file\";s:59:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-900x1122.png\";s:5:\"width\";i:900;s:6:\"height\";i:1122;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:216069;}s:4:\"w800\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-800x998.png\";s:5:\"width\";i:800;s:6:\"height\";i:998;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:182711;}s:4:\"w500\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-500x624.png\";s:5:\"width\";i:500;s:6:\"height\";i:624;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:88510;}s:4:\"w600\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-600x748.png\";s:5:\"width\";i:600;s:6:\"height\";i:748;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:117482;}s:4:\"w200\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-200x249.png\";s:5:\"width\";i:200;s:6:\"height\";i:249;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22055;}s:4:\"w300\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-300x374.png\";s:5:\"width\";i:300;s:6:\"height\";i:374;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:40544;}s:4:\"w150\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-150x187.png\";s:5:\"width\";i:150;s:6:\"height\";i:187;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:14156;}s:3:\"w80\";a:5:{s:4:\"file\";s:57:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-80x100.png\";s:5:\"width\";i:80;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5975;}s:3:\"w60\";a:5:{s:4:\"file\";s:56:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-60x75.png\";s:5:\"width\";i:60;s:6:\"height\";i:75;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4082;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-160x200.png\";s:5:\"width\";i:160;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15630;}s:3:\"w50\";a:5:{s:4:\"file\";s:58:\"212947723-06569247-903e-4aff-91db-7b7f7ee56335-500x624.png\";s:5:\"width\";i:500;s:6:\"height\";i:624;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:88510;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1056,87,'project_pictures',''),
	(1057,87,'_project_pictures','field_648ad01b21ed8'),
	(1058,87,'galeria','a:1:{i:0;s:3:\"173\";}'),
	(1059,87,'_galeria','field_648ad88d31c06'),
	(1060,174,'description_title','Je suis'),
	(1061,174,'_description_title','field_6454f846332a5'),
	(1062,174,'first_quality','Energetique'),
	(1063,174,'_first_quality','field_6454fb267ba2b'),
	(1064,174,'second_quality','Optimiste'),
	(1065,174,'_second_quality','field_6454fb657ba2d'),
	(1066,174,'third_quality','Imaginatif'),
	(1067,174,'_third_quality','field_6454fb687ba2e'),
	(1068,174,'qualities_0_quality','Énergétique'),
	(1069,174,'_qualities_0_quality','field_6455193f2107c'),
	(1070,174,'qualities_0_image',''),
	(1071,174,'_qualities_0_image','field_6455195e2107d'),
	(1072,174,'qualities_1_quality','Optimiste'),
	(1073,174,'_qualities_1_quality','field_6455193f2107c'),
	(1074,174,'qualities_1_image',''),
	(1075,174,'_qualities_1_image','field_6455195e2107d'),
	(1076,174,'qualities_2_quality','Imaginatif'),
	(1077,174,'_qualities_2_quality','field_6455193f2107c'),
	(1078,174,'qualities_2_image',''),
	(1079,174,'_qualities_2_image','field_6455195e2107d'),
	(1080,174,'qualities','3'),
	(1081,174,'_qualities','field_645502ddc0ba0'),
	(1082,174,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\"> excellent </span> web developper.'),
	(1083,174,'_description_0_paragraphe','field_645517a4a01fe'),
	(1084,174,'description','1'),
	(1085,174,'_description','field_6455160e66ede'),
	(1086,174,'qualities_0_name','Energetique'),
	(1087,174,'_qualities_0_name','field_6455193f2107c'),
	(1088,174,'qualities_1_name','Optimiste'),
	(1089,174,'_qualities_1_name','field_6455193f2107c'),
	(1090,174,'qualities_2_name','Imaginatif'),
	(1091,174,'_qualities_2_name','field_6455193f2107c'),
	(1092,174,'legends_picture_0_text','C\'est moi'),
	(1093,174,'_legends_picture_0_text','field_647fa417cccb9'),
	(1094,174,'legends_picture','1'),
	(1095,174,'_legends_picture','field_647fa404cccb8'),
	(1096,174,'call_to_action_text','Dites-moi bonjour'),
	(1097,174,'_call_to_action_text','field_648066b978e92'),
	(1098,174,'call_to_action','Dites-moi <span class=\"bonjour\"> bonjour </span>'),
	(1099,174,'_call_to_action','field_648066b978e92'),
	(1100,174,'description_title_copier','Dites moi bonjour'),
	(1101,174,'_description_title_copier','field_648069932e85e'),
	(1102,174,'project_section_title','Mes projets'),
	(1103,174,'_project_section_title','field_6489899550733'),
	(1104,180,'description_title','Je suis'),
	(1105,180,'_description_title','field_6454f846332a5'),
	(1106,180,'first_quality','Energetique'),
	(1107,180,'_first_quality','field_6454fb267ba2b'),
	(1108,180,'second_quality','Optimiste'),
	(1109,180,'_second_quality','field_6454fb657ba2d'),
	(1110,180,'third_quality','Imaginatif'),
	(1111,180,'_third_quality','field_6454fb687ba2e'),
	(1112,180,'qualities_0_quality','Énergétique'),
	(1113,180,'_qualities_0_quality','field_6455193f2107c'),
	(1114,180,'qualities_0_image',''),
	(1115,180,'_qualities_0_image','field_6455195e2107d'),
	(1116,180,'qualities_1_quality','Optimiste'),
	(1117,180,'_qualities_1_quality','field_6455193f2107c'),
	(1118,180,'qualities_1_image',''),
	(1119,180,'_qualities_1_image','field_6455195e2107d'),
	(1120,180,'qualities_2_quality','Imaginatif'),
	(1121,180,'_qualities_2_quality','field_6455193f2107c'),
	(1122,180,'qualities_2_image',''),
	(1123,180,'_qualities_2_image','field_6455195e2107d'),
	(1124,180,'qualities','3'),
	(1125,180,'_qualities','field_645502ddc0ba0'),
	(1126,180,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\">excellent</span> développeur web.'),
	(1127,180,'_description_0_paragraphe','field_645517a4a01fe'),
	(1128,180,'description','1'),
	(1129,180,'_description','field_6455160e66ede'),
	(1130,180,'qualities_0_name','Énergétique'),
	(1131,180,'_qualities_0_name','field_6455193f2107c'),
	(1132,180,'qualities_1_name','Optimiste'),
	(1133,180,'_qualities_1_name','field_6455193f2107c'),
	(1134,180,'qualities_2_name','Imaginatif'),
	(1135,180,'_qualities_2_name','field_6455193f2107c'),
	(1136,180,'legends_picture_0_text','C\'est moi'),
	(1137,180,'_legends_picture_0_text','field_647fa417cccb9'),
	(1138,180,'legends_picture','1'),
	(1139,180,'_legends_picture','field_647fa404cccb8'),
	(1140,180,'call_to_action_text','Dites-moi bonjour'),
	(1141,180,'_call_to_action_text','field_648066b978e92'),
	(1142,180,'call_to_action','Dites-moi <span class=\"bonjour\">bonjour</span>'),
	(1143,180,'_call_to_action','field_648066b978e92'),
	(1144,180,'description_title_copier','Dites moi bonjour'),
	(1145,180,'_description_title_copier','field_648069932e85e'),
	(1146,180,'project_section_title','Mes projets'),
	(1147,180,'_project_section_title','field_6489899550733'),
	(1148,181,'title','Créons quelque chose d\'incroyable ensemble !'),
	(1149,181,'_title','field_648b4cc9575b4'),
	(1150,5,'_wp_old_date','2023-06-12'),
	(1151,6,'_wp_old_date','2023-06-12'),
	(1152,7,'_wp_old_date','2023-06-12'),
	(1153,8,'_wp_old_date','2023-06-12'),
	(1154,184,'_edit_last','1'),
	(1155,184,'_edit_lock','1692462732:1'),
	(1156,186,'_edit_lock','1692463742:1'),
	(1157,186,'_edit_last','1'),
	(1158,17,'titre-sr','Blanchar Senga-Vita'),
	(1159,17,'_titre-sr','field_64e0ef285f1fe'),
	(1160,180,'titre-sr','Blanchar Senga-Vita'),
	(1161,180,'_titre-sr','field_64e0ef285f1fe'),
	(1162,104,'project_github','https://github.com/blancharSengaVita/CV-2022-2023'),
	(1163,104,'_project_github','field_64e0d811b24d0'),
	(1164,104,'Design','https://xd.adobe.com/view/eb52861a-fb61-47d1-8334-0b7f560bdaf2-be01/'),
	(1165,104,'_Design','field_64e0e1424a841'),
	(1166,104,'titre-sr','CV'),
	(1167,104,'_titre-sr','field_64e0ef285f1fe'),
	(1168,87,'project_github','https://github.com/blancharSengaVita/examen-dam-janvier-2022-2023-blancharSenga-Vita-projet/tree/use-firebase'),
	(1169,87,'_project_github','field_64e0d811b24d0'),
	(1170,87,'Design','https://xd.adobe.com/view/061a116c-093a-4c1c-b009-17f7c5c4f73f-5349/'),
	(1171,87,'_Design','field_64e0e1424a841'),
	(1172,87,'titre-sr','Sparkles Notes'),
	(1173,87,'_titre-sr','field_64e0ef285f1fe'),
	(1174,85,'project_github','https://github.com/blancharSengaVita'),
	(1175,85,'_project_github','field_64e0d811b24d0'),
	(1176,85,'Design',''),
	(1177,85,'_Design','field_64e0e1424a841'),
	(1178,85,'titre-sr','Puissance 4'),
	(1179,85,'_titre-sr','field_64e0ef285f1fe'),
	(1180,17,'title-sr','Blanchar Senga-Vita'),
	(1181,17,'_title-sr','field_64e0ef285f1fe'),
	(1182,180,'title-sr','Blanchar Senga-Vita'),
	(1183,180,'_title-sr','field_64e0ef285f1fe'),
	(1184,50,'title-sr','Contatez-moi !'),
	(1185,50,'_title-sr','field_64e0ef285f1fe'),
	(1186,188,'title','Créons quelque chose d\'incroyable ensemble !'),
	(1187,188,'_title','field_648b4cc9575b4'),
	(1188,188,'title-sr','Contatez-moi !'),
	(1189,188,'_title-sr','field_64e0ef285f1fe'),
	(1190,55,'title-sr','Mentions légales'),
	(1191,55,'_title-sr','field_64e0ef285f1fe'),
	(1192,189,'surname','Senga-Vita'),
	(1193,189,'_surname','field_645b94d4c7da5'),
	(1194,189,'firstname','Blanchar'),
	(1195,189,'_firstname','field_645b97aa13cb0'),
	(1196,189,'phone_number','+32492520430'),
	(1197,189,'_phone_number','field_645b973c77e0b'),
	(1198,189,'street','Rue monlinvaux'),
	(1199,189,'_street','field_645b977213caf'),
	(1200,189,'street_number','73'),
	(1201,189,'_street_number','field_645b985d903d0'),
	(1202,189,'postal_code','4000'),
	(1203,189,'_postal_code','field_645b986904d45'),
	(1204,189,'Ville','Liège'),
	(1205,189,'_Ville','field_645b9878b28fe'),
	(1206,189,'Country','Belgique'),
	(1207,189,'_Country','field_645b98a864563'),
	(1208,189,'Privacy Policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\r\n'),
	(1209,189,'_Privacy Policy','field_645ba9161a0e2'),
	(1210,189,'privacy_policy','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.'),
	(1211,189,'_privacy_policy','field_645ba9161a0e2'),
	(1212,189,'email','anchar2107@gmail.com'),
	(1213,189,'_email','field_6480d9d9c1f65'),
	(1214,189,'city','Liège'),
	(1215,189,'_city','field_645b9878b28fe'),
	(1216,189,'title-sr','Mentions légales'),
	(1217,189,'_title-sr','field_64e0ef285f1fe'),
	(1218,87,'title-sr','SparklesSupa'),
	(1219,87,'_title-sr','field_64e0ef285f1fe'),
	(1220,85,'title-sr','Puissance 4'),
	(1221,85,'_title-sr','field_64e0ef285f1fe'),
	(1222,104,'title-sr','CV'),
	(1223,104,'_title-sr','field_64e0ef285f1fe'),
	(1224,17,'pictures_pictures','a:4:{i:0;s:3:\"124\";i:1;s:3:\"123\";i:2;s:3:\"129\";i:3;s:3:\"126\";}'),
	(1225,17,'_pictures_pictures','field_64e37557286d1'),
	(1226,17,'pictures',''),
	(1227,17,'_pictures','field_64e374f4286d0'),
	(1228,192,'description_title','Je suis'),
	(1229,192,'_description_title','field_6454f846332a5'),
	(1230,192,'first_quality','Energetique'),
	(1231,192,'_first_quality','field_6454fb267ba2b'),
	(1232,192,'second_quality','Optimiste'),
	(1233,192,'_second_quality','field_6454fb657ba2d'),
	(1234,192,'third_quality','Imaginatif'),
	(1235,192,'_third_quality','field_6454fb687ba2e'),
	(1236,192,'qualities_0_quality','Énergétique'),
	(1237,192,'_qualities_0_quality','field_6455193f2107c'),
	(1238,192,'qualities_0_image',''),
	(1239,192,'_qualities_0_image','field_6455195e2107d'),
	(1240,192,'qualities_1_quality','Optimiste'),
	(1241,192,'_qualities_1_quality','field_6455193f2107c'),
	(1242,192,'qualities_1_image',''),
	(1243,192,'_qualities_1_image','field_6455195e2107d'),
	(1244,192,'qualities_2_quality','Imaginatif'),
	(1245,192,'_qualities_2_quality','field_6455193f2107c'),
	(1246,192,'qualities_2_image',''),
	(1247,192,'_qualities_2_image','field_6455195e2107d'),
	(1248,192,'qualities','3'),
	(1249,192,'_qualities','field_645502ddc0ba0'),
	(1250,192,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\">excellent</span> développeur web.'),
	(1251,192,'_description_0_paragraphe','field_645517a4a01fe'),
	(1252,192,'description','1'),
	(1253,192,'_description','field_6455160e66ede'),
	(1254,192,'qualities_0_name','Énergétique'),
	(1255,192,'_qualities_0_name','field_6455193f2107c'),
	(1256,192,'qualities_1_name','Optimiste'),
	(1257,192,'_qualities_1_name','field_6455193f2107c'),
	(1258,192,'qualities_2_name','Imaginatif'),
	(1259,192,'_qualities_2_name','field_6455193f2107c'),
	(1260,192,'legends_picture_0_text','C\'est moi'),
	(1261,192,'_legends_picture_0_text','field_647fa417cccb9'),
	(1262,192,'legends_picture','1'),
	(1263,192,'_legends_picture','field_647fa404cccb8'),
	(1264,192,'call_to_action_text','Dites-moi bonjour'),
	(1265,192,'_call_to_action_text','field_648066b978e92'),
	(1266,192,'call_to_action','Dites-moi <span class=\"bonjour\">bonjour</span>'),
	(1267,192,'_call_to_action','field_648066b978e92'),
	(1268,192,'description_title_copier','Dites moi bonjour'),
	(1269,192,'_description_title_copier','field_648069932e85e'),
	(1270,192,'project_section_title','Mes projets'),
	(1271,192,'_project_section_title','field_6489899550733'),
	(1272,192,'titre-sr','Blanchar Senga-Vita'),
	(1273,192,'_titre-sr','field_64e0ef285f1fe'),
	(1274,192,'title-sr','Blanchar Senga-Vita'),
	(1275,192,'_title-sr','field_64e0ef285f1fe'),
	(1276,192,'pictures_pictures','a:4:{i:0;s:3:\"124\";i:1;s:3:\"123\";i:2;s:3:\"129\";i:3;s:3:\"126\";}'),
	(1277,192,'_pictures_pictures','field_64e37557286d1'),
	(1278,192,'pictures',''),
	(1279,192,'_pictures','field_64e374f4286d0'),
	(1280,17,'pictures_picture','a:4:{i:0;s:3:\"196\";i:1;s:3:\"197\";i:2;s:3:\"195\";i:3;s:3:\"194\";}'),
	(1281,17,'_pictures_picture','field_64e37557286d1'),
	(1282,193,'description_title','Je suis'),
	(1283,193,'_description_title','field_6454f846332a5'),
	(1284,193,'first_quality','Energetique'),
	(1285,193,'_first_quality','field_6454fb267ba2b'),
	(1286,193,'second_quality','Optimiste'),
	(1287,193,'_second_quality','field_6454fb657ba2d'),
	(1288,193,'third_quality','Imaginatif'),
	(1289,193,'_third_quality','field_6454fb687ba2e'),
	(1290,193,'qualities_0_quality','Énergétique'),
	(1291,193,'_qualities_0_quality','field_6455193f2107c'),
	(1292,193,'qualities_0_image',''),
	(1293,193,'_qualities_0_image','field_6455195e2107d'),
	(1294,193,'qualities_1_quality','Optimiste'),
	(1295,193,'_qualities_1_quality','field_6455193f2107c'),
	(1296,193,'qualities_1_image',''),
	(1297,193,'_qualities_1_image','field_6455195e2107d'),
	(1298,193,'qualities_2_quality','Imaginatif'),
	(1299,193,'_qualities_2_quality','field_6455193f2107c'),
	(1300,193,'qualities_2_image',''),
	(1301,193,'_qualities_2_image','field_6455195e2107d'),
	(1302,193,'qualities','3'),
	(1303,193,'_qualities','field_645502ddc0ba0'),
	(1304,193,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\">excellent</span> développeur web.'),
	(1305,193,'_description_0_paragraphe','field_645517a4a01fe'),
	(1306,193,'description','1'),
	(1307,193,'_description','field_6455160e66ede'),
	(1308,193,'qualities_0_name','Énergétique'),
	(1309,193,'_qualities_0_name','field_6455193f2107c'),
	(1310,193,'qualities_1_name','Optimiste'),
	(1311,193,'_qualities_1_name','field_6455193f2107c'),
	(1312,193,'qualities_2_name','Imaginatif'),
	(1313,193,'_qualities_2_name','field_6455193f2107c'),
	(1314,193,'legends_picture_0_text','C\'est moi'),
	(1315,193,'_legends_picture_0_text','field_647fa417cccb9'),
	(1316,193,'legends_picture','1'),
	(1317,193,'_legends_picture','field_647fa404cccb8'),
	(1318,193,'call_to_action_text','Dites-moi bonjour'),
	(1319,193,'_call_to_action_text','field_648066b978e92'),
	(1320,193,'call_to_action','Dites-moi <span class=\"bonjour\">bonjour</span>'),
	(1321,193,'_call_to_action','field_648066b978e92'),
	(1322,193,'description_title_copier','Dites moi bonjour'),
	(1323,193,'_description_title_copier','field_648069932e85e'),
	(1324,193,'project_section_title','Mes projets'),
	(1325,193,'_project_section_title','field_6489899550733'),
	(1326,193,'titre-sr','Blanchar Senga-Vita'),
	(1327,193,'_titre-sr','field_64e0ef285f1fe'),
	(1328,193,'title-sr','Blanchar Senga-Vita'),
	(1329,193,'_title-sr','field_64e0ef285f1fe'),
	(1330,193,'pictures_pictures','a:4:{i:0;s:3:\"124\";i:1;s:3:\"123\";i:2;s:3:\"129\";i:3;s:3:\"126\";}'),
	(1331,193,'_pictures_pictures','field_64e37557286d1'),
	(1332,193,'pictures',''),
	(1333,193,'_pictures','field_64e374f4286d0'),
	(1334,193,'pictures_picture','a:4:{i:0;s:3:\"126\";i:1;s:3:\"124\";i:2;s:3:\"129\";i:3;s:3:\"123\";}'),
	(1335,193,'_pictures_picture','field_64e37557286d1'),
	(1336,194,'_wp_attached_file','2023/08/ampoule-2.svg'),
	(1337,194,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:500;s:6:\"height\";i:600;s:4:\"file\";s:13:\"ampoule-2.svg\";s:5:\"sizes\";a:20:{s:9:\"thumbnail\";a:5:{s:5:\"width\";s:3:\"150\";s:6:\"height\";d:180;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:6:\"medium\";a:5:{s:5:\"width\";s:3:\"300\";s:6:\"height\";d:360;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:12:\"medium_large\";a:5:{s:5:\"width\";s:3:\"768\";s:6:\"height\";d:922;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:5:\"large\";a:5:{s:5:\"width\";s:4:\"1024\";s:6:\"height\";d:1229;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"1536x1536\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"2048x2048\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h350\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w900\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w800\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"500x500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"400x400\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w600\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w300\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w150\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w80\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w60\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"w200xh200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:13:\"ampoule-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}}}'),
	(1338,195,'_wp_attached_file','2023/08/Eclaires-2.svg'),
	(1339,195,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:500;s:6:\"height\";i:550;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:5:\"sizes\";a:20:{s:9:\"thumbnail\";a:5:{s:5:\"width\";s:3:\"150\";s:6:\"height\";d:165;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:6:\"medium\";a:5:{s:5:\"width\";s:3:\"300\";s:6:\"height\";d:330;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:12:\"medium_large\";a:5:{s:5:\"width\";s:3:\"768\";s:6:\"height\";d:845;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:5:\"large\";a:5:{s:5:\"width\";s:4:\"1024\";s:6:\"height\";d:1126;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"1536x1536\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"2048x2048\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h350\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w900\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w800\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"500x500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"400x400\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w600\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w300\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w150\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w80\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w60\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"w200xh200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:14:\"Eclaires-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}}}'),
	(1340,196,'_wp_attached_file','2023/08/Logo-4.svg'),
	(1341,196,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:900;s:6:\"height\";i:900;s:4:\"file\";s:10:\"Logo-4.svg\";s:5:\"sizes\";a:20:{s:9:\"thumbnail\";a:5:{s:5:\"width\";s:3:\"150\";s:6:\"height\";d:150;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:6:\"medium\";a:5:{s:5:\"width\";s:3:\"300\";s:6:\"height\";d:300;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:12:\"medium_large\";a:5:{s:5:\"width\";s:3:\"768\";s:6:\"height\";d:768;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:5:\"large\";a:5:{s:5:\"width\";s:4:\"1024\";s:6:\"height\";d:1024;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"1536x1536\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"2048x2048\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h350\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w900\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w800\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"500x500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"400x400\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w600\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w300\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w150\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w80\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w60\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"w200xh200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:10:\"Logo-4.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}}}'),
	(1342,197,'_wp_attached_file','2023/08/Soleil-2.svg'),
	(1343,197,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:550;s:6:\"height\";i:550;s:4:\"file\";s:12:\"Soleil-2.svg\";s:5:\"sizes\";a:20:{s:9:\"thumbnail\";a:5:{s:5:\"width\";s:3:\"150\";s:6:\"height\";d:150;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:6:\"medium\";a:5:{s:5:\"width\";s:3:\"300\";s:6:\"height\";d:300;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:12:\"medium_large\";a:5:{s:5:\"width\";s:3:\"768\";s:6:\"height\";d:768;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:5:\"large\";a:5:{s:5:\"width\";s:4:\"1024\";s:6:\"height\";d:1024;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"1536x1536\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"2048x2048\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h350\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w900\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w800\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"500x500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"400x400\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w600\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w300\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w150\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w80\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w60\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"w200xh200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:12:\"Soleil-2.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}}}'),
	(1344,198,'description_title','Je suis'),
	(1345,198,'_description_title','field_6454f846332a5'),
	(1346,198,'first_quality','Energetique'),
	(1347,198,'_first_quality','field_6454fb267ba2b'),
	(1348,198,'second_quality','Optimiste'),
	(1349,198,'_second_quality','field_6454fb657ba2d'),
	(1350,198,'third_quality','Imaginatif'),
	(1351,198,'_third_quality','field_6454fb687ba2e'),
	(1352,198,'qualities_0_quality','Énergétique'),
	(1353,198,'_qualities_0_quality','field_6455193f2107c'),
	(1354,198,'qualities_0_image',''),
	(1355,198,'_qualities_0_image','field_6455195e2107d'),
	(1356,198,'qualities_1_quality','Optimiste'),
	(1357,198,'_qualities_1_quality','field_6455193f2107c'),
	(1358,198,'qualities_1_image',''),
	(1359,198,'_qualities_1_image','field_6455195e2107d'),
	(1360,198,'qualities_2_quality','Imaginatif'),
	(1361,198,'_qualities_2_quality','field_6455193f2107c'),
	(1362,198,'qualities_2_image',''),
	(1363,198,'_qualities_2_image','field_6455195e2107d'),
	(1364,198,'qualities','3'),
	(1365,198,'_qualities','field_645502ddc0ba0'),
	(1366,198,'description_0_paragraphe','Je suis un étudiant liégeois qui développe ses compétences afin de devenir un <span class=\"description__emphase\">excellent</span> développeur web.'),
	(1367,198,'_description_0_paragraphe','field_645517a4a01fe'),
	(1368,198,'description','1'),
	(1369,198,'_description','field_6455160e66ede'),
	(1370,198,'qualities_0_name','Énergétique'),
	(1371,198,'_qualities_0_name','field_6455193f2107c'),
	(1372,198,'qualities_1_name','Optimiste'),
	(1373,198,'_qualities_1_name','field_6455193f2107c'),
	(1374,198,'qualities_2_name','Imaginatif'),
	(1375,198,'_qualities_2_name','field_6455193f2107c'),
	(1376,198,'legends_picture_0_text','C\'est moi'),
	(1377,198,'_legends_picture_0_text','field_647fa417cccb9'),
	(1378,198,'legends_picture','1'),
	(1379,198,'_legends_picture','field_647fa404cccb8'),
	(1380,198,'call_to_action_text','Dites-moi bonjour'),
	(1381,198,'_call_to_action_text','field_648066b978e92'),
	(1382,198,'call_to_action','Dites-moi <span class=\"bonjour\">bonjour</span>'),
	(1383,198,'_call_to_action','field_648066b978e92'),
	(1384,198,'description_title_copier','Dites moi bonjour'),
	(1385,198,'_description_title_copier','field_648069932e85e'),
	(1386,198,'project_section_title','Mes projets'),
	(1387,198,'_project_section_title','field_6489899550733'),
	(1388,198,'titre-sr','Blanchar Senga-Vita'),
	(1389,198,'_titre-sr','field_64e0ef285f1fe'),
	(1390,198,'title-sr','Blanchar Senga-Vita'),
	(1391,198,'_title-sr','field_64e0ef285f1fe'),
	(1392,198,'pictures_pictures','a:4:{i:0;s:3:\"124\";i:1;s:3:\"123\";i:2;s:3:\"129\";i:3;s:3:\"126\";}'),
	(1393,198,'_pictures_pictures','field_64e37557286d1'),
	(1394,198,'pictures',''),
	(1395,198,'_pictures','field_64e374f4286d0'),
	(1396,198,'pictures_picture','a:4:{i:0;s:3:\"196\";i:1;s:3:\"197\";i:2;s:3:\"195\";i:3;s:3:\"194\";}'),
	(1397,198,'_pictures_picture','field_64e37557286d1'),
	(1398,17,'inline_featured_image','0'),
	(1399,5,'_wp_old_date','2023-08-19'),
	(1400,7,'_wp_old_date','2023-08-19'),
	(1401,8,'_wp_old_date','2023-08-19'),
	(1402,6,'_wp_old_date','2023-08-19'),
	(1403,104,'inline_featured_image','0'),
	(1404,87,'inline_featured_image','0'),
	(1405,85,'inline_featured_image','0'),
	(1406,199,'_edit_last','1'),
	(1407,199,'_edit_lock','1692698120:1'),
	(1410,201,'_wp_attached_file','2023/08/Capture-decran-2023-08-22-a-10.43.01.png'),
	(1411,201,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1800;s:4:\"file\";s:48:\"2023/08/Capture-decran-2023-08-22-a-10.43.01.png\";s:8:\"filesize\";i:516869;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-300x188.png\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22877;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.43.01-1024x640.png\";s:5:\"width\";i:1024;s:6:\"height\";i:640;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:123258;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10136;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-768x480.png\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:82672;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.43.01-1536x960.png\";s:5:\"width\";i:1536;s:6:\"height\";i:960;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:218868;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.01-2048x1280.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1280;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:338654;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-800x500.png\";s:5:\"width\";i:800;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:86680;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-560x350.png\";s:5:\"width\";i:560;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:53835;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-900x563.png\";s:5:\"width\";i:900;s:6:\"height\";i:563;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:102034;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-800x500.png\";s:5:\"width\";i:800;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:86680;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-500x313.png\";s:5:\"width\";i:500;s:6:\"height\";i:313;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45406;}s:7:\"500x500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-500x313.png\";s:5:\"width\";i:500;s:6:\"height\";i:313;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45406;}s:7:\"400x400\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-400x250.png\";s:5:\"width\";i:400;s:6:\"height\";i:250;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33755;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-600x375.png\";s:5:\"width\";i:600;s:6:\"height\";i:375;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:57635;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-300x188.png\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22877;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-200x125.png\";s:5:\"width\";i:200;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13194;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-08-22-a-10.43.01-150x94.png\";s:5:\"width\";i:150;s:6:\"height\";i:94;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8895;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.43.01-80x50.png\";s:5:\"width\";i:80;s:6:\"height\";i:50;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3658;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.43.01-60x38.png\";s:5:\"width\";i:60;s:6:\"height\";i:38;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2468;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.01-200x125.png\";s:5:\"width\";i:200;s:6:\"height\";i:125;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13194;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1412,202,'_wp_attached_file','2023/08/Capture-decran-2023-08-22-a-10.43.11.png'),
	(1413,202,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1578;s:4:\"file\";s:48:\"2023/08/Capture-decran-2023-08-22-a-10.43.11.png\";s:8:\"filesize\";i:886578;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:16371;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.43.11-1024x561.png\";s:5:\"width\";i:1024;s:6:\"height\";i:561;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87412;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8528;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-768x421.png\";s:5:\"width\";i:768;s:6:\"height\";i:421;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:58195;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.43.11-1536x842.png\";s:5:\"width\";i:1536;s:6:\"height\";i:842;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:183132;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-2048x1122.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1122;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:470561;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-913x500.png\";s:5:\"width\";i:913;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:74968;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-639x350.png\";s:5:\"width\";i:639;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:46246;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-900x493.png\";s:5:\"width\";i:900;s:6:\"height\";i:493;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:71378;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-800x438.png\";s:5:\"width\";i:800;s:6:\"height\";i:438;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:62283;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33033;}s:7:\"500x500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33033;}s:7:\"400x400\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-400x219.png\";s:5:\"width\";i:400;s:6:\"height\";i:219;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:24620;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-600x329.png\";s:5:\"width\";i:600;s:6:\"height\";i:329;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:41577;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:16371;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9778;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-08-22-a-10.43.11-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6555;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.43.11-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2881;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.43.11-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1899;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9778;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1414,203,'_wp_attached_file','2023/08/Capture-decran-2023-08-22-a-10.44.00.png'),
	(1415,203,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1570;s:4:\"file\";s:48:\"2023/08/Capture-decran-2023-08-22-a-10.44.00.png\";s:8:\"filesize\";i:1241751;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21833;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.44.00-1024x558.png\";s:5:\"width\";i:1024;s:6:\"height\";i:558;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:131109;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:13739;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-768x419.png\";s:5:\"width\";i:768;s:6:\"height\";i:419;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:84514;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.44.00-1536x837.png\";s:5:\"width\";i:1536;s:6:\"height\";i:837;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:271343;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.44.00-2048x1116.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1116;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:630537;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-917x500.png\";s:5:\"width\";i:917;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:110820;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-642x350.png\";s:5:\"width\";i:642;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:65747;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-900x491.png\";s:5:\"width\";i:900;s:6:\"height\";i:491;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:108405;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-800x436.png\";s:5:\"width\";i:800;s:6:\"height\";i:436;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:91151;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-500x273.png\";s:5:\"width\";i:500;s:6:\"height\";i:273;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45525;}s:7:\"500x500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-500x273.png\";s:5:\"width\";i:500;s:6:\"height\";i:273;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45525;}s:7:\"400x400\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-400x218.png\";s:5:\"width\";i:400;s:6:\"height\";i:218;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33433;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-600x327.png\";s:5:\"width\";i:600;s:6:\"height\";i:327;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:60235;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21833;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12151;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-08-22-a-10.44.00-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:7917;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.44.00-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3290;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.44.00-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2194;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.44.00-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12151;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1417,199,'project_title','Clinicoeurs'),
	(1418,199,'_project_title','field_647fa78040a14'),
	(1419,199,'project_description','Dans le cadre du cours de design, on nous a demandé de réaliser un site pour une ASBL de clowns qui rendent visite à des hôpitaux, maisons de repos et autres. Je me suis consacré à toutes les étapes pour réaliser ce projet, que ce soit du design au développement.'),
	(1420,199,'_project_description','field_647fa7b340a15'),
	(1421,199,'project_link','https://clinicoeurs.blanchar.be'),
	(1422,199,'_project_link','field_6480bd9b9b2cc'),
	(1423,199,'project_github','https://github.com/blancharSengaVita/clinicoeurs'),
	(1424,199,'_project_github','field_64e0d811b24d0'),
	(1425,199,'Design','https://www.figma.com/file/KHEVrez7NZzsGIhMkJkRXx/Cliniclowns?type=design&node-id=0%3A1&mode=design&t=kEc6Mu9PzSM9VM8Y-1'),
	(1426,199,'_Design','field_64e0e1424a841'),
	(1427,199,'project_pictures',''),
	(1428,199,'_project_pictures','field_648ad01b21ed8'),
	(1429,199,'galeria','a:3:{i:0;s:3:\"202\";i:1;s:3:\"203\";i:2;s:3:\"205\";}'),
	(1430,199,'_galeria','field_648ad88d31c06'),
	(1431,199,'title-sr','Clinicoeurs'),
	(1432,199,'_title-sr','field_64e0ef285f1fe'),
	(1433,199,'inline_featured_image','0'),
	(1434,204,'_wp_attached_file','2023/08/Capture-decran-2023-08-22-a-10.43.11-1.png'),
	(1435,204,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1578;s:4:\"file\";s:50:\"2023/08/Capture-decran-2023-08-22-a-10.43.11-1.png\";s:8:\"filesize\";i:886578;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:16371;}s:5:\"large\";a:5:{s:4:\"file\";s:51:\"Capture-decran-2023-08-22-a-10.43.11-1-1024x561.png\";s:5:\"width\";i:1024;s:6:\"height\";i:561;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87412;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8528;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-768x421.png\";s:5:\"width\";i:768;s:6:\"height\";i:421;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:58195;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:51:\"Capture-decran-2023-08-22-a-10.43.11-1-1536x842.png\";s:5:\"width\";i:1536;s:6:\"height\";i:842;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:183132;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:52:\"Capture-decran-2023-08-22-a-10.43.11-1-2048x1122.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1122;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:470561;}s:4:\"h500\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-913x500.png\";s:5:\"width\";i:913;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:74968;}s:4:\"h350\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-639x350.png\";s:5:\"width\";i:639;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:46246;}s:4:\"w900\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-900x493.png\";s:5:\"width\";i:900;s:6:\"height\";i:493;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:71378;}s:4:\"w800\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-800x438.png\";s:5:\"width\";i:800;s:6:\"height\";i:438;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:62283;}s:4:\"w500\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33033;}s:7:\"500x500\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33033;}s:7:\"400x400\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-400x219.png\";s:5:\"width\";i:400;s:6:\"height\";i:219;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:24620;}s:4:\"w600\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-600x329.png\";s:5:\"width\";i:600;s:6:\"height\";i:329;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:41577;}s:4:\"w300\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:16371;}s:4:\"w200\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9778;}s:4:\"w150\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.43.11-1-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6555;}s:3:\"w80\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-1-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2881;}s:3:\"w60\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.43.11-1-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1899;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.43.11-1-200x110.png\";s:5:\"width\";i:200;s:6:\"height\";i:110;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9778;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1436,205,'_wp_attached_file','2023/08/Capture-decran-2023-08-22-a-10.50.46.png'),
	(1437,205,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2880;s:6:\"height\";i:1576;s:4:\"file\";s:48:\"2023/08/Capture-decran-2023-08-22-a-10.50.46.png\";s:8:\"filesize\";i:2382611;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31468;}s:5:\"large\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.50.46-1024x560.png\";s:5:\"width\";i:1024;s:6:\"height\";i:560;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:265396;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22292;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-768x420.png\";s:5:\"width\";i:768;s:6:\"height\";i:420;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:162583;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:49:\"Capture-decran-2023-08-22-a-10.50.46-1536x841.png\";s:5:\"width\";i:1536;s:6:\"height\";i:841;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:548869;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:50:\"Capture-decran-2023-08-22-a-10.50.46-2048x1121.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1121;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1056608;}s:4:\"h500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-914x500.png\";s:5:\"width\";i:914;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:218695;}s:4:\"h350\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-640x350.png\";s:5:\"width\";i:640;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:118614;}s:4:\"w900\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-900x493.png\";s:5:\"width\";i:900;s:6:\"height\";i:493;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:212409;}s:4:\"w800\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-800x438.png\";s:5:\"width\";i:800;s:6:\"height\";i:438;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:174021;}s:4:\"w500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:77710;}s:7:\"500x500\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-500x274.png\";s:5:\"width\";i:500;s:6:\"height\";i:274;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:77710;}s:7:\"400x400\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-400x219.png\";s:5:\"width\";i:400;s:6:\"height\";i:219;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:52476;}s:4:\"w600\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-600x328.png\";s:5:\"width\";i:600;s:6:\"height\";i:328;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:106280;}s:4:\"w300\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31468;}s:4:\"w200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15524;}s:4:\"w150\";a:5:{s:4:\"file\";s:47:\"Capture-decran-2023-08-22-a-10.50.46-150x82.png\";s:5:\"width\";i:150;s:6:\"height\";i:82;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:9374;}s:3:\"w80\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.50.46-80x44.png\";s:5:\"width\";i:80;s:6:\"height\";i:44;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3346;}s:3:\"w60\";a:5:{s:4:\"file\";s:46:\"Capture-decran-2023-08-22-a-10.50.46-60x33.png\";s:5:\"width\";i:60;s:6:\"height\";i:33;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2109;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:48:\"Capture-decran-2023-08-22-a-10.50.46-200x109.png\";s:5:\"width\";i:200;s:6:\"height\";i:109;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:15524;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1438,206,'_wp_attached_file','2023/08/chaussures-de-clowns_1-removebg-preview-1.png'),
	(1439,206,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:502;s:6:\"height\";i:497;s:4:\"file\";s:53:\"2023/08/chaussures-de-clowns_1-removebg-preview-1.png\";s:8:\"filesize\";i:156369;s:5:\"sizes\";a:12:{s:6:\"medium\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-300x297.png\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:61430;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:19227;}s:4:\"h350\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-354x350.png\";s:5:\"width\";i:354;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:80810;}s:4:\"w500\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-500x495.png\";s:5:\"width\";i:500;s:6:\"height\";i:495;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:143327;}s:7:\"500x500\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-500x495.png\";s:5:\"width\";i:500;s:6:\"height\";i:495;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:143327;}s:7:\"400x400\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-400x396.png\";s:5:\"width\";i:400;s:6:\"height\";i:396;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:99442;}s:4:\"w300\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-300x297.png\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:61430;}s:4:\"w200\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-200x198.png\";s:5:\"width\";i:200;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:30718;}s:4:\"w150\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-150x149.png\";s:5:\"width\";i:150;s:6:\"height\";i:149;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:19077;}s:3:\"w80\";a:5:{s:4:\"file\";s:51:\"chaussures-de-clowns_1-removebg-preview-1-80x79.png\";s:5:\"width\";i:80;s:6:\"height\";i:79;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6477;}s:3:\"w60\";a:5:{s:4:\"file\";s:51:\"chaussures-de-clowns_1-removebg-preview-1-60x59.png\";s:5:\"width\";i:60;s:6:\"height\";i:59;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4040;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:53:\"chaussures-de-clowns_1-removebg-preview-1-200x198.png\";s:5:\"width\";i:200;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:30718;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1440,199,'_thumbnail_id','207'),
	(1441,207,'_wp_attached_file','2023/08/grand.png'),
	(1442,207,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:4853;s:6:\"height\";i:4805;s:4:\"file\";s:17:\"2023/08/grand.png\";s:8:\"filesize\";i:640828;s:5:\"sizes\";a:20:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"grand-300x297.png\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:61515;}s:5:\"large\";a:5:{s:4:\"file\";s:19:\"grand-1024x1014.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1014;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:398027;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"grand-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:19286;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:17:\"grand-768x760.png\";s:5:\"width\";i:768;s:6:\"height\";i:760;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:280326;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:19:\"grand-1536x1521.png\";s:5:\"width\";i:1536;s:6:\"height\";i:1521;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:501158;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:19:\"grand-2048x2028.png\";s:5:\"width\";i:2048;s:6:\"height\";i:2028;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:566672;}s:4:\"h500\";a:5:{s:4:\"file\";s:17:\"grand-505x500.png\";s:5:\"width\";i:505;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:146684;}s:4:\"h350\";a:5:{s:4:\"file\";s:17:\"grand-353x350.png\";s:5:\"width\";i:353;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:80773;}s:4:\"w900\";a:5:{s:4:\"file\";s:17:\"grand-900x891.png\";s:5:\"width\";i:900;s:6:\"height\";i:891;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:347778;}s:4:\"w800\";a:5:{s:4:\"file\";s:17:\"grand-800x792.png\";s:5:\"width\";i:800;s:6:\"height\";i:792;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:297532;}s:4:\"w500\";a:5:{s:4:\"file\";s:17:\"grand-500x495.png\";s:5:\"width\";i:500;s:6:\"height\";i:495;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:143642;}s:7:\"500x500\";a:5:{s:4:\"file\";s:17:\"grand-500x495.png\";s:5:\"width\";i:500;s:6:\"height\";i:495;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:143642;}s:7:\"400x400\";a:5:{s:4:\"file\";s:17:\"grand-400x396.png\";s:5:\"width\";i:400;s:6:\"height\";i:396;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:99581;}s:4:\"w600\";a:5:{s:4:\"file\";s:17:\"grand-600x594.png\";s:5:\"width\";i:600;s:6:\"height\";i:594;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:192324;}s:4:\"w300\";a:5:{s:4:\"file\";s:17:\"grand-300x297.png\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:61515;}s:4:\"w200\";a:5:{s:4:\"file\";s:17:\"grand-200x198.png\";s:5:\"width\";i:200;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:30801;}s:4:\"w150\";a:5:{s:4:\"file\";s:17:\"grand-150x149.png\";s:5:\"width\";i:150;s:6:\"height\";i:149;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:19096;}s:3:\"w80\";a:5:{s:4:\"file\";s:15:\"grand-80x79.png\";s:5:\"width\";i:80;s:6:\"height\";i:79;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:6485;}s:3:\"w60\";a:5:{s:4:\"file\";s:15:\"grand-60x59.png\";s:5:\"width\";i:60;s:6:\"height\";i:59;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4046;}s:9:\"w200xh200\";a:5:{s:4:\"file\";s:17:\"grand-200x198.png\";s:5:\"width\";i:200;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:30801;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(1443,208,'_edit_last','1'),
	(1444,208,'_edit_lock','1692704638:1'),
	(1445,209,'_wp_attached_file','2023/08/Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg'),
	(1446,209,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:831;s:6:\"height\";i:457;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:5:\"sizes\";a:20:{s:9:\"thumbnail\";a:5:{s:5:\"width\";s:3:\"150\";s:6:\"height\";d:82;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:6:\"medium\";a:5:{s:5:\"width\";s:3:\"300\";s:6:\"height\";d:165;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:12:\"medium_large\";a:5:{s:5:\"width\";s:3:\"768\";s:6:\"height\";d:422;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:5:\"large\";a:5:{s:5:\"width\";s:4:\"1024\";s:6:\"height\";d:563;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"1536x1536\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"2048x2048\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"h350\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w900\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w800\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"500x500\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:7:\"400x400\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w600\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w300\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:4:\"w150\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w80\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:3:\"w60\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}s:9:\"w200xh200\";a:5:{s:5:\"width\";b:0;s:6:\"height\";d:0;s:4:\"crop\";b:0;s:4:\"file\";s:64:\"Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg\";s:9:\"mime-type\";s:13:\"image/svg+xml\";}}}'),
	(1447,208,'project_title','Portfolio'),
	(1448,208,'_project_title','field_647fa78040a14'),
	(1449,208,'project_description','Il s\'agit du projet que vous visitez actuellement, réalisé dans le cadre d\'un projet pédagogique. J\'ai souhaité y retransmettre mon univers brouillon et créatif. Bien qu\'il soit non abouti, il subira des transformations au fil du temps. Vous pouvez notamment découvrir les idées ainsi que mon processus créatif en suivant le lien qui vous conduira vers mon design. (ps :si cette description et encore là c\'est qu\'il a pas encore subi beaucoup de transformation.)'),
	(1450,208,'_project_description','field_647fa7b340a15'),
	(1451,208,'project_link','https://blanchar.be'),
	(1452,208,'_project_link','field_6480bd9b9b2cc'),
	(1453,208,'project_github','https://github.com/blancharSengaVita/portfolio'),
	(1454,208,'_project_github','field_64e0d811b24d0'),
	(1455,208,'Design','https://www.figma.com/file/1i6t1G5YGpJR1jjIEraoU9/Untitled?type=design&node-id=0%3A1&mode=design&t=KOWy5R86vQsMgiWq-1'),
	(1456,208,'_Design','field_64e0e1424a841'),
	(1457,208,'project_pictures',''),
	(1458,208,'_project_pictures','field_648ad01b21ed8'),
	(1459,208,'galeria','a:1:{i:0;s:3:\"196\";}'),
	(1460,208,'_galeria','field_648ad88d31c06'),
	(1461,208,'title-sr','Blanchar Senga-Vita'),
	(1462,208,'_title-sr','field_64e0ef285f1fe'),
	(1463,208,'inline_featured_image','0'),
	(1464,208,'_thumbnail_id','196');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2023-04-28 14:07:24','2023-04-28 14:07:24','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2023-04-28 14:07:24','2023-04-28 14:07:24','',0,'https://portfolio.localhost/?p=1',0,'post','',1),
	(5,1,'2023-08-22 07:06:53','2023-04-28 14:59:22','','Accueil','','publish','closed','closed','','accueil','','','2023-08-22 07:06:53','2023-08-22 06:06:53','',0,'https://portfolio.localhost/?p=5',1,'nav_menu_item','',0),
	(6,1,'2023-08-22 07:06:53','2023-04-28 14:59:22','','Contactez-moi','','publish','closed','closed','','contactez-moi','','','2023-08-22 07:06:53','2023-08-22 06:06:53','',0,'https://portfolio.localhost/?p=6',4,'nav_menu_item','',0),
	(7,1,'2023-08-22 07:06:53','2023-04-28 14:59:22','','Voir mes projets','','publish','closed','closed','','voir-mes-projets','','','2023-08-22 07:06:53','2023-08-22 06:06:53','',0,'https://portfolio.localhost/?p=7',2,'nav_menu_item','',0),
	(8,1,'2023-08-22 07:06:53','2023-04-28 14:59:22','','Qui suis-je','','publish','closed','closed','','qui-suis-je','','','2023-08-22 07:06:53','2023-08-22 06:06:53','',0,'https://portfolio.localhost/?p=8',3,'nav_menu_item','',0),
	(9,1,'2023-05-05 13:05:14','2023-05-05 12:05:14','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing</p>\n<!-- /wp:paragraph -->','Hello world!','','inherit','closed','closed','','1-autosave-v1','','','2023-05-05 13:05:14','2023-05-05 12:05:14','',1,'https://portfolio.localhost/?p=9',0,'revision','',0),
	(10,1,'2023-05-05 13:40:55','2023-05-05 12:40:55','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"17\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"field\";s:14:\"hide_on_screen\";a:1:{i:0;s:11:\"the_content\";}s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Champs pour page d\'accueil','champs-pour-page-daccueil','publish','closed','closed','','group_6454f845cfd74','','','2023-08-21 15:40:38','2023-08-21 14:40:38','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=10',0,'acf-field-group','',0),
	(11,1,'2023-05-05 13:40:55','2023-05-05 12:40:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Titre de la section description','description_title','publish','closed','closed','','field_6454f846332a5','','','2023-05-05 15:46:13','2023-05-05 14:46:13','',10,'https://portfolio.localhost/?post_type=acf-field&#038;p=11',0,'acf-field','',0),
	(17,1,'2023-05-05 13:53:26','2023-05-05 12:53:26','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','publish','closed','closed','','page-daccueil','','','2023-08-21 16:21:13','2023-08-21 15:21:13','',0,'https://portfolio.localhost/?page_id=17',0,'page','',0),
	(18,1,'2023-05-05 13:53:26','2023-05-05 12:53:26','bonjour','Page d\'accueil','','inherit','closed','closed','','17-revision-v1','','','2023-05-05 13:53:26','2023-05-05 12:53:26','',17,'https://portfolio.localhost/?p=18',0,'revision','',0),
	(19,1,'2023-05-05 13:56:03','2023-05-05 12:56:03','bonjour','Page d\'accueil','','inherit','closed','closed','','17-revision-v1','','','2023-05-05 13:56:03','2023-05-05 12:56:03','',17,'https://portfolio.localhost/?p=19',0,'revision','',0),
	(22,1,'2023-05-05 14:23:50','2023-05-05 13:23:50','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:20:\"Ajouter un élément\";s:13:\"rows_per_page\";i:20;}','Les qualités','qualities','publish','closed','closed','','field_645502ddc0ba0','','','2023-06-07 12:31:11','2023-06-07 11:31:11','',10,'https://portfolio.localhost/?post_type=acf-field&#038;p=22',1,'acf-field','',0),
	(39,1,'2023-05-05 15:46:13','2023-05-05 14:46:13','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:20:\"Ajouter un élément\";s:13:\"rows_per_page\";i:20;}','Texte de la description','description','publish','closed','closed','','field_6455160e66ede','','','2023-06-07 12:31:11','2023-06-07 11:31:11','',10,'https://portfolio.localhost/?post_type=acf-field&#038;p=39',2,'acf-field','',0),
	(40,1,'2023-05-05 15:51:07','2023-05-05 14:51:07','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Paragraphe','paragraphe','publish','closed','closed','','field_645517a4a01fe','','','2023-05-05 16:04:34','2023-05-05 15:04:34','',39,'https://portfolio.localhost/?post_type=acf-field&#038;p=40',0,'acf-field','',0),
	(44,1,'2023-05-05 15:58:19','2023-05-05 14:58:19','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','name','name','publish','closed','closed','','field_6455193f2107c','','','2023-05-05 16:24:22','2023-05-05 15:24:22','',22,'https://portfolio.localhost/?post_type=acf-field&#038;p=44',0,'acf-field','',0),
	(47,1,'2023-05-05 16:09:52','2023-05-05 15:09:52','','Page d\'accueil','','inherit','closed','closed','','17-revision-v1','','','2023-05-05 16:09:52','2023-05-05 15:09:52','',17,'https://portfolio.localhost/?p=47',0,'revision','',0),
	(48,1,'2023-05-05 16:14:16','2023-05-05 15:14:16','','Page d\'accueil','','inherit','closed','closed','','17-revision-v1','','','2023-05-05 16:14:16','2023-05-05 15:14:16','',17,'https://portfolio.localhost/?p=48',0,'revision','',0),
	(50,1,'2023-05-09 14:33:03','2023-05-09 13:33:03','','Contatez-moi !','','publish','closed','closed','','contact','','','2023-08-19 18:50:18','2023-08-19 17:50:18','',0,'https://portfolio.localhost/?page_id=50',0,'page','',0),
	(51,1,'2023-05-09 14:33:03','2023-05-09 13:33:03','','Contatez-moi !','','inherit','closed','closed','','50-revision-v1','','','2023-05-09 14:33:03','2023-05-09 13:33:03','',50,'https://portfolio.localhost/?p=51',0,'revision','',0),
	(54,1,'2023-05-10 11:37:10','2023-05-10 10:37:10','oui oui','Blanchar Senga-Vita <anchar2107@gmail.com>','','publish','closed','closed','','blanchar-senga-vita','','','2023-05-10 11:37:10','2023-05-10 10:37:10','',0,'https://portfolio.localhost/message/blanchar-senga-vita/',0,'message','',0),
	(55,1,'2023-05-10 13:55:28','2023-05-10 12:55:28','','Mentions légales','','publish','closed','closed','','mentions-legales','','','2023-08-19 18:50:35','2023-08-19 17:50:35','',0,'https://portfolio.localhost/?page_id=55',0,'page','',0),
	(56,1,'2023-05-10 13:55:28','2023-05-10 12:55:28','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 13:55:28','2023-05-10 12:55:28','',55,'https://portfolio.localhost/?p=56',0,'revision','',0),
	(57,1,'2023-05-10 13:56:30','2023-05-10 12:56:30','<h2>bonjour</h2>\nBlanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-autosave-v1','','','2023-05-10 13:56:30','2023-05-10 12:56:30','',55,'https://portfolio.localhost/?p=57',0,'revision','',0),
	(58,1,'2023-05-10 13:56:52','2023-05-10 12:56:52','<h2>Clause de confidentialité</h2>\r\nBlanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 13:56:52','2023-05-10 12:56:52','',55,'https://portfolio.localhost/?p=58',0,'revision','',0),
	(59,1,'2023-05-10 13:57:47','2023-05-10 12:57:47','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 13:57:47','2023-05-10 12:57:47','',55,'https://portfolio.localhost/?p=59',0,'revision','',0),
	(60,1,'2023-05-10 13:58:34','2023-05-10 12:58:34','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"55\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Champ pour les mentions légales','champ-pour-les-mentions-legales','publish','closed','closed','','group_645b94d41c5fe','','','2023-06-16 12:29:35','2023-06-16 11:29:35','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=60',0,'acf-field-group','',0),
	(61,1,'2023-05-10 13:58:34','2023-05-10 12:58:34','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Senga-Vita\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Nom','surname','publish','closed','closed','','field_645b94d4c7da5','','','2023-05-10 14:10:59','2023-05-10 13:10:59','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=61',0,'acf-field','',0),
	(62,1,'2023-05-10 14:09:03','2023-05-10 13:09:03','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:12:\"+32492520430\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','numéro de téléphone','phone_number','publish','closed','closed','','field_645b973c77e0b','','','2023-05-10 14:26:54','2023-05-10 13:26:54','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=62',2,'acf-field','',0),
	(63,1,'2023-05-10 14:10:24','2023-05-10 13:10:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:8:\"Blanchar\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Prénom','firstname','publish','closed','closed','','field_645b97aa13cb0','','','2023-05-10 14:10:38','2023-05-10 13:10:38','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=63',1,'acf-field','',0),
	(64,1,'2023-05-10 14:10:24','2023-05-10 13:10:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:14:\"Rue monlinvaux\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Rue','street','publish','closed','closed','','field_645b977213caf','','','2023-05-10 14:17:21','2023-05-10 13:17:21','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=64',3,'acf-field','',0),
	(65,1,'2023-05-10 14:13:10','2023-05-10 13:13:10','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";i:73;s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Numéro de rue','street_number','publish','closed','closed','','field_645b985d903d0','','','2023-06-07 20:26:38','2023-06-07 19:26:38','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=65',4,'acf-field','',0),
	(66,1,'2023-05-10 14:13:24','2023-05-10 13:13:24','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";i:4000;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:4:\"step\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Code postale','postal_code','publish','closed','closed','','field_645b986904d45','','','2023-06-07 20:26:38','2023-06-07 19:26:38','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=66',5,'acf-field','',0),
	(67,1,'2023-05-10 14:14:13','2023-05-10 13:14:13','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:6:\"Liège\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Ville','city','publish','closed','closed','','field_645b9878b28fe','','','2023-06-16 12:25:01','2023-06-16 11:25:01','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=67',6,'acf-field','',0),
	(68,1,'2023-05-10 14:14:20','2023-05-10 13:14:20','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:8:\"Belgique\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Pays','country','publish','closed','closed','','field_645b98a864563','','','2023-06-16 12:29:35','2023-06-16 11:29:35','',60,'https://portfolio.localhost/?post_type=acf-field&#038;p=68',7,'acf-field','',0),
	(69,1,'2023-05-10 14:46:14','2023-05-10 13:46:14',' ','','','publish','closed','closed','','69','','','2023-05-10 14:46:14','2023-05-10 13:46:14','',0,'https://portfolio.localhost/?p=69',1,'nav_menu_item','',0),
	(72,1,'2023-05-10 15:06:50','2023-05-10 14:06:50','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-05-10 15:06:50','2023-05-10 14:06:50','',17,'https://portfolio.localhost/?p=72',0,'revision','',0),
	(77,1,'2023-05-10 15:24:33','2023-05-10 14:24:33','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"55\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:1:{i:0;s:11:\"the_content\";}s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Champ pour les clauses de confidentialités','champ-pour-les-clauses-de-confidentialites','publish','closed','closed','','group_645ba91608664','','','2023-06-07 20:44:40','2023-06-07 19:44:40','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=77',0,'acf-field-group','',0),
	(78,1,'2023-05-10 15:24:33','2023-05-10 14:24:33','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:599:\"Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Clause de confidentialité','privacy_policy','publish','closed','closed','','field_645ba9161a0e2','','','2023-06-07 20:44:40','2023-06-07 19:44:40','',77,'https://portfolio.localhost/?post_type=acf-field&#038;p=78',0,'acf-field','',0),
	(79,1,'2023-05-10 15:57:24','2023-05-10 14:57:24','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:57:24','2023-05-10 14:57:24','',55,'https://portfolio.localhost/?p=79',0,'revision','',0),
	(80,1,'2023-05-10 15:57:46','2023-05-10 14:57:46','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:57:46','2023-05-10 14:57:46','',55,'https://portfolio.localhost/?p=80',0,'revision','',0),
	(81,1,'2023-05-10 15:57:51','2023-05-10 14:57:51','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:57:51','2023-05-10 14:57:51','',55,'https://portfolio.localhost/?p=81',0,'revision','',0),
	(82,1,'2023-05-10 15:58:00','2023-05-10 14:58:00','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:58:00','2023-05-10 14:58:00','',55,'https://portfolio.localhost/?p=82',0,'revision','',0),
	(83,1,'2023-05-10 15:58:08','2023-05-10 14:58:08','Blanchar Senga-Vita traitera avec le plus grand soin les données personnelles qui lui ont été communiquées. Blanchar Senga-Vita les traitera en toute confidentialité et ne les utilisera qu’aux fins pour lesquelles elles lui ont été communiquées. Ces données peuvent être enregistrées dans une ou plusieurs bases de données de Blanchar Senga-Vita et ne seront pas communiquées à des tiers sans le consentement de la personne concernée. Cette dernière peut en outre toujours réclamer la communication de ses données en notre possession, et en demander rectification et suppression.','mentions l','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:58:08','2023-05-10 14:58:08','',55,'https://portfolio.localhost/?p=83',0,'revision','',0),
	(84,1,'2023-05-10 15:59:20','2023-05-10 14:59:20','','mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-05-10 15:59:20','2023-05-10 14:59:20','',55,'https://portfolio.localhost/?p=84',0,'revision','',0),
	(85,1,'2023-05-10 16:28:51','2023-05-10 15:28:51','','Puissance 4','','publish','closed','closed','','puissance-4','','','2023-08-22 11:06:48','2023-08-22 10:06:48','',0,'https://portfolio.localhost/?post_type=projet&#038;p=85',0,'projet','',0),
	(87,1,'2023-06-06 22:18:26','2023-06-06 21:18:26','','Sparkles Notes','','publish','closed','closed','','sparkles-notes','','','2023-08-22 11:25:37','2023-08-22 10:25:37','',0,'https://portfolio.localhost/?post_type=projet&#038;p=87',0,'projet','',0),
	(89,1,'2023-06-06 22:24:05','2023-06-06 21:24:05','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-06 22:24:05','2023-06-06 21:24:05','',17,'https://portfolio.localhost/?p=89',0,'revision','',0),
	(90,1,'2023-06-06 22:25:39','2023-06-06 21:25:39','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:20:\"Ajouter un élément\";s:13:\"rows_per_page\";i:20;}','légende des photo','legends_picture','publish','closed','closed','','field_647fa404cccb8','','','2023-06-07 12:31:11','2023-06-07 11:31:11','',10,'https://portfolio.localhost/?post_type=acf-field&#038;p=90',3,'acf-field','',0),
	(91,1,'2023-06-06 22:25:39','2023-06-06 21:25:39','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:9:\"C\'est moi\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','texte','text','publish','closed','closed','','field_647fa417cccb9','','','2023-06-06 22:25:39','2023-06-06 21:25:39','',90,'https://portfolio.localhost/?post_type=acf-field&p=91',0,'acf-field','',0),
	(93,1,'2023-06-06 22:41:09','2023-06-06 21:41:09','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"projet\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Champ pour projets','champ-pour-projets','publish','closed','closed','','group_647fa78068b6e','','','2023-08-22 10:49:48','2023-08-22 09:49:48','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=93',0,'acf-field-group','',0),
	(94,1,'2023-06-06 22:41:09','2023-06-06 21:41:09','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:11:\"Puissance 4\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Titre du projet','project_title','publish','closed','closed','','field_647fa78040a14','','','2023-06-06 22:41:27','2023-06-06 21:41:27','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=94',0,'acf-field','',0),
	(95,1,'2023-06-06 22:41:09','2023-06-06 21:41:09','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:267:\"Bounce est un jeu qui était préinstallé sur de nombreux nokia durant l’an 2000. On y contrôle une boule avec laquelle il faut traverser tout le niveau en passant par tous les cerceaux afin de débloquer un autre niveau. Je me suis donné le défi de le refaire.\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Description du projet','project_description','publish','closed','closed','','field_647fa7b340a15','','','2023-06-06 22:41:09','2023-06-06 21:41:09','',93,'https://portfolio.localhost/?post_type=acf-field&p=95',1,'acf-field','',0),
	(96,1,'2023-06-06 23:30:26','2023-06-06 22:30:26','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-06 23:30:26','2023-06-06 22:30:26','',17,'https://portfolio.localhost/?p=96',0,'revision','',0),
	(97,1,'2023-06-07 12:15:46','2023-06-07 11:15:46','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Texte du call to action','call_to_action','publish','closed','closed','','field_648066b978e92','','','2023-06-07 12:31:37','2023-06-07 11:31:37','',10,'https://portfolio.localhost/?post_type=acf-field&#038;p=97',4,'acf-field','',0),
	(98,1,'2023-06-07 12:19:29','2023-06-07 11:19:29','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-07 12:19:29','2023-06-07 11:19:29','',17,'https://portfolio.localhost/?p=98',0,'revision','',0),
	(99,1,'2023-06-07 12:23:48','2023-06-07 11:23:48','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-07 12:23:48','2023-06-07 11:23:48','',17,'https://portfolio.localhost/?p=99',0,'revision','',0),
	(101,1,'2023-06-07 12:30:18','2023-06-07 11:30:18','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-07 12:30:18','2023-06-07 11:30:18','',17,'https://portfolio.localhost/?p=101',0,'revision','',0),
	(102,1,'2023-06-07 12:30:44','2023-06-07 11:30:44','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-07 12:30:44','2023-06-07 11:30:44','',17,'https://portfolio.localhost/?p=102',0,'revision','',0),
	(103,1,'2023-06-07 18:45:33','2023-06-07 17:45:33','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:71:\"https://tecg-mmi-2022-2023.github.io/projet-mmi-juin-blancharSengaVita/\";s:11:\"placeholder\";s:0:\"\";}','Lien du projets','project_link','publish','closed','closed','','field_6480bd9b9b2cc','','','2023-08-19 15:59:49','2023-08-19 14:59:49','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=103',2,'acf-field','',0),
	(104,1,'2023-06-07 19:51:29','2023-06-07 18:51:29','','CV','','publish','closed','closed','','cv','','','2023-08-22 11:24:35','2023-08-22 10:24:35','',0,'https://portfolio.localhost/?post_type=projet&#038;p=104',0,'projet','',0),
	(105,1,'2023-06-07 20:26:38','2023-06-07 19:26:38','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:20:\"anchar2107@gmail.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','E-mail','email','publish','closed','closed','','field_6480d9d9c1f65','','','2023-06-07 20:26:38','2023-06-07 19:26:38','',60,'https://portfolio.localhost/?post_type=acf-field&p=105',8,'acf-field','',0),
	(118,1,'2023-06-11 20:00:34','2023-06-11 19:00:34','','1-bg-remove','','inherit','open','closed','','1-bg-remove','','','2023-06-11 20:00:34','2023-06-11 19:00:34','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/1-bg-remove.png',0,'attachment','image/png',0),
	(119,1,'2023-06-11 20:00:34','2023-06-11 19:00:34','','2-bg-remove','','inherit','open','closed','','2-bg-remove','','','2023-06-11 20:00:34','2023-06-11 19:00:34','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/2-bg-remove.png',0,'attachment','image/png',0),
	(120,1,'2023-06-11 20:00:34','2023-06-11 19:00:34','','3-bg-remove','','inherit','open','closed','','3-bg-remove','','','2023-06-11 20:00:34','2023-06-11 19:00:34','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/3-bg-remove.png',0,'attachment','image/png',0),
	(121,1,'2023-06-11 20:00:35','2023-06-11 19:00:35','','4-bg-remove','','inherit','open','closed','','4-bg-remove','','','2023-06-11 20:00:35','2023-06-11 19:00:35','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/4-bg-remove.png',0,'attachment','image/png',0),
	(122,1,'2023-06-11 20:00:35','2023-06-11 19:00:35','','5-bg-remove','','inherit','open','closed','','5-bg-remove','','','2023-06-11 20:00:35','2023-06-11 19:00:35','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/5-bg-remove.png',0,'attachment','image/png',0),
	(125,1,'2023-06-11 20:00:36','2023-06-11 19:00:36','','une pile de CV','','inherit','open','closed','','image-9','','','2023-06-11 20:02:35','2023-06-11 19:02:35','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/image-9.png',0,'attachment','image/png',0),
	(127,1,'2023-06-11 20:00:39','2023-06-11 19:00:39','','note','','inherit','open','closed','','note','','','2023-06-11 20:00:39','2023-06-11 19:00:39','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/note.png',0,'attachment','image/png',0),
	(128,1,'2023-06-11 20:00:39','2023-06-11 19:00:39','','puissance-4','','inherit','open','closed','','puissance-4-2','','','2023-06-11 20:00:39','2023-06-11 19:00:39','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/puissance-4.png',0,'attachment','image/png',0),
	(130,1,'2023-06-14 10:35:04','2023-06-14 09:35:04','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:11:\"Mes projets\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Titre de la section projet','project_section_title','publish','closed','closed','','field_6489899550733','','','2023-06-14 10:35:04','2023-06-14 09:35:04','',10,'https://portfolio.localhost/?post_type=acf-field&p=130',5,'acf-field','',0),
	(131,1,'2023-06-14 10:58:40','2023-06-14 09:58:40','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-14 10:58:40','2023-06-14 09:58:40','',17,'https://portfolio.localhost/?p=131',0,'revision','',0),
	(132,1,'2023-06-14 10:59:24','2023-06-14 09:59:24','','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-14 10:59:24','2023-06-14 09:59:24','',17,'https://portfolio.localhost/?p=132',0,'revision','',0),
	(133,1,'2023-06-15 09:46:15','2023-06-15 08:46:15','','Capture d’écran 2023-06-15 à 10.43.06','','inherit','open','closed','','capture-decran-2023-06-15-a-10-43-06','','','2023-06-15 09:50:39','2023-06-15 08:50:39','',104,'https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png',0,'attachment','image/png',0),
	(134,1,'2023-06-15 09:46:16','2023-06-15 08:46:16','','Capture d’écran 2023-06-15 à 10.43.19','','inherit','open','closed','','capture-decran-2023-06-15-a-10-43-19','','','2023-06-15 09:50:39','2023-06-15 08:50:39','',104,'https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png',0,'attachment','image/png',0),
	(135,1,'2023-06-15 09:46:17','2023-06-15 08:46:17','','Capture d’écran 2023-06-15 à 10.43.29','','inherit','open','closed','','capture-decran-2023-06-15-a-10-43-29','','','2023-06-15 09:50:39','2023-06-15 08:50:39','',104,'https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png',0,'attachment','image/png',0),
	(136,1,'2023-06-15 09:46:19','2023-06-15 08:46:19','','Capture d’écran 2023-06-15 à 10.43.45','','inherit','open','closed','','capture-decran-2023-06-15-a-10-43-45','','','2023-06-15 10:24:05','2023-06-15 09:24:05','',104,'https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png',0,'attachment','image/png',0),
	(137,1,'2023-06-15 09:48:09','2023-06-15 08:48:09','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:20:\"Ajouter un élément\";s:13:\"rows_per_page\";i:20;}','Images du projet','project_pictures','publish','closed','closed','','field_648ad01b21ed8','','','2023-08-19 16:36:27','2023-08-19 15:36:27','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=137',5,'acf-field','',0),
	(138,1,'2023-06-15 09:48:09','2023-06-15 08:48:09','a:16:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image','picture','publish','closed','closed','','field_648ad02421ed9','','','2023-06-15 09:56:03','2023-06-15 08:56:03','',137,'https://portfolio.localhost/?post_type=acf-field&#038;p=138',0,'acf-field','',0),
	(139,1,'2023-06-15 10:23:51','2023-06-15 09:23:51','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Galerie','galeria','publish','closed','closed','','field_648ad88d31c06','','','2023-08-19 16:36:27','2023-08-19 15:36:27','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=139',6,'acf-field','',0),
	(140,1,'2023-06-15 10:35:18','2023-06-15 09:35:18','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2023-06-15 10:35:18','2023-06-15 09:35:18','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/woocommerce-placeholder.png',0,'attachment','image/png',0),
	(152,1,'2023-06-15 10:51:47','2023-06-15 09:51:47','<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":135,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29-1024x560.png\" alt=\"\" class=\"wp-image-135\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":136,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45-1024x561.png\" alt=\"\" class=\"wp-image-136\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":134,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19-1024x560.png\" alt=\"\" class=\"wp-image-134\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":133,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06-1024x557.png\" alt=\"\" class=\"wp-image-133\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-15 10:51:47','2023-06-15 09:51:47','',17,'https://portfolio.localhost/?p=152',0,'revision','',0),
	(153,1,'2023-06-15 11:11:21','2023-06-15 10:11:21','','galerie CV','','publish','closed','closed','','galerie-cv','','','2023-06-15 11:30:30','2023-06-15 10:30:30','',0,'https://portfolio.localhost/?post_type=envira&#038;p=153',0,'envira','',0),
	(155,1,'2023-06-15 11:20:16','2023-06-15 10:20:16','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"0\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":113.36971350613915,\"width\":208.6},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":113.36971350613915,\"width\":207.5},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":113.36971350613915,\"width\":207.5},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":113.36971350613915,\"width\":207.5}]} -->\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\n<!-- /wp:envira/envira-gallery -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-15 11:20:16','2023-06-15 10:20:16','',17,'https://portfolio.localhost/?p=155',0,'revision','',0),
	(156,1,'2023-06-15 11:23:24','2023-06-15 10:23:24','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":113.36971350613915,\"width\":208.6},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":113.36971350613915,\"width\":207.5},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":113.36971350613915,\"width\":207.5},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":113.36971350613915,\"width\":207.5}]} -->\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\n<!-- /wp:envira/envira-gallery -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-15 11:23:24','2023-06-15 10:23:24','',17,'https://portfolio.localhost/?p=156',0,'revision','',0),
	(157,1,'2023-06-15 11:31:03','2023-06-15 10:31:03','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\n<!-- /wp:envira/envira-gallery -->\n\n<!-- wp:paragraph -->\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?></p>\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-15 11:31:03','2023-06-15 10:31:03','',17,'https://portfolio.localhost/?p=157',0,'revision','',0),
	(158,1,'2023-06-15 11:35:57','2023-06-15 10:35:57','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\n<!-- /wp:envira/envira-gallery -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-autosave-v1','','','2023-06-15 11:35:57','2023-06-15 10:35:57','',17,'https://portfolio.localhost/?p=158',0,'revision','',0),
	(159,1,'2023-06-15 18:41:50','2023-06-15 17:41:50','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:20:\"template-contact.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Champ pour Contact','champ-pour-contact','publish','closed','closed','','group_648b4cc8c2733','','','2023-06-15 18:41:50','2023-06-15 17:41:50','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=159',0,'acf-field-group','',0),
	(160,1,'2023-06-15 18:41:50','2023-06-15 17:41:50','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:48:\"Créeons quelque chose d’incroyable ensemble !\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','h1','title','publish','closed','closed','','field_648b4cc9575b4','','','2023-06-15 18:41:50','2023-06-15 17:41:50','',159,'https://portfolio.localhost/?post_type=acf-field&p=160',0,'acf-field','',0),
	(161,0,'2023-06-16 11:36:32','2023-06-16 10:36:32','','Blanchar Senga-Vita ','','publish','closed','closed','','blanchar-senga-vita-2','','','2023-06-16 11:36:32','2023-06-16 10:36:32','',0,'https://portfolio.localhost/message/blanchar-senga-vita-2/',0,'message','',0),
	(162,0,'2023-06-16 11:44:04','2023-06-16 10:44:04','','Blanchar Senga-Vita ','','publish','closed','closed','','blanchar-senga-vita-3','','','2023-06-16 11:44:04','2023-06-16 10:44:04','',0,'https://portfolio.localhost/message/blanchar-senga-vita-3/',0,'message','',0),
	(163,0,'2023-06-16 11:44:15','2023-06-16 10:44:15','oui','Blanchar Senga-Vita ','','publish','closed','closed','','blanchar-senga-vita-4','','','2023-06-16 11:44:15','2023-06-16 10:44:15','',0,'https://portfolio.localhost/message/blanchar-senga-vita-4/',0,'message','',0),
	(164,0,'2023-06-16 11:47:25','2023-06-16 10:47:25','','Blanchar Senga-Vita ','','publish','closed','closed','','blanchar-senga-vita-5','','','2023-06-16 11:47:25','2023-06-16 10:47:25','',0,'https://portfolio.localhost/message/blanchar-senga-vita-5/',0,'message','',0),
	(165,0,'2023-06-16 11:48:16','2023-06-16 10:48:16','oui','Blanchar Senga-Vita ','','publish','closed','closed','','blanchar-senga-vita-6','','','2023-06-16 11:48:16','2023-06-16 10:48:16','',0,'https://portfolio.localhost/message/blanchar-senga-vita-6/',0,'message','',0),
	(166,1,'2023-06-16 13:36:09','2023-06-16 12:36:09','','Mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-06-16 13:36:09','2023-06-16 12:36:09','',55,'https://portfolio.localhost/?p=166',0,'revision','',0),
	(167,1,'2023-06-19 15:49:56','2023-06-19 14:49:56','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-19 15:49:56','2023-06-19 14:49:56','',17,'https://portfolio.localhost/?p=167',0,'revision','',0),
	(168,1,'2023-06-19 15:56:50','2023-06-19 14:56:50','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"https://portfolio.localhost/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-19 15:56:50','2023-06-19 14:56:50','',17,'https://portfolio.localhost/?p=168',0,'revision','',0),
	(169,1,'2023-06-21 11:23:56','2023-06-21 10:23:56','','puissance40','','inherit','open','closed','','puissance40','','','2023-06-21 11:27:13','2023-06-21 10:27:13','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/puissance40.png',0,'attachment','image/png',0),
	(170,1,'2023-06-21 11:23:57','2023-06-21 10:23:57','','puissance41','','inherit','open','closed','','puissance41','','','2023-06-21 11:23:57','2023-06-21 10:23:57','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/puissance41.gif',0,'attachment','image/gif',0),
	(171,1,'2023-06-21 11:23:57','2023-06-21 10:23:57','','puissance42','','inherit','open','closed','','puissance42','','','2023-06-21 11:23:57','2023-06-21 10:23:57','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/puissance42.gif',0,'attachment','image/gif',0),
	(172,1,'2023-06-21 11:23:58','2023-06-21 10:23:58','','puissance43','','inherit','open','closed','','puissance43','','','2023-06-21 11:23:58','2023-06-21 10:23:58','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/puissance43.gif',0,'attachment','image/gif',0),
	(173,1,'2023-06-21 11:25:52','2023-06-21 10:25:52','','212947723-06569247-903e-4aff-91db-7b7f7ee56335','','inherit','open','closed','','212947723-06569247-903e-4aff-91db-7b7f7ee56335','','','2023-06-21 11:26:38','2023-06-21 10:26:38','',0,'https://portfolio.localhost/wp-content/uploads/2023/06/212947723-06569247-903e-4aff-91db-7b7f7ee56335.png',0,'attachment','image/png',0),
	(174,1,'2023-06-21 12:28:11','2023-06-21 11:28:11','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-06-21 12:28:11','2023-06-21 11:28:11','',17,'https://portfolio.localhost/?p=174',0,'revision','',0),
	(175,1,'2023-06-21 23:47:01','2023-06-21 22:47:01','azeraz','zaerazr azerazr <anchar2107@gmail.com>','','publish','closed','closed','','zaerazr-azerazr','','','2023-06-21 23:47:01','2023-06-21 22:47:01','',0,'https://portfolio.localhost/message/zaerazr-azerazr/',0,'message','',0),
	(176,1,'2023-06-21 23:47:31','2023-06-21 22:47:31','azeraz','zaerazr azerazr <anchar2107@gmail.com>','','publish','closed','closed','','zaerazr-azerazr-2','','','2023-06-21 23:47:31','2023-06-21 22:47:31','',0,'https://portfolio.localhost/message/zaerazr-azerazr-2/',0,'message','',0),
	(177,1,'2023-06-21 23:49:06','2023-06-21 22:49:06','azer','azer zaer <anchar2107@gmail.com>','','publish','closed','closed','','azer-zaer','','','2023-06-21 23:49:06','2023-06-21 22:49:06','',0,'https://portfolio.localhost/message/azer-zaer/',0,'message','',0),
	(180,1,'2023-08-19 15:51:08','2023-08-19 14:51:08','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-08-19 15:51:08','2023-08-19 14:51:08','',17,'https://portfolio.localhost/?p=180',0,'revision','',0),
	(181,1,'2023-08-19 15:52:15','2023-08-19 14:52:15','','Contatez-moi !','','inherit','closed','closed','','50-revision-v1','','','2023-08-19 15:52:15','2023-08-19 14:52:15','',50,'https://portfolio.localhost/?p=181',0,'revision','',0),
	(182,1,'2023-08-19 15:57:23','2023-08-19 14:57:23','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:36:\"https://github.com/blancharSengaVita\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Page github du projet','project_github','publish','closed','closed','','field_64e0d811b24d0','','','2023-08-22 10:49:48','2023-08-22 09:49:48','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=182',3,'acf-field','',0),
	(183,1,'2023-08-19 16:36:27','2023-08-19 15:36:27','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Design du projet','Design','publish','closed','closed','','field_64e0e1424a841','','','2023-08-22 10:49:48','2023-08-22 09:49:48','',93,'https://portfolio.localhost/?post_type=acf-field&#038;p=183',4,'acf-field','',0),
	(184,1,'2023-08-19 17:30:32','2023-08-19 16:30:32','a:8:{s:8:\"location\";a:1:{i:0;a:2:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}i:1;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"projet\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Titre-sro','titre-sro','acf-disabled','closed','closed','','group_64e0eddd00cc1','','','2023-08-19 17:36:35','2023-08-19 16:36:35','',0,'https://portfolio.localhost/?post_type=acf-field-group&#038;p=184',0,'acf-field-group','',0),
	(185,1,'2023-08-19 17:30:32','2023-08-19 16:30:32','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"Blanchar Senga-Vita\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','titre-sro','titre-sro','publish','closed','closed','','field_64e0edddf1421','','','2023-08-19 17:30:32','2023-08-19 16:30:32','',184,'https://portfolio.localhost/?post_type=acf-field&p=185',0,'acf-field','',0),
	(186,1,'2023-08-19 17:34:48','2023-08-19 16:34:48','a:8:{s:8:\"location\";a:2:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"projet\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Titre-sr','titre-sr','publish','closed','closed','','group_64e0ef285c4a4','','','2023-08-19 17:50:20','2023-08-19 16:50:20','',0,'https://portfolio.localhost/?p=186',0,'acf-field-group','',0),
	(187,1,'2023-08-19 17:34:48','2023-08-19 16:34:48','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"Blanchar Senga-Vita\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','titre-sr','title-sr','publish','closed','closed','','field_64e0ef285f1fe','','','2023-08-19 17:50:20','2023-08-19 16:50:20','',186,'https://portfolio.localhost/?post_type=acf-field&#038;p=187',0,'acf-field','',0),
	(188,1,'2023-08-19 18:50:18','2023-08-19 17:50:18','','Contatez-moi !','','inherit','closed','closed','','50-revision-v1','','','2023-08-19 18:50:18','2023-08-19 17:50:18','',50,'https://portfolio.localhost/?p=188',0,'revision','',0),
	(189,1,'2023-08-19 18:50:35','2023-08-19 17:50:35','','Mentions légales','','inherit','closed','closed','','55-revision-v1','','','2023-08-19 18:50:35','2023-08-19 17:50:35','',55,'https://portfolio.localhost/?p=189',0,'revision','',0),
	(190,1,'2023-08-21 15:32:16','2023-08-21 14:32:16','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','photo','pictures','publish','closed','closed','','field_64e374f4286d0','','','2023-08-21 15:32:16','2023-08-21 14:32:16','',10,'https://portfolio.localhost/?post_type=acf-field&p=190',6,'acf-field','',0),
	(191,1,'2023-08-21 15:32:16','2023-08-21 14:32:16','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','photo','picture','publish','closed','closed','','field_64e37557286d1','','','2023-08-21 15:40:38','2023-08-21 14:40:38','',190,'https://portfolio.localhost/?post_type=acf-field&#038;p=191',0,'acf-field','',0),
	(192,1,'2023-08-21 15:32:53','2023-08-21 14:32:53','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-08-21 15:32:53','2023-08-21 14:32:53','',17,'https://portfolio.localhost/?p=192',0,'revision','',0),
	(193,1,'2023-08-21 15:43:13','2023-08-21 14:43:13','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-08-21 15:43:13','2023-08-21 14:43:13','',17,'https://portfolio.localhost/?p=193',0,'revision','',0),
	(194,1,'2023-08-21 16:20:10','2023-08-21 15:20:10','','ampoule-2','','inherit','open','closed','','ampoule-2','','','2023-08-21 16:22:45','2023-08-21 15:22:45','',0,'https://portfolio.localhost/wp-content/uploads/2023/08/ampoule-2.svg',0,'attachment','image/svg+xml',0),
	(195,1,'2023-08-21 16:20:10','2023-08-21 15:20:10','','Eclaires-2','','inherit','open','closed','','eclaires-2','','','2023-08-21 16:20:10','2023-08-21 15:20:10','',0,'https://portfolio.localhost/wp-content/uploads/2023/08/Eclaires-2.svg',0,'attachment','image/svg+xml',0),
	(196,1,'2023-08-21 16:20:10','2023-08-21 15:20:10','','Logo-4','','inherit','open','closed','','logo-4','','','2023-08-21 16:22:50','2023-08-21 15:22:50','',0,'https://portfolio.localhost/wp-content/uploads/2023/08/Logo-4.svg',0,'attachment','image/svg+xml',0),
	(197,1,'2023-08-21 16:20:10','2023-08-21 15:20:10','','Soleil-2','','inherit','open','closed','','soleil-2','','','2023-08-21 16:20:10','2023-08-21 15:20:10','',0,'https://portfolio.localhost/wp-content/uploads/2023/08/Soleil-2.svg',0,'attachment','image/svg+xml',0),
	(198,1,'2023-08-21 16:21:13','2023-08-21 15:21:13','<!-- wp:envira/envira-gallery {\"galleryId\":153,\"title\":\"galerie CV\",\"columns\":\"1\",\"row_height\":150,\"margins\":\"custom\",\"lightbox_enabled\":1,\"lazyload_enabled\":1,\"lightbox_theme\":\"base\",\"images\":[{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.06\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.06.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":133,\"height\":1566,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.19\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.19.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":134,\"height\":1576,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.29\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.29.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":135,\"height\":1574,\"width\":2880},{\"status\":\"active\",\"src\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"title\":\"Capture d’écran 2023-06-15 à 10.43.45\",\"link\":\"//localhost:3000/wp-content/uploads/2023/06/Capture-decran-2023-06-15-a-10.43.45.png\",\"alt\":\"\",\"caption\":\"\",\"thumb\":\"\",\"id\":136,\"height\":1576,\"width\":2878}]} -->\r\n<div class=\"wp-block-envira-envira-gallery\">[envira-gallery id=\'153\']</div>\r\n<!-- /wp:envira/envira-gallery -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>&lt;?php <code>if ( function_exists( \'envira_gallery\' ) ) { envira_gallery( \'153\' ); }</code> ?&gt;</p>\r\n<!-- /wp:paragraph -->','Blanchar Senga-Vita','','inherit','closed','closed','','17-revision-v1','','','2023-08-21 16:21:13','2023-08-21 15:21:13','',17,'https://portfolio.localhost/?p=198',0,'revision','',0),
	(199,1,'2023-08-22 09:46:24','2023-08-22 08:46:24','','Clinicoeurs','','publish','closed','closed','','clinicoeurs','','','2023-08-22 09:57:50','2023-08-22 08:57:50','',0,'https://portfolio.localhost/?post_type=projet&#038;p=199',0,'projet','',0),
	(201,1,'2023-08-22 09:44:31','2023-08-22 08:44:31','','Capture d’écran 2023-08-22 à 10.43.01','','inherit','open','closed','','capture-decran-2023-08-22-a-10-43-01','','','2023-08-22 09:44:31','2023-08-22 08:44:31','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/Capture-decran-2023-08-22-a-10.43.01.png',0,'attachment','image/png',0),
	(202,1,'2023-08-22 09:44:32','2023-08-22 08:44:32','','Capture d’écran 2023-08-22 à 10.43.11','','inherit','open','closed','','capture-decran-2023-08-22-a-10-43-11','','','2023-08-22 09:44:32','2023-08-22 08:44:32','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/Capture-decran-2023-08-22-a-10.43.11.png',0,'attachment','image/png',0),
	(203,1,'2023-08-22 09:44:33','2023-08-22 08:44:33','','Capture d’écran 2023-08-22 à 10.44.00','','inherit','open','closed','','capture-decran-2023-08-22-a-10-44-00','','','2023-08-22 09:44:33','2023-08-22 08:44:33','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/Capture-decran-2023-08-22-a-10.44.00.png',0,'attachment','image/png',0),
	(204,1,'2023-08-22 09:50:16','2023-08-22 08:50:16','','Capture d’écran 2023-08-22 à 10.43.11','','inherit','open','closed','','capture-decran-2023-08-22-a-10-43-11-2','','','2023-08-22 09:50:31','2023-08-22 08:50:31','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/Capture-decran-2023-08-22-a-10.43.11-1.png',0,'attachment','image/png',0),
	(205,1,'2023-08-22 09:51:19','2023-08-22 08:51:19','','Capture d’écran 2023-08-22 à 10.50.46','','inherit','open','closed','','capture-decran-2023-08-22-a-10-50-46','','','2023-08-22 09:51:22','2023-08-22 08:51:22','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/Capture-decran-2023-08-22-a-10.50.46.png',0,'attachment','image/png',0),
	(206,1,'2023-08-22 09:55:36','2023-08-22 08:55:36','','chaussures-de-clowns_1-removebg-preview 1','','inherit','open','closed','','chaussures-de-clowns_1-removebg-preview-1','','','2023-08-22 09:55:36','2023-08-22 08:55:36','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/chaussures-de-clowns_1-removebg-preview-1.png',0,'attachment','image/png',0),
	(207,1,'2023-08-22 09:57:40','2023-08-22 08:57:40','','grand','','inherit','open','closed','','grand','','','2023-08-22 09:57:40','2023-08-22 08:57:40','',199,'https://portfolio.localhost/wp-content/uploads/2023/08/grand.png',0,'attachment','image/png',0),
	(208,1,'2023-08-22 12:41:09','2023-08-22 11:41:09','','Portfolio','','publish','closed','closed','','portfolio','','','2023-08-22 12:46:18','2023-08-22 11:46:18','',0,'https://portfolio.localhost/?post_type=projet&#038;p=208',0,'projet','',0),
	(209,1,'2023-08-22 12:40:34','2023-08-22 11:40:34','','Il y a pas besoin de photo après tout, vous déjà tout voir _p','','inherit','open','closed','','il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p','','','2023-08-22 12:40:34','2023-08-22 11:40:34','',208,'https://portfolio.localhost/wp-content/uploads/2023/08/Il-y-a-pas-besoin-de-photo-apres-tout-vous-deja-tout-voir-_p.svg',0,'attachment','image/svg+xml',0);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0),
	(5,4,0),
	(6,4,0),
	(7,4,0),
	(8,4,0),
	(69,5,0),
	(186,1,0);

/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,1),
	(4,4,'nav_menu','',0,4),
	(5,5,'nav_menu','',0,1),
	(6,6,'product_type','',0,0),
	(7,7,'product_type','',0,0),
	(8,8,'product_type','',0,0),
	(9,9,'product_type','',0,0),
	(10,10,'product_visibility','',0,0),
	(11,11,'product_visibility','',0,0),
	(12,12,'product_visibility','',0,0),
	(13,13,'product_visibility','',0,0),
	(14,14,'product_visibility','',0,0),
	(15,15,'product_visibility','',0,0),
	(16,16,'product_visibility','',0,0),
	(17,17,'product_visibility','',0,0),
	(18,18,'product_visibility','',0,0),
	(19,19,'product_cat','',0,0);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0),
	(4,'Navigation principale','navigation-principale',0),
	(5,'Navigation de pied de page','navigation-de-pied-de-page',0),
	(6,'simple','simple',0),
	(7,'grouped','grouped',0),
	(8,'variable','variable',0),
	(9,'external','external',0),
	(10,'exclude-from-search','exclude-from-search',0),
	(11,'exclude-from-catalog','exclude-from-catalog',0),
	(12,'featured','featured',0),
	(13,'outofstock','outofstock',0),
	(14,'rated-1','rated-1',0),
	(15,'rated-2','rated-2',0),
	(16,'rated-3','rated-3',0),
	(17,'rated-4','rated-4',0),
	(18,'rated-5','rated-5',0),
	(19,'Uncategorized','uncategorized',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','Blanchar'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'wp_user_level','10'),
	(14,1,'dismissed_wp_pointers','theme_editor_notice'),
	(15,1,'show_welcome_panel','0'),
	(17,1,'wp_dashboard_quick_press_last_post_id','179'),
	(18,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
	(19,1,'managenav-menuscolumnshidden','a:2:{i:0;s:11:\"css-classes\";i:1;s:3:\"xfn\";}'),
	(20,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),
	(21,1,'wp_persisted_preferences','a:2:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:1:{i:0;s:11:\"post-status\";}}s:9:\"_modified\";s:24:\"2023-06-15T09:51:46.330Z\";}'),
	(22,1,'nav_menu_recently_edited','4'),
	(23,1,'wp_user-settings','editor=tinymce&libraryContent=browse'),
	(24,1,'wp_user-settings-time','1687342156'),
	(25,1,'closedpostboxes_acf-field-group','a:0:{}'),
	(26,1,'metaboxhidden_acf-field-group','a:1:{i:0;s:7:\"slugdiv\";}'),
	(27,1,'meta-box-order_page','a:4:{s:15:\"acf_after_title\";s:23:\"acf-group_6454f845cfd74\";s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:59:\"revisionsdiv,commentstatusdiv,commentsdiv,slugdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
	(28,1,'screen_layout_page','2'),
	(29,1,'closedpostboxes_page','a:0:{}'),
	(30,1,'metaboxhidden_page','a:5:{i:0;s:12:\"revisionsdiv\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}'),
	(31,1,'meta-box-order_projet','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:22:\"submitdiv,postimagediv\";s:6:\"normal\";s:7:\"slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
	(32,1,'screen_layout_projet','2'),
	(33,1,'closedpostboxes_projet','a:0:{}'),
	(34,1,'metaboxhidden_projet','a:1:{i:0;s:7:\"slugdiv\";}'),
	(35,1,'_woocommerce_tracks_anon_id','woo:bYogt8qv9X6kWeLV4HcOn7gv'),
	(36,1,'wc_last_active','1686787200'),
	(37,1,'session_tokens','a:1:{s:64:\"8fb3ca016d15fcde0353eea6e42a4213a85bffe3c6e676335421aeff1554a262\";a:4:{s:10:\"expiration\";i:1692801969;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36\";s:5:\"login\";i:1692629169;}}');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'Blanchar','$P$BeDvAa1sS6yaiOkF8IhHkWGNqEKsf2.','blanchar','anchar2107@gmail.com','https://portfolio.localhost','2023-04-28 14:07:24','1683287138:$P$BnCVWIdzhVybo2aGPkCVLYelf8pO2p/',0,'Blanchar');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_admin_note_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;

CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonce_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nonce_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;

INSERT INTO `wp_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `actioned_text`, `nonce_action`, `nonce_name`)
VALUES
	(1,1,'notify-refund-returns-page','Edit page','https://portfolio.localhost/wp-admin/post.php?post=145&action=edit','actioned','',NULL,NULL),
	(2,2,'connect','Connect','?page=wc-addons&section=helper','unactioned','',NULL,NULL),
	(81,57,'learn-more','Learn more','https://woocommerce.com/posts/how-to-sell-online-courses-wordpress/?utm_source=inbox&utm_medium=product','actioned','',NULL,NULL),
	(160,3,'browse_extensions','Browse extensions','https://portfolio.localhost/wp-admin/admin.php?page=wc-addons','unactioned','',NULL,NULL),
	(161,4,'wayflyer_bnpl_q4_2021','Level up with funding','https://woocommerce.com/products/wayflyer/?utm_source=inbox_note&utm_medium=product&utm_campaign=wayflyer_bnpl_q4_2021','actioned','',NULL,NULL),
	(162,5,'wc_shipping_mobile_app_usps_q4_2021','Get WooCommerce Shipping','https://woocommerce.com/woocommerce-shipping/?utm_source=inbox_note&utm_medium=product&utm_campaign=wc_shipping_mobile_app_usps_q4_2021','actioned','',NULL,NULL),
	(163,6,'learn-more','Learn more','https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox','unactioned','',NULL,NULL),
	(164,7,'learn-more','Learn more','https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','actioned','',NULL,NULL),
	(165,8,'optimizing-the-checkout-flow','Learn more','https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox_note&utm_medium=product&utm_campaign=optimizing-the-checkout-flow','actioned','',NULL,NULL),
	(166,9,'qualitative-feedback-from-new-users','Share feedback','https://automattic.survey.fm/wc-pay-new','actioned','',NULL,NULL),
	(167,10,'share-feedback','Share feedback','http://automattic.survey.fm/paypal-feedback','unactioned','',NULL,NULL),
	(168,11,'get-started','Get started','https://woocommerce.com/products/google-listings-and-ads?utm_source=inbox_note&utm_medium=product&utm_campaign=get-started','actioned','',NULL,NULL),
	(169,12,'update-wc-subscriptions-3-0-15','View latest version','https://portfolio.localhost/wp-admin/&page=wc-addons&section=helper','actioned','',NULL,NULL),
	(170,13,'update-wc-core-5-4-0','How to update WooCommerce','https://docs.woocommerce.com/document/how-to-update-woocommerce/','actioned','',NULL,NULL),
	(171,16,'ppxo-pps-install-paypal-payments-1','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned','',NULL,NULL),
	(172,17,'ppxo-pps-install-paypal-payments-2','View upgrade guide','https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/','actioned','',NULL,NULL),
	(173,18,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
	(174,18,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(175,19,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
	(176,19,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(177,20,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
	(178,20,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(179,21,'learn-more','Learn more','https://woocommerce.com/posts/critical-vulnerability-detected-july-2021/?utm_source=inbox_note&utm_medium=product&utm_campaign=learn-more','unactioned','',NULL,NULL),
	(180,21,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(181,22,'share-feedback','Share feedback','https://automattic.survey.fm/store-management','unactioned','',NULL,NULL),
	(182,23,'learn-more','Learn more','https://developer.woocommerce.com/2022/03/10/woocommerce-3-5-10-6-3-1-security-releases/','unactioned','',NULL,NULL),
	(183,23,'woocommerce-core-paypal-march-2022-dismiss','Dismiss','','actioned','',NULL,NULL),
	(184,24,'learn-more','Learn more','https://developer.woocommerce.com/2022/03/10/woocommerce-3-5-10-6-3-1-security-releases/','unactioned','',NULL,NULL),
	(185,24,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(186,25,'pinterest_03_2022_update','Update Instructions','https://woocommerce.com/document/pinterest-for-woocommerce/?utm_source=inbox_note&utm_medium=product&utm_campaign=pinterest_03_2022_update#section-3','actioned','',NULL,NULL),
	(187,26,'store_setup_survey_survey_q2_2022_share_your_thoughts','Tell us how it’s going','https://automattic.survey.fm/store-setup-survey-2022','actioned','',NULL,NULL),
	(188,27,'wc-admin-wisepad3','Grow my business offline','https://woocommerce.com/products/wisepad3-card-reader/?utm_source=inbox_note&utm_medium=product&utm_campaign=wc-admin-wisepad3','actioned','',NULL,NULL),
	(189,28,'learn-more','Find out more','https://developer.woocommerce.com/2022/08/09/woocommerce-payments-3-9-4-4-5-1-security-releases/','unactioned','',NULL,NULL),
	(190,28,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(191,29,'learn-more','Find out more','https://developer.woocommerce.com/2022/08/09/woocommerce-payments-3-9-4-4-5-1-security-releases/','unactioned','',NULL,NULL),
	(192,29,'dismiss','Dismiss','','actioned','',NULL,NULL),
	(193,30,'google_listings_ads_custom_attribute_mapping_q4_2022','Learn more','https://woocommerce.com/document/google-listings-and-ads/?utm_source=inbox_note&utm_medium=product&utm_campaign=google_listings_ads_custom_attribute_mapping_q4_2022#attribute-mapping','actioned','',NULL,NULL),
	(194,31,'needs-update-eway-payment-gateway-rin-action-button-2022-12-20','See available updates','https://portfolio.localhost/wp-admin/update-core.php','unactioned','',NULL,NULL),
	(195,31,'needs-update-eway-payment-gateway-rin-dismiss-button-2022-12-20','Dismiss','#','actioned','',NULL,NULL),
	(196,32,'updated-eway-payment-gateway-rin-action-button-2022-12-20','See all updates','https://portfolio.localhost/wp-admin/update-core.php','unactioned','',NULL,NULL),
	(197,32,'updated-eway-payment-gateway-rin-dismiss-button-2022-12-20','Dismiss','#','actioned','',NULL,NULL),
	(198,33,'share-navigation-survey-feedback','Share feedback','https://automattic.survey.fm/new-ecommerce-plan-navigation','actioned','',NULL,NULL),
	(199,34,'woopay-beta-merchantrecruitment-activate-04MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
	(200,34,'woopay-beta-merchantrecruitment-activate-learnmore-04MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-activate-learnmore-04MAY23','unactioned','',NULL,NULL),
	(201,35,'woocommerce-wcpay-march-2023-update-needed-button','See Blog Post','https://developer.woocommerce.com/2023/03/23/critical-vulnerability-detected-in-woocommerce-payments-what-you-need-to-know','unactioned','',NULL,NULL),
	(202,35,'woocommerce-wcpay-march-2023-update-needed-dismiss-button','Dismiss','#','actioned','',NULL,NULL),
	(203,36,'tap_to_pay_iphone_q2_2023_no_wcpay','Simplify my payments','https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox_note&utm_medium=product&utm_campaign=tap_to_pay_iphone_q2_2023_no_wcpay','actioned','',NULL,NULL),
	(204,37,'tap_to_pay_iphone_q2_2023_with_wcpay','Set up Tap to Pay on iPhone','https://woocommerce.com/document/woocommerce-payments/in-person-payments/woocommerce-in-person-payments-tap-to-pay-on-iphone-quick-start-guide/?utm_source=inbox_note&utm_medium=product&utm_campaign=tap_to_pay_iphone_q2_2023_with_wcpay','actioned','',NULL,NULL),
	(205,38,'extension-settings','See available updates','https://portfolio.localhost/wp-admin/update-core.php','unactioned','',NULL,NULL),
	(206,38,'dismiss','Dismiss','#','actioned','',NULL,NULL),
	(207,39,'woopay-beta-merchantrecruitment-update-WCPay-04MAY23','Update WooCommerce Payments','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(208,39,'woopay-beta-merchantrecruitment-update-activate-04MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
	(209,40,'woopay-beta-existingmerchants-noaction-documentation-27APR23','Documentation','https://woocommerce.com/document/woopay-merchant-documentation/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-existingmerchants-noaction-documentation-27APR23','actioned','',NULL,NULL),
	(210,41,'woopay-beta-existingmerchants-update-WCPay-27APR23','Update WooCommerce Payments','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','actioned','',NULL,NULL),
	(211,42,'woopay-beta-merchantrecruitment-short-activate-04MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
	(212,42,'woopay-beta-merchantrecruitment-short-activate-learnmore-04MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-04MAY23','actioned','',NULL,NULL),
	(213,43,'woopay-beta-merchantrecruitment-short-update-WCPay-04MAY23','Update WooCommerce Payments','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(214,43,'woopay-beta-merchantrecruitment-short-update-activate-04MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','actioned','',NULL,NULL),
	(215,44,'woopay-beta-merchantrecruitment-short-activate-06MAY23-TESTA','Activate WooPay Test A','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(216,44,'woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTA','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTA','unactioned','',NULL,NULL),
	(217,45,'woopay-beta-merchantrecruitment-short-activate-06MAY23-TESTB','Activate WooPay Test B','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(218,45,'woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTA','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTA','unactioned','',NULL,NULL),
	(219,46,'woopay-beta-merchantrecruitment-short-activate-06MAY23-TESTC','Activate WooPay Test C','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(220,46,'woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTC','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTC','unactioned','',NULL,NULL),
	(221,47,'woopay-beta-merchantrecruitment-short-activate-06MAY23-TESTD','Activate WooPay Test D','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(222,47,'woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTD','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-06MAY23-TESTD','unactioned','',NULL,NULL),
	(223,48,'woopay-beta-merchantrecruitment-short-activate-button-09MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(224,48,'woopay-beta-merchantrecruitment-short-activate-learnmore-button2-09MAY23','Learn More','https://woocommerce.com/woopay-businesses/?utm_source=inbox_note&utm_medium=product&utm_campaign=woopay-beta-merchantrecruitment-short-activate-learnmore-button2-09MAY23','unactioned','',NULL,NULL),
	(225,49,'woopay-beta-merchantrecruitment-short-update-WCPay-09MAY23','Update WooCommerce Payments','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(226,49,'woopay-beta-merchantrecruitment-short-update-activate-09MAY23','Activate WooPay','https://portfolio.localhost/wp-admin/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments&method=platform_checkout','unactioned','',NULL,NULL),
	(227,50,'ipp_refresh_q2_2023_us_inbox_notification','Grow my business on the go','https://woocommerce.com/in-person-payments/?utm_source=inbox_note&utm_medium=product&utm_campaign=ipp_refresh_q2_2023_us_inbox_notification','actioned','',NULL,NULL),
	(228,51,'ipp_refresh_q2_2023_ca_inbox_notification','Grow my business on the go','https://woocommerce.com/in-person-payments/?utm_source=inbox_note&utm_medium=product&utm_campaign=ipp_refresh_q2_2023_ca_inbox_notification','actioned','',NULL,NULL),
	(229,52,'woocommerce-WCStripe-May-2023-updated-needed-Plugin-Settings','See available updates','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(230,52,'woocommerce-WCStripe-May-2023-updated-needed-Plugin-Settings-dismiss','Dismiss','#','actioned','',NULL,NULL),
	(231,53,'woocommerce-WCPayments-June-2023-updated-needed-Plugin-Settings','See available updates','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(232,53,'woocommerce-WCPayments-June-2023-updated-needed-Dismiss','Dismiss','#','actioned','',NULL,NULL),
	(233,54,'woocommerce-WCSubscriptions-June-2023-updated-needed-Plugin-Settings','See available updates','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(234,54,'woocommerce-WCSubscriptions-June-2023-updated-needed-dismiss','Dismiss','#','actioned','',NULL,NULL),
	(235,55,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','See available updates','https://portfolio.localhost/wp-admin/plugins.php?plugin_status=all','unactioned','',NULL,NULL),
	(236,55,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','Dismiss','#','actioned','',NULL,NULL),
	(237,56,'woocommerce_hpos_1st_notification_q2_2023','Learn more about HPOS','https://woocommerce.com/posts/platform-update-high-performance-order-storage-for-woocommerce/?utm_source=inbox_note&utm_medium=product&utm_campaign=woocommerce_hpos_1st_notification_q2_2023','actioned','',NULL,NULL);

/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_admin_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_admin_notes`;

CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;

INSERT INTO `wp_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`, `layout`, `image`, `is_deleted`, `is_read`, `icon`)
VALUES
	(1,'wc-refund-returns-page','info','en_US','Setup a Refund and Returns Policy page to boost your store\'s credibility.','We have created a sample draft Refund and Returns Policy page for you. Please have a look and update it to fit your store.','{}','unactioned','woocommerce-core','2023-06-15 09:35:19',NULL,0,'plain','',0,0,'info'),
	(2,'wc-admin-wc-helper-connection','info','en_US','Connect to WooCommerce.com','Connect to get important product notifications and updates.','{}','unactioned','woocommerce-admin','2023-06-15 09:35:20',NULL,0,'plain','',0,1,'info'),
	(3,'new_in_app_marketplace_2021','info','en_US','Customize your store with extensions','Check out our NEW Extensions tab to see our favorite extensions for customizing your store, and discover the most popular extensions in the WooCommerce Marketplace.','{}','unactioned','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(4,'wayflyer_bnpl_q4_2021','marketing','en_US','Grow your business with funding through Wayflyer','Fast, flexible financing to boost cash flow and help your business grow – one fee, no interest rates, penalties, equity, or personal guarantees. Based on your store’s performance, Wayflyer provides funding and analytical insights to invest in your business.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(5,'wc_shipping_mobile_app_usps_q4_2021','marketing','en_US','Print and manage your shipping labels with WooCommerce Shipping and the WooCommerce Mobile App','Save time by printing, purchasing, refunding, and tracking shipping labels generated by <a href=\"https://woocommerce.com/woocommerce-shipping/\">WooCommerce Shipping</a> – all directly from your mobile device!','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(6,'woocommerce-services','info','en_US','WooCommerce Shipping & Tax','WooCommerce Shipping &amp; Tax helps get your store \"ready to sell\" as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(7,'your-first-product','info','en_US','Your first product','That’s huge! You’re well on your way to building a successful online store — now it’s time to think about how you’ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(8,'wc-admin-optimizing-the-checkout-flow','info','en_US','Optimizing the checkout flow','It’s crucial to get your store’s checkout as smooth as possible to avoid losing sales. Let’s take a look at how you can optimize the checkout experience for your shoppers.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(9,'wc-payments-qualitative-feedback','info','en_US','WooCommerce Payments setup - let us know what you think','Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(10,'share-your-feedback-on-paypal','info','en_US','Share your feedback on PayPal','Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(11,'google_listings_and_ads_install','marketing','en_US','Drive traffic and sales with Google','Reach online shoppers to drive traffic and sales for your store by showcasing products across Google, for free or with ads.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(12,'wc-subscriptions-security-update-3-0-15','info','en_US','WooCommerce Subscriptions security update!','We recently released an important security update to WooCommerce Subscriptions. To ensure your site’s data is protected, please upgrade <strong>WooCommerce Subscriptions to version 3.0.15</strong> or later.<br /><br />Click the button below to view and update to the latest Subscriptions version, or log in to <a href=\"https://woocommerce.com/my-dashboard\">WooCommerce.com Dashboard</a> and navigate to your <strong>Downloads</strong> page.<br /><br />We recommend always using the latest version of WooCommerce Subscriptions, and other software running on your site, to ensure maximum security.<br /><br />If you have any questions we are here to help — just <a href=\"https://woocommerce.com/my-account/create-a-ticket/\">open a ticket</a>.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(13,'woocommerce-core-update-5-4-0','info','en_US','Update to WooCommerce 5.4.1 now','WooCommerce 5.4.1 addresses a checkout issue discovered in WooCommerce 5.4. We recommend upgrading to WooCommerce 5.4.1 as soon as possible.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(14,'wcpay-promo-2020-11','marketing','en_US','wcpay-promo-2020-11','wcpay-promo-2020-11','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(15,'wcpay-promo-2020-12','marketing','en_US','wcpay-promo-2020-12','wcpay-promo-2020-12','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(16,'ppxo-pps-upgrade-paypal-payments-1','info','en_US','Get the latest PayPal extension for WooCommerce','Heads up! There’s a new PayPal on the block!<br /><br />Now is a great time to upgrade to our latest <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension</a> to continue to receive support and updates with PayPal.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, and pay later options with the all-new PayPal extension for WooCommerce.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(17,'ppxo-pps-upgrade-paypal-payments-2','info','en_US','Upgrade your PayPal experience!','Get access to a full suite of PayPal payment methods, extensive currency and country coverage, offer subscription and recurring payments, and the new PayPal pay later options.<br /><br />Start using our <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">latest PayPal today</a> to continue to receive support and updates.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(18,'woocommerce-core-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(19,'woocommerce-blocks-sqli-july-2021-need-to-update','update','en_US','Action required: Critical vulnerabilities in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we are working with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br />Our investigation into this vulnerability is ongoing, but <strong>we wanted to let you know now about the importance of updating immediately</strong>.<br /><br />For more information on which actions you should take, as well as answers to FAQs, please urgently review our blog post detailing this issue.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(20,'woocommerce-core-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(21,'woocommerce-blocks-sqli-july-2021-store-patched','update','en_US','Solved: Critical vulnerabilities patched in WooCommerce Blocks','In response to a critical vulnerability identified on July 13, 2021, we worked with the WordPress Plugins Team to deploy software updates to stores running WooCommerce (versions 3.3 to 5.5) and the WooCommerce Blocks feature plugin (versions 2.5 to 5.5).<br /><br /><strong>Your store has been updated to the latest secure version(s)</strong>. For more information and answers to FAQs, please review our blog post detailing this issue.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(22,'habit-moment-survey','marketing','en_US','We’re all ears! Share your experience so far with WooCommerce','We’d love your input to shape the future of WooCommerce together. Feel free to share any feedback, ideas or suggestions that you have.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(23,'woocommerce-core-paypal-march-2022-updated','update','en_US','Security auto-update of WooCommerce','<strong>Your store has been updated to the latest secure version of WooCommerce</strong>. We worked with WordPress to deploy PayPal Standard security updates for stores running WooCommerce (version 3.5 to 6.3). It’s recommended to disable PayPal Standard, and use <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal Payments</a> to accept PayPal.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(24,'woocommerce-core-paypal-march-2022-updated-nopp','update','en_US','Security auto-update of WooCommerce','<strong>Your store has been updated to the latest secure version of WooCommerce</strong>. We worked with WordPress to deploy security updates related to PayPal Standard payment gateway for stores running WooCommerce (version 3.5 to 6.3).','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(25,'pinterest_03_2022_update','marketing','en_US','Your Pinterest for WooCommerce plugin is out of date!','Update to the latest version of Pinterest for WooCommerce to continue using this plugin and keep your store connected with Pinterest. To update, visit <strong>Plugins &gt; Installed Plugins</strong>, and click on “update now” under Pinterest for WooCommerce.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(26,'store_setup_survey_survey_q2_2022','survey','en_US','How is your store setup going?','Our goal is to make sure you have all the right tools to start setting up your store in the smoothest way possible.\r\nWe’d love to know if we hit our mark and how we can improve. To collect your thoughts, we made a 2-minute survey.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(27,'wc-admin-wisepad3','marketing','en_US','Take your business on the go in Canada with WooCommerce In-Person Payments','Quickly create new orders, accept payment in person for orders placed online, and automatically sync your inventory – no matter where your business takes you. With WooCommerce In-Person Payments and the WisePad 3 card reader, you can bring the power of your store anywhere.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(28,'woocommerce-payments-august-2022-need-to-update','update','en_US','Action required: Please update WooCommerce Payments','An updated secure version of WooCommerce Payments is available – please ensure that you’re using the latest patch version. For more information on what action you need to take, please review the article below.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(29,'woocommerce-payments-august-2022-store-patched','update','en_US','WooCommerce Payments has been automatically updated','You’re now running the latest secure version of WooCommerce Payments. We’ve worked with the WordPress Plugins team to deploy a security update to stores running WooCommerce Payments (version 3.9 to 4.5). For further information, please review the article below.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(30,'google_listings_ads_custom_attribute_mapping_q4_2022','marketing','en_US','Our latest improvement to the Google Listings & Ads extension: Attribute Mapping','You spoke, we listened. This new feature enables you to easily upload your products, customize your product attributes in one place, and target shoppers with more relevant ads. Extend how far your ad dollars go with each campaign.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(31,'needs-update-eway-payment-gateway-rin-2022-12-20','update','en_US','Security vulnerability patched in WooCommerce Eway Gateway','In response to a potential vulnerability identified in WooCommerce Eway Gateway versions 3.1.0 to 3.5.0, we’ve worked to deploy security fixes and have released an updated version.\r\nNo external exploits have been detected, but we recommend you update to your latest supported version 3.1.26, 3.2.3, 3.3.1, 3.4.6, or 3.5.1','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(32,'updated-eway-payment-gateway-rin-2022-12-20','update','en_US','WooCommerce Eway Gateway has been automatically updated','Your store is now running the latest secure version of WooCommerce Eway Gateway. We worked with the WordPress Plugins team to deploy a software update to stores running WooCommerce Eway Gateway (versions 3.1.0 to 3.5.0) in response to a security vulnerability that was discovered.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(33,'ecomm-wc-navigation-survey-2023','info','en_US','Navigating WooCommerce on WordPress.com','We are improving the WooCommerce navigation on WordPress.com and would love your help to make it better! Please share your experience with us in this 2-minute survey.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(34,'woopay-beta-merchantrecruitment-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','WooPay, a new express checkout feature built into WooCommerce Payments, is now available —and we’re inviting you to be one of the first to try it. \r\n<br><br>\r\nBoost conversions by offering your customers a simple, secure way to pay with a single click.\r\n<br><br>\r\nGet started in seconds.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(35,'woocommerce-wcpay-march-2023-update-needed','update','en_US','Action required: Security update for WooCommerce Payments','<strong>Your store requires a security update for WooCommerce Payments</strong>. Please update to the latest version of WooCommerce Payments immediately to address a potential vulnerability discovered on March 22. For more information on how to update, visit this WooCommerce Developer Blog Post.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(36,'tap_to_pay_iphone_q2_2023_no_wcpay','marketing','en_US','Accept in-person contactless payments on your iPhone','Tap to Pay on iPhone and WooCommerce Payments is quick, secure, and simple to set up — no extra terminals or card readers are needed. Accept contactless debit and credit cards, Apple Pay, and other NFC digital wallets in person.','{}','unactioned','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,1,'info'),
	(37,'tap_to_pay_iphone_q2_2023_with_wcpay','marketing','en_US','New: accept in-person contactless payments on your iPhone','Tap to Pay on iPhone is quick, secure, and simple to set up in WooCommerce Payments — no extra terminals or card readers are needed. Accept contactless debit and credit cards, Apple Pay, and other NFC digital wallets in person in a few short steps!','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(38,'woocommerce-WCPreOrders-april-2023-update-needed','update','en_US','Action required: Security update of WooCommerce Pre-Orders extension','<strong>Your store requires a security update for the WooCommerce Pre-Orders extension</strong>. Please update the WooCommerce Pre-Orders extension immediately to address a potential vulnerability discovered on April 11.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(39,'woopay-beta-merchantrecruitment-update-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','WooPay, a new express checkout feature built into WooCommerce Payments, is now available — and you’re invited to try it. \r\n<br /><br />\r\nBoost conversions by offering your customers a simple, secure way to pay with a single click.\r\n<br /><br />\r\nUpdate WooCommerce Payments to get started.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(40,'woopay-beta-existingmerchants-noaction-27APR23','info','en_US','WooPay is back!','Thanks for previously trying WooPay, the express checkout feature built into WooCommerce Payments. We’re excited to announce that WooPay availability has resumed. No action is required on your part.\r\n<br /><br />\r\nYou can now continue boosting conversions by offering your customers a simple, secure way to pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(41,'woopay-beta-existingmerchants-update-27APR23','info','en_US','WooPay is back!','Thanks for previously trying WooPay, the express checkout feature built into WooCommerce Payments. We’re excited to announce that WooPay availability has resumed.\r\n<br /><br />\r\n\r\nUpdate to the latest WooCommerce Payments version to continue boosting conversions by offering your customers a simple, secure way to pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(42,'woopay-beta-merchantrecruitment-short-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(43,'woopay-beta-merchantrecruitment-short-update-04MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, our new express checkout feature. <br>Boost conversions by letting customers pay with a single click. <br><br>Update to the latest version of WooCommerce Payments to get started.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(44,'woopay-beta-merchantrecruitment-short-06MAY23-TESTA','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(45,'woopay-beta-merchantrecruitment-short-06MAY23-TESTB','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(46,'woopay-beta-merchantrecruitment-short-06MAY23-TESTC','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(47,'woopay-beta-merchantrecruitment-short-06MAY23-TESTD','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(48,'woopay-beta-merchantrecruitment-short-09MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, a new express checkout feature for WooCommerce Payments. \r\n<br><br>\r\nBoost conversions by letting customers pay with a single click.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(49,'woopay-beta-merchantrecruitment-short-update-09MAY23','info','en_US','Increase conversions with WooPay — our fastest checkout yet','Be one of the first to try WooPay, our new express checkout feature. <br>Boost conversions by letting customers pay with a single click. <br><br>Update to the latest version of WooCommerce Payments to get started.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(50,'ipp_refresh_q2_2023_us_inbox_notification','marketing','en_US','Grow on the go with in-person payments','Sell your products or services on the go with the M2 card reader – a quick, synchronized, and secure way to take payments, no matter where you are. Create an order using the WooCommerce mobile app and connect your card reader to accept payments.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(51,'ipp_refresh_q2_2023_ca_inbox_notification','marketing','en_US','Grow on the go with in-person payments','Sell your products or services on the go with the WisePad 3 card reader – a quick, synchronized, and secure way to take payments, no matter where you are. Create an order using the WooCommerce mobile app and connect your card reader to accept payments.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(52,'woocommerce-WCstripe-May-2023-updated-needed','update','en_US','Action required: Security update of WooCommerce Stripe plugin','<strong>Your store requires a security update for the WooCommerce Stripe plugin</strong>. Please update the WooCommerce Stripe plugin immediately to address a potential vulnerability.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(53,'woocommerce-WCPayments-June-2023-updated-needed','update','en_US','Action required: Security update of WooCommerce Payments','<strong>Your store requires a security update for the WooCommerce Payments plugin</strong>. Please update the WooCommerce Payments plugin immediately to address a potential vulnerability.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(54,'woocommerce-WCSubscriptions-June-2023-updated-needed','marketing','en_US','Action required: Security update of WooCommerce Subscriptions','<strong>Your store requires a security update for the WooCommerce Subscriptions plugin</strong>. Please update the WooCommerce Subscriptions plugin immediately to address a potential vulnerability.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(55,'woocommerce-WCReturnsWarranty-June-2023-updated-needed','update','en_US','Action required: Security update of WooCommerce Returns and Warranty Requests extension','<strong>Your store requires a security update for the Returns and Warranty Requests extension</strong>.  Please update to the latest version of the WooCommerce Returns and Warranty Requests extension immediately to address a potential vulnerability discovered on May 31.','{}','pending','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,0,'info'),
	(56,'woocommerce_hpos_1st_notification_q2_2023','marketing','en_US','High-Performance Order Storage (HPOS) is on its way','Our team is targeting August 2023 to roll out a major database upgrade that can unlock faster checkout and order creation for your customers — and lightning-quick order lookup for you. Enablement is optional and you won’t be forced to update, but read on to see why this was our most requested new feature.','{}','unactioned','woocommerce.com','2023-06-15 09:35:20',NULL,0,'plain','',0,1,'info'),
	(57,'wc-admin-selling-online-courses','marketing','en_US','Do you want to sell online courses?','Online courses are a great solution for any business that can teach a new skill. Since courses don’t require physical product development or shipping, they’re affordable, fast to create, and can generate passive income for years to come. In this article, we provide you more information about selling courses using WooCommerce.','{}','unactioned','woocommerce-admin','2023-06-15 09:35:59',NULL,0,'plain','',0,1,'info');

/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_category_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_category_lookup`;

CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;

INSERT INTO `wp_wc_category_lookup` (`category_tree_id`, `category_id`)
VALUES
	(19,19);

/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_customer_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;

CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_download_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_download_log`;

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_order_coupon_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;

CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint unsigned NOT NULL,
  `coupon_id` bigint NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_order_product_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;

CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_order_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_order_stats`;

CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_paid` datetime DEFAULT '0000-00-00 00:00:00',
  `date_completed` datetime DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_order_tax_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;

CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint unsigned NOT NULL,
  `tax_rate_id` bigint unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_product_attributes_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_product_attributes_lookup`;

CREATE TABLE `wp_wc_product_attributes_lookup` (
  `product_id` bigint NOT NULL,
  `product_or_parent_id` bigint NOT NULL,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term_id` bigint NOT NULL,
  `is_variation_attribute` tinyint(1) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_or_parent_id`,`term_id`,`product_id`,`taxonomy`),
  KEY `is_variation_attribute_term_id` (`is_variation_attribute`,`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_product_download_directories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_product_download_directories`;

CREATE TABLE `wp_wc_product_download_directories` (
  `url_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(256) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_wc_product_download_directories` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_download_directories` DISABLE KEYS */;

INSERT INTO `wp_wc_product_download_directories` (`url_id`, `url`, `enabled`)
VALUES
	(1,'file:///Users/blanchar/ecole/annee-4/design-web/sites/Portfolio/wp-content/uploads/woocommerce_uploads/',1),
	(2,'https://portfolio.localhost/wp-content/uploads/woocommerce_uploads/',1);

/*!40000 ALTER TABLE `wp_wc_product_download_directories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_product_meta_lookup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;

CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_rate_limits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_rate_limits`;

CREATE TABLE `wp_wc_rate_limits` (
  `rate_limit_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rate_limit_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rate_limit_expiry` bigint unsigned NOT NULL,
  `rate_limit_remaining` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`rate_limit_id`),
  UNIQUE KEY `rate_limit_key` (`rate_limit_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_reserved_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;

CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_wc_tax_rate_classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;

CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;

INSERT INTO `wp_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`)
VALUES
	(1,'Reduced rate','reduced-rate'),
	(2,'Zero rate','zero-rate');

/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wc_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wc_webhooks`;

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint NOT NULL,
  `failure_count` smallint NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_api_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_attribute_taxonomies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_downloadable_product_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_log`;

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_order_itemmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_payment_tokenmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_payment_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`)
VALUES
	(1,'1','a:7:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:737:\"a:27:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"BE\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"BE\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:20:\"anchar2107@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";}\";}',1686994582);

/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_woocommerce_shipping_zone_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_shipping_zone_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint unsigned NOT NULL,
  `instance_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_shipping_zones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_tax_rate_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint unsigned NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_woocommerce_tax_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint unsigned NOT NULL,
  `tax_rate_compound` int NOT NULL DEFAULT '0',
  `tax_rate_shipping` int NOT NULL DEFAULT '1',
  `tax_rate_order` bigint unsigned NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
