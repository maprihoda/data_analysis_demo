WITH source AS (
    SELECT
        id as product_id,
        CAST(SPLIT_PART(supplier_ids, ';', 1) AS INTEGER) AS supplier_id,
        supplier_ids,
        product_code,
        product_name,
        description,
        standard_cost,
        list_price,
        reorder_level,
        target_level,
        quantity_per_unit,
        discontinued,
        minimum_reorder_quantity,
        category,
        attachments
    FROM
        {{ source('northwind', 'products') }}
)
SELECT
    *,
    CURRENT_TIMESTAMP AS ingested_at
FROM
    source
