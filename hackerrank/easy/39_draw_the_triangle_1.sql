/*
Draw The Triangle 1

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
    * * * * * 
    * * * * 
    * * * 
    * * 
    *
Write a query to print the pattern P(20).
*/

SET @r:=21;
SELECT
    REPEAT('* ', @r:= @r-1)
FROM
    information_schema.tables;