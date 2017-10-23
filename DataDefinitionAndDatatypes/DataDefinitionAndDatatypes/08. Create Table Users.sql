CREATE TABLE Users 
  ( 
     Id             INT IDENTITY NOT NULL CHECK (Id < 2147483647), 
     Username       NVARCHAR(30) NOT NULL, 
     Password       NVARCHAR(26) NOT NULL, 
     ProfilePicture VARBINARY CHECK (DATALENGTH(ProfilePicture) < 900 * 1024), 
     LastLoginTime  DATE, 
     IsDeleted      BIT 
     CONSTRAINT pk_users PRIMARY KEY (id) 
  ) 

INSERT INTO Users 
		    (Username, Password, ProfilePicture, LastLoginTime, IsDeleted) 
VALUES		('Ivan', 'ivanpetrov', NULL, '11-11-1111', 'false'),
			('Pesho', 'peshopetrov', NULL, '10-10-1110', 'false'),
			('Gosho', 'goshopetrov', NULL, '09-09-1109', 'true'),
			('Petya', 'petyapetrova', NULL, '08-08-1108', 'false'),
			('Ivanka', 'ivankapetrova', NULL, '07-07-1107', 'true')