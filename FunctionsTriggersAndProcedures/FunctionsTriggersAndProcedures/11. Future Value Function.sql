CREATE FUNCTION ufn_CalculateFutureValue (@Amount         MONEY, 
                                          @YearlyInterest FLOAT, 
                                          @Years          INT) 
RETURNS MONEY 
AS 
  BEGIN 
      DECLARE @Total MONEY 

      SET @Total = @Amount * (POWER(( 1 + @YearlyInterest ), @Years) ); 

      RETURN @Total 
  END 