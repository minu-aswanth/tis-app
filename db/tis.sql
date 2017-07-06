-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2017 at 01:40 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tis`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_type`
--

CREATE TABLE `accident_type` (
  `TypeID` int(11) NOT NULL,
  `AccidentType` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident_type`
--

INSERT INTO `accident_type` (`TypeID`, `AccidentType`) VALUES
(1, 'Accident'),
(2, 'Bus accident'),
(3, 'Collision'),
(4, 'Accident investigation work'),
(5, 'Accident History'),
(6, 'Chemical spillage accident'),
(7, 'Fuel spillage accident'),
(8, 'Hazardous materials Accident'),
(9, 'Heavy Lorry Accident'),
(10, 'Jack-knifed articulated lorry'),
(11, 'Jack-knifed caravan'),
(12, 'Jack-knifed trailer'),
(13, 'Multi-vehicle accident'),
(14, 'Oil spillage accident'),
(15, 'Overturned heavy lorry'),
(16, 'Overturned vehicle'),
(17, 'Secondary accident'),
(18, 'Serious accident'),
(19, 'Shed load'),
(20, 'Vehicle spun around'),
(21, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `htms_authentication`
--

CREATE TABLE `htms_authentication` (
  `Role` varchar(20) DEFAULT NULL,
  `Module` varchar(6) DEFAULT NULL,
  `Role_ID` varchar(7) DEFAULT NULL,
  `vms_map.html` varchar(12) DEFAULT NULL,
  `vms_live.html` varchar(13) DEFAULT NULL,
  `nms_vms2.html` varchar(13) DEFAULT NULL,
  `vms_logs.html` varchar(13) NOT NULL,
  `vms_display_msg.html` varchar(20) DEFAULT NULL,
  `vms_set_msg.html` varchar(16) DEFAULT NULL,
  `vms_setup.html` varchar(14) DEFAULT NULL,
  `met_map.html` varchar(12) DEFAULT NULL,
  `met_live.html` varchar(13) DEFAULT NULL,
  `met_createReport.html` varchar(21) DEFAULT NULL,
  `nms_met2.html` varchar(13) DEFAULT NULL,
  `met_setup.html` varchar(14) DEFAULT NULL,
  `atcc_map.html` varchar(13) DEFAULT NULL,
  `atcc_live.html` varchar(14) DEFAULT NULL,
  `atcc_real.html` varchar(5) NOT NULL,
  `atcc_createReport.html` varchar(22) DEFAULT NULL,
  `atcc_createArchivalReport.html` varchar(5) NOT NULL,
  `nms_atcc2.html` varchar(14) DEFAULT NULL,
  `atcc_setup.html` varchar(15) DEFAULT NULL,
  `cctv_map.html` varchar(13) DEFAULT NULL,
  `cctv_live.html` varchar(14) DEFAULT NULL,
  `cctv_live_public.html` varchar(22) NOT NULL,
  `nms_cctv2.html` varchar(14) DEFAULT NULL,
  `cctv_setup.html` varchar(15) DEFAULT NULL,
  `ecb_map.html` varchar(12) DEFAULT NULL,
  `ecb.html` varchar(20) DEFAULT NULL,
  `ecb_setup.html` varchar(20) DEFAULT NULL,
  `rule_live.html` varchar(14) DEFAULT NULL,
  `manage_rules.html` varchar(17) DEFAULT NULL,
  `rule_details.html` varchar(17) DEFAULT NULL,
  `profile_met.html` varchar(16) DEFAULT NULL,
  `profile_atcc.html` varchar(17) DEFAULT NULL,
  `nms.html` varchar(8) DEFAULT NULL,
  `nms_other.html` varchar(14) DEFAULT NULL,
  `backgroundServices.html` varchar(25) NOT NULL,
  `nms_vms.html` varchar(12) DEFAULT NULL,
  `nms_met.html` varchar(12) DEFAULT NULL,
  `nms_atcc.html` varchar(13) DEFAULT NULL,
  `nms_cctv.html` varchar(13) DEFAULT NULL,
  `nms_ecb.html` varchar(5) NOT NULL,
  `user_management.html` varchar(20) DEFAULT NULL,
  `changePassword.html` varchar(19) DEFAULT NULL,
  `createSR.html` varchar(20) NOT NULL,
  `existingSR.html` varchar(20) NOT NULL,
  `createReportSR.html` varchar(20) NOT NULL,
  `uptimeReport.html` varchar(20) NOT NULL,
  `met_automatic_report.html` varchar(20) NOT NULL,
  `accident_report.html` varchar(20) NOT NULL,
  `accidents.html` varchar(20) NOT NULL,
  `accident_vehicle_setup.html` varchar(20) NOT NULL,
  `accident_setup.html` varchar(20) NOT NULL,
  `accident_action_setup.html` varchar(20) NOT NULL,
  `atcc_automatic_report.html` varchar(20) NOT NULL,
  `accident_type_setup.html` varchar(20) NOT NULL,
  `home.html` varchar(9) NOT NULL,
  `profile_tim.html` varchar(16) NOT NULL DEFAULT 'TRUE',
  `signal_map.html` varchar(15) NOT NULL DEFAULT 'TRUE',
  `signal_live.html` varchar(16) NOT NULL DEFAULT 'TRUE',
  `nms_signal2.html` varchar(16) NOT NULL DEFAULT 'TRUE',
  `add_signal.html` varchar(15) NOT NULL DEFAULT 'TRUE',
  `signal_control.html` varchar(19) NOT NULL DEFAULT 'TRUE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `htms_authentication`
--

INSERT INTO `htms_authentication` (`Role`, `Module`, `Role_ID`, `vms_map.html`, `vms_live.html`, `nms_vms2.html`, `vms_logs.html`, `vms_display_msg.html`, `vms_set_msg.html`, `vms_setup.html`, `met_map.html`, `met_live.html`, `met_createReport.html`, `nms_met2.html`, `met_setup.html`, `atcc_map.html`, `atcc_live.html`, `atcc_real.html`, `atcc_createReport.html`, `atcc_createArchivalReport.html`, `nms_atcc2.html`, `atcc_setup.html`, `cctv_map.html`, `cctv_live.html`, `cctv_live_public.html`, `nms_cctv2.html`, `cctv_setup.html`, `ecb_map.html`, `ecb.html`, `ecb_setup.html`, `rule_live.html`, `manage_rules.html`, `rule_details.html`, `profile_met.html`, `profile_atcc.html`, `nms.html`, `nms_other.html`, `backgroundServices.html`, `nms_vms.html`, `nms_met.html`, `nms_atcc.html`, `nms_cctv.html`, `nms_ecb.html`, `user_management.html`, `changePassword.html`, `createSR.html`, `existingSR.html`, `createReportSR.html`, `uptimeReport.html`, `met_automatic_report.html`, `accident_report.html`, `accidents.html`, `accident_vehicle_setup.html`, `accident_setup.html`, `accident_action_setup.html`, `atcc_automatic_report.html`, `accident_type_setup.html`, `home.html`, `profile_tim.html`, `signal_map.html`, `signal_live.html`, `nms_signal2.html`, `add_signal.html`, `signal_control.html`) VALUES
('Super Admin', NULL, '1', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('Admin', NULL, '2', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerVMS', 'VMS', '3', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerMET', 'MET', '4', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerATCC', 'ATCC', '5', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerCCTV', 'CCTV', '6', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerECB', 'ECB', '7', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('ManagerNMS', 'NMS', '8', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorVMS', 'VMS', '9', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorMET', 'MET', '10', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorATCC', 'ATCC', '11', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorCCTV', 'CCTV', '12', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorECB', 'ECB', '13', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE'),
('OperatorNMS', 'NMS', '14', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE');

-- --------------------------------------------------------

--
-- Table structure for table `htms_services`
--

CREATE TABLE `htms_services` (
  `Service_ID` int(11) NOT NULL,
  `Service` char(20) NOT NULL,
  `Frequency` int(11) NOT NULL,
  `LastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `htms_services`
--

INSERT INTO `htms_services` (`Service_ID`, `Service`, `Frequency`, `LastUpdated`) VALUES
(1, 'MET Adapter', 10, '2016-07-11 12:48:00'),
(2, 'NMS', 20, '2016-07-11 12:45:36'),
(3, 'Rule Engine', 20, '2016-07-11 12:45:02'),
(4, 'VMS Adapter', 5, '2016-07-11 12:52:00'),
(5, 'ATCC Adapter', 5, '2016-07-11 12:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `mapping_user`
--

CREATE TABLE `mapping_user` (
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapping_user`
--

INSERT INTO `mapping_user` (`user_id`, `role_id`) VALUES
(66, 1),
(67, 1),
(1, 1),
(49, 3),
(49, 7);

-- --------------------------------------------------------

--
-- Table structure for table `nms_alerts`
--

CREATE TABLE `nms_alerts` (
  `vms` tinyint(1) NOT NULL DEFAULT '0',
  `meterological` tinyint(1) NOT NULL DEFAULT '0',
  `cctv` tinyint(1) NOT NULL DEFAULT '0',
  `detector` tinyint(1) NOT NULL DEFAULT '0',
  `ip` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nms_alerts`
--

INSERT INTO `nms_alerts` (`vms`, `meterological`, `cctv`, `detector`, `ip`) VALUES
(0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nms_ip_address`
--

CREATE TABLE `nms_ip_address` (
  `RowId` int(11) NOT NULL,
  `IPAddress` varchar(50) NOT NULL,
  `Description1` varchar(50) NOT NULL,
  `Description2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nms_ip_address`
--

INSERT INTO `nms_ip_address` (`RowId`, `IPAddress`, `Description1`, `Description2`) VALUES
(1, 'www.google.com', 'test', 'test3'),
(2, '192.168.1.211', 'NVR', '206 TOLL PLAZA HTMS ROOM'),
(3, '192.168.1.12', 'MET SYSTEM', '206 TOLL PLAZA HTMS ROOM'),
(7, '192.168.1.13', 'ECB WORKSTATION', '206 TOLL PLAZA HTMS ROOM'),
(8, '192.168.1.14', 'VMS WORKSTATION', '206 TOLL PLAZA HTMS ROOM'),
(9, '192.168.1.15', 'ATCC WORKSTATION', '206 TOLL PLAZA HTMS ROOM'),
(12, '192.168.1.100', 'HTMS SYSTEM (SERVER)', '206 PLAZA HTMS ROOM'),
(21, '192.168.1.101', 'GSM GATEWAY', '1'),
(22, '192.168.1.44', 'DESKTOP SYSTEM', 'TOLL PLAZA 206'),
(23, '192.168.1.45', 'RADIO SYSTEM-2', 'TOLL PLAZA 206'),
(24, '192.168.1.46', 'RADIO SYSTEM-3', 'TOLL PLAZA 260'),
(25, '192.168.1.47', 'DESKTOP SYSTEM', 'TOLL PLAZA 260'),
(26, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `nms_ip_fault`
--

CREATE TABLE `nms_ip_fault` (
  `IPAddress` varchar(20) NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nms_ip_fault`
--

INSERT INTO `nms_ip_fault` (`IPAddress`, `LastUpdated`, `online`, `time`) VALUES
('192.168.1.44', '2016-07-04 19:52:00', 0, 1),
('192.168.1.45', '2016-07-04 19:52:04', 0, 1),
('192.168.1.45', '2016-07-19 06:45:42', 1, 20813),
('192.168.1.45', '2016-07-19 07:15:35', 0, 29),
('192.168.1.44', '2016-08-11 09:17:15', 1, 54085),
('192.168.1.44', '2016-08-11 10:01:11', 0, 43),
('192.168.1.45', '2016-08-26 06:15:30', 1, 54659),
('192.168.1.45', '2016-08-26 07:15:35', 0, 60),
('192.168.1.45', '2016-08-26 07:45:41', 1, 30),
('192.168.1.45', '2016-08-26 08:00:35', 0, 14),
('192.168.1.45', '2016-08-26 09:45:31', 1, 104),
('192.168.1.45', '2016-08-26 11:30:34', 0, 105),
('192.168.1.13', '2016-09-11 02:30:36', 0, 98319),
('192.168.1.13', '2016-09-11 18:30:27', 1, 959),
('192.168.1.44', '2016-09-21 09:00:57', 1, 58979),
('192.168.1.45', '2016-09-21 09:00:58', 1, 37290),
('192.168.1.46', '2016-09-21 09:00:59', 1, 113145),
('192.168.1.47', '2016-09-21 09:01:00', 1, 113145),
('192.168.1.44', '2016-09-21 09:46:37', 0, 45),
('192.168.1.45', '2016-09-21 09:46:40', 0, 45),
('192.168.1.46', '2016-09-21 09:46:44', 0, 45),
('192.168.1.47', '2016-09-21 09:46:48', 0, 45),
('192.168.1.45', '2016-09-30 05:15:35', 1, 12688),
('192.168.1.45', '2016-09-30 05:45:37', 0, 30),
('192.168.1.45', '2016-09-30 06:15:34', 1, 29),
('192.168.1.45', '2016-09-30 07:00:35', 0, 45),
('192.168.1.45', '2016-09-30 08:30:31', 1, 89),
('192.168.1.45', '2016-09-30 09:00:34', 0, 30),
('192.168.1.45', '2016-10-05 06:15:41', 1, 7035),
('192.168.1.45', '2016-10-05 07:15:34', 0, 59),
('192.168.1.45', '2016-10-08 09:15:53', 1, 4440),
('192.168.1.45', '2016-10-08 09:30:58', 0, 15),
('192.168.1.101', '2016-10-13 13:00:43', 0, 145029),
('192.168.1.45', '2016-10-14 06:15:49', 1, 8444),
('192.168.1.45', '2016-10-14 07:00:53', 0, 45),
('192.168.1.45', '2016-10-16 06:16:05', 1, 2835),
('192.168.1.45', '2016-10-16 06:30:53', 0, 14),
('192.168.1.45', '2016-10-16 07:00:56', 1, 30),
('192.168.1.45', '2016-10-16 07:45:51', 0, 44),
('192.168.1.44', '2016-11-07 09:45:55', 1, 67679),
('192.168.1.101', '2016-11-07 10:30:41', 1, 35849),
('192.168.1.14', '2016-11-12 22:30:46', 0, 188799),
('192.168.1.14', '2016-11-13 02:30:44', 1, 239),
('192.168.1.12', '2016-12-12 16:00:32', 0, 231609),
('192.168.1.12', '2016-12-12 18:15:39', 1, 135);

-- --------------------------------------------------------

--
-- Table structure for table `re_actions`
--

CREATE TABLE `re_actions` (
  `DummyId` int(11) NOT NULL,
  `RuleId` tinyint(25) NOT NULL,
  `Command` varchar(255) DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  `Device` varchar(20) DEFAULT NULL,
  `slide` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `re_actions`
--

INSERT INTO `re_actions` (`DummyId`, `RuleId`, `Command`, `Action`, `Device`, `slide`) VALUES
(5, 1, 'undefined', 'VMS', 'VMS-001', NULL),
(9, 1, 'Drive carefully', 'VMS', 'VMS-001', NULL),
(10, 6, 'Drive carefully', 'VMS', 'VMS-001', NULL),
(11, 6, 'Drive carefully', 'VMS', 'VMS-002', NULL),
(12, 6, 'Drive carefully', 'VMS', 'VMS-003', NULL),
(13, 7, 'HIGH TEMPERATURE, DRIVE SLOWLY', 'VMS', 'VMS-001', 13),
(14, 7, 'HIGH TEMPERATURE, DRIVE SLOWLY', 'VMS', 'VMS-002', 13),
(15, 7, 'HIGH TEMPERATURE, DRIVE SLOWLY', 'VMS', 'VMS-003', 13),
(16, 7, 'HIGH TEMPERATURE, DRIVE SLOWLY', 'VMS', 'VMS-004', 13),
(17, 8, 'DRIVE SLOWER LIVE LONGER', 'VMS', 'VMS-001', 13),
(18, 8, 'DRIVE SLOWER LIVE LONGER', 'VMS', 'VMS-002', 13),
(19, 8, 'DRIVE SLOWER LIVE LONGER', 'VMS', 'VMS-003', 13),
(20, 8, 'DRIVE SLOWER LIVE LONGER', 'VMS', 'VMS-004', 13),
(23, 9, 'HIGH AIR TEMPERATURE', 'VMS', 'VMS-001', 13),
(24, 9, 'WELCOME TO BFHL-NHAI', 'VMS', 'VMS-003', 13),
(25, 11, 'STAY ALIVE THINK AND DRIVE', 'VMS', 'VMS-001', 13),
(29, 0, '', '', '', 0),
(28, 11, 'CYC001', 'TIM', 'aklnfds', 0);

-- --------------------------------------------------------

--
-- Table structure for table `re_rules`
--

CREATE TABLE `re_rules` (
  `DummyId` int(11) NOT NULL,
  `RuleId` tinyint(25) NOT NULL,
  `ObjectName` varchar(25) DEFAULT NULL,
  `SystemCodeNumber` char(32) DEFAULT NULL,
  `VariableName` varchar(100) DEFAULT NULL,
  `ProfileId` char(32) DEFAULT NULL,
  `Logic` varchar(5) DEFAULT NULL,
  `Threshold` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `re_rules`
--

INSERT INTO `re_rules` (`DummyId`, `RuleId`, `ObjectName`, `SystemCodeNumber`, `VariableName`, `ProfileId`, `Logic`, `Threshold`) VALUES
(35, 1, 'MET', 'MET-004', 'Road Temp', '3', '1', 'undef'),
(36, 1, 'ATCC', 'ATCC-003', 'Speed', '2', '-1', NULL),
(3, 2, 'meteorological', 'MET-001', 'VisibilityDist', '1', '0', NULL),
(4, 2, 'meteorological', 'MET-001', 'Precipitation', '1', '0', NULL),
(5, 3, 'meteorological', 'MET-001', 'AirTemp', '1', '0', NULL),
(32, 1, 'ATCC', 'ATCC-001', 'Occupancy', '2', '0', NULL),
(33, 1, 'MET', 'MET-001', 'Air Temperature', '1', '1', 'Drive'),
(37, 1, 'MET', 'MET-002', 'Road Temp', '2', '0', NULL),
(38, 6, 'MET', 'MET-001', 'Visibility Dist', '1', '-1', NULL),
(39, 7, 'MET', 'MET-001', 'RoadTemp', '4', NULL, '1'),
(40, 8, 'MET', 'MET-001', 'RoadTemp', '4', NULL, '0'),
(41, 9, 'MET', 'MET-001', 'AirTemp', '5', NULL, '1'),
(44, 11, 'MET', 'MET-001', 'WindSpeed', '6', NULL, '0'),
(45, 0, '', '', '', '', NULL, ''),
(46, 11, 'ATCC', 'ATCC-001', 'TotalFlow', '2', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `modules` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `modules`) VALUES
(1, 'Admin', ' Admin'),
(2, 'ManagerVMS', 'VMS'),
(3, 'ManagerMET', 'MET'),
(4, 'ManagerATCC', 'ATCC'),
(5, 'ManagerCCTV', 'CCTV'),
(6, 'ManagerECB', 'ECB'),
(7, 'ManagerNMS', 'NMS'),
(8, 'OperatorVMS', 'VMS'),
(9, 'OperatorMET', 'MET'),
(10, 'OperatorATCC', 'ATCC'),
(11, 'OperatorCCTV', 'CCTV'),
(12, 'OperatorECB', 'ECB'),
(13, 'OperatorNMS', 'NMS'),
(14, 'ManagerMaintenance', 'Maintenance'),
(15, 'OperatorMaintenance', 'Maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `RuleID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `ChannelOneSCN` char(32) DEFAULT NULL,
  `ChannelTwoSCN` char(32) DEFAULT NULL,
  `ChannelOneAttr` char(255) DEFAULT NULL,
  `ChannelOneAttrTrigger` char(32) DEFAULT NULL,
  `ChannelOneAttrCondition` char(255) DEFAULT NULL,
  `ChannelTwoAttr` char(255) DEFAULT NULL,
  `ChannelTwoAttrTrigger` char(255) DEFAULT NULL,
  `ChannelTwoAttrCondition` char(255) DEFAULT NULL,
  `LastUpdated` datetime NOT NULL,
  `FromTimeSun` time DEFAULT NULL,
  `ToTimeSun` time DEFAULT NULL,
  `FromTimeMon` time DEFAULT NULL,
  `ToTimeMon` time DEFAULT NULL,
  `FromTimeTue` time DEFAULT NULL,
  `ToTimeTue` time DEFAULT NULL,
  `FromTimeWed` time DEFAULT NULL,
  `ToTimeWed` time DEFAULT NULL,
  `FromTimeThu` time DEFAULT NULL,
  `ToTimeThu` time DEFAULT NULL,
  `FromTimeFri` time DEFAULT NULL,
  `ToTimeFri` time DEFAULT NULL,
  `FromTimeSat` time DEFAULT NULL,
  `ToTimeSat` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`RuleID`, `Title`, `LongDescription`, `ChannelOneSCN`, `ChannelTwoSCN`, `ChannelOneAttr`, `ChannelOneAttrTrigger`, `ChannelOneAttrCondition`, `ChannelTwoAttr`, `ChannelTwoAttrTrigger`, `ChannelTwoAttrCondition`, `LastUpdated`, `FromTimeSun`, `ToTimeSun`, `FromTimeMon`, `ToTimeMon`, `FromTimeTue`, `ToTimeTue`, `FromTimeWed`, `ToTimeWed`, `FromTimeThu`, `ToTimeThu`, `FromTimeFri`, `ToTimeFri`, `FromTimeSat`, `ToTimeSat`) VALUES
(11, 'HEAVY WIND', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 17:09:26', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00'),
(12, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-12 12:17:45', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tis_accident_action_relation`
--

CREATE TABLE `tis_accident_action_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_name` text NOT NULL,
  `type_name` text NOT NULL,
  `type_relation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_accident_action_relation`
--

INSERT INTO `tis_accident_action_relation` (`id`, `action_name`, `type_name`, `type_relation`) VALUES
(29, 'ss', 'asd', 'true'),
(30, 'ss', 'just a test', 'false'),
(31, 'ss', 'something', 'false'),
(32, 'ss', 'Ambu', 'false'),
(33, 'ss', 'VMS', 'false'),
(34, 'ss', 'Camera', 'false'),
(35, 'Vehicle Emergency', 'Ambulance', 'true'),
(36, 'Vehicle Emergency', 'asd', 'false'),
(37, 'Vehicle Emergency', 'just a test', 'false'),
(38, 'Vehicle Emergency', 'something', 'false'),
(39, 'Vehicle Emergency', 'VMS', 'true'),
(40, 'Vehicle Emergency', 'Camera', 'true'),
(41, 'Something', 'Ambulance', 'true'),
(42, 'Something', 'asd', 'false'),
(43, 'Something', 'just a test', 'false'),
(44, 'Something', 'something', 'false'),
(45, 'Something', 'VMS', 'false'),
(46, 'Something', 'Camera', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `tis_accident_action_setup`
--

CREATE TABLE `tis_accident_action_setup` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_accident_action_setup`
--

INSERT INTO `tis_accident_action_setup` (`id`, `name`, `updated_time`) VALUES
(1, 'Something', '2016-12-02 11:57:45'),
(2, 'Vehicle Emergency', '2016-12-02 12:15:49'),
(3, 'ss', '2016-12-23 04:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `tis_accident_type_setup`
--

CREATE TABLE `tis_accident_type_setup` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `action` varchar(32) NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_accident_type_setup`
--

INSERT INTO `tis_accident_type_setup` (`id`, `name`, `action`, `updated_time`) VALUES
(1, 'Camera', 'cctvWindow.html', '2016-12-13 09:06:20'),
(2, 'VMS', 'vms_display_msg.html', '2016-12-13 09:06:11'),
(24, 'Ambulance', '9176484536', '2016-12-23 05:06:02'),
(26, 'Patrol', '4598845223', '2016-12-23 07:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `tis_cctv_fault`
--

CREATE TABLE `tis_cctv_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_cctv_fault`
--

INSERT INTO `tis_cctv_fault` (`SystemCodeNumber`, `LastUpdated`, `online`, `time`) VALUES
('PTZ 206 LHS', '2016-10-26 10:00:14', 1, 794),
('PTZ CH 260 LHS', '2016-10-26 11:30:17', 1, 224),
('PTZ 206 LHS', '2016-10-26 20:45:17', 0, 645),
('PTZ 206 LHS', '2016-10-27 11:45:17', 1, 900),
('PTZ 206 LHS', '2016-10-27 22:45:17', 0, 660),
('PTZ 206 LHS', '2016-10-29 09:00:14', 1, 2054),
('PTZ 206 LHS', '2016-10-29 20:00:16', 0, 660),
('PTZ 206 LHS', '2016-10-30 12:30:13', 1, 989),
('PTZ 206 LHS', '2016-10-30 23:30:17', 0, 660),
('PTZ 206 LHS', '2016-10-31 10:30:14', 1, 659),
('PTZ 206 LHS', '2016-10-31 21:15:17', 0, 645),
('PTZ 206 LHS', '2016-11-01 12:00:14', 1, 884),
('PTZ 206 LHS', '2016-11-01 22:45:17', 0, 645),
('PTZ 230', '2016-11-02 10:15:22', 0, 35730),
('PTZ CH 226', '2016-11-02 10:15:37', 0, 117780),
('PTZ CH 237', '2016-11-02 10:15:48', 0, 43080),
('PTZ CH 243', '2016-11-02 10:15:59', 0, 109170),
('PTZ CH 260 LHS', '2016-11-02 10:16:10', 0, 10005),
('PTZ CH-275', '2016-11-02 10:16:24', 0, 109170),
('PTZ 206 LHS', '2016-11-02 11:00:17', 1, 735),
('PTZ 206 LHS', '2016-11-02 22:00:20', 0, 660),
('PTZ 230', '2016-11-03 12:00:17', 1, 1544),
('PTZ CH 226', '2016-11-03 12:00:29', 1, 1544),
('PTZ CH 237', '2016-11-03 12:00:37', 1, 1544),
('PTZ CH 243', '2016-11-03 12:00:46', 1, 1544),
('PTZ CH 260 LHS', '2016-11-03 12:00:56', 1, 1544),
('PTZ CH-275', '2016-11-03 12:01:07', 1, 1544),
('PTZ 206 LHS', '2016-11-03 13:00:14', 1, 899),
('PTZ 206 LHS', '2016-11-04 00:00:17', 0, 660),
('PTZ 206 LHS', '2016-11-04 09:30:14', 1, 569),
('PTZ 206 LHS', '2016-11-04 11:45:17', 0, 135),
('PTZ 206 LHS', '2016-11-05 16:15:14', 1, 1709),
('PTZ 206 LHS', '2016-11-06 03:00:17', 0, 645),
('PTZ CH 206 RHS', '2016-11-07 13:15:19', 0, 180750),
('PTZ CH 206 RHS', '2016-11-07 16:30:17', 1, 194),
('PTZ 206 LHS', '2016-11-08 11:00:14', 1, 3359),
('PTZ 206 LHS', '2016-11-08 22:00:17', 0, 660),
('PTZ 206 LHS', '2016-11-10 14:00:14', 1, 2399),
('PTZ 206 LHS', '2016-11-11 01:00:17', 0, 660),
('PTZ 206 LHS', '2016-11-12 11:30:17', 1, 2070),
('PTZ 206 LHS', '2016-11-12 22:30:20', 0, 660),
('PTZ 206 LHS', '2016-11-15 10:45:20', 1, 3615),
('PTZ 206 LHS', '2016-11-15 21:45:23', 0, 660),
('PTZ 206 LHS', '2016-11-16 10:00:19', 1, 734),
('PTZ 206 LHS', '2016-11-16 20:45:19', 0, 645),
('PTZ CH 206 RHS', '2016-11-17 16:00:36', 0, 14370),
('PTZ CH 206 RHS', '2016-11-17 17:45:23', 1, 104),
('PTZ 206 LHS', '2016-11-18 11:00:20', 1, 2295),
('PTZ 206 LHS', '2016-11-18 21:45:23', 0, 645),
('PTZ 206 LHS', '2016-11-19 10:00:20', 1, 734),
('PTZ CH 237', '2016-11-19 17:45:26', 0, 23384),
('PTZ CH 206 RHS', '2016-11-19 18:15:23', 0, 2910),
('PTZ 206 LHS', '2016-11-19 20:45:23', 0, 645),
('PTZ CH 206 RHS', '2016-11-20 11:00:23', 1, 1005),
('PTZ 206 LHS', '2016-11-20 11:15:25', 1, 870),
('PTZ 206 LHS', '2016-11-20 22:00:23', 0, 644),
('PTZ 206 LHS', '2016-11-21 11:30:20', 1, 809),
('PTZ 206 LHS', '2016-11-21 22:30:23', 0, 660),
('PTZ 206 LHS', '2016-11-22 09:30:20', 1, 659),
('PTZ 206 LHS', '2016-11-22 20:30:20', 0, 660),
('PTZ 206 LHS', '2016-11-24 10:30:17', 1, 2279),
('PTZ 206 LHS', '2016-11-24 21:15:20', 0, 645),
('PTZ 206 LHS', '2016-11-25 15:15:17', 1, 1079),
('PTZ 206 LHS', '2016-11-26 02:15:20', 0, 660),
('PTZ 230', '2016-11-26 05:30:23', 0, 32730),
('PTZ CH 226', '2016-11-27 06:00:29', 0, 34200),
('PTZ CH 243', '2016-11-27 06:00:43', 0, 34199),
('PTZ CH 260 LHS', '2016-11-27 06:00:54', 0, 34199),
('PTZ CH-275', '2016-11-27 06:01:07', 0, 34200),
('PTZ CH 226', '2016-11-28 12:30:26', 1, 1829),
('PTZ CH 243', '2016-11-28 12:30:39', 1, 1829),
('PTZ CH 260 LHS', '2016-11-28 12:30:47', 1, 1829),
('PTZ 230', '2016-11-28 13:15:20', 1, 3344),
('PTZ 206 LHS', '2016-11-28 13:30:17', 1, 3554),
('PTZ 230', '2016-11-28 20:30:20', 0, 435),
('PTZ 206 LHS', '2016-11-29 00:30:20', 0, 660),
('PTZ 206 LHS', '2016-11-29 10:45:17', 1, 614),
('PTZ 206 LHS', '2016-11-29 21:30:20', 0, 645),
('PTZ 206 LHS', '2016-11-30 10:15:17', 1, 764),
('PTZ 206 LHS', '2016-11-30 21:00:20', 0, 645),
('PTZ 206 LHS', '2016-12-01 10:30:17', 1, 809),
('PTZ 230', '2016-12-01 10:45:17', 1, 3734),
('PTZ 230', '2016-12-01 17:45:20', 0, 420),
('PTZ CH-275', '2016-12-02 11:30:30', 1, 7529),
('PTZ 230', '2016-12-02 13:00:17', 1, 1154),
('PTZ 230', '2016-12-02 19:15:20', 0, 375),
('PTZ 230', '2016-12-03 12:00:17', 1, 1004),
('PTZ 206 LHS', '2016-12-05 16:45:19', 0, 6135),
('PTZ 230', '2016-12-06 06:30:23', 0, 3990),
('PTZ 230', '2016-12-06 11:30:20', 1, 299),
('PTZ 206 LHS', '2016-12-07 10:15:17', 1, 2489),
('PTZ 206 LHS', '2016-12-07 11:45:20', 0, 90),
('PTZ 206 LHS', '2016-12-07 12:45:16', 1, 59),
('PTZ 230', '2016-12-13 06:45:20', 0, 9795),
('PTZ 230', '2016-12-13 11:00:17', 1, 254),
('PTZ 230', '2016-12-13 23:45:20', 0, 765),
('PTZ 230', '2016-12-16 10:00:17', 1, 3494),
('PTZ 230', '2016-12-16 10:30:20', 0, 30),
('PTZ 230', '2016-12-16 12:00:17', 1, 89),
('PTZ 230', '2016-12-16 12:45:19', 0, 45);

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_auto_rep`
--

CREATE TABLE `tis_detector_auto_rep` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` text NOT NULL,
  `frequency` text NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_class_config`
--

CREATE TABLE `tis_detector_class_config` (
  `binNumber` tinyint(4) NOT NULL,
  `binName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_detector_class_config`
--

INSERT INTO `tis_detector_class_config` (`binNumber`, `binName`) VALUES
(1, 'Bike'),
(2, 'Car/Jeep'),
(3, 'LCV'),
(4, 'Truck/Bus'),
(5, '3-Axle'),
(6, 'M-Axle'),
(7, 'Tractor'),
(8, 'Jugaad'),
(0, 'Not Identified');

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_dynamic_vbv`
--

CREATE TABLE `tis_detector_dynamic_vbv` (
  `ID` int(11) NOT NULL,
  `SCN` varchar(10) NOT NULL,
  `TowardsToll` tinyint(1) NOT NULL,
  `Lane` tinyint(4) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DataAvailable` tinyint(1) NOT NULL,
  `errorCode` tinyint(4) DEFAULT NULL,
  `Speed` float DEFAULT NULL,
  `VehicleLength` smallint(6) DEFAULT NULL,
  `ClassByAxle` tinyint(4) DEFAULT NULL,
  `ClassBySpeed` tinyint(4) DEFAULT NULL,
  `ClassByLength` tinyint(4) DEFAULT NULL,
  `NumberOfAxle` tinyint(11) DEFAULT NULL,
  `AxleLength1` smallint(6) DEFAULT NULL,
  `AxleLength2` smallint(6) DEFAULT NULL,
  `AxleLength3` smallint(6) DEFAULT NULL,
  `AxleLength4` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_detector_dynamic_vbv`
--

INSERT INTO `tis_detector_dynamic_vbv` (`ID`, `SCN`, `TowardsToll`, `Lane`, `TimeStamp`, `DataAvailable`, `errorCode`, `Speed`, `VehicleLength`, `ClassByAxle`, `ClassBySpeed`, `ClassByLength`, `NumberOfAxle`, `AxleLength1`, `AxleLength2`, `AxleLength3`, `AxleLength4`) VALUES
(2, 'ATCC-001', 1, 3, '2016-10-18 09:12:38', 1, 3, 26.7, 786, 6, 4, 6, 3, 299, 118, 0, 0),
(3, 'ATCC-001', 0, 1, '2016-10-18 09:13:34', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'ATCC-001', 1, 3, '2016-10-18 09:25:46', 1, 3, 52.7, 508, 3, 4, 4, 2, 325, 0, 0, 0),
(5, 'ATCC-001', 1, 3, '2016-10-18 09:27:18', 1, 3, 46.9, 771, 3, 4, 6, 2, 377, 0, 0, 0),
(6, 'ATCC-001', 0, 1, '2016-10-18 09:27:17', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'ATCC-001', 1, 3, '2016-10-18 09:27:20', 1, 3, 48.4, 598, 3, 4, 4, 2, 330, 0, 0, 0),
(8, 'ATCC-001', 0, 2, '2016-10-18 09:27:20', 1, 3, 48.7, 1025, 6, 4, 7, 3, 424, 146, 0, 0),
(9, 'ATCC-001', 0, 1, '2016-10-18 09:28:33', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'ATCC-001', 1, 3, '2016-10-18 09:28:38', 1, 3, 28.9, 1009, 6, 4, 7, 3, 388, 112, 0, 0),
(11, 'ATCC-001', 0, 2, '2016-10-18 09:31:01', 1, 3, 46.8, 835, 3, 4, 6, 2, 428, 0, 0, 0),
(12, 'ATCC-001', 0, 1, '2016-10-18 09:32:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'ATCC-001', 1, 3, '2016-10-18 09:33:01', 1, 3, 45.1, 843, 3, 4, 6, 2, 386, 0, 0, 0),
(14, 'ATCC-001', 1, 4, '2016-10-18 09:34:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'ATCC-001', 0, 1, '2016-10-18 09:35:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 'ATCC-001', 1, 3, '2016-10-18 09:36:01', 1, 3, 31.3, 975, 6, 4, 7, 3, 385, 109, 0, 0),
(17, 'ATCC-001', 1, 4, '2016-10-18 09:37:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 'ATCC-001', 1, 3, '2016-10-18 09:37:50', 1, 3, 45.6, 573, 3, 4, 4, 2, 319, 0, 0, 0),
(19, 'ATCC-001', 0, 1, '2016-10-18 09:38:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 'ATCC-001', 1, 3, '2016-10-18 09:38:33', 1, 3, 55.6, 554, 3, 4, 4, 2, 316, 0, 0, 0),
(21, 'ATCC-001', 1, 4, '2016-10-18 09:38:34', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 'ATCC-001', 1, 3, '2016-10-18 09:38:35', 1, 3, 60.7, 525, 2, 4, 4, 2, 272, 0, 0, 0),
(23, 'ATCC-001', 0, 2, '2016-10-18 09:38:36', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 'ATCC-001', 0, 1, '2016-10-18 09:38:36', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 'ATCC-001', 1, 3, '2016-10-18 09:38:56', 1, 3, 35.8, 1310, 6, 4, 8, 3, 568, 143, 0, 0),
(26, 'ATCC-001', 1, 3, '2016-10-18 09:39:01', 1, 3, 53.1, 597, 3, 4, 4, 2, 334, 0, 0, 0),
(27, 'ATCC-001', 1, 4, '2016-10-18 09:40:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 'ATCC-001', 0, 1, '2016-10-18 09:41:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 'ATCC-001', 1, 3, '2016-10-18 09:42:01', 1, 3, 36.7, 1658, 8, 4, 9, 4, 321, 790, 129, 0),
(30, 'ATCC-001', 1, 3, '2016-10-18 09:43:01', 1, 3, 26.1, 887, 1, 4, 6, 2, 116, 0, 0, 0),
(31, 'ATCC-001', 1, 3, '2016-10-18 09:44:01', 1, 3, 33, 1154, 5, 4, 7, 2, 548, 0, 0, 0),
(32, 'ATCC-001', 1, 3, '2016-10-18 09:45:01', 1, 3, 28.1, 1687, 8, 4, 9, 4, 299, 848, 131, 0),
(33, 'ATCC-001', 0, 2, '2016-10-18 09:47:01', 1, 3, 45.4, 856, 3, 4, 6, 2, 437, 0, 0, 0),
(34, 'ATCC-001', 0, 1, '2016-10-18 09:46:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 'ATCC-001', 1, 3, '2016-10-18 09:48:01', 1, 3, 49.1, 462, 2, 4, 4, 2, 212, 0, 0, 0),
(36, 'ATCC-001', 1, 3, '2016-10-18 09:49:01', 1, 3, 28.6, 816, 6, 4, 6, 3, 396, 118, 0, 0),
(37, 'ATCC-001', 1, 3, '2016-10-18 09:50:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 'ATCC-001', 1, 3, '2016-10-18 09:51:01', 1, 3, 45.3, 485, 3, 4, 4, 2, 417, 0, 0, 0),
(39, 'ATCC-001', 0, 2, '2016-10-18 09:52:01', 1, 3, 43.7, 1478, 8, 4, 8, 4, 347, 517, 139, 0),
(40, 'ATCC-001', 0, 2, '2016-10-18 09:53:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 'ATCC-001', 0, 1, '2016-10-18 09:54:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 'ATCC-001', 1, 4, '2016-10-18 09:55:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 'ATCC-001', 1, 4, '2016-10-18 09:56:01', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 'ATCC-001', 1, 3, '2016-10-18 09:57:01', 1, 3, 27.5, 998, 6, 4, 7, 3, 386, 109, 0, 0),
(45, 'ATCC-001', 1, 3, '2016-10-18 09:58:01', 1, 3, 65.7, 437, 2, 4, 3, 2, 244, 0, 0, 0),
(46, 'ATCC-001', 1, 3, '2016-10-18 09:59:01', 1, 3, 50.9, 508, 2, 4, 4, 2, 250, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_dynamic_vbv_archived`
--

CREATE TABLE `tis_detector_dynamic_vbv_archived` (
  `ID` int(11) NOT NULL,
  `SCN` varchar(10) NOT NULL,
  `TowardsToll` tinyint(1) NOT NULL,
  `Lane` tinyint(4) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DataAvailable` tinyint(1) NOT NULL,
  `errorCode` tinyint(4) DEFAULT NULL,
  `Speed` float DEFAULT NULL,
  `VehicleLength` smallint(6) DEFAULT NULL,
  `ClassByAxle` tinyint(4) DEFAULT NULL,
  `ClassBySpeed` tinyint(4) DEFAULT NULL,
  `ClassByLength` tinyint(4) DEFAULT NULL,
  `NumberOfAxle` tinyint(11) DEFAULT NULL,
  `AxleLength1` smallint(6) DEFAULT NULL,
  `AxleLength2` smallint(6) DEFAULT NULL,
  `AxleLength3` smallint(6) DEFAULT NULL,
  `AxleLength4` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_detector_dynamic_vbv_archived`
--

INSERT INTO `tis_detector_dynamic_vbv_archived` (`ID`, `SCN`, `TowardsToll`, `Lane`, `TimeStamp`, `DataAvailable`, `errorCode`, `Speed`, `VehicleLength`, `ClassByAxle`, `ClassBySpeed`, `ClassByLength`, `NumberOfAxle`, `AxleLength1`, `AxleLength2`, `AxleLength3`, `AxleLength4`) VALUES
(203972, 'ATCC-002', 0, 4, '2016-07-07 13:04:01', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203973, 'ATCC-002', 0, 4, '2016-07-07 13:04:14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203974, 'ATCC-002', 0, 3, '2016-07-07 13:04:15', 1, 3, 33.5, 903, 6, 4, 6, 3, 382, 131, 0, 0),
(203975, 'ATCC-002', 1, 2, '2016-07-07 13:04:17', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203976, 'ATCC-002', 0, 4, '2016-07-07 13:04:17', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203977, 'ATCC-002', 1, 1, '2016-07-07 13:04:35', 1, 3, 56.9, 12, 2, 3, 1, 2, 229, 0, 0, 0),
(203978, 'ATCC-002', 1, 1, '2016-07-07 13:04:35', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203979, 'ATCC-002', 0, 4, '2016-07-07 13:04:39', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203980, 'ATCC-002', 0, 3, '2016-07-07 13:04:39', 1, 3, 42.7, 122, 2, 4, 1, 2, 232, 0, 0, 0),
(203981, 'ATCC-002', 1, 1, '2016-07-07 13:05:13', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203982, 'ATCC-002', 1, 2, '2016-07-07 13:05:19', 1, 3, 61.3, 283, 1, 4, 2, 2, 177, 0, 0, 0),
(203983, 'ATCC-002', 0, 4, '2016-07-07 13:05:24', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203984, 'ATCC-002', 0, 3, '2016-07-07 13:05:25', 1, 3, 48.1, 116, 2, 4, 1, 2, 233, 0, 0, 0),
(203985, 'ATCC-002', 1, 1, '2016-07-07 13:05:35', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203986, 'ATCC-002', 1, 1, '2016-07-07 13:05:42', 1, 3, 37.4, 12, 2, 3, 1, 2, 231, 0, 0, 0),
(203987, 'ATCC-002', 1, 1, '2016-07-07 13:05:42', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203988, 'ATCC-002', 0, 3, '2016-07-07 13:05:44', 1, 3, 55.1, 473, 2, 4, 4, 2, 240, 0, 0, 0),
(203989, 'ATCC-002', 1, 1, '2016-07-07 13:06:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203990, 'ATCC-002', 1, 2, '2016-07-07 13:06:11', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203991, 'ATCC-002', 1, 1, '2016-07-07 13:06:11', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203992, 'ATCC-002', 1, 1, '2016-07-07 13:06:38', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203993, 'ATCC-002', 1, 2, '2016-07-07 13:06:42', 1, 3, 37.5, 1917, 11, 4, 10, 5, 360, 763, 121, 125),
(203994, 'ATCC-002', 1, 2, '2016-07-07 13:06:52', 1, 3, 71, 428, 2, 4, 3, 2, 254, 0, 0, 0),
(203995, 'ATCC-002', 1, 1, '2016-07-07 13:06:53', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203996, 'ATCC-002', 0, 4, '2016-07-07 13:06:59', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203997, 'ATCC-002', 1, 2, '2016-07-07 13:07:00', 1, 3, 82.4, 267, 2, 4, 2, 2, 243, 0, 0, 0),
(203998, 'ATCC-002', 1, 1, '2016-07-07 13:07:00', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203999, 'ATCC-002', 0, 3, '2016-07-07 13:07:03', 1, 3, 44.5, 463, 2, 4, 4, 2, 248, 0, 0, 0),
(204000, 'ATCC-002', 1, 1, '2016-07-07 13:07:07', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204001, 'ATCC-002', 1, 1, '2016-07-07 13:07:10', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204002, 'ATCC-002', 1, 1, '2016-07-07 13:07:17', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204003, 'ATCC-002', 1, 2, '2016-07-07 13:07:39', 1, 3, 99.7, 503, 2, 4, 4, 2, 265, 0, 0, 0),
(204004, 'ATCC-002', 1, 1, '2016-07-07 13:07:40', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204005, 'ATCC-002', 1, 2, '2016-07-07 13:08:01', 1, 3, 62.3, 119, 1, 4, 1, 2, 128, 0, 0, 0),
(204006, 'ATCC-002', 1, 1, '2016-07-07 13:08:00', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204007, 'ATCC-002', 1, 1, '2016-07-07 13:08:09', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204008, 'ATCC-002', 1, 2, '2016-07-07 13:08:20', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204009, 'ATCC-002', 1, 2, '2016-07-07 13:08:22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204010, 'ATCC-002', 1, 2, '2016-07-07 13:08:24', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204011, 'ATCC-002', 1, 2, '2016-07-07 13:08:25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204012, 'ATCC-002', 1, 1, '2016-07-07 13:08:25', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204013, 'ATCC-002', 0, 4, '2016-07-07 13:08:33', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204014, 'ATCC-002', 0, 3, '2016-07-07 13:08:33', 1, 3, 28.1, 629, 6, 4, 5, 3, 363, 130, 0, 0),
(204015, 'ATCC-002', 1, 2, '2016-07-07 13:08:43', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204016, 'ATCC-002', 1, 1, '2016-07-07 13:08:45', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204017, 'ATCC-002', 1, 1, '2016-07-07 13:08:50', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204018, 'ATCC-002', 0, 4, '2016-07-07 13:09:00', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204019, 'ATCC-002', 0, 3, '2016-07-07 13:10:22', 1, 3, 40, 555, 3, 4, 4, 2, 314, 0, 0, 0),
(204020, 'ATCC-002', 1, 1, '2016-07-07 13:10:22', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204021, 'ATCC-002', 1, 2, '2016-07-07 13:10:51', 1, 3, 53.9, 1346, 2, 4, 8, 2, 196, 0, 0, 0),
(204022, 'ATCC-002', 0, 4, '2016-07-07 13:10:53', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204023, 'ATCC-002', 0, 3, '2016-07-07 13:10:53', 1, 3, 53.5, 500, 2, 4, 4, 2, 302, 0, 0, 0),
(204024, 'ATCC-002', 0, 3, '2016-07-07 13:11:12', 1, 3, 65.8, 479, 2, 4, 4, 2, 266, 0, 0, 0),
(204025, 'ATCC-002', 0, 4, '2016-07-07 13:11:27', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204026, 'ATCC-002', 0, 3, '2016-07-07 13:11:49', 1, 3, 49.4, 509, 2, 4, 4, 2, 307, 0, 0, 0),
(204027, 'ATCC-002', 1, 1, '2016-07-07 13:11:50', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204028, 'ATCC-002', 1, 1, '2016-07-07 13:11:53', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204029, 'ATCC-002', 1, 1, '2016-07-07 13:12:11', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204030, 'ATCC-002', 0, 4, '2016-07-07 13:12:25', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204031, 'ATCC-002', 0, 4, '2016-07-07 13:12:37', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204032, 'ATCC-002', 1, 2, '2016-07-07 13:13:00', 1, 3, 130.7, 661, 3, 4, 5, 2, 389, 0, 0, 0),
(204033, 'ATCC-002', 0, 4, '2016-07-07 13:13:20', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204034, 'ATCC-002', 0, 3, '2016-07-07 13:13:20', 1, 3, 42.1, 604, 3, 4, 4, 2, 400, 0, 0, 0),
(204035, 'ATCC-002', 0, 3, '2016-07-07 13:13:23', 1, 3, 47.5, 474, 2, 4, 4, 2, 246, 0, 0, 0),
(204036, 'ATCC-002', 0, 4, '2016-07-07 13:13:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204037, 'ATCC-002', 0, 3, '2016-07-07 13:13:30', 1, 3, 56, 99, 1, 4, 1, 2, 121, 0, 0, 0),
(204038, 'ATCC-002', 1, 1, '2016-07-07 13:13:34', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204039, 'ATCC-002', 0, 4, '2016-07-07 13:13:41', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204040, 'ATCC-002', 0, 4, '2016-07-07 13:13:43', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204041, 'ATCC-002', 0, 4, '2016-07-07 13:13:45', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204042, 'ATCC-002', 0, 4, '2016-07-07 13:13:46', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204043, 'ATCC-002', 0, 4, '2016-07-07 13:13:48', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204044, 'ATCC-002', 0, 4, '2016-07-07 13:14:09', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204045, 'ATCC-002', 0, 3, '2016-07-07 13:14:09', 1, 3, 37.3, 666, 6, 4, 5, 3, 380, 127, 0, 0),
(204046, 'ATCC-002', 1, 1, '2016-07-07 13:14:25', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204047, 'ATCC-002', 1, 2, '2016-07-07 13:14:29', 1, 3, 67.1, 362, 2, 4, 3, 2, 231, 0, 0, 0),
(204048, 'ATCC-002', 1, 2, '2016-07-07 13:14:44', 1, 3, 90.9, 149, 2, 4, 1, 2, 242, 0, 0, 0),
(204049, 'ATCC-002', 1, 1, '2016-07-07 13:14:44', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204050, 'ATCC-002', 0, 4, '2016-07-07 13:14:52', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204051, 'ATCC-002', 1, 2, '2016-07-07 13:14:54', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204052, 'ATCC-002', 1, 1, '2016-07-07 13:14:54', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204053, 'ATCC-002', 1, 1, '2016-07-07 13:15:00', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204054, 'ATCC-002', 1, 2, '2016-07-07 13:15:02', 1, 3, 80.6, 453, 2, 4, 3, 2, 242, 0, 0, 0),
(204055, 'ATCC-002', 0, 4, '2016-07-07 13:15:10', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204056, 'ATCC-002', 0, 4, '2016-07-07 13:15:44', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204057, 'ATCC-002', 1, 1, '2016-07-07 13:15:45', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204058, 'ATCC-002', 0, 4, '2016-07-07 13:15:51', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204059, 'ATCC-002', 0, 3, '2016-07-07 13:15:52', 1, 3, 35.5, 1030, 2, 4, 7, 2, 234, 0, 0, 0),
(204060, 'ATCC-002', 0, 3, '2016-07-07 13:16:01', 1, 3, 24.9, 785, 8, 4, 6, 4, 168, 327, 129, 0),
(204061, 'ATCC-002', 0, 3, '2016-07-07 13:16:09', 1, 3, 29.6, 117, 2, 4, 1, 2, 231, 0, 0, 0),
(204062, 'ATCC-002', 0, 4, '2016-07-07 13:16:12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204063, 'ATCC-002', 0, 3, '2016-07-07 13:16:12', 1, 3, 43.4, 1072, 5, 4, 7, 2, 536, 0, 0, 0),
(204064, 'ATCC-002', 1, 2, '2016-07-07 13:16:21', 1, 3, 72.4, 515, 2, 4, 4, 2, 243, 0, 0, 0),
(204065, 'ATCC-002', 0, 4, '2016-07-07 13:16:30', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204066, 'ATCC-002', 0, 3, '2016-07-07 13:16:32', 1, 3, 64, 413, 2, 4, 3, 2, 240, 0, 0, 0),
(204067, 'ATCC-002', 0, 3, '2016-07-07 13:16:38', 1, 3, 18.2, 485, 2, 4, 4, 2, 279, 0, 0, 0),
(204068, 'ATCC-002', 1, 2, '2016-07-07 13:17:01', 1, 3, 52.3, 870, 6, 4, 6, 3, 377, 126, 0, 0),
(204069, 'ATCC-002', 0, 4, '2016-07-07 13:17:02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204070, 'ATCC-002', 0, 3, '2016-07-07 13:17:05', 1, 3, 63.5, 476, 2, 4, 4, 2, 274, 0, 0, 0),
(204071, 'ATCC-002', 0, 4, '2016-07-07 13:17:10', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204072, 'ATCC-002', 0, 3, '2016-07-07 13:17:29', 1, 3, 47.1, 990, 6, 4, 7, 3, 448, 139, 0, 0),
(204073, 'ATCC-002', 1, 2, '2016-07-07 13:17:33', 1, 3, 39, 771, 6, 4, 6, 3, 365, 122, 0, 0),
(204074, 'ATCC-002', 1, 1, '2016-07-07 13:17:57', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204075, 'ATCC-002', 1, 1, '2016-07-07 13:18:09', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204076, 'ATCC-002', 0, 4, '2016-07-07 13:18:25', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204077, 'ATCC-002', 0, 3, '2016-07-07 13:18:26', 1, 3, 42.7, 821, 2, 4, 6, 2, 234, 0, 0, 0),
(204078, 'ATCC-002', 0, 3, '2016-07-07 13:18:35', 1, 3, 60.8, 504, 2, 4, 4, 2, 276, 0, 0, 0),
(204079, 'ATCC-002', 0, 4, '2016-07-07 13:18:38', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_error_config`
--

CREATE TABLE `tis_detector_error_config` (
  `errorCode` tinyint(4) NOT NULL,
  `errorName` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_detector_error_config`
--

INSERT INTO `tis_detector_error_config` (`errorCode`, `errorName`) VALUES
(0, 'Both'),
(1, 'Loop 1'),
(2, 'Loop 2'),
(3, '');

-- --------------------------------------------------------

--
-- Table structure for table `tis_detector_fault`
--

CREATE TABLE `tis_detector_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_detector_fault`
--

INSERT INTO `tis_detector_fault` (`SystemCodeNumber`, `LastUpdated`, `online`, `time`) VALUES
('ATCC-001', '2016-08-03 11:00:18', 0, 42375),
('ATCC-001', '2016-08-03 11:15:13', 1, 14),
('ATCC-001', '2016-08-11 04:00:10', 0, 11084),
('ATCC-001', '2016-08-11 06:30:03', 1, 149),
('ATCC-001', '2016-08-11 07:45:11', 0, 75),
('ATCC-001', '2016-08-11 08:15:19', 1, 30),
('ATCC-001', '2016-08-11 09:00:27', 0, 45),
('ATCC-001', '2016-08-11 10:30:08', 1, 89),
('ATCC-002', '2016-08-11 10:30:20', 0, 53865),
('ATCC-001', '2016-08-11 10:45:11', 0, 15),
('ATCC-002', '2016-08-11 10:45:20', 1, 15),
('ATCC-001', '2016-08-11 15:15:21', 1, 270),
('ATCC-001', '2016-08-12 14:00:27', 0, 1365),
('ATCC-001', '2016-08-12 14:30:21', 1, 29),
('ATCC-001', '2016-08-12 15:00:29', 0, 30),
('ATCC-001', '2016-08-12 15:15:20', 1, 14),
('ATCC-001', '2016-08-13 18:15:27', 0, 1620),
('ATCC-001', '2016-08-14 01:45:15', 1, 449),
('ATCC-001', '2016-08-14 02:15:27', 0, 30),
('ATCC-001', '2016-08-14 09:00:23', 1, 404),
('ATCC-001', '2016-08-15 18:15:27', 0, 1995),
('ATCC-001', '2016-08-15 19:30:51', 1, 75),
('ATCC-001', '2016-08-16 06:15:27', 0, 644),
('ATCC-001', '2016-08-18 14:45:22', 1, 3389),
('ATCC-002', '2016-08-22 12:30:05', 0, 15944),
('ATCC-002', '2016-08-22 13:00:02', 1, 29),
('ATCC-002', '2016-08-22 14:00:05', 0, 60),
('ATCC-002', '2016-08-22 15:30:02', 1, 89),
('ATCC-001', '2016-09-01 14:15:08', 0, 20129),
('ATCC-001', '2016-09-21 14:45:02', 1, 28829),
('ATCC-001', '2016-09-21 15:15:33', 0, 30),
('ATCC-001', '2016-09-23 12:30:08', 1, 2714),
('ATCC-001', '2016-09-23 20:00:10', 0, 450),
('ATCC-001', '2016-09-28 15:45:05', 1, 6944),
('ATCC-001', '2016-09-28 16:15:08', 0, 30),
('ATCC-001', '2016-09-28 16:45:05', 1, 29),
('ATCC-001', '2016-09-29 10:15:08', 0, 1050),
('ATCC-001', '2016-09-29 10:30:05', 1, 14),
('ATCC-001', '2016-09-29 11:00:08', 0, 30),
('ATCC-001', '2016-09-29 11:45:05', 1, 44),
('ATCC-001', '2016-10-03 00:00:08', 0, 5055),
('ATCC-002', '2016-11-12 08:30:17', 0, 117660),
('ATCC-002', '2016-11-22 16:30:17', 1, 14880);

-- --------------------------------------------------------

--
-- Table structure for table `tis_ecb_fault`
--

CREATE TABLE `tis_ecb_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `FaultText` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_ecb_fault`
--

INSERT INTO `tis_ecb_fault` (`SystemCodeNumber`, `LastUpdated`, `FaultText`) VALUES
('ECB-001', '2016-01-03 07:31:31', 'Ping Unsuccessful'),
('ECB-001', '2016-01-03 07:31:31', 'Ping Unsuccessful'),
('ECB-001', '2016-01-03 07:31:31', 'Ping Unsuccessful'),
('ECB-001', '2016-01-03 07:31:31', 'Ping Unsuccessful'),
('ECB-001', '2016-01-03 07:31:31', 'Ping Unsuccessful');

-- --------------------------------------------------------

--
-- Table structure for table `tis_logs`
--

CREATE TABLE `tis_logs` (
  `Timestamp` datetime DEFAULT NULL,
  `Severity` varchar(25) DEFAULT NULL,
  `LogMessage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_logs`
--

INSERT INTO `tis_logs` (`Timestamp`, `Severity`, `LogMessage`) VALUES
('2015-05-04 10:53:40', 'INFO', 'Running pwd triggered by 2'),
('2015-05-07 01:04:56', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:05:58', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:07:30', 'INFO', 'VMS VMS-002 - Setting message: Drive carefully'),
('2015-05-07 10:45:19', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-04 10:53:40', 'INFO', 'Running pwd triggered by 2'),
('2015-05-07 01:04:56', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:05:58', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:07:30', 'INFO', 'VMS VMS-002 - Setting message: Drive carefully'),
('2015-05-07 10:45:19', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-04 10:53:40', 'INFO', 'Running pwd triggered by 2'),
('2015-05-07 01:04:56', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:05:58', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:07:30', 'INFO', 'VMS VMS-002 - Setting message: Drive carefully'),
('2015-05-07 10:45:19', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-04 10:53:40', 'INFO', 'Running pwd triggered by 2'),
('2015-05-07 01:04:56', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:05:58', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:07:30', 'INFO', 'VMS VMS-002 - Setting message: Drive carefully'),
('2015-05-07 10:45:19', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-04 10:53:40', 'INFO', 'Running pwd triggered by 2'),
('2015-05-07 01:04:56', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:05:58', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully'),
('2015-05-07 01:07:30', 'INFO', 'VMS VMS-002 - Setting message: Drive carefully'),
('2015-05-07 10:45:19', 'INFO', 'VMS VMS-001 - Setting message: Drive carefully');

-- --------------------------------------------------------

--
-- Table structure for table `tis_maintenance_sr`
--

CREATE TABLE `tis_maintenance_sr` (
  `ID` int(11) NOT NULL,
  `sr_number` varchar(20) NOT NULL,
  `module` varchar(10) NOT NULL,
  `device` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `user_created` varchar(50) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `user_closed` varchar(50) DEFAULT NULL,
  `closed_date` timestamp NULL DEFAULT NULL,
  `Observation` varchar(2000) DEFAULT NULL,
  `Action` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_maintenance_sr`
--

INSERT INTO `tis_maintenance_sr` (`ID`, `sr_number`, `module`, `device`, `subject`, `details`, `user_created`, `created_date`, `status`, `user_closed`, `closed_date`, `Observation`, `Action`) VALUES
(223, 'SR00000001', 'CCTV', 'PTZ CH 212 LHS', 'Device is offline.', 'Device is offline.', 'Admin', '2016-03-18 12:52:27', 'Closed', 'htmsadmin', '2016-04-10 12:44:40', 'Problem solved', 'Problem solved'),
(224, 'SR00000224', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-03-18 13:14:34', 'Open', NULL, NULL, NULL, NULL),
(225, 'SR00000225', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-20 05:25:05', 'Closed', 'htmsadmin', '2016-04-10 12:45:56', 'Problem solved', 'Problem solved'),
(226, 'SR00000226', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-20 07:15:05', 'Closed', 'htmsadmin', '2016-04-10 12:46:34', 'Problem solved', 'Problem solved'),
(227, 'SR00000227', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 05:58:05', 'Closed', 'htmsadmin', '2016-04-10 12:48:03', 'Problem solved', 'Problem solved'),
(228, 'SR00000228', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 07:02:05', 'Closed', 'htmsadmin', '2016-04-10 12:48:49', 'Problem solved', 'Problem solved'),
(229, 'SR00000229', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 11:42:05', 'Closed', 'htmsadmin', '2016-04-10 12:48:57', 'Problem solved', 'Problem solved'),
(230, 'SR00000230', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 14:10:04', 'Closed', 'htmsadmin', '2016-04-10 12:52:57', 'Problem solved', 'Problem solved'),
(231, 'SR00000231', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 14:10:04', 'Closed', 'htmsadmin', '2016-04-10 12:58:42', 'Problem solved', 'Problem solved'),
(232, 'SR00000232', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-21 15:58:05', 'Closed', 'htmsadmin', '2016-04-10 12:59:05', 'Problem solved', 'Problem solved'),
(233, 'SR00000233', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-22 21:15:04', 'Closed', 'htmsadmin', '2016-04-10 13:02:11', 'Problem solved', 'Problem solved'),
(234, 'SR00000234', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-23 00:14:04', 'Closed', 'htmsadmin', '2016-04-10 13:02:59', 'Problem solved', 'Problem solved'),
(235, 'SR00000235', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-23 02:30:05', 'Closed', 'htmsadmin', '2016-04-10 13:01:44', 'Problem solved', 'Problem solved'),
(236, 'SR00000236', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-23 02:30:05', 'Closed', 'htmsadmin', '2016-04-10 13:02:32', 'Problem solved', 'Problem solved'),
(237, 'SR00000237', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-23 09:25:04', 'Closed', 'htmsadmin', '2016-04-10 13:02:49', 'Problem solved', 'Problem solved'),
(238, 'SR00000238', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-23 12:54:05', 'Closed', 'htmsadmin', '2016-04-10 13:03:30', 'Problem solved', 'Problem solved'),
(239, 'SR00000239', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 01:52:05', 'Closed', 'htmsadmin', '2016-04-10 13:04:18', 'Problem solved', 'Problem solved'),
(240, 'SR00000240', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 03:20:05', 'Closed', 'htmsadmin', '2016-04-10 13:04:35', 'Problem solved', 'Problem solved'),
(241, 'SR00000241', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 03:20:05', 'Open', NULL, NULL, NULL, NULL),
(242, 'SR00000242', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 06:14:05', 'Open', NULL, NULL, NULL, NULL),
(243, 'SR00000243', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 11:55:05', 'Open', NULL, NULL, NULL, NULL),
(244, 'SR00000244', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-24 12:26:04', 'Open', NULL, NULL, NULL, NULL),
(245, 'SR00000245', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 00:10:05', 'Open', NULL, NULL, NULL, NULL),
(246, 'SR00000246', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 00:10:05', 'Open', NULL, NULL, NULL, NULL),
(247, 'SR00000247', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 03:34:04', 'Open', NULL, NULL, NULL, NULL),
(248, 'SR00000248', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 05:18:05', 'Open', NULL, NULL, NULL, NULL),
(249, 'SR00000249', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 11:34:05', 'Open', NULL, NULL, NULL, NULL),
(250, 'SR00000250', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 12:12:04', 'Open', NULL, NULL, NULL, NULL),
(251, 'SR00000251', 'ATCC', 'ATCC-001', 'Device offline', 'Device is offline.', 'System', '2016-03-25 12:52:18', 'Closed', 'htmsadmin', '2016-04-10 12:44:52', 'Problem solved', 'Problem solved'),
(252, 'SR00000252', 'ATCC', 'ATCC-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 05:02:15', 'Closed', 'htmsadmin', '2016-04-10 12:45:05', 'Problem solved', 'Problem solved'),
(253, 'SR00000253', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 05:15:04', 'Open', NULL, NULL, NULL, NULL),
(254, 'SR00000254', 'ATCC', 'ATCC-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 09:38:14', 'Closed', 'htmsadmin', '2016-04-10 12:45:29', 'Problem solved', 'Problem solved'),
(255, 'SR00000255', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 12:20:04', 'Open', NULL, NULL, NULL, NULL),
(256, 'SR00000255', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 12:20:04', 'Open', NULL, NULL, NULL, NULL),
(257, 'SR00000257', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 15:35:05', 'Open', NULL, NULL, NULL, NULL),
(258, 'SR00000258', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 17:35:05', 'Open', NULL, NULL, NULL, NULL),
(259, 'SR00000259', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 18:32:05', 'Open', NULL, NULL, NULL, NULL),
(260, 'SR00000260', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-26 19:35:05', 'Open', NULL, NULL, NULL, NULL),
(261, 'SR00000261', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-27 20:06:05', 'Open', NULL, NULL, NULL, NULL),
(262, 'SR00000262', 'VMS', 'VMS-001', '', '', 'htmsadmin', '2016-03-28 03:30:54', 'Open', NULL, NULL, NULL, NULL),
(263, 'SR00000263', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-28 06:50:04', 'Open', NULL, NULL, NULL, NULL),
(264, 'SR00000264', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-28 06:50:04', 'Open', NULL, NULL, NULL, NULL),
(265, 'SR00000265', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-28 21:12:04', 'Open', NULL, NULL, NULL, NULL),
(266, 'SR00000266', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 01:36:05', 'Open', NULL, NULL, NULL, NULL),
(267, 'SR00000267', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 09:36:05', 'Open', NULL, NULL, NULL, NULL),
(268, 'SR00000268', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-03-29 09:38:30', 'Closed', 'htmsadmin', '2016-04-10 12:46:06', 'Problem solved', 'Problem solved'),
(269, 'SR00000269', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 09:44:05', 'Open', NULL, NULL, NULL, NULL),
(270, 'SR00000270', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-03-29 10:10:29', 'Closed', 'htmsadmin', '2016-04-10 12:46:20', 'Problem solved', 'Problem solved'),
(271, 'SR00000271', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-03-29 10:10:29', 'Closed', 'htmsadmin', '2016-04-10 12:46:46', 'Problem solved', 'Problem solved'),
(272, 'SR00000272', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 10:18:05', 'Open', NULL, NULL, NULL, NULL),
(273, 'SR00000273', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 10:32:05', 'Open', NULL, NULL, NULL, NULL),
(274, 'SR00000274', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-29 16:12:04', 'Open', NULL, NULL, NULL, NULL),
(275, 'SR00000275', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-30 06:36:04', 'Open', NULL, NULL, NULL, NULL),
(276, 'SR00000276', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-30 09:10:05', 'Open', NULL, NULL, NULL, NULL),
(277, 'SR00000276', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-30 09:10:05', 'Open', NULL, NULL, NULL, NULL),
(278, 'SR00000278', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-30 16:06:05', 'Open', NULL, NULL, NULL, NULL),
(279, 'SR00000279', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-30 21:02:04', 'Open', NULL, NULL, NULL, NULL),
(280, 'SR00000280', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-31 06:58:05', 'Open', NULL, NULL, NULL, NULL),
(281, 'SR00000281', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-03-31 19:35:05', 'Open', NULL, NULL, NULL, NULL),
(282, 'SR00000282', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-02 04:18:05', 'Open', NULL, NULL, NULL, NULL),
(283, 'SR00000283', 'CCTV', 'PTZ CH 212 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-04 07:35:21', 'Closed', 'htmsadmin', '2016-04-10 12:46:58', 'Problem solved', 'Problem solved'),
(284, 'SR00000284', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-04 08:12:24', 'Closed', 'htmsadmin', '2016-04-10 12:47:10', 'Problem solved', 'Problem solved'),
(285, 'SR00000285', 'ATCC', 'ATCC-001', 'Device offline', 'Device is offline.', 'System', '2016-04-04 12:46:15', 'Closed', 'htmsadmin', '2016-04-10 12:45:37', 'Problem solved', 'Problem solved'),
(286, 'SR00000286', 'ATCC', 'ATCC-001', 'Device offline', 'Device is offline.', 'System', '2016-04-05 07:06:14', 'Closed', 'htmsadmin', '2016-04-10 12:44:27', 'Problem solved', 'Problem solved'),
(287, 'SR00000287', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 03:22:05', 'Open', NULL, NULL, NULL, NULL),
(288, 'SR00000288', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 04:10:05', 'Open', NULL, NULL, NULL, NULL),
(289, 'SR00000289', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 04:10:05', 'Open', NULL, NULL, NULL, NULL),
(290, 'SR00000290', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 05:46:05', 'Open', NULL, NULL, NULL, NULL),
(291, 'SR00000291', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 08:55:05', 'Open', NULL, NULL, NULL, NULL),
(292, 'SR00000292', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 10:00:05', 'Open', NULL, NULL, NULL, NULL),
(293, 'SR00000293', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 10:00:05', 'Open', NULL, NULL, NULL, NULL),
(294, 'SR00000294', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 11:58:05', 'Open', NULL, NULL, NULL, NULL),
(295, 'SR00000295', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-07 13:12:04', 'Open', NULL, NULL, NULL, NULL),
(296, 'SR00000296', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-07 14:40:25', 'Closed', 'htmsadmin', '2016-04-10 12:47:21', 'Problem solved', 'Problem solved'),
(297, 'SR00000297', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-07 14:40:25', 'Closed', 'htmsadmin', '2016-04-10 12:47:33', 'Problem solved', 'Problem solved'),
(298, 'SR00000298', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:35:11', 'Open', NULL, NULL, NULL, NULL),
(299, 'SR00000299', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:35:23', 'Open', NULL, NULL, NULL, NULL),
(300, 'SR00000300', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:35:38', 'Closed', 'htmsadmin', '2016-04-10 12:48:14', 'Problem solved', 'Problem solved'),
(301, 'SR00000301', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:35:52', 'Closed', 'htmsadmin', '2016-04-10 12:48:24', 'Problem solved', 'Problem solved'),
(302, 'SR00000302', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:36:04', 'Closed', 'htmsadmin', '2016-04-10 12:48:33', 'Problem solved', 'Problem solved'),
(303, 'SR00000303', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-07 15:36:16', 'Closed', 'htmsadmin', '2016-04-10 12:51:44', 'Problem solved', 'Problem solved'),
(304, 'SR00000304', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-08 03:06:05', 'Open', NULL, NULL, NULL, NULL),
(305, 'SR00000305', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-08 09:34:12', 'Open', NULL, NULL, NULL, NULL),
(306, 'SR00000306', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-08 12:44:05', 'Open', NULL, NULL, NULL, NULL),
(307, 'SR00000307', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-08 23:44:11', 'Open', NULL, NULL, NULL, NULL),
(308, 'SR00000308', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-09 12:52:05', 'Open', NULL, NULL, NULL, NULL),
(309, 'SR00000309', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-09 18:04:12', 'Open', NULL, NULL, NULL, NULL),
(310, 'SR00000310', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 02:48:05', 'Open', NULL, NULL, NULL, NULL),
(311, 'SR00000311', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 04:48:05', 'Open', NULL, NULL, NULL, NULL),
(312, 'SR00000312', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-10 06:24:11', 'Open', NULL, NULL, NULL, NULL),
(313, 'SR00000313', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-10 06:24:22', 'Open', NULL, NULL, NULL, NULL),
(314, 'SR00000314', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-10 08:52:11', 'Open', NULL, NULL, NULL, NULL),
(315, 'SR00000315', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-10 08:52:29', 'Closed', 'htmsadmin', '2016-04-10 12:51:29', 'Problem solved', 'Problem solved'),
(316, 'SR00000316', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 10:50:04', 'Open', NULL, NULL, NULL, NULL),
(317, 'SR00000317', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 10:50:04', 'Open', NULL, NULL, NULL, NULL),
(318, 'SR00000318', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-10 13:06:18', 'Open', NULL, NULL, NULL, NULL),
(319, 'SR00000319', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 18:12:05', 'Open', NULL, NULL, NULL, NULL),
(320, 'SR00000320', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-10 19:55:05', 'Open', NULL, NULL, NULL, NULL),
(321, 'SR00000321', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-11 05:44:04', 'Open', NULL, NULL, NULL, NULL),
(322, 'SR00000322', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-11 08:12:21', 'Open', NULL, NULL, NULL, NULL),
(323, 'SR00000323', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-12 06:04:15', 'Closed', '\nhtmsadmin', '2016-04-27 12:26:14', 'closed', 'closed'),
(324, 'SR00000324', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-12 06:36:05', 'Open', NULL, NULL, NULL, NULL),
(325, 'SR00000325', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-12 21:08:05', 'Open', NULL, NULL, NULL, NULL),
(326, 'SR00000326', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-12 21:08:23', 'Open', NULL, NULL, NULL, NULL),
(327, 'SR00000327', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-13 01:35:05', 'Open', NULL, NULL, NULL, NULL),
(328, 'SR00000328', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-13 02:26:11', 'Open', NULL, NULL, NULL, NULL),
(329, 'SR00000329', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-13 06:52:05', 'Open', NULL, NULL, NULL, NULL),
(330, 'SR00000330', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-13 09:06:05', 'Open', NULL, NULL, NULL, NULL),
(331, 'SR00000331', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-13 09:34:05', 'Open', NULL, NULL, NULL, NULL),
(332, 'SR00000332', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-13 09:34:24', 'Open', NULL, NULL, NULL, NULL),
(333, 'SR00000333', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-13 16:42:05', 'Open', NULL, NULL, NULL, NULL),
(334, 'SR00000334', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-14 03:40:09', 'Open', NULL, NULL, NULL, NULL),
(335, 'SR00000335', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-14 03:40:09', 'Open', NULL, NULL, NULL, NULL),
(336, 'SR00000336', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-14 04:25:08', 'Open', NULL, NULL, NULL, NULL),
(337, 'SR00000337', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-14 09:44:08', 'Open', NULL, NULL, NULL, NULL),
(338, 'SR00000338', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-14 10:04:05', 'Open', NULL, NULL, NULL, NULL),
(339, 'SR00000339', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-14 19:26:04', 'Open', NULL, NULL, NULL, NULL),
(340, 'SR00000340', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-15 01:34:08', 'Open', NULL, NULL, NULL, NULL),
(341, 'SR00000341', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-15 01:34:19', 'Open', NULL, NULL, NULL, NULL),
(342, 'SR00000342', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-15 06:35:05', 'Open', NULL, NULL, NULL, NULL),
(343, 'SR00000343', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-15 17:35:04', 'Open', NULL, NULL, NULL, NULL),
(344, 'SR00000344', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-15 19:14:05', 'Open', NULL, NULL, NULL, NULL),
(345, 'SR00000345', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-16 05:05:05', 'Open', NULL, NULL, NULL, NULL),
(346, 'SR00000346', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-16 07:05:05', 'Open', NULL, NULL, NULL, NULL),
(347, 'SR00000347', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-16 08:36:11', 'Open', NULL, NULL, NULL, NULL),
(348, 'SR00000348', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-16 08:36:22', 'Open', NULL, NULL, NULL, NULL),
(349, 'SR00000349', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-16 08:50:05', 'Open', NULL, NULL, NULL, NULL),
(350, 'SR00000349', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-16 08:50:05', 'Open', NULL, NULL, NULL, NULL),
(351, 'SR00000351', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-16 08:56:05', 'Open', NULL, NULL, NULL, NULL),
(352, 'SR00000352', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-04-17 03:25:20', 'Open', NULL, NULL, NULL, NULL),
(353, 'SR00000353', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-17 03:25:35', 'Open', NULL, NULL, NULL, NULL),
(354, 'SR00000354', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-17 03:25:46', 'Open', NULL, NULL, NULL, NULL),
(355, 'SR00000355', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-17 03:25:58', 'Open', NULL, NULL, NULL, NULL),
(356, 'SR00000356', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-17 14:50:05', 'Open', NULL, NULL, NULL, NULL),
(357, 'SR00000356', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-17 14:50:05', 'Open', NULL, NULL, NULL, NULL),
(358, 'SR00000358', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-17 17:02:05', 'Open', NULL, NULL, NULL, NULL),
(359, 'SR00000359', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-17 21:20:05', 'Open', NULL, NULL, NULL, NULL),
(360, 'SR00000359', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-17 21:20:05', 'Open', NULL, NULL, NULL, NULL),
(361, 'SR00000361', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-19 02:06:08', 'Open', NULL, NULL, NULL, NULL),
(362, 'SR00000362', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-19 21:36:05', 'Open', NULL, NULL, NULL, NULL),
(363, 'SR00000363', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-20 09:50:05', 'Open', NULL, NULL, NULL, NULL),
(364, 'SR00000364', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-20 09:50:05', 'Open', NULL, NULL, NULL, NULL),
(365, 'SR00000365', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-20 12:22:05', 'Open', NULL, NULL, NULL, NULL),
(366, 'SR00000366', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-20 13:46:04', 'Open', NULL, NULL, NULL, NULL),
(367, 'SR00000367', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-20 16:22:05', 'Open', NULL, NULL, NULL, NULL),
(368, 'SR00000368', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-20 17:00:12', 'Open', NULL, NULL, NULL, NULL),
(369, 'SR00000368', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-20 17:00:12', 'Open', NULL, NULL, NULL, NULL),
(370, 'SR00000370', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:04:08', 'Open', NULL, NULL, NULL, NULL),
(371, 'SR00000371', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:04:20', 'Open', NULL, NULL, NULL, NULL),
(372, 'SR00000372', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:04:35', 'Open', NULL, NULL, NULL, NULL),
(373, 'SR00000373', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:04:50', 'Open', NULL, NULL, NULL, NULL),
(374, 'SR00000374', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:05:01', 'Open', NULL, NULL, NULL, NULL),
(375, 'SR00000375', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-22 04:05:11', 'Open', NULL, NULL, NULL, NULL),
(376, 'SR00000376', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 08:50:05', 'Open', NULL, NULL, NULL, NULL),
(377, 'SR00000376', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 08:50:05', 'Open', NULL, NULL, NULL, NULL),
(378, 'SR00000378', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 15:10:05', 'Open', NULL, NULL, NULL, NULL),
(379, 'SR00000378', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 15:10:05', 'Open', NULL, NULL, NULL, NULL),
(380, 'SR00000380', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-22 19:15:11', 'Open', NULL, NULL, NULL, NULL),
(381, 'SR00000381', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-22 19:15:23', 'Open', NULL, NULL, NULL, NULL),
(382, 'SR00000382', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-22 19:15:42', 'Open', NULL, NULL, NULL, NULL),
(383, 'SR00000383', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-22 19:24:21', 'Open', NULL, NULL, NULL, NULL),
(384, 'SR00000384', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 22:52:05', 'Open', NULL, NULL, NULL, NULL),
(385, 'SR00000385', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 23:20:05', 'Open', NULL, NULL, NULL, NULL),
(386, 'SR00000385', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-22 23:20:05', 'Open', NULL, NULL, NULL, NULL),
(387, 'SR00000387', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-23 00:24:05', 'Open', NULL, NULL, NULL, NULL),
(388, 'SR00000388', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-23 05:04:05', 'Open', NULL, NULL, NULL, NULL),
(389, 'SR00000389', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-23 13:26:22', 'Open', NULL, NULL, NULL, NULL),
(390, 'SR00000390', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-24 13:30:05', 'Open', NULL, NULL, NULL, NULL),
(391, 'SR00000391', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-24 13:30:05', 'Open', NULL, NULL, NULL, NULL),
(392, 'SR00000392', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-25 03:56:08', 'Open', NULL, NULL, NULL, NULL),
(393, 'SR00000393', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-25 03:56:20', 'Open', NULL, NULL, NULL, NULL),
(394, 'SR00000394', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-25 03:56:48', 'Open', NULL, NULL, NULL, NULL),
(395, 'SR00000395', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-25 09:38:05', 'Open', NULL, NULL, NULL, NULL),
(396, 'SR00000396', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-26 10:05:05', 'Open', NULL, NULL, NULL, NULL),
(397, 'SR00000397', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-27 04:28:08', 'Open', NULL, NULL, NULL, NULL),
(398, 'SR00000398', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-27 12:24:04', 'Open', NULL, NULL, NULL, NULL),
(399, 'SR00000399', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-27 13:26:05', 'Open', NULL, NULL, NULL, NULL),
(400, 'SR00000400', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-27 15:15:05', 'Open', NULL, NULL, NULL, NULL),
(401, 'SR00000401', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-27 15:46:12', 'Open', NULL, NULL, NULL, NULL),
(402, 'SR00000402', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-28 05:25:08', 'Open', NULL, NULL, NULL, NULL),
(403, 'SR00000403', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-28 05:25:20', 'Open', NULL, NULL, NULL, NULL),
(404, 'SR00000404', 'MET', 'MET-001', 'Battery Low', 'Not charging Voltage showing 9V', '\nParag Raipuria', '2016-04-28 06:58:23', 'Closed', '\ngmr', '2016-09-21 10:58:02', 'Test observation', 'Testing'),
(405, 'SR00000405', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-04-28 08:54:09', 'Closed', '\nParag Raipuria', '2016-05-05 12:48:59', 'auto', 'autoo'),
(406, 'SR00000406', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-28 15:20:19', 'Open', NULL, NULL, NULL, NULL),
(407, 'SR00000407', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-28 15:20:19', 'Open', NULL, NULL, NULL, NULL),
(408, 'SR00000408', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-28 15:32:19', 'Open', NULL, NULL, NULL, NULL),
(409, 'SR00000409', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-28 17:40:09', 'Open', NULL, NULL, NULL, NULL),
(410, 'SR00000410', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-28 17:40:09', 'Open', NULL, NULL, NULL, NULL),
(411, 'SR00000411', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-29 06:42:09', 'Open', NULL, NULL, NULL, NULL),
(412, 'SR00000412', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-29 06:42:20', 'Open', NULL, NULL, NULL, NULL),
(413, 'SR00000413', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-29 06:42:51', 'Open', NULL, NULL, NULL, NULL),
(414, 'SR00000414', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-29 06:43:02', 'Open', NULL, NULL, NULL, NULL),
(415, 'SR00000415', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-04-29 06:44:25', 'Open', NULL, NULL, NULL, NULL),
(416, 'SR00000416', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-29 09:25:04', 'Open', NULL, NULL, NULL, NULL),
(417, 'SR00000417', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-29 11:26:05', 'Open', NULL, NULL, NULL, NULL),
(418, 'SR00000418', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-29 12:35:09', 'Open', NULL, NULL, NULL, NULL),
(419, 'SR00000419', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-29 12:35:20', 'Open', NULL, NULL, NULL, NULL),
(420, 'SR00000420', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-04-29 12:35:40', 'Open', NULL, NULL, NULL, NULL),
(421, 'SR00000421', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-04-29 12:35:51', 'Open', NULL, NULL, NULL, NULL),
(422, 'SR00000422', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-29 14:48:09', 'Open', NULL, NULL, NULL, NULL),
(423, 'SR00000423', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-04-29 15:34:08', 'Open', NULL, NULL, NULL, NULL),
(424, 'SR00000424', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-29 15:34:21', 'Open', NULL, NULL, NULL, NULL),
(425, 'SR00000425', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-30 08:12:19', 'Open', NULL, NULL, NULL, NULL),
(426, 'SR00000426', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-04-30 08:15:05', 'Open', NULL, NULL, NULL, NULL),
(427, 'SR00000427', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-30 14:40:19', 'Open', NULL, NULL, NULL, NULL),
(428, 'SR00000428', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-04-30 14:40:19', 'Open', NULL, NULL, NULL, NULL),
(429, 'SR00000429', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-01 04:46:05', 'Open', NULL, NULL, NULL, NULL),
(430, 'SR00000430', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-01 12:06:06', 'Open', NULL, NULL, NULL, NULL),
(431, 'SR00000431', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-01 12:14:05', 'Open', NULL, NULL, NULL, NULL),
(432, 'SR00000432', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-01 12:14:16', 'Open', NULL, NULL, NULL, NULL),
(433, 'SR00000433', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-01 12:15:22', 'Open', NULL, NULL, NULL, NULL),
(434, 'SR00000434', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-01 12:15:34', 'Open', NULL, NULL, NULL, NULL),
(435, 'SR00000435', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 04:30:05', 'Open', NULL, NULL, NULL, NULL),
(436, 'SR00000435', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 04:30:05', 'Open', NULL, NULL, NULL, NULL),
(437, 'SR00000437', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 07:10:05', 'Open', NULL, NULL, NULL, NULL),
(438, 'SR00000437', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 07:10:05', 'Open', NULL, NULL, NULL, NULL),
(439, 'SR00000439', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 07:55:05', 'Open', NULL, NULL, NULL, NULL),
(440, 'SR00000440', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 08:45:05', 'Open', NULL, NULL, NULL, NULL),
(441, 'SR00000441', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 09:12:05', 'Open', NULL, NULL, NULL, NULL),
(442, 'SR00000442', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-02 10:40:24', 'Open', NULL, NULL, NULL, NULL),
(443, 'SR00000443', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 11:08:05', 'Open', NULL, NULL, NULL, NULL),
(444, 'SR00000444', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-02 11:30:23', 'Open', NULL, NULL, NULL, NULL),
(445, 'SR00000445', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-02 13:58:05', 'Open', NULL, NULL, NULL, NULL),
(446, 'SR00000446', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-03 08:24:06', 'Open', NULL, NULL, NULL, NULL),
(447, 'SR00000447', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-03 11:30:19', 'Open', NULL, NULL, NULL, NULL),
(448, 'SR00000447', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-03 11:30:19', 'Open', NULL, NULL, NULL, NULL),
(449, 'SR00000449', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-03 12:16:05', 'Open', NULL, NULL, NULL, NULL),
(450, 'SR00000450', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-03 14:56:05', 'Open', NULL, NULL, NULL, NULL),
(451, 'SR00000451', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-03 16:18:22', 'Open', NULL, NULL, NULL, NULL),
(452, 'SR00000452', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-04 05:18:11', 'Open', NULL, NULL, NULL, NULL),
(453, 'SR00000453', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-04 05:35:11', 'Open', NULL, NULL, NULL, NULL),
(454, 'SR00000454', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 07:50:05', 'Open', NULL, NULL, NULL, NULL),
(455, 'SR00000454', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 07:50:05', 'Open', NULL, NULL, NULL, NULL),
(456, 'SR00000456', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-04 08:26:11', 'Open', NULL, NULL, NULL, NULL),
(457, 'SR00000457', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 12:50:05', 'Open', NULL, NULL, NULL, NULL),
(458, 'SR00000458', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 12:50:05', 'Open', NULL, NULL, NULL, NULL),
(459, 'SR00000459', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-04 17:55:12', 'Open', NULL, NULL, NULL, NULL),
(460, 'SR00000460', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 19:35:12', 'Open', NULL, NULL, NULL, NULL),
(461, 'SR00000461', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 19:55:12', 'Open', NULL, NULL, NULL, NULL),
(462, 'SR00000462', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 20:04:11', 'Open', NULL, NULL, NULL, NULL),
(463, 'SR00000463', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 20:16:12', 'Open', NULL, NULL, NULL, NULL),
(464, 'SR00000464', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 20:42:11', 'Open', NULL, NULL, NULL, NULL),
(465, 'SR00000465', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 20:45:12', 'Open', NULL, NULL, NULL, NULL),
(466, 'SR00000466', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-04 23:55:12', 'Open', NULL, NULL, NULL, NULL),
(467, 'SR00000467', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 03:56:05', 'Open', NULL, NULL, NULL, NULL),
(468, 'SR00000468', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 05:24:05', 'Open', NULL, NULL, NULL, NULL),
(469, 'SR00000469', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-05 07:14:11', 'Open', NULL, NULL, NULL, NULL),
(470, 'SR00000470', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 08:02:05', 'Open', NULL, NULL, NULL, NULL),
(471, 'SR00000471', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 10:58:05', 'Open', NULL, NULL, NULL, NULL),
(472, 'SR00000472', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-05 12:35:11', 'Open', NULL, NULL, NULL, NULL),
(473, 'SR00000473', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-05 12:35:33', 'Open', NULL, NULL, NULL, NULL),
(474, 'SR00000474', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-05 12:35:44', 'Open', NULL, NULL, NULL, NULL),
(475, 'SR00000475', 'CCTV', 'PTZ CH-275', 'cctv testing', 'tower erection required', '\nParag Raipuria', '2016-05-05 12:40:30', 'Open', NULL, NULL, NULL, NULL),
(476, 'SR00000476', 'CCTV', 'PTZ CH-275', 'cctv testing', 'tower erection required', '\nParag Raipuria', '2016-05-05 12:40:36', 'Open', NULL, NULL, NULL, NULL),
(477, 'SR00000477', 'CCTV', 'PTZ CH-275', 'cctv testing2', 'tower 2 test', '\nParag Raipuria', '2016-05-05 12:43:18', 'Open', NULL, NULL, NULL, NULL),
(478, 'SR00000478', 'CCTV', 'PTZ CH-275', 'cctv testing2', 'tower 2 test', '\nParag Raipuria', '2016-05-05 12:43:21', 'Open', NULL, NULL, NULL, NULL),
(479, 'SR00000479', 'CCTV', 'PTZ CH-275', 'cctv testing2', 'tower 2 test', '\nParag Raipuria', '2016-05-05 12:43:21', 'Open', NULL, NULL, NULL, NULL),
(480, 'SR00000480', 'CCTV', 'PTZ CH-275', 'cctv testing2', 'tower 2 test', '\nParag Raipuria', '2016-05-05 12:43:22', 'Open', NULL, NULL, NULL, NULL),
(481, 'SR00000481', 'CCTV', 'PTZ CH-275', 'cctv testing2', 'tower 2 test', '\nParag Raipuria', '2016-05-05 12:43:22', 'Open', NULL, NULL, NULL, NULL),
(482, 'SR00000482', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-05 13:42:38', 'Open', NULL, NULL, NULL, NULL),
(483, 'SR00000483', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-05 13:44:12', 'Open', NULL, NULL, NULL, NULL),
(484, 'SR00000484', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 18:16:15', 'Open', NULL, NULL, NULL, NULL),
(485, 'SR00000485', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-05 18:24:14', 'Open', NULL, NULL, NULL, NULL),
(486, 'SR00000486', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-06 02:32:33', 'Open', NULL, NULL, NULL, NULL),
(487, 'SR00000487', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-08 12:44:33', 'Open', NULL, NULL, NULL, NULL),
(488, 'SR00000488', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-08 15:40:36', 'Open', NULL, NULL, NULL, NULL),
(489, 'SR00000489', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-08 15:40:36', 'Open', NULL, NULL, NULL, NULL),
(490, 'SR00000490', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-08 16:52:15', 'Open', NULL, NULL, NULL, NULL),
(491, 'SR00000491', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 00:35:15', 'Open', NULL, NULL, NULL, NULL),
(492, 'SR00000492', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 00:45:15', 'Open', NULL, NULL, NULL, NULL),
(493, 'SR00000493', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 04:38:05', 'Open', NULL, NULL, NULL, NULL),
(494, 'SR00000494', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 12:16:05', 'Open', NULL, NULL, NULL, NULL),
(495, 'SR00000495', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-09 15:46:12', 'Open', NULL, NULL, NULL, NULL),
(496, 'SR00000496', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 18:02:12', 'Open', NULL, NULL, NULL, NULL),
(497, 'SR00000497', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-09 22:14:05', 'Open', NULL, NULL, NULL, NULL),
(498, 'SR00000498', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-09 23:40:32', 'Open', NULL, NULL, NULL, NULL),
(499, 'SR00000499', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-09 23:40:33', 'Open', NULL, NULL, NULL, NULL),
(500, 'SR00000500', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 00:42:12', 'Open', NULL, NULL, NULL, NULL),
(501, 'SR00000501', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-10 01:42:22', 'Open', NULL, NULL, NULL, NULL),
(502, 'SR00000502', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-10 10:58:29', 'Open', NULL, NULL, NULL, NULL),
(503, 'SR00000503', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 13:22:05', 'Open', NULL, NULL, NULL, NULL),
(504, 'SR00000504', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-10 17:34:26', 'Open', NULL, NULL, NULL, NULL),
(505, 'SR00000505', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 17:42:09', 'Open', NULL, NULL, NULL, NULL),
(506, 'SR00000506', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 18:32:05', 'Open', NULL, NULL, NULL, NULL),
(507, 'SR00000507', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 18:46:05', 'Open', NULL, NULL, NULL, NULL),
(508, 'SR00000508', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 19:40:05', 'Open', NULL, NULL, NULL, NULL),
(509, 'SR00000509', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 19:40:05', 'Open', NULL, NULL, NULL, NULL),
(510, 'SR00000510', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-10 21:42:28', 'Open', NULL, NULL, NULL, NULL),
(511, 'SR00000511', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-10 22:45:05', 'Open', NULL, NULL, NULL, NULL),
(512, 'SR00000512', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 00:05:05', 'Open', NULL, NULL, NULL, NULL),
(513, 'SR00000513', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 00:54:05', 'Open', NULL, NULL, NULL, NULL),
(514, 'SR00000514', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 01:08:19', 'Open', NULL, NULL, NULL, NULL),
(515, 'SR00000515', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 01:10:05', 'Open', NULL, NULL, NULL, NULL),
(516, 'SR00000515', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 01:10:05', 'Open', NULL, NULL, NULL, NULL),
(517, 'SR00000517', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 01:34:05', 'Open', NULL, NULL, NULL, NULL),
(518, 'SR00000518', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 04:14:05', 'Open', NULL, NULL, NULL, NULL),
(519, 'SR00000519', 'CCTV', 'PTZ CH 212 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-11 04:18:17', 'Open', NULL, NULL, NULL, NULL),
(520, 'SR00000520', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 05:40:30', 'Open', NULL, NULL, NULL, NULL),
(521, 'SR00000521', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 05:40:30', 'Open', NULL, NULL, NULL, NULL),
(522, 'SR00000522', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 07:00:30', 'Open', NULL, NULL, NULL, NULL),
(523, 'SR00000522', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 07:00:30', 'Open', NULL, NULL, NULL, NULL),
(524, 'SR00000524', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 07:15:05', 'Open', NULL, NULL, NULL, NULL),
(525, 'SR00000525', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-11 08:42:12', 'Open', NULL, NULL, NULL, NULL),
(526, 'SR00000526', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-11 09:05:37', 'Open', NULL, NULL, NULL, NULL),
(527, 'SR00000527', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-11 09:06:11', 'Open', NULL, NULL, NULL, NULL),
(528, 'SR00000528', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 11:25:05', 'Open', NULL, NULL, NULL, NULL),
(529, 'SR00000529', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 11:45:05', 'Open', NULL, NULL, NULL, NULL),
(530, 'SR00000530', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 13:02:30', 'Open', NULL, NULL, NULL, NULL),
(531, 'SR00000531', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 13:40:06', 'Open', NULL, NULL, NULL, NULL),
(532, 'SR00000531', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 13:40:06', 'Open', NULL, NULL, NULL, NULL),
(533, 'SR00000533', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-11 14:24:27', 'Open', NULL, NULL, NULL, NULL),
(534, 'SR00000534', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 15:15:05', 'Open', NULL, NULL, NULL, NULL),
(535, 'SR00000535', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 15:36:05', 'Open', NULL, NULL, NULL, NULL),
(536, 'SR00000536', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 15:44:05', 'Open', NULL, NULL, NULL, NULL),
(537, 'SR00000537', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 15:58:05', 'Open', NULL, NULL, NULL, NULL),
(538, 'SR00000538', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-11 21:35:09', 'Open', NULL, NULL, NULL, NULL),
(539, 'SR00000539', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 00:25:09', 'Open', NULL, NULL, NULL, NULL),
(540, 'SR00000540', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 02:14:05', 'Open', NULL, NULL, NULL, NULL),
(541, 'SR00000541', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-12 07:15:28', 'Open', NULL, NULL, NULL, NULL),
(542, 'SR00000542', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 08:30:05', 'Open', NULL, NULL, NULL, NULL),
(543, 'SR00000543', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 08:30:05', 'Open', NULL, NULL, NULL, NULL),
(544, 'SR00000544', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-12 08:46:29', 'Open', NULL, NULL, NULL, NULL),
(545, 'SR00000545', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 09:14:05', 'Open', NULL, NULL, NULL, NULL),
(546, 'SR00000546', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 09:56:05', 'Open', NULL, NULL, NULL, NULL),
(547, 'SR00000547', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 12:32:05', 'Open', NULL, NULL, NULL, NULL),
(548, 'SR00000548', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-12 12:52:36', 'Open', NULL, NULL, NULL, NULL),
(549, 'SR00000549', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 14:22:05', 'Open', NULL, NULL, NULL, NULL),
(550, 'SR00000550', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 17:35:08', 'Open', NULL, NULL, NULL, NULL),
(551, 'SR00000551', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-12 23:15:05', 'Open', NULL, NULL, NULL, NULL),
(552, 'SR00000552', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-13 00:06:33', 'Open', NULL, NULL, NULL, NULL),
(553, 'SR00000553', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-13 02:02:37', 'Open', NULL, NULL, NULL, NULL),
(554, 'SR00000554', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 02:10:05', 'Open', NULL, NULL, NULL, NULL),
(555, 'SR00000555', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 02:10:05', 'Open', NULL, NULL, NULL, NULL),
(556, 'SR00000556', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 07:32:05', 'Open', NULL, NULL, NULL, NULL),
(557, 'SR00000557', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-13 10:22:27', 'Open', NULL, NULL, NULL, NULL);
INSERT INTO `tis_maintenance_sr` (`ID`, `sr_number`, `module`, `device`, `subject`, `details`, `user_created`, `created_date`, `status`, `user_closed`, `closed_date`, `Observation`, `Action`) VALUES
(558, 'SR00000558', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 11:28:05', 'Open', NULL, NULL, NULL, NULL),
(559, 'SR00000559', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 11:50:05', 'Open', NULL, NULL, NULL, NULL),
(560, 'SR00000559', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 11:50:05', 'Open', NULL, NULL, NULL, NULL),
(561, 'SR00000561', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 12:06:05', 'Open', NULL, NULL, NULL, NULL),
(562, 'SR00000562', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 13:56:05', 'Open', NULL, NULL, NULL, NULL),
(563, 'SR00000563', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 15:00:05', 'Open', NULL, NULL, NULL, NULL),
(564, 'SR00000563', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 15:00:05', 'Open', NULL, NULL, NULL, NULL),
(565, 'SR00000565', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 16:00:10', 'Open', NULL, NULL, NULL, NULL),
(566, 'SR00000566', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 16:00:10', 'Open', NULL, NULL, NULL, NULL),
(567, 'SR00000567', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 16:54:05', 'Open', NULL, NULL, NULL, NULL),
(568, 'SR00000568', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 18:42:05', 'Open', NULL, NULL, NULL, NULL),
(569, 'SR00000569', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-13 19:25:05', 'Open', NULL, NULL, NULL, NULL),
(570, 'SR00000570', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-14 02:30:30', 'Open', NULL, NULL, NULL, NULL),
(571, 'SR00000570', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-14 02:30:30', 'Open', NULL, NULL, NULL, NULL),
(572, 'SR00000572', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-14 11:54:09', 'Open', NULL, NULL, NULL, NULL),
(573, 'SR00000573', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-14 11:54:34', 'Open', NULL, NULL, NULL, NULL),
(574, 'SR00000574', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-14 15:38:05', 'Open', NULL, NULL, NULL, NULL),
(575, 'SR00000575', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-14 16:00:16', 'Open', NULL, NULL, NULL, NULL),
(576, 'SR00000576', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-14 16:00:16', 'Open', NULL, NULL, NULL, NULL),
(577, 'SR00000577', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-14 19:36:05', 'Open', NULL, NULL, NULL, NULL),
(578, 'SR00000578', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-15 00:55:33', 'Open', NULL, NULL, NULL, NULL),
(579, 'SR00000579', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-15 07:44:34', 'Open', NULL, NULL, NULL, NULL),
(580, 'SR00000580', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-15 13:06:34', 'Open', NULL, NULL, NULL, NULL),
(581, 'SR00000581', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-15 13:22:33', 'Open', NULL, NULL, NULL, NULL),
(582, 'SR00000582', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-15 14:30:36', 'Open', NULL, NULL, NULL, NULL),
(583, 'SR00000582', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-15 14:30:36', 'Open', NULL, NULL, NULL, NULL),
(584, 'SR00000584', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-15 15:55:05', 'Open', NULL, NULL, NULL, NULL),
(585, 'SR00000585', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-15 18:06:05', 'Open', NULL, NULL, NULL, NULL),
(586, 'SR00000586', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-15 18:40:15', 'Open', NULL, NULL, NULL, NULL),
(587, 'SR00000586', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-15 18:40:15', 'Open', NULL, NULL, NULL, NULL),
(588, 'SR00000588', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-16 06:36:05', 'Open', NULL, NULL, NULL, NULL),
(589, 'SR00000589', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 10:12:31', 'Open', NULL, NULL, NULL, NULL),
(590, 'SR00000590', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 10:36:44', 'Open', NULL, NULL, NULL, NULL),
(591, 'SR00000591', 'CCTV', 'PTZ 206 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-16 12:20:36', 'Open', NULL, NULL, NULL, NULL),
(592, 'SR00000592', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 13:10:33', 'Open', NULL, NULL, NULL, NULL),
(593, 'SR00000593', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 13:10:33', 'Open', NULL, NULL, NULL, NULL),
(594, 'SR00000594', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 16:36:31', 'Open', NULL, NULL, NULL, NULL),
(595, 'SR00000595', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-16 16:52:31', 'Open', NULL, NULL, NULL, NULL),
(596, 'SR00000596', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-17 07:44:31', 'Open', NULL, NULL, NULL, NULL),
(597, 'SR00000597', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-17 08:50:34', 'Open', NULL, NULL, NULL, NULL),
(598, 'SR00000597', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-17 08:50:34', 'Open', NULL, NULL, NULL, NULL),
(599, 'SR00000599', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-17 12:55:04', 'Open', NULL, NULL, NULL, NULL),
(600, 'SR00000600', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-17 17:35:30', 'Open', NULL, NULL, NULL, NULL),
(601, 'SR00000601', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-17 18:14:30', 'Open', NULL, NULL, NULL, NULL),
(602, 'SR00000602', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-17 21:22:05', 'Open', NULL, NULL, NULL, NULL),
(603, 'SR00000603', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-18 00:45:05', 'Open', NULL, NULL, NULL, NULL),
(604, 'SR00000604', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-18 03:56:31', 'Open', NULL, NULL, NULL, NULL),
(605, 'SR00000605', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-18 05:42:30', 'Open', NULL, NULL, NULL, NULL),
(606, 'SR00000606', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-18 05:50:33', 'Open', NULL, NULL, NULL, NULL),
(607, 'SR00000607', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-18 05:50:33', 'Open', NULL, NULL, NULL, NULL),
(608, 'SR00000608', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-18 10:18:05', 'Open', NULL, NULL, NULL, NULL),
(609, 'SR00000609', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-19 02:52:09', 'Open', NULL, NULL, NULL, NULL),
(610, 'SR00000610', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-19 06:02:05', 'Open', NULL, NULL, NULL, NULL),
(611, 'SR00000611', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-19 06:26:09', 'Open', NULL, NULL, NULL, NULL),
(612, 'SR00000612', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-19 19:56:28', 'Open', NULL, NULL, NULL, NULL),
(613, 'SR00000613', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-21 05:34:05', 'Open', NULL, NULL, NULL, NULL),
(614, 'SR00000614', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-22 06:24:09', 'Open', NULL, NULL, NULL, NULL),
(615, 'SR00000615', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:16:19', 'Open', NULL, NULL, NULL, NULL),
(616, 'SR00000616', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:26:39', 'Open', NULL, NULL, NULL, NULL),
(617, 'SR00000617', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:26:54', 'Open', NULL, NULL, NULL, NULL),
(618, 'SR00000618', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:27:04', 'Open', NULL, NULL, NULL, NULL),
(619, 'SR00000619', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:27:14', 'Open', NULL, NULL, NULL, NULL),
(620, 'SR00000620', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:27:29', 'Open', NULL, NULL, NULL, NULL),
(621, 'SR00000621', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:28:09', 'Open', NULL, NULL, NULL, NULL),
(622, 'SR00000622', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-24 05:28:19', 'Open', NULL, NULL, NULL, NULL),
(623, 'SR00000623', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:15:06', 'Open', NULL, NULL, NULL, NULL),
(624, 'SR00000624', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:15:19', 'Open', NULL, NULL, NULL, NULL),
(625, 'SR00000625', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:15:37', 'Open', NULL, NULL, NULL, NULL),
(626, 'SR00000626', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:15:52', 'Open', NULL, NULL, NULL, NULL),
(627, 'SR00000627', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:16:02', 'Open', NULL, NULL, NULL, NULL),
(628, 'SR00000628', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:16:13', 'Open', NULL, NULL, NULL, NULL),
(629, 'SR00000629', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-24 19:16:27', 'Open', NULL, NULL, NULL, NULL),
(630, 'SR00000630', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-25 03:46:06', 'Open', NULL, NULL, NULL, NULL),
(631, 'SR00000631', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:48:05', 'Open', NULL, NULL, NULL, NULL),
(632, 'SR00000632', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:48:16', 'Open', NULL, NULL, NULL, NULL),
(633, 'SR00000633', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:48:37', 'Open', NULL, NULL, NULL, NULL),
(634, 'SR00000634', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:48:51', 'Open', NULL, NULL, NULL, NULL),
(635, 'SR00000635', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:49:02', 'Open', NULL, NULL, NULL, NULL),
(636, 'SR00000636', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:49:12', 'Open', NULL, NULL, NULL, NULL),
(637, 'SR00000637', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-25 06:49:26', 'Open', NULL, NULL, NULL, NULL),
(638, 'SR00000638', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-25 08:02:05', 'Open', NULL, NULL, NULL, NULL),
(639, 'SR00000639', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:00:50', 'Open', NULL, NULL, NULL, NULL),
(640, 'SR00000640', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:01:01', 'Open', NULL, NULL, NULL, NULL),
(641, 'SR00000641', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:01:12', 'Open', NULL, NULL, NULL, NULL),
(642, 'SR00000642', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:40:34', 'Open', NULL, NULL, NULL, NULL),
(643, 'SR00000643', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:40:49', 'Open', NULL, NULL, NULL, NULL),
(644, 'SR00000644', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:41:00', 'Open', NULL, NULL, NULL, NULL),
(645, 'SR00000645', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:41:10', 'Open', NULL, NULL, NULL, NULL),
(646, 'SR00000646', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-25 09:51:24', 'Open', NULL, NULL, NULL, NULL),
(647, 'SR00000647', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-25 11:00:35', 'Open', NULL, NULL, NULL, NULL),
(648, 'SR00000648', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 11:06:50', 'Open', NULL, NULL, NULL, NULL),
(649, 'SR00000649', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 11:10:59', 'Open', NULL, NULL, NULL, NULL),
(650, 'SR00000650', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 11:11:10', 'Open', NULL, NULL, NULL, NULL),
(651, 'SR00000651', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-25 11:32:06', 'Open', NULL, NULL, NULL, NULL),
(652, 'SR00000652', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-25 14:00:06', 'Open', NULL, NULL, NULL, NULL),
(653, 'SR00000653', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-25 14:00:06', 'Open', NULL, NULL, NULL, NULL),
(654, 'SR00000654', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-25 15:32:05', 'Open', NULL, NULL, NULL, NULL),
(655, 'SR00000655', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:54:06', 'Open', NULL, NULL, NULL, NULL),
(656, 'SR00000656', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:54:18', 'Open', NULL, NULL, NULL, NULL),
(657, 'SR00000657', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:54:40', 'Open', NULL, NULL, NULL, NULL),
(658, 'SR00000658', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:54:54', 'Open', NULL, NULL, NULL, NULL),
(659, 'SR00000659', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:55:05', 'Open', NULL, NULL, NULL, NULL),
(660, 'SR00000660', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:55:16', 'Open', NULL, NULL, NULL, NULL),
(661, 'SR00000661', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-25 20:55:30', 'Open', NULL, NULL, NULL, NULL),
(662, 'SR00000662', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-25 23:40:34', 'Open', NULL, NULL, NULL, NULL),
(663, 'SR00000663', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-25 23:40:50', 'Open', NULL, NULL, NULL, NULL),
(664, 'SR00000664', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:05:25', 'Open', NULL, NULL, NULL, NULL),
(665, 'SR00000665', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:05:40', 'Open', NULL, NULL, NULL, NULL),
(666, 'SR00000666', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:05:50', 'Open', NULL, NULL, NULL, NULL),
(667, 'SR00000667', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:06:01', 'Open', NULL, NULL, NULL, NULL),
(668, 'SR00000668', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:06:15', 'Open', NULL, NULL, NULL, NULL),
(669, 'SR00000669', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:52:05', 'Open', NULL, NULL, NULL, NULL),
(670, 'SR00000670', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:52:16', 'Open', NULL, NULL, NULL, NULL),
(671, 'SR00000671', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:52:38', 'Open', NULL, NULL, NULL, NULL),
(672, 'SR00000672', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:52:51', 'Open', NULL, NULL, NULL, NULL),
(673, 'SR00000673', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:53:03', 'Open', NULL, NULL, NULL, NULL),
(674, 'SR00000674', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:53:13', 'Open', NULL, NULL, NULL, NULL),
(675, 'SR00000675', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-26 01:53:27', 'Open', NULL, NULL, NULL, NULL),
(676, 'SR00000676', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-26 04:25:25', 'Open', NULL, NULL, NULL, NULL),
(677, 'SR00000677', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-26 04:25:40', 'Open', NULL, NULL, NULL, NULL),
(678, 'SR00000678', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 04:25:51', 'Open', NULL, NULL, NULL, NULL),
(679, 'SR00000679', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 04:26:02', 'Open', NULL, NULL, NULL, NULL),
(680, 'SR00000680', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-26 04:26:16', 'Open', NULL, NULL, NULL, NULL),
(681, 'SR00000681', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:06', 'Open', NULL, NULL, NULL, NULL),
(682, 'SR00000682', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:06', 'Open', NULL, NULL, NULL, NULL),
(683, 'SR00000683', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:17', 'Open', NULL, NULL, NULL, NULL),
(684, 'SR00000684', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:17', 'Open', NULL, NULL, NULL, NULL),
(685, 'SR00000685', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:40', 'Open', NULL, NULL, NULL, NULL),
(686, 'SR00000685', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:40', 'Open', NULL, NULL, NULL, NULL),
(687, 'SR00000687', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:54', 'Open', NULL, NULL, NULL, NULL),
(688, 'SR00000687', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:30:54', 'Open', NULL, NULL, NULL, NULL),
(689, 'SR00000689', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:05', 'Open', NULL, NULL, NULL, NULL),
(690, 'SR00000689', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:05', 'Open', NULL, NULL, NULL, NULL),
(691, 'SR00000691', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:16', 'Open', NULL, NULL, NULL, NULL),
(692, 'SR00000691', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:16', 'Open', NULL, NULL, NULL, NULL),
(693, 'SR00000693', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:30', 'Open', NULL, NULL, NULL, NULL),
(694, 'SR00000693', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-26 08:31:30', 'Open', NULL, NULL, NULL, NULL),
(695, 'SR00000695', 'MET', 'MET-001', 'Device offline', 'Device is offline.', 'System', '2016-05-26 14:00:12', 'Open', NULL, NULL, NULL, NULL),
(696, 'SR00000696', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-26 22:20:05', 'Open', NULL, NULL, NULL, NULL),
(697, 'SR00000697', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-26 22:20:05', 'Open', NULL, NULL, NULL, NULL),
(698, 'SR00000698', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 09:36:24', 'Open', NULL, NULL, NULL, NULL),
(699, 'SR00000699', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 10:18:24', 'Open', NULL, NULL, NULL, NULL),
(700, 'SR00000700', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:10:25', 'Open', NULL, NULL, NULL, NULL),
(701, 'SR00000701', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:10:25', 'Open', NULL, NULL, NULL, NULL),
(702, 'SR00000702', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:15:24', 'Open', NULL, NULL, NULL, NULL),
(703, 'SR00000703', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:30:25', 'Open', NULL, NULL, NULL, NULL),
(704, 'SR00000704', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:30:25', 'Open', NULL, NULL, NULL, NULL),
(705, 'SR00000705', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:45:44', 'Open', NULL, NULL, NULL, NULL),
(706, 'SR00000706', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:53:03', 'Open', NULL, NULL, NULL, NULL),
(707, 'SR00000707', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 11:53:18', 'Open', NULL, NULL, NULL, NULL),
(708, 'SR00000708', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:00:06', 'Open', NULL, NULL, NULL, NULL),
(709, 'SR00000709', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:00:06', 'Open', NULL, NULL, NULL, NULL),
(710, 'SR00000710', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:00:16', 'Open', NULL, NULL, NULL, NULL),
(711, 'SR00000711', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:00:16', 'Open', NULL, NULL, NULL, NULL),
(712, 'SR00000712', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:02:24', 'Open', NULL, NULL, NULL, NULL),
(713, 'SR00000713', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:02:41', 'Open', NULL, NULL, NULL, NULL),
(714, 'SR00000714', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:02:52', 'Open', NULL, NULL, NULL, NULL),
(715, 'SR00000715', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:04:35', 'Open', NULL, NULL, NULL, NULL),
(716, 'SR00000716', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:04:50', 'Open', NULL, NULL, NULL, NULL),
(717, 'SR00000717', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:05:39', 'Open', NULL, NULL, NULL, NULL),
(718, 'SR00000718', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:06:39', 'Open', NULL, NULL, NULL, NULL),
(719, 'SR00000719', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:07:10', 'Open', NULL, NULL, NULL, NULL),
(720, 'SR00000720', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:08:39', 'Open', NULL, NULL, NULL, NULL),
(721, 'SR00000721', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:09:08', 'Open', NULL, NULL, NULL, NULL),
(722, 'SR00000722', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:09:12', 'Open', NULL, NULL, NULL, NULL),
(723, 'SR00000723', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:09:35', 'Open', NULL, NULL, NULL, NULL),
(724, 'SR00000724', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-27 12:10:01', 'Open', NULL, NULL, NULL, NULL),
(725, 'SR00000725', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-27 14:17:11', 'Open', NULL, NULL, NULL, NULL),
(726, 'SR00000726', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-28 02:35:06', 'Open', NULL, NULL, NULL, NULL),
(727, 'SR00000727', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-28 04:00:26', 'Open', NULL, NULL, NULL, NULL),
(728, 'SR00000728', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-28 04:00:34', 'Open', NULL, NULL, NULL, NULL),
(729, 'SR00000729', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-28 04:45:06', 'Open', NULL, NULL, NULL, NULL),
(730, 'SR00000730', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:22:05', 'Open', NULL, NULL, NULL, NULL),
(731, 'SR00000731', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:22:17', 'Open', NULL, NULL, NULL, NULL),
(732, 'SR00000732', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:22:54', 'Open', NULL, NULL, NULL, NULL),
(733, 'SR00000733', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:23:06', 'Open', NULL, NULL, NULL, NULL),
(734, 'SR00000734', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:23:18', 'Open', NULL, NULL, NULL, NULL),
(735, 'SR00000735', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-28 05:23:29', 'Open', NULL, NULL, NULL, NULL),
(736, 'SR00000736', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-29 11:10:40', 'Open', NULL, NULL, NULL, NULL),
(737, 'SR00000737', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-29 11:11:14', 'Open', NULL, NULL, NULL, NULL),
(738, 'SR00000738', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-29 12:20:15', 'Open', NULL, NULL, NULL, NULL),
(739, 'SR00000739', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-29 12:20:16', 'Open', NULL, NULL, NULL, NULL),
(740, 'SR00000740', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-29 15:24:05', 'Open', NULL, NULL, NULL, NULL),
(741, 'SR00000741', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-30 05:36:06', 'Open', NULL, NULL, NULL, NULL),
(742, 'SR00000742', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-30 06:30:16', 'Open', NULL, NULL, NULL, NULL),
(743, 'SR00000743', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-30 10:34:05', 'Open', NULL, NULL, NULL, NULL),
(744, 'SR00000744', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-30 12:20:16', 'Open', NULL, NULL, NULL, NULL),
(745, 'SR00000745', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-30 16:34:05', 'Open', NULL, NULL, NULL, NULL),
(746, 'SR00000746', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-30 18:22:05', 'Open', NULL, NULL, NULL, NULL),
(747, 'SR00000747', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-30 19:35:06', 'Open', NULL, NULL, NULL, NULL),
(748, 'SR00000748', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-30 19:42:05', 'Open', NULL, NULL, NULL, NULL),
(749, 'SR00000749', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-05-30 20:14:16', 'Open', NULL, NULL, NULL, NULL),
(750, 'SR00000750', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-30 21:10:06', 'Open', NULL, NULL, NULL, NULL),
(751, 'SR00000751', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-30 21:10:06', 'Open', NULL, NULL, NULL, NULL),
(752, 'SR00000752', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-30 21:10:30', 'Open', NULL, NULL, NULL, NULL),
(753, 'SR00000753', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-30 21:10:30', 'Open', NULL, NULL, NULL, NULL),
(754, 'SR00000754', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-31 00:50:05', 'Open', NULL, NULL, NULL, NULL),
(755, 'SR00000755', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-05-31 00:50:05', 'Open', NULL, NULL, NULL, NULL),
(756, 'SR00000756', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-31 03:25:31', 'Open', NULL, NULL, NULL, NULL),
(757, 'SR00000757', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-31 03:26:06', 'Open', NULL, NULL, NULL, NULL),
(758, 'SR00000758', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-05-31 04:34:05', 'Open', NULL, NULL, NULL, NULL),
(759, 'SR00000759', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-31 06:04:06', 'Open', NULL, NULL, NULL, NULL),
(760, 'SR00000760', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-31 10:35:07', 'Open', NULL, NULL, NULL, NULL),
(761, 'SR00000761', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-31 11:45:06', 'Open', NULL, NULL, NULL, NULL),
(762, 'SR00000762', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-31 14:45:06', 'Open', NULL, NULL, NULL, NULL),
(763, 'SR00000763', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:48:06', 'Open', NULL, NULL, NULL, NULL),
(764, 'SR00000764', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:48:18', 'Open', NULL, NULL, NULL, NULL),
(765, 'SR00000765', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:48:38', 'Open', NULL, NULL, NULL, NULL),
(766, 'SR00000766', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:48:50', 'Open', NULL, NULL, NULL, NULL),
(767, 'SR00000767', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:49:01', 'Open', NULL, NULL, NULL, NULL),
(768, 'SR00000768', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:49:12', 'Open', NULL, NULL, NULL, NULL),
(769, 'SR00000769', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:49:24', 'Open', NULL, NULL, NULL, NULL),
(770, 'SR00000770', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-05-31 17:49:35', 'Open', NULL, NULL, NULL, NULL),
(771, 'SR00000771', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:04:05', 'Open', NULL, NULL, NULL, NULL),
(772, 'SR00000772', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:48:50', 'Open', NULL, NULL, NULL, NULL),
(773, 'SR00000773', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:49:03', 'Open', NULL, NULL, NULL, NULL),
(774, 'SR00000774', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:49:15', 'Open', NULL, NULL, NULL, NULL),
(775, 'SR00000775', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:06', 'Open', NULL, NULL, NULL, NULL),
(776, 'SR00000776', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:06', 'Open', NULL, NULL, NULL, NULL),
(777, 'SR00000777', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:17', 'Open', NULL, NULL, NULL, NULL),
(778, 'SR00000778', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:21', 'Open', NULL, NULL, NULL, NULL),
(779, 'SR00000779', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:38', 'Open', NULL, NULL, NULL, NULL),
(780, 'SR00000780', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:50:41', 'Open', NULL, NULL, NULL, NULL),
(781, 'SR00000781', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:51:04', 'Open', NULL, NULL, NULL, NULL),
(782, 'SR00000782', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 07:51:07', 'Open', NULL, NULL, NULL, NULL),
(783, 'SR00000783', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:32:05', 'Open', NULL, NULL, NULL, NULL),
(784, 'SR00000784', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:32:17', 'Open', NULL, NULL, NULL, NULL),
(785, 'SR00000785', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:34:24', 'Open', NULL, NULL, NULL, NULL),
(786, 'SR00000786', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:34:40', 'Open', NULL, NULL, NULL, NULL),
(787, 'SR00000787', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:34:52', 'Open', NULL, NULL, NULL, NULL),
(788, 'SR00000788', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:35:14', 'Open', NULL, NULL, NULL, NULL),
(789, 'SR00000789', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 09:35:36', 'Open', NULL, NULL, NULL, NULL),
(790, 'SR00000790', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:42:05', 'Open', NULL, NULL, NULL, NULL),
(791, 'SR00000791', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:42:18', 'Open', NULL, NULL, NULL, NULL),
(792, 'SR00000792', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:44:45', 'Open', NULL, NULL, NULL, NULL),
(793, 'SR00000793', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:45:33', 'Open', NULL, NULL, NULL, NULL),
(794, 'SR00000794', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:45:58', 'Open', NULL, NULL, NULL, NULL),
(795, 'SR00000795', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:46:06', 'Open', NULL, NULL, NULL, NULL),
(796, 'SR00000796', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:46:10', 'Open', NULL, NULL, NULL, NULL),
(797, 'SR00000797', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:46:18', 'Open', NULL, NULL, NULL, NULL),
(798, 'SR00000798', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:46:24', 'Open', NULL, NULL, NULL, NULL),
(799, 'SR00000799', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:50:44', 'Open', NULL, NULL, NULL, NULL),
(800, 'SR00000800', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 10:50:44', 'Open', NULL, NULL, NULL, NULL),
(801, 'SR00000801', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:15:58', 'Open', NULL, NULL, NULL, NULL),
(802, 'SR00000802', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:16:06', 'Open', NULL, NULL, NULL, NULL),
(803, 'SR00000803', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:16:15', 'Open', NULL, NULL, NULL, NULL),
(804, 'SR00000804', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:20:09', 'Open', NULL, NULL, NULL, NULL),
(805, 'SR00000804', 'VMS', 'VMS-4', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:20:09', 'Open', NULL, NULL, NULL, NULL),
(806, 'SR00000806', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:20:54', 'Open', NULL, NULL, NULL, NULL),
(807, 'SR00000807', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:20:54', 'Open', NULL, NULL, NULL, NULL),
(808, 'SR00000808', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:21:17', 'Open', NULL, NULL, NULL, NULL),
(809, 'SR00000809', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:21:17', 'Open', NULL, NULL, NULL, NULL),
(810, 'SR00000810', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:51:00', 'Open', NULL, NULL, NULL, NULL),
(811, 'SR00000811', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 11:51:23', 'Open', NULL, NULL, NULL, NULL),
(812, 'SR00000812', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:10:40', 'Open', NULL, NULL, NULL, NULL),
(813, 'SR00000813', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:18', 'Open', NULL, NULL, NULL, NULL),
(814, 'SR00000814', 'CCTV', 'PTZ CH 226', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:28', 'Open', NULL, NULL, NULL, NULL),
(815, 'SR00000815', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:31', 'Open', NULL, NULL, NULL, NULL),
(816, 'SR00000816', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:44', 'Open', NULL, NULL, NULL, NULL),
(817, 'SR00000817', 'CCTV', 'PTZ CH 243', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:44', 'Open', NULL, NULL, NULL, NULL),
(818, 'SR00000818', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:56', 'Open', NULL, NULL, NULL, NULL),
(819, 'SR00000819', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:40:56', 'Open', NULL, NULL, NULL, NULL),
(820, 'SR00000820', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:41:09', 'Open', NULL, NULL, NULL, NULL),
(821, 'SR00000821', 'CCTV', 'PTZ CH 260 RHS', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:41:09', 'Open', NULL, NULL, NULL, NULL),
(822, 'SR00000822', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:41:22', 'Open', NULL, NULL, NULL, NULL),
(823, 'SR00000823', 'CCTV', 'PTZ CH-275', 'Device offline', 'Device is offline.', 'System', '2016-06-01 13:41:22', 'Open', NULL, NULL, NULL, NULL),
(824, 'SR00000824', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-06-01 19:15:06', 'Open', NULL, NULL, NULL, NULL),
(825, 'SR00000825', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-02 04:26:13', 'Open', NULL, NULL, NULL, NULL),
(826, 'SR00000826', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-02 04:36:13', 'Open', NULL, NULL, NULL, NULL),
(827, 'SR00000827', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-02 05:15:14', 'Open', NULL, NULL, NULL, NULL),
(828, 'SR00000828', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-02 12:42:13', 'Open', NULL, NULL, NULL, NULL),
(829, 'SR00000829', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-06-03 00:40:05', 'Open', NULL, NULL, NULL, NULL),
(830, 'SR00000830', 'VMS', 'VMS-001', 'Device offline', 'Device is offline.', 'System', '2016-06-03 01:04:05', 'Open', NULL, NULL, NULL, NULL),
(831, 'SR00000831', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-03 15:42:23', 'Open', NULL, NULL, NULL, NULL),
(832, 'SR00000832', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-04 04:42:13', 'Open', NULL, NULL, NULL, NULL),
(833, 'SR00000833', 'CCTV', 'PTZ CH 260 LHS', 'Device offline', 'Device is offline.', 'System', '2016-06-04 05:48:15', 'Open', NULL, NULL, NULL, NULL),
(834, 'SR00000834', 'VMS', 'VMS-004', 'Device offline', 'Device is offline.', 'System', '2016-06-04 10:16:06', 'Open', NULL, NULL, NULL, NULL),
(835, 'SR00000835', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-04 15:42:16', 'Open', NULL, NULL, NULL, NULL),
(836, 'SR00000836', 'VMS', 'VMS-004', 'Device offline', 'Device is offline.', 'System', '2016-06-05 09:42:06', 'Open', NULL, NULL, NULL, NULL),
(837, 'SR00000837', 'VMS', 'VMS-003', 'Device offline', 'Device is offline.', 'System', '2016-06-05 15:10:06', 'Open', NULL, NULL, NULL, NULL),
(838, 'SR00000838', 'VMS', 'VMS-004', 'Device offline', 'Device is offline.', 'System', '2016-06-05 15:10:26', 'Open', NULL, NULL, NULL, NULL),
(839, 'SR00000839', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-05 18:42:13', 'Open', NULL, NULL, NULL, NULL),
(840, 'SR00000840', 'VMS', 'VMS-004', 'Device offline', 'Device is offline.', 'System', '2016-06-06 04:04:06', 'Open', NULL, NULL, NULL, NULL),
(841, 'SR00000841', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-06 16:30:14', 'Open', NULL, NULL, NULL, NULL),
(842, 'SR00000842', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-06-12 19:30:06', 'Open', NULL, NULL, NULL, NULL),
(843, 'SR00000843', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-12 20:00:14', 'Open', NULL, NULL, NULL, NULL),
(844, 'SR00000844', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-06-13 07:15:06', 'Open', NULL, NULL, NULL, NULL),
(845, 'SR00000845', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-06-15 03:45:06', 'Open', NULL, NULL, NULL, NULL),
(846, 'SR00000846', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-06-23 00:30:11', 'Open', NULL, NULL, NULL, NULL),
(847, 'SR00000847', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-06-24 04:45:05', 'Open', NULL, NULL, NULL, NULL),
(848, 'SR00000848', 'CCTV', 'PTZ CH 237', 'Device offline', 'Device is offline.', 'System', '2016-07-02 08:45:10', 'Open', NULL, NULL, NULL, NULL),
(849, 'SR00000849', 'VMS', 'VMS-002', 'Device offline', 'Device is offline.', 'System', '2016-07-07 02:00:05', 'Open', NULL, NULL, NULL, NULL),
(850, 'SR00000850', 'VMS', 'VMS-004', 'Device offline', 'Device is offline.', 'System', '2016-07-07 02:15:08', 'Open', NULL, NULL, NULL, NULL),
(851, 'SR00000851', '', '', '', '', '', '2016-09-12 06:47:46', 'Open', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tis_meteorological_auto_rep`
--

CREATE TABLE `tis_meteorological_auto_rep` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` text NOT NULL,
  `frequency` text NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_meteorological_auto_rep`
--

INSERT INTO `tis_meteorological_auto_rep` (`id`, `user`, `frequency`, `updated_time`) VALUES
(7, 'pkannan', 'Weekly', '2016-12-15 10:49:13'),
(10, 'vishwajeet', 'Hourly', '2016-12-15 11:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `tis_meteorological_dynamic_dump`
--

CREATE TABLE `tis_meteorological_dynamic_dump` (
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Record` int(11) NOT NULL,
  `BattV_Avg` double NOT NULL,
  `PTemp_C_Avg` double NOT NULL,
  `AirTC_Avg` double NOT NULL,
  `RH` double NOT NULL,
  `WS_ms_Avg` double NOT NULL,
  `WindDir` double NOT NULL,
  `TT_C_Avg` double NOT NULL,
  `SBT_C_Avg` double NOT NULL,
  `Visibility` int(11) NOT NULL,
  `SystemCodeNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_meteorological_dynamic_dump`
--

INSERT INTO `tis_meteorological_dynamic_dump` (`TimeStamp`, `Record`, `BattV_Avg`, `PTemp_C_Avg`, `AirTC_Avg`, `RH`, `WS_ms_Avg`, `WindDir`, `TT_C_Avg`, `SBT_C_Avg`, `Visibility`, `SystemCodeNumber`) VALUES
('2016-12-01 15:04:01', 706, 13.26, 26.89, 26.03, 99.2, 0.957, 143.7, 25.65, 25.65, 10676, NULL),
('2016-12-01 15:09:01', 707, 13.26, 26.87, 26.09, 99.4, 0.931, 159, 25.72, 25.72, 9009, NULL),
('2016-12-01 15:14:01', 708, 13.26, 26.9, 26.1, 99.2, 1.651, 144, 25.79, 25.79, 11111, NULL),
('2016-12-01 15:19:02', 709, 13.27, 26.88, 26.12, 98.8, 1.677, 117.1, 25.78, 25.78, 12931, NULL),
('2016-12-01 15:24:01', 710, 13.26, 26.87, 26.05, 98.4, 1.799, 168.8, 25.71, 25.71, 16304, NULL),
('2016-12-01 15:29:01', 711, 13.27, 26.88, 26.04, 98.2, 1.895, 143.8, 25.6, 25.6, 13953, NULL),
('2016-12-01 15:34:01', 712, 13.26, 26.87, 26.01, 98.3, 2.076, 168.7, 25.57, 25.57, 9868, NULL),
('2016-12-01 15:39:02', 713, 13.26, 26.86, 25.93, 98.4, 1.855, 163.9, 25.53, 25.53, 10135, NULL),
('2016-12-01 15:44:02', 714, 13.26, 26.82, 25.84, 98.5, 1.807, 164.3, 25.44, 25.44, 11494, NULL),
('2016-12-01 15:49:01', 715, 13.27, 26.78, 25.8, 98.8, 1.631, 165.6, 25.41, 25.41, 10490, NULL),
('2016-12-01 15:54:01', 716, 13.26, 26.74, 25.8, 98.8, 1.59, 164.9, 25.42, 25.42, 10676, NULL),
('2016-12-01 15:59:01', 717, 13.26, 26.7, 25.73, 98.8, 2.009, 137.6, 25.39, 25.39, 10453, NULL),
('2016-12-01 16:04:02', 718, 13.26, 26.66, 25.7, 98.8, 1.682, 177.3, 25.33, 25.33, 10676, NULL),
('2016-12-01 16:09:01', 719, 13.26, 26.62, 25.69, 98.9, 1.164, 135.6, 25.32, 25.32, 10309, NULL),
('2016-12-01 16:14:01', 720, 13.26, 26.6, 25.66, 98.8, 1.687, 149.4, 25.29, 25.29, 9709, NULL),
('2016-12-01 16:19:02', 721, 13.26, 26.57, 25.64, 98.8, 1.066, 154.4, 25.25, 25.25, 8219, NULL),
('2016-12-01 16:24:01', 722, 13.26, 26.56, 25.62, 99, 0.932, 200.4, 25.26, 25.26, 6711, NULL),
('2016-12-01 16:29:01', 723, 13.26, 26.54, 25.63, 99, 1.307, 137.7, 25.3, 25.3, 7692, NULL),
('2016-12-01 16:34:02', 724, 13.26, 26.54, 25.64, 99.1, 1.187, 146, 25.3, 25.3, 7853, NULL),
('2016-12-01 16:39:01', 725, 13.26, 26.51, 25.59, 99.3, 1.172, 135.3, 25.26, 25.26, 7407, NULL),
('2016-12-01 16:44:01', 726, 13.26, 26.5, 25.56, 99.4, 1.267, 140.8, 25.26, 25.26, 7109, NULL),
('2016-12-01 16:49:01', 727, 13.26, 26.52, 25.6, 99.5, 0.188, 134.5, 25.32, 25.32, 6085, NULL),
('2016-12-01 16:54:01', 728, 13.27, 26.51, 25.59, 99.6, 0.116, 134.5, 25.32, 25.32, 5671, NULL),
('2016-12-01 16:59:02', 729, 13.26, 26.48, 25.62, 99.8, 0.352, 96.2, 25.33, 25.33, 4950, NULL),
('2016-12-01 17:04:01', 730, 13.26, 26.47, 25.63, 99.9, 0.152, 91.8, 25.39, 25.39, 4249, NULL),
('2016-12-01 17:09:01', 731, 13.26, 26.51, 25.6, 100, 1.923, 116.1, 25.39, 25.39, 4425, NULL),
('2016-12-01 17:14:01', 732, 13.26, 26.52, 25.62, 100, 0.847, 137.7, 25.43, 25.43, 4518, NULL),
('2016-12-01 17:19:01', 733, 13.26, 26.55, 25.65, 100, 1.552, 128.9, 25.48, 25.48, 4458, NULL),
('2016-12-01 17:24:01', 734, 13.26, 26.63, 25.72, 99.9, 1.947, 129.3, 25.54, 25.54, 4950, NULL),
('2016-12-01 17:29:01', 735, 13.26, 26.72, 25.8, 99.7, 2.059, 138.7, 25.61, 25.61, 5000, NULL),
('2016-12-01 17:34:02', 736, 13.26, 26.85, 25.94, 99.4, 1.962, 127, 25.75, 25.75, 5396, NULL),
('2016-12-01 17:39:01', 737, 13.26, 27.03, 26.13, 98.9, 1.874, 136.6, 25.98, 25.98, 5792, NULL),
('2016-12-01 17:44:01', 738, 13.26, 27.33, 26.28, 98.7, 1.92, 120.6, 26.17, 26.17, 5964, NULL),
('2016-12-01 17:49:02', 739, 13.27, 27.42, 26.38, 98.4, 1.664, 166.4, 26.28, 26.28, 6356, NULL),
('2016-12-01 17:54:02', 740, 13.26, 27.72, 26.58, 97.9, 1.9, 157.9, 26.72, 26.72, 6263, NULL),
('2016-12-01 17:59:01', 741, 13.26, 27.94, 26.75, 97.3, 2.002, 163.9, 26.99, 26.99, 7229, NULL),
('2016-12-01 18:04:01', 742, 13.26, 28.29, 27.1, 96.6, 2.017, 176.9, 27.52, 27.52, 7317, NULL),
('2016-12-01 18:09:01', 743, 13.26, 28.73, 27.33, 95.9, 1.807, 169.2, 27.89, 27.89, 8571, NULL),
('2016-12-01 18:14:01', 744, 13.26, 29.19, 27.52, 95.8, 1.382, 152.9, 28.23, 28.23, 0, NULL),
('2016-12-01 18:19:01', 745, 13.27, 29.37, 27.73, 94.2, 1.715, 157.1, 28.5, 28.5, 11538, NULL),
('2016-12-01 18:24:02', 746, 13.27, 29.81, 27.99, 93.7, 1.668, 143.1, 29.01, 29.01, 12987, NULL),
('2016-12-01 18:29:02', 747, 13.26, 30.13, 28.17, 93, 1.154, 158.2, 29.25, 29.25, 0, NULL),
('2016-12-01 18:34:02', 748, 13.27, 30.55, 28.43, 91.5, 1.031, 155.3, 29.87, 29.87, 0, NULL),
('2016-12-01 18:39:01', 749, 13.28, 31.05, 29, 88.9, 1.71, 113.6, 30.85, 30.85, 15385, NULL),
('2016-12-01 18:44:01', 750, 13.28, 32.26, 29.25, 88.6, 1.618, 133.9, 31.46, 31.46, 12195, NULL),
('2016-12-01 18:49:02', 751, 13.28, 32.84, 29.29, 88.3, 1.653, 174.9, 31.81, 31.81, 10791, NULL),
('2016-12-01 18:54:01', 752, 13.28, 33.13, 29.56, 86.8, 1.463, 144.9, 31.66, 31.66, 14286, NULL),
('2016-12-01 18:59:02', 753, 13.29, 33.62, 29.88, 87, 1.469, 124.8, 32.25, 32.25, 13393, NULL),
('2016-12-01 19:04:01', 754, 13.29, 33.91, 29.94, 86.6, 1.573, 136.6, 32.44, 32.44, 14354, NULL),
('2016-12-01 19:09:01', 755, 13.29, 34.06, 30.01, 86.1, 2.235, 121.4, 32.18, 32.18, 14778, NULL),
('2016-12-01 19:14:01', 756, 13.29, 33.98, 30.05, 86.3, 2.009, 136.9, 32.04, 32.04, 14085, NULL),
('2016-12-01 19:19:01', 757, 13.29, 34.02, 30.26, 86.1, 1.829, 99.2, 32.4, 32.4, 14218, NULL),
('2016-12-01 19:24:01', 758, 13.29, 34.02, 30.18, 86.3, 2.07, 124.7, 32.12, 32.12, 14286, NULL),
('2016-12-01 19:29:01', 759, 13.29, 33.9, 30.18, 87.4, 2.377, 128.2, 32.07, 32.07, 14218, NULL),
('2016-12-01 19:34:02', 760, 13.28, 34.41, 30.59, 85.7, 2.649, 161.5, 33.4, 33.4, 14563, NULL),
('2016-12-01 19:39:02', 761, 13.28, 35.02, 30.9, 83.6, 2.352, 151.3, 33.89, 33.89, 15957, NULL),
('2016-12-01 19:44:01', 762, 13.28, 35.53, 31.06, 82.6, 2.678, 145.8, 34, 34, 15707, NULL),
('2016-12-01 19:49:01', 763, 13.28, 35.64, 31.13, 82.3, 2.632, 184.1, 33.79, 33.79, 16760, NULL),
('2016-12-01 19:54:01', 764, 13.28, 35.63, 31.08, 83, 2.758, 132, 33.49, 33.49, 15957, NULL),
('2016-12-01 19:59:01', 765, 13.27, 35.33, 30.9, 83.8, 2.696, 144.1, 32.88, 32.88, 14634, NULL),
('2016-12-01 20:04:02', 766, 13.28, 35.23, 30.82, 85.3, 3.06, 144.7, 32.78, 32.78, 13453, NULL),
('2016-12-01 20:09:01', 767, 13.28, 35.01, 30.88, 83.2, 3.141, 143.2, 32.82, 32.82, 14423, NULL),
('2016-12-01 20:14:01', 768, 13.27, 35.16, 31, 82.2, 3.319, 149.9, 33.17, 33.17, 0, NULL),
('2016-12-01 20:19:02', 769, 13.28, 35.18, 31.05, 83.7, 3.236, 121.5, 33.12, 33.12, 15789, NULL),
('2016-12-01 20:24:02', 770, 13.27, 35.07, 30.79, 84.6, 3.435, 129.7, 32.63, 32.63, 14563, NULL),
('2016-12-01 20:29:01', 771, 13.28, 34.94, 30.92, 84.3, 2.688, 134.2, 32.35, 32.35, 15306, NULL),
('2016-12-01 20:34:01', 772, 13.27, 34.88, 30.75, 86.4, 3.304, 126.8, 32.47, 32.47, 14218, NULL),
('2016-12-01 20:39:01', 773, 13.29, 34.91, 30.73, 85.1, 3.238, 142.5, 32.6, 32.6, 13514, NULL),
('2016-12-01 20:44:01', 774, 13.29, 35.43, 31.05, 84.2, 3.363, 112.6, 33.54, 33.54, 14085, NULL),
('2016-12-01 20:49:02', 775, 13.29, 36.28, 31.36, 81.5, 3.514, 133.5, 34.17, 34.17, 9804, NULL),
('2016-12-01 20:54:01', 776, 13.3, 36.59, 31.42, 83, 3.462, 137.5, 33.94, 33.94, 13216, NULL),
('2016-12-01 20:59:01', 777, 13.3, 36.53, 31.33, 82.3, 3.529, 133.2, 33.46, 33.46, 14423, NULL),
('2016-12-01 21:04:02', 778, 13.3, 36.46, 31.54, 82.6, 3.269, 175.5, 33.56, 33.56, 8287, NULL),
('2016-12-01 21:09:01', 779, 13.3, 36.39, 31.02, 84, 3.819, 135.8, 32.9, 32.9, 8499, NULL),
('2016-12-01 21:14:01', 780, 13.29, 35.8, 30.74, 85.4, 3.261, 150.3, 32.14, 32.14, 8475, NULL),
('2016-12-01 21:19:02', 781, 13.29, 35.09, 30.49, 86.3, 3.222, 160.1, 31.38, 31.38, 10676, NULL),
('2016-12-01 21:24:01', 782, 13.29, 34.5, 30.26, 88.6, 3.059, 133.5, 31.05, 31.05, 9404, NULL),
('2016-12-01 21:29:01', 783, 13.29, 33.84, 29.89, 89.6, 2.856, 126.1, 30.35, 30.35, 8929, NULL),
('2016-12-01 21:34:01', 784, 13.28, 33.21, 29.75, 90.5, 2.556, 129.6, 29.97, 29.97, 8021, NULL),
('2016-12-01 21:39:01', 785, 13.28, 32.68, 29.61, 91, 2.277, 103.8, 29.71, 29.71, 7634, NULL),
('2016-12-01 21:44:02', 786, 13.28, 32.26, 29.49, 92, 2.13, 130.8, 29.54, 29.54, 6682, NULL),
('2016-12-01 21:49:01', 787, 13.28, 31.95, 29.47, 92.3, 1.824, 111.2, 29.5, 29.5, 7042, NULL),
('2016-12-01 21:54:01', 788, 13.28, 31.66, 29.36, 92.8, 2.455, 162.2, 29.37, 29.37, 6608, NULL),
('2016-12-01 21:59:01', 789, 13.28, 31.43, 29.23, 89.4, 3.007, 126, 29.25, 29.25, 10274, NULL),
('2016-12-01 22:04:01', 790, 13.28, 31.17, 28.85, 89.9, 2.64, 125.8, 28.99, 28.99, 11407, NULL),
('2016-12-01 22:09:01', 791, 13.28, 30.89, 28.58, 90.1, 2.093, 142.5, 28.64, 28.64, 10753, NULL),
('2016-12-01 22:14:02', 792, 13.28, 30.65, 28.54, 89.9, 2.337, 177.5, 28.53, 28.53, 9677, NULL),
('2016-12-01 22:19:01', 793, 13.27, 30.49, 28.36, 91.2, 2.595, 153.5, 28.47, 28.47, 4451, NULL),
('2016-12-01 22:24:01', 794, 13.27, 30.32, 28.05, 93.1, 2.71, 174.2, 28.24, 28.24, 7229, NULL),
('2016-12-01 22:29:01', 795, 13.27, 30, 27.77, 95.3, 2.489, 152.8, 27.75, 27.75, 6036, NULL),
('2016-12-01 22:34:01', 796, 13.27, 29.69, 27.74, 95, 2.158, 154, 27.5, 27.5, 7673, NULL),
('2016-12-01 22:39:01', 797, 13.27, 29.43, 27.72, 93.6, 2.859, 172, 27.62, 27.62, 9494, NULL),
('2016-12-01 22:44:01', 798, 13.27, 29.26, 27.57, 94.2, 2.664, 163.3, 27.55, 27.55, 4754, NULL),
('2016-12-01 22:49:01', 799, 13.27, 29.15, 27.3, 93.1, 2.698, 156.5, 27.37, 27.37, 9494, NULL),
('2016-12-01 22:54:01', 800, 13.27, 28.96, 27.03, 94.2, 2.441, 182.9, 27.08, 27.08, 7481, NULL),
('2016-12-01 22:59:01', 801, 13.27, 28.8, 26.94, 94.9, 2.154, 197.3, 26.95, 26.95, 12658, NULL),
('2016-12-01 23:04:01', 802, 13.27, 28.66, 26.99, 94.8, 2.261, 144.1, 26.94, 26.94, 14085, NULL),
('2016-12-01 23:09:01', 803, 13.27, 28.57, 27.01, 95.2, 1.55, 136.4, 26.99, 26.99, 15464, NULL),
('2016-12-01 23:14:01', 804, 13.27, 28.53, 27.04, 94.5, 1.876, 144.8, 27.02, 27.02, 12097, NULL),
('2016-12-01 23:19:02', 805, 13.27, 28.5, 27.16, 94.9, 1.495, 178.9, 27.09, 27.09, 8902, NULL),
('2016-12-01 23:24:01', 806, 13.27, 28.48, 27.12, 95.5, 1.538, 130, 27.09, 27.09, 12821, NULL),
('2016-12-01 23:29:02', 807, 13.27, 28.46, 27.15, 95.4, 1.853, 152.7, 27.09, 27.09, 11278, NULL),
('2016-12-01 23:34:01', 808, 13.27, 28.45, 27.17, 96, 1.794, 139, 27.13, 27.13, 10714, NULL),
('2016-12-01 23:39:01', 809, 13.27, 28.45, 27.11, 96.8, 1.552, 126.7, 27.1, 27.1, 8242, NULL),
('2016-12-01 23:44:01', 810, 13.27, 28.39, 27.04, 97.2, 1.236, 139, 27.04, 27.04, 7576, NULL),
('2016-12-01 23:49:01', 811, 13.27, 28.37, 27.07, 97.4, 1.535, 137.9, 27.03, 27.03, 6993, NULL),
('2016-12-01 23:54:01', 812, 13.27, 28.38, 27.16, 97.5, 1.94, 114.9, 27.1, 27.1, 6048, NULL),
('2016-12-01 23:59:01', 813, 13.27, 28.39, 27.19, 97.5, 2.056, 118.6, 27.16, 27.16, 6342, NULL),
('2016-12-02 00:04:01', 814, 13.27, 28.39, 27.19, 97.8, 1.609, 142.4, 27.17, 27.17, 5792, NULL),
('2016-12-02 00:09:01', 815, 13.27, 28.4, 27.15, 98.1, 1.477, 136.7, 27.13, 27.13, 5405, NULL),
('2016-12-02 00:14:01', 816, 13.27, 28.38, 27.13, 98.3, 1.482, 147.1, 27.09, 27.09, 5282, NULL),
('2016-12-02 00:19:02', 817, 13.27, 28.34, 27.11, 98.4, 1.296, 118.1, 27.04, 27.04, 5495, NULL),
('2016-12-02 00:24:01', 818, 13.27, 28.32, 27.11, 98.5, 0.879, 151.6, 27.03, 27.03, 5208, NULL),
('2016-12-02 00:29:01', 819, 13.27, 28.3, 27.15, 98.1, 1.037, 147.5, 27.05, 27.05, 5814, NULL),
('2016-12-02 00:34:01', 820, 13.27, 28.3, 27.23, 98, 1.565, 155.9, 27.11, 27.11, 5319, NULL),
('2016-12-02 00:39:01', 821, 13.27, 28.27, 27.17, 98.2, 1.287, 152.7, 27.06, 27.06, 5128, NULL),
('2016-12-02 00:44:01', 822, 13.27, 28.19, 27.08, 98.3, 1.025, 179.6, 26.95, 26.95, 5068, NULL),
('2016-12-02 00:49:02', 823, 13.27, 28.1, 27, 98.7, 1.017, 147.9, 26.8, 26.8, 5181, NULL),
('2016-12-02 00:54:01', 824, 13.26, 28.02, 27.04, 98.6, 1.151, 141.3, 26.78, 26.78, 4983, NULL),
('2016-12-02 00:59:01', 825, 13.27, 28, 27.05, 98.7, 1.409, 166.4, 26.81, 26.81, 4983, NULL),
('2016-12-02 01:04:01', 826, 13.27, 28.02, 27.12, 98.7, 1.596, 145.4, 26.93, 26.93, 4862, NULL),
('2016-12-02 01:09:01', 827, 13.27, 28.04, 27.18, 98.7, 1.882, 156.1, 27.02, 27.02, 4688, NULL),
('2016-12-02 01:14:01', 828, 13.27, 28.1, 27.28, 98.5, 1.815, 164.1, 27.15, 27.15, 4431, NULL),
('2016-12-02 01:19:02', 829, 13.27, 28.2, 27.34, 98.4, 1.648, 166.7, 27.27, 27.27, 3807, NULL),
('2016-12-02 01:24:01', 830, 13.26, 28.28, 27.37, 98.4, 1.839, 155.8, 27.36, 27.36, 3593, NULL),
('2016-12-02 01:29:01', 831, 13.26, 28.38, 27.41, 98.5, 1.417, 168.8, 27.49, 27.49, 3968, NULL),
('2016-12-02 01:34:01', 832, 13.26, 28.49, 27.52, 98.1, 1.091, 136.9, 27.69, 27.69, 4184, NULL),
('2016-12-02 01:39:01', 833, 13.27, 28.91, 27.97, 96.6, 1.747, 179.7, 28.52, 28.52, 5484, NULL),
('2016-12-02 01:44:01', 834, 13.27, 29.14, 28.01, 96, 1.546, 171.9, 28.67, 28.67, 5272, NULL),
('2016-12-02 01:49:01', 835, 13.27, 29.49, 28.3, 94.4, 1.694, 104.7, 29.07, 29.07, 5988, NULL),
('2016-12-02 01:54:01', 836, 13.27, 30.11, 28.61, 93.4, 2.183, 134.2, 29.94, 29.94, 6977, NULL),
('2016-12-02 01:59:01', 837, 13.28, 30.82, 28.86, 91.7, 1.965, 127.2, 30.55, 30.55, 7407, NULL),
('2016-12-02 02:04:01', 838, 13.28, 31.38, 28.67, 91.9, 2.176, 161.7, 30.43, 30.43, 6818, NULL),
('2016-12-02 02:09:01', 839, 13.27, 31.47, 28.77, 93.5, 1.545, 145.6, 29.98, 29.98, 0, NULL),
('2016-12-02 02:14:01', 840, 13.28, 31.58, 29.14, 90.8, 2.088, 133, 30.36, 30.36, 7916, NULL),
('2016-12-02 02:19:01', 841, 13.28, 32.06, 29.51, 86.9, 2.243, 138.9, 31.14, 31.14, 4464, NULL),
('2016-12-02 02:24:02', 842, 13.27, 32.71, 29.7, 88.4, 2.229, 116.7, 31.84, 31.84, 9709, NULL),
('2016-12-02 02:29:01', 843, 13.28, 32.95, 29.84, 84.1, 2.02, 143, 31.67, 31.67, 12000, NULL),
('2016-12-02 02:34:01', 844, 13.28, 33.56, 30.34, 83.1, 2.198, 138.8, 32.37, 32.37, 3807, NULL),
('2016-12-02 02:39:02', 845, 13.29, 34.15, 30.14, 89.7, 2.18, 190.2, 32.19, 32.19, 9346, NULL),
('2016-12-02 02:44:01', 846, 13.28, 33.63, 29.72, 85.6, 1.697, 147.3, 30.59, 30.59, 13393, NULL),
('2016-12-02 02:49:01', 847, 13.27, 33.98, 30.77, 82.9, 2.288, 161.3, 32.71, 32.71, 14354, NULL),
('2016-12-02 02:54:01', 848, 13.28, 34.42, 30.49, 84.7, 2.142, 161.4, 32.58, 32.58, 13636, NULL),
('2016-12-02 02:59:02', 849, 13.28, 34.43, 30.65, 83.6, 1.952, 170.4, 32.33, 32.33, 13333, NULL),
('2016-12-02 03:04:01', 850, 13.29, 34.71, 30.84, 80.8, 2.393, 178.2, 32.59, 32.59, 20134, NULL),
('2016-12-02 03:09:02', 851, 13.29, 34.79, 30.74, 80.6, 1.743, 113.4, 32.36, 32.36, 16043, NULL),
('2016-12-02 03:14:01', 852, 13.29, 35.06, 31.24, 77.45, 1.715, 182.7, 33.39, 33.39, 18072, NULL),
('2016-12-02 03:19:01', 853, 13.29, 34.91, 30.59, 85.3, 1.474, 175.1, 32.17, 32.17, 15707, NULL),
('2016-12-02 03:24:02', 854, 13.29, 34.51, 31.25, 82.8, 0.748, 196.3, 31.96, 31.96, 18405, NULL),
('2016-12-02 03:29:01', 855, 13.29, 35.31, 31.92, 79.56, 1.662, 165.5, 33.72, 33.72, 19481, NULL),
('2016-12-02 03:34:01', 856, 13.29, 36.58, 32.38, 72.61, 1.765, 124.3, 35.04, 35.04, 20833, NULL),
('2016-12-02 03:39:02', 857, 13.29, 38.21, 32.71, 78.56, 2.095, 136.3, 37.41, 37.41, 22222, NULL),
('2016-12-02 03:44:02', 858, 13.29, 38.61, 31.96, 79, 2.535, 133.8, 35.29, 35.29, 16043, NULL),
('2016-12-02 03:49:01', 859, 13.29, 38.28, 32.02, 79.46, 2.075, 102.4, 34.56, 34.56, 15464, NULL),
('2016-12-02 03:54:01', 860, 13.29, 37.67, 31.77, 81.2, 2.151, 111.5, 33.04, 33.04, 15957, NULL),
('2016-12-02 03:59:01', 861, 13.28, 36.48, 31.35, 80.9, 1.668, 102.2, 31.79, 31.79, 15625, NULL),
('2016-12-02 04:04:01', 862, 13.28, 35.94, 31.22, 83.6, 1.925, 144.8, 31.73, 31.73, 16129, NULL),
('2016-12-02 04:09:01', 863, 13.28, 35.07, 29.88, 93.5, 3.715, 117.6, 30.62, 30.62, 2545, NULL),
('2016-12-02 04:14:02', 864, 13.28, 33.24, 28.02, 92.9, 2.762, 149.9, 27.73, 27.73, 10381, NULL),
('2016-12-02 04:19:01', 865, 13.28, 32.28, 27.77, 95.2, 3.052, 147.3, 27.44, 27.44, 6466, NULL),
('2016-12-02 04:24:01', 866, 13.28, 31.44, 28.02, 96.3, 1.742, 183.4, 27.61, 27.61, 8333, NULL),
('2016-12-02 04:29:02', 867, 13.27, 31.06, 28.68, 93.4, 1.917, 133.7, 28.32, 28.32, 9375, NULL),
('2016-12-02 04:34:01', 868, 13.28, 31.06, 29.3, 90, 2.45, 120.6, 29.02, 29.02, 10204, NULL),
('2016-12-02 04:39:01', 869, 13.28, 31.65, 29.73, 90.1, 2.167, 71.94, 29.64, 29.64, 10274, NULL),
('2016-12-02 04:44:02', 870, 13.28, 32.52, 30.29, 83.7, 2.434, 140.8, 30.7, 30.7, 13100, NULL),
('2016-12-02 04:49:01', 871, 13.29, 33.87, 30.96, 83.1, 2.422, 107.3, 32.56, 32.56, 13575, NULL),
('2016-12-02 04:54:01', 872, 13.29, 34.56, 30.54, 84.3, 2.763, 131.5, 32.15, 32.15, 13514, NULL),
('2016-12-02 04:59:01', 873, 13.29, 34, 30.03, 85.3, 2.785, 126.2, 31.08, 31.08, 12987, NULL),
('2016-12-02 05:04:02', 874, 13.29, 33.42, 29.78, 86.1, 2.7, 162.1, 30.49, 30.49, 12658, NULL),
('2016-12-02 05:09:01', 875, 13.28, 32.97, 29.53, 88, 2.074, 128.8, 30.23, 30.23, 11236, NULL),
('2016-12-02 05:14:01', 876, 13.28, 32.61, 29.35, 89.1, 1.998, 153.7, 30, 30, 12712, NULL),
('2016-12-02 05:19:01', 877, 13.28, 32.34, 29.43, 89.4, 2.261, 162.1, 29.97, 29.97, 14151, NULL),
('2016-12-02 05:24:01', 878, 13.28, 32.14, 29.34, 91, 2.158, 134.1, 29.88, 29.88, 12397, NULL),
('2016-12-02 05:29:01', 879, 13.28, 31.96, 29.22, 91, 2.103, 165.2, 29.71, 29.71, 11905, NULL),
('2016-12-02 05:34:01', 880, 13.28, 31.76, 29.21, 90.8, 1.915, 172, 29.61, 29.61, 11628, NULL),
('2016-12-02 05:39:01', 881, 13.28, 31.59, 29.12, 92.2, 1.56, 146, 29.47, 29.47, 10714, NULL),
('2016-12-02 05:44:01', 882, 13.28, 31.32, 28.94, 93.2, 1.447, 136.8, 29.11, 29.11, 9740, NULL),
('2016-12-02 05:49:02', 883, 13.28, 31.01, 28.87, 93.3, 1.456, 162.7, 28.82, 28.82, 10000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tis_meteorological_fault`
--

CREATE TABLE `tis_meteorological_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `Sensor` varchar(11) DEFAULT NULL,
  `LastUpdated` datetime NOT NULL,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_meteorological_fault`
--

INSERT INTO `tis_meteorological_fault` (`SystemCodeNumber`, `Sensor`, `LastUpdated`, `online`, `time`) VALUES
('MET-001', NULL, '2016-09-05 04:30:08', 0, 44),
('MET-001', NULL, '2016-09-05 05:15:15', 1, 45),
('MET-001', NULL, '2016-09-05 05:30:28', 0, 15),
('MET-001', NULL, '2016-09-05 06:30:15', 1, 59),
('MET-001', NULL, '2016-09-05 06:45:08', 0, 14),
('MET-001', NULL, '2016-09-05 07:15:15', 1, 30),
('MET-001', NULL, '2016-09-05 07:30:08', 0, 14),
('MET-001', NULL, '2016-09-05 09:00:15', 1, 90),
('MET-001', NULL, '2016-09-05 09:15:08', 0, 14),
('MET-001', NULL, '2016-09-05 10:00:15', 1, 45),
('MET-001', NULL, '2016-09-05 10:45:08', 0, 44),
('MET-001', NULL, '2016-09-05 11:00:15', 1, 15),
('MET-001', NULL, '2016-09-05 12:15:08', 0, 74),
('MET-001', NULL, '2016-09-05 12:45:15', 1, 30),
('MET-001', NULL, '2016-09-05 13:15:07', 0, 29),
('MET-001', NULL, '2016-09-05 18:30:15', 1, 315),
('MET-001', NULL, '2016-09-05 18:45:08', 0, 14),
('MET-001', NULL, '2016-09-05 20:00:15', 1, 75),
('MET-001', NULL, '2016-09-05 20:15:08', 0, 14),
('MET-001', NULL, '2016-09-06 00:30:15', 1, 255),
('MET-001', NULL, '2016-09-06 00:45:08', 0, 14),
('MET-001', NULL, '2016-09-06 04:00:15', 1, 195),
('MET-001', NULL, '2016-09-06 04:15:08', 0, 14),
('MET-001', NULL, '2016-09-06 07:45:15', 1, 210),
('MET-001', NULL, '2016-09-06 08:15:08', 0, 29),
('MET-001', NULL, '2016-09-06 08:45:15', 1, 30),
('MET-001', NULL, '2016-09-06 09:15:08', 0, 29),
('MET-001', NULL, '2016-09-06 13:15:15', 1, 240),
('MET-001', NULL, '2016-09-06 14:30:08', 0, 74),
('MET-001', NULL, '2016-09-06 14:45:15', 1, 15),
('MET-001', NULL, '2016-09-06 15:30:08', 0, 44),
('MET-001', NULL, '2016-09-06 15:45:15', 1, 15),
('MET-001', NULL, '2016-09-06 16:15:08', 0, 29),
('MET-001', NULL, '2016-09-06 16:30:15', 1, 15),
('MET-001', NULL, '2016-09-06 16:45:08', 0, 14),
('MET-001', NULL, '2016-09-06 18:00:15', 1, 75),
('MET-001', NULL, '2016-09-06 20:30:08', 0, 149),
('MET-001', NULL, '2016-09-07 03:00:14', 1, 390),
('MET-001', NULL, '2016-09-07 03:30:08', 0, 29),
('MET-001', NULL, '2016-09-07 05:45:15', 1, 135),
('MET-001', NULL, '2016-09-07 11:00:08', 0, 314),
('MET-001', NULL, '2016-09-07 13:15:25', 1, 135),
('MET-001', NULL, '2016-09-07 14:00:08', 0, 44),
('MET-001', NULL, '2016-09-07 16:45:15', 1, 165),
('MET-001', NULL, '2016-09-07 17:15:08', 0, 29),
('MET-001', NULL, '2016-09-07 19:00:15', 1, 105),
('MET-001', NULL, '2016-09-07 19:15:17', 0, 15),
('MET-001', NULL, '2016-09-07 20:30:14', 1, 74),
('MET-001', NULL, '2016-09-07 21:00:08', 0, 29),
('MET-001', NULL, '2016-09-07 22:15:15', 1, 75),
('MET-001', NULL, '2016-09-07 22:30:08', 0, 14),
('MET-001', NULL, '2016-09-08 01:30:15', 1, 180),
('MET-001', NULL, '2016-09-08 01:45:08', 0, 14),
('MET-001', NULL, '2016-09-08 03:15:15', 1, 90),
('MET-001', NULL, '2016-09-08 03:30:08', 0, 14),
('MET-001', NULL, '2016-09-08 03:45:15', 1, 15),
('MET-001', NULL, '2016-09-08 04:30:08', 0, 44),
('MET-001', NULL, '2016-09-08 05:45:14', 1, 75),
('MET-001', NULL, '2016-09-08 06:45:08', 0, 59),
('MET-001', NULL, '2016-09-08 07:00:15', 1, 15),
('MET-001', NULL, '2016-09-08 07:15:08', 0, 14),
('MET-001', NULL, '2016-09-08 08:00:15', 1, 45),
('MET-001', NULL, '2016-09-08 08:15:08', 0, 14),
('MET-001', NULL, '2016-09-08 09:15:15', 1, 60),
('MET-001', NULL, '2016-09-08 09:30:08', 0, 14),
('MET-001', NULL, '2016-09-08 10:00:15', 1, 30),
('MET-001', NULL, '2016-09-08 10:30:08', 0, 29),
('MET-001', NULL, '2016-09-08 10:45:15', 1, 15),
('MET-001', NULL, '2016-09-08 11:15:08', 0, 29),
('MET-001', NULL, '2016-09-08 12:45:15', 1, 90),
('MET-001', NULL, '2016-09-20 13:45:10', 0, 17339),
('MET-001', NULL, '2016-09-21 13:00:08', 1, 1394),
('MET-001', NULL, '2016-09-25 12:15:11', 0, 5715),
('MET-001', NULL, '2016-09-25 16:15:18', 1, 240),
('MET-001', NULL, '2016-09-25 18:15:11', 0, 119),
('MET-001', NULL, '2016-09-25 18:30:18', 1, 15),
('MET-001', NULL, '2016-09-25 20:30:11', 0, 119),
('MET-001', NULL, '2016-09-25 20:45:17', 1, 15),
('MET-001', NULL, '2016-09-25 21:00:10', 0, 14),
('MET-001', NULL, '2016-09-25 21:15:18', 1, 15),
('MET-001', NULL, '2016-09-25 21:30:11', 0, 14),
('MET-001', NULL, '2016-09-25 22:00:18', 1, 30),
('MET-001', NULL, '2016-09-25 22:30:11', 0, 29),
('MET-001', NULL, '2016-09-25 23:30:18', 1, 60),
('MET-001', NULL, '2016-09-25 23:45:10', 0, 14),
('MET-001', NULL, '2016-09-26 00:30:18', 1, 45),
('MET-001', NULL, '2016-09-26 00:45:11', 0, 14),
('MET-001', NULL, '2016-09-26 01:15:17', 1, 30),
('MET-001', NULL, '2016-09-26 02:00:11', 0, 44),
('MET-001', NULL, '2016-09-26 02:15:18', 1, 15),
('MET-001', NULL, '2016-09-26 02:45:11', 0, 29),
('MET-001', NULL, '2016-09-26 03:15:18', 1, 30),
('MET-001', NULL, '2016-09-26 03:30:10', 0, 14),
('MET-001', NULL, '2016-09-26 04:45:18', 1, 75),
('MET-001', NULL, '2016-09-26 05:15:10', 0, 29),
('MET-001', NULL, '2016-09-26 05:30:18', 1, 15),
('MET-001', NULL, '2016-09-26 07:15:11', 0, 104),
('MET-001', NULL, '2016-09-26 07:30:17', 1, 15),
('MET-001', NULL, '2016-10-27 11:15:14', 0, 44864),
('MET-001', NULL, '2016-10-27 13:15:10', 1, 119);

-- --------------------------------------------------------

--
-- Table structure for table `tis_traffic_signal_fault`
--

CREATE TABLE `tis_traffic_signal_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_traffic_signal_fault`
--

INSERT INTO `tis_traffic_signal_fault` (`SystemCodeNumber`, `LastUpdated`, `online`, `time`) VALUES
('SIG001', '2016-10-04 00:00:00', 1, 10),
('SIG002', '2016-10-04 00:00:00', 1, 10),
('SIG004', '2016-10-04 00:00:00', 1, 10),
('SIG002', '2016-10-04 00:00:00', 1, 10),
('SIG004', '2016-10-04 00:00:00', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tis_vehicle_setup`
--

CREATE TABLE `tis_vehicle_setup` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `VehicleType` text NOT NULL,
  `Northing` text NOT NULL,
  `Easting` text NOT NULL,
  `Updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_vehicle_setup`
--

INSERT INTO `tis_vehicle_setup` (`id`, `name`, `VehicleType`, `Northing`, `Easting`, `Updated_time`) VALUES
(7, 'A001', 'Ambulance', '24.545 ', '88.036', '2016-12-29 10:32:00'),
(8, 'PU001', 'Patrol Unit', '24.217', '88.191', '2016-12-29 10:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `tis_vms_fault`
--

CREATE TABLE `tis_vms_fault` (
  `SystemCodeNumber` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `online` tinyint(1) NOT NULL,
  `time` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tis_vms_fault`
--

INSERT INTO `tis_vms_fault` (`SystemCodeNumber`, `LastUpdated`, `online`, `time`) VALUES
('VMS-002', '2016-07-07 07:30:05', 0, 3285),
('VMS-004', '2016-07-07 07:45:08', 0, 3300),
('VMS-004', '2016-07-07 08:00:05', 1, 14),
('VMS-002', '2016-07-07 14:45:02', 1, 434),
('VMS-002', '2016-07-28 15:30:05', 0, 30285),
('VMS-001', '2016-07-28 19:45:04', 0, 34260),
('VMS-001', '2016-07-28 20:45:02', 1, 59),
('VMS-002', '2016-07-29 01:15:02', 1, 584),
('VMS-004', '2016-08-03 11:00:05', 0, 39060),
('VMS-004', '2016-08-03 11:15:02', 1, 14),
('VMS-003', '2016-08-11 03:45:05', 0, 53460),
('VMS-004', '2016-08-11 03:45:17', 0, 11070),
('VMS-003', '2016-08-11 05:45:04', 1, 119),
('VMS-004', '2016-08-11 06:15:02', 1, 149),
('VMS-003', '2016-08-11 06:45:05', 0, 60),
('VMS-004', '2016-08-11 06:45:17', 0, 30),
('VMS-003', '2016-08-11 07:00:03', 1, 14),
('VMS-004', '2016-08-11 07:00:11', 1, 14),
('VMS-003', '2016-08-11 07:30:04', 0, 30),
('VMS-004', '2016-08-11 07:30:17', 0, 30),
('VMS-003', '2016-08-11 08:15:02', 1, 44),
('VMS-004', '2016-08-11 08:15:11', 1, 44),
('VMS-003', '2016-08-11 09:00:05', 0, 45),
('VMS-004', '2016-08-11 09:00:16', 0, 45),
('VMS-003', '2016-08-11 15:15:01', 1, 374),
('VMS-004', '2016-08-11 15:15:13', 1, 374),
('VMS-003', '2016-08-12 14:00:05', 0, 1365),
('VMS-004', '2016-08-12 14:00:16', 0, 1365),
('VMS-003', '2016-08-12 14:30:02', 1, 29),
('VMS-004', '2016-08-12 14:30:12', 1, 29),
('VMS-003', '2016-08-12 15:00:05', 0, 30),
('VMS-004', '2016-08-12 15:00:17', 0, 30),
('VMS-003', '2016-08-12 15:15:02', 1, 14),
('VMS-004', '2016-08-12 15:15:11', 1, 14),
('VMS-003', '2016-08-13 18:15:05', 0, 1620),
('VMS-004', '2016-08-13 18:15:17', 0, 1620),
('VMS-003', '2016-08-13 19:00:03', 1, 44),
('VMS-003', '2016-08-13 19:30:04', 0, 30),
('VMS-004', '2016-08-14 00:15:15', 1, 359),
('VMS-004', '2016-08-14 01:00:08', 0, 44),
('VMS-004', '2016-08-14 01:30:15', 1, 30),
('VMS-003', '2016-08-14 01:45:03', 1, 374),
('VMS-003', '2016-08-14 02:15:05', 0, 30),
('VMS-004', '2016-08-14 02:15:16', 0, 45),
('VMS-003', '2016-08-14 08:45:02', 1, 389),
('VMS-004', '2016-08-14 09:00:13', 1, 404),
('VMS-003', '2016-08-15 18:15:05', 0, 2010),
('VMS-004', '2016-08-15 18:15:17', 0, 1995),
('VMS-003', '2016-08-15 19:30:12', 1, 75),
('VMS-004', '2016-08-15 19:30:32', 1, 75),
('VMS-003', '2016-08-16 06:15:05', 0, 644),
('VMS-004', '2016-08-16 06:15:17', 0, 644),
('VMS-003', '2016-08-18 14:45:02', 1, 3389),
('VMS-004', '2016-08-18 14:45:11', 1, 3389),
('VMS-002', '2016-08-25 21:30:05', 0, 40095),
('VMS-001', '2016-08-26 04:45:05', 0, 40800),
('VMS-001', '2016-08-26 05:00:01', 1, 14),
('VMS-001', '2016-09-01 07:15:05', 0, 8775),
('VMS-001', '2016-09-01 07:30:02', 1, 14),
('VMS-001', '2016-09-02 02:45:04', 0, 1155),
('VMS-001', '2016-09-02 06:45:02', 1, 239),
('VMS-004', '2016-09-09 01:00:08', 0, 30854),
('VMS-003', '2016-09-19 10:30:08', 0, 45825),
('VMS-003', '2016-09-19 10:45:05', 1, 14),
('VMS-002', '2016-09-21 14:45:02', 1, 38474),
('VMS-004', '2016-09-21 14:45:02', 1, 18104),
('VMS-002', '2016-09-21 15:15:08', 0, 30),
('VMS-004', '2016-09-21 15:15:22', 0, 30),
('VMS-002', '2016-09-27 01:30:01', 1, 7814),
('VMS-001', '2016-10-07 12:00:05', 0, 50715),
('VMS-002', '2016-10-14 09:30:07', 0, 24960),
('VMS-002', '2016-10-15 02:15:05', 1, 1004),
('VMS-002', '2016-10-15 07:30:08', 0, 315),
('VMS-002', '2016-10-15 11:45:05', 1, 254),
('VMS-003', '2016-10-16 13:00:07', 0, 39015),
('VMS-002', '2016-10-18 07:30:08', 0, 4065),
('VMS-002', '2016-10-18 09:00:04', 1, 89),
('VMS-002', '2016-10-27 02:45:07', 0, 12585),
('VMS-002', '2016-10-27 08:00:05', 1, 314),
('VMS-002', '2016-11-02 06:30:07', 0, 8550),
('VMS-002', '2016-11-03 08:30:04', 1, 1559),
('VMS-002', '2016-11-13 15:45:08', 0, 14835),
('VMS-002', '2016-11-16 16:45:05', 1, 4379),
('VMS-002', '2016-11-17 16:00:08', 0, 1395);

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `password`, `user`, `email`, `created`, `modified`) VALUES
(1, 'Admin', 'b984751a1fd6babd924e602a6f943867dec952ac7b51ff926ea9cd67cf60e7a6', 'Parag Raipuria', 'parag.raipuria@itspe.co.in', '2015-12-27', '2015-12-27'),
(43, 'parag_raipuria', '4c9da2df', 'parag_raipuria', 'parag.raipuria@itspe.co.in', '2016-01-12', '0000-00-00'),
(47, 'viswajeet', '95b48109e40c02b42b538be850c6dbe8e1b4d3ee05dd545e2e2fcc901775e7cd', 'viswajeet', 'parag.raipuria@itspe.co.in', '2016-01-25', '0000-00-00'),
(48, 'htmsadmin', '84385d33174f777309f405104d7a7868faa21638e37f3d9001be6cb994af1b14', 'htmsadmin', 'parag.raipuria@itspe.co.in', '2016-01-25', '0000-00-00'),
(49, 'test', '8387648a89efcf448a979a2a21cbfb5d7d41cf68cc9daf073ebe882d867283c3', 'test', 'parag.raipuria@itspe.co.in', '2016-01-25', '0000-00-00'),
(50, 'jaspal singh ', 'faec801c18f6cb54ae01c6690d774c409979a3cf7327100c3be4872164bfcbd9', 'jaspal singh', 'parag.raipuria@itspe.co.in', '2016-01-26', '0000-00-00'),
(51, 'htmsoperator', 'ace8aa397e210d2e0028f307eed236b2dcbb7ece263a60e0a36399e24eac4e0d', 'htmsoperator', 'parag.raipuria@itspe.co.in', '2016-02-22', '0000-00-00'),
(52, 'Kannan.P', '24850efe2f8a854db7c2c1ee46c76043c2b5fc32e4b5be8bd5530a4419cab92d', 'Kannan.P', 'parag.raipuria@itspe.co.in', '2016-03-29', '0000-00-00'),
(53, 'pkannan', '1ddcfe784ca60d33e841d1c9f8ce31a7b569dfcfe0804b470c08d2e914807481', 'pkannan', 'parag.raipuria@itspe.co.in', '2016-04-07', '0000-00-00'),
(54, 'vishwajeet', 'fc92696ec3a0c13aa3108f5191cd9f6008feb25c63a81cceda7a3c38ed06369f', 'vishwajeet', 'parag.raipuria@itspe.co.in', '2016-04-07', '0000-00-00'),
(55, 'jschadha', '0f183cc73b8171fc9ddf06a35b04c707843fc4cdeceb7ac88db30a33dd295017', 'jschadha', 'parag.raipuria@itspe.co.in', '2016-04-07', '0000-00-00'),
(56, 'Manager', 'ae203a9b9916052d54a44ff4ae2ae607faeff311fd63f1d43c687f8f567b46b7', 'Manager', 'parag.raipuria@itspe.co.in', '2016-04-07', '0000-00-00'),
(57, 'Onkarb', '4499907c267e0edeb10f63d21eae0e50a21b0e3a2eb5093e3e12dabf6d47c115', 'Onkar Bhange', 'parag.raipuria@itspe.co.in', '2016-04-20', '0000-00-00'),
(58, 'vivek.bhardwaj', '190e0112792ae73efbedc38bf6bfa2120a7702ad9a32f4f2957eb4e1b5c3fd43', 'vivek bhardwaj', 'parag.raipuria@itspe.co.in', '2016-04-28', '0000-00-00'),
(59, 'david.bantu', '06b483ad1f5d4bcf3ec6751400a558f443e1a05d378836826926b79410accdd9', 'david', 'parag.raipuria@itspe.co.in', '2016-04-30', '0000-00-00'),
(60, 'Lalit', '120b57b6f2ca9aed5edb1989ccd732a8bd5747e25a5684ed7bf6022d587d3b31', 'lalit', 'parag.raipuria@itspe.co.in', '2016-05-27', '0000-00-00'),
(61, 'David', 'a17136704a9cfb16804026a841ac88cb1cf3bbba0109737056f5e9687bc78863', 'David', 'parag.raipuria@itspe.co.in', '2016-05-27', '0000-00-00'),
(62, 'Dwip ', 'e838997d853eb2954cbba8bfd286cd22f1a5f3d742f89b0b7c838c89a8a1a724', 'Dwip', 'parag.raipuria@itspe.co.in', '2016-05-27', '0000-00-00'),
(63, 'parag.raipuria', 'bf0045036aea9f6ed6df2adc734a6449199c15f0546a9ce992e40e4031458a69', 'Parag Raipuria', 'parag.raipuria@itspe.co.in', '2016-05-27', '0000-00-00'),
(64, 'hemanshukhatri123', '6a8b7d4ae15befd51de852da1b3deb7ee8cacaa026076fed1d0c2e7d2563bfe8', 'hemanshu Khatri', 'parag.raipuria@itspe.co.in', '2016-06-18', '0000-00-00'),
(66, 'gmr', 'b984751a1fd6babd924e602a6f943867dec952ac7b51ff926ea9cd67cf60e7a6', 'gmr', 'parag2306@gmail.com', '2016-09-20', '0000-00-00'),
(67, 'chetak', 'cf03fca42a34d341becfe2ce5c38db8880e2632999ce92a14686f51eae9f5715', 'chetak', 'parag.raipuria@itspe.co.in', '2016-11-07', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_logout`
--

CREATE TABLE `user_login_logout` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` text NOT NULL,
  `action` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_logout`
--

INSERT INTO `user_login_logout` (`id`, `username`, `action`, `time`) VALUES
(1, 'Parag Raipuria', 'login', '2016-12-15 14:51:35'),
(2, 'Parag Raipuria', 'login', '2016-12-16 04:17:25'),
(3, '\nParag Raipuria', 'logout', '2016-12-16 06:53:01'),
(4, 'Parag Raipuria', 'login', '2016-12-16 06:54:01'),
(5, 'Parag Raipuria', 'login', '2016-12-16 08:20:42'),
(6, '', 'login', '2016-12-16 10:10:07'),
(7, 'Parag Raipuria', 'login', '2016-12-16 10:10:11'),
(8, 'Parag Raipuria', 'login', '2016-12-19 05:15:56'),
(9, 'Parag Raipuria', 'login', '2016-12-19 06:58:39'),
(10, '', 'login', '2016-12-19 11:15:48'),
(11, 'Parag Raipuria', 'login', '2016-12-19 11:15:55'),
(12, 'Parag Raipuria', 'login', '2016-12-20 04:54:12'),
(13, 'Parag Raipuria', 'login', '2016-12-20 05:02:03'),
(14, 'Parag Raipuria', 'login', '2016-12-20 06:47:07'),
(15, 'Parag Raipuria', 'login', '2016-12-20 09:58:01'),
(16, 'Parag Raipuria', 'login', '2016-12-21 05:35:01'),
(17, 'Parag Raipuria', 'login', '2016-12-21 09:49:20'),
(18, 'Parag Raipuria', 'login', '2016-12-22 08:28:06'),
(19, 'Parag Raipuria', 'login', '2016-12-23 04:43:37'),
(20, 'Parag Raipuria', 'login', '2016-12-23 05:05:01'),
(21, 'Parag Raipuria', 'login', '2016-12-23 06:12:50'),
(22, 'Parag Raipuria', 'login', '2016-12-23 07:01:50'),
(23, 'Parag Raipuria', 'login', '2016-12-23 07:40:06'),
(24, 'Parag Raipuria', 'login', '2016-12-23 08:57:54'),
(25, 'Parag Raipuria', 'login', '2016-12-23 10:17:15'),
(26, '\nParag Raipuria', 'logout', '2016-12-23 10:28:48'),
(27, '\n', 'logout', '2016-12-23 10:28:55'),
(28, 'Parag Raipuria', 'login', '2016-12-23 10:53:32'),
(29, 'Parag Raipuria', 'login', '2016-12-28 05:07:02'),
(30, 'Parag Raipuria', 'login', '2016-12-28 10:19:28'),
(31, 'Parag Raipuria', 'login', '2016-12-28 10:23:23'),
(32, 'Parag Raipuria', 'login', '2016-12-29 04:22:26'),
(33, 'Parag Raipuria', 'login', '2016-12-29 05:39:21'),
(34, 'Parag Raipuria', 'login', '2016-12-29 05:50:16'),
(35, '\nParag Raipuria', 'logout', '2016-12-29 05:51:20'),
(36, 'Parag Raipuria', 'login', '2016-12-29 06:24:26'),
(37, 'Parag Raipuria', 'login', '2016-12-29 07:21:26'),
(38, 'Parag Raipuria', 'login', '2016-12-29 07:26:54'),
(39, 'Parag Raipuria', 'login', '2016-12-29 07:48:20'),
(40, 'Parag Raipuria', 'login', '2016-12-29 10:22:14'),
(41, 'Parag Raipuria', 'login', '2016-12-29 10:23:59'),
(42, 'Parag Raipuria', 'login', '2016-12-29 12:09:39'),
(43, '\n', 'logout', '2016-12-29 13:02:44'),
(44, 'Parag Raipuria', 'login', '2016-12-29 13:07:14'),
(45, '', 'login', '2016-12-30 06:08:28'),
(46, 'Parag Raipuria', 'login', '2016-12-30 06:08:34'),
(47, 'Parag Raipuria', 'login', '2016-12-30 06:11:07'),
(48, 'Parag Raipuria', 'login', '2016-12-30 10:06:44'),
(49, '\nParag Raipuria', 'logout', '2016-12-30 10:06:49'),
(50, 'Parag Raipuria', 'login', '2016-12-30 15:08:57'),
(51, 'Parag Raipuria', 'login', '2017-01-02 11:08:10'),
(52, '\r\nParag Raipuria', 'logout', '2017-01-02 11:13:05'),
(53, 'Parag Raipuria', 'login', '2017-01-02 11:13:24'),
(54, '\r\nParag Raipuria', 'logout', '2017-01-02 11:36:26'),
(55, 'Parag Raipuria', 'login', '2017-01-02 11:37:54'),
(56, '\r\nParag Raipuria', 'logout', '2017-01-02 12:10:06'),
(57, 'Parag Raipuria', 'login', '2017-01-02 12:16:53'),
(58, '\r\nParag Raipuria', 'logout', '2017-01-02 13:02:09'),
(59, 'Parag Raipuria', 'login', '2017-01-03 12:37:20'),
(60, '', 'login', '2017-01-06 09:51:19'),
(61, 'Parag Raipuria', 'login', '2017-01-06 09:51:27'),
(62, 'Parag Raipuria', 'login', '2017-01-06 10:49:24'),
(63, '', 'login', '2017-01-06 10:49:44'),
(64, '', 'login', '2017-01-06 10:50:23'),
(65, 'Parag Raipuria', 'login', '2017-01-06 13:55:00'),
(66, '\r\nParag Raipuria', 'logout', '2017-01-06 14:27:15'),
(67, 'Parag Raipuria', 'login', '2017-01-09 06:51:24'),
(68, 'Parag Raipuria', 'login', '2017-01-09 07:11:18'),
(69, '\r\nParag Raipuria', 'logout', '2017-01-09 09:00:05'),
(70, 'Parag Raipuria', 'login', '2017-01-10 09:57:58'),
(71, '\r\nParag Raipuria', 'logout', '2017-01-10 10:22:11'),
(72, 'Parag Raipuria', 'login', '2017-01-12 07:15:53'),
(73, 'Parag Raipuria', 'login', '2017-01-12 08:05:51'),
(74, 'Parag Raipuria', 'login', '2017-01-12 09:39:52'),
(75, '\r\nParag Raipuria', 'logout', '2017-01-12 09:54:24'),
(76, 'Parag Raipuria', 'login', '2017-01-13 10:15:46'),
(77, 'Parag Raipuria', 'login', '2017-01-13 10:15:50'),
(78, 'Parag Raipuria', 'login', '2017-01-13 10:16:14'),
(79, 'Parag Raipuria', 'login', '2017-01-13 10:18:03'),
(80, 'Parag Raipuria', 'login', '2017-01-13 10:19:31'),
(81, '\r\nParag Raipuria', 'logout', '2017-01-13 10:20:26'),
(82, 'Parag Raipuria', 'login', '2017-01-13 10:22:19'),
(83, '\r\nParag Raipuria', 'logout', '2017-01-13 10:50:53'),
(84, 'Parag Raipuria', 'login', '2017-01-13 10:50:54'),
(85, '\r\nParag Raipuria', 'logout', '2017-01-13 10:59:29'),
(86, 'Parag Raipuria', 'login', '2017-01-13 10:59:46'),
(87, 'Parag Raipuria', 'login', '2017-01-13 11:02:09'),
(88, 'Parag Raipuria', 'login', '2017-01-13 11:17:36'),
(89, 'Parag Raipuria', 'login', '2017-01-13 11:17:55'),
(90, '\r\nParag Raipuria', 'logout', '2017-01-13 11:39:50'),
(91, 'Parag Raipuria', 'login', '2017-01-13 11:50:59'),
(92, '\r\nParag Raipuria', 'logout', '2017-01-13 11:51:35'),
(93, 'Parag Raipuria', 'login', '2017-01-13 11:54:00'),
(94, '\r\nParag Raipuria', 'logout', '2017-01-13 11:54:03'),
(95, 'Parag Raipuria', 'login', '2017-01-13 11:55:13'),
(96, '\r\nParag Raipuria', 'logout', '2017-01-13 11:55:25'),
(97, 'Parag Raipuria', 'login', '2017-01-13 12:05:43'),
(98, '\r\nParag Raipuria', 'logout', '2017-01-13 12:12:36'),
(99, 'Parag Raipuria', 'login', '2017-01-13 12:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_accident_relation`
--

CREATE TABLE `utmc_accident_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `SystemCodeNumber` text NOT NULL,
  `Type` text NOT NULL,
  `Action` text NOT NULL,
  `Checklist_type` text NOT NULL,
  `Checklist_extra` text NOT NULL,
  `Informed` text NOT NULL,
  `Informed_time` text NOT NULL,
  `Arrived` text,
  `Arrived_time` text NOT NULL,
  `Resolved` text,
  `Resolved_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_accident_relation`
--

INSERT INTO `utmc_accident_relation` (`id`, `SystemCodeNumber`, `Type`, `Action`, `Checklist_type`, `Checklist_extra`, `Informed`, `Informed_time`, `Arrived`, `Arrived_time`, `Resolved`, `Resolved_time`) VALUES
(1, '1234', 'accident', 'Vehicle Emergency', 'Camera', '', 'true', '2016-12-23 10:22:35', 'false', '', 'false', ''),
(2, '1234', 'accident', 'Vehicle Emergency', 'VMS', '', 'true', '2016-12-23 10:22:35', 'false', '', 'false', ''),
(3, '1234', 'accident', 'Vehicle Emergency', 'Ambulance', '', 'true', '2016-12-23 10:23:08', 'true', '2016-12-23 11:48:11', 'false', ''),
(4, 'A001', 'accident', 'Vehicle Emergency', 'Camera', '', 'true', '2016-12-28 15:56:42', 'false', '', 'false', ''),
(5, 'A001', 'accident', 'Vehicle Emergency', 'VMS', '', 'true', '2016-12-28 15:56:42', 'false', '', 'false', ''),
(6, 'A001', 'accident', 'Vehicle Emergency', 'Ambulance', '', 'true', '2016-12-28 15:56:42', 'false', '', 'false', ''),
(7, 'A02', 'accident', 'Vehicle Emergency', 'Camera', '', 'false', '2016-12-29 17:40:53', 'false', '', 'false', ''),
(8, 'A02', 'accident', 'Vehicle Emergency', 'VMS', '', 'false', '2016-12-29 17:40:53', 'false', '', 'false', ''),
(9, 'A02', 'accident', 'Vehicle Emergency', 'Ambulance', '', 'false', '2016-12-29 17:40:53', 'false', '', 'false', ''),
(10, 'A0101', 'accident', 'Vehicle Emergency', 'Camera', '', 'true', '2017-01-02 12:09:17', 'false', '', 'false', ''),
(11, 'A0101', 'accident', 'Vehicle Emergency', 'VMS', '', 'true', '2017-01-02 12:09:17', 'false', '', 'false', ''),
(12, 'A0101', 'accident', 'Vehicle Emergency', 'Ambulance', '', 'true', '2017-01-02 12:09:17', 'false', '', 'false', '');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_accident_static`
--

CREATE TABLE `utmc_accident_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `Name` char(32) DEFAULT NULL,
  `ShortDescription` char(32) DEFAULT NULL,
  `LongDescription` text,
  `DataSourceTypeID` int(11) DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `NetworkLinkReference` char(32) DEFAULT NULL,
  `TransportLinkReference` char(32) DEFAULT NULL,
  `Action` text NOT NULL,
  `Type` text NOT NULL,
  `TypeID` text NOT NULL,
  `LinkDistance` double DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementID` int(11) DEFAULT NULL,
  `LocationDesc` text,
  `AccidentTime` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `ZoneAffected` char(32) DEFAULT NULL,
  `LanesAffected` int(11) DEFAULT NULL,
  `DiversionInForce` char(1) DEFAULT NULL,
  `DiversionRoute` char(32) DEFAULT NULL,
  `ReportedBy` varchar(255) DEFAULT NULL,
  `ConfirmedBy` varchar(255) DEFAULT NULL,
  `ConfirmedDate` datetime DEFAULT NULL,
  `Phase` char(32) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `ModifiedBy` varchar(255) DEFAULT NULL,
  `StatisticsDate` datetime DEFAULT NULL,
  `VehicleCount` int(11) DEFAULT NULL,
  `LightConditions` char(32) DEFAULT NULL,
  `RoadConditions` char(32) DEFAULT NULL,
  `WeatherConditions` char(32) DEFAULT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_accident_static`
--

INSERT INTO `utmc_accident_static` (`SystemCodeNumber`, `Name`, `ShortDescription`, `LongDescription`, `DataSourceTypeID`, `Northing`, `Easting`, `NetworkLinkReference`, `TransportLinkReference`, `Action`, `Type`, `TypeID`, `LinkDistance`, `CreationDate`, `DeletionDate`, `QualityStatementID`, `LocationDesc`, `AccidentTime`, `EndDate`, `Severity`, `ZoneAffected`, `LanesAffected`, `DiversionInForce`, `DiversionRoute`, `ReportedBy`, `ConfirmedBy`, `ConfirmedDate`, `Phase`, `CreatedBy`, `ModifiedBy`, `StatisticsDate`, `VehicleCount`, `LightConditions`, `RoadConditions`, `WeatherConditions`, `Active`) VALUES
('1234', NULL, 'Overturned car', 'Overturned car', NULL, 24.459, 88.035, NULL, NULL, 'Vehicle Emergency', 'accident', '1', NULL, '2016-12-23 04:51:44', NULL, NULL, NULL, '2016-12-23 10:20:14', '2016-12-29 11:38:10', 2, NULL, NULL, NULL, NULL, 'ECB', NULL, NULL, NULL, 'Parag Raipuria', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A001', NULL, 'Headon collision', 'Bus truck accident', NULL, 24.343, 88.033, NULL, NULL, 'Vehicle Emergency', 'accident', '1', NULL, '2016-12-28 10:26:07', NULL, NULL, NULL, '2016-12-28 15:55:04', '2016-12-29 11:55:03', 8, NULL, NULL, NULL, NULL, 'ECB call', NULL, NULL, NULL, 'Parag Raipuria', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A02', NULL, 'test', 'test', NULL, 24.334, 88.029, NULL, NULL, 'Vehicle Emergency', 'accident', '1', NULL, '2016-12-29 12:10:24', NULL, NULL, NULL, '2016-12-29 17:39:52', '2416-12-19 19:00:07', 2, NULL, NULL, NULL, NULL, 'ecb call', NULL, NULL, NULL, 'Parag Raipuria', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A0101', NULL, 'dfcdxcf', 'DCDSCxc', NULL, 24.24344, 88.08061, NULL, NULL, 'Vehicle Emergency', 'accident', '1', NULL, '2017-01-02 11:08:59', NULL, NULL, NULL, '2017-01-02 16:38:45', '2416-12-19 19:00:07', 3, NULL, NULL, NULL, NULL, 'dvsCDcf', NULL, NULL, NULL, 'Parag Raipuria', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_accident_types`
--

CREATE TABLE `utmc_accident_types` (
  `accident_type_id` bigint(20) UNSIGNED NOT NULL,
  `accident_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_accident_types`
--

INSERT INTO `utmc_accident_types` (`accident_type_id`, `accident_type`) VALUES
(1, 'Accident'),
(2, 'Bus Accident'),
(3, 'Collision'),
(4, 'Accident investigation work'),
(5, 'Accident History'),
(6, 'Chemical spillage accident'),
(7, 'Fuel spillage accident'),
(8, 'Hazardous materials accident'),
(9, 'Heavy lorry accident'),
(10, 'Jack-knifed articulated lorry'),
(11, 'Jack-knifed caravan'),
(12, 'Jack-knifed trailer'),
(13, 'Multi-vehicle accident'),
(14, 'Oil spillage accident'),
(15, 'Overturned heavy lorry'),
(16, 'Overturned vehicle'),
(17, 'Secondary accident'),
(18, 'Serious accident'),
(19, 'Shed load'),
(20, 'Vehicle spun around'),
(21, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_cctv_config`
--

CREATE TABLE `utmc_cctv_config` (
  `SystemCodeNumber` char(32) NOT NULL,
  `CameraDetails` varchar(150) DEFAULT NULL,
  `Fixed` char(1) DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `CameraSubSite` char(32) DEFAULT NULL,
  `SerialNumber` char(32) DEFAULT NULL,
  `ConfigurationDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_cctv_dynamic`
--

CREATE TABLE `utmc_cctv_dynamic` (
  `SystemCodeNumber` char(32) NOT NULL,
  `ImageType` char(5) DEFAULT NULL,
  `preset` smallint(6) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL COMMENT 'only file location is stored',
  `LastUpdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_cctv_static`
--

CREATE TABLE `utmc_cctv_static` (
  `SystemCodeNumber` varchar(32) NOT NULL,
  `ShortDescription` varchar(32) DEFAULT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `DataSourceTypeId` smallint(5) UNSIGNED DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `PublicIPAddress` varchar(20) NOT NULL,
  `Port` smallint(6) DEFAULT NULL,
  `Place` text NOT NULL,
  `CreationDate` datetime NOT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementId` int(11) UNSIGNED DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_cctv_static`
--

INSERT INTO `utmc_cctv_static` (`SystemCodeNumber`, `ShortDescription`, `LongDescription`, `DataSourceTypeId`, `Northing`, `Easting`, `IPAddress`, `PublicIPAddress`, `Port`, `Place`, `CreationDate`, `DeletionDate`, `QualityStatementId`, `DummyId`, `LastUpdated`, `Active`) VALUES
('PTZ 206 LHS', 'cam 2', 'cam 2', 0, 24.14735, 88.189772, '192.168.1.202', '125.22.73.131', 7002, '2', '2015-12-29 16:25:59', '0000-00-00 00:00:00', 0, NULL, '2016-03-29 07:18:30', 1),
('PTZ CH 206 RHS', 'cam 3', 'cam 3', 0, 24.153838, 88.183112, '192.168.1.203', '125.22.73.131', 7003, '3', '2016-01-12 17:30:00', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:19:59', 1),
('PTZ CH 212 LHS', 'cam 4', 'cam 4', 0, 24.18658, 88.146289, '192.168.1.204', '125.22.73.131', 7004, '4', '2015-12-31 15:25:59', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:20:27', 1),
('PTZ CH 226', 'cam 5', 'cam 5', 0, 24.281595, 88.052148, '192.168.1.205', '125.22.73.131', 7005, '5', '2016-01-12 17:30:00', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:20:51', 1),
('PTZ CH 237', 'cam 6', 'cam 6', 0, 24.365835, 88.039114, '192.168.1.209', '125.22.73.131', 7006, '6', '2015-12-31 15:28:02', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:21:17', 1),
('PTZ CH 243', 'cam 7', 'cam 7', 0, 24.41835, 88.033795, '192.168.1.206', '125.22.73.131', 7007, '7', '2016-01-12 17:30:00', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:22:00', 1),
('PTZ CH 260 LHS', 'cam 9', 'cam 9', 0, 24.554873, 88.021281, '192.168.1.208', '125.22.73.131', 7008, '9', '2016-01-11 15:19:57', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:22:28', 1),
('PTZ CH 260 RHS', 'cam 8', 'cam 8', 0, 24.551788, 88.024522, '192.168.1.207', '125.22.73.131', 7009, '8', '2015-12-31 15:29:32', '0000-00-00 00:00:00', 0, NULL, '2016-04-05 12:22:51', 1),
('PTZ CH-275', 'cam10', 'cam10', 0, 24.663991, 87.940233, '192.168.1.210', '125.22.73.131', 7011, '10', '2015-12-31 15:30:30', '0000-00-00 00:00:00', 0, NULL, '2016-06-15 06:22:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_detector_config`
--

CREATE TABLE `utmc_detector_config` (
  `SystemCodeNumber` char(32) NOT NULL,
  `FlowThresholdUp` smallint(6) DEFAULT NULL,
  `FlowThresholdDown` smallint(6) DEFAULT NULL,
  `OccupancyThresholdUp` decimal(4,2) DEFAULT NULL,
  `OccupancyThresholdDown` decimal(4,2) DEFAULT NULL,
  `SpeedThresholdUp` decimal(5,2) DEFAULT NULL,
  `SpeedThresholdDown` decimal(5,2) DEFAULT NULL,
  `ConfigurationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LaneNumber` tinyint(4) NOT NULL,
  `TowardsToll` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_detector_config`
--

INSERT INTO `utmc_detector_config` (`SystemCodeNumber`, `FlowThresholdUp`, `FlowThresholdDown`, `OccupancyThresholdUp`, `OccupancyThresholdDown`, `SpeedThresholdUp`, `SpeedThresholdDown`, `ConfigurationDate`, `LaneNumber`, `TowardsToll`) VALUES
('ATCC-001', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:40:18', 1, 0),
('ATCC-001', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:02', 2, 0),
('ATCC-001', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:10', 3, 1),
('ATCC-001', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:16', 4, 1),
('ATCC-002', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:28', 3, 0),
('ATCC-002', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:35', 4, 0),
('ATCC-002', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:42', 1, 1),
('ATCC-002', NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-31 09:41:47', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_detector_dynamic`
--

CREATE TABLE `utmc_detector_dynamic` (
  `SystemCodeNumber` char(32) NOT NULL,
  `TotalFlow` int(11) DEFAULT NULL,
  `FlowInterval` int(11) NOT NULL,
  `Class1Count` int(11) NOT NULL,
  `Class2Count` int(11) NOT NULL,
  `Class3Count` int(11) NOT NULL,
  `Class4Count` int(11) NOT NULL,
  `Class5Count` int(11) NOT NULL,
  `Class6Count` int(11) NOT NULL,
  `Class7Count` int(11) NOT NULL,
  `Class8Count` int(11) NOT NULL,
  `FlowStatus_TypeID` smallint(3) NOT NULL,
  `Occupancy` double NOT NULL,
  `OccupancyInterval` int(11) NOT NULL,
  `OccupancyStatus_TypeID` smallint(3) NOT NULL,
  `Speed` double NOT NULL,
  `SpeedInterval` int(11) NOT NULL,
  `SpeedStatus_TypeID` smallint(3) NOT NULL,
  `QueuePresent` int(11) NOT NULL,
  `QueueSeverity_TypeID` smallint(3) NOT NULL,
  `Headway` int(11) NOT NULL,
  `HeadwayInterval` int(11) NOT NULL,
  `HeadwayStatus_TypeID` smallint(3) NOT NULL,
  `LastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_detector_dynamic`
--

INSERT INTO `utmc_detector_dynamic` (`SystemCodeNumber`, `TotalFlow`, `FlowInterval`, `Class1Count`, `Class2Count`, `Class3Count`, `Class4Count`, `Class5Count`, `Class6Count`, `Class7Count`, `Class8Count`, `FlowStatus_TypeID`, `Occupancy`, `OccupancyInterval`, `OccupancyStatus_TypeID`, `Speed`, `SpeedInterval`, `SpeedStatus_TypeID`, `QueuePresent`, `QueueSeverity_TypeID`, `Headway`, `HeadwayInterval`, `HeadwayStatus_TypeID`, `LastUpdated`) VALUES
('ATCC-001', 53757, 200, 20, 20, 20, 20, 20, 20, 20, 20, 20, 600, 10, 564, 49, 10, 4, 600, 5, 10, 15, 6, '2016-06-09 19:50:44'),
('ATCC-002', 139, 10, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 57.6, 10, 10, 100, 10, 50, 10, 60, '2016-07-07 18:45:03'),
('ATCC-001', 53757, 200, 20, 20, 20, 20, 20, 20, 20, 20, 20, 600, 10, 564, 49, 10, 4, 600, 5, 10, 15, 6, '2016-06-09 19:50:44'),
('ATCC-002', 139, 10, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 57.6, 10, 10, 100, 10, 50, 10, 60, '2016-07-07 18:45:03'),
('ATCC-001', 53757, 200, 20, 20, 20, 20, 20, 20, 20, 20, 20, 600, 10, 564, 49, 10, 4, 600, 5, 10, 15, 6, '2016-06-09 19:50:44'),
('ATCC-002', 139, 10, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 57.6, 10, 10, 100, 10, 50, 10, 60, '2016-07-07 18:45:03'),
('ATCC-001', 53757, 200, 20, 20, 20, 20, 20, 20, 20, 20, 20, 600, 10, 564, 49, 10, 4, 600, 5, 10, 15, 6, '2016-06-09 19:50:44'),
('ATCC-002', 139, 10, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 57.6, 10, 10, 100, 10, 50, 10, 60, '2016-07-07 18:45:03'),
('ATCC-001', 53757, 200, 20, 20, 20, 20, 20, 20, 20, 20, 20, 600, 10, 564, 49, 10, 4, 600, 5, 10, 15, 6, '2016-06-09 19:50:44'),
('ATCC-002', 139, 10, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 57.6, 10, 10, 100, 10, 50, 10, 60, '2016-07-07 18:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_detector_profile`
--

CREATE TABLE `utmc_detector_profile` (
  `ProfileId` char(32) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `DayTypeId` char(32) DEFAULT NULL,
  `AlgorithmType` varchar(50) DEFAULT NULL,
  `ProfileStatusTypeId` char(10) DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `DataSourceTypeId` char(32) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementId` char(32) DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_detector_profile`
--

INSERT INTO `utmc_detector_profile` (`ProfileId`, `Description`, `DayTypeId`, `AlgorithmType`, `ProfileStatusTypeId`, `ValidFrom`, `ValidTo`, `DataSourceTypeId`, `CreationDate`, `DeletionDate`, `QualityStatementId`, `DummyId`) VALUES
('1', 'Manual', 'All', 'Manual', NULL, '2015-05-01 00:00:00', '2020-05-31 00:00:00', 'N/A', '2015-05-03 00:00:00', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_detector_profile_data`
--

CREATE TABLE `utmc_detector_profile_data` (
  `ProfileId` int(11) NOT NULL,
  `ShortDescription` varchar(50) DEFAULT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `SystemCodeNumber` char(32) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `TotalFlowLb` double DEFAULT NULL,
  `TotalFlowPr` double DEFAULT NULL,
  `TotalFlowUb` double DEFAULT NULL,
  `OccupancyLb` double DEFAULT NULL,
  `OccupancyPr` double DEFAULT NULL,
  `OccupancyUb` double DEFAULT NULL,
  `SpeedLb` double DEFAULT NULL,
  `SpeedPr` double DEFAULT NULL,
  `SpeedUb` double DEFAULT NULL,
  `HeadwayLb` double DEFAULT NULL,
  `HeadwayPr` double DEFAULT NULL,
  `HeadwayUb` double DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `FromTimeSun` time DEFAULT NULL,
  `ToTimeSun` time DEFAULT NULL,
  `FromTimeMon` time DEFAULT NULL,
  `ToTimeMon` time DEFAULT NULL,
  `FromTimeTue` time DEFAULT NULL,
  `ToTimeTue` time DEFAULT NULL,
  `FromTimeWed` time DEFAULT NULL,
  `ToTimeWed` time DEFAULT NULL,
  `FromTimeThu` time DEFAULT NULL,
  `ToTimeThu` time DEFAULT NULL,
  `FromTimeFri` time DEFAULT NULL,
  `ToTimeFri` time DEFAULT NULL,
  `FromTimeSat` time DEFAULT NULL,
  `ToTimeSat` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_detector_profile_data`
--

INSERT INTO `utmc_detector_profile_data` (`ProfileId`, `ShortDescription`, `LongDescription`, `SystemCodeNumber`, `StartTime`, `EndTime`, `TotalFlowLb`, `TotalFlowPr`, `TotalFlowUb`, `OccupancyLb`, `OccupancyPr`, `OccupancyUb`, `SpeedLb`, `SpeedPr`, `SpeedUb`, `HeadwayLb`, `HeadwayPr`, `HeadwayUb`, `DummyId`, `FromTimeSun`, `ToTimeSun`, `FromTimeMon`, `ToTimeMon`, `FromTimeTue`, `ToTimeTue`, `FromTimeWed`, `ToTimeWed`, `FromTimeThu`, `ToTimeThu`, `FromTimeFri`, `ToTimeFri`, `FromTimeSat`, `ToTimeSat`) VALUES
(2, 'test', 'LongTest', 'ATCC-002', NULL, NULL, 12, 45, 12, 2164, 0, 561, 654, 12, 12, 846, 2212, 52, NULL, '02:00:00', '19:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00'),
(3, '', '', '', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_detector_static`
--

CREATE TABLE `utmc_detector_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `ShortDescription` varchar(32) DEFAULT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `DataSourceTypeId` smallint(5) UNSIGNED DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `NetworkPathReference` varchar(32) DEFAULT NULL,
  `TransportLinkReference` varchar(32) DEFAULT NULL,
  `TypeId` smallint(6) UNSIGNED DEFAULT NULL,
  `LinkDistance` double UNSIGNED DEFAULT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `Port` varchar(6) DEFAULT NULL,
  `Place` char(255) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementId` int(11) UNSIGNED DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_detector_static`
--

INSERT INTO `utmc_detector_static` (`SystemCodeNumber`, `ShortDescription`, `LongDescription`, `DataSourceTypeId`, `Northing`, `Easting`, `NetworkPathReference`, `TransportLinkReference`, `TypeId`, `LinkDistance`, `IPAddress`, `Port`, `Place`, `CreationDate`, `DeletionDate`, `QualityStatementId`, `DummyId`, `LastUpdated`, `Active`) VALUES
('ATCC-002', 'Test', 'Test ATCC Device', 0, 24.551588, 88.02663, '', '', NULL, NULL, '192.168.1.236', 'COM1', 'CH 260', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '2016-03-18 18:56:56', 1),
('ATCC-002', 'Test', 'Test ATCC Device', 0, 24.551588, 88.02663, '', '', NULL, NULL, '192.168.1.236', 'COM1', 'CH 260', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '2016-03-18 18:56:56', 1),
('ATCC-002', 'Test', 'Test ATCC Device', 0, 24.551588, 88.02663, '', '', NULL, NULL, '192.168.1.236', 'COM1', 'CH 260', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '2016-03-18 18:56:56', 1),
('ATCC-002', 'Test', 'Test ATCC Device', 0, 24.551588, 88.02663, '', '', NULL, NULL, '192.168.1.236', 'COM1', 'CH 260', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '2016-03-18 18:56:56', 1),
('ATCC-002', 'Test', 'Test ATCC Device', 0, 24.551588, 88.02663, '', '', NULL, NULL, '192.168.1.236', 'COM1', 'CH 260', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '2016-03-18 18:56:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_ecb_static`
--

CREATE TABLE `utmc_ecb_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `IPAddress` varchar(20) NOT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `Place` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_event_relation`
--

CREATE TABLE `utmc_event_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `SystemCodeNumber` text NOT NULL,
  `Type` text NOT NULL,
  `Action` text NOT NULL,
  `Checklist_type` text NOT NULL,
  `Checklist_extra` text NOT NULL,
  `Informed` text NOT NULL,
  `Informed_time` text NOT NULL,
  `Arrived` text,
  `Arrived_time` text NOT NULL,
  `Resolved` text,
  `Resolved_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_event_relation`
--

INSERT INTO `utmc_event_relation` (`id`, `SystemCodeNumber`, `Type`, `Action`, `Checklist_type`, `Checklist_extra`, `Informed`, `Informed_time`, `Arrived`, `Arrived_time`, `Resolved`, `Resolved_time`) VALUES
(1, 'SCN310', 'event', 'Vehicle Emergency', 'Camera', '', 'true', '2016-12-19 15:21:12', 'false', '', 'true', '2016-12-20 12:53:17'),
(2, 'SCN310', 'event', 'Vehicle Emergency', 'VMS', '', 'true', '2016-12-19 15:21:12', 'false', '', 'false', ''),
(3, 'SCN310', 'event', 'Vehicle Emergency', 'Ambulance', '', 'true', '2016-12-21 15:22:40', 'false', '', 'false', '');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_event_static`
--

CREATE TABLE `utmc_event_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `Name` char(32) DEFAULT NULL,
  `ShortDescription` char(32) DEFAULT NULL,
  `LongDescription` text,
  `DataSourceTypeID` int(11) DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `NetworkLinkReference` char(32) DEFAULT NULL,
  `TransportLinkReference` char(32) DEFAULT NULL,
  `Action` text NOT NULL,
  `Type` text NOT NULL,
  `TypeID` text NOT NULL,
  `LinkDistance` double DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementID` int(11) DEFAULT NULL,
  `LocationDesc` text,
  `AccidentTime` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `ZoneAffected` char(32) DEFAULT NULL,
  `LanesAffected` int(11) DEFAULT NULL,
  `DiversionInForce` char(1) DEFAULT NULL,
  `DiversionRoute` char(32) DEFAULT NULL,
  `ReportedBy` varchar(255) DEFAULT NULL,
  `ConfirmedBy` varchar(255) DEFAULT NULL,
  `ConfirmedDate` datetime DEFAULT NULL,
  `Phase` char(32) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `ModifiedBy` varchar(255) DEFAULT NULL,
  `StatisticsDate` datetime DEFAULT NULL,
  `VehicleCount` int(11) DEFAULT NULL,
  `LightConditions` char(32) DEFAULT NULL,
  `RoadConditions` char(32) DEFAULT NULL,
  `WeatherConditions` char(32) DEFAULT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_event_static`
--

INSERT INTO `utmc_event_static` (`SystemCodeNumber`, `Name`, `ShortDescription`, `LongDescription`, `DataSourceTypeID`, `Northing`, `Easting`, `NetworkLinkReference`, `TransportLinkReference`, `Action`, `Type`, `TypeID`, `LinkDistance`, `CreationDate`, `DeletionDate`, `QualityStatementID`, `LocationDesc`, `AccidentTime`, `EndDate`, `Severity`, `ZoneAffected`, `LanesAffected`, `DiversionInForce`, `DiversionRoute`, `ReportedBy`, `ConfirmedBy`, `ConfirmedDate`, `Phase`, `CreatedBy`, `ModifiedBy`, `StatisticsDate`, `VehicleCount`, `LightConditions`, `RoadConditions`, `WeatherConditions`, `Active`) VALUES
('SCN310', NULL, 'test', 'longtest', NULL, 24.129, 88.209, NULL, NULL, 'Vehicle Emergency', 'event', '1', NULL, '2016-12-19 09:50:58', NULL, NULL, NULL, '2016-12-19 15:19:57', '2416-12-19 19:00:07', 2, NULL, NULL, NULL, NULL, 'Praneeth', NULL, NULL, NULL, 'Parag Raipuria', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_event_types`
--

CREATE TABLE `utmc_event_types` (
  `accident_type_id` bigint(20) UNSIGNED NOT NULL,
  `accident_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_event_types`
--

INSERT INTO `utmc_event_types` (`accident_type_id`, `accident_type`) VALUES
(1, 'BALL GAME  '),
(2, 'BOXING TOURNAMENT  '),
(3, 'ATHLETICS MEETING  '),
(4, 'CYCLE RACE  '),
(5, 'DEMONSTRATION  '),
(6, 'EVENT '),
(7, 'EXHIBITION  '),
(8, 'FAIR  '),
(9, 'FESTIVAL  '),
(10, 'FOOTBALL MATCH  '),
(11, 'FUNFAIR  '),
(12, 'GOLF TOURNAMENT  '),
(13, 'INTERNATIONAL SPORTS MEETING  '),
(14, 'MAJOR EVENT  '),
(15, 'MARATHON  '),
(16, 'MARCH  '),
(17, 'MARKET  '),
(18, 'MATCH  '),
(19, 'PARADE  '),
(20, 'PROCESSION  '),
(21, 'RACE MEETING  '),
(22, 'RUGBY MATCH  '),
(23, 'SHOW  '),
(24, 'SHOW JUMPING  '),
(25, 'SPORTS EVENT '),
(26, 'SPORTS MEETING '),
(27, 'STATE OCCASION  '),
(28, 'STRIKE  '),
(29, 'TENNIS TOURNAMENT  '),
(30, 'TOURNAMENT  '),
(31, 'TRADE FAIR  '),
(32, 'WATER SPORTS MEETING  '),
(33, 'WINTER SPORTS MEETING  '),
(34, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_freeflow_alert_dynamic`
--

CREATE TABLE `utmc_freeflow_alert_dynamic` (
  `SystemCodeNumber` varchar(20) NOT NULL,
  `ActionStatus` varchar(20) NOT NULL,
  `Device` varchar(20) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_freeflow_alert_dynamic`
--

INSERT INTO `utmc_freeflow_alert_dynamic` (`SystemCodeNumber`, `ActionStatus`, `Device`, `Description`, `LastUpdated`) VALUES
('MET-001', 'VMS', 'VMS-001', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE DRIVE CAREFULLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH AIR TEMPERATURE', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'WELCOME TO BFHL-NHAI', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'Testing from ho HO Testing2', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:27'),
('MET-001', 'VMS', 'VMS-001', 'STAY ALIVE THINK AND DRIVE', '2016-06-08 08:19:43'),
('MET-001', 'VMS', 'VMS-001', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE DRIVE CAREFULLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH AIR TEMPERATURE', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'WELCOME TO BFHL-NHAI', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'Testing from ho HO Testing2', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:27'),
('MET-001', 'VMS', 'VMS-001', 'STAY ALIVE THINK AND DRIVE', '2016-06-08 08:19:43'),
('MET-001', 'VMS', 'VMS-001', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE DRIVE CAREFULLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH AIR TEMPERATURE', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'WELCOME TO BFHL-NHAI', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'Testing from ho HO Testing2', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:27'),
('MET-001', 'VMS', 'VMS-001', 'STAY ALIVE THINK AND DRIVE', '2016-06-08 08:19:43'),
('MET-001', 'VMS', 'VMS-001', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE DRIVE CAREFULLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH AIR TEMPERATURE', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'WELCOME TO BFHL-NHAI', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'Testing from ho HO Testing2', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:27'),
('MET-001', 'VMS', 'VMS-001', 'STAY ALIVE THINK AND DRIVE', '2016-06-08 08:19:43'),
('MET-001', 'VMS', 'VMS-001', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'DRIVE SLOWER LIVE LONGER', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE DRIVE CAREFULLY', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH AIR TEMPERATURE', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-003', 'WELCOME TO BFHL-NHAI', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'Testing from ho HO Testing2', '2016-06-02 09:16:53'),
('MET-001', 'VMS', 'VMS-001', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-002', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-003', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:15:01'),
('MET-001', 'VMS', 'VMS-004', 'HIGH TEMPERATURE, DRIVE SLOWLY', '2016-06-02 09:16:27'),
('MET-001', 'VMS', 'VMS-001', 'STAY ALIVE THINK AND DRIVE', '2016-06-08 08:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_incident_relation`
--

CREATE TABLE `utmc_incident_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `SystemCodeNumber` text NOT NULL,
  `Type` text NOT NULL,
  `Action` text NOT NULL,
  `Checklist_type` text NOT NULL,
  `Checklist_extra` text NOT NULL,
  `Informed` text NOT NULL,
  `Informed_time` text NOT NULL,
  `Arrived` text,
  `Arrived_time` text NOT NULL,
  `Resolved` text,
  `Resolved_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_incident_static`
--

CREATE TABLE `utmc_incident_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `Name` char(32) DEFAULT NULL,
  `ShortDescription` char(32) DEFAULT NULL,
  `LongDescription` text,
  `DataSourceTypeID` int(11) DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `NetworkLinkReference` char(32) DEFAULT NULL,
  `TransportLinkReference` char(32) DEFAULT NULL,
  `Action` text NOT NULL,
  `Type` text NOT NULL,
  `TypeID` text NOT NULL,
  `LinkDistance` double DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementID` int(11) DEFAULT NULL,
  `LocationDesc` text,
  `AccidentTime` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `ZoneAffected` char(32) DEFAULT NULL,
  `LanesAffected` int(11) DEFAULT NULL,
  `DiversionInForce` char(1) DEFAULT NULL,
  `DiversionRoute` char(32) DEFAULT NULL,
  `ReportedBy` varchar(255) DEFAULT NULL,
  `ConfirmedBy` varchar(255) DEFAULT NULL,
  `ConfirmedDate` datetime DEFAULT NULL,
  `Phase` char(32) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `ModifiedBy` varchar(255) DEFAULT NULL,
  `StatisticsDate` datetime DEFAULT NULL,
  `VehicleCount` int(11) DEFAULT NULL,
  `LightConditions` char(32) DEFAULT NULL,
  `RoadConditions` char(32) DEFAULT NULL,
  `WeatherConditions` char(32) DEFAULT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_incident_types`
--

CREATE TABLE `utmc_incident_types` (
  `accident_type_id` bigint(20) UNSIGNED NOT NULL,
  `accident_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_incident_types`
--

INSERT INTO `utmc_incident_types` (`accident_type_id`, `accident_type`) VALUES
(1, ' ABNORMAL LOAD(S)'),
(2, '   AIR CRASH '),
(3, '  AIR RAID '),
(4, '  ANIMALS ON THE ROAD'),
(5, '   ATTACK ON VEHICLE '),
(6, '  AVALANCHES'),
(7, '  BLASTING WORK'),
(8, '   BRIDGE BLOCKED'),
(9, '   BRIDGE CLOSED'),
(10, '  BRIDGE DEMOLITION WORK'),
(11, '   BRIDGE MAINTENANCE WORK'),
(12, '   BRIDGE OPENING'),
(13, '   BROKEN DOWN BUS(ES)'),
(14, '   BROKEN DOWN HEAVY LORRY(IES)'),
(15, '   BROKEN DOWN VEHICLE(S)'),
(16, '   BURST PIPE '),
(17, '  BURST WATER MAIN '),
(18, '  BUS DISRUPTION'),
(19, '  BUS LANE BLOCKED'),
(20, '   BUS LANE CLOSED '),
(21, '  CENTRE LANE(S) BLOCKED'),
(22, '   CENTRE LANE(S) CLOSED '),
(23, '  CHEMICAL SPILLAGE ACCIDENT(S)'),
(24, '   CHILDREN ON ROADWAY '),
(25, '  CIVIL EMERGENCY '),
(26, '  CIVIL EMERGENCY CANCELLED'),
(27, '   CLOSED DUE TO SMOG ALERT '),
(28, '  CONGESTION'),
(29, '  CONTRAFLOW'),
(30, '  CONVOY(S)'),
(31, '  CROWD'),
(32, '  CYCLISTS ON ROADWAY'),
(33, '   DIVERSION'),
(34, '  EMERGENCY ALERT (EXTRA GENERATED TRAFFIC) '),
(35, '  FACILITIES CLOSED'),
(36, '  FAULT'),
(37, '  FIRE'),
(38, '  FLOOD'),
(39, '  FLOW'),
(40, '  FOG'),
(41, '  GAWKING TRAFFIC - RUBBER NECKERS '),
(42, '  GUNFIRE ON ROADWAY '),
(43, '  HAIL'),
(44, '  HEAVY FLOW'),
(45, '  ICE'),
(46, '  LANE CLOSURE'),
(47, '  LIGHT FAULT'),
(48, '  OBSTRUCTION'),
(49, '  PEOPLE ON ROADWAY '),
(50, '  POLLUTION'),
(51, '  POWER FAILURE '),
(52, '  PUBLIC DISTURBANCE '),
(53, '  QUEUE'),
(54, '  RADIOACTIVE LEAK '),
(55, '  RAIN'),
(56, '  RIOT'),
(57, '  ROAD CLOSURE'),
(58, '  ROADSIDE FIRE'),
(59, '  SANDSTORMS '),
(60, '  SECURITY ALERT '),
(61, '  SECURITY INCIDENT '),
(62, '  SIGHTSEERS OBSTRUCTING ACCESS '),
(63, '  SNOW'),
(64, '  SPEED RESTRICTION'),
(65, '  SPILLAGE'),
(66, '  SPRAY HAZARD '),
(67, '  STRUCTURAL DAMAGE'),
(68, '  TELEPHONE FAULT'),
(69, '  TEMPORARY SIGNAL'),
(70, '  TERRORIST INCIDENT '),
(71, '  TORNADOES '),
(72, '  TRAFFIC SIGNAL FAULT'),
(73, '  TRAIN DISRUPTION'),
(74, '  UNEXPLAINED DAMAGE '),
(75, '  UNEXPLAINED EVENT'),
(76, '  WASHOUT '),
(77, '  WIND'),
(78, '  OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_meteorological_config`
--

CREATE TABLE `utmc_meteorological_config` (
  `SystemCodeNumber` char(32) NOT NULL COMMENT 'Unique identifier for the device.',
  `Forecast` char(1) DEFAULT 'N' COMMENT 'Indicates if the  data is forecast or actual. (Y/N)',
  `AreaOfEffect` decimal(5,2) DEFAULT NULL COMMENT 'General area in kilometers radius from device centre',
  `RoadConditionTypeID` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `RoadTemp` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `VisibilityTypeID` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `VisibilityDist` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `PrecipitationTypeID` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `Precipitation` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActPrecipitationDifference` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActPrecipitationIntensity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AirTemp` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinTemp` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxTemp` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgTemp` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `Humidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActAbsHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinAbsHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxAbsHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgAbsHumidity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActSpecificEnthalpy` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `Pressure` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinAbsPressure` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxAbsPressure` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgAbsPressure` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActAirDensity` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `WindSpeed` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxWindSpeed` smallint(6) UNSIGNED DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinWindSpeed` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgWindSpeed` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `VctWindSpeed` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `WindDirection` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinWindDirection` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxWindDirection` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `VctWindDirection` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActGlobalRadiation` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MinGlobalRadiation` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `MaxGlobalRadiation` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `AvgGlobalRadiation` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `ActVolOfDrops` smallint(6) DEFAULT '0' COMMENT 'Sampling rate in seconds per query.',
  `LastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sampling rates in seconds per query. Zero means no sampling.';

-- --------------------------------------------------------

--
-- Table structure for table `utmc_meteorological_dynamic`
--

CREATE TABLE `utmc_meteorological_dynamic` (
  `SystemCodeNumber` char(32) NOT NULL COMMENT 'Unique identifier for the device.',
  `Active` tinyint(4) NOT NULL,
  `Forecast` char(1) DEFAULT 'N' COMMENT 'Indicates if the  data is forecast or actual. (Y/N)',
  `AreaOfEffect` decimal(5,2) DEFAULT NULL COMMENT 'General area in kilometers radius from device centre',
  `RoadConditionTypeID` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'meteorologicalData 1. Indication of road condition. dry:1, wet:2, icy:3',
  `RoadTemp` double DEFAULT NULL COMMENT 'meteorologicalData 2. Current road temperature (1,000ths of a degree C)  E.g. 23.2 C is reported as 23,200.',
  `VisibilityTypeID` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'meteorologicalData 3. Indication of visibility problems. Good Visibility(10km):1, Moderate Visibility (4 - 10km):2, Poor Visibility(2 - 4km):3, Haze(1 - 2km):4, Mist(1 - 2km):5, Slight Fog(180m - 1km):6, Fog(45 - 180m):7, Dense Fog(<45m):8',
  `VisibilityDist` double UNSIGNED DEFAULT NULL COMMENT 'meteorologicalData 4. Visibility distance ( metres)',
  `PrecipitationTypeID` tinyint(3) UNSIGNED DEFAULT '1' COMMENT 'meteorologicalData 5. Type of preciptation. none:1, drizzle:2, rain:3, hail:4, snow:5 ',
  `Precipitation` double UNSIGNED DEFAULT NULL COMMENT 'meteorologicalData 6. Indication of precipitation intensity (in micro-metres (um) over a 15 min period). E.g. 2.3 mm of precipitation in a 15 minute period is transmitted as 2,300.',
  `ActPrecipitationDifference` double DEFAULT NULL,
  `ActPrecipitationIntensity` double DEFAULT NULL,
  `AirTemp` double DEFAULT NULL COMMENT 'meteorologicalData 7. Current air temperature (1,000ths of a degree C)',
  `MinTemp` double DEFAULT '100000' COMMENT 'meteorologicalData 8. Minimum recorded temperature (1,000ths of a degree C). Reset by writing in a default value (+100,000).',
  `MaxTemp` double DEFAULT '-100000' COMMENT 'meteorologicalData 9. Maximum recorded temperature (1,000ths of a degree C). Reset by writing in a default value (-100,000).',
  `AvgTemp` double DEFAULT NULL,
  `Humidity` double DEFAULT NULL COMMENT 'meteorologicalData 10. Current relative humidity level (1,000ths of a %RH). E.g. 60.4% is reported as 60,400.',
  `MinHumidity` double DEFAULT NULL,
  `MaxHumidity` double DEFAULT NULL,
  `AvgHumidity` double DEFAULT NULL,
  `ActAbsHumidity` double DEFAULT NULL,
  `MinAbsHumidity` double DEFAULT NULL,
  `MaxAbsHumidity` double DEFAULT NULL,
  `AvgAbsHumidity` double DEFAULT NULL,
  `ActSpecificEnthalpy` double DEFAULT NULL,
  `Pressure` double UNSIGNED DEFAULT NULL COMMENT 'meteorologicalData 11. Atmospheric pressure (1,000ths of a mB (hPa))  E.g. 1013.2 mB is reported as 1013,200.',
  `MinAbsPressure` double DEFAULT NULL,
  `MaxAbsPressure` double DEFAULT NULL,
  `AvgAbsPressure` double DEFAULT NULL,
  `ActAirDensity` double DEFAULT NULL,
  `WindSpeed` double UNSIGNED DEFAULT NULL COMMENT 'meteorologicalData 12. Average wind speed (1,000ths of a metre/second)',
  `MaxWindSpeed` double UNSIGNED DEFAULT NULL COMMENT 'meteorologicalData 13. Maximum recorded wind speed (1000ths of a metre/second). Reset by writing in a default value (0).',
  `MinWindSpeed` double DEFAULT NULL,
  `AvgWindSpeed` double DEFAULT NULL,
  `VctWindSpeed` double DEFAULT NULL,
  `WindDirection` double DEFAULT NULL COMMENT 'meteorologicalData 14. Degrees from device north.',
  `MinWindDirection` double DEFAULT NULL,
  `MaxWindDirection` double DEFAULT NULL,
  `VctWindDirection` double DEFAULT NULL,
  `ActGlobalRadiation` double DEFAULT NULL,
  `MinGlobalRadiation` double DEFAULT NULL,
  `MaxGlobalRadiation` double DEFAULT NULL,
  `AvgGlobalRadiation` double DEFAULT NULL,
  `ActVolOfDrops` double DEFAULT NULL,
  `LastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='UTMC prefix: mld';

--
-- Dumping data for table `utmc_meteorological_dynamic`
--

INSERT INTO `utmc_meteorological_dynamic` (`SystemCodeNumber`, `Active`, `Forecast`, `AreaOfEffect`, `RoadConditionTypeID`, `RoadTemp`, `VisibilityTypeID`, `VisibilityDist`, `PrecipitationTypeID`, `Precipitation`, `ActPrecipitationDifference`, `ActPrecipitationIntensity`, `AirTemp`, `MinTemp`, `MaxTemp`, `AvgTemp`, `Humidity`, `MinHumidity`, `MaxHumidity`, `AvgHumidity`, `ActAbsHumidity`, `MinAbsHumidity`, `MaxAbsHumidity`, `AvgAbsHumidity`, `ActSpecificEnthalpy`, `Pressure`, `MinAbsPressure`, `MaxAbsPressure`, `AvgAbsPressure`, `ActAirDensity`, `WindSpeed`, `MaxWindSpeed`, `MinWindSpeed`, `AvgWindSpeed`, `VctWindSpeed`, `WindDirection`, `MinWindDirection`, `MaxWindDirection`, `VctWindDirection`, `ActGlobalRadiation`, `MinGlobalRadiation`, `MaxGlobalRadiation`, `AvgGlobalRadiation`, `ActVolOfDrops`, `LastUpdated`) VALUES
('MET-001', 0, 'N', NULL, 1, 28.38, 1, 5282, 1, NULL, NULL, NULL, 27.13, 100000, -100000, NULL, 98.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.482, NULL, NULL, NULL, NULL, 147.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 02:00:00'),
('MET-001', 0, 'N', NULL, 1, 28.34, 1, 5495, 1, NULL, NULL, NULL, 27.11, 100000, -100000, NULL, 98.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.296, NULL, NULL, NULL, NULL, 118.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 02:15:00'),
('MET-001', 0, 'N', NULL, 1, 28.32, 1, 5208, 1, NULL, NULL, NULL, 27.11, 100000, -100000, NULL, 98.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.879, NULL, NULL, NULL, NULL, 151.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 02:30:00'),
('MET-001', 0, 'N', NULL, 1, 28.3, 1, 5814, 1, NULL, NULL, NULL, 27.15, 100000, -100000, NULL, 98.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.037, NULL, NULL, NULL, NULL, 147.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 02:45:00'),
('MET-001', 0, 'N', NULL, 1, 28.3, 1, 5319, 1, NULL, NULL, NULL, 27.23, 100000, -100000, NULL, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.565, NULL, NULL, NULL, NULL, 155.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 03:00:00'),
('MET-001', 0, 'N', NULL, 1, 28.27, 1, 5128, 1, NULL, NULL, NULL, 27.17, 100000, -100000, NULL, 98.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.287, NULL, NULL, NULL, NULL, 152.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 03:15:00'),
('MET-001', 0, 'N', NULL, 1, 28.19, 1, 5068, 1, NULL, NULL, NULL, 27.08, 100000, -100000, NULL, 98.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.025, NULL, NULL, NULL, NULL, 179.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 03:30:00'),
('MET-001', 0, 'N', NULL, 1, 28.1, 1, 5181, 1, NULL, NULL, NULL, 27, 100000, -100000, NULL, 98.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.017, NULL, NULL, NULL, NULL, 147.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 03:45:00'),
('MET-001', 0, 'N', NULL, 1, 28.02, 1, 4983, 1, NULL, NULL, NULL, 27.04, 100000, -100000, NULL, 98.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.151, NULL, NULL, NULL, NULL, 141.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 04:00:00'),
('MET-001', 0, 'N', NULL, 1, 28, 1, 4983, 1, NULL, NULL, NULL, 27.05, 100000, -100000, NULL, 98.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.409, NULL, NULL, NULL, NULL, 166.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 04:15:00'),
('MET-001', 0, 'N', NULL, 1, 28.02, 1, 4862, 1, NULL, NULL, NULL, 27.12, 100000, -100000, NULL, 98.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.596, NULL, NULL, NULL, NULL, 145.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 04:30:00'),
('MET-001', 0, 'N', NULL, 1, 28.04, 1, 4688, 1, NULL, NULL, NULL, 27.18, 100000, -100000, NULL, 98.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.882, NULL, NULL, NULL, NULL, 156.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 04:45:00'),
('MET-001', 0, 'N', NULL, 1, 28.1, 1, 4431, 1, NULL, NULL, NULL, 27.28, 100000, -100000, NULL, 98.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.815, NULL, NULL, NULL, NULL, 164.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 05:00:00'),
('MET-001', 0, 'N', NULL, 1, 28.2, 1, 3807, 1, NULL, NULL, NULL, 27.34, 100000, -100000, NULL, 98.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.648, NULL, NULL, NULL, NULL, 166.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 05:15:00'),
('MET-001', 0, 'N', NULL, 1, 28.28, 1, 3593, 1, NULL, NULL, NULL, 27.37, 100000, -100000, NULL, 98.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.839, NULL, NULL, NULL, NULL, 155.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 05:30:00'),
('MET-001', 0, 'N', NULL, 1, 28.38, 1, 3968, 1, NULL, NULL, NULL, 27.41, 100000, -100000, NULL, 98.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.417, NULL, NULL, NULL, NULL, 168.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 05:45:00'),
('MET-001', 0, 'N', NULL, 1, 28.49, 1, 4184, 1, NULL, NULL, NULL, 27.52, 100000, -100000, NULL, 98.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.091, NULL, NULL, NULL, NULL, 136.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 06:00:00'),
('MET-001', 0, 'N', NULL, 1, 28.91, 1, 5484, 1, NULL, NULL, NULL, 27.97, 100000, -100000, NULL, 96.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.747, NULL, NULL, NULL, NULL, 179.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 06:15:00'),
('MET-001', 0, 'N', NULL, 1, 29.14, 1, 5272, 1, NULL, NULL, NULL, 28.01, 100000, -100000, NULL, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.546, NULL, NULL, NULL, NULL, 171.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 06:30:00'),
('MET-001', 0, 'N', NULL, 1, 29.49, 1, 5988, 1, NULL, NULL, NULL, 28.3, 100000, -100000, NULL, 94.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.694, NULL, NULL, NULL, NULL, 104.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 06:45:00'),
('MET-001', 0, 'N', NULL, 1, 30.11, 1, 6977, 1, NULL, NULL, NULL, 28.61, 100000, -100000, NULL, 93.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.183, NULL, NULL, NULL, NULL, 134.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 07:00:00'),
('MET-001', 0, 'N', NULL, 1, 30.82, 1, 7407, 1, NULL, NULL, NULL, 28.86, 100000, -100000, NULL, 91.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.965, NULL, NULL, NULL, NULL, 127.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 07:15:00'),
('MET-001', 0, 'N', NULL, 1, 31.38, 1, 6818, 1, NULL, NULL, NULL, 28.67, 100000, -100000, NULL, 91.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.176, NULL, NULL, NULL, NULL, 161.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 07:30:00'),
('MET-001', 0, 'N', NULL, 1, 31.47, 1, 0, 1, NULL, NULL, NULL, 28.77, 100000, -100000, NULL, 93.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.545, NULL, NULL, NULL, NULL, 145.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 07:45:00'),
('MET-001', 0, 'N', NULL, 1, 31.58, 1, 7916, 1, NULL, NULL, NULL, 29.14, 100000, -100000, NULL, 90.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.088, NULL, NULL, NULL, NULL, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 08:00:00'),
('MET-001', 0, 'N', NULL, 1, 32.06, 1, 4464, 1, NULL, NULL, NULL, 29.51, 100000, -100000, NULL, 86.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.243, NULL, NULL, NULL, NULL, 138.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 08:15:00'),
('MET-001', 0, 'N', NULL, 1, 32.71, 1, 9709, 1, NULL, NULL, NULL, 29.7, 100000, -100000, NULL, 88.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.229, NULL, NULL, NULL, NULL, 116.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 08:30:00'),
('MET-001', 0, 'N', NULL, 1, 32.95, 1, 12000, 1, NULL, NULL, NULL, 29.84, 100000, -100000, NULL, 84.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.02, NULL, NULL, NULL, NULL, 143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 08:45:00'),
('MET-001', 0, 'N', NULL, 1, 33.56, 1, 3807, 1, NULL, NULL, NULL, 30.34, 100000, -100000, NULL, 83.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.198, NULL, NULL, NULL, NULL, 138.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 09:00:00'),
('MET-001', 0, 'N', NULL, 1, 34.15, 1, 9346, 1, NULL, NULL, NULL, 30.14, 100000, -100000, NULL, 89.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.18, NULL, NULL, NULL, NULL, 190.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 09:15:00'),
('MET-001', 0, 'N', NULL, 1, 33.63, 1, 13393, 1, NULL, NULL, NULL, 29.72, 100000, -100000, NULL, 85.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.697, NULL, NULL, NULL, NULL, 147.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 09:30:00'),
('MET-001', 0, 'N', NULL, 1, 33.98, 1, 14354, 1, NULL, NULL, NULL, 30.77, 100000, -100000, NULL, 82.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.288, NULL, NULL, NULL, NULL, 161.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 09:45:00'),
('MET-001', 0, 'N', NULL, 1, 34.42, 1, 13636, 1, NULL, NULL, NULL, 30.49, 100000, -100000, NULL, 84.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.142, NULL, NULL, NULL, NULL, 161.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 10:00:00'),
('MET-001', 0, 'N', NULL, 1, 34.43, 1, 13333, 1, NULL, NULL, NULL, 30.65, 100000, -100000, NULL, 83.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.952, NULL, NULL, NULL, NULL, 170.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 10:15:00'),
('MET-001', 0, 'N', NULL, 1, 34.71, 1, 20134, 1, NULL, NULL, NULL, 30.84, 100000, -100000, NULL, 80.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.393, NULL, NULL, NULL, NULL, 178.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 10:30:00'),
('MET-001', 0, 'N', NULL, 1, 34.79, 1, 16043, 1, NULL, NULL, NULL, 30.74, 100000, -100000, NULL, 80.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.743, NULL, NULL, NULL, NULL, 113.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 10:45:00'),
('MET-001', 0, 'N', NULL, 1, 35.06, 1, 18072, 1, NULL, NULL, NULL, 31.24, 100000, -100000, NULL, 77.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.715, NULL, NULL, NULL, NULL, 182.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 11:00:00'),
('MET-001', 0, 'N', NULL, 1, 34.91, 1, 15707, 1, NULL, NULL, NULL, 30.59, 100000, -100000, NULL, 85.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.474, NULL, NULL, NULL, NULL, 175.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 11:15:00'),
('MET-001', 0, 'N', NULL, 1, 34.51, 1, 18405, 1, NULL, NULL, NULL, 31.25, 100000, -100000, NULL, 82.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.748, NULL, NULL, NULL, NULL, 196.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 11:30:00'),
('MET-001', 0, 'N', NULL, 1, 35.31, 1, 19481, 1, NULL, NULL, NULL, 31.92, 100000, -100000, NULL, 79.56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.662, NULL, NULL, NULL, NULL, 165.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 11:45:00'),
('MET-001', 0, 'N', NULL, 1, 36.58, 1, 20833, 1, NULL, NULL, NULL, 32.38, 100000, -100000, NULL, 72.61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.765, NULL, NULL, NULL, NULL, 124.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 12:00:00'),
('MET-001', 0, 'N', NULL, 1, 38.21, 1, 22222, 1, NULL, NULL, NULL, 32.71, 100000, -100000, NULL, 78.56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.095, NULL, NULL, NULL, NULL, 136.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 12:15:00'),
('MET-001', 0, 'N', NULL, 1, 38.61, 1, 16043, 1, NULL, NULL, NULL, 31.96, 100000, -100000, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.535, NULL, NULL, NULL, NULL, 133.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 12:30:00'),
('MET-001', 0, 'N', NULL, 1, 38.28, 1, 15464, 1, NULL, NULL, NULL, 32.02, 100000, -100000, NULL, 79.46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.075, NULL, NULL, NULL, NULL, 102.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 12:45:00'),
('MET-001', 0, 'N', NULL, 1, 37.67, 1, 15957, 1, NULL, NULL, NULL, 31.77, 100000, -100000, NULL, 81.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.151, NULL, NULL, NULL, NULL, 111.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 13:00:00'),
('MET-001', 0, 'N', NULL, 1, 36.48, 1, 15625, 1, NULL, NULL, NULL, 31.35, 100000, -100000, NULL, 80.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.668, NULL, NULL, NULL, NULL, 102.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 13:15:00'),
('MET-001', 0, 'N', NULL, 1, 35.94, 1, 16129, 1, NULL, NULL, NULL, 31.22, 100000, -100000, NULL, 83.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.925, NULL, NULL, NULL, NULL, 144.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 13:30:00'),
('MET-001', 0, 'N', NULL, 1, 35.07, 1, 2545, 1, NULL, NULL, NULL, 29.88, 100000, -100000, NULL, 93.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.715, NULL, NULL, NULL, NULL, 117.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 13:45:00'),
('MET-001', 0, 'N', NULL, 1, 33.24, 1, 10381, 1, NULL, NULL, NULL, 28.02, 100000, -100000, NULL, 92.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.762, NULL, NULL, NULL, NULL, 149.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 14:00:00'),
('MET-001', 0, 'N', NULL, 1, 32.28, 1, 6466, 1, NULL, NULL, NULL, 27.77, 100000, -100000, NULL, 95.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.052, NULL, NULL, NULL, NULL, 147.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 14:15:00'),
('MET-001', 0, 'N', NULL, 1, 31.44, 1, 8333, 1, NULL, NULL, NULL, 28.02, 100000, -100000, NULL, 96.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.742, NULL, NULL, NULL, NULL, 183.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 14:30:00'),
('MET-001', 0, 'N', NULL, 1, 31.06, 1, 9375, 1, NULL, NULL, NULL, 28.68, 100000, -100000, NULL, 93.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.917, NULL, NULL, NULL, NULL, 133.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 14:45:00'),
('MET-001', 0, 'N', NULL, 1, 31.06, 1, 10204, 1, NULL, NULL, NULL, 29.3, 100000, -100000, NULL, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.45, NULL, NULL, NULL, NULL, 120.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 15:00:00'),
('MET-001', 0, 'N', NULL, 1, 31.65, 1, 10274, 1, NULL, NULL, NULL, 29.73, 100000, -100000, NULL, 90.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.167, NULL, NULL, NULL, NULL, 71.94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 15:15:00'),
('MET-001', 0, 'N', NULL, 1, 32.52, 1, 13100, 1, NULL, NULL, NULL, 30.29, 100000, -100000, NULL, 83.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.434, NULL, NULL, NULL, NULL, 140.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 15:30:00'),
('MET-001', 0, 'N', NULL, 1, 33.87, 1, 13575, 1, NULL, NULL, NULL, 30.96, 100000, -100000, NULL, 83.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.422, NULL, NULL, NULL, NULL, 107.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 15:45:00'),
('MET-001', 0, 'N', NULL, 1, 34.56, 1, 13514, 1, NULL, NULL, NULL, 30.54, 100000, -100000, NULL, 84.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.763, NULL, NULL, NULL, NULL, 131.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 16:00:00'),
('MET-001', 0, 'N', NULL, 1, 34, 1, 12987, 1, NULL, NULL, NULL, 30.03, 100000, -100000, NULL, 85.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.785, NULL, NULL, NULL, NULL, 126.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 16:15:00'),
('MET-001', 0, 'N', NULL, 1, 33.42, 1, 12658, 1, NULL, NULL, NULL, 29.78, 100000, -100000, NULL, 86.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.7, NULL, NULL, NULL, NULL, 162.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 16:30:00'),
('MET-001', 0, 'N', NULL, 1, 32.97, 1, 11236, 1, NULL, NULL, NULL, 29.53, 100000, -100000, NULL, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.074, NULL, NULL, NULL, NULL, 128.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 16:45:00'),
('MET-001', 0, 'N', NULL, 1, 32.61, 1, 12712, 1, NULL, NULL, NULL, 29.35, 100000, -100000, NULL, 89.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.998, NULL, NULL, NULL, NULL, 153.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 17:00:00'),
('MET-001', 0, 'N', NULL, 1, 32.34, 1, 14151, 1, NULL, NULL, NULL, 29.43, 100000, -100000, NULL, 89.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.261, NULL, NULL, NULL, NULL, 162.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 17:15:00'),
('MET-001', 0, 'N', NULL, 1, 32.14, 1, 12397, 1, NULL, NULL, NULL, 29.34, 100000, -100000, NULL, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.158, NULL, NULL, NULL, NULL, 134.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 17:30:00'),
('MET-001', 0, 'N', NULL, 1, 31.96, 1, 11905, 1, NULL, NULL, NULL, 29.22, 100000, -100000, NULL, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.103, NULL, NULL, NULL, NULL, 165.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 17:45:00'),
('MET-001', 0, 'N', NULL, 1, 31.76, 1, 11628, 1, NULL, NULL, NULL, 29.21, 100000, -100000, NULL, 90.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.915, NULL, NULL, NULL, NULL, 172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 18:00:00'),
('MET-001', 0, 'N', NULL, 1, 31.59, 1, 10714, 1, NULL, NULL, NULL, 29.12, 100000, -100000, NULL, 92.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.56, NULL, NULL, NULL, NULL, 146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 18:15:00'),
('MET-001', 0, 'N', NULL, 1, 31.32, 1, 9740, 1, NULL, NULL, NULL, 28.94, 100000, -100000, NULL, 93.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.447, NULL, NULL, NULL, NULL, 136.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 18:30:00'),
('MET-001', 0, 'N', NULL, 1, 31.01, 1, 10000, 1, NULL, NULL, NULL, 28.87, 100000, -100000, NULL, 93.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.456, NULL, NULL, NULL, NULL, 162.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-07 18:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_meteorological_profile`
--

CREATE TABLE `utmc_meteorological_profile` (
  `ProfileId` char(32) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `DayTypeId` int(32) DEFAULT NULL,
  `AlgorithmType` varchar(50) DEFAULT NULL,
  `ProfileStatusTypeId` char(10) DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `DataSourceTypeId` char(32) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementId` char(32) DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_meteorological_profile`
--

INSERT INTO `utmc_meteorological_profile` (`ProfileId`, `Description`, `DayTypeId`, `AlgorithmType`, `ProfileStatusTypeId`, `ValidFrom`, `ValidTo`, `DataSourceTypeId`, `CreationDate`, `DeletionDate`, `QualityStatementId`, `DummyId`) VALUES
('1', 'Manual', 1, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('10', 'Manual', 2, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('11', 'Manual', 3, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('12', 'Manual', 4, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('13', 'Manual', 5, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('14', 'Manual', 6, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('2', 'Manual', 0, 'Manual', NULL, '2016-07-01 00:00:00', '2017-04-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 1),
('3', 'Manual', 1, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('4', 'Manual', 2, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('5', 'Manual', 3, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('6', 'Manual', 4, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('7', 'Manual', 5, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('8', 'Manual', 6, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2),
('9', 'Manual', 0, 'Manual', NULL, '2016-05-01 00:00:00', '2016-06-30 00:00:00', NULL, '2015-05-03 00:00:00', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_meteorological_profile_data`
--

CREATE TABLE `utmc_meteorological_profile_data` (
  `ProfileId` int(11) NOT NULL,
  `ShortDescription` varchar(50) DEFAULT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `SystemCodeNumber` char(32) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `RoadTempLb` double DEFAULT NULL,
  `RoadTempPr` double DEFAULT NULL,
  `RoadTempUb` double DEFAULT NULL,
  `VisibilityDistLb` double DEFAULT NULL,
  `VisibilityDistPr` double DEFAULT NULL,
  `VisibilityDistUb` double DEFAULT NULL,
  `HumidityLb` double DEFAULT NULL,
  `HumidityPr` double DEFAULT NULL,
  `HumidityUb` double DEFAULT NULL,
  `AirTempLb` double DEFAULT NULL,
  `AirTempPr` double DEFAULT NULL,
  `AirTempUb` double DEFAULT NULL,
  `WindSpeedLb` double DEFAULT NULL,
  `WindSpeedPr` double DEFAULT NULL,
  `WindSpeedUb` double DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `FromTimeSun` time DEFAULT NULL,
  `ToTimeSun` time DEFAULT NULL,
  `FromTimeMon` time DEFAULT NULL,
  `ToTimeMon` time DEFAULT NULL,
  `FromTimeTue` time DEFAULT NULL,
  `ToTimeTue` time DEFAULT NULL,
  `FromTimeWed` time DEFAULT NULL,
  `ToTimeWed` time DEFAULT NULL,
  `FromTimeThu` time DEFAULT NULL,
  `ToTimeThu` time DEFAULT NULL,
  `FromTimeFri` time DEFAULT NULL,
  `ToTimeFri` time DEFAULT NULL,
  `FromTimeSat` time DEFAULT NULL,
  `ToTimeSat` time DEFAULT NULL,
  `CalendarDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_meteorological_profile_data`
--

INSERT INTO `utmc_meteorological_profile_data` (`ProfileId`, `ShortDescription`, `LongDescription`, `SystemCodeNumber`, `StartTime`, `EndTime`, `RoadTempLb`, `RoadTempPr`, `RoadTempUb`, `VisibilityDistLb`, `VisibilityDistPr`, `VisibilityDistUb`, `HumidityLb`, `HumidityPr`, `HumidityUb`, `AirTempLb`, `AirTempPr`, `AirTempUb`, `WindSpeedLb`, `WindSpeedPr`, `WindSpeedUb`, `DummyId`, `FromTimeSun`, `ToTimeSun`, `FromTimeMon`, `ToTimeMon`, `FromTimeTue`, `ToTimeTue`, `FromTimeWed`, `ToTimeWed`, `FromTimeThu`, `ToTimeThu`, `FromTimeFri`, `ToTimeFri`, `FromTimeSat`, `ToTimeSat`, `CalendarDate`) VALUES
(4, 'High Temperature', 'For Temp above 35', 'MET-001', NULL, NULL, 0, 20, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', NULL),
(5, 'Air Temp Check', 'Air Temp Check', 'MET-001', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 30, 0, 0, 0, NULL, '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', NULL),
(6, 'HIGH WIND', 'HIGH WIND', 'MET-001', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, NULL, '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', '00:00:00', '00:00:00', '00:00:00', '23:59:00', '00:00:00', '23:59:00', NULL),
(7, '', '', '', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL),
(12, NULL, NULL, 'MET-001', NULL, NULL, 19.4163429192, 19.502840299, 19.5893376789, 5809.1973253, 5824.70448694, 5840.21164858, 18.9419931115, 19.0544313794, 19.1668696473, 80.7031574584, 81.0585901387, 81.414022819, 0.472635343227, 0.720354307899, 0.96807327257, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_meteorological_static`
--

CREATE TABLE `utmc_meteorological_static` (
  `SystemCodeNumber` char(32) NOT NULL COMMENT 'Unique identifier for the "object"',
  `ShortDescription` char(32) DEFAULT NULL COMMENT 'Short description of the "object"',
  `LongDescription` text COMMENT 'Long description of the "object"',
  `DataSourceTypeID` int(11) DEFAULT NULL COMMENT 'Source of information, e.g. UTC - taken from the DataSource Look-up Table',
  `Northing` double DEFAULT NULL COMMENT 'Location of the "object" in OS grid coordinates',
  `Easting` double DEFAULT NULL COMMENT 'Location of the "object" in OS grid coordinates',
  `NetworkPathReference` char(32) DEFAULT NULL COMMENT 'Reference to Network Link',
  `TransportLinkReference` char(32) DEFAULT NULL COMMENT 'Reference to Transport Link',
  `TypeID` int(11) DEFAULT NULL COMMENT 'Type of equipment from  generic list',
  `LinkDistance` double DEFAULT NULL COMMENT 'Distance of the "object" from the start of the link',
  `IPAddress` varchar(20) NOT NULL,
  `Port` smallint(6) NOT NULL DEFAULT '1001',
  `Place` text,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/time at which the "object" was entered into the database',
  `LastUpdated` datetime DEFAULT NULL,
  `DeletionDate` datetime DEFAULT NULL COMMENT 'Date of deletion',
  `QualityStatementID` int(11) DEFAULT NULL COMMENT 'Reference to quality model',
  `DummyId` int(11) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_meteorological_static`
--

INSERT INTO `utmc_meteorological_static` (`SystemCodeNumber`, `ShortDescription`, `LongDescription`, `DataSourceTypeID`, `Northing`, `Easting`, `NetworkPathReference`, `TransportLinkReference`, `TypeID`, `LinkDistance`, `IPAddress`, `Port`, `Place`, `CreationDate`, `LastUpdated`, `DeletionDate`, `QualityStatementID`, `DummyId`, `Active`) VALUES
('MET-001', 'test', 'test', 1234, 24.149374, 88.187608, NULL, NULL, NULL, NULL, '192.168.1.5', 6785, 'HTMS control room', '2015-12-28 04:55:55', '2016-05-20 17:58:46', '0000-00-00 00:00:00', 23, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_roadwork_relation`
--

CREATE TABLE `utmc_roadwork_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `SystemCodeNumber` text NOT NULL,
  `Type` text NOT NULL,
  `Action` text NOT NULL,
  `Checklist_type` text NOT NULL,
  `Checklist_extra` text NOT NULL,
  `Informed` text NOT NULL,
  `Informed_time` text NOT NULL,
  `Arrived` text,
  `Arrived_time` text NOT NULL,
  `Resolved` text,
  `Resolved_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_roadwork_static`
--

CREATE TABLE `utmc_roadwork_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `Name` char(32) DEFAULT NULL,
  `ShortDescription` char(32) DEFAULT NULL,
  `LongDescription` text,
  `DataSourceTypeID` int(11) DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `NetworkLinkReference` char(32) DEFAULT NULL,
  `TransportLinkReference` char(32) DEFAULT NULL,
  `Action` text NOT NULL,
  `Type` text NOT NULL,
  `TypeID` text NOT NULL,
  `LinkDistance` double DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementID` int(11) DEFAULT NULL,
  `LocationDesc` text,
  `AccidentTime` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `ZoneAffected` char(32) DEFAULT NULL,
  `LanesAffected` int(11) DEFAULT NULL,
  `DiversionInForce` char(1) DEFAULT NULL,
  `DiversionRoute` char(32) DEFAULT NULL,
  `ReportedBy` varchar(255) DEFAULT NULL,
  `ConfirmedBy` varchar(255) DEFAULT NULL,
  `ConfirmedDate` datetime DEFAULT NULL,
  `Phase` char(32) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `ModifiedBy` varchar(255) DEFAULT NULL,
  `StatisticsDate` datetime DEFAULT NULL,
  `VehicleCount` int(11) DEFAULT NULL,
  `LightConditions` char(32) DEFAULT NULL,
  `RoadConditions` char(32) DEFAULT NULL,
  `WeatherConditions` char(32) DEFAULT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_roadwork_types`
--

CREATE TABLE `utmc_roadwork_types` (
  `accident_type_id` bigint(20) UNSIGNED NOT NULL,
  `accident_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_roadwork_types`
--

INSERT INTO `utmc_roadwork_types` (`accident_type_id`, `accident_type`) VALUES
(1, 'CENTRAL RESERVATION WORK  '),
(2, 'GENERAL '),
(3, 'OVERHEAD '),
(4, 'SURFACE '),
(5, 'VERGE '),
(6, 'WATER MAIN WORK '),
(7, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_signal_profile_cycles`
--

CREATE TABLE `utmc_signal_profile_cycles` (
  `CycleID` int(11) NOT NULL,
  `CycleSCN` varchar(32) NOT NULL,
  `CycleDescription` varchar(2000) NOT NULL,
  `SignalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_signal_profile_cycles`
--

INSERT INTO `utmc_signal_profile_cycles` (`CycleID`, `CycleSCN`, `CycleDescription`, `SignalID`) VALUES
(5, 'CYC001', 'Test Cycle', 1),
(6, 'Test', 'Test', 2);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_signal_profile_data`
--

CREATE TABLE `utmc_signal_profile_data` (
  `CycleID` int(11) NOT NULL,
  `StageOrder` int(1) NOT NULL,
  `NumMovements` int(2) NOT NULL,
  `StageTime` int(3) NOT NULL,
  `InterStageTime` int(2) NOT NULL,
  `VehicleMovements` varchar(255) NOT NULL,
  `PedestrainMovements` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_signal_profile_data`
--

INSERT INTO `utmc_signal_profile_data` (`CycleID`, `StageOrder`, `NumMovements`, `StageTime`, `InterStageTime`, `VehicleMovements`, `PedestrainMovements`) VALUES
(5, 1, 2, 30, 5, 'Link-1 to Link-2;', ''),
(5, 2, 2, 30, 5, 'Link-2 to Link-3;', ''),
(5, 3, 4, 30, 5, 'Link-3 to Link-1;', 'Link-2 to Link-3;'),
(6, 1, 2, 30, 3, 'Link-1 to Link-3;', '');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_dynamic`
--

CREATE TABLE `utmc_traffic_signal_dynamic` (
  `SystemCodeNumber` char(32) NOT NULL,
  `ControlStrategy` char(32) NOT NULL,
  `PlanNumber` int(11) NOT NULL,
  `StageSequence` char(32) NOT NULL,
  `PlanTimings` char(32) NOT NULL,
  `LastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_groups`
--

CREATE TABLE `utmc_traffic_signal_groups` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(255) NOT NULL,
  `NumPlans` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_traffic_signal_groups`
--

INSERT INTO `utmc_traffic_signal_groups` (`GroupID`, `GroupName`, `NumPlans`) VALUES
(1, '4planGroup', 4),
(2, '3planGroup', 3),
(3, '5planGroup', 5),
(4, '1planGroup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_groups_plans`
--

CREATE TABLE `utmc_traffic_signal_groups_plans` (
  `PlanID` int(11) NOT NULL,
  `PlanOrder` int(2) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_traffic_signal_groups_plans`
--

INSERT INTO `utmc_traffic_signal_groups_plans` (`PlanID`, `PlanOrder`, `GroupID`, `StartTime`, `EndTime`) VALUES
(1, 1, 1, '00:00:00', '06:00:00'),
(2, 2, 1, '06:00:00', '14:00:00'),
(3, 3, 1, '14:00:00', '20:00:00'),
(4, 4, 1, '20:00:00', '24:00:00'),
(5, 1, 2, '00:00:00', '08:00:00'),
(6, 2, 2, '08:00:00', '16:00:00'),
(7, 3, 2, '16:00:00', '24:00:00'),
(8, 1, 3, '00:00:00', '08:30:00'),
(9, 2, 3, '08:30:00', '11:30:00'),
(10, 3, 3, '11:30:00', '18:00:00'),
(11, 4, 3, '18:00:00', '21:00:00'),
(12, 5, 3, '21:00:00', '24:00:00'),
(13, 1, 4, '00:00:00', '24:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_plans_stages`
--

CREATE TABLE `utmc_traffic_signal_plans_stages` (
  `StageID` int(11) NOT NULL,
  `SignalID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL,
  `StageOrder` int(1) NOT NULL,
  `NumMovements` int(2) NOT NULL,
  `Time` int(3) NOT NULL,
  `InterStageTime` int(2) NOT NULL,
  `VehicleMovements` varchar(255) NOT NULL,
  `PedestrainMovements` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_traffic_signal_plans_stages`
--

INSERT INTO `utmc_traffic_signal_plans_stages` (`StageID`, `SignalID`, `PlanID`, `StageOrder`, `NumMovements`, `Time`, `InterStageTime`, `VehicleMovements`, `PedestrainMovements`) VALUES
(93, 21, 13, 1, 2, 45, 5, 'Link-1 to Link-2;Link-1 to Link-3;', ''),
(94, 21, 13, 2, 2, 50, 6, 'Link-2 to Link-3;Link-2 to Link-1;', ''),
(95, 21, 13, 3, 2, 55, 7, 'Link-3 to Link-1;Link-3 to Link-2;', ''),
(96, 22, 5, 1, 2, 30, 5, 'Link-1 to Link-2;Link-1 to Link-3;', ''),
(97, 22, 5, 2, 2, 35, 5, 'Link-2 to Link-3;Link-2 to Link-1;', ''),
(98, 22, 5, 3, 2, 40, 5, 'Link-3 to Link-1;Link-3 to Link-2;', ''),
(99, 22, 6, 1, 2, 45, 5, 'Link-1 to Link-2;Link-1 to Link-3;', ''),
(100, 22, 6, 2, 2, 50, 5, 'Link-2 to Link-3;Link-2 to Link-1;', ''),
(101, 22, 6, 3, 2, 55, 5, 'Link-3 to Link-1;Link-3 to Link-2;', ''),
(102, 22, 7, 1, 2, 30, 5, 'Link-1 to Link-2;Link-1 to Link-3;', ''),
(103, 22, 7, 2, 2, 35, 5, 'Link-2 to Link-3;Link-2 to Link-1;', ''),
(104, 22, 7, 3, 2, 40, 5, 'Link-3 to Link-1;Link-3 to Link-2;', ''),
(105, 23, 5, 1, 3, 60, 5, 'Link-1 to Link-2;Link-1 to Link-3;Link-1 to Link-4;', ''),
(106, 23, 5, 2, 3, 65, 10, 'Link-2 to Link-1;Link-2 to Link-3;Link-2 to Link-4;', ''),
(107, 23, 5, 3, 3, 60, 5, 'Link-3 to Link-1;Link-3 to Link-2;Link-3 to Link-4;', ''),
(108, 23, 5, 4, 3, 55, 10, 'Link-4 to Link-1;Link-4 to Link-2;Link-4 to Link-3;', ''),
(109, 23, 6, 1, 3, 70, 10, 'Link-1 to Link-2;Link-1 to Link-3;Link-1 to Link-4;', ''),
(110, 23, 6, 2, 3, 65, 5, 'Link-2 to Link-1;Link-2 to Link-3;Link-2 to Link-4;', ''),
(111, 23, 6, 3, 3, 70, 10, 'Link-3 to Link-1;Link-3 to Link-2;Link-3 to Link-4;', ''),
(112, 23, 6, 4, 3, 65, 5, 'Link-4 to Link-1;Link-4 to Link-2;Link-4 to Link-3;', ''),
(113, 23, 7, 1, 3, 45, 5, 'Link-1 to Link-2;Link-1 to Link-3;Link-1 to Link-4;', ''),
(114, 23, 7, 2, 3, 50, 5, 'Link-2 to Link-1;Link-2 to Link-3;Link-2 to Link-4;', ''),
(115, 23, 7, 3, 3, 45, 5, 'Link-3 to Link-4;Link-3 to Link-2;Link-3 to Link-1;', ''),
(116, 23, 7, 4, 3, 50, 5, 'Link-4 to Link-1;Link-4 to Link-2;Link-4 to Link-3;', '');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_static`
--

CREATE TABLE `utmc_traffic_signal_static` (
  `SignalID` int(11) NOT NULL,
  `SCN` varchar(32) NOT NULL,
  `IPAddress` varchar(20) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `ShortDescription` varchar(32) NOT NULL,
  `LongDescription` varchar(2000) NOT NULL,
  `Supplier` varchar(100) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `NumLinks` int(1) NOT NULL,
  `SignalOffset` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_traffic_signal_static`
--

INSERT INTO `utmc_traffic_signal_static` (`SignalID`, `SCN`, `IPAddress`, `GroupID`, `ShortDescription`, `LongDescription`, `Supplier`, `Latitude`, `Longitude`, `NumLinks`, `SignalOffset`) VALUES
(21, 'SIG004', '10.10.10.10', 4, 'Botanical Garden Junction', 'Botanical Garden Junction', 'ABC Suppliers', 17.4554, 78.3639, 3, 20),
(22, 'SIG001', '192.168.1.1', 2, 'Kondapur Junction', 'Kondapur Junction', 'ABC Suppliers', 17.4591, 78.3662, 3, 0),
(23, 'SIG002', '192.168.1.2', 2, 'Cyber Tower Junction', 'Cyber Tower Junction', 'ABC Suppliers', 17.4515, 78.3811, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_traffic_signal_static_links`
--

CREATE TABLE `utmc_traffic_signal_static_links` (
  `LinkID` int(11) NOT NULL,
  `LinkOrder` int(1) NOT NULL,
  `SignalID` int(11) NOT NULL,
  `LinkName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_traffic_signal_static_links`
--

INSERT INTO `utmc_traffic_signal_static_links` (`LinkID`, `LinkOrder`, `SignalID`, `LinkName`) VALUES
(78, 1, 21, 'Towards Gachibowli'),
(79, 2, 21, 'Towards Kondapur'),
(80, 3, 21, 'Towards BotanicalGarden'),
(81, 1, 22, 'Towards Gachibowli'),
(82, 2, 22, 'Towards Miyanpur'),
(83, 3, 22, 'Towards Hitech City'),
(84, 1, 23, 'Towards Mindspace'),
(85, 2, 23, 'Towards Kondapur'),
(86, 3, 23, 'Towards KPHB'),
(87, 4, 23, 'Towards Madhapur');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_vms_config`
--

CREATE TABLE `utmc_vms_config` (
  `SystemCodeNumber` char(32) NOT NULL,
  `SerialNumber` char(32) DEFAULT NULL,
  `LanternsAvailable` char(1) DEFAULT NULL,
  `Width` smallint(5) UNSIGNED DEFAULT NULL,
  `Height` smallint(5) UNSIGNED DEFAULT NULL,
  `FontWidth` smallint(5) UNSIGNED DEFAULT NULL,
  `FontHeight` smallint(5) UNSIGNED DEFAULT NULL,
  `FontSpacing` smallint(5) UNSIGNED DEFAULT NULL,
  `Delimiter` char(1) DEFAULT NULL,
  `CarParkZone` char(32) DEFAULT NULL,
  `ConfigurationDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utmc_vms_dynamic`
--

CREATE TABLE `utmc_vms_dynamic` (
  `SystemCodeNumber` char(32) NOT NULL,
  `MsgId` char(32) DEFAULT NULL,
  `MsgTxt` varchar(2000) DEFAULT NULL,
  `LanternState` smallint(6) DEFAULT NULL,
  `LuminiscenceOverride` char(1) DEFAULT NULL,
  `LuminiscenceLevel` smallint(6) DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `FaultText` varchar(2000) DEFAULT NULL,
  `slide` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_vms_dynamic`
--

INSERT INTO `utmc_vms_dynamic` (`SystemCodeNumber`, `MsgId`, `MsgTxt`, `LanternState`, `LuminiscenceOverride`, `LuminiscenceLevel`, `LastUpdated`, `FaultText`, `slide`, `time`) VALUES
('VMS-001', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-04-09 10:43:19', NULL, 1, 10),
('VMS-001', '12', 'REDUCE  SPEED NOW ', NULL, NULL, NULL, '2016-04-09 10:44:18', NULL, 2, 10),
('VMS-001', '13', 'DRIVE SLOWER LIVE LONGER ', NULL, NULL, NULL, '2016-04-09 10:46:18', NULL, 3, 10),
('VMS-003', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:12:02', NULL, 1, 10),
('VMS-004', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:13:21', NULL, 1, 10),
('VMS-002', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:32', NULL, 13, 20),
('VMS-003', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-06-08 13:51:39', NULL, 13, 20),
('VMS-004', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:47', NULL, 13, 20),
('VMS-001', '20', 'STAY ALIVE THINK AND DRIVE', NULL, NULL, NULL, '2016-06-08 14:06:25', NULL, 13, 20),
('VMS-001', '22', 'TESTING FROM HO MUMBAI', NULL, NULL, NULL, '2016-06-18 14:21:36', NULL, 4, 10),
('VMS-002', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-07-01 14:45:35', NULL, 1, 20),
('VMS-001', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-04-09 10:43:19', NULL, 1, 10),
('VMS-001', '12', 'REDUCE  SPEED NOW ', NULL, NULL, NULL, '2016-04-09 10:44:18', NULL, 2, 10),
('VMS-001', '13', 'DRIVE SLOWER LIVE LONGER ', NULL, NULL, NULL, '2016-04-09 10:46:18', NULL, 3, 10),
('VMS-003', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:12:02', NULL, 1, 10),
('VMS-004', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:13:21', NULL, 1, 10),
('VMS-002', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:32', NULL, 13, 20),
('VMS-003', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-06-08 13:51:39', NULL, 13, 20),
('VMS-004', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:47', NULL, 13, 20),
('VMS-001', '20', 'STAY ALIVE THINK AND DRIVE', NULL, NULL, NULL, '2016-06-08 14:06:25', NULL, 13, 20),
('VMS-001', '22', 'TESTING FROM HO MUMBAI', NULL, NULL, NULL, '2016-06-18 14:21:36', NULL, 4, 10),
('VMS-002', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-07-01 14:45:35', NULL, 1, 20),
('VMS-001', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-04-09 10:43:19', NULL, 1, 10),
('VMS-001', '12', 'REDUCE  SPEED NOW ', NULL, NULL, NULL, '2016-04-09 10:44:18', NULL, 2, 10),
('VMS-001', '13', 'DRIVE SLOWER LIVE LONGER ', NULL, NULL, NULL, '2016-04-09 10:46:18', NULL, 3, 10),
('VMS-003', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:12:02', NULL, 1, 10),
('VMS-004', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:13:21', NULL, 1, 10),
('VMS-002', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:32', NULL, 13, 20),
('VMS-003', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-06-08 13:51:39', NULL, 13, 20),
('VMS-004', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:47', NULL, 13, 20),
('VMS-001', '20', 'STAY ALIVE THINK AND DRIVE', NULL, NULL, NULL, '2016-06-08 14:06:25', NULL, 13, 20),
('VMS-001', '22', 'TESTING FROM HO MUMBAI', NULL, NULL, NULL, '2016-06-18 14:21:36', NULL, 4, 10),
('VMS-002', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-07-01 14:45:35', NULL, 1, 20),
('VMS-001', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-04-09 10:43:19', NULL, 1, 10),
('VMS-001', '12', 'REDUCE  SPEED NOW ', NULL, NULL, NULL, '2016-04-09 10:44:18', NULL, 2, 10),
('VMS-001', '13', 'DRIVE SLOWER LIVE LONGER ', NULL, NULL, NULL, '2016-04-09 10:46:18', NULL, 3, 10),
('VMS-003', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:12:02', NULL, 1, 10),
('VMS-004', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:13:21', NULL, 1, 10),
('VMS-002', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:32', NULL, 13, 20),
('VMS-003', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-06-08 13:51:39', NULL, 13, 20),
('VMS-004', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:47', NULL, 13, 20),
('VMS-001', '20', 'STAY ALIVE THINK AND DRIVE', NULL, NULL, NULL, '2016-06-08 14:06:25', NULL, 13, 20),
('VMS-001', '22', 'TESTING FROM HO MUMBAI', NULL, NULL, NULL, '2016-06-18 14:21:36', NULL, 4, 10),
('VMS-002', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-07-01 14:45:35', NULL, 1, 20),
('VMS-001', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-04-09 10:43:19', NULL, 1, 10),
('VMS-001', '12', 'REDUCE  SPEED NOW ', NULL, NULL, NULL, '2016-04-09 10:44:18', NULL, 2, 10),
('VMS-001', '13', 'DRIVE SLOWER LIVE LONGER ', NULL, NULL, NULL, '2016-04-09 10:46:18', NULL, 3, 10),
('VMS-003', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:12:02', NULL, 1, 10),
('VMS-004', '15', 'DONT DRINK AND DRIVE', NULL, NULL, NULL, '2016-04-11 13:13:21', NULL, 1, 10),
('VMS-002', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:32', NULL, 13, 20),
('VMS-003', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-06-08 13:51:39', NULL, 13, 20),
('VMS-004', '17', 'HIGH TEMPERATURE, DRIVE SLOWLY', NULL, NULL, NULL, '2016-06-08 13:51:47', NULL, 13, 20),
('VMS-001', '20', 'STAY ALIVE THINK AND DRIVE', NULL, NULL, NULL, '2016-06-08 14:06:25', NULL, 13, 20),
('VMS-001', '22', 'TESTING FROM HO MUMBAI', NULL, NULL, NULL, '2016-06-18 14:21:36', NULL, 4, 10),
('VMS-002', '11', 'WELCOME TO BFHL-NHAI', NULL, NULL, NULL, '2016-07-01 14:45:35', NULL, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_vms_messages_support_static`
--

CREATE TABLE `utmc_vms_messages_support_static` (
  `MessageID` int(32) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `MessageText` text NOT NULL,
  `Category` char(32) NOT NULL,
  `CommandPhrase` char(32) NOT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `topLineText` varchar(50) NOT NULL,
  `midLineText` varchar(50) NOT NULL,
  `botLineText` varchar(50) NOT NULL,
  `fontSize` int(11) NOT NULL DEFAULT '20'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_vms_messages_support_static`
--

INSERT INTO `utmc_vms_messages_support_static` (`MessageID`, `active`, `MessageText`, `Category`, `CommandPhrase`, `DummyId`, `topLineText`, `midLineText`, `botLineText`, `fontSize`) VALUES
(11, 1, 'WELCOME TO BFHL-NHAI  ', '', '', NULL, 'WELCOME', 'TO', 'BFHL-NHAI', 15),
(12, 1, 'REDUCE SPEED NOW ', '', '', NULL, 'REDUCE ', 'SPEED NOW', '', 15),
(13, 0, 'DRIVE SLOWER LIVE LONGER ', '', '', NULL, 'DRIVE SLOWER', 'LIVE LONGER', '', 15),
(15, 1, 'DONT DRINK AND DRIVE', '', '', NULL, 'DONT DRINK', 'AND', 'DRIVE', 15),
(16, 1, 'HAPPY JOURNEY', '', '', NULL, 'HAPPY ', 'JOURNEY', '', 15),
(17, 0, 'HIGH TEMPERATURE, DRIVE SLOWLY', '', '', NULL, 'HIGH', 'TEMPERATURE,', 'DRIVE SLOWLY', 10),
(18, 0, 'High Temperature Drive Carefully', '', '', NULL, 'HIGH TEMPERATURE', 'DRIVE', 'CAREFULLY', 15),
(19, 1, 'HIGH AIR TEMPERATURE ', '', '', NULL, 'HIGH AIR', 'TEMPERATURE', '', 15),
(20, 0, 'STAY ALIVE THINK AND DRIVE ', '', '', NULL, 'STAY ALIVE', 'THINK AND', 'DRIVE', 20),
(22, 0, 'TESTING FROM HO MUMBAI', '', '', NULL, 'TESTING', 'FROM HO', 'MUMBAI', 20),
(23, 0, '  ', '', '', NULL, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `utmc_vms_message_list_support_static`
--

CREATE TABLE `utmc_vms_message_list_support_static` (
  `ID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `SystemCodeNumber` char(32) NOT NULL,
  `MessageID` char(32) NOT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `slide` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `creationUser` varchar(20) NOT NULL,
  `deletionUser` varchar(20) NOT NULL,
  `CreationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdationTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeletionTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_vms_message_list_support_static`
--

INSERT INTO `utmc_vms_message_list_support_static` (`ID`, `active`, `SystemCodeNumber`, `MessageID`, `DummyId`, `slide`, `time`, `creationUser`, `deletionUser`, `CreationTime`, `UpdationTime`, `DeletionTime`) VALUES
(1, 1, 'VMS-001', '11', NULL, 1, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'VMS-001', '12', NULL, 2, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'VMS-001', '13', NULL, 3, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'VMS-003', '15', NULL, 1, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'VMS-004', '15', NULL, 1, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'VMS-002', '17', NULL, 13, 20, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'VMS-003', '11', NULL, 13, 20, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'VMS-004', '17', NULL, 13, 20, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 'VMS-001', '20', NULL, 13, 20, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 'VMS-001', '22', NULL, 4, 10, 'Parag Raipuria', '', '2016-06-21 12:22:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 'VMS-002', '11', NULL, 1, 20, '\nDwip', '', '2016-07-01 09:15:22', '2016-07-01 09:15:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `utmc_vms_static`
--

CREATE TABLE `utmc_vms_static` (
  `SystemCodeNumber` char(32) NOT NULL,
  `ShortDescription` varchar(32) DEFAULT NULL,
  `LongDescription` varchar(2000) DEFAULT NULL,
  `DataSourceTypeId` smallint(5) UNSIGNED DEFAULT NULL,
  `Northing` double NOT NULL,
  `Easting` double NOT NULL,
  `Place` text,
  `NetworkPathReference` varchar(32) DEFAULT NULL,
  `TransportLinkReference` varchar(32) DEFAULT NULL,
  `TypeId` smallint(6) UNSIGNED DEFAULT NULL,
  `LinkDistance` double UNSIGNED DEFAULT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `Port` smallint(6) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  `QualityStatementId` int(11) UNSIGNED DEFAULT NULL,
  `DummyId` int(11) DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utmc_vms_static`
--

INSERT INTO `utmc_vms_static` (`SystemCodeNumber`, `ShortDescription`, `LongDescription`, `DataSourceTypeId`, `Northing`, `Easting`, `Place`, `NetworkPathReference`, `TransportLinkReference`, `TypeId`, `LinkDistance`, `IPAddress`, `Port`, `CreationDate`, `DeletionDate`, `QualityStatementId`, `DummyId`, `LastUpdated`, `Active`) VALUES
('VMS-001', 'Envoy VMS 1W', 'VMS device manufactured by Microprocessador.', 0, 24.148936, 88.189386, 'CH-206+050', '', '', 2, NULL, '192.168.1.230', 6001, '2015-01-29 20:10:00', '0000-00-00 00:00:00', 0, 1, '2016-06-09 14:42:34', 1),
('VMS-002', 'Envoy VMS 1W', 'VMS device manufactured by Microprocessador.', 0, 24.154474, 88.181245, 'CH-207+050', '', '', 2, NULL, '192.168.1.231', 6001, '2015-01-29 20:17:00', '0000-00-00 00:00:00', 0, 2, '2016-06-09 14:42:42', 1),
('VMS-003', 'Envoy VMS 1W', 'VMS device manufactured by Microprocessador.', 0, 24.550909, 88.026842, 'CH-260+350', '', '', 2, NULL, '192.168.1.232', 6001, '2015-01-29 20:18:00', '0000-00-00 00:00:00', 0, 3, '2016-06-09 14:42:50', 0),
('VMS-004', 'Envoy VMS 1W', 'VMS-4', 0, 24.557644, 88.020905, 'CH-261+350', '', '', NULL, NULL, '192.168.1.233', 6001, '2016-01-05 21:13:29', '0000-00-00 00:00:00', 0, NULL, '2016-06-09 14:43:03', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_type`
--
ALTER TABLE `accident_type`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `htms_services`
--
ALTER TABLE `htms_services`
  ADD PRIMARY KEY (`Service_ID`);

--
-- Indexes for table `mapping_user`
--
ALTER TABLE `mapping_user`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `nms_ip_address`
--
ALTER TABLE `nms_ip_address`
  ADD PRIMARY KEY (`RowId`);

--
-- Indexes for table `re_actions`
--
ALTER TABLE `re_actions`
  ADD PRIMARY KEY (`DummyId`),
  ADD UNIQUE KEY `DummyId` (`DummyId`);

--
-- Indexes for table `re_rules`
--
ALTER TABLE `re_rules`
  ADD PRIMARY KEY (`DummyId`),
  ADD UNIQUE KEY `DummyId` (`DummyId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`RuleID`);

--
-- Indexes for table `tis_accident_action_relation`
--
ALTER TABLE `tis_accident_action_relation`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tis_accident_action_setup`
--
ALTER TABLE `tis_accident_action_setup`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tis_accident_type_setup`
--
ALTER TABLE `tis_accident_type_setup`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tis_detector_auto_rep`
--
ALTER TABLE `tis_detector_auto_rep`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tis_detector_dynamic_vbv`
--
ALTER TABLE `tis_detector_dynamic_vbv`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tis_detector_dynamic_vbv_archived`
--
ALTER TABLE `tis_detector_dynamic_vbv_archived`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tis_maintenance_sr`
--
ALTER TABLE `tis_maintenance_sr`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tis_meteorological_auto_rep`
--
ALTER TABLE `tis_meteorological_auto_rep`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tis_vehicle_setup`
--
ALTER TABLE `tis_vehicle_setup`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_login_logout`
--
ALTER TABLE `user_login_logout`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `utmc_accident_relation`
--
ALTER TABLE `utmc_accident_relation`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `utmc_accident_types`
--
ALTER TABLE `utmc_accident_types`
  ADD UNIQUE KEY `id` (`accident_type_id`);

--
-- Indexes for table `utmc_cctv_config`
--
ALTER TABLE `utmc_cctv_config`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`),
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_cctv_dynamic`
--
ALTER TABLE `utmc_cctv_dynamic`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`),
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_cctv_static`
--
ALTER TABLE `utmc_cctv_static`
  ADD PRIMARY KEY (`SystemCodeNumber`);

--
-- Indexes for table `utmc_detector_profile`
--
ALTER TABLE `utmc_detector_profile`
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `ProfileId_2` (`ProfileId`);

--
-- Indexes for table `utmc_detector_profile_data`
--
ALTER TABLE `utmc_detector_profile_data`
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `ProfileId_2` (`ProfileId`);

--
-- Indexes for table `utmc_event_relation`
--
ALTER TABLE `utmc_event_relation`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `utmc_event_types`
--
ALTER TABLE `utmc_event_types`
  ADD UNIQUE KEY `id` (`accident_type_id`);

--
-- Indexes for table `utmc_incident_relation`
--
ALTER TABLE `utmc_incident_relation`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `utmc_incident_types`
--
ALTER TABLE `utmc_incident_types`
  ADD UNIQUE KEY `id` (`accident_type_id`);

--
-- Indexes for table `utmc_meteorological_config`
--
ALTER TABLE `utmc_meteorological_config`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`),
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_meteorological_dynamic`
--
ALTER TABLE `utmc_meteorological_dynamic`
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_meteorological_profile`
--
ALTER TABLE `utmc_meteorological_profile`
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `ProfileId_2` (`ProfileId`);

--
-- Indexes for table `utmc_meteorological_profile_data`
--
ALTER TABLE `utmc_meteorological_profile_data`
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `ProfileId_2` (`ProfileId`);

--
-- Indexes for table `utmc_meteorological_static`
--
ALTER TABLE `utmc_meteorological_static`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_roadwork_relation`
--
ALTER TABLE `utmc_roadwork_relation`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `utmc_roadwork_types`
--
ALTER TABLE `utmc_roadwork_types`
  ADD UNIQUE KEY `id` (`accident_type_id`);

--
-- Indexes for table `utmc_signal_profile_cycles`
--
ALTER TABLE `utmc_signal_profile_cycles`
  ADD PRIMARY KEY (`CycleID`);

--
-- Indexes for table `utmc_traffic_signal_groups`
--
ALTER TABLE `utmc_traffic_signal_groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `utmc_traffic_signal_groups_plans`
--
ALTER TABLE `utmc_traffic_signal_groups_plans`
  ADD PRIMARY KEY (`PlanID`);

--
-- Indexes for table `utmc_traffic_signal_plans_stages`
--
ALTER TABLE `utmc_traffic_signal_plans_stages`
  ADD PRIMARY KEY (`StageID`);

--
-- Indexes for table `utmc_traffic_signal_static`
--
ALTER TABLE `utmc_traffic_signal_static`
  ADD PRIMARY KEY (`SignalID`);

--
-- Indexes for table `utmc_traffic_signal_static_links`
--
ALTER TABLE `utmc_traffic_signal_static_links`
  ADD PRIMARY KEY (`LinkID`);

--
-- Indexes for table `utmc_vms_config`
--
ALTER TABLE `utmc_vms_config`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`),
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_vms_dynamic`
--
ALTER TABLE `utmc_vms_dynamic`
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- Indexes for table `utmc_vms_messages_support_static`
--
ALTER TABLE `utmc_vms_messages_support_static`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `utmc_vms_message_list_support_static`
--
ALTER TABLE `utmc_vms_message_list_support_static`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `utmc_vms_static`
--
ALTER TABLE `utmc_vms_static`
  ADD UNIQUE KEY `SystemCodeNumber` (`SystemCodeNumber`),
  ADD KEY `SystemCodeNumber_2` (`SystemCodeNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_type`
--
ALTER TABLE `accident_type`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `htms_services`
--
ALTER TABLE `htms_services`
  MODIFY `Service_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `nms_ip_address`
--
ALTER TABLE `nms_ip_address`
  MODIFY `RowId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `re_actions`
--
ALTER TABLE `re_actions`
  MODIFY `DummyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `re_rules`
--
ALTER TABLE `re_rules`
  MODIFY `DummyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `RuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tis_accident_action_relation`
--
ALTER TABLE `tis_accident_action_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tis_accident_action_setup`
--
ALTER TABLE `tis_accident_action_setup`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tis_accident_type_setup`
--
ALTER TABLE `tis_accident_type_setup`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tis_detector_auto_rep`
--
ALTER TABLE `tis_detector_auto_rep`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tis_detector_dynamic_vbv`
--
ALTER TABLE `tis_detector_dynamic_vbv`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tis_detector_dynamic_vbv_archived`
--
ALTER TABLE `tis_detector_dynamic_vbv_archived`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204080;
--
-- AUTO_INCREMENT for table `tis_maintenance_sr`
--
ALTER TABLE `tis_maintenance_sr`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=852;
--
-- AUTO_INCREMENT for table `tis_meteorological_auto_rep`
--
ALTER TABLE `tis_meteorological_auto_rep`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tis_vehicle_setup`
--
ALTER TABLE `tis_vehicle_setup`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `user_login_logout`
--
ALTER TABLE `user_login_logout`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `utmc_accident_relation`
--
ALTER TABLE `utmc_accident_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `utmc_accident_types`
--
ALTER TABLE `utmc_accident_types`
  MODIFY `accident_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `utmc_detector_profile_data`
--
ALTER TABLE `utmc_detector_profile_data`
  MODIFY `ProfileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `utmc_event_relation`
--
ALTER TABLE `utmc_event_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `utmc_event_types`
--
ALTER TABLE `utmc_event_types`
  MODIFY `accident_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `utmc_incident_relation`
--
ALTER TABLE `utmc_incident_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utmc_incident_types`
--
ALTER TABLE `utmc_incident_types`
  MODIFY `accident_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `utmc_meteorological_profile_data`
--
ALTER TABLE `utmc_meteorological_profile_data`
  MODIFY `ProfileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `utmc_roadwork_relation`
--
ALTER TABLE `utmc_roadwork_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utmc_roadwork_types`
--
ALTER TABLE `utmc_roadwork_types`
  MODIFY `accident_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `utmc_vms_messages_support_static`
--
ALTER TABLE `utmc_vms_messages_support_static`
  MODIFY `MessageID` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `utmc_vms_message_list_support_static`
--
ALTER TABLE `utmc_vms_message_list_support_static`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mapping_user`
--
ALTER TABLE `mapping_user`
  ADD CONSTRAINT `mapping_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`id`),
  ADD CONSTRAINT `mapping_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
