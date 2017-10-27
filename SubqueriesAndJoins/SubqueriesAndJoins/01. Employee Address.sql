SELECT TOP 5 e.EmployeeId, 
             e.Jobtitle, 
             a.AddressId, 
             a.Addresstext 
FROM   Employees AS e 
       JOIN Addresses AS a 
         ON a.AddressId = e.AddressId 
ORDER  BY e.AddressId 