CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber @Number DECIMAL(18, 4) = 48100 
AS 
    SELECT FirstName AS [First Name], 
           LastName  AS [Last Name] 
    FROM   Employees 
    WHERE  Salary >= @Number 

	EXEC dbo.usp_GetEmployeesSalaryAboveNumber