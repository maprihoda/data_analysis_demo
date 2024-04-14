WITH orders AS (
    SELECT
        o.order_id,
        o.payment_type,
        d.quantity,
        d.unit_price
    FROM {{ ref('stg_northwind_orders') }} o
    INNER JOIN {{ ref('stg_northwind_order_details') }} d ON o.order_id = d.order_id
    WHERE o.status = 'Closed'
),
aggregated AS (
    SELECT
        order_id,
        SUM(CASE WHEN payment_type = 'cash' THEN quantity * unit_price ELSE 0 END) AS cash_amount,
        SUM(CASE WHEN payment_type = 'credit' THEN quantity * unit_price ELSE 0 END) AS credit_amount,
        SUM(quantity * unit_price) AS total_amount
    FROM orders
    GROUP BY order_id
)
SELECT * FROM aggregated