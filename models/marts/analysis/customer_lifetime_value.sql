SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount))) AS total_revenue,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount)) / COUNT(DISTINCT o.order_id)) AS avg_order_value,
    ROUND(SUM(d.quantity * d.unit_price * (1 - d.discount))) AS customer_lifetime_value
FROM
    {{ ref('int_order_details_orders') }} d
INNER JOIN
    {{ ref('stg_northwind_orders') }} o ON d.order_id = o.order_id
GROUP BY
    o.customer_id
ORDER BY
    customer_lifetime_value DESC
{{ get_row_limit() }}