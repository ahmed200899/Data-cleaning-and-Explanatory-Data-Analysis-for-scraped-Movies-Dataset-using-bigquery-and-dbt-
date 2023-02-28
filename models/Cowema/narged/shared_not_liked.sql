 {{ config(materialized='table') }}
select 
    Distinct product_id 
from {{ source('Cowema', 'Pro_shares') }}
where 
    product_id 
     in
    (
        select Distinct product_id
        from {{ source('Cowema', 'Pro_likes') }}
        limit 10000
    )
order by product_id
limit 10000
