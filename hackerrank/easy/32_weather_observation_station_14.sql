/*
Weather Observation Station 14

Query the greatest value of the Northern Latitudes (LAT_N) from STATION 
that is less than 137.2345. Truncate your answer to 4 decimal places.

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
    ROUND(MAX(lat_n), 4)
FROM
    station
WHERE
    lat_n < 137.2345;