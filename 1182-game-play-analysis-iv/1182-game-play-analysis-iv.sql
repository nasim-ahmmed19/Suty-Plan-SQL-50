/* Write your T-SQL query statement below */
with cte_first_login as (
    select player_id,min(event_date) as first_login from activity group by player_id
),
cte_second_time_login as (
    select 
        a.player_id,
        f.first_login,
        a.event_date as second_login
    from activity as a inner join cte_first_login as f
    on datediff(day,f.first_login,a.event_date)=1 and a.player_id=f.player_id
)
select 
    round(cast((select count(*) from cte_second_time_login) as decimal(10,2))/
    cast(count(*) as decimal(10,2)),2) as fraction
from cte_first_login