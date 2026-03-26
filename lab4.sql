DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE IF EXISTS test_table CASCADE;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) CHECK (total_amount >= 0)
);

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    sale_price DECIMAL(10,2) NOT NULL CHECK (sale_price > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_name, phone, address) VALUES
('Nguyen Van A', '0901234567', 'Ha Noi'),
('Tran Thi B', '0912345678', 'Hai Phong'),
('Le Van C', '0988888888', 'Da Nang');

INSERT INTO products (product_name, unit_price, stock_quantity) VALUES
('Sua Vinamilk', 32000, 100),
('Mi Hao Hao', 5000, 200),
('Banh Oreo', 12000, 150),
('Nuoc ngot Coca', 10000, 120),
('Ca phe G7', 45000, 80),
('Duong Bien Hoa', 28000, 60),
('Dau an Tuong An', 55000, 40),
('Nuoc suoi Aquafina', 7000, 90);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2026-03-20 08:30:00', 74000),
(2, '2026-03-21 10:00:00', 22000),
(3, '2026-03-22 15:45:00', 45000);

INSERT INTO order_details (order_id, product_id, quantity, sale_price) VALUES
(1, 1, 1, 32000),
(1, 2, 4, 5000),
(1, 3, 1, 12000),
(1, 4, 1, 10000),
(2, 2, 2, 5000),
(2, 8, 1, 7000),
(2, 4, 1, 10000),
(3, 5, 1, 45000);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(15) UNIQUE
);

ALTER TABLE suppliers
ADD COLUMN email VARCHAR(100);

ALTER TABLE products
ADD COLUMN supplier_id INT;

ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);

INSERT INTO suppliers (supplier_name, contact_phone, email) VALUES
('Cong ty Sua Viet Nam', '0987654321', 'contact@vinamilk.vn'),
('Cong ty Thuc pham A Chau', '0912345678', 'contact@acecook.vn');

UPDATE suppliers
SET contact_phone = '0911112222'
WHERE supplier_name = 'Cong ty Thuc pham A Chau';

DELETE FROM order_details WHERE product_id = 8;
DELETE FROM products WHERE product_id = 8;

CREATE TABLE test_table (
    id INT
);

ALTER TABLE suppliers
DROP COLUMN contact_phone;

DROP TABLE test_table;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM suppliers;
