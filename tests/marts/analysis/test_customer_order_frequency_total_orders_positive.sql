WITH model AS (
    SELECT
        customer_id,
        total_orders
    FROM
        {{ ref('customer_order_frequency') }}
)
SELECT
    customer_id,
    total_orders
FROM
    model
WHERE
    total_orders <= 0