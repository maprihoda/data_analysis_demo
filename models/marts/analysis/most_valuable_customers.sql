WITH closed_orders AS (
    SELECT
        o.customer_id,
        SUM(o.quantity * o.unit_price * (1 - o.discount)) AS total_value
    FROM
        {{ ref('int_order_details_orders') }} o
    WHERE
        o.order_status = 'Closed'
    GROUP BY
        o.customer_id
)
SELECT
    customer_id,
    ROUND(total_value) AS total_value
FROM
    closed_orders
ORDER BY
    total_value DESC
{{ get_row_limit(10) }}
