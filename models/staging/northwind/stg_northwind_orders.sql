WITH source AS (
    SELECT
        o.id AS order_id,
        o.employee_id,
        o.customer_id,
        CAST(o.order_date AS DATE) AS order_date,
        CAST(o.shipped_date AS DATE) AS shipped_date,
        o.shipper_id,
        o.ship_name,
        o.ship_address,
        o.ship_city,
        o.ship_state_province,
        o.ship_zip_postal_code,
        o.ship_country_region,
        o.shipping_fee,
        o.taxes,
        CASE
            WHEN LOWER(o.payment_type) IN ({{ "'" + "', '".join(get_credit_payment_types()) + "'" }}) THEN 'credit'
            WHEN LOWER(o.payment_type) IN ({{ "'" + "', '".join(get_cash_payment_types()) + "'" }}) THEN 'cash'
        END AS payment_type,
        CAST(o.paid_date AS DATE) AS paid_date,
        o.notes,
        o.tax_rate,
        o.tax_status_id,
        s.status_name AS status
    FROM
        {{ source('northwind', 'orders') }} o
    LEFT JOIN
        {{ source('northwind', 'orders_status') }} s ON o.status_id = s.id
)
SELECT
    *,
    CURRENT_TIMESTAMP as ingested_at
FROM source
