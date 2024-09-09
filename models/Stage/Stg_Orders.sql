{{
    config(
        materialized='table'
    )
}}

select 
--ORDER
    O.ORDER_ID,
    O.ORDER_DATE,
    O.SHIP_DATE,
    O.ORDER_COST_PRICE,
    O.ORDER_SELLING_PRICE,
    O.SHIP_MODE
--CUSTOMER
    C.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.COUNTRY,
--PRODUCT
    P.PRODUCT_ID,
    P.CATEGORY,
    P.PRODUCT_NAME,
    (O.ORDER_SELLING_PRICE-O.ORDER_COST_PRICE) as PROFITS
from {{ ref('Raw_Orders') }} as O
left join
{{ ref('Raw_Customer') }} as C
on
C.CUSTOMER_ID=O.CUSTOMER_ID
left join
{{ ref('Raw_Product') }} as P
on
P.PRODUCT_ID=O.PRODUCT_ID