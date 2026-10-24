use windfun;

select * from samplefile;

select * from sales_dataa;

select year(order_date_new)
from sales_dataa;

-- Q1. Rank salespeople based on Total_Amount in each Region using RANK().
SELECT Salesperson, Region, Total_Amount,
RANK() OVER ( PARTITION BY Region ORDER BY Total_Amount DESC) AS rank_sales_per
FROM Sales_dataa;


-- Q2. Find the top 3 highest sales in each Region using DENSE_RANK().
SELECT *
FROM ( SELECT Total_Amount, Region, DENSE_RANK() OVER 
	( PARTITION BY Region ORDER BY  Total_Amount DESC) AS highest_sales FROM Sales_Dataa) AS  Ranked_data
WHERE Highest_sales <= 3;


-- Q3. Assign row numbers to each order per Customer based on Order_Date using ROW_NUMBER().
SELECT Customer_Name, Order_date,
ROW_NUMBER () OVER (PARTITION BY Customer_Name ORDER BY Order_Date_New) AS row_num
FROM Sales_Dataa;


-- Q4. Calculate running total of sales per Salesperson ordered by Order_Date.
SELECT Total_Amount, Salesperson, Order_date_new,
SUM(Total_Amount) OVER (PARTITION BY salesperson ORDER BY order_date_new) AS running_total
FROM sales_dataa;
       

-- Q5. Calculate cumulative sales per Region.
SELECT Region, Order_Date, Total_Amount,
SUM(Total_Amount) OVER (PARTITION BY Region ORDER BY Order_Date) AS cumulative_sales
FROM sales_dataa;


-- Q6. Find previous order amount per Customer using LAG().
SELECT customer_id, order_date_new, total_amount,
LAG(total_amount, 1) OVER(PARTITION BY customer_id ORDER BY order_date_new) AS previous_amount
FROM sales_dataa;


-- Q7. Find next order amount per Customer using LEAD().
SELECT customer_id, order_date_new, total_amount,
LEAD(total_amount) OVER( PARTITION BY customer_id ORDER BY order_date_new ) AS next_amount
FROM sales_dataa;


-- Q8. Calculate difference between current and previous order amount using LAG().
SELECT customer_id, order_date_new, total_amount,
Total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date_new) AS difference
FROM sales_dataa;


-- Q9. Find first order amount per Customer using FIRST_VALUE().
SELECT customer_id, order_date_new, total_amount,
FIRST_VALUE(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date_new) AS first_values
FROM sales_dataa;


-- Q10. Find latest order amount per Customer using LAST_VALUE().
SELECT customer_id, order_date_new, total_amount,
LAST_VALUE(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date_new
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lastest_orders
FROM sales_dataa;


-- Q11. Calculate average sales per Region using AVG() OVER().
SELECT region, total_amount,
AVG(total_amount) OVER (PARTITION BY region) AS avg_sales
FROM sales_dataa;


-- Q12. Calculate moving average of last 3 sales per Salesperson.
SELECT salesperson, order_date_new, total_amount,
AVG(total_amount) OVER (PARTITION BY salesperson ORDER BY order_date_new
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM sales_dataa;


-- Q13. Divide sales into 4 quartiles using NTILE(4).
SELECT Total_Amount,
NTILE(4) OVER (ORDER BY Total_Amount DESC) quarter
FROM sales_dataa;


-- Q14. Find percentage contribution of each order to total Region sales.
SELECT Order_ID, Total_Amount,
(Total_Amount * 100.0 / SUM(Total_Amount) OVER ()) AS percentage
FROM Sales_Dataa;


-- Q15. Identify highest sale per Salesperson using MAX() OVER().
SELECT Salesperson, order_date_new, Total_Amount,
MAX(Total_Amount) OVER (PARTITION BY Salesperson) AS Max_Amount
FROM Sales_Dataa;


-- Q16. Count total orders per Customer using COUNT() OVER().
SELECT customer_id, 
COUNT(*) OVER (PARTITION BY Customer_Id) AS Total_Orders
FROM Sales_Dataa;


-- Q17. Find monthly total sales using window functions.
SELECT MONTH(Order_Date_New),
SUM(Total_Amount) OVER (PARTITION BY MONTH(order_date_new)) AS monthly_sales
FROM Sales_Dataa;


-- Q18. Compare each order with Region average and mark Above/Below average.
SELECT Region, Total_Amount,
AVG(Total_Amount) OVER (PARTITION BY Region) AS avg_region,
CASE
	WHEN Total_Amount > AVG(Total_Amount) OVER (PARTITION BY region) THEN 'Above Avg'
    ELSE 'Below Avg'
END AS Comparison
FROM Sales_Dataa;


SELECT Region, Total_Amount,
AVG(Total_Amount) OVER (PARTITION BY Region) AS avg_region,
CASE 
    WHEN Total_Amount > AVG(Total_Amount) OVER (PARTITION BY Region) THEN 'Above Avg'
    ELSE 'Below Avg'
END AS comparison
FROM Sales_Data;


-- Q19. Find second highest sale per Region.
SELECT *
FROM(SELECT Region, Total_Amount,
DENSE_RANK() OVER (PARTITION BY Region ORDER BY Total_Amount DESC) RNK
FROM Sales_Dataa)T
WHERE RNK = 2;


-- Q20. Identify customers whose latest order is greater than their average order.
SELECT Customer_Id
FROM(
	SELECT Customer_Id, Total_Amount, LAG(Total_Amount)
		OVER (PARTITION BY Customer_Id ORDER BY Order_Date_New) AS Pre_amt,
        ROW_NUMBER() OVER (PARTITION BY Customer_Id ORDER BY Order_Date_New DESC) AS rn
	FROM Sales_Dataa
    ) AS t
WHERE rn = 1 AND Total_Amount > pre_amt;