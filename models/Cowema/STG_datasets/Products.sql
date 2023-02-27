{{ config(materialized='table') }}
  select 
    	*
  from
     {{ source('Cowema', 'Products') }}
  limit 562475