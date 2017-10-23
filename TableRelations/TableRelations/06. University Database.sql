CREATE TABLE Majors 
  ( 
     MajorId INT PRIMARY KEY, 
     [Name]  VARCHAR(50) NOT NULL 
  ) 

CREATE TABLE Students 
  ( 
     StudentId     INT PRIMARY KEY, 
     StudentNumber VARCHAR(50) NOT NULL, 
     StudentName   VARCHAR(50) NOT NULL, 
     MajorId       INT FOREIGN KEY REFERENCES Majors(MajorId) 
  ) 

CREATE TABLE Payments 
  ( 
     PaymentId     INT PRIMARY KEY, 
     PaymentDate   DATE NOT NULL, 
     PaymentAmount DECIMAL (15, 2) NOT NULL, 
     StudentId     INT FOREIGN KEY REFERENCES Students(StudentId) 
  ) 

CREATE TABLE Subjects 
  ( 
     SubjectId   INT PRIMARY KEY, 
     SubjectName VARCHAR(50) NOT NULL 
  ) 

CREATE TABLE Agenda 
  ( 
     StudentId INT, 
     SubjectId INT, 
     CONSTRAINT PK_Agenda PRIMARY KEY (StudentId, SubjectId), 
     CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentId) REFERENCES Students( 
     StudentId), 
     CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectId) REFERENCES Subjects( 
     SubjectId) 
  ) 