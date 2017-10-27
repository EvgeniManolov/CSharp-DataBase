CREATE PROCEDURE usp_EmployeesBySalaryLevel @LevelSalary VARCHAR(10) 
AS 
    SELECT FirstName, 
           LastName 
    FROM   Employees 
    WHERE  @LevelSalary = dbo.ufn_GetSalaryLevel (Salary) 

    EXEC dbo.usp_EmployeesBySalaryLevel  High 