SELECT SUBSTRING(Email, CHARINDEX('@', Email, 0) + 1, LEN(Email))        AS 
       [Email Provider], 
       COUNT(SUBSTRING(Email, CHARINDEX('@', Email, 0) + 1, LEN(Email))) AS 
       [Number Of Users] 
FROM   Users 
GROUP  BY SUBSTRING(Email, CHARINDEX('@', Email, 0) + 1, LEN(Email)) 
ORDER  BY [Number Of Users] DESC, 
          [Email Provider] 