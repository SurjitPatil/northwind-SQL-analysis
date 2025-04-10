--Selected product details sorted by price
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;



--Count of products per category
SELECT CategoryID, COUNT(ProductID) AS ProductCount
FROM Products
GROUP BY CategoryID;




-- Used INNER JOIN to match products with their categories
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;




-- Used LEFT JOIN to show all categories even without products
SELECT c.CategoryName, p.ProductName
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
ORDER BY c.CategoryName;




-- Used subquery to find products above average price
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice) FROM Products
);



-- Used AVG and COUNT to analyze pricing per category
SELECT c.CategoryName, AVG(p.UnitPrice) AS AvgPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;





-- Created a view for category-wise product count
CREATE VIEW CategoryProductCount AS
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;


-- Added an index on CategoryID to optimize queries

CREATE INDEX idx_products_categoryid ON Products(CategoryID);



