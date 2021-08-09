-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 09:35 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigns`
--

CREATE TABLE `assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `timeslot` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigns`
--

INSERT INTO `assigns` (`id`, `ticket_id`, `user_id`, `description`, `status`, `timeslot`, `created_at`, `updated_at`) VALUES
(24, 32, 18, NULL, 4, '7', '2021-08-08 03:58:49', '2021-08-08 04:02:22'),
(25, 33, 18, NULL, 1, '8', '2021-08-08 04:03:18', '2021-08-08 04:03:18'),
(26, 35, 18, NULL, 1, '7', '2021-08-08 04:03:26', '2021-08-08 04:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Technical'),
(2, 'Tutoring');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(26, '2016_06_01_000004_create_oauth_clients_table', 1),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2021_06_16_152306_create_tickets_table', 1),
(30, '2021_06_19_114922_create_assigns_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0a640f0571c73020b763b872e0efad2f3914809fb7f7dd34bba5762244c1e7304f4897111ac930b3', 17, 1, 'MyApp', '[]', 0, '2021-07-23 11:27:04', '2021-07-23 11:27:04', '2022-07-23 16:57:04'),
('0ca1d4896c38fab121b7d606bc5fcf462b841b285eb18eed6e669c1fafb14847a162760db201e1ad', 16, 1, 'MyApp', '[]', 0, '2021-07-20 09:53:26', '2021-07-20 09:53:26', '2022-07-20 15:23:26'),
('0d9e46174a28984110502f40e4f824b23408071be7e8e1bae18db2014d2fa6f7011fc78220dfd16f', 21, 1, 'MyApp', '[]', 0, '2021-07-29 23:21:26', '2021-07-29 23:21:26', '2022-07-30 04:51:26'),
('0ed069e91cbf5498bf31068143c90047a5aefb373081f6c431aa607969e94653457b01757a4f356f', 7, 1, 'MyApp', '[]', 0, '2021-07-14 03:50:32', '2021-07-14 03:50:32', '2022-07-14 09:20:32'),
('1149011ea6d2ce69fa8cf7771804dfdd259a69ff2e619ee8a76bc3b997240eea2972d05ea546a775', 3, 1, 'MyApp', '[]', 0, '2021-07-14 03:39:47', '2021-07-14 03:39:47', '2022-07-14 09:09:47'),
('1350e52c33b7af4e3634d64a4a8fb303dc100e8e0c6dfe5e495bf518f31c31267336339ecfc81a50', 19, 1, 'MyApp', '[]', 0, '2021-08-08 03:58:42', '2021-08-08 03:58:42', '2022-08-08 09:28:42'),
('13cffce9f11f9690a7220c6ffbcf625ae3eb81159faed37eab2963b24eae678d1a882291447a1f86', 19, 1, 'MyApp', '[]', 0, '2021-08-07 04:24:16', '2021-08-07 04:24:16', '2022-08-07 09:54:16'),
('1896f23b6e6ecc7ddb92a14b86e62afc582089d24a6b651b8a66df8fa2669acac20a36a44eddf9d9', 18, 1, 'MyApp', '[]', 0, '2021-07-23 12:12:29', '2021-07-23 12:12:29', '2022-07-23 17:42:29'),
('18a8523e68afc6824b147d5757aa0b04c1335ed18a2ad0545e5a53e060bb2a5b8f189b41f2063298', 15, 1, 'MyApp', '[]', 0, '2021-07-20 09:42:06', '2021-07-20 09:42:06', '2022-07-20 15:12:06'),
('1c59d9f308020be97b7a3cd26c0e5b775a93c05e57e83d9762e6eca42832738968a5c52442c59b97', 19, 1, 'MyApp', '[]', 0, '2021-08-07 04:21:02', '2021-08-07 04:21:02', '2022-08-07 09:51:02'),
('1e435fe82e89d1a35d3ddaa6ef12cc3abc3cdfa6c8187c41078ee22d0ecd01aa88c453b0c15e4ebb', 20, 1, 'MyApp', '[]', 0, '2021-07-30 00:46:20', '2021-07-30 00:46:20', '2022-07-30 06:16:20'),
('22027bead8d789f747bd318efea5df954bbe2f4d8ba6db47c6276c97519604a3df161f2730becad5', 19, 1, 'MyApp', '[]', 0, '2021-07-23 12:28:34', '2021-07-23 12:28:34', '2022-07-23 17:58:34'),
('276b0e278e3f67560179cdf5b8c8977d9ae28ef07b72ee89362fe3e2d94aba9aaef7d31e2d6f3dd9', 19, 1, 'MyApp', '[]', 0, '2021-07-23 13:04:12', '2021-07-23 13:04:12', '2022-07-23 18:34:12'),
('29f6d02a242cf318e022b182803b7f78d03701ff661c9f0a250e3a9b7f1616759b36c73c31a358d3', 5, 1, 'MyApp', '[]', 0, '2021-06-20 06:59:32', '2021-06-20 06:59:32', '2022-06-20 12:29:32'),
('2a31014f54b600e442d3a93571f11effa00fc7359e9be65c09721b55ca723b7d3d7e14a359f06f84', 1, 1, 'MyApp', '[]', 0, '2021-07-10 09:21:49', '2021-07-10 09:21:49', '2022-07-10 14:51:49'),
('2d94c08be3a41918a1a226f908f26fc05ac027d542e54c4271e2bcdd1470bdcf17b617b755cbe528', 9, 1, 'MyApp', '[]', 0, '2021-07-20 09:38:41', '2021-07-20 09:38:41', '2022-07-20 15:08:41'),
('305d5f25a3afa1ccf4789246489b4d0bdfed17924e8075561f1a873c2bb2b60dbbbf02978a37faff', 17, 1, 'MyApp', '[]', 0, '2021-08-08 04:02:38', '2021-08-08 04:02:38', '2022-08-08 09:32:38'),
('35995f11848e18e966c1658c6d246cb21e1750652b053cbd2486f71f2aa24d4aea7f52b8e247d457', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:49:48', '2021-08-08 03:49:48', '2022-08-08 09:19:48'),
('3c9c65758251da168f3ab4b8a232f771ac73ef3e2df71e4a1e075185859db40393566e0860f7d533', 13, 1, 'MyApp', '[]', 0, '2021-07-20 09:40:06', '2021-07-20 09:40:06', '2022-07-20 15:10:06'),
('40c33dee8594e144b2ef8ef24a245a2d39de11156983f2ed7f01c77ea1fb7a237176a7c7d0bea03c', 19, 1, 'MyApp', '[]', 0, '2021-07-23 12:53:20', '2021-07-23 12:53:20', '2022-07-23 18:23:20'),
('4400e4f4e0e5e2e8fbfde7f2d1b4d8b4f98b70e5a776716e6b2d9a39c50db539ffad82cbb4d0b388', 18, 1, 'MyApp', '[]', 0, '2021-07-23 12:06:15', '2021-07-23 12:06:15', '2022-07-23 17:36:15'),
('44c969ff895545c38231b261ed8ba4c6817bebab04bf5d460cb7b3fab8ce68b83165afdf27ed4e25', 20, 1, 'MyApp', '[]', 0, '2021-08-08 03:39:57', '2021-08-08 03:39:57', '2022-08-08 09:09:57'),
('45ff6dc842800d6718b40405ade8e9b15021d35d5bd1dee26d7442166030cd3c3e9eff23332a702e', 19, 1, 'MyApp', '[]', 0, '2021-08-07 04:49:13', '2021-08-07 04:49:13', '2022-08-07 10:19:13'),
('473acd1d9a737111cf50bf09ee9e273a501d30c2ba91e17fadb291415074fb69c8c2d39daeb149da', 18, 1, 'MyApp', '[]', 0, '2021-08-07 04:23:48', '2021-08-07 04:23:48', '2022-08-07 09:53:48'),
('4a92102aae5c0ab503a86d268464a3a0b2080a1620f46cd645dddf1ad1fb0e4bf4aed3a2494d6cbd', 8, 1, 'MyApp', '[]', 0, '2021-07-20 09:37:51', '2021-07-20 09:37:51', '2022-07-20 15:07:51'),
('59d537a9d026dd72565c02a96f611d5884a6a2049c0c4752b8b1cadebefff1cc31cd0d3ed8d6fe47', 18, 1, 'MyApp', '[]', 0, '2021-08-08 03:42:39', '2021-08-08 03:42:39', '2022-08-08 09:12:39'),
('5de57179394ccaadba7ffb1011a0e528bf6bba0da3baa391f28facf593127738961d85e6ac0ad570', 21, 1, 'MyApp', '[]', 0, '2021-07-30 08:07:32', '2021-07-30 08:07:32', '2022-07-30 13:37:32'),
('64fe3e6faf5b4003175e15afc92ff4cf18e45f7803a258255ce1e3614f63b8b6db868c0f29758d52', 3, 1, 'MyApp', '[]', 0, '2021-06-19 21:47:08', '2021-06-19 21:47:08', '2022-06-20 03:17:08'),
('6739bfb4d88609e8d75e469131857d364baa980e0988cf3563edb0264a6b37c459ac2c2f78f28792', 21, 1, 'MyApp', '[]', 0, '2021-08-08 03:47:18', '2021-08-08 03:47:18', '2022-08-08 09:17:18'),
('68693cefe0feeede53b3c470a388eddfc72c4b8b9ce2213fb639a256316f740eb1b6efef8d1b0a4b', 17, 1, 'MyApp', '[]', 0, '2021-07-23 11:23:04', '2021-07-23 11:23:04', '2022-07-23 16:53:04'),
('68d2162795dabc70cad97ef577438616d61e84ae52e8269858a60f060c8bf5d680dcfb8410479916', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:50:40', '2021-08-08 03:50:40', '2022-08-08 09:20:40'),
('6918f8df1b78461c434ebd29ba2b8ae2df357f15c8d14b9efee4420277d506c712e974527b3efef8', 17, 1, 'MyApp', '[]', 0, '2021-07-30 07:53:12', '2021-07-30 07:53:12', '2022-07-30 13:23:12'),
('6b2a14eb35842ac9c44d62c3e5bee57a6552ae552b2af6fca1b9fc51f156f09e3678e6ce2914d8aa', 3, 1, 'MyApp', '[]', 0, '2021-06-19 21:48:02', '2021-06-19 21:48:02', '2022-06-20 03:18:02'),
('7721b9c4da5a218af026821204674e4941278c3c9cb886265745985f542b8c731f3bf167cc39caf7', 17, 1, 'MyApp', '[]', 0, '2021-07-23 12:22:49', '2021-07-23 12:22:49', '2022-07-23 17:52:49'),
('7cc678f580f0e1c18b495edf2e1f80d93a9774ca611a126058522a6f583277b90b77cae94bb7f037', 19, 1, 'MyApp', '[]', 0, '2021-07-23 12:07:23', '2021-07-23 12:07:23', '2022-07-23 17:37:23'),
('7d79891d7927b44324d4b93c2554437a631c73d64f86e61562bf5030d0c84bfa02f1ee265af175a9', 18, 1, 'MyApp', '[]', 0, '2021-08-08 03:59:13', '2021-08-08 03:59:13', '2022-08-08 09:29:13'),
('7edb6b77a18a87fc9e6dd7c2a3e13055f28da286577db1454ce58b972af1b3eaab41a534aee08f91', 18, 1, 'MyApp', '[]', 0, '2021-07-30 00:48:19', '2021-07-30 00:48:19', '2022-07-30 06:18:19'),
('85470eac600cc4eebd96c3c5bf94dd6fdb2bf7d1d12f72f350ab77f1efeafab1ebec853ff14f4d19', 17, 1, 'MyApp', '[]', 0, '2021-08-07 03:43:47', '2021-08-07 03:43:47', '2022-08-07 09:13:47'),
('879775ddd4d29cef5459f6d6ad8b7a33140ace22cdad2e15c238a16ffd707b1c5d03280ff3b8e27e', 14, 1, 'MyApp', '[]', 0, '2021-07-20 09:40:26', '2021-07-20 09:40:26', '2022-07-20 15:10:26'),
('895d3ab20e533a6af14f9eeb38f3a013b74915dd0bf572ab1ba6a7234ea8cef351313d3f5ea31951', 18, 1, 'MyApp', '[]', 0, '2021-07-25 00:35:56', '2021-07-25 00:35:56', '2022-07-25 06:05:56'),
('8c48e6b5043162fd500c6c7d88f2615f0cc55c67ceb9b84047c9a335623e0210b101f4f0e2c6e58d', 21, 1, 'MyApp', '[]', 0, '2021-07-30 00:49:20', '2021-07-30 00:49:20', '2022-07-30 06:19:20'),
('8f150d4e913340524e497292023c132ae0634047bf204e2fe1895a22a7846bb3e87b2d4a89d6566a', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:38:20', '2021-08-08 03:38:20', '2022-08-08 09:08:20'),
('8f93a39b65ce2dca4ecc5fbf69db88e1ef8019bacb47d960bd72007acb8a77830d269275518da00d', 6, 1, 'MyApp', '[]', 0, '2021-07-14 03:49:09', '2021-07-14 03:49:09', '2022-07-14 09:19:09'),
('937a06cd345618b0aeb0c22f77fe0c54c9fa0a411497f9ee1ba9e29eaa3dd720c29ba7fba63795f8', 18, 1, 'MyApp', '[]', 0, '2021-07-23 12:52:16', '2021-07-23 12:52:16', '2022-07-23 18:22:16'),
('93c8bedd7d2a4b9e1812422a9d5d18d255d0e8e883ca022102149b80023d27c6e35fc0872bc38364', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:40:59', '2021-08-08 03:40:59', '2022-08-08 09:10:59'),
('94bbfedbb96d6493b44b26faf1dab036a89706c31fc02dfcc6f8402f5b33fe35e7926b6aa7b549d4', 17, 1, 'MyApp', '[]', 0, '2021-07-23 11:22:49', '2021-07-23 11:22:49', '2022-07-23 16:52:49'),
('994d5068c90fe0cf4cc3e595694a3b6dcf4b3f8278c9300218a9da04383a9631d75aac9197603f54', 19, 1, 'MyApp', '[]', 0, '2021-08-08 04:03:14', '2021-08-08 04:03:14', '2022-08-08 09:33:14'),
('9cc0dadd971fc12edb0c2598435fb37676711b951c7cbfe1f6de4cdeb372c7dbfa29f6dc969515e6', 22, 1, 'MyApp', '[]', 0, '2021-08-07 03:46:53', '2021-08-07 03:46:53', '2022-08-07 09:16:53'),
('9e94e4423a209bd169f328f5fc515334170905649a16a950b2a59c004238aef4c512eb47fba652c5', 18, 1, 'MyApp', '[]', 0, '2021-07-25 00:34:36', '2021-07-25 00:34:36', '2022-07-25 06:04:36'),
('a21d799ba2403f86623b372c46a3ed17f4b39105857e632b400a5257d518b6f2bfcfc5eae662b532', 21, 1, 'MyApp', '[]', 0, '2021-08-07 03:35:56', '2021-08-07 03:35:56', '2022-08-07 09:05:56'),
('a65cbd58cd83f848c7814b4394b3097913a42af1dfea9690205418cc7ee63810af148642c8bc42ce', 18, 1, 'MyApp', '[]', 0, '2021-07-23 12:05:55', '2021-07-23 12:05:55', '2022-07-23 17:35:55'),
('a6f5c7b3a4e50d0e8a2911910d38973bdafa3012d948b81533508147620ee117b7463b7180635870', 2, 1, 'MyApp', '[]', 0, '2021-06-19 21:46:47', '2021-06-19 21:46:47', '2022-06-20 03:16:47'),
('aad7c02a9dc1921efc1913da8d352a1dfe0c81ad2d6476d6ab3f48b94612a4bf26bfdd6494c6e184', 21, 1, 'MyApp', '[]', 0, '2021-07-25 00:37:39', '2021-07-25 00:37:39', '2022-07-25 06:07:39'),
('ad5e36a2da8309592105081322d32a50956c7d4943fd2a56d2a26503c3be42b29e4d255bb364176f', 18, 1, 'MyApp', '[]', 0, '2021-08-08 03:54:58', '2021-08-08 03:54:58', '2022-08-08 09:24:58'),
('b7a5219e494158619fb9777181bbaff7f34cb3df13bb5c99b4fbe700656ee531a6d8cddca0d52d42', 21, 1, 'MyApp', '[]', 0, '2021-08-08 04:04:53', '2021-08-08 04:04:53', '2022-08-08 09:34:53'),
('c506dd542b60703d6603a634e7a930864e53fc1299e6433828653f61f9b4f5dd5da9bd6889a76ea6', 21, 1, 'MyApp', '[]', 0, '2021-08-07 03:47:39', '2021-08-07 03:47:39', '2022-08-07 09:17:39'),
('c8c490655a77e40c9d71d86f2a574ebbd870b2084de77d70607033b38bca12ab535e68f242110aa7', 21, 1, 'MyApp', '[]', 0, '2021-08-08 03:43:10', '2021-08-08 03:43:10', '2022-08-08 09:13:10'),
('ca28c998d1ba0d51c5d453186b824f182acc39c38839b117470d7f92c8a541489d149c7c8037c82e', 20, 1, 'MyApp', '[]', 0, '2021-08-07 03:35:06', '2021-08-07 03:35:06', '2022-08-07 09:05:06'),
('d2932bf9205a582f42658d9775b641b3c2f4af31fa7ca953eb66b68f474cb934ca4d91f15cf3921c', 16, 1, 'MyApp', '[]', 0, '2021-07-20 09:52:01', '2021-07-20 09:52:01', '2022-07-20 15:22:01'),
('dd6dcc1717d0ca0a536a19fd3e227ab295e21111591108696fc536735485f53238ac08a144bb9a72', 21, 1, 'MyApp', '[]', 0, '2021-08-07 04:55:49', '2021-08-07 04:55:49', '2022-08-07 10:25:49'),
('e2c096cb30fdc7ddcbd5139790b00acfdccf6f9a1f3a1a812c8a2de174029b333146a1da7d0eb0ad', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:49:27', '2021-08-08 03:49:27', '2022-08-08 09:19:27'),
('e3ee542a305c8b77a8b3c73336ecc597841877a534edbb49ebe5189e145fb6fb8891f5fee98c270a', 11, 1, 'MyApp', '[]', 0, '2021-07-20 09:39:31', '2021-07-20 09:39:31', '2022-07-20 15:09:31'),
('e49318d2d9ef831eb327064f77bed3502de9d73537aa88468876af77a38ee36b4171c70899943704', 18, 1, 'MyApp', '[]', 0, '2021-08-07 04:26:23', '2021-08-07 04:26:23', '2022-08-07 09:56:23'),
('e78acebe5d6b01cfd2ff338c577b842d9afe5a21852ca688b2bf4e390c4a36fd00f22772c5331728', 1, 1, 'MyApp', '[]', 0, '2021-06-19 21:45:54', '2021-06-19 21:45:54', '2022-06-20 03:15:54'),
('e83133b3af257fc4fe21636c21df9ff52318ee700df15cb48763acb074e5f5b72b2c06f454d6fb6b', 1, 1, 'MyApp', '[]', 0, '2021-07-10 09:24:16', '2021-07-10 09:24:16', '2022-07-10 14:54:16'),
('e972aba8b0e3daa046dfef11a82a82da1bf8d4967fcf997cc506017baf170e7f75f22a31e91f0471', 18, 1, 'MyApp', '[]', 0, '2021-08-08 03:46:07', '2021-08-08 03:46:07', '2022-08-08 09:16:07'),
('e9cf3d94eea69dbeacc283b0a62bbe012a7cabcfce22b3a7117e11ffe7ba374592f5ac049958a0bd', 18, 1, 'MyApp', '[]', 0, '2021-08-08 03:58:18', '2021-08-08 03:58:18', '2022-08-08 09:28:18'),
('ead84ecd054fc8da368b77cbbe92e67f003716399513d799bbac5e26a66a8d7326b5b63c90d16e6c', 22, 1, 'MyApp', '[]', 0, '2021-08-07 03:46:43', '2021-08-07 03:46:43', '2022-08-07 09:16:43'),
('eeec78d37aae55a94bd40dd98c91974c842044a05924901fb29a5415d28cd10ea1bbdc05ad4b33af', 17, 1, 'MyApp', '[]', 0, '2021-08-08 03:56:02', '2021-08-08 03:56:02', '2022-08-08 09:26:02'),
('ef6bb1103b91a95b5465edafaa56677e068124d015f627d35058d8ec3a68ee29e749f4a721e3f33b', 18, 1, 'MyApp', '[]', 0, '2021-08-08 04:03:41', '2021-08-08 04:03:41', '2022-08-08 09:33:41'),
('efe7c4b178165a6d80de319266c50dfed13bc3da764deaccd4f3ef2d0631169ba5e8f32cc6a41377', 3, 1, 'MyApp', '[]', 0, '2021-07-15 10:35:32', '2021-07-15 10:35:32', '2022-07-15 16:05:32'),
('f2869122d92480678013cb7bb4a99e64768a3ccf086708381075782272ff44695ac5c2bcacd59b9a', 17, 1, 'MyApp', '[]', 0, '2021-07-30 05:50:42', '2021-07-30 05:50:42', '2022-07-30 11:20:42'),
('f31eda2e7a4f71692be2a4035fadc676dbf6790ca3cf457ad3b7f0d2b7f283ac55a08dddd68206e4', 17, 1, 'MyApp', '[]', 0, '2021-07-23 12:43:32', '2021-07-23 12:43:32', '2022-07-23 18:13:32'),
('fb64f8173d64d2131e6922fbaa174d0a0a8910102cf8110609b87e0f0351fe964badbd7c2da76b93', 21, 1, 'MyApp', '[]', 0, '2021-08-07 03:27:50', '2021-08-07 03:27:50', '2022-08-07 08:57:50'),
('fc57e7afddaf3c4be6e9143e9b23bdfe7cde75711da4de15e4b7c421f68469006dbd1678dd03fc30', 17, 1, 'MyApp', '[]', 0, '2021-08-07 04:07:21', '2021-08-07 04:07:21', '2022-08-07 09:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'y31hdg37X4hVvsJzYtiuSJNBhCpxrL3PLsXd5P0I', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 21:38:37', '2021-06-19 21:38:37'),
(2, NULL, 'Laravel Password Grant Client', '52aRvO29D3bRLA6UJU3RmlsfNhi4fXKrs2Pbfrla', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 21:38:37', '2021-06-19 21:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 21:38:37', '2021-06-19 21:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `title`) VALUES
(1, 'created'),
(2, 'pending'),
(3, 'inprogress'),
(4, 'closed');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeslot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_assigned` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_id`, `users_id`, `name`, `course`, `issue_category`, `issue_title`, `issue_description`, `date`, `timeslot`, `is_assigned`, `is_cancel`, `created_at`, `updated_at`) VALUES
(32, 'TKT285901', 17, 'Rogger', 'ds', '1', 'ds', 'ds', '2021-08-08', '7', 1, 0, '2021-08-08 03:56:23', '2021-08-08 03:58:49'),
(33, 'TKT960317', 17, 'Rooger', 'cg', '1', 'cg', 'cg', '2021-08-08', '8', 1, 0, '2021-08-08 03:57:28', '2021-08-08 04:03:18'),
(34, 'TKT012753', 17, 'Rogger', 'qe', '1', 'qe', 'qe', '2021-08-08', '5', 0, 0, '2021-08-08 03:57:51', '2021-08-08 03:57:51'),
(35, 'TKT154790', 17, 'Rogger', 'as', '1', 'as', 'as', '2021-08-08', '7,8', 1, 0, '2021-08-08 04:02:57', '2021-08-08 04:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `timeslots`
--

CREATE TABLE `timeslots` (
  `id` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeslots`
