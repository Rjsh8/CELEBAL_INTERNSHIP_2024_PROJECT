-- Create the database
CREATE DATABASE CompanyDB;
GO

-- Use the new database
USE CompanyDB;
GO

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

-- Insert data into the Departments table
INSERT INTO Departments (DepartmentID, Name) VALUES (1, 'Marketing');
INSERT INTO Departments (DepartmentID, Name) VALUES (2, 'Research');
INSERT INTO Departments (DepartmentID, Name) VALUES (3, 'Development');

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(18, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Employees table
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (1, 'John Doe', 1, 60000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (2, 'Jane Smith', 1, 70000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (3, 'Alice Johnson', 1, 65000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (4, 'Bob Brown', 1, 75000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (5, 'Charlie Wilson', 1, 80000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (6, 'Eva Lee', 2, 70000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (7, 'Michael Clark', 2, 75000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (8, 'Sarah Davis', 2, 80000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (9, 'Ryan Harris', 2, 85000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (10, 'Emily White', 2, 90000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (11, 'David Martinez', 3, 95000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (12, 'Jessica Taylor', 3, 100000.00);
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES (13, 'William Rodriguez', 3, 105000.00);

-- Query to get the desired output
WITH AvgSalaryByDept AS (
    SELECT 
        d.Name AS DepartmentName,
        AVG(e.Salary) AS AverageSalary,
        COUNT(e.EmployeeID) AS NumberOfEmployees
    FROM 
        Employees e
    JOIN 
        Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY 
        d.Name
),
OverallAvgSalary AS (
    SELECT AVG(Salary) AS OverallAverageSalary
    FROM Employees
)
SELECT 
    DepartmentName, 
    AverageSalary, 
    NumberOfEmployees
FROM 
    AvgSalaryByDept
WHERE 
    AverageSalary > (SELECT OverallAverageSalary FROM OverallAvgSalary);


	--	THIS PROJECT IN DONE BY RAJ SHARMA..(ARYA COLLEGE OF ENGINEERING AND IT)..
