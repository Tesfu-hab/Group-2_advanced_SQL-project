--Q1. Sales Performance Analysis:
--1a. Generate a report showcasing the total sales amount for each product category over the past three years. 
	--Include a trend analysis to identify any significant changes in sales volume.
SELECT 
    YEAR(soh.OrderDate) AS OrderYear,
    pc.Name AS ProductCategory,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE 
    soh.OrderDate >= DATEADD(year, -3, GETDATE())  -- Sales data for the past three years
GROUP BY 
    YEAR(soh.OrderDate),
    pc.Name
ORDER BY 
    OrderYear DESC,
    TotalSalesAmount DESC;


--1b. Write SQL queries to retrieve sales data from the AdventureWorks database, grouping by product category 
	--and aggregating sales amounts over time.
	SELECT 
    pc.Name AS ProductCategory,
    YEAR(soh.OrderDate) AS OrderYear,
    MONTH(soh.OrderDate) AS OrderMonth,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM 
    Sales.SalesOrderHeader soh
INNER JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY 
    pc.Name, YEAR(soh.OrderDate),MONTH(soh.OrderDate)
ORDER BY 
    pc.Name, YEAR(soh.OrderDate),MONTH(soh.OrderDate);

