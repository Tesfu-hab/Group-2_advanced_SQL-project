--Q2. Customer Segmentation:
--2a. Segment customers based on their purchase behavior and demographics. Use SQL to extract relevant customer 
	--data such as age, gender, purchase frequency, and total spend.

-----There is no age column



--2b. Write SQL queries to join customer data tables and calculate metrics like purchase frequency and total spend for each customer.
 SELECT 
    c.CustomerID,
    COUNT(soh.SalesOrderID) AS PurchaseFrequency ,
    SUM(soh.TotalDue) AS TotalSpend
FROM 
    Sales.Customer c
INNER JOIN 
    Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    c.CustomerID
ORDER BY 
    c.CustomerID;