{{ config(materialized='table') }}
  select 
        user_id,product_idn,view_at
  from
     {{ source('Cowema', 'Views') }}
  limit 562475