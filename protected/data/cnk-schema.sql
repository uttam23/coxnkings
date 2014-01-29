-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 29, 2014 at 04:34 PM
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
  `content_id` int(11) NOT NULL DEFAULT '0',
  `report_time` datetime DEFAULT NULL,
  `ip_address` char(16) CHARACTER SET latin1 DEFAULT NULL,
  `reason` text CHARACTER SET latin1,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
CREATE TABLE `calls` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) DEFAULT NULL,
  `category_voting` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(15) DEFAULT NULL,
  `category_sort` enum('asc','desc') NOT NULL DEFAULT 'desc',
  `metadata` text,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=491 ;

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
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `slide` text,
  `add_date` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `origin_id` int(11) DEFAULT NULL,
  `order_id` int(11) unsigned NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  `notes` text,
  `meta` text,
  `is_ugc` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `gallery_fast` (`gallery_id`,`content_id`),
  FULLTEXT KEY `usersearch` (`user_id`,`title`,`description`),
  FULLTEXT KEY `cmssearch` (`user_id`,`title`,`description`,`notes`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3779 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_extended_data`
--

DROP TABLE IF EXISTS `content_extended_data`;
CREATE TABLE `content_extended_data` (
  `content_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `value` char(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`,`key`),
  KEY `reversed` (`key`,`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_media`
--

DROP TABLE IF EXISTS `content_media`;
CREATE TABLE `content_media` (
  `content_id` int(11) unsigned NOT NULL,
  `media_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`content_id`,`media_id`,`order_id`),
  KEY `content_media_media_idx` (`media_id`,`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `content_views`
--

DROP TABLE IF EXISTS `content_views`;
CREATE TABLE `content_views` (
  `content_id` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `environment_id` int(11) NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`,`date`,`environment_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `environments`
--

DROP TABLE IF EXISTS `environments`;
CREATE TABLE `environments` (
  `environment_id` int(11) NOT NULL DEFAULT '0',
  `environment_name` char(64) DEFAULT NULL,
  `environment_canonical_name` char(64) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`environment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `gallery_id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_name` varchar(128) NOT NULL,
  `gallery_thumb` varchar(255) DEFAULT NULL,
  `gallery_description` varchar(512) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `region_id` int(11) NOT NULL DEFAULT '1',
  `gallery_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categories`
--

DROP TABLE IF EXISTS `gallery_categories`;
CREATE TABLE `gallery_categories` (
  `category_id` int(11) unsigned NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `order_id` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`,`gallery_id`,`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_config`
--

DROP TABLE IF EXISTS `gallery_config`;
CREATE TABLE `gallery_config` (
  `gallery_id` int(11) NOT NULL DEFAULT '0',
  `config_id` char(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`gallery_id`,`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_config_options`
--

DROP TABLE IF EXISTS `gallery_config_options`;
CREATE TABLE `gallery_config_options` (
  `config_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('string','value','boolean') DEFAULT 'boolean',
  `regular_config` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `config_name` char(255) DEFAULT NULL,
  `depends_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_views`
--

DROP TABLE IF EXISTS `gallery_views`;
CREATE TABLE `gallery_views` (
  `gallery_id` int(11) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `views` int(11) unsigned DEFAULT NULL,
  `environment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`gallery_id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=247 ;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_media_id` text,
  `media_type` int(11) DEFAULT NULL,
  `attribution_user_id` varchar(255) DEFAULT NULL,
  `attribution_user_name` varchar(255) DEFAULT NULL,
  `attribution_url` text,
  `duration` int(11) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `large` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `orig_file` varchar(255) DEFAULT NULL,
  `authsub_key` text,
  `alt_thumb` varchar(255) DEFAULT NULL,
  `alt_small` varchar(255) DEFAULT NULL,
  `alt_medium` varchar(255) DEFAULT NULL,
  `alt_large` varchar(255) DEFAULT NULL,
  `metadata` text,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3883 ;

-- --------------------------------------------------------

--
-- Table structure for table `media_views`
--

DROP TABLE IF EXISTS `media_views`;
CREATE TABLE `media_views` (
  `media_id` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `environment_id` int(11) NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`media_id`,`date`,`environment_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `seo_title` char(64) DEFAULT NULL,
  `template` char(64) DEFAULT NULL,
  `page_css` text,
  `page_skin` char(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned DEFAULT NULL,
  `environment_id` int(10) NOT NULL DEFAULT '1',
  `add_date` datetime DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  `page_title` char(255) DEFAULT NULL,
  `page_description` text,
  `default_thumb` char(255) DEFAULT NULL,
  `share_text` text,
  `theater_share_text` text,
  `theater_type` int(10) NOT NULL DEFAULT '0',
  `theater_config` text,
  `slides_config` text,
  `styles` text,
  `fbwall_video_sharing` char(7) DEFAULT NULL,
  `is_likegate` int(1) DEFAULT '0',
  `likegate_page_id` int(11) DEFAULT NULL,
  `share_url` varchar(255) DEFAULT NULL,
  `page_width` int(11) unsigned DEFAULT NULL,
  `embed_page_id` int(11) DEFAULT NULL,
  `language_id` int(10) NOT NULL DEFAULT '1',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=369 ;

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
-- Table structure for table `page_milestones`
--

DROP TABLE IF EXISTS `page_milestones`;
CREATE TABLE `page_milestones` (
  `milestone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `milestone_type` enum('active_status') DEFAULT NULL,
  `milestone_flag` int(4) DEFAULT NULL,
  `milestone_start_date` date NOT NULL DEFAULT '0000-00-00',
  `milestone_end_date` date NOT NULL DEFAULT '0000-00-00',
  `milestone_text` varchar(255) DEFAULT '',
  `delete_flag` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`milestone_id`),
  KEY `page_id` (`page_id`,`milestone_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_template_types`
--

DROP TABLE IF EXISTS `page_template_types`;
CREATE TABLE `page_template_types` (
  `template_name` char(128) NOT NULL,
  `template_title` char(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`,`date`,`environment_id`,`region_id`)
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=145 ;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
CREATE TABLE `streams` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `user_agent` char(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `rating` int(4) DEFAULT NULL,
  PRIMARY KEY (`vote_id`),
  KEY `content_id` (`content_id`),
  KEY `ip,rat,user` (`ip_address`,`rating`,`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_name` char(128) DEFAULT NULL,
  `widget_type_id` int(11) unsigned NOT NULL,
  `data` text,
  `widget_template_id` int(11) DEFAULT NULL,
  `region_id` int(10) unsigned NOT NULL DEFAULT '1',
  `styles` text,
  PRIMARY KEY (`widget_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=561 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_templates`
--

DROP TABLE IF EXISTS `widget_templates`;
CREATE TABLE `widget_templates` (
  `widget_template_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `widget_template_display_name` varchar(128) DEFAULT NULL,
  `widget_template_name` varchar(128) DEFAULT NULL,
  `widget_form_template_name` varchar(128) DEFAULT NULL,
  `cms_display_name` varchar(128) DEFAULT NULL,
  `description` text,
  `enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widget_template_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_types`
--

DROP TABLE IF EXISTS `widget_types`;
CREATE TABLE `widget_types` (
  `widget_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `widget_type_name` char(64) DEFAULT NULL,
  PRIMARY KEY (`widget_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_views`
--

DROP TABLE IF EXISTS `widget_views`;
CREATE TABLE `widget_views` (
  `widget_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `environment_id` int(11) NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_date` date NOT NULL DEFAULT '0000-00-00',
  `views` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_id`,`page_id`,`environment_id`,`region_id`,`view_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calls`
--
ALTER TABLE `calls`
  ADD CONSTRAINT `calls_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
