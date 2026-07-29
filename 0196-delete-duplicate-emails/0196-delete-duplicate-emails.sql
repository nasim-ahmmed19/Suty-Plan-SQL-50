/* Write your T-SQL query statement below */
-- with cte_dub as (
--     select *,row_number() over(partition by email order by id) as rank_ from person
-- )
-- delete cte_dub where rank_>1 
-- DELETE p1 
-- FROM Person p1
-- JOIN Person p2 
--   ON p1.email = p2.email 
--  AND p1.id > p2.id;
-- delete p1 from person as p1 join person as p2 on p1.email=p2.email
-- and p1.id>p2.id;

delete p1 from person as p1 join person as p2 on p1.email=p2.email 
and p1.id>p2.id
