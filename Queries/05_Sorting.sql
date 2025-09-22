/* Select Database */
USE RECORDS;

/* SORTING with ORDER BY (Table named Students has already been created in 01_Fundamentals.sql) */
SELECT * FROM Students ORDER BY Lname ASC;	/* ASC */
SELECT * FROM Students ORDER BY Fname DESC;	/* DESC */
SELECT * FROM Students ORDER BY LEN(Fname);	/* EXPRESSION */
SELECT ID, Fname, Lname, Major FROM Students ORDER BY 4;	/* COLUMN POSITION */


/* ORDER BY can be used with more EXPRESSIONS like:
1) String Functions: LEN(), UPPER(), LOWER(), LEFT(), RIGHT(), SUBSTRING(), REVERSE(), LTRIM(), RTRIM(), CONCAT();
2) Numeric/Math Functions: ABS(), ROUND(), CEILIGN(), FLOOR(), POWER(), SQRT(), EXP(), LOG(), SIGN();
3) Date/Time Functions: YEAR(), MONTH(), DAY(), DATENAME(), DATEPART(), GETDATE(); */