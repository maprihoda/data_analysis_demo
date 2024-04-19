SELECT
    customer_id,
    total_revenue
FROM
    {{ ref('customer_lifetime_value') }}
WHERE
    total_revenue <= 0