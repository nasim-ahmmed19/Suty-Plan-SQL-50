/* Write your T-SQL query statement below */
-- select w1.id from weather as w1 inner join weather as w2 
-- on datediff(day,w2.recorddate,w1.recorddate)=1
-- where w1.temperature>w2.temperature

select w1.id from weather as w1 inner join weather as w2 on
datediff(day,w2.recorddate,w1.recorddate)=1 where
w1.temperature>w2.temperature
