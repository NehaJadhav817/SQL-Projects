CREATE DATABASE mixed_clauses;
use mixed_clauses;

CREATE TABLE Sales_Data (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Region VARCHAR(50),
    Country VARCHAR(50),
    Customer VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    SalesPerson VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Revenue DECIMAL(10,2)
);

SELECT * FROM Sales_Data;

INSERT INTO Sales_Data VALUES
(1,'2023-07-26','Europe','USA','Customer1','Tablet','Electronics','Neha',5,53405,0,267025),
(2,'2023-07-25','America','France','Customer2','Mobile','Furniture','Emma',7,32885,15,195665.75),
(3,'2023-10-07','Asia','UK','Customer3','Camera','Furniture','John',4,22843,5,86803.4),
(4,'2023-10-28','America','USA','Customer4','Mobile','Electronics','John',6,40291,0,241746),
(5,'2024-08-23','Europe','Germany','Customer5','Monitor','Furniture','John',8,47361,0,378888),
(6,'2023-06-05','Asia','India','Customer6','Desk','Electronics','Emma',2,36951,0,73902),
(7,'2024-06-12','Asia','Germany','Customer7','Mobile','Electronics','Amit',6,51471,20,247060.8),
(8,'2023-06-05','Asia','USA','Customer8','Chair','Electronics','Emma',10,53769,15,457036.5),
(9,'2023-05-25','Europe','USA','Customer9','Mobile','Electronics','Alex',9,50943,15,389713.95),
(10,'2024-08-18','Asia','India','Customer10','Tablet','Electronics','Amit',9,32751,15,250545.15),
(11,'2023-12-30','America','UK','Customer11','Camera','Furniture','Marie',3,56853,10,153503.1),
(12,'2023-09-23','Asia','Canada','Customer12','Mobile','Furniture','Marie',7,23890,10,150507),
(13,'2024-07-13','America','USA','Customer13','Mobile','Electronics','John',5,27234,5,129361.5),
(14,'2024-06-01','America','Japan','Customer14','Mobile','Electronics','Neha',2,5387,10,9696.6),
(15,'2024-05-25','America','UK','Customer15','Mobile','Electronics','John',6,3875,5,22087.5),
(16,'2023-12-13','America','France','Customer16','Mobile','Furniture','Alex',4,49048,5,186382.4),
(17,'2023-11-27','Europe','USA','Customer17','Tablet','Furniture','Neha',3,25543,10,68966.1),
(18,'2023-05-03','Europe','France','Customer18','Chair','Furniture','Emma',6,5232,20,25113.6),
(19,'2023-02-23','America','Japan','Customer19','Monitor','Furniture','Amit',10,56769,15,482536.5),
(20,'2024-07-10','Europe','UK','Customer20','Mobile','Furniture','Amit',7,69348,0,485436),
(21,'2023-06-03','Asia','Japan','Customer21','Mobile','Electronics','Amit',5,40788,15,173349),
(22,'2023-01-14','America','Canada','Customer22','Tablet','Electronics','Ken',2,55703,5,105835.7),
(23,'2023-11-01','America','Germany','Customer23','Chair','Furniture','Amit',6,12941,20,62116.8),
(24,'2023-10-04','Europe','India','Customer24','Camera','Electronics','Amit',1,12544,20,10035.2),
(25,'2023-08-16','Asia','USA','Customer25','Monitor','Furniture','Marie',6,26044,15,132824.4),
(26,'2024-03-04','America','France','Customer26','Tablet','Electronics','Amit',5,43657,5,207370.75),
(27,'2024-06-01','Europe','France','Customer27','Laptop','Furniture','Amit',4,64166,0,256664),
(28,'2023-03-17','America','Japan','Customer28','Camera','Furniture','Amit',5,63918,15,271651.5),
(29,'2023-05-21','Europe','UK','Customer29','Tablet','Furniture','John',6,61280,0,367680),
(30,'2024-04-12','Asia','India','Customer30','Tablet','Electronics','Neha',10,20437,20,163496),
(31,'2023-03-02','Europe','Japan','Customer31','Camera','Electronics','John',9,26129,15,199886.85),
(32,'2023-01-12','America','USA','Customer32','Monitor','Electronics','Amit',10,41005,20,328040),
(33,'2024-07-08','America','Canada','Customer33','Mobile','Electronics','Amit',9,57118,20,411249.6),
(34,'2023-11-01','Europe','USA','Customer34','Chair','Electronics','Neha',1,57717,20,46173.6),
(35,'2023-09-17','Europe','France','Customer35','Mobile','Electronics','Neha',6,52536,10,283694.4),
(36,'2023-07-04','Europe','Canada','Customer36','Mobile','Furniture','Neha',3,14588,15,37199.4),
(37,'2023-02-07','America','India','Customer37','Laptop','Furniture','Marie',4,66345,0,265380),
(38,'2023-10-26','America','USA','Customer38','Monitor','Electronics','Neha',2,30927,20,49483.2),
(39,'2024-03-03','Europe','India','Customer39','Desk','Electronics','John',3,65557,5,186837.45),
(40,'2024-03-21','Asia','UK','Customer40','Chair','Electronics','Emma',10,23237,10,209133),
(41,'2023-11-19','Europe','UK','Customer41','Tablet','Electronics','Ken',3,36500,15,93075),
(42,'2023-03-18','Asia','UK','Customer42','Mobile','Furniture','John',8,67920,5,516192),
(43,'2023-03-29','Europe','UK','Customer43','Camera','Electronics','Emma',9,50598,15,387074.7),
(44,'2023-04-10','Europe','Germany','Customer44','Mobile','Furniture','John',8,2194,15,14919.2),
(45,'2023-04-27','Europe','Canada','Customer45','Desk','Electronics','Ken',5,12660,5,60135),
(46,'2024-06-18','Asia','UK','Customer46','Mobile','Electronics','Alex',7,32772,10,206463.6),
(47,'2024-07-23','America','Canada','Customer47','Camera','Electronics','Neha',3,10431,20,25034.4),
(48,'2023-04-04','Europe','Canada','Customer48','Monitor','Electronics','Emma',4,31957,0,127828),
(49,'2023-07-01','America','UK','Customer49','Laptop','Furniture','Neha',6,19773,15,100842.3),
(50,'2023-03-15','Asia','France','Customer50','Desk','Electronics','Neha',8,9113,5,69258.8),
(51,'2023-02-06','America','UK','Customer51','Camera','Furniture','Alex',10,33566,0,335660),
(52,'2024-04-18','America','Japan','Customer52','Camera','Electronics','Alex',2,61878,5,117568.2),
(53,'2024-08-05','Europe','Japan','Customer53','Monitor','Furniture','Amit',1,66243,20,52994.4),
(54,'2023-09-10','America','Japan','Customer54','Monitor','Electronics','Marie',4,35946,0,143784),
(55,'2023-05-19','Asia','Japan','Customer55','Mobile','Electronics','Amit',5,32162,5,152769.5),
(56,'2023-08-01','America','UK','Customer56','Monitor','Furniture','Ken',6,25787,5,146985.9),
(57,'2024-06-21','Europe','Germany','Customer57','Desk','Furniture','John',4,59166,10,212997.6),
(58,'2023-03-03','Europe','Germany','Customer58','Chair','Electronics','Ken',8,12458,10,89697.6),
(59,'2023-06-21','America','USA','Customer59','Tablet','Furniture','Ken',8,57080,15,388144),
(60,'2023-09-15','America','UK','Customer60','Desk','Electronics','Ken',10,51540,15,438090),
(61,'2024-03-30','America','USA','Customer61','Laptop','Furniture','Emma',9,56183,15,429799.95),
(62,'2024-03-21','Europe','Japan','Customer62','Tablet','Furniture','Emma',5,68032,0,340160),
(63,'2024-03-02','Asia','Japan','Customer63','Monitor','Electronics','Marie',3,22878,15,58338.9),
(64,'2024-02-01','America','France','Customer64','Monitor','Furniture','Amit',6,10919,15,55686.9),
(65,'2023-05-14','America','Germany','Customer65','Tablet','Furniture','Amit',8,27290,15,185572),
(66,'2024-08-13','Asia','France','Customer66','Camera','Electronics','Amit',9,38563,10,312360.3),
(67,'2023-12-24','Europe','France','Customer67','Chair','Furniture','Amit',4,68039,0,272156),
(68,'2023-04-25','America','Japan','Customer68','Monitor','Furniture','Marie',1,61097,20,48877.6),
(69,'2023-07-07','Asia','France','Customer69','Laptop','Furniture','Marie',9,41679,5,356355.45),
(70,'2024-01-22','Europe','USA','Customer70','Camera','Furniture','Amit',8,25120,5,190912),
(71,'2024-07-13','Asia','Canada','Customer71','Tablet','Furniture','Ken',7,15793,15,93968.35),
(72,'2023-04-09','Europe','Canada','Customer72','Camera','Electronics','Amit',4,18057,0,72228),
(73,'2023-01-19','Europe','India','Customer73','Tablet','Furniture','Amit',3,16070,0,48210),
(74,'2023-03-11','Asia','Canada','Customer74','Monitor','Furniture','Amit',5,9039,20,36156),
(75,'2023-02-11','Europe','USA','Customer75','Monitor','Furniture','Alex',4,57318,10,206344.8),
(76,'2024-06-08','America','Japan','Customer76','Mobile','Furniture','Amit',3,37504,20,90009.6),
(77,'2024-07-10','Europe','UK','Customer77','Mobile','Furniture','Neha',9,47344,0,426096),
(78,'2023-02-04','Europe','Germany','Customer78','Mobile','Electronics','Alex',5,17973,15,76385.25),
(79,'2023-07-11','America','UK','Customer79','Camera','Electronics','Alex',5,26712,0,133560),
(80,'2023-07-25','Europe','Japan','Customer80','Desk','Electronics','Alex',8,14220,20,91008),
(81,'2023-04-12','Asia','USA','Customer81','Chair','Electronics','Amit',8,44412,15,302001.6),
(82,'2023-08-21','Asia','UK','Customer82','Chair','Electronics','Emma',9,55964,10,453308.4),
(83,'2024-04-12','Europe','France','Customer83','Laptop','Furniture','John',9,32396,5,276985.8),
(84,'2023-09-17','America','Japan','Customer84','Chair','Electronics','Neha',3,57102,0,171306),
(85,'2023-01-08','Asia','Germany','Customer85','Mobile','Electronics','Alex',7,43271,10,272607.3),
(86,'2024-05-10','Europe','Canada','Customer86','Monitor','Furniture','John',4,20268,10,72964.8),
(87,'2023-07-03','Asia','Canada','Customer87','Camera','Electronics','Alex',9,12371,5,105772.05),
(88,'2024-01-16','Asia','Germany','Customer88','Laptop','Furniture','Marie',6,9240,15,47124),
(89,'2023-05-16','Europe','India','Customer89','Mobile','Furniture','Emma',8,37231,5,282955.6),
(90,'2024-04-05','Asia','Japan','Customer90','Tablet','Furniture','Marie',2,28503,10,51305.4),
(91,'2024-06-24','Asia','Japan','Customer91','Laptop','Electronics','Emma',9,18001,5,153908.55),
(92,'2024-08-23','Asia','Germany','Customer92','Mobile','Furniture','Marie',10,62346,5,592287),
(93,'2024-01-26','Asia','Japan','Customer93','Monitor','Furniture','Marie',9,10535,10,85333.5),
(94,'2023-08-01','America','India','Customer94','Chair','Furniture','Amit',1,59168,15,50292.8),
(95,'2023-04-02','Europe','Canada','Customer95','Camera','Electronics','John',8,27112,20,173516.8),
(96,'2024-08-15','Europe','Japan','Customer96','Camera','Furniture','Alex',5,4895,20,19580),
(97,'2023-09-13','Europe','USA','Customer97','Camera','Electronics','Amit',1,4692,5,4457.4),
(98,'2023-05-16','America','Germany','Customer98','Desk','Electronics','Emma',3,63704,0,191112),
(99,'2023-07-03','America','India','Customer99','Camera','Electronics','Neha',8,12377,15,84163.6),
(100,'2023-12-18','Asia','France','Customer100','Desk','Electronics','Amit',4,52003,0,208012);

