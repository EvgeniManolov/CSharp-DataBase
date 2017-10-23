SELECT TownId, 
       [Name] 
FROM   Towns 
WHERE  LEFT([Name], 1) LIKE '[^rbd]' 
-- we can use and NOT LIKE (without ^ in brackets) -- 
ORDER  BY [Name] 