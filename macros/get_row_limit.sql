{% macro get_row_limit(custom_limit=None) %}
    {% if target.name != 'prod' %}
        {% if custom_limit %}
            {% set row_limit = "LIMIT " ~ custom_limit %}
        {% else %}
            {% set row_limit = "LIMIT " ~ env_var('DBT_ROW_LIMIT') %}
        {% endif %}
    {% else %}
        {% set row_limit = "" %}
    {% endif %}
    {{ return(row_limit) }}
{% endmacro %}
