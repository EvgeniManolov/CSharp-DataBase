CREATE DATABASE CarRental 

USE CarRental 

CREATE TABLE Categories  
  ( 
     Id            INT PRIMARY KEY IDENTITY NOT NULL, 
     CategoryName  NVARCHAR(50), 
     DailyRate     DECIMAL(5, 2) NOT NULL, 
     WeeklyRate    DECIMAL(5, 2) NOT NULL, 
     MonthlyRate   DECIMAL(5, 2) NOT NULL, 
     WeekendRate   DECIMAL(5, 2) NOT NULL 
  ) 


CREATE TABLE Cars 
  ( 
     Id            INT PRIMARY KEY IDENTITY NOT NULL, 
     PlateNumber   NVARCHAR(10) NOT NULL, 
     Manufacturer  NVARCHAR(50) NOT NULL, 
     Model         NVARCHAR(50) NOT NULL, 
     CarYear       DATE NOT NULL, 
     CategoryId    INT FOREIGN KEY REFERENCES Categories(Id), 
     Doors         INT NOT NULL, 
     Picture       VARBINARY(MAX), 
     Condition     NVARCHAR(50), 
     Available     BIT NOT NULL, 
  ) 


CREATE TABLE Employees  
  ( 
     Id         INT PRIMARY KEY IDENTITY NOT NULL, 
     FirstName  NVARCHAR(50) NOT NULL, 
     LastName   NVARCHAR(50) NOT NULL, 
     Title      NVARCHAR(30) NOT NULL, 
     Notes      NVARCHAR(MAX) 
  ) 


CREATE TABLE Customers 
  ( 
     Id                   INT PRIMARY KEY IDENTITY NOT NULL, 
     DriverLicenceNumber  NVARCHAR(50) NOT NULL, 
     FullName             NVARCHAR(50) NOT NULL, 
     [Address]            NVARCHAR (500) NOT NULL, 
     City	              NVARCHAR(50) NOT NULL, 
     ZIPCode              NVARCHAR(50) NOT NULL, 
     Notes                NVARCHAR(MAX) 
  ) 


CREATE TABLE RentalOrders  
  ( 
     Id                INT PRIMARY KEY IDENTITY NOT NULL, 
     EmployeeId        INT FOREIGN KEY REFERENCES Employees(Id), 
     CustomerId        INT FOREIGN KEY REFERENCES Customers(Id), 
     CarId             INT FOREIGN KEY REFERENCES Cars(Id), 
     TankLevel         INT NOT NULL, 
     KilometrageStart  INT NOT NULL, 
     KilometrageEnd    INT NOT NULL, 
     TotalKilometrage  INT NOT NULL, 
     StartDate         DATE NOT NULL, 
     EndDate           DATE NOT NULL, 
     TotalDays         INT NOT NULL, 
     RateApplied       INT NOT NULL, 
     TaxRate           DECIMAL (10, 2) NOT NULL, 
     OrderStatus       NVARCHAR (50) NOT NULL, 
     Notes             NVARCHAR (MAX) 
  ) 


  -- Insert --
INSERT INTO Categories
			(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) 
VALUES		('trucks', 1.21, 2.21, 3.21, 4.21),
			('cars', 2.31, 2.31, 3.31, 4.31),
			('motors', 1.55, 2.45, 3.35, 4.25)


INSERT INTO Cars 
			(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) 
VALUES		('CA9999CH', 'Honda', 'Civic', '1999', 1, 4, NULL, 'something', 1),
			('CA9988CA', 'Honda', 'Accord', '2000', 2, 4, NULL, 'something...', 1),
			('CA9977CH', 'Honda', 'Prelude', '2001', 3, 4, NULL, 'somethinggg', 2)


INSERT INTO Employees
			(FirstName, LastName, Title) 
VALUES		('Ivan', 'Ivanov', 'Mr.'),
			('Georgi', 'Georgiev', 'Mr.'),
			('Pesho', 'Petrov', 'Mr.')


INSERT INTO Customers
			(DriverLicenceNumber, FullName, [Address], City, ZIPCode) 
VALUES		('STH928129KML', 'Strahil Petrov', 'Tsarigradsko shose 1111', 'Sofia', '1234L'),
			('UKMS99912KLS', 'Ivan Petrov', 'str.Vasil Aprilov 12', 'Burgas', '222I'),
			('ASDAS1237YSH', 'Dimitar Petrov', 'str. Vasil Levski 1', 'Varna', '999IU')


INSERT INTO RentalOrders 
			(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, 
TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus)
VALUES		(2, 2, 2, 50, 100, 102, 2, '20170511', '20170512', 1, 2, 5.50, 'In progress!'),
			(3, 3, 3, 50, 100, 105, 5, '20170513', '20170515', 2, 2, 5.50, 'Finished!'),
			(1, 1, 1, 50, 100, 106, 6, '20170515', '20170518', 3, 2, 5.50, 'Finished!')
