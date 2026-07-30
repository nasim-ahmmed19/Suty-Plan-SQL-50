/* Write your T-SQL query statement below */
select 
    sell_date,
    count(*) as num_sold,
    string_agg(product,',') as products
from (select distinct * from activities)t group by sell_date