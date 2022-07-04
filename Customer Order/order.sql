

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `purchase_date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `order_total_price` float NOT NULL,
  PRIMARY KEY (`id`)
);




INSERT INTO `orders` (`id`, `customer_id`, `purchase_date`, `reference`, `order_total_price`) 
VALUES (1, 10, '2022-01-01', '00001', 0),
(2, 3, '2022-01-03', '00002', 0),
(3, 5, '2022-01-04', '00003', 0),
(4, 6, '2022-01-07', '00004', 0),
(5, 8, '2022-01-08', '00005', 0),
(6, 7, '2022-01-09', '00006', 0),
(7, 2, '2022-01-10', '00007', 0),
(8, 4, '2022-01-11', '00008', 0),
(9, 9, '2022-01-11', '00009', 0),
(10, 10, '2020-01-11', '00010', 0);