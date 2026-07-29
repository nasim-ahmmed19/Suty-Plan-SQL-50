/* Write your T-SQL query statement below */
with cte_first_year as (
    select product_id,min(year) as first_year from sales group by product_id
)
select 
    s.product_id,
    f.first_year,
    s.quantity,
    s.price
 from sales as s inner join cte_first_year as f 
on f.product_id=s.product_id and f.first_year=s.year;