SELECT * FROM Sales_Data;


-- Q1. Find top 5 products by total revenue in the last 1 year where average discount is 
--     less than 10%.

SELECT product, SUM(revenue) AS tot_rev, AVG(discount) AS avg_disc
FROM Sales_Data
WHERE OrderDate >= (SELECT MAX(OrderDate) - INTERVAL 1 YEAR FROM Sales_Data)
GROUP BY product 
HAVING avg_disc < 20
ORDER BY tot_rev DESC
LIMIT 5;


-- Q2.	List salespersons whose total sales quantity is above company average.

SELECT salesperson , SUM(quantity) AS tot_qty
FROM sales_data
GROUP BY salesperson
HAVING SUM(Quantity) > (SELECT AVG(total_qty) FROM ( SELECT SUM(quantity) As total_qty
FROM Sales_Data
GROUP BY salesperson
)As temp
);


-- Q3.	Find regions where total revenue is greater than overall average revenue.

SELECT region, SUM(revenue) AS tot_rev
FROM sales_Data
GROUP BY region
HAVING SUM(revenue) > 
(SELECT AVG(revenue) FROM Sales_Data);


-- Q4.	Get top 3 customers by total spending for Electronics category only.

SELECT customer, category, SUM(revenue) AS tot_rev
FROM Sales_Data
WHERE category = "Electronics"
GROUP BY customer
ORDER BY tot_rev DESC
LIMIT 3;


