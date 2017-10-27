CREATE TABLE NotificationEmails 
  ( 
     Id        INT IDENTITY PRIMARY KEY, 
     Recipient VARCHAR(100), 
     Subject   NVARCHAR(100), 
     Body      NVARCHAR(MAX) 
  ) 

GO 

CREATE TRIGGER tr_EmailNotification 
ON Logs 
AFTER INSERT 
AS 
  BEGIN 
      INSERT NotificationEmails 
             (Recipient, 
              Subject, 
              Body) 
      SELECT inserted.AccountId, 
             CONCAT('Balance change for account: ', inserted.AccountId), 
             CONCAT('On ', GETDATE(), ' your balance was changed from ', 
             inserted.OldSum, 
             ' to ', inserted.NewSum) 
      FROM   inserted 
  END 

  SELECT * FROM NotificationEmails