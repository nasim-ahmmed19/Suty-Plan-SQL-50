/* Write your T-SQL query statement below */
with cte_first as (
select distinct
    s.student_id,s.student_name,b.subject_name 
 from students as s cross join subjects as b 
)
select 
    f.student_id,f.student_name,f.subject_name ,
    count(e.subject_name) as attended_exams
from cte_first as f left join Examinations as e on f.student_id=e.student_id and f.subject_name=e.subject_name
group by f.student_id,f.student_name,f.subject_name 
order by f.student_id,f.subject_name
