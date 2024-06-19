-- 1) Write a query to retrieve the distinct locations of products from the products table.
SELECT DISTINCT location 
FROM products;

-- 2) Write a query to retrieve the customer ID, customer name, and the length of their address as address_length from the customer table.
SELECT cid, cname, LENGTH(addr) AS address_length
FROM customer;

-- 3) Write a query to retrieve the order ID, customer name, product name, and the concatenated string 'Order for [product name] by [customer name]' as order_description from the orders, customer, and products tables.
SELECT o.oid, c.cname, p.pname, CONCAT('Order for ', p.pname, ' by ', c.cname) AS order_description
FROM orders o
JOIN customer c ON o.cid = c.cid
JOIN products p ON o.pid = p.pid;

-- 4) Write a query to retrieve the product ID, product name, price, and a new column price_category that categorizes the products based on their price range (e.g., 'Low' for prices less than 10000, 'Medium' for prices between 10000 and 50000, and 'High' for prices greater than 50000).
SELECT pid, pname, price,
       CASE
           WHEN price < 10000 THEN 'Low'
           WHEN price BETWEEN 10000 AND 50000 THEN 'Medium'
           ELSE 'High'
       END AS price_category
FROM products;

-- 5) Write a query to retrieve the customer ID, customer name, and the total order amount for each customer. The total order amount should be retrieved from a subquery that calculates the sum of order amounts for each customer.
SELECT c.cid, c.cname, (
    SELECT SUM(o.amt)
    FROM orders o
    WHERE o.cid = c.cid
) AS total_order_amount
FROM customer c;
