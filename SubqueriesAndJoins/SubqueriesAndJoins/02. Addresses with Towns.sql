SELECT TOP 50 e.FirstName, 
              e.LastName, 
              t.[Name] AS [Town], 
              a.AddressText 
FROM   Employees AS e 
       JOIN Addresses AS a 
         ON a.AddressId = e.AddressId 
       JOIN Towns AS t 
         ON t.TownId = a.TownId 
ORDER  BY e.FirstName, 
          e.LastName