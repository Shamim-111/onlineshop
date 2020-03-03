DROP DATABASE IF EXISTS buyzone;

CREATE DATABASE buyzone;

CREATE TABLE IF NOT EXISTS customer(
customer_id INT(10) NOT NULL AUTO_INCREMENT,
customer_name TEXT(50) NOT NULL,
customer_phone TEXT(15) NOT NULL,
customer_address TEXT(200) NULL,
customer_email  TEXT(100) NOT NULL,
customer_password  TEXT(100) NOT NULL,
PRIMARY KEY( customer_id )
);


CREATE TABLE IF NOT EXISTS product(
product_id  INT(10) NOT NULL AUTO_INCREMENT,
product_name TEXT(300) NULL,
product_provider TEXT(100) NULL,
product_type TEXT(50) NULL,
product_price INT(10) NOT NULL,
product_link TEXT(500) NULL,
product_details TEXT(2500) NULL,
product_image_source TEXT(150) NULL,
product_image_name TEXT(50) NULL,
PRIMARY KEY(product_id)
);

CREATE TABLE IF NOT EXISTS cart(
customer_id INT(10) NOT NULL,
product_id INT(10) NOT NULL,
quenty int(10) NOT NULL,
PRIMARY KEY(customer_id,product_id),
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES product (product_id)
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS final_order(
customer_id INT(10) NOT NULL,
total_cost INT(10) NULL,
payment_status TEXT(25) NULL,
PRIMARY KEY(customer_id),
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
ON DELETE CASCADE
);