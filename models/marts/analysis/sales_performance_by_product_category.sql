WITH sales_data AS (
    SELECT
        p.category,
        SUM(d.quantity * d.unit_price * (1 - d.discount)) AS total_sales
    FROM
        {{ ref('dim_products') }} p
    INNER JOIN
        {{ ref('int_order_details_orders') }} d ON p.product_id = d.product_id
    GROUP BY
        p.category
)
SELECT
    category,
    ROUND(total_sales) AS total_sales
FROM
    sales_data
ORDER BY
    total_sales DESC

