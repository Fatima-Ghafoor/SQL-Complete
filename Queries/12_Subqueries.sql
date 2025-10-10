/* Select Database */
USE RECORDS;

/* SUBQUERIES (Tables named StudentActivities & StudentMarks has already been created in 03_Properties & 04_Filtering.sql) */
/* 1) Scalar Subquery */
SELECT MarksID, Math, (Select AVG(Math) from StudentMarks) AS ClassMathAvg FROM StudentMarks;

/* 2) Multi-row Subquery */
SELECT MarksID, English, Math, History FROM StudentMarks WHERE StudentID IN 
(Select StudentID from StudentActivities Where Sports = 'Football');	/* IN */

SELECT MarksID, Math FROM StudentMarks WHERE Math > ANY 
(Select Trophies from StudentActivities Where Trophies is Not Null);	/* ANY */

SELECT MarksID, Math FROM StudentMarks WHERE History > ALL 
(Select Trophies from StudentActivities Where Trophies is Not Null);	/* ALL */

/* 3) Correlated Subquery */
SELECT MarksID, Math FROM StudentMarks s1 WHERE Math > 
(Select AVG(Math) from StudentMarks s2 Where s2.MarksID <> s1.MarksID);
/* --will show the students whose marks are greater than the average marks of everyone except themselves. */