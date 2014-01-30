-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2014 at 10:59 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coxnkings`
--

-- --------------------------------------------------------

--
-- Table structure for table `abuse_reports`
--

DROP TABLE IF EXISTS `abuse_reports`;
CREATE TABLE `abuse_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(11) NOT NULL DEFAULT '0',
  `report_time` datetime DEFAULT NULL,
  `ip_address` char(16) CHARACTER SET latin1 DEFAULT NULL,
  `reason` text CHARACTER SET latin1,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roll_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `key` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `alternate_url` varchar(255) NOT NULL,
  `type` enum('video','image','text') NOT NULL,
  `author` varchar(150) NOT NULL,
  `channel_name` varchar(150) NOT NULL,
  `authentication` varchar(150) NOT NULL,
  `notes` text NOT NULL,
  `flags` varchar(50) NOT NULL,
  `is_ugc` tinyint(1) NOT NULL DEFAULT '0',
  `thumb_image` varchar(255) NOT NULL,
  `alternate_image` varchar(255) NOT NULL,
  `status` enum('pending','active','inactive') NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_fast` (`gallery_id`,`id`),
  FULLTEXT KEY `usersearch` (`user_id`),
  FULLTEXT KEY `cmssearch` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_views`
--

DROP TABLE IF EXISTS `content_views`;
CREATE TABLE `content_views` (
  `content_id` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `environment_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `content_votes`
--

DROP TABLE IF EXISTS `content_votes`;
CREATE TABLE `content_votes` (
  `content_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `auth_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `environment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `environments`
--

DROP TABLE IF EXISTS `environments`;
CREATE TABLE `environments` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` char(64) DEFAULT NULL,
  `shortcode` varchar(3) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '-1 is Pending, 0 Inactive, 1 Active',
  `is_ugc` tinyint(1) NOT NULL DEFAULT '0',
  `voting_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_moderated` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geolocation_countries`
--

DROP TABLE IF EXISTS `geolocation_countries`;
CREATE TABLE `geolocation_countries` (
  `country_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` char(16) CHARACTER SET latin1 DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seo_title` char(64) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '1',
  `environment_id` int(10) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) unsigned DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `thumb` varchar(255) DEFAULT NULL,
  `share_text` text,
  `theater_share_text` text,
  `share_url` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_galleries`
--

DROP TABLE IF EXISTS `page_galleries`;
CREATE TABLE `page_galleries` (
  `page_id` int(11) unsigned NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `order_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`,`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page_views`
--

DROP TABLE IF EXISTS `page_views`;
CREATE TABLE `page_views` (
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `views` int(11) unsigned DEFAULT NULL,
  `environment_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`,`date`,`environment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page_widgets`
--

DROP TABLE IF EXISTS `page_widgets`;
CREATE TABLE `page_widgets` (
  `page_id` int(11) unsigned NOT NULL,
  `widget_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`page_id`,`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_calls`
--

DROP TABLE IF EXISTS `social_calls`;
CREATE TABLE `social_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `source` enum('twitter','facebook','googleplus') COLLATE utf8_unicode_ci NOT NULL,
  `keyword_string` text COLLATE utf8_unicode_ci NOT NULL,
  `base_api_url` text COLLATE utf8_unicode_ci NOT NULL,
  `post_count` int(11) NOT NULL DEFAULT '100',
  `frequency` int(11) NOT NULL DEFAULT '3600',
  `last_call_time` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `next_call_time` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_posts`
--

DROP TABLE IF EXISTS `social_posts`;
CREATE TABLE `social_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) NOT NULL,
  `source` enum('twitter','facebook','googleplus') COLLATE utf8_unicode_ci NOT NULL,
  `post_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `post_hash` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `post_text` text COLLATE utf8_unicode_ci NOT NULL,
  `post_lang` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_source` text COLLATE utf8_unicode_ci,
  `post_url` text COLLATE utf8_unicode_ci,
  `post_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_story_text` text COLLATE utf8_unicode_ci,
  `post_picture` text COLLATE utf8_unicode_ci,
  `post_link` text COLLATE utf8_unicode_ci,
  `post_name` text COLLATE utf8_unicode_ci,
  `post_caption` text COLLATE utf8_unicode_ci,
  `post_description` text COLLATE utf8_unicode_ci,
  `user_category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_profile_image` text COLLATE utf8_unicode_ci,
  `user_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_screen_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_lang` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_location` text COLLATE utf8_unicode_ci,
  `user_followers_count` int(10) NOT NULL DEFAULT '0',
  `user_friend_count` int(10) NOT NULL DEFAULT '0',
  `user_status_count` int(10) NOT NULL DEFAULT '0',
  `post_likes` int(11) NOT NULL DEFAULT '0',
  `post_comments` int(11) NOT NULL DEFAULT '0',
  `user_url` text COLLATE utf8_unicode_ci,
  `post_status` enum('new','approved','rejected','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `date_published` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `date_published_ts` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_streams`
--

DROP TABLE IF EXISTS `social_streams`;
CREATE TABLE `social_streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_phrase` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `is_profile` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `is_twitter` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `is_facebook` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `is_gplus` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `status` enum('active','inactive','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email_id` varchar(256) NOT NULL,
  `password` varchar(128) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `profile_image` varchar(256) NOT NULL,
  `passport` enum('1','0') NOT NULL DEFAULT '0',
  `facebook` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `google_plus` varchar(100) NOT NULL,
  `youtube` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `status` enum('active','pending','deleted') NOT NULL DEFAULT 'pending',
  `verification_code` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `data` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widget_types`
--

DROP TABLE IF EXISTS `widget_types`;
CREATE TABLE `widget_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(150) DEFAULT NULL,
  `form_name` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `social_calls`
--
ALTER TABLE `social_calls`
  ADD CONSTRAINT `social_calls_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `social_streams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `social_posts`
--
ALTER TABLE `social_posts`
  ADD CONSTRAINT `social_posts_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `social_streams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
