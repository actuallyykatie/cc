/*
Weather Observation Station 15

Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION 
that is less than 137.2345. Round your answer to 4 decimal places.

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
    lat_n < 137.2345 
ORDER BY 
    lat_n DESC
LIMIT 1;