/* CREATE DATABASE */
CREATE DATABASE RECORDS;

/* SELECT DATABASE */
USE RECORDS;

/* DROP DATABASE */
USE master;	/* Switch to the default database first, as the current database cannot be deleted */
DROP DATABASE RECORDS;

/* CREATE TABLE */
CREATE TABLE Students(
	ID int PRIMARY KEY IDENTITY (1,1),		/* Constraints & Properties are covered next */
	Fname varchar(30),
	Lname varchar(30),
	Major varchar(30),
	Age int,
	Email varchar(50)
);

/* ALTER TABLE */
/* 1) ADD COLUMN */
ALTER TABLE Students ADD Email varchar(50);

/* 2) DROP COLUMN */
ALTER TABLE Students DROP COLUMN Email;

/* 3) MODIFY DATATYPE OR SIZE */
ALTER TABLE Students ALTER COLUMN Major varchar(50);

/* DROP TABLE */
DROP TABLE Students;

/* INSERT DATA INTO TABLE */
INSERT INTO Students (Fname, Lname, Major, Age, Email) VALUES ('Fahad', 'Khalid', 'Physics', 22, 'fahad@gmail.com'), ('Sara', 'Nasir', 'Mechanical', 24, 'sara@gmail.com'), ('Umer', 'Khan', 'Electronics', 23, 'umer@gmail.com'), ('Zainab', 'Amir', 'Mathematics', 22, 'zainab@gmail.com'), ('Fariha', 'Asim', 'Mathematics', 24, 'fariha@gmail.com');

/* SELECT DATA FROM TABLE */
/* 1) ALL COLUMNS */
SELECT * FROM Students;

/* 2) SELECTED COLUMNS */
SELECT Fname, Lname FROM Students;

/* TABLE ALIAS -> (writing AS is optional) */
SELECT s.Fname, s.Lname FROM Students AS s;

/* COLUMN ALIASES -> (writing AS is optional) */
/* 1) SINGLE COLUMN */
SELECT Fname AS FirstName FROM Students;

/* 2) MULTIPLE COLUMNS */
SELECT Fname AS FirstName, Lname AS LastName FROM Students;

/* 3) MERGING COLUMNS */
SELECT Fname + ' ' + Lname AS FullName FROM Students;
