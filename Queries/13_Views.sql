/* Select Database */
USE RECORDS;

/* CREATE VIEWS */
/* 1) Simple View */
CREATE VIEW vw_StudentsAverage AS
SELECT MarksID, (English + Math) / 3 AS AverageMarks FROM StudentMarks;

/* 2) Updateable View */
CREATE VIEW vw_StudentsAge AS 
SELECT ID, Fname, Lname, Age FROM Students WHERE Age < 25;

UPDATE vw_StudentsAge SET Age = 30;	/* Updating table through View */

/* ALTER VIEW */
/* 1) Add New Column */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks;

/* 2) Change Expression Logic */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, ROUND((English + Math + History) / 3.0, 2) AS AverageMarks FROM StudentMarks;

/* 3) Add More Columns for Display */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, StudentID, English, Math, History, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks;

/* 4) Add Conditional Filter */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks 
WHERE (English + Math + History) / 3 <= 80;

/* 5) Add an Alias */
ALTER VIEW vw_StudentsAverage AS
SELECT MarksID, (English + Math + History) / 3 AS Avg_Marks FROM StudentMarks;

/* SELECT DATA FROM VIEW */
SELECT * FROM vw_StudentsAverage;

/* DROP VIEW */
DROP VIEW vw_StudentsAverage;

/* CHECK VIEWS OF A DATABASE */
SELECT Name AS ViewName, object_id, create_date AS CreationDate, modify_date AS ModificationDate
FROM sys.views;
