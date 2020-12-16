/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "Week 5 Homework"
Topic Covered: Selected Single-Row Function
Description: My code for the homework due on Week 5 - based on content from week 4

*/

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
