CREATE FUNCTION udf_GetRating (@Name NVARCHAR(50)) 
RETURNS VARCHAR(10) 
AS 
  BEGIN 
      DECLARE @AvgRate DECIMAL(4, 2) = (SELECT AVG(f.Rate) 
         FROM   Products AS p 
                JOIN Feedbacks AS f 
                  ON f.ProductId = p.Id 
         WHERE  p.[Name] = @Name) 
      DECLARE @Rating VARCHAR(10)= CASE 
          WHEN @AvgRate IS NULL THEN 'No rating' 
          WHEN @AvgRate < 5 THEN 'Bad' 
          WHEN @AvgRate <= 8 THEN 'Average' 
          ELSE 'Good' 
        END 

      RETURN @Rating 
  END 

GO 

SELECT TOP 5 Id, 
             [Name], 
             dbo.udf_GetRating([Name]) AS Rating 
FROM   Products 
ORDER  BY Id 
