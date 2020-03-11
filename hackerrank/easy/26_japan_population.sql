/*
Japan Population

Query the sum of the populations for all Japanese cities in CITY. 
The COUNTRYCODE for Japan is JPN.

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
    SUM(population)
FROM
    city
WHERE
    countrycode = 'JPN';