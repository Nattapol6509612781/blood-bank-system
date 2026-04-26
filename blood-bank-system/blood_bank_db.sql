-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2026 at 08:16 AM
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
-- Database: `blood_bank_db`
--
CREATE DATABASE IF NOT EXISTS `blood_bank_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blood_bank_db`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `Appointment_ID` varchar(6) NOT NULL,
  `AppointmentStatus` varchar(20) NOT NULL DEFAULT 'Booked',
  `BookingDate` date NOT NULL,
  `Donor_ID` varchar(6) DEFAULT NULL,
  `Slot_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointmentslot`
--

DROP TABLE IF EXISTS `appointmentslot`;
CREATE TABLE `appointmentslot` (
  `Slot_ID` varchar(6) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `SlotDate` date NOT NULL,
  `AvailableCount` int(11) NOT NULL,
  `Center_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointmentslot`
--

INSERT INTO `appointmentslot` (`Slot_ID`, `Capacity`, `StartTime`, `EndTime`, `SlotDate`, `AvailableCount`, `Center_ID`) VALUES
('SL0001', 20, '08:00:00', '10:00:00', '2026-04-25', 20, 'C00001'),
('SL0002', 20, '10:00:00', '12:00:00', '2026-04-25', 20, 'C00001'),
('SL0003', 20, '13:00:00', '15:00:00', '2026-04-25', 20, 'C00001'),
('SL0004', 20, '08:00:00', '10:00:00', '2026-04-26', 20, 'C00001'),
('SL0005', 20, '10:00:00', '12:00:00', '2026-04-26', 20, 'C00001'),
('SL0006', 30, '09:00:00', '12:00:00', '2026-04-25', 30, 'C00002'),
('SL0007', 30, '13:00:00', '16:00:00', '2026-04-25', 30, 'C00002');

-- --------------------------------------------------------

--
-- Table structure for table `bloodbag`
--

DROP TABLE IF EXISTS `bloodbag`;
CREATE TABLE `bloodbag` (
  `Bag_ID` varchar(6) NOT NULL,
  `BloodStatus` varchar(20) NOT NULL DEFAULT 'Pending Screening',
  `ReceiveDate` date NOT NULL,
  `ExpiryDate` date NOT NULL,
  `BloodType` varchar(5) DEFAULT NULL,
  `Donation_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloodbankadmin`
--

DROP TABLE IF EXISTS `bloodbankadmin`;
CREATE TABLE `bloodbankadmin` (
  `Admin_ID` varchar(6) NOT NULL,
  `AdminName` varchar(100) NOT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Account_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodbankadmin`
--

INSERT INTO `bloodbankadmin` (`Admin_ID`, `AdminName`, `Position`, `Phone`, `Account_ID`) VALUES
('A00001', 'สมชาย ใจดี', 'ผู้จัดการคลังเลือด', '081-234-5678', 'UA0001');

-- --------------------------------------------------------

--
-- Table structure for table `bloodrequest`
--

DROP TABLE IF EXISTS `bloodrequest`;
CREATE TABLE `bloodrequest` (
  `Request_ID` varchar(6) NOT NULL,
  `UnitRequested` int(11) NOT NULL,
  `RequireBloodType` varchar(5) DEFAULT NULL,
  `RequestDate` date NOT NULL,
  `RequestStatus` varchar(20) NOT NULL DEFAULT 'Pending',
  `Hospital_ID` varchar(6) DEFAULT NULL,
  `Staff_ID` varchar(6) DEFAULT NULL,
  `RejectReason` varchar(500) DEFAULT NULL,
  `PriorityLevel` varchar(20) DEFAULT 'Normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloodscreening`
--

DROP TABLE IF EXISTS `bloodscreening`;
CREATE TABLE `bloodscreening` (
  `Screening_ID` varchar(6) NOT NULL,
  `Donation_ID` varchar(6) DEFAULT NULL,
  `ScreeningDate` date NOT NULL,
  `HIV_Test` varchar(20) DEFAULT NULL,
  `HBV_Test` varchar(20) DEFAULT NULL,
  `HCV_Test` varchar(20) DEFAULT NULL,
  `Syphilis_Test` varchar(20) DEFAULT NULL,
  `Malaria_Test` varchar(20) DEFAULT NULL,
  `HTLV_Test` varchar(20) DEFAULT NULL,
  `BloodGroup_Verify` varchar(5) DEFAULT NULL,
  `RH_Factor` varchar(10) DEFAULT NULL,
  `Hemoglobin` float DEFAULT NULL,
  `OverallResult` varchar(20) DEFAULT NULL,
  `IsSafeForTransfusion` tinyint(1) DEFAULT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `Tested_By` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation` (
  `Donation_ID` varchar(6) NOT NULL,
  `DonationResult` varchar(20) DEFAULT NULL,
  `Donation_Date` date NOT NULL,
  `Donor_ID` varchar(6) DEFAULT NULL,
  `Appointment_ID` varchar(6) DEFAULT NULL,
  `Note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donationcenter`
--

DROP TABLE IF EXISTS `donationcenter`;
CREATE TABLE `donationcenter` (
  `Center_ID` varchar(6) NOT NULL,
  `Center_Name` varchar(200) NOT NULL,
  `Location` varchar(500) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donationcenter`
--

INSERT INTO `donationcenter` (`Center_ID`, `Center_Name`, `Location`, `Phone`) VALUES
('C00001', 'ศูนย์บริจาคเลือด มธ. รังสิต', '99 ม.18 ต.คลองหนึ่ง อ.คลองหลวง จ.ปทุมธานี', '02-926-9999'),
('C00002', 'ศูนย์บริจาคเลือดสภากาชาดไทย', '1871 ถ.อังรีดูนังต์ แขวงปทุมวัน กรุงเทพ', '02-256-4300'),
('C00003', 'ศูนย์บริจาคเลือด รพ.รามาธิบดี', '270 ถ.พระรามที่ 6 กรุงเทพ', '02-201-2222');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE `donor` (
  `Donor_ID` varchar(6) NOT NULL,
  `Citizen_ID` varchar(13) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `BloodType` varchar(5) DEFAULT NULL,
  `Account_ID` varchar(6) DEFAULT NULL,
  `UnderlyingDisease` varchar(500) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergencyannounce`
--

DROP TABLE IF EXISTS `emergencyannounce`;
CREATE TABLE `emergencyannounce` (
  `Alert_ID` varchar(6) NOT NULL,
  `AnnounceFrom` varchar(100) DEFAULT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `BloodType` varchar(5) DEFAULT NULL,
  `AlertStatus` varchar(20) NOT NULL DEFAULT 'Active',
  `Admin_ID` varchar(6) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `Hospital_ID` varchar(6) NOT NULL,
  `Hospital_Name` varchar(200) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`Hospital_ID`, `Hospital_Name`, `Address`, `Phone`) VALUES
('H00001', 'โรงพยาบาลธรรมศาสตร์เฉลิมพระเกียรติ', '99 ม.18 ต.คลองหนึ่ง อ.คลองหลวง จ.ปทุมธานี 12120', '02-926-9999'),
('H00002', 'โรงพยาบาลรามาธิบดี', '270 ถ.พระรามที่ 6 แขวงทุ่งพญาไท เขตราษฎร์บูรณะ กรุงเทพ 10400', '02-201-1000'),
('H00003', 'โรงพยาบาลศิริราช', '2 ถ.วังหลัง แขวงศิริราช เขตบางกอกน้อย กรุงเทพ 10700', '02-419-7000'),
('H00004', 'โรงพยาบาลจุฬาลงกรณ์', '1873 ถ.พระรามที่ 4 แขวงปทุมวัน เขตปทุมวัน กรุงเทพ 10330', '02-256-4000');

-- --------------------------------------------------------

--
-- Table structure for table `hospitalstaff`
--

DROP TABLE IF EXISTS `hospitalstaff`;
CREATE TABLE `hospitalstaff` (
  `Staff_ID` varchar(6) NOT NULL,
  `Staff_Name` varchar(100) NOT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Hospital_ID` varchar(6) DEFAULT NULL,
  `Account_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `Notification_ID` varchar(6) NOT NULL,
  `SentAt` datetime NOT NULL,
  `NotificationStatus` varchar(20) NOT NULL DEFAULT 'Sent',
  `Alert_ID` varchar(6) DEFAULT NULL,
  `Donor_ID` varchar(6) DEFAULT NULL,
  `Channel` varchar(50) DEFAULT 'Email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE `shipment` (
  `Shipment_ID` varchar(6) NOT NULL,
  `ShipmentDate` date NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `ShipmentStatus` varchar(20) NOT NULL DEFAULT 'Preparing',
  `DeliveryNote` varchar(500) DEFAULT NULL,
  `Request_ID` varchar(6) DEFAULT NULL,
  `Admin_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipmentdetail`
--

DROP TABLE IF EXISTS `shipmentdetail`;
CREATE TABLE `shipmentdetail` (
  `Shipment_ID` varchar(6) NOT NULL,
  `Bag_ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `Account_ID` varchar(6) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `AccountStatus` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useraccount`
--

INSERT INTO `useraccount` (`Account_ID`, `Email`, `Password`, `Role`, `AccountStatus`) VALUES
('UA0001', 'admin@bloodcare.com', '$2b$10$hashedpassword', 'Admin', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Appointment_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`),
  ADD KEY `Slot_ID` (`Slot_ID`);

--
-- Indexes for table `appointmentslot`
--
ALTER TABLE `appointmentslot`
  ADD PRIMARY KEY (`Slot_ID`),
  ADD KEY `Center_ID` (`Center_ID`);

--
-- Indexes for table `bloodbag`
--
ALTER TABLE `bloodbag`
  ADD PRIMARY KEY (`Bag_ID`),
  ADD KEY `Donation_ID` (`Donation_ID`);

--
-- Indexes for table `bloodbankadmin`
--
ALTER TABLE `bloodbankadmin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `Account_ID` (`Account_ID`);

--
-- Indexes for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD PRIMARY KEY (`Request_ID`),
  ADD KEY `Hospital_ID` (`Hospital_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `bloodscreening`
--
ALTER TABLE `bloodscreening`
  ADD PRIMARY KEY (`Screening_ID`),
  ADD KEY `Donation_ID` (`Donation_ID`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`Donation_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`),
  ADD KEY `Appointment_ID` (`Appointment_ID`);

--
-- Indexes for table `donationcenter`
--
ALTER TABLE `donationcenter`
  ADD PRIMARY KEY (`Center_ID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`Donor_ID`),
  ADD UNIQUE KEY `Citizen_ID` (`Citizen_ID`),
  ADD KEY `Account_ID` (`Account_ID`);

--
-- Indexes for table `emergencyannounce`
--
ALTER TABLE `emergencyannounce`
  ADD PRIMARY KEY (`Alert_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Hospital_ID`);

--
-- Indexes for table `hospitalstaff`
--
ALTER TABLE `hospitalstaff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `Hospital_ID` (`Hospital_ID`),
  ADD KEY `Account_ID` (`Account_ID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Notification_ID`),
  ADD KEY `Alert_ID` (`Alert_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`Shipment_ID`),
  ADD KEY `Request_ID` (`Request_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `shipmentdetail`
--
ALTER TABLE `shipmentdetail`
  ADD PRIMARY KEY (`Shipment_ID`,`Bag_ID`),
  ADD KEY `Bag_ID` (`Bag_ID`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`Account_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Slot_ID`) REFERENCES `appointmentslot` (`Slot_ID`);

--
-- Constraints for table `appointmentslot`
--
ALTER TABLE `appointmentslot`
  ADD CONSTRAINT `appointmentslot_ibfk_1` FOREIGN KEY (`Center_ID`) REFERENCES `donationcenter` (`Center_ID`);

--
-- Constraints for table `bloodbag`
--
ALTER TABLE `bloodbag`
  ADD CONSTRAINT `bloodbag_ibfk_1` FOREIGN KEY (`Donation_ID`) REFERENCES `donation` (`Donation_ID`);

--
-- Constraints for table `bloodbankadmin`
--
ALTER TABLE `bloodbankadmin`
  ADD CONSTRAINT `bloodbankadmin_ibfk_1` FOREIGN KEY (`Account_ID`) REFERENCES `useraccount` (`Account_ID`);

--
-- Constraints for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD CONSTRAINT `bloodrequest_ibfk_1` FOREIGN KEY (`Hospital_ID`) REFERENCES `hospital` (`Hospital_ID`),
  ADD CONSTRAINT `bloodrequest_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `hospitalstaff` (`Staff_ID`);

--
-- Constraints for table `bloodscreening`
--
ALTER TABLE `bloodscreening`
  ADD CONSTRAINT `bloodscreening_ibfk_1` FOREIGN KEY (`Donation_ID`) REFERENCES `donation` (`Donation_ID`);

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`);

--
-- Constraints for table `donor`
--
ALTER TABLE `donor`
  ADD CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`Account_ID`) REFERENCES `useraccount` (`Account_ID`);

--
-- Constraints for table `emergencyannounce`
--
ALTER TABLE `emergencyannounce`
  ADD CONSTRAINT `emergencyannounce_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `bloodbankadmin` (`Admin_ID`);

--
-- Constraints for table `hospitalstaff`
--
ALTER TABLE `hospitalstaff`
  ADD CONSTRAINT `hospitalstaff_ibfk_1` FOREIGN KEY (`Hospital_ID`) REFERENCES `hospital` (`Hospital_ID`),
  ADD CONSTRAINT `hospitalstaff_ibfk_2` FOREIGN KEY (`Account_ID`) REFERENCES `useraccount` (`Account_ID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`Alert_ID`) REFERENCES `emergencyannounce` (`Alert_ID`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`Request_ID`) REFERENCES `bloodrequest` (`Request_ID`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `bloodbankadmin` (`Admin_ID`);

--
-- Constraints for table `shipmentdetail`
--
ALTER TABLE `shipmentdetail`
  ADD CONSTRAINT `shipmentdetail_ibfk_1` FOREIGN KEY (`Shipment_ID`) REFERENCES `shipment` (`Shipment_ID`),
  ADD CONSTRAINT `shipmentdetail_ibfk_2` FOREIGN KEY (`Bag_ID`) REFERENCES `bloodbag` (`Bag_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
