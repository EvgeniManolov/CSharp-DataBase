UPDATE Countries 
SET    CountryName = 'Burma' 
WHERE  CountryName = 'Myanmar' 

INSERT [dbo].[Monasteries]
		([Name], CountryCode)
VALUES	('Hanga Abbey', (SELECT CountryCode FROM Countries WHERE CountryName = 'Tanzania')),
		('Myin-Tin-Daik', (SELECT CountryCode FROM Countries WHERE CountryName = 'Myanmar'))

SELECT co.ContinentName, 
       c.CountryName, 
       COUNT(mo.Id) AS [MonasteriesCount] 
FROM   Continents AS co 
       INNER JOIN Countries AS c 
               ON c.ContinentCode = co.ContinentCode 
       LEFT JOIN Monasteries AS mo 
              ON mo.CountryCode = c.CountryCode 
WHERE  c.IsDeleted = 0 
GROUP  BY co.ContinentName, 
          c.CountryName 
ORDER  BY MonasteriesCount DESC, 
          c.CountryName 