-- Q5.	Find countries where number of orders is more than 10 and average unit price > 5000.

SELECT country, COUNT(orderid) AS tot_order
FROM Sales_Data
GROUP BY country
HAVING COUNT(orderid) > 10 AND AVG(unitprice) >5000;


-- Q6.	Find products sold in more than 2 regions with total quantity > 50.

SELECT product, SUM(Quantity) AS tot_qty , COUNT(DISTINCT region) as tot_reg
FROM Sales_Data
GROUP BY product 
HAVING SUM(quantity) > 50 AND COUNT(DISTINCT region) > 2;


-- Q7.	List bottom 3 products by total revenue excluding Furniture category.

SELECT product, SUM(revenue) AS Tot_revenue
FROM Sales_Data
WHERE category != 'Furniture'
GROUP BY product
ORDER BY Tot_revenue ASC
LIMIT 3;


-- Q8.	Find month-wise total revenue for 2024 where revenue > 100000.

SELECT month(orderdate) AS monthno, SUM(revenue) AS tot_rev
FROM sales_data
WHERE year(orderdate) = 2024
GROUP BY month(orderdate)
HAVING SUM(revenue) > 100000
ORDER BY tot_rev ASC;


-- Q9.	Find salespersons who sold both Electronics and Furniture.
-- WHERE,GROUPBY,DISTINCT COUNT, HAVING

