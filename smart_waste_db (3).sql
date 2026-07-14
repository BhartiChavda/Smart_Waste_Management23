-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2026 at 09:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_waste_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 3, 'add_permission'),
(6, 'Can change permission', 3, 'change_permission'),
(7, 'Can delete permission', 3, 'delete_permission'),
(8, 'Can view permission', 3, 'view_permission'),
(9, 'Can add group', 2, 'add_group'),
(10, 'Can change group', 2, 'change_group'),
(11, 'Can delete group', 2, 'delete_group'),
(12, 'Can view group', 2, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add complaint', 7, 'add_complaint'),
(26, 'Can change complaint', 7, 'change_complaint'),
(27, 'Can delete complaint', 7, 'delete_complaint'),
(28, 'Can view complaint', 7, 'view_complaint'),
(29, 'Can add user profile', 8, 'add_userprofile'),
(30, 'Can change user profile', 8, 'change_userprofile'),
(31, 'Can delete user profile', 8, 'delete_userprofile'),
(32, 'Can view user profile', 8, 'view_userprofile'),
(33, 'Can add notification', 9, 'add_notification'),
(34, 'Can change notification', 9, 'change_notification'),
(35, 'Can delete notification', 9, 'delete_notification'),
(36, 'Can view notification', 9, 'view_notification'),
(37, 'Can add staff profile', 10, 'add_staffprofile'),
(38, 'Can change staff profile', 10, 'change_staffprofile'),
(39, 'Can delete staff profile', 10, 'delete_staffprofile'),
(40, 'Can view staff profile', 10, 'view_staffprofile'),
(41, 'Can add dataset item', 11, 'add_datasetitem'),
(42, 'Can change dataset item', 11, 'change_datasetitem'),
(43, 'Can delete dataset item', 11, 'delete_datasetitem'),
(44, 'Can view dataset item', 11, 'view_datasetitem'),
(45, 'Can add custom category', 12, 'add_customcategory'),
(46, 'Can change custom category', 12, 'change_customcategory'),
(47, 'Can delete custom category', 12, 'delete_customcategory'),
(48, 'Can view custom category', 12, 'view_customcategory');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1200000$rHjOg5VxJW2TUcDlU505oo$2r7O574a9UarCpMOexxC8cAyd92Yxe78mrWIT4SJauQ=', '2026-06-30 14:29:54.791483', 0, 'b', '', '', 'b@gmail.com', 0, 1, '2026-06-30 14:29:35.906877'),
(2, 'pbkdf2_sha256$1200000$NBqTj92JBXEeUu2hfpGHvu$msASXtt8d9GhP/N0hr6hgTHP7Th5KRmIkpCRhpVOgaY=', '2026-07-13 10:02:52.947590', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2026-06-30 14:35:54.641760'),
(3, 'pbkdf2_sha256$1200000$t4WJDFpl6ZHKfc1q7QoMLC$yuTl9spRnBNjGU32/b9UO1LDvTcb/ZZxfn72EJr/Eog=', NULL, 0, 'astaff', '', '', 'admin@gmail.com', 1, 1, '2026-07-01 15:36:26.662928'),
(5, 'pbkdf2_sha256$1200000$r6JyJbS7nqF9ahPnuUF9XD$++FA4Qb4Lnb4i99BYwiJkbVLHdHU/UzCLdP+WYD395A=', NULL, 0, 'user', '', '', 'bhuribharu@gmail.com', 0, 1, '2026-07-03 09:09:25.555818'),
(6, 'pbkdf2_sha256$720000$5Qjv7dXZxQ1Xz1dYdh3CnW$cNsno1tjZNGg51FEaHLwfgqda4mFq+ZpGlQFmag5FkQ=', NULL, 0, 'r', '', '', 'bhuribharu@gmail.com', 0, 0, '2026-07-03 09:14:21.457656'),
(8, 'pbkdf2_sha256$720000$D5qijvjvRl0NspgfdxqOvV$qVHoLHNzNC9zDAAh7bNUvJ8CchSeH+mz2+PMt/uODrk=', '2026-07-03 09:44:13.237289', 0, 'd', '', '', 'bhuribharu@gmail.com', 0, 0, '2026-07-03 09:25:11.342088'),
(9, 'pbkdf2_sha256$1200000$Z7zNpCLJilKHxsUQgGd78T$X0UERsIG7LPPykDIMzMPgkQx+apSPYLROUlXO3FjCn4=', '2026-07-14 04:37:26.110001', 1, 'bharti', '', '', 'bhuribharu@gmail.com', 1, 1, '2026-07-13 06:04:57.104394'),
(10, 'pbkdf2_sha256$1200000$Tl6pndWXuOqvO9lDGRjAU2$J97z0Z5NbSu7PnuQ0b8iQvFCwZrcLwHudlkTXJaeQaw=', '2026-07-13 09:24:24.748423', 0, 'bstaff', '', '', 'bharubhuri@gmail.com', 1, 1, '2026-07-13 06:34:43.832139'),
(11, 'pbkdf2_sha256$1200000$GASZe1QZdYgjcSGd4IBo09$X21ZiOMt2wumUW1MX4uyF9YJakRj4TSfBaNOJXm/wVw=', '2026-07-14 04:09:29.498356', 0, 'shiv', '', '', 'bhartichavda2554@gmail.com', 0, 1, '2026-07-13 09:11:22.389264'),
(12, 'pbkdf2_sha256$1200000$nGoTlZbnv6U3dSvimn47gq$bWLCOFvmv/EoF2i/EOQ9sD6k5Mu0ny8dKlV9m9n6nHc=', '2026-07-14 05:39:29.044570', 1, 'bhartichavda', '', '', 'bhuribharu@gmail.com', 1, 1, '2026-07-14 05:39:00.322040');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, '', 'admin', 'logentry'),
(2, '', 'auth', 'group'),
(3, '', 'auth', 'permission'),
(4, '', 'auth', 'user'),
(5, '', 'contenttypes', 'contenttype'),
(6, '', 'sessions', 'session'),
(7, '', 'smart_waste_management_app', 'complaint'),
(8, '', 'smart_waste_management_app', 'userprofile'),
(9, '', 'smart_waste_management_app', 'notification'),
(10, '', 'smart_waste_management_app', 'staffprofile'),
(11, '', 'smart_waste_management_app', 'datasetitem'),
(12, '', 'smart_waste_management_app', 'customcategory');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-06-30 14:27:23.413564'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-06-30 14:27:23.447895'),
(3, 'auth', '0001_initial', '2026-06-30 14:27:29.834295'),
(4, 'admin', '0001_initial', '2026-06-30 14:27:30.000774'),
(5, 'admin', '0002_logentry_remove_auto_add', '2026-06-30 14:27:30.013063'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2026-06-30 14:27:30.024199'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-06-30 14:27:30.134383'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-06-30 14:27:30.158615'),
(9, 'auth', '0004_alter_user_username_opts', '2026-06-30 14:27:30.166504'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-06-30 14:27:30.228012'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-06-30 14:27:30.231805'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-06-30 14:27:30.243380'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-06-30 14:27:30.261933'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-06-30 14:27:30.278843'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-06-30 14:27:30.298007'),
(16, 'auth', '0011_update_proxy_permissions', '2026-06-30 14:27:30.307805'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-06-30 14:27:30.323721'),
(18, 'sessions', '0001_initial', '2026-06-30 14:27:30.366903'),
(19, 'smart_waste_management_app', '0001_initial', '2026-06-30 14:27:30.613882'),
(20, 'smart_waste_management_app', '0002_alter_complaint_status', '2026-07-01 14:39:52.692406'),
(21, 'smart_waste_management_app', '0003_complaint_after_image_complaint_assigned_to_and_more', '2026-07-01 15:40:25.989317'),
(22, 'smart_waste_management_app', '0004_userprofile_profile_photo', '2026-07-13 05:30:12.281642'),
(23, 'smart_waste_management_app', '0005_datasetitem', '2026-07-13 09:53:47.640792'),
(24, 'smart_waste_management_app', '0006_customcategory_alter_datasetitem_label', '2026-07-13 10:32:50.480168'),
(25, 'smart_waste_management_app', '0007_alter_complaint_category', '2026-07-13 14:13:00.165960'),
(26, 'smart_waste_management_app', '0008_alter_complaint_category', '2026-07-13 14:21:35.151658'),
(27, 'smart_waste_management_app', '0009_alter_complaint_category', '2026-07-13 14:23:38.676682'),
(28, 'smart_waste_management_app', '0010_alter_datasetitem_image', '2026-07-14 05:09:43.042834');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g5tlqtu7kjvyynboydsiypcmc5gtcpis', '.eJxVjEEOwiAQRe_C2pCxVBhcuvcMZJgBqRpISrsy3l2bdKHb_977LxVoXUpYe5rDJOqsBnX43SLxI9UNyJ3qrWludZmnqDdF77Tra5P0vOzu30GhXr41OSbJPkrmwTgHzhvIVsgM7BHReD6yxWx4lESII4zW28QZAYBOwOr9AfxUOBM:1wfaRj:-I9tM79J8B2qolXIIidWgle1JPpUb2r5XFdg5efHwyw', '2026-07-17 09:44:31.843231'),
('jtzy31v903afiof87xqqvua2txtpx3u9', '.eJxVjUtvgzAQhP9K5XOEwGBeN_NQhERKBEg9WusHhTbBFZhIVZT_XqPm0F5WszPfzt4Rg82MbFvVwiaJUuRhdPhrchCfat4T-QHzu3aEns0ycWdHnGe6Oict1SV7sv8KRljHvTcgXCZCDjJSKgFIZOKFUSxDCZyAGw4DEOEGOEwCToSvuIpcAFeEgkcS-2BLYWLX_Y1tE9tq9JWZBaZZSfatL_oWO19mp4SZbuqXZEJvs1lRekdZ1RTlsaUFzeoSpQTjA8ppW2SNHSj1E7uXdZn3bfNa5S9vtOsthklwQMeadh1Kg_3kVPa0ttqz_pmey9bqwLfaMn2V2y3Gj8cPvntqvw:1wjXFK:20rcwrQHKeot0BqMycdMFFE_cmSzNd-jGWqZ8mLDbIs', '2026-07-28 07:08:02.346702'),
('qypn4zr4aiop5iow05imk29epo8g7t48', '.eJxVjUsOwiAURffC2JBSfq1D566BPMrDoi00hZoY496lSQc6u7mfc9_EwFZGs2VcTXDkTFpy-vUsDA-Me-DuEG-JDimWNVi6V-iRZnpNDqfL0f0DjJDHuuYeUQgOgqm274AxYFxxxUCBUF5JphFQN06zqhtrZQ9Keu6kt7KzGisUgpn3m0obtlzSbMoKIaIzrzSlZ0eXQj5fBTRFVg:1wjDVU:Dw1TQ3HUuSuc5EW10VQGQytuK2EQ3YtatSRjeSI7NNs', '2026-07-27 10:03:24.642217'),
('z8jijtv3jkjdil93tbwo1696mo1csaof', '.eJxVjDsOwjAQBe_iGlla_01Jzxms9XqNA8iR4qRC3B0ipYD2zcx7iYTb2tI2eElTEWehxOl3y0gP7jsod-y3WdLc12XKclfkQYe8zoWfl8P9O2g42re2JhTlnQcODrgAYw7BG6pFW4ikrIlgQFvtiazT1juI4CtRNRExZ_H-AMK-N1Y:1wi3FV:YZqU9cNTN4NQ4u_KAbCRHMzOdRQG3sWfvapKzJOU84k', '2026-07-24 04:54:05.270802');

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_complaint`
--

CREATE TABLE `smart_waste_management_app_complaint` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `dustbin_level` varchar(10) DEFAULT NULL,
  `priority` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `is_duplicate` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `after_image` varchar(100) DEFAULT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `before_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_waste_management_app_complaint`
--

INSERT INTO `smart_waste_management_app_complaint` (`id`, `image`, `latitude`, `longitude`, `category`, `dustbin_level`, `priority`, `status`, `is_duplicate`, `created_at`, `description`, `user_id`, `after_image`, `assigned_to_id`, `before_image`) VALUES
(1, 'complaints/Screenshot_2026-04-26_165747.png', 22.13042569238575, 70.19661847470215, 'PAPER', 'Empty', 'Low', 'Rejected', 0, '2026-06-30 15:01:54.269498', 'blaaa blaaa blaaa', 2, '', NULL, ''),
(3, 'complaints/dd273f53ecee63f43ca89360e89bedda.jpg', 22.3251, 73.2017, 'PLASTIC', 'Medium', 'High', 'Resolved', 0, '2026-07-02 09:09:11.857148', '', 2, '', NULL, ''),
(4, 'complaints/0d0ac79579b3066b9be9002881392f63.jpg', 22.634276715674527, 70.5707331563817, 'METAL', 'Medium', 'High', 'Resolved', 0, '2026-07-02 12:37:31.865462', 'electronic waste', 2, '', NULL, ''),
(5, 'complaints/d5dcadf736ce27156a694eb7a4793f2b.jpg', 22.408372697404072, 70.81470520084962, 'METAL', 'Medium', 'High', 'Resolved', 1, '2026-07-03 07:19:24.502199', '.........................................................................../', 2, '', NULL, ''),
(6, 'complaints/0d0ac79579b3066b9be9002881392f63_lL0LpRS.jpg', 22.290217, 70.774605, 'ELECTRONIC WASTE', 'Empty', 'Low', 'Resolved', 0, '2026-07-03 07:20:44.076963', 'asdfghjklpoiuytrewqsdcvbnmlkjhgf', 2, '', NULL, ''),
(7, 'complaints/8603e9ef5bd53644d8f16743f941512f.jpg', 22.290338, 70.774883, 'PLASTIC', 'Medium', 'Medium', 'Resolved', 0, '2026-07-03 07:31:43.374559', 'qweryoplkjnbvcxzzasdfghjm', 2, '', NULL, ''),
(8, 'complaints/6abe5a873da49ab8e1dc470ce4fd3cfc.jpg', 22.290137169822845, 70.77471610934637, 'BIODEGRADABLE', 'Medium', 'High', 'Resolved', 0, '2026-07-03 07:38:52.407954', 'poiuytredfghjkl;lkjhgfdasdfghjlmnbvcx12345678', 2, '', NULL, ''),
(9, 'complaints/fcdba436a98dd5da98b0890c0ef5a232.jpg', 22.290108370917658, 70.77473822021989, 'BIODEGRADABLE', 'Full', 'Critical', 'Resolved', 0, '2026-07-10 04:55:11.957223', 'asdfghjk', 2, '', NULL, ''),
(10, 'complaints/fcdba436a98dd5da98b0890c0ef5a232_6W7GMT1.jpg', 22.290108370917658, 70.77473822021989, 'BIODEGRADABLE', 'Empty', 'Low', 'Resolved', 1, '2026-07-10 04:55:16.357131', 'asdfghjk', 2, '', NULL, ''),
(11, 'complaints/8603e9ef5bd53644d8f16743f941512f_tqqSWnR.jpg', 22.29012230562347, 70.77470643863082, 'PLASTIC', 'Full', 'High', 'Pending', 1, '2026-07-13 04:25:57.251792', 'asdfghbqwerv          asdferg asdf', 2, '', NULL, ''),
(12, 'complaints/6abe5a873da49ab8e1dc470ce4fd3cfc_fhBmfvr.jpg', 22.284725023137295, 70.7753820274279, 'BIODEGRADABLE', 'Full', 'High', 'In Process', 0, '2026-07-13 05:47:05.685108', 'asdfgh qwertyuio lkjhgfds zxcvb', 2, '', NULL, ''),
(13, 'complaints/d5dcadf736ce27156a694eb7a4793f2b_GeF7rAa.jpg', 22.29063602957848, 70.77388150706757, 'METAL', 'Medium', 'High', 'Resolved', 1, '2026-07-13 06:36:26.826789', 'qwertyu sdfn cvb fghb bhuuuuuuuuuuuy dfghhb vbgyg', 9, '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_customcategory`
--

CREATE TABLE `smart_waste_management_app_customcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_datasetitem`
--

CREATE TABLE `smart_waste_management_app_datasetitem` (
  `id` bigint(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `label` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_waste_management_app_datasetitem`
--

INSERT INTO `smart_waste_management_app_datasetitem` (`id`, `image`, `label`, `created_at`) VALUES
(4641, 'training_dataset/user_test_08b41e7fda14039e269ea0bf82dadfbb.jpg', 'METAL', '2026-07-14 07:08:16.476286'),
(4642, 'training_dataset/user_test_WhatsApp_Image_2026-07-12_at_2.57.41_PM.jpeg', 'PAPER', '2026-07-14 07:08:16.516093'),
(4643, 'training_dataset/user_test_f242b557e9209a06e1d5e292ee3fc4f2.jpg', 'BIODEGRADABLE', '2026-07-14 07:09:20.408152'),
(4644, 'training_dataset/user_test_ceda6fd499cd8739ee372d387d171c23.jpg', 'METAL', '2026-07-14 07:09:20.419221'),
(4645, 'training_dataset/user_test_a325b6f0e6f0fddcec54d0c2726f209e.jpg', 'GLASS', '2026-07-14 07:09:20.430620'),
(4646, 'training_dataset/user_test_761c3d49b9d9f411898e10ff8bba5e4b.jpg', 'BIODEGRADABLE', '2026-07-14 07:09:20.441183'),
(4647, 'training_dataset/user_test_10ac98eada789be66c0e9dd4e7eb4a55.jpg', 'METAL', '2026-07-14 07:09:20.451567'),
(4648, 'training_dataset/user_test_8603e9ef5bd53644d8f16743f941512f.jpg', 'GLASS', '2026-07-14 07:09:20.465584'),
(4649, 'training_dataset/user_test_0d0ac79579b3066b9be9002881392f63.jpg', 'ELECTRONIC WASTE', '2026-07-14 07:09:20.474903'),
(4650, 'training_dataset/user_test_d5dcadf736ce27156a694eb7a4793f2b.jpg', 'METAL', '2026-07-14 07:09:20.482406'),
(4651, 'training_dataset/user_test_4e912bad7dc1f46a1fa3434342b4c4c4.jpg', 'CARDBOARD', '2026-07-14 07:09:20.488580'),
(4652, 'training_dataset/user_test_b3000499bd51d859dae3c0279729824c.jpg', 'PAPER', '2026-07-14 07:09:20.495081'),
(4653, 'training_dataset/user_test_k_LCE.jpg.jpeg', 'PAPER', '2026-07-14 07:09:20.510393'),
(4654, 'training_dataset/user_test_b69fd6a0b8f6c46a9cd8e55da787e1fd.jpg', 'PAPER', '2026-07-14 07:09:20.523241'),
(4655, 'training_dataset/user_test_6abe5a873da49ab8e1dc470ce4fd3cfc.jpg', 'ELECTRONIC WASTE', '2026-07-14 07:09:20.533569'),
(4656, 'training_dataset/user_test_dd273f53ecee63f43ca89360e89bedda.jpg', 'ELECTRONIC WASTE', '2026-07-14 07:09:20.544143'),
(4657, 'training_dataset/user_test_dcef3cd425f965fac7c7da12a74dfef6.jpg', 'CARDBOARD', '2026-07-14 07:09:20.554227'),
(4658, 'training_dataset/user_test_13ec056c35722d30703ae6e98cec8e00.jpg', 'METAL', '2026-07-14 07:09:20.565643'),
(4659, 'training_dataset/user_test_2f460c05fd8818f935b226d7d44f12f8.jpg', 'ELECTRONIC WASTE', '2026-07-14 07:09:20.574621'),
(4660, 'training_dataset/user_test_bottal.jpg', 'PLASTIC', '2026-07-14 07:09:20.585018'),
(4661, 'training_dataset/user_test_0b1a5af81239844c1b6e7cfcbb65d606.jpg', 'PLASTIC', '2026-07-14 07:09:20.594855');

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_notification`
--

CREATE TABLE `smart_waste_management_app_notification` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_waste_management_app_notification`
--

INSERT INTO `smart_waste_management_app_notification` (`id`, `title`, `message`, `is_read`, `created_at`, `user_id`) VALUES
(1, 'New Complaint Filed', 'A new complaint (ID: 5) for Metal waste has been reported by admin. Priority: High.', 0, '2026-07-03 07:19:24.527751', 3),
(2, 'New Complaint Filed', 'A new complaint (ID: 6) for Electronic Waste waste has been reported by admin. Priority: Low.', 0, '2026-07-03 07:20:44.080404', 3),
(3, 'Test', 'Test', 0, '2026-07-03 07:29:44.959783', 2),
(4, 'Test', 'Test', 0, '2026-07-03 07:29:44.994189', 3),
(5, 'New Complaint Filed', 'A new complaint (ID: 7) for Plastic waste has been reported by admin. Priority: Medium.', 1, '2026-07-03 07:31:43.418808', 2),
(6, 'New Complaint Filed', 'A new complaint (ID: 7) for Plastic waste has been reported by admin. Priority: Medium.', 0, '2026-07-03 07:31:43.422851', 3),
(7, 'New Complaint Filed', 'A new complaint (ID: 8) for Organic waste has been reported by admin. Priority: High.', 1, '2026-07-03 07:38:52.439347', 2),
(8, 'New Complaint Filed', 'A new complaint (ID: 8) for Organic waste has been reported by admin. Priority: High.', 0, '2026-07-03 07:38:52.442982', 3),
(9, 'New Complaint Filed', 'A new complaint (ID: 9) for Organic waste has been reported by admin. Priority: Critical.', 0, '2026-07-10 04:55:12.197878', 2),
(10, 'New Complaint Filed', 'A new complaint (ID: 9) for Organic waste has been reported by admin. Priority: Critical.', 0, '2026-07-10 04:55:12.197928', 3),
(11, 'New Complaint Filed', 'A new complaint (ID: 10) for Organic waste has been reported by admin. Priority: Low.', 1, '2026-07-10 04:55:16.617308', 2),
(12, 'New Complaint Filed', 'A new complaint (ID: 10) for Organic waste has been reported by admin. Priority: Low.', 0, '2026-07-10 04:55:16.617350', 3),
(13, 'New Complaint Filed', 'A new complaint (ID: 11) for Plastic waste has been reported by admin. Priority: High.', 0, '2026-07-13 04:25:57.576794', 2),
(14, 'New Complaint Filed', 'A new complaint (ID: 11) for Plastic waste has been reported by admin. Priority: High.', 0, '2026-07-13 04:25:57.576846', 3),
(15, 'New Complaint Filed', 'A new complaint (ID: 12) for Organic waste has been reported by admin. Priority: High.', 0, '2026-07-13 05:47:05.830087', 2),
(16, 'New Complaint Filed', 'A new complaint (ID: 12) for Organic waste has been reported by admin. Priority: High.', 0, '2026-07-13 05:47:05.830108', 3),
(17, 'New Complaint Filed', 'A new complaint (ID: 13) for Metal waste has been reported by bharti. Priority: High.', 0, '2026-07-13 06:36:26.944930', 2),
(18, 'New Complaint Filed', 'A new complaint (ID: 13) for Metal waste has been reported by bharti. Priority: High.', 0, '2026-07-13 06:36:26.944952', 3),
(19, 'New Complaint Filed', 'A new complaint (ID: 13) for Metal waste has been reported by bharti. Priority: High.', 0, '2026-07-13 06:36:26.944961', 9),
(20, 'New Complaint Filed', 'A new complaint (ID: 13) for Metal waste has been reported by bharti. Priority: High.', 1, '2026-07-13 06:36:26.944967', 10);

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_staffprofile`
--

CREATE TABLE `smart_waste_management_app_staffprofile` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `assigned_area` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_waste_management_app_staffprofile`
--

INSERT INTO `smart_waste_management_app_staffprofile` (`id`, `employee_id`, `phone`, `assigned_area`, `designation`, `profile_photo`, `user_id`) VALUES
(1, 'EMP4391', NULL, NULL, NULL, '', 2),
(2, 'EMP7744', NULL, NULL, NULL, '', 9),
(3, 'EMP2039', NULL, NULL, NULL, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `smart_waste_management_app_userprofile`
--

CREATE TABLE `smart_waste_management_app_userprofile` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `profile_photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smart_waste_management_app_userprofile`
--

INSERT INTO `smart_waste_management_app_userprofile` (`id`, `phone`, `address`, `user_id`, `profile_photo`) VALUES
(1, NULL, NULL, 1, NULL),
(2, '1234567890', 'rajkot', 2, 'citizen_profiles/girland_dog.avif'),
(4, NULL, NULL, 5, NULL),
(5, NULL, NULL, 6, NULL),
(7, NULL, NULL, 8, NULL),
(8, '1234567890', 'surat', 11, 'citizen_profiles/architecture-ancient-monument-world-heritage-day-celebration_23-2151297185.avif'),
(9, NULL, NULL, 9, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `smart_waste_management_app_complaint`
--
ALTER TABLE `smart_waste_management_app_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smart_waste_manageme_user_id_de061c14_fk_auth_user` (`user_id`),
  ADD KEY `smart_waste_manageme_assigned_to_id_02fc3dfa_fk_auth_user` (`assigned_to_id`);

--
-- Indexes for table `smart_waste_management_app_customcategory`
--
ALTER TABLE `smart_waste_management_app_customcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `smart_waste_management_app_datasetitem`
--
ALTER TABLE `smart_waste_management_app_datasetitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smart_waste_management_app_notification`
--
ALTER TABLE `smart_waste_management_app_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smart_waste_manageme_user_id_80307a1d_fk_auth_user` (`user_id`);

--
-- Indexes for table `smart_waste_management_app_staffprofile`
--
ALTER TABLE `smart_waste_management_app_staffprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `smart_waste_management_app_userprofile`
--
ALTER TABLE `smart_waste_management_app_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_complaint`
--
ALTER TABLE `smart_waste_management_app_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_customcategory`
--
ALTER TABLE `smart_waste_management_app_customcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_datasetitem`
--
ALTER TABLE `smart_waste_management_app_datasetitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4662;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_notification`
--
ALTER TABLE `smart_waste_management_app_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_staffprofile`
--
ALTER TABLE `smart_waste_management_app_staffprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `smart_waste_management_app_userprofile`
--
ALTER TABLE `smart_waste_management_app_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_waste_management_app_complaint`
--
ALTER TABLE `smart_waste_management_app_complaint`
  ADD CONSTRAINT `smart_waste_manageme_assigned_to_id_02fc3dfa_fk_auth_user` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `smart_waste_manageme_user_id_de061c14_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_waste_management_app_notification`
--
ALTER TABLE `smart_waste_management_app_notification`
  ADD CONSTRAINT `smart_waste_manageme_user_id_80307a1d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_waste_management_app_staffprofile`
--
ALTER TABLE `smart_waste_management_app_staffprofile`
  ADD CONSTRAINT `smart_waste_manageme_user_id_3c0e3005_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_waste_management_app_userprofile`
--
ALTER TABLE `smart_waste_management_app_userprofile`
  ADD CONSTRAINT `smart_waste_manageme_user_id_05c8358a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
