WITH source AS (
    SELECT
        o.id AS order_detail_id,
        o.order_id,
        o.product_id,
        o.quantity,
        o.unit_price,
        o.discount,
        s.status,
        CAST(o.date_allocated AS DATE) AS date_allocated,
        o.purchase_order_id,
        o.inventory_id
    FROM
        {{ source('northwind', 'order_details') }} o
    LEFT JOIN
        {{ source('northwind', 'order_details_status') }} s ON o.status_id = s.id
)
SELECT
    *,
    CURRENT_TIMESTAMP as ingested_at
FROM source
