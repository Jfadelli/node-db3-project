-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.CategoryName
from [Product] as p
join [Category] as c 
on p.CategoryId = c.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.CompanyName, o.OrderDate
FROM "Order" AS o
JOIN "Shipper" AS s
ON o.ShipVia = s.Id
WHERE o.OrderDate < DATE("2012-08-09")

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select o.Quantity, p.ProductName
from [OrderDetail] as o
join [Product] as p 
on o.ProductId = p.id
where o.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id, c.CompanyName, e.LastName
from [Order] as o
join [Customer] as c on c.Id = o.CustomerId
join [Employee] as e on e.Id = o.EmployeeId