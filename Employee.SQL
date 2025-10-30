CREATE TABLE Employee_Details(
	EmpId INT NOT NULL,
	FullName VARCHAR(50) NOT NULL,
	ManagerId INT NOT NULL,
	DateOfJoining DATE,
	City VARCHAR(50) NOT NULL,
CONSTRAINT pk_Employee_Details PRIMARY KEY(EmpId)
)

INSERT INTO Employee_Details
VALUES
	(121,'John Snow',321,'2019-01-31','Toronto'),
	(321,'Walter White',986,'2020-01-30','California'),
	(421,'Kuldeep Rana',876,'2021-11-27','New Delhi'),
	(655,'Alex Brown',955,'2020-02-28','London'),
	(577,'Chris George',487,'2021-02-04','Manchester')

SELECT *
FROM Employee_Details

CREATE TABLE Employee_Salary(
	EmpId INT NOT NULL,
	Project VARCHAR(50),
	Salary INT NOT NULL,
	Variable INT NOT NULL
CONSTRAINT pk_Salary PRIMARY KEY(EmpId)
)

INSERT INTO Employee_Salary
VALUES
	(121,'P1',8000,500),
	(321,'P2',10000,1000),
	(421,'P1',12000,0),
	(655,'P1',14000,500),
	(577,'P2',16000,1000)

SELECT *
FROM Employee_Salary


--Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.

SELECT 
	EmpId,
	FullName
FROM
	Employee_Details
WHERE
ManagerId = 986

--Write an SQL query to fetch the different projects available from the EmployeeSalary table.

SELECT 
	project
FROM
	Employee_Salary


--Write an SQL query to fetch the count of employees working in project ‘P1’.

SELECT 
	EmpId AS [Count of employees]
FROM
	Employee_Salary
WHERE
	Project = 'P1'

--Write an SQL query to find the maximum, minimum, and average salary of the employees.

SELECT 
	MAX(Salary)
FROM
	Employee_Salary

SELECT 
	MIN(Salary)
FROM
	Employee_Salary

SELECT 
	AVG(Salary)
FROM
	Employee_Salary

--Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.

SELECT
	EmpId,
	Salary
FROM
	Employee_Salary
WHERE
	Salary BETWEEN 9000 AND 15000

--Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT
	ManagerId,
	City
FROM
	Employee_Details
WHERE
	ManagerId = 321 AND
	City = 'Toronto'

--Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT 
	City,
	ManagerId
FROM 
	Employee_Details
WHERE
	City = 'California' AND ManagerId = 321

--Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT 
	Project
FROM
	Employee_Salary
WHERE
	Project != 'P1'

--Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT
	EmpId,
	Project,
	salary,
	Variable,
	(Salary + Variable) AS Total_Salary
FROM
	Employee_Salary

--Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.

SELECT *
FROM
	Employee_Details
WHERE
	FullName LIKE '__hn%'

--Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.

SELECT 
	ed.EmpId,
	es.EmpId
FROM
	Employee_Details ed
LEFT JOIN
	Employee_Salary es 
ON 
	es.EmpId = ed.EmpId

