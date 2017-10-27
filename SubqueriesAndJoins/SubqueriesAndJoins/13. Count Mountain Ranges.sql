SELECT c.CountryCode, 
       COUNT(m.MountainRange) AS [MountainRanges] 
FROM   Countries AS c 
       JOIN MountainsCountries AS mc 
         ON c.CountryCode = mc.CountryCode 
       JOIN Mountains AS m 
         ON m.Id = mc.MountainId 
WHERE  c.CountryCode IN ( 'US', 'RU', 'BG' ) 
GROUP  BY c.CountryCode 