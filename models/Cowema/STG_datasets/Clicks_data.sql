{{ config(materialized='table') }}
  select 
    user_id,product_id,clicked_from,in_app_event_name,clicked_at
  from
     {{ source('Cowema', 'Clicks_data') }}
  limit 562475