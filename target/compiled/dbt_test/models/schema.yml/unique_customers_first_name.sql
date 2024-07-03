
    
    

with dbt_test__target as (

  select first_name as unique_field
  from `dbt-test-427409`.`dbt_test`.`customers`
  where first_name is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


