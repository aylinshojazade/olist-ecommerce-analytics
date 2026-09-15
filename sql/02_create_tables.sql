USE olist_database;

DROP TABLE IF EXISTS order_reviews;
DROP TABLE IF EXISTS order_payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS product_category_name_translation;
DROP TABLE IF EXISTS geolocation;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(32),
    customer_state VARCHAR(2)
);

CREATE TABLE orders(
    order_id    VARCHAR(32) PRIMARY KEY,
    customer_id VARCHAR(32) NOT NULL ,
    order_status VARCHAR(11) NOT NULL ,
    order_purchase_timestamp DATETIME NOT NULL,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON DELETE RESTRICT
);

CREATE TABLE product_category_name_translation(
    product_category_name VARCHAR(46) PRIMARY KEY,
    product_category_name_english VARCHAR(39)
);

CREATE TABLE products(
    product_id VARCHAR(32) PRIMARY KEY ,
    product_category_name VARCHAR(46),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
    FOREIGN KEY (product_category_name)
    REFERENCES product_category_name_translation(product_category_name)
    ON DELETE RESTRICT
);

CREATE TABLE sellers(
    seller_id VARCHAR(32) PRIMARY KEY ,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(40),
    seller_state VARCHAR(2)
);

CREATE TABLE order_items(
    order_id VARCHAR(32),
    order_item_id INT,
    product_id VARCHAR(32) NOT NULL ,
    seller_id VARCHAR(32) NOT NULL ,
    shipping_limit_date DATETIME NOT NULL ,
    price DECIMAL(6,2) NOT NULL ,
    freight_value DECIMAL(5,2) NOT NULL ,
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE RESTRICT,
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE RESTRICT,
    FOREIGN KEY (seller_id)
    REFERENCES sellers(seller_id)
    ON DELETE RESTRICT
);

CREATE TABLE order_payments(
    order_id VARCHAR(32),
    payment_sequential INT,
    payment_type VARCHAR(11) NOT NULL ,
    payment_installments INT NOT NULL ,
    payment_value DECIMAL(7,2) NOT NULL ,
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE RESTRICT
);

CREATE TABLE order_reviews(
    review_id VARCHAR(32),
    order_id VARCHAR(32),
    review_score INT NOT NULL ,
    review_comment_title VARCHAR(26),
    review_comment_message VARCHAR(208),
    review_creation_date DATETIME NOT NULL ,
    review_answer_timestamp DATETIME NOT NULL ,
    PRIMARY KEY (review_id, order_id),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE RESTRICT);

CREATE TABLE geolocation(
    geolocation_id INT AUTO_INCREMENT PRIMARY KEY,
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10, 8),
    geolocation_lng DECIMAL(10, 8),
    geolocation_city VARCHAR(38),
    geolocation_state VARCHAR(2)
);