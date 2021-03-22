# ExtendHealth_Assessment
Answers to assessment questions

# Thoughts about this assessment
* This turned out to be way more involved than what I initally thought.
* It would have been helpful to have the final question defined a liitle better.

# Unique Eamil Addresses:
* In the class 'Solution.cs' is the functions to return the number of unique email address based on the stated criteria.


# Advanced Tic-Tac-Toe
* In the class TicTacToe.cs is the solution of the advanced tic tac toe game
	## Assumptions:
		* Little to no error handling was implemented i.e. NOT bullet proof!
		* I have tried to indicate inputs and value ranges where appropriate
		* NOT optimized for perfomance


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
		* This is A solution and THE solution.
		* Campground is in sections 'Alpha', 'Bravo', 'Charlie'
		* Tried to keep it as simple as posible
		* NOT optimized for performance