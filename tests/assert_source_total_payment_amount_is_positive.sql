Select
    orderid as order_id,
    sum(amount) as total_amount
from {{ source('stripe', 'PAYMENT') }}
group by 1
having sum(amount) < 0
