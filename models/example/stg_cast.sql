{{ config(materialized='table') }}
SELECT
    DISTINCT *
FROM  (
  select 
    h.id as movie_id,name as Actor 
  from
     {{ source('movies', 'h') }},UNNEST(h.cast) 
  limit 562475

)