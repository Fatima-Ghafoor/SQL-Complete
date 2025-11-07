/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql) */

/* CREATE STORED PROCEDURES */
/* 1) WITH PARAMETERS */
CREATE PROCEDURE sp_GetEmployeeByID
	@EmpID INT
AS
BEGIN
	SELECT * FROM TestEmployees WHERE ID = @EmpID;
END;

/* 2) WITHOUT PARAMETERS */
CREATE PROCEDURE sp_GetAllEmployees
AS
BEGIN
	SELECT * FROM TestEmployees;
END;

/* EXECUTE STORED PROCEDURE */
EXEC sp_GetEmployeeByID @EmpID = 5;	/* With Parameters */
EXEC sp_GetAllEmployees;	/* Without Parameters */

/* DROP STORED PROCEDURE */
DROP PROCEDURE sp_GetAllEmployees;

/* CHECK STORED PROCEDURES OF A DATABASE */
SELECT Name AS ProcedureName, create_date AS CreationDate, modify_date AS ModificationDate 
FROM sys.procedures;

/* CREATE USER-DEFINED FUNCTIONS */
/* 1) SCALAR FUNCTION */
CREATE FUNCTION fn_GetFullName
(@FirstName varchar(50), @LastName varchar(50))
RETURNS varchar(100)
AS
BEGIN
	RETURN @FirstName + ' ' + @LastName;
END;

/* 2) TABLE-VALUED FUNCTION */
CREATE FUNCTION fn_GetEmployeesBySalary
(
	@MinSalary INT
)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM TestEmployees WHERE Salary > @MinSalary
);

/* EXECUTE USER-DEFINED FUNCTION */
SELECT dbo.fn_GetFullName('Sara','Ahmed') AS FullName;	/* Scalar */
SELECT * FROM fn_GetEmployeesBySalary(40000);	/* Table-Valued */

/* DROP USER-DEFINED FUNCTION */
DROP FUNCTION fn_GetEmployeesBySalary;

/* CHECK USER-DEFINED FUNCTIONS OF A DATABASE */
SELECT 
	Name AS FunctionName,
	type_desc AS FunctionType,
	create_date AS CreationDate,
	modify_date AS ModificationDate
FROM sys.objects 
WHERE type IN ('FN', 'IF', 'TF') ORDER BY create_date;

/* Create Table -> Will use that table for Triggers */
CREATE TABLE EmployeeLog(
	LogID int IDENTITY(1,1),
	EmployeeID int,
	ActionType varchar(20),
	ActionDate DateTime,
	OldSalary int,
	NewSalary int
);

/* Create Table -> Will use that table for Triggers */
CREATE TABLE DeletedEmployees(
	ID int,
	Fname varchar(30),
	Lname varchar(30),
	Email varchar(30),
	Age int,
	Salary int,
	DeletionDate DateTime
);

/* CREATE TRIGGERS */
/* 1) AFTER TRIGGER */
CREATE TRIGGER trg_AfterInsert_TestEmployees	/* For Insert Operation */
ON TestEmployees
AFTER INSERT
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, ActionType, ActionDate)
	SELECT ID, 'INSERT', GETDATE()
	FROM INSERTED;
END;

CREATE TRIGGER trg_AfterUpdate_TestEmployees	/* For Update Operation */
ON TestEmployees
AFTER UPDATE
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, OldSalary, NewSalary, ActionType, ActionDate)
	SELECT d.ID, d.Salary, i.Salary, 'UPDATE', GETDATE()
	FROM DELETED d INNER JOIN INSERTED i ON d.ID = i.ID;
END;

CREATE TRIGGER trg_AfterDelete_TestEmployees	/* For Delete Operation */
ON TestEmployees
AFTER DELETE
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, ActionType, ActionDate)
	SELECT ID, 'DELETE', GETDATE()
	FROM DELETED;
END;

/* 2) INSTEAD OF TRIGGER */
CREATE TRIGGER trg_InsteadOfInsert_TestEmployees	/* For Insert Operation */
ON TestEmployees
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO TestEmployees (ID, Fname, Lname, Email, Age, Salary)
	SELECT ID, Fname, Lname, Email, Age, Salary
	FROM INSERTED WHERE Salary >= 30000;

	IF EXISTS (SELECT * FROM INSERTED WHERE Salary < 30000
	PRINT 'Insertion Blocked! Salary must be at least 30,000.';
END;

CREATE TRIGGER trg_InsteadOfUpdate_TestEmployees	/* For Update Operation */
ON TestEmployees
INSTEAD OF UPDATE
AS
BEGIN
	UPDATE TestEmployees SET Salary = i.Salary 
	FROM INSERTED i INNER JOIN TestEmployees e ON i.ID = e.ID;

	IF (UPDATE(Fname) OR UPDATE(Lname) OR UPDATE(Email) OR UPDATE(Age) OR UPDATE(ID))
	PRINT 'You can only update Salary, not Personal Info or ID!';
END;

CREATE TRIGGER trg_InsteadOfDelete_TestEmployees	/* For Delete Operation */
ON TestEmployees
INSTEAD OF DELETE
AS
BEGIN
	INSERT INTO DeletedEmployees (ID, Fname, Lname, Email, Age, Salary, DeletionDate)
	SELECT ID, Fname, Lname, Email, Age, Salary, GETDATE()
	FROM DELETED;

	PRINT 'Employee record moved to DeletedEmployees table instead of permanent deletion!';
END;

/* 3) FOR TRIGGER */
CREATE TRIGGER trg_ForInsert_TestEmployees	/* For Insert Operation */
ON TestEmployees
FOR INSERT
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, ActionType, ActionDate)
	SELECT ID, 'INSERT', GETDATE()
	FROM INSERTED;
