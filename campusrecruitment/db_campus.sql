-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2024 at 10:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_campus`
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
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
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
(25, 'Can add tbl_ user', 7, 'add_tbl_user'),
(26, 'Can change tbl_ user', 7, 'change_tbl_user'),
(27, 'Can delete tbl_ user', 7, 'delete_tbl_user'),
(28, 'Can view tbl_ user', 7, 'view_tbl_user'),
(29, 'Can add tbl_jobpost', 8, 'add_tbl_jobpost'),
(30, 'Can change tbl_jobpost', 8, 'change_tbl_jobpost'),
(31, 'Can delete tbl_jobpost', 8, 'delete_tbl_jobpost'),
(32, 'Can view tbl_jobpost', 8, 'view_tbl_jobpost'),
(33, 'Can add tbl_jobrequest', 9, 'add_tbl_jobrequest'),
(34, 'Can change tbl_jobrequest', 9, 'change_tbl_jobrequest'),
(35, 'Can delete tbl_jobrequest', 9, 'delete_tbl_jobrequest'),
(36, 'Can view tbl_jobrequest', 9, 'view_tbl_jobrequest'),
(37, 'Can add tbl_company', 10, 'add_tbl_company'),
(38, 'Can change tbl_company', 10, 'change_tbl_company'),
(39, 'Can delete tbl_company', 10, 'delete_tbl_company'),
(40, 'Can view tbl_company', 10, 'view_tbl_company'),
(41, 'Can add tbl_feedback', 11, 'add_tbl_feedback'),
(42, 'Can change tbl_feedback', 11, 'change_tbl_feedback'),
(43, 'Can delete tbl_feedback', 11, 'delete_tbl_feedback'),
(44, 'Can view tbl_feedback', 11, 'view_tbl_feedback');

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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'myapp', 'tbl_company'),
(11, 'myapp', 'tbl_feedback'),
(8, 'myapp', 'tbl_jobpost'),
(9, 'myapp', 'tbl_jobrequest'),
(7, 'myapp', 'tbl_user'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2024-03-13 19:55:20.488529'),
(2, 'auth', '0001_initial', '2024-03-13 19:55:21.085309'),
(3, 'admin', '0001_initial', '2024-03-13 19:55:21.226553'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-13 19:55:21.226553'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-13 19:55:21.242288'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-13 19:55:21.304690'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-13 19:55:21.367597'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-13 19:55:21.383223'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-13 19:55:21.383223'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-13 19:55:21.430768'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-13 19:55:21.430768'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-13 19:55:21.430768'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-13 19:55:21.452908'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-13 19:55:21.478066'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-13 19:55:21.493687'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-13 19:55:21.493687'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-13 19:55:21.524251'),
(18, 'myapp', '0001_initial', '2024-03-13 19:55:21.543897'),
(19, 'sessions', '0001_initial', '2024-03-13 19:55:21.575182'),
(20, 'myapp', '0002_tbl_user_website', '2024-03-31 15:58:53.266573'),
(21, 'myapp', '0003_tbl_jobpost', '2024-03-31 17:31:25.179461'),
(22, 'myapp', '0004_tbl_jobpost_end_date_tbl_jobpost_joblocation_and_more', '2024-04-10 09:43:56.802218'),
(23, 'myapp', '0005_tbl_jobrequest', '2024-04-10 09:47:19.169979'),
(24, 'myapp', '0006_tbl_company_remove_tbl_user_website', '2024-04-16 04:36:52.924931'),
(25, 'myapp', '0007_tbl_jobrequest_cmp_id_alter_tbl_jobpost_cmpny', '2024-04-16 04:41:26.719527'),
(26, 'myapp', '0008_tbl_jobrequest_interview_date_and_more', '2024-04-21 04:34:24.267084'),
(27, 'myapp', '0009_tbl_feedback', '2024-04-21 06:00:15.800321'),
(28, 'myapp', '0010_tbl_feedback_utype', '2024-04-21 06:36:41.116800'),
(29, 'myapp', '0011_tbl_user_qualification', '2024-04-21 07:41:30.190364');

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
('0oygbgsyn7hyiz86vag10nek9i7q58d5', 'eyJpZCI6Mn0:1rrAPQ:4wM57muTz3Dpcnw69h8LAiPDm6nLGm6pdyY2PV8EmH8', '2024-04-15 05:40:40.764227'),
('cvn95uwb02fscrcs6nn2apy968wb8gb5', 'eyJpZCI6MX0:1ryRsh:ciabsVYAiSMqiOsT141etxe8JuG_JyrT0LPexV0cGb8', '2024-05-05 07:44:59.356675'),
('gqgusgj0fjtf3u8teqpy6t8lr5rguz6w', 'e30:1rknGD:i9A-KMbJeyeZ-HcUPYT4C-7xHnz2OAAPoBTMzYBZTOQ', '2024-03-28 15:44:49.191458'),
('wxku6cquycmo75gerqu5wwpgxb7vc0cn', 'eyJpZCI6Mn0:1rqzjC:vZqOsJtoZHGd0fXADlF3pvYdyV5ZdIYwCHssxNUjNKg', '2024-04-14 18:16:22.485612');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_tbl_company`
--

