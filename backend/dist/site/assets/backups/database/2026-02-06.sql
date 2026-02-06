# --- WireDatabaseBackup {"time":"2026-02-06 13:01:50","user":"chadm","dbName":"carolinherrlich","description":"Level-A-Seiten gesperrt. Bild auf template projects entfernt. Bei Bedarf neues template sub-projects.","tables":[],"excludeTables":[],"excludeCreateTables":[],"excludeExportTables":[]}

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
  `accessible_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_apikeys` (`id`, `application_id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `key`, `version`, `description`, `accessible_until`) VALUES('1', '1', '2025-12-11 18:07:26', '41', '2025-12-11 18:07:26', '41', '4vSjYIPXcho2NMXr0GcGn', '1.0.0', '', NULL);

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
  `logintype` longtext NOT NULL,
  `token_secret` varchar(100) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `accesstoken_secret` varchar(100) NOT NULL,
  `default_application` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_applications` (`id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `title`, `description`, `authtype`, `logintype`, `token_secret`, `expires_in`, `accesstoken_secret`, `default_application`) VALUES('1', '2025-12-11 18:07:13', '41', '2025-12-11 18:07:13', '41', 'default', '', '0', '[\"logintypeUsernamePassword\"]', 'WbofGH/A4tnSrI3r1uNykxbXDof2nePawmsWSQEMgM2nCJQFPFerurlv', '2592000', '5BzSO4nBmN3xeHUe1TLkhQa5G+8+rzhDo8qyoe8l', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(191) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('app-api__1-default', 'O:8:\"stdClass\":3:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"home\";s:3:\"url\";s:1:\"/\";s:8:\"template\";s:4:\"home\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:10:\"Startseite\";s:8:\"subtitle\";s:88:\"Ich gestalte soziale Räume, Alltag und Gärten mit sozialer und zyklischer Permakultur.\";s:12:\"custom_links\";a:1:{i:0;a:2:{s:11:\"select_page\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1102;s:4:\"name\";s:24:\"permakultur-sprechstunde\";s:3:\"url\";s:37:\"/accordions/permakultur-sprechstunde/\";s:8:\"template\";s:9:\"accordion\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:24:\"Permakultur-Sprechstunde\";}}s:5:\"title\";s:0:\"\";}}s:6:\"slider\";a:1:{i:0;O:8:\"stdClass\":8:{s:4:\"type\";s:15:\"type_home_slide\";s:5:\"title\";s:4:\"test\";s:10:\"date_start\";s:18:\"12.01.2026, 15:58h\";s:8:\"date_end\";s:18:\"12.01.2026, 16:30h\";s:4:\"text\";s:16:\"<p>test text</p>\";s:5:\"image\";O:8:\"stdClass\":10:{s:4:\"urls\";a:5:{i:0;O:8:\"stdClass\":2:{s:3:\"url\";s:69:\"http://carolinherrlich:8888/site/assets/files/1148/nasa_03.400x0.webp\";s:5:\"width\";i:400;}i:1;O:8:\"stdClass\":2:{s:3:\"url\";s:69:\"http://carolinherrlich:8888/site/assets/files/1148/nasa_03.800x0.webp\";s:5:\"width\";i:800;}i:2;O:8:\"stdClass\":2:{s:3:\"url\";s:70:\"http://carolinherrlich:8888/site/assets/files/1148/nasa_03.1200x0.webp\";s:5:\"width\";i:1200;}i:3;O:8:\"stdClass\":2:{s:3:\"url\";s:70:\"http://carolinherrlich:8888/site/assets/files/1148/nasa_03.1600x0.webp\";s:5:\"width\";i:1600;}i:4;O:8:\"stdClass\":2:{s:3:\"url\";s:70:\"http://carolinherrlich:8888/site/assets/files/1148/nasa_03.2000x0.webp\";s:5:\"width\";i:2000;}}s:8:\"alt_text\";s:75:\"Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex.\";s:16:\"long_description\";s:130:\"Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi.\";s:7:\"caption\";s:14:\"test nasa mond\";s:4:\"year\";s:4:\"2024\";s:19:\"external_link_title\";s:0:\"\";s:13:\"external_link\";s:23:\"https://www.example.com\";s:7:\"license\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1120;s:4:\"name\";s:12:\"cc-by-sa-4.0\";s:3:\"url\";s:23:\"/lizenzen/cc-by-sa-4.0/\";s:8:\"template\";s:7:\"license\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:12:\"CC-BY-SA-4.0\";}}s:5:\"ratio\";d:1.35;s:7:\"resized\";b:1;}s:10:\"categories\";a:0:{}s:4:\"link\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1117;s:4:\"name\";s:8:\"einstieg\";s:3:\"url\";s:40:\"/permakultur-basics/grundlagen/einstieg/\";s:8:\"template\";s:7:\"chapter\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:8:\"Einstieg\";}}}}s:16:\"meta_description\";s:102:\"Carolin Herrlich gestaltet soziale Räume, Alltag und Gärten mit sozialer und zyklischer Permakultur.\";}s:11:\"breadcrumbs\";N;}', '2026-03-08 22:28:31');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('app-api__1187-default', 'O:8:\"stdClass\":4:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1187;s:4:\"name\";s:15:\"werkzeugpalette\";s:3:\"url\";s:36:\"/permakultur-basics/werkzeugpalette/\";s:8:\"template\";s:14:\"overview-tools\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:3:{s:5:\"title\";s:15:\"Werkzeugpalette\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";s:15:\"related_content\";a:0:{}}s:11:\"breadcrumbs\";a:1:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1187;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1187;s:8:\"template\";s:14:\"overview-tools\";s:5:\"title\";s:15:\"Werkzeugpalette\";s:3:\"url\";s:36:\"/permakultur-basics/werkzeugpalette/\";s:9:\"clickable\";b:0;}s:4:\"path\";s:36:\"/permakultur-basics/werkzeugpalette/\";}}s:5:\"items\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1265;s:4:\"name\";s:7:\"analyse\";s:3:\"url\";s:20:\"/kategorien/analyse/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:4:{s:5:\"title\";s:7:\"Analyse\";s:14:\"select_context\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1257;s:4:\"name\";s:15:\"werkzeugpalette\";s:3:\"url\";s:26:\"/kontexte/werkzeugpalette/\";s:8:\"template\";s:7:\"context\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:15:\"Werkzeugpalette\";}}}s:20:\"is_overview_category\";b:1;s:5:\"image\";O:8:\"stdClass\":10:{s:4:\"urls\";a:5:{i:0;O:8:\"stdClass\":2:{s:3:\"url\";s:101:\"http://carolinherrlich:8888/site/assets/files/1265/bright-countryside-dawn-daylight-302804.400x0.webp\";s:5:\"width\";i:400;}i:1;O:8:\"stdClass\":2:{s:3:\"url\";s:101:\"http://carolinherrlich:8888/site/assets/files/1265/bright-countryside-dawn-daylight-302804.800x0.webp\";s:5:\"width\";i:800;}i:2;O:8:\"stdClass\":2:{s:3:\"url\";s:102:\"http://carolinherrlich:8888/site/assets/files/1265/bright-countryside-dawn-daylight-302804.1200x0.webp\";s:5:\"width\";i:1200;}i:3;O:8:\"stdClass\":2:{s:3:\"url\";s:102:\"http://carolinherrlich:8888/site/assets/files/1265/bright-countryside-dawn-daylight-302804.1600x0.webp\";s:5:\"width\";i:1600;}i:4;O:8:\"stdClass\":2:{s:3:\"url\";s:102:\"http://carolinherrlich:8888/site/assets/files/1265/bright-countryside-dawn-daylight-302804.2000x0.webp\";s:5:\"width\";i:2000;}}s:8:\"alt_text\";s:4:\"Wald\";s:16:\"long_description\";s:0:\"\";s:7:\"caption\";s:4:\"Wald\";s:4:\"year\";s:0:\"\";s:19:\"external_link_title\";s:4:\"Wald\";s:13:\"external_link\";s:19:\"https://example.com\";s:7:\"license\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1120;s:4:\"name\";s:12:\"cc-by-sa-4.0\";s:3:\"url\";s:23:\"/lizenzen/cc-by-sa-4.0/\";s:8:\"template\";s:7:\"license\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:12:\"CC-BY-SA-4.0\";}}s:5:\"ratio\";d:1.57;s:7:\"resized\";b:1;}}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1256;s:4:\"name\";s:10:\"beobachten\";s:3:\"url\";s:23:\"/kategorien/beobachten/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:4:{s:5:\"title\";s:10:\"Beobachten\";s:14:\"select_context\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1257;s:4:\"name\";s:15:\"werkzeugpalette\";s:3:\"url\";s:26:\"/kontexte/werkzeugpalette/\";s:8:\"template\";s:7:\"context\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:15:\"Werkzeugpalette\";}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1304;s:4:\"name\";s:4:\"blog\";s:3:\"url\";s:15:\"/kontexte/blog/\";s:8:\"template\";s:7:\"context\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:4:\"Blog\";}}}s:20:\"is_overview_category\";b:1;s:5:\"image\";O:8:\"stdClass\":10:{s:4:\"urls\";a:5:{i:0;O:8:\"stdClass\":2:{s:3:\"url\";s:97:\"http://carolinherrlich:8888/site/assets/files/1256/philipp-trubchenko-1437555-unsplash.400x0.webp\";s:5:\"width\";i:400;}i:1;O:8:\"stdClass\":2:{s:3:\"url\";s:97:\"http://carolinherrlich:8888/site/assets/files/1256/philipp-trubchenko-1437555-unsplash.800x0.webp\";s:5:\"width\";i:800;}i:2;O:8:\"stdClass\":2:{s:3:\"url\";s:98:\"http://carolinherrlich:8888/site/assets/files/1256/philipp-trubchenko-1437555-unsplash.1200x0.webp\";s:5:\"width\";i:1200;}i:3;O:8:\"stdClass\":2:{s:3:\"url\";s:98:\"http://carolinherrlich:8888/site/assets/files/1256/philipp-trubchenko-1437555-unsplash.1600x0.webp\";s:5:\"width\";i:1600;}i:4;O:8:\"stdClass\":2:{s:3:\"url\";s:98:\"http://carolinherrlich:8888/site/assets/files/1256/philipp-trubchenko-1437555-unsplash.2000x0.webp\";s:5:\"width\";i:1629;}}s:8:\"alt_text\";s:4:\"Wald\";s:16:\"long_description\";s:0:\"\";s:7:\"caption\";s:8:\"Test WZP\";s:4:\"year\";s:0:\"\";s:19:\"external_link_title\";s:10:\"Link-Titel\";s:13:\"external_link\";s:19:\"https://example.com\";s:7:\"license\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1120;s:4:\"name\";s:12:\"cc-by-sa-4.0\";s:3:\"url\";s:23:\"/lizenzen/cc-by-sa-4.0/\";s:8:\"template\";s:7:\"license\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:12:\"CC-BY-SA-4.0\";}}s:5:\"ratio\";d:0.66;s:7:\"resized\";b:1;}}}i:2;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1267;s:4:\"name\";s:12:\"praxiswissen\";s:3:\"url\";s:25:\"/kategorien/praxiswissen/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:4:{s:5:\"title\";s:12:\"Praxiswissen\";s:14:\"select_context\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1304;s:4:\"name\";s:4:\"blog\";s:3:\"url\";s:15:\"/kontexte/blog/\";s:8:\"template\";s:7:\"context\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:4:\"Blog\";}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1257;s:4:\"name\";s:15:\"werkzeugpalette\";s:3:\"url\";s:26:\"/kontexte/werkzeugpalette/\";s:8:\"template\";s:7:\"context\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:15:\"Werkzeugpalette\";}}}s:20:\"is_overview_category\";b:1;s:5:\"image\";O:8:\"stdClass\":10:{s:4:\"urls\";a:5:{i:0;O:8:\"stdClass\":2:{s:3:\"url\";s:126:\"http://carolinherrlich:8888/site/assets/files/1267/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.400x0.webp\";s:5:\"width\";i:400;}i:1;O:8:\"stdClass\":2:{s:3:\"url\";s:126:\"http://carolinherrlich:8888/site/assets/files/1267/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.800x0.webp\";s:5:\"width\";i:800;}i:2;O:8:\"stdClass\":2:{s:3:\"url\";s:127:\"http://carolinherrlich:8888/site/assets/files/1267/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.1200x0.webp\";s:5:\"width\";i:1200;}i:3;O:8:\"stdClass\":2:{s:3:\"url\";s:127:\"http://carolinherrlich:8888/site/assets/files/1267/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.1600x0.webp\";s:5:\"width\";i:1600;}i:4;O:8:\"stdClass\":2:{s:3:\"url\";s:127:\"http://carolinherrlich:8888/site/assets/files/1267/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.2000x0.webp\";s:5:\"width\";i:2000;}}s:8:\"alt_text\";s:19:\"Nadelwald mit Nebel\";s:16:\"long_description\";s:0:\"\";s:7:\"caption\";s:19:\"Nadelwald mit Nebel\";s:4:\"year\";s:0:\"\";s:19:\"external_link_title\";s:10:\"Link-Titel\";s:13:\"external_link\";s:19:\"https://example.com\";s:7:\"license\";O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1120;s:4:\"name\";s:12:\"cc-by-sa-4.0\";s:3:\"url\";s:23:\"/lizenzen/cc-by-sa-4.0/\";s:8:\"template\";s:7:\"license\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:12:\"CC-BY-SA-4.0\";}}s:5:\"ratio\";d:1.5;s:7:\"resized\";b:1;}}}}}', '2026-03-08 22:28:41');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('app-api__1268-default', 'O:8:\"stdClass\":4:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1268;s:4:\"name\";s:9:\"werkzeuge\";s:3:\"url\";s:46:\"/permakultur-basics/werkzeugpalette/werkzeuge/\";s:8:\"template\";s:5:\"tools\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:9:\"Werkzeuge\";}s:11:\"breadcrumbs\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1187;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1187;s:8:\"template\";s:14:\"overview-tools\";s:5:\"title\";s:15:\"Werkzeugpalette\";s:3:\"url\";s:36:\"/permakultur-basics/werkzeugpalette/\";s:9:\"clickable\";b:1;}s:4:\"path\";s:36:\"/permakultur-basics/werkzeugpalette/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1268;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1268;s:8:\"template\";s:5:\"tools\";s:5:\"title\";s:9:\"Werkzeuge\";s:3:\"url\";s:46:\"/permakultur-basics/werkzeugpalette/werkzeuge/\";s:9:\"clickable\";b:0;}s:4:\"path\";s:46:\"/permakultur-basics/werkzeugpalette/werkzeuge/\";}}s:8:\"children\";a:4:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1269;s:4:\"name\";s:22:\"sitzplatz-in-der-natur\";s:3:\"url\";s:69:\"/permakultur-basics/werkzeugpalette/werkzeuge/sitzplatz-in-der-natur/\";s:8:\"template\";s:4:\"tool\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:22:\"Sitzplatz in der Natur\";s:8:\"subtitle\";s:10:\"Untertitel\";s:15:\"select_category\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1262;s:4:\"name\";s:6:\"muster\";s:3:\"url\";s:19:\"/kategorien/muster/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:6:\"Muster\";}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1263;s:4:\"name\";s:10:\"natuerlich\";s:3:\"url\";s:30:\"/kategorien/muster/natuerlich/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:10:\"Natürlich\";}}}s:7:\"content\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}}s:15:\"related_content\";a:0:{}}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1275;s:4:\"name\";s:27:\"7-ways-to-think-differently\";s:3:\"url\";s:74:\"/permakultur-basics/werkzeugpalette/werkzeuge/7-ways-to-think-differently/\";s:8:\"template\";s:4:\"tool\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:27:\"7 Ways To Think Differently\";s:8:\"subtitle\";s:0:\"\";s:15:\"select_category\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1258;s:4:\"name\";s:10:\"prinzipien\";s:3:\"url\";s:23:\"/kategorien/prinzipien/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:10:\"Prinzipien\";}}}s:7:\"content\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:14:\"type_accordion\";s:9:\"accordion\";N;}}s:15:\"related_content\";a:0:{}}}i:2;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1284;s:4:\"name\";s:5:\"ethik\";s:3:\"url\";s:52:\"/permakultur-basics/werkzeugpalette/werkzeuge/ethik/\";s:8:\"template\";s:4:\"tool\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:5:\"Ethik\";s:8:\"subtitle\";s:0:\"\";s:15:\"select_category\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1258;s:4:\"name\";s:10:\"prinzipien\";s:3:\"url\";s:23:\"/kategorien/prinzipien/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:10:\"Prinzipien\";}}}s:7:\"content\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}}s:15:\"related_content\";a:0:{}}}i:3;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1291;s:4:\"name\";s:13:\"naturrhythmen\";s:3:\"url\";s:60:\"/permakultur-basics/werkzeugpalette/werkzeuge/naturrhythmen/\";s:8:\"template\";s:4:\"tool\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:13:\"Naturrhythmen\";s:8:\"subtitle\";s:0:\"\";s:15:\"select_category\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1262;s:4:\"name\";s:6:\"muster\";s:3:\"url\";s:19:\"/kategorien/muster/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:6:\"Muster\";}}}s:7:\"content\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}}s:15:\"related_content\";a:0:{}}}}}', '2026-03-08 22:54:45');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('app-api__1269-default', 'O:8:\"stdClass\":3:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1269;s:4:\"name\";s:22:\"sitzplatz-in-der-natur\";s:3:\"url\";s:69:\"/permakultur-basics/werkzeugpalette/werkzeuge/sitzplatz-in-der-natur/\";s:8:\"template\";s:4:\"tool\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:5:{s:5:\"title\";s:22:\"Sitzplatz in der Natur\";s:8:\"subtitle\";s:10:\"Untertitel\";s:15:\"select_category\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1262;s:4:\"name\";s:6:\"muster\";s:3:\"url\";s:19:\"/kategorien/muster/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:6:\"Muster\";}}i:1;O:8:\"stdClass\":2:{s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1263;s:4:\"name\";s:10:\"natuerlich\";s:3:\"url\";s:30:\"/kategorien/muster/natuerlich/\";s:8:\"template\";s:8:\"category\";s:9:\"alternate\";a:0:{}}s:6:\"fields\";a:1:{s:5:\"title\";s:10:\"Natürlich\";}}}s:7:\"content\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:9:\"type_text\";s:4:\"text\";s:271:\"<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\";}}s:15:\"related_content\";a:0:{}}s:11:\"breadcrumbs\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1187;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1187;s:8:\"template\";s:14:\"overview-tools\";s:5:\"title\";s:15:\"Werkzeugpalette\";s:3:\"url\";s:36:\"/permakultur-basics/werkzeugpalette/\";s:9:\"clickable\";b:1;}s:4:\"path\";s:36:\"/permakultur-basics/werkzeugpalette/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1268;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1268;s:8:\"template\";s:5:\"tools\";s:5:\"title\";s:9:\"Werkzeuge\";s:3:\"url\";s:46:\"/permakultur-basics/werkzeugpalette/werkzeuge/\";s:9:\"clickable\";b:1;}s:4:\"path\";s:46:\"/permakultur-basics/werkzeugpalette/werkzeuge/\";}i:2;O:8:\"stdClass\":3:{s:4:\"name\";i:1269;s:4:\"meta\";O:8:\"stdClass\":5:{s:2:\"id\";i:1269;s:8:\"template\";s:4:\"tool\";s:5:\"title\";s:22:\"Sitzplatz in der Natur\";s:3:\"url\";s:69:\"/permakultur-basics/werkzeugpalette/werkzeuge/sitzplatz-in-der-natur/\";s:9:\"clickable\";b:0;}s:4:\"path\";s:69:\"/permakultur-basics/werkzeugpalette/werkzeuge/sitzplatz-in-der-natur/\";}}}', '2026-03-08 22:58:50');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('app-api__defaults-default', 'O:8:\"stdClass\":3:{s:18:\"availableLanguages\";a:1:{i:0;s:2:\"de\";}s:8:\"appTitle\";s:10:\"Startseite\";s:10:\"navigation\";a:7:{i:0;O:8:\"stdClass\":4:{s:4:\"name\";i:1;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1;s:8:\"template\";s:4:\"home\";s:5:\"title\";s:10:\"Startseite\";s:3:\"url\";s:1:\"/\";}s:4:\"path\";s:1:\"/\";s:8:\"children\";a:0:{}}i:1;O:8:\"stdClass\":4:{s:4:\"name\";i:1020;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1020;s:8:\"template\";s:7:\"level-a\";s:5:\"title\";s:18:\"Permakultur-Basics\";s:3:\"url\";s:20:\"/permakultur-basics/\";}s:4:\"path\";s:20:\"/permakultur-basics/\";s:8:\"children\";a:4:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1109;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1109;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:10:\"Grundlagen\";s:3:\"url\";s:31:\"/permakultur-basics/grundlagen/\";}s:4:\"path\";s:31:\"/permakultur-basics/grundlagen/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1168;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1168;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:14:\"Designprozesse\";s:3:\"url\";s:35:\"/permakultur-basics/designprozesse/\";}s:4:\"path\";s:35:\"/permakultur-basics/designprozesse/\";}i:2;O:8:\"stdClass\":3:{s:4:\"name\";i:1171;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1171;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:24:\"Ganzheitliche Gestaltung\";s:3:\"url\";s:45:\"/permakultur-basics/ganzheitliche-gestaltung/\";}s:4:\"path\";s:45:\"/permakultur-basics/ganzheitliche-gestaltung/\";}i:3;O:8:\"stdClass\":3:{s:4:\"name\";i:1187;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1187;s:8:\"template\";s:14:\"overview-tools\";s:5:\"title\";s:15:\"Werkzeugpalette\";s:3:\"url\";s:36:\"/permakultur-basics/werkzeugpalette/\";}s:4:\"path\";s:36:\"/permakultur-basics/werkzeugpalette/\";}}}i:2;O:8:\"stdClass\":4:{s:4:\"name\";i:1174;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1174;s:8:\"template\";s:7:\"level-a\";s:5:\"title\";s:19:\"Gelebte Permakultur\";s:3:\"url\";s:21:\"/gelebte-permakultur/\";}s:4:\"path\";s:21:\"/gelebte-permakultur/\";s:8:\"children\";a:5:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1175;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1175;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:21:\"Zyklische Permakultur\";s:3:\"url\";s:43:\"/gelebte-permakultur/zyklische-permakultur/\";}s:4:\"path\";s:43:\"/gelebte-permakultur/zyklische-permakultur/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1178;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1178;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:21:\"Permakultur im Alltag\";s:3:\"url\";s:43:\"/gelebte-permakultur/permakultur-im-alltag/\";}s:4:\"path\";s:43:\"/gelebte-permakultur/permakultur-im-alltag/\";}i:2;O:8:\"stdClass\":3:{s:4:\"name\";i:1181;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1181;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:19:\"Soziale Permakultur\";s:3:\"url\";s:41:\"/gelebte-permakultur/soziale-permakultur/\";}s:4:\"path\";s:41:\"/gelebte-permakultur/soziale-permakultur/\";}i:3;O:8:\"stdClass\":3:{s:4:\"name\";i:1184;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1184;s:8:\"template\";s:8:\"overview\";s:5:\"title\";s:18:\"Grüne Permakultur\";s:3:\"url\";s:40:\"/gelebte-permakultur/gruene-permakultur/\";}s:4:\"path\";s:40:\"/gelebte-permakultur/gruene-permakultur/\";}i:4;O:8:\"stdClass\":3:{s:4:\"name\";i:1472;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1472;s:8:\"template\";s:8:\"projects\";s:5:\"title\";s:25:\"Herrliche Designbeispiele\";s:3:\"url\";s:47:\"/gelebte-permakultur/herrliche-designbeispiele/\";}s:4:\"path\";s:47:\"/gelebte-permakultur/herrliche-designbeispiele/\";}}}i:3;O:8:\"stdClass\":4:{s:4:\"name\";i:1297;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1297;s:8:\"template\";s:4:\"blog\";s:5:\"title\";s:4:\"Blog\";s:3:\"url\";s:6:\"/blog/\";}s:4:\"path\";s:6:\"/blog/\";s:8:\"children\";a:0:{}}i:4;O:8:\"stdClass\":4:{s:4:\"name\";i:1132;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1132;s:8:\"template\";s:7:\"level-a\";s:5:\"title\";s:8:\"Angebote\";s:3:\"url\";s:10:\"/angebote/\";}s:4:\"path\";s:10:\"/angebote/\";s:8:\"children\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1307;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1307;s:8:\"template\";s:6:\"events\";s:5:\"title\";s:15:\"Veranstaltungen\";s:3:\"url\";s:26:\"/angebote/veranstaltungen/\";}s:4:\"path\";s:26:\"/angebote/veranstaltungen/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1151;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1151;s:8:\"template\";s:5:\"offer\";s:5:\"title\";s:10:\"Beratungen\";s:3:\"url\";s:21:\"/angebote/beratungen/\";}s:4:\"path\";s:21:\"/angebote/beratungen/\";}i:2;O:8:\"stdClass\":3:{s:4:\"name\";i:1338;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1338;s:8:\"template\";s:5:\"offer\";s:5:\"title\";s:13:\"Wissenspakete\";s:3:\"url\";s:24:\"/angebote/wissenspakete/\";}s:4:\"path\";s:24:\"/angebote/wissenspakete/\";}}}i:5;O:8:\"stdClass\":4:{s:4:\"name\";i:1348;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1348;s:8:\"template\";s:7:\"level-a\";s:5:\"title\";s:10:\"Über mich\";s:3:\"url\";s:12:\"/ueber-mich/\";}s:4:\"path\";s:12:\"/ueber-mich/\";s:8:\"children\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"name\";i:1349;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1349;s:8:\"template\";s:10:\"basic-page\";s:5:\"title\";s:15:\"Vision und Vita\";s:3:\"url\";s:28:\"/ueber-mich/vision-und-vita/\";}s:4:\"path\";s:28:\"/ueber-mich/vision-und-vita/\";}i:1;O:8:\"stdClass\":3:{s:4:\"name\";i:1371;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1371;s:8:\"template\";s:10:\"basic-page\";s:5:\"title\";s:14:\"Wirkungsfelder\";s:3:\"url\";s:27:\"/ueber-mich/wirkungsfelder/\";}s:4:\"path\";s:27:\"/ueber-mich/wirkungsfelder/\";}i:2;O:8:\"stdClass\":3:{s:4:\"name\";i:1377;s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";i:1377;s:8:\"template\";s:10:\"basic-page\";s:5:\"title\";s:7:\"Kontakt\";s:3:\"url\";s:20:\"/ueber-mich/kontakt/\";}s:4:\"path\";s:20:\"/ueber-mich/kontakt/\";}}}i:6;O:8:\"stdClass\":3:{s:4:\"name\";s:5:\"tools\";s:4:\"meta\";O:8:\"stdClass\":4:{s:2:\"id\";s:0:\"\";s:8:\"template\";s:5:\"tools\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}s:4:\"path\";s:42:\"/permakultur-basics/werkzeugpalette/:tools\";}}}', '2026-03-08 22:28:31');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__4369ecc94fd28683e880c8b160feb9f7', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/modules\\/AppApi\\/AppApi.config.php\",\"hash\":\"7623380ac606e1935757da17de725126\",\"size\":1072,\"time\":1765475398,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/AppApi\\/AppApi.config.php\",\"hash\":\"7623380ac606e1935757da17de725126\",\"size\":1072,\"time\":1765475398}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__57cf469ec1ab9d103513c3731d1c7b19', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/modules\\/GithubRepositoryDispatch\\/GithubRepositoryDispatch.config.php\",\"hash\":\"71865949670a658881a2671718d912f9\",\"size\":1843,\"time\":1765475399,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/GithubRepositoryDispatch\\/GithubRepositoryDispatch.config.php\",\"hash\":\"71865949670a658881a2671718d912f9\",\"size\":1843,\"time\":1765475399}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__785f6ed471d4c4e5c63eafcb9d073bfa', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"14026674740d42783d0ec214abcb31c3\",\"size\":43406,\"time\":1765475399,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/cloud\\/work\\/projects\\/carolin herrlich\\/entwicklung\\/carolin-herrlich\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"36839171ae05fec97b270a835c9f19d7\",\"size\":44300,\"time\":1765475399}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.info', '{\"179\":{\"name\":\"FieldtypePageTitleLanguage\",\"title\":\"Page Title (Multi-Language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0],\"FieldtypeTextLanguage\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"178\":{\"name\":\"FieldtypeTextLanguage\",\"title\":\"Text (Multi-language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"180\":{\"name\":\"FieldtypeTextareaLanguage\",\"title\":\"Textarea (Multi-language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"171\":{\"name\":\"LanguageSupport\",\"title\":\"Languages Support\",\"version\":104,\"installs\":[\"ProcessLanguage\",\"ProcessLanguageTranslator\"],\"autoload\":true,\"singular\":true,\"created\":1674133876,\"configurable\":3,\"addFlag\":32},\"177\":{\"name\":\"LanguageSupportFields\",\"title\":\"Languages Support - Fields\",\"version\":101,\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"installs\":[\"FieldtypePageTitleLanguage\",\"FieldtypeTextareaLanguage\",\"FieldtypeTextLanguage\"],\"autoload\":true,\"singular\":true,\"created\":1675586340},\"173\":{\"name\":\"ProcessLanguageTranslator\",\"title\":\"Language Translator\",\"version\":103,\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1674133877,\"configurable\":4},\"172\":{\"name\":\"ProcessLanguage\",\"title\":\"Sprachen\",\"version\":103,\"icon\":\"language\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1674133876,\"configurable\":3,\"useNavJSON\":true},\"170\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"singular\":1,\"created\":1674132191,\"configurable\":4},\"61\":{\"name\":\"TextformatterEntities\",\"title\":\"HTML Entity Encoder (htmlspecialchars)\",\"version\":100,\"created\":1674129890},\"117\":{\"name\":\"JqueryUI\",\"title\":\"jQuery UI\",\"version\":\"1.10.4\",\"singular\":true,\"created\":1674129890,\"permanent\":true},\"103\":{\"name\":\"JqueryTableSorter\",\"title\":\"jQuery Table Sorter Plugin\",\"version\":\"2.31.3\",\"singular\":1,\"created\":1674129890},\"116\":{\"name\":\"JqueryCore\",\"title\":\"jQuery Core\",\"version\":\"1.12.4\",\"singular\":true,\"created\":1674129890,\"permanent\":true},\"45\":{\"name\":\"JqueryWireTabs\",\"title\":\"jQuery Wire Tabs Plugin\",\"version\":110,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"151\":{\"name\":\"JqueryMagnific\",\"title\":\"jQuery Magnific Popup\",\"version\":\"1.1.0\",\"singular\":1,\"created\":1674129890},\"235\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"autoload\":true,\"singular\":true,\"created\":1767810562},\"176\":{\"name\":\"ImageSizerEngineIMagick\",\"title\":\"IMagick Image Sizer\",\"version\":3,\"created\":1675376201,\"configurable\":4},\"139\":{\"name\":\"SystemUpdater\",\"title\":\"System-Updater\",\"version\":20,\"singular\":true,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"113\":{\"name\":\"MarkupPageArray\",\"title\":\"PageArray Markup\",\"version\":100,\"autoload\":true,\"singular\":true,\"created\":1674129890},\"156\":{\"name\":\"MarkupHTMLPurifier\",\"title\":\"HTML Purifier\",\"version\":497,\"created\":1674129890},\"98\":{\"name\":\"MarkupPagerNav\",\"title\":\"Pager (Pagination) Navigation\",\"version\":105,\"created\":1674129890},\"67\":{\"name\":\"MarkupAdminDataTable\",\"title\":\"Admin Data Table\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"115\":{\"name\":\"PageRender\",\"title\":\"Seiten-Rendering\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"57\":{\"name\":\"FieldtypeImage\",\"title\":\"Images\",\"version\":102,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"105\":{\"name\":\"FieldtypeFieldsetOpen\",\"title\":\"Fieldset (Open)\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"6\":{\"name\":\"FieldtypeFile\",\"title\":\"Dateien\",\"version\":107,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"4\":{\"name\":\"FieldtypePage\",\"title\":\"Page Reference\",\"version\":107,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"1\":{\"name\":\"FieldtypeTextarea\",\"title\":\"Textarea\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"240\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"singular\":true,\"created\":1767810721},\"27\":{\"name\":\"FieldtypeModule\",\"title\":\"Module Reference\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"182\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":113,\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"singular\":true,\"created\":1675870656,\"configurable\":3},\"183\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":111,\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1675870656},\"111\":{\"name\":\"FieldtypePageTitle\",\"title\":\"Page Title\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"135\":{\"name\":\"FieldtypeURL\",\"title\":\"URL\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"84\":{\"name\":\"FieldtypeInteger\",\"title\":\"Integer\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"106\":{\"name\":\"FieldtypeFieldsetClose\",\"title\":\"Fieldset (Close)\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"133\":{\"name\":\"FieldtypePassword\",\"title\":\"Password\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"97\":{\"name\":\"FieldtypeCheckbox\",\"title\":\"Checkbox\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"89\":{\"name\":\"FieldtypeFloat\",\"title\":\"Flie\\u00dfkomma-Zahl\",\"version\":108,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"3\":{\"name\":\"FieldtypeText\",\"title\":\"Text\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"107\":{\"name\":\"FieldtypeFieldsetTabOpen\",\"title\":\"Fieldset in Tab (Open)\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"29\":{\"name\":\"FieldtypeEmail\",\"title\":\"E-Mail\",\"version\":101,\"created\":1674129890},\"28\":{\"name\":\"FieldtypeDatetime\",\"title\":\"Datetime\",\"version\":105,\"created\":1674129890},\"160\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":34,\"autoload\":\"template=admin\",\"created\":1674129903,\"configurable\":4},\"148\":{\"name\":\"AdminThemeDefault\",\"title\":\"Default\",\"version\":14,\"autoload\":\"template=admin\",\"created\":1674129890,\"configurable\":19},\"114\":{\"name\":\"PagePermissions\",\"title\":\"Page Permissions\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"85\":{\"name\":\"InputfieldInteger\",\"title\":\"Integer\",\"version\":105,\"created\":1674129890,\"permanent\":true},\"108\":{\"name\":\"InputfieldURL\",\"title\":\"URL\",\"version\":103,\"created\":1674129890},\"40\":{\"name\":\"InputfieldHidden\",\"title\":\"Versteckt\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"241\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1767810721},\"90\":{\"name\":\"InputfieldFloat\",\"title\":\"Flie\\u00dfkommazahl\",\"version\":105,\"created\":1674129890,\"permanent\":true},\"38\":{\"name\":\"InputfieldCheckboxes\",\"title\":\"Checkboxen\",\"version\":108,\"created\":1674129890,\"permanent\":true},\"36\":{\"name\":\"InputfieldSelect\",\"title\":\"select-Auswahl\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"78\":{\"name\":\"InputfieldFieldset\",\"title\":\"Fieldset\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"56\":{\"name\":\"InputfieldImage\",\"title\":\"Bilder\",\"version\":129,\"created\":1674129890,\"permanent\":true},\"35\":{\"name\":\"InputfieldTextarea\",\"title\":\"Textarea\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"55\":{\"name\":\"InputfieldFile\",\"title\":\"Dateien\",\"version\":129,\"created\":1674129890,\"permanent\":true},\"169\":{\"name\":\"InputfieldToggle\",\"title\":\"Umschalter\",\"version\":1,\"created\":1674132037},\"131\":{\"name\":\"InputfieldButton\",\"title\":\"Button\",\"version\":100,\"created\":1674129890,\"permanent\":true},\"25\":{\"name\":\"InputfieldAsmSelect\",\"title\":\"asmSelect\",\"version\":203,\"created\":1674129890,\"permanent\":true},\"60\":{\"name\":\"InputfieldPage\",\"title\":\"Page\",\"version\":109,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"80\":{\"name\":\"InputfieldEmail\",\"title\":\"E-Mail\",\"version\":102,\"created\":1674129890},\"86\":{\"name\":\"InputfieldPageName\",\"title\":\"Page Name\",\"version\":106,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"94\":{\"name\":\"InputfieldDatetime\",\"title\":\"Datum\\/Uhrzeit\",\"version\":108,\"created\":1674129890,\"permanent\":true},\"155\":{\"name\":\"InputfieldCKEditor\",\"title\":\"CKEditor\",\"version\":172,\"installs\":[\"MarkupHTMLPurifier\"],\"created\":1674129890},\"34\":{\"name\":\"InputfieldText\",\"title\":\"Text\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"37\":{\"name\":\"InputfieldCheckbox\",\"title\":\"Checkbox\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"79\":{\"name\":\"InputfieldMarkup\",\"title\":\"Markup\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"43\":{\"name\":\"InputfieldSelectMultiple\",\"title\":\"Multi-select\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"162\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"created\":1674129907},\"39\":{\"name\":\"InputfieldRadios\",\"title\":\"Radio-Buttons\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"112\":{\"name\":\"InputfieldPageTitle\",\"title\":\"Page Title\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"122\":{\"name\":\"InputfieldPassword\",\"title\":\"Passwort\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"174\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Seiten-Autovervollst\\u00e4ndigung\",\"version\":113,\"created\":1674135862},\"149\":{\"name\":\"InputfieldSelector\",\"title\":\"Selector\",\"version\":28,\"autoload\":\"template=admin\",\"created\":1674129890,\"configurable\":3,\"addFlag\":32},\"32\":{\"name\":\"InputfieldSubmit\",\"title\":\"Submit\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"168\":{\"name\":\"InputfieldTinyMCE\",\"title\":\"TinyMCE\",\"version\":618,\"icon\":\"keyboard-o\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"],\"MarkupHTMLPurifier\":[\">=\",0]},\"created\":1674132037,\"configurable\":4},\"167\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text tags\",\"version\":7,\"icon\":\"tags\",\"created\":1674131889},\"30\":{\"name\":\"InputfieldForm\",\"title\":\"Formular\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"15\":{\"name\":\"InputfieldPageListSelect\",\"title\":\"Seitenbaum-Auswahl\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"137\":{\"name\":\"InputfieldPageListSelectMultiple\",\"title\":\"Multi-Seitenbaum-Auswahl\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"41\":{\"name\":\"InputfieldName\",\"title\":\"Name\",\"version\":100,\"created\":1674129890,\"permanent\":true},\"50\":{\"name\":\"ProcessModule\",\"title\":\"Module\",\"version\":121,\"permission\":\"module-admin\",\"created\":1674129890,\"permanent\":true,\"useNavJSON\":true,\"nav\":[{\"url\":\"?site#tab_site_modules\",\"label\":\"Site\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?site=1\"},{\"url\":\"?core#tab_core_modules\",\"label\":\"Core\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?core=1\"},{\"url\":\"?configurable#tab_configurable_modules\",\"label\":\"Configure\",\"icon\":\"gear\",\"navJSON\":\"navJSON\\/?configurable=1\"},{\"url\":\"?install#tab_install_modules\",\"label\":\"Install\",\"icon\":\"sign-in\",\"navJSON\":\"navJSON\\/?install=1\"},{\"url\":\"?new#tab_new_modules\",\"label\":\"New\",\"icon\":\"plus\"},{\"url\":\"?reset=1\",\"label\":\"Refresh\",\"icon\":\"refresh\"}]},\"48\":{\"name\":\"ProcessField\",\"title\":\"Felder\",\"version\":114,\"icon\":\"cube\",\"permission\":\"field-admin\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"136\":{\"name\":\"ProcessPermission\",\"title\":\"Berechtigungen\",\"version\":101,\"icon\":\"gear\",\"permission\":\"permission-admin\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"252\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Passwort vergessen\",\"version\":104,\"permission\":\"page-view\",\"singular\":1,\"created\":1767810805,\"configurable\":4},\"121\":{\"name\":\"ProcessPageEditLink\",\"title\":\"Page Edit Link\",\"version\":112,\"icon\":\"link\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"161\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"icon\":\"tree\",\"permission\":\"logs-view\",\"singular\":1,\"created\":1674129907,\"useNavJSON\":true},\"150\":{\"name\":\"ProcessPageLister\",\"title\":\"Lister\",\"version\":26,\"icon\":\"search\",\"permission\":\"page-lister\",\"created\":1674129890,\"configurable\":true,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"87\":{\"name\":\"ProcessHome\",\"title\":\"Admin Start\",\"version\":101,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"68\":{\"name\":\"ProcessRole\",\"title\":\"Benutzerrollen\",\"version\":104,\"icon\":\"gears\",\"permission\":\"role-admin\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"83\":{\"name\":\"ProcessPageView\",\"title\":\"Seitenansicht\",\"version\":106,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"104\":{\"name\":\"ProcessPageSearch\",\"title\":\"Page Search\",\"version\":108,\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"12\":{\"name\":\"ProcessPageList\",\"title\":\"Page List\",\"version\":124,\"icon\":\"sitemap\",\"permission\":\"page-edit\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"134\":{\"name\":\"ProcessPageType\",\"title\":\"Seitentyp\",\"version\":101,\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"7\":{\"name\":\"ProcessPageEdit\",\"title\":\"Page Edit\",\"version\":112,\"icon\":\"edit\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"129\":{\"name\":\"ProcessPageEditImageSelect\",\"title\":\"Page Edit Image\",\"version\":121,\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"76\":{\"name\":\"ProcessList\",\"title\":\"Liste\",\"version\":101,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"14\":{\"name\":\"ProcessPageSort\",\"title\":\"Seiten sortieren und verschieben\",\"version\":101,\"permission\":\"page-edit\",\"created\":1674129890,\"permanent\":true},\"66\":{\"name\":\"ProcessUser\",\"title\":\"Benutzer\",\"version\":107,\"icon\":\"group\",\"permission\":\"user-admin\",\"created\":1674129890,\"configurable\":\"ProcessUserConfig.php\",\"permanent\":true,\"useNavJSON\":true},\"10\":{\"name\":\"ProcessLogin\",\"title\":\"Login\",\"version\":109,\"permission\":\"page-view\",\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"109\":{\"name\":\"ProcessPageTrash\",\"title\":\"Papierkorb (Seiten)\",\"version\":103,\"singular\":1,\"created\":1674129890,\"permanent\":true},\"159\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"singular\":1,\"created\":1674129902,\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"47\":{\"name\":\"ProcessTemplate\",\"title\":\"Templates\",\"version\":114,\"icon\":\"cubes\",\"permission\":\"template-admin\",\"created\":1674129890,\"configurable\":4,\"permanent\":true,\"useNavJSON\":true},\"17\":{\"name\":\"ProcessPageAdd\",\"title\":\"Seite hinzuf\\u00fcgen\",\"version\":109,\"icon\":\"plus-circle\",\"permission\":\"page-edit\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"138\":{\"name\":\"ProcessProfile\",\"title\":\"Benutzer-Profil\",\"version\":105,\"permission\":\"profile-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"125\":{\"name\":\"SessionLoginThrottle\",\"title\":\"Session Login Throttle\",\"version\":103,\"autoload\":\"function\",\"singular\":true,\"created\":1674129890,\"configurable\":3},\"185\":{\"name\":\"InputfieldRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix Inputfield\",\"version\":13,\"requiresVersions\":{\"FieldtypeRepeaterMatrix\":[\">=\",0]},\"created\":1675870663},\"184\":{\"name\":\"FieldtypeRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix\",\"version\":13,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.187\"],\"FieldtypeRepeater\":[\">=\",107],\"InputfieldRepeater\":[\">=\",109]},\"installs\":[\"InputfieldRepeaterMatrix\"],\"singular\":true,\"created\":1675870663,\"configurable\":3},\"263\":{\"name\":\"GithubRepositoryDispatch\",\"title\":\"Github Repository Dispatch\",\"version\":\"0.0.1\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.123\"]},\"installs\":[\"LazyCron\"],\"autoload\":true,\"singular\":true,\"created\":1769418190,\"configurable\":\"GithubRepositoryDispatch.config.php\"},\"213\":{\"name\":\"AppApi\",\"title\":\"AppApi\",\"version\":\"1.3.4\",\"icon\":\"terminal\",\"requiresVersions\":{\"PHP\":[\">=\",\"8.1.0\"],\"ProcessWire\":[\">=\",\"3.0.98\"]},\"autoload\":true,\"singular\":true,\"created\":1735122026,\"configurable\":\"AppApi.config.php\"},\"187\":{\"name\":\"ProcessCustomUploadNames\",\"title\":\"Custom Upload Names\",\"version\":\"1.3.5\",\"icon\":\"edit\",\"autoload\":true,\"singular\":true,\"created\":1676444074,\"configurable\":3,\"namespace\":\"\\\\\"},\"165\":{\"name\":\"ProcessDatabaseBackups\",\"title\":\"Database Backups\",\"version\":6,\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.62\"]},\"permission\":\"db-backup\",\"singular\":1,\"created\":1674130379,\"nav\":[{\"url\":\".\\/\",\"label\":\"View\",\"icon\":\"list\"},{\"url\":\"backup\\/\",\"label\":\"Backup\",\"icon\":\"plus-circle\"},{\"url\":\"upload\\/\",\"label\":\"Upload\",\"icon\":\"cloud-upload\"}]},\"186\":{\"name\":\"TextformatterRockDown\",\"title\":\"RockDown: Markdown-like Textformatter for Headlines\",\"version\":\"1.3.0\",\"singular\":true,\"created\":1675980776},\"261\":{\"name\":\"FieldtypeTable\",\"title\":\"ProFields: Table\",\"version\":30,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.227\"]},\"installs\":[\"InputfieldTable\"],\"singular\":true,\"created\":1767867631},\"262\":{\"name\":\"InputfieldTable\",\"title\":\"ProFields: Table\",\"version\":30,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.227\"]},\"created\":1767867631},\"164\":{\"name\":\"FileValidatorSvgSanitizer\",\"title\":\"SVG File Sanitizer\\/Validator\",\"version\":5,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.148\"]},\"created\":1674130355,\"configurable\":\"FileValidatorSvgSanitizer.config.php\",\"validates\":[\"svg\"]}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.site/modules/', 'FieldtypeRepeaterMatrix/InputfieldRepeaterMatrix.module\nFieldtypeRepeaterMatrix/FieldtypeRepeaterMatrix.module\nGithubRepositoryDispatch/GithubRepositoryDispatch.module.php\nAppApi/AppApi.module.php\nProcessCustomUploadNames/ProcessCustomUploadNames.module.php\nProcessDatabaseBackups/ProcessDatabaseBackups.module\nTextformatterRockDown/TextformatterRockDown.module.php\nInputfieldTinyMCE/InputfieldTinyMCE.module.php\nFieldtypeTable/FieldtypeTable.module\nFieldtypeTable/InputfieldTable.module\nFileValidatorSvgSanitizer/FileValidatorSvgSanitizer.module.php', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.wire/modules/', 'Page/PageFrontEdit/PageFrontEdit.module\nLanguageSupport/FieldtypePageTitleLanguage.module\nLanguageSupport/LanguageSupportFields.module\nLanguageSupport/FieldtypeTextLanguage.module\nLanguageSupport/LanguageTabs.module\nLanguageSupport/FieldtypeTextareaLanguage.module\nLanguageSupport/LanguageSupport.module\nLanguageSupport/LanguageSupportPageNames.module\nLanguageSupport/ProcessLanguageTranslator.module\nLanguageSupport/ProcessLanguage.module\nTextformatter/TextformatterSmartypants/TextformatterSmartypants.module\nTextformatter/TextformatterMarkdownExtra/TextformatterMarkdownExtra.module\nTextformatter/TextformatterPstripper.module\nTextformatter/TextformatterStripTags.module\nTextformatter/TextformatterEntities.module\nTextformatter/TextformatterNewlineBR.module\nTextformatter/TextformatterNewlineUL.module\nPagePathHistory.module\nJquery/JqueryUI/JqueryUI.module\nJquery/JqueryTableSorter/JqueryTableSorter.module\nJquery/JqueryCore/JqueryCore.module\nJquery/JqueryWireTabs/JqueryWireTabs.module\nJquery/JqueryMagnific/JqueryMagnific.module\nLazyCron.module\nImage/ImageSizerEngineIMagick/ImageSizerEngineIMagick.module\nImage/ImageSizerEngineAnimatedGif/ImageSizerEngineAnimatedGif.module\nSystem/SystemUpdater/SystemUpdater.module\nSystem/SystemNotifications/SystemNotifications.module\nSystem/SystemNotifications/FieldtypeNotifications.module\nMarkup/MarkupCache.module\nMarkup/MarkupPageArray.module\nMarkup/MarkupHTMLPurifier/MarkupHTMLPurifier.module\nMarkup/MarkupPagerNav/MarkupPagerNav.module\nMarkup/MarkupPageFields.module\nMarkup/MarkupAdminDataTable/MarkupAdminDataTable.module\nMarkup/MarkupRSS.module\nPageRender.module\nFieldtype/FieldtypeImage/FieldtypeImage.module\nFieldtype/FieldtypeFieldsetOpen.module\nFieldtype/FieldtypeCache.module\nFieldtype/FieldtypeFile/FieldtypeFile.module\nFieldtype/FieldtypePage.module\nFieldtype/FieldtypeTextarea.module\nFieldtype/FieldtypePageTable.module\nFieldtype/FieldtypeModule.module\nFieldtype/FieldtypeRepeater/FieldtypeFieldsetPage.module\nFieldtype/FieldtypeRepeater/FieldtypeRepeater.module\nFieldtype/FieldtypeRepeater/InputfieldRepeater.module\nFieldtype/FieldtypePageTitle.module\nFieldtype/FieldtypeURL.module\nFieldtype/FieldtypeInteger.module\nFieldtype/FieldtypeDecimal.module\nFieldtype/FieldtypeFieldsetClose.module\nFieldtype/FieldtypeOptions/FieldtypeOptions.module\nFieldtype/FieldtypePassword.module\nFieldtype/FieldtypeCheckbox.module\nFieldtype/FieldtypeFloat.module\nFieldtype/FieldtypeSelector.module\nFieldtype/FieldtypeComments/FieldtypeComments.module\nFieldtype/FieldtypeComments/InputfieldCommentsAdmin.module\nFieldtype/FieldtypeComments/CommentFilterAkismet.module\nFieldtype/FieldtypeText.module\nFieldtype/FieldtypeFieldsetTabOpen.module\nFieldtype/FieldtypeToggle.module\nFieldtype/FieldtypeEmail.module\nFieldtype/FieldtypeDatetime.module\nAdminTheme/AdminThemeReno/AdminThemeReno.module\nAdminTheme/AdminThemeUikit/AdminThemeUikit.module\nAdminTheme/AdminThemeDefault/AdminThemeDefault.module\nPagePermissions.module\nInputfield/InputfieldInteger.module\nInputfield/InputfieldURL.module\nInputfield/InputfieldHidden.module\nInputfield/InputfieldPageTable/InputfieldPageTable.module\nInputfield/InputfieldFloat.module\nInputfield/InputfieldCheckboxes/InputfieldCheckboxes.module\nInputfield/InputfieldSelect.module\nInputfield/InputfieldFieldset.module\nInputfield/InputfieldImage/InputfieldImage.module\nInputfield/InputfieldTextarea.module\nInputfield/InputfieldFile/InputfieldFile.module\nInputfield/InputfieldToggle/InputfieldToggle.module\nInputfield/InputfieldButton.module\nInputfield/InputfieldAsmSelect/InputfieldAsmSelect.module\nInputfield/InputfieldPage/InputfieldPage.module\nInputfield/InputfieldEmail.module\nInputfield/InputfieldPageName/InputfieldPageName.module\nInputfield/InputfieldDatetime/InputfieldDatetime.module\nInputfield/InputfieldCKEditor/InputfieldCKEditor.module\nInputfield/InputfieldText/InputfieldText.module\nInputfield/InputfieldCheckbox/InputfieldCheckbox.module\nInputfield/InputfieldMarkup.module\nInputfield/InputfieldSelectMultiple.module\nInputfield/InputfieldIcon/InputfieldIcon.module\nInputfield/InputfieldRadios/InputfieldRadios.module\nInputfield/InputfieldPageTitle/InputfieldPageTitle.module\nInputfield/InputfieldPassword/InputfieldPassword.module\nInputfield/InputfieldPageAutocomplete/InputfieldPageAutocomplete.module\nInputfield/InputfieldSelector/InputfieldSelector.module\nInputfield/InputfieldSubmit/InputfieldSubmit.module\nInputfield/InputfieldTinyMCE/InputfieldTinyMCE.module.php\nInputfield/InputfieldTextTags/InputfieldTextTags.module\nInputfield/InputfieldForm.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelect.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelectMultiple.module\nInputfield/InputfieldName.module\nPages/PagesVersions/PagesVersions.module.php\nPagePaths.module\nFileCompilerTags.module\nProcess/ProcessModule/ProcessModule.module\nProcess/ProcessPageClone.module\nProcess/ProcessField/ProcessField.module\nProcess/ProcessPermission/ProcessPermission.module\nProcess/ProcessForgotPassword/ProcessForgotPassword.module\nProcess/ProcessPageEditLink/ProcessPageEditLink.module\nProcess/ProcessLogger/ProcessLogger.module\nProcess/ProcessPageLister/ProcessPageLister.module\nProcess/ProcessHome.module\nProcess/ProcessRole/ProcessRole.module\nProcess/ProcessPageView.module\nProcess/ProcessPageSearch/ProcessPageSearch.module\nProcess/ProcessPageList/ProcessPageList.module\nProcess/ProcessPageType/ProcessPageType.module\nProcess/ProcessPageEdit/ProcessPageEdit.module\nProcess/ProcessPageEditImageSelect/ProcessPageEditImageSelect.module\nProcess/ProcessCommentsManager/ProcessCommentsManager.module\nProcess/ProcessList.module\nProcess/ProcessPageSort.module\nProcess/ProcessUser/ProcessUser.module\nProcess/ProcessPagesExportImport/ProcessPagesExportImport.module\nProcess/ProcessLogin/ProcessLogin.module\nProcess/ProcessPageTrash.module\nProcess/ProcessRecentPages/ProcessRecentPages.module\nProcess/ProcessTemplate/ProcessTemplate.module\nProcess/ProcessPageAdd/ProcessPageAdd.module\nProcess/ProcessProfile/ProcessProfile.module\nSession/SessionLoginThrottle/SessionLoginThrottle.module\nSession/SessionHandlerDB/ProcessSessionDB.module\nSession/SessionHandlerDB/SessionHandlerDB.module', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('ModulesUninstalled.info', '{\"PageFrontEdit\":{\"name\":\"PageFrontEdit\",\"title\":\"Front-End Page Editor\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables front-end editing of page fields.\",\"icon\":\"cube\",\"permissions\":{\"page-edit-front\":\"Use the front-end page editor\"},\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":\"PageFrontEditConfig.php\",\"core\":true,\"license\":\"MPL 2.0\"},\"LanguageTabs\":{\"name\":\"LanguageTabs\",\"title\":\"Languages Support - Tabs\",\"version\":117,\"versionStr\":\"1.1.7\",\"author\":\"adamspruijt, ryan, flipzoom\",\"summary\":\"Organizes multi-language fields into tabs for a cleaner easier to use interface.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"LanguageSupportPageNames\":{\"name\":\"LanguageSupportPageNames\",\"title\":\"Languages Support - Page Names\",\"version\":14,\"versionStr\":\"0.1.4\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language page names.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0],\"LanguageSupportFields\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"TextformatterSmartypants\":{\"name\":\"TextformatterSmartypants\",\"title\":\"SmartyPants Typographer\",\"version\":171,\"versionStr\":\"1.7.1\",\"summary\":\"Smart typography for web sites, by Michel Fortin based on SmartyPants by John Gruber. If combined with Markdown, it should be applied AFTER Markdown.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true,\"url\":\"https:\\/\\/github.com\\/michelf\\/php-smartypants\"},\"TextformatterPstripper\":{\"name\":\"TextformatterPstripper\",\"title\":\"Paragraph Stripper\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips paragraph <p> tags that may have been applied by other text formatters before it. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"TextformatterStripTags\":{\"name\":\"TextformatterStripTags\",\"title\":\"Strip Markup Tags\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips HTML\\/XHTML Markup Tags\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"TextformatterNewlineBR\":{\"name\":\"TextformatterNewlineBR\",\"title\":\"Newlines to XHTML Line Breaks\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to XHTML line break <br \\/> tags. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"TextformatterNewlineUL\":{\"name\":\"TextformatterNewlineUL\",\"title\":\"Newlines to Unordered List\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to <li> list items and surrounds in an <ul> unordered list. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"PagePathHistory\":{\"name\":\"PagePathHistory\",\"title\":\"Page Path History\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"Keeps track of past URLs where pages have lived and automatically redirects (301 permanent) to the new location whenever the past URL is accessed.\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"LazyCron\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true},\"ImageSizerEngineAnimatedGif\":{\"name\":\"ImageSizerEngineAnimatedGif\",\"title\":\"Animated GIF Image Sizer\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations for animated GIFs.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"SystemNotifications\":{\"name\":\"SystemNotifications\",\"title\":\"System Notifications\",\"version\":12,\"versionStr\":\"0.1.2\",\"summary\":\"Adds support for notifications in ProcessWire (currently in development)\",\"icon\":\"bell\",\"installs\":[\"FieldtypeNotifications\"],\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":\"SystemNotificationsConfig.php\",\"core\":true},\"FieldtypeNotifications\":{\"name\":\"FieldtypeNotifications\",\"title\":\"Notifications\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Field that stores user notifications.\",\"requiresVersions\":{\"SystemNotifications\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"MarkupCache\":{\"name\":\"MarkupCache\",\"title\":\"Markup Cache\",\"version\":101,\"versionStr\":\"1.0.1\",\"summary\":\"A simple way to cache segments of markup in your templates. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/markupcache\\/\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"MarkupPageFields\":{\"name\":\"MarkupPageFields\",\"title\":\"Markup Page Fields\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Adds $page->renderFields() and $page->images->render() methods that return basic markup for output during development and debugging.\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true,\"permanent\":true},\"MarkupRSS\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":105,\"versionStr\":\"1.0.5\",\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"icon\":\"rss-square\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeCache\":{\"name\":\"FieldtypeCache\",\"title\":\"Cache\",\"version\":102,\"versionStr\":\"1.0.2\",\"summary\":\"Caches the values of other fields for fewer runtime queries. Can also be used to combine multiple text fields and have them all be searchable under the cached field name.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypePageTable\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"A fieldtype containing a group of editable pages.\",\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeFieldsetPage\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Seite)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Fieldset mit Feldern, die getrennt sind, um den Namensraum zu trennen (Seite), um die Wiederverwendung von Feldern zu erm\\u00f6glichen.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeDecimal\":{\"name\":\"FieldtypeDecimal\",\"title\":\"Dezimal\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Feld, das eine Dezimalzahl speichert\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeOptions\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"versionStr\":\"0.0.2\",\"summary\":\"Feld welches Einzel- und Mehrfachauswahl-Optionen speichert.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeSelector\":{\"name\":\"FieldtypeSelector\",\"title\":\"Selector\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Avoine + ProcessWire\",\"summary\":\"Build a page finding selector visually.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeComments\":{\"name\":\"FieldtypeComments\",\"title\":\"Kommentare (Comments)\",\"version\":110,\"versionStr\":\"1.1.0\",\"summary\":\"Feld welches Kommentare von Nutzern zu einer einzelnen Seite speichert.\",\"installs\":[\"InputfieldCommentsAdmin\"],\"created\":1739545803,\"installed\":false,\"core\":true},\"InputfieldCommentsAdmin\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Administrator Kommentare\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Bietet ein administratives Interface zur Arbeit mit Kommentaren.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"CommentFilterAkismet\":{\"name\":\"CommentFilterAkismet\",\"title\":\"Kommentar-Filter: Akismet\",\"version\":200,\"versionStr\":\"2.0.0\",\"summary\":\"Nutzt den Akismet-Service um Kommentarspam zu identifizieren. Modul-Plugin f\\u00fcr den Feldtyp Kommentar.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeToggle\":{\"name\":\"FieldtypeToggle\",\"title\":\"Umschalter (Ja\\/Nein)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Konfigurierbares Ja\\/Nein, Ein-\\/Ausschalten als Alternative zu einem Kontrollk\\u00e4stchen, plus optionale &quot;andere&quot; Option.\",\"requiresVersions\":{\"InputfieldToggle\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"AdminThemeReno\":{\"name\":\"AdminThemeReno\",\"title\":\"Reno\",\"version\":17,\"versionStr\":\"0.1.7\",\"author\":\"Tom Reno (Renobird)\",\"summary\":\"Admin theme for ProcessWire 2.5+ by Tom Reno (Renobird)\",\"requiresVersions\":{\"AdminThemeDefault\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"InputfieldPageTable\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"versionStr\":\"0.1.4\",\"summary\":\"Eingabefeld erg\\u00e4nzend zu FieldtypePageTable\",\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"PagePaths\":{\"name\":\"PagePaths\",\"title\":\"Page Paths\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Enables page paths\\/urls to be queryable by selectors. Also offers potential for improved load performance. Builds an index at install (may take time on a large site).\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"FileCompilerTags\":{\"name\":\"FileCompilerTags\",\"title\":\"Tags File Compiler\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables {var} or {var.property} variables in markup sections of a file. Can be used with any API variable.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessPageClone\":{\"name\":\"ProcessPageClone\",\"title\":\"Seite klonen\",\"version\":106,\"versionStr\":\"1.0.6\",\"summary\":\"Stellt die M\\u00f6glichkeit bereit, Seiten im Admin-Bereich zu klonen\\/kopieren\\/duplizieren. F\\u00fcgt allen passenden Seiten in der PageList eine Option &quot;kopieren&quot; hinzu.\",\"permission\":\"page-clone\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"autoload\":\"template=admin\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true,\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"ProcessForgotPassword\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Passwort vergessen\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Erm\\u00f6glicht das Zur\\u00fccksetzen des Passworts\\/der E-Mail f\\u00fcr den Login.\",\"permission\":\"page-view\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessCommentsManager\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Kommentare\",\"version\":12,\"versionStr\":\"0.1.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Verwalten Sie Kommentare auf Ihrer Website au\\u00dferhalb des Seiteneditors.\",\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"created\":1739545803,\"installed\":false,\"searchable\":\"comments\",\"core\":true,\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"},\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Best\\u00e4tigt\"},{\"url\":\"?go=pending\",\"label\":\"Wartet\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"Alle\"}]},\"ProcessPagesExportImport\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables exporting and importing of pages. Development version, not yet recommended for production use.\",\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"created\":1739545803,\"installed\":false,\"core\":true,\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"ProcessSessionDB\":{\"name\":\"ProcessSessionDB\",\"title\":\"Sessions\",\"version\":5,\"versionStr\":\"0.0.5\",\"summary\":\"Erm\\u00f6glicht ihnen, die aktiven Datenbank Sessions zu durchsuchen\",\"icon\":\"dashboard\",\"requiresVersions\":{\"SessionHandlerDB\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true,\"page\":{\"name\":\"sessions-db\",\"parent\":\"access\",\"title\":\"Sessions\"}},\"SessionHandlerDB\":{\"name\":\"SessionHandlerDB\",\"title\":\"Session Handler Database\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Installing this module makes ProcessWire store sessions in the database rather than the file system. Note that this module will log you out after install or uninstall.\",\"installs\":[\"ProcessSessionDB\"],\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"GithubRepositoryDispatch\":{\"name\":\"GithubRepositoryDispatch\",\"title\":\"Github Repository Dispatch\",\"version\":\"0.0.1\",\"versionStr\":\"0.0.1\",\"author\":\"Daniel Stutz, Thomas Aull\",\"summary\":\"A small helper module to trigger a Github event called repository_dispatch.\",\"href\":\"https:\\/\\/docs.github.com\\/en\\/rest\\/repos\\/repos#create-a-repository-dispatch-event\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.123\"]},\"installs\":[\"LazyCron\"],\"autoload\":true,\"singular\":true,\"created\":1765475399,\"installed\":false,\"configurable\":\"GithubRepositoryDispatch.config.php\"},\"AppApi\":{\"name\":\"AppApi\",\"title\":\"AppApi\",\"version\":\"1.3.2\",\"versionStr\":\"1.3.2\",\"author\":\"Sebastian Schendel\",\"summary\":\"Module to create a REST API with ProcessWire\",\"href\":\"https:\\/\\/modules.processwire.com\\/modules\\/app-api\\/\",\"icon\":\"terminal\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.98\"]},\"permissions\":{\"appapi_manage_applications\":\"Manage AppApi settings\"},\"autoload\":true,\"singular\":true,\"created\":1735122024,\"installed\":false,\"configurable\":\"AppApi.config.php\",\"page\":{\"name\":\"appapi\",\"parent\":\"setup\",\"title\":\"AppApi\",\"icon\":\"terminal\"}},\"PagesVersions\":{\"name\":\"PagesVersions\",\"title\":\"Pages Versions\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Provides a version control API for pages in ProcessWire.\",\"icon\":\"code-fork\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('ModulesVerbose.info', '{\"179\":{\"summary\":\"Field that stores a page title in multiple languages. Use this only if you want title inputs created for ALL languages on ALL pages. Otherwise create separate languaged-named title fields, i.e. title_fr, title_es, title_fi, etc. \",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.0\"},\"178\":{\"summary\":\"Field that stores a single line of text in multiple languages\",\"core\":true,\"versionStr\":\"1.0.0\"},\"180\":{\"summary\":\"Field that stores a multiple lines of text in multiple languages\",\"core\":true,\"versionStr\":\"1.0.0\"},\"171\":{\"summary\":\"ProcessWire multi-language support.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.4\"},\"177\":{\"summary\":\"Required to use multi-language fields.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.1\"},\"173\":{\"summary\":\"Provides language translation capabilities for ProcessWire core and modules.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\"},\"172\":{\"summary\":\"Systemsprachen verwalten\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\",\"permissions\":{\"lang-edit\":\"Administer languages and static translation files\"}},\"170\":{\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"core\":true,\"versionStr\":\"1.8.0\"},\"61\":{\"summary\":\"Enkodiert kaufm\\u00e4nnisches Und, Anf\\u00fchrungszeichen (einfach und doppelt) und die Zeichen gr\\u00f6\\u00dfer\\/kleiner als mittels htmlspecialchars(str, ENT_QUOTES) in Entit\\u00e4ten. Es wird empfohlen, dies auf alle Text\\/Textarea-Felder mit Ausnahme derer, die einen Rich-Text-Editor oder eine Markup-Sprache wie Markdown verwenden, anzuwenden.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"117\":{\"summary\":\"jQuery UI as required by ProcessWire and plugins\",\"href\":\"https:\\/\\/ui.jquery.com\",\"core\":true,\"versionStr\":\"1.10.4\"},\"103\":{\"summary\":\"Provides a jQuery plugin for sorting tables.\",\"href\":\"https:\\/\\/mottie.github.io\\/tablesorter\\/\",\"core\":true,\"versionStr\":\"2.31.3\"},\"116\":{\"summary\":\"jQuery Core as required by ProcessWire Admin and plugins\",\"href\":\"https:\\/\\/jquery.com\",\"core\":true,\"versionStr\":\"1.12.4\"},\"45\":{\"summary\":\"Stellt ein jQuery-Plugin bereit, um in ProcessWire Tabs zu erzeugen\",\"core\":true,\"versionStr\":\"1.1.0\"},\"151\":{\"summary\":\"Provides lightbox capability for image galleries. Replacement for FancyBox. Uses Magnific Popup by @dimsemenov.\",\"href\":\"https:\\/\\/github.com\\/dimsemenov\\/Magnific-Popup\\/\",\"core\":true,\"versionStr\":\"1.1.0\"},\"235\":{\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"core\":true,\"versionStr\":\"1.0.4\"},\"176\":{\"summary\":\"Upgrades image manipulations to use PHP\'s ImageMagick library when possible.\",\"author\":\"Horst Nogajski\",\"core\":true,\"versionStr\":\"0.0.3\"},\"139\":{\"summary\":\"System-Versionen und Upgrades verwalten.\",\"core\":true,\"versionStr\":\"0.2.0\"},\"113\":{\"summary\":\"Adds renderPager() method to all PaginatedArray types, for easy pagination output. Plus a render() method to PageArray instances.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"156\":{\"summary\":\"Front-end to the HTML Purifier library.\",\"core\":true,\"versionStr\":\"4.9.7\"},\"98\":{\"summary\":\"Generates markup for pagination navigation\",\"core\":true,\"versionStr\":\"1.0.5\"},\"67\":{\"summary\":\"Generates markup for data tables used by ProcessWire admin\",\"core\":true,\"versionStr\":\"1.0.7\"},\"115\":{\"summary\":\"F\\u00fcgt Seiten eine Rendering-Methode und Caching der Seitenausgabe hinzu\",\"core\":true,\"versionStr\":\"1.0.5\"},\"57\":{\"summary\":\"Field that stores one or more GIF, JPG, or PNG images\",\"core\":true,\"versionStr\":\"1.0.2\"},\"105\":{\"summary\":\"Open a fieldset to group fields. Should be followed by a Fieldset (Close) after one or more fields.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"6\":{\"summary\":\"Feld, das eine oder mehrere Dateien speichert\",\"core\":true,\"versionStr\":\"1.0.7\"},\"4\":{\"summary\":\"Field that stores one or more references to ProcessWire pages\",\"core\":true,\"versionStr\":\"1.0.7\"},\"1\":{\"summary\":\"Field that stores multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.7\"},\"240\":{\"summary\":\"A fieldtype containing a group of editable pages.\",\"core\":true,\"versionStr\":\"0.0.8\"},\"27\":{\"summary\":\"Field that stores a reference to another module\",\"core\":true,\"versionStr\":\"1.0.2\"},\"182\":{\"summary\":\"Verwaltet eine Sammlung von Feldern, welche beliebig oft wiederholt werden k\\u00f6nnen.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"183\":{\"summary\":\"Wiederholt Felder aus einen anderen Template. Stellt das Eingabefeld f\\u00fcr FieldtypeRepeater bereit.\",\"core\":true,\"versionStr\":\"1.1.1\"},\"111\":{\"summary\":\"Field that stores a page title\",\"core\":true,\"versionStr\":\"1.0.0\"},\"135\":{\"summary\":\"Feld, welches eine URL speichert\",\"core\":true,\"versionStr\":\"1.0.1\"},\"84\":{\"summary\":\"Field that stores an integer\",\"core\":true,\"versionStr\":\"1.0.2\"},\"106\":{\"summary\":\"Close a fieldset opened by FieldsetOpen. \",\"core\":true,\"versionStr\":\"1.0.0\"},\"133\":{\"summary\":\"Field that stores a hashed and salted password\",\"core\":true,\"versionStr\":\"1.0.1\"},\"97\":{\"summary\":\"This Fieldtype stores an ON\\/OFF toggle via a single checkbox. The ON value is 1 and OFF value is 0.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"89\":{\"summary\":\"Feld, das eine Flie\\u00dfkommazahl speichert\",\"core\":true,\"versionStr\":\"1.0.8\"},\"3\":{\"summary\":\"Field that stores a single line of text\",\"core\":true,\"versionStr\":\"1.0.2\"},\"107\":{\"summary\":\"Open a fieldset to group fields. Same as Fieldset (Open) except that it displays in a tab instead.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"29\":{\"summary\":\"Field that stores an e-mail address\",\"core\":true,\"versionStr\":\"1.0.1\"},\"28\":{\"summary\":\"Field that stores a date and optionally time\",\"core\":true,\"versionStr\":\"1.0.5\"},\"160\":{\"summary\":\"Uikit v3 admin theme\",\"core\":true,\"versionStr\":\"0.3.4\"},\"148\":{\"summary\":\"Minimal admin theme that supports all ProcessWire features.\",\"core\":true,\"versionStr\":\"0.1.4\"},\"114\":{\"summary\":\"Adds various permission methods to Page objects that are used by Process modules.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"85\":{\"summary\":\"Integer (positiv oder negativ)\",\"core\":true,\"versionStr\":\"1.0.5\"},\"108\":{\"summary\":\"URL in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.3\"},\"40\":{\"summary\":\"Versteckter Wert in einem Formular\",\"core\":true,\"versionStr\":\"1.0.1\"},\"241\":{\"summary\":\"Eingabefeld erg\\u00e4nzend zu FieldtypePageTable\",\"core\":true,\"versionStr\":\"0.1.4\"},\"90\":{\"summary\":\"Flie\\u00dfkommazahl mit Genauigkeit\",\"core\":true,\"versionStr\":\"1.0.5\"},\"38\":{\"summary\":\"Auswahl zwischen mehreren Checkboxen\",\"core\":true,\"versionStr\":\"1.0.8\"},\"36\":{\"summary\":\"Auswahl eines einzelnen Wertes aus einer select-Box\",\"core\":true,\"versionStr\":\"1.0.3\"},\"78\":{\"summary\":\"Gruppiert eines oder mehrere Felder in einem Container\",\"core\":true,\"versionStr\":\"1.0.1\"},\"56\":{\"summary\":\"Ein oder mehrere hochzuladende Bilder (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"35\":{\"summary\":\"Mehrzeiliger Text\",\"core\":true,\"versionStr\":\"1.0.3\"},\"55\":{\"summary\":\"Eine oder mehrere hochzuladende Dateien (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"169\":{\"summary\":\"Ein Umschalter, der \\u00e4hnliche Eingabem\\u00f6glichkeiten wie ein Kontrollk\\u00e4stchen bietet, aber wesentlich konfigurierbarer ist.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"131\":{\"summary\":\"Button als Formular-Element, dem Sie optional ein href-Attribut zuweisen k\\u00f6nnen\",\"core\":true,\"versionStr\":\"1.0.0\"},\"25\":{\"summary\":\"Mehrfach-Auswahl; Progressive Enhancement, um mehrere Elemente auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"2.0.3\"},\"60\":{\"summary\":\"Select one or more pages\",\"core\":true,\"versionStr\":\"1.0.9\"},\"80\":{\"summary\":\"E-Mail-Adresse in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.2\"},\"86\":{\"summary\":\"Text input validated as a ProcessWire Page name field\",\"core\":true,\"versionStr\":\"1.0.6\"},\"94\":{\"summary\":\"Eingabefeld f\\u00fcr Datum und optional Uhrzeit.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"155\":{\"summary\":\"CKEditor-Textfeld Rich Text Editor\",\"core\":true,\"versionStr\":\"1.7.2\"},\"34\":{\"summary\":\"Einzelne Textzeile\",\"core\":true,\"versionStr\":\"1.0.6\"},\"37\":{\"summary\":\"Einzelne Checkbox zum Umschalten\",\"core\":true,\"versionStr\":\"1.0.6\"},\"79\":{\"summary\":\"Enth\\u00e4lt beliebiges anderes Markup und optional Kind-Eingabefelder\",\"core\":true,\"versionStr\":\"1.0.2\"},\"43\":{\"summary\":\"Mehrfachauswahl aus einer Liste\",\"core\":true,\"versionStr\":\"1.0.1\"},\"162\":{\"summary\":\"Ein Symbol ausw\\u00e4hlen\",\"core\":true,\"versionStr\":\"0.0.3\"},\"39\":{\"summary\":\"Radio-Buttons, um ein einzelnes Feld auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"1.0.6\"},\"112\":{\"summary\":\"Verwaltet die Eingabe des Seitentitels und automatische Erstellung des Seitennamens (wenn Name leer ist)\",\"core\":true,\"versionStr\":\"1.0.2\"},\"122\":{\"summary\":\"Passworteingabe mit Best\\u00e4tigungsfeld, das die Eingabe nicht zur\\u00fcckgibt.\",\"core\":true,\"versionStr\":\"1.0.2\"},\"174\":{\"summary\":\"Mehrfach-Seitenauswahl mit Autovervollst\\u00e4ndigung und Sortierbarkeit. Vorgesehen als Eingabefeld f\\u00fcr Page reference-Felder.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"149\":{\"summary\":\"Build a page finding selector visually.\",\"author\":\"Avoine + ProcessWire\",\"core\":true,\"versionStr\":\"0.2.8\"},\"32\":{\"summary\":\"Button, um Formulare abzusenden\",\"core\":true,\"versionStr\":\"1.0.3\"},\"168\":{\"summary\":\"TinyMCE rich text editor version 6.8.2.\",\"core\":true,\"versionStr\":\"6.1.8\"},\"167\":{\"summary\":\"Erm\\u00f6glicht die Eingabe von vom Benutzer eingegebenen Tags oder die Auswahl vordefinierter Tags.\",\"core\":true,\"versionStr\":\"0.0.7\"},\"30\":{\"summary\":\"Enth\\u00e4lt ein oder mehrere Formularfeld(er)\",\"core\":true,\"versionStr\":\"1.0.7\"},\"15\":{\"summary\":\"Auswahl einer einzelnen Seite aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.1\"},\"137\":{\"summary\":\"Auswahl mehrerer Seiten aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.3\"},\"41\":{\"summary\":\"Texteingabe, die als Namensfeld in ProcessWire g\\u00fcltig ist\",\"core\":true,\"versionStr\":\"1.0.0\"},\"50\":{\"summary\":\"Module auflisten, bearbeiten oder (de)installieren\",\"core\":true,\"versionStr\":\"1.2.1\"},\"48\":{\"summary\":\"Einzelne Felder bearbeiten, die Seiten-Daten enthalten\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"fields\"},\"136\":{\"summary\":\"System-Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.1\"},\"252\":{\"summary\":\"Erm\\u00f6glicht das Zur\\u00fccksetzen des Passworts\\/der E-Mail f\\u00fcr den Login.\",\"core\":true,\"versionStr\":\"1.0.4\"},\"121\":{\"summary\":\"Provides a link capability as used by some Fieldtype modules (like rich text editors).\",\"core\":true,\"versionStr\":\"1.1.2\"},\"161\":{\"summary\":\"System Protokolle anschauen und verwalten.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"}},\"150\":{\"summary\":\"Admin tool for finding and listing pages by any property.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.2.6\",\"permissions\":{\"page-lister\":\"Use Page Lister\"}},\"87\":{\"summary\":\"Agiert als Platzhalter-Prozess f\\u00fcr die Wurzelseite des Adminbereiches. Stellt die richtige Flow-Kontrolle nach dem Login sicher.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"68\":{\"summary\":\"Benutzerrollen und mit ihnen verkn\\u00fcpfte Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.4\"},\"83\":{\"summary\":\"Alle Seitenansichten werden durch diesen Prozess geroutet\",\"core\":true,\"versionStr\":\"1.0.6\"},\"104\":{\"summary\":\"Provides a page search engine for admin use.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"12\":{\"summary\":\"List pages in a hierarchical tree structure\",\"core\":true,\"versionStr\":\"1.2.4\"},\"134\":{\"summary\":\"Seiten eines bestimmten Typs auflisten, bearbeiten und hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.1\"},\"7\":{\"summary\":\"Edit a Page\",\"core\":true,\"versionStr\":\"1.1.2\"},\"129\":{\"summary\":\"Provides image manipulation functions for image fields and rich text editors.\",\"core\":true,\"versionStr\":\"1.2.1\"},\"76\":{\"summary\":\"Listet den Prozess auf, der jeder Unterseite der aktuellen Seite zugeordnet ist.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"14\":{\"summary\":\"Handhabt das sortieren und verschieben von Seiten in der Seiten-Liste\",\"core\":true,\"versionStr\":\"1.0.1\"},\"66\":{\"summary\":\"System-Benutzer verwalten\",\"core\":true,\"versionStr\":\"1.0.7\",\"searchable\":\"users\"},\"10\":{\"summary\":\"Login to ProcessWire\",\"core\":true,\"versionStr\":\"1.0.9\"},\"109\":{\"summary\":\"Handhabt das Leeren des Papierkorbs f\\u00fcr Seiten\",\"core\":true,\"versionStr\":\"1.0.3\"},\"159\":{\"summary\":\"Shows a list of recently edited pages in your admin.\",\"author\":\"Ryan Cramer\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"}},\"47\":{\"summary\":\"Templates auflisten und bearbeiten, die die Seitenausgabe kontrollieren\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"templates\"},\"17\":{\"summary\":\"Eine neue Seite hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.9\"},\"138\":{\"summary\":\"Erlaubt dem Benutzer, Passwort, E-Mail-Adresse und andere Einstellungen zu \\u00e4ndern, die Sie vorgeben.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"125\":{\"summary\":\"Throttles login attempts to help prevent dictionary attacks.\",\"core\":true,\"versionStr\":\"1.0.3\"},\"185\":{\"summary\":\"Commercial module (Inputfield) providing multi-type repeaters.\",\"href\":\"https:\\/\\/processwire.com\\/store\\/pro-fields\\/\",\"versionStr\":\"0.1.3\"},\"184\":{\"summary\":\"Commercial module (Fieldtype) providing multi-type repeaters.\",\"versionStr\":\"0.1.3\"},\"263\":{\"summary\":\"A small helper module to trigger a Github event called repository_dispatch.\",\"author\":\"Daniel Stutz, Thomas Aull\",\"href\":\"https:\\/\\/docs.github.com\\/en\\/rest\\/repos\\/repos#create-a-repository-dispatch-event\",\"versionStr\":\"0.0.1\"},\"213\":{\"summary\":\"Module to create a REST API with ProcessWire\",\"author\":\"Sebastian Schendel\",\"href\":\"https:\\/\\/modules.processwire.com\\/modules\\/app-api\\/\",\"versionStr\":\"1.3.4\",\"permissions\":{\"appapi_manage_applications\":\"Manage AppApi settings\"},\"page\":{\"name\":\"appapi\",\"parent\":\"setup\",\"title\":\"AppApi\",\"icon\":\"terminal\"}},\"187\":{\"summary\":\"Automatically rename file\\/image uploads according to a configurable format\",\"author\":\"Adrian Jones\",\"href\":\"http:\\/\\/modules.processwire.com\\/modules\\/process-custom-upload-names\\/\",\"versionStr\":\"1.3.5\"},\"165\":{\"summary\":\"Create and\\/or restore database backups from ProcessWire admin.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.6\",\"permissions\":{\"db-backup\":\"Manage database backups (recommended for superuser only)\"},\"page\":{\"name\":\"db-backups\",\"parent\":\"setup\",\"title\":\"DB Backups\"}},\"186\":{\"summary\":\"ProcessWire Textformatter for simple markdown style text formatting (*bold*, _italic_, ~strike~, ```mono```)\",\"versionStr\":\"1.3.0\"},\"261\":{\"summary\":\"Field that lets you define a database table of custom fields.\",\"versionStr\":\"0.3.0\"},\"262\":{\"summary\":\"Field that lets you define a database table of custom inputs.\",\"versionStr\":\"0.3.0\"},\"164\":{\"summary\":\"Validates and\\/or sanitizes uploaded SVG files.\",\"author\":\"Adrian and Ryan\",\"versionStr\":\"0.0.5\"}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('ModulesVersions.info', '{\"173\":102,\"121\":109}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Permissions.names', '{\"appapi_manage_applications\":1039,\"db-backup\":1018,\"lang-edit\":1021,\"logs-edit\":1014,\"logs-view\":1013,\"page-delete\":34,\"page-edit\":32,\"page-edit-recent\":1011,\"page-lister\":1006,\"page-lock\":54,\"page-move\":35,\"page-sort\":50,\"page-template\":51,\"page-view\":36,\"profile-edit\":53,\"user-admin\":52}', '2010-04-08 03:10:10');

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '160');

DROP TABLE IF EXISTS `field_alt_text`;
CREATE TABLE `field_alt_text` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `field_caption`;
CREATE TABLE `field_caption` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1102', '1317,1331', '2', '1316');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1106', '1320,1330', '2', '1319');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1117', '1121,1208,1209,1217,1222', '5', '1119');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1151', '1153,1531', '2', '1152');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1157', '1219,1322', '2', '1218');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1223', '1226,1229,1237,1239', '4', '1224');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1230', '1236', '1', '1231');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1232', '1238', '1', '1233');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1234', '1240', '1', '1235');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1269', '1272,1283', '2', '1270');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1275', '1278,1282', '2', '1276');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1284', '1287,1290', '2', '1285');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1291', '1294', '1', '1292');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1298', '1301,1305,1306', '3', '1299');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1308', '1311', '1', '1309');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1325', '1327,1328', '2', '1326');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1338', '1341,1344', '2', '1339');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1349', '1358,1359,1360', '3', '1350');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1364', '1368', '1', '1365');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1366', '1369', '1', '1367');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1371', '1374', '1', '1372');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1377', '1380', '1', '1378');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1383', '', '0', '1384');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1389', '', '0', '1390');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1395', '', '0', '1396');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1401', '', '0', '1402');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1407', '', '0', '1408');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1413', '', '0', '1414');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1419', '', '0', '1420');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1425', '', '0', '1426');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1431', '', '0', '1432');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1437', '', '0', '1438');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1448', '', '0', '1449');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1454', '', '0', '1455');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1460', '', '0', '1461');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1466', '', '0', '1467');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1489', '', '0', '1490');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1495', '', '0', '1496');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1532', '', '0', '1533');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1538', '', '0', '1539');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1544', '', '0', '1545');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1550', '', '0', '1551');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1556', '', '0', '1557');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1562', '', '0', '1563');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1576', '', '0', '1577');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1582', '', '0', '1583');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1588', '', '0', '1589');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1594', '', '0', '1595');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1600', '', '0', '1601');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1610', '', '0', '1611');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1616', '', '0', '1617');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1622', '', '0', '1623');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1628', '', '0', '1629');
INSERT INTO `field_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1634', '', '0', '1635');

DROP TABLE IF EXISTS `field_context`;
CREATE TABLE `field_context` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) unsigned NOT NULL,
  `number` int(11) DEFAULT NULL,
  `text` mediumtext,
  PRIMARY KEY (`data`),
  UNIQUE KEY `pages_id` (`pages_id`,`sort`),
  KEY `number` (`number`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_context` (`pages_id`, `data`, `sort`, `number`, `text`) VALUES('1205', '1', '0', '1', '1023:<p>Text für Fussnote 1. Let\'s see.</p>');
INSERT INTO `field_context` (`pages_id`, `data`, `sort`, `number`, `text`) VALUES('1205', '2', '1', '2', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>');
INSERT INTO `field_context` (`pages_id`, `data`, `sort`, `number`, `text`) VALUES('1205', '3', '2', '5', '1023:<p>Tes text</p>');
INSERT INTO `field_context` (`pages_id`, `data`, `sort`, `number`, `text`) VALUES('1205', '4', '3', '3', '1023:<p>dreier-text</p>');

DROP TABLE IF EXISTS `field_custom_links`;
CREATE TABLE `field_custom_links` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_custom_links` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1', '1140', '1', '1127');

DROP TABLE IF EXISTS `field_date_end`;
CREATE TABLE `field_date_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_date_end` (`pages_id`, `data`) VALUES('1148', '12.01.2026, 16:30h');

DROP TABLE IF EXISTS `field_date_start`;
CREATE TABLE `field_date_start` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_date_start` (`pages_id`, `data`) VALUES('1148', '12.01.2026, 15:58h');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(191) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_email` (`pages_id`, `data`) VALUES('41', '');

DROP TABLE IF EXISTS `field_external_link`;
CREATE TABLE `field_external_link` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_external_link` (`pages_id`, `data`) VALUES('1308', 'https://example.com');

DROP TABLE IF EXISTS `field_external_link_title`;
CREATE TABLE `field_external_link_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1308', 'Anmelden');
INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1322', 'Anmelden');
INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1328', 'Gespräch vereinbaren');
INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1330', 'Gespräch vereinbaren');
INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1331', 'Anmelden');
INSERT INTO `field_external_link_title` (`pages_id`, `data`) VALUES('1344', 'Anmelden');

DROP TABLE IF EXISTS `field_image`;
CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1117', 'green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg', '0', '[\"\"]', '2026-01-28 12:33:43', '2026-01-08 17:46:24', '{\"_136\":\"alt-text: Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"long_desc: Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"caption: Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"2025\",\"_144\":\"Olu Famule\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"134_2025 125_1120\"}', '638473', '41', '41', '2449', '1632', '1.50');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1148', 'nasa_03.jpg', '0', '[\"\"]', '2026-01-13 16:40:09', '2026-01-12 14:41:08', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi.\",\"_135\":\"test nasa mond\",\"_134\":\"2024\",\"_109\":\"Link-Titel\",\"_138\":\"https:\\/\\/www.example.com\",\"_125\":[1120],\"ix\":\"134_2024 125_1120\"}', '517283', '41', '41', '2001', '1485', '1.35');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1223', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-19 14:26:49', '2026-01-19 14:25:33', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1244', 'green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg', '0', '[\"\"]', '2026-01-19 14:47:08', '2026-01-19 14:46:54', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '638473', '41', '41', '2449', '1632', '1.50');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1256', 'philipp-trubchenko-1437555-unsplash.jpg', '0', '[\"\"]', '2026-02-06 10:12:43', '2026-01-20 15:49:47', '{\"_136\":\"Wald\",\"_137\":\"\",\"_135\":\"Test WZP\",\"_134\":\"\",\"_144\":\"Link-Titel\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"136_Wald 125_1120\"}', '1173991', '41', '41', '1629', '2455', '0.66');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1265', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-02-06 10:12:09', '2026-02-06 10:12:09', '{\"_136\":\"Wald\",\"_137\":\"\",\"_135\":\"Wald\",\"_134\":\"\",\"_144\":\"Wald\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"136_Wald 135_Wald 144_Wald 125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1267', 'green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg', '0', '[\"\"]', '2026-02-06 10:16:23', '2026-02-06 10:16:23', '{\"_136\":\"Nadelwald mit Nebel\",\"_137\":\"\",\"_135\":\"Nadelwald mit Nebel\",\"_134\":\"\",\"_144\":\"Link-Titel\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"125_1120\"}', '638473', '41', '41', '2449', '1632', '1.50');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1389', 'olu-famule-1476945-unsplash.jpg', '0', '[\"\"]', '2026-01-26 17:09:00', '2026-01-26 17:09:00', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1101298', '41', '41', '2413', '1656', '1.46');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1395', 'nasa_03.jpg', '0', '[\"\"]', '2026-01-26 16:40:40', '2026-01-26 16:40:30', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '517283', '41', '41', '2001', '1485', '1.35');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1401', 'snow.jpg', '0', '[\"\"]', '2026-01-26 16:41:00', '2026-01-26 16:41:00', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1441750', '41', '41', '1632', '2448', '0.67');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1407', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-26 16:41:23', '2026-01-26 16:41:23', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1413', 'green-chameleon-176136-unsplash.jpg', '0', '[\"\"]', '2026-01-26 16:43:03', '2026-01-26 16:43:03', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1342980', '41', '41', '2464', '1622', '1.52');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1419', 'nasa_01.jpg', '0', '[\"\"]', '2026-01-26 16:43:25', '2026-01-26 16:43:25', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1223583', '41', '41', '1632', '2448', '0.67');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1425', 'close-up-photo-of-green-leafed-plant-1407305.jpg', '0', '[\"\"]', '2026-01-26 16:44:57', '2026-01-26 16:44:57', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1297130', '41', '41', '1732', '2309', '0.75');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1431', '01.jpeg', '0', '[\"\"]', '2026-01-26 16:44:39', '2026-01-26 16:44:39', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2421009', '41', '41', '1912', '2091', '0.91');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1437', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-26 16:44:11', '2026-01-26 16:44:11', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1444', '05.jpg', '0', '[\"\"]', '2026-01-26 16:43:44', '2026-01-26 16:43:44', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1797732', '41', '41', '3054', '1309', '2.33');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1448', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-23 15:03:12', '2026-01-23 15:02:52', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1454', 'philipp-trubchenko-1437554-unsplash.jpg', '0', '[\"\"]', '2026-01-26 16:47:13', '2026-01-26 16:47:13', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1847194', '41', '41', '1635', '2443', '0.67');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1460', 'nasa_03.jpg', '0', '[\"\"]', '2026-01-26 16:47:33', '2026-01-26 16:47:33', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '517283', '41', '41', '2001', '1485', '1.35');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1466', 'close-up-photo-of-green-leafed-plant-1407305.jpg', '0', '[\"\"]', '2026-01-26 16:47:54', '2026-01-26 16:47:54', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1297130', '41', '41', '1732', '2309', '0.75');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1482', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-23 15:32:42', '2026-01-23 15:30:24', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1489', 'philipp-trubchenko-1437555-unsplash.jpg', '0', '[\"\"]', '2026-01-26 16:45:18', '2026-01-26 16:45:18', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1173991', '41', '41', '1629', '2455', '0.66');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1495', 'green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg', '0', '[\"\"]', '2026-01-26 16:45:56', '2026-01-26 16:45:56', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '638473', '41', '41', '2449', '1632', '1.50');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1501', 'green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg', '0', '[\"\"]', '2026-01-26 16:48:41', '2026-01-26 16:48:41', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '638473', '41', '41', '2449', '1632', '1.50');

DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1209', 'bright-countryside-dawn-daylight-302804.jpg', '0', '[\"\"]', '2026-01-28 13:09:15', '2026-01-19 09:55:35', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"2000\",\"_144\":\"Link-Person\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"134_2000 125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1209', 'close-up-photo-of-green-leafed-plant-1407305.jpg', '1', '[\"\"]', '2026-01-19 09:57:59', '2026-01-19 09:55:35', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"2000\",\"_144\":\"\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"134_2000 125_1120\"}', '1297130', '41', '41', '1732', '2309', '0.75');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1209', 'green-chameleon-176136-unsplash.jpg', '2', '[\"\"]', '2026-01-19 09:57:59', '2026-01-19 09:55:35', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"2000\",\"_144\":\"\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"134_2000 125_1120\"}', '1342980', '41', '41', '2464', '1622', '1.52');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1209', 'snow.jpg', '3', '[\"\"]', '2026-01-19 10:00:19', '2026-01-19 09:58:17', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"2020\",\"_144\":\"\",\"_138\":\"https:\\/\\/example.com\",\"_125\":[1120],\"ix\":\"134_2020 125_1120\"}', '1441750', '41', '41', '1632', '2448', '0.67');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1222', '05.jpg', '0', '[\"\"]', '2026-01-19 13:20:34', '2026-01-19 13:20:02', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1797732', '41', '41', '3054', '1309', '2.33');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1222', 'brennan-burling-1473819-unsplash.jpg', '1', '[\"\"]', '2026-01-19 13:20:34', '2026-01-19 13:20:02', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '600315', '41', '41', '2449', '1632', '1.50');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1222', 'bright-countryside-dawn-daylight-302804.jpg', '2', '[\"\"]', '2026-01-19 13:20:34', '2026-01-19 13:20:02', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '2152096', '41', '41', '2503', '1597', '1.57');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1305', '04.jpg', '0', '[\"\"]', '2026-01-21 15:51:25', '2026-01-21 15:51:12', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1102956', '41', '41', '2436', '1640', '1.49');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1358', '20250928_181058.jpg', '0', '[\"\"]', '2026-01-23 13:37:36', '2026-01-23 13:37:00', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo e\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium\",\"_134\":\"2025\",\"_109\":\"Meike Nachname\",\"_138\":\"https:\\/\\/www.meikenachname.de\",\"_125\":[1120],\"ix\":\"134_2025 125_1120\"}', '1172840', '41', '41', '1732', '2309', '0.75');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1482', 'olu-famule-1476945-unsplash.jpg', '0', '[\"\"]', '2026-01-23 15:33:04', '2026-01-23 15:32:42', '{\"_136\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_137\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1101298', '41', '41', '2413', '1656', '1.46');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1482', 'philipp-trubchenko-1437554-unsplash.jpg', '1', '[\"\"]', '2026-01-23 15:33:04', '2026-01-23 15:32:42', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1847194', '41', '41', '1635', '2443', '0.67');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1482', 'philipp-trubchenko-1437555-unsplash.jpg', '2', '[\"\"]', '2026-01-23 15:33:04', '2026-01-23 15:32:42', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1173991', '41', '41', '1629', '2455', '0.66');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1501', 'philipp-trubchenko-1437554-unsplash.jpg', '0', '[\"\"]', '2026-01-26 16:49:10', '2026-01-26 16:49:09', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1847194', '41', '41', '1635', '2443', '0.67');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1501', 'philipp-trubchenko-1437555-unsplash.jpg', '1', '[\"\"]', '2026-01-26 16:49:10', '2026-01-26 16:49:09', '{\"_136\":\"\",\"_137\":\"\",\"_135\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit.\",\"_134\":\"\",\"_109\":\"\",\"_138\":\"\",\"_125\":[1120],\"ix\":\"125_1120\"}', '1173991', '41', '41', '1629', '2455', '0.66');

DROP TABLE IF EXISTS `field_in_depth`;
CREATE TABLE `field_in_depth` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1200', '1202,1203,1207', '3', '1201');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1205', '1215', '1', '1206');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1227', '1241,1243', '2', '1228');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1246', '1248', '1', '1247');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1250', '', '0', '1251');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1273', '', '0', '1274');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1279', '', '0', '1280');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1288', '', '0', '1289');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1295', '', '0', '1296');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1302', '', '0', '1303');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1312', '1314,1315', '2', '1313');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1336', '', '0', '1337');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1342', '1345,1346,1347', '3', '1343');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1353', '1361,1362', '2', '1354');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1356', '', '0', '1357');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1375', '', '0', '1376');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1381', '', '0', '1382');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1387', '', '0', '1388');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1393', '', '0', '1394');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1399', '', '0', '1400');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1405', '', '0', '1406');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1411', '', '0', '1412');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1417', '', '0', '1418');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1423', '', '0', '1424');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1429', '', '0', '1430');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1435', '', '0', '1436');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1441', '', '0', '1442');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1446', '', '0', '1447');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1452', '', '0', '1453');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1458', '', '0', '1459');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1464', '', '0', '1465');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1470', '', '0', '1471');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1486', '1488', '1', '1487');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1493', '', '0', '1494');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1499', '', '0', '1500');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1503', '', '0', '1504');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1536', '', '0', '1537');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1542', '', '0', '1543');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1548', '', '0', '1549');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1554', '', '0', '1555');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1560', '', '0', '1561');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1566', '', '0', '1567');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1570', '', '0', '1571');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1574', '', '0', '1575');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1580', '', '0', '1581');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1586', '', '0', '1587');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1592', '', '0', '1593');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1598', '', '0', '1599');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1604', '', '0', '1605');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1608', '', '0', '1609');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1614', '', '0', '1615');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1620', '', '0', '1621');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1626', '', '0', '1627');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1632', '', '0', '1633');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1638', '', '0', '1639');
INSERT INTO `field_in_depth` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1642', '', '0', '1643');

