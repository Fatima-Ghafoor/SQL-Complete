/* Select Database */
USE RECORDS;

/* UPDATE TABLE DATA (Tables named Students & StudentsData have already been created in 01_Fundamentals.sql & 09_Joins.sql) */
/* 1) Basic */
UPDATE Students SET Age = 25;

/* 2) WHERE */
UPDATE Students SET Age = 23 WHERE ID = 2;

/* 3) JOIN */
UPDATE s
SET s.Age = s.Age + 1
FROM Students s
INNER JOIN StudentsData sd
ON s.ID = sd.ID;

/* 4) Subquery */
UPDATE Students SET Major = (Select Hobby from StudentsData Where ID = 2) WHERE ID = 1;

/* 5) OUTPUT */
UPDATE Students SET Age = Age + 1
OUTPUT deleted.ID, deleted.Age AS OldAge, inserted.Age AS NewAge
WHERE ID = 1;

/* DELETE TABLE DATA */
/* 1) Basic */
DELETE FROM Students;	/* --similar to Truncate */

/* 2) WHERE */
DELETE FROM Students WHERE ID = 1;

/* 3) JOIN */
/* This deletes from the Students, but only those who have a matching record in StudentsData with Age < 18. */
DELETE s
FROM Students s
INNER JOIN StudentsData sd
ON s.ID = sd.ID
WHERE sd.Age < 18;

/* This deletes from Students where no matching record exists in StudentsData */
DELETE s
FROM Students s
LEFT JOIN StudentsData sd
ON s.ID = sd.ID
WHERE sd.ID IS NULL;

/* --use INNER JOIN for common records and LEFT JOIN for records that only exist in the targeted table */

/* 4) Subquery */
DELETE FROM Students WHERE ID IN (Select ID from StudentsData);	/*  --will only remove Students who exist in StudentsData */

/* 5) OUTPUT */
DELETE FROM Students
OUTPUT deleted.ID, deleted.Fname, deleted.Lname
WHERE Age < 18;

/* TRUNCATE TABLE */
TRUNCATE TABLE Students;	/* --delete all records from table */