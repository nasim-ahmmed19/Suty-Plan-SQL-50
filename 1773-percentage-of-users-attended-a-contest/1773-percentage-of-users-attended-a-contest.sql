/* Write your T-SQL query statement below */
select 
    r.contest_id,
    round(cast(count(r.contest_id) as decimal(10,2))/cast((select count(distinct user_id) from users) as decimal(10,2)) *100,2) as  percentage
from register as r left join users as u on r.user_id=u.user_id
group by r.contest_id order by percentage desc,r.contest_id asc;