DROP TABLE IF EXISTS `field_is_level_a`;
CREATE TABLE `field_is_level_a` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_is_level_a` (`pages_id`, `data`) VALUES('1020', '1');
INSERT INTO `field_is_level_a` (`pages_id`, `data`) VALUES('1132', '1');
INSERT INTO `field_is_level_a` (`pages_id`, `data`) VALUES('1174', '1');
INSERT INTO `field_is_level_a` (`pages_id`, `data`) VALUES('1348', '1');

DROP TABLE IF EXISTS `field_is_overview_category`;
CREATE TABLE `field_is_overview_category` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_is_overview_category` (`pages_id`, `data`) VALUES('1256', '1');
INSERT INTO `field_is_overview_category` (`pages_id`, `data`) VALUES('1265', '1');
INSERT INTO `field_is_overview_category` (`pages_id`, `data`) VALUES('1267', '1');

DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1023', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1023', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('1074', '1023', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `data` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `field_long_description`;
CREATE TABLE `field_long_description` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_long_description` (`pages_id`, `data`) VALUES('1308', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus biben.');

DROP TABLE IF EXISTS `field_meta_description`;
CREATE TABLE `field_meta_description` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_meta_description` (`pages_id`, `data`) VALUES('1', 'Carolin Herrlich gestaltet soziale Räume, Alltag und Gärten mit sozialer und zyklischer Permakultur.');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES('40', '', '');
INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES('41', 'XjKXMCjZ75mWMj5kWRPECoQfGrQUj/2', '$2y$11$9R9r79FcbSksSD8LkE/zI.');
INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES('1074', 'qQWhvlUX8YZAS8Amf2NTcD71Nf8FD.u', '$2y$11$pakEsKdTfzJQ0RHCFWOA6e');

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '32', '1');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '34', '2');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '35', '3');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('37', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '50', '4');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '51', '5');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '52', '7');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '53', '8');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '54', '6');

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1017', '165');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1022', '172');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1024', '173');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1038', '213');

