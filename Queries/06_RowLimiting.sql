/* Select Database */
USE RECORDS;

/* ROW LIMITING (Table named Students has already been created in 01_Fundamentals.sql) */
SELECT TOP 2 * FROM Students;	/* TOP */
SELECT TOP 50 PERCENT * FROM Students;	/* TOP n PERCENT*/
SELECT TOP 2 WITH TIES * FROM Students ORDER BY Fname ASC;	/* WITH TIES (with String) */
SELECT TOP 2 WITH TIES * FROM Students ORDER BY Age DESC;	/* WITH TIES (with Number) */
SELECT * FROM Students ORDER BY ID OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;	/* OFFSET... FETCH NEXT */