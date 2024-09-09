with tmp
as
(
    select * from {{ ref('Raw_Customer') }}
)

select CUSTOMER_NAME
from tmp
where CUSTOMER_NAME is null
