SELECT con.ContinentName                   AS [ContinentName], 
       SUM(CAST(cou.AreaInSqKm AS BIGINT)) AS [CountriesArea], 
       SUM(CAST(cou.Population AS BIGINT)) AS [CountriesPopulation] 
FROM   Continents AS con 
       JOIN Countries AS cou 
         ON cou.ContinentCode = con.ContinentCode 
GROUP  BY con.ContinentName 
ORDER  BY CountriesPopulation DESC 