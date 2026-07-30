/* Write your T-SQL query statement below */
-- select * from orders where order_date >='2020-02-0-01' and order_date<'2020-03-01'
-- with feb_orders as (
--     select * from orders where year(order_date)=2020 and month(order_date)=2
-- )
-- select 
--     p.product_name,
--     sum(f.unit) as unit 
-- from feb_orders as f left join products as p on f.product_id=p.product_id 
-- group by p.product_name having sum(f.unit)>=100;

with feb_orders as (
    select * from orders where order_date >='2020-02-01' and order_date<'2020-03-01'
)
select 
    p.product_name,
    sum(f.unit) as unit 
from feb_orders as f left join products as p on f.product_id=p.product_id 
group by p.product_name having sum(f.unit)>=100;