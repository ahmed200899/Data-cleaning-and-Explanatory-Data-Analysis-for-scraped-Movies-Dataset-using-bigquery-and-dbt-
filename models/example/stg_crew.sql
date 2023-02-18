{{ config(materialized='table') }}
SELECT
    DISTINCT *
FROM  (
    select 
        h.id as movie_id,name as Director 
    from
        {{ source('dbt_movies', 'raw_crew_cast') }},UNNEST(crew) 
    where 
        job =  "Director" 
    limit           58999
    )    
