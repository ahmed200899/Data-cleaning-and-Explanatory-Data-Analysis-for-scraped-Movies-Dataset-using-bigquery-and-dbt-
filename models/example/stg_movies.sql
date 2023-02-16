{{ config(materialized='table') }}
select * , (revenue-budget) as Profit , (revenue/budget) as return ,
from   
    (select  
        SAFE_CAST(id AS INT64) as id ,SAFE_CAST(revenue AS FLOAT64)/1000000 as revenue , SAFE_CAST(popularity AS FLOAT64) as popularity,
        SAFE_CAST(release_date AS datetime) as release_date,  JSON_VALUE(belongs_to_collection,'$.name') as belongs_to_collection, 
        genres, title,SAFE_CAST(vote_average AS FLOAT64) as vote_average, SAFE_CAST(vote_count AS FLOAT64) as vote_count, 
        SAFE_CAST(budget AS FLOAT64)/1000000   as budget 
    from {{ source('movies', 'raw_movies') }}
    limit 45467   
    )
where  vote_count>= 160 and revenue <>0 and budget <>0
