-- 1. Categories
INSERT INTO product_categories (category_name)
VALUES
('Đồ uống'),
('Thực phẩm khô'),
('Sữa'),
('Bánh kẹo'),
('Gia vị');

-- 2. Suppliers
INSERT INTO suppliers (supplier_name, contact_info)
VALUES
('Công ty Thực phẩm Hảo Hạng', 'Hà Nội'),
('Công ty Sữa Việt', 'TP.HCM'),
('Công ty Đồ uống Xanh', 'Đà Nẵng'),
('Công ty Bánh kẹo Ngọt Ngào', 'Hải Phòng'),
('Công ty Gia vị Việt', 'Cần Thơ');

-- 3. Promotions
INSERT INTO promotions (promotion_name, discount_percent, start_date, end_date)
VALUES
('Khuyến mãi Tết', 10, '2025-01-01', '2025-01-31'),
('Khuyến mãi Hè', 15, '2025-06-01', '2025-06-30'),
('Black Friday', 20, '2025-11-25', '2025-11-30');

-- 4. Employees
INSERT INTO employees (employee_name, position, hire_date)
VALUES
('NV1', 'Thu ngân', '2023-01-01'),
('NV2', 'Thu ngân', '2023-02-01'),
('NV3', 'Bán hàng', '2023-03-01'),
('NV4', 'Bán hàng', '2023-04-01'),
('NV5', 'Bán hàng', '2023-05-01'),
('NV6', 'Thu ngân', '2023-06-01'),
('NV7', 'Bán hàng', '2023-07-01'),
('NV8', 'Quản lý', '2023-08-01'),
('NV9', 'Bán hàng', '2023-09-01'),
('NV10', 'Thu ngân', '2023-10-01');

-- 5. Customers
INSERT INTO customers (customer_name, phone, email, address)
VALUES
('Khách 1', '0900000001', 'k1@gmail.com', 'HN'),
('Khách 2', '0900000002', 'k2@gmail.com', 'HN'),
('Khách 3', '0900000003', 'k3@gmail.com', 'HN'),
('Khách 4', '0900000004', 'k4@gmail.com', 'HN'),
('Khách 5', '0900000005', 'k5@gmail.com', 'HN');

INSERT INTO products (product_name, price, category_id, supplier_id)
VALUES
('Nước suối Lavie', 10000, 1, 3),
('Coca Cola lon', 12000, 1, 3),
('Pepsi lon', 12000, 1, 3),
('Gạo ST25', 220000, 2, 1),
('Mì tôm Hảo Hảo', 4500, 2, 1),
('Sữa tươi Vinamilk', 35000, 3, 2),
('Sữa chua Vinamilk', 28000, 3, 2),
('Bánh Oreo', 18000, 4, 4),
('Kẹo dẻo', 15000, 4, 4),
('Nước mắm Nam Ngư', 45000, 5, 5);

INSERT INTO orders (customer_id, employee_id, promotion_id, order_date)
VALUES
(1, 1, 1, '2025-10-01 08:10:00'),
(2, 2, 1, '2025-10-02 09:15:00'),
(3, 3, 2, '2025-10-03 10:20:00'),
(4, 4, 2, '2025-10-04 11:00:00'),
(5, 5, 3, '2025-10-05 14:30:00');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 2, 10000),
(1, 4, 1, 220000),
(2, 2, 3, 12000),
(2, 6, 1, 35000),
(3, 5, 5, 4500),
(3, 8, 2, 18000),
(4, 3, 4, 12000),
(4, 10, 1, 45000),
(5, 7, 2, 28000),
(5, 9, 3, 15000);

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;