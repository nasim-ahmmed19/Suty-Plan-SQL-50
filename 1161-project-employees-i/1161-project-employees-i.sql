-- SELECT 
--     p.project_id,
--     CAST(ROUND(AVG(CAST(e.experience_years AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_years
-- FROM project AS p 
-- INNER JOIN employee AS e ON p.employee_id = e.employee_id
-- GROUP BY p.project_id;

select 
    p.project_id,
    cast(round(avg(cast(e.experience_years as decimal(10,2))),2) as decimal(10,2)) as average_years
from project as p inner join employee as e on p.employee_id=e.employee_id
group by p.project_id
