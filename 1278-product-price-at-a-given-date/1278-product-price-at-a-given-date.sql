/* Write your T-SQL query statement below */
-- select distinct
--     p1.product_id,
--     coalesce(p2.new_price,10)price
-- from products as p1 left join (
-- select * from(select distinct
--     product_id,
--     new_price,
--     row_number() over(partition by product_id order by change_date desc) as rn,
--     change_date
-- from products where change_date<='2019-08-16')t where rn=1)p2
-- on p1.product_id=p2.product_id;


with cte_first as (
    select * from (
        select * from(select distinct
        product_id,
        new_price,
        row_number() over(partition by product_id order by change_date desc) as rn,
        change_date
    from products where change_date<='2019-08-16')t where rn=1
)t
)
select distinct
    p1.product_id,
    coalesce(p2.new_price,10) as price
from products as p1 left join cte_first as p2 on p1.product_id=p2.product_id;