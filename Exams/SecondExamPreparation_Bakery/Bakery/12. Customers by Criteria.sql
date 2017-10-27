SELECT c.FirstName, 
       c.Age, 
       c.PhoneNumber 
FROM   Customers AS c 
       JOIN Countries AS co 
         ON co.id = c.CountryId 
WHERE  ( Age >= 21 
         AND FirstName LIKE '%an%' ) 
        OR ( PhoneNumber LIKE '%38' 
             AND co.[Name] NOT LIKE 'Greece' ) 
ORDER  BY FirstName, 
          Age DESC 