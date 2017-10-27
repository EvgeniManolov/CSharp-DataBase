CREATE PROCEDURE usp_CalculateFutureValueForAccount  (@AccountId    INT, 
                                                     @InterestRate FLOAT) 
AS 
  BEGIN 
      DECLARE @years INT = 5; 

      SELECT a.Id  AS [Account Id], 
             ah.FirstName AS   [FIRST Name], 
             ah.LastName  AS  [LAST Name], 
             a.Balance   AS  [CURRENT Balance], 
             dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, @years) AS 
             [Balance IN 5 years] 
      FROM   AccountHolders AS ah 
             JOIN Accounts AS a 
               ON ah.Id = a.AccountHolderId 
      WHERE  a.Id = @AccountId 
  END 

  EXEC dbo.usp_CalculateFutureValueForAccount 1, 5