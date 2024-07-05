
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`order_items`
      
    
    

    OPTIONS()
    as (
      SELECT *
FROM `bigquery-public-data.thelook_ecommerce.order_items`
    );
  