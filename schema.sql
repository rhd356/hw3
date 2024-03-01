CREATE DATABASE `SuperStore`;

USE `SuperStore`;

-- superstore.address definition

CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.product definition

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `weight` int NOT NULL,
  `base_cost` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.customer definition

CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_address_FK` (`address_id`),
  CONSTRAINT `customer_address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.`order` definition

CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_customer_FK` (`customer_id`),
  KEY `order_address_FK` (`address_id`),
  CONSTRAINT `order_address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `order_customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.order_item definition

CREATE TABLE `order_item` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  KEY `order_item_order_FK` (`order_id`),
  KEY `order_item_product_FK` (`product_id`),
  CONSTRAINT `order_item_order_FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_item_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.warehouse definition

CREATE TABLE `warehouse` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  KEY `warehouse_address_FK` (`address_id`),
  CONSTRAINT `warehouse_address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- superstore.product_warehouse definition

CREATE TABLE `product_warehouse` (
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  KEY `product_warehouse_product_FK` (`product_id`),
  KEY `product_warehouse_warehouse_FK` (`warehouse_id`),
  CONSTRAINT `product_warehouse_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_warehouse_warehouse_FK` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;