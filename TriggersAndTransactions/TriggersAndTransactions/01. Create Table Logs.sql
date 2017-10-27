CREATE TABLE Logs 
  ( 
     LogId     INT IDENTITY, 
     AccountId INT NOT NULL, 
     OldSum    MONEY, 
     NewSum    MONEY, 
     CONSTRAINT PK_LogId PRIMARY KEY(LogId), 
     CONSTRAINT FK_Logs_Account FOREIGN KEY(AccountId) REFERENCES Accounts(Id) 
  ) 

GO

CREATE TRIGGER tr_Accountlogs 
ON [Accounts] 
FOR UPDATE, INSERT 
AS 
  BEGIN 
      DECLARE @accountID INT; 

      SET @accountID = (SELECT i.Id 
                        FROM   inserted AS i); 

      DECLARE @newBallance MONEY; 

      SET @newBallance = (SELECT i.Balance 
                          FROM   inserted AS i) 

      IF EXISTS(SELECT * 
                FROM   DELETED) 
        BEGIN 
            DECLARE @oldBallance MONEY; 

            SET @oldBallance = (SELECT d.Balance 
                                FROM   DELETED AS d); 
        END 

      INSERT INTO dbo.Logs 
                  (dbo.Logs.AccountId, 
                   dbo.Logs.OldSum, 
                   dbo.Logs.NewSum) 
      VALUES      ( @accountID, 
                    @oldBallance,
                    @newBallance 
      ) 
  END 


UPDATE Accounts 
SET    Accounts.Balance += 200 
WHERE  Accounts.Id = 1 

SELECT * 
FROM   Logs 
GO