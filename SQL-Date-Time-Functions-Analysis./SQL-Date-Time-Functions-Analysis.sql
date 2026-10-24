CREATE DATABASE FUNCTIONS;
USE FUNCTIONS;

DROP TABLE ORDER_DATA;

CREATE TABLE order_data (
    Order_ID VARCHAR(20),
    Order_Date VARCHAR(20),
    Order_Time TIME,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Region VARCHAR(50),
    Order_Status VARCHAR(30),
    Shipment_Date VARCHAR(20),
    Delivery_Date VARCHAR(20),
    Total_Amount DECIMAL(10,2)
);
SELECT * FROM ORDER_DATA;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Book1.csv'
INTO TABLE ORDER_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM ORDER_DATA;

SET SQL_SAFE_UPDATES = 0;

UPDATE order_data
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y')
WHERE Order_Date LIKE '%/%';

UPDATE order_data
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d')
WHERE Order_Date LIKE '____-__-__';

ALTER TABLE order_data
MODIFY Order_Date DATE;

UPDATE order_data
SET Shipment_Date = STR_TO_DATE(Shipment_Date, '%m/%d/%Y')
WHERE Shipment_Date LIKE '%/%';

UPDATE order_data
SET Shipment_Date = STR_TO_DATE(Shipment_Date, '%Y-%m-%d')
WHERE Shipment_Date LIKE '____-__-__';

UPDATE order_data
SET Delivery_Date = STR_TO_DATE(Delivery_Date, '%m/%d/%Y')
WHERE Delivery_Date LIKE '%/%';

UPDATE order_data
SET Delivery_Date = STR_TO_DATE(Delivery_Date, '%Y-%m-%d')
WHERE Delivery_Date LIKE '____-__-__';

ALTER TABLE order_data
MODIFY Order_Date DATE,
MODIFY Shipment_Date DATE,
MODIFY Delivery_Date DATE;

DROP TABLE attendance_data;

CREATE TABLE attendance_data (
    Employee_ID VARCHAR(20),
    Employee_Name VARCHAR(100),
    Department VARCHAR(50),
    Login_Date VARCHAR(20),
    Login_Time TIME,
    Logout_Time TIME
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/attendence_data.csv'
INTO TABLE attendance_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM attendance_data;

UPDATE attendance_data
SET Login_Date = STR_TO_DATE(Login_Date, '%m/%d/%Y')
WHERE Login_Date LIKE '%/%';

UPDATE attendance_data
SET Login_Date = STR_TO_DATE(Login_Date, '%Y-%m-%d')
WHERE Login_Date LIKE '____-__-__';

ALTER TABLE attendance_data
MODIFY Login_Date DATE;

-- Q1. Extract year from Order_Date.
SELECT  YEAR(Order_Date) AS YEAR
FROM ORDER_DATA;

-- Q2. Extract month name from Order_Date.
SELECT MONTHNAME(ORDER_DATE) AS MONTH_NAME
FROM ORDER_DATA;

-- Q3. Extract quarter from Order_Date.
SELECT QUARTER(order_date) AS quarter_date
FROM order_data
ORDER BY Order_Date;

-- Q4. Find total orders placed in each year.
SELECT 
	year(order_date) AS Order_year,
    COUNT(*) AS Total_orders
FROM order_data
GROUP BY order_date
ORDER BY Order_year;
	

-- Q5. Find total orders placed in each month.
SELECT 
	MONTHNAME(order_date) AS order_month,
    COUNT(*) AS Total_orders
FROM order_data
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);


-- Q6. Calculate number of days between Order_Date and Delivery_Date.
SELECT 
	Order_Id,
    Order_date,
    delivery_date,
    datediff(delivery_date,order_date) AS order_del_dif
FROM order_data;


-- Q7. Find average delivery time in days.
SELECT 
    AVG(DATEDIFF(Delivery_Date, Order_Date)) AS Avg_Delivery_Time
FROM order_data;


-- Q8. Identify orders delivered in less than 3 days.
SELECT 
	Order_Id,
    Order_date,
    delivery_date,
	DATEDIFF(Delivery_Date, Order_Date) AS Tot_days
FROM order_data
WHERE DATEDIFF(Delivery_Date, Order_Date)  < 3;


-- Q9. Find orders placed on weekends.
SELECT 
    Order_ID,
    Order_Date
FROM order_data
WHERE DAYNAME(Order_Date) IN ('Saturday', 'Sunday');


-- Q10. Find orders placed in the last 30 days.
SELECT *
FROM order_data
WHERE datediff(curdate(), delivery_date) <= 30;


-- Q11. Calculate total sales for current year.
SELECT SUM(Total_amount) As Tot_sales
FROM order_data 
WHERE year(order_date) = year(curdate());


-- Q12. Calculate total sales for previous year.
SELECT SUM(Total_Amount) AS Tot_Sales
FROM order_data
WHERE YEAR(Order_Date) = YEAR(CURDATE()) - 1;


-- Q13. Find first order date per customer.
SELECT Customer_name, min(order_date) AS first_order_date
FROM order_data
GROUP BY customer_name;


-- Q14. Find latest order date per customer.
SELECT Customer_name, max(order_date) AS latest_first_order_date
FROM order_data
GROUP BY customer_name;


-- Q15. Extract hour from Order_Time.
SELECT order_time,hour(order_time) As order_hour
FROM order_data;


-- Q16. Count how many orders were placed in each hour of the day.
SELECT hour(order_time) AS order_hour,
	   COUNT(*) AS Tot_orders
FROM order_data
GROUP BY hour(order_time)
ORDER BY order_hour;

