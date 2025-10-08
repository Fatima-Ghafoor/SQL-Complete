/* Select Database */
USE RECORDS;

/* Tables named Students, StudentMarks & StudentsData has already been created in 01_Fundamentals.sql, 04_Filtering.sql & 09_Joins.sql */

/* CREATE Basic CASE EXPRESSION */
SELECT
	CASE
		WHEN English >= 50 THEN 'Pass in English'
		ELSE 'Fail'
	END AS EnglishResult
FROM StudentMarks;

/* 1) CASE with SELECT */
SELECT ID, Fname, Lname, Age,
	CASE
		WHEN Age < 18 THEN 'Minor'
		ELSE 'Adult'
	END AS Category
FROM Students;

/* Altering table StudentsData, for using CASE with UPDATE */
ALTER TABLE StudentsData ADD Remarks varchar(50) DEFAULT 'Pending' WITH VALUES;

/* 2) CASE with UPDATE */
UPDATE StudentsData SET Remarks =
	CASE
		WHEN TotalMarks > 250 THEN 'Outstanding'
		WHEN TotalMarks >= 200 AND TotalMarks <= 250 THEN 'Excellent'
		ELSE 'Needs Improvement'
	END;

/* 3) CASE with ORDER BY */
SELECT * FROM StudentsData ORDER BY
	CASE
		WHEN Country = 'Korea' THEN 1
		WHEN Country = 'Japan' THEN 2
		WHEN Country = 'Denmark' THEN 3
		WHEN Country = 'Italy' THEN 4
		WHEN Country = 'France' THEN 5
		ELSE 6
	END;

/* 4) CASE with JOIN */
SELECT s.ID, s.Fname, s.Lname, s.Major, sm.English, sm.Math, sm.History,
	CASE
		WHEN (sm.English + sm.Math + sm.History) >= 250 THEN 'Outstanding'
		WHEN (sm.English + sm.Math + sm.History) BETWEEN 200 AND 249 THEN 'Excellent'
		WHEN (sm.English + sm.Math + sm.History) BETWEEN 150 AND 199 THEN 'Good'
		ELSE 'Needs Improvement'
	END AS Remarks
FROM Students s INNER JOIN StudentMarks sm ON s.ID = sm.StudentID;

/* 5) CASE with WHERE */
SELECT * FROM StudentMarks WHERE
	CASE
		WHEN (English + Math + History) >= 250 THEN 'Outstanding'
		WHEN (English + Math + History) BETWEEN 200 AND 249 THEN 'Excellent'
		WHEN (English + Math + History) BETWEEN 150 AND 199 THEN 'Good'
		ELSE 'Needs Improvement'
	END = 'Outstanding';