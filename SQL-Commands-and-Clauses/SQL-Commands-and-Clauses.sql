create database command1;
use command1;

-- Q1. Create the EMPLOYEE table with the given columns and set emp_id as PRIMARY KEY

create table Employee(
Emp_id int primary key,
ename varchar(50),
department varchar(50),
salary int,
gender varchar(10));


select * from Employee;

-- Q2. Insert 7 rows into EMPLOYEE table

insert into Employee values
(1,"Arav Sharma","HR",55000,"Male"),
(2,"Neha Jadhav","IT",60000,"Female"),
(3,"Rohan Verma","Sales",50000,"Male"),
(4,"Priya Singh","Finance",45000,"Female"),
(5,"Kunal Mehata","Marketing",48000,"Male"),
(6,"Sneha Joshi","Operations",38000,"Female"),
(7,"Aditya Kulkarni","Support",35000,"Male");

select * from Employee;

-- Q3. Create the DEPARTMENT table with dept_id as PRIMARY KEY

create table Department(
Dept_id int primary key,
dept_name varchar(50),
location varchar(50));

-- Q4. Insert 4 rows into DEPARTMENT table

insert into Department values
(101,"HR","Mumbai"),
(102,"IT","Pune"),
(103,"Sales","Chennai"),
(104,"Finance","Benglore");

select * from Department;

-- Q5. Show all employees whose salary is more than 40,000

select Emp_id,ename,salary
from Employee
where salary > 40000;

-- Q6. Show all male employees

select emp_id,ename,gender
from Employee
where gender = "Male";

-- Q7. Display the name and department of all employees

select ename,department 
from Employee;

-- Q8. Sort employee records by salary in descending order

select *
from Employee 
ORDER BY salary DESC;

-- Q9. Show top 3 highest paid employees (use LIMIT)

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;

-- Q10. Count total number of employees in each department(GROUP BY)

SELECT department ,COUNT(*) AS Tot_employees
FROM Employee
GROUP BY Department;

-- Q11. Display departments located in “Mumbai”

SELECT * 
FROM Department
WHERE location = "Mumbai";

-- Q14. Create PRODUCT table with foreign key referencing employee

create table Product(
p_id int primary key,
p_name varchar(50),
price int,
stock_qty int,
created_by_emp int,
FOREIGN KEY (created_by_emp) REFERENCES Employee(emp_id)
);

select * from Product;

INSERT INTO Product VALUES
(201, 'Laptop', 55000, 10, 1),
(202, 'Mobile', 30000, 25, 2),
(203, 'Headphones', 2000, 50, 3),
(204, 'Keyboard', 1500, 40, 4),
(205, 'Mouse', 800, 60, 5),
(206, 'Monitor', 12000, 15, 6),
(207, 'Printer', 9000, 8, 7),
(208, 'Tablet', 25000, 20, 1),
(209, 'Speaker', 3000, 35, 2),
(210, 'Webcam', 1800, 45, 3);

SELECT * FROM  Product;

-- Q12. Show products whose price is greater than 500

SELECT * 
FROM Product 
WHERE price > 500;

-- Q13. Get the product name and price sorted by price in ASC order

SELECT p_name,price
FROM Product
ORDER BY price ASC;

-- Q15. Change column name “stock_qty” to “available_qty”(ALTER)

ALTER TABLE product 
CHANGE stock_qty available_qty INT;

SELECT * FROM Product;

-- Q16. Add new column “discount INT” to PRODUCT table

ALTER TABLE Product
ADD COLUMN discount INT;

SELECT * FROM Product;

-- Q17. Update salary of employee with emp_id = 3 by increasing 5,000

UPDATE Employee
SET salary = salary + 5000
WHERE emp_id = 3;

SELECT * FROM Employee;

-- Q18. Delete product where product_id = 10

DELETE FROM Product
WHERE p_id = 210;

SELECT * FROM Product;

-- Q19. Find the total stock (SUM of stock_qty) of all products

SELECT SUM(available_qty) AS total_stock -- changed stock_qty to available_qty
FROM Product;

-- Q20. Find the average salary of all employees

SELECT AVG(salary) AS avg_salary
FROM Employee;

-- Q21. Insert 12 sales records into SALES table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_amount INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(p_id)
);

SELECT * FROM sales;

INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_amount, sale_date) VALUES
(301, 201, 2, 110000, '2023-12-15'),
(302, 202, 3, 90000, '2023-11-10'),
(303, 203, 5, 10000, '2022-08-05'),
(304, 204, 4, 6000, '2024-01-12'),
(305, 205, 6, 4800, '2024-02-18'),
(306, 206, 2, 24000, '2024-03-22'),
(307, 207, 1, 9000, '2025-01-10'),
(308, 208, 2, 50000, '2025-02-14'),
(309, 209, 3, 9000, '2023-07-19'),
(310, 201, 4, 7200, '2022-05-25'),
(311, 202, 1, 55000, '2024-06-01'),
(312, 203, 2, 60000, '2025-03-08');

SELECT * FROM sales;

-- Q22. Show total quantity sold for each product (GROUP BY)

SELECT product_id, SUM(quantity_sold) AS total_quantity
FROM Sales
GROUP BY product_id;

-- Q23. Get total sales amount per product where total > 1000 (HAVING)

SELECT product_id, SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY product_id
HAVING SUM(sale_amount) > 1000;

-- Q24. Display top 5 sold products (ORDER BY + LIMIT)

SELECT product_id, quantity_sold
FROM sales
ORDER BY quantity_sold DESC
LIMIT 5;

-- Q25. Show employee who created the most number of products

SELECT created_by_emp, COUNT(*) AS total_products
FROM Product
GROUP BY created_by_emp
ORDER BY total_products DESC
LIMIT 1;

-- Q26. Add a NOT NULL constraint to price column in PRODUCT table

ALTER TABLE Product
MODIFY price INT NOT NULL;

SELECT * FROM PRODUCT;

-- Q27. Modify salary column to BIGINT

ALTER TABLE EMPLOYEE
MODIFY salary BIGINT;

-- Q28. Rename table EMPLOYEE to EMP_MASTER

ALTER TABLE EMPLOYEE
RENAME EMPLOYEE_MASTER;

SELECT * FROM EMPLOYEE_MASTER;

-- Q29. Delete all sales done before 2024

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Sales
WHERE sale_date < '2024-01-01';

SELECT * FROM sales;

-- Q30. Show the highest sale amount from SALES table

SELECT sale_amount
FROM sales
ORDER BY sale_amount DESC 
LIMIT 1;

-- Q31. Show price_per_unit (sale_amount / quantity_sold)

SELECT sale_id, product_id, sale_amount, quantity_sold,
(sale_amount / quantity_sold) AS price_per_unit
FROM Sales;

-- Q32. Get employees whose salary is between 40,000 and 80,000

SELECT * 
FROM EMPLOYEE_MASTER
WHERE salary BETWEEN 40000 AND 80000;

