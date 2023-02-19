{{ config(materialized='table') }}
SELECT
    DISTINCT *
FROM  (
  select 
    raw_crew_cast.id as movie_id,name as Actor 
  from
     {{ source('dbt_movies', 'raw_crew_cast') }},UNNEST(raw_crew_cast.cast) 
  limit 562475

)