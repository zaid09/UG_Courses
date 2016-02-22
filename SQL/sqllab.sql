-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2016 at 06:14 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqllab`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE IF NOT EXISTS `Customers` (
  `Cnum` int(4) NOT NULL DEFAULT '0',
  `Cname` varchar(10) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `Rating` int(4) DEFAULT NULL,
  `Snum` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`Cnum`, `Cname`, `City`, `Rating`, `Snum`) VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2007, 'Pereira', 'Rome', 100, 1004),
(2008, 'Cisneros', 'San Jose', 300, 1007);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `Onum` int(4) NOT NULL DEFAULT '0',
  `Amt` double(7,2) DEFAULT NULL,
  `Odate` date DEFAULT NULL,
  `Cnum` int(4) DEFAULT NULL,
  `Snum` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`Onum`, `Amt`, `Odate`, `Cnum`, `Snum`) VALUES
(3001, 18.69, '1990-10-03', 2008, 1007),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4723.00, '1990-10-05', 2006, 1001),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `SalesPeople`
--

CREATE TABLE IF NOT EXISTS `SalesPeople` (
  `Snum` int(4) NOT NULL DEFAULT '0',
  `Sname` varchar(10) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `Comm` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SalesPeople`
--

INSERT INTO `SalesPeople` (`Snum`, `Sname`, `City`, `Comm`) VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1003, 'Axelrod', 'New York', 0.10),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`Cnum`),
  ADD KEY `Snum` (`Snum`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Onum`),
  ADD KEY `Snum` (`Snum`),
  ADD KEY `Cnum` (`Cnum`);

--
-- Indexes for table `SalesPeople`
--
ALTER TABLE `SalesPeople`
  ADD PRIMARY KEY (`Snum`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customers`
--
ALTER TABLE `Customers`
  ADD CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`Snum`) REFERENCES `SalesPeople` (`Snum`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Snum`) REFERENCES `SalesPeople` (`Snum`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`Cnum`) REFERENCES `Customers` (`Cnum`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
