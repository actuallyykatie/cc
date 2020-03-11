/*
Query a list of CITY names from STATION with even ID numbers only. 
You may print the results in any order, but must exclude duplicates 
from your answer.

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
    id % 2 = 0
;