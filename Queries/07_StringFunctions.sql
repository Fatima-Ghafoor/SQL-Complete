/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE Workers(
	WorkerID int PRIMARY KEY,
	FullName varchar(50),
	Email varchar(50),
	JobTitle varchar(50),
	Department varchar(30),
	PhoneNumber varchar(20),
	Remarks varchar(255),
	JoiningDate DATE,
	Country varchar(50)
);

/* Insert data into Table */
INSERT INTO Workers (WorkerID, FullName, Email, JobTitle, Department, PhoneNumber, Remarks, JoiningDate, Country) VALUES (1, 'John Doe', 'JOHN.DOE@Company.com', 'Software Engineer', 'IT', '+92 300-1234567', 'Excellent performer', '2022-03-10', 'Pakistan'), (2, 'aamina khan', 'aamina.khan@Company.com', 'Data Analyst', 'Analytics', ' 923331234567', 'Needs improvement', '2023-01-22', 'Pakistan'), (3, 'Ali Reza', 'ali.reza@company.COM', 'Senior Manager', 'HR', '0300 6543210', 'PROMOTED to senior role.', '2021-06-15', 'UAE'), (4, 'Sarah Lee', 'sarah_lee@Company.com', 'Intern', 'Marketing', '+82-10-7777-8888', 'Intern for 6 months.', '2024-05-01', 'Korea');

/* CASE CONVERSION */
/* 1) LOWER */
SELECT FullName, LOWER(FullName) AS LowerCaseName FROM Workers;	/* Converts everything to Lower Case */

/* 2) UPPER */
SELECT JobTitle, UPPER(JobTitle) AS UpperCaseTitle FROM Workers;	/* Converts everything to Upper Case */

/* TRIMMING & LENGTH */
/* 1) TRIM */
SELECT FullName, JobTitle, TRIM(Department) AS Department FROM Workers;	/* Removes Spaces from both Left and Right side */

/* 2) LTRIM */
SELECT FullName, LTRIM(JobTitle) AS JobTitle FROM Workers;	/* Removes Spaces from Left side only */

/* 3) RTRIM */
SELECT FullName, RTRIM(JobTitle) AS JobTitle FROM Workers;	/* Removes Spaces from Right side only */

/* 4) LEN */
SELECT FullName, LEN(FullName) AS NameLength FROM Workers;	/* Check the Length of each name including all spaces */

/* EXTRACTION */
/* 1) LEFT */
SELECT FullName, LEFT(FullName, 3) AS FirstThreeChars FROM Workers;	/* Extract the given number of characters from Left side */

/* 2) RIGHT */
SELECT FullName, RIGHT(JobTitle, 3) AS FirstThreeChars FROM Workers;	/* Extract the given number of characters from Right side */

/* 3) SUBSTRING */
SELECT FullName, SUBSTRING(JobTitle, 3, 3) AS MiddleChars FROM Workers;	/* Extract the given number of characters from anywhere */

/* SEARCHING */
/* 1) CHARINDEX */
SELECT Email, CHARINDEX('@', Email) AS AtPosition FROM Workers;	/* Find exact position of a text */

/* 2) PATINDEX */
SELECT Remarks, PATINDEX('%PROMOTED%', Remarks) AS FoundAt FROM Workers;	/* Find exact position of a pattern, supports wildcards */

/* MODIFICATION */
/* 1) REPLACE */
SELECT Email, REPLACE(Email, 'Company.com', 'gmail.com') AS UpdatedEmail FROM Workers;	/* Replace specific text inside a string */

/* 2) CONCAT */
SELECT CONCAT(FullName, ' - ', JobTitle) AS NameandRole FROM Workers;	/* Combine multiple strings */

/* 3) REPLICATE */
SELECT FullName, REPLICATE('*', LEN(FullName)) AS MaskedName FROM Workers;	/* Repeat a string n times */

/* 4) SPACE */
SELECT FullName + SPACE(5) + JobTitle AS NameandRole FROM Workers;	/* Add fixed spaces between two fields */

/* 5) STUFF */
SELECT PhoneNumber, STUFF(PhoneNumber, 6, 4, '****') AS MaskedNumber FROM Workers;

/* 6) REVERSE */
SELECT FullName, REVERSE(FullName) AS ReverseName FROM Workers;

/* FORMATTING */
/* 1) FORMAT */
SELECT JoiningDate, FORMAT(JoiningDate, 'dd-MM-yyyy') AS FormattedDate FROM Workers;

/* SPLITTING & AGGREGATION */
/* 1) STRING_SPLIT */
SELECT FullName, value AS Word FROM Workers CROSS APPLY STRING_SPLIT(Remarks, ' ');

/* 2) STRING_AGG */
SELECT Country, STRING_AGG(FullName, ', ') AS Employees FROM Workers GROUP BY Country;
