CREATE VIEW v_UserWithCountries 
AS 
  SELECT CONCAT(c.FirstName, ' ', c.LastName) AS [CustomerName], 
         c.Age, 
         c.Gender, 
         cunt.[Name]                            AS [CountryName] 
  FROM   Customers AS c 
         JOIN Countries AS cunt 
           ON cunt.id = c.CountryId 
