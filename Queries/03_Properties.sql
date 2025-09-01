/* Select Database */
USE RECORDS;

/* ADD PROPERTIES WHILE CREATING TABLE */
CREATE TABLE StudentActivities(
	ActivityID int PRIMARY KEY IDENTITY (1,1),	/* IDENTITY (with PRIMARY KEY) */
	StudentID int,	/* will later be linked as Foreign Key */
	Sports varchar(30) NOT NULL,	/* NOT NULL */
	Trophies int NULL,	/* NULL */
	Team varchar(30) COLLATE SQL_Latin1_General_CP1_CS_AS,	/* COLLATE */
	Summary AS (Sports COLLATE SQL_Latin1_General_CP1_CS_AS + ' - ' + Team COLLATE SQL_Latin1_General_CP1_CS_AS),	/* COMPUTED COLUMN (Fix: Computed columns require consistent collation across all involved columns). */
	CONSTRAINT FK_At_Students_StudentID FOREIGN KEY (StudentID) REFERENCES Students (ID)	/* Foreign Key */
);

/* Insert data into Table */
INSERT INTO StudentActivities (StudentID, Sports, Trophies, Team) VALUES (1, 'Football', 2, 'A'), (3, 'Football', 1, 'A'), (2, 'Cricket', 0, 'B');

/* ADD PROPERTIES WHILE ALTERING -> when Columns already exist */
/* 1) Identity */
ALTER TABLE StudentActivities ALTER COLUMN Atvs_ID PRIMARY KEY (ActivityID);

/* 2) Not Null */
ALTER TABLE StudentActivities ALTER COLUMN Sports varchar(30) NOT NULL;

/* 3) Null */
ALTER TABLE StudentActivities ALTER COLUMN Trophies int NULL;

/* 4) Collate */
ALTER TABLE StudentActivities ALTER COLUMN Team varchar(30) COLLATE SQL_Latin1_General_CP1_CS_AS; /* Case Sensitive, Accent Sensitive */
ALTER TABLE StudentActivities ALTER COLUMN Team varchar(30) COLLATE SQL_Latin1_General_CP1_CS_AI; /* Case Sensitive, Accent Insensitive */
ALTER TABLE StudentActivities ALTER COLUMN Team varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS; /* Case Insensitive, Accent Sensitive */
ALTER TABLE StudentActivities ALTER COLUMN Team varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AI; /* Case Insensitive, Accent Insensitive */

/* 5) Computed Column */
ALTER TABLE StudentActivities ALTER COLUMN Summary AS (Sports COLLATE SQL_Latin1_General_CP1_CS_AS + ' - ' + Team COLLATE SQL_Latin1_General_CP1_CS_AS);

/*Search using COLLATE*/
SELECT * FROM StudentActivities WHERE Team COLLATE SQL_Latin1_General_CP1_CS_AS = 'A';