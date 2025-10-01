/* Select Database */
USE RECORDS;

/* SET OPERATORS (Tables named StudentActivities & StudentMarks have already been created in 03_Properties & 04_Filtering.sql) */
(SELECT MarksID FROM StudentMarks) UNION (SELECT ActivityID FROM StudentActivities);	/* UNION */
(SELECT MarksID FROM StudentMarks) UNION ALL (SELECT ActivityID FROM StudentActivities);	/* UNION ALL */
(SELECT MarksID FROM StudentMarks) INTERSECT (SELECT ActivityID FROM StudentActivities);	/* INTERSECT */
(SELECT MarksID FROM StudentMarks) EXCEPT (SELECT ActivityID FROM StudentActivities);	/* EXCEPT */