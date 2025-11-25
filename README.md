# SQL Practice Repository

This repository contains my SQL practice queries from **BASIC to ADVANCED** using **MS SQL Server**.
All topics are organized step by step, without mixing concepts, for clear learning and reference.

## CONTENTS:

**1. FUNDAMENTALS:**
- Create, Select and Drop Database.
- Create, Alter and Drop Table.
- Insert data into Table.
- Select data from Table.
- Create Table & Column Alias.

**2. CONSTRAINTS:**
- Primary Key, Foreign Key, Unique, Check, Default: (Add while creating & altering table).

**3. PROPERTIES:**
- Identity, Not Null, Null, Collate, Computed Column: (Add while creating & altering table).

**4. FILTERING:**
- WHERE with Relational Operators (=, <>, !=, >, <, >=, <=).
- WHERE with Set & Range Comparison Operators (BETWEEN... AND, IN, NOT IN, ANY, SOME, ALL).
- WHERE with Logical Operators (AND, OR, NOT).
- WHERE with Pattern Matching Operators (LIKE, NOT LIKE).
- WHERE with Null Check Operators (IS NULL, IS NOT NULL).
- WHERE with Existence Predicates Operators (EXISTS, NOT EXISTS).

**5. SORTING:**
- ORDER BY with (ASC, DESC, Column Position).

**6. ROW LIMITING:**
- TOP, TOP n PERCENT, WITH TIES, OFFSET … FETCH NEXT.

**7. STRING FUNCTIONS:**
- Case Conversion: LOWER, UPPER.
- Trimming & Length: TRIM, LTRIM, RTRIM, LEN.
- Extraction: LEFT, RIGHT, SUBSTRING.
- Searching: CHARINDEX, PATINDEX.
- Modification: REPLACE, CONCAT, REPLICATE, SPACE, STUFF, REVERSE.
- Formatting: FORMAT.
- Splitting & Aggregation: STRING_SPLIT, STRING_AGG.

**8. AGGREGATE FUNCTIONS:**
- SUM, AVG, COUNT, MIN, MAX.

**9. SET OPERATORS:**
- UNION, UNION ALL, INTERSECT, EXCEPT.

**10. NUMERIC FUNCTIONS:**
- Basic Math: ABS, ROUND, CEILING, FLOOR.
- Advanced Math: POWER, SQRT, EXP, LOG, SIGN, RAND.
- Extended Math: LOG10, PI.

**11. DATE & TIME FUNCTIONS:**
- Current Date/Time: GETDATE, SYSDATETIME, CURRENT_TIMESTAMP, SYSDATETIMEOFFSET, SYSUTCDATETIME.
- Extraction: YEAR, MONTH, DAY, DATEPART, DATENAME.
- Calculation: DATEADD, DATEDIFF, EOMONTH, DATEFROMPARTS, DATETIMEFROMPARTS, DATETIME2FROMPARTS, SMALLDATETIMEFROMPARTS, DATETIMEOFFSETFROMPARTS, SWITCHOFFSET.

**12. TYPE CONVERSION FUNCTIONS:**
- Conversion Functions: CAST, TRY_CAST, CONVERT, TRY_CONVERT, PARSE, TRY_PARSE.

**13. JOINS:**
- INNER, LEFT, RIGHT, FULL, CROSS, SELF.

**14. DATA MODIFICATION:**
- Update Table data by using (Basic, WHERE, JOIN, Subquery, OUTPUT).
- Delete Table data by using (Basic, WHERE, JOIN, Subquery, OUTPUT).
- Truncate Table.

**15. CASE EXPRESSIONS:**
- CASE Expression made with (WHEN … THEN … ELSE … END).
- CASE used with (SELECT, UPDATE, ORDER BY, JOIN, WHERE).

**16. SUBQUERIES:**
- Scalar Subquery.
- Multi-row Subquery (IN, ANY, ALL).
- Correlated Subquery.

**17. VIEWS:**
- Create Views (Simple, Updateable).
- Alter View (Add New Column, Change Expression Logic, Add More Columns for Display, Add Conditional Filter, Add an Alias).
- Select data from View.
- Drop View.
- Check Views of a Database.

**18. INDEXES:**
- Clustered Indexes (Basic, Composite, Unique).
- Non-Clustered Indexes (Basic, Composite, Unique).
- Indexed View.
- Select data from Indexed View.
- Drop Index.
- Check Indexes of a (Table, Database).

**19. PROGRAMMABILITY:**
- Stored Procedures (Create: with and without Parameters, Execute, Drop, Check SPs of a Database).
- User-Defined Functions: Scalar & Table-Valued (Create, Execute, Drop, Check Functions of a Database).
- Triggers: AFTER, INSTEAD OF, FOR (Create, Drop, Check Triggers of a Table & Database).
- Cursors: Static, Dynamic, Forward Only, Keyset (Declare, Open, Fetch, Close, Deallocate).
- Benefits of Programmability (Modularity, Reusability, Security).

**20. TRANSACTIONS & ERROR HANDLING:**
- BEGIN TRAN, COMMIT, ROLLBACK with SAVEPOINTS.
- TRY … CATCH & THROW.
- Nested Transactions.
- Error Handling with Transactions.

**21. COMMON TABLE EXPRESSIONS (CTEs):**
- Simple CTE.
- Recursive CTE.
- Multiple CTEs in one query.
- Subquery vs CTE.
- Hierarchical Data.

**22. SYSTEM & METADATA FUNCTIONS:**
- System Info: @@VERSION, @@SERVERNAME, @@ROWCOUNT, @@ERROR.
- Identity & Object Info: @@IDENTITY, SCOPE_IDENTITY, DB_ID, DB_NAME, OBJECT_ID, OBJECT_NAME.
- Metadata Queries: INFORMATION_SCHEMA, sys.objects, sys.tables.

**23. WINDOW FUNCTIONS:**
- Row Numbering: ROW_NUMBER.
- OVER (PARTITION BY, ORDER BY).
- Ranking: RANK, DENSE_RANK.
- Distribution: NTILE, PERCENTILE_CONT, PERCENTILE_DISC, CUME_DIST, PERCENT_RANK.
- Navigation: LAG, LEAD.

**24. PIVOTING & UNPIVOTING:**
- PIVOT (Convert Rows to Columns).
- UNPIVOT (Convert Columns to Rows).
- Manual Pivoting using CASE WHEN.
- Dyanmic Pivoting.

**25. DYNAMIC SQL:**
- EXEC.
- sp_executesql.
- Dynamic Queries with Parameters.
- Dynamic Table and Column Names.
- Security & SQL Injection Prevention.

**26. PARTITIONING:**
- Partition Function.
- Partition Scheme.
- Partition Table.
- Switching Partitions.
- Querying Partitioned Tables.

**27. SECURITY & PERMISSIONS:**
- Login (Server level).
- Users (Database level).
- Schema (Create, Transfer an existing table, Drop).
- Roles (db_owner, db_securityadmin, db_accessadmin, db_ddladmin, db_datareader, db_datawriter, db_denydatareader, db_denydatawriter).
- Permissions: GRANT, REVOKE, DENY.
