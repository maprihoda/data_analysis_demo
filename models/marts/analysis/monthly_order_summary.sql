WITH orders AS (
    SELECT * FROM {{ ref('fact_orders') }}
)
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount)) AS total_sales,
    ROUND(AVG(total_amount)) AS average_order_value
FROM
   orders
GROUP BY
    1, 2
ORDER BY
    year, month

