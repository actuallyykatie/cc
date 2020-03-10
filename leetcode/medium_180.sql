/*
## medium: 180. Consecutive Numbers

### TASK 

Write a SQL query to find all numbers that appear at least three times consecutively.

    +----+-----+
    | Id | Num |
    +----+-----+
    | 1  |  1  |
    | 2  |  1  |
    | 3  |  1  |
    | 4  |  2  |
    | 5  |  1  |
    | 6  |  2  |
    | 7  |  2  |
    +----+-----+

For example, given the above `Logs` table, `1` is the only number that appears consecutively for at least three times.

    +-----------------+
    | ConsecutiveNums |
    +-----------------+
    | 1               |
    +-----------------+
*/


-- SOLUTION: # Write your MySQL query statement below
SELECT
    DISTINCT l1.num AS ConsecutiveNums
FROM
    logs AS l1,
    logs AS l2,
    logs AS l3
WHERE 
    l1.num = l2.num AND 
    l2.num = l3.num AND
    l1.id = l2.id + 1 AND
    l2.id = l3.id + 1;
