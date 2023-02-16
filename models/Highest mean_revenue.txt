Select
  belongs_to_collection , avg(revenue) as Mean_revenue
From 
  {{ref('stg_movies')}}
Group by 1
Order by 2 desc
Limit 5 