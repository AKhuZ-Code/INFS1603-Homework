/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "All my INFS1603 code"
Topics Covered: All
Description: All my code for INFS1603's homework component

*/

-- password: 37k942ZB

SELECT * FROM EMPLOYEES;

DESCRIBE EMPLOYEES;

SELECT last_name, first_name --first col last_name second col first_name
FROM employees
ORDER BY 2;
-- q'< >'is basically a quote tag
-- arithmetic operations can be done in the select clause
-- between lower number and higher number
-- anything inside quotes are case sensitive
-- order by 2 is order by 2nd column

-- Week 1 Homework
SELECT *
FROM zjlb_books;
-- 1

SELECT title, pubdate AS "Publication Date"
FROM zjlb_books;
-- 2

SELECT *
FROM ZJLB_Publisher;

SELECT name, CONTACT as "Contact Person", PHONE
FROM zjlb_publisher;
-- 3

SELECT *
FROM zjlb_orders;

SELECT DISTINCT customer#
FROM zjlb_orders;
-- 4

SELECT * 
FROM zjlb_author;

SELECT lname || ', ' || fname
FROM zjlb_author;
-- 5

SELECT * 
FROM zjlb_orderitems;

SELECT order#, item#, isbn, quantity, paideach, quantity * paideach AS "Item Total"
FROM zjlb_orderitems;

SELECT * 
FROM zjlb_customers;

SELECT lastname, firstname, state
FROM zjlb_customers;
-- 1

SELECT * FROM zjlb_books;

SELECT title, category 
FROM zjlb_books
WHERE category <> 'FITNESS';
-- 2

SELECT * from zjlb_orders;

SELECT order#, orderdate
FROM zjlb_orders
WHERE orderdate <= '01/APR/09';

SELECT order#, orderdate
FROM zjlb_orders
WHERE orderdate < '01/APR/09' OR orderdate = '01/APR/09';
-- 3

SELECT * FROM zjlb_customers;

SELECT lastname, referred
FROM zjlb_customers
WHERE referred IS NOT NULL;
-- 4

SELECT * FROM zjlb_books;

SELECT isbn, title
FROM zjlb_books
WHERE title LIKE '_A_N%'
ORDER BY title DESC;
-- 5

SELECT title, pubdate
FROM zjlb_books 
WHERE category = 'COMPUTER' AND pubdate BETWEEN '01/JAN/05' AND '31/DEC/05';

SELECT title, pubdate
FROM zjlb_books 
WHERE category = 'COMPUTER' AND pubdate BETWEEN '01/JAN/05' AND '31/DEC/05';

SELECT title, pubdate
FROM zjlb_books 
WHERE category = 'COMPUTER' AND pubdate LIKE '%/05';
-- 6

-- Week 5 Homework

SELECT INITCAP(firstname), INITCAP(lastname)
FROM zjlb_customers;
-- 1

SELECT customer#,
CASE
    WHEN referred IS NULL THEN 'NOT REFERRED'
    ELSE 'REFERRED'
END AS referral_status
FROM zjlb_customers;
-- 2

SELECT b.title, TO_CHAR((((b.retail - b.cost - NVL(b.discount,0)) * oi.quantity) - o.shipcost), 'L99G999D99MI') AS profit
FROM 
    zjlb_orders o INNER JOIN 
    zjlb_orderitems oi ON o.order# = oi.order# INNER JOIN
    zjlb_books b ON oi.isbn = b.isbn
WHERE o.order# = 1002;

-- 3

SELECT title, pubdate, sysdate, FLOOR(MONTHS_BETWEEN(sysdate, pubdate)) AS age
FROM zjlb_books;
-- 4

SELECT NEXT_DAY(sysdate, 'Wednesday') AS Next_wednesday
FROM dual;
-- 5

-- Week 7 Homework

SELECT * 
FROM zjlb_books;

SELECT * 
FROM zjlb_publisher;

SELECT b.pubid, b.title, p.contact, p.phone
FROM zjlb_books b 
JOIN zjlb_publisher p
ON b.pubid = p.pubid;
--1

SELECT * 
FROM zjlb_orders;

SELECT * 
FROM zjlb_customers;

SELECT * 
FROM zjlb_;

SELECT o.order#, c.customer#, c.lastname, c.firstname, c.state, b.title, b.category
FROM zjlb_customers c
JOIN zjlb_orders o
ON c.customer# = o.customer#
JOIN zjlb_orderitems oi
ON o.order# = oi.order#
JOIN zjlb_books b
ON oi.ISBN = b.ISBN
WHERE c.state = 'FL' AND b.category = 'COMPUTER';
--2

SELECT DISTINCT c.lastname, c.firstname, b.title
FROM zjlb_customers c
JOIN zjlb_orders o
ON c.customer# = o.customer#
JOIN zjlb_orderitems oi
ON o.order# = oi.order#
JOIN zjlb_books b
ON oi.ISBN = b.ISBN
WHERE c.lastname = 'LUCAS' AND c.firstname = 'JAKE';
--3

