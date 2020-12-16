/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "Week 9 Homework"
Topics Covered: 
	- 8A - Data Manipulation
	- 8B - Group Functions
Description: My code for the homework due on Week 9 - based on content from week 8

*/

-- 8A - Data Manipulation

DROP TABLE zjlb_orders_test;

CREATE TABLE zjlb_orders_test 
AS (SELECT * 
FROM zjlb_orders);

INSERT INTO zjlb_orders_test (order#, customer#, orderdate)
VALUES (1021, 1009, '20/Jul/2009');

SELECT * 
FROM zjlb_orders_test;
--1

UPDATE zjlb_orders_test
SET shipzip = 33222
WHERE order# = 1017;

SELECT * 
FROM zjlb_orders_test
WHERE order# = 1017;
--2

INSERT INTO zjlb_orders (order#, customer#, orderdate)
VALUES (1021, 1009, '20/Jul/2009');

UPDATE zjlb_orders
SET shipzip = 33222
WHERE order# = 1017;

COMMIT;
--3

INSERT INTO zjlb_orders (order#, customer#, orderdate)
VALUES (1022, 2000, '06/Aug/2009'); -- violation

SELECT constraint_name, constraint_type 
FROM user_constraints
WHERE constraint_name = 'ORDERS_CUSTOMER#_FK'; -- see constraint description

SELECT *
FROM zjlb_customers 
WHERE customer# = 2000; -- no record found
--4

DELETE 
FROM zjlb_orderitems 
WHERE order# = 1005; -- since we violated FK constraint in orderitems

DELETE 
FROM zjlb_orders 
WHERE order# = 1005;

SELECT * 
FROM zjlb_orders;
--5

-- 8B - Group Functions

SELECT * 
FROM zjlb_books;

SELECT COUNT(*) 
FROM zjlb_books 
WHERE category = 'COOKING';
--1

SELECT COUNT(*) 
FROM zjlb_books 
WHERE retail > 30;
--2

SELECT * 
FROM zjlb_orders o 
INNER JOIN zjlb_orderitems oi
ON o.order# = oi.order#
WHERE customer# = 1017;

SELECT SUM((paideach*quantity)-shipcost) AS total_profit
FROM zjlb_orders o 
INNER JOIN zjlb_orderitems oi
ON o.order# = oi.order#
WHERE customer# = 1017;
--3

SELECT AVG(profit_per_order) as avg_profit_per_order
FROM
    (SELECT SUM(profit_per_entry) AS profit_per_order
    FROM 
        (SELECT o.order#, ((paideach*quantity)-shipcost) AS profit_per_entry
        FROM zjlb_orders o 
        INNER JOIN zjlb_orderitems oi
        ON o.order# = oi.order#)
    GROUP BY order#);
--4

SELECT * 
FROM zjlb_books;

SELECT * 
FROM 
    (SELECT pubid, category, AVG(retail) as average_r
    FROM zjlb_books
    GROUP BY pubid, category) 
WHERE category IN ('CHILDREN', 'COMPUTER') AND average_r > 50;
-- 5

SELECT *
FROM zjlb_orders o 
INNER JOIN zjlb_orderitems oi
ON o.order# = oi.order#;

SELECT o.order#, o.customer#, o.shipstate, SUM(oi.quantity*oi.paideach) AS order_amount
FROM zjlb_orders o 
INNER JOIN zjlb_orderitems oi
ON o.order# = oi.order#
GROUP BY o.order#;

SELECT customer# 
FROM zjlb_orders
WHERE order# IN
    (SELECT order#
    FROM
        (SELECT o.order#, SUM(oi.quantity*oi.paideach) AS order_amount
        FROM zjlb_orders o 
        INNER JOIN zjlb_orderitems oi
        ON o.order# = oi.order#
        GROUP BY o.order#)
    WHERE order_amount > 80)
AND shipstate IN ('FL', 'GA')
ORDER BY customer#;
--6
