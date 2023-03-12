{{ config(materialized='table') }}

select 
    user_id,product_id, 2 as weight 
from
    {{ source('Cowema', 'Pro_likes') }}
Union all 
select 
    user_id ,product_id, 3 as weight 
from
    {{ source('Cowema', 'Pro_shares') }}
order by user_id

limit 500000