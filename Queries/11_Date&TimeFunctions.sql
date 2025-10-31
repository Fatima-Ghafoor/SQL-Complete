/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE EmployeeAttendance(
	AttendanceID int PRIMARY KEY IDENTITY (1,1),
	EmployeeName varchar(50),
	Department varchar(50),
	CheckInTime DATETIME,
	CheckOutTime DATETIME,
	TimeZoneOffset DATETIMEOFFSET
);

/* Insert data into Table */
INSERT INTO EmployeeAttendance (EmployeeName, Department, CheckInTime, CheckOutTime, TimeZoneOffset) VALUES ('Ali Khan', 'IT', '2024-10-25 08:45:00', '2024-10-25 17:15:00', '2024-10-25 08:45:00 +05:00'), ('Sara Ahmed', 'HR', '2024-10-26 09:10:00', '2024-10-26 18:05:00', '2024-10-26 09:10:00 +05:00'), ('John Park', 'Finance', '2024-10-27 08:55:00', '2024-10-27 16:40:00', '2024-10-27 08:55:00 +09:00'), ('Emily Chen', 'Marketing', '2024-10-28 10:00:00', '2024-10-28 19:10:00', '2024-10-28 10:00:00 +09:00'), ('Ahmed Raza', 'IT', '2024-10-29 07:50:00', '2024-10-29 16:20:00', '2024-10-29 07:50:00 +05:00');

/* CURRENT DATE/TIME */
/* 1) GETDATE */
SELECT EmployeeName, Department, GETDATE() AS CurrentDateTime FROM EmployeeAttendance;	/* Returns the current system date and time (precision up to milliseconds) */

/* 2) SYSDATETIME */
SELECT EmployeeName, Department, SYSDATETIME() AS PreciseCurrentDateTime FROM EmployeeAttendance;	/* Returns the current system date and time with higher precision than GETDATE() (fractional seconds up to 7 digits) */

/* 3) CURRENT_TIMESTAMP */
SELECT EmployeeName, Department, CURRENT_TIMESTAMP AS CurrentDateTime_ANSI FROM EmployeeAttendance;	/* ANSI SQL standard equivalent of GETDATE() */

/* 4) SYSDATETIMEOFFSET */
SELECT EmployeeName, Department, SYSDATETIMEOFFSET() AS CurrentDateTimeWithOffset FROM EmployeeAttendance;	/* Returns the current system date, time and time zone offset */

/* 5) SYSUTCDATETIME */
SELECT EmployeeName, Department, SYSUTCDATETIME() AS CurrentUTCDateTime FROM EmployeeAttendance;	/* Returns the current UTC date and time */

/* EXTRACTION */
/* 1) YEAR */
SELECT EmployeeName, CheckInTime, YEAR(CheckInTime) AS CheckInYear FROM EmployeeAttendance;	/* Extracts the year part from a date */

/* 2) MONTH */
SELECT EmployeeName, CheckInTime, MONTH(CheckInMonth) AS CheckInMonth FROM EmployeeAttendance;	/* Extracts the month number from a date */

/* 3) DAY */
SELECT EmployeeName, CheckInTime, DAY(CheckInDay) AS CheckInDay FROM EmployeeAttendance;	/* Extracts the day of the month (1 - 31) from a date */

/* 4) DATEPART */
SELECT EmployeeName, DATEPART(year, CheckInTime) AS YearPart FROM EmployeeAttendance;	/* Returns the year as a number */
SELECT EmployeeName, DATEPART(quarter, CheckInTime) AS QuarterPart FROM EmployeeAttendance;	/* Returns the quarter of the year */
SELECT EmployeeName, DATEPART(month, CheckInTime) AS MonthPart FROM EmployeeAttendance;	/* Returns the month number (1 - 12) */
SELECT EmployeeName, DATEPART(day, CheckInTime) AS DayPart FROM EmployeeAttendance;	/* Returns the day number (1 - 31) of a month */
SELECT EmployeeName, DATEPART(week, CheckInTime) AS WeekOfYear FROM EmployeeAttendance;	/* Returns the week number (1 - 53) of the year */
SELECT EmployeeName, DATEPART(weekday, CheckInTime) AS WeekDayNumber FROM EmployeeAttendance;	/* Returns the week day number (1 - 7) */
SELECT EmployeeName, DATEPART(hour, CheckInTime) AS HourPart FROM EmployeeAttendance;	/* Returns the hour (0 - 23) of the day */
SELECT EmployeeName, DATEPART(minute, CheckInTime) AS MinutePart FROM EmployeeAttendance;	/* Returns the minute part (0 - 59) of the time */
SELECT EmployeeName, DATEPART(second, CheckInTime) AS SecondPart FROM EmployeeAttendance;	/* Returns the second part (0 - 59) of the time */
SELECT EmployeeName, DATEPART(millisecond, CheckInTime) AS MilliSecondPart FROM EmployeeAttendance;	/* Returns the millisecond part (0 - 999) of the time */
SELECT EmployeeName, DATEPART(dayofyear, CheckInTime) AS DayOfTheYear FROM EmployeeAttendance;	/* Returns the day number (1 - 366) of the year */
SELECT EmployeeName, DATEPART(iso_week, CheckInTime) AS ISOWeekNumber FROM EmployeeAttendance;	/* Returns the ISO week number (1 - 53) */
/* Extracts a specific part of a date as a number */

