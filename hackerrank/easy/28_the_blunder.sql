/*
The blunder

Samantha was tasked with calculating the average monthly salaries for all employees 
in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after 
completing the calculation. She wants your help finding the difference between her miscalculation 
(using salaries with any zeroes removed), and the actual average salary.
Write a query calculating the amount of error (i.e.: `actual-miscalculated` average monthly salaries), 
and round it up to the next integer.

- Input Format
The EMPLOYEES table is described as follows:
    +--------+----------+
    | Column |  Type    |
    +--------+----------+
    | ID     | Integer  |
    | Name   | String   |
    | Salary | Integer  |
    +--------+----------+
Note: Salary is measured in dollars per month and its value is < 10^5.
- Sample Input
    +----+----------+--------+
    | ID | Name     | Salary |
    +----+----------+--------+
    | 1  | Kristeen | 1420   |
    | 2  | Ashley   | 2006   |
    | 3  | Julia    | 2210   |
    | 4  | Maria    | 3000   |
    +----+----------+--------+

- Sample Output
    2061

-   Explanation
The table below shows the salaries without zeroes as they were entered by Samantha:
    +----+----------+--------+
    | ID | Name     | Salary |
    +----+----------+--------+
    | 1  | Kristeen | 142    |
    | 2  | Ashley   | 26     |
    | 3  | Julia    | 221    |
    | 4  | Maria    | 3      |
    +----+----------+--------+

2159.00 - 98.00 = 2061
*/

SELECT
    CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM 
    employees;