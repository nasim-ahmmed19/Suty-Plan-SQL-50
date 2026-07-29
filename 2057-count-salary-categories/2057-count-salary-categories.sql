/* Write your T-SQL query statement below */
with cte_first as (
select *,
    case
        when income <20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary'
    end category
from accounts),
cte_second as (
    select 'Low Salary' as category
    union all
    select 'Average Salary'
    union all
    select 'High Salary'
)
select 
    s.category,
    count(f.income) as accounts_count
from cte_second as s left join cte_first as f on s.category=f.category
group by s.category