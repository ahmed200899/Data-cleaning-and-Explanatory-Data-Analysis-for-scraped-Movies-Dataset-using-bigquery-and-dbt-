Select
  title , vote_average 
From 
  {{ref('stg_movies')}}
Order by 2 asc
Limit 5