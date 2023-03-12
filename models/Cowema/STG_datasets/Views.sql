{{ config(materialized='table') }}
  select 
        user_id,product_idn,view_at
  from
     {{ source('Cowema', 'Views') }}
  order by product_idn,user_id
limit 500000