DROP TABLE IF EXISTS `field_related_content`;
CREATE TABLE `field_related_content` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1109', '1200', '1', '1199');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1117', '1205', '1', '1122');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1151', '', '0', '1335');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1187', '', '0', '1249');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1223', '1227', '1', '1225');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1244', '1246', '1', '1245');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1269', '', '0', '1271');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1275', '', '0', '1277');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1284', '', '0', '1286');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1291', '', '0', '1293');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1298', '', '0', '1300');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1308', '1312', '1', '1310');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1338', '1342', '1', '1340');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1349', '1353', '1', '1351');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1371', '', '0', '1373');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1377', '', '0', '1379');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1383', '', '0', '1385');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1389', '', '0', '1391');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1395', '', '0', '1397');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1401', '', '0', '1403');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1407', '', '0', '1409');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1413', '', '0', '1415');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1419', '', '0', '1421');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1425', '', '0', '1427');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1431', '', '0', '1433');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1437', '', '0', '1439');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1444', '', '0', '1445');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1448', '', '0', '1450');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1454', '', '0', '1456');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1460', '', '0', '1462');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1466', '', '0', '1468');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1482', '1486', '1', '1484');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1489', '', '0', '1491');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1495', '', '0', '1497');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1501', '', '0', '1502');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1532', '', '0', '1534');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1538', '', '0', '1540');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1544', '', '0', '1546');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1550', '', '0', '1552');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1556', '', '0', '1558');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1562', '', '0', '1564');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1568', '', '0', '1569');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1572', '', '0', '1573');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1576', '', '0', '1578');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1582', '', '0', '1584');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1588', '', '0', '1590');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1594', '', '0', '1596');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1600', '', '0', '1602');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1606', '', '0', '1607');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1610', '', '0', '1612');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1616', '', '0', '1618');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1622', '', '0', '1624');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1628', '', '0', '1630');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1634', '', '0', '1636');
INSERT INTO `field_related_content` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1640', '', '0', '1641');

DROP TABLE IF EXISTS `field_repeater_matrix_type`;
CREATE TABLE `field_repeater_matrix_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1121', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1148', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1153', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1219', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1226', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1236', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1238', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1240', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1272', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1278', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1283', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1287', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1290', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1294', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1301', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1311', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1317', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1320', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1327', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1341', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1368', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1369', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1380', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1505', '1');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1209', '2');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1305', '2');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1358', '2');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1217', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1229', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1237', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1239', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1282', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1306', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1318', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1359', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1360', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1374', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1531', '3');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1208', '4');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1222', '5');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1322', '6');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1328', '6');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1330', '6');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1331', '6');
INSERT INTO `field_repeater_matrix_type` (`pages_id`, `data`) VALUES('1344', '6');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('40', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('1074', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '38', '2');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('1074', '1037', '1');

DROP TABLE IF EXISTS `field_select_accordion`;
CREATE TABLE `field_select_accordion` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1531', '1102', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1374', '1106', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1217', '1157', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1306', '1157', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1229', '1230', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1237', '1232', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1239', '1234', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1359', '1364', '0');
INSERT INTO `field_select_accordion` (`pages_id`, `data`, `sort`) VALUES('1360', '1366', '0');

DROP TABLE IF EXISTS `field_select_category`;
CREATE TABLE `field_select_category` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1275', '1258', '0');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1284', '1258', '0');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1269', '1262', '0');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1291', '1262', '0');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1269', '1263', '1');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1298', '1267', '0');
INSERT INTO `field_select_category` (`pages_id`, `data`, `sort`) VALUES('1308', '1281', '0');

DROP TABLE IF EXISTS `field_select_context`;
CREATE TABLE `field_select_context` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1281', '1253', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1281', '1254', '1');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1256', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1258', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1259', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1260', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1261', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1262', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1263', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1264', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1265', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1266', '1257', '0');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1267', '1257', '1');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1256', '1304', '1');
INSERT INTO `field_select_context` (`pages_id`, `data`, `sort`) VALUES('1267', '1304', '0');

DROP TABLE IF EXISTS `field_select_license`;
CREATE TABLE `field_select_license` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `field_select_page`;
CREATE TABLE `field_select_page` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1140', '1102', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1347', '1102', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1148', '1117', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1203', '1151', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1314', '1151', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1361', '1151', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1202', '1168', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1248', '1168', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1215', '1171', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1241', '1171', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1488', '1171', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1315', '1223', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1345', '1325', '0');

DROP TABLE IF EXISTS `field_slider`;
CREATE TABLE `field_slider` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_slider` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1', '1148', '1', '1147');

DROP TABLE IF EXISTS `field_subtitle`;
CREATE TABLE `field_subtitle` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1', 'Ich gestalte soziale Räume, Alltag und Gärten mit sozialer und zyklischer Permakultur.');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1102', 'Fragerunde in der Gruppe');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1106', 'Workshop vor Ort');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1117', 'Der Beginn von etwas Neuem');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1223', 'Untertitel der Ethik');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1269', 'Untertitel');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1308', 'Gut durchs Jahr');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1325', 'persönlich');

