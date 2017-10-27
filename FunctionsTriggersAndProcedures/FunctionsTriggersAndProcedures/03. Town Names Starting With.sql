CREATE PROCEDURE usp_GetTownsStartingWith  @StartWithLetter VARCHAR(15) 
AS 
    DECLARE @FinalString VARCHAR(15) 

    SET @FinalString = @StartWithLetter + '%' 

    SELECT [Name] 
    FROM   Towns 
    WHERE  [Name] LIKE @FinalString 

    EXEC dbo.usp_GetTownsStartingWith  b 