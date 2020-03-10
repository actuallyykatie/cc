/*
## medium: 626. Exchange Seats

### TASK 

Mary is a teacher in a middle school and she has a table `seat` storing students' names and their corresponding seat ids.

The column **id** is continuous increment. Mary wants to change seats for the adjacent students. Can you write a SQL query to output the result for Mary?

    +---------+---------+
    |    id   | student |
    +---------+---------+
    |    1    | Abbot   |
    |    2    | Doris   |
    |    3    | Emerson |
    |    4    | Green   |
    |    5    | Jeames  |
    +---------+---------+

For the sample input, the output is:

    +---------+---------+
    |    id   | student |
    +---------+---------+
    |    1    | Doris   |
    |    2    | Abbot   |
    |    3    | Green   |
    |    4    | Emerson |
    |    5    | Jeames  |
    +---------+---------+

**Note:**If the number of students is odd, there is no need to change the last one's seat.
*/

-- SOLUTION: # Write your MySQL query statement below
SELECT
    IF(id < (SELECT COUNT(*) FROM seat), 
        IF(id % 2 = 0, id - 1, id + 1), 
        IF(id % 2 = 0, id-1, id)
        ) AS id, 
    student
FROM
    seat
ORDER BY
    id;

-- Using `COALESCE()`: # Write your MySQL query statement below
SELECT
    seat.id, 
    COALESCE(s.student, seat.student) AS student
FROM
    seat
LEFT JOIN
    seat AS s
ON 
    ((seat.id + 1) ^ 1 - 1) = s.id
ORDER BY 
    seat.id
;

/* Notes:
- `COALESCE()` – for correct output for the last record
- `((seat.id + 1) ^ 1 - 1) = s.id` – new id after switching */