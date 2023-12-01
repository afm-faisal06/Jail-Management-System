-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 02:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `email`, `password`) VALUES
('Group 3', 'walid49@gmail.com', '93a5086d4a0f21b634c2518c249523247ebba14f0cabf5ae5bee54bfd5588556');

-- --------------------------------------------------------

--
-- Table structure for table `prisoner`
--

CREATE TABLE `prisoner` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `birth` date NOT NULL,
  `record` varchar(50) NOT NULL,
  `cell` varchar(50) NOT NULL,
  `year` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prisoner`
--

INSERT INTO `prisoner` (`id`, `name`, `age`, `birth`, `record`, `cell`, `year`) VALUES
(8, 'Kala Manik', 45, '1993-07-12', 'Drug Dealing', '2A', '5 years'),
(12, 'Alison Burger', 45, '1995-07-11', 'Robbery', '1B', '2 years'),
(14, 'Ted Bundy', 40, '1970-07-05', 'Serial Killer', '2B', 'Death Sentence');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `email` varchar(200) NOT NULL,
  `shift` varchar(200) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`name`, `email`, `type`, `shift`, `time`, `role`) VALUES
('Alif Hossain', 'alif@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Police'),
('Bilkis Begum', 'bilkis@gmail.com', 'Wash Dish', 'Day', '8AM - 3PM', 'Chef'),
('Fexo', 'fexo@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Cleaner'),
('Kuddus Miah', 'kuddus@gmail.com', 'Laundry', 'Night', '9PM - 12AM', 'Cleaner'),
('sneha', 'lm10@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Police'),
('Mowgli', 'mowgli@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Chef'),
('Murney', 'murney@gmail.com', 'Not Assigned', 'Not Assigned', 'Not Assigned', 'Police'),
('phone', 'phone@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Chef'),
('Samara', 'samara@gmail.com', 'Not Assigned', 'Not Assigned', 'Not Assigned', 'Chef'),
('Shakib Khan', 'shakibkhan@gmail.com', 'Special', 'Night', '9PM - 12AM', 'Police'),
('Shuvo Talukders', 'shuvo@gmail.com', 'Room Cleaning', 'Day', '8AM - 3PM', 'Cleaner'),
('shuvoDogshit', 'shuvodogshit@gmail.com', 'Not Assigned', 'Not Assigned', 'Not Assigned', 'Cleaner');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `role`, `email`, `password`) VALUES
(1, 'Kuddus Miah', 'Cleaner', 'kuddus@gmail.com', '75f7f8c26cfe31a47113a7ce0b3493277cf392879e6fca1ebc7d93e597914e0c'),
(5, 'Bilkis Begum', 'Chef', 'bilkis@gmail.com', 'bd514b20441bbbfe4edc22079e690736dcc888de2496c55963f9f5e2b43530f3'),
(19, 'Abu Fatah Mohammad Faisal', 'Deputy Warden', 'faisal@gmail.com', 'b0d964d1ed25d44c646fe86afcec8a56304bb4be36c01ea4d14785e4a6dc2ba7'),
(22, 'Shuvo Talukders', 'Cleaner', 'shuvo@gmail.com', '2f684da2a727e1c49e48764b0c284c4835123ab7a330758066ed9b2b8721b810'),
(29, 'Alif Hossain', 'Police', 'alif@gmail.com', '8c3fb8f94678f1214084c690601d0afd12a45c3b6940b040344c389b6225e547'),
(30, 'sneha', 'Police', 'lm10@gmail.com', '88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589'),
(31, 'Murney', 'Police', 'murney@gmail.com', '67ccb64a2f459a983dca5d66c8a0e1daf1e37d9e27a38e693e02baf08ea28385'),
(32, 'Mowgli', 'Chef', 'mowgli@gmail.com', 'cc803cdef49781fb1bc7d5fab0efc7c7c568b5f52e129f9df80799298360ee96'),
(33, 'Samara', 'Chef', 'samara@gmail.com', '9ef100006f200f87ab417abbd87c2eeee16e6f1e491c2337c082411a2cadad6d'),
(36, 'Fexo', 'Cleaner', 'fexo@gmail.com', 'ef585e24ddc703fd41fcd1f76072e931f3426b04e36889515d5a983d2a9500ef'),
(37, 'shuvoDogshit', 'Cleaner', 'shuvodogshit@gmail.com', 'ad00fcfa2d621c47ef96ac6e309f4405d525e0adc38708497cae773db975a52b'),
(38, 'Shakib Khan', 'Police', 'shakibkhan@gmail.com', 'a89d489f0ba5e2b2d25af8ff6bf554fb930ceb1c4e10c8ef70715b0bc95afb08'),
(39, 'phone', 'Chef', 'phone@gmail.com', '45569da57f4b7bf472d7a864ef4781451cae6383fee9fb0ae40c59aa1ce475b7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `prisoner`
--
ALTER TABLE `prisoner`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `prisoner`
--
ALTER TABLE `prisoner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
