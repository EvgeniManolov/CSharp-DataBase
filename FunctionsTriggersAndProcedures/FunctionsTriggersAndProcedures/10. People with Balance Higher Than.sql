CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan @Number DECIMAL(15, 2) 
AS 
    SELECT ah.FirstName, 
           ah.LastName 
    FROM   AccountHolders AS ah 
           JOIN Accounts AS a 
             ON a.AccountHolderId = ah.Id 
    GROUP  BY ah.FirstName, 
              ah.LastName 
    HAVING SUM(a.Balance) > @Number 

    EXEC dbo.usp_GetHoldersWithBalanceHigherThan 100000 