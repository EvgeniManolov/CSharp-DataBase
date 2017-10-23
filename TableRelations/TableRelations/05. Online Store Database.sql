CREATE DATABASE OnlineStore 

USE OnlineStore 

CREATE TABLE Cities 
  ( 
     CityId INT PRIMARY KEY, 
     [Name]   VARCHAR(50) NOT NULL 
  ) 

CREATE TABLE Customers 
  ( 
     CustomerId INT PRIMARY KEY, 
     [Name]     VARCHAR(50) NOT NULL, 
     Birthdat   DATE NOT NULL, 
     CityId     INT FOREIGN KEY REFERENCES Cities(CityId) 
  ) 

CREATE TABLE Orders 
  ( 
     OrderId    INT PRIMARY KEY, 
     CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId) 
  ) 

CREATE TABLE ItemTypes 
  ( 
     ItemTypeId   INT PRIMARY KEY, 
     [Name]       VARCHAR(50) NOT NULL 
  ) 

CREATE TABLE Items 
  ( 
     ItemId      INT PRIMARY KEY, 
     [Name]      VARCHAR (50) NOT NULL, 
     ItemTypeId  INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeId) 
  ) 

CREATE TABLE OrderItems 
  ( 
     OrderId INT, 
     ItemId  INT, 
     CONSTRAINT PK_OrderItems  PRIMARY KEY (OrderId, ItemId), 
     CONSTRAINT FR_OrderItems_Orders  FOREIGN KEY (OrderId) REFERENCES Orders( 
     OrderId), 
     CONSTRAINT FR_OrderItems_Items  FOREIGN KEY (ItemId) REFERENCES Items(ItemId 
     ), 
  ) 