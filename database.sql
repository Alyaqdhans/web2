-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2021 at 08:05 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ims`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryCode` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Category Code',
  `categoryDesc` char(50) DEFAULT NULL COMMENT 'Category Description',
  PRIMARY KEY (`categoryCode`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryCode`, `categoryDesc`) VALUES
(1, 'Computers'),
(2, 'Electrical'),
(3, 'Food'),
(4, 'Furniture'),
(5, 'Stationary'),
(6, 'Household');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerId` int(11) NOT NULL,
  `customerName` char(35) DEFAULT NULL,
  `CustomerType` char(1) DEFAULT NULL,
  `customerPhone` char(10) DEFAULT NULL,
  `customerAddress` char(50) DEFAULT NULL,
  `customerGSM` int(11) DEFAULT NULL,
  `customerEmail` char(50) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `customerName`, `CustomerType`, `customerPhone`, `customerAddress`, `customerGSM`, `customerEmail`) VALUES
(1, 'Cash Customer', 'I', '', '', 0, ''),
(11000, 'Administrative Dpt.', 'D', '112', '', 0, ''),
(11001, 'IT Dpt.', 'D', '134', '', 0, ''),
(11002, 'Engineering Dpt.', 'D', '122', '', 0, ''),
(11003, 'Business Studies Dpt.', 'D', '157', '', 0, ''),
(11004, 'Student Affiras Dpt.', 'D', '118', '', 0, ''),
(11005, 'Finance Dpt.', 'D', '114', '', 0, ''),
(12001, 'Sami K. Mustafa', 'I', '132', '', 0, ''),
(12002, 'Mr. Sajan Mathew', 'I', '134', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE IF NOT EXISTS `issues` (
  `issueSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'issue Seq no',
  `issueItemCode` char(8) NOT NULL COMMENT 'Item Code issued',
  `issueCustomerId` int(11) NOT NULL COMMENT 'customer id',
  `issueDate` date DEFAULT NULL COMMENT 'Issue date',
  `issueQty` int(11) DEFAULT NULL COMMENT 'quantity issued',
  `issueItemPrice` double DEFAULT NULL COMMENT 'Price of Item issued',
  `issueInvoiceNo` int(11) DEFAULT NULL COMMENT 'Invoice no',
  `issueInvoiceDate` date DEFAULT NULL COMMENT 'Invoice date',
  `issuieItemCost` double DEFAULT NULL COMMENT 'cost of Item issued',
  `issueShpmntBy` int(11) DEFAULT NULL COMMENT 'shipment id',
  `issueComment` varchar(50) DEFAULT NULL COMMENT 'Comment',
  `issueDateTime` date DEFAULT NULL COMMENT 'Date and Time of Data Entery',
  PRIMARY KEY (`issueSeq`),
  KEY `issueCustomerId` (`issueCustomerId`) USING BTREE,
  KEY `issueItemCode` (`issueItemCode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issueSeq`, `issueItemCode`, `issueCustomerId`, `issueDate`, `issueQty`, `issueItemPrice`, `issueInvoiceNo`, `issueInvoiceDate`, `issuieItemCost`, `issueShpmntBy`, `issueComment`, `issueDateTime`) VALUES
(1, '04-00008', 11000, '2015-05-01', 1, NULL, 123, NULL, NULL, 3, NULL, '0000-00-00'),
(2, '04-00002', 11002, '2010-04-30', 5, NULL, 23, NULL, NULL, 1, NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `iCode` char(8) NOT NULL COMMENT 'Item Code',
  `iCategoryCode` int(11) NOT NULL COMMENT 'icut Category Code',
  `iDesc` char(50) DEFAULT NULL COMMENT 'Item Description',
  `iSpec` char(50) DEFAULT NULL COMMENT 'Item Specification',
  `iQtyOnHand` int(11) NOT NULL DEFAULT '0' COMMENT 'Quantity On Hand',
  `iStorageLoc` char(50) DEFAULT NULL COMMENT 'Storage Location',
  `iCost` double DEFAULT NULL COMMENT 'Item Cost',
  `iPrice` double NOT NULL DEFAULT '0' COMMENT 'Item Price',
  `iLastSupplierId` int(11) DEFAULT NULL COMMENT 'Last Supplier ID',
  `iStatus` char(1) DEFAULT NULL COMMENT 'Status of Item (A:Active,N:Not)',
  `iLastCustomerId` int(11) DEFAULT NULL COMMENT 'Last Customer Id',
  `iQtyLastPurchased` int(11) DEFAULT NULL COMMENT 'Last Quantity Purchases',
  `iQtyLastIssued` int(11) DEFAULT NULL COMMENT 'Last Quantity Issued',
  `iDateLastIssued` date DEFAULT NULL COMMENT 'Last Date Item Issued',
  `iDateLastPurchased` date DEFAULT NULL COMMENT 'Last Date Item Purchased',
  PRIMARY KEY (`iCode`),
  KEY `iLastCustomerId` (`iLastCustomerId`),
  KEY `iLastSupplierId` (`iLastSupplierId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`iCode`, `iCategoryCode`, `iDesc`, `iSpec`, `iQtyOnHand`, `iStorageLoc`, `iCost`, `iPrice`, `iLastSupplierId`, `iStatus`, `iLastCustomerId`, `iQtyLastPurchased`, `iQtyLastIssued`, `iDateLastIssued`, `iDateLastPurchased`) VALUES
('04-00001', 4, 'Chair, Manager', '', 0, 'Workshop-L', 216.678, 281.681, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00002', 4, 'Chair, Plastic', '', 50, 'Workshop-L', 54.419, 70.744, 1018, 'A', 11002, 0, 0, '1975-03-04', '0000-00-00'),
('04-00003', 4, 'Chair, Office', '', 8, 'Workshop-L', 133.762, 173.891, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00004', 4, 'Chair, Teacher', '', 0, 'Workshop-L', 271.582, 353.057, 1003, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00005', 4, 'Chair, Lab', '', 13, 'Workshop-L', 45.752, 59.477, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00006', 4, 'Chair, Writing/Classroom', '', 28, 'Workshop-L', 271.676, 353.179, 1003, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00007', 4, 'Desk, Student-Normal', '', 10, 'Workshop-L', 81.397, 105.816, 1003, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00008', 4, 'Desk, Teacher', '', 5, 'Workshop-L', 179.699, 233.609, 1001, 'A', 11000, 0, 0, '1970-03-03', '0000-00-00'),
('04-00009', 4, 'Desk, Manager', '', 1, 'Workshop-L', 67.753, 88.078, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00010', 4, 'Desk, Director', '', 0, 'Workshop-L', 105.189, 136.746, 1005, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00012', 4, 'Desk, Office', '', 3, 'Workshop-L', 197.864, 257.224, 1004, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00013', 4, 'Table, Small square', '', 5, 'Workshop-R', 287.226, 373.393, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00014', 4, 'Table, Large', '', 2, 'Workshop-R', 280.725, 364.943, 1001, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00015', 4, 'Table, Library', '', 0, 'Workshop-R', 161.653, 210.149, 1001, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00016', 4, 'Table, Computer', '', 0, 'Workshop-R', 131.241, 170.613, 1004, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00017', 4, 'Cabinet, File storage', '', 2, 'Workshop-M', 287.969, 374.359, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00018', 4, 'Cabinet, Steel storage', '', 4, 'Workshop-M', 201.701, 262.211, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00019', 4, 'Cabinet, Wooden storage', '', 1, 'Workshop-M', 209.292, 272.079, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00020', 4, 'Cabinet, Glass fronted', '', 0, 'Workshop-M', 119.963, 155.952, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00021', 4, 'Bed', '', 1, 'Workshop-R', 157.848, 205.202, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00022', 4, 'Table, Dressing', '', 1, 'Workshop-R', 223.03, 289.94, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00023', 4, 'Cupboard, Stand', '', 1, 'Workshop-R', 233.927, 304.105, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00024', 4, 'Cupboard, Mini', '', 1, 'Workshop-R', 167.004, 217.105, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00025', 4, 'Wardrobe, Large', '', 1, 'Workshop-R', 173.813, 225.957, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00026', 4, 'Wardrobe, Small', '', 1, 'Workshop-R', 82.794, 107.633, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00027', 4, 'Chair, Stool', '', 1, 'Workshop-R', 36.858, 47.916, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00028', 4, 'Bedroom, Italy - Brown', '', 1, 'Workshop-R', 246.393, 320.311, 1002, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00029', 4, 'Bedroom, Local - White', '', 1, 'Workshop-R', 165.757, 215.485, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00030', 4, 'Bed', '', 1, 'Workshop-R', 24.993, 32.49, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00031', 4, 'Cupboard, Stand', '', 1, 'Workshop-R', 239.069, 310.79, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00032', 4, 'Table, Dressing', '', 1, 'Workshop-R', 221.983, 288.578, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00033', 4, 'Chair, Stool', '', 1, 'Workshop-R', 271.577, 353.05, 1018, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('04-00034', 4, 'Bed', '', 1, 'Workshop-R', 290.828, 378.076, 1004, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00001', 5, 'Equipment, Pencil sharpener', '', 5, 'L02-02', 259.47, 337.311, 1003, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00002', 5, 'Equipment, Ruler', '', 13, 'L02-02', 275.031, 357.541, 1005, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00003', 5, 'Equipment, Rubber', '', 20, 'L02-02', 290.153, 377.199, 1007, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00004', 5, 'Equipment, Pen', '', 120, 'L02-02', 119.583, 155.458, 1007, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00005', 5, 'Paper, Folder', '', 280, 'Small store', 260.047, 338.061, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00006', 5, 'Paper, White A4', '', 150, 'Small store', 36.844, 47.897, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00007', 5, 'Paper, Colored A4', '', 12, 'Small store', 106.116, 137.95, 1007, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00008', 5, 'Paper, Notepad A5', '', 30, 'Small store', 153.435, 199.465, 1007, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00009', 5, 'Paper, Notepad A4', '', 90, 'Small store', 251.492, 326.94, 1007, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00010', 5, 'Media, Flash Memory-4GB', '', 140, 'L02-01', 99.179, 128.932, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00011', 5, 'Media, CD - 800MB', '', 25, 'L02-01', 170.687, 221.893, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('05-00012', 5, 'Media, DVD', '', 60, 'L02-01', 59.716, 77.631, 1005, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00001', 1, 'Printers, Dot matrix', '', 10, 'R02-02', 240.865, 313.125, 1008, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00002', 1, 'Printers, Small laser', '', 18, 'R02-01', 160.697, 208.906, 1008, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00003', 1, 'Printers, Big laser, HP laserjet', '', 7, 'R02-01', 179.892, 233.859, 1009, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00004', 1, 'Printers, Color dot matrix', '', 2, 'R02-01', 189.026, 245.734, 1010, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00005', 1, 'Scanners, A4 scanner', '', 3, 'M01-04', 220.232, 286.302, 1011, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00006', 1, 'Scanners, Hand held', '', 4, 'M01-04', 185.545, 241.208, 1010, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00007', 1, 'PCs, Compaq P4', '', 16, 'M01-03', 249.734, 324.655, 1010, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00008', 1, 'PCs, Compaq P3', '', 5, 'M01-03', 237.75, 309.075, 1011, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00009', 1, 'PCs, Compaq P2', '', 2, 'M01-02', 242.099, 314.728, 1012, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('01-00010', 1, 'PCs, Acer Notebook', '', 4, 'M01-01', 179.642, 233.534, 1008, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00001', 2, 'OHP, Spare bulbs', '', 6, 'R02-01', 93.894, 122.062, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00002', 2, 'OHP, Complete', '', 6, 'L01-03', 190.041, 247.053, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00003', 2, 'OHP, Cable', '', 45, 'L01-02', 150.587, 195.763, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00004', 2, 'Data Show, Panasonic', '', 3, 'L01-02', 9.453, 12.289, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00005', 2, 'Data Show, ASK', '', 3, 'L01-02', 144.481, 187.825, 1006, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00006', 2, 'Refrigerator, Large', '', 8, 'Store2-R', 221.918, 288.493, 1012, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00007', 2, 'Refrigerator, Small', '', 2, 'Store2-R', 222.929, 289.807, 1012, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00008', 2, 'Refrigerator, Table top', '', 3, 'Store2-R', 120.599, 156.779, 1012, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00009', 2, 'Air conditioners, National', '', 15, 'Store2-L', 205.83, 267.579, 1020, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00010', 2, 'Air conditioners, LG', '', 3, 'Sotre2-L', 48.705, 63.316, 1020, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00011', 2, 'TV, Small 21 inch', '', 8, 'L01-01', 64.616, 84.001, 1013, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00012', 2, 'TV, Big 29 inch', '', 3, 'L01-01', 274.991, 357.489, 1014, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('02-00013', 2, 'TV, Projection', '', 4, 'L01-01', 191.883, 249.448, 1013, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00001', 3, 'Tea, Mumtaz', '', 14, 'R01-02', 254.14, 330.383, 1015, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00002', 3, 'Tea, Lipton', '', 0, 'R01-02', 145.264, 188.843, 1017, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00003', 3, 'Milk, Small can', '', 30, 'R01-02', 243.619, 316.704, 1015, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00004', 3, 'Milk, Large can', '', 12, 'R01-02', 62.395, 81.114, 1015, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00005', 3, 'Coffee, Omani', '', 6, 'R01-01', 298.036, 387.446, 1017, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00006', 3, 'Coffee, American', '', 2, 'R01-01', 246.524, 320.482, 1017, 'A', 0, 0, 0, '0000-00-00', '0000-00-00'),
('03-00007', 3, 'Coffee, Turkish', '', 0, 'R01-01', 278.749, 362.373, 1015, 'A', 0, 0, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `purchSeq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Purchase Seq no.',
  `purchItemCode` char(8) NOT NULL COMMENT 'item Code purchased',
  `purchSuppID` int(11) NOT NULL COMMENT 'Supplier Id',
  `purchQty` int(11) DEFAULT NULL COMMENT 'Quantity purchased',
  `purchOrderNo` int(11) DEFAULT NULL COMMENT 'Order No',
  `purchOrderDate` date DEFAULT NULL COMMENT 'Order Date ',
  `purchDate` date DEFAULT NULL COMMENT 'Purchase Date',
  `purchItemCost` double DEFAULT NULL COMMENT 'item Cost',
  `purchComment` varchar(50) DEFAULT NULL COMMENT 'comment',
  `purchDateTime` datetime DEFAULT NULL COMMENT 'entry date to system',
  PRIMARY KEY (`purchSeq`),
  KEY `PurchItemCode` (`purchItemCode`) USING BTREE,
  KEY `purchSuppId` (`purchSuppID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchSeq`, `purchItemCode`, `purchSuppID`, `purchQty`, `purchOrderNo`, `purchOrderDate`, `purchDate`, `purchItemCost`, `purchComment`, `purchDateTime`) VALUES
(1, '04-00010', 1005, 70, NULL, '0000-00-00', NULL, NULL, NULL, NULL),
(2, '04-00001', 1018, 99, NULL, '0000-00-00', NULL, NULL, NULL, NULL),
(3, 'Chair,', 1018, 99, NULL, '2015-07-01', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplierId` int(11) NOT NULL DEFAULT '0',
  `supplierName` char(35) DEFAULT NULL,
  `supplierAddress` char(40) DEFAULT NULL,
  `supplierPhone` char(10) DEFAULT NULL,
  `supplierEmail` char(50) DEFAULT NULL,
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplierId`, `supplierName`, `supplierAddress`, `supplierPhone`, `supplierEmail`) VALUES
(1001, 'Teejan', 'Nizwa - Firq', '4125325', ''),
(1002, 'Fahmi Furniture', 'Muscat - Al khuwair', '968213', ''),
(1003, 'Lo\'ay International', 'Muscat - Ruwi', '9685452', ''),
(1004, 'Sarco', 'Muscat', '', ''),
(1005, 'Al Khaleej Corner', 'Muscat', '', ''),
(1006, 'Office Supplies', 'Muscat', '', ''),
(1007, 'Sofan', 'Muscat', '', ''),
(1008, 'Saud Bahwan', 'Muscat', '', ''),
(1009, 'Towel Center', 'Muscat', '', ''),
(1010, 'Computer Services Center', 'Muscat', '', ''),
(1011, 'Kimji Ramdas', 'Muscat', '', ''),
(1012, 'Mustafa Sultan', 'Muscat', '', ''),
(1013, 'Al Hasshar', 'Muscat', '', ''),
(1014, 'Al Tale\'', 'Nizwa', '4245321', ''),
(1015, 'Al Kimyani Store', 'Nizwa', '4245345', ''),
(1016, 'Daris Cold Sotore', 'Nizwa', '', ''),
(1017, 'Al Jazeera Cold Store', 'Nizwa', '', ''),
(1018, 'Golden Co.', 'Muscat', '953542', ''),
(1020, 'Muscat Electronics', 'Muscat', '', '');
COMMIT;



CREATE TABLE `usrdt` (
  `usrid` smallint(6) NOT NULL DEFAULT '0',
  `usrpswd` varchar(50) DEFAULT NULL,
  `usrname` varchar(35) DEFAULT NULL,
  `usremail` varchar(35) DEFAULT NULL,
  `usrtype` char(1) DEFAULT NULL,
  `usrlastlogindate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usrdt`
--

INSERT INTO `usrdt` (`usrid`, `usrpswd`, `usrname`, `usremail`, `usrtype`, `usrlastlogindate`) VALUES
(100, '*E6CC90B878B948C35E92B003C792C46C58C4AF40', 'Salim Nasser', 'salim@gmail.com', 'A', '2022-12-01 09:30:05'),
(200, '*12033B78389744F3F39AC4CE4CCFCAD6960D8EA0', 'Khalid Ali', 'khalid@yahoo.com', 'N', '2022-11-20 20:43:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usrdt`
--
ALTER TABLE `usrdt`
  ADD PRIMARY KEY (`usrid`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
