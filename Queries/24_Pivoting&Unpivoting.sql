/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql */

/* PIVOTING */
SELECT * FROM (SELECT Age, Salary FROM TestEmployees) AS SourceTable 
PIVOT (SUM(Salary) FOR Age IN ([30], [32])) AS PivotTable;
/* Converts rows into columns */

/* UNPIVOTING */
SELECT ID, Fname, Attribute, Value FROM TestEmployees 
UNPIVOT (Value FOR Attribute IN (Age, Salary)) AS UnpivotTable;
/* Converts columns into rows */

/* MANUAL PIVOTING USING CASE WHEN */
SELECT
	SUM(CASE WHEN Age = 30 THEN Salary END) AS Age30_Salary,
	SUM(CASE WHEN Age = 32 THEN Salary END) AS Age32_Salary
FROM TestEmployees;
/* Converts rows into columns manually using conditional aggregation without using PIVOT operator */

/* DYNAMIC PIVOTING */
/* Step 1: Declare variables */
DECLARE @Columns nvarchar(max), @SQL nvarchar(max);

/* Step 2: Dynamically get all unique Age values and convert to a column list */
SELECT @Columns = STRING_AGG(QUOTENAME(Age), ',') 
FROM (SELECT DISTINCT Age FROM TestEmployees) AS AgeList;

/* Step 3: Build dynamic SQL string for pivoting */
SET @SQL = N'
SELECT * FROM (SELECT Age, Salary FROM TestEmployees) AS SourceTable 
PIVOT (SUM(Salary) FOR Age IN (' + @Columns + ')) AS PivotTable;';

/* Step 4: Execute the query */
EXEC sp_executesql @SQL;
/* Automatically generates pivot columns at runtime using dynamic SQL when column names are unknown or change frequently */