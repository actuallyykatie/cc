/*
## hard: 185. Department Top Three Salaries

### TASK 

The `Employee` table holds all employees. Every employee has an Id, and there is also a column for the department Id.

    +----+-------+--------+--------------+
    | Id | Name  | Salary | DepartmentId |
    +----+-------+--------+--------------+
    | 1  | Joe   | 85000  | 1            |
    | 2  | Henry | 80000  | 2            |
    | 3  | Sam   | 60000  | 2            |
    | 4  | Max   | 90000  | 1            |
    | 5  | Janet | 69000  | 1            |
    | 6  | Randy | 85000  | 1            |
    | 7  | Will  | 70000  | 1            |
    +----+-------+--------+--------------+

The `Department` table holds all departments of the company.

    +----+----------+
    | Id | Name     |
    +----+----------+
    | 1  | IT       |
    | 2  | Sales    |
    +----+----------+

Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).

    +------------+----------+--------+
    | Department | Employee | Salary |
    +------------+----------+--------+
    | IT         | Max      | 90000  |
    | IT         | Randy    | 85000  |
    | IT         | Joe      | 85000  |
    | IT         | Will     | 70000  |
    | Sales      | Henry    | 80000  |
    | Sales      | Sam      | 60000  |
    +------------+----------+--------+

**Explanation:**

In IT department, Max earns the highest salary, both Randy and Joe earn the second highest salary, and Will earns the third highest salary. There are only two employees in the Sales department, Henry earns the highest salary while Sam earns the second highest salary.
*/

-- SOLUTION:
-- - Using `RANK()`:
/* Write your T-SQL query statement below */
SELECT
    dep.name AS Department,
    ranked.name AS Employee,
    ranked.salary AS Salary
FROM 
    (SELECT
        DENSE_RANK() OVER(PARTITION BY departmentId 
                        ORDER BY departmentId, salary DESC) AS rnk, 
        name,
        salary,
        departmentId
    FROM
        employee 
    ) AS ranked,
    department AS dep
WHERE
    ranked.rnk <= 3 AND
    ranked.departmentId = dep.Id;

-- Another without RANK(): # Write your MySQL query statement below
SELECT
    dep.name AS Department,
    employee.name AS Employee,
    employee.salary AS Salary
FROM
    employee,
    department AS dep
WHERE
    3 > (SELECT 
            COUNT(DISTINCT salary)
        FROM
            employee AS e
        WHERE 
            employee.departmentId=e.departmentId AND
            e.salary > employee.salary
        ) 
    AND employee.departmentId = dep.id
ORDER BY
    employee.departmentId,
    employee.salary DESC
;
