-- Find customers who have not placed any orders  
SELECT FirstName, LastName, Email  
FROM Customers  
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);  

-- Get the total count of products available in inventory  
SELECT COUNT(ProductID) AS TotalProductsAvailable  
FROM Products;  

-- Calculate the total revenue generated by the store  
SELECT SUM(TotalAmount) AS TotalEarnings  
FROM Orders;  

-- Calculate the average quantity ordered for a specific category (Dynamic Input)  
DELIMITER //  
CREATE PROCEDURE AvgQuantityByCategory1(IN categoryName VARCHAR(100))  
BEGIN  
    SELECT AVG(od.Quantity) AS AvgQtyPerCategory  
    FROM OrderDetails od  
    JOIN Products p ON od.ProductID = p.ProductID  
    WHERE p.productname =categoryName;  
END //  
DELIMITER ;  
CALL AvgQuantityByCategory1('Smartphones');  

-- Calculate the total amount spent by a specific customer (Dynamic Input)  
DELIMITER //  
CREATE PROCEDURE TotalSpentByCustomer(IN customerID INT)  
BEGIN  
    SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent  
    FROM Customers c  
    JOIN Orders o ON c.CustomerID = o.CustomerID  
    WHERE c.CustomerID = customerID  
    GROUP BY c.CustomerID;  
END //  
DELIMITER ;  

CALL TotalSpentByCustomer(2);  

-- Find customers who placed the highest number of orders  
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
GROUP BY c.CustomerID  
ORDER BY TotalOrders DESC  
LIMIT 1;  

-- Find the most ordered product category  
SELECT p.Description AS Category, SUM(od.Quantity) AS TotalQuantityOrdered  
FROM OrderDetails od  
JOIN Products p ON od.ProductID = p.ProductID  
GROUP BY p.Description  
ORDER BY TotalQuantityOrdered DESC  
LIMIT 1;  

-- Find the top customer who spent the most money  
SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
GROUP BY c.CustomerID  
ORDER BY TotalSpent DESC  
LIMIT 1;  

-- Calculate the average order value across all orders  
SELECT AVG(TotalAmount) AS AverageOrderValue  
FROM Orders;  

-- Count the number of orders placed by each customer  
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount  
FROM Customers c  
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID  
GROUP BY c.CustomerID;  
