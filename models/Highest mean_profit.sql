Select
  belongs_to_collection , avg(profit) as Mean_profit
From 
  {{ref('stg_movies')}}
Group by 1
Order by 2 desc
Limit 5 