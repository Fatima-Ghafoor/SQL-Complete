/* Select Database */
USE RECORDS;

/* Table named 'Workers' has already been created in 07_StringFunctions.sql */

/* CONVERSION FUNCTIONS */
/* 1) CAST */
SELECT FullName, Email, JoiningDate, CAST(JoiningDate AS varchar(30)) AS StringJoiningDate FROM Workers;	/* Converts an expression from one datatype to another datatype (if compatible) */

/* 2) TRY_CAST */
SELECT FullName, Email, PhoneNumber, TRY_CAST(PhoneNumber AS int) AS IntPhoneNumber FROM Workers;	/* Converts an expression from one datatype to another datatype (if compatible) - In case of conversion failure, it returns NULL */

/* 3) CONVERT */
SELECT FullName, JoiningDate, CONVERT(varchar(30), JoiningDate, 103) AS FormattedDate FROM Workers;	/* Converts an expression from one datatype to another datatype, but it provides more control */

/* 4) TRY_CONVERT */
SELECT FullName, PhoneNumber, TRY_CONVERT(int, PhoneNumber) AS IntPhoneNumber FROM Workers;	/* Converts an expression from one datatype to another datatype, but it provides more control - In case of conversion failure, it returns NULL */

/* 5) PARSE */
SELECT FullName, PARSE('31/10/2025' AS DATETIME USING 'en-GB') AS BritishDate FROM Workers;	/* Must write the date according to British format with 'en-GB' */
SELECT FullName, PARSE('10/31/2025' AS DATETIME USING 'en-US') AS AmericanDate FROM Workers;	/* Must write the date according to American format with 'en-US' */
SELECT FullName, PARSE('34842.67' AS DECIMAL(10, 2) USING 'en-US') AS AmericanPrice FROM Workers;	/* Must use . as decimal separator, since it's a standard in American format */
SELECT FullName, PARSE('34.842,67' AS DECIMAL(10, 2) USING 'de-DE') AS GermanPrice FROM Workers;	/* Must use , as decimal separator & . as thousand separator, since it's a standard in German format */
/* Converts String (text) values into date/time or numeric datatype, using culture-based rules */

/* 6) TRY_PARSE */
SELECT FullName, TRY_PARSE('10/31/2025' AS DATETIME USING 'en-GB') AS BritishDate FROM Workers;	/* Converts String (text) values into date/time or numeric datatype, using culture-based rules - In case of conversion failure, it returns NULL */