SELECT c.lastname, c.firstname, o.order#, b.title, oi.quantity, ((oi.paideach*oi.quantity)-b.cost-o.shipcost) AS profit
FROM zjlb_customers c
JOIN zjlb_orders o
ON c.customer# = o.customer#
JOIN zjlb_orderitems oi
ON o.order# = oi.order#
JOIN zjlb_books b
ON oi.ISBN = b.ISBN
WHERE c.lastname = 'LUCAS' AND c.firstname = 'JAKE'
ORDER BY profit DESC;
--4

SELECT *  
FROM zjlb_books;

SELECT *  
FROM zjlb_orderitems;

SELECT b.isbn, b.title, oi.order#, c.state
FROM zjlb_books b
LEFT JOIN zjlb_orderitems oi
ON b.isbn = oi.isbn
LEFT JOIN zjlb_orders o
ON oi.order# = o.order#
LEFT JOIN zjlb_customers c
ON o.customer# = c.customer#
ORDER BY b.title ASC;
--5

SELECT * 
FROM employees;



SELECT
    e1.first_name || ' ' || e1.last_name AS Employee_Full_Name, 
    j.job_title,
    e2.first_name || ' ' || e2.last_name AS Manager_Full_Name
FROM employees e1
LEFT JOIN departments d
ON e1.manager_id = d.manager_id
LEFT JOIN employees e2
ON d.manager_id = e2.employee_id
LEFT JOIN jobs j
ON e1.job_id = j.job_id
ORDER BY Employee_Full_Name;
-- 6

select * from zjlb_promotion;
select * from zjlb_books;
select * from zjlb_publisher;

select isbn, (retail-cost) as profit from zjlb_books;

SELECT b.isbn, (b.retail-b.cost) as profit, p.name,
CASE
WHEN b.retail > 0 AND b.retail <= 12 THEN 'Bookmarker'
WHEN b.retail > 12 AND b.retail <= 25 THEN 'Book Labels'
WHEN b.retail > 25 AND b.retail <= 56 THEN 'Book Cover'
WHEN b.retail > 56 THEN 'Free Shipping'
END AS gift
FROM zjlb_books b
INNER JOIN zjlb_publisher p 
ON b.pubid = p.pubid;
-- gifts

select * from zjlb_books;
select * from zjlb_orders;
select * from zjlb_orderitems;

SELECT isbn FROM zjlb_books
MINUS
SELECT DISTINCT isbn FROM zjlb_orders o INNER JOIN
zjlb_orderitems oi ON o.order# = oi.order#;

SELECT isbn FROM zjlb_books
MINUS
SELECT DISTINCT isbn FROM
zjlb_orderitems oi;
-- Books that dont sell

-- week 8
CREATE TABLE zjlb_category 
(
CatCode VARCHAR2(2),
CatDesc VARCHAR2(10)
);

DESCRIBE zjlb_category;
-- 1

CREATE TABLE zjlb_employees
(
Emp# NUMBER(5,0),
Lastname VARCHAR2(100),
Firstname VARCHAR2(100),
Job_class VARCHAR2(4)
);

DESCRIBE zjlb_employees;
--2

ALTER TABLE zjlb_employees
ADD EmpDate DATE DEFAULT SYSDATE;

ALTER TABLE zjlb_employees
ADD EndDate DATE;

DESCRIBE zjlb_employees;
--3

ALTER TABLE zjlb_employees
MODIFY (Job_class CHAR(2));

DESCRIBE zjlb_employees;
--4

ALTER TABLE zjlb_employees
DROP COLUMN EndDate;

DESCRIBE zjlb_employees;
--5

ALTER TABLE zjlb_employees
RENAME TO jl_emps;

DESCRIBE jl_emps;
--6

CREATE TABLE store_reps 
(
rep_ID NUMBER(5)
    CONSTRAINT rep_id_pk
    PRIMARY KEY,
last VARCHAR2(15),
first VARCHAR2(10), 
comm CHAR(1) DEFAULT 'Y'
); 

DESCRIBE store_reps;
--1

ALTER TABLE store_reps
    MODIFY last NOT NULL;
    
ALTER TABLE store_reps
    MODIFY first NOT NULL;
    
DESCRIBE store_reps;
--2

ALTER TABLE store_reps
    ADD CHECK (comm = 'Y' OR comm = 'N');
    
DESCRIBE store_reps;
--3

ALTER TABLE store_reps
    ADD base_salary NUMBER(7,2)
        CONSTRAINT salary_gt_zero
        CHECK (base_salary>0);
    
DESCRIBE store_reps;
--4

CREATE TABLE book_stores
(
Store_ID NUMBER(8) 
    CONSTRAINT store_id_pk
    PRIMARY KEY,
Name VARCHAR2(30) 
    CONSTRAINT name_cs
    UNIQUE NOT NULL,
Contact VARCHAR2(30),
Rep_ID VARCHAR2(5)
);

DESCRIBE book_stores;
-- 5

ALTER TABLE book_stores
    DROP CONSTRAINT rep_id_valid;
    
ALTER TABLE book_stores
    MODIFY (rep_id NUMBER(5,0));

ALTER TABLE book_stores
    ADD CONSTRAINT rep_id_valid CHECK (rep_id > 0);

DESCRIBE book_stores;
--6

--Week 9

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






