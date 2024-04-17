SELECT
    dd.month_start_date AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount))) AS total_sales
FROM
    {{ ref('int_order_details_orders') }} o
LEFT JOIN
   {{ ref('dim_date') }} dd ON dd.date_day = o.order_date
GROUP BY
    month
ORDER BY
    month
