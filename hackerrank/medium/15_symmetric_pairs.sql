/*


You are given a table, *Functions*, containing two columns: *X* and *Y*.
![https://s3.amazonaws.com/hr-challenge-images/12892/1443818798-51909e977d-1.png](https://s3.amazonaws.com/hr-challenge-images/12892/1443818798-51909e977d-1.png)

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X.

- Sample Input
    +------+------+
    | X    | Y    |
    +------+------+
    | 20   | 20   |
    | 20   | 20   |
    | 20   | 21   |
    | 23   | 22   |
    | 22   | 23   |
    | 21   | 20   |
    +------+------+

- Sample Output
    20 20
    20 21
    22 23
*/

-- first version
SELECT 
    DISTINCT 
        f1.x, 
        f1.y   
FROM (
    SELECT 
        x, 
        y,
        ROW_NUMBER() OVER(PARTITION BY x, y ORDER BY x) as cnt 
    FROM 
        functions) AS f1
JOIN
    functions AS f2
ON
    f1.X = f2.Y AND 
    f1.Y = f2.X AND 
    (f1.X != f1.Y OR cnt > 1) AND
    f1.X <= f1.Y                                  
ORDER BY 
    f1.X
;


-- another
WITH funcs AS(
    SELECT
        f1.X,
        f1.Y
    FROM
        functions AS f1,
        functions AS f2
    WHERE
        (f1.X = f2.Y AND f2.X = f1.Y )
)

SELECT *
FROM
    (SELECT 
        CASE WHEN x <= y THEN x 
            WHEN x > y THEN y 
            END AS x,
        CASE WHEN x <= y THEN y
            WHEN x > y THEN x
            END AS y
    FROM funcs ) as tmp1
GROUP BY
    x,y
HAVING 
    COUNT(*) >= 2
ORDER BY 
    x;


