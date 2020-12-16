/*

Course Code: INFS1603
Teaching Period: 2020 Term 3
Tutorial Session: T18A (Tuesday 6pm-8pm)
Author: Jason Khu (z5254974)

File Name: "Week 8 Homework"
Topic Covered: Table Creation and Management, Constraints
Description: My code for the homework due on Week 8 - based on content from week 7

*/

-- Chapter 3 Assignments

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

-- Chapter 4 Assignments

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
--5

ALTER TABLE book_stores
    DROP CONSTRAINT rep_id_valid;
    
ALTER TABLE book_stores
    MODIFY (rep_id NUMBER(5,0));

ALTER TABLE book_stores
    ADD CONSTRAINT rep_id_valid CHECK (rep_id > 0);

DESCRIBE book_stores;
--6