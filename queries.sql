-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName as [Product Name], c.CategoryName as [Category Name]
FROM Product as p
JOIN Category as c
ON p.CategoryId = c.Id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, s.CompanyName
FROM [Order] as o
JOIN Shipper as s
ON o.ShipVia = s.Id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, o.Quantity
FROM Product as p
JOIN OrderDetail as o
ON p.Id = o.ProductId
WHERE o.OrderId = 10251
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id as [Order Id], c.CompanyName as [Customer's Company Name], e.LastName as [Employee's Last Name]
FROM [Order] as o
INNER JOIN Customer as c
ON o.CustomerId = c.Id
INNER JOIN Employee as e
ON o.EmployeeId = e.Id