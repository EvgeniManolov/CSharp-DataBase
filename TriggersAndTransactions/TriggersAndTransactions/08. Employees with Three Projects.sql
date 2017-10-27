CREATE PROCEDURE usp_AssignProject(@emloyeeId INT, 
                              @projectId INT) 
AS 
  BEGIN 
      BEGIN TRANSACTION 

      DECLARE @CountOfProjects INT = (SELECT Count(*) 
         FROM   EmployeesProjects 
         WHERE  EmployeeId = @emloyeeId) 

      INSERT INTO EmployeesProjects 
      VALUES      (@emloyeeId, 
                   @projectId) 

      IF( @CountOfProjects >= 3 ) 
        BEGIN 
            RAISERROR('The employee has too many projects!',16,1) 

            ROLLBACK 
        END 

      COMMIT 
  END 