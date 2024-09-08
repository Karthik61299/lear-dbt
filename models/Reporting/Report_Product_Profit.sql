select 
    PRODUCT_ID,
    CATEGORY,
    PRODUCT_NAME,
    sum(PROFITS) as PRODUCT_PROFIT
from {{ ref('Stg_Orders') }}
GROUP BY
    PRODUCT_ID,
    CATEGORY,
    PRODUCT_NAME