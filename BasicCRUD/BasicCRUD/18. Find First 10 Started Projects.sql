SELECT TOP 10 * 
FROM   Projects 
WHERE  EndDate  IS NOT NULL 
ORDER  BY StartDate, 
          [Name] 