{% macro get_cash_payment_types() %}
{% set cash_payment_types = env_var('CASH_PAYMENT_TYPES') %}
{% set cash_payment_types_list = cash_payment_types.split(',') %}
{{ return(cash_payment_types_list) }}
{% endmacro %}
