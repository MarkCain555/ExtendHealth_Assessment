# Thoughts about this assessment
* This turned out to be way more involved than what i initally thought.
* It took me longer because I had to share my computer with my son for his university classes.

# ExtendHealth_Assessment
Answers to assessment questions

# Unique Eamil Addresses:
* In the class 'Solution.cs' is the functions to return the number of unique email address based on the stated criteria.


# Advanced Tic-Tac-Toe
* In the class TicTacToe.cs is the solution of the advanced tic tac toe game
	## Assumptions:
		* Little to no error handling was implemented i.e. NOT bullet proof!
		* I have tried to indicate inputs and value ranges where appropriate


# Duplicate Email Addresses
```sql
	SELECT email
	From   Employee
	Group  BY email
	Having Count(email) > 1
```

# Department Highest Salaries
```sql
	WITH maxSalary AS (
		SELECT departmentid, MAX(salary) AS salary 
		FROM Employee 
		GROUP BY departmentid
	)
	SELECT
		d.name AS 'Department',
		e.name AS 'Employee',
		e.salary AS 'Salary'
	FROM Employee e
	CROSS APPLY
		(SELECT * FROM Department WHERE departmentid = e.departmentid) d
	WHERE e.salary IN (SELECT salary FROM maxSalary)
```

# Camp Site Tracking
	* There is a separate solution for this question, as well as, a DB backup file 'MillcreekCanyom.bak' with dummy data in it.
	## Assuptions:
		* This is a solution and THE solution.  