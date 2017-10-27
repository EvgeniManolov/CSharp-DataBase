SELECT TOP 5 e.EmployeeId, 
             e.FirstName, 
             p.[Name] 
FROM   Employees AS e 
       JOIN EmployeesProjects ep 
         ON ep.EmployeeId = e.EmployeeId 
       JOIN Projects AS p 
         ON p.ProjectId = ep.ProjectId 
WHERE  p.StartDate > '08/13/2002' 
       AND p.EndDate IS NULL 
ORDER  BY e.EmployeeId 