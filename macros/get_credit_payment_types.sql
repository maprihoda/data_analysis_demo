{% macro get_credit_payment_types() %}
{% set credit_payment_types = env_var('CREDIT_PAYMENT_TYPES') %}
{% set credit_payment_types_list = credit_payment_types.split(',') %}
{{ return(credit_payment_types_list) }}
{% endmacro %}
