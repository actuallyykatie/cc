/*
## medium: 177. Nth Highest Salary

### TASK 

Write a SQL query to get the *n*th highest salary from the `Employee` table.

    +----+--------+
    | Id | Salary |
    +----+--------+
    | 1  | 100    |
    | 2  | 200    |
    | 3  | 300    |
    +----+--------+

For example, given the above Employee table, the *n*th highest salary where *n* = 2 is `200`. If there is no *n*th highest salary, then the query should return `null`.

    +------------------------+
    | getNthHighestSalary(2) |
    +------------------------+
    | 200                    |
    +------------------------+
*/

-- SOLUTION:

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT; 
SET M = N - 1;
  RETURN (
    SELECT 
      DISTINCT Salary 
    FROM 
      Employee 
    ORDER BY 
      Salary DESC 
    LIMIT 1 OFFSET M
  );
END

