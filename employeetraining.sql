-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Apr 20, 2023 at 07:56 AM
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
-- Table structure for table `et_course`
--

CREATE TABLE `et_course` (
  `course_id` int(10) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `course_date_create` date DEFAULT NULL,
  `course_date_modify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `et_course`
--

INSERT INTO `et_course` (`course_id`, `course_name`, `course_date_create`, `course_date_modify`) VALUES
(99, NULL, NULL, NULL),
(100, 'asd', '2566-04-19', NULL),
(101, 'ฟหกฟหก', '2566-04-19', NULL),
(102, 'ฟฟ', '2566-04-19', NULL),
(103, 'ฟหก', '2566-04-19', NULL),
(104, 'asd', '2566-04-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `et_main`
--

CREATE TABLE `et_main` (
  `et_main_id` int(10) NOT NULL,
  `et_main_topicmain_id` int(10) NOT NULL,
  `et_main_topicminor_id` int(10) NOT NULL,
  `et_main_course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(99, '', NULL, NULL),
(100, 'ปฐมนิเทศ', '2566-04-18', NULL),
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
(99, NULL, NULL, NULL),
(100, 'พื้นฐาน', '2566-04-18', '2566-04-18'),
(101, 'คปอ', '2566-04-18', NULL),
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `et_course`
--
ALTER TABLE `et_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `et_main`
--
ALTER TABLE `et_main`
  ADD PRIMARY KEY (`et_main_id`),
  ADD KEY `et_main_topicmain_id` (`et_main_topicmain_id`),
  ADD KEY `et_main_topicminor_id` (`et_main_topicminor_id`),
  ADD KEY `et_main_course_id` (`et_main_course_id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
