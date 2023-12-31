-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 23, 2023 at 06:22 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking.com-1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE `accommodation` (
  `accommodation_id` int(11) NOT NULL,
  `accommodation_name` varchar(255) NOT NULL,
  `date_forsale_from` date NOT NULL,
  `date_forsale_to` date NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `accommodation_type_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accommodation`
--

INSERT INTO `accommodation` (`accommodation_id`, `accommodation_name`, `date_forsale_from`, `date_forsale_to`, `price_per_night`, `quantity`, `accommodation_type_id`, `property_id`) VALUES
(1, 'Double room', '2023-09-28', '2023-09-29', '97.75', 1, 1, 1),
(2, 'Superior Double Room', '2023-05-28', '2023-06-01', '127.80', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_booking`
--

CREATE TABLE `accommodation_booking` (
  `accommodation_booking_id` int(11) NOT NULL,
  `total_accommodation_cost` double(10,2) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_type`
--

CREATE TABLE `accommodation_type` (
  `accommodation_type_id` int(11) NOT NULL,
  `accommodation_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accommodation_type`
--

INSERT INTO `accommodation_type` (`accommodation_type_id`, `accommodation_type_name`) VALUES
(1, 'Hotels'),
(2, 'Apartments');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `city_id` int(11) NOT NULL,
  `country_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_line_1`, `address_line_2`, `postcode`, `latitude`, `longitude`, `city_id`, `country_region_id`) VALUES
(1, 'Butcher Street', '', 'BT48 6HL', 0, 0, 1, 1),
(2, '1 Alexandriagade ', 'Østerbro', '2150', 0, 0, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_made_date` date NOT NULL,
  `booking_start_date` date NOT NULL,
  `booking_duration_nights` int(11) NOT NULL,
  `number_adults` int(11) NOT NULL,
  `number_children` int(11) NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `total_booking_cost` double(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_made_date`, `booking_start_date`, `booking_duration_nights`, `number_adults`, `number_children`, `guest_name`, `total_booking_cost`, `user_id`, `address_id`) VALUES
(1, '2023-08-01', '2023-09-28', 2, 2, 0, 'Caoimhe McKinney', 97.75, 1, 1),
(2, '2023-05-14', '2023-05-28', 5, 1, 0, 'n/a', 639.00, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `booking_line_item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `line_cost` double(10,2) NOT NULL,
  `total_line_cost` double(10,2) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `business_user`
--

CREATE TABLE `business_user` (
  `business_user_id` int(11) NOT NULL,
  `business_number` int(11) NOT NULL,
  `vat_number` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_user`
--

INSERT INTO `business_user` (`business_user_id`, `business_number`, `vat_number`, `first_name`, `last_name`, `email`, `password`, `address_id`) VALUES
(1, 1111, 1111, '', '', '', '', 0),
(2, 2222, 2222, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Derry Londonderry'),
(2, 'Copenhagen');

-- --------------------------------------------------------

--
-- Table structure for table `country_region`
--

CREATE TABLE `country_region` (
  `country_region_id` int(11) NOT NULL,
  `country_region_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_region`
--

INSERT INTO `country_region` (`country_region_id`, `country_region_name`) VALUES
(1, 'United Kingdom'),
(2, 'Denmark');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `currency_shortcode` varchar(255) NOT NULL,
  `currency_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_name`, `currency_shortcode`, `currency_type`) VALUES
(1, 'Pound Sterling', 'GBP', '£'),
(2, 'Euro', 'EUR', '€'),
(3, 'US Dollar', 'USD', '$'),
(4, 'Japanese Yen', 'JPY', '¥');

-- --------------------------------------------------------

--
-- Table structure for table `points_of_interest`
--

CREATE TABLE `points_of_interest` (
  `points_of_interest_id` int(11) NOT NULL,
  `points_of_interest_name` varchar(255) NOT NULL,
  `points_of_interest_latitude` float NOT NULL,
  `points_of_interest_longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_desc` text NOT NULL,
  `address_id` int(11) NOT NULL,
  `business_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_name`, `property_desc`, `address_id`, `business_user_id`) VALUES
(1, 'Maldron Hotel Derry', 'The 4-star Maldron Hotel Derry is located within Derry’s historic city walls, offering luxurious accommodation and easy access to the city’s theatres, restaurants and shops.', 1, 1),
(2, 'Comwell Copenhagen Portside Dolce by Wyndham', 'Comwell Copenhagen Portside Dolce by Wyndham has a fitness centre, garden, a shared lounge and restaurant in Copenhagen. Featuring a bar, the 4-star hotel has air-conditioned rooms with free WiFi, each with a private bathroom. The accommodation features room service, a 24-hour front desk and luggage storage for guests.', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `property_surroundings_distance`
--

CREATE TABLE `property_surroundings_distance` (
  `property_surroundings_distance_id` int(11) NOT NULL,
  `property_surroundings_distance_metres` float NOT NULL,
  `property_id` int(11) NOT NULL,
  `points_of_interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password`, `address_id`) VALUES
(1, 'Jarlath', 'O\'Neill', 'jarlath.oneill95@gmail.com', '', 0),
(2, 'Caoimhe', 'McKinney', 'caoimhemck360@gmail.com', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`accommodation_id`),
  ADD KEY `FK_property_property_id` (`property_id`),
  ADD KEY `FK_accommodation_type_accommodation_type_id` (`accommodation_type_id`);

--
-- Indexes for table `accommodation_booking`
--
ALTER TABLE `accommodation_booking`
  ADD PRIMARY KEY (`accommodation_booking_id`),
  ADD KEY `FK_accommodation_accommodation_id` (`accommodation_id`),
  ADD KEY `FK_booking_booking_id` (`booking_id`);

--
-- Indexes for table `accommodation_type`
--
ALTER TABLE `accommodation_type`
  ADD PRIMARY KEY (`accommodation_type_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_city_city_id` (`city_id`),
  ADD KEY `FK_country_region_country_region_id` (`country_region_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer_customer_id` (`user_id`),
  ADD KEY `FK_address_address_id` (`address_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`booking_line_item_id`),
  ADD KEY `FK_booking_booking_id_two` (`booking_id`),
  ADD KEY `FK_currency_currency_id` (`currency_id`);

--
-- Indexes for table `business_user`
--
ALTER TABLE `business_user`
  ADD PRIMARY KEY (`business_user_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `country_region`
--
ALTER TABLE `country_region`
  ADD PRIMARY KEY (`country_region_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `points_of_interest`
--
ALTER TABLE `points_of_interest`
  ADD PRIMARY KEY (`points_of_interest_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `FK_address_address_id_two` (`address_id`),
  ADD KEY `FK_business_user_business_user_id` (`business_user_id`);

--
-- Indexes for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  ADD PRIMARY KEY (`property_surroundings_distance_id`),
  ADD KEY `FK_points_of_interest_points_of_interest_id` (`points_of_interest_id`),
  ADD KEY `FK_property_property_id_two` (`property_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodation`
--
ALTER TABLE `accommodation`
  MODIFY `accommodation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accommodation_booking`
--
ALTER TABLE `accommodation_booking`
  MODIFY `accommodation_booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accommodation_type`
--
ALTER TABLE `accommodation_type`
  MODIFY `accommodation_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `booking_line_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_user`
--
ALTER TABLE `business_user`
  MODIFY `business_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country_region`
--
ALTER TABLE `country_region`
  MODIFY `country_region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `points_of_interest`
--
ALTER TABLE `points_of_interest`
  MODIFY `points_of_interest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  MODIFY `property_surroundings_distance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD CONSTRAINT `FK_accommodation_type_accommodation_type_id` FOREIGN KEY (`accommodation_type_id`) REFERENCES `accommodation_type` (`accommodation_type_id`),
  ADD CONSTRAINT `FK_property_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `accommodation_booking`
--
ALTER TABLE `accommodation_booking`
  ADD CONSTRAINT `FK_accommodation_accommodation_id` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`),
  ADD CONSTRAINT `FK_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_city_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `FK_country_region_country_region_id` FOREIGN KEY (`country_region_id`) REFERENCES `country_region` (`country_region_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_customer_customer_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD CONSTRAINT `FK_booking_booking_id_two` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_currency_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_address_address_id_two` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_business_user_business_user_id` FOREIGN KEY (`business_user_id`) REFERENCES `business_user` (`business_user_id`);

--
-- Constraints for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  ADD CONSTRAINT `FK_points_of_interest_points_of_interest_id` FOREIGN KEY (`points_of_interest_id`) REFERENCES `points_of_interest` (`points_of_interest_id`),
  ADD CONSTRAINT `FK_property_property_id_two` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
