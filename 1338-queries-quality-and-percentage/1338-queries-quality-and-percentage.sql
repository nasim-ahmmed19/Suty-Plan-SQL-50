/* Write your T-SQL query statement below */
SELECT query_name,
       ROUND(SUM(quality) * 1.0 / COUNT(*), 2) AS quality,
       ROUND(SUM(is_poor) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM (
    SELECT query_name,
           CAST(rating AS FLOAT) / position AS quality,
           CASE WHEN rating < 3 THEN 1 ELSE 0 END AS is_poor
    FROM Queries
) AS new
GROUP BY query_name;
