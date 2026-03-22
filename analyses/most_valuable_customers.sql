with fct_orders as (
    select * from {{ ref('fct_orders')}}
),
dim_customers as (
    select * from {{ ref('dim_customers')}}
)
Select
    dim_customers.CUSTOMER_ID,
    dim_customers.FIRST_NAME,
    coalesce(sum(fct_orders.TOTAL_AMOUNT), 0) as total_amount
from
    fct_orders inner join dim_customers
on  fct_orders.CUSTOMER_ID = dim_customers.CUSTOMER_ID
Where
    fct_orders.IS_ORDER_COMPLETED = 1
Group By
    dim_customers.CUSTOMER_ID,
    dim_customers.FIRST_NAME
Order By
    total_amount desc
limit 10