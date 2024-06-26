CREATE DATABASE amazon;

USE amazon;

CREATE TABLE products (
    pid INT(3) PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    price INT(10) NOT NULL,
    stock INT(5),
    location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

CREATE TABLE customer (
    cid INT(3) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    age INT(3),
    addr VARCHAR(50)
);

CREATE TABLE orders (
    oid INT(3) PRIMARY KEY,
    cid INT(3),
    pid INT(3),
    amt INT(10) NOT NULL,
    FOREIGN KEY(cid) REFERENCES customer(cid),
    FOREIGN KEY(pid) REFERENCES products(pid)
);

CREATE TABLE payment (
    pay_id INT(3) PRIMARY KEY,
    oid INT(3),
    amount INT(10) NOT NULL,
    mode VARCHAR(30) CHECK(mode IN('upi', 'credit', 'debit')),
    status VARCHAR(30),
    FOREIGN KEY(oid) REFERENCES orders(oid)
);

CREATE TABLE employee (
    eid INT(4) PRIMARY KEY,
    ename VARCHAR(40) NOT NULL,
    phone_no INT(10) NOT NULL,
    department VARCHAR(40) NOT NULL,
    manager_id INT(4)
);

INSERT INTO products VALUES (1, 'HP Laptop', 50000, 15, 'Mumbai');
INSERT INTO products VALUES (2, 'Realme Mobile', 20000, 30, 'Delhi');
INSERT INTO products VALUES (3, 'Boat earpods', 3000, 50, 'Delhi');
INSERT INTO products VALUES (4, 'Levono Laptop', 40000, 15, 'Mumbai');
INSERT INTO products VALUES (5, 'Charger', 1000, 0, 'Mumbai');
INSERT INTO products VALUES (6, 'Mac Book', 78000, 6, 'Delhi');
INSERT INTO products VALUES (7, 'JBL speaker', 6000, 2, 'Delhi');

INSERT INTO customer VALUES (101, 'Ravi', 30, 'fdslfjl');
INSERT INTO customer VALUES (102, 'Rahul', 25, 'fdslfjl');
INSERT INTO customer VALUES (103, 'Simran', 32, 'fdslfjl');
INSERT INTO customer VALUES (104, 'Purvesh', 28, 'fdslfjl');
INSERT INTO customer VALUES (105, 'Sanjana', 22, 'fdslfjl');

INSERT INTO orders VALUES (10001, 102, 3, 2700);
INSERT INTO orders VALUES (10002, 104, 2, 18000);
INSERT INTO orders VALUES (10003, 105, 5, 900);
INSERT INTO orders VALUES (10004, 101, 1, 46000);

INSERT INTO payment VALUES (1, 10001, 2700, 'upi', 'completed');
INSERT INTO payment VALUES (2, 10002, 18000, 'credit', 'completed');
INSERT INTO payment VALUES (3, 10003, 900, 'debit', 'in process');

INSERT INTO employee VALUES (401, 'Rohan', 364832549, 'Analysis', 404);
INSERT INTO employee VALUES (402, 'Rahul', 782654123, 'Delivery', 406);
INSERT INTO employee VALUES (403, 'Shyam', 856471235, 'Delivery', 402);
INSERT INTO employee VALUES (404, 'Neha', 724863287, 'Sales', 402);
INSERT INTO employee VALUES (405, 'Sanjana', 125478954, 'HR', 404);
INSERT INTO employee VALUES (406, 'Sanjay', 956478535, 'Tech', NULL);

SELECT * FROM products;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM payment;
SELECT * FROM employee;

-- Inner Join
SELECT customer.cid, cname, orders.oid 
FROM orders 
INNER JOIN customer ON orders.cid = customer.cid;

SELECT customer.cid, cname, products.pid, pname, oid 
FROM orders
INNER JOIN products ON orders.pid = products.pid
INNER JOIN customer ON orders.cid = customer.cid;

-- Left Outer Join
SELECT products.pid, pname, amt, orders.oid 
FROM products
LEFT JOIN orders ON orders.pid = products.pid;

-- Right Outer Join
SELECT * 
FROM payment 
RIGHT JOIN orders ON orders.oid = payment.oid;

-- Full Outer Join
SELECT orders.oid, products.pid, pname, amt, price, stock, location 
FROM orders
LEFT JOIN products ON orders.pid = products.pid
UNION
SELECT orders.oid, products.pid, pname, amt, price, stock, location 
FROM orders
RIGHT JOIN products ON orders.pid = products.pid;

-- Self Join
SELECT e1.ename AS Employee, e2.ename AS Manager 
FROM employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.eid;

-- Cross Join
SELECT customer.cid, cname, orders.oid, amt 
FROM customer
CROSS JOIN orders ON customer.cid = orders.cid
WHERE amt > 3000;

-- Practice Questions

-- Q1. Display details of all orders which were delivered from "Mumbai"
SELECT * 
FROM orders 
LEFT JOIN products ON orders.pid = products.pid
WHERE location = 'Mumbai';

-- Q2. Display details of all orders whose payment was made through "UPI"
SELECT * 
FROM orders
RIGHT JOIN payment ON orders.oid = payment.oid
WHERE mode = 'UPI';

-- Q3. Display oid, amt, cname, payment mode of orders which were made by people below 30 years
SELECT orders.oid, cname, amt, mode 
FROM orders
INNER JOIN payment ON orders.oid = payment.oid
INNER JOIN customer ON orders.cid = customer.cid
WHERE age < 30;

-- Q4. Display oid, amt, cname, payment mode of orders which were made by people below 30 years and payment was made through "Credit"
SELECT orders.oid, cname, amt, mode 
FROM orders
INNER JOIN payment ON orders.oid = payment.oid
INNER JOIN customer ON orders.cid = customer.cid
WHERE age < 30 AND mode = 'Credit';

-- Q5. Display oid, amount, cname, pname, location of the orders whose payment is still pending or in process
SELECT orders.oid, cname, pname, amount, status, location 
FROM orders
CROSS JOIN products ON orders.pid = products.pid
CROSS JOIN customer ON orders.cid = customer.cid
CROSS JOIN payment ON orders.oid = payment.oid
WHERE status IN ('in process', 'pending');

-- Q6. Display order details with product and customer information
SELECT orders.cid, cname, pname 
FROM orders
INNER JOIN customer ON orders.cid = customer.cid
INNER JOIN products ON orders.pid = products.pid;
