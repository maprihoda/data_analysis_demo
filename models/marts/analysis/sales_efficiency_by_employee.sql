SELECT
    o.employee_id,
    COUNT(DISTINCT o.order_id) AS total_orders_handled,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount))) AS total_sales_generated,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount)) / COUNT(DISTINCT o.order_id)) AS avg_sales_per_order
FROM
    {{ ref('int_order_details_orders') }} d
INNER JOIN
    {{ ref('stg_northwind_orders') }} o ON d.order_id = o.order_id
GROUP BY
    o.employee_id
ORDER BY
    total_sales_generated DESC
