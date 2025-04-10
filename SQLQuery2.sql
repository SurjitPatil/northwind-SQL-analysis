SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC
-- Total orders by each customer


-- List of orders with customer names (INNER JOIN)
SELECT o.OrderID, c.CompanyName, o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;


-- Customers with more orders than the average
SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS Sub
);




-- Total sales per employee
SELECT e.EmployeeID, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.LastName;





-- View for product sales summary
CREATE VIEW ProductSalesSummary AS
SELECT p.ProductName, SUM(od.Quantity) AS TotalUnitsSold
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;





-- Add index for faster querying on Orders by CustomerID
CREATE INDEX idx_customer_orders ON Orders(CustomerID);








