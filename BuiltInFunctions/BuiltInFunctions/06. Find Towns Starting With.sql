SELECT TownId, 
       [Name] 
FROM   Towns 
WHERE  LEFT([Name], 1) LIKE '[mkbe]' 
ORDER  BY [Name] 