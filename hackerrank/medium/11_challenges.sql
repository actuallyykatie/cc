/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, 
name, and the total number of challenges created by each student. Sort your results by the total number 
of challenges in descending order. If more than one student created the same number of challenges, then 
sort the result by hacker_id. If more than one student created the same number of challenges and the count 
is less than the maximum number of challenges created, then exclude those students from the result.

- Input Format
The following tables contain challenge data:
    - Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
    - Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student 
    who created the challenge. 

- Sample Output 0
    21283 Angela 6
    88255 Patrick 5
    96196 Lisa 1

- Sample Output 1
    12299 Rose 6
    34856 Angela 6
    79345 Frank 4
    80491 Patrick 3
    81041 Lisa 1

For *Sample Case 0*, we can get the following details:
    Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created 
    is 6 so these students are excluded from the result. 
For *Sample Case 1*, we can get the following details:
    Students 12299 and 34856 both created 6 challenges. Because 6 is the maximum number of challenges 
    created, these students are included in the result.
*/

SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS num_challenges
FROM
    challenges AS c, hackers AS h
WHERE
    c.hacker_id=h.hacker_id 
GROUP BY 
    h.hacker_id,
    h.name
HAVING
    num_challenges = (SELECT MAX(tmp1.cnt) 
                      FROM (
                          SELECT COUNT(challenge_id) AS cnt
                          FROM challenges
                          GROUP BY hacker_id) AS tmp1
                     ) 
    OR
    num_challenges IN (SELECT tmp2.cnt
                       FROM (
                           SELECT COUNT(challenge_id) AS cnt
                           FROM challenges
                           GROUP BY hacker_id
                            ) AS tmp2
                       GROUP BY tmp2.cnt
                       HAVING COUNT(tmp2.cnt) = 1 
                      )                
ORDER BY
    num_challenges DESC,
    hacker_id
;