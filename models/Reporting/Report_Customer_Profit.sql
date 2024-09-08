select 
    CUSTOMER_ID,
    CUSTOMER_NAME,
    sum(PROFITS) as CUSTOMER_PROFIT
from {{ ref('Stg_Orders') }}
GROUP BY
    CUSTOMER_ID,
    CUSTOMER_NAME