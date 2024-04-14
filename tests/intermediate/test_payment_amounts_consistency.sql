WITH source AS (
    SELECT
        order_id,
        cash_amount,
        credit_amount,
        total_amount
    FROM {{ ref('int_payment_amounts_per_order') }}
)

SELECT
    order_id,
    cash_amount,
    credit_amount,
    total_amount
FROM source
WHERE cash_amount + credit_amount != total_amount
