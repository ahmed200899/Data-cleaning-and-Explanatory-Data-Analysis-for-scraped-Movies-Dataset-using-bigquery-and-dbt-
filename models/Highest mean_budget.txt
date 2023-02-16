Select
  belongs_to_collection , avg(budget) as Mean_budget
From 
  {{ref('stg_movies')}}
Group by 1
Order by 2 desc
Limit 5 