/* Write your T-SQL query statement below */
select 
    s.user_id,
    coalesce(round(cast(count(case when c.action='confirmed' then 1 end) as decimal(10,2))/cast(count(*) as decimal(10,2)),2),0) as confirmation_rate
from signups as s left join confirmations as c on s.user_id=c.user_id
group by s.user_id