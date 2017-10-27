SELECT TOP 1 AVG(Salary) AS [MinAverageSalary] 
FROM   Employees 
GROUP  BY DepartmentId 
ORDER  BY MinAverageSalary