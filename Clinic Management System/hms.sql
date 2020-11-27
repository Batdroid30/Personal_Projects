-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 14, 2020 at 07:48 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'admin1234', '12-08-2020 12:56:57 PM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `consultancyFees` int(11) NOT NULL,
  `appointmentDate` varchar(255) NOT NULL,
  `appointmentTime` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `userStatus` int(11) NOT NULL,
  `doctorStatus` int(11) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(7, 'Bone Specialist', 20, 11, 300, '2020-08-18', '3:15 PM', '2020-08-12 08:16:40', 1, 0, '2020-08-18'),
(8, 'Bone Specialist', 20, 13, 300, '2020-08-27', '4:45 PM', '2020-08-12 11:11:57', 1, 1, '2020-08-27'),
(9, 'Bone Specialist', 20, 15, 300, '2020-08-26', '1:00 PM', '2020-08-13 05:16:11', 1, 0, '2020-08-26'),
(10, 'General Physician', 20, 15, 600, '2020-08-26', '11:00 AM', '2020-08-13 05:27:50', 1, 1, '2020-08-26');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(20, 'General Physician', 'Shubham Mishra', 'Panjim', '600', 7030606229, 'shu@gmail.com', '04f5b0b093248ada9ed4ef20ee74bfbe', '2020-08-12 07:52:10', '2020-08-13 05:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(18, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 08:18:29', '12-08-2020 01:48:50 PM', 1),
(19, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:29:37', '12-08-2020 04:00:11 PM', 1),
(20, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:30:39', NULL, 0),
(21, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:31:04', '12-08-2020 04:04:59 PM', 1),
(22, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:36:18', '12-08-2020 04:06:26 PM', 1),
(23, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:36:58', '12-08-2020 04:08:07 PM', 1),
(24, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:17:03', NULL, 0),
(25, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:17:18', NULL, 0),
(26, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:18:29', NULL, 0),
(27, NULL, 'shu@gmail', 0x3132372e302e302e3100000000000000, '2020-08-13 05:20:15', NULL, 0),
(28, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:20:33', NULL, 0),
(29, NULL, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:21:06', NULL, 0),
(30, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:21:26', '13-08-2020 10:51:42 AM', 1),
(31, 20, 'shu@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:22:38', '13-08-2020 10:54:43 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(24, 'General Physician', '2020-08-12 07:50:32', NULL),
(25, 'Bone Specialist', '2020-08-12 07:50:45', NULL),
(26, 'Gynecologist', '2020-08-12 07:50:53', NULL),
(27, 'Homeopathic', '2020-08-12 08:25:29', NULL),
(28, 'Ayurveda', '2020-08-13 05:34:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(3, 'Shivanand Ben', 'ben@gmail.com', 8877665544, ' Hello ', '2020-08-12 08:23:24', 'Hi', '2020-08-12 08:24:33', 1),
(4, 'Vijendra', 'vin@gmail.com', 9988776655, ' Hello', '2020-08-13 05:38:46', 'Hello there.', '2020-08-13 05:39:49', 1),
(5, 'Vijendra', 'vij@gmail.com', 8877665544, ' Hello', '2020-08-13 05:41:33', 'Hello there', '2020-08-13 05:42:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(20, 11, 'ben@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 08:16:15', '12-08-2020 01:47:21 PM', 1),
(21, 11, 'ben@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 08:19:07', '12-08-2020 01:49:20 PM', 1),
(22, 11, 'ben@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 08:20:30', '12-08-2020 01:51:06 PM', 1),
(23, NULL, 'ben@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:20:49', NULL, 0),
(24, NULL, 'ben@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:20:59', NULL, 0),
(25, NULL, 'ben@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:21:09', NULL, 0),
(26, 11, 'ben@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:21:42', '12-08-2020 03:51:57 PM', 1),
(27, 12, 'san@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:24:02', '12-08-2020 03:54:28 PM', 1),
(28, NULL, 'san@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-12 10:24:39', NULL, 0),
(29, NULL, 'san@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:43:15', NULL, 0),
(30, NULL, 'san@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:43:33', NULL, 0),
(31, NULL, 'san@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 10:43:57', NULL, 0),
(32, 11, 'ben@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:08:32', '12-08-2020 04:39:04 PM', 1),
(33, 11, 'ben@mail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:09:24', '12-08-2020 04:40:00 PM', 1),
(34, NULL, 'san@mail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:11:20', NULL, 0),
(35, 13, 'sanjay@mail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:11:37', '12-08-2020 04:42:21 PM', 1),
(36, 13, 'sanjay@mail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:21:14', '12-08-2020 04:51:31 PM', 1),
(37, 14, 'ramesh@mail.com', 0x3132372e302e302e3100000000000000, '2020-08-12 11:24:10', '12-08-2020 04:54:16 PM', 1),
(38, NULL, 'vin@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:12:28', NULL, 0),
(39, 15, 'vin@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:14:27', '13-08-2020 10:46:40 AM', 1),
(40, NULL, 'vin@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:25:01', NULL, 0),
(41, 15, 'vin@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:25:20', '13-08-2020 10:56:42 AM', 1),
(42, 15, 'vin@gmail.com', 0x3132372e302e302e3100000000000000, '2020-08-13 05:27:02', '13-08-2020 10:57:56 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(14, 'Ramesh Shetty', 'Vasco', 'Vasco', 'male', 'ramesh@mail.com', '50f42f5f407bdde8fbc33ba12aacfda7', '2020-08-12 11:23:48', NULL),
(15, 'Vinayak Padgaonkar', 'Margao', 'Margao', 'male', 'vin@gmail.com', '755a48ef3a4a29ccc639b7aece92dfef', '2020-08-13 05:12:01', '2020-08-13 05:14:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
