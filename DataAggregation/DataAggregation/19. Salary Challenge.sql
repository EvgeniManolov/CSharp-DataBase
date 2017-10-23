SELECT TOP 10 FirstName, 
              LastName, 
              DepartmentId  
FROM   Employees  AS emp1 
WHERE  Salary > (SELECT Avg(Salary) 
                 FROM   Employees  AS emp2 
                 WHERE  emp1.DepartmentId = emp2.DepartmentId 
                 GROUP  BY DepartmentId) 
ORDER  BY DepartmentId 