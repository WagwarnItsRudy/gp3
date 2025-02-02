-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2019 at 04:33 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `orders`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `bookingID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `performanceID` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`bookingID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cinema`
--

CREATE TABLE IF NOT EXISTS `cinema` (
  `cinemaID` int(11) NOT NULL,
  `cinemaName` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `cinemaManager` varchar(50) NOT NULL,
  PRIMARY KEY (`cinemaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cinema`
--

INSERT INTO `cinema` (`cinemaID`, `cinemaName`, `location`, `address`, `cinemaManager`) VALUES
(1, 'MICE', 'Hatfield', 'akdmkd', 'bob'),
(2, 'MICE', 'Hatfield', 'akdmkd', 'bob');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `custID` int(10) NOT NULL,
  `custName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `custAddress` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `custTown` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `custPostcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `custTel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `custEmail` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`custID`, `custName`, `custAddress`, `custTown`, `custPostcode`, `custTel`, `custEmail`) VALUES
(56, 'Foo Inc.', '23 Main St.', 'London', 'N9 3TB', '02083641248', 'enquiries@fooinc.com'),
(2, 'Freens R Us', '35 Cow Slip Hill', 'Hatfield', 'AL10 4NA', '07896541235', 'freensrus@freens.com'),
(13, 'Kevlins', '11 Southbury Rd.', 'London', 'EN1 4HB', '07789612354', 'contactus@kevlins.co.uk'),
(1, 'dty', 'dmd', 'dmhd', 'dgh', 'dghm', 'mghmg');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `filmID` int(10) NOT NULL,
  `filmName` varchar(50) NOT NULL,
  `director` varchar(50) NOT NULL,
  `dateofrelease` int(11) NOT NULL,
  PRIMARY KEY (`filmID`),
  UNIQUE KEY `filmName` (`filmName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `itemID` int(10) NOT NULL AUTO_INCREMENT,
  `itemDesc` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=901 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemID`, `itemDesc`) VALUES
(563, '56" Blue Freen'),
(851, 'Spline End (Xtra Large)'),
(652, '3" Red Freen'),
(570, 'Small Cog'),
(571, 'Large Cog'),
(900, 'Bronze bolt'),
(420, 'Spline End (Small)');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `memberID` int(8) NOT NULL,
  `Title` enum('Mr','Mrs','Ms') NOT NULL,
  `memberFirstName` varchar(30) NOT NULL,
  `memberLastName` varchar(50) NOT NULL,
  `memberStatus` enum('Active','Lapsed','Cancelled') NOT NULL,
  `dateJoined` date NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `memberID` (`memberID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `Title`, `memberFirstName`, `memberLastName`, `memberStatus`, `dateJoined`) VALUES
(1, 'Mr', 'Arudson', 'Thavarajah', 'Lapsed', '2019-03-12'),
(2, 'Mr', 'drotson', 'thev', 'Active', '2019-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `invoiceNo` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `custID` int(10) NOT NULL,
  PRIMARY KEY (`invoiceNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=128 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`invoiceNo`, `date`, `custID`) VALUES
(125, '2016-01-13', 56),
(126, '2016-09-14', 2),
(127, '2016-05-09', 13),
(124, '2015-12-15', 13);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `invoice_no` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `itemQty` int(6) NOT NULL,
  `itemPrice` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`invoice_no`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`invoice_no`, `item_id`, `itemQty`, `itemPrice`) VALUES
(125, 563, 4, '3.50'),
(125, 851, 32, '0.25'),
(125, 652, 5, '12.00'),
(126, 563, 500, '3.50'),
(126, 652, 750, '12.00'),
(127, 563, 500, '3.50'),
(127, 652, 500, '12.00'),
(124, 571, 30, '10');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE IF NOT EXISTS `performance` (
  `performanceID` int(11) NOT NULL,
  `filmID` int(11) NOT NULL,
  `filmName` varchar(50) NOT NULL,
  `screenNo` int(11) NOT NULL,
  `performDate` date NOT NULL,
  PRIMARY KEY (`performanceID`),
  UNIQUE KEY `performanceID` (`performanceID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`performanceID`, `filmID`, `filmName`, `screenNo`, `performDate`) VALUES
(1, 1, '', 1, '2019-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE IF NOT EXISTS `screen` (
  `cinemaID` int(11) NOT NULL,
  `screenNo` enum('1','2','3','4','5') NOT NULL,
  `seats` int(4) NOT NULL,
  `seatPrice` int(6) NOT NULL,
  PRIMARY KEY (`cinemaID`,`screenNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screen`
--

INSERT INTO `screen` (`cinemaID`, `screenNo`, `seats`, `seatPrice`) VALUES
(1, '1', 10, 10),
(1, '2', 10, 15),
(1, '3', 15, 15),
(1, '4', 10, 15),
(1, '5', 20, 15);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
