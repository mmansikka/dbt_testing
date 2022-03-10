{% macro grant_select(schema=target.schema, role) %}

    {% if role %}
        set role_str = 'to role {{ role }};'
    {% else %}
        set role_str = ';'
    {% endif %}

    {% set query%}
        grant usage on schema {{ schema }} {{ role_str }}
        grant select on all tables in {{ schema }} {{ role_str }}
        grant select on all views in {{ schema }} {{ role_str }}
    {% endset %}

    {% do run_query(query) %}

{% endmacro%}