
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`customers`
      
    
    

    OPTIONS()
    as (
      with customers as (
    select id,
        first_name,
        last_name
    from `bigquery-public-data.thelook_ecommerce.users`
),

orders as (
    select order_id,
        user_id,
        created_at,
        status
    from `bigquery-public-data.thelook_ecommerce.orders`
),

customer_orders as (
    select user_id,
        min(created_at) as first_order,
        max(created_at) as most_recent_order,
        count(order_id) as number_of_orders
    from orders
    group by user_id
),

final as (
    select
        customers.id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders
    from customers
    left join customer_orders
    on customers.id = customer_orders.user_id
)

select * from final
    );
  