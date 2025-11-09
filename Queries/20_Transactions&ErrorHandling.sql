/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE BankAccounts(
	AccountID int PRIMARY KEY,
	AccountName varchar(50),
	Balance decimal(10, 2)
);

/* Insert data into Table */
INSERT INTO BankAccounts (AccountID, AccountName, Balance) VALUES (1, 'Faraz', 50000.00), (2, 'Sameha', 30000.00), (3, 'Asmara', 70000.00);

/* TRANSACTIONS with SAVEPOINTS */
BEGIN TRAN;	/* Start the transaction */

	UPDATE BankAccounts SET Balance = Balance - 5000 WHERE AccountID = 1;	/* Deduct 5000 from First Account */
	SAVE TRANSACTION Step1; /* Savepoint 1 */

	UPDATE BankAccounts SET Balance = Balance + 5000 WHERE AccountID = 2;	/* Add 5000 to Second Account */
	SAVE TRANSACTION Step2;	/* Savepoint 2 */

ROLLBACK;	/* Undo the whole transaction (if required) */
ROLLBACK TRANSACTION Step2;	/* Just Undo the second step (if required) */

COMMIT TRAN;	/* Save permanently */

/* TRY ... CATCH & THROW */
BEGIN TRY
	BEGIN TRAN;

	INSERT INTO BankAccounts (AccountID, AccountName, Balance) VALUES (NULL, 'Ahmed', 5000);	/* Will surely throws an error. Since, NULL cannot be inserted into NOT NULL column. */

	COMMIT TRAN;
END TRY

BEGIN CATCH
	ROLLBACK TRAN;

	PRINT 'Error occured. Transaction rolled back!';
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
	THROW;	/* If THROW is there, SQL will overwrite every other error message. Hence, will not show the result of previous query. */
END CATCH

/* NESTED TRANSACTIONS */
BEGIN TRAN;
	PRINT 'Step 1: Outer transaction started.';

	UPDATE BankAccounts SET Balance = Balance - 5000 WHERE AccountID = 1;	/* Deduct 5000 from First Account */
	PRINT 'Step 2: Deducted 5000 from First Account.';

	BEGIN TRAN;
		PRINT 'Step 3: Inner transaction started.';

		UPDATE BankAccounts SET Balance = Balance + 5000 WHERE AccountID = 2;	/* Add 5000 to Second Account */
		PRINT 'Step 4: Added 5000 to Second Account.';
		
	COMMIT TRAN;
	PRINT 'Step 5: Inner transaction committed.';

COMMIT TRAN;
PRINT 'Step 6: Outer transaction committed.';

/* ERROR HANDLING WITH TRANSACTIONS */
BEGIN TRY

    BEGIN TRAN;	/* Start transaction */
    PRINT 'Transaction started.';

    UPDATE BankAccounts SET Balance = Balance - 5000 WHERE AccountID = 1;	/* Deduct 5000 from First Account */
    UPDATE BankAccounts SET Balance = Balance + 5000 WHERE AccountID = 2;	/* Add 5000 to Second Account */

    /* --Introduce a forced error (runtime error) */
    DECLARE @x INT = 10, @y INT = 0;
    DECLARE @z INT;
    SET @z = @x / @y;	/* Divide by zero (error) */

    COMMIT TRAN;  /* Will never reach here due to error */
    PRINT 'Transaction committed successfully.';
END TRY

BEGIN CATCH
    IF @@TRANCOUNT > 0	/* If error occurs, rollback safely */
	ROLLBACK TRAN;

    PRINT 'Error occurred. Transaction rolled back.';

    /* Show detailed error info */
    SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
END CATCH;