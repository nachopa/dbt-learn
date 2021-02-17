with payment as (

    select
        id,
        orderid as order_id,
        paymentmethod,
        status,
        amount / 100 as amount
    from raw.stripe.payment

)

select * from payment