SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM
    {{ ref('fact_orders') }}
GROUP BY
    customer_id
ORDER BY
    total_orders DESC
{{ get_row_limit() }}

