/*
Weather Observation Station 17

Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION 
is greater than . Round your answer to  decimal places.

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
    ROUND(long_w, 4)
FROM 
    station
WHERE
    lat_n > 38.7780 
ORDER BY
    lat_n
LIMIT 1;