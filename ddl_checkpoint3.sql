-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Label VARCHAR(50),
    ManagerName VARCHAR(50)
);

-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    Title VARCHAR(50),
    DepartmentID INT
);

-- Create the EmployeeProjects table
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID)
);

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, Name, Position, Salary, DepartmentID) VALUES
(1, 'Alice', 'Software Engineer', 75000, 1),
(2, 'Bob', 'Project Manager', 90000, 1),
(3, 'Charlie', 'Designer', 60000, 2),
(4, 'Diana', 'Software Engineer', 70000, 2),
(5, 'Eve', 'Data Analyst', 65000, 3);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, Label, ManagerName) VALUES
(1, 'IT', 'John Doe'),
(2, 'Design', 'Jane Smith'),
(3, 'Analytics', 'Sam Wilson');

-- Insert data into Projects
INSERT INTO Projects (ProjectID, Title, DepartmentID) VALUES
(1, 'Website Redesign', 1),
(2, 'Mobile App', 2),
(3, 'Data Migration', 3),
(4, 'SEO Optimization', 3);



-- Insert data into EmployeeProjects
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, Role) VALUES
(1, 1, 'Developer'),
(1, 2, 'Tester'),
(2, 1, 'Manager'),
(3, 2, 'Designer'),
(4, 1, 'Tester'),
(4, 3, 'Developer'),
(5, 3, 'Analyst'),
(5, 4, 'Analyst');

-- Write a query to retrieve the names of employees who are assigned to more than one project, including the total number of projects for each employee.
SELECT e.Name, COUNT(ep.projectid) AS TotalProject
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.Name
HAVING COUNT(ep.projectid) > 1

--Write a query to retrieve the list of projects managed by each department, including the department label and manager’s name.
SELECT Departments.Label, Departments.ManagerName, Projects.title
FROM Departments 
JOIN Projects ON Departments.DepartmentID = Projects.DepartmentID

--Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project.
SELECT Employees.Name, EmployeeProjects.Role
FROM Employees
JOIN EmployeeProjects ON Employees.EmployeeID = EmployeeProjects.EmployeeID
JOIN Projects ON EmployeeProjects.ProjectID = Projects.ProjectID
WHERE Projects.Title = 'Website Redesign';

--Write a query to retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees. 
SELECT Departments.Label, Departments.ManagerName,  COUNT(Projects.DepartmentID) AS TotalNumber
FROM Departments
JOIN Projects ON Departments.DepartmentID = Projects.DepartmentID
GROUP BY Departments.DepartmentID
ORDER BY TotalNumber DESC

--Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names. 
SELECT Employees.Name, Employees.Position, Departments.Label, Employees.Salary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Salary > 60000

--Write a query to retrieve the number of employees assigned to each project, including the project title. 
SELECT Projects.Title, COUNT(EmployeeProjects.EmployeeID) AS NumberAssigned
FROM Projects
LEFT JOIN EmployeeProjects ON Projects.ProjectID = EmployeeProjects.ProjectID
Group By Projects.Title

--Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role. 
SELECT Employees.Name, Projects.Title, Employeeprojects.Role
FROM Employees
JOIN EmployeeProjects ON Employees.EmployeeID = EmployeeProjects.EmployeeID
JOIN Projects ON Employeeprojects.ProjectID = Projects.ProjectID

--Write a query to retrieve the total salary expenditure for each department, including the department label and manager name.
SELECT Departments.Label, Departments.ManagerName, SUM(Employees.Salary) AS TotalSalary
FROM Departments
JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.Label, Departments.ManagerName;


