/* Write your T-SQL query statement below */
with cte_first as (
    select 
        visited_on,
        sum(amount) as amount
    from customer group by visited_on
),
cte_second as (
    select 
        visited_on,
        sum(amount) over(order by visited_on asc rows between 6 preceding and current row) as amount,
        round(avg(amount*1.0) over(order by visited_on asc rows between 6 preceding and current row),2) as average_amount
    from cte_first
)
select 
    c2.visited_on,
    c2.amount,
    c2.average_amount
from cte_first as c inner join cte_second as c2 on datediff(day,c.visited_on,c2.visited_on)=6

-- with cte_first as (
--     select 
--         visited_on,
--         sum(amount) as amount
--     from customer group by visited_on
-- )
-- select 
--     visited_on,
--     sum(amount) over(order by visited_on asc rows between 6 preceding and current row) as amount,
--     round(avg(amount*1.0) over(order by visited_on asc rows between 6 preceding and current row),2) as average_amount
-- from cte_first
-- order by visited_on asc
-- offset 6 rows;
