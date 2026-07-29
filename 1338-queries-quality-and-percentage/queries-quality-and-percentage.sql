-- Write your PostgreSQL query statement below
SELECT 
    query_name,
    round(sum(ratio)/ count(*), 2) as quality,
    round(sum(poor_rating)/ cast(count(*) as decimal(10,2)) * 100.00, 2) as poor_query_percentage 
From(
SELECT 
    query_name, 
    CAST(rating AS DECIMAL(10,2)) / NULLIF(position, 0) AS ratio,
    CASE WHEN (rating < 3) THEN 1 ELSE 0 end as poor_rating, 
    rating
FROM 
    Queries 
)
Group by query_name;