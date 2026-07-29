/* Write your T-SQL query statement below */
with cte_first as (
select 
    id,
    num,
    lead(num,1) over(order by id asc) as le1,
    lead(num,2) over(order by id asc) as le2
from logs
)
select distinct num as ConsecutiveNums from cte_first where num=le1 and le1=le2;


