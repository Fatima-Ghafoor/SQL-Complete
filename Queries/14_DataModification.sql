/* Select Database */
USE RECORDS;

/* Tables named 'Students' & 'StudentsData' have already been created in 01_Fundamentals.sql & 13_Joins.sql */

/* UPDATE TABLE DATA */
/* 1) BASIC */
UPDATE Students SET Age = 25;

/* 2) WHERE */
UPDATE Students SET Age = 23 WHERE ID = 2;

/* 3) JOIN */
UPDATE s
SET s.Age = s.Age + 1
FROM Students s
INNER JOIN StudentsData sd
ON s.ID = sd.ID;

/* 4) SUBQUERY */
UPDATE Students SET Major = (Select Hobby from StudentsData Where ID = 2) WHERE ID = 1;

/* 5) OUTPUT */
UPDATE Students SET Age = Age + 1
OUTPUT deleted.ID, deleted.Age AS OldAge, inserted.Age AS NewAge
WHERE ID = 1;

/* DELETE TABLE DATA */
/* 1) BASIC */
DELETE FROM Students;	/* --similar to Truncate */

/* 2) WHERE */
DELETE FROM Students WHERE ID = 1;

/* 3) JOIN */
DELETE s
FROM Students s
INNER JOIN StudentsData sd
ON s.ID = sd.ID
WHERE sd.Age < 18;
/* This deletes from the Students, but only those who have a matching record in StudentsData with Age < 18 */

DELETE s
FROM Students s
LEFT JOIN StudentsData sd
ON s.ID = sd.ID
WHERE sd.ID IS NULL;
/* This deletes from Students where no matching record exists in StudentsData */

/* Use INNER JOIN for common records and LEFT JOIN for records that only exist in the targeted table */

/* 4) SUBQUERY */
DELETE FROM Students WHERE ID IN (Select ID from StudentsData);	/*  Only remove Students who exist in StudentsData */

/* 5) OUTPUT */
DELETE FROM Students
OUTPUT deleted.ID, deleted.Fname, deleted.Lname
WHERE Age < 18;

/* TRUNCATE TABLE */
TRUNCATE TABLE Students;	/* Delete all records from table */
