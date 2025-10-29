/* Select Database */
USE RECORDS;

/* Table named 'Students' has already been created in 01_Fundamentals.sql */

/* ROW LIMITING */
/* 1) TOP */
SELECT TOP 2 * FROM Students;	/* Returns the specified number of rows */

/* 2) TOP n PERCENT */
SELECT TOP 50 PERCENT * FROM Students;	/* Returns the top n% of rows */

/* 3) WITH TIES */
SELECT TOP 2 WITH TIES * FROM Students;	/* Includes additional rows that match the last value in the TOP result */

/* 4) OFFSET ... FETCH NEXT */
SELECT * FROM Students ORDER BY ID OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;	/* Skips a number of rows and then returns the next set */
