SELECT
    o.employee_id,
    COUNT(DISTINCT o.order_id) AS total_orders_handled,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount))) AS total_sales_generated,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount)) / COUNT(DISTINCT o.order_id)) AS avg_sales_per_order
FROM
    {{ ref('int_order_details_orders') }} o
GROUP BY
    o.employee_id
ORDER BY
    total_sales_generated DESC
