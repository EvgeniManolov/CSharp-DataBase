SELECT i.[Name]     AS [Item], 
       i.Price    AS [Price], 
       i.MinLevel AS [MinLevel], 
       gt.[Name]    AS [Forbidden Game Type] 
FROM   Items AS i 
       FULL JOIN GameTypeForbiddenItems AS gtf 
              ON gtf.ItemId = i.Id 
       FULL JOIN GameTypes AS gt 
              ON gt.Id = gtf.GameTypeId 
ORDER  BY [Forbidden Game Type] DESC, 
          Item 