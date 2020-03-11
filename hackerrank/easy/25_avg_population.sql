/*
Average Population

Query the average population for all cities in CITY, rounded down to the nearest integer.

- Input Format
    CITY
    +-------------+--------------+
    | Field       |  Type        |
    +-------------+--------------+
    | ID          | NUMBER       |
    | NAME        | VARCHAR2(17) |
    | COUNTRYCODE | VARCHAR2(3)  |
    | DISTRICT    | VARCHAR2(20) |
    | POPULATION  | NUMBER       |
    +-------------+--------------+
*/

SELECT
    ROUND(AVG(population))
FROM
    city;