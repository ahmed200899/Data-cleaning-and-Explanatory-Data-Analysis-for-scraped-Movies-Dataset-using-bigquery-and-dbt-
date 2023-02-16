Select
  title , vote_count 
From 
  {{ref('stg_movies')}}
Order by 2 desc
Limit 5