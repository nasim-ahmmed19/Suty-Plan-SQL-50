/* Write your T-SQL query statement below */
-- select employee_id from employees where salary<30000 and manager_id not in (select employee_id from employees)
-- order by employee_id ;

SELECT employee_id 
FROM Employees e
WHERE salary < 30000 
  AND manager_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 
      FROM Employees m 
      WHERE m.employee_id = e.manager_id
  )
ORDER BY employee_id;