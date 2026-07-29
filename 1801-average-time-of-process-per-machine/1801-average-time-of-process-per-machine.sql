/* Write your T-SQL query statement below */
select 
    a1.machine_id,
    cast(sum(a2.timestamp-a1.timestamp)/count(*) as decimal(10,3)) as processing_time  
from (select * from activity where activity_type='start') as a1
inner join (select * from activity where activity_type='end') as a2
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
group by a1.machine_id;