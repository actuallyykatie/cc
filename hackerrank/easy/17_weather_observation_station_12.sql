/*
Weather Observation Station 12

Query the list of CITY names from STATION that do not start with vowels and 
do not end with vowels. Your result cannot contain duplicates.

- Input Format
The STATION table is described as follows:
    +-------------+--------------+
    | Field       |  Type        |
    +-------------+--------------+
    | ID          | NUMBER       |
    | CITY        | VARCHAR2(21) |
    | STATE       | VARCHAR2(2)  |
    | LAT_N       | NUMBER       |
    | LONG_W      | NUMBER       |
    +-------------+--------------+

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

SELECT 
    DISTINCT city 
FROM 
    station
WHERE 
    left(city,1) NOT IN ('a','e','i','o','u') AND 
    right(city,1) NOT IN ('a','e','i','o','u')
;