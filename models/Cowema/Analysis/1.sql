{{ config(materialized='table') }}
With weighted_lik_shrd as 
(
    select 
        user_id,product_id,date, 2 as weight 
    from
        {{ source('Cowema', 'Pro_likes') }}
    Union all 
    select 
        user_id ,product_id,date, 3 as weight 
    from
        {{ source('Cowema', 'Pro_shares') }}
    order by user_id
)
Select user_id,product_id,sum(weight) as pro_rate
from weighted_lik_shrd
GROUP by user_id,product_id
order by pro_rate DESC