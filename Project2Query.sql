USE [ContosoRetailDW];
GO
--SET ROWCOUNT 100
SELECT 
 SUM(S.SalesAmount) - SUM(S.ReturnAmount) - SUM(S.DiscountAmount) AS 'Net Revenue'
, SUM(S.SalesQuantity) - SUM(S.ReturnQuantity) AS 'Net Sold Quantity'
, D.CalendarYear AS 'Year'
, P.ProductName AS 'Product Name'
, S.ProductKey AS 'ProductKey'
FROM FactSales AS S 
		INNER JOIN DimDate AS D 
			ON S.DateKey = D.Datekey 
		INNER JOIN DimProduct AS P 
			ON S.ProductKey = P.ProductKey
WHERE D.CalendarYear IN (@prmYear)
GROUP BY D.CalendarYear, P.ProductName, S.ProductKey
--ORDER BY 'Net Revenue' DESC

