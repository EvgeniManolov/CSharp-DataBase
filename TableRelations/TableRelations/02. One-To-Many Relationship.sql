CREATE TABLE Manufacturers  
  ( 
     ManufacturerId  INT PRIMARY KEY IDENTITY NOT NULL, 
     [Name]          VARCHAR (50), 
     EstablishedOn   DATE 
  ) 


INSERT INTO Manufacturers
			([Name], EstablishedOn) 
VALUES		('BMW', '07/03/1916'),
			('Tesla','01/01/2003'),
			('Lada','01/05/1966')


CREATE TABLE Models 
  ( 
     ModelId        INT PRIMARY KEY NOT NULL, 
     [Name]         VARCHAR(50), 
     ManufacturerId INT FOREIGN KEY REFERENCES Manufacturers (ManufacturerId) 
  )
  
  
INSERT INTO Models
			(ModelId, [Name], ManufacturerId) 
VALUES      (101,'X1',1),
			(102,'i6',1),
			(103,'Model S',2),
			(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3) 

SELECT * 
FROM   Models 

SELECT * 
FROM   Manufacturers  