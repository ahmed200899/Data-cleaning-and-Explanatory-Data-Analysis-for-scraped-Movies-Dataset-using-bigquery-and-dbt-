Select
  title , budget 
From 
  {{ref('stg_movies')}}
Order by 2 desc
Limit 5