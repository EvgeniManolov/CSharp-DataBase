SELECT TOP 1 WITH TIES c.[Name]      AS [CountryName], 
                       AVG(f.Rate) AS [FeedbackRate] 
FROM   Countries AS c 
       JOIN Customers AS cus 
         ON cus.CountryId = c.Id 
       JOIN Feedbacks AS f 
         ON f.CustomerId = cus.Id 
GROUP  BY c.[Name] 
ORDER  BY AVG(f.Rate) DESC 