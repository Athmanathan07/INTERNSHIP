-- DELIMITER COMMAND:

-- Changing the delimiter to //:
DELIMITER //
CREATE PROCEDURE procedure_name()
BEGIN
    SQL statements
END //
DELIMITER ;

-- Resetting the delimiter:
DELIMITER ;

-- PROCEDURES:

-- Procedure to select all products 
DELIMITER //
CREATE PROCEDURE select_all_products()
BEGIN
    SELECT * FROM products;
END //
DELIMITER ;

-- Calling the select_all_products procedure
CALL select_all_products();

-- Dropping select_all_products
DROP PROCEDURE select_all_products;

-- FUNCTIONS:

-- Function to calculate total revenue for a product
DELIMITER //
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC 
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.oid = o.oid
    WHERE p.status = 'completed';
    RETURN total_revenue;
END //
DELIMITER ;

-- Calling the function
SELECT get_total_revenue();

-- Dropping the function
DROP FUNCTION IF EXISTS get_total_revenue;

-- IN:

-- Creating procedure with IN
DELIMITER //
CREATE PROCEDURE get_product_details(IN product_id INT)
BEGIN
    SELECT * FROM products WHERE pid = product_id;
END //
DELIMITER ;

-- Calling Procedure
CALL get_product_details(1);

-- OUT:

-- Create the procedure to get product count using OUT
DELIMITER //
CREATE PROCEDURE get_product_count(OUT product_count INT)
BEGIN
    SELECT COUNT(*) INTO product_count FROM products;
END //
DELIMITER ;

-- Calling the OUT Procedure
CALL get_product_count(@product_count);
SELECT @product_count as product_count;

-- CURSOR:

-- User-Defined Cursors:
DELIMITER //
CREATE PROCEDURE count_customers()
BEGIN
    DECLARE customer_count INT;
    SELECT COUNT(*) INTO customer_count FROM customer;
    SELECT customer_count AS 'Number of customers';
END //
DELIMITER ;

-- Pre-defined Cursors:
DELIMITER //
CREATE PROCEDURE calc_total_hp_laptop_price()
BEGIN
    DECLARE total_price DECIMAL(10,2);
    SELECT SUM(price) INTO total_price
    FROM products
    WHERE pname = 'HP Laptop';
    SELECT total_price AS 'Total price of all HP Laptops';
END //
DELIMITER ;

-- PRACTICE QUESTIONS:

-- 1. PROCEDURES

-- Ques 1.
DELIMITER //
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.order_id = o.order_id
    WHERE o.status = 'Completed';
    RETURN total_revenue;
END //
DELIMITER ;

SELECT get_total_revenue();

-- Ques 2.
DELIMITER //
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.order_id = o.order_id
    WHERE o.status = 'Completed';
    RETURN total_revenue;
END //
DELIMITER ;

SELECT get_total_revenue();

-- Ques 3.
DELIMITER //
CREATE PROCEDURE get_product_details(IN product_id INT)
BEGIN
    SELECT * FROM products WHERE product_id = product_id;
END //
DELIMITER ;

CALL get_product_details(5);

-- Ques 4.
DELIMITER //
CREATE PROCEDURE get_product_count(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM products;
END //
DELIMITER ;

CALL get_product_count(@count);
SELECT @count AS total_products;

-- Ques 5.
DELIMITER //
CREATE PROCEDURE calc_total_electronics_price(OUT total_price DECIMAL(10,2))
BEGIN
    SELECT SUM(price) INTO total_price
    FROM products
    WHERE category = 'Electronics';
END //
DELIMITER ;

CALL calc_total_electronics_price(@total);
SELECT @total AS total_electronics_price;

-- Ques 6.
DELIMITER //
CREATE PROCEDURE print_product_names()
BEGIN
    DECLARE product_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN product_cursor;

    get_names: LOOP
        FETCH product_cursor INTO product_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT product_name;
    END LOOP get_names;

    CLOSE product_cursor;
END //
DELIMITER ;
