/* Write your T-SQL query statement below */
-- with cte_friend as (
--     select requester_id as id, count(requester_id) as num from RequestAccepted group by requester_id
--     union all
--     select accepter_id,count(accepter_id) from RequestAccepted group by accepter_id
-- )
-- select top 1 id,sum(num) as num from cte_friend group by id order by num desc 

/* Write your T-SQL query statement below */
WITH all_friends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT TOP 1 
    id, 
    COUNT(id) AS num
FROM all_friends
GROUP BY id
ORDER BY num DESC;