DROP TABLE IF EXISTS `field_table`;
CREATE TABLE `field_table` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) unsigned NOT NULL,
  `title` mediumtext,
  `value` mediumtext,
  PRIMARY KEY (`data`),
  UNIQUE KEY `pages_id` (`pages_id`,`sort`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_table` (`pages_id`, `data`, `sort`, `title`, `value`) VALUES('1208', '4', '0', '1023:<p>row 1</p>', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>');
INSERT INTO `field_table` (`pages_id`, `data`, `sort`, `title`, `value`) VALUES('1208', '5', '1', '1023:<p>Titel Zeile 2</p>', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. </p>');
INSERT INTO `field_table` (`pages_id`, `data`, `sort`, `title`, `value`) VALUES('1482', '6', '0', '1023:<p>Erste Zeile</p>', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>');
INSERT INTO `field_table` (`pages_id`, `data`, `sort`, `title`, `value`) VALUES('1482', '7', '1', '1023:<p>Zweite Info</p>', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>');
INSERT INTO `field_table` (`pages_id`, `data`, `sort`, `title`, `value`) VALUES('1501', '8', '0', '1023:<p>Info</p>', '1023:<p>Lorem ipsum dolor sit amet consectetur adipiscing elit.</p>');

DROP TABLE IF EXISTS `field_text`;
CREATE TABLE `field_text` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  `data1025` mediumtext,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`),
  FULLTEXT KEY `data1025` (`data1025`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('27', '<p>Die gesuchte Seite wurde nicht gefunden.<br />Zurück zur <a	data-pwid=1	href=\"/\">Startseite</a>.</p>', NULL);
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1109', '<p>Lorem <a href=\"http://www.test.com\">ipsum</a> dolor sit amet consectetur <a href=\"http://www.example.com\">adipiscing</a> elit. <em>Quisque</em> <strong>faucibus</strong> ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.</p>\n\n<p>Tempus leo eu <span class=\"highlight\">aenean</span> sed diam urna tempor.</p>\n\n<p>Pulvinar vivamus fringilla lacus nec metus<sup class=\"footnote\">2</sup> bibendum egestas.</p>\n\n<h6>Iaculis massa nisl malesuada lacinia integer nunc posuere.</h6>\n\n<blockquote>\n<p>Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n</blockquote>\n\n<ul><li>In id cursus mi pretium tellus duis convallis.</li>\n	<li>Tempus leo eu aenean sed diam urna tempor.</li>\n	<li>Pulvinar vivamus fringilla lacus nec metus bibendum egestas.</li>\n	<li>Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</li>\n</ul><ol><li>In id cursus mi pretium tellus duis convallis.</li>\n	<li>Tempus leo eu aenean sed diam urna tempor.</li>\n	<li>Pulvinar vivamus fringilla lacus nec metus bibendum egestas.</li>\n	<li>Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</li>\n</ol><p>4 In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos. 4 In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1121', '<p>Lorem ipsum dolor sit amet<sup class=\"footnote\">1</sup> consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada<sup class=\"footnote\">2</sup> lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1148', '<p>test text</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1153', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1168', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1171', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1175', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1178', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1181', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1184', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1187', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1208', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1209', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1217', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1219', '<p>Du hast ein Problem? Permakultur bietet ganzheitliche Lösungen! Komm in zu mir in die Online-Sprechstunde mit deiner Frage. Wir beginnen die Sprechstunde im redekreis, um anzukommen und in den tiefen Austausch zu finden. Im Anschluss gibt es die offene Fragerunde an mich, schick mir gerne mit dem Anmeldeformular eine konkrete Frage. So kann ich bestmöglichst helfen. Wenn wir noch Zeit haben, gebe ich Euch gerne einen Mini-Input zur Inspiration. <br /><br />\n🧭 Art<br />\nonline / 1x im Monat / inspiriered<br /><br />\n⚙️ Ablauf<br />\n- 30 min Redekreise<br />\n- 45 min Fragerunde (max. 10 Fragen)<br />\n- evtl. Zeit zum Austausch oder Mini-Input <br /><br />\n 💎 Rahmen<br />\nmax. 15 Tickets pro Sprechstunde / 15 Euro / 1,5h</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1222', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1226', '<p>Sorge für die Natur/Erde, Sorge für die Menschen, Teile gerecht. Für mich das wichtigste Werkzeug, das auf dem Permakultur-Weg zu einer natürlichen inneren Haltung werden darf. </p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1229', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1236', '<p>Bodenpflege #mulch-liebe<br />\nVielfalt im Garten z.B. mehrjähriges System in Schichten wie eine Obstbaumlebensgemeinschaft <br />\nWildtierhabitate</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1237', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1238', '<p>Selbstliebe pflegen -&gt; gutes Essen z.B.!<br />\nanderen Menschen offen begegnen, wirklich fragen: was bewegt dich gerade + wie geht es Dir? <br />\nehrliches mitteilen und zuhören in geschützten Räumen z.B. Redekreis</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1239', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1240', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1244', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1272', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1278', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1282', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1283', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1287', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1290', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1294', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1301', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1305', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1306', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1311', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1317', '<p>Du hast ein Problem? Permakultur bietet ganzheitliche Lösungen! Komm in zu mir in die Online-Sprechstunde mit deiner Frage. Wir beginnen die Sprechstunde im redekreis, um anzukommen und in den tiefen Austausch zu finden. Im Anschluss gibt es die offene Fragerunde an mich, schick mir gerne mit dem Anmeldeformular eine konkrete Frage. So kann ich bestmöglichst helfen. Wenn wir noch Zeit haben, gebe ich Euch gerne einen Mini-Input zur Inspiration. <br /><br />\n🧭 Art<br />\nonline / 1x im Monat / inspiriered<br /><br />\n⚙️ Ablauf<br />\n- 30 min Redekreise<br />\n- 45 min Fragerunde (max. 10 Fragen)<br />\n- evtl. Zeit zum Austausch oder Mini-Input <br /><br />\n 💎 Rahmen<br />\nmax. 15 Tickets pro Sprechstunde / 15 Euro / 1,5h</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1318', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1320', '<p>🧭 Du suchst:<br />\n- umfassender, individueller Beratung vor Ort<br />\n- Gestaltungsklarheit für ein naturnahes, resilientes Design im Bereich Garten&amp; Landschaft, Leuchtturmprojekte, Alltag und Gemeinschaft?<br />\n- konkrete nächsten Schritten für deine Herzensthemen, einer klaren Umsetzungsplanung, Pflanzlisten oder Ideen für die Gestaltung von sozialen Räumen<br />\n <br />\n🙌🏼 Ich biete dir:<br />\n- Ruhe, gute Vorbereitung und wertvolle Ideen<br />\n- einen individuellen Permakultur-Workshop vor Ort, bei dem wir einen Gestaltungsentwurf gemeinsam erarbeiten<br />\n- soziale Begleitung<br />\n- 3 Tickets für die Permakultur-Sprechstunde zusätzlich als Geschenk<br /><br />\n⚙️ Ablauf<br />\n- Erstkontakt und zusenden eines detaillierten Fragebogens<br />\n- Vorbereitungsgespräch online<br />\n- Besuch vor Ort, Beratung und Workshop<br />\n- Nachbereitung<br /><br />\n🫰🏼 Rahmen<br />\nindividuell /80 Euro pro Stunde / bezahlte An- und Abreise</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1322', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1327', '<p>🧭 Du suchst<br />\n- individuelle Impulse und Lösungansätze für deinen Garten, Projekt und andere Lebensräume<br />\n- eine klare einstündige Beratungen<br />\n- plus weiterführendes Material und Vorschläge für nächste Schritte<br /><br />\n⚙️ Ablauf<br />\n- ich sende Dir einen detaillierten Fragebogen, damit ich mir einen Überblick über deine Situation, Gegebenheiten und Fragen bekomme. Wir vereinbaren einen Termin zur online Erstberatung.<br />\n- persönliches 1h online Beratungsgespräch plus Ticket zu einer Permakultur-Sprechstunde<br />\n- weiterführende Informationen und Impulse <br /><br />\n 💎 Rahmen<br />\n 1h persönliche Beratung / 150 Euro / inkl. Ticket zur Permakultur-Sprechstunde</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1328', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1330', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1331', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1341', '<p>Kurze allgemeinere Beschreibung, was du bei Wisssenspaketen machst. Bspw. so ähnlich wie die Kurzbeschreibung auf der Landing Page. Hier direkt Bezug nehmen auf Inhalte der Seite, also z. B. sagen: erstes Eintauchen möglich für dich, falls du direktere Vertiefung brauchst, hier PK-Sprechstunde und Webinar.<br /><br />\nLorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1344', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1358', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1359', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1360', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1368', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1369', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>\n\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1374', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1380', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.<br /><br />\nLorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.</p>\n\n<p>Mail<br />\npost@herrliche-permakultur.de<br /><br />\nInstagram<br />\nlink@example.de<br />\n </p>\n\n<p>TikTok<br />\nlink@example.de</p>', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1386', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1392', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1398', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1404', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1410', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1416', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1422', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1428', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1434', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1440', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1444', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1451', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1457', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1463', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1469', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1492', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1498', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1505', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1531', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1535', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1541', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1547', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1553', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1559', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1565', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1568', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1572', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1579', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1585', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1591', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1597', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1603', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1606', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1613', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1619', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1625', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1631', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1637', '', '');
INSERT INTO `field_text` (`pages_id`, `data`, `data1025`) VALUES('1640', '', '');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Startseite');
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
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1017', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1018', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1020', 'Permakultur-Basics');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1021', 'Administer languages and static translation files');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1023', 'German');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1024', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1025', 'English');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1028', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1038', 'AppApi');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1039', 'Manage AppApi settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1046', 'content');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1101', 'Akkordions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1102', 'Permakultur-Sprechstunde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1106', 'Individuelle Beratung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1109', 'Grundlagen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1114', 'related_content');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1117', 'Einstieg');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1118', 'Lizenzen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1119', 'einstieg');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1120', 'CC-BY-SA-4.0');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1122', 'einstieg');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1126', 'custom_links');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1127', 'home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1132', 'Angebote');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1133', 'slider');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1147', 'home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1148', 'test');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1151', 'Beratungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1152', 'beratungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1157', 'Test-Akkordion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1168', 'Designprozesse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1171', 'Ganzheitliche Gestaltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1174', 'Gelebte Permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1175', 'Zyklische Permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1178', 'Permakultur im Alltag');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1181', 'Soziale Permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1184', 'Grüne Permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1187', 'Werkzeugpalette');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1194', 'in_depth');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1199', 'grundlagen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1201', '1768480363-7135-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1206', '1768480590-4746-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1208', 'Test-Tabelle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1217', 'Test-Akkordion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1218', 'test-akkordion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1223', 'Ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1224', 'ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1225', 'ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1228', '1768829092-2931-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1230', 'Sorge für die Erde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1231', 'sorge-fuer-die-erde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1232', 'Sorge für den Menschen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1233', 'sorge-fuer-den-menschen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1234', 'Fair Share');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1235', 'fair-share');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1244', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1245', 'grundlagen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1247', '1768830222-1289-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1249', 'werkzeugpalette');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1251', '1768831238-939-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1252', 'Kontexte');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1253', 'Veranstaltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1254', 'Shop');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1255', 'Kategorien');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1256', 'Beobachten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1257', 'Werkzeugpalette');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1258', 'Prinzipien');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1259', 'Basic');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1260', 'Leitsätze');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1261', 'Prinzipiensets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1262', 'Muster');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1263', 'Natürlich');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1264', 'Prozessmodelle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1265', 'Analyse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1266', 'Design');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1267', 'Praxiswissen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1268', 'Werkzeuge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1269', 'Sitzplatz in der Natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1270', 'sitzplatz-in-der-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1271', 'sitzplatz-in-der-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1274', '1768921390-978-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1275', '7 Ways To Think Differently');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1276', '7-ways-to-think-differently');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1277', '7-ways-to-think-differently');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1280', '1768927530-9982-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1281', 'Wiederkehrend');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1284', 'Ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1285', 'ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1286', 'ethik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1289', '1768995648-6046-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1291', 'Naturrhythmen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1292', 'naturrhythmen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1293', 'naturrhythmen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1296', '1768995762-8801-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1297', 'Blog');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1298', 'Blogeintrag 1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1299', 'blogeintrag-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1300', 'blogeintrag-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1303', '1769006650-7329-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1304', 'Blog');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1307', 'Veranstaltungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1308', 'Jahresprozesskurs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1309', 'jahresprozesskurs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1310', 'jahresprozesskurs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1313', '1769009174-8811-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1316', 'permakultur-sprechstunde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1319', 'individuelle-beratung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1325', 'Erstberatung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1326', 'erstberatung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1335', 'beratungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1337', '1769171074-2571-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1338', 'Wissenspakete');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1339', 'wissenspakete');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1340', 'wissenspakete');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1343', '1769171169-3317-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1348', 'Über mich');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1349', 'Vision und Vita');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1350', 'vision-und-vita');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1351', 'vision-und-vita');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1354', '1769171446-8393-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1355', 'zyklische-permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1357', '1769171645-0506-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1364', 'Meine Vision');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1365', 'meine-vision');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1366', 'Vita');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1367', 'vita');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1371', 'Wirkungsfelder');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1372', 'wirkungsfelder');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1373', 'wirkungsfelder');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1376', '1769173427-8681-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1377', 'Kontakt');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1378', 'kontakt');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1379', 'kontakt');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1382', '1769173614-6295-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1383', 'Leitfaden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1384', 'leitfaden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1385', 'leitfaden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1388', '1769173787-6825-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1389', 'Prinzipien');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1390', 'prinzipien');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1391', 'prinzipien');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1394', '1769173852-5951-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1395', 'Prozessmodelle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1396', 'prozessmodelle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1397', 'prozessmodelle');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1400', '1769174804-8464-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1401', 'Beobachten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1402', 'beobachten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1403', 'beobachten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1406', '1769174872-9865-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1407', 'Analyse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1408', 'analyse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1409', 'analyse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1412', '1769174897-7085-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1413', 'Design');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1414', 'design');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1415', 'design');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1418', '1769174922-5707-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1419', 'Umsetzung und Pflege');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1420', 'umsetzung-und-pflege');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1421', 'umsetzung-und-pflege');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1424', '1769174938-6856-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1425', 'Vorbild Natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1426', 'vorbild-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1427', 'vorbild-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1430', '1769175001-6628-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1431', 'Langfristiges Denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1432', 'langfristiges-denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1433', 'langfristiges-denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1436', '1769175022-8411-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1437', 'Ambivalenzen und Übergänge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1438', 'ambivalenzen-und-uebergaenge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1439', 'ambivalenzen-und-uebergaenge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1442', '1769175048-6154-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1444', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1445', 'zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1447', '1769176213-1449-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1448', 'Ganzheitliches Leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1449', 'ganzheitliches-leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1450', 'ganzheitliches-leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1453', '1769176786-8872-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1454', 'Einführung 8 Schilde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1455', 'einfuehrung-8-schilde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1456', 'einfuehrung-8-schilde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1459', '1769176809-5757-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1460', 'Zyklen in der Natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1461', 'zyklen-in-der-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1462', 'zyklen-in-der-natur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1465', '1769176827-325-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1466', 'Deinen Rhythmus finden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1467', 'deinen-rhythmus-finden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1468', 'deinen-rhythmus-finden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1471', '1769176851-6691-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1472', 'Herrliche Designbeispiele');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1482', 'Inklusiver Schrebergarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1484', 'inklusiver-schrebergarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1487', '1769178302-9126-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1489', 'Probleme sind dornige Chancen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1490', 'probleme-sind-dornige-chancen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1491', 'probleme-sind-dornige-chancen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1494', '1769441871-379-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1495', 'Systemisches Denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1496', 'systemisches-denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1497', 'systemisches-denken');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1500', '1769441922-3991-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1501', 'Abschiedsritual');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1502', 'abschiedsritual');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1504', '1769442506-647-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1532', 'Haltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1533', 'haltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1534', 'haltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1537', '1769594048-3306-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1538', 'Körper');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1539', 'koerper');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1540', 'koerper');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1543', '1769594067-62-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1544', 'In der Küche');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1545', 'in-der-kueche');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1546', 'in-der-kueche');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1549', '1769594086-6045-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1550', 'Wohnen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1551', 'wohnen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1552', 'wohnen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1555', '1769594103-1133-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1556', 'Unterwegs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1557', 'unterwegs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1558', 'unterwegs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1561', '1769594117-0287-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1562', 'Alltagskultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1563', 'alltagskultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1564', 'alltagskultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1567', '1769594147-1062-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1568', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1569', 'zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1571', '1769594203-9106-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1572', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1573', 'zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1575', '1769594243-0986-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1576', 'Innere Landschaft');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1577', 'innere-landschaft');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1578', 'innere-landschaft');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1581', '1769594259-533-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1582', 'Interaktion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1583', 'interaktion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1584', 'interaktion');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1587', '1769594276-2942-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1588', 'Räume');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1589', 'raeume');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1590', 'raeume');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1593', '1769594295-2524-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1594', 'Soziale Prozesse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1595', 'soziale-prozesse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1596', 'soziale-prozesse');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1599', '1769594313-8395-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1600', 'Kultur und prozesshaftes Leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1601', 'kultur-und-prozesshaftes-leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1602', 'kultur-und-prozesshaftes-leben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1605', '1769594342-1298-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1606', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1607', 'zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1609', '1769594373-1425-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1610', 'Design nach Bedürfnissen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1611', 'design-nach-beduerfnissen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1612', 'design-nach-beduerfnissen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1615', '1769594411-1512-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1616', 'Ablauf eines Designs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1617', 'ablauf-eines-designs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1618', 'ablauf-eines-designs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1621', '1769594429-9198-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1622', 'Gartenelemente');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1623', 'gartenelemente');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1624', 'gartenelemente');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1627', '1769594445-4229-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1628', 'Lebendige Räume kreieren');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1629', 'lebendige-raeume-kreieren');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1630', 'lebendige-raeume-kreieren');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1633', '1769594470-952-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1634', 'Der Naturgarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1635', 'der-naturgarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1636', 'der-naturgarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1639', '1769594488-7133-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1640', 'Zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1641', 'zusammenfassung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1643', '1769594615-0688-1');

