-- 1484. Group Sold Products By The Date
select sell_date,
    count(distinct product) as num_sold,
    group_concat(
        distinct product
        ORDER BY product ASC SEPARATOR ','
    ) as products
from Activities
group by sell_date
order by sell_date