/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the 
hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the 
same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

- Input Format
The following tables contain contest data:
    - *Hackers:* The *hacker_id* is the id of the hacker, and *name* is the name of the hacker.
    - *Submissions:* The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission.

- Sample Output

    4071 Rose 191
    74842 Lisa 174
    84072 Bonnie 100
    4806 Angela 89
    26071 Frank 85
    80305 Kimberly 67
    49438 Patrick 43

- Explanation
Hacker 4071 submitted solutions for challenges 19797and 49593, so the total score = 95 + max(43, 96) = 191. 
Hacker 74842 submitted solutions for challenges 19797and 63132, so the total score = max(98, 5) + 76 = 174. 
Hacker 84072 submitted solutions for challenges 49593and 63132, so the total score = 100 + 0 = 100. 
The total scores for hackers 4806, 26071, 80305, and 49438 can be similarly calculated.
*/

SELECT 
    hackers.hacker_id,
    hackers.name,
    SUM(scores.max_score) AS total_score
FROM (
    SELECT 
        hacker_id, 
        challenge_id,
        MAX(score) AS max_score
    FROM
        submissions
    GROUP BY
        hacker_id,
        challenge_id) AS scores
JOIN
    hackers
ON
    hackers.hacker_id = scores.hacker_id
GROUP BY
    hackers.hacker_id,
    hackers.name
HAVING 
    SUM(scores.max_score) > 0
ORDER BY 
    SUM(scores.max_score) DESC, 
    hackers.hacker_id
;