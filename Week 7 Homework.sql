/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "Week 7 Homework"
Topic Covered: Joining Data from Multiple Tables
Description: My code for the homework due on Week 7 - based on content from week 5

*/

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

SELECT * 
FROM zjlb_promotion;

SELECT * 
FROM zjlb_books;

SELECT * 
FROM zjlb_publisher;

SELECT isbn, (retail-cost) as profit from zjlb_books;

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
-- Query to help show the projected costs of this year‘s sales promotion (Advanced Challenge)

SELECT * 
FROM zjlb_books;

SELECT * 
FROM zjlb_orders;

SELECT * 
FROM zjlb_orderitems;

SELECT isbn FROM zjlb_books
MINUS
SELECT DISTINCT isbn FROM zjlb_orders o INNER JOIN
zjlb_orderitems oi ON o.order# = oi.order#;

SELECT isbn FROM zjlb_books
MINUS
SELECT DISTINCT isbn FROM
zjlb_orderitems oi;
-- Query to show the books that didn't sell (Advanced Challenge)

