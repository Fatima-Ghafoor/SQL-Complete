/* Select Database */
USE RECORDS;

/* ADD CONSTRAINTS WHILE CREATING TABLE */
CREATE TABLE StudentDetails(
	DetailID int PRIMARY KEY,	/* PRIMARY KEY */
	StudentID int,	/* Will later be linked as Foreign Key */
	PhoneNumber int UNIQUE,		/* UNIQUE */
	Semester int CHECK (Semester >=1 AND Semester <= 10),	/* CHECK */
	City varchar(50) DEFAULT 'Boston',	/* DEFAULT */
	Scholarship varchar(10),
	CONSTRAINT FK_Dt_Students_StudentID FOREIGN KEY (StudentID) REFERENCES Students (ID)	/* FOREIGN KEY */
);

/* Insert data into Table */
INSERT INTO StudentDetails (DetailID, StudentID, PhoneNumber, Semester, City, Scholarship) VALUES(1, 2, 34561, 3, 'Boston', 'Yes'), (2, 1, 67134, 5, 'Seattle', 'Yes'), (3, 3, 12390, 5, 'Chicago', 'No');

/* ADD CONSTRAINTS WHILE ALTERING -> when Columns already exist */
/* 1) PRIMARY KEY */
ALTER TABLE StudentDetails ADD CONSTRAINT PK_Dt_ID PRIMARY KEY (DetailID);	/* Uniquely identifies each record in a table and doesn’t allow NULL values */

/* 2) FOREIGN KEY */
ALTER TABLE StudentDetails ADD StudentID int;			/* If a column didn't exist already, then add it first */
ALTER TABLE StudentDetails ADD CONSTRAINT FK_Dt_Students_StudentID FOREIGN KEY (StudentID) REFERENCES Students(ID);	/* Use to link the two tables */

/* 3) UNIQUE */
ALTER TABLE StudentDetails ADD CONSTRAINT UQ_Dt_PhoneNumber UNIQUE (PhoneNumber);	/* Make sure every value of that column is Unique */

/* 4) CHECK */
ALTER TABLE StudentDetails ADD CONSTRAINT CK_Dt_Semester CHECK (Semester >=1 AND Semester <= 10);	/* Check if the value fulfill the given condition */

/* 5) DEFAULT */
ALTER TABLE StudentDetails ADD CONSTRAINT DF_Dt_City DEFAULT 'Boston' FOR City;	/* If user didn't add any value, it will add the give value as Default */