--

INSERT INTO `timeslots` (`id`, `time`, `available`, `created_at`, `updated_at`) VALUES
(3, '10:00', 1, NULL, NULL),
(4, '10:05', 1, NULL, NULL),
(5, '10:10', 1, NULL, NULL),
(6, '10:15', 1, NULL, NULL),
(7, '10:20', 1, NULL, NULL),
(8, '10:25', 1, NULL, NULL),
(9, '10:30', 1, NULL, NULL),
(10, '10:35', 1, NULL, NULL),
(11, '10:40', 1, NULL, NULL),
(12, '10:45', 1, NULL, NULL),
(13, '10:50', 1, NULL, NULL),
(14, '10:55', 1, NULL, NULL),
(15, '11:00', 1, NULL, NULL),
(16, '11:05', 1, NULL, NULL),
(17, '11:10', 1, NULL, NULL),
(18, '11:15', 1, NULL, NULL),
(19, '11:20', 1, NULL, NULL),
(20, '11:25', 1, NULL, NULL),
(21, '11:30', 1, NULL, NULL),
(22, '11:35', 1, NULL, NULL),
(23, '11:40', 1, NULL, NULL),
(24, '11:45', 1, NULL, NULL),
(25, '11:50', 1, NULL, NULL),
(26, '11:55', 1, NULL, NULL),
(27, '12:00', 1, NULL, NULL),
(28, '12:05', 1, NULL, NULL),
(29, '12:10', 1, NULL, NULL),
(30, '12:15', 1, NULL, NULL),
(31, '12:20', 1, NULL, NULL),
(32, '12:25', 1, NULL, NULL),
(33, '12:30', 1, NULL, NULL),
(34, '12:35', 1, NULL, NULL),
(35, '12:40', 1, NULL, NULL),
(36, '12:45', 1, NULL, NULL),
(37, '12:50', 1, NULL, NULL),
(38, '12:55', 1, NULL, NULL),
(39, '01:00', 1, NULL, NULL),
(40, '01:05', 1, NULL, NULL),
(41, '01:10', 1, NULL, NULL),
(42, '01:15', 1, NULL, NULL),
(43, '01:20', 1, NULL, NULL),
(44, '01:25', 1, NULL, NULL),
(45, '01:30', 1, NULL, NULL),
(46, '01:35', 1, NULL, NULL),
(47, '01:40', 1, NULL, NULL),
(48, '01:45', 1, NULL, NULL),
(49, '01:50', 1, NULL, NULL),
(50, '01:55', 1, NULL, NULL),
(51, '02:00', 1, NULL, NULL),
(52, '02:05', 1, NULL, NULL),
(53, '02:10', 1, NULL, NULL),
(54, '02:15', 1, NULL, NULL),
(55, '02:20', 1, NULL, NULL),
(56, '02:25', 1, NULL, NULL),
(57, '02:30', 1, NULL, NULL),
(58, '02:35', 1, NULL, NULL),
(59, '02:40', 1, NULL, NULL),
(60, '02:45', 1, NULL, NULL),
(61, '02:50', 1, NULL, NULL),
(62, '02:55', 1, NULL, NULL),
(63, '03:00', 1, NULL, NULL),
(64, '03:05', 1, NULL, NULL),
(65, '03:10', 1, NULL, NULL),
(66, '03:15', 1, NULL, NULL),
(67, '03:20', 1, NULL, NULL),
(68, '03:25', 1, NULL, NULL),
(69, '03:30', 1, NULL, NULL),
(70, '03:35', 1, NULL, NULL),
(71, '03:40', 1, NULL, NULL),
(72, '03:45', 1, NULL, NULL),
(73, '03:50', 1, NULL, NULL),
(74, '03:55', 1, NULL, NULL),
(75, '04:00', 1, NULL, NULL),
(76, '04:05', 1, NULL, NULL),
(77, '04:10', 1, NULL, NULL),
(78, '04:15', 1, NULL, NULL),
(79, '04:20', 1, NULL, NULL),
(80, '04:25', 1, NULL, NULL),
(81, '04:30', 1, NULL, NULL),
(82, '04:35', 1, NULL, NULL),
(83, '04:40', 1, NULL, NULL),
(84, '04:45', 1, NULL, NULL),
(85, '04:50', 1, NULL, NULL),
(86, '04:55', 1, NULL, NULL),
(87, '05:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `slug`) VALUES
(17, 'Test Student', 'r_britto@fanshaweonline.ca', NULL, '$2y$10$z.QlpdMo0IBji8pG6ERUauADx6PoYJlf0UI0uIGxG3MW3ZvLwG72K', 'student', NULL, '2021-07-23 11:22:49', '2021-08-08 04:05:21', 'glrjen8ad612fkp'),
(18, 'Test Lab Member', 'd_shah116519@fanshaweonline.ca', NULL, '$2y$10$bjgUOr0BXJu3hmVWjZYnbuEBX4M/5SsACeLtqJfZyDAzKSaKRIfee', 'labmember', NULL, '2021-07-23 12:05:55', '2021-08-08 03:45:38', 'asopyucigt1r4nd'),
(19, 'Test Lab Leader', 's_talwar@fanshaweonline.ca', NULL, '$2y$10$bjgUOr0BXJu3hmVWjZYnbuEBX4M/5SsACeLtqJfZyDAzKSaKRIfee', 'lableader', NULL, '2021-07-23 12:05:55', '2021-07-23 12:05:55', 'asopyucigt1r4nd'),
(21, 'admin', 'd_patel116497@fanshaweonline.ca', NULL, '$2y$10$z.QlpdMo0IBji8pG6ERUauADx6PoYJlf0UI0uIGxG3MW3ZvLwG72K', 'admin', NULL, '2021-07-23 11:22:49', '2021-07-23 11:22:49', 'glrjen8ad612fkp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigns`
--
ALTER TABLE `assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigns_ticket_id_foreign` (`ticket_id`),
  ADD KEY `assigns_user_id_foreign` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_users_id_foreign` (`users_id`);

--
-- Indexes for table `timeslots`
--
ALTER TABLE `timeslots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigns`
--
ALTER TABLE `assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `timeslots`
--
ALTER TABLE `timeslots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigns`
--
ALTER TABLE `assigns`
  ADD CONSTRAINT `assigns_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