SELECT salesperson
FROM sales_data
WHERE category IN ('Electronics', 'Furniture')
GROUP BY salesperson
HAVING COUNT(DISTINCT category) = 2;


-- Q10.	Find region-wise revenue contribution percentage.

SELECT region, SUM(revenue) AS tot_rev,
			   (SUM(revenue)* 100  / (SELECT SUM(revenue) FROM sales_data)) AS percentage
FROM sales_data
GROUP BY region;


-- Q11.	Get top 5 orders with highest revenue after discount.

SELECT orderid,(Revenue - (Revenue * Discount / 100)) AS High_rev
FROM sales_data
ORDER BY High_rev DESC
LIMIT 5;

-- Q12.	Find customers with at least 3 orders and total revenue > 50000.

SELECT customer,
		SUM(revenue) AS tot_rev,
        COUNT(*)
FROM sales_data
GROUP BY customer
HAVING SUM(revenue) > 50000 AND COUNT(*) >= 3;


-- Q13.	Find categories where max unit price > average unit price.

SELECT category, 
		MAX(unitprice) AS max_unit, 
        AVG(unitprice) AS avg_unit
FROM sales_data
GROUP BY category
HAVING MAX(unitprice) > AVG(unitprice);


-- Q14.	List salespersons whose revenue is greater than their region’s average.

SELECT salesperson, region, revenue
FROM sales_data s
WHERE revenue > 
		(SELECT AVG(revenue)
         FROM sales_data
         WHERE region = s.region);


-- Q15.	Find countries where total discount amount exceeds 20000.

SELECT country,  SUM(revenue * discount / 100) AS tot_disc
FROM Sales_Data
GROUP BY country
HAVING SUM(revenue * discount / 100) > 20000;

-- Q16.	Find products with increasing sales trend month over month.

