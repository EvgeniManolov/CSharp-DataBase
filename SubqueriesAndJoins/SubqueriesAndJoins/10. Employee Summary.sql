SELECT TOP 50 e.EmployeeId, 
              e.FirstName + ' ' + e.LastName   AS [EmployeeName], 
              e2.FirstName + ' ' + e2.LastName AS [ManagerName], 
              d.[Name]                         AS [DepartmentName] 
FROM   Employees AS e 
       JOIN Departments AS d 
         ON d.DepartmentId = e.DepartmentId 
       JOIN Employees AS e2 
         ON e.ManagerId = e2.EmployeeId 
ORDER  BY e.EmployeeId 