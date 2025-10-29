/* Select Database */
USE RECORDS;

/* Create Table */
CREATE TABLE Numbers(
	ID int PRIMARY KEY IDENTITY (1,1),
	NumValue FLOAT
);

/* Insert data into Table */
INSERT INTO Numbers (NumValue) VALUES (25.75), (-10.4), (0), (3.5), (9.9), (-5.7), (100), (2), (15), (-0.25);

/* BASIC MATH */
/* 1) ABS */
SELECT NumValue, ABS(NumValue) AS AbsoluteValue FROM Numbers;	/* Converts the Negative value into Positive value */

/* 2) ROUND */
SELECT NumValue, ROUND(NumValue, 1) AS RoundedtoOneDecimal FROM Numbers;	/* Round off to specified decimal places */

/* 3) CEILING */
SELECT NumValue, CEILING(NumValue) AS RoundedUp FROM Numbers;	/* Round Upward to the nearest integar */

/* 4) FLOOR */
SELECT NumValue, FLOOR(NumValue) AS RoundedDown FROM Numbers;	/* Round Downward to the nearest integar */

/* ADVANCED MATH */
/* 1) POWER */
SELECT NumValue, POWER(NumValue, 2) AS SquareValue FROM Numbers;	/* Returns the value of a number raised to a specified power */

/* 2) SQRT */
SELECT NumValue, SQRT(ABS(NumValue)) AS SquareRoot FROM Numbers;	/* Returns the Square Root of that number */

/* 3) EXP */
SELECT NumValue, EXP(NumValue) AS ExponentialValue FROM Numbers;	/* Returns e (Eular's number = 2.718) raised to the specified power */

/* 4) LOG */
SELECT NumValue, LOG(ABS(NumValue) + 1) AS NaturalLog FROM Numbers;	/* Returns the Natural Logarithm (base e) of a number */

/* 5) SIGN */
SELECT NumValue, SIGN(NumValue) AS SignValue FROM Numbers;	/* Returns the Sign of a number */

/* 6) RAND */
SELECT RAND() AS RandomValue;	/* Select any random value */

/* EXTENDED MATH */
/* 1) LOG10 */
SELECT NumValue, LOG10(ABS(NumValue) + 1) AS LogBase10 FROM Numbers;	/* Returns the Base 10 logarithm of a number */

/* 2) PI */
SELECT PI() AS PiValue;	/* Returns the constant value of PI */