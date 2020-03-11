/*
Weather Observation Station 6

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
from STATION. Your result cannot contain duplicates.

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
    city RLIKE '^[aeiouAEIOU]'
;