WITH orders AS (
    SELECT * FROM {{ ref('stg_northwind_orders') }}
),
payment_amounts_per_order AS (
    SELECT * FROM {{ ref('int_payment_amounts_per_order') }}
)
SELECT
    o.order_id,
    o.employee_id,
    o.customer_id,
    o.order_date,
    o.shipped_date,
    o.shipper_id,
    o.ship_name,
    o.ship_address,
    o.ship_city,
    o.ship_state_province,
    o.ship_zip_postal_code,
    o.ship_country_region,
    o.shipping_fee,
    o.taxes,
    o.payment_type,
    o.paid_date,
    o.notes,
    o.tax_rate,
    o.tax_status_id,
    o.status,
    p.cash_amount,
    p.credit_amount,
    p.total_amount,
    o.ingested_at
FROM orders o
LEFT JOIN payment_amounts_per_order p ON o.order_id = p.order_id