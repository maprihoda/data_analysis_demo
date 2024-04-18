SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount))) AS total_revenue,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount)) / COUNT(DISTINCT o.order_id)) AS avg_order_value,
    ROUND(SUM(o.quantity * o.unit_price * (1 - o.discount))) AS customer_lifetime_value
FROM
    {{ ref('int_order_details_orders') }} o
GROUP BY
    o.customer_id
ORDER BY
    customer_lifetime_value DESC
{{ get_row_limit() }}
