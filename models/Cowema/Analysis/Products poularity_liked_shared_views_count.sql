WITH 
    product_counts AS (
        SELECT 
            p.product_id,
            p.name,
            p.category,
            p.city_name,
            COUNT(DISTINCT views.user_id) AS view_count,
            COUNT(DISTINCT liked.user_id) AS like_count,
            COUNT(DISTINCT shared.user_id) AS share_count,
            MAX(COUNT(DISTINCT views.user_id)) OVER () AS max_view_count,
            MAX(COUNT(DISTINCT liked.user_id)) OVER () AS max_like_count,
            MAX(COUNT(DISTINCT shared.user_id)) OVER () AS max_share_count
        FROM 
            {{ref('Products')}} p
            LEFT JOIN {{ref('Views')}} views ON p.product_id = views.product_idn
            LEFT JOIN {{ref('Pro_likes')}} liked ON p.product_id = liked.product_id
            LEFT JOIN {{ref('Pro_shares')}} shared ON p.product_id = shared.product_id
        GROUP BY 
            1,2,3,4
    )
SELECT 
    product_id,
    name,
    category,
    city_name,
    ROUND(
        (
            (view_count / max_view_count) * 0.2 +
            (like_count / max_like_count) * 0.3 +
            (share_count / max_share_count) * 0.5
        ) * 100, 
        2
    ) AS popularity_score,view_count,like_count,share_count
FROM 
    product_counts 
ORDER BY 
    popularity_score DESC
LIMIT  100000;
