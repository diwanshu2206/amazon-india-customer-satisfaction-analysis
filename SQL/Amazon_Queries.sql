CREATE DATABASE amazon_analysis;
USE amazon_analysis;
CREATE TABLE amazon_products (
    product_id VARCHAR(20),
    product_name TEXT,
    category TEXT,
    main_category VARCHAR(50),
    reliability_flag VARCHAR(30),
    discounted_price DECIMAL(10,2),
    actual_price DECIMAL(10,2),
    price_band VARCHAR(20),
    discount_percentage DECIMAL(5,4),
    discount_bucket VARCHAR(20),
    rating DECIMAL(3,2),
    rating_count INT,
    rating_tier VARCHAR(20),
    about_product TEXT,
    user_id TEXT,
    user_name TEXT,
    review_id TEXT,
    review_title TEXT,
    review_content TEXT,
    img_link TEXT,
    product_link TEXT
);
SELECT COUNT(*) as total_rows FROM amazon_products;
SHOW VARIABLES LIKE 'secure_file_priv';
USE amazon_analysis;
TRUNCATE TABLE amazon_products;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amazon_clean_mysql.csv'
INTO TABLE amazon_products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, category, main_category, reliability_flag,
discounted_price, actual_price, price_band, discount_percentage,
discount_bucket, @rating, rating_count, rating_tier, about_product,
user_id, user_name, review_id, review_title, review_content,
img_link, product_link)
SET rating = NULLIF(@rating, '');
SELECT COUNT(*) as total_rows FROM amazon_products;
-- Category Performance Overview
-- Business Question: Which categories perform best on rating, pricing and discounting?

SELECT 
    main_category,
    COUNT(product_id) as total_products,
    ROUND(AVG(rating), 2) as avg_rating,
    ROUND(AVG(discounted_price), 0) as avg_price,
    ROUND(AVG(discount_percentage) * 100, 1) as avg_discount_pct,
    ROUND(AVG(rating_count), 0) as avg_reviews
FROM amazon_products
GROUP BY main_category
ORDER BY avg_rating DESC;
-- Discount Bucket vs Average Rating
-- Business Question: Does heavier discounting lead to lower customer satisfaction?

SELECT 
    discount_bucket,
    COUNT(product_id) as total_products,
    ROUND(AVG(rating), 2) as avg_rating,
    ROUND(AVG(rating_count), 0) as avg_reviews,
    ROUND(AVG(discounted_price), 0) as avg_price
FROM amazon_products
WHERE main_category IN ('Electronics','Computers&Accessories','Home&Kitchen')
GROUP BY discount_bucket
ORDER BY discount_bucket;
--  Price Band vs Customer Satisfaction
-- Business Question: Do premium priced products rate higher than budget products?

SELECT 
    price_band,
    COUNT(product_id) as total_products,
    ROUND(AVG(rating), 2) as avg_rating,
    ROUND(AVG(discount_percentage) * 100, 1) as avg_discount_pct,
    ROUND(AVG(rating_count), 0) as avg_reviews
FROM amazon_products
WHERE main_category IN ('Electronics','Computers&Accessories','Home&Kitchen')
GROUP BY price_band
ORDER BY avg_rating DESC;
--  Review Tier vs Rating Quality
-- Business Question: Do products with more reviews rate higher?
-- Hypothesis: High review volume may indicate genuine quality OR social proof bias

SELECT 
    rating_tier,
    COUNT(product_id) as total_products,
    ROUND(AVG(rating), 2) as avg_rating,
    ROUND(AVG(discounted_price), 0) as avg_price,
    ROUND(AVG(discount_percentage) * 100, 1) as avg_discount_pct
FROM amazon_products
WHERE main_category IN ('Electronics','Computers&Accessories','Home&Kitchen')
GROUP BY rating_tier
ORDER BY avg_rating DESC;
-- Hidden Gems Analysis
-- Business Question: Which high quality products are being overlooked?
-- Definition: Rating >= 4.3 AND review_count < 1000 AND reliable category

SELECT 
    product_id,
    SUBSTR(product_name, 1, 50) as product_name,
    main_category,
    rating,
    rating_count,
    discounted_price,
    discount_percentage * 100 as discount_pct
FROM amazon_products
WHERE rating >= 4.3
    AND rating_count < 1000
    AND main_category IN ('Electronics','Computers&Accessories','Home&Kitchen')
ORDER BY rating DESC, rating_count DESC
LIMIT 10;
-- Query 6: Data Quality Analysis — Duplicate Product Detection
-- Business Question: How many products appear multiple times in the dataset?
-- Finding: 114 duplicate product IDs found, inflating review metrics

SELECT 
    product_id,
    COUNT(*) as times_appearing,
    SUBSTR(MIN(product_name), 1, 50) as product_name,
    main_category,
    MIN(rating) as min_rating,
    MAX(rating) as max_rating,
    MIN(rating_count) as min_reviews,
    MAX(rating_count) as max_reviews
FROM amazon_products
GROUP BY product_id, main_category
HAVING COUNT(*) > 1
ORDER BY times_appearing DESC
LIMIT 10;