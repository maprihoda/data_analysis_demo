WITH orders AS (
    SELECT * FROM {{ ref('stg_northwind_orders') }}
),
order_details AS (
    SELECT * FROM {{ ref('stg_northwind_order_details') }}
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
    o.status as order_status,
    d.order_detail_id,
    d.product_id,
    d.quantity,
    d.unit_price,
    d.discount,
    d.status as order_detail_status,
    d.date_allocated,
    d.purchase_order_id,
    d.inventory_id
FROM orders o
INNER JOIN order_details d ON d.order_id = o.order_id
