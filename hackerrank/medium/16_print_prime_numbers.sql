/*

Write a query to print all *prime numbers* less than or equal to 1000. 
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers ≤ 10 would be:

    2&3&5&7

*/

SET @n:=1;
SET @d:=1;

SELECT 
    GROUP_CONCAT(num SEPARATOR '&')
FROM (
    SELECT
        @n:= @n + 1 AS num
    FROM
        information_schema.tables AS t1,
        information_schema.tables AS t2
    LIMIT 1000) AS numbers_to_check
WHERE 
    NOT EXISTS(
        SELECT * FROM 
            (SELECT 
                @d:= @d + 1 AS divisor 
             FROM
                information_schema.tables AS t3,
                information_schema.tables AS t4
             LIMIT 1000) AS divisors
        WHERE 
            MOD(num, divisor) = 0 AND 
            num <> divisor
    )
;

