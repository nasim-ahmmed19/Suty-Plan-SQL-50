/* Write your T-SQL query statement below */
with cte_first as (
    select 
        top 1 u.name as results
    from movierating as mr 
    inner join users as u on mr.user_id=u.user_id group by u.name order by count(*) desc, u.name asc
),
cte_second as(
    select 
        top 1 m.title as results
    from movierating as mr inner join movies as m on mr.movie_id=m.movie_id
    where mr.created_at>='2020-02-01' and mr.created_at< '2020-03-01'
    group by m.title order by avg(mr.rating * 1.0) desc,m.title asc
)
select results from cte_first
union all
select results from cte_second