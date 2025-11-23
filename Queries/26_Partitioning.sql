/* Select Database */
USE RECORDS;

/* Table named 'TestEmployees' has already been created in 18_Indexes.sql */

/* PARTITION FUNCTION */
CREATE PARTITION FUNCTION PF_SalaryRange (int) 
AS RANGE RIGHT FOR VALUES (45000, 55000, 60000);
/* Defines how the table data is divided into partitions (ranges) */

/* PARTITION SCHEME */
CREATE PARTITION SCHEME PS_SalaryScheme 
AS PARTITION PF_SalaryRange 
TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY]);
/* Maps each partition to a specific filegroup for storage */

/* PARTITION TABLE */
CREATE TABLE TestEmployees_Partitioned
(
	ID int,
	Fname varchar(30),
	Lname varchar(30),
	Email varchar(30),
	Age int,
	Salary int
)
ON PS_SalaryScheme (Salary);
/* Table created on the partition scheme, storing data in defined partitions */

/* Insert data into PARTITION TABLE */
INSERT INTO TestEmployees_Partitioned (ID, Fname, Lname, Email, Age, Salary) VALUES (1, 'Ali', 'Khan', 'ali@gmail.com', 25, 25000), (2, 'Sara', 'Ahmed', 'sara@gmail.com', 28, 45000), (3, 'Usman', 'Raza', 'usman@gmail.com', 30, 55000), (4, 'Hina', 'Qureshi', 'hina@gmail.com', 32, 60000), (5, 'Hamna', 'Amir', 'hamna@gmail.com', 32, 65000);

/* Check Which Partition Each Row Belongs To */
SELECT ID, Fname, Salary, $PARTITION.PF_SalaryRange(Salary) AS PartitionNumber FROM TestEmployees_Partitioned;

/* SWITCHING PARTITIONS */
/* Step 1: Create Table (data will be moved to that table, must match structure) */
CREATE TABLE TestEmployees_Archive
(
	ID int,
	Fname varchar(30),
	Lname varchar(30),
	Email varchar(30),
	Age int,
	Salary int
)

/* Step 2: Switch Partition to archive table (TestEmployees_Archive) */
ALTER TABLE TestEmployees_Partitioned SWITCH PARTITION 1 TO TestEmployees_Archive;	/* Moves an entire parition between tables instantly */

/* QUERYING PARTITIONED TABLES */
SELECT * FROM TestEmployees_Partitioned WHERE Salary > 60000;	/* Reads only the partitions that match the query condition */