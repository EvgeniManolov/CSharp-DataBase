CREATE FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(MAX)) 
RETURNS @RtnTable TABLE ( 
  SumCash MONEY ) 
AS 
  BEGIN 
      DECLARE @CashSum MONEY 

      SET @CashSum = (SELECT SUM(ug.Cash) AS 'SumCash' 
                      FROM   (SELECT Cash, 
                                     Gameid, 
                                     Row_number() 
                                       OVER ( 
                                         ORDER BY Cash DESC) AS RoWNum 
                              FROM   UsersGames 
                              WHERE  Gameid = (SELECT Id 
                                               FROM   Games 
                                               WHERE  [Name] = @GameName)) ug 
                      WHERE  ug.RoWNum % 2 != 0) 

      INSERT @RtnTable 
      SELECT @CashSum 

      RETURN 
  END 



SELECT * 
INTO   TestTable 
FROM   dbo.ufn_CashInUsersGames ('Bali') 