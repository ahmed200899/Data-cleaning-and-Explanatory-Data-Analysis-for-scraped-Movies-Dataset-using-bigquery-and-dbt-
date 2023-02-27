{{ config(materialized='table') }}
  select 
    order_id,product_id,user_id,order_date,product_seller_id
  from
     {{ source('Cowema', 'Orders') }}
  limit 562475
