create database group1;
use group1;

create table sales(
SaleID int primary key,
OrderDate date,
Region VARCHAR(50),
 Country VARCHAR(50),
 Product VARCHAR(50),
 Category VARCHAR(50),
 Saleperson VARCHAR(50),
 Quantity int,
 UnitPrice decimal(10,2),
 Discount decimal(5,2),
Revenue decimal(10,2));

select * from sales;

INSERT INTO sales VALUES
(1,'2024-01-05','Asia','India','Laptop','Electronics','Rahul',5,700,5,3325),
(2,'2024-01-10','Europe','Germany','Chair','Furniture','John',10,120,8,1104),
(3,'2024-01-15','Asia','India','Phone','Electronics','Priya',15,500,10,6750),
(4,'2024-02-02','North America','USA','Table','Furniture','Mike',7,300,5,1995),
(5,'2024-02-05','Asia','Japan','Laptop','Electronics','Amit',8,750,6,5640),
(6,'2024-02-08','Europe','France','Phone','Electronics','Sophia',20,550,7,10230),
(7,'2024-02-12','Asia','India','Desk','Furniture','Rahul',12,250,4,2880),
(8,'2024-02-15','North America','Canada','Laptop','Electronics','Emma',6,800,5,4560),
(9,'2024-02-18','Europe','Germany','Phone','Electronics','John',18,520,9,8517.6),
(10,'2024-02-20','Asia','China','Chair','Furniture','Priya',25,150,3,3637.5),
(11,'2024-02-25','Asia','India','Laptop','Electronics','Rahul',10,720,5,6840),
(12,'2024-03-01','Europe','Italy','Desk','Furniture','Sophia',9,280,6,2368.8),
(13,'2024-03-04','North America','USA','Phone','Electronics','Mike',14,600,8,7728),
(14,'2024-03-08','Asia','Japan','Table','Furniture','Amit',11,320,5,3344),
(15,'2024-03-12','Europe','France','Laptop','Electronics','John',4,900,10,3240),
(16,'2024-03-15','Asia','India','Phone','Electronics','Priya',22,480,6,9926.4),
(17,'2024-03-18','North America','Canada','Chair','Furniture','Emma',13,140,4,1747.2),
(18,'2024-03-20','Europe','Germany','Laptop','Electronics','Sophia',7,850,5,5652.5),
(19,'2024-03-25','Asia','China','Desk','Furniture','Rahul',16,260,7,3868.8),
(20,'2024-03-28','North America','USA','Laptop','Electronics','Mike',9,780,5,6669),
(21,'2024-04-01','Asia','India','Laptop','Electronics','Rahul',30,800,5,22800),
(22,'2024-04-03','Europe','Germany','Phone','Electronics','John',28,600,4,16128),
(23,'2024-04-05','Asia','Japan','Chair','Furniture','Amit',35,200,6,6580),
(24,'2024-04-08','North America','USA','Desk','Furniture','Mike',18,350,5,5985),
(25,'2024-04-10','Asia','China','Phone','Electronics','Priya',40,550,8,20240),
(26,'2024-04-12','Europe','France','Laptop','Electronics','Sophia',20,950,7,17670),
(27,'2024-04-15','North America','Canada','Table','Furniture','Emma',22,400,5,8360),
(28,'2024-04-18','Asia','India','Phone','Electronics','Rahul',50,500,5,23750),
(29,'2024-04-20','Europe','Italy','Chair','Furniture','John',26,180,4,4492.8),
(30,'2024-04-25','Asia','Japan','Laptop','Electronics','Amit',15,1000,5,14250);

select * from sales;

-- Q1. Find total revenue by Region.

SELECT region, SUM(revenue) As Total_Revenue
FROM sales
GROUP BY region;

-- Q2. Count number of sales per Product.

SELECT product, COUNT(SaleID) As Total_Sales
FROM sales
GROUP BY product;

-- Q3. Find total quantity sold per Category.

SELECT Category, COUNT(Quantity) AS Total_Quantity
FROM sales
GROUP BY Category;

-- Q4. Find average unit price per Product.

