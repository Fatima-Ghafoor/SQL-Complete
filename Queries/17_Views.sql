/* Select Database */
USE RECORDS;

/* Table named 'StudentMarks' has already been created in 04_Filtering.sql */

/* CREATE VIEWS */
/* 1) SIMPLE VIEW */
CREATE VIEW vw_StudentsAverage AS
SELECT MarksID, (English + Math) / 3 AS AverageMarks FROM StudentMarks;

/* 2) UPDATEABLE VIEW */
CREATE VIEW vw_StudentsAge AS 
SELECT ID, Fname, Lname, Age FROM Students WHERE Age < 25;

UPDATE vw_StudentsAge SET Age = 30;	/* Updating table through View */

/* ALTER VIEW */
/* 1) ADD NEW COLUMN */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks;

/* 2) CHANGE EXPRESSION LOGIC */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, ROUND((English + Math + History) / 3.0, 2) AS AverageMarks FROM StudentMarks;

/* 3) ADD MORE COLUMNS FOR DISPLAY */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, StudentID, English, Math, History, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks;

/* 4) ADD CONDITIONAL FILTER */
ALTER VIEW vw_StudentsAverage AS 
SELECT MarksID, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks 
WHERE (English + Math + History) / 3 <= 80;

/* 5) ADD AN ALIAS */
ALTER VIEW vw_StudentsAverage AS
SELECT MarksID, (English + Math + History) / 3 AS Avg_Marks FROM StudentMarks;

/* SELECT DATA FROM VIEW */
SELECT * FROM vw_StudentsAverage;

/* DROP VIEW */
DROP VIEW vw_StudentsAverage;

/* CHECK VIEWS OF A DATABASE */
SELECT Name AS ViewName, object_id, create_date AS CreationDate, modify_date AS ModificationDate
FROM sys.views;
