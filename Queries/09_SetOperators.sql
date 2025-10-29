/* Select Database */
USE RECORDS;

/* Tables named 'StudentActivities' & 'StudentMarks' have already been created in 03_Properties.sql & 04_Filtering.sql */

/* SET OPERATORS */
/* 1) UNION */
(SELECT MarksID FROM StudentMarks) UNION (SELECT ActivityID FROM StudentActivities);	/* Combine the result of both queries and remove duplicates */

/* 2) UNION ALL */
(SELECT MarksID FROM StudentMarks) UNION ALL (SELECT ActivityID FROM StudentActivities);	/* Combine the result of both queries and keep duplicates */

/* 3) INTERSECT */
(SELECT MarksID FROM StudentMarks) INTERSECT (SELECT ActivityID FROM StudentActivities);	/* Return only common rows from both queries */

/* 4) EXCEPT */
(SELECT MarksID FROM StudentMarks) EXCEPT (SELECT ActivityID FROM StudentActivities);	/* Return rows from the first query that are not in the second query */
