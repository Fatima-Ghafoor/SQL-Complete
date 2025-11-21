/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql */

/* EXEC */
--Step 1: Declare a variable for the table name
DECLARE @TableName nvarchar(50) = 'TestEmployees';

--Step 2: Declare a variable to store the SQL query
DECLARE @SQL nvarchar(max);

--Step 3: Build the dynamic SQL string
SET @SQL = 'SELECT * FROM ' + @TableName;

--Step 4: Execute the SQL string
EXEC(@SQL);

/* SP_EXECUTESQL */
--Step 1: Declare a variable that holds the value you want to pass as a parameter
DECLARE @RequiredAge int = 32;

--Step 2: Declare a variable to store the dynamic SQL statement
DECLARE @SQL nvarchar(max);

--Step 3: Build the SQL string with a parameter placeholder (NOT concatenated)
SET @SQL = N'SELECT * FROM TestEmployees WHERE Age = @Age';

--Step 4: Execute the query using sp_executesql with parameter definitions
EXEC sp_executesql 
	@stmt = @SQL,		--The SQL string to run
	@params = N'@Age int',		--Declare the parameter(s) used in the string
	@Age = @RequiredAge;		--Pass the actual value to the parameter

/* DYNAMIC QUERIES WITH PARAMETERS */
--Step 1: Declare parameter variables whose values will be passed at runtime
DECLARE @RequiredAge int = 32;
DECLARE @MinSalary int = 45000;

--Step 2: Declare a variable to store the dynamic SQL string
DECLARE @SQL nvarchar(max);

--Step 3: Build the SQL string using parameter placeholders
SET @SQL = N'SELECT * FROM TestEmployees WHERE Age = @Age AND Salary > @Salary';

--Step 4: Execute sp_executesql with parameter definitions and actual values
EXEC sp_executesql 
	@stmt = @SQL,		--The SQL statement
	@params = N'@Age int, @Salary int',		--Parameter declarations
	@Age = @RequiredAge,		--Pass Age value
	@Salary = @MinSalary;		--Pass Salary value

/* DYNAMIC TABLE AND COLUMN NAMES */
--Step 1: Declare a variable that holds the table name you want to query
DECLARE @TableName nvarchar(50) = 'TestEmployees';

--Step 2: Declare a variable that holds the column name you want to select
DECLARE @ColumnName nvarchar(50) = 'Salary';

--Step 3: Declare a variable to store the SQL text
DECLARE @SQL nvarchar(50);

--Step 4: Build the SQL string by concatenating identifiers
SET @SQL = 'SELECT ' + @ColumnName + ' FROM ' + @TableName;

--Step 5: Execute the constructed SQL string
EXEC(@SQL);

/* SECURITY & SQL INJECTION PREVENTION */
--Step 1: Simulate user input (could come from UI, App, etc)
DECLARE @UserInput int = 50000;		--Keeping it INT already blocks harmful strings

--Step 2: Declare a variable to store the dynamic SQL statement
DECLARE @SQL nvarchar(max);

--Step 3: Build the SQL string using a parameter placeholder
SET @SQL = N'SELECT * FROM TestEmployees WHERE Salary > @MinSalary';		--Notice: No concatenation of @UserInput into the query

--Step 4: Execute dynamic SQL safely using parameterization
EXEC sp_executesql 
	@stmt = @SQL,		--SQL with placeholder
	@params = N'@MinSalary int',		--Declare parameter type
	@MinSalary = @UserInput;		--Supply the actual value