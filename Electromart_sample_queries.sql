-- Sample queries used for testing the database

-- 1. Here we ask which user is attached to the orders.
SELECT o.ID as orderID, u.firstName, u.lastName, o.status
FROM orders o
JOIN users u ON o.userID = u.userID;

-- 2. This shows which user and order is marked as delivered.
SELECT o.ID as orderID, u.firstName, u.lastName, o.status
FROM orders o
JOIN users u ON o.userID = u.userID
WHERE o.status = 'delivered';

-- 3. Which products were ordered, the brand name and also the quantity.
SELECT o.ID as orderID, p.name as productName, oI.quantity, b.name as brandName
FROM orders o
JOIN orderItem oI ON o.ID = oI.orderID
JOIN product p ON oI.productID = p.ID
JOIN brand b ON p.brandid = b.ID;

-- 4. Payment and order status + the payment method used.
SELECT pay.ID as paymentID, o.ID as orderID, method, pay.status as 'payment status', 
o.status as 'order status'
FROM payment pay
JOIN orders o ON pay.orderID = o.ID;

-- 5. The total number of orders and the amount spent totally per user.
SELECT u.userID as userID, u.firstName, u.lastName, 
COUNT(o.ID) as 'Number of orders', 
SUM(o.totalAmount) as 'Total amount spent'
FROM users u
JOIN orders o ON o.userID = u.userID
GROUP BY u.userID;

-- 6. Details about the proctuct; name, quantity, brand and category.
SELECT p.ID as productID, p.name as 'Product name', price, p.stockQuantity as 'Stock Quantity', 
b.name as Brand, c.name as Category
FROM product p
JOIN brand b ON b.ID = p.brandID
JOIN category c ON c.ID = p.categoryID;

-- 7. Products that are priced more than 10 000 kr.
SELECT p.name as Name, price as Price, p.description as Description, b.name as Brand
FROM product p
JOIN brand b ON b.ID = p.brandID
WHERE price > 10000;
