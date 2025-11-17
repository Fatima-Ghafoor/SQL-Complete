/* Select Database */
USE RECORDS;

/* Tables named 'Students' & 'BankAccounts' have already been created in 01_Students.sql & 20_Transactions&ErrorHandling.sql */

/* SYSTEM INFO */
/* 1) VERSION */
SELECT @@VERSION AS 'SQL Server Version';	/* Checks the version of SQL Server */

/* 2) SERVER NAME */
SELECT @@SERVERNAME AS 'Server Name';	/* Checks the name of SQL Server */

/* 3) ROW COUNT */
SELECT * FROM BankAccounts;
SELECT @@ROWCOUNT AS 'Rows Affected';	/* Checks the rows affected by the current query */

/* 4) ERROR */
BEGIN TRY
	SELECT 10/0;
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS 'Error Number';
END CATCH;
/* Returns the error number of the last executed SQL statement */

/* IDENTITY AND OBJECT INFO */
/* 1) IDENTITY */
INSERT INTO Students (Fname, Lname, Major, Age, Email) VALUES ('Zaid', 'Ahmed', 'Electrical', 32, 'zaid@gmail.com');
SELECT @@IDENTITY AS 'Last Inserted ID';	/* Returns the last identity value generated in the current session, including those created by triggers */

/* 2) SCOPE IDENTITY */
INSERT INTO Students (Fname, Lname, Major, Age, Email) VALUES ('Azhar', 'Khalid', 'Electrical', 27, 'azhar@gmail.com');
SELECT SCOPE_IDENTITY() AS 'Last Inserted ID in Scope';	/* Returns the last identity value generated within the current scope, ignoring triggers */

/* 3) DATABASE ID */
SELECT DB_ID('RECORDS') AS 'Database ID';	/* Returns the ID Number of a database */

/* 4) DATABASE NAME */
SELECT DB_NAME(5) AS 'Database Name';	/* Returns the name of a database, corresponding to given database ID */

/* 5) OBJECT ID */
SELECT OBJECT_ID('Students') AS 'Object ID';	/* Returns the Internal ID of a table, view or other database object */

/* 6) OBJECT NAME */
SELECT OBJECT_NAME(OBJECT_ID('Students')) AS 'Object Name';	/* Returns the name of an object when given its internal object ID */

/* METADATA QUERIES */
/* 1) INFORMATION SCHEMA */
SELECT TABLE_NAME, TABLE_SCHEMA FROM INFORMATION_SCHEMA.TABLES;	/* Shows user-defined objects in a standard format - (like tables, views, columns, constraints) */

/* 2) SYSTEM OBJECTS */
SELECT name, type_desc FROM sys.objects;	/* Shows all objects, both user-defined and system-defined - (like tables, views, columns, constraints) */

/* 3) SYSTEM TABLES */
SELECT name, create_date FROM sys.tables;	/* Shows user-defined tables only */