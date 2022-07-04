


CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);



INSERT INTO `customer` (`id`, `firstname`, `lastname`, `email`, `city`, `password`) VALUES
(1, 'Patrick', 'Adair', 'PatrickMAdair@example.com', 'New York', 'E38AD214943DAAD1D64C102FAEC29DE4AFE9DA3D'),
(2, 'Ivan', 'Martinez', 'Martinez@example.com', 'Los Angeles', '2AA60A8FF7FCD473D321E0146AFD9E26DF395147'),
(3, 'Dominique', 'McCollum', 'McCollum@example.com', 'Chicago', '1119CFD37EE247357E034A08D844EEA25F6FD20F'),
(4, 'William', 'Hyman', 'Hyman@example.com', 'Houston', 'A1D7584DAACA4738D499AD7082886B01117275D8'),
(5, 'Carrie', 'Garver', 'Garver@example.com', 'Phoenix', 'EDBA955D0EA15FDEF4F61726EF97E5AF507430C0'),
(6, 'Wallace', 'Williams', 'Williams@example.com', 'Philadelphia', '6D749E8A378A34CF19B4C02F7955F57FDBA130A5'),
(7, 'Patrick', 'Nicholas', 'Nicholas@example.com', 'San Antonio', '330BA60E243186E9FA258F9992D8766EA6E88BC1'),
(8, 'Maurice', 'Janice', 'Hardesty@example.com', 'San Diego', 'A8DBBFA41CEC833F8DD42BE4D1FA9A13142C85C2'),
(9, 'Maria', 'Jamerson', 'Jamerson@example.com', 'Dallas', '024B01916E3EAEC66A2C4B6FC587B1705F1A6FC8'),
(10, 'Crystal', 'Dowd', 'Dowd@example.com', 'San Jose', 'F68EC41CDE16F6B806D7B04C705766B7318FBB1D');