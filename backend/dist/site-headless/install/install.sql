# --- WireDatabaseBackup {"time":"2023-03-01 08:49:31","user":"","dbName":"pw-nuxt-kickstart","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `appapi_apikeys`;
CREATE TABLE `appapi_apikeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `accessable_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_apikeys` (`id`, `application_id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `key`, `version`, `description`, `accessable_until`) VALUES('1', '1', '2023-01-19 13:11:14', '41', '2023-01-19 13:11:14', '41', '9MdFquJHVH4NfSmuFYy5Y', '1.0.0', '', NULL);

DROP TABLE IF EXISTS `appapi_applications`;
CREATE TABLE `appapi_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `authtype` int(11) NOT NULL,
  `logintype` json NOT NULL,
  `token_secret` varchar(100) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `accesstoken_secret` varchar(100) NOT NULL,
  `default_application` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_applications` (`id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `title`, `description`, `authtype`, `logintype`, `token_secret`, `expires_in`, `accesstoken_secret`, `default_application`) VALUES('1', '2023-01-19 13:11:07', '41', '2023-01-19 13:11:07', '41', 'default', '', '0', '[\"logintypeUsernamePassword\"]', 'rD37TckQ3GXce4VjCC3M7I6Vlvwg1PZLzYpkMwfmgVdghru//9ni5CwW', '2592000', '00CGgbZiPs6ebqCF+giNuYEYnvUjWVRoPE2/F9fF', '0');

DROP TABLE IF EXISTS `appapi_apptokens`;
CREATE TABLE `appapi_apptokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `token_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `not_before_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_content`;
CREATE TABLE `field_content` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_image`;
CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1023', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1023', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'site--modules--processwireupgrade--processwireupgrade-module.json', '0', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1587', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'site--modules--processwireupgrade--processwireupgradecheck-config-php.json', '1', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '884', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'site--modules--processwireupgrade--processwireupgradecheck-module.json', '2', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1164', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--admin-php.json', '3', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1204', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--admintheme-php.json', '4', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '931', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--adminthemeframework-php.json', '5', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1499', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--field-php.json', '6', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '441', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fieldgroups-php.json', '7', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '563', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fields-php.json', '8', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '675', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fieldselectorinfo-php.json', '9', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '405', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fieldstabletools-php.json', '10', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1207', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fieldtype-php.json', '11', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1230', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--fieldtypemulti-php.json', '12', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1623', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--filecompiler-php.json', '13', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '222', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--filecompilermodule-php.json', '14', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '463', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--filevalidatormodule-php.json', '15', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '425', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--functions-php.json', '16', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '608', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--imagesizerengine-php.json', '17', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1500', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--imagesizerenginegd-php.json', '18', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '442', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--inputfield-php.json', '19', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4107', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--inputfieldwrapper-php.json', '20', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '348', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--interfaces-php.json', '21', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '116', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--languagefunctions-php.json', '22', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1629', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--markupqa-php.json', '23', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '690', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--modules-php.json', '24', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3184', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--modulesduplicates-php.json', '25', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '457', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--pageimage-php.json', '26', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '251', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--pageseditor-php.json', '27', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1272', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--pagesexportimport-php.json', '28', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1223', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--pagesnames-php.json', '29', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '780', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--paginatedarray-php.json', '30', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '333', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--password-php.json', '31', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '319', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--permissions-php.json', '32', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2339', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--process-php.json', '33', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '414', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--processcontroller-php.json', '34', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '254', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--processwire-php.json', '35', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '206', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--sanitizer-php.json', '36', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '234', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--selector-php.json', '37', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6890', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--session-php.json', '38', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '196', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--sessioncsrf-php.json', '39', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '259', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--tfa-php.json', '40', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2626', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wire-php.json', '41', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '104', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wirecache-php.json', '42', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '706', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wiredatetime-php.json', '43', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3332', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wirehttp-php.json', '44', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '491', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wireshutdown-php.json', '45', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2599', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wiretexttools-php.json', '46', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '612', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--core--wireupload-php.json', '47', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1704', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemedefault--adminthemedefault-module.json', '48', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '630', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemedefault--adminthemedefaulthelpers-php.json', '49', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '952', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemedefault--default-php.json', '50', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '464', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemereno--adminthemereno-module.json', '51', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2799', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemereno--adminthemerenohelpers-php.json', '52', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '993', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemereno--debug-inc.json', '53', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1620', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemereno--default-php.json', '54', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '434', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemeuikit--_masthead-php.json', '55', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '270', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemeuikit--_sidenav-masthead-php.json', '56', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '487', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemeuikit--adminthemeuikit-module.json', '57', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '284', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemeuikit--adminthemeuikitcss-php.json', '58', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '417', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--admintheme--adminthemeuikit--config-php.json', '59', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '15160', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentfilterakismet-module.json', '60', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '910', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentform-php.json', '61', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1872', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentlist-php.json', '62', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '998', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentlistcustom-php.json', '63', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '550', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentnotifications-php.json', '64', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3371', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--commentstars-php.json', '65', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '493', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--fieldtypecomments-module.json', '66', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '13591', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypecomments--inputfieldcommentsadmin-module.json', '67', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2775', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypedatetime-module.json', '68', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1994', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypedecimal-module.json', '69', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1409', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypefieldsettabopen-module.json', '70', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '773', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypefile--config-php.json', '71', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '11213', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypefile--fieldtypefile-module.json', '72', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1042', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypefloat-module.json', '73', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '515', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeinteger-module.json', '74', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1636', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypemodule-module.json', '75', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1761', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeoptions--fieldtypeoptions-module.json', '76', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1112', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionconfig-php.json', '77', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3343', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionmanager-php.json', '78', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '829', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypepage-module.json', '79', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2898', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypepagetable-module.json', '80', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4020', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtyperepeater--config-php.json', '81', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '9278', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtyperepeater--fieldsetpageinstructions-php.json', '82', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2509', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtyperepeater--fieldtypefieldsetpage-module.json', '83', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '859', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtyperepeater--fieldtyperepeater-module.json', '84', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '454', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtyperepeater--inputfieldrepeater-module.json', '85', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2343', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeselector-module.json', '86', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1153', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypetext-module.json', '87', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1601', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypetextareahelper-php.json', '88', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6880', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypetoggle-module.json', '89', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2189', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--fieldtype--fieldtypeurl-module.json', '90', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3112', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--filecompilertags-module.json', '91', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '347', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--image--imagesizerengineanimatedgif--imagesizerengineanimatedgif-module.json', '92', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '399', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--image--imagesizerengineimagick--imagesizerengineimagick-module.json', '93', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '506', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldasmselect--inputfieldasmselect-module.json', '94', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1049', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldbutton-module.json', '95', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '413', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldcheckbox--inputfieldcheckbox-module.json', '96', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1721', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldcheckboxes--inputfieldcheckboxes-module.json', '97', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2154', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldckeditor--inputfieldckeditor-module.json', '98', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '12289', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfielddatetime--inputfielddatetime-module.json', '99', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '820', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfielddatetime--types--inputfielddatetimehtml-php.json', '100', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1349', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfielddatetime--types--inputfielddatetimeselect-php.json', '101', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1678', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfielddatetime--types--inputfielddatetimetext-php.json', '102', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5168', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldemail-module.json', '103', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1454', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldfieldset-module.json', '104', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '387', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldfile--config-php.json', '105', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3053', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldfile--inputfieldfile-module.json', '106', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2637', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldfloat-module.json', '107', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '515', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldform-module.json', '108', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '501', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldhidden-module.json', '109', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '541', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldicon--inputfieldicon-module.json', '110', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '483', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldimage--config-php.json', '111', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '7080', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldimage--inputfieldimage-module.json', '112', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4694', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldinteger-module.json', '113', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2242', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldmarkup-module.json', '114', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1011', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldname-module.json', '115', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '558', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpage--inputfieldpage-module.json', '116', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '10268', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpageautocomplete--inputfieldpageautocomplete-module.json', '117', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2077', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselect-module.json', '118', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1091', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselectmultiple-module.json', '119', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1387', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagename--inputfieldpagename-module.json', '120', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1343', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetable-module.json', '121', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5202', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetableajax-php.json', '122', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '322', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpagetitle--inputfieldpagetitle-module.json', '123', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '481', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldpassword--inputfieldpassword-module.json', '124', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6892', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldradios--inputfieldradios-module.json', '125', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '430', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldselect-module.json', '126', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3473', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldselectmultiple-module.json', '127', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '516', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldselector--inputfieldselector-module.json', '128', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6981', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldsubmit--inputfieldsubmit-module.json', '129', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '378', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldtext--inputfieldtext-module.json', '130', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4723', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldtextarea-module.json', '131', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '757', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldtexttags--inputfieldtexttags-module.json', '132', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6966', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldtoggle--inputfieldtoggle-module.json', '133', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3165', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--inputfield--inputfieldurl-module.json', '134', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '784', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--jquery--jqueryui--jqueryui-module.json', '135', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '326', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--jquery--jquerywiretabs--jquerywiretabs-module.json', '136', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '829', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languageparser-php.json', '137', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '948', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagesupport-module.json', '138', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '821', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagesupportfields-module.json', '139', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '758', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagesupportinstall-php.json', '140', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1674', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagesupportpagenames-module.json', '141', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1916', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagetabs-module.json', '142', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '633', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--languagetranslator-php.json', '143', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3251', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--languagesupport--processlanguage-module.json', '144', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2580', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--markup--markuppagefields-module.json', '145', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '301', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--markup--markuppagernav--markuppagernav-module.json', '146', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '966', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--page--pagefrontedit--pagefrontedit-module.json', '147', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '652', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--page--pagefrontedit--pagefronteditconfig-php.json', '148', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5948', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--pagepathhistory-module.json', '149', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1399', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--pagepaths-module.json', '150', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '517', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--pagerender-module.json', '151', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1212', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processcommentsmanager--processcommentsmanager-module.json', '152', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6440', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processfield--processfield-module.json', '153', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '29604', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processfield--processfieldexportimport-php.json', '154', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6151', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processforgotpassword--processforgotpassword-module.json', '155', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '10586', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processhome-module.json', '156', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '431', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processlist-module.json', '157', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '667', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processlogger--processlogger-module.json', '158', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4704', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processlogin--processlogin-module.json', '159', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '7459', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processmodule--processmodule-module.json', '160', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '19602', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processmodule--processmoduleinstall-php.json', '161', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3479', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageadd--processpageadd-module.json', '162', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4406', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageclone-module.json', '163', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2508', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageedit--pagebookmarks-php.json', '164', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1896', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageedit--processpageedit-module.json', '165', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '15810', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageeditimageselect--processpageeditimageselect-module.json', '166', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '8606', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageeditlink--processpageeditlink-module.json', '167', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5479', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelist--processpagelist-module.json', '168', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5546', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelist--processpagelistactions-php.json', '169', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1215', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelist--processpagelistrender-php.json', '170', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1394', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelist--processpagelistrenderjson-php.json', '171', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '536', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelister--processpagelister-module.json', '172', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4317', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagelister--processpagelisterbookmarks-php.json', '173', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3914', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagesearch--processpagesearch-module.json', '174', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5350', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagesearch--processpagesearchlive-php.json', '175', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '3055', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagesexportimport--processpagesexportimport-module.json', '176', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '12565', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagesort-module.json', '177', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1154', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagetrash-module.json', '178', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2067', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpagetype--processpagetype-module.json', '179', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1070', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpageview-module.json', '180', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '390', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processpermission--processpermission-module.json', '181', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1651', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processprofile--processprofile-module.json', '182', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2834', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processrecentpages--processrecentpages-module.json', '183', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2224', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processrole--processrole-module.json', '184', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6004', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processtemplate--processtemplate-module.json', '185', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '57707', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processtemplate--processtemplateexportimport-php.json', '186', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '6090', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processuser--processuser-module.json', '187', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1855', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--process--processuser--processuserconfig-php.json', '188', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '715', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--session--sessionhandlerdb--processsessiondb-module.json', '189', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1580', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--session--sessionhandlerdb--sessionhandlerdb-module.json', '190', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1994', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--session--sessionloginthrottle--sessionloginthrottle-module.json', '191', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2131', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--system--systemnotifications--systemnotifications-module.json', '192', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2548', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--system--systemnotifications--systemnotificationsconfig-php.json', '193', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '5744', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--system--systemupdater--systemupdater-module.json', '194', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '997', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--system--systemupdater--systemupdaterchecks-php.json', '195', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '4522', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--textformatter--textformatterentities-module.json', '196', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '694', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--textformatter--textformattermarkdownextra--parsedown--parsedown-php.json', '197', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '228', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--textformatter--textformattermarkdownextra--textformattermarkdownextra-module.json', '198', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1040', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--modules--textformatter--textformattersmartypants--textformattersmartypants-module.json', '199', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1314', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--templates-admin--debug-inc.json', '200', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '1964', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--templates-admin--default-php.json', '201', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '2354', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1023', 'wire--templates-admin--topnav-inc.json', '202', '[\"\"]', '2023-02-11 20:09:38', '2023-02-11 20:09:38', '', '130', '41', '41');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1025', 'wire--modules--languagesupport--languagesupport-module.json', '0', '[\"\"]', '2023-02-15 11:12:08', '2023-02-15 11:12:08', '', '172', '41', '41');

DROP TABLE IF EXISTS `field_language_files_site`;
CREATE TABLE `field_language_files_site` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_meta_description`;
CREATE TABLE `field_meta_description` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_meta_description` (`pages_id`, `data`) VALUES('1', '');
INSERT INTO `field_meta_description` (`pages_id`, `data`) VALUES('1020', '');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1010', '159');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1012', '161');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1015', '163');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1017', '165');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1019', '166');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1022', '172');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1024', '173');

