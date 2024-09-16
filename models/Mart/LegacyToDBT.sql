


with
{{
    config(
        materialized='table'
    )
}}

order_data as (
    select * from {{ source('globalmarts', 'orders') }}
),

customer_data as (
    select * from {{ source('globalmarts', 'customer') }}
),

OrderFilter as (
    select 
        ORDER_ID, 
        CUSTOMER_ID, -- Ensure CUSTOMER_ID is included for the join
        ORDER_COST_PRICE, 
        ORDER_SELLING_PRICE
    from order_data
),

CustomerFilter as (
    select
        CUSTOMER_ID, 
        CUSTOMER_NAME, 
        SEGMENT
    from customer_data
),

Final as (
    select 
        c.CUSTOMER_NAME, 
        c.SEGMENT,
        o.ORDER_ID, 
        o.ORDER_COST_PRICE, 
        o.ORDER_SELLING_PRICE
    from 
        CustomerFilter c
    join 
        OrderFilter o
    on 
        c.CUSTOMER_ID = o.CUSTOMER_ID 
)

select * from Final