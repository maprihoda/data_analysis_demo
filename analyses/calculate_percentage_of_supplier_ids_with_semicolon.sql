WITH source AS (
    SELECT
        supplier_ids
    FROM
        {{ source('northwind', 'products') }}
),
count_data AS (
    SELECT
        COUNT(*) AS total_count,
        COUNT(CASE WHEN supplier_ids LIKE '%;%' THEN 1 END) AS contains_semicolon_count
    FROM
        source
)
SELECT
    total_count,
    contains_semicolon_count,
    (CAST(contains_semicolon_count AS FLOAT) / total_count) * 100 AS percentage_with_semicolon
FROM
    count_data
