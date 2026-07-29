-- Write your PostgreSQL query statement below
select
    machine_id,
ROUND(
    (SUM(time_difference) / NULLIF(COUNT(process_id), 0))::numeric,
    3
) AS processing_time
from(
SELECT 
    machine_id, 
    process_id,
    MAX(timestamp) - MIN(timestamp) as time_difference 
FROM 
    Activity 
GROUP BY 
    machine_id, process_id 
)
group by machine_id;