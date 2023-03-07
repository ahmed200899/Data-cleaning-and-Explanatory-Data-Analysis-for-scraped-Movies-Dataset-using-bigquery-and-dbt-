{{ config(materialized='table') }}
  select 
    user_id,product_id,date
  from
     {{ source('Cowema', 'Pro_likes') }}
  limit 562475