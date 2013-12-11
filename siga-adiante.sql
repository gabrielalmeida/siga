-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2013 at 03:41 PM
-- Server version: 5.6.12
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `siga-adiante`
--
CREATE DATABASE IF NOT EXISTS `siga-adiante` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siga-adiante`;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_num` int(11) NOT NULL,
  `discipline_code` int(11) NOT NULL,
  `period` varchar(8) NOT NULL,
  `max_subscriptions` int(11) NOT NULL,
  `subscriptions` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_num`, `discipline_code`, `period`, `max_subscriptions`, `subscriptions`) VALUES
(1, 7485, 1, '2013.2', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `classes_details`
--

CREATE TABLE IF NOT EXISTS `classes_details` (
  `class_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `schedule` varchar(512) NOT NULL,
  PRIMARY KEY (`class_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `classes_details`
--

INSERT INTO `classes_details` (`class_detail_id`, `class_id`, `teacher_id`, `schedule`) VALUES
(1, 1, 1, '0'),
(2, 1, 1, 'seg-8:00~12:00');

-- --------------------------------------------------------

--
-- Table structure for table `classes_students`
--

CREATE TABLE IF NOT EXISTS `classes_students` (
  `class_student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `class_num` int(11) NOT NULL,
  `period` varchar(8) NOT NULL,
  PRIMARY KEY (`class_student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `classes_students`
--

INSERT INTO `classes_students` (`class_student_id`, `user_id`, `class_num`, `period`) VALUES
(1, 1, 7485, '2013.1');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE IF NOT EXISTS `disciplines` (
  `discipline_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `discipline_code` varchar(8) NOT NULL COMMENT 'SIGA Course id',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`discipline_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`discipline_id`, `discipline_code`, `name`) VALUES
(1, 'MAC118', 'Calc. Difer. e Integ. I');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `name`) VALUES
(1, 'JAIR RODRIGUES');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `dre` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `dre`) VALUES
(1, 'Gabriel Almeida de Santana', 'gabriel_almeida@poli.ufrj.br', 113066993);

-- --------------------------------------------------------

--
-- Table structure for table `_disciplines_list`
--

CREATE TABLE IF NOT EXISTS `_disciplines_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discipline_code` varchar(8) NOT NULL,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
