/* 
s## easy: 197. Rising Temperature
### TASK 

Given a `Weather` table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

    +---------+------------------+------------------+
    | Id(INT) | RecordDate(DATE) | Temperature(INT) |
    +---------+------------------+------------------+
    |       1 |       2015-01-01 |               10 |
    |       2 |       2015-01-02 |               25 |
    |       3 |       2015-01-03 |               20 |
    |       4 |       2015-01-04 |               30 |
    +---------+------------------+------------------+

For example, return the following Ids for the above `Weather` table:

    +----+
    | Id |
    +----+
    |  2 |
    |  4 |
    +----+
*/

-- SOLUTION: # Write your MySQL query statement below
SELECT 
    w2.id
FROM 
    weather as w1, weather AS w2
WHERE 
    DATEDIFF(w2.RecordDate, w1.RecordDate) = 1 
    AND w2.Temperature > w1.Temperature
;