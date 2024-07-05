
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`top_selling_products`
      
    
    

    OPTIONS()
    as (
      SELECT 
    ii.product_name,
    COUNT(oi.id) AS total_orders,
    SUM(oi.sale_price) AS total_sales
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.inventory_items` ii ON oi.inventory_item_id = ii.id
GROUP BY 
    ii.product_name
ORDER BY 
    total_sales DESC
LIMIT 10
    );
  