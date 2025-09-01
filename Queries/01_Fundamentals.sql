/* CREATE Database */
CREATE DATABASE RECORDS;

/* USE Database */
USE RECORDS;

/* DROP Database */
USE master;	/* Switch to the default database first, as the current database cannot be deleted */
DROP DATABASE RECORDS;

/* CREATE Table */
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

/* DROP Table */
DROP TABLE Students;

/* INSERT data into Table */
INSERT INTO Students (Fname, Lname, Major, Age, Email) VALUES ('Fahad','Khalid','Physics', 22, 'fawad@gmail.com'), ('Sara','Nasir','Mechanical', 24, 'sara@gmail.com'), ('Umer','Khan', 'Electronics', 23, 'umer@gmail.com'), ('Zainab','Amir','Mathematics','22', 'zainab@gmail.com'), ('Fariha','Asim','Mathematics',24, 'fariha@gmail.com');

/* SELECT DATA FROM TABLE */
/* 1) All Columns */
SELECT * from Students;

/* 2) Selected Columns */
SELECT Fname, Lname from Students;

/* COLUMN ALIASES -> (writing AS is optional) */
/* 1) Single Column */
SELECT Fname AS FirstName from Students;

/* 2) Multiple Columns */
SELECT Fname AS FirstName, Lname AS LastName from Students;

/* 3) Merging Columns */
SELECT Fname + ' ' + Lname AS FullName from Students;

/* Table ALIASE */
SELECT s.Fname, s.Lname from Students AS s;
