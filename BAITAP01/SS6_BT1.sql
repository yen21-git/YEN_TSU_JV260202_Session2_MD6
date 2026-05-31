CREATE DATABASE products_db;
USE products_db;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(200)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_id, category_name)
VALUES
(1,'THOI TRANG'),
(2,'DIEN MAY'),
(3,'DIEN TU');

INSERT INTO products(product_id, product_name, price, category_id)
VALUES
(101,'DIEN THOAI',5000000,3),
(102,'MAY GIAT',15000000,2),
(103,'AO SO MI',7000000,1);
UPDATE products
SET price = '6000000'
WHERE products_id = 101 ;
DELETE  FROM products
WHERE product_id = 103 ;
SELECT
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS so_luong_san_pham
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
