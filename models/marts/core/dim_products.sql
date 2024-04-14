WITH products AS (
    SELECT * FROM {{ ref('stg_northwind_products') }}
)
SELECT
    *
FROM products