 {{ config(materialized='table') }}
select 
     product_id 
from {{ source('Cowema', 'Products') }}
where 
    product_id 
     in
    (
        select  product_id
        from {{ source('Cowema', 'Pro_likes') }}
        limit 10000
    )
    or
    product_id 
     in
    (
        select  product_id
        from {{ source('Cowema', 'Pro_shares') }}
        limit 10000
    )
order by product_id
limit 10000