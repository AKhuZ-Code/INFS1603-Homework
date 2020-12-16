-- Course Code: INFS1603
-- Tutorial Session: T18A (Tuesday 6pm-8pm)
-- File Name: "Week 2 Homework"
-- Author: Jason Khu (z5254974)

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
