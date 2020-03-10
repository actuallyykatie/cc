/*
## easy: 182. Duplicate Emails

### TASK 

Write a SQL query to find all duplicate emails in a table named `Person`.

    +----+---------+
    | Id | Email   |
    +----+---------+
    | 1  | a@b.com |
    | 2  | c@d.com |
    | 3  | a@b.com |
    +----+---------+

For example, your query should return the following for the above table:

    +---------+
    | Email   |
    +---------+
    | a@b.com |
    +---------+

**Note**: All emails are in lowercase. */

-- SOLUTION: # Write your MySQL query statement below
SELECT 
    email
FROM 
    person
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;
