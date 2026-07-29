/* Write your T-SQL query statement below */
--step 1
SELECT  
    employee_id,
    department_id
 FROM employee where primary_flag='Y' or employee_id in (select employee_id from employee group by employee_id having count(*)=1);

--step 2
-- SELECT employee_id, department_id
-- FROM (SELECT *, COUNT(*) OVER(PARTITION BY employee_id) cnt FROM Employee) t1
-- WHERE (cnt=1) OR (cnt<>1 AND primary_flag='Y');



