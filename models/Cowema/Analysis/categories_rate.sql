SELECT m.user_id as user_id,Products.category as category, sum(m.pro_rate) as cat_rate
FROM {{ source('Cowema', 'm') }} LEFT JOIN {{ source('Cowema', 'Products') }} on m.product_id = Products.product_id
WHERE (m.user_id IS NOT NULL) and (m.product_id IS NOT NULL) and (Products.category IS NOT NULL)
GROUP by m.user_id , Products.category 
ORDER BY user_id  desc
LIMIT 30000
