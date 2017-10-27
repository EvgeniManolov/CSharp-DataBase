SELECT i.Name     AS [Name], 
       i.Price    AS [Price], 
       i.MinLevel AS [MinLevel], 
       s.Strength AS [Strength], 
       s.Defence  AS [Defence], 
       s.Speed    AS [Speed], 
       s.Luck     AS [Luck], 
       s.Mind     AS [Mind] 
FROM   Items AS i 
       JOIN [Statistics] AS s 
         ON s.Id = i.StatisticId 
WHERE  s.Mind > (SELECT AVG(s.Mind) 
                 FROM   [Statistics] AS s) 
       AND s.Luck > (SELECT AVG(s.Luck) 
                     FROM   [Statistics] AS s) 
       AND s.Speed > (SELECT AVG(s.Speed) 
                      FROM   [Statistics] AS s) 
ORDER  BY i.Name 