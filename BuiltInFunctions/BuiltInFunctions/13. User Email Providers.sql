SELECT Username, 
       STUFF(Email, 1, CHARINDEX('@', Email, 1), '') AS [Email Provider] 
FROM   Users 
ORDER  BY [Email Provider], 
          Username 