DROP TABLE IF EXISTS `field_year`;
CREATE TABLE `field_year` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(191)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'accordion');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', 'accordions');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('127', 'blog');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('128', 'blog-post');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('115', 'categories');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('116', 'category');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('131', 'chapter');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('123', 'context');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('122', 'contexts');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('130', 'event');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('129', 'events');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'field-image');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'field-images');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'http-status');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', 'level-a');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('111', 'license');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('110', 'licenses');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('103', 'offer');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'overview');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('124', 'overview-tools');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('132', 'project');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('120', 'projects');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', 'repeater_content');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('113', 'repeater_custom_links');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('121', 'repeater_in_depth');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'repeater_related_content');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('114', 'repeater_slider');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('118', 'summary');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('126', 'tool');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'tools');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '99', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '109', '1', '{\"description\":\"Dies ist der kurze Introtext.\",\"label\":\"Introtext\",\"label1025\":\"Intro text\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '128', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '131', '3', NULL);
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
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '99', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '112', '2', '{\"allowMatrixTypes\":[1,2,3,4,5]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '122', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '98', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '100', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '112', '2', '{\"allowMatrixTypes\":[1,2,4,5,6],\"label\":\"Inhalt des Akkordions\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '98', '1', '{\"NS_matrix1\":{\"label\":\"Textfeld(er)\",\"label1025\":\"Text field(s)\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '103', '2', '{\"NS_matrix2\":{\"description\":\"F\\u00fcge max. 2 Bilder pro Bildblock hinzu.\",\"notes\":\"Exportiere die Bilder im Format JPG \\/ JPEG oder PNG und lade sie in h\\u00f6chster Qualit\\u00e4tsstufe hoch.\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '105', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '115', '5', '{\"NS_matrix4\":{\"label\":\"Tabellenzeilen\",\"label1025\":\"Table rows\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '117', '3', '{\"NS_matrix3\":{\"notes\":\"Du kannst das neu erstellte Akkordion nach dem Speichern per Klick auf den gr\\u00fcnen Titel bearbeiten.\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '144', '6', '{\"NS_matrix6\":{\"description\":\"F\\u00fcge hier das Label ein, welches f\\u00fcr den Button bei Angebotsseiten verwendet werden soll. Typischerweise \\\"Anmelden\\\".\",\"label\":\"Button-Label\",\"label1025\":\"Button label\",\"notes\":\"Der Button f\\u00fchrt aktuell zum Check-Out-Overlay, in dem man dir eine Mail zum Angebot schicken kann. Sukzessiv dann zum Shop.\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '99', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '112', '2', '{\"allowMatrixTypes\":[1,2,3,4,5,6]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '122', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '129', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '98', '1', '{\"description\":\"Dieser Text erscheint als Beschreibungstext zur \\u00dcbersichtsseite, wenn man auf das Akkordion \\\"Infos zu dieser Seite\\\" klickt.\",\"label\":\"Infos zu dieser Seite\",\"label1025\":\"Info about this page\",\"maxlength\":500}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '139', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '146', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '125', '6', '{\"description\":\"W\\u00e4hle hier die passende Lizenz aus. Standardm\\u00e4ssig ist CC-BY-SA-4.0 ausgew\\u00e4hlt.\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '134', '3', '{\"columnWidth\":20,\"label\":\"Erstellungsjahr\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '135', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '136', '0', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '137', '1', '{\"description\":\"Zus\\u00e4tzliche l\\u00e4ngere Beschreibung (optional), falls die Beschreibung (alt-text) nicht reicht. Besonders n\\u00fctzlich f\\u00fcr Diagramme, Infografiken oder Kunstwerke. Nicht auf der Webseite sichtbar.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '138', '5', '{\"columnWidth\":40,\"label\":\"Link\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '144', '4', '{\"columnWidth\":40,\"description\":\"Name der:s Urhebenden oder Rechteinhabenden.\",\"maxlength\":150,\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '1', '1', '{\"description\":\"Falls du dieses Feld leer l\\u00e4sst, wird der bestehende Titel des Links benutzt.\",\"maxlength\":50,\"required\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '126', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '1', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '98', '4', '{\"NS_matrix1\":{\"description\":\"Kurze Beschreibung der Slide\",\"label\":\"Beschreibung\",\"maxlength\":300}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '104', '5', '{\"NS_matrix1\":{\"required\":1}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '105', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '126', '7', '{\"NS_matrix1\":{\"required\":1}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '130', '2', '{\"NS_matrix1\":{\"description\":\"Nur relevant, wenn die Slide eine Veranstaltung ist!\\nGebe hier das Startdatum und ggf. -zeit im Format dd.mm.YYYY, HH:MMh ein. Beachte dies unbedingt, um Diskrepanzen \\u00fcber Seiten hinweg zu vermeiden.\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '132', '3', '{\"NS_matrix1\":{\"description\":\"Nur relevant, wenn die Slide eine Veranstaltung ist!\\nGebe hier das Eddatum und ggf. -zeit im Format dd.mm.YYYY, HH:MMh ein. Beachte dies unbedingt, um Diskrepanzen \\u00fcber Seiten hinweg zu vermeiden.\"}}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '143', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '104', '3', '{\"description\":\"F\\u00fcge hier ein Bild f\\u00fcr die \\u00dcbersichtsseite hinzu. Dies gilt aktuell nur f\\u00fcr Kategorien, die auf der \\u00dcberischtsseite der Werkzeugpalette erscheinen sollen.\",\"label\":\"Bild f\\u00fcr \\u00dcbersichtsseite\",\"showIf\":\"select_context%=1257\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '133', '1', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '147', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '125', '6', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '134', '3', '{\"columnWidth\":20,\"label\":\"Erstellungsjahr\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '135', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '136', '0', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '137', '1', '{\"description\":\"Zus\\u00e4tzliche l\\u00e4ngere Beschreibung (optional), falls die Beschreibung (alt-text) nicht reicht. Besonders n\\u00fctzlich f\\u00fcr Diagramme, Infografiken oder Kunstwerke. Nicht auf der Webseite sichtbar.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '138', '5', '{\"columnWidth\":40,\"label\":\"Link\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '144', '4', '{\"columnWidth\":40,\"description\":\"Name der:s Urhebenden oder Rechteinhabenden.\",\"maxlength\":150,\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '98', '2', '{\"label\":\"Schl\\u00fcsselaspekte\",\"label1025\":\"Key aspects\",\"notes\":\"Sammle hier die Schl\\u00fcsselaspekte des Kpaitels in einer Liste mit Spiegelstrichen.\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '104', '1', '{\"description\":\"Dieses Bild wird f\\u00fcr die Slideshow auf der \\u00dcbersichtsseite verwendet.\",\"label\":\"Bild f\\u00fcr \\u00dcbersichtsseite\",\"label1025\":\"Image for overview page\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '122', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '126', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('123', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('124', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('124', '98', '1', '{\"description\":\"Dieser Text erscheint als Beschreibungstext zur \\u00dcbersichtsseite, wenn man auf das Akkordion \\\"Infos zu dieser Seite\\\" klickt.\",\"label\":\"Infos zu dieser Seite\",\"label1025\":\"Info about this page\",\"maxlength\":500}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('124', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '112', '3', '{\"allowMatrixTypes\":[1,2,3,4,5]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '122', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '143', '2', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('127', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('128', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('128', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('128', '112', '3', '{\"allowMatrixTypes\":[1,2,3,4,5]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('128', '122', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('128', '143', '2', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('129', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '112', '4', '{\"allowMatrixTypes\":[1,2,3,4,5]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '122', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '137', '2', '{\"description\":\"Kurze Beschreibung, die auf der Veranstaltungs\\u00fcbersicht angezeigt wird (Veranstaltungen).\",\"label\":\"Kurze Beschreibung\",\"label1025\":\"Short description\",\"notes\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '138', '5', '{\"columnWidth\":50,\"description\":\"F\\u00fcge hier den Link zur Veranstaltung ein, mit dem man sich anmelden kann.\",\"label\":\"Anmeldelink zur Veranstaltung\",\"notes\":\"Format: https:\\/\\/www.example.com\",\"required\":1,\"requiredIf\":\"external_link_title!=\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '143', '3', '{\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '144', '6', '{\"columnWidth\":50,\"description\":\"F\\u00fcge hier den Titel zum Link zur Veranstaltung ein. Typischerweise \\\"Anmelden\\\"\",\"placeholder\":\"Anmelden\",\"placeholder1025\":\"Sign up\",\"required\":1,\"requiredIf\":\"external_link!=\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '99', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '104', '2', '{\"description\":\"Dieses Bild wird f\\u00fcr die Slideshow auf der \\u00dcbersichtsseite verwendet.\",\"label\":\"Bild f\\u00fcr \\u00dcbersichtsseite\",\"label1025\":\"Image for overview page\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '112', '3', '{\"allowMatrixTypes\":[1,2,3,4,5]}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '122', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '103', '3', '{\"label\":\"Slider f\\u00fcr die Projektbilder\",\"label1025\":\"Slider for project images\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '104', '2', '{\"description\":\"Lade hier das Bild hoch, das als Thumbnail auf der Gestaltungsbeispiele-Seite angezeigt werden soll.\",\"label\":\"Vorschaubild\",\"label1025\":\"Preview image\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '115', '4', '{\"description\":\"Nutze eine Zeile pro Projektinfo und erstelle so deine Tabelle f\\u00fcr die Projektinfos\",\"label\":\"Projektinfos\",\"required\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('132', '122', '5', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(191) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(191) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Titel', '{\"required\":1,\"size\":0,\"maxlength\":200,\"minlength\":0,\"showCount\":1,\"textformatters\":[\"TextformatterEntities\",\"TextformatterRockDown\"],\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"matchType\":\"verbose\",\"blankType\":\"null\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail-Adresse', '{\"size\":70,\"maxlength\":255,\"label1025\":\"E-Mail Address\",\"collapsed\":0,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeTextareaLanguage', 'text', '0', 'Text', '{\"inputfieldClass\":\"InputfieldCKEditor\",\"contentType\":0,\"htmlOptions\":[2],\"minlength\":0,\"maxlength\":0,\"showCount\":1,\"rows\":5,\"inlineMode\":1,\"height\":500,\"lazyMode\":1,\"features\":[\"toolbar\",\"stickybars\",\"purifier\",\"pasteFilter\"],\"toolbar\":\"Styles, Format, Blockquote, Bold, Italic, Underline, Link, Unlink, BulletedList, NumberedList, Redo, Undo\",\"plugins\":[\"link\",\"lists\",\"pwlink\"],\"toggles\":[2,4,8],\"headlines\":[\"h3\",\"h4\"],\"styleFormatsCSS\":\"#Align { display: none }\\n#Blocks (Blockquote)  { display: none }\\n#Blocks (Pre)  { display: none }\\n#Inline (Code)  { display: none }\\n#Inline (Strikethrough)  { display: none }\\n#Inline (Underline)  { display: none }\",\"textformatters\":[\"TextformatterEntities\"],\"langBlankInherit\":0,\"collapsed\":0,\"useACF\":1,\"usePurifier\":1,\"formatTags\":\"p;h6\",\"extraPlugins\":[\"pwimage\",\"pwlink\",\"sourcedialog\"],\"removePlugins\":\"image,magicline\",\"stylesSet\":\"mystyles:\\/site\\/modules\\/InputfieldCKEditor\\/mystyles_custom.js\",\"contentsInlineCss\":\"\\/site\\/modules\\/InputfieldCKEditor\\/contents-inline_custom.css\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypeText', 'meta_description', '0', 'Meta Description', '{\"description\":\"Zusammenfassung des Seiteninhalts f\\u00fcr Suchmaschinen\",\"collapsed\":2,\"minlength\":0,\"maxlength\":150,\"showCount\":1,\"size\":0,\"langBlankInherit\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1022,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeImage', 'images', '0', 'Bilder', '{\"fileSchema\":270,\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":10,\"outputFormat\":0,\"descriptionRows\":0,\"useTags\":0,\"gridMode\":\"list\",\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"textformatters\":[\"TextformatterEntities\"],\"noLang\":1,\"maxSize\":4,\"collapsed\":0,\"minWidth\":1600,\"minHeight\":1000,\"label1025\":\"Images\",\"notes\":\"Exportiere die Bilder im Format JPG \\/ JPEG oder PNG und lade sie in h\\u00f6chster Qualit\\u00e4tsstufe hoch.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeImage', 'image', '0', 'Bild', '{\"fileSchema\":270,\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":0,\"descriptionRows\":0,\"useTags\":0,\"gridMode\":\"list\",\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"textformatters\":[\"TextformatterEntities\"],\"maxSize\":4,\"collapsed\":0,\"minWidth\":1600,\"minHeight\":1000,\"label1025\":\"Image\",\"notes\":\"Exportiere das Bild im Format JPG \\/ JPEG oder PNG und lade es in h\\u00f6chster Qualit\\u00e4tsstufe hoch.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeInteger', 'repeater_matrix_type', '25', 'Repeater matrix type', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeText', 'subtitle', '0', 'Untertitel', '{\"label1025\":\"subtitle\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":200,\"showCount\":1,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypeRepeaterMatrix', 'content', '0', 'Inhaltsbaukasten', '{\"label1025\":\"Content builder\",\"template_id\":48,\"parent_id\":1046,\"matrix1_name\":\"type_text\",\"matrix1_head\":\"{#n} \\u2013 {matrix_label}: {matrix_summary}\",\"matrix1_sort\":0,\"matrix2_name\":\"type_images\",\"matrix2_label\":\"Bilderblock\",\"matrix2_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix2_label1025\":\"Images block\",\"matrix2_sort\":1,\"matrix3_name\":\"type_accordion\",\"matrix3_label\":\"Akkordionblock\",\"matrix3_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix3_label1025\":\"Accordion block\",\"matrix3_sort\":3,\"repeaterFields\":[105,98,103,117,1,115,144],\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":0,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"addType\":1,\"imageDefs\":\"type_text:\\ntype_images:\\ntype_accordion:\\ntype_table:\\ntype_slider:\\ntype_button:\",\"imageStyle\":\"margin:10px; width:200px;\",\"imageText\":1,\"allowChangeType\":2,\"collapsed\":0,\"matrix4_name\":\"type_table\",\"matrix4_label\":\"Tabellenblock\",\"matrix4_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix4_label1025\":\"Table block\",\"matrix4_fields\":[1,115],\"matrix4_sort\":4,\"matrix1_label\":\"Textblock\",\"matrix1_label1025\":\"Text block\",\"matrix1_fields\":[98],\"repeaterAddLabel\":\"Neuen Block hinzuf\\u00fcgen\",\"repeaterAddLabel1025\":\"Add new block\",\"matrix3_fields\":[117],\"matrix5_name\":\"type_slider\",\"matrix5_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix5_sort\":2,\"matrix5_label\":\"Sliderblock\",\"matrix2_fields\":[103],\"matrix5_fields\":[103],\"matrix6_name\":\"type_button\",\"matrix6_label\":\"Buttonblock\",\"matrix6_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix6_fields\":[144],\"matrix6_sort\":5}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeTable', 'table', '0', 'Tabelle', '{\"label1025\":\"Table\",\"maxCols\":2,\"col1name\":\"title\",\"col1label\":\"Titel\",\"col1type\":\"textareaCKELanguage\",\"col1width\":30,\"col1sort\":1,\"col1label1025\":\"Title\",\"col2name\":\"value\",\"col2label\":\"Text\",\"col2type\":\"textareaCKELanguage\",\"col2width\":30,\"col2sort\":2,\"col2label1025\":\"Text\",\"col3sort\":3,\"paginationLimit\":0,\"collapsed\":0,\"col1settings\":\"settingsField=text\\nuseACF=1\\nusePurifier=1\\ninherit=1\\nrows=4\\ntextformatters=CKEditor\\nplaceholder=\\ndefault=\\nmaxLength=250\",\"col2settings\":\"settingsField=text\\nuseACF=1\\nusePurifier=1\\ninherit=1\\nrows=4\\ntextformatters=CKEditor\\nplaceholder=\\ndefault=\",\"addRowLabel\":\"Zeile hinzuf\\u00fcgen\",\"addRowLabel1025\":\"Add row\",\"useActions\":1,\"col3name\":\"key_1\",\"col3type\":\"textareaCKE\",\"col3width\":40,\"col3settings\":\"settingsField=\\nuseACF=1\\nusePurifier=1\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypePage', 'select_accordion', '0', 'Auswahl des Akkordions', '{\"label1025\":\"Select an accordion\",\"derefAsPage\":2,\"inputfield\":\"InputfieldAsmSelect\",\"distinctAutojoin\":true,\"usePageEdit\":1,\"parent_id\":1101,\"template_id\":46,\"labelFieldName\":\"title\",\"addable\":1,\"collapsed\":0,\"description\":\"W\\u00e4hle max. ein Akkordion (neu erstellt oder aus Liste ausgew\\u00e4hlt) pro Block aus. F\\u00fcr mehrere aufeinanderfolgende Akkordions, f\\u00fcge neue Akkordionblocks hinzu.\",\"notes\":\"Du kannst die (neu) erstellte Seite per Klick auf den gr\\u00fcnen Titel bearbeiten.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeRepeater', 'related_content', '0', 'Myzel', '{\"label1025\":\"Mycel\",\"template_id\":54,\"parent_id\":1114,\"repeaterFields\":{\"1\":146,\"2\":139},\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":3,\"repeaterLoading\":1,\"rememberOpen\":1,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"collapsed\":0,\"repeaterTitle\":\"Inhalt des Myzels\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypePage', 'select_license', '0', 'Auswahl der Lizenz', '{\"label1025\":\"Selection of a license\",\"description\":\"W\\u00e4hle hier die passende Lizenz aus. Standardm\\u00e4ssig ist CC-BY-SA-4.0 ausgew\\u00e4hlt.\",\"derefAsPage\":2,\"inputfield\":\"InputfieldRadios\",\"distinctAutojoin\":true,\"optionColumns\":0,\"parent_id\":1118,\"labelFieldName\":\"title\",\"collapsed\":0,\"template_id\":57,\"addable\":1,\"defaultValue\":\"CC-BY-SA-4.0\",\"notes\":\"Mehr Infos unter Creative Commons an (https:\\/\\/creativecommons.org\\/share-your-work\\/). H\\u00e4ufige Lizenzen sind:\\n\\\"CC-BY-ND-4.0\\\": wenn du sicherstellen willst, dass das Medium unver\\u00e4ndert und mit Urhebendenangabe verwendet wird. Link: https:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/4.0\\/\\n\\\"CC-BY-SA-4.0\\\" wenn du sicherstellen willst, dass das Medium ver\\u00e4ndert werden kann und mit Urhebendenangabe verwendet wird. Link: https:\\/\\/creativecommons.org\\/licenses\\/by-sa\\/4.0\\/\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypePage', 'select_page', '0', 'Auswahl des Links', '{\"label1025\":\"Select a link\",\"derefAsPage\":2,\"inputfield\":\"_InputfieldTextTags\",\"distinctAutojoin\":true,\"operator\":\"%=\",\"searchFields\":\"title\",\"parent_id\":0,\"labelFieldName\":\".\",\"collapsed\":0,\"optionColumns\":0,\"useAjax\":0,\"allowUserTags\":0,\"closeAfterSelect\":1,\"maxItems\":1,\"labelFieldFormat\":\"{title} ({path})\",\"template_id\":52,\"template_ids\":[29,46,66,49],\"findPagesSelector\":\"sort=title\",\"description\":\"W\\u00e4hle einen Link aus dem Dropdown-Men\\u00fc. Die Links sind alphabetisch sortiert und zeigen zu besseren Orientierung ihren Titel und Pfad an. Im Auswahlfeld kannst du zudem auch nach einem Link suchen.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeRepeater', 'custom_links', '0', 'Indiviuelle Links', '{\"template_id\":59,\"parent_id\":1126,\"repeaterFields\":[126,1],\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":0,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"collapsed\":0,\"repeaterMaxItems\":4,\"repeaterTitle\":\"#n: {select_page}\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeCheckbox', 'is_level_a', '0', 'A-Level-Seite', '{\"label1025\":\"A level page\",\"description\":\"Diese Auswahl legt fest, ob diese Seite eine Seite auf oberster Ebene ist, die keinen eigenen Inhalt hat, nicht aktiv in der Navigation erscheint und daher nur als Strukturgeber dient.\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('130', 'FieldtypeText', 'date_start', '0', 'Startdatum', '{\"label1025\":\"Start date\",\"description\":\"Gebe hier das Startdatum und ggf. -zeit im Format dd.mm.YYYY, HH:MMh ein. Beachte dies unbedingt, um Diskrepanzen \\u00fcber Seiten hinweg zu vermeiden.\",\"notes\":\"Bsp: 01.01.2026, 18:00h\\nInfo: Wir nutzen hier \\\"h\\\" anstatt \\\"Uhr, um f\\u00fcr Mehrsprachigkeit ger\\u00fcstet zu sein.\\nDer Bindestrich zwischen den Daten wird automatisch eingef\\u00fcgt.\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":18,\"showCount\":1,\"size\":0,\"placeholder\":\"01.01.2026, 18:00h\",\"columnWidth\":50}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('131', 'FieldtypeRepeaterMatrix', 'slider', '0', 'Slider', '{\"label1025\":\"Slider\",\"template_id\":60,\"parent_id\":1133,\"matrix1_name\":\"type_home_slide\",\"matrix1_label\":\"Slide f\\u00fcr Slider auf der Startseite\",\"matrix1_head\":\"{#n} \\u2013 {matrix_label}\",\"matrix1_fields\":[1,130,132,98,104,143,126],\"matrix1_sort\":0,\"repeaterFields\":[105,1,130,132,98,104,143,126],\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":0,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"addType\":1,\"imageDefs\":\"type_home_slide:\",\"imageStyle\":\"margin:10px; width:200px;\",\"imageText\":1,\"allowChangeType\":2,\"collapsed\":0,\"repeaterMaxItems\":10}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('132', 'FieldtypeText', 'date_end', '0', 'Enddatum', '{\"label1025\":\"End date\",\"description\":\"Gebe hier das Eddatum und ggf. -zeit im Format dd.mm.YYYY, HH:MMh ein. Beachte dies unbedingt, um Diskrepanzen \\u00fcber Seiten hinweg zu vermeiden.\",\"notes\":\"Bsp: 01.01.2026, 18:00h\\nInfo: Wir nutzen hier \\\"h\\\" anstatt \\\"Uhr, um f\\u00fcr Mehrsprachigkeit ger\\u00fcstet zu sein.\\nDer Bindestrich zwischen den Daten wird automatisch eingef\\u00fcgt.\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":18,\"showCount\":1,\"size\":0,\"placeholder\":\"01.01.2026, 18:00h\",\"columnWidth\":50}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('133', 'FieldtypePage', 'select_context', '0', 'Kontext wählen', '{\"label1025\":\"Select context\",\"derefAsPage\":0,\"inputfield\":\"InputfieldTextTags\",\"distinctAutojoin\":true,\"useAjax\":0,\"allowUserTags\":0,\"closeAfterSelect\":1,\"maxItems\":0,\"parent_id\":1252,\"template_id\":69,\"labelFieldName\":\"title\",\"addable\":1,\"collapsed\":0,\"description\":\"W\\u00e4hle einen oder mehrere Kontexte aus der Liste. Die Kategorien sind alphabetisch sortiert. Im Auswahlfeld kannst du zudem auch nach einer Kategorie suchen oder eine neue Kategorie erstellen, indem du den gew\\u00fcnschten Namen eingibst.\",\"findPagesSelector\":\"sort=title\",\"notes\":\"Wichtig: nur einen Kontext pro PageReference auf den Seiten. Um eine Kategorie auf anderen Auswahl-Feldern verf\\u00fcgbar zu machen, kann eine Kategorie mehrere Kontexte haben.\",\"placeholder\":\"Kontext 1, Kontext 2, ...\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('134', 'FieldtypeText', 'year', '0', 'Jahr', '{\"label1025\":\"Year\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":4,\"maxlength\":4,\"showCount\":1,\"size\":0,\"description\":\"Jahr im Format YYYY.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('135', 'FieldtypePageTitle', 'caption', '1', 'Bildunterschrift', '{\"required\":1,\"size\":0,\"maxlength\":200,\"minlength\":0,\"showCount\":1,\"textformatters\":[\"TextformatterEntities\"],\"langBlankInherit\":0,\"notes\":\"Bsp: \\\"Unser Team freut sich auf Ihren Besuch!\\\"\",\"label1025\":\"Caption\",\"collapsed\":0,\"description\":\"Diese Bildunterschrift ist sichtbar unter dem Bild auf der Webseite. Achte auf einen Punkt am Ende des Satzes.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('136', 'FieldtypeText', 'alt_text', '0', 'Beschreibung', '{\"label1025\":\"Description\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":150,\"showCount\":1,\"size\":0,\"notes\":\"Bsp. \\\"L\\u00e4chelnde Barista serviert Kaffee\\\"\",\"description\":\"Kurzer Text (max. 1 bis 2 S\\u00e4tze), der das Bild beschreibt. Sehr wichtig, denn Screenreader lesen diesen vor. Ausserdem wird dieser Text angezeigt, wenn das Bild nicht geladen werden kann.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('137', 'FieldtypeText', 'long_description', '0', 'Längere Beschreibung', '{\"label1025\":\"Long description\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":255,\"showCount\":1,\"size\":0,\"notes\":\"Bsp: \\\"Eine Barista mit gr\\u00fcnem Sch\\u00fcrzenkleid reicht einem Kunden eine Tasse Kaffee \\u00fcber die Theke in einem hellen Caf\\u00e9.\\\"\",\"description\":\"Zus\\u00e4tzliche l\\u00e4ngere Beschreibung (optional), falls die Beschreibung (alt-text) nicht reicht. Besonders n\\u00fctzlich f\\u00fcr Diagramme, Infografiken oder Kunstwerke.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('138', 'FieldtypeURL', 'external_link', '0', 'Externer Link', '{\"description\":\"Link f\\u00fcr das Copyright im Format https:\\/\\/www.link.com.\",\"textformatters\":[\"TextformatterEntities\"],\"noRelative\":0,\"allowIDN\":0,\"allowQuotes\":0,\"addRoot\":0,\"collapsed\":0,\"minlength\":0,\"maxlength\":1024,\"showCount\":0,\"size\":0,\"placeholder\":\"https:\\/\\/www.example.com\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('139', 'FieldtypeRepeater', 'in_depth', '0', 'Vertiefung', '{\"label1025\":\"In-Depth\",\"description\":\"W\\u00e4hle hier bis zu 3 Elemente aus, zu denen gelinkt werden soll. Du kannst nach der Auswahl sortieren.\",\"template_id\":67,\"parent_id\":1194,\"repeaterFields\":[126],\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":0,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"collapsed\":0,\"repeaterMaxItems\":3,\"repeaterTitle\":\"#n: {select_page}\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('143', 'FieldtypePage', 'select_category', '0', 'Kategorie wählen', '{\"label1025\":\"Select category\",\"derefAsPage\":0,\"inputfield\":\"InputfieldTextTags\",\"distinctAutojoin\":true,\"useAjax\":0,\"allowUserTags\":0,\"closeAfterSelect\":1,\"maxItems\":2,\"parent_id\":0,\"template_id\":62,\"labelFieldName\":\".\",\"collapsed\":0,\"description\":\"W\\u00e4hle max. 2 Kategorien aus der Liste. Die Kategorien sind alphabetisch sortiert. Im Auswahlfeld kannst du zudem auch nach einer Kategorie suchen oder eine neue Kategorie erstellen, indem du den gew\\u00fcnschten Namen eingibst.\",\"labelFieldFormat\":\"{parent.title} > {title}\",\"placeholder\":\"Kategorie 1, Kategorie 2\",\"findPagesSelector\":\"include=all\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('144', 'FieldtypeText', 'external_link_title', '0', 'Link-Titel', '{\"label1025\":\"Link title\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":50,\"showCount\":1,\"size\":0,\"description\":\"F\\u00fcge hier den Titel zum Link zur Veranstaltung ein. Typischerweise \\\"Anmelden\\\"\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('146', 'FieldtypeTable', 'context', '0', 'Kontext', '{\"label1025\":\"Context\",\"maxCols\":2,\"col1name\":\"number\",\"col1label\":\"Nummer\",\"col1type\":\"int1\",\"col1width\":10,\"col1sort\":1,\"col1label1025\":\"Number\",\"col2name\":\"text\",\"col2label\":\"Text\",\"col2type\":\"textareaCKELanguage\",\"col2width\":90,\"col2sort\":2,\"col2label1025\":\"Text\",\"col3sort\":3,\"paginationLimit\":0,\"collapsed\":0,\"col1settings\":\"min=\\nmax=\",\"col2settings\":\"settingsField=text\\nuseACF=1\\nusePurifier=1\\ninherit=1\\nrows=4\\ntextformatters=CKEditor\\nplaceholder=\\ndefault=\",\"addRowLabel\":\"Eintrag hinzuf\\u00fcgen\",\"addRowLabel1025\":\"Add entry\",\"orderByCols\":[\"number\"],\"description\":\"F\\u00fcge hier Nummer und Inhalt der Fussnoten hinzu, falls du im Inhaltsblock im Text welche gesetzt hast. Achte darauf, dass die numerische Zuordnung stimmt. Die Reihenfolge wird nach dem Speichern automatisch absteigend sortiert. Diese Sektion wird zudem unter \\\"Kontext\\\" angezeigt.\",\"notes\":\"Beschr\\u00e4nke dich hier auf Text mit Formatierungen und Links.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('147', 'FieldtypeCheckbox', 'is_overview_category', '0', 'Kategorie auf Übersichtsseite', '{\"description\":\"Diese Auswahl legt fest, ob diese Kategorie auf der \\u00dcbersichtsseite Werkzeugpalette angezeigt werden soll. Beachte, dass du max. 8 Kategorien ausw\\u00e4hlen und zeigen kannst.\",\"notes\":\"Weise diesen Wert hier allen (max. 8) Kategorien zu, die auf der \\u00dcbersichtsseite dargestellt werden sollen.\",\"collapsed\":0,\"showIf\":\"select_context%=1257\"}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '{\"classOptions\":\"\",\"relOptions\":\"nofollow\\nnoopener\",\"targetOptions\":\"_blank\",\"extLinkClass\":\"\",\"extLinkRel\":\"noopener\",\"extLinkTarget\":\"_blank\",\"urlType\":\"0\"}', '2023-01-19 13:04:50');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":20,\"coreVersion\":\"3.0.246\"}', '2023-01-19 13:04:50');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', 'FileValidatorSvgSanitizer', '0', '', '2023-01-19 13:12:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'ProcessDatabaseBackups', '1', '', '2023-01-19 13:12:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'InputfieldTextTags', '0', '', '2023-01-19 13:38:09');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'InputfieldTinyMCE', '4', '{\"skin\":\"oxide\",\"skin_url\":\"\",\"content_css\":\"wire\",\"content_css_url\":\"\",\"extPluginOpts\":\"\",\"optionals\":[\"headlines\",\"styleFormatsCSS\",\"settingsJSON\"],\"headlines\":[\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h5\",\"h6\"],\"contextmenu\":\"default\",\"menubar\":\"default\",\"removed_menuitems\":\"default\",\"styleFormatsCSS\":\"#Align { display: none }\",\"invalid_styles\":\"default\",\"extraCSS\":\"\",\"pasteFilter\":\"default\",\"defaultsJSON\":\"\",\"defaultsFile\":\"\",\"debugMode\":0,\"-dups\":[\"\\/wire\\/modules\\/Inputfield\\/InputfieldTinyMCE\\/InputfieldTinyMCE.module.php\",\"\\/site\\/modules\\/InputfieldTinyMCE\\/InputfieldTinyMCE.module.php\"],\"-dups-use\":\"\\/wire\\/modules\\/Inputfield\\/InputfieldTinyMCE\\/InputfieldTinyMCE.module.php\"}', '2023-01-19 13:40:37');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('188', '.Modules.info', '8192', '{\"179\":{\"name\":\"FieldtypePageTitleLanguage\",\"title\":\"Page Title (Multi-Language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0],\"FieldtypeTextLanguage\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"178\":{\"name\":\"FieldtypeTextLanguage\",\"title\":\"Text (Multi-language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"180\":{\"name\":\"FieldtypeTextareaLanguage\",\"title\":\"Textarea (Multi-language)\",\"version\":100,\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"singular\":true,\"created\":1675586340},\"171\":{\"name\":\"LanguageSupport\",\"title\":\"Languages Support\",\"version\":104,\"installs\":[\"ProcessLanguage\",\"ProcessLanguageTranslator\"],\"autoload\":true,\"singular\":true,\"created\":1674133876,\"configurable\":3,\"addFlag\":32},\"177\":{\"name\":\"LanguageSupportFields\",\"title\":\"Languages Support - Fields\",\"version\":101,\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"installs\":[\"FieldtypePageTitleLanguage\",\"FieldtypeTextareaLanguage\",\"FieldtypeTextLanguage\"],\"autoload\":true,\"singular\":true,\"created\":1675586340},\"173\":{\"name\":\"ProcessLanguageTranslator\",\"title\":\"Language Translator\",\"version\":103,\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1674133877,\"configurable\":4},\"172\":{\"name\":\"ProcessLanguage\",\"title\":\"Sprachen\",\"version\":103,\"icon\":\"language\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1674133876,\"configurable\":3,\"useNavJSON\":true},\"170\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"singular\":1,\"created\":1674132191,\"configurable\":4},\"61\":{\"name\":\"TextformatterEntities\",\"title\":\"HTML Entity Encoder (htmlspecialchars)\",\"version\":100,\"created\":1674129890},\"117\":{\"name\":\"JqueryUI\",\"title\":\"jQuery UI\",\"version\":\"1.10.4\",\"singular\":true,\"created\":1674129890,\"permanent\":true},\"103\":{\"name\":\"JqueryTableSorter\",\"title\":\"jQuery Table Sorter Plugin\",\"version\":\"2.31.3\",\"singular\":1,\"created\":1674129890},\"116\":{\"name\":\"JqueryCore\",\"title\":\"jQuery Core\",\"version\":\"1.12.4\",\"singular\":true,\"created\":1674129890,\"permanent\":true},\"45\":{\"name\":\"JqueryWireTabs\",\"title\":\"jQuery Wire Tabs Plugin\",\"version\":110,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"151\":{\"name\":\"JqueryMagnific\",\"title\":\"jQuery Magnific Popup\",\"version\":\"1.1.0\",\"singular\":1,\"created\":1674129890},\"235\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"autoload\":true,\"singular\":true,\"created\":1767810562},\"176\":{\"name\":\"ImageSizerEngineIMagick\",\"title\":\"IMagick Image Sizer\",\"version\":3,\"created\":1675376201,\"configurable\":4},\"139\":{\"name\":\"SystemUpdater\",\"title\":\"System-Updater\",\"version\":20,\"singular\":true,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"113\":{\"name\":\"MarkupPageArray\",\"title\":\"PageArray Markup\",\"version\":100,\"autoload\":true,\"singular\":true,\"created\":1674129890},\"156\":{\"name\":\"MarkupHTMLPurifier\",\"title\":\"HTML Purifier\",\"version\":497,\"created\":1674129890},\"98\":{\"name\":\"MarkupPagerNav\",\"title\":\"Pager (Pagination) Navigation\",\"version\":105,\"created\":1674129890},\"67\":{\"name\":\"MarkupAdminDataTable\",\"title\":\"Admin Data Table\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"115\":{\"name\":\"PageRender\",\"title\":\"Seiten-Rendering\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"57\":{\"name\":\"FieldtypeImage\",\"title\":\"Images\",\"version\":102,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"105\":{\"name\":\"FieldtypeFieldsetOpen\",\"title\":\"Fieldset (Open)\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"6\":{\"name\":\"FieldtypeFile\",\"title\":\"Dateien\",\"version\":107,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"4\":{\"name\":\"FieldtypePage\",\"title\":\"Page Reference\",\"version\":107,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"1\":{\"name\":\"FieldtypeTextarea\",\"title\":\"Textarea\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"240\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"singular\":true,\"created\":1767810721},\"27\":{\"name\":\"FieldtypeModule\",\"title\":\"Module Reference\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"182\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":113,\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"singular\":true,\"created\":1675870656,\"configurable\":3},\"183\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":111,\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1675870656},\"111\":{\"name\":\"FieldtypePageTitle\",\"title\":\"Page Title\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"135\":{\"name\":\"FieldtypeURL\",\"title\":\"URL\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"84\":{\"name\":\"FieldtypeInteger\",\"title\":\"Integer\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"106\":{\"name\":\"FieldtypeFieldsetClose\",\"title\":\"Fieldset (Close)\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"133\":{\"name\":\"FieldtypePassword\",\"title\":\"Password\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"97\":{\"name\":\"FieldtypeCheckbox\",\"title\":\"Checkbox\",\"version\":101,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"89\":{\"name\":\"FieldtypeFloat\",\"title\":\"Flie\\u00dfkomma-Zahl\",\"version\":108,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"3\":{\"name\":\"FieldtypeText\",\"title\":\"Text\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"107\":{\"name\":\"FieldtypeFieldsetTabOpen\",\"title\":\"Fieldset in Tab (Open)\",\"version\":100,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"29\":{\"name\":\"FieldtypeEmail\",\"title\":\"E-Mail\",\"version\":101,\"created\":1674129890},\"28\":{\"name\":\"FieldtypeDatetime\",\"title\":\"Datetime\",\"version\":105,\"created\":1674129890},\"160\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":34,\"autoload\":\"template=admin\",\"created\":1674129903,\"configurable\":4},\"148\":{\"name\":\"AdminThemeDefault\",\"title\":\"Default\",\"version\":14,\"autoload\":\"template=admin\",\"created\":1674129890,\"configurable\":19},\"114\":{\"name\":\"PagePermissions\",\"title\":\"Page Permissions\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1674129890,\"permanent\":true},\"85\":{\"name\":\"InputfieldInteger\",\"title\":\"Integer\",\"version\":105,\"created\":1674129890,\"permanent\":true},\"108\":{\"name\":\"InputfieldURL\",\"title\":\"URL\",\"version\":103,\"created\":1674129890},\"40\":{\"name\":\"InputfieldHidden\",\"title\":\"Versteckt\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"241\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1767810721},\"90\":{\"name\":\"InputfieldFloat\",\"title\":\"Flie\\u00dfkommazahl\",\"version\":105,\"created\":1674129890,\"permanent\":true},\"38\":{\"name\":\"InputfieldCheckboxes\",\"title\":\"Checkboxen\",\"version\":108,\"created\":1674129890,\"permanent\":true},\"36\":{\"name\":\"InputfieldSelect\",\"title\":\"select-Auswahl\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"78\":{\"name\":\"InputfieldFieldset\",\"title\":\"Fieldset\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"56\":{\"name\":\"InputfieldImage\",\"title\":\"Bilder\",\"version\":129,\"created\":1674129890,\"permanent\":true},\"35\":{\"name\":\"InputfieldTextarea\",\"title\":\"Textarea\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"55\":{\"name\":\"InputfieldFile\",\"title\":\"Dateien\",\"version\":129,\"created\":1674129890,\"permanent\":true},\"169\":{\"name\":\"InputfieldToggle\",\"title\":\"Umschalter\",\"version\":1,\"created\":1674132037},\"131\":{\"name\":\"InputfieldButton\",\"title\":\"Button\",\"version\":100,\"created\":1674129890,\"permanent\":true},\"25\":{\"name\":\"InputfieldAsmSelect\",\"title\":\"asmSelect\",\"version\":203,\"created\":1674129890,\"permanent\":true},\"60\":{\"name\":\"InputfieldPage\",\"title\":\"Page\",\"version\":109,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"80\":{\"name\":\"InputfieldEmail\",\"title\":\"E-Mail\",\"version\":102,\"created\":1674129890},\"86\":{\"name\":\"InputfieldPageName\",\"title\":\"Page Name\",\"version\":106,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"94\":{\"name\":\"InputfieldDatetime\",\"title\":\"Datum\\/Uhrzeit\",\"version\":108,\"created\":1674129890,\"permanent\":true},\"155\":{\"name\":\"InputfieldCKEditor\",\"title\":\"CKEditor\",\"version\":172,\"installs\":[\"MarkupHTMLPurifier\"],\"created\":1674129890},\"34\":{\"name\":\"InputfieldText\",\"title\":\"Text\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"37\":{\"name\":\"InputfieldCheckbox\",\"title\":\"Checkbox\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"79\":{\"name\":\"InputfieldMarkup\",\"title\":\"Markup\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"43\":{\"name\":\"InputfieldSelectMultiple\",\"title\":\"Multi-select\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"162\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"created\":1674129907},\"39\":{\"name\":\"InputfieldRadios\",\"title\":\"Radio-Buttons\",\"version\":106,\"created\":1674129890,\"permanent\":true},\"112\":{\"name\":\"InputfieldPageTitle\",\"title\":\"Page Title\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"122\":{\"name\":\"InputfieldPassword\",\"title\":\"Passwort\",\"version\":102,\"created\":1674129890,\"permanent\":true},\"174\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Seiten-Autovervollst\\u00e4ndigung\",\"version\":113,\"created\":1674135862},\"149\":{\"name\":\"InputfieldSelector\",\"title\":\"Selector\",\"version\":28,\"autoload\":\"template=admin\",\"created\":1674129890,\"configurable\":3,\"addFlag\":32},\"32\":{\"name\":\"InputfieldSubmit\",\"title\":\"Submit\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"168\":{\"name\":\"InputfieldTinyMCE\",\"title\":\"TinyMCE\",\"version\":618,\"icon\":\"keyboard-o\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"],\"MarkupHTMLPurifier\":[\">=\",0]},\"created\":1674132037,\"configurable\":4},\"167\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text tags\",\"version\":7,\"icon\":\"tags\",\"created\":1674131889},\"30\":{\"name\":\"InputfieldForm\",\"title\":\"Formular\",\"version\":107,\"created\":1674129890,\"permanent\":true},\"15\":{\"name\":\"InputfieldPageListSelect\",\"title\":\"Seitenbaum-Auswahl\",\"version\":101,\"created\":1674129890,\"permanent\":true},\"137\":{\"name\":\"InputfieldPageListSelectMultiple\",\"title\":\"Multi-Seitenbaum-Auswahl\",\"version\":103,\"created\":1674129890,\"permanent\":true},\"41\":{\"name\":\"InputfieldName\",\"title\":\"Name\",\"version\":100,\"created\":1674129890,\"permanent\":true},\"50\":{\"name\":\"ProcessModule\",\"title\":\"Module\",\"version\":121,\"permission\":\"module-admin\",\"created\":1674129890,\"permanent\":true,\"useNavJSON\":true,\"nav\":[{\"url\":\"?site#tab_site_modules\",\"label\":\"Site\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?site=1\"},{\"url\":\"?core#tab_core_modules\",\"label\":\"Core\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?core=1\"},{\"url\":\"?configurable#tab_configurable_modules\",\"label\":\"Configure\",\"icon\":\"gear\",\"navJSON\":\"navJSON\\/?configurable=1\"},{\"url\":\"?install#tab_install_modules\",\"label\":\"Install\",\"icon\":\"sign-in\",\"navJSON\":\"navJSON\\/?install=1\"},{\"url\":\"?new#tab_new_modules\",\"label\":\"New\",\"icon\":\"plus\"},{\"url\":\"?reset=1\",\"label\":\"Refresh\",\"icon\":\"refresh\"}]},\"48\":{\"name\":\"ProcessField\",\"title\":\"Felder\",\"version\":114,\"icon\":\"cube\",\"permission\":\"field-admin\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"136\":{\"name\":\"ProcessPermission\",\"title\":\"Berechtigungen\",\"version\":101,\"icon\":\"gear\",\"permission\":\"permission-admin\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"252\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Passwort vergessen\",\"version\":104,\"permission\":\"page-view\",\"singular\":1,\"created\":1767810805,\"configurable\":4},\"121\":{\"name\":\"ProcessPageEditLink\",\"title\":\"Page Edit Link\",\"version\":112,\"icon\":\"link\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"161\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"icon\":\"tree\",\"permission\":\"logs-view\",\"singular\":1,\"created\":1674129907,\"useNavJSON\":true},\"150\":{\"name\":\"ProcessPageLister\",\"title\":\"Lister\",\"version\":26,\"icon\":\"search\",\"permission\":\"page-lister\",\"created\":1674129890,\"configurable\":true,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"87\":{\"name\":\"ProcessHome\",\"title\":\"Admin Start\",\"version\":101,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"68\":{\"name\":\"ProcessRole\",\"title\":\"Benutzerrollen\",\"version\":104,\"icon\":\"gears\",\"permission\":\"role-admin\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"83\":{\"name\":\"ProcessPageView\",\"title\":\"Seitenansicht\",\"version\":106,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"104\":{\"name\":\"ProcessPageSearch\",\"title\":\"Page Search\",\"version\":108,\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"12\":{\"name\":\"ProcessPageList\",\"title\":\"Page List\",\"version\":124,\"icon\":\"sitemap\",\"permission\":\"page-edit\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"134\":{\"name\":\"ProcessPageType\",\"title\":\"Seitentyp\",\"version\":101,\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"7\":{\"name\":\"ProcessPageEdit\",\"title\":\"Page Edit\",\"version\":112,\"icon\":\"edit\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"129\":{\"name\":\"ProcessPageEditImageSelect\",\"title\":\"Page Edit Image\",\"version\":121,\"permission\":\"page-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"76\":{\"name\":\"ProcessList\",\"title\":\"Liste\",\"version\":101,\"permission\":\"page-view\",\"created\":1674129890,\"permanent\":true},\"14\":{\"name\":\"ProcessPageSort\",\"title\":\"Seiten sortieren und verschieben\",\"version\":101,\"permission\":\"page-edit\",\"created\":1674129890,\"permanent\":true},\"66\":{\"name\":\"ProcessUser\",\"title\":\"Benutzer\",\"version\":107,\"icon\":\"group\",\"permission\":\"user-admin\",\"created\":1674129890,\"configurable\":\"ProcessUserConfig.php\",\"permanent\":true,\"useNavJSON\":true},\"10\":{\"name\":\"ProcessLogin\",\"title\":\"Login\",\"version\":109,\"permission\":\"page-view\",\"created\":1674129890,\"configurable\":4,\"permanent\":true},\"109\":{\"name\":\"ProcessPageTrash\",\"title\":\"Papierkorb (Seiten)\",\"version\":103,\"singular\":1,\"created\":1674129890,\"permanent\":true},\"159\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"singular\":1,\"created\":1674129902,\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"47\":{\"name\":\"ProcessTemplate\",\"title\":\"Templates\",\"version\":114,\"icon\":\"cubes\",\"permission\":\"template-admin\",\"created\":1674129890,\"configurable\":4,\"permanent\":true,\"useNavJSON\":true},\"17\":{\"name\":\"ProcessPageAdd\",\"title\":\"Seite hinzuf\\u00fcgen\",\"version\":109,\"icon\":\"plus-circle\",\"permission\":\"page-edit\",\"created\":1674129890,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"138\":{\"name\":\"ProcessProfile\",\"title\":\"Benutzer-Profil\",\"version\":105,\"permission\":\"profile-edit\",\"singular\":1,\"created\":1674129890,\"configurable\":3,\"permanent\":true},\"125\":{\"name\":\"SessionLoginThrottle\",\"title\":\"Session Login Throttle\",\"version\":103,\"autoload\":\"function\",\"singular\":true,\"created\":1674129890,\"configurable\":3},\"185\":{\"name\":\"InputfieldRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix Inputfield\",\"version\":13,\"requiresVersions\":{\"FieldtypeRepeaterMatrix\":[\">=\",0]},\"created\":1675870663},\"184\":{\"name\":\"FieldtypeRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix\",\"version\":13,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.187\"],\"FieldtypeRepeater\":[\">=\",107],\"InputfieldRepeater\":[\">=\",109]},\"installs\":[\"InputfieldRepeaterMatrix\"],\"singular\":true,\"created\":1675870663,\"configurable\":3},\"263\":{\"name\":\"GithubRepositoryDispatch\",\"title\":\"Github Repository Dispatch\",\"version\":\"0.0.1\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.123\"]},\"installs\":[\"LazyCron\"],\"autoload\":true,\"singular\":true,\"created\":1769418190,\"configurable\":\"GithubRepositoryDispatch.config.php\"},\"213\":{\"name\":\"AppApi\",\"title\":\"AppApi\",\"version\":\"1.3.4\",\"icon\":\"terminal\",\"requiresVersions\":{\"PHP\":[\">=\",\"8.1.0\"],\"ProcessWire\":[\">=\",\"3.0.98\"]},\"autoload\":true,\"singular\":true,\"created\":1735122026,\"configurable\":\"AppApi.config.php\"},\"187\":{\"name\":\"ProcessCustomUploadNames\",\"title\":\"Custom Upload Names\",\"version\":\"1.3.5\",\"icon\":\"edit\",\"autoload\":true,\"singular\":true,\"created\":1676444074,\"configurable\":3,\"namespace\":\"\\\\\"},\"165\":{\"name\":\"ProcessDatabaseBackups\",\"title\":\"Database Backups\",\"version\":6,\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.62\"]},\"permission\":\"db-backup\",\"singular\":1,\"created\":1674130379,\"nav\":[{\"url\":\".\\/\",\"label\":\"View\",\"icon\":\"list\"},{\"url\":\"backup\\/\",\"label\":\"Backup\",\"icon\":\"plus-circle\"},{\"url\":\"upload\\/\",\"label\":\"Upload\",\"icon\":\"cloud-upload\"}]},\"186\":{\"name\":\"TextformatterRockDown\",\"title\":\"RockDown: Markdown-like Textformatter for Headlines\",\"version\":\"1.3.0\",\"singular\":true,\"created\":1675980776},\"261\":{\"name\":\"FieldtypeTable\",\"title\":\"ProFields: Table\",\"version\":30,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.227\"]},\"installs\":[\"InputfieldTable\"],\"singular\":true,\"created\":1767867631},\"262\":{\"name\":\"InputfieldTable\",\"title\":\"ProFields: Table\",\"version\":30,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.227\"]},\"created\":1767867631},\"164\":{\"name\":\"FileValidatorSvgSanitizer\",\"title\":\"SVG File Sanitizer\\/Validator\",\"version\":5,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.148\"]},\"created\":1674130355,\"configurable\":\"FileValidatorSvgSanitizer.config.php\",\"validates\":[\"svg\"]}}', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('189', '.ModulesVerbose.info', '8192', '{\"179\":{\"summary\":\"Field that stores a page title in multiple languages. Use this only if you want title inputs created for ALL languages on ALL pages. Otherwise create separate languaged-named title fields, i.e. title_fr, title_es, title_fi, etc. \",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.0\"},\"178\":{\"summary\":\"Field that stores a single line of text in multiple languages\",\"core\":true,\"versionStr\":\"1.0.0\"},\"180\":{\"summary\":\"Field that stores a multiple lines of text in multiple languages\",\"core\":true,\"versionStr\":\"1.0.0\"},\"171\":{\"summary\":\"ProcessWire multi-language support.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.4\"},\"177\":{\"summary\":\"Required to use multi-language fields.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.1\"},\"173\":{\"summary\":\"Provides language translation capabilities for ProcessWire core and modules.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\"},\"172\":{\"summary\":\"Systemsprachen verwalten\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\",\"permissions\":{\"lang-edit\":\"Administer languages and static translation files\"}},\"170\":{\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"core\":true,\"versionStr\":\"1.8.0\"},\"61\":{\"summary\":\"Enkodiert kaufm\\u00e4nnisches Und, Anf\\u00fchrungszeichen (einfach und doppelt) und die Zeichen gr\\u00f6\\u00dfer\\/kleiner als mittels htmlspecialchars(str, ENT_QUOTES) in Entit\\u00e4ten. Es wird empfohlen, dies auf alle Text\\/Textarea-Felder mit Ausnahme derer, die einen Rich-Text-Editor oder eine Markup-Sprache wie Markdown verwenden, anzuwenden.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"117\":{\"summary\":\"jQuery UI as required by ProcessWire and plugins\",\"href\":\"https:\\/\\/ui.jquery.com\",\"core\":true,\"versionStr\":\"1.10.4\"},\"103\":{\"summary\":\"Provides a jQuery plugin for sorting tables.\",\"href\":\"https:\\/\\/mottie.github.io\\/tablesorter\\/\",\"core\":true,\"versionStr\":\"2.31.3\"},\"116\":{\"summary\":\"jQuery Core as required by ProcessWire Admin and plugins\",\"href\":\"https:\\/\\/jquery.com\",\"core\":true,\"versionStr\":\"1.12.4\"},\"45\":{\"summary\":\"Stellt ein jQuery-Plugin bereit, um in ProcessWire Tabs zu erzeugen\",\"core\":true,\"versionStr\":\"1.1.0\"},\"151\":{\"summary\":\"Provides lightbox capability for image galleries. Replacement for FancyBox. Uses Magnific Popup by @dimsemenov.\",\"href\":\"https:\\/\\/github.com\\/dimsemenov\\/Magnific-Popup\\/\",\"core\":true,\"versionStr\":\"1.1.0\"},\"235\":{\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"core\":true,\"versionStr\":\"1.0.4\"},\"176\":{\"summary\":\"Upgrades image manipulations to use PHP\'s ImageMagick library when possible.\",\"author\":\"Horst Nogajski\",\"core\":true,\"versionStr\":\"0.0.3\"},\"139\":{\"summary\":\"System-Versionen und Upgrades verwalten.\",\"core\":true,\"versionStr\":\"0.2.0\"},\"113\":{\"summary\":\"Adds renderPager() method to all PaginatedArray types, for easy pagination output. Plus a render() method to PageArray instances.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"156\":{\"summary\":\"Front-end to the HTML Purifier library.\",\"core\":true,\"versionStr\":\"4.9.7\"},\"98\":{\"summary\":\"Generates markup for pagination navigation\",\"core\":true,\"versionStr\":\"1.0.5\"},\"67\":{\"summary\":\"Generates markup for data tables used by ProcessWire admin\",\"core\":true,\"versionStr\":\"1.0.7\"},\"115\":{\"summary\":\"F\\u00fcgt Seiten eine Rendering-Methode und Caching der Seitenausgabe hinzu\",\"core\":true,\"versionStr\":\"1.0.5\"},\"57\":{\"summary\":\"Field that stores one or more GIF, JPG, or PNG images\",\"core\":true,\"versionStr\":\"1.0.2\"},\"105\":{\"summary\":\"Open a fieldset to group fields. Should be followed by a Fieldset (Close) after one or more fields.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"6\":{\"summary\":\"Feld, das eine oder mehrere Dateien speichert\",\"core\":true,\"versionStr\":\"1.0.7\"},\"4\":{\"summary\":\"Field that stores one or more references to ProcessWire pages\",\"core\":true,\"versionStr\":\"1.0.7\"},\"1\":{\"summary\":\"Field that stores multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.7\"},\"240\":{\"summary\":\"A fieldtype containing a group of editable pages.\",\"core\":true,\"versionStr\":\"0.0.8\"},\"27\":{\"summary\":\"Field that stores a reference to another module\",\"core\":true,\"versionStr\":\"1.0.2\"},\"182\":{\"summary\":\"Verwaltet eine Sammlung von Feldern, welche beliebig oft wiederholt werden k\\u00f6nnen.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"183\":{\"summary\":\"Wiederholt Felder aus einen anderen Template. Stellt das Eingabefeld f\\u00fcr FieldtypeRepeater bereit.\",\"core\":true,\"versionStr\":\"1.1.1\"},\"111\":{\"summary\":\"Field that stores a page title\",\"core\":true,\"versionStr\":\"1.0.0\"},\"135\":{\"summary\":\"Feld, welches eine URL speichert\",\"core\":true,\"versionStr\":\"1.0.1\"},\"84\":{\"summary\":\"Field that stores an integer\",\"core\":true,\"versionStr\":\"1.0.2\"},\"106\":{\"summary\":\"Close a fieldset opened by FieldsetOpen. \",\"core\":true,\"versionStr\":\"1.0.0\"},\"133\":{\"summary\":\"Field that stores a hashed and salted password\",\"core\":true,\"versionStr\":\"1.0.1\"},\"97\":{\"summary\":\"This Fieldtype stores an ON\\/OFF toggle via a single checkbox. The ON value is 1 and OFF value is 0.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"89\":{\"summary\":\"Feld, das eine Flie\\u00dfkommazahl speichert\",\"core\":true,\"versionStr\":\"1.0.8\"},\"3\":{\"summary\":\"Field that stores a single line of text\",\"core\":true,\"versionStr\":\"1.0.2\"},\"107\":{\"summary\":\"Open a fieldset to group fields. Same as Fieldset (Open) except that it displays in a tab instead.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"29\":{\"summary\":\"Field that stores an e-mail address\",\"core\":true,\"versionStr\":\"1.0.1\"},\"28\":{\"summary\":\"Field that stores a date and optionally time\",\"core\":true,\"versionStr\":\"1.0.5\"},\"160\":{\"summary\":\"Uikit v3 admin theme\",\"core\":true,\"versionStr\":\"0.3.4\"},\"148\":{\"summary\":\"Minimal admin theme that supports all ProcessWire features.\",\"core\":true,\"versionStr\":\"0.1.4\"},\"114\":{\"summary\":\"Adds various permission methods to Page objects that are used by Process modules.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"85\":{\"summary\":\"Integer (positiv oder negativ)\",\"core\":true,\"versionStr\":\"1.0.5\"},\"108\":{\"summary\":\"URL in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.3\"},\"40\":{\"summary\":\"Versteckter Wert in einem Formular\",\"core\":true,\"versionStr\":\"1.0.1\"},\"241\":{\"summary\":\"Eingabefeld erg\\u00e4nzend zu FieldtypePageTable\",\"core\":true,\"versionStr\":\"0.1.4\"},\"90\":{\"summary\":\"Flie\\u00dfkommazahl mit Genauigkeit\",\"core\":true,\"versionStr\":\"1.0.5\"},\"38\":{\"summary\":\"Auswahl zwischen mehreren Checkboxen\",\"core\":true,\"versionStr\":\"1.0.8\"},\"36\":{\"summary\":\"Auswahl eines einzelnen Wertes aus einer select-Box\",\"core\":true,\"versionStr\":\"1.0.3\"},\"78\":{\"summary\":\"Gruppiert eines oder mehrere Felder in einem Container\",\"core\":true,\"versionStr\":\"1.0.1\"},\"56\":{\"summary\":\"Ein oder mehrere hochzuladende Bilder (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"35\":{\"summary\":\"Mehrzeiliger Text\",\"core\":true,\"versionStr\":\"1.0.3\"},\"55\":{\"summary\":\"Eine oder mehrere hochzuladende Dateien (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"169\":{\"summary\":\"Ein Umschalter, der \\u00e4hnliche Eingabem\\u00f6glichkeiten wie ein Kontrollk\\u00e4stchen bietet, aber wesentlich konfigurierbarer ist.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"131\":{\"summary\":\"Button als Formular-Element, dem Sie optional ein href-Attribut zuweisen k\\u00f6nnen\",\"core\":true,\"versionStr\":\"1.0.0\"},\"25\":{\"summary\":\"Mehrfach-Auswahl; Progressive Enhancement, um mehrere Elemente auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"2.0.3\"},\"60\":{\"summary\":\"Select one or more pages\",\"core\":true,\"versionStr\":\"1.0.9\"},\"80\":{\"summary\":\"E-Mail-Adresse in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.2\"},\"86\":{\"summary\":\"Text input validated as a ProcessWire Page name field\",\"core\":true,\"versionStr\":\"1.0.6\"},\"94\":{\"summary\":\"Eingabefeld f\\u00fcr Datum und optional Uhrzeit.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"155\":{\"summary\":\"CKEditor-Textfeld Rich Text Editor\",\"core\":true,\"versionStr\":\"1.7.2\"},\"34\":{\"summary\":\"Einzelne Textzeile\",\"core\":true,\"versionStr\":\"1.0.6\"},\"37\":{\"summary\":\"Einzelne Checkbox zum Umschalten\",\"core\":true,\"versionStr\":\"1.0.6\"},\"79\":{\"summary\":\"Enth\\u00e4lt beliebiges anderes Markup und optional Kind-Eingabefelder\",\"core\":true,\"versionStr\":\"1.0.2\"},\"43\":{\"summary\":\"Mehrfachauswahl aus einer Liste\",\"core\":true,\"versionStr\":\"1.0.1\"},\"162\":{\"summary\":\"Ein Symbol ausw\\u00e4hlen\",\"core\":true,\"versionStr\":\"0.0.3\"},\"39\":{\"summary\":\"Radio-Buttons, um ein einzelnes Feld auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"1.0.6\"},\"112\":{\"summary\":\"Verwaltet die Eingabe des Seitentitels und automatische Erstellung des Seitennamens (wenn Name leer ist)\",\"core\":true,\"versionStr\":\"1.0.2\"},\"122\":{\"summary\":\"Passworteingabe mit Best\\u00e4tigungsfeld, das die Eingabe nicht zur\\u00fcckgibt.\",\"core\":true,\"versionStr\":\"1.0.2\"},\"174\":{\"summary\":\"Mehrfach-Seitenauswahl mit Autovervollst\\u00e4ndigung und Sortierbarkeit. Vorgesehen als Eingabefeld f\\u00fcr Page reference-Felder.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"149\":{\"summary\":\"Build a page finding selector visually.\",\"author\":\"Avoine + ProcessWire\",\"core\":true,\"versionStr\":\"0.2.8\"},\"32\":{\"summary\":\"Button, um Formulare abzusenden\",\"core\":true,\"versionStr\":\"1.0.3\"},\"168\":{\"summary\":\"TinyMCE rich text editor version 6.8.2.\",\"core\":true,\"versionStr\":\"6.1.8\"},\"167\":{\"summary\":\"Erm\\u00f6glicht die Eingabe von vom Benutzer eingegebenen Tags oder die Auswahl vordefinierter Tags.\",\"core\":true,\"versionStr\":\"0.0.7\"},\"30\":{\"summary\":\"Enth\\u00e4lt ein oder mehrere Formularfeld(er)\",\"core\":true,\"versionStr\":\"1.0.7\"},\"15\":{\"summary\":\"Auswahl einer einzelnen Seite aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.1\"},\"137\":{\"summary\":\"Auswahl mehrerer Seiten aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.3\"},\"41\":{\"summary\":\"Texteingabe, die als Namensfeld in ProcessWire g\\u00fcltig ist\",\"core\":true,\"versionStr\":\"1.0.0\"},\"50\":{\"summary\":\"Module auflisten, bearbeiten oder (de)installieren\",\"core\":true,\"versionStr\":\"1.2.1\"},\"48\":{\"summary\":\"Einzelne Felder bearbeiten, die Seiten-Daten enthalten\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"fields\"},\"136\":{\"summary\":\"System-Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.1\"},\"252\":{\"summary\":\"Erm\\u00f6glicht das Zur\\u00fccksetzen des Passworts\\/der E-Mail f\\u00fcr den Login.\",\"core\":true,\"versionStr\":\"1.0.4\"},\"121\":{\"summary\":\"Provides a link capability as used by some Fieldtype modules (like rich text editors).\",\"core\":true,\"versionStr\":\"1.1.2\"},\"161\":{\"summary\":\"System Protokolle anschauen und verwalten.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"}},\"150\":{\"summary\":\"Admin tool for finding and listing pages by any property.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.2.6\",\"permissions\":{\"page-lister\":\"Use Page Lister\"}},\"87\":{\"summary\":\"Agiert als Platzhalter-Prozess f\\u00fcr die Wurzelseite des Adminbereiches. Stellt die richtige Flow-Kontrolle nach dem Login sicher.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"68\":{\"summary\":\"Benutzerrollen und mit ihnen verkn\\u00fcpfte Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.4\"},\"83\":{\"summary\":\"Alle Seitenansichten werden durch diesen Prozess geroutet\",\"core\":true,\"versionStr\":\"1.0.6\"},\"104\":{\"summary\":\"Provides a page search engine for admin use.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"12\":{\"summary\":\"List pages in a hierarchical tree structure\",\"core\":true,\"versionStr\":\"1.2.4\"},\"134\":{\"summary\":\"Seiten eines bestimmten Typs auflisten, bearbeiten und hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.1\"},\"7\":{\"summary\":\"Edit a Page\",\"core\":true,\"versionStr\":\"1.1.2\"},\"129\":{\"summary\":\"Provides image manipulation functions for image fields and rich text editors.\",\"core\":true,\"versionStr\":\"1.2.1\"},\"76\":{\"summary\":\"Listet den Prozess auf, der jeder Unterseite der aktuellen Seite zugeordnet ist.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"14\":{\"summary\":\"Handhabt das sortieren und verschieben von Seiten in der Seiten-Liste\",\"core\":true,\"versionStr\":\"1.0.1\"},\"66\":{\"summary\":\"System-Benutzer verwalten\",\"core\":true,\"versionStr\":\"1.0.7\",\"searchable\":\"users\"},\"10\":{\"summary\":\"Login to ProcessWire\",\"core\":true,\"versionStr\":\"1.0.9\"},\"109\":{\"summary\":\"Handhabt das Leeren des Papierkorbs f\\u00fcr Seiten\",\"core\":true,\"versionStr\":\"1.0.3\"},\"159\":{\"summary\":\"Shows a list of recently edited pages in your admin.\",\"author\":\"Ryan Cramer\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"}},\"47\":{\"summary\":\"Templates auflisten und bearbeiten, die die Seitenausgabe kontrollieren\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"templates\"},\"17\":{\"summary\":\"Eine neue Seite hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.9\"},\"138\":{\"summary\":\"Erlaubt dem Benutzer, Passwort, E-Mail-Adresse und andere Einstellungen zu \\u00e4ndern, die Sie vorgeben.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"125\":{\"summary\":\"Throttles login attempts to help prevent dictionary attacks.\",\"core\":true,\"versionStr\":\"1.0.3\"},\"185\":{\"summary\":\"Commercial module (Inputfield) providing multi-type repeaters.\",\"href\":\"https:\\/\\/processwire.com\\/store\\/pro-fields\\/\",\"versionStr\":\"0.1.3\"},\"184\":{\"summary\":\"Commercial module (Fieldtype) providing multi-type repeaters.\",\"versionStr\":\"0.1.3\"},\"263\":{\"summary\":\"A small helper module to trigger a Github event called repository_dispatch.\",\"author\":\"Daniel Stutz, Thomas Aull\",\"href\":\"https:\\/\\/docs.github.com\\/en\\/rest\\/repos\\/repos#create-a-repository-dispatch-event\",\"versionStr\":\"0.0.1\"},\"213\":{\"summary\":\"Module to create a REST API with ProcessWire\",\"author\":\"Sebastian Schendel\",\"href\":\"https:\\/\\/modules.processwire.com\\/modules\\/app-api\\/\",\"versionStr\":\"1.3.4\",\"permissions\":{\"appapi_manage_applications\":\"Manage AppApi settings\"},\"page\":{\"name\":\"appapi\",\"parent\":\"setup\",\"title\":\"AppApi\",\"icon\":\"terminal\"}},\"187\":{\"summary\":\"Automatically rename file\\/image uploads according to a configurable format\",\"author\":\"Adrian Jones\",\"href\":\"http:\\/\\/modules.processwire.com\\/modules\\/process-custom-upload-names\\/\",\"versionStr\":\"1.3.5\"},\"165\":{\"summary\":\"Create and\\/or restore database backups from ProcessWire admin.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.6\",\"permissions\":{\"db-backup\":\"Manage database backups (recommended for superuser only)\"},\"page\":{\"name\":\"db-backups\",\"parent\":\"setup\",\"title\":\"DB Backups\"}},\"186\":{\"summary\":\"ProcessWire Textformatter for simple markdown style text formatting (*bold*, _italic_, ~strike~, ```mono```)\",\"versionStr\":\"1.3.0\"},\"261\":{\"summary\":\"Field that lets you define a database table of custom fields.\",\"versionStr\":\"0.3.0\"},\"262\":{\"summary\":\"Field that lets you define a database table of custom inputs.\",\"versionStr\":\"0.3.0\"},\"164\":{\"summary\":\"Validates and\\/or sanitizes uploaded SVG files.\",\"author\":\"Adrian and Ryan\",\"versionStr\":\"0.0.5\"}}', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('190', '.ModulesUninstalled.info', '8192', '{\"PageFrontEdit\":{\"name\":\"PageFrontEdit\",\"title\":\"Front-End Page Editor\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables front-end editing of page fields.\",\"icon\":\"cube\",\"permissions\":{\"page-edit-front\":\"Use the front-end page editor\"},\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":\"PageFrontEditConfig.php\",\"core\":true,\"license\":\"MPL 2.0\"},\"LanguageTabs\":{\"name\":\"LanguageTabs\",\"title\":\"Languages Support - Tabs\",\"version\":117,\"versionStr\":\"1.1.7\",\"author\":\"adamspruijt, ryan, flipzoom\",\"summary\":\"Organizes multi-language fields into tabs for a cleaner easier to use interface.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"LanguageSupportPageNames\":{\"name\":\"LanguageSupportPageNames\",\"title\":\"Languages Support - Page Names\",\"version\":14,\"versionStr\":\"0.1.4\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language page names.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0],\"LanguageSupportFields\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"TextformatterSmartypants\":{\"name\":\"TextformatterSmartypants\",\"title\":\"SmartyPants Typographer\",\"version\":171,\"versionStr\":\"1.7.1\",\"summary\":\"Smart typography for web sites, by Michel Fortin based on SmartyPants by John Gruber. If combined with Markdown, it should be applied AFTER Markdown.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true,\"url\":\"https:\\/\\/github.com\\/michelf\\/php-smartypants\"},\"TextformatterPstripper\":{\"name\":\"TextformatterPstripper\",\"title\":\"Paragraph Stripper\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips paragraph <p> tags that may have been applied by other text formatters before it. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"TextformatterStripTags\":{\"name\":\"TextformatterStripTags\",\"title\":\"Strip Markup Tags\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips HTML\\/XHTML Markup Tags\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"TextformatterNewlineBR\":{\"name\":\"TextformatterNewlineBR\",\"title\":\"Newlines to XHTML Line Breaks\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to XHTML line break <br \\/> tags. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"TextformatterNewlineUL\":{\"name\":\"TextformatterNewlineUL\",\"title\":\"Newlines to Unordered List\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to <li> list items and surrounds in an <ul> unordered list. \",\"created\":1739545803,\"installed\":false,\"core\":true},\"PagePathHistory\":{\"name\":\"PagePathHistory\",\"title\":\"Page Path History\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"Keeps track of past URLs where pages have lived and automatically redirects (301 permanent) to the new location whenever the past URL is accessed.\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"LazyCron\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true},\"ImageSizerEngineAnimatedGif\":{\"name\":\"ImageSizerEngineAnimatedGif\",\"title\":\"Animated GIF Image Sizer\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations for animated GIFs.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"SystemNotifications\":{\"name\":\"SystemNotifications\",\"title\":\"System Notifications\",\"version\":12,\"versionStr\":\"0.1.2\",\"summary\":\"Adds support for notifications in ProcessWire (currently in development)\",\"icon\":\"bell\",\"installs\":[\"FieldtypeNotifications\"],\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":\"SystemNotificationsConfig.php\",\"core\":true},\"FieldtypeNotifications\":{\"name\":\"FieldtypeNotifications\",\"title\":\"Notifications\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Field that stores user notifications.\",\"requiresVersions\":{\"SystemNotifications\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"MarkupCache\":{\"name\":\"MarkupCache\",\"title\":\"Markup Cache\",\"version\":101,\"versionStr\":\"1.0.1\",\"summary\":\"A simple way to cache segments of markup in your templates. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/markupcache\\/\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"MarkupPageFields\":{\"name\":\"MarkupPageFields\",\"title\":\"Markup Page Fields\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Adds $page->renderFields() and $page->images->render() methods that return basic markup for output during development and debugging.\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true,\"permanent\":true},\"MarkupRSS\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":105,\"versionStr\":\"1.0.5\",\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"icon\":\"rss-square\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeCache\":{\"name\":\"FieldtypeCache\",\"title\":\"Cache\",\"version\":102,\"versionStr\":\"1.0.2\",\"summary\":\"Caches the values of other fields for fewer runtime queries. Can also be used to combine multiple text fields and have them all be searchable under the cached field name.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypePageTable\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"A fieldtype containing a group of editable pages.\",\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeFieldsetPage\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Seite)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Fieldset mit Feldern, die getrennt sind, um den Namensraum zu trennen (Seite), um die Wiederverwendung von Feldern zu erm\\u00f6glichen.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeDecimal\":{\"name\":\"FieldtypeDecimal\",\"title\":\"Dezimal\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Feld, das eine Dezimalzahl speichert\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeOptions\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"versionStr\":\"0.0.2\",\"summary\":\"Feld welches Einzel- und Mehrfachauswahl-Optionen speichert.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeSelector\":{\"name\":\"FieldtypeSelector\",\"title\":\"Selector\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Avoine + ProcessWire\",\"summary\":\"Build a page finding selector visually.\",\"created\":1739545803,\"installed\":false,\"core\":true},\"FieldtypeComments\":{\"name\":\"FieldtypeComments\",\"title\":\"Kommentare (Comments)\",\"version\":110,\"versionStr\":\"1.1.0\",\"summary\":\"Feld welches Kommentare von Nutzern zu einer einzelnen Seite speichert.\",\"installs\":[\"InputfieldCommentsAdmin\"],\"created\":1739545803,\"installed\":false,\"core\":true},\"InputfieldCommentsAdmin\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Administrator Kommentare\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Bietet ein administratives Interface zur Arbeit mit Kommentaren.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"CommentFilterAkismet\":{\"name\":\"CommentFilterAkismet\",\"title\":\"Kommentar-Filter: Akismet\",\"version\":200,\"versionStr\":\"2.0.0\",\"summary\":\"Nutzt den Akismet-Service um Kommentarspam zu identifizieren. Modul-Plugin f\\u00fcr den Feldtyp Kommentar.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeToggle\":{\"name\":\"FieldtypeToggle\",\"title\":\"Umschalter (Ja\\/Nein)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Konfigurierbares Ja\\/Nein, Ein-\\/Ausschalten als Alternative zu einem Kontrollk\\u00e4stchen, plus optionale &quot;andere&quot; Option.\",\"requiresVersions\":{\"InputfieldToggle\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"AdminThemeReno\":{\"name\":\"AdminThemeReno\",\"title\":\"Reno\",\"version\":17,\"versionStr\":\"0.1.7\",\"author\":\"Tom Reno (Renobird)\",\"summary\":\"Admin theme for ProcessWire 2.5+ by Tom Reno (Renobird)\",\"requiresVersions\":{\"AdminThemeDefault\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"InputfieldPageTable\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"versionStr\":\"0.1.4\",\"summary\":\"Eingabefeld erg\\u00e4nzend zu FieldtypePageTable\",\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true},\"PagePaths\":{\"name\":\"PagePaths\",\"title\":\"Page Paths\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Enables page paths\\/urls to be queryable by selectors. Also offers potential for improved load performance. Builds an index at install (may take time on a large site).\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"FileCompilerTags\":{\"name\":\"FileCompilerTags\",\"title\":\"Tags File Compiler\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables {var} or {var.property} variables in markup sections of a file. Can be used with any API variable.\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessPageClone\":{\"name\":\"ProcessPageClone\",\"title\":\"Seite klonen\",\"version\":106,\"versionStr\":\"1.0.6\",\"summary\":\"Stellt die M\\u00f6glichkeit bereit, Seiten im Admin-Bereich zu klonen\\/kopieren\\/duplizieren. F\\u00fcgt allen passenden Seiten in der PageList eine Option &quot;kopieren&quot; hinzu.\",\"permission\":\"page-clone\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"autoload\":\"template=admin\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true,\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"ProcessForgotPassword\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Passwort vergessen\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Erm\\u00f6glicht das Zur\\u00fccksetzen des Passworts\\/der E-Mail f\\u00fcr den Login.\",\"permission\":\"page-view\",\"created\":1739545803,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessCommentsManager\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Kommentare\",\"version\":12,\"versionStr\":\"0.1.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Verwalten Sie Kommentare auf Ihrer Website au\\u00dferhalb des Seiteneditors.\",\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"created\":1739545803,\"installed\":false,\"searchable\":\"comments\",\"core\":true,\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"},\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Best\\u00e4tigt\"},{\"url\":\"?go=pending\",\"label\":\"Wartet\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"Alle\"}]},\"ProcessPagesExportImport\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables exporting and importing of pages. Development version, not yet recommended for production use.\",\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"created\":1739545803,\"installed\":false,\"core\":true,\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"ProcessSessionDB\":{\"name\":\"ProcessSessionDB\",\"title\":\"Sessions\",\"version\":5,\"versionStr\":\"0.0.5\",\"summary\":\"Erm\\u00f6glicht ihnen, die aktiven Datenbank Sessions zu durchsuchen\",\"icon\":\"dashboard\",\"requiresVersions\":{\"SessionHandlerDB\":[\">=\",0]},\"created\":1739545803,\"installed\":false,\"core\":true,\"page\":{\"name\":\"sessions-db\",\"parent\":\"access\",\"title\":\"Sessions\"}},\"SessionHandlerDB\":{\"name\":\"SessionHandlerDB\",\"title\":\"Session Handler Database\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Installing this module makes ProcessWire store sessions in the database rather than the file system. Note that this module will log you out after install or uninstall.\",\"installs\":[\"ProcessSessionDB\"],\"created\":1739545803,\"installed\":false,\"configurable\":3,\"core\":true},\"GithubRepositoryDispatch\":{\"name\":\"GithubRepositoryDispatch\",\"title\":\"Github Repository Dispatch\",\"version\":\"0.0.1\",\"versionStr\":\"0.0.1\",\"author\":\"Daniel Stutz, Thomas Aull\",\"summary\":\"A small helper module to trigger a Github event called repository_dispatch.\",\"href\":\"https:\\/\\/docs.github.com\\/en\\/rest\\/repos\\/repos#create-a-repository-dispatch-event\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.123\"]},\"installs\":[\"LazyCron\"],\"autoload\":true,\"singular\":true,\"created\":1765475399,\"installed\":false,\"configurable\":\"GithubRepositoryDispatch.config.php\"},\"AppApi\":{\"name\":\"AppApi\",\"title\":\"AppApi\",\"version\":\"1.3.2\",\"versionStr\":\"1.3.2\",\"author\":\"Sebastian Schendel\",\"summary\":\"Module to create a REST API with ProcessWire\",\"href\":\"https:\\/\\/modules.processwire.com\\/modules\\/app-api\\/\",\"icon\":\"terminal\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.98\"]},\"permissions\":{\"appapi_manage_applications\":\"Manage AppApi settings\"},\"autoload\":true,\"singular\":true,\"created\":1735122024,\"installed\":false,\"configurable\":\"AppApi.config.php\",\"page\":{\"name\":\"appapi\",\"parent\":\"setup\",\"title\":\"AppApi\",\"icon\":\"terminal\"}},\"PagesVersions\":{\"name\":\"PagesVersions\",\"title\":\"Pages Versions\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Provides a version control API for pages in ProcessWire.\",\"icon\":\"code-fork\",\"autoload\":true,\"singular\":true,\"created\":1739545803,\"installed\":false,\"core\":true}}', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('191', '.ModulesVersions.info', '8192', '{\"173\":102,\"121\":109}', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('193', '.Modules.wire/modules/', '8192', 'Page/PageFrontEdit/PageFrontEdit.module\nLanguageSupport/FieldtypePageTitleLanguage.module\nLanguageSupport/LanguageSupportFields.module\nLanguageSupport/FieldtypeTextLanguage.module\nLanguageSupport/LanguageTabs.module\nLanguageSupport/FieldtypeTextareaLanguage.module\nLanguageSupport/LanguageSupport.module\nLanguageSupport/LanguageSupportPageNames.module\nLanguageSupport/ProcessLanguageTranslator.module\nLanguageSupport/ProcessLanguage.module\nTextformatter/TextformatterSmartypants/TextformatterSmartypants.module\nTextformatter/TextformatterMarkdownExtra/TextformatterMarkdownExtra.module\nTextformatter/TextformatterPstripper.module\nTextformatter/TextformatterStripTags.module\nTextformatter/TextformatterEntities.module\nTextformatter/TextformatterNewlineBR.module\nTextformatter/TextformatterNewlineUL.module\nPagePathHistory.module\nJquery/JqueryUI/JqueryUI.module\nJquery/JqueryTableSorter/JqueryTableSorter.module\nJquery/JqueryCore/JqueryCore.module\nJquery/JqueryWireTabs/JqueryWireTabs.module\nJquery/JqueryMagnific/JqueryMagnific.module\nLazyCron.module\nImage/ImageSizerEngineIMagick/ImageSizerEngineIMagick.module\nImage/ImageSizerEngineAnimatedGif/ImageSizerEngineAnimatedGif.module\nSystem/SystemUpdater/SystemUpdater.module\nSystem/SystemNotifications/SystemNotifications.module\nSystem/SystemNotifications/FieldtypeNotifications.module\nMarkup/MarkupCache.module\nMarkup/MarkupPageArray.module\nMarkup/MarkupHTMLPurifier/MarkupHTMLPurifier.module\nMarkup/MarkupPagerNav/MarkupPagerNav.module\nMarkup/MarkupPageFields.module\nMarkup/MarkupAdminDataTable/MarkupAdminDataTable.module\nMarkup/MarkupRSS.module\nPageRender.module\nFieldtype/FieldtypeImage/FieldtypeImage.module\nFieldtype/FieldtypeFieldsetOpen.module\nFieldtype/FieldtypeCache.module\nFieldtype/FieldtypeFile/FieldtypeFile.module\nFieldtype/FieldtypePage.module\nFieldtype/FieldtypeTextarea.module\nFieldtype/FieldtypePageTable.module\nFieldtype/FieldtypeModule.module\nFieldtype/FieldtypeRepeater/FieldtypeFieldsetPage.module\nFieldtype/FieldtypeRepeater/FieldtypeRepeater.module\nFieldtype/FieldtypeRepeater/InputfieldRepeater.module\nFieldtype/FieldtypePageTitle.module\nFieldtype/FieldtypeURL.module\nFieldtype/FieldtypeInteger.module\nFieldtype/FieldtypeDecimal.module\nFieldtype/FieldtypeFieldsetClose.module\nFieldtype/FieldtypeOptions/FieldtypeOptions.module\nFieldtype/FieldtypePassword.module\nFieldtype/FieldtypeCheckbox.module\nFieldtype/FieldtypeFloat.module\nFieldtype/FieldtypeSelector.module\nFieldtype/FieldtypeComments/FieldtypeComments.module\nFieldtype/FieldtypeComments/InputfieldCommentsAdmin.module\nFieldtype/FieldtypeComments/CommentFilterAkismet.module\nFieldtype/FieldtypeText.module\nFieldtype/FieldtypeFieldsetTabOpen.module\nFieldtype/FieldtypeToggle.module\nFieldtype/FieldtypeEmail.module\nFieldtype/FieldtypeDatetime.module\nAdminTheme/AdminThemeReno/AdminThemeReno.module\nAdminTheme/AdminThemeUikit/AdminThemeUikit.module\nAdminTheme/AdminThemeDefault/AdminThemeDefault.module\nPagePermissions.module\nInputfield/InputfieldInteger.module\nInputfield/InputfieldURL.module\nInputfield/InputfieldHidden.module\nInputfield/InputfieldPageTable/InputfieldPageTable.module\nInputfield/InputfieldFloat.module\nInputfield/InputfieldCheckboxes/InputfieldCheckboxes.module\nInputfield/InputfieldSelect.module\nInputfield/InputfieldFieldset.module\nInputfield/InputfieldImage/InputfieldImage.module\nInputfield/InputfieldTextarea.module\nInputfield/InputfieldFile/InputfieldFile.module\nInputfield/InputfieldToggle/InputfieldToggle.module\nInputfield/InputfieldButton.module\nInputfield/InputfieldAsmSelect/InputfieldAsmSelect.module\nInputfield/InputfieldPage/InputfieldPage.module\nInputfield/InputfieldEmail.module\nInputfield/InputfieldPageName/InputfieldPageName.module\nInputfield/InputfieldDatetime/InputfieldDatetime.module\nInputfield/InputfieldCKEditor/InputfieldCKEditor.module\nInputfield/InputfieldText/InputfieldText.module\nInputfield/InputfieldCheckbox/InputfieldCheckbox.module\nInputfield/InputfieldMarkup.module\nInputfield/InputfieldSelectMultiple.module\nInputfield/InputfieldIcon/InputfieldIcon.module\nInputfield/InputfieldRadios/InputfieldRadios.module\nInputfield/InputfieldPageTitle/InputfieldPageTitle.module\nInputfield/InputfieldPassword/InputfieldPassword.module\nInputfield/InputfieldPageAutocomplete/InputfieldPageAutocomplete.module\nInputfield/InputfieldSelector/InputfieldSelector.module\nInputfield/InputfieldSubmit/InputfieldSubmit.module\nInputfield/InputfieldTinyMCE/InputfieldTinyMCE.module.php\nInputfield/InputfieldTextTags/InputfieldTextTags.module\nInputfield/InputfieldForm.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelect.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelectMultiple.module\nInputfield/InputfieldName.module\nPages/PagesVersions/PagesVersions.module.php\nPagePaths.module\nFileCompilerTags.module\nProcess/ProcessModule/ProcessModule.module\nProcess/ProcessPageClone.module\nProcess/ProcessField/ProcessField.module\nProcess/ProcessPermission/ProcessPermission.module\nProcess/ProcessForgotPassword/ProcessForgotPassword.module\nProcess/ProcessPageEditLink/ProcessPageEditLink.module\nProcess/ProcessLogger/ProcessLogger.module\nProcess/ProcessPageLister/ProcessPageLister.module\nProcess/ProcessHome.module\nProcess/ProcessRole/ProcessRole.module\nProcess/ProcessPageView.module\nProcess/ProcessPageSearch/ProcessPageSearch.module\nProcess/ProcessPageList/ProcessPageList.module\nProcess/ProcessPageType/ProcessPageType.module\nProcess/ProcessPageEdit/ProcessPageEdit.module\nProcess/ProcessPageEditImageSelect/ProcessPageEditImageSelect.module\nProcess/ProcessCommentsManager/ProcessCommentsManager.module\nProcess/ProcessList.module\nProcess/ProcessPageSort.module\nProcess/ProcessUser/ProcessUser.module\nProcess/ProcessPagesExportImport/ProcessPagesExportImport.module\nProcess/ProcessLogin/ProcessLogin.module\nProcess/ProcessPageTrash.module\nProcess/ProcessRecentPages/ProcessRecentPages.module\nProcess/ProcessTemplate/ProcessTemplate.module\nProcess/ProcessPageAdd/ProcessPageAdd.module\nProcess/ProcessProfile/ProcessProfile.module\nSession/SessionLoginThrottle/SessionLoginThrottle.module\nSession/SessionHandlerDB/ProcessSessionDB.module\nSession/SessionHandlerDB/SessionHandlerDB.module', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('194', '.Modules.site/modules/', '8192', 'FieldtypeRepeaterMatrix/InputfieldRepeaterMatrix.module\nFieldtypeRepeaterMatrix/FieldtypeRepeaterMatrix.module\nGithubRepositoryDispatch/GithubRepositoryDispatch.module.php\nAppApi/AppApi.module.php\nProcessCustomUploadNames/ProcessCustomUploadNames.module.php\nProcessDatabaseBackups/ProcessDatabaseBackups.module\nTextformatterRockDown/TextformatterRockDown.module.php\nInputfieldTinyMCE/InputfieldTinyMCE.module.php\nFieldtypeTable/FieldtypeTable.module\nFieldtypeTable/InputfieldTable.module\nFileValidatorSvgSanitizer/FileValidatorSvgSanitizer.module.php', '2024-04-28 16:28:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('213', 'AppApi', '3', '{\"endpoint\":\"api\",\"routes_path\":\"site\\/templates\\/api\\/Routes.php\",\"access_logging\":\"\",\"deactivate_url_hook\":1}', '2024-12-25 11:20:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('235', 'LazyCron', '3', '', '2026-01-07 19:29:22');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('240', 'FieldtypePageTable', '3', '', '2026-01-07 19:32:01');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('241', 'InputfieldPageTable', '0', '', '2026-01-07 19:32:01');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('252', 'ProcessForgotPassword', '1', '', '2026-01-07 19:33:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('261', 'FieldtypeTable', '1', '', '2026-01-08 11:20:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('262', 'InputfieldTable', '0', '', '2026-01-08 11:20:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('263', 'GithubRepositoryDispatch', '3', '{\"disabled\":\"\",\"trigger\":1,\"endpoint\":\"\",\"personalAccessToken\":\"\",\"eventType\":\"\",\"timeInterval\":\"\"}', '2026-01-26 10:03:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=1644 DEFAULT CHARSET=utf8mb4;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2026-02-02 13:02:21', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'manage', '1035', '2025-12-11 19:00:29', '40', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2023-01-19 13:05:11', '40', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2023-01-19 13:05:13', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2023-01-19 13:05:12', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '43', 'http404', '1035', '2023-02-11 20:35:03', '41', '2023-01-19 13:04:50', '3', '2023-02-05 11:16:05', '12');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'chadm', '1', '2026-01-08 14:55:23', '41', '2023-01-19 13:04:50', '41', '2023-01-19 13:04:50', '0');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '22', '2', 'db-backups', '1', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1018', '31', '5', 'db-backup', '1', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '41', '2023-01-19 13:12:59', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '1', '51', 'permakultur-basics', '5', '2026-02-06 11:51:11', '41', '2023-01-19 13:43:55', '41', '2023-02-11 20:03:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1021', '31', '5', 'lang-edit', '1', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '22', '2', 'languages', '16', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '1022', '44', 'default', '16', '2023-02-11 20:09:43', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1024', '22', '2', 'language-translator', '1040', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '41', '2023-01-19 14:11:17', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1025', '1022', '44', 'en', '1', '2023-02-15 11:12:08', '41', '2023-01-19 14:11:41', '41', '2023-01-19 14:11:41', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1028', '2', '2', 'repeaters', '1036', '2023-02-08 16:37:36', '41', '2023-02-08 16:37:36', '41', '2023-02-08 16:37:36', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1037', '30', '4', 'publisher', '1', '2023-03-01 08:48:57', '41', '2023-03-01 08:48:42', '41', '2023-03-01 08:48:57', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1038', '22', '2', 'appapi', '1', '2024-12-25 11:20:26', '41', '2024-12-25 11:20:26', '41', '2024-12-25 11:20:26', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1039', '31', '5', 'appapi_manage_applications', '1', '2024-12-25 11:20:26', '41', '2024-12-25 11:20:26', '41', '2024-12-25 11:20:26', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1046', '1028', '2', 'for-field-112', '17', '2026-01-08 12:51:54', '41', '2026-01-07 20:17:48', '41', '2026-01-07 20:17:48', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1074', '29', '3', 'chpub', '1', '2026-01-27 15:51:39', '41', '2026-01-08 10:39:33', '41', '2026-01-08 10:40:44', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1101', '1', '50', 'accordions', '1029', '2026-02-06 10:38:19', '41', '2026-01-08 14:36:27', '41', '2026-01-08 14:40:06', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1102', '1101', '46', 'permakultur-sprechstunde', '1', '2026-01-23 12:53:32', '41', '2026-01-08 14:51:21', '41', '2026-01-08 14:51:21', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1106', '1101', '46', 'individuelle-beratung', '1', '2026-01-21 19:33:21', '41', '2026-01-08 15:03:46', '41', '2026-01-08 15:03:46', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1109', '1020', '52', 'grundlagen', '1', '2026-02-02 16:52:33', '41', '2026-01-08 15:58:58', '41', '2026-01-08 15:59:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1114', '1028', '2', 'for-field-122', '17', '2026-01-08 16:55:35', '41', '2026-01-08 16:55:35', '41', '2026-01-08 16:55:35', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1117', '1109', '77', 'einstieg', '1', '2026-02-03 13:51:59', '41', '2026-01-08 17:10:35', '41', '2026-01-08 17:46:24', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1118', '1', '56', 'lizenzen', '1029', '2026-02-06 10:39:56', '41', '2026-01-08 17:32:15', '41', '2026-01-08 17:32:17', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1119', '1046', '2', 'for-page-1117', '17', '2026-01-08 17:38:43', '41', '2026-01-08 17:38:43', '41', '2026-01-08 17:38:43', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1120', '1118', '57', 'cc-by-sa-4.0', '1', '2026-01-08 17:46:24', '41', '2026-01-08 17:46:24', '41', '2026-01-08 17:46:24', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1121', '1119', '48', '1767890910-0749-1', '1', '2026-02-03 13:23:27', '41', '2026-01-08 17:48:30', '41', '2026-01-08 17:49:02', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1122', '1114', '2', 'for-page-1117', '17', '2026-01-08 17:49:33', '41', '2026-01-08 17:49:33', '41', '2026-01-08 17:49:33', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1126', '1028', '2', 'for-field-128', '17', '2026-01-09 09:47:54', '41', '2026-01-09 09:47:54', '41', '2026-01-09 09:47:54', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1127', '1126', '2', 'for-page-1', '17', '2026-01-09 09:53:04', '41', '2026-01-09 09:53:04', '41', '2026-01-09 09:53:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1132', '1', '51', 'angebote', '5', '2026-02-06 11:51:21', '41', '2026-01-09 10:29:09', '41', '2026-01-09 10:29:12', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1133', '1028', '2', 'for-field-131', '17', '2026-01-09 11:18:13', '41', '2026-01-09 11:13:54', '41', '2026-01-09 11:13:54', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1140', '1127', '59', '1767956490-7935-1', '1', '2026-01-09 12:02:27', '41', '2026-01-09 12:01:30', '41', '2026-01-09 12:01:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1147', '1133', '2', 'for-page-1', '17', '2026-01-09 14:25:56', '41', '2026-01-09 14:25:56', '41', '2026-01-09 14:25:56', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1148', '1147', '60', '1767965156-4435-1', '1', '2026-01-13 16:51:21', '41', '2026-01-09 14:25:56', '41', '2026-01-12 14:41:42', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1151', '1132', '49', 'beratungen', '1', '2026-01-27 16:48:55', '41', '2026-01-13 15:07:16', '41', '2026-01-13 16:51:31', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1152', '1046', '2', 'for-page-1151', '17', '2026-01-13 15:07:16', '41', '2026-01-13 15:07:16', '41', '2026-01-13 15:07:16', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1153', '1152', '48', '1768313448-3881-1', '1', '2026-01-27 16:43:41', '41', '2026-01-13 15:10:48', '41', '2026-01-13 15:13:53', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1157', '1101', '46', 'test-akkordion', '1', '2026-01-21 19:30:30', '41', '2026-01-13 15:22:48', '41', '2026-01-13 15:22:48', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1168', '1020', '52', 'designprozesse', '1', '2026-01-13 16:54:42', '41', '2026-01-13 16:54:31', '41', '2026-01-13 16:54:42', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1171', '1020', '52', 'ganzheitliche-gestaltung', '1', '2026-01-13 16:55:37', '41', '2026-01-13 16:54:58', '41', '2026-01-13 16:55:37', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1174', '1', '51', 'gelebte-permakultur', '5', '2026-02-06 11:51:15', '41', '2026-01-13 16:56:24', '41', '2026-01-13 16:56:29', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1175', '1174', '52', 'zyklische-permakultur', '1', '2026-01-13 16:57:02', '41', '2026-01-13 16:56:59', '41', '2026-01-13 16:57:02', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1178', '1174', '52', 'permakultur-im-alltag', '1', '2026-01-13 16:57:26', '41', '2026-01-13 16:57:17', '41', '2026-01-13 16:57:26', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1181', '1174', '52', 'soziale-permakultur', '1', '2026-01-13 16:57:43', '41', '2026-01-13 16:57:40', '41', '2026-01-13 16:57:43', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1184', '1174', '52', 'gruene-permakultur', '1', '2026-01-13 16:57:59', '41', '2026-01-13 16:57:56', '41', '2026-01-13 16:57:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1187', '1020', '70', 'werkzeugpalette', '1', '2026-01-20 18:05:43', '41', '2026-01-13 17:03:41', '41', '2026-01-13 17:03:49', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1194', '1028', '2', 'for-field-139', '17', '2026-01-15 13:21:57', '41', '2026-01-15 13:21:57', '41', '2026-01-15 13:21:57', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1199', '1114', '2', 'for-page-1109', '17', '2026-01-15 13:32:43', '41', '2026-01-15 13:32:43', '41', '2026-01-15 13:32:43', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1200', '1199', '54', '1768480363-7135-1', '1', '2026-02-02 16:52:33', '41', '2026-01-15 13:32:43', '41', '2026-01-15 13:37:30', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1201', '1194', '2', 'for-page-1200', '17', '2026-01-15 13:32:43', '41', '2026-01-15 13:32:43', '41', '2026-01-15 13:32:43', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1202', '1201', '67', '1768480374-2617-1', '1', '2026-01-15 13:38:16', '41', '2026-01-15 13:32:54', '41', '2026-01-15 13:37:30', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1203', '1201', '67', '1768480377-5643-1', '1', '2026-01-15 13:38:16', '41', '2026-01-15 13:32:57', '41', '2026-01-15 13:37:30', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1205', '1122', '54', '1768480590-4746-1', '1', '2026-02-03 13:51:59', '41', '2026-01-15 13:36:30', '41', '2026-01-19 10:00:20', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1206', '1194', '2', 'for-page-1205', '17', '2026-01-15 13:36:30', '41', '2026-01-15 13:36:30', '41', '2026-01-15 13:36:30', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1207', '1201', '67', '1768480687-7764-1', '1', '2026-01-20 14:54:48', '41', '2026-01-15 13:38:07', '41', '2026-01-15 13:38:16', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1208', '1119', '48', '1768812478-8458-1', '1', '2026-01-19 12:03:18', '41', '2026-01-19 09:47:58', '41', '2026-01-19 09:55:35', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1209', '1119', '48', '1768812878-6576-1', '1', '2026-01-28 13:09:15', '41', '2026-01-19 09:54:38', '41', '2026-01-19 09:56:09', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1215', '1206', '67', '1768814221-3885-1', '1', '2026-01-19 10:25:27', '41', '2026-01-19 10:17:01', '41', '2026-01-19 10:17:05', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1217', '1119', '48', '1768821989-8391-1', '1', '2026-01-19 12:33:48', '41', '2026-01-19 12:26:29', '41', '2026-01-19 12:26:42', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1218', '1046', '2', 'for-page-1157', '17', '2026-01-19 12:58:23', '41', '2026-01-19 12:58:23', '41', '2026-01-19 12:58:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1219', '1218', '48', '1768823903-3722-1', '1', '2026-01-21 19:30:30', '41', '2026-01-19 12:58:23', '41', '2026-01-19 12:59:24', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1222', '1119', '48', '1768825162-6583-1', '1', '2026-01-19 13:20:34', '41', '2026-01-19 13:19:22', '41', '2026-01-19 13:20:34', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1223', '1109', '77', 'ethik', '129', '2026-01-28 12:45:45', '41', '2026-01-19 14:24:51', '41', '2026-01-19 14:26:49', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1224', '1046', '2', 'for-page-1223', '17', '2026-01-19 14:24:51', '41', '2026-01-19 14:24:51', '41', '2026-01-19 14:24:51', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1225', '1114', '2', 'for-page-1223', '17', '2026-01-19 14:24:51', '41', '2026-01-19 14:24:51', '41', '2026-01-19 14:24:51', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1226', '1224', '48', '1768829092-1503-1', '1', '2026-01-19 14:27:03', '41', '2026-01-19 14:24:52', '41', '2026-01-19 14:26:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1227', '1225', '54', '1768829092-2931-2', '1', '2026-01-23 13:33:44', '41', '2026-01-19 14:24:52', '41', '2026-01-19 14:28:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1228', '1194', '2', 'for-page-1227', '17', '2026-01-19 14:24:52', '41', '2026-01-19 14:24:52', '41', '2026-01-19 14:24:52', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1229', '1224', '48', '1768829170-8504-1', '1', '2026-01-19 14:27:03', '41', '2026-01-19 14:26:10', '41', '2026-01-19 14:26:49', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1230', '1101', '46', 'sorge-fuer-die-erde', '1', '2026-01-19 14:27:21', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1231', '1046', '2', 'for-page-1230', '17', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1232', '1101', '46', 'sorge-fuer-den-menschen', '1', '2026-01-19 14:27:41', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1233', '1046', '2', 'for-page-1232', '17', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1234', '1101', '46', 'fair-share', '1', '2026-01-19 14:28:15', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1235', '1046', '2', 'for-page-1234', '17', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '41', '2026-01-19 14:26:49', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1236', '1231', '48', '1768829229-5607-1', '1', '2026-01-19 14:27:21', '41', '2026-01-19 14:27:09', '41', '2026-01-19 14:27:21', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1237', '1224', '48', '1768829244-6857-1', '1', '2026-01-19 14:28:32', '41', '2026-01-19 14:27:24', '41', '2026-01-19 14:28:28', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1238', '1233', '48', '1768829249-6014-1', '1', '2026-01-19 14:27:41', '41', '2026-01-19 14:27:29', '41', '2026-01-19 14:27:41', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1239', '1224', '48', '1768829267-5838-1', '1', '2026-01-19 14:28:32', '41', '2026-01-19 14:27:47', '41', '2026-01-19 14:28:28', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1240', '1235', '48', '1768829287-506-1', '1', '2026-01-19 14:28:15', '41', '2026-01-19 14:28:07', '41', '2026-01-19 14:28:15', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1241', '1228', '67', '1768829298-9128-1', '1', '2026-01-19 14:28:32', '41', '2026-01-19 14:28:18', '41', '2026-01-19 14:28:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1243', '1228', '67', '1768829599-8141-1', '1', '2026-01-23 13:33:44', '41', '2026-01-19 14:33:19', '41', '2026-01-19 14:34:30', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1244', '1109', '64', 'zusammenfassung', '1', '2026-01-19 14:54:01', '41', '2026-01-19 14:43:41', '41', '2026-01-19 14:44:04', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1245', '1114', '2', 'for-page-1244', '17', '2026-01-19 14:43:41', '41', '2026-01-19 14:43:41', '41', '2026-01-19 14:43:41', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1246', '1245', '54', '1768830222-1289-1', '1', '2026-01-19 14:46:54', '41', '2026-01-19 14:43:42', '41', '2026-01-19 14:44:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1247', '1194', '2', 'for-page-1246', '17', '2026-01-19 14:43:42', '41', '2026-01-19 14:43:42', '41', '2026-01-19 14:43:42', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1248', '1247', '67', '1768830236-8823-1', '1', '2026-01-19 14:46:54', '41', '2026-01-19 14:43:56', '41', '2026-01-19 14:44:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1249', '1114', '2', 'for-page-1187', '17', '2026-01-19 15:00:38', '41', '2026-01-19 15:00:38', '41', '2026-01-19 15:00:38', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1250', '1249', '54', '1768831238-939-1', '3073', '2026-01-19 15:00:38', '41', '2026-01-19 15:00:38', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1251', '1194', '2', 'for-page-1250', '17', '2026-01-19 15:00:38', '41', '2026-01-19 15:00:38', '41', '2026-01-19 15:00:38', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1252', '1', '68', 'kontexte', '1029', '2026-02-06 10:41:02', '41', '2026-01-20 13:55:36', '41', '2026-01-20 13:55:40', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1253', '1252', '69', 'veranstaltung', '1', '2026-01-20 14:03:24', '41', '2026-01-20 14:03:24', '41', '2026-01-20 14:03:24', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1254', '1252', '69', 'shop', '1', '2026-01-20 14:03:35', '41', '2026-01-20 14:03:35', '41', '2026-01-20 14:03:35', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1255', '1', '61', 'kategorien', '1029', '2026-01-20 14:11:34', '41', '2026-01-20 14:09:22', '41', '2026-01-20 14:09:22', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1256', '1255', '62', 'beobachten', '1', '2026-02-06 10:12:43', '41', '2026-01-20 14:13:12', '41', '2026-01-20 14:13:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1257', '1252', '69', 'werkzeugpalette', '1', '2026-01-20 15:05:24', '41', '2026-01-20 14:13:28', '41', '2026-01-20 14:13:28', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1258', '1255', '62', 'prinzipien', '1', '2026-01-20 15:39:00', '41', '2026-01-20 14:30:14', '41', '2026-01-20 14:30:20', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1259', '1258', '62', 'basic', '1', '2026-01-20 14:30:56', '41', '2026-01-20 14:30:51', '41', '2026-01-20 14:30:56', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1260', '1258', '62', 'leitsaetze', '1', '2026-01-20 14:31:18', '41', '2026-01-20 14:31:10', '41', '2026-01-20 14:31:18', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1261', '1258', '62', 'prinzipiensets', '1', '2026-01-20 14:31:42', '41', '2026-01-20 14:31:37', '41', '2026-01-20 14:31:42', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1262', '1255', '62', 'muster', '1', '2026-01-20 15:38:30', '41', '2026-01-20 14:31:59', '41', '2026-01-20 14:32:04', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1263', '1262', '62', 'natuerlich', '1', '2026-01-20 14:32:37', '41', '2026-01-20 14:32:33', '41', '2026-01-20 14:32:37', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1264', '1262', '62', 'prozessmodelle', '1', '2026-01-20 14:32:57', '41', '2026-01-20 14:32:53', '41', '2026-01-20 14:32:57', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1265', '1255', '62', 'analyse', '1', '2026-02-06 10:12:09', '41', '2026-01-20 14:35:39', '41', '2026-01-20 14:35:45', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1266', '1255', '62', 'design', '1', '2026-01-20 15:38:14', '41', '2026-01-20 14:35:58', '41', '2026-01-20 14:36:02', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1267', '1255', '62', 'praxiswissen', '1', '2026-02-06 10:16:23', '41', '2026-01-20 14:36:22', '41', '2026-01-20 14:36:27', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1268', '1187', '65', 'werkzeuge', '1', '2026-01-21 14:10:00', '41', '2026-01-20 16:01:15', '41', '2026-01-20 16:01:18', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1269', '1268', '72', 'sitzplatz-in-der-natur', '1', '2026-01-26 17:51:56', '41', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1270', '1046', '2', 'for-page-1269', '17', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:10', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1271', '1114', '2', 'for-page-1269', '17', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:10', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1272', '1270', '48', '1768921390-7574-1', '1', '2026-01-20 18:31:23', '41', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1273', '1271', '54', '1768921390-978-2', '3073', '2026-01-20 16:03:10', '41', '2026-01-20 16:03:10', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1274', '1194', '2', 'for-page-1273', '17', '2026-01-20 16:03:11', '41', '2026-01-20 16:03:11', '41', '2026-01-20 16:03:11', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1275', '1268', '72', '7-ways-to-think-differently', '1', '2026-01-26 12:26:39', '41', '2026-01-20 17:45:30', '41', '2026-01-21 12:39:46', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1276', '1046', '2', 'for-page-1275', '17', '2026-01-20 17:45:30', '41', '2026-01-20 17:45:30', '41', '2026-01-20 17:45:30', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1277', '1114', '2', 'for-page-1275', '17', '2026-01-20 17:45:30', '41', '2026-01-20 17:45:30', '41', '2026-01-20 17:45:30', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1278', '1276', '48', '1768927530-742-1', '1', '2026-01-21 12:43:24', '41', '2026-01-20 17:45:30', '41', '2026-01-21 12:40:23', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1279', '1277', '54', '1768927530-9982-2', '3073', '2026-01-20 17:45:31', '41', '2026-01-20 17:45:31', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1280', '1194', '2', 'for-page-1279', '17', '2026-01-20 17:45:31', '41', '2026-01-20 17:45:31', '41', '2026-01-20 17:45:31', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1281', '1255', '62', 'wiederkehrend', '1', '2026-01-21 16:26:52', '41', '2026-01-20 18:33:12', '41', '2026-01-20 18:33:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1282', '1276', '48', '1768995619-3253-1', '1', '2026-01-21 12:43:24', '41', '2026-01-21 12:40:19', '41', '2026-01-21 12:40:23', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1283', '1270', '48', '1768995633-0366-1', '1', '2026-01-21 12:43:10', '41', '2026-01-21 12:40:33', '41', '2026-01-21 12:40:37', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1284', '1268', '72', 'ethik', '1', '2026-01-21 12:43:36', '41', '2026-01-21 12:40:48', '41', '2026-01-21 12:41:02', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1285', '1046', '2', 'for-page-1284', '17', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1286', '1114', '2', 'for-page-1284', '17', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1287', '1285', '48', '1768995648-4559-1', '1', '2026-01-21 12:41:05', '41', '2026-01-21 12:40:48', '41', '2026-01-21 12:41:02', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1288', '1286', '54', '1768995648-6046-2', '3073', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1289', '1194', '2', 'for-page-1288', '17', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '41', '2026-01-21 12:40:48', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1290', '1285', '48', '1768995735-1898-1', '1', '2026-01-21 12:43:36', '41', '2026-01-21 12:42:15', '41', '2026-01-21 12:42:19', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1291', '1268', '72', 'naturrhythmen', '1', '2026-01-21 12:43:59', '41', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:58', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1292', '1046', '2', 'for-page-1291', '17', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1293', '1114', '2', 'for-page-1291', '17', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1294', '1292', '48', '1768995762-7259-1', '1', '2026-01-21 12:43:59', '41', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:58', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1295', '1293', '54', '1768995762-8801-2', '3073', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1296', '1194', '2', 'for-page-1295', '17', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '41', '2026-01-21 12:42:42', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1297', '1', '73', 'blog', '5', '2026-02-06 11:51:18', '41', '2026-01-21 15:43:50', '41', '2026-01-21 15:43:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1298', '1297', '74', 'blogeintrag-1', '1', '2026-01-21 15:51:46', '41', '2026-01-21 15:44:10', '41', '2026-01-21 15:49:20', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1299', '1046', '2', 'for-page-1298', '17', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1300', '1114', '2', 'for-page-1298', '17', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1301', '1299', '48', '1769006650-5607-1', '1', '2026-01-21 15:51:25', '41', '2026-01-21 15:44:10', '41', '2026-01-21 15:51:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1302', '1300', '54', '1769006650-7329-2', '3073', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1303', '1194', '2', 'for-page-1302', '17', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '41', '2026-01-21 15:44:10', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1304', '1252', '69', 'blog', '1', '2026-01-21 15:47:05', '41', '2026-01-21 15:47:05', '41', '2026-01-21 15:47:05', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1305', '1299', '48', '1769007025-1998-1', '1', '2026-01-21 15:51:25', '41', '2026-01-21 15:50:25', '41', '2026-01-21 15:51:25', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1306', '1299', '48', '1769007092-4028-1', '1', '2026-01-21 15:51:46', '41', '2026-01-21 15:51:32', '41', '2026-01-21 15:51:38', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1307', '1132', '75', 'veranstaltungen', '1', '2026-01-21 16:25:57', '41', '2026-01-21 16:24:51', '41', '2026-01-21 16:24:51', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1308', '1307', '76', 'jahresprozesskurs', '1', '2026-01-27 18:19:46', '41', '2026-01-21 16:26:13', '41', '2026-01-26 10:26:44', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1309', '1046', '2', 'for-page-1308', '17', '2026-01-21 16:26:13', '41', '2026-01-21 16:26:13', '41', '2026-01-21 16:26:13', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1310', '1114', '2', 'for-page-1308', '17', '2026-01-21 16:26:14', '41', '2026-01-21 16:26:14', '41', '2026-01-21 16:26:14', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1311', '1309', '48', '1769009174-6615-1', '1', '2026-01-21 16:27:31', '41', '2026-01-21 16:26:14', '41', '2026-01-21 16:27:27', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1312', '1310', '54', '1769009174-8811-2', '1', '2026-01-21 16:27:31', '41', '2026-01-21 16:26:14', '41', '2026-01-21 16:27:27', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1313', '1194', '2', 'for-page-1312', '17', '2026-01-21 16:26:14', '41', '2026-01-21 16:26:14', '41', '2026-01-21 16:26:14', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1314', '1313', '67', '1769009235-3976-1', '1', '2026-01-21 16:27:31', '41', '2026-01-21 16:27:15', '41', '2026-01-21 16:27:27', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1315', '1313', '67', '1769009242-6894-1', '1', '2026-01-21 16:27:31', '41', '2026-01-21 16:27:22', '41', '2026-01-21 16:27:27', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1316', '1046', '2', 'for-page-1102', '17', '2026-01-21 17:21:54', '41', '2026-01-21 17:21:54', '41', '2026-01-21 17:21:54', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1317', '1316', '48', '1769012514-0876-1', '1', '2026-01-21 19:32:27', '41', '2026-01-21 17:21:54', '41', '2026-01-21 19:31:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1318', '1309', '48', '1769019597-1559-1', '3073', '2026-01-21 19:19:57', '41', '2026-01-21 19:19:57', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1319', '1046', '2', 'for-page-1106', '17', '2026-01-21 19:20:11', '41', '2026-01-21 19:20:11', '41', '2026-01-21 19:20:11', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1320', '1319', '48', '1769019611-4787-1', '1', '2026-01-21 19:33:21', '41', '2026-01-21 19:20:11', '41', '2026-01-21 19:33:21', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1322', '1218', '48', '1769020091-3026-1', '1', '2026-01-21 19:30:30', '41', '2026-01-21 19:28:11', '41', '2026-01-21 19:30:30', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1325', '1101', '46', 'erstberatung', '1', '2026-01-21 19:32:08', '41', '2026-01-21 19:31:25', '41', '2026-01-21 19:31:25', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1326', '1046', '2', 'for-page-1325', '17', '2026-01-21 19:31:25', '41', '2026-01-21 19:31:25', '41', '2026-01-21 19:31:25', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1327', '1326', '48', '1769020290-5763-1', '1', '2026-01-21 19:32:08', '41', '2026-01-21 19:31:30', '41', '2026-01-21 19:32:08', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1328', '1326', '48', '1769020322-2607-1', '1', '2026-01-21 19:32:08', '41', '2026-01-21 19:32:02', '41', '2026-01-21 19:32:08', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1330', '1319', '48', '1769020381-0611-1', '1', '2026-01-21 19:33:21', '41', '2026-01-21 19:33:01', '41', '2026-01-21 19:33:21', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1331', '1316', '48', '1769169049-929-1', '1', '2026-01-23 12:53:32', '41', '2026-01-23 12:50:49', '41', '2026-01-23 12:50:54', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1335', '1114', '2', 'for-page-1151', '17', '2026-01-23 13:24:34', '41', '2026-01-23 13:24:34', '41', '2026-01-23 13:24:34', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1336', '1335', '54', '1769171074-2571-1', '3073', '2026-01-23 13:24:34', '41', '2026-01-23 13:24:34', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1337', '1194', '2', 'for-page-1336', '17', '2026-01-23 13:24:34', '41', '2026-01-23 13:24:34', '41', '2026-01-23 13:24:34', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1338', '1132', '49', 'wissenspakete', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:08', '41', '2026-01-23 13:27:04', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1339', '1046', '2', 'for-page-1338', '17', '2026-01-23 13:26:08', '41', '2026-01-23 13:26:08', '41', '2026-01-23 13:26:08', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1340', '1114', '2', 'for-page-1338', '17', '2026-01-23 13:26:08', '41', '2026-01-23 13:26:08', '41', '2026-01-23 13:26:08', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1341', '1339', '48', '1769171169-1567-1', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:09', '41', '2026-01-23 13:27:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1342', '1340', '54', '1769171169-3317-2', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:09', '41', '2026-01-23 13:27:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1343', '1194', '2', 'for-page-1342', '17', '2026-01-23 13:26:09', '41', '2026-01-23 13:26:09', '41', '2026-01-23 13:26:09', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1344', '1339', '48', '1769171184-0521-1', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:24', '41', '2026-01-23 13:27:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1345', '1343', '67', '1769171203-1036-1', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:43', '41', '2026-01-23 13:27:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1346', '1343', '67', '1769171207-3163-1', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:47', '41', '2026-01-23 13:27:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1347', '1343', '67', '1769171216-6583-1', '1', '2026-01-23 13:27:07', '41', '2026-01-23 13:26:56', '41', '2026-01-23 13:27:04', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1348', '1', '51', 'ueber-mich', '5', '2026-02-06 11:51:25', '41', '2026-01-23 13:29:54', '41', '2026-01-23 13:29:58', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1349', '1348', '29', 'vision-und-vita', '1', '2026-01-23 13:54:42', '41', '2026-01-23 13:30:46', '41', '2026-01-23 13:35:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1350', '1046', '2', 'for-page-1349', '17', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1351', '1114', '2', 'for-page-1349', '17', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1353', '1351', '54', '1769171446-8393-2', '1', '2026-01-23 13:54:42', '41', '2026-01-23 13:30:46', '41', '2026-01-23 13:38:47', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1354', '1194', '2', 'for-page-1353', '17', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '41', '2026-01-23 13:30:46', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1355', '1114', '2', 'for-page-1175', '17', '2026-01-23 13:34:04', '41', '2026-01-23 13:34:04', '41', '2026-01-23 13:34:04', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1356', '1355', '54', '1769171645-0506-1', '3073', '2026-01-23 13:34:05', '41', '2026-01-23 13:34:05', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1357', '1194', '2', 'for-page-1356', '17', '2026-01-23 13:34:05', '41', '2026-01-23 13:34:05', '41', '2026-01-23 13:34:05', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1358', '1350', '48', '1769171794-0998-1', '1', '2026-01-23 13:39:39', '41', '2026-01-23 13:36:34', '41', '2026-01-23 13:37:36', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1359', '1350', '48', '1769171878-2495-1', '1', '2026-01-23 13:39:39', '41', '2026-01-23 13:37:58', '41', '2026-01-23 13:38:47', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1360', '1350', '48', '1769171895-7768-1', '1', '2026-01-23 13:39:39', '41', '2026-01-23 13:38:15', '41', '2026-01-23 13:38:47', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1361', '1354', '67', '1769171904-3088-1', '1', '2026-01-23 13:39:39', '41', '2026-01-23 13:38:24', '41', '2026-01-23 13:38:47', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1362', '1354', '67', '1769171908-8589-1', '1', '2026-01-23 13:39:39', '41', '2026-01-23 13:38:28', '41', '2026-01-23 13:38:47', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1364', '1101', '46', 'meine-vision', '1', '2026-01-23 13:39:14', '41', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1365', '1046', '2', 'for-page-1364', '17', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1366', '1101', '46', 'vita', '1', '2026-01-23 13:39:35', '41', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1367', '1046', '2', 'for-page-1366', '17', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '41', '2026-01-23 13:38:47', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1368', '1365', '48', '1769171937-593-1', '1', '2026-01-23 13:39:14', '41', '2026-01-23 13:38:57', '41', '2026-01-23 13:39:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1369', '1367', '48', '1769171959-2261-1', '1', '2026-01-23 13:39:35', '41', '2026-01-23 13:39:19', '41', '2026-01-23 13:39:35', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1371', '1348', '29', 'wirkungsfelder', '1', '2026-01-23 14:06:35', '41', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1372', '1046', '2', 'for-page-1371', '17', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1373', '1114', '2', 'for-page-1371', '17', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1374', '1372', '48', '1769173427-6794-1', '1', '2026-01-23 14:06:35', '41', '2026-01-23 14:03:47', '41', '2026-01-23 14:06:35', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1375', '1373', '54', '1769173427-8681-2', '3073', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1376', '1194', '2', 'for-page-1375', '17', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '41', '2026-01-23 14:03:47', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1377', '1348', '29', 'kontakt', '1', '2026-01-23 14:08:14', '41', '2026-01-23 14:06:54', '41', '2026-01-23 14:08:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1378', '1046', '2', 'for-page-1377', '17', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1379', '1114', '2', 'for-page-1377', '17', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1380', '1378', '48', '1769173614-4594-1', '1', '2026-01-23 14:08:14', '41', '2026-01-23 14:06:54', '41', '2026-01-23 14:08:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1381', '1379', '54', '1769173614-6295-2', '3073', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1382', '1194', '2', 'for-page-1381', '17', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '41', '2026-01-23 14:06:54', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1383', '1109', '77', 'leitfaden', '1', '2026-01-23 14:10:32', '41', '2026-01-23 14:09:46', '41', '2026-01-23 14:10:20', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1384', '1046', '2', 'for-page-1383', '17', '2026-01-23 14:09:46', '41', '2026-01-23 14:09:46', '41', '2026-01-23 14:09:46', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1385', '1114', '2', 'for-page-1383', '17', '2026-01-23 14:09:46', '41', '2026-01-23 14:09:46', '41', '2026-01-23 14:09:46', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1386', '1384', '48', '1769173787-4828-1', '3073', '2026-01-23 14:09:47', '41', '2026-01-23 14:09:47', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1387', '1385', '54', '1769173787-6825-2', '3073', '2026-01-23 14:09:47', '41', '2026-01-23 14:09:47', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1388', '1194', '2', 'for-page-1387', '17', '2026-01-23 14:09:47', '41', '2026-01-23 14:09:47', '41', '2026-01-23 14:09:47', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1389', '1109', '77', 'prinzipien', '1', '2026-01-26 17:09:00', '41', '2026-01-23 14:10:51', '41', '2026-01-26 17:09:00', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1390', '1046', '2', 'for-page-1389', '17', '2026-01-23 14:10:51', '41', '2026-01-23 14:10:51', '41', '2026-01-23 14:10:51', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1391', '1114', '2', 'for-page-1389', '17', '2026-01-23 14:10:51', '41', '2026-01-23 14:10:51', '41', '2026-01-23 14:10:51', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1392', '1390', '48', '1769173852-3932-1', '3073', '2026-01-23 14:10:52', '41', '2026-01-23 14:10:52', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1393', '1391', '54', '1769173852-5951-2', '3073', '2026-01-23 14:10:52', '41', '2026-01-23 14:10:52', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1394', '1194', '2', 'for-page-1393', '17', '2026-01-23 14:10:52', '41', '2026-01-23 14:10:52', '41', '2026-01-23 14:10:52', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1395', '1168', '77', 'prozessmodelle', '1', '2026-01-26 16:40:40', '41', '2026-01-23 14:26:44', '41', '2026-01-26 16:40:40', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1396', '1046', '2', 'for-page-1395', '17', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '24');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1397', '1114', '2', 'for-page-1395', '17', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1398', '1396', '48', '1769174804-6839-1', '3073', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1399', '1397', '54', '1769174804-8464-2', '3073', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1400', '1194', '2', 'for-page-1399', '17', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '41', '2026-01-23 14:26:44', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1401', '1168', '77', 'beobachten', '1', '2026-01-26 16:41:00', '41', '2026-01-23 14:27:52', '41', '2026-01-26 16:41:00', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1402', '1046', '2', 'for-page-1401', '17', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '25');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1403', '1114', '2', 'for-page-1401', '17', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1404', '1402', '48', '1769174872-8268-1', '3073', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1405', '1403', '54', '1769174872-9865-2', '3073', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1406', '1194', '2', 'for-page-1405', '17', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '41', '2026-01-23 14:27:52', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1407', '1168', '77', 'analyse', '1', '2026-01-26 16:41:23', '41', '2026-01-23 14:28:17', '41', '2026-01-26 16:41:23', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1408', '1046', '2', 'for-page-1407', '17', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '26');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1409', '1114', '2', 'for-page-1407', '17', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1410', '1408', '48', '1769174897-5496-1', '3073', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1411', '1409', '54', '1769174897-7085-2', '3073', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1412', '1194', '2', 'for-page-1411', '17', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '41', '2026-01-23 14:28:17', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1413', '1168', '77', 'design', '1', '2026-01-26 16:43:03', '41', '2026-01-23 14:28:41', '41', '2026-01-26 16:43:03', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1414', '1046', '2', 'for-page-1413', '17', '2026-01-23 14:28:41', '41', '2026-01-23 14:28:41', '41', '2026-01-23 14:28:41', '27');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1415', '1114', '2', 'for-page-1413', '17', '2026-01-23 14:28:41', '41', '2026-01-23 14:28:41', '41', '2026-01-23 14:28:41', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1416', '1414', '48', '1769174922-4172-1', '3073', '2026-01-23 14:28:42', '41', '2026-01-23 14:28:42', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1417', '1415', '54', '1769174922-5707-2', '3073', '2026-01-23 14:28:42', '41', '2026-01-23 14:28:42', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1418', '1194', '2', 'for-page-1417', '17', '2026-01-23 14:28:42', '41', '2026-01-23 14:28:42', '41', '2026-01-23 14:28:42', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1419', '1168', '77', 'umsetzung-und-pflege', '1', '2026-01-26 16:43:25', '41', '2026-01-23 14:28:58', '41', '2026-01-26 16:43:25', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1420', '1046', '2', 'for-page-1419', '17', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '28');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1421', '1114', '2', 'for-page-1419', '17', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '24');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1422', '1420', '48', '1769174938-5216-1', '3073', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1423', '1421', '54', '1769174938-6856-2', '3073', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1424', '1194', '2', 'for-page-1423', '17', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '41', '2026-01-23 14:28:58', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1425', '1171', '77', 'vorbild-natur', '1', '2026-01-26 16:44:57', '41', '2026-01-23 14:30:01', '41', '2026-01-26 12:26:52', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1426', '1046', '2', 'for-page-1425', '17', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '29');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1427', '1114', '2', 'for-page-1425', '17', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '25');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1428', '1426', '48', '1769175001-5064-1', '3073', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1429', '1427', '54', '1769175001-6628-2', '3073', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1430', '1194', '2', 'for-page-1429', '17', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '41', '2026-01-23 14:30:01', '24');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1431', '1171', '77', 'langfristiges-denken', '1', '2026-01-26 16:44:39', '41', '2026-01-23 14:30:22', '41', '2026-01-26 12:26:56', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1432', '1046', '2', 'for-page-1431', '17', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '30');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1433', '1114', '2', 'for-page-1431', '17', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '26');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1434', '1432', '48', '1769175022-6856-1', '3073', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1435', '1433', '54', '1769175022-8411-2', '3073', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1436', '1194', '2', 'for-page-1435', '17', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '41', '2026-01-23 14:30:22', '25');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1437', '1171', '77', 'ambivalenzen-und-uebergaenge', '1', '2026-01-26 16:44:11', '41', '2026-01-23 14:30:47', '41', '2026-01-26 12:26:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1438', '1046', '2', 'for-page-1437', '17', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '31');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1439', '1114', '2', 'for-page-1437', '17', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '27');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1440', '1438', '48', '1769175048-4552-1', '3073', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1441', '1439', '54', '1769175048-6154-2', '3073', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1442', '1194', '2', 'for-page-1441', '17', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '41', '2026-01-23 14:30:48', '26');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1444', '1168', '64', 'zusammenfassung', '1', '2026-01-26 16:43:44', '41', '2026-01-23 14:50:12', '41', '2026-01-26 16:43:44', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1445', '1114', '2', 'for-page-1444', '17', '2026-01-23 14:50:12', '41', '2026-01-23 14:50:12', '41', '2026-01-23 14:50:12', '28');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1446', '1445', '54', '1769176213-1449-1', '3073', '2026-01-23 14:50:13', '41', '2026-01-23 14:50:13', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1447', '1194', '2', 'for-page-1446', '17', '2026-01-23 14:50:13', '41', '2026-01-23 14:50:13', '41', '2026-01-23 14:50:13', '28');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1448', '1175', '77', 'ganzheitliches-leben', '1', '2026-01-23 15:03:12', '41', '2026-01-23 14:59:46', '41', '2026-01-23 15:03:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1449', '1046', '2', 'for-page-1448', '17', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1450', '1114', '2', 'for-page-1448', '17', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '29');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1451', '1449', '48', '1769176786-7211-1', '3073', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1452', '1450', '54', '1769176786-8872-2', '3073', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1453', '1194', '2', 'for-page-1452', '17', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '41', '2026-01-23 14:59:46', '29');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1454', '1175', '77', 'einfuehrung-8-schilde', '1', '2026-01-26 16:47:13', '41', '2026-01-23 15:00:08', '41', '2026-01-26 16:47:13', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1455', '1046', '2', 'for-page-1454', '17', '2026-01-23 15:00:08', '41', '2026-01-23 15:00:08', '41', '2026-01-23 15:00:08', '33');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1456', '1114', '2', 'for-page-1454', '17', '2026-01-23 15:00:08', '41', '2026-01-23 15:00:08', '41', '2026-01-23 15:00:08', '30');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1457', '1455', '48', '1769176809-4176-1', '3073', '2026-01-23 15:00:09', '41', '2026-01-23 15:00:09', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1458', '1456', '54', '1769176809-5757-2', '3073', '2026-01-23 15:00:09', '41', '2026-01-23 15:00:09', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1459', '1194', '2', 'for-page-1458', '17', '2026-01-23 15:00:09', '41', '2026-01-23 15:00:09', '41', '2026-01-23 15:00:09', '30');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1460', '1175', '77', 'zyklen-in-der-natur', '1', '2026-01-26 16:47:33', '41', '2026-01-23 15:00:26', '41', '2026-01-26 16:47:33', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1461', '1046', '2', 'for-page-1460', '17', '2026-01-23 15:00:26', '41', '2026-01-23 15:00:26', '41', '2026-01-23 15:00:26', '34');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1462', '1114', '2', 'for-page-1460', '17', '2026-01-23 15:00:26', '41', '2026-01-23 15:00:26', '41', '2026-01-23 15:00:26', '31');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1463', '1461', '48', '1769176827-1705-1', '3073', '2026-01-23 15:00:27', '41', '2026-01-23 15:00:27', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1464', '1462', '54', '1769176827-325-2', '3073', '2026-01-23 15:00:27', '41', '2026-01-23 15:00:27', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1465', '1194', '2', 'for-page-1464', '17', '2026-01-23 15:00:27', '41', '2026-01-23 15:00:27', '41', '2026-01-23 15:00:27', '31');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1466', '1175', '77', 'deinen-rhythmus-finden', '1', '2026-01-26 16:47:54', '41', '2026-01-23 15:00:51', '41', '2026-01-26 16:47:54', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1467', '1046', '2', 'for-page-1466', '17', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '35');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1468', '1114', '2', 'for-page-1466', '17', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1469', '1467', '48', '1769176851-5138-1', '3073', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1470', '1468', '54', '1769176851-6691-2', '3073', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1471', '1194', '2', 'for-page-1470', '17', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '41', '2026-01-23 15:00:51', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1472', '1174', '66', 'herrliche-designbeispiele', '1', '2026-01-28 11:02:03', '41', '2026-01-23 15:01:16', '41', '2026-01-23 15:01:27', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1482', '1472', '78', 'inklusiver-schrebergarten', '1', '2026-01-26 16:26:55', '41', '2026-01-23 15:25:02', '41', '2026-01-23 15:33:35', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1484', '1114', '2', 'for-page-1482', '17', '2026-01-23 15:25:02', '41', '2026-01-23 15:25:02', '41', '2026-01-23 15:25:02', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1486', '1484', '54', '1769178302-9126-2', '1', '2026-01-23 15:33:38', '41', '2026-01-23 15:25:02', '41', '2026-01-23 15:33:35', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1487', '1194', '2', 'for-page-1486', '17', '2026-01-23 15:25:02', '41', '2026-01-23 15:25:02', '41', '2026-01-23 15:25:02', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1488', '1487', '67', '1769178809-5579-1', '1', '2026-01-23 15:33:38', '41', '2026-01-23 15:33:29', '41', '2026-01-23 15:33:35', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1489', '1171', '77', 'probleme-sind-dornige-chancen', '1', '2026-01-26 16:45:18', '41', '2026-01-26 16:37:50', '41', '2026-01-26 16:45:18', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1490', '1046', '2', 'for-page-1489', '17', '2026-01-26 16:37:50', '41', '2026-01-26 16:37:50', '41', '2026-01-26 16:37:50', '36');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1491', '1114', '2', 'for-page-1489', '17', '2026-01-26 16:37:50', '41', '2026-01-26 16:37:50', '41', '2026-01-26 16:37:50', '33');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1492', '1490', '48', '1769441871-1691-1', '3073', '2026-01-26 16:37:51', '41', '2026-01-26 16:37:51', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1493', '1491', '54', '1769441871-379-2', '3073', '2026-01-26 16:37:51', '41', '2026-01-26 16:37:51', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1494', '1194', '2', 'for-page-1493', '17', '2026-01-26 16:37:51', '41', '2026-01-26 16:37:51', '41', '2026-01-26 16:37:51', '33');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1495', '1171', '77', 'systemisches-denken', '1', '2026-01-26 16:45:56', '41', '2026-01-26 16:38:41', '41', '2026-01-26 16:45:56', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1496', '1046', '2', 'for-page-1495', '17', '2026-01-26 16:38:41', '41', '2026-01-26 16:38:41', '41', '2026-01-26 16:38:41', '37');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1497', '1114', '2', 'for-page-1495', '17', '2026-01-26 16:38:41', '41', '2026-01-26 16:38:41', '41', '2026-01-26 16:38:41', '34');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1498', '1496', '48', '1769441922-2355-1', '3073', '2026-01-26 16:38:42', '41', '2026-01-26 16:38:42', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1499', '1497', '54', '1769441922-3991-2', '3073', '2026-01-26 16:38:42', '41', '2026-01-26 16:38:42', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1500', '1194', '2', 'for-page-1499', '17', '2026-01-26 16:38:42', '41', '2026-01-26 16:38:42', '41', '2026-01-26 16:38:42', '34');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1501', '1472', '78', 'abschiedsritual', '1', '2026-01-26 16:49:10', '41', '2026-01-26 16:48:25', '41', '2026-01-26 16:49:10', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1502', '1114', '2', 'for-page-1501', '17', '2026-01-26 16:48:25', '41', '2026-01-26 16:48:25', '41', '2026-01-26 16:48:25', '35');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1503', '1502', '54', '1769442506-647-1', '3073', '2026-01-26 16:48:26', '41', '2026-01-26 16:48:26', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1504', '1194', '2', 'for-page-1503', '17', '2026-01-26 16:48:26', '41', '2026-01-26 16:48:26', '41', '2026-01-26 16:48:26', '35');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1505', '1147', '60', '1769444673-4691-1', '3073', '2026-01-26 17:24:33', '41', '2026-01-26 17:24:33', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1531', '1152', '48', '1769527118-4033-1', '1', '2026-01-27 16:19:18', '41', '2026-01-27 16:18:38', '41', '2026-01-27 16:18:43', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1532', '1178', '77', 'haltung', '2049', '2026-01-28 10:54:07', '41', '2026-01-28 10:54:07', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1533', '1046', '2', 'for-page-1532', '17', '2026-01-28 10:54:07', '41', '2026-01-28 10:54:07', '41', '2026-01-28 10:54:07', '41');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1534', '1114', '2', 'for-page-1532', '17', '2026-01-28 10:54:07', '41', '2026-01-28 10:54:07', '41', '2026-01-28 10:54:07', '40');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1535', '1533', '48', '1769594048-1581-1', '3073', '2026-01-28 10:54:08', '41', '2026-01-28 10:54:08', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1536', '1534', '54', '1769594048-3306-2', '3073', '2026-01-28 10:54:08', '41', '2026-01-28 10:54:08', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1537', '1194', '2', 'for-page-1536', '17', '2026-01-28 10:54:08', '41', '2026-01-28 10:54:08', '41', '2026-01-28 10:54:08', '40');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1538', '1178', '77', 'koerper', '2049', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1539', '1046', '2', 'for-page-1538', '17', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '42');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1540', '1114', '2', 'for-page-1538', '17', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1541', '1539', '48', '1769594067-4644-1', '3073', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1542', '1540', '54', '1769594067-62-2', '3073', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1543', '1194', '2', 'for-page-1542', '17', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41', '2026-01-28 10:54:27', '41');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1544', '1178', '77', 'in-der-kueche', '2049', '2026-01-28 10:54:45', '41', '2026-01-28 10:54:45', '41', NULL, '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1545', '1046', '2', 'for-page-1544', '17', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '43');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1546', '1114', '2', 'for-page-1544', '17', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '42');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1547', '1545', '48', '1769594086-4461-1', '3073', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1548', '1546', '54', '1769594086-6045-2', '3073', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1549', '1194', '2', 'for-page-1548', '17', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '41', '2026-01-28 10:54:46', '42');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1550', '1178', '77', 'wohnen', '2049', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '41', NULL, '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1551', '1046', '2', 'for-page-1550', '17', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '44');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1552', '1114', '2', 'for-page-1550', '17', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '43');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1553', '1551', '48', '1769594102-9557-1', '3073', '2026-01-28 10:55:02', '41', '2026-01-28 10:55:02', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1554', '1552', '54', '1769594103-1133-2', '3073', '2026-01-28 10:55:03', '41', '2026-01-28 10:55:03', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1555', '1194', '2', 'for-page-1554', '17', '2026-01-28 10:55:03', '41', '2026-01-28 10:55:03', '41', '2026-01-28 10:55:03', '43');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1556', '1178', '77', 'unterwegs', '2049', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '41', NULL, '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1557', '1046', '2', 'for-page-1556', '17', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '45');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1558', '1114', '2', 'for-page-1556', '17', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '44');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1559', '1557', '48', '1769594116-8721-1', '3073', '2026-01-28 10:55:16', '41', '2026-01-28 10:55:16', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1560', '1558', '54', '1769594117-0287-2', '3073', '2026-01-28 10:55:17', '41', '2026-01-28 10:55:17', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1561', '1194', '2', 'for-page-1560', '17', '2026-01-28 10:55:17', '41', '2026-01-28 10:55:17', '41', '2026-01-28 10:55:17', '44');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1562', '1178', '77', 'alltagskultur', '2049', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '41', NULL, '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1563', '1046', '2', 'for-page-1562', '17', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '46');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1564', '1114', '2', 'for-page-1562', '17', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '45');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1565', '1563', '48', '1769594146-9564-1', '3073', '2026-01-28 10:55:46', '41', '2026-01-28 10:55:46', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1566', '1564', '54', '1769594147-1062-2', '3073', '2026-01-28 10:55:47', '41', '2026-01-28 10:55:47', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1567', '1194', '2', 'for-page-1566', '17', '2026-01-28 10:55:47', '41', '2026-01-28 10:55:47', '41', '2026-01-28 10:55:47', '45');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1568', '1175', '64', 'zusammenfassung', '2049', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '41', NULL, '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1569', '1114', '2', 'for-page-1568', '17', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '46');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1570', '1569', '54', '1769594203-9106-1', '3073', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1571', '1194', '2', 'for-page-1570', '17', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '41', '2026-01-28 10:56:43', '46');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1572', '1178', '64', 'zusammenfassung', '2049', '2026-01-28 10:57:22', '41', '2026-01-28 10:57:22', '41', NULL, '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1573', '1114', '2', 'for-page-1572', '17', '2026-01-28 10:57:22', '41', '2026-01-28 10:57:22', '41', '2026-01-28 10:57:22', '47');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1574', '1573', '54', '1769594243-0986-1', '3073', '2026-01-28 10:57:23', '41', '2026-01-28 10:57:23', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1575', '1194', '2', 'for-page-1574', '17', '2026-01-28 10:57:23', '41', '2026-01-28 10:57:23', '41', '2026-01-28 10:57:23', '47');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1576', '1181', '77', 'innere-landschaft', '2049', '2026-01-28 10:57:38', '41', '2026-01-28 10:57:38', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1577', '1046', '2', 'for-page-1576', '17', '2026-01-28 10:57:38', '41', '2026-01-28 10:57:38', '41', '2026-01-28 10:57:38', '47');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1578', '1114', '2', 'for-page-1576', '17', '2026-01-28 10:57:38', '41', '2026-01-28 10:57:38', '41', '2026-01-28 10:57:38', '48');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1579', '1577', '48', '1769594259-3776-1', '3073', '2026-01-28 10:57:39', '41', '2026-01-28 10:57:39', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1580', '1578', '54', '1769594259-533-2', '3073', '2026-01-28 10:57:39', '41', '2026-01-28 10:57:39', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1581', '1194', '2', 'for-page-1580', '17', '2026-01-28 10:57:39', '41', '2026-01-28 10:57:39', '41', '2026-01-28 10:57:39', '48');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1582', '1181', '77', 'interaktion', '2049', '2026-01-28 10:57:55', '41', '2026-01-28 10:57:55', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1583', '1046', '2', 'for-page-1582', '17', '2026-01-28 10:57:55', '41', '2026-01-28 10:57:55', '41', '2026-01-28 10:57:55', '48');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1584', '1114', '2', 'for-page-1582', '17', '2026-01-28 10:57:55', '41', '2026-01-28 10:57:55', '41', '2026-01-28 10:57:55', '49');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1585', '1583', '48', '1769594276-1435-1', '3073', '2026-01-28 10:57:56', '41', '2026-01-28 10:57:56', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1586', '1584', '54', '1769594276-2942-2', '3073', '2026-01-28 10:57:56', '41', '2026-01-28 10:57:56', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1587', '1194', '2', 'for-page-1586', '17', '2026-01-28 10:57:56', '41', '2026-01-28 10:57:56', '41', '2026-01-28 10:57:56', '49');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1588', '1181', '77', 'raeume', '2049', '2026-01-28 10:58:14', '41', '2026-01-28 10:58:14', '41', NULL, '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1589', '1046', '2', 'for-page-1588', '17', '2026-01-28 10:58:14', '41', '2026-01-28 10:58:14', '41', '2026-01-28 10:58:14', '49');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1590', '1114', '2', 'for-page-1588', '17', '2026-01-28 10:58:14', '41', '2026-01-28 10:58:14', '41', '2026-01-28 10:58:14', '50');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1591', '1589', '48', '1769594295-1021-1', '3073', '2026-01-28 10:58:15', '41', '2026-01-28 10:58:15', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1592', '1590', '54', '1769594295-2524-2', '3073', '2026-01-28 10:58:15', '41', '2026-01-28 10:58:15', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1593', '1194', '2', 'for-page-1592', '17', '2026-01-28 10:58:15', '41', '2026-01-28 10:58:15', '41', '2026-01-28 10:58:15', '50');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1594', '1181', '77', 'soziale-prozesse', '2049', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', NULL, '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1595', '1046', '2', 'for-page-1594', '17', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '50');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1596', '1114', '2', 'for-page-1594', '17', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '51');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1597', '1595', '48', '1769594313-6797-1', '3073', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1598', '1596', '54', '1769594313-8395-2', '3073', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1599', '1194', '2', 'for-page-1598', '17', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '41', '2026-01-28 10:58:33', '51');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1600', '1181', '77', 'kultur-und-prozesshaftes-leben', '2049', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '41', NULL, '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1601', '1046', '2', 'for-page-1600', '17', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '51');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1602', '1114', '2', 'for-page-1600', '17', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '52');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1603', '1601', '48', '1769594341-971-1', '3073', '2026-01-28 10:59:01', '41', '2026-01-28 10:59:01', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1604', '1602', '54', '1769594342-1298-2', '3073', '2026-01-28 10:59:02', '41', '2026-01-28 10:59:02', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1605', '1194', '2', 'for-page-1604', '17', '2026-01-28 10:59:02', '41', '2026-01-28 10:59:02', '41', '2026-01-28 10:59:02', '52');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1606', '1181', '64', 'zusammenfassung', '2049', '2026-01-28 10:59:32', '41', '2026-01-28 10:59:32', '41', NULL, '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1607', '1114', '2', 'for-page-1606', '17', '2026-01-28 10:59:32', '41', '2026-01-28 10:59:32', '41', '2026-01-28 10:59:32', '53');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1608', '1607', '54', '1769594373-1425-1', '3073', '2026-01-28 10:59:33', '41', '2026-01-28 10:59:33', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1609', '1194', '2', 'for-page-1608', '17', '2026-01-28 10:59:33', '41', '2026-01-28 10:59:33', '41', '2026-01-28 10:59:33', '53');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1610', '1184', '77', 'design-nach-beduerfnissen', '2049', '2026-01-28 11:00:10', '41', '2026-01-28 11:00:10', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1611', '1046', '2', 'for-page-1610', '17', '2026-01-28 11:00:10', '41', '2026-01-28 11:00:10', '41', '2026-01-28 11:00:10', '52');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1612', '1114', '2', 'for-page-1610', '17', '2026-01-28 11:00:10', '41', '2026-01-28 11:00:10', '41', '2026-01-28 11:00:10', '54');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1613', '1611', '48', '1769594410-999-1', '3073', '2026-01-28 11:00:11', '41', '2026-01-28 11:00:11', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1614', '1612', '54', '1769594411-1512-2', '3073', '2026-01-28 11:00:11', '41', '2026-01-28 11:00:11', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1615', '1194', '2', 'for-page-1614', '17', '2026-01-28 11:00:11', '41', '2026-01-28 11:00:11', '41', '2026-01-28 11:00:11', '54');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1616', '1184', '77', 'ablauf-eines-designs', '2049', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1617', '1046', '2', 'for-page-1616', '17', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '53');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1618', '1114', '2', 'for-page-1616', '17', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '55');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1619', '1617', '48', '1769594429-7639-1', '3073', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1620', '1618', '54', '1769594429-9198-2', '3073', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1621', '1194', '2', 'for-page-1620', '17', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '41', '2026-01-28 11:00:29', '55');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1622', '1184', '77', 'gartenelemente', '2049', '2026-01-28 11:00:44', '41', '2026-01-28 11:00:44', '41', NULL, '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1623', '1046', '2', 'for-page-1622', '17', '2026-01-28 11:00:44', '41', '2026-01-28 11:00:44', '41', '2026-01-28 11:00:44', '54');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1624', '1114', '2', 'for-page-1622', '17', '2026-01-28 11:00:44', '41', '2026-01-28 11:00:44', '41', '2026-01-28 11:00:44', '56');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1625', '1623', '48', '1769594445-2716-1', '3073', '2026-01-28 11:00:45', '41', '2026-01-28 11:00:45', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1626', '1624', '54', '1769594445-4229-2', '3073', '2026-01-28 11:00:45', '41', '2026-01-28 11:00:45', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1627', '1194', '2', 'for-page-1626', '17', '2026-01-28 11:00:45', '41', '2026-01-28 11:00:45', '41', '2026-01-28 11:00:45', '56');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1628', '1184', '77', 'lebendige-raeume-kreieren', '2049', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', NULL, '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1629', '1046', '2', 'for-page-1628', '17', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '55');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1630', '1114', '2', 'for-page-1628', '17', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '57');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1631', '1629', '48', '1769594470-802-1', '3073', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1632', '1630', '54', '1769594470-952-2', '3073', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1633', '1194', '2', 'for-page-1632', '17', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '41', '2026-01-28 11:01:10', '57');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1634', '1184', '77', 'der-naturgarten', '2049', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', NULL, '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1635', '1046', '2', 'for-page-1634', '17', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '56');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1636', '1114', '2', 'for-page-1634', '17', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '58');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1637', '1635', '48', '1769594488-5639-1', '3073', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1638', '1636', '54', '1769594488-7133-2', '3073', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1639', '1194', '2', 'for-page-1638', '17', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '41', '2026-01-28 11:01:28', '58');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1640', '1171', '64', 'zusammenfassung', '2049', '2026-01-28 11:03:34', '41', '2026-01-28 11:03:34', '41', NULL, '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1641', '1114', '2', 'for-page-1640', '17', '2026-01-28 11:03:34', '41', '2026-01-28 11:03:34', '41', '2026-01-28 11:03:34', '59');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1642', '1641', '54', '1769594615-0688-1', '3073', '2026-01-28 11:03:35', '41', '2026-01-28 11:03:35', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1643', '1194', '2', 'for-page-1642', '17', '2026-01-28 11:03:35', '41', '2026-01-28 11:03:35', '41', '2026-01-28 11:03:35', '59');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1014', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1018', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1020', '1', '2026-01-08 15:49:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1021', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1025', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1037', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1039', '2', '2026-01-08 10:44:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1101', '1', '2026-01-08 14:36:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1102', '1', '2026-01-08 14:51:21');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1106', '1', '2026-01-08 15:03:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1109', '1', '2026-01-08 15:58:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1117', '1', '2026-01-08 17:10:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1118', '1', '2026-01-08 17:32:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1120', '1', '2026-01-08 17:46:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1121', '2', '2026-01-08 17:48:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1132', '1', '2026-01-09 10:29:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1140', '2', '2026-01-09 12:01:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1148', '2', '2026-01-09 14:25:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1151', '1', '2026-01-13 15:07:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1153', '2', '2026-01-13 15:10:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1157', '1', '2026-01-13 15:22:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1168', '1', '2026-01-13 16:54:31');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1171', '1', '2026-01-13 16:54:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1174', '1', '2026-01-13 16:56:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1175', '1', '2026-01-13 16:56:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1178', '1', '2026-01-13 16:57:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1181', '1', '2026-01-13 16:57:40');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1184', '1', '2026-01-13 16:57:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1187', '1', '2026-01-13 17:03:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1200', '2', '2026-01-15 13:32:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1202', '2', '2026-01-15 13:32:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1203', '2', '2026-01-15 13:32:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1205', '2', '2026-01-15 13:36:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1207', '2', '2026-01-15 13:38:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1208', '2', '2026-01-19 09:47:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1209', '2', '2026-01-19 09:54:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1215', '2', '2026-01-19 10:17:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1217', '2', '2026-01-19 12:26:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1219', '2', '2026-01-19 12:58:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1222', '2', '2026-01-19 13:19:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1223', '1', '2026-01-19 14:24:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1226', '2', '2026-01-19 14:24:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1227', '2', '2026-01-19 14:24:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1229', '2', '2026-01-19 14:26:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1230', '1', '2026-01-19 14:26:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1232', '1', '2026-01-19 14:26:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1234', '1', '2026-01-19 14:26:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1236', '2', '2026-01-19 14:27:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1237', '2', '2026-01-19 14:27:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1238', '2', '2026-01-19 14:27:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1239', '2', '2026-01-19 14:27:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1240', '2', '2026-01-19 14:28:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1241', '2', '2026-01-19 14:28:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1243', '2', '2026-01-19 14:33:19');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1244', '1', '2026-01-19 14:43:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1246', '2', '2026-01-19 14:43:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1248', '2', '2026-01-19 14:43:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1250', '2', '2026-01-19 15:00:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1252', '1', '2026-01-20 13:55:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1253', '1', '2026-01-20 14:03:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1254', '1', '2026-01-20 14:03:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1255', '1', '2026-01-20 14:11:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1256', '1', '2026-01-20 14:13:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1257', '1', '2026-01-20 14:13:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1258', '1', '2026-01-20 14:30:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1262', '1', '2026-01-20 14:31:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1265', '1', '2026-01-20 14:35:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1266', '1', '2026-01-20 14:35:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1267', '1', '2026-01-20 14:36:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1268', '1', '2026-01-20 16:01:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1269', '1', '2026-01-20 16:03:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1272', '2', '2026-01-20 16:03:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1273', '2', '2026-01-20 16:03:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1275', '1', '2026-01-20 17:45:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1278', '2', '2026-01-20 17:45:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1279', '2', '2026-01-20 17:45:31');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1281', '1', '2026-01-20 18:33:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1282', '2', '2026-01-21 12:40:19');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1283', '2', '2026-01-21 12:40:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1284', '1', '2026-01-21 12:40:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1287', '2', '2026-01-21 12:40:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1288', '2', '2026-01-21 12:40:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1290', '2', '2026-01-21 12:42:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1291', '1', '2026-01-21 12:42:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1294', '2', '2026-01-21 12:42:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1295', '2', '2026-01-21 12:42:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1297', '1', '2026-01-21 15:43:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1298', '1', '2026-01-21 15:44:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1301', '2', '2026-01-21 15:44:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1302', '2', '2026-01-21 15:44:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1304', '1', '2026-01-21 15:47:05');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1305', '2', '2026-01-21 15:50:25');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1306', '2', '2026-01-21 15:51:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1307', '1', '2026-01-21 16:24:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1308', '1', '2026-01-21 16:26:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1311', '2', '2026-01-21 16:26:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1312', '2', '2026-01-21 16:26:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1314', '2', '2026-01-21 16:27:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1315', '2', '2026-01-21 16:27:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1317', '2', '2026-01-21 17:21:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1318', '2', '2026-01-21 19:19:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1320', '2', '2026-01-21 19:20:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1322', '2', '2026-01-21 19:28:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1325', '1', '2026-01-21 19:31:25');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1327', '2', '2026-01-21 19:31:30');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1328', '2', '2026-01-21 19:32:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1330', '2', '2026-01-21 19:33:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1331', '2', '2026-01-23 12:50:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1336', '2', '2026-01-23 13:24:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1338', '1', '2026-01-23 13:26:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1341', '2', '2026-01-23 13:26:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1342', '2', '2026-01-23 13:26:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1344', '2', '2026-01-23 13:26:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1345', '2', '2026-01-23 13:26:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1346', '2', '2026-01-23 13:26:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1347', '2', '2026-01-23 13:26:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1348', '1', '2026-01-23 13:29:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1349', '1', '2026-01-23 13:30:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1353', '2', '2026-01-23 13:30:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1356', '2', '2026-01-23 13:34:05');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1358', '2', '2026-01-23 13:36:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1359', '2', '2026-01-23 13:37:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1360', '2', '2026-01-23 13:38:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1361', '2', '2026-01-23 13:38:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1362', '2', '2026-01-23 13:38:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1364', '1', '2026-01-23 13:38:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1366', '1', '2026-01-23 13:38:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1368', '2', '2026-01-23 13:38:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1369', '2', '2026-01-23 13:39:19');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1371', '1', '2026-01-23 14:03:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1374', '2', '2026-01-23 14:03:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1375', '2', '2026-01-23 14:03:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1377', '1', '2026-01-23 14:06:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1380', '2', '2026-01-23 14:06:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1381', '2', '2026-01-23 14:06:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1383', '1', '2026-01-23 14:09:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1386', '2', '2026-01-23 14:09:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1387', '2', '2026-01-23 14:09:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1389', '1', '2026-01-23 14:10:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1392', '2', '2026-01-23 14:10:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1393', '2', '2026-01-23 14:10:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1395', '1', '2026-01-23 14:26:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1398', '2', '2026-01-23 14:26:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1399', '2', '2026-01-23 14:26:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1401', '1', '2026-01-23 14:27:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1404', '2', '2026-01-23 14:27:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1405', '2', '2026-01-23 14:27:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1407', '1', '2026-01-23 14:28:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1410', '2', '2026-01-23 14:28:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1411', '2', '2026-01-23 14:28:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1413', '1', '2026-01-23 14:28:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1416', '2', '2026-01-23 14:28:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1417', '2', '2026-01-23 14:28:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1419', '1', '2026-01-23 14:28:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1422', '2', '2026-01-23 14:28:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1423', '2', '2026-01-23 14:28:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1425', '1', '2026-01-23 14:30:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1428', '2', '2026-01-23 14:30:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1429', '2', '2026-01-23 14:30:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1431', '1', '2026-01-23 14:30:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1434', '2', '2026-01-23 14:30:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1435', '2', '2026-01-23 14:30:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1437', '1', '2026-01-23 14:30:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1440', '2', '2026-01-23 14:30:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1441', '2', '2026-01-23 14:30:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1444', '1', '2026-01-23 14:50:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1446', '2', '2026-01-23 14:50:13');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1448', '1', '2026-01-23 14:59:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1451', '2', '2026-01-23 14:59:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1452', '2', '2026-01-23 14:59:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1454', '1', '2026-01-23 15:00:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1457', '2', '2026-01-23 15:00:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1458', '2', '2026-01-23 15:00:09');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1460', '1', '2026-01-23 15:00:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1463', '2', '2026-01-23 15:00:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1464', '2', '2026-01-23 15:00:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1466', '1', '2026-01-23 15:00:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1469', '2', '2026-01-23 15:00:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1470', '2', '2026-01-23 15:00:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1472', '1', '2026-01-23 15:01:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1486', '2', '2026-01-23 15:25:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1488', '2', '2026-01-23 15:33:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1489', '1', '2026-01-26 16:37:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1492', '2', '2026-01-26 16:37:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1493', '2', '2026-01-26 16:37:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1495', '1', '2026-01-26 16:38:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1498', '2', '2026-01-26 16:38:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1499', '2', '2026-01-26 16:38:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1503', '2', '2026-01-26 16:48:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1505', '2', '2026-01-26 17:24:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1531', '2', '2026-01-27 16:18:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1532', '1', '2026-01-28 10:54:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1535', '2', '2026-01-28 10:54:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1536', '2', '2026-01-28 10:54:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1538', '1', '2026-01-28 10:54:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1541', '2', '2026-01-28 10:54:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1542', '2', '2026-01-28 10:54:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1544', '1', '2026-01-28 10:54:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1547', '2', '2026-01-28 10:54:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1548', '2', '2026-01-28 10:54:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1550', '1', '2026-01-28 10:55:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1553', '2', '2026-01-28 10:55:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1554', '2', '2026-01-28 10:55:03');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1556', '1', '2026-01-28 10:55:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1559', '2', '2026-01-28 10:55:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1560', '2', '2026-01-28 10:55:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1562', '1', '2026-01-28 10:55:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1565', '2', '2026-01-28 10:55:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1566', '2', '2026-01-28 10:55:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1568', '1', '2026-01-28 10:56:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1570', '2', '2026-01-28 10:56:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1572', '1', '2026-01-28 10:57:22');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1574', '2', '2026-01-28 10:57:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1576', '1', '2026-01-28 10:57:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1579', '2', '2026-01-28 10:57:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1580', '2', '2026-01-28 10:57:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1582', '1', '2026-01-28 10:57:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1585', '2', '2026-01-28 10:57:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1586', '2', '2026-01-28 10:57:56');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1588', '1', '2026-01-28 10:58:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1591', '2', '2026-01-28 10:58:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1592', '2', '2026-01-28 10:58:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1594', '1', '2026-01-28 10:58:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1597', '2', '2026-01-28 10:58:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1598', '2', '2026-01-28 10:58:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1600', '1', '2026-01-28 10:59:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1603', '2', '2026-01-28 10:59:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1604', '2', '2026-01-28 10:59:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1606', '1', '2026-01-28 10:59:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1608', '2', '2026-01-28 10:59:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1610', '1', '2026-01-28 11:00:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1613', '2', '2026-01-28 11:00:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1614', '2', '2026-01-28 11:00:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1616', '1', '2026-01-28 11:00:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1619', '2', '2026-01-28 11:00:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1620', '2', '2026-01-28 11:00:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1622', '1', '2026-01-28 11:00:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1625', '2', '2026-01-28 11:00:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1626', '2', '2026-01-28 11:00:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1628', '1', '2026-01-28 11:01:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1631', '2', '2026-01-28 11:01:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1632', '2', '2026-01-28 11:01:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1634', '1', '2026-01-28 11:01:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1637', '2', '2026-01-28 11:01:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1638', '2', '2026-01-28 11:01:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1640', '1', '2026-01-28 11:03:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1642', '2', '2026-01-28 11:03:35');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('7', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1022', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1022', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1028', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1046', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1046', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1109', '1020');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1114', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1114', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1119', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1119', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1119', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1122', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1122', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1122', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1126', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1126', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1127', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1127', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1127', '1126');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1133', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1133', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1147', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1147', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1147', '1133');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1152', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1152', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1152', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1168', '1020');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1171', '1020');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1175', '1174');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1178', '1174');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1181', '1174');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1184', '1174');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1187', '1020');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1194', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1194', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1199', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1199', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1199', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1201', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1201', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1201', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1206', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1206', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1206', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1218', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1218', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1218', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1224', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1224', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1224', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1225', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1225', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1225', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1228', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1228', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1228', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1231', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1231', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1231', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1233', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1233', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1233', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1235', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1235', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1235', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1245', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1245', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1245', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1247', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1247', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1247', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1249', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1249', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1249', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1255', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1258', '1255');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1262', '1255');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1268', '1020');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1268', '1187');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1270', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1270', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1270', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1271', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1271', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1271', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1276', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1276', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1276', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1277', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1277', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1277', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1285', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1285', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1285', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1286', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1286', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1286', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1292', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1292', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1292', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1293', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1293', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1293', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1299', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1299', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1299', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1300', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1300', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1300', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1307', '1132');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1309', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1309', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1309', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1310', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1310', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1310', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1313', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1313', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1313', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1316', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1316', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1316', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1319', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1319', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1319', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1326', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1326', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1326', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1335', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1335', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1335', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1339', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1339', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1339', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1340', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1340', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1340', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1343', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1343', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1343', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1350', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1350', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1350', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1351', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1351', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1351', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1354', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1354', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1354', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1355', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1355', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1355', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1365', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1365', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1365', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1367', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1367', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1367', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1372', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1372', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1372', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1373', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1373', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1373', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1378', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1378', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1378', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1379', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1379', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1379', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1384', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1384', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1384', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1385', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1385', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1385', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1390', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1390', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1390', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1391', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1391', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1391', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1396', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1396', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1396', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1397', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1397', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1397', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1402', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1402', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1402', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1403', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1403', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1403', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1408', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1408', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1408', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1409', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1409', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1409', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1414', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1414', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1414', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1415', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1415', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1415', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1420', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1420', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1420', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1421', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1421', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1421', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1426', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1426', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1426', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1427', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1427', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1427', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1432', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1432', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1432', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1433', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1433', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1433', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1438', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1438', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1438', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1439', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1439', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1439', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1445', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1445', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1445', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1449', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1449', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1449', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1450', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1450', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1450', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1455', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1455', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1455', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1456', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1456', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1456', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1461', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1461', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1461', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1462', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1462', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1462', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1467', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1467', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1467', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1468', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1468', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1468', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1472', '1174');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1484', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1484', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1484', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1487', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1487', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1487', '1194');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1490', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1490', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1490', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1491', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1491', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1491', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1496', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1496', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1496', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1497', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1497', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1497', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1502', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1502', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1502', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1533', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1533', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1533', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1534', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1534', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1534', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1539', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1539', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1539', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1540', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1540', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1540', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1545', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1545', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1545', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1546', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1546', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1546', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1551', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1551', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1551', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1552', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1552', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1552', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1557', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1557', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1557', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1558', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1558', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1558', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1563', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1563', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1563', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1564', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1564', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1564', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1569', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1569', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1569', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1573', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1573', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1573', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1577', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1577', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1577', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1578', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1578', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1578', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1583', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1583', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1583', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1584', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1584', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1584', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1589', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1589', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1589', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1590', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1590', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1590', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1595', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1595', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1595', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1596', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1596', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1596', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1601', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1601', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1601', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1602', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1602', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1602', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1607', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1607', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1607', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1611', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1611', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1611', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1612', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1612', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1612', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1617', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1617', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1617', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1618', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1618', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1618', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1623', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1623', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1623', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1624', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1624', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1624', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1629', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1629', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1629', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1630', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1630', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1630', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1635', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1635', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1635', '1046');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1636', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1636', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1636', '1114');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1641', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1641', '1028');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1641', '1114');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pages_sortfields` (`pages_id`, `sortfield`) VALUES('1101', '1');
INSERT INTO `pages_sortfields` (`pages_id`, `sortfield`) VALUES('1118', '1');
INSERT INTO `pages_sortfields` (`pages_id`, `sortfield`) VALUES('1252', '1');

DROP TABLE IF EXISTS `process_forgot_password`;
CREATE TABLE `process_forgot_password` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `token` char(32) NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `ts` (`ts`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `session_login_throttle` (`name`, `attempts`, `last_attempt`) VALUES('chadm', '1', '1770108013');

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":0,\"modified\":1767964752,\"ns\":\"ProcessWire\",\"_lazy\":1,\"roles\":[37,1037]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1765475399,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":0,\"modified\":1769442989,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'http-status', '97', '0', '0', '{\"noChildren\":1,\"slashUrls\":1,\"compile\":0,\"modified\":1674132293,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'language', '98', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"compile\":3,\"nameContentTab\":1,\"modified\":1674133877}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'accordion', '100', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[50],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769442953,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', 'repeater_content', '102', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterMatrixPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1767880716,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('49', 'offer', '103', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443477,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', 'accordions', '104', '0', '0', '{\"noParents\":-1,\"childTemplates\":[46],\"parentTemplates\":[1],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769442959,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', 'level-a', '105', '0', '0', '{\"childTemplates\":[52,70,73,66,75,49],\"parentTemplates\":[1],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443394,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'overview', '106', '0', '0', '{\"childTemplates\":[77,64],\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769594904,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'repeater_related_content', '108', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1770116635,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'field-image', '109', '0', '0', '{\"slashUrls\":1,\"noGlobal\":true,\"compile\":0,\"modified\":1769600539,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'licenses', '110', '0', '0', '{\"noParents\":-1,\"childTemplates\":[57],\"parentTemplates\":[1],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443453,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('57', 'license', '111', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[56],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443446,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'repeater_custom_links', '113', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1768314678,\"_lazy\":\"*\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('60', 'repeater_slider', '114', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterMatrixPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1767953893,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', 'categories', '115', '0', '0', '{\"sortfield\":1,\"noParents\":-1,\"childTemplates\":[62],\"parentTemplates\":[1],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769442905,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'category', '116', '0', '0', '{\"childTemplates\":[62],\"parentTemplates\":[61,62],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1770369214,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'field-images', '117', '0', '0', '{\"slashUrls\":1,\"noGlobal\":true,\"compile\":0,\"modified\":1769600515,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('64', 'summary', '118', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[52],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443613,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'tools', '119', '0', '0', '{\"noParents\":-1,\"childTemplates\":[72],\"parentTemplates\":[70],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443631,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('66', 'projects', '120', '0', '0', '{\"sortfield\":1,\"noParents\":-1,\"childTemplates\":[78],\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1770374030,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('67', 'repeater_in_depth', '121', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1768479717}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('68', 'contexts', '122', '0', '0', '{\"noParents\":-1,\"childTemplates\":[69],\"parentTemplates\":[1],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443286,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('69', 'context', '123', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[68],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443270,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('70', 'overview-tools', '124', '0', '0', '{\"noParents\":-1,\"childTemplates\":[65],\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443516,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('72', 'tool', '126', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[65],\"slashUrls\":1,\"compile\":0,\"modified\":1769175772,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('73', 'blog', '127', '0', '0', '{\"sortfield\":\"created\",\"noParents\":-1,\"childTemplates\":[74],\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769008842,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('74', 'blog-post', '128', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[73],\"slashUrls\":1,\"compile\":0,\"modified\":1769443052,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('75', 'events', '129', '0', '0', '{\"sortfield\":\"created\",\"noParents\":-1,\"childTemplates\":[76],\"parentTemplates\":[51],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443328,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('76', 'event', '130', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[75],\"slashUrls\":1,\"compile\":0,\"modified\":1769443326,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('77', 'chapter', '131', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[52,70],\"slashUrls\":1,\"noShortcut\":1,\"compile\":0,\"modified\":1769443246,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('78', 'project', '132', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[66],\"slashUrls\":1,\"compile\":0,\"modified\":1769594945,\"_lazy\":1}');

# --- /WireDatabaseBackup {"numTables":53,"numCreateTables":53,"numInserts":2520,"numSeconds":0}