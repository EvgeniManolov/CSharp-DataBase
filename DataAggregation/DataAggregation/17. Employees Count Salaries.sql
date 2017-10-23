SELECT * 
FROM   Employees 

SELECT COUNT(Salary) AS [Count] 
FROM   Employees 
WHERE  ManagerId IS NULL 