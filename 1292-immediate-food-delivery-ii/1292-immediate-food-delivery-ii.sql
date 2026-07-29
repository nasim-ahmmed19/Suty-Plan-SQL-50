/* Write your T-SQL query statement below */
with cte_first_order as (
    select 
        customer_id,min(order_date) as min_order_date
    from delivery group by customer_id 
)
select 
    round(cast(count(case when d.order_date=customer_pref_delivery_date then 1 end) as decimal(10,2)) /
        cast(count(*) as decimal(10,2))*100,2) as immediate_percentage
from cte_first_order as f inner join delivery as d on f.min_order_date=d.order_date and f.customer_id=d.customer_id;