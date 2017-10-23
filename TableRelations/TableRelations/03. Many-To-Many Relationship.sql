CREATE TABLE Students  
  ( 
     StudentId INT PRIMARY KEY IDENTITY NOT NULL, 
     [Name]    VARCHAR(50) NOT NULL 
  ) 


INSERT INTO Students
			([Name]) 
VALUES		('Mila'),
			('Toni'),
			('Ron')


CREATE TABLE Exams 
  ( 
     ExamId INT PRIMARY KEY NOT NULL, 
     [Name] VARCHAR(50) NOT NULL 
  ) 


INSERT INTO Exams 
			(ExamId,[Name]) 
VALUES		(101, 'SpringMVC'),
			(102, 'Neo4j'),
			(103, 'Oracle 11g')

CREATE TABLE studentsexams 
  ( 
     StudentId INT NOT NULL, 
     ExamId    INT NOT NULL, 
     CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentId, ExamId), 
     CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentId) REFERENCES 
     Students(StudentId), 
     CONSTRAINT FK_StudentsExams_Exams  FOREIGN KEY (ExamId) REFERENCES Exams( 
     ExamId) 
  ) 


INSERT INTO StudentsExams 
			(StudentId,ExamId) 
VALUES		(1,101),
			(1,102),
			(2,101),
			(3,103),
			(2,102),
			(2,103)