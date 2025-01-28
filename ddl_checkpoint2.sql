CREATE TABLE Employee (
	Num_E INT PRIMARY KEY,
	Name VARCHAR (255) NOT NULL,
	Position VARCHAR (255),
	Salary DECIMAL (10,2),
	Num_S INT
);


CREATE TABLE Department (
	Num_S INT PRIMARY KEY,
	Label VARCHAR (255) UNIQUE,
	Manager_name VARCHAR (255) NOT NULL
);
	
CREATE TABLE Project (
	Num_P INT PRIMARY KEY,
	Title VARCHAR (255),
	Start_Date DATE,
	End_Date DATE,
	Num_S INT
	);

CREATE TABLE Employee_Project (
	Num_E INT,
	Num_P INT,
	Role VARCHAR(255) NOT NULL
	);

INSERT INTO Employee
VALUES(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

SELECT * FROM Employee

SELECT * FROM Project

SELECT * FROM Department


INSERT INTO Department
VALUES(1, 'IT', 'Alice johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');


INSERT INTO Project
VALUES(201, 'Website Redesign', '2024-01-15','2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT infrastructure Setup', '2024-04-01', '2024-12-31', 1);

INSERT INTO Employee_Project
VALUES(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

INSERT INTO Department
VALUES(1, 'IT', 'Alice johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');
