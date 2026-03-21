with customers as (
    Select * from {{ref('stg_jaffle_shop_customers')}}
)
Select
    customers.customer_id,
    customers.first_name,
    customers.last_name
from
    customers