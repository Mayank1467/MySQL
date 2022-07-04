


CREATE TABLE IF NOT EXISTS `orderLine` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` float UNSIGNED NOT NULL,
  `total_price` float UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);



INSERT INTO `orderLine` (`id`,`order_id`,`name`,`quantity`,`unit_price`,`total_price`) 
VALUES (1, 1, 'Product X1', 20, 12.87, 0),
(2, 1, 'Product X1', 5, 30.14, 0),
(3, 1, 'Product X2', 6, 17.48, 0),
(4, 2, 'Product X3', 10, 33.99, 0),
(5, 2, 'Product X4', 16, 6.94, 0),
(6, 3, 'Product X4', 17, 10.92, 0),
(7, 3, 'Product X6', 8, 15.69, 0),
(8, 4, 'Product X8', 20, 32.15, 0),
(9, 4, 'Product X9', 4, 60.96, 0),
(10, 4, 'Product X9', 9, 21.88, 0),
(11, 5, 'Product X9', 2, 6.13, 0),
(12, 5, 'Product X7', 10, 13.22, 0),
(13, 6, 'Product X10', 6, 66.86, 0),
(14, 6, 'Product X11', 6, 86.93, 0),
(15, 7, 'Product X5', 22, 30.07, 0),
(16, 7, 'Product X5', 7, 15.65, 0),
(17, 8, 'Product X15', 13, 66.55, 0),
(18, 9, 'Product X20', 9, 230.13, 0),
(19, 9, 'Product X19', 10, 200.93, 0),
(20, 10, 'Product X30', 2, 23.31, 0);


