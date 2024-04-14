SELECT
    ROUND(AVG(shipped_date - order_date), 2) AS average_processing_time_days
FROM
    {{ ref('fact_orders') }}
WHERE
    shipped_date IS NOT NULL
