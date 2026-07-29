/* Write your T-SQL query statement below */
-- with cte_first as (
--     select * from
--     (select 
--         person_name,
--         sum(weight) over(order by turn asc) as wr 
--     from queue)t where wr<=1000
-- ),
-- cte_sec as (
-- select person_name,row_number() over(order by wr desc) as rn from cte_first
-- )
-- select person_name from cte_sec where rn=1;

with cte_first as 
    (select 
        person_name,
        sum(weight) over(order by turn asc) as wr 
    from queue)

select top 1 person_name from cte_first where wr<=1000 order by wr desc;