SELECT  product, AVG(unitprice) AS AvgUnitPrice
FROM sales
GROUP BY product;

-- Q5. Find number of orders per SalesPerson.

SELECT Saleperson, COUNT(*) As Total_Orders
FROM sales
GROUP BY Saleperson;

-- Q6. Find maximum revenue per Country.

SELECT Country, MAX(revenue) AS max_revenue
FROM sales
GROUP BY Country;

-- Q7. Find minimum discount per Category.

SELECT Category, MIN(discount) AS min_discount
FROM sales
GROUP BY  Category;

-- Q8. Find total revenue per Product and Category.

SELECT product, Category, SUM(revenue) AS Tol_revenue
FROM sales
GROUP BY product, category;

-- Q9. Find Regions where total revenue is greater than 500000.

SELECT region, SUM(revenue) AS Total_Rev
FROM sales
GROUP BY region
HAVING SUM(revenue)>500000;

-- Q10. Find Products where total quantity sold is at least 100.

SELECT Product, SUM(quantity) AS Tot_Qty
FROM sales
GROUP BY product
HAVING SUM(quantity)>=100;

-- Q11. Find SalesPersons who made more than 8 sales.

SELECT Saleperson, COUNT(*) AS Tot_sales
FROM sales
GROUP BY Saleperson
HAVING COUNT(*)>8;

-- Q12. Find Categories where average discount is greater than 7.5%.

SELECT category, AVG(discount) AS avg_discount
FROM sales
GROUP BY category
HAVING AVG(discount) > 7.5 ;

-- Q13. Find Countries where maximum revenue is greater than 100000.

SELECT country, MAX(revenue) AS Max_revenue
FROM sales
GROUP BY country
HAVING MAX(revenue) > 100000;

-- Q14. Find Products sold in more than 3 Regions.

SELECT product, COUNT(DISTINCT region) AS More_reg
FROM sales
GROUP BY product
HAVING COUNT(DISTINCT region) >= 3;

-- Q15. Find total revenue by Region for orders after 2024-02-01.

SELECT region,SUM(revenue) AS rev_date
FROM sales
where orderdate > '2024-02-01'
GROUP BY region;

-- Q16. Find Products with total revenue greater than 200000 considering only sales 
-- with discount less than 7%.

SELECT product, SUM(revenue) AS tot_rev
FROM sales
WHERE discount < 7
GROUP BY product 
HAVING SUM(revenue) > 200000;

-- Q.17	Find SalesPersons who sold more than 50 items for Category = 'Electronics'.

SELECT saleperson, SUM(quantity) AS tot_qty
FROM Sales
WHERE category = "Electronics"
GROUP BY saleperson
HAVING SUM(quantity) > 50;


-- Q.18	Find Countries where average unit price is greater than 500 considering
-- Quantity >= 2.

	SELECT country, AVG(unitprice) as avg_unit_price
    FROM sales
    WHERE quantity >= 2
    GROUP BY country
    HAVING AVG(unitprice) > 500;


-- Q.19	Find top 3 Regions by total revenue for sales after 2024-02-01.

SELECT region, SUM(revenue) AS tot_revenue
FROM sales
WHERE orderdate > 2024-02-01
GROUP BY region
ORDER BY tot_revenue DESC
LIMIT 3;


-- Q.20	Find top 5 Products by total quantity sold for Category = 'Furniture'.

SELECT product, SUM(quantity) AS tot_qty
FROM sales
WHERE category = 'Furniture'
GROUP BY product
ORDER BY tot_qty DESC
LIMIT 5;


-- Q.21	Find top 3 SalesPersons by total revenue where Discount < 20%.

SELECT saleperson, SUM(revenue) AS tot_rev
FROM sales
WHERE discount < 20
GROUP BY saleperson
ORDER BY tot_rev DESC
LIMIT 3;


-- Q.22	Find bottom 2 Countries by total revenue for Region = 'Asia'.

SELECT country, SUM(revenue) AS tot_rev
FROM sales
WHERE region = 'Asia'
GROUP BY country
ORDER BY tot_rev ASC
LIMIT 2;


