/* Write your T-SQL query statement below */
select 
    p.product_id,
    round(coalesce(cast(sum(p.price*s.units) as decimal(10,2))/cast(sum(s.units) as decimal(10,2)),0),2)
     as  average_price
 from unitsSold as s right join prices as p 
on s.product_id=p.product_id and s.purchase_date between p.start_date and p.end_date
group by p.product_id


-- SELECT 
--     p.product_id,
--     ISNULL(
--         ROUND(
--             SUM(s.units * p.price) / CAST(SUM(s.units) AS DECIMAL(10,2)), 
--             2
--         ), 
--         0
--     ) AS average_price
-- FROM unitsSold AS s 
-- RIGHT JOIN prices AS p 
--     ON s.product_id = p.product_id 
--     AND s.purchase_date BETWEEN p.start_date AND p.end_date
-- GROUP BY p.product_id;






























