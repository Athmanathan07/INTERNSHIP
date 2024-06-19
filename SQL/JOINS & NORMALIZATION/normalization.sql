-- ANOMALIES
-- Undesirable conditions in a database causing data inconsistency.

-- Update Anomaly Example:
UPDATE Products
SET price = 52000
WHERE pid = 1;

-- DELETE ANOMALY Example:
DELETE FROM Products
WHERE pid = 5;

-- INSERTION ANOMALY Example:
INSERT INTO Orders (oid, cid, pid, amt)
VALUES (10005, 106, 2, 1);

-- Candidate Keys:
-- Uniquely identify each tuple in a table (e.g., pid, cid).

-- PRIMARY KEY:
-- Uniquely identifies each record in a table.
CREATE TABLE products (
    pid int(3) PRIMARY KEY,
    pname varchar(50) NOT NULL,
    price int(10) NOT NULL,
    stock int(5),
    location varchar(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

-- FOREIGN KEY:
-- Connects data between tables.
CREATE TABLE orders (
    oid int(3) PRIMARY KEY,
    cid int(3),
    pid int(3),
    amt int(10) NOT NULL,
    FOREIGN KEY (cid) REFERENCES customer(cid),
    FOREIGN KEY (pid) REFERENCES products(pid)
);

-- NORMALIZATION:
-- Process of minimizing redundancy in a database.

-- 1NF Example:
CREATE TABLE products (
    pid int(3) PRIMARY KEY,
    pname varchar(50) NOT NULL,
    price int(10) NOT NULL,
    stock int(5),
    location varchar(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

-- 2NF Example:
CREATE TABLE Order_Items (
    OrderItemID int(3) PRIMARY KEY,
    OrderID int(3),
    ProductID int(3),
    ProductColor varchar(50),
    FOREIGN KEY (OrderID) REFERENCES orders(oid),
    FOREIGN KEY (ProductID) REFERENCES products(pid)
);

-- 3NF Example:
-- Eliminate transitive dependencies.
-- Use existing Customer table for CustomerCity.

-- BCNF Example:
CREATE TABLE order_info (
    oid int(3) PRIMARY KEY,
    amt int(10) NOT NULL,
    FOREIGN KEY (oid) REFERENCES orders(oid)
);

CREATE TABLE order_details (
    oid int(3),
    cid int(3),
    pid int(3),
    PRIMARY KEY (oid, cid, pid),
    FOREIGN KEY (oid) REFERENCES orders(oid),
    FOREIGN KEY (cid) REFERENCES customer(cid),
    FOREIGN KEY (pid) REFERENCES products(pid)
);

-- Queries:
-- Display product information:
SELECT pid, pname, price, stock, location
FROM products;

-- Join Orders and Customer tables:
SELECT o.oid, c.cname, o.pid
FROM orders o
INNER JOIN customer c ON o.cid = c.cid
WHERE o.cid = 102;

-- Normalization Levels:
-- 1NF: No multivalued attributes, primary key present.
-- 2NF: In 1NF, no partial dependency.
-- 3NF: In 2NF, no transitive dependency.
-- BCNF: Every determinant is a candidate key.
