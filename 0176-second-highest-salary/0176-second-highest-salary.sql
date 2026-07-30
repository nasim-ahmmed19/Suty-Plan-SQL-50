/* Write your T-SQL query statement below */
-- with cte_first as (
--     select* from (SELECT 
--         id,
--         salary,
--         rank() over(order by salary desc) as rn 
--     FROM Employee)t where rn=2
-- )
-- select max(salary) as SecondHighestSalary  from cte_first group by salary having count(salary)=1

WITH cte_first AS (
    SELECT 
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rn 
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary 
FROM cte_first 
WHERE rn = 2;