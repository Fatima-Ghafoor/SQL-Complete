/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE StudentsData(
	ID int,
	Hobby varchar(30),
	Country varchar(50),
	TotalMarks int
);

/* Insert data into Table */
INSERT INTO StudentsData (ID, Hobby, Country, TotalMarks) VALUES (2, 'Painting', 'Korea', 250), (3, 'Photography', 'Denmark', 250), (8, 'Coding', 'France', 280), (9, 'Swimming', 'Japan', 298), (12, 'Gardening', 'Italy', 277);

/* 1) Inner Join */
SELECT
s.ID, s.Fname, s.Lname, s.Age, s.Major,
sd.ID, sd.Hobby, sd.Country
FROM Students s INNER JOIN StudentsData sd
ON s.ID = sd.ID;

/* 2) Left Join */
SELECT
s.ID, s.Fname, s.Lname, s.Age, s.Major,
sd.ID, sd.Hobby, sd.Country
FROM Students s LEFT JOIN StudentsData sd
ON s.ID = sd.ID;

/* 3) Right Join */
SELECT
s.ID, s.Fname, s.Lname, s.Age, s.Major,
sd.ID, sd.Hobby, sd.Country
FROM Students s RIGHT JOIN StudentsData sd
ON s.ID = sd.ID;

/* 4) Full Join */
SELECT
s.ID, s.Fname, s.Lname, s.Age, s.Major,
sd.ID, sd.Hobby, sd.Country
FROM Students s FULL JOIN StudentsData sd
ON s.ID = sd.ID;

/* 5) Cross Join */
SELECT
s.ID, s.Fname, s.Lname, s.Age, s.Major,
sd.ID, sd.Hobby, sd.Country
FROM Students s CROSS JOIN StudentsData sd;

/* 6) Self Join */
SELECT
s1.ID AS Student1_ID, s1.Hobby AS Student1_Hobby, s1.Country AS Student1_Country, s1.TotalMarks AS Student1_TotalMarks,
s2.ID AS Student2_ID, s2.Hobby AS Student2_Hobby, s2.Country AS Student2_Country, s2.TotalMarks AS Student2_TotalMarks
FROM StudentsData s1 INNER JOIN StudentsData s2
ON s1.ID <> s2.ID AND s1.TotalMarks = s2.TotalMarks;