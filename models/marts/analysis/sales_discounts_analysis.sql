WITH discount_effect AS (
    SELECT
        order_id,
        AVG(discount) AS average_discount,
        ROUND(SUM(quantity * unit_price)) AS total_sales_before_discount,
        ROUND(SUM(quantity * unit_price * (1 - discount))) AS total_sales_after_discount
    FROM
        {{ ref('int_order_details_orders') }}
    GROUP BY
        order_id
)
SELECT
    AVG(average_discount) AS average_discount_rate,
    AVG(total_sales_before_discount) AS avg_order_value_before_discount,
    AVG(total_sales_after_discount) AS avg_order_value_after_discount
FROM
    discount_effect
