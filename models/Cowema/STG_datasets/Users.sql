{{ config(materialized='table') }}
  select 
        user_id,city
  from
     {{ source('Cowema', 'Users') }}
  limit 562475