/* Write your T-SQL query statement below */
select e2.name from employee as e1 inner join employee as e2 on
e1.managerid=e2.id group by e2.id,e2.name having count(e2.id)>=5;