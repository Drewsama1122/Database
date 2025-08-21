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
