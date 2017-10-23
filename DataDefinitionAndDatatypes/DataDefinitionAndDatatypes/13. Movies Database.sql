CREATE DATABASE Movies 

USE Movies 

CREATE TABLE Directors  
  ( 
     Id            INT PRIMARY KEY IDENTITY NOT NULL, 
     DirectorName  NVARCHAR(50) NOT NULL, 
     Notes         NVARCHAR(MAX) 
  ) 

CREATE TABLE Genres  
  ( 
     Id         INT PRIMARY KEY IDENTITY NOT NULL, 
     GenreName  NVARCHAR(50) NOT NULL, 
     Notes      NVARCHAR(MAX) 
  ) 

CREATE TABLE Categories  
  ( 
     Id            INT PRIMARY KEY IDENTITY NOT NULL, 
     CategoryName  NVARCHAR(50) NOT NULL, 
     Notes         NVARCHAR(MAX) 
  ) 

CREATE TABLE Movies  
  ( 
     Id             INT PRIMARY KEY IDENTITY NOT NULL, 
     Title          NVARCHAR(50) NOT NULL, 
     DirectorId     INT FOREIGN KEY REFERENCES Directors(Id), 
     CopyrightYear  DATE, 
     [Length]       BIGINT, 
     GenreId        INT FOREIGN KEY REFERENCES Genres(Id), 
     Rating         INT, 
     Notes          NVARCHAR(MAX) 
  ) 


-- Insert--
INSERT INTO Directors
			(DirectorName, Notes)
VALUES		('Sales', 'I am Sales director!'),
			('Finance', 'I am Finance director!'),
			('Procurement', 'I am Procurement director!'),
			('Back Office', 'I am Back Office director!'),
			('Supply Chain', 'I am Supply Chain director!')

INSERT INTO Genres 
			(GenreName, Notes) 
VALUES		('Comedy', 'It''s a comedy'),
			('Thriller', 'best-selling album'),
			('Drama', 'specific mode of fiction represented in performance'),
			('Fantastic', 'based on fantasy'),
			('Action', 'something')

INSERT INTO Categories 
			(CategoryName, Notes) 
VALUES		('First category',''),
			('Second category','the best'),
			('Third category','NULL'),
			('Fourth category','something like that'),
			('Fifth category','I do not know')

INSERT INTO Movies 
			(Title, DirectorId, CopyrightYear, [Length], GenreId, Rating, Notes) 
VALUES		('First Title', 1, '1999', 100, 1, 5, 'some notes'),
			('Second Title', 2, '2000', 321, 2, 5, 'some notes..'),
			('Third Title', 3, '2002', 205, 3, 5, 'some notes'),
			('Fourth Title', 4, '2015', 985, 4, 5, 'some notes,....'),
			('Fifth Title', 5, '2020', 789, 5, 5, 'some notessss')