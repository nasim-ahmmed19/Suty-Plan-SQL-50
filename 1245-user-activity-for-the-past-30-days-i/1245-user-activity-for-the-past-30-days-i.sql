/* Write your T-SQL query statement below */
-- select 
--     activity_date AS day,count(DISTINCT user_id) as active_users 
-- from activity where activity_type in ('open_session', 'end_session', 'scroll_down', 'send_message')
-- group by activity_date having min(activity_date)>='2019-06-28' and max(activity_date)<='2019-07-27'

/* Write your T-SQL query statement below */
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
  AND activity_type IN ('open_session', 'end_session', 'scroll_down', 'send_message')
GROUP BY activity_date;