/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE TestEmployees(
	ID int,
	Fname varchar(30),
	Lname varchar(30),
	Email varchar(30),
	Age int,
	Salary int
);

/* Insert data into Table */
INSERT INTO TestEmployees (ID, Fname, Lname, Email, Age, Salary) VALUES (1, 'Fahad', 'Nasir', 'fahad@gmail.com', 34, 55000), (2, 'Samina', 'Wahab', 'samina@gmail.com', 33, 50000), (3, 'Farheen', 'Sohaib', 'farheen@gmail.com', 30, 40000), (4, 'Asmara', 'Javed', 'asmara@gmail.com', 32, 45000), (5, 'Vaniya', 'Khaid', 'vaniya@gmail.com', 32, 60000);

/* CREATE INDEXES */
/* 1) Clustered Indexes */
CREATE CLUSTERED INDEX idx_TestEmployees_ID ON TestEmployees(ID);	/* BASIC */
CREATE CLUSTERED INDEX idx_TestEmployees_Names ON TestEmployees(Fname, Lname);	/* COMPOSITE */
CREATE UNIQUE CLUSTERED INDEX idx_TestEmployees_Email ON TestEmployees(Email);	/* UNIQUE */

/* 2) Non-Clustered Indexes */
CREATE NONCLUSTERED INDEX idx_TestEmployees_Name ON TestEmployees(Fname);	/* BASIC */
CREATE NONCLUSTERED INDEX idx_TestEmployees_NameAge ON TestEmployees(Fname, Age);	/* COMPOSITE */
CREATE UNIQUE NONCLUSTERED INDEX idx_TestEmployees_Email ON TestEmployees(Email);	/* UNIQUE */

/* INDEXED VIEW */
/* Step 1: Create a View with Schema Binding */
CREATE VIEW dbo.vw_TotalSalaryByAge WITH SCHEMABINDING AS 
SELECT Age, SUM(ISNULL(Salary, 0)) AS TotalSalary, COUNT_BIG(*) AS TotalEmployees FROM dbo.TestEmployees GROUP BY AGE;
GO

/* Step 2: Create a Unique Clustered Index on the View */
CREATE UNIQUE CLUSTERED INDEX IX_vw_TotalSalaryByAge ON dbo.vw_TotalSalaryByAge(Age);
GO

/* SELECT DATA FROM INDEXED VIEW */
SELECT * FROM dbo.vw_TotalSalaryByAge;	/* --same as Select data from View */

/* DROP INDEX */
DROP INDEX idx_TestEmployees_Name ON TestEmployees;

/* CHECK INDEXES OF A: */
/* 1) Table */
EXEC sp_helpindex 'TestEmployees';	/* --Table Name: TestEmployees */

/* 2) Database */
SELECT
	i.name AS IndexName, 
	t.name AS TableName, 
	i.type_desc AS IndexType
FROM sys.indexes i JOIN sys.tables t 
ON i.object_id = t.object_id 
WHERE i.is_primary_key = 0 AND i.is_unique_constraint = 0 AND i.name IS NOT NULL;