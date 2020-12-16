/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "Week 2 Homework"
Topics Covered: 
	- 1A - Basic SQL Statements
	- 1B - Restricting Rows and Sorting Data
Description: My code for the homework due on Week 2 - based on content from week 1

*/

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
-- 6