SELECT product
FROM (
      SELECT product,
             MONTH(orderdate) AS mn,
             SUM(revenue) AS month_sales,
             LAG(SUM(revenue)) OVER
             (PARTITION BY product ORDER BY MONTH(orderdate)) AS prev_sales
      FROM sales_data
      GROUP BY product, MONTH(orderdate)
     ) t
WHERE month_sales > prev_sales;


-- Q17.	Find region and category combinations with revenue > 150000.

SELECT region, category, SUM(revenue) AS tot_revenue
FROM sales_data
GROUP BY region, category
HAVING SUM(revenue) > 150000;


-- Q18.	Get top 3 months by total revenue.

SELECT month(orderdate) mn, SUM(revenue) AS Tot_revenue
FROM sales_data
GROUP BY month(orderdate)
ORDER BY Tot_revenue DESC
LIMIT 3;


-- Q19.	Find customers who purchased more than 5 different products.

SELECT customer, 
			COUNT(DISTINCT product) AS unique_product
FROM sales_data
GROUP BY customer
HAVING COUNT(DISTINCT product) = 5;
    

-- Q20.	Find products where max quantity sold in a single order > 8.

SELECT product, MAX(quantity) AS max_qty
FROM Sales_Data
GROUP BY product
HAVING MAX(quantity) > 8;


-- Q21.	Find salespersons with no sales in Furniture category.

SELECT salesperson
FROM Sales_Data
GROUP BY salesperson
HAVING COUNT(CASE WHEN category = 'Furniture' THEN 1 END) = 0;


-- Q22.	Find top 5 customers by average order value.

SELECT customer,
       AVG(revenue) AS avg_order_value
FROM sales_data
GROUP BY customer
ORDER BY avg_order_value DESC
LIMIT 5;


-- Q23.	Find regions where Electronics revenue > Furniture revenue.

SELECT region
FROM sales_data
GROUP BY region
HAVING
    SUM(CASE WHEN category = 'Electronics' THEN revenue ELSE 0 END)
    >
    SUM(CASE WHEN category = 'Furniture' THEN revenue ELSE 0 END);


-- Q24.	Find countries contributing more than 20% of total revenue.

SELECT country,
       SUM(revenue) AS country_revenue,
       (SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM sales_data)) AS percentage
FROM sales_data
GROUP BY country
HAVING (SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM sales_data)) > 20;


-- Q25.	Find products with average unit price higher than category average.

SELECT product, category,
       AVG(unitprice) AS product_avg
FROM sales_data p
GROUP BY product, category
HAVING AVG(unitprice) >
      (SELECT AVG(unitprice)
       FROM sales_data c
       WHERE c.category = p.category);


-- Q26.	Find customers whose last order value is higher than their first order.

SELECT customer
FROM sales_data c
GROUP BY customer
HAVING
    MAX(CASE WHEN orderdate = (SELECT MAX(orderdate)
                                FROM sales_data
                                WHERE customer = c.customer)
             THEN revenue END)
    >
    MAX(CASE WHEN orderdate = (SELECT MIN(orderdate)
                                FROM sales_data
                                WHERE customer = c.customer)
             THEN revenue END);


-- Q27.	Find salespersons whose total revenue rank is in top 5.

SELECT salesperson
FROM (
    SELECT salesperson,
           SUM(revenue) AS total_revenue,
           RANK() OVER (ORDER BY SUM(revenue) DESC) AS rnk
    FROM sales_data
    GROUP BY salesperson
) t
WHERE rnk <= 5;


-- Q28.	Find products with total revenue between 50000 and 150000.

SELECT product, SUM(revenue) AS Tot_rev
FROM Sales_Data
GROUP BY product
HAVING SUM(revenue) BETWEEN 50000 AND 150000;

-- Q29.	Find regions where minimum order revenue > 5000.

SELECT region 
FROM Sales_Data
GROUP BY region
HAVING MIN(revenue) > 5000;

-- Q30.	Find countries where order count is below regional average.

SELECT country
FROM sales_data c
GROUP BY country, region
HAVING COUNT(orderid) <
      (SELECT AVG(order_count)
       FROM (
            SELECT region, country, COUNT(orderid) AS order_count
            FROM sales_data
            GROUP BY region, country
       ) x
       WHERE x.region = c.region);