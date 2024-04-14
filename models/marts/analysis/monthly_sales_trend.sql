SELECT
    dd.month_start_date AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount))) AS total_sales
FROM
    {{ ref('stg_northwind_orders') }} o
LEFT JOIN
    {{ ref('int_order_details_orders') }} d ON o.order_id = d.order_id
LEFT JOIN
   {{ ref('dim_date') }} dd ON dd.date_day = o.order_date
GROUP BY
    month
ORDER BY
    month