END;

CREATE TRIGGER trg_ForUpdate_TestEmployees	/* For Update Operation */
ON TestEmployees
FOR UPDATE
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, OldSalary, NewSalary, ActionType, ActionDate)
	SELECT d.ID, d.Salary, i.Salary, 'UPDATE', GETDATE()
	FROM DELETED d INNER JOIN INSERTED i ON d.ID = i.ID;
END;

CREATE TRIGGER trg_ForDelete_TestEmployees	/* For Delete Operation */
ON TestEmployees
FOR DELETE
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, ActionType, ActionDate)
	SELECT ID, 'DELETE', GETDATE()
	FROM DELETED;
END;

/* DROP TRIGGER FROM DATABASE */
DROP TRIGGER trg_AfterDelete_TestEmployees;

/* CHECK TRIGGERS OF A: */
/* 1) TABLE */
SELECT
	Name AS TriggerName,
	OBJECT_NAME(parent_id) AS TableName,
	create_date AS CreationDate,
	modify_date AS ModificationDate
FROM sys.triggers;

/* 2) DATABASE */
SELECT
	Name AS TriggerName,
	parent_id,
	create_date AS CreationDate,
	modify_date AS ModificationDate
FROM sys.triggers 
WHERE parent_id = OBJECT_ID ('TestEmployees');

/* CREATE CURSORS */
/* 1) STATIC CURSOR */
DECLARE @ID int, @Fname varchar(30), @Lname varchar(30), @Email varchar(30), @Age int, @Salary int;

DECLARE cr_static_TestEmployees CURSOR STATIC FOR SELECT ID, Fname, Lname, Email, Age, Salary FROM TestEmployees;

OPEN cr_static_TestEmployees;

FETCH NEXT FROM cr_static_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee: ' + @Fname + ' ' + @Lname + ', Salary: ' + CAST(@Salary AS VARCHAR);
	FETCH NEXT FROM cr_static_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;
END;

CLOSE cr_static_TestEmployees;
DEALLOCATE cr_static_TestEmployees;

/* 2) DYNAMIC CURSOR */
DECLARE @ID int, @Fname varchar(30), @Lname varchar(30), @Email varchar(30), @Age int, @Salary int;

DECLARE cr_dynamic_TestEmployees CURSOR DYNAMIC FOR SELECT ID, Fname, Lname, Email, Age, Salary FROM TestEmployees;

OPEN cr_dynamic_TestEmployees;

FETCH NEXT FROM cr_dynamic_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee: ' + @Fname + ' ' + @Lname + ', Salary: ' + CAST(@Salary AS VARCHAR);
	FETCH NEXT FROM cr_dynamic_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;
END;

CLOSE cr_dynamic_TestEmployees;
DEALLOCATE cr_dynamic_TestEmployees;

/* 3) FORWARD ONLY CURSOR */
DECLARE @ID int, @Fname varchar(30), @Lname varchar(30), @Email varchar(30), @Age int, @Salary int;

DECLARE cr_forwardonly_TestEmployees CURSOR FORWARD_ONLY FOR SELECT ID, Fname, Lname, Email, Age, Salary FROM TestEmployees;

OPEN cr_forwardonly_TestEmployees;

FETCH NEXT FROM cr_forwardonly_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee: ' + @Fname + ' ' + @Lname + ', Salary: ' + CAST(@Salary AS VARCHAR);
	FETCH NEXT FROM cr_forwardonly_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;
END;

CLOSE cr_forwardonly_TestEmployees;
DEALLOCATE cr_forwardonly_TestEmployees;

/* 4) KEYSET CURSOR */
DECLARE @ID int, @Fname varchar(30), @Lname varchar(30), @Email varchar(30), @Age int, @Salary int;

DECLARE cr_keyset_TestEmployees CURSOR KEYSET FOR SELECT ID, Fname, Lname, Email, Age, Salary FROM TestEmployees;

OPEN cr_keyset_TestEmployees;

FETCH NEXT FROM cr_keyset_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee: ' + @Fname + ' ' + @Lname + ', Salary: ' + CAST(@Salary AS VARCHAR);
	FETCH NEXT FROM cr_keyset_TestEmployees INTO @ID, @Fname, @Lname, @Email, @Age, @Salary;
END;

CLOSE cr_keyset_TestEmployees;
DEALLOCATE cr_keyset_TestEmployees;

/* BENEFITS OF PROGRAMMABILITY */
/* 1) MODULARITY & REUSABILITY */
CREATE PROCEDURE InsertEmployeeLog	/* Procedure */
	@EmpID int, @ActionType varchar(30)
AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, ActionType, ActionDate)
	VALUES (@EmpID, @ActionType, GETDATE());
END;

/* 2) SECURITY */
GRANT EXECUTE ON InsertEmployeeLog TO FatimaGhafoor;
DENY INSERT, UPDATE, DELETE ON EmployeeLog TO FatimaGhafoor;