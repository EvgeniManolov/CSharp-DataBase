SELECT          c.CountryName           AS [CountryName], 
                cont.ContinentName      AS [ContinentName], 
                ISNULL(COUNT(r.Id),0)   AS [RiversCount], 
                ISNULL(SUM(r.Length),0) AS [TotalLength] 
FROM            Countries               AS c 
LEFT OUTER JOIN Continents              AS cont 
ON              cont.ContinentCode = c.ContinentCode 
LEFT JOIN       CountriesRivers AS cr 
ON              cr.CountryCode = c.CountryCode 
LEFT JOIN       Rivers AS r 
ON              r.Id = cr.RiverId 
GROUP BY        c.CountryName, 
                cont.ContinentName 
ORDER BY        RiversCount DESC, 
                TotalLength DESC, 
                CountryName 