-- Tasks 2: Select, Where, Between, AND, LIKE:

-- 1. Write an SQL query to retrieve the names and emails of all customers.
select firstname,lastname,email from customers;

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer
-- names.
select* from customers;
select customers.firstname,customers.lastname,orders.orderid,orders.orderdate
from orders
inner join customers on orders.customerid=customers.customerid;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. Include
-- customer information such as name, email, and address.
insert into customers(firstname,lastname,email,address)
values("lohitha","L","lohi@gmail.com","987 street");


-- 4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
-- increasing them by 10%.
update products set price=price+(price*0.10);
set sql_safe_updates=0;

-- 5. Write an SQL query to delete a specific order and its associated order details from the
-- "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
select* from orders,orderdetails;
delimiter //
create procedure get_user_input1(in order_id int)
begin
delete from orderdetails where orderid=order_id ;
delete from orders where orderid=order_id ;
end //

call get_user_input1(1);

-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
-- order date, and any other necessary information.
insert into orders
values(11,3,now(),2000);
-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific
-- customer in the "Customers" table. Allow users to input the customer ID and new contact
-- information.
delimiter //
create procedure input(in cus_id int, fname text,lname text,email varchar(255),phone bigint , address varchar(255))
begin
update customers
set customerid=cus_id,firstname=fname,lastname=lname,email=email,phone =phone,address=address
where customerid=cus_id;
end //

call input(1,"suku","mari","suku@gmail.com",923242223,"345 tkstreet");

-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
-- table based on the prices and quantities in the "OrderDetails" table.
UPDATE orders o
JOIN (
    SELECT od.OrderID, SUM(od.Quantity * p.Price) AS TotalAmount
    FROM OrderDetails od
    JOIN products p ON od.ProductID = p.ProductID
    GROUP BY od.OrderID
) AS subquery
ON o.OrderID = subquery.OrderID
SET o.TotalAmount = subquery.TotalAmount;

-- 9. Write an SQL query to delete all orders and their associated order details for a specific
-- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
-- as a parameter.
DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 123);

DELETE FROM Orders 
WHERE CustomerID = 123;
DELIMITER //

CREATE PROCEDURE DeleteCustomerOrders(IN cust_id INT)
BEGIN
    -- Delete order details first to avoid foreign key constraint issues
    DELETE FROM OrderDetails 
    WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = cust_id);

    -- Delete orders for the customer
    DELETE FROM Orders 
    WHERE CustomerID = cust_id;
END //

DELIMITER ;
CALL DeleteCustomerOrders(4);

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
-- including product name, category, price, and any other relevant details.
insert into products
values(11,"iphone","its a brand",110000);

-- 11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table orders 
add status text;
insert into orders(status)
values("pending"),("shipped"),
("pending"),("shipped"),
("pending"),("shipped"),
("pending"),("shipped"),
("pending"),("shipped");

DELIMITER //

CREATE PROCEDURE UpdateOrderStatus1(IN orderid INT, IN new_status VARCHAR(255))
BEGIN
    UPDATE Orders
    SET status = new_status
    WHERE OrderID = orderid;
END //

DELIMITER ;
CALL UpdateOrderStatus1(4, "Shipped");

set sql_safe_updates=0;

-- 12. Write an SQL query to calculate and update the number of orders placed by each customer
-- in the "Customers" table based on the data in the "Orders" table.
ALTER TABLE Customers ADD COLUMN OrderCount INT DEFAULT 0;
UPDATE Customers c
SET c.OrderCount = (
    SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID
);
select* from customers;
