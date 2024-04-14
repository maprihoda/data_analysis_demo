WITH product_sales AS (
    SELECT
        product_id,
        SUM(quantity) AS total_quantity_sold,
        SUM(quantity * unit_price) AS total_revenue
    FROM
        {{ ref('int_order_details_orders') }}
    WHERE
        order_status = 'Closed'
    GROUP BY
        product_id
)
SELECT
    p.product_id,
    p.product_name,
    s.total_quantity_sold,
    ROUND(s.total_revenue)
FROM
    product_sales s
INNER JOIN
    {{ ref('dim_products') }} p ON s.product_id = p.product_id
ORDER BY
    total_revenue DESC
