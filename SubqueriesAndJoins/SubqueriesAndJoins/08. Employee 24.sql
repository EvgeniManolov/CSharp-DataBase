SELECT e.EmployeeId, 
       e.FirstName, 
       [ProjectName] = CASE 
                         WHEN YEAR(p.StartDate) >= 2005 THEN NULL 
                         ELSE p.[Name] 
                       END 
FROM   Employees AS e 
       JOIN EmployeesProjects AS ep 
         ON e.EmployeeId = ep.EmployeeId 
       JOIN Projects AS p 
         ON p.ProjectId = ep.ProjectId 
WHERE  e.EmployeeId = 24