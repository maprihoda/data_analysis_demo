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
),
classified_customers AS (
    SELECT
        co.customer_id,
        co.total_value,
        cr.classification
    FROM
        closed_orders co
    LEFT JOIN
        {{ ref('seed_customer_range_per_paid_amount') }} cr
    ON
        co.total_value BETWEEN cr.min_range AND cr.max_range
)
SELECT
    customer_id,
    ROUND(total_value) AS total_value,
    classification
FROM
    classified_customers
ORDER BY
    total_value DESC
{{ get_row_limit(10) }}
