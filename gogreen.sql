-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 20, 2019 at 11:53 AM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gogreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(10) NOT NULL DEFAULT '1' COMMENT '1=> Active,2 =>Inactive',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `status`, `created_at`) VALUES
(1, 'team@ripenapps.com', 'greenteam', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `assiagned_team`
--

CREATE TABLE `assiagned_team` (
  `id` int(10) NOT NULL,
  `team_id` int(10) DEFAULT NULL,
  `payment_key` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assiagned_team`
--

INSERT INTO `assiagned_team` (`id`, `team_id`, `payment_key`, `user_id`, `status`) VALUES
(2, 11, 2, 4, 1),
(3, 11, 3, 3, 1),
(4, 11, 4, 6, 1),
(5, 11, 5, 13, 1),
(6, 12, 6, 19, 1),
(7, 12, 7, 24, 1),
(8, 8, 8, 5, 1),
(9, 17, 9, 32, 1),
(10, 12, 10, 23, 1),
(11, 11, 11, 31, 1),
(12, 19, 12, 48, 1),
(13, 17, 13, 6, 1),
(14, 12, 14, 67, 1),
(15, 11, 15, 13, 1),
(16, 19, 16, 13, 1),
(17, 11, 17, 70, 1),
(18, 12, 18, 80, 1),
(19, 14, 19, 88, 1),
(20, 18, 20, 91, 1),
(21, 14, 21, 82, 1),
(22, 11, 22, 78, 1),
(23, 17, 23, 13, 1),
(24, 12, 24, 108, 1),
(25, 12, 25, 18, 1),
(26, 12, 26, 85, 1),
(27, 12, 27, 116, 1),
(28, 11, 28, 118, 1),
(29, 11, 29, 118, 1),
(30, 11, 30, 118, 1),
(31, 17, 31, 121, 1),
(32, 17, 32, 2, 1),
(33, 17, 33, 2, 1),
(34, 19, 34, 218, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booked_packages`
--

CREATE TABLE `booked_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `payment_key` int(10) NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) NOT NULL,
  `locality_id` int(10) NOT NULL,
  `street_id` int(10) NOT NULL,
  `package_name` varchar(200) DEFAULT NULL,
  `package_type` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `services` int(11) NOT NULL COMMENT '1=>interior,2=>exterior,3=>both',
  `one_time_service_date` date DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `frequency` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `coupan_applied` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=>by_default,2=>when user renew package on same car_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booked_packages`
--

INSERT INTO `booked_packages` (`id`, `user_id`, `transaction_id`, `payment_key`, `car_id`, `city_id`, `locality_id`, `street_id`, `package_name`, `package_type`, `purchase_date`, `expiry_date`, `services`, `one_time_service_date`, `days`, `frequency`, `amount`, `coupan_applied`, `status`) VALUES
(2, 4, 'COD', 2, 5, 1, 4, 100, 'Offers', 'monthly', '2018-10-31', '2018-12-01', 2, NULL, 'Sun,Mon,', '2', '100', NULL, 1),
(3, 3, 'COD', 3, 3, 1, 4, 100, 'Offers', 'once', '2018-11-01', '2018-11-04', 2, '2018-11-03', '', '0', '20', NULL, 1),
(4, 6, 'COD', 4, 8, 1, 4, 100, 'SUV-AR', 'monthly', '2018-11-01', '2018-12-01', 2, NULL, 'Sun,Mon,Tue,Wed,Sat', '2', '250', NULL, 1),
(5, 13, 'COD', 5, 11, 1, 4, 100, 'SUV-AR', 'monthly', '2018-11-02', '2018-12-02', 2, NULL, 'Sun,Mon,Tue,Wed,Thu,Sat', '2', '250', NULL, 1),
(6, 19, '1854376', 6, 13, 1, 5, 115, 'Offers', 'monthly', '2018-11-03', '2018-12-03', 2, NULL, 'Sun,Wed,', '2', '100', NULL, 1),
(7, 24, 'COD', 7, 16, 1, 5, 120, 'SUV-AR', 'monthly', '2018-11-04', '2018-12-04', 2, NULL, 'Sun,Tue,Thu', '1', '158', NULL, 1),
(8, 24, 'COD', 7, 17, 1, 5, 120, 'Saloon-AR', 'monthly', '2018-11-04', '2018-12-04', 2, NULL, 'Sun,Tue,Thu', '1', '158', NULL, 1),
(9, 5, 'COD', 8, 19, 1, 2, 83, 'Offers', 'monthly', '2018-11-04', '2018-12-04', 2, NULL, 'Sun,Wed,', '2', '105', NULL, 1),
(10, 32, 'COD', 9, 24, 1, 1, 3, 'Offers', 'monthly', '2018-11-05', '2018-12-05', 2, NULL, 'Tue,Thu,', '2', '105', NULL, 1),
(11, 23, '1862597', 10, 14, 1, 5, 120, 'Offers', 'monthly', '2018-11-06', '2018-12-06', 2, NULL, 'Sun,Wed,', '2', '105', NULL, 1),
(12, 31, '1865328', 11, 23, 1, 4, 101, 'Offers', 'monthly', '2018-11-07', '2018-12-07', 2, NULL, 'Sun,Thu,', '2', '105', NULL, 1),
(13, 48, 'COD', 12, 38, 1, 1, 34, 'Saloon-JLT/GM/DSC/SiteA', 'monthly', '2018-11-13', '2018-12-13', 2, NULL, 'Sun,Wed', '0', '105', NULL, 1),
(14, 6, 'COD', 13, 40, 1, 1, 1, 'Saloon-JLT/GM/DSC/SiteA', 'monthly', '2018-11-14', '2018-12-14', 2, NULL, 'Sun,Mon,Tue,Wed,Thu,Sat', '2', '262', NULL, 1),
(15, 67, 'COD', 14, 44, 1, 5, 115, 'SUV-AR', 'monthly', '2018-11-14', '2018-12-14', 2, NULL, 'Sun,Wed', '0', '105', NULL, 1),
(16, 13, 'COD', 15, 47, 1, 4, 100, 'SUV-AR', 'once', '2018-11-15', '2018-11-17', 3, '2018-11-16', '', '0', '83', NULL, 1),
(17, 13, '1886129', 16, 48, 1, 1, 34, 'Saloon-JLT/GM/DSC/SiteA', 'monthly', '2018-11-15', '2018-12-15', 2, NULL, 'Sun,Mon,Tue,Wed,Thu', '2', '262', NULL, 1),
(18, 70, 'COD', 17, 49, 1, 4, 102, 'SUV-AR', 'once', '2018-11-15', '2018-11-16', 2, '2018-11-15', '', '0', '30', NULL, 1),
(19, 80, '1891536', 18, 54, 1, 5, 115, 'SUV-AR', 'monthly', '2018-11-18', '2018-12-18', 2, NULL, 'Mon,Thu', '0', '105', NULL, 1),
(20, 80, '1891536', 18, 55, 1, 5, 115, 'SUV-AR', 'monthly', '2018-11-18', '2018-12-18', 2, NULL, 'Mon,Thu', '0', '105', NULL, 1),
(21, 88, 'COD', 19, 61, 1, 1, 13, 'Offers', 'monthly', '2018-11-21', '2018-12-21', 2, NULL, 'Sun,Tue,Thu,', '3', '189', NULL, 1),
(22, 91, 'COD', 20, 62, 1, 1, 46, 'Saloon-JLT/GM/DSC/SiteA', 'monthly', '2018-11-22', '2018-12-22', 2, NULL, 'Tue,Sat', '0', '105', NULL, 1),
(23, 82, '1905817', 21, 57, 1, 1, 43, 'SUV-JLT/GM/DSC/SiteA', 'monthly', '2018-11-23', '2018-12-23', 2, NULL, 'Sun,Tue', '0', '158', NULL, 1),
(24, 78, 'COD', 22, 53, 1, 4, 101, 'Offers', 'monthly', '2018-11-24', '2018-12-24', 2, NULL, 'Tue,Sat,', '2', '105', NULL, 1),
(25, 13, 'COD', 23, 65, 1, 1, 3, 'SUV-JLT/GM/DSC/SiteA', 'monthly', '2018-11-26', '2018-12-26', 2, NULL, 'Sun,Tue,Wed', '1', '189', NULL, 1),
(26, 108, 'COD', 24, 68, 1, 5, 115, 'Offers', 'monthly', '2018-11-27', '2018-12-27', 2, NULL, 'Sun,Tue,Thu,', '3', '158', NULL, 1),
(27, 108, 'COD', 24, 69, 1, 5, 115, 'Offers', 'monthly', '2018-11-27', '2018-12-27', 2, NULL, 'Sun,Tue,Thu,', '6', '158', NULL, 1),
(28, 18, '1918927', 25, 12, 1, 5, 116, 'Saloon-AR', 'monthly', '2018-11-27', '2018-12-27', 2, NULL, 'Mon,Thu', '0', '105', NULL, 1),
(29, 85, '1927852', 26, 60, 1, 5, 114, 'Saloon-AR', 'monthly', '2018-11-30', '2018-12-30', 2, NULL, 'Sun,Tue,Thu', '1', '158', NULL, 1),
(30, 116, '1930619', 27, 73, 1, 5, 115, 'Offers', 'monthly', '2018-12-01', '2019-01-01', 2, NULL, 'Mon,Thu,', '2', '105', NULL, 1),
(31, 118, 'COD', 28, 75, 1, 4, 100, 'Offers', 'monthly', '2018-12-03', '2019-01-03', 3, NULL, 'Sun,Mon,', '2', '425', NULL, 1),
(32, 118, '256297', 29, 76, 1, 4, 100, 'Offers', 'once', '2018-12-03', '2018-12-05', 2, '2018-12-04', '', '0', '30', NULL, 1),
(33, 118, 'COD', 30, 77, 1, 4, 100, 'Offers', 'monthly', '2018-12-03', '2019-01-03', 2, NULL, 'Sun,Mon,', '2', '105', NULL, 1),
(34, 121, 'COD', 31, 78, 1, 1, 1, 'Offers', 'monthly', '2018-12-04', '2019-01-04', 2, NULL, 'Sun,Mon,', '2', '158', NULL, 1),
(35, 2, '282720', 32, 4, 1, 1, 1, 'Offers', 'monthly', '2019-02-05', '2019-03-05', 2, NULL, 'Sun,Mon,Tue,', '3', '158', NULL, 1),
(36, 2, 'COD', 33, 80, 1, 1, 1, 'Offers', 'once', '2019-02-05', '2019-02-07', 2, '2019-02-06', '', '0', '30', NULL, 1),
(37, 218, '2190223', 34, 138, 1, 1, 39, 'saloon', 'once', '2019-02-04', '2109-02-06', 2, '2109-02-05', '', '', '25', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_brand`
--

CREATE TABLE `car_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_brand`
--

INSERT INTO `car_brand` (`id`, `name`, `type`) VALUES
(1, 'Acura', 'admin'),
(2, 'Alfa Romeo', 'admin'),
(3, 'Audi', 'admin'),
(4, 'BAIC', 'admin'),
(5, 'BMW', 'admin'),
(6, 'Bentley', 'admin'),
(8, 'Bugatti', 'admin'),
(9, 'Buick', 'admin'),
(10, 'CMC', 'admin'),
(11, 'Cadillac', 'admin'),
(12, 'Caterham', 'admin'),
(13, 'Changan', 'admin'),
(14, 'Chery', 'admin'),
(15, 'Chevrolet', 'admin'),
(16, 'Chrysler', 'admin'),
(17, 'Citroen', 'admin'),
(18, 'Daewoo', 'admin'),
(19, 'Daihatsu', 'admin'),
(20, 'Dodge', 'admin'),
(21, 'Ferrari', 'admin'),
(22, 'Fiat', 'admin'),
(23, 'Ford', 'admin'),
(24, 'Foton', 'admin'),
(25, 'GMC', 'admin'),
(26, 'Geely', 'admin'),
(27, 'Honda', 'admin'),
(28, 'Hummer', 'admin'),
(29, 'Hyundai', 'admin'),
(30, 'Infiniti', 'admin'),
(31, 'Isuzu', 'admin'),
(32, 'JMC', 'admin'),
(33, 'Jaguar', 'admin'),
(34, 'Jeep', 'admin'),
(35, 'Jinbei', 'admin'),
(36, 'Kia', 'admin'),
(37, 'Koenigsegg', 'admin'),
(39, 'Lada', 'admin'),
(40, 'Lamborghini', 'admin'),
(41, 'Lancia', 'admin'),
(42, 'Land Rover ', 'admin'),
(43, 'Lexus', 'admin'),
(44, 'Lincoln', 'admin'),
(45, 'Lotus', 'admin'),
(46, 'Luxgen', 'admin'),
(47, 'MG', 'admin'),
(48, 'MINI', 'admin'),
(49, 'Maserati', 'admin'),
(50, 'Maybach', 'admin'),
(51, 'Mazda', 'admin'),
(52, 'McLaren', 'admin'),
(53, 'Mercedes-Benz', 'admin'),
(54, 'Mercury', 'admin'),
(55, 'Mitsubishi', 'admin'),
(56, 'Morgan', 'admin'),
(57, 'Nissan', 'admin'),
(58, 'Opel', 'admin'),
(59, 'Other', 'admin'),
(60, 'Peugeot', 'admin'),
(61, 'Pontiac', 'admin'),
(62, 'Porsche', 'admin'),
(63, 'Proton', 'admin'),
(64, 'Renault', 'admin'),
(65, 'Rolls Royce', 'admin'),
(66, 'Rover', 'admin'),
(67, 'Saab', 'admin'),
(68, 'Seat', 'admin'),
(69, 'Shenlong/Sunlong', 'admin'),
(70, 'Skoda', 'admin'),
(71, 'Smart', 'admin'),
(72, 'Ssang Yong', 'admin'),
(73, 'Subaru', 'admin'),
(74, 'Suzuki', 'admin'),
(75, 'TATA', 'admin'),
(76, 'Tesla', 'admin'),
(77, 'Toyota', 'admin'),
(78, 'Volkswagen', 'admin'),
(79, 'Volvo', 'admin'),
(80, 'Wiesmann', 'admin'),
(82, 'GAC Gonow', 'admin'),
(83, 'McLaren', 'admin'),
(85, 'Aston Martin', 'admin'),
(86, 'JAC', 'admin'),
(87, 'kjojoijijijijkijiuhkmiuibhjokp[]\\', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `car_detail`
--

CREATE TABLE `car_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `parking_number` varchar(100) DEFAULT NULL,
  `apartment_number` varchar(100) DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `locality_id` int(10) UNSIGNED DEFAULT NULL,
  `street_id` int(10) UNSIGNED DEFAULT NULL,
  `is_package` int(10) NOT NULL DEFAULT '1' COMMENT '1=>package_not_active,2=>package_active',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_detail`
--

INSERT INTO `car_detail` (`id`, `user_id`, `brand`, `model`, `type`, `reg_no`, `color`, `parking_number`, `apartment_number`, `city_id`, `locality_id`, `street_id`, `is_package`, `status`) VALUES
(2, 3, '3', '54', 'SUV', 'Q1244', 'Burgundy', 'F', '12', 1, 4, 103, 1, 2),
(3, 3, '3', '51', 'Saloon', 'BG7015', 'Blue', 'NA', 'V012', 1, 4, 100, 1, 1),
(4, 2, '21', '22', 'Saloon', 'EF124HF', 'Gray', '', '7', 1, 2, 84, 2, 1),
(5, 4, '14', '12', 'SUV', 'M29821', 'Black', '', '12', 1, 4, 100, 1, 1),
(6, 9, '2', '48', 'Saloon', 'O6767', 'Black', '67', '1403', 1, 1, 34, 1, 1),
(7, 6, '23', '152', 'SUV', 'F12', 'Blue', 'g', '1', 1, 1, 1, 1, 2),
(8, 6, '3', '54', 'SUV', 'S124', 'Brown', '', 'g', 1, 4, 100, 1, 1),
(9, 12, '3', '58', 'SUV', 'S54536', 'Orange', '67', '123', 1, 6, 98, 1, 1),
(10, 12, '5', '88', 'SUV', 'at535', 'Gold', '54', '45', 1, 4, 100, 1, 1),
(11, 13, '77', '270', 'SUV', 'M29821', 'Black', '', 'villa 12, Street 1', 1, 4, 100, 1, 1),
(12, 18, '51', '425', 'Saloon', 'V68385', 'White', '', '135', 1, 5, 116, 1, 1),
(13, 19, '20', '208', 'SUV', 'E85781', 'Gray', 'Garage', '35', 1, 5, 115, 1, 1),
(14, 23, '57', '356', 'SUV', 'K27613', 'Red', '', '177', 1, 5, 120, 1, 1),
(15, 23, '3', '63', 'SUV', 'V22869', 'Brown', '', '177', 1, 5, 120, 1, 1),
(16, 24, '66', '317', 'SUV', 'E75512', 'Brown', 'villa', 'V 176', 1, 5, 120, 1, 1),
(17, 24, '30', '253', 'Saloon', 'M99763', 'Other Color', 'Villa', 'V 176', 1, 5, 120, 1, 1),
(18, 26, '27', '106', 'Saloon', 'D24951', 'White', 'E12', '12', 1, 1, 1, 1, 1),
(19, 5, '57', '351', 'Saloon', 'V14649', 'Gray', '3', '101', 1, 2, 83, 1, 1),
(20, 28, '3', '58', 'SUV', 'G68876', 'Brown', '', '2082', 1, 1, 72, 1, 1),
(21, 29, '57', '354', 'SUV', 'G500', 'Orange', '', '1001', 1, 1, 69, 1, 1),
(22, 30, '5', '77', 'Saloon', 'T57786', 'White', '', '39', 1, 4, 108, 1, 1),
(23, 31, '78', '284', 'SUV', 'AD1513837', 'Other Color', 'Villa38', '38', 1, 4, 101, 1, 1),
(24, 32, '48', '413', 'Saloon', 'S69657', 'Gold', '6', '123', 1, 1, 3, 1, 1),
(25, 36, '42', '402', 'SUV', 'J63352', 'White', '00', 'Villa 91', 1, 5, 119, 1, 1),
(26, 8, '5', '88', 'SUV', 'F62390', 'Silver', '818', '508', 1, 5, 117, 1, 1),
(27, 31, '78', '284', 'SUV', 'AD13837', 'Other Color', '38', '38', 1, 4, 101, 1, 1),
(28, 39, '53', '386', 'Saloon', 'B55690', 'Silver', '2401', '907', 1, 1, 68, 1, 1),
(29, 40, '2', '44', 'SUV', 'B12345', 'Black', '00', '2', 1, 4, 104, 1, 1),
(30, 41, '43', '434', 'Saloon', 'P70528', 'Black', 'B157', '107', 1, 2, 90, 1, 1),
(31, 52, '6', '6', 'SUV', 'K400', 'Blue', 'Private', '34', 1, 4, 110, 1, 1),
(32, 51, '3', '56', 'Saloon', 'D5628', 'Brown', '12', '2495', 1, 1, 1, 1, 1),
(33, 53, '77', '277', 'SUV', 'Q21154', 'Gray', '3133', '1908', 1, 1, 42, 1, 1),
(34, 54, '78', '284', 'SUV', 'Q96062', 'Gray', '23', '3603', 1, 1, 42, 1, 1),
(35, 54, '53', '383', 'Saloon', 'Q96781', 'Silver', '24', '3603', 1, 1, 42, 1, 1),
(36, 55, '27', '103', 'Saloon', 'F1526', 'Gray', '12', '13', 1, 4, 100, 1, 1),
(37, 62, '43', '433', 'SUV', 'V13477', 'White', '', '701', 1, 1, 68, 1, 1),
(38, 48, '27', '103', 'Saloon', 'G13656', 'Blue', 'Basement', '141010', 1, 1, 34, 1, 1),
(39, 6, '3', '51', 'Saloon', 'DL789', 'Brown', '', '99', 1, 1, 1, 1, 1),
(40, 6, '5', '75', 'Saloon', 'DGJ457', 'Orange', '', '789', 1, 1, 1, 1, 1),
(41, 63, '36', '390', 'Saloon', 'P33279', 'Red', '', '100', 1, 3, 93, 1, 1),
(42, 64, '51', '427', 'Saloon', 'I47084', 'Black', '', 'royal residence 1', 1, 3, 94, 1, 1),
(43, 66, '36', '392', 'Saloon', 'ADH55816', 'Silver', '1049', '102', 1, 1, 64, 1, 1),
(44, 67, '44', '409', 'SUV', '37340DUBAI', 'Gold', '', '75', 1, 5, 115, 1, 1),
(45, 30, '55', '375', 'SUV', 'C57786', 'White', '', '39', 1, 4, 108, 1, 1),
(46, 30, '53', '383', 'Saloon', 'L57786', 'Black', '', '39', 1, 4, 108, 1, 1),
(47, 13, '43', '435', 'SUV', 'Q60428', 'Gold', '', 'villa 12', 1, 4, 100, 1, 2),
(48, 13, '77', '272', 'Saloon', 'M29821', 'Black', '', '1410', 1, 1, 34, 1, 1),
(49, 70, '34', '36', 'SUV', 'N80052', 'Black', '', 'street 2 Villa 10', 1, 4, 102, 1, 1),
(50, 72, '77', '286', 'Saloon', 'G90413', 'Red', '0000', '608', 1, 1, 64, 1, 1),
(51, 75, '15', '177', 'Saloon', 'R72799', 'Silver', 'nothing', 'zabeel 2', 1, 1, 20, 1, 1),
(52, 76, '33', '147', 'Saloon', 'M55410', 'Gray', '', '298', 1, 6, 99, 1, 1),
(53, 78, '3', '62', 'SUV', 'H41988', 'Black', '', '138', 1, 4, 101, 1, 1),
(54, 80, '55', '375', 'SUV', 'R62961', 'White', '92', '92', 1, 5, 115, 1, 1),
(55, 80, '55', '375', 'SUV', 'P86604', 'White', '92', '92', 1, 5, 115, 1, 1),
(56, 81, '27', '103', 'Saloon', 'Q88257', 'Blue', '', '108', 1, 1, 37, 1, 1),
(57, 82, '15', '191', 'SUV', 'G25295', 'Black', '', '203', 1, 1, 43, 1, 1),
(58, 83, '57', '352', 'SUV', 'T33040', 'Brown', '337a', '34', 1, 2, 84, 1, 1),
(59, 84, '43', '434', 'Saloon', 'F65035', 'White', '', '24/06', 1, 1, 5, 1, 1),
(60, 85, '3', '59', 'Saloon', 'N14642', 'Silver', '46', '46', 1, 5, 114, 1, 1),
(61, 88, '3', '63', 'SUV', '14296SHJ', 'Brown', '1043', '2706', 1, 1, 13, 1, 1),
(62, 91, '5', '76', 'Saloon', 'T29767', 'Gray', '', '905', 1, 1, 46, 1, 1),
(63, 97, '34', '36', 'SUV', 'D31203', 'Black', '2036', '2003', 1, 1, 73, 1, 1),
(64, 102, '62', '330', 'SUV', 'P79500', 'Brown', '57', '1111', 1, 2, 83, 1, 1),
(65, 13, '3', '55', 'SUV', 'D12345', 'Blue', '', '104', 1, 1, 3, 1, 1),
(66, 105, '77', '275', 'Saloon', 'O15547', 'Gold', 'F', '101', 1, 4, 100, 1, 1),
(67, 107, '77', '275', 'Saloon', 'M20125', 'Gray', 'differs', '186', 1, 1, 40, 1, 1),
(68, 108, '5', '76', 'Saloon', 'R96880', 'Silver', '', '118', 1, 5, 115, 1, 1),
(69, 108, '48', '414', 'Saloon', 'U91375', 'Gray', '', '118', 1, 5, 115, 1, 1),
(70, 32, '3', '51', 'Saloon', 'EB92504', 'White', 'P1', '101', 1, 1, 37, 1, 1),
(71, 64, '15', '194', 'SUV', 'P47513', 'Red', '36', 'royal', 1, 3, 95, 1, 1),
(72, 112, '3', '56', 'Saloon', 'V61134', 'Black', '3131', '605', 1, 1, 63, 1, 1),
(73, 116, '77', '270', 'SUV', '8283RBJ', 'Silver', '1', '115', 1, 5, 115, 1, 1),
(74, 117, '5', '73', 'Saloon', 'L42358', 'Red', '3188', '109', 1, 1, 64, 1, 1),
(75, 118, '1', '39', 'SUV', 'ZHFJGOVWU6', 'Brown', 'Cgkp', 'Gxhcgjph', 1, 4, 100, 1, 1),
(76, 118, '1', '39', 'SUV', 'R7UFVHVJ35', 'Brown', 'Stuck', 'Gxhcgjph', 1, 4, 100, 1, 1),
(77, 118, '1', '39', 'SUV', 'XGHXUF457', 'Brown', 'Vvjo', 'Gxhcgjph', 1, 4, 100, 1, 1),
(78, 121, '1', '40', 'SUV', 'HSGSVS1133', 'Burgundy', 'Gssgsv', 'Zhhshs', 1, 1, 1, 1, 1),
(79, 5, '3', '51', 'SUV', 'M1234', 'Blue', '', '12', 1, 2, 3, 1, 1),
(80, 2, '1', '39', 'SUV', 'YHH12', 'Brown', 'Jvv', 'Gsgs', 1, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`id`, `brand_id`, `name`, `type`) VALUES
(2, 2, 'Other', 'admin'),
(3, 3, 'Other', 'admin'),
(4, 4, 'Other', 'admin'),
(5, 5, 'Other', 'admin'),
(6, 6, 'Other', 'admin'),
(9, 10, 'Other', 'admin'),
(10, 10, 'Other', 'admin'),
(11, 12, 'Other', 'admin'),
(12, 14, 'Other', 'admin'),
(13, 15, 'Other', 'admin'),
(14, 14, 'Other', 'admin'),
(15, 9, 'Other', 'admin'),
(16, 11, 'Other', 'admin'),
(17, 13, 'Other', 'admin'),
(18, 16, 'Other', 'admin'),
(19, 17, 'Other', 'admin'),
(20, 19, 'Other', 'admin'),
(21, 20, 'Other', 'admin'),
(22, 21, 'Other', 'admin'),
(23, 22, 'Other', 'admin'),
(24, 23, 'Other', 'admin'),
(25, 25, 'Other', 'admin'),
(26, 24, 'Other', 'admin'),
(27, 26, 'Other', 'admin'),
(28, 25, 'Other', 'admin'),
(29, 27, 'Other', 'admin'),
(30, 28, 'Other', 'admin'),
(31, 28, 'Other', 'admin'),
(32, 29, 'Other', 'admin'),
(33, 30, 'Other', 'admin'),
(34, 31, 'Other', 'admin'),
(35, 33, 'Other', 'admin'),
(36, 34, 'Other', 'admin'),
(37, 35, 'Other', 'admin'),
(38, 33, 'Other', 'admin'),
(39, 1, 'MDXmf fjfnfrjvgrnejvrnjgvrnfi43jnj4i3f34or-', 'admin'),
(40, 1, 'NSX', 'admin'),
(41, 1, 'RSX', 'admin'),
(42, 2, '145/146/147', 'admin'),
(43, 2, '156/159', 'admin'),
(44, 2, '4C', 'admin'),
(45, 2, 'Giulietta', 'admin'),
(46, 2, 'GTV/GT', 'admin'),
(47, 2, 'Giulia', 'admin'),
(48, 2, 'Mito', 'admin'),
(49, 2, 'Spider', 'admin'),
(50, 2, 'Stelvio', 'admin'),
(51, 3, 'A1', 'admin'),
(55, 3, 'A3', 'admin'),
(56, 3, 'A4', 'admin'),
(57, 3, 'A5', 'admin'),
(58, 3, 'A6', 'admin'),
(59, 3, 'A7', 'admin'),
(60, 3, 'A8', 'admin'),
(61, 3, 'Q3', 'admin'),
(62, 3, 'Q5', 'admin'),
(63, 3, 'Q7', 'admin'),
(64, 3, 'R8', 'admin'),
(65, 3, 'S3/RS3', 'admin'),
(66, 3, 'S4/RS4', 'admin'),
(67, 3, 'S5/RS5', 'admin'),
(68, 3, 'S6/RS6', 'admin'),
(69, 3, 'S7/RS7', 'admin'),
(70, 3, 'S8', 'admin'),
(71, 3, 'TT', 'admin'),
(72, 4, 'A1', 'admin'),
(73, 5, '1-Series', 'admin'),
(74, 5, '2-Series', 'admin'),
(75, 5, '3-Series', 'admin'),
(76, 5, '4-Series', 'admin'),
(77, 5, '5-Series', 'admin'),
(78, 5, '6-Series', 'admin'),
(79, 5, '7-Series', 'admin'),
(80, 5, 'M-Coupe', 'admin'),
(81, 5, 'M2', 'admin'),
(82, 5, 'M3', 'admin'),
(83, 5, 'M4', 'admin'),
(84, 5, 'M5', 'admin'),
(85, 5, 'M6', 'admin'),
(86, 5, 'X1', 'admin'),
(87, 5, 'X2', 'admin'),
(88, 5, 'X3', 'admin'),
(89, 5, 'X4', 'admin'),
(90, 5, 'X5', 'admin'),
(91, 5, 'X6', 'admin'),
(92, 5, 'Z3', 'admin'),
(93, 5, 'Z4', 'admin'),
(94, 5, 'Z8', 'admin'),
(95, 5, 'i8', 'admin'),
(96, 8, 'Arnage', 'admin'),
(98, 8, 'Bentayga ‬', 'admin'),
(99, 8, 'Continental', 'admin'),
(100, 8, 'Continental GT', 'admin'),
(101, 8, 'Flying Spur', 'admin'),
(102, 8, 'Mulsanne', 'admin'),
(103, 27, 'Accord', 'admin'),
(104, 27, 'CR-V', 'admin'),
(105, 27, 'City', 'admin'),
(106, 27, 'Civic', 'admin'),
(107, 27, 'Crosstour', 'admin'),
(108, 27, 'Jazz', 'admin'),
(109, 27, 'MR-V', 'admin'),
(110, 27, 'Odyssey', 'admin'),
(111, 27, 'Pilot', 'admin'),
(112, 27, 'Prelude', 'admin'),
(113, 27, 'S2000', 'admin'),
(114, 28, 'H1', 'admin'),
(115, 28, 'H2', 'admin'),
(116, 28, 'H3', 'admin'),
(117, 28, 'H3T', 'admin'),
(118, 29, 'Accent', 'admin'),
(119, 29, 'Azera', 'admin'),
(120, 29, 'Centennial ‬ ‫', 'admin'),
(121, 29, 'Coupe', 'admin'),
(122, 29, 'Creta ‬ ‫', 'admin'),
(123, 29, 'Elantra', 'admin'),
(124, 29, 'Entourage', 'admin'),
(125, 29, 'Galloper', 'admin'),
(126, 29, 'Genesis', 'admin'),
(127, 29, 'Getz', 'admin'),
(128, 29, 'Grandeur', 'admin'),
(129, 29, 'H1', 'admin'),
(130, 29, 'Matrix', 'admin'),
(131, 29, 'Santa Fe', 'admin'),
(132, 29, 'Sonata', 'admin'),
(133, 29, 'Trajet', 'admin'),
(134, 29, 'Tucson', 'admin'),
(135, 29, 'Veloster ‬ ‫', 'admin'),
(136, 29, 'Velacruz', 'admin'),
(137, 29, 'i10', 'admin'),
(138, 29, 'i30', 'admin'),
(139, 29, 'i40', 'admin'),
(140, 33, 'E-Type', 'admin'),
(141, 33, 'F-Pace', 'admin'),
(142, 33, 'F-Type', 'admin'),
(143, 33, 'S-Type', 'admin'),
(144, 33, 'X-Type', 'admin'),
(145, 33, 'XE', 'admin'),
(146, 33, 'XF', 'admin'),
(147, 33, 'XJ-Series', 'admin'),
(148, 33, 'XK', 'admin'),
(149, 33, 'XKR', 'admin'),
(150, 23, 'Crown Victoria ‬ ‫', 'admin'),
(151, 23, 'Eco Sport', 'admin'),
(152, 23, 'Edge', 'admin'),
(153, 23, 'Escape', 'admin'),
(154, 23, 'Excursion ‬ ‫', 'admin'),
(155, 23, 'Expedition', 'admin'),
(156, 23, 'Explorer', 'admin'),
(157, 23, 'F-Series Pickup ‬ ‫', 'admin'),
(158, 23, 'Fiesta', 'admin'),
(159, 23, 'Figo', 'admin'),
(160, 23, 'Five Hundred', 'admin'),
(161, 23, 'Flex', 'admin'),
(162, 23, 'Focus', 'admin'),
(163, 23, 'Fusion', 'admin'),
(164, 23, 'GT', 'admin'),
(165, 23, 'Mondeo', 'admin'),
(166, 23, 'Mustang', 'admin'),
(167, 23, 'Ranger', 'admin'),
(168, 23, 'Taurus', 'admin'),
(169, 23, 'Thunderbird', 'admin'),
(170, 23, 'Van', 'admin'),
(171, 15, 'Astro', 'admin'),
(172, 15, 'Avalanche', 'admin'),
(173, 15, 'Aveo', 'admin'),
(174, 15, 'Camaro', 'admin'),
(175, 15, 'Caprice', 'admin'),
(176, 15, 'Captiva', 'admin'),
(177, 15, 'Corvette', 'admin'),
(178, 15, 'Cruze', 'admin'),
(179, 15, 'Express', 'admin'),
(180, 15, 'HHR', 'admin'),
(181, 15, 'Impala', 'admin'),
(182, 15, 'Lumina', 'admin'),
(183, 15, 'Malibu', 'admin'),
(184, 15, 'Optra', 'admin'),
(185, 15, 'PickUp', 'admin'),
(186, 15, 'SSR', 'admin'),
(187, 15, 'Silverado', 'admin'),
(188, 15, 'Sonic', 'admin'),
(189, 15, 'Spark', 'admin'),
(190, 15, 'Suburban', 'admin'),
(191, 15, 'Tahoe', 'admin'),
(192, 15, 'Trailblazer', 'admin'),
(193, 15, 'Transverse', 'admin'),
(194, 15, 'Trax', 'admin'),
(195, 15, 'Uplander', 'admin'),
(196, 22, '500', 'admin'),
(197, 22, 'Linea', 'admin'),
(198, 19, 'Charade ‬ ‫', 'admin'),
(199, 19, 'Grand Max', 'admin'),
(200, 19, 'Sirion ‬ ‫', 'admin'),
(201, 19, 'Terios ‬ ‫', 'admin'),
(202, 20, 'Avenger ‬ ‫', 'admin'),
(203, 20, 'Caliber', 'admin'),
(204, 20, 'Caravan', 'admin'),
(205, 20, 'Chalenger', 'admin'),
(206, 20, 'Charger', 'admin'),
(207, 20, 'Dart', 'admin'),
(208, 20, 'Durango', 'admin'),
(209, 20, 'Magnum', 'admin'),
(210, 20, 'Neon', 'admin'),
(211, 20, 'Nitro', 'admin'),
(212, 20, 'PickUp', 'admin'),
(213, 20, 'Ram', 'admin'),
(214, 20, 'Viper', 'admin'),
(215, 17, 'Berlingo', 'admin'),
(216, 16, '200/200C EV ‬ ‫', 'admin'),
(217, 16, '300M/300C ‬ ‫', 'admin'),
(218, 16, 'Crossfire', 'admin'),
(219, 16, 'PT Cruiser', 'admin'),
(220, 16, 'Prowler', 'admin'),
(221, 16, 'Sebring', 'admin'),
(222, 16, 'Voyager / Caravan', 'admin'),
(223, 11, 'ATS', 'admin'),
(224, 11, 'BLS', 'admin'),
(225, 11, 'CT6', 'admin'),
(226, 11, 'CTS/Catera ‬ ‫', 'admin'),
(227, 11, 'DTS/De Ville ‬ ‫', 'admin'),
(228, 11, 'Escalade', 'admin'),
(229, 11, 'SRX ‬ ‫', 'admin'),
(230, 11, 'STS/Seville ‬ ‫', 'admin'),
(231, 11, 'XT5 ‬ ‫', 'admin'),
(232, 11, 'XTR/Eldorado ‬ ‫', 'admin'),
(233, 11, 'XTS', 'admin'),
(234, 25, 'Acadia ‬ ‫', 'admin'),
(235, 25, 'Envoy', 'admin'),
(236, 25, 'Pick Up', 'admin'),
(237, 25, 'Savana', 'admin'),
(238, 25, 'Sierra', 'admin'),
(239, 25, 'Suburban', 'admin'),
(240, 25, 'Terrain', 'admin'),
(241, 25, 'Yukon', 'admin'),
(242, 82, 'Other', 'admin'),
(243, 8, 'Chiron', 'admin'),
(244, 8, 'Veyron', 'admin'),
(245, 30, 'EX35 ‬ ‫', 'admin'),
(246, 30, 'FX45/FX35 ‬ ‫', 'admin'),
(247, 30, 'FX50 ‬ ‫', 'admin'),
(248, 30, 'G-Series ‬ ‫', 'admin'),
(249, 30, 'G25 ‬ ‫', 'admin'),
(250, 30, 'J30 ‬ ‫', 'admin'),
(251, 30, 'JX-Series ‬ ‫', 'admin'),
(252, 30, 'M-Series ‬ ‫', 'admin'),
(253, 30, 'Q30 ', 'admin'),
(254, 30, 'Q45 ‬ ‫', 'admin'),
(255, 30, 'Q50', 'admin'),
(256, 30, 'Q60', 'admin'),
(257, 30, 'Q70', 'admin'),
(258, 30, 'QX50', 'admin'),
(259, 30, 'QX56', 'admin'),
(260, 30, 'QX60', 'admin'),
(261, 30, 'QX70', 'admin'),
(262, 30, 'QX80', 'admin'),
(263, 14, 'E5', 'admin'),
(264, 14, 'Tiggo 3', 'admin'),
(265, 14, 'Tiggo 5', 'admin'),
(266, 77, '86', 'admin'),
(267, 77, 'XA ‬ ‫', 'admin'),
(268, 77, 'Tundra ‬ ‫', 'admin'),
(269, 77, 'Sequoia ‬ ‫', 'admin'),
(270, 77, 'Prado ‬ ‫', 'admin'),
(271, 77, 'Innova ‬ ‫', 'admin'),
(272, 77, 'Land Cruiser ‬ ‫', 'admin'),
(273, 77, 'Avalon ‬ ‫', 'admin'),
(274, 77, 'Camry ‬ ‫', 'admin'),
(275, 77, 'Corolla ‬ ‫', 'admin'),
(276, 77, 'FJ Cruiser ‬ ‫', 'admin'),
(277, 77, 'Fortuner ‬ ‫', 'admin'),
(278, 77, 'Rav 4 ‬ ‫', 'admin'),
(279, 78, 'Beetle ‬ ‫', 'admin'),
(280, 78, 'GTI ‬ ‫', 'admin'),
(281, 78, 'Golf ‬ ‫', 'admin'),
(282, 78, 'Passat ‬ ‫', 'admin'),
(283, 78, 'Tiguan ‬ ‫', 'admin'),
(284, 78, 'Touareg ‬ ‫', 'admin'),
(285, 78, 'Other ‬ ‫', 'admin'),
(286, 77, 'Other', 'admin'),
(287, 59, 'Other', 'admin'),
(288, 79, 'Other', 'admin'),
(289, 79, 'S-Class ', 'admin'),
(290, 79, 'XC60 ‬ ‫', 'admin'),
(291, 79, 'XC90 ‬ ‫', 'admin'),
(292, 76, 'S', 'admin'),
(293, 76, 'X', 'admin'),
(294, 76, 'Other', 'admin'),
(295, 75, 'Other', 'admin'),
(296, 74, 'Celerio ‬ ‫', 'admin'),
(297, 74, 'Grand Vitara ‬ ‫', 'admin'),
(298, 74, 'Jimny ‬ ‫', 'admin'),
(299, 74, 'SX4 ‬ ‫', 'admin'),
(300, 74, 'Swift ‬ ‫', 'admin'),
(301, 74, 'Vitara ‬ ‫', 'admin'),
(302, 74, 'XL7 ‬ ‫', 'admin'),
(303, 74, 'Other ‬ ‫', 'admin'),
(304, 73, 'Other', 'admin'),
(305, 73, 'Forester ‬ ‫', 'admin'),
(306, 69, 'Other', 'admin'),
(307, 71, 'Other', 'admin'),
(308, 69, 'Other', 'admin'),
(309, 70, 'Fabia ‬ ', 'admin'),
(310, 70, 'Other', 'admin'),
(311, 70, '‫	Superb ‬ ‫', 'admin'),
(312, 70, 'Octavia', 'admin'),
(313, 68, 'Ibiza ‬ ‫', 'admin'),
(314, 68, 'Leon ‬ ‫', 'admin'),
(315, 68, 'Other', 'admin'),
(316, 67, 'Other', 'admin'),
(317, 66, 'Other', 'admin'),
(318, 65, 'Other', 'admin'),
(319, 64, 'Clio ‬ ‫', 'admin'),
(320, 64, 'Duster ‬ ‫', 'admin'),
(321, 64, 'Koleos ‬ ‫', 'admin'),
(322, 64, 'Megane ‬ ‫', 'admin'),
(323, 64, 'Safrane ‬ ‫', 'admin'),
(324, 64, 'Symbol ‬ ‫', 'admin'),
(325, 64, 'Other ‬ ‫', 'admin'),
(326, 63, 'Other', 'admin'),
(327, 62, '918 Spyder ‬ ‫', 'admin'),
(328, 62, 'Boxster ‬ ‫', 'admin'),
(329, 62, 'Carrera / 911 ‬ ‫', 'admin'),
(330, 62, 'Cayenne ‬ ‫', 'admin'),
(331, 62, 'Cayman ‬ ‫', 'admin'),
(332, 62, 'Other ‬ ‫', 'admin'),
(333, 61, 'Other', 'admin'),
(334, 60, '206', 'admin'),
(335, 60, '207', 'admin'),
(336, 60, '208', 'admin'),
(337, 60, '3008', 'admin'),
(338, 60, '308', 'admin'),
(339, 60, '407', 'admin'),
(340, 60, '5008', 'admin'),
(341, 60, 'Other', 'admin'),
(342, 58, 'Astra', 'admin'),
(343, 58, 'Corsa', 'admin'),
(344, 58, 'Insignia', 'admin'),
(345, 58, 'Omega', 'admin'),
(346, 58, 'Other', 'admin'),
(347, 32, 'Other', 'admin'),
(348, 57, 'Altima', 'admin'),
(349, 57, 'Xterra ‬ ‫', 'admin'),
(350, 57, 'X-Trail ‬ ‫', 'admin'),
(351, 57, 'Sunny ‬ ‫', 'admin'),
(352, 57, 'Tiida ‬ ‫', 'admin'),
(353, 57, 'Patrol ‬ ‫', 'admin'),
(354, 57, 'Qashqai ‬ ‫', 'admin'),
(355, 57, 'Sentra ‬ ‫', 'admin'),
(356, 57, 'Armada', 'admin'),
(357, 57, 'GT-R ‬ ‫', 'admin'),
(358, 57, 'Juke', 'admin'),
(359, 57, 'Maxima', 'admin'),
(360, 57, 'Mirca', 'admin'),
(361, 57, 'Murano', 'admin'),
(362, 57, 'Pathfinder', 'admin'),
(363, 57, 'Other ‬ ‫', 'admin'),
(364, 56, 'Other', 'admin'),
(365, 55, 'Other', 'admin'),
(366, 55, 'ASX', 'admin'),
(367, 55, 'Attrage ‬ ‫', 'admin'),
(368, 55, 'Eclipse ‬ ‫', 'admin'),
(369, 55, 'Galant ‬ ‫', 'admin'),
(370, 55, 'Lancer ‬ ‫', 'admin'),
(371, 55, 'Mirage ‬ ‫', 'admin'),
(372, 55, 'Montero ‬ ‫', 'admin'),
(373, 55, 'Nativa ‬ ‫', 'admin'),
(374, 55, 'Outlander ‬ ‫', 'admin'),
(375, 55, 'Pajero ‬ ‫', 'admin'),
(376, 54, 'Grand Marquis ‬ ‫', 'admin'),
(377, 54, 'Milan ‬ ‫', 'admin'),
(378, 54, 'Montego ‬ ‫', 'admin'),
(379, 54, 'Mountaineer ‬ ‫', 'admin'),
(380, 54, 'Other', 'admin'),
(381, 28, 'Other', 'admin'),
(382, 53, 'B-Class', 'admin'),
(383, 53, 'C-Class', 'admin'),
(384, 53, 'S-Class', 'admin'),
(385, 53, 'GLS', 'admin'),
(386, 53, 'Other', 'admin'),
(387, 36, 'Carens ‬ ‫', 'admin'),
(388, 36, 'Mohave ‬ ‫', 'admin'),
(389, 36, 'Oprius ‬ ‫', 'admin'),
(390, 36, 'Optima ‬ ‫', 'admin'),
(391, 36, 'Picanto ‬ ‫', 'admin'),
(392, 36, 'Rio ‬ ‫', 'admin'),
(393, 36, 'Sorento ‬ ‫', 'admin'),
(394, 36, 'Soul ‬ ‫', 'admin'),
(395, 36, 'Sportage ‬ ‫', 'admin'),
(396, 36, 'Other', 'admin'),
(397, 40, 'Other', 'admin'),
(399, 41, 'Other', 'admin'),
(400, 39, 'Other', 'admin'),
(401, 42, 'Defender ‬ ‫', 'admin'),
(402, 42, 'Discovery ‬ ‫', 'admin'),
(403, 42, 'Evoque ‬ ‫', 'admin'),
(404, 42, 'LR2 ‬ ‫', 'admin'),
(405, 42, 'LR3', 'admin'),
(406, 42, 'LR4', 'admin'),
(407, 42, 'Other', 'admin'),
(408, 43, 'Other', 'admin'),
(409, 44, 'Other', 'admin'),
(410, 45, 'Other', 'admin'),
(411, 47, 'Other', 'admin'),
(412, 48, 'Clubman ‬ ‫', 'admin'),
(413, 48, 'Cooper ‬ ‫', 'admin'),
(414, 48, 'Countryman ‬ ‫', 'admin'),
(415, 48, 'Paceman ‬ ‫', 'admin'),
(416, 48, 'Roadster ‬ ‫', 'admin'),
(417, 48, 'Other', 'admin'),
(418, 49, 'Levante ‬ ‫', 'admin'),
(419, 49, 'Spyder ‬ ‫', 'admin'),
(420, 49, 'Other', 'admin'),
(421, 51, '3', 'admin'),
(422, 51, 'CX-3', 'admin'),
(423, 51, 'CX-5', 'admin'),
(424, 51, 'CX-7', 'admin'),
(425, 51, 'CX-9', 'admin'),
(426, 51, 'MPV', 'admin'),
(427, 51, 'Other', 'admin'),
(428, 50, 'Other', 'admin'),
(429, 52, 'Other', 'admin'),
(431, 43, 'ES-Series ‬ ‫', 'admin'),
(432, 43, 'GS-Series ‬ ‫', 'admin'),
(433, 43, 'GX-Series ‬ ‫', 'admin'),
(434, 43, 'IS-Series ‬ ‫', 'admin'),
(435, 43, 'LX-Series ‬ ‫', 'admin'),
(436, 43, 'RX-Series ‬ ‫', 'admin'),
(437, 43, 'SC-Series ‬ ‫', 'admin'),
(438, 85, 'Other', 'admin'),
(439, 86, 'Other', 'admin'),
(440, 87, 'dkmekfnerifnrifnifnrfrnf', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(10) DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `status`) VALUES
(1, 'Dubai', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cleaners`
--

CREATE TABLE `cleaners` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `locality_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `image_string` longtext,
  `phone_number` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive',
  `rate_by_user` int(10) DEFAULT NULL,
  `count_who_rated` int(11) NOT NULL DEFAULT '0',
  `rating` int(255) DEFAULT '0',
  `feedback` varchar(255) DEFAULT NULL,
  `car_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `is_del` int(10) NOT NULL DEFAULT '1' COMMENT '1=>default,2=>yes_deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cleaners`
--

INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(1, 1, 1, 'JLT-DAY', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-day@gmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1);
INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(2, 1, 1, 'Akash', 'Shukla', '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\nDskLAqwskYH/2Q==\n', '9717018553', 'eeeee', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2);
INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(3, 1, 1, 'JLT-N2', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971501231234', 'jlt-n2@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2),
(4, 1, 1, 'JLT-N3', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971501231234', 'jlt-n3@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2),
(5, 1, 1, 'JLT-N4', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971501231234', 'jlt-n4@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2),
(6, 1, 1, 'JLT-N5', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971501231234', 'jlt-n5@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2),
(7, 1, 1, 'JLT-N6', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971501231234', 'jlt-n6@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 2);
INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(8, 1, 2, 'GOLDEN MILES', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'gm@gmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(9, 1, 4, 'ARABIAN RANCHES1', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxdaZBdRRXueZkkZJ2EJJBJJmMiELZMARUVJKAESRCQHSL+AEG2okoWUUBQ8QdqEJEgKApYLAFBEChBKAwGEJBYWFKAQ5A9gUzINglZyUYYz/duX3l585bT992l+/b5qk5NSJi3dJ/vnrVPN/X09CiBwHcUZAkEAqWawz90dnbKagi8Q0dHx/ZEEMSO/iRtJKNIRpKMKJE+eu2HlP3OOpKPSbaRrCyRbpIVJF0km2VpE7QIgsiu5QSSfUgmkeyq/3s8yViSppjfDwHdYpKFJAtI3iZ5leQV/d+fyJYIEdIAlPtAkoNJvkCyN8ngFN+/SVsZyEFl/7aeZD7Jv0ieI5mnSSMQIjQMuDXTSQ4n+RLJZyz+rCDk/lrO13/3HsmzJHNIntDulUCIwIufSE4iOYJksnI7swbinqoFbtOLJI+TPEAi2REhQi/sRTJDy545jmc+r+VKkv+S3K/lNQn2/EULybkk/9a+9Y9zTIJK2FN/5/l6Dc7VayJE8AR4It6mglTk77T74zsm67VAcH27XiMhQk6/5zE6cERW5QyVbrbHFQwiOV2v0bN6zQpCBPfRj+Qs7QM/rIK0p4CHg/WaYe3O0WspRHAwCYCn/uskt5LsLnodGVi7m/VanqFymmDJGxFQcPqGDgARB0wQPY4NE/Saztdr3CREsBMHqKCaeg/JRNHbxDBRr/E8veZCBEvQSjI7bxvj0IPnTr0HQoQMP/t52nc9NW+m2iFX9DS9B+e5rE+ufvA9SJ4huYlkqOhj5hiq9+IZvTdChBQ+72UkL6ve3ZeC7HGQ3pvvu6ZbLn3YcSRzSa5WwaEXgZ3A3szUezVOiBAv0AyHwydTRc+cwVS9ZzOECI2jL8kNJPeRDBfdcg7D9d7doPdSiBABY0ieVp8eMhG4i/P1Xo4RIphhigpag6eIDuUGVu+pjUQ4heRJlYMijaAXWvXeniJEqI3LVVC+l6xQftFf7/HlQoTewJyfW0h+pqRC7AOa9F7fqvdeiKCCPvd7Sc4W/fAOZ+m97+c7EXYgeYjkZNEJb3Gy1oEBvhJhIMljJEeJLngP6MCjWie8IgICJhwDPFR0QKBxqNaJ/r4QAf4gZukcJnsvKAN04k9ZxAxpEwEZAhyiOUb2XFAFR5PcpVLOJqVNhBtJvi57LaiDGVpXckmEi1Vwikkg4AC68r28EQGu0DWytwJDXJ2WG50GETBO8F5lSQVR4BT6aN2Z7DoRcL/An1WG+WGB8xiodWiUq0QAm5EmbZO9FDSINq1LfVwkwlUkh8geCmICdOmnrhHhKyqYZCAQxIlLVUKF2CSIgOtTMf1M2qkFcQM6NVvrmPVEQI/5WNkzQUJo1TpmNRG+RXK87JUgYRyvdc1KIiCyv072SJASrlMxZiTjJALu4GqR/RGkBOjazbYRAaeM5ICNIG0cqWKapBcHEXAp3yzZE0FGuF7FcDFkHES4QkmWSJAdkEX6QdZEwL1a35G9EGSMi1SD9+U1SoRfqGAShUCQJaCD12ZFBMywPFH2QGAJTlANXB7TCBGukrUXWIaZaRNhqpJLOwT2ARbhiDSJINZAYCuuTIsI05TcWyCwF7j/eXoaRPiurLXAclyWNBEmRWGbQJAyMD5yvySJcImSAzcCN3BRUkTYWVl45Y9AUAWnaJ1lodnghU9XFlzo4Cr69Omj+vfvr/r166f69u2rmpubi39XKBSKAvT09KhPPvlEbdu2rShbtmwpyubNm9XHH38si2gG6OoZKhgSFhsR4A6dJWtrBij7oEGD1IABA4pSd5GbmoqkwO8BAwd+Og4KhPjoo4/Uhg0bin8WsHAmyc/xjImLCIeQ7CrrylP+wYMHqx122IGl/OzHG1kSyLBhw4pE2LRpk1q/fn3RWgiqAjqLwu9TcRFBrAHjab7jjjuqoUOHJm/zNSnwXiDD6tWr1datW2UTqutuLESAfT5W1rM6oJB4UsPnTxuwPpA1a9YUCYEYQ7AdMER4EMmGWv8TJ2t0lH4hQfkTgnz4trY2NWLEiExIUIqWlhbV3t5e/CnYDtDdI+v9TxwiyMUeFQALsPPOOxczQLa5Z6NGjSr+WcDX4Xqu0RAOm3wLhnfaaadiKtRWwFVCoL5ixQq1ceNG2bRAh6HL66JaBMyZHCDrGADuD1whm0lQ+llHjx4da+bKYWARpjViEcQaaCAdCkvQiMuBQBbpThTLUCALf6KQFro2UGBYHdQT4HYhO9RI/AEydHd3q3Xr1vm+hTin8FBUIhwuFAjcodbW1si/D/cEaU4Uw0KlNw3KUZiDyxMFI0eOLJIQ7+8xDo9qETpIxvlOAjyZx4wZE+l3UQlGSrPRohdeB/Lhhx8Ws0JDhgwxtkywZkuWLCkW4jzFOK3TnaYxwjQhQaEYE5i6Jnj6d3V1qWXLlsVa+YUbtXLlSrVo0aIiwUwBq+ZCfJMgpkcJlg/ynQhwKUxIALdn+fLlxWxNkpVexBawDh988IFxMx4sg8eYEoUIXh/HhPsBv9wkDoAVSNMPh7XBe65du9Yo3kGdwVMcZEqE3fDw8HW1YAVgDUxcoaVLl2bSKg0rBHdp1apV7N9B0G1C8hwBT4CJJkTw2hqgYmxiCeAKZQ30GplYBrSFeIoDTYgw2ddVQjDJDSjhBsES2AITywCrl0anrIWYbEKEDl+JgF4dbsCKwNg2wDJw2yo8tQodQoQ6QDsCKsgcIDVqK0BQEFXIUBH7conQjgejWIPqQOrS5pNhqCJziQr3KDwz7QlatI7XJcIkX2MD9PXUA45JRilmpQ0QFdksDkrPRnuCSRwiTPCRCNwuTTSwuQJYLiFCRUzgEGG8EKEykLN36bA86hqcwBk1Bc8O8owXIlQAqq2cIJn7hLUJSKly4FmB7bMcIuwi1qAyTApWtgA9T5w5SJ4d4GG5Rt7dkMmxBmiDjnKWwAZwDuV4RoSxHCLsKEToDZcPtYDE9YBKs02DCBLGiHpEAAmafSJBeDSyHlw+0BIeC60HTvo4L9teToZCPabkHZynYHi22GVwiOCRRejl+RR8d4s41oDbruA6EbIeUpale1ROhCG+EYGz+a4GyeXukRChuq6XE8G7A62cQlIe5olyLIJnPUf9ahGhWYiQT+TBqsUdHtYignfn93xREJmF2gsDaxFBCRHyqUQct8dnq+E9ETj+fx58Z052zOe7Fcp32Lsb63wJIjkZIc8uLNxWiwjeDcfkNKSFQ3mFCLnCenGNyjafYxW4Z5ltjQ84rpHPt3WWE2Gtj4uQ9zZlDokRKHtGhHVChDJwGuqijmS3AZz5RVgDz7JGa2sRYYWPROC0KcO9cPFsL1K/HGvm4RVTy2sRYaWPRIBLwJlePXz4cOe+G3dEjYeXiKyqRQScTPfyWhWOIqBfnxN02hQkc90izzJG2OxNtYgALPGRCNzpFC5ZBe5sU45rmDP0GlhbiQjv+xoncNKoCJpdiBVQN+CS1kO36D0OERYoT4EBuhw0ertmGuDejOOhW1RRxysRYaHPROBYBZDA5A6FtDFs2DB2AdClyX0xYiGHCO8qj8EdiIWUJBTONmCGK9clwpiXJO96c4kIlVIgb/hMBPjL6MLk9BaFCmfLUGDELiaWikv6HOJ1jkV4TZV15vkGk7sPQAYbbp6BJTAhAcjr6fkD6PZ8DhFQYnzbZyIggORMhwuByzaydJNgCUwuRYc75OIc15jwttbxukQAOpXnQBBp0oQGyzB69OjUC264KtbEEsAK4H5mj1FRt6sR4T9KYHxbJgLocePGpeIq4b3a2tqMmwERF/h8Eq2abld7fM0TGgQ9SLiPzPS2erhKUFQE3pA4fXG4QRBciG4KpIdNXL6cYp4JEV5QwbHNZt9XDYqM4Nm0bhAqLJreME4e1zhFLVyhShwqP/fq20okMLmUPMeB8gsmRMAxtleUx/ctlwLtF8iyRAmIw1YHCFqdEYijrwmFO7gokNBioFCHtC1+4vfQ5IfCGEjQSCUbn19IUMTLquyIZj0iAP8QInyK8CbNRirKcJfKzwaUu01xt27gc7tw+WFKeL7aP9SqGv1d1q33kzXuS8ah+KUiJEgUT1f7h1oW4SkS1N/7yvptHzMsXLiw6PvbUEir5Qp52j5RDVtrEaGWRVir3SNBBdjcsYn4Iw+j7BNwi9ZEsQjAEyRTZQ0DFwaBK6yA7ecRkF2CIDBHxgo/hRhqTq1/rEeER0lm+k6AlpaWIgFcuz8AxA3bsUEIpFA9PHtQqsuRifCqCrpRd/dx5fBURdozDxdogMgQkAFBtGcNd29oXVZRYoQQ9/lGANQL0L4wcuTI3N0iA+vW3t5erH57hLo6zCHC/b6sFgpYra2tRSuQ54v1wukW6ItycVZTBNTVYU4LxXxtViblPQ5IakIFepbgm4eV5DCrE1aVSyvLAKwQBAoLCf8bRI2z1oBOWRQI0X+EekNO44dXVYXzB1GIAMwmuSaPq4RgEq3McbZPQ/HDdoqQBHE9ycO2C1So4xpMHGaZ0Hqew6a82ayHAvPF7iD5iSq7gM11oIUZJIhL+dFYh2JWUoUsWBCQC4InOMgLQgwaNCiWIcWIifCaOTq0gwMld8ZJBDTmP0xycl5cIbgEjSoPeo/wBMXTPwu3Au+J94fAdYKFaHTuEhIFINbSpUvz4CpBZ5fHSQTg1jwQAe4FAmK4GFGBJzLSkDZNiEPMEZ5/QKs2Yh4odBQgUTB27NgiGbgTAC3F79nxksGLPknyJslEV1cFT8pGUqJwffD05YyRzxJQXjQHghCwEPD/TYNsPDBwDhon2lCMcxA4mzyX/X1NXFSSa10OiuEORSEBfH6c88XRTdtJUE4IKHJXV1fkse+oN8C6OIgbtM7GTgTgbhLnRqPBRYA7FCU4RVAKRXLZRYCvDzcHRI7i96PT1rGR+DiFdLuRBTR8g42aaU65Q6ZnjgH4/yBAnsaewLVbtGgRe8ZreRDtEBl+o6qcRIuLCMBvVdn9U7a7Q6aAO4Fzynnt2MRZBZMhZqVksHHMZTnfozysoxCh2wWrgNSoqTuEWgBcCEeDQ2OLt3jxYuPMF6xClAkaKeKmKO571Otlf0li7RnAKNOqEQNAMXy6SwzEh2UwrSYj8xZ1mkbCwBeJlNCJSgQ4ztfZSgKk/UzShfCdlyzx8qKgwMR3dxvHQlhjC8kwS0W8ELORC8d/pSpcwZM1MHbRpFgGBUA2xdOBuP8HsmOmcQPW2iIs056KSpsIcKR/ZNNKIE1q0ogGSyBTHraPG0zmH6HoZtG5hh+qBu4JLzT45reRvGTDKsBMm6RJQ0sg2B5IrZpYBpxrsKDg9pLWRZUVEVC5u9CGDTQJjtGPI5agtmUwWR8U3DK+dvdCZVBFToIIwHMkf8hyFUzOFSM7JJaAZzFN0sjIJGWEe7QOqqyJAFykMmq9wJOIW+RBewF6hnwPjLlAYZFbZ0DdJoP6QrfWPWULEWL7QEm6RHGPa/QBJhm1DIYdXKwipkuTIoLS7tFf01wFWAJuqhRPN8d76zMBGg9NbthBvJASMLDrrrherBDzhztbBZ1/qYCbrUC12Ie2iaSACjS34IbzDylcxr5K65qylQhdJOemsTnwRzlXwAJRGswE28NkykWUbl9DQMcW2UwE4AHVYE43ziyFh1PdEgM3xkLreyNHYevgDq1jynYiAMjrvplkbMABnmBSL4gPiLFQjc8wVoBOXZDECydFBKzWiSSxn26H/8k9IIKWakG8QBaJc04D6dSYi2zQJQyPWOcSEQBMGDsz7hflmtwk5wv5DlTmOYg6RaMKoEuJXXtcSHjN/khyfZwvyLUG4hIlB24GKcbTbNdrXVKuEgG4RAXXUDUMFGs4Q7mQ7pOaQXJAbYGTjkZWLwarAN25NOnvlAYRkHM7gaSz0Rfi3lkmV6naYxUa7Ezt1LqzNQ9EADA24UgV1BkSJUI4gFeQvFXgTMNAe3zEEftdWmfWpPF9CimuXUNfDAduOAU0qSCnB24qNYJ7BB05utEHp61ECE0dvqBxWpW7mDbNI807YH05qVTD4tpHWkdeTvO7FDJYP/SOH6eCkd1scHLSSJfK7ZHpgpNKNTg+u0XrxnNpf49CRuv3NxUUR1hkCK92rYccXnKRC/cI2T7GxAvowgytG8oXIgCPqKD6XHeqLhaREx9wCz2C+IA0NbfSXAPQgZNUcJ+B8o0IAO6+/Rp0uFHTCrfI4zuEXXaPNmgd+EuW36FgwTri3oXpqsbkPA4RxBpkB06CAntY4ZwC9vxwrQPKdyIA80gOJnk/atZBKsnZgXNnBEhQVk94X+/58zZ8h4JF64kmvQNIXiz9Sywe5xysSxd45A0478F5EJUEzC/qvX7Vlu9QsGxNMYD0kFJ/kVOVRD4blU5BduB0+mrLjr39st5rJUSoDuTjkEueiYcNxy2SIDl7MB5EPc3NzTP13loX0BVsXVeSK0hOpsWr2zMhRbTsUWcPsIczyMW9QjU4kc43IoR4kBbvc6pOuV3OJFtNBOwd9vCBFKZb5JYICJTfoh9fJLkROi8WwZkYoUfvGfburaKyFQpChMgfMFg8pIRwaPuoSkGWEMG6GGGJ3qsLVEnngFiExokQ4nGSSapswplkjKwiwl16jx536fO74BqV/xWOn51G8lWSBRIjWEOEBXpPTlNVph2mPBc1X0SA2wNFryBzSDpIZtEmSP40O2DtZ2EvaK/mVNmrotjswjaFT9POzk6XN2Mvkl+TTBW9TBVPk3yb5DVXv0BHR4cbFoEJbMShJMe6vCmOrfdxes1zsd6FnG0QzjjsQ/JNkndFX2PHu3ptscYP5+mLFXK4WfBZZ5PsQXIOyXuivw0Da3iuXtPZeo2VEMENoMJzK8luJKeqlA+D5wQv67XDGt6iUpgvJERIlhB3k+xHMk0Ft/pIvrU6evQaTdNrdneeCeATEUoxl+QIkokk15LIpWqfYrlek4l6jeb69OULnm762yqYydqmguzHg4oxRCCH2KS/+3F6LS7Ra+MdmpXfgMl/WAuGdGKwFCZr4BztgJx+Z8zDnKMJgEMya5TAeyKUYo32hyEDSQ5TQeMYBguMd/y7LSR5guQx7fLIOEAhAgtQlEe0ALuo4HjhFBW0FSONaGsrJYLd10n+qYKD8c+QvCNbKkSIA+9oCS9JxE2G+5Psq2Vvkl1J+qb8uZDPR6//fBWkOiEvqOACeIEQIXF0azfjsZK/w+Hqdu1GTdDSrkkTygiSwcz3wNntlfq9QlmsgmtVF+igFj+3yHYIEWzCFq2cnKzLYG094F6F9yut1m7NVk0CgRAh9yhVdLnexwI0yaEWgcDfgppAsB3+J8AAT3lmAWpgGLQAAAAASUVORK5CYII=', '971545866100', 'ar1@gmail.com', 'greenteam', 2, NULL, 4, 18, NULL, NULL, NULL, 1),
(10, 1, 5, 'ARABIAN RANCHES2', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'ar2@gmail.com', 'greenteam', 2, NULL, 1, 4, NULL, NULL, NULL, 1),
(11, 1, 7, 'INTERNET CITY', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxdaZBdRRXueZkkZJ2EJJBJJmMiELZMARUVJKAESRCQHSL+AEG2okoWUUBQ8QdqEJEgKApYLAFBEChBKAwGEJBYWFKAQ5A9gUzINglZyUYYz/duX3l585bT992l+/b5qk5NSJi3dJ/vnrVPN/X09CiBwHcUZAkEAqWawz90dnbKagi8Q0dHx/ZEEMSO/iRtJKNIRpKMKJE+eu2HlP3OOpKPSbaRrCyRbpIVJF0km2VpE7QIgsiu5QSSfUgmkeyq/3s8yViSppjfDwHdYpKFJAtI3iZ5leQV/d+fyJYIEdIAlPtAkoNJvkCyN8ngFN+/SVsZyEFl/7aeZD7Jv0ieI5mnSSMQIjQMuDXTSQ4n+RLJZyz+rCDk/lrO13/3HsmzJHNIntDulUCIwIufSE4iOYJksnI7swbinqoFbtOLJI+TPEAi2REhQi/sRTJDy545jmc+r+VKkv+S3K/lNQn2/EULybkk/9a+9Y9zTIJK2FN/5/l6Dc7VayJE8AR4It6mglTk77T74zsm67VAcH27XiMhQk6/5zE6cERW5QyVbrbHFQwiOV2v0bN6zQpCBPfRj+Qs7QM/rIK0p4CHg/WaYe3O0WspRHAwCYCn/uskt5LsLnodGVi7m/VanqFymmDJGxFQcPqGDgARB0wQPY4NE/Saztdr3CREsBMHqKCaeg/JRNHbxDBRr/E8veZCBEvQSjI7bxvj0IPnTr0HQoQMP/t52nc9NW+m2iFX9DS9B+e5rE+ufvA9SJ4huYlkqOhj5hiq9+IZvTdChBQ+72UkL6ve3ZeC7HGQ3pvvu6ZbLn3YcSRzSa5WwaEXgZ3A3szUezVOiBAv0AyHwydTRc+cwVS9ZzOECI2jL8kNJPeRDBfdcg7D9d7doPdSiBABY0ieVp8eMhG4i/P1Xo4RIphhigpag6eIDuUGVu+pjUQ4heRJlYMijaAXWvXeniJEqI3LVVC+l6xQftFf7/HlQoTewJyfW0h+pqRC7AOa9F7fqvdeiKCCPvd7Sc4W/fAOZ+m97+c7EXYgeYjkZNEJb3Gy1oEBvhJhIMljJEeJLngP6MCjWie8IgICJhwDPFR0QKBxqNaJ/r4QAf4gZukcJnsvKAN04k9ZxAxpEwEZAhyiOUb2XFAFR5PcpVLOJqVNhBtJvi57LaiDGVpXckmEi1Vwikkg4AC68r28EQGu0DWytwJDXJ2WG50GETBO8F5lSQVR4BT6aN2Z7DoRcL/An1WG+WGB8xiodWiUq0QAm5EmbZO9FDSINq1LfVwkwlUkh8geCmICdOmnrhHhKyqYZCAQxIlLVUKF2CSIgOtTMf1M2qkFcQM6NVvrmPVEQI/5WNkzQUJo1TpmNRG+RXK87JUgYRyvdc1KIiCyv072SJASrlMxZiTjJALu4GqR/RGkBOjazbYRAaeM5ICNIG0cqWKapBcHEXAp3yzZE0FGuF7FcDFkHES4QkmWSJAdkEX6QdZEwL1a35G9EGSMi1SD9+U1SoRfqGAShUCQJaCD12ZFBMywPFH2QGAJTlANXB7TCBGukrUXWIaZaRNhqpJLOwT2ARbhiDSJINZAYCuuTIsI05TcWyCwF7j/eXoaRPiurLXAclyWNBEmRWGbQJAyMD5yvySJcImSAzcCN3BRUkTYWVl45Y9AUAWnaJ1lodnghU9XFlzo4Cr69Omj+vfvr/r166f69u2rmpubi39XKBSKAvT09KhPPvlEbdu2rShbtmwpyubNm9XHH38si2gG6OoZKhgSFhsR4A6dJWtrBij7oEGD1IABA4pSd5GbmoqkwO8BAwd+Og4KhPjoo4/Uhg0bin8WsHAmyc/xjImLCIeQ7CrrylP+wYMHqx122IGl/OzHG1kSyLBhw4pE2LRpk1q/fn3RWgiqAjqLwu9TcRFBrAHjab7jjjuqoUOHJm/zNSnwXiDD6tWr1datW2UTqutuLESAfT5W1rM6oJB4UsPnTxuwPpA1a9YUCYEYQ7AdMER4EMmGWv8TJ2t0lH4hQfkTgnz4trY2NWLEiExIUIqWlhbV3t5e/CnYDtDdI+v9TxwiyMUeFQALsPPOOxczQLa5Z6NGjSr+WcDX4Xqu0RAOm3wLhnfaaadiKtRWwFVCoL5ixQq1ceNG2bRAh6HL66JaBMyZHCDrGADuD1whm0lQ+llHjx4da+bKYWARpjViEcQaaCAdCkvQiMuBQBbpThTLUCALf6KQFro2UGBYHdQT4HYhO9RI/AEydHd3q3Xr1vm+hTin8FBUIhwuFAjcodbW1si/D/cEaU4Uw0KlNw3KUZiDyxMFI0eOLJIQ7+8xDo9qETpIxvlOAjyZx4wZE+l3UQlGSrPRohdeB/Lhhx8Ws0JDhgwxtkywZkuWLCkW4jzFOK3TnaYxwjQhQaEYE5i6Jnj6d3V1qWXLlsVa+YUbtXLlSrVo0aIiwUwBq+ZCfJMgpkcJlg/ynQhwKUxIALdn+fLlxWxNkpVexBawDh988IFxMx4sg8eYEoUIXh/HhPsBv9wkDoAVSNMPh7XBe65du9Yo3kGdwVMcZEqE3fDw8HW1YAVgDUxcoaVLl2bSKg0rBHdp1apV7N9B0G1C8hwBT4CJJkTw2hqgYmxiCeAKZQ30GplYBrSFeIoDTYgw2ddVQjDJDSjhBsES2AITywCrl0anrIWYbEKEDl+JgF4dbsCKwNg2wDJw2yo8tQodQoQ6QDsCKsgcIDVqK0BQEFXIUBH7conQjgejWIPqQOrS5pNhqCJziQr3KDwz7QlatI7XJcIkX2MD9PXUA45JRilmpQ0QFdksDkrPRnuCSRwiTPCRCNwuTTSwuQJYLiFCRUzgEGG8EKEykLN36bA86hqcwBk1Bc8O8owXIlQAqq2cIJn7hLUJSKly4FmB7bMcIuwi1qAyTApWtgA9T5w5SJ4d4GG5Rt7dkMmxBmiDjnKWwAZwDuV4RoSxHCLsKEToDZcPtYDE9YBKs02DCBLGiHpEAAmafSJBeDSyHlw+0BIeC60HTvo4L9teToZCPabkHZynYHi22GVwiOCRRejl+RR8d4s41oDbruA6EbIeUpale1ROhCG+EYGz+a4GyeXukRChuq6XE8G7A62cQlIe5olyLIJnPUf9ahGhWYiQT+TBqsUdHtYignfn93xREJmF2gsDaxFBCRHyqUQct8dnq+E9ETj+fx58Z052zOe7Fcp32Lsb63wJIjkZIc8uLNxWiwjeDcfkNKSFQ3mFCLnCenGNyjafYxW4Z5ltjQ84rpHPt3WWE2Gtj4uQ9zZlDokRKHtGhHVChDJwGuqijmS3AZz5RVgDz7JGa2sRYYWPROC0KcO9cPFsL1K/HGvm4RVTy2sRYaWPRIBLwJlePXz4cOe+G3dEjYeXiKyqRQScTPfyWhWOIqBfnxN02hQkc90izzJG2OxNtYgALPGRCNzpFC5ZBe5sU45rmDP0GlhbiQjv+xoncNKoCJpdiBVQN+CS1kO36D0OERYoT4EBuhw0ertmGuDejOOhW1RRxysRYaHPROBYBZDA5A6FtDFs2DB2AdClyX0xYiGHCO8qj8EdiIWUJBTONmCGK9clwpiXJO96c4kIlVIgb/hMBPjL6MLk9BaFCmfLUGDELiaWikv6HOJ1jkV4TZV15vkGk7sPQAYbbp6BJTAhAcjr6fkD6PZ8DhFQYnzbZyIggORMhwuByzaydJNgCUwuRYc75OIc15jwttbxukQAOpXnQBBp0oQGyzB69OjUC264KtbEEsAK4H5mj1FRt6sR4T9KYHxbJgLocePGpeIq4b3a2tqMmwERF/h8Eq2abld7fM0TGgQ9SLiPzPS2erhKUFQE3pA4fXG4QRBciG4KpIdNXL6cYp4JEV5QwbHNZt9XDYqM4Nm0bhAqLJreME4e1zhFLVyhShwqP/fq20okMLmUPMeB8gsmRMAxtleUx/ctlwLtF8iyRAmIw1YHCFqdEYijrwmFO7gokNBioFCHtC1+4vfQ5IfCGEjQSCUbn19IUMTLquyIZj0iAP8QInyK8CbNRirKcJfKzwaUu01xt27gc7tw+WFKeL7aP9SqGv1d1q33kzXuS8ah+KUiJEgUT1f7h1oW4SkS1N/7yvptHzMsXLiw6PvbUEir5Qp52j5RDVtrEaGWRVir3SNBBdjcsYn4Iw+j7BNwi9ZEsQjAEyRTZQ0DFwaBK6yA7ecRkF2CIDBHxgo/hRhqTq1/rEeER0lm+k6AlpaWIgFcuz8AxA3bsUEIpFA9PHtQqsuRifCqCrpRd/dx5fBURdozDxdogMgQkAFBtGcNd29oXVZRYoQQ9/lGANQL0L4wcuTI3N0iA+vW3t5erH57hLo6zCHC/b6sFgpYra2tRSuQ54v1wukW6ItycVZTBNTVYU4LxXxtViblPQ5IakIFepbgm4eV5DCrE1aVSyvLAKwQBAoLCf8bRI2z1oBOWRQI0X+EekNO44dXVYXzB1GIAMwmuSaPq4RgEq3McbZPQ/HDdoqQBHE9ycO2C1So4xpMHGaZ0Hqew6a82ayHAvPF7iD5iSq7gM11oIUZJIhL+dFYh2JWUoUsWBCQC4InOMgLQgwaNCiWIcWIifCaOTq0gwMld8ZJBDTmP0xycl5cIbgEjSoPeo/wBMXTPwu3Au+J94fAdYKFaHTuEhIFINbSpUvz4CpBZ5fHSQTg1jwQAe4FAmK4GFGBJzLSkDZNiEPMEZ5/QKs2Yh4odBQgUTB27NgiGbgTAC3F79nxksGLPknyJslEV1cFT8pGUqJwffD05YyRzxJQXjQHghCwEPD/TYNsPDBwDhon2lCMcxA4mzyX/X1NXFSSa10OiuEORSEBfH6c88XRTdtJUE4IKHJXV1fkse+oN8C6OIgbtM7GTgTgbhLnRqPBRYA7FCU4RVAKRXLZRYCvDzcHRI7i96PT1rGR+DiFdLuRBTR8g42aaU65Q6ZnjgH4/yBAnsaewLVbtGgRe8ZreRDtEBl+o6qcRIuLCMBvVdn9U7a7Q6aAO4Fzynnt2MRZBZMhZqVksHHMZTnfozysoxCh2wWrgNSoqTuEWgBcCEeDQ2OLt3jxYuPMF6xClAkaKeKmKO571Otlf0li7RnAKNOqEQNAMXy6SwzEh2UwrSYj8xZ1mkbCwBeJlNCJSgQ4ztfZSgKk/UzShfCdlyzx8qKgwMR3dxvHQlhjC8kwS0W8ELORC8d/pSpcwZM1MHbRpFgGBUA2xdOBuP8HsmOmcQPW2iIs056KSpsIcKR/ZNNKIE1q0ogGSyBTHraPG0zmH6HoZtG5hh+qBu4JLzT45reRvGTDKsBMm6RJQ0sg2B5IrZpYBpxrsKDg9pLWRZUVEVC5u9CGDTQJjtGPI5agtmUwWR8U3DK+dvdCZVBFToIIwHMkf8hyFUzOFSM7JJaAZzFN0sjIJGWEe7QOqqyJAFykMmq9wJOIW+RBewF6hnwPjLlAYZFbZ0DdJoP6QrfWPWULEWL7QEm6RHGPa/QBJhm1DIYdXKwipkuTIoLS7tFf01wFWAJuqhRPN8d76zMBGg9NbthBvJASMLDrrrherBDzhztbBZ1/qYCbrUC12Ie2iaSACjS34IbzDylcxr5K65qylQhdJOemsTnwRzlXwAJRGswE28NkykWUbl9DQMcW2UwE4AHVYE43ziyFh1PdEgM3xkLreyNHYevgDq1jynYiAMjrvplkbMABnmBSL4gPiLFQjc8wVoBOXZDECydFBKzWiSSxn26H/8k9IIKWakG8QBaJc04D6dSYi2zQJQyPWOcSEQBMGDsz7hflmtwk5wv5DlTmOYg6RaMKoEuJXXtcSHjN/khyfZwvyLUG4hIlB24GKcbTbNdrXVKuEgG4RAXXUDUMFGs4Q7mQ7pOaQXJAbYGTjkZWLwarAN25NOnvlAYRkHM7gaSz0Rfi3lkmV6naYxUa7Ezt1LqzNQ9EADA24UgV1BkSJUI4gFeQvFXgTMNAe3zEEftdWmfWpPF9CimuXUNfDAduOAU0qSCnB24qNYJ7BB05utEHp61ECE0dvqBxWpW7mDbNI807YH05qVTD4tpHWkdeTvO7FDJYP/SOH6eCkd1scHLSSJfK7ZHpgpNKNTg+u0XrxnNpf49CRuv3NxUUR1hkCK92rYccXnKRC/cI2T7GxAvowgytG8oXIgCPqKD6XHeqLhaREx9wCz2C+IA0NbfSXAPQgZNUcJ+B8o0IAO6+/Rp0uFHTCrfI4zuEXXaPNmgd+EuW36FgwTri3oXpqsbkPA4RxBpkB06CAntY4ZwC9vxwrQPKdyIA80gOJnk/atZBKsnZgXNnBEhQVk94X+/58zZ8h4JF64kmvQNIXiz9Sywe5xysSxd45A0478F5EJUEzC/qvX7Vlu9QsGxNMYD0kFJ/kVOVRD4blU5BduB0+mrLjr39st5rJUSoDuTjkEueiYcNxy2SIDl7MB5EPc3NzTP13loX0BVsXVeSK0hOpsWr2zMhRbTsUWcPsIczyMW9QjU4kc43IoR4kBbvc6pOuV3OJFtNBOwd9vCBFKZb5JYICJTfoh9fJLkROi8WwZkYoUfvGfburaKyFQpChMgfMFg8pIRwaPuoSkGWEMG6GGGJ3qsLVEnngFiExokQ4nGSSapswplkjKwiwl16jx536fO74BqV/xWOn51G8lWSBRIjWEOEBXpPTlNVph2mPBc1X0SA2wNFryBzSDpIZtEmSP40O2DtZ2EvaK/mVNmrotjswjaFT9POzk6XN2Mvkl+TTBW9TBVPk3yb5DVXv0BHR4cbFoEJbMShJMe6vCmOrfdxes1zsd6FnG0QzjjsQ/JNkndFX2PHu3ptscYP5+mLFXK4WfBZZ5PsQXIOyXuivw0Da3iuXtPZeo2VEMENoMJzK8luJKeqlA+D5wQv67XDGt6iUpgvJERIlhB3k+xHMk0Ft/pIvrU6evQaTdNrdneeCeATEUoxl+QIkokk15LIpWqfYrlek4l6jeb69OULnm762yqYydqmguzHg4oxRCCH2KS/+3F6LS7Ra+MdmpXfgMl/WAuGdGKwFCZr4BztgJx+Z8zDnKMJgEMya5TAeyKUYo32hyEDSQ5TQeMYBguMd/y7LSR5guQx7fLIOEAhAgtQlEe0ALuo4HjhFBW0FSONaGsrJYLd10n+qYKD8c+QvCNbKkSIA+9oCS9JxE2G+5Psq2Vvkl1J+qb8uZDPR6//fBWkOiEvqOACeIEQIXF0azfjsZK/w+Hqdu1GTdDSrkkTygiSwcz3wNntlfq9QlmsgmtVF+igFj+3yHYIEWzCFq2cnKzLYG094F6F9yut1m7NVk0CgRAh9yhVdLnexwI0yaEWgcDfgppAsB3+J8AAT3lmAWpgGLQAAAAASUVORK5CYII=', '971545866100', 'dic@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 1),
(12, 1, 8, 'MEDIA CITY', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxdaZBdRRXueZkkZJ2EJJBJJmMiELZMARUVJKAESRCQHSL+AEG2okoWUUBQ8QdqEJEgKApYLAFBEChBKAwGEJBYWFKAQ5A9gUzINglZyUYYz/duX3l585bT992l+/b5qk5NSJi3dJ/vnrVPN/X09CiBwHcUZAkEAqWawz90dnbKagi8Q0dHx/ZEEMSO/iRtJKNIRpKMKJE+eu2HlP3OOpKPSbaRrCyRbpIVJF0km2VpE7QIgsiu5QSSfUgmkeyq/3s8yViSppjfDwHdYpKFJAtI3iZ5leQV/d+fyJYIEdIAlPtAkoNJvkCyN8ngFN+/SVsZyEFl/7aeZD7Jv0ieI5mnSSMQIjQMuDXTSQ4n+RLJZyz+rCDk/lrO13/3HsmzJHNIntDulUCIwIufSE4iOYJksnI7swbinqoFbtOLJI+TPEAi2REhQi/sRTJDy545jmc+r+VKkv+S3K/lNQn2/EULybkk/9a+9Y9zTIJK2FN/5/l6Dc7VayJE8AR4It6mglTk77T74zsm67VAcH27XiMhQk6/5zE6cERW5QyVbrbHFQwiOV2v0bN6zQpCBPfRj+Qs7QM/rIK0p4CHg/WaYe3O0WspRHAwCYCn/uskt5LsLnodGVi7m/VanqFymmDJGxFQcPqGDgARB0wQPY4NE/Saztdr3CREsBMHqKCaeg/JRNHbxDBRr/E8veZCBEvQSjI7bxvj0IPnTr0HQoQMP/t52nc9NW+m2iFX9DS9B+e5rE+ufvA9SJ4huYlkqOhj5hiq9+IZvTdChBQ+72UkL6ve3ZeC7HGQ3pvvu6ZbLn3YcSRzSa5WwaEXgZ3A3szUezVOiBAv0AyHwydTRc+cwVS9ZzOECI2jL8kNJPeRDBfdcg7D9d7doPdSiBABY0ieVp8eMhG4i/P1Xo4RIphhigpag6eIDuUGVu+pjUQ4heRJlYMijaAXWvXeniJEqI3LVVC+l6xQftFf7/HlQoTewJyfW0h+pqRC7AOa9F7fqvdeiKCCPvd7Sc4W/fAOZ+m97+c7EXYgeYjkZNEJb3Gy1oEBvhJhIMljJEeJLngP6MCjWie8IgICJhwDPFR0QKBxqNaJ/r4QAf4gZukcJnsvKAN04k9ZxAxpEwEZAhyiOUb2XFAFR5PcpVLOJqVNhBtJvi57LaiDGVpXckmEi1Vwikkg4AC68r28EQGu0DWytwJDXJ2WG50GETBO8F5lSQVR4BT6aN2Z7DoRcL/An1WG+WGB8xiodWiUq0QAm5EmbZO9FDSINq1LfVwkwlUkh8geCmICdOmnrhHhKyqYZCAQxIlLVUKF2CSIgOtTMf1M2qkFcQM6NVvrmPVEQI/5WNkzQUJo1TpmNRG+RXK87JUgYRyvdc1KIiCyv072SJASrlMxZiTjJALu4GqR/RGkBOjazbYRAaeM5ICNIG0cqWKapBcHEXAp3yzZE0FGuF7FcDFkHES4QkmWSJAdkEX6QdZEwL1a35G9EGSMi1SD9+U1SoRfqGAShUCQJaCD12ZFBMywPFH2QGAJTlANXB7TCBGukrUXWIaZaRNhqpJLOwT2ARbhiDSJINZAYCuuTIsI05TcWyCwF7j/eXoaRPiurLXAclyWNBEmRWGbQJAyMD5yvySJcImSAzcCN3BRUkTYWVl45Y9AUAWnaJ1lodnghU9XFlzo4Cr69Omj+vfvr/r166f69u2rmpubi39XKBSKAvT09KhPPvlEbdu2rShbtmwpyubNm9XHH38si2gG6OoZKhgSFhsR4A6dJWtrBij7oEGD1IABA4pSd5GbmoqkwO8BAwd+Og4KhPjoo4/Uhg0bin8WsHAmyc/xjImLCIeQ7CrrylP+wYMHqx122IGl/OzHG1kSyLBhw4pE2LRpk1q/fn3RWgiqAjqLwu9TcRFBrAHjab7jjjuqoUOHJm/zNSnwXiDD6tWr1datW2UTqutuLESAfT5W1rM6oJB4UsPnTxuwPpA1a9YUCYEYQ7AdMER4EMmGWv8TJ2t0lH4hQfkTgnz4trY2NWLEiExIUIqWlhbV3t5e/CnYDtDdI+v9TxwiyMUeFQALsPPOOxczQLa5Z6NGjSr+WcDX4Xqu0RAOm3wLhnfaaadiKtRWwFVCoL5ixQq1ceNG2bRAh6HL66JaBMyZHCDrGADuD1whm0lQ+llHjx4da+bKYWARpjViEcQaaCAdCkvQiMuBQBbpThTLUCALf6KQFro2UGBYHdQT4HYhO9RI/AEydHd3q3Xr1vm+hTin8FBUIhwuFAjcodbW1si/D/cEaU4Uw0KlNw3KUZiDyxMFI0eOLJIQ7+8xDo9qETpIxvlOAjyZx4wZE+l3UQlGSrPRohdeB/Lhhx8Ws0JDhgwxtkywZkuWLCkW4jzFOK3TnaYxwjQhQaEYE5i6Jnj6d3V1qWXLlsVa+YUbtXLlSrVo0aIiwUwBq+ZCfJMgpkcJlg/ynQhwKUxIALdn+fLlxWxNkpVexBawDh988IFxMx4sg8eYEoUIXh/HhPsBv9wkDoAVSNMPh7XBe65du9Yo3kGdwVMcZEqE3fDw8HW1YAVgDUxcoaVLl2bSKg0rBHdp1apV7N9B0G1C8hwBT4CJJkTw2hqgYmxiCeAKZQ30GplYBrSFeIoDTYgw2ddVQjDJDSjhBsES2AITywCrl0anrIWYbEKEDl+JgF4dbsCKwNg2wDJw2yo8tQodQoQ6QDsCKsgcIDVqK0BQEFXIUBH7conQjgejWIPqQOrS5pNhqCJziQr3KDwz7QlatI7XJcIkX2MD9PXUA45JRilmpQ0QFdksDkrPRnuCSRwiTPCRCNwuTTSwuQJYLiFCRUzgEGG8EKEykLN36bA86hqcwBk1Bc8O8owXIlQAqq2cIJn7hLUJSKly4FmB7bMcIuwi1qAyTApWtgA9T5w5SJ4d4GG5Rt7dkMmxBmiDjnKWwAZwDuV4RoSxHCLsKEToDZcPtYDE9YBKs02DCBLGiHpEAAmafSJBeDSyHlw+0BIeC60HTvo4L9teToZCPabkHZynYHi22GVwiOCRRejl+RR8d4s41oDbruA6EbIeUpale1ROhCG+EYGz+a4GyeXukRChuq6XE8G7A62cQlIe5olyLIJnPUf9ahGhWYiQT+TBqsUdHtYignfn93xREJmF2gsDaxFBCRHyqUQct8dnq+E9ETj+fx58Z052zOe7Fcp32Lsb63wJIjkZIc8uLNxWiwjeDcfkNKSFQ3mFCLnCenGNyjafYxW4Z5ltjQ84rpHPt3WWE2Gtj4uQ9zZlDokRKHtGhHVChDJwGuqijmS3AZz5RVgDz7JGa2sRYYWPROC0KcO9cPFsL1K/HGvm4RVTy2sRYaWPRIBLwJlePXz4cOe+G3dEjYeXiKyqRQScTPfyWhWOIqBfnxN02hQkc90izzJG2OxNtYgALPGRCNzpFC5ZBe5sU45rmDP0GlhbiQjv+xoncNKoCJpdiBVQN+CS1kO36D0OERYoT4EBuhw0ertmGuDejOOhW1RRxysRYaHPROBYBZDA5A6FtDFs2DB2AdClyX0xYiGHCO8qj8EdiIWUJBTONmCGK9clwpiXJO96c4kIlVIgb/hMBPjL6MLk9BaFCmfLUGDELiaWikv6HOJ1jkV4TZV15vkGk7sPQAYbbp6BJTAhAcjr6fkD6PZ8DhFQYnzbZyIggORMhwuByzaydJNgCUwuRYc75OIc15jwttbxukQAOpXnQBBp0oQGyzB69OjUC264KtbEEsAK4H5mj1FRt6sR4T9KYHxbJgLocePGpeIq4b3a2tqMmwERF/h8Eq2abld7fM0TGgQ9SLiPzPS2erhKUFQE3pA4fXG4QRBciG4KpIdNXL6cYp4JEV5QwbHNZt9XDYqM4Nm0bhAqLJreME4e1zhFLVyhShwqP/fq20okMLmUPMeB8gsmRMAxtleUx/ctlwLtF8iyRAmIw1YHCFqdEYijrwmFO7gokNBioFCHtC1+4vfQ5IfCGEjQSCUbn19IUMTLquyIZj0iAP8QInyK8CbNRirKcJfKzwaUu01xt27gc7tw+WFKeL7aP9SqGv1d1q33kzXuS8ah+KUiJEgUT1f7h1oW4SkS1N/7yvptHzMsXLiw6PvbUEir5Qp52j5RDVtrEaGWRVir3SNBBdjcsYn4Iw+j7BNwi9ZEsQjAEyRTZQ0DFwaBK6yA7ecRkF2CIDBHxgo/hRhqTq1/rEeER0lm+k6AlpaWIgFcuz8AxA3bsUEIpFA9PHtQqsuRifCqCrpRd/dx5fBURdozDxdogMgQkAFBtGcNd29oXVZRYoQQ9/lGANQL0L4wcuTI3N0iA+vW3t5erH57hLo6zCHC/b6sFgpYra2tRSuQ54v1wukW6ItycVZTBNTVYU4LxXxtViblPQ5IakIFepbgm4eV5DCrE1aVSyvLAKwQBAoLCf8bRI2z1oBOWRQI0X+EekNO44dXVYXzB1GIAMwmuSaPq4RgEq3McbZPQ/HDdoqQBHE9ycO2C1So4xpMHGaZ0Hqew6a82ayHAvPF7iD5iSq7gM11oIUZJIhL+dFYh2JWUoUsWBCQC4InOMgLQgwaNCiWIcWIifCaOTq0gwMld8ZJBDTmP0xycl5cIbgEjSoPeo/wBMXTPwu3Au+J94fAdYKFaHTuEhIFINbSpUvz4CpBZ5fHSQTg1jwQAe4FAmK4GFGBJzLSkDZNiEPMEZ5/QKs2Yh4odBQgUTB27NgiGbgTAC3F79nxksGLPknyJslEV1cFT8pGUqJwffD05YyRzxJQXjQHghCwEPD/TYNsPDBwDhon2lCMcxA4mzyX/X1NXFSSa10OiuEORSEBfH6c88XRTdtJUE4IKHJXV1fkse+oN8C6OIgbtM7GTgTgbhLnRqPBRYA7FCU4RVAKRXLZRYCvDzcHRI7i96PT1rGR+DiFdLuRBTR8g42aaU65Q6ZnjgH4/yBAnsaewLVbtGgRe8ZreRDtEBl+o6qcRIuLCMBvVdn9U7a7Q6aAO4Fzynnt2MRZBZMhZqVksHHMZTnfozysoxCh2wWrgNSoqTuEWgBcCEeDQ2OLt3jxYuPMF6xClAkaKeKmKO571Otlf0li7RnAKNOqEQNAMXy6SwzEh2UwrSYj8xZ1mkbCwBeJlNCJSgQ4ztfZSgKk/UzShfCdlyzx8qKgwMR3dxvHQlhjC8kwS0W8ELORC8d/pSpcwZM1MHbRpFgGBUA2xdOBuP8HsmOmcQPW2iIs056KSpsIcKR/ZNNKIE1q0ogGSyBTHraPG0zmH6HoZtG5hh+qBu4JLzT45reRvGTDKsBMm6RJQ0sg2B5IrZpYBpxrsKDg9pLWRZUVEVC5u9CGDTQJjtGPI5agtmUwWR8U3DK+dvdCZVBFToIIwHMkf8hyFUzOFSM7JJaAZzFN0sjIJGWEe7QOqqyJAFykMmq9wJOIW+RBewF6hnwPjLlAYZFbZ0DdJoP6QrfWPWULEWL7QEm6RHGPa/QBJhm1DIYdXKwipkuTIoLS7tFf01wFWAJuqhRPN8d76zMBGg9NbthBvJASMLDrrrherBDzhztbBZ1/qYCbrUC12Ie2iaSACjS34IbzDylcxr5K65qylQhdJOemsTnwRzlXwAJRGswE28NkykWUbl9DQMcW2UwE4AHVYE43ziyFh1PdEgM3xkLreyNHYevgDq1jynYiAMjrvplkbMABnmBSL4gPiLFQjc8wVoBOXZDECydFBKzWiSSxn26H/8k9IIKWakG8QBaJc04D6dSYi2zQJQyPWOcSEQBMGDsz7hflmtwk5wv5DlTmOYg6RaMKoEuJXXtcSHjN/khyfZwvyLUG4hIlB24GKcbTbNdrXVKuEgG4RAXXUDUMFGs4Q7mQ7pOaQXJAbYGTjkZWLwarAN25NOnvlAYRkHM7gaSz0Rfi3lkmV6naYxUa7Ezt1LqzNQ9EADA24UgV1BkSJUI4gFeQvFXgTMNAe3zEEftdWmfWpPF9CimuXUNfDAduOAU0qSCnB24qNYJ7BB05utEHp61ECE0dvqBxWpW7mDbNI807YH05qVTD4tpHWkdeTvO7FDJYP/SOH6eCkd1scHLSSJfK7ZHpgpNKNTg+u0XrxnNpf49CRuv3NxUUR1hkCK92rYccXnKRC/cI2T7GxAvowgytG8oXIgCPqKD6XHeqLhaREx9wCz2C+IA0NbfSXAPQgZNUcJ+B8o0IAO6+/Rp0uFHTCrfI4zuEXXaPNmgd+EuW36FgwTri3oXpqsbkPA4RxBpkB06CAntY4ZwC9vxwrQPKdyIA80gOJnk/atZBKsnZgXNnBEhQVk94X+/58zZ8h4JF64kmvQNIXiz9Sywe5xysSxd45A0478F5EJUEzC/qvX7Vlu9QsGxNMYD0kFJ/kVOVRD4blU5BduB0+mrLjr39st5rJUSoDuTjkEueiYcNxy2SIDl7MB5EPc3NzTP13loX0BVsXVeSK0hOpsWr2zMhRbTsUWcPsIczyMW9QjU4kc43IoR4kBbvc6pOuV3OJFtNBOwd9vCBFKZb5JYICJTfoh9fJLkROi8WwZkYoUfvGfburaKyFQpChMgfMFg8pIRwaPuoSkGWEMG6GGGJ3qsLVEnngFiExokQ4nGSSapswplkjKwiwl16jx536fO74BqV/xWOn51G8lWSBRIjWEOEBXpPTlNVph2mPBc1X0SA2wNFryBzSDpIZtEmSP40O2DtZ2EvaK/mVNmrotjswjaFT9POzk6XN2Mvkl+TTBW9TBVPk3yb5DVXv0BHR4cbFoEJbMShJMe6vCmOrfdxes1zsd6FnG0QzjjsQ/JNkndFX2PHu3ptscYP5+mLFXK4WfBZZ5PsQXIOyXuivw0Da3iuXtPZeo2VEMENoMJzK8luJKeqlA+D5wQv67XDGt6iUpgvJERIlhB3k+xHMk0Ft/pIvrU6evQaTdNrdneeCeATEUoxl+QIkokk15LIpWqfYrlek4l6jeb69OULnm762yqYydqmguzHg4oxRCCH2KS/+3F6LS7Ra+MdmpXfgMl/WAuGdGKwFCZr4BztgJx+Z8zDnKMJgEMya5TAeyKUYo32hyEDSQ5TQeMYBguMd/y7LSR5guQx7fLIOEAhAgtQlEe0ALuo4HjhFBW0FSONaGsrJYLd10n+qYKD8c+QvCNbKkSIA+9oCS9JxE2G+5Psq2Vvkl1J+qb8uZDPR6//fBWkOiEvqOACeIEQIXF0azfjsZK/w+Hqdu1GTdDSrkkTygiSwcz3wNntlfq9QlmsgmtVF+igFj+3yHYIEWzCFq2cnKzLYG094F6F9yut1m7NVk0CgRAh9yhVdLnexwI0yaEWgcDfgppAsB3+J8AAT3lmAWpgGLQAAAAASUVORK5CYII=', '971545866100', 'dmc@gmail.com', 'greenteam', 1, NULL, 0, 0, NULL, NULL, NULL, 1);
INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(13, 1, 6, 'Villa Lantana', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'vl@gmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(14, 1, 3, 'DSC', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'dsc@gmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(15, 1, 1, 'JLT-N1', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n1@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(16, 1, 1, 'JLT-N2', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n2@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(17, 1, 1, 'JLT-N3', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n3@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1);
INSERT INTO `cleaners` (`id`, `city_id`, `locality_id`, `first_name`, `last_name`, `image_string`, `phone_number`, `email`, `password`, `status`, `rate_by_user`, `count_who_rated`, `rating`, `feedback`, `car_id`, `order_id`, `is_del`) VALUES
(18, 1, 1, 'JLT-N4', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n4@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(19, 1, 1, 'JLT-N5', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n5@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1),
(20, 1, 1, 'JLT-N6', '', 'iVBORw0KGgoAAAANSUhEUgAAAMIAAADCCAYAAAAb4R0xAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjJFMDZDQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjJFMDZEQjBFQjExRThCMUU1RUE3QTg1QTlEMkJCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyMkUwNkFCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyMkUwNkJCMEVCMTFFOEIxRTVFQTdBODVBOUQyQkIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4zD1ZIAAAVZUlEQVR42uxd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', '971545866100', 'jlt-n6@hotmail.com', 'greenteam', 2, NULL, 0, 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cleaner_job_done_history`
--

CREATE TABLE `cleaner_job_done_history` (
  `id` int(10) NOT NULL,
  `cleaner_id` int(10) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `payment_key` int(10) NOT NULL,
  `package_type` varchar(255) NOT NULL,
  `services` int(10) NOT NULL COMMENT '1=>interior,2=>exterior,3=>both',
  `week_day` varchar(255) NOT NULL,
  `job_done_date` date DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `team_id` int(10) NOT NULL,
  `car_id` int(10) NOT NULL,
  `attendent` int(10) NOT NULL COMMENT '1=>attendent,2=>not_attendent',
  `reason` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=>by_default,2=>when user rated this activity'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cleaner_job_done_history`
--

INSERT INTO `cleaner_job_done_history` (`id`, `cleaner_id`, `user_id`, `payment_key`, `package_type`, `services`, `week_day`, `job_done_date`, `created_date`, `team_id`, `car_id`, `attendent`, `reason`, `feedback`, `status`) VALUES
(1, 9, 13, 5, 'monthly', 2, 'Sat', '2018-11-03', '2018-11-05 09:22:32', 11, 11, 1, '', 'Good wash done', 2),
(2, 9, 13, 5, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-14 22:05:38', 11, 11, 1, '', 'Good job', 2),
(3, 9, 6, 4, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-13 11:30:12', 11, 8, 1, '', 'Nice', 2),
(4, 9, 4, 2, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-11 12:10:35', 11, 5, 1, '', NULL, 1),
(5, 10, 19, 6, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-11 12:11:46', 12, 13, 1, '', NULL, 1),
(6, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-11 12:12:11', 12, 16, 1, '', NULL, 1),
(7, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-11 12:12:16', 12, 17, 1, '', NULL, 1),
(8, 10, 23, 10, 'monthly', 2, 'Sun', '2018-11-11', '2018-11-14 10:02:18', 12, 14, 1, '', 'Can The Cleaners Come Earlier.? 6.30 Am ', 2),
(9, 10, 19, 6, 'monthly', 2, 'Wed', '2018-11-14', '2018-11-14 06:21:47', 12, 13, 1, '', NULL, 1),
(10, 10, 23, 10, 'monthly', 2, 'Wed', '2018-11-14', '2018-11-14 13:11:17', 12, 14, 1, '', NULL, 1),
(11, 10, 67, 14, 'monthly', 2, 'Wed', '2018-11-14', '2018-11-14 13:11:21', 12, 44, 1, '', NULL, 1),
(12, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-15', '2018-11-15 04:37:06', 12, 16, 1, '', NULL, 1),
(13, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-15', '2018-11-15 04:37:10', 12, 17, 1, '', NULL, 1),
(14, 9, 13, 5, 'monthly', 2, 'Thu', '2018-11-15', '2018-11-15 08:40:52', 11, 11, 1, '', 'We', 2),
(15, 9, 31, 11, 'monthly', 2, 'Thu', '2018-11-15', '2018-11-15 04:37:49', 11, 23, 1, '', NULL, 1),
(16, 10, 19, 6, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:20:39', 12, 13, 1, '', NULL, 1),
(17, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:20:45', 12, 16, 1, '', NULL, 1),
(18, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:20:50', 12, 17, 1, '', NULL, 1),
(19, 10, 23, 10, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:20:54', 12, 14, 1, '', NULL, 1),
(20, 10, 67, 14, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:21:08', 12, 44, 1, '', NULL, 1),
(21, 9, 4, 2, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:21:44', 11, 5, 1, '', NULL, 1),
(22, 9, 6, 4, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:21:59', 11, 8, 1, '', NULL, 1),
(23, 9, 13, 5, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:22:03', 11, 11, 1, '', NULL, 1),
(24, 9, 31, 11, 'monthly', 2, 'Sun', '2018-11-18', '2018-11-18 08:22:08', 11, 23, 1, '', NULL, 1),
(25, 10, 80, 18, 'monthly', 2, 'Mon', '2018-11-19', '2018-11-19 03:49:20', 12, 54, 1, '', NULL, 1),
(26, 10, 80, 18, 'monthly', 2, 'Mon', '2018-11-19', '2018-11-19 03:49:30', 12, 55, 1, '', NULL, 1),
(27, 9, 4, 2, 'monthly', 2, 'Mon', '2018-11-19', '2018-11-19 03:50:11', 11, 5, 1, '', NULL, 1),
(28, 9, 6, 4, 'monthly', 2, 'Mon', '2018-11-19', '2018-11-19 03:50:47', 11, 8, 2, 'On Customer Request', NULL, 1),
(29, 9, 13, 5, 'monthly', 2, 'Mon', '2018-11-19', '2018-11-19 03:50:54', 11, 11, 2, 'On Customer Request', NULL, 1),
(30, 9, 6, 4, 'monthly', 2, 'Tue', '2018-11-20', '2018-11-20 04:57:41', 11, 8, 1, '', NULL, 1),
(31, 9, 13, 5, 'monthly', 2, 'Tue', '2018-11-20', '2018-11-20 04:57:45', 11, 11, 1, '', NULL, 1),
(32, 10, 24, 7, 'monthly', 2, 'Tue', '2018-11-20', '2018-11-20 04:58:19', 12, 16, 1, '', NULL, 1),
(33, 10, 24, 7, 'monthly', 2, 'Tue', '2018-11-20', '2018-11-20 04:58:23', 12, 17, 1, '', NULL, 1),
(34, 10, 19, 6, 'monthly', 2, 'Wed', '2018-11-21', '2018-11-21 07:15:17', 12, 13, 1, '', NULL, 1),
(35, 10, 23, 10, 'monthly', 2, 'Wed', '2018-11-21', '2018-11-21 07:23:58', 12, 14, 2, 'Car wash not done by cleaner', NULL, 1),
(36, 10, 67, 14, 'monthly', 2, 'Wed', '2018-11-21', '2018-11-21 07:24:08', 12, 44, 1, '', NULL, 1),
(37, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:18:30', 12, 16, 2, 'Car not found in parking spot', NULL, 1),
(38, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:18:35', 12, 17, 1, '', NULL, 1),
(39, 10, 80, 18, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:18:41', 12, 54, 1, '', NULL, 1),
(40, 10, 80, 18, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:18:45', 12, 55, 1, '', NULL, 1),
(41, 9, 13, 5, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:19:38', 11, 11, 1, '', NULL, 1),
(42, 9, 31, 11, 'monthly', 2, 'Thu', '2018-11-22', '2018-11-22 06:19:48', 11, 23, 1, '', NULL, 1),
(43, 10, 19, 6, 'monthly', 2, 'Sun', '2018-11-25', '2018-11-25 09:59:04', 12, 13, 1, '', NULL, 1),
(44, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-25', '2018-11-25 09:59:46', 12, 16, 1, '', NULL, 1),
(45, 10, 24, 7, 'monthly', 2, 'Sun', '2018-11-25', '2018-11-25 09:59:49', 12, 17, 1, '', NULL, 1),
(46, 10, 23, 10, 'monthly', 2, 'Sun', '2018-11-25', '2018-11-25 09:59:53', 12, 14, 1, '', NULL, 1),
(47, 10, 67, 14, 'monthly', 2, 'Sun', '2018-11-25', '2018-11-25 09:59:59', 12, 44, 1, '', NULL, 1),
(48, 10, 24, 7, 'monthly', 2, 'Tue', '2018-11-27', '2018-11-27 16:56:06', 12, 16, 1, '', NULL, 1),
(49, 10, 24, 7, 'monthly', 2, 'Tue', '2018-11-27', '2018-11-27 16:56:09', 12, 17, 1, '', NULL, 1),
(50, 10, 108, 24, 'monthly', 2, 'Tue', '2018-11-27', '2018-11-27 16:56:13', 12, 68, 1, '', NULL, 1),
(51, 10, 108, 24, 'monthly', 2, 'Tue', '2018-11-27', '2018-11-27 16:56:16', 12, 69, 1, '', NULL, 1),
(52, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:11', 12, 16, 1, '', NULL, 1),
(53, 10, 24, 7, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:16', 12, 17, 1, '', NULL, 1),
(54, 10, 80, 18, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:24', 12, 54, 1, '', NULL, 1),
(55, 10, 80, 18, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:31', 12, 55, 1, '', NULL, 1),
(56, 10, 108, 24, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:36', 12, 68, 1, '', NULL, 1),
(57, 10, 108, 24, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:58:41', 12, 69, 1, '', NULL, 1),
(58, 10, 18, 25, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 09:59:02', 12, 12, 2, 'Car not found in parking spot', NULL, 1),
(59, 9, 13, 5, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 10:00:28', 11, 11, 1, '', NULL, 1),
(60, 9, 31, 11, 'monthly', 2, 'Thu', '2018-11-29', '2018-11-29 10:00:33', 11, 23, 1, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupans`
--

CREATE TABLE `coupans` (
  `id` int(10) UNSIGNED NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `offer_name` varchar(200) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_upto` date NOT NULL,
  `coupan_code` varchar(100) NOT NULL,
  `discount` varchar(200) NOT NULL,
  `minimum_order` varchar(200) NOT NULL,
  `max_discount` varchar(255) NOT NULL,
  `user_type` int(10) NOT NULL COMMENT '1=>new_user,2=>already_existed',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locality`
--

CREATE TABLE `locality` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `is_suv` int(10) NOT NULL DEFAULT '1' COMMENT '1=>package_not_active,2=>package_active',
  `is_saloon` int(10) NOT NULL DEFAULT '1' COMMENT '=>package_not_active,2=>package_active',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locality`
--

INSERT INTO `locality` (`id`, `name`, `city_id`, `start_time`, `end_time`, `is_suv`, `is_saloon`, `status`) VALUES
(1, 'JLT', 1, '06:00 PM', '06:00 AM', 2, 2, 1),
(2, 'Golden Mile', 1, '06:00 PM', '06:00 AM', 2, 2, 1),
(3, 'Dubai Studio City', 1, '08:00 AM', '05:00 PM', 2, 2, 1),
(4, 'Arabian Ranches 1', 1, '06:00 AM', '01:57 PM', 2, 2, 1),
(5, 'Arabian Ranches 2', 1, '06:00 AM', '06:00 PM', 2, 2, 1),
(6, 'Villa Lantana', 1, '04:00 PM', '01:00 AM', 2, 2, 1),
(7, 'Dubai Internet City', 1, '08:00 AM', '05:00 PM', 2, 2, 1),
(8, 'Dubai Media City', 1, '08:00 AM', '05:00 PM', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `package` int(10) NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `amount_paid` varchar(255) NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `p_type` varchar(200) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `price_interior` varchar(200) DEFAULT '0',
  `price_exterior` varchar(200) DEFAULT '0',
  `interior_once` varchar(255) DEFAULT '0',
  `exterior_once` varchar(255) DEFAULT '0',
  `interior_thrice` varchar(255) DEFAULT '0',
  `exterior_thrice` varchar(255) DEFAULT '0',
  `interior_five` varchar(255) DEFAULT '0',
  `exterior_five` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `type`, `p_type`, `frequency`, `price_interior`, `price_exterior`, `interior_once`, `exterior_once`, `interior_thrice`, `exterior_thrice`, `interior_five`, `exterior_five`, `status`) VALUES
(1, 'Saloon-JLT/GM/DSC/SiteA', 'saloon', '3', NULL, '42', '25', '240', '105', '350', '158', '700', '262', 1),
(2, 'SUV-JLT/GM/DSC/SiteA', 'suv', '3', NULL, '53', '30', '320', '158', '480', '189', '1000', '315', 1),
(3, 'Saloon-VL', 'saloon', '3', NULL, '42', '25', '240', '105', '350', '126', '700', '262', 1),
(4, 'SUV-VL', 'suv', '3', NULL, '53', '25', '320', '132', '480', '158', '1000', '315', 1),
(5, 'Saloon-AR', 'saloon', '3', NULL, '42', '25', '240', '105', '350', '158', '700', '262', 1),
(6, 'SUV-AR', 'suv', '3', NULL, '53', '30', '320', '105', '480', '158', '1000', '315', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_locations`
--

CREATE TABLE `package_locations` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_locations`
--

INSERT INTO `package_locations` (`id`, `package_id`, `city_id`, `locality_id`, `status`) VALUES
(33, 5, 1, 4, 1),
(34, 5, 1, 5, 1),
(35, 3, 1, 6, 1),
(36, 6, 1, 4, 1),
(37, 6, 1, 5, 1),
(43, 2, 1, 1, 1),
(44, 2, 1, 2, 1),
(45, 2, 1, 3, 1),
(46, 2, 1, 7, 1),
(47, 2, 1, 8, 1),
(48, 1, 1, 1, 1),
(49, 1, 1, 2, 1),
(50, 1, 1, 3, 1),
(51, 1, 1, 7, 1),
(52, 1, 1, 8, 1),
(54, 4, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_collected`
--

CREATE TABLE `payment_collected` (
  `id` int(10) NOT NULL,
  `cleaner_id` int(10) NOT NULL,
  `payment_key` int(10) NOT NULL,
  `amount_collected` int(11) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_collected`
--

INSERT INTO `payment_collected` (`id`, `cleaner_id`, `payment_key`, `amount_collected`, `status`) VALUES
(1, 10, 7, 315, 1);

-- --------------------------------------------------------

--
-- Table structure for table `street`
--

CREATE TABLE `street` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(10) NOT NULL,
  `locality_id` int(10) UNSIGNED NOT NULL,
  `payment_type` int(10) NOT NULL DEFAULT '1' COMMENT '1=&gt;gogreen,2=&gt;quickshine',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `street`
--

INSERT INTO `street` (`id`, `name`, `city_id`, `locality_id`, `payment_type`, `status`) VALUES
(1, 'A1 - Dubai Gate 2', 1, 1, 2, 1),
(2, 'A2 - Mövenpick Hotels & Residence', 1, 1, 2, 1),
(3, 'A3 - Lake Side Residence', 1, 1, 2, 1),
(4, 'B1 - The Wind Tower II', 1, 1, 2, 1),
(5, 'B2 - Lake View', 1, 1, 2, 1),
(6, 'B3 - The Wind Tower I', 1, 1, 2, 1),
(7, 'C1 - Fortune Tower', 1, 1, 2, 1),
(8, 'C2 - Gold Crest Executive', 1, 1, 2, 1),
(9, 'C3 - The Palladium', 1, 1, 2, 1),
(10, 'D1 - Indigo Tower', 1, 1, 2, 1),
(11, 'D2 - Lake Terrace', 1, 1, 2, 1),
(12, 'D3 - Lake City Tower', 1, 1, 2, 1),
(13, 'E1 - Global Lake View', 1, 1, 2, 1),
(14, 'E2 - Al Shera Tower', 1, 1, 2, 1),
(15, 'E3 - SABA 1', 1, 1, 2, 1),
(16, 'F1 - Bobyan Tower', 1, 1, 2, 1),
(17, 'F2 - HDS Tower', 1, 1, 2, 1),
(18, 'F3 - Indigo Icon', 1, 1, 2, 1),
(19, 'G1 - Dubai Arch Tower', 1, 1, 2, 1),
(20, 'G2 - Jumeirah Business Centre', 1, 1, 2, 1),
(21, 'G3 - JBC 9', 1, 1, 2, 1),
(22, 'H1 - JBC 7', 1, 1, 2, 1),
(23, 'H2 - Concorde', 1, 1, 2, 1),
(24, 'H3 - JBC 8', 1, 1, 2, 1),
(25, 'I1 - Silver Tower', 1, 1, 2, 1),
(26, 'I2 - Platinum Tower', 1, 1, 2, 1),
(27, 'I3 - Gold Tower', 1, 1, 2, 1),
(28, 'J1 - Gold Crest Views 2', 1, 1, 2, 1),
(29, 'J2 - Mohammed Ibrahim Tower', 1, 1, 2, 1),
(30, 'J3 - Bonnington Hotel JLT', 1, 1, 2, 1),
(31, 'K1 - Vista Del Lago', 1, 1, 2, 2),
(32, 'L1 - JBC 6', 1, 1, 2, 1),
(33, 'L2 - Dubai Star Tower', 1, 1, 2, 1),
(34, 'L3 - Icon II', 1, 1, 2, 1),
(35, 'M1 - HDS Business Centre', 1, 1, 2, 1),
(36, 'M2 - M2', 1, 1, 2, 1),
(37, 'M3 - Icon I', 1, 1, 2, 1),
(38, 'N1 - The Dome Tower', 1, 1, 2, 1),
(39, 'N2 - Lake Point Tower', 1, 1, 2, 1),
(40, 'N3 - JBC 4', 1, 1, 2, 1),
(41, 'O1 - Reef Tower', 1, 1, 2, 1),
(42, 'O2 - O2 Residence', 1, 1, 2, 1),
(43, 'O3 - Madina Tower', 1, 1, 2, 1),
(44, 'P1 - Armada 1', 1, 1, 2, 1),
(45, 'P2 - Armada 2', 1, 1, 2, 1),
(46, 'P3 - Armada 3', 1, 1, 2, 1),
(47, 'Q1 - SABA 3', 1, 1, 2, 1),
(48, 'Q2 - Dubai Gate 1', 1, 1, 2, 1),
(49, 'Q3 - SABA 2', 1, 1, 2, 1),
(50, 'R1 - Al Waleed Paradise', 1, 1, 2, 1),
(51, 'R2 - MAG 214', 1, 1, 2, 1),
(52, 'R3 - Al Saqran Tower', 1, 1, 2, 1),
(53, 'S1 - Green Lakes Tower 1', 1, 1, 2, 1),
(54, 'S2 - Green Lakes Tower 2', 1, 1, 2, 1),
(55, 'S3 - Green Lakes Tower 3', 1, 1, 2, 1),
(56, 'T1 - Fortune Executive Tower', 1, 1, 2, 1),
(57, 'T2 - 1 Lake Plaza', 1, 1, 2, 1),
(58, 'T3 - Pullman Jumeirah Lakes Towers', 1, 1, 2, 1),
(59, 'U1 - Al Seef Tower 3', 1, 1, 2, 1),
(60, 'U2 - Al Seef Tower 2', 1, 1, 2, 1),
(61, 'U3 - Tamweel Tower', 1, 1, 2, 1),
(62, 'V1 - JBC 2', 1, 1, 2, 1),
(63, 'V2 - Gold Crest Views 1', 1, 1, 2, 1),
(64, 'V3 - V3', 1, 1, 2, 1),
(65, 'W1 - JBC 5', 1, 1, 2, 1),
(66, 'W2 - Tiffany Towers', 1, 1, 2, 1),
(67, 'W3 - Oaks Hotel Apartments', 1, 1, 2, 1),
(68, 'X1 - Jumeirah Bay X1', 1, 1, 2, 1),
(69, 'X2 - Jumeirah Bay X2', 1, 1, 2, 1),
(70, 'X3 - Jumeirah Bay X3', 1, 1, 2, 1),
(71, 'Y1 - JBC 3', 1, 1, 2, 1),
(72, 'Y2 - Lakeshore Tower', 1, 1, 2, 1),
(73, 'Y3 - Swiss Tower', 1, 1, 2, 1),
(74, 'Z1 - Jumeirah Lake Apartments', 1, 1, 2, 1),
(75, 'Z2 - Anantara Hotel', 1, 1, 2, 1),
(76, 'Z3 - Jumeirah Lake Offices', 1, 1, 2, 1),
(77, 'AA1 - Business Avenue', 1, 1, 2, 2),
(78, 'AA2 - Amesco Tower', 1, 1, 2, 2),
(79, 'AA3 - Corporate Tower', 1, 1, 2, 2),
(80, 'BB1 - Business Avenue', 1, 1, 2, 2),
(81, 'BB2 - Business Avenue', 1, 1, 2, 2),
(82, 'BB3 - SABA 4', 1, 1, 2, 2),
(83, 'GM1', 1, 2, 1, 1),
(84, 'GM2', 1, 2, 1, 1),
(85, 'GM3', 1, 2, 1, 1),
(86, 'GM4', 1, 2, 1, 1),
(87, 'GM5', 1, 2, 1, 1),
(88, 'GM6', 1, 2, 1, 1),
(89, 'GM7', 1, 2, 1, 1),
(90, 'GM8', 1, 2, 1, 1),
(91, 'GM9', 1, 2, 1, 1),
(92, 'GM10', 1, 2, 1, 1),
(93, 'DSC-1', 1, 3, 1, 1),
(94, 'DSC-2', 1, 3, 1, 1),
(95, 'DSC-3', 1, 3, 1, 1),
(96, 'DSC-4', 1, 3, 1, 1),
(97, 'DSC-Tall', 1, 3, 1, 1),
(98, 'VL-1', 1, 6, 1, 1),
(99, 'VL-2', 1, 6, 1, 1),
(100, 'Palmera 1', 1, 4, 1, 1),
(101, 'Palmera 2', 1, 4, 1, 1),
(102, 'Palmera 3', 1, 4, 1, 1),
(103, 'Palmera 4', 1, 4, 1, 1),
(104, 'Alvoroda 1', 1, 4, 1, 1),
(105, 'Alvoroda 2', 1, 4, 1, 1),
(106, 'Alvoroda 3', 1, 4, 1, 1),
(107, 'Alvoroda 4', 1, 4, 1, 1),
(108, 'La Colleccion 1', 1, 4, 1, 1),
(109, 'La Colleccion 2', 1, 4, 1, 1),
(110, 'Hattan', 1, 4, 1, 1),
(111, 'Al Mahra', 1, 4, 1, 1),
(112, 'Terranova', 1, 4, 1, 1),
(113, 'Golf Villas', 1, 4, 1, 1),
(114, 'Casa', 1, 5, 1, 1),
(115, 'Palma', 1, 5, 1, 1),
(116, 'Rosa', 1, 5, 1, 1),
(117, 'Rasha', 1, 5, 1, 1),
(118, 'Lila', 1, 5, 1, 1),
(119, 'Yasmin', 1, 5, 1, 1),
(120, 'Samara', 1, 5, 1, 1),
(121, 'S1', 1, 7, 1, 1),
(122, 'S3', 1, 7, 1, 1),
(123, 'S4-PARKING BLDG', 1, 7, 1, 1),
(124, 'S5-PARKING BLDG', 1, 7, 1, 1),
(125, 'S6', 1, 8, 1, 1),
(126, 'S7', 1, 8, 1, 1),
(127, 'MBC Building', 1, 8, 1, 1),
(128, 'CNN Building', 1, 8, 1, 1),
(129, 'Boutique Studio', 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `locality_id` int(10) UNSIGNED NOT NULL,
  `jobs` int(255) DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>active,2=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `city_id`, `locality_id`, `jobs`, `status`) VALUES
(8, 'Golden Mile Team', 1, 2, 1, 1),
(9, 'Villa Lantana Team', 1, 6, 0, 1),
(10, 'DSC Team', 1, 3, 0, 1),
(11, 'Arabian Ranches 1-Team', 1, 4, 11, 1),
(12, 'Arabian Ranches 2-Team', 1, 5, 9, 1),
(14, 'JLT-N1 Team', 1, 1, 2, 1),
(15, 'JLT-N2 Team', 1, 1, 0, 1),
(16, 'JLT-N3 Team', 1, 1, 0, 1),
(17, 'JLT-N4 Team', 1, 1, 6, 1),
(18, 'JLT-N5 Team', 1, 1, 1, 1),
(19, 'JLT-N6 Team', 1, 1, 3, 1),
(20, 'JLT-Day Team', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams_street`
--

CREATE TABLE `teams_street` (
  `id` int(10) NOT NULL,
  `team_id` int(10) NOT NULL,
  `street_id` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams_street`
--

INSERT INTO `teams_street` (`id`, `team_id`, `street_id`, `status`) VALUES
(58, 8, 83, 1),
(59, 8, 84, 1),
(60, 8, 85, 1),
(61, 8, 86, 1),
(62, 8, 87, 1),
(63, 8, 88, 1),
(64, 8, 89, 1),
(65, 8, 90, 1),
(66, 8, 91, 1),
(67, 8, 92, 1),
(68, 9, 98, 1),
(69, 9, 99, 1),
(70, 10, 93, 1),
(71, 10, 94, 1),
(72, 10, 95, 1),
(73, 10, 96, 1),
(74, 10, 97, 1),
(75, 11, 100, 1),
(76, 11, 101, 1),
(77, 11, 102, 1),
(78, 11, 103, 1),
(79, 11, 104, 1),
(80, 11, 105, 1),
(81, 11, 106, 1),
(82, 11, 107, 1),
(83, 11, 108, 1),
(84, 11, 109, 1),
(85, 11, 110, 1),
(86, 11, 111, 1),
(87, 11, 112, 1),
(88, 11, 113, 1),
(89, 12, 114, 1),
(90, 12, 115, 1),
(91, 12, 116, 1),
(92, 12, 117, 1),
(93, 12, 118, 1),
(94, 12, 119, 1),
(95, 12, 120, 1),
(108, 14, 13, 1),
(109, 14, 14, 1),
(110, 14, 15, 1),
(111, 14, 19, 1),
(112, 14, 20, 1),
(113, 14, 21, 1),
(114, 14, 23, 1),
(115, 14, 22, 1),
(116, 14, 24, 1),
(117, 14, 41, 1),
(118, 14, 42, 1),
(119, 14, 43, 1),
(120, 15, 59, 1),
(121, 15, 60, 1),
(122, 15, 61, 1),
(123, 15, 68, 1),
(124, 15, 69, 1),
(125, 15, 70, 1),
(126, 15, 71, 1),
(127, 15, 72, 1),
(128, 15, 73, 1),
(129, 16, 10, 1),
(130, 16, 11, 1),
(131, 16, 12, 1),
(132, 16, 62, 1),
(133, 16, 63, 1),
(134, 16, 64, 1),
(135, 17, 1, 1),
(136, 17, 2, 1),
(137, 17, 3, 1),
(138, 17, 4, 1),
(139, 17, 5, 1),
(140, 17, 6, 1),
(141, 17, 7, 1),
(142, 17, 8, 1),
(143, 17, 9, 1),
(144, 18, 44, 1),
(145, 18, 45, 1),
(146, 18, 46, 1),
(147, 18, 47, 1),
(148, 18, 48, 1),
(149, 18, 49, 1),
(150, 18, 50, 1),
(151, 18, 51, 1),
(152, 18, 52, 1),
(153, 18, 53, 1),
(154, 18, 54, 1),
(155, 18, 55, 1),
(156, 19, 32, 1),
(157, 19, 33, 1),
(158, 19, 34, 1),
(159, 19, 35, 1),
(160, 19, 36, 1),
(161, 19, 37, 1),
(162, 19, 38, 1),
(163, 19, 39, 1),
(164, 19, 40, 1),
(165, 19, 28, 1),
(166, 19, 29, 1),
(167, 19, 30, 1),
(168, 20, 7, 1),
(169, 20, 8, 1),
(170, 20, 9, 1),
(171, 20, 10, 1),
(172, 20, 15, 1),
(173, 20, 17, 1),
(174, 20, 18, 1),
(175, 20, 16, 1),
(176, 20, 21, 1),
(177, 20, 25, 1),
(178, 20, 26, 1),
(179, 20, 27, 1),
(180, 20, 30, 1),
(181, 20, 35, 1),
(182, 20, 38, 1),
(183, 20, 40, 1),
(184, 20, 41, 1),
(185, 20, 58, 1),
(186, 20, 56, 1),
(187, 20, 57, 1),
(188, 20, 61, 1),
(189, 20, 62, 1),
(190, 20, 66, 1),
(191, 20, 65, 1),
(192, 20, 67, 1),
(193, 20, 69, 1),
(194, 20, 70, 1),
(195, 20, 71, 1),
(196, 20, 73, 1);

-- --------------------------------------------------------

--
-- Table structure for table `team_cleaner`
--

CREATE TABLE `team_cleaner` (
  `id` int(10) NOT NULL,
  `team_id` int(10) NOT NULL,
  `street_id` int(10) DEFAULT NULL,
  `cleaner_id` int(10) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=>default,2=>cleaner_is_deleted_by_admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_cleaner`
--

INSERT INTO `team_cleaner` (`id`, `team_id`, `street_id`, `cleaner_id`, `status`) VALUES
(8, 8, 67, 8, 1),
(12, 9, 69, 13, 1),
(13, 10, 74, 14, 1),
(14, 11, 88, 9, 1),
(15, 12, 95, 10, 1),
(26, 15, 128, 16, 1),
(27, 16, 134, 17, 1),
(28, 17, 143, 18, 1),
(29, 18, 155, 19, 1),
(30, 19, 167, 20, 1),
(31, 20, 196, 1, 1),
(33, 14, NULL, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'NULL',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 =>active,2=>inactive',
  `created_at` datetime NOT NULL,
  `device_type` varchar(10) NOT NULL,
  `login_type` varchar(10) NOT NULL,
  `device_token` varchar(255) NOT NULL DEFAULT 'NULL',
  `social_id_fb` varchar(50) NOT NULL DEFAULT 'NULL',
  `social_id_gl` varchar(50) NOT NULL DEFAULT 'NULL',
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>not varified(false),1=>varified(true)',
  `is_payment` int(10) NOT NULL DEFAULT '1' COMMENT '1=>not_payment,2=>payment_recieved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `password`, `status`, `created_at`, `device_type`, `login_type`, `device_token`, `social_id_fb`, `social_id_gl`, `is_phone_verified`, `is_payment`) VALUES
(2, 'Apple Test', 'karan@ripenapps.com', '+971971132569', '8f08124aa4c45b074dd42dbec112d097', 1, '2018-10-30 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(3, 'Jaffer Pardawala', 'jaferusadik@yahoo.com', '+971545866104', 'NULL', 1, '2018-10-31 00:00:00', 'Android', 'FB', '', '2389427014407051', 'NULL', 1, 2),
(4, 'Munira Pardawala', 'munira.jp65@gail.com', '+971545866103', '2a62a58561a4257dd5e13f059168be51', 1, '2018-10-31 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(5, 'Abbas Bakar', 'abbasbakar001@gmail.com', '+971555080551', 'NULL', 1, '2018-10-31 00:00:00', 'Android', 'FB', '', '2078883278838795', 'NULL', 1, 2),
(6, 'Mustafa Zoeb', 'mikaeid@hotmail.com', '504644395', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-10-31 00:00:00', 'ios', 'EM', '123456', 'NULL', '', 1, 2),
(7, 'Tasneem Udaipurwala', 'tasneemudaipurwala@gmail.com', '821336699', 'NULL', 1, '2018-10-31 00:00:00', 'ios', 'GL', '123456', 'NULL', '103599263297436088887', 0, 1),
(8, 'Hassanain Anver', 'has@bezingo.com', '523579893', 'NULL', 1, '2018-10-31 00:00:00', 'ios', 'FB', '123456', '10161167586365096', 'NULL', 0, 1),
(9, 'Hanzala', 'hanzalar@gmail.com', '+971553007961', 'a2e92abd9a4ec3c5a23b55cf2224bc8a', 1, '2018-11-01 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(12, 'Muhammad Touseef Farhan', 'tosiffarhan@yahoo.com', '+971588003384', 'NULL', 1, '2018-11-01 00:00:00', 'Android', 'FB', '', '2291499094210741', 'NULL', 1, 1),
(13, 'Alifiya Mustafa', 'alifiya@avalontravels.net', '555426405', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-11-02 00:00:00', 'ios', 'FB', '123456', '488189251666243', '', 1, 2),
(14, 'جاسم البلوشي', 'jojo8188@hotmail.com', '+971506598188', 'NULL', 1, '2018-11-02 00:00:00', 'Android', 'FB', '', '2452154948145075', 'NULL', 1, 1),
(15, 'Louay Urfali', 'louayurfali@hotmail.com', '+971506770737', 'NULL', 1, '2018-11-02 00:00:00', 'Android', 'FB', '', '10155490141792581', 'NULL', 1, 1),
(16, 'ZOEB U', 'zoeb1949@gmail.com', '+971503748521', 'NULL', 1, '2018-11-02 00:00:00', 'Android', 'GL', '', 'NULL', '115589992124409106285', 0, 1),
(17, 'Hamza Altanger', 'hamzaaltanger@gmail.com', '+971506337697', 'NULL', 1, '2018-11-02 00:00:00', 'Android', 'FB', '', '10156440846717247', 'NULL', 0, 1),
(18, 'Glenn Tucker', 'glenn.tucker@fonterra.com', '545843211', 'd3c49acc1cac612be9ed9ba11e815da8', 1, '2018-11-03 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 2),
(19, 'Warren Baugh', 'warrenbaugh@gmail.com', '+971502974787', '1171ed734f668bd9dca33821a01cc2c2', 1, '2018-11-03 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(20, 'Linda', 'Lindadeoude@hotmail.com', '+971552032253', '302cd53eda245b160a2c09f57b241f4d', 1, '2018-11-03 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(21, 'Ahmad', 'amelaih@yahoo.com', '+971501505010', 'ab8a250672462574d622ac24293ffd0d', 1, '2018-11-03 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(22, 'Alia', 'alyoooh77@gmail.com', '565970222', 'b074374208ade5b67a1c88f2783a0e8c', 1, '2018-11-03 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 1),
(23, 'Edward Tooher', 'edtooher77@gmail.com', '+971547040616', 'c082c88e60fdb59db2887628afaa9270', 1, '2018-11-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(24, 'Mohammad', 'miqbal1802@gmail.com', '508180136', 'e42bb5f50e65c6fb6dcb5b02f9aabe77', 1, '2018-11-04 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(25, 'Linh James', 'kl_le@hotmail.com', '+971585074358', '8dcb9cb09a7c0b812f3c4a5d92f43578', 1, '2018-11-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(26, 'Mustafa Lakdawala', 'mustafa@rawigroup.com', '+971528649452', 'NULL', 1, '2018-11-04 00:00:00', 'Android', 'GL', '', 'NULL', '111169324805096092758', 1, 1),
(27, 'Josine', 'josine79@hotmail.com', '+971563233844', 'b24d98709283fa3ce859804b42b730bd', 1, '2018-11-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(28, 'Jithu', 'jithu2789@gmail.com', '526034229', 'e807f1fcf82d132f9bb018ca6738a19f', 1, '2018-11-04 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 1),
(29, 'Sujai Doy', 'sujaisoy@gmail.com', '+971529542894', 'ce5ee55d89b106eb156a25a018f01655', 1, '2018-11-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(30, 'Juzer Furniturewala', 'juzerms@gmail.com', '505523012', 'a2929aa89cd47d176d3694d47304b72a', 1, '2018-11-04 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 1),
(31, 'Olfa Rouis', 'olfa88@hotmail.com', '+971569920116', 'ae1dc1d425231d95ffafc55b9e78ae50', 1, '2018-11-05 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(32, 'Charito Constantino', 'chatconstantino06@gmail.com', '+971545866100', 'NULL', 1, '2018-11-05 00:00:00', 'Android', 'GL', '', 'NULL', '104847763289315307059', 1, 2),
(33, 'Iyad Khalas', 'ikhalas@hotmail.com', '526700633', '9f47db755e7ffb545f1be4079b0425de', 1, '2018-11-06 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 1),
(34, 'shivaram reddy', 'shiva.mogulla@gmail.com', '556336297', 'NULL', 1, '2018-11-06 00:00:00', 'ios', 'GL', '123456', 'NULL', '110157984893611095971', 0, 1),
(35, 'Ricky Singh', 'nissanteana24@gmail.com', '553348432', 'NULL', 1, '2018-11-06 00:00:00', 'ios', 'GL', '123456', 'NULL', '113944897446711545398', 0, 1),
(36, 'Martin Kruger', 'joachim.marthinus@gmail.com', '+971525380626', '1950207f1b6c9e6e25e8e5f280418269', 1, '2018-11-07 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(37, 'SHIBIN ABUBAKER', 'shibin.abubaker12345@gmail.com', '+971556632950', 'NULL', 1, '2018-11-07 00:00:00', 'Android', 'GL', '', 'NULL', '111457040844203314638', 1, 1),
(38, 'Abdulredha Barakat', 'redah007@gmail.com', '555599067', 'NULL', 1, '2018-11-07 00:00:00', 'ios', 'GL', '123456', 'NULL', '103217648602380416696', 1, 1),
(39, 'Abood Hz', 'abood_hafez@hotmail.com', '502120880', 'NULL', 1, '2018-11-08 00:00:00', 'ios', 'FB', '123456', '10156741082519719', 'NULL', 1, 1),
(40, 'Rakesh', 'rakeshnandu@gmail.com', '+971505060671', 'b35bf9446006d1ec1fc4f8bf11256563', 1, '2018-11-08 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(41, 'Ahmad', 'zghaibi@hotmail.com', '551110606', 'e620b36dd0eb1ac05e281beb29ca164b', 1, '2018-11-08 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(42, 'هزاع الرياشي', 'sss_5083331@hotmail.com', '505083331', 'NULL', 1, '2018-11-08 00:00:00', 'ios', 'FB', '123456', '1933678343336438', 'NULL', 1, 1),
(43, 'anish john pattamthanam', 'anishpattamthanam@gmail.com', '507119659', 'NULL', 1, '2018-11-08 00:00:00', 'ios', 'GL', '123456', 'NULL', '105698651969952661704', 1, 1),
(44, 'Bojana Pavlovic', 'boklca@hotmail.com', '585083008', 'NULL', 1, '2018-11-08 00:00:00', 'ios', 'FB', '123456', '2197212316985072', 'NULL', 1, 1),
(45, 'Abhishek Pande', 'abhishekpande05@gmail.com', '568887578', 'NULL', 1, '2018-11-09 00:00:00', 'ios', 'FB', '123456', '10215841756109933', 'NULL', 1, 1),
(46, 'Parvez', 'psarguroh@gmail.com', '502843166', 'c253cefef2dcc105fb37a6c1d3c571b8', 1, '2018-11-10 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(47, 'karam soliman', 'karam.so@icloud.com', '588671427', '26510b3a79d2fef7128e1e0c2aa711e0', 1, '2018-11-10 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(48, 'Mohamed Zoeb', 'mohammed_udai@hotmail.com', '559484720', 'a4991bf3415e21095bb1a39667e0efd8', 1, '2018-11-10 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(49, 'Mohammad Assaf', 'm7madassaf@gmail.com', '+971585064988', 'NULL', 1, '2018-11-10 00:00:00', 'Android', 'GL', '', 'NULL', '102083955256664435165', 1, 1),
(50, 'Ahmad', 'chamzehpour@gmail.con', '563677706', '6dc104fcf6d3a418fb44940410bec55e', 1, '2018-11-10 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(51, 'Ken', 'kenmob88@hotmail.com', '504520953', '23b431acfeb41e15d466d75de822307c', 1, '2018-11-11 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(52, 'Rayyan.Has87@gmail.com', 'rayyan.has87@gmail.com', '+971563961396', 'd649cb22b1320bf57b43c8c028009a0f', 1, '2018-11-11 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(53, 'Akhilesh Dubey', 'akhilesh.ism@gmail.com', '502282920', '0d715d7493ea1f05c6ecedfbafa95ac7', 1, '2018-11-11 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(54, 'Hisham Rahim', 'hisham.rahim@gmail.com', '553049444', '86384d6ac78541037b65c34a29103a39', 1, '2018-11-11 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(55, 'Zaheer Abbas', 'zaheerabbas.sk@gmail.com', '525170430', 'NULL', 1, '2018-11-11 00:00:00', 'ios', 'FB', '123456', '10156857080334837', 'NULL', 1, 1),
(56, 'Rashid', 'Rbinelsuwaidiii@gmail.com', '507667977', '877c3e380b3b41fa76988a834e165b07', 1, '2018-11-11 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(57, 'majd khair', 'majd.khair3@gmail.com', '+971555562275', 'NULL', 1, '2018-11-11 00:00:00', 'Android', 'GL', '', 'NULL', '111430765493106736123', 1, 1),
(58, 'Mahesh Mohanan', 'pmmahi008@yahoo.com', '569953746', 'NULL', 1, '2018-11-11 00:00:00', 'ios', 'FB', '123456', '2094637380575860', 'NULL', 1, 1),
(59, 'Mario', 'mcbraymundo@yahoo.com', '567365023', '1c0b1dd64c7554a93eda9ef5aa28b267', 1, '2018-11-12 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(60, 'Jill', 'crowley.jill@gmail.com', '566560335', 'a0048fd9d5d311a729885f6571eb37fe', 1, '2018-11-13 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(61, 'Manjeet Singh', 'manjeet207@gmail.com', '880221550', 'NULL', 1, '2018-11-13 00:00:00', 'ios', 'FB', '123456', '2555967951081783', 'NULL', 0, 1),
(62, 'Akef Houria', 'akefh@msn.com', '554497988', 'NULL', 1, '2018-11-13 00:00:00', 'ios', 'FB', '123456', '10157015916344434', 'NULL', 1, 1),
(63, 'Ramy Ebied', 'ramyebied1990@gmail.com', '+971564127899', 'NULL', 1, '2018-11-13 00:00:00', 'Android', 'GL', '', 'NULL', '', 1, 1),
(64, 'Ken Buenaobra', 'kenbuenaobra23@gmail.com', '561253861', 'NULL', 1, '2018-11-13 00:00:00', 'ios', 'GL', '123456', 'NULL', '117996780997048049320', 1, 1),
(65, 'حمدان الراسبي الراسبي', 'ahmed.alrasbi_37@hotmail.com', '501301904', 'NULL', 1, '2018-11-14 00:00:00', 'ios', 'FB', '123456', '2206862819589520', 'NULL', 1, 1),
(66, 'Rayhaan', 'rayhaan.myunus@gmail.com', '+971502611369', '71b92030c6556114685bc237f879ee55', 1, '2018-11-14 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(67, 'Inas Elshennawy', 'ielshennawy@gmail.com', '521221337', '4f1e4c739d77586528af3027ae43ab12', 1, '2018-11-14 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(68, 'Jaswinder Bhasin', 'bhasinjaswinder@gmail.com', '529134448', 'NULL', 1, '2018-11-14 00:00:00', 'ios', 'FB', '123456', '10218025338773700', 'NULL', 1, 1),
(69, 'Moiz Khan', 'moiz.azam@hotmail.com', '+971566865491', 'NULL', 1, '2018-11-14 00:00:00', 'Android', 'FB', '', '10156866693919712', 'NULL', 1, 1),
(70, 'Sami Mneimneh', 'sami@mneimneh.net', '555727252', 'fdf1a360d1d2653b9e47156eebbee2ef', 1, '2018-11-15 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(71, 'Alessandro Nadalin', 'alessandro.nadalin@gmail.com', '+971557627451', 'NULL', 1, '2018-11-15 00:00:00', 'Android', 'GL', '', 'NULL', '103538332474646101896', 1, 1),
(72, 'sara', 'herwordsand@gmail.com', '501005395', '974ef508d1097aff5e6b6747433b6c41', 1, '2018-11-15 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(73, 'Sahar Re', 'sahar81re@gmail.com', '507082523', 'NULL', 1, '2018-11-15 00:00:00', 'ios', 'FB', '123456', '10218392437261047', 'NULL', 1, 1),
(74, 'Fatma', 'H00248957@hct.ac.ae', '528754242', 'b428d2ce4283a5efee11645c9e29cfd1', 1, '2018-11-16 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(75, 'Sultan Mayed', 'sultan.m2@outlook.com', '502331033', 'fd209442fb4cf14a701525354c99fa8e', 1, '2018-11-16 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(76, 'Andrea Fernandes', 'andreaferns@hotmail.com', '506953050', 'NULL', 1, '2018-11-16 00:00:00', 'ios', 'FB', '123456', '10156295562706234', 'NULL', 1, 1),
(77, 'Oscar Alegria', 'oscar.alegria.p@gmail.com', '502543510', 'd1195c0bc8c74ccbe9385a8c257e6964', 1, '2018-11-17 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(78, 'Tasnim Basrai', 'tjbasrai@googlemail.com', '+971505680381', 'NULL', 1, '2018-11-17 00:00:00', 'Android', 'GL', '', 'NULL', '113317966810672143614', 1, 2),
(79, 'Mitesh Thanki', 'miteshthanki5@gmail.com', '559955983', 'NULL', 1, '2018-11-17 00:00:00', 'ios', 'FB', '123456', '2201261606559198', 'NULL', 1, 1),
(80, 'Chantelle Evans', 'chantelleml@gmail.com', '565226016', 'NULL', 1, '2018-11-18 00:00:00', 'ios', 'FB', '123456', '10155688542796560', 'NULL', 1, 2),
(81, 'Amr Younis', 'amr.younis1@yahoo.com', '558823334', '75395a5143ff94c7f8dc9c4aa445f5b2', 1, '2018-11-19 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(82, 'Gaby Rhayem', 'gaby.rhayem@doosan.com', '509402136', '2c9172b2d7ff0858f34b023741996411', 1, '2018-11-19 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(83, 'ahmed sarfraz', 'chahmadsarfraz@outlook.com', '556423693', '457daee20a956b2881ea358d587a0855', 1, '2018-11-19 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(84, 'Sherali Pirnafasov', 'sherali.pirnafasov@gmail.com', '+971543097583', 'NULL', 1, '2018-11-19 00:00:00', 'Android', 'FB', '', '10217941030867192', 'NULL', 1, 1),
(85, 'Sachin Bajaj', 'sachin.bajaj2@gmail.com', '553998819', 'NULL', 1, '2018-11-20 00:00:00', 'ios', 'GL', '123456', 'NULL', '103550312554821284202', 1, 2),
(86, 'Shukri Faddoul', 's_fadoul@yahoo.com', '564646861', 'NULL', 1, '2018-11-20 00:00:00', 'ios', 'FB', '123456', '10213116692817250', 'NULL', 1, 1),
(87, 'Sameer', 'sameerladkat@gmail.com', '+97155852281', 'bf24ccd3b0a2dbb25641352658010fd0', 1, '2018-11-21 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 0, 1),
(88, 'Sanjay Oberoi', 'sanjay@percepttrading.com', '+971558398399', 'NULL', 1, '2018-11-21 00:00:00', 'Android', 'FB', '', '10156734635114705', 'NULL', 1, 2),
(89, 'Ebrahim', 'taghavi5778@gmail.com', '547221718', '22da99a43654c339116ac06b28ff8f9e', 1, '2018-11-21 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(90, 'Gladwin Corrie', 'djgladwin74@yahoo.com', '558263661', 'NULL', 1, '2018-11-21 00:00:00', 'ios', 'FB', '123456', '10155596935401326', 'NULL', 1, 1),
(91, 'T Ghoshal', 'tathagata.ghoshal@gmail.com', '551869961', '4c1197486a6a86fee895fc27eff29e57', 1, '2018-11-22 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 2),
(92, 'Manish', 'mphilipose@mmm.com', '506240131', '26833f6da37f6cd698ba29547395e48f', 1, '2018-11-22 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(93, 'Ranillo', 'ranilloh@yahoo.com', '529048382', 'c7a9cca34d35caa6ffabd96ae673185d', 1, '2018-11-22 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(94, 'Liyan', 'aileen_z@live.cn', '5465190', '724e62440c4f3ae6ce56133dfdfe77f9', 1, '2018-11-22 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 0, 1),
(95, 'Osama Friejeh', 'friejeh@gmail.com', '505023623', 'NULL', 1, '2018-11-23 00:00:00', 'ios', 'FB', '123456', '10156760794241668', 'NULL', 1, 1),
(96, 'Viktor', 'k0rnjaka@list.ru', '+971528779725', '5010bcfe2fb95c0af8d5a0a8180e44b6', 1, '2018-11-23 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(97, 'Nikos Vertsekos', 'vertsekos@hotmail.com', '506510537', 'NULL', 1, '2018-11-23 00:00:00', 'ios', 'FB', '123456', '10156068799787606', 'NULL', 1, 1),
(98, 'Bassel Mirza', 'basselmirza87@gmail.com', '543342697', '3995e440c24b69529d6a2e0d4d804536', 1, '2018-11-23 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(99, 'Prerna Shrikhande', 'prernad22@gmail.com', '552303209', 'NULL', 1, '2018-11-24 00:00:00', 'ios', 'FB', '123456', '10212186482328986', 'NULL', 1, 1),
(100, 'nikunj bathwal', 'nikunj@bathwalcorp.com', '561671991', 'b406736969e597cd85fcec511e55d3f1', 1, '2018-11-25 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(101, 'Mohammad Ali', 'm90907@gmail.com', '+971555000045', '36c35c15ff153f60bcb33fa690fdd411', 1, '2018-11-25 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(102, 'Dounia Baha', 'douniabaha@hotmail.com', '558873024', 'NULL', 1, '2018-11-25 00:00:00', 'ios', 'FB', '123456', '10156167968416491', 'NULL', 1, 1),
(103, 'elena', 'e_denkovska@yahoo.com', '566822004', '2cc72b21471e9110623efec33498ead4', 1, '2018-11-25 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(104, 'Mohammad', 'm.binnaiser@ymail.com', '552198181', 'd3bfe6ac94611e825c7102571790d45b', 1, '2018-11-26 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(105, 'Sajeeh Ahammed', 'sajeehpahammed@gmail.com', '+971503747926', 'NULL', 1, '2018-11-26 00:00:00', 'Android', 'GL', '', 'NULL', '102192156915215717392', 1, 1),
(106, 'Aziz', '4212ahmed@gmail.com', '562294559', '9247af37fe022bd19ad808adbb1e2752', 1, '2018-11-26 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(107, 'Ali Arbad', 'aliboshra89@yahoo.com', '544440106', 'NULL', 1, '2018-11-26 00:00:00', 'ios', 'FB', '123456', '10215748337895728', 'NULL', 1, 1),
(108, 'Sadi Amaei', 'sadi.amawi@ecolab.com', '+971565036191', '6306297c938a2fd07fca3d91e42200f3', 1, '2018-11-27 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(109, 'yousef', 'xzibittadon@gmail.com', '569842429', 'fa52d551aadbd0393a1a9f5171643485', 1, '2018-11-28 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(110, 'hosam', 'hossamelkady@hotmail.com', '555303249', '8604d19b073bcd6a97563c2ad638f30b', 1, '2018-11-29 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(111, 'Gopal R', 'gopalrg@outlook.com', '+971503130245', '46356e826196faddd38f44836a328078', 1, '2018-11-29 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(112, 'Tamas Manfai', 'manfai.tamas@gmail.com', '508893501', 'NULL', 1, '2018-11-29 00:00:00', 'ios', 'GL', '123456', 'NULL', '112775273045010762902', 1, 1),
(113, 'Prabhjeet Basra', 'prabhbasra67@yahoo.com', '555303092', 'NULL', 1, '2018-11-29 00:00:00', 'ios', 'FB', '123456', '741083912922799', 'NULL', 1, 1),
(114, 'Mariam', 'basmet_alm21@hotmail.com', '+971504704483', 'd32a2b1ddf44aa6f8a2b10c8387cbfa3', 1, '2018-11-30 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(115, 'Ali Safwan', 'tehseen_badar@hotmail.com', '+971556001308', '7296bfa976d50e06a6624167c0dde5c4', 1, '2018-12-01 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(116, 'ANDY', 'andy.froemmel@gmail.com', '+971564080629', '738db40a47ad47dc62ac95186b12448d', 1, '2018-12-01 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(117, 'Abir', 'abimartien@hotmail.com', '504544208', 'ef257dc3879a33f9a419070058a949d6', 1, '2018-12-01 00:00:00', 'ios', 'EM', '123456', 'NULL', 'NULL', 1, 1),
(118, 'Vicky', 'veee.kay258@gmail.com', '+971698635999', '344e019e03516f24db1b3208f859b349', 1, '2018-12-03 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2),
(119, 'Radhika', 'radhika@gmail.com', '+91512548484', '8c2286f2844fd0081a70fa33ef1b1a11', 1, '2018-12-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 0, 1),
(120, 'Prankur', 'hg@gmail.com', '+91841685946', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-12-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 1),
(121, 'Akash', 'akashshukla.sln@gmail.com', '+919717018553', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-12-04 00:00:00', 'Android', 'EM', '', 'NULL', 'NULL', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

CREATE TABLE `user_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `orders_id` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `net_paid` varchar(255) NOT NULL,
  `coupan_applied` varchar(255) NOT NULL,
  `actual_payment` varchar(255) NOT NULL,
  `payment_type` int(10) NOT NULL COMMENT '1=>cod,2=>online',
  `partial_payment` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1=>not_collected,2=>collected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_payment`
--

INSERT INTO `user_payment` (`id`, `orders_id`, `user_id`, `transaction_id`, `net_paid`, `coupan_applied`, `actual_payment`, `payment_type`, `partial_payment`, `remark`, `status`) VALUES
(1, '100001', 1, 'COD', '155', 'NO', '150', 1, 0, NULL, 1),
(2, '100002', 4, 'COD', '105', 'NO', '100', 1, 0, NULL, 1),
(3, '100003', 3, 'COD', '25', 'NO', '20', 1, 0, NULL, 1),
(4, '100004', 6, 'COD', '255', 'NO', '255', 1, 0, NULL, 1),
(5, '100005', 13, 'COD', '255', 'NO', '255', 1, 0, NULL, 1),
(6, '100006', 19, '1854376', '100', 'NO', '100', 2, 0, '3Nov-18', 2),
(7, '100007', 24, 'COD', '321', 'NO', '321', 1, 315, 'Paid by CC to Abbas', 2),
(8, '100008', 5, 'COD', '110', 'NO', '105', 1, 0, NULL, 1),
(9, '100009', 32, 'COD', '110', 'NO', '105', 1, 0, NULL, 1),
(10, '100010', 23, '1862597', '105', 'NO', '105', 2, 0, '6Nov-18', 2),
(11, '100011', 31, '1865328', '105', 'NO', '105', 2, 0, '7Nov-18', 2),
(12, '100012', 48, 'COD', '110', 'NO', '110', 1, 0, NULL, 2),
(13, '100013', 6, 'COD', '267', 'NO', '267', 1, 0, NULL, 1),
(14, '100014', 67, 'COD', '110', 'NO', '110', 1, 0, NULL, 1),
(15, '100015', 13, 'COD', '88', 'NO', '88', 1, 0, NULL, 1),
(16, '100016', 13, '1886129', '262', 'NO', '262', 2, 0, NULL, 1),
(17, '100017', 70, 'COD', '35', 'NO', '35', 1, 0, NULL, 1),
(18, '100018', 80, '1891536', '210', 'NO', '210', 2, 0, '18Nov-18', 2),
(19, '100019', 88, 'COD', '194', 'NO', '189', 1, 0, NULL, 1),
(20, '100020', 91, 'COD', '110', 'NO', '110', 1, 0, NULL, 1),
(21, '100021', 82, '1905817', '158', 'NO', '158', 2, 0, NULL, 1),
(22, '100022', 78, 'COD', '110', 'NO', '105', 1, 0, NULL, 1),
(23, '100023', 13, 'COD', '194', 'NO', '194', 1, 0, NULL, 1),
(24, '100024', 108, 'COD', '321', 'NO', '316', 1, 0, NULL, 2),
(25, '100025', 18, '1918927', '105', 'NO', '105', 2, 0, NULL, 1),
(26, '100026', 85, '1927852', '158', 'NO', '158', 2, 0, NULL, 1),
(27, '100027', 116, '1930619', '105', 'NO', '105', 2, 0, NULL, 1),
(28, '100028', 118, 'COD', '430', 'NO', '425', 1, 0, NULL, 1),
(29, '100029', 118, '256297', '30', 'NO', '30', 2, 0, NULL, 1),
(30, '100030', 118, 'COD', '110', 'NO', '105', 1, 0, NULL, 1),
(31, '100031', 121, 'COD', '163', 'NO', '158', 1, 0, NULL, 1),
(32, '100032', 2, '282720', '158', 'NO', '158', 2, 0, NULL, 1),
(33, '100033', 2, 'COD', '35', 'NO', '30', 1, 0, NULL, 1),
(34, '100034', 218, '2190223', '25', 'NO', '25', 2, 0, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assiagned_team`
--
ALTER TABLE `assiagned_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_packages`
--
ALTER TABLE `booked_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_brand`
--
ALTER TABLE `car_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_detail`
--
ALTER TABLE `car_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cleaners`
--
ALTER TABLE `cleaners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cleaner_job_done_history`
--
ALTER TABLE `cleaner_job_done_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupans`
--
ALTER TABLE `coupans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_locations`
--
ALTER TABLE `package_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_collected`
--
ALTER TABLE `payment_collected`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `street`
--
ALTER TABLE `street`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams_street`
--
ALTER TABLE `teams_street`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_cleaner`
--
ALTER TABLE `team_cleaner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assiagned_team`
--
ALTER TABLE `assiagned_team`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `booked_packages`
--
ALTER TABLE `booked_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `car_brand`
--
ALTER TABLE `car_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `car_detail`
--
ALTER TABLE `car_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cleaners`
--
ALTER TABLE `cleaners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `cleaner_job_done_history`
--
ALTER TABLE `cleaner_job_done_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `coupans`
--
ALTER TABLE `coupans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `package_locations`
--
ALTER TABLE `package_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `payment_collected`
--
ALTER TABLE `payment_collected`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `street`
--
ALTER TABLE `street`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `teams_street`
--
ALTER TABLE `teams_street`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT for table `team_cleaner`
--
ALTER TABLE `team_cleaner`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
