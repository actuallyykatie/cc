/*
## medium: 184. Department Highest Salary

### TASK 

The `Employee` table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

    +----+-------+--------+--------------+
    | Id | Name  | Salary | DepartmentId |
    +----+-------+--------+--------------+
    | 1  | Joe   | 70000  | 1            |
    | 2  | Jim   | 90000  | 1            |
    | 3  | Henry | 80000  | 2            |
    | 4  | Sam   | 60000  | 2            |
    | 5  | Max   | 90000  | 1            |
    +----+-------+--------+--------------+

The `Department` table holds all departments of the company.

    +----+----------+
    | Id | Name     |
    +----+----------+
    | 1  | IT       |
    | 2  | Sales    |
    +----+----------+

Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

    +------------+----------+--------+
    | Department | Employee | Salary |
    +------------+----------+--------+
    | IT         | Max      | 90000  |
    | IT         | Jim      | 90000  |
    | Sales      | Henry    | 80000  |
    +------------+----------+--------+

**Explanation:**

Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
*/

-- SOLUTION # Write your MySQL query statement below 
SELECT
    department.name AS Department,
    e.Name AS Employee,
    e.Salary 
FROM
    employee AS e,
    (SELECT 
        departmentId,
        MAX(salary) AS max_salary
    FROM
        employee
    GROUP BY
        departmentId) AS dep_max,
    department 
WHERE 
    e.departmentId = dep_max.departmentId AND
    e.salary = dep_max.max_salary AND
    dep_max.departmentId = department.id;
    

-- Another version using RANK():
/* Write your T-SQL query statement below */
SELECT 
    department.Name AS Department, 
    ranked.Name AS Employee,
    ranked.salary AS Salary
FROM
    (SELECT
        RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk,
        departmentId, 
        name,
        salary
    FROM 
        employee) AS ranked,
    department
WHERE 
    ranked.rnk = 1 AND 
    ranked.departmentId = department.id
;
