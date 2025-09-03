/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE StudentMarks(
	MarksID int PRIMARY KEY IDENTITY(1,1),
	StudentID int,	/* will later be linked as Foreign Key */
	English int CHECK (English >= 1 AND English <= 100),
	Math int CHECK (Math >=1 AND Math <= 100),
	History int CHECK (History >=1 AND History <= 100),
	CONSTRAINT FK_MK_Students_StudentID FOREIGN KEY (StudentID) REFERENCES Students (ID)
);

/* Insert data into Table */
INSERT INTO StudentMarks (StudentID, English, Math, History) VALUES (1, 50, 67, 77), (2, 55, 60, 50), (3, 72, 98, 88);

/* FILTERING with WHERE */
/* 1) WHERE with RELATIONAL OPERATORS */
SELECT * FROM StudentMarks WHERE English = 50;	/* EQUAL TO */
SELECT * FROM StudentMarks WHERE English <> 50;	/* NOT EQUAL TO */
SELECT * FROM StudentMarks WHERE Math != 50;	/* NOT EQUAL TO */
SELECT * FROM StudentMarks WHERE Math > 65;	/* GREATER THAN */
SELECT * FROM StudentMarks WHERE Math < 65;	/* LESS THAN */
SELECT * FROM StudentMarks WHERE History >= 60;	/* GREATER THAN OR EQUAL TO */
SELECT * FROM StudentMarks WHERE History <= 60;	/* LESS THAN OR EQUAL TO */

/* 2) WHERE with SET & RANGE COMPARISON OPERATORS */
SELECT * FROM StudentMarks WHERE English BETWEEN 60 AND 80; /* BETWEEN... AND */
SELECT * FROM StudentMarks WHERE Math IN (60, 80);	/* IN */
SELECT * FROM StudentMarks WHERE Math NOT IN (60, 80);	/* NOT IN */
SELECT * FROM StudentMarks WHERE Math > ANY (Select History from StudentMarks where History > 30); /* ANY */
SELECT * FROM StudentMarks WHERE History > SOME (Select English from StudentMarks where English > 40);	/* SOME */
SELECT * FROM StudentMarks WHERE English > ALL (Select Math from StudentMarks where Math > 50);	/* ALL */

/* 3) WHERE with LOGICAL OPERATORS */
SELECT * FROM StudentMarks WHERE Math > 50 AND History < 70;	/* AND */
SELECT * FROM StudentMarks WHERE English < 60 OR Math = 100;	/* OR */
SELECT * FROM StudentMarks WHERE NOT History = 50;	/* NOT */

/* 4) WHERE with PATTERN MATCHING OPERATORS (Table named Students has already been created in 01_Fundamentals.sql) */

/* a) LIKE with Wildcards */
SELECT * FROM Students WHERE Fname LIKE '%h' or'h%' or '%h%';
SELECT * FROM Students WHERE Fname LIKE '_m%';
SELECT * FROM Students WHERE Lname LIKE '[KN]%' or '[K-N]%';
SELECT * FROM Students WHERE Lname LIKE '[^KS]%' OR '[!KS]%';

/* b) NOT LIKE with Wildcards */
SELECT * FROM Students WHERE Fname NOT LIKE '%h' or'h%' or '%h%';
SELECT * FROM Students WHERE Fname NOT LIKE '_m%';
SELECT * FROM Students WHERE Lname NOT LIKE '[KN]%' or '[K-N]%';
SELECT * FROM Students WHERE Lname NOT LIKE '[^KS]%' OR '[!KS]%';

/* 5) WHERE with NULL CHECK OPERATORS */
SELECT * FROM StudentMarks WHERE History IS NULL;	/* IS NULL */
SELECT * FROM StudentMarks WHERE History IS NOT NULL;	/* IS NOT NULL */

/* 6) WHERE with EXISTENCE PREDICATES OPERATORS */
SELECT * FROM StudentMarks WHERE EXISTS (Select English from StudentMarks);	/* EXISTS*/
SELECT * FROM StudentMarks WHERE NOT EXISTS (Select 1 from StudentMarks);	/* NOT EXISTS */