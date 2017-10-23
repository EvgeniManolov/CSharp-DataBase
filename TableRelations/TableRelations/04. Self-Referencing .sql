CREATE TABLE Teachers  
  ( 
     TeacherId  INT PRIMARY KEY, 
     [Name]     VARCHAR(50) NOT NULL, 
     ManagerId  INT FOREIGN KEY REFERENCES Teachers(ManagerId) 
  ) 


INSERT INTO Teachers
			(TeacherId, [Name], ManagerId)
VALUES		(101, 'John', NULL),
			(102, 'Maya', 106),
			(103, 'Silvia', 106),
			(104, 'Ted', 105),
			(105, 'Mark', 101),
			(106, 'Greta', 101)