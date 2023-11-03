-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 03, 2023 at 09:27 AM
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
-- Database: `booking.com-2`
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
  `number_adults` int(11) DEFAULT NULL,
  `number_children` int(11) DEFAULT NULL,
  `accommodation_type_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accommodation`
--

INSERT INTO `accommodation` (`accommodation_id`, `accommodation_name`, `date_forsale_from`, `date_forsale_to`, `price_per_night`, `quantity`, `number_adults`, `number_children`, `accommodation_type_id`, `property_id`) VALUES
(1, 'Quadruple Room', '2024-07-08', '2024-07-12', '138.00', 1, 2, 2, 1, 1),
(2, 'Two-Bedroom Apartment', '2024-07-08', '2024-07-12', '324.40', 1, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_booking`
--

CREATE TABLE `accommodation_booking` (
  `accommodation_booking_id` int(11) NOT NULL,
  `total_accommodation_cost` double(10,2) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_facilities`
--

CREATE TABLE `accommodation_facilities` (
  `accommodation_facilities_id` int(11) NOT NULL,
  `accommodation_facilities_name` varchar(255) NOT NULL,
  `accommodation_id` int(11) NOT NULL
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
(1, 'Hotel'),
(2, 'Apartment');

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
(1, '3 Bd des Artisans', '77700 Bailly-Romainvilliers', '', 48.849, 2.83011, 1, 1),
(2, '19 Avenue Henry Dunant', 'Villiers-sur-Marne', '', 33.3333, 44.4444, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `area_code`
--

CREATE TABLE `area_code` (
  `area_code_id` int(11) NOT NULL,
  `area_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `total_booking_cost` decimal(10,2) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `country_region` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `customer_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `business_user`
--

CREATE TABLE `business_user` (
  `business_user_id` int(11) NOT NULL,
  `business_number` int(11) NOT NULL,
  `vat_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_user`
--

INSERT INTO `business_user` (`business_user_id`, `business_number`, `vat_number`, `user_id`) VALUES
(1, 119, 2034, 8);

-- --------------------------------------------------------

--
-- Table structure for table `card_type`
--

CREATE TABLE `card_type` (
  `card_type_id` int(11) NOT NULL,
  `card_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card_type`
--

INSERT INTO `card_type` (`card_type_id`, `card_type_name`) VALUES
(1, 'American Express'),
(2, 'Mastercard'),
(3, 'Visa');

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
(1, 'Paris');

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
(1, 'France');

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

-- --------------------------------------------------------

--
-- Table structure for table `customer_user`
--

CREATE TABLE `customer_user` (
  `customer_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `genius_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_user`
--

INSERT INTO `customer_user` (`customer_user_id`, `user_id`, `genius_id`) VALUES
(2, 12, 12),
(13, 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_choice` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_choice`) VALUES
(1, 'I am a man'),
(2, 'I am a woman');

-- --------------------------------------------------------

--
-- Table structure for table `genius`
--

CREATE TABLE `genius` (
  `genius_id` int(11) NOT NULL,
  `genius_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genius`
--

INSERT INTO `genius` (`genius_id`, `genius_level`) VALUES
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `guest_review`
--

CREATE TABLE `guest_review` (
  `guest_review_id` int(11) NOT NULL,
  `guest_review_pro` varchar(255) DEFAULT NULL,
  `guest_review_con` varchar(255) DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `guest_country_of_origin` varchar(255) DEFAULT NULL,
  `guest_grouping` varchar(255) DEFAULT NULL,
  `date_stayed` date DEFAULT NULL,
  `number_of_nights_stayed` int(11) DEFAULT NULL,
  `property_response` varchar(255) DEFAULT NULL,
  `guest_score` decimal(10,2) DEFAULT NULL,
  `staff_rating` decimal(2,1) DEFAULT NULL,
  `facilities_rating` decimal(2,1) DEFAULT NULL,
  `cleanliness_rating` decimal(2,1) DEFAULT NULL,
  `comfort_rating` decimal(2,1) DEFAULT NULL,
  `value_for_money_rating` decimal(2,1) DEFAULT NULL,
  `location_rating` decimal(2,1) DEFAULT NULL,
  `free_wifi_rating` decimal(2,1) DEFAULT NULL,
  `overall_guest_review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `house_rules`
--

CREATE TABLE `house_rules` (
  `house_rules_id` int(11) NOT NULL,
  `check_in_time` time DEFAULT NULL,
  `check_out_time` time DEFAULT NULL,
  `cancellation_prepayment` text,
  `children_and_beds` text,
  `age_restriction` text,
  `groups` text,
  `accepted_payment_methods` text,
  `smoking_allowed` tinyint(1) DEFAULT NULL,
  `pets_allowed` tinyint(1) DEFAULT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `house_rules`
--

INSERT INTO `house_rules` (`house_rules_id`, `check_in_time`, `check_out_time`, `cancellation_prepayment`, `children_and_beds`, `age_restriction`, `groups`, `accepted_payment_methods`, `smoking_allowed`, `pets_allowed`, `property_id`) VALUES
(1, NULL, NULL, 'Free cancellation\r\nNo prepayment needed', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, NULL, NULL, 'Free cancellation', NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `images_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `image_alt_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `nationality_id` int(11) NOT NULL,
  `country_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `overall_guest_review`
--

CREATE TABLE `overall_guest_review` (
  `overall_guest_review_id` int(11) NOT NULL,
  `overall_guest_rating` decimal(2,1) DEFAULT NULL,
  `overall_staff_rating` decimal(2,1) DEFAULT NULL,
  `overall_facilities_rating` decimal(2,1) DEFAULT NULL,
  `overall_cleanliness_rating` decimal(2,1) DEFAULT NULL,
  `overall_comfort_rating` decimal(2,1) DEFAULT NULL,
  `overall_value_for_money_rating` decimal(2,1) DEFAULT NULL,
  `overall_location_rating` decimal(2,1) DEFAULT NULL,
  `overall_free_wifi_rating` decimal(2,1) DEFAULT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `overall_guest_review`
--

INSERT INTO `overall_guest_review` (`overall_guest_review_id`, `overall_guest_rating`, `overall_staff_rating`, `overall_facilities_rating`, `overall_cleanliness_rating`, `overall_comfort_rating`, `overall_value_for_money_rating`, `overall_location_rating`, `overall_free_wifi_rating`, `property_id`) VALUES
(1, '8.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, '9.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `passport_details`
--

CREATE TABLE `passport_details` (
  `passport_details_id` int(11) NOT NULL,
  `first_name(s)` varchar(255) NOT NULL,
  `last_name(s)` int(255) NOT NULL,
  `passport_number` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `country_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_details_id` int(11) NOT NULL,
  `cardholder_name` varchar(255) NOT NULL,
  `primary_account_number` varbinary(255) NOT NULL,
  `expiration_date` date NOT NULL,
  `card_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_details_id`, `cardholder_name`, `primary_account_number`, `expiration_date`, `card_type_id`) VALUES
(1, 'Mr James Smith', 0x88779c62e571273fd6507d1a2ecf031055670b6826d9c65eae7eddcc68b0ef45, '2012-10-08', 3),
(2, 'Mr James Smith', 0x88779c62e571273fd6507d1a2ecf031055670b6826d9c65eae7eddcc68b0ef45, '2012-10-08', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

CREATE TABLE `phone_number` (
  `phone_number_id` int(11) NOT NULL,
  `area_code_id` int(11) NOT NULL,
  `user_phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

--
-- Dumping data for table `points_of_interest`
--

INSERT INTO `points_of_interest` (`points_of_interest_id`, `points_of_interest_name`, `points_of_interest_latitude`, `points_of_interest_longitude`) VALUES
(1, 'Disneyland Paris', 48.8674, 2.7836);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_desc` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `business_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_name`, `property_desc`, `address_id`, `business_user_id`) VALUES
(1, 'Ace Hôtel Paris Marne La Vallée', 'Ace Hôtel Paris Marne La Vallée offers accommodation in Bailly-Romainvillier, 5 km from Disneyland Paris. The property is 40 km from the centre of Paris.', 1, 1),
(2, 'Cosy Colour Place', 'Boasting garden views, Cosy Colour Place offers accommodation with a balcony and a coffee machine, around 15 km from Paris-Gare-de-Lyon. This property offers access to a terrace, free private parking and free WiFi.', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_brand`
--

CREATE TABLE `property_brand` (
  `property_brand_id` int(11) NOT NULL,
  `property_brand_name` varchar(255) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property_facilities`
--

CREATE TABLE `property_facilities` (
  `property_facilities_id` int(11) NOT NULL,
  `property_facilities_name` varchar(255) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_facilities`
--

INSERT INTO `property_facilities` (`property_facilities_id`, `property_facilities_name`, `property_id`) VALUES
(1, 'Free parking', 1),
(2, 'Family Rooms', 1),
(3, 'Air conditioning', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_image`
--

CREATE TABLE `property_image` (
  `property_image_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `images_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property_rating`
--

CREATE TABLE `property_rating` (
  `property_rating_id` int(11) NOT NULL,
  `amount_of_stars` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_rating`
--

INSERT INTO `property_rating` (`property_rating_id`, `amount_of_stars`, `property_id`) VALUES
(2, 3, 1),
(3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `property_surroundings_distance`
--

CREATE TABLE `property_surroundings_distance` (
  `property_surroundings_distance_id` int(11) NOT NULL,
  `property_surroundings_distance_metres` float NOT NULL,
  `points_of_interest_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_surroundings_distance`
--

INSERT INTO `property_surroundings_distance` (`property_surroundings_distance_id`, `property_surroundings_distance_metres`, `points_of_interest_id`, `property_id`) VALUES
(1, 7100, 1, 1),
(2, 9200, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varbinary(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `phone_number_id` int(11) DEFAULT NULL,
  `payment_details_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `passport_details_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email_address`, `password`, `display_name`, `address_id`, `phone_number_id`, `payment_details_id`, `nationality_id`, `gender_id`, `passport_details_id`, `currency_id`, `language_id`) VALUES
(8, 'Louis ', 'Moreau', 'l.moreau@acehotels.com', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'j.oneill@qub.ac.uk', 0x39306364393765303436666235393736623664636531663764653363636239653761303738643932363463343562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'j.oneill@qub.ac.uk', 0x35326165393038353431353134373930643734653632333337643963353763366361363739643433336665656333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'j.oneill@qub.ac.uk', 0x61646562353134373837616433303936636633383035643762373531626461333034376266366435336161383330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  ADD KEY `FK_booking_booking_id_three` (`booking_id`),
  ADD KEY `FK_accommodation_accommodation_id` (`accommodation_id`);

--
-- Indexes for table `accommodation_facilities`
--
ALTER TABLE `accommodation_facilities`
  ADD PRIMARY KEY (`accommodation_facilities_id`),
  ADD KEY `FK_accommodation_accommodation_id_two` (`accommodation_id`);

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
  ADD KEY `FK_country_region_country_region_id_two` (`country_region_id`),
  ADD KEY `FK_city_city_id` (`city_id`);

--
-- Indexes for table `area_code`
--
ALTER TABLE `area_code`
  ADD PRIMARY KEY (`area_code_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer_user_customer_user_id` (`customer_user_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`booking_line_item_id`),
  ADD KEY `FK_booking_booking_id_two` (`booking_id`);

--
-- Indexes for table `business_user`
--
ALTER TABLE `business_user`
  ADD PRIMARY KEY (`business_user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `card_type`
--
ALTER TABLE `card_type`
  ADD PRIMARY KEY (`card_type_id`);

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
-- Indexes for table `customer_user`
--
ALTER TABLE `customer_user`
  ADD PRIMARY KEY (`customer_user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `FK_genius_genius_id` (`genius_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `genius`
--
ALTER TABLE `genius`
  ADD PRIMARY KEY (`genius_id`);

--
-- Indexes for table `guest_review`
--
ALTER TABLE `guest_review`
  ADD PRIMARY KEY (`guest_review_id`),
  ADD KEY `FK_overall_guest_review_overall_guest_review_id` (`overall_guest_review_id`);

--
-- Indexes for table `house_rules`
--
ALTER TABLE `house_rules`
  ADD PRIMARY KEY (`house_rules_id`),
  ADD KEY `FK_property_property_id_eight` (`property_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`images_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nationality_id`),
  ADD KEY `FK_country_region_country_region_id` (`country_region_id`);

--
-- Indexes for table `overall_guest_review`
--
ALTER TABLE `overall_guest_review`
  ADD PRIMARY KEY (`overall_guest_review_id`),
  ADD UNIQUE KEY `property_id` (`property_id`);

--
-- Indexes for table `passport_details`
--
ALTER TABLE `passport_details`
  ADD PRIMARY KEY (`passport_details_id`),
  ADD KEY `FK_country_region_country_region_id_three` (`country_region_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_details_id`),
  ADD KEY `FK_card_type_card_type_id` (`card_type_id`);

--
-- Indexes for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD PRIMARY KEY (`phone_number_id`),
  ADD KEY `FK_area_code_area_code_id` (`area_code_id`);

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
  ADD KEY `FK_business_user_business_user_id` (`business_user_id`),
  ADD KEY `FK_address_address_id_three` (`address_id`);

--
-- Indexes for table `property_brand`
--
ALTER TABLE `property_brand`
  ADD PRIMARY KEY (`property_brand_id`),
  ADD KEY `FK_property_property_id_four` (`property_id`);

--
-- Indexes for table `property_facilities`
--
ALTER TABLE `property_facilities`
  ADD PRIMARY KEY (`property_facilities_id`),
  ADD KEY `FK_property_property_id_six` (`property_id`);

--
-- Indexes for table `property_image`
--
ALTER TABLE `property_image`
  ADD PRIMARY KEY (`property_image_id`),
  ADD KEY `FK_images_images_id` (`images_id`),
  ADD KEY `FK_property_property_id_three` (`property_id`);

--
-- Indexes for table `property_rating`
--
ALTER TABLE `property_rating`
  ADD PRIMARY KEY (`property_rating_id`),
  ADD UNIQUE KEY `property_id` (`property_id`);

--
-- Indexes for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  ADD PRIMARY KEY (`property_surroundings_distance_id`),
  ADD KEY `FK_property_property_id_two` (`property_id`),
  ADD KEY `FK_points_of_interest_points_of_interest_id` (`points_of_interest_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_gender_gender_id` (`gender_id`),
  ADD KEY `FK_language_language_id` (`language_id`),
  ADD KEY `FK_nationality_nationality_id` (`nationality_id`),
  ADD KEY `FK_phone_number_phone_number_id` (`phone_number_id`),
  ADD KEY `FK_payment_details_payment_details_id` (`payment_details_id`),
  ADD KEY `FK_currency_currency_id` (`currency_id`),
  ADD KEY `FK_address_address_id` (`address_id`),
  ADD KEY `FK_passport_details_passport_details_id` (`passport_details_id`);

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
-- AUTO_INCREMENT for table `accommodation_facilities`
--
ALTER TABLE `accommodation_facilities`
  MODIFY `accommodation_facilities_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `area_code`
--
ALTER TABLE `area_code`
  MODIFY `area_code_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `booking_line_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_user`
--
ALTER TABLE `business_user`
  MODIFY `business_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `card_type`
--
ALTER TABLE `card_type`
  MODIFY `card_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country_region`
--
ALTER TABLE `country_region`
  MODIFY `country_region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_user`
--
ALTER TABLE `customer_user`
  MODIFY `customer_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genius`
--
ALTER TABLE `genius`
  MODIFY `genius_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `guest_review`
--
ALTER TABLE `guest_review`
  MODIFY `guest_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_rules`
--
ALTER TABLE `house_rules`
  MODIFY `house_rules_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `images_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `nationality_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `overall_guest_review`
--
ALTER TABLE `overall_guest_review`
  MODIFY `overall_guest_review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `passport_details`
--
ALTER TABLE `passport_details`
  MODIFY `passport_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phone_number`
--
ALTER TABLE `phone_number`
  MODIFY `phone_number_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points_of_interest`
--
ALTER TABLE `points_of_interest`
  MODIFY `points_of_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_brand`
--
ALTER TABLE `property_brand`
  MODIFY `property_brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_facilities`
--
ALTER TABLE `property_facilities`
  MODIFY `property_facilities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_image`
--
ALTER TABLE `property_image`
  MODIFY `property_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_rating`
--
ALTER TABLE `property_rating`
  MODIFY `property_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  MODIFY `property_surroundings_distance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `FK_booking_booking_id_three` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `accommodation_facilities`
--
ALTER TABLE `accommodation_facilities`
  ADD CONSTRAINT `FK_accommodation_accommodation_id_two` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`);

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_city_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `FK_country_region_country_region_id_two` FOREIGN KEY (`country_region_id`) REFERENCES `country_region` (`country_region_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_customer_user_customer_user_id` FOREIGN KEY (`customer_user_id`) REFERENCES `customer_user` (`customer_user_id`);

--
-- Constraints for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD CONSTRAINT `FK_booking_booking_id_two` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `business_user`
--
ALTER TABLE `business_user`
  ADD CONSTRAINT `FK_user_user_id_two` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `customer_user`
--
ALTER TABLE `customer_user`
  ADD CONSTRAINT `FK_genius_genius_id` FOREIGN KEY (`genius_id`) REFERENCES `genius` (`genius_id`),
  ADD CONSTRAINT `FK_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `guest_review`
--
ALTER TABLE `guest_review`
  ADD CONSTRAINT `FK_overall_guest_review_overall_guest_review_id` FOREIGN KEY (`overall_guest_review_id`) REFERENCES `overall_guest_review` (`overall_guest_review_id`);

--
-- Constraints for table `house_rules`
--
ALTER TABLE `house_rules`
  ADD CONSTRAINT `FK_property_property_id_eight` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `nationality`
--
ALTER TABLE `nationality`
  ADD CONSTRAINT `FK_country_region_country_region_id` FOREIGN KEY (`country_region_id`) REFERENCES `country_region` (`country_region_id`);

--
-- Constraints for table `overall_guest_review`
--
ALTER TABLE `overall_guest_review`
  ADD CONSTRAINT `FK_property_property_id_seven` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `passport_details`
--
ALTER TABLE `passport_details`
  ADD CONSTRAINT `FK_country_region_country_region_id_three` FOREIGN KEY (`country_region_id`) REFERENCES `country_region` (`country_region_id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `FK_card_type_card_type_id` FOREIGN KEY (`card_type_id`) REFERENCES `card_type` (`card_type_id`);

--
-- Constraints for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD CONSTRAINT `FK_area_code_area_code_id` FOREIGN KEY (`area_code_id`) REFERENCES `area_code` (`area_code_id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_address_address_id_three` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_business_user_business_user_id` FOREIGN KEY (`business_user_id`) REFERENCES `business_user` (`business_user_id`);

--
-- Constraints for table `property_brand`
--
ALTER TABLE `property_brand`
  ADD CONSTRAINT `FK_property_property_id_four` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `property_facilities`
--
ALTER TABLE `property_facilities`
  ADD CONSTRAINT `FK_property_property_id_six` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `property_image`
--
ALTER TABLE `property_image`
  ADD CONSTRAINT `FK_images_images_id` FOREIGN KEY (`images_id`) REFERENCES `images` (`images_id`),
  ADD CONSTRAINT `FK_property_property_id_three` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `property_rating`
--
ALTER TABLE `property_rating`
  ADD CONSTRAINT `FK_property_property_id_five` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `property_surroundings_distance`
--
ALTER TABLE `property_surroundings_distance`
  ADD CONSTRAINT `FK_points_of_interest_points_of_interest_id` FOREIGN KEY (`points_of_interest_id`) REFERENCES `points_of_interest` (`points_of_interest_id`),
  ADD CONSTRAINT `FK_property_property_id_two` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_currency_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`),
  ADD CONSTRAINT `FK_gender_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `FK_language_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`),
  ADD CONSTRAINT `FK_nationality_nationality_id` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`),
  ADD CONSTRAINT `FK_passport_details_passport_details_id` FOREIGN KEY (`passport_details_id`) REFERENCES `passport_details` (`passport_details_id`),
  ADD CONSTRAINT `FK_payment_details_payment_details_id` FOREIGN KEY (`payment_details_id`) REFERENCES `payment_details` (`payment_details_id`),
  ADD CONSTRAINT `FK_phone_number_phone_number_id` FOREIGN KEY (`phone_number_id`) REFERENCES `phone_number` (`phone_number_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
