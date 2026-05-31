CREATE DATABASE products_db;
USE products_db;

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(200),
    price DECIMAL(10,2),
    category_id INT
);
SELECT *
FROM products
WHERE price BETWEEN 500000 AND 5000000;
SELECT *
FROM products
WHERE product_name LIKE '%Điện%';
SELECT *
FROM products
WHERE product_name LIKE 'D%';
SELECT category_id,
       AVG(price) AS avg_price
FROM products
GROUP BY category_id;
SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);
SELECT *
FROM products p
WHERE price =
(
    SELECT MIN(price)
    FROM products
    WHERE category_id = p.category_id
);
