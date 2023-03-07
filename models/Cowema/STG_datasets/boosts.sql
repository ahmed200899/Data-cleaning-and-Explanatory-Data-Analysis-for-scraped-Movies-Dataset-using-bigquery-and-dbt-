{{ config(materialized='table') }}
  select 
        user_id,boost_id,pricing_plan_id,product_id
  from
     {{ source('Cowema', 'boosts') }}
  limit 562475