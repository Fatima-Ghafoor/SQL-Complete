/* Select Database */
USE RECORDS;

/* Table named 'StudentMarks' has already been created in 04_Filtering.sql */

/* AGGREGATE FUNCTIONS */
/* 1) SUM */
SELECT SUM(English) AS TotalEnglishMarks FROM StudentMarks;	/* Sum English marks of all students */

/* 2) AVG */
SELECT AVG(History) AS AverageHistoryMarks FROM StudentMarks;	/* Find the Average History marks of all students */

/* 3) COUNT */
SELECT COUNT(Math) AS TotalMathCount FROM StudentMarks;	/* Find the total Math marks obtained */

/* 4) MIN */
SELECT MIN(English) AS MinimumEnglishMarks FROM StudentMarks;	/* Find the Lowest English marks obtained among all students */

/* 5) MAX */
SELECT MAX(History) AS MaximumHistoryMarks FROM StudentMarks;	/* Find the Highest History marks obtained among all students */
