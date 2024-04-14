WITH closed_orders AS (
    SELECT
        o.customer_id,
        SUM(d.quantity * d.unit_price * (1 - d.discount)) AS total_value
    FROM
        {{ ref('int_order_details_orders') }} d
    INNER JOIN
        {{ ref('stg_northwind_orders') }} o ON d.order_id = o.order_id
    WHERE
        o.status = 'Closed'
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
