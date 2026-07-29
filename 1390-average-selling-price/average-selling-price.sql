select 
product_id, 
coalesce(round(sum(total_price)/ nullif(cast(sum(units) as decimal(10,2)), 0), 2), 0) as average_price
from(
SELECT 
    p.product_id,
    p.price,
    u.purchase_date,
    u.units,
    p.price * u.units as total_price
FROM
    Prices p
    LEFT JOIN 
    UnitsSold u 
    ON p.product_id = u.product_id 
       AND u.purchase_date BETWEEN p.start_date AND P.end_date
)
group by product_id;