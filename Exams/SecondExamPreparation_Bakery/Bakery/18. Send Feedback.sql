CREATE PROCEDURE usp_SendFeedback (@CustomerId  INT, 
                                   @ProductId   INT, 
                                   @Rate        DECIMAL (4, 2), 
                                   @Description NVARCHAR(255)) 
AS 
  BEGIN 
      BEGIN TRANSACTION 

      INSERT INTO Feedbacks 
                  (CustomerId, ProductId, Rate, [Description]) 
      VALUES      (@CustomerId, @ProductId, @Rate, @Description) 

      DECLARE @CountFeedbacks INT = (SELECT COUNT(f.Id) 
         FROM   Feedbacks AS f 
         WHERE  CustomerId = @CustomerId 
                AND ProductId = @ProductId) 

      IF @CountFeedbacks > 3 
        BEGIN 
            ROLLBACK 

            RAISERROR('You are limited to only 3 feedbacks per product!',16,1) 
        END 
      ELSE 
        COMMIT 
  END 

GO 

EXEC usp_SendFeedback 1, 5, 7.50, 'Average experience'; 

SELECT COUNT(*) 
FROM   Feedbacks 
WHERE  CustomerId = 1 
       AND ProductId = 5; 
