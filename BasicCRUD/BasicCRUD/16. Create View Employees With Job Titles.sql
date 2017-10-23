CREATE VIEW V_EmployeeNameJobTitle                                  AS 
SELECT FirstName  + ' ' + COALESCE (MiddleName, '') + ' ' + LastName  AS [FullName], 
       JobTitle                                                      AS [Job Title] 
FROM   Employees
 
SELECT * 
FROM   V_EmployeeNameJobTitle