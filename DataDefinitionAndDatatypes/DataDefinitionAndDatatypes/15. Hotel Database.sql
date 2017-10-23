CREATE DATABASE Hotel 

USE Hotel 

CREATE TABLE Employees  
  ( 
     Id         INT PRIMARY KEY IDENTITY NOT NULL, 
     FirstName  NVARCHAR(50) NOT NULL, 
     LastName   NVARCHAR (50) NOT NULL, 
     Title      NVARCHAR(30), 
     Notes      NVARCHAR(MAX) 
  ) 


CREATE TABLE Customers  
  ( 
     AccountNumber    INT PRIMARY KEY IDENTITY NOT NULL, 
     FirstName        NVARCHAR(50) NOT NULL, 
     LastName         NVARCHAR (50) NOT NULL, 
     PhoneNumber      NVARCHAR (50) NOT NULL, 
     EmergencyName    NVARCHAR (50) NOT NULL, 
     EmergencyNumber  NVARCHAR (50) NOT NULL, 
     Notes            NVARCHAR(MAX) 
  ) 


CREATE TABLE RoomStatus  
  ( 
     RoomStatus  NVARCHAR(20) PRIMARY KEY NOT NULL, 
     Notes       NVARCHAR(MAX) 
  ) 


CREATE TABLE RoomTypes  
  ( 
     RoomType  NVARCHAR(30) PRIMARY KEY NOT NULL, 
     Notes     NVARCHAR(MAX) 
  ) 


CREATE TABLE BedTypes  
  ( 
     BedType  NVARCHAR(50) PRIMARY KEY NOT NULL, 
     Notes	  NVARCHAR(MAX) 
  ) 


CREATE TABLE Rooms  
  ( 
     RoomNumber  INT PRIMARY KEY NOT NULL, 
     RoomType    NVARCHAR(30) FOREIGN KEY REFERENCES RoomTypes(RoomType), 
     BedType     NVARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType), 
     Rate        DECIMAL(5, 2) NOT NULL, 
     RoomStatus  NVARCHAR(20) FOREIGN KEY REFERENCES RoomStatus(RoomStatus), 
     Notes       NVARCHAR(MAX) 
  ) 


CREATE TABLE Payments  
  ( 
     Id                 INT PRIMARY KEY IDENTITY NOT NULL, 
     EmployeeId         INT FOREIGN KEY REFERENCES Employees(Id), 
     PaymentDate        DATE NOT NULL, 
     AccountNumber      NVARCHAR(50) NOT NULL, 
     FirstDateOccupied  DATE NOT NULL, 
     LastDateOccupied   DATE NOT NULL, 
     TotalDays          INT NOT NULL, 
     AmountCharged      DECIMAL(10, 2) NOT NULL, 
     TaxRate            DECIMAL (10, 2) NOT NULL, 
     TaxAmount          DECIMAL (10, 2) NOT NULL, 
     PaymentTotal       DECIMAL (15, 2) NOT NULL, 
     Notes              NVARCHAR(MAX), 
  ) 


CREATE TABLE Occupancies  
  ( 
     Id             INT PRIMARY KEY IDENTITY NOT NULL, 
     EmployeeId		INT FOREIGN KEY REFERENCES Employees (Id), 
     DateOccupied   DATE NOT NULL, 
     AccountNumber  NVARCHAR (50) NOT NULL, 
     RoomNumber     INT NOT NULL, 
     RateApplied    DECIMAL NOT NULL, 
     PhoneCharge    DECIMAL NOT NULL, 
     Notes          NVARCHAR(MAX) 
  ) 


  -- Insert -- 

INSERT INTO Employees
			(FirstName, LastName) 
VALUES		('Ivan', 'Ivanov'),
			('Petar', 'Petrov'),
			('Georgi', 'Georgiev')

	
INSERT INTO Customers 
			(FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber) 
VALUES		('Ivan', 'Ivanov', '0899 999 999', 'Petya Ivanova', '0888 111 888'),
			('Petar', 'Petrov', '0899 123 312', 'Zoya Ivanova', '0888 888 222'),
			('Strahil', 'Strahilov', '0899 312 312', 'Roza Ivanova', '0888 333 888')


INSERT INTO RoomStatus
			(RoomStatus) 
VALUES		('Cleaning'),
			('Busy'),
			('Closed')


INSERT INTO RoomTypes 
			(RoomType) 
VALUES		('Single'),
			('Double'),
			('Apartment')


INSERT INTO BedTypes 
			(BedType)
VALUES		('Single Bed!'),
			('Double Bed!'),
			('Small Bed!')

INSERT INTO Rooms 
			(RoomNumber, RoomType, BedType, Rate, RoomStatus) 
VALUES		(215, 'Single', 'Small Bed!', 5.50, 'Closed'),
			(216, 'Double', 'Double Bed!', 5.50, 'Cleaning'),
			(217, 'Apartment', 'Single Bed!', 5.50, 'Busy')


INSERT INTO Payments
			(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate,TaxAmount, PaymentTotal) 
VALUES		(1, '20171212', 'BG1239123I', '20171111', '20171113',2, 150, 10, 15, 165),
			(2, '20171111', 'BG1239123IASDASD', '20171111', '20171113',2, 150, 10, 15, 175),
			(3, '20171010', 'BG1239123IGTAWQ', '20171111', '20171113',2, 150, 10, 15, 165)


INSERT INTO Occupancies
			(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge)
VALUES		(1, '20171010', 'BG1235818IJJ', 215, 5.50, 1.20),
			(2, '20170909', 'BG123583212318IJJ', 216, 5.05, 1.20),
			(3, '20171008', 'BG1230129318IJJ', 217, 5.10, 1.20)