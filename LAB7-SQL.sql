SELECT current_database();

DROP INDEX IF EXISTS idx_customers_phone;
DROP INDEX IF EXISTS idx_customers_name;

DELETE FROM customers;

INSERT INTO customers (full_name, phone_number)
SELECT
    'Customer ' || i,
    '09' || LPAD(i::text, 8, '0')
FROM generate_series(1, 100000) AS i;

EXPLAIN ANALYZE
SELECT *
FROM customers
WHERE phone_number = '0900000001';

CREATE INDEX idx_customers_phone
ON customers(phone_number);

EXPLAIN ANALYZE
INSERT INTO customers (full_name, phone_number)
VALUES ('Test Index User', '0999999999');

CREATE INDEX idx_customers_name
ON customers(full_name);

EXPLAIN
SELECT *
FROM customers
WHERE phone_number = '0900000001'
   OR full_name = 'Customer 101';