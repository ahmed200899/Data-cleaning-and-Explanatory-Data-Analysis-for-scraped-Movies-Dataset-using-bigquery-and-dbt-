{{ config(materialized='table') }}
SELECT
    DISTINCT *
FROM  (
  select 
    h.id as movie_id,name as Actor 
  from
     {{ source('dbt_movies', 'raw_crew_cast') }},UNNEST(h.cast) 
  limit 562475

)