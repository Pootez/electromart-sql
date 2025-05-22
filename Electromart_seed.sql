-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 22. Mai, 2025 15:52 PM
-- Tjener-versjon: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Electromart`
--

--
-- Dataark for tabell `brand`
--

INSERT INTO `brand` (`ID`, `name`, `description`) VALUES
(1, 'Samsung', 'Consumer electronics'),
(2, 'Apple', 'Mainly smartphones');

--
-- Dataark for tabell `category`
--

INSERT INTO `category` (`ID`, `name`, `description`) VALUES
(1, 'Smartphones', 'All smartphones'),
(2, 'Tablets', 'All tablets');

--
-- Dataark for tabell `orderItem`
--

INSERT INTO `orderItem` (`ID`, `orderID`, `productID`, `quantity`, `subtotal`) VALUES
(1, 2, 3, 1, 9999.00),
(2, 3, 1, 1, 8999.00),
(3, 1, 2, 1, 12999.00);

--
-- Dataark for tabell `orders`
--

INSERT INTO `orders` (`ID`, `userID`, `totalAmount`, `orderDate`, `address`, `status`) VALUES
(1, 3, 8999.00, '2025-01-01 00:00:00', 'Lillegata 33', 'delivered'),
(2, 2, 12999.00, '2025-02-02 00:00:00', 'Storgata 22', 'shipped'),
(3, 1, 9999.00, '2025-03-03 00:00:00', 'Kongeveien 1', 'pending');

--
-- Dataark for tabell `payment`
--

INSERT INTO `payment` (`ID`, `orderID`, `method`, `amount`, `paymentDate`, `status`) VALUES
(1, 2, 'Klarna', 12999.00, '2025-02-02 00:00:00', 'paid'),
(2, 1, 'Vipps', 8999.00, '2025-01-01 00:00:00', 'paid'),
(3, 3, 'Credit Card', 9999.00, '2025-03-03 00:00:00', 'pending');

--
-- Dataark for tabell `product`
--

INSERT INTO `product` (`ID`, `name`, `description`, `price`, `stockQuantity`, `brandID`, `categoryID`) VALUES
(1, 'Galaxy S25', 'Flagship-phone', 8999.00, 56, 1, 1),
(2, 'iPad 13 gen', '11\" tablet', 12999.00, 33, 2, 2),
(3, 'iPad 16', 'Flagship-Apple', 9999.00, 48, 1, 1);

--
-- Dataark for tabell `users`
--

INSERT INTO `users` (`userID`, `email`, `password`, `firstName`, `lastName`, `phoneNumber`, `isAdmin`) VALUES
(1, 'ola@nord.no', 'e43b4a66', 'Ola', 'Nordmann', '47880403', 0),
(2, 'kari@nord.no', 'e3ec8fbb', 'Kari', 'Nordmann', '92988565', 1),
(3, 'lise@nord.no', 'effddd46', 'Lise', 'Nordmann', '98674085', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
