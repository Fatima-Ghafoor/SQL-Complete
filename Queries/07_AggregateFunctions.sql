/* Select Database */
USE RECORDS;

/* AGGREGATE FUNCTIONS (Table named StudentMarks has already been created in 04_Filtering.sql) */
SELECT SUM(English) AS TotalEnglishMarks FROM StudentMarks;	/* SUM */
SELECT AVG(History) AS AverageHistoryMarks FROM StudentMarks;	/* AVG */
SELECT COUNT(Math) AS TotalMathCount FROM StudentMarks;	/* COUNT */
SELECT MIN(English) AS MinimumEnglishMarks FROM StudentMarks;	/* MIN */
SELECT MAX(History) AS MaximumHistoryMarks FROM StudentMarks;	/* MAX */
