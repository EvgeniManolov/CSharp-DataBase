SELECT g.Name     AS [Game], 
       gt.Name    AS [GameType], 
       u.Username AS [UserName], 
       ug.Level   AS [Level], 
       ug.Cash    AS [Cash], 
       c.Name     AS [Character] 
FROM   Games AS g 
       JOIN GameTypes AS gt 
         ON gt.Id = g.GameTypeId 
       JOIN UsersGames AS ug 
         ON ug.GameId = g.Id 
       JOIN Users AS u 
         ON u.Id = ug.UserId 
       JOIN Characters AS c 
         ON c.Id = ug.CharacterId 
ORDER  BY Level DESC, 
          UserName, 
          Game 