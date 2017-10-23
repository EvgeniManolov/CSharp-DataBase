SELECT TOP 2 DepositGroup  
FROM   WizzardDeposits 
GROUP  BY DepositGroup  
ORDER  BY Avg(MagicWandSize) 