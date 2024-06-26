-- Use the amazon database
USE amazon;

-- GROUP BY
-- A) GROUP BY using HAVING
SELECT cname, COUNT(*) AS Number
FROM customer
GROUP BY cname
HAVING COUNT(*) >= 1;

-- B) GROUP BY using CONCAT
-- Group Concat is used in MySQL to get concatenated values of expressions with more than one result per column.
SELECT location, GROUP_CONCAT(DISTINCT pname) AS product_names
FROM products
GROUP BY location;

-- C) GROUP BY can also be used while using aggregate functions like COUNT, MAX, MIN, AVG, SUM, etc.

-- ORDER BY
-- Used for ordering rows in a specific way
-- A) BASIC
-- ORDER BY x
-- x can be any datatype

-- B) ASCENDING
SELECT pid, pname, price
FROM products
ORDER BY price ASC;

-- C) DESCENDING
SELECT cid, cname, age
FROM customer
ORDER BY age DESC;

-- HAVING

-- EXAMPLES
-- A) Find the products with a stock level less than 10.
SELECT pid, pname, stock
FROM products
GROUP BY pid, pname, stock
HAVING stock < 10;

-- B) Find the locations where the total stock of products is greater than 50.
SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location
HAVING SUM(stock) > 50;

-- -----------------------------------------------QUESTIONS-----------------------------------------------------------
-- GROUP BY:
-- 1) Write a query to find the total stock of products for each location.
SELECT location, SUM(stock) AS total_stock 
FROM products 
GROUP BY location;

-- 2) Write a query to find the number of products in each price range (e.g., 0-10000, 10000-20000, 20000-50000, 50000+).
SELECT 
    CASE 
        WHEN price <= 10000 THEN '0-10000' 
        WHEN price <= 20000 THEN '10000-20000'
        WHEN price <= 50000 THEN '20000-50000' 
        ELSE '50000+' 
    END AS price_range, 
    COUNT(*) AS product_count
FROM products 
GROUP BY price_range;

-- 3) Write a query to find the average age of customers grouped by their location (based on the address).
SELECT LEFT(addr, 3) AS location, AVG(age) AS avg_age 
FROM customer 
GROUP BY LEFT(addr, 3);

-- ORDER BY:
-- 1) Write a query to retrieve all products ordered by their price in descending order.
SELECT * 
FROM products 
ORDER BY price DESC;

-- 2) Write a query to retrieve all customers ordered by their age in ascending order.
SELECT * 
FROM customer 
ORDER BY age ASC;

-- 3) Write a query to retrieve all orders ordered by the order amount in descending order
-- and then by the customer name in ascending order.
SELECT o.oid, c.cname, o.amt 
FROM orders o 
JOIN customer c ON o.cid = c.cid 
ORDER BY o.amt DESC, c.cname ASC;

-- HAVING:
-- 1) Write a query to find the locations where the total stock of products is greater than 20.
SELECT location, SUM(stock) AS total_stock 
FROM products 
GROUP BY location 
HAVING SUM(stock) > 20;

-- 2) Write a query to find the customers who have placed orders with a total amount greater than 10000.
SELECT c.cid, c.cname, SUM(o.amt) AS total_amount 
FROM customer c 
JOIN orders o ON c.cid = o.cid 
GROUP BY c.cid, c.cname 
HAVING SUM(o.amt) > 10000;

-- 3) Write a query to find the products that have a stock level between 10 and 20 and are located in Mumbai.
SELECT p.pid, p.pname, p.stock 
FROM products p 
WHERE p.location = 'Mumbai' 
AND p.stock BETWEEN 10 AND 20;
