/*
Draw The Triangle 2

P(R) represents a pattern drawn by Julia in R rows. 
The following pattern represents P(5):
    * 
    * * 
    * * * 
    * * * * 
    * * * * *
Write a query to print the pattern P(20).
*/

SET @r:=0;
SELECT 
    REPEAT('* ', @r:= @r + 1)
FROM
    information_schema.tables
LIMIT 
    20;