DROP TABLE IF EXISTS `field_publication_date`;
CREATE TABLE `field_publication_date` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_repeater_matrix_type`;
CREATE TABLE `field_repeater_matrix_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1035', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1036', '2');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_text`;
CREATE TABLE `field_text` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_text` (`pages_id`, `data`) VALUES('27', '<p>Die gesuchte Seite wurde nicht gefunden.<br />Zurück zur <a	data-pwid=1	href=\"/\">Startseite</a>.</p>');
INSERT INTO `field_text` (`pages_id`, `data`) VALUES('1020', '<p>Hello World!</p>');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', 'Seite nicht gefunden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1015', 'AppApi');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1016', 'Manage AppApi settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1017', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1018', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1019', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1020', 'Hello World');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1021', 'Administer languages and static translation files');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1023', 'German');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1024', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1025', 'English');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1028', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1029', 'content');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1033', 'hello-world-too');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1034', 'hello-world');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'http-status');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'repeater_content');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '99', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '102', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '99', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '100', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '103', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '105', '0', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Titel', '{\"required\":1,\"size\":0,\"maxlength\":255,\"minlength\":0,\"showCount\":0,\"textformatters\":[\"TextformatterEntities\",\"TextformatterRockDown\"],\"langBlankInherit\":0,\"notes\":\"Kursiv: _Hallo_\\u00a0\\u00a0\\u00a0\\u00a0Bedingter Trennstrich: --\\u00a0\\u00a0\\u00a0\\u00a0Breitenloses Leerzeichen: ---\",\"label1025\":\"Title\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail-Adresse', '{\"size\":70,\"maxlength\":255,\"label1025\":\"E-Mail Address\",\"collapsed\":0,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeTextarea', 'text', '0', 'Text', '{\"inputfieldClass\":\"InputfieldTinyMCE\",\"contentType\":1,\"htmlOptions\":[2],\"collapsed\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5,\"inlineMode\":1,\"height\":500,\"lazyMode\":1,\"features\":[\"toolbar\",\"stickybars\",\"purifier\",\"pasteFilter\"],\"toolbar\":\"styles bold italic pwlink unlink bullist numlist pastetext\",\"plugins\":[\"link\",\"lists\",\"pwlink\"],\"toggles\":[2,4,8],\"headlines\":[\"h3\",\"h4\"],\"styleFormatsCSS\":\"#Align { display: none }\\n#Blocks (Blockquote)  { display: none }\\n#Blocks (Pre)  { display: none }\\n#Inline (Code)  { display: none }\\n#Inline (Strikethrough)  { display: none }\\n#Inline (Underline)  { display: none }\",\"notes\":\"Bedingter Trennstrich: --\\u00a0\\u00a0\\u00a0\\u00a0Breitenloses Leerzeichen: ---\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypeText', 'meta_description', '0', 'Meta Description', '{\"description\":\"Zusammenfassung des Seiteninhalts f\\u00fcr Suchmaschinen\",\"collapsed\":2,\"minlength\":0,\"maxlength\":150,\"showCount\":1,\"size\":0,\"langBlankInherit\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1022,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeImage', 'images', '0', 'Bilder', '{\"fileSchema\":270,\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":0,\"outputFormat\":0,\"descriptionRows\":1,\"useTags\":0,\"gridMode\":\"left\",\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"textformatters\":[\"TextformatterEntities\"],\"noLang\":1,\"maxSize\":4,\"collapsed\":0,\"minWidth\":1600,\"minHeight\":1000,\"label1025\":\"Images\",\"notes\":\"JPGs in h\\u00f6chster Qualit\\u00e4tsstufe exportieren und hochladen!\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeImage', 'image', '0', 'Bild', '{\"fileSchema\":270,\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":0,\"descriptionRows\":1,\"useTags\":0,\"gridMode\":\"left\",\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"textformatters\":[\"TextformatterEntities\"],\"noLang\":1,\"maxSize\":4,\"collapsed\":0,\"minWidth\":1600,\"minHeight\":1000,\"label1025\":\"Image\",\"notes\":\"JPGs in h\\u00f6chster Qualit\\u00e4tsstufe exportieren und hochladen!\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeInteger', 'repeater_matrix_type', '25', 'Repeater matrix type', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypeRepeaterMatrix', 'content', '0', 'Inhalt', '{\"label1025\":\"Content\",\"template_id\":45,\"parent_id\":1029,\"matrix1_name\":\"type_text\",\"matrix1_label\":\"Text\",\"matrix1_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix1_fields\":[98],\"matrix1_sort\":1,\"matrix2_name\":\"type_images\",\"matrix2_label\":\"Bilder\",\"matrix2_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix2_label1025\":\"Images\",\"matrix2_fields\":[103],\"matrix2_sort\":2,\"repeaterFields\":[105,98,103],\"familyFriendly\":0,\"repeaterCollapse\":3,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"addType\":1,\"imageDefs\":\"type_text:\\ntype_images:\",\"imageStyle\":\"margin:10px; width:200px;\",\"imageText\":1,\"allowChangeType\":0,\"collapsed\":0,\"repeaterAddLabel\":\"Hinzuf\\u00fcgen\",\"repeaterAddLabel1025\":\"Add new\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeDatetime', 'publication_date', '0', 'Publikationsdatum', '{\"label1025\":\"Publication date\",\"collapsed\":0,\"inputType\":\"html\",\"htmlType\":\"date\",\"datepicker\":0,\"timeInputSelect\":0,\"dateInputFormat\":\"Y-m-d\",\"size\":25,\"dateSelectFormat\":\"yMd\",\"yearFrom\":1923,\"yearTo\":2043,\"yearLock\":0,\"dateOutputFormat\":\"j.n.Y\",\"defaultToday\":1}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '32', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '{\"replacements\":{\"\\u00e6\":\"ae\",\"\\u00e5\":\"a\",\"\\u00e4\":\"ae\",\"\\u00e3\":\"a\",\"\\u00df\":\"ss\",\"\\u00f6\":\"oe\",\"\\u00fc\":\"ue\",\"\\u0111\":\"dj\",\"\\u0436\":\"zh\",\"\\u0445\":\"kh\",\"\\u0446\":\"tc\",\"\\u0447\":\"ch\",\"\\u0448\":\"sh\",\"\\u0449\":\"shch\",\"\\u044e\":\"iu\",\"\\u044f\":\"ia\",\":\":\"-\",\",\":\"-\",\"\\u00e0\":\"a\",\"\\u00e1\":\"a\",\"\\u00e2\":\"a\",\"\\u00e8\":\"e\",\"\\u00e9\":\"e\",\"\\u00eb\":\"e\",\"\\u00ea\":\"e\",\"\\u011b\":\"e\",\"\\u00ec\":\"i\",\"\\u00ed\":\"i\",\"\\u00ef\":\"i\",\"\\u00ee\":\"i\",\"\\u0131\":\"i\",\"\\u0130\":\"i\",\"\\u011f\":\"g\",\"\\u00f5\":\"o\",\"\\u00f2\":\"o\",\"\\u00f3\":\"o\",\"\\u00f4\":\"o\",\"\\u00f8\":\"o\",\"\\u00f9\":\"u\",\"\\u00fa\":\"u\",\"\\u00fb\":\"u\",\"\\u016f\":\"u\",\"\\u00f1\":\"n\",\"\\u00e7\":\"c\",\"\\u010d\":\"c\",\"\\u0107\":\"c\",\"\\u00c7\":\"c\",\"\\u010f\":\"d\",\"\\u013a\":\"l\",\"\\u013e\":\"l\",\"\\u0144\":\"n\",\"\\u0148\":\"n\",\"\\u0155\":\"r\",\"\\u0159\":\"r\",\"\\u0161\":\"s\",\"\\u015f\":\"s\",\"\\u015e\":\"s\",\"\\u0165\":\"t\",\"\\u00fd\":\"y\",\"\\u017e\":\"z\",\"\\u0430\":\"a\",\"\\u0431\":\"b\",\"\\u0432\":\"v\",\"\\u0433\":\"g\",\"\\u0434\":\"d\",\"\\u0435\":\"e\",\"\\u0451\":\"e\",\"\\u0437\":\"z\",\"\\u0438\":\"i\",\"\\u0439\":\"i\",\"\\u043a\":\"k\",\"\\u043b\":\"l\",\"\\u043c\":\"m\",\"\\u043d\":\"n\",\"\\u043e\":\"o\",\"\\u043f\":\"p\",\"\\u0440\":\"r\",\"\\u0441\":\"s\",\"\\u0442\":\"t\",\"\\u0443\":\"u\",\"\\u0444\":\"f\",\"\\u044b\":\"y\",\"\\u044d\":\"e\",\"\\u0119\":\"e\",\"\\u0105\":\"a\",\"\\u015b\":\"s\",\"\\u0142\":\"l\",\"\\u017c\":\"z\",\"\\u017a\":\"z\"}}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\",\"admin_theme\",\"language\"]}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":20,\"coreVersion\":\"3.0.210\"}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2023-01-19 13:04:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'ProcessRecentPages', '1', '', '2023-01-19 13:05:02');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'AdminThemeUikit', '10', '', '2023-01-19 13:05:03');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'ProcessLogger', '1', '', '2023-01-19 13:05:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'InputfieldIcon', '0', '', '2023-01-19 13:05:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', 'AppApi', '3', '{\"endpoint\":\"api\",\"routes_path\":\"site\\/templates\\/api\\/Routes.php\",\"access_logging\":\"\",\"deactivate_url_hook\":1}', '2023-01-19 13:10:08');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', 'FileValidatorSvgSanitizer', '0', '', '2023-01-19 13:12:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'ProcessDatabaseBackups', '1', '', '2023-01-19 13:12:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'InputfieldTextTags', '0', '', '2023-01-19 13:38:09');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'InputfieldTinyMCE', '0', '{\"skin\":\"oxide\",\"skin_url\":\"\",\"content_css\":\"wire\",\"content_css_url\":\"\",\"extPluginOpts\":\"\",\"optionals\":[\"headlines\",\"styleFormatsCSS\",\"settingsJSON\"],\"headlines\":[\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h5\",\"h6\"],\"contextmenu\":\"default\",\"menubar\":\"default\",\"removed_menuitems\":\"default\",\"styleFormatsCSS\":\"#Align { display: none }\",\"invalid_styles\":\"default\",\"extraCSS\":\"\",\"pasteFilter\":\"default\",\"defaultsJSON\":\"\",\"defaultsFile\":\"\",\"debugMode\":0}', '2023-01-19 13:40:37');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'InputfieldToggle', '0', '', '2023-01-19 13:40:37');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'TextformatterMarkdownExtra', '1', '', '2023-01-19 13:43:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('171', 'LanguageSupport', '35', '{\"languagesPageID\":1022,\"defaultLanguagePageID\":1023,\"otherLanguagePageIDs\":[1025],\"languageTranslatorPageID\":1024}', '2023-01-19 14:11:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'ProcessLanguage', '1', '', '2023-01-19 14:11:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'ProcessLanguageTranslator', '1', '', '2023-01-19 14:11:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('174', 'InputfieldPageAutocomplete', '0', '', '2023-01-19 14:44:22');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('176', 'ImageSizerEngineIMagick', '0', '{\"enginePriority\":1,\"sharpening\":\"soft\",\"quality\":80}', '2023-02-02 23:16:41');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('177', 'LanguageSupportFields', '3', '', '2023-02-05 09:39:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'FieldtypeTextLanguage', '1', '', '2023-02-05 09:39:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('179', 'FieldtypePageTitleLanguage', '1', '', '2023-02-05 09:39:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('180', 'FieldtypeTextareaLanguage', '1', '', '2023-02-05 09:39:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('182', 'FieldtypeRepeater', '35', '{\"repeatersRootPageID\":1028}', '2023-02-08 16:37:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('183', 'InputfieldRepeater', '0', '', '2023-02-08 16:37:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('184', 'FieldtypeRepeaterMatrix', '33', '', '2023-02-08 16:37:43');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('185', 'InputfieldRepeaterMatrix', '0', '', '2023-02-08 16:37:43');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('186', 'TextformatterRockDown', '1', '', '2023-02-09 23:12:56');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('187', 'ProcessCustomUploadNames', '3', '', '2023-02-15 07:54:34');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2023-02-15 13:04:59', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'manage', '1035', '2023-01-19 13:05:03', '40', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2023-01-19 13:05:11', '40', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2023-01-19 13:05:13', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2023-01-19 13:05:12', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '43', 'http404', '1035', '2023-02-11 20:35:03', '41', '2023-01-19 13:04:50', '3', '2023-02-05 11:16:05', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2023-01-19 14:11:17', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2023-02-11 20:08:13', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2023-01-19 13:04:50', '40', '2023-01-19 13:04:50', '40', '2023-01-19 13:04:50', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2023-01-19 13:04:50', '40', '2023-01-19 13:04:50', '40', '2023-01-19 13:04:50', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '3', '2', 'recent-pages', '1', '2023-01-19 13:05:02', '40', '2023-01-19 13:05:02', '40', '2023-01-19 13:05:02', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '31', '5', 'page-edit-recent', '1', '2023-01-19 13:05:02', '40', '2023-01-19 13:05:02', '40', '2023-01-19 13:05:02', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '22', '2', 'logs', '1', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-view', '1', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '31', '5', 'logs-edit', '1', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '40', '2023-01-19 13:05:07', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1015', '22', '2', 'appapi', '1', '2023-01-19 13:10:08', '41', '2023-01-19 13:10:08', '41', '2023-01-19 13:10:08', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1016', '31', '5', 'appapi_manage_applications', '1', '2023-01-19 13:10:08', '41', '2023-01-19 13:10:08', '41', '2023-01-19 13:10:08', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '22', '2', 'db-backups', '1', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1018', '31', '5', 'db-backup', '1', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '1', '29', 'hello-world', '1', '2023-02-19 15:09:21', '41', '2023-01-19 13:43:55', '41', '2023-02-11 20:03:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1021', '31', '5', 'lang-edit', '1', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '22', '2', 'languages', '16', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '1022', '44', 'default', '16', '2023-02-11 20:09:43', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1024', '22', '2', 'language-translator', '1040', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1025', '1022', '44', 'en', '1', '2023-02-15 11:12:08', '41', '2023-01-19 14:11:41', '41', '2023-01-19 14:11:41', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1028', '2', '2', 'repeaters', '1036', '2023-02-08 16:37:36', '41', '2023-02-08 16:37:36', '41', '2023-02-08 16:37:36', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1029', '1028', '2', 'for-field-106', '17', '2023-02-08 16:38:08', '41', '2023-02-08 16:38:08', '41', '2023-02-08 16:38:08', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '1029', '2', 'for-page-1026', '17', '2023-02-09 23:14:46', '41', '2023-02-09 23:14:46', '41', '2023-02-09 23:14:46', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1034', '1029', '2', 'for-page-1020', '17', '2023-02-11 20:03:22', '41', '2023-02-11 20:03:22', '41', '2023-02-11 20:03:22', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1035', '1034', '45', '1676142426-1911-1', '3073', '2023-02-11 20:07:06', '41', '2023-02-11 20:07:06', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1036', '1034', '45', '1676142427-5548-1', '3073', '2023-02-11 20:07:07', '41', '2023-02-11 20:07:07', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1037', '30', '4', 'publisher', '1', '2023-03-01 08:48:57', '41', '2023-03-01 08:48:42', '41', '2023-03-01 08:48:57', '2');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('27', '1', '2023-01-19 13:45:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2023-01-19 13:04:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2023-01-19 13:05:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2023-01-19 13:05:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1014', '2', '2023-01-19 13:05:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1016', '2', '2023-01-19 13:10:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1018', '2', '2023-01-19 13:12:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1020', '1', '2023-01-19 13:43:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1021', '2', '2023-01-19 14:11:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '2', '2023-01-19 14:11:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1025', '2', '2023-01-19 14:11:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1035', '2', '2023-02-11 20:07:06');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1036', '2', '2023-02-11 20:07:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1037', '2', '2023-03-01 08:48:42');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1022', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1022', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1028', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1029', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1029', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1034', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1034', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1034', '1029');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1677656937,\"ns\":\"ProcessWire\",\"_lazy\":1,\"roles\":[37,1037]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1673029732,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":0,\"modified\":1676457502,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'http-status', '97', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":0,\"modified\":1674132293,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'language', '98', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"compile\":3,\"nameContentTab\":1,\"modified\":1674133877}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'repeater_content', '99', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterMatrixPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1675870688}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":25,"numCreateTables":31,"numInserts":564,"numSeconds":0}