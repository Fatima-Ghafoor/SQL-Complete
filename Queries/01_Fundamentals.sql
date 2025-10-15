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
/* 1) Add Column */
ALTER TABLE Students ADD Email varchar(50);

/* 2) Drop Column */
ALTER TABLE Students DROP COLUMN Email;

/* 3) Modify Datatype or Size */
ALTER TABLE Students ALTER COLUMN Major varchar(50);

/* INSERT DATA INTO TABLE */
INSERT INTO Students (Fname, Lname, Major, Age, Email) VALUES ('Fahad','Khalid','Physics', 22, 'fahad@gmail.com'), ('Sara','Nasir','Mechanical', 24, 'sara@gmail.com'), ('Umer','Khan', 'Electronics', 23, 'umer@gmail.com'), ('Zainab','Amir','Mathematics', 22, 'zainab@gmail.com'), ('Fariha','Asim','Mathematics', 24, 'fariha@gmail.com');

/* SELECT DATA FROM TABLE */
/* 1) All Columns */
SELECT * FROM Students;

/* 2) Selected Columns */
SELECT Fname, Lname FROM Students;

/* COLUMN ALIASES -> (writing AS is optional) */
/* 1) Single Column */
SELECT Fname AS FirstName FROM Students;

/* 2) Multiple Columns */
SELECT Fname AS FirstName, Lname AS LastName FROM Students;

/* 3) Merging Columns */
SELECT Fname + ' ' + Lname AS FullName FROM Students;

/* DROP TABLE */
DROP TABLE Students;

/* TABLE ALIASE */
SELECT s.Fname, s.Lname FROM Students AS s;
