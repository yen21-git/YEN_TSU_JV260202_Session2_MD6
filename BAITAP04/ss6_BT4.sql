USE orders_db;

USE order_details_db;

USE products_db;
INSERT INTO orders (order_id, customer_id, order_date)
VALUES (1003, 1, '2026-05-31');
INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity)
VALUES
(4, 1003, 101, 2),
(5, 1003, 102, 1);
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p
ON od.product_id = p.product_id;
SELECT AVG(order_revenue) AS avg_revenue
FROM (
    SELECT od.order_id,
           SUM(od.quantity * p.price) AS order_revenue
    FROM order_details od
    JOIN products p
        ON od.product_id = p.product_id
    GROUP BY od.order_id
) ;
SELECT od.order_id,
       SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY od.order_id
ORDER BY revenue DESC
LIMIT 1;
SELECT p.product_id,
       p.product_name,
       SUM(od.quantity) AS total_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;
