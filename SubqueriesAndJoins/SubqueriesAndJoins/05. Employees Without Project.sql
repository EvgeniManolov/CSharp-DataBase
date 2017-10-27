SELECT TOP 3 e.EmployeeId, 
             e.FirstName 
FROM   Employees AS e 
       LEFT OUTER JOIN EmployeesProjects AS ep 
                    ON ep.EmployeeId = e.EmployeeId 
       LEFT OUTER JOIN Projects AS p 
                    ON p.ProjectId = ep.ProjectId 
WHERE  p.[Name] IS NULL 