CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters VARCHAR (50),@Word VARCHAR (50)) 
RETURNS BIT 
AS 
  BEGIN 
      DECLARE @Index INT = 1 
      DECLARE @Length INT = LEN(@Word) 
      DECLARE @Letter CHAR(1) 

      WHILE ( @Index <= @Length ) 
        BEGIN 
            SET @letter = SUBSTRING(@Word, @Index, 1) 

            IF ( CHARINDEX(@Letter, @SetOfLetters) > 0 ) 
              SET @Index = @Index + 1 
            ELSE 
              RETURN 0 
        END 

      RETURN 1 
  END 