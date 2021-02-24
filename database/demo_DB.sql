-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2019 at 01:08 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.18-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `first_name` varchar(100) NOT NULL COMMENT 'First Name',
  `last_name` varchar(100) NOT NULL COMMENT 'Last Name',
  `user_name` varchar(100) NOT NULL COMMENT 'Last Name',
  `email` varchar(255) NOT NULL COMMENT 'Email Address',
  `password` varchar(255) NOT NULL COMMENT 'Password',
  `address` text NOT NULL,
  `dob` varchar(15) NOT NULL COMMENT 'Date Of Birth',
  `contact_no` varchar(16) NOT NULL COMMENT 'Contact No',
  `url` int(255) DEFAULT NULL,
  `verification_code` varchar(255) NOT NULL COMMENT 'verification Code',
  `created_date` varchar(12) NOT NULL COMMENT 'created timestamp',
  `modified_date` varchar(12) NOT NULL COMMENT 'modified timestamp',
  `status` char(1) NOT NULL COMMENT '0=pending, 1=active, 2=delete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='datatable demo table';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `address`, `dob`, `contact_no`, `url`, `verification_code`, `created_date`, `modified_date`, `status`) VALUES
(1, 'Demo', 'Demo', 'demo', 'demo@web.com', '$2y$10$jnsHMT.l7WhIYpMxyuSt0ewQkoV/P4/79MucCyd8zxZADoIw34/nW', 'Street 3111  Massachusetts Avenue, Washington, USA', '01-02-1990', '9000000001', NULL, '1', '1559545393', '1559545393', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
