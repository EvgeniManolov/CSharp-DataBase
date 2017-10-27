CREATE PROCEDURE usp_DeleteEmployeesFromDepartment (@DepartmentId INT) 
AS 
    ALTER TABLE Departments 
      ALTER COLUMN ManagerId INT NULL 

    DELETE FROM EmployeesProjects 
    WHERE  EmployeeId IN (SELECT e.EmployeeId 
                          FROM   Employees AS e 
                          WHERE  e.DepartmentId = @DepartmentId) 

    UPDATE Employees 
    SET    ManagerId = NULL 
    WHERE  ManagerId IN (SELECT e.EmployeeId 
                         FROM   Employees AS e 
                         WHERE  e.DepartmentId = @DepartmentId) 

    UPDATE Departments 
    SET    ManagerId = NULL 
    WHERE  ManagerId IN (SELECT e.EmployeeId 
                         FROM   Employees AS e 
                         WHERE  e.DepartmentId = @DepartmentId) 

    DELETE FROM Employees 
    WHERE  EmployeeId IN (SELECT e.EmployeeId 
                          FROM   Employees AS e 
                          WHERE  e.DepartmentId = @DepartmentId) 

    DELETE FROM Departments 
    WHERE  DepartmentId = @DepartmentId 

    SELECT COUNT(EmployeeId) 
    FROM   Employees 
    WHERE  DepartmentId = @DepartmentId 