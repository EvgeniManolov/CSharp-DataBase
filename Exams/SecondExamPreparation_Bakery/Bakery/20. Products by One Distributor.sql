WITH CTE 
     AS (SELECT p.Id        AS ProductId, 
                p.[Name]      AS [ProductName], 
                AVG(f.Rate) AS [AverageRate], 
                d.[Name]      AS [DistributorName], 
                c.[Name]      AS [DistributorCountry] 
         FROM   Products AS p 
                JOIN Feedbacks AS f 
                  ON f.ProductId = p.Id 
                JOIN ProductsIngredients AS pii 
                  ON pii.ProductId = p.Id 
                JOIN Ingredients AS i 
                  ON i.Id = pii.IngredientId 
                JOIN Distributors AS d 
                  ON d.Id = i.DistributorId 
                JOIN Countries AS c 
                  ON c.Id = d.CountryId 
         GROUP  BY p.[Name], 
                   d.[Name], 
                   c.[Name], 
                   p.Id) 
SELECT CTE.ProductName, 
       CTE.AverageRate, 
       CTE.DistributorName, 
       CTE.DistributorCountry 
FROM   CTE 
       JOIN (SELECT ProductName, 
                    COUNT(DistributorName) AS DistributorCount 
             FROM   CTE 
             GROUP  BY ProductName) AS DistributorCounttt 
         ON CTE.ProductName = DistributorCounttt.ProductName 
WHERE  DistributorCount = 1 
ORDER  BY ProductId 



















