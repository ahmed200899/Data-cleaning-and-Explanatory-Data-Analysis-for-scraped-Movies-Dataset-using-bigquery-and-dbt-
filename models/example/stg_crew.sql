{{ config(materialized='table') }}
SELECT
    DISTINCT *
FROM  (
    select 
        h.id as movie_id,name as Director 
    from
        {{ source('movies', 'h') }},UNNEST(crew) 
    where 
        job =  "Director" 
    limit           58999
    )    
