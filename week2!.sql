use ap;

select sum(invoice_total) as Total from
(select vendor_id,vendor_name,invoice_id,invoice_total
from invoices join vendors using(vendor_Id)) tmp;

select invoice_id,invoice_date,invoice_total
from invoices
where invoice_total>(select avg(invoice_total)from invoices);

select invoice_id,invoice_date,invoice_total
from invoices
where invoice_id not in (select invoice_id from invoices where invoice_total > 1000);

use w3schools;
select avg(OrderTotal) AvgOrder from
(select orderID, OrderDate, sum(Quantity* Price) as OrderTotal
from orders
join order_details using (OrderID)
join products using(ProductID)
group by OrderID)tmp;

select orderID, OrderDate, sum(Quantity* Price) as OrderTotal
from orders
join order_details using (OrderID)
join products using(ProductID)
group by OrderID
having OrderTotal > (select avg(OrderTotal) AvgOrder from
(select orderID, OrderDate, sum(Quantity* Price) as OrderTotal
from orders
join order_details using (OrderID)
join products using(ProductID)
group by OrderID)tmp);

/report to boss/
select sum(OrderTotal), avg(OrderTotal)

use w3schools;
select orderID,orderDate
from orders
join order_details using(OrderID)
where date_format(orderDate,'%m')='11';

use w3schools;
select shipperID,shipperName,orderDate
from orders
join shippers using(shipperID)
where date_format(orderDate,'%m')='11';

use w3schools;
select EmployeeID,LastName,FirstName,sum(Quantity*Unit) as total_sale
from orders
join employees using (EmployeeID)
join order_details using(orderID)
join products using (ProductID)
group by EmployeeID
order by total_sale desc
limit 10;

use w3schools;
select OrderID, OrderDate, (SELECT SupplierName FROM suppliers
WHERE SupplierName IN ('Tokyo Traders')) FROM orders;

