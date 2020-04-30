-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Set default database
--
USE customerbd;

--
-- Drop table `payment`
--
DROP TABLE IF EXISTS payment;

--
-- Drop table `order`
--
DROP TABLE IF EXISTS `order`;

--
-- Drop table `customer`
--
DROP TABLE IF EXISTS customer;

--
-- Drop table `staff`
--
DROP TABLE IF EXISTS staff;

--
-- Drop table `tariff`
--
DROP TABLE IF EXISTS tariff;

--
-- Set default database
--
USE customerbd;

--
-- Create table `tariff`
--
CREATE TABLE tariff (
  id_tariff VARCHAR(255) NOT NULL,
  name VARCHAR(50) DEFAULT NULL,
  price DECIMAL(19, 2) DEFAULT NULL,
  `minutes per month` VARCHAR(255) DEFAULT NULL,
  `sms per month` VARCHAR(255) DEFAULT NULL,
  `gb per month` VARCHAR(255) DEFAULT NULL,
  info VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id_tariff)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `staff`
--
CREATE TABLE staff (
  id_staff VARCHAR(255) NOT NULL,
  name VARCHAR(50) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  phone DECIMAL(10, 0) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  `position` VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_staff)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `customer`
--
CREATE TABLE customer (
  id_customer VARCHAR(255) NOT NULL,
  name VARCHAR(50) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  tariff VARCHAR(255) DEFAULT NULL,
  card_number VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id_customer)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `order`
--
CREATE TABLE `order` (
  id_order VARCHAR(255) NOT NULL,
  date DATETIME DEFAULT NULL,
  id_customer VARCHAR(255) DEFAULT NULL,
  id_staff VARCHAR(255) DEFAULT NULL,
  id_tariff VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id_order)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE `order` 
  ADD CONSTRAINT FK_order_customer_id_customer FOREIGN KEY (id_customer)
    REFERENCES customer(id_customer) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE `order` 
  ADD CONSTRAINT FK_order_staff_id_staff FOREIGN KEY (id_staff)
    REFERENCES staff(id_staff) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE `order` 
  ADD CONSTRAINT FK_order_tariff_id_tariff FOREIGN KEY (id_tariff)
    REFERENCES tariff(id_tariff) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `payment`
--
CREATE TABLE payment (
  id_payment VARCHAR(255) NOT NULL,
  date DATETIME DEFAULT NULL,
  price DECIMAL(19, 2) DEFAULT NULL,
  id_order VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id_payment)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE payment 
  ADD CONSTRAINT FK_payment_order_id_order FOREIGN KEY (id_order)
    REFERENCES `order`(id_order) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
