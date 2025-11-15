/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql) */

/* COMMON TABLE EXPRESSIONS */
/* 1) SIMPLE CTE */
WITH SimpleCTE_HighSalary AS(
	SELECT ID, Fname, Lname, Email, Age, Salary FROM TestEmployees WHERE Salary > 50000
)
SELECT * FROM SimpleCTE_HighSalary WHERE Age > 32;

/* Add Column to a table: TestEmployees & Updating data for performing Recursive CTE */
ALTER TABLE TestEmployees ADD ManagerID int;

UPDATE TestEmployees SET ManagerID = 2 WHERE ID = 2;
UPDATE TestEmployees SET ManagerID = 3 WHERE ID = 3;
UPDATE TestEmployees SET ManagerID = 2 WHERE ID = 5;

/* 2) RECURSIVE CTE */
WITH RecursiveCTE_EmployeeHierarchy AS(
	SELECT ID, Fname, Lname, ManagerID FROM TestEmployees WHERE ManagerID IS NULL

	UNION ALL

	SELECT e.ID, e.Fname, e.Lname, e.ManagerID FROM TestEmployees e 
	INNER JOIN RecursiveCTE_EmployeeHierarchy eh ON e.ManagerID = eh.ID
)
SELECT * FROM RecursiveCTE_EmployeeHierarchy;

/* MULTIPLE CTEs IN ONE QUERY */
WITH MultipleCTE_HighSalary AS(
	SELECT ID, Fname, Lname, Salary FROM TestEmployees WHERE Salary > 30000
),
MultipleCTE_YoungEmployees AS(
	SELECT ID, Fname, Lname, Age FROM TestEmployees WHERE Age < 33
)
SELECT h.Fname, h.Lname, h.Salary, y.Age FROM MultipleCTE_HighSalary h 
INNER JOIN MultipleCTE_YoungEmployees y ON h.ID = y.ID;

/* SUBQUERY vs CTE */
SELECT ID, Fname, Lname, Salary FROM TestEmployees WHERE Salary > (Select AVG(Salary) from TestEmployees);	/* SUBQUERY */

WITH SimpleCTE_AverageSalary AS (	/* CTE */
	SELECT AVG(Salary) AS AverageSalary FROM TestEmployees
)
SELECT ID, Fname, Lname, Salary FROM TestEmployees, SimpleCTE_AverageSalary WHERE TestEmployees.Salary > SimpleCTE_AverageSalary.AverageSalary;

/* HIERARCHICAL DATA */
WITH CTE_EmployeeHierarchy AS(
	SELECT ID, Fname, Lname, ManagerID, 0 AS Level FROM TestEmployees WHERE ManagerID IS NULL

	UNION ALL

	SELECT e.ID, e.Fname, e.Lname, e.ManagerID, eh.Level + 1 FROM TestEmployees e 
	INNER JOIN CTE_EmployeeHierarchy eh ON e.ManagerID = eh.ID
)
SELECT * FROM CTE_EmployeeHierarchy;