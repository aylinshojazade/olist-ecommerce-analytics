USE olist_database;

-- Load customers
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_customers_dataset.csv'
     INTO TABLE customers
     FIELDS TERMINATED BY ','
     IGNORE 1 ROWS;

-- Load orders
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_orders_dataset.csv'
     INTO TABLE orders
     FIELDS TERMINATED BY ','
     IGNORE 1 ROWS;

-- Load product_caegory_name
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/product_category_name_translation.csv'
     INTO TABLE product_category_name_translation
     FIELDS TERMINATED BY ','
     IGNORE 1 ROWS;

-- Load products
LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_products_dataset.csv'
     INTO TABLE products
     FIELDS TERMINATED BY ','
     IGNORE 1 ROWS;
#
# -- Load sellers
# LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_sellers_dataset.csv'
#      INTO TABLE sellers
#      FIELDS TERMINATED BY ','
#      IGNORE 1 ROWS;
#
# -- Load order_items
# LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_order_items_dataset.csv'
#      INTO TABLE order_items
#      FIELDS TERMINATED BY ','
#      ENCLOSED BY '"'
#      IGNORE 1 ROWS;
#
#
# SELECT COUNT(*) FROM order_items;
#
# -- Load order_reviews
# LOAD DATA LOCAL INFILE 'E:/olist-ecommerce-analytics/data/olist_order_reviews_dataset.csv'
#      INTO TABLE order_reviews
#      FIELDS TERMINATED BY ','
#      IGNORE 1 ROWS;
#
