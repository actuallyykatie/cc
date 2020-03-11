/*
Type of Triangle

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
Output one of the following statements for each record in the table:
    - Equilateral: It's a triangle with 3 sides of equal length.
    - Isosceles: It's a triangle with 2 sides of equal length.
    - Scalene: It's a triangle with 3 sides of differing lengths.
    - Not A Triangle: The given values of A, B, and C don't form a triangle.

- Input Format
The TRIANGLES table is described as follows:
    +--------+----------+
    | Column |  Type    |
    +--------+----------+
    | A      | Integer  |
    | B      | Integer  |
    | C      | Integer  |
    +--------+----------+
Each row in the table denotes the lengths of each of a triangle's three sides.

- Sample Input
    +----+----+----+
    | A  | B  | C  |
    +----+----+----+
    | 20 | 20 | 23 |
    | 20 | 20 | 20 |
    | 20 | 21 | 22 |
    | 13 | 14 | 30 |
    +----+----+----+

- Sample Output
    Isosceles
    Equilateral
    Scalene
    Not A Triangle
*/

SELECT
    CASE
        WHEN a+b > c AND a+c > b AND b+c > a 
            THEN CASE
                WHEN a=b AND b=c AND a=c 
                    THEN 'Equilateral'
                WHEN a=b OR a=c OR b=c 
                    THEN 'Isosceles'
                WHEN a!=b OR a!=c OR b!=c 
                    THEN 'Scalene' END
        ELSE 'Not A Triangle'
    END AS triangle_type
FROM 
    triangles
;