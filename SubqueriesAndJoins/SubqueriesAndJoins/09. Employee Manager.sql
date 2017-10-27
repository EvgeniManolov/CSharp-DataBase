SELECT e.EmployeeId, 
       e.FirstName, 
       e2.EmployeeId, 
       e2.FirstName 
FROM   Employees e 
       JOIN Employees AS e2 
         ON e2.EmployeeId = e.ManagerId 
WHERE  e.ManagerId IN ( 3, 7 ) 
ORDER  BY e.EmployeeId 