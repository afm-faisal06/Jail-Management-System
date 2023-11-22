-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 05:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jailmanage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `email`, `password`) VALUES
('Walid Ibne Hasan', 'walid49@gmail.com', '93a5086d4a0f21b634c2518c249523247ebba14f0cabf5ae5bee54bfd5588556');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `email` varchar(200) NOT NULL,
  `shift` varchar(200) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `shift` varchar(200) NOT NULL,
  `time` varchar(20) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`name`, `email`, `type`, `shift`, `time`, `role`) VALUES
('Alif Hossain', 'alif@gmail.com', 'Not Assigned', 'Not Assigned', 'Not Assigned', 'Police'),
('Bilkis Begum', 'bilkis@gmail.com', 'Wash Dish', 'Night', '9PM - 12AM', 'Chef'),
('Kuddus Miah', 'kuddus@gmail.com', 'Laundry', 'Night', '9PM - 12AM', 'Police'),
('Safwat Samir', 'samir@gmail.com', 'Guard Room 1', 'Day', '8AM - 3PM', 'Police'),
('Shuvo Talukders', 'shuvo@gmail.com', 'Room Cleaning', 'Day', '8AM - 3PM', 'Cleaner');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `role`, `email`, `password`) VALUES
(1, 'Kuddus Miah', 'Police', 'kuddus@gmail.com', '75f7f8c26cfe31a47113a7ce0b3493277cf392879e6fca1ebc7d93e597914e0c'),
(5, 'Bilkis Begum', 'Chef', 'bilkis@gmail.com', 'bd514b20441bbbfe4edc22079e690736dcc888de2496c55963f9f5e2b43530f3'),
(14, 'Safwat Samir', 'Police', 'samir@gmail.com', 'b816a16cd03774e0cefac03765680a33365d0b16060f67a2f7382a844f9c664f'),
(22, 'Shuvo Talukders', 'Cleaner', 'shuvo@gmail.com', '2f684da2a727e1c49e48764b0c284c4835123ab7a330758066ed9b2b8721b810'),
(29, 'Alif Hossain', 'Police', 'alif@gmail.com', '8c3fb8f94678f1214084c690601d0afd12a45c3b6940b040344c389b6225e547'),
(30, 'Asif Khan', 'Cleaner', 'asif@gmail.com', '5f8b94103b61ea6cd6e258c67fd1cd52450d2e89d8f7c6afb5316742d5d9fe16'),
(31, 'Tasnuva Haque', 'Chef', 'tasnuva@gmail.com', 'e6c3195a1a335f6d905544476838963273c1cb1ae4bb4c7033dc9f673268da6a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
