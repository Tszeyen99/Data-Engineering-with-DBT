
  
    

    create or replace table `dbt-test-427409`.`dbt_test`.`users`
      
    
    

    OPTIONS()
    as (
      SELECT *
FROM `bigquery-public-data.thelook_ecommerce.users`
    );
  