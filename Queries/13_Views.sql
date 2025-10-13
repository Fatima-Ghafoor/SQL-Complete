/* Select Database */
USE RECORDS;

/* CREATE VIEWS */
/* 1) Simple View */
CREATE VIEW vw_StudentsAverage AS
SELECT MarksID, (English + Math + History) / 3 AS AverageMarks FROM StudentMarks;

/* 2) Updateable View */
CREATE VIEW vw_StudentsAge AS 
SELECT ID, Fname, Lname, Age FROM Students WHERE Age < 25;

UPDATE vw_StudentsAge SET Age = 30;	/* Updating table through View */

/* DROP VIEW */
DROP VIEW vw_StudentsAverage;