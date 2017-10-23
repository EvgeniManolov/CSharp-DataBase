ALTER TABLE Users 
  DROP CONSTRAINT PK_Users 

ALTER TABLE Users 
  ADD CONSTRAINT PK_Users PRIMARY KEY (Id) 

ALTER TABLE Users 
  ADD CONSTRAINT uc_Users UNIQUE (Username) 

ALTER TABLE Users 
  ADD CONSTRAINT uc_UserNameLength CHECK (LEN(Username) >= 3) 