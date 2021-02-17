with orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select order_id, sum(case when status = 'success' then amount end) as amount 
      from {{ref('stg_payments')}}
      group by 1
)

select orders.order_id, orders.customer_id, payments.amount
  from payments join orders on payments.order_id = orders.order_id