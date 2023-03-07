SELECT *
FROM 
    {{ source('Cowema', 'Products') }}
limit 10000