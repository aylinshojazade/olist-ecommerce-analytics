USE olist_database;

# SHOW GLOBAL VARIABLES LIKE 'local_infile';
# SET GLOBAL local_infile = 1;

USE olist_database;

-- Load customers
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/customers_clean.csv'
    INTO TABLE customers
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load products
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/products_clean.csv'
    INTO TABLE products
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load sellers
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/sellers_clean.csv'
    INTO TABLE sellers
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load product category translation
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/product_category_name_translation.csv'
    INTO TABLE product_category_name_translation
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load orders
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/orders_clean.csv'
    INTO TABLE orders
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load order items
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/order_items_clean.csv'
    INTO TABLE order_items
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load order payments
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/order_payments_clean.csv'
    INTO TABLE order_payments
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load order reviews
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/cleaned/order_reviews_clean.csv'
    INTO TABLE order_reviews
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
    IGNORE 1 ROWS;

-- Load geolocation
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_geolocation_dataset.csv'
    INTO TABLE geolocation
    FIELDS TERMINATED BY ','
    IGNORE 1 ROWS;



-- Final Check
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'product_category_name_translation', COUNT(*) FROM product_category_name_translation
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation;


USE olist_database;

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'olist_database'
ORDER BY TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME;