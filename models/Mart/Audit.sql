-- models/audit_legacy_vs_dbt.sql

{% set legacy_query %}
SELECT c.CUSTOMER_NAME, c.SEGMENT, o.ORDER_ID, o.ORDER_COST_PRICE, o.ORDER_SELLING_PRICE
FROM RAW.GLOBALMART.CUSTOMER c
JOIN RAW.GLOBALMART.ORDERS o ON c.CUSTOMER_ID = o.CUSTOMER_ID
{% endset %}

{% set dbt_query %}
SELECT c.CUSTOMER_NAME, c.SEGMENT, o.ORDER_ID, o.ORDER_COST_PRICE, o.ORDER_SELLING_PRICE
FROM {{ ref('Raw_Customer') }} c
JOIN {{ ref('Raw_Orders') }} o ON c.CUSTOMER_ID = o.CUSTOMER_ID
{% endset %}

{{ audit_helper.compare_and_classify_query_results(
    a_query=legacy_query,
    b_query=dbt_query,
    primary_key_columns=['ORDER_ID'],
    columns=['CUSTOMER_NAME', 'SEGMENT', 'ORDER_ID', 'ORDER_COST_PRICE', 'ORDER_SELLING_PRICE']
) }}
