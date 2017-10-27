CREATE PROCEDURE usp_GetEmployeesFromTown @Town VARCHAR(20) 
AS 
    SELECT e.FirstName, 
           e.LastName 
    FROM   Employees AS e 
           JOIN Addresses AS a 
             ON a.AddressId = e.AddressId 
           JOIN Towns AS t 
             ON t.TownId = a.TownId 
    WHERE  t.NAME = @Town 

    EXEC dbo.Usp_getemployeesfromtown Sofia 