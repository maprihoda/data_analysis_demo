WITH source AS (
    SELECT
        supplier_ids
    FROM
        {{ source('northwind', 'products') }}
),
count_data AS (
    SELECT
        COUNT(*) AS total_count,
        SUM(CASE WHEN supplier_ids LIKE '%;%' THEN 1 END) AS contains_semicolon_count
    FROM
        source
),
percentage_calc AS (
    SELECT
        (CAST(contains_semicolon_count AS FLOAT) / total_count) * 100 AS percentage_with_semicolon
    FROM
        count_data
)
SELECT
    percentage_with_semicolon
FROM
    percentage_calc
GROUP BY 1
HAVING
    percentage_with_semicolon > 12