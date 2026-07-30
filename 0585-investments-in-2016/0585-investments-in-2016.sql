/* Write your T-SQL query statement below */

-- select 
--     round((sum(tiv_2016)*1.0),2) as tiv_2016
-- from insurance where lat in 
-- (select lat from insurance group by lat,lon having count(*)=1) and tiv_2015 in 
-- (select tiv_2015 from insurance group by tiv_2015 having count(*)>1)

with cte_first as (
    select 
        tiv_2016,
        count(*) over(partition by tiv_2015) as t,
        count(*) over(partition by lat,lon) as llp
    from insurance
)
select 
    round(sum(tiv_2016),2) as tiv_2016
from cte_first where llp=1 and t>1 ;