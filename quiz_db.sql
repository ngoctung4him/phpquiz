-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 11:26 PM
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
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `choice_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`id`, `question_id`, `choice_text`, `is_correct`) VALUES
(1, 1, 'Paris', 1),
(2, 1, 'London', 0),
(3, 1, 'Berlin', 0),
(4, 1, 'Madrid', 0),
(5, 2, '3', 0),
(6, 2, '4', 1),
(7, 2, '5', 0),
(8, 2, '6', 0),
(9, 3, 'Paris', 1),
(10, 3, 'London', 0),
(11, 3, 'Berlin', 0),
(12, 3, 'Madrid', 0),
(13, 4, 'Earth', 0),
(14, 4, 'Mars', 1),
(15, 4, 'Jupiter', 0),
(16, 4, 'Venus', 0),
(17, 5, 'Charles Dickens', 0),
(18, 5, 'William Shakespeare', 1),
(19, 5, 'Mark Twain', 0),
(20, 5, 'Jane Austen', 0),
(21, 6, 'Atlantic Ocean', 0),
(22, 6, 'Indian Ocean', 0),
(23, 6, 'Pacific Ocean', 1),
(24, 6, 'Arctic Ocean', 0),
(25, 7, 'Oxygen', 1),
(26, 7, 'Gold', 0),
(27, 7, 'Sodium', 0),
(28, 7, 'Iron', 0),
(29, 8, '1912', 1),
(30, 8, '1905', 0),
(31, 8, '1915', 0),
(32, 8, '1920', 0),
(33, 9, 'China', 0),
(34, 9, 'Japan', 1),
(35, 9, 'South Korea', 0),
(36, 9, 'Thailand', 0),
(37, 10, '30', 1),
(38, 10, '25', 0),
(39, 10, '20', 0),
(40, 10, '35', 0),
(41, 11, '6', 0),
(42, 11, '7', 0),
(43, 11, '8', 1),
(44, 11, '9', 0),
(45, 12, '30', 1),
(46, 12, '25', 0),
(47, 12, '20', 0),
(48, 12, '35', 0),
(49, 13, '2.14', 0),
(50, 13, '3.14', 1),
(51, 13, '4.14', 0),
(52, 13, '5.14', 0),
(53, 14, '18', 0),
(54, 14, '19', 1),
(55, 14, '20', 0),
(56, 14, '21', 0),
(57, 15, 'Oxygen', 0),
(58, 15, 'Nitrogen', 0),
(59, 15, 'Carbon Dioxide', 1),
(60, 15, 'Hydrogen', 0),
(61, 16, 'Earth', 0),
(62, 16, 'Mars', 0),
(63, 16, 'Mercury', 1),
(64, 16, 'Venus', 0),
(65, 17, 'H2O', 1),
(66, 17, 'CO2', 0),
(67, 17, 'NaCl', 0),
(68, 17, 'CH4', 0),
(69, 18, 'Gold', 0),
(70, 18, 'Diamond', 1),
(71, 18, 'Iron', 0),
(72, 18, 'Silver', 0),
(73, 19, 'Lungs', 0),
(74, 19, 'Brain', 0),
(75, 19, 'Heart', 1),
(76, 19, 'Kidney', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question_text`) VALUES
(1, 1, 'What is the capital of France?'),
(2, 2, 'What is 2+2?'),
(3, 3, 'What is the capital of France?'),
(4, 3, 'Which planet is known as the Red Planet?'),
(5, 3, 'Who wrote \'Romeo and Juliet\'?'),
(6, 3, 'What is the largest ocean on Earth?'),
(7, 3, 'Which element has the chemical symbol \'O\'?'),
(8, 3, 'In which year did the Titanic sink?'),
(9, 3, 'Which country is known as the Land of the Rising Sun?'),
(10, 4, 'What is 5 * 6?'),
(11, 4, 'What is the square root of 64?'),
(12, 4, 'What is 15% of 200?'),
(13, 4, 'What is the value of Pi (approximately)?'),
(14, 4, 'What is 9 + 10?'),
(15, 5, 'What gas do plants absorb from the atmosphere?'),
(16, 5, 'Which planet is closest to the sun?'),
(17, 5, 'What is the chemical formula for water?'),
(18, 5, 'What is the hardest natural substance on Earth?'),
(19, 5, 'Which organ is responsible for pumping blood throughout the body?');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'General Knowledge', 'Test your general knowledge', '2024-09-04 21:15:54'),
(2, 'Math Quiz', 'Basic arithmetic questions', '2024-09-04 21:15:54'),
(3, 'General Knowledge', 'Test your general knowledge', '2024-09-04 21:37:01'),
(4, 'Math Quiz', 'Basic arithmetic questions', '2024-09-04 21:37:01'),
(5, 'Science Quiz', 'General science questions', '2024-09-04 21:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `quiz_id`, `user_name`, `score`, `completed_at`) VALUES
(1, 2, 'Timothy', 1, '2024-09-04 21:24:39'),
(2, 3, 'timothy', 4, '2024-09-04 21:37:57'),
(3, 3, 'tim', 2, '2024-09-04 21:57:03'),
(4, 3, 'tim2', 5, '2024-09-04 21:59:14'),
(5, 5, 'Timothy', 2, '2024-11-07 16:25:23'),
(6, 5, 'Timothy 2', 1, '2024-11-07 16:25:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choices`
--
ALTER TABLE `choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
