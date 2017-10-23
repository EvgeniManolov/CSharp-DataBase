CREATE TABLE People 
  ( 
     Id          INT PRIMARY KEY IDENTITY NOT NULL CHECK (Id < 2147483647), 
     [Name]      NVARCHAR(200) NOT NULL, 
     Picture     VARBINARY CHECK (DATALENGTH (Picture) < 900 * 1024), 
     Height      DECIMAL (10, 2), 
     [Weight]    DECIMAL (10, 2), 
     Gender      CHAR(1) NOT NULL CHECK (Gender= 'm' OR Gender= 'f'), 
     Birthdate   DATE NOT NULL, 
     Biography   NVARCHAR(MAX) 
  ) 

INSERT INTO People
			([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) 
VALUES		('Ivan', NULL, 1.80, 90, 'm', '05-05-1666', 'Machine'),
			('Pesho', NULL, 1.90, 100, 'm', '06-06-1777', 'Stone'),
			('Gosho', NULL, 1.87, 90, 'm', '07-07-1888', 'Sword'),
			('Petya', NULL, 1.60, 90, 'f', '01-01-1999', 'Crazy'),
			('Ivanka', NULL, 1.78, 90, 'f', '02-02-2000', 'Lazy')