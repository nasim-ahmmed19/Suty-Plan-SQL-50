/* Write your T-SQL query statement below */
select 
    e2.employee_id,
    e2.name,
    count(e1.employee_id) as reports_count,
    round(avg(e1.age * 1.0),0) as average_age
from employees as e1 inner join employees as e2 
on e1.reports_to=e2.employee_id 
group by e2.employee_id, e2.name
order by e2.employee_id asc;

-- select 
--     e2.employee_id,
--     e2.name,
--     count(e1.employee_id) as reports_count,
--     round(avg(cast(e1.age as decimal(10,2))),0) as average_age
-- from employees as e1 inner join employees as e2 
-- on e1.reports_to=e2.employee_id 
-- group by e2.employee_id, e2.name
-- order by e2.employee_id asc;