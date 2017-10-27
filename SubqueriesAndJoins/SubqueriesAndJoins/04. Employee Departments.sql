SELECT TOP 5 e.EmployeeId, 
             e.FirstName, 
             e.Salary, 
             d.[Name] 
FROM   Employees AS e 
       JOIN Departments AS d 
         ON e.DepartmentId = d.DepartmentId 
WHERE  e.Salary > 15000 
ORDER  BY d.DepartmentId 