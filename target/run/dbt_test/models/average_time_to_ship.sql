
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`average_time_to_ship`
      
    
    

    OPTIONS()
    as (
      SELECT 
    AVG(TIMESTAMP_DIFF(shipped_at, created_at, HOUR)) AS avg_hours_to_ship
FROM 
    `bigquery-public-data.thelook_ecommerce.order_items`
WHERE 
    status = 'Complete'
    AND shipped_at IS NOT NULL
    );
  