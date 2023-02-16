Select
  belongs_to_collection , count(belongs_to_collection ) as num_of_movies
From 
  {{ref('stg_movies')}}
Group by 1
Order by 2 desc
Limit 5 