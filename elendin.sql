-- phpMyAdmin SQL Dump
-- version 3.4.10
-- http://www.phpmyadmin.net
--
-- Host: 94.73.148.249
-- Generation Time: Mar 22, 2016 at 03:32 AM
-- Server version: 5.5.45
-- PHP Version: 5.2.6-1+lenny10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `elendin`
--

-- --------------------------------------------------------

--
-- Table structure for table `agegroup`
--

CREATE TABLE IF NOT EXISTS `agegroup` (
  `idagegroup` int(11) NOT NULL AUTO_INCREMENT,
  `agegroup` varchar(45) NOT NULL,
  PRIMARY KEY (`idagegroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `agegroup`
--

INSERT INTO `agegroup` (`idagegroup`, `agegroup`) VALUES
(1, 'Kid (1-13)'),
(2, 'Teenager (13-18)'),
(3, 'Grown Up (18-60)'),
(4, 'Elder (60-110)'),
(5, 'Probably Dead (110-1000)');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `idanswer` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`idanswer`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`idanswer`, `answer`) VALUES
(1, 'Dinozorlar!'),
(2, 'Mısır Uyaglığı'),
(3, 'Roma İmparatorluğu'),
(4, 'Vahşi Batı'),
(5, 'İnsanlığın sonu');

-- --------------------------------------------------------

--
-- Table structure for table `anwertoquestionbyuser`
--

CREATE TABLE IF NOT EXISTS `anwertoquestionbyuser` (
  `idanwertoquestionbyuser` int(11) NOT NULL,
  `question_idquestion` int(11) NOT NULL,
  `question_category_idcategory` int(11) NOT NULL,
  `question_questionstatus_idquestionstatus` int(11) NOT NULL,
  `answer_idanswer` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL,
  `user_userage_iduserage` int(11) NOT NULL,
  `user_userrank_iduserrank` int(11) NOT NULL,
  `user_city_idcity` int(11) NOT NULL,
  PRIMARY KEY (`idanwertoquestionbyuser`,`question_idquestion`,`question_category_idcategory`,`question_questionstatus_idquestionstatus`,`answer_idanswer`,`user_iduser`,`user_userage_iduserage`,`user_userrank_iduserrank`,`user_city_idcity`),
  KEY `fk_anwertoquestionbyuser_question1_idx` (`question_idquestion`,`question_category_idcategory`,`question_questionstatus_idquestionstatus`),
  KEY `fk_anwertoquestionbyuser_answer1_idx` (`answer_idanswer`),
  KEY `fk_anwertoquestionbyuser_user1_idx` (`user_iduser`,`user_userage_iduserage`,`user_userrank_iduserrank`,`user_city_idcity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `approvalstage`
--

CREATE TABLE IF NOT EXISTS `approvalstage` (
  `idapprovalstage` int(11) NOT NULL,
  `upvote` int(11) NOT NULL,
  `downvote` int(11) NOT NULL,
  PRIMARY KEY (`idapprovalstage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `arrangestage`
--

CREATE TABLE IF NOT EXISTS `arrangestage` (
  `idarrangestage` int(11) NOT NULL,
  `answer_idanswer` int(11) NOT NULL,
  PRIMARY KEY (`idarrangestage`,`answer_idanswer`),
  KEY `fk_arrangestage_answer1_idx` (`answer_idanswer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `basicuserview`
--
CREATE TABLE IF NOT EXISTS `basicuserview` (
`iduser` int(11)
,`Name` varchar(45)
,`Surname` varchar(45)
,`city` varchar(45)
,`userbirthday` varchar(45)
,`userrank` varchar(45)
,`sex` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `category`) VALUES
(1, 'Hayalgücü');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `idcity` int(11) NOT NULL AUTO_INCREMENT,
  `country_idcountry` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`idcity`,`country_idcountry`),
  KEY `fk_city_country1_idx` (`country_idcountry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`idcity`, `country_idcountry`, `city`) VALUES
(1, 1, 'Ankara'),
(2, 1, 'Adana'),
(3, 2, 'Monterrey'),
(4, 3, 'Austin'),
(5, 3, 'Dallas'),
(6, 3, 'New York'),
(7, 1, 'Antalya');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `idcountry` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`idcountry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`idcountry`, `country`) VALUES
(1, 'Turkey'),
(2, 'Mexico'),
(3, 'USA'),
(4, 'England'),
(5, 'Peru');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `idfeedback` int(11) NOT NULL AUTO_INCREMENT,
  `positivefeedback_idpositivefeedback` int(11) NOT NULL,
  `negetivefeedback_idnegetivefeedback` int(11) NOT NULL,
  PRIMARY KEY (`idfeedback`,`positivefeedback_idpositivefeedback`,`negetivefeedback_idnegetivefeedback`),
  KEY `fk_feedback_positivefeedback1_idx` (`positivefeedback_idpositivefeedback`),
  KEY `fk_feedback_negetivefeedback1_idx` (`negetivefeedback_idnegetivefeedback`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE IF NOT EXISTS `friendship` (
  `user_iduser` int(11) NOT NULL AUTO_INCREMENT,
  `user_iduser1` int(11) NOT NULL,
  `idfriendship` int(11) NOT NULL,
  PRIMARY KEY (`user_iduser`,`user_iduser1`,`idfriendship`),
  UNIQUE KEY `usertouser` (`user_iduser`,`user_iduser1`),
  KEY `fk_user_has_user_user2_idx` (`user_iduser1`),
  KEY `fk_user_has_user_user1_idx` (`user_iduser`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`user_iduser`, `user_iduser1`, `idfriendship`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `negetivefeedback`
--

CREATE TABLE IF NOT EXISTS `negetivefeedback` (
  `idnegetivefeedback` int(11) NOT NULL,
  `negetivefeedback` varchar(45) NOT NULL,
  PRIMARY KEY (`idnegetivefeedback`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `negetivefeedback`
--

INSERT INTO `negetivefeedback` (`idnegetivefeedback`, `negetivefeedback`) VALUES
(1, 'Sıkıcı'),
(2, 'Saçma'),
(3, 'Kırıcı');

-- --------------------------------------------------------

--
-- Table structure for table `positivefeedback`
--

CREATE TABLE IF NOT EXISTS `positivefeedback` (
  `idpositivefeedback` int(11) NOT NULL,
  `positivefeedback` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpositivefeedback`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `positivefeedback`
--

INSERT INTO `positivefeedback` (`idpositivefeedback`, `positivefeedback`) VALUES
(1, 'Yaratıcı'),
(2, 'Komik'),
(3, 'Düşündürücü');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `idquestion` int(11) NOT NULL,
  `category_idcategory` int(11) NOT NULL,
  `questionstatus_idquestionstatus` int(11) NOT NULL,
  `answer_idanswer` int(11) NOT NULL,
  `question` varchar(300) NOT NULL,
  PRIMARY KEY (`idquestion`,`category_idcategory`,`questionstatus_idquestionstatus`),
  KEY `fk_question_category_idx` (`category_idcategory`),
  KEY `fk_question_questionstatus1_idx` (`questionstatus_idquestionstatus`),
  KEY `fk_question_answer1_idx` (`answer_idanswer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`idquestion`, `category_idcategory`, `questionstatus_idquestionstatus`, `answer_idanswer`, `question`) VALUES
(0, 1, 1, 1, 'Zamanda yolculuk yapabilsen ne zamana giderdin?');

-- --------------------------------------------------------

--
-- Table structure for table `questionstatus`
--

CREATE TABLE IF NOT EXISTS `questionstatus` (
  `idquestionstatus` int(11) NOT NULL AUTO_INCREMENT,
  `approvalstage_idapprovalstage` int(11) NOT NULL,
  `arrangestage_idarrangestage` int(11) NOT NULL,
  `feedback_idfeedback` int(11) NOT NULL,
  `questionstatus` varchar(45) NOT NULL,
  PRIMARY KEY (`idquestionstatus`),
  KEY `fk_questionstatus_approvalstage1_idx` (`approvalstage_idapprovalstage`),
  KEY `fk_questionstatus_arrangestage1_idx` (`arrangestage_idarrangestage`),
  KEY `fk_questionstatus_feedback1_idx` (`feedback_idfeedback`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `questionstatus`
--

INSERT INTO `questionstatus` (`idquestionstatus`, `approvalstage_idapprovalstage`, `arrangestage_idarrangestage`, `feedback_idfeedback`, `questionstatus`) VALUES
(1, 0, 0, 0, 'New Question'),
(2, 0, 0, 0, 'Question on Development');

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE IF NOT EXISTS `sex` (
  `idsex` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsex`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`idsex`, `sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `userage_iduserbirthday` int(11) NOT NULL,
  `userrank_iduserrank` int(11) NOT NULL,
  `city_idcity` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `sex_idsex` int(11) NOT NULL,
  PRIMARY KEY (`iduser`,`userage_iduserbirthday`,`userrank_iduserrank`,`city_idcity`,`sex_idsex`),
  KEY `fk_user_userage1_idx` (`userage_iduserbirthday`),
  KEY `fk_user_userrank1_idx` (`userrank_iduserrank`),
  KEY `fk_user_city1_idx` (`city_idcity`),
  KEY `fk_user_sex1_idx` (`sex_idsex`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `userage_iduserbirthday`, `userrank_iduserrank`, `city_idcity`, `Name`, `Surname`, `Password`, `sex_idsex`) VALUES
(1, 1, 4, 3, 'Humberto', 'Coello', 'adminpass', 1),
(2, 2, 3, 7, 'Sarah Mariah', 'Ingles', 'asdf123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `userbirthday`
--

CREATE TABLE IF NOT EXISTS `userbirthday` (
  `iduserbirthday` int(11) NOT NULL AUTO_INCREMENT,
  `agegroup_idagegroup` int(11) NOT NULL,
  `userbirthday` varchar(45) NOT NULL,
  PRIMARY KEY (`iduserbirthday`,`agegroup_idagegroup`),
  KEY `fk_userage_agegroup1_idx` (`agegroup_idagegroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userbirthday`
--

INSERT INTO `userbirthday` (`iduserbirthday`, `agegroup_idagegroup`, `userbirthday`) VALUES
(1, 3, '19.09.1991'),
(2, 3, '06.09.1993');

-- --------------------------------------------------------

--
-- Table structure for table `userrank`
--

CREATE TABLE IF NOT EXISTS `userrank` (
  `iduserrank` int(11) NOT NULL AUTO_INCREMENT,
  `userrank` varchar(45) NOT NULL,
  PRIMARY KEY (`iduserrank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `userrank`
--

INSERT INTO `userrank` (`iduserrank`, `userrank`) VALUES
(1, 'Noob'),
(2, 'Beginner'),
(3, 'Solver'),
(4, 'Creator');

-- --------------------------------------------------------

--
-- Structure for view `basicuserview`
--
DROP TABLE IF EXISTS `basicuserview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`elendinAdmin`@`%` SQL SECURITY DEFINER VIEW `basicuserview` AS select `u`.`iduser` AS `iduser`,`u`.`Name` AS `Name`,`u`.`Surname` AS `Surname`,`city`.`city` AS `city`,`userbirthday`.`userbirthday` AS `userbirthday`,`r`.`userrank` AS `userrank`,`s`.`sex` AS `sex` from ((((`user` `u` join `city`) join `userrank` `r`) join `sex` `s`) join `userbirthday`) where ((`u`.`sex_idsex` = `s`.`idsex`) and (`u`.`userrank_iduserrank` = `r`.`iduserrank`) and (`u`.`userage_iduserbirthday` = `userbirthday`.`iduserbirthday`) and (`u`.`city_idcity` = `city`.`idcity`)) order by `u`.`iduser`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
