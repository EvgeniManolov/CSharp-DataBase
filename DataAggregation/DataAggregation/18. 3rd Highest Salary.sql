SELECT Salaries.DepartmentId, 
       Salaries.Salary 
FROM   (SELECT DepartmentId, 
               MAX(Salary)               AS Salary, 
               DENSE_RANK() 
                 OVER ( 
                   PARTITION BY DepartmentId 
                   ORDER BY Salary DESC) AS Rank 
        FROM   Employees 
        GROUP  BY DepartmentId, 
                  Salary)AS Salaries 
WHERE  Rank = 3 

CREATE TABLE MyTable  AS 
  (SELECT FirstName  
   FROM   Employees)