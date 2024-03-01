DROP SCHEMA IF EXISTS SuperStore;

CREATE SCHEMA SuperStore;

USE SuperStore;

CREATE TABLE SuperStore.customer (
	customer_id INT auto_increment NOT NULL,
	first_name varchar(100) NULL,
	last_name varchar(100) NULL,
	email varchar(100) NULL,
	phone varchar(100) NULL,
	address_id INT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (customer_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.`order` (
	order_id INT auto_increment NOT NULL,
	customer_id INT NULL,
	address_id INT NULL,
	CONSTRAINT order_pk PRIMARY KEY (order_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.product (
	product_id INT auto_increment NOT NULL,
	product_name varchar(100) NULL,
	description varchar(100) NULL,
	weight DECIMAL(10,2) NULL,
	base_cost DECIMAL(10,2) NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.order_item (
	order_id INT NULL,
	product_id INT NULL,
	quantity INT NULL,
	price DECIMAL(10,2) NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.address (
	address_id INT auto_increment NOT NULL,
	street varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(100) NULL,
	zip INT NULL,
	CONSTRAINT address_pk PRIMARY KEY (address_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.warehouse (
	warehouse_id INT auto_increment NOT NULL,
	name varchar(100) NULL,
	address_id INT NULL,
	CONSTRAINT warehouse_pk PRIMARY KEY (warehouse_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

CREATE TABLE SuperStore.product_warehouse (
	product_id INT NULL,
	warehouse_id INT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

ALTER TABLE SuperStore.customer ADD CONSTRAINT fk_customer_address_id FOREIGN KEY (address_id) REFERENCES SuperStore.address(address_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.`order` ADD CONSTRAINT fk_order_address_id FOREIGN KEY (address_id) REFERENCES SuperStore.address(address_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.`order` ADD CONSTRAINT fk_order_customer_id FOREIGN KEY (customer_id) REFERENCES SuperStore.customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.order_item ADD CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES SuperStore.`order`(order_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.order_item ADD CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES SuperStore.product(product_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.warehouse ADD CONSTRAINT fk_warehouse_address_id FOREIGN KEY (address_id) REFERENCES SuperStore.address(address_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.product_warehouse ADD CONSTRAINT fk_product_warehouse_product_id FOREIGN KEY (product_id) REFERENCES SuperStore.product(product_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SuperStore.product_warehouse ADD CONSTRAINT fk_product_warehouse_warehouse_id FOREIGN KEY (warehouse_id) REFERENCES SuperStore.warehouse(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE;

