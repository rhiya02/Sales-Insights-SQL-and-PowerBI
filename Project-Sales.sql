USE sales;
SELECT * FROM salesreport LIMIT 10;
SELECT COUNT(*) FROM salesreport;

SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%e-%b-%y'), '%Y-%m') AS Month, 
    SUM(Amount) AS TotalSales
FROM 
    salesreport
WHERE 
    Date IS NOT NULL
GROUP BY 
    Month
ORDER BY 
    Month;
    
    SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%e-%b-%y'), '%Y') AS Year, 
    SUM(Amount) AS TotalSales
FROM 
    salesreport
WHERE 
    Date IS NOT NULL
GROUP BY 
    Year
ORDER BY 
    Year;
    
    SELECT Category, COUNT(*) AS SalesCount, SUM(Amount) AS TotalRevenue
FROM salesreport
GROUP BY Category
ORDER BY TotalRevenue DESC
LIMIT 5;

SELECT Size, COUNT(*) AS QuantitySold
FROM salesreport
GROUP BY Size
ORDER BY QuantitySold DESC;

SELECT 
    Category, 
    SUM(Qty) AS TotalQuantity 
FROM 
    salesreport
WHERE 
    Qty IS NOT NULL
GROUP BY 
    Category
ORDER BY 
    TotalQuantity DESC; 

SELECT Fulfilment, COUNT(*) AS TotalOrders, AVG(Amount) AS AvgOrderValue
FROM salesreport
GROUP BY Fulfilment
ORDER BY TotalOrders DESC;

SELECT 'ship-state', COUNT(DISTINCT 'Order_ID') AS UniqueOrders, SUM(Amount) AS TotalSales
FROM salesreport
GROUP BY 'ship-state'
ORDER BY TotalSales DESC;

SELECT 'ship-state', 'ship-city', SUM(Amount) AS CitySales
FROM salesreport
GROUP BY 'ship-state', 'ship-city'
ORDER BY CitySales DESC;

SELECT 
    `ship-state` AS Location,
    COUNT(DISTINCT `Order ID`) AS NumberOfOrders,
    SUM(Amount) AS TotalSpent
FROM 
    salesreport
WHERE 
    Amount IS NOT NULL
GROUP BY 
    `ship-state`
ORDER BY 
    TotalSpent DESC;
    
    SELECT 
    CONCAT(`ship-city`, ', ', `ship-state`) AS Location, 
    COUNT(`Order ID`) AS NumberOfOrders,
    SUM(Amount) AS TotalSpent,
    CASE 
        WHEN SUM(Amount) > 100000 THEN 'High Value'
        WHEN SUM(Amount) BETWEEN 10000 AND 100000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS CustomerSegment
FROM 
    salesreport
WHERE 
    Amount IS NOT NULL
GROUP BY 
    Location
ORDER BY 
    TotalSpent DESC;

SELECT 
    `ship-state` AS State,
    `ship-city` AS City,
    COUNT(`Order ID`) AS NumberOfOrders,          
    SUM(Amount) AS TotalSales                     
FROM 
    salesreport
WHERE 
    Amount IS NOT NULL                            
GROUP BY 
    `ship-state`, `ship-city`                    
ORDER BY 
    `ship-state`, TotalSales DESC;               
















