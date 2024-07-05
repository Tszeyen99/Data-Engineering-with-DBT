
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`basicquery`
      
    
    

    OPTIONS()
    as (
      SELECT 
    oi.id AS order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    oi.status,
    oi.created_at AS order_created_at,
    oi.sale_price,
    ii.product_name,
    ii.product_category,
    ii.product_brand,
    ii.cost AS product_cost,
    ii.product_retail_price,
    (oi.sale_price - ii.cost) AS profit
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN 
    `bigquery-public-data.thelook_ecommerce.inventory_items` ii ON oi.inventory_item_id = ii.id
WHERE 
    oi.status = 'Complete'
    AND oi.created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY)
ORDER BY 
    oi.created_at DESC
LIMIT 100
    );
  