-- Q17. Find peak order hour.
SELECT HOUR(Order_Time) AS Order_Hour,
       COUNT(*) AS Total_Orders
FROM order_data
GROUP BY HOUR(Order_Time)
ORDER BY Total_Orders DESC
LIMIT 1;


-- Q18. Calculate employee working hours using Login_Time and Logout_Time.
SELECT employee_id,
	   TIMESTAMPDIFF(HOUR, login_time, logout_time) AS working_hours
FROM attendance_data;


-- Q19. Find employees who worked more than 9 hours.
SELECT employee_id,
	   TIMESTAMPDIFF(HOUR, login_time, logout_time) AS working_hours
FROM attendance_data
WHERE TIMESTAMPDIFF(HOUR, login_time, logout_time) > 9;


-- Q20. Find monthly attendance count per department.
SELECT department,
		MONTH(login_Date) AS month_number,
        COUNT(*) AS attendance_count
FROM attendance_data
GROUP BY department, month(login_date)
ORDER BY department, month_number;

-- Q21. Calculate difference between current date and Order_Date.
SELECT order_date,
		datediff(curdate(),order_date) As date_difference
FROM ORDER_DATA;

-- Q22. Find orders shipped within 2 days of Order_Date.
SELECT order_date, datediff(shipment_date, order_date) As shipped 
FROM ORDER_DATA
WHERE datediff(shipment_date, order_date) < 2;

-- Q23. Identify cancelled orders in current month.
SELECT order_id, order_status, order_date
FROM order_data
WHERE order_status = 'cancelled'
		AND MONTH(ORDER_DATE) = MONTH(CURDATE())
        AND YEAR(ORDER_DATE) = YEAR(CURDATE());
 
-- Q24. Find customers who ordered in consecutive months.
SELECT DISTINCT a.Customer_ID
FROM order_data a
JOIN order_data b
    ON a.Customer_ID = b.Customer_ID
WHERE TIMESTAMPDIFF(MONTH, a.Order_Date, b.Order_Date) = 1;


-- Q25. Calculate week number from Order_Date.
SELECT week(order_date) AS week_number
FROM order_data;


-- Q26. Group sales by year and quarter.
SELECT year(order_date) AS year,
	   quarter(order_date) AS quarter,
       SUM(total_amount) AS total_sales
FROM order_data
GROUP BY year(order_date), quarter(order_date);

-- Q27. Find orders placed in the same month last year.
SELECT Order_ID, Order_Date, Customer_ID
FROM order_data
WHERE MONTH(Order_Date) = MONTH(CURDATE())
  AND YEAR(Order_Date) = YEAR(CURDATE()) - 1;

-- Q28. Calculate cumulative monthly sales.
SELECT 
    t1.year,
    t1.month,
    t1.monthly_sales,

    (
        SELECT SUM(t2.monthly_sales)
        FROM (
            SELECT 
                YEAR(Order_Date) AS year,
                MONTH(Order_Date) AS month,
                SUM(Total_Amount) AS monthly_sales
            FROM order_data
            GROUP BY YEAR(Order_Date), MONTH(Order_Date)
        ) t2

        WHERE t2.year < t1.year
           OR (t2.year = t1.year AND t2.month <= t1.month)

    ) AS cumulative_sales

FROM (
    SELECT 
		YEAR(Order_Date) AS year,
        MONTH(Order_Date) AS month,
        SUM(Total_Amount) AS monthly_sales
    FROM order_data
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
) t1;

-- Q29. Find average login time per department.
SELECT department, avg(login_time) AS Avg_time
FROM attendance_data
GROUP BY department;

-- Q30. Identify late logins (after 10:00 AM).
SELECT * 
FROM attendance_data
WHERE login_time > '10:00:00';

-- Q31. Find total orders per weekday.
SELECT DAYNAME(Order_Date) AS weekday, COUNT(Order_ID) AS total_orders
FROM order_data
WHERE DAYOFWEEK(Order_Date) BETWEEN 2 AND 6
GROUP BY DAYNAME(Order_Date);

-- Q32. Find difference between Shipment_Date and Delivery_Date.
SELECT order_id,
		datediff(delivery_date, shipment_date) AS date_difference
FROM order_data;

-- Q33. Calculate yearly growth in total sales.
SELECT
    YEAR(Order_Date) AS Year,
    SUM(Total_Amount) AS TotalSales,
    LAG(SUM(Total_Amount)) OVER (ORDER BY YEAR(Order_Date)) AS PreviousYearSales,
    ROUND(
        ((SUM(Total_Amount) - LAG(SUM(Total_Amount)) OVER (ORDER BY YEAR(Order_Date)))
        / LAG(SUM(Total_Amount)) OVER (ORDER BY YEAR(Order_Date))) * 100,
        2
    ) AS GrowthPercent
FROM Order_data
GROUP BY YEAR(Order_Date);


-- Q34. Find orders placed in financial year (Apr-Mar).
SELECT
    Order_ID,
    Order_Date,
    CASE
        WHEN MONTH(Order_Date) >= 4
        THEN CONCAT(YEAR(Order_Date), '-', YEAR(Order_Date) + 1)
        ELSE CONCAT(YEAR(Order_Date) - 1, '-', YEAR(Order_Date))
    END AS Financial_Year
FROM Order_data;


-- Q35. Identify employees with consecutive attendance days.
SELECT DISTINCT Employee_ID
FROM (SELECT Employee_ID,
        Attendance_Date,
        LAG(Attendance_Date) OVER (
            PARTITION BY Employee_ID
            ORDER BY Attendance_Date
        ) AS Previous_Date
    FROM Attendance_data
) t
WHERE DATEDIFF(Attendance_Date, Previous_Date) = 1;
