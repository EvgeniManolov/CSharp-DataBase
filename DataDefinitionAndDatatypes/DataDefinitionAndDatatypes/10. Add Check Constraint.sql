ALTER TABLE Users 
  ADD CONSTRAINT MinLengthOfPassword CHECK (LEN([Password]) > 5 ) 