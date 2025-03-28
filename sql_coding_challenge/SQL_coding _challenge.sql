
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    description TEXT,
    stockQuantity INT NOT NULL CHECK (stockQuantity >= 0)
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    shipping_address TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);
INSERT INTO products (product_id, name, description, price, stockQuantity) VALUES
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', '4K Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);
INSERT INTO customers (customer_id, name, email, password) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123'),
(2, 'Jane Smith', 'janesmith@example.com', 'password123'),
(3, 'Robert Johnson', 'robert@example.com', 'password123'),
(4, 'Sarah Brown', 'sarah@example.com', 'password123'),
(5, 'David Lee', 'david@example.com', 'password123'),
(6, 'Laura Hall', 'laura@example.com', 'password123'),
(7, 'Michael Davis', 'michael@example.com', 'password123'),
(8, 'Emma Wilson', 'emma@example.com', 'password123'),
(9, 'William Taylor', 'william@example.com', 'password123'),
(10, 'Olivia Adams', 'olivia@example.com', 'password123');
INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2023-01-05', 1200.00, '123 Main St, City'),
(2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),
(3, 3, '2023-03-15', 300.00, '789 Oak St, Village'),
(4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
(5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400.00, '567 Birch St, County'),
(7, 7, '2023-07-05', 700.00, '890 Maple St, State'),
(8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'),
(10, 10, '2023-10-20', 1400.00, '765 Fir St, Territory');
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 5, 2),
(5, 4, 4, 4),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 5, 2, 2),
(9, 6, 10, 2),
(10, 6, 9, 3);
INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);
UPDATE customers SET address = '123 Main St, City' WHERE customer_id = 1;
UPDATE customers SET address = '456 Elm St, Town' WHERE customer_id = 2;
UPDATE customers SET address = '789 Oak St, Village' WHERE customer_id = 3;
UPDATE customers SET address = '101 Pine St, Suburb' WHERE customer_id = 4;
UPDATE customers SET address = '234 Cedar St, District' WHERE customer_id = 5;
UPDATE customers SET address = '567 Birch St, County' WHERE customer_id = 6;
UPDATE customers SET address = '890 Maple St, State' WHERE customer_id = 7;
UPDATE customers SET address = '321 Redwood St, Country' WHERE customer_id = 8;
UPDATE customers SET address = '432 Spruce St, Province' WHERE customer_id = 9;
UPDATE customers SET address = '765 Fir St, Territory' WHERE customer_id = 10;

ALTER TABLE order_items ADD COLUMN itemAmount DECIMAL(10,2) NOT NULL;
UPDATE order_items SET itemAmount = 1600.00 WHERE order_item_id = 1;
UPDATE order_items SET itemAmount = 300.00 WHERE order_item_id = 2;
UPDATE order_items SET itemAmount = 1800.00 WHERE order_item_id = 3;
UPDATE order_items SET itemAmount = 1800.00 WHERE order_item_id = 4;
UPDATE order_items SET itemAmount = 600.00 WHERE order_item_id = 5;
UPDATE order_items SET itemAmount = 50.00 WHERE order_item_id = 6;
UPDATE order_items SET itemAmount = 800.00 WHERE order_item_id = 7;
UPDATE order_items SET itemAmount = 1200.00 WHERE order_item_id = 8;
UPDATE order_items SET itemAmount = 240.00 WHERE order_item_id = 9;
UPDATE order_items SET itemAmount = 210.00 WHERE order_item_id = 10;

# 1. Update refrigerator product price to 800.
set sql_safe_updates=0;
update products
set price=800
where name= 'Refrigerator';

#2. Remove all cart items for a specific customer.
delete from cart
where customer_id=3;

#3. Retrieve Products Priced Below $100.
select * from products 
where price<100;

# 4. Find Products with Stock Quantity Greater Than 5.
select * from products 
where stockquantity>5;

#5. Retrieve Orders with Total Amount Between $500 and $1000.
select * from orders
where total_price between 500 and 1000;

#6. Find Products which name end with letter ‘r’.
select * from products
where name like '%r';

#7. Retrieve Cart Items for Customer 5.
select * from cart
where customer_id=5;

#8. Find Customers Who Placed Orders in 2023.
select * from customers
where customer_id in(select customer_id from orders 
where year(order_date)=2023);

#9. Determine the Minimum Stock Quantity for Each Product Category.
select name,MIN(stockQuantity) AS min_stock_quantity
from products
group by name;

#10. Calculate the Total Amount Spent by Each Customer.
select c.customer_id, c.name, SUM(o.total_price) AS total_spent
from customers c
left join orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.name;

#11. Find the Average Order Amount for Each Customer.
select c.customer_id, c.name, AVG(o.total_price) as avg_order_amount
from customers c
left join orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.name;

#12. Count the Number of Orders Placed by Each Customer.
select c.customer_id, c.name, COUNT(o.order_id) AS total_orders
from customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

#13. Find the Maximum Order Amount for Each Customer.
select c.customer_id, c.name, MAX(o.total_price) AS max_order_amount
from customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

#14. Get Customers Who Placed Orders Totaling Over $1000.
select c.customer_id, c.name, SUM(o.total_price) AS total_spent
from customers c
join orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_price) > 1000;

# 15. Subquery to Find Products Not in the Cart.
select * from products
where product_id not in(select product_id from cart);

#16. Subquery to Find Customers Who Haven't Placed Orders.
select * from customers
where customer_id not in(select customer_id from orders);

#17. Subquery to Calculate the Percentage of Total Revenue for a Product.
select p.product_id, p.name, 
       (SUM(oi.quantity * p.price) * 100) / 
       (select SUM(oi.quantity * price) FROM order_items oi JOIN products p ON oi.product_id = p.product_id) 
       AS revenue_percentage
from order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name;


#18. Subquery to Find Products with Low Stock.
select product_id, name, stockQuantity 
from products
WHERE stockQuantity < (SELECT AVG(stockQuantity) FROM products);

#19. Subquery to Find Customers Who Placed High-Value Orders.
select c.customer_id, c.name, SUM(o.total_price) AS total_spent
from customers c
join orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_price) > (SELECT AVG(total_price) FROM orders);

