SELECT e.FirstName, 
       e.LastName, 
       e.HireDate, 
       d.[Name] AS [DeptName] 
FROM   Employees AS e 
       JOIN Departments AS d 
         ON e.DepartmentId = d.DepartmentId 
WHERE  e.HireDate > '01/01/1999' 
       AND d.[Name] IN ( 'Sales', 'Finance' ) 
ORDER  BY e.HireDate