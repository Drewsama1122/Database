Select *
From Products, Categories
where Products.CategoryID=Categories.CategoryID

select CompanyName, OrderID
from Orders, Shippers
where Shippers.ShipperID = Orders.ShipVia

-- ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่วย ประเทศ
select p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p JOIN Suppliers s on p.SupplierID = s.SupplierID

select p.ProductID, p.ProductName, s.CompanyName, s.Country
from Products p , Suppliers s where p.SupplierID = s.SupplierID

select CompanyName, OrderID
from Orders, Shippers
where Shippers.ShipperID = Orders.ShipVia
AND OrderID = 10275

select CompanyName, OrderID
From Orders join Shippers
on Shippers.ShipperID=Orders.ShipVia
where OrderID=10275

--1.
select e.EmployeeID,FirstName, OrderID
from Employees as e join Orders as o
on e.EmployeeID = o.EmployeeID
order by EmployeeID
--2.
select ProductID, ProductName, City,Country
from Products p join Suppliers s 
on p.SupplierID = s.SupplierID
--3.
select CompanyName, count(*)
from orders as o join Shippers as s on o.ShipVia = s.ShipperID
group by CompanyName
--4.
select p.ProductID,p.ProductName, sum(Quantity) as จำนวนที่ขายได้ทั้งหมด
from products p join [Order Details] od on p.ProductId = od.ProductID
group by p.ProductId,p.ProductName
order by 1

SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O, Customers C, Employees E
WHERE O.CustomerID=C.CustomerID
AND O.EmployeeID=E.EmployeeID

SELECT O.OrderID, C.CompanyName,
E.FirstName, O.ShipAddress
FROM Orders O
join Customers C on O.CustomerID=C.CustomerID
join Employees E on O.EmployeeID=E.EmployeeID

select e.EmployeeID, FirstName , count(*) as [จำนวน order]
, sum(freight) as [Sum of Freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(orderdate) = 1998
group by e.EmployeeID, FirstName
Order by 3

-- ต้องการ ชื่อสิ่งค้าที่ Nancy ขายได้ทั้งหมด เรียงตามลำดับรหัสสินค้า
select distinct p.ProductID,p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by productID

-- ต้องการชื่อบริษัทลูกค้าชื่อ Around the horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
select distinct s.Country
from customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
				 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
-- บริษัทลูกค้าชื่อ Around the Horn ชื่อสินค้าอะไรบ้าง จำนวนเท่าใด sum(Quantity) if ต้องการรวมจำนวน count(*) if ต้องการนับจำนวน
select p.ProductID, p.ProductName, sum(Quantity) as [sum of Quantity]
from customers c join  orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on od.OrderID = o.OrderID
				 join products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
group by p.ProductID,p.ProductName
order by 1
-- ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้นๆ
select o.OrderID, e.FirstName ,
		sum((od.Quantity * od.UnitPrice * (1-od.Discount))) as TotalCash
from orders o join Employees e on o.EmployeeID = e.EmployeeID
			  join [Order Details] od on o.OrderID = od.OrderID
group by o.OrderID, e.FirstName
order by orderID