/* 5) DATENAME */
SELECT EmployeeName, DATENAME(month, CheckInTime) AS MonthPart FROM EmployeeAttendance;	/* Returns the month name */
SELECT EmployeeName, DATENAME(weekday, CheckInTime) AS WeekDayName FROM EmployeeAttendance;	/* Returns the week day name */
/* Extracts a specific part of a date as a name */
/* year, quarter, day, week, hour, minute, second, millisecond, dayofyear, iso_week, will also return the number but with String datatype */

/* CALCULATION */
/* 1) DATEADD */
SELECT EmployeeName, CheckInTime, DATEADD(day, 7, CheckInTime) AS CheckIn_After7Days FROM EmployeeAttendance;	/* Adds or Subtract a specific interval from a date - (Part, Value, Date) */

/* 2) DATEDIFF */
SELECT EmployeeName, CheckInTime, DATEDIFF(hour, CheckInTime, CheckOutTime) AS TotalHoursWorked FROM EmployeeAttendance;	/* Returns the difference between two date - (Part, StartDate, EndDate). Year, Month, Day, Hour, Minute can also be used */

/* 3) EOMONTH */
SELECT EmployeeName, CheckInTime, EOMONTH(CheckInTime) AS EndOfMonthDate FROM EmployeeAttendance;	/* Returns the last day of the month */

/* 4) DATEFROMPARTS */
SELECT EmployeeName, CheckInTime, DATEFROMPARTS(year(CheckInTime), month(CheckInTime), 1) AS FirstDayOfMonth FROM EmployeeAttendance;	/* Creates a new date from given numeric parts*/

/* 5) DATETIMEFROMPARTS */
SELECT EmployeeName, CheckInTime, DATETIMEFROMPARTS(year(CheckInTime), month(CheckInTime), day(CheckInTime), 9, 30, 0, 0) AS CustomCheckInTime FROM EmployeeAttendance;	/* Creates a datetime value from all components - 2024-10-25 09:30:00.000 */

/* 6) DATETIME2FROMPARTS */
SELECT EmployeeName, DATETIME2FROMPARTS(year(CheckInTime), month(CheckInTime), day(CheckInTime), 18, 45, 30, 250, 3) AS CustomCheckOutTime FROM EmployeeAttendance;	/* Returns a datetime2 value with higher precision control - (Year, Month, Day, Hour, Minute, Second, Fractions, Precision) */

/* 7) SMALLDATETIMEFROMPARTS */
SELECT EmployeeName, SMALLDATETIMEFROMPARTS(year(CheckInTime), month(CheckInTime), day(CheckInTime), 8, 0) AS MorningShiftStart FROM EmployeeAttendance;	/* Creates a small datetime value - (Accuracy up to 1 minute) */

/* 8) DATETIMEOFFSETFROMPARTS */
SELECT EmployeeName, DATETIMEOFFSETFROMPARTS(year(CheckInTime), month(CheckInTime), day(CheckInTime), 9, 0, 0, 0, 5, 0, 1) AS LocalTimeWithOffset FROM EmployeeAttendance;	/* Creates a datetimeoffset value, includes UTC Offset */

/* 9) SWITCHOFFSET */
SELECT EmployeeName, TimeZoneOffset AS OriginalOffset, SWITCHOFFSET(TimeZoneOffset, '+09:00') AS ConvertedToKoreaTime FROM EmployeeAttendance;	/* Changes the displayed time zone offset but keeps the UTC moment the same */