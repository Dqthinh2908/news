-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table news.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `content_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_comment_users` (`users_id`),
  KEY `FK_comment_posts` (`posts_id`),
  CONSTRAINT `FK_comment_posts` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table news.comment: ~11 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `users_id`, `posts_id`, `content_comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 2, 15, '3123', '2022-04-25 11:35:26', '2022-04-25 13:42:04', NULL),
	(2, 4, 15, 'Bài viết thật tuyệt!', '2022-04-26 09:18:09', '2022-04-26 09:18:15', '2022-04-26 09:18:15'),
	(3, 2, 13, 'Bài viết thật tuyệt!', '2022-04-28 18:06:39', '2022-04-28 18:07:14', '2022-04-28 18:07:14'),
	(4, 2, 13, 'Bài viết thật tuyệt', '2022-04-28 18:07:52', '2022-04-28 18:09:20', '2022-04-28 18:09:20'),
	(5, 2, 13, 'Hi Duynq', '2022-04-28 18:09:31', '2022-04-28 18:09:31', NULL),
	(6, 2, 13, 'fdgfdgfd', '2022-04-28 18:10:23', '2022-04-28 18:10:23', NULL),
	(7, 2, 15, 'Bai viet that tuyet', '2022-04-28 21:10:29', '2022-04-28 21:10:32', '2022-04-28 21:10:32'),
	(8, 2, 15, 'Hay qua', '2022-04-28 21:10:47', '2022-04-28 21:10:55', '2022-04-28 21:10:55'),
	(9, 2, 15, 'Hello', '2022-04-28 21:11:31', '2022-04-28 21:11:37', '2022-04-28 21:11:37'),
	(10, 2, 15, 'Hello bai viet hay qua', '2022-04-28 21:11:49', '2022-04-28 21:11:49', NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table news.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table news.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_03_30_104631_create_posts_category_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table news.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table news.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `key_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table news.permissions: ~34 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `display_name`, `status`, `created_at`, `deleted_at`, `updated_at`, `parent_id`, `key_code`) VALUES
	(1, 'Danh mục Tin tức', 'Danh mục Tin tức', 1, NULL, NULL, NULL, 0, ''),
	(2, 'Danh sách tin tức', 'Danh sách tin tức', 1, NULL, NULL, NULL, 1, 'list_posts'),
	(3, 'Thêm Tin Tức', 'Thêm tin tức', 1, NULL, NULL, NULL, 1, 'add_posts'),
	(4, 'Sửa Tin Tức', 'Sửa Tin Tức', 1, NULL, NULL, NULL, 1, 'update_posts'),
	(5, 'Xóa Tin Tức', 'Xóa Tin Tức', 1, NULL, NULL, NULL, 1, 'delete_posts'),
	(6, 'Danh mục thể loại', 'Danh mục thể loại', 1, NULL, NULL, NULL, 0, ''),
	(7, 'Danh sách thể loại', 'Danh sách thể loại', 1, NULL, NULL, NULL, 6, 'list_categories'),
	(8, 'Thêm thể loại', 'Thêm thể loại', 1, NULL, NULL, NULL, 6, 'add_categories'),
	(9, 'Sửa thể loại', 'Sửa thể loại', 1, NULL, NULL, NULL, 6, 'update_categories'),
	(10, 'Xóa thể loại', 'Xóa thể loại', 1, NULL, NULL, NULL, 6, 'delete_categories'),
	(11, 'Danh mục tài khoản', 'Danh mục tài khoản', 1, NULL, NULL, NULL, 0, ''),
	(12, 'Danh sách tài khoản', 'Danh sách tài khoản', 1, NULL, NULL, NULL, 11, 'list_account'),
	(13, 'Thêm tài khoản', 'Thêm tài khoản', 1, NULL, NULL, NULL, 11, 'add_account'),
	(14, 'Sửa tài khoản', 'Sửa tài khoản', 1, NULL, NULL, NULL, 11, 'update_account'),
	(15, 'Xóa tài khoản', 'Xóa tài khoản', 1, NULL, NULL, NULL, 11, 'delete_account'),
	(16, 'Danh mục bình luận', 'Danh mục bình luận', 1, NULL, NULL, NULL, 0, ''),
	(17, 'Danh sách bình luận', 'Danh sách bình luận', 1, NULL, NULL, NULL, 16, 'list_comment'),
	(18, 'Thêm bình luận', 'Thêm bình luận', 1, NULL, NULL, NULL, 16, 'add_comment'),
	(19, 'Sửa bình luận', 'Sửa bình luận', 1, NULL, NULL, NULL, 16, 'update_comment'),
	(20, 'Xóa bình luận', 'Xóa bình luận', 1, NULL, NULL, NULL, 16, 'delete_comment'),
	(21, 'Danh mục vai trò', 'Danh mục vai trò', 1, NULL, NULL, NULL, 0, ''),
	(22, 'Danh sách vai trò', 'Danh sách vai trò', 1, NULL, NULL, NULL, 21, 'list_role'),
	(23, 'Thêm vai trò', 'Thêm vai trò', 1, NULL, NULL, NULL, 21, 'add_role'),
	(24, 'Sửa vai trò', 'Sửa vai trò', 1, NULL, NULL, NULL, 21, 'update_role'),
	(25, 'Xóa vai trò', 'Xóa vai trò', 1, NULL, NULL, NULL, 21, 'delete_role'),
	(26, 'Thùng rác tin tức', 'Thùng rác tin tức', 1, NULL, NULL, NULL, 1, 'trash_posts'),
	(27, 'Thùng rác tài khoản', 'Thùng rác tài khoản', 1, NULL, NULL, NULL, 11, 'trash_account'),
	(28, 'Thùng rác thể loại', 'Thùng rác thể loại', 1, NULL, NULL, NULL, 6, 'trash_categories'),
	(29, 'Thùng rác bình luận', 'Thùng rác bình luận', 1, NULL, NULL, NULL, 16, 'trash_comment'),
	(30, 'Thùng rác vai trò', 'Thùng rác vai trò', 1, NULL, NULL, NULL, 21, 'trash_role'),
	(31, 'Danh mụchome', 'home', 1, '2022-04-25 09:16:38', NULL, '2022-04-25 09:16:38', 0, ''),
	(32, 'list', 'list_home', 1, '2022-04-25 09:16:39', NULL, '2022-04-25 09:16:39', 31, 'list_home');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table news.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table news.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `posts_category_id` int(10) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `introText` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_posts_posts_category` (`posts_category_id`),
  CONSTRAINT `FK_posts_posts_category` FOREIGN KEY (`posts_category_id`) REFERENCES `posts_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.posts: ~9 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `posts_category_id`, `title`, `user_id`, `introText`, `description`, `images`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(13, 1, 'Nhận định Real Madrid vs Chelsea (02h00 ngày 13/4): Ngược dòng được không', 2, 'Nhận định Real Madrid vs Chelsea (02h00 ngày 13/4): Ngược dòng được không?', '<h2>Canh bạc tất tay của thầy tr&ograve; Thomas Tuchel</h2>\r\n\r\n<p><br />\r\nVới lợi thế được chơi tr&ecirc;n s&acirc;n nh&agrave; trước Real Madrid ở lượt đi tứ kết Champions League 2021/22, Chelsea đ&atilde; chơi tấn c&ocirc;ng ngay sau tiếng c&ograve;i khai cuộc. The Blues dứt điểm 20 lần trong 90 ph&uacute;t thi đấu tr&ecirc;n s&acirc;n Stamford Bridge, 5 số đ&oacute; đi tr&uacute;ng đ&iacute;ch v&agrave; 1 được chuyển h&oacute;a th&agrave;nh b&agrave;n thắng. Kai Havertz l&agrave; cầu thủ ghi b&agrave;n thắng duy nhất cho đội chủ nh&agrave;. Mặc d&ugrave; c&oacute; b&agrave;n thắng v&agrave;o lưới Real Madrid, nhưng Chelsea vẫn phải nhận thất bại 1-3.<br />\r\n&nbsp;</p>\r\n\r\n<p><img alt="Real Madrid vs Chelsea" height="445" src="https://static.bongda24h.vn/medias/standard/2022/4/12/chelsea1.jpg" title="Real Madrid vs Chelsea" width="695" /></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;Chelsea thua 1-3 trước Real Madrid tr&ecirc;n s&acirc;n nh&agrave;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><br />\r\nSự xuất sắc của Karim Benzema c&ugrave;ng những sai lầm nơi h&agrave;ng thủ đội chủ nh&agrave; mang lại lợi thế lớn cho Real Madrid. Ng&ocirc;i sao người Ph&aacute;p dứt điểm 4 lần, 3 tr&uacute;ng đ&iacute;ch v&agrave; tất cả đều được chuyển h&oacute;a th&agrave;nh b&agrave;n thắng. Ch&acirc;n s&uacute;t sinh năm 1987 đ&atilde; trở th&agrave;nh cầu thủ đầu ti&ecirc;n lập hat-trick v&agrave;o lưới Chelsea tại Champions League. Theo thống k&ecirc;, chỉ c&oacute; 4 cầu thủ đ&atilde; ghi hat-trick li&ecirc;n tiếp trong lịch sử Champions League, đ&oacute; l&agrave; Luiz Adriano, Cristiano Ronaldo, Lionel Messi v&agrave; Karim Benzema. Trong đ&oacute; chỉ CR7 v&agrave; Benzema đ&atilde; l&agrave;m được điều đ&oacute; ở v&ograve;ng loại trực tiếp.</p>\r\n\r\n<p><br />\r\nTiền đạo 35 tuổi tiếp tục cho thấy c&aacute;i duy&ecirc;n ghi b&agrave;n trước c&aacute;c đội b&oacute;ng Anh. Benzema đ&atilde; c&oacute; tổng cộng 11 b&agrave;n thắng v&agrave;o lưới c&aacute;c đội b&oacute;ng ở xứ sở sương m&ugrave; tại s&acirc;n chơi Champions League. Sau khi ghi 3 b&agrave;n v&agrave;o lưới PSG ở lượt về v&ograve;ng 1/8, gi&uacute;p Real đi tiếp với tổng tỷ số 3-2 sau hai lượt trận. B&acirc;y giờ Benzema lại c&oacute; th&ecirc;m một c&uacute; hat-trick nữa. 3 pha lập c&ocirc;ng chỉ sau 46 ph&uacute;t v&agrave;o lưới Chelsea cho thấy đẳng cấp của cầu thủ 34 tuổi. Sao trẻ Vinicius Junior cũng chơi ấn tượng, ngo&agrave;i 1 đường kiến tạo cho cầu thủ người Ph&aacute;p, anh c&ograve;n nhiều lần l&agrave;m khổ h&agrave;ng thủ đội chủ nh&agrave; bằng những t&igrave;nh huống đi b&oacute;ng tốc độ v&agrave; kỹ thuật.</p>', 'chelsea3.jpg', '2022-04-05 11:13:57', '2022-04-27 17:13:15', NULL),
	(14, 2, 'Sáng 12/4: Chỉ còn hơn 1.200 ca COVID-19 nặng đang điều trị; Sở Y tế TP HCM đối thoại với người bệnh.', 2, 'SKĐS - Theo thống kê của Bộ Y tế, số bệnh nhân COVID-19 nặng đang điều trị là 1.235 ca; giảm khoảng 70% so với cùng kỳ cao điểm tháng 3. Sở Y tế TP HCM đối thoại với người bệnh; Bố trí cấp cứu và đội phòng dịch tại các điạ điểm thi đấu, lưu trú của vận động viên tham gia SEA Games 31', '<h2>Hơn 8,55 triệu người mắc COVID-19 tại Việt Nam đ&atilde; khỏi</h2>\r\n\r\n<p>Theo thống k&ecirc; của Bộ Y tế, ng&agrave;y 11/4,&nbsp;<a href="https://suckhoedoisong.vn/ngay-11-4-ca-mac-covid-19-moi-giam-con-23184-thanh-hoa-bo-sung-28740-f0-169220411174524379.htm" title="trên Hệ thống Quốc gia quản lý ca bệnh COVID-19 ghi nhận 23.184 ca mắc COVID-19">tr&ecirc;n Hệ thống Quốc gia quản l&yacute; ca bệnh COVID-19 ghi nhận 23.184 ca mắc COVID-19</a>&nbsp;mới, giảm 5.126 ca so với ng&agrave;y trước đ&oacute; tại 61 tỉnh, th&agrave;nh phố (trong đ&oacute; c&oacute; 16.483 ca trong cộng đồng). Con số n&agrave;y tương đương với số mắc mới của khoảng thời gian 2 th&aacute;ng trước đ&acirc;y.</p>\r\n\r\n<p>Cả nước chỉ c&oacute;&nbsp;<a href="https://suckhoedoisong.vn/ngay-11-4-ca-mac-covid-19-moi-giam-con-23184-thanh-hoa-bo-sung-28740-f0-169220411174524379.htm" title="5 tỉnh, thành phố ghi nhận ca mắc mới trên 1.000 ca/ ngày">5 tỉnh, th&agrave;nh phố ghi nhận ca mắc mới tr&ecirc;n 1.000 ca/ ng&agrave;y</a>&nbsp;gồm: H&agrave; Nội (2.011), Nghệ An (1.470), Y&ecirc;n B&aacute;i (1.271), Ph&uacute; Thọ (1.187), Bắc Giang (1.053). Con số n&agrave;y chỉ bằng 1/8-1/9 số địa phương ghi nhận ca mắc 1.000/ ng&agrave;y ở giai đoạn cao điểm 3 tuần đầu th&aacute;ng 3/2022. Thậm ch&iacute; ở giai đoạn cao điểm đ&oacute; c&oacute; ng&agrave;y ri&ecirc;ng H&agrave; Nội đ&atilde; ghi nhận hơn 30.000 F0, cao hơn cả tổng số F0 ghi nhận tr&ecirc;n cả nước hiện nay.</p>\r\n\r\n<p>Trung b&igrave;nh số ca nhiễm mới trong nước ghi nhận trong 7 ng&agrave;y qua giảm c&ograve;n&nbsp;<strong>39.280</strong>&nbsp;ca/ng&agrave;y, trong khi giai đoạn cao điểm đ&atilde; l&ecirc;n đến hơn 150.000 ca/ng&agrave;y.</p>\r\n\r\n<p><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/8/4/bn-covid-19-cach-ly-162809447466098469309.jpeg" target="_blank" title="Hiện thống kê của Bộ Y tế cho thấy số bệnh nhân COVID-19 nặng đang điều trị là 1.235 ca. Số bệnh nhân nặng như vậy đã giảm khoảng 70% so với cùng kỳ cao điểm tháng 3."><img alt="Sáng 12/4: Chỉ còn hơn 1.200 ca COVID-19 nặng đang điều trị; Sở Y tế TP HCM đối thoại với người bệnh - Ảnh 1." height="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/8/4/bn-covid-19-cach-ly-162809447466098469309.jpeg" title="Sáng 12/4: Chỉ còn hơn 1.200 ca COVID-19 nặng đang điều trị; Sở Y tế TP HCM đối thoại với người bệnh - Ảnh 1." width="" /></a></p>\r\n\r\n<p>Hiện thống k&ecirc; của Bộ Y tế cho thấy số bệnh nh&acirc;n COVID-19 nặng đang điều trị l&agrave; 1.235 ca. Số bệnh nh&acirc;n nặng như vậy đ&atilde; giảm khoảng 70% so với c&ugrave;ng kỳ cao điểm th&aacute;ng 3.</p>\r\n\r\n<p>Kể từ đầu dịch đến nay Việt Nam c&oacute;&nbsp;<strong>10.250.160</strong>&nbsp;ca mắc COVID-19, đứng thứ 12/227 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ, trong khi với tỷ lệ số ca nhiễm/1 triệu d&acirc;n, Việt Nam đứng thứ 110/227 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ (b&igrave;nh qu&acirc;n cứ 1 triệu người c&oacute; 103.661 ca nhiễm).</p>\r\n\r\n<p>Ri&ecirc;ng đợt dịch thứ 4 (từ ng&agrave;y 27/4/2021 đến nay): Số ca nhiễm ghi nhận trong nước là&nbsp;<strong>10.242.413</strong>&nbsp;ca,. C&aacute;c địa phương ghi nhận số nhiễm t&iacute;ch lũy cao trong đợt dịch n&agrave;y: H&agrave; Nội (1.524.273), TP. Hồ Ch&iacute; Minh (602.470), Nghệ An (416.641), B&igrave;nh Dương (381.716), Bắc Giang (375.584).</p>\r\n\r\n<p>Đến nay, tổng số người mắc COVID-19 đ&atilde; khỏi bệnh ở nước ta:&nbsp;<strong>8.554.923</strong>&nbsp;ca</p>\r\n\r\n<p>Hiện thống k&ecirc; của Bộ Y tế cho thấy số bệnh nh&acirc;n nặng đang điều trị l&agrave;&nbsp;<strong>1.235</strong>&nbsp;ca. Số bệnh nh&acirc;n nặng như vậy đ&atilde; giảm khoảng 70% so với c&ugrave;ng kỳ cao điểm th&aacute;ng 3.</p>\r\n\r\n<p>Trung b&igrave;nh số tử vong ghi nhận trong 7 ng&agrave;y qua: 27 ca.Tổng số ca tử vong do COVID-19 tại Việt Nam t&iacute;nh đến nay l&agrave;&nbsp;<strong>42.830</strong>&nbsp;ca, chiếm tỷ lệ 0,4% so với tổng số ca nhiễm.</p>\r\n\r\n<p>Tổng số ca tử vong xếp thứ 24/227 v&ugrave;ng l&atilde;nh thổ, số ca tử vong tr&ecirc;n 1 triệu d&acirc;n xếp thứ 130/227 quốc gia, v&ugrave;ng l&atilde;nh thổ tr&ecirc;n thế giới. So với ch&acirc;u &Aacute;, tổng số ca tử vong xếp thứ 6/49 (xếp thứ 3 ASEAN), tử vong tr&ecirc;n 1 triệu d&acirc;n xếp thứ 25/49 quốc gia, v&ugrave;ng l&atilde;nh thổ ch&acirc;u &Aacute; (xếp thứ 4 ASEAN).</p>', 'suckhoe.jpeg', '2022-04-05 11:14:01', '2022-04-12 10:55:48', NULL),
	(15, 1, 'Nguyễn Quang Hải và sứ mệnh của người đi dò đường', 2, 'Với Nguyễn Quang Hải, viễn cảnh ra nước ngoài thi đấu đang ngày một rõ hơn với chàng tiền vệ sinh năm 1997 này. Ở tuổi 25, với tài năng cùng lòng quyết tâm, Hải con thực sự đã sẵn sàng đương đầu với gian nan.', '<h2>Quang Hải đ&atilde; sẵn s&agrave;ng cho những thử th&aacute;ch mới</h2>\r\n\r\n<p>Tiền vệ Nguyễn Quang Hải sẽ tr&ograve;n 25 tuổi v&agrave;o ng&agrave;y 12/4 tới đ&acirc;y. Đ&oacute; cũng l&agrave; l&uacute;c bản hợp đồng thi đấu giữa anh v&agrave; CLB H&agrave; Nội ch&iacute;nh thức hết hiệu lực. Sẽ kh&ocirc;ng c&oacute; một bản hợp đồng gia hạn n&agrave;o được đ&ocirc;i b&ecirc;n k&yacute; kết khi Hải &#39;con&#39; đ&atilde; quyết t&acirc;m xuất ngoại để thực hiện ho&agrave;i b&atilde;o lớn nhất của đời m&igrave;nh.</p>\r\n\r\n<p>Quyết định n&agrave;y c&oacute; thể n&oacute;i l&agrave; một sự dũng cảm của Quang Hải bởi chuyện ra nước ngo&agrave;i thi đấu chưa bao giờ l&agrave; đơn giản với c&aacute;c cầu thủ Việt, m&agrave; những thất bại &#39;nh&atilde;n tiền&#39; của C&ocirc;ng Phượng, Xu&acirc;n Trường, Tuấn Anh v&agrave; gần đ&acirc;y nhất l&agrave; Đo&agrave;n Văn Hậu đ&atilde; chỉ ra nhiều kh&oacute; khăn của c&aacute;c cầu thủ Việt Nam tr&ecirc;n h&agrave;nh tr&igrave;nh xuất ngoại.</p>\r\n\r\n<p>Nhiều năm qua, thể h&igrave;nh, thể lực, tốc độ, sự bền bỉ vẫn l&agrave; những yếu tố khiến c&aacute;c cầu thủ Việt tỏ ra thua thiệt với b&oacute;ng đ&aacute; ch&acirc;u lục. V&agrave; để th&agrave;nh c&ocirc;ng ở bến đỗ mới được đồn đo&aacute;n sẽ l&agrave; ở trời &Acirc;u, Quang Hải chắc chắn sẽ phải cố gắng, nỗ lực rất nhiều.</p>\r\n\r\n<p><img alt="Quang Hải" height="463" src="https://static.bongda24h.vn/medias/original/2022/4/8/quang-hai-10.jpg" title="Quang Hải" width="695" /></p>\r\n\r\n<p><br />\r\nDẫu sao việc được trải nghiệm v&agrave; học hỏi ở một m&ocirc;i trường c&oacute; đẳng cấp cao hơn cũng l&agrave; một cơ hội tốt để Hải &#39;con&#39; kh&aacute;m ph&aacute; ra những năng lực c&ograve;n tiềm ẩn của bản th&acirc;n, điều m&agrave; anh chắc chắn sẽ kh&ocirc;ng thể c&oacute; được nếu gia hạn với H&agrave; Nội FC.D&ugrave; đang l&agrave; một cầu thủ rất t&agrave;i năng, được đ&aacute;nh gi&aacute; l&agrave; thuộc diện của hiếm của b&oacute;ng đ&aacute; Việt Nam nhưng kh&ocirc;ng thể n&oacute;i trước được Hải &#39;con&#39; c&oacute; th&agrave;nh c&ocirc;ng khi xuất ngoại hay kh&ocirc;ng. Nếu t&igrave;m được một CLB c&oacute; lối chơi ph&ugrave; hợp, được c&aacute;c đồng đội mới hỗ trợ, rất c&oacute; thể anh sẽ c&oacute; &#39;đất dụng v&otilde;&#39;. Ngược lại, đ&oacute; sẽ l&agrave; bi kịch với Quang Hải.</p>\r\n\r\n<table border="0" cellpadding="0">\r\n	<tbody>\r\n		<tr>\r\n			<td style="vertical-align:top"><img alt="comment left" src="https://bongda24h.vn/images/s1.png" width="44px" /></td>\r\n			<td style="vertical-align:top"><em>T&ocirc;i chưa thể tiết lộ rằng m&igrave;nh sẽ đi đ&acirc;u nhưng t&ocirc;i mong muốn được thi đấu ở m&ocirc;i trường cao hơn, thử th&aacute;ch bản th&acirc;n m&igrave;nh để t&iacute;ch lũy, trải nghiệm để học hỏi nhiều hơn nữa</em><br />\r\n			<em>Tiền vệ Quang Hải từng t&acirc;m sự</em></td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'nguyen-quang-hai.jpg', '2022-04-05 11:14:02', '2022-04-13 13:25:20', NULL),
	(16, 1, 'Những con số không thể bỏ qua sau trận Man City 2-2 Liverpool', 2, 'Trận đấu Man City vs Liverpool đã kết thúc với tỷ số hòa 2-2, cùng nhìn lại những thống kê ấn tượng sau khi trận đấu này khép lại.', '<p><strong>0 -&nbsp;</strong>Gabriel Jesus v&agrave; Diogo Jota vẫn chưa phải nhận thất bại n&agrave;o khi ghi b&agrave;n trong một trận đấu ở Premier League.&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>1 -</strong>&nbsp;Trận đấu với Liverpool l&agrave; lần đầu ti&ecirc;n Manchester City ghi b&agrave;n trước nhưng kh&ocirc;ng thắng ở Premier League m&ugrave;a n&agrave;y, trước đ&oacute; họ thắng trong cả 22 trận khi l&agrave; đội mở tỷ số.</p>\r\n\r\n<p><strong>1 -&nbsp;</strong>Sadio Mane đ&atilde; ghi b&agrave;n tr&ecirc;n s&acirc;n kh&aacute;ch lần đầu ti&ecirc;n tại Premier League kể từ ng&agrave;y 2 th&aacute;ng 1 trước Chelsea. Trận đấu đ&oacute; kết th&uacute;c với tỷ số 2-2.</p>\r\n\r\n<p><br />\r\n<strong>3 -</strong>&nbsp;Ba trận h&ograve;a gần nhất tr&ecirc;n s&acirc;n kh&aacute;ch của Liverpool tại Premier League: 2-2 trước Tottenham, 2-2 trước Chelsea v&agrave; 2-2 trước Man City.</p>\r\n\r\n<p><br />\r\n<strong>4 &ndash;</strong>&nbsp;Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Kevin de Bruyne c&oacute; chuỗi 4 trận ghi b&agrave;n li&ecirc;n tiếp cho Man City tr&ecirc;n mọi đấu trường.</p>\r\n\r\n<p><br />\r\n<strong>4 -&nbsp;</strong>Thống k&ecirc; cũng chỉ ra rằng, kh&ocirc;ng cầu thủ n&agrave;o ghi nhiều b&agrave;n thắng từ b&ecirc;n ngo&agrave;i v&ograve;ng cấm ở Premier League m&ugrave;a n&agrave;y hơn De Bruyne (4).</p>\r\n\r\n<p><br />\r\n<strong>8 &ndash;</strong>Sadio Mane đ&atilde; ghi 8 b&agrave;n v&agrave;o lưới Man City ở Premier League, bằng với số b&agrave;n thắng v&agrave;o lưới Arsenal, Chelsea v&agrave; Aston Villa, chỉ Crystal Palace l&agrave; anh ghi nhiều b&agrave;n thắng hơn (13).</p>\r\n\r\n<p><br />\r\n<strong>10 &ndash;</strong>&nbsp;Với việc để Man City cầm h&ograve;a 2-2, chuỗi 10 chiến thắng li&ecirc;n tiếp ở Premier League của Liverpool đ&atilde; phải dừng lại, chuỗi 8 chiến thắng li&ecirc;n tiếp tr&ecirc;n s&acirc;n kh&aacute;ch cũng bị chặn đứng.&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>12 &ndash;&nbsp;</strong>C&aacute;c hậu vệ c&oacute; nhiều kiến tạo nhất Premier League m&ugrave;a n&agrave;y: Trent Alexander-Arnold (12), Andy Robertson (10), Joao Cancelo v&agrave; Reece James (đều 6).</p>\r\n\r\n<p><br />\r\n<strong>35 -&nbsp;</strong>Mohamed Salah hiện đ&atilde; tham gia trực tiếp v&agrave;o 35 b&agrave;n thắng sau 47 trận đấu ở Premier League với nh&oacute;m Big Six cho Liverpool: 26 b&agrave;n thắng v&agrave; 9 đường kiến tạo.</p>\r\n\r\n<p><br />\r\n<strong>44 -</strong>&nbsp;Kể từ đầu m&ugrave;a giải 2018-19, Trent Alexander-Arnold đ&atilde; kiến tạo nhiều b&agrave;n thắng ở Premier League hơn bất kỳ cầu thủ n&agrave;o kh&aacute;c (44).&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>50 -</strong>Đ&acirc;y l&agrave; trận đấu thứ 50 tại Premier League giữa hai đội đứng đầu bảng, với đội đầu bảng thắng 20, thua 18 v&agrave; h&ograve;a 12.</p>\r\n\r\n<p><br />\r\n<strong>53 -&nbsp;</strong>Gabriel Jesus hiện đ&atilde; ghi nhiều b&agrave;n thắng ở Premier League (53) hơn Diego Costa (52).</p>\r\n\r\n<p><br />\r\n<strong>71 -&nbsp;</strong>C&uacute; s&uacute;t của Mo Salah ở ph&uacute;t 71 l&agrave; c&uacute; dứt điểm đầu ti&ecirc;n Liverpool đi kh&ocirc;ng tr&uacute;ng đ&iacute;ch, trước đ&oacute; tất cả c&aacute;c c&uacute; đ&aacute; của họ đều v&agrave;o khung th&agrave;nh.&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<p><img alt="Salah ở trận đấu với Man City" height="390" src="https://static.bongda24h.vn/medias/standard/2022/4/11/de-bruyne-man-city-dang-ra-phai-thang-liverpool.jpg" title="Salah ở trận đấu với Man City" width="695" /></p>\r\n\r\n<p><strong>159 &ndash;&nbsp;</strong>Mo Salah hiện tham gia v&agrave;o 159 b&agrave;n của Liverpool ở Premier League (115 b&agrave;n, 44 kiến tạo), trong lịch sử CLB th&agrave;nh t&iacute;ch của anh chỉ xếp sau Steven Gerrard (213, 120 b&agrave;n v&agrave; 93 kiến tạo)</p>', 'ryad-mahrez-bo-lo-co-hoi-giup-man-city-thang-liverpool.jpg', '2022-04-05 11:14:04', NULL, NULL),
	(17, 1, 'Điểm tin bóng đá sáng 12/4: MU chốt thời điểm công bố HLV Erik ten Hag', 2, 'Dưới đây là những tin tức tổng hợp đáng chú ý trong phần điểm tin trên chuyên trang Bongda24h sáng ngày 12/4/2022.', '<p>MU chốt thời điểm c&ocirc;ng bố HLV Erik ten Hag</p>\r\n\r\n<p>Theo Telegraph, BLĐ MU hiện b&agrave;y tỏ sự t&ocirc;n trọng với Ajax, khi CLB n&agrave;y đang đặt mục ti&ecirc;u v&ocirc; địch ở 2 đấu trường l&agrave; Eredivisie v&agrave; C&uacute;p H&agrave; Lan. MU v&igrave; vậy sẽ đợi đến sau trận chung kết C&uacute;p H&agrave; Lan giữa Ajax vs PSV, diễn ra v&agrave;o ng&agrave;y 17/4, để c&ocirc;ng bố chữ k&yacute; của Ten Hag. Dự kiến th&ocirc;ng b&aacute;o sẽ được đưa ra trước khi giải VĐQG H&agrave; Lan kết th&uacute;c, nơi m&agrave; Ajax đang dẫn đầu BXH, hơn đội b&aacute;m đuổi ph&iacute;a sau 4 điểm.</p>', '2.jpg', '2022-04-05 11:14:05', NULL, NULL),
	(20, 2, 'Chỉ cần 30 phút tập thể dục có thể giúp giảm triệu chứng trầm cảm', 2, 'SKĐS - Hai nghiên cứu gần đây của Đại học Bang Iowa (ISU) cho biết, chỉ cần tập thể dục trong 30 phút có thể làm giảm đáng kể các triệu chứng trầm cảm.', '<p dir="ltr">Theo TS Jacob Meyer,&nbsp;Đại học Bang Iowa, lợi &iacute;ch của tập thể dục với sức khỏe th&igrave; ai cũng biết, song vẫn c&ograve;n &iacute;t người biết về lợi &iacute;ch m&agrave; tập thể dục c&oacute; thể mang lại cho những&nbsp;<a href="https://suckhoedoisong.vn/tai-sao-benh-tram-cam-on-dinh-ma-van-phai-uong-thuoc-169171162.htm" target="_blank" title="Tại sao bệnh trầm cảm ổn định mà vẫn phải uống thuốc?">người mắc bệnh trầm cảm</a>.</p>\r\n\r\n<p dir="ltr">Nghi&ecirc;n cứu n&agrave;y sẽ gi&uacute;p hiểu r&otilde; hơn về những t&aacute;c động ngắn hạn của việc tập thể dục v&agrave; c&aacute;ch để c&oacute; thể tận dụng c&aacute;c b&agrave;i tập tốt nhất cho những người mắc bệnh trầm cảm.</p>\r\n\r\n<p><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/9/photo-1649483261253-1649483261734309315161.jpg" target="_blank" title="Trầm cảm là tình trạng rất thường gặp trong cuộc sống"><img alt="photo-1649483261253" height="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/9/photo-1649483261253-1649483261734309315161.jpg" title="photo-1649483261253" width="" /></a></p>\r\n\r\n<p>Trầm cảm l&agrave; t&igrave;nh trạng rất thường gặp trong cuộc sống</p>\r\n\r\n<p dir="ltr">Trong nghi&ecirc;n cứu, c&aacute;c nh&agrave; khoa học đ&atilde; tuyển chọn một nh&oacute;m người trưởng th&agrave;nh đang trải qua c&aacute;c giai đoạn trầm cảm nghi&ecirc;m trọng. Những người tham gia điền v&agrave;o bản khảo s&aacute;t trước v&agrave; sau khi tập thể dục (đạp xe với cường độ vừa phải).</p>\r\n\r\n<p dir="ltr">Dữ liệu khảo s&aacute;t đ&atilde; theo d&otilde;i những thay đổi trong ba đặc điểm của chứng rối loạn trầm cảm ch&iacute;nh: T&acirc;m trạng ch&aacute;n nản, kh&oacute; đạt được kho&aacute;i cảm từ c&aacute;c hoạt động đ&atilde; từng y&ecirc;u th&iacute;ch v&agrave; giảm chức năng nhận thức.</p>\r\n\r\n<p dir="ltr">C&aacute;c ph&aacute;t hiện chỉ ra rằng trong qu&aacute; tr&igrave;nh thử nghiệm đạp xe, t&acirc;m trạng ch&aacute;n nản của những người tham gia được cải thiện trong 30 ph&uacute;t tập thể dục v&agrave; tăng l&ecirc;n đến 75 ph&uacute;t sau đ&oacute;.C&aacute;c nh&agrave; khoa học cũng đ&atilde; xem x&eacute;t việc tập thể dục ảnh hưởng như thế n&agrave;o đến chứng mất trương lực cơ của một người hoặc kh&ocirc;ng c&oacute; khả năng cảm nhận được kho&aacute;i cảm. Sau khoảng 75 ph&uacute;t, lợi &iacute;ch của việc tập thể dục trong việc chống lại chứng anhedonia (t&igrave;nh trạng một người kh&ocirc;ng c&oacute; khả năng cảm nhận được niềm vui hay hạnh ph&uacute;c) bắt đầu giảm, nhưng n&oacute; vẫn được cải thiện so với nh&oacute;m kh&ocirc;ng tập thể dục.</p>\r\n\r\n<p dir="ltr">TS&nbsp;Meyer&nbsp;cho biết, ch&uacute;ng t&ocirc;i kh&ocirc;ng chắc những ảnh hưởng ngắn hạn sẽ k&eacute;o d&agrave;i trong bao l&acirc;u nhưng ph&aacute;t hiện trạng th&aacute;i t&acirc;m trạng ch&aacute;n nản đ&atilde; được cải thiện th&ocirc;ng qua thời gian 75 ph&uacute;t cuối c&ugrave;ng sau khi tập thể dục - v&agrave; c&oacute; thể k&eacute;o d&agrave;i hơn, thật đ&aacute;ng kh&iacute;ch lệ. Điều n&agrave;y cho thấy t&aacute;c dụng của một buổi tập thể dục k&eacute;o d&agrave;i một giờ hoặc hơn v&agrave; họ đ&atilde; t&igrave;m thấy những lợi &iacute;ch tương tự đối với chứng loạn trương lực cơ, mặc d&ugrave; điều n&agrave;y c&oacute; thể kh&ocirc;ng k&eacute;o d&agrave;i l&acirc;u.</p>\r\n\r\n<p dir="ltr">C&aacute;c nh&agrave; khoa học tiếp tục nghi&ecirc;n cứu tr&ecirc;n một nh&oacute;m người, một nửa trong số đ&oacute; tập thể dục độc lập (đạp xe, chạy bộ, đi bộ) trong nửa giờ ở cường độ vừa phải trước khi đăng k&yacute; v&agrave;o một giờ trị liệu h&agrave;nh vi nhận thức ảo (CBT) mỗi tuần. Một nửa duy tr&igrave; c&aacute;c hoạt động thường xuy&ecirc;n của họ trong tuần trước khi trị liệu.</p>\r\n\r\n<p dir="ltr">V&agrave;o cuối chương tr&igrave;nh t&aacute;m tuần, cả hai nh&oacute;m đều cho thấy sự cải thiện, nhưng những người tập thể dục trước CBT cho thấy giảm nhiều hơn c&aacute;c triệu chứng trầm cảm.</p>\r\n\r\n<p dir="ltr">Mặc d&ugrave; trong những trường hợp nghi&ecirc;m trọng hơn, c&oacute; thể cần đến c&aacute;c biện ph&aacute;p mạnh hơn để điều trị t&igrave;nh trạng n&agrave;y. Thuốc c&oacute; thể c&oacute; lợi hơn v&agrave; t&aacute;c dụng nhanh hơn liệu ph&aacute;p điều trị n&agrave;y cho những người c&oacute; c&aacute;c triệu chứng nghi&ecirc;m trọng hơn hoặc tiền sử gia đ&igrave;nh mắc c&aacute;c bệnh t&acirc;m thần đ&aacute;ng kể. C&aacute;c chuy&ecirc;n gia cho biết.</p>', 'photo-1649483263380-16494832645771919276528.jpg', '2022-04-12 10:11:33', NULL, NULL),
	(21, 2, 'Bữa ăn ít carb có lợi cho người tăng huyết áp', 2, 'SKĐS - Tuân theo một chế độ ăn uống ít carbohydrate có thể giúp bạn giảm huyết áp và giúp bảo vệ cơ thể chống lại các bệnh tim mạch.', '<h2 dir="ltr"><strong>1. Chế độ ăn &iacute;t carb v&agrave; tăng huyết &aacute;p</strong></h2>\r\n\r\n<p dir="ltr">Carbohydrate l&agrave; một trong những nguồn&nbsp;cung cấp&nbsp;năng lượng&nbsp;cho cơ thể. Một nghi&ecirc;n&nbsp;cứu&nbsp;cho thấy rằng, một chế độ ăn uống &iacute;t carbohydrate điều chỉnh mức huyết &aacute;p cao một c&aacute;ch đ&aacute;ng kể. Chế độ ăn ki&ecirc;ng&nbsp;<a href="https://suckhoedoisong.vn/lam-sao-de-co-che-do-an-low-carb-lanh-manh-va-hieu-qua-hon-169115033.htm" target="_blank" title="Làm sao để có chế độ ăn Low-carb lành mạnh và hiệu quả hơn?">low carb</a>&nbsp;c&oacute; lượng protein vừa phải v&agrave; lượng&nbsp;<a href="https://suckhoedoisong.vn/minh-oan-cho-chat-beo-va-gia-tri-dinh-duong-cua-6-thuc-pham-giau-chat-beo-lanh-manh-nen-an-169220121230606888.htm" target="_blank" title="\'Minh oan\' cho chất béo và giá trị dinh dưỡng của 6 thực phẩm giàu chất béo lành mạnh nên ăn">chất b&eacute;o l&agrave;nh mạnh</a>&nbsp;cao. Do đ&oacute;, kết hợp c&aacute;c loại carbohydrate ph&ugrave; hợp với lượng khuyến nghị c&oacute; thể gi&uacute;p điều chỉnh huyết &aacute;p.</p>\r\n\r\n<p dir="ltr">Carbohydrate chuyển đổi th&agrave;nh glucose để cơ thể sử dụng nhưng khi cơ thể c&oacute; nhiều hơn y&ecirc;u cầu, ch&uacute;ng sẽ chuyển h&oacute;a th&agrave;nh chất b&eacute;o v&agrave; được lưu trữ trong cơ thể, g&acirc;y ra c&aacute;c biến chứng về tim mạch v&agrave; tăng huyết &aacute;p.</p>\r\n\r\n<h2><strong>2. Thực phẩm &iacute;t carb&nbsp;</strong><strong>n&ecirc;n&nbsp;</strong><strong>bao gồm</strong><strong>&nbsp;trong thực đơn h&agrave;ng ng&agrave;y</strong></h2>\r\n\r\n<h3><em>C&aacute;c loại rau:</em></h3>\r\n\r\n<p dir="ltr">Bất kỳ loại rau n&agrave;o mọc tr&ecirc;n mặt đất đều c&oacute; h&agrave;m lượng carbohydrate thấp hơn so với c&aacute;c loại rau ăn củ. Ngo&agrave;i ra, hầu hết c&aacute;c loại rau đều chứa nhiều kho&aacute;ng chất thiết yếu, vitamin v&agrave; chất chống oxy h&oacute;a. Do đ&oacute;, ch&uacute;ng c&oacute; hiệu quả trong việc chống lại c&aacute;c rối loạn kh&aacute;c nhau, bao gồm&nbsp;tăng&nbsp;huyết &aacute;p. Một số loại rau tốt nhất để ti&ecirc;u thụ l&agrave; c&agrave; chua, ớt chu&ocirc;ng, rau l&aacute; xanh, s&uacute;p lơ,&hellip;</p>\r\n\r\n<p dir="ltr">Kali l&agrave; một nguy&ecirc;n tố thiết yếu c&oacute; trong hầu hết c&aacute;c loại rau. N&oacute; gi&uacute;p gi&atilde;n nở c&aacute;c mạch m&aacute;u để tạo điều kiện cho m&aacute;u lưu th&ocirc;ng&nbsp;hiệu quả. Hơn nữa, rau quả rất gi&agrave;u chất chống oxy h&oacute;a, l&agrave; hợp chất ngăn ngừa tổn thương tế b&agrave;o triệt để. Tổn thương tế b&agrave;o gốc l&agrave;m hỏng mạch m&aacute;u, dẫn đến tăng huyết &aacute;p v&agrave; bệnh tim mạch. V&igrave; vậy, điều cần thiết l&agrave; ti&ecirc;u thụ c&aacute;c loại rau &iacute;t carb để ngăn ngừa tăng huyết &aacute;p.</p>\r\n\r\n<p><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688256444-1649688257302315899541.jpg" target="_blank" title="Các loại rau xanh là thực phẩm ít carb và tốt cho người tăng huyết áp."><img alt="photo-1649688256444" height="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688256444-1649688257302315899541.jpg" title="photo-1649688256444" width="" /></a></p>\r\n\r\n<p>C&aacute;c loại rau xanh l&agrave; thực phẩm &iacute;t carb v&agrave; tốt cho người tăng huyết &aacute;p.</p>\r\n\r\n<h3 dir="ltr"><em>Tr&aacute;i c&acirc;y:</em></h3>\r\n\r\n<p dir="ltr">Kh&ocirc;ng phải tất cả c&aacute;c loại tr&aacute;i c&acirc;y đều chứa &iacute;t carbohydrate. Tuy nhi&ecirc;n, bạn c&oacute; thể đưa&nbsp;c&aacute;c loại tr&aacute;i c&acirc;y&nbsp;v&agrave;o chế độ ăn &iacute;t carb của m&igrave;nh do lợi &iacute;ch dinh dưỡng của ch&uacute;ng. Ngo&agrave;i ra,&nbsp;tr&aacute;i c&acirc;y&nbsp;c&ograve;n chứa c&aacute;c loại đường tự nhi&ecirc;n như fructose v&agrave; glucose, kh&ocirc;ng g&acirc;y hại cho bạn như đường tinh luyện.</p>\r\n\r\n<p dir="ltr">T&aacute;o, tr&aacute;i c&acirc;y họ cam qu&yacute;t, quả mọng, bơ, kiwi,&nbsp;đ&agrave;o,&hellip;&nbsp;c&oacute; &iacute;t carbohydrate hơn. Ch&uacute;ng chứa&nbsp;nhiều&nbsp;c&aacute;c kho&aacute;ng chất cần thiết như kali, mangan, magi&ecirc; v&agrave; chất chống oxy h&oacute;a. Ngo&agrave;i ra, ch&uacute;ng&nbsp;cung cấp lượng lớn chất xơ. Tất cả c&aacute;c thuộc t&iacute;nh n&agrave;y g&oacute;p phần l&agrave;m giảm huyết &aacute;p&nbsp;hiệu quả.</p>\r\n\r\n<p><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688259701-16496882599081675567289.jpg" target="_blank" title="Trái cây giàu dinh dưỡng, phong phú chất xơ góp phần làm giảm huyết áp."><img alt="photo-1649688259701" height="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688259701-16496882599081675567289.jpg" title="photo-1649688259701" width="" /></a></p>\r\n\r\n<p>Tr&aacute;i c&acirc;y gi&agrave;u dinh dưỡng, phong ph&uacute; chất xơ g&oacute;p phần l&agrave;m giảm huyết &aacute;p.</p>\r\n\r\n<h3 dir="ltr"><em>Thịt gia cầm nạc v&agrave; hải sản:</em></h3>\r\n\r\n<p dir="ltr">C&aacute;c sản phẩm gia cầm v&agrave; thịt nạc chứa &iacute;t carbohydrate v&agrave; nhiều protein. C&aacute; b&eacute;o kh&ocirc;ng chỉ c&oacute; &iacute;t carbohydrate m&agrave; c&ograve;n gi&agrave;u axit b&eacute;o omega-3. Ch&uacute;ng l&agrave; chất b&eacute;o l&agrave;nh mạnh chống lại&nbsp;<a href="https://suckhoedoisong.vn/giam-cholesterol-mot-cach-tu-nhien-nho-an-5-loai-thuc-pham-nay-169211227153549278.htm" target="_blank" title="Giảm cholesterol một cách tự nhiên nhờ ăn 5 loại thực phẩm này">cholesterol</a>&nbsp;xấu trong cơ thể bạn. Bạn c&oacute; thể th&ecirc;m c&aacute; hồi, c&aacute; m&ograve;i, t&ocirc;m, c&aacute; thu, c&aacute; ngừ,&hellip;&nbsp;trong chế độ ăn &iacute;t carb của m&igrave;nh.</p>\r\n\r\n<p><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688261375-1649688261515410104335.jpg" target="_blank" title="Người tăng huyết áp nên ăn các loại hải sản và thịt động vật nạc."><img alt="photo-1649688261375" height="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/4/11/photo-1649688261375-1649688261515410104335.jpg" title="photo-1649688261375" width="" /></a></p>\r\n\r\n<p>Người tăng huyết &aacute;p n&ecirc;n ăn c&aacute;c loại hải sản v&agrave; thịt động vật nạc.</p>', 'huyet-ap-cao1-5549-1649688603558979292980.jpg', '2022-04-12 10:16:29', NULL, NULL),
	(22, 2, 'Hy vọng mới từ vaccine Covid-19 dạng xịt', 2, 'MỸ - Các loại vaccine Covid-19 dạng xịt có thể ngăn chặn virus ngay từ khi chúng xâm nhập vào niêm mạc mũi, hiệu quả bảo vệ người dùng trước nguy cơ lây nhiễm.', '<p>Biến chủng Omicron đang lưu h&agrave;nh khắp thế giới c&oacute; đặc t&iacute;nh kh&aacute;c biệt với c&aacute;c phi&ecirc;n bản trước đ&oacute; của nCoV. N&oacute; c&oacute; khả năng l&acirc;y nhiễm nhanh nhất, đặc biệt qua đường h&ocirc; hấp tr&ecirc;n, từ mũi người n&agrave;y sang mũi người kh&aacute;c. Số ca nhiễm tăng vọt kể từ m&ugrave;a đ&ocirc;ng năm nay, ở cả người đ&atilde; ti&ecirc;m chủng.</p>\r\n\r\n<p>Kể từ đ&oacute;, c&aacute;c nh&agrave; khoa học c&acirc;n nhắc lại chiến lược hiệu quả nhất ph&ograve;ng chống biến chủng trong tương lai. Họ hướng tới loại vaccine c&oacute; t&iacute;nh bảo vệ cao hơn, ngăn chặn ho&agrave;n to&agrave;n ca nhiễm ngay từ đầu. Niềm hy vọng của họ đặt v&agrave;o vaccine dạng xịt mũi.</p>\r\n\r\n<p>Vaccine Covid-19 ban đầu kh&aacute; hiệu quả, ngăn ngừa nguy cơ chuyển nặng v&agrave; tử vong. Khi c&aacute;c nước bắt đầu ti&ecirc;m nhắc lại, c&aacute;c chuy&ecirc;n gia nhận định liều tăng cường chỉ đem lại lợi &iacute;ch hạn chế với những người khỏe mạnh. Chuyển đổi vaccine từ dạng ti&ecirc;m sang dạng xịt c&oacute; thể tạo miễn dịch ngay tại nơi virus x&acirc;m nhập, ngăn chặn sự l&acirc;y lan từ đầu.</p>\r\n\r\n<p>Cơ chế miễn dịch học của vaccine dạng xịt kh&aacute; phức tạp, nhưng &yacute; tưởng về n&oacute; đơn giản. Giọt phun sương chứa vaccine v&agrave;o lỗ mũi c&oacute; thể k&iacute;ch th&iacute;ch khả năng miễn dịch &quot;ni&ecirc;m mạc&quot; - th&agrave;nh phần chống virus trong m&ocirc; l&oacute;t đường thở. Khả năng bảo vệ tại chỗ c&oacute; thể ph&ograve;ng ngừa l&acirc;y nhiễm v&agrave; ngăn chặn c&aacute;c biến chủng mới.</p>\r\n\r\n<p>Thực tế, Omicron khiến quan điểm về vaccine thay đổi. Trong hơn một năm đầu ti&ecirc;n triển khai, vaccine cứu sống h&agrave;ng triệu mạng người, ngăn ngừa l&acirc;y nhiễm ngay cả trong bối cảnh biến chủng như Delta, Alpha lưu h&agrave;nh. Omicron trở th&agrave;nh th&aacute;ch thức với cả những quốc gia c&oacute; tỷ lệ ti&ecirc;m chủng cao. Niềm hy vọng của c&aacute;c nh&agrave; khoa học sớm biến th&agrave;nh nỗi lo ngại.</p>\r\n\r\n<p>L&uacute;c n&agrave;y, nhiều chuy&ecirc;n gia nghĩ đến vaccine dạng xịt. Một số người cho rằng c&ograve;n qu&aacute; sớm để mong đợi v&agrave;o tiến tr&igrave;nh ph&aacute;t triển của sản phẩm n&agrave;y. Nhiều người nhận định mục ti&ecirc;u ch&iacute;nh của ti&ecirc;m chủng l&agrave; để bảo vệ người d&acirc;n khỏi chuyển nặng, kh&ocirc;ng phải ngăn ngừa tất cả ca nhiễm nhẹ. Những người ủng hộ vaccine dạng xịt cũng thừa nhận việc quản l&yacute; v&agrave; ph&acirc;n phối c&oacute; thể phức tạp.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, &yacute; tưởng n&agrave;y vẫn đạt được sức h&uacute;t. Akiko Iwasaki, chuy&ecirc;n gia miễn dịch tại Trường Y Đại học Yale, nghi&ecirc;n cứu vaccine dạng xịt để chuẩn bị cho đại dịch tiếp theo. Biến chủng Omicron khiến suy nghĩ của c&ocirc; thay đổi.</p>\r\n\r\n<p>&quot;Nhận thấy biến chủng mới c&oacute; khả năng l&acirc;y truyền nhanh, khiến vaccine kh&ocirc;ng c&ograve;n hiệu quả ngăn ngừa l&acirc;y nhiễm, t&ocirc;i cho rằng m&igrave;nh c&oacute; cơ hội đ&oacute;ng g&oacute;p g&igrave; đ&oacute; cho đại dịch n&agrave;y&quot;, Iwasaki n&oacute;i.</p>\r\n\r\n<p><img alt="Thử nghiệm vaccine Covid-19 dạng xịt tại CyanVac. Ảnh: NY Times" src="https://i1-suckhoe.vnecdn.net/2022/04/11/vaccine-xi-t-mu-i-1649658104-8954-1649658180.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ySYo5QrjxV_14pdhvaXHyA" /></p>\r\n\r\n<p>Thử nghiệm vaccine Covid-19 dạng xịt tại CyanVac. Ảnh:&nbsp;<em>NY Times</em></p>\r\n\r\n<p>Kế hoạch Chuẩn bị Ứng ph&oacute; Covid-19 cấp Quốc gia của Tổng thống Joe Biden, c&ocirc;ng bố v&agrave;o th&aacute;ng 3, nhấn mạnh cần điều chỉnh lại vaccine để ph&ugrave; hợp với c&aacute;c biến chủng trong v&ograve;ng 100 ng&agrave;y kể từ khi ch&uacute;ng xuất hiện.</p>\r\n\r\n<p>Ng&agrave;y c&agrave;ng nhiều nh&agrave; khoa học cho rằng một vaccine ngăn chặn l&acirc;y nhiễm ban đầu cũng cấp thiết như vậy. Chuy&ecirc;n gia tại Viện Y tế Quốc gia cũng như Cơ quan Nghi&ecirc;n cứu v&agrave; Ph&aacute;t triển Ti&ecirc;n tiến Y sinh (BARDA) xem x&eacute;t &quot;vaccine thế hệ tiếp theo&quot;. Trong đ&oacute; c&oacute; loại vaccine k&iacute;ch th&iacute;ch miễn dịch ni&ecirc;m mạc, c&oacute; thể ngăn chặn l&acirc;y truyền.</p>\r\n\r\n<p>Karin Bok, gi&aacute;m đốc Trung t&acirc;m Ph&ograve;ng dịch v&agrave; Ứng ph&oacute; khẩn cấp tại Viện Dị ứng v&agrave; Bệnh truyền nhiễm Quốc gia, cho biết: &quot;Ch&uacute;ng t&ocirc;i c&oacute; thể triển khai Chiến dịch Thần tốc đối với vaccine dạng xịt, nhưng chưa c&oacute; kinh nghiệm để l&agrave;m điều n&agrave;y&quot;.</p>\r\n\r\n<p>D&ugrave; vậy, c&aacute;c h&atilde;ng dược đ&atilde; chủ động thử nghiệm vaccine thế hệ mới. Dan Wagner, 33 tuổi, l&agrave; một trong số những người đăng k&yacute; tham gia thử nghiệm vaccine dạng xịt.</p>\r\n\r\n<p>L&agrave; một người kinh doanh trực tuyến, anh kh&ocirc;ng lo lắng bị l&acirc;y nhiễm Covid-19 trong qu&aacute; tr&igrave;nh l&agrave;m việc. Wagner kh&ocirc;ng c&oacute; bệnh nền, kh&oacute; chuyển nặng nếu nhiễm virus. Khi đ&atilde; đủ điều kiện ti&ecirc;m chủng, anh li&ecirc;n tục nghe tin về những người đ&atilde; ti&ecirc;m vaccine vẫn nhiễm bệnh.</p>\r\n\r\n<p>&quot;T&ocirc;i c&ograve;n trẻ, kh&ocirc;ng c&oacute; tiền sử bệnh l&yacute;, lu&ocirc;n cẩn thận. T&ocirc;i kh&ocirc;ng qu&aacute; e sợ rằng m&igrave;nh sẽ nhiễm virus. V&igrave; vậy, việc ti&ecirc;m một loại vaccine m&agrave; t&ocirc;i biết trước kh&ocirc;ng ngăn ngừa l&acirc;y nhiễm thật v&ocirc; l&yacute;&quot;, anh n&oacute;i.</p>\r\n\r\n<p>Khi biến chủng Omicron l&acirc;y lan, Wagner nghe n&oacute;i đến thử nghiệm vaccine xịt mũi của Trung t&acirc;m Y tế Bệnh viện Nhi Cincinnati. Vaccine c&oacute; thể ngăn chặn l&acirc;y nhiễm virus từ đầu. Anh đ&atilde; đăng k&yacute; thử vaccine đường mũi v&agrave;o cuối th&aacute;ng 1.</p>\r\n\r\n<p>Thay v&igrave; cảm gi&aacute;c kim ch&iacute;ch quen thuộc, anh c&oacute; thể cảm nhận những giọt vaccine chảy từ mũi xuống cổ họng. Wagner cho biết cảm gi&aacute;c c&oacute; vẻ kỳ lạ, nhưng anh kh&ocirc;ng gặp t&aacute;c dụng phụ n&agrave;o.</p>\r\n\r\n<p>Vaccine Wagner đăng k&yacute; thử nghiệm do c&ocirc;ng ty c&ocirc;ng nghệ sinh học CyanVac ở Georgia ph&aacute;t triển, chứa phi&ecirc;n bản virus từng sử dụng để ti&ecirc;m chủng chống bệnh ho cũi, đ&atilde; được bổ sung th&ecirc;m gai protein b&ecirc;n ngo&agrave;i nCoV.</p>\r\n\r\n<p>Theo l&yacute; thuyết, virus ở ch&oacute; sẽ nh&acirc;n l&ecirc;n trong thời gian giới hạn ở mũi người, huấn luyện hệ miễn dịch nhận diện protein gai của Covid-19 v&agrave; ngăn chặn mầm bệnh sau n&agrave;y. Virus sử dụng trong vaccine v&ocirc; hại với con người.</p>\r\n\r\n<p>Sau thử nghiệm, Wagner thường xuy&ecirc;n quay lại cơ sở y tế để lấy mẫu x&eacute;t nghiệm kh&aacute;ng thể chống virus. C&aacute;c nh&agrave; nghi&ecirc;n cứu cũng xem x&eacute;t thời gian virus ở ch&oacute; đ&agrave;o thải khỏi cơ thể.</p>', 'vaccine-xi-t-mu-i-1649658104-8954-1649658180.png', '2022-04-12 10:20:45', NULL, NULL),
	(23, 4, 'Chủ tiệm vàng trốn thuế dù thu hơn 10.000 tỷ đồng, Bộ Tài chính nói gì?', 2, 'Chủ tiệm vàng trốn thuế dù thu hơn 10.000 tỷ đồng, Bộ Tài chính nói gì?', '<p>Chủ tiệm v&agrave;ng trốn thuế d&ugrave; thu hơn 10.000 tỷ đồng, Bộ T&agrave;i ch&iacute;nh n&oacute;i g&igrave;?</p>', 'vaccine-xi-t-mu-i-1649658104-8954-1649658180.png', '2022-04-15 17:01:24', '2022-04-19 15:23:09', NULL),
	(24, 1, 'Ông Putin tin chắc chắn sẽ đạt mục tiêu chiến dịch quân sự tại Ukraine', 2, 'Tổng thống Vladimir Putin tuyên bố Nga chắc chắn sẽ hoàn thành các mục tiêu trong chiến dịch quân sự đặc biệt tại Ukraine.', '<p>&quot;T&ocirc;i muốn nhấn mạnh một lần nữa rằng, tất cả nhiệm vụ của chiến dịch&nbsp;<a href="https://dantri.com.vn/the-gioi/quan-su.htm">qu&acirc;n sự</a>&nbsp;đặc biệt m&agrave; ch&uacute;ng ta đang tiến h&agrave;nh ở Donbass v&agrave; Ukraine, được khởi động từ ng&agrave;y 24/2, chắc chắn sẽ được ho&agrave;n th&agrave;nh&quot;, Tổng thống Putin ph&aacute;t biểu trước Quốc hội Nga h&ocirc;m 27/2.</p>\r\n\r\n<p>&Ocirc;ng Putin cho biết, chiến dịch qu&acirc;n sự của Nga tại Ukraine nhằm &quot;đảm bảo h&ograve;a b&igrave;nh v&agrave; an ninh cho người d&acirc;n ở Cộng h&ograve;a Nh&acirc;n d&acirc;n Donetsk v&agrave; Lugansk, v&ugrave;ng Crimea thuộc Nga v&agrave; to&agrave;n bộ nước Nga&quot;.</p>\r\n\r\n<p>&quot;Ch&uacute;ng ta cần nhận thức r&otilde; r&agrave;ng rằng c&aacute;c binh sĩ v&agrave; sĩ quan của ch&uacute;ng ta đ&atilde; ngăn chặn được một mối nguy hiểm thực sự đang r&igrave;nh rập đất nước của ch&uacute;ng ta. Với l&ograve;ng dũng cảm, sự quyết đo&aacute;n v&agrave; sự anh dũng, họ đ&atilde; ngăn chặn một cuộc xung đột lớn c&oacute; thể xảy ra tr&ecirc;n l&atilde;nh thổ của ch&uacute;ng ta&quot;, &ocirc;ng Putin n&oacute;i th&ecirc;m.</p>\r\n\r\n<p>Trong b&agrave;i ph&aacute;t biểu tại Viễn Đ&ocirc;ng h&ocirc;m 12/4, Tổng thống Putin cho biết&nbsp;chiến dịch qu&acirc;n sự của Nga tại Ukraine &quot;c&oacute; mục ti&ecirc;u ho&agrave;n to&agrave;n cao cả v&agrave; r&otilde; r&agrave;ng&quot;. &Ocirc;ng Putin khẳng định Nga chắc chắn sẽ đạt được c&aacute;c mục ti&ecirc;u n&agrave;y.</p>\r\n\r\n<p>&quot;Mục ti&ecirc;u ch&iacute;nh l&agrave; gi&uacute;p đỡ người d&acirc;n Donbass, nơi ch&uacute;ng t&ocirc;i đ&atilde; c&ocirc;ng nhận nền độc lập. Ch&uacute;ng t&ocirc;i buộc phải l&agrave;m như vậy v&igrave; ch&iacute;nh quyền Kiev, với sự hối th&uacute;c của phương T&acirc;y, đ&atilde; từ chối tu&acirc;n thủ thỏa thuận Minsk nhằm t&igrave;m kiếm một giải ph&aacute;p h&ograve;a b&igrave;nh cho c&aacute;c vấn đề li&ecirc;n quan tới Donbass&quot;, &ocirc;ng Putin n&oacute;i.</p>\r\n\r\n<p>Nga hồi th&aacute;ng 2 đ&atilde; c&ocirc;ng nhận độc lập của Cộng h&ograve;a Nh&acirc;n d&acirc;n Donetsk v&agrave; Lugansk, 2 v&ugrave;ng l&atilde;nh thổ ly khai tại Donbass, Đ&ocirc;ng Ukraine. Động th&aacute;i n&agrave;y của Nga vấp phải sự phản đối mạnh mẽ của ch&iacute;nh quyền Ukraine v&agrave; c&aacute;c nước phương T&acirc;y.</p>', 'jesus-4336337.jpg', '2022-04-28 18:03:16', '2022-05-04 09:18:15', '2022-05-04 09:18:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table news.posts_category
CREATE TABLE IF NOT EXISTS `posts_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.posts_category: ~6 rows (approximately)
/*!40000 ALTER TABLE `posts_category` DISABLE KEYS */;
INSERT INTO `posts_category` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Thể Thao', '2022-04-01 13:57:31', NULL, NULL),
	(2, 'Sức Khỏe', '2022-04-01 13:57:34', NULL, NULL),
	(3, 'Văn Hóa', '2022-04-01 13:57:35', NULL, NULL),
	(4, 'Giải trí', '2022-04-01 13:57:36', NULL, NULL),
	(5, 'Giáo dục', '2022-04-01 13:57:37', NULL, NULL),
	(6, 'Thế giới', '2022-04-04 14:52:17', NULL, NULL),
	(7, 'Tin trong nước ngoài', '2022-04-22 14:51:47', '2022-04-28 18:01:56', NULL),
	(8, 'Tin ca nhạc', '2022-04-28 18:01:33', '2022-05-04 09:18:22', '2022-05-04 09:18:22');
/*!40000 ALTER TABLE `posts_category` ENABLE KEYS */;

-- Dumping structure for table news.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table news.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `status`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(5, 'developer', 'Nhân viên kĩ thuật tòa soạn', 1, '2022-04-20 16:44:11', NULL, '2022-04-20 17:37:35'),
	(6, 'admin', 'Toàn quyền thực hiện chức năng trong quản trị', 1, '2022-04-20 16:48:20', NULL, '2022-04-21 14:13:53'),
	(7, 'Author', 'Tác giả của bài viết', 1, '2022-04-20 16:49:44', NULL, '2022-04-20 16:49:44'),
	(8, 'guest', 'Độc giả của tòa soạn', 1, '2022-04-21 10:30:05', NULL, '2022-04-22 17:38:19');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table news.role_permission
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- Dumping data for table news.role_permission: ~39 rows (approximately)
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(9, 5, 2, NULL, NULL, NULL),
	(10, 5, 3, NULL, NULL, NULL),
	(13, 5, 12, NULL, NULL, NULL),
	(14, 5, 13, NULL, NULL, NULL),
	(15, 5, 14, NULL, NULL, NULL),
	(16, 5, 15, NULL, NULL, NULL),
	(37, 7, 2, NULL, NULL, NULL),
	(38, 7, 3, NULL, NULL, NULL),
	(39, 7, 4, NULL, NULL, NULL),
	(46, 6, 12, NULL, NULL, NULL),
	(48, 6, 14, NULL, NULL, NULL),
	(49, 6, 15, NULL, NULL, NULL),
	(61, 6, 22, NULL, NULL, NULL),
	(63, 6, 24, NULL, NULL, NULL),
	(64, 6, 25, NULL, NULL, NULL),
	(82, 6, 27, NULL, NULL, NULL),
	(84, 6, 13, NULL, NULL, NULL),
	(85, 6, 23, NULL, NULL, NULL),
	(93, 6, 30, NULL, NULL, NULL),
	(94, 5, 32, NULL, NULL, NULL),
	(95, 6, 32, NULL, NULL, NULL),
	(96, 7, 32, NULL, NULL, NULL),
	(97, 6, 17, NULL, NULL, NULL),
	(98, 6, 18, NULL, NULL, NULL),
	(99, 6, 19, NULL, NULL, NULL),
	(100, 6, 20, NULL, NULL, NULL),
	(101, 6, 29, NULL, NULL, NULL),
	(102, 6, 2, NULL, NULL, NULL),
	(103, 6, 3, NULL, NULL, NULL),
	(104, 6, 4, NULL, NULL, NULL),
	(105, 6, 5, NULL, NULL, NULL),
	(107, 6, 7, NULL, NULL, NULL),
	(108, 6, 8, NULL, NULL, NULL),
	(109, 6, 9, NULL, NULL, NULL),
	(110, 6, 10, NULL, NULL, NULL),
	(111, 6, 28, NULL, NULL, NULL),
	(112, 6, 26, NULL, NULL, NULL);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;

-- Dumping structure for table news.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table news.users: ~6 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `fullname`, `email`, `avatar`, `email_verified_at`, `password`, `level`, `created_at`, `updated_at`, `deleted_at`, `token`) VALUES
	(2, 'thinhdq', 'Đặng Quang Thịnh', 'admin@omt.com.vn', '', NULL, '$2y$10$pQFT7wyHZAHlVId6ux1RtOJnyZaaT4NB1a7W4AMqM5ZGxci2Ru5A6', 1, NULL, '2022-04-22 17:24:11', NULL, NULL),
	(3, 'haunt', 'Nguyễn Thị Hậu', 'haunt@omt.com.vn', '', NULL, '$2y$10$YzH2N95j/k/w..N6oN7QZuDUWj0cEuMUP3NzsULwloR7hUO.YqCH.', 1, NULL, '2022-04-22 17:24:05', NULL, NULL),
	(4, 'quangthinhomt', 'Đặng Quang Thịnh', 'quangthinh13@gmail.com', NULL, NULL, '$2y$10$xwal5mcgA74/gqjiuxNMd.xAoS3wQIEVSfNlYUKcCMrIDjg165ovu', 2, '2022-04-13 11:38:13', '2022-05-03 16:39:11', NULL, 'JWQO6ZEP0J'),
	(5, 'nqduy', 'Nguyễn Quang Duy', 'duynq@gmail.com', NULL, NULL, '$2y$10$KpfZL21xEzZJgk0zdeOZjO3D/o7TN/vDbUTPQ.dHY51OP9WGKRUxS', 2, '2022-04-18 11:12:59', '2022-05-05 17:50:21', NULL, 'UG1XS0W9IX'),
	(14, 'trieunt', 'nguyen thanh trieu', 'trieunt@gmail.com', NULL, NULL, '$2y$10$bSRmOwSM58eETfa2yPx89.uOCU65Bm6cpdCsuinNghRu5hIB.Zrti', 1, '2022-04-21 10:24:37', '2022-05-04 09:18:30', '2022-05-04 09:18:30', NULL),
	(15, 'tiendeptrai', 'Nguyễn Xuân Tiến', 'tiendeptrai@gmail.com', NULL, NULL, '$2y$10$hXcssWC7POm/T7rmnJEJNOW7vF8qRMzZD3O5TY6TwQ6/wVqd4mxeS', 2, '2022-04-25 10:00:59', '2022-04-29 09:20:55', NULL, 'YSMMC2ZFZR');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table news.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table news.user_role: ~13 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `status`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(7, 10, 1, 1, '2022-04-20 09:39:49', NULL, '2022-04-20 09:39:49'),
	(8, 10, 2, 1, '2022-04-20 09:39:49', NULL, '2022-04-20 09:39:49'),
	(9, 11, 1, 1, NULL, NULL, NULL),
	(10, 11, 3, 1, NULL, NULL, NULL),
	(14, 13, 6, 1, NULL, NULL, NULL),
	(18, 4, 8, 1, NULL, NULL, NULL),
	(19, 5, 8, 1, NULL, NULL, NULL),
	(22, 2, 6, 1, NULL, NULL, NULL),
	(23, 12, 6, 1, NULL, NULL, NULL),
	(24, 3, 8, 1, NULL, NULL, NULL),
	(25, 15, 8, 1, NULL, NULL, NULL),
	(26, 14, 5, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
