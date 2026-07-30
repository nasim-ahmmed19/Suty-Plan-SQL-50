/* Write your T-SQL query statement below */
with cte_first as (
    select 
        *,
        dense_rank() over(partition by departmentId order by salary desc) as rn
    from employee 
    )
    select
        d.name as Department,
        cf.name as Employee,
        cf.salary as Salary 
    from cte_first as cf inner join  department as d 
    on cf.departmentid=d.id where cf.rn<=3