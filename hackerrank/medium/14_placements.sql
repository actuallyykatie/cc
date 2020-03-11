/*
You are given three tables: Students, Friends and Packages. Studentscontains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: 
IDand Salary (offered salary in $ thousands per month).
![https://s3.amazonaws.com/hr-challenge-images/12895/1443820186-2a9b4939a8-1.png](https://s3.amazonaws.com/hr-challenge-images/12895/1443820186-2a9b4939a8-1.png)

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

- Sample Input
![https://s3.amazonaws.com/hr-challenge-images/12895/1443820079-9bd1e231b1-2_1.png](https://s3.amazonaws.com/hr-challenge-images/12895/1443820079-9bd1e231b1-2_1.png)
![https://s3.amazonaws.com/hr-challenge-images/12895/1443820100-adb691b2f5-2_2.png](https://s3.amazonaws.com/hr-challenge-images/12895/1443820100-adb691b2f5-2_2.png)

- Sample Output
    Samantha
    Julia
    Scarlet

- Explanation
See the following table:
![https://s3.amazonaws.com/hr-challenge-images/12895/1443819966-c37c146d27-3.png](https://s3.amazonaws.com/hr-challenge-images/12895/1443819966-c37c146d27-3.png)

Now,
- Samantha's best friend got offered a higher salary than her at 11.55
- Julia's best friend got offered a higher salary than her at 12.12
- Scarlet's best friend got offered a higher salary than her at 15.2
- Ashley's best friend did NOT get offered a higher salary than her

The name output, when ordered by the salary offered to their friends, will be:
- Samantha
- Julia
- Scarlet

*/

-- short solution c:
SELECT
    stud.name
FROM 
    students AS stud, 
    friends AS fren, 
    packages AS pack_i,
    packages AS pack_f
WHERE
    stud.id = fren.id AND
    fren.id = pack_i.id AND
    fren.friend_id = pack_f.id AND
    pack_i.salary < pack_f.salary
ORDER BY
    pack_f.salary ;


-- longer solution
WITH stud_salary AS(
    SELECT 
        students.name,
        students.id,
        packages.salary,
        friends.friend_id AS friend_id
    FROM
        students,
        packages,
        friends
    WHERE 
        students.id = packages.id AND
        students.id = friends.id
),
friends_salary AS(
    SELECT 
        friends.friend_id,
        packages.salary AS salary
    FROM
        friends,
        packages
    WHERE
        friends.friend_id = packages.id
)

SELECT 
    ss.name
FROM
    stud_salary AS ss,
    friends_salary AS fs
WHERE
    ss.friend_id = fs.friend_id AND
    ss.salary < fs.salary
ORDER BY
    fs.salary

