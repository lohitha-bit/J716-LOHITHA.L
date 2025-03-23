create database TechShop;
USE techshop;
CREATE TABLE Customers
(
CustomerID int auto_increment Primary Key,
FirstName text NOT NULL,
LastName text,
Email VARCHAR(100) unique,
Phone bigint unique,
Address text);
DESC Customers;
SHOW VARIABLES LIKE 'foreign_key_checks';
create table products(
ProductID int auto_increment Primary Key,
ProductName varchar(100) not null,
Description text,
Price int);
alter table products modify price decimal(10,2) not null;
create table orders(
OrderID int auto_increment Primary Key,
CustomerID int,
foreign Key (CustomerID) references Customers(CustomerID),
OrderDate date,
TotalAmount bigint);
alter table orders modify orderdate datetime default current_timestamp;
create table OrderDetails(
OrderDetailID int auto_increment Primary Key,
foreign Key (OrderID) references orders(OrderID),
foreign Key (ProductID) references products(ProductID),
OrderID int,
ProductID int,
Quantity int);
create table inventory(
InventoryID int auto_increment Primary Key,
foreign Key (ProductID) references products(ProductID),
ProductID int,
QuantityInStock int default null,
LastStockUpdate int);
alter table inventory modify QuantityInStock int default 0 check(QuantityInStock>=0);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', 9876543210, '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', 8765432109, '456 Oak Ave'),
('Alice', 'Brown', 'alice.brown@example.com', 7654321098, '789 Pine Rd'),
('Michael', 'Johnson', 'michael.johnson@example.com', 6543210987, '101 Maple St'),
('Emma', 'Williams', 'emma.williams@example.com', 5432109876, '202 Birch Ln'),
('Robert', 'Jones', 'robert.jones@example.com', 4321098765, '303 Cedar Dr'),
('Sophia', 'Davis', 'sophia.davis@example.com', 3210987654, '404 Elm Blvd'),
('James', 'Miller', 'james.miller@example.com', 2109876543, '505 Spruce Ct'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', 1098765432, '606 Redwood St'),
('William', 'Moore', 'william.moore@example.com', 1987654321, '707 Cherry Rd');

INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop', 'High-end gaming laptop', 1500.00),
('Smartphone', 'Latest model with advanced features', 800.00),
('Headphones', 'Noise-canceling over-ear headphones', 200.00),
('Tablet', 'Lightweight and powerful tablet', 600.00),
('Smartwatch', 'Wearable smart device', 250.00),
('Camera', 'DSLR professional camera', 1200.00),
('Printer', 'Wireless all-in-one printer', 300.00),
('Monitor', '27-inch 4K UHD Monitor', 400.00),
('Keyboard', 'Mechanical gaming keyboard', 150.00),
('Mouse', 'Wireless ergonomic mouse', 100.00);

INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 1700.00),
(2, 800.00),
(3, 1500.00),
(4, 600.00),
(5, 250.00),
(6, 1200.00),
(7, 300.00),
(8, 400.00),
(9, 150.00),
(10, 100.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 1, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

INSERT INTO Inventory (ProductID, QuantityInStock) VALUES
(1, 50),
(2, 30),
(3, 100),
(4, 40),
(5, 60),
(6, 20),
(7, 25),
(8, 35),
(9, 75),
(10, 90);
