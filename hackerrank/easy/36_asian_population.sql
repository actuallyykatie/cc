/*
Asian Population

Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

- Input Format
The CITY and COUNTRY tables are described as follows: 
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

    COUNTRY
    +----------------+--------------+
    | Field          |  Type        |
    +----------------+--------------+
    | CODE           | VARCHAR2(3)  |
    | NAME           | VARCHAR2(44) |
    | CONTINENT      | VARCHAR2(13) |
    | REGION         | VARCHAR2(25) |
    | SURFACEAREA    | NUMBER       |
    | INDEPYEAR      | VARCHAR2(5)  |
    | POPULATION     | NUMBER       |
    | LIFEEXPECTANCY | VARCHAR2(4)  |
    | GNP            | NUMBER       |
    | GNPOLD         | VARCHAR2(9)  |
    | LOCALNAME      | VARCHAR2(44) |
    | GOVERNMENTFORM | VARCHAR2(44) |
    | HEADOFSTATE    | VARCHAR2(32) |
    | CAPITAL        | VARCHAR2(4)  |
    | CODE2          | VARCHAR2(2)  |
    +----------------+--------------+
*/

SELECT 
    SUM(city.population)
FROM
    city
JOIN 
    country
ON 
    city.countrycode = country.code
WHERE 
    continent = 'Asia';