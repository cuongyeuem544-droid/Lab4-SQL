SELECT * FROM public.products;
SELECT * FROM public.orders;
SELECT * FROM public.order_items;

SELECT * FROM public.products LIMIT 5;
SELECT * FROM public.orders LIMIT 5;
SELECT * FROM public.order_items LIMIT 5;

SELECT product_name, AVG(price) AS avg_price
FROM public.products
GROUP BY product_name;

SELECT
    product_name,
    price,
    AVG(price) OVER () AS avg_overall_price
FROM public.products;

ALTER TABLE public.products
ADD COLUMN category VARCHAR(50);

UPDATE public.products
SET category = 'Do uong'
WHERE product_id IN (1,2);

UPDATE public.products
SET category = 'Banh keo'
WHERE product_id IN (3,4);

SELECT
    category,
    product_name,
    price,
    AVG(price) OVER (PARTITION BY category) AS avg_category_price
FROM public.products;

UPDATE public.products
SET price = 35000
WHERE product_id IN (1,2);

SELECT
    product_name,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num,
    RANK() OVER (ORDER BY price DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY price DESC) AS dense_rank_num
FROM public.products;

WITH daily_revenue AS (
    SELECT
        o.order_date,
        SUM(oi.quantity * oi.price) AS total_daily_revenue
    FROM public.orders o
    JOIN public.order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_date
)

SELECT
    order_date,
    total_daily_revenue,
    SUM(total_daily_revenue) OVER (ORDER BY order_date) AS running_total
FROM daily_revenue;