/* Select Database */
USE RECORDS;

/* LOGIN */
--Create a Login
CREATE LOGIN LoginSara WITH PASSWORD = 'Sara123';	/* SQL Server Authentication */
CREATE LOGIN LoginAli FROM WINDOWS;	/* Windows Authentication */

--Delete a Login
DROP LOGIN LoginSara;	/* Only applicable if there is no user inside that login */

/* USERS */
--Create a User
CREATE USER UserAyesha FOR LOGIN LoginSara;

--Drop a User
DROP USER UserAyesha;

--Create a User with default schema
CREATE USER UserAhmed FOR LOGIN LoginSara WITH DEFAULT SCHEMA = School;

/* SCHEMA */
--Create a Schema
CREATE SCHEMA School;

--Transfer the existing table to Schema
ALTER SCHEMA School TRANSFER dbo.Students;

--Drop a Schema (only if it has no table)
DROP SCHEMA School;

/* ROLES */
EXEC sp_addrolemember 'db_owner', 'UserNaila';	/* User will have full control of database */
EXEC sp_addrolemember 'db_securityadmin', 'UserAmir';	/* User can manage permissions */
EXEC sp_addrolemember 'db_accessadmin', 'UserJack';	/* User can manage other users */
EXEC sp_addrolemember 'db_ddladmin', 'UserRizwan';	/* User can create/change objects */
EXEC sp_addrolemember 'db_datareader', 'UserAsmara';	/* User can read everything */
EXEC sp_addrolemember 'db_datawriter', 'UserSara';	/* User can write everything */
EXEC sp_addrolemember 'db_denydatareader', 'UserSaima';	/* User can read nothing */
EXEC sp_addrolemember 'db_denydatawriter', 'UserAli';	/* User can write nothing */

/* PERMISSIONS */
/* GRANT */
GRANT SELECT ON School.Students TO UserAyesha;	/* Allow user to read all data from School.Students */
GRANT EXECUTE ON dbo.TestEmployees TO UserAli;	/* Allow user to run a stored procedure */
GRANT SELECT ON SCHEMA::School TO UserFaiza;	/* Grant schema-level read permission */
/* Allow a user to perform an action on a database object */

/* REVOKE */
REVOKE SELECT ON School.Students FROM UserAyesha;	/* Remove select from user */
/* Removes the grant, but does not block access if the user has the permission via a role */

/* DENY */
DENY INSERT ON School.Students TO UserAyesha;	/* Block insert for this user completely */
DENY SELECT ON SCHEMA::School TO UserAyesha;	/* Deny read access on entire schema */
/* It overrides GRANT - even if the user is in a role that has the permission, DENY wins */