-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 11:27 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatusers`
--

CREATE TABLE `chatusers` (
  `id` int(11) NOT NULL,
  `fullName` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userName` varchar(25) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `IsAdmin` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatusers`
--

INSERT INTO `chatusers` (`id`, `fullName`, `email`, `userName`, `password`, `IsAdmin`) VALUES
(1, 'Sai kiran', 'sai@gmail.com', 'sai', 'iamsai', 'N'),
(2, 'PhanindraBabu', 'phani@gmail.com', 'phani', 'iamphani', 'Y'),
(3, 'Anusha', 'anu@gmail.com', 'anusha', 'iamanu', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `successfull_logins`
--

CREATE TABLE `successfull_logins` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `successfull_logins`
--

INSERT INTO `successfull_logins` (`id`, `userid`, `timestamp`) VALUES
(1, 1, '2022-12-03 09:53:40'),
(2, 1, '2022-12-03 09:54:01'),
(3, 1, '2022-12-03 09:57:55'),
(4, 1, '2022-12-03 09:59:49'),
(5, 1, '2022-12-03 10:01:54'),
(6, 1, '2022-12-03 10:02:22'),
(7, 1, '2022-12-03 10:03:13'),
(8, 1, '2022-12-03 10:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `token` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `userid`, `token`, `timestamp`) VALUES
(1, 2, 'd0f7d4d1-db12-4c44-98b4-6b3ca8df620a', '2022-12-03 10:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `useremail` varchar(250) NOT NULL,
  `userpassword` tinytext NOT NULL,
  `usermobile` varchar(50) NOT NULL,
  `gender` enum('male','female','others') NOT NULL,
  `userprofile` tinytext NOT NULL,
  `user_expensives` longtext NOT NULL,
  `regtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `useremail`, `userpassword`, `usermobile`, `gender`, `userprofile`, `user_expensives`, `regtime`) VALUES
(16, 'peoples', 'peoples@gmail.com', 'people', '7777777777', 'male', '', '[{\"expensiveName\":\"Oppo\",\"expensiveCost\":\"15647\"},{\"expensiveName\":\"Vivo\",\"expensiveCost\":\"20000\"},{\"expensiveName\":\"iPhone 13\",\"expensiveCost\":\"125000\"}]', '2022-11-23 17:05:49'),
(18, 'Anusha', 'anu@gmail.com', 'anuDa', '8888899999', 'female', '', '', '2022-11-24 10:50:06'),
(19, 'Mani', 'Mani@gmail.com', 'manikumar@ca', '5555555555', 'male', '', '', '2022-11-24 10:52:35'),
(21, 'peoples', 'peoples@gmail.com', 'user@123', '7777777777', 'male', '', '', '2022-11-24 11:30:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatusers`
--
ALTER TABLE `chatusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `successfull_logins`
--
ALTER TABLE `successfull_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `useremail` (`useremail`),
  ADD KEY `userpassword` (`userpassword`(255)),
  ADD KEY `usermobile` (`usermobile`),
  ADD KEY `gender` (`gender`),
  ADD KEY `userprofile` (`userprofile`(255)),
  ADD KEY `regtime` (`regtime`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatusers`
--
ALTER TABLE `chatusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `successfull_logins`
--
ALTER TABLE `successfull_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
