-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: May 03, 2023 at 11:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeetraining`
--

-- --------------------------------------------------------

--
-- Table structure for table `et_group`
--

CREATE TABLE `et_group` (
  `group_id` int(10) NOT NULL,
  `group_topicmain_id` int(10) DEFAULT NULL,
  `group_topicminor_id` int(10) DEFAULT NULL,
  `group_course_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `et_group`
--

INSERT INTO `et_group` (`group_id`, `group_topicmain_id`, `group_topicminor_id`, `group_course_name`) VALUES
(99, 0, 0, '0'),
(100, 100, 100, 'T1'),
(101, 100, 102, 'T2'),
(102, 101, 99, 'T3');

-- --------------------------------------------------------

--
-- Table structure for table `et_topicmain`
--

CREATE TABLE `et_topicmain` (
  `topicmain_id` int(10) NOT NULL,
  `topicmain_name` varchar(50) NOT NULL,
  `topicmain_date_create` date DEFAULT NULL,
  `topicmain_date_modify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `et_topicmain`
--

INSERT INTO `et_topicmain` (`topicmain_id`, `topicmain_name`, `topicmain_date_create`, `topicmain_date_modify`) VALUES
(99, '-', NULL, NULL),
(100, 'ปฐมนิเทศ', '2566-04-18', '2566-04-25'),
(101, 'QP-WI', '2566-04-18', NULL),
(102, 'วิชาชีพเฉพาะด้าน', '2566-04-18', NULL),
(103, 'การตลาด', '2566-04-18', NULL),
(104, 'การบริหาร', '2566-04-18', NULL),
(105, 'การผลิต', '2566-04-18', NULL),
(106, 'ความปลอดภัยเเละอาชีวอนามัยในการทำงาน', '2566-04-18', NULL),
(107, 'คุณภาพชีวิต', '2566-04-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `et_topicminor`
--

CREATE TABLE `et_topicminor` (
  `topicminor_id` int(10) NOT NULL,
  `topicminor_name` varchar(50) DEFAULT NULL,
  `topicminor_date_create` date DEFAULT NULL,
  `topicminor_date_modify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `et_topicminor`
--

INSERT INTO `et_topicminor` (`topicminor_id`, `topicminor_name`, `topicminor_date_create`, `topicminor_date_modify`) VALUES
(99, '-', NULL, NULL),
(100, 'พื้นฐาน', '2566-04-18', '2566-04-24'),
(101, 'คปอ', '2566-04-18', '2566-04-25'),
(102, 'การทำงานกับสารเคมี', '2566-04-18', '2566-04-19'),
(103, 'จป หัวหน้างาน', '2566-04-18', NULL),
(104, 'จป บริหาร', '2566-04-18', NULL),
(105, 'การทำงานกับไฟฟ้า', '2566-04-18', NULL),
(106, 'ดับเพลิงขั้นต้น', '2566-04-18', NULL),
(107, 'ดับเพลิงขั้นสูง', '2566-04-18', NULL),
(108, 'ปฐมพยาบาลเบื้องต้น', '2566-04-18', NULL),
(109, 'ปฐมพยาบาลเบื้องต้น (5วัน)', '2566-04-18', NULL),
(110, 'เตรียมความพร้อมเมื่อเเผ่นดินไหว', '2566-04-18', NULL),
(111, 'การขับรถยก', '2566-04-18', NULL),
(112, 'โรคภัยเเละสุขภาพ', '2566-04-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `et_training`
--

CREATE TABLE `et_training` (
  `training_id` int(10) NOT NULL,
  `training_company` varchar(10) NOT NULL,
  `training_year` varchar(10) NOT NULL,
  `training_datetraining` date NOT NULL,
  `training_expenses` varchar(10) NOT NULL,
  `training_address` varchar(100) NOT NULL,
  `training_groupid` int(10) NOT NULL,
  `training_employee` int(10) NOT NULL,
  `training_date_create` date NOT NULL,
  `training_date_modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `et_training`
--

INSERT INTO `et_training` (`training_id`, `training_company`, `training_year`, `training_datetraining`, `training_expenses`, `training_address`, `training_groupid`, `training_employee`, `training_date_create`, `training_date_modify`) VALUES
(99, '', '', '0000-00-00', '', '', 0, 0, '0000-00-00', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `et_group`
--
ALTER TABLE `et_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `group_topicmain_id` (`group_topicmain_id`,`group_topicminor_id`);

--
-- Indexes for table `et_topicmain`
--
ALTER TABLE `et_topicmain`
  ADD PRIMARY KEY (`topicmain_id`);

--
-- Indexes for table `et_topicminor`
--
ALTER TABLE `et_topicminor`
  ADD PRIMARY KEY (`topicminor_id`);

--
-- Indexes for table `et_training`
--
ALTER TABLE `et_training`
  ADD PRIMARY KEY (`training_id`),
  ADD KEY `training_groupid` (`training_groupid`),
  ADD KEY `training_employee` (`training_employee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
