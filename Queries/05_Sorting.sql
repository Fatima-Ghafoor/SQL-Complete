/* Select Database */
USE RECORDS;

/* Table named 'Students' has already been created in 01_Fundamentals.sql */

/* SORTING with ORDER BY */
/* 1) ASC */
SELECT * FROM Students ORDER BY Lname ASC;	/* Sort result in Ascending Order (Small to Large) */

/* 2) DESC */
SELECT * FROM Students ORDER BY Fname DESC;	/* Sort result in Descending Order (Large to Small) */

/* 3) COLUMN POSITION */
SELECT ID, Fname, Lname, Major FROM Students ORDER BY 4;	/* Sorts result based on the column’s numeric position */
