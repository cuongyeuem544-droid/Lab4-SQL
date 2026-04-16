SELECT oi.order_id,
       p.product_name,
       oi.quantity,
       oi.price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;

SELECT c.customer_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT p.product_name,
       oi.order_id
FROM order_items oi
RIGHT JOIN products p
ON oi.product_id = p.product_id;

SELECT * FROM suppliers;

SELECT customer_name AS ContactName,
       phone AS PhoneNumber
FROM customers

UNION

SELECT supplier_name AS ContactName,
       contact_info AS PhoneNumber
FROM suppliers;

SELECT product_name,
       price
FROM products
WHERE supplier_id IN (
    SELECT supplier_id
    FROM suppliers
    WHERE supplier_name = 'Công ty Sữa Việt'
);

SELECT product_name,
       price,
       (SELECT AVG(price) FROM products) AS average_price
FROM products;

SELECT temp.order_id,
       temp.total_amount
FROM (
    SELECT order_id,
           SUM(quantity * price) AS total_amount
    FROM order_items
    GROUP BY order_id
) AS temp
WHERE temp.total_amount > 50000;

SELECT s.supplier_name
FROM suppliers s
WHERE EXISTS (
    SELECT 1
    FROM products p
    WHERE p.supplier_id = s.supplier_id
);