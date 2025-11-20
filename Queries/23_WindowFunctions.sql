/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql */

/* ROW NUMBERING & OVER */
/* 1) PARTITION BY */
SELECT ID, Fname, Lname, Salary, ROW_NUMBER() OVER(PARTITION BY Age ORDER BY Salary ASC) AS AgeGroupRank FROM TestEmployees;	/* Assigns a unique row number within each group */

/* 2) ORDER BY */
SELECT ID, Fname, Lname, Salary, ROW_NUMBER() OVER(ORDER BY Salary ASC) AS RowNumber FROM TestEmployees;	/* Assigns a unique row number based on sorted order */

/* RANKING */
/* 1) RANK */
SELECT ID, Fname, Lname, Salary, RANK() OVER(ORDER BY Salary ASC) AS SalaryRank FROM TestEmployees;	/* Assigns rank with gaps when values tie */

/* 2) DENSE RANK */
SELECT ID, Fname, Lname, Salary, DENSE_RANK() OVER(ORDER BY Salary ASC) AS SalaryDenseRank FROM TestEmployees;	/* Assigns rank without gaps when values tie */

/* DISTRIBUTION */
/* 1) NTILE */
SELECT ID, Fname, Lname, Salary, NTILE(2) OVER(ORDER BY Salary ASC) AS SalaryHalf FROM TestEmployees;	/* Divide rows into equal-sized buckets */

/* 2) PERCENTILE CONT */
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY Salary) OVER() AS MedianSalary FROM TestEmployees;	/* Returns the continuous percentile value (interpolated) */

/* 3) PERCENTILE DISC */
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY Salary) OVER() AS MedianSalary FROM TestEmployees;	/* Returns the discrete percentile value (exact existing row) */

/* 4) CUME MIST */
SELECT ID, Fname, Salary, CUME_DIST() OVER(ORDER BY Salary ASC) AS CumDist FROM TestEmployees;	/* Shows the cumulative proportion of rows <= current row */

/* 5) PERCENT RANK */
SELECT ID, Fname, Salary, PERCENT_RANK() OVER(ORDER BY Salary) AS PercentRank FROM TestEmployees ORDER BY Salary;	/* Shows the row's relative rank on a 0-1 scale */

/* NAVIGATION */
/* 1) LAG */
SELECT ID, Fname, Salary, LAG(Salary) OVER(ORDER BY Salary) AS PreviousSalary FROM TestEmployees ORDER BY Salary;	/* Retrieves the previous row's value */

/* 2) LEAD */
SELECT ID, Fname, Salary, LEAD(Salary) OVER(ORDER BY Salary) AS NextSalary FROM TestEmployees ORDER BY Salary;	/* Retrieves the next row's value */