-- Create database
CREATE DATABASE amazon;
USE amazon;

-- Products - pid, pname, price, stock, location (Mumbai or Delhi)
CREATE TABLE products (
    pid INT(3) PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    price INT(10) NOT NULL,
    stock INT(5),
    location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

-- Customer - cid, cname, age, addr
CREATE TABLE customer (
    cid INT(3) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    age INT(3),
    addr VARCHAR(50)
);

-- Orders - oid, cid, pid, amt
CREATE TABLE orders (
    oid INT(3) PRIMARY KEY,
    cid INT(3),
    pid INT(3),
    amt INT(10) NOT NULL,
    FOREIGN KEY(cid) REFERENCES customer(cid),
    FOREIGN KEY(pid) REFERENCES products(pid)
);

-- Payment - pay_id, oid, amount, mode (upi, credit, debit), status, timestamp
CREATE TABLE payment (
    pay_id INT(3) PRIMARY KEY,
    oid INT(3),
    amount INT(10) NOT NULL,
    mode VARCHAR(30) CHECK(mode IN('upi', 'credit', 'debit')),
    status VARCHAR(30),
    timestamp TIMESTAMP,
    FOREIGN KEY(oid) REFERENCES orders(oid)
);

-- Inserting values into products table
INSERT INTO products VALUES (1, 'HP Laptop', 50000, 15, 'Mumbai');
INSERT INTO products VALUES (2, 'Realme Mobile', 20000, 30, 'Delhi');
INSERT INTO products VALUES (3, 'Boat Earpods', 3000, 50, 'Delhi');
INSERT INTO products VALUES (4, 'Lenovo Laptop', 40000, 15, 'Mumbai');
INSERT INTO products VALUES (5, 'Charger', 1000, 0, 'Mumbai');
INSERT INTO products VALUES (6, 'Mac Book', 78000, 6, 'Delhi');
INSERT INTO products VALUES (7, 'JBL Speaker', 6000, 2, 'Delhi');
INSERT INTO products VALUES (8, 'Asus Laptop', 50000, 15, 'Delhi');

-- Inserting values into customer table
INSERT INTO customer VALUES (101, 'Ravi', 30, 'Mumbai');
INSERT INTO customer VALUES (102, 'Rahul', 25, 'Delhi');
INSERT INTO customer VALUES (103, 'Simran', 32, 'Delhi');
INSERT INTO customer VALUES (104, 'Purvesh', 28, 'Mumbai');
INSERT INTO customer VALUES (105, 'Sanjana', 22, 'Mumbai');

-- Inserting values into orders table
INSERT INTO orders VALUES (10001, 102, 3, 2700);
INSERT INTO orders VALUES (10002, 104, 2, 18000);
INSERT INTO orders VALUES (10003, 105, 5, 900);
INSERT INTO orders VALUES (10004, 101, 1, 46000);

-- Inserting values into payments table
INSERT INTO payment VALUES (1, 10001, 2700, 'upi', 'completed', '2024-05-01 08:00:00');
INSERT INTO payment VALUES (2, 10002, 18000, 'credit', 'completed', '2024-05-01 08:10:00');
INSERT INTO payment VALUES (3, 10003, 900, 'debit', 'in process', '2024-05-01 08:15:00');

-- Questions and solutions

-- SOLUTION 1:
SELECT cname 
FROM customer 
WHERE cid = (
    SELECT cid 
    FROM orders 
    GROUP BY cid 
    ORDER BY SUM(amt) DESC 
    LIMIT 1
);

-- SOLUTION 2:
SELECT cname
FROM customer
WHERE cid IN (
    SELECT DISTINCT cid
    FROM orders
    WHERE pid IN (
        SELECT pid
        FROM products
        WHERE location = (
            SELECT location
            FROM customer
            WHERE cname = 'Rahul'
        )
    )
);

-- SOLUTION 3:
SELECT cname
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN products p ON o.pid = p.pid
    WHERE o.cid = c.cid
    AND p.price > (
        SELECT AVG(price)
        FROM products
        WHERE pid IN (
            SELECT pid
            FROM orders
            WHERE cid = c.cid
        )
    )
);

-- SOLUTION 4:
SELECT c.cname, SUM(o.amt) AS total_amount_spent
FROM customer c
INNER JOIN orders o ON c.cid = o.cid
INNER JOIN products p ON o.pid = p.pid
INNER JOIN (
    SELECT location, AVG(price) AS avg_price
    FROM products
    GROUP BY location
) avg_prices ON p.location = avg_prices.location
WHERE p.price > avg_prices.avg_price
GROUP BY c.cname;

-- SOLUTION 5:
SELECT c.cname, COALESCE(SUM(o.amt), 0) AS total_amount_spent
FROM customer c
LEFT JOIN orders o ON c.cid = o.cid
GROUP BY c.cname;

-- SOLUTION 6:
SELECT c.cid,
       c.cname,
       c.age,
       c.addr,
       CASE 
           WHEN o.oid IS NULL THEN 'No order'
           ELSE o.oid
       END AS order_id,
       CASE 
           WHEN o.oid IS NULL THEN 'No order'
           ELSE p.status
       END AS order_status
FROM customer c
LEFT JOIN orders o ON c.cid = o.cid
LEFT JOIN payment p ON o.oid = p.oid
ORDER BY c.cid;

-- SOLUTION 7:
SELECT pname, price, RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;

-- SOLUTION 8:
SELECT pname, price, DENSE_RANK() OVER (ORDER BY price DESC) AS dense_price_rank
FROM products;

-- SOLUTION 9:
SELECT pname, price, ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num
FROM products;

-- SOLUTION 10:
SELECT pname, price, CUME_DIST() OVER (ORDER BY price) AS cumulative_distribution
FROM products;

-- SOLUTION 11:
SELECT pname, price, LAG(price) OVER (ORDER BY price) AS previous_price
FROM products;

-- SOLUTION 12:
SELECT pname, price, LEAD(price) OVER (ORDER BY price) AS next_price
FROM products;
