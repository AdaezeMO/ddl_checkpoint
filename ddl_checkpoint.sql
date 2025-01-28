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


