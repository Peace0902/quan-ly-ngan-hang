SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `account` (
  `id` int(11) PRIMARY KEY  NOT NULL,
  `acc_id` varchar(255) NOT NULL,
  `cust_id` varchar(255) NOT NULL,
  `acc_type` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `account` (`id`, `acc_id`, `cust_id`, `acc_type`, `balance`) VALUES
(1, 'A0001', 'CS001', 'Saving', 4077),
(2, 'A0002', 'CS002', 'Saving', 13900),
(3, 'A0003', 'CS004', 'Saving', 4400),
(4, 'A0004', 'CS005', 'Saving', 5600),
(5, 'A0005', 'CS006', 'Saving', 4000),
(6, 'A0006', 'CS001', 'Saving', 3000),
(7, 'A0007', 'CS007', 'Saving', 10000);

-- --------------------------------------------------------


CREATE TABLE `branch` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `branch` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `branch` (`id`, `branch`) VALUES
(1, 'Tan Phu'),
(2, 'Tan Binh'),
(3, 'Phu Nhuan');

CREATE TABLE `customer` (
  `id` int(11) PRIMARY KEY  NOT NULL,
  `cust_id` varchar(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `branch` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
   FOREIGN KEY(cust_id) references deposit(cust_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `customer` (`id`, `cust_id`, `firstname`, `lastname`, `street`, `city`, `branch`, `phone`) VALUES
(2, 'CS002', 'Hoa', 'Binh', 'Truong Chinh', 'Ho Chi Minh', 2, 902404101),
(3, 'CS003', 'Song', 'An', 'Ba Van', 'Ho Chi Minh', 1, 900123045),
(4, 'CS004', 'Phuc', 'Thinh', 'Nguyen Hong Dao', 'Ho Chi Minh', 2, 912309944),
(5, 'CS005', 'Dinh', 'Thang', 'Pham Phu Thu', 'Ho Chi Minh', 2, 332334234),
(6, 'CS006', 'Dinh', 'Nam', 'Pham Van Hai', 'Ho Chi Minh', 3, 1234567890),
(11, 'CS007', 'Quoc', 'Cuong', 'Nguyen Dinh Chieu', 'Ho Chi Minh', 3, 348694313);

CREATE TABLE `deposit` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `acc_id` varchar(255) NOT NULL,
  `cust_id` varchar(255)  NOT NULL,
  `date` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `deposit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `deposit` (`id`, `acc_id`, `cust_id`, `date`, `balance`, `deposit`) VALUES
(1, 'A0001', 'CS001', '2023/04/14', 2977, 1000),
(2, 'A0001', 'CS001', '2023/04/16',-923, 1000),
(3, 'A0001', 'CS001', '2023/04/14', 77, 1000),
(4, 'A0001', 'CS001', '2023/04/14', 577, 1000),
(5, 'A0003', 'CS004', '2023/04/17', 2000, 4000),
(6, 'A0004', 'CS005', '2023/04/23', 3000, 2000),
(7, 'A0005', 'CS006', '2023/05/11', 5000, 3000),
(8, 'A0005', 'CS006', '2023/05/30', 3000, 1000),
(9, 'A0001', 'CS001', '2023/06/06', 2077, 1000),
(10, 'A0002', 'CS002', '2023/06/12', 12900, 1000),
(11, 'A0007', 'CS007','2023/06/14', 8000, 3000);


CREATE TABLE `transfer` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `f_account` varchar(255) NOT NULL,
  `to_account` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `transfer` (`id`, `f_account`, `to_account`, `amount`) VALUES
(2, 'A0001', 'A0002', 500),
(5, 'A0001', 'A0002', 500),
(6, 'A0001', 'A0002', 400),
(7, 'A0001', 'A0002', 1000),
(8, 'A0003', 'A0002', 2000),
(9, 'A0004', 'A0003', 400),
(10, 'A0005', 'A0004', 1000),
(11, 'A0002', 'A0001', 1000),
(12, 'A0002', 'A0001', 1000),
(13, 'A0007', 'A0006', 1000);



CREATE TABLE `user` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'peace', '123'),
(2, 'sa', '321'),
(3, 'John', 'John');



CREATE TABLE `withdraw` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `acc_id` varchar(255) NOT NULL,
  `cust_id` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `withdraw` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `withdraw` (`id`, `acc_id`, `cust_id`, `date`, `balance`, `withdraw`) VALUES
(1, 'A0001', 'CS001', '2023/04/14', 5000, 4000),
(2, 'A0001', 'CS001', '2023/04/14', 5000, 4000),
(3, 'A0001', 'CS001', '2023/04/14', 5000, 4000),
(4, 'A0001', 'CS001', '2023/04/14', 5000, 4000),
(5, 'A0001', 'CS001', '2023/04/14', 5000, 233),
(6, 'A0001', 'CS001', '2023/04/14', 5000, 4000),
(7, 'A0001', 'CS001', '2023/04/14', 1000, 100),
(8, 'A0001', 'CS001', '2023/04/14', 1000, 400),
(9, 'A0001', 'CS001', '2023/04/14', 1000, 200),
(10, 'A0001', 'CS001', '2023/04/14', 1000, 200),
(11, 'A0001', 'CS001', '2023/04/14', 1000, 233),
(12, 'A0001', 'CS001', '2023/04/14', 1000, 233),
(13, 'A0001', 'CS001', '2023/04/14', 1000, 2),
(14, 'A0001', 'CS001', '2023/04/14', 1000, 223),
(15, 'A0001', 'CS001', '2023/04/19', 977, 233),
(16, 'A0001', 'CS001', '2023/04/15', 977, 233),
(17, 'A0001', 'CS001', '2023/04/17', 977, 1000),
(18, 'A0001', 'CS001', '2023/04/14', 1977, 1000),
(19, 'A0002', 'CS002', '2023/04/14', 13900, 1000),
(20, 'A0001', 'CS001', '2023/06/17', 1077, 500),
(21, 'A0003', 'CS004', '2023/05/22', 5000, 3000),
(22, 'A0004', 'CS005', '2023/03/13', 4000, 1000),
(23, 'A0005', 'CS006', '2023/05/11', 8000, 2000),
(24, 'A0001', 'CS001', '2023/05/14', 1577, 500),
(25, 'A0005', 'CS006', '2023/04/29',5000, 2000),
(26, 'A0007', 'CS007', '2023/04/22', 10000, 2000);



ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