CREATE TABLE `myapp_tbl_company` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pswd` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `website` varchar(30) NOT NULL,
  `user_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_tbl_company`
--

INSERT INTO `myapp_tbl_company` (`id`, `name`, `phone`, `email`, `pswd`, `status`, `website`, `user_type`) VALUES
(1, 'infosys', '3745345343', 'infosys@gmail.com', '123', 'approved', 'www.infosys.in', 'company');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_tbl_feedback`
--

CREATE TABLE `myapp_tbl_feedback` (
  `id` bigint(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `feedback` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cmpny_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `utype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_tbl_feedback`
--

INSERT INTO `myapp_tbl_feedback` (`id`, `date`, `feedback`, `status`, `cmpny_id`, `user_id`, `utype`) VALUES
(1, '2024-04-21', 'good', 'pending', NULL, 3, 'student'),
(2, '2024-04-21', 'usefull', 'pending', 1, NULL, 'company');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_tbl_jobpost`
--

CREATE TABLE `myapp_tbl_jobpost` (
  `id` bigint(20) NOT NULL,
  `role` varchar(30) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `skills` varchar(30) NOT NULL,
  `requirements` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cmpny_id` bigint(20) DEFAULT NULL,
  `end_date` varchar(100) NOT NULL,
  `joblocation` varchar(100) NOT NULL,
  `responsibilities` varchar(100) NOT NULL,
  `salary` varchar(100) NOT NULL,
  `upload_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_tbl_jobpost`
--

INSERT INTO `myapp_tbl_jobpost` (`id`, `role`, `experience`, `qualification`, `skills`, `requirements`, `status`, `cmpny_id`, `end_date`, `joblocation`, `responsibilities`, `salary`, `upload_date`) VALUES
(1, 'software developer', '2', 'bsc.cs', 'java, c,cpp', 'sdsd', 'approved', 1, '', '', '', '', ''),
(2, 'UI UX developer', '2', 'btech', 'java, c,cpp', 'erer', 'approved', 1, '', '', '', '', ''),
(3, 'software developer', '5', 'Bca', 'java, c,cpp', 'sdsds', 'pending', 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_tbl_jobrequest`
--

CREATE TABLE `myapp_tbl_jobrequest` (
  `id` bigint(20) NOT NULL,
  `resume` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `job_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL,
  `cmp_id_id` bigint(20) DEFAULT NULL,
  `interview_date` varchar(100) NOT NULL,
  `interview_location` varchar(100) NOT NULL,
  `interview_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_tbl_jobrequest`
--

INSERT INTO `myapp_tbl_jobrequest` (`id`, `resume`, `date`, `status`, `job_id_id`, `user_id_id`, `cmp_id_id`, `interview_date`, `interview_location`, `interview_time`) VALUES
(1, 'resume/The_CSS_Box_Model.doc', '2024-04-10 ', 'scheduled', 1, 3, 1, '2024-04-22', 'thrissur', '10.00 am'),
(2, 'resume/The_CSS_Box_Model.doc', '2024-04-18', 'reject', 3, 3, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_tbl_user`
--

CREATE TABLE `myapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pswd` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `qualification` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myapp_tbl_user`
--

INSERT INTO `myapp_tbl_user` (`id`, `name`, `phone`, `email`, `pswd`, `status`, `user_type`, `qualification`) VALUES
(1, 'Anu', '545454545454', 'anu@gmail.com', '123', 'approved', 'company', 'B.Tech cs'),
(2, 'Admin', '', 'admin@gmail.com', 'admin123', '', 'admin', 'MCA'),
(3, 'libin', '927238728372', 'libinps98@gmail.com', '123', 'pending', 'student', 'BSC.cs');

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
-- Indexes for table `myapp_tbl_company`
--
ALTER TABLE `myapp_tbl_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_tbl_feedback`
--
ALTER TABLE `myapp_tbl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_tbl_feedback_cmpny_id_fc144fe1_fk_myapp_tbl_company_id` (`cmpny_id`),
  ADD KEY `myapp_tbl_feedback_user_id_90e60daa_fk_myapp_tbl_user_id` (`user_id`);

--
-- Indexes for table `myapp_tbl_jobpost`
--
ALTER TABLE `myapp_tbl_jobpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_tbl_jobpost_cmpny_id_eb7d756c_fk_myapp_tbl_company_id` (`cmpny_id`);

--
-- Indexes for table `myapp_tbl_jobrequest`
--
ALTER TABLE `myapp_tbl_jobrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_tbl_jobrequest_job_id_id_4c99423f_fk_myapp_tbl_jobpost_id` (`job_id_id`),
  ADD KEY `myapp_tbl_jobrequest_user_id_id_cc6de67f_fk_myapp_tbl_user_id` (`user_id_id`),
  ADD KEY `myapp_tbl_jobrequest_cmp_id_id_2006cd20_fk_myapp_tbl_company_id` (`cmp_id_id`);

--
-- Indexes for table `myapp_tbl_user`
--
ALTER TABLE `myapp_tbl_user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `myapp_tbl_company`
--
ALTER TABLE `myapp_tbl_company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_tbl_feedback`
--
ALTER TABLE `myapp_tbl_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_tbl_jobpost`
--
ALTER TABLE `myapp_tbl_jobpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `myapp_tbl_jobrequest`
--
ALTER TABLE `myapp_tbl_jobrequest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_tbl_user`
--
ALTER TABLE `myapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `myapp_tbl_feedback`
--
ALTER TABLE `myapp_tbl_feedback`
  ADD CONSTRAINT `myapp_tbl_feedback_cmpny_id_fc144fe1_fk_myapp_tbl_company_id` FOREIGN KEY (`cmpny_id`) REFERENCES `myapp_tbl_company` (`id`),
  ADD CONSTRAINT `myapp_tbl_feedback_user_id_90e60daa_fk_myapp_tbl_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_tbl_user` (`id`);

--
-- Constraints for table `myapp_tbl_jobpost`
--
ALTER TABLE `myapp_tbl_jobpost`
  ADD CONSTRAINT `myapp_tbl_jobpost_cmpny_id_eb7d756c_fk_myapp_tbl_company_id` FOREIGN KEY (`cmpny_id`) REFERENCES `myapp_tbl_company` (`id`);

--
-- Constraints for table `myapp_tbl_jobrequest`
--
ALTER TABLE `myapp_tbl_jobrequest`
  ADD CONSTRAINT `myapp_tbl_jobrequest_cmp_id_id_2006cd20_fk_myapp_tbl_company_id` FOREIGN KEY (`cmp_id_id`) REFERENCES `myapp_tbl_company` (`id`),
  ADD CONSTRAINT `myapp_tbl_jobrequest_job_id_id_4c99423f_fk_myapp_tbl_jobpost_id` FOREIGN KEY (`job_id_id`) REFERENCES `myapp_tbl_jobpost` (`id`),
  ADD CONSTRAINT `myapp_tbl_jobrequest_user_id_id_cc6de67f_fk_myapp_tbl_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `myapp_tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
