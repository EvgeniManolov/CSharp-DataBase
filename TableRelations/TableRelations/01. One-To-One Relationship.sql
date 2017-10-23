CREATE TABLE Passports 
  ( 
     PassportID      INT PRIMARY KEY NOT NULL, 
     PassportNumber  VARCHAR(50) NOT NULL, 
  ) 


INSERT INTO Passports
			(PassportID,PassportNumber) 
VALUES		(101,'N34FG21B'),
			(102,'K65LO4R7'),
			(103,'ZE657QP2')


CREATE TABLE Persons  
  ( 
     PersonID    INT PRIMARY KEY IDENTITY NOT NULL, 
     FirstName   VARCHAR(50) NOT NULL, 
     Salary      DECIMAL (15, 2) NOT NULL, 
     PassportId  INT, 
     CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportId) REFERENCES 
     Passports(PassportId) 
  ) 


INSERT INTO Persons 
			(FirstName,Salary,PassportID) 
VALUES		('Roberto' , 43300.00, 102),
			('Tom', 56100.00, 103),
			('Yana', 60200.00, 101)


SELECT per.FirstName, 
       per.Salary, 
       pas.PassportNumber  
FROM   Persons  AS per 
       JOIN Passports AS pas 
         ON per.PassportId = pas.PassportId 