----y4-----
SELECT 
    o.order_id,
    c.customer_name,
    e.employee_name,
    o.order_date,
    SUM(oi.quantity * oi.price) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, c.customer_name, e.employee_name, o.order_date
ORDER BY o.order_date DESC
LIMIT 10;
-----y5-----
SELECT 
    pc.category_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_categories pc ON p.category_id = pc.category_id
GROUP BY pc.category_name
HAVING SUM(oi.quantity * oi.price) > 50000
ORDER BY total_revenue DESC;
----y6----
SELECT 
    product_name,
    price
FROM products
WHERE supplier_id = (
    SELECT supplier_id
    FROM suppliers
    WHERE supplier_name = 'Công ty Thực phẩm Hảo Hạng'
);
---y7---
SELECT 
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
----y8----
CREATE INDEX idx_orders_order_date
ON orders(order_date);
----Y9
EXPLAIN
SELECT 
    o.order_id,
    c.customer_name,
    e.employee_name,
    o.order_date,
    SUM(oi.quantity * oi.price) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, c.customer_name, e.employee_name, o.order_date
ORDER BY o.order_date DESC
